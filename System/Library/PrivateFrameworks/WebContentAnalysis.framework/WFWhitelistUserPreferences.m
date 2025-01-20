@interface WFWhitelistUserPreferences
+ (BOOL)_isURLMetasite:(id)a3;
+ (id)_arrayByConvertingLinesInStringsAtPath:(id)a3;
+ (id)_cachedWhitelistForPath:(id)a3 username:(id)a4;
+ (id)_metasiteDomainNamesArray;
+ (id)_modificationDateForFileAtPath:(id)a3;
+ (id)_sharedMetasiteDomainNamesDictionary;
+ (id)_sharedMetasiteExceptionsDomainNamesArray;
+ (id)defaultWhitelistForUser:(id)a3;
+ (id)metasitesExceptionPath;
+ (id)metasitesPath;
+ (id)preferencesPathForUsername:(id)a3;
+ (id)whitelistForUser:(id)a3;
+ (id)whitelistWithPreferences:(id)a3;
+ (void)_metasiteDomainNamesArray;
- (BOOL)alwaysAllowHTTPS;
- (BOOL)filterEnabled;
- (BOOL)isURL:(id)a3 onList:(id)a4;
- (BOOL)isURLAllowed:(id)a3;
- (BOOL)isURLAllowed:(id)a3 reason:(id *)a4 shouldFilter:(BOOL *)a5 foundOnList:(BOOL *)a6;
- (BOOL)whitelistEnabled;
- (NSString)username;
- (WFWhitelistSiteBuffer)filterBlacklist;
- (WFWhitelistSiteBuffer)filterWhitelist;
- (WFWhitelistSiteBuffer)webWhitelist;
- (WFWhitelistUserPreferences)init;
- (WFWhitelistUserPreferences)initWithPreferences:(id)a3;
- (id)description;
- (id)pronounceOnPageURLString:(id)a3 shouldFilter:(BOOL *)a4;
- (void)dealloc;
- (void)setAlwaysAllowHTTPS:(BOOL)a3;
- (void)setFilterEnabled:(BOOL)a3;
- (void)setUsername:(id)a3;
- (void)setWhitelistEnabled:(BOOL)a3;
@end

@implementation WFWhitelistUserPreferences

+ (id)preferencesPathForUsername:(id)a3
{
  if (a3) {
    return (id)[NSString stringWithFormat:@"/Library/Managed Preferences/%@/com.apple.familycontrols.contentfilter.plist", a3];
  }
  else {
    return 0;
  }
}

+ (id)metasitesPath
{
  v2 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return (id)[v2 pathForResource:@"metasites" ofType:@"txt"];
}

+ (id)metasitesExceptionPath
{
  v2 = (void *)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return (id)[v2 pathForResource:@"metasites_exceptions" ofType:@"txt"];
}

+ (id)_arrayByConvertingLinesInStringsAtPath:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  v4 = (void *)[MEMORY[0x263EFF980] array];
  v5 = (void *)[NSString stringWithContentsOfFile:a3 encoding:4 error:0];
  if (v5)
  {
    v6 = (void *)[v5 componentsSeparatedByString:@"\n"];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([v11 length])
          {
            if (([v11 hasPrefix:@"#"] & 1) == 0) {
              [v4 addObject:v11];
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }
    return (id)[MEMORY[0x263EFF8C0] arrayWithArray:v4];
  }
  else
  {
    v13 = __WFDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      +[WFWhitelistUserPreferences _arrayByConvertingLinesInStringsAtPath:](v13, v14, v15, v16, v17, v18, v19, v20);
    }
    return 0;
  }
}

+ (id)_metasiteDomainNamesArray
{
  v2 = objc_msgSend(a1, "_arrayByConvertingLinesInStringsAtPath:", objc_msgSend((id)objc_opt_class(), "metasitesPath"));
  if (!v2)
  {
    v3 = __WFDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[WFWhitelistUserPreferences _metasiteDomainNamesArray]();
    }
  }
  return v2;
}

