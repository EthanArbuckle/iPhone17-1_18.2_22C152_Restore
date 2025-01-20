@interface WFUserSettings
+ (id)_arrayByConvertingLinesInStringsAtPath:(id)a3;
+ (id)_metasiteDomainNamesArray;
+ (id)_sharedMetasiteDomainNamesDictionary;
+ (id)_sharedMetasiteExceptionsDomainNamesArray;
+ (id)metasitesExceptionPath;
+ (id)metasitesPath;
+ (void)_metasiteDomainNamesArray;
- (BOOL)_addManagedDefaults:(id)a3;
- (BOOL)_setManagedDefaults:(id)a3;
- (BOOL)alwaysAllowHTTPS;
- (BOOL)autoWhitelistContainsURL:(id)a3;
- (BOOL)canEditAlwaysAllowHTTPS;
- (BOOL)canEditContentFilterOverriddenBlackListedSites;
- (BOOL)canEditContentFilterOverriddenWhiteListedSites;
- (BOOL)canEditOverridesAllowed;
- (BOOL)canEditRestrictionType;
- (BOOL)canEditWhiteListAllowedSites;
- (BOOL)contentFilterEnabled;
- (BOOL)contentFilterListsAllowURL:(id)a3;
- (BOOL)contentFilterOverriddenBlackListContainsURL:(id)a3;
- (BOOL)contentFilterOverriddenList:(id)a3 containsURL:(id)a4;
- (BOOL)contentFilterOverriddenWhiteListContainsURL:(id)a3;
- (BOOL)contentFilterOverriddenWhiteListContainsURL:(id)a3 withAppleAllowList:(id)a4;
- (BOOL)contentFilterOverridesEnabled;
- (BOOL)overridesAllowed;
- (BOOL)restrictWebEnabled;
- (BOOL)whiteListContainsURL:(id)a3;
- (BOOL)whiteListEnabled;
- (NSArray)contentFilterOverriddenBlackListedSites;
- (NSArray)contentFilterOverriddenWhiteListedSites;
- (NSArray)whiteListAllowedSites;
- (NSString)userName;
- (WFUserSettings)initWithUserName:(id)a3;
- (id)_managedDefaultsPath;
- (id)_userSettingsForUser:(id)a3;
- (id)contentFilterOverriddenBlackListedSitesBuffer;
- (id)contentFilterOverriddenWhiteListedSitesBuffer;
- (id)contentFilterOverriddenWhiteListedSitesBufferWithAdditionalURLStrings:(id)a3;
- (id)whiteListedSitesBuffer;
- (int64_t)restrictionType;
- (void)dealloc;
- (void)setAlwaysAllowHTTPS:(BOOL)a3;
- (void)setContentFilterEnabled:(BOOL)a3;
- (void)setContentFilterOverriddenBlackListedSites:(id)a3;
- (void)setContentFilterOverriddenWhiteListedSites:(id)a3;
- (void)setContentFilterOverridesEnabled:(BOOL)a3;
- (void)setOverridesAllowed:(BOOL)a3;
- (void)setRestrictWebEnabled:(BOOL)a3;
- (void)setRestrictionType:(int64_t)a3;
- (void)setUserName:(id)a3;
- (void)setWhiteListAllowedSites:(id)a3;
- (void)setWhiteListEnabled:(BOOL)a3;
- (void)whiteListedSitesBuffer;
@end

@implementation WFUserSettings

- (int64_t)restrictionType
{
  int64_t result = [(WFUserSettings *)self _userSettingsForUser:[(WFUserSettings *)self userName]];
  if (result)
  {
    v3 = (void *)result;
    int64_t result = [(id)result objectForKey:@"restrictWeb"];
    if (result)
    {
      if (![(id)result BOOLValue]) {
        return 0;
      }
      v4 = (void *)[v3 objectForKey:@"useContentFilter"];
      v5 = (void *)[v3 objectForKey:@"useContentFilterOverrides"];
      v6 = (void *)[v3 objectForKey:@"whitelistEnabled"];
      if (v6 && ([v6 BOOLValue] & 1) != 0) {
        return 2;
      }
      if (v4)
      {
        if [v4 BOOLValue] && v5 && (objc_msgSend(v5, "BOOLValue")) {
          return 1;
        }
        if ([v4 BOOLValue]) {
          return 3;
        }
      }
      if (v5 && ([v5 BOOLValue] & 1) != 0) {
        return 4;
      }
      else {
        return 0;
      }
    }
  }
  return result;
}

