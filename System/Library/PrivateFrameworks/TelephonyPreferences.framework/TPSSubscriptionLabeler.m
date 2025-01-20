@interface TPSSubscriptionLabeler
+ (BOOL)_dictionary:(id)a3 containsCollationEquivalentKey:(id)a4;
+ (BOOL)isExclusivelyCJKString:(id)a3 characterSets:(id)a4;
+ (BOOL)isString:(id)a3 exclusivelyInCharacterSet:(USet *)a4;
+ (double)widthOfString:(id)a3 attributes:(id)a4;
+ (id)_groupStringsByCollationEquivalency:(id)a3;
+ (id)_resultWithAllCharacters:(id)a3 string:(id)a4;
+ (id)displayShortLabelStringsForLongFormShortLabels:(id)a3;
+ (id)fontAttributeDictionary;
+ (id)localizedBadgeLabelsForUnlocalizedLabels:(id)a3;
+ (id)localizedBadgeLabelsForUnlocalizedLabels:(id)a3 languageIdentifiers:(id)a4;
+ (id)localizedBadgeLabelsForUnlocalizedLabels:(id)a3 languageStringOverrides:(id)a4;
+ (id)localizedLabelForLabel:(id)a3;
+ (id)localizedLabelForLabel:(id)a3 longForm:(BOOL)a4 languageStringOverrides:(id)a5;
+ (id)localizedLabelsForLabels:(id)a3 languageIdentifiers:(id)a4;
+ (id)localizedLabelsForLabels:(id)a3 languageStringOverrides:(id)a4;
+ (id)localizedStringDictionaryForLanguageIdentifiers:(id)a3 selectedLanguage:(id *)a4;
+ (id)standardLabelIdentifiers;
+ (id)stringByShorteningString:(id)a3 maximumWidth:(double)a4 attributes:(id)a5;
+ (id)stringsByAbbreviatingToPrefixesOfStrings:(id)a3;
+ (id)stringsByClippingStrings:(id)a3 toWidthOfString:(id)a4;
+ (id)stringsByNumericallyDisambiguatingStrings:(id)a3;
- (NSArray)applicableUnlocalizedLabels;
- (NSArray)cachedResult;
- (NSLocale)updatingLocale;
- (NSMutableDictionary)labelDictionary;
- (NSString)applicableLanguage;
- (NSURL)url;
- (OS_dispatch_queue)accessQueue;
- (TPSSubscriptionLabeler)initWithLabelStorage:(id)a3;
- (id)cachedLocalizedLabelsForUnlocalizedLabels:(id)a3;
- (id)cachedLocalizedLabelsForUnlocalizedLabels:(id)a3 languageIdentifiers:(id)a4;
- (void)_validateLabelsForInstalledUnlocalizedLabels:(id)a3 languageIdentifiers:(id)a4;
- (void)setAccessQueue:(id)a3;
- (void)setApplicableLanguage:(id)a3;
- (void)setApplicableUnlocalizedLabels:(id)a3;
- (void)setCachedResult:(id)a3;
- (void)setLabelDictionary:(id)a3;
- (void)setUpdatingLocale:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation TPSSubscriptionLabeler