+ (id)_sharedMetasiteExceptionsDomainNamesArray
{
  if (!_sharedMetasiteExceptionsDomainNamesArray_result)
  {
    _sharedMetasiteExceptionsDomainNamesArray_result = objc_msgSend(a1, "_arrayByConvertingLinesInStringsAtPath:", objc_msgSend((id)objc_opt_class(), "metasitesExceptionPath"));
    id v2 = (id)_sharedMetasiteExceptionsDomainNamesArray_result;
    if (!_sharedMetasiteExceptionsDomainNamesArray_result)
    {
      v3 = __WFDefaultLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        +[WFWhitelistUserPreferences _metasiteDomainNamesArray]();
      }
    }
  }
  return (id)_sharedMetasiteExceptionsDomainNamesArray_result;
}

+ (id)_sharedMetasiteDomainNamesDictionary
{
  id result = (id)_sharedMetasiteDomainNamesDictionary_result;
  if (!_sharedMetasiteDomainNamesDictionary_result)
  {
    uint64_t v4 = [a1 _metasiteDomainNamesArray];
    _sharedMetasiteDomainNamesDictionary_id result = [NSDictionary dictionaryWithObjects:v4 forKeys:v4];
    id v5 = (id)_sharedMetasiteDomainNamesDictionary_result;
    return (id)_sharedMetasiteDomainNamesDictionary_result;
  }
  return result;
}

+ (BOOL)_isURLMetasite:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = (void *)[(id)objc_opt_class() _sharedMetasiteDomainNamesDictionary];
  uint64_t v6 = [a3 host];
  if (v6)
  {
    uint64_t v6 = [v5 objectForKey:v6];
    if (v6)
    {
      uint64_t v7 = (void *)[a1 _sharedMetasiteExceptionsDomainNamesArray];
      uint64_t v8 = (void *)[a3 host];
      unint64_t v9 = [v8 length];
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      uint64_t v10 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v18 != v12) {
              objc_enumerationMutation(v7);
            }
            uint64_t v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
            uint64_t v15 = [v14 length];
            if (v15 - 1 < v9
              && (objc_msgSend((id)objc_msgSend(v8, "substringFromIndex:", v9 - v15), "isEqualToString:", v14) & 1) != 0)
            {
              LOBYTE(v6) = 0;
              return v6;
            }
          }
          uint64_t v11 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
          LOBYTE(v6) = 1;
          if (v11) {
            continue;
          }
          break;
        }
      }
      else
      {
        LOBYTE(v6) = 1;
      }
    }
  }
  return v6;
}

+ (id)whitelistWithPreferences:(id)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithPreferences:a3];
  return v3;
}

+ (id)whitelistForUser:(id)a3
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(a1, "preferencesPathForUsername:");
    return (id)[a1 whitelistWithPreferences:v4];
  }
  else
  {
    uint64_t v6 = __WFDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[WFWhitelistUserPreferences whitelistForUser:]();
    }
    return 0;
  }
}

+ (id)_modificationDateForFileAtPath:(id)a3
{
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "attributesOfItemAtPath:error:", a3, 0);
  if (!v3)
  {
    uint64_t v4 = __WFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[WFWhitelistUserPreferences _modificationDateForFileAtPath:]();
    }
  }
  return (id)[v3 objectForKey:*MEMORY[0x263F08048]];
}

+ (id)_cachedWhitelistForPath:(id)a3 username:(id)a4
{
  uint64_t v7 = objc_msgSend(a1, "_modificationDateForFileAtPath:");
  if (_cachedWhitelistForPath_username__static_sharedCache) {
    uint64_t v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:");
  }
  else {
    uint64_t v8 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  }
  unint64_t v9 = v8;
  uint64_t v10 = (void *)[v8 objectForKey:a4];
  if (!v10
    || (uint64_t v11 = v10,
        !objc_msgSend((id)objc_msgSend(v10, "objectForKey:", @"date"), "isEqualToDate:", v7))
    || (uint64_t v12 = (void *)[v11 objectForKey:@"whitelist"]) == 0)
  {
    uint64_t v12 = (void *)[a1 whitelistWithPreferences:a3];
    [v12 setUsername:a4];
    objc_msgSend(v9, "setObject:forKey:", objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v7, @"date", v12, @"whitelist", 0), a4);
    id v13 = (id)_cachedWhitelistForPath_username__static_sharedCache;
    _cachedWhitelistForPath_username__static_sharedCache = (uint64_t)(id)[NSDictionary dictionaryWithDictionary:v9];
  }
  return v12;
}

