@interface WBSScribbleController
- (BOOL)_hasAnyHiddenElements;
- (BOOL)_shouldSkipValidation;
- (BOOL)canHideContentInWebView;
- (BOOL)elementSelectionEnabled;
- (BOOL)hasPendingRequest;
- (BOOL)isScribbling;
- (CGPoint)lastRequestLocation;
- (WBSScribbleController)initWithWebView:(id)a3;
- (WBSScribbleControllerDelegate)delegate;
- (WBSScribbleElement)selectedScribbleElement;
- (id)_currentUserContentControllers;
- (id)_elementsToValidate;
- (id)_targetsHiddenByUserOrValidation;
- (id)cachedGlobalContentBlockerActions;
- (unint64_t)numberOfAllHiddenElements;
- (unint64_t)numberOfChangesFromCurrentSession;
- (void)_applyQuirksToRequest:(id)a3;
- (void)_applyWebCompatibilityFixups;
- (void)_disableHiddenActiveElementIfNeeded;
- (void)_hideElementUsingPaintAvoidance:(id)a3 completion:(id)a4;
- (void)_makePageScrollableAndInteractableIfNeeded;
- (void)_rescheduleValidation;
- (void)_resetPaintAvoidanceForElements:(id)a3 completion:(id)a4;
- (void)_stopValidationTimer;
- (void)_updateQuirksIfNeeded;
- (void)_updateUserStyleSheet;
- (void)_validateHiddenElements:(id)a3;
- (void)clearAllEdits;
- (void)endScribblingAndSaveChanges:(BOOL)a3;
- (void)getElementAtPoint:(CGPoint)a3 completion:(id)a4;
- (void)hideSelectedElement;
- (void)invalidate;
- (void)loadContentBlockerForHost:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadWithoutScribbleElements;
- (void)setDelegate:(id)a3;
- (void)setElementSelectionEnabled:(BOOL)a3;
- (void)startScribblingWithCompletionHandler:(id)a3;
- (void)startValidatingHiddenElements;
- (void)undoLastAction;
- (void)updateCountForElementsHiddenByPaintingAvoidance;
- (void)updateSelectionToPoint:(CGPoint)a3;
- (void)userDefinedContentBlockerManagerDidUpdateAllRules:(id)a3;
@end

@implementation WBSScribbleController

- (WBSScribbleController)initWithWebView:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WBSScribbleController;
  v5 = [(WBSScribbleController *)&v21 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    uint64_t v7 = objc_opt_new();
    targetedElementsHiddenFromCurrentSession = v6->_targetedElementsHiddenFromCurrentSession;
    v6->_targetedElementsHiddenFromCurrentSession = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    targetedElementsHiddenByValidation = v6->_targetedElementsHiddenByValidation;
    v6->_targetedElementsHiddenByValidation = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    targetedElementsToHideUsingDisplayNone = v6->_targetedElementsToHideUsingDisplayNone;
    v6->_targetedElementsToHideUsingDisplayNone = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    scribbleElementsFromCurrentSession = v6->_scribbleElementsFromCurrentSession;
    v6->_scribbleElementsFromCurrentSession = (NSMutableArray *)v13;

    uint64_t v15 = objc_opt_new();
    scribbleElementsForGlobalActionsFromCurrentSession = v6->_scribbleElementsForGlobalActionsFromCurrentSession;
    v6->_scribbleElementsForGlobalActionsFromCurrentSession = (NSMutableArray *)v15;

    uint64_t v17 = objc_opt_new();
    activeGlobalActionsByDatabaseID = v6->_activeGlobalActionsByDatabaseID;
    v6->_activeGlobalActionsByDatabaseID = (NSMutableDictionary *)v17;

    v19 = v6;
  }

  return v6;
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_webView, 0);
  objc_storeWeak((id *)&self->_delegate, 0);
  [(WBSScribbleValidator *)self->_validator invalidate];
  validator = self->_validator;
  self->_validator = 0;

  [(WBSScribbleController *)self _stopValidationTimer];
}

