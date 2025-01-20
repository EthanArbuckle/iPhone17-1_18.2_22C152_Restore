@interface NSBundle(SCROBundleExtras)
+ (id)_brailleTableBundles;
+ (id)_brailleTableDictionaryForBrailleTableIdentifier:()SCROBundleExtras;
+ (id)brailleDriverBundleWithIdentifier:()SCROBundleExtras;
+ (id)brailleDriverBundles;
+ (id)brailleDriverDeviceDetectionInfo;
+ (id)brailleTableBundleWithTableIdentifier:()SCROBundleExtras;
+ (id)languageIdentifiersForBrailleTableIdentifier:()SCROBundleExtras;
+ (uint64_t)doesBrailleTableSupportContractions:()SCROBundleExtras;
+ (uint64_t)doesBrailleTableSupportEightDot:()SCROBundleExtras;
- (id)tableIdentifierForBundleSpecificTableIdentifier:()SCROBundleExtras;
@end

@implementation NSBundle(SCROBundleExtras)

+ (id)brailleDriverBundles
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__NSBundle_SCROBundleExtras__brailleDriverBundles__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (brailleDriverBundles_onceToken != -1) {
    dispatch_once(&brailleDriverBundles_onceToken, block);
  }
  v1 = (void *)_DriverBundleArray;

  return v1;
}

+ (id)brailleDriverBundleWithIdentifier:()SCROBundleExtras
{
  id v4 = a3;
  v5 = v4;
  if (_DriverBundleDictionary)
  {
    if (v4)
    {
LABEL_3:
      v6 = [(id)_DriverBundleDictionary objectForKey:v5];
      goto LABEL_6;
    }
  }
  else
  {
    id v7 = (id)[a1 brailleDriverBundles];
    if (v5) {
      goto LABEL_3;
    }
  }
  v6 = 0;
LABEL_6:

  return v6;
}

+ (id)brailleDriverDeviceDetectionInfo
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v1 = [a1 brailleDriverBundles];
  id v13 = [MEMORY[0x263EFF9A0] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v8 = [v7 bundleIdentifier];
        if (v8)
        {
          id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v10 = [v7 objectForInfoDictionaryKey:kSCROBrailleDriverAutoDetectDictionaries[0]];
          if (v10) {
            [v9 setObject:v10 forKey:kSCROBrailleDriverAutoDetectDictionaries[0]];
          }

          v11 = [v7 objectForInfoDictionaryKey:kSCROBrailleDriverBluetoothSearchDictionary[0]];
          if (v11) {
            [v9 setObject:v11 forKey:kSCROBrailleDriverBluetoothSearchDictionary[0]];
          }

          if ([v9 count]) {
            [v13 setObject:v9 forKey:v8];
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  return v13;
}

+ (id)_brailleTableBundles
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__NSBundle_SCROBundleExtras___brailleTableBundles__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_brailleTableBundles_onceToken != -1) {
    dispatch_once(&_brailleTableBundles_onceToken, block);
  }
  v1 = (void *)_TableBundleArray;

  return v1;
}

+ (id)brailleTableBundleWithTableIdentifier:()SCROBundleExtras
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = objc_msgSend(a1, "_brailleTableBundles", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = [v9 bundleIdentifier];
        if (v10 && ([v4 hasPrefix:v10] & 1) != 0)
        {
          id v6 = v9;

          goto LABEL_12;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

+ (id)_brailleTableDictionaryForBrailleTableIdentifier:()SCROBundleExtras
{
  id v4 = a3;
  uint64_t v5 = [a1 brailleTableBundleWithTableIdentifier:v4];
  id v6 = [v5 bundleIdentifier];
  uint64_t v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v6, "length") + 1);
  }
  else
  {
    v8 = 0;
  }
  id v9 = [v5 objectForInfoDictionaryKey:@"BrailleTables"];
  v10 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v12 = [v9 objectForKey:v8];
    long long v13 = self;
    char v14 = objc_opt_isKindOfClass();

    if (v14) {
      id v15 = v12;
    }
    else {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

+ (uint64_t)doesBrailleTableSupportContractions:()SCROBundleExtras
{
  v1 = objc_msgSend(a1, "_brailleTableDictionaryForBrailleTableIdentifier:");
  id v2 = [v1 objectForKey:@"supportsContraction"];
  uint64_t v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    uint64_t v5 = [v2 BOOLValue];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (uint64_t)doesBrailleTableSupportEightDot:()SCROBundleExtras
{
  v1 = objc_msgSend(a1, "_brailleTableDictionaryForBrailleTableIdentifier:");
  id v2 = [v1 objectForKey:@"supports8dot"];
  uint64_t v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    uint64_t v5 = [v2 BOOLValue];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

+ (id)languageIdentifiersForBrailleTableIdentifier:()SCROBundleExtras
{
  v1 = objc_msgSend(a1, "_brailleTableDictionaryForBrailleTableIdentifier:");
  id v2 = [v1 objectForKey:@"languages"];
  uint64_t v3 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    id v5 = v2;
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (id)tableIdentifierForBundleSpecificTableIdentifier:()SCROBundleExtras
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [a1 bundleIdentifier];
    id v6 = [v5 stringByAppendingPathExtension:v4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end