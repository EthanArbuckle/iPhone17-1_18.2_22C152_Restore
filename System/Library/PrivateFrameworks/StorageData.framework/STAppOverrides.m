@interface STAppOverrides
+ (id)overrides;
+ (id)overridesFor:(id)a3;
+ (id)overridesForApplication:(id)a3;
- (BOOL)excludeUsageBundle;
- (BOOL)forceExcludeUsageBundle;
- (BOOL)forceHidden;
- (BOOL)forceVisible;
- (BOOL)hideLastUsed;
- (BOOL)includeSoftwareUpdates;
- (BOOL)isICloud;
- (BOOL)isMediaApp;
- (NSArray)includeCacheDeleteKeys;
- (NSArray)includeContainers;
- (NSArray)includeFsPaths;
- (NSArray)includeMediaUsage;
- (NSString)defaultName;
- (NSString)unInstalledName;
- (NSString)usageBundleOverride;
- (STAppOverrides)initWithDictionary:(id)a3;
- (int)category;
@end

@implementation STAppOverrides

- (STAppOverrides)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STAppOverrides;
  v5 = [(STAppOverrides *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__STAppOverrides_initWithDictionary___block_invoke;
    v8[3] = &unk_264305340;
    v9 = v5;
    [v4 enumerateKeysAndObjectsUsingBlock:v8];
  }
  return v6;
}

uint64_t __37__STAppOverrides_initWithDictionary___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forKey:a2];
}

- (BOOL)isMediaApp
{
  int v2 = [(STAppOverrides *)self category];
  if (v2) {
    BOOL v3 = v2 == 7;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (BOOL)excludeUsageBundle
{
  BOOL v3 = [(STAppOverrides *)self includeFsPaths];
  uint64_t v4 = [v3 count];
  v5 = [(STAppOverrides *)self includeMediaUsage];
  uint64_t v6 = [v5 count] + v4;
  v7 = [(STAppOverrides *)self includeCacheDeleteKeys];
  BOOL v8 = v6 + [v7 count]
    || [(STAppOverrides *)self includeSoftwareUpdates]
    || [(STAppOverrides *)self forceExcludeUsageBundle];

  return v8;
}

+ (id)overridesForApplication:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 applicationIdentifier];
  id v6 = [a1 overridesFor:v5];

  if (!v6)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v7 = objc_msgSend(v4, "counterpartIdentifiers", 0);
    id v6 = (id)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v7);
          }
          objc_super v10 = [a1 overridesFor:*(void *)(*((void *)&v12 + 1) + 8 * i)];
          if (v10)
          {
            id v6 = v10;

            v7 = v6;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }

  return v6;
}

