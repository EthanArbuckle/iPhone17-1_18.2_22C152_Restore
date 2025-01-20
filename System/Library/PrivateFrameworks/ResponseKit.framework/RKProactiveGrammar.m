@interface RKProactiveGrammar
+ (id)getEntities:(id)a3;
+ (id)getOTAPathForRKBundle:(id)a3;
+ (id)sharedManager;
- (RKProactiveGrammar)init;
- (id)copyAttributedTokenForText:(id)a3 forLanguage:(id)a4;
- (id)copyAttributedTokenForText:(id)a3 forLanguageModel:(void *)a4 withLanguageCode:(id)a5;
- (id)getEquivalenceClass:(id)a3;
- (void)chineseTokenizer;
- (void)dealloc;
- (void)getLanguageModel:(id)a3;
@end

@implementation RKProactiveGrammar

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__RKProactiveGrammar_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken_1 != -1) {
    dispatch_once(&sharedManager_onceToken_1, block);
  }
  v2 = (void *)sharedManager_sharedProactiveManager;

  return v2;
}

uint64_t __35__RKProactiveGrammar_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedProactiveManager = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return MEMORY[0x270F9A758]();
}

- (RKProactiveGrammar)init
{
  v10.receiver = self;
  v10.super_class = (Class)RKProactiveGrammar;
  v2 = [(RKProactiveGrammar *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v4 = (void *)_localeLangModel;
    _localeLangModel = (uint64_t)v3;

    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v6 = (void *)_localeEquivalenceClass;
    _localeEquivalenceClass = (uint64_t)v5;

    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v8 = (void *)_localeGrammarBundlePath;
    _localeGrammarBundlePath = (uint64_t)v7;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)_localeLangModel;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [(id)_localeLangModel objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * v7)];
        LMLanguageModelRelease();
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  if (_chineseTokenizer) {
    ChineseTokenizerRelease();
  }
  v8.receiver = self;
  v8.super_class = (Class)RKProactiveGrammar;
  [(RKProactiveGrammar *)&v8 dealloc];
}

+ (id)getOTAPathForRKBundle:(id)a3
{
  id v3 = (__CFString *)a3;
  CFLocaleRef v4 = CFLocaleCreate(0, v3);
  uint64_t v9 = 0;
  long long v10 = &v9;
  uint64_t v11 = 0x3032000000;
  long long v12 = __Block_byref_object_copy__4;
  v13 = __Block_byref_object_dispose__4;
  id v14 = 0;
  LDEnumerateAssetDataItems();
  if (!v10[5])
  {
    uint64_t v5 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v3];
    uint64_t v6 = [v5 objectForKey:*MEMORY[0x263EFF508]];

    CFLocaleCreate(0, v6);
    LDEnumerateAssetDataItems();

    if (!v4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v4) {
LABEL_5:
  }
    CFRelease(v4);
LABEL_6:
  id v7 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v7;
}

void __44__RKProactiveGrammar_getOTAPathForRKBundle___block_invoke(uint64_t a1, const __CFURL *a2, int a3, int a4, CFTypeRef cf1, unsigned char *a6)
{
  if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F517B8]))
  {
    CFStringRef v9 = CFURLCopyPath(a2);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a6 = 1;
  }
}

void __44__RKProactiveGrammar_getOTAPathForRKBundle___block_invoke_2(uint64_t a1, const __CFURL *a2, int a3, int a4, CFTypeRef cf1, unsigned char *a6)
{
  if (CFEqual(cf1, (CFTypeRef)*MEMORY[0x263F517B8]))
  {
    CFStringRef v9 = CFURLCopyPath(a2);
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a6 = 1;
  }
}

