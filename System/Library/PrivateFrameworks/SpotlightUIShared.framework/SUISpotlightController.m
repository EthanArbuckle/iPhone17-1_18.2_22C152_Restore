@interface SUISpotlightController
- (NSString)currentSearchString;
- (SFFeedbackListener)feedbackDelegate;
- (SPClientSession)clientSession;
- (SUISpotlightController)init;
- (SUISpotlightControllerResultsViewDelegate)resultsViewDelegate;
- (SUISpotlightControllerSearchAppDelegate)appDelegate;
- (SUISpotlightControllerSearchFieldDelegate)searchFieldDelegate;
- (void)setAppDelegate:(id)a3;
- (void)setClientSession:(id)a3;
- (void)setCurrentSearchString:(id)a3;
- (void)setFeedbackDelegate:(id)a3;
- (void)setResultsViewDelegate:(id)a3;
- (void)setSearchFieldDelegate:(id)a3;
- (void)startQueryTaskWithSearchString:(id)a3 queryOptions:(int64_t)a4 sourceResult:(id)a5 triggerEvent:(unint64_t)a6 languages:(id)a7 currentKeyboardLanguage:(id)a8 queryId:(unint64_t)a9;
- (void)updateWithCommand:(id)a3 triggerEvent:(unint64_t)a4;
- (void)updateWithSuggestionResult:(id)a3 triggerEvent:(unint64_t)a4 languages:(id)a5 currentKeyboardLanguage:(id)a6 queryId:(unint64_t)a7;
@end

@implementation SUISpotlightController

- (SUISpotlightController)init
{
  v5.receiver = self;
  v5.super_class = (Class)SUISpotlightController;
  v2 = [(SUISpotlightController *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(SUISpotlightController *)v2 setClientSession:v3];
  }
  return v2;
}

- (void)updateWithCommand:(id)a3 triggerEvent:(unint64_t)a4
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
  }
}

- (void)updateWithSuggestionResult:(id)a3 triggerEvent:(unint64_t)a4 languages:(id)a5 currentKeyboardLanguage:(id)a6 queryId:(unint64_t)a7
{
  id v21 = a3;
  id v12 = a6;
  id v13 = a5;
  v14 = [v21 completion];
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    v17 = [v21 suggestion];
    v16 = [v17 suggestion];
  }
  v18 = &stru_26E2AB8B8;
  if (v16) {
    v18 = v16;
  }
  v19 = v18;

  v20 = [(SUISpotlightController *)self searchFieldDelegate];
  [v20 updateSearchString:v19];

  [(SUISpotlightController *)self startQueryTaskWithSearchString:v19 queryOptions:0 sourceResult:v21 triggerEvent:a4 languages:v13 currentKeyboardLanguage:v12 queryId:a7];
  [(SUISpotlightController *)self setCurrentSearchString:v19];
}

- (void)startQueryTaskWithSearchString:(id)a3 queryOptions:(int64_t)a4 sourceResult:(id)a5 triggerEvent:(unint64_t)a6 languages:(id)a7 currentKeyboardLanguage:(id)a8 queryId:(unint64_t)a9
{
  id v13 = (__CFString *)a3;
  id v14 = a5;
  id v15 = a8;
  v16 = &stru_26E2AB8B8;
  if (v13) {
    v16 = v13;
  }
  v17 = v16;
  v18 = [(SUISpotlightController *)self currentSearchString];
  char v19 = [v18 isEqualToString:v17];

  if ((v19 & 1) == 0)
  {
    v20 = (void *)[objc_alloc(MEMORY[0x263F67808]) initWithEvent:@"com.apple.spotlight.keystroke" timeInterval:0 queryId:a9];
    id v21 = [(SUISpotlightController *)self feedbackDelegate];
    [v21 reportFeedback:v20 queryId:a9];

    v22 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v23 = [(__CFString *)v17 stringByTrimmingCharactersInSet:v22];

    v24 = [(SUISpotlightController *)self searchFieldDelegate];
    if ([v23 length])
    {
      v32 = v20;
      v25 = (void *)[objc_alloc(MEMORY[0x263F78DB0]) initWithSearchString:v17];
      [v25 setQueryIdent:a9];
      [v25 setKeyboardLanguage:v15];
      [v25 setAllowInternet:1];
      [v25 setWhyQuery:a6];
      if (a6 == 8) {
        uint64_t v26 = 8;
      }
      else {
        uint64_t v26 = 2;
      }
      objc_msgSend(v25, "setQueryKind:", v26, v32);
      v27 = [(SUISpotlightController *)self clientSession];
      v28 = [v27 queryTaskWithContext:v25];

      [v24 willRunQueryTask:v28];
      if (startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId__onceToken != -1) {
        dispatch_once(&startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId__onceToken, &__block_literal_global_1);
      }
      v29 = startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId__dispatchQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __138__SUISpotlightController_startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId___block_invoke_2;
      block[3] = &unk_264A04628;
      id v35 = v28;
      id v30 = v28;
      dispatch_block_t v31 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
      dispatch_async(v29, v31);

      v20 = v33;
    }
    else
    {
      [v24 updateSearchString:0];
      [v24 updateTokenWithString:0 symbol:0];
      [v24 updateCompletionString:0 targetString:0];
    }
  }
}

uint64_t __138__SUISpotlightController_startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId___block_invoke()
{
  startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId__dispatchQueue = (uint64_t)dispatch_queue_create("SUIQueryTaskDispatchQueue", 0);

  return MEMORY[0x270F9A758]();
}

uint64_t __138__SUISpotlightController_startQueryTaskWithSearchString_queryOptions_sourceResult_triggerEvent_languages_currentKeyboardLanguage_queryId___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) start];
}

- (SUISpotlightControllerSearchFieldDelegate)searchFieldDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_searchFieldDelegate);

  return (SUISpotlightControllerSearchFieldDelegate *)WeakRetained;
}

- (void)setSearchFieldDelegate:(id)a3
{
}

- (SUISpotlightControllerResultsViewDelegate)resultsViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resultsViewDelegate);

  return (SUISpotlightControllerResultsViewDelegate *)WeakRetained;
}

- (void)setResultsViewDelegate:(id)a3
{
}

- (SUISpotlightControllerSearchAppDelegate)appDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appDelegate);

  return (SUISpotlightControllerSearchAppDelegate *)WeakRetained;
}

- (void)setAppDelegate:(id)a3
{
}

- (SFFeedbackListener)feedbackDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_feedbackDelegate);

  return (SFFeedbackListener *)WeakRetained;
}

- (void)setFeedbackDelegate:(id)a3
{
}

- (NSString)currentSearchString
{
  return self->_currentSearchString;
}

- (void)setCurrentSearchString:(id)a3
{
}

- (SPClientSession)clientSession
{
  return self->_clientSession;
}

- (void)setClientSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientSession, 0);
  objc_storeStrong((id *)&self->_currentSearchString, 0);
  objc_destroyWeak((id *)&self->_feedbackDelegate);
  objc_destroyWeak((id *)&self->_appDelegate);
  objc_destroyWeak((id *)&self->_resultsViewDelegate);

  objc_destroyWeak((id *)&self->_searchFieldDelegate);
}

@end