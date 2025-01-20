@interface UARPMobileAssetManager
- (BOOL)_updateFusingforAccessory:(id)a3;
- (BOOL)isRoamingEnabled;
- (BOOL)performFirmwareAssetQuery:(id)a3;
- (BOOL)performIsRoamingEnabledCheck;
- (BOOL)uarpDownloadOnCellularAllowed;
- (BOOL)updateAssetSettingsForAccessory:(id)a3 checkForUpdate:(BOOL)a4 automaticUpdatesDisabled:(BOOL *)a5;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)queue;
- (UARPMobileAssetManager)initWithManager:(id)a3 queue:(id)a4;
- (id)assetWithMaxVersion:(id)a3;
- (id)getAssetBundle:(id)a3;
- (id)getAssetVersionForMAAsset:(id)a3;
- (id)profileAssetOverrideSettings;
- (int64_t)downloadFirmwareForAccessory:(id)a3 assetID:(id)a4 mobileAsset:(id)a5;
- (int64_t)downloadRemoteFirmwareForAccessory:(id)a3 assetID:(id)a4 mobileAsset:(id)a5;
- (int64_t)performDownload:(id)a3 accessory:(id)a4 assetID:(id)a5 supplementalAsset:(BOOL)a6;
- (int64_t)performRemoteQueryForAccessory:(id)a3;
- (int64_t)performRemoteUpdateCheckForAccessory:(id)a3;
- (int64_t)uarpAssetLocationType:(unint64_t)a3;
- (void)_mergePartnerAccessoriesInAssetSettings:(id)a3;
- (void)cleanupAssetCache;
- (void)dealloc;
- (void)handleFirmwareAssetQueryCompletion:(id)a3 result:(int64_t)a4 forAccessory:(id)a5 downstreamAppleModelNumber:(id)a6;
- (void)handleMobileAssetDownloadCompletion:(id)a3 status:(int64_t)a4 accessory:(id)a5 assetID:(id)a6;
- (void)handleSupplementalAssetDownloadCompletion:(id)a3 result:(int64_t)a4 forAccessory:(id)a5;
- (void)handleSupplementalAssetQueryCompletion:(id)a3 result:(int64_t)a4 forAccessory:(id)a5;
- (void)notifyFirmwareUpdateAvailabilityStatus:(int64_t)a3 accessory:(id)a4 downstreamAppleModelNumber:(id)a5;
- (void)performQuery:(id)a3 assetType:(id)a4 supplementalAsset:(BOOL)a5 downstreamAppleModelNumber:(id)a6;
- (void)performRemoteDownstreamAssetQuery:(id)a3 appleModelNumbers:(id)a4;
- (void)performRemoteSupplementalAssetQuery:(id)a3 supplementalAssets:(id)a4;
- (void)setUarpDownloadOnCellularAllowed:(BOOL)a3;
- (void)updateAccessoryInfoInDatabaseIfNeeded:(id)a3 serialNumber:(id)a4 accessory:(id)a5 updatePartnerSerialNumbers:(BOOL)a6;
- (void)updateSettingsDatabaseForAccessory:(id)a3;
@end

@implementation UARPMobileAssetManager

- (UARPMobileAssetManager)initWithManager:(id)a3 queue:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UARPMobileAssetManager;
  v6 = [(UARPMobileAssetManager *)&v8 init];
  if (v6)
  {
    v6->_log = (OS_os_log *)os_log_create("com.apple.accessoryupdater.uarp", "mobileAssetManager");
    v6->_assetManager = (UARPAssetManager *)a3;
    v6->_queue = (OS_dispatch_queue *)a4;
    v6->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.aam.uarpMobileAssetManager.queue", 0);
    [(UARPMobileAssetManager *)v6 cleanupAssetCache];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UARPMobileAssetManager;
  [(UARPMobileAssetManager *)&v3 dealloc];
}

- (void)cleanupAssetCache
{
  objc_super v3 = objc_opt_new();
  uint64_t v4 = sub_1000428C8();
  v5 = &ADClientAddValueForScalarKey_ptr;
  v6 = +[NSString stringWithFormat:@"%@A", v4];
  v7 = [+[NSFileManager defaultManager] enumeratorAtPath:v4];
  id v8 = [(NSDirectoryEnumerator *)v7 nextObject];
  if (v8)
  {
    id v9 = v8;
    v10 = &ADClientAddValueForScalarKey_ptr;
    v30 = v7;
    do
    {
      v11 = v5[325];
      v43[0] = v4;
      v43[1] = v9;
      id v12 = objc_msgSend(v11, "pathWithComponents:", objc_msgSend(v10[303], "arrayWithObjects:count:", v43, 2));
      if ([v12 hasPrefix:v6])
      {
        uint64_t v13 = v4;
        v14 = v6;
        v15 = v10;
        v16 = v5;
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v9;
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Removing legacy mobile asset download at %@", buf, 0xCu);
        }
        [v3 addObject:v12];
        v5 = v16;
        v10 = v15;
        v6 = v14;
        uint64_t v4 = v13;
        v7 = v30;
      }
      id v9 = [(NSDirectoryEnumerator *)v7 nextObject];
    }
    while (v9);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v18 = [v3 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v36;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v36 != v20) {
          objc_enumerationMutation(v3);
        }
        [+[NSFileManager defaultManager] removeItemAtPath:*(void *)(*((void *)&v35 + 1) + 8 * i) error:0];
      }
      id v19 = [v3 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v19);
  }
  [v3 removeAllObjects];
  v22 = sub_1000129A4();
  id v23 = sub_100017DE8(v22, 0, 2592000.0);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v24 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v32;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v32 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v31 + 1) + 8 * (void)j);
        v29 = self->_log;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v28;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Removing current mobile asset download at %@", buf, 0xCu);
        }
        [+[NSFileManager defaultManager] removeItemAtPath:v28 error:0];
      }
      id v25 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v25);
  }
}

- (BOOL)isRoamingEnabled
{
  return [(UARPMobileAssetManager *)self performIsRoamingEnabledCheck];
}

- (int64_t)performRemoteUpdateCheckForAccessory:(id)a3
{
  return [(UARPMobileAssetManager *)self performRemoteQueryForAccessory:a3];
}

- (int64_t)downloadFirmwareForAccessory:(id)a3 assetID:(id)a4 mobileAsset:(id)a5
{
  if (a5) {
    return -[UARPMobileAssetManager downloadRemoteFirmwareForAccessory:assetID:mobileAsset:](self, "downloadRemoteFirmwareForAccessory:assetID:mobileAsset:", a3, a4);
  }
  else {
    return 4;
  }
}

