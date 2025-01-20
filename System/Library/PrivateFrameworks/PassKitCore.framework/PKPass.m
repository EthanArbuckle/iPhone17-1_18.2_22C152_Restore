@interface PKPass
+ (BOOL)isValidObjectWithFileDataAccessor:(id)a3 validationOptions:(unint64_t)a4 warnings:(id *)a5 error:(id *)a6 signingDate:(id *)a7 passDictionary:(id)a8;
+ (BOOL)supportsSecureCoding;
+ (Class)classForDictionary:(id)a3 bundle:(id)a4;
+ (Class)classForPassType:(unint64_t)a3;
+ (Class)resolvingClass;
+ (id)_dateForPassComparison:(id)a3 searchOption:(unint64_t)a4;
+ (id)dataTypeIdentifier;
+ (id)fetchSigningDateForObjectWithFileDataAccessor:(id)a3 passDictionary:(id)a4;
+ (id)recordNameForUniqueID:(id)a3;
+ (id)recordNamePrefix;
+ (id)uniqueIDFromRecordName:(id)a3;
+ (unint64_t)defaultSettings;
- (BOOL)availableForAutomaticPresentationUsingBeaconContext;
- (BOOL)hasFlightDetails;
- (BOOL)hasLocationRelevancyInfo;
- (BOOL)hasStoredValue;
- (BOOL)hasTimeOrLocationRelevancyInfo;
- (BOOL)hasValidNFCPayload;
- (BOOL)isCloudKitArchived;
- (BOOL)isCloudKitSecurelyArchived;
- (BOOL)isEqualToPassIncludingMetadata:(id)a3;
- (BOOL)isExpired;
- (BOOL)isExpiredBasedOnSigningDate;
- (BOOL)isPastRelevancy;
- (BOOL)isPersonalizable;
- (BOOL)isRemotePass;
- (BOOL)isRevoked;
- (BOOL)isUpdatable;
- (BOOL)isValid;
- (BOOL)isVoided;
- (BOOL)linksToApp;
- (BOOL)liveRenderedBackground;
- (BOOL)liveRenderingRequiresEnablement;
- (BOOL)muteReadyForUseNotification;
- (BOOL)silenceRequested;
- (BOOL)supportsCategoryVisualization;
- (BOOL)supportsFeature:(unint64_t)a3 forDevice:(id)a4 version:(id)a5;
- (BOOL)supportsFeatureForCurrentDevice:(unint64_t)a3;
- (BOOL)supportsIssuerBinding;
- (BOOL)supportsLifecycleUpdates;
- (BOOL)supportsSharing;
- (BOOL)supportsSyncing;
- (BOOL)wasAchivedInCloudStoreWithIdentifier:(id)a3;
- (CGRect)cobrandLogoRect;
- (CGRect)logoRect;
- (CGRect)stripRect;
- (CGRect)thumbnailRect;
- (NSArray)auxiliaryPassInformation;
- (NSArray)auxiliaryStoreIdentifiers;
- (NSArray)backFieldBuckets;
- (NSArray)embeddedLocationsArray;
- (NSArray)frontFieldBuckets;
- (NSArray)passDetailSections;
- (NSArray)relevantDates;
- (NSArray)storeIdentifiers;
- (NSArray)systemAppBundleIdentifiers;
- (NSData)cloudKitMetadata;
- (NSData)cloudKitSecureMetadata;
- (NSDate)expirationDate;
- (NSDate)ingestedDate;
- (NSDate)modifiedDate;
- (NSDate)relevantDate;
- (NSDictionary)userInfo;
- (NSNumber)sequenceCounter;
- (NSSet)associatedPassTypeIdentifiers;
- (NSSet)embeddedBeacons;
- (NSSet)embeddedLocations;
- (NSString)airlineCode;
- (NSString)businessChatIdentifier;
- (NSString)cardholderInfoSectionTitle;
- (NSString)deviceName;
- (NSString)eventName;
- (NSString)flightCode;
- (NSString)groupingID;
- (NSString)localizedDescription;
- (NSString)localizedName;
- (NSString)logoText;
- (NSString)lowercaseLocalizedName;
- (NSString)organizationName;
- (NSString)passLibraryMachServiceName;
- (NSString)passTypeIdentifier;
- (NSString)pluralLocalizedName;
- (NSString)provisioningCredentialHash;
- (NSString)serialNumber;
- (NSString)sharingText;
- (NSString)teamID;
- (NSURL)accessibilityURL;
- (NSURL)appLaunchURL;
- (NSURL)bagPolicyURL;
- (NSURL)contactVenueEmail;
- (NSURL)contactVenuePhoneNumber;
- (NSURL)contactVenueWebsite;
- (NSURL)directionsInformationURL;
- (NSURL)localLocationsURL;
- (NSURL)merchandiseURL;
- (NSURL)orderFoodURL;
- (NSURL)parkingInformationURL;
- (NSURL)partnerAddOnURL;
- (NSURL)passURL;
- (NSURL)purchaseParkingURL;
- (NSURL)sellURL;
- (NSURL)sharingURL;
- (NSURL)transferURL;
- (NSURL)transitInformationURL;
- (NSURL)webLocationsURL;
- (PKBarcode)barcode;
- (PKColor)frontFaceImageAverageColor;
- (PKColor)partialFrontFaceImageAverageColor;
- (PKImage)altImage;
- (PKImage)cardHolderPicture;
- (PKImage)compactBankLogoDarkImage;
- (PKImage)compactBankLogoLightImage;
- (PKImage)footerImage;
- (PKImage)frontFaceImage;
- (PKImage)frontFaceShadowImage;
- (PKImage)iconImage;
- (PKImage)notificationIconImage;
- (PKImage)partialFrontFaceImage;
- (PKImage)partialFrontFaceImagePlaceholder;
- (PKImage)personalizationLogoImage;
- (PKImage)rawIcon;
- (PKLiveRenderedShaderSet)liveRenderedShaderSet;
- (PKLocation)eventLocation;
- (PKNFCPayload)nfcPayload;
- (PKPass)initWithCloudStoreCoder:(id)a3;
- (PKPass)initWithCoder:(id)a3;
- (PKPass)initWithData:(NSData *)data error:(NSError *)error;
- (PKPass)initWithDictionary:(id)a3 bundle:(id)a4;
- (PKPassBarcodeSettings)barcodeSettings;
- (PKPassFrontFaceImageSet)frontFaceImageSet;
- (PKPassLiveRenderedArmedStateImageSet)liveRenderedArmedStateImageSet;
- (PKPassLiveRenderedImageSet)liveRenderedImageSet;
- (PKPassPersonalization)personalization;
- (PKPassType)passType;
- (PKPaymentPass)paymentPass;
- (PKSeatingInformation)seatingInformation;
- (PKSecureElementPass)secureElementPass;
- (id)_changeMessageForDateSemantic:(id)a3 newSemantic:(id)a4;
- (id)_changeMessageForDictionariesSemantic:(id)a3 newSemantic:(id)a4;
- (id)_changeMessageForEventDateInfoSemantic:(id)a3 newSemantic:(id)a4;
- (id)_changeMessageForFieldKey:(id)a3;
- (id)_changeMessageForSemantic:(id)a3 newSemantic:(id)a4;
- (id)_localizationKeyForMultipleDiff;
- (id)additionalInfoFields;
- (id)allSemantics;
- (id)autoTopUpFields;
- (id)backgroundImage;
- (id)balanceFields;
- (id)balances;
- (id)copyWithZone:(_NSZone *)a3;
- (id)currencyAmountForSemanticKey:(id)a3;
- (id)dateForSemanticKey:(id)a3;
- (id)dictionariesForSemanticKey:(id)a3;
- (id)diff:(id)a3;
- (id)eventDateInfoForSemanticKey:(id)a3;
- (id)fidoProfile;
- (id)fieldForKey:(id)a3;
- (id)issuerBindingInformation;
- (id)localizedDescriptionForDiff:(id)a3;
- (id)localizedValueForFieldKey:(NSString *)key;
- (id)locationForSemanticKey:(id)a3;
- (id)logoImage;
- (id)numberForSemanticKey:(id)a3;
- (id)passLocalizedStringForKey:(id)a3;
- (id)personNameComponentsForSemanticKey:(id)a3;
- (id)primaryFields;
- (id)recordTypesAndNamesForCodingType:(unint64_t)a3;
- (id)secondaryLogoImage;
- (id)semantics;
- (id)stringForSemanticKey:(id)a3;
- (id)stringsForSemanticKey:(id)a3;
- (id)stripImage;
- (id)systemFieldsDataForCloudStoreWithIdentifier:(id)a3;
- (id)thumbnailImage;
- (id)venueMapImage;
- (int64_t)comparePassDatesToPass:(id)a3 searchOption:(unint64_t)a4;
- (int64_t)eventType;
- (int64_t)sharingMethod;
- (int64_t)style;
- (int64_t)transitType;
- (unint64_t)flightNumber;
- (unint64_t)homeKeyLiveRenderType;
- (unint64_t)itemType;
- (unint64_t)liveRenderType;
- (void)downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4;
- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)loadFlightsWithCompletionHandler:(id)a3;
- (void)setAccessibilityURL:(id)a3;
- (void)setAssociatedPassTypeIdentifiers:(id)a3;
- (void)setBagPolicyURL:(id)a3;
- (void)setCardholderInfoSectionTitle:(id)a3;
- (void)setCloudKitMetadata:(id)a3;
- (void)setCloudKitSecureMetadata:(id)a3;
- (void)setContactVenueEmail:(id)a3;
- (void)setContactVenuePhoneNumber:(id)a3;
- (void)setContactVenueWebsite:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDirectionsInformationURL:(id)a3;
- (void)setEmbeddedBeacons:(id)a3;
- (void)setEmbeddedLocations:(id)a3;
- (void)setEmbeddedLocationsArray:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setGroupingID:(id)a3;
- (void)setHasStoredValue:(BOOL)a3;
- (void)setHomeKeyLiveRenderType:(unint64_t)a3;
- (void)setIngestedDate:(id)a3;
- (void)setIsCloudKitArchived:(BOOL)a3;
- (void)setIsCloudKitSecurelyArchived:(BOOL)a3;
- (void)setLiveRenderType:(unint64_t)a3;
- (void)setLiveRenderedBackground:(BOOL)a3;
- (void)setLiveRenderingRequiresEnablement:(BOOL)a3;
- (void)setLocalLocationsURL:(id)a3;
- (void)setMerchandiseURL:(id)a3;
- (void)setModifiedDate:(id)a3;
- (void)setMuteReadyForUseNotification:(BOOL)a3;
- (void)setNFCPayload:(id)a3;
- (void)setOrderFoodURL:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setParkingInformationURL:(id)a3;
- (void)setPartnerAddOnURL:(id)a3;
- (void)setPassLibraryMachServiceName:(id)a3;
- (void)setPassType:(unint64_t)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPassURL:(id)a3;
- (void)setProvisioningCredentialHash:(id)a3;
- (void)setPurchaseParkingURL:(id)a3;
- (void)setRelevantDate:(id)a3;
- (void)setRelevantDates:(id)a3;
- (void)setRemotePass:(BOOL)a3;
- (void)setRevoked:(BOOL)a3;
- (void)setSellURL:(id)a3;
- (void)setSequenceCounter:(id)a3;
- (void)setSerialNumber:(id)a3;
- (void)setSharingMethod:(int64_t)a3;
- (void)setSharingText:(id)a3;
- (void)setSharingURL:(id)a3;
- (void)setSupportsCategoryVisualization:(BOOL)a3;
- (void)setSupportsLifecycleUpdates:(BOOL)a3;
- (void)setSystemFieldsMetata:(id)a3 forCloudStoreWithIdentifier:(id)a4;
- (void)setTeamID:(id)a3;
- (void)setTransferURL:(id)a3;
- (void)setTransitInformationURL:(id)a3;
- (void)setUserInfo:(id)a3;
- (void)setVoided:(BOOL)a3;
- (void)setWebLocationsURL:(id)a3;
@end

@implementation PKPass

- (PKPaymentPass)paymentPass
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v3 = self;
  }
  else {
    v3 = 0;
  }
  return (PKPaymentPass *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_ingestedDate, 0);
  objc_storeStrong((id *)&self->_cardholderInfoSectionTitle, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialHash, 0);
  objc_storeStrong((id *)&self->_contactVenueWebsite, 0);
  objc_storeStrong((id *)&self->_contactVenueEmail, 0);
  objc_storeStrong((id *)&self->_contactVenuePhoneNumber, 0);
  objc_storeStrong((id *)&self->_partnerAddOnURL, 0);
  objc_storeStrong((id *)&self->_purchaseParkingURL, 0);
  objc_storeStrong((id *)&self->_accessibilityURL, 0);
  objc_storeStrong((id *)&self->_merchandiseURL, 0);
  objc_storeStrong((id *)&self->_directionsInformationURL, 0);
  objc_storeStrong((id *)&self->_parkingInformationURL, 0);
  objc_storeStrong((id *)&self->_transitInformationURL, 0);
  objc_storeStrong((id *)&self->_orderFoodURL, 0);
  objc_storeStrong((id *)&self->_bagPolicyURL, 0);
  objc_storeStrong((id *)&self->_sellURL, 0);
  objc_storeStrong((id *)&self->_transferURL, 0);
  objc_storeStrong((id *)&self->_nfcPayload, 0);
  objc_storeStrong((id *)&self->_associatedPassTypeIdentifiers, 0);
  objc_storeStrong((id *)&self->_sharingText, 0);
  objc_storeStrong((id *)&self->_sharingURL, 0);
  objc_storeStrong((id *)&self->_localLocationsURL, 0);
  objc_storeStrong((id *)&self->_webLocationsURL, 0);
  objc_storeStrong((id *)&self->_embeddedBeacons, 0);
  objc_storeStrong((id *)&self->_groupingID, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_cloudKitSecureMetadata, 0);
  objc_storeStrong((id *)&self->_cloudKitMetadata, 0);
  objc_storeStrong((id *)&self->_sequenceCounter, 0);
  objc_storeStrong((id *)&self->_passLibraryMachServiceName, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_passURL, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_relevantDates, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_embeddedLocations, 0);
  objc_storeStrong((id *)&self->_liveRenderedShaderSet, 0);
}

- (void)setSharingURL:(id)a3
{
}

- (void)setSharingText:(id)a3
{
}

- (void)setPassLibraryMachServiceName:(id)a3
{
}

- (void)setDeviceName:(id)a3
{
}

- (unint64_t)liveRenderType
{
  return self->_liveRenderType;
}

- (void)setRevoked:(BOOL)a3
{
  self->_revoked = a3;
}

- (void)setRemotePass:(BOOL)a3
{
  self->_remotePass = a3;
}

- (void)setIsCloudKitSecurelyArchived:(BOOL)a3
{
  self->_isCloudKitSecurelyArchived = a3;
}

- (void)setIsCloudKitArchived:(BOOL)a3
{
  self->_isCloudKitArchived = a3;
}

- (BOOL)isVoided
{
  return self->_voided;
}

- (void)setModifiedDate:(id)a3
{
}

- (void)setIngestedDate:(id)a3
{
}

- (void)setCloudKitSecureMetadata:(id)a3
{
}

- (void)setCloudKitMetadata:(id)a3
{
}

- (int64_t)style
{
  v2 = [(PKObject *)self displayProfile];
  int64_t v3 = [v2 passStyle];

  return v3;
}

