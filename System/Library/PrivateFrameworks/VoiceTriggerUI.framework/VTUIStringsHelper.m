@interface VTUIStringsHelper
+ (id)sharedStringsHelper;
+ (void)initialize;
- (NSString)heySiriTriggerPhrase;
- (NSString)justSiriTriggerPhrase;
- (VTUIStringsHelper)init;
- (id)_bundleStringTableForAllValidLanguages:(id)a3 inLocalizedStringsFileName:(id)a4;
- (id)_bundleStringTableForLanguages:(id)a3 inLocalizedStringsFileName:(id)a4;
- (id)_siriLanguageSubstitutedString:(id)a3;
- (id)siriLanguageStringForKey:(id)a3;
- (id)uiLocalizedStringForKey:(id)a3;
- (id)uiLocalizedStringForKey:(id)a3 languageCode:(id)a4;
- (id)uiLocalizedStringForKey:(id)a3 usesMultipleTriggers:(BOOL)a4 siriVoice:(id)a5;
- (void)setSiriLanguage:(id)a3;
- (void)setupForCurrentLocaleAndSiriLanguage;
@end

@implementation VTUIStringsHelper

+ (id)sharedStringsHelper
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__VTUIStringsHelper_sharedStringsHelper__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStringsHelper_onceToken != -1) {
    dispatch_once(&sharedStringsHelper_onceToken, block);
  }
  v2 = (void *)sharedStringsHelper__sharedInstance;
  return v2;
}

uint64_t __40__VTUIStringsHelper_sharedStringsHelper__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedStringsHelper__sharedInstance;
  sharedStringsHelper__sharedInstance = (uint64_t)v1;
  return MEMORY[0x270F9A758](v1, v2);
}

+ (void)initialize
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___VTUIStringsHelper;
  objc_msgSendSuper2(&v2, sel_initialize);
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, &__block_literal_global_2);
  }
}

uint64_t __31__VTUIStringsHelper_initialize__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x263F08AE8]) initWithPattern:@"%SIRI_LANGUAGE__([^%]+)%" options:0 error:0];
  uint64_t v1 = __siriLangRegex;
  __siriLangRegex = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (VTUIStringsHelper)init
{
  v6.receiver = self;
  v6.super_class = (Class)VTUIStringsHelper;
  objc_super v2 = [(VTUIStringsHelper *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(VTUIStringsHelper *)v2 setupForCurrentLocaleAndSiriLanguage];
    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel_localeDidChange_ name:*MEMORY[0x263EFF458] object:0];
  }
  return v3;
}