- (void)getLanguageModel:(id)a3
{
  v39[3] = *MEMORY[0x263EF8340];
  id v3 = (__CFString *)a3;
  CFLocaleRef v4 = [(id)_localeLangModel objectForKeyedSubscript:v3];

  if (v4)
  {
    uint64_t v5 = [(id)_localeLangModel objectForKeyedSubscript:v3];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 URLForResource:@"RK_Bundle" withExtension:0];
    objc_super v8 = [v7 path];
    [(id)_localeGrammarBundlePath setObject:v8 forKeyedSubscript:v3];

    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
    CFLocaleRef v10 = CFLocaleCreate(0, v3);
    uint64_t v11 = (void *)MEMORY[0x263F512A8];
    CFLocaleRef cf = v10;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F512A8], v10);
    long long v12 = (uint64_t *)MEMORY[0x263F51248];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x263F51248], (const void *)*MEMORY[0x263EFFB38]);
    v13 = (void *)MEMORY[0x263F51268];
    id v14 = (const void *)*MEMORY[0x263F51268];
    v15 = [(id)_localeGrammarBundlePath objectForKeyedSubscript:v3];
    CFDictionarySetValue(Mutable, v14, v15);

    uint64_t v5 = (void *)LMLanguageModelCreate();
    LMVocabularyGetSharedVocabulary();
    if (v5)
    {
      LMLanguageModelAddTransientVocabulary();
      [(id)_localeLangModel setObject:v5 forKeyedSubscript:v3];
      v16 = v12;
    }
    else
    {
      v30 = v7;
      v32 = v6;
      v29 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v3];
      v17 = [v29 objectForKey:*MEMORY[0x263EFF508]];
      uint64_t v18 = *v12;
      v38[0] = *v11;
      v38[1] = v18;
      v39[0] = v17;
      v39[1] = MEMORY[0x263EFFA80];
      v38[2] = *v13;
      v19 = [(id)_localeGrammarBundlePath objectForKeyedSubscript:v3];
      v39[2] = v19;
      [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
      uint64_t v20 = LMLanguageModelCreate();

      v16 = v12;
      if (v20)
      {
        LMLanguageModelAddTransientVocabulary();
        [(id)_localeLangModel setObject:v20 forKeyedSubscript:v3];
      }

      id v7 = v30;
      uint64_t v6 = v32;
    }
    v21 = +[RKProactiveGrammar getOTAPathForRKBundle:v3];
    v22 = [(id)_localeLangModel objectForKeyedSubscript:v3];

    if (!v22 && v21)
    {
      v31 = v7;
      v33 = v6;
      [(id)_localeGrammarBundlePath setObject:v21 forKeyedSubscript:v3];
      v23 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:v3];
      v24 = [v23 languageCode];
      uint64_t v25 = *v16;
      v36[0] = *MEMORY[0x263F512A8];
      v36[1] = v25;
      v37[0] = v24;
      v37[1] = MEMORY[0x263EFFA80];
      v36[2] = *MEMORY[0x263F51268];
      v26 = [(id)_localeGrammarBundlePath objectForKeyedSubscript:v3];
      v37[2] = v26;
      [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:3];
      uint64_t v27 = LMLanguageModelCreate();

      if (v27)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_217E21000, &_os_log_internal, OS_LOG_TYPE_INFO, "(RKProactiveGrammar) Loading grammar from OTA resources", buf, 2u);
        }
        LMLanguageModelAddTransientVocabulary();
        [(id)_localeLangModel setObject:v27 forKeyedSubscript:v3];
      }

      id v7 = v31;
      uint64_t v6 = v33;
    }
    CFRelease(cf);
    CFRelease(Mutable);
  }
  return v5;
}

- (void)chineseTokenizer
{
  if (!_chineseTokenizer)
  {
    CFLocaleRef v2 = CFLocaleCreate(0, @"zh-Hans");
    _chineseTokenizer = ChineseTokenizerCreate();
    if (_chineseTokenizer) {
      ChineseTokenizerSetCustomWordCheckBlock();
    }
    if (v2) {
      CFRelease(v2);
    }
  }
  return (void *)_chineseTokenizer;
}

BOOL __38__RKProactiveGrammar_chineseTokenizer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 < 2) {
    return 0;
  }
  LMVocabularyGetSharedVocabulary();
  return LMVocabularyContainsLemmaForCharacters() != 0;
}

