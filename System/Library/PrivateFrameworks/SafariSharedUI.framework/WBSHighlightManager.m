@interface WBSHighlightManager
+ (void)initialize;
- (BOOL)isFetchingHighlights;
- (NSArray)highlights;
- (NSArray)suggestions;
- (NSString)providerSectionIdentifier;
- (WBSHighlightManager)init;
- (WBSStartPageSuggestionsProviderDelegate)suggestionsProviderDelegate;
- (id)attributionViewForHighlight:(id)a3;
- (void)_didFetchHighlights;
- (void)_enableNewSLAttributionViewAppereance;
- (void)_setHighlights:(id)a3;
- (void)_showBannerIfNeededForPresenter:(id)a3;
- (void)_updateAttributionViews;
- (void)_updateHighlights;
- (void)fetchMetadataForHighlight:(id)a3 completionHandler:(id)a4;
- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4;
- (void)highlightCenterDidAddHighlights:(id)a3;
- (void)sendFeedbackForHighlight:(id)a3 withType:(unint64_t)a4 inPrivateBrowsing:(BOOL)a5;
- (void)setSuggestionsProviderDelegate:(id)a3;
- (void)updateHighlightForAttributionPresenter:(id)a3;
@end

@implementation WBSHighlightManager

- (NSArray)highlights
{
  return self->_highlights;
}

- (NSString)providerSectionIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F98890];
}

- (void)setSuggestionsProviderDelegate:(id)a3
{
}

- (NSArray)suggestions
{
  return self->_highlights;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    Class v2 = NSClassFromString(&cfstr_Slhighlight.isa);
    if (v2)
    {
      v3 = v2;
      v4 = imp_implementationWithBlock(&__block_literal_global_18);
      class_addMethod(v3, sel_suggestionIdentifier, v4, "@@:");
    }
  }
}

uint64_t __60__WBSHighlightManager__enableNewSLAttributionViewAppereance__block_invoke()
{
  id SLAttributionViewClass = getSLAttributionViewClass();
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    return [SLAttributionViewClass useNewDefaultBackgroundStyle];
  }
  return result;
}

uint64_t __27__WBSHighlightManager_init__block_invoke(uint64_t a1)
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  Class v2 = (void *)getSLHighlightCenterClass_softClass;
  uint64_t v12 = getSLHighlightCenterClass_softClass;
  if (!getSLHighlightCenterClass_softClass)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __getSLHighlightCenterClass_block_invoke;
    v8[3] = &unk_1E5E41610;
    v8[4] = &v9;
    __getSLHighlightCenterClass_block_invoke((uint64_t)v8);
    Class v2 = (void *)v10[3];
  }
  v3 = v2;
  _Block_object_dispose(&v9, 8);
  id v4 = objc_alloc_init(v3);
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v4;

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDelegate:");
}

void __40__WBSHighlightManager__updateHighlights__block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__WBSHighlightManager__updateHighlights__block_invoke_2;
  v3[3] = &unk_1E5E42EC8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  Class v2 = (void *)MEMORY[0x1AD115160](v3);
  [*(id *)(*(void *)(a1 + 32) + 8) fetchHighlights:v2];

  objc_destroyWeak(&v4);
}

- (WBSHighlightManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)WBSHighlightManager;
  Class v2 = [(WBSHighlightManager *)&v13 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.Safari.HighlightManager", 0);
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = v2->_internalQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __27__WBSHighlightManager_init__block_invoke;
    block[3] = &unk_1E5E40968;
    v6 = v2;
    uint64_t v12 = v6;
    dispatch_async(v5, block);
    v7 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    linkDataCache = v6->_linkDataCache;
    v6->_linkDataCache = v7;

    [(WBSHighlightManager *)v6 _updateHighlights];
    [(WBSHighlightManager *)v6 _enableNewSLAttributionViewAppereance];
    uint64_t v9 = v6;
  }
  return v2;
}