- (NSString)userName
{
  return self->_userName;
}

- (id)_userSettingsForUser:(id)a3
{
  p_userSettings = (uint64_t *)&self->_userSettings;
  if (!self->_userSettings)
  {
    id v5 = [(WFUserSettings *)self _managedDefaultsPath];
    if (v5)
    {
      uint64_t *p_userSettings = (uint64_t)(id)[NSDictionary dictionaryWithContentsOfFile:v5];
      v6 = __WFDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        [(WFUserSettings *)(uint64_t)a3 _userSettingsForUser:v6];
      }
    }
  }
  return (id)*p_userSettings;
}

- (WFUserSettings)initWithUserName:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFUserSettings;
  v4 = [(WFUserSettings *)&v7 init];
  id v5 = v4;
  if (v4) {
    [(WFUserSettings *)v4 setUserName:a3];
  }
  return v5;
}

- (void)setUserName:(id)a3
{
}

- (id)_managedDefaultsPath
{
  return (id)[NSString stringWithFormat:@"/Library/Managed Preferences/%@/com.apple.webcontentfilter.plist", @"mobile"];
}

- (BOOL)_setManagedDefaults:(id)a3
{
  id v4 = [(WFUserSettings *)self _managedDefaultsPath];
  return [a3 writeToFile:v4 atomically:1];
}

- (BOOL)_addManagedDefaults:(id)a3
{
  id v5 = objc_msgSend((id)objc_msgSend(NSDictionary, "dictionaryWithContentsOfFile:", -[WFUserSettings _managedDefaultsPath](self, "_managedDefaultsPath")), "mutableCopy");
  v6 = v5;
  if (v5)
  {
    [v5 addEntriesFromDictionary:a3];
    a3 = v6;
  }
  BOOL v7 = [(WFUserSettings *)self _setManagedDefaults:a3];

  return v7;
}

- (void)dealloc
{
  [(WFUserSettings *)self setUserName:0];
  v3.receiver = self;
  v3.super_class = (Class)WFUserSettings;
  [(WFUserSettings *)&v3 dealloc];
}

- (void)setRestrictionType:(int64_t)a3
{
  switch(a3)
  {
    case 2:
      [(WFUserSettings *)self _addManagedDefaults:&unk_26C7B0B70];
      [(WFUserSettings *)self _addManagedDefaults:&unk_26C7B0B98];
      [(WFUserSettings *)self _addManagedDefaults:&unk_26C7B0BC0];
      id v4 = &unk_26C7B0BE8;
      goto LABEL_7;
    case 1:
      [(WFUserSettings *)self _addManagedDefaults:&unk_26C7B0AD0];
      [(WFUserSettings *)self _addManagedDefaults:&unk_26C7B0AF8];
      [(WFUserSettings *)self _addManagedDefaults:&unk_26C7B0B20];
      id v4 = &unk_26C7B0B48;
      goto LABEL_7;
    case 0:
      [(WFUserSettings *)self _addManagedDefaults:&unk_26C7B0A30];
      [(WFUserSettings *)self _addManagedDefaults:&unk_26C7B0A58];
      [(WFUserSettings *)self _addManagedDefaults:&unk_26C7B0A80];
      id v4 = &unk_26C7B0AA8;
LABEL_7:
      [(WFUserSettings *)self _addManagedDefaults:v4];
      return;
  }
  [(WFUserSettings *)self setRestrictionType:0];
}

- (BOOL)canEditRestrictionType
{
  return 1;
}

- (NSArray)contentFilterOverriddenWhiteListedSites
{
  id v2 = [(WFUserSettings *)self _userSettingsForUser:[(WFUserSettings *)self userName]];
  return (NSArray *)[v2 objectForKey:@"filterWhitelist"];
}

- (void)setContentFilterOverriddenWhiteListedSites:(id)a3
{
  v4[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    objc_super v3 = @"filterWhitelist";
    v4[0] = a3;
    -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1]);
  }
}

- (BOOL)canEditContentFilterOverriddenWhiteListedSites
{
  return 1;
}

- (NSArray)contentFilterOverriddenBlackListedSites
{
  id v2 = [(WFUserSettings *)self _userSettingsForUser:[(WFUserSettings *)self userName]];
  return (NSArray *)[v2 objectForKey:@"filterBlacklist"];
}