- (id)getEquivalenceClass:(id)a3
{
  id v3 = a3;
  CFLocaleRef v4 = [(id)_localeEquivalenceClass objectForKeyedSubscript:v3];

  if (!v4)
  {
    uint64_t v5 = [(id)_localeGrammarBundlePath objectForKeyedSubscript:v3];

    if (!v5)
    {
      uint64_t v6 = +[RKProactiveGrammar getOTAPathForRKBundle:v3];
      [(id)_localeGrammarBundlePath setObject:v6 forKeyedSubscript:v3];
    }
    id v7 = [(id)_localeGrammarBundlePath objectForKeyedSubscript:v3];

    if (v7)
    {
      objc_super v8 = [(id)_localeGrammarBundlePath objectForKeyedSubscript:v3];
      CFStringRef v9 = [v8 stringByAppendingString:@"/equivalenceClasses.plist"];

      CFLocaleRef v10 = [MEMORY[0x263F08850] defaultManager];
      int v11 = [v10 fileExistsAtPath:v9];

      if (v11)
      {
        long long v12 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithContentsOfFile:v9];
        [(id)_localeEquivalenceClass setObject:v12 forKeyedSubscript:v3];

        goto LABEL_10;
      }
    }
    id v13 = objc_alloc_init(NSDictionary);
    [(id)_localeEquivalenceClass setObject:v13 forKeyedSubscript:v3];
  }
  long long v12 = [(id)_localeEquivalenceClass objectForKeyedSubscript:v3];
LABEL_10:

  return v12;
}

+ (id)getEntities:(id)a3
{
  v21[2] = *MEMORY[0x263EF8340];
  id v3 = (void *)MEMORY[0x263EFF980];
  id v4 = a3;
  uint64_t v5 = [v3 array];
  id v6 = objc_alloc(MEMORY[0x263F08948]);
  uint64_t v8 = *MEMORY[0x263F082A8];
  v21[0] = *MEMORY[0x263F082B8];
  uint64_t v7 = v21[0];
  v21[1] = v8;
  CFStringRef v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:2];
  CFLocaleRef v10 = (void *)[v6 initWithTagSchemes:v9 options:4];

  [v10 setString:v4];
  int v11 = [v10 string];
  uint64_t v12 = [v11 length];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __34__RKProactiveGrammar_getEntities___block_invoke;
  v18[3] = &unk_2642D22F8;
  id v19 = v10;
  id v13 = v5;
  id v20 = v13;
  id v14 = v10;
  objc_msgSend(v14, "enumerateTagsInRange:scheme:options:usingBlock:", 0, v12, v7, 4, v18);

  v15 = v20;
  id v16 = v13;

  return v16;
}

void __34__RKProactiveGrammar_getEntities___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v10 = (id)objc_opt_new();
  uint64_t v8 = [*(id *)(a1 + 32) string];
  CFStringRef v9 = objc_msgSend(v8, "substringWithRange:", a3, a4);
  [v10 setString:v9];

  [v10 setPartOfSpeech:v7];
  [v10 setTokenType:0];
  [v10 setLanguage:0];
  objc_msgSend(v10, "setTokenRange:", a3, a4);
  [v10 setLemma:0];
  [*(id *)(a1 + 40) addObject:v10];
}