- (void)updateSettingsDatabaseForAccessory:(id)a3
{
  if (objc_msgSend(+[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", objc_msgSend(objc_msgSend(a3, "accessoryID"), "modelNumber")), "supportsInternalSettings"))
  {
    char v5 = 0;
    [(UARPMobileAssetManager *)self updateAssetSettingsForAccessory:a3 checkForUpdate:0 automaticUpdatesDisabled:&v5];
  }
}

- (BOOL)uarpDownloadOnCellularAllowed
{
  return self->_uarpDownloadOnCellularAllowed;
}

- (void)setUarpDownloadOnCellularAllowed:(BOOL)a3
{
  self->_uarpDownloadOnCellularAllowed = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (BOOL)performIsRoamingEnabledCheck
{
  uint64_t v10 = 0;
  if (dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony", 16))
  {
    id v3 = objc_alloc_init((Class)CoreTelephonyClient);
    uint64_t v4 = v3;
    if (v3 && (id v5 = [v3 getCurrentDataServiceDescriptorSync:&v10]) != 0) {
      unsigned __int8 v6 = [v4 getInternationalDataAccessSync:v5 error:&v10];
    }
    else {
      unsigned __int8 v6 = 0;
    }
    uint64_t v7 = v10;
    if (v10)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v12 = v7;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Failed to get international data status %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)profileAssetOverrideSettings
{
  id v3 = +[NSURL fileURLWithPath:@"/Library/Managed Preferences/mobile/com.apple.AUDeveloperSettings.plist"];
  uint64_t v17 = 0;
  uint64_t v4 = +[NSDictionary dictionaryWithContentsOfURL:v3 error:&v17];
  if (!v4)
  {
    uint64_t v10 = v17;
    if (v17)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        id v19 = "-[UARPMobileAssetManager(Query) profileAssetOverrideSettings]";
        __int16 v20 = 2114;
        v21 = v3;
        __int16 v22 = 2114;
        uint64_t v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "%s: Failed to read managedPrefs at %{public}@ error %{public}@", buf, 0x20u);
      }
    }
    return 0;
  }
  id v5 = [(NSDictionary *)v4 objectForKeyedSubscript:@"models"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100052858();
    }
    return 0;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [v5 objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
            sub_1000527E0();
          }
          return 0;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return v5;
}

- (int64_t)uarpAssetLocationType:(unint64_t)a3
{
  uint64_t v3 = 13;
  if (a3 == 6) {
    uint64_t v3 = 14;
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    int64_t v4 = 11;
  }
  else {
    int64_t v4 = v3;
  }
  if (a3 >= 2) {
    return v4;
  }
  else {
    return 12;
  }
}

- (BOOL)_updateFusingforAccessory:(id)a3
{
  id v5 = +[AUDeveloperSettingsDatabase sharedDatabase];
  id v6 = objc_msgSend(objc_msgSend(v5, "accessoriesDictionary"), "objectForKey:", objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"));
  if (v6)
  {
    id v7 = v6;
    id v8 = +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", objc_msgSend(objc_msgSend(a3, "accessoryID"), "modelNumber"));
    if (![v8 fusingOverrideUnfused]
      || (objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"), "isEqualToString:", @"unfused") & 1) == 0)
    {
      id v9 = [v7 mutableCopy];
      id v10 = [v9 objectForKeyedSubscript:@"fusing"];
      id v11 = objc_msgSend(v9, "objectForKeyedSubscript:");
      id v12 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"), "caseInsensitiveCompare:", v10);
      BOOL v13 = v12 != 0;
      if (!v12)
      {
LABEL_24:

        return v13;
      }
      id v22 = v11;
      if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"), "isEqualToString:", @"prod"))
      {
        unint64_t v14 = 1;
      }
      else if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"), "isEqualToString:", @"dev"))
      {
        unint64_t v14 = 0;
      }
      else
      {
        if (!objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"), "isEqualToString:", @"unfused"))goto LABEL_15; {
        unint64_t v14 = 2;
        }
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_1000060EC(v14)), @"fusing");
LABEL_15:
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v24 = [a3 accessoryID];
        __int16 v25 = 2114;
        id v26 = v10;
        __int16 v27 = 2114;
        id v28 = [v9 objectForKeyedSubscript:@"fusing"];
        _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Updating HW Fusing for %{public}@, from %{public}@ to %{public}@", buf, 0x20u);
      }
      if (MGGetBoolAnswer()
        && (objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"), "isEqualToString:", @"prod") & 1) == 0)
      {
        objc_msgSend(v9, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100006228(0)), @"assetLocation");
        unint64_t v17 = 0;
        if (!objc_msgSend(objc_msgSend(v8, "supplementalAssets"), "count")) {
          goto LABEL_21;
        }
      }
      else
      {
        unint64_t v17 = 2;
        objc_msgSend(v9, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100006228(2uLL)), @"assetLocation");
        if (!objc_msgSend(objc_msgSend(v8, "supplementalAssets"), "count"))
        {
LABEL_21:
          id v18 = self->_log;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            id v19 = [a3 accessoryID];
            id v20 = [v9 objectForKeyedSubscript:@"assetLocation"];
            *(_DWORD *)buf = 138543874;
            id v24 = v19;
            __int16 v25 = 2114;
            id v26 = v22;
            __int16 v27 = 2114;
            id v28 = v20;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Updating Asset Location for %{public}@, from %{public}@ to %{public}@", buf, 0x20u);
          }
          objc_msgSend(v5, "addAccessoryWithSerialNumber:info:", objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"), +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v9));
          goto LABEL_24;
        }
      }
      objc_msgSend(v9, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100006228(v17)), @"supplementalAssetLocation");
      goto LABEL_21;
    }
    return 0;
  }
  long long v15 = self->_log;
  BOOL v13 = 0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v24 = [a3 accessoryID];
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not updating fusing for %@ no Entry in Database", buf, 0xCu);
    return 0;
  }
  return v13;
}

- (void)_mergePartnerAccessoriesInAssetSettings:(id)a3
{
  unsigned int v4 = -[UARPMobileAssetManager _updateFusingforAccessory:](self, "_updateFusingforAccessory:");
  id v35 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType");
  if (!v35) {
    return;
  }
  HIDWORD(v30) = v4;
  id v34 = +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", objc_msgSend(objc_msgSend(a3, "accessoryID"), "modelNumber"));
  id v37 = +[AUDeveloperSettingsDatabase sharedDatabase];
  id v5 = objc_msgSend(objc_msgSend(v37, "accessoriesDictionary"), "objectForKey:", objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"));
  id v6 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "partnerSerialNumbers");
  if (![v6 count])
  {
    id v6 = sub_100006690(objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"));
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = v6;
      __int16 v45 = 2112;
      id v46 = [a3 accessoryID];
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Found Partner Serial Numbers updated to %@ for accessory %@", buf, 0x16u);
    }
  }
  long long v33 = v5;
  id v8 = self->_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [a3 accessoryID];
    *(_DWORD *)buf = 138412546;
    id v44 = v6;
    __int16 v45 = 2112;
    id v46 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Using reported Partner Serial Numbers %@ for accessory %@", buf, 0x16u);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v10 = v6;
  LODWORD(v30) = v5 == 0;
  id v11 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16, v30);
  if (!v11)
  {
LABEL_25:
    if (v33) {
      return;
    }
    goto LABEL_43;
  }
  id v12 = v11;
  uint64_t v13 = *(void *)v39;
LABEL_9:
  uint64_t v14 = 0;
  while (1)
  {
    if (*(void *)v39 != v13) {
      objc_enumerationMutation(v10);
    }
    id v15 = *(id *)(*((void *)&v38 + 1) + 8 * v14);
    id v16 = objc_msgSend(objc_msgSend(v37, "accessoriesDictionary"), "objectForKey:", v15);
    id v17 = [v16 objectForKey:@"fusing"];
    if (v17)
    {
      if (!objc_msgSend(v15, "isEqualToString:", objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber")))break; {
    }
      }
    id v18 = self->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = v15;
      __int16 v45 = 2112;
      id v46 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Unexpected Accessory Entry for %@ with fusing %@", buf, 0x16u);
    }
LABEL_23:
    if (v12 == (id)++v14)
    {
      id v12 = [v10 countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v12) {
        goto LABEL_9;
      }
      goto LABEL_25;
    }
  }
  if ([v17 caseInsensitiveCompare:v35]
    && (([v35 isEqualToString:@"prod"] & 1) != 0
     || ![v17 caseInsensitiveCompare:@"prod"]))
  {
    if (([v34 supportsVersions] & 1) == 0)
    {
      id v19 = [v16 objectForKeyedSubscript:@"name"];
      id v20 = self->_log;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "friendlyName");
        *(_DWORD *)buf = 138412546;
        id v44 = v21;
        __int16 v45 = 2112;
        id v46 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Overriding friendly name %@, from Partner Accessory %@", buf, 0x16u);
      }
      objc_msgSend(objc_msgSend(a3, "accessoryID"), "setFriendlyName:", v19);
    }
    goto LABEL_23;
  }
  id v22 = [v16 objectForKeyedSubscript:@"partnerSerialNumbers"];
  if ([v33 objectForKeyedSubscript:@"partnerSerialNumbers"]) {
    int v23 = v32;
  }
  else {
    int v23 = 1;
  }
  if (v23 == 1 && (v22 || !objc_msgSend(objc_msgSend(a3, "accessoryID"), "partnerSerialNumbers")))
  {
    id v24 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber");
    int v25 = 0;
  }
  else
  {
    id v24 = v15;
    id v15 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber");
    int v25 = v31;
  }
  id v26 = self->_log;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v44 = v15;
    __int16 v45 = 2112;
    id v46 = v24;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Keeping Entry for %@, instead of %@", buf, 0x16u);
  }
  if (!v24)
  {
    if (!v25) {
      return;
    }
LABEL_43:
    id v28 = self->_log;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      id v29 = [a3 accessoryID];
      *(_DWORD *)buf = 138412290;
      id v44 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Added Entry for %@ in AUDeveloperSettingsDatabase", buf, 0xCu);
    }
    -[UARPMobileAssetManager updateAccessoryInfoInDatabaseIfNeeded:serialNumber:accessory:updatePartnerSerialNumbers:](self, "updateAccessoryInfoInDatabaseIfNeeded:serialNumber:accessory:updatePartnerSerialNumbers:", 0, objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"), a3, 1);
    [a3 checkDropbox];
    return;
  }
  __int16 v27 = self->_log;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v44 = v24;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Removing Entry from AUDeveloperSettingsDatabase with serialNumber %@", buf, 0xCu);
  }
  [v37 removeAccessoryWithSerialNumber:v24];
  if (v25) {
    goto LABEL_43;
  }
}

