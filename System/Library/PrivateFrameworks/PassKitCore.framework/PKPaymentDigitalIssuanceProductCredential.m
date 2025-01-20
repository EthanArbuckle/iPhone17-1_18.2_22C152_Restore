@interface PKPaymentDigitalIssuanceProductCredential
- (NSString)currency;
- (NSString)productIdentifier;
- (PKCurrencyAmount)balance;
- (PKCurrencyAmount)price;
- (PKDigitalIssuanceServiceProviderItem)serviceProviderItem;
- (PKDigitalIssuanceServiceProviderProduct)serviceProviderProduct;
- (PKPaymentDigitalIssuanceProductCredential)initWithPaymentSetupProduct:(id)a3 purchase:(id)a4 balance:(id)a5;
- (PKPaymentDigitalIssuanceProductCredential)initWithPaymentSetupProduct:(id)a3 purchase:(id)a4 balance:(id)a5 serviceProviderProduct:(id)a6 item:(id)a7 currency:(id)a8;
- (PKPaymentDigitalIssuanceProductCredential)initWithPaymentSetupProduct:(id)a3 purchase:(id)a4 serviceProviderProduct:(id)a5 item:(id)a6 currency:(id)a7;
- (PKPaymentSetupProduct)product;
- (PKServiceProviderPurchase)purchase;
- (id)metadata;
- (id)setupProductIdentifier;
- (void)setBalance:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setPrice:(id)a3;
- (void)setProductIdentifier:(id)a3;
- (void)setPurchase:(id)a3;
- (void)setServiceProviderItem:(id)a3;
- (void)setServiceProviderProduct:(id)a3;
@end

@implementation PKPaymentDigitalIssuanceProductCredential

- (PKPaymentDigitalIssuanceProductCredential)initWithPaymentSetupProduct:(id)a3 purchase:(id)a4 balance:(id)a5
{
  return [(PKPaymentDigitalIssuanceProductCredential *)self initWithPaymentSetupProduct:a3 purchase:a4 balance:a5 serviceProviderProduct:0 item:0 currency:0];
}

- (PKPaymentDigitalIssuanceProductCredential)initWithPaymentSetupProduct:(id)a3 purchase:(id)a4 serviceProviderProduct:(id)a5 item:(id)a6 currency:(id)a7
{
  return [(PKPaymentDigitalIssuanceProductCredential *)self initWithPaymentSetupProduct:a3 purchase:a4 balance:0 serviceProviderProduct:a5 item:a6 currency:a7];
}

- (PKPaymentDigitalIssuanceProductCredential)initWithPaymentSetupProduct:(id)a3 purchase:(id)a4 balance:(id)a5 serviceProviderProduct:(id)a6 item:(id)a7 currency:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v21 = [(PKPaymentCredential *)self init];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_product, a3);
    v23 = [v15 configuration];
    v24 = [v23 productIdentifier];
    [(PKPaymentDigitalIssuanceProductCredential *)v22 setProductIdentifier:v24];

    [(PKPaymentDigitalIssuanceProductCredential *)v22 setPurchase:v16];
    [(PKPaymentDigitalIssuanceProductCredential *)v22 setBalance:v17];
    [(PKPaymentDigitalIssuanceProductCredential *)v22 setServiceProviderProduct:v18];
    [(PKPaymentDigitalIssuanceProductCredential *)v22 setServiceProviderItem:v19];
    [(PKPaymentDigitalIssuanceProductCredential *)v22 setCurrency:v20];
    if (v19)
    {
      v25 = [PKCurrencyAmount alloc];
      v26 = [v19 amount];
      v27 = [(PKCurrencyAmount *)v25 initWithAmount:v26 currency:v20 exponent:0];

      [(PKPaymentDigitalIssuanceProductCredential *)v22 setPrice:v27];
    }
  }

  return v22;
}

- (id)metadata
{
  v19[4] = *MEMORY[0x1E4F143B8];
  balance = self->_balance;
  if (balance)
  {
    v4 = [(PKCurrencyAmount *)balance currency];
    v5 = [(PKCurrencyAmount *)self->_balance amount];
    v6 = [v5 stringValue];

    v7 = PKLocalizedPaymentString(&cfstr_SetupPurchaseB.isa, 0);
  }
  else
  {
    v4 = self->_currency;
    v8 = [(PKCurrencyAmount *)self->_price amount];
    v6 = [v8 stringValue];

    v9 = NSString;
    v10 = [(PKDigitalIssuanceServiceProviderItem *)self->_serviceProviderItem localizedDisplayName];
    v7 = [v9 stringWithFormat:@"%@", v10];
  }
  if (v6) {
    BOOL v11 = v4 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 || v7 == 0)
  {
    id v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v18[0] = @"valueType";
    v18[1] = @"value";
    v19[0] = @"currency";
    v19[1] = v6;
    v18[2] = @"currencyCode";
    v18[3] = @"localizedDisplayName";
    v19[2] = v4;
    v19[3] = v7;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:4];
    v14 = +[PKPaymentCredentialMetadata paymentCredentialMetadataWithConfiguration:v13];
    id v17 = v14;
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
  }
  return v15;
}

- (id)setupProductIdentifier
{
  return self->_productIdentifier;
}

- (PKPaymentSetupProduct)product
{
  return self->_product;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (void)setProductIdentifier:(id)a3
{
}

- (PKServiceProviderPurchase)purchase
{
  return self->_purchase;
}

- (void)setPurchase:(id)a3
{
}

- (PKCurrencyAmount)balance
{
  return self->_balance;
}

- (void)setBalance:(id)a3
{
}

- (PKCurrencyAmount)price
{
  return self->_price;
}

- (void)setPrice:(id)a3
{
}

- (PKDigitalIssuanceServiceProviderProduct)serviceProviderProduct
{
  return self->_serviceProviderProduct;
}

- (void)setServiceProviderProduct:(id)a3
{
}

- (PKDigitalIssuanceServiceProviderItem)serviceProviderItem
{
  return self->_serviceProviderItem;
}

- (void)setServiceProviderItem:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_serviceProviderItem, 0);
  objc_storeStrong((id *)&self->_serviceProviderProduct, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_balance, 0);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
  objc_storeStrong((id *)&self->_product, 0);
}

@end