- (void)getElementAtPoint:(CGPoint)a3 completion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  self->_lastRequestLocation.double x = x;
  self->_lastRequestLocation.double y = y;
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F46798]), "initWithPoint:", x, y);
  [(WBSScribbleController *)self _applyQuirksToRequest:v8];
  self->_isGettingElementAtPoint = 1;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__WBSScribbleController_getElementAtPoint_completion___block_invoke;
  v11[3] = &unk_1E5E42D70;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  id v12 = v10;
  [WeakRetained _requestTargetedElementInfo:v8 completionHandler:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __54__WBSScribbleController_getElementAtPoint_completion___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    *((unsigned char *)WeakRetained + 16) = 0;
    if ([v8 count])
    {
      v5 = [WBSScribbleElement alloc];
      id v6 = objc_loadWeakRetained(v4 + 1);
      id v7 = [(WBSScribbleElement *)v5 initWithTargetedElements:v8 webView:v6];
    }
    else
    {
      id v7 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_updateQuirksIfNeeded
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  id v11 = [WeakRetained URL];

  if (v11)
  {
    id v4 = objc_msgSend(v11, "safari_highLevelDomain");
    v5 = [(WBSScribbleQuirks *)self->_quirksForCurrentSession highLevelDomain];
    char v6 = [v5 isEqualToString:v4];

    if ((v6 & 1) == 0)
    {
      id v7 = [(WBSScribbleController *)self delegate];
      id v8 = [v7 scribbleQuirksManager];
      uint64_t v9 = [v8 quirksForHighLevelDomain:v4];
      quirksForCurrentSession = self->_quirksForCurrentSession;
      self->_quirksForCurrentSession = v9;
    }
  }
  else
  {
    id v4 = self->_quirksForCurrentSession;
    self->_quirksForCurrentSession = 0;
  }
}

- (void)_applyQuirksToRequest:(id)a3
{
  id v7 = a3;
  quirksForCurrentSession = self->_quirksForCurrentSession;
  if (quirksForCurrentSession)
  {
    v5 = [(WBSScribbleQuirks *)quirksForCurrentSession shouldIgnorePointerEventsNone];

    if (v5)
    {
      char v6 = [(WBSScribbleQuirks *)self->_quirksForCurrentSession shouldIgnorePointerEventsNone];
      objc_msgSend(v7, "setShouldIgnorePointerEventsNone:", objc_msgSend(v6, "BOOLValue"));
    }
  }
}

- (BOOL)hasPendingRequest
{
  return self->_isGettingElementAtPoint;
}

- (void)startValidatingHiddenElements
{
  if ([(WBSScribbleController *)self canHideContentInWebView]
    && (self->_validatingDelay > 1.0 || !self->_validatingTimer))
  {
    self->_validatingDeladouble y = 1.0;
    [(WBSScribbleController *)self _rescheduleValidation];
  }
}

- (void)_stopValidationTimer
{
  validatingTimer = self->_validatingTimer;
  if (validatingTimer)
  {
    [(NSTimer *)validatingTimer invalidate];
    id v4 = self->_validatingTimer;
    self->_validatingTimer = 0;
  }
  self->_validatingDeladouble y = 1.0;
}

- (BOOL)_hasAnyHiddenElements
{
  BOOL v3 = [(WBSScribbleController *)self canHideContentInWebView];
  if (v3) {
    LOBYTE(v3) = self->_numberOfElementsHiddenByPaintingAvoidance
  }
              || [(NSMutableArray *)self->_targetedElementsHiddenFromCurrentSession count]
              || [(NSMutableArray *)self->_targetedElementsHiddenByValidation count] != 0;
  return v3;
}

- (id)_elementsToValidate
{
  BOOL v3 = [(WBSUserDefinedContentBlocker *)self->_contentBlockerForCurrentHost actions];
  id v4 = scribbleElementsFromActions(v3);

  v5 = [(WBSScribbleController *)self cachedGlobalContentBlockerActions];
  char v6 = scribbleElementsFromActions(v5);
  id v7 = [v4 arrayByAddingObjectsFromArray:v6];

  if (self->_scribbleElementsFromCurrentSession) {
    scribbleElementsFromCurrentSession = self->_scribbleElementsFromCurrentSession;
  }
  else {
    scribbleElementsFromCurrentSession = (NSMutableArray *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v9 = [v7 arrayByAddingObjectsFromArray:scribbleElementsFromCurrentSession];

  return v9;
}

- (BOOL)_shouldSkipValidation
{
  if (![(WBSScribbleController *)self canHideContentInWebView]) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  if (([WeakRetained _isSuspended] & 1) == 0
    && [WeakRetained _webProcessIsResponsive]
    && ([WeakRetained window], id v4 = objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    if ([(WBSScribbleController *)self _hasAnyHiddenElements])
    {
      BOOL v5 = 0;
    }
    else
    {
      id v7 = [(WBSScribbleController *)self cachedGlobalContentBlockerActions];
      BOOL v5 = [v7 count] == 0;
    }
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (id)cachedGlobalContentBlockerActions
{
  v2 = [(WBSScribbleController *)self delegate];
  BOOL v3 = [v2 userDefinedContentBlockerManager];
  id v4 = [v3 cachedGlobalContentBlockerActions];

  return v4;
}

- (void)_rescheduleValidation
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Attempted to reschedule without starting element validation.", v2, v3, v4, v5, v6);
}

void __46__WBSScribbleController__rescheduleValidation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  uint8_t v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = (void *)*((void *)WeakRetained + 3);
    WeakRetained[3] = 0.0;

    v6[4] = v6[4] + v6[4];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46__WBSScribbleController__rescheduleValidation__block_invoke_2;
    v8[3] = &unk_1E5E41340;
    objc_copyWeak(&v9, v4);
    [v6 _validateHiddenElements:v8];
    objc_destroyWeak(&v9);
  }
}

void __46__WBSScribbleController__rescheduleValidation__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[4] <= 8.0)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained _rescheduleValidation];
    id WeakRetained = v2;
  }
}

