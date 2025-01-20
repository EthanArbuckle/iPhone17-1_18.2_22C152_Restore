@interface EAAccessoryUpdater
- (BOOL)accessoryVersionFromString:(id)a3 accyVersion:(id *)a4;
- (BOOL)consentRequired;
- (BOOL)isMultiAssetSession;
- (BOOL)isRoamingEnabled;
- (BOOL)prepareFirmwareBundlesFromDropbox:(id)a3 error:(id *)a4;
- (BOOL)setSeedParticipationStatusAndContinue;
- (BOOL)shouldUpdateBeSilent:(id)a3;
- (EAAccessoryUpdater)initWithCoder:(id)a3;
- (EAAccessoryUpdater)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6;
- (NSDictionary)initOptions;
- (NSMutableSet)seedLocations;
- (NSString)accessoryFusingType;
- (NSString)deviceClass;
- (NSString)localFilePath;
- (NSString)mobileAssetType;
- (NSURL)dropboxPath;
- (id)assetLocationForCustomBasejumperTrain:(id)a3 build:(id)a4;
- (id)assetLocationForType:(unint64_t)a3 withTrain:(id)a4;
- (id)getAssetLocation:(id)a3;
- (id)trainName;
- (int64_t)compareLongVersionString:(id *)a3 withFirmwareVersion:(id *)a4;
- (void)allowConditionalDownloadOnCellular;
- (void)applyFirmwareWithOptions:(id)a3;
- (void)bootstrapWithOptions:(id)a3;
- (void)dealloc;
- (void)downloadFirmwareWithOptions:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4;
- (void)finishWithOptions:(id)a3;
- (void)overrideUpdaterOptions;
- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5;
- (void)prepareFirmwareWithOptions:(id)a3;
- (void)setAccessoryFusingType:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceClass:(id)a3;
- (void)setDropboxPath:(id)a3;
- (void)setInitOptions:(id)a3;
- (void)setLocalFilePath:(id)a3;
- (void)setMobileAssetType:(id)a3;
- (void)setSeedLocations:(id)a3;
- (void)updateAccessoryInfoInDatabaseIfNeeded:(id)a3;
@end

@implementation EAAccessoryUpdater

- (EAAccessoryUpdater)initWithDeviceClass:(id)a3 delegate:(id)a4 info:(id *)a5 options:(id)a6
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater initWithDeviceClass:delegate:info:options:]", 122);
  v49.receiver = self;
  v49.super_class = (Class)EAAccessoryUpdater;
  v11 = [(EAAccessoryUpdater *)&v49 init];
  v12 = v11;
  if (!v11)
  {
    [MEMORY[8] log:7 format:@"Failed to init super"];
    return v12;
  }
  v11->delegate = (FudPluginDelegate *)a4;
  v11->initOptions = (NSDictionary *)a6;
  v12->deviceClass = (NSString *)a3;
  v12->localFilePath = 0;
  v12->seedLocations = 0;
  v13 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  v12->seedLocations = v13;
  [(NSMutableSet *)v13 addObject:@"https://mesu.apple.com/assets/AirPods2020AppleSeed/"];
  [(NSMutableSet *)v12->seedLocations addObject:@"https://basejumper.apple.com/AirPodsDeveloperSeed/"];
  v14 = [(NSString *)v12->deviceClass componentsSeparatedByString:@"."];
  if (!v14)
  {
    delegate = v12->delegate;
    CFStringRef v41 = @"Failed to get components from device class";
    goto LABEL_27;
  }
  v15 = v14;
  if ([(NSArray *)v14 count] <= 1)
  {
    delegate = v12->delegate;
    CFStringRef v41 = @"Invalid device class name for EA plugin type";
    goto LABEL_27;
  }
  v48 = a5;
  id v47 = [(NSArray *)v15 objectAtIndex:(char *)[(NSArray *)v15 count] - 2];
  mobileAssetType = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@.%@.EA", @"com.apple.MobileAsset.MobileAccessoryUpdate", v47];
  v17 = (NSDictionary *)copyPlistDeviceEntryFromDeviceClass(a3);
  v12->deviceOptions = v17;
  v18 = [(NSDictionary *)v17 objectForKey:@"AlternateAssetTypes"];
  v19 = v18;
  if (v18)
  {
    if ((unint64_t)[(NSMutableArray *)v18 count] >= 2)
    {
      v58 = +[NSSortDescriptor sortDescriptorWithKey:0 ascending:0 selector:"compare:"];
      v19 = (NSMutableArray *)[(NSMutableArray *)v19 sortedArrayUsingDescriptors:+[NSArray arrayWithObjects:&v58 count:1]];
    }
    v19 = +[NSMutableArray arrayWithArray:v19];
    [(NSMutableArray *)v19 addObject:mobileAssetType];
    [(FudPluginDelegate *)v12->delegate log:7, @"assetTypes = %@", v19 format];
  }
  deviceOptions = v12->deviceOptions;
  if (!deviceOptions)
  {
    delegate = v12->delegate;
    CFStringRef v41 = @"Failed to get plist entry for device class";
    goto LABEL_27;
  }
  unsigned int v21 = objc_msgSend(-[NSDictionary objectForKey:](deviceOptions, "objectForKey:", @"NeedsDeviceIdleCheck"), "BOOLValue");
  unsigned __int8 v22 = objc_msgSend(objc_msgSend(a6, "objectForKey:", @"DeviceIdleLaunch"), "BOOLValue");
  if (v21 && (v22 & 1) == 0)
  {
    delegate = v12->delegate;
    CFStringRef v41 = @"Update requires Device Idle, bailing";
    uint64_t v42 = 7;
    goto LABEL_28;
  }
  v12->silentUpdateNoUI = objc_msgSend(-[NSDictionary objectForKey:](v12->deviceOptions, "objectForKey:", @"SilentUpdateNoUI"), "BOOLValue");
  v23 = v12->deviceOptions;
  if (v23)
  {
    id v24 = objc_msgSend(-[NSDictionary objectForKey:](v23, "objectForKey:", @"skipDFUMode"), "BOOLValue");
    v25 = v12->deviceOptions;
    if (v25)
    {
      unsigned int v26 = objc_msgSend(-[NSDictionary objectForKey:](v25, "objectForKey:", @"disableByteEscaping"), "BOOLValue");
      v27 = v12->deviceOptions;
      if (v27)
      {
        id v28 = objc_msgSend(-[NSDictionary objectForKey:](v27, "objectForKey:", @"skipReconnect"), "BOOLValue");
        goto LABEL_15;
      }
    }
    else
    {
      unsigned int v26 = 0;
    }
  }
  else
  {
    unsigned int v26 = 0;
    id v24 = 0;
  }
  id v28 = 0;
