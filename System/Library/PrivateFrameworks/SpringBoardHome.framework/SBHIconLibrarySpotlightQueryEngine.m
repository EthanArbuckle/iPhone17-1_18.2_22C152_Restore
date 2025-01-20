@interface SBHIconLibrarySpotlightQueryEngine
- (BOOL)_processingQueue_isBundleIdentifierValid:(id)a3 iconLibraryQueryContext:(id)a4;
- (id)_processingQueue_sortComperatorForQueryContext:(id)a3;
- (id)_relevancyQueryForLibraryQuery:(id)a3;
- (id)_searchQueryForIconLibraryQuery:(id)a3;
- (void)_processingQueue_markBundleIdentifiers:(id)a3 iconLibraryQueryContext:(id)a4;
- (void)_processingQueue_noteQueryResultsWereUpdated:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5;
- (void)_processingQueue_teardownQueryContext:(id)a3;
- (void)_processingQueue_unmarkBundleIdentifiers:(id)a3 iconLibraryQueryContext:(id)a4;
- (void)_processingQueue_updateQueryRelevancyScores:(id)a3 iconLibraryQueryContext:(id)a4;
- (void)_teardownCSSearchQuery:(id)a3;
- (void)dealloc;
- (void)executeQuery:(id)a3;
@end

@implementation SBHIconLibrarySpotlightQueryEngine

- (void)dealloc
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  p_currentlyRunningQueryContext = &self->_currentlyRunningQueryContext;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentlyRunningQueryContext);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_currentlyRunningQueryContext);
    v6 = objc_opt_new();
    v7 = [v5 objectForKeyedSubscript:@"kRunningQueryKey"];
    objc_msgSend(v6, "bs_safeAddObject:", v7);
    v8 = [v5 objectForKeyedSubscript:@"kRelevancyQueryKey"];
    objc_msgSend(v6, "bs_safeAddObject:", v8);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          [(SBHIconLibrarySpotlightQueryEngine *)self _teardownCSSearchQuery:*(void *)(*((void *)&v15 + 1) + 8 * v13++)];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)SBHIconLibrarySpotlightQueryEngine;
  [(SBHIconLibraryAbstractQueryEngine *)&v14 dealloc];
}

- (id)_searchQueryForIconLibraryQuery:(id)a3
{
  v28[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 searchString];
  uint64_t v5 = [v4 length];
  if (v5)
  {
    [v3 searchString];
    StringByAddingBackslashEscapes = (void *)__MDQueryCreateStringByAddingBackslashEscapes();
  }
  else
  {
    StringByAddingBackslashEscapes = 0;
  }
  v7 = [v3 keyboardLanguageHint];
  uint64_t v8 = *MEMORY[0x1E4F22A78];
  v28[0] = *MEMORY[0x1E4F22CE8];
  v28[1] = v8;
  v28[2] = *MEMORY[0x1E4F230C8];
  v28[3] = @"kMDItemDisplayNameCorrections";
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:4];
  if (v5)
  {
    if (([v7 hasPrefix:@"zh"] & 1) != 0
      || ([v7 hasPrefix:@"ja"] & 1) != 0
      || [v7 hasSuffix:@"CN"])
    {
      uint64_t v10 = [@"cdwt" stringByAppendingString:@"s"];
    }
    else
    {
      uint64_t v10 = @"cdwt";
    }
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __70__SBHIconLibrarySpotlightQueryEngine__searchQueryForIconLibraryQuery___block_invoke;
    v24 = &unk_1E6AB56B8;
    id v25 = StringByAddingBackslashEscapes;
    v26 = v10;
    uint64_t v11 = v10;
    uint64_t v12 = objc_msgSend(v9, "bs_map:", &v21);
    objc_msgSend(v12, "componentsJoinedByString:", @" || ", v21, v22, v23, v24);
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = @"(*==*)";
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F23830]);
  [v14 setLive:1];
  long long v15 = [v3 keyboardLanguageHint];
  [v14 setKeyboardLanguage:v15];

  long long v16 = [v3 markedTextArray];

  if (v16)
  {
    long long v17 = [v3 markedTextArray];
    [v14 setMarkedTextArray:v17];
  }
  long long v18 = (void *)[objc_alloc(MEMORY[0x1E4F23828]) initWithQueryString:v13 queryContext:v14];
  uint64_t v27 = *MEMORY[0x1E4F28358];
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  [v18 setProtectionClasses:v19];

  [v18 setBundleIDs:&unk_1F300F228];
  return v18;
}

uint64_t __70__SBHIconLibrarySpotlightQueryEngine__searchQueryForIconLibraryQuery___block_invoke(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"%@=\"%@*\"%@", a2, *(void *)(a1 + 32), *(void *)(a1 + 40)];
}