- (TPSSubscriptionLabeler)initWithLabelStorage:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)TPSSubscriptionLabeler;
  v5 = [(TPSSubscriptionLabeler *)&v28 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CA60];
    v7 = [v4 path];
    uint64_t v8 = [v6 dictionaryWithContentsOfFile:v7];
    labelDictionary = v5->_labelDictionary;
    v5->_labelDictionary = (NSMutableDictionary *)v8;

    v10 = v5->_labelDictionary;
    if (!v10)
    {
      uint64_t v11 = objc_opt_new();
      v12 = v5->_labelDictionary;
      v5->_labelDictionary = (NSMutableDictionary *)v11;

      v10 = v5->_labelDictionary;
    }
    uint64_t v13 = [(NSMutableDictionary *)v10 objectForKey:@"Language"];
    applicableLanguage = v5->_applicableLanguage;
    v5->_applicableLanguage = (NSString *)v13;

    uint64_t v15 = [(NSMutableDictionary *)v5->_labelDictionary objectForKey:@"UnlocalizedLabels"];
    applicableUnlocalizedLabels = v5->_applicableUnlocalizedLabels;
    v5->_applicableUnlocalizedLabels = (NSArray *)v15;

    v17 = [(NSMutableDictionary *)v5->_labelDictionary objectForKey:@"LocalizedLabel"];
    v18 = [(NSMutableDictionary *)v5->_labelDictionary objectForKey:@"ShortLocalizedLabel"];
    uint64_t v19 = +[TPSSubscriptionLabel labelsFromUnlocalizedLabels:v5->_applicableUnlocalizedLabels localizedLongLabels:v17 localizedBadgeLabels:v18];
    cachedResult = v5->_cachedResult;
    v5->_cachedResult = (NSArray *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    updatingLocale = v5->_updatingLocale;
    v5->_updatingLocale = (NSLocale *)v21;

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.telephony.labelstore", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v23;

    uint64_t v25 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v25;
  }
  return v5;
}

+ (id)localizedStringDictionaryForLanguageIdentifiers:(id)a3 selectedLanguage:(id *)a4
{
  id v5 = a3;
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v22 = 0;
  dispatch_queue_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__3;
  v26 = __Block_byref_object_dispose__3;
  id v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  id v21 = 0;
  if ([v5 count])
  {
    v7 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v8 = [v6 localizations];
    v9 = [v7 preferredLocalizationsFromArray:v8 forPreferences:v5];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __91__TPSSubscriptionLabeler_localizedStringDictionaryForLanguageIdentifiers_selectedLanguage___block_invoke;
    v12[3] = &unk_1E6EB28E0;
    v14 = &v22;
    id v13 = v6;
    uint64_t v15 = &v16;
    [v9 enumerateObjectsUsingBlock:v12];
  }
  if (a4) {
    *a4 = (id) v17[5];
  }
  id v10 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

void __91__TPSSubscriptionLabeler_localizedStringDictionaryForLanguageIdentifiers_selectedLanguage___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v7 = objc_msgSend(*(id *)(a1 + 32), "localizedStringsForTable:localization:", @"SubscriptionLabel");
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    *a4 = 1;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
}

+ (id)localizedLabelForLabel:(id)a3
{
  return (id)[a1 localizedLabelForLabel:a3 longForm:1 languageStringOverrides:0];
}

+ (id)localizedLabelsForLabels:(id)a3 languageIdentifiers:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a1 localizedStringDictionaryForLanguageIdentifiers:a4 selectedLanguage:0];
  uint64_t v8 = [a1 localizedLabelsForLabels:v6 languageStringOverrides:v7];

  return v8;
}

+ (id)localizedLabelsForLabels:(id)a3 languageStringOverrides:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = objc_msgSend(a1, "localizedLabelForLabel:longForm:languageStringOverrides:", *(void *)(*((void *)&v16 + 1) + 8 * i), 1, v7, (void)v16);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (id)localizedLabelForLabel:(id)a3 longForm:(BOOL)a4 languageStringOverrides:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = v7;
  id v10 = v9;
  if ([v9 hasPrefix:@"_$<"])
  {
    id v10 = v9;
    if ([v9 hasSuffix:@">$_"])
    {
      uint64_t v11 = objc_msgSend(v9, "substringWithRange:", 3, objc_msgSend(v9, "length") - 6);
      if (v8)
      {
        uint64_t v12 = [v8 objectForKey:@"_$<SUBSCRIPTION_LABEL_UNKNOWN>$_"];
        id v13 = (void *)v12;
        v14 = @"untitled";
        if (v12) {
          v14 = (__CFString *)v12;
        }
        uint64_t v15 = v14;

        uint64_t v16 = [v8 objectForKey:v11];
        long long v17 = (void *)v16;
        if (v16) {
          long long v18 = (void *)v16;
        }
        else {
          long long v18 = v15;
        }
        id v10 = v18;

        if (a4) {
          goto LABEL_18;
        }
        long long v19 = [NSString stringWithFormat:@"%@_SHORT", v11];
        uint64_t v20 = [v8 objectForKey:v19];
        uint64_t v21 = (void *)v20;
        if (v20) {
          uint64_t v22 = (void *)v20;
        }
        else {
          uint64_t v22 = v10;
        }
        id v23 = v22;
      }
      else
      {
        long long v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v24 = [v19 localizedStringForKey:@"_$<SUBSCRIPTION_LABEL_UNKNOWN>$_" value:@"untitled" table:@"SubscriptionLabel"];

        id v10 = [v19 localizedStringForKey:v11 value:v24 table:@"SubscriptionLabel"];

        if (a4)
        {
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        uint64_t v21 = [NSString stringWithFormat:@"%@_SHORT", v11];
        id v23 = [v19 localizedStringForKey:v21 value:v10 table:@"SubscriptionLabel"];
      }
      id v25 = v23;

      id v10 = v25;
      goto LABEL_17;
    }
  }
LABEL_19:
  if (!a4)
  {
    uint64_t v26 = [v10 localizedUppercaseString];

    id v10 = (id)v26;
  }

  return v10;
}

