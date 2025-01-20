@interface PKWebServiceRegionFeature
+ (id)regionFeatureWithType:(int64_t)a3 dictionary:(id)a4 region:(id)a5;
- (BOOL)automaticRegister;
- (NSString)region;
- (PKOSVersionRequirementRange)versionRange;
- (PKWebServiceRegionFeature)initWithFeatureType:(int64_t)a3 dictionary:(id)a4 region:(id)a5;
- (float)enablementThreshold;
- (int64_t)featureType;
- (int64_t)registrationType;
@end

@implementation PKWebServiceRegionFeature

+ (id)regionFeatureWithType:(int64_t)a3 dictionary:(id)a4 region:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = 0;
  switch(a3)
  {
    case 1:
      v10 = [PKWebServiceRegionFeature alloc];
      int64_t v11 = 1;
      goto LABEL_5;
    case 2:
      v12 = PKWebServiceCarAccessFeature;
      goto LABEL_18;
    case 3:
      v12 = PKWebServiceMerchantTokensFeature;
      goto LABEL_18;
    case 4:
      v12 = PKWebServiceMMORFeature;
      goto LABEL_18;
    case 5:
      v12 = PKWebServiceSharingFeature;
      goto LABEL_18;
    case 6:
      v12 = PKWebServiceTorinoFeature;
      goto LABEL_18;
    case 7:
    case 8:
      v10 = [PKWebServiceVirtualCardFeature alloc];
      int64_t v11 = a3;
LABEL_5:
      uint64_t v13 = [(PKWebServiceVirtualCardFeature *)v10 initWithFeatureType:v11 dictionary:v7 region:v8];
      goto LABEL_19;
    case 9:
      v12 = PKWebServiceDisbursementFeature;
      goto LABEL_18;
    case 11:
      v12 = PKWebServiceIssuerBindingFeature;
      goto LABEL_18;
    case 12:
    case 13:
      v12 = PKWebServiceDocumentDeliveryFeature;
      goto LABEL_18;
    case 14:
      v12 = PKWebServiceStaticContentDataSourceFeature;
      goto LABEL_18;
    case 15:
      v12 = PKWebServicePaymentOffersFeature;
      goto LABEL_18;
    case 16:
      v12 = PKWebServiceMerchantCategoryCodesFeature;
      goto LABEL_18;
    case 17:
      v12 = PKWebServiceRemoteNetworkPaymentFeature;
      goto LABEL_18;
    case 18:
      v12 = PKWebServiceTicketingFeature;
LABEL_18:
      uint64_t v13 = [[v12 alloc] initWithDictionary:v7 region:v8];
LABEL_19:
      v9 = (void *)v13;
      break;
    default:
      break;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionRange, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

- (int64_t)featureType
{
  return self->_featureType;
}

- (PKWebServiceRegionFeature)initWithFeatureType:(int64_t)a3 dictionary:(id)a4 region:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  if (!v8)
  {
    v12 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Invalid parameters to create region feature with", (uint8_t *)&v34, 2u);
    }
    goto LABEL_31;
  }
  v10 = [(PKWebServiceRegionFeature *)self init];
  self = v10;
  if (!v10) {
    goto LABEL_26;
  }
  v10->_featureType = a3;
  objc_storeStrong((id *)&v10->_region, a5);
  int64_t v11 = [v8 PKNumberForKey:@"automaticRegister"];
  v12 = v11;
  if (v11) {
    char v13 = [v11 BOOLValue];
  }
  else {
    char v13 = 1;
  }
  self->_automaticRegister = v13;
  v14 = [v8 PKStringForKey:@"registrationType"];
  v15 = v14;
  if (v14)
  {
    id v16 = v14;
    if ([v16 isEqual:@"lightweight"])
    {
      int64_t v17 = 2;
    }
    else
    {
      if (![v16 isEqual:@"reregister"])
      {
        unsigned int v29 = [v16 isEqual:@"none"];
        char v30 = v29;
        int64_t v31 = v29;

        self->_registrationType = v31;
        if ((v30 & 1) == 0)
        {
          v32 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            int v34 = 138412290;
            id v35 = v16;
            _os_log_impl(&dword_190E10000, v32, OS_LOG_TYPE_DEFAULT, "Unknown registration type: %@", (uint8_t *)&v34, 0xCu);
          }

          goto LABEL_31;
        }
        goto LABEL_16;
      }
      int64_t v17 = 3;
    }
  }
  else
  {
    int64_t v17 = 2;
  }
  self->_registrationType = v17;
LABEL_16:
  v18 = [v8 PKNumberForKey:@"enablementThreshold"];
  v19 = v18;
  if (v18) {
    [v18 floatValue];
  }
  else {
    float v20 = 0.0;
  }
  self->_enablementThreshold = v20;
  v21 = [v8 objectForKey:@"versionRange"];
  v22 = [PKOSVersionRequirementRange alloc];
  if (v21)
  {
    v23 = [(PKOSVersionRequirementRange *)v22 initWithDictionary:v21];
    versionRange = self->_versionRange;
    self->_versionRange = v23;

    if (!self->_versionRange)
    {
      v25 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = 138412290;
        id v35 = v21;
        _os_log_impl(&dword_190E10000, v25, OS_LOG_TYPE_DEFAULT, "Invalid version range: %@", (uint8_t *)&v34, 0xCu);
      }

LABEL_31:
      v28 = 0;
      goto LABEL_32;
    }
  }
  else
  {
    v26 = [(PKOSVersionRequirementRange *)v22 initWithMinimumVersion:0 maximumVersion:0];
    v27 = self->_versionRange;
    self->_versionRange = v26;
  }
LABEL_26:
  self = self;
  v28 = self;
LABEL_32:

  return v28;
}

- (NSString)region
{
  return self->_region;
}

- (int64_t)registrationType
{
  return self->_registrationType;
}

- (float)enablementThreshold
{
  return self->_enablementThreshold;
}

- (BOOL)automaticRegister
{
  return self->_automaticRegister;
}

- (PKOSVersionRequirementRange)versionRange
{
  return self->_versionRange;
}

@end