- (id)_relevancyQueryForLibraryQuery:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 searchString];
  if ([v4 length]
    && ([v3 keyboardLanguageHint], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    v16[0] = *MEMORY[0x1E4F23778];
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:1];
    id v7 = objc_alloc_init(MEMORY[0x1E4F23830]);
    [v7 setMaxCount:25];
    [v7 setFetchAttributes:v6];
    uint64_t v8 = [v3 keyboardLanguageHint];
    [v7 setKeyboardLanguage:v8];

    id v9 = [v3 markedTextArray];

    if (v9)
    {
      uint64_t v10 = [v3 markedTextArray];
      [v7 setMarkedTextArray:v10];
    }
    uint64_t v11 = [NSString stringWithFormat:@"(*=\"%@*\"cdwt)", v4];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F23888]) initWithQueryString:v11 queryContext:v7];
    uint64_t v15 = *MEMORY[0x1E4F28358];
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [v12 setProtectionClasses:v13];

    [v12 setBundleIDs:&unk_1F300F240];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (void)executeQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBHIconLibraryAbstractQueryEngine *)self iconModel];
  v6 = [(SBHIconLibraryAbstractQueryEngine *)self processingQueue];
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke;
  block[3] = &unk_1E6AAE0A0;
  objc_copyWeak(&v14, &location);
  id v11 = v4;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke(id *a1)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  v2 = a1 + 7;
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 7);
  id v4 = WeakRetained;
  if (WeakRetained
    && (objc_msgSend(WeakRetained, "_processingQueue_isIconModelReloading") & 1) == 0
    && (objc_msgSend(v4, "_processingQueue_isShutdown") & 1) == 0)
  {
    id v5 = objc_loadWeakRetained(v4 + 8);
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v4, "_processingQueue_teardownQueryContext:", v5);
    }
    id v7 = [[SBHIconLibraryQueryContext alloc] initWithQuery:a1[4]];
    objc_storeWeak(v4 + 8, v7);
    objc_msgSend(v4, "_processingQueue_startNewQueryContext:", v7);
    id v8 = [a1[4] searchString];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      uint64_t v10 = [v4 _searchQueryForIconLibraryQuery:a1[4]];
      [(SBHIconLibraryQueryContext *)v7 setObject:v10 forKeyedSubscript:@"kRunningQueryKey"];
      id v11 = [v4 _relevancyQueryForLibraryQuery:a1[4]];
      [(SBHIconLibraryQueryContext *)v7 setObject:v11 forKeyedSubscript:@"kRelevancyQueryKey"];
      id v12 = SBLogLibrarySearchController();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = a1[4];
        *(_DWORD *)buf = 138412290;
        id v55 = v13;
        _os_log_impl(&dword_1D7F0A000, v12, OS_LOG_TYPE_DEFAULT, "Starting new Library Search Query '%@'", buf, 0xCu);
      }

      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_52;
      v44[3] = &unk_1E6AB5700;
      objc_copyWeak(&v48, v2);
      id v45 = a1[6];
      id v46 = a1[4];
      uint64_t v15 = v7;
      v47 = v15;
      [v10 setFoundItemsHandler:v44];
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_57;
      v39[3] = &unk_1E6AB5728;
      objc_copyWeak(&v43, v2);
      id v40 = a1[6];
      id v41 = a1[4];
      long long v16 = v15;
      v42 = v16;
      [v10 setRemovedItemsHandler:v39];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_60;
      v34[3] = &unk_1E6AB5778;
      id v35 = a1[6];
      objc_copyWeak(&v38, v2);
      long long v17 = v16;
      v36 = v17;
      id v37 = a1[4];
      [v10 setCompletionHandler:v34];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_64;
      v29[3] = &unk_1E6AB57A0;
      id v30 = a1[4];
      v33[1] = *(id *)&Current;
      id v18 = v10;
      id v31 = v18;
      id v32 = a1[6];
      objc_copyWeak(v33, v2);
      [v18 setGatherEndedHandler:v29];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_66;
      v25[3] = &unk_1E6AB57F0;
      id v26 = a1[6];
      objc_copyWeak(&v28, v2);
      v19 = v17;
      uint64_t v27 = v19;
      [v11 setFoundItemsHandler:v25];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_4_71;
      v20[3] = &unk_1E6AB5818;
      id v21 = a1[4];
      v24[1] = *(id *)&Current;
      id v22 = a1[6];
      objc_copyWeak(v24, v2);
      v23 = v19;
      [v11 setCompletionHandler:v20];
      [v11 start];
      [v18 start];

      objc_destroyWeak(v24);
      objc_destroyWeak(&v28);

      objc_destroyWeak(v33);
      objc_destroyWeak(&v38);

      objc_destroyWeak(&v43);
      objc_destroyWeak(&v48);
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2;
      block[3] = &unk_1E6AADD48;
      id v50 = a1[5];
      id v51 = a1[6];
      v52 = v7;
      v53 = v4;
      dispatch_async(MEMORY[0x1E4F14428], block);

      id v18 = v50;
    }
  }
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) leafIconsUniquedByApplicationBundleIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_3;
  v12[3] = &unk_1E6AAE078;
  id v13 = *(id *)(a1 + 32);
  id v3 = objc_msgSend(v2, "bs_filter:", v12);

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_4;
  v8[3] = &unk_1E6AACDE0;
  id v4 = *(NSObject **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v3;
  id v7 = v3;
  dispatch_async(v4, v8);
}

