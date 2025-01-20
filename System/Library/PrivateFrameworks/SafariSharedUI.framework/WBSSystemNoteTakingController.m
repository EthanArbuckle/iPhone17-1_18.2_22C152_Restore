@interface WBSSystemNoteTakingController
- (BOOL)_isSystemNoteTakingEnabled;
- (BOOL)_isSystemNoteTakingEnabledForSafari;
- (BOOL)isNoteTakingSupportedForURL:(id)a3;
- (BOOL)isNoteTakingSupportedWithPrivateBrowsing:(BOOL)a3;
- (BOOL)isNotesPIPVisible;
- (WBSSystemNoteTakingController)init;
- (WBSSystemNoteTakingControllerDelegate)delegate;
- (id)userActivityForNoteTaking:(id)a3;
- (void)_insertLinkContextInfo:(id)a3 userActivity:(id)a4;
- (void)_insertLinkContextPreview:(id)a3 userActivity:(id)a4;
- (void)_setUpNotesVisibilityObserver;
- (void)_updateNotesPIPVisibility:(BOOL)a3;
- (void)applyHighlightInUserActivity:(id)a3 webView:(id)a4;
- (void)cacheCanonicalURL:(id)a3 forWebPageURL:(id)a4;
- (void)fetchHighlightsForUserActivity:(id)a3 privateBrowsing:(BOOL)a4 completion:(id)a5;
- (void)insertCanonicalURLIfAvailableForUserActivity:(id)a3;
- (void)saveHighlightsData:(id)a3 selectedText:(id)a4 selectedImage:(id)a5 newGroup:(BOOL)a6 originatedInApp:(BOOL)a7 webView:(id)a8 userActivity:(id)a9;
- (void)setDelegate:(id)a3;
- (void)userWillAddLinkWithActivity:(id)a3 completion:(id)a4;
@end

@implementation WBSSystemNoteTakingController

- (void)setDelegate:(id)a3
{
}

void __62__WBSSystemNoteTakingController__setUpNotesVisibilityObserver__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateNotesPIPVisibility:*(unsigned __int8 *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

- (void)_updateNotesPIPVisibility:(BOOL)a3
{
  if (self->_isNotesPIPVisible != a3)
  {
    [(WBSSystemNoteTakingController *)self willChangeValueForKey:@"WBSNotesPIPVisibilityChanged"];
    self->_isNotesPIPVisible = a3;
    [(WBSSystemNoteTakingController *)self didChangeValueForKey:@"WBSNotesPIPVisibilityChanged"];
  }
}

- (BOOL)isNoteTakingSupportedWithPrivateBrowsing:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(WBSSystemNoteTakingController *)self _isSystemNoteTakingEnabled];
  if (v5 && v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = [WeakRetained isNoteTakingControllerSupportedInPrivateBrowsing:self];

    LOBYTE(v5) = v7;
  }
  return v5;
}

