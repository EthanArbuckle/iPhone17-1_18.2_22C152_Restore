void sub_1B3DEA5C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

id logForSPLogCategoryDefault()
{
  if (logForSPLogCategoryDefault_onceDefaultToken != -1) {
    dispatch_once(&logForSPLogCategoryDefault_onceDefaultToken, &__block_literal_global);
  }
  v0 = (void *)logForSPLogCategoryDefault_sDefaultLog;
  return v0;
}

uint64_t __logForSPLogCategoryDefault_block_invoke()
{
  logForSPLogCategoryDefault_sDefaultLog = (uint64_t)os_log_create("com.apple.spotlight", "default");
  return MEMORY[0x1F41817F8]();
}

id logForSPLogCategoryCaching()
{
  if (logForSPLogCategoryCaching_onceCachingToken != -1) {
    dispatch_once(&logForSPLogCategoryCaching_onceCachingToken, &__block_literal_global_4);
  }
  v0 = (void *)logForSPLogCategoryCaching_sCachingLog;
  return v0;
}

uint64_t __logForSPLogCategoryCaching_block_invoke()
{
  logForSPLogCategoryCaching_sCachingLog = (uint64_t)os_log_create("com.apple.spotlight", "caching");
  return MEMORY[0x1F41817F8]();
}

id logForSPLogCategoryRecents()
{
  if (logForSPLogCategoryRecents_onceRecentToken != -1) {
    dispatch_once(&logForSPLogCategoryRecents_onceRecentToken, &__block_literal_global_7);
  }
  v0 = (void *)logForSPLogCategoryRecents_sRecentsLog;
  return v0;
}

uint64_t __logForSPLogCategoryRecents_block_invoke()
{
  logForSPLogCategoryRecents_sRecentsLog = (uint64_t)os_log_create("com.apple.spotlight", "recents");
  return MEMORY[0x1F41817F8]();
}

uint64_t resultIsSuggestionType(unsigned int a1)
{
  return (a1 < 0x27) & (0x7FF0038000uLL >> a1);
}

uint64_t resultIsLocalType(unsigned int a1)
{
  return (a1 < 0x27) & (0x7F8001000CuLL >> a1);
}

__CFString *truncatedTitle(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    if ((unint64_t)[v1 length] > 0x7F)
    {
      uint64_t v8 = 0;
      v9 = &v8;
      uint64_t v10 = 0x2020000000;
      uint64_t v11 = 0;
      uint64_t v4 = [v2 length];
      uint64_t v5 = *MEMORY[0x1E4F28540];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __truncatedTitle_block_invoke;
      v7[3] = &unk_1E6082098;
      v7[4] = &v8;
      objc_msgSend(v2, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v4, v5, 6, 0, v7);
      objc_msgSend(v2, "substringWithRange:", 0, v9[3]);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      _Block_object_dispose(&v8, 8);
    }
    else
    {
      v3 = v2;
    }
  }
  else
  {
    v3 = &stru_1F0CB2300;
  }

  return v3;
}

void sub_1B3DEAC34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __truncatedTitle_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  if ((unint64_t)(a3 + a4) < 0x80) {
    *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a3 + a4;
  }
  else {
    *a7 = 1;
  }
  return result;
}

__CFString *truncatedSearchString(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    if ((unint64_t)[v1 length] > 0x3F)
    {
      v3 = [v2 substringToIndex:64];
    }
    else
    {
      v3 = v2;
    }
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v4 = &stru_1F0CB2300;
  }

  return v4;
}

