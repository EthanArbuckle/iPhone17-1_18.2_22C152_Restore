@interface CRVehicleStore
+ (BOOL)_addKeychainPairingForVehicle:(id)a3;
+ (BOOL)_addPreferencesPairingForVehicle:(id)a3;
+ (BOOL)_removeKeychainPairingForVehicle:(id)a3;
+ (BOOL)_removePreferencesPairingForVehicle:(id)a3;
+ (BOOL)_removePreferencesPairingForVehicleIdentifier:(id)a3;
+ (BOOL)removePayloadForVehicleWithIdentifier:(id)a3;
+ (BOOL)setPayload:(id)a3 forVehicleWithIdentifier:(id)a4;
+ (id)_allKeychainAttributesForVehicle:(id)a3;
+ (id)_allPreferencesPairings;
+ (id)_allUnpairedVehicleStorage;
+ (id)_creationKeychainAttributesForVehicle:(id)a3;
+ (id)_identifyingKeychainAttributesForVehicle:(id)a3;
+ (id)_itemClassKeychainAttributes;
+ (id)_keychainAttributesMatchingQuery:(id)a3;
+ (id)_keychainItemAttributesForAllVehicles;
+ (id)_preferencesAttributesForVehicle:(id)a3;
+ (id)_updateKeychainAttributesForVehicle:(id)a3;
+ (id)payloadForVehicleWithIdentifier:(id)a3;
+ (void)_addKeychainAttributesForVehicle:(id)a3 toDictionary:(id)a4;
+ (void)_applyPreferencesAttributes:(id)a3 toVehicle:(id)a4;
+ (void)_cleanupPreferencesForIncompleteVehicleIdentifier:(id)a3 name:(id)a4;
+ (void)postPairingsDidChangeNotification;
- (BOOL)removeVehicle:(id)a3;
- (CARObserverHashTable)observers;
- (CRVehicleStore)init;
- (NSSet)cachedVehicles;
- (id)_matchingKeychainItemForIdentifier:(id)a3 inKeychainItems:(id)a4;
- (id)allStoredVehicles;
- (id)saveVehicle:(id)a3;
- (id)saveVehicle:(id)a3 withMergePolicy:(id)a4;
- (id)vehicleForBluetoothAddress:(id)a3;
- (id)vehicleForCertificateSerial:(id)a3;
- (id)vehicleForIdentifier:(id)a3;
- (void)_invalidateCachedVehicles;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)handleAvailabilityDidChange:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setCachedVehicles:(id)a3;
@end

@implementation CRVehicleStore

+ (id)_itemClassKeychainAttributes
{
  v2 = +[NSMutableDictionary dictionary];
  [v2 setObject:@"com.apple.carplay.pairings" forKey:kSecAttrAccessGroup];
  [v2 setObject:@"carplay-pairing" forKey:kSecAttrService];
  [v2 setObject:kSecClassGenericPassword forKey:kSecClass];

  return v2;
}

+ (id)_identifyingKeychainAttributesForVehicle:(id)a3
{
  v4 = [a3 identifier];
  v5 = [v4 UUIDString];

  if (v5)
  {
    v6 = [a1 _itemClassKeychainAttributes];
    [v6 setObject:v5 forKey:kSecAttrAccount];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (void)_addKeychainAttributesForVehicle:(id)a3 toDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 vehicleName];

  if (v7)
  {
    v8 = [v5 vehicleName];
    [v6 setObject:v8 forKey:kSecAttrLabel];
  }
  v9 = [v5 certificateSerialNumber];

  if (v9)
  {
    v10 = [v5 certificateSerialNumber];
    [v6 setObject:v10 forKey:kSecValueData];
  }
  unsigned int v13 = bswap32([v5 pairingStatus]);
  v11 = +[NSMutableData dataWithBytes:&v13 length:4];
  unsigned int v12 = bswap32([v5 enhancedIntegrationStatus]);
  [v11 appendBytes:&v12 length:4];
  [v6 setObject:v11 forKey:kSecAttrGeneric];
}

+ (id)_allKeychainAttributesForVehicle:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _identifyingKeychainAttributesForVehicle:v4];
  [a1 _addKeychainAttributesForVehicle:v4 toDictionary:v5];

  return v5;
}

+ (id)_creationKeychainAttributesForVehicle:(id)a3
{
  v3 = [a1 _allKeychainAttributesForVehicle:a3];
  [v3 setObject:kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly forKey:kSecAttrAccessible];

  return v3;
}

+ (id)_updateKeychainAttributesForVehicle:(id)a3
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  [a1 _addKeychainAttributesForVehicle:v4 toDictionary:v5];

  return v5;
}

