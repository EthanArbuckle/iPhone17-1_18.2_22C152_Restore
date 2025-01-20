@interface WBSScribbleValidator
- (NSArray)targetsToHideUsingDisplayNone;
- (NSArray)targetsToHideUsingPaintAvoidance;
- (NSArray)targetsToReveal;
- (WBSScribbleValidator)initWithWebView:(id)a3 elements:(id)a4 excludedTargets:(id)a5 completion:(id)a6;
- (void)_addSimilarTargets:(id)a3 element:(id)a4;
- (void)_collectSimilarTargetsWithCompletion:(id)a3;
- (void)_compareRenderedTextWithCompletion:(id)a3;
- (void)_findTargetsUsingHitTest:(id)a3 completion:(id)a4;
- (void)_findTargetsUsingSelectors:(id)a3 completion:(id)a4;
- (void)_findTargetsUsingTextSearch:(id)a3 completion:(id)a4;
- (void)_invokeCompletionBlock;
- (void)_removeHiddenResultsAndAddInFlowElements;
- (void)_removeHiddenResultsWithSimilarURLs;
- (void)_removeResultsWithDifferentGeometryAndRevealTargetsIfNeeded;
- (void)_removeTargetsToRevealIfNeeded;
- (void)_startValidation;
- (void)forEachSimilarTargetedElement:(id)a3;
- (void)invalidate;
@end

@implementation WBSScribbleValidator

- (WBSScribbleValidator)initWithWebView:(id)a3 elements:(id)a4 excludedTargets:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, void))a6;
  v39.receiver = self;
  v39.super_class = (Class)WBSScribbleValidator;
  v14 = [(WBSScribbleValidator *)&v39 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_webView, v10);
    uint64_t v16 = [v11 copy];
    elementsToValidate = v15->_elementsToValidate;
    v15->_elementsToValidate = (NSArray *)v16;

    uint64_t v18 = [v12 copy];
    targetsToExclude = v15->_targetsToExclude;
    v15->_targetsToExclude = (NSArray *)v18;

    uint64_t v20 = objc_opt_new();
    targetsToReveal = v15->_targetsToReveal;
    v15->_targetsToReveal = (NSMutableArray *)v20;

    uint64_t v22 = objc_opt_new();
    targetingResults = v15->_targetingResults;
    v15->_targetingResults = (NSMutableArray *)v22;

    uint64_t v24 = objc_opt_new();
    targetsToHideUsingDisplayNone = v15->_targetsToHideUsingDisplayNone;
    v15->_targetsToHideUsingDisplayNone = (NSMutableArray *)v24;

    uint64_t v26 = objc_opt_new();
    targetsToHideUsingPaintAvoidance = v15->_targetsToHideUsingPaintAvoidance;
    v15->_targetsToHideUsingPaintAvoidance = (NSMutableArray *)v26;

    uint64_t v28 = objc_opt_new();
    similarTargetsAndElements = v15->_similarTargetsAndElements;
    v15->_similarTargetsAndElements = (NSMutableArray *)v28;

    uint64_t v30 = objc_opt_new();
    targetToScribbleElementWithMatchingSelectorsMap = v15->_targetToScribbleElementWithMatchingSelectorsMap;
    v15->_targetToScribbleElementWithMatchingSelectorsMap = (NSMapTable *)v30;

    uint64_t v32 = MEMORY[0x1AD115160](v13);
    id completionBlock = v15->_completionBlock;
    v15->_id completionBlock = (id)v32;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__WBSScribbleValidator_initWithWebView_elements_excludedTargets_completion___block_invoke;
    block[3] = &unk_1E5E40968;
    v34 = v15;
    v38 = v34;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v35 = v34;
  }
  else
  {
    v13[2](v13, 0);
  }

  return v15;
}

uint64_t __76__WBSScribbleValidator_initWithWebView_elements_excludedTargets_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startValidation];
}

- (void)_startValidation
{
  v2 = *(void **)(a1 + 16);
  id v3 = a2;
  [v2 count];
  OUTLINED_FUNCTION_0_0(&dword_1ABB70000, v4, v5, "Validating %zu scribble element(s)", v6, v7, v8, v9, 0);
}

