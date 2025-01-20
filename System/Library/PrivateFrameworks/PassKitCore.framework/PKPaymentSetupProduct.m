@interface PKPaymentSetupProduct
+ (id)_displayNameForCardType:(id)a3;
+ (id)_inAppProvisioningURLWthScheme:(id)a3 path:(id)a4;
+ (id)productForIssuerProvisioningExtension:(id)a3 withStatus:(id)a4;
+ (id)productsFromBrowseableBankApps:(id)a3;
- (BOOL)allowOnManagedAccount;
- (BOOL)isCarKey;
- (BOOL)isServerDriven;
- (BOOL)meetsAgeRequirements;
- (BOOL)preventsFeatureApplication;
- (BOOL)provisioningExtensionRequiresAuthorization;
- (BOOL)supportsDevice:(id)a3;
- (BOOL)supportsOSVersion:(id)a3 deviceClass:(id)a4;
- (BOOL)supportsProvisioningMethodForType:(unint64_t)a3;
- (BOOL)suppressPendingPurchases;
- (NSArray)accounts;
- (NSArray)associatedStoreIdentifiers;
- (NSArray)featureApplications;
- (NSArray)onboardingItems;
- (NSArray)paymentOptions;
- (NSArray)provisioningMethods;
- (NSArray)requiredFields;
- (NSArray)searchTerms;
- (NSArray)supportedCameraCaptureTypes;
- (NSArray)supportedInAppTypes;
- (NSArray)supportedProtocols;
- (NSArray)supportedTransitNetworkIdentifiers;
- (NSDictionary)clientInfo;
- (NSDictionary)minimumOSVersion;
- (NSDictionary)rawDictionary;
- (NSDictionary)readerModeMetadata;
- (NSExtension)provisioningExtension;
- (NSMutableDictionary)requestedProvisioningMethods;
- (NSSet)regions;
- (NSString)badge;
- (NSString)displayName;
- (NSString)displayStatus;
- (NSString)localizedDescription;
- (NSString)longLocalizedDescription;
- (NSString)partnerName;
- (NSString)primaryRegion;
- (NSString)regionIdentifier;
- (NSURL)appClipLaunchURL;
- (NSURL)appLaunchURL;
- (NSURL)termsURL;
- (PKPaymentSetupProduct)augmentedProduct;
- (PKPaymentSetupProduct)initWithFeatureIdentifier:(unint64_t)a3;
- (PKPaymentSetupProductConfiguration)configuration;
- (PKPaymentSetupProductImageAssetURLs)imageAssetURLs;
- (PKPaymentSetupProductImageAssets)imageAssets;
- (PKPaymentSetupProductRegionData)regionData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)partnerIdentifier;
- (id)productIdentifier;
- (id)provisioningMethodMetadataForType:(id)a3;
- (id)provisioningMethodTypes;
- (int64_t)allSupportedProtocols;
- (int64_t)hsa2Requirement;
- (int64_t)maximumSupportedAge;
- (int64_t)minimumSupportedAge;
- (int64_t)minimumTargetUserSupportedAge;
- (unint64_t)flags;
- (unint64_t)provisioningStatus;
- (unint64_t)supportedProvisioningMethods;
- (void)_updateDebugConfigurationForState:(unint64_t)a3;
- (void)addProvisioningMethod:(id)a3;
- (void)addProvisioningMethodType:(unint64_t)a3;
- (void)augmentWithProduct:(id)a3;
- (void)didAuthorizeProvisioningExtension;
- (void)setAccounts:(id)a3;
- (void)setAppLaunchURL:(id)a3;
- (void)setAssociatedStoreIdentifiers:(id)a3;
- (void)setBadge:(id)a3;
- (void)setClientInfo:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayStatus:(id)a3;
- (void)setFeatureApplications:(id)a3;
- (void)setFlags:(unint64_t)a3;
- (void)setHsa2Requirement:(int64_t)a3;
- (void)setImageAssets:(id)a3;
- (void)setIsServerDriven:(BOOL)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setMaximumSupportedAge:(int64_t)a3;
- (void)setMeetsAgeRequirements:(BOOL)a3;
- (void)setMinimumOSVersion:(id)a3;
- (void)setMinimumSupportedAge:(int64_t)a3;
- (void)setMinimumTargetUserSupportedAge:(int64_t)a3;
- (void)setOnboardingItems:(id)a3;
- (void)setPreventsFeatureApplication:(BOOL)a3;
- (void)setProvisioningMethodMetadata:(id)a3 forType:(id)a4;
- (void)setProvisioningStatus:(unint64_t)a3;
- (void)setRawDictionary:(id)a3;
- (void)setRegions:(id)a3;
- (void)setRequestedProvisioningMethods:(id)a3;
- (void)setRequiredFields:(id)a3;
- (void)setSearchTerms:(id)a3;
- (void)setSupportedProtocols:(id)a3;
- (void)setSupportedProvisioningMethods:(unint64_t)a3;
- (void)setTermsURL:(id)a3;
- (void)updateWithProductDictionary:(id)a3;
@end

@implementation PKPaymentSetupProduct

