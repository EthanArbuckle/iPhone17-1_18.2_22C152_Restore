@interface NTKCompanion1stPartyApp
+ (BOOL)complicationType:(unint64_t)a3 mapsToRemovedSystemAppOnDevice:(id)a4;
+ (id)_allApps;
+ (id)allAppsForDevice:(id)a3;
+ (id)appForBundleIdentifier:(id)a3;
+ (id)companionAppWithAppInfo:(_NTKCompanion1stPartyInfo *)a3;
- (NSString)iconName;
- (NTKCompanion1stPartyApp)initWithAppInfo:(_NTKCompanion1stPartyInfo *)a3;
- (id)complication;
- (id)icon;
- (unint64_t)complicationType;
- (void)setComplicationType:(unint64_t)a3;
- (void)setIcon:(id)a3;
- (void)setIconName:(id)a3;
@end

@implementation NTKCompanion1stPartyApp

- (id)complication
{
  unint64_t v2 = [(NTKCompanion1stPartyApp *)self complicationType];

  return +[NTKComplication anyComplicationOfType:v2];
}

+ (id)appForBundleIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = objc_msgSend(a1, "_allApps", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v11 = [v10 watchApplicationIdentifier];
        if ([v11 isEqualToString:v4])
        {

LABEL_13:
          id v14 = v10;
          goto LABEL_14;
        }
        v12 = [v10 containerApplicationIdentifier];
        char v13 = [v12 isEqualToString:v4];

        if (v13) {
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      id v14 = 0;
      if (v7) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v14 = 0;
  }
LABEL_14:

  return v14;
}

+ (id)allAppsForDevice:(id)a3
{
  if ([a3 isRunningGraceOrLater])
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    id v4 = [a1 _allApps];
  }

  return v4;
}

+ (id)_allApps
{
  os_unfair_lock_lock((os_unfair_lock_t)&_allApps___lock);
  id WeakRetained = objc_loadWeakRetained(&_allApps___cachedDevice);
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v5 = [MEMORY[0x1E4F19A30] currentDevice];
    id v6 = objc_loadWeakRetained(&_allApps___cachedDevice);
    if (v5 == v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F19A30] currentDevice];
      uint64_t v8 = [v7 version];
      uint64_t v9 = _allApps___previousCLKDeviceVersion;

      if (v8 == v9) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  v10 = [MEMORY[0x1E4F19A30] currentDevice];
  objc_storeWeak(&_allApps___cachedDevice, v10);

  id v11 = objc_loadWeakRetained(&_allApps___cachedDevice);
  _allApps___previousCLKDeviceVersion = [v11 version];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35__NTKCompanion1stPartyApp__allApps__block_invoke;
  v15[3] = &__block_descriptor_40_e19_v16__0__CLKDevice_8l;
  v15[4] = a1;
  v12 = [MEMORY[0x1E4F19A30] currentDevice];
  ((void (*)(void *, void *))__35__NTKCompanion1stPartyApp__allApps__block_invoke)(v15, v12);

LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_allApps___lock);
  char v13 = (void *)_allApps_apps;

  return v13;
}

void __35__NTKCompanion1stPartyApp__allApps__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  v3 = (void *)_allApps_apps;
  _allApps_apps = v2;

  for (uint64_t i = 0; i != 80; i += 4)
  {
    id v5 = *(void **)(a1 + 32);
    long long v6 = *(_OWORD *)&AppInfos[i + 2];
    v8[0] = *(_OWORD *)&AppInfos[i];
    v8[1] = v6;
    uint64_t v7 = [v5 companionAppWithAppInfo:v8];
    if (v7) {
      [(id)_allApps_apps addObject:v7];
    }
  }
}

+ (id)companionAppWithAppInfo:(_NTKCompanion1stPartyInfo *)a3
{
  id v4 = a3->var0;
  if (v4)
  {
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];
    if (!v5)
    {
      long long v6 = 0;
      goto LABEL_11;
    }
  }
  else
  {
    id v5 = 0;
  }
  if (a3->var2 == 9)
  {
    uint64_t v7 = [NTKCompanion1stPartyStocksApp alloc];
    uint64_t v8 = [MEMORY[0x1E4F19A30] currentDevice];
    uint64_t v9 = [(NTKCompanion1stPartyStocksApp *)v7 initWithDevice:v8];

    v10 = [v5 applicationState];
    int v11 = [v10 isInstalled];

    if (v11) {
      [v5 localizedName];
    }
    else {
    v15 = NTKCCustomizationLocalizedString(@"STOCKS_APP_NAME", @"Stocks", v12);
    }
    [(NTKCompanionApp *)v9 setName:v15];

    NTKImageNamed(a3->var3);
  }
  char v13 = [NTKCompanion1stPartyApp alloc];
  long long v14 = *(_OWORD *)&a3->var2;
  v17[0] = *(_OWORD *)&a3->var0;
  v17[1] = v14;
  long long v6 = [(NTKCompanion1stPartyApp *)v13 initWithAppInfo:v17];

LABEL_11:

  return v6;
}

- (NTKCompanion1stPartyApp)initWithAppInfo:(_NTKCompanion1stPartyInfo *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKCompanion1stPartyApp;
  id v4 = [(NTKCompanion1stPartyApp *)&v10 init];
  id v5 = v4;
  if (v4)
  {
    [(NTKCompanionApp *)v4 setContainerApplicationIdentifier:a3->var0];
    [(NTKCompanionApp *)v5 setWatchApplicationIdentifier:a3->var1];
    [(NTKCompanion1stPartyApp *)v5 setComplicationType:a3->var2];
    if ([(NTKCompanion1stPartyApp *)v5 complicationType] == 8)
    {
      uint64_t v7 = NTKCCustomizationLocalizedString(@"CALENDAR_APP_NAME", @"Calendar", v6);
    }
    else
    {
      if ([(NTKCompanion1stPartyApp *)v5 complicationType] == 9)
      {
LABEL_7:
        [(NTKCompanion1stPartyApp *)v5 setIconName:a3->var3];
        return v5;
      }
      uint64_t v7 = NTKComplicationTypeLocalizedLabelText([(NTKCompanion1stPartyApp *)v5 complicationType]);
    }
    uint64_t v8 = (void *)v7;
    [(NTKCompanionApp *)v5 setName:v7];

    goto LABEL_7;
  }
  return v5;
}

- (id)icon
{
  icon = self->_icon;
  if (!icon) {
    NTKImageNamed(self->_iconName);
  }

  return icon;
}

+ (BOOL)complicationType:(unint64_t)a3 mapsToRemovedSystemAppOnDevice:(id)a4
{
  if ([a4 isRunningGraceOrLater]) {
    return 0;
  }
  uint64_t v5 = 0;
  while (AppInfos[v5 + 2] != (__CFString *)a3)
  {
    v5 += 4;
    if (v5 == 80) {
      return 0;
    }
  }
  uint64_t v6 = AppInfos[v5];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v6 allowPlaceholder:0 error:0];
  uint64_t v9 = [v8 applicationState];
  char v10 = [v9 isInstalled];
  char v11 = v10 ^ 1;

  if ((v10 & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v12 openApplicationWithBundleID:v7];
  }
  return v11;
}

- (void)setIcon:(id)a3
{
}

- (unint64_t)complicationType
{
  return self->_complicationType;
}

- (void)setComplicationType:(unint64_t)a3
{
  self->_complicationType = a3;
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconName, 0);

  objc_storeStrong((id *)&self->_icon, 0);
}

@end