+ (id)_keychainAttributesMatchingQuery:(id)a3
{
  CFTypeRef result = 0;
  id v3 = [a3 mutableCopy];
  [v3 setObject:kCFBooleanTrue forKey:kSecReturnAttributes];
  [v3 setObject:kCFBooleanTrue forKey:kSecReturnData];
  if (v3)
  {
    OSStatus v4 = SecItemCopyMatching((CFDictionaryRef)v3, &result);
    id v5 = (void *)result;
    id v6 = CarGeneralLogging();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
    if (v4 || !v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412546;
        id v11 = v3;
        __int16 v12 = 1024;
        OSStatus v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "No vehicle found for keychain query: %@ error: %i", buf, 0x12u);
      }
      id v5 = 0;
    }
    else if (v7)
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Found a queried keychain item: %@", buf, 0xCu);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)_keychainItemAttributesForAllVehicles
{
  CFTypeRef result = 0;
  v2 = [a1 _itemClassKeychainAttributes];
  [v2 setObject:kSecMatchLimitAll forKey:kSecMatchLimit];
  [v2 setObject:kCFBooleanTrue forKey:kSecReturnAttributes];
  [v2 setObject:kCFBooleanTrue forKey:kSecReturnData];
  if (v2)
  {
    OSStatus v3 = SecItemCopyMatching((CFDictionaryRef)v2, &result);
    OSStatus v4 = (void *)result;
    id v5 = CarGeneralLogging();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3 || !v4)
    {
      if (v6)
      {
        *(_DWORD *)buf = 138412546;
        v10 = v2;
        __int16 v11 = 1024;
        OSStatus v12 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "No vehicles found for keychain query: %@ error: %i", buf, 0x12u);
      }
      OSStatus v4 = 0;
    }
    else if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Found queried keychain items: %@", buf, 0xCu);
    }
  }
  else
  {
    OSStatus v4 = 0;
  }

  return v4;
}

+ (BOOL)_addKeychainPairingForVehicle:(id)a3
{
  id v3 = a3;
  CFDictionaryRef v4 = [(id)objc_opt_class() _identifyingKeychainAttributesForVehicle:v3];
  if (v4)
  {
    id v5 = [(id)objc_opt_class() _keychainAttributesMatchingQuery:v4];

    BOOL v6 = objc_opt_class();
    if (v5)
    {
      CFDictionaryRef v7 = [v6 _updateKeychainAttributesForVehicle:v3];
      OSStatus v8 = SecItemUpdate(v4, v7);
      v9 = CarGeneralLogging();
      v10 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10006F378();
        }
LABEL_17:
        BOOL v11 = 0;
        goto LABEL_18;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        CFDictionaryRef v16 = v7;
        OSStatus v13 = "Updated a keychain item: %@";
        goto LABEL_13;
      }
    }
    else
    {
      CFDictionaryRef v12 = [v6 _creationKeychainAttributesForVehicle:v3];
      CFDictionaryRef v7 = v12;
      if (!v12 || SecItemAdd(v12, 0))
      {
        v10 = CarGeneralLogging();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_10006F310();
        }
        goto LABEL_17;
      }
      v10 = CarGeneralLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 138412290;
        CFDictionaryRef v16 = v7;
        OSStatus v13 = "Created a keychain item: %@";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);
      }
    }
    BOOL v11 = 1;
LABEL_18:

    goto LABEL_19;
  }
  BOOL v11 = 0;
LABEL_19:

  return v11;
}

+ (BOOL)_removeKeychainPairingForVehicle:(id)a3
{
  id v3 = a3;
  CFDictionaryRef v4 = [(id)objc_opt_class() _identifyingKeychainAttributesForVehicle:v3];

  if (v4)
  {
    OSStatus v5 = SecItemDelete(v4);
    if (!v5)
    {
      BOOL v6 = CarGeneralLogging();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412290;
        CFDictionaryRef v10 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deleted keychain items matching: %@", (uint8_t *)&v9, 0xCu);
      }
      BOOL v7 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    OSStatus v5 = 0;
  }
  BOOL v6 = CarGeneralLogging();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    CFDictionaryRef v10 = v4;
    __int16 v11 = 1024;
    OSStatus v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to delete keychain items matching: %@ error: %i", (uint8_t *)&v9, 0x12u);
  }
  BOOL v7 = 0;
LABEL_10:

  return v7;
}

+ (id)_allUnpairedVehicleStorage
{
  v2 = (void *)CFPreferencesCopyAppValue(@"unpairedVehicleStorage", CRPreferencesNotMigratedDomain);
  if (!v2)
  {
    v2 = +[NSDictionary dictionary];
  }

  return v2;
}

+ (id)payloadForVehicleWithIdentifier:(id)a3
{
  id v4 = a3;
  OSStatus v5 = [a1 _allUnpairedVehicleStorage];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

+ (BOOL)setPayload:(id)a3 forVehicleWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  OSStatus v8 = [a1 _allUnpairedVehicleStorage];
  int v9 = +[NSMutableDictionary dictionaryWithDictionary:v8];

  CFDictionaryRef v10 = CarGeneralLogging();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v11)
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting payload %@ for identifier %@", (uint8_t *)&v15, 0x16u);
    }

    [v9 setObject:v6 forKeyedSubscript:v7];
  }
  else
  {
    if (v11)
    {
      int v15 = 138412290;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Removing payload for identifier %@", (uint8_t *)&v15, 0xCu);
    }

    [v9 removeObjectForKey:v7];
  }
  CFPreferencesSetAppValue(@"unpairedVehicleStorage", v9, CRPreferencesNotMigratedDomain);
  int v12 = CFPreferencesAppSynchronize(CRPreferencesNotMigratedDomain);
  if (!v12)
  {
    OSStatus v13 = CarGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10006F3E0(v13);
    }
  }
  return v12 != 0;
}