- (void)_updateHighlights
{
  self->_isFetchingHighlights = 1;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__WBSHighlightManager__updateHighlights__block_invoke;
  block[3] = &unk_1E5E41598;
  objc_copyWeak(&v5, &location);
  void block[4] = self;
  dispatch_async(internalQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_enableNewSLAttributionViewAppereance
{
  if (_enableNewSLAttributionViewAppereance_once != -1) {
    dispatch_once(&_enableNewSLAttributionViewAppereance_once, &__block_literal_global_18);
  }
}

uint64_t __33__WBSHighlightManager_initialize__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

- (void)fetchMetadataForHighlight:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v8 = [v6 identifier];
  uint64_t v9 = [(NSCache *)self->_linkDataCache objectForKey:v8];
  if (v9)
  {
    v7[2](v7, v9);
  }
  else
  {
    v10 = [v6 attributions];
    uint64_t v11 = [v10 firstObject];
    uint64_t v12 = [v11 uniqueIdentifier];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__WBSHighlightManager_fetchMetadataForHighlight_completionHandler___block_invoke;
    v13[3] = &unk_1E5E42E58;
    id v14 = v6;
    v15 = self;
    id v16 = v8;
    v17 = v7;
    [(WBSHighlightManager *)self loadLinkMetadataForMessageWithGUID:v12 completionHandler:v13];
  }
}

void __67__WBSHighlightManager_fetchMetadataForHighlight_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v7 = [*(id *)(a1 + 32) identifier];
    v8 = WBS_LOG_CHANNEL_PREFIXInterstellar();
    uint64_t v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __67__WBSHighlightManager_fetchMetadataForHighlight_completionHandler___block_invoke_cold_1((uint64_t)v7, v9, v6);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v7;
      _os_log_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_INFO, "Highlight <%{public}@> has no metadata", buf, 0xCu);
    }
    id v5 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  }
  v10 = [v5 URL];

  if (!v10)
  {
    uint64_t v11 = [*(id *)(a1 + 32) resourceURL];
    [v5 setURL:v11];

    uint64_t v12 = [v5 URL];
    [v5 setOriginalURL:v12];
  }
  objc_super v13 = [v5 title];

  if (!v13)
  {
    id v14 = [v5 URL];
    v15 = objc_msgSend(v14, "safari_canonicalURL");
    id v16 = objc_msgSend(v15, "safari_originalDataAsString");
    v17 = objc_msgSend(v16, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 7, 1, 0);
    [v5 setTitle:v17];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__WBSHighlightManager_fetchMetadataForHighlight_completionHandler___block_invoke_22;
  block[3] = &unk_1E5E425D0;
  uint64_t v18 = *(void *)(a1 + 40);
  v19 = *(void **)(a1 + 48);
  id v23 = v6;
  uint64_t v24 = v18;
  id v25 = v5;
  id v26 = v19;
  id v27 = *(id *)(a1 + 56);
  id v20 = v5;
  id v21 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __67__WBSHighlightManager_fetchMetadataForHighlight_completionHandler___block_invoke_22(void *a1)
{
  if (!a1[4]) {
    [*(id *)(a1[5] + 24) setObject:a1[6] forKey:a1[7]];
  }
  Class v2 = *(uint64_t (**)(void))(a1[8] + 16);
  return v2();
}

- (void)updateHighlightForAttributionPresenter:(id)a3
{
  id v4 = a3;
  if (self->_isFetchingHighlights)
  {
    id v5 = WBS_LOG_CHANNEL_PREFIXInterstellar();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_INFO, "Defer checking for Highlight until the Highlight Center finishes fetching.", v10, 2u);
    }
    id v6 = WBS_LOG_CHANNEL_PREFIXInterstellar();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[WBSHighlightManager updateHighlightForAttributionPresenter:](v6, v4);
    }
    deferredAttributionPresenters = self->_deferredAttributionPresenters;
    if (!deferredAttributionPresenters)
    {
      v8 = [MEMORY[0x1E4F1CA48] array];
      uint64_t v9 = self->_deferredAttributionPresenters;
      self->_deferredAttributionPresenters = v8;

      deferredAttributionPresenters = self->_deferredAttributionPresenters;
    }
    [(NSMutableArray *)deferredAttributionPresenters addObject:v4];
  }
  else
  {
    [(WBSHighlightManager *)self _showBannerIfNeededForPresenter:v4];
  }
}

