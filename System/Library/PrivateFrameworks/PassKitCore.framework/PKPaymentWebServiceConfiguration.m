@interface PKPaymentWebServiceConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)AMPNonDefaultBehaviourDisabledForRegion:(id)a3;
- (BOOL)_lock_supportedForOSVersion:(id)a3 inRegionDictionary:(id)a4 deviceClass:(id)a5 platform:(id)a6;
- (BOOL)accountServiceEnabledForRegion:(id)a3;
- (BOOL)applyServiceEnabledForRegion:(id)a3;
- (BOOL)browseProvisioningBankAppsEnabledForRegion:(id)a3;
- (BOOL)buddyManualProvisioningEnabledForRegion:(id)a3;
- (BOOL)buddyProvisioningEnabledForRegion:(id)a3;
- (BOOL)cameraFirstProvisioningEnabledForRegion:(id)a3;
- (BOOL)deviceCheckInDisabledForRegion:(id)a3;
- (BOOL)hasFeatureRequiringRegistrationInRegion:(id)a3 osVersion:(id)a4 deviceClass:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)manualProvisioningEnabledForRegion:(id)a3;
- (BOOL)paymentTransactionIconsEnabledForRegion:(id)a3;
- (BOOL)peerPaymentEnabledForRegion:(id)a3;
- (BOOL)quickAccessForMoreRemovePassEnabled;
- (BOOL)regionHasProvisioningEnablementPercentage:(id)a3;
- (BOOL)remotePaymentsRequiredForVoiceover;
- (BOOL)shouldEnableTransitServiceCheckInForRegion:(id)a3;
- (BOOL)suppressCardholderNameFieldForRegion:(id)a3;
- (BOOL)tapToProvisionEnabledForRegion:(id)a3;
- (BOOL)tapToProvisionFirstProvisioningEnabledForRegion:(id)a3;
- (BOOL)userCanResetCloudStoreApplePayViewForRegion:(id)a3;
- (NSDictionary)configuration;
- (NSURL)configurationURL;
- (PKPaymentWebServiceConfiguration)init;
- (PKPaymentWebServiceConfiguration)initWithCoder:(id)a3;
- (PKPaymentWebServiceConfiguration)initWithConfiguration:(id)a3 url:(id)a4;
- (double)deviceCheckInIntervalForRegion:(id)a3;
- (double)deviceUpgradeTaskEnablementPercentageForRegion:(id)a3;
- (double)dynamicAssetPrefetchTimeIntervalForRegion:(id)a3;
- (double)paymentSetupFeaturesCacheUpdateIntervalForRegion:(id)a3;
- (double)provisioningEnablementPercentageForRegion:(id)a3;
- (double)sharingMessageCacheTimeToLiveInterval;
- (id)_featuresFromDictionary:(id)a3 withRegion:(id)a4 osVersion:(id)a5 deviceClass:(id)a6;
- (id)_lock_featuresForRegion:(id)a3;
- (id)_lock_featuresForRegion:(id)a3 osVersion:(id)a4 deviceClass:(id)a5;
- (id)_lock_globalFeaturesForOSVersion:(id)a3 deviceClass:(id)a4;
- (id)_lock_region:(id)a3;
- (id)_lock_regions;
- (id)_lock_unsupported_region:(id)a3;
- (id)_lock_unsupported_regions;
- (id)_regionsForOSVersion:(id)a3 deviceClass:(id)a4 platform:(id)a5 supportedRegions:(BOOL)a6;
- (id)allowedRelayServerHostsForRegion:(id)a3;
- (id)applyServiceFeaturesForRegion:(id)a3;
- (id)betaPaymentNetworkVersionsForRegion:(id)a3;
- (id)betaPaymentNetworksForRegion:(id)a3;
- (id)brokerURLForRegion:(id)a3;
- (id)contactFormatConfiguration;
- (id)credentialTypesRequiringDPANNotifications;
- (id)credentialTypesRequiringMetadata;
- (id)defaultServerURL;
- (id)discoveryManifestURLForRegion:(id)a3;
- (id)featureWithType:(int64_t)a3 inRegion:(id)a4;
- (id)featuresForRegion:(id)a3;
- (id)heroImageManifestURLForRegion:(id)a3;
- (id)marketGeoRegionNotificationNetworkThresholdsForRegion:(id)a3;
- (id)marketGeoRegionNotificationTimeRangeForRegion:(id)a3;
- (id)marketsURL;
- (id)numberOfDaysBetweenMapsReprocessingForRegion:(id)a3;
- (id)paymentRelayServiceURLForRegion:(id)a3;
- (id)paymentServicesMerchantURLForRegion:(id)a3;
- (id)paymentServicesURLForRegion:(id)a3;
- (id)paymentSetupBrowsableProductTypesForRegion:(id)a3;
- (id)paymentSetupFeaturedNetworksForRegion:(id)a3;
- (id)primaryFeaturedNetworkForRegion:(id)a3;
- (id)relayServerHostForRegion:(id)a3;
- (id)relayServerHostsToHandleUniversalLinksForRegion:(id)a3;
- (id)stationCodeProvidersUsingLocalLookup;
- (id)supportedFeatureOfType:(int64_t)a3 inRegion:(id)a4 osVersion:(id)a5 deviceClass:(id)a6 didFailOSVersionRequirements:(BOOL *)a7;
- (id)supportedRegionsForOSVersion:(id)a3 deviceClass:(id)a4;
- (id)supportedRegionsForOSVersion:(id)a3 deviceClass:(id)a4 platform:(id)a5;
- (id)unsupportedProvisioningExtensions;
- (id)unsupportedRegionsForOSVersion:(id)a3 deviceClass:(id)a4;
- (id)unsupportedRegionsForOSVersion:(id)a3 deviceClass:(id)a4 platform:(id)a5;
- (id)unsupportedWebPaymentConfigurations;
- (unint64_t)hash;
- (unint64_t)notificationAuthorizationPromptPresentationCount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPaymentWebServiceConfiguration

