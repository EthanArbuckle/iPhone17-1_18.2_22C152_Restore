@interface LanguageAssetLoader
+ (id)sharedInstance;
- (BOOL)alreadyHandledLanguageOrID:(__CFString *)a3;
- (BOOL)checkFontAssetsSanityWithLanguageAssetInfo:(id)a3;
- (BOOL)dictionaryAssetMatched:(id)a3 primaryLanguages:(id)a4 assetInfo:(id)a5;
- (BOOL)fontAssetMatched:(id)a3 primaryLanguage:(id)a4 assetInfo:(id)a5;
- (BOOL)isPowerRequestSatisfied;
- (BOOL)primaryLanguageIsInBlackList:(id)a3 assetType:(id)a4 assetInfo:(id)a5;
- (BOOL)shouldExcludeProductWithLanguageAssetInfo:(id)a3;
- (LanguageAssetLoader)init;
- (id)alreadyInstalledAssetsWithPrimaryLanguages:(id)a3 results:(id)a4 assetInfo:(id)a5;
- (id)assetIdentifier:(id)a3 assetInfo:(id)a4;
- (id)assetServerWithAssetType:(id)a3;
- (id)downloadOptions:(id)a3;
- (id)effectiveAssetFlagArrayForAssetInfo:(id)a3;
- (id)filterIncompatibleFontAssets:(id)a3;
- (id)localAssetsWithType:(id)a3 assetInfo:(id)a4;
- (id)normalizedLanguage:(id)a3;
- (id)notificationStringWithPrimaryLanguage:(id)a3 assetInfo:(id)a4;
- (id)oldDictionaryAssetsWithLanguageAssetInfo:(id)a3;
- (void)actualDownloadLanguageAssets;
- (void)dealloc;
- (void)downloadLanguageAssets;
- (void)logAssetsWithAssetType:(id)a3;
- (void)purgeLocalFontAssetsWithType:(id)a3 mobileAssetVersionV2:(BOOL)a4;
- (void)reachabilityChanged;
- (void)reset;
- (void)setDownloadFlagToAssetFlagArray:(id)a3 primaryLanguages:(id)a4 assetInfo:(id)a5;
- (void)setIsKeyboardsChanged:(BOOL)a3;
- (void)updatePreferenceWithAssetIdentifier:(__CFString *)a3;
- (void)updatePreferenceWithLanguageOrID:(__CFString *)a3;
@end

@implementation LanguageAssetLoader

+ (id)sharedInstance
{
  if (qword_10000C5C0 != -1) {
    dispatch_once(&qword_10000C5C0, &stru_1000084E0);
  }
  return (id)qword_10000C5B8;
}

- (LanguageAssetLoader)init
{
  v7.receiver = self;
  v7.super_class = (Class)LanguageAssetLoader;
  v2 = [(LanguageAssetLoader *)&v7 init];
  if (v2)
  {
    v2->_langugeAssetsInfoPlist = (NSDictionary *)[objc_alloc((Class)NSDictionary) initWithContentsOfFile:@"/usr/share/com.apple.languageassetd/AssetInfo.plist"];
    v2->_productType = 0;
    *(_WORD *)&v2->_needRedownload = 0;
    v2->_reachabilityRef = 0;
    v3 = (__CFString *)MGCopyAnswer();
    if (v3)
    {
      v4 = v3;
      CFTypeID v5 = CFGetTypeID(v3);
      if (v5 == CFStringGetTypeID()) {
        v2->_productType = v4;
      }
      else {
        CFRelease(v4);
      }
    }
    v2->_reachabilityRef = SCNetworkReachabilityCreateWithName(0, "mesu.apple.com");
    v2->_compatibilityVersion = DCSDictionaryAssetGetCompatibilityVersion();
  }
  return v2;
}

- (void)dealloc
{
  productType = self->_productType;
  if (productType) {
    CFRelease(productType);
  }
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
  {
    Current = CFRunLoopGetCurrent();
    SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode);
    CFRelease(self->_reachabilityRef);
  }
  v6.receiver = self;
  v6.super_class = (Class)LanguageAssetLoader;
  [(LanguageAssetLoader *)&v6 dealloc];
}

- (void)setIsKeyboardsChanged:(BOOL)a3
{
  self->_isKeyboardsChanged = a3;
}

- (id)assetServerWithAssetType:(id)a3
{
  return (id)_ASServerURLForAssetType(a3, 0);
}

