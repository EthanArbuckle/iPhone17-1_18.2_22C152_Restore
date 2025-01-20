@interface _SFBrowserWindowSettings
+ (_SFBrowserWindowSettings)settings;
+ (void)setSharedSettings:(id)a3;
- (BOOL)_BOOLValueForKey:(id)a3 windowUUID:(id)a4;
- (BOOL)activeDocumentIsValidForWindowWithUUID:(id)a3;
- (BOOL)hasPrivateBrowsingWindow;
- (BOOL)invalidatesClosedWindows;
- (BOOL)isShowingTabViewForWindowWithUUID:(id)a3;
- (BOOL)privateBrowsingEnabledForWindowWithUUID:(id)a3;
- (BOOL)tabViewDismissesOnUnlockForWindowWithUUID:(id)a3;
- (_SFBrowserWindowSettings)init;
- (id)_blankSnapshotKeyForPrivateBrowsing:(BOOL)a3 syncableTabGroupUUID:(id)a4;
- (id)_numberForKey:(id)a3 windowUUID:(id)a4;
- (id)_stringForKey:(id)a3 windowUUID:(id)a4;
- (id)blankSnapshotGroupIdentifierForPrivateBrowsing:(BOOL)a3 syncableTabGroupUUID:(id)a4 forWindowWithUUID:(id)a5;
- (id)dataForKey:(id)a3 forWindowWithUUID:(id)a4;
- (void)_initializeSettingsDictionaryIfNeeded;
- (void)_setBool:(BOOL)a3 forKey:(id)a4 windowUUID:(id)a5;
- (void)_setString:(id)a3 forKey:(id)a4 windowUUID:(id)a5;
- (void)_synchronizeNow;
- (void)removeWindowWithUUID:(id)a3;
- (void)setActiveDocumentIsValid:(BOOL)a3 forWindowWithUUID:(id)a4;
- (void)setBlankSnapshotGroupIdentifier:(id)a3 forPrivateBrowsing:(BOOL)a4 syncableTabGroupUUID:(id)a5 forWindowWithUUID:(id)a6;
- (void)setData:(id)a3 forKey:(id)a4 forWindowWithUUID:(id)a5;
- (void)setInvalidatesClosedWindows:(BOOL)a3;
- (void)setIsShowingTabView:(BOOL)a3 forWindowWithUUID:(id)a4;
- (void)setPrivateBrowsingEnabled:(BOOL)a3 forWindowWithUUID:(id)a4;
- (void)setTabViewDismissesOnUnlock:(BOOL)a3 forWindowWithUUID:(id)a4;
- (void)synchronize;
- (void)validateWindowSettingsWithUUIDs:(id)a3;
@end

@implementation _SFBrowserWindowSettings

+ (_SFBrowserWindowSettings)settings
{
  v2 = (void *)sharedSettingsInstance;
  if (!sharedSettingsInstance)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36___SFBrowserWindowSettings_settings__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (settings_onceToken != -1) {
      dispatch_once(&settings_onceToken, block);
    }
    v2 = (void *)sharedSettingsInstance;
  }
  id v3 = v2;

  return (_SFBrowserWindowSettings *)v3;
}

- (BOOL)privateBrowsingEnabledForWindowWithUUID:(id)a3
{
  return [(_SFBrowserWindowSettings *)self _BOOLValueForKey:@"PrivateBrowsing" windowUUID:a3];
}

- (_SFBrowserWindowSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)_SFBrowserWindowSettings;
  v2 = [(_SFBrowserWindowSettings *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    v2->_invalidatesClosedWindows = 1;
    [(_SFBrowserWindowSettings *)v2 _initializeSettingsDictionaryIfNeeded];
    v4 = v3;
  }

  return v3;
}

- (void)_initializeSettingsDictionaryIfNeeded
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  settingsDictionary = self->_settingsDictionary;
  self->_settingsDictionary = v3;

  v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  objc_super v6 = [v5 objectForKey:@"BrowserControllersSavedState"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65___SFBrowserWindowSettings__initializeSettingsDictionaryIfNeeded__block_invoke;
    v7[3] = &unk_1E54EACB0;
    v7[4] = self;
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

- (void)validateWindowSettingsWithUUIDs:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_invalidatesClosedWindows)
  {
    [(NSMutableDictionary *)self->_settingsDictionary allKeys];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      char v13 = 0;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v9];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __60___SFBrowserWindowSettings_validateWindowSettingsWithUUIDs___block_invoke;
          v15[3] = &unk_1E54EAC88;
          id v11 = v10;
          id v16 = v11;
          v12 = objc_msgSend(v4, "safari_firstObjectPassingTest:", v15);

          if (!v12)
          {
            [(NSMutableDictionary *)self->_settingsDictionary removeObjectForKey:v9];
            char v13 = 1;
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
      if (v13) {
        [(_SFBrowserWindowSettings *)self synchronize];
      }
    }
  }
}