- (PKPass)initWithCoder:(id)a3
{
  id v4 = a3;
  v98.receiver = self;
  v98.super_class = (Class)PKPass;
  v5 = [(PKObject *)&v98 initWithCoder:v4];
  if (v5)
  {
    context = (void *)MEMORY[0x192FDC630]();
    uint64_t v6 = objc_opt_class();
    uint64_t v93 = objc_opt_class();
    uint64_t v95 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v92 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = [v4 decodeObjectOfClass:v7 forKey:@"passLibraryMachServiceName"];
    passLibraryMachServiceName = v5->_passLibraryMachServiceName;
    v5->_passLibraryMachServiceName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:v7 forKey:@"deviceName"];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v14;

    v5->_remotePass = [v4 decodeBoolForKey:@"remotePass"];
    uint64_t v16 = [v4 decodeObjectOfClass:v7 forKey:@"provisioningCredentialHash"];
    provisioningCredentialHash = v5->_provisioningCredentialHash;
    v5->_provisioningCredentialHash = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:v7 forKey:@"passTypeID"];
    passTypeIdentifier = v5->_passTypeIdentifier;
    v5->_passTypeIdentifier = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:v7 forKey:@"teamID"];
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:v7 forKey:@"serialNumber"];
    serialNumber = v5->_serialNumber;
    v5->_serialNumber = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:v10 forKey:@"sequenceCounter"];
    sequenceCounter = v5->_sequenceCounter;
    v5->_sequenceCounter = (NSNumber *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:v7 forKey:@"organizationName"];
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:v8 forKey:@"expirationDate"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v28;

    v5->_voided = [v4 decodeBoolForKey:@"voided"];
    uint64_t v94 = v8;
    v96 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v95, v6, v7, v92, v10, v8, v11, 0);
    uint64_t v30 = objc_msgSend(v4, "decodeObjectOfClasses:forKey:");
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v30;

    uint64_t v32 = [v4 decodeObjectOfClass:v7 forKey:@"groupingID"];
    groupingID = v5->_groupingID;
    v5->_groupingID = (NSString *)v32;

    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v6, objc_opt_class(), 0);
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"relevantDates"];
    relevantDates = v5->_relevantDates;
    v5->_relevantDates = (NSArray *)v35;

    v5->_sharingMethod = [v4 decodeIntegerForKey:@"sharingMethod"];
    uint64_t v37 = [v4 decodeObjectOfClass:v7 forKey:@"sharingText"];
    sharingText = v5->_sharingText;
    v5->_sharingText = (NSString *)v37;

    uint64_t v39 = [v4 decodeObjectOfClass:v9 forKey:@"sharingURL"];
    sharingURL = v5->_sharingURL;
    v5->_sharingURL = (NSURL *)v39;

    v41 = (void *)MEMORY[0x192FDC630]();
    v42 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v6, v93, objc_opt_class(), 0);
    v43 = [v4 decodeObjectOfClasses:v42 forKey:@"embeddedLocations"];
    if (objc_opt_isKindOfClass())
    {
      uint64_t v44 = [v43 copy];
    }
    else
    {
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_7;
      }
      uint64_t v44 = objc_msgSend(v43, "pk_arrayCopy");
    }
    embeddedLocations = v5->_embeddedLocations;
    v5->_embeddedLocations = (NSArray *)v44;

LABEL_7:
    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v93, objc_opt_class(), 0);
    uint64_t v47 = [v4 decodeObjectOfClasses:v46 forKey:@"embeddedBeacons"];
    embeddedBeacons = v5->_embeddedBeacons;
    v5->_embeddedBeacons = (NSSet *)v47;

    uint64_t v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nfcPayload"];
    nfcPayload = v5->_nfcPayload;
    v5->_nfcPayload = (PKNFCPayload *)v49;

    v5->_hasStoredValue = [v4 decodeBoolForKey:@"hasStoredValue"];
    v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"liveRenderType"];
    v52 = v51;
    if (v51)
    {
      uint64_t v53 = PKPassLiveRenderTypeFromString(v51);
      v5->_liveRenderType = v53;
      v5->_liveRenderedBackground = v53 != 0;
      if (v5->_liveRenderType == 2)
      {
        v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"homeKeyLiveRenderType"];
        v5->_homeKeyLiveRenderType = PKPassHomeKeyLiveRenderTypeFromString(v54);

LABEL_12:
        v5->_supportsCategoryVisualization = [v4 decodeBoolForKey:@"supportsCategoryVisualization"];
        v5->_liveRenderingRequiresEnablement = [v4 decodeBoolForKey:@"liveRenderingRequiresEnablement"];
        v5->_passType = [v4 decodeIntegerForKey:@"passType"];
        uint64_t v56 = [v4 decodeObjectOfClass:v94 forKey:@"ingestedDate"];
        ingestedDate = v5->_ingestedDate;
        v5->_ingestedDate = (NSDate *)v56;

        uint64_t v58 = [v4 decodeObjectOfClass:v94 forKey:@"modifiedDate"];
        modifiedDate = v5->_modifiedDate;
        v5->_modifiedDate = (NSDate *)v58;

        v5->_revoked = [v4 decodeBoolForKey:@"revoked"];
        v5->_muteReadyForUseNotification = [v4 decodeBoolForKey:@"muteReadyForUseNotification"];
        v60 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v93, v7, 0);
        uint64_t v61 = [v4 decodeObjectOfClasses:v60 forKey:@"associatedPassTypeIdentifiers"];
        associatedPassTypeIdentifiers = v5->_associatedPassTypeIdentifiers;
        v5->_associatedPassTypeIdentifiers = (NSSet *)v61;

        uint64_t v63 = [v4 decodeObjectOfClass:v9 forKey:@"transferURL"];
        transferURL = v5->_transferURL;
        v5->_transferURL = (NSURL *)v63;

        uint64_t v65 = [v4 decodeObjectOfClass:v9 forKey:@"sellURL"];
        sellURL = v5->_sellURL;
        v5->_sellURL = (NSURL *)v65;

        uint64_t v67 = [v4 decodeObjectOfClass:v9 forKey:@"bagPolicyURL"];
        bagPolicyURL = v5->_bagPolicyURL;
        v5->_bagPolicyURL = (NSURL *)v67;

        uint64_t v69 = [v4 decodeObjectOfClass:v9 forKey:@"orderFoodURL"];
        orderFoodURL = v5->_orderFoodURL;
        v5->_orderFoodURL = (NSURL *)v69;

        uint64_t v71 = [v4 decodeObjectOfClass:v9 forKey:@"transitInformationURL"];
        transitInformationURL = v5->_transitInformationURL;
        v5->_transitInformationURL = (NSURL *)v71;

        uint64_t v73 = [v4 decodeObjectOfClass:v9 forKey:@"parkingInformationURL"];
        parkingInformationURL = v5->_parkingInformationURL;
        v5->_parkingInformationURL = (NSURL *)v73;

        uint64_t v75 = [v4 decodeObjectOfClass:v9 forKey:@"directionsInformationURL"];
        directionsInformationURL = v5->_directionsInformationURL;
        v5->_directionsInformationURL = (NSURL *)v75;

        uint64_t v77 = [v4 decodeObjectOfClass:v9 forKey:@"merchandiseURL"];
        merchandiseURL = v5->_merchandiseURL;
        v5->_merchandiseURL = (NSURL *)v77;

        uint64_t v79 = [v4 decodeObjectOfClass:v9 forKey:@"accessibilityURL"];
        accessibilityURL = v5->_accessibilityURL;
        v5->_accessibilityURL = (NSURL *)v79;

        uint64_t v81 = [v4 decodeObjectOfClass:v9 forKey:@"purchaseParkingURL"];
        purchaseParkingURL = v5->_purchaseParkingURL;
        v5->_purchaseParkingURL = (NSURL *)v81;

        uint64_t v83 = [v4 decodeObjectOfClass:v9 forKey:@"addOnURL"];
        partnerAddOnURL = v5->_partnerAddOnURL;
        v5->_partnerAddOnURL = (NSURL *)v83;

        uint64_t v85 = [v4 decodeObjectOfClass:v9 forKey:@"contactVenuePhoneNumber"];
        contactVenuePhoneNumber = v5->_contactVenuePhoneNumber;
        v5->_contactVenuePhoneNumber = (NSURL *)v85;

        uint64_t v87 = [v4 decodeObjectOfClass:v9 forKey:@"contactVenueEmail"];
        contactVenueEmail = v5->_contactVenueEmail;
        v5->_contactVenueEmail = (NSURL *)v87;

        uint64_t v89 = [v4 decodeObjectOfClass:v9 forKey:@"contactVenueWebsite"];
        contactVenueWebsite = v5->_contactVenueWebsite;
        v5->_contactVenueWebsite = (NSURL *)v89;

        goto LABEL_13;
      }
    }
    else
    {
      unsigned int v55 = [v4 decodeBoolForKey:@"liveRendered"];
      v5->_liveRenderedBackground = v55;
      v5->_liveRenderType = v55;
    }
    v5->_homeKeyLiveRenderType = 0;
    goto LABEL_12;
  }
LABEL_13:

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPass;
  id v5 = [(PKObject *)&v9 encodeWithCoder:v4];
  uint64_t v6 = (void *)MEMORY[0x192FDC630](v5);
  [v4 encodeObject:self->_passLibraryMachServiceName forKey:@"passLibraryMachServiceName"];
  [v4 encodeObject:self->_deviceName forKey:@"deviceName"];
  [v4 encodeBool:self->_remotePass forKey:@"remotePass"];
  [v4 encodeObject:self->_provisioningCredentialHash forKey:@"provisioningCredentialHash"];
  [v4 encodeObject:self->_passTypeIdentifier forKey:@"passTypeID"];
  [v4 encodeObject:self->_teamID forKey:@"teamID"];
  [v4 encodeObject:self->_serialNumber forKey:@"serialNumber"];
  [v4 encodeObject:self->_sequenceCounter forKey:@"sequenceCounter"];
  [v4 encodeObject:self->_organizationName forKey:@"organizationName"];
  [v4 encodeObject:self->_expirationDate forKey:@"expirationDate"];
  [v4 encodeBool:self->_voided forKey:@"voided"];
  [v4 encodeObject:self->_userInfo forKey:@"userInfo"];
  [v4 encodeObject:self->_groupingID forKey:@"groupingID"];
  [v4 encodeObject:self->_relevantDates forKey:@"relevantDates"];
  [v4 encodeInteger:self->_sharingMethod forKey:@"sharingMethod"];
  [v4 encodeObject:self->_sharingText forKey:@"sharingText"];
  [v4 encodeObject:self->_sharingURL forKey:@"sharingURL"];
  [v4 encodeObject:self->_embeddedLocations forKey:@"embeddedLocations"];
  [v4 encodeObject:self->_embeddedBeacons forKey:@"embeddedBeacons"];
  [v4 encodeObject:self->_nfcPayload forKey:@"nfcPayload"];
  [v4 encodeBool:self->_hasStoredValue forKey:@"hasStoredValue"];
  [v4 encodeBool:self->_liveRenderedBackground forKey:@"liveRendered"];
  uint64_t v7 = PKPassLiveRenderTypeToString(self->_liveRenderType);
  [v4 encodeObject:v7 forKey:@"liveRenderType"];

  if (self->_liveRenderType == 2)
  {
    uint64_t v8 = PKPassHomeKeyLiveRenderTypeToString(self->_homeKeyLiveRenderType);
    [v4 encodeObject:v8 forKey:@"homeKeyLiveRenderType"];
  }
  [v4 encodeBool:self->_supportsCategoryVisualization forKey:@"supportsCategoryVisualization"];
  [v4 encodeBool:self->_liveRenderingRequiresEnablement forKey:@"liveRenderingRequiresEnablement"];
  [v4 encodeInteger:self->_passType forKey:@"passType"];
  [v4 encodeObject:self->_ingestedDate forKey:@"ingestedDate"];
  [v4 encodeObject:self->_modifiedDate forKey:@"modifiedDate"];
  [v4 encodeBool:self->_revoked forKey:@"revoked"];
  [v4 encodeObject:self->_associatedPassTypeIdentifiers forKey:@"associatedPassTypeIdentifiers"];
  [v4 encodeBool:self->_muteReadyForUseNotification forKey:@"muteReadyForUseNotification"];
  [v4 encodeObject:self->_transferURL forKey:@"transferURL"];
  [v4 encodeObject:self->_sellURL forKey:@"sellURL"];
  [v4 encodeObject:self->_bagPolicyURL forKey:@"bagPolicyURL"];
  [v4 encodeObject:self->_orderFoodURL forKey:@"orderFoodURL"];
  [v4 encodeObject:self->_transitInformationURL forKey:@"transitInformationURL"];
  [v4 encodeObject:self->_parkingInformationURL forKey:@"parkingInformationURL"];
  [v4 encodeObject:self->_directionsInformationURL forKey:@"directionsInformationURL"];
  [v4 encodeObject:self->_merchandiseURL forKey:@"merchandiseURL"];
  [v4 encodeObject:self->_accessibilityURL forKey:@"accessibilityURL"];
  [v4 encodeObject:self->_purchaseParkingURL forKey:@"purchaseParkingURL"];
  [v4 encodeObject:self->_partnerAddOnURL forKey:@"addOnURL"];
  [v4 encodeObject:self->_contactVenuePhoneNumber forKey:@"contactVenuePhoneNumber"];
  [v4 encodeObject:self->_contactVenueEmail forKey:@"contactVenueEmail"];
  [v4 encodeObject:self->_contactVenueWebsite forKey:@"contactVenueWebsite"];
}

- (BOOL)liveRenderingRequiresEnablement
{
  return self->_liveRenderingRequiresEnablement;
}

- (BOOL)supportsCategoryVisualization
{
  return self->_supportsCategoryVisualization;
}

- (NSURL)transitInformationURL
{
  return self->_transitInformationURL;
}

- (NSURL)purchaseParkingURL
{
  return self->_purchaseParkingURL;
}

- (NSURL)partnerAddOnURL
{
  return self->_partnerAddOnURL;
}

- (NSURL)parkingInformationURL
{
  return self->_parkingInformationURL;
}

- (NSURL)orderFoodURL
{
  return self->_orderFoodURL;
}

- (NSURL)merchandiseURL
{
  return self->_merchandiseURL;
}

- (NSURL)directionsInformationURL
{
  return self->_directionsInformationURL;
}

- (NSURL)contactVenueWebsite
{
  return self->_contactVenueWebsite;
}

- (NSURL)contactVenuePhoneNumber
{
  return self->_contactVenuePhoneNumber;
}

- (NSURL)contactVenueEmail
{
  return self->_contactVenueEmail;
}

- (NSURL)bagPolicyURL
{
  return self->_bagPolicyURL;
}

- (NSURL)accessibilityURL
{
  return self->_accessibilityURL;
}

- (BOOL)supportsIssuerBinding
{
  if ([(PKPass *)self passType]) {
    return 0;
  }
  id v4 = [(PKPass *)self nfcPayload];

  if (!v4) {
    return 0;
  }
  id v5 = [(PKPass *)self issuerBindingInformation];
  if (v5)
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t v6 = [(PKPass *)self fidoProfile];
    BOOL v3 = v6 != 0;
  }
  return v3;
}

- (PKPassType)passType
{
  return self->_passType;
}

- (BOOL)hasValidNFCPayload
{
  v2 = [(PKPass *)self nfcPayload];
  BOOL v3 = [v2 message];
  if (v3 && ![v2 payloadState])
  {
    id v5 = [v2 encryptionPublicKeyData];
    if (v5) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = PKNFCPassKeyOptional();
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (PKNFCPayload)nfcPayload
{
  return self->_nfcPayload;
}

- (BOOL)linksToApp
{
  BOOL v3 = [(PKPass *)self storeIdentifiers];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(PKPass *)self systemAppBundleIdentifiers];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (NSArray)systemAppBundleIdentifiers
{
  v2 = [(PKObject *)self contentLoadedIfNeeded];
  BOOL v3 = [v2 systemAppBundleIdentifiers];

  return (NSArray *)v3;
}

- (NSArray)storeIdentifiers
{
  v2 = [(PKObject *)self contentLoadedIfNeeded];
  BOOL v3 = [v2 storeIdentifiers];

  return (NSArray *)v3;
}

- (id)additionalInfoFields
{
  v2 = [(PKObject *)self contentLoadedIfNeeded];
  BOOL v3 = [v2 additionalInfoFields];

  return v3;
}

- (NSString)localizedDescription
{
  v2 = [(PKObject *)self contentLoadedIfNeeded];
  BOOL v3 = [v2 localizedDescription];

  return (NSString *)v3;
}

- (id)allSemantics
{
  v2 = [(PKObject *)self contentLoadedIfNeeded];
  BOOL v3 = [v2 allSemantics];

  return v3;
}

- (PKBarcode)barcode
{
  v2 = [(PKObject *)self contentLoadedIfNeeded];
  BOOL v3 = [v2 barcode];

  return (PKBarcode *)v3;
}

- (PKImage)iconImage
{
  v2 = [(PKObject *)self imageSetLoadedIfNeeded:1];
  BOOL v3 = [v2 iconImage];

  return (PKImage *)v3;
}

- (PKColor)frontFaceImageAverageColor
{
  if ([(PKObject *)self isImageSetLoaded:0]
    || ![(PKObject *)self isImageSetLoaded:2])
  {
    BOOL v3 = [(PKObject *)self imageSetLoadedIfNeeded:0];
    uint64_t v4 = [v3 faceImageAverageColor];
  }
  else
  {
    BOOL v3 = [(PKObject *)self imageSetLoadedIfNeeded:2];
    uint64_t v4 = [v3 placeHolderImageAverageColor];
  }
  id v5 = (void *)v4;

  return (PKColor *)v5;
}

- (PKSecureElementPass)secureElementPass
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v3 = self;
  }
  else {
    BOOL v3 = 0;
  }
  return (PKSecureElementPass *)v3;
}