- (void)setContentFilterOverriddenBlackListedSites:(id)a3
{
  v4[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    objc_super v3 = @"filterBlacklist";
    v4[0] = a3;
    -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1]);
  }
}

- (BOOL)canEditContentFilterOverriddenBlackListedSites
{
  return 1;
}

- (NSArray)whiteListAllowedSites
{
  id v2 = [(WFUserSettings *)self _userSettingsForUser:[(WFUserSettings *)self userName]];
  return (NSArray *)[v2 objectForKey:@"siteWhitelist"];
}

- (void)setWhiteListAllowedSites:(id)a3
{
  v4[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    objc_super v3 = @"siteWhitelist";
    v4[0] = a3;
    -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", [NSDictionary dictionaryWithObjects:v4 forKeys:&v3 count:1]);
  }
}

- (BOOL)canEditWhiteListAllowedSites
{
  return 1;
}

- (BOOL)overridesAllowed
{
  id v2 = [(WFUserSettings *)self _userSettingsForUser:[(WFUserSettings *)self userName]];
  if (v2 && (objc_super v3 = (void *)[v2 objectForKey:@"noOverridingAllowed"]) != 0) {
    return [v3 BOOLValue] ^ 1;
  }
  else {
    return 1;
  }
}

- (void)setOverridesAllowed:(BOOL)a3
{
  v5[1] = *MEMORY[0x263EF8340];
  id v4 = @"noOverridingAllowed";
  v5[0] = [NSNumber numberWithBool:!a3];
  -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1]);
}

- (BOOL)canEditOverridesAllowed
{
  return 1;
}

- (BOOL)alwaysAllowHTTPS
{
  id v2 = [(WFUserSettings *)self _userSettingsForUser:[(WFUserSettings *)self userName]];
  if (!v2) {
    return 0;
  }
  objc_super v3 = (void *)[v2 objectForKey:@"alwaysAllowHTTPS"];
  if (!v3) {
    return 0;
  }
  return [v3 BOOLValue];
}

- (void)setAlwaysAllowHTTPS:(BOOL)a3
{
  v5[1] = *MEMORY[0x263EF8340];
  id v4 = @"alwaysAllowHTTPS";
  v5[0] = [NSNumber numberWithBool:a3];
  -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1]);
}

- (BOOL)canEditAlwaysAllowHTTPS
{
  return 1;
}

- (BOOL)contentFilterListsAllowURL:(id)a3
{
  id v5 = objc_msgSend((id)objc_msgSend(a3, "scheme"), "lowercaseString");
  if (([v5 isEqualToString:@"https"] & 1) == 0
    && ![v5 isEqualToString:@"http"])
  {
    return 1;
  }
  uint64_t v6 = [a3 absoluteString];
  if ([(WFUserSettings *)self contentFilterOverridesEnabled])
  {
    if ([(WFUserSettings *)self contentFilterOverriddenBlackListContainsURL:v6])
    {
      return 0;
    }
    if ([(WFUserSettings *)self contentFilterOverriddenWhiteListContainsURL:v6]|| [(WFUserSettings *)self autoWhitelistContainsURL:a3])
    {
      return 1;
    }
  }
  if (![(WFUserSettings *)self whiteListEnabled]
    || [(WFUserSettings *)self whiteListContainsURL:v6])
  {
    return 1;
  }
  return [(WFUserSettings *)self autoWhitelistContainsURL:a3];
}

- (BOOL)restrictWebEnabled
{
  id v2 = [(WFUserSettings *)self _userSettingsForUser:[(WFUserSettings *)self userName]];
  if (!v2) {
    return 0;
  }
  objc_super v3 = (void *)[v2 objectForKey:@"restrictWeb"];
  if (!v3) {
    return 0;
  }
  return [v3 BOOLValue];
}

- (void)setRestrictWebEnabled:(BOOL)a3
{
  v5[1] = *MEMORY[0x263EF8340];
  id v4 = @"restrictWeb";
  v5[0] = [NSNumber numberWithBool:a3];
  -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1]);
}

- (BOOL)contentFilterEnabled
{
  id v2 = [(WFUserSettings *)self _userSettingsForUser:[(WFUserSettings *)self userName]];
  if (!v2) {
    return 0;
  }
  objc_super v3 = (void *)[v2 objectForKey:@"useContentFilter"];
  if (!v3) {
    return 0;
  }
  return [v3 BOOLValue];
}