- (WBSSystemNoteTakingController)init
{
  v11.receiver = self;
  v11.super_class = (Class)WBSSystemNoteTakingController;
  v2 = [(WBSSystemNoteTakingController *)&v11 init];
  p_isa = (id *)&v2->super.isa;
  if (v2 && [(WBSSystemNoteTakingController *)v2 _isSystemNoteTakingEnabled])
  {
    uint64_t v13 = 0;
    v14 = &v13;
    uint64_t v15 = 0x2050000000;
    v4 = (void *)getSYLinkContextClientClass_softClass;
    uint64_t v16 = getSYLinkContextClientClass_softClass;
    if (!getSYLinkContextClientClass_softClass)
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __getSYLinkContextClientClass_block_invoke;
      v12[3] = &unk_1E5E41610;
      v12[4] = &v13;
      __getSYLinkContextClientClass_block_invoke((uint64_t)v12);
      v4 = (void *)v14[3];
    }
    BOOL v5 = v4;
    _Block_object_dispose(&v13, 8);
    v6 = (WBSSystemNoteTakingController *)objc_alloc_init(v5);
    id v7 = p_isa[1];
    p_isa[1] = v6;

    if (v6)
    {
      if (objc_opt_respondsToSelector()) {
        [p_isa[1] setDelegate:p_isa];
      }
      id v8 = objc_alloc_init(MEMORY[0x1E4F1C998]);
      id v9 = p_isa[2];
      p_isa[2] = v8;

      [p_isa[2] setTotalCostLimit:1000];
      [p_isa _setUpNotesVisibilityObserver];
      v6 = p_isa;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isSystemNoteTakingEnabled
{
  uint64_t v3 = SynapseLibraryCore();
  if (v3)
  {
    uint64_t v8 = 0;
    id v9 = &v8;
    uint64_t v10 = 0x2050000000;
    v4 = (void *)getSYFeatureEligibilityClass_softClass;
    uint64_t v11 = getSYFeatureEligibilityClass_softClass;
    if (!getSYFeatureEligibilityClass_softClass)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __getSYFeatureEligibilityClass_block_invoke;
      v7[3] = &unk_1E5E41610;
      v7[4] = &v8;
      __getSYFeatureEligibilityClass_block_invoke((uint64_t)v7);
      v4 = (void *)v9[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v8, 8);
    LODWORD(v3) = [v5 supportsQuickNote];
    if (v3) {
      LOBYTE(v3) = [(WBSSystemNoteTakingController *)self _isSystemNoteTakingEnabledForSafari];
    }
  }
  return v3;
}

- (void)_setUpNotesVisibilityObserver
{
  if (!self->_notesActivationObserver)
  {
    objc_initWeak(&location, self);
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2050000000;
    uint64_t v3 = (void *)getSYNotesActivationObserverClass_softClass;
    uint64_t v15 = getSYNotesActivationObserverClass_softClass;
    if (!getSYNotesActivationObserverClass_softClass)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getSYNotesActivationObserverClass_block_invoke;
      v11[3] = &unk_1E5E41610;
      v11[4] = &v12;
      __getSYNotesActivationObserverClass_block_invoke((uint64_t)v11);
      uint64_t v3 = (void *)v13[3];
    }
    v4 = v3;
    _Block_object_dispose(&v12, 8);
    id v5 = [v4 alloc];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__WBSSystemNoteTakingController__setUpNotesVisibilityObserver__block_invoke;
    v8[3] = &unk_1E5E43398;
    objc_copyWeak(&v9, &location);
    v6 = (SYNotesActivationObserver *)[v5 initWithHandler:v8];
    notesActivationObserver = self->_notesActivationObserver;
    self->_notesActivationObserver = v6;

    self->_isNotesPIPVisible = [(SYNotesActivationObserver *)self->_notesActivationObserver isVisible];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __62__WBSSystemNoteTakingController__setUpNotesVisibilityObserver__block_invoke(uint64_t a1, char a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__WBSSystemNoteTakingController__setUpNotesVisibilityObserver__block_invoke_2;
  v3[3] = &unk_1E5E450D8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(&v4);
}

- (void)saveHighlightsData:(id)a3 selectedText:(id)a4 selectedImage:(id)a5 newGroup:(BOOL)a6 originatedInApp:(BOOL)a7 webView:(id)a8 userActivity:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  id v19 = a9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke;
  block[3] = &unk_1E5E45018;
  block[4] = self;
  id v26 = v18;
  id v27 = v19;
  id v28 = v15;
  id v29 = v17;
  id v30 = v16;
  BOOL v31 = a7;
  BOOL v32 = a6;
  id v20 = v16;
  id v21 = v17;
  id v22 = v15;
  id v23 = v19;
  id v24 = v18;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke(uint64_t a1)
{
  v2 = +[WBSSystemNoteTakingLinkMetadataFetcher sharedFetcher];
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v3 = *(void *)(a1 + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke_2;
  v5[3] = &unk_1E5E44FF0;
  objc_copyWeak(&v12, &location);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v4 = v2;
  id v8 = v4;
  id v9 = *(id *)(a1 + 64);
  id v10 = *(id *)(a1 + 72);
  char v13 = *(unsigned char *)(a1 + 80);
  id v11 = *(id *)(a1 + 40);
  char v14 = *(unsigned char *)(a1 + 81);
  [v4 fetchMetadataForWebView:v3 completion:v5];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke_2_cold_1(v7, v6);
    }
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained insertCanonicalURLIfAvailableForUserActivity:*(void *)(a1 + 32)];
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10)
    {
      char v14 = @"linkContextData";
      v15[0] = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      [v9 _insertLinkContextInfo:v11 userActivity:*(void *)(a1 + 32)];
    }
    id v12 = [*(id *)(a1 + 48) linkContextPreviewForMetadata:v5 image:*(void *)(a1 + 56) selectedText:*(void *)(a1 + 64)];
    if (*(unsigned char *)(a1 + 88))
    {
      id v13 = objc_loadWeakRetained(v9 + 5);
      [v13 notifyAddedLinkPreviewMetadata:v12 toUserActivity:*(void *)(a1 + 32) webView:*(void *)(a1 + 72)];
    }
    else if (objc_opt_respondsToSelector())
    {
      [v9[1] createAndShowContextualLinkWithUserActivity:*(void *)(a1 + 32) linkPreviewMetadata:v12 preferNewDocument:*(unsigned __int8 *)(a1 + 89) completion:&__block_literal_global_41];
    }
  }
}