void __40__WBSScribbleValidator__startValidation__block_invoke(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXScribble();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __40__WBSScribbleValidator__startValidation__block_invoke_cold_1(a1, v2);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([MEMORY[0x1E4F98318] scribbleRequiresVisualSimilarity]) {
      [WeakRetained _removeHiddenResultsWithSimilarURLs];
    }
    else {
      [WeakRetained _removeHiddenResultsAndAddInFlowElements];
    }
    [WeakRetained _removeResultsWithDifferentGeometryAndRevealTargetsIfNeeded];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __40__WBSScribbleValidator__startValidation__block_invoke_51;
    v4[3] = &unk_1E5E42700;
    objc_copyWeak(v5, (id *)(a1 + 40));
    v5[1] = *(id *)(a1 + 48);
    [WeakRetained _compareRenderedTextWithCompletion:v4];
    objc_destroyWeak(v5);
  }
  else
  {
    [0 _invokeCompletionBlock];
  }
}

void __40__WBSScribbleValidator__startValidation__block_invoke_51(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _removeTargetsToRevealIfNeeded];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v5 = v4;
    double v6 = *(double *)(a1 + 40);
    uint64_t v7 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __40__WBSScribbleValidator__startValidation__block_invoke_51_cold_1(v7, v5, v6);
    }
    id WeakRetained = v3;
  }
  [WeakRetained _invokeCompletionBlock];
}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_webView, 0);
  [(WBSScribbleValidator *)self _invokeCompletionBlock];
}

- (void)_invokeCompletionBlock
{
  uint64_t v5 = MEMORY[0x1AD115160](self->_completionBlock, a2);
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = 0;

  double v4 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t, WBSScribbleValidator *))(v5 + 16))(v5, self);
    double v4 = (void *)v5;
  }
}

- (NSArray)targetsToHideUsingDisplayNone
{
  return (NSArray *)self->_targetsToHideUsingDisplayNone;
}

- (NSArray)targetsToReveal
{
  return (NSArray *)self->_targetsToReveal;
}

- (NSArray)targetsToHideUsingPaintAvoidance
{
  return (NSArray *)self->_targetsToHideUsingPaintAvoidance;
}

- (void)_collectSimilarTargetsWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  objc_initWeak(&location, self);
  elementsToValidate = self->_elementsToValidate;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__WBSScribbleValidator__collectSimilarTargetsWithCompletion___block_invoke;
  v8[3] = &unk_1E5E42778;
  objc_copyWeak(&v11, &location);
  uint64_t v7 = v5;
  uint64_t v9 = v7;
  id v10 = self;
  [(NSArray *)elementsToValidate enumerateObjectsUsingBlock:v8];
  dispatch_group_notify(v7, MEMORY[0x1E4F14428], v4);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __61__WBSScribbleValidator__collectSimilarTargetsWithCompletion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__WBSScribbleValidator__collectSimilarTargetsWithCompletion___block_invoke_2;
  v6[3] = &unk_1E5E42750;
  objc_copyWeak(&v9, a1 + 6);
  id v7 = a1[4];
  id v4 = v3;
  id v8 = v4;
  dispatch_group_t v5 = (void *)MEMORY[0x1AD115160](v6);
  dispatch_group_enter((dispatch_group_t)a1[4]);
  [a1[5] _findTargetsUsingHitTest:v4 completion:v5];
  dispatch_group_enter((dispatch_group_t)a1[4]);
  [a1[5] _findTargetsUsingTextSearch:v4 completion:v5];
  dispatch_group_enter((dispatch_group_t)a1[4]);
  [a1[5] _findTargetsUsingSelectors:v4 completion:v5];

  objc_destroyWeak(&v9);
}