- (void)_validateHiddenElements:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_validator)
  {
    (*((void (**)(id))v4 + 2))(v4);
  }
  else
  {
    objc_initWeak(&location, self);
    uint8_t v6 = [WBSScribbleValidator alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    id v8 = [(WBSScribbleController *)self _elementsToValidate];
    id v9 = [(WBSScribbleController *)self _targetsHiddenByUserOrValidation];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __49__WBSScribbleController__validateHiddenElements___block_invoke;
    v12[3] = &unk_1E5E43218;
    objc_copyWeak(&v14, &location);
    id v13 = v5;
    id v10 = [(WBSScribbleValidator *)v6 initWithWebView:WeakRetained elements:v8 excludedTargets:v9 completion:v12];
    validator = self->_validator;
    self->_validator = v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __49__WBSScribbleController__validateHiddenElements___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained && v3)
  {
    id v6 = objc_loadWeakRetained(WeakRetained + 1);
    if (v6)
    {
      id v7 = dispatch_group_create();
      id v8 = [v6 URL];
      id v9 = [v8 host];

      id v10 = [v3 targetsToReveal];
      id v11 = [v3 targetsToHideUsingDisplayNone];
      id v12 = [v3 targetsToHideUsingPaintAvoidance];
      id v13 = v11;
      uint64_t v25 = [v11 arrayByAddingObjectsFromArray:v12];

      v24 = v10;
      if ([v10 count])
      {
        dispatch_group_enter(v7);
        id v14 = [v3 targetsToReveal];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __49__WBSScribbleController__validateHiddenElements___block_invoke_2;
        v46[3] = &unk_1E5E41278;
        v47 = v7;
        [v5 _resetPaintAvoidanceForElements:v14 completion:v46];
      }
      v45[0] = 0;
      v45[1] = v45;
      v45[2] = 0x2020000000;
      v45[3] = 0;
      uint64_t v39 = 0;
      v40 = &v39;
      uint64_t v41 = 0x3032000000;
      v42 = __Block_byref_object_copy__11;
      v43 = __Block_byref_object_dispose__11;
      id v44 = 0;
      uint64_t v33 = 0;
      v34 = &v33;
      uint64_t v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__11;
      v37 = __Block_byref_object_dispose__11;
      id v38 = 0;
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __49__WBSScribbleController__validateHiddenElements___block_invoke_10;
      v28[3] = &unk_1E5E431F0;
      v28[4] = v5;
      id v15 = v9;
      id v29 = v15;
      v30 = v45;
      v31 = &v33;
      v32 = &v39;
      [v3 forEachSimilarTargetedElement:v28];
      [v5 delegate];
      uint64_t v17 = v16 = (void *)v25;
      v18 = v13;
      v19 = v7;
      if (v17)
      {
        v20 = (void *)v34[5];
        if (v20)
        {
          [v20 bounds];
          objc_msgSend(v17, "scribbleController:runHidingAnimationWithElementRect:", v5);
          if (([v17 isPrivateBrowsing] & 1) == 0)
          {
            objc_super v21 = objc_msgSend((id)v34[5], "safari_uniqueSelectorsIncludingShadowHosts");
            [(id)v40[5] addHostWhereActionHasApplied:v15 selectors:v21];
            v22 = [v17 userDefinedContentBlockerManager];
            [v22 updateContentBlockerActionExtraAttributes:v40[5]];

            v16 = (void *)v25;
          }
        }
      }
      if ([v16 count])
      {
        dispatch_group_enter(v19);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __49__WBSScribbleController__validateHiddenElements___block_invoke_13;
        v26[3] = &unk_1E5E40968;
        v27 = v19;
        [v5 _hideElementUsingPaintAvoidance:v16 completion:v26];
        [v5[12] addObjectsFromArray:v16];
      }
      if ([v18 count])
      {
        [v5[13] addObjectsFromArray:v18];
        [v5 _updateUserStyleSheet];
      }
      id v23 = v5[16];
      v5[16] = 0;

      dispatch_group_notify(v19, MEMORY[0x1E4F14428], *(dispatch_block_t *)(a1 + 32));
      _Block_object_dispose(&v33, 8);

      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(v45, 8);
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __49__WBSScribbleController__validateHiddenElements___block_invoke_2(uint64_t a1)
{
}

void __49__WBSScribbleController__validateHiddenElements___block_invoke_10(void *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if ([v7 isBackedByGlobalAction])
  {
    id v8 = [v7 backingAction];
    id v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 databaseID];
      if (v10 != *MEMORY[0x1E4F988F0])
      {
        id v11 = *(void **)(a1[4] + 112);
        id v12 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "databaseID"));
        [v11 setObject:v9 forKeyedSubscript:v12];
      }
      if (([v6 isInVisibilityAdjustmentSubtree] & 1) == 0)
      {
        id v13 = [v9 hostsWhereActionHasApplied];
        char v14 = [v13 containsObject:a1[5]];

        if ((v14 & 1) == 0)
        {
          [v6 bounds];
          uint64_t v17 = *(void *)(a1[6] + 8);
          if (v15 * v16 > *(double *)(v17 + 24))
          {
            *(double *)(v17 + 24) = v15 * v16;
            objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a2);
            objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v9);
          }
        }
      }
    }
    else
    {
      v18 = WBS_LOG_CHANNEL_PREFIXScribble();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        __49__WBSScribbleController__validateHiddenElements___block_invoke_10_cold_1();
      }
    }
  }
}

void __49__WBSScribbleController__validateHiddenElements___block_invoke_13(uint64_t a1)
{
}

- (id)_targetsHiddenByUserOrValidation
{
  return (id)[(NSMutableArray *)self->_targetedElementsHiddenFromCurrentSession arrayByAddingObjectsFromArray:self->_targetedElementsHiddenByValidation];
}

- (void)_resetPaintAvoidanceForElements:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  if (WeakRetained)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          char v14 = *(void **)(*((void *)&v19 + 1) + 8 * v13);
          __68__WBSScribbleController__resetPaintAvoidanceForElements_completion___block_invoke(v10, self->_targetedElementsHiddenFromCurrentSession, v14);
          __68__WBSScribbleController__resetPaintAvoidanceForElements_completion___block_invoke(v15, self->_targetedElementsToHideUsingDisplayNone, v14);
          __68__WBSScribbleController__resetPaintAvoidanceForElements_completion___block_invoke(v16, self->_targetedElementsHiddenByValidation, v14);
          ++v13;
        }
        while (v11 != v13);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v11 = v10;
      }
      while (v10);
    }

    [(WBSScribbleController *)self _updateUserStyleSheet];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __68__WBSScribbleController__resetPaintAvoidanceForElements_completion___block_invoke_3;
    v17[3] = &unk_1E5E41200;
    v17[4] = self;
    id v18 = v7;
    [WeakRetained _resetVisibilityAdjustmentsForTargetedElements:v9 completionHandler:v17];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __68__WBSScribbleController__resetPaintAvoidanceForElements_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__WBSScribbleController__resetPaintAvoidanceForElements_completion___block_invoke_2;
  v6[3] = &unk_1E5E42888;
  id v7 = v4;
  id v5 = v4;
  objc_msgSend(a2, "safari_removeObjectsPassingTest:", v6);
}