+ (id)defaultWhitelistForUser:(id)a3
{
  if (!a3)
  {
    unint64_t v9 = __WFDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[WFWhitelistUserPreferences whitelistForUser:]();
    }
    return 0;
  }
  uint64_t v5 = [(id)objc_opt_class() preferencesPathForUsername:a3];
  if (!v5)
  {
    uint64_t v10 = __WFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      +[WFWhitelistUserPreferences defaultWhitelistForUser:]((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);
    }
    return 0;
  }
  uint64_t v6 = v5;
  char v18 = 0;
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "fileExistsAtPath:isDirectory:", v5, &v18) & 1) != 0
    || v18)
  {
    return (id)[a1 _cachedWhitelistForPath:v6 username:a3];
  }
  uint64_t v7 = __WFDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    +[WFWhitelistUserPreferences defaultWhitelistForUser:]();
  }
  objc_opt_class();
  id v8 = (id)objc_opt_new();
  [v8 setUsername:a3];
  return v8;
}

- (WFWhitelistUserPreferences)init
{
  v4.receiver = self;
  v4.super_class = (Class)WFWhitelistUserPreferences;
  id v2 = [(WFWhitelistUserPreferences *)&v4 init];
  if (v2)
  {
    v2->filterWhitelist = objc_alloc_init(WFWhitelistSiteBuffer);
    v2->filterBlacklist = objc_alloc_init(WFWhitelistSiteBuffer);
    v2->webWhitelist = objc_alloc_init(WFWhitelistSiteBuffer);
    [(WFWhitelistSiteBuffer *)v2->filterWhitelist addURLString:@"https://setup.icloud.com"];
    [(WFWhitelistSiteBuffer *)v2->webWhitelist addURLString:@"https://setup.icloud.com"];
  }
  return v2;
}

- (WFWhitelistUserPreferences)initWithPreferences:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v3 = [(WFWhitelistUserPreferences *)self init];
  if (v3)
  {
    objc_super v4 = (void *)[NSDictionary dictionaryWithContentsOfFile:a3];
    if (v4)
    {
      uint64_t v5 = v4;
      v3->filterEnabled = objc_msgSend((id)objc_msgSend(v4, "valueForKey:", @"useContentFilter"), "BOOLValue");
      v3->whitelistEnabled = objc_msgSend((id)objc_msgSend(v5, "valueForKey:", @"whitelistEnabled"), "BOOLValue");
      v3->alwaysAllowHTTPS = objc_msgSend((id)objc_msgSend(v5, "valueForKey:", @"alwaysAllowHTTPS"), "BOOLValue");
      uint64_t v6 = (void *)[v5 valueForKey:@"filterWhitelist"];
      if (v6)
      {
        uint64_t v7 = v6;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v44;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v44 != v10) {
                objc_enumerationMutation(v7);
              }
              [(WFWhitelistSiteBuffer *)v3->filterWhitelist addURLString:*(void *)(*((void *)&v43 + 1) + 8 * i)];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
          }
          while (v9);
        }
      }
      uint64_t v12 = (void *)[v5 valueForKey:@"filterBlacklist"];
      if (v12)
      {
        uint64_t v13 = v12;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        uint64_t v14 = [v12 countByEnumeratingWithState:&v39 objects:v50 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v40;
          do
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v40 != v16) {
                objc_enumerationMutation(v13);
              }
              [(WFWhitelistSiteBuffer *)v3->filterBlacklist addURLString:*(void *)(*((void *)&v39 + 1) + 8 * j)];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v39 objects:v50 count:16];
          }
          while (v15);
        }
      }
      char v18 = (void *)[v5 valueForKey:@"siteWhitelist"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v49 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v36;
          do
          {
            for (uint64_t k = 0; k != v20; ++k)
            {
              if (*(void *)v36 != v21) {
                objc_enumerationMutation(v18);
              }
              long long v23 = *(void **)(*((void *)&v35 + 1) + 8 * k);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                uint64_t v24 = [v23 objectForKey:@"address"];
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && v24) {
                  [(WFWhitelistSiteBuffer *)v3->webWhitelist addURLString:v24];
                }
              }
              else
              {
                v25 = __WFDefaultLog();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v48 = a3;
                  _os_log_error_impl(&dword_217734000, v25, OS_LOG_TYPE_ERROR, "**** ERROR: siteWhitelist is malformed in %@", buf, 0xCu);
                }
              }
            }
            uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v49 count:16];
          }
          while (v20);
        }
      }
      else
      {
        uint64_t v26 = __WFDefaultLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[WFWhitelistUserPreferences initWithPreferences:]((uint64_t)a3, v26, v27, v28, v29, v30, v31, v32);
        }
      }
    }
    else
    {
      NSLog(&cfstr_DidnTFindPrefs.isa);
    }
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WFWhitelistUserPreferences;
  [(WFWhitelistUserPreferences *)&v3 dealloc];
}

