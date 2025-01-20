@interface VSAppDescription
+ (BOOL)supportsSecureCoding;
- (BOOL)isDefaultAppForProvider;
- (BOOL)isEqual:(id)a3;
- (BOOL)offersInAppPurchases;
- (NSArray)deviceFamilies;
- (NSNumber)adamID;
- (NSNumber)appSizeBytes;
- (NSNumber)contentRank;
- (NSNumber)isVisionOSCompatible;
- (NSString)artworkURLTemplate;
- (NSString)bundleID;
- (NSString)buyParams;
- (NSString)displayName;
- (NSString)externalVersionID;
- (NSString)rating;
- (NSString)sellerName;
- (NSString)shortenedDisplayName;
- (NSURL)appStoreURL;
- (NSURL)licenseAgreementEndpointURL;
- (NSURL)privacyPolicyEndpointURL;
- (UIImage)icon;
- (VSAppDescription)init;
- (VSAppDescription)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)iconURLForSize:(CGSize)a3;
- (unint64_t)appType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAdamID:(id)a3;
- (void)setAppSizeBytes:(id)a3;
- (void)setAppStoreURL:(id)a3;
- (void)setAppType:(unint64_t)a3;
- (void)setArtworkURLTemplate:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setBuyParams:(id)a3;
- (void)setContentRank:(id)a3;
- (void)setDefaultAppForProvider:(BOOL)a3;
- (void)setDeviceFamilies:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setExternalVersionID:(id)a3;
- (void)setIcon:(id)a3;
- (void)setLicenseAgreementEndpointURL:(id)a3;
- (void)setOffersInAppPurchases:(BOOL)a3;
- (void)setPrivacyPolicyEndpointURL:(id)a3;
- (void)setRating:(id)a3;
- (void)setSellerName:(id)a3;
- (void)setVisionOSCompatible:(id)a3;
@end

@implementation VSAppDescription

- (VSAppDescription)init
{
  v5.receiver = self;
  v5.super_class = (Class)VSAppDescription;
  v2 = [(VSAppDescription *)&v5 init];
  if (v2)
  {
    v3 = VSAppDescriptionValueType();
    VSValueTypeInit();
  }
  return v2;
}

- (VSAppDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSAppDescription;
  objc_super v5 = [(VSAppDescription *)&v8 init];
  if (v5)
  {
    v6 = VSAppDescriptionValueType();
    VSValueTypeInitWithCoder();
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v3 = a3;
  VSAppDescriptionValueType();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = VSAppDescriptionValueType();
  id v4 = VSValueTypeCopyWithZone();

  return v4;
}

- (unint64_t)hash
{
  v2 = VSAppDescriptionValueType();
  unint64_t v3 = VSValueTypeHash();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  id v4 = VSAppDescriptionValueType();
  char IsEqual = VSValueTypeIsEqual();

  return IsEqual;
}

- (id)description
{
  v2 = VSAppDescriptionValueType();
  id v3 = VSValueTypeDescription();

  return v3;
}

- (id)iconURLForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v5 = [(VSAppDescription *)self artworkURLTemplate];
  v6 = [v5 stringByReplacingOccurrencesOfString:@"{f}" withString:@"png"];

  v7 = [NSNumber numberWithDouble:width];
  objc_super v8 = [v7 stringValue];
  v9 = [v6 stringByReplacingOccurrencesOfString:@"{w}" withString:v8];

  v10 = [NSNumber numberWithDouble:height];
  v11 = [v10 stringValue];
  v12 = [v9 stringByReplacingOccurrencesOfString:@"{h}" withString:v11];

  v13 = [v12 stringByReplacingOccurrencesOfString:@"{c}" withString:&stru_26F361E90];

  if (v13)
  {
    v14 = [NSURL URLWithString:v13];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)shortenedDisplayName
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  v2 = [(VSAppDescription *)self displayName];
  if (v2)
  {
    id v3 = v2;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    uint64_t v4 = [&unk_26F37E638 countByEnumeratingWithState:&v33 objects:v39 count:16];
    objc_super v5 = v3;
    if (v4)
    {
      uint64_t v6 = v4;
      uint64_t v7 = *(void *)v34;
      objc_super v5 = v3;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v34 != v7) {
            objc_enumerationMutation(&unk_26F37E638);
          }
          uint64_t v9 = [v5 rangeOfString:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          if (v9 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v10 = [v5 substringToIndex:v9];

            objc_super v5 = (void *)v10;
          }
        }
        uint64_t v6 = [&unk_26F37E638 countByEnumeratingWithState:&v33 objects:v39 count:16];
      }
      while (v6);
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v11 = [&unk_26F37E650 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(&unk_26F37E650);
          }
          v15 = *(void **)(*((void *)&v29 + 1) + 8 * j);
          if ([v5 hasPrefix:v15])
          {
            uint64_t v16 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v15, "length"));

            objc_super v5 = (void *)v16;
          }
        }
        uint64_t v12 = [&unk_26F37E650 countByEnumeratingWithState:&v29 objects:v38 count:16];
      }
      while (v12);
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v17 = [&unk_26F37E668 countByEnumeratingWithState:&v25 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t k = 0; k != v18; ++k)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(&unk_26F37E668);
          }
          v21 = *(void **)(*((void *)&v25 + 1) + 8 * k);
          if ([v5 hasSuffix:v21])
          {
            uint64_t v22 = objc_msgSend(v5, "substringToIndex:", objc_msgSend(v5, "length") - objc_msgSend(v21, "length"));

            objc_super v5 = (void *)v22;
          }
        }
        uint64_t v18 = [&unk_26F37E668 countByEnumeratingWithState:&v25 objects:v37 count:16];
      }
      while (v18);
    }
    v23 = (void *)[v5 copy];
  }
  else
  {
    v23 = 0;
  }
  return (NSString *)v23;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSString)sellerName
{
  return self->_sellerName;
}