- (BOOL)updateAssetSettingsForAccessory:(id)a3 checkForUpdate:(BOOL)a4 automaticUpdatesDisabled:(BOOL *)a5
{
  BOOL v6 = a4;
  *a5 = 0;
  if (!objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"))
  {
    BOOL v16 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v16) {
      return v16;
    }
    sub_1000528D0(a3);
    goto LABEL_43;
  }
  BOOL v38 = v6;
  [(UARPMobileAssetManager *)self _mergePartnerAccessoriesInAssetSettings:a3];
  id v9 = +[AUDeveloperSettingsDatabase sharedDatabase];
  id v10 = objc_msgSend(objc_msgSend(v9, "accessoriesDictionary"), "objectForKey:", objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"));
  long long v40 = a5;
  id v41 = a3;
  long long v39 = self;
  if (v10)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber");
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = sub_10003D1B0(v10, 0);
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Entry found in AUDeveloperSettingsDatabase Accessory:%@ assetLocation:%@", buf, 0x16u);
    }
    id v12 = v10;
    [v10 objectForKeyedSubscript:@"modelNumber"];
    id v13 = objc_msgSend(objc_msgSend(v41, "accessoryID"), "serialNumber");
    id v14 = v12;
    id v15 = v12;
LABEL_6:
    [(UARPMobileAssetManager *)self updateAccessoryInfoInDatabaseIfNeeded:v15 serialNumber:v13 accessory:v41 updatePartnerSerialNumbers:v14 != 0];
    id v15 = objc_msgSend(objc_msgSend(v9, "accessoriesDictionary"), "objectForKey:", v13);
    goto LABEL_32;
  }
  id v17 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType");
  id v18 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "partnerSerialNumbers");
  if (![v18 count]) {
    id v18 = sub_100006690(objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber"));
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v19 = [v18 countByEnumeratingWithState:&v43 objects:v51 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v44;
LABEL_13:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v44 != v20) {
        objc_enumerationMutation(v18);
      }
      id v13 = *(id *)(*((void *)&v43 + 1) + 8 * v21);
      id v15 = objc_msgSend(objc_msgSend(v9, "accessoriesDictionary"), "objectForKey:", v13);
      id v22 = [v15 objectForKey:@"fusing"];
      if (v22)
      {
        if ((objc_msgSend(v13, "isEqualToString:", objc_msgSend(objc_msgSend(v41, "accessoryID"), "serialNumber")) & 1) == 0&& (!objc_msgSend(v22, "caseInsensitiveCompare:", v17)|| (objc_msgSend(v17, "isEqualToString:", @"prod") & 1) == 0&& objc_msgSend(v22, "caseInsensitiveCompare:", @"prod")))
        {
          break;
        }
      }
      if (v19 == (id)++v21)
      {
        id v19 = [v18 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v19) {
          goto LABEL_13;
        }
        goto LABEL_29;
      }
    }
    if (!v15) {
      goto LABEL_29;
    }
    int v23 = self->_log;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v24 = sub_10003D1B0(v15, 0);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Entry found in AUDeveloperSettingsDatabase Partner Accessory:%@ assetLocation:%@", buf, 0x16u);
    }
    unsigned int v25 = objc_msgSend(objc_msgSend(objc_msgSend(v41, "accessoryID"), "modelNumber"), "isEqualToString:", objc_msgSend(v15, "objectForKeyedSubscript:", @"modelNumber"));
    id v14 = 0;
    if (v25) {
      goto LABEL_6;
    }
  }
  else
  {
LABEL_29:
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100052A48(v41);
    }
    id v15 = 0;
    *long long v40 = 1;
  }
LABEL_32:
  if (sub_100006CB4([v41 accessoryID]))
  {
    id v26 = self->_log;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = [v41 identifier];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Entry found in AUDeveloperSettingsDatabase Accessory:%@ with OTA Update disabled, not attempting update", buf, 0xCu);
    }
    *long long v40 = 1;
  }
  id v28 = [v15 objectForKeyedSubscript:@"fusing"];
  id v29 = v40;
  if (!v28
    || (id v29 = v40,
        objc_msgSend(v28, "isEqualToString:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_1000060EC(3uLL)))))
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000529C4(v41);
      id v29 = v40;
    }
    BOOL *v29 = 1;
  }
  if (!v38
    || *v29
    || objc_msgSend(objc_msgSend(v41, "assetID"), "type") != (id)3
    && objc_msgSend(objc_msgSend(v41, "assetID"), "type") != (id)11
    && objc_msgSend(objc_msgSend(v41, "assetID"), "type") != (id)12
    && objc_msgSend(objc_msgSend(v41, "assetID"), "type") != (id)13
    && objc_msgSend(objc_msgSend(v41, "assetID"), "type") != (id)14)
  {
    goto LABEL_43;
  }
  CFStringRef v30 = sub_10003D1B0(v15, 0);
  if (v30)
  {
    uint64_t v31 = sub_10000624C([v15 objectForKeyedSubscript:@"assetLocation"]);
    int v32 = +[NSURL URLWithString:v30];
    if ((-[NSURL isEqual:](v32, "isEqual:", objc_msgSend(objc_msgSend(v41, "assetID"), "remoteURL")) & 1) == 0)
    {
      long long v33 = v39->_log;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = [v41 identifier];
        id v35 = objc_msgSend(objc_msgSend(v41, "assetID"), "remoteURL");
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v35;
        *(_WORD *)&buf[22] = 2112;
        v48 = (void (*)(uint64_t, uint64_t))v30;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Overriding asset location for %@ from %@ to %@", buf, 0x20u);
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3052000000;
      v48 = sub_10003E7A8;
      v49 = sub_10003E7B8;
      id v50 = 0;
      id v50 = objc_msgSend(objc_alloc((Class)UARPAssetID), "initWithLocationType:remoteURL:", -[UARPMobileAssetManager uarpAssetLocationType:](v39, "uarpAssetLocationType:", v31), v32);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003E7C4;
      block[3] = &unk_10007D550;
      block[4] = v39;
      block[5] = v41;
      block[6] = buf;
      dispatch_async((dispatch_queue_t)[(UARPMobileAssetManager *)v39 delegateQueue], block);
      _Block_object_dispose(buf, 8);
      LOBYTE(v16) = 1;
      return v16;
    }
LABEL_43:
    LOBYTE(v16) = 0;
    return v16;
  }
  long long v36 = self->_log;
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    sub_10005294C((uint64_t)v15, v36);
  }
  LOBYTE(v16) = 0;
  *long long v40 = 1;
  return v16;
}