- (void)logAssetsWithAssetType:(id)a3
{
  uint64_t v5 = 0;
  objc_super v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v3 = objc_opt_new();
  [v3 setDiscretionary:0];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002CC4;
  v4[3] = &unk_100008508;
  v4[4] = &v5;
  +[MAAsset startCatalogDownload:@"com.apple.MobileAsset.DictionaryServices.dictionary2" options:v3 then:v4];
  while (!*((unsigned char *)v6 + 24))
    [+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop") runUntilDate:+[NSDate dateWithTimeIntervalSinceNow:0.1]];

  _Block_object_dispose(&v5, 8);
}

- (void)reset
{
  if (qword_10000C5C8 != -1) {
    dispatch_once(&qword_10000C5C8, &stru_100008528);
  }
}

- (void)updatePreferenceWithAssetIdentifier:(__CFString *)a3
{
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  CFArrayRef v5 = (const __CFArray *)CFPreferencesCopyAppValue(@"AssetDownloadStarted", @"com.apple.languageassetd");
  if (v5)
  {
    CFArrayRef v6 = v5;
    v8.length = CFArrayGetCount(v5);
    v8.location = 0;
    CFArrayAppendArray(Mutable, v6, v8);
    CFRelease(v6);
  }
  CFArrayAppendValue(Mutable, a3);
  CFPreferencesSetAppValue(@"AssetDownloadStarted", Mutable, @"com.apple.languageassetd");
  CFPreferencesAppSynchronize(@"com.apple.languageassetd");

  CFRelease(Mutable);
}

- (void)updatePreferenceWithLanguageOrID:(__CFString *)a3
{
  Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  CFArrayRef v5 = (const __CFArray *)CFPreferencesCopyAppValue(@"HandledLanguages", @"com.apple.languageassetd");
  if (v5)
  {
    CFArrayRef v6 = v5;
    v8.length = CFArrayGetCount(v5);
    v8.location = 0;
    CFArrayAppendArray(Mutable, v6, v8);
    CFRelease(v6);
  }
  CFArrayAppendValue(Mutable, a3);
  CFPreferencesSetAppValue(@"HandledLanguages", Mutable, @"com.apple.languageassetd");
  CFPreferencesAppSynchronize(@"com.apple.languageassetd");

  CFRelease(Mutable);
}

- (BOOL)alreadyHandledLanguageOrID:(__CFString *)a3
{
  CFArrayRef v4 = (const __CFArray *)CFPreferencesCopyAppValue(@"HandledLanguages", @"com.apple.languageassetd");
  if (!v4) {
    return 0;
  }
  CFArrayRef v5 = v4;
  v8.length = CFArrayGetCount(v4);
  v8.location = 0;
  BOOL v6 = CFArrayContainsValue(v5, v8, a3) != 0;
  CFRelease(v5);
  return v6;
}

- (id)assetIdentifier:(id)a3 assetInfo:(id)a4
{
  if (objc_msgSend(objc_msgSend(a3, "assetType"), "isEqualToString:", @"com.apple.MobileAsset.DictionaryServices.dictionary2"))
  {
    id v6 = [a3 attributes];
  }
  else
  {
    id v10 = [a3 assetType];
    if (![v10 isEqualToString:kFSFontAssetType]) {
      return 0;
    }
    id v11 = [[objc_msgSend(a3, "attributes") objectForKey:objc_msgSend(a4, "objectForKey:", @"IdentifierContainerAttributeKey")]
    if (!v11) {
      return 0;
    }
    v12 = v11;
    if (![v11 count]) {
      return 0;
    }
    id v6 = [v12 objectAtIndex:0];
  }
  uint64_t v7 = v6;
  id v8 = [a4 objectForKey:@"IdentifierAttributeKey"];

  return [v7 objectForKey:v8];
}

- (BOOL)dictionaryAssetMatched:(id)a3 primaryLanguages:(id)a4 assetInfo:(id)a5
{
  if ([objc_msgSend(objc_msgSend(objc_msgSend(a3, "attributes"), "objectForKey:", @"_CompatibilityVersion"), "integerValue") integerValue] != self->_compatibilityVersion)return 0; {
  [a3 attributes];
  }
  return DCSPreferredOrderOfDictionaryAssetAttributesForLanguages() != -1;
}

- (BOOL)fontAssetMatched:(id)a3 primaryLanguage:(id)a4 assetInfo:(id)a5
{
  id v8 = [[[a3 attributes] objectForKey:[a5 objectForKey:@"LanguageAttributeKey"]];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v24;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v23 + 1) + 8 * (void)v12) isEqualToString:a4])
        {
          id v9 = [[objc_msgSend(a5, "objectForKey:", @"LanguageAndFontFamilyNamesMapping") objectForKey:a4];
          if (v9)
          {
            v13 = v9;
            id v9 = [[objc_msgSend(a3, "attributes") objectForKey:objc_msgSend(a5, "objectForKey:", @"IdentifierContainerAttributeKey")];
            if (v9)
            {
              v14 = v9;
              id v9 = [v9 count];
              if (v9)
              {
                long long v21 = 0u;
                long long v22 = 0u;
                long long v19 = 0u;
                long long v20 = 0u;
                id v9 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
                if (v9)
                {
                  id v15 = v9;
                  uint64_t v16 = *(void *)v20;
                  while (2)
                  {
                    for (i = 0; i != v15; i = (char *)i + 1)
                    {
                      if (*(void *)v20 != v16) {
                        objc_enumerationMutation(v14);
                      }
                      if (objc_msgSend(v13, "containsObject:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "objectForKey:", objc_msgSend(a5, "objectForKey:", @"FontFamilyNameKey"))))
                      {
                        LOBYTE(v9) = 1;
                        return (char)v9;
                      }
                    }
                    id v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
                    LOBYTE(v9) = 0;
                    if (v15) {
                      continue;
                    }
                    break;
                  }
                }
              }
            }
          }
          return (char)v9;
        }
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
      id v10 = v9;
      if (v9) {
        continue;
      }
      break;
    }
  }
  return (char)v9;
}

- (id)downloadOptions:(id)a3
{
  id v3 = (id)objc_opt_new();
  [v3 setAllowsCellularAccess:0];
  [v3 setDiscretionary:0];
  return v3;
}

- (id)alreadyInstalledAssetsWithPrimaryLanguages:(id)a3 results:(id)a4 assetInfo:(id)a5
{
  id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = a4;
  id v10 = [a4 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v24 = *(void *)v30;
    uint64_t v22 = kFSFontAssetType;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v12);
        if ([v13 state] != (id)1)
        {
          if (objc_msgSend(objc_msgSend(v13, "assetType"), "isEqualToString:", @"com.apple.MobileAsset.DictionaryServices.dictionary2"))
          {
            if ([(LanguageAssetLoader *)self dictionaryAssetMatched:v13 primaryLanguages:a3 assetInfo:a5])
            {
              id v14 = [(LanguageAssetLoader *)self assetIdentifier:v13 assetInfo:a5];
              if (v14) {
                [v9 addObject:v14];
              }
            }
          }
          else if (objc_msgSend(objc_msgSend(v13, "assetType"), "isEqualToString:", v22))
          {
            long long v27 = 0u;
            long long v28 = 0u;
            long long v25 = 0u;
            long long v26 = 0u;
            id v15 = [a3 countByEnumeratingWithState:&v25 objects:v33 count:16];
            if (v15)
            {
              id v16 = v15;
              uint64_t v17 = *(void *)v26;
              do
              {
                for (i = 0; i != v16; i = (char *)i + 1)
                {
                  if (*(void *)v26 != v17) {
                    objc_enumerationMutation(a3);
                  }
                  if ([(LanguageAssetLoader *)self fontAssetMatched:v13 primaryLanguage:*(void *)(*((void *)&v25 + 1) + 8 * i) assetInfo:a5])
                  {
                    id v19 = [(LanguageAssetLoader *)self assetIdentifier:v13 assetInfo:a5];
                    if (v19) {
                      [v9 addObject:v19];
                    }
                  }
                }
                id v16 = [a3 countByEnumeratingWithState:&v25 objects:v33 count:16];
              }
              while (v16);
            }
          }
        }
        v12 = (char *)v12 + 1;
      }
      while (v12 != v11);
      id v20 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      id v11 = v20;
    }
    while (v20);
  }
  return v9;
}