- (void)setupForCurrentLocaleAndSiriLanguage
{
  v3 = [MEMORY[0x263EFF960] preferredLanguages];
  v4 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v3 inLocalizedStringsFileName:@"Localizable"];
  localizedStringTable = self->_localizedStringTable;
  self->_localizedStringTable = v4;

  v90 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  objc_super v6 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v7 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v6 inLocalizedStringsFileName:@"Localizable-b364"];

  if (v7)
  {
    [v90 addEntriesFromDictionary:v7];
    objc_storeStrong((id *)&self->_localizedStringTable, v90);
  }
  v87 = (void *)v7;
  v8 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v9 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v10 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v9 inLocalizedStringsFileName:@"Localizable-b419"];

  if (v10)
  {
    [v8 addEntriesFromDictionary:v10];
    objc_storeStrong((id *)&self->_localizedStringTable, v8);
  }
  v86 = v8;
  v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v12 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v13 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v12 inLocalizedStringsFileName:@"Localizable-b298"];

  if (v13)
  {
    [v11 addEntriesFromDictionary:v13];
    objc_storeStrong((id *)&self->_localizedStringTable, v11);
  }
  v84 = v11;
  v83 = (void *)v13;
  v14 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v15 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v16 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v15 inLocalizedStringsFileName:@"Localizable-b515"];

  if (v16)
  {
    [v14 addEntriesFromDictionary:v16];
    objc_storeStrong((id *)&self->_localizedStringTable, v14);
  }
  v82 = (void *)v16;
  v88 = v14;
  v17 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v18 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v19 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v18 inLocalizedStringsFileName:@"Localizable-Themis"];

  if (v19)
  {
    [v17 addEntriesFromDictionary:v19];
    objc_storeStrong((id *)&self->_localizedStringTable, v17);
  }
  v20 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v21 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v22 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v21 inLocalizedStringsFileName:@"Localizable-HomeAccessory"];

  if (v22)
  {
    [v20 addEntriesFromDictionary:v22];
    objc_storeStrong((id *)&self->_localizedStringTable, v20);
  }
  v80 = (void *)v19;
  v85 = (void *)v10;
  v79 = (void *)v22;
  v89 = v20;
  v23 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v24 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v25 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v24 inLocalizedStringsFileName:@"Localizable-b688"];

  if (v25)
  {
    [v23 addEntriesFromDictionary:v25];
    objc_storeStrong((id *)&self->_localizedStringTable, v23);
  }
  v77 = (void *)v25;
  v78 = v23;
  v26 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v27 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v28 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v27 inLocalizedStringsFileName:@"Localizable-b494"];

  if (v28)
  {
    [v26 addEntriesFromDictionary:v28];
    objc_storeStrong((id *)&self->_localizedStringTable, v26);
  }
  v81 = v17;
  v75 = (void *)v28;
  v76 = v26;
  v29 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v30 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v31 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v30 inLocalizedStringsFileName:@"Localizable-b698"];

  if (v31)
  {
    [v29 addEntriesFromDictionary:v31];
    objc_storeStrong((id *)&self->_localizedStringTable, v29);
  }
  v32 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v33 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v34 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v33 inLocalizedStringsFileName:@"Localizable-b607"];

  if (v34)
  {
    [v32 addEntriesFromDictionary:v34];
    objc_storeStrong((id *)&self->_localizedStringTable, v32);
  }
  v71 = (void *)v34;
  v72 = v32;
  v35 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v36 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v37 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v36 inLocalizedStringsFileName:@"Localizable-b453"];

  if (v37)
  {
    [v35 addEntriesFromDictionary:v37];
    objc_storeStrong((id *)&self->_localizedStringTable, v35);
  }
  v38 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v39 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v40 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v39 inLocalizedStringsFileName:@"Localizable-b698c"];

  if (v40)
  {
    [v38 addEntriesFromDictionary:v40];
    objc_storeStrong((id *)&self->_localizedStringTable, v38);
  }
  v67 = (void *)v40;
  v68 = v38;
  v74 = v29;
  v41 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v42 = [MEMORY[0x263EFF960] preferredLanguages];
  uint64_t v43 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v42 inLocalizedStringsFileName:@"Localizable-b465"];

  if (v43)
  {
    [v41 addEntriesFromDictionary:v43];
    objc_storeStrong((id *)&self->_localizedStringTable, v41);
  }
  v65 = (void *)v43;
  v66 = v41;
  v73 = (void *)v31;
  v44 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v45 = [MEMORY[0x263EFF960] preferredLanguages];
  v46 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v45 inLocalizedStringsFileName:@"Localizable-b498"];

  if (v46)
  {
    [v44 addEntriesFromDictionary:v46];
    objc_storeStrong((id *)&self->_localizedStringTable, v44);
  }
  v70 = v35;
  v47 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithDictionary:", self->_localizedStringTable, v44);
  v48 = [MEMORY[0x263EFF960] preferredLanguages];
  v49 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v48 inLocalizedStringsFileName:@"Localizable-b515c"];

  if (v49)
  {
    [v47 addEntriesFromDictionary:v49];
    objc_storeStrong((id *)&self->_localizedStringTable, v47);
  }
  v69 = (void *)v37;
  v50 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v51 = [MEMORY[0x263EFF960] preferredLanguages];
  v52 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v51 inLocalizedStringsFileName:@"Localizable-b768"];

  if (v52)
  {
    [v50 addEntriesFromDictionary:v52];
    objc_storeStrong((id *)&self->_localizedStringTable, v50);
  }
  v53 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:self->_localizedStringTable];
  v54 = [MEMORY[0x263EFF960] preferredLanguages];
  v55 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v54 inLocalizedStringsFileName:@"Localizable-GM"];

  if (v55)
  {
    [v53 addEntriesFromDictionary:v55];
    objc_storeStrong((id *)&self->_localizedStringTable, v53);
  }
  siriLanguageCode = self->_siriLanguageCode;
  v57 = v89;
  if (!siriLanguageCode)
  {
    v58 = [MEMORY[0x263F285A0] sharedPreferences];
    v59 = [v58 bestSupportedLanguageCodeForLanguageCode:0];
    v60 = self->_siriLanguageCode;
    self->_siriLanguageCode = v59;

    v57 = v89;
    siriLanguageCode = self->_siriLanguageCode;
  }
  [(VTUIStringsHelper *)self setSiriLanguage:siriLanguageCode];
  v61 = v88;
  if (!self->_languageLocalizedStringTables)
  {
    v62 = [MEMORY[0x263EFF960] currentLocale];
    v63 = [v62 localeIdentifier];
    [(VTUIStringsHelper *)self setSiriLanguage:v63];

    v61 = v88;
    v57 = v89;
  }
}

