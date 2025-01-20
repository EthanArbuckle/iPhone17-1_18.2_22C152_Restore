@interface SASProximityInformation
+ (BOOL)supportsSecureCoding;
- (BOOL)automaticTimeZoneEnabled;
- (BOOL)hasHomeButton;
- (BOOL)isBackupEnabled;
- (BOOL)isNetworkTransferrable:(__WiFiNetwork *)a3;
- (BOOL)isRestoring;
- (BOOL)locationServicesOptIn;
- (BOOL)usesSameAccountForiTunes;
- (NSArray)keyboards;
- (NSArray)networkPasswords;
- (NSArray)networks;
- (NSData)accessibilitySettings;
- (NSData)backupMetadata;
- (NSData)locationServicesData;
- (NSData)siriVoiceProfileAvailabilityMetadata;
- (NSDate)dateOfLastBackup;
- (NSDictionary)localePreferences;
- (NSNumber)allowMoreOn5G;
- (NSNumber)appAnalyticsOptIn;
- (NSNumber)connectedToWiFi;
- (NSNumber)deviceAnalyticsOptIn;
- (NSNumber)deviceTermsIdentifier;
- (NSNumber)deviceToDeviceMigrationVersion;
- (NSNumber)findMyDeviceOptIn;
- (NSNumber)hasInexpensiveCellularNetwork;
- (NSNumber)hasMegaBackup;
- (NSNumber)hasTransferrableTelephonyPlan;
- (NSNumber)preventSoftwareUpdateDeviceMigration;
- (NSNumber)siriOptIn;
- (NSNumber)storageAvailable;
- (NSNumber)storageCapacity;
- (NSNumber)supportsCellularBackup;
- (NSNumber)supportsDeviceToDeviceMigration;
- (NSSet)nearbyNetworks;
- (NSString)appleID;
- (NSString)backupUUID;
- (NSString)deviceClass;
- (NSString)deviceModel;
- (NSString)deviceName;
- (NSString)firstName;
- (NSString)productVersion;
- (NSString)timeZone;
- (OS_dispatch_semaphore)nearbyNetworksSemaphore;
- (SASExpressSettings)expressSettings;
- (SASProximityInformation)initWithCoder:(id)a3;
- (id)_getFindMyDeviceOptIn;
- (id)numberFromMCUserBoolSetting:(id)a3;
- (uint64_t)loadInformation;
- (void)_loadTelephonyInformation;
- (void)encodeWithCoder:(id)a3;
- (void)loadInformation;
- (void)setAccessibilitySettings:(id)a3;
- (void)setAllowMoreOn5G:(id)a3;
- (void)setAppAnalyticsOptIn:(id)a3;
- (void)setAppleID:(id)a3;
- (void)setAutomaticTimeZoneEnabled:(BOOL)a3;
- (void)setBackupEnabled:(BOOL)a3;
- (void)setBackupMetadata:(id)a3;
- (void)setBackupUUID:(id)a3;
- (void)setConnectedToWiFi:(id)a3;
- (void)setDateOfLastBackup:(id)a3;
- (void)setDeviceAnalyticsOptIn:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setDeviceTermsIdentifier:(id)a3;
- (void)setDeviceToDeviceMigrationVersion:(id)a3;
- (void)setExpressSettings:(id)a3;
- (void)setFindMyDeviceOptIn:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setHasHomeButton:(BOOL)a3;
- (void)setHasInexpensiveCellularNetwork:(id)a3;
- (void)setHasMegaBackup:(id)a3;
- (void)setHasTransferrableTelephonyPlan:(id)a3;
- (void)setKeyboards:(id)a3;
- (void)setLocalePreferences:(id)a3;
- (void)setLocationServicesData:(id)a3;
- (void)setLocationServicesOptIn:(BOOL)a3;
- (void)setNearbyNetworks:(id)a3;
- (void)setNearbyNetworksSemaphore:(id)a3;
- (void)setNetworkPasswords:(id)a3;
- (void)setNetworks:(id)a3;
- (void)setPreventSoftwareUpdateDeviceMigration:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)setRestoring:(BOOL)a3;
- (void)setSiriOptIn:(id)a3;
- (void)setSiriVoiceProfileAvailabilityMetadata:(id)a3;
- (void)setStorageAvailable:(id)a3;
- (void)setStorageCapacity:(id)a3;
- (void)setSupportsCellularBackup:(id)a3;
- (void)setSupportsDeviceToDeviceMigration:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setUsesSameAccountForiTunes:(BOOL)a3;
- (void)wirelessScanComplete:(id)a3 error:(int)a4;
@end