+ (id)overridesFor:(id)a3
{
  id v4 = a3;
  v5 = [a1 overrides];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

+ (id)overrides
{
  if (overrides_onceToken_101 != -1) {
    dispatch_once(&overrides_onceToken_101, &__block_literal_global_103);
  }
  int v2 = (void *)_appOverrides;

  return v2;
}

void __27__STAppOverrides_overrides__block_invoke()
{
  v71[16] = *MEMORY[0x263EF8340];
  id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v70[0] = @"com.apple.MobileSMS";
  v68[0] = @"category";
  v68[1] = @"forceVisible";
  uint64_t v0 = MEMORY[0x263EFFA88];
  v69[0] = &unk_26C92C2A0;
  v69[1] = MEMORY[0x263EFFA88];
  v32 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];
  v70[1] = @"com.apple.mobileslideshow";
  v71[0] = v32;
  v66[0] = @"category";
  v66[1] = @"forceVisible";
  v67[0] = &unk_26C92C288;
  v67[1] = v0;
  v66[2] = @"includeMediaUsage";
  v67[2] = &unk_26C92C318;
  v31 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:3];
  v71[1] = v31;
  v70[2] = @"com.apple.mobilenotes";
  v64 = @"includeFsPaths";
  v63 = @"/private/var/mobile/Library/Notes/";
  v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v63 count:1];
  v65 = v30;
  v29 = [NSDictionary dictionaryWithObjects:&v65 forKeys:&v64 count:1];
  v71[2] = v29;
  v70[3] = @"com.apple.Translate";
  v61 = @"includeCacheDeleteKeys";
  v62 = &unk_26C92C330;
  v28 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
  v71[3] = v28;
  v70[4] = @"com.apple.Preferences";
  v60[0] = v0;
  v59[0] = @"forceExcludeUsageBundle";
  v59[1] = @"defaultName";
  v27 = STStorageDataLocStr(@"SOFTWARE_UPDATE");
  v59[2] = @"forceHidden";
  v60[1] = v27;
  v60[2] = v0;
  v25 = [NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:3];
  v71[4] = v25;
  v70[5] = @"com.apple.Health";
  v57 = @"includeFsPaths";
  v58 = &unk_26C92C348;
  v24 = [NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
  v71[5] = v24;
  v70[6] = @"com.apple.MobileAddressBook";
  v55 = @"includeFsPaths";
  v56 = &unk_26C92C360;
  v23 = [NSDictionary dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  v71[6] = v23;
  v70[7] = @"com.apple.iBooks";
  v53[0] = @"category";
  v53[1] = @"includeMediaUsage";
  v54[0] = &unk_26C92C2B8;
  v54[1] = &unk_26C92C378;
  v22 = [NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:2];
  v70[8] = @"com.apple.mobilemail";
  v71[7] = v22;
  v51[0] = @"category";
  v51[1] = @"includeCacheDeleteKeys";
  v52[0] = &unk_26C92C2D0;
  v52[1] = &unk_26C92C390;
  v51[2] = @"includeContainers";
  v51[3] = @"includeFsPaths";
  v52[2] = &unk_26C92C3A8;
  v52[3] = &unk_26C92C3C0;
  v21 = [NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:4];
  v71[8] = v21;
  v70[9] = @"com.apple.Music";
  v49[0] = @"category";
  v49[1] = @"usageBundleOverride";
  v50[0] = &unk_26C92C2E8;
  v50[1] = @"com.apple.MusicUsage";
  v49[2] = @"includeFsPaths";
  v48 = @"/private/var/mobile/Media/iTunes_Control/iTunes/Artwork/";
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
  v49[3] = @"includeMediaUsage";
  v50[2] = v20;
  v50[3] = &unk_26C92C3D8;
  v1 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:4];
  v71[9] = v1;
  v70[10] = @"com.apple.podcasts";
  v46[0] = @"category";
  v46[1] = @"includeMediaUsage";
  v47[0] = &unk_26C92C2E8;
  v47[1] = &unk_26C92C3F0;
  int v2 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
  v71[10] = v2;
  v70[11] = @"com.apple.VoiceMemos";
  v44[0] = @"category";
  v44[1] = @"includeMediaUsage";
  v45[0] = &unk_26C92C2E8;
  v45[1] = &unk_26C92C408;
  v44[2] = @"includeFsPaths";
  v45[2] = &unk_26C92C420;
  BOOL v3 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:3];
  v71[11] = v3;
  v70[12] = @"com.apple.tv";
  v42[0] = @"category";
  v42[1] = @"usageBundleOverride";
  v43[0] = &unk_26C92C2E8;
  v43[1] = @"com.apple.VideosUsage";
  v42[2] = @"includeMediaUsage";
  v43[2] = &unk_26C92C438;
  id v4 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];
  v71[12] = v4;
  v70[13] = @"com.apple.fakeapp.MiscMedia.hidden";
  v40[0] = @"category";
  v40[1] = @"includeMediaUsage";
  v41[0] = &unk_26C92C2E8;
  v41[1] = &unk_26C92C450;
  v40[2] = @"includeFsPaths";
  v39 = @"/private/var/mobile/Media/Downloads/";
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
  v40[3] = @"forceHidden";
  v41[2] = v5;
  uint64_t v6 = MEMORY[0x263EFFA88];
  v41[3] = MEMORY[0x263EFFA88];
  v7 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:4];
  v71[13] = v7;
  v70[14] = @"com.apple.Passbook";
  v37[1] = @"forceHidden";
  v38[0] = &unk_26C92C468;
  v37[0] = @"includeFsPaths";
  int v8 = STStorageDeviceIsiPad();
  uint64_t v9 = MEMORY[0x263EFFA80];
  if (v8) {
    uint64_t v9 = v6;
  }
  v38[1] = v9;
  objc_super v10 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
  v71[14] = v10;
  v70[15] = @"com.apple.reminders";
  v35 = @"includeFsPaths";
  v36 = &unk_26C92C480;
  v11 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  v71[15] = v11;
  long long v12 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:16];
  [v26 addEntriesFromDictionary:v12];

  id v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __27__STAppOverrides_overrides__block_invoke_221;
  v33[3] = &unk_264305340;
  id v14 = v13;
  id v34 = v14;
  [v26 enumerateKeysAndObjectsUsingBlock:v33];
  long long v15 = (void *)_appOverrides;
  _appOverrides = (uint64_t)v14;
  id v16 = v14;

  uint64_t v17 = [STAppOverrides alloc];
  uint64_t v18 = [(STAppOverrides *)v17 initWithDictionary:MEMORY[0x263EFFA78]];
  v19 = (void *)_defaultAppOverrides;
  _defaultAppOverrides = v18;
}

void __27__STAppOverrides_overrides__block_invoke_221(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [[STAppOverrides alloc] initWithDictionary:v5];

  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v6];
}

- (int)category
{
  return self->_category;
}

- (BOOL)hideLastUsed
{
  return self->_hideLastUsed;
}

- (BOOL)forceVisible
{
  return self->_forceVisible;
}

- (BOOL)forceHidden
{
  return self->_forceHidden;
}

- (NSString)usageBundleOverride
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)defaultName
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isICloud
{
  return self->_isICloud;
}

- (NSArray)includeMediaUsage
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSArray)includeFsPaths
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSArray)includeCacheDeleteKeys
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)includeContainers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)includeSoftwareUpdates
{
  return self->_includeSoftwareUpdates;
}

- (NSString)unInstalledName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)forceExcludeUsageBundle
{
  return self->_forceExcludeUsageBundle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unInstalledName, 0);
  objc_storeStrong((id *)&self->_includeContainers, 0);
  objc_storeStrong((id *)&self->_includeCacheDeleteKeys, 0);
  objc_storeStrong((id *)&self->_includeFsPaths, 0);
  objc_storeStrong((id *)&self->_includeMediaUsage, 0);
  objc_storeStrong((id *)&self->_defaultName, 0);

  objc_storeStrong((id *)&self->_usageBundleOverride, 0);
}

@end