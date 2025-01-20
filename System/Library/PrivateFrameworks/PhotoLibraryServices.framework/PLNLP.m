@interface PLNLP
+ (BOOL)nlpSearchSupportsLocale:(id)a3;
+ (id)_englishStopWords;
+ (id)_frenchStopWords;
+ (id)dateFilterForCMMWithAttributes:(id)a3 withReferenceDate:(id)a4;
+ (id)dateIntervalsFromMessage:(id)a3 onDate:(id)a4;
+ (id)lemmasForToken:(id)a3 locale:(id)a4 options:(int64_t)a5;
+ (id)ngramsFromTokens:(id)a3 ofSize:(unint64_t)a4 usingSeparator:(id)a5;
+ (id)stopWordsForLanguageCode:(id)a3;
+ (id)stringWithoutDiacriticsFromString:(id)a3;
+ (id)tokensFromString:(id)a3 options:(int64_t)a4;
@end

@implementation PLNLP

+ (BOOL)nlpSearchSupportsLocale:(id)a3
{
  v3 = [a3 languageCode];
  char v4 = [&unk_1EEBF22A0 containsObject:v3];

  return v4;
}

+ (id)_frenchStopWords
{
  id v2 = objc_unsafeClaimAutoreleasedReturnValue((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"ai", @"aie", @"aient", @"aies", @"ait", @"as", @"au", @"aura", @"aurai", @"auraient", @"aurais", @"aurait", @"auras", @"aurez", @"auriez", @"aurions", @"aurons",
                                                     @"auront",
                                                     @"aux",
                                                     @"avaient",
                                                     @"avais",
                                                     @"avait",
                                                     @"avec",
                                                     @"avez",
                                                     @"aviez",
                                                     @"avions",
                                                     @"avons",
                                                     @"ayant",
                                                     @"ayez",
                                                     @"ayons",
                                                     @"c",
                                                     @"ce",
                                                     @"ceci",
                                                     @"cela",
                                                     @"celà",
                                                     @"ces",
                                                     @"cet",
                                                     @"cette",
                                                     @"d",
                                                     @"dans",
                                                     @"de",
                                                     @"des",
                                                     @"du",
                                                     @"elle",
                                                     @"en",
                                                     @"es",
                                                     @"est",
                                                     @"et",
                                                     @"eu",
                                                     @"eue",
                                                     @"eues",
                                                     @"eurent",
                                                     @"eus",
                                                     @"eusse",
                                                     @"eussent",
                                                     @"eusses",
                                                     @"eussiez",
                                                     @"eussions",
                                                     @"eut",
                                                     @"eux",
                                                     @"furent"));
  return 0;
}

+ (id)_englishStopWords
{
  id v2 = (void *)_englishStopWords_stopWords;
  if (!_englishStopWords_stopWords)
  {
    objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"a", @"about", @"above", @"after", @"again", @"against", @"all", @"also", @"am", @"an", @"and", @"another", @"any", @"are", @"as", @"at", @"back",
      @"be",
      @"because",
      @"been",
      @"before",
      @"being",
      @"below",
      @"between",
      @"both",
      @"but",
      @"by",
      @"can",
      @"could",
      @"did",
      @"do",
      @"does",
      @"doing",
      @"down",
      @"during",
      @"each",
      @"even",
      @"ever",
      @"every",
      @"few",
      @"first",
      @"five",
      @"for",
      @"four",
      @"from",
      @"further",
      @"get",
      @"go",
      @"goes",
      @"had",
      @"has",
      @"have",
      @"having",
      @"he",
      @"her",
      @"here",
      @"hers",
      @"herself",
      @"high",
      @"him",
    uint64_t v3 = @"himself");
    char v4 = (void *)_englishStopWords_stopWords;
    _englishStopWords_stopWords = v3;

    id v2 = (void *)_englishStopWords_stopWords;
  }
  return v2;
}

+ (id)stopWordsForLanguageCode:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"en", @"fr", 0);
  if ([v5 containsObject:v4])
  {
    if ([v4 isEqualToString:@"en"])
    {
      uint64_t v6 = [a1 _englishStopWords];
LABEL_9:
      v8 = (void *)v6;
      goto LABEL_11;
    }
    if ([v4 isEqualToString:@"fr"])
    {
      uint64_t v6 = [a1 _frenchStopWords];
      goto LABEL_9;
    }
  }
  else
  {
    v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "We don't have a stop word list for language %@", buf, 0xCu);
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