- (void)setContentFilterEnabled:(BOOL)a3
{
  v5[1] = *MEMORY[0x263EF8340];
  id v4 = @"useContentFilter";
  v5[0] = [NSNumber numberWithBool:a3];
  -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1]);
}

- (BOOL)contentFilterOverridesEnabled
{
  id v2 = [(WFUserSettings *)self _userSettingsForUser:[(WFUserSettings *)self userName]];
  if (!v2) {
    return 0;
  }
  objc_super v3 = (void *)[v2 objectForKey:@"useContentFilterOverrides"];
  if (!v3) {
    return 0;
  }
  return [v3 BOOLValue];
}

- (void)setContentFilterOverridesEnabled:(BOOL)a3
{
  v5[1] = *MEMORY[0x263EF8340];
  id v4 = @"useContentFilterOverrides";
  v5[0] = [NSNumber numberWithBool:a3];
  -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1]);
}

- (BOOL)whiteListEnabled
{
  id v2 = [(WFUserSettings *)self _userSettingsForUser:[(WFUserSettings *)self userName]];
  if (!v2) {
    return 0;
  }
  objc_super v3 = (void *)[v2 objectForKey:@"whitelistEnabled"];
  if (!v3) {
    return 0;
  }
  return [v3 BOOLValue];
}

- (void)setWhiteListEnabled:(BOOL)a3
{
  v5[1] = *MEMORY[0x263EF8340];
  id v4 = @"whitelistEnabled";
  v5[0] = [NSNumber numberWithBool:a3];
  -[WFUserSettings _addManagedDefaults:](self, "_addManagedDefaults:", [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1]);
}

- (id)contentFilterOverriddenWhiteListedSitesBuffer
{
  return [(WFUserSettings *)self contentFilterOverriddenWhiteListedSitesBufferWithAdditionalURLStrings:0];
}

- (id)contentFilterOverriddenWhiteListedSitesBufferWithAdditionalURLStrings:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!self->_contentFilterOverriddenWhiteListedSitesBuffer)
  {
    uint64_t v6 = objc_alloc_init(WFWhitelistSiteBuffer);
    self->_contentFilterOverriddenWhiteListedSitesBuffer = v6;
    [(WFWhitelistSiteBuffer *)v6 addURLString:@"https://setup.icloud.com"];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(a3);
          }
          [(WFWhitelistSiteBuffer *)self->_contentFilterOverriddenWhiteListedSitesBuffer addURLString:*(void *)(*((void *)&v21 + 1) + 8 * i)];
        }
        uint64_t v8 = [a3 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v8);
    }
    v11 = [(WFUserSettings *)self contentFilterOverriddenWhiteListedSites];
    if (v11)
    {
      v12 = v11;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v13 = [(NSArray *)v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v18;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v18 != v15) {
              objc_enumerationMutation(v12);
            }
            [(WFWhitelistSiteBuffer *)self->_contentFilterOverriddenWhiteListedSitesBuffer addURLString:*(void *)(*((void *)&v17 + 1) + 8 * j)];
          }
          uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
        }
        while (v14);
      }
    }
  }
  return self->_contentFilterOverriddenWhiteListedSitesBuffer;
}

- (id)contentFilterOverriddenBlackListedSitesBuffer
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (!self->_contentFilterOverriddenBlackListedSitesBuffer)
  {
    self->_contentFilterOverriddenBlackListedSitesBuffer = objc_alloc_init(WFWhitelistSiteBuffer);
    id v4 = [(WFUserSettings *)self contentFilterOverriddenBlackListedSites];
    if (v4)
    {
      id v5 = v4;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v11;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v11 != v8) {
              objc_enumerationMutation(v5);
            }
            [(WFWhitelistSiteBuffer *)self->_contentFilterOverriddenBlackListedSitesBuffer addURLString:*(void *)(*((void *)&v10 + 1) + 8 * i)];
          }
          uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        }
        while (v7);
      }
    }
  }
  return self->_contentFilterOverriddenBlackListedSitesBuffer;
}