+ (BOOL)removePayloadForVehicleWithIdentifier:(id)a3
{
  return [a1 setPayload:0 forVehicleWithIdentifier:a3];
}

+ (id)_preferencesAttributesForVehicle:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionary];
  OSStatus v5 = [v3 vehicleName];

  if (v5)
  {
    id v6 = [v3 vehicleName];
    [v4 setObject:v6 forKey:@"name"];
  }
  id v7 = [v3 bluetoothAddress];

  if (v7)
  {
    OSStatus v8 = [v3 bluetoothAddress];
    [v4 setObject:v8 forKey:@"bluetoothAddress"];
  }
  int v9 = [v3 carplayWiFiUUID];

  if (v9)
  {
    CFDictionaryRef v10 = [v3 carplayWiFiUUID];
    [v4 setObject:v10 forKey:@"carplayWiFiUUID"];
  }
  BOOL v11 = [v3 accessoryProtocols];

  if (v11)
  {
    int v12 = [v3 accessoryProtocols];
    OSStatus v13 = [v12 allObjects];
    [v4 setObject:v13 forKey:@"carPlayProtocols"];
  }
  if ([v3 supportsEnhancedIntegration]) {
    [v4 setObject:&__kCFBooleanTrue forKey:@"supportsEnhancedIntegration"];
  }
  v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 supportsMixableAudio]);
  [v4 setObject:v14 forKey:@"supportsMixableAudio"];

  int v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 isSiriBargeInDisabled]);
  [v4 setObject:v15 forKey:@"isSiriBargeInDisabled"];

  id v16 = [v3 supportsStartSessionRequest];

  if (v16)
  {
    __int16 v17 = [v3 supportsStartSessionRequest];
    [v4 setObject:v17 forKey:@"supportsStartSessionRequest"];
  }
  id v18 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 supportsUSBCarPlay]);
  [v4 setObject:v18 forKey:@"supportsUSBCarPlay"];

  v19 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 supportsWirelessCarPlay]);
  [v4 setObject:v19 forKey:@"supportsWirelessCarPlay"];

  if ([v3 albumArtUserPreference])
  {
    v20 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 albumArtUserPreference]);
    [v4 setObject:v20 forKey:@"albumArtUserPreference"];
  }
  v21 = [v3 wallpaperIdentifier];

  if (v21)
  {
    v22 = [v3 wallpaperIdentifier];
    [v4 setObject:v22 forKey:@"wallpaperIdentifierUserPreference"];
  }
  v23 = [v3 previousWallpaperIdentifier];

  if (v23)
  {
    v24 = [v3 previousWallpaperIdentifier];
    [v4 setObject:v24 forKey:@"previousWallpaperIdentifierUserPreference"];
  }
  if ([v3 appearanceModePreference] == (id)-1)
  {
    v25 = +[CARPrototypePref interfaceStyle];
    v26 = [v25 value];

    if (v26)
    {
      [v3 setAppearanceModePreference:[v26 unsignedIntegerValue]];
      v27 = +[CARPrototypePref interfaceStyle];
      [v27 setValue:0];

      v28 = +[CARPrototypePref latestInterfaceStyle];
      [v28 setValue:v26];
    }
    else
    {
      v29 = +[CARPrototypePref latestInterfaceStyle];
      v28 = [v29 value];

      if (v28) {
        [v3 setAppearanceModePreference:[v28 unsignedIntegerValue]];
      }
    }
  }
  v30 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 appearanceModePreference]);
  [v4 setObject:v30 forKey:@"appearanceModeUserPreference"];

  if ([v3 mapsAppearancePreference] != (id)-1)
  {
    v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 mapsAppearancePreference]);
    [v4 setObject:v31 forKey:@"mapsAppearanceUserPreference"];
  }
  if ([v3 colorFilterPreference])
  {
    v32 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 colorFilterPreference]);
    [v4 setObject:v32 forKey:@"colorFilterUserPreference"];
  }
  v33 = [v3 colorFilterIntensityPreference];

  if (v33)
  {
    v34 = [v3 colorFilterIntensityPreference];
    [v4 setObject:v34 forKey:@"colorFilterIntensityUserPreference"];
  }
  if ([v3 boldTextPreference])
  {
    v35 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 boldTextPreference]);
    [v4 setObject:v35 forKey:@"boldTextUserPreference"];
  }
  v36 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 soundRecognitionPreference]);
  [v4 setObject:v36 forKey:@"soundRecognitionUserPreference"];

  v37 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v3 voiceControlPreference]);
  [v4 setObject:v37 forKey:@"voiceControlUserPreference"];

  v38 = [v3 disabledFeaturesPreference];

  if (v38)
  {
    v39 = [v3 disabledFeaturesPreference];
    [v4 setObject:v39 forKey:@"disabledFeaturesPreference"];
  }
  v40 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 supportsBluetoothLE]);
  [v4 setObject:v40 forKey:@"supportsBluetoothLE"];

  v41 = [v3 supportsThemeAssets];

  if (v41)
  {
    v42 = [v3 supportsThemeAssets];
    [v4 setObject:v42 forKey:@"supportsThemeAssets"];
  }
  v43 = [v3 clusterAssetIdentifier];

  if (v43)
  {
    v44 = [v3 clusterAssetIdentifier];
    [v4 setObject:v44 forKey:@"clusterAssetIdentifier"];
  }
  v45 = [v3 clusterAssetiOSContentVersion];

  if (v45)
  {
    v46 = [v3 clusterAssetiOSContentVersion];
    [v4 setObject:v46 forKey:@"clusterAssetiOSContentVersion"];
  }
  v47 = [v3 clusterAssetVersion];

  if (v47)
  {
    v48 = [v3 clusterAssetVersion];
    [v4 setObject:v48 forKey:@"clusterAssetVersion"];
  }
  v49 = [v3 SDKVersion];

  if (v49)
  {
    v50 = [v3 SDKVersion];
    [v4 setObject:v50 forKey:@"SDKVersion"];
  }
  v51 = [v3 clusterAssetURL];

  if (v51)
  {
    v52 = [v3 clusterAssetURL];
    v53 = [v52 path];
    [v4 setObject:v53 forKey:@"clusterAssetPath"];
  }
  v54 = [v3 stagedClusterAssetiOSContentVersion];

  if (v54)
  {
    v55 = [v3 stagedClusterAssetiOSContentVersion];
    [v4 setObject:v55 forKey:@"stagedClusterAssetiOSContentVersion"];
  }
  v56 = [v3 stagedClusterAssetVersion];

  if (v56)
  {
    v57 = [v3 stagedClusterAssetVersion];
    [v4 setObject:v57 forKey:@"stagedClusterAssetVersion"];
  }
  v58 = [v3 stagedClusterAssetURL];

  if (v58)
  {
    v59 = [v3 stagedClusterAssetURL];
    v60 = [v59 path];
    [v4 setObject:v60 forKey:@"stagedClusterAssetPath"];
  }
  v61 = [v3 displayThemeData];

  if (v61)
  {
    v85 = v4;
    id v62 = objc_alloc_init((Class)NSMutableDictionary);
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    v63 = [v3 displayThemeData];
    id v64 = [v63 countByEnumeratingWithState:&v86 objects:v92 count:16];
    if (v64)
    {
      id v65 = v64;
      uint64_t v66 = *(void *)v87;
      do
      {
        v67 = 0;
        do
        {
          if (*(void *)v87 != v66) {
            objc_enumerationMutation(v63);
          }
          uint64_t v68 = *(void *)(*((void *)&v86 + 1) + 8 * (void)v67);
          v69 = [v3 displayThemeData];
          v70 = [v69 objectForKey:v68];
          v71 = [v70 asDictionary];

          if (v71)
          {
            [v62 setObject:v71 forKey:v68];
          }
          else
          {
            v72 = CarGeneralLogging();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v91 = v68;
              _os_log_fault_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_FAULT, "Failed to serialize theme data for display: %@", buf, 0xCu);
            }
          }
          v67 = (char *)v67 + 1;
        }
        while (v65 != v67);
        id v65 = [v63 countByEnumeratingWithState:&v86 objects:v92 count:16];
      }
      while (v65);
    }

    id v4 = v85;
    [v85 setObject:v62 forKey:@"displayThemeData"];
  }
  v73 = [v3 hasGaugeClusterScreen];

  if (v73)
  {
    v74 = [v3 hasGaugeClusterScreen];
    [v4 setObject:v74 forKey:@"hasGaugeClusterScreen"];
  }
  v75 = [v3 finishedWelcome];

  if (v75)
  {
    v76 = [v3 finishedWelcome];
    [v4 setObject:v76 forKey:@"finishedWelcome"];
  }
  if (CRIsInternalInstall())
  {
    v77 = [v3 lastConnectedDate];

    if (v77)
    {
      v78 = [v3 lastConnectedDate];
      [v4 setObject:v78 forKey:@"lastConnectedDate"];
    }
    v79 = [v3 vehicleModelName];

    if (v79)
    {
      v80 = [v3 vehicleModelName];
      [v4 setObject:v80 forKey:@"vehicleModelName"];
    }
  }
  v81 = [v3 internalNotes];

  if (v81)
  {
    v82 = [v3 internalNotes];
    [v4 setObject:v82 forKey:@"internalNotes"];
  }
  id v83 = v4;

  return v83;
}