- (id)_featuresFromDictionary:(id)a3 withRegion:(id)a4 osVersion:(id)a5 deviceClass:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v31 = a5;
  id v30 = a6;
  os_unfair_lock_assert_owner(&self->_lock);
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v13)
  {
    uint64_t v15 = v13;
    uint64_t v16 = *(void *)v34;
    if (v31) {
      BOOL v17 = v30 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    int v18 = !v17;
    *(void *)&long long v14 = 138412290;
    long long v29 = v14;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v12);
        }
        v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v21 = PKWebServiceRegionFeatureTypeFromString(v20);
        if (v21)
        {
          uint64_t v22 = v21;
          v23 = [v12 objectForKey:v20];
          v24 = +[PKWebServiceRegionFeature regionFeatureWithType:v22 dictionary:v23 region:v11];

          if (v24)
          {
            if (!v18
              || ([v24 versionRange],
                  v25 = objc_claimAutoreleasedReturnValue(),
                  int v26 = [v25 versionMeetsRequirements:v31 deviceClass:v30],
                  v25,
                  v26))
            {
              objc_msgSend(v32, "addObject:", v24, v29);
            }
          }
        }
        else
        {
          v24 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v29;
            v38 = v20;
            _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "Unknown feature with identifier: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v15 = [v12 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v15);
  }

  v27 = (void *)[v32 copy];
  return v27;
}

- (unint64_t)notificationAuthorizationPromptPresentationCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int64_t v4 = [(NSDictionary *)self->_configuration PKIntegerForKey:@"notificationAuthorizationPromptPresentationCount"];
  if (v4) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 3;
  }
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)supportedRegionsForOSVersion:(id)a3 deviceClass:(id)a4 platform:(id)a5
{
  return [(PKPaymentWebServiceConfiguration *)self _regionsForOSVersion:a3 deviceClass:a4 platform:a5 supportedRegions:1];
}

- (id)supportedRegionsForOSVersion:(id)a3 deviceClass:(id)a4
{
  return [(PKPaymentWebServiceConfiguration *)self supportedRegionsForOSVersion:a3 deviceClass:a4 platform:0];
}

- (id)_regionsForOSVersion:(id)a3 deviceClass:(id)a4 platform:(id)a5 supportedRegions:(BOOL)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (a6) {
    [(PKPaymentWebServiceConfiguration *)self _lock_regions];
  }
  else {
  uint64_t v13 = [(PKPaymentWebServiceConfiguration *)self _lock_unsupported_regions];
  }
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v20 = [v14 objectForKey:v19];
        if (v20
          && [(PKPaymentWebServiceConfiguration *)self _lock_supportedForOSVersion:v10 inRegionDictionary:v20 deviceClass:v11 platform:v12])
        {
          [v25 addObject:v19];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v16);
  }

  uint64_t v21 = (void *)[v25 copy];
  os_unfair_lock_unlock(locka);

  return v21;
}

- (BOOL)_lock_supportedForOSVersion:(id)a3 inRegionDictionary:(id)a4 deviceClass:(id)a5 platform:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  if (a4)
  {
    id v12 = [a4 objectForKey:@"minimumOSVersion"];
    uint64_t v13 = v12;
    if (v12)
    {
      id v14 = v12;
      uint64_t v15 = v14;
      if (v11)
      {
        uint64_t v16 = [v14 objectForKey:v11];

        uint64_t v15 = (void *)v16;
      }
      uint64_t v17 = [v15 objectForKey:v10];
      int v18 = v17;
      if (v17) {
        BOOL v19 = (unint64_t)([v17 compare:v9 options:64] + 1) < 2;
      }
      else {
        BOOL v19 = 1;
      }
    }
    else
    {
      BOOL v19 = 1;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)regionHasProvisioningEnablementPercentage:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  v7 = [v6 objectForKey:@"ProvisioningEnablementPercentage"];
  os_unfair_lock_unlock(p_lock);

  return v7 != 0;
}