uint64_t __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isIconVisible:v3]) {
    uint64_t IsLeafIconAndNotWidgetIcon = _SBIconIsLeafIconAndNotWidgetIcon(v3);
  }
  else {
    uint64_t IsLeafIconAndNotWidgetIcon = 0;
  }

  return IsLeafIconAndNotWidgetIcon;
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_4(void *a1)
{
  v2 = (void *)a1[4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 64));
  LODWORD(v2) = [v2 isEqual:WeakRetained];

  if (v2)
  {
    id v4 = (void *)a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[4];
    objc_msgSend(v4, "_processingQueue_addIcons:iconLibraryQueryContext:notifyDelegate:", v5, v6, 1);
  }
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_52(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v5 = objc_msgSend(v3, "bs_mapNoNulls:", &__block_literal_global_80);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_3_55;
    v8[3] = &unk_1E6AADD48;
    uint64_t v6 = *(NSObject **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v10 = v5;
    id v11 = WeakRetained;
    id v12 = *(id *)(a1 + 48);
    id v7 = v5;
    dispatch_async(v6, v8);
  }
}

id __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_53(uint64_t a1, void *a2)
{
  v2 = [a2 attributeSet];
  id v3 = [v2 uniqueIdentifier];

  return v3;
}

uint64_t __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_3_55(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = SBLogLibrarySearchController();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1D7F0A000, v2, OS_LOG_TYPE_DEFAULT, "Library Search Query '%@' adding bundle identifiers: '%@'", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "_processingQueue_markBundleIdentifiers:iconLibraryQueryContext:", *(void *)(a1 + 40), *(void *)(a1 + 56));
  return [*(id *)(a1 + 48) _addItemsWithBundleIdentifiers:*(void *)(a1 + 40) iconLibraryQueryContext:*(void *)(a1 + 56) notifyDelegate:1];
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_57(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_58;
    v7[3] = &unk_1E6AADD48;
    int v6 = *(NSObject **)(a1 + 32);
    id v8 = *(id *)(a1 + 40);
    id v9 = v4;
    id v10 = WeakRetained;
    id v11 = *(id *)(a1 + 48);
    dispatch_async(v6, v7);
  }
}

