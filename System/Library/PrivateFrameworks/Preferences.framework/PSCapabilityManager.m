@interface PSCapabilityManager
+ (id)sharedManager;
- (AXCapabilityManager)axCapabilityManager;
- (BOOL)capabilityBoolAnswer:(id)a3;
- (BOOL)hasCapabilities:(id)a3;
- (NSMutableDictionary)overrides;
- (NSNumber)overrideForAllBoolValues;
- (PSCapabilityManager)init;
- (id)applicationDisplayIdentifiers;
- (id)capabilityAnswer:(id)a3;
- (id)preferencesCapabilityAnswer:(id)a3;
- (id)supportPSPhoneNoiseCancellationCapability;
- (id)supportPSPhotoFormatEnhancedProRAWCapability;
- (id)supportPSPhotoFormatProRAWCapability;
- (id)supportPSRecordHDRVideoCapability;
- (id)supportsAutoWhiteBalanceCapability;
- (id)supportsChamoisExternalDisplay;
- (id)supportsContinuityCamera;
- (id)supportsDisplayZoomCapability;
- (id)supportsInEDUModeCapability;
- (id)supportsInStoreDemoModeCapability;
- (id)supportsLightningAdapterCapability;
- (id)supportsListeningExperienceCapbility;
- (id)supportsNightShiftCapability;
- (id)supportsPSCellularDataPlanCapability;
- (id)supportsPSDeveloperSettingsCapability;
- (id)supportsPSExposureNotificationsCapability;
- (id)supportsPSHomeScreenPhoneCapability;
- (id)supportsPSPencilCapability;
- (id)supportsPSTTYCapability;
- (id)supportsPSTrackpadAndMouseCapability;
- (id)supportsPSTrackpadOnlyCapability;
- (id)supportsPictureInPictureCapability;
- (id)supportsRaiseToWakeCapability;
- (id)supportsRetailKioskModeCapability;
- (id)supportsWalletApplePayCapability;
- (void)resetOverrides;
- (void)setAxCapabilityManager:(id)a3;
- (void)setOverrideForAllBoolValues:(id)a3;
- (void)setOverrideValue:(id)a3 forKey:(id)a4;
- (void)setOverrides:(id)a3;
@end

@implementation PSCapabilityManager

+ (id)sharedManager
{
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, &__block_literal_global_24);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

uint64_t __36__PSCapabilityManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(PSCapabilityManager);
  uint64_t v1 = sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (PSCapabilityManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)PSCapabilityManager;
  v2 = [(PSCapabilityManager *)&v8 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(PSCapabilityManager *)v2 setOverrides:v3];

    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v4 = (void *)getAXCapabilityManagerClass_softClass;
    uint64_t v13 = getAXCapabilityManagerClass_softClass;
    if (!getAXCapabilityManagerClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getAXCapabilityManagerClass_block_invoke;
      v9[3] = &unk_1E5C5D4D8;
      v9[4] = &v10;
      __getAXCapabilityManagerClass_block_invoke((uint64_t)v9);
      v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    v6 = objc_opt_new();
    [(PSCapabilityManager *)v2 setAxCapabilityManager:v6];
  }
  return v2;
}

- (id)capabilityAnswer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSCapabilityManager *)self overrides];
  if (!v5) {
    goto LABEL_16;
  }
  v6 = (void *)v5;
  v7 = [(PSCapabilityManager *)self overrides];
  objc_super v8 = [v7 objectForKeyedSubscript:v4];

  if (!v8
    || ([(PSCapabilityManager *)self overrides],
        v9 = objc_claimAutoreleasedReturnValue(),
        [v9 objectForKeyedSubscript:v4],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
LABEL_16:
    if (!MGIsQuestionValid() || (uint64_t v10 = (void *)MGCopyAnswer()) == 0)
    {
      uint64_t v10 = [(PSCapabilityManager *)self preferencesCapabilityAnswer:v4];
    }
  }
  uint64_t v11 = [(PSCapabilityManager *)self overrideForAllBoolValues];
  if (v11
    && (uint64_t v12 = (void *)v11,
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v12,
        (isKindOfClass & 1) != 0))
  {
    id v14 = [(PSCapabilityManager *)self overrideForAllBoolValues];
  }
  else
  {
    id v14 = v10;
  }
  v15 = v14;

  return v15;
}