+ (void)_applyPreferencesAttributes:(id)a3 toVehicle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  id v7 = [v5 objectForKey:@"name"];
  if (v7 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (v8) {
    [v6 setVehicleName:v8];
  }
  objc_opt_class();
  id v9 = [v5 objectForKey:@"bluetoothAddress"];
  if (v9 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if (v10) {
    [v6 setBluetoothAddress:v10];
  }
  v133 = v10;
  objc_opt_class();
  id v11 = [v5 objectForKey:@"carplayWiFiUUID"];
  if (v11 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  if (v12) {
    [v6 setCarplayWiFiUUID:v12];
  }
  v132 = v12;
  uint64_t v13 = objc_opt_class();
  v14 = [v5 objectForKey:@"carPlayProtocols"];
  uint64_t v15 = sub_100008CA0(v13, v14);

  if (v15)
  {
    id v16 = +[NSSet setWithArray:v15];
    [v6 setAccessoryProtocols:v16];
  }
  objc_opt_class();
  id v17 = [v5 objectForKey:@"supportsEnhancedIntegration"];
  if (v17 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v18 = v17;
  }
  else {
    id v18 = 0;
  }

  if (v18) {
    [v6 setSupportsEnhancedIntegration:[v18 BOOLValue]];
  }
  v130 = v18;
  objc_opt_class();
  id v19 = [v5 objectForKey:@"supportsMixableAudio"];
  if (v19 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v20 = v19;
  }
  else {
    id v20 = 0;
  }

  if (v20) {
    [v6 setSupportsMixableAudio:[v20 BOOLValue]];
  }
  v129 = v20;
  objc_opt_class();
  id v21 = [v5 objectForKey:@"isSiriBargeInDisabled"];
  if (v21 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v22 = v21;
  }
  else {
    id v22 = 0;
  }

  if (v22) {
    [v6 setSiriBargeInDisabled:[v22 BOOLValue]];
  }
  v128 = v22;
  objc_opt_class();
  id v23 = [v5 objectForKey:@"supportsUSBCarPlay"];
  if (v23 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v24 = v23;
  }
  else {
    id v24 = 0;
  }

  if (v24) {
    [v6 setSupportsUSBCarPlay:[v24 BOOLValue]];
  }
  v127 = v24;
  objc_opt_class();
  id v25 = [v5 objectForKey:@"supportsWirelessCarPlay"];
  if (v25 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v26 = v25;
  }
  else {
    id v26 = 0;
  }

  if (v26) {
    [v6 setSupportsWirelessCarPlay:[v26 BOOLValue]];
  }
  v126 = v26;
  objc_opt_class();
  id v27 = [v5 objectForKey:@"supportsStartSessionRequest"];
  if (v27 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v28 = v27;
  }
  else {
    id v28 = 0;
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setSupportsStartSessionRequest:v28];
  }
  v125 = v28;
  objc_opt_class();
  id v29 = [v5 objectForKey:@"albumArtUserPreference"];
  if (v29 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v30 = v29;
  }
  else {
    id v30 = 0;
  }

  if (v30) {
    [v6 setAlbumArtUserPreference:[v30 integerValue]];
  }
  v124 = v30;
  objc_opt_class();
  id v31 = [v5 objectForKey:@"wallpaperIdentifierUserPreference"];
  if (v31 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v32 = v31;
  }
  else {
    id v32 = 0;
  }

  if (v32) {
    [v6 setWallpaperIdentifier:v32];
  }
  v123 = v32;
  objc_opt_class();
  id v33 = [v5 objectForKey:@"previousWallpaperIdentifierUserPreference"];
  if (v33 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v34 = v33;
  }
  else {
    id v34 = 0;
  }

  if (v34) {
    [v6 setPreviousWallpaperIdentifier:v34];
  }
  v122 = v34;
  objc_opt_class();
  id v35 = [v5 objectForKey:@"appearanceModeUserPreference"];
  if (v35 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v36 = v35;
  }
  else {
    id v36 = 0;
  }

  if (v36) {
    [v6 setAppearanceModePreference:[v36 integerValue]];
  }
  v121 = v36;
  objc_opt_class();
  id v37 = [v5 objectForKey:@"mapsAppearanceUserPreference"];
  if (v37 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v38 = v37;
  }
  else {
    id v38 = 0;
  }

  if (v38) {
    [v6 setMapsAppearancePreference:[v38 integerValue]];
  }
  v120 = v38;
  objc_opt_class();
  id v39 = [v5 objectForKey:@"colorFilterUserPreference"];
  if (v39 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v40 = v39;
  }
  else {
    id v40 = 0;
  }
  v131 = (void *)v15;

  if (v40) {
    [v6 setColorFilterPreference:[v40 integerValue]];
  }
  v119 = v40;
  uint64_t v41 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  v43 = [v5 objectForKey:@"colorFilterIntensityUserPreference"];
  uint64_t v44 = sub_100008DA8(v41, v42, v43);

  if (v44) {
    [v6 setColorFilterIntensityPreference:v44];
  }
  v118 = (void *)v44;
  objc_opt_class();
  id v45 = [v5 objectForKey:@"boldTextUserPreference"];
  if (v45 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v46 = v45;
  }
  else {
    id v46 = 0;
  }

  if (v46) {
    [v6 setBoldTextPreference:[v46 integerValue]];
  }
  v47 = [v5 objectForKey:@"soundRecognitionUserPreference"];
  v48 = v47;
  if (v47) {
    [v6 setSoundRecognitionPreference:[v47 integerValue]];
  }
  v116 = v48;
  v117 = v46;
  v49 = [v5 objectForKey:@"voiceControlUserPreference"];
  v50 = v49;
  if (v49) {
    [v6 setVoiceControlPreference:[v49 integerValue]];
  }
  v115 = v50;
  objc_opt_class();
  id v51 = [v5 objectForKey:@"supportsBluetoothLE"];
  if (v51 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v52 = v51;
  }
  else {
    id v52 = 0;
  }

  if (v52) {
    [v6 setSupportsBluetoothLE:[v52 BOOLValue]];
  }
  v114 = v52;
  objc_opt_class();
  id v53 = [v5 objectForKey:@"disabledFeaturesPreference"];
  if (v53 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v54 = v53;
  }
  else {
    id v54 = 0;
  }

  if (v54) {
    [v6 setDisabledFeaturesPreference:v54];
  }
  v113 = v54;
  objc_opt_class();
  id v55 = [v5 objectForKey:@"supportsThemeAssets"];
  if (v55 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v56 = v55;
  }
  else {
    id v56 = 0;
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setSupportsThemeAssets:v56];
  }
  v112 = v56;
  objc_opt_class();
  id v57 = [v5 objectForKey:@"clusterAssetIdentifier"];
  if (v57 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v58 = v57;
  }
  else {
    id v58 = 0;
  }

  if (v58) {
    [v6 setClusterAssetIdentifier:v58];
  }
  v111 = v58;
  objc_opt_class();
  id v59 = [v5 objectForKey:@"clusterAssetiOSContentVersion"];
  if (v59 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v60 = v59;
  }
  else {
    id v60 = 0;
  }

  if (v60) {
    [v6 setClusterAssetiOSContentVersion:v60];
  }
  v110 = v60;
  objc_opt_class();
  id v61 = [v5 objectForKey:@"clusterAssetVersion"];
  if (v61 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v62 = v61;
  }
  else {
    id v62 = 0;
  }

  if (v62) {
    [v6 setClusterAssetVersion:v62];
  }
  v109 = v62;
  objc_opt_class();
  id v63 = [v5 objectForKey:@"SDKVersion"];
  if (v63 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v64 = v63;
  }
  else {
    id v64 = 0;
  }

  if (v64) {
    [v6 setSDKVersion:v64];
  }
  v108 = v64;
  objc_opt_class();
  id v65 = [v5 objectForKey:@"clusterAssetPath"];
  if (v65 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v66 = v65;
  }
  else {
    id v66 = 0;
  }

  id v67 = v66;
  if (v66)
  {
    uint64_t v68 = +[NSURL fileURLWithPath:v66 isDirectory:0];
    [v6 setClusterAssetURL:v68];
  }
  v107 = v67;
  objc_opt_class();
  id v69 = [v5 objectForKey:@"stagedClusterAssetiOSContentVersion"];
  if (v69 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v70 = v69;
  }
  else {
    id v70 = 0;
  }

  if (v70) {
    [v6 setStagedClusterAssetiOSContentVersion:v70];
  }
  v106 = v70;
  objc_opt_class();
  id v71 = [v5 objectForKey:@"stagedClusterAssetVersion"];
  if (v71 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v72 = v71;
  }
  else {
    id v72 = 0;
  }

  if (v72) {
    [v6 setStagedClusterAssetVersion:v72];
  }
  v105 = v72;
  objc_opt_class();
  id v73 = [v5 objectForKey:@"stagedClusterAssetPath"];
  if (v73 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v74 = v73;
  }
  else {
    id v74 = 0;
  }

  id v75 = v74;
  if (v74)
  {
    v76 = +[NSURL fileURLWithPath:v74 isDirectory:0];
    [v6 setStagedClusterAssetURL:v76];
  }
  v104 = v75;
  uint64_t v77 = objc_opt_class();
  uint64_t v78 = objc_opt_class();
  v79 = [v5 objectForKey:@"displayThemeData"];
  v80 = sub_100008DA8(v77, v78, v79);

  v134 = v80;
  if (v80)
  {
    id v101 = v8;
    v102 = v6;
    id v103 = v5;
    id v81 = objc_alloc_init((Class)NSMutableDictionary);
    long long v135 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id v82 = v80;
    id v83 = [v82 countByEnumeratingWithState:&v135 objects:v141 count:16];
    if (v83)
    {
      id v84 = v83;
      uint64_t v85 = *(void *)v136;
      do
      {
        for (i = 0; i != v84; i = (char *)i + 1)
        {
          if (*(void *)v136 != v85) {
            objc_enumerationMutation(v82);
          }
          uint64_t v87 = *(void *)(*((void *)&v135 + 1) + 8 * i);
          long long v88 = [v82 objectForKey:v87, v101];
          id v89 = [objc_alloc((Class)CRDisplayThemeData) initWithDictionary:v88];
          if (v89)
          {
            [v81 setObject:v89 forKey:v87];
          }
          else
          {
            v90 = CarGeneralLogging();
            if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v140 = v87;
              _os_log_fault_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_FAULT, "Failed to deserialize theme data for display: %@", buf, 0xCu);
            }
          }
        }
        id v84 = [v82 countByEnumeratingWithState:&v135 objects:v141 count:16];
      }
      while (v84);
    }

    id v6 = v102;
    [v102 setDisplayThemeData:v81];

    id v5 = v103;
    id v8 = v101;
  }
  objc_opt_class();
  id v91 = [v5 objectForKey:@"hasGaugeClusterScreen"];
  if (v91 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v92 = v91;
  }
  else {
    id v92 = 0;
  }

  if (v92) {
    [v6 setHasGaugeClusterScreen:v92];
  }
  objc_opt_class();
  id v93 = [v5 objectForKey:@"finishedWelcome"];
  if (v93 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v94 = v93;
  }
  else {
    id v94 = 0;
  }

  if (v94) {
    [v6 setFinishedWelcome:v94];
  }
  if (CRIsInternalInstall())
  {
    objc_opt_class();
    id v95 = [v5 objectForKey:@"lastConnectedDate"];
    if (v95 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v96 = v95;
    }
    else {
      id v96 = 0;
    }

    if (v96) {
      [v6 setLastConnectedDate:v96];
    }
    objc_opt_class();
    id v97 = [v5 objectForKey:@"vehicleModelName"];
    if (v97 && (objc_opt_isKindOfClass() & 1) != 0) {
      id v98 = v97;
    }
    else {
      id v98 = 0;
    }

    if (v98) {
      [v6 setVehicleModelName:v98];
    }
  }
  objc_opt_class();
  id v99 = [v5 objectForKey:@"internalNotes"];
  if (v99 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v100 = v99;
  }
  else {
    id v100 = 0;
  }

  if (v100) {
    [v6 setInternalNotes:v100];
  }
}