- (void)updateWithProductDictionary:(id)a3
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [[PKPaymentSetupProductConfiguration alloc] initWithProductDictionary:v4];
  configuration = self->_configuration;
  self->_configuration = v5;

  v7 = [v4 PKStringForKey:@"localizedDescription"];
  localizedDescription = self->_localizedDescription;
  self->_localizedDescription = v7;

  v9 = [v4 PKStringForKey:@"localizedProductName"];
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v11 = [v4 PKStringForKey:@"localizedDisplayName"];
  }
  displayName = self->_displayName;
  self->_displayName = v11;

  v13 = [v4 PKNumberForKey:@"minimumSupportedAge"];
  v14 = [v4 PKNumberForKey:@"maximumSupportedAge"];
  v129 = v13;
  self->_minimumSupportedAge = [v13 integerValue];
  v128 = v14;
  self->_maximumSupportedAge = [v14 integerValue];
  v127 = [v4 PKNumberForKey:@"minimumTargetUserSupportedAge"];
  self->_minimumTargetUserSupportedAge = [v127 integerValue];
  v15 = [v4 PKStringForKey:@"region"];
  v16 = [v15 componentsSeparatedByString:@","];

  if (v16)
  {
    v17 = [v16 firstObject];
    primaryRegion = self->_primaryRegion;
    self->_primaryRegion = v17;

    v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v16];
    v20 = (NSSet *)[v19 copy];
    regions = self->_regions;
    self->_regions = v20;
  }
  v126 = v16;
  v22 = [PKPaymentSetupProductRegionData alloc];
  v23 = [v4 PKDictionaryForKey:@"regionData"];
  v24 = [(PKPaymentSetupProductRegionData *)v22 initWithRegionDataDictionary:v23];
  regionData = self->_regionData;
  self->_regionData = v24;

  v26 = (NSDictionary *)[v4 copy];
  rawDictionary = self->_rawDictionary;
  self->_rawDictionary = v26;

  v28 = [v4 PKURLForKey:@"termsURL"];
  v29 = (NSURL *)[v28 copy];
  termsURL = self->_termsURL;
  self->_termsURL = v29;

  v31 = [v4 PKDictionaryForKey:@"readerModeMetadata"];
  v32 = (NSDictionary *)[v31 copy];
  readerModeMetadata = self->_readerModeMetadata;
  self->_readerModeMetadata = v32;

  v34 = [v4 PKArrayContaining:objc_opt_class() forKey:@"capabilities"];
  self->_flags = PKPaymentProductFlagsFromArray(v34);

  v35 = [v4 PKStringForKey:@"hsa2Requirement"];
  self->_hsa2Requirement = PKPaymentSetupHSA2RequirementFromString(v35);

  v36 = [MEMORY[0x1E4F1CA48] array];
  v37 = [v4 PKArrayForKey:@"requiredFields"];
  uint64_t v38 = [v37 count];

  v133 = self;
  v130 = v36;
  if (v38)
  {
    v39 = [MEMORY[0x1E4F1CA48] array];
    long long v148 = 0u;
    long long v149 = 0u;
    long long v150 = 0u;
    long long v151 = 0u;
    v40 = v4;
    obuint64_t j = [v4 PKArrayContaining:objc_opt_class() forKey:@"requiredFields"];
    uint64_t v41 = [obj countByEnumeratingWithState:&v148 objects:v155 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v149;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v149 != v43) {
            objc_enumerationMutation(obj);
          }
          uint64_t v45 = *(void *)(*((void *)&v148 + 1) + 8 * i);
          v46 = [v40 PKDictionaryForKey:@"requiredFieldOptions"];
          v47 = [v46 PKDictionaryForKey:v45];

          v48 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:v45 configuration:v47];
          [v39 safelyAddObject:v48];
        }
        uint64_t v42 = [obj countByEnumeratingWithState:&v148 objects:v155 count:16];
      }
      while (v42);
    }

    uint64_t v49 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v39];
    self = v133;
    requiredFields = v133->_requiredFields;
    v133->_requiredFields = (NSArray *)v49;

    id v4 = v40;
    v36 = v130;
  }
  v51 = [v4 PKArrayForKey:@"paymentOptions"];
  long long v144 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  long long v147 = 0u;
  uint64_t v52 = [v51 countByEnumeratingWithState:&v144 objects:v154 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v145;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v145 != v54) {
          objc_enumerationMutation(v51);
        }
        v56 = [[PKPaymentSetupProductPaymentOption alloc] initWithPaymentOptionDictionary:*(void *)(*((void *)&v144 + 1) + 8 * j)];
        [v36 safelyAddObject:v56];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v144 objects:v154 count:16];
    }
    while (v53);
  }
  [v36 sortUsingComparator:&__block_literal_global_673_0];
  v57 = (NSArray *)[v36 copy];
  paymentOptions = self->_paymentOptions;
  self->_paymentOptions = v57;

  if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
  {
    v59 = [v4 PKArrayContaining:objc_opt_class() forKey:@"provisioningMethodDetailsList"];
    v60 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    associatedStoreIdentifiers = self->_associatedStoreIdentifiers;
    self->_associatedStoreIdentifiers = v60;

    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    v62 = v59;
    uint64_t v63 = [v62 countByEnumeratingWithState:&v140 objects:v153 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v141;
      location = (id *)&self->_appLaunchURL;
      v132 = v62;
      while (1)
      {
        uint64_t v66 = 0;
        do
        {
          if (*(void *)v141 != v65) {
            objc_enumerationMutation(v62);
          }
          v67 = *(void **)(*((void *)&v140 + 1) + 8 * v66);
          v68 = [v67 PKStringForKey:@"provisioningMethodType"];
          if ([v68 isEqualToString:@"digitalIssuance"])
          {
            v69 = PKPaymentProvisioningMethodTypeDigitalIssuance;
LABEL_32:
            v70 = (PKPaymentProvisioningMethodTypeAppClip *)[[v69 alloc] initWithDictionary:v67];
            [(PKPaymentSetupProduct *)self addProvisioningMethod:v70];
            goto LABEL_33;
          }
          if ([v68 isEqualToString:@"readerMode"])
          {
            v69 = PKPaymentProvisioningMethodTypeReaderMode;
            goto LABEL_32;
          }
          if ([v68 isEqualToString:@"appClip"])
          {
            v70 = [[PKPaymentProvisioningMethodTypeAppClip alloc] initWithDictionary:v67];
            [(PKPaymentSetupProduct *)self addProvisioningMethod:v70];
            v71 = [(PKPaymentProvisioningMethodTypeAppClip *)v70 appClipLaunchURL];
            appClipLaunchURL = self->_appClipLaunchURL;
            self->_appClipLaunchURL = v71;
            goto LABEL_44;
          }
          if ([v68 isEqualToString:@"inApp"])
          {
            v70 = [[PKPaymentProvisioningMethodTypeInApp alloc] initWithDictionary:v67];
            [(PKPaymentSetupProduct *)self addProvisioningMethod:v70];
            v73 = [(PKPaymentProvisioningMethodTypeAppClip *)v70 appLaunchURL];
            if (v73) {
              objc_storeStrong(location, v73);
            }
            v74 = self->_associatedStoreIdentifiers;
            v75 = [(PKPaymentProvisioningMethodTypeAppClip *)v70 associatedStoreIdentifiers];
            uint64_t v76 = [(NSArray *)v74 arrayByAddingObjectsFromArray:v75];
            v77 = v133->_associatedStoreIdentifiers;
            v133->_associatedStoreIdentifiers = (NSArray *)v76;

            self = v133;
            uint64_t v78 = [(PKPaymentProvisioningMethodTypeAppClip *)v70 cardTypeSupport];
            supportedInAppTypes = v133->_supportedInAppTypes;
            v133->_supportedInAppTypes = (NSArray *)v78;

            v62 = v132;
            goto LABEL_33;
          }
          if ([v68 isEqualToString:@"cameraCapture"])
          {
            v70 = [[PKPaymentProvisioningMethodTypeCameraCapture alloc] initWithDictionary:v67];
            [(PKPaymentSetupProduct *)self addProvisioningMethod:v70];
            v80 = self->_associatedStoreIdentifiers;
            v81 = [(PKPaymentProvisioningMethodTypeAppClip *)v70 associatedStoreIdentifiers];
            v82 = v80;
            v62 = v132;
            v83 = [(NSArray *)v82 arrayByAddingObjectsFromArray:v81];
            v84 = self->_associatedStoreIdentifiers;
            self->_associatedStoreIdentifiers = v83;

            v85 = [(PKPaymentProvisioningMethodTypeAppClip *)v70 cardTypeSupport];
            appClipLaunchURL = self->_supportedCameraCaptureTypes;
            self->_supportedCameraCaptureTypes = v85;
LABEL_44:

LABEL_33:
          }

          ++v66;
        }
        while (v64 != v66);
        uint64_t v86 = [v62 countByEnumeratingWithState:&v140 objects:v153 count:16];
        uint64_t v64 = v86;
        if (!v86)
        {
          v87 = v62;
          goto LABEL_50;
        }
      }
    }
    v87 = v62;
  }
  else
  {
    v87 = [v4 PKArrayContaining:objc_opt_class() forKey:@"provisioningMethods"];
    self->_supportedProvisioningMethods = PKPaymentSetupProductSupportedProvisioningMethodsFromArray(v87);
    v88 = [v4 PKArrayContaining:objc_opt_class() forKey:@"associatedStoreIdentifiers"];
    v89 = self->_associatedStoreIdentifiers;
    self->_associatedStoreIdentifiers = v88;

    v90 = [v4 PKURLForKey:@"appLaunchURL"];
    appLaunchURL = self->_appLaunchURL;
    self->_appLaunchURL = v90;

    v62 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[PKPaymentSetupProduct updateWithProductDictionary:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v87;
      _os_log_impl(&dword_190E10000, v62, OS_LOG_TYPE_DEFAULT, "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled Off: provisioningMethods: %@", buf, 0x16u);
    }
  }