- (NSArray)relevantDates
{
  if (self->_relevantDates) {
    return self->_relevantDates;
  }
  else {
    return (NSArray *)MEMORY[0x1E4F1CBF0];
  }
}

- (BOOL)isRevoked
{
  return self->_revoked;
}

- (NSString)logoText
{
  v2 = [(PKObject *)self contentLoadedIfNeeded];
  BOOL v3 = [v2 logoText];

  return (NSString *)v3;
}

- (PKImage)frontFaceShadowImage
{
  v2 = [(PKObject *)self imageSetLoadedIfNeeded:0];
  BOOL v3 = [v2 faceShadowImage];

  return (PKImage *)v3;
}

- (PKImage)frontFaceImage
{
  v2 = [(PKObject *)self imageSetLoadedIfNeeded:0];
  BOOL v3 = [v2 faceImage];

  return (PKImage *)v3;
}

- (CGRect)cobrandLogoRect
{
  v2 = [(PKObject *)self imageSetLoadedIfNeeded:0];
  [v2 cobrandLogoRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (PKPass)initWithDictionary:(id)a3 bundle:(id)a4
{
  uint64_t v166 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v157.receiver = self;
  v157.super_class = (Class)PKPass;
  double v8 = [(PKObject *)&v157 initWithDictionary:v6 bundle:v7];

  if (!v6 || !v8) {
    goto LABEL_117;
  }
  id v153 = v7;
  uint64_t v9 = +[PKDisplayProfile displayProfileOfType:0 withDictionary:v6 bundle:v7];
  [(PKObject *)v8 setDisplayProfile:v9];
  double v10 = [v6 PKStringForKey:@"passTypeIdentifier"];
  [(PKPass *)v8 setPassTypeIdentifier:v10];

  double v11 = [v6 PKStringForKey:@"serialNumber"];
  [(PKPass *)v8 setSerialNumber:v11];

  double v12 = [v6 PKNumberForKey:@"sequenceCounter"];
  [(PKPass *)v8 setSequenceCounter:v12];

  double v13 = [(PKPass *)v8 passTypeIdentifier];
  double v14 = [(PKPass *)v8 serialNumber];
  v15 = PKGeneratePassUniqueID(v13, v14);
  [(PKObject *)v8 setUniqueID:v15];

  uint64_t v16 = [v6 PKStringForKey:@"teamIdentifier"];
  [(PKPass *)v8 setTeamID:v16];

  v17 = [v6 PKStringForKey:@"organizationName"];
  [(PKPass *)v8 setOrganizationName:v17];

  uint64_t v18 = [v6 PKDateForKey:@"expirationDate"];
  [(PKPass *)v8 setExpirationDate:v18];

  -[PKPass setVoided:](v8, "setVoided:", [v6 PKBoolForKey:@"voided"]);
  id v154 = v6;
  id v19 = v6;
  unint64_t v20 = 0x1E4F1C000uLL;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v22 = [v19 PKArrayContaining:objc_opt_class() forKey:@"relevantDates"];
  v23 = v22;
  v155 = v8;
  v152 = (void *)v9;
  if (v22)
  {
    long long v160 = 0u;
    long long v161 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    id v24 = v22;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v158 objects:buf count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v159;
      while (2)
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v159 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = *(void **)(*((void *)&v158 + 1) + 8 * i);
          if ((unint64_t)[v21 count] >= 0xA)
          {
            PKLogFacilityTypeGetObject(0);
            uint64_t v32 = (PKPassRelevantDate *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(&v32->super, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v162 = 67109120;
              int v163 = 10;
              _os_log_error_impl(&dword_190E10000, &v32->super, OS_LOG_TYPE_ERROR, "Pass has more than %d dates. Capping.", v162, 8u);
            }
            double v8 = v155;
            unint64_t v20 = 0x1E4F1C000;
            goto LABEL_20;
          }
          uint64_t v30 = PKValidateRelevantDateDictionary(v29);

          if (!v30)
          {
            v31 = [[PKPassRelevantDate alloc] initWithDictionary:v29];
            [v21 addObject:v31];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v158 objects:buf count:16];
        if (v26) {
          continue;
        }
        break;
      }
      double v8 = v155;
      unint64_t v20 = 0x1E4F1C000;
    }
  }
  else
  {
    id v24 = [v19 PKDateForKey:@"relevantDate"];
    if (v24)
    {
      uint64_t v32 = [[PKPassRelevantDate alloc] initWithRelevantDate:v24];
      [v21 addObject:v32];
LABEL_20:
    }
  }

  if ([v21 count]) {
    v33 = (void *)[v21 copy];
  }
  else {
    v33 = 0;
  }

  [(PKPass *)v8 setRelevantDates:v33];
  v34 = [v19 PKURLForKey:@"webServiceURL"];
  [(PKObject *)v8 setWebServiceURL:v34];

  uint64_t v35 = [v19 PKStringForKey:@"authenticationToken"];
  [(PKObject *)v8 setAuthenticationToken:v35];

  v36 = [v19 PKDictionaryForKey:@"userInfo"];
  [(PKPass *)v8 setUserInfo:v36];

  uint64_t v37 = [v19 PKSetForKey:@"associatedPassTypeIdentifiers"];
  [(PKPass *)v8 setAssociatedPassTypeIdentifiers:v37];

  -[PKPass setHasStoredValue:](v8, "setHasStoredValue:", [v19 PKBoolForKey:@"hasStoredValue"]);
  v38 = [v19 PKStringForKey:@"liveRenderType"];
  v151 = v38;
  if (v38)
  {
    uint64_t v39 = PKPassLiveRenderTypeFromString(v38);
    [(PKPass *)v8 setLiveRenderType:v39];
    uint64_t v40 = v39 != 0;
  }
  else
  {
    uint64_t v40 = [v19 PKBoolForKey:@"liveRenderedBackground"];
    [(PKPass *)v8 setLiveRenderType:v40];
  }
  [(PKPass *)v8 setLiveRenderedBackground:v40];
  if (v8->_liveRenderType == 2)
  {
    v41 = [v19 PKStringForKey:@"homeKeyLiveType"];
    [(PKPass *)v8 setHomeKeyLiveRenderType:PKPassHomeKeyLiveRenderTypeFromString(v41)];
  }
  else
  {
    [(PKPass *)v8 setHomeKeyLiveRenderType:0];
  }
  -[PKPass setSupportsCategoryVisualization:](v8, "setSupportsCategoryVisualization:", [v19 PKBoolForKey:@"supportsCategoryVisualization"]);
  -[PKPass setLiveRenderingRequiresEnablement:](v8, "setLiveRenderingRequiresEnablement:", [v19 PKBoolForKey:@"liveRenderingRequiresEnablement"]);
  -[PKPass setMuteReadyForUseNotification:](v8, "setMuteReadyForUseNotification:", [v19 PKBoolForKey:@"muteReadyForUseNotification"]);
  v42 = (void *)MEMORY[0x192FDC630](-[PKPass setSupportsLifecycleUpdates:](v8, "setSupportsLifecycleUpdates:", [v19 PKBoolForKey:@"supportsLifecycleUpdates"]));
  id v43 = v19;
  uint64_t v44 = [v43 PKArrayContaining:objc_opt_class() forKey:@"locations"];
  v45 = v44;
  if (v44)
  {
    unint64_t v46 = [v44 count];
    if (v46 >= 0x3E8)
    {
      if (PKDeveloperLoggingEnabled() && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v165) = 1000;
        _os_log_error_impl(&dword_190E10000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Pass has more than %d locations. Capping.", buf, 8u);
      }
      uint64_t v47 = PKLogFacilityTypeGetObject(5uLL);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v165) = 1000;
        _os_log_impl(&dword_190E10000, v47, OS_LOG_TYPE_DEFAULT, "Pass has more than %d locations. Capping.", buf, 8u);
      }
    }
    v156 = v42;
    if (v46 >= 0x3E8) {
      unint64_t v46 = 1000;
    }
    v48 = (void *)[objc_alloc(*(Class *)(v20 + 2632)) initWithCapacity:v46];
    if (v46)
    {
      uint64_t v49 = 0;
      id v50 = 0;
      do
      {
        v51 = [v45 objectAtIndexedSubscript:v49];
        v52 = PKValidateLocationDictionary(v51);

        if (v52)
        {
          if (!v50) {
            id v50 = objc_alloc_init(MEMORY[0x1E4F28E60]);
          }
          [v50 addIndex:v49];
        }
        else
        {
          uint64_t v53 = [[PKLocation alloc] initWithDictionary:v51];
          if (v53)
          {
            v54 = v53;
            [v48 addObject:v53];
          }
        }

        ++v49;
      }
      while (v46 != v49);
    }
    else
    {
      id v50 = 0;
    }
    v42 = v156;
    if ([v50 count])
    {
      if (PKDeveloperLoggingEnabled() && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v165 = v50;
        _os_log_error_impl(&dword_190E10000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Pass has invalid locations at indices %@. Ignoring.", buf, 0xCu);
      }
      uint64_t v56 = PKLogFacilityTypeGetObject(5uLL);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v165 = v50;
        _os_log_impl(&dword_190E10000, v56, OS_LOG_TYPE_DEFAULT, "Pass has invalid locations at indices %@. Ignoring.", buf, 0xCu);
      }
    }
    if ([v48 count]) {
      unsigned int v55 = (void *)[v48 copy];
    }
    else {
      unsigned int v55 = 0;
    }

    double v8 = v155;
  }
  else
  {
    unsigned int v55 = 0;
  }

  [(PKPass *)v8 setEmbeddedLocationsArray:v55];
  id v57 = v43;
  uint64_t v58 = [v57 PKArrayContaining:objc_opt_class() forKey:@"beacons"];
  v59 = v58;
  if (v58)
  {
    id v150 = v57;
    v60 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v58, "count"));
    long long v158 = 0u;
    long long v159 = 0u;
    long long v160 = 0u;
    long long v161 = 0u;
    v149 = v59;
    id v61 = v59;
    uint64_t v62 = [v61 countByEnumeratingWithState:&v158 objects:buf count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v159;
      while (2)
      {
        for (uint64_t j = 0; j != v63; ++j)
        {
          if (*(void *)v159 != v64) {
            objc_enumerationMutation(v61);
          }
          v66 = *(void **)(*((void *)&v158 + 1) + 8 * j);
          if ((unint64_t)[v60 count] >= 0xA)
          {
            v74 = PKLogFacilityTypeGetObject(0);
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v162 = 67109120;
              int v163 = 10;
              _os_log_error_impl(&dword_190E10000, v74, OS_LOG_TYPE_ERROR, "Pass has more than %d beacons. Capping.", v162, 8u);
            }

            goto LABEL_78;
          }
          uint64_t v67 = PKValidateBeaconDictionary(v66);

          if (!v67)
          {
            v68 = objc_alloc_init(PKBeacon);
            uint64_t v69 = [v66 PKUUIDForKey:@"proximityUUID"];
            [(PKBeacon *)v68 setProximityUUID:v69];

            v70 = [v66 PKNumberForKey:@"major"];
            [(PKBeacon *)v68 setMajor:v70];

            uint64_t v71 = [v66 PKNumberForKey:@"minor"];
            [(PKBeacon *)v68 setMinor:v71];

            v72 = [v66 PKStringForKey:@"name"];
            [(PKBeacon *)v68 setName:v72];

            uint64_t v73 = [v66 PKStringForKey:@"relevantText"];
            [(PKBeacon *)v68 setRelevantText:v73];

            [v60 addObject:v68];
          }
        }
        uint64_t v63 = [v61 countByEnumeratingWithState:&v158 objects:buf count:16];
        if (v63) {
          continue;
        }
        break;
      }
    }
LABEL_78:

    double v8 = v155;
    v59 = v149;
    id v57 = v150;
  }
  else
  {
    v60 = 0;
  }
  if ([v60 count]) {
    uint64_t v75 = v60;
  }
  else {
    uint64_t v75 = 0;
  }
  id v76 = v75;

  [(PKPass *)v8 setEmbeddedBeacons:v76];
  uint64_t v77 = [v57 objectForKey:@"nfc"];
  if (v77) {
    v78 = [[PKNFCPayload alloc] initWithNFCDictionary:v77];
  }
  else {
    v78 = 0;
  }

  [(PKPass *)v8 setNFCPayload:v78];
  uint64_t v79 = [(PKPass *)v8 passTypeIdentifier];
  uint64_t v80 = PKPassTypeForPassTypeIdentifier(v79);

  [(PKPass *)v8 setPassType:v80];
  unint64_t v81 = [v152 passStyle];
  id v82 = v57;
  uint64_t v83 = v82;
  if (v80 == 1)
  {
LABEL_96:
    uint64_t v79 = [v82 PKStringForKey:@"groupingIdentifier"];
    goto LABEL_97;
  }
  if (v81 > 0xC) {
    goto LABEL_97;
  }
  if (((1 << v81) & 0x10EB) == 0)
  {
    if (((1 << v81) & 0x314) == 0) {
      goto LABEL_97;
    }
    goto LABEL_96;
  }
  if (PKDeveloperLoggingEnabled() && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_190E10000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "groupingIdentifier is only supported for boardingPass, eventTicket, and healthPass styles as well as PKPassTypeSecureElement pass type. Ignoring.", buf, 2u);
  }
  v84 = PKLogFacilityTypeGetObject(5uLL);
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v84, OS_LOG_TYPE_DEFAULT, "groupingIdentifier is only supported for boardingPass, eventTicket, and healthPass styles as well as PKPassTypeSecureElement pass type. Ignoring.", buf, 2u);
  }

  uint64_t v79 = 0;
LABEL_97:

  [(PKPass *)v8 setGroupingID:v79];
  uint64_t v85 = [v83 PKStringForKey:@"provisioningCredentialHash"];
  [(PKPass *)v8 setProvisioningCredentialHash:v85];
  v86 = [v83 objectForKey:@"sharingProhibited"];

  if (v86) {
    int v87 = [v83 PKBoolForKey:@"sharingProhibited"];
  }
  else {
    int v87 = 0;
  }
  v88 = [v83 PKDictionaryForKey:@"sharing"];
  uint64_t v89 = v88;
  if (v87)
  {
    v90 = v8;
    uint64_t v91 = -1;
  }
  else
  {
    if (v88)
    {
      uint64_t v92 = [v88 PKStringForKey:@"method"];
      uint64_t v93 = [NSNumber numberWithInt:0];
      uint64_t v98 = (int)_PKEnumValueFromString(v92, v93, @"PKPassSharingMethod", @"PKPassSharingMethodDisabled, PKPassSharingMethodPass, PKPassSharingMethodURL", v94, v95, v96, v97, 0xFFFFFFFF);

      [(PKPass *)v8 setSharingMethod:v98];
      if ([(PKPass *)v8 sharingMethod] == 1)
      {
        v99 = [v89 PKURLForKey:@"url"];
        [(PKPass *)v8 setSharingURL:v99];
      }
      v100 = [v89 PKStringForKey:@"text"];
      [(PKPass *)v8 setSharingText:v100];

      goto LABEL_108;
    }
    v90 = v8;
    uint64_t v91 = 0;
  }
  [(PKPass *)v90 setSharingMethod:v91];