- (id)cachedLocalizedLabelsForUnlocalizedLabels:(id)a3 languageIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__3;
  uint64_t v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __88__TPSSubscriptionLabeler_cachedLocalizedLabelsForUnlocalizedLabels_languageIdentifiers___block_invoke;
  v13[3] = &unk_1E6EB2908;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(accessQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

uint64_t __88__TPSSubscriptionLabeler_cachedLocalizedLabelsForUnlocalizedLabels_languageIdentifiers___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _validateLabelsForInstalledUnlocalizedLabels:*(void *)(a1 + 40) languageIdentifiers:*(void *)(a1 + 48)];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 32) cachedResult];
  return MEMORY[0x1F41817F8]();
}

- (id)cachedLocalizedLabelsForUnlocalizedLabels:(id)a3
{
  return [(TPSSubscriptionLabeler *)self cachedLocalizedLabelsForUnlocalizedLabels:a3 languageIdentifiers:0];
}

- (void)_validateLabelsForInstalledUnlocalizedLabels:(id)a3 languageIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v28 = 0;
  id v8 = [(id)objc_opt_class() localizedStringDictionaryForLanguageIdentifiers:v7 selectedLanguage:&v28];

  id v9 = v28;
  if (!v8)
  {
    id v10 = [(TPSSubscriptionLabeler *)self updatingLocale];
    uint64_t v11 = [v10 languageCode];

    id v9 = (id)v11;
  }
  uint64_t v12 = [(TPSSubscriptionLabeler *)self applicableLanguage];
  int v13 = [v9 isEqualToString:v12];

  id v14 = [(TPSSubscriptionLabeler *)self applicableUnlocalizedLabels];
  char v15 = [v6 isEqual:v14];

  if (!v13 || (v15 & 1) == 0)
  {
    uint64_t v16 = [(id)objc_opt_class() localizedBadgeLabelsForUnlocalizedLabels:v6 languageStringOverrides:v8];
    uint64_t v17 = [(id)objc_opt_class() localizedLabelsForLabels:v6 languageStringOverrides:v8];
    long long v18 = (void *)[v17 copy];
    uint64_t v19 = [(TPSSubscriptionLabeler *)self labelDictionary];
    [v19 setObject:v6 forKey:@"UnlocalizedLabels"];

    uint64_t v20 = [(TPSSubscriptionLabeler *)self labelDictionary];
    [v20 setObject:v9 forKey:@"Language"];

    uint64_t v21 = [(TPSSubscriptionLabeler *)self labelDictionary];
    [v21 setObject:v18 forKey:@"LocalizedLabel"];

    id v22 = [(TPSSubscriptionLabeler *)self labelDictionary];
    [v22 setObject:v16 forKey:@"ShortLocalizedLabel"];

    id v23 = (void *)MEMORY[0x1E4F28F98];
    uint64_t v24 = [(TPSSubscriptionLabeler *)self labelDictionary];
    id v25 = [v23 dataWithPropertyList:v24 format:200 options:0 error:0];

    uint64_t v26 = [(TPSSubscriptionLabeler *)self url];
    [v25 writeToURL:v26 atomically:1];

    [(TPSSubscriptionLabeler *)self setApplicableLanguage:v9];
    [(TPSSubscriptionLabeler *)self setApplicableUnlocalizedLabels:v6];
    id v27 = +[TPSSubscriptionLabel labelsFromUnlocalizedLabels:v6 localizedLongLabels:v18 localizedBadgeLabels:v16];
    [(TPSSubscriptionLabeler *)self setCachedResult:v27];
  }
}