void __61__WBSScribbleValidator__collectSimilarTargetsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _addSimilarTargets:v5 element:*(void *)(a1 + 40)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_addSimilarTargets:(id)a3 element:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v25 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v32;
    v23 = self;
    id v24 = v6;
    uint64_t v22 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (([v11 isNearbyTarget] & 1) == 0)
        {
          targetsToExclude = self->_targetsToExclude;
          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __51__WBSScribbleValidator__addSimilarTargets_element___block_invoke;
          v30[3] = &unk_1E5E427A0;
          v30[4] = v11;
          if (([(NSArray *)targetsToExclude safari_containsObjectPassingTest:v30] & 1) == 0)
          {
            long long v28 = 0u;
            long long v29 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            v13 = self->_targetingResults;
            uint64_t v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v35 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v27;
              while (2)
              {
                for (uint64_t j = 0; j != v15; ++j)
                {
                  if (*(void *)v27 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  uint64_t v18 = *(void **)(*((void *)&v26 + 1) + 8 * j);
                  v19 = [v18 target];
                  int v20 = [v19 isSameElement:v11];

                  if (v20)
                  {
                    [v18 addElement:v25];
                    self = v23;
                    goto LABEL_18;
                  }
                }
                uint64_t v15 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v35 count:16];
                if (v15) {
                  continue;
                }
                break;
              }
            }

            self = v23;
            targetingResults = v23->_targetingResults;
            v13 = [[WBSElementTargetingResult alloc] initWithTarget:v11 element:v25];
            [(NSMutableArray *)targetingResults addObject:v13];
LABEL_18:

            id v6 = v24;
            uint64_t v9 = v22;
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v8);
  }
}

uint64_t __51__WBSScribbleValidator__addSimilarTargets_element___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isSameElement:*(void *)(a1 + 32)];
}

- (void)_findTargetsUsingHitTest:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void))a4;
  if ([v11 isOutOfFlow])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    if (WeakRetained)
    {
      [v11 hitTestLocationInWebView:WeakRetained];
      id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F46798]), "initWithPoint:", v8, v9);
      [v10 setCanIncludeNearbyElements:0];
      [WeakRetained _requestTargetedElementInfo:v10 completionHandler:v6];
    }
    else
    {
      v6[2](v6, MEMORY[0x1E4F1CBF0]);
    }
  }
  else
  {
    v6[2](v6, MEMORY[0x1E4F1CBF0]);
  }
}

- (void)_findTargetsUsingTextSearch:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  if (WeakRetained)
  {
    double v8 = [v10 searchableText];
    if ([v8 length])
    {
      double v9 = (void *)[objc_alloc(MEMORY[0x1E4F46798]) initWithSearchText:v8];
      [v9 setCanIncludeNearbyElements:0];
      [WeakRetained _requestTargetedElementInfo:v9 completionHandler:v6];
    }
    else
    {
      v6[2](v6, MEMORY[0x1E4F1CBF0]);
    }
  }
  else
  {
    v6[2](v6, MEMORY[0x1E4F1CBF0]);
  }
}

- (void)_findTargetsUsingSelectors:(id)a3 completion:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
  v19 = v6;
  v17 = v7;
  if (WeakRetained)
  {
    double v9 = (void *)v8;
    id v10 = dispatch_group_create();
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v11 = [v6 allSelectorsIncludingShadowHosts];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v15, "count", v17))
          {
            dispatch_group_enter(v10);
            uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F46798]) initWithSelectors:v15];
            [v16 setCanIncludeNearbyElements:0];
            objc_initWeak(&location, self);
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            v23[2] = __62__WBSScribbleValidator__findTargetsUsingSelectors_completion___block_invoke;
            v23[3] = &unk_1E5E427C8;
            objc_copyWeak(&v27, &location);
            id v24 = v9;
            id v25 = v19;
            long long v26 = v10;
            [WeakRetained _requestTargetedElementInfo:v16 completionHandler:v23];

            objc_destroyWeak(&v27);
            objc_destroyWeak(&location);
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v12);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__WBSScribbleValidator__findTargetsUsingSelectors_completion___block_invoke_2;
    block[3] = &unk_1E5E423E8;
    id v22 = v17;
    id v21 = v9;
    dispatch_group_notify(v10, MEMORY[0x1E4F14428], block);
  }
  else
  {
    double v9 = (void *)v8;
    (*((void (**)(id, uint64_t))v7 + 2))(v7, v8);
  }
}

