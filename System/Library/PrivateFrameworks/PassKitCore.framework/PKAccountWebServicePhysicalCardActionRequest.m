@interface PKAccountWebServicePhysicalCardActionRequest
+ (BOOL)supportsSecureCoding;
- (Class)signatureResponseClass;
- (NSData)publicKeyHash;
- (NSString)accountIdentifier;
- (NSString)accountUserAltDSID;
- (NSString)physicalCardIdentifier;
- (NSURL)baseURL;
- (PKAccountWebServicePhysicalCardActionRequest)initWithCoder:(id)a3;
- (PKApplePayTrustHashResponse)hashResponse;
- (PKPaymentDeviceMetadata)deviceMetadata;
- (PKPhysicalCardAction)action;
- (id)_urlRequestWithAppleAccountInformation:(id)a3;
- (id)endpointComponents;
- (id)manifestHashWithReferenceIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAccountUserAltDSID:(id)a3;
- (void)setAction:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setDeviceMetadata:(id)a3;
- (void)setHashResponse:(id)a3;
- (void)setPhysicalCardIdentifier:(id)a3;
- (void)setPublicKeyHash:(id)a3;
@end

@implementation PKAccountWebServicePhysicalCardActionRequest

- (id)_urlRequestWithAppleAccountInformation:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKAccountWebServicePhysicalCardActionRequest *)self baseURL];
  if (!v5)
  {
    v14 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    int v21 = 138543618;
    v22 = v16;
    __int16 v23 = 2082;
    v24 = "baseURL";
LABEL_16:
    _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Request %{public}@ missing parameter '%{public}s'.", (uint8_t *)&v21, 0x16u);

    goto LABEL_17;
  }
  if (!self->_action)
  {
    v14 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v17 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v17);
    int v21 = 138543618;
    v22 = v16;
    __int16 v23 = 2082;
    v24 = "_action";
    goto LABEL_16;
  }
  if (!self->_accountIdentifier)
  {
    v14 = PKLogFacilityTypeGetObject(0xEuLL);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    v18 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v18);
    int v21 = 138543618;
    v22 = v16;
    __int16 v23 = 2082;
    v24 = "_accountIdentifier";
    goto LABEL_16;
  }
  if (!self->_physicalCardIdentifier)
  {
    v14 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v19);
      int v21 = 138543618;
      v22 = v16;
      __int16 v23 = 2082;
      v24 = "_physicalCardIdentifier";
      goto LABEL_16;
    }
LABEL_17:

    v13 = 0;
    goto LABEL_18;
  }
  v6 = [(PKAccountWebServicePhysicalCardActionRequest *)self endpointComponents];
  v7 = [(PKAccountWebServiceRequest *)self _murlRequestWithServiceURL:v5 endpointComponents:v6 queryParameters:0 appleAccountInformation:v4];

  [v7 setHTTPMethod:@"POST"];
  [v7 setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v9 = [(PKPhysicalCardAction *)self->_action jsonRepresentation];
  [v8 addEntriesFromDictionary:v9];

  [v8 setObject:self->_accountUserAltDSID forKeyedSubscript:@"accountUserAltDSID"];
  v10 = [(PKPaymentDeviceMetadata *)self->_deviceMetadata dictionaryRepresentation];
  if (v10) {
    [v8 setObject:v10 forKey:@"deviceMetadata"];
  }
  v11 = [(NSData *)self->_publicKeyHash hexEncoding];
  [v8 setObject:v11 forKeyedSubscript:@"publicKeyHash"];

  v12 = [(id)objc_opt_class() _HTTPBodyWithDictionary:v8];
  [v7 setHTTPBody:v12];

  v13 = (void *)[v7 copy];
LABEL_18:

  return v13;
}

- (id)endpointComponents
{
  v7[4] = *MEMORY[0x1E4F143B8];
  v3 = [(NSString *)self->_accountIdentifier length];
  if (v3)
  {
    v3 = [(NSString *)self->_physicalCardIdentifier length];
    if (v3)
    {
      accountIdentifier = self->_accountIdentifier;
      v7[0] = @"accounts";
      v7[1] = accountIdentifier;
      physicalCardIdentifier = self->_physicalCardIdentifier;
      v7[2] = @"physicalCard";
      v7[3] = physicalCardIdentifier;
      v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:4];
    }
  }
  return v3;
}

- (Class)signatureResponseClass
{
  return (Class)objc_opt_class();
}