LABEL_108:
  v101 = (void *)MEMORY[0x1E4F1CB10];
  v102 = [v83 PKStringForKey:@"transferURL"];
  v103 = [v101 URLWithString:v102];
  [(PKPass *)v8 setTransferURL:v103];

  v104 = (void *)MEMORY[0x1E4F1CB10];
  v105 = [v83 PKStringForKey:@"sellURL"];
  v106 = [v104 URLWithString:v105];
  [(PKPass *)v8 setSellURL:v106];

  v107 = (void *)MEMORY[0x1E4F1CB10];
  v108 = [v83 PKStringForKey:@"bagPolicyURL"];
  v109 = [v107 URLWithString:v108];
  [(PKPass *)v8 setBagPolicyURL:v109];

  v110 = (void *)MEMORY[0x1E4F1CB10];
  v111 = [v83 PKStringForKey:@"orderFoodURL"];
  v112 = [v110 URLWithString:v111];
  [(PKPass *)v8 setOrderFoodURL:v112];

  v113 = (void *)MEMORY[0x1E4F1CB10];
  v114 = [v83 PKStringForKey:@"transitInformationURL"];
  v115 = [v113 URLWithString:v114];
  [(PKPass *)v8 setTransitInformationURL:v115];

  v116 = (void *)MEMORY[0x1E4F1CB10];
  v117 = [v83 PKStringForKey:@"parkingInformationURL"];
  v118 = [v116 URLWithString:v117];
  [(PKPass *)v8 setParkingInformationURL:v118];

  v119 = (void *)MEMORY[0x1E4F1CB10];
  v120 = [v83 PKStringForKey:@"directionsInformationURL"];
  v121 = [v119 URLWithString:v120];
  [(PKPass *)v8 setDirectionsInformationURL:v121];

  v122 = (void *)MEMORY[0x1E4F1CB10];
  v123 = [v83 PKStringForKey:@"merchandiseURL"];
  v124 = [v122 URLWithString:v123];
  [(PKPass *)v8 setMerchandiseURL:v124];

  v125 = (void *)MEMORY[0x1E4F1CB10];
  v126 = [v83 PKStringForKey:@"accessibilityURL"];
  v127 = [v125 URLWithString:v126];
  [(PKPass *)v8 setAccessibilityURL:v127];

  v128 = (void *)MEMORY[0x1E4F1CB10];
  v129 = [v83 PKStringForKey:@"purchaseParkingURL"];
  v130 = [v128 URLWithString:v129];
  [(PKPass *)v8 setPurchaseParkingURL:v130];

  v131 = (void *)MEMORY[0x1E4F1CB10];
  v132 = [v83 PKStringForKey:@"addOnURL"];
  v133 = [v131 URLWithString:v132];
  [(PKPass *)v8 setPartnerAddOnURL:v133];

  id v134 = [v83 PKStringForKey:@"contactVenueEmail"];
  v135 = v134;
  if (v134)
  {
    uint64_t v136 = [v134 length];

    if (v136)
    {
      if (([v135 hasPrefix:@"mailto:"] & 1) == 0)
      {
        uint64_t v137 = [NSString stringWithFormat:@"mailto:%@", v135];

        v135 = (void *)v137;
      }
    }
  }
  v138 = [MEMORY[0x1E4F1CB10] URLWithString:v135];
  [(PKPass *)v8 setContactVenueEmail:v138];

  id v139 = [v83 PKStringForKey:@"contactVenuePhoneNumber"];
  v140 = v139;
  if (v139
    && (uint64_t v141 = [v139 length], v140, v141)
    && ([v140 hasPrefix:@"tel:"] & 1) == 0)
  {
    uint64_t v142 = PKTelephoneURLFromPhoneNumber(v140);
  }
  else
  {
    uint64_t v142 = [MEMORY[0x1E4F1CB10] URLWithString:v140];
  }
  v143 = (void *)v142;
  [(PKPass *)v8 setContactVenuePhoneNumber:v142];
  v144 = (void *)MEMORY[0x1E4F1CB10];
  v145 = [v83 PKStringForKey:@"contactVenueWebsite"];
  v146 = [v144 URLWithString:v145];
  [(PKPass *)v8 setContactVenueWebsite:v146];

  id v7 = v153;
  id v6 = v154;
LABEL_117:
  v147 = v8;

  return v147;
}

- (void)setPassType:(unint64_t)a3
{
  self->_passType = a3;
}

+ (unint64_t)defaultSettings
{
  return 3;
}

- (void)setVoided:(BOOL)a3
{
  self->_voided = a3;
}

- (void)setUserInfo:(id)a3
{
}

- (void)setTransitInformationURL:(id)a3
{
}

- (void)setTransferURL:(id)a3
{
}

- (void)setTeamID:(id)a3
{
}

- (void)setSupportsCategoryVisualization:(BOOL)a3
{
  self->_supportsCategoryVisualization = a3;
}

- (void)setSharingMethod:(int64_t)a3
{
  self->_sharingMethod = a3;
}

- (void)setSerialNumber:(id)a3
{
}

- (void)setSequenceCounter:(id)a3
{
}

- (void)setSellURL:(id)a3
{
}

- (void)setRelevantDates:(id)a3
{
}

- (void)setPurchaseParkingURL:(id)a3
{
}

- (void)setProvisioningCredentialHash:(id)a3
{
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (void)setPartnerAddOnURL:(id)a3
{
}

- (void)setParkingInformationURL:(id)a3
{
}

- (void)setOrganizationName:(id)a3
{
}

- (void)setOrderFoodURL:(id)a3
{
}

- (void)setNFCPayload:(id)a3
{
}

- (void)setMuteReadyForUseNotification:(BOOL)a3
{
  self->_muteReadyForUseNotification = a3;
}

- (void)setMerchandiseURL:(id)a3
{
}

- (void)setLiveRenderingRequiresEnablement:(BOOL)a3
{
  self->_liveRenderingRequiresEnablement = a3;
}

- (void)setLiveRenderType:(unint64_t)a3
{
  self->_liveRenderType = a3;
}

- (void)setHomeKeyLiveRenderType:(unint64_t)a3
{
  self->_homeKeyLiveRenderType = a3;
}

- (void)setHasStoredValue:(BOOL)a3
{
  self->_hasStoredValue = a3;
}

- (void)setExpirationDate:(id)a3
{
}

- (void)setEmbeddedLocationsArray:(id)a3
{
}

- (void)setEmbeddedBeacons:(id)a3
{
}

- (void)setDirectionsInformationURL:(id)a3
{
}

- (void)setContactVenueWebsite:(id)a3
{
}

- (void)setContactVenuePhoneNumber:(id)a3
{
}

- (void)setContactVenueEmail:(id)a3
{
}

- (void)setBagPolicyURL:(id)a3
{
}

- (void)setAssociatedPassTypeIdentifiers:(id)a3
{
}

- (void)setAccessibilityURL:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setSupportsLifecycleUpdates:(BOOL)a3
{
  self->_supportsLifecycleUpdates = a3;
}

- (void)setLiveRenderedBackground:(BOOL)a3
{
  self->_liveRenderedBackground = a3;
}

- (void)setGroupingID:(id)a3
{
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (PKImage)altImage
{
  v2 = [(PKObject *)self imageSetLoadedIfNeeded:4];
  double v3 = [v2 altImage];

  return (PKImage *)v3;
}

- (BOOL)isExpired
{
  v2 = [(PKPass *)self expirationDate];
  double v3 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:v3];
  BOOL v5 = v4 < 0.0;

  return v5;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSArray)frontFieldBuckets
{
  v2 = [(PKObject *)self contentLoadedIfNeeded];
  double v3 = [v2 frontFieldBuckets];

  return (NSArray *)v3;
}

- (PKPassLiveRenderedImageSet)liveRenderedImageSet
{
  return (PKPassLiveRenderedImageSet *)[(PKObject *)self imageSetLoadedIfNeeded:6];
}

- (CGRect)thumbnailRect
{
  v2 = [(PKObject *)self imageSetLoadedIfNeeded:0];
  [v2 thumbnailRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

+ (Class)resolvingClass
{
  return (Class)objc_opt_class();
}

+ (id)dataTypeIdentifier
{
  return @"com.apple.pkpass";
}

+ (Class)classForDictionary:(id)a3 bundle:(id)a4
{
  double v4 = objc_msgSend(a3, "PKStringForKey:", @"passTypeIdentifier", a4);
  double v5 = +[PKPass classForPassType:PKPassTypeForPassTypeIdentifier(v4)];

  return (Class)v5;
}

+ (Class)classForPassType:(unint64_t)a3
{
  double v3 = objc_opt_class();
  return (Class)v3;
}

- (CGRect)logoRect
{
  if ([(PKObject *)self isImageSetLoaded:0]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 2;
  }
  double v4 = [(PKObject *)self imageSetLoadedIfNeeded:v3];
  [v4 logoRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)logoImage
{
  v2 = [(PKObject *)self imageSetLoadedIfNeeded:4];
  uint64_t v3 = [v2 logoImage];

  return v3;
}

+ (BOOL)isValidObjectWithFileDataAccessor:(id)a3 validationOptions:(unint64_t)a4 warnings:(id *)a5 error:(id *)a6 signingDate:(id *)a7 passDictionary:(id)a8
{
  char v11 = a4;
  id v13 = a8;
  double v14 = [a3 fileURL];
  LOBYTE(a7) = PKValidatePassWithOptions(v14, v11, a6, a5, a7, v13);

  return (char)a7;
}

- (BOOL)silenceRequested
{
  v2 = [(PKPass *)self numberForSemanticKey:@"silenceRequested"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (int64_t)eventType
{
  v2 = [(PKPass *)self stringForSemanticKey:@"eventType"];
  if (v2)
  {
    char v3 = [NSNumber numberWithInt:0];
    int64_t v8 = (int)_PKEnumValueFromString(v2, v3, @"PKEventType", @"PKEventTypeGeneric, PKEventTypeLivePerformance, PKEventTypeMovie, PKEventTypeSports, PKEventTypeConference, PKEventTypeConvention, PKEventTypeWorkshop, PKEventTypeSocialGathering", v4, v5, v6, v7, 0);
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (PKPass)initWithData:(NSData *)data error:(NSError *)error
{
  v5.receiver = self;
  v5.super_class = (Class)PKPass;
  return [(PKObject *)&v5 initWithData:data error:error];
}

+ (id)fetchSigningDateForObjectWithFileDataAccessor:(id)a3 passDictionary:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 fileURL];
  uint64_t v7 = PKFetchSigningDate(v6, v5);

  return v7;
}

- (void)downloadRemoteAssetsWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PKPass_downloadRemoteAssetsWithConfiguration_completion___block_invoke;
  v9[3] = &unk_1E56EDAE0;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)PKPass;
  id v7 = v6;
  [(PKObject *)&v8 downloadRemoteAssetsWithConfiguration:a3 completion:v9];
}

void __59__PKPass_downloadRemoteAssetsWithConfiguration_completion___block_invoke(uint64_t a1, int a2, void *a3, float a4)
{
  id v7 = a3;
  if (a2)
  {
    [*(id *)(a1 + 32) reloadDisplayProfileOfType:0];
    [*(id *)(a1 + 32) flushLoadedImageSets];
  }
  (*(void (**)(float))(*(void *)(a1 + 40) + 16))(a4);
}

- (void)setRelevantDate:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [[PKPassRelevantDate alloc] initWithRelevantDate:v4];
    v7[0] = v5;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(PKPass *)self setRelevantDates:v6];
  }
  else
  {
    [(PKPass *)self setRelevantDates:MEMORY[0x1E4F1CBF0]];
  }
}

- (NSDate)relevantDate
{
  v2 = [(NSArray *)self->_relevantDates firstObject];
  char v3 = [v2 date];

  return (NSDate *)v3;
}

- (PKPass)initWithCloudStoreCoder:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 recordsWithRecordType:@"Pass"];
  id v5 = [v4 firstObject];

  id v6 = [v5 objectForKey:@"pkpass"];
  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    objc_super v8 = [v6 fileURL];
    double v9 = [v7 initWithContentsOfURL:v8];

    if (v9)
    {
      id v20 = 0;
      id v10 = [(PKPass *)self initWithData:v9 error:&v20];
      char v11 = v20;
      self = v10;
      if (v11)
      {
        double v12 = PKLogFacilityTypeGetObject(9uLL);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v22 = v11;
          _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Cannot create a PKPass from data: %{public}@", buf, 0xCu);
        }
      }
      id v13 = [v5 creationDate];
      [(PKPass *)self setIngestedDate:v13];

      double v14 = [v5 modificationDate];
      [(PKPass *)self setModifiedDate:v14];

      double v15 = [v5 recordID];
      double v16 = [v15 recordName];
      v17 = +[PKPass uniqueIDFromRecordName:v16];
      [(PKObject *)self setUniqueID:v17];

      uint64_t v18 = self;
    }
    else
    {
      char v11 = PKLogFacilityTypeGetObject(9uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Cannot create a PKPass with nil data", buf, 2u);
      }
      uint64_t v18 = 0;
    }
  }
  else
  {
    double v9 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Cannot create a PKPass with no asset data from CloudKit.", buf, 2u);
    }
    uint64_t v18 = 0;
  }

  return v18;
}

- (void)encodeWithCloudStoreCoder:(id)a3 codingType:(unint64_t)a4
{
  id v5 = a3;
  id v6 = (void *)MEMORY[0x192FDC630]();
  id v7 = [v5 recordsWithRecordType:@"Pass"];
  objc_super v8 = [v7 firstObject];

  double v9 = [(PKObject *)self archiveData];
  if (v9)
  {
    id v10 = NSTemporaryDirectory();
    char v11 = [(PKObject *)self uniqueID];
    double v12 = [v10 stringByAppendingPathComponent:v11];

    id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    [v13 removeItemAtPath:v12 error:0];

    [v9 writeToFile:v12 atomically:1];
    id v14 = objc_alloc(MEMORY[0x1E4F19E50]);
    double v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
    double v16 = (void *)[v14 initWithFileURL:v15];

    if (v16)
    {
      [v8 setObject:v16 forKey:@"pkpass"];
    }
    else
    {
      v17 = PKLogFacilityTypeGetObject(9uLL);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Could not set CKAsset for the CKRecord because it is nil.", buf, 2u);
      }
    }
  }
  else
  {
    double v12 = PKLogFacilityTypeGetObject(9uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Could not set archiveData for PKPass on CKRecord because it is nil.", v18, 2u);
    }
  }
}

- (id)recordTypesAndNamesForCodingType:(unint64_t)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(PKObject *)self uniqueID];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = objc_opt_class();
    id v7 = [(PKObject *)self uniqueID];
    objc_super v8 = [v6 recordNameForUniqueID:v7];
    id v13 = v8;
    double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v14[0] = v9;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

- (id)systemFieldsDataForCloudStoreWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  uint64_t v5 = @"com.apple.passes.sync";
  if (v5 == v4)
  {

    goto LABEL_7;
  }
  id v6 = v5;
  if (!v4 || !v5)
  {

    goto LABEL_9;
  }
  int v7 = [(__CFString *)v4 isEqualToString:v5];

  if (v7)
  {
LABEL_7:
    uint64_t v8 = [(PKPass *)self cloudKitMetadata];
LABEL_16:
    id v13 = (void *)v8;
    goto LABEL_21;
  }
LABEL_9:
  double v9 = v4;
  id v10 = @"com.apple.passes.sync.secure";
  if (v10 == v9)
  {

LABEL_15:
    uint64_t v8 = [(PKPass *)self cloudKitSecureMetadata];
    goto LABEL_16;
  }
  char v11 = v10;
  if (v4 && v10)
  {
    int v12 = [(__CFString *)v9 isEqualToString:v10];

    if (!v12) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }

LABEL_18:
  id v14 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    v17 = v9;
    _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "unknown cloud store identifier: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  id v13 = 0;
LABEL_21:

  return v13;
}

- (BOOL)wasAchivedInCloudStoreWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  uint64_t v5 = @"com.apple.passes.sync";
  if (v5 == v4)
  {

    goto LABEL_7;
  }
  id v6 = v5;
  if (!v4 || !v5)
  {

    goto LABEL_9;
  }
  int v7 = [(__CFString *)v4 isEqualToString:v5];

  if (v7)
  {
LABEL_7:
    BOOL v8 = [(PKPass *)self isCloudKitArchived];
LABEL_16:
    BOOL v13 = v8;
    goto LABEL_21;
  }
LABEL_9:
  double v9 = v4;
  id v10 = @"com.apple.passes.sync.secure";
  if (v10 == v9)
  {

LABEL_15:
    BOOL v8 = [(PKPass *)self isCloudKitSecurelyArchived];
    goto LABEL_16;
  }
  char v11 = v10;
  if (v4 && v10)
  {
    int v12 = [(__CFString *)v9 isEqualToString:v10];

    if (!v12) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }

LABEL_18:
  id v14 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    v17 = v9;
    _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "unknown cloud store identifier: %{public}@", (uint8_t *)&v16, 0xCu);
  }

  BOOL v13 = 0;
LABEL_21:

  return v13;
}

- (void)setSystemFieldsMetata:(id)a3 forCloudStoreWithIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (__CFString *)a4;
  BOOL v8 = @"com.apple.passes.sync";
  if (v8 == v7)
  {

    goto LABEL_7;
  }
  double v9 = v8;
  if (!v7 || !v8)
  {

    goto LABEL_9;
  }
  int v10 = [(__CFString *)v7 isEqualToString:v8];

  if (v10)
  {
LABEL_7:
    [(PKPass *)self setIsCloudKitArchived:1];
    [(PKPass *)self setCloudKitMetadata:v6];
    goto LABEL_20;
  }
