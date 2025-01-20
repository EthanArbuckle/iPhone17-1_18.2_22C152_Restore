@interface UniversalSearchCompletionProvider
- (BOOL)shouldHideParsecResult:(id)a3 basedOnHideRankGivenTopHit:(id)a4 indexOfTopHitInFrequentlyVisitedSites:(unint64_t *)a5;
- (FrequentlyVisitedSitesController)frequentlyVisitedSitesController;
- (NSNumber)minRenderTimeout;
- (NSNumber)otherRenderTimeout;
- (NSNumber)searchRenderTimeout;
- (UniversalSearchCompletionProvider)initWithFrequentlyVisitedSitesController:(id)a3;
- (UniversalSearchSession)parsecSearchSession;
- (id)completionsForQuery:(id)a3;
- (id)currentInputTypeForSession:(id)a3;
- (unint64_t)maximumCachedCompletionCount;
- (void)_parsecBagDidLoad:(id)a3;
- (void)_updateInputMode:(id)a3;
- (void)_updateStateFromBag:(id)a3;
- (void)currentKeyboardIdentifierWithLayoutsForSession:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)session:(id)a3 didReceiveResults:(id)a4 forQuery:(id)a5;
- (void)setParsecSearchSession:(id)a3;
- (void)setQueryToComplete:(id)a3;
- (void)setSearchRenderTimeout:(id)a3;
@end

@implementation UniversalSearchCompletionProvider

- (UniversalSearchCompletionProvider)initWithFrequentlyVisitedSitesController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UniversalSearchCompletionProvider;
  v6 = [(CompletionProvider *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_frequentlyVisitedSitesController, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__updateInputMode_ name:*MEMORY[0x1E4FB3028] object:0];

    v9 = v7;
  }

  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)UniversalSearchCompletionProvider;
  [(UniversalSearchCompletionProvider *)&v4 dealloc];
}

- (void)_updateInputMode:(id)a3
{
  objc_msgSend(MEMORY[0x1E4FB1910], "sharedInputModeController", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v4 = [v7 currentInputMode];
  id v5 = [v4 identifierWithLayouts];
  keyboardInputMode = self->_keyboardInputMode;
  self->_keyboardInputMode = v5;
}

- (void)setParsecSearchSession:(id)a3
{
  p_parsecSearchSession = &self->_parsecSearchSession;
  v9 = (UniversalSearchSession *)a3;
  if (*p_parsecSearchSession != v9)
  {
    [(CompletionProvider *)self clearCachedCompletions];
    [(WBSParsecDSession *)*p_parsecSearchSession setDelegate:0];
    objc_storeStrong((id *)&self->_parsecSearchSession, a3);
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self];
    id v7 = [(WBSParsecDSession *)*p_parsecSearchSession parsecdSession];
    v8 = [v7 bag];
    [(UniversalSearchCompletionProvider *)self _updateStateFromBag:v8];

    [v6 addObserver:self selector:sel__parsecBagDidLoad_ name:@"UniversalSearchDidLoadBagNotification" object:v9];
    [(WBSParsecDSession *)v9 setDelegate:self];
  }
}

- (id)completionsForQuery:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentQuery, a3);
  if (self->_enabledByBag)
  {
    v8.receiver = self;
    v8.super_class = (Class)UniversalSearchCompletionProvider;
    v6 = [(CompletionProvider *)&v8 completionsForQuery:v5];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)setQueryToComplete:(id)a3
{
  id v4 = a3;
  currentQueryString = self->_currentQueryString;
  id v10 = v4;
  v6 = [v4 queryString];
  LOBYTE(currentQueryString) = [(NSString *)currentQueryString isEqualToString:v6];

  if ((currentQueryString & 1) == 0)
  {
    id v7 = [v10 queryString];
    objc_super v8 = (NSString *)[v7 copy];
    v9 = self->_currentQueryString;
    self->_currentQueryString = v8;

    [(WBSParsecDSession *)self->_parsecSearchSession setCurrentQuery:self->_currentQuery];
  }
}