void __62__WBSScribbleValidator__findTargetsUsingSelectors_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) addObjectsFromArray:v3];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(WeakRetained[9], "setObject:forKey:", *(void *)(a1 + 40), *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

uint64_t __62__WBSScribbleValidator__findTargetsUsingSelectors_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_removeHiddenResultsAndAddInFlowElements
{
  targetingResults = self->_targetingResults;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__WBSScribbleValidator__removeHiddenResultsAndAddInFlowElements__block_invoke;
  v3[3] = &unk_1E5E427F0;
  v3[4] = self;
  [(NSMutableArray *)targetingResults safari_removeObjectsPassingTest:v3];
}

uint64_t __64__WBSScribbleValidator__removeHiddenResultsAndAddInFlowElements__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 target];
  uint64_t v5 = [v4 isInVisibilityAdjustmentSubtree];

  if (v5)
  {
    if (([v3 isBackedByGlobalAction] & 1) != 0
      || ([v3 target],
          uint64_t v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = objc_msgSend(v6, "safari_isOutOfFlow"),
          v6,
          v7))
    {
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 40);
    }
    else
    {
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 48);
    }
    uint64_t v9 = [v3 target];
    [v8 addObject:v9];
  }
  return v5;
}

- (void)_removeHiddenResultsWithSimilarURLs
{
  targetingResults = self->_targetingResults;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__WBSScribbleValidator__removeHiddenResultsWithSimilarURLs__block_invoke;
  v3[3] = &unk_1E5E427F0;
  v3[4] = self;
  [(NSMutableArray *)targetingResults safari_removeObjectsPassingTest:v3];
}

uint64_t __59__WBSScribbleValidator__removeHiddenResultsWithSimilarURLs__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 target];
  uint64_t v5 = [v4 isInVisibilityAdjustmentSubtree];

  if (v5)
  {
    id v19 = 0;
    uint64_t v6 = [v3 computeURLSimilarity:&v19];
    id v7 = v19;
    uint64_t v8 = v7;
    uint64_t v5 = 0;
    switch(v6)
    {
      case 0:
      case 2:
        goto LABEL_11;
      case 1:
        goto LABEL_8;
      case 3:
        if (([v7 isBackedByGlobalAction] & 1) != 0
          || ([v3 target],
              uint64_t v9 = objc_claimAutoreleasedReturnValue(),
              int v10 = objc_msgSend(v9, "safari_isOutOfFlow"),
              v9,
              v10))
        {
          long long v11 = *(void **)(*(void *)(a1 + 32) + 40);
        }
        else
        {
          long long v11 = *(void **)(*(void *)(a1 + 32) + 48);
        }
        long long v12 = [v3 target];
        [v11 addObject:v12];

        long long v13 = *(void **)(*(void *)(a1 + 32) + 64);
        uint64_t v14 = [WBSScribbleElementAndTarget alloc];
        uint64_t v15 = [v3 target];
        uint64_t v16 = [(WBSScribbleElementAndTarget *)v14 initWithElement:v8 target:v15];
        [v13 addObject:v16];

LABEL_8:
        v17 = WBS_LOG_CHANNEL_PREFIXScribble();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          __59__WBSScribbleValidator__removeHiddenResultsWithSimilarURLs__block_invoke_cold_1(v17, v3, v8);
        }
        goto LABEL_10;
      default:
LABEL_10:
        uint64_t v5 = 1;
LABEL_11:

        break;
    }
  }

  return v5;
}

- (void)_removeResultsWithDifferentGeometryAndRevealTargetsIfNeeded
{
  targetingResults = self->_targetingResults;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__WBSScribbleValidator__removeResultsWithDifferentGeometryAndRevealTargetsIfNeeded__block_invoke;
  v3[3] = &unk_1E5E427F0;
  v3[4] = self;
  [(NSMutableArray *)targetingResults safari_removeObjectsPassingTest:v3];
}

