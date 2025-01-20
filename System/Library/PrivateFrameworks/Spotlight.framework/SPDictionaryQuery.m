@interface SPDictionaryQuery
+ (BOOL)isQuerySupported:(unint64_t)a3;
+ (unsigned)searchDomain;
+ (void)activate;
+ (void)deactivate;
+ (void)enableDictionary:(BOOL)a3;
+ (void)initialize;
- (BOOL)isDictionaryQuery;
- (void)start;
@end

@implementation SPDictionaryQuery

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    dispatch_queue_t v2 = dispatch_queue_create("SPDictionaryQuery.activation", 0);
    v3 = (void *)sActivationQueue;
    sActivationQueue = (uint64_t)v2;

    sQueryQueue = (uint64_t)dispatch_queue_create("SPDictionaryQuery.query", 0);
    MEMORY[0x270F9A758]();
  }
}

+ (unsigned)searchDomain
{
  return 6;
}

+ (void)enableDictionary:(BOOL)a3
{
  dictionaryEnabled = a3;
}

+ (BOOL)isQuerySupported:(unint64_t)a3
{
  return dictionaryEnabled;
}

+ (void)activate
{
}

void __29__SPDictionaryQuery_activate__block_invoke()
{
  uint64_t active = DCSCopyActiveDictionaries();
  os_unfair_lock_lock(&sDictionaryLock);
  v1 = (void *)sDictionaries;
  sDictionaries = active;

  os_unfair_lock_unlock(&sDictionaryLock);
}

+ (void)deactivate
{
}

void __31__SPDictionaryQuery_deactivate__block_invoke()
{
  os_unfair_lock_lock(&sDictionaryLock);
  v0 = (void *)sDictionaries;
  sDictionaries = 0;

  os_unfair_lock_unlock(&sDictionaryLock);
}

- (BOOL)isDictionaryQuery
{
  return 1;
}

- (void)start
{
  v17.receiver = self;
  v17.super_class = (Class)SPDictionaryQuery;
  [(SPKQuery *)&v17 start];
  if (![(SPKQuery *)self sendEmptyResponseIfNecessary])
  {
    v3 = [(SPKQuery *)self queryContext];
    v4 = [(SPKQuery *)self delegate];
    uint64_t v5 = [v4 queryIdent];
    v6 = [v4 clientBundleID];
    id v7 = objc_alloc(MEMORY[0x263F67A58]);
    v8 = [v3 searchString];
    v9 = objc_msgSend(v7, "initWithInput:triggerEvent:indexType:queryId:", v8, objc_msgSend(v3, "whyQuery"), 6, v5);

    v10 = [MEMORY[0x263F674B0] sharedProxy];
    [v10 sendFeedbackType:5 feedback:v9 queryId:v5 clientID:v6];

    v11 = sQueryQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__SPDictionaryQuery_start__block_invoke;
    block[3] = &unk_264C769F8;
    block[4] = self;
    id v15 = v9;
    id v16 = v6;
    id v12 = v6;
    id v13 = v9;
    dispatch_async(v11, block);
  }
}

