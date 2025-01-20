@interface NPKPassDescription
+ (BOOL)isCachingEnabled;
+ (BOOL)supportsSecureCoding;
+ (void)setCachingEnabled:(BOOL)a3;
- (BOOL)deletePending;
- (BOOL)hasAssociatedPeerPaymentAccount;
- (BOOL)hasStoredValue;
- (BOOL)hasUserSelectableContactlessPaymentApplications;
- (BOOL)hasValidNFCPayload;
- (BOOL)isAddValuePending;
- (BOOL)isCobranded;
- (BOOL)isEnroute;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPrivateLabel;
- (BOOL)lazyLoadEncodedImages;
- (NPKPassDescription)initWithCoder:(id)a3;
- (NPKPassDescription)initWithPass:(id)a3;
- (NPKPassDescription)initWithPass:(id)a3 lazyLoadEncodedImages:(BOOL)a4;
- (NSArray)availableActions;
- (NSArray)backFieldBuckets;
- (NSArray)frontFieldBuckets;
- (NSData)backgroundImageEncoded;
- (NSData)completeHash;
- (NSData)logoImageEncoded;
- (NSData)manifestHash;
- (NSDate)ingestionDate;
- (NSDate)pendingAddValueDate;
- (NSDate)relevantDate;
- (NSDecimalNumber)lastAddValueAmount;
- (NSNumber)groupID;
- (NSSet)devicePaymentApplications;
- (NSSet)subcredentials;
- (NSString)issuerCountryCode;
- (NSString)localizedDescription;
- (NSString)logoText;
- (NSString)organizationName;
- (NSString)passTypeIdentifier;
- (NSString)uniqueID;
- (PKColor)backgroundColor;
- (PKColor)foregroundColor;
- (PKColor)labelColor;
- (PKImage)backgroundImage;
- (PKImage)logoImage;
- (PKNFCPayload)nfcPayload;
- (PKPaymentApplication)devicePrimaryContactlessPaymentApplication;
- (PKPaymentApplication)devicePrimaryInAppPaymentApplication;
- (PKPaymentApplication)devicePrimaryPaymentApplication;
- (PKPaymentApplication)preferredPaymentApplication;
- (PKTransitAppletState)transitAppletState;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)encodeAsData:(id)a3;
- (id)fieldForKey:(id)a3;
- (id)transitProperties;
- (int64_t)effectiveContactlessPaymentApplicationState;
- (int64_t)effectivePaymentApplicationState;
- (int64_t)style;
- (unint64_t)expressPassTypesMask;
- (unint64_t)hash;
- (unint64_t)settings;
- (void)encodeObject:(id)a3 asDataInCoder:(id)a4 withKey:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setAvailableActions:(id)a3;
- (void)setBackFieldBuckets:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundImage:(id)a3;
- (void)setBackgroundImageEncoded:(id)a3;
- (void)setCobranded:(BOOL)a3;
- (void)setCompleteHash:(id)a3;
- (void)setDeletePending:(BOOL)a3;
- (void)setDevicePaymentApplications:(id)a3;
- (void)setDevicePrimaryContactlessPaymentApplication:(id)a3;
- (void)setDevicePrimaryInAppPaymentApplication:(id)a3;
- (void)setDevicePrimaryPaymentApplication:(id)a3;
- (void)setEffectivePaymentApplicationState:(int64_t)a3;
- (void)setExpressPassTypesMask:(unint64_t)a3;
- (void)setForegroundColor:(id)a3;
- (void)setFrontFieldBuckets:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setHasAssociatedPeerPaymentAccount:(BOOL)a3;
- (void)setHasStoredValue:(BOOL)a3;
- (void)setHasUserSelectableContactlessPaymentApplications:(BOOL)a3;
- (void)setIngestionDate:(id)a3;
- (void)setIssuerCountryCode:(id)a3;
- (void)setLabelColor:(id)a3;
- (void)setLastAddValueAmount:(id)a3;
- (void)setLazyLoadEncodedImages:(BOOL)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLogoImage:(id)a3;
- (void)setLogoImageEncoded:(id)a3;
- (void)setLogoText:(id)a3;
- (void)setManifestHash:(id)a3;
- (void)setNfcPayload:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPendingAddValueDate:(id)a3;
- (void)setPreferredPaymentApplication:(id)a3;
- (void)setPrivateLabel:(BOOL)a3;
- (void)setRelevantDate:(id)a3;
- (void)setSettings:(unint64_t)a3;
- (void)setStyle:(int64_t)a3;
- (void)setSubcredentials:(id)a3;
- (void)setTransitAppletState:(id)a3;
- (void)setUniqueID:(id)a3;
@end

@implementation NPKPassDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)isCachingEnabled
{
  if (__InitializeCachingIfNecessary_onceToken != -1) {
    dispatch_once(&__InitializeCachingIfNecessary_onceToken, &__block_literal_global_6);
  }
  return __IsCachingEnabled;
}

+ (void)setCachingEnabled:(BOOL)a3
{
  if (__InitializeCachingIfNecessary_onceToken != -1) {
    dispatch_once(&__InitializeCachingIfNecessary_onceToken, &__block_literal_global_6);
  }
  __IsCachingEnabled = a3;
}

- (NPKPassDescription)initWithPass:(id)a3
{
  return [(NPKPassDescription *)self initWithPass:a3 lazyLoadEncodedImages:0];
}