LABEL_15:
  initOptions = v12->initOptions;
  if (initOptions) {
    id v30 = objc_msgSend(-[NSDictionary objectForKey:](initOptions, "objectForKey:", @"skipMinimumFirmwareVersionCheck"), "BOOLValue");
  }
  else {
    id v30 = 0;
  }
  v12->restartOnlyUI = objc_msgSend(-[NSDictionary objectForKey:](v12->deviceOptions, "objectForKey:", @"RestartRequiresUIOnly"), "BOOLValue");
  if (v19)
  {
    v31 = (NSString *)[(NSMutableArray *)v19 firstObject];
    v12->mobileAssetType = v31;
    [(NSMutableArray *)v19 removeObject:v31];
    mobileAssetType = v12->mobileAssetType;
  }
  else
  {
    v12->mobileAssetType = mobileAssetType;
  }
  [(FudPluginDelegate *)v12->delegate log:5, @"Initializing EA Updater plugin for deviceClass:%@ asset-name:%@ skipDFU:%d skipByteEscape:%d skipVersionCheck:%d", a3, mobileAssetType, v24, v26, v30 format];
  v32 = [[EAFirmwareUpdater alloc] initWithDeviceClass:a3 assetType:v12->mobileAssetType skipDFU:v24 byteEscape:v26 ^ 1 skipReconnect:v28 skipVersionCheck:v30 options:v12->deviceOptions serialNum:[(NSDictionary *)v12->initOptions objectForKeyedSubscript:@"SerialNumber"]];
  v12->firmwareUpdater = v32;
  if (!v32)
  {
    delegate = v12->delegate;
    deviceClass = v12->deviceClass;
    v46 = v12->mobileAssetType;
    CFStringRef v41 = @"Failed to create EAFirmwareUpdater for deviceClass:%@ assetType:%@";
LABEL_27:
    uint64_t v42 = 3;
LABEL_28:
    -[FudPluginDelegate log:format:](delegate, "log:format:", v42, v41, deviceClass, v46);
    return 0;
  }
  v33 = v32;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v34 = v12->deviceOptions;
    v35 = [(EAFirmwareUpdater *)v33 accessory];
    *(_DWORD *)buf = 136315650;
    v53 = "-[EAAccessoryUpdater initWithDeviceClass:delegate:info:options:]";
    __int16 v54 = 2112;
    v55 = v34;
    __int16 v56 = 2112;
    v57 = v35;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: deviceOptions: %@, firmwareUpdater accessory: %@", buf, 0x20u);
  }
  id v36 = [(NSDictionary *)v12->initOptions objectForKeyedSubscript:@"DeviceClass"];
  id v37 = [(NSDictionary *)v12->deviceOptions objectForKey:@"NeedsAUDeveloperSettings"];
  if (v36)
  {
    id v38 = copyPlistDeviceEntryFromDeviceClass(v36);
    id v39 = [v38 objectForKey:@"NeedsAUDeveloperSettings"];

    if (!v39) {
      goto LABEL_32;
    }
    goto LABEL_30;
  }
  if (v37)
  {
LABEL_30:
    if (![(EAFirmwareUpdater *)v12->firmwareUpdater accessory]
      || [(EAAccessoryUpdater *)v12 setSeedParticipationStatusAndContinue])
    {
      goto LABEL_32;
    }
    return 0;
  }
LABEL_32:
  [(EAFirmwareUpdater *)v12->firmwareUpdater setAlternateAssetTypes:v19];
  if ([(NSDictionary *)v12->deviceOptions objectForKey:@"MultipleManifests"]) {
    [(EAFirmwareUpdater *)v12->firmwareUpdater setManifestIDs:[(NSDictionary *)v12->deviceOptions objectForKey:@"MultipleManifests"]];
  }
  if (objc_msgSend(-[NSDictionary objectForKey:](v12->deviceOptions, "objectForKey:", @"ExcludeUniqueAccessoryCheck"), "BOOLValue"))-[EAFirmwareUpdater setExcludeUniqueAccessoryCheck:](v12->firmwareUpdater, "setExcludeUniqueAccessoryCheck:", 1); {
  [(EAFirmwareUpdater *)v12->firmwareUpdater setOverrideFile:@"/var/db/accessoryupdater/ea_updater_override.plist"];
  }
  if (MGGetBoolAnswer())
  {
    v43 = +[NSURL URLWithString:](NSURL, "URLWithString:", [@"/var/db/accessoryupdater/" stringByAppendingPathComponent:v47]);
    v12->dropboxPath = v43;
    [(FudPluginDelegate *)v12->delegate log:7, @"Default Dropbox Path: %@", v43 format];
  }
  if ([(EAFirmwareUpdater *)v12->firmwareUpdater overrideProtocol]) {
    [(EAAccessoryUpdater *)v12 overrideUpdaterOptions];
  }
  [(EAAccessoryUpdater *)v12 allowConditionalDownloadOnCellular];
  v50[0] = @"PrepareWeight";
  v50[1] = @"ApplyWeight";
  v51[0] = &off_10002B990;
  v51[1] = &off_10002B9A8;
  v50[2] = @"FinishWeight";
  v50[3] = @"AccessoryIdentifier";
  v51[2] = &off_10002B990;
  v51[3] = v47;
  id *v48 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:4];
  return v12;
}