- (id)_lock_region:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PKPaymentWebServiceConfiguration *)self _lock_regions];
  v6 = [v5 objectForKey:v4];

  if (!v6)
  {
    v7 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_error_impl(&dword_190E10000, v7, OS_LOG_TYPE_ERROR, "Region %@ requested but no region data found!", (uint8_t *)&v9, 0xCu);
    }
  }
  return v6;
}

- (id)_lock_regions
{
  return [(NSDictionary *)self->_configuration objectForKey:@"SupportedRegions"];
}

- (id)heroImageManifestURLForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  v7 = [v6 objectForKey:@"PaymentSetupImageManifestURLV3"];
  if (v7)
  {
    v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (NSURL)configurationURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (id)supportedFeatureOfType:(int64_t)a3 inRegion:(id)a4 osVersion:(id)a5 deviceClass:(id)a6 didFailOSVersionRequirements:(BOOL *)a7
{
  id v12 = a5;
  id v13 = a6;
  if (a7) {
    *a7 = 0;
  }
  id v14 = [(PKPaymentWebServiceConfiguration *)self featureWithType:a3 inRegion:a4];
  uint64_t v15 = v14;
  if (!v14) {
    goto LABEL_8;
  }
  uint64_t v16 = [v14 versionRange];
  int v17 = [v16 versionMeetsRequirements:v12 deviceClass:v13];

  if (v17)
  {
    id v18 = v15;
    goto LABEL_9;
  }
  if (a7)
  {
    id v18 = 0;
    *a7 = 1;
  }
  else
  {
LABEL_8:
    id v18 = 0;
  }
LABEL_9:

  return v18;
}

- (id)featureWithType:(int64_t)a3 inRegion:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = PKRegionFeatureOverride();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (!v9) {
    goto LABEL_16;
  }
  uint64_t v10 = v9;
  uint64_t v31 = self;
  id v32 = &self->_lock;
  id v11 = 0;
  uint64_t v12 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v42 != v12) {
        objc_enumerationMutation(v8);
      }
      id v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      uint64_t v15 = objc_msgSend(v14, "region", v31, v32);
      if ([v14 featureType] == a3 && (!v15 || v6 && objc_msgSend(v6, "isEqual:", v15)))
      {
        id v16 = v14;

        int v17 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          int64_t v48 = a3;
          _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Using override for feature of type: %ld", buf, 0xCu);
        }

        id v11 = v16;
      }
    }
    uint64_t v10 = [v8 countByEnumeratingWithState:&v41 objects:v49 count:16];
  }
  while (v10);
  self = v31;
  p_lock = v32;
  if (!v11)
  {
LABEL_16:
    [(PKPaymentWebServiceConfiguration *)self _lock_featuresForRegion:v6];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v18 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v38;
LABEL_18:
      uint64_t v22 = 0;
      while (1)
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v37 + 1) + 8 * v22);
        if ([v23 featureType] == a3) {
          break;
        }
        if (v20 == ++v22)
        {
          uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v20) {
            goto LABEL_18;
          }
          goto LABEL_24;
        }
      }
      id v11 = v23;

      if (v11) {
        goto LABEL_37;
      }
    }
    else
    {
LABEL_24:
    }
    [(PKPaymentWebServiceConfiguration *)self _lock_globalFeaturesForOSVersion:0 deviceClass:0];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v24 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v34;
      while (2)
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v34 != v27) {
            objc_enumerationMutation(v24);
          }
          long long v29 = *(void **)(*((void *)&v33 + 1) + 8 * j);
          if ([v29 featureType] == a3)
          {
            id v11 = v29;
            goto LABEL_36;
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v33 objects:v45 count:16];
        if (v26) {
          continue;
        }
        break;
      }
    }
    id v11 = 0;
LABEL_36:
  }
LABEL_37:
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)_lock_globalFeaturesForOSVersion:(id)a3 deviceClass:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_assert_owner(p_lock);
  uint64_t v9 = [(NSDictionary *)self->_configuration PKDictionaryForKey:@"globalFeatures"];
  uint64_t v10 = [(PKPaymentWebServiceConfiguration *)self _featuresFromDictionary:v9 withRegion:0 osVersion:v8 deviceClass:v7];

  return v10;
}

- (id)_lock_featuresForRegion:(id)a3 osVersion:(id)a4 deviceClass:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  id v11 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v8];
  uint64_t v12 = [v11 PKDictionaryForKey:@"features"];
  if (v12)
  {
    id v13 = (void *)v12;
  }
  else
  {
    id v14 = [(PKPaymentWebServiceConfiguration *)self _lock_unsupported_region:v8];

    id v13 = [v14 PKDictionaryForKey:@"features"];
    id v11 = v14;
  }
  uint64_t v15 = [(PKPaymentWebServiceConfiguration *)self _featuresFromDictionary:v13 withRegion:v8 osVersion:v9 deviceClass:v10];

  return v15;
}