- (BOOL)isURLAllowed:(id)a3
{
  return [(WFWhitelistUserPreferences *)self isURLAllowed:a3 reason:0 shouldFilter:0 foundOnList:0];
}

- (BOOL)isURLAllowed:(id)a3 reason:(id *)a4 shouldFilter:(BOOL *)a5 foundOnList:(BOOL *)a6
{
  uint64_t v11 = [(WFWhitelistUserPreferences *)self username];
  if (a4)
  {
    uint64_t v12 = @"User (null)";
    if (v11) {
      uint64_t v12 = (__CFString *)v11;
    }
    *a4 = (id)[NSString stringWithFormat:@"%@ has no web restrictions", v12];
  }
  if (self->whitelistEnabled)
  {
    uint64_t v13 = __WFDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_217734000, v13, OS_LOG_TYPE_INFO, "Checking whitelist", buf, 2u);
    }
    BOOL v14 = [(WFWhitelistUserPreferences *)self isURL:a3 onList:self->webWhitelist];
    uint64_t v15 = __WFDefaultLog();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (!v14)
    {
      if (v16)
      {
        *(_WORD *)uint64_t v27 = 0;
        _os_log_impl(&dword_217734000, v15, OS_LOG_TYPE_INFO, "URL is not on whitelist", v27, 2u);
      }
      LOBYTE(v17) = 0;
      if (!a4)
      {
        char v20 = 0;
        if (a5) {
          goto LABEL_34;
        }
        goto LABEL_42;
      }
      char v18 = @"URL is not on global white list";
      char v20 = 0;
      goto LABEL_32;
    }
    if (v16)
    {
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_217734000, v15, OS_LOG_TYPE_INFO, "URL is on whitelist", v28, 2u);
    }
    LOBYTE(v17) = 1;
    if (a4)
    {
      char v18 = @"URL is on global white list";
LABEL_19:
      char v20 = 1;
      goto LABEL_32;
    }
  }
  else if (self->filterEnabled)
  {
    uint64_t v19 = __WFDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v26 = 0;
      _os_log_impl(&dword_217734000, v19, OS_LOG_TYPE_INFO, "Checking always allow list", v26, 2u);
    }
    if (![(WFWhitelistUserPreferences *)self isURL:a3 onList:self->filterWhitelist])
    {
      uint64_t v21 = __WFDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_217734000, v21, OS_LOG_TYPE_INFO, "Checking never allow list", v25, 2u);
      }
      BOOL v17 = [(WFWhitelistUserPreferences *)self isURL:a3 onList:self->filterBlacklist];
      char v20 = !v17;
      if (!a4 || !v17)
      {
LABEL_33:
        if (a5) {
          goto LABEL_34;
        }
        goto LABEL_42;
      }
      char v20 = 0;
      LOBYTE(v17) = 1;
      char v18 = @"URL is on filter black list";
LABEL_32:
      *a4 = v18;
      goto LABEL_33;
    }
    LOBYTE(v17) = 1;
    if (a4)
    {
      char v18 = @"URL is on filter white list";
      goto LABEL_19;
    }
  }
  else
  {
    LOBYTE(v17) = 0;
  }
  char v20 = 1;
  if (a5)
  {
LABEL_34:
    BOOL v22 = self->filterEnabled && v17;
    BOOL v23 = !v22 && self->filterEnabled && !self->whitelistEnabled;
    *a5 = v23;
  }
LABEL_42:
  if (a6) {
    *a6 = v17;
  }
  return v20;
}

