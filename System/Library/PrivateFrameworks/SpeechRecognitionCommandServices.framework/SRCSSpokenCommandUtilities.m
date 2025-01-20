@interface SRCSSpokenCommandUtilities
+ (__CFStringTokenizer)wordUnitStringTokenizerRefForLocaleIdentifier:(id)a3;
+ (id)_suffixedURLsForURL:(id)a3;
+ (id)sharedSpokenCommandUtilities;
- (SRCSSpokenCommandUtilities)init;
- (id)commandAttributes;
- (id)commandStringsTableForLocaleIdentifier:(id)a3;
- (id)dictionaryForLocaleIdentifier:(id)a3 bundle:(id)a4 resourceFileName:(id)a5 resourceFileExtension:(id)a6;
- (id)dictionaryForLocaleIdentifier:(id)a3 bundle:(id)a4 subDirectory:(id)a5 rootFileName:(id)a6 rootFileExtension:(id)a7;
- (id)dictionaryForLocaleIdentifier:(id)a3 resourceFileName:(id)a4 resourceFileExtension:(id)a5;
- (void)_flushBuiltInCommandsStringsTable;
@end

@implementation SRCSSpokenCommandUtilities

+ (id)sharedSpokenCommandUtilities
{
  if (sharedSpokenCommandUtilities_instaniateReporter != -1) {
    dispatch_once(&sharedSpokenCommandUtilities_instaniateReporter, &__block_literal_global_0);
  }
  v2 = (void *)sSRCSSpokenCommandUtilities;
  return v2;
}

uint64_t __58__SRCSSpokenCommandUtilities_sharedSpokenCommandUtilities__block_invoke()
{
  sSRCSSpokenCommandUtilities = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (__CFStringTokenizer)wordUnitStringTokenizerRefForLocaleIdentifier:(id)a3
{
  v4 = (__CFString *)a3;
  if (wordUnitStringTokenizerRefForLocaleIdentifier__onceToken != -1) {
    dispatch_once(&wordUnitStringTokenizerRefForLocaleIdentifier__onceToken, &__block_literal_global_6);
  }
  id v5 = a1;
  objc_sync_enter(v5);
  if ([(__CFString *)v4 length])
  {
    v6 = [NSString stringWithString:v4];
  }
  else
  {
    v6 = @"SystemUI";
  }
  CFStringTokenizerRef v7 = (CFStringTokenizerRef)[(id)wordUnitStringTokenizerRefForLocaleIdentifier__sStringTokenizerForLocaleIdentifierTable objectForKey:v6];
  if (!v7)
  {
    if ([(__CFString *)v4 length]) {
      CFLocaleRef v8 = CFLocaleCreate(0, v4);
    }
    else {
      CFLocaleRef v8 = 0;
    }
    v10.location = 0;
    v10.length = 0;
    CFStringTokenizerRef v7 = CFStringTokenizerCreate(0, &stru_26EE2ED18, v10, 0, v8);
    if (v8) {
      CFRelease(v8);
    }
    if (v7)
    {
      [(id)wordUnitStringTokenizerRefForLocaleIdentifier__sStringTokenizerForLocaleIdentifierTable setObject:v7 forKey:v6];
      CFRelease(v7);
    }
  }

  objc_sync_exit(v5);
  return v7;
}

uint64_t __76__SRCSSpokenCommandUtilities_wordUnitStringTokenizerRefForLocaleIdentifier___block_invoke()
{
  wordUnitStringTokenizerRefForLocaleIdentifier__sStringTokenizerForLocaleIdentifierTable = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (SRCSSpokenCommandUtilities)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRCSSpokenCommandUtilities;
  v2 = [(SRCSSpokenCommandUtilities *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    commandStringsTablesByLocaleIdentifier = v2->_commandStringsTablesByLocaleIdentifier;
    v2->_commandStringsTablesByLocaleIdentifier = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)commandAttributes
{
  commandAttributes = self->_commandAttributes;
  if (!commandAttributes)
  {
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v5 = [v4 pathForResource:@"CommandAttributes" ofType:@"plist"];

    objc_super v6 = (NSDictionary *)[objc_alloc(NSDictionary) initWithContentsOfFile:v5];
    CFStringTokenizerRef v7 = self->_commandAttributes;
    self->_commandAttributes = v6;

    commandAttributes = self->_commandAttributes;
  }
  return commandAttributes;
}

- (id)commandStringsTableForLocaleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  objc_super v6 = [(NSMutableDictionary *)v5->_commandStringsTablesByLocaleIdentifier objectForKey:v4];
  objc_sync_exit(v5);

  if (!v6)
  {
    objc_super v6 = [[SRCSCommandStringsTable alloc] initWithLocaleIdentifier:v4];
    if (v6)
    {
      CFStringTokenizerRef v7 = v5;
      objc_sync_enter(v7);
      [(NSMutableDictionary *)v5->_commandStringsTablesByLocaleIdentifier setObject:v6 forKey:v4];
      objc_sync_exit(v7);
    }
  }

  return v6;
}

- (void)_flushBuiltInCommandsStringsTable
{
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)obj->_commandStringsTablesByLocaleIdentifier removeAllObjects];
  objc_sync_exit(obj);
}