LABEL_9:
  char v11 = v7;
  int v12 = @"com.apple.passes.sync.secure";
  if (v12 == v11)
  {

    goto LABEL_15;
  }
  BOOL v13 = v12;
  if (v7 && v12)
  {
    int v14 = [(__CFString *)v11 isEqualToString:v12];

    if (!v14) {
      goto LABEL_17;
    }
LABEL_15:
    [(PKPass *)self setIsCloudKitSecurelyArchived:1];
    [(PKPass *)self setCloudKitSecureMetadata:v6];
    goto LABEL_20;
  }

LABEL_17:
  double v15 = PKLogFacilityTypeGetObject(9uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    v17 = v11;
    _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "unknown cloud store identifier: %{public}@", (uint8_t *)&v16, 0xCu);
  }

LABEL_20:
}

- (unint64_t)itemType
{
  return 2;
}

+ (id)recordNamePrefix
{
  return @"pass-";
}

+ (id)recordNameForUniqueID:(id)a3
{
  id v4 = NSString;
  id v5 = a3;
  id v6 = [a1 recordNamePrefix];
  int v7 = [v4 stringWithFormat:@"%@%@", v6, v5];

  return v7;
}

+ (id)uniqueIDFromRecordName:(id)a3
{
  id v4 = a3;
  id v5 = [a1 recordNamePrefix];
  int v6 = [v4 hasPrefix:v5];

  if (v6)
  {
    int v7 = [a1 recordNamePrefix];
    BOOL v8 = [v4 stringByReplacingOccurrencesOfString:v7 withString:&stru_1EE0F5368];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSSet)embeddedLocations
{
  if (self->_embeddedLocations) {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:self->_embeddedLocations];
  }
  else {
    v2 = 0;
  }
  return (NSSet *)v2;
}

- (void)setEmbeddedLocations:(id)a3
{
  id v4 = (NSArray *)objc_msgSend(a3, "pk_arrayCopy");
  embeddedLocations = self->_embeddedLocations;
  self->_embeddedLocations = v4;
}

- (NSString)localizedName
{
  unint64_t v2 = [(PKPass *)self style];
  if (v2 > 9) {
    char v3 = @"TEMPLATE_NAME_PASS";
  }
  else {
    char v3 = off_1E56EDB18[v2];
  }
  id v4 = PKCoreLocalizedString(&v3->isa, 0);
  return (NSString *)v4;
}

- (NSString)lowercaseLocalizedName
{
  unint64_t v2 = [(PKPass *)self style];
  if (v2 > 9) {
    char v3 = @"TEMPLATE_NAME_LOWERCASE_PASS";
  }
  else {
    char v3 = off_1E56EDB68[v2];
  }
  id v4 = PKCoreLocalizedString(&v3->isa, 0);
  return (NSString *)v4;
}

- (NSString)pluralLocalizedName
{
  unint64_t v2 = [(PKPass *)self style];
  if (v2 > 9) {
    char v3 = @"TEMPLATE_NAME_PASSES";
  }
  else {
    char v3 = off_1E56EDBB8[v2];
  }
  id v4 = PKCoreLocalizedString(&v3->isa, 0);
  return (NSString *)v4;
}

- (NSURL)passURL
{
  char v3 = [(PKObject *)self uniqueID];
  if (v3 && !self->_remotePass)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F29088]);
    [v5 setScheme:@"shoebox"];
    [v5 setHost:@"card"];
    int v6 = [(PKObject *)self uniqueID];
    int v7 = [@"/" stringByAppendingString:v6];
    [v5 setPath:v7];

    BOOL v8 = [v5 URL];
    id v4 = (void *)[v8 copy];
  }
  else
  {
    id v4 = 0;
  }

  return (NSURL *)v4;
}

- (BOOL)hasTimeOrLocationRelevancyInfo
{
  if ([(NSArray *)self->_relevantDates count]) {
    return 1;
  }
  return [(PKPass *)self hasLocationRelevancyInfo];
}

- (BOOL)hasLocationRelevancyInfo
{
  return [(NSArray *)self->_embeddedLocations count] || [(NSSet *)self->_embeddedBeacons count] != 0;
}

- (BOOL)isPastRelevancy
{
  unint64_t v2 = [(PKPass *)self relevantDates];
  char v3 = +[PKPassRelevantDate findDateFromDates:v2 option:3];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:v3];
    BOOL v6 = v5 > 86400.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isUpdatable
{
  unint64_t v2 = [(PKObject *)self webServiceURL];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isExpiredBasedOnSigningDate
{
  BOOL v3 = [(PKObject *)self signingDate];
  int64_t v4 = [(PKPass *)self style];
  if (v3)
  {
    unint64_t v5 = v4;
    BOOL v6 = [MEMORY[0x1E4F1C9C8] date];
    [v6 timeIntervalSinceDate:v3];
    if (v7 <= 31536000.0 || v5 > 9) {
      LOBYTE(v9) = 0;
    }
    else {
      unsigned int v9 = (0x214u >> v5) & 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)supportsSyncing
{
  unint64_t passType = self->_passType;
  if ([(PKPass *)self style] == 8) {
    BOOL v4 = ![(NSString *)self->_passTypeIdentifier hasPrefix:@"healthpass.com.apple.health"];
  }
  else {
    LOBYTE(v4) = 1;
  }
  return !passType && v4;
}

- (BOOL)supportsSharing
{
  return [(PKPass *)self passType] != PKPassTypeSecureElement;
}

- (id)localizedValueForFieldKey:(NSString *)key
{
  BOOL v3 = [(PKPass *)self fieldForKey:key];
  BOOL v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 unformattedValue];
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)fieldForKey:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  unint64_t v5 = [(PKPass *)self frontFieldBuckets];
  uint64_t v36 = [v5 countByEnumeratingWithState:&v50 objects:v57 count:16];
  if (!v36)
  {

LABEL_21:
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id obja = [(PKPass *)self backFieldBuckets];
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
          id v20 = *(void **)(*((void *)&v42 + 1) + 8 * i);
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
                uint64_t v26 = *(void **)(*((void *)&v38 + 1) + 8 * j);
                uint64_t v27 = [v26 key];
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

    BOOL v6 = v18;
    goto LABEL_39;
  }
  v31 = self;
  obuint64_t j = v5;
  BOOL v6 = 0;
  uint64_t v34 = *(void *)v51;
  do
  {
    for (uint64_t k = 0; k != v36; ++k)
    {
      if (*(void *)v51 != v34) {
        objc_enumerationMutation(obj);
      }
      BOOL v8 = *(void **)(*((void *)&v50 + 1) + 8 * k);
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
            int v14 = *(void **)(*((void *)&v46 + 1) + 8 * m);
            double v15 = objc_msgSend(v14, "key", v31);
            int v16 = [v15 isEqual:v4];

            if (v16)
            {
              id v17 = v14;

              BOOL v6 = v17;
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

- (id)localizedDescriptionForDiff:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 hunkCount] == 1)
  {
    id v30 = 0;
    id v31 = 0;
    id v28 = 0;
    id v29 = 0;
    [v4 key:&v31 oldValue:&v30 newValue:&v29 message:&v28 forHunkAtIndex:0];
    id v5 = v31;
    id v6 = v30;
    id v7 = v29;
    id v8 = v28;
    if (!v7) {
      goto LABEL_12;
    }
    if ([(PKPass *)self style] == 9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v9 = [(PKPass *)self allSemantics];
        id v10 = [v9 objectForKey:v5];

        if (v10) {
          id v10 = v8;
        }
LABEL_13:

        if (v10) {
          goto LABEL_15;
        }
        goto LABEL_14;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v7 length])
    {
LABEL_12:
      id v10 = 0;
      goto LABEL_13;
    }
    uint64_t v11 = [(PKPass *)self _changeMessageForFieldKey:v5];
    uint64_t v12 = v11;
    if (v11)
    {
      id v19 = PKValidateChangeMessage(v11);
      if (!v19)
      {
        PKStringWithValidatedFormat(v12, @"%@", v13, v14, v15, v16, v17, v18, (uint64_t)v7);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

        goto LABEL_13;
      }
    }
    else
    {
      id v19 = 0;
    }
    uint64_t v22 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = [(PKPass *)self passTypeIdentifier];
      uint64_t v24 = [(PKPass *)self serialNumber];
      uint64_t v27 = [v19 userInfo];
      uint64_t v25 = [v27 objectForKey:*MEMORY[0x1E4F28A50]];
      uint64_t v23 = [v25 localizedDescription];
      *(_DWORD *)buf = 138543874;
      v33 = v26;
      __int16 v34 = 2114;
      uint64_t v35 = v24;
      __int16 v36 = 2114;
      uint64_t v37 = v23;
      _os_log_error_impl(&dword_190E10000, v22, OS_LOG_TYPE_ERROR, "Change message didn't validate in pass %{public}@/%{public}@: %{public}@", buf, 0x20u);
    }
    id v10 = 0;
    goto LABEL_22;
  }
LABEL_14:
  id v20 = [(PKPass *)self _localizationKeyForMultipleDiff];
  PKCoreLocalizedString(v20, 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v10;
}

- (NSURL)localLocationsURL
{
  unint64_t v2 = [(PKObject *)self dataAccessor];
  BOOL v3 = [v2 bundle];
  id v4 = [v3 bundleURL];

  return (NSURL *)v4;
}

- (id)diff:(id)a3
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(PKDiff);
  id v6 = [(PKObject *)self uniqueID];
  [(PKDiff *)v5 setPassUniqueID:v6];

  id v7 = [(PKObject *)self manifestHash];
  v84 = v5;
  [(PKDiff *)v5 setPassManifestHash:v7];

  unint64_t v8 = 0x1E4F1C000uLL;
  unint64_t v81 = v4;
  if ([(PKPass *)self style] == 9)
  {
    id v9 = [(PKPass *)self allSemantics];
    long long v41 = [v4 allSemantics];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v85 = v9;
    uint64_t v11 = [v9 allKeys];
    [v10 addObjectsFromArray:v11];

    uint64_t v12 = [v41 allKeys];
    [v10 addObjectsFromArray:v12];

    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    obuint64_t j = v10;
    uint64_t v13 = [obj countByEnumeratingWithState:&v95 objects:v103 count:16];
    if (!v13) {
      goto LABEL_130;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v96;
    while (1)
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v96 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(id *)(*((void *)&v95 + 1) + 8 * v16);
        if (([v17 isEqualToString:@"departureLocationDescription"] & 1) != 0
          || ([v17 isEqualToString:@"destinationLocationDescription"] & 1) != 0
          || ([v17 isEqualToString:@"transitProvider"] & 1) != 0
          || ([v17 isEqualToString:@"vehicleName"] & 1) != 0
          || ([v17 isEqualToString:@"vehicleNumber"] & 1) != 0
          || ([v17 isEqualToString:@"vehicleType"] & 1) != 0
          || ([v17 isEqualToString:@"boardingGroup"] & 1) != 0
          || ([v17 isEqualToString:@"boardingSequenceNumber"] & 1) != 0
          || ([v17 isEqualToString:@"confirmationNumber"] & 1) != 0
          || ([v17 isEqualToString:@"transitStatus"] & 1) != 0
          || ([v17 isEqualToString:@"transitStatusReason"] & 1) != 0
          || ([v17 isEqualToString:@"membershipProgramName"] & 1) != 0
          || ([v17 isEqualToString:@"membershipProgramNumber"] & 1) != 0
          || ([v17 isEqualToString:@"priorityStatus"] & 1) != 0
          || ([v17 isEqualToString:@"securityScreening"] & 1) != 0
          || ([v17 isEqualToString:@"flightCode"] & 1) != 0
          || ([v17 isEqualToString:@"airlineCode"] & 1) != 0
          || ([v17 isEqualToString:@"departureAirportCode"] & 1) != 0
          || ([v17 isEqualToString:@"departureAirportName"] & 1) != 0
          || ([v17 isEqualToString:@"departureTerminal"] & 1) != 0
          || ([v17 isEqualToString:@"departureGate"] & 1) != 0
          || ([v17 isEqualToString:@"destinationAirportCode"] & 1) != 0
          || ([v17 isEqualToString:@"destinationAirportName"] & 1) != 0
          || ([v17 isEqualToString:@"destinationTerminal"] & 1) != 0
          || ([v17 isEqualToString:@"destinationGate"] & 1) != 0
          || ([v17 isEqualToString:@"departurePlatform"] & 1) != 0
          || ([v17 isEqualToString:@"departureStationName"] & 1) != 0
          || ([v17 isEqualToString:@"destinationPlatform"] & 1) != 0
          || ([v17 isEqualToString:@"destinationStationName"] & 1) != 0
          || ([v17 isEqualToString:@"carNumber"] & 1) != 0
          || ([v17 isEqualToString:@"eventName"] & 1) != 0
          || ([v17 isEqualToString:@"venueName"] & 1) != 0
          || ([v17 isEqualToString:@"venueEntrance"] & 1) != 0
          || ([v17 isEqualToString:@"venueRoom"] & 1) != 0
          || ([v17 isEqualToString:@"venuePhoneNumber"] & 1) != 0
          || ([v17 isEqualToString:@"leagueName"] & 1) != 0
          || ([v17 isEqualToString:@"leagueAbbreviation"] & 1) != 0
          || ([v17 isEqualToString:@"homeTeamLocation"] & 1) != 0
          || ([v17 isEqualToString:@"homeTeamName"] & 1) != 0
          || ([v17 isEqualToString:@"homeTeamAbbreviation"] & 1) != 0
          || ([v17 isEqualToString:@"awayTeamLocation"] & 1) != 0
          || ([v17 isEqualToString:@"awayTeamName"] & 1) != 0
          || ([v17 isEqualToString:@"awayTeamAbbreviation"] & 1) != 0
          || ([v17 isEqualToString:@"sportName"] & 1) != 0
          || ([v17 isEqualToString:@"genre"] & 1) != 0
          || ([v17 isEqualToString:@"eventLiveMessage"] & 1) != 0
          || ([v17 isEqualToString:@"admissionLevel"] & 1) != 0
          || ([v17 isEqualToString:@"admissionLevelAbbreviation"] & 1) != 0
          || ([v17 isEqualToString:@"attendeeName"] & 1) != 0
          || ([v17 isEqualToString:@"venueRegionName"] & 1) != 0
          || ([v17 isEqualToString:@"entranceDescription"] & 1) != 0
          || ([v17 isEqualToString:@"venueEntranceGate"] & 1) != 0
          || ([v17 isEqualToString:@"venueEntranceDoor"] & 1) != 0
          || ([v17 isEqualToString:@"venueEntrancePortal"] & 1) != 0
          || ([v17 isEqualToString:@"additionalTicketAttributes"] & 1) != 0)
        {
          goto LABEL_96;
        }
        char v18 = [v17 isEqualToString:@"eventType"];

        if (v18) {
          goto LABEL_97;
        }
        id v19 = v17;
        if (([v19 isEqualToString:@"originalDepartureDate"] & 1) != 0
          || ([v19 isEqualToString:@"currentDepartureDate"] & 1) != 0
          || ([v19 isEqualToString:@"originalArrivalDate"] & 1) != 0
          || ([v19 isEqualToString:@"currentArrivalDate"] & 1) != 0
          || ([v19 isEqualToString:@"originalBoardingDate"] & 1) != 0
          || ([v19 isEqualToString:@"currentBoardingDate"] & 1) != 0
          || ([v19 isEqualToString:@"eventStartDate"] & 1) != 0
          || ([v19 isEqualToString:@"venueDoorsOpenDate"] & 1) != 0
          || ([v19 isEqualToString:@"venueGatesOpenDate"] & 1) != 0
          || ([v19 isEqualToString:@"venueParkingLotsOpenDate"] & 1) != 0
          || ([v19 isEqualToString:@"venueBoxOfficeOpenDate"] & 1) != 0
          || ([v19 isEqualToString:@"venueFanZoneOpenDate"] & 1) != 0
          || ([v19 isEqualToString:@"venueOpenDate"] & 1) != 0
          || ([v19 isEqualToString:@"venueCloseDate"] & 1) != 0)
        {
          goto LABEL_96;
        }
        char v20 = [v19 isEqualToString:@"eventEndDate"];

        if (v20 & 1) != 0 || ([v19 isEqualToString:@"eventStartDateInfo"]) {
          goto LABEL_97;
        }
        id v21 = v19;
        if (([v21 isEqualToString:@"flightNumber"] & 1) != 0
          || ([v21 isEqualToString:@"duration"] & 1) != 0
          || ([v21 isEqualToString:@"tailgatingAllowed"] & 1) != 0)
        {
          goto LABEL_96;
        }
        char v22 = [v21 isEqualToString:@"silenceRequested"];

        if (v22) {
          goto LABEL_97;
        }
        id v23 = v21;
        if (([v23 isEqualToString:@"departureLocation"] & 1) != 0
          || ([v23 isEqualToString:@"destinationLocation"] & 1) != 0)
        {
          goto LABEL_96;
        }
        char v24 = [v23 isEqualToString:@"venueLocation"];

        if (v24) {
          goto LABEL_97;
        }
        id v25 = v23;
        if ([v25 isEqualToString:@"balance"]) {
          goto LABEL_96;
        }
        char v26 = [v25 isEqualToString:@"balance"];

        if (v26 & 1) != 0 || ([v25 isEqualToString:@"passengerName"]) {
          goto LABEL_97;
        }
        id v27 = v25;
        if (([v27 isEqualToString:@"artistIDs"] & 1) != 0
          || ([v27 isEqualToString:@"performerNames"] & 1) != 0
          || ([v27 isEqualToString:@"albumIDs"] & 1) != 0)
        {
          goto LABEL_96;
        }
        char v28 = [v27 isEqualToString:@"playlistIDs"];

        if (v28) {
          goto LABEL_97;
        }
        id v29 = v27;
        if ([v29 isEqualToString:@"seats"])
        {
          _os_feature_enabled_impl();
LABEL_96:

LABEL_97:
LABEL_98:
          id v30 = [v85 objectForKeyedSubscript:v17];
          id v31 = [v41 objectForKeyedSubscript:v17];
          uint64_t v32 = v31;
          if (v31 && ([v31 isEqual:v30] & 1) == 0)
          {
            v33 = [(PKPass *)self _changeMessageForSemantic:v30 newSemantic:v32];
            if (v33) {
              [(PKDiff *)v84 addHunkWithKey:v17 oldValue:v30 newValue:v32 message:v33];
            }
          }
          goto LABEL_104;
        }
        char v34 = [v29 isEqualToString:@"wifiAccess"];
        int v35 = _os_feature_enabled_impl();
        if (!v35 || (v34 & 1) != 0) {
          char v36 = v35 | v34;
        }
        else {
          char v36 = [v29 isEqualToString:@"airPlay"];
        }

        if (v36) {
          goto LABEL_98;
        }
        id v30 = PKLogFacilityTypeGetObject(0);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v102 = v29;
          _os_log_impl(&dword_190E10000, v30, OS_LOG_TYPE_DEFAULT, "Ignoring semantic value in diff for unknown key %@", buf, 0xCu);
        }
LABEL_104:

        ++v16;
      }
      while (v14 != v16);
      uint64_t v37 = [obj countByEnumeratingWithState:&v95 objects:v103 count:16];
      uint64_t v14 = v37;
      if (!v37)
      {
        unint64_t v8 = 0x1E4F1C000;
        id v4 = v81;
        goto LABEL_130;
      }
    }
  }
  uint64_t v38 = [(PKPass *)self frontFieldBuckets];
  long long v39 = _FieldsByKey(v38);

  long long v40 = [v4 frontFieldBuckets];
  long long v41 = _FieldsByKey(v40);

  long long v42 = [MEMORY[0x1E4F1CA80] set];
  id v85 = v39;
  long long v43 = [v39 allKeys];
  [v42 addObjectsFromArray:v43];

  long long v44 = [v41 allKeys];
  [v42 addObjectsFromArray:v44];

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  obuint64_t j = v42;
  uint64_t v45 = [obj countByEnumeratingWithState:&v91 objects:v100 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    id v82 = self;
    uint64_t v47 = *(void *)v92;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v92 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = *(void *)(*((void *)&v91 + 1) + 8 * i);
        long long v50 = [v85 valueForKey:v49];
        uint64_t v51 = [v50 value];
        long long v52 = (void *)v51;
        if (v51) {
          long long v53 = (__CFString *)v51;
        }
        else {
          long long v53 = &stru_1EE0F5368;
        }
        v54 = v53;

        unsigned int v55 = [v41 valueForKey:v49];
        uint64_t v56 = [v55 value];

        id v57 = [v41 valueForKey:v49];
        uint64_t v58 = [v57 changeMessage];

        if (v56 && ([v56 isEqual:v54] & 1) == 0 && v58) {
          [(PKDiff *)v84 addHunkWithKey:v49 oldValue:v54 newValue:v56 message:v58];
        }
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v91 objects:v100 count:16];
    }
    while (v46);
    self = v82;
    unint64_t v8 = 0x1E4F1C000uLL;
  }