uint64_t __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_58(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = SBLogLibrarySearchController();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl(&dword_1D7F0A000, v2, OS_LOG_TYPE_DEFAULT, "Library Search Query '%@' removing bundle identifiers: '%@'", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 48), "_processingQueue_unmarkBundleIdentifiers:iconLibraryQueryContext:", *(void *)(a1 + 40), *(void *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 48), "_processingQueue_removeItemsWithBundleIdentifiers:iconLibraryQueryContext:notifyDelegate:", *(void *)(a1 + 40), *(void *)(a1 + 56), 1);
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_60(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_61;
  v6[3] = &unk_1E6AB5750;
  id v7 = v3;
  id v5 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  dispatch_async(v4, v6);

  objc_destroyWeak(&v10);
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_61(uint64_t a1)
{
  v2 = SBLogLibrarySearchController();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_61_cold_1(a1, v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = objc_msgSend(WeakRetained, "_processingQueue_lastQueryResultForContext:", *(void *)(a1 + 40));
    int v6 = (void *)v5;
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7 || !v5)
    {
      if (v7)
      {
        objc_msgSend(v4, "_processingQueue_observerDispatchError:forQuery:", v7, *(void *)(a1 + 48));
      }
      else
      {
        id v8 = +[SBHIconLibraryQueryResult nullQueryResults];
        objc_msgSend(v4, "_processingQueue_observerDispatchQueryResultsWereUpdated:", v8);
      }
    }
  }
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_64(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = SBLogLibrarySearchController();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    CFAbsoluteTime v4 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
    *(_DWORD *)buf = 138412546;
    uint64_t v10 = v3;
    __int16 v11 = 2048;
    CFAbsoluteTime v12 = v4;
    _os_log_impl(&dword_1D7F0A000, v2, OS_LOG_TYPE_DEFAULT, "Library Search Query '%@' execution time: %f", buf, 0x16u);
  }

  if (![*(id *)(a1 + 40) foundItemCount])
  {
    uint64_t v5 = *(NSObject **)(a1 + 48);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_65;
    v6[3] = &unk_1E6AB0610;
    objc_copyWeak(&v8, (id *)(a1 + 56));
    id v7 = *(id *)(a1 + 32);
    dispatch_async(v5, v6);

    objc_destroyWeak(&v8);
  }
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_65(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = SBLogLibrarySearchController();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_DEFAULT, "Library Search Query '%@' ended with no found items", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = +[SBHIconLibraryQueryResult nullQueryResults];
    objc_msgSend(WeakRetained, "_processingQueue_observerDispatchQueryResultsWereUpdated:", v5);
  }
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_66(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_new();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_68;
  v12[3] = &unk_1E6AB57C8;
  id v5 = v4;
  id v13 = v5;
  [v3 enumerateObjectsUsingBlock:v12];

  int v6 = *(NSObject **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_3_70;
  v8[3] = &unk_1E6AAEF38;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v7 = v5;
  dispatch_async(v6, v8);

  objc_destroyWeak(&v11);
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_68(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 attributeSet];
  uint64_t v4 = [v7 attributeForKey:*MEMORY[0x1E4F23788]];
  id v5 = *(void **)(a1 + 32);
  int v6 = [v3 uniqueIdentifier];

  [v5 setObject:v4 forKeyedSubscript:v6];
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_3_70(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_processingQueue_updateQueryRelevancyScores:iconLibraryQueryContext:", *(void *)(a1 + 32), *(void *)(a1 + 40));
    id WeakRetained = v3;
  }
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_4_71(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = SBLogLibrarySearchController();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    CFAbsoluteTime v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
    *(_DWORD *)buf = 138412546;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    CFAbsoluteTime v16 = v6;
    _os_log_impl(&dword_1D7F0A000, v4, OS_LOG_TYPE_DEFAULT, "Library Relevancy Query '%@' execution time: %f", buf, 0x16u);
  }

  id v7 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_72;
  block[3] = &unk_1E6AAEF38;
  objc_copyWeak(&v12, (id *)(a1 + 56));
  id v10 = *(id *)(a1 + 48);
  id v11 = v3;
  id v8 = v3;
  dispatch_async(v7, block);

  objc_destroyWeak(&v12);
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_72(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"kRelevancyQueryErrorKey"];
    objc_msgSend(WeakRetained, "_processingQueue_updateQueryRelevancyScores:iconLibraryQueryContext:", MEMORY[0x1E4F1CC08], *(void *)(a1 + 32));
  }
}

- (void)_processingQueue_teardownQueryContext:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  CFAbsoluteTime v6 = [v4 objectForKeyedSubscript:@"kRunningQueryKey"];
  objc_msgSend(v5, "bs_safeAddObject:", v6);
  id v7 = [v4 objectForKeyedSubscript:@"kRelevancyQueryKey"];
  objc_msgSend(v5, "bs_safeAddObject:", v7);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        [(SBHIconLibrarySpotlightQueryEngine *)self _teardownCSSearchQuery:*(void *)(*((void *)&v16 + 1) + 8 * v12++)];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  [v4 setObject:0 forKeyedSubscript:@"kRelevancyQueryKey"];
  [v4 setObject:0 forKeyedSubscript:@"kRunningQueryKey"];
  v15.receiver = self;
  v15.super_class = (Class)SBHIconLibrarySpotlightQueryEngine;
  [(SBHIconLibraryAbstractQueryEngine *)&v15 _processingQueue_teardownQueryContext:v4];
  p_currentlyRunningQueryContext = &self->_currentlyRunningQueryContext;
  id WeakRetained = objc_loadWeakRetained((id *)p_currentlyRunningQueryContext);

  if (WeakRetained == v4) {
    objc_storeWeak((id *)p_currentlyRunningQueryContext, 0);
  }
}

- (void)_teardownCSSearchQuery:(id)a3
{
  id v3 = a3;
  [v3 setCompletionHandler:0];
  [v3 setFoundItemsHandler:0];
  [v3 setRemovedItemsHandler:0];
  [v3 setGatherEndedHandler:0];
  [v3 setCompletionScoresHandler:0];
  [v3 cancel];
}