+ (id)dateFilterForCMMWithAttributes:(id)a3 withReferenceDate:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F79B68]];
  v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v9 = [v8 components:540 fromDate:v6];
  v48 = (void *)v9;
  if (!v7)
  {
    v17 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F79B90]];
    v18 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F79B88]];
    v19 = 0;
    if (v17) {
      goto LABEL_50;
    }
    goto LABEL_11;
  }
  v10 = (void *)v9;
  id v11 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F79B80]];
  int v12 = [v11 unsignedIntegerValue];

  if (v12 == 3 || v12 == 8)
  {
    v14 = [v8 dateFromComponents:v7];
    uint64_t v15 = [v8 dateByAddingUnit:0x2000 value:1 toDate:v14 options:0];
    v16 = (void *)v15;
    if (v14)
    {
      v17 = [v8 components:28 fromDate:v14];
      if (!v16) {
        goto LABEL_22;
      }
    }
    else
    {
      v17 = 0;
      if (!v15) {
        goto LABEL_22;
      }
    }
    v18 = [v8 components:28 fromDate:v16];
    goto LABEL_37;
  }
  if (v12 != 38
    || ((uint64_t v21 = [v7 month], v22 = objc_msgSend(v7, "year"),
                                          [v7 day] != 0x7FFFFFFFFFFFFFFFLL)
      ? (BOOL v23 = v21 == 0x7FFFFFFFFFFFFFFFLL)
      : (BOOL v23 = 1),
        !v23 ? (BOOL v24 = v22 == 0x7FFFFFFFFFFFFFFFLL) : (BOOL v24 = 0),
        !v24))
  {
    v14 = 0;
    v16 = 0;
    v17 = 0;
LABEL_22:
    v18 = 0;
LABEL_37:
    v19 = v7;
    goto LABEL_38;
  }
  v19 = (void *)[v7 copy];
  objc_msgSend(v19, "setYear:", objc_msgSend(v10, "year"));
  v45 = [v8 dateFromComponents:v19];
  if ([v45 compare:v6] == 1) {
    objc_msgSend(v19, "setYear:", objc_msgSend(v10, "year") - 1);
  }
  v46 = PLBackendGetLog();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v50 = v7;
    __int16 v51 = 2112;
    v52 = v19;
    _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_DEFAULT, "Adjusting date component %@ to date component %@", buf, 0x16u);
  }

  v14 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
LABEL_38:
  v36 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F79B78]];
  int v37 = [v36 unsignedIntegerValue];

  if (v37 == 2)
  {
    if (v17) {
      v40 = v17;
    }
    else {
      v40 = v19;
    }
    id v41 = v40;

    id v39 = 0;
    v17 = v41;
  }
  else
  {
    if (v37 != 1) {
      goto LABEL_49;
    }

    if (v18) {
      v38 = v18;
    }
    else {
      v38 = v19;
    }
    id v39 = v38;
    v17 = 0;
  }

  v18 = v39;
LABEL_49:

  if (v17)
  {
LABEL_50:
    v42 = [PSIDateFilter alloc];
    if (v18) {
      v20 = [(PSIDateFilter *)v42 initWithStartDateComponents:v17 endDateComponents:v18];
    }
    else {
      v20 = [(PSIDateFilter *)v42 initWithStartDateComponents:v17];
    }
    goto LABEL_53;
  }
LABEL_11:
  if (v18)
  {
    v20 = [[PSIDateFilter alloc] initWithEndDateComponents:v18];
LABEL_53:
    v25 = v20;
    goto LABEL_54;
  }
  if (v19)
  {
    v25 = [[PSIDateFilter alloc] initWithSingleDateComponents:v19];
    uint64_t v26 = [v19 weekday];
    if (!v25)
    {
      uint64_t v27 = v26;
      if (v26 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v47 = (void *)[v19 copy];
        uint64_t v28 = [v19 month];
        uint64_t v29 = [v19 year];
        if ([v19 day] == 0x7FFFFFFFFFFFFFFFLL
          && v28 == 0x7FFFFFFFFFFFFFFFLL
          && v29 == 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v30 = (v27 - [v48 weekday] - 7) % 7uLL;
          if (v30) {
            uint64_t v31 = v30;
          }
          else {
            uint64_t v31 = -7;
          }
          v32 = [v8 dateByAddingUnit:16 value:v31 toDate:v6 options:0];
          v33 = [MEMORY[0x1E4F1C9A8] currentCalendar];
          v34 = [v33 components:28 fromDate:v32];

          v35 = PLBackendGetLog();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v50 = v19;
            __int16 v51 = 2112;
            v52 = v34;
            _os_log_impl(&dword_19B3C7000, v35, OS_LOG_TYPE_DEFAULT, "Adjusting date component %@ to date component %@", buf, 0x16u);
          }
        }
        else
        {
          v34 = v47;
          [v47 setWeekday:0x7FFFFFFFFFFFFFFFLL];
        }
        v25 = [[PSIDateFilter alloc] initWithSingleDateComponents:v34];
      }
    }
  }
  else
  {
    v25 = 0;
  }