- (NPKPassDescription)initWithPass:(id)a3 lazyLoadEncodedImages:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)NPKPassDescription;
  v7 = [(NPKPassDescription *)&v41 init];
  if (v7)
  {
    v8 = [v6 paymentPass];
    [(NPKPassDescription *)v7 setLazyLoadEncodedImages:v4];
    v9 = [v6 uniqueID];
    [(NPKPassDescription *)v7 setUniqueID:v9];

    v10 = [v6 passTypeIdentifier];
    [(NPKPassDescription *)v7 setPassTypeIdentifier:v10];

    v11 = [v6 npkCompleteHash];
    [(NPKPassDescription *)v7 setManifestHash:v11];

    -[NPKPassDescription setStyle:](v7, "setStyle:", [v6 style]);
    v12 = [v6 relevantDate];
    [(NPKPassDescription *)v7 setRelevantDate:v12];

    v13 = [v6 logoText];
    [(NPKPassDescription *)v7 setLogoText:v13];

    v14 = [v6 logoImage];
    [(NPKPassDescription *)v7 setLogoImage:v14];

    v15 = [v6 displayProfile];
    v16 = [v15 backgroundColor];
    [(NPKPassDescription *)v7 setBackgroundColor:v16];

    v17 = [v6 displayProfile];
    v18 = [v17 foregroundColor];
    [(NPKPassDescription *)v7 setForegroundColor:v18];

    v19 = [v6 displayProfile];
    v20 = [v19 labelColor];
    [(NPKPassDescription *)v7 setLabelColor:v20];

    v21 = [v6 ingestedDate];
    [(NPKPassDescription *)v7 setIngestionDate:v21];

    v22 = [v8 devicePaymentApplications];
    [(NPKPassDescription *)v7 setDevicePaymentApplications:v22];

    v23 = [v8 devicePrimaryPaymentApplication];
    [(NPKPassDescription *)v7 setDevicePrimaryPaymentApplication:v23];

    v24 = [v8 devicePrimaryContactlessPaymentApplication];
    [(NPKPassDescription *)v7 setDevicePrimaryContactlessPaymentApplication:v24];

    v25 = [v8 devicePrimaryInAppPaymentApplication];
    [(NPKPassDescription *)v7 setDevicePrimaryInAppPaymentApplication:v25];

    -[NPKPassDescription setPrivateLabel:](v7, "setPrivateLabel:", [v8 isPrivateLabel]);
    -[NPKPassDescription setCobranded:](v7, "setCobranded:", [v8 isCobranded]);
    [(NPKPassDescription *)v7 setDeletePending:0];
    v26 = [v6 backgroundImage];

    if (v26)
    {
      if ([v6 style] == 2)
      {
        v27 = (void *)MEMORY[0x263F5BEE0];
        v28 = [v6 backgroundImage];
        [v28 size];
        v29 = objc_msgSend(v27, "constraintsWithFixedSize:");

        v30 = [v6 backgroundImage];
        v31 = [v30 blurredImageWithRadius:27 constraints:v29];
        [(NPKPassDescription *)v7 setBackgroundImage:v31];
      }
      else
      {
        v29 = [v6 backgroundImage];
        [(NPKPassDescription *)v7 setBackgroundImage:v29];
      }
    }
    v32 = [v6 localizedDescription];
    [(NPKPassDescription *)v7 setLocalizedDescription:v32];

    v33 = [v6 nfcPayload];
    [(NPKPassDescription *)v7 setNfcPayload:v33];

    v34 = [v6 npkCompleteHash];
    [(NPKPassDescription *)v7 setCompleteHash:v34];

    -[NPKPassDescription setHasStoredValue:](v7, "setHasStoredValue:", [v6 hasStoredValue]);
    -[NPKPassDescription setSettings:](v7, "setSettings:", [v6 settings]);
    v35 = [v8 issuerCountryCode];
    [(NPKPassDescription *)v7 setIssuerCountryCode:v35];

    v36 = [v8 availableActions];
    [(NPKPassDescription *)v7 setAvailableActions:v36];

    v37 = [v6 organizationName];
    [(NPKPassDescription *)v7 setOrganizationName:v37];

    [(NPKPassDescription *)v7 setExpressPassTypesMask:NPKPassDescriptionExpressTypesMaskWithPass(v6)];
    -[NPKPassDescription setHasAssociatedPeerPaymentAccount:](v7, "setHasAssociatedPeerPaymentAccount:", [v8 hasAssociatedPeerPaymentAccount]);
    v38 = [v8 devicePrimaryPaymentApplication];
    v39 = [v38 subcredentials];
    [(NPKPassDescription *)v7 setSubcredentials:v39];
  }
  return v7;
}