- (BOOL)shouldHideParsecResult:(id)a3 basedOnHideRankGivenTopHit:(id)a4 indexOfTopHitInFrequentlyVisitedSites:(unint64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v10 = [v8 minimumRankOfTopHitToSuppressResult];
  BOOL v11 = 0;
  if (!v9) {
    goto LABEL_14;
  }
  unint64_t v12 = v10;
  if (!v10) {
    goto LABEL_14;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_13:
    BOOL v11 = 0;
    goto LABEL_14;
  }
  v21 = a5;
  v13 = [(FrequentlyVisitedSitesController *)self->_frequentlyVisitedSitesController frequentlyVisitedSites];
  if ([v13 count] < v12) {
    unint64_t v12 = [v13 count];
  }
  v14 = [v9 originalURLString];
  v15 = objc_msgSend(v14, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 15, 0, 0);

  if (v12)
  {
    unint64_t v16 = 0;
    BOOL v11 = 1;
    while (1)
    {
      v17 = [v13 objectAtIndex:v16];
      v18 = [v17 address];
      v19 = objc_msgSend(v18, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 15, 0, 0);

      if (objc_msgSend(v15, "safari_hasCaseInsensitivePrefix:", v19)) {
        break;
      }

      BOOL v11 = ++v16 < v12;
      if (v12 == v16) {
        goto LABEL_11;
      }
    }
    if (v21) {
      unint64_t *v21 = v16;
    }
  }
  else
  {
LABEL_11:
    BOOL v11 = 0;
    if (v21) {
      unint64_t *v21 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

LABEL_14:
  return v11;
}

- (id)currentInputTypeForSession:(id)a3
{
  id v4 = [(CompletionProvider *)self delegate];
  id v5 = [v4 windowHostingCompletionProvider:self];
  v6 = [v5 firstResponder];

  id v7 = [v6 textInputMode];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    id v9 = [v8 identifier];
    if ([v9 isEqualToString:@"dictation"])
    {
      uint64_t v10 = v9;
    }
    else
    {
      BOOL v11 = [v8 extension];

      if (v11)
      {
        uint64_t v10 = @"custom";
      }
      else
      {
        unint64_t v12 = [v8 normalizedIdentifierLevels];
        if ([v12 count])
        {
          uint64_t v10 = [v12 firstObject];
        }
        else
        {
          uint64_t v10 = 0;
        }
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)currentKeyboardIdentifierWithLayoutsForSession:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __102__UniversalSearchCompletionProvider_currentKeyboardIdentifierWithLayoutsForSession_completionHandler___block_invoke;
  v7[3] = &unk_1E6D78748;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __102__UniversalSearchCompletionProvider_currentKeyboardIdentifierWithLayoutsForSession_completionHandler___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (!v2[9]) {
    [v2 _updateInputMode:0];
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)session:(id)a3 didReceiveResults:(id)a4 forQuery:(id)a5
{
  if (a4) {
    id v7 = a4;
  }
  else {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }
  id v8 = a4;
  id v9 = [a5 queryString];
  [(CompletionProvider *)self setCompletions:v7 forString:v9];
}

- (void)_updateStateFromBag:(id)a3
{
  id v4 = a3;
  id v5 = [v4 searchRenderTimeout];
  searchRenderTimeout = self->_searchRenderTimeout;
  self->_searchRenderTimeout = v5;

  id v7 = [v4 otherRenderTimeout];
  otherRenderTimeout = self->_otherRenderTimeout;
  self->_otherRenderTimeout = v7;

  id v9 = [v4 minSearchRenderTimeout];
  minRenderTimeout = self->_minRenderTimeout;
  self->_minRenderTimeout = v9;

  char v11 = [v4 isEnabled];
  self->_enabledByBag = v11;
}

- (void)_parsecBagDidLoad:(id)a3
{
  id v5 = [a3 userInfo];
  id v4 = [v5 objectForKeyedSubscript:@"UniversalSearchBagUserInfoDictionaryKey"];
  [(UniversalSearchCompletionProvider *)self _updateStateFromBag:v4];
}

- (unint64_t)maximumCachedCompletionCount
{
  return 1;
}

- (FrequentlyVisitedSitesController)frequentlyVisitedSitesController
{
  return self->_frequentlyVisitedSitesController;
}

- (NSNumber)searchRenderTimeout
{
  return self->_searchRenderTimeout;
}

- (void)setSearchRenderTimeout:(id)a3
{
}

- (NSNumber)otherRenderTimeout
{
  return self->_otherRenderTimeout;
}

- (NSNumber)minRenderTimeout
{
  return self->_minRenderTimeout;
}

- (UniversalSearchSession)parsecSearchSession
{
  return self->_parsecSearchSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parsecSearchSession, 0);
  objc_storeStrong((id *)&self->_minRenderTimeout, 0);
  objc_storeStrong((id *)&self->_otherRenderTimeout, 0);
  objc_storeStrong((id *)&self->_searchRenderTimeout, 0);
  objc_storeStrong((id *)&self->_frequentlyVisitedSitesController, 0);
  objc_storeStrong((id *)&self->_keyboardInputMode, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_currentQueryString, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end