- (void)dealloc
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater dealloc]", 316);

  v3.receiver = self;
  v3.super_class = (Class)EAAccessoryUpdater;
  [(EAAccessoryUpdater *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  self->delegate = (FudPluginDelegate *)a3;
}

- (BOOL)isMultiAssetSession
{
  return [(EAFirmwareUpdater *)self->firmwareUpdater isMultiAssetSession];
}

- (void)bootstrapWithOptions:(id)a3
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater bootstrapWithOptions:]", 347);
  delegate = self->delegate;
  [(FudPluginDelegate *)delegate didBootstrap:1 info:0 error:0];
}

- (BOOL)setSeedParticipationStatusAndContinue
{
  objc_super v3 = [(EAAccessory *)[(EAFirmwareUpdater *)self->firmwareUpdater accessory] protocolStrings];
  v4 = [(EAAccessory *)[(EAFirmwareUpdater *)self->firmwareUpdater accessory] name];
  v5 = [(EAAccessory *)[(EAFirmwareUpdater *)self->firmwareUpdater accessory] serialNumber];
  if (v4) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    return 1;
  }
  v7 = v5;
  id v30 = v4;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = [(NSArray *)v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v8)
  {
    unsigned int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    unint64_t v11 = 1;
    goto LABEL_19;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v32;
  unint64_t v11 = 1;
  v29 = v7;
  while (2)
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v32 != v10) {
        objc_enumerationMutation(v3);
      }
      v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      unsigned int v14 = [v13 containsString:@"dev"];
      if (v14)
      {
        unint64_t v11 = 0;
LABEL_18:
        int v15 = v14 ^ 1;
        int v16 = 1;
        v7 = v29;
        goto LABEL_19;
      }
      if ([v13 containsString:@"insec"])
      {
        unint64_t v11 = 2;
        goto LABEL_18;
      }
    }
    id v9 = [(NSArray *)v3 countByEnumeratingWithState:&v31 objects:v35 count:16];
    unsigned int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    v7 = v29;
    if (v9) {
      continue;
    }
    break;
  }
LABEL_19:
  int v17 = v15;
  self->_accessoryFusingType = +[NSString stringWithUTF8String:AUDeveloperSettingsAccessoryFusingTypeToString(v11)];
  id v18 = +[AUDeveloperSettingsDatabase sharedDatabase];
  id v19 = objc_msgSend(objc_msgSend(objc_msgSend(v18, "accessoriesDictionary"), "objectForKey:", v7), "mutableCopy");
  if (v19)
  {
    v20 = v19;
    if (objc_msgSend(objc_msgSend(v19, "objectForKeyedSubscript:", @"isOTADisabled"), "BOOLValue"))
    {
      [(FudPluginDelegate *)self->delegate log:5, @"Entry found in AUDeveloperSettingsDatabase Accessory:%@ with OTA Update disabled, not attempting update", v30 format];
      return 0;
    }
    id v24 = [(EAAccessoryUpdater *)self getAssetLocation:v20];
    [(FudPluginDelegate *)self->delegate log:5, @"Entry found in AUDeveloperSettingsDatabase Accessory:%@ assetLocation:%@", v30, v24 format];
    if (!-[NSString isEqualToString:](v30, "isEqualToString:", [v20 objectForKeyedSubscript:@"name"]))
    {
      [(FudPluginDelegate *)self->delegate log:6, @"Updating name of accessory in AUDeveloperSettingsDatabase to %@", v30 format];
      objc_msgSend(v20, "setObject:forKeyedSubscript:", -[NSString copy](v30, "copy"), @"name");
    }
    if (!v24)
    {
      int v25 = MGGetBoolAnswer();
      BOOL v26 = (v16 & v25) == 0;
      if ((v16 & v25) != 0) {
        unint64_t v27 = 0;
      }
      else {
        unint64_t v27 = 2;
      }
      if (v26) {
        CFStringRef v28 = @"No asset location found for %@, defaulting to Customer (Mesu) for customer build or prod fused accessory";
      }
      else {
        CFStringRef v28 = @"No asset location found for %@, defaulting to Livability for internal builds and non-prod accessory";
      }
      objc_msgSend(v20, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", AUDeveloperSettingsURLTypeToString(v27)), @"assetLocation");
      -[FudPluginDelegate log:format:](self->delegate, "log:format:", 6, v28, v30);
    }
    [v20 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SupportsDeveloperSettings"];
    [(EAAccessoryUpdater *)self updateAccessoryInfoInDatabaseIfNeeded:v20];
  }
  else
  {
    id v22 = +[NSMutableDictionary dictionary];
    objc_msgSend(v22, "setObject:forKeyedSubscript:", -[NSString copy](v30, "copy"), @"name");
    [v22 setObject:self->_accessoryFusingType forKeyedSubscript:@"fusing"];
    objc_msgSend(v22, "setObject:forKeyedSubscript:", -[NSString copy](-[EAAccessory firmwareRevision](-[EAFirmwareUpdater accessory](self->firmwareUpdater, "accessory"), "firmwareRevision"), "copy"), @"activeVersion");
    objc_msgSend(v22, "setObject:forKeyedSubscript:", -[NSString copy](-[EAAccessory modelNumber](-[EAFirmwareUpdater accessory](self->firmwareUpdater, "accessory"), "modelNumber"), "copy"), @"modelNumber");
    objc_msgSend(v22, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", AUDeveloperSettingsURLTypeToString(2uLL)), @"assetLocation");
    [v22 setObject:&__kCFBooleanTrue forKeyedSubscript:@"SupportsDeveloperSettings"];
    int v23 = MGGetBoolAnswer();
    if ((v14 | v17) == 1 && v23) {
      objc_msgSend(v22, "setObject:forKeyedSubscript:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", AUDeveloperSettingsURLTypeToString(0)), @"assetLocation");
    }
    id v24 = [(EAAccessoryUpdater *)self getAssetLocation:v22];
    objc_msgSend(v18, "addAccessoryWithSerialNumber:info:", v7, +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v22));
    [(FudPluginDelegate *)self->delegate log:5, @"Added Entry for %@ in AUDeveloperSettingsDatabase %@", v30, v18 format];
  }
  [(EAFirmwareUpdater *)self->firmwareUpdater setAssetLocationOverride:+[NSURL URLWithString:v24]];
  return 1;
}

