@interface PKPaymentAugmentBaseRequest
- (NSString)currencyCode;
- (NSString)merchantCountryCode;
- (PKPaymentApplication)paymentApplication;
- (PKPaymentAugmentBaseRequest)initWithPaymentPass:(id)a3;
- (PKPaymentPass)pass;
- (PKSecureElementApplet)applet;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5;
- (id)bodyDictionary;
- (id)endpointComponents;
- (int64_t)type;
- (void)setApplet:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setMerchantCountryCode:(id)a3;
- (void)setPass:(id)a3;
- (void)setPaymentApplication:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation PKPaymentAugmentBaseRequest

- (PKPaymentAugmentBaseRequest)initWithPaymentPass:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentAugmentBaseRequest;
  v6 = [(PKOverlayableWebServiceRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pass, a3);
  }

  return v7;
}

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 appleAccountInformation:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [(PKPaymentAugmentBaseRequest *)self pass];
  v12 = [v11 passTypeIdentifier];
  v13 = [v11 serialNumber];
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", @"devices", v9, 0);

  if (!self->_type)
  {
    [v14 addObject:@"passes"];
    [v14 addObject:v12];
    [v14 addObject:v13];
  }
  v15 = [(PKPaymentAugmentBaseRequest *)self endpointComponents];
  if ([v15 count]) {
    [v14 addObjectsFromArray:v15];
  }
  v16 = (void *)[v14 copy];
  v17 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v10 endpointComponents:v16 queryParameters:0 appleAccountInformation:v8];

  [v17 setHTTPMethod:@"POST"];
  v18 = objc_opt_class();
  v19 = [(PKPaymentAugmentBaseRequest *)self bodyDictionary];
  v20 = [v18 _HTTPBodyWithDictionary:v19];
  [v17 setHTTPBody:v20];

  v21 = (void *)[v17 copy];
  return v21;
}

- (id)endpointComponents
{
  return 0;
}

- (id)bodyDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = v3;
  merchantCountryCode = self->_merchantCountryCode;
  if (merchantCountryCode) {
    [v3 setObject:merchantCountryCode forKey:@"merchantCountryCode"];
  }
  pass = self->_pass;
  if (pass)
  {
    v7 = [(PKSecureElementPass *)pass issuerCountryCode];
    [v4 setObject:v7 forKey:@"issuerCountryCode"];
  }
  currencyCode = self->_currencyCode;
  if (currencyCode) {
    [v4 setObject:currencyCode forKey:@"currencyCode"];
  }
  applet = self->_applet;
  if (applet)
  {
    id v10 = [(PKSecureElementApplet *)applet jsonDictionaryRepresentation];
    [v4 setObject:v10 forKey:@"appletInfo"];
  }
  paymentApplication = self->_paymentApplication;
  if (paymentApplication)
  {
    v12 = objc_msgSend(NSNumber, "numberWithInteger:", -[PKPaymentApplication paymentNetworkIdentifier](paymentApplication, "paymentNetworkIdentifier"));
    [v4 setObject:v12 forKey:@"paymentNetworkIdentifier"];
  }
  if (self->_type == 1)
  {
    v13 = self->_pass;
    if (v13)
    {
      v14 = [(PKPass *)v13 serialNumber];
      [v4 setObject:v14 forKey:@"passSerialNumber"];

      v15 = [(PKPass *)self->_pass passTypeIdentifier];
      [v4 setObject:v15 forKey:@"passTypeIdentifier"];
    }
  }
  v16 = (void *)[v4 copy];

  return v16;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPass:(id)a3
{
}

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (void)setPaymentApplication:(id)a3
{
}

- (PKSecureElementApplet)applet
{
  return self->_applet;
}

- (void)setApplet:(id)a3
{
}

- (NSString)merchantCountryCode
{
  return self->_merchantCountryCode;
}

- (void)setMerchantCountryCode:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_merchantCountryCode, 0);
  objc_storeStrong((id *)&self->_applet, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end