@implementation SASProximityInformation

- (void)encodeWithCoder:(id)a3
{
  id v38 = a3;
  v4 = [(SASProximityInformation *)self keyboards];
  [v38 encodeObject:v4 forKey:@"keyboards"];

  v5 = [(SASProximityInformation *)self appleID];
  [v38 encodeObject:v5 forKey:@"appleID"];

  objc_msgSend(v38, "encodeBool:forKey:", -[SASProximityInformation usesSameAccountForiTunes](self, "usesSameAccountForiTunes"), @"usesSameAccountForiTunes");
  v6 = [(SASProximityInformation *)self networks];
  [v38 encodeObject:v6 forKey:@"networks"];

  v7 = [(SASProximityInformation *)self networkPasswords];
  [v38 encodeObject:v7 forKey:@"networkPasswords"];

  v8 = [(SASProximityInformation *)self connectedToWiFi];
  [v38 encodeObject:v8 forKey:@"connectedToWiFi"];

  v9 = [(SASProximityInformation *)self localePreferences];
  [v38 encodeObject:v9 forKey:@"localePreferences"];

  objc_msgSend(v38, "encodeBool:forKey:", -[SASProximityInformation automaticTimeZoneEnabled](self, "automaticTimeZoneEnabled"), @"automaticTimeZoneEnabled");
  v10 = [(SASProximityInformation *)self timeZone];
  [v38 encodeObject:v10 forKey:@"timeZone"];

  v11 = [(SASProximityInformation *)self accessibilitySettings];
  [v38 encodeObject:v11 forKey:@"accessibilitySettings"];

  v12 = [(SASProximityInformation *)self firstName];
  [v38 encodeObject:v12 forKey:@"firstName"];

  v13 = [(SASProximityInformation *)self deviceModel];
  [v38 encodeObject:v13 forKey:@"deviceModel"];

  v14 = [(SASProximityInformation *)self deviceClass];
  [v38 encodeObject:v14 forKey:@"deviceClass"];

  objc_msgSend(v38, "encodeBool:forKey:", -[SASProximityInformation isRestoring](self, "isRestoring"), @"restoring");
  v15 = [(SASProximityInformation *)self deviceName];
  [v38 encodeObject:v15 forKey:@"deviceName"];

  v16 = [(SASProximityInformation *)self backupUUID];
  [v38 encodeObject:v16 forKey:@"backupUUID"];

  objc_msgSend(v38, "encodeBool:forKey:", -[SASProximityInformation isBackupEnabled](self, "isBackupEnabled"), @"backupEnabled");
  v17 = [(SASProximityInformation *)self dateOfLastBackup];
  [v38 encodeObject:v17 forKey:@"dateOfLastBackup"];

  v18 = [(SASProximityInformation *)self supportsCellularBackup];
  [v38 encodeObject:v18 forKey:@"supportsCellularBackup"];

  v19 = [(SASProximityInformation *)self hasMegaBackup];
  [v38 encodeObject:v19 forKey:@"hasMegaBackup"];

  v20 = [(SASProximityInformation *)self expressSettings];
  [v38 encodeObject:v20 forKey:@"expressSettingsKey"];

  v21 = [(SASProximityInformation *)self backupMetadata];
  [v38 encodeObject:v21 forKey:@"backupMetadataKey"];

  objc_msgSend(v38, "encodeBool:forKey:", -[SASProximityInformation locationServicesOptIn](self, "locationServicesOptIn"), @"locationServicesOptIn");
  v22 = [(SASProximityInformation *)self locationServicesData];
  [v38 encodeObject:v22 forKey:@"locationServicesData"];

  v23 = [(SASProximityInformation *)self findMyDeviceOptIn];
  [v38 encodeObject:v23 forKey:@"findMyDeviceOptIn"];

  v24 = [(SASProximityInformation *)self deviceAnalyticsOptIn];
  [v38 encodeObject:v24 forKey:@"deviceAnalyticsOptIn"];

  v25 = [(SASProximityInformation *)self appAnalyticsOptIn];
  [v38 encodeObject:v25 forKey:@"appAnalyticsOptIn"];

  v26 = [(SASProximityInformation *)self siriOptIn];
  [v38 encodeObject:v26 forKey:@"siriOptIn"];

  v27 = [(SASProximityInformation *)self siriVoiceProfileAvailabilityMetadata];
  [v38 encodeObject:v27 forKey:@"siriVoiceProfileAvailabilityMetadata"];

  v28 = [(SASProximityInformation *)self deviceTermsIdentifier];
  [v38 encodeObject:v28 forKey:@"deviceTermsIdentifier"];

  v29 = [(SASProximityInformation *)self productVersion];
  [v38 encodeObject:v29 forKey:@"productVersion"];

  v30 = [(SASProximityInformation *)self supportsDeviceToDeviceMigration];
  [v38 encodeObject:v30 forKey:@"supportsDeviceToDeviceMigration"];

  v31 = [(SASProximityInformation *)self deviceToDeviceMigrationVersion];
  [v38 encodeObject:v31 forKey:@"deviceToDeviceMigrationVersion"];

  v32 = [(SASProximityInformation *)self storageAvailable];
  [v38 encodeObject:v32 forKey:@"storageAvailable"];

  v33 = [(SASProximityInformation *)self storageCapacity];
  [v38 encodeObject:v33 forKey:@"storageCapacity"];

  v34 = [(SASProximityInformation *)self preventSoftwareUpdateDeviceMigration];
  [v38 encodeObject:v34 forKey:@"preventSoftwareUpdateDeviceMigration"];

  v35 = [(SASProximityInformation *)self hasTransferrableTelephonyPlan];
  [v38 encodeObject:v35 forKey:@"hasTransferrableTelephonyPlan"];

  v36 = [(SASProximityInformation *)self hasInexpensiveCellularNetwork];
  [v38 encodeObject:v36 forKey:@"hasInexpensiveCellularNetwork"];

  v37 = [(SASProximityInformation *)self allowMoreOn5G];
  [v38 encodeObject:v37 forKey:@"allowMoreOn5G"];

  objc_msgSend(v38, "encodeBool:forKey:", -[SASProximityInformation hasHomeButton](self, "hasHomeButton"), @"hasHomeButton");
}

