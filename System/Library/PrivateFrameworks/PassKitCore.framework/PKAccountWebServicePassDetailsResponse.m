@interface PKAccountWebServicePassDetailsResponse
- (NSArray)postProvisioningContent;
- (NSString)ownershipTokenIdentifier;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (NSString)provisioningIdentifier;
- (NSURL)passURL;
- (PKAccountWebServicePassDetailsResponse)initWithData:(id)a3;
- (PKPaymentRemoteCredential)remoteCredential;
- (int64_t)cardType;
- (int64_t)status;
- (void)setRemoteCredential:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation PKAccountWebServicePassDetailsResponse

- (PKAccountWebServicePassDetailsResponse)initWithData:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)PKAccountWebServicePassDetailsResponse;
  v3 = [(PKWebServiceResponse *)&v38 initWithData:a3];
  v4 = v3;
  if (!v3)
  {
LABEL_23:
    v32 = v4;
    goto LABEL_24;
  }
  v5 = [(PKWebServiceResponse *)v3 JSONObject];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v29 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v29);
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138543618;
      v40 = v17;
      __int16 v41 = 2114;
      v42 = v31;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

LABEL_21:
    }

    goto LABEL_23;
  }
  v6 = v5;
  uint64_t v7 = [v6 PKStringForKey:@"provisioningIdentifier"];
  provisioningIdentifier = v4->_provisioningIdentifier;
  v4->_provisioningIdentifier = (NSString *)v7;

  v4->_cardType = [v6 PKIntegerForKey:@"cardType"];
  v4->_status = [v6 PKIntegerForKey:@"status"];
  uint64_t v9 = [v6 PKURLForKey:@"passURL"];
  passURL = v4->_passURL;
  v4->_passURL = (NSURL *)v9;

  uint64_t v11 = [v6 PKStringForKey:@"passTypeIdentifier"];
  passTypeIdentifier = v4->_passTypeIdentifier;
  v4->_passTypeIdentifier = (NSString *)v11;

  uint64_t v13 = [v6 PKStringForKey:@"passSerialNumber"];
  passSerialNumber = v4->_passSerialNumber;
  v4->_passSerialNumber = (NSString *)v13;

  uint64_t v15 = [v6 PKStringForKey:@"ownershipTokenIdentifier"];
  ownershipTokenIdentifier = v4->_ownershipTokenIdentifier;
  v4->_ownershipTokenIdentifier = (NSString *)v15;

  v17 = [v6 PKArrayForKey:@"postProvisioningContent"];
  if (v17)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v43 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v35 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [[PKAccountPostProvisioningContent alloc] initWithDictionary:*(void *)(*((void *)&v34 + 1) + 8 * i)];
          if (v24) {
            [v18 addObject:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v43 count:16];
      }
      while (v21);
    }

    uint64_t v25 = [v18 copy];
    postProvisioningContent = v4->_postProvisioningContent;
    v4->_postProvisioningContent = (NSArray *)v25;
  }
  switch(v4->_status)
  {
    case 0:
    case 4:
      if (v4->_passURL) {
        goto LABEL_21;
      }
      v27 = PKLogFacilityTypeGetObject(0xEuLL);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      v28 = "Malformed - Missing passURL";
      break;
    case 1:
    case 5:
      if (v4->_provisioningIdentifier) {
        goto LABEL_21;
      }
      v27 = PKLogFacilityTypeGetObject(0xEuLL);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_28;
      }
      *(_WORD *)buf = 0;
      v28 = "Malformed - Missing provisioningIdentifier";
      break;
    default:
      goto LABEL_21;
  }
  _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 2u);
LABEL_28:

  v32 = 0;
LABEL_24:

  return v32;
}

- (NSString)provisioningIdentifier
{
  return self->_provisioningIdentifier;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSURL)passURL
{
  return self->_passURL;
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (NSString)ownershipTokenIdentifier
{
  return self->_ownershipTokenIdentifier;
}

- (NSArray)postProvisioningContent
{
  return self->_postProvisioningContent;
}

- (PKPaymentRemoteCredential)remoteCredential
{
  return self->_remoteCredential;
}

- (void)setRemoteCredential:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteCredential, 0);
  objc_storeStrong((id *)&self->_postProvisioningContent, 0);
  objc_storeStrong((id *)&self->_ownershipTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_provisioningIdentifier, 0);
}

@end