id topicIdentifierWithIdentifierAndDetail(void *a1, void *a2, void *a3, void *a4, uint64_t a5, unsigned int a6)
{
  id v10 = a1;
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v12 isEqual:*MEMORY[0x1E4F28340]])
  {
    v15 = @"1";
  }
  else if ([v12 isEqual:*MEMORY[0x1E4F28348]])
  {
    v15 = @"2";
  }
  else if ([v12 isEqual:*MEMORY[0x1E4F28358]])
  {
    v15 = @"3";
  }
  else if ([v12 isEqual:@"Priority"])
  {
    v15 = @"4";
  }
  else if ([v12 isEqual:@"Default"])
  {
    v15 = @"5";
  }
  else
  {
    v15 = @"0";
  }
  if (v10)
  {
    v16 = [NSString stringWithFormat:@"id%@%@", @":=:", v10];
    [v14 addObject:v16];
  }
  if (v11)
  {
    v17 = [NSString stringWithFormat:@"bId%@%@", @":=:", v11];
    [v14 addObject:v17];
  }
  if (v12)
  {
    v18 = [NSString stringWithFormat:@"pC%@%@", @":=:", v15];
    [v14 addObject:v18];
  }
  if (v13)
  {
    v19 = [NSString stringWithFormat:@"dt%@%@", @":=:", v13];
    [v14 addObject:v19];
  }
  v20 = [NSString stringWithFormat:@"tp%@%d", @":=:", a5];
  [v14 addObject:v20];

  v21 = [NSString stringWithFormat:@"isR%@%d", @":=:", a6];
  [v14 addObject:v21];

  if ([v14 count])
  {
    v22 = [v14 componentsJoinedByString:@"=;"];;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

id topicIdentifierWithPersonQueryIdentifierAndDetail(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a2;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v10 = 0x1E4F29000;
  if (v7)
  {
    unsigned int v29 = a4;
    uint64_t v30 = a3;
    id v31 = v8;
    v28 = v7;
    id v11 = attributesWithEntityIdentifier(v7);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v33 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          v17 = NSString;
          v18 = [v11 objectForKeyedSubscript:v16];
          v19 = [v17 stringWithFormat:@"%@%@%@", v16, @"=", v18];
          [v9 addObject:v19];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v13);
    }
    v20 = [v9 sortedArrayUsingSelector:sel_compare_];
    v21 = [v20 componentsJoinedByString:@"\t"];

    [v9 removeAllObjects];
    unint64_t v10 = 0x1E4F29000uLL;
    v22 = [NSString stringWithFormat:@"pQId%@%@", @":=:", v21];
    [v9 addObject:v22];

    a3 = v30;
    id v8 = v31;
    a4 = v29;
  }
  if (v8)
  {
    v23 = [*(id *)(v10 + 24) stringWithFormat:@"dt%@%@", @":=:", v8];
    [v9 addObject:v23];
  }
  v24 = [*(id *)(v10 + 24) stringWithFormat:@"isR%@%d", @":=:", a4];
  [v9 addObject:v24];

  v25 = [*(id *)(v10 + 24) stringWithFormat:@"tp%@%d", @":=:", a3];
  [v9 addObject:v25];

  if ([v9 count])
  {
    v26 = [v9 componentsJoinedByString:@"=;"];;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

id attributesWithEntityIdentifier(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(v1, "componentsSeparatedByString:", @"\t", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v8 length])
        {
          id v9 = [v8 componentsSeparatedByString:@"="];
          unint64_t v10 = [v9 firstObject];
          id v11 = [v9 lastObject];
          [v2 setObject:v11 forKey:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

id topicIdentifierWithContactIdentifierAndDetail(void *a1, void *a2, void *a3, uint64_t a4, unsigned int a5)
{
  id v9 = a1;
  unint64_t v10 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v11 = a3;
  id v12 = a2;
  id v13 = objc_alloc_init(v10);
  long long v14 = [NSString stringWithFormat:@"contactIdentifier%@%@", @"=", v12];

  [v13 addObject:v14];
  if ([v9 length])
  {
    long long v15 = [NSString stringWithFormat:@"displayName%@%@", @"=", v9];
    [v13 addObject:v15];

    long long v16 = [NSString stringWithFormat:@"name%@%@", @"=", v9];
    [v13 addObject:v16];
  }
  v17 = [v13 sortedArrayUsingSelector:sel_compare_];
  uint64_t v18 = [v17 componentsJoinedByString:@"\t"];

  v19 = topicIdentifierWithPersonQueryIdentifierAndDetail(v18, v11, a4, a5);

  return v19;
}

id topicIdentifierWithContactInfoAndDetail(void *a1, void *a2, void *a3, void *a4, unsigned int a5, unsigned int a6)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v37 = a4;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v13 = NSString;
  long long v14 = [MEMORY[0x1E4F29128] UUID];
  long long v15 = [v14 description];
  long long v16 = [v13 stringWithFormat:@"personIdentifier%@%@", @"=", v15];
  [v12 addObject:v16];

  if ([v9 length])
  {
    v17 = [NSString stringWithFormat:@"displayName%@%@", @"=", v9];
    [v12 addObject:v17];

    uint64_t v18 = [NSString stringWithFormat:@"name%@%@", @"=", v9];
    [v12 addObject:v18];
  }
  id v40 = v11;
  id v41 = v10;
  if ([v10 count])
  {
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v19 = v10;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v47 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if ([v24 length])
          {
            v25 = [NSString stringWithFormat:@"email%@%@", @"=", v24];
            [v12 addObject:v25];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v21);
    }

    id v11 = v40;
    id v10 = v41;
  }
  if ([v11 count])
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v26 = v11;
    uint64_t v27 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v28; ++j)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          if ([v31 length])
          {
            long long v32 = [NSString stringWithFormat:@"phone%@%@", @"=", v31];
            [v12 addObject:v32];
          }
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v42 objects:v50 count:16];
      }
      while (v28);
    }

    id v11 = v40;
    id v10 = v41;
  }
  long long v33 = [v12 sortedArrayUsingSelector:sel_compare_];
  long long v34 = [v33 componentsJoinedByString:@"\t"];

  long long v35 = topicIdentifierWithPersonQueryIdentifierAndDetail(v34, v37, a5, a6);

  return v35;
}

