@interface PKPaymentRewrapRequestBase
- (BOOL)isDeferredPayment;
- (NSArray)endpointComponents;
- (NSArray)multiTokenContexts;
- (NSData)applicationData;
- (NSDictionary)fundingSourceDetails;
- (NSDictionary)serviceProviderData;
- (NSString)currencyCode;
- (NSString)deviceAssessments;
- (NSString)initiative;
- (NSString)initiativeContext;
- (NSString)merchantTokenManagementURL;
- (NSString)merchantTokenUseCase;
- (NSString)paymentHash;
- (NSString)remoteDeviceModel;
- (NSString)remoteNetworkRequestInitiatingUserAgent;
- (NSString)remoteNetworkRequestPaymentTopicID;
- (NSString)shippingAddressHash;
- (NSString)userAgent;
- (PKAccount)account;
- (PKPaymentApplication)paymentApplication;
- (PKPaymentPass)pass;
- (PKWrappedPayment)wrappedPayment;
- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 rewrapData:(id)a5 appleAccountInformation:(id)a6;
- (id)bodyDictionary;
- (int64_t)cryptogramType;
- (int64_t)type;
- (void)setAccount:(id)a3;
- (void)setApplicationData:(id)a3;
- (void)setCryptogramType:(int64_t)a3;
- (void)setCurrencyCode:(id)a3;
- (void)setDeviceAssessments:(id)a3;
- (void)setFundingSourceDetails:(id)a3;
- (void)setInitiative:(id)a3;
- (void)setInitiativeContext:(id)a3;
- (void)setIsDeferredPayment:(BOOL)a3;
- (void)setMerchantTokenManagementURL:(id)a3;
- (void)setMerchantTokenUseCase:(id)a3;
- (void)setMultiTokenContexts:(id)a3;
- (void)setPass:(id)a3;
- (void)setPaymentApplication:(id)a3;
- (void)setPaymentHash:(id)a3;
- (void)setRemoteDeviceModel:(id)a3;
- (void)setRemoteNetworkRequestInitiatingUserAgent:(id)a3;
- (void)setRemoteNetworkRequestPaymentTopicID:(id)a3;
- (void)setServiceProviderData:(id)a3;
- (void)setShippingAddressHash:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUserAgent:(id)a3;
- (void)setWrappedPayment:(id)a3;
@end

@implementation PKPaymentRewrapRequestBase

- (id)_urlRequestWithServiceURL:(id)a3 deviceIdentifier:(id)a4 rewrapData:(id)a5 appleAccountInformation:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  v14 = [(PKPaymentRewrapRequestBase *)self pass];
  uint64_t v15 = [v14 passTypeIdentifier];
  v16 = [v14 serialNumber];
  v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", @"devices", v12, 0);

  int64_t type = self->_type;
  if ((unint64_t)(type - 2) < 4 || type == 0)
  {
    [v17 addObject:@"passes"];
    [v17 addObject:v15];
    [v17 addObject:v16];
  }
  v20 = [(PKPaymentRewrapRequestBase *)self endpointComponents];
  if ([v20 count]) {
    [v17 addObjectsFromArray:v20];
  }
  v34 = (void *)v15;
  unint64_t v21 = self->_type;
  if (v21 > 5) {
    v22 = 0;
  }
  else {
    v22 = off_1E56EDEA8[v21];
  }
  v23 = (void *)[v17 copy];
  v24 = [(PKPaymentWebServiceRequest *)self _murlRequestWithServiceURL:v13 version:v22 endpointComponents:v23 queryParameters:0 appleAccountInformation:v11];

  [v24 setHTTPMethod:@"POST"];
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v10)
  {
    v26 = [v10 platformData];
    v27 = [v26 hexEncoding];
    [v25 setValue:v27 forKey:@"pairedSEP"];

    v28 = [v10 platformDataSignature];
    v29 = [v28 hexEncoding];
    [v25 setValue:v29 forKey:@"pairedSEPSignature"];
  }
  v30 = [(PKPaymentRewrapRequestBase *)self bodyDictionary];
  [v25 addEntriesFromDictionary:v30];

  v31 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v25];
  [v24 setHTTPBody:v31];

  v32 = (void *)[v24 copy];
  return v32;
}