- (BOOL)primaryLanguageIsInBlackList:(id)a3 assetType:(id)a4 assetInfo:(id)a5
{
  return ![a4 isEqualToString:kFSFontAssetType]
      || [objc_msgSend(a5, "objectForKey:", @"LanguageAndFontFamilyNamesMapping") objectForKey:a3] != 0;
}

- (id)notificationStringWithPrimaryLanguage:(id)a3 assetInfo:(id)a4
{
  id v5 = [a4 objectForKey:@"NotificationBaseKey"];

  return [v5 stringByAppendingString:a3];
}

- (id)localAssetsWithType:(id)a3 assetInfo:(id)a4
{
  id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(a3);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 state] != (id)1)
        {
          id v13 = [(LanguageAssetLoader *)self assetIdentifier:v12 assetInfo:a4];
          if (v13)
          {
            id v14 = v13;
            if (([v7 containsObject:v13] & 1) == 0) {
              [v7 addObject:v14];
            }
          }
        }
      }
      id v9 = [a3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  return v7;
}

- (id)filterIncompatibleFontAssets:(id)a3
{
  unsigned int v27 = FSGetMaxSupportedFontAssetCompatibilityVersion();
  CFArrayRef v4 = objc_opt_new();
  id v30 = (id)objc_opt_new();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = a3;
  id v28 = [a3 countByEnumeratingWithState:&v39 objects:v45 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v40;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v7 = [v6 attributes];
        id v8 = [v7 objectForKey:@"_CompatibilityVersion"];
        unsigned int v9 = [v8 unsignedIntValue];
        if (v9 <= v27)
        {
          unsigned int v10 = v9;
          [v30 addObject:v6];
          id v11 = [v7 objectForKey:@"FontInfo4"];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v12 = [v11 countByEnumeratingWithState:&v35 objects:v44 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v36;
            do
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v36 != v14) {
                  objc_enumerationMutation(v11);
                }
                id v16 = [*(id *)(*((void *)&v35 + 1) + 8 * (void)j) objectForKey:@"PostScriptFontName"];
                id v17 = [v4 objectForKey:v16];
                if (!v17 || [v17 intValue] < v10) {
                  [v4 setValue:v8 forKey:v16];
                }
              }
              id v13 = [v11 countByEnumeratingWithState:&v35 objects:v44 count:16];
            }
            while (v13);
          }
        }
      }
      id v28 = [obj countByEnumeratingWithState:&v39 objects:v45 count:16];
    }
    while (v28);
  }
  id v29 = (id)objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v18 = [v30 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (k = 0; k != v19; k = (char *)k + 1)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v30);
        }
        uint64_t v22 = *(void **)(*((void *)&v31 + 1) + 8 * (void)k);
        id v23 = [v22 attributes];
        if ([objc_msgSend(objc_msgSend(v4, "objectForKey:", objc_msgSend(objc_msgSend(objc_msgSend(v23, "objectForKey:", @"FontInfo4"), "objectAtIndexedSubscript:", 0), "objectForKey:", @"PostScriptFontName")), "isEqualToNumber:", objc_msgSend(v23, "objectForKey:", @"_CompatibilityVersion"))])[v29 addObject:v22]; {
      }
        }
      id v19 = [v30 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v19);
  }

  return v29;
}