- (id)getAssetLocation:(id)a3
{
  uint64_t v5 = AUDeveloperSettingsURLStringToType([a3 objectForKeyedSubscript:@"assetLocation"]);
  if (v5 == 5)
  {
    id v6 = [a3 objectForKeyedSubscript:@"basejumperTrain"];
    id v7 = [a3 objectForKeyedSubscript:@"basejumperBuild"];
    return [(EAAccessoryUpdater *)self assetLocationForCustomBasejumperTrain:v6 build:v7];
  }
  else
  {
    uint64_t v8 = v5;
    if ([a3 objectForKeyedSubscript:@"basejumperBuild"]) {
      id v9 = 0;
    }
    else {
      id v9 = [a3 objectForKeyedSubscript:@"basejumperTrain"];
    }
    return [(EAAccessoryUpdater *)self assetLocationForType:v8 withTrain:v9];
  }
}

- (void)updateAccessoryInfoInDatabaseIfNeeded:(id)a3
{
  uint64_t v5 = [(EAAccessory *)[(EAFirmwareUpdater *)self->firmwareUpdater accessory] name];
  id v6 = [(EAAccessory *)[(EAFirmwareUpdater *)self->firmwareUpdater accessory] firmwareRevision];
  id v7 = [(EAAccessory *)[(EAFirmwareUpdater *)self->firmwareUpdater accessory] modelNumber];
  id v8 = [a3 mutableCopy];
  if ((objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"name"), "isEqualToString:", v5) & 1) == 0) {
    [v8 setObject:v5 forKeyedSubscript:@"name"];
  }
  if ((objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"activeVersion"), "isEqualToString:", v6) & 1) == 0)objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, @"activeVersion"); {
  if ((objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"modelNumber"), "isEqualToString:", v7) & 1) == 0)objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, @"modelNumber");
  }
  if ((objc_msgSend(objc_msgSend(a3, "objectForKeyedSubscript:", @"fusing"), "isEqualToString:", self->_accessoryFusingType) & 1) == 0)objc_msgSend(v8, "setObject:forKeyedSubscript:", self->_accessoryFusingType, @"fusing"); {
  objc_msgSend(+[AUDeveloperSettingsDatabase sharedDatabase](AUDeveloperSettingsDatabase, "sharedDatabase"), "addAccessoryWithSerialNumber:info:", -[EAAccessory serialNumber](-[EAFirmwareUpdater accessory](self->firmwareUpdater, "accessory"), "serialNumber"), +[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v8));
  }
}

- (id)assetLocationForCustomBasejumperTrain:(id)a3 build:(id)a4
{
  return +[NSString stringWithFormat:@"%@/%@/%@%@", getURLForAssetURLType(4), a3, a3, a4];
}

- (id)assetLocationForType:(unint64_t)a3 withTrain:(id)a4
{
  uint64_t v5 = 0;
  switch(a3)
  {
    case 0uLL:
      id v6 = a4;
      if (![a4 length]) {
        id v6 = [(EAAccessoryUpdater *)self trainName];
      }
      URLForAssetURLType = +[NSString stringWithFormat:@"%@/%@", getURLForAssetURLType(0), v6];
      goto LABEL_12;
    case 1uLL:
      URLForAssetURLType = +[NSString stringWithFormat:@"%@/MarimbaSeed", getURLForAssetURLType(0), v10];
      goto LABEL_12;
    case 2uLL:
      uint64_t v8 = 2;
      goto LABEL_11;
    case 3uLL:
      URLForAssetURLType = +[NSString stringWithFormat:@"%@/AirPods2022Seed", getURLForAssetURLType(2), v10];
      goto LABEL_12;
    case 4uLL:
      uint64_t v8 = 4;
      goto LABEL_11;
    case 6uLL:
      uint64_t v8 = 6;
LABEL_11:
      URLForAssetURLType = getURLForAssetURLType(v8);
LABEL_12:
      uint64_t v5 = URLForAssetURLType;
      break;
    default:
      break;
  }
  [(FudPluginDelegate *)self->delegate log:7, @"Selected location: %@", v5 format];
  return v5;
}

- (id)trainName
{
  if (qword_10002F9E0 != -1) {
    dispatch_once(&qword_10002F9E0, &stru_100025490);
  }
  if (qword_10002F9E8) {
    return +[NSString stringWithFormat:@"%s", qword_10002F9E8];
  }
  else {
    return 0;
  }
}

- (BOOL)accessoryVersionFromString:(id)a3 accyVersion:(id *)a4
{
  if (!a4) {
    return 0;
  }
  id v5 = [a3 componentsSeparatedByString:@"."];
  if ((unint64_t)[v5 count] < 4) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 3), "intValue");
  }
  a4->var3 = v6;
  if ((unint64_t)[v5 count] < 3) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 2), "intValue");
  }
  a4->var2 = v7;
  if ((unint64_t)[v5 count] < 2) {
    unint64_t v8 = 0;
  }
  else {
    unint64_t v8 = objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 1), "intValue");
  }
  a4->var1 = v8;
  id v9 = [v5 count];
  BOOL v10 = v9 != 0;
  if (v9) {
    unint64_t v11 = objc_msgSend(objc_msgSend(v5, "objectAtIndex:", 0), "intValue");
  }
  else {
    unint64_t v11 = 0;
  }
  a4->var0 = v11;
  return v10;
}