- (NSArray)endpointComponents
{
  return 0;
}

- (id)bodyDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(PKWrappedPayment *)self->_wrappedPayment transactionData];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 hexEncoding];
    [v3 setValue:v6 forKey:@"paymentData"];
  }
  v7 = [(PKWrappedPayment *)self->_wrappedPayment certificates];
  uint64_t v8 = [v7 dictionary];

  if (v8) {
    [v3 setValue:v8 forKey:@"casdCertificate"];
  }
  v49 = (void *)v8;
  v9 = [(PKWrappedPayment *)self->_wrappedPayment transactionInstructionsSignature];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 hexEncoding];
    [v3 setValue:v11 forKey:@"transactionInstructionsSignature"];
  }
  v48 = v10;
  uint64_t v12 = [(PKPaymentRewrapRequestBase *)self applicationData];
  if (v12)
  {
    id v13 = (void *)v12;
    v14 = [(PKPaymentRewrapRequestBase *)self applicationData];
    uint64_t v15 = [v14 SHA256Hash];
    v16 = [v15 hexEncoding];

    if (v16)
    {
      [v3 setValue:v16 forKey:@"applicationData"];
    }
  }
  v17 = [(PKWrappedPayment *)self->_wrappedPayment kextBlacklistVersion];
  if ([v17 length]) {
    [v3 setValue:v17 forKey:@"kextBlacklistVersion"];
  }
  v18 = [(PKWrappedPayment *)self->_wrappedPayment merchantCountryCode];
  if (v18) {
    [v3 setValue:v18 forKey:@"merchantCountryCode"];
  }
  v19 = [(PKSecureElementPass *)self->_pass issuerCountryCode];
  if (v19) {
    [v3 setValue:v19 forKey:@"issuerCountryCode"];
  }
  v20 = [(PKSecureElementPass *)self->_pass primaryAccountIdentifier];
  if (v20) {
    [v3 setValue:v20 forKey:@"primaryAccountIdentifier"];
  }
  v46 = v5;
  v47 = v17;
  unint64_t v21 = [(PKPaymentApplication *)self->_paymentApplication dpanIdentifier];
  if (v21) {
    [v3 setValue:v21 forKey:@"devicePrimaryAccountIdentifier"];
  }
  v22 = PKPaymentCryptogramTypeToString(self->_cryptogramType);
  [v3 setValue:v22 forKey:@"cryptogramType"];

  serviceProviderData = self->_serviceProviderData;
  if (serviceProviderData) {
    [v3 setObject:serviceProviderData forKey:@"serviceProviderData"];
  }
  paymentHash = self->_paymentHash;
  if (paymentHash) {
    [v3 setObject:paymentHash forKey:@"paymentHash"];
  }
  fundingSourceDetails = self->_fundingSourceDetails;
  if (fundingSourceDetails) {
    [v3 setObject:fundingSourceDetails forKey:@"fundingSourceMetadata"];
  }
  initiative = self->_initiative;
  if (initiative)
  {
    [v3 setObject:initiative forKey:@"initiative"];
    if ([(NSString *)self->_initiative isEqualToString:@"merchant_token"]) {
      [v3 setObject:self->_merchantTokenUseCase forKey:@"merchantTokenUseCase"];
    }
  }
  initiativeContext = self->_initiativeContext;
  if (initiativeContext) {
    [v3 setObject:initiativeContext forKey:@"initiativeContext"];
  }
  merchantTokenManagementURL = self->_merchantTokenManagementURL;
  if (merchantTokenManagementURL) {
    [v3 setObject:merchantTokenManagementURL forKey:@"merchantTokenManagementURL"];
  }
  remoteDeviceModel = self->_remoteDeviceModel;
  if (remoteDeviceModel) {
    [v3 setObject:remoteDeviceModel forKey:@"remoteDeviceModel"];
  }
  if (self->_isDeferredPayment) {
    [v3 setObject:&unk_1EE22DBB8 forKey:@"tokenRequestAttributes"];
  }
  userAgent = self->_userAgent;
  if (userAgent) {
    [v3 setObject:userAgent forKey:@"webViewUserAgent"];
  }
  if ([(NSString *)self->_remoteNetworkRequestPaymentTopicID length]
    || [(NSString *)self->_remoteNetworkRequestInitiatingUserAgent length])
  {
    id v31 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([(NSString *)self->_remoteNetworkRequestPaymentTopicID length]) {
      [v31 setObject:self->_remoteNetworkRequestPaymentTopicID forKeyedSubscript:@"paymentTopicId"];
    }
    if ([(NSString *)self->_remoteNetworkRequestInitiatingUserAgent length]) {
      [v31 setObject:self->_remoteNetworkRequestInitiatingUserAgent forKeyedSubscript:@"userAgent"];
    }
    v32 = (void *)[v31 copy];
    [v3 setObject:v32 forKeyedSubscript:@"remoteRequestData"];
  }
  if ([(NSArray *)self->_multiTokenContexts count])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __44__PKPaymentRewrapRequestBase_bodyDictionary__block_invoke;
    aBlock[3] = &unk_1E56EDE30;
    aBlock[4] = self;
    v33 = _Block_copy(aBlock);
    v34 = [(NSArray *)self->_multiTokenContexts pk_arrayByApplyingBlock:v33];
    [v3 setObject:v34 forKeyedSubscript:@"paymentDataContext"];
  }
  int64_t type = self->_type;
  if (type == 1)
  {
    pass = self->_pass;
    v36 = v46;
    if (pass)
    {
      v39 = [(PKPass *)pass serialNumber];
      [v3 setObject:v39 forKey:@"passSerialNumber"];

      v40 = [(PKPass *)self->_pass passTypeIdentifier];
      [v3 setObject:v40 forKey:@"passTypeIdentifier"];
    }
  }
  else
  {
    v36 = v46;
    if (type == 3)
    {
      v37 = [*(id *)((char *)&self->super.super.super.super.isa + v45) virtualCardIdentifier];
      [v3 setObject:v37 forKeyedSubscript:@"virtualCardNumberIdentifier"];

      [v3 setObject:@"virtual_card_refresh" forKeyedSubscript:@"initiative"];
    }
  }
  shippingAddressHash = self->_shippingAddressHash;
  if (shippingAddressHash) {
    [v3 setObject:shippingAddressHash forKey:@"shippingAddressHash"];
  }
  deviceAssessments = self->_deviceAssessments;
  if (deviceAssessments) {
    [v3 setObject:deviceAssessments forKey:@"deviceAssessments"];
  }
  v43 = (void *)[v3 copy];

  return v43;
}