LABEL_50:

  v92 = [PKPaymentSetupProductImageAssetURLs alloc];
  v93 = [v4 PKDictionaryForKey:@"imageAssets"];
  v94 = [(PKPaymentSetupProductImageAssetURLs *)v92 initWithImageAssetsDictionary:v93];
  imageAssetURLs = self->_imageAssetURLs;
  self->_imageAssetURLs = v94;

  v96 = objc_alloc_init(PKPaymentSetupProductImageAssets);
  imageAssets = self->_imageAssets;
  self->_imageAssets = v96;

  uint64_t v98 = [v4 PKDictionaryForKey:@"minimumOSVersion"];
  id obja = (id)v98;
  if (v98)
  {
    v99 = (void *)v98;
    id v100 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __PKPaymentMinOSDictionaryFromDictionary_block_invoke;
    v157 = &unk_1E56DCAA0;
    id v158 = v100;
    id v101 = v100;
    [v99 enumerateKeysAndObjectsUsingBlock:buf];
    v102 = (NSDictionary *)[v101 copy];

    minimumOSVersion = self->_minimumOSVersion;
    self->_minimumOSVersion = v102;
  }
  else
  {
    minimumOSVersion = self->_minimumOSVersion;
    self->_minimumOSVersion = 0;
  }

  v104 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  requestedProvisioningMethods = self->_requestedProvisioningMethods;
  self->_requestedProvisioningMethods = v104;

  v106 = [v4 PKArrayContaining:objc_opt_class() forKey:@"supportedTransitNetworkIdentifiers"];
  supportedTransitNetworkIdentifiers = self->_supportedTransitNetworkIdentifiers;
  self->_supportedTransitNetworkIdentifiers = v106;

  self->_suppressPendingPurchases = [v4 PKBoolForKey:@"suppressPendingPurchases"];
  id v108 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v109 = [v4 PKArrayForKey:@"onboardingItems"];
  v110 = v109;
  if (v109)
  {
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    uint64_t v111 = [v109 countByEnumeratingWithState:&v136 objects:v152 count:16];
    if (v111)
    {
      uint64_t v112 = v111;
      uint64_t v113 = 0;
      uint64_t v114 = *(void *)v137;
      do
      {
        for (uint64_t k = 0; k != v112; ++k)
        {
          if (*(void *)v137 != v114) {
            objc_enumerationMutation(v110);
          }
          v116 = [[PKDynamicProvisioningPageContent alloc] initWithDictonary:*(void *)(*((void *)&v136 + 1) + 8 * k)];
          [(PKDynamicProvisioningPageContent *)v116 setPageNumber:v113 + k];
          [v108 addObject:v116];
        }
        uint64_t v112 = [v110 countByEnumeratingWithState:&v136 objects:v152 count:16];
        v113 += k;
      }
      while (v112);
    }
  }
  uint64_t v117 = [v108 copy];
  onboardingItems = v133->_onboardingItems;
  v133->_onboardingItems = (NSArray *)v117;

  v119 = [v4 PKStringForKey:@"registrationRegionIdentifier"];
  uint64_t v120 = [v119 copy];
  regionIdentifier = v133->_regionIdentifier;
  v133->_regionIdentifier = (NSString *)v120;

  uint64_t v122 = [v4 PKDictionaryForKey:@"clientInfo"];
  clientInfo = v133->_clientInfo;
  v133->_clientInfo = (NSDictionary *)v122;

  uint64_t v124 = [v4 PKArrayContaining:objc_opt_class() forKey:@"searchTerms"];
  searchTerms = v133->_searchTerms;
  v133->_searchTerms = (NSArray *)v124;

  v133->_allowOnManagedAccount = [v4 PKBoolForKey:@"allowOnManagedAccount"];
}

uint64_t __53__PKPaymentSetupProduct_updateWithProductDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  unint64_t v6 = [v4 priority];
  if (v6 >= [v5 priority])
  {
    unint64_t v8 = [v4 priority];
    uint64_t v7 = v8 > [v5 priority];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

- (void)addProvisioningMethod:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v11 = v4;
    provisioningMethods = self->_provisioningMethods;
    if (!provisioningMethods)
    {
      unint64_t v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      uint64_t v7 = self->_provisioningMethods;
      self->_provisioningMethods = v6;

      provisioningMethods = self->_provisioningMethods;
    }
    unint64_t v8 = (void *)[(NSArray *)provisioningMethods mutableCopy];
    [v8 addObject:v11];
    v9 = (NSArray *)[v8 copy];
    v10 = self->_provisioningMethods;
    self->_provisioningMethods = v9;

    id v4 = v11;
  }
}

- (void)addProvisioningMethodType:(unint64_t)a3
{
  if ((uint64_t)a3 <= 15)
  {
    if (a3 == 1)
    {
      id v4 = PKPaymentProvisioningMethodTypeReaderMode;
      goto LABEL_12;
    }
    if (a3 == 2)
    {
      id v4 = PKPaymentProvisioningMethodTypeDigitalIssuance;
      goto LABEL_12;
    }
  }
  else
  {
    switch(a3)
    {
      case 0x10uLL:
        id v4 = PKPaymentProvisioningMethodTypeInApp;
        goto LABEL_12;
      case 0x20uLL:
        id v4 = PKPaymentProvisioningMethodTypeAppClip;
        goto LABEL_12;
      case 0x40uLL:
        id v4 = PKPaymentProvisioningMethodTypeCameraCapture;
LABEL_12:
        id v5 = (PKPaymentProvisioningMethod *)objc_alloc_init(v4);
        goto LABEL_13;
    }
  }
  id v5 = [[PKPaymentProvisioningMethod alloc] initWithType:a3];
LABEL_13:
  unint64_t v6 = v5;
  [(PKPaymentSetupProduct *)self addProvisioningMethod:v5];
}