- (void)updateAccessoryInfoInDatabaseIfNeeded:(id)a3 serialNumber:(id)a4 accessory:(id)a5 updatePartnerSerialNumbers:(BOOL)a6
{
  BOOL v6 = a6;
  id v36 = +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", objc_msgSend(objc_msgSend(a5, "accessoryID"), "modelNumber"));
  if (a3)
  {
    BOOL v10 = v6;
    id v11 = a4;
    id v12 = [a3 objectForKeyedSubscript:@"fusing"];
    id v13 = +[NSString stringWithUTF8String:sub_1000060EC(3uLL)];
    id v14 = [a3 mutableCopy];
    if (![v12 isEqualToString:v13]
      || !objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"))
    {
      BOOL v16 = v36;
      if (objc_msgSend(objc_msgSend(v36, "supplementalAssets"), "count"))
      {
        a4 = v11;
        if (![v14 objectForKeyedSubscript:@"supplementalAssetLocation"])
        {
          MGGetBoolAnswer();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100006228(2uLL)), @"supplementalAssetLocation");
        }
      }
      else
      {
        a4 = v11;
      }
      BOOL v6 = v10;
      goto LABEL_34;
    }
    if (objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"), "isEqualToString:", @"dev"))
    {
      unint64_t v15 = 0;
    }
    else if (objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"), "isEqualToString:", @"prod"))
    {
      unint64_t v15 = 1;
    }
    else if (objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"), "isEqualToString:", @"unfused"))
    {
      unint64_t v15 = 2;
    }
    else
    {
      unint64_t v15 = 3;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v39 = [a5 identifier];
      __int16 v40 = 2080;
      id v41 = sub_1000060EC(v15);
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Updating fusing type for %@ to %s", buf, 0x16u);
    }
    objc_msgSend(v14, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_1000060EC(v15)), @"fusing");
    a4 = v11;
    BOOL v6 = v10;
  }
  else
  {
    id v14 = objc_alloc_init((Class)NSMutableDictionary);
    if (objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"), "isEqualToString:", @"dev"))
    {
      unint64_t v15 = 0;
    }
    else if (objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"), "isEqualToString:", @"prod"))
    {
      unint64_t v15 = 1;
    }
    else if (objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"), "isEqualToString:", @"unfused"))
    {
      unint64_t v15 = 2;
    }
    else
    {
      unint64_t v15 = 3;
    }
    objc_msgSend(v14, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_1000060EC(v15)), @"fusing");
    id v17 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "firmwareVersion"), "copy");
    [v14 setObject:v17 forKeyedSubscript:@"activeVersion"];

    id v18 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwRevision"), "copy");
    [v14 setObject:v18 forKeyedSubscript:@"hwRevision"];
  }
  if (!MGGetBoolAnswer() || (v15 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100006228(2uLL)), @"assetLocation");
    BOOL v16 = v36;
    if (objc_msgSend(objc_msgSend(v36, "supplementalAssets"), "count"))
    {
      unint64_t v20 = 2;
      goto LABEL_33;
    }
  }
  else
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100006228(0)), @"assetLocation");
    BOOL v16 = v36;
    if (objc_msgSend(objc_msgSend(v36, "supplementalAssets"), "count"))
    {
      unint64_t v20 = 0;
LABEL_33:
      objc_msgSend(v14, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100006228(v20)), @"supplementalAssetLocation");
    }
  }
LABEL_34:
  id v21 = [v14 objectForKeyedSubscript:@"name"];
  if (!objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "friendlyName"), "length")
    || (id v22 = objc_msgSend(objc_msgSend(a5, "accessoryID"), "friendlyName"),
        ([v22 isEqualToString:kUARPDefaultFriendlyNameUnknown] & 1) != 0))
  {
    if (v21) {
      goto LABEL_43;
    }
    id v23 = objc_alloc((Class)NSMutableString);
    id v24 = v16 ? [v16 modelName] : (id)kUARPDefaultDisplayNameAccessory;
    id v27 = [v23 initWithFormat:@"%@ (%@)", v24, a4];
    if (!v27) {
      goto LABEL_43;
    }
LABEL_42:
    objc_msgSend(v14, "setObject:forKeyedSubscript:", +[NSString stringWithString:](NSString, "stringWithString:", v27), @"name");

    goto LABEL_43;
  }
  BOOL v25 = v6;
  id v26 = a4;
  id v27 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "friendlyName"), "mutableCopy");
  id v28 = [v16 modelName];
  uint64_t v29 = kUARPSupportedAccessoryCaseModelNameIdentifier;
  if ([v28 containsString:kUARPSupportedAccessoryCaseModelNameIdentifier]) {
    [v27 appendFormat:@" (%@)", v29];
  }
  a4 = v26;
  BOOL v6 = v25;
  if (v27) {
    goto LABEL_42;
  }
LABEL_43:
  id v30 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "modelNumber"), "copy");
  if (v30)
  {
    uint64_t v31 = v30;
    [v14 setObject:v30 forKeyedSubscript:@"modelNumber"];
  }
  if ((objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"activeVersion"), "isEqualToString:", objc_msgSend(objc_msgSend(a5, "accessoryID"), "firmwareVersion")) & 1) == 0)
  {
    id v32 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "firmwareVersion"), "copy");
    [v14 setObject:v32 forKeyedSubscript:@"activeVersion"];
  }
  if ((objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"hwRevision"), "isEqualToString:", objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwRevision")) & 1) == 0)
  {
    id v33 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwRevision"), "copy");
    [v14 setObject:v33 forKeyedSubscript:@"hwRevision"];
  }
  if (v6 && objc_msgSend(objc_msgSend(a5, "accessoryID"), "partnerSerialNumbers"))
  {
    id v34 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "accessoryID"), "partnerSerialNumbers"), "copy");
    [v14 setObject:v34 forKeyedSubscript:@"partnerSerialNumbers"];
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(-[UARPMobileAssetManager profileAssetOverrideSettings](self, "profileAssetOverrideSettings"), "objectForKeyedSubscript:", objc_msgSend(a5, "identifier")), @"assetURLOverride");
  id v35 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v16 supportsDeveloperSettings]);
  [v14 setObject:v35 forKeyedSubscript:kUARPSupportedAccessoryKeySupportsDeveloperSettings];
  objc_msgSend(+[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase"), "addAccessoryWithSerialNumber:info:", a4, +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v14));
}

- (BOOL)performFirmwareAssetQuery:(id)a3
{
  id v5 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"%@.%@", @"com.apple.MobileAsset.UARP", [a3 identifier]);
  id v6 = +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", objc_msgSend(objc_msgSend(a3, "accessoryID"), "modelNumber"));
  char v12 = 0;
  if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"), "length")
    && objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"), "caseInsensitiveCompare:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", UARPAccessoryHardwareFusingToString())))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v14 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType");
      __int16 v15 = 2114;
      BOOL v16 = v5;
      __int16 v17 = 2114;
      id v18 = [a3 accessoryID];
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Appending hwFusingType %{public}@ to assetType %{public}@ for accessory:%{public}@", buf, 0x20u);
    }
    -[NSMutableString appendFormat:](v5, "appendFormat:", @"-%@", objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"));
  }
  if (!objc_msgSend(objc_msgSend(a3, "assetID"), "remoteURL")
    && [v6 supportsInternalSettings]
    && ([(UARPMobileAssetManager *)self updateAssetSettingsForAccessory:a3 checkForUpdate:1 automaticUpdatesDisabled:&v12]|| v12))
  {
    if (!v12) {
      return 0;
    }
    [(UARPMobileAssetManager *)self notifyFirmwareUpdateAvailabilityStatus:6 accessory:a3 downstreamAppleModelNumber:0];
  }
  else
  {
    if (objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(a3, "assetID"), "remoteURL"), "path"), "length"))
    {
      id v8 = self->_log;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = objc_msgSend(objc_msgSend(a3, "assetID"), "remoteURL");
        id v10 = [a3 accessoryID];
        *(_DWORD *)buf = 138412802;
        id v14 = v9;
        __int16 v15 = 2112;
        BOOL v16 = v5;
        __int16 v17 = 2112;
        id v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Pointing MobileAsset URL to %@, assetType %@ for accessory:%@", buf, 0x20u);
      }
      objc_msgSend(objc_msgSend(a3, "assetID"), "remoteURL");
      ASSetAssetServerURLForAssetType();
    }
    [(UARPMobileAssetManager *)self performQuery:a3 assetType:v5 supplementalAsset:0 downstreamAppleModelNumber:0];
  }
  return 1;
}