LABEL_54:
  v43 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F79B70]];
  [(PSIDateFilter *)v25 setDisplayString:v43];

  return v25;
}

+ (id)dateIntervalsFromMessage:(id)a3 onDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [MEMORY[0x1E4F79BC0] defaultManager];
  uint64_t v10 = [v6 length];
  id v11 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __41__PLNLP_dateIntervalsFromMessage_onDate___block_invoke;
  v19[3] = &unk_1E5872368;
  uint64_t v23 = 0;
  uint64_t v24 = v10;
  id v25 = a1;
  id v20 = v7;
  id v21 = v11;
  id v12 = v8;
  id v22 = v12;
  id v13 = v11;
  id v14 = v7;
  id v15 = (id)[v9 tokenizeAndEnumerateAttributedParsesForQuery:v6 options:MEMORY[0x1E4F1CC08] withBlock:v19];
  v16 = v22;
  id v17 = v12;

  return v17;
}

void __41__PLNLP_dateIntervalsFromMessage_onDate___block_invoke(uint64_t a1, void *a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__PLNLP_dateIntervalsFromMessage_onDate___block_invoke_2;
  v4[3] = &unk_1E5872340;
  uint64_t v8 = *(void *)(a1 + 72);
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "enumerateAttributesInRange:options:usingBlock:", *(void *)(a1 + 56), *(void *)(a1 + 64), 0, v4);
}

uint64_t __41__PLNLP_dateIntervalsFromMessage_onDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v21 = a2;
  if ([v21 count])
  {
    uint64_t v3 = [*(id *)(a1 + 56) dateFilterForCMMWithAttributes:v21 withReferenceDate:*(void *)(a1 + 32)];
    id v4 = v3;
    if (!v3)
    {
LABEL_11:

      goto LABEL_12;
    }
    id v5 = [v3 singleDate];

    if (v5)
    {
      id v6 = [v4 singleDate];
      id v7 = [v6 dateComponents];

      uint64_t v8 = [*(id *)(a1 + 40) dateFromComponents:v7];
      if (!v8)
      {
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v9 = [*(id *)(a1 + 40) dateByAddingUnit:16 value:1 toDate:v8 options:0];
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v8 endDate:v9];
      [*(id *)(a1 + 48) addObject:v10];
    }
    else
    {
      uint64_t v11 = [v4 startDate];
      if (!v11) {
        goto LABEL_11;
      }
      id v12 = (void *)v11;
      id v13 = [v4 endDate];

      if (!v13) {
        goto LABEL_11;
      }
      id v14 = *(void **)(a1 + 40);
      id v15 = [v4 startDate];
      v16 = [v15 dateComponents];
      id v7 = [v14 dateFromComponents:v16];

      id v17 = *(void **)(a1 + 40);
      v18 = [v4 endDate];
      v19 = [v18 dateComponents];
      uint64_t v8 = [v17 dateFromComponents:v19];

      uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v7 endDate:v8];
      [*(id *)(a1 + 48) addObject:v9];
    }

    goto LABEL_10;
  }
LABEL_12:
  return MEMORY[0x1F4181820]();
}

+ (id)ngramsFromTokens:(id)a3 ofSize:(unint64_t)a4 usingSeparator:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  unint64_t v9 = [v7 count];
  unint64_t v10 = v9 - a4;
  if (v9 >= a4)
  {
    id v12 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v13 = 0;
    do
    {
      id v14 = objc_msgSend(v7, "subarrayWithRange:", v13, a4);
      id v15 = [v14 componentsJoinedByString:v8];

      [v12 addObject:v15];
      ++v13;
    }
    while (v13 <= v10);
  }
  else
  {
    uint64_t v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134218242;
      unint64_t v18 = a4;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Cannot generate %lu-grams from tokens %@", (uint8_t *)&v17, 0x16u);
    }

    id v12 = 0;
  }

  return v12;
}

+ (id)stringWithoutDiacriticsFromString:(id)a3
{
  uint64_t v3 = (__CFString *)[a3 mutableCopy];
  CFStringTransform(v3, 0, (CFStringRef)*MEMORY[0x1E4F1D4E8], 0);
  return v3;
}