- (id)dictionaryForLocaleIdentifier:(id)a3 resourceFileName:(id)a4 resourceFileExtension:(id)a5
{
  CFLocaleRef v8 = (void *)MEMORY[0x263F086E0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 bundleForClass:objc_opt_class()];
  v13 = [(SRCSSpokenCommandUtilities *)self dictionaryForLocaleIdentifier:v11 bundle:v12 resourceFileName:v10 resourceFileExtension:v9];

  return v13;
}

+ (id)_suffixedURLsForURL:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v23 = (id)objc_opt_new();
  uint64_t v4 = [v3 URLByDeletingLastPathComponent];
  uint64_t v24 = [v3 pathExtension];
  id v5 = [v3 URLByDeletingPathExtension];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  objc_super v6 = [MEMORY[0x263F08850] defaultManager];
  v22 = (void *)v4;
  CFStringTokenizerRef v7 = [v6 contentsOfDirectoryAtURL:v4 includingPropertiesForKeys:0 options:0 error:0];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v13 = [v12 path];
        v14 = [v3 path];
        char v15 = [v13 isEqualToString:v14];

        if ((v15 & 1) == 0)
        {
          v16 = [v12 path];
          v17 = [v5 path];
          int v18 = [v16 hasPrefix:v17];

          if (v18)
          {
            uint64_t v19 = [v12 pathExtension];
            v20 = (void *)v19;
            if (!(v24 | v19)
              || (v24 == 0) == (v19 == 0) && [(id)v24 isEqualToString:v19])
            {
              [v23 addObject:v12];
            }
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  return v23;
}

- (id)dictionaryForLocaleIdentifier:(id)a3 bundle:(id)a4 resourceFileName:(id)a5 resourceFileExtension:(id)a6
{
  v57[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = +[SRCSCommandStringsTable componentsFromLocaleIdentifier:v9];
  v14 = [v13 objectForKey:*MEMORY[0x263EFF508]];

  if ([(__CFString *)v14 isEqualToString:@"nb"])
  {

    v14 = @"no";
  }
  char v15 = [v10 pathForResource:v11 ofType:v12 inDirectory:0 forLocalization:v9];
  if (!v15)
  {
    id v30 = v9;
    goto LABEL_19;
  }
  v16 = [NSDictionary dictionaryWithContentsOfFile:v15];
  id v17 = v9;
  if (!v16)
  {
LABEL_19:
    v47 = v15;
    v31 = (void *)MEMORY[0x263F086E0];
    v32 = [v10 localizations];
    [&unk_26EE31B50 arrayByAddingObjectsFromArray:v32];
    v34 = v33 = v14;
    v57[0] = v9;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:1];
    v36 = [v31 preferredLocalizationsFromArray:v34 forPreferences:v35];

    v14 = v33;
    v37 = [v36 firstObject];
    v38 = v37;
    if (!v37
      || ([v37 isEqualToString:@"zxx"] & 1) != 0
      || [v38 isEqualToString:@"en"]
      && ![(__CFString *)v33 isEqualToString:@"en"])
    {

      id v18 = 0;
      char v15 = v47;
    }
    else
    {
      id v18 = v38;

      char v15 = [v10 pathForResource:v11 ofType:v12 inDirectory:0 forLocalization:v18];

      if (v15)
      {
        v16 = [NSDictionary dictionaryWithContentsOfFile:v15];

        if (!v16) {
          goto LABEL_29;
        }
        goto LABEL_6;
      }
    }

    goto LABEL_29;
  }
  id v18 = v17;
LABEL_6:
  v42 = v14;
  id v43 = v12;
  id v44 = v11;
  id v45 = v10;
  v46 = v15;
  v41 = [NSURL fileURLWithPath:v15];
  uint64_t v19 = [(id)objc_opt_class() _suffixedURLsForURL:v41];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v49;
    do
    {
      uint64_t v23 = 0;
      uint64_t v24 = v16;
      do
      {
        if (*(void *)v49 != v22) {
          objc_enumerationMutation(v19);
        }
        long long v25 = *(void **)(*((void *)&v48 + 1) + 8 * v23);
        long long v26 = (void *)[objc_alloc(NSDictionary) initWithContentsOfURL:v25];
        long long v27 = SRCSLogGeneral();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          long long v28 = [v25 lastPathComponent];
          *(_DWORD *)buf = 138412290;
          id v53 = v28;
          _os_log_impl(&dword_23AB39000, v27, OS_LOG_TYPE_DEFAULT, "Loaded override table: %@", buf, 0xCu);
        }
        v16 = [v26 dictionaryByMergingEntriesFromDictionary:v24];

        ++v23;
        uint64_t v24 = v16;
      }
      while (v21 != v23);
      uint64_t v21 = [v19 countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v21);
  }

  id v10 = v45;
  if (v16)
  {
    v29 = SRCSLogGeneral();
    char v15 = v46;
    id v12 = v43;
    id v11 = v44;
    v14 = v42;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v53 = v18;
      __int16 v54 = 2112;
      id v55 = v9;
      _os_log_impl(&dword_23AB39000, v29, OS_LOG_TYPE_DEFAULT, "Found commands localization: %@ for desired locale: %@", buf, 0x16u);
    }
    goto LABEL_32;
  }
  char v15 = v46;
  id v12 = v43;
  id v11 = v44;
  v14 = v42;
