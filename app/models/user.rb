class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

 validate :email_domain

  def email_domain
    domain = email.split("@").last
    if !email.blank?
      errors.add(:email, "domain must be: @digital.cabinet-office.gov.uk") if domain != "digital.cabinet-office.gov.uk"
    end
  end
end