uint64_t __68__WBSScribbleController__resetPaintAvoidanceForElements_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isSameElement:*(void *)(a1 + 32)];
}

uint64_t __68__WBSScribbleController__resetPaintAvoidanceForElements_completion___block_invoke_3(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) updateCountForElementsHiddenByPaintingAvoidance];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)_hideElementUsingPaintAvoidance:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__WBSScribbleController__hideElementUsingPaintAvoidance_completion___block_invoke;
    v9[3] = &unk_1E5E41200;
    v9[4] = self;
    uint64_t v10 = v7;
    [WeakRetained _adjustVisibilityForTargetedElements:v6 completionHandler:v9];
  }
  else if (v7)
  {
    v7[2](v7);
  }
}

uint64_t __68__WBSScribbleController__hideElementUsingPaintAvoidance_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) updateCountForElementsHiddenByPaintingAvoidance];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)updateCountForElementsHiddenByPaintingAvoidance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__WBSScribbleController_updateCountForElementsHiddenByPaintingAvoidance__block_invoke;
  v4[3] = &unk_1E5E43240;
  v4[4] = self;
  [WeakRetained _numberOfVisibilityAdjustmentRectsWithCompletionHandler:v4];
}

void __72__WBSScribbleController_updateCountForElementsHiddenByPaintingAvoidance__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 48);
  *(void *)(v4 + 48) = a2;
  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 scribbleControllerDidUpdateHiddenElementCount:*(void *)(a1 + 32)];

  if (a2 && !v5)
  {
    [*(id *)(a1 + 32) _updateUserStyleSheet];
    [*(id *)(a1 + 32) _applyWebCompatibilityFixups];
    id v7 = *(void **)(a1 + 32);
    [v7 startValidatingHiddenElements];
  }
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    id v6 = [WeakRetained userDefinedContentBlockerManager];
    [v6 removeUserDefinedContentBlockerObserver:self];
  }
  objc_storeWeak((id *)p_delegate, v5);
  id v7 = [v5 userDefinedContentBlockerManager];

  [v7 addUserDefinedContentBlockerObserver:self];
}

- (void)loadContentBlockerForHost:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);

  if (WeakRetained
    && [v4 length]
    && [MEMORY[0x1E4F98318] isScribbleEnabled])
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    id v7 = [v6 userDefinedContentBlockerManager];
    objc_initWeak(&location, self);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 normalBrowsingUserDefinedContentBlockerManager];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __51__WBSScribbleController_loadContentBlockerForHost___block_invoke;
      v13[3] = &unk_1E5E43268;
      objc_copyWeak(&v15, &location);
      id v14 = v6;
      [v8 contentBlockerForHost:v4 createIfNeeded:0 completionHandler:v13];

      objc_destroyWeak(&v15);
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__WBSScribbleController_loadContentBlockerForHost___block_invoke_2;
    v10[3] = &unk_1E5E43268;
    objc_copyWeak(&v12, &location);
    id v9 = v6;
    id v11 = v9;
    [v7 contentBlockerForHost:v4 createIfNeeded:0 completionHandler:v10];
    self->_numberOfElementsHiddenByPaintingAvoidance = 0;
    [(WBSScribbleController *)self updateCountForElementsHiddenByPaintingAvoidance];
    [(NSMutableDictionary *)self->_activeGlobalActionsByDatabaseID removeAllObjects];
    [(NSMutableArray *)self->_targetedElementsHiddenFromCurrentSession removeAllObjects];
    [(NSMutableArray *)self->_targetedElementsHiddenByValidation removeAllObjects];
    [(NSMutableArray *)self->_targetedElementsToHideUsingDisplayNone removeAllObjects];
    *(_WORD *)&self->_isUpdatingShouldMakePageScrollableAndInteractable = 0;
    [(WBSScribbleController *)self _updateUserStyleSheet];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __51__WBSScribbleController_loadContentBlockerForHost___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained[7];
    id v6 = [v9 actions];
    uint64_t v7 = [v6 count];

    if (v5 != v7)
    {
      id v8 = [v9 actions];
      v4[7] = [v8 count];

      [*(id *)(a1 + 32) scribbleControllerDidUpdateHiddenElementCount:v4];
    }
  }
}

void __51__WBSScribbleController_loadContentBlockerForHost___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 8, a2);
    [*(id *)(a1 + 32) scribbleControllerDidUpdateHiddenElementCount:v5];
    if ([v5 _hasAnyHiddenElements])
    {
      [v5 _applyWebCompatibilityFixups];
      [v5 startValidatingHiddenElements];
    }
  }
}

- (void)reloadWithoutScribbleElements
{
  [(WBSScribbleController *)self _stopValidationTimer];
  self->_numberOfElementsHiddenByPaintingAvoidance = 0;
  self->_numberOfHiddenElementsInheritedFromNormalBrowsing = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained scribbleControllerDidUpdateHiddenElementCount:self];
}