- (void)_setBool:(BOOL)a3 forKey:(id)a4 windowUUID:(id)a5
{
  BOOL v6 = a3;
  id v14 = a4;
  id v8 = a5;
  uint64_t v9 = [(_SFBrowserWindowSettings *)self _numberForKey:v14 windowUUID:v8];
  v10 = v9;
  if (!v9 || [v9 BOOLValue] != v6)
  {
    id v11 = [v8 UUIDString];
    v12 = [(NSMutableDictionary *)self->_settingsDictionary objectForKeyedSubscript:v11];
    if (!v12)
    {
      v12 = [MEMORY[0x1E4F1CA60] dictionary];
      [(NSMutableDictionary *)self->_settingsDictionary setObject:v12 forKeyedSubscript:v11];
    }
    char v13 = [NSNumber numberWithBool:v6];
    [v12 setObject:v13 forKeyedSubscript:v14];

    [(_SFBrowserWindowSettings *)self synchronize];
  }
}

- (BOOL)_BOOLValueForKey:(id)a3 windowUUID:(id)a4
{
  id v4 = [(_SFBrowserWindowSettings *)self _numberForKey:a3 windowUUID:a4];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)_numberForKey:(id)a3 windowUUID:(id)a4
{
  settingsDictionary = self->_settingsDictionary;
  id v6 = a3;
  uint64_t v7 = [a4 UUIDString];
  id v8 = [(NSMutableDictionary *)settingsDictionary objectForKeyedSubscript:v7];

  uint64_t v9 = objc_msgSend(v8, "safari_numberForKey:", v6);

  return v9;
}

- (id)blankSnapshotGroupIdentifierForPrivateBrowsing:(BOOL)a3 syncableTabGroupUUID:(id)a4 forWindowWithUUID:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  uint64_t v9 = [(_SFBrowserWindowSettings *)self _blankSnapshotKeyForPrivateBrowsing:v6 syncableTabGroupUUID:a4];
  v10 = [(_SFBrowserWindowSettings *)self _stringForKey:v9 windowUUID:v8];

  if (v10) {
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v10];
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (id)_stringForKey:(id)a3 windowUUID:(id)a4
{
  settingsDictionary = self->_settingsDictionary;
  id v6 = a3;
  uint64_t v7 = [a4 UUIDString];
  id v8 = [(NSMutableDictionary *)settingsDictionary objectForKeyedSubscript:v7];

  uint64_t v9 = objc_msgSend(v8, "safari_stringForKey:", v6);

  return v9;
}

- (id)_blankSnapshotKeyForPrivateBrowsing:(BOOL)a3 syncableTabGroupUUID:(id)a4
{
  if (a4)
  {
    id v4 = [NSString stringWithFormat:@"%@-%@", @"TabGroupBlankSnapshotGroupIdentifier", a4];
  }
  else
  {
    char v5 = @"NormalBlankSnapshotGroupIdentifier";
    if (a3) {
      char v5 = @"PrivateBlankSnapshotGroupIdentifier";
    }
    id v4 = v5;
  }

  return v4;
}

- (BOOL)tabViewDismissesOnUnlockForWindowWithUUID:(id)a3
{
  return [(_SFBrowserWindowSettings *)self _BOOLValueForKey:@"TabViewDismissesOnUnlock" windowUUID:a3];
}

- (BOOL)hasPrivateBrowsingWindow
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(NSMutableDictionary *)self->_settingsDictionary allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "safari_BOOLForKey:", @"PrivateBrowsing"))
        {
          BOOL v7 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 0;
LABEL_11:

  return v7;
}

- (void)setPrivateBrowsingEnabled:(BOOL)a3 forWindowWithUUID:(id)a4
{
}

+ (void)setSharedSettings:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  char v5 = [v4 launchedToTest];
  uint64_t v6 = sharedSettingsInstance;

  if ((v5 & 1) == 0 && v6) {
    +[_SFBrowserWindowSettings setSharedSettings:]();
  }
  BOOL v7 = (void *)sharedSettingsInstance;
  sharedSettingsInstance = (uint64_t)v3;
}

- (void)setData:(id)a3 forKey:(id)a4 forWindowWithUUID:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  long long v9 = [a5 UUIDString];
  long long v10 = [(NSMutableDictionary *)self->_settingsDictionary objectForKeyedSubscript:v9];
  if (!v10)
  {
    long long v10 = [MEMORY[0x1E4F1CA60] dictionary];
    [(NSMutableDictionary *)self->_settingsDictionary setObject:v10 forKeyedSubscript:v9];
  }
  [v10 setObject:v11 forKeyedSubscript:v8];
  [(_SFBrowserWindowSettings *)self synchronize];
}