+ (id)localizedBadgeLabelsForUnlocalizedLabels:(id)a3 languageStringOverrides:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = objc_msgSend((id)objc_opt_class(), "localizedLabelForLabel:longForm:languageStringOverrides:", *(void *)(*((void *)&v17 + 1) + 8 * i), 0, v7, (void)v17);
        [v8 addObject:v14];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  char v15 = [a1 displayShortLabelStringsForLongFormShortLabels:v8];

  return v15;
}

+ (id)localizedBadgeLabelsForUnlocalizedLabels:(id)a3 languageIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = [a1 localizedStringDictionaryForLanguageIdentifiers:a4 selectedLanguage:0];
  id v8 = [a1 localizedBadgeLabelsForUnlocalizedLabels:v6 languageStringOverrides:v7];

  return v8;
}

+ (id)localizedBadgeLabelsForUnlocalizedLabels:(id)a3
{
  return (id)[a1 localizedBadgeLabelsForUnlocalizedLabels:a3 languageIdentifiers:0];
}

+ (id)displayShortLabelStringsForLongFormShortLabels:(id)a3
{
  id v4 = [a1 stringsByAbbreviatingToPrefixesOfStrings:a3];
  id v5 = [a1 stringsByClippingStrings:v4 toWidthOfString:@"𣍊𣍊𣍊"];

  id v6 = [a1 stringsByNumericallyDisambiguatingStrings:v5];

  return v6;
}

+ (id)stringsByAbbreviatingToPrefixesOfStrings:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(TPSSubscriptionLabelerCharacterSets);
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__TPSSubscriptionLabeler_stringsByAbbreviatingToPrefixesOfStrings___block_invoke;
  v13[3] = &unk_1E6EB2958;
  id v17 = a1;
  id v14 = v5;
  id v15 = v4;
  id v7 = v6;
  id v16 = v7;
  id v8 = v4;
  id v9 = v5;
  [v8 enumerateObjectsUsingBlock:v13];
  uint64_t v10 = v16;
  id v11 = v7;

  return v11;
}

void __67__TPSSubscriptionLabeler_stringsByAbbreviatingToPrefixesOfStrings___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  id v6 = 0;
  if (([*(id *)(a1 + 56) isExclusivelyCJKString:v5 characterSets:*(void *)(a1 + 32)] & 1) == 0)
  {
    do
    {
      unint64_t v7 = v29[3];
      if (v7 >= [v5 length]) {
        break;
      }
      uint64_t v8 = [v5 rangeOfComposedCharacterSequenceAtIndex:v29[3]];
      uint64_t v10 = v9;
      id v11 = [v5 substringToIndex:v8 + v9];
      uint64_t v24 = 0;
      id v25 = &v24;
      uint64_t v26 = 0x2020000000;
      char v27 = 0;
      uint64_t v12 = *(void **)(a1 + 40);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __67__TPSSubscriptionLabeler_stringsByAbbreviatingToPrefixesOfStrings___block_invoke_2;
      v17[3] = &unk_1E6EB2930;
      uint64_t v21 = a3;
      id v13 = v11;
      id v18 = v13;
      long long v19 = &v24;
      long long v20 = &v28;
      uint64_t v22 = v8;
      uint64_t v23 = v10;
      [v12 enumerateObjectsUsingBlock:v17];
      int v14 = *((unsigned __int8 *)v25 + 24);
      if (!*((unsigned char *)v25 + 24))
      {
        id v15 = v13;

        id v6 = v15;
      }

      _Block_object_dispose(&v24, 8);
    }
    while (v14);
  }
  if (v6) {
    id v16 = v6;
  }
  else {
    id v16 = v5;
  }
  [*(id *)(a1 + 48) addObject:v16];

  _Block_object_dispose(&v28, 8);
}