- (id)pronounceOnPageURLString:(id)a3 shouldFilter:(BOOL *)a4
{
  uint64_t v7 = objc_opt_new();
  [v7 setURL:a3];
  uint64_t v8 = objc_msgSend(a3, "WF_stringByProperlyFixingPercentEscapesUsingEncoding:", 4);
  if (!v8 || (uint64_t v9 = [NSURL URLWithString:v8]) == 0)
  {
    uint64_t v10 = __WFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[WFWhitelistUserPreferences pronounceOnPageURLString:shouldFilter:](v8, v10);
    }
    uint64_t v9 = 0;
  }
  uint64_t v14 = 0;
  char v13 = 0;
  objc_msgSend(v7, "setRestricted:", -[WFWhitelistUserPreferences isURLAllowed:reason:shouldFilter:foundOnList:](self, "isURLAllowed:reason:shouldFilter:foundOnList:", v9, &v14, a4, &v13) ^ 1);
  if (v13) {
    uint64_t v11 = 8;
  }
  else {
    uint64_t v11 = 9;
  }
  [v7 setEvidence:v11];
  [v7 setMessage:v14];
  return v7;
}

- (BOOL)isURL:(id)a3 onList:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v6 = __WFDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    uint64_t v12 = [a3 absoluteString];
    _os_log_impl(&dword_217734000, v6, OS_LOG_TYPE_INFO, "url: %@", (uint8_t *)&v11, 0xCu);
  }
  if (a3) {
    int v7 = objc_msgSend(a4, "containsURLString:", objc_msgSend((id)objc_msgSend(a3, "absoluteString"), "WF_stringByProperlyFixingPercentEscapesUsingEncoding:", 4));
  }
  else {
    int v7 = 0;
  }
  uint64_t v8 = __WFDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = @"NO";
    if (v7) {
      uint64_t v9 = @"YES";
    }
    int v11 = 138412290;
    uint64_t v12 = (uint64_t)v9;
    _os_log_impl(&dword_217734000, v8, OS_LOG_TYPE_INFO, "id result = %@", (uint8_t *)&v11, 0xCu);
  }
  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p username:%@ filterEnabled:%d whitelistEnabled:%d filterWhitelist:%@ filterBlacklist:%@ webWhitelist:%@>", objc_msgSend((id)objc_opt_class(), "description"), self, self->username, self->filterEnabled, self->whitelistEnabled, self->filterWhitelist, self->filterBlacklist, self->webWhitelist];
}

- (BOOL)filterEnabled
{
  return self->filterEnabled;
}

- (void)setFilterEnabled:(BOOL)a3
{
  self->filterEnabled = a3;
}

- (BOOL)whitelistEnabled
{
  return self->whitelistEnabled;
}

- (void)setWhitelistEnabled:(BOOL)a3
{
  self->whitelistEnabled = a3;
}

- (BOOL)alwaysAllowHTTPS
{
  return self->alwaysAllowHTTPS;
}

- (void)setAlwaysAllowHTTPS:(BOOL)a3
{
  self->alwaysAllowHTTPS = a3;
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUsername:(id)a3
{
}

- (WFWhitelistSiteBuffer)filterWhitelist
{
  return self->filterWhitelist;
}

- (WFWhitelistSiteBuffer)filterBlacklist
{
  return self->filterBlacklist;
}

- (WFWhitelistSiteBuffer)webWhitelist
{
  return self->webWhitelist;
}

+ (void)_arrayByConvertingLinesInStringsAtPath:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_metasiteDomainNamesArray
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217734000, v0, v1, "metasite.txt failed to load", v2, v3, v4, v5, v6);
}

+ (void)whitelistForUser:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217734000, v0, v1, "WFWhitelist: Whitelist passed nil username.", v2, v3, v4, v5, v6);
}

+ (void)_modificationDateForFileAtPath:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217734000, v0, v1, "Error whitelist file attributes dictionary is nil", v2, v3, v4, v5, v6);
}

+ (void)defaultWhitelistForUser:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)defaultWhitelistForUser:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_217734000, v0, v1, "No website restrictions user preferecences file found: setting unrestricted settings", v2, v3, v4, v5, v6);
}

- (void)initWithPreferences:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)pronounceOnPageURLString:(uint64_t)a1 shouldFilter:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2082;
  uint64_t v5 = "-[WFWhitelistUserPreferences pronounceOnPageURLString:shouldFilter:]";
  _os_log_error_impl(&dword_217734000, a2, OS_LOG_TYPE_ERROR, "**** ERROR: URL (rawdata:%@) is nil, in %{public}s", (uint8_t *)&v2, 0x16u);
}

@end