LABEL_130:

  v59 = [(PKPass *)self backFieldBuckets];
  v60 = _FieldsByKey(v59);

  id v61 = [v4 backFieldBuckets];
  uint64_t v62 = _FieldsByKey(v61);

  uint64_t v63 = [*(id *)(v8 + 2688) set];
  uint64_t v64 = [v60 allKeys];
  [v63 addObjectsFromArray:v64];

  uint64_t v65 = [v62 allKeys];
  [v63 addObjectsFromArray:v65];

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v86 = v63;
  uint64_t v66 = [v86 countByEnumeratingWithState:&v87 objects:v99 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v88;
    do
    {
      for (uint64_t j = 0; j != v67; ++j)
      {
        if (*(void *)v88 != v68) {
          objc_enumerationMutation(v86);
        }
        uint64_t v70 = *(void *)(*((void *)&v87 + 1) + 8 * j);
        uint64_t v71 = [v60 valueForKey:v70];
        uint64_t v72 = [v71 value];
        uint64_t v73 = (void *)v72;
        v74 = &stru_1EE0F5368;
        if (v72) {
          v74 = (__CFString *)v72;
        }
        uint64_t v75 = v74;

        id v76 = [v62 valueForKey:v70];
        uint64_t v77 = [v76 value];

        v78 = [v62 valueForKey:v70];
        uint64_t v79 = [v78 changeMessage];

        if (v77 && ([v77 isEqual:v75] & 1) == 0 && v79) {
          [(PKDiff *)v84 addHunkWithKey:v70 oldValue:v75 newValue:v77 message:v79];
        }
      }
      uint64_t v67 = [v86 countByEnumeratingWithState:&v87 objects:v99 count:16];
    }
    while (v67);
  }

  return v84;
}

- (NSString)eventName
{
  BOOL v3 = [(PKPass *)self stringForSemanticKey:@"eventName"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PKPass *)self localizedName];
  }
  id v6 = v5;

  return (NSString *)v6;
}

- (PKLocation)eventLocation
{
  BOOL v3 = [(PKPass *)self locationForSemanticKey:@"venueLocation"];
  if (!v3)
  {
    if ([(PKPass *)self hasLocationRelevancyInfo])
    {
      id v4 = [(PKPass *)self embeddedLocationsArray];
      BOOL v3 = [v4 firstObject];
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  return (PKLocation *)v3;
}

- (PKSeatingInformation)seatingInformation
{
  unint64_t v2 = [(PKPass *)self allSemantics];
  BOOL v3 = [v2 objectForKeyedSubscript:@"seats"];

  id v4 = [[PKSeatingInformation alloc] initFromSemantic:v3];
  return (PKSeatingInformation *)v4;
}

- (int64_t)transitType
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 transitType];

  return v3;
}

- (NSArray)backFieldBuckets
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 backFieldBuckets];

  return (NSArray *)v3;
}

- (NSArray)passDetailSections
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 passDetailSections];

  return (NSArray *)v3;
}

- (NSArray)auxiliaryPassInformation
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 auxiliaryPassInformationSections];

  return (NSArray *)v3;
}

- (id)primaryFields
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 primaryFields];

  return v3;
}

- (id)balanceFields
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 balanceFields];

  return v3;
}

- (id)autoTopUpFields
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 autoTopUpFields];

  return v3;
}

- (id)balances
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 balances];

  return v3;
}

- (NSArray)auxiliaryStoreIdentifiers
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 auxiliaryStoreIdentifiers];

  return (NSArray *)v3;
}

- (NSURL)appLaunchURL
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 appLaunchURL];

  return (NSURL *)v3;
}

- (PKPassPersonalization)personalization
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 personalization];

  return (PKPassPersonalization *)v3;
}

- (BOOL)isPersonalizable
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 personalization];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)semantics
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 semantics];

  return v3;
}

- (id)fidoProfile
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 fidoProfile];

  return v3;
}

- (id)issuerBindingInformation
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  int64_t v3 = [v2 issuerBindingInformation];

  return v3;
}

- (PKImage)rawIcon
{
  unint64_t v2 = [(PKObject *)self imageSetLoadedIfNeeded:1];
  int64_t v3 = [v2 rawIcon];

  return (PKImage *)v3;
}

- (PKImage)notificationIconImage
{
  unint64_t v2 = [(PKObject *)self imageSetLoadedIfNeeded:1];
  int64_t v3 = [v2 notificationIconImage];

  return (PKImage *)v3;
}

- (PKImage)partialFrontFaceImage
{
  unint64_t v2 = [(PKObject *)self imageSetLoadedIfNeeded:2];
  int64_t v3 = [v2 placeHolderImage];

  return (PKImage *)v3;
}

- (PKColor)partialFrontFaceImageAverageColor
{
  if ([(PKObject *)self isImageSetLoaded:2]
    || ![(PKObject *)self isImageSetLoaded:0])
  {
    int64_t v3 = [(PKObject *)self imageSetLoadedIfNeeded:2];
    uint64_t v4 = [v3 placeHolderImageAverageColor];
  }
  else
  {
    int64_t v3 = [(PKObject *)self imageSetLoadedIfNeeded:0];
    uint64_t v4 = [v3 faceImageAverageColor];
  }
  id v5 = (void *)v4;

  return (PKColor *)v5;
}

- (CGRect)stripRect
{
  unint64_t v2 = [(PKObject *)self imageSetLoadedIfNeeded:0];
  [v2 stripRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (PKImage)footerImage
{
  unint64_t v2 = [(PKObject *)self imageSetLoadedIfNeeded:0];
  double v3 = [v2 footerImage];

  return (PKImage *)v3;
}

- (PKImage)cardHolderPicture
{
  unint64_t v2 = [(PKObject *)self imageSetLoadedIfNeeded:5];
  double v3 = [v2 cardHolderPicture];

  return (PKImage *)v3;
}

- (PKImage)personalizationLogoImage
{
  unint64_t v2 = [(PKObject *)self imageSetLoadedIfNeeded:3];
  double v3 = [v2 logoImage];

  return (PKImage *)v3;
}

- (id)backgroundImage
{
  unint64_t v2 = [(PKObject *)self imageSetLoadedIfNeeded:4];
  double v3 = [v2 backgroundImage];

  return v3;
}

- (id)stripImage
{
  unint64_t v2 = [(PKObject *)self imageSetLoadedIfNeeded:4];
  double v3 = [v2 stripImage];

  return v3;
}

- (id)thumbnailImage
{
  unint64_t v2 = [(PKObject *)self imageSetLoadedIfNeeded:4];
  double v3 = [v2 thumbnailImage];

  return v3;
}

- (PKImage)compactBankLogoDarkImage
{
  unint64_t v2 = [(PKObject *)self imageSetLoadedIfNeeded:4];
  double v3 = [v2 compactBankLogoDarkImage];

  return (PKImage *)v3;
}

- (PKImage)compactBankLogoLightImage
{
  unint64_t v2 = [(PKObject *)self imageSetLoadedIfNeeded:4];
  double v3 = [v2 compactBankLogoLightImage];

  return (PKImage *)v3;
}

- (id)secondaryLogoImage
{
  unint64_t v2 = [(PKObject *)self imageSetLoadedIfNeeded:4];
  double v3 = [v2 secondaryLogoImage];

  return v3;
}

- (id)venueMapImage
{
  unint64_t v2 = [(PKObject *)self imageSetLoadedIfNeeded:8];
  double v3 = [v2 venueMapImage];

  return v3;
}

- (NSString)businessChatIdentifier
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  double v3 = [v2 businessChatIdentifier];

  return (NSString *)v3;
}

- (PKPassBarcodeSettings)barcodeSettings
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  double v3 = [v2 barcodeSettings];

  return (PKPassBarcodeSettings *)v3;
}

- (BOOL)isValid
{
  if ([(PKPass *)self isRevoked] || [(PKPass *)self isExpired]) {
    return 0;
  }
  else {
    return ![(PKPass *)self isVoided];
  }
}

- (PKPassLiveRenderedArmedStateImageSet)liveRenderedArmedStateImageSet
{
  return (PKPassLiveRenderedArmedStateImageSet *)[(PKObject *)self imageSetLoadedIfNeeded:7];
}

- (PKPassFrontFaceImageSet)frontFaceImageSet
{
  return (PKPassFrontFaceImageSet *)[(PKObject *)self imageSetLoadedIfNeeded:0];
}

- (NSString)cardholderInfoSectionTitle
{
  unint64_t v2 = [(PKObject *)self contentLoadedIfNeeded];
  double v3 = [v2 cardholderInfoSectionTitle];

  return (NSString *)v3;
}

- (PKLiveRenderedShaderSet)liveRenderedShaderSet
{
  liveRenderedShaderSet = self->_liveRenderedShaderSet;
  if (!liveRenderedShaderSet)
  {
    double v4 = [PKLiveRenderedShaderSet alloc];
    double v5 = [(PKObject *)self dataAccessor];
    double v6 = [(PKLiveRenderedShaderSet *)v4 initWithDataAccessor:v5 suffix:0];
    double v7 = self->_liveRenderedShaderSet;
    self->_liveRenderedShaderSet = v6;

    liveRenderedShaderSet = self->_liveRenderedShaderSet;
  }
  return liveRenderedShaderSet;
}

- (id)passLocalizedStringForKey:(id)a3
{
  id v4 = a3;
  double v5 = [(PKObject *)self dataAccessor];
  double v6 = [v5 passLocalizedStringForKey:v4];

  return v6;
}

- (int64_t)comparePassDatesToPass:(id)a3 searchOption:(unint64_t)a4
{
  id v6 = a3;
  double v7 = +[PKPass _dateForPassComparison:self searchOption:a4];
  double v8 = +[PKPass _dateForPassComparison:v6 searchOption:a4];

  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (v7) {
      int64_t v10 = -1;
    }
    else {
      int64_t v10 = v8 != 0;
    }
  }
  else
  {
    int64_t v10 = [v7 compare:v8];
  }

  return v10;
}

+ (id)_dateForPassComparison:(id)a3 searchOption:(unint64_t)a4
{
  id v5 = a3;
  id v6 = [v5 relevantDates];
  double v7 = +[PKPassRelevantDate findDateFromDates:v6 option:a4];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    BOOL v9 = [v5 expirationDate];
    int64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v5 modifiedDate];
    }
    id v8 = v11;
  }
  return v8;
}