LABEL_29:
  v29 = SRCSLogGeneral();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v39 = [v10 localizations];
    *(_DWORD *)buf = 138412546;
    id v53 = v9;
    __int16 v54 = 2112;
    id v55 = v39;
    _os_log_impl(&dword_23AB39000, v29, OS_LOG_TYPE_DEFAULT, "Failed to find commands for desired locale: %@ from localizations: %@", buf, 0x16u);
  }
  v16 = 0;
LABEL_32:

  return v16;
}

- (id)dictionaryForLocaleIdentifier:(id)a3 bundle:(id)a4 subDirectory:(id)a5 rootFileName:(id)a6 rootFileExtension:(id)a7
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  id v14 = a5;
  id v15 = a3;
  v16 = +[SRCSCommandStringsTable componentsFromLocaleIdentifier:v15];
  id v17 = [v16 objectForKey:*MEMORY[0x263EFF508]];

  id v18 = +[SRCSCommandStringsTable componentsFromLocaleIdentifier:v15];

  uint64_t v19 = [v18 objectForKey:*MEMORY[0x263EFF4D0]];

  if ([(__CFString *)v17 isEqualToString:@"nb"])
  {

    id v17 = @"no";
  }
  [v11 resourcePath];
  v20 = id v30 = v11;
  uint64_t v21 = [v20 stringByAppendingPathComponent:v14];

  uint64_t v22 = [NSString stringWithFormat:@"%@_%@_%@.%@", v12, v17, v19, v13];
  uint64_t v23 = NSDictionary;
  uint64_t v24 = [v21 stringByAppendingPathComponent:v22];
  long long v25 = [v23 dictionaryWithContentsOfFile:v24];

  if (!v25)
  {
    long long v26 = [NSString stringWithFormat:@"%@_%@.%@", v12, v17, v13];
    long long v27 = NSDictionary;
    long long v28 = [v21 stringByAppendingPathComponent:v26];
    long long v25 = [v27 dictionaryWithContentsOfFile:v28];
  }
  return v25;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandStringsTablesByLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_commandAttributes, 0);
}

@end