- (void)clearAllEdits
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_isScribbling) {
    [(WBSScribbleController *)self endScribblingAndSaveChanges:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v4 = [WeakRetained userDefinedContentBlockerManager];
  uint64_t v5 = v4;
  if (self->_contentBlockerForCurrentHost) {
    objc_msgSend(v4, "deleteActionsForContentBlocker:");
  }
  id v6 = objc_loadWeakRetained((id *)&self->_webView);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 normalBrowsingUserDefinedContentBlockerManager];
    id v8 = [v6 URL];
    id v9 = [v8 host];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __38__WBSScribbleController_clearAllEdits__block_invoke;
    v28[3] = &unk_1E5E43290;
    id v10 = v7;
    id v29 = v10;
    [v10 contentBlockerForHost:v9 createIfNeeded:0 completionHandler:v28];
  }
  else
  {
    id v10 = v5;
  }
  if ([(WBSScribbleController *)self numberOfAllHiddenElements])
  {
    id v11 = [MEMORY[0x1E4F98290] sharedLogger];
    [v11 didClearScribble];

    uint64_t v12 = MEMORY[0x1E4F143A8];
    self->_numberOfElementsHiddenByPaintingAvoidance = 0;
    self->_numberOfHiddenElementsInheritedFromNormalBrowsing = 0;
    v25[0] = v12;
    v25[1] = 3221225472;
    v25[2] = __38__WBSScribbleController_clearAllEdits__block_invoke_2;
    v25[3] = &unk_1E5E432B8;
    id v26 = WeakRetained;
    v27 = self;
    [v6 _resetVisibilityAdjustmentsForTargetedElements:0 completionHandler:v25];
    uint64_t v13 = [(NSMutableDictionary *)self->_activeGlobalActionsByDatabaseID allValues];
    [v10 deleteActions:v13];

    [(WBSScribbleController *)self _stopValidationTimer];
    validator = self->_validator;
    self->_validator = 0;

    [(NSMutableArray *)self->_targetedElementsHiddenFromCurrentSession removeAllObjects];
    [(NSMutableArray *)self->_targetedElementsHiddenByValidation removeAllObjects];
    [(NSMutableArray *)self->_targetedElementsToHideUsingDisplayNone removeAllObjects];
    [(NSMutableDictionary *)self->_activeGlobalActionsByDatabaseID removeAllObjects];
    *(_WORD *)&self->_isUpdatingShouldMakePageScrollableAndInteractable = 0;
    [(WBSUserDefinedContentBlocker *)self->_contentBlockerForCurrentHost setActions:MEMORY[0x1E4F1CBF0]];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v15 = [(WBSScribbleController *)self _currentUserContentControllers];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v30 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v22;
      uint64_t v19 = MEMORY[0x1E4F1CBF0];
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v22 != v18) {
            objc_enumerationMutation(v15);
          }
          objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "safari_updateScribbleStyleSheetForWebView:targets:forceScrollable:", v6, v19, 0);
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v21 objects:v30 count:16];
      }
      while (v17);
    }
  }
}

uint64_t __38__WBSScribbleController_clearAllEdits__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) deleteActionsForContentBlocker:a2];
  }
  return result;
}

uint64_t __38__WBSScribbleController_clearAllEdits__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) scribbleControllerDidUpdateHiddenElementCount:*(void *)(a1 + 40)];
}

- (unint64_t)numberOfAllHiddenElements
{
  return self->_numberOfHiddenElementsInheritedFromNormalBrowsing + self->_numberOfElementsHiddenByPaintingAvoidance;
}

- (void)userDefinedContentBlockerManagerDidUpdateAllRules:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  id v7 = [WeakRetained userDefinedContentBlockerManager];

  if (v7 == v5)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_webView);
    id v8 = [v10 URL];
    id v9 = [v8 host];
    [(WBSScribbleController *)self loadContentBlockerForHost:v9];
  }
}

- (void)updateSelectionToPoint:(CGPoint)a3
{
  if (self->_elementSelectionEnabled)
  {
    double y = a3.y;
    double x = a3.x;
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__WBSScribbleController_updateSelectionToPoint___block_invoke;
    v6[3] = &unk_1E5E432E0;
    objc_copyWeak(v7, &location);
    v7[1] = *(id *)&x;
    v7[2] = *(id *)&y;
    -[WBSScribbleController getElementAtPoint:completion:](self, "getElementAtPoint:completion:", v6, x, y);
    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }
}

void __48__WBSScribbleController_updateSelectionToPoint___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v7)
    {
      id v9 = WBS_LOG_CHANNEL_PREFIXScribble();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __48__WBSScribbleController_updateSelectionToPoint___block_invoke_cold_1(a1, v9, v7);
      }
    }
    objc_storeStrong(WeakRetained + 19, a2);
    id v10 = objc_loadWeakRetained(WeakRetained + 18);
    [v10 scribbleController:WeakRetained didUpdateSelectedElement:v6 withError:v7];
  }
}

- (void)_applyWebCompatibilityFixups
{
  [(WBSScribbleController *)self _makePageScrollableAndInteractableIfNeeded];
  [(WBSScribbleController *)self _disableHiddenActiveElementIfNeeded];
}

