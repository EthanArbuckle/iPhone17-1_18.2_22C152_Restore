@interface RemovableSoftwareLookupTable
+ (BOOL)isRestrictedAppBundleIdentifier:(id)a3;
+ (id)_fallbackItemIdentifier:(id)a3;
+ (id)_urlForBundleIdentifier:(id)a3;
- (NSDictionary)bundleDictionary;
- (RemovableSoftwareLookupTable)init;
- (id)_identifierForBundleIdentifier:(id)a3;
- (void)_invalidateLookupCache:(id)a3;
- (void)_populateBundleDictionary;
- (void)dealloc;
@end

@implementation RemovableSoftwareLookupTable

- (RemovableSoftwareLookupTable)init
{
  v7.receiver = self;
  v7.super_class = (Class)RemovableSoftwareLookupTable;
  v2 = [(RemovableSoftwareLookupTable *)&v7 init];
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v2->_lock;
    v2->_lock = v3;

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel__invalidateLookupCache_ name:@"ISURLBagDidLoadNotification" object:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RemovableSoftwareLookupTable;
  [(RemovableSoftwareLookupTable *)&v4 dealloc];
}

- (NSDictionary)bundleDictionary
{
  [(NSLock *)self->_lock lock];
  bundleDictionary = self->_bundleDictionary;
  if (!bundleDictionary)
  {
    [(RemovableSoftwareLookupTable *)self _populateBundleDictionary];
    bundleDictionary = self->_bundleDictionary;
  }
  objc_super v4 = (void *)[(NSDictionary *)bundleDictionary copy];
  [(NSLock *)self->_lock unlock];

  return (NSDictionary *)v4;
}

+ (BOOL)isRestrictedAppBundleIdentifier:(id)a3
{
  id v3 = a3;
  objc_super v4 = v3;
  if (v3 && [v3 length])
  {
    v5 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v4];
    v6 = v5;
    if (v5) {
      char v7 = [v5 isRestricted];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_invalidateLookupCache:(id)a3
{
  [(NSLock *)self->_lock lock];
  bundleDictionary = self->_bundleDictionary;
  self->_bundleDictionary = 0;

  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (void)_populateBundleDictionary
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v23 = [MEMORY[0x263EFF9A0] dictionary];
  id v3 = +[ISURLBagCache sharedCache];
  objc_super v4 = [MEMORY[0x263F7B358] contextWithBagType:0];
  v5 = [v3 URLBagForContext:v4];

  v6 = [v5 valueForKey:@"hideableSystemApps"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v21 = v5;
    v22 = self;
    v20 = v6;
    id v7 = v6;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v25;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v25 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v24 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v13 = v12;
            v14 = [v13 objectForKey:@"id"];
            v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "integerValue"));
            v16 = [v13 objectForKey:@"bundle-id"];

            if (v16) {
              BOOL v17 = v15 == 0;
            }
            else {
              BOOL v17 = 1;
            }
            if (!v17) {
              [v23 setObject:v15 forKey:v16];
            }
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v9);
    }

    v5 = v21;
    self = v22;
    v6 = v20;
  }
  v18 = (NSDictionary *)objc_msgSend(v23, "copy", v20, v21, v22);
  bundleDictionary = self->_bundleDictionary;
  self->_bundleDictionary = v18;
}

- (id)_identifierForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(RemovableSoftwareLookupTable *)self bundleDictionary];
    v6 = [v5 objectForKey:v4];

    if (!v6)
    {
      v6 = +[RemovableSoftwareLookupTable _fallbackItemIdentifier:v4];
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_fallbackItemIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.calculator"])
  {
    id v4 = &unk_26C6B0350;
  }
  else if ([v3 isEqualToString:@"com.apple.mobilecal"])
  {
    id v4 = &unk_26C6B0368;
  }
  else if ([v3 isEqualToString:@"com.apple.compass"])
  {
    id v4 = &unk_26C6B0380;
  }
  else if ([v3 isEqualToString:@"com.apple.facetime"])
  {
    id v4 = &unk_26C6B0398;
  }
  else if ([v3 isEqualToString:@"com.apple.mobileme.fmf1"])
  {
    id v4 = &unk_26C6B03B0;
  }
  else if ([v3 isEqualToString:@"com.apple.mobileme.fmip1"])
  {
    id v4 = &unk_26C6B03C8;
  }
  else if ([v3 isEqualToString:@"com.apple.Home"])
  {
    id v4 = &unk_26C6B03E0;
  }
  else if ([v3 isEqualToString:@"com.apple.iBooks"])
  {
    id v4 = &unk_26C6B03F8;
  }
  else if ([v3 isEqualToString:@"com.apple.iCloudDriveApp"])
  {
    id v4 = &unk_26C6B0410;
  }
  else if ([v3 isEqualToString:@"com.apple.MobileStore"])
  {
    id v4 = &unk_26C6B0428;
  }
  else if ([v3 isEqualToString:@"com.apple.mobilemail"])
  {
    id v4 = &unk_26C6B0440;
  }
  else if ([v3 isEqualToString:@"com.apple.Maps"])
  {
    id v4 = &unk_26C6B0458;
  }
  else if ([v3 isEqualToString:@"com.apple.Music"])
  {
    id v4 = &unk_26C6B0470;
  }
  else if ([v3 isEqualToString:@"com.apple.mobilenotes"])
  {
    id v4 = &unk_26C6B0488;
  }
  else if ([v3 isEqualToString:@"com.apple.MobileAddressBook"])
  {
    id v4 = &unk_26C6B04A0;
  }
  else if ([v3 isEqualToString:@"com.apple.podcasts"])
  {
    id v4 = &unk_26C6B04B8;
  }
  else if ([v3 isEqualToString:@"com.apple.reminders"])
  {
    id v4 = &unk_26C6B04D0;
  }
  else if ([v3 isEqualToString:@"com.apple.stocks"])
  {
    id v4 = &unk_26C6B04E8;
  }
  else if ([v3 isEqualToString:@"com.apple.tips"])
  {
    id v4 = &unk_26C6B0500;
  }
  else if ([v3 isEqualToString:@"com.apple.videos"])
  {
    id v4 = &unk_26C6B0518;
  }
  else if ([v3 isEqualToString:@"com.apple.VoiceMemos"])
  {
    id v4 = &unk_26C6B0530;
  }
  else if ([v3 isEqualToString:@"com.apple.Bridge"])
  {
    id v4 = &unk_26C6B0548;
  }
  else if ([v3 isEqualToString:@"com.apple.weather"])
  {
    id v4 = &unk_26C6B0560;
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)_urlForBundleIdentifier:(id)a3
{
  id v3 = [a1 _fallbackItemIdentifier:a3];
  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08BA0]);
    [v4 setScheme:@"https"];
    [v4 setHost:@"itunes.apple.com"];
    [v4 setPath:@"/WebObjects/MZStore.woa/wa/viewSoftware"];
    v5 = NSString;
    v6 = [v3 stringValue];
    id v7 = [v5 stringWithFormat:@"id=%@&mt=8", v6];
    [v4 setQuery:v7];

    uint64_t v8 = [v4 URL];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_bundleDictionary, 0);
}

@end