- (id)_lock_featuresForRegion:(id)a3
{
  return [(PKPaymentWebServiceConfiguration *)self _lock_featuresForRegion:a3 osVersion:0 deviceClass:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentWebServiceConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentWebServiceConfiguration *)self init];
  id v6 = v5;
  if (v5)
  {
    os_unfair_lock_lock(&v5->_lock);
    id v7 = [v4 decodePropertyListForKey:@"configuration"];
    uint64_t v8 = PKDeepCopyDeduplicatedWithHashTable(v7, 0);
    configuration = v6->_configuration;
    v6->_configuration = (NSDictionary *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"configurationURL"];
    configurationURL = v6->_configurationURL;
    v6->_configurationURL = (NSURL *)v10;

    os_unfair_lock_unlock(&v6->_lock);
  }

  return v6;
}

- (PKPaymentWebServiceConfiguration)init
{
  v7.receiver = self;
  v7.super_class = (Class)PKPaymentWebServiceConfiguration;
  v2 = [(PKPaymentWebServiceConfiguration *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    id v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1C9E8]);
    configuration = v3->_configuration;
    v3->_configuration = v4;
  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [v5 encodeObject:self->_configuration forKey:@"configuration"];
  [v5 encodeObject:self->_configurationURL forKey:@"configurationURL"];

  os_unfair_lock_unlock(p_lock);
}

- (PKPaymentWebServiceConfiguration)initWithConfiguration:(id)a3 url:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKPaymentWebServiceConfiguration *)self init];
  if (v8)
  {
    uint64_t v9 = PKDeepCopyDeduplicatedWithHashTable(v6, 0);
    configuration = v8->_configuration;
    v8->_configuration = (NSDictionary *)v9;

    uint64_t v11 = [v7 copy];
    configurationURL = v8->_configurationURL;
    v8->_configurationURL = (NSURL *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NSDictionary *)self->_configuration isEqualToDictionary:v4[3]];

  return v5;
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_configuration hash];
}

- (id)brokerURLForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  if (v6)
  {
    id v7 = [v6 objectForKey:@"serverURL"];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)paymentServicesURLForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  if (v6)
  {
    id v7 = [v6 objectForKey:@"PaymentServicesURL"];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)paymentRelayServiceURLForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  if (v6)
  {
    id v7 = [v6 objectForKey:@"PaymentRelayServiceURL"];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)paymentServicesMerchantURLForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  if (v6)
  {
    id v7 = [v6 objectForKey:@"PaymentServicesMerchantURL"];
    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (BOOL)buddyProvisioningEnabledForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 objectForKey:@"BuddyProvisioningEnabled"];
  uint64_t v8 = v7;
  if (v7) {
    char v9 = [v7 BOOLValue];
  }
  else {
    char v9 = 1;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BOOL)buddyManualProvisioningEnabledForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 objectForKey:@"BuddyManualProvisioningEnabled"];
  char v8 = [v7 BOOLValue];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)manualProvisioningEnabledForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 objectForKey:@"ManualProvisioningEnabled"];
  char v8 = [v7 BOOLValue];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)cameraFirstProvisioningEnabledForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 objectForKey:@"CameraFirstProvisioningEnabledV2"];
  char v8 = v7;
  if (v7) {
    char v9 = [v7 BOOLValue];
  }
  else {
    char v9 = 1;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BOOL)tapToProvisionEnabledForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 objectForKey:@"TapToProvisionEnabled"];
  char v8 = v7;
  if (!v7 || ([v7 BOOLValue] & 1) == 0)
  {
    if (!PKEnableTapToProvision())
    {
      BOOL v10 = 0;
      goto LABEL_9;
    }
    char v9 = PKLogFacilityTypeGetObject(0x24uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Enabling Tap To Provision from Internal Settings override", v12, 2u);
    }
  }
  BOOL v10 = 1;
LABEL_9:
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (BOOL)tapToProvisionFirstProvisioningEnabledForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 objectForKey:@"TapToProvisionFirstProvisioningEnabled"];
  char v8 = v7;
  if (v7) {
    char v9 = [v7 BOOLValue];
  }
  else {
    char v9 = 1;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)paymentSetupFeaturedNetworksForRegion:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v4];
  id v7 = [v6 PKArrayContaining:objc_opt_class() forKey:@"PaymentSetupFeaturedNetworksV3"];
  if (![v7 count])
  {
    uint64_t v8 = [v6 PKArrayContaining:objc_opt_class() forKey:@"PaymentSetupFeaturedNetworksV2"];

    id v7 = (void *)v8;
  }
  if ([v7 count])
  {
    char v9 = (void *)[v7 copy];
  }
  else
  {
    BOOL v10 = [v6 PKArrayContaining:objc_opt_class() forKey:@"PaymentSetupFeaturedNetworks"];
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v10, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v12 = v10;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v22;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v22 != v15) {
            objc_enumerationMutation(v12);
          }
          int v17 = PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * v16), "integerValue", (void)v21));
          if (v17) {
            [v11 addObject:v17];
          }

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v14);
    }

    char v9 = (void *)[v11 copy];
  }
  os_unfair_lock_unlock(p_lock);
  if (v9) {
    id v18 = v9;
  }
  else {
    id v18 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v19 = v18;

  return v19;
}

- (id)primaryFeaturedNetworkForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 PKStringForKey:@"PaymentSetupPrimaryFeaturedNetworkV2"];
  if (!v7)
  {
    uint64_t v8 = [v6 PKNumberForKey:@"PaymentSetupPrimaryFeaturedNetwork"];
    id v7 = PKPaymentNetworkNameForPaymentCredentialType([v8 integerValue]);
  }
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)discoveryManifestURLForRegion:(id)a3
{
  id v4 = a3;
  id v5 = PKDiscoveryManifestOverrideURL();
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    char v9 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v4];
    BOOL v10 = [v9 objectForKey:@"DiscoveryManifestURL"];
    if (v10)
    {
      id v7 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
    }
    else
    {
      id v7 = 0;
    }
    os_unfair_lock_unlock(p_lock);
  }
  return v7;
}

- (id)marketsURL
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = PKMarketsURLOverride();
  if (v4
    || ([(NSDictionary *)self->_configuration PKStringForKey:@"MarketGeosURL"],
        (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  }
  else
  {
    id v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (id)defaultServerURL
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSDictionary *)self->_configuration PKStringForKey:@"defaultServerURL"];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
  }
  else
  {
    id v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (BOOL)suppressCardholderNameFieldForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 objectForKey:@"PaymentSetupSuppressCardholderName"];
  uint64_t v8 = v7;
  if (v7) {
    char v9 = [v7 BOOLValue];
  }
  else {
    char v9 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)paymentSetupBrowsableProductTypesForRegion:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v7 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v4];
  uint64_t v8 = [v7 PKArrayContaining:objc_opt_class() forKey:@"PaymentSetupBrowsableProductTypes"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = PKPaymentSetupProductTypeFromString(*(void **)(*((void *)&v17 + 1) + 8 * i));
        if (v13)
        {
          uint64_t v14 = [NSNumber numberWithUnsignedInteger:v13];
          [v5 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }
  os_unfair_lock_unlock(p_lock);
  uint64_t v15 = (void *)[v5 copy];

  return v15;
}

- (double)provisioningEnablementPercentageForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 objectForKey:@"ProvisioningEnablementPercentage"];
  uint64_t v8 = v7;
  if (v7)
  {
    [v7 doubleValue];
    double v10 = v9;
  }
  else
  {
    double v10 = 1.0;
  }
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (double)deviceUpgradeTaskEnablementPercentageForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 objectForKey:@"deviceUpgradeTasksEnablementPercentage"];
  os_unfair_lock_unlock(p_lock);
  if (v7
    || ([(NSDictionary *)self->_configuration objectForKey:@"deviceUpgradeTasksEnablementPercentage"], (id v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v7 doubleValue];
    double v9 = 1.0;
    if (v8 <= 1.0) {
      double v9 = v8;
    }
    if (v8 >= 0.0) {
      double v10 = v9;
    }
    else {
      double v10 = 0.0;
    }
  }
  else
  {
    double v10 = 1.0;
  }

  return v10;
}

- (BOOL)paymentTransactionIconsEnabledForRegion:(id)a3
{
  id v4 = (__CFString *)a3;
  if (![(__CFString *)v4 length])
  {

    id v4 = @"US";
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v4];
  id v7 = [v6 objectForKey:@"PaymentTransactionIconsEnabled"];
  double v8 = v7;
  if (v7)
  {
    char v9 = [v7 BOOLValue];
  }
  else
  {
    if (([(__CFString *)v4 isEqualToString:@"US"] & 1) != 0
      || ([(__CFString *)v4 isEqualToString:@"GB"] & 1) != 0
      || ([(__CFString *)v4 isEqualToString:@"CA"] & 1) != 0
      || ([(__CFString *)v4 isEqualToString:@"DE"] & 1) != 0)
    {
      BOOL v10 = 1;
      goto LABEL_11;
    }
    char v9 = [(__CFString *)v4 isEqualToString:@"NL"];
  }
  BOOL v10 = v9;
LABEL_11:
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (BOOL)peerPaymentEnabledForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 objectForKey:@"PeerPaymentSupported"];
  double v8 = v7;
  if (v7) {
    char v9 = [v7 BOOLValue];
  }
  else {
    char v9 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BOOL)userCanResetCloudStoreApplePayViewForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 objectForKey:@"UserCanResetCloudApplePayView"];
  double v8 = v7;
  if (v7) {
    char v9 = [v7 BOOLValue];
  }
  else {
    char v9 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)betaPaymentNetworksForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 PKArrayContaining:objc_opt_class() forKey:@"BetaPaymentNetworks"];
  if ([v7 count]) {
    double v8 = (void *)[v7 copy];
  }
  else {
    double v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (id)betaPaymentNetworkVersionsForRegion:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 PKArrayContaining:objc_opt_class() forKey:@"BetaPaymentNetworkVersions"];
  if ([v7 count]) {
    double v8 = (void *)[v7 copy];
  }
  else {
    double v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);
  if (v8) {
    char v9 = v8;
  }
  else {
    char v9 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v10 = v9;

  return v10;
}