+ (id)_allPreferencesPairings
{
  v2 = (void *)CFPreferencesCopyAppValue(@"pairings", CRPreferencesNotMigratedDomain);
  if (!v2)
  {
    v2 = +[NSDictionary dictionary];
  }

  return v2;
}

+ (BOOL)_addPreferencesPairingForVehicle:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v5 UUIDString];

  if (v6)
  {
    id v7 = [(id)objc_opt_class() _preferencesAttributesForVehicle:v4];
    if (v7)
    {
      id v8 = [a1 _allPreferencesPairings];
      id v9 = [v8 mutableCopy];

      [v9 setObject:v7 forKey:v6];
      CFPreferencesSetAppValue(@"pairings", v9, CRPreferencesNotMigratedDomain);
      int v10 = CFPreferencesAppSynchronize(CRPreferencesNotMigratedDomain);
      BOOL v11 = v10 != 0;
      if (!v10)
      {
        id v12 = CarGeneralLogging();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          sub_10006F424((uint64_t)v6, v4);
        }
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)_removePreferencesPairingForVehicle:(id)a3
{
  id v4 = a3;
  id v5 = [v4 identifier];
  id v6 = [v5 UUIDString];

  if (!v6)
  {
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  if (([a1 _removePreferencesPairingForVehicleIdentifier:v6] & 1) == 0)
  {
    id v8 = CarGeneralLogging();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10006F4B8((uint64_t)v6, v4);
    }

    goto LABEL_7;
  }
  BOOL v7 = 1;
LABEL_8:

  return v7;
}

+ (BOOL)_removePreferencesPairingForVehicleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _allPreferencesPairings];
  id v6 = [v5 mutableCopy];

  [v6 removeObjectForKey:v4];
  CFPreferencesSetAppValue(@"pairings", v6, CRPreferencesNotMigratedDomain);
  LOBYTE(v5) = CFPreferencesAppSynchronize(CRPreferencesNotMigratedDomain) != 0;

  return (char)v5;
}