- (BOOL)isEqualToPassIncludingMetadata:(id)a3
{
  id v4 = a3;
  id v5 = [(PKObject *)self manifestHash];
  uint64_t v6 = [v4 manifestHash];
  double v7 = (void *)v6;
  if (v5 && v6)
  {
    if ([v5 isEqual:v6])
    {
LABEL_4:
      id v8 = [(PKPass *)self ingestedDate];
      uint64_t v9 = [v4 ingestedDate];
      int64_t v10 = (void *)v9;
      if (v8 && v9)
      {
        if ([v8 isEqual:v9])
        {
LABEL_7:
          id v11 = [(PKPass *)self modifiedDate];
          uint64_t v12 = [v4 modifiedDate];
          double v13 = (void *)v12;
          if (v11 && v12)
          {
            if ([v11 isEqual:v12])
            {
LABEL_10:
              double v14 = [(PKObject *)self signingDate];
              uint64_t v15 = [v4 signingDate];
              uint64_t v16 = (void *)v15;
              if (v14 && v15)
              {
                if ([v14 isEqual:v15])
                {
LABEL_13:
                  char v28 = v14;
                  uint64_t v17 = [(PKPass *)self nfcPayload];
                  uint64_t v18 = [v4 nfcPayload];
                  id v19 = (void *)v18;
                  id v29 = (void *)v17;
                  if (v17 && v18)
                  {
                    char v20 = (void *)v18;
                    char v21 = [v29 isEqual:v18];
                    id v19 = v20;
                    if (v21)
                    {
LABEL_16:
                      id v27 = v19;
                      unint64_t v22 = [(PKObject *)self settings];
                      BOOL v23 = v22 == [v4 settings];
                      double v14 = v28;
                      if (v23)
                      {
                        BOOL v24 = [(PKPass *)self isRevoked];
                        int v25 = v24 ^ [v4 isRevoked] ^ 1;
                      }
                      else
                      {
                        LOBYTE(v25) = 0;
                      }
                      id v19 = v27;
                      goto LABEL_30;
                    }
                  }
                  else if (v17 == v18)
                  {
                    goto LABEL_16;
                  }
                  LOBYTE(v25) = 0;
                  double v14 = v28;
LABEL_30:

                  goto LABEL_31;
                }
              }
              else if (v14 == (void *)v15)
              {
                goto LABEL_13;
              }
              LOBYTE(v25) = 0;
LABEL_31:

              goto LABEL_32;
            }
          }
          else if (v11 == (void *)v12)
          {
            goto LABEL_10;
          }
          LOBYTE(v25) = 0;
LABEL_32:

          goto LABEL_33;
        }
      }
      else if (v8 == (void *)v9)
      {
        goto LABEL_7;
      }
      LOBYTE(v25) = 0;
LABEL_33:

      goto LABEL_34;
    }
  }
  else if (v5 == (void *)v6)
  {
    goto LABEL_4;
  }
  LOBYTE(v25) = 0;
LABEL_34:

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v39.receiver = self;
  v39.super_class = (Class)PKPass;
  id v5 = -[PKObject copyWithZone:](&v39, sel_copyWithZone_);
  uint64_t v6 = [(NSString *)self->_passLibraryMachServiceName copyWithZone:a3];
  double v7 = (void *)*((void *)v5 + 37);
  *((void *)v5 + 37) = v6;

  uint64_t v8 = [(NSString *)self->_deviceName copyWithZone:a3];
  uint64_t v9 = (void *)*((void *)v5 + 36);
  *((void *)v5 + 36) = v8;

  *((unsigned char *)v5 + 208) = self->_remotePass;
  uint64_t v10 = [(NSString *)self->_passTypeIdentifier copyWithZone:a3];
  id v11 = (void *)*((void *)v5 + 31);
  *((void *)v5 + 31) = v10;

  uint64_t v12 = [(NSString *)self->_teamID copyWithZone:a3];
  double v13 = (void *)*((void *)v5 + 41);
  *((void *)v5 + 41) = v12;

  uint64_t v14 = [(NSString *)self->_serialNumber copyWithZone:a3];
  uint64_t v15 = (void *)*((void *)v5 + 30);
  *((void *)v5 + 30) = v14;

  uint64_t v16 = [(NSString *)self->_provisioningCredentialHash copyWithZone:a3];
  uint64_t v17 = (void *)*((void *)v5 + 69);
  *((void *)v5 + 69) = v16;

  uint64_t v18 = [(NSNumber *)self->_sequenceCounter copyWithZone:a3];
  id v19 = (void *)*((void *)v5 + 38);
  *((void *)v5 + 38) = v18;

  uint64_t v20 = [(NSString *)self->_organizationName copyWithZone:a3];
  char v21 = (void *)*((void *)v5 + 32);
  *((void *)v5 + 32) = v20;

  uint64_t v22 = [(NSArray *)self->_relevantDates copyWithZone:a3];
  BOOL v23 = (void *)*((void *)v5 + 33);
  *((void *)v5 + 33) = v22;

  uint64_t v24 = [(NSDate *)self->_expirationDate copyWithZone:a3];
  int v25 = (void *)*((void *)v5 + 42);
  *((void *)v5 + 42) = v24;

  *((unsigned char *)v5 + 211) = self->_voided;
  uint64_t v26 = [(NSDictionary *)self->_userInfo copyWithZone:a3];
  id v27 = (void *)*((void *)v5 + 34);
  *((void *)v5 + 34) = v26;

  uint64_t v28 = [(NSString *)self->_groupingID copyWithZone:a3];
  id v29 = (void *)*((void *)v5 + 43);
  *((void *)v5 + 43) = v28;

  uint64_t v30 = [(NSArray *)self->_embeddedLocations copyWithZone:a3];
  id v31 = (void *)*((void *)v5 + 28);
  *((void *)v5 + 28) = v30;

  uint64_t v32 = [(NSSet *)self->_embeddedBeacons copyWithZone:a3];
  v33 = (void *)*((void *)v5 + 44);
  *((void *)v5 + 44) = v32;

  id v34 = [(PKNFCPayload *)self->_nfcPayload copyWithZone:a3];
  int v35 = (void *)*((void *)v5 + 51);
  *((void *)v5 + 51) = v34;

  *((unsigned char *)v5 + 212) = self->_hasStoredValue;
  *((unsigned char *)v5 + 213) = self->_liveRenderedBackground;
  *((void *)v5 + 67) = self->_liveRenderType;
  *((void *)v5 + 68) = self->_homeKeyLiveRenderType;
  *((unsigned char *)v5 + 214) = self->_supportsCategoryVisualization;
  *((unsigned char *)v5 + 215) = self->_liveRenderingRequiresEnablement;
  *((void *)v5 + 29) = self->_passType;
  *((void *)v5 + 47) = self->_sharingMethod;
  objc_storeStrong((id *)v5 + 49, self->_sharingText);
  objc_storeStrong((id *)v5 + 48, self->_sharingURL);
  objc_storeStrong((id *)v5 + 71, self->_ingestedDate);
  objc_storeStrong((id *)v5 + 72, self->_modifiedDate);
  *((unsigned char *)v5 + 218) = self->_revoked;
  uint64_t v36 = [(NSSet *)self->_associatedPassTypeIdentifiers copyWithZone:a3];
  uint64_t v37 = (void *)*((void *)v5 + 50);
  *((void *)v5 + 50) = v36;

  *((unsigned char *)v5 + 216) = self->_muteReadyForUseNotification;
  objc_storeStrong((id *)v5 + 52, self->_transferURL);
  objc_storeStrong((id *)v5 + 53, self->_sellURL);
  objc_storeStrong((id *)v5 + 54, self->_bagPolicyURL);
  objc_storeStrong((id *)v5 + 55, self->_orderFoodURL);
  objc_storeStrong((id *)v5 + 56, self->_transitInformationURL);
  objc_storeStrong((id *)v5 + 57, self->_parkingInformationURL);
  objc_storeStrong((id *)v5 + 58, self->_directionsInformationURL);
  objc_storeStrong((id *)v5 + 59, self->_merchandiseURL);
  objc_storeStrong((id *)v5 + 60, self->_accessibilityURL);
  objc_storeStrong((id *)v5 + 61, self->_purchaseParkingURL);
  objc_storeStrong((id *)v5 + 62, self->_partnerAddOnURL);
  objc_storeStrong((id *)v5 + 63, self->_contactVenuePhoneNumber);
  objc_storeStrong((id *)v5 + 64, self->_contactVenueEmail);
  objc_storeStrong((id *)v5 + 65, self->_contactVenueWebsite);
  return v5;
}

- (BOOL)availableForAutomaticPresentationUsingBeaconContext
{
  unint64_t v2 = [(PKPass *)self embeddedBeacons];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)stringForSemanticKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPass *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  double v7 = [v6 stringValue];

  return v7;
}

- (id)dateForSemanticKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPass *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  double v7 = [v6 dateValue];

  return v7;
}

- (id)eventDateInfoForSemanticKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPass *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  double v7 = [v6 eventDateInfoValue];

  return v7;
}

- (id)numberForSemanticKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPass *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  double v7 = [v6 numberValue];

  return v7;
}

- (id)locationForSemanticKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPass *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  double v7 = [v6 locationValue];

  return v7;
}

- (id)currencyAmountForSemanticKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPass *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  double v7 = [v6 currencyAmountValue];

  return v7;
}

- (id)personNameComponentsForSemanticKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPass *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  double v7 = [v6 personNameComponentsValue];

  return v7;
}

- (id)stringsForSemanticKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPass *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  double v7 = [v6 stringsValue];

  return v7;
}

- (id)dictionariesForSemanticKey:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPass *)self allSemantics];
  uint64_t v6 = [v5 objectForKey:v4];

  double v7 = [v6 dictionariesValue];

  return v7;
}

- (BOOL)supportsFeatureForCurrentDevice:(unint64_t)a3
{
  id v5 = PKDeviceClass();
  uint64_t v6 = +[PKOSVersionRequirement fromDeviceVersion];
  LOBYTE(a3) = [(PKPass *)self supportsFeature:a3 forDevice:v5 version:v6];

  return a3;
}

- (BOOL)supportsFeature:(unint64_t)a3 forDevice:(id)a4 version:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = PKPassFeatureTypeToString(a3);
  if (v10)
  {
    id v11 = [(PKObject *)self contentLoadedIfNeeded];
    uint64_t v12 = [v11 features];
    double v13 = [v12 objectForKeyedSubscript:v10];

    if (v13 && [v13 enabled])
    {
      uint64_t v14 = [v13 versionRange];
      uint64_t v15 = v14;
      if (v14) {
        char v16 = [v14 versionMeetsRequirements:v9 deviceClass:v8];
      }
      else {
        char v16 = 1;
      }
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (id)_localizationKeyForMultipleDiff
{
  unint64_t v2 = [(PKPass *)self style];
  if (v2 > 9) {
    return @"PASS_MULTIPLE_CHANGES_BULLETIN_PASS";
  }
  else {
    return off_1E56EDC08[v2];
  }
}

- (id)_changeMessageForFieldKey:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v5 = [(PKPass *)self frontFieldBuckets];
  v46[0] = v5;
  uint64_t v6 = [(PKPass *)self backFieldBuckets];
  v46[1] = v6;
  double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v41;
    id v29 = v7;
    uint64_t v27 = *(void *)v41;
    do
    {
      uint64_t v10 = 0;
      uint64_t v26 = v8;
      do
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v40 + 1) + 8 * v10);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v12 = v11;
        uint64_t v30 = [v12 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v30)
        {
          uint64_t v13 = *(void *)v37;
          id v31 = v12;
          uint64_t v28 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v30; ++i)
            {
              if (*(void *)v37 != v13) {
                objc_enumerationMutation(v12);
              }
              uint64_t v15 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              long long v32 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              long long v35 = 0u;
              id v16 = v15;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v44 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = *(void *)v33;
                while (2)
                {
                  for (uint64_t j = 0; j != v18; ++j)
                  {
                    if (*(void *)v33 != v19) {
                      objc_enumerationMutation(v16);
                    }
                    char v21 = *(void **)(*((void *)&v32 + 1) + 8 * j);
                    uint64_t v22 = objc_msgSend(v21, "key", v26);
                    char v23 = [v22 isEqual:v4];

                    if (v23)
                    {
                      uint64_t v24 = [v21 changeMessage];

                      double v7 = v29;
                      goto LABEL_26;
                    }
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v44 count:16];
                  if (v18) {
                    continue;
                  }
                  break;
                }
              }

              id v12 = v31;
              uint64_t v13 = v28;
            }
            double v7 = v29;
            uint64_t v30 = [v31 countByEnumeratingWithState:&v36 objects:v45 count:16];
          }
          while (v30);
        }

        ++v10;
        uint64_t v9 = v27;
      }
      while (v10 != v26);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v47 count:16];
      uint64_t v9 = v27;
      uint64_t v24 = 0;
    }
    while (v8);
  }
  else
  {
    uint64_t v24 = 0;
  }
LABEL_26:

  return v24;
}

- (id)_changeMessageForDateSemantic:(id)a3 newSemantic:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 semanticKey];
  if (([v7 isEqualToString:@"originalDepartureDate"] & 1) != 0
    || ([v7 isEqualToString:@"currentDepartureDate"] & 1) != 0
    || ([v7 isEqualToString:@"originalArrivalDate"] & 1) != 0
    || ([v7 isEqualToString:@"currentArrivalDate"] & 1) != 0
    || ([v7 isEqualToString:@"originalBoardingDate"] & 1) != 0
    || ([v7 isEqualToString:@"currentBoardingDate"] & 1) != 0
    || ([v7 isEqualToString:@"eventStartDate"] & 1) != 0
    || ([v7 isEqualToString:@"venueDoorsOpenDate"] & 1) != 0
    || ([v7 isEqualToString:@"venueGatesOpenDate"] & 1) != 0
    || ([v7 isEqualToString:@"venueParkingLotsOpenDate"] & 1) != 0
    || ([v7 isEqualToString:@"venueBoxOfficeOpenDate"] & 1) != 0
    || ([v7 isEqualToString:@"venueFanZoneOpenDate"] & 1) != 0
    || ([v7 isEqualToString:@"venueOpenDate"] & 1) != 0
    || [v7 isEqualToString:@"venueCloseDate"])
  {
  }
  else
  {
    char v23 = [v7 isEqualToString:@"eventEndDate"];

    if ((v23 & 1) == 0)
    {
      __break(1u);
      return result;
    }
  }
  uint64_t v8 = [v5 dateValue];
  uint64_t v9 = [v6 dateValue];
  if ([@"eventStartDate" isEqualToString:v7])
  {
    uint64_t v10 = @"SEMANTICS_EVENT_START_";
    if (!v8) {
      goto LABEL_27;
    }
LABEL_21:
    id v24 = v5;
    id v11 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    id v12 = [v11 components:96 fromDate:v8];
    uint64_t v13 = [v11 components:96 fromDate:v9];
    uint64_t v14 = [v12 hour];
    if (v14 == [v13 hour])
    {
      uint64_t v15 = [v12 minute];
      BOOL v16 = v15 != [v13 minute];
    }
    else
    {
      BOOL v16 = 1;
    }
    char v18 = [v11 isDate:v9 equalToDate:v8 toUnitGranularity:16];

    id v5 = v24;
    if (!v16 || (v18 & 1) != 0)
    {
      if (v16)
      {
        uint64_t v19 = [(__CFString *)v10 stringByAppendingString:@"TIME_CHANGE_MESSAGE"];
        PKTimeStringFromDate(v9, 0);
      }
      else
      {
        uint64_t v19 = [(__CFString *)v10 stringByAppendingString:@"DATE_CHANGE_MESSAGE"];
        PKMediumDayAndLongMonthStringFromDate(v9);
      uint64_t v20 = };
      goto LABEL_28;
    }
LABEL_27:
    uint64_t v19 = [(__CFString *)v10 stringByAppendingString:@"DATE_TIME_CHANGE_MESSAGE"];
    uint64_t v20 = PKMediumDayLongMonthAndTimeStringFromDate(v9);
LABEL_28:
    char v21 = (void *)v20;
    uint64_t v17 = PKLocalizedTicketingString(v19, &stru_1EE0F6808.isa, v20);

    goto LABEL_29;
  }
  if ([@"eventEndDate" isEqualToString:v7])
  {
    uint64_t v10 = @"SEMANTICS_EVENT_END_";
    if (!v8) {
      goto LABEL_27;
    }
    goto LABEL_21;
  }
  uint64_t v17 = 0;
LABEL_29:

  return v17;
}

- (id)_changeMessageForEventDateInfoSemantic:(id)a3 newSemantic:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 semanticKey];
  id result = (id)[v7 isEqualToString:@"eventStartDateInfo"];
  if ((result & 1) == 0)
  {
    __break(1u);
    return result;
  }
  uint64_t v9 = [v5 eventDateInfoValue];
  uint64_t v10 = [v6 eventDateInfoValue];
  id v11 = [v9 date];
  id v12 = [v10 date];
  if (!v12) {
    goto LABEL_28;
  }
  if ([v9 ignoreTimeComponents] & 1) != 0 || (objc_msgSend(v9, "isUnannounced")) {
    int v13 = 0;
  }
  else {
    int v13 = [v9 isUndetermined] ^ 1;
  }
  if ([v10 ignoreTimeComponents] & 1) != 0 || (objc_msgSend(v10, "isUnannounced")) {
    int v14 = 1;
  }
  else {
    int v14 = [v10 isUndetermined];
  }
  id v29 = v7;
  if (v11)
  {
    id v28 = v5;
    uint64_t v15 = [MEMORY[0x1E4F1C9A8] autoupdatingCurrentCalendar];
    BOOL v16 = [v15 components:96 fromDate:v11];
    uint64_t v17 = [v15 components:96 fromDate:v12];
    if (v14)
    {
      BOOL v18 = 0;
    }
    else
    {
      int v27 = v13;
      uint64_t v21 = [v16 hour];
      if (v21 == [v17 hour])
      {
        uint64_t v22 = [v16 minute];
        BOOL v18 = v22 != [v17 minute];
      }
      else
      {
        BOOL v18 = 1;
      }
      int v13 = v27;
    }
    int v20 = v18 | (v13 == 0) & ~v14;
    int v19 = [v15 isDate:v12 equalToDate:v11 toUnitGranularity:16];

    if (v19)
    {
      id v5 = v28;
      id v7 = v29;
      if (!v20) {
        goto LABEL_28;
      }
    }
    else
    {
      id v5 = v28;
      id v7 = v29;
    }
  }
  else
  {
    int v19 = 0;
    int v20 = v14 ^ 1;
  }
  if ([@"eventStartDateInfo" isEqualToString:v7])
  {
    if ((v19 | v20 ^ 1))
    {
      if (v20)
      {
        char v23 = [@"SEMANTICS_EVENT_START_" stringByAppendingString:@"TIME_CHANGE_MESSAGE"];
        PKTimeStringFromDate(v12, 0);
      }
      else
      {
        char v23 = [@"SEMANTICS_EVENT_START_" stringByAppendingString:@"DATE_CHANGE_MESSAGE"];
        PKMediumDayAndLongMonthStringFromDate(v12);
      uint64_t v24 = };
    }
    else
    {
      char v23 = [@"SEMANTICS_EVENT_START_" stringByAppendingString:@"DATE_TIME_CHANGE_MESSAGE"];
      uint64_t v24 = PKMediumDayLongMonthAndTimeStringFromDate(v12);
    }
    uint64_t v26 = (void *)v24;
    int v25 = PKLocalizedTicketingString(v23, &stru_1EE0F6808.isa, v24);

    id v7 = v29;
    goto LABEL_32;
  }