- (id)unsupportedRegionsForOSVersion:(id)a3 deviceClass:(id)a4
{
  return [(PKPaymentWebServiceConfiguration *)self unsupportedRegionsForOSVersion:a3 deviceClass:a4 platform:0];
}

- (id)unsupportedRegionsForOSVersion:(id)a3 deviceClass:(id)a4 platform:(id)a5
{
  return [(PKPaymentWebServiceConfiguration *)self _regionsForOSVersion:a3 deviceClass:a4 platform:a5 supportedRegions:0];
}

- (BOOL)hasFeatureRequiringRegistrationInRegion:(id)a3 osVersion:(id)a4 deviceClass:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  PKRegionFeatureOverride();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
  long long v43 = v10;
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v55;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v55 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        [v16 enablementThreshold];
        if (v17 > 0.0 && ([v16 registrationType] == 2 || objc_msgSend(v16, "registrationType") == 3))
        {
          long long v29 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v29, OS_LOG_TYPE_DEFAULT, "Override feature adding support for region.", buf, 2u);
          }

          char v27 = 1;
          id v30 = obj;
          goto LABEL_42;
        }
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v54 objects:v60 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  long long v18 = [(PKPaymentWebServiceConfiguration *)self _lock_featuresForRegion:v8 osVersion:v9 deviceClass:v10];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v49 objects:v59 count:16];
  id v40 = v9;
  id v41 = v8;
  if (v19)
  {
    uint64_t v20 = v19;
    char v21 = 0;
    uint64_t v22 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v50 != v22) {
          objc_enumerationMutation(v18);
        }
        long long v24 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        uint64_t v25 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v24, "featureType"));
        [v11 addObject:v25];

        [v24 enablementThreshold];
        if (v26 > 0.0 && ([v24 registrationType] == 2 || objc_msgSend(v24, "registrationType") == 3)) {
          char v21 = 1;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v49 objects:v59 count:16];
    }
    while (v20);

    id v9 = v40;
    id v8 = v41;
    if (v21)
    {
      char v27 = 1;
      p_locuint64_t k = &self->_lock;
      goto LABEL_43;
    }
  }
  else
  {
  }
  id v30 = [(PKPaymentWebServiceConfiguration *)self _lock_globalFeaturesForOSVersion:v9 deviceClass:v43];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v31 = [v30 countByEnumeratingWithState:&v45 objects:v58 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    char v27 = 0;
    uint64_t v33 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v32; ++k)
      {
        if (*(void *)v46 != v33) {
          objc_enumerationMutation(v30);
        }
        long long v35 = *(void **)(*((void *)&v45 + 1) + 8 * k);
        long long v36 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v35, "featureType"));
        char v37 = [v11 containsObject:v36];

        if ((v37 & 1) == 0)
        {
          [v35 enablementThreshold];
          if (v38 > 0.0 && ([v35 registrationType] == 2 || objc_msgSend(v35, "registrationType") == 3)) {
            char v27 = 1;
          }
        }
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v45 objects:v58 count:16];
    }
    while (v32);
    id v9 = v40;
    id v8 = v41;
  }
  else
  {
    char v27 = 0;
  }
LABEL_42:
  p_locuint64_t k = lock;

LABEL_43:
  os_unfair_lock_unlock(p_lock);

  return v27 & 1;
}