uint64_t __83__WBSScribbleValidator__removeResultsWithDifferentGeometryAndRevealTargetsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  if (!WeakRetained)
  {
LABEL_9:
    uint64_t v5 = 1;
    goto LABEL_10;
  }
  if (([v3 hasSimilarGeometryInView:WeakRetained] & 1) == 0)
  {
    if ([MEMORY[0x1E4F98318] scribbleRequiresVisualSimilarity])
    {
      uint64_t v6 = [v3 target];
      int v7 = [v6 isInVisibilityAdjustmentSubtree];

      if (v7)
      {
        uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 56);
        uint64_t v9 = [v3 target];
        [v8 addObject:v9];
      }
    }
    int v10 = WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      __83__WBSScribbleValidator__removeResultsWithDifferentGeometryAndRevealTargetsIfNeeded__block_invoke_cold_1(v10, v3);
    }
    goto LABEL_9;
  }
  uint64_t v5 = 0;
LABEL_10:

  return v5;
}

- (void)_compareRenderedTextWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_group_t v5 = dispatch_group_create();
  objc_initWeak(&location, self);
  targetingResults = self->_targetingResults;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__WBSScribbleValidator__compareRenderedTextWithCompletion___block_invoke;
  v8[3] = &unk_1E5E42860;
  int v7 = v5;
  uint64_t v9 = v7;
  objc_copyWeak(&v10, &location);
  [(NSMutableArray *)targetingResults enumerateObjectsUsingBlock:v8];
  dispatch_group_notify(v7, MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __59__WBSScribbleValidator__compareRenderedTextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  id v5[2] = __59__WBSScribbleValidator__compareRenderedTextWithCompletion___block_invoke_2;
  v5[3] = &unk_1E5E42838;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = *(id *)(a1 + 32);
  id v4 = v3;
  id v7 = v4;
  [v4 checkForSimilarRenderedText:v5];

  objc_destroyWeak(&v8);
}

void __59__WBSScribbleValidator__compareRenderedTextWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v7 = @"similar text";
    if (a2 == 1) {
      id v7 = @"different text";
    }
    if (a2 == 2) {
      id v7 = @"no text";
    }
    id v8 = v7;
    uint64_t v9 = (id)WBS_LOG_CHANNEL_PREFIXScribble();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v21 = [*(id *)(a1 + 40) target];
      id v22 = [v21 debugDescription];
      if (v5)
      {
        int v24 = [v5 isBackedByGlobalAction];
        v23 = @"per-site";
        if (v24) {
          v23 = @"global";
        }
      }
      else
      {
        v23 = @"no";
      }
      *(_DWORD *)buf = 138412803;
      long long v26 = v8;
      __int16 v27 = 2113;
      long long v28 = v22;
      __int16 v29 = 2112;
      long long v30 = v23;
      _os_log_debug_impl(&dword_1ABB70000, v9, OS_LOG_TYPE_DEBUG, "- Found %@: %{private}@ (%@ rule)", buf, 0x20u);
    }
    if (a2 == 1)
    {
      if (![MEMORY[0x1E4F98318] scribbleRequiresVisualSimilarity]) {
        goto LABEL_19;
      }
      long long v13 = [*(id *)(a1 + 40) target];
      int v14 = [v13 isInVisibilityAdjustmentSubtree];

      if (!v14) {
        goto LABEL_19;
      }
      uint64_t v15 = (void *)WeakRetained[7];
      uint64_t v16 = [*(id *)(a1 + 40) target];
      [v15 addObject:v16];
    }
    else
    {
      if (a2)
      {
LABEL_19:
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

        goto LABEL_20;
      }
      if (([v5 isBackedByGlobalAction] & 1) != 0
        || ([*(id *)(a1 + 40) target],
            id v10 = objc_claimAutoreleasedReturnValue(),
            int v11 = objc_msgSend(v10, "safari_isOutOfFlow"),
            v10,
            v11))
      {
        long long v12 = (void *)WeakRetained[5];
      }
      else
      {
        long long v12 = (void *)WeakRetained[6];
      }
      v17 = [*(id *)(a1 + 40) target];
      [v12 addObject:v17];

      uint64_t v18 = (void *)WeakRetained[8];
      id v19 = [WBSScribbleElementAndTarget alloc];
      uint64_t v16 = [*(id *)(a1 + 40) target];
      int v20 = [(WBSScribbleElementAndTarget *)v19 initWithElement:v5 target:v16];
      [v18 addObject:v20];
    }
    goto LABEL_19;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