- (id)dataForKey:(id)a3 forWindowWithUUID:(id)a4
{
  settingsDictionary = self->_settingsDictionary;
  id v6 = a3;
  BOOL v7 = [a4 UUIDString];
  id v8 = [(NSMutableDictionary *)settingsDictionary objectForKeyedSubscript:v7];

  long long v9 = objc_msgSend(v8, "safari_dataForKey:", v6);

  return v9;
}

- (void)_setString:(id)a3 forKey:(id)a4 windowUUID:(id)a5
{
  id v13 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = [(_SFBrowserWindowSettings *)self _stringForKey:v8 windowUUID:v9];
    if (v10 != v13 && ([v10 isEqualToString:v13] & 1) == 0)
    {
      id v11 = [v9 UUIDString];
      long long v12 = [(NSMutableDictionary *)self->_settingsDictionary objectForKeyedSubscript:v11];
      if (!v12)
      {
        long long v12 = [MEMORY[0x1E4F1CA60] dictionary];
        [(NSMutableDictionary *)self->_settingsDictionary setObject:v12 forKeyedSubscript:v11];
      }
      [v12 setValue:v13 forKey:v8];
      [(_SFBrowserWindowSettings *)self synchronize];
    }
  }
}

- (BOOL)activeDocumentIsValidForWindowWithUUID:(id)a3
{
  id v3 = [(_SFBrowserWindowSettings *)self _numberForKey:@"ActiveDocumentIsValid" windowUUID:a3];
  uint64_t v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)setActiveDocumentIsValid:(BOOL)a3 forWindowWithUUID:(id)a4
{
}

- (BOOL)isShowingTabViewForWindowWithUUID:(id)a3
{
  return [(_SFBrowserWindowSettings *)self _BOOLValueForKey:@"ShowingTabView" windowUUID:a3];
}

- (void)setIsShowingTabView:(BOOL)a3 forWindowWithUUID:(id)a4
{
}

- (void)setTabViewDismissesOnUnlock:(BOOL)a3 forWindowWithUUID:(id)a4
{
}

- (void)setBlankSnapshotGroupIdentifier:(id)a3 forPrivateBrowsing:(BOOL)a4 syncableTabGroupUUID:(id)a5 forWindowWithUUID:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v13 = [(_SFBrowserWindowSettings *)self _blankSnapshotKeyForPrivateBrowsing:v7 syncableTabGroupUUID:a5];
  long long v12 = [v11 UUIDString];

  [(_SFBrowserWindowSettings *)self _setString:v12 forKey:v13 windowUUID:v10];
}

- (void)removeWindowWithUUID:(id)a3
{
  settingsDictionary = self->_settingsDictionary;
  char v5 = [a3 UUIDString];
  [(NSMutableDictionary *)settingsDictionary removeObjectForKey:v5];

  [(_SFBrowserWindowSettings *)self synchronize];
}

- (void)synchronize
{
  if (!self->_synchronizeScheduled)
  {
    self->_synchronizeScheduled = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39___SFBrowserWindowSettings_synchronize__block_invoke;
    block[3] = &unk_1E54E9858;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)_synchronizeNow
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 setObject:self->_settingsDictionary forKey:@"BrowserControllersSavedState"];
  [v3 synchronize];
}

- (BOOL)invalidatesClosedWindows
{
  return self->_invalidatesClosedWindows;
}

- (void)setInvalidatesClosedWindows:(BOOL)a3
{
  self->_invalidatesClosedWindows = a3;
}

- (void).cxx_destruct
{
}

+ (void)setSharedSettings:.cold.1()
{
  v0 = [NSString stringWithFormat:&stru_1EDA07C28];
  v1 = NSString;
  v2 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/MobileSafariFramework/_SFBrowserWindowSettings.m"];
  id v3 = [v2 lastPathComponent];
  if ([v0 length])
  {
    char v5 = [NSString stringWithFormat:@", %@", v0];
    uint64_t v4 = [v1 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "[[UIApplication sharedApplication] launchedToTest] || !sharedSettingsInstance", "+[_SFBrowserWindowSettings setSharedSettings:]", v3, 38, v5];
  }
  else
  {
    uint64_t v4 = [v1 stringWithFormat:@"ASSERTION FAILURE: \"%s\" in %s, %@:%d%@", "[[UIApplication sharedApplication] launchedToTest] || !sharedSettingsInstance", "+[_SFBrowserWindowSettings setSharedSettings:]", v3, 38, &stru_1EDA07C28];
  }

  id v6 = [MEMORY[0x1E4F29060] callStackSymbols];
  NSLog(&stru_1EDA07EA8.isa, v4, v6);

  abort();
}

@end