- (id)featuresForRegion:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_featuresForRegion:v5];

  id v7 = (void *)[v6 copy];
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)unsupportedWebPaymentConfigurations
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSDictionary *)self->_configuration PKArrayForKey:@"UnsupportedWebPaymentConfigurations"];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)remotePaymentsRequiredForVoiceover
{
  v2 = self;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(NSDictionary *)v2->_configuration PKBoolForKey:@"MandateRemotePayments"];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)accountServiceEnabledForRegion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v4];
  id v7 = [v6 objectForKey:@"accountServiceEnabled"];
  id v8 = v7;
  if (v7) {
    LOBYTE(v9) = [v7 BOOLValue];
  }
  else {
    LOBYTE(v9) = 0;
  }
  id v10 = PKAccountServiceOverrideURL();

  if ((v9 & 1) == 0 && v10)
  {
    int v9 = [(__CFString *)v4 isEqualToString:@"US"];
    id v11 = PKLogFacilityTypeGetObject(0xEuLL);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        int v15 = 138412290;
        uint64_t v16 = @"YES";
        uint64_t v13 = "Account service enabled in region overrideURLActive: %@";
LABEL_11:
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
      }
    }
    else if (v12)
    {
      int v15 = 138412290;
      uint64_t v16 = v4;
      uint64_t v13 = "Warning: Toggle region not allowed: %@";
      goto LABEL_11;
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BOOL)applyServiceEnabledForRegion:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v4];
  id v7 = [v6 objectForKey:@"applyServiceEnabled"];
  id v8 = v7;
  if (v7) {
    LOBYTE(v9) = [v7 BOOLValue];
  }
  else {
    LOBYTE(v9) = 0;
  }
  id v10 = PKApplyServiceOverrideURL();

  if ((v9 & 1) == 0 && v10)
  {
    int v9 = [(__CFString *)v4 isEqualToString:@"US"];
    id v11 = PKLogFacilityTypeGetObject(0xDuLL);
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        int v15 = 138412290;
        uint64_t v16 = @"YES";
        uint64_t v13 = "Apply service enabled in region overrideURLActive: %@";
LABEL_11:
        _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
      }
    }
    else if (v12)
    {
      int v15 = 138412290;
      uint64_t v16 = v4;
      uint64_t v13 = "Warning: Toggle region not allowed: %@";
      goto LABEL_11;
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)applyServiceFeaturesForRegion:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 PKDictionaryForKey:@"applyServiceFeatures"];
  id v8 = (void *)[v7 copy];

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (BOOL)AMPNonDefaultBehaviourDisabledForRegion:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  LOBYTE(v5) = [v6 PKBoolForKey:@"AMPNonDefaultBehaviorDisabled"];
  os_unfair_lock_unlock(p_lock);

  return (char)v5;
}

- (id)numberOfDaysBetweenMapsReprocessingForRegion:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 PKNumberForKey:@"MapsReprocessingWaitTime"];
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (BOOL)browseProvisioningBankAppsEnabledForRegion:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  LOBYTE(v5) = [v6 PKBoolForKey:@"BrowseProvisioningBankAppsEnabled"];
  os_unfair_lock_unlock(p_lock);

  return (char)v5;
}

- (id)marketGeoRegionNotificationTimeRangeForRegion:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 PKNumberForKey:@"MarketGeoRegionNotificationTimeRange"];
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)marketGeoRegionNotificationNetworkThresholdsForRegion:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  id v7 = [v6 PKDictionaryForKey:@"MarketGeoRegionNotificationNetworkThresholds"];
  os_unfair_lock_unlock(p_lock);
  if (v7) {
    id v8 = v7;
  }
  else {
    id v8 = (void *)MEMORY[0x1E4F1CC08];
  }
  id v9 = v8;

  return v9;
}

- (double)deviceCheckInIntervalForRegion:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  [v6 PKDoubleForKey:@"DeviceCheckInInterval"];
  double v8 = 604800.0;
  if (v7 <= 604800.0) {
    double v8 = v7;
  }
  if (v7 < 600.0) {
    double v8 = 600.0;
  }
  if (v7 == 0.0) {
    double v9 = 0.0;
  }
  else {
    double v9 = v8;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BOOL)deviceCheckInDisabledForRegion:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  LOBYTE(v5) = [v6 PKBoolForKey:@"DeviceCheckInDisabled"];
  os_unfair_lock_unlock(p_lock);

  return (char)v5;
}

- (BOOL)shouldEnableTransitServiceCheckInForRegion:(id)a3
{
  id v4 = a3;
  if (PKForceEnableTransitServiceCheckIn())
  {
    id v5 = PKLogFacilityTypeGetObject(0xCuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Transit service check in enabled by internal toggle", v10, 2u);
    }

    char v6 = 1;
  }
  else
  {
    p_locuint64_t k = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    double v8 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v4];
    char v6 = [v8 PKBoolForKey:@"EnableTransitServiceCheckIn"];
    os_unfair_lock_unlock(p_lock);
  }
  return v6;
}