- (void)_showBannerIfNeededForPresenter:(id)a3
{
  id v4 = a3;
  highlights = self->_highlights;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __55__WBSHighlightManager__showBannerIfNeededForPresenter___block_invoke;
  v11[3] = &unk_1E5E42E80;
  id v6 = v4;
  id v12 = v6;
  v7 = [(NSArray *)highlights safari_firstObjectPassingTest:v11];
  if (v7)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXInterstellar();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1ABB70000, v8, OS_LOG_TYPE_INFO, "Found a matching Highlight", v10, 2u);
    }
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXInterstellar();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[WBSHighlightManager _showBannerIfNeededForPresenter:](v9, v6);
    }
  }
  [v6 displayAttributionBannerForHighlightIfNeeded:v7];
}

uint64_t __55__WBSHighlightManager__showBannerIfNeededForPresenter___block_invoke(uint64_t a1, void *a2)
{
  dispatch_queue_t v3 = WBSURLForHighlight(a2);
  id v4 = objc_msgSend(v3, "safari_canonicalURL");
  id v5 = objc_msgSend(v4, "safari_userVisibleString");
  id v6 = [*(id *)(a1 + 32) attributionPresenterURL];
  v7 = objc_msgSend(v6, "safari_canonicalURL");
  v8 = objc_msgSend(v7, "safari_userVisibleString");
  uint64_t v9 = [v5 isEqualToString:v8];

  return v9;
}

- (void)sendFeedbackForHighlight:(id)a3 withType:(unint64_t)a4 inPrivateBrowsing:(BOOL)a5
{
  id v8 = a3;
  if (!a5)
  {
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXInterstellar();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[WBSHighlightManager sendFeedbackForHighlight:withType:inPrivateBrowsing:](v9, v8, a4);
    }
    [(SLHighlightCenter *)self->_highlightCenter feedbackForHighlight:v8 withType:a4 completionBlock:0];
  }
}

- (void)_updateAttributionViews
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = [(WBSHighlightManager *)self highlights];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 identifier];
        uint64_t v11 = [(NSMutableDictionary *)self->_highlightToAttributionViewMap objectForKeyedSubscript:v10];
        if (v11)
        {
          [(NSMutableDictionary *)v3 setObject:v11 forKeyedSubscript:v10];
        }
        else
        {
          id v12 = (void *)[objc_alloc((Class)getSLAttributionViewClass()) initWithHighlight:v9];
          [(NSMutableDictionary *)v3 setObject:v12 forKeyedSubscript:v10];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  highlightToAttributionViewMap = self->_highlightToAttributionViewMap;
  self->_highlightToAttributionViewMap = v3;
}

- (id)attributionViewForHighlight:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 identifier];
  uint64_t v6 = [(NSMutableDictionary *)self->_highlightToAttributionViewMap objectForKeyedSubscript:v5];
  if (!v6)
  {
    uint64_t v6 = (void *)[objc_alloc((Class)getSLAttributionViewClass()) initWithHighlight:v4];
    [(NSMutableDictionary *)self->_highlightToAttributionViewMap setObject:v6 forKeyedSubscript:v5];
  }
  id v7 = v6;

  return v7;
}

