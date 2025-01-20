@interface PKTransactionReceiptAuthorizationRequest
- (NSString)altDSID;
- (NSString)cardNumberSuffix;
- (NSString)receiptIdentifier;
- (NSString)receiptServiceIdentifier;
- (PKTransactionReceiptAuthorizationRequest)initWithReceiptServiceIdentifier:(id)a3 receiptIdentifier:(id)a4 altDSID:(id)a5 featureIdentifier:(unint64_t)a6;
- (PKTransactionReceiptAuthorizationRequest)initWithReceiptServiceIdentifier:(id)a3 receiptIdentifier:(id)a4 cardNumberSuffix:(id)a5 featureIdentifier:(unint64_t)a6;
- (unint64_t)featureIdentifier;
- (void)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 webService:(id)a5 completion:(id)a6;
@end

@implementation PKTransactionReceiptAuthorizationRequest

- (PKTransactionReceiptAuthorizationRequest)initWithReceiptServiceIdentifier:(id)a3 receiptIdentifier:(id)a4 cardNumberSuffix:(id)a5 featureIdentifier:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKTransactionReceiptAuthorizationRequest;
  v13 = [(PKOverlayableWebServiceRequest *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    receiptServiceIdentifier = v13->_receiptServiceIdentifier;
    v13->_receiptServiceIdentifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    receiptIdentifier = v13->_receiptIdentifier;
    v13->_receiptIdentifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    cardNumberSuffix = v13->_cardNumberSuffix;
    v13->_cardNumberSuffix = (NSString *)v18;

    v13->_featureIdentifier = a6;
  }

  return v13;
}

- (PKTransactionReceiptAuthorizationRequest)initWithReceiptServiceIdentifier:(id)a3 receiptIdentifier:(id)a4 altDSID:(id)a5 featureIdentifier:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PKTransactionReceiptAuthorizationRequest;
  v13 = [(PKOverlayableWebServiceRequest *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    receiptServiceIdentifier = v13->_receiptServiceIdentifier;
    v13->_receiptServiceIdentifier = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    receiptIdentifier = v13->_receiptIdentifier;
    v13->_receiptIdentifier = (NSString *)v16;

    uint64_t v18 = [v12 copy];
    altDSID = v13->_altDSID;
    v13->_altDSID = (NSString *)v18;

    v13->_featureIdentifier = a6;
  }

  return v13;
}

- (void)_urlRequestWithServiceURL:(id)a3 appleAccountInformation:(id)a4 webService:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:a3 endpointComponents:&unk_1EE22B1F8 queryParameters:0 appleAccountInformation:a4];
  [v12 setHTTPMethod:@"POST"];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v13 setObject:self->_receiptServiceIdentifier forKeyedSubscript:@"receiptServiceIdentifier"];
  [v13 setObject:self->_receiptIdentifier forKeyedSubscript:@"receiptIdentifier"];
  [v13 setObject:self->_cardNumberSuffix forKeyedSubscript:@"paymentMethodIdentifier"];
  [v13 setObject:self->_altDSID forKeyedSubscript:@"altDSID"];
  unint64_t featureIdentifier = self->_featureIdentifier;
  if (featureIdentifier)
  {
    v15 = PKFeatureIdentifierToString(featureIdentifier);
    [v13 setObject:v15 forKeyedSubscript:@"featureIdentifier"];
  }
  uint64_t v16 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v13];
  [v12 setHTTPBody:v16];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __116__PKTransactionReceiptAuthorizationRequest__urlRequestWithServiceURL_appleAccountInformation_webService_completion___block_invoke;
  v18[3] = &unk_1E56EDD70;
  id v19 = v10;
  id v17 = v10;
  [(PKPaymentWebServiceRequest *)self _signRequest:v12 webService:v11 completion:v18];
}

void __116__PKTransactionReceiptAuthorizationRequest__urlRequestWithServiceURL_appleAccountInformation_webService_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = (id)[a2 copy];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

- (NSString)receiptServiceIdentifier
{
  return self->_receiptServiceIdentifier;
}

- (NSString)receiptIdentifier
{
  return self->_receiptIdentifier;
}

- (NSString)cardNumberSuffix
{
  return self->_cardNumberSuffix;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (unint64_t)featureIdentifier
{
  return self->_featureIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_cardNumberSuffix, 0);
  objc_storeStrong((id *)&self->_receiptIdentifier, 0);
  objc_storeStrong((id *)&self->_receiptServiceIdentifier, 0);
}

@end