id __44__PKPaymentRewrapRequestBase_bodyDictionary__block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  v6 = [v4 merchantIdentifier];
  v7 = [v6 dataUsingEncoding:4];
  uint64_t v8 = [v7 SHA256Hash];
  v9 = [v8 hexEncoding];

  [v5 setObject:v9 forKeyedSubscript:@"merchantIdentifier"];
  id v10 = [v4 externalIdentifier];
  [v5 setObject:v10 forKeyedSubscript:@"externalMerchantIdentifier"];

  id v11 = [v4 merchantDomain];
  [v5 setObject:v11 forKeyedSubscript:@"merchantDomain"];

  uint64_t v12 = [v4 merchantName];
  [v5 setObject:v12 forKeyedSubscript:@"merchantName"];

  id v13 = [v4 amount];

  v14 = PKCurrencyAmountCreate(v13, *(NSString **)(*(void *)(a1 + 32) + 160), 0);

  uint64_t v15 = [v14 amountByConvertingToSmallestCommonCurrencyUnit];
  v16 = [v15 stringValue];
  [v5 setObject:v16 forKeyedSubscript:@"transactionAmount"];

  v17 = (void *)[v5 copy];
  return v17;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
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

- (PKWrappedPayment)wrappedPayment
{
  return self->_wrappedPayment;
}