- (id)effectiveAssetFlagArrayForAssetInfo:(id)a3
{
  id v4 = [a3 objectForKey:@"AssetType"];
  id v5 = +[NSMutableArray arrayWithCapacity:0];
  uint64_t v6 = (uint64_t)[[a3 objectForKey:@"MinCompatibilityVersion"] integerValue];
  id v7 = [(char *)[a3 objectForKey:@"MaxCompatibilityVersion"] integerValue];
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  BOOL v9 = !v8 && v6 <= (uint64_t)v7;
  int v10 = !v9;
  if (v10) {
    id v11 = 0;
  }
  else {
    id v11 = v7;
  }
  if (v10) {
    uint64_t v6 = 0;
  }
  id v12 = objc_opt_new();
  if (v6 > (uint64_t)v11)
  {
LABEL_20:
    if ([v4 isEqualToString:kFSFontAssetType])
    {
      id v14 = [(LanguageAssetLoader *)self filterIncompatibleFontAssets:v12];
    }
    else
    {
      id v14 = v12;
    }
    id v15 = +[NSMutableDictionary dictionaryWithCapacity:0];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v16 = [v14 countByEnumeratingWithState:&v49 objects:v56 count:16];
    if (!v16)
    {
LABEL_50:
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v32 = [(NSMutableDictionary *)v15 allKeys];
      id v33 = [v32 countByEnumeratingWithState:&v45 objects:v53 count:16];
      if (v33)
      {
        id v34 = v33;
        uint64_t v35 = *(void *)v46;
        do
        {
          for (i = 0; i != v34; i = (char *)i + 1)
          {
            if (*(void *)v46 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v45 + 1) + 8 * i);
            id v38 = [[-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v37) objectForKeyedSubscript:@"asset"];
            if ([v38 state] == (id)3
              || [v38 state] != (id)1
              && objc_msgSend(objc_msgSend(objc_msgSend(v38, "attributes"), "objectForKeyedSubscript:", @"_CompatibilityVersion"), "integerValue") != self->_compatibilityVersion)
            {
              [v38 purgeSync];
              [v38 refreshState];
              [(NSMutableDictionary *)v15 removeObjectForKey:v37];
            }
          }
          id v34 = [v32 countByEnumeratingWithState:&v45 objects:v53 count:16];
        }
        while (v34);
      }
      [(NSMutableArray *)v5 addObjectsFromArray:[(NSMutableDictionary *)v15 allValues]];
      goto LABEL_63;
    }
    id v17 = v16;
    uint64_t v18 = *(void *)v50;
    long long v42 = v5;
    id v43 = v14;
    id v41 = v4;
LABEL_25:
    uint64_t v19 = 0;
    while (1)
    {
      if (*(void *)v50 != v18) {
        objc_enumerationMutation(v14);
      }
      uint64_t v20 = *(void **)(*((void *)&v49 + 1) + 8 * v19);
      if ([v4 isEqualToString:@"com.apple.MobileAsset.DictionaryServices.dictionary2"])
      {
        id v21 = [[objc_msgSend(v20, "attributes") objectForKeyedSubscript:@"DictionaryPackageName"];
        if (v21)
        {
          id v22 = v21;
          id v23 = [[-[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v21) objectForKeyedSubscript:@"asset"];
          if (!v23) {
            goto LABEL_37;
          }
          uint64_t v24 = v23;
          if (objc_msgSend(objc_msgSend(objc_msgSend(v20, "attributes"), "objectForKeyedSubscript:", @"_CompatibilityVersion"), "integerValue") == self->_compatibilityVersion)
          {
            if (objc_msgSend(objc_msgSend(objc_msgSend(v24, "attributes"), "objectForKeyedSubscript:", @"_CompatibilityVersion"), "integerValue") != self->_compatibilityVersion|| (v25 = objc_msgSend(objc_msgSend(objc_msgSend(v20, "attributes"), "objectForKeyedSubscript:", @"_ContentVersion"), "integerValue"), id v4 = v41, v9 = (uint64_t)v25 <= (uint64_t)objc_msgSend(objc_msgSend(objc_msgSend(v24, "attributes"), "objectForKeyedSubscript:", @"_ContentVersion"), "integerValue"), v14 = v43,
                  !v9)
              || [v24 state] == (id)3)
            {
              if ([v24 state] == (id)1)
              {
LABEL_37:
                BOOL v26 = 0;
LABEL_44:
                v54[0] = @"asset";
                v54[1] = @"downloadNeeded";
                v55[0] = v20;
                v55[1] = +[NSNumber numberWithBool:v26];
                id v30 = [+[NSDictionary dictionaryWithObjects:v55 forKeys:v54 count:2] mutableCopy];
                [(NSMutableDictionary *)v15 setObject:v30 forKey:v22];

                goto LABEL_45;
              }
              int v27 = 1;
              id v28 = v24;
              uint64_t v24 = v20;
LABEL_42:
              [v28 purgeSync];
              [v28 refreshState];
              id v29 = [v24 state];
              BOOL v26 = v29 == (id)1;
              if (!v27)
              {
                id v5 = v42;
                id v14 = v43;
                if (v29 == (id)1) {
                  [v15 objectForKeyedSubscript:v22][@"downloadNeeded"] = __kCFBooleanTrue;
                }
                goto LABEL_45;
              }
              id v5 = v42;
              id v14 = v43;
              goto LABEL_44;
            }
          }
          if ([v20 state] != (id)1)
          {
            int v27 = 0;
            id v28 = v20;
            goto LABEL_42;
          }
        }
      }
      else
      {
        [(NSMutableArray *)v5 addObject:+[NSMutableDictionary dictionaryWithObject:v20 forKey:@"asset"]];
      }
LABEL_45:
      if (v17 == (id)++v19)
      {
        id v31 = [v14 countByEnumeratingWithState:&v49 objects:v56 count:16];
        id v17 = v31;
        if (!v31) {
          goto LABEL_50;
        }
        goto LABEL_25;
      }
    }
  }
  while (1)
  {
    id v13 = [objc_alloc((Class)MAAssetQuery) initWithType:v4];
    [v13 returnTypes:2];
    [v13 setDoNotBlockBeforeFirstUnlock:1];
    if (v6 >= 1) {
      [v13 addKeyValuePair:@"_CompatibilityVersion", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%ld", v6) with];
    }
    if ([v13 queryMetaDataSync]) {
      break;
    }
    [v12 addObjectsFromArray:[v13 results]];

    if (v11 + 1 == (char *)++v6) {
      goto LABEL_20;
    }
  }

  id v5 = 0;
  self->_needRedownload = 1;
LABEL_63:
  return v5;
}

- (void)setDownloadFlagToAssetFlagArray:(id)a3 primaryLanguages:(id)a4 assetInfo:(id)a5
{
  id v10 = [a5 objectForKey:@"AssetType"];
  id obj = a4;
  if (a4)
  {
    long long v39 = v9;
    id v47 = v10;
    uint64_t v42 = kFSFontAssetType;
    id v11 = &ASServerURLForAssetType_ptr;
    id v44 = a3;
    if (objc_msgSend(v10, "isEqualToString:"))
    {
      id v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [a4 count]);
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v13 = [a4 countByEnumeratingWithState:&v60 objects:v67 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v61;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v61 != v15) {
              objc_enumerationMutation(a4);
            }
            uint64_t v17 = *(void *)(*((void *)&v60 + 1) + 8 * i);
            uint64_t v18 = +[NSString stringWithFormat:@"%@-%@", v47, v17];
            if (![(LanguageAssetLoader *)self alreadyHandledLanguageOrID:v18])
            {
              [(NSMutableArray *)v12 addObject:v17];
              [(LanguageAssetLoader *)self updatePreferenceWithLanguageOrID:v18];
            }
          }
          id v14 = [a4 countByEnumeratingWithState:&v60 objects:v67 count:16];
        }
        while (v14);
        id obj = v12;
        a3 = v44;
        id v11 = &ASServerURLForAssetType_ptr;
      }
      else
      {
        id obj = v12;
      }
    }
    id v19 = [v11[75] arrayWithCapacity:[a3 count]];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v20 = [a3 countByEnumeratingWithState:&v56 objects:v66 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v57;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v57 != v22) {
            objc_enumerationMutation(a3);
          }
          [v19 addObject:[*(id *)(*((void *)&v56 + 1) + 8 * (void)j) objectForKeyedSubscript:@"asset"]];
        }
        id v21 = [a3 countByEnumeratingWithState:&v56 objects:v66 count:16];
      }
      while (v21);
    }
    id v24 = [(LanguageAssetLoader *)self alreadyInstalledAssetsWithPrimaryLanguages:obj results:v19 assetInfo:a5];
    id v25 = [(LanguageAssetLoader *)self localAssetsWithType:v19 assetInfo:a5];
    id v43 = (void *)DCSDictionaryAssetCopyRemovedDictionaryIdentifiers();
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v26 = [a3 countByEnumeratingWithState:&v52 objects:v65 count:16];
    if (v26)
    {
      id v27 = v26;
      uint64_t v46 = *(void *)v53;
      id v40 = v25;
      id v41 = v24;
      do
      {
        for (k = 0; k != v27; k = (char *)k + 1)
        {
          if (*(void *)v53 != v46) {
            objc_enumerationMutation(v44);
          }
          id v29 = *(void **)(*((void *)&v52 + 1) + 8 * (void)k);
          id v30 = [v29 objectForKeyedSubscript:@"asset"];
          id v31 = [(LanguageAssetLoader *)self assetIdentifier:v30 assetInfo:a5];
          if (v31)
          {
            id v32 = v31;
            if (([v25 containsObject:v31] & 1) == 0
              && [v30 state] == (id)1
              && ([v24 containsObject:v32] & 1) == 0)
            {
              if (objc_msgSend(objc_msgSend(v30, "assetType"), "isEqualToString:", @"com.apple.MobileAsset.DictionaryServices.dictionary2"))
              {
                if (([v43 containsObject:v32] & 1) == 0)
                {
                  id v33 = +[NSString stringWithFormat:@"%@-%@", v47, v32];
                  if (![(LanguageAssetLoader *)self alreadyHandledLanguageOrID:v33])
                  {
                    if ([(LanguageAssetLoader *)self dictionaryAssetMatched:v30 primaryLanguages:obj assetInfo:a5])
                    {
                      [(LanguageAssetLoader *)self updatePreferenceWithLanguageOrID:v33];
LABEL_37:
                      [v29 setObject:&__kCFBooleanTrue forKeyedSubscript:@"downloadNeeded"];
                      id v25 = v40;
                      id v24 = v41;
                      continue;
                    }
                  }
                }
              }
              else if (objc_msgSend(objc_msgSend(v30, "assetType"), "isEqualToString:", v42))
              {
                long long v50 = 0u;
                long long v51 = 0u;
                long long v48 = 0u;
                long long v49 = 0u;
                id v34 = [obj countByEnumeratingWithState:&v48 objects:v64 count:16];
                if (v34)
                {
                  id v35 = v34;
                  uint64_t v36 = *(void *)v49;
LABEL_41:
                  uint64_t v37 = 0;
                  while (1)
                  {
                    if (*(void *)v49 != v36) {
                      objc_enumerationMutation(obj);
                    }
                    id v38 = *(__CFString **)(*((void *)&v48 + 1) + 8 * v37);
                    if ([(__CFString *)v38 isEqualToString:@"zh-HK"]) {
                      id v38 = @"zh-Hant";
                    }
                    if ([(LanguageAssetLoader *)self primaryLanguageIsInBlackList:v38 assetType:v47 assetInfo:a5]&& [(LanguageAssetLoader *)self fontAssetMatched:v30 primaryLanguage:v38 assetInfo:a5])
                    {
                      goto LABEL_37;
                    }
                    if (v35 == (id)++v37)
                    {
                      id v35 = [obj countByEnumeratingWithState:&v48 objects:v64 count:16];
                      id v25 = v40;
                      id v24 = v41;
                      if (v35) {
                        goto LABEL_41;
                      }
                      break;
                    }
                  }
                }
              }
            }
          }
        }
        id v27 = [v44 countByEnumeratingWithState:&v52 objects:v65 count:16];
      }
      while (v27);
    }

    BOOL v9 = v39;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    sub_100005B48();
  }
}

