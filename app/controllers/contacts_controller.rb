class ContactsController < ApplicationController
  def index
    render json: [Contact.find_by(user_id: params[:user_id]),
    User.find_by(id: params[:user_id]).shared_contacts]
  end

  def show
    contact = Contact.find_by(id: params[:id])
    render json: contact
  end

  def create
    contact = Contact.new(params[:contact].permit(:name, :email, :user_id))
    if contact.save
      render json: contact
    else
      render(
      json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def update
    contact = Contact.find_by(id: params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render(
      json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact = Contact.find_by(id: params[:id])
    contact.destroy!
    render json: contact
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end

end