- (BOOL)capabilityBoolAnswer:(id)a3
{
  id v3 = [(PSCapabilityManager *)self capabilityAnswer:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setOverrideValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PSCapabilityManager *)self overrides];
  [v8 setObject:v7 forKeyedSubscript:v6];
}

- (void)setOverrideForAllBoolValues:(id)a3
{
}

- (void)resetOverrides
{
  id v3 = [(PSCapabilityManager *)self overrides];
  [v3 removeAllObjects];

  overrideForAllBoolValues = self->_overrideForAllBoolValues;
  self->_overrideForAllBoolValues = 0;
}

- (BOOL)hasCapabilities:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v41;
    unint64_t v7 = 0x1E4F1C000uLL;
    unint64_t v8 = 0x1E4F28000uLL;
    uint64_t v30 = *(void *)v41;
LABEL_3:
    uint64_t v9 = 0;
    uint64_t v31 = v5;
    while (1)
    {
      if (*(void *)v41 != v6) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v27 = [(PSCapabilityManager *)self capabilityAnswer:v10];
        if (!v27
          || (objc_opt_class(), id v34 = v27, (objc_opt_isKindOfClass() & 1) != 0)
          && ([v27 BOOLValue] & 1) == 0)
        {

LABEL_34:
          BOOL v28 = 0;
          goto LABEL_35;
        }
LABEL_29:
      }
LABEL_30:
      if (++v9 == v5)
      {
        uint64_t v5 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_32;
      }
    }
    uint64_t v11 = [v10 allKeys];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v34 = v11;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      v35 = v10;
      uint64_t v33 = v9;
      uint64_t v14 = *(void *)v37;
      char v15 = 1;
      v16 = v34;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v37 != v14) {
            objc_enumerationMutation(v16);
          }
          uint64_t v18 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          v19 = objc_msgSend(v35, "objectForKey:", v18, v30);
          v20 = [(PSCapabilityManager *)self capabilityAnswer:v18];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v21 = [v20 containsObject:v19];
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v22 = self;
              unint64_t v23 = v8;
              unint64_t v24 = v7;
              int v25 = [v20 intValue];
              BOOL v26 = v25 == [v19 intValue];
              unint64_t v7 = v24;
              unint64_t v8 = v23;
              self = v22;
              v16 = v34;
              int v21 = v26;
            }
            else
            {
              int v21 = [v20 isEqual:v19];
            }
          }
          if (!v21) {
            char v15 = 0;
          }
        }
        uint64_t v13 = [v16 countByEnumeratingWithState:&v36 objects:v44 count:16];
      }
      while (v13);

      uint64_t v6 = v30;
      uint64_t v5 = v31;
      uint64_t v9 = v33;
      if ((v15 & 1) == 0) {
        goto LABEL_34;
      }
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_32:
  BOOL v28 = 1;
LABEL_35:

  return v28;
}