- (BOOL)_processingQueue_isBundleIdentifierValid:(id)a3 iconLibraryQueryContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 query];
  id v8 = [v7 searchString];
  uint64_t v9 = [v8 length];

  if (v9)
  {
    uint64_t v10 = [v6 objectForKeyedSubscript:@"markedBundleIdentifiers"];
    char v11 = [v10 containsObject:v5];
  }
  else
  {
    char v11 = v5 != 0;
  }

  return v11;
}

- (void)_processingQueue_markBundleIdentifiers:(id)a3 iconLibraryQueryContext:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  id v6 = [v5 objectForKeyedSubscript:@"markedBundleIdentifiers"];
  if (!v6)
  {
    id v6 = objc_opt_new();
    [v5 setObject:v6 forKeyedSubscript:@"markedBundleIdentifiers"];
  }
  id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v8];
  [v6 unionSet:v7];
}

- (void)_processingQueue_unmarkBundleIdentifiers:(id)a3 iconLibraryQueryContext:(id)a4
{
  id v5 = a3;
  id v7 = [a4 objectForKeyedSubscript:@"markedBundleIdentifiers"];
  id v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];

  [v7 minusSet:v6];
}

- (void)_processingQueue_updateQueryRelevancyScores:(id)a3 iconLibraryQueryContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKeyedSubscript:@"kRelevancyQueryKey"];

  if (v8)
  {
    uint64_t v9 = [v7 objectForKeyedSubscript:@"kRelevancyQueryErrorKey"];
    if (!v9)
    {
      uint64_t v10 = [v7 objectForKeyedSubscript:@"kRelevancyMapKey"];
      char v11 = v10;
      if (v10) {
        id v12 = v10;
      }
      else {
        id v12 = (id)objc_opt_new();
      }
      id v13 = v12;

      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __106__SBHIconLibrarySpotlightQueryEngine__processingQueue_updateQueryRelevancyScores_iconLibraryQueryContext___block_invoke;
      v21[3] = &unk_1E6AAE4B8;
      id v22 = v13;
      id v14 = v13;
      [v6 enumerateKeysAndObjectsUsingBlock:v21];
      [v7 setObject:v14 forKeyedSubscript:@"kRelevancyMapKey"];
    }
    uint64_t v15 = [(SBHIconLibraryAbstractQueryEngine *)self _processingQueue_lastQueryResultForContext:v7];
    if (v9 | v15)
    {
      long long v16 = [(SBHIconLibrarySpotlightQueryEngine *)self _processingQueue_sortComperatorForQueryContext:v7];
      long long v17 = [v7 query];
      long long v18 = [SBHIconLibraryQueryResult alloc];
      long long v19 = [(id)v15 icons];
      uint64_t v20 = [(SBHIconLibraryQueryResult *)v18 initWithQuery:v17 icons:v19 sortComparator:v16];

      [(SBHIconLibrarySpotlightQueryEngine *)self _processingQueue_noteQueryResultsWereUpdated:v20 iconLibraryQueryContext:v7 notifyDelegate:1];
    }
  }
}

uint64_t __106__SBHIconLibrarySpotlightQueryEngine__processingQueue_updateQueryRelevancyScores_iconLibraryQueryContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

- (id)_processingQueue_sortComperatorForQueryContext:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"kRelevancyMapKey"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    if ([v5 count])
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __buildIconComparatorForIconsFromRelevancyMap_block_invoke;
      aBlock[3] = &unk_1E6AB32E0;
      id v9 = v5;
      id v6 = _Block_copy(aBlock);
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_processingQueue_noteQueryResultsWereUpdated:(id)a3 iconLibraryQueryContext:(id)a4 notifyDelegate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (v5)
  {
    uint64_t v11 = [v9 objectForKeyedSubscript:@"kRelevancyQueryKey"];
    if (v11
      && (id v12 = (void *)v11,
          [v10 objectForKeyedSubscript:@"kRelevancyQueryErrorKey"],
          id v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          v12,
          !v13))
    {
      id v14 = [v10 objectForKeyedSubscript:@"kRelevancyMapKey"];
      BOOL v5 = v14 != 0;
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)SBHIconLibrarySpotlightQueryEngine;
  [(SBHIconLibraryAbstractQueryEngine *)&v15 _processingQueue_noteQueryResultsWereUpdated:v8 iconLibraryQueryContext:v10 notifyDelegate:v5];
}

- (void).cxx_destruct
{
}

void __51__SBHIconLibrarySpotlightQueryEngine_executeQuery___block_invoke_2_61_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "ERROR: %@", (uint8_t *)&v3, 0xCu);
}

@end