id topicIdentifierWithTitleAndType(void *a1, uint64_t a2, unsigned int a3)
{
  id v5 = a1;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5)
  {
    id v7 = [NSString stringWithFormat:@"ti%@%@", @":=:", v5];
    [v6 addObject:v7];
  }
  id v8 = [NSString stringWithFormat:@"tp%@%d", @":=:", a2];
  [v6 addObject:v8];

  id v9 = [NSString stringWithFormat:@"isR%@%d", @":=:", a3];
  [v6 addObject:v9];

  if ([v6 count])
  {
    id v10 = [v6 componentsJoinedByString:@"=;"];;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

id attributesForTopicIdentifier(void *a1, unsigned char *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v5 = attributesWithTopicIdentifier(v3);
  id v6 = v5;
  if (a2)
  {
    id v7 = [v5 objectForKeyedSubscript:@"isR"];
    if (v7)
    {
      id v8 = [v6 objectForKeyedSubscript:@"isR"];
      char v9 = [v8 BOOLValue];
    }
    else
    {
      char v9 = 0;
    }

    *a2 = v9;
  }
  id v10 = [v6 objectForKeyedSubscript:@"pQId"];
  id v11 = attributesWithEntityIdentifier(v10);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = [v11 objectForKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        [v4 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }
  v17 = [v4 allObjects];

  return v17;
}

id attributesWithTopicIdentifier(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = objc_msgSend(v1, "componentsSeparatedByString:", @"=;", 0);;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v8 length])
        {
          char v9 = [v8 componentsSeparatedByString:@":=:"];
          id v10 = [v9 firstObject];
          id v11 = [v9 lastObject];
          [v2 setObject:v11 forKey:v10];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

uint64_t topicIsCoreSuggestion(void *a1)
{
  id v1 = [a1 identifier];
  id v2 = attributesWithTopicIdentifier(v1);

  id v3 = [v2 objectForKeyedSubscript:@"bId"];
  uint64_t v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 isEqualToString:@"com.apple.CoreSuggestions"];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

id searchResultWithTopicIdentifier(void *a1, double a2)
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v3 = attributesWithTopicIdentifier(a1);
  uint64_t v4 = v3;
  if (!v3 || ![v3 count])
  {
    id v15 = 0;
    goto LABEL_47;
  }
  id v5 = v4;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"tp"];
  if (!v6)
  {

    id v10 = [v5 objectForKeyedSubscript:@"dt"];
    uint64_t v9 = 0;
    goto LABEL_11;
  }
  id v7 = (void *)v6;
  id v8 = [v5 objectForKeyedSubscript:@"tp"];
  uint64_t v9 = [v8 intValue];

  id v10 = [v5 objectForKeyedSubscript:@"dt"];
  if ((int)v9 <= 31)
  {
    if ((v9 - 2) < 3 || v9 == 20)
    {
      id v11 = [v5 objectForKeyedSubscript:@"id"];
      uint64_t v12 = [v5 objectForKeyedSubscript:@"bId"];
      long long v13 = [v5 objectForKeyedSubscript:@"pC"];
      if ([v13 isEqualToString:@"1"])
      {
        long long v14 = (id *)MEMORY[0x1E4F28340];
      }
      else if ([v13 isEqualToString:@"2"])
      {
        long long v14 = (id *)MEMORY[0x1E4F28348];
      }
      else if ([v13 isEqualToString:@"3"])
      {
        long long v14 = (id *)MEMORY[0x1E4F28358];
      }
      else
      {
        if ([v13 isEqualToString:@"4"])
        {
          v36 = @"Priority";
          goto LABEL_41;
        }
        if ([v13 isEqualToString:@"5"])
        {
          v36 = @"Default";
          goto LABEL_41;
        }
        long long v14 = (id *)MEMORY[0x1E4F28378];
      }
      v36 = (__CFString *)*v14;
LABEL_41:

      id v18 = 0;
      if (v11 && v12 && v36)
      {
        id v37 = (objc_class *)MEMORY[0x1E4F9A3C0];
        id v44 = v11;
        id v38 = v12;
        v39 = v11;
        id v40 = v36;
        id v46 = v10;
        id v18 = objc_alloc_init(v37);
        id v41 = [NSString stringWithFormat:@"%@:%@", v40, v38];

        id v11 = v39;
        [v18 setResultBundleId:v41];

        [v18 setSectionBundleIdentifier:@"com.apple.searchd.recent.results"];
        [v18 setIdentifier:v44];

        [v18 setType:v9];
        [v18 setRankingScore:a2];
        [v18 setSecondaryTitle:v46];
      }
      goto LABEL_46;
    }
    goto LABEL_11;
  }
  if ((v9 - 37) < 2)
  {
    id v20 = [v5 objectForKeyedSubscript:@"pQId"];
    if (v20)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F9A3C0]);
      long long v32 = valueForKeyWithEntityQueryIdentifier(@"displayName", v20);
      if (!v32)
      {
        long long v32 = valueForKeyWithEntityQueryIdentifier(@"name", v20);
      }
      long long v33 = valueForKeyWithEntityQueryIdentifier(@"personIdentifier", v20);
      long long v34 = [MEMORY[0x1E4F9A4C0] textWithString:v32];
      [v18 setTitle:v34];
      [v18 setCompletion:v32];
      [v18 setIdentifier:v33];
      [v18 setContactIdentifier:v20];
      [v18 setResultBundleId:@"com.apple.searchd.suggestion"];
      [v18 setSectionBundleIdentifier:@"com.apple.searchd.recent.suggestions"];
      [v18 setRankingScore:a2];
      [v18 setType:38];

      goto LABEL_27;
    }