- (NPKPassDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)NPKPassDescription;
  v5 = [(NPKPassDescription *)&v54 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"uniqueID"];
    [(NPKPassDescription *)v5 setUniqueID:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupID"];
    [(NPKPassDescription *)v5 setGroupID:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passTypeIdentifier"];
    [(NPKPassDescription *)v5 setPassTypeIdentifier:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"manifestHash"];
    [(NPKPassDescription *)v5 setManifestHash:v9];

    -[NPKPassDescription setStyle:](v5, "setStyle:", [v4 decodeIntegerForKey:@"style"]);
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"relevantDate"];
    [(NPKPassDescription *)v5 setRelevantDate:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ingestionDate"];
    [(NPKPassDescription *)v5 setIngestionDate:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logoText"];
    [(NPKPassDescription *)v5 setLogoText:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundColor"];
    [(NPKPassDescription *)v5 setBackgroundColor:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"foregroundColor"];
    [(NPKPassDescription *)v5 setForegroundColor:v14];

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"labelColor"];
    [(NPKPassDescription *)v5 setLabelColor:v15];

    v16 = (void *)MEMORY[0x263EFFA08];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v19 = [v4 decodeObjectOfClasses:v18 forKey:@"devicePaymentApplications"];
    [(NPKPassDescription *)v5 setDevicePaymentApplications:v19];

    v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"devicePrimaryPaymentApplication"];
    [(NPKPassDescription *)v5 setDevicePrimaryPaymentApplication:v20];

    v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"devicePrimaryContactlessPaymentApplication"];
    [(NPKPassDescription *)v5 setDevicePrimaryContactlessPaymentApplication:v21];

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"devicePrimaryInAppPaymentApplication"];
    [(NPKPassDescription *)v5 setDevicePrimaryInAppPaymentApplication:v22];

    v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preferredPaymentApplication"];
    [(NPKPassDescription *)v5 setPreferredPaymentApplication:v23];

    -[NPKPassDescription setEffectivePaymentApplicationState:](v5, "setEffectivePaymentApplicationState:", [v4 decodeIntegerForKey:@"effectivePaymentApplicationState"]);
    -[NPKPassDescription setPrivateLabel:](v5, "setPrivateLabel:", [v4 decodeBoolForKey:@"privateLabel"]);
    -[NPKPassDescription setCobranded:](v5, "setCobranded:", [v4 decodeBoolForKey:@"cobranded"]);
    -[NPKPassDescription setDeletePending:](v5, "setDeletePending:", [v4 decodeBoolForKey:@"deletePending"]);
    -[NPKPassDescription setHasUserSelectableContactlessPaymentApplications:](v5, "setHasUserSelectableContactlessPaymentApplications:", [v4 decodeBoolForKey:@"hasUserSelectablePaymentApplications"]);
    v24 = [(NPKPassDescription *)v5 logoImage];

    if (!v24)
    {
      v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"logoImageEncoded"];
      [(NPKPassDescription *)v5 setLogoImageEncoded:v25];
    }
    v26 = [(NPKPassDescription *)v5 backgroundImage];

    if (!v26)
    {
      v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backgroundImageEncoded"];
      [(NPKPassDescription *)v5 setBackgroundImageEncoded:v27];
    }
    v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedDescription"];
    [(NPKPassDescription *)v5 setLocalizedDescription:v28];

    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nfcPayload"];
    [(NPKPassDescription *)v5 setNfcPayload:v29];

    v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"completeHash"];
    [(NPKPassDescription *)v5 setCompleteHash:v30];

    -[NPKPassDescription setHasStoredValue:](v5, "setHasStoredValue:", [v4 decodeBoolForKey:@"hasStoredValue"]);
    v31 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"settings"];
    v32 = v31;
    if (v31)
    {
      uint64_t v33 = [v31 unsignedIntegerValue];
    }
    else if ([(NPKPassDescription *)v5 style] == 6)
    {
      uint64_t v33 = 72;
    }
    else
    {
      uint64_t v33 = 3;
    }
    [(NPKPassDescription *)v5 setSettings:v33];
    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"issuerCountryCode"];
    [(NPKPassDescription *)v5 setIssuerCountryCode:v34];

    v35 = (void *)MEMORY[0x263EFFA08];
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v35, "setWithObjects:", v36, objc_opt_class(), 0);
    v38 = [v4 decodeObjectOfClasses:v37 forKey:@"availableActions"];
    [(NPKPassDescription *)v5 setAvailableActions:v38];

    v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"organizationName"];
    [(NPKPassDescription *)v5 setOrganizationName:v39];

    v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"felicaTransitAppletState"];
    [(NPKPassDescription *)v5 setTransitAppletState:v40];

    objc_super v41 = (void *)MEMORY[0x263EFFA08];
    uint64_t v42 = objc_opt_class();
    v43 = objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
    v44 = [v4 decodeObjectOfClasses:v43 forKey:@"frontFieldBuckets"];
    [(NPKPassDescription *)v5 setFrontFieldBuckets:v44];

    v45 = (void *)MEMORY[0x263EFFA08];
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v45, "setWithObjects:", v46, objc_opt_class(), 0);
    v48 = [v4 decodeObjectOfClasses:v47 forKey:@"backFieldBuckets"];
    [(NPKPassDescription *)v5 setBackFieldBuckets:v48];

    v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastAddValueAmount"];
    [(NPKPassDescription *)v5 setLastAddValueAmount:v49];

    v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pendingAddValueDate"];
    [(NPKPassDescription *)v5 setPendingAddValueDate:v50];

    -[NPKPassDescription setExpressPassTypesMask:](v5, "setExpressPassTypesMask:", [v4 decodeIntegerForKey:@"expressPassTypesMask"]);
    -[NPKPassDescription setHasAssociatedPeerPaymentAccount:](v5, "setHasAssociatedPeerPaymentAccount:", [v4 decodeBoolForKey:@"hasAssociatedPeerPaymentAccount"]);
    v51 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    v52 = [v4 decodeObjectOfClasses:v51 forKey:@"subcredentials"];
    [(NPKPassDescription *)v5 setSubcredentials:v52];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NPKPassDescription *)self uniqueID];
  [v4 encodeObject:v5 forKey:@"uniqueID"];

  id v6 = [(NPKPassDescription *)self groupID];
  [v4 encodeObject:v6 forKey:@"groupID"];

  v7 = [(NPKPassDescription *)self passTypeIdentifier];
  [v4 encodeObject:v7 forKey:@"passTypeIdentifier"];

  v8 = [(NPKPassDescription *)self manifestHash];
  [v4 encodeObject:v8 forKey:@"manifestHash"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[NPKPassDescription style](self, "style"), @"style");
  v9 = [(NPKPassDescription *)self relevantDate];
  [v4 encodeObject:v9 forKey:@"relevantDate"];

  v10 = [(NPKPassDescription *)self ingestionDate];
  [v4 encodeObject:v10 forKey:@"ingestionDate"];

  v11 = [(NPKPassDescription *)self logoText];
  [v4 encodeObject:v11 forKey:@"logoText"];

  v12 = [(NPKPassDescription *)self backgroundColor];
  [v4 encodeObject:v12 forKey:@"backgroundColor"];

  v13 = [(NPKPassDescription *)self foregroundColor];
  [v4 encodeObject:v13 forKey:@"foregroundColor"];

  v14 = [(NPKPassDescription *)self labelColor];
  [v4 encodeObject:v14 forKey:@"labelColor"];

  v15 = [(NPKPassDescription *)self devicePaymentApplications];
  [v4 encodeObject:v15 forKey:@"devicePaymentApplications"];

  v16 = [(NPKPassDescription *)self devicePrimaryPaymentApplication];
  [v4 encodeObject:v16 forKey:@"devicePrimaryPaymentApplication"];

  uint64_t v17 = [(NPKPassDescription *)self devicePrimaryContactlessPaymentApplication];
  [v4 encodeObject:v17 forKey:@"devicePrimaryContactlessPaymentApplication"];

  v18 = [(NPKPassDescription *)self devicePrimaryInAppPaymentApplication];
  [v4 encodeObject:v18 forKey:@"devicePrimaryInAppPaymentApplication"];

  v19 = [(NPKPassDescription *)self preferredPaymentApplication];
  [v4 encodeObject:v19 forKey:@"preferredPaymentApplication"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[NPKPassDescription effectivePaymentApplicationState](self, "effectivePaymentApplicationState"), @"effectivePaymentApplicationState");
  objc_msgSend(v4, "encodeBool:forKey:", -[NPKPassDescription isPrivateLabel](self, "isPrivateLabel"), @"privateLabel");
  objc_msgSend(v4, "encodeBool:forKey:", -[NPKPassDescription isCobranded](self, "isCobranded"), @"cobranded");
  objc_msgSend(v4, "encodeBool:forKey:", -[NPKPassDescription deletePending](self, "deletePending"), @"deletePending");
  objc_msgSend(v4, "encodeBool:forKey:", -[NPKPassDescription hasUserSelectableContactlessPaymentApplications](self, "hasUserSelectableContactlessPaymentApplications"), @"hasUserSelectablePaymentApplications");
  v20 = [(NPKPassDescription *)self logoImageEncoded];
  [v4 encodeObject:v20 forKey:@"logoImageEncoded"];

  v21 = [(NPKPassDescription *)self backgroundImageEncoded];
  [v4 encodeObject:v21 forKey:@"backgroundImageEncoded"];

  v22 = [(NPKPassDescription *)self localizedDescription];
  [v4 encodeObject:v22 forKey:@"localizedDescription"];

  v23 = [(NPKPassDescription *)self nfcPayload];
  [v4 encodeObject:v23 forKey:@"nfcPayload"];

  v24 = [(NPKPassDescription *)self completeHash];
  [v4 encodeObject:v24 forKey:@"completeHash"];

  objc_msgSend(v4, "encodeBool:forKey:", -[NPKPassDescription hasStoredValue](self, "hasStoredValue"), @"hasStoredValue");
  v25 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NPKPassDescription settings](self, "settings"));
  [v4 encodeObject:v25 forKey:@"settings"];

  v26 = [(NPKPassDescription *)self issuerCountryCode];
  [v4 encodeObject:v26 forKey:@"issuerCountryCode"];

  v27 = [(NPKPassDescription *)self availableActions];
  [v4 encodeObject:v27 forKey:@"availableActions"];

  v28 = [(NPKPassDescription *)self organizationName];
  [v4 encodeObject:v28 forKey:@"organizationName"];

  v29 = [(NPKPassDescription *)self transitAppletState];
  [v4 encodeObject:v29 forKey:@"felicaTransitAppletState"];

  v30 = [(NPKPassDescription *)self frontFieldBuckets];
  [v4 encodeObject:v30 forKey:@"frontFieldBuckets"];

  v31 = [(NPKPassDescription *)self backFieldBuckets];
  [v4 encodeObject:v31 forKey:@"backFieldBuckets"];

  v32 = [(NPKPassDescription *)self lastAddValueAmount];
  [v4 encodeObject:v32 forKey:@"lastAddValueAmount"];

  uint64_t v33 = [(NPKPassDescription *)self pendingAddValueDate];
  [v4 encodeObject:v33 forKey:@"pendingAddValueDate"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[NPKPassDescription expressPassTypesMask](self, "expressPassTypesMask"), @"expressPassTypesMask");
  objc_msgSend(v4, "encodeBool:forKey:", -[NPKPassDescription hasAssociatedPeerPaymentAccount](self, "hasAssociatedPeerPaymentAccount"), @"hasAssociatedPeerPaymentAccount");
  id v34 = [(NPKPassDescription *)self subcredentials];
  [v4 encodeObject:v34 forKey:@"subcredentials"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(NPKPassDescription);
  objc_storeStrong((id *)&v4->_uniqueID, self->_uniqueID);
  objc_storeStrong((id *)&v4->_groupID, self->_groupID);
  objc_storeStrong((id *)&v4->_passTypeIdentifier, self->_passTypeIdentifier);
  objc_storeStrong((id *)&v4->_manifestHash, self->_manifestHash);
  v4->_style = self->_style;
  objc_storeStrong((id *)&v4->_relevantDate, self->_relevantDate);
  objc_storeStrong((id *)&v4->_ingestionDate, self->_ingestionDate);
  objc_storeStrong((id *)&v4->_logoText, self->_logoText);
  objc_storeStrong((id *)&v4->_logoImage, self->_logoImage);
  objc_storeStrong((id *)&v4->_logoImageEncoded, self->_logoImageEncoded);
  objc_storeStrong((id *)&v4->_backgroundColor, self->_backgroundColor);
  objc_storeStrong((id *)&v4->_foregroundColor, self->_foregroundColor);
  objc_storeStrong((id *)&v4->_labelColor, self->_labelColor);
  objc_storeStrong((id *)&v4->_backgroundImage, self->_backgroundImage);
  objc_storeStrong((id *)&v4->_backgroundImageEncoded, self->_backgroundImageEncoded);
  objc_storeStrong((id *)&v4->_localizedDescription, self->_localizedDescription);
  objc_storeStrong((id *)&v4->_devicePaymentApplications, self->_devicePaymentApplications);
  objc_storeStrong((id *)&v4->_devicePrimaryPaymentApplication, self->_devicePrimaryPaymentApplication);
  objc_storeStrong((id *)&v4->_devicePrimaryContactlessPaymentApplication, self->_devicePrimaryContactlessPaymentApplication);
  objc_storeStrong((id *)&v4->_devicePrimaryInAppPaymentApplication, self->_devicePrimaryInAppPaymentApplication);
  objc_storeStrong((id *)&v4->_preferredPaymentApplication, self->_preferredPaymentApplication);
  v4->_effectivePaymentApplicationState = self->_effectivePaymentApplicationState;
  v4->_privateLabel = self->_privateLabel;
  v4->_cobranded = self->_cobranded;
  v4->_deletePending = self->_deletePending;
  v4->_hasUserSelectableContactlessPaymentApplications = self->_hasUserSelectableContactlessPaymentApplications;
  objc_storeStrong((id *)&v4->_backgroundColor, self->_backgroundColor);
  objc_storeStrong((id *)&v4->_nfcPayload, self->_nfcPayload);
  objc_storeStrong((id *)&v4->_completeHash, self->_completeHash);
  v4->_hasStoredValue = self->_hasStoredValue;
  v4->_settings = self->_settings;
  objc_storeStrong((id *)&v4->_issuerCountryCode, self->_issuerCountryCode);
  objc_storeStrong((id *)&v4->_availableActions, self->_availableActions);
  objc_storeStrong((id *)&v4->_organizationName, self->_organizationName);
  objc_storeStrong((id *)&v4->_transitAppletState, self->_transitAppletState);
  objc_storeStrong((id *)&v4->_frontFieldBuckets, self->_frontFieldBuckets);
  objc_storeStrong((id *)&v4->_backFieldBuckets, self->_backFieldBuckets);
  objc_storeStrong((id *)&v4->_lastAddValueAmount, self->_lastAddValueAmount);
  objc_storeStrong((id *)&v4->_pendingAddValueDate, self->_pendingAddValueDate);
  v4->_expressPassTypesMask = self->_expressPassTypesMask;
  v4->_hasAssociatedPeerPaymentAccount = self->_hasAssociatedPeerPaymentAccount;
  objc_storeStrong((id *)&v4->_subcredentials, self->_subcredentials);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NPKPassDescription *)a3;
  if (self == v4)
  {
    BOOL v37 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_74;
    }
    uniqueID = self->_uniqueID;
    if ((unint64_t)uniqueID | (unint64_t)v4->_uniqueID)
    {
      if (!-[NSString isEqualToString:](uniqueID, "isEqualToString:")) {
        goto LABEL_74;
      }
    }
    groupID = self->_groupID;
    if ((unint64_t)groupID | (unint64_t)v4->_groupID)
    {
      if (!-[NSNumber isEqual:](groupID, "isEqual:")) {
        goto LABEL_74;
      }
    }
    passTypeIdentifier = self->_passTypeIdentifier;
    if ((unint64_t)passTypeIdentifier | (unint64_t)v4->_passTypeIdentifier)
    {
      if (!-[NSString isEqualToString:](passTypeIdentifier, "isEqualToString:")) {
        goto LABEL_74;
      }
    }
    manifestHash = self->_manifestHash;
    if ((unint64_t)manifestHash | (unint64_t)v4->_manifestHash)
    {
      if (!-[NSData isEqualToData:](manifestHash, "isEqualToData:")) {
        goto LABEL_74;
      }
    }
    if (self->_style != v4->_style) {
      goto LABEL_74;
    }
    relevantDate = self->_relevantDate;
    if ((unint64_t)relevantDate | (unint64_t)v4->_relevantDate)
    {
      if (!-[NSDate isEqualToDate:](relevantDate, "isEqualToDate:")) {
        goto LABEL_74;
      }
    }
    ingestionDate = self->_ingestionDate;
    if ((unint64_t)ingestionDate | (unint64_t)v4->_ingestionDate)
    {
      if (!-[NSDate isEqualToDate:](ingestionDate, "isEqualToDate:")) {
        goto LABEL_74;
      }
    }
    logoText = self->_logoText;
    if ((unint64_t)logoText | (unint64_t)v4->_logoText)
    {
      if (!-[NSString isEqualToString:](logoText, "isEqualToString:")) {
        goto LABEL_74;
      }
    }
    logoImageEncoded = self->_logoImageEncoded;
    if ((unint64_t)logoImageEncoded | (unint64_t)v4->_logoImageEncoded)
    {
      if (!-[NSData isEqualToData:](logoImageEncoded, "isEqualToData:")) {
        goto LABEL_74;
      }
    }
    backgroundColor = self->_backgroundColor;
    if (backgroundColor || v4->_backgroundColor)
    {
      uint64_t v14 = [(PKColor *)backgroundColor hash];
      if (v14 != [(PKColor *)v4->_backgroundColor hash]) {
        goto LABEL_74;
      }
    }
    foregroundColor = self->_foregroundColor;
    if (foregroundColor || v4->_foregroundColor)
    {
      uint64_t v16 = [(PKColor *)foregroundColor hash];
      if (v16 != [(PKColor *)v4->_foregroundColor hash]) {
        goto LABEL_74;
      }
    }
    labelColor = self->_labelColor;
    if (labelColor || v4->_labelColor)
    {
      uint64_t v18 = [(PKColor *)labelColor hash];
      if (v18 != [(PKColor *)v4->_labelColor hash]) {
        goto LABEL_74;
      }
    }
    localizedDescription = self->_localizedDescription;
    if ((unint64_t)localizedDescription | (unint64_t)v4->_localizedDescription
      && !-[NSString isEqualToString:](localizedDescription, "isEqualToString:"))
    {
      goto LABEL_74;
    }
    backgroundImageEncoded = self->_backgroundImageEncoded;
    if ((unint64_t)backgroundImageEncoded | (unint64_t)v4->_backgroundImageEncoded
      && !-[NSData isEqualToData:](backgroundImageEncoded, "isEqualToData:"))
    {
      goto LABEL_74;
    }
    devicePaymentApplications = self->_devicePaymentApplications;
    if ((unint64_t)devicePaymentApplications | (unint64_t)v4->_devicePaymentApplications
      && !-[NSSet isEqual:](devicePaymentApplications, "isEqual:"))
    {
      goto LABEL_74;
    }
    devicePrimaryPaymentApplication = self->_devicePrimaryPaymentApplication;
    if ((unint64_t)devicePrimaryPaymentApplication | (unint64_t)v4->_devicePrimaryPaymentApplication
      && !-[PKPaymentApplication isEqual:](devicePrimaryPaymentApplication, "isEqual:"))
    {
      goto LABEL_74;
    }
    devicePrimaryContactlessPaymentApplication = self->_devicePrimaryContactlessPaymentApplication;
    if ((unint64_t)devicePrimaryContactlessPaymentApplication | (unint64_t)v4->_devicePrimaryContactlessPaymentApplication
      && !-[PKPaymentApplication isEqual:](devicePrimaryContactlessPaymentApplication, "isEqual:"))
    {
      goto LABEL_74;
    }
    devicePrimaryInAppPaymentApplication = self->_devicePrimaryInAppPaymentApplication;
    if ((unint64_t)devicePrimaryInAppPaymentApplication | (unint64_t)v4->_devicePrimaryInAppPaymentApplication
      && !-[PKPaymentApplication isEqual:](devicePrimaryInAppPaymentApplication, "isEqual:"))
    {
      goto LABEL_74;
    }
    preferredPaymentApplication = self->_preferredPaymentApplication;
    if ((unint64_t)preferredPaymentApplication | (unint64_t)v4->_preferredPaymentApplication
      && !-[PKPaymentApplication isEqual:](preferredPaymentApplication, "isEqual:"))
    {
      goto LABEL_74;
    }
    if (self->_effectivePaymentApplicationState != v4->_effectivePaymentApplicationState) {
      goto LABEL_74;
    }
    if (self->_privateLabel != v4->_privateLabel) {
      goto LABEL_74;
    }
    if (self->_cobranded != v4->_cobranded) {
      goto LABEL_74;
    }
    if (self->_deletePending != v4->_deletePending) {
      goto LABEL_74;
    }
    if (self->_hasUserSelectableContactlessPaymentApplications != v4->_hasUserSelectableContactlessPaymentApplications) {
      goto LABEL_74;
    }
    nfcPayload = self->_nfcPayload;
    if ((unint64_t)nfcPayload | (unint64_t)v4->_nfcPayload)
    {
      if (!-[PKNFCPayload isEqual:](nfcPayload, "isEqual:")) {
        goto LABEL_74;
      }
    }
    completeHash = self->_completeHash;
    if ((unint64_t)completeHash | (unint64_t)v4->_completeHash
      && !-[NSData isEqual:](completeHash, "isEqual:"))
    {
      goto LABEL_74;
    }
    if (self->_hasStoredValue != v4->_hasStoredValue) {
      goto LABEL_74;
    }
    if (self->_settings != v4->_settings) {
      goto LABEL_74;
    }
    issuerCountryCode = self->_issuerCountryCode;
    if ((unint64_t)issuerCountryCode | (unint64_t)v4->_issuerCountryCode)
    {
      if (!-[NSString isEqualToString:](issuerCountryCode, "isEqualToString:")) {
        goto LABEL_74;
      }
    }
    availableActions = self->_availableActions;
    if ((unint64_t)availableActions | (unint64_t)v4->_availableActions
      && !-[NSArray isEqual:](availableActions, "isEqual:"))
    {
      goto LABEL_74;
    }
    if (((organizationName = self->_organizationName,
           !((unint64_t)organizationName | (unint64_t)v4->_organizationName))
       || -[NSString isEqual:](organizationName, "isEqual:"))
      && ((transitAppletState = self->_transitAppletState,
           !((unint64_t)transitAppletState | (unint64_t)v4->_transitAppletState))
       || -[PKTransitAppletState isEqual:](transitAppletState, "isEqual:"))
      && ((frontFieldBuckets = self->_frontFieldBuckets,
           !((unint64_t)frontFieldBuckets | (unint64_t)v4->_frontFieldBuckets))
       || -[NSArray isEqual:](frontFieldBuckets, "isEqual:"))
      && ((backFieldBuckets = self->_backFieldBuckets,
           !((unint64_t)backFieldBuckets | (unint64_t)v4->_backFieldBuckets))
       || -[NSArray isEqual:](backFieldBuckets, "isEqual:"))
      && ((lastAddValueAmount = self->_lastAddValueAmount,
           !((unint64_t)lastAddValueAmount | (unint64_t)v4->_lastAddValueAmount))
       || -[NSDecimalNumber isEqual:](lastAddValueAmount, "isEqual:"))
      && ((pendingAddValueDate = self->_pendingAddValueDate,
           !((unint64_t)pendingAddValueDate | (unint64_t)v4->_pendingAddValueDate))
       || -[NSDate isEqual:](pendingAddValueDate, "isEqual:"))
      && self->_expressPassTypesMask == v4->_expressPassTypesMask
      && ((subcredentials = self->_subcredentials,
           !((unint64_t)subcredentials | (unint64_t)v4->_subcredentials))
       || -[NSSet isEqual:](subcredentials, "isEqual:")))
    {
      BOOL v37 = self->_hasAssociatedPeerPaymentAccount == v4->_hasAssociatedPeerPaymentAccount;
    }
    else
    {
LABEL_74:
      BOOL v37 = 0;
    }
  }

  return v37;
}