- (void)_setHighlights:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a3, "safari_filterObjectsUsingBlock:", &__block_literal_global_28);
  id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = v4;
  if (v4 != self->_highlights)
  {
    if ([(NSArray *)v4 count] > 0x18)
    {
      -[NSArray subarrayWithRange:](v5, "subarrayWithRange:", 0, 24);
      uint64_t v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v6 = (NSArray *)[(NSArray *)v5 copy];
    }
    highlights = self->_highlights;
    self->_highlights = v6;

    [(WBSHighlightManager *)self _updateAttributionViews];
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 postNotificationName:@"WBSHighlightsContentDidChangeNotification" object:self];

    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXStartPage();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = self->_highlights;
      uint64_t v11 = v9;
      int v13 = 134217984;
      uint64_t v14 = [(NSArray *)v10 count];
      _os_log_impl(&dword_1ABB70000, v11, OS_LOG_TYPE_INFO, "Received %lu highlights for suggestions", (uint8_t *)&v13, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsProviderDelegate);
    [WeakRetained startPageSuggestionsProvider:self didUpdateSuggestions:self->_highlights];
  }
}

uint64_t __38__WBSHighlightManager__setHighlights___block_invoke(uint64_t a1, void *a2)
{
  Class v2 = [a2 resourceURL];
  uint64_t v3 = objc_msgSend(v2, "safari_isSharedTabGroupURL") ^ 1;

  return v3;
}

void __40__WBSHighlightManager__updateHighlights__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = WBS_LOG_CHANNEL_PREFIXInterstellar();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __40__WBSHighlightManager__updateHighlights__block_invoke_2_cold_1(v8, v6);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__WBSHighlightManager__updateHighlights__block_invoke_30;
    block[3] = &unk_1E5E41340;
    uint64_t v9 = &v15;
    objc_copyWeak(&v15, (id *)(a1 + 32));
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = v8;
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = [v5 count];
      _os_log_impl(&dword_1ABB70000, v10, OS_LOG_TYPE_INFO, "Fetched %ld Highlights.", buf, 0xCu);
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __40__WBSHighlightManager__updateHighlights__block_invoke_31;
    v11[3] = &unk_1E5E41598;
    uint64_t v9 = &v13;
    objc_copyWeak(&v13, (id *)(a1 + 32));
    id v12 = v5;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
  objc_destroyWeak(v9);
}

void __40__WBSHighlightManager__updateHighlights__block_invoke_30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _didFetchHighlights];
    id WeakRetained = v2;
  }
}

void __40__WBSHighlightManager__updateHighlights__block_invoke_31(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _setHighlights:*(void *)(a1 + 32)];
    [v3 _didFetchHighlights];
    id WeakRetained = v3;
  }
}

- (void)_didFetchHighlights
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = self->_deferredAttributionPresenters;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        -[WBSHighlightManager _showBannerIfNeededForPresenter:](self, "_showBannerIfNeededForPresenter:", *(void *)(*((void *)&v9 + 1) + 8 * v7++), (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  deferredAttributionPresenters = self->_deferredAttributionPresenters;
  self->_deferredAttributionPresenters = 0;

  self->_isFetchingHighlights = 0;
}

- (void)highlightCenter:(id)a3 didRemoveHighlights:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__WBSHighlightManager_highlightCenter_didRemoveHighlights___block_invoke;
  v7[3] = &unk_1E5E40D38;
  id v8 = v5;
  long long v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __59__WBSHighlightManager_highlightCenter_didRemoveHighlights___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = WBS_LOG_CHANNEL_PREFIXInterstellar();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    *(_DWORD *)buf = 134217984;
    uint64_t v17 = [v3 count];
    _os_log_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_INFO, "%ld Highlight(s) removed.", buf, 0xCu);
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__WBSHighlightManager_highlightCenter_didRemoveHighlights___block_invoke_33;
  v15[3] = &unk_1E5E42EF0;
  id v5 = *(void **)(a1 + 32);
  v15[4] = *(void *)(a1 + 40);
  id v6 = objc_msgSend(v5, "safari_setByApplyingBlock:", v15);
  [*(id *)(a1 + 40) _handleRemovalOfHighlights:v6];
  uint64_t v7 = *(void **)(*(void *)(a1 + 40) + 64);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __59__WBSHighlightManager_highlightCenter_didRemoveHighlights___block_invoke_2;
  id v13 = &unk_1E5E42E80;
  id v14 = v6;
  id v8 = v6;
  long long v9 = objc_msgSend(v7, "safari_filterObjectsUsingBlock:", &v10);
  objc_msgSend(*(id *)(a1 + 40), "_setHighlights:", v9, v10, v11, v12, v13);
}