- (id)copyAttributedTokenForText:(id)a3 forLanguage:(id)a4
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(RKProactiveGrammar *)self getLanguageModel:v7];
  v47 = self;
  v48 = v7;
  CFStringRef v9 = [(RKProactiveGrammar *)self getEquivalenceClass:v7];
  id v10 = +[RKProactiveGrammar getEntities:v6];
  int v11 = (__CFString *)objc_alloc_init(MEMORY[0x263F089D8]);
  CFMutableStringRef string = (CFMutableStringRef)objc_alloc_init(MEMORY[0x263F089D8]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id obj = v10;
  unint64_t v12 = 0x263F08000uLL;
  uint64_t v54 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v54)
  {
    char v52 = 0;
    uint64_t v53 = *(void *)v57;
    v49 = v9;
    v50 = v11;
    do
    {
      for (uint64_t i = 0; i != v54; ++i)
      {
        if (*(void *)v57 != v53) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        v15 = [v14 partOfSpeech];
        if ([v15 isEqualToString:@"Punctuation"])
        {
          BOOL v16 = 1;
        }
        else
        {
          v17 = [v14 partOfSpeech];
          if ([v17 isEqualToString:@"SentenceTerminator"])
          {
            BOOL v16 = 1;
          }
          else
          {
            uint64_t v18 = [v14 string];
            if ([v18 length] == 1)
            {
              [v14 string];
              id v20 = v19 = v6;
              [*(id *)(v12 + 1800) characterSetWithCharactersInString:@"！＂＃＄％＆＇（）＊＋，－．／：；＜＝＞？?＠［＼］＾＿｀｛｜｝～"];
              v22 = v21 = v8;
              [v20 rangeOfCharacterFromSet:v22];
              BOOL v16 = v23 != 0;

              uint64_t v8 = v21;
              id v6 = v19;
              CFStringRef v9 = v49;
              int v11 = v50;
            }
            else
            {
              BOOL v16 = 0;
            }
          }
        }

        v24 = [v14 string];
        uint64_t v25 = [v9 objectForKeyedSubscript:v24];

        if (v25)
        {
          v26 = [v14 string];
          uint64_t v27 = [v9 objectForKeyedSubscript:v26];
          [(__CFString *)string appendString:v27];

          char v52 = 1;
        }
        if (!v16
          || ([v14 string],
              v28 = objc_claimAutoreleasedReturnValue(),
              [v9 objectForKeyedSubscript:v28],
              v29 = objc_claimAutoreleasedReturnValue(),
              v29,
              v28,
              v29))
        {
          v30 = [v14 string];
          v31 = [v9 objectForKeyedSubscript:v30];

          if (!v31)
          {
            uint64_t v32 = [v14 tokenRange];
            v34 = objc_msgSend(v6, "substringWithRange:", v32, v33);
            [(__CFString *)string appendString:v34];
          }
          [(__CFString *)string appendString:@" "];
          if (!v16)
          {
            uint64_t v35 = [v14 tokenRange];
            v37 = objc_msgSend(v6, "substringWithRange:", v35, v36);
            [(__CFString *)v11 appendString:v37];
            [(__CFString *)v11 appendString:@" "];
          }
        }
        unint64_t v12 = 0x263F08000;
      }
      uint64_t v54 = [obj countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v54);
  }
  else
  {
    char v52 = 0;
  }

  [(__CFString *)v11 replaceOccurrencesOfString:@"’", @"'", 1, 0, [(__CFString *)v11 length] withString options range];
  [(__CFString *)string replaceOccurrencesOfString:@"’", @"'", 1, 0, [(__CFString *)string length] withString options range];
  [(__CFString *)v11 replaceOccurrencesOfString:@" 's", @"'s", 1, 0, [(__CFString *)v11 length] withString options range];
  [(__CFString *)string replaceOccurrencesOfString:@" 's", @"'s", 1, 0, [(__CFString *)string length] withString options range];
  if ([v48 isEqualToString:@"en"])
  {
    [(__CFString *)v11 replaceOccurrencesOfString:@" 'll", @"'ll", 1, 0, [(__CFString *)v11 length] withString options range];
    [(__CFString *)string replaceOccurrencesOfString:@" 'll", @"'ll", 1, 0, [(__CFString *)string length] withString options range];
    [(__CFString *)v11 replaceOccurrencesOfString:@" 've", @"'ve", 1, 0, [(__CFString *)v11 length] withString options range];
    [(__CFString *)string replaceOccurrencesOfString:@" 've", @"'ve", 1, 0, [(__CFString *)string length] withString options range];
    [(__CFString *)v11 replaceOccurrencesOfString:@" 're", @"'re", 1, 0, [(__CFString *)v11 length] withString options range];
    [(__CFString *)string replaceOccurrencesOfString:@" 're", @"'re", 1, 0, [(__CFString *)string length] withString options range];
    [(__CFString *)v11 replaceOccurrencesOfString:@" 'd", @"'d", 1, 0, [(__CFString *)v11 length] withString options range];
    [(__CFString *)string replaceOccurrencesOfString:@" 'd", @"'d", 1, 0, [(__CFString *)string length] withString options range];
    [(__CFString *)v11 replaceOccurrencesOfString:@"y' all", @"you", 1, 0, [(__CFString *)v11 length] withString options range];
    [(__CFString *)string replaceOccurrencesOfString:@"y' all", @"you", 1, 0, [(__CFString *)string length] withString options range];
  }
  if ([v48 isEqualToString:@"fr"])
  {
    [(__CFString *)v11 replaceOccurrencesOfString:@"c' est", @"c'est", 1, 0, [(__CFString *)v11 length] withString options range];
    [(__CFString *)string replaceOccurrencesOfString:@"c' est", @"c'est", 1, 0, [(__CFString *)string length] withString options range];
  }
  if (([v48 isEqualToString:@"pt"] & 1) != 0
    || ([v48 isEqualToString:@"tr"] & 1) != 0
    || ([v48 isEqualToString:@"it"] & 1) != 0
    || ([v48 isEqualToString:@"de"] & 1) != 0
    || [v48 isEqualToString:@"fr"])
  {
    [(__CFString *)v11 replaceOccurrencesOfString:@" - ", @"-", 1, 0, [(__CFString *)v11 length] withString options range];
    [(__CFString *)string replaceOccurrencesOfString:@" - ", @"-", 1, 0, [(__CFString *)string length] withString options range];
  }
  if (([v48 isEqualToString:@"it"] & 1) != 0
    || [v48 isEqualToString:@"fr"])
  {
    [(__CFString *)v11 replaceOccurrencesOfString:@"' ", @"'", 1, 0, [(__CFString *)v11 length] withString options range];
    [(__CFString *)string replaceOccurrencesOfString:@"' ", @"'", 1, 0, [(__CFString *)string length] withString options range];
  }
  if ([v48 isEqualToString:@"es"]
    && [v6 containsString:@" c.p."]
    && [(__CFString *)v11 containsString:@" c.p "])
  {
    [(__CFString *)v11 replaceOccurrencesOfString:@" c.p ", @" c.p. ", 1, 0, [(__CFString *)v11 length] withString options range];
    [(__CFString *)string replaceOccurrencesOfString:@" c.p ", @" c.p. ", 1, 0, [(__CFString *)string length] withString options range];
  }
  if (([v48 isEqualToString:@"es"] & 1) != 0
    || ([v48 isEqualToString:@"it"] & 1) != 0
    || ([v48 isEqualToString:@"pt"] & 1) != 0
    || [v48 isEqualToString:@"fr"])
  {
    CFStringRef v38 = (const __CFString *)*MEMORY[0x263EFFF48];
    CFStringTransform(v11, 0, (CFStringRef)*MEMORY[0x263EFFF48], 0);
    CFStringTransform(string, 0, v38, 0);
    id v39 = +[RKUtilities stripDiacritics:v11];
    id v40 = +[RKUtilities stripDiacritics:string];
  }
  v41 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  v42 = [(__CFString *)v11 stringByTrimmingCharactersInSet:v41];

  id v43 = [(RKProactiveGrammar *)v47 copyAttributedTokenForText:v42 forLanguageModel:v8 withLanguageCode:v48];
  if (((v43 == 0) & v52) == 1)
  {
    v44 = [MEMORY[0x263F08708] whitespaceCharacterSet];
    v45 = [(__CFString *)string stringByTrimmingCharactersInSet:v44];

    id v43 = [(RKProactiveGrammar *)v47 copyAttributedTokenForText:v45 forLanguageModel:v8 withLanguageCode:v48];
  }

  return v43;
}