void __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke_13(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    id v4 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke_13_cold_1(v4, v3);
    }
  }
}

- (void)userWillAddLinkWithActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__WBSSystemNoteTakingController_userWillAddLinkWithActivity_completion___block_invoke;
  v10[3] = &unk_1E5E45040;
  objc_copyWeak(&v13, &location);
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __72__WBSSystemNoteTakingController_userWillAddLinkWithActivity_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = objc_loadWeakRetained(WeakRetained + 5);
    [v3 noteTakingController:v4 addHighlightForUserActivity:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)applyHighlightInUserActivity:(id)a3 webView:(id)a4
{
  id v5 = a4;
  id v6 = [a3 _linkContextInfo];
  id v7 = v6;
  if (v6)
  {
    id v8 = objc_msgSend(v6, "safari_dataForKey:", @"linkContextData");
    if (v8)
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_INFO, "Found a note-taking user activity with valid highlight.", v10, 2u);
      }
      if (objc_opt_respondsToSelector()) {
        [v5 _restoreAndScrollToAppHighlight:v8];
      }
    }
  }
}

- (void)fetchHighlightsForUserActivity:(id)a3 privateBrowsing:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__25;
  v18[4] = __Block_byref_object_dispose__25;
  id v19 = (id)MEMORY[0x1AD115160]();
  objc_initWeak(&location, self);
  if ([(WBSSystemNoteTakingController *)self isNoteTakingSupportedWithPrivateBrowsing:v6])
  {
    uint64_t v10 = [v8 _canonicalURL];

    if (!v10) {
      [(WBSSystemNoteTakingController *)self insertCanonicalURLIfAvailableForUserActivity:v8];
    }
    linkContextClient = self->_linkContextClient;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke_2;
    v13[3] = &unk_1E5E450B0;
    objc_copyWeak(&v14, &location);
    v13[4] = v18;
    [(SYLinkContextClient *)linkContextClient fetchLinkContextsForUserActivity:v8 completion:v13];
    objc_destroyWeak(&v14);
  }
  else
  {
    id v12 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB70000, v12, OS_LOG_TYPE_INFO, "Not fetching highlights since client is in Private Browsing", buf, 2u);
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke;
    block[3] = &unk_1E5E41610;
    block[4] = v18;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  objc_destroyWeak(&location);
  _Block_object_dispose(v18, 8);
}

