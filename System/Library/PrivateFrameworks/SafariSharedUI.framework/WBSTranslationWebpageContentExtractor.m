@interface WBSTranslationWebpageContentExtractor
- (WBSTranslationContentExtractionDelegate)extractionDelegate;
- (WBSTranslationContentFillingDelegate)fillingDelegate;
- (WBSTranslationWebpageContentExtractor)initWithWebView:(id)a3;
- (id)_textManipulationConfiguration;
- (void)_replaceItemsWithSignpostID:(unint64_t)a3;
- (void)_scheduleReplaceItemsWithTargetLocale:(id)a3;
- (void)_updateHTMLLanguageAttributesIfNeeded:(id)a3;
- (void)_webView:(id)a3 didFindTextManipulationItem:(id)a4;
- (void)_webView:(id)a3 didFindTextManipulationItems:(id)a4;
- (void)beginExtractingContent;
- (void)replaceExtractedContent:(id)a3 withTranslatedContent:(id)a4 targetLocale:(id)a5;
- (void)setExtractionDelegate:(id)a3;
- (void)setFillingDelegate:(id)a3;
- (void)stopExtractingContent;
@end

@implementation WBSTranslationWebpageContentExtractor

- (WBSTranslationWebpageContentExtractor)initWithWebView:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WBSTranslationWebpageContentExtractor;
  v5 = [(WBSTranslationWebpageContentExtractor *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    replaceItemsQueue = v6->_replaceItemsQueue;
    v6->_replaceItemsQueue = (NSMutableArray *)v7;

    v6->_replaceItemsLock._os_unfair_lock_opaque = 0;
    v9 = v6;
  }

  return v6;
}

- (void)beginExtractingContent
{
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__WBSTranslationWebpageContentExtractor_beginExtractingContent__block_invoke;
  block[3] = &unk_1E5E44A00;
  block[4] = self;
  objc_copyWeak(&v4, &location);
  dispatch_async(MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __63__WBSTranslationWebpageContentExtractor_beginExtractingContent__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained _setTextManipulationDelegate:*(void *)(a1 + 32)];
  v3 = [*(id *)(a1 + 32) _textManipulationConfiguration];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__WBSTranslationWebpageContentExtractor_beginExtractingContent__block_invoke_2;
  v7[3] = &unk_1E5E41340;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  [WeakRetained _startTextManipulationsWithConfiguration:v3 completion:v7];

  id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = [v4 sourceLocaleForContentExtractor:*(void *)(a1 + 32)];
    v6 = [v4 targetLocaleForContentExtractor:*(void *)(a1 + 32)];
    [WeakRetained _startImageAnalysis:v5 target:v6];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 contentExtractorDidBeginExtractingContent:*(void *)(a1 + 32)];
  }

  objc_destroyWeak(&v8);
}

void __63__WBSTranslationWebpageContentExtractor_beginExtractingContent__block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v6[0] = 0;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_INFO, "Finished extracting initial webpage content for translation", (uint8_t *)v6, 2u);
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 5);
    if (objc_opt_respondsToSelector()) {
      [v5 contentExtractorDidFinishExtractingInitialContent:v4];
    }
  }
}

- (void)stopExtractingContent
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__WBSTranslationWebpageContentExtractor_stopExtractingContent__block_invoke;
  block[3] = &unk_1E5E40968;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__WBSTranslationWebpageContentExtractor_stopExtractingContent__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  if (objc_opt_respondsToSelector()) {
    [WeakRetained contentExtractorDidStopExtractingContent:*(void *)(a1 + 32)];
  }
}

- (void)replaceExtractedContent:(id)a3 withTranslatedContent:(id)a4 targetLocale:(id)a5
{
  id v9 = a5;
  id v7 = a4;
  os_unfair_lock_lock(&self->_replaceItemsLock);
  uint64_t v8 = [(NSMutableArray *)self->_replaceItemsQueue count];
  [(NSMutableArray *)self->_replaceItemsQueue safari_addObjectUnlessNil:v7];

  os_unfair_lock_unlock(&self->_replaceItemsLock);
  if (!v8) {
    [(WBSTranslationWebpageContentExtractor *)self _scheduleReplaceItemsWithTargetLocale:v9];
  }
}