- (BOOL)supportsProvisioningMethodForType:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!a3 && ![(NSArray *)self->_provisioningMethods count]) {
    return 1;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_provisioningMethods;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "type", (void)v12) == a3)
        {
          BOOL v10 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

- (PKPaymentSetupProduct)initWithFeatureIdentifier:(unint64_t)a3
{
  id v4 = [(PKPaymentSetupProduct *)self init];
  id v5 = v4;
  if (v4)
  {
    [(PKPaymentSetupProduct *)v4 updateWithProductDictionary:0];
    switch(a3)
    {
      case 0uLL:
        configuration = v5->_configuration;
        uint64_t v7 = @"unknown";
        goto LABEL_8;
      case 1uLL:
        configuration = v5->_configuration;
        uint64_t v7 = @"peerPayment";
        goto LABEL_8;
      case 2uLL:
        [(PKPaymentSetupProductConfiguration *)v5->_configuration setProductIdentifier:@"3-argon-CCS"];
        v5->_isServerDriven = 1;
        break;
      case 3uLL:
        configuration = v5->_configuration;
        uint64_t v7 = @"4-argon-FPS";
        goto LABEL_8;
      case 5uLL:
        configuration = v5->_configuration;
        uint64_t v7 = @"savings";
LABEL_8:
        [(PKPaymentSetupProductConfiguration *)configuration setProductIdentifier:v7];
        break;
      default:
        break;
    }
    [(PKPaymentSetupProductConfiguration *)v5->_configuration setFeatureIdentifier:a3];
    [(PKPaymentSetupProductConfiguration *)v5->_configuration setType:7];
    [(PKPaymentSetupProductConfiguration *)v5->_configuration setState:0];
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PKPaymentSetupProduct allocWithZone:](PKPaymentSetupProduct, "allocWithZone:") init];
  uint64_t v6 = [(PKPaymentSetupProductConfiguration *)self->_configuration copyWithZone:a3];
  configuration = v5->_configuration;
  v5->_configuration = v6;

  uint64_t v8 = [(NSString *)self->_displayName copyWithZone:a3];
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_localizedDescription copyWithZone:a3];
  localizedDescription = v5->_localizedDescription;
  v5->_localizedDescription = (NSString *)v10;

  uint64_t v12 = [(NSSet *)self->_regions copyWithZone:a3];
  regions = v5->_regions;
  v5->_regions = (NSSet *)v12;

  long long v14 = [(PKPaymentSetupProductRegionData *)self->_regionData copyWithZone:a3];
  regionData = v5->_regionData;
  v5->_regionData = v14;

  uint64_t v16 = [(NSArray *)self->_requiredFields copyWithZone:a3];
  requiredFields = v5->_requiredFields;
  v5->_requiredFields = (NSArray *)v16;

  uint64_t v18 = [(NSArray *)self->_supportedProtocols copyWithZone:a3];
  supportedProtocols = v5->_supportedProtocols;
  v5->_supportedProtocols = (NSArray *)v18;

  uint64_t v20 = [(NSURL *)self->_termsURL copyWithZone:a3];
  termsURL = v5->_termsURL;
  v5->_termsURL = (NSURL *)v20;

  uint64_t v22 = [(NSArray *)self->_associatedStoreIdentifiers copyWithZone:a3];
  associatedStoreIdentifiers = v5->_associatedStoreIdentifiers;
  v5->_associatedStoreIdentifiers = (NSArray *)v22;

  uint64_t v24 = [(NSURL *)self->_appLaunchURL copyWithZone:a3];
  appLaunchURL = v5->_appLaunchURL;
  v5->_appLaunchURL = (NSURL *)v24;

  uint64_t v26 = [(NSURL *)self->_appClipLaunchURL copyWithZone:a3];
  appClipLaunchURL = v5->_appClipLaunchURL;
  v5->_appClipLaunchURL = (NSURL *)v26;

  uint64_t v28 = [(NSDictionary *)self->_minimumOSVersion copyWithZone:a3];
  minimumOSVersion = v5->_minimumOSVersion;
  v5->_minimumOSVersion = (NSDictionary *)v28;

  uint64_t v30 = [(NSArray *)self->_provisioningMethods copyWithZone:a3];
  provisioningMethods = v5->_provisioningMethods;
  v5->_provisioningMethods = (NSArray *)v30;

  v5->_supportedProvisioningMethods = self->_supportedProvisioningMethods;
  uint64_t v32 = [(NSArray *)self->_paymentOptions copyWithZone:a3];
  paymentOptions = v5->_paymentOptions;
  v5->_paymentOptions = (NSArray *)v32;

  uint64_t v34 = [(NSDictionary *)self->_rawDictionary copyWithZone:a3];
  rawDictionary = v5->_rawDictionary;
  v5->_rawDictionary = (NSDictionary *)v34;

  uint64_t v36 = [(NSDictionary *)self->_readerModeMetadata copyWithZone:a3];
  readerModeMetadata = v5->_readerModeMetadata;
  v5->_readerModeMetadata = (NSDictionary *)v36;

  v5->_flags = self->_flags;
  v5->_hsa2Requirement = self->_hsa2Requirement;
  uint64_t v38 = [(NSMutableDictionary *)self->_requestedProvisioningMethods mutableCopyWithZone:a3];
  requestedProvisioningMethods = v5->_requestedProvisioningMethods;
  v5->_requestedProvisioningMethods = (NSMutableDictionary *)v38;

  v40 = [(PKPaymentSetupProductImageAssets *)self->_imageAssets copyWithZone:a3];
  imageAssets = v5->_imageAssets;
  v5->_imageAssets = v40;

  uint64_t v42 = [(PKPaymentSetupProductImageAssetURLs *)self->_imageAssetURLs copyWithZone:a3];
  imageAssetURLs = v5->_imageAssetURLs;
  v5->_imageAssetURLs = v42;

  uint64_t v44 = [(NSArray *)self->_supportedTransitNetworkIdentifiers copyWithZone:a3];
  supportedTransitNetworkIdentifiers = v5->_supportedTransitNetworkIdentifiers;
  v5->_supportedTransitNetworkIdentifiers = (NSArray *)v44;

  v5->_preventsFeatureApplication = self->_preventsFeatureApplication;
  v5->_provisioningStatus = self->_provisioningStatus;
  uint64_t v46 = [(NSArray *)self->_featureApplications copyWithZone:a3];
  featureApplications = v5->_featureApplications;
  v5->_featureApplications = (NSArray *)v46;

  uint64_t v48 = [(NSArray *)self->_accounts copyWithZone:a3];
  accounts = v5->_accounts;
  v5->_accounts = (NSArray *)v48;

  v5->_suppressPendingPurchases = self->_suppressPendingPurchases;
  uint64_t v50 = [(NSArray *)self->_onboardingItems copyWithZone:a3];
  onboardingItems = v5->_onboardingItems;
  v5->_onboardingItems = (NSArray *)v50;

  v5->_minimumSupportedAge = self->_minimumSupportedAge;
  v5->_maximumSupportedAge = self->_maximumSupportedAge;
  v5->_minimumTargetUserSupportedAge = self->_minimumTargetUserSupportedAge;
  v5->_meetsAgeRequirements = self->_meetsAgeRequirements;
  uint64_t v52 = [(NSDictionary *)self->_clientInfo copyWithZone:a3];
  clientInfo = v5->_clientInfo;
  v5->_clientInfo = (NSDictionary *)v52;

  uint64_t v54 = [(NSArray *)self->_searchTerms copyWithZone:a3];
  searchTerms = v5->_searchTerms;
  v5->_searchTerms = (NSArray *)v54;

  uint64_t v56 = [(NSArray *)self->_supportedCameraCaptureTypes copyWithZone:a3];
  supportedCameraCaptureTypes = v5->_supportedCameraCaptureTypes;
  v5->_supportedCameraCaptureTypes = (NSArray *)v56;

  uint64_t v58 = [(NSArray *)self->_supportedInAppTypes copyWithZone:a3];
  supportedInAppTypes = v5->_supportedInAppTypes;
  v5->_supportedInAppTypes = (NSArray *)v58;

  objc_storeStrong((id *)&v5->_provisioningExtension, self->_provisioningExtension);
  v5->_provisioningExtensionRequiresAuthorization = self->_provisioningExtensionRequiresAuthorization;
  v5->_allowOnManagedAccount = self->_allowOnManagedAccount;
  return v5;
}