- (unint64_t)hash
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  uniqueID = self->_uniqueID;
  long long v32 = *(_OWORD *)&self->_groupID;
  int64_t style = self->_style;
  manifestHash = self->_manifestHash;
  v30 = [NSNumber numberWithInteger:style];
  id v34 = v30;
  long long v35 = *(_OWORD *)&self->_relevantDate;
  backgroundColor = self->_backgroundColor;
  backgroundImageEncoded = self->_backgroundImageEncoded;
  logoImageEncoded = self->_logoImageEncoded;
  logoText = self->_logoText;
  BOOL v37 = logoImageEncoded;
  v38 = backgroundColor;
  long long v39 = *(_OWORD *)&self->_foregroundColor;
  localizedDescription = self->_localizedDescription;
  devicePaymentApplications = self->_devicePaymentApplications;
  v40 = backgroundImageEncoded;
  objc_super v41 = localizedDescription;
  devicePrimaryPaymentApplication = self->_devicePrimaryPaymentApplication;
  uint64_t v42 = devicePaymentApplications;
  v43 = devicePrimaryPaymentApplication;
  long long v44 = *(_OWORD *)&self->_devicePrimaryContactlessPaymentApplication;
  int64_t effectivePaymentApplicationState = self->_effectivePaymentApplicationState;
  preferredPaymentApplication = self->_preferredPaymentApplication;
  v29 = [NSNumber numberWithInteger:effectivePaymentApplicationState];
  uint64_t v46 = v29;
  v11 = [NSNumber numberWithBool:self->_privateLabel];
  v47 = v11;
  v12 = [NSNumber numberWithBool:self->_cobranded];
  v48 = v12;
  v13 = [NSNumber numberWithBool:self->_deletePending];
  v49 = v13;
  uint64_t v14 = [NSNumber numberWithBool:self->_hasUserSelectableContactlessPaymentApplications];
  nfcPayload = self->_nfcPayload;
  completeHash = self->_completeHash;
  v50 = v14;
  v51 = nfcPayload;
  v52 = completeHash;
  uint64_t v17 = [NSNumber numberWithBool:self->_hasStoredValue];
  v53 = v17;
  uint64_t v18 = [NSNumber numberWithUnsignedInteger:self->_settings];
  issuerCountryCode = self->_issuerCountryCode;
  availableActions = self->_availableActions;
  objc_super v54 = v18;
  v55 = issuerCountryCode;
  v56 = availableActions;
  long long v57 = *(_OWORD *)&self->_organizationName;
  frontFieldBuckets = self->_frontFieldBuckets;
  long long v59 = *(_OWORD *)&self->_backFieldBuckets;
  pendingAddValueDate = self->_pendingAddValueDate;
  v58 = frontFieldBuckets;
  v60 = pendingAddValueDate;
  v23 = [NSNumber numberWithUnsignedInteger:self->_expressPassTypesMask];
  v61 = v23;
  v24 = [NSNumber numberWithBool:self->_hasAssociatedPeerPaymentAccount];
  subcredentials = self->_subcredentials;
  v62 = v24;
  v63 = subcredentials;
  v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&uniqueID count:39];
  unint64_t v27 = PKCombinedHash();

  return v27;
}