- (id)copyAttributedTokenForText:(id)a3 forLanguageModel:(void *)a4 withLanguageCode:(id)a5
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  LMVocabularyGetSharedVocabulary();
  id v10 = [v8 componentsSeparatedByString:@" "];
  unint64_t v11 = [v10 count];

  if (v11 <= 2)
  {
    uint64_t v12 = [@"<s> " stringByAppendingString:v8];

    id v8 = (id)v12;
  }
  if ([v9 isEqualToString:@"zh-Hans"])
  {
    id v13 = [v8 stringByReplacingOccurrencesOfString:@" " withString:&stru_26C8AEFC8];

    if ([(RKProactiveGrammar *)self chineseTokenizer])
    {
      [v13 length];
      ChineseTokenizerSetString();
      id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
      if (ChineseTokenizerAdvanceToNextToken())
      {
        do
        {
          uint64_t CurrentTokenRange = ChineseTokenizerGetCurrentTokenRange();
          v17 = objc_msgSend(v13, "substringWithRange:", CurrentTokenRange, v16);
          [v14 addObject:v17];
        }
        while ((ChineseTokenizerAdvanceToNextToken() & 1) != 0);
      }
    }
    else
    {
      id v14 = 0;
    }
  }
  else
  {
    uint64_t v18 = [v8 componentsSeparatedByString:@" "];
    id v14 = (id)[v18 mutableCopy];

    id v13 = v8;
  }
  int v50 = 0;
  uint64_t v19 = [v14 count];
  if (v19)
  {
    id v40 = v13;
    id v41 = v9;
    uint64_t v38 = v19;
    id v20 = (char *)malloc_type_malloc(4 * v19, 0x100004052888210uLL);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v39 = v14;
    id v21 = v14;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      int v24 = 0;
      uint64_t v25 = *(void *)v47;
      v26 = @"'s";
      v42 = v20;
      uint64_t v44 = *(void *)v47;
      id v45 = v21;
      do
      {
        uint64_t v27 = 0;
        int v43 = v24;
        v28 = &v20[4 * v24];
        do
        {
          if (*(void *)v47 != v25) {
            objc_enumerationMutation(v21);
          }
          v29 = *(void **)(*((void *)&v46 + 1) + 8 * v27);
          v30 = objc_msgSend(v29, "lowercaseString", v38);
          if (!LMVocabularyContainsLemma() && [v29 hasSuffix:v26])
          {
            v31 = a4;
            uint64_t v32 = v26;
            uint64_t v33 = [v29 stringByReplacingOccurrencesOfString:v26 withString:&stru_26C8AEFC8];

            if (LMVocabularyContainsLemma())
            {
              v30 = v33;
            }
            else
            {
              uint64_t v34 = [v29 lowercaseString];

              v30 = (void *)v34;
            }
            v26 = v32;
            a4 = v31;
            uint64_t v25 = v44;
            id v21 = v45;
          }
          *(_DWORD *)&v28[4 * v27] = LMLanguageModelGetTokenIDForString();

          ++v27;
        }
        while (v23 != v27);
        uint64_t v23 = [v21 countByEnumeratingWithState:&v46 objects:v51 count:16];
        id v20 = v42;
        int v24 = v43 + v27;
      }
      while (v23);
    }

    id v13 = v40;
    id v9 = v41;
    id v14 = v39;
  }
  else
  {
    id v20 = 0;
  }
  uint64_t PredictionEnumerator = LMLanguageModelCreatePredictionEnumerator();
  if (!PredictionEnumerator
    || !LMPredictionEnumeratorAdvance()
    || (LMPredictionEnumeratorGetPrediction(), !v50))
  {
    uint64_t v36 = 0;
    if (!v20) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  uint64_t v36 = (void *)LMLanguageModelCopyTokenAttributes();
  if (v20) {
LABEL_33:
  }
    free(v20);
LABEL_34:
  if (PredictionEnumerator) {
    LMPredictionEnumeratorRelease();
  }

  return v36;
}

@end