- (int64_t)performRemoteQueryForAccessory:(id)a3
{
  if (-[UARPMobileAssetManager performFirmwareAssetQuery:](self, "performFirmwareAssetQuery:"))
  {
    id v5 = +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", objc_msgSend(objc_msgSend(a3, "accessoryID"), "modelNumber"));
    if (v5)
    {
      id v6 = v5;
      -[UARPMobileAssetManager performRemoteSupplementalAssetQuery:supplementalAssets:](self, "performRemoteSupplementalAssetQuery:supplementalAssets:", a3, [v5 supplementalAssets]);
      -[UARPMobileAssetManager performRemoteDownstreamAssetQuery:appleModelNumbers:](self, "performRemoteDownstreamAssetQuery:appleModelNumbers:", a3, [v6 downstreamAppleModelNumbers]);
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Skipping supplemental/downstream asset queries this iteration", v9, 2u);
    }
  }
  return 0;
}

- (void)performQuery:(id)a3 assetType:(id)a4 supplementalAsset:(BOOL)a5 downstreamAppleModelNumber:(id)a6
{
  id v11 = [objc_alloc((Class)MAAssetQuery) initWithType:a4];
  id v12 = objc_alloc_init((Class)MADownloadOptions);
  [v12 setDiscretionary:0];
  unsigned int v13 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "downloadOnCellularAllowed");
  BOOL uarpDownloadOnCellularAllowed = 0;
  if (v13) {
    BOOL uarpDownloadOnCellularAllowed = self->_uarpDownloadOnCellularAllowed;
  }
  [v12 setAllowsCellularAccess:uarpDownloadOnCellularAllowed];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10003F4B0;
  v15[3] = &unk_10007DDD0;
  v15[4] = self;
  v15[5] = a3;
  BOOL v16 = a5;
  v15[6] = a4;
  v15[7] = v11;
  v15[8] = a6;
  +[MAAsset startCatalogDownload:a4 options:v12 then:v15];
}

- (void)notifyFirmwareUpdateAvailabilityStatus:(int64_t)a3 accessory:(id)a4 downstreamAppleModelNumber:(id)a5
{
  if (a5)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = objc_msgSend(objc_msgSend(a4, "assetID"), "downstreamAssetIDs");
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(objc_msgSend(v14, "modelNumber"), "isEqualToString:", a5))
          {
            if (v14)
            {
              objc_msgSend(objc_msgSend(objc_msgSend(a4, "assetID"), "downstreamAssetIDs"), "removeObject:", v14);
            }
            goto LABEL_13;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_13:
    id v15 = objc_msgSend(objc_msgSend(a4, "assetID"), "copy");
    [v15 restoreDefaultStatus];
    [v15 setModelNumber:a5];
  }
  else
  {
    id v15 = [a4 assetID];
  }
  [v15 setLocalURL:0];
  [v15 setDownloadStatus:0];
  [v15 setUpdateAvailabilityStatus:a3];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10003F964;
  v16[3] = &unk_10007DA38;
  v16[4] = self;
  v16[5] = a4;
  v16[6] = v15;
  v16[7] = a5;
  dispatch_async((dispatch_queue_t)[(UARPMobileAssetManager *)self delegateQueue], v16);
}

- (void)handleFirmwareAssetQueryCompletion:(id)a3 result:(int64_t)a4 forAccessory:(id)a5 downstreamAppleModelNumber:(id)a6
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    int64_t v59 = a4;
    __int16 v60 = 2112;
    id v61 = [a5 accessoryID];
    __int16 v62 = 2112;
    id v63 = a6;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "MobileAsset query status:%ld for accessory %@ / %@", buf, 0x20u);
  }
  if (!a6)
  {
    id v17 = [a5 assetID];
LABEL_19:
    id v19 = [a5 identifier];
    goto LABEL_21;
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v11 = objc_msgSend(objc_msgSend(a5, "assetID"), "downstreamAssetIDs");
  id v12 = [v11 countByEnumeratingWithState:&v53 objects:v57 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v54;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v54 != v14) {
          objc_enumerationMutation(v11);
        }
        BOOL v16 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v16, "modelNumber"), "isEqualToString:", a6))
        {
          if (v16)
          {
            objc_msgSend(objc_msgSend(objc_msgSend(a5, "assetID"), "downstreamAssetIDs"), "removeObject:", v16);
          }
          goto LABEL_15;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_15:
  id v17 = objc_msgSend(objc_msgSend(a5, "assetID"), "copy");
  [v17 restoreDefaultStatus];
  [v17 setModelNumber:a6];
  id v18 = +[UARPSupportedAccessory findByAppleModelNumber:a6];
  if ([v18 mobileAssetAppleModelNumber])
  {
    id v19 = [v18 mobileAssetAppleModelNumber];
    if (v19) {
      goto LABEL_21;
    }
    goto LABEL_19;
  }
  id v19 = a6;
LABEL_21:
  id v20 = sub_10003CF38([a5 accessoryID]);
  if (a4)
  {
    id v21 = sub_100012A00((uint64_t)v19, (uint64_t)objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"), (uint64_t)v20);
    if (v21)
    {
      id v22 = v21;
      id v23 = self->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [(NSURL *)v22 description];
        id v25 = [a5 accessoryID];
        id v26 = [v17 modelNumber];
        *(_DWORD *)buf = 138543874;
        int64_t v59 = (int64_t)v24;
        __int16 v60 = 2114;
        id v61 = v25;
        __int16 v62 = 2114;
        id v63 = v26;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Using latest asset from cache %{public}@ for accessory %{public}@ / %{public}@", buf, 0x20u);
      }
      objc_msgSend(v17, "setAssetVersion:", sub_100012BEC((uint64_t)-[NSURL path](v22, "path")));
      [v17 setLocalURL:v22];
      [v17 setDownloadStatus:1];
      [v17 setUpdateAvailabilityStatus:3];
      id v27 = [(UARPMobileAssetManager *)self delegateQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10004015C;
      block[3] = &unk_10007DA38;
      block[4] = self;
      block[5] = a5;
      block[6] = v17;
      void block[7] = a6;
      id v28 = block;
      goto LABEL_26;
    }
    goto LABEL_38;
  }
  id v29 = [a3 results];
  id v30 = self->_log;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    id v31 = [a5 accessoryID];
    *(_DWORD *)buf = 138412802;
    int64_t v59 = (int64_t)v31;
    __int16 v60 = 2112;
    id v61 = a6;
    __int16 v62 = 2112;
    id v63 = v29;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "MobileAsset query response for accessory %@ / %@: %@", buf, 0x20u);
  }
  if (!v29)
  {
LABEL_38:
    long long v43 = self;
    uint64_t v44 = 6;
LABEL_39:
    [(UARPMobileAssetManager *)v43 notifyFirmwareUpdateAvailabilityStatus:v44 accessory:a5 downstreamAppleModelNumber:a6];
    return;
  }
  id v32 = self->_log;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Mobile Asset Filtering moved to Uploader. Finding Max Asset from all the (unfiltered) assets.", buf, 2u);
  }
  id v33 = [(UARPMobileAssetManager *)self assetWithMaxVersion:v29];
  if (!v33)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100052AEC();
    }
    long long v43 = self;
    uint64_t v44 = 8;
    goto LABEL_39;
  }
  id v34 = v33;
  id v35 = sub_100012A00((uint64_t)v19, (uint64_t)objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"), (uint64_t)v20);
  if (v35)
  {
    id v36 = v35;
    id v37 = [(UARPMobileAssetManager *)self getAssetVersionForMAAsset:v34];
    BOOL v38 = sub_100012BEC((uint64_t)[(NSURL *)v36 path]);
    if ([v37 isEqualToString:v38])
    {
      [v17 setAssetVersion:v38];
      [v17 setLocalURL:v36];
      [v17 setDownloadStatus:1];
      [v17 setUpdateAvailabilityStatus:3];
      [a5 analyticsSetDownloadAvailableForAssetID:v17];
      id v39 = self->_log;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        id v40 = [(NSURL *)v36 description];
        id v41 = [a5 accessoryID];
        id v42 = [v17 modelNumber];
        *(_DWORD *)buf = 138543874;
        int64_t v59 = (int64_t)v40;
        __int16 v60 = 2114;
        id v61 = v41;
        __int16 v62 = 2114;
        id v63 = v42;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Using matching asset from cache %{public}@ for accessory %{public}@ / %{public}@", buf, 0x20u);
      }
      id v27 = [(UARPMobileAssetManager *)self delegateQueue];
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1000401B0;
      v51[3] = &unk_10007DA38;
      v51[4] = self;
      v51[5] = a5;
      v51[6] = v17;
      v51[7] = a6;
      id v28 = v51;
      goto LABEL_26;
    }
  }
  if (!a6) {
    [a5 setAsset:v34];
  }
  id v45 = objc_msgSend(objc_msgSend(v34, "attributes"), "objectForKey:", @"DeploymentList");
  if (v45) {
    [v17 processUARPDeploymentRules:v45];
  }
  objc_msgSend(v17, "setAssetVersion:", -[UARPMobileAssetManager getAssetVersionForMAAsset:](self, "getAssetVersionForMAAsset:", v34));
  long long v46 = self->_log;
  if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
  {
    id v47 = [v17 assetVersion];
    id v48 = [a5 accessoryID];
    *(_DWORD *)buf = 138412802;
    int64_t v59 = (int64_t)v47;
    __int16 v60 = 2112;
    id v61 = v48;
    __int16 v62 = 2112;
    id v63 = a6;
    _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Firmware Version %@ available on MobileAsset for accessory %@ / %@", buf, 0x20u);
  }
  [a5 analyticsSetDownloadAvailableForAssetID:v17];
  if ((objc_msgSend(objc_msgSend(a5, "accessoryID"), "autoDownloadAllowed") & 1) == 0
    && [v34 state] != (id)2)
  {
    [v17 setLocalURL:0];
    [a3 assetType];
    [v17 setRemoteURL:ASServerURLForAssetType()];
    [v17 setDownloadStatus:0];
    [v17 setUpdateAvailabilityStatus:1];
    [a5 analyticsSetDownloadConsentRequestedForAssetID:v17];
    id v27 = [(UARPMobileAssetManager *)self delegateQueue];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100040204;
    v50[3] = &unk_10007DA38;
    v50[4] = self;
    v50[5] = a5;
    v50[6] = v17;
    v50[7] = a6;
    id v28 = v50;
LABEL_26:
    dispatch_async((dispatch_queue_t)v27, v28);
    return;
  }
  [(UARPMobileAssetManager *)self downloadFirmwareForAccessory:a5 assetID:v17 mobileAsset:v34];
}

