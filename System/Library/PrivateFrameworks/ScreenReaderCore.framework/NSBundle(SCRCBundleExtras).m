@interface NSBundle(SCRCBundleExtras)
+ (id)coreFrameworkBundle;
+ (id)localeForString:()SCRCBundleExtras;
+ (id)localizedCoreStringForKey:()SCRCBundleExtras;
+ (id)localizedScreenReaderStringForKey:()SCRCBundleExtras table:;
+ (id)preferredLocalizationsForLocale:()SCRCBundleExtras;
+ (id)screenReaderFrameworkBundle;
- (id)bundleLocale;
- (id)localizedStringForKey:()SCRCBundleExtras table:locale:;
@end

@implementation NSBundle(SCRCBundleExtras)

+ (id)coreFrameworkBundle
{
  v0 = (void *)_SCRCFrameworkBundle;
  if (!_SCRCFrameworkBundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v2 = (void *)_SCRCFrameworkBundle;
    _SCRCFrameworkBundle = v1;

    v0 = (void *)_SCRCFrameworkBundle;
  }
  return v0;
}

+ (id)localizedCoreStringForKey:()SCRCBundleExtras
{
  id v4 = a3;
  v5 = [a1 coreFrameworkBundle];
  v6 = [v5 localizedStringForKey:v4 value:0 table:0];

  return v6;
}

+ (id)screenReaderFrameworkBundle
{
  v2 = (void *)_SCRFrameworkBundle;
  if (!_SCRFrameworkBundle)
  {
    uint64_t v3 = [a1 bundleWithIdentifier:@"com.apple.ScreenReader"];
    id v4 = (void *)_SCRFrameworkBundle;
    _SCRFrameworkBundle = v3;

    v2 = (void *)_SCRFrameworkBundle;
    if (!_SCRFrameworkBundle)
    {
      v5 = [a1 coreFrameworkBundle];
      v6 = [v5 bundlePath];
      v7 = [v6 stringByDeletingLastPathComponent];
      v8 = [v7 stringByAppendingPathComponent:@"ScreenReader.framework"];

      char v13 = 0;
      v9 = [MEMORY[0x263F08850] defaultManager];
      LODWORD(v6) = [v9 fileExistsAtPath:v8 isDirectory:&v13];

      if (v6)
      {
        uint64_t v10 = [a1 bundleWithPath:v8];
        v11 = (void *)_SCRFrameworkBundle;
        _SCRFrameworkBundle = v10;
      }
      v2 = (void *)_SCRFrameworkBundle;
      if (!_SCRFrameworkBundle)
      {
        [MEMORY[0x263EFF940] raise:@"SCRCBundleExtras" format:@"Unable to locate ScreenReader bundle"];
        v2 = (void *)_SCRFrameworkBundle;
      }
    }
  }
  return v2;
}

+ (id)localizedScreenReaderStringForKey:()SCRCBundleExtras table:
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 screenReaderFrameworkBundle];
  v9 = [v8 localizedStringForKey:v7 value:0 table:v6];

  return v9;
}

+ (id)preferredLocalizationsForLocale:()SCRCBundleExtras
{
  id v3 = a3;
  if (preferredLocalizationsForLocale__onceToken != -1) {
    dispatch_once(&preferredLocalizationsForLocale__onceToken, &__block_literal_global);
  }
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  id v4 = preferredLocalizationsForLocale__preferredLocQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__NSBundle_SCRCBundleExtras__preferredLocalizationsForLocale___block_invoke_19;
  v8[3] = &unk_2643D6F60;
  id v9 = v3;
  uint64_t v10 = &v11;
  id v5 = v3;
  dispatch_barrier_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

+ (id)localeForString:()SCRCBundleExtras
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F086E0] preferredLocalizationsForLocale:v3];
  if ([v4 count])
  {
    id v5 = [v4 objectAtIndex:0];
    if ([v5 isEqualToString:@"en"])
    {
      unint64_t v6 = [@"English" length];
      if ([v3 compare:@"en" options:1])
      {
        if (((unint64_t)[v3 length] < 2
           || objc_msgSend(v3, "compare:options:range:", @"en-", 1, 0, 3)
           && objc_msgSend(v3, "compare:options:range:", @"en_", 1, 0, 3))
          && ([v3 length] < v6
           || objc_msgSend(v3, "compare:options:range:", @"English", 1, 0, v6)))
        {

          id v5 = 0;
        }
      }
    }
  }
  else
  {
    id v5 = [MEMORY[0x263EFF960] canonicalLocaleIdentifierFromString:v3];
  }
  if ([v5 length]) {
    id v7 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:v5];
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (id)bundleLocale
{
  uint64_t v1 = [a1 preferredLocalizations];
  if ([v1 count])
  {
    v2 = [v1 objectAtIndex:0];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)localizedStringForKey:()SCRCBundleExtras table:locale:
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [MEMORY[0x263EFF960] canonicalLocaleIdentifierFromString:a5];
  if (!v11) {
    goto LABEL_32;
  }
  id v29 = v10;
  v12 = [a1 localizations];
  id v31 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = v12;
  id v14 = (id)[v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v37;
LABEL_4:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v37 != v15) {
        objc_enumerationMutation(v13);
      }
      v17 = *(void **)(*((void *)&v36 + 1) + 8 * v16);
      if ([v17 isEqualToString:v11]) {
        break;
      }
      id v5 = [NSString stringWithFormat:@"%@_", v11];
      int v18 = [v17 hasPrefix:v5];

      if (v18) {
        [v31 addObject:v17];
      }
      if (v14 == (id)++v16)
      {
        id v14 = (id)[v13 countByEnumeratingWithState:&v36 objects:v41 count:16];
        if (v14) {
          goto LABEL_4;
        }
        id v5 = v13;
        id v10 = v29;
        goto LABEL_17;
      }
    }
    id v14 = v17;

    if (!v14)
    {
      id v28 = 0;
      id v10 = v29;
      goto LABEL_19;
    }
    id v10 = v29;
    id v5 = [a1 localizedStringForKey:v9 value:@"__NULL__" table:v29 localization:v14];
    if ([v5 isEqualToString:@"__NULL__"]) {
      goto LABEL_17;
    }
    int v19 = 1;
  }
  else
  {
    id v5 = v13;
    id v10 = v29;
LABEL_17:
    id v28 = v14;

LABEL_19:
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v20 = v31;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      id v30 = v13;
      uint64_t v23 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = a1;
          v26 = [a1 localizedStringForKey:v9 value:@"__NULL__" table:v10 localization:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          if (![v26 isEqualToString:@"__NULL__"])
          {
            int v19 = 1;
            id v5 = v26;
            a1 = v25;
            id v13 = v30;
            goto LABEL_30;
          }

          a1 = v25;
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v22) {
          continue;
        }
        break;
      }
      int v19 = 0;
      id v13 = v30;
    }
    else
    {
      int v19 = 0;
    }
LABEL_30:

    id v14 = v28;
  }

  if (!v19)
  {
LABEL_32:
    id v5 = [a1 localizedStringForKey:v9 value:v9 table:v10];
  }

  return v5;
}

@end