- (SASProximityInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)SASProximityInformation;
  v5 = [(SASProximityInformation *)&v62 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"keyboards"];
    [(SASProximityInformation *)v5 setKeyboards:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleID"];
    [(SASProximityInformation *)v5 setAppleID:v10];

    -[SASProximityInformation setUsesSameAccountForiTunes:](v5, "setUsesSameAccountForiTunes:", [v4 decodeBoolForKey:@"usesSameAccountForiTunes"]);
    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v11, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
    v18 = [v4 decodeObjectOfClasses:v17 forKey:@"networks"];
    [(SASProximityInformation *)v5 setNetworks:v18];

    v19 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v23 = objc_msgSend(v19, "setWithObjects:", v20, v21, v22, objc_opt_class(), 0);
    v24 = [v4 decodeObjectOfClasses:v23 forKey:@"networkPasswords"];
    [(SASProximityInformation *)v5 setNetworkPasswords:v24];

    v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"connectedToWiFi"];
    [(SASProximityInformation *)v5 setConnectedToWiFi:v25];

    v26 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v27 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    v31 = objc_msgSend(v26, "setWithObjects:", v27, v28, v29, v30, objc_opt_class(), 0);
    v32 = [v4 decodeObjectOfClasses:v31 forKey:@"localePreferences"];
    [(SASProximityInformation *)v5 setLocalePreferences:v32];

    -[SASProximityInformation setAutomaticTimeZoneEnabled:](v5, "setAutomaticTimeZoneEnabled:", [v4 decodeBoolForKey:@"automaticTimeZoneEnabled"]);
    v33 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timeZone"];
    [(SASProximityInformation *)v5 setTimeZone:v33];

    v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"accessibilitySettings"];
    [(SASProximityInformation *)v5 setAccessibilitySettings:v34];

    v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    [(SASProximityInformation *)v5 setFirstName:v35];

    v36 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceModel"];
    [(SASProximityInformation *)v5 setDeviceModel:v36];

    v37 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceClass"];
    [(SASProximityInformation *)v5 setDeviceClass:v37];

    -[SASProximityInformation setRestoring:](v5, "setRestoring:", [v4 decodeBoolForKey:@"restoring"]);
    id v38 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceName"];
    [(SASProximityInformation *)v5 setDeviceName:v38];

    v39 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backupUUID"];
    [(SASProximityInformation *)v5 setBackupUUID:v39];

    -[SASProximityInformation setBackupEnabled:](v5, "setBackupEnabled:", [v4 decodeBoolForKey:@"backupEnabled"]);
    v40 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateOfLastBackup"];
    [(SASProximityInformation *)v5 setDateOfLastBackup:v40];

    v41 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsCellularBackup"];
    [(SASProximityInformation *)v5 setSupportsCellularBackup:v41];

    v42 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasMegaBackup"];
    [(SASProximityInformation *)v5 setHasMegaBackup:v42];

    v43 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expressSettingsKey"];
    [(SASProximityInformation *)v5 setExpressSettings:v43];

    v44 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"backupMetadataKey"];
    [(SASProximityInformation *)v5 setBackupMetadata:v44];

    -[SASProximityInformation setLocationServicesOptIn:](v5, "setLocationServicesOptIn:", [v4 decodeBoolForKey:@"locationServicesOptIn"]);
    v45 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationServicesData"];
    [(SASProximityInformation *)v5 setLocationServicesData:v45];

    v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"findMyDeviceOptIn"];
    [(SASProximityInformation *)v5 setFindMyDeviceOptIn:v46];

    v47 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceAnalyticsOptIn"];
    [(SASProximityInformation *)v5 setDeviceAnalyticsOptIn:v47];

    v48 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appAnalyticsOptIn"];
    [(SASProximityInformation *)v5 setAppAnalyticsOptIn:v48];

    v49 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"siriOptIn"];
    [(SASProximityInformation *)v5 setSiriOptIn:v49];

    v50 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"siriVoiceProfileAvailabilityMetadata"];
    [(SASProximityInformation *)v5 setSiriVoiceProfileAvailabilityMetadata:v50];

    v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceTermsIdentifier"];
    [(SASProximityInformation *)v5 setDeviceTermsIdentifier:v51];

    v52 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productVersion"];
    [(SASProximityInformation *)v5 setProductVersion:v52];

    v53 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportsDeviceToDeviceMigration"];
    [(SASProximityInformation *)v5 setSupportsDeviceToDeviceMigration:v53];

    v54 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceToDeviceMigrationVersion"];
    [(SASProximityInformation *)v5 setDeviceToDeviceMigrationVersion:v54];

    v55 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storageAvailable"];
    [(SASProximityInformation *)v5 setStorageAvailable:v55];

    v56 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"storageCapacity"];
    [(SASProximityInformation *)v5 setStorageCapacity:v56];

    v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"preventSoftwareUpdateDeviceMigration"];
    [(SASProximityInformation *)v5 setPreventSoftwareUpdateDeviceMigration:v57];

    v58 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasTransferrableTelephonyPlan"];
    [(SASProximityInformation *)v5 setHasTransferrableTelephonyPlan:v58];

    v59 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasInexpensiveCellularNetwork"];
    [(SASProximityInformation *)v5 setHasInexpensiveCellularNetwork:v59];

    v60 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"allowMoreOn5G"];
    [(SASProximityInformation *)v5 setAllowMoreOn5G:v60];

    -[SASProximityInformation setHasHomeButton:](v5, "setHasHomeButton:", [v4 decodeBoolForKey:@"hasHomeButton"]);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)_getFindMyDeviceOptIn
{
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__1;
  uint64_t v21 = __Block_byref_object_dispose__1;
  id v22 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v3 = (void *)getFMDFMIPManagerClass_softClass_0;
  uint64_t v31 = getFMDFMIPManagerClass_softClass_0;
  if (!getFMDFMIPManagerClass_softClass_0)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __getFMDFMIPManagerClass_block_invoke_0;
    v26 = &unk_1E6CAB5F0;
    uint64_t v27 = &v28;
    __getFMDFMIPManagerClass_block_invoke_0((uint64_t)buf);
    v3 = (void *)v29[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v28, 8);
  v5 = [v4 sharedInstance];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __48__SASProximityInformation__getFindMyDeviceOptIn__block_invoke;
  uint64_t v14 = &unk_1E6CAB5A0;
  uint64_t v16 = &v17;
  v6 = v2;
  uint64_t v15 = v6;
  [v5 fmipStateWithCompletion:&v11];

  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    v8 = +[SASLogging facility];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DCC71000, v8, OS_LOG_TYPE_DEFAULT, "Timed out fetching Find My Device state", buf, 2u);
    }
  }
  id v9 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __48__SASProximityInformation__getFindMyDeviceOptIn__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v6 = +[SASLogging facility];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1DCC71000, v6, OS_LOG_TYPE_DEFAULT, "Could not determine Find My Device if is enabled: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = [NSNumber numberWithInt:a2 == 1];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)loadInformation
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DCC71000, v0, v1, "Failed to check if backup is supported on cellular: %@", v2, v3, v4, v5, v6);
}