- (id)description
{
  uint64_t v36 = NSString;
  v48.receiver = self;
  v48.super_class = (Class)NPKPassDescription;
  v47 = [(NPKPassDescription *)&v48 description];
  uint64_t v46 = [(NPKPassDescription *)self uniqueID];
  v45 = [(NPKPassDescription *)self groupID];
  long long v44 = [(NPKPassDescription *)self passTypeIdentifier];
  v43 = [(NPKPassDescription *)self manifestHash];
  int64_t v35 = [(NPKPassDescription *)self style];
  uint64_t v42 = [(NPKPassDescription *)self relevantDate];
  objc_super v41 = [(NPKPassDescription *)self ingestionDate];
  v40 = [(NPKPassDescription *)self logoText];
  logoImage = self->_logoImage;
  v38 = [(NPKPassDescription *)self logoImageEncoded];
  long long v39 = [(NPKPassDescription *)self backgroundColor];
  id v34 = [(NPKPassDescription *)self foregroundColor];
  uint64_t v33 = [(NPKPassDescription *)self labelColor];
  backgroundImage = self->_backgroundImage;
  long long v32 = [(NPKPassDescription *)self backgroundImageEncoded];
  v31 = [(NPKPassDescription *)self localizedDescription];
  v29 = [(NPKPassDescription *)self devicePaymentApplications];
  v28 = [(NPKPassDescription *)self devicePrimaryPaymentApplication];
  unint64_t v27 = [(NPKPassDescription *)self devicePrimaryContactlessPaymentApplication];
  v22 = [(NPKPassDescription *)self devicePrimaryInAppPaymentApplication];
  v26 = [(NPKPassDescription *)self preferredPaymentApplication];
  int64_t v24 = [(NPKPassDescription *)self effectivePaymentApplicationState];
  BOOL v23 = [(NPKPassDescription *)self isPrivateLabel];
  BOOL v3 = [(NPKPassDescription *)self isCobranded];
  BOOL v4 = [(NPKPassDescription *)self deletePending];
  BOOL v5 = [(NPKPassDescription *)self hasUserSelectableContactlessPaymentApplications];
  v21 = [(NPKPassDescription *)self nfcPayload];
  id v6 = [(NPKPassDescription *)self completeHash];
  BOOL v7 = [(NPKPassDescription *)self hasStoredValue];
  unint64_t v8 = [(NPKPassDescription *)self settings];
  v20 = [(NPKPassDescription *)self issuerCountryCode];
  objc_msgSend(v36, "stringWithFormat:", @"<%@> (uniqueID %@ groupID %@ passTypeIdentifier %@ manifestHash %@ style %d relevantDate %@ ingestionDate %@ logoText %@ logoImage %@ logoImageEncoded %p backgroundColor %@ foregroundColor %@ labelColor %@ backgroundImage %@ backgroundImageEncoded %p, localizedDescription %@, devicePaymentApplications (%@) devicePrimaryPaymentApplication (%@) devicePrimaryContactlessPaymentApplication (%@) devicePrimaryInAppPaymentApplication (%@) preferredPaymentApplication (%@) effectivePaymentApplicationState %d privateLabel %d cobranded %d deletePending %d hasUserSelectableContactlessPaymentApplications %d nfcPayload %@ completeHash %@ hasStoredValue %d settings %d issuerCountryCode %@ expressPassTypesMask %lu)", v47, v46, v45, v44, v43, v35, v42, v41, v40, logoImage, v38, v39, v34, v33, backgroundImage, v32,
    v31,
    v29,
    v28,
    v27,
    v22,
    v26,
    v24,
    v23,
    v3,
    v4,
    v5,
    v21,
    v6,
    v7,
    v8,
    v20,
  BOOL v37 = [(NPKPassDescription *)self expressPassTypesMask]);

  v9 = [(NPKPassDescription *)self availableActions];
  v10 = [(NPKPassDescription *)self organizationName];
  v11 = [(NPKPassDescription *)self transitAppletState];
  v12 = [(NPKPassDescription *)self frontFieldBuckets];
  v13 = [(NPKPassDescription *)self backFieldBuckets];
  uint64_t v14 = [(NPKPassDescription *)self lastAddValueAmount];
  v15 = [(NPKPassDescription *)self pendingAddValueDate];
  uint64_t v16 = [v37 stringByAppendingFormat:@" (availableActions %@ organizationName %@ transitAppletState %@ frontFieldBuckets %@ backFieldBuckets %@ lastAddValueAmount %@ pendingAddValueDate %@  hasAssociatedPeerPaymentAccount %d)", v9, v10, v11, v12, v13, v14, v15, -[NPKPassDescription hasAssociatedPeerPaymentAccount](self, "hasAssociatedPeerPaymentAccount")];

  uint64_t v17 = [(NPKPassDescription *)self subcredentials];
  uint64_t v18 = [v16 stringByAppendingFormat:@"(subcredentials %@)", v17];

  return v18;
}