- (id)preferencesCapabilityAnswer:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isEqualToString:@"PSDisplayZoomCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsDisplayZoomCapability];
LABEL_53:
    uint64_t v6 = (void *)v5;
    goto LABEL_54;
  }
  if ([v4 isEqualToString:@"PSApplicationDisplayIdentifiersCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self applicationDisplayIdentifiers];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSRaiseToWakeCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsRaiseToWakeCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSAutoWhiteBalanceCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsAutoWhiteBalanceCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSNightShiftCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsNightShiftCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSInStoreDemoModeCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsInStoreDemoModeCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSInEDUModeCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsInEDUModeCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSTTYCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsPSTTYCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSDeveloperSettingsCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsPSDeveloperSettingsCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSWalletApplePayCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsWalletApplePayCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSCellularDataPlanCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsPSCellularDataPlanCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSPencilCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsPSPencilCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSExposureNotificationsCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsPSExposureNotificationsCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSHomeScreenPhoneCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsPSHomeScreenPhoneCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"DeviceHasTrackpadOnly"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsPSTrackpadOnlyCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"DeviceHasTrackpadAndMouse"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsPSTrackpadAndMouseCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"ListeningExperienceCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsListeningExperienceCapbility];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"LightningAdapterCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsLightningAdapterCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSPictureInPictureCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsPictureInPictureCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSStageManagerCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsChamoisExternalDisplay];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSRecordHDRVideoCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportPSRecordHDRVideoCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSPhotoFormatProRAWCapabilities"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportPSPhotoFormatProRAWCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSPhotoFormatEnhancedProRAWCapabilities"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportPSPhotoFormatEnhancedProRAWCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSPhoneNoiseCancellationCapability"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportPSPhoneNoiseCancellationCapability];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"PSContunityCamera"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsContinuityCamera];
    goto LABEL_53;
  }
  if ([v4 isEqualToString:@"retail-kiosk-mode"])
  {
    uint64_t v5 = [(PSCapabilityManager *)self supportsRetailKioskModeCapability];
    goto LABEL_53;
  }
  unint64_t v8 = [(PSCapabilityManager *)self axCapabilityManager];
  int v9 = [v8 isAccessibilityCapability:v4];

  if (v9)
  {
    uint64_t v10 = NSNumber;
    uint64_t v11 = [(PSCapabilityManager *)self axCapabilityManager];
    uint64_t v6 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "isCapabilityAvailable:", v4));
  }
  else
  {
    uint64_t v12 = _PSLoggingFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_1A6597000, v12, OS_LOG_TYPE_DEFAULT, "No capability found for key %@", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v6 = 0;
  }
LABEL_54:

  return v6;
}

- (id)supportsPictureInPictureCapability
{
  v2 = NSNumber;
  if (_os_feature_enabled_impl())
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2050000000;
    id v3 = (void *)getPGPictureInPictureProxyClass_softClass;
    uint64_t v12 = getPGPictureInPictureProxyClass_softClass;
    if (!getPGPictureInPictureProxyClass_softClass)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __getPGPictureInPictureProxyClass_block_invoke;
      v8[3] = &unk_1E5C5D4D8;
      v8[4] = &v9;
      __getPGPictureInPictureProxyClass_block_invoke((uint64_t)v8);
      id v3 = (void *)v10[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v9, 8);
    uint64_t v5 = [v4 isPictureInPictureSupported];
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = [v2 numberWithInt:v5];
  return v6;
}

- (id)supportsChamoisExternalDisplay
{
  v2 = NSNumber;
  uint64_t v3 = MGGetBoolAnswer();
  return (id)[v2 numberWithBool:v3];
}

- (id)supportsLightningAdapterCapability
{
  uint64_t v22 = 0;
  unint64_t v23 = &v22;
  uint64_t v24 = 0x2050000000;
  v2 = (void *)getADASManagerClass_softClass;
  uint64_t v25 = getADASManagerClass_softClass;
  if (!getADASManagerClass_softClass)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __getADASManagerClass_block_invoke;
    v20 = &unk_1E5C5D4D8;
    int v21 = &v22;
    __getADASManagerClass_block_invoke((uint64_t)&v17);
    v2 = (void *)v23[3];
  }
  uint64_t v3 = v2;
  _Block_object_dispose(&v22, 8);
  id v4 = objc_alloc_init(v3);
  uint64_t v22 = 0;
  unint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v5 = (void *)getADAFPreferenceKeyHAENKnownAccessoriesSymbolLoc_ptr;
  uint64_t v25 = getADAFPreferenceKeyHAENKnownAccessoriesSymbolLoc_ptr;
  if (!getADAFPreferenceKeyHAENKnownAccessoriesSymbolLoc_ptr)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __getADAFPreferenceKeyHAENKnownAccessoriesSymbolLoc_block_invoke;
    v20 = &unk_1E5C5D4D8;
    int v21 = &v22;
    uint64_t v6 = (void *)AudioDataAnalysisLibrary();
    unint64_t v7 = dlsym(v6, "ADAFPreferenceKeyHAENKnownAccessories");
    *(void *)(v21[1] + 24) = v7;
    getADAFPreferenceKeyHAENKnownAccessoriesSymbolLoc_ptr = *(void *)(v21[1] + 24);
    uint64_t v5 = (void *)v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (!v5)
  {
    -[PSContactsAuthorizationLevelController dealloc]();
    goto LABEL_16;
  }
  unint64_t v8 = [v4 getPreferenceFor:*v5];
  uint64_t v9 = NSNumber;
  if ([v8 count])
  {
    uint64_t v10 = [v9 numberWithInt:1];
    goto LABEL_12;
  }
  uint64_t v22 = 0;
  unint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v11 = (void *)getADAFPreferenceKeyConnectedWiredDeviceIsHeadphoneSymbolLoc_ptr;
  uint64_t v25 = getADAFPreferenceKeyConnectedWiredDeviceIsHeadphoneSymbolLoc_ptr;
  if (!getADAFPreferenceKeyConnectedWiredDeviceIsHeadphoneSymbolLoc_ptr)
  {
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    v19 = __getADAFPreferenceKeyConnectedWiredDeviceIsHeadphoneSymbolLoc_block_invoke;
    v20 = &unk_1E5C5D4D8;
    int v21 = &v22;
    uint64_t v12 = (void *)AudioDataAnalysisLibrary();
    int v13 = dlsym(v12, "ADAFPreferenceKeyConnectedWiredDeviceIsHeadphone");
    *(void *)(v21[1] + 24) = v13;
    getADAFPreferenceKeyConnectedWiredDeviceIsHeadphoneSymbolLoc_ptr = *(void *)(v21[1] + 24);
    uint64_t v11 = (void *)v23[3];
  }
  _Block_object_dispose(&v22, 8);
  if (!v11)
  {
LABEL_16:
    v16 = (_Unwind_Exception *)-[PSContactsAuthorizationLevelController dealloc]();
    _Block_object_dispose(&v22, 8);
    _Unwind_Resume(v16);
  }
  id v14 = [v4 getPreferenceFor:*v11];
  uint64_t v10 = [v9 numberWithInt:v14 != 0];

