@interface COSSystemAppSettingsBundleRow
- (BOOL)_removeRowForSpecialCriteriaOverride:(id)a3;
- (BOOL)_requiredAppsInstalled:(id)a3;
- (BOOL)requiredAppsInstalled;
- (BOOL)showOnAnyRequiredWatchAppsInstalled;
- (COSSystemAppSettingsBundleRow)initWithBundle:(id)a3 name:(id)a4;
- (NSArray)forbiddenCapabilities;
- (NSArray)requiredCapabilities;
- (NSArray)requiredInstalledWatchApps;
- (NSBundle)bundle;
- (NSDictionary)requiredFeatureFlags;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)name;
- (id)description;
- (id)settingsBundleDict;
- (void)_setRequiredInstalledWatchAppsForLegacy:(id)a3;
- (void)setAreRequiredWatchAppsInstalled:(id)a3;
- (void)setBundle:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setForbiddenCapabilities:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setRequiredAppsInstalled:(BOOL)a3;
- (void)setRequiredCapabilities:(id)a3;
- (void)setRequiredFeatureFlags:(id)a3;
- (void)setRequiredInstalledWatchApps:(id)a3;
- (void)setShowOnAnyRequiredWatchAppsInstalled:(BOOL)a3;
@end

@implementation COSSystemAppSettingsBundleRow

- (BOOL)requiredAppsInstalled
{
  return self->_requiredAppsInstalled;
}

- (void)setAreRequiredWatchAppsInstalled:(id)a3
{
  id v10 = a3;
  v4 = [v10 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned __int8 v5 = [v4 BOOLValue];

  if ((v5 & 1) == 0
    && ([(COSSystemAppSettingsBundleRow *)self requiredInstalledWatchApps],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = (void *)v6,
        int HasStandaloneAppsCapability = BPSDeviceHasStandaloneAppsCapability(),
        v7,
        HasStandaloneAppsCapability))
  {
    unsigned int v9 = [(COSSystemAppSettingsBundleRow *)self _requiredAppsInstalled:v10];
  }
  else
  {
    unsigned int v9 = 1;
  }
  [(COSSystemAppSettingsBundleRow *)self setRequiredAppsInstalled:v9 & ~[(COSSystemAppSettingsBundleRow *)self _removeRowForSpecialCriteriaOverride:v10]];
}

- (NSArray)requiredInstalledWatchApps
{
  return self->_requiredInstalledWatchApps;
}

- (void)setRequiredAppsInstalled:(BOOL)a3
{
  self->_requiredAppsInstalled = a3;
}

- (BOOL)_removeRowForSpecialCriteriaOverride:(id)a3
{
  int HasStandaloneAppsCapability = BPSDeviceHasStandaloneAppsCapability();
  if ([@"com.apple.OxygenSaturationSettings" isEqualToString:self->_identifier])
  {
    if (HKRPShouldSkipHardwareCheck())
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      uint64_t v6 = [UIApp displayDevice];
      int v5 = BPSDeviceHasCapabilityForString() ^ 1;
    }
  }
  else
  {
    return [@"com.apple.BridgeAppStoreDaemonSettings" isEqualToString:self->_identifier] & (HasStandaloneAppsCapability ^ 1);
  }
  return v5;
}