void __67__TPSSubscriptionLabeler_stringsByAbbreviatingToPrefixesOfStrings___block_invoke_2(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if (a1[7] != a3)
  {
    id v9 = v7;
    BOOL v8 = [v7 rangeOfString:a1[4] options:137] == 0x7FFFFFFFFFFFFFFFLL;
    id v7 = v9;
    if (!v8)
    {
      *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
      *a4 = 1;
      *(void *)(*(void *)(a1[6] + 8) + 24) = a1[9] + a1[8];
    }
  }
}

+ (id)stringsByClippingStrings:(id)a3 toWidthOfString:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  id v9 = v8;
  if ([v8 count])
  {
    uint64_t v10 = [a1 fontAttributeDictionary];
    [a1 widthOfString:v7 attributes:v10];
    uint64_t v12 = v11;
    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __67__TPSSubscriptionLabeler_stringsByClippingStrings_toWidthOfString___block_invoke;
    v27[3] = &unk_1E6EB2980;
    id v30 = a1;
    id v13 = v10;
    uint64_t v31 = v12;
    id v28 = v13;
    v29 = &v32;
    [v8 enumerateObjectsUsingBlock:v27];
    id v9 = v8;
    if (*((unsigned char *)v33 + 24))
    {
      id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v14 = v8;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v36 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v14);
            }
            id v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            uint64_t v19 = objc_msgSend(v18, "rangeOfComposedCharacterSequenceAtIndex:", 0, (void)v23);
            uint64_t v21 = [v18 substringToIndex:v19 + v20];
            [v9 addObject:v21];
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v23 objects:v36 count:16];
        }
        while (v15);
      }
    }
    _Block_object_dispose(&v32, 8);
  }
  CTFontRemoveFromCaches();

  return v9;
}

uint64_t __67__TPSSubscriptionLabeler_stringsByClippingStrings_toWidthOfString___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 48) widthOfString:a2 attributes:*(void *)(a1 + 32)];
  if (v7 > *(double *)(a1 + 56))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (id)fontAttributeDictionary
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = (const __CTFontDescriptor *)CTFontDescriptorCreateForUIType();
  v3 = v2;
  if (v2)
  {
    CTFontRef v4 = CTFontCreateWithFontDescriptor(v2, 0.0, 0);
    CFRelease(v3);
    if (v4)
    {
      uint64_t v6 = *MEMORY[0x1E4F243F0];
      v7[0] = v4;
      v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

+ (double)widthOfString:(id)a3 attributes:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F28B18];
  id v6 = a4;
  id v7 = a3;
  CFAttributedStringRef v8 = (const __CFAttributedString *)[[v5 alloc] initWithString:v7 attributes:v6];

  id v9 = CTLineCreateWithAttributedString(v8);
  CGRect BoundsWithOptions = CTLineGetBoundsWithOptions(v9, 0);
  double width = BoundsWithOptions.size.width;
  CFRelease(v9);

  return width;
}

+ (id)stringByShorteningString:(id)a3 maximumWidth:(double)a4 attributes:(id)a5
{
  id v8 = a3;
  [a1 widthOfString:v8 attributes:a5];
  id v9 = v8;
  if (v10 > a4)
  {
    uint64_t v11 = [v8 rangeOfComposedCharacterSequenceAtIndex:0];
    id v9 = [v8 substringToIndex:v11 + v12];
  }
  return v9;
}