LABEL_28:
  int v25 = 0;
LABEL_32:

  return v25;
}

- (id)_changeMessageForDictionariesSemantic:(id)a3 newSemantic:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 semanticKey];
  if ([v7 isEqualToString:@"seats"])
  {
    _os_feature_enabled_impl();
  }
  else
  {
    char v8 = [v7 isEqualToString:@"wifiAccess"];
    int v9 = _os_feature_enabled_impl();
    if (!v9 || (v8 & 1) != 0) {
      char v10 = v9 | v8;
    }
    else {
      char v10 = [v7 isEqualToString:@"airPlay"];
    }

    if ((v10 & 1) == 0)
    {
      __break(1u);
      return result;
    }
  }
  if ([@"seats" isEqualToString:v7])
  {
    id v12 = [[PKSeatingInformation alloc] initFromSemantic:v5];
    id v13 = [[PKSeatingInformation alloc] initFromSemantic:v6];
    int v14 = [v13 changeMessageFromInformation:v12];
  }
  else
  {
    int v14 = 0;
  }

  return v14;
}

- (id)_changeMessageForSemantic:(id)a3 newSemantic:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 semanticKey];
  if (([v8 isEqualToString:@"originalDepartureDate"] & 1) != 0
    || ([v8 isEqualToString:@"currentDepartureDate"] & 1) != 0
    || ([v8 isEqualToString:@"originalArrivalDate"] & 1) != 0
    || ([v8 isEqualToString:@"currentArrivalDate"] & 1) != 0
    || ([v8 isEqualToString:@"originalBoardingDate"] & 1) != 0
    || ([v8 isEqualToString:@"currentBoardingDate"] & 1) != 0
    || ([v8 isEqualToString:@"eventStartDate"] & 1) != 0
    || ([v8 isEqualToString:@"venueDoorsOpenDate"] & 1) != 0
    || ([v8 isEqualToString:@"venueGatesOpenDate"] & 1) != 0
    || ([v8 isEqualToString:@"venueParkingLotsOpenDate"] & 1) != 0
    || ([v8 isEqualToString:@"venueBoxOfficeOpenDate"] & 1) != 0
    || ([v8 isEqualToString:@"venueFanZoneOpenDate"] & 1) != 0
    || ([v8 isEqualToString:@"venueOpenDate"] & 1) != 0
    || [v8 isEqualToString:@"venueCloseDate"])
  {

LABEL_16:
    uint64_t v9 = [(PKPass *)self _changeMessageForDateSemantic:v6 newSemantic:v7];
LABEL_17:
    char v10 = (void *)v9;
    goto LABEL_18;
  }
  int v12 = [v8 isEqualToString:@"eventEndDate"];

  if (v12) {
    goto LABEL_16;
  }
  if ([v8 isEqualToString:@"eventStartDateInfo"])
  {
    uint64_t v9 = [(PKPass *)self _changeMessageForEventDateInfoSemantic:v6 newSemantic:v7];
    goto LABEL_17;
  }
  id v13 = v8;
  if ([v13 isEqualToString:@"seats"])
  {
    _os_feature_enabled_impl();

LABEL_26:
    uint64_t v9 = [(PKPass *)self _changeMessageForDictionariesSemantic:v6 newSemantic:v7];
    goto LABEL_17;
  }
  int v14 = [v13 isEqualToString:@"wifiAccess"];
  int v15 = _os_feature_enabled_impl();
  if (!v15 || (v14 & 1) != 0)
  {
    int v17 = v15 | v14;

    if (v17 == 1) {
      goto LABEL_26;
    }
  }
  else
  {
    char v16 = [v13 isEqualToString:@"airPlay"];

    if (v16) {
      goto LABEL_26;
    }
  }
  if ([@"eventName" isEqualToString:v13])
  {
    BOOL v18 = @"SEMANTICS_EVENT_NAME_CHANGE_MESSAGE";
LABEL_36:
    uint64_t v9 = PKLocalizedTicketingString(&v18->isa, 0);
    goto LABEL_17;
  }
  if ([@"performerNames" isEqualToString:v13])
  {
    BOOL v18 = @"SEMANTICS_PERFORMER_NAMES_CHANGE_MESSAGE";
    goto LABEL_36;
  }
  if (![@"venueEntrance" isEqualToString:v13])
  {
    id v20 = 0;
    int v19 = 0;
LABEL_99:
    char v10 = 0;
    goto LABEL_100;
  }
  int v19 = PKLocalizedTicketingString(&cfstr_SemanticsVenue.isa, 0);
  id v20 = v19;
  if (!v19) {
    goto LABEL_99;
  }
  int v19 = PKValidateChangeMessage(v19);
  if (v19) {
    goto LABEL_99;
  }
  id v21 = v13;
  if (([v21 isEqualToString:@"departureLocationDescription"] & 1) != 0
    || ([v21 isEqualToString:@"destinationLocationDescription"] & 1) != 0
    || ([v21 isEqualToString:@"transitProvider"] & 1) != 0
    || ([v21 isEqualToString:@"vehicleName"] & 1) != 0
    || ([v21 isEqualToString:@"vehicleNumber"] & 1) != 0
    || ([v21 isEqualToString:@"vehicleType"] & 1) != 0
    || ([v21 isEqualToString:@"boardingGroup"] & 1) != 0
    || ([v21 isEqualToString:@"boardingSequenceNumber"] & 1) != 0
    || ([v21 isEqualToString:@"confirmationNumber"] & 1) != 0
    || ([v21 isEqualToString:@"transitStatus"] & 1) != 0
    || ([v21 isEqualToString:@"transitStatusReason"] & 1) != 0
    || ([v21 isEqualToString:@"membershipProgramName"] & 1) != 0
    || ([v21 isEqualToString:@"membershipProgramNumber"] & 1) != 0
    || ([v21 isEqualToString:@"priorityStatus"] & 1) != 0
    || ([v21 isEqualToString:@"securityScreening"] & 1) != 0
    || ([v21 isEqualToString:@"flightCode"] & 1) != 0
    || ([v21 isEqualToString:@"airlineCode"] & 1) != 0
    || ([v21 isEqualToString:@"departureAirportCode"] & 1) != 0
    || ([v21 isEqualToString:@"departureAirportName"] & 1) != 0
    || ([v21 isEqualToString:@"departureTerminal"] & 1) != 0
    || ([v21 isEqualToString:@"departureGate"] & 1) != 0
    || ([v21 isEqualToString:@"destinationAirportCode"] & 1) != 0
    || ([v21 isEqualToString:@"destinationAirportName"] & 1) != 0
    || ([v21 isEqualToString:@"destinationTerminal"] & 1) != 0
    || ([v21 isEqualToString:@"destinationGate"] & 1) != 0
    || ([v21 isEqualToString:@"departurePlatform"] & 1) != 0
    || ([v21 isEqualToString:@"departureStationName"] & 1) != 0
    || ([v21 isEqualToString:@"destinationPlatform"] & 1) != 0
    || ([v21 isEqualToString:@"destinationStationName"] & 1) != 0
    || ([v21 isEqualToString:@"carNumber"] & 1) != 0
    || ([v21 isEqualToString:@"eventName"] & 1) != 0
    || ([v21 isEqualToString:@"venueName"] & 1) != 0
    || ([v21 isEqualToString:@"venueEntrance"] & 1) != 0
    || ([v21 isEqualToString:@"venueRoom"] & 1) != 0
    || ([v21 isEqualToString:@"venuePhoneNumber"] & 1) != 0
    || ([v21 isEqualToString:@"leagueName"] & 1) != 0
    || ([v21 isEqualToString:@"leagueAbbreviation"] & 1) != 0
    || ([v21 isEqualToString:@"homeTeamLocation"] & 1) != 0
    || ([v21 isEqualToString:@"homeTeamName"] & 1) != 0
    || ([v21 isEqualToString:@"homeTeamAbbreviation"] & 1) != 0
    || ([v21 isEqualToString:@"awayTeamLocation"] & 1) != 0
    || ([v21 isEqualToString:@"awayTeamName"] & 1) != 0
    || ([v21 isEqualToString:@"awayTeamAbbreviation"] & 1) != 0
    || ([v21 isEqualToString:@"sportName"] & 1) != 0
    || ([v21 isEqualToString:@"genre"] & 1) != 0
    || ([v21 isEqualToString:@"eventLiveMessage"] & 1) != 0
    || ([v21 isEqualToString:@"admissionLevel"] & 1) != 0
    || ([v21 isEqualToString:@"admissionLevelAbbreviation"] & 1) != 0
    || ([v21 isEqualToString:@"attendeeName"] & 1) != 0
    || ([v21 isEqualToString:@"venueRegionName"] & 1) != 0
    || ([v21 isEqualToString:@"entranceDescription"] & 1) != 0
    || ([v21 isEqualToString:@"venueEntranceGate"] & 1) != 0
    || ([v21 isEqualToString:@"venueEntranceDoor"] & 1) != 0
    || ([v21 isEqualToString:@"venueEntrancePortal"] & 1) != 0
    || [v21 isEqualToString:@"additionalTicketAttributes"])
  {
  }
  else
  {
    int v30 = [v21 isEqualToString:@"eventType"];

    if (!v30)
    {
      id v31 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v21;
        _os_log_impl(&dword_190E10000, v31, OS_LOG_TYPE_DEFAULT, "Ignoring changeMessage formatting for unknown or unsupported semantic key %@.", buf, 0xCu);
      }

      id v29 = 0;
      goto LABEL_97;
    }
  }
  uint64_t v22 = [v7 stringValue];
  id v29 = PKStringWithValidatedFormat(v20, @"%@", v23, v24, v25, v26, v27, v28, (uint64_t)v22);

LABEL_97:
  id v20 = v29;
  int v19 = 0;
  char v10 = v20;
LABEL_100:

LABEL_18:
  return v10;
}

- (NSArray)embeddedLocationsArray
{
  return self->_embeddedLocations;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setPassURL:(id)a3
{
}

- (BOOL)isRemotePass
{
  return self->_remotePass;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)passLibraryMachServiceName
{
  return self->_passLibraryMachServiceName;
}

- (NSNumber)sequenceCounter
{
  return self->_sequenceCounter;
}

- (BOOL)isCloudKitArchived
{
  return self->_isCloudKitArchived;
}

- (NSData)cloudKitMetadata
{
  return self->_cloudKitMetadata;
}

- (BOOL)isCloudKitSecurelyArchived
{
  return self->_isCloudKitSecurelyArchived;
}

- (NSData)cloudKitSecureMetadata
{
  return self->_cloudKitSecureMetadata;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (NSString)groupingID
{
  return self->_groupingID;
}

- (NSSet)embeddedBeacons
{
  return self->_embeddedBeacons;
}

- (NSURL)webLocationsURL
{
  return self->_webLocationsURL;
}

- (void)setWebLocationsURL:(id)a3
{
}

- (void)setLocalLocationsURL:(id)a3
{
}

- (int64_t)sharingMethod
{
  return self->_sharingMethod;
}

- (NSURL)sharingURL
{
  return self->_sharingURL;
}

- (NSString)sharingText
{
  return self->_sharingText;
}

- (NSSet)associatedPassTypeIdentifiers
{
  return self->_associatedPassTypeIdentifiers;
}

- (NSURL)transferURL
{
  return self->_transferURL;
}

- (NSURL)sellURL
{
  return self->_sellURL;
}

- (BOOL)hasStoredValue
{
  return self->_hasStoredValue;
}

- (PKImage)partialFrontFaceImagePlaceholder
{
  return self->_partialFrontFaceImagePlaceholder;
}

- (BOOL)liveRenderedBackground
{
  return self->_liveRenderedBackground;
}

- (unint64_t)homeKeyLiveRenderType
{
  return self->_homeKeyLiveRenderType;
}

- (NSString)provisioningCredentialHash
{
  return self->_provisioningCredentialHash;
}

- (void)setCardholderInfoSectionTitle:(id)a3
{
}

- (BOOL)muteReadyForUseNotification
{
  return self->_muteReadyForUseNotification;
}

- (BOOL)supportsLifecycleUpdates
{
  return self->_supportsLifecycleUpdates;
}

- (NSDate)ingestedDate
{
  return self->_ingestedDate;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (BOOL)hasFlightDetails
{
  if ([(PKPass *)self style] != 4
    || [(PKPass *)self transitType] != 1
    || ![(PKPass *)self flightNumber])
  {
    return 0;
  }
  BOOL v3 = [(PKPass *)self flightCode];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (unint64_t)flightNumber
{
  unint64_t v2 = [(PKPass *)self numberForSemanticKey:@"flightNumber"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (NSString)airlineCode
{
  unint64_t v2 = [(PKPass *)self stringForSemanticKey:@"airlineCode"];
  unint64_t v3 = [v2 uppercaseString];

  return (NSString *)v3;
}

- (NSString)flightCode
{
  unint64_t v3 = [(PKPass *)self airlineCode];
  unint64_t v4 = [(PKPass *)self flightNumber];
  id v5 = 0;
  if ([v3 length] && v4)
  {
    id v5 = [NSString stringWithFormat:@"%@%ld", v3, v4];
  }

  return (NSString *)v5;
}

- (void)loadFlightsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKPass *)self flightNumber];
  id v6 = [(PKPass *)self airlineCode];
  id v7 = [(PKPass *)self dateForSemanticKey:@"currentDepartureDate"];
  id v8 = [(PKPass *)self dateForSemanticKey:@"originalDepartureDate"];
  uint64_t v9 = [(PKPass *)self dateForSemanticKey:@"currentArrivalDate"];
  uint64_t v10 = [(PKPass *)self dateForSemanticKey:@"originalArrivalDate"];
  id v11 = (void *)v10;
  id v20 = v9;
  if (v7)
  {
    uint64_t v12 = 1;
    uint64_t v9 = v7;
  }
  else if (v8)
  {
    uint64_t v12 = 1;
    uint64_t v9 = v8;
  }
  else if (v9)
  {
    uint64_t v12 = 2;
  }
  else
  {
    if (!v10)
    {
      id v13 = 0;
      uint64_t v12 = 3;
      goto LABEL_10;
    }
    uint64_t v12 = 2;
    uint64_t v9 = (void *)v10;
  }
  id v13 = v9;
LABEL_10:
  Class v14 = _MergedGlobals_181();
  int v15 = off_1EB4024C8();
  char v16 = (void *)[(objc_class *)v14 flightFactoryClassWithProvider:v15];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __51__PKPass_Flight__loadFlightsWithCompletionHandler___block_invoke;
  v21[3] = &unk_1E56F06E8;
  id v22 = v6;
  id v23 = v13;
  unint64_t v25 = v5;
  uint64_t v26 = v12;
  id v24 = v4;
  id v17 = v4;
  id v18 = v13;
  id v19 = v6;
  [v16 loadFlightsWithNumber:v5 airlineCode:v19 date:v18 dateType:v12 completionHandler:v21];
}

void __51__PKPass_Flight__loadFlightsWithCompletionHandler___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (![v5 count])
  {
    id v7 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = a1[4];
      uint64_t v9 = a1[5];
      uint64_t v10 = a1[7];
      uint64_t v11 = a1[8];
      int v12 = 134219010;
      uint64_t v13 = v10;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2048;
      uint64_t v19 = v11;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Could not find flights matching flightNumber: %ld, airlineCode: %@, date: %@, dateType: %ld, error: %@", (uint8_t *)&v12, 0x34u);
    }
  }
  (*(void (**)(void))(a1[6] + 16))();
}

@end