void __26__SPDictionaryQuery_start__block_invoke(uint64_t a1)
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  if (kPlaceHolderInputName_block_invoke_definitionStringInitOnceToken != -1) {
    dispatch_once(&kPlaceHolderInputName_block_invoke_definitionStringInitOnceToken, &__block_literal_global_84);
  }
  dispatch_queue_t v2 = [*(id *)(a1 + 32) queryContext];
  v3 = [v2 getTrimmedSearchString];
  v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  unint64_t v6 = [v4 length];
  if (v6 > [(id)kPlaceHolderInputName_block_invoke_definitionString1 length]
    && [v4 hasPrefix:kPlaceHolderInputName_block_invoke_definitionString1]
    && (id v7 = &kPlaceHolderInputName_block_invoke_definitionString1,
        (objc_msgSend(v5, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", objc_msgSend((id)kPlaceHolderInputName_block_invoke_definitionString1, "length"))) & 1) != 0)|| v6 > objc_msgSend((id)kPlaceHolderInputName_block_invoke_definitionString2, "length")&& objc_msgSend(v4, "hasPrefix:", kPlaceHolderInputName_block_invoke_definitionString2)&& (id v7 = &kPlaceHolderInputName_block_invoke_definitionString2, objc_msgSend(v5, "characterIsMember:", objc_msgSend(v4, "characterAtIndex:", objc_msgSend((id)kPlaceHolderInputName_block_invoke_definitionString2, "length")))))
  {
    id v8 = (id)*v7;
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v4, "deleteCharactersInRange:", 0, objc_msgSend(v8, "length"));
      v10 = [v4 stringByTrimmingCharactersInSet:v5];
      uint64_t v11 = [v10 mutableCopy];

      char v62 = 0;
      v4 = (void *)v11;
      goto LABEL_13;
    }
  }
  else
  {
    v9 = 0;
  }
  char v62 = 1;
LABEL_13:
  os_unfair_lock_lock(&sDictionaryLock);
  if ([(id)sDictionaries count])
  {
    id v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    id v13 = (void *)DCSSearchFoundationCopyResultsWithOptions();
    os_unfair_lock_unlock(&sDictionaryLock);
    if ([v13 count])
    {
      v56 = v9;
      v57 = v5;
      v14 = objc_opt_new();
      v61 = objc_opt_new();
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      v55 = v13;
      id obj = v13;
      uint64_t v15 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
      uint64_t v60 = *MEMORY[0x263F78EB8];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v66;
        v58 = v14;
        uint64_t v59 = *(void *)v66;
        do
        {
          uint64_t v18 = 0;
          uint64_t v63 = v16;
          do
          {
            if (*(void *)v66 != v17) {
              objc_enumerationMutation(obj);
            }
            v19 = *(void **)(*((void *)&v65 + 1) + 8 * v18);
            v20 = objc_msgSend(v19, "footnote", v55);
            if (([v14 containsObject:v20] & 1) == 0)
            {
              [v14 addObject:v20];
              [v61 addObject:v19];
              v21 = [*(id *)(a1 + 32) queryContext];
              v22 = [v21 searchString];
              [v19 setUserInput:v22];

              v23 = [*(id *)(a1 + 32) queryContext];
              objc_msgSend(v19, "setQueryId:", objc_msgSend(v23, "queryIdent"));

              if ((v62 & 1) == 0) {
                [v19 setTopHit:SSSetTopHitWithReasonString()];
              }
              [v19 setType:8];
              [v19 setResultBundleId:v60];
              v24 = [v19 title];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();

              v26 = [v19 title];
              v27 = v26;
              if (isKindOfClass)
              {
                v28 = [v26 formattedTextPieces];
                if (v28)
                {
                  v29 = [v27 formattedTextPieces];
                  [v29 firstObject];
                  uint64_t v30 = a1;
                  v32 = v31 = v4;
                  v33 = [v32 text];

                  v4 = v31;
                  a1 = v30;
                  v14 = v58;
                }
                else
                {
                  v33 = [v27 text];
                }
              }
              else
              {
                v33 = [v26 text];
              }

              [v19 setCompletion:v33];
              v34 = objc_opt_new();
              [v34 setSymbolName:@"book.closed.fill"];
              [v34 setIsTemplate:1];
              v35 = [v19 card];
              [v35 setTitleImage:v34];

              v36 = [v19 card];
              [v36 setTitle:v4];

              uint64_t v16 = v63;
              uint64_t v17 = v59;
            }

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
        }
        while (v16);
      }

      v37 = objc_opt_new();
      [v37 setMaxInitiallyVisibleResults:1];
      [v37 setBundleIdentifier:v60];
      v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v39 = [v38 localizedStringForKey:@"DOMAIN_DICTIONARY" value:&stru_26E92AFF0 table:@"Search"];
      [v37 setTitle:v39];

      [v37 setResults:v61];
      id v40 = objc_alloc(MEMORY[0x263F78D80]);
      uint64_t v41 = [*(id *)(a1 + 32) queryGroupId];
      v69 = v37;
      v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v69 count:1];
      v43 = (void *)[v40 initWithQueryID:v41 sections:v42];

      v44 = [*(id *)(a1 + 32) responseHandler];
      ((void (**)(void, void *))v44)[2](v44, v43);

      v45 = [MEMORY[0x263F674B0] sharedProxy];
      v46 = (void *)[objc_alloc(MEMORY[0x263F67888]) initWithStartSearch:*(void *)(a1 + 40)];
      objc_msgSend(v45, "sendFeedbackType:feedback:queryId:clientID:", 6, v46, objc_msgSend(*(id *)(a1 + 40), "queryId"), *(void *)(a1 + 48));

      v9 = v56;
      uint64_t v5 = v57;
      id v13 = v55;
    }
    else
    {
      id v51 = objc_alloc(MEMORY[0x263F78D80]);
      uint64_t v52 = [*(id *)(a1 + 32) queryGroupId];
      v53 = (void *)[v51 initWithQueryID:v52 sections:MEMORY[0x263EFFA68]];
      v54 = [*(id *)(a1 + 32) responseHandler];
      ((void (**)(void, void *))v54)[2](v54, v53);
    }
  }
  else
  {
    os_unfair_lock_unlock(&sDictionaryLock);
    id v47 = objc_alloc(MEMORY[0x263F78D80]);
    uint64_t v48 = [*(id *)(a1 + 32) queryGroupId];
    v49 = (void *)[v47 initWithQueryID:v48 sections:MEMORY[0x263EFFA68]];
    v50 = [*(id *)(a1 + 32) responseHandler];
    ((void (**)(void, void *))v50)[2](v50, v49);
  }
}

void __26__SPDictionaryQuery_start__block_invoke_2()
{
  id v4 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.Search.framework"];
  uint64_t v0 = [v4 localizedStringForKey:@"DICTIONARY_DEFINITION_TRIGGER_1" value:&stru_26E92AFF0 table:@"Search"];
  v1 = (void *)kPlaceHolderInputName_block_invoke_definitionString1;
  kPlaceHolderInputName_block_invoke_definitionString1 = v0;

  uint64_t v2 = [v4 localizedStringForKey:@"DICTIONARY_DEFINITION_TRIGGER_2" value:&stru_26E92AFF0 table:@"Search"];
  v3 = (void *)kPlaceHolderInputName_block_invoke_definitionString2;
  kPlaceHolderInputName_block_invoke_definitionString2 = v2;
}

@end