+ (id)stringsByNumericallyDisambiguatingStrings:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v17 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  CTFontRef v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v33 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = (void *)[*(id *)(*((void *)&v32 + 1) + 8 * i) mutableCopy];
        [v4 addObject:v8];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v5);
  }

  id v9 = [a1 _groupStringsByCollationEquivalency:v4];
  [v9 allKeys];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v10; ++j)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v19);
        }
        id v13 = [v9 objectForKey:*(void *)(*((void *)&v28 + 1) + 8 * j)];
        if ((unint64_t)[v13 count] >= 2)
        {
          v26[0] = 0;
          v26[1] = v26;
          v26[2] = 0x2020000000;
          int v27 = 1;
          id v14 = [v13 firstObject];
          BOOL v15 = [v14 rangeOfCharacterFromSet:v17 options:12] != 0x7FFFFFFFFFFFFFFFLL;

          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __68__TPSSubscriptionLabeler_stringsByNumericallyDisambiguatingStrings___block_invoke;
          v21[3] = &unk_1E6EB29A8;
          BOOL v25 = v15;
          long long v23 = v26;
          id v24 = a1;
          id v22 = v9;
          [v13 enumerateObjectsUsingBlock:v21];

          _Block_object_dispose(v26, 8);
        }
      }
      uint64_t v10 = [v19 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v10);
  }

  return v4;
}

void __68__TPSSubscriptionLabeler_stringsByNumericallyDisambiguatingStrings___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = 0;
  do
  {
    CTFontRef v4 = v3;
    if (*(unsigned char *)(a1 + 56)) {
      uint64_t v5 = @" %d";
    }
    else {
      uint64_t v5 = @"%d";
    }
    id v3 = objc_msgSend(v6, "stringByAppendingFormat:", v5, *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));

    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  while (([*(id *)(a1 + 48) _dictionary:*(void *)(a1 + 32) containsCollationEquivalentKey:v3] & 1) != 0);
  [v6 setString:v3];
  [*(id *)(a1 + 32) setObject:v3 forKey:v3];
}

+ (BOOL)_dictionary:(id)a3 containsCollationEquivalentKey:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "compare:options:", v6, 385, (void)v12))
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

+ (id)_groupStringsByCollationEquivalency:(id)a3
{
  id v3 = a3;
  CTFontRef v4 = objc_opt_new();
  id v5 = (void *)[v3 mutableCopy];
  while ([v5 count])
  {
    id v6 = objc_opt_new();
    uint64_t v13 = 0;
    long long v14 = &v13;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__3;
    uint64_t v17 = __Block_byref_object_dispose__3;
    id v18 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __62__TPSSubscriptionLabeler__groupStringsByCollationEquivalency___block_invoke;
    v10[3] = &unk_1E6EB29D0;
    long long v12 = &v13;
    id v7 = v6;
    id v11 = v7;
    [v5 enumerateObjectsUsingBlock:v10];
    uint64_t v8 = [v5 objectsAtIndexes:v7];
    [v5 removeObjectsAtIndexes:v7];
    [v4 setObject:v8 forKey:v14[5]];

    _Block_object_dispose(&v13, 8);
  }

  return v4;
}

void __62__TPSSubscriptionLabeler__groupStringsByCollationEquivalency___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v7 + 40);
  uint64_t v8 = (id *)(v7 + 40);
  uint64_t v9 = v10;
  id v11 = v6;
  if (v10)
  {
    if ([v9 compare:v6 options:385]) {
      goto LABEL_6;
    }
  }
  else
  {
    objc_storeStrong(v8, a2);
  }
  [*(id *)(a1 + 32) addIndex:a3];
LABEL_6:
}

+ (id)standardLabelIdentifiers
{
  v4[6] = *MEMORY[0x1E4F143B8];
  v4[0] = @"_$<SUBSCRIPTION_LABEL_PRIMARY>$_";
  v4[1] = @"_$<SUBSCRIPTION_LABEL_SECONDARY>$_";
  v4[2] = @"_$<SUBSCRIPTION_LABEL_PERSONAL>$_";
  v4[3] = @"_$<SUBSCRIPTION_LABEL_BUSINESS>$_";
  v4[4] = @"_$<SUBSCRIPTION_LABEL_TRAVEL>$_";
  v4[5] = @"_$<SUBSCRIPTION_LABEL_DATA>$_";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:6];
  return v2;
}