- (int64_t)compareLongVersionString:(id *)a3 withFirmwareVersion:(id *)a4
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater compareLongVersionString:withFirmwareVersion:]", 670);
  if (a4->var0 > a3->var0) {
    goto LABEL_6;
  }
  if (a4->var0 < a3->var0) {
    goto LABEL_8;
  }
  unint64_t var1 = a4->var1;
  unint64_t v8 = a3->var1;
  if (var1 > v8)
  {
LABEL_6:
    int64_t v11 = -1;
    goto LABEL_9;
  }
  if (var1 < v8) {
    goto LABEL_8;
  }
  unint64_t var2 = a4->var2;
  unint64_t v10 = a3->var2;
  if (var2 > v10) {
    goto LABEL_6;
  }
  if (var2 < v10)
  {
LABEL_8:
    int64_t v11 = 1;
    goto LABEL_9;
  }
  unint64_t var3 = a4->var3;
  unint64_t v14 = a3->var3;
  BOOL v15 = var3 > v14;
  BOOL v16 = var3 < v14;
  if (v15) {
    int64_t v11 = -1;
  }
  else {
    int64_t v11 = v16;
  }
LABEL_9:
  [(FudPluginDelegate *)self->delegate log:6, @"Comparing Result: %ld, AccessoryVersion: %lld.%lld.%lld.%lld FirmwareVersion: %lld.%lld.%lld.%lld", v11, a3->var0, a3->var1, a3->var2, a3->var3, a4->var0, a4->var1, a4->var2, a4->var3 format];
  return v11;
}

- (BOOL)prepareFirmwareBundlesFromDropbox:(id)a3 error:(id *)a4
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater prepareFirmwareBundlesFromDropbox:error:]", 720);
  unint64_t v6 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", NSURLIsDirectoryKey, NSURLLocalizedNameKey, 0);
  if (!MGGetBoolAnswer())
  {
    CFStringRef v14 = @"Not Applicable.";
    goto LABEL_15;
  }
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"%s: attempting to use files from dropbox: %@", "-[EAAccessoryUpdater prepareFirmwareBundlesFromDropbox:error:]", self->dropboxPath);
  unint64_t v7 = [(EAFirmwareUpdater *)self->firmwareUpdater currentFirmwareVersionOnAcc];
  long long v30 = 0u;
  long long v31 = 0u;
  if (![(EAAccessoryUpdater *)self accessoryVersionFromString:v7 accyVersion:&v30])
  {
    CFStringRef v14 = @"Accessory Firmware Version Reading Error";
    goto LABEL_15;
  }
  [a3 setObject:v7 forKey:@"existingFWVersionOnAccessory"];
  id v8 = [(NSArray *)[+[NSFileManager defaultManager] contentsOfDirectoryAtURL:self->dropboxPath includingPropertiesForKeys:v6 options:4 error:0] mutableCopy];
  [v8 sortUsingComparator:&stru_1000254D0];
  if (![v8 count])
  {
    CFStringRef v14 = @"No Firmware Bundle Is Available";
LABEL_15:
    if (!a4) {
      return 0;
    }
    NSErrorUserInfoKey v32 = NSLocalizedDescriptionKey;
    CFStringRef v33 = v14;
    BOOL v15 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.EAAccessoryUpdater", -1, +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1]);
    BOOL result = 0;
    *a4 = v15;
    return result;
  }
  [(FudPluginDelegate *)self->delegate log:5, @"Firmware Bundles (In Descending Oder):%@", v8 format];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (!v9)
  {
LABEL_13:
    [(FudPluginDelegate *)self->delegate log:5, @"Using firmware bundle in dropbox: %@", 0 format];
LABEL_14:
    CFStringRef v14 = @"No Firmware Bundle Is Available, either the folder name is incorrect or no firmware bundle has higher firmware version.";
    goto LABEL_15;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v27;
LABEL_6:
  uint64_t v12 = 0;
  while (1)
  {
    if (*(void *)v27 != v11) {
      objc_enumerationMutation(v8);
    }
    v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
    uint64_t v25 = 0;
    [v13 getResourceValue:&v25 forKey:NSURLLocalizedNameKey error:0];
    long long v23 = 0u;
    long long v24 = 0u;
    if ([(EAAccessoryUpdater *)self accessoryVersionFromString:v25 accyVersion:&v23])
    {
      [(FudPluginDelegate *)self->delegate log:6, @"Checking firmware bundle: %@", v13 format];
      v22[0] = v30;
      v22[1] = v31;
      v21[0] = v23;
      v21[1] = v24;
      if ([(EAAccessoryUpdater *)self compareLongVersionString:v22 withFirmwareVersion:v21] == -1)break; {
    }
      }
    if (v10 == (id)++v12)
    {
      id v10 = [v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v10) {
        goto LABEL_6;
      }
      goto LABEL_13;
    }
  }
  [a3 setObject:v25 forKey:@"newFWVersion"];
  [(FudPluginDelegate *)self->delegate log:5, @"Using firmware bundle in dropbox: %@", v13 format];
  if (!v13) {
    goto LABEL_14;
  }
  int v17 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") contentsOfDirectoryAtURL:+[NSURL URLWithString:@"FirmwareImage" relativeToURL:v13] includingPropertiesForKeys:v6 options:4 error:0];
  if (![(NSArray *)v17 count])
  {
    CFStringRef v14 = @"Cannot locate available firmware files";
    goto LABEL_15;
  }
  id v18 = [+[NSFileManager defaultManager](NSFileManager, "defaultManager") contentsOfDirectoryAtURL:+[NSURL URLWithString:@"BuildManifest" relativeToURL:v13] includingPropertiesForKeys:v6 options:4 error:0];
  if ([(NSArray *)v18 count])
  {
    [(FudPluginDelegate *)self->delegate log:5, @"Using BuildManifest: %@", [(NSArray *)v18 objectAtIndex:0] format];
    id v19 = +[NSDictionary dictionaryWithContentsOfURL:[(NSArray *)v18 objectAtIndex:0]];
    if (!v19)
    {
      CFStringRef v14 = @"Failed to Read from Build Manifest";
      goto LABEL_15;
    }
  }
  else
  {
    id v19 = 0;
  }
  [(EAFirmwareUpdater *)self->firmwareUpdater setFirmwareURL:[(NSArray *)v17 objectAtIndex:0] withManifest:v19 signature:0 certificate:0 hash:0];
  return 1;
}