+ (void)_cleanupPreferencesForIncompleteVehicleIdentifier:(id)a3 name:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = CarGeneralLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_10006F5B4();
  }

  unsigned int v8 = [(id)objc_opt_class() _removePreferencesPairingForVehicleIdentifier:v5];
  id v9 = CarGeneralLogging();
  int v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      id v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Cleaned up preferences for missing keychain item %@ (%@)", (uint8_t *)&v11, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_10006F54C();
  }
}

+ (void)postPairingsDidChangeNotification
{
  v2 = CarGeneralLogging();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "posting pairings changed", v4, 2u);
  }

  id v3 = +[NSDistributedNotificationCenter defaultCenter];
  [v3 postNotificationName:CRPairedVehiclesDidChangeNotification object:0];
}

- (CRVehicleStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)CRVehicleStore;
  v2 = [(CRVehicleStore *)&v8 init];
  id v3 = v2;
  if (v2)
  {
    [(CRVehicleStore *)v2 _invalidateCachedVehicles];
    id v4 = (CARObserverHashTable *)[objc_alloc((Class)CARObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___CRVehicleStoreObserving];
    observers = v3->_observers;
    v3->_observers = v4;

    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v3 selector:"handleAvailabilityDidChange:" name:CRVehicleStoreAvailabilityDidChangeNotification object:0];
  }
  return v3;
}

