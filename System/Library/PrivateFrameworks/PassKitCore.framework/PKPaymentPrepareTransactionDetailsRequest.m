@interface PKPaymentPrepareTransactionDetailsRequest
+ (id)serverSupportedLanguages;
- (NSDecimalNumber)amount;
- (NSString)currencyCode;
- (NSString)secureElementIdentifier;
- (PKPaymentMerchantSession)merchantSession;
- (PKPaymentPrepareTransactionDetailsRequest)initWithMerchantSession:(id)a3 secureElementIdentifier:(id)a4 amount:(id)a5 currencyCode:(id)a6;
- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4;
- (void)setAmount:(id)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setMerchantSession:(id)a3;
- (void)setSecureElementIdentifier:(id)a3;
@end

@implementation PKPaymentPrepareTransactionDetailsRequest

- (PKPaymentPrepareTransactionDetailsRequest)initWithMerchantSession:(id)a3 secureElementIdentifier:(id)a4 amount:(id)a5 currencyCode:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentPrepareTransactionDetailsRequest;
  v15 = [(PKOverlayableWebServiceRequest *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_merchantSession, a3);
    uint64_t v17 = [v12 copy];
    secureElementIdentifier = v16->_secureElementIdentifier;
    v16->_secureElementIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v16->_amount, a5);
    uint64_t v19 = [v14 copy];
    currencyCode = v16->_currencyCode;
    v16->_currencyCode = (NSString *)v19;
  }
  return v16;
}

- (id)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionary];
  v10 = [(NSDecimalNumber *)self->_amount stringValue];
  [v9 safelySetObject:v10 forKey:@"amount"];

  [v9 safelySetObject:self->_currencyCode forKey:@"currencyCode"];
  id v11 = [(PKPaymentMerchantSession *)self->_merchantSession merchantIdentifier];
  [v9 safelySetObject:v11 forKey:@"merchantIdentifier"];

  id v12 = [(PKPaymentMerchantSession *)self->_merchantSession merchantSessionIdentifier];
  [v9 safelySetObject:v12 forKey:@"merchantSessionIdentifier"];

  [v9 safelySetObject:self->_secureElementIdentifier forKey:@"seId"];
  id v13 = [NSNumber numberWithInteger:2];
  [v9 setObject:v13 forKey:@"version"];

  id v14 = [(PKPaymentMerchantSession *)self->_merchantSession initiative];
  int v15 = [v14 isEqualToString:@"virtual_card"];

  if (v15) {
    v16 = &unk_1EE22B168;
  }
  else {
    v16 = &unk_1EE22B150;
  }
  [v9 setObject:v16 forKey:@"imageSegments"];
  uint64_t v17 = [(id)objc_opt_class() serverSupportedLanguages];
  v18 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v19 = [v18 preferredLocalizations];

  v20 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:v17 forPreferences:v19];
  [v9 safelySetObject:v20 forKey:@"preferredLanguages"];
  v21 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v8 endpointComponents:&unk_1EE22B180 queryParameters:0 appleAccountInformation:v7];

  [v21 setHTTPMethod:@"POST"];
  objc_super v22 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v9];
  [v21 setHTTPBody:v22];

  v23 = (void *)[v21 copy];
  return v23;
}

+ (id)serverSupportedLanguages
{
  if (qword_1E92D9AF0 != -1) {
    dispatch_once(&qword_1E92D9AF0, &__block_literal_global_1853);
  }
  v2 = (void *)[(id)_MergedGlobals_9 copy];
  return v2;
}

void __69__PKPaymentPrepareTransactionDetailsRequest_serverSupportedLanguages__block_invoke()
{
  v0 = (void *)_MergedGlobals_9;
  _MergedGlobals_9 = (uint64_t)&unk_1EE22B198;
}

- (PKPaymentMerchantSession)merchantSession
{
  return self->_merchantSession;
}

- (void)setMerchantSession:(id)a3
{
}

- (NSString)secureElementIdentifier
{
  return self->_secureElementIdentifier;
}

- (void)setSecureElementIdentifier:(id)a3
{
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
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
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_secureElementIdentifier, 0);
  objc_storeStrong((id *)&self->_merchantSession, 0);
}

@end