- (NSString)partnerName
{
  return (NSString *)[(NSDictionary *)self->_rawDictionary PKStringForKey:@"partnerLocalizedDisplayName"];
}

- (int64_t)allSupportedProtocols
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_paymentOptions;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    int64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "supportedProtocols", (void)v9);
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)provisioningMethodMetadataForType:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_requestedProvisioningMethods objectForKey:a3];
}

- (void)setProvisioningMethodMetadata:(id)a3 forType:(id)a4
{
  requestedProvisioningMethods = self->_requestedProvisioningMethods;
  if (a3) {
    [(NSMutableDictionary *)requestedProvisioningMethods setObject:a3 forKey:a4];
  }
  else {
    [(NSMutableDictionary *)requestedProvisioningMethods removeObjectForKey:a4];
  }
}

- (id)provisioningMethodTypes
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!PKPaymentSetupMergeProductsPartnersAPIEnabled())
  {
    unint64_t supportedProvisioningMethods = self->_supportedProvisioningMethods;
    if (supportedProvisioningMethods)
    {
      [v3 addObject:@"readerMode"];
      unint64_t supportedProvisioningMethods = self->_supportedProvisioningMethods;
      if ((supportedProvisioningMethods & 2) == 0)
      {
LABEL_15:
        if ((supportedProvisioningMethods & 0x10) == 0) {
          goto LABEL_16;
        }
        goto LABEL_27;
      }
    }
    else if ((supportedProvisioningMethods & 2) == 0)
    {
      goto LABEL_15;
    }
    [v3 addObject:@"digitalIssuance"];
    unint64_t supportedProvisioningMethods = self->_supportedProvisioningMethods;
    if ((supportedProvisioningMethods & 0x10) == 0)
    {
LABEL_16:
      if ((supportedProvisioningMethods & 0x20) == 0) {
        goto LABEL_17;
      }
      goto LABEL_28;
    }
LABEL_27:
    [v3 addObject:@"inApp"];
    unint64_t supportedProvisioningMethods = self->_supportedProvisioningMethods;
    if ((supportedProvisioningMethods & 0x20) == 0)
    {
LABEL_17:
      if ((supportedProvisioningMethods & 0x40) == 0)
      {
LABEL_19:
        long long v10 = PKLogFacilityTypeGetObject(6uLL);
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_22;
        }
        *(_DWORD *)buf = 136315394;
        v19 = "-[PKPaymentSetupProduct provisioningMethodTypes]";
        __int16 v20 = 2112;
        id v21 = v3;
        long long v11 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled Off: provisioningMethodTypes: %@";
        goto LABEL_21;
      }
LABEL_18:
      [v3 addObject:@"cameraCapture"];
      goto LABEL_19;
    }
LABEL_28:
    [v3 addObject:@"appClip"];
    if ((self->_supportedProvisioningMethods & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_provisioningMethods;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = PKPaymentSupportedProvisioningMethodToString(objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "type", (void)v14));
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v6);
  }

  long long v10 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v19 = "-[PKPaymentSetupProduct provisioningMethodTypes]";
    __int16 v20 = 2112;
    id v21 = v3;
    long long v11 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled On: provisioningMethodTypes: %@";
LABEL_21:
    _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0x16u);
  }
LABEL_22:

  return v3;
}

- (NSString)displayName
{
  displayName = self->_displayName;
  if (displayName)
  {
    id v3 = displayName;
    goto LABEL_16;
  }
  unint64_t v5 = [(PKPaymentSetupProductConfiguration *)self->_configuration featureIdentifier];
  switch(v5)
  {
    case 4uLL:
      long long v11 = @"APPLY_FLOW_NEW_APPLICATION_TITLE";
      uint64_t v12 = 4;
      break;
    case 3uLL:
      long long v11 = @"APPLY_FLOW_NEW_APPLICATION_TITLE";
      uint64_t v12 = 3;
      break;
    case 2uLL:
      if ([(NSArray *)self->_featureApplications count])
      {
        long long v11 = @"APPLY_FLOW_RESUME_APPLICATION_TITLE";
      }
      else if ([(NSArray *)self->_accounts count])
      {
        long long v11 = @"APPLY_FLOW_NEW_APPLICATION_WITH_ACCOUNT_TITLE";
      }
      else
      {
        long long v11 = @"APPLY_FLOW_NEW_APPLICATION_TITLE";
      }
      uint64_t v12 = 2;
      break;
    default:
      id v3 = 0;
      goto LABEL_16;
  }
  PKLocalizedFeatureString(v11, v12, 0, v6, v7, v8, v9, v10, v14);
  id v3 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_16:
  return v3;
}

- (NSString)longLocalizedDescription
{
  unint64_t v3 = [(PKPaymentSetupProductConfiguration *)self->_configuration type];
  switch(v3)
  {
    case 3uLL:
      uint64_t v4 = @"PAYMENT_SETUP_TRANSIT_LONG_DESCRIPTION";
      goto LABEL_6;
    case 7uLL:
      if ([(PKPaymentSetupProductConfiguration *)self->_configuration featureIdentifier] == 4)
      {
        unint64_t v5 = PKLocalizedLynxString(&cfstr_AppleAccountBo.isa, 0);
        goto LABEL_10;
      }
      break;
    case 4uLL:
      uint64_t v4 = @"PAYMENT_SETUP_EMONEY_LONG_DESCRIPTION";
LABEL_6:
      unint64_t v5 = PKLocalizedPaymentString(&v4->isa, 0);
      goto LABEL_10;
  }
  unint64_t v5 = 0;
LABEL_10:
  return (NSString *)v5;
}

- (NSString)displayStatus
{
  if ([(PKPaymentSetupProductConfiguration *)self->_configuration type] == 10)
  {
    unint64_t v3 = @"CARD_TYPE_IDENTITY_PENDING";
    switch(self->_provisioningStatus)
    {
      case 1uLL:
        break;
      case 2uLL:
        unint64_t v3 = @"CARD_TYPE_IDENTITY_ACTION_REQUIRED";
        break;
      case 3uLL:
        unint64_t v3 = @"CARD_TYPE_IDENTITY_READY";
        break;
      case 4uLL:
        unint64_t v3 = @"CARD_TYPE_IDENTITY_AUTH_CODE";
        break;
      case 5uLL:
        unint64_t v3 = @"CARD_TYPE_IDENTITY_RETRY_AUTH_CODE";
        break;
      case 6uLL:
        unint64_t v3 = @"CARD_TYPE_IDENTITY_RETRY_ADDING";
        break;
      case 7uLL:
        if (PKUseWLAN()) {
          unint64_t v3 = @"CARD_TYPE_IDENTITY_WAITING_WLAN";
        }
        else {
          unint64_t v3 = @"CARD_TYPE_IDENTITY_WAITING_WIFI";
        }
        break;
      case 8uLL:
        unint64_t v3 = @"CARD_TYPE_IDENTITY_UNABLE_TO_ADD";
        break;
      case 9uLL:
        unint64_t v3 = @"CARD_TYPE_IDENTITY_CANNOT_ADD";
        break;
      case 0xAuLL:
        unint64_t v3 = @"CARD_TYPE_IDENTITY_LIVENESS_STEP_UP";
        break;
      default:
        goto LABEL_4;
    }
    uint64_t v4 = PKLocalizedIdentityString(&v3->isa, 0);
  }
  else
  {
LABEL_4:
    uint64_t v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)badge
{
  if ([(PKPaymentSetupProductConfiguration *)self->_configuration type] != 10
    || ((unint64_t provisioningStatus = self->_provisioningStatus,
         BOOL v4 = provisioningStatus > 0xA,
         uint64_t v5 = (1 << provisioningStatus) & 0x77C,
         !v4)
      ? (BOOL v6 = v5 == 0)
      : (BOOL v6 = 1),
        v6))
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:&unk_1EE22C7B8 numberStyle:0];
  }
  return (NSString *)v7;
}