- (void)setSiriLanguage:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v5 = (NSString *)a3;
  objc_super v6 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "-[VTUIStringsHelper setSiriLanguage:]";
    __int16 v33 = 2112;
    uint64_t v34 = v5;
    _os_log_impl(&dword_238878000, v6, OS_LOG_TYPE_DEFAULT, "%s Setting Siri Language to: %@", buf, 0x16u);
  }
  objc_storeStrong((id *)&self->_siriLanguageCode, a3);
  if (v5)
  {
    char v29 = 0;
    uint64_t v7 = [MEMORY[0x263F285A0] sharedPreferences];
    v8 = [v7 allSiriLanguageCodesForSystemLanguageCode:v5 isGoodFit:&v29];

    id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [v9 addObject:v5];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(v9, "addObject:", *(void *)(*((void *)&v25 + 1) + 8 * v14++), (void)v25);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v12);
    }

    v15 = [v9 allObjects];
    uint64_t v16 = [(VTUIStringsHelper *)self _bundleStringTableForAllValidLanguages:v15 inLocalizedStringsFileName:@"Localizable"];
    languageLocalizedStringTables = self->_languageLocalizedStringTables;
    self->_languageLocalizedStringTables = v16;

    v18 = [v9 allObjects];
    uint64_t v19 = [(VTUIStringsHelper *)self _bundleStringTableForAllValidLanguages:v18 inLocalizedStringsFileName:@"Localizable-b364"];

    [(NSMutableDictionary *)self->_languageLocalizedStringTables addEntriesFromDictionary:v19];
    v20 = [MEMORY[0x263F85AF0] sharedPreferences];
    v21 = [v20 localizedTriggerPhraseForLanguageCode:v5];
    heySiriTriggerPhrase = self->_heySiriTriggerPhrase;
    self->_heySiriTriggerPhrase = v21;

    v23 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v24 = self->_heySiriTriggerPhrase;
      *(_DWORD *)buf = 136315394;
      v32 = "-[VTUIStringsHelper setSiriLanguage:]";
      __int16 v33 = 2112;
      uint64_t v34 = v24;
      _os_log_impl(&dword_238878000, v23, OS_LOG_TYPE_DEFAULT, "%s _heySiriTriggerPhrase set to %@", buf, 0x16u);
    }
  }
}

- (id)_bundleStringTableForLanguages:(id)a3 inLocalizedStringsFileName:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  CFArrayRef v5 = (const __CFArray *)a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy_;
  v23 = __Block_byref_object_dispose_;
  id v24 = 0;
  CFArrayRef v8 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)[v7 localizations], v5);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __79__VTUIStringsHelper__bundleStringTableForLanguages_inLocalizedStringsFileName___block_invoke;
  v15[3] = &unk_264D4C970;
  id v9 = v7;
  id v16 = v9;
  id v10 = v6;
  id v17 = v10;
  v18 = &v19;
  [(__CFArray *)v8 enumerateObjectsUsingBlock:v15];
  uint64_t v11 = (void *)v20[5];
  if (!v11)
  {
    uint64_t v12 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v26 = "-[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:]";
      __int16 v27 = 2112;
      CFArrayRef v28 = v5;
      _os_log_impl(&dword_238878000, v12, OS_LOG_TYPE_DEFAULT, "%s No bundle string table found for %@", buf, 0x16u);
    }
    uint64_t v11 = (void *)v20[5];
  }
  id v13 = v11;

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __79__VTUIStringsHelper__bundleStringTableForLanguages_inLocalizedStringsFileName___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = [*(id *)(a1 + 32) URLForResource:*(void *)(a1 + 40) withExtension:@"strings" subdirectory:0 localization:v6];
  uint64_t v8 = [NSDictionary dictionaryWithContentsOfURL:v7];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  uint64_t v11 = (void *)VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    id v13 = [v7 path];
    int v14 = 136315650;
    v15 = "-[VTUIStringsHelper _bundleStringTableForLanguages:inLocalizedStringsFileName:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    uint64_t v19 = v13;
    _os_log_impl(&dword_238878000, v12, OS_LOG_TYPE_DEFAULT, "%s Loaded stringsTable for %@ : %@", (uint8_t *)&v14, 0x20u);
  }
  *a4 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) != 0;
}