- (id)encodeAsData:(id)a3
{
  if (a3)
  {
    BOOL v3 = (void *)MEMORY[0x263EFF8F8];
    BOOL v4 = NPKSecureArchiveObject(a3);
    BOOL v5 = [v3 dataWithData:v4];
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5;
}

- (void)encodeObject:(id)a3 asDataInCoder:(id)a4 withKey:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(NPKPassDescription *)self encodeAsData:a3];
  [v9 encodeObject:v10 forKey:v8];
}

- (void)setLogoImage:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_logoImage, a3);
  if ([(NPKPassDescription *)self lazyLoadEncodedImages] || !self->_logoImage)
  {
    logoImageEncoded = self->_logoImageEncoded;
    self->_logoImageEncoded = 0;
  }
  else
  {
    -[NPKPassDescription encodeAsData:](self, "encodeAsData:");
    BOOL v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    logoImageEncoded = self->_logoImageEncoded;
    self->_logoImageEncoded = v5;
  }
}

- (void)setBackgroundImage:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_backgroundImage, a3);
  if ([(NPKPassDescription *)self lazyLoadEncodedImages] || !self->_backgroundImage)
  {
    backgroundImageEncoded = self->_backgroundImageEncoded;
    self->_backgroundImageEncoded = 0;
  }
  else
  {
    -[NPKPassDescription encodeAsData:](self, "encodeAsData:");
    BOOL v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    backgroundImageEncoded = self->_backgroundImageEncoded;
    self->_backgroundImageEncoded = v5;
  }
}