LABEL_12:
  return v10;
}

- (id)supportsListeningExperienceCapbility
{
  v2 = (void *)MGCopyAnswer();
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v3 = [v2 BOOLValue] ^ 1;
  }
  else {
    int v3 = 1;
  }
  id v4 = [NSNumber numberWithInt:_os_feature_enabled_impl() & v3];

  return v4;
}

- (id)supportsPSTrackpadOnlyCapability
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"HasPointerDevice"];

  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v5 = [v4 BOOLForKey:@"HasMouse"];

  uint64_t v6 = NSNumber;
  return (id)[v6 numberWithInt:v3 & (v5 ^ 1u)];
}

- (id)supportsPSTrackpadAndMouseCapability
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  int v3 = [v2 BOOLForKey:@"HasPointerDevice"];

  id v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"HasMouse"];

  uint64_t v6 = NSNumber;
  return (id)[v6 numberWithInt:v3 & v5];
}

- (id)supportsPSHomeScreenPhoneCapability
{
  v2 = NSNumber;
  uint64_t v3 = _os_feature_enabled_impl();
  return (id)[v2 numberWithBool:v3];
}

- (id)supportsPSPencilCapability
{
  v2 = NSNumber;
  uint64_t v3 = MGGetBoolAnswer();
  return (id)[v2 numberWithBool:v3];
}

- (id)supportsPSCellularDataPlanCapability
{
  v2 = [getPSUICellularPlanManagerCacheClass() sharedInstance];
  uint64_t v3 = [v2 embeddedPlanItems];
  if ([v3 count])
  {
    id v4 = [getPSUICellularPlanManagerCacheClass() sharedInstance];
    uint64_t v5 = [v4 isAnyLocalFlowTypeSupported];
  }
  else
  {
    uint64_t v5 = 0;
  }

  uint64_t v6 = NSNumber;
  return (id)[v6 numberWithInt:v5];
}

- (id)supportsWalletApplePayCapability
{
  v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "BOOLForKey:", @"showPassbookRow"));

  return v4;
}

- (id)supportsPSExposureNotificationsCapability
{
  v2 = (void *)MGCopyAnswer();
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isEqualToString:", @"iPhone"));

  return v3;
}

- (id)supportsDisplayZoomCapability
{
  v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  id v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "sf_deviceSupportsDisplayZoom"));

  return v4;
}

- (id)supportsRaiseToWakeCapability
{
  v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x1E4F222C8] isWakeGestureAvailable];
  return (id)[v2 numberWithBool:v3];
}