id __59__WBSHighlightManager_highlightCenter_didRemoveHighlights___block_invoke_33(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:v3];
  return v3;
}

uint64_t __59__WBSHighlightManager_highlightCenter_didRemoveHighlights___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 identifier];
  uint64_t v4 = [v2 containsObject:v3] ^ 1;

  return v4;
}

- (void)highlightCenterDidAddHighlights:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__WBSHighlightManager_highlightCenterDidAddHighlights___block_invoke;
  block[3] = &unk_1E5E40968;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __55__WBSHighlightManager_highlightCenterDidAddHighlights___block_invoke(uint64_t a1)
{
  id v2 = WBS_LOG_CHANNEL_PREFIXInterstellar();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1ABB70000, v2, OS_LOG_TYPE_INFO, "Highlight Center did add Highlights.", v4, 2u);
  }
  return [*(id *)(a1 + 32) _updateHighlights];
}

- (WBSStartPageSuggestionsProviderDelegate)suggestionsProviderDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_suggestionsProviderDelegate);
  return (WBSStartPageSuggestionsProviderDelegate *)WeakRetained;
}

- (BOOL)isFetchingHighlights
{
  return self->_isFetchingHighlights;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlights, 0);
  objc_destroyWeak((id *)&self->_suggestionsProviderDelegate);
  objc_storeStrong((id *)&self->_highlightToAttributionViewMap, 0);
  objc_storeStrong((id *)&self->_deferredAttributionPresenters, 0);
  objc_storeStrong((id *)&self->_linkDataCache, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_highlightCenter, 0);
}

void __67__WBSHighlightManager_fetchMetadataForHighlight_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a2;
  id v5 = objc_msgSend(a3, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_8();
  _os_log_error_impl(&dword_1ABB70000, v4, OS_LOG_TYPE_ERROR, "Failed to fetch metadata for Highlight <%{public}@>: %{public}@", v6, 0x16u);
}

- (void)updateHighlightForAttributionPresenter:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 attributionPresenterURL];
  id v5 = objc_msgSend(v4, "safari_userVisibleString");
  OUTLINED_FUNCTION_0_0(&dword_1ABB70000, v6, v7, "Defer checking for Highlight for tab with URL: %{private}@", v8, v9, v10, v11, 3u);
}

- (void)_showBannerIfNeededForPresenter:(void *)a1 .cold.1(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 attributionPresenterURL];
  id v5 = objc_msgSend(v4, "safari_userVisibleString");
  OUTLINED_FUNCTION_0_0(&dword_1ABB70000, v6, v7, "Found a matching Highlight for tab with URL: %{private}@", v8, v9, v10, v11, 3u);
}

- (void)sendFeedbackForHighlight:(void *)a1 withType:(void *)a2 inPrivateBrowsing:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  uint64_t v6 = [a2 identifier];
  uint64_t v7 = @"Other";
  if (a3 == 1) {
    uint64_t v7 = @"Interacted";
  }
  if (!a3) {
    uint64_t v7 = @"Displayed";
  }
  uint64_t v8 = v7;
  OUTLINED_FUNCTION_0_8();
  _os_log_debug_impl(&dword_1ABB70000, v5, OS_LOG_TYPE_DEBUG, "Sending feedback for highlight <%{public}@>: <%{public}@>", v9, 0x16u);
}

void __40__WBSHighlightManager__updateHighlights__block_invoke_2_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  uint64_t v6 = v4;
  _os_log_error_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_ERROR, "Failed to fetch highlights: %{public}@", (uint8_t *)&v5, 0xCu);
}

@end