- (id)assetWithMaxVersion:(id)a3
{
  if ((unint64_t)[a3 count] <= 1)
  {
    return [a3 firstObject];
  }
  else
  {
    long long v21 = 0uLL;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    if (!v5) {
      return 0;
    }
    id v7 = v5;
    BOOL v16 = 0;
    uint64_t v8 = *(void *)v18;
    *(void *)&long long v6 = 138412546;
    long long v15 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v10, "state", v15) != (id)3)
        {
          id v11 = [(UARPMobileAssetManager *)self getAssetVersionForMAAsset:v10];
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            CFStringRef v13 = sub_100012D9C((unint64_t)[v10 state]);
            *(_DWORD *)buf = v15;
            *(void *)&uint8_t buf[4] = v11;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v13;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_INFO, "Comparing asset with version %@ / state %@", buf, 0x16u);
          }
          *(void *)buf = 0;
          *(void *)&buf[8] = 0;
          +[UARPSuperBinaryAsset versionFromString:v11 version:buf];
          if (uarpVersionCompare(&v21, buf) == 1)
          {
            long long v21 = *(_OWORD *)buf;
            BOOL v16 = v10;
          }
        }
      }
      id v7 = [a3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
    return v16;
  }
}

- (int64_t)performDownload:(id)a3 accessory:(id)a4 assetID:(id)a5 supplementalAsset:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = [a3 state];
  if (v11 == (id)1 || v11 == (id)4)
  {
    id v12 = objc_alloc_init((Class)MADownloadOptions);
    [v12 setDiscretionary:0];
    unsigned int v13 = objc_msgSend(objc_msgSend(a4, "accessoryID"), "downloadOnCellularAllowed");
    BOOL uarpDownloadOnCellularAllowed = 0;
    if (v13) {
      BOOL uarpDownloadOnCellularAllowed = self->_uarpDownloadOnCellularAllowed;
    }
    [v12 setAllowsCellularAccess:uarpDownloadOnCellularAllowed];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000405E0;
    v17[3] = &unk_10007DDA8;
    BOOL v18 = v6;
    v17[4] = self;
    v17[5] = a3;
    v17[6] = a4;
    v17[7] = a5;
    [a3 startDownload:v12 then:v17];
    goto LABEL_12;
  }
  if (v11 == (id)2)
  {
    if (v6) {
      [(UARPMobileAssetManager *)self handleSupplementalAssetDownloadCompletion:a3 result:0 forAccessory:a4];
    }
    else {
      [(UARPMobileAssetManager *)self handleMobileAssetDownloadCompletion:a3 status:0 accessory:a4 assetID:a5];
    }
    id v12 = 0;
LABEL_12:
    int64_t v15 = 0;
    goto LABEL_13;
  }
  id v12 = 0;
  int64_t v15 = 1;
LABEL_13:

  return v15;
}

- (int64_t)downloadRemoteFirmwareForAccessory:(id)a3 assetID:(id)a4 mobileAsset:(id)a5
{
  if (![a3 asset]) {
    return 4;
  }
  return [(UARPMobileAssetManager *)self performDownload:a5 accessory:a3 assetID:a4 supplementalAsset:0];
}