- (void)_scheduleReplaceItemsWithTargetLocale:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__WBSTranslationWebpageContentExtractor__scheduleReplaceItemsWithTargetLocale___block_invoke;
  block[3] = &unk_1E5E41598;
  objc_copyWeak(&v8, &location);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __79__WBSTranslationWebpageContentExtractor__scheduleReplaceItemsWithTargetLocale___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _updateHTMLLanguageAttributesIfNeeded:*(void *)(a1 + 32)];
    id v4 = WBS_LOG_CHANNEL_PREFIXTranslation();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    v6 = WBS_LOG_CHANNEL_PREFIXTranslation();
    id v7 = v6;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)id v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_1ABB70000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "Replace Items", "", v8, 2u);
    }

    [v3 _replaceItemsWithSignpostID:v5];
  }
}

- (void)_replaceItemsWithSignpostID:(unint64_t)a3
{
  p_replaceItemsLock = &self->_replaceItemsLock;
  os_unfair_lock_lock(&self->_replaceItemsLock);
  if (WBSTranslationIsUnthrottled_onceToken != -1) {
    dispatch_once(&WBSTranslationIsUnthrottled_onceToken, &__block_literal_global_162);
  }
  int v6 = WBSTranslationIsUnthrottled_translationIsUnthrottled;
  unint64_t v7 = [(NSMutableArray *)self->_replaceItemsQueue count];
  uint64_t v8 = v7;
  if (!v6)
  {
    if (v7 > 0xB) {
      uint64_t v8 = 12;
    }
    else {
      uint64_t v8 = [(NSMutableArray *)self->_replaceItemsQueue count];
    }
  }
  id v9 = -[NSMutableArray subarrayWithRange:](self->_replaceItemsQueue, "subarrayWithRange:", 0, v8);
  os_unfair_lock_unlock(p_replaceItemsLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__WBSTranslationWebpageContentExtractor__replaceItemsWithSignpostID___block_invoke;
  v12[3] = &unk_1E5E45738;
  uint64_t v14 = v8;
  unint64_t v15 = a3;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [WeakRetained _completeTextManipulationForItems:v11 completion:v12];
}

void __69__WBSTranslationWebpageContentExtractor__replaceItemsWithSignpostID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "removeObjectsInRange:", 0, *(void *)(a1 + 48));
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  if (v4)
  {
    objc_initWeak(location, *(id *)(a1 + 32));
    dispatch_time_t v5 = dispatch_time(0, 20000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__WBSTranslationWebpageContentExtractor__replaceItemsWithSignpostID___block_invoke_2;
    block[3] = &unk_1E5E42700;
    objc_copyWeak(v40, location);
    v40[1] = *(id *)(a1 + 56);
    dispatch_after(v5, MEMORY[0x1E4F14428], block);
    objc_destroyWeak(v40);
    objc_destroyWeak(location);
  }
  else
  {
    int v6 = WBS_LOG_CHANNEL_PREFIXTranslation();
    unint64_t v7 = v6;
    os_signpost_id_t v8 = *(void *)(a1 + 56);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      LOWORD(location[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1ABB70000, v7, OS_SIGNPOST_INTERVAL_END, v8, "Replace Items", "", (uint8_t *)location, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  if (objc_opt_respondsToSelector())
  {
    uint64_t v29 = a1;
    v10 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v30 = v3;
    id v11 = v3;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v36;
      uint64_t v15 = *MEMORY[0x1E4F46828];
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v11);
          }
          v17 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          v18 = [v17 userInfo];
          v19 = [v18 objectForKeyedSubscript:v15];

          if (v19)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v20 = [v19 identifier];
              [v10 setObject:v17 forKeyedSubscript:v20];
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v13);
    }

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v21 = *(id *)(v29 + 40);
    uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v42 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v32 != v24) {
            objc_enumerationMutation(v21);
          }
          v26 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          v27 = [v26 identifier];
          v28 = [v10 objectForKeyedSubscript:v27];

          [WeakRetained contentFiller:*(void *)(v29 + 32) didCompleteFillingItem:v26 withError:v28];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v42 count:16];
      }
      while (v23);
    }

    id v3 = v30;
  }
}