- (id)whiteListedSitesBuffer
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (!self->_whiteListedSitesBuffer)
  {
    self->_whiteListedSitesBuffer = objc_alloc_init(WFWhitelistSiteBuffer);
    [(WFWhitelistSiteBuffer *)self->_contentFilterOverriddenWhiteListedSitesBuffer addURLString:@"https://setup.icloud.com"];
    id v4 = [(WFUserSettings *)self whiteListAllowedSites];
    if (v4)
    {
      id v5 = v4;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v15 = 0u;
      long long v16 = 0u;
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v16 != v8) {
              objc_enumerationMutation(v5);
            }
            long long v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              uint64_t v11 = [v10 objectForKey:@"address"];
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && v11) {
                [(WFWhitelistSiteBuffer *)self->_whiteListedSitesBuffer addURLString:v11];
              }
            }
            else
            {
              long long v12 = __WFDefaultLog();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
                [(WFUserSettings *)&v13 whiteListedSitesBuffer];
              }
            }
          }
          uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v7);
      }
    }
  }
  return self->_whiteListedSitesBuffer;
}

- (BOOL)contentFilterOverriddenList:(id)a3 containsURL:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "WF_stringByProperlyFixingPercentEscapesUsingEncoding:", 4);
  if (v5 && (uint64_t v6 = (void *)[NSURL URLWithString:v5]) != 0)
  {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(v6, "absoluteString"), "WF_stringByProperlyFixingPercentEscapesUsingEncoding:", 4);
    return [a3 containsURLString:v7];
  }
  else
  {
    uint64_t v9 = __WFDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[WFUserSettings contentFilterOverriddenList:containsURL:](v5, v9);
    }
    return 0;
  }
}

- (BOOL)contentFilterOverriddenWhiteListContainsURL:(id)a3 withAppleAllowList:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v7 = __WFDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = a3;
    _os_log_impl(&dword_217734000, v7, OS_LOG_TYPE_INFO, "Checking if %@ is in contentFilterOverriddenWhiteList:withAppleAllowList", (uint8_t *)&v9, 0xCu);
  }
  return -[WFUserSettings contentFilterOverriddenList:containsURL:](self, "contentFilterOverriddenList:containsURL:", -[WFUserSettings contentFilterOverriddenWhiteListedSitesBufferWithAdditionalURLStrings:](self, "contentFilterOverriddenWhiteListedSitesBufferWithAdditionalURLStrings:", [a4 allowList]), a3);
}

- (BOOL)contentFilterOverriddenWhiteListContainsURL:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = __WFDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = a3;
    _os_log_impl(&dword_217734000, v5, OS_LOG_TYPE_INFO, "Checking if %@ is in contentFilterOverriddenWhiteList", (uint8_t *)&v7, 0xCu);
  }
  return [(WFUserSettings *)self contentFilterOverriddenList:[(WFUserSettings *)self contentFilterOverriddenWhiteListedSitesBuffer] containsURL:a3];
}

- (BOOL)contentFilterOverriddenBlackListContainsURL:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = __WFDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = a3;
    _os_log_impl(&dword_217734000, v5, OS_LOG_TYPE_INFO, "Checking if %@ is in contentFilterOverriddenBlackList", (uint8_t *)&v7, 0xCu);
  }
  return [(WFUserSettings *)self contentFilterOverriddenList:[(WFUserSettings *)self contentFilterOverriddenBlackListedSitesBuffer] containsURL:a3];
}

- (BOOL)whiteListContainsURL:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = __WFDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = a3;
    _os_log_impl(&dword_217734000, v5, OS_LOG_TYPE_INFO, "Checking if %@ is in whiteList", (uint8_t *)&v7, 0xCu);
  }
  return [(WFUserSettings *)self contentFilterOverriddenList:[(WFUserSettings *)self whiteListedSitesBuffer] containsURL:a3];
}

- (BOOL)autoWhitelistContainsURL:(id)a3
{
  objc_super v3 = objc_msgSend((id)objc_msgSend(a3, "host"), "lowercaseString");
  if (([v3 isEqualToString:@"apple.com"] & 1) != 0
    || ([v3 hasSuffix:@".apple.com"] & 1) != 0
    || ([v3 isEqualToString:@"icloud.com"] & 1) != 0
    || ([v3 hasSuffix:@".icloud.com"] & 1) != 0
    || ([v3 isEqualToString:@"me.com"] & 1) != 0
    || ([v3 hasSuffix:@".me.com"] & 1) != 0
    || ([v3 isEqualToString:@"mac.com"] & 1) != 0)
  {
    return 1;
  }
  return [v3 hasSuffix:@".mac.com"];
}