+ (BOOL)isExclusivelyCJKString:(id)a3 characterSets:(id)a4
{
  id v6 = a3;
  LOBYTE(a4) = objc_msgSend(a1, "isString:exclusivelyInCharacterSet:", v6, objc_msgSend(a4, "CJK"));

  return (char)a4;
}

+ (BOOL)isString:(id)a3 exclusivelyInCharacterSet:(USet *)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    id v6 = objc_opt_class();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__TPSSubscriptionLabeler_isString_exclusivelyInCharacterSet___block_invoke;
    v10[3] = &__block_descriptor_40_e13__24__0r_S8Q16l;
    void v10[4] = a4;
    uint64_t v7 = [v6 _resultWithAllCharacters:v10 string:v5];
    char v8 = [v7 BOOLValue];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

id __61__TPSSubscriptionLabeler_isString_exclusivelyInCharacterSet___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = [NSNumber numberWithChar:uset_containsAllCodePoints()];
  }
  else
  {
    id v3 = (void *)MEMORY[0x1E4F1CC38];
  }
  return v3;
}

+ (id)_resultWithAllCharacters:(id)a3 string:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (__CFString *)a4;
  unint64_t v7 = [(__CFString *)v6 length];
  if (![(__CFString *)v6 length]) {
    goto LABEL_9;
  }
  CharactersPtr = CFStringGetCharactersPtr(v6);
  if (!CharactersPtr)
  {
    if (v7 <= 0xFE)
    {
      -[__CFString getCharacters:range:](v6, "getCharacters:range:", v17, 0, v7);
      v17[v7] = 0;
      uint64_t v10 = (void (*)(void *, const UniChar *, unint64_t))v5[2];
      uint64_t v9 = v17;
      goto LABEL_6;
    }
    uint64_t v13 = malloc_type_malloc(2 * v7 + 2, 0x1000040BDFB0063uLL);
    if (v13)
    {
      long long v14 = v13;
      -[__CFString getCharacters:range:](v6, "getCharacters:range:", v13, 0, v7);
      v14[v7] = 0;
      uint64_t v15 = ((void (*)(void *, void *, unint64_t))v5[2])(v5, v14, v7);
      free(v14);
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v10 = (void (*)(void *, const UniChar *, unint64_t))v5[2];
    id v11 = v5;
    uint64_t v9 = 0;
    unint64_t v12 = 0;
    goto LABEL_10;
  }
  uint64_t v9 = CharactersPtr;
  uint64_t v10 = (void (*)(void *, const UniChar *, unint64_t))v5[2];
LABEL_6:
  id v11 = v5;
  unint64_t v12 = v7;
LABEL_10:
  uint64_t v15 = v10(v11, v9, v12);
LABEL_11:

  return v15;
}

- (NSMutableDictionary)labelDictionary
{
  return self->_labelDictionary;
}

- (void)setLabelDictionary:(id)a3
{
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSArray)applicableUnlocalizedLabels
{
  return self->_applicableUnlocalizedLabels;
}

- (void)setApplicableUnlocalizedLabels:(id)a3
{
}

- (NSString)applicableLanguage
{
  return self->_applicableLanguage;
}

- (void)setApplicableLanguage:(id)a3
{
}

- (NSLocale)updatingLocale
{
  return self->_updatingLocale;
}

- (void)setUpdatingLocale:(id)a3
{
}

- (NSArray)cachedResult
{
  return self->_cachedResult;
}

- (void)setCachedResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedResult, 0);
  objc_storeStrong((id *)&self->_updatingLocale, 0);
  objc_storeStrong((id *)&self->_applicableLanguage, 0);
  objc_storeStrong((id *)&self->_applicableUnlocalizedLabels, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_labelDictionary, 0);
}

@end