- (unint64_t)supportedProvisioningMethods
{
  unint64_t supportedProvisioningMethods = self->_supportedProvisioningMethods;
  unint64_t v4 = [(PKPaymentSetupProductConfiguration *)self->_configuration type];
  if (v4 == 7)
  {
    if ([(PKPaymentSetupProductConfiguration *)self->_configuration featureIdentifier] == 2) {
      return 4;
    }
    else {
      return supportedProvisioningMethods;
    }
  }
  else if (v4 == 5)
  {
    return 16;
  }
  else
  {
    return supportedProvisioningMethods;
  }
}

- (BOOL)supportsOSVersion:(id)a3 deviceClass:(id)a4
{
  id v6 = a3;
  minimumOSVersion = self->_minimumOSVersion;
  if (minimumOSVersion)
  {
    uint64_t v8 = [(NSDictionary *)minimumOSVersion objectForKey:a4];
    uint64_t v9 = v8;
    if (v8) {
      BOOL v10 = (unint64_t)([v8 compare:v6 options:64] + 1) < 2;
    }
    else {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)supportsDevice:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 deviceVersion];
  id v6 = [v4 deviceClass];
  uint64_t v7 = [v4 deviceRegion];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v8 = [v4 cellularNetworkRegion];
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v9 = [v5 versionForDeviceClass:v6];
  BOOL v10 = [(PKPaymentSetupProduct *)self supportsOSVersion:v9 deviceClass:v6];

  if (v10
    && (v7 && [(NSSet *)self->_regions containsObject:v7]
     || v8 && [(NSSet *)self->_regions containsObject:v8])
    && (([(PKPaymentSetupProduct *)self allSupportedProtocols] & 4) == 0
     || [v4 felicaSecureElementIsAvailable]))
  {
    if (objc_opt_respondsToSelector())
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v11 = [(PKPaymentSetupProduct *)self paymentOptions];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        uint64_t v13 = *(void *)v17;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v17 != v13) {
              objc_enumerationMutation(v11);
            }
            if (objc_msgSend(v4, "supportsCredentialType:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "cardType")))
            {
              LOBYTE(v12) = 1;
              goto LABEL_25;
            }
          }
          uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
LABEL_25:
    }
    else
    {
      LOBYTE(v12) = 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)augmentWithProduct:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_storeStrong((id *)&self->_augmentedProduct, a3);
    id v6 = [v5 onboardingItems];
    if (v6)
    {
      uint64_t v7 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        onboardingItems = self->_onboardingItems;
        int v9 = 138412546;
        BOOL v10 = (PKPaymentSetupProduct *)onboardingItems;
        __int16 v11 = 2112;
        uint64_t v12 = v6;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "augmentWithProduct: Replacing old onboardingItems (%@) with new onboardingItems (%@)", (uint8_t *)&v9, 0x16u);
      }

      objc_storeStrong((id *)&self->_onboardingItems, v6);
    }
  }
  else
  {
    id v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      BOOL v10 = self;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Invalid request to augment self with nil augmenting product: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (BOOL)isCarKey
{
  v2 = [(PKPaymentSetupProduct *)self configuration];
  BOOL v3 = [v2 type] == 11;

  return v3;
}

- (id)productIdentifier
{
  v2 = [(PKPaymentSetupProduct *)self configuration];
  BOOL v3 = [v2 productIdentifier];

  return v3;
}

- (id)partnerIdentifier
{
  v2 = [(PKPaymentSetupProduct *)self configuration];
  BOOL v3 = [v2 partnerIdentifier];

  return v3;
}

- (void)_updateDebugConfigurationForState:(unint64_t)a3
{
  v14[2] = *MEMORY[0x1E4F143B8];
  -[PKPaymentSetupProductConfiguration setState:](self->_configuration, "setState:");
  if (a3 == 4)
  {
    id v5 = objc_alloc_init(PKDynamicProvisioningPageContent);
    [(PKDynamicProvisioningPageContent *)v5 setPageNumber:0];
    [(PKDynamicProvisioningPageContent *)v5 setTitle:@"Notify Requested Demo"];
    [(PKDynamicProvisioningPageContent *)v5 setSubtitle:@"You're all set. We'll be in touch soon."];
    [(PKDynamicProvisioningPageContent *)v5 setPrimaryActionTitle:@"Done"];
    uint64_t v12 = v5;
    int v9 = (void *)MEMORY[0x1E4F1C978];
    BOOL v10 = &v12;
LABEL_7:
    __int16 v11 = [v9 arrayWithObjects:v10 count:1];
    onboardingItems = (PKDynamicProvisioningPageContent *)self->_onboardingItems;
    self->_onboardingItems = v11;
    goto LABEL_8;
  }
  if (a3 == 3)
  {
    id v5 = objc_alloc_init(PKDynamicProvisioningPageContent);
    [(PKDynamicProvisioningPageContent *)v5 setPageNumber:0];
    [(PKDynamicProvisioningPageContent *)v5 setTitle:@"Notify Demo"];
    [(PKDynamicProvisioningPageContent *)v5 setSubtitle:@"Do you want to be notified ?"];
    [(PKDynamicProvisioningPageContent *)v5 setPrimaryActionTitle:@"Notify Me"];
    [(PKDynamicProvisioningPageContent *)v5 setSecondaryActionTitle:@"Cancel"];
    uint64_t v13 = v5;
    int v9 = (void *)MEMORY[0x1E4F1C978];
    BOOL v10 = &v13;
    goto LABEL_7;
  }
  if (a3 != 1) {
    return;
  }
  id v5 = objc_alloc_init(PKDynamicProvisioningPageContent);
  [(PKDynamicProvisioningPageContent *)v5 setPageNumber:0];
  [(PKDynamicProvisioningPageContent *)v5 setTitle:@"Demo Page 1"];
  [(PKDynamicProvisioningPageContent *)v5 setSubtitle:@"Demo Demo Page"];
  [(PKDynamicProvisioningPageContent *)v5 setHeroImageURL:&stru_1EE0F5368];
  [(PKDynamicProvisioningPageContent *)v5 setPrimaryActionTitle:@"Continue"];
  [(PKDynamicProvisioningPageContent *)v5 setSecondaryActionTitle:@"Cancel"];
  [(PKDynamicProvisioningPageContent *)v5 setContentAlignment:4];
  onboardingItems = objc_alloc_init(PKDynamicProvisioningPageContent);
  [(PKDynamicProvisioningPageContent *)onboardingItems setPageNumber:1];
  [(PKDynamicProvisioningPageContent *)onboardingItems setTitle:@"Demo Page 2"];
  [(PKDynamicProvisioningPageContent *)onboardingItems setSubtitle:@"Demo Demo Page"];
  [(PKDynamicProvisioningPageContent *)onboardingItems setIdentifier:@"mainFeatureOnboardingPageIdentifier"];
  v14[0] = v5;
  v14[1] = onboardingItems;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
  uint64_t v8 = self->_onboardingItems;
  self->_onboardingItems = v7;

LABEL_8:
}

- (id)description
{
  BOOL v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = [(PKPaymentSetupProductConfiguration *)self->_configuration productIdentifier];
  [v3 appendFormat:@"productIdentifier: '%@'; ", v4];

  [v3 appendFormat:@"displayName: '%@'; ", self->_displayName];
  [v3 appendFormat:@">"];
  id v5 = (void *)[v3 copy];

  return v5;
}

- (PKPaymentSetupProductConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSSet)regions
{
  return self->_regions;
}

- (void)setRegions:(id)a3
{
}

- (PKPaymentSetupProductRegionData)regionData
{
  return self->_regionData;
}

- (NSString)primaryRegion
{
  return self->_primaryRegion;
}

- (NSArray)requiredFields
{
  return self->_requiredFields;
}

- (void)setRequiredFields:(id)a3
{
}

- (NSArray)supportedProtocols
{
  return self->_supportedProtocols;
}

- (void)setSupportedProtocols:(id)a3
{
}

- (NSURL)termsURL
{
  return self->_termsURL;
}

- (void)setTermsURL:(id)a3
{
}

- (NSDictionary)readerModeMetadata
{
  return self->_readerModeMetadata;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (int64_t)hsa2Requirement
{
  return self->_hsa2Requirement;
}

- (void)setHsa2Requirement:(int64_t)a3
{
  self->_hsa2Requirement = a3;
}

- (PKPaymentSetupProductImageAssetURLs)imageAssetURLs
{
  return self->_imageAssetURLs;
}

- (PKPaymentSetupProductImageAssets)imageAssets
{
  return self->_imageAssets;
}

- (void)setImageAssets:(id)a3
{
}

- (BOOL)suppressPendingPurchases
{
  return self->_suppressPendingPurchases;
}

- (int64_t)minimumSupportedAge
{
  return self->_minimumSupportedAge;
}

- (void)setMinimumSupportedAge:(int64_t)a3
{
  self->_minimumSupportedAge = a3;
}

- (int64_t)maximumSupportedAge
{
  return self->_maximumSupportedAge;
}

- (void)setMaximumSupportedAge:(int64_t)a3
{
  self->_maximumSupportedAge = a3;
}

- (int64_t)minimumTargetUserSupportedAge
{
  return self->_minimumTargetUserSupportedAge;
}

- (void)setMinimumTargetUserSupportedAge:(int64_t)a3
{
  self->_minimumTargetUserSupportedAge = a3;
}

- (BOOL)meetsAgeRequirements
{
  return self->_meetsAgeRequirements;
}

- (void)setMeetsAgeRequirements:(BOOL)a3
{
  self->_meetsAgeRequirements = a3;
}

- (NSDictionary)clientInfo
{
  return self->_clientInfo;
}

- (void)setClientInfo:(id)a3
{
}

- (NSArray)searchTerms
{
  return self->_searchTerms;
}

- (void)setSearchTerms:(id)a3
{
}

- (BOOL)allowOnManagedAccount
{
  return self->_allowOnManagedAccount;
}

- (void)setSupportedProvisioningMethods:(unint64_t)a3
{
  self->_unint64_t supportedProvisioningMethods = a3;
}

- (NSArray)provisioningMethods
{
  return self->_provisioningMethods;
}

- (NSURL)appClipLaunchURL
{
  return self->_appClipLaunchURL;
}

- (NSArray)associatedStoreIdentifiers
{
  return self->_associatedStoreIdentifiers;
}

- (void)setAssociatedStoreIdentifiers:(id)a3
{
}

- (NSURL)appLaunchURL
{
  return self->_appLaunchURL;
}

- (void)setAppLaunchURL:(id)a3
{
}

- (NSArray)supportedCameraCaptureTypes
{
  return self->_supportedCameraCaptureTypes;
}

- (NSArray)supportedInAppTypes
{
  return self->_supportedInAppTypes;
}

- (NSArray)supportedTransitNetworkIdentifiers
{
  return self->_supportedTransitNetworkIdentifiers;
}

- (NSExtension)provisioningExtension
{
  return self->_provisioningExtension;
}

- (BOOL)provisioningExtensionRequiresAuthorization
{
  return self->_provisioningExtensionRequiresAuthorization;
}

- (NSArray)featureApplications
{
  return self->_featureApplications;
}

- (void)setFeatureApplications:(id)a3
{
}

- (NSArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
}

- (BOOL)preventsFeatureApplication
{
  return self->_preventsFeatureApplication;
}

- (void)setPreventsFeatureApplication:(BOOL)a3
{
  self->_preventsFeatureApplication = a3;
}

- (NSArray)onboardingItems
{
  return self->_onboardingItems;
}

- (void)setOnboardingItems:(id)a3
{
}

- (NSString)regionIdentifier
{
  return self->_regionIdentifier;
}

- (NSArray)paymentOptions
{
  return self->_paymentOptions;
}

- (NSDictionary)rawDictionary
{
  return self->_rawDictionary;
}

- (void)setRawDictionary:(id)a3
{
}

- (PKPaymentSetupProduct)augmentedProduct
{
  return self->_augmentedProduct;
}

- (NSDictionary)minimumOSVersion
{
  return self->_minimumOSVersion;
}

- (void)setMinimumOSVersion:(id)a3
{
}

- (NSMutableDictionary)requestedProvisioningMethods
{
  return self->_requestedProvisioningMethods;
}

- (void)setRequestedProvisioningMethods:(id)a3
{
}

- (BOOL)isServerDriven
{
  return self->_isServerDriven;
}

- (void)setIsServerDriven:(BOOL)a3
{
  self->_isServerDriven = a3;
}

- (void)setDisplayStatus:(id)a3
{
}

- (void)setBadge:(id)a3
{
}

- (unint64_t)provisioningStatus
{
  return self->_provisioningStatus;
}

- (void)setProvisioningStatus:(unint64_t)a3
{
  self->_unint64_t provisioningStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_displayStatus, 0);
  objc_storeStrong((id *)&self->_requestedProvisioningMethods, 0);
  objc_storeStrong((id *)&self->_minimumOSVersion, 0);
  objc_storeStrong((id *)&self->_augmentedProduct, 0);
  objc_storeStrong((id *)&self->_rawDictionary, 0);
  objc_storeStrong((id *)&self->_paymentOptions, 0);
  objc_storeStrong((id *)&self->_regionIdentifier, 0);
  objc_storeStrong((id *)&self->_onboardingItems, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_featureApplications, 0);
  objc_storeStrong((id *)&self->_provisioningExtension, 0);
  objc_storeStrong((id *)&self->_supportedTransitNetworkIdentifiers, 0);
  objc_storeStrong((id *)&self->_supportedInAppTypes, 0);
  objc_storeStrong((id *)&self->_supportedCameraCaptureTypes, 0);
  objc_storeStrong((id *)&self->_appLaunchURL, 0);
  objc_storeStrong((id *)&self->_associatedStoreIdentifiers, 0);
  objc_storeStrong((id *)&self->_appClipLaunchURL, 0);
  objc_storeStrong((id *)&self->_provisioningMethods, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_imageAssets, 0);
  objc_storeStrong((id *)&self->_imageAssetURLs, 0);
  objc_storeStrong((id *)&self->_readerModeMetadata, 0);
  objc_storeStrong((id *)&self->_termsURL, 0);
  objc_storeStrong((id *)&self->_supportedProtocols, 0);
  objc_storeStrong((id *)&self->_requiredFields, 0);
  objc_storeStrong((id *)&self->_primaryRegion, 0);
  objc_storeStrong((id *)&self->_regionData, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (id)productsFromBrowseableBankApps:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v4;
  uint64_t v35 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v35)
  {
    uint64_t v33 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v39 != v33) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v7 = [v6 PKArrayContaining:objc_opt_class() forKey:@"cameraCaptureSupport"];
        uint64_t v8 = [v6 PKArrayContaining:objc_opt_class() forKey:@"inAppProvisioningSupport"];
        int v9 = objc_alloc_init(PKPaymentSetupProduct);
        uint64_t v10 = [v6 PKStringForKey:@"displayName"];
        displayName = v9->_displayName;
        v9->_displayName = (NSString *)v10;

        uint64_t v12 = [v6 PKArrayContaining:objc_opt_class() forKey:@"searchTerms"];
        searchTerms = v9->_searchTerms;
        v9->_searchTerms = (NSArray *)v12;

        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __86__PKPaymentSetupProduct_PKBrowseableBankAppAdditions__productsFromBrowseableBankApps___block_invoke;
        v37[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8l;
        v37[4] = a1;
        uint64_t v14 = objc_msgSend(v7, "pk_arrayByApplyingBlock:", v37);
        supportedCameraCaptureTypes = v9->_supportedCameraCaptureTypes;
        v9->_supportedCameraCaptureTypes = (NSArray *)v14;

        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __86__PKPaymentSetupProduct_PKBrowseableBankAppAdditions__productsFromBrowseableBankApps___block_invoke_2;
        v36[3] = &__block_descriptor_40_e28___NSString_16__0__NSString_8l;
        v36[4] = a1;
        uint64_t v16 = objc_msgSend(v8, "pk_arrayByApplyingBlock:", v36);
        supportedInAppTypes = v9->_supportedInAppTypes;
        v9->_supportedInAppTypes = (NSArray *)v16;

        long long v18 = [v6 PKStringForKey:@"appLaunchURLScheme"];
        long long v19 = [v6 PKStringForKey:@"appLaunchURLPath"];
        uint64_t v20 = [a1 _inAppProvisioningURLWthScheme:v18 path:v19];
        appLaunchURL = v9->_appLaunchURL;
        v9->_appLaunchURL = (NSURL *)v20;

        uint64_t v22 = [v6 PKArrayContaining:objc_opt_class() forKey:@"associatedStoreIdentifiers"];
        associatedStoreIdentifiers = v9->_associatedStoreIdentifiers;
        v9->_associatedStoreIdentifiers = (NSArray *)v22;

        uint64_t v24 = objc_alloc_init(PKPaymentSetupProductConfiguration);
        [(PKPaymentSetupProductConfiguration *)v24 setType:5];
        v25 = NSString;
        uint64_t v26 = [(PKPaymentSetupProduct *)v9 displayName];
        v27 = [(PKPaymentSetupProduct *)v9 appLaunchURL];
        uint64_t v28 = [v25 stringWithFormat:@"%@%@", v26, v27];

        [(PKPaymentSetupProductConfiguration *)v24 setProductIdentifier:v28];
        configuration = v9->_configuration;
        v9->_configuration = v24;

        [v34 addObject:v9];
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v35);
  }

  uint64_t v30 = (void *)[v34 copy];
  return v30;
}