- (void)findFirmwareWithOptions:(id)a3 remote:(BOOL)a4
{
  BOOL v4 = a4;
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]", 839);
  id v7 = +[NSMutableDictionary dictionary];
  unsigned int v8 = [(EAAccessoryUpdater *)self consentRequired];
  deviceClass = [(EAFirmwareUpdater *)self->firmwareUpdater name];
  if (self->restartOnlyUI) {
    objc_msgSend(v7, "setObject:forKey:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), @"SilentUpdateNoUI");
  }
  if ([(EAFirmwareUpdater *)self->firmwareUpdater accessory])
  {
    if ([(EAFirmwareUpdater *)self->firmwareUpdater isMultiAssetSession])
    {
      -[FudPluginDelegate log:format:](self->delegate, "log:format:", 3, @"%s: multi asset session - find NOP %@", "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]", self->deviceClass);
LABEL_11:
      delegate = self->delegate;
      uint64_t v13 = 1;
      id v14 = v7;
LABEL_12:
      uint64_t v15 = 1;
LABEL_13:
      uint64_t v11 = 0;
      goto LABEL_14;
    }
    if (!a3) {
      goto LABEL_54;
    }
    if ([a3 objectForKeyedSubscript:@"FirmwareBundle"])
    {
      -[EAFirmwareUpdater setFirmwareBundle:](self->firmwareUpdater, "setFirmwareBundle:", [a3 objectForKeyedSubscript:@"FirmwareBundle"]);
      goto LABEL_11;
    }
    if ([a3 objectForKey:@"LocalFWImage"])
    {
      id v16 = [a3 objectForKey:@"LocalFWImage"];
      id v17 = [a3 objectForKey:@"LocalBuildManifest"];
      id v18 = [a3 objectForKey:@"LocalSignature"];
      id v19 = [a3 objectForKey:@"LocalCertificate"];
      id v31 = [a3 objectForKey:@"LocalHash"];
      -[FudPluginDelegate log:format:](self->delegate, "log:format:", 6, @"%s: local files fw=%@ manifest=%@ signature=%@ certificate=%@", "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]", v16, v17, v18, v19);
      if (![+[NSFileManager defaultManager](NSFileManager, "defaultManager") fileExistsAtPath:v16]|| v17&& ![+[NSFileManager defaultManager] fileExistsAtPath:v17])
      {
        goto LABEL_7;
      }
      long long v30 = +[NSDictionary dictionaryWithContentsOfFile:v17];
      v20 = +[NSData dataWithContentsOfFile:v18];
      unsigned int v21 = +[NSData dataWithContentsOfFile:v19];
      id v22 = v21;
      if (!v18 || v20)
      {
        if (!v19 || v21)
        {
          if (v31)
          {
            long long v29 = +[NSData dataWithContentsOfFile:v31 options:1 error:0];
            if (!v29)
            {
              -[FudPluginDelegate log:format:](self->delegate, "log:format:", 3, @"%s: Can not open hash file (%@)", "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]", v31);
              goto LABEL_7;
            }
          }
          else
          {
            long long v29 = 0;
          }
          if (v16 && (!v17 || v30))
          {
            [(EAFirmwareUpdater *)self->firmwareUpdater setFirmwareURL:+[NSURL fileURLWithPath:v16] withManifest:v30 signature:v20 certificate:v22 hash:v29];
            goto LABEL_11;
          }
        }
        else
        {
          -[FudPluginDelegate log:format:](self->delegate, "log:format:", 3, @"%s: Can not open certificate file (%@)", "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]", v19);
        }
      }
      else
      {
        -[FudPluginDelegate log:format:](self->delegate, "log:format:", 3, @"%s: Can not open signature file (%@)", "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]", v18);
      }
    }
    else
    {
LABEL_54:
      if (MGGetBoolAnswer()
        && self->dropboxPath
        && [+[NSFileManager defaultManager] fileExistsAtPath:[(NSURL *)self->dropboxPath path]])
      {
        uint64_t v34 = 0;
        BOOL v23 = [(EAAccessoryUpdater *)self prepareFirmwareBundlesFromDropbox:v7 error:&v34];
        [(FudPluginDelegate *)self->delegate didFind:v23 info:v7 updateAvailable:v23 needsDownload:0 error:v34];
        return;
      }
      if (!self->localFilePath)
      {
        if (v8)
        {
          if ([(EAFirmwareUpdater *)self->firmwareUpdater serialNumber])
          {
            long long v27 = +[NSString stringWithFormat:@"%@%@/%@", @"/var/run/fud/seed/", [(EAFirmwareUpdater *)self->firmwareUpdater modelNumber], [(EAFirmwareUpdater *)self->firmwareUpdater serialNumber]];
            if (v27)
            {
              if ([+[NSURL fileURLWithPath:v27] checkResourceIsReachableAndReturnError:0])
              {
                -[FudPluginDelegate log:format:](self->delegate, "log:format:", 7, @"%s: User previously declined update for this accessory %@ (%@), ignoring this update", "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]", self->deviceClass, [(EAFirmwareUpdater *)self->firmwareUpdater serialNumber]);
                delegate = self->delegate;
                uint64_t v13 = 0;
                id v14 = 0;
                uint64_t v15 = 0;
                goto LABEL_13;
              }
            }
          }
          if (![(NSString *)deviceClass length])
          {
            -[FudPluginDelegate log:format:](self->delegate, "log:format:", 7, @"%s: Accessory name unavailable for %@, using deviceClass", "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]", self->deviceClass);
            deviceClass = self->deviceClass;
          }
        }
        firmwareUpdater = self->firmwareUpdater;
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100012600;
        v32[3] = &unk_1000254F8;
        char v33 = v8;
        v32[4] = self;
        v32[5] = deviceClass;
        [(EAFirmwareUpdater *)firmwareUpdater findAsset:v4 completion:v32];
        return;
      }
      unsigned int v24 = [+[NSFileManager defaultManager] fileExistsAtPath:self->localFilePath];
      uint64_t v25 = self->delegate;
      localFilePath = self->localFilePath;
      if (v24)
      {
        -[FudPluginDelegate log:format:](v25, "log:format:", 5, @"%s: attempting to use file from dropbox: %@", "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]", localFilePath);
        [(EAFirmwareUpdater *)self->firmwareUpdater setFirmwareLocalURL:+[NSURL fileURLWithPath:self->localFilePath]];
        delegate = self->delegate;
        uint64_t v13 = 1;
        id v14 = 0;
        goto LABEL_12;
      }
      -[FudPluginDelegate log:format:](v25, "log:format:", 3, @"%s: invalid dropbox provided: %@", "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]", localFilePath);
    }
  }
  else
  {
    -[FudPluginDelegate log:format:](self->delegate, "log:format:", 3, @"%s: No EA Accessory info for %@", "-[EAAccessoryUpdater findFirmwareWithOptions:remote:]", self->deviceClass);
  }
LABEL_7:
  id v10 = self->delegate;
  uint64_t v11 = +[NSError errorWithDomain:@"com.apple.EAAccessoryUpdater" code:-1 userInfo:0];
  delegate = v10;
  uint64_t v13 = 0;
  id v14 = 0;
  uint64_t v15 = 0;
LABEL_14:
  [(FudPluginDelegate *)delegate didFind:v13 info:v14 updateAvailable:v15 needsDownload:0 error:v11];
}