LABEL_20:
}

__CFString *__59__WBSScribbleValidator__compareRenderedTextWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = @"similar text";
  if (v1 == 1) {
    v2 = @"different text";
  }
  if (v1 == 2) {
    return @"no text";
  }
  else {
    return v2;
  }
}

- (void)forEachSimilarTargetedElement:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, void *))a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = self->_similarTargetsAndElements;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = [v10 target];
        if (v11
          && (long long v12 = (void *)v11,
              [v10 element],
              long long v13 = objc_claimAutoreleasedReturnValue(),
              v13,
              v12,
              v13))
        {
          int v14 = [v10 target];
          uint64_t v15 = [v10 element];
          v4[2](v4, v14, v15);
        }
        else
        {
          uint64_t v16 = WBS_LOG_CHANNEL_PREFIXScribble();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            [(WBSScribbleValidator *)&v17 forEachSimilarTargetedElement:v16];
          }
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);
  }
}

- (void)_removeTargetsToRevealIfNeeded
{
  uint64_t v7 = a2;
  uint64_t v8 = [a3 debugDescription];
  *(_DWORD *)a1 = 138477827;
  *a4 = v8;
  _os_log_debug_impl(&dword_1ABB70000, v7, OS_LOG_TYPE_DEBUG, "- Keeping %{private}@ hidden to avoid partially hidden content", a1, 0xCu);
}

uint64_t __54__WBSScribbleValidator__removeTargetsToRevealIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_targetToScribbleElementWithMatchingSelectorsMap, 0);
  objc_storeStrong((id *)&self->_similarTargetsAndElements, 0);
  objc_storeStrong((id *)&self->_targetsToReveal, 0);
  objc_storeStrong((id *)&self->_targetsToHideUsingDisplayNone, 0);
  objc_storeStrong((id *)&self->_targetsToHideUsingPaintAvoidance, 0);
  objc_storeStrong((id *)&self->_targetingResults, 0);
  objc_storeStrong((id *)&self->_targetsToExclude, 0);
  objc_storeStrong((id *)&self->_elementsToValidate, 0);
  objc_destroyWeak((id *)&self->_webView);
}

void __40__WBSScribbleValidator__startValidation__block_invoke_cold_1(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = a2;
  [v2 count];
  OUTLINED_FUNCTION_0_0(&dword_1ABB70000, v4, v5, "- Found %zu potentially similar target(s)", v6, v7, v8, v9, 0);
}

void __40__WBSScribbleValidator__startValidation__block_invoke_51_cold_1(os_log_t log, double a2, double a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  double v4 = (a2 - a3) * 1000.0;
  _os_log_debug_impl(&dword_1ABB70000, log, OS_LOG_TYPE_DEBUG, "- Finished validation in %.0f ms", (uint8_t *)&v3, 0xCu);
}

void __59__WBSScribbleValidator__removeHiddenResultsWithSimilarURLs__block_invoke_cold_1(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  uint64_t v6 = [a2 target];
  uint64_t v7 = [v6 debugDescription];
  [a3 isBackedByGlobalAction];
  OUTLINED_FUNCTION_1_6(&dword_1ABB70000, v8, v9, "- Found similar URLs: %{private}@ (%@)", v10, v11, v12, v13, 3u);
}

void __83__WBSScribbleValidator__removeResultsWithDifferentGeometryAndRevealTargetsIfNeeded__block_invoke_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  double v4 = [a2 target];
  [v4 isInVisibilityAdjustmentSubtree];
  id v5 = [a2 target];
  uint64_t v12 = [v5 debugDescription];
  OUTLINED_FUNCTION_1_6(&dword_1ABB70000, v6, v7, "- Found different geometry%@: %{private}@", v8, v9, v10, v11, 3u);
}

- (void)forEachSimilarTargetedElement:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Error: targeted element hidden by validation is not similar to any scribble element", buf, 2u);
}

@end