+ (id)tokensFromString:(id)a3 options:(int64_t)a4
{
  char v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((v4 & 8) != 0)
  {
    id v8 = [MEMORY[0x1E4F28DF0] dominantLanguageForString:v6];
    unint64_t v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v30 = v8;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Detected language from string: %@", buf, 0xCu);
    }

    id v7 = [a1 stopWordsForLanguageCode:v8];
  }
  else
  {
    id v7 = 0;
    id v8 = 0;
  }
  unint64_t v10 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v28 = *MEMORY[0x1E4F28518];
  uint64_t v11 = v28;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  unint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28DF0]) initWithTagSchemes:v12 options:0];
  [v13 setString:v6];
  uint64_t v14 = [v6 length];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __34__PLNLP_tokensFromString_options___block_invoke;
  v21[3] = &unk_1E5872318;
  id v22 = v6;
  id v23 = v7;
  BOOL v26 = (v4 & 2) != 0;
  id v25 = a1;
  BOOL v27 = (v4 & 4) != 0;
  id v15 = v10;
  id v24 = v15;
  id v16 = v7;
  id v17 = v6;
  objc_msgSend(v13, "enumerateTagsInRange:unit:scheme:options:usingBlock:", 0, v14, 0, v11, 6, v21);
  unint64_t v18 = v24;
  id v19 = v15;

  return v19;
}

void __34__PLNLP_tokensFromString_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a3, a4);
  unint64_t v9 = *(void **)(a1 + 40);
  unint64_t v10 = [v8 lowercaseString];
  LODWORD(v9) = [v9 containsObject:v10];

  if (v9)
  {
    uint64_t v11 = PLBackendGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = *(NSObject **)(a1 + 32);
      int v23 = 138412546;
      id v24 = v12;
      __int16 v25 = 2112;
      BOOL v26 = v8;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Tokens from string %@: ignoring stop word %@", (uint8_t *)&v23, 0x16u);
    }
    goto LABEL_19;
  }
  if (*(unsigned char *)(a1 + 64))
  {
    unint64_t v13 = [v7 lowercaseString];
    uint64_t v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 138412546;
      id v24 = v8;
      __int16 v25 = 2112;
      BOOL v26 = v13;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEBUG, "Lemmatization: token %@ -> lemma %@", (uint8_t *)&v23, 0x16u);
    }

    if (v13)
    {
      id v15 = v13;

      id v8 = v15;
    }
  }
  if (v8)
  {
    id v16 = [*(id *)(a1 + 56) stringWithoutDiacriticsFromString:v8];
    uint64_t v11 = v16;
    if (*(unsigned char *)(a1 + 65))
    {
      id v17 = *(void **)(a1 + 40);
      unint64_t v18 = [v16 lowercaseString];
      LODWORD(v17) = [v17 containsObject:v18];

      if (v17)
      {
        id v19 = PLBackendGetLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = *(NSObject **)(a1 + 32);
          int v23 = 138412546;
          id v24 = v20;
          __int16 v25 = 2112;
          BOOL v26 = v8;
          _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Tokens from string %@: ignoring stop word %@", (uint8_t *)&v23, 0x16u);
        }

        goto LABEL_19;
      }
      uint64_t v21 = *(void **)(a1 + 48);
      id v22 = v11;
    }
    else
    {
      uint64_t v21 = *(void **)(a1 + 48);
      id v22 = v8;
    }
    [v21 addObject:v22];
LABEL_19:
  }
}

+ (id)lemmasForToken:(id)a3 locale:(id)a4 options:(int64_t)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [MEMORY[0x1E4F1CA20] currentLocale];
  }
  unint64_t v10 = v9;
  uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
  id v12 = [v10 localeIdentifier];
  uint64_t v13 = LXLemmatizerCreate();
  if (v13)
  {
    uint64_t v14 = (const void *)v13;
    id v15 = [v6 lowercaseString];
    if (v15)
    {
      id v16 = v11;
      LXLemmatizerEnumerateLemmasforString();
      id v17 = PLBackendGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        id v20 = v6;
        __int16 v21 = 2112;
        id v22 = v16;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "Token Lemmatization: token %@ -> lemma %@", buf, 0x16u);
      }
    }
    CFRelease(v14);
  }
  return v11;
}

void __39__PLNLP_lemmasForToken_locale_options___block_invoke(uint64_t a1, __CFString *theString1)
{
  if (CFStringCompare(theString1, *(CFStringRef *)(a1 + 40), 1uLL))
  {
    CFStringRef v4 = theString1;
    if (*(unsigned char *)(a1 + 56))
    {
      id v6 = (__CFString *)v4;
      uint64_t v5 = [*(id *)(a1 + 48) stringWithoutDiacriticsFromString:v4];

      CFStringRef v4 = (const __CFString *)v5;
    }
    id v7 = (__CFString *)v4;
    [*(id *)(a1 + 32) addObject:v4];
  }
}

@end