- (id)contactFormatConfiguration
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSDictionary *)self->_configuration PKDictionaryForKey:@"contactFormatConfiguration"];
  if (v4) {
    id v5 = [[PKContactFormatConfiguration alloc] initWithDictionary:v4];
  }
  else {
    id v5 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (id)credentialTypesRequiringMetadata
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSDictionary *)self->_configuration PKSetForKey:@"credentialTypesRequiringMetadata"];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)credentialTypesRequiringDPANNotifications
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSDictionary *)self->_configuration PKSetForKey:@"credentialTypesRequiringDPANNotifications"];
  id v5 = (void *)[v4 copy];

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)relayServerHostForRegion:(id)a3
{
  v3 = [(PKPaymentWebServiceConfiguration *)self featureWithType:5 inRegion:a3];
  id v4 = [v3 relayServerHost];
  id v5 = PKSharingRelayServerURLForCurrentEnvironment(v4);

  return v5;
}

- (id)allowedRelayServerHostsForRegion:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentWebServiceConfiguration *)self featureWithType:5 inRegion:v4];
  char v6 = [v5 allowedRelayServerHosts];
  id v7 = objc_alloc(MEMORY[0x1E4F1CA80]);
  double v8 = [(PKPaymentWebServiceConfiguration *)self relayServerHostsToHandleUniversalLinksForRegion:v4];

  double v9 = (void *)[v7 initWithArray:v8];
  if (v6) {
    [v9 addObjectsFromArray:v6];
  }
  [v9 addObject:@"wallet.apple.com"];
  id v10 = [v9 allObjects];

  return v10;
}

- (id)relayServerHostsToHandleUniversalLinksForRegion:(id)a3
{
  v3 = [(PKPaymentWebServiceConfiguration *)self featureWithType:5 inRegion:a3];
  id v4 = [v3 relayServerHostsToHandleUniversalLinks];
  id v5 = (void *)[v4 mutableCopy];
  char v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  double v8 = v7;

  double v9 = [v3 relayServerHost];
  [v8 safelyAddObject:v9];

  id v10 = PKSharingRelayServerURLs();
  [v8 addObjectsFromArray:v10];

  id v11 = (void *)[v8 copy];
  return v11;
}

- (double)dynamicAssetPrefetchTimeIntervalForRegion:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  char v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  uint64_t v7 = [v6 PKNumberForKey:@"dynamicAssetPrefetchTimeInterval"];
  if (v7)
  {
    double v8 = (void *)v7;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    double v8 = [(NSDictionary *)self->_configuration PKNumberForKey:@"defaultDynamicAssetPrefetchTimeInterval"];
    os_unfair_lock_unlock(p_lock);
    if (!v8)
    {
      double v8 = [NSNumber numberWithInt:86400];
      double v9 = PKLogFacilityTypeGetObject(0xAuLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        uint64_t v14 = v8;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Falling back to hardcoded time interval for prefetch %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  [v8 doubleValue];
  double v11 = v10;

  return v11;
}

- (double)paymentSetupFeaturesCacheUpdateIntervalForRegion:(id)a3
{
  p_locuint64_t k = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  char v6 = [(PKPaymentWebServiceConfiguration *)self _lock_region:v5];

  uint64_t v7 = [v6 PKNumberForKey:@"paymentSetupFeaturesCacheUpdateInterval"];
  if (v7)
  {
    double v8 = (void *)v7;
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    double v8 = [(NSDictionary *)self->_configuration PKNumberForKey:@"defaultPaymentSetupFeaturesCacheUpdateInterval"];
    os_unfair_lock_unlock(p_lock);
    if (!v8)
    {
      double v8 = [NSNumber numberWithInt:0xFFFFFFFFLL];
    }
  }
  [v8 doubleValue];
  double v10 = v9;

  return v10;
}

- (double)sharingMessageCacheTimeToLiveInterval
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSDictionary *)self->_configuration PKNumberForKey:@"sharingMessageCacheTimeToLiveInterval"];
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    id v4 = [NSNumber numberWithInt:172800];
  }
  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (BOOL)quickAccessForMoreRemovePassEnabled
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSDictionary *)self->_configuration PKNumberForKey:@"quickAccessForMoreRemovePassEnabled"];
  double v5 = v4;
  if (v4) {
    char v6 = [v4 BOOLValue];
  }
  else {
    char v6 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)stationCodeProvidersUsingLocalLookup
{
  v6[1] = *MEMORY[0x1E4F143B8];
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSDictionary *)self->_configuration PKArrayContaining:objc_opt_class() forKey:@"stationCodeProvidersUsingLocalLookup"];
  if (!v4)
  {
    v6[0] = @"transit.apple.tmoney";
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)unsupportedProvisioningExtensions
{
  p_locuint64_t k = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  configuration = self->_configuration;
  uint64_t v5 = objc_opt_class();
  char v6 = [(NSDictionary *)configuration PKDictionaryOfKeyClass:v5 valueClass:objc_opt_class() ForKey:@"unsupportedProvisioningExtensions"];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_lock_unsupported_regions
{
  return [(NSDictionary *)self->_configuration objectForKey:@"unsupportedRegions"];
}

- (id)_lock_unsupported_region:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentWebServiceConfiguration *)self _lock_unsupported_regions];
  char v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSDictionary)configuration
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationURL, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end