require 'rails_helper'
feature 'Admin inactivate coupon' do 
  scenario 'sucessfully' do
    promotion =  Promotion.create!(name: 'Natal', description: 'Promoção de Natal',
                                     code: 'NATAL10', discount_rate: 10,
                                     coupon_quantity: 1, expiration_date: '22/12/2033')
    coupon = Coupon.create!(code: 'ABC0001', promotion: promotion)

    visit root_path
    click_on 'Promoções'
    click_on promotion.name
    click_on 'Inativar'

    expect(page).to have_content('ABC0001 (Inativo)')
    
  end
end