- (id)manifestHashWithReferenceIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28E78] string];
  if ([(NSString *)self->_accountIdentifier length]) {
    [v5 appendString:self->_accountIdentifier];
  }
  if ([(NSString *)self->_physicalCardIdentifier length]) {
    [v5 appendString:self->_physicalCardIdentifier];
  }
  uint64_t v6 = [(PKPhysicalCardAction *)self->_action actionType];
  v7 = PKStringFromPhysicalCardActionType(v6);
  if ([v7 length]) {
    [v5 appendString:v7];
  }
  if (v6 == 5)
  {
    v8 = PKStringFromPhysicalCardOrderReason([(PKPhysicalCardAction *)self->_action reason]);
    if ([v8 length]) {
      [v5 appendString:v8];
    }
    v9 = [(PKPhysicalCardAction *)self->_action priceOption];
    v10 = v9;
    if (v9)
    {
      v11 = PKStringFromPhysicalCardOrderReason([v9 reason]);
      v12 = [v10 amount];
      v13 = [v12 amount];
      v14 = [v13 stringValue];

      v15 = [v10 amount];
      v16 = [v15 currency];

      if ([v11 length]) {
        [v5 appendString:v11];
      }
      if ([v14 length]) {
        [v5 appendString:v14];
      }
      if ([v16 length]) {
        [v5 appendString:v16];
      }
    }
  }
  if (v4) {
    [v5 appendString:v4];
  }
  v17 = [v5 dataUsingEncoding:4];
  v18 = [v17 SHA256Hash];

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountWebServicePhysicalCardActionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKAccountWebServicePhysicalCardActionRequest;
  v5 = [(PKOverlayableWebServiceRequest *)&v17 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];
    [(PKAccountWebServicePhysicalCardActionRequest *)v5 setBaseURL:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hashResponse"];
    [(PKAccountWebServicePhysicalCardActionRequest *)v5 setHashResponse:v7];

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountIdentifier"];
    accountIdentifier = v5->_accountIdentifier;
    v5->_accountIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accountUserAltDSID"];
    accountUserAltDSID = v5->_accountUserAltDSID;
    v5->_accountUserAltDSID = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"physicalCardIdentifier"];
    physicalCardIdentifier = v5->_physicalCardIdentifier;
    v5->_physicalCardIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"action"];
    action = v5->_action;
    v5->_action = (PKPhysicalCardAction *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKAccountWebServicePhysicalCardActionRequest;
  id v4 = a3;
  [(PKOverlayableWebServiceRequest *)&v7 encodeWithCoder:v4];
  v5 = [(PKAccountWebServicePhysicalCardActionRequest *)self baseURL];
  [v4 encodeObject:v5 forKey:@"baseURL"];

  uint64_t v6 = [(PKAccountWebServicePhysicalCardActionRequest *)self hashResponse];
  [v4 encodeObject:v6 forKey:@"hashResponse"];

  [v4 encodeObject:self->_accountIdentifier forKey:@"accountIdentifier"];
  [v4 encodeObject:self->_accountUserAltDSID forKey:@"accountUserAltDSID"];
  [v4 encodeObject:self->_physicalCardIdentifier forKey:@"physicalCardIdentifier"];
  [v4 encodeObject:self->_action forKey:@"action"];
}

- (NSURL)baseURL
{
  return self->baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (PKApplePayTrustHashResponse)hashResponse
{
  return self->hashResponse;
}

- (void)setHashResponse:(id)a3
{
}

- (NSData)publicKeyHash
{
  return self->_publicKeyHash;
}

- (void)setPublicKeyHash:(id)a3
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (NSString)accountUserAltDSID
{
  return self->_accountUserAltDSID;
}

- (void)setAccountUserAltDSID:(id)a3
{
}

- (NSString)physicalCardIdentifier
{
  return self->_physicalCardIdentifier;
}

- (void)setPhysicalCardIdentifier:(id)a3
{
}

- (PKPhysicalCardAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (PKPaymentDeviceMetadata)deviceMetadata
{
  return self->_deviceMetadata;
}

- (void)setDeviceMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceMetadata, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_physicalCardIdentifier, 0);
  objc_storeStrong((id *)&self->_accountUserAltDSID, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_publicKeyHash, 0);
  objc_storeStrong((id *)&self->hashResponse, 0);
  objc_storeStrong((id *)&self->baseURL, 0);
}

@end