- (void)handleMobileAssetDownloadCompletion:(id)a3 status:(int64_t)a4 accessory:(id)a5 assetID:(id)a6
{
  id v11 = [a6 modelNumber];
  if (!v11
    || (id v12 = v11,
        v13 = +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", v11), [v13 mobileAssetAppleModelNumber])&& (id v12 = objc_msgSend(v13, "mobileAssetAppleModelNumber")) == 0)
  {
    id v12 = [a5 identifier];
  }
  id v14 = sub_10003CF38([a5 accessoryID]);
  uint64_t v15 = (uint64_t)v14;
  if (a4)
  {
    if (v14)
    {
      BOOL v16 = sub_100012A00((uint64_t)v12, (uint64_t)objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"), (uint64_t)v14);
      if (v16)
      {
        long long v17 = v16;
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v32 = (NSString *)[(NSURL *)v17 description];
          __int16 v33 = 2114;
          id v34 = [a5 accessoryID];
          __int16 v35 = 2114;
          id v36 = [a6 modelNumber];
          _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Using latest downloaded asset from cache %{public}@ for accessory %{public}@ / %{public}@", buf, 0x20u);
        }
        objc_msgSend(a6, "setAssetVersion:", sub_100012BEC((uint64_t)-[NSURL path](v17, "path")));
LABEL_21:
        [a6 setLocalURL:v17];
        [a6 setDownloadStatus:1];
        [a6 setUpdateAvailabilityStatus:3];
LABEL_22:
        -[UARPAssetManager assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:](self->_assetManager, "assetAvailabilityUpdateForAccessory:assetID:downstreamAppleModelNumber:", [a5 accessoryID], a6, objc_msgSend(a6, "modelNumber"));
        return;
      }
    }
  }
  else
  {
    id v19 = [(UARPMobileAssetManager *)self getAssetBundle:a3];
    long long v20 = (NSString *)[v19 objectForInfoDictionaryKey:@"FirmwareImageFile"];
    if (v20)
    {
      long long v21 = v20;
      id v22 = objc_msgSend(v19, "pathForResource:ofType:", -[NSString stringByDeletingPathExtension](v20, "stringByDeletingPathExtension"), -[NSString pathExtension](v20, "pathExtension"));
      if (v22)
      {
        id v23 = v22;
        id v24 = sub_100012A00((uint64_t)v12, (uint64_t)objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"), v15);
        id v25 = self->_log;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v32 = v21;
          __int16 v33 = 2112;
          id v34 = [a5 accessoryID];
          __int16 v35 = 2112;
          id v36 = [a6 modelNumber];
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Moving Firmware File %@ from MobileAsset to UARP Cache for accessory %@ / %@", buf, 0x20u);
        }
        id v26 = sub_10001241C(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v23), (uint64_t)v12, (uint64_t)objc_msgSend(objc_msgSend(a5, "accessoryID"), "hwFusingType"), objc_msgSend(a6, "assetVersion"), v15);
        if (v26)
        {
          long long v17 = v26;
          if (![(NSString *)[(NSURL *)v24 path] isEqualToString:[(NSURL *)v26 path]])
          {
            id v27 = self->_log;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              id v28 = [(NSURL *)v24 path];
              id v29 = [a5 accessoryID];
              id v30 = [a6 modelNumber];
              *(_DWORD *)buf = 138412802;
              id v32 = v28;
              __int16 v33 = 2112;
              id v34 = v29;
              __int16 v35 = 2112;
              id v36 = v30;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Deleting previously cached MobileAsset at %@ for accessory %@ / %@", buf, 0x20u);
            }
            [+[NSFileManager defaultManager] removeItemAtPath:[(NSString *)[(NSURL *)v24 path] stringByDeletingLastPathComponent] error:0];
          }
          [a5 analyticsSetDownloadCompleteForAssetID:a6 status:1];
          goto LABEL_21;
        }
      }
    }
  }
  if ((objc_msgSend(objc_msgSend(a5, "accessoryID"), "autoDownloadAllowed") & 1) == 0)
  {
    [a6 setLocalURL:0];
    [a6 setDownloadStatus:2];
    goto LABEL_22;
  }
}

- (void)performRemoteDownstreamAssetQuery:(id)a3 appleModelNumbers:(id)a4
{
  unsigned int v7 = sub_100006CB4([a3 accessoryID]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = [a4 countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v31;
    uint64_t v28 = *(void *)v31;
    do
    {
      id v11 = 0;
      id v29 = v9;
      do
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(a4);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8 * (void)v11);
        id v13 = +[UARPSupportedAccessory findByAppleModelNumber:v12];
        if (v13) {
          int v14 = v7;
        }
        else {
          int v14 = 1;
        }
        if (v14 == 1)
        {
          [(UARPMobileAssetManager *)self notifyFirmwareUpdateAvailabilityStatus:6 accessory:a3 downstreamAppleModelNumber:v12];
        }
        else
        {
          uint64_t v15 = v13;
          id v16 = [v13 mobileAssetAppleModelNumber];
          id v17 = v12;
          if (v16) {
            id v17 = [v15 mobileAssetAppleModelNumber];
          }
          BOOL v18 = +[NSMutableString stringWithFormat:@"%@.%@", @"com.apple.MobileAsset.UARP", v17];
          if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"), "length")
            && objc_msgSend(objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"), "caseInsensitiveCompare:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s", UARPAccessoryHardwareFusingToString())))
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              id v20 = objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType");
              id v21 = [a3 accessoryID];
              *(_DWORD *)buf = 138544130;
              id v36 = v20;
              __int16 v37 = 2114;
              BOOL v38 = v18;
              __int16 v39 = 2114;
              id v40 = v21;
              __int16 v41 = 2114;
              id v42 = v12;
              _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Appending hwFusingType %{public}@ to assetType %{public}@ for accessory:%{public}@ with downstream accessory:%{public}@", buf, 0x2Au);
            }
            -[NSMutableString appendFormat:](v18, "appendFormat:", @"-%@", objc_msgSend(objc_msgSend(a3, "accessoryID"), "hwFusingType"));
          }
          CFStringRef v22 = sub_10003D1B0(objc_msgSend(objc_msgSend(+[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase"), "accessoriesDictionary"), "objectForKey:", objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber")), 0);
          if (v22)
          {
            id v23 = +[NSURL URLWithString:v22];
            id v24 = self->_log;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v23;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Downstream Asset remoteURL = %@", buf, 0xCu);
            }
            if ([(NSString *)[(NSURL *)v23 path] length])
            {
              id v25 = self->_log;
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                id v26 = [a3 accessoryID];
                *(_DWORD *)buf = 138412802;
                id v36 = v23;
                __int16 v37 = 2112;
                BOOL v38 = v18;
                __int16 v39 = 2112;
                id v40 = v26;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Pointing MobileAsset URL to %@, assetType %@ for accessory:%@", buf, 0x20u);
              }
              ASSetAssetServerURLForAssetType();
            }
          }
          else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
          {
            sub_100052B80((uint64_t)v34, a3);
          }
          id v27 = self->_log;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v36 = v18;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Perform Downstream Asset query:%@", buf, 0xCu);
          }
          [(UARPMobileAssetManager *)self performQuery:a3 assetType:v18 supplementalAsset:0 downstreamAppleModelNumber:v12];
          uint64_t v10 = v28;
          id v9 = v29;
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [a4 countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v9);
  }
}

- (void)performRemoteSupplementalAssetQuery:(id)a3 supplementalAssets:(id)a4
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [a4 countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(a4);
        }
        uint64_t v10 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.MobileAsset.UARP", *(void *)(*((void *)&v18 + 1) + 8 * i)];
        CFStringRef v11 = sub_10003D1B0(objc_msgSend(objc_msgSend(+[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase"), "accessoriesDictionary"), "objectForKey:", objc_msgSend(objc_msgSend(a3, "accessoryID"), "serialNumber")), 1);
        if (v11)
        {
          id v12 = +[NSURL URLWithString:v11];
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v24 = v12;
            _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Supplemental Asset remoteURL = %@", buf, 0xCu);
          }
          if ([(NSString *)[(NSURL *)v12 path] length])
          {
            int v14 = self->_log;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              id v15 = [a3 accessoryID];
              *(_DWORD *)buf = 138412802;
              id v24 = v12;
              __int16 v25 = 2112;
              id v26 = v10;
              __int16 v27 = 2112;
              id v28 = v15;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Pointing MobileAsset URL to %@, assetType %@ for accessory:%@", buf, 0x20u);
            }
            ASSetAssetServerURLForAssetType();
          }
        }
        else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        {
          sub_100052BCC((uint64_t)v22, a3);
        }
        id v16 = self->_log;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = (NSURL *)v10;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Perform Supplemental Asset query:%@", buf, 0xCu);
        }
        [(UARPMobileAssetManager *)self performQuery:a3 assetType:v10 supplementalAsset:1 downstreamAppleModelNumber:0];
      }
      id v7 = [a4 countByEnumeratingWithState:&v18 objects:v29 count:16];
    }
    while (v7);
  }
}