void __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = WBS_LOG_CHANNEL_PREFIXSystemNoteTaking();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke_2_cold_1(v7, v6);
    }
    goto LABEL_4;
  }
  if (![v5 count])
  {
LABEL_4:
    id v8 = 0;
    goto LABEL_5;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_6;
  }
  id v11 = WeakRetained;
  id v8 = objc_msgSend(v5, "safari_mapObjectsUsingBlock:", &__block_literal_global_22_1);

LABEL_5:
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke_2_23;
  block[3] = &unk_1E5E45088;
  uint64_t v15 = *(void *)(a1 + 32);
  id v13 = v8;
  id v14 = v6;
  id v9 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);

LABEL_6:
}

uint64_t __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke_19(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_dataForKey:", @"linkContextData");
}

void __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke_2_23(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 48) + 8);
  id v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

- (BOOL)_isSystemNoteTakingEnabledForSafari
{
  return 0;
}

- (void)_insertLinkContextInfo:(id)a3 userActivity:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (SynapseLibraryCore())
  {
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v5, "set_linkContextInfo:", v6);
    }
    else {
      [v5 setLinkContextInfo:v6];
    }
  }
}

- (void)_insertLinkContextPreview:(id)a3 userActivity:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (SynapseLibraryCore() && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(v5, "set_linkContextPreviewMetadata:", v6);
  }
}

- (void)insertCanonicalURLIfAvailableForUserActivity:(id)a3
{
  id v10 = a3;
  if (SynapseLibraryCore())
  {
    id v4 = (void *)MEMORY[0x1E4F1CB10];
    cachedCanonicalURLStringForWebPageURLString = self->_cachedCanonicalURLStringForWebPageURLString;
    id v6 = [v10 webpageURL];
    id v7 = [v6 absoluteString];
    id v8 = [(NSCache *)cachedCanonicalURLStringForWebPageURLString objectForKey:v7];
    id v9 = [v4 URLWithString:v8];

    if (v9 && (objc_opt_respondsToSelector() & 1) != 0) {
      objc_msgSend(v10, "set_canonicalURL:", v9);
    }
  }
}

- (void)cacheCanonicalURL:(id)a3 forWebPageURL:(id)a4
{
  if (a3)
  {
    id v6 = a3;
    id v8 = [a4 absoluteString];
    id v7 = [v6 absoluteString];

    -[NSCache setObject:forKey:cost:](self->_cachedCanonicalURLStringForWebPageURLString, "setObject:forKey:cost:", v7, v8, [v8 length] + objc_msgSend(v7, "length") + 16);
  }
}

- (id)userActivityForNoteTaking:(id)a3
{
  id v3 = a3;
  if (SynapseLibraryCore())
  {
    id v4 = [v3 _linkContextInfo];
    if (v4) {
      id v5 = v3;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)isNoteTakingSupportedForURL:(id)a3
{
  return objc_msgSend(a3, "safari_isHTTPFamilyURL");
}

- (WBSSystemNoteTakingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSSystemNoteTakingControllerDelegate *)WeakRetained;
}

- (BOOL)isNotesPIPVisible
{
  return self->_isNotesPIPVisible;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_notesActivationObserver, 0);
  objc_storeStrong((id *)&self->_cachedCanonicalURLStringForWebPageURLString, 0);
  objc_storeStrong((id *)&self->_linkContextClient, 0);
}

void __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke_2_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v5, v6, "Failed to fetch page metadata. Continuing with limited metadata. (%{public}@)", v7, v8, v9, v10, 2u);
}

void __125__WBSSystemNoteTakingController_saveHighlightsData_selectedText_selectedImage_newGroup_originatedInApp_webView_userActivity___block_invoke_13_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v5, v6, "Failed to create link context: %@", v7, v8, v9, v10, 2u);
}

void __91__WBSSystemNoteTakingController_fetchHighlightsForUserActivity_privateBrowsing_completion___block_invoke_2_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_5(&dword_1ABB70000, v5, v6, "Failed to fetch link context: %{public}@", v7, v8, v9, v10, 2u);
}

@end