- (id)settingsBundleDict
{
  v19[0] = PSTitleKey;
  v3 = [(COSSystemAppSettingsBundleRow *)self displayName];
  v20[0] = v3;
  v19[1] = PSIDKey;
  v4 = [(COSSystemAppSettingsBundleRow *)self bundle];
  int v5 = [v4 bundleIdentifier];
  v20[1] = v5;
  v20[2] = @"PSLinkCell";
  v19[2] = PSTableCellClassKey;
  v19[3] = PSBundleHasIconKey;
  v20[3] = kCFBooleanTrue;
  v20[4] = kCFBooleanTrue;
  v19[4] = PSSearchNanoApplicationsBundlePath;
  v19[5] = PSBundlePathKey;
  uint64_t v6 = [(COSSystemAppSettingsBundleRow *)self name];
  v19[6] = @"isController";
  v20[5] = v6;
  v20[6] = kCFBooleanTrue;
  v7 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:7];
  v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];

  unsigned int v9 = [(COSSystemAppSettingsBundleRow *)self requiredCapabilities];
  [v8 setObject:v9 forKeyedSubscript:BPSRequiredWatchCapabilitiesKey];

  id v10 = [(COSSystemAppSettingsBundleRow *)self forbiddenCapabilities];
  [v8 setObject:v10 forKeyedSubscript:BPSForbiddenWatchCapabilitiesKey];

  v11 = [(COSSystemAppSettingsBundleRow *)self requiredFeatureFlags];
  [v8 setObject:v11 forKeyedSubscript:BPSRequiredFeatureFlagsKey];

  v12 = [(COSSystemAppSettingsBundleRow *)self bundle];
  uint64_t v13 = BPSWatchAppBundleIdKey;
  v14 = [v12 objectForInfoDictionaryKey:BPSWatchAppBundleIdKey];
  [v8 setObject:v14 forKeyedSubscript:v13];

  v15 = [(COSSystemAppSettingsBundleRow *)self bundle];
  uint64_t v16 = PSDataSourceClassKey;
  v17 = [v15 objectForInfoDictionaryKey:PSDataSourceClassKey];

  [v8 setObject:v17 forKeyedSubscript:v16];

  return v8;
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (COSSystemAppSettingsBundleRow)initWithBundle:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v35.receiver = self;
  v35.super_class = (Class)COSSystemAppSettingsBundleRow;
  unsigned int v9 = [(COSSystemAppSettingsBundleRow *)&v35 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundle, a3);
    uint64_t v11 = [v7 bundleIdentifier];
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    objc_storeStrong((id *)&v10->_name, a4);
    uint64_t v13 = [v7 objectForInfoDictionaryKey:BPSRequiredWatchCapabilitiesKey];
    requiredCapabilities = v10->_requiredCapabilities;
    v10->_requiredCapabilities = (NSArray *)v13;

    uint64_t v15 = [v7 objectForInfoDictionaryKey:BPSForbiddenWatchCapabilitiesKey];
    forbiddenCapabilities = v10->_forbiddenCapabilities;
    v10->_forbiddenCapabilities = (NSArray *)v15;

    uint64_t v17 = [v7 objectForInfoDictionaryKey:BPSRequiredFeatureFlagsKey];
    requiredFeatureFlags = v10->_requiredFeatureFlags;
    v10->_requiredFeatureFlags = (NSDictionary *)v17;

    uint64_t v19 = [v7 objectForInfoDictionaryKey:BPSRequiredInstalledWatchApps];
    requiredInstalledWatchApps = v10->_requiredInstalledWatchApps;
    v10->_requiredInstalledWatchApps = (NSArray *)v19;

    v21 = [v7 objectForInfoDictionaryKey:BPSShowOnAnyRequiredWatchAppsInstalled];
    v10->_showOnAnyRequiredWatchAppsInstalled = [v21 BOOLValue];

    uint64_t v22 = [v7 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    displayName = v10->_displayName;
    v10->_displayName = (NSString *)v22;

    v24 = [v7 bundleIdentifier];
    unsigned int v25 = [@"com.apple.NanoBedtimeBridgeSettings" isEqualToString:v24];

    if (v25)
    {
      v26 = +[NSBundle mainBundle];
      uint64_t v27 = [v26 localizedStringForKey:v8 value:&stru_100249230 table:@"Localizable-burrito"];
      v28 = v10->_displayName;
      v10->_displayName = (NSString *)v27;
    }
    if (![(NSString *)v10->_displayName length])
    {
      v29 = +[NSBundle mainBundle];
      uint64_t v30 = [v29 localizedStringForKey:v8 value:&stru_100249230 table:@"Settings"];
      v31 = v10->_displayName;
      v10->_displayName = (NSString *)v30;
    }
    v32 = [(NSBundle *)v10->_bundle bundleIdentifier];
    if (BPSSystemAppIsRemovable())
    {
      v33 = v10->_requiredInstalledWatchApps;

      if (!v33) {
        [(COSSystemAppSettingsBundleRow *)v10 _setRequiredInstalledWatchAppsForLegacy:v7];
      }
    }
    else
    {
    }
  }

  return v10;
}

