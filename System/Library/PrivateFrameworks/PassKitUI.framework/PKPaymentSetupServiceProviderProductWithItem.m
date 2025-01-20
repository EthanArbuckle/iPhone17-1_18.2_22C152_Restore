@interface PKPaymentSetupServiceProviderProductWithItem
- (PKDigitalIssuanceServiceProviderItem)item;
- (PKDigitalIssuanceServiceProviderProduct)serviceProviderProduct;
- (PKPaymentSetupServiceProviderProductWithItem)init;
- (PKPaymentSetupServiceProviderProductWithItem)initWithServiceProviderProduct:(id)a3 item:(id)a4;
@end

@implementation PKPaymentSetupServiceProviderProductWithItem

- (PKPaymentSetupServiceProviderProductWithItem)init
{
  return 0;
}

- (PKPaymentSetupServiceProviderProductWithItem)initWithServiceProviderProduct:(id)a3 item:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPaymentSetupServiceProviderProductWithItem;
  v9 = [(PKPaymentSetupServiceProviderProductWithItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceProviderProduct, a3);
    objc_storeStrong((id *)&v10->_item, a4);
  }

  return v10;
}

- (PKDigitalIssuanceServiceProviderProduct)serviceProviderProduct
{
  return self->_serviceProviderProduct;
}

- (PKDigitalIssuanceServiceProviderItem)item
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);

  objc_storeStrong((id *)&self->_serviceProviderProduct, 0);
}

@end