- (void)handleSupplementalAssetQueryCompletion:(id)a3 result:(int64_t)a4 forAccessory:(id)a5
{
  if (a4)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100052D40();
    }
    return;
  }
  if (objc_msgSend(objc_msgSend(a3, "results"), "count"))
  {
    id v8 = -[UARPMobileAssetManager assetWithMaxVersion:](self, "assetWithMaxVersion:", [a3 results]);
    if (v8)
    {
      id v9 = v8;
      id v10 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "assetType"), "componentsSeparatedByString:", @"."), "lastObject");
      CFStringRef v11 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") contentsOfDirectoryAtURL:+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", +[NSString stringWithFormat:@"%@/%@/%@", sub_1000428C8(), @"supplementalassets", v10]) includingPropertiesForKeys:0 options:4 error:0];
      if ([(NSArray *)v11 count])
      {
        id v12 = [(UARPMobileAssetManager *)self getAssetVersionForMAAsset:v9];
        +[NSMutableArray array];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v13)
        {
          id v14 = v13;
          id v27 = v10;
          id v28 = v9;
          id v29 = (NSMutableString *)a5;
          char v30 = 0;
          uint64_t v15 = *(void *)v33;
          do
          {
            id v16 = v11;
            for (i = 0; i != v14; i = (char *)i + 1)
            {
              if (*(void *)v33 != v15) {
                objc_enumerationMutation(v16);
              }
              long long v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              long long v19 = sub_100012BEC((uint64_t)[v18 path]);
              log = self->_log;
              if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v37 = v12;
                __int16 v38 = 2112;
                __int16 v39 = v19;
                _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "SupplementalAsset version %@ available, cached version %@", buf, 0x16u);
              }
              if (sub_10002A880((uint64_t)v19, v12))
              {
                long long v31 = 0;
                if (![+[NSFileManager defaultManager] removeItemAtURL:v18 error:&v31])
                {
                  long long v21 = self->_log;
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v37 = v18;
                    __int16 v38 = 2112;
                    __int16 v39 = v31;
                    _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to clean up SupplementalAsset %@ with error %@", buf, 0x16u);
                  }
                }
              }
              else
              {
                char v30 = 1;
              }
            }
            CFStringRef v11 = v16;
            id v14 = [(NSArray *)v16 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v14);
          if (v30)
          {
            CFStringRef v22 = self->_log;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v37 = v12;
              __int16 v38 = 2112;
              __int16 v39 = v29;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Not Downloading SupplementalAsset version %@ for %@", buf, 0x16u);
            }
            [(NSMutableString *)v29 setSupplementalAssetName:v27];
            [(UARPAssetManager *)self->_assetManager supplementalAssetAvailabilityUpdateForAccessory:[(NSMutableString *)v29 accessoryID] assetName:[(NSMutableString *)v29 supplementalAssetName]];
            return;
          }
          id v9 = v28;
          a5 = v29;
        }
        id v26 = self->_log;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = v12;
          id v24 = "Downloading SupplementalAsset version %@";
          __int16 v25 = v26;
          goto LABEL_36;
        }
      }
      else
      {
        id v23 = self->_log;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = [a5 accessoryID];
          id v24 = "No cached SupplementalAsset found for accessory %@, downloading the asset available";
          __int16 v25 = v23;
LABEL_36:
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, buf, 0xCu);
        }
      }
      [(UARPMobileAssetManager *)self performDownload:v9 accessory:a5 assetID:0 supplementalAsset:1];
      return;
    }
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100052CAC();
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100052C18();
  }
}

- (void)handleSupplementalAssetDownloadCompletion:(id)a3 result:(int64_t)a4 forAccessory:(id)a5
{
  id v8 = -[UARPMobileAssetManager getAssetBundle:](self, "getAssetBundle:", a3, a4);
  if (v8)
  {
    id v9 = v8;
    id v10 = [v8 objectForInfoDictionaryKey:@"FirmwareImageFile"];
    if (v10)
    {
      id v11 = v10;
      id v12 = (NSURL *)objc_msgSend(v9, "pathForResource:ofType:", objc_msgSend(v10, "stringByDeletingPathExtension"), objc_msgSend(v10, "pathExtension"));
      id v13 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "assetType"), "componentsSeparatedByString:", @"."), "lastObject");
      id v14 = +[NSString stringWithFormat:@"%@/%@/%@/", sub_1000428C8(), @"supplementalassets", v13];
      uint64_t v15 = +[NSURL fileURLWithPath:v14];
      uint64_t v23 = 0;
      if ([(NSURL *)v15 checkResourceIsReachableAndReturnError:0]
        || [+[NSFileManager defaultManager] createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:&v23])
      {
        id v16 = +[NSURL fileURLWithPath:[(NSString *)v14 stringByAppendingPathComponent:v11]];
        if ([(NSURL *)v16 checkResourceIsReachableAndReturnError:0]
          && ![+[NSFileManager defaultManager] removeItemAtURL:v16 error:&v23])
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
            sub_100052EB8((uint64_t)v16, &v23, log);
          }
        }
        else
        {
          unsigned int v17 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") copyItemAtURL:+[NSURL fileURLWithPath:v12] toURL:v16 error:&v23];
          long long v18 = self->_log;
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            __int16 v25 = "-[UARPMobileAssetManager(Query) handleSupplementalAssetDownloadCompletion:result:forAccessory:]";
            __int16 v26 = 2112;
            id v27 = v16;
            __int16 v28 = 1024;
            *(_DWORD *)id v29 = v17;
            *(_WORD *)&v29[4] = 2112;
            *(void *)&v29[6] = v23;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: Downloaded supplemental asset at location=%@, success=%d, error=%@", buf, 0x26u);
          }
          if (v17)
          {
            [a5 setSupplementalAssetName:v13];
            -[UARPAssetManager supplementalAssetAvailabilityUpdateForAccessory:assetName:](self->_assetManager, "supplementalAssetAvailabilityUpdateForAccessory:assetName:", [a5 accessoryID], objc_msgSend(a5, "supplementalAssetName"));
          }
          else
          {
            long long v19 = self->_log;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315906;
              __int16 v25 = "-[UARPMobileAssetManager(Query) handleSupplementalAssetDownloadCompletion:result:forAccessory:]";
              __int16 v26 = 2112;
              id v27 = v12;
              __int16 v28 = 2112;
              *(void *)id v29 = v16;
              *(_WORD *)&v29[8] = 2112;
              *(void *)&v29[10] = v23;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: Failed to place supplemental asset from %@ to %@, error: %@", buf, 0x2Au);
            }
          }
        }
      }
      else
      {
        long long v20 = self->_log;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_100052F54(&v23, v20, v21);
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_100052E3C();
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    sub_100052DC0();
  }
}

- (id)getAssetVersionForMAAsset:(id)a3
{
  unsigned int v4 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"%u.%u.%u", objc_msgSend(objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", @"FirmwareVersionMajor"), "unsignedIntValue"), objc_msgSend(objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", @"FirmwareVersionMinor"), "unsignedIntValue"), objc_msgSend(objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", @"FirmwareVersionRelease"), "unsignedIntValue"));
  id v5 = objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", @"FirmwareVersionBuild");
  if (v5) {
    -[NSMutableString appendFormat:](v4, "appendFormat:", @".%u", [v5 unsignedIntValue]);
  }
  return +[NSString stringWithString:v4];
}

- (id)getAssetBundle:(id)a3
{
  id v4 = objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", @"FirmwareBundle");
  if (!v4) {
    return 0;
  }
  id v5 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "getLocalFileUrl"), "URLByAppendingPathComponent:", v4), "filePathURL");
  if (!v5) {
    return 0;
  }
  id v6 = [v5 path];
  return +[NSBundle bundleWithPath:v6];
}

@end