- (NSDictionary)requiredFeatureFlags
{
  return self->_requiredFeatureFlags;
}

- (NSArray)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)forbiddenCapabilities
{
  return self->_forbiddenCapabilities;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)_setRequiredInstalledWatchAppsForLegacy:(id)a3
{
  v4 = BPSWatchAppBundleIDForSettingsBundle();
  id v7 = v4;
  int v5 = +[NSArray arrayWithObjects:&v7 count:1];
  requiredInstalledWatchApps = self->_requiredInstalledWatchApps;
  self->_requiredInstalledWatchApps = v5;
}

- (BOOL)_requiredAppsInstalled:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    unsigned int v19 = [(COSSystemAppSettingsBundleRow *)self showOnAnyRequiredWatchAppsInstalled];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    int v5 = [(COSSystemAppSettingsBundleRow *)self requiredInstalledWatchApps];
    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v6)
    {
      id v8 = v6;
      LOBYTE(v9) = 0;
      uint64_t v10 = *(void *)v23;
      *(void *)&long long v7 = 138412546;
      long long v18 = v7;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v5);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          char v21 = 0;
          uint64_t v13 = +[ACXDeviceConnection sharedDeviceConnection];
          id v20 = 0;
          unsigned __int8 v14 = [v13 getApplicationIsInstalled:&v21 withBundleID:v12 onPairedDevice:v4 error:&v20];
          id v15 = v20;

          if (v14)
          {
            BOOL v9 = v21 != 0;
            if (((v9 ^ v19) & 1) == 0)
            {

              goto LABEL_19;
            }
          }
          else
          {
            uint64_t v16 = pbb_bridge_log();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v18;
              uint64_t v27 = v12;
              __int16 v28 = 2112;
              id v29 = v15;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to check install status of %@ with error: %@", buf, 0x16u);
            }
          }
        }
        id v8 = [v5 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v8);
    }
    else
    {
      LOBYTE(v9) = 0;
    }
LABEL_19:
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)description
{
  v3 = [(COSSystemAppSettingsBundleRow *)self name];
  id v4 = [(COSSystemAppSettingsBundleRow *)self displayName];
  int v5 = [(COSSystemAppSettingsBundleRow *)self identifier];
  id v6 = +[NSString stringWithFormat:@"row name: %@ - display name: %@ - identifier: %@", v3, v4, v5];

  return v6;
}

- (void)setRequiredInstalledWatchApps:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setBundle:(id)a3
{
}

- (void)setName:(id)a3
{
}

- (void)setDisplayName:(id)a3
{
}

- (void)setRequiredCapabilities:(id)a3
{
}

- (void)setForbiddenCapabilities:(id)a3
{
}

- (void)setRequiredFeatureFlags:(id)a3
{
}

- (BOOL)showOnAnyRequiredWatchAppsInstalled
{
  return self->_showOnAnyRequiredWatchAppsInstalled;
}

- (void)setShowOnAnyRequiredWatchAppsInstalled:(BOOL)a3
{
  self->_showOnAnyRequiredWatchAppsInstalled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredFeatureFlags, 0);
  objc_storeStrong((id *)&self->_forbiddenCapabilities, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_requiredInstalledWatchApps, 0);
}

@end