- (void)downloadFirmwareWithOptions:(id)a3
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater downloadFirmwareWithOptions:]", 1118);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3052000000;
  v8[3] = sub_100012A00;
  v8[4] = sub_100012A10;
  v8[5] = 0;
  unsigned __int8 v4 = [(EAAccessoryUpdater *)self consentRequired];
  if ([(EAFirmwareUpdater *)self->firmwareUpdater isMultiAssetSession])
  {
    -[FudPluginDelegate log:format:](self->delegate, "log:format:", 3, @"%s: multi asset session - download NOP %@", "-[EAAccessoryUpdater downloadFirmwareWithOptions:]", self->deviceClass);
    [(FudPluginDelegate *)self->delegate didDownload:1 info:0 error:0];
  }
  else
  {
    firmwareUpdater = self->firmwareUpdater;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100012A1C;
    v6[3] = &unk_100025520;
    unsigned __int8 v7 = v4;
    v6[4] = self;
    v6[5] = v8;
    [(EAFirmwareUpdater *)firmwareUpdater downloadAsset:v6];
  }
  _Block_object_dispose(v8, 8);
}

- (void)personalizationResponse:(id)a3 response:(id)a4 status:(id)a5
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater personalizationResponse:response:status:]", 1163);
  firmwareUpdater = self->firmwareUpdater;
  [(EAFirmwareUpdater *)firmwareUpdater personalizationResponse:a4 error:a5];
}

- (void)prepareFirmwareWithOptions:(id)a3
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater prepareFirmwareWithOptions:]", 1176);
  delegate = self->delegate;
  [(FudPluginDelegate *)delegate didPrepare:1 info:0 error:0];
}

- (void)applyFirmwareWithOptions:(id)a3
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater applyFirmwareWithOptions:]", 1185);
  firmwareUpdater = self->firmwareUpdater;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100012DB4;
  v8[3] = &unk_100025548;
  v8[4] = self;
  v6[4] = self;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012E24;
  v7[3] = &unk_100025570;
  v7[4] = self;
  v5[4] = self;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100012EB4;
  v6[3] = &unk_100025598;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012F78;
  v5[3] = &unk_1000255C0;
  [(EAFirmwareUpdater *)firmwareUpdater applyFirmware:v8 progress:v7 update:v6 personalization:v5];
}

- (void)finishWithOptions:(id)a3
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater finishWithOptions:]", 1241);
  [(EAFirmwareUpdater *)self->firmwareUpdater isRestartRequired];
  [(EAFirmwareUpdater *)self->firmwareUpdater isSleepWakeRequired];
  [(EAFirmwareUpdater *)self->firmwareUpdater isUrgentUpdate];
  if ([(EAAccessoryUpdater *)self consentRequired]) {
    [(EAFirmwareUpdater *)self->firmwareUpdater purgeAsset];
  }
  delegate = self->delegate;
  if (self->restartOnlyUI) {
    id v5 = &__NSDictionary0__struct;
  }
  else {
    id v5 = 0;
  }
  [(FudPluginDelegate *)delegate didFinish:1 info:v5 error:0];
}

- (BOOL)shouldUpdateBeSilent:(id)a3
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater shouldUpdateBeSilent:]", 1268);
  firmwareUpdater = self->firmwareUpdater;
  return [(EAFirmwareUpdater *)firmwareUpdater forceSilentUpdate];
}