LABEL_30:
    id v18 = 0;
    goto LABEL_31;
  }
  if (v9 == 32)
  {
    long long v35 = [v5 objectForKeyedSubscript:@"pQId"];
    id v20 = v35;
    if (v35)
    {
      suggestionResultWithContactEntityIdentifier(v35, a2);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  if (v9 != 36)
  {
LABEL_11:
    id v16 = [v5 objectForKeyedSubscript:@"ti"];
    id v17 = v10;
    id v18 = objc_alloc_init(MEMORY[0x1E4F9A3C0]);
    long long v45 = [MEMORY[0x1E4F9A4C0] textWithString:v16];
    objc_msgSend(v18, "setTitle:");
    [v18 setCompletion:v16];
    [v18 setResultBundleId:@"com.apple.searchd.suggestion"];
    [v18 setSectionBundleIdentifier:@"com.apple.searchd.recent.suggestions"];
    [v18 setRankingScore:a2];
    [v18 setType:v9];
    uint64_t v19 = [v18 resultBundleId];
    id v20 = v16;
    id v10 = v17;
    long long v21 = objc_opt_new();
    [v21 setSymbolName:@"magnifyingglass"];
    [v21 setIsTemplate:1];
    long long v22 = objc_opt_new();
    long long v43 = (void *)v19;
    [v22 setBundleIdentifier:v19];
    v23 = objc_opt_new();
    [v23 setThumbnail:v21];
    [v23 setShouldUseCompactDisplay:1];
    uint64_t v24 = [MEMORY[0x1E4F9A378] textWithString:v20];
    [v23 setTitle:v24];

    v25 = [v23 title];
    [v25 setMaxLines:1];

    if (v10 && [v10 length])
    {
      id v26 = [MEMORY[0x1E4F9A378] textWithString:v10];
      v48[0] = v26;
      uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:1];
      [v23 setDescriptions:v27];
    }
    uint64_t v28 = objc_opt_new();
    [v28 setSearchString:v20];
    [v28 setQuerySource:1];
    [v23 setCommand:v28];
    uint64_t v29 = objc_opt_new();
    long long v47 = v23;
    uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
    [v29 setCardSections:v30];

    [v18 setInlineCard:v29];
    goto LABEL_31;
  }
  id v20 = [v5 objectForKeyedSubscript:@"bId"];
  if ([v20 isEqualToString:@"com.apple.CoreSuggestions"]) {
    goto LABEL_30;
  }
  id v31 = [v5 objectForKeyedSubscript:@"pQId"];
  long long v32 = v31;
  if (v31)
  {
    suggestionResultWithContactEntityIdentifier(v31, a2);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = 0;
  }
LABEL_27:

LABEL_31:
LABEL_46:
  id v15 = v18;

LABEL_47:
  return v15;
}

id suggestionResultWithContactEntityIdentifier(void *a1, double a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F9A3C0];
  id v4 = a1;
  id v5 = objc_alloc_init(v3);
  uint64_t v6 = valueForKeyWithEntityQueryIdentifier(@"displayName", v4);
  id v7 = valueForKeyWithEntityQueryIdentifier(@"contactIdentifier", v4);

  id v8 = [MEMORY[0x1E4F9A4C0] textWithString:v6];
  [v5 setTitle:v8];
  [v5 setCompletion:v6];
  [v5 setIdentifier:v7];
  [v5 setContactIdentifier:v7];
  [v5 setResultBundleId:@"com.apple.searchd.suggestion"];
  [v5 setSectionBundleIdentifier:@"com.apple.searchd.recent.suggestions"];
  [v5 setRankingScore:a2];
  [v5 setType:32];

  return v5;
}

id valueForKeyWithEntityQueryIdentifier(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = attributesWithEntityIdentifier(a2);
  id v5 = [v4 objectForKeyedSubscript:v3];

  return v5;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1B3DEF33C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a64, 8);
  _Block_object_dispose(&a70, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}