void __69__WBSTranslationWebpageContentExtractor__replaceItemsWithSignpostID___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _replaceItemsWithSignpostID:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_webView:(id)a3 didFindTextManipulationItem:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = v6;
    os_signpost_id_t v8 = [v5 tokens];
    *(_DWORD *)buf = 134217984;
    uint64_t v13 = [v8 count];
    _os_log_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_INFO, "Extracted _WKTextManipulationItem from webpage with %lu tokens", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extractionDelegate);
  if (objc_opt_respondsToSelector())
  {
    id v11 = v5;
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
    [WeakRetained contentExtractor:self didExtractContent:v10];
  }
  self->_needsHTMLLangAttributeUpdate = 1;
}

- (void)_webView:(id)a3 didFindTextManipulationItems:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = WBS_LOG_CHANNEL_PREFIXTranslation();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = v6;
    int v9 = 134217984;
    uint64_t v10 = [v5 count];
    _os_log_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_INFO, "Extracted %lu _WKTextManipulationItem(s) from webpage", (uint8_t *)&v9, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extractionDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained contentExtractor:self didExtractContent:v5];
  }
  self->_needsHTMLLangAttributeUpdate = 1;
}

- (void)_updateHTMLLanguageAttributesIfNeeded:(id)a3
{
  if (self->_needsHTMLLangAttributeUpdate)
  {
    self->_needsHTMLLangAttributeUpdate = 0;
    id v9 = [a3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    id v4 = [NSString alloc];
    id v5 = (void *)[v4 initWithBytesNoCopy:"//# sourceURL=__InjectedScript_Translation.js\n/* Copyright (c) 2024 Apple Inc. All rights reserved. */\nfunction updateLanguageAttributesForTranslation(n){document.documentElement.lang&&(document.documentElement.lang=n)}" length:translationSourceLength encoding:1 freeWhenDone:0];
    int v6 = [v5 stringByAppendingFormat:@"\n updateLanguageAttributesForTranslation(\"%@\"", v9];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    os_signpost_id_t v8 = [MEMORY[0x1E4F46678] defaultClientWorld];
    [WeakRetained _evaluateJavaScript:v6 inFrame:0 inContentWorld:v8 completionHandler:&__block_literal_global_51];
  }
}

void __79__WBSTranslationWebpageContentExtractor__updateHTMLLanguageAttributesIfNeeded___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXTranslation();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __79__WBSTranslationWebpageContentExtractor__updateHTMLLanguageAttributesIfNeeded___block_invoke_cold_1(v4, v3);
    }
  }
}

- (id)_textManipulationConfiguration
{
  v15[9] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F467A0]);
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F467A8]) initExclusion:1 forElement:@"code"];
  v15[0] = v14;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F467A8]) initExclusion:1 forElement:@"var"];
  v15[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F467A8]) initExclusion:1 forElement:@"kbd"];
  v15[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F467A8]) initExclusion:1 forElement:@"samp"];
  v15[3] = v5;
  int v6 = (void *)[objc_alloc(MEMORY[0x1E4F467A8]) initExclusion:1 forAttribute:@"translate" value:@"no"];
  v15[4] = v6;
  unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F467A8]) initExclusion:0 forAttribute:@"translate" value:@"yes"];
  v15[5] = v7;
  os_signpost_id_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F467A8]) initExclusion:1 forAttribute:@"contenteditable" value:@"true"];
  v15[6] = v8;
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F467A8]) initExclusion:0 forAttribute:@"contenteditable" value:@"false"];
  v15[7] = v9;
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F467A8]) initExclusion:1 forClass:@"notranslate"];
  v15[8] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:9];

  [v2 setExclusionRules:v11];
  uint64_t v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(v2, "setIncludeSubframes:", objc_msgSend(v12, "BOOLForKey:", *MEMORY[0x1E4F988E0]));

  return v2;
}

- (WBSTranslationContentExtractionDelegate)extractionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_extractionDelegate);
  return (WBSTranslationContentExtractionDelegate *)WeakRetained;
}

- (void)setExtractionDelegate:(id)a3
{
}

- (WBSTranslationContentFillingDelegate)fillingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fillingDelegate);
  return (WBSTranslationContentFillingDelegate *)WeakRetained;
}

- (void)setFillingDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_fillingDelegate);
  objc_destroyWeak((id *)&self->_extractionDelegate);
  objc_storeStrong((id *)&self->_replaceItemsQueue, 0);
  objc_destroyWeak((id *)&self->_webView);
}

void __79__WBSTranslationWebpageContentExtractor__updateHTMLLanguageAttributesIfNeeded___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  int v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Failed to update page's language attributes: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end