- (void)_disableHiddenActiveElementIfNeeded
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  if (WeakRetained)
  {
    id v4 = [(WBSScribbleQuirks *)self->_quirksForCurrentSession shouldDisableHiddenActiveElement];
    int v5 = [v4 BOOLValue];

    if (v5)
    {
      id v6 = objc_opt_new();
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v7 = [(WBSUserDefinedContentBlocker *)self->_contentBlockerForCurrentHost actions];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v35 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v29;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v29 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = [*(id *)(*((void *)&v28 + 1) + 8 * v11) allSelectorsIncludingShadowHosts];
            uint64_t v13 = selectorsForJavaScript(v12);
            [v6 addObjectsFromArray:v13];

            ++v11;
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v35 count:16];
        }
        while (v9);
      }

      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v14 = self->_scribbleElementsFromCurrentSession;
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v25;
        do
        {
          uint64_t v18 = 0;
          do
          {
            if (*(void *)v25 != v17) {
              objc_enumerationMutation(v14);
            }
            uint64_t v19 = objc_msgSend(*(id *)(*((void *)&v24 + 1) + 8 * v18), "allSelectorsIncludingShadowHosts", (void)v24);
            long long v20 = selectorsForJavaScript(v19);
            [v6 addObjectsFromArray:v20];

            ++v18;
          }
          while (v16 != v18);
          uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v24 objects:v34 count:16];
        }
        while (v16);
      }

      if ([v6 count])
      {
        long long v21 = [v6 componentsJoinedByString:@","];
        v32 = @"selectors";
        uint64_t v33 = v21;
        long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        long long v23 = [MEMORY[0x1E4F46678] defaultClientWorld];
        objc_msgSend(WeakRetained, "callAsyncJavaScript:arguments:inFrame:inContentWorld:completionHandler:", @"return (selectors => {    const activeElement = window?.document?.activeElement;    if (!activeElement || activeElement === document.body || activeElement.disabled)        return false;    for (const element of [...document.querySelectorAll(selectors)]) {        if (element.contains(activeElement)) {            activeElement.disabled = true;            activeElement.setAttribute('aria-disabled', 'true');            return true;        }    }    return false;})(selectors)",
          v22,
          0,
          v23,
          &__block_literal_global_36_0);
      }
    }
  }
}

void __60__WBSScribbleController__disableHiddenActiveElementIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    int v5 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __60__WBSScribbleController__disableHiddenActiveElementIfNeeded__block_invoke_cold_2((uint64_t)v4, v5);
    }
  }
  else if ([a2 BOOLValue])
  {
    id v6 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __60__WBSScribbleController__disableHiddenActiveElementIfNeeded__block_invoke_cold_1();
    }
  }
}

- (void)_makePageScrollableAndInteractableIfNeeded
{
  if (!self->_shouldMakePageScrollableAndInteractable && !self->_isUpdatingShouldMakePageScrollableAndInteractable)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    id v4 = [WeakRetained URL];
    int v5 = [v4 host];

    if (v5)
    {
      if ([(WBSScribbleController *)self _hasAnyHiddenElements])
      {
        id v6 = objc_msgSend(MEMORY[0x1E4F46678], "safari_worldForScribbleScript");
        self->_isUpdatingShouldMakePageScrollableAndInteractable = 1;
        objc_initWeak(&location, self);
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __67__WBSScribbleController__makePageScrollableAndInteractableIfNeeded__block_invoke;
        id v7[3] = &unk_1E5E43328;
        objc_copyWeak(&v8, &location);
        objc_msgSend(WeakRetained, "evaluateJavaScript:inFrame:inContentWorld:completionHandler:", @"(() => {    if (document?.body) {        const bodyStyle = getComputedStyle(document.body);        if (bodyStyle.overflow === 'hidden' || bodyStyle.pointerEvents === 'none')            return true;        const thresholdForScrollableBodyContent = 2 * visualViewport.height * visualViewport.scale;        if (bodyStyle.position === 'fixed' && document.body.getBoundingClientRect().height > thresholdForScrollableBodyContent)            return true;    }    if (document?.documentElement) {        const documentElementStyle = getComputedStyle(document.documentElement);        if (documentElementStyle.overflow === 'hidden' || documentElementStyle.pointerEvents === 'none')            return true;    }    return false;})();",
          0,
          v6,
          v7);
        objc_destroyWeak(&v8);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __67__WBSScribbleController__makePageScrollableAndInteractableIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F983D8]);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__WBSScribbleController__makePageScrollableAndInteractableIfNeeded__block_invoke_2;
    v10[3] = &unk_1E5E40968;
    void v10[4] = WeakRetained;
    [v8 setHandler:v10];
    if (v6)
    {
      uint64_t v9 = WBS_LOG_CHANNEL_PREFIXScribble();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __67__WBSScribbleController__makePageScrollableAndInteractableIfNeeded__block_invoke_cold_1((uint64_t)v6, v9);
      }
    }
    else if ([v5 BOOLValue])
    {
      WeakRetained[42] = 1;
      [WeakRetained _updateUserStyleSheet];
    }
  }
}

uint64_t __67__WBSScribbleController__makePageScrollableAndInteractableIfNeeded__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 41) = 0;
  return result;
}

- (void)hideSelectedElement
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = [a2 targetedElements];
  id v5 = [v4 firstObject];
  id v6 = [v5 debugDescription];
  int v7 = 138477827;
  id v8 = v6;
  _os_log_debug_impl(&dword_1ABB70000, v3, OS_LOG_TYPE_DEBUG, "Hiding item: %{private}@", (uint8_t *)&v7, 0xCu);
}

void __44__WBSScribbleController_hideSelectedElement__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(a1 + 32) setImageAnalysisText:v4];
  }
}

uint64_t __44__WBSScribbleController_hideSelectedElement__block_invoke_42(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_isOutOfFlow") ^ 1;
}

- (void)undoLastAction
{
  if ([(NSMutableArray *)self->_scribbleElementsFromCurrentSession count])
  {
    objc_initWeak(&location, self);
    [(WBSScribbleController *)self _stopValidationTimer];
    id v3 = [(NSMutableArray *)self->_scribbleElementsFromCurrentSession lastObject];
    [(NSMutableArray *)self->_scribbleElementsFromCurrentSession removeLastObject];
    [(NSMutableArray *)self->_scribbleElementsForGlobalActionsFromCurrentSession removeObject:v3];
    id v4 = [v3 targetedElements];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__WBSScribbleController_undoLastAction__block_invoke;
    v5[3] = &unk_1E5E43398;
    objc_copyWeak(&v6, &location);
    [(WBSScribbleController *)self _resetPaintAvoidanceForElements:v4 completion:v5];
    objc_destroyWeak(&v6);

    objc_destroyWeak(&location);
  }
}