- (BOOL)isPowerRequestSatisfied
{
  if (IOPSDrawingUnlimitedPower()) {
    return 1;
  }
  IOPSGetPercentRemaining();
  return 0;
}

- (void)purgeLocalFontAssetsWithType:(id)a3 mobileAssetVersionV2:(BOOL)a4
{
  if (a4)
  {
    id v4 = [objc_alloc((Class)MAAssetQuery) initWithType:a3];
    [v4 returnTypes:1];
    [v4 setDoNotBlockBeforeFirstUnlock:1];
    if (![v4 queryMetaDataSync])
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v5 = [v4 results];
      id v6 = [v5 countByEnumeratingWithState:&v19 objects:v28 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v20;
        do
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v20 != v8) {
              objc_enumerationMutation(v5);
            }
            id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
            if ([v10 state] != (id)1) {
              [v10 purgeSync];
            }
          }
          id v7 = [v5 countByEnumeratingWithState:&v19 objects:v28 count:16];
        }
        while (v7);
      }
    }
  }
  else
  {
    id v4 = [objc_alloc((Class)ASAssetQuery) initWithAssetType:a3];
    [v4 setQueriesLocalAssetInformationOnly:1];
    uint64_t v27 = 0;
    id v11 = [v4 runQueryAndReturnError:&v27];
    uint64_t v12 = v27;
    if (v27)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_100005B90(v12);
      }
    }
    else
    {
      id v13 = v11;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v14 = [v11 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          for (j = 0; j != v15; j = (char *)j + 1)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
            if ([v18 state]) {
              [v18 purgeAndReturnError:0];
            }
          }
          id v15 = [v13 countByEnumeratingWithState:&v23 objects:v29 count:16];
        }
        while (v15);
      }
    }
  }
}