- (id)_bundleStringTableForAllValidLanguages:(id)a3 inLocalizedStringsFileName:(id)a4
{
  CFArrayRef v5 = (const __CFArray *)a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  uint64_t v21 = __Block_byref_object_dispose_;
  id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  CFArrayRef v8 = CFBundleCopyLocalizationsForPreferences((CFArrayRef)[v7 localizations], v5);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __87__VTUIStringsHelper__bundleStringTableForAllValidLanguages_inLocalizedStringsFileName___block_invoke;
  v13[3] = &unk_264D4C970;
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  __int16 v16 = &v17;
  [(__CFArray *)v8 enumerateObjectsUsingBlock:v13];
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __87__VTUIStringsHelper__bundleStringTableForAllValidLanguages_inLocalizedStringsFileName___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "URLForResource:withExtension:subdirectory:localization:", *(void *)(a1 + 40), @"strings", 0);
  v4 = [NSDictionary dictionaryWithContentsOfURL:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id v6 = *(void **)(v5 + 40);
  if (v4)
  {
    [*(id *)(v5 + 40) setObject:v4 forKey:v8];
  }
  else
  {
    id v7 = objc_alloc_init(NSDictionary);
    [v6 setObject:v7 forKey:v8];
  }
}

- (id)uiLocalizedStringForKey:(id)a3 usesMultipleTriggers:(BOOL)a4 siriVoice:(id)a5
{
  BOOL v6 = a4;
  v36[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    justSiriTriggerPhrase = self->_justSiriTriggerPhrase;
    self->_justSiriTriggerPhrase = (NSString *)@"Siri";
  }
  id v11 = [v9 languageCode];
  if ([v11 isEqualToString:@"he-IL"])
  {

    goto LABEL_6;
  }
  uint64_t v12 = [v9 languageCode];
  int v13 = [v12 isEqualToString:@"ar-SA"];

  if (v13)
  {
LABEL_6:
    id v14 = [MEMORY[0x263F089D8] stringWithString:v8];
    if ([v9 gender] == 2)
    {
      id v15 = @"_SIRI_FEMALE";
    }
    else
    {
      if ([v9 gender] != 1)
      {
LABEL_11:
        __int16 v16 = (void *)MEMORY[0x263EFF980];
        v36[0] = v14;
        v36[1] = v8;
        uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
        __int16 v18 = [v16 arrayWithArray:v17];

        goto LABEL_13;
      }
      id v15 = @"_SIRI_MALE";
    }
    [v14 appendString:v15];
    goto LABEL_11;
  }
  uint64_t v19 = (void *)MEMORY[0x263EFF980];
  id v35 = v8;
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
  __int16 v18 = [v19 arrayWithArray:v14];
LABEL_13:

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v20 = v18;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v21)
  {

LABEL_24:
    v23 = -[VTUIStringsHelper uiLocalizedStringForKey:](self, "uiLocalizedStringForKey:", v8, (void)v30);
    goto LABEL_25;
  }
  uint64_t v22 = v21;
  v23 = 0;
  uint64_t v24 = *(void *)v31;
LABEL_15:
  uint64_t v25 = 0;
  long long v26 = v23;
  while (1)
  {
    if (*(void *)v31 != v24) {
      objc_enumerationMutation(v20);
    }
    uint64_t v27 = *(void *)(*((void *)&v30 + 1) + 8 * v25);
    v23 = -[VTUIStringsHelper uiLocalizedStringForKey:](self, "uiLocalizedStringForKey:", v27, (void)v30);

    if (![v23 isEqualToString:v27]) {
      break;
    }
    ++v25;
    long long v26 = v23;
    if (v22 == v25)
    {
      uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v22) {
        goto LABEL_15;
      }
      break;
    }
  }

  if (!v23) {
    goto LABEL_24;
  }
LABEL_25:
  CFArrayRef v28 = self->_justSiriTriggerPhrase;
  self->_justSiriTriggerPhrase = 0;

  return v23;
}