- (id)supportsAutoWhiteBalanceCapability
{
  if ((supportsAutoWhiteBalanceCapability_cached & 1) == 0)
  {
    id v2 = objc_alloc_init((Class)getCBClientClass());
    uint64_t v3 = v2;
    if (v2)
    {
      id v4 = [v2 adaptationClient];
      supportsAutoWhiteBalanceCapability_supported = [v4 supported];

      supportsAutoWhiteBalanceCapability_cached = 1;
    }
  }
  uint64_t v5 = NSNumber;
  uint64_t v6 = supportsAutoWhiteBalanceCapability_supported;
  return (id)[v5 numberWithBool:v6];
}

- (id)supportsNightShiftCapability
{
  if ((supportsNightShiftCapability_cached & 1) == 0)
  {
    id v2 = objc_alloc_init((Class)getCBClientClass());
    uint64_t v3 = v2;
    if (v2)
    {
      id v4 = [v2 blueLightClient];
      supportsNightShiftCapability_supported = [v4 supported];

      supportsNightShiftCapability_cached = 1;
    }
  }
  uint64_t v5 = NSNumber;
  uint64_t v6 = supportsNightShiftCapability_supported;
  return (id)[v5 numberWithBool:v6];
}

- (id)supportsInStoreDemoModeCapability
{
  id v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x1E4F42738] isRunningInStoreDemoMode];
  return (id)[v2 numberWithBool:v3];
}

- (id)supportsInEDUModeCapability
{
  id v2 = NSNumber;
  uint64_t v3 = PSIsInEDUMode();
  return (id)[v2 numberWithBool:v3];
}

- (id)applicationDisplayIdentifiers
{
  id v2 = (void *)SBSCopyDisplayIdentifiers();
  uint64_t v3 = [v2 allObjects];

  return v3;
}

- (id)supportsPSTTYCapability
{
  id v2 = NSNumber;
  if ([getRTTTelephonyUtilitiesClass() softwareTTYIsSupported]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [getRTTTelephonyUtilitiesClass() hardwareTTYIsSupported];
  }
  return (id)[v2 numberWithInt:v3];
}

- (id)supportsPSDeveloperSettingsCapability
{
  id v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  id v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "sf_isDeveloperModeEnabled"));

  return v4;
}

- (id)supportPSRecordHDRVideoCapability
{
  id v2 = (void *)[objc_alloc((Class)getCAMCaptureCapabilitiesClass()) initWithHostProcess:0];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isHDR10BitVideoSupported"));

  return v3;
}

- (id)supportPSPhotoFormatProRAWCapability
{
  id v2 = (void *)[objc_alloc((Class)getCAMCaptureCapabilitiesClass()) initWithHostProcess:0];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "isLinearDNGSupported"));

  return v3;
}

- (id)supportPSPhotoFormatEnhancedProRAWCapability
{
  id v2 = (void *)[objc_alloc((Class)getCAMCaptureCapabilitiesClass()) initWithHostProcess:0];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v2, "enhancedRAWResolutionSupported"));

  return v3;
}

- (id)supportPSPhoneNoiseCancellationCapability
{
  id v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x1E4F4E9F0] sharedInstance];
  id v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isEarpieceActiveNoiseCancelationEnabled"));

  return v4;
}

- (id)supportsRetailKioskModeCapability
{
  id v2 = NSNumber;
  uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
  id v4 = objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "sf_inRetailKioskMode"));

  return v4;
}

- (id)supportsContinuityCamera
{
  id v2 = NSNumber;
  uint64_t BoolAnswer = AVGestaltGetBoolAnswer();
  return (id)[v2 numberWithBool:BoolAnswer];
}

- (NSMutableDictionary)overrides
{
  return self->_overrides;
}

- (void)setOverrides:(id)a3
{
}

- (NSNumber)overrideForAllBoolValues
{
  return self->_overrideForAllBoolValues;
}

- (AXCapabilityManager)axCapabilityManager
{
  return self->_axCapabilityManager;
}

- (void)setAxCapabilityManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axCapabilityManager, 0);
  objc_storeStrong((id *)&self->_overrideForAllBoolValues, 0);
  objc_storeStrong((id *)&self->_overrides, 0);
}

@end