- (void)dealloc
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CRVehicleStore;
  [(CRVehicleStore *)&v4 dealloc];
}

- (void)_invalidateCachedVehicles
{
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRVehicleStore *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRVehicleStore *)self observers];
  [v5 removeObserver:v4];
}

- (id)saveVehicle:(id)a3
{
  return [(CRVehicleStore *)self saveVehicle:a3 withMergePolicy:0];
}

- (id)saveVehicle:(id)a3 withMergePolicy:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(void, id, void *))a4;
  if (!+[CRVehicleStoreAvailability isVehicleStoreAvailable])
  {
    id v20 = 0;
    goto LABEL_26;
  }
  objc_super v8 = [v6 certificateSerialNumber];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = [(CRVehicleStore *)self allStoredVehicles];
  id v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v10)
  {
    id v11 = v10;
    id v25 = self;
    id v26 = v7;
    id v12 = 0;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if ((objc_msgSend(v15, "isEqual:", v6, v25) & 1) == 0)
        {
          if (!v8) {
            continue;
          }
          id v16 = [v15 certificateSerialNumber];
          unsigned int v17 = [v8 isEqualToData:v16];

          if (!v17) {
            continue;
          }
        }
        id v18 = v15;

        id v12 = v18;
      }
      id v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v11);

    if (!v12)
    {
      self = v25;
      BOOL v7 = v26;
      goto LABEL_22;
    }
    self = v25;
    BOOL v7 = v26;
    if (v26)
    {
      v26[2](v26, v6, v12);
      id v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      [v12 mergeAttributesFromVehicle:v6];
      id v19 = v12;
      id v12 = v19;
    }
    id v9 = v6;
    id v6 = v19;
  }
  else
  {
    id v12 = 0;
  }