void __42__SASProximityInformation_loadInformation__block_invoke(uint64_t a1)
{
  id v2 = +[SASExpressCloudSettings createExpressSettingsWithQueue:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setExpressSettings:v2];
}

- (void)_loadTelephonyInformation
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DCC71000, v0, v1, "Failed to get telephony plan transfer: %@", v2, v3, v4, v5, v6);
}

- (BOOL)isNetworkTransferrable:(__WiFiNetwork *)a3
{
  if (!a3) {
    return 0;
  }
  if (WiFiNetworkIsEAP()
    || WiFiNetworkIsProfileBased()
    || WiFiNetworkIsExpirable()
    || WiFiNetworkIsCaptive())
  {
    return 0;
  }
  return WiFiNetworkGetType() != 1;
}

- (void)wirelessScanComplete:(id)a3 error:(int)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SASProximityInformation *)self nearbyNetworks];

  if (!v7)
  {
    if (a4)
    {
      uint64_t v8 = +[SASLogging facility];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 67109120;
        v11[1] = a4;
        _os_log_impl(&dword_1DCC71000, v8, OS_LOG_TYPE_DEFAULT, "Failed to perform Wi-Fi scan to get nearby networks: %d", (uint8_t *)v11, 8u);
      }
    }
    id v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
    [(SASProximityInformation *)self setNearbyNetworks:v9];

    int v10 = [(SASProximityInformation *)self nearbyNetworksSemaphore];
    dispatch_semaphore_signal(v10);
  }
}