- (BOOL)consentRequired
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v3 = [(EAFirmwareUpdater *)self->firmwareUpdater assetLocation];
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 7, @"%s: asset Location %@", "-[EAAccessoryUpdater consentRequired]", v3);
  if (v3 && [(NSMutableSet *)self->seedLocations count])
  {
    seedLocations = self->seedLocations;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100013230;
    v7[3] = &unk_1000255E8;
    v7[4] = v3;
    void v7[5] = self;
    v7[6] = &v8;
    [(NSMutableSet *)seedLocations enumerateObjectsUsingBlock:v7];
    BOOL v5 = *((unsigned char *)v9 + 24) != 0;
  }
  else
  {
    BOOL v5 = 0;
    *((unsigned char *)v9 + 24) = 0;
  }
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)overrideUpdaterOptions
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater overrideUpdaterOptions]", 1314);
  id v3 = copyPlistDeviceEntryFromDeviceClass(self->deviceClass);
  if (v3)
  {
    if ([v3 objectForKey:@"closeEASession"]) {
      -[EAFirmwareUpdater setCloseEASession:](self->firmwareUpdater, "setCloseEASession:", objc_msgSend(objc_msgSend(v3, "objectForKey:", @"closeEASession"), "BOOLValue"));
    }
    if ([v3 objectForKey:@"dropboxPath"]) {
      self->localFilePath = (NSString *)[v3 objectForKey:@"dropboxPath"];
    }
  }
}

- (void)allowConditionalDownloadOnCellular
{
  deviceOptions = self->deviceOptions;
  if (deviceOptions
    && objc_msgSend(-[NSDictionary objectForKey:](deviceOptions, "objectForKey:", @"NeedsMADownloadOnCellular"), "BOOLValue")&& ((MGGetBoolAnswer() & 1) != 0 || !-[EAAccessoryUpdater isRoamingEnabled](self, "isRoamingEnabled")))
  {
    -[FudPluginDelegate log:format:](self->delegate, "log:format:", 7, @"%s: MA Download On cellular allowed for %@", "-[EAAccessoryUpdater allowConditionalDownloadOnCellular]", self->deviceClass);
    firmwareUpdater = self->firmwareUpdater;
    [(EAFirmwareUpdater *)firmwareUpdater setDownloadOnCellularAllowed:1];
  }
}

- (BOOL)isRoamingEnabled
{
  uint64_t v7 = 0;
  id v3 = objc_alloc_init((Class)CoreTelephonyClient);
  if (v3)
  {
    unsigned __int8 v4 = v3;
    unsigned int v5 = [v3 getInternationalDataAccessStatusSync:&v7];
    if (v7) {
      [(FudPluginDelegate *)self->delegate log:7, @"error = %@", v7 format];
    }
  }
  else
  {
    unsigned int v5 = 1;
  }
  [(FudPluginDelegate *)self->delegate log:7, @"isRoamingEnabled = %d", v5 format];
  return v5;
}

- (EAAccessoryUpdater)initWithCoder:(id)a3
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater initWithCoder:]", 1382);
  v14.receiver = self;
  v14.super_class = (Class)EAAccessoryUpdater;
  unsigned int v5 = [(EAAccessoryUpdater *)&v14 init];
  v5->delegate = 0;
  v5->deviceClass = (NSString *)[a3 decodeObjectForKey:@"DeviceClass"];
  v5->mobileAssetType = (NSString *)[a3 decodeObjectForKey:@"MobileAssetType"];
  v5->initOptions = (NSDictionary *)[a3 decodeObjectForKey:@"InitOptions"];
  unint64_t v6 = (NSDictionary *)copyPlistDeviceEntryFromDeviceClass(v5->deviceClass);
  v5->deviceOptions = v6;
  if (!v6)
  {
    [(FudPluginDelegate *)v5->delegate log:3 format:@"Failed to get plist entry for device class"];
    return 0;
  }
  id v7 = objc_msgSend(-[NSDictionary objectForKey:](v6, "objectForKey:", @"skipDFUMode"), "BOOLValue");
  deviceOptions = v5->deviceOptions;
  if (deviceOptions)
  {
    unsigned int v9 = objc_msgSend(-[NSDictionary objectForKey:](deviceOptions, "objectForKey:", @"disableByteEscaping"), "BOOLValue");
    uint64_t v10 = v5->deviceOptions;
    if (v10)
    {
      id v11 = objc_msgSend(-[NSDictionary objectForKey:](v10, "objectForKey:", @"skipReconnect"), "BOOLValue");
      goto LABEL_5;
    }
  }
  else
  {
    unsigned int v9 = 0;
  }
  id v11 = 0;
LABEL_5:
  uint64_t v12 = [[EAFirmwareUpdater alloc] initWithDeviceClass:v5->deviceClass assetType:v5->mobileAssetType skipDFU:v7 byteEscape:v9 ^ 1 skipReconnect:v11 skipVersionCheck:0 options:v5->deviceOptions serialNum:[(NSDictionary *)v5->initOptions objectForKey:@"SerialNumber"]];
  v5->firmwareUpdater = v12;
  if (!v12) {
    return 0;
  }
  if ([(EAFirmwareUpdater *)v12 overrideProtocol]) {
    [(EAAccessoryUpdater *)v5 overrideUpdaterOptions];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  -[FudPluginDelegate log:format:](self->delegate, "log:format:", 5, @"Entering: %s:%d", "-[EAAccessoryUpdater encodeWithCoder:]", 1434);
  [a3 encodeObject:self->deviceClass forKey:@"DeviceClass"];
  [a3 encodeObject:self->mobileAssetType forKey:self->mobileAssetType];
  if (self->initOptions)
  {
    objc_msgSend(a3, "encodeObject:forKey:");
  }
}

- (NSString)deviceClass
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDeviceClass:(id)a3
{
}

- (NSString)mobileAssetType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setMobileAssetType:(id)a3
{
}

- (NSDictionary)initOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setInitOptions:(id)a3
{
}

- (NSString)localFilePath
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLocalFilePath:(id)a3
{
}

- (NSMutableSet)seedLocations
{
  return (NSMutableSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSeedLocations:(id)a3
{
}

- (NSURL)dropboxPath
{
  return (NSURL *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDropboxPath:(id)a3
{
}

- (NSString)accessoryFusingType
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setAccessoryFusingType:(id)a3
{
}

@end