- (BOOL)checkFontAssetsSanityWithLanguageAssetInfo:(id)a3
{
  return 1;
}

- (BOOL)shouldExcludeProductWithLanguageAssetInfo:(id)a3
{
  if (self->_productType)
  {
    id v4 = [a3 objectForKey:@"ExclusionProductTypesKey"];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([(__CFString *)self->_productType hasPrefix:*(void *)(*((void *)&v10 + 1) + 8 * i)])
          {
            LOBYTE(v5) = 1;
            return (char)v5;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        LOBYTE(v5) = 0;
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (id)normalizedLanguage:(id)a3
{
  id v3 = +[NSLocale componentsFromLocaleIdentifier:a3];
  id v4 = [(NSDictionary *)v3 objectForKey:NSLocaleLanguageCode];
  if (v4)
  {
    id v5 = [(NSDictionary *)v3 objectForKey:NSLocaleCountryCode];
    if ([(__CFString *)v4 isEqualToString:@"zh"])
    {
      id v6 = [(NSDictionary *)v3 objectForKey:NSLocaleScriptCode];
      if (([v6 isEqualToString:@"Hans"] & 1) != 0
        || [v6 isEqualToString:@"Hant"])
      {
        return +[NSString stringWithFormat:@"%@-%@", v4, v6];
      }
      if ([(__CFString *)v5 isEqualToString:@"HK"])
      {
        return @"zh-Hant";
      }
      else
      {
        id v4 = @"zh-Hant";
        if (([(__CFString *)v5 isEqualToString:@"MO"] & 1) == 0
          && ![(__CFString *)v5 isEqualToString:@"TW"])
        {
          return 0;
        }
      }
    }
    else if ([(__CFString *)v4 isEqualToString:@"en"])
    {
      unsigned int v8 = [(__CFString *)v5 isEqualToString:@"SG"];
      CFStringRef v9 = @"GB";
      if (!v8) {
        CFStringRef v9 = v5;
      }
      if (v9) {
        return +[NSString stringWithFormat:@"%@-%@", v4, v9];
      }
    }
  }
  return v4;
}

- (void)actualDownloadLanguageAssets
{
  self->_needRedownload = 0;
  if ([(LanguageAssetLoader *)self isPowerRequestSatisfied])
  {
    id v3 = [(NSDictionary *)self->_langugeAssetsInfoPlist objectForKey:@"LanguageAssets"];
    id v4 = +[NSDictionary dictionaryWithContentsOfFile:@"/System/Library/PrivateFrameworks/FontServices.framework/FontAssetInfo.plist"];
    if (v4) {
      id v3 = [v3 arrayByAddingObject:v4];
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v16;
      long long v13 = (void *)kFSFontAssetType;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v3);
          }
          id v9 = *(id *)(*((void *)&v15 + 1) + 8 * i);
          id v10 = [v9 objectForKey:@"AssetType"];
          if (objc_msgSend(objc_msgSend(v9, "objectForKey:", @"Download"), "BOOLValue")
            && ![(LanguageAssetLoader *)self shouldExcludeProductWithLanguageAssetInfo:v9])
          {
            if ([v10 isEqualToString:@"com.apple.MobileAsset.Font"])
            {
              id v9 = [v9 mutableCopy];
              id v10 = v13;
              [v9 setObject:v13 forKey:@"AssetType"];
            }
            long long v11 = objc_opt_new();
            [v11 setAllowsCellularAccess:0];
            [v11 setDiscretionary:0];
            NSLog(@"startCatalogDownload: assetType=[%@]", v10);
            v14[0] = _NSConcreteStackBlock;
            v14[1] = 3221225472;
            v14[2] = sub_1000050EC;
            v14[3] = &unk_100008550;
            v14[4] = v10;
            v14[5] = self;
            v14[6] = v9;
            +[MAAsset startCatalogDownload:v10 options:v11 then:v14];
          }
        }
        id v6 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
    BOOL v12 = 0;
  }
  else
  {
    BOOL v12 = 1;
  }
  self->_needRedownload = v12;
}

- (void)downloadLanguageAssets
{
  reachabilityRef = self->_reachabilityRef;
  if (reachabilityRef)
  {
    Current = CFRunLoopGetCurrent();
    SCNetworkReachabilityUnscheduleFromRunLoop(reachabilityRef, Current, kCFRunLoopDefaultMode);
  }
  [(LanguageAssetLoader *)self actualDownloadLanguageAssets];
  if (self->_needRedownload)
  {
    id v5 = self->_reachabilityRef;
    if (v5)
    {
      v8.version = 0;
      memset(&v8.retain, 0, 24);
      v8.info = self;
      if (SCNetworkReachabilitySetCallback(v5, (SCNetworkReachabilityCallBack)sub_100005834, &v8))
      {
        id v6 = self->_reachabilityRef;
        uint64_t v7 = CFRunLoopGetCurrent();
        SCNetworkReachabilityScheduleWithRunLoop(v6, v7, kCFRunLoopDefaultMode);
      }
    }
  }
}

- (id)oldDictionaryAssetsWithLanguageAssetInfo:(id)a3
{
  id v4 = [objc_alloc((Class)ASAssetQuery) initWithAssetType:@"com.apple.MobileAsset.DictionaryServices.dictionary2"];
  [v4 setQueriesLocalAssetInformationOnly:1];
  id v5 = [v4 runQueryAndReturnError:0];
  id v6 = +[NSMutableArray arrayWithCapacity:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v11 state] == (id)1)
        {
          id v12 = [[[v11 attributes] objectForKey:[a3 objectForKey:@"IdentifierAttributeKey"]];
          [(NSMutableArray *)v6 addObject:v12];
          v14[0] = _NSConcreteStackBlock;
          v14[1] = 3221225472;
          v14[2] = sub_100005A38;
          v14[3] = &unk_100008578;
          v14[4] = v12;
          [v11 purge:v14];
        }
      }
      id v8 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  if ([(NSMutableArray *)v6 count]) {
    return v6;
  }
  else {
    return 0;
  }
}

- (void)reachabilityChanged
{
  if (self->_needRedownload)
  {
    reachabilityRef = self->_reachabilityRef;
    if (reachabilityRef)
    {
      SCNetworkReachabilityFlags flags = 0;
      if (SCNetworkReachabilityGetFlags(reachabilityRef, &flags)) {
        BOOL v4 = (flags & 2) == 0;
      }
      else {
        BOOL v4 = 1;
      }
      if (!v4)
      {
        [(LanguageAssetLoader *)self actualDownloadLanguageAssets];
        if (!self->_needRedownload)
        {
          id v5 = self->_reachabilityRef;
          Current = CFRunLoopGetCurrent();
          SCNetworkReachabilityUnscheduleFromRunLoop(v5, Current, kCFRunLoopDefaultMode);
        }
      }
    }
  }
}

@end