- (id)numberFromMCUserBoolSetting:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2050000000;
  uint64_t v4 = (void *)getMCProfileConnectionClass_softClass;
  uint64_t v15 = getMCProfileConnectionClass_softClass;
  if (!getMCProfileConnectionClass_softClass)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    _DWORD v11[2] = __getMCProfileConnectionClass_block_invoke;
    v11[3] = &unk_1E6CAB5F0;
    v11[4] = &v12;
    __getMCProfileConnectionClass_block_invoke((uint64_t)v11);
    uint64_t v4 = (void *)v13[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v12, 8);
  id v6 = [v5 sharedConnection];
  int v7 = [v6 userBoolValueForSetting:v3];

  uint64_t v8 = (void *)MEMORY[0x1E4F1CC28];
  if (v7 != 2) {
    uint64_t v8 = 0;
  }
  if (v7 == 1) {
    id v9 = (void *)MEMORY[0x1E4F1CC38];
  }
  else {
    id v9 = v8;
  }

  return v9;
}

- (NSArray)keyboards
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeyboards:(id)a3
{
}

- (NSString)appleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppleID:(id)a3
{
}

- (BOOL)usesSameAccountForiTunes
{
  return self->_usesSameAccountForiTunes;
}

- (void)setUsesSameAccountForiTunes:(BOOL)a3
{
  self->_usesSameAccountForiTunes = a3;
}