- (id)uiLocalizedStringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSDictionary *)self->_localizedStringTable objectForKey:v4];
  id v6 = (id)v5;
  justSiriTriggerPhrase = self->_justSiriTriggerPhrase;
  if (justSiriTriggerPhrase)
  {
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    justSiriTriggerPhrase = self->_heySiriTriggerPhrase;
    if (v5) {
      goto LABEL_3;
    }
  }
  id v6 = v4;
LABEL_3:
  id v8 = [v6 stringByReplacingOccurrencesOfString:@"%TRIGGER_PHRASE%" withString:justSiriTriggerPhrase];

  id v9 = [(VTUIStringsHelper *)self _siriLanguageSubstitutedString:v8];

  return v9;
}

- (id)siriLanguageStringForKey:(id)a3
{
  return [(VTUIStringsHelper *)self uiLocalizedStringForKey:a3 languageCode:self->_siriLanguageCode];
}

- (id)uiLocalizedStringForKey:(id)a3 languageCode:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = [(NSMutableDictionary *)self->_languageLocalizedStringTables allKeys];
    char v9 = [v8 containsObject:v7];

    if ((v9 & 1) == 0)
    {
      v23[0] = v7;
      id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
      id v11 = [(VTUIStringsHelper *)self _bundleStringTableForLanguages:v10 inLocalizedStringsFileName:@"Localizable"];

      languageLocalizedStringTables = self->_languageLocalizedStringTables;
      if (v11)
      {
        [(NSMutableDictionary *)self->_languageLocalizedStringTables setObject:v11 forKey:v7];
      }
      else
      {
        id v13 = objc_alloc_init(NSDictionary);
        [(NSMutableDictionary *)languageLocalizedStringTables setObject:v13 forKey:v7];
      }
    }
  }
  id v14 = [(NSMutableDictionary *)self->_languageLocalizedStringTables objectForKey:v7];
  id v15 = [v14 objectForKey:v6];

  if (!v15) {
    id v15 = v6;
  }
  justSiriTriggerPhrase = self->_justSiriTriggerPhrase;
  if (!justSiriTriggerPhrase) {
    justSiriTriggerPhrase = self->_heySiriTriggerPhrase;
  }
  uint64_t v17 = justSiriTriggerPhrase;
  __int16 v18 = [v15 stringByReplacingOccurrencesOfString:@"%TRIGGER_PHRASE%" withString:v17];

  uint64_t v19 = [MEMORY[0x263F285A0] sharedPreferences];
  id v20 = [v19 languageCode];

  if (v20 != v7)
  {
    uint64_t v21 = [(VTUIStringsHelper *)self _siriLanguageSubstitutedString:v18];

    __int16 v18 = (void *)v21;
  }

  return v18;
}

- (id)_siriLanguageSubstitutedString:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = objc_msgSend((id)__siriLangRegex, "matchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));
    if ([v6 count])
    {
      id v7 = (void *)[v5 mutableCopy];
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v20 = v6;
      id obj = [v6 reverseObjectEnumerator];
      uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v23;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v23 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            id v13 = [(id)__siriLangRegex replacementStringForResult:v12 inString:v5 offset:0 template:@"$1"];
            uint64_t v14 = [(VTUIStringsHelper *)self siriLanguageStringForKey:v13];
            if (!v14)
            {
              id v18 = [(VTUIStringsHelper *)self uiLocalizedStringForKey:v13];

              goto LABEL_14;
            }
            id v15 = (void *)v14;
            uint64_t v16 = [v12 range];
            objc_msgSend(v7, "replaceCharactersInRange:withString:", v16, v17, v15);
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      id v18 = v7;
LABEL_14:

      id v6 = v20;
    }
    else
    {
      id v18 = v5;
    }
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

- (NSString)heySiriTriggerPhrase
{
  return self->_heySiriTriggerPhrase;
}

- (NSString)justSiriTriggerPhrase
{
  return self->_justSiriTriggerPhrase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_justSiriTriggerPhrase, 0);
  objc_storeStrong((id *)&self->_heySiriTriggerPhrase, 0);
  objc_storeStrong((id *)&self->_siriLanguageCode, 0);
  objc_storeStrong((id *)&self->_languageLocalizedStringTables, 0);
  objc_storeStrong((id *)&self->_localizedStringTable, 0);
}

@end