void __39__WBSScribbleController_undoLastAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained startValidatingHiddenElements];
}

- (id)_currentUserContentControllers
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ([WeakRetained isPrivateBrowsing])
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F466A0], "safari_privateBrowsingUserContentController");
    v6[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = [WeakRetained normalBrowsingUserContentControllers];
  }

  return v4;
}

- (void)_updateUserStyleSheet
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(WBSScribbleController *)self _hasAnyHiddenElements])
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = [(WBSScribbleController *)self _currentUserContentControllers];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
          id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
          objc_msgSend(v8, "safari_updateScribbleStyleSheetForWebView:targets:forceScrollable:", WeakRetained, self->_targetedElementsToHideUsingDisplayNone, self->_shouldMakePageScrollableAndInteractable);

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (unint64_t)numberOfChangesFromCurrentSession
{
  return [(NSMutableArray *)self->_scribbleElementsFromCurrentSession count];
}

- (BOOL)canHideContentInWebView
{
  if ([MEMORY[0x1E4F98318] isScribbleEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    uint64_t v4 = [WeakRetained _committedURL];
    uint64_t v5 = [v4 host];
    uint64_t v6 = [v5 length];

    if (!v6)
    {
      LOBYTE(v8) = 0;
LABEL_12:

      return v8;
    }
    uint64_t v7 = [WeakRetained _MIMEType];
    if ([v7 length])
    {
      if ([v7 hasPrefix:@"text/"])
      {
        LOBYTE(v8) = 1;
LABEL_11:

        goto LABEL_12;
      }
      if (([v7 isEqualToString:@"application/pdf"] & 1) == 0
        && ([v7 hasPrefix:@"image/"] & 1) == 0)
      {
        int v8 = [v7 hasPrefix:@"audio/"] ^ 1;
        goto LABEL_11;
      }
    }
    LOBYTE(v8) = 0;
    goto LABEL_11;
  }
  LOBYTE(v8) = 0;
  return v8;
}

- (void)startScribblingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  uint64_t v6 = [WeakRetained URL];

  self->_startedScribblingWithHiddenItems = [(WBSScribbleController *)self numberOfAllHiddenElements] != 0;
  [(WBSScribbleController *)self _updateQuirksIfNeeded];
  uint64_t v7 = [v6 host];
  id v8 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v9 = [v8 userDefinedContentBlockerManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__WBSScribbleController_startScribblingWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E5E433C0;
  void v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v9 contentBlockerForHost:v7 createIfNeeded:1 completionHandler:v11];
}

void __62__WBSScribbleController_startScribblingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    uint64_t v5 = WeakRetained;
    uint64_t v6 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v6 + 40)) {
      BOOL v7 = 1;
    }
    else {
      BOOL v7 = WeakRetained == 0;
    }
    if (!v7)
    {
      objc_msgSend(WeakRetained, "addObserver:forKeyPath:options:context:");
      uint64_t v6 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(v6 + 40) = 1;
    *(unsigned char *)(*(void *)(a1 + 32) + 136) = 1;
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)endScribblingAndSaveChanges:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  uint64_t v6 = WeakRetained;
  if (self->_isScribbling && WeakRetained != 0) {
    [WeakRetained removeObserver:self forKeyPath:@"frame" context:webViewFrameObservationContext];
  }
  self->_isScribbling = 0;
  id v8 = objc_alloc_init(MEMORY[0x1E4F983D8]);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke;
  v37[3] = &unk_1E5E40968;
  v37[4] = self;
  id v25 = v8;
  [v8 setHandler:v37];
  long long v26 = [(NSMutableArray *)self->_scribbleElementsFromCurrentSession safari_mapObjectsUsingBlock:&__block_literal_global_65_0];
  id v9 = objc_loadWeakRetained((id *)&self->_delegate);
  id v10 = [v9 userDefinedContentBlockerManager];
  long long v11 = [MEMORY[0x1E4F98290] sharedLogger];
  id v12 = v11;
  if (v3)
  {
    objc_msgSend(v11, "didFinishScribble:", -[WBSScribbleController numberOfChangesFromCurrentSession](self, "numberOfChangesFromCurrentSession"));

    if (self->_startedScribblingWithHiddenItems)
    {
      long long v13 = [MEMORY[0x1E4F98290] sharedLogger];
      [v13 didHideMoreItems];
    }
    objc_initWeak(&location, self);
    [v10 addActions:v26 forContentBlocker:self->_contentBlockerForCurrentHost];
    id v14 = [(WBSUserDefinedContentBlocker *)self->_contentBlockerForCurrentHost host];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_3;
    v34[3] = &unk_1E5E43408;
    objc_copyWeak(&v35, &location);
    [v10 contentBlockerForHost:v14 createIfNeeded:0 completionHandler:v34];

    if ([(NSMutableArray *)self->_scribbleElementsForGlobalActionsFromCurrentSession count])
    {
      uint64_t v15 = [(NSMutableArray *)self->_scribbleElementsForGlobalActionsFromCurrentSession safari_mapObjectsUsingBlock:&__block_literal_global_67];
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_5;
      v31[3] = &unk_1E5E43430;
      id v32 = v10;
      id v16 = v15;
      id v33 = v16;
      [v32 getGlobalContentBlockerWithCompletionHandler:v31];
    }
    objc_destroyWeak(&v35);
    objc_destroyWeak(&location);
  }
  else
  {
    [v11 didCancelScribble];

    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_scribbleElementsFromCurrentSession, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v18 = self->_scribbleElementsFromCurrentSession;
    uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v28 != v20) {
            objc_enumerationMutation(v18);
          }
          long long v22 = [*(id *)(*((void *)&v27 + 1) + 8 * i) targetedElements];
          [v17 addObjectsFromArray:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v27 objects:v38 count:16];
      }
      while (v19);
    }

    if ([v17 count]) {
      [(WBSScribbleController *)self _resetPaintAvoidanceForElements:v17 completion:&__block_literal_global_69];
    }
    [(NSMutableArray *)self->_scribbleElementsForGlobalActionsFromCurrentSession removeAllObjects];
    [(NSMutableArray *)self->_scribbleElementsFromCurrentSession removeAllObjects];
    long long v23 = [(WBSUserDefinedContentBlocker *)self->_contentBlockerForCurrentHost actions];
    long long v24 = objc_msgSend(v23, "safari_filterObjectsUsingBlock:", &__block_literal_global_73);
    [(WBSUserDefinedContentBlocker *)self->_contentBlockerForCurrentHost setActions:v24];
  }
}