LABEL_22:
  [(CRVehicleStore *)self _invalidateCachedVehicles];
  unsigned int v21 = [(id)objc_opt_class() _addPreferencesPairingForVehicle:v6];
  unsigned int v22 = [(id)objc_opt_class() _addKeychainPairingForVehicle:v6];
  id v23 = [(CRVehicleStore *)self observers];
  [v23 vehicleStore:self didSaveVehicle:v6];

  [(id)objc_opt_class() postPairingsDidChangeNotification];
  id v20 = 0;
  if (v21 && v22) {
    id v20 = v6;
  }

LABEL_26:

  return v20;
}

- (BOOL)removeVehicle:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v13 = CarGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10006F61C(v13);
    }

    goto LABEL_10;
  }
  if (!+[CRVehicleStoreAvailability isVehicleStoreAvailable])
  {
LABEL_10:
    char v12 = 0;
    goto LABEL_11;
  }
  [(CRVehicleStore *)self _invalidateCachedVehicles];
  unsigned __int8 v5 = [(id)objc_opt_class() _removePreferencesPairingForVehicle:v4];
  unsigned __int8 v6 = [(id)objc_opt_class() _removeKeychainPairingForVehicle:v4];
  BOOL v7 = objc_opt_class();
  uint64_t v8 = [v4 bluetoothAddress];
  id v9 = (void *)v8;
  if (v8) {
    CFStringRef v10 = (const __CFString *)v8;
  }
  else {
    CFStringRef v10 = @"CarPlay";
  }
  [v7 removePayloadForVehicleWithIdentifier:v10];

  id v11 = [(CRVehicleStore *)self observers];
  [v11 vehicleStore:self didRemoveVehicle:v4];

  [(id)objc_opt_class() postPairingsDidChangeNotification];
  char v12 = v5 & v6;
LABEL_11:

  return v12;
}

- (id)allStoredVehicles
{
  if (+[CRVehicleStoreAvailability isVehicleStoreAvailable])
  {
    id v3 = [(CRVehicleStore *)self cachedVehicles];
    if (v3)
    {
      id v4 = CarGeneralLogging();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_10006F660(v3, v4);
      }

      id v5 = [objc_alloc((Class)NSSet) initWithSet:v3 copyItems:1];
    }
    else
    {
      unsigned __int8 v6 = +[NSMutableSet set];
      BOOL v7 = [(id)objc_opt_class() _keychainItemAttributesForAllVehicles];
      id v8 = [v7 mutableCopy];

      id v9 = [(id)objc_opt_class() _allPreferencesPairings];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100009A60;
      v13[3] = &unk_1000BD1D8;
      v13[4] = self;
      id v14 = v8;
      id v10 = v6;
      id v15 = v10;
      id v11 = v8;
      [v9 enumerateKeysAndObjectsUsingBlock:v13];
      if ([v10 count]) {
        [(CRVehicleStore *)self setCachedVehicles:v10];
      }
      id v5 = [objc_alloc((Class)NSSet) initWithSet:v10 copyItems:1];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_matchingKeychainItemForIdentifier:(id)a3 inKeychainItems:(id)a4
{
  id v5 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v12 = [v11 objectForKey:kSecAttrAccount];
        uint64_t v13 = v12;
        if (v12 && ([v12 isEqualToString:v5] & 1) != 0)
        {
          id v14 = v11;

          goto LABEL_12;
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_12:

  return v14;
}

- (void)handleAvailabilityDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009EAC;
  block[3] = &unk_1000BD1B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (id)vehicleForIdentifier:(id)a3
{
  id v4 = a3;
  [(CRVehicleStore *)self allStoredVehicles];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 identifier:v13];
        unsigned int v11 = [v10 isEqual:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)vehicleForBluetoothAddress:(id)a3
{
  id v4 = a3;
  [(CRVehicleStore *)self allStoredVehicles];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 bluetoothAddress:v15];
        if (v10)
        {
          unsigned int v11 = (void *)v10;
          char v12 = [v9 bluetoothAddress];
          unsigned int v13 = [v12 isEqualToString:v4];

          if (v13)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (id)vehicleForCertificateSerial:(id)a3
{
  id v4 = a3;
  [(CRVehicleStore *)self allStoredVehicles];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v10 = [v9 certificateSerialNumber:v15];
        if (v10)
        {
          unsigned int v11 = (void *)v10;
          char v12 = [v9 certificateSerialNumber];
          unsigned int v13 = [v12 isEqualToData:v4];

          if (v13)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

- (NSSet)cachedVehicles
{
  return self->_cachedVehicles;
}

- (void)setCachedVehicles:(id)a3
{
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_cachedVehicles, 0);
}

@end