- (NSData)backgroundImageEncoded
{
  if (!self->_backgroundImageEncoded)
  {
    if (self->_backgroundImage)
    {
      -[NPKPassDescription encodeAsData:](self, "encodeAsData:");
      BOOL v3 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v3 = 0;
    }
    backgroundImageEncoded = self->_backgroundImageEncoded;
    self->_backgroundImageEncoded = v3;
  }
  BOOL v5 = self->_backgroundImageEncoded;
  return v5;
}

- (void)setLogoImageEncoded:(id)a3
{
  BOOL v4 = (NSData *)a3;
  logoImage = self->_logoImage;
  self->_logoImage = 0;

  logoImageEncoded = self->_logoImageEncoded;
  self->_logoImageEncoded = v4;
}

- (NSData)logoImageEncoded
{
  if (!self->_logoImageEncoded)
  {
    if (self->_logoImage)
    {
      -[NPKPassDescription encodeAsData:](self, "encodeAsData:");
      BOOL v3 = (NSData *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v3 = 0;
    }
    logoImageEncoded = self->_logoImageEncoded;
    self->_logoImageEncoded = v3;
  }
  BOOL v5 = self->_logoImageEncoded;
  return v5;
}

- (void)setBackgroundImageEncoded:(id)a3
{
  BOOL v4 = (NSData *)a3;
  backgroundImage = self->_backgroundImage;
  self->_backgroundImage = 0;

  backgroundImageEncoded = self->_backgroundImageEncoded;
  self->_backgroundImageEncoded = v4;
}

- (PKImage)logoImage
{
  p_logoImage = &self->_logoImage;
  logoImage = self->_logoImage;
  if (logoImage)
  {
    BOOL v4 = logoImage;
  }
  else
  {
    BOOL v4 = [(NPKPassDescription *)self logoImageEncoded];

    if (v4)
    {
      id v7 = pk_ui_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        id v9 = pk_ui_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: decoding logo image from data on demand", v12, 2u);
        }
      }
      id v10 = [(NPKPassDescription *)self logoImageEncoded];
      v11 = objc_opt_class();
      NPKSecureUnarchiveObject(v10, v11);
      BOOL v4 = (PKImage *)objc_claimAutoreleasedReturnValue();

      if (v4 && [(id)objc_opt_class() isCachingEnabled]) {
        objc_storeStrong((id *)p_logoImage, v4);
      }
    }
  }
  return v4;
}

- (PKImage)backgroundImage
{
  p_backgroundImage = &self->_backgroundImage;
  backgroundImage = self->_backgroundImage;
  if (backgroundImage)
  {
    BOOL v4 = backgroundImage;
  }
  else
  {
    BOOL v4 = [(NPKPassDescription *)self backgroundImageEncoded];

    if (v4)
    {
      id v7 = pk_ui_log();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        id v9 = pk_ui_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: decoding background image from data on demand", v12, 2u);
        }
      }
      id v10 = [(NPKPassDescription *)self backgroundImageEncoded];
      v11 = objc_opt_class();
      NPKSecureUnarchiveObject(v10, v11);
      BOOL v4 = (PKImage *)objc_claimAutoreleasedReturnValue();

      if (v4 && [(id)objc_opt_class() isCachingEnabled]) {
        objc_storeStrong((id *)p_backgroundImage, v4);
      }
    }
  }
  return v4;
}

- (int64_t)effectiveContactlessPaymentApplicationState
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  BOOL v3 = [(NPKPassDescription *)self devicePrimaryPaymentApplication];
  int64_t v4 = [v3 state];

  if (v4 == 1)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    BOOL v5 = [(NPKPassDescription *)self devicePaymentApplications];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * v9) state];
          if (v10 != 1)
          {
            int64_t v4 = v10;
            goto LABEL_12;
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    int64_t v4 = 1;
LABEL_12:
  }
  return v4;
}