uint64_t __86__PKPaymentSetupProduct_PKBrowseableBankAppAdditions__productsFromBrowseableBankApps___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _displayNameForCardType:a2];
}

uint64_t __86__PKPaymentSetupProduct_PKBrowseableBankAppAdditions__productsFromBrowseableBankApps___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _displayNameForCardType:a2];
}

+ (id)_displayNameForCardType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"credit"])
  {
    id v4 = @"CARD_TYPE_CREDIT_CARD";
  }
  else if ([v3 isEqualToString:@"debit"])
  {
    id v4 = @"CARD_TYPE_DEBIT_CARD";
  }
  else if ([v3 isEqualToString:@"prepaid"])
  {
    id v4 = @"CARD_TYPE_PREPAID_CARD";
  }
  else
  {
    id v5 = v3;
    if (![v3 isEqualToString:@"bankcard"]) {
      goto LABEL_10;
    }
    id v4 = @"CARD_TYPE_BANK_CARD";
  }
  id v5 = PKLocalizedPaymentString(&v4->isa, 0);

LABEL_10:
  return v5;
}

+ (id)_inAppProvisioningURLWthScheme:(id)a3 path:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length])
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"%@://", v5];
    if ([v6 length])
    {
      uint64_t v8 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
      uint64_t v9 = [v6 stringByAddingPercentEncodingWithAllowedCharacters:v8];

      [v7 appendString:v9];
      id v6 = (id)v9;
    }
    uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)productForIssuerProvisioningExtension:(id)a3 withStatus:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  if (v6 && v7)
  {
    if (([v7 passEntriesAvailable] & 1) != 0
      || [v8 remotePassEntriesAvailable])
    {
      uint64_t v10 = objc_alloc_init(PKPaymentSetupProductConfiguration);
      [(PKPaymentSetupProductConfiguration *)v10 setType:6];
      __int16 v11 = [v6 identifier];
      [(PKPaymentSetupProductConfiguration *)v10 setProductIdentifier:v11];

      uint64_t v9 = objc_alloc_init(PKPaymentSetupProduct);
      if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
      {
        [(PKPaymentSetupProduct *)v9 addProvisioningMethodType:8];
        uint64_t v12 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 136315138;
          uint64_t v21 = "+[PKPaymentSetupProduct(PKExtensionAdditions) productForIssuerProvisioningExtension:withStatus:]";
          uint64_t v13 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled On: add PKPaymentSupportedProvisioningMethodIssuerPro"
                "visioningExtension";
LABEL_10:
          _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v20, 0xCu);
        }
      }
      else
      {
        v9->_unint64_t supportedProvisioningMethods = 8;
        uint64_t v12 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 136315138;
          uint64_t v21 = "+[PKPaymentSetupProduct(PKExtensionAdditions) productForIssuerProvisioningExtension:withStatus:]";
          uint64_t v13 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled Off: add PKPaymentSupportedProvisioningMethodIssuerPr"
                "ovisioningExtension";
          goto LABEL_10;
        }
      }

      objc_storeStrong((id *)&v9->_configuration, v10);
      uint64_t v14 = [v6 _plugIn];
      long long v15 = [v14 localizedContainingName];
      uint64_t v16 = v15;
      if (v15)
      {
        long long v17 = v15;
      }
      else
      {
        long long v17 = [v6 _localizedName];
      }
      displayName = v9->_displayName;
      v9->_displayName = v17;

      objc_storeStrong((id *)&v9->_provisioningExtension, a3);
      v9->_provisioningExtensionRequiresAuthorization = [v8 requiresAuthentication];

      goto LABEL_16;
    }
    uint64_t v9 = 0;
  }
LABEL_16:

  return v9;
}

- (void)didAuthorizeProvisioningExtension
{
  self->_provisioningExtensionRequiresAuthorization = 0;
}

@end