- (void)setWrappedPayment:(id)a3
{
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(id)a3
{
}

- (int64_t)cryptogramType
{
  return self->_cryptogramType;
}

- (void)setCryptogramType:(int64_t)a3
{
  self->_cryptogramType = a3;
}

- (NSDictionary)serviceProviderData
{
  return self->_serviceProviderData;
}

- (void)setServiceProviderData:(id)a3
{
}

- (NSString)paymentHash
{
  return self->_paymentHash;
}

- (void)setPaymentHash:(id)a3
{
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
}

- (NSString)initiative
{
  return self->_initiative;
}

- (void)setInitiative:(id)a3
{
}

- (NSString)merchantTokenUseCase
{
  return self->_merchantTokenUseCase;
}

- (void)setMerchantTokenUseCase:(id)a3
{
}

- (NSString)initiativeContext
{
  return self->_initiativeContext;
}

- (void)setInitiativeContext:(id)a3
{
}

- (NSString)merchantTokenManagementURL
{
  return self->_merchantTokenManagementURL;
}

- (void)setMerchantTokenManagementURL:(id)a3
{
}

- (BOOL)isDeferredPayment
{
  return self->_isDeferredPayment;
}

- (void)setIsDeferredPayment:(BOOL)a3
{
  self->_isDeferredPayment = a3;
}

- (NSArray)multiTokenContexts
{
  return self->_multiTokenContexts;
}

- (void)setMultiTokenContexts:(id)a3
{
}

- (NSDictionary)fundingSourceDetails
{
  return self->_fundingSourceDetails;
}

- (void)setFundingSourceDetails:(id)a3
{
}

- (PKAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)shippingAddressHash
{
  return self->_shippingAddressHash;
}

- (void)setShippingAddressHash:(id)a3
{
}

- (NSString)deviceAssessments
{
  return self->_deviceAssessments;
}

- (void)setDeviceAssessments:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)remoteDeviceModel
{
  return self->_remoteDeviceModel;
}

- (void)setRemoteDeviceModel:(id)a3
{
}

- (NSString)remoteNetworkRequestPaymentTopicID
{
  return self->_remoteNetworkRequestPaymentTopicID;
}

- (void)setRemoteNetworkRequestPaymentTopicID:(id)a3
{
}

- (NSString)remoteNetworkRequestInitiatingUserAgent
{
  return self->_remoteNetworkRequestInitiatingUserAgent;
}

- (void)setRemoteNetworkRequestInitiatingUserAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteNetworkRequestInitiatingUserAgent, 0);
  objc_storeStrong((id *)&self->_remoteNetworkRequestPaymentTopicID, 0);
  objc_storeStrong((id *)&self->_remoteDeviceModel, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_deviceAssessments, 0);
  objc_storeStrong((id *)&self->_shippingAddressHash, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_fundingSourceDetails, 0);
  objc_storeStrong((id *)&self->_multiTokenContexts, 0);
  objc_storeStrong((id *)&self->_merchantTokenManagementURL, 0);
  objc_storeStrong((id *)&self->_initiativeContext, 0);
  objc_storeStrong((id *)&self->_merchantTokenUseCase, 0);
  objc_storeStrong((id *)&self->_initiative, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_paymentHash, 0);
  objc_storeStrong((id *)&self->_serviceProviderData, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_wrappedPayment, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_pass, 0);
}

@end