- (id)transitProperties
{
  BOOL v3 = [(NPKPassDescription *)self transitAppletState];
  if (v3)
  {
    int64_t v4 = [(NPKPassDescription *)self devicePrimaryPaymentApplication];
    BOOL v5 = [v3 transitPassPropertiesWithPaymentApplication:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)fieldForKey:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  BOOL v5 = [(NPKPassDescription *)self frontFieldBuckets];
  uint64_t v36 = [v5 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (!v36)
  {

LABEL_21:
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obja = [(NPKPassDescription *)self backFieldBuckets];
    uint64_t v37 = [obja countByEnumeratingWithState:&v42 objects:v55 count:16];
    uint64_t v18 = 0;
    if (v37)
    {
      uint64_t v35 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v37; ++i)
        {
          if (*(void *)v43 != v35) {
            objc_enumerationMutation(obja);
          }
          v20 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id v21 = v20;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v54 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v39;
            while (2)
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v39 != v24) {
                  objc_enumerationMutation(v21);
                }
                v26 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                unint64_t v27 = [v26 key];
                int v28 = [v27 isEqual:v4];

                if (v28)
                {
                  id v29 = v26;

                  uint64_t v18 = v29;
                  goto LABEL_36;
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v54 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }
LABEL_36:
        }
        uint64_t v37 = [obja countByEnumeratingWithState:&v42 objects:v55 count:16];
      }
      while (v37);
    }

    uint64_t v6 = v18;
    goto LABEL_39;
  }
  v31 = self;
  obuint64_t j = v5;
  uint64_t v6 = 0;
  uint64_t v34 = *(void *)v51;
  do
  {
    for (uint64_t k = 0; k != v36; ++k)
    {
      if (*(void *)v51 != v34) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void **)(*((void *)&v50 + 1) + 8 * k);
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v46 objects:v56 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v47;
        while (2)
        {
          for (uint64_t m = 0; m != v11; ++m)
          {
            if (*(void *)v47 != v12) {
              objc_enumerationMutation(v9);
            }
            long long v14 = *(void **)(*((void *)&v46 + 1) + 8 * m);
            long long v15 = objc_msgSend(v14, "key", v31);
            int v16 = [v15 isEqual:v4];

            if (v16)
            {
              id v17 = v14;

              uint64_t v6 = v17;
              goto LABEL_16;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v46 objects:v56 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
LABEL_16:
    }
    uint64_t v36 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
  }
  while (v36);

  self = v31;
  if (!v6) {
    goto LABEL_21;
  }
LABEL_39:

  return v6;
}

- (BOOL)isAddValuePending
{
  BOOL v3 = [(NPKPassDescription *)self pendingAddValueDate];
  if (v3)
  {
    id v4 = [(NPKPassDescription *)self pendingAddValueDate];
    [v4 timeIntervalSinceNow];
    BOOL v6 = fabs(v5) < 600.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEnroute
{
  v2 = [(NPKPassDescription *)self transitProperties];
  if ([v2 isInStation])
  {
    char v3 = 1;
  }
  else
  {
    id v4 = [v2 felicaProperties];
    char v3 = [v4 isInShinkansenStation];
  }
  return v3;
}

- (BOOL)hasValidNFCPayload
{
  v2 = [(NPKPassDescription *)self nfcPayload];
  char v3 = [v2 message];
  if (v3)
  {
    id v4 = [v2 encryptionPublicKeyData];
    if (v4) {
      char v5 = 1;
    }
    else {
      char v5 = PKNFCPassKeyOptional();
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)expressPassTypesMask
{
  return self->_expressPassTypesMask;
}

- (void)setExpressPassTypesMask:(unint64_t)a3
{
  self->_expressPassTypesMasuint64_t k = a3;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
}

- (NSNumber)groupID
{
  return self->_groupID;
}

- (void)setGroupID:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSData)manifestHash
{
  return self->_manifestHash;
}

- (void)setManifestHash:(id)a3
{
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_int64_t style = a3;
}

- (NSDate)relevantDate
{
  return self->_relevantDate;
}

- (void)setRelevantDate:(id)a3
{
}

- (NSDate)ingestionDate
{
  return self->_ingestionDate;
}

- (void)setIngestionDate:(id)a3
{
}

- (PKNFCPayload)nfcPayload
{
  return self->_nfcPayload;
}

- (void)setNfcPayload:(id)a3
{
}

- (BOOL)hasStoredValue
{
  return self->_hasStoredValue;
}

- (void)setHasStoredValue:(BOOL)a3
{
  self->_hasStoredValue = a3;
}

- (NSData)completeHash
{
  return self->_completeHash;
}

- (void)setCompleteHash:(id)a3
{
}

- (unint64_t)settings
{
  return self->_settings;
}

- (void)setSettings:(unint64_t)a3
{
  self->_settings = a3;
}

- (NSString)logoText
{
  return self->_logoText;
}

- (void)setLogoText:(id)a3
{
}

- (PKColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (PKColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
}

- (PKColor)labelColor
{
  return self->_labelColor;
}

- (void)setLabelColor:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSSet)devicePaymentApplications
{
  return self->_devicePaymentApplications;
}

- (void)setDevicePaymentApplications:(id)a3
{
}

- (PKPaymentApplication)devicePrimaryPaymentApplication
{
  return self->_devicePrimaryPaymentApplication;
}

- (void)setDevicePrimaryPaymentApplication:(id)a3
{
}

- (PKPaymentApplication)devicePrimaryContactlessPaymentApplication
{
  return self->_devicePrimaryContactlessPaymentApplication;
}

- (void)setDevicePrimaryContactlessPaymentApplication:(id)a3
{
}

- (PKPaymentApplication)devicePrimaryInAppPaymentApplication
{
  return self->_devicePrimaryInAppPaymentApplication;
}

- (void)setDevicePrimaryInAppPaymentApplication:(id)a3
{
}

- (PKPaymentApplication)preferredPaymentApplication
{
  return self->_preferredPaymentApplication;
}

- (void)setPreferredPaymentApplication:(id)a3
{
}

- (int64_t)effectivePaymentApplicationState
{
  return self->_effectivePaymentApplicationState;
}

- (void)setEffectivePaymentApplicationState:(int64_t)a3
{
  self->_int64_t effectivePaymentApplicationState = a3;
}

- (BOOL)isPrivateLabel
{
  return self->_privateLabel;
}

- (void)setPrivateLabel:(BOOL)a3
{
  self->_privateLabel = a3;
}

- (BOOL)isCobranded
{
  return self->_cobranded;
}

- (void)setCobranded:(BOOL)a3
{
  self->_cobranded = a3;
}

- (BOOL)deletePending
{
  return self->_deletePending;
}

- (void)setDeletePending:(BOOL)a3
{
  self->_deletePending = a3;
}

- (BOOL)hasUserSelectableContactlessPaymentApplications
{
  return self->_hasUserSelectableContactlessPaymentApplications;
}

- (void)setHasUserSelectableContactlessPaymentApplications:(BOOL)a3
{
  self->_hasUserSelectableContactlessPaymentApplications = a3;
}

- (NSString)issuerCountryCode
{
  return self->_issuerCountryCode;
}

- (void)setIssuerCountryCode:(id)a3
{
}

- (NSArray)availableActions
{
  return self->_availableActions;
}

- (void)setAvailableActions:(id)a3
{
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (void)setOrganizationName:(id)a3
{
}

- (PKTransitAppletState)transitAppletState
{
  return self->_transitAppletState;
}

- (void)setTransitAppletState:(id)a3
{
}

- (NSArray)frontFieldBuckets
{
  return self->_frontFieldBuckets;
}

- (void)setFrontFieldBuckets:(id)a3
{
}

- (NSArray)backFieldBuckets
{
  return self->_backFieldBuckets;
}

- (void)setBackFieldBuckets:(id)a3
{
}

- (NSDecimalNumber)lastAddValueAmount
{
  return self->_lastAddValueAmount;
}

- (void)setLastAddValueAmount:(id)a3
{
}

- (NSDate)pendingAddValueDate
{
  return self->_pendingAddValueDate;
}

- (void)setPendingAddValueDate:(id)a3
{
}

- (BOOL)hasAssociatedPeerPaymentAccount
{
  return self->_hasAssociatedPeerPaymentAccount;
}

- (void)setHasAssociatedPeerPaymentAccount:(BOOL)a3
{
  self->_hasAssociatedPeerPaymentAccount = a3;
}

- (NSSet)subcredentials
{
  return self->_subcredentials;
}

- (void)setSubcredentials:(id)a3
{
}

- (BOOL)lazyLoadEncodedImages
{
  return self->_lazyLoadEncodedImages;
}

- (void)setLazyLoadEncodedImages:(BOOL)a3
{
  self->_lazyLoadEncodedImages = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subcredentials, 0);
  objc_storeStrong((id *)&self->_pendingAddValueDate, 0);
  objc_storeStrong((id *)&self->_lastAddValueAmount, 0);
  objc_storeStrong((id *)&self->_backFieldBuckets, 0);
  objc_storeStrong((id *)&self->_frontFieldBuckets, 0);
  objc_storeStrong((id *)&self->_transitAppletState, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_availableActions, 0);
  objc_storeStrong((id *)&self->_issuerCountryCode, 0);
  objc_storeStrong((id *)&self->_preferredPaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePrimaryInAppPaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePrimaryContactlessPaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePrimaryPaymentApplication, 0);
  objc_storeStrong((id *)&self->_devicePaymentApplications, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_logoText, 0);
  objc_storeStrong((id *)&self->_completeHash, 0);
  objc_storeStrong((id *)&self->_nfcPayload, 0);
  objc_storeStrong((id *)&self->_ingestionDate, 0);
  objc_storeStrong((id *)&self->_relevantDate, 0);
  objc_storeStrong((id *)&self->_manifestHash, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_logoImageEncoded, 0);
  objc_storeStrong((id *)&self->_backgroundImageEncoded, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_logoImage, 0);
}

@end