uint64_t __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 120);
  *(void *)(v2 + 120) = 0;

  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
  id v4 = *(void **)(*(void *)(a1 + 32) + 80);
  return [v4 removeAllObjects];
}

uint64_t __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 makeContentBlockerAction:0];
}

void __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 8, a2);
  }
}

uint64_t __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 makeContentBlockerAction:1];
}

uint64_t __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addActions:*(void *)(a1 + 40) forContentBlocker:a2];
}

void __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_6(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_6_cold_1();
    }
  }
}

BOOL __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 databaseID];
  return v2 != *MEMORY[0x1E4F988F0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)webViewFrameObservationContext == a6)
  {
    uint64_t v11 = *MEMORY[0x1E4F284C8];
    id v12 = a5;
    long long v13 = [v12 objectForKeyedSubscript:v11];
    [v13 CGRectValue];
    double v15 = v14;
    double v17 = v16;

    uint64_t v18 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F284E0]];

    [v18 CGRectValue];
    double v20 = v19;
    double v22 = v21;

    if (v20 != v15 || v22 != v17)
    {
      selectedScribbleElement = self->_selectedScribbleElement;
      self->_selectedScribbleElement = 0;

      id v25 = [(WBSScribbleController *)self delegate];
      [v25 scribbleController:self didUpdateSelectedElement:0 withError:0];
    }
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)WBSScribbleController;
    id v10 = a5;
    [(WBSScribbleController *)&v26 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

- (WBSScribbleControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSScribbleControllerDelegate *)WeakRetained;
}

- (WBSScribbleElement)selectedScribbleElement
{
  return self->_selectedScribbleElement;
}

- (CGPoint)lastRequestLocation
{
  double x = self->_lastRequestLocation.x;
  double y = self->_lastRequestLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isScribbling
{
  return self->_isScribbling;
}

- (BOOL)elementSelectionEnabled
{
  return self->_elementSelectionEnabled;
}

- (void)setElementSelectionEnabled:(BOOL)a3
{
  self->_elementSelectionEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedScribbleElement, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_validator, 0);
  objc_storeStrong((id *)&self->_quirksForCurrentSession, 0);
  objc_storeStrong((id *)&self->_activeGlobalActionsByDatabaseID, 0);
  objc_storeStrong((id *)&self->_targetedElementsToHideUsingDisplayNone, 0);
  objc_storeStrong((id *)&self->_targetedElementsHiddenByValidation, 0);
  objc_storeStrong((id *)&self->_targetedElementsHiddenFromCurrentSession, 0);
  objc_storeStrong((id *)&self->_scribbleElementsForGlobalActionsFromCurrentSession, 0);
  objc_storeStrong((id *)&self->_scribbleElementsFromCurrentSession, 0);
  objc_storeStrong((id *)&self->_contentBlockerForCurrentHost, 0);
  objc_storeStrong((id *)&self->_validatingTimer, 0);
  objc_destroyWeak((id *)&self->_webView);
}

void __49__WBSScribbleController__validateHiddenElements___block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Error: expected scribble element to be backed by a global content blocker action", v2, v3, v4, v5, v6);
}

void __48__WBSScribbleController_updateSelectionToPoint___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CGFloat v4 = *(double *)(a1 + 40);
  CGFloat v5 = *(double *)(a1 + 48);
  uint8_t v6 = a2;
  v14.double x = v4;
  v14.double y = v5;
  BOOL v7 = NSStringFromPoint(v14);
  id v8 = objc_msgSend(a3, "safari_privacyPreservingError");
  int v9 = 138543618;
  id v10 = v7;
  __int16 v11 = 2114;
  id v12 = v8;
  _os_log_error_impl(&dword_1ABB70000, v6, OS_LOG_TYPE_ERROR, "Failed to find element at %{public}@ with error %{public}@", (uint8_t *)&v9, 0x16u);
}

void __60__WBSScribbleController__disableHiddenActiveElementIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1ABB70000, v0, OS_LOG_TYPE_DEBUG, "Disabled hidden active element.", v1, 2u);
}

void __60__WBSScribbleController__disableHiddenActiveElementIfNeeded__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB70000, a2, OS_LOG_TYPE_ERROR, "Failed to disable active element: %@", (uint8_t *)&v2, 0xCu);
}

void __67__WBSScribbleController__makePageScrollableAndInteractableIfNeeded__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
    (uint8_t *)&v2,
    0xCu);
}

void __53__WBSScribbleController_endScribblingAndSaveChanges___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_4(&dword_1ABB70000, v0, v1, "Failed to reset Distraction Control after canceling", v2, v3, v4, v5, v6);
}

@end