- (NSArray)networks
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNetworks:(id)a3
{
}

- (NSArray)networkPasswords
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setNetworkPasswords:(id)a3
{
}

- (NSNumber)connectedToWiFi
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConnectedToWiFi:(id)a3
{
}

- (NSDictionary)localePreferences
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLocalePreferences:(id)a3
{
}

- (BOOL)automaticTimeZoneEnabled
{
  return self->_automaticTimeZoneEnabled;
}

- (void)setAutomaticTimeZoneEnabled:(BOOL)a3
{
  self->_automaticTimeZoneEnabled = a3;
}

- (NSString)timeZone
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTimeZone:(id)a3
{
}

- (NSData)accessibilitySettings
{
  return (NSData *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAccessibilitySettings:(id)a3
{
}

- (NSString)firstName
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFirstName:(id)a3
{
}

- (NSString)deviceModel
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)deviceClass
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeviceClass:(id)a3
{
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (void)setHasHomeButton:(BOOL)a3
{
  self->_hasHomeButton = a3;
}

- (BOOL)isRestoring
{
  return self->_restoring;
}

- (void)setRestoring:(BOOL)a3
{
  self->_restoring = a3;
}

- (NSString)deviceName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)backupUUID
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setBackupUUID:(id)a3
{
}

- (BOOL)isBackupEnabled
{
  return self->_backupEnabled;
}

- (void)setBackupEnabled:(BOOL)a3
{
  self->_backupEnabled = a3;
}

- (NSDate)dateOfLastBackup
{
  return (NSDate *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDateOfLastBackup:(id)a3
{
}

- (NSNumber)supportsCellularBackup
{
  return self->_supportsCellularBackup;
}

- (void)setSupportsCellularBackup:(id)a3
{
}

- (NSNumber)hasMegaBackup
{
  return self->_hasMegaBackup;
}

- (void)setHasMegaBackup:(id)a3
{
}

- (SASExpressSettings)expressSettings
{
  return (SASExpressSettings *)objc_getProperty(self, a2, 144, 1);
}

- (void)setExpressSettings:(id)a3
{
}

- (NSData)backupMetadata
{
  return (NSData *)objc_getProperty(self, a2, 152, 1);
}

- (void)setBackupMetadata:(id)a3
{
}

- (BOOL)locationServicesOptIn
{
  return self->_locationServicesOptIn;
}

- (void)setLocationServicesOptIn:(BOOL)a3
{
  self->_locationServicesOptIn = a3;
}

- (NSData)locationServicesData
{
  return (NSData *)objc_getProperty(self, a2, 160, 1);
}

- (void)setLocationServicesData:(id)a3
{
}

- (NSNumber)findMyDeviceOptIn
{
  return (NSNumber *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFindMyDeviceOptIn:(id)a3
{
}

- (NSNumber)deviceAnalyticsOptIn
{
  return (NSNumber *)objc_getProperty(self, a2, 176, 1);
}

- (void)setDeviceAnalyticsOptIn:(id)a3
{
}

- (NSNumber)appAnalyticsOptIn
{
  return (NSNumber *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAppAnalyticsOptIn:(id)a3
{
}

- (NSNumber)siriOptIn
{
  return (NSNumber *)objc_getProperty(self, a2, 192, 1);
}

- (void)setSiriOptIn:(id)a3
{
}

- (NSData)siriVoiceProfileAvailabilityMetadata
{
  return (NSData *)objc_getProperty(self, a2, 200, 1);
}

- (void)setSiriVoiceProfileAvailabilityMetadata:(id)a3
{
}

- (NSNumber)deviceTermsIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 208, 1);
}

- (void)setDeviceTermsIdentifier:(id)a3
{
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setProductVersion:(id)a3
{
}

- (NSNumber)supportsDeviceToDeviceMigration
{
  return (NSNumber *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSupportsDeviceToDeviceMigration:(id)a3
{
}

- (NSNumber)deviceToDeviceMigrationVersion
{
  return (NSNumber *)objc_getProperty(self, a2, 232, 1);
}

- (void)setDeviceToDeviceMigrationVersion:(id)a3
{
}

- (NSNumber)storageAvailable
{
  return (NSNumber *)objc_getProperty(self, a2, 240, 1);
}

- (void)setStorageAvailable:(id)a3
{
}

- (NSNumber)storageCapacity
{
  return (NSNumber *)objc_getProperty(self, a2, 248, 1);
}

- (void)setStorageCapacity:(id)a3
{
}

- (NSNumber)preventSoftwareUpdateDeviceMigration
{
  return (NSNumber *)objc_getProperty(self, a2, 256, 1);
}

- (void)setPreventSoftwareUpdateDeviceMigration:(id)a3
{
}

- (NSNumber)hasTransferrableTelephonyPlan
{
  return self->_hasTransferrableTelephonyPlan;
}

- (void)setHasTransferrableTelephonyPlan:(id)a3
{
  self->_hasTransferrableTelephonyPlan = (NSNumber *)a3;
}

- (NSNumber)hasInexpensiveCellularNetwork
{
  return (NSNumber *)objc_getProperty(self, a2, 272, 1);
}

- (void)setHasInexpensiveCellularNetwork:(id)a3
{
}

- (NSNumber)allowMoreOn5G
{
  return self->_allowMoreOn5G;
}

- (void)setAllowMoreOn5G:(id)a3
{
}

- (NSSet)nearbyNetworks
{
  return (NSSet *)objc_getProperty(self, a2, 288, 1);
}

- (void)setNearbyNetworks:(id)a3
{
}

- (OS_dispatch_semaphore)nearbyNetworksSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 296, 1);
}

- (void)setNearbyNetworksSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyNetworksSemaphore, 0);
  objc_storeStrong((id *)&self->_nearbyNetworks, 0);
  objc_storeStrong((id *)&self->_allowMoreOn5G, 0);
  objc_storeStrong((id *)&self->_hasInexpensiveCellularNetwork, 0);
  objc_storeStrong((id *)&self->_preventSoftwareUpdateDeviceMigration, 0);
  objc_storeStrong((id *)&self->_storageCapacity, 0);
  objc_storeStrong((id *)&self->_storageAvailable, 0);
  objc_storeStrong((id *)&self->_deviceToDeviceMigrationVersion, 0);
  objc_storeStrong((id *)&self->_supportsDeviceToDeviceMigration, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_deviceTermsIdentifier, 0);
  objc_storeStrong((id *)&self->_siriVoiceProfileAvailabilityMetadata, 0);
  objc_storeStrong((id *)&self->_siriOptIn, 0);
  objc_storeStrong((id *)&self->_appAnalyticsOptIn, 0);
  objc_storeStrong((id *)&self->_deviceAnalyticsOptIn, 0);
  objc_storeStrong((id *)&self->_findMyDeviceOptIn, 0);
  objc_storeStrong((id *)&self->_locationServicesData, 0);
  objc_storeStrong((id *)&self->_backupMetadata, 0);
  objc_storeStrong((id *)&self->_expressSettings, 0);
  objc_storeStrong((id *)&self->_hasMegaBackup, 0);
  objc_storeStrong((id *)&self->_supportsCellularBackup, 0);
  objc_storeStrong((id *)&self->_dateOfLastBackup, 0);
  objc_storeStrong((id *)&self->_backupUUID, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_accessibilitySettings, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_localePreferences, 0);
  objc_storeStrong((id *)&self->_connectedToWiFi, 0);
  objc_storeStrong((id *)&self->_networkPasswords, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_keyboards, 0);
}

- (uint64_t)loadInformation
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[SASProximityInformation loadInformation].cold.4(v0);
}

@end