- (void)setSellerName:(id)a3
{
}

- (NSString)externalVersionID
{
  return self->_externalVersionID;
}

- (void)setExternalVersionID:(id)a3
{
}

- (NSURL)appStoreURL
{
  return self->_appStoreURL;
}

- (void)setAppStoreURL:(id)a3
{
}

- (NSURL)privacyPolicyEndpointURL
{
  return self->_privacyPolicyEndpointURL;
}

- (void)setPrivacyPolicyEndpointURL:(id)a3
{
}

- (NSURL)licenseAgreementEndpointURL
{
  return self->_licenseAgreementEndpointURL;
}

- (void)setLicenseAgreementEndpointURL:(id)a3
{
}

- (NSString)rating
{
  return self->_rating;
}

- (void)setRating:(id)a3
{
}

- (NSNumber)contentRank
{
  return self->_contentRank;
}

- (void)setContentRank:(id)a3
{
}

- (BOOL)offersInAppPurchases
{
  return self->_offersInAppPurchases;
}

- (void)setOffersInAppPurchases:(BOOL)a3
{
  self->_offersInAppPurchases = a3;
}

- (unint64_t)appType
{
  return self->_appType;
}

- (void)setAppType:(unint64_t)a3
{
  self->_appType = a3;
}

- (NSNumber)appSizeBytes
{
  return self->_appSizeBytes;
}

- (void)setAppSizeBytes:(id)a3
{
}

- (NSString)artworkURLTemplate
{
  return self->_artworkURLTemplate;
}

- (void)setArtworkURLTemplate:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (BOOL)isDefaultAppForProvider
{
  return self->_defaultAppForProvider;
}

- (void)setDefaultAppForProvider:(BOOL)a3
{
  self->_defaultAppForProvider = a3;
}

- (NSNumber)isVisionOSCompatible
{
  return self->_visionOSCompatible;
}

- (void)setVisionOSCompatible:(id)a3
{
}

- (NSArray)deviceFamilies
{
  return self->_deviceFamilies;
}

- (void)setDeviceFamilies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceFamilies, 0);
  objc_storeStrong((id *)&self->_visionOSCompatible, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_artworkURLTemplate, 0);
  objc_storeStrong((id *)&self->_appSizeBytes, 0);
  objc_storeStrong((id *)&self->_contentRank, 0);
  objc_storeStrong((id *)&self->_rating, 0);
  objc_storeStrong((id *)&self->_licenseAgreementEndpointURL, 0);
  objc_storeStrong((id *)&self->_privacyPolicyEndpointURL, 0);
  objc_storeStrong((id *)&self->_appStoreURL, 0);
  objc_storeStrong((id *)&self->_externalVersionID, 0);
  objc_storeStrong((id *)&self->_sellerName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end