+ (id)metasitesPath
{
  id v2 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return (id)[v2 pathForResource:@"metasites" ofType:@"txt"];
}

+ (id)metasitesExceptionPath
{
  id v2 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return (id)[v2 pathForResource:@"metasites_exceptions" ofType:@"txt"];
}

+ (id)_arrayByConvertingLinesInStringsAtPath:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (void *)[MEMORY[0x263EFF980] array];
  uint64_t v5 = (void *)[NSString stringWithContentsOfFile:a3 encoding:4 error:0];
  if (v5)
  {
    uint64_t v6 = (void *)[v5 componentsSeparatedByString:@"\n"];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v11 length])
          {
            if (([v11 hasPrefix:@"#"] & 1) == 0) {
              [v4 addObject:v11];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    return (id)[MEMORY[0x263EFF8C0] arrayWithArray:v4];
  }
  else
  {
    uint8_t v13 = __WFDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[WFUserSettings _arrayByConvertingLinesInStringsAtPath:](v13);
    }
    return 0;
  }
}

+ (id)_metasiteDomainNamesArray
{
  id v2 = objc_msgSend(a1, "_arrayByConvertingLinesInStringsAtPath:", objc_msgSend((id)objc_opt_class(), "metasitesPath"));
  if (!v2)
  {
    objc_super v3 = __WFDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[WFUserSettings _metasiteDomainNamesArray](v3);
    }
  }
  return v2;
}

+ (id)_sharedMetasiteExceptionsDomainNamesArray
{
  if (!_sharedMetasiteExceptionsDomainNamesArray_result_0)
  {
    _sharedMetasiteExceptionsDomainNamesArray_result_0 = objc_msgSend(a1, "_arrayByConvertingLinesInStringsAtPath:", objc_msgSend((id)objc_opt_class(), "metasitesExceptionPath"));
    id v2 = (id)_sharedMetasiteExceptionsDomainNamesArray_result_0;
    if (!_sharedMetasiteExceptionsDomainNamesArray_result_0)
    {
      objc_super v3 = __WFDefaultLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        +[WFUserSettings _metasiteDomainNamesArray](v3);
      }
    }
  }
  return (id)_sharedMetasiteExceptionsDomainNamesArray_result_0;
}

+ (id)_sharedMetasiteDomainNamesDictionary
{
  id result = (id)_sharedMetasiteDomainNamesDictionary_result_0;
  if (!_sharedMetasiteDomainNamesDictionary_result_0)
  {
    uint64_t v4 = [a1 _metasiteDomainNamesArray];
    _sharedMetasiteDomainNamesDictionary_result_0 = [NSDictionary dictionaryWithObjects:v4 forKeys:v4];
    id v5 = (id)_sharedMetasiteDomainNamesDictionary_result_0;
    return (id)_sharedMetasiteDomainNamesDictionary_result_0;
  }
  return result;
}

- (void)_userSettingsForUser:(os_log_t)log .cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_217734000, log, OS_LOG_TYPE_DEBUG, "_userSettingsForUser %@: %@", (uint8_t *)&v4, 0x16u);
}

- (void)whiteListedSitesBuffer
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_217734000, log, OS_LOG_TYPE_ERROR, "**** ERROR: siteWhitelist is malformed", buf, 2u);
}

- (void)contentFilterOverriddenList:(uint64_t)a1 containsURL:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2082;
  uint64_t v5 = "-[WFUserSettings contentFilterOverriddenList:containsURL:]";
  _os_log_error_impl(&dword_217734000, a2, OS_LOG_TYPE_ERROR, "**** URL (rawdata:%@) is nil, in %{public}s", (uint8_t *)&v2, 0x16u);
}

+ (void)_arrayByConvertingLinesInStringsAtPath:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136446210;
  int v2 = "+[WFUserSettings _arrayByConvertingLinesInStringsAtPath:]";
  _os_log_error_impl(&dword_217734000, log, OS_LOG_TYPE_ERROR, "%{public}s file content is nil", (uint8_t *)&v1, 0xCu);
}

+ (void)_metasiteDomainNamesArray
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_217734000, log, OS_LOG_TYPE_ERROR, "metasite.txt failed to load", v1, 2u);
}

@end