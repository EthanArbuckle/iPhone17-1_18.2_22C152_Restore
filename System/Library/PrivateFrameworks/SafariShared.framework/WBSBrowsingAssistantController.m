@interface WBSBrowsingAssistantController
+ (BOOL)hasUserConsent;
+ (BOOL)isAvailableInCurrentLocale;
+ (BOOL)shouldShowConsentCard;
+ (int64_t)userConsentState;
+ (void)didRecieveMemoryWarning;
+ (void)setUserConsentState:(int64_t)a3;
+ (void)subscribeToAssistantAssetIfNeeded;
- (BOOL)_checkAssistantAvailabilityForPageLocale:(id)a3;
- (BOOL)_shouldContinueFetchingRemoteContent:(id)a3;
- (BOOL)isSummaryAvailable;
- (NSArray)tableOfContentsPaths;
- (NSArray)tableOfContentsTitles;
- (NSArray)tableOfContentsTrailingTexts;
- (NSString)cachedReaderArticleTitle;
- (NSString)summary;
- (NSString)webpageIdentifier;
- (WBSBrowsingAssistantController)init;
- (WBSBrowsingAssistantControllerDelegate)delegate;
- (WBSBrowsingAssistantResult)result;
- (id)_currentResultForURL:(id)a3;
- (void)_foundContentOptions:(unint64_t)a3 fromURL:(id)a4;
- (void)_registerForUserDefaultObserverIfNeeded;
- (void)checkForAssistantContentFromPegasusForURL:(id)a3 locale:(id)a4;
- (void)clearAssistantResult;
- (void)didFindLocalContentWithOptions:(unint64_t)a3 forURL:(id)a4;
- (void)fetchAssistantContentFromPegasusForURL:(id)a3 withCompletionHandler:(id)a4;
- (void)performPrefetchingOfAssistantPegasusContentAfterChangingConsentState;
- (void)setCachedReaderArticleTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setWebpageIdentifier:(id)a3;
- (void)updateAssistantContentForURL:(id)a3 completionHandler:(id)a4;
@end

@implementation WBSBrowsingAssistantController

+ (BOOL)shouldShowConsentCard
{
  int v3 = [a1 isAvailableInCurrentLocale];
  if (v3) {
    LOBYTE(v3) = [a1 userConsentState] == 0;
  }
  return v3;
}

+ (BOOL)isAvailableInCurrentLocale
{
  return +[WBSBrowsingAssistantContentProvider assistantEnabledForCurrentDevice];
}

+ (BOOL)hasUserConsent
{
  return [a1 userConsentState] == 1;
}

+ (int64_t)userConsentState
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  int64_t v3 = [v2 integerForKey:@"BrowsingAssistantConsentState"];

  return v3;
}

+ (void)setUserConsentState:(int64_t)a3
{
  if ([a1 userConsentState] != a3)
  {
    v4 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    [v4 setInteger:a3 forKey:@"BrowsingAssistantConsentState"];

    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_notificationNameForUserDefaultsKey:", @"BrowsingAssistantConsentState");
    [v5 postNotificationName:v6 object:0];
  }
  if (a3 == 2)
  {
    +[WBSBrowsingAssistantContentProvider unsubscribeFromAssistantAsset];
  }
  else if (a3 == 1)
  {
    +[WBSBrowsingAssistantContentProvider subscribeToAssistantAssetAndDownloadNow:1];
  }
}

+ (void)subscribeToAssistantAssetIfNeeded
{
  if ([a1 userConsentState] != 2)
  {
    +[WBSBrowsingAssistantContentProvider subscribeToAssistantAssetAndDownloadNow:0];
  }
}

+ (void)didRecieveMemoryWarning
{
}

- (WBSBrowsingAssistantController)init
{
  v7.receiver = self;
  v7.super_class = (Class)WBSBrowsingAssistantController;
  v2 = [(WBSBrowsingAssistantController *)&v7 init];
  if (v2)
  {
    int64_t v3 = objc_alloc_init(WBSBrowsingAssistantContentProvider);
    contentProvider = v2->_contentProvider;
    v2->_contentProvider = v3;

    v5 = v2;
  }

  return v2;
}

- (id)_currentResultForURL:(id)a3
{
  v4 = self->_result;
  if (!v4)
  {
    id v5 = a3;
    v6 = [[WBSBrowsingAssistantResult alloc] initWithURL:v5 contentOptions:0];

    objc_super v7 = self->_result;
    self->_result = v6;

    v4 = self->_result;
  }
  return v4;
}

- (void)_foundContentOptions:(unint64_t)a3 fromURL:(id)a4
{
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browsingAssistantController:self didUpdateContentOptionsForURL:v6];
  }
}

- (void)didFindLocalContentWithOptions:(unint64_t)a3 forURL:(id)a4
{
  id v6 = a4;
  if (a3 >= 0x20)
  {
    objc_super v7 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[WBSBrowsingAssistantController didFindLocalContentWithOptions:forURL:]((uint64_t)v6, a3, v7);
    }
  }
  v8 = [(WBSBrowsingAssistantController *)self _currentResultForURL:v6];
  [v8 updateForLocalContentWithOptions:a3];

  if ([(WBSBrowsingAssistantResult *)self->_result remoteContentState] > 1
    || ([(id)objc_opt_class() hasUserConsent] & 1) == 0)
  {
    [(WBSBrowsingAssistantController *)self _foundContentOptions:a3 fromURL:v6];
  }
}

- (void)clearAssistantResult
{
  result = self->_result;
  self->_result = 0;

  cachedReaderArticleTitle = self->_cachedReaderArticleTitle;
  self->_cachedReaderArticleTitle = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained browsingAssistantControllerDidReset:self];
  }
}

- (NSString)summary
{
  return [(WBSBrowsingAssistantResult *)self->_result summaryText];
}

- (NSArray)tableOfContentsTitles
{
  return [(WBSBrowsingAssistantResult *)self->_result tableOfContentsTitles];
}

- (NSArray)tableOfContentsPaths
{
  return [(WBSBrowsingAssistantResult *)self->_result tableOfContentsPaths];
}

- (NSArray)tableOfContentsTrailingTexts
{
  return [(WBSBrowsingAssistantResult *)self->_result tableOfContentsTrailingText];
}

- (BOOL)isSummaryAvailable
{
  if ([(WBSBrowsingAssistantResult *)self->_result contentOptions]) {
    return 1;
  }
  int64_t v3 = [(WBSBrowsingAssistantResult *)self->_result summaryResult];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_registerForUserDefaultObserverIfNeeded
{
  if (!self->_userDefaultObservation)
  {
    objc_initWeak(&location, self);
    int64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    uint64_t v4 = MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__WBSBrowsingAssistantController__registerForUserDefaultObserverIfNeeded__block_invoke;
    v8[3] = &unk_1E5C8CBF8;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "safari_observeValueForKey:onQueue:notifyForInitialValue:handler:", @"BrowsingAssistantConsentState", v4, 0, v8);
    id v6 = (WBSUserDefaultObservation *)objc_claimAutoreleasedReturnValue();
    userDefaultObservation = self->_userDefaultObservation;
    self->_userDefaultObservation = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __73__WBSBrowsingAssistantController__registerForUserDefaultObserverIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    id v2 = objc_loadWeakRetained(WeakRetained + 4);
    [v2 browsingAssistantControllerDidUpdateUserConsentState:v4];

    id v3 = v4[2];
    v4[2] = 0;

    id WeakRetained = v4;
  }
}

- (void)performPrefetchingOfAssistantPegasusContentAfterChangingConsentState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained browsingAssistantControllerDidUpdateUserConsentState:self];
}

- (BOOL)_checkAssistantAvailabilityForPageLocale:(id)a3
{
  id v4 = a3;
  if ([MEMORY[0x1E4F97EA0] isBrowsingAssistantEnabled])
  {
    uint64_t v5 = [(id)objc_opt_class() userConsentState];
    if (v5)
    {
      if (v5 != 2)
      {
        BOOL v8 = +[WBSBrowsingAssistantContentProvider assistantEnabledForLocale:v4];
        goto LABEL_10;
      }
      id v6 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Don't check URL for assistant content since User has declined.", buf, 2u);
      }
    }
    else
    {
      objc_super v7 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_INFO, "Don't check URL for assistant content since user hasn't given consent yet.", v10, 2u);
      }
      [(WBSBrowsingAssistantController *)self _registerForUserDefaultObserverIfNeeded];
    }
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (void)checkForAssistantContentFromPegasusForURL:(id)a3 locale:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (![(id)objc_opt_class() isAvailableInCurrentLocale]
    || ![(WBSBrowsingAssistantController *)self _checkAssistantAvailabilityForPageLocale:v7])
  {
    v13 = [(WBSBrowsingAssistantController *)self _currentResultForURL:v6];
    [v13 setRemoteContentState:4];
    [(WBSBrowsingAssistantController *)self _foundContentOptions:0 fromURL:v6];

    goto LABEL_9;
  }
  if (![(NSString *)self->_previousWebpageIdentifier isEqualToString:self->_webpageIdentifier])
  {
    BOOL v8 = +[WBSBiomeDonationManager sharedManager];
    [v8 donateBrowsingAssistantWebPageStartedEventWithWebPageID:self->_webpageIdentifier];

    objc_storeStrong((id *)&self->_previousWebpageIdentifier, self->_webpageIdentifier);
  }
  id v9 = [(WBSBrowsingAssistantResult *)self->_result pageURL];
  int v10 = [v9 isEqual:v6];

  if (!v10) {
    goto LABEL_13;
  }
  uint64_t v11 = [(WBSBrowsingAssistantResult *)self->_result remoteContentState];
  result = self->_result;
  if (v11 >= 2)
  {
    [(WBSBrowsingAssistantController *)self _foundContentOptions:[(WBSBrowsingAssistantResult *)result contentOptions] fromURL:v6];
    goto LABEL_9;
  }
  if ([(WBSBrowsingAssistantResult *)result remoteContentState] == 1)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6B5F000, v14, OS_LOG_TYPE_INFO, "We already have a URL checking on fly, don't continue.", buf, 2u);
    }
  }
  else
  {
LABEL_13:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    int v16 = [WeakRetained browsingAssistantControllerShouldCheckRemoteContent:self];

    if (v16)
    {
      [(WBSBrowsingAssistantResult *)self->_result setRemoteContentState:1];
      v17 = [MEMORY[0x1E4F29128] UUID];
      v18 = [v17 UUIDString];

      v19 = +[WBSBiomeDonationManager sharedManager];
      [v19 donateBrowsingAssistantServerRequestStartedEventWithWebPageID:self->_webpageIdentifier requestIdentifier:v18 requestType:1];

      contentProvider = self->_contentProvider;
      webpageIdentifier = self->_webpageIdentifier;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __83__WBSBrowsingAssistantController_checkForAssistantContentFromPegasusForURL_locale___block_invoke;
      v23[3] = &unk_1E5C8CC48;
      v23[4] = self;
      id v24 = v6;
      id v25 = v18;
      id v22 = v18;
      [(WBSBrowsingAssistantContentProvider *)contentProvider checkContentAvailabilityForURL:v24 locale:v7 webpageIdentifier:webpageIdentifier completion:v23];
    }
  }
LABEL_9:
}

void __83__WBSBrowsingAssistantController_checkForAssistantContentFromPegasusForURL_locale___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__WBSBrowsingAssistantController_checkForAssistantContentFromPegasusForURL_locale___block_invoke_2;
  block[3] = &unk_1E5C8CC20;
  id v6 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v8 = v6;
  uint64_t v10 = a2;
  id v9 = *(id *)(a1 + 48);
  char v11 = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __83__WBSBrowsingAssistantController_checkForAssistantContentFromPegasusForURL_locale___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _currentResultForURL:*(void *)(a1 + 40)];
  [v2 updateForRemoteContentWithOptions:*(void *)(a1 + 56)];

  if (*(void *)(a1 + 56))
  {
    id v3 = +[WBSBiomeDonationManager sharedManager];
    [v3 donateBrowsingAssistantServerRequestEndedEventWithWebPageID:*(void *)(*(void *)(a1 + 32) + 48) requestIdentifier:*(void *)(a1 + 48)];

    id v4 = +[WBSBiomeDonationManager sharedManager];
    [v4 donateBrowsingAssistantEligibleEventWithWebPageID:*(void *)(*(void *)(a1 + 32) + 48)];
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 40) updateWithSearchResults:0];
    id v4 = +[WBSBiomeDonationManager sharedManager];
    [v4 donateBrowsingAssistantServerRequestFailedEventWithWebPageID:*(void *)(*(void *)(a1 + 32) + 48) requestIdentifier:*(void *)(a1 + 48)];
  }

  [*(id *)(*(void *)(a1 + 32) + 40) setTableOfContentsAvailable:*(unsigned __int8 *)(a1 + 64)];
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  return [v6 _foundContentOptions:v5 fromURL:v7];
}

- (void)fetchAssistantContentFromPegasusForURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  if (![(WBSBrowsingAssistantController *)self _shouldContinueFetchingRemoteContent:v6])
  {
    v7[2](v7, 0);
    goto LABEL_9;
  }
  int64_t v8 = [(WBSBrowsingAssistantResult *)self->_result remoteContentState];
  id v9 = [(WBSBrowsingAssistantController *)self result];
  if (([v9 tableOfContentsAvailable] & 1) == 0)
  {

LABEL_8:
    [(WBSBrowsingAssistantResult *)self->_result setRemoteContentState:3];
    v13 = [MEMORY[0x1E4F29128] UUID];
    v14 = [v13 UUIDString];

    v15 = +[WBSBiomeDonationManager sharedManager];
    [v15 donateBrowsingAssistantWebpageURLSentWithWebPageID:self->_webpageIdentifier urlSent:v6];

    int v16 = +[WBSBiomeDonationManager sharedManager];
    [v16 donateBrowsingAssistantServerRequestStartedEventWithWebPageID:self->_webpageIdentifier requestIdentifier:v14 requestType:2];

    objc_initWeak(&location, self);
    contentProvider = self->_contentProvider;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __95__WBSBrowsingAssistantController_fetchAssistantContentFromPegasusForURL_withCompletionHandler___block_invoke;
    v19[3] = &unk_1E5C8CC98;
    objc_copyWeak(&v23, &location);
    id v20 = v6;
    id v18 = v14;
    id v21 = v18;
    id v22 = v7;
    [(WBSBrowsingAssistantContentProvider *)contentProvider fetchContentForURL:v20 completion:v19];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

    goto LABEL_9;
  }
  uint64_t v10 = [(WBSBrowsingAssistantController *)self tableOfContentsTitles];
  uint64_t v11 = [v10 count];

  if (v8 != 4 || !v11) {
    goto LABEL_8;
  }
  v12 = [(WBSBrowsingAssistantResult *)self->_result allResults];
  ((void (**)(id, void *))v7)[2](v7, v12);

LABEL_9:
}

void __95__WBSBrowsingAssistantController_fetchAssistantContentFromPegasusForURL_withCompletionHandler___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__WBSBrowsingAssistantController_fetchAssistantContentFromPegasusForURL_withCompletionHandler___block_invoke_2;
  block[3] = &unk_1E5C8CC70;
  block[4] = WeakRetained;
  id v7 = a1[4];
  id v8 = v3;
  id v9 = a1[5];
  id v10 = a1[6];
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __95__WBSBrowsingAssistantController_fetchAssistantContentFromPegasusForURL_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _currentResultForURL:*(void *)(a1 + 40)];
  [v2 updateWithSearchResults:*(void *)(a1 + 48)];

  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = +[WBSBiomeDonationManager sharedManager];
  id v5 = v4;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  if (v3) {
    [v4 donateBrowsingAssistantServerRequestEndedEventWithWebPageID:v6 requestIdentifier:v7];
  }
  else {
    [v4 donateBrowsingAssistantServerRequestFailedEventWithWebPageID:v6 requestIdentifier:v7];
  }

  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  return v8();
}

- (BOOL)_shouldContinueFetchingRemoteContent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(id)objc_opt_class() userConsentState] == 1)
  {
    id v5 = [(WBSBrowsingAssistantResult *)self->_result pageURL];
    char v6 = [v5 isEqual:v4];

    if (v6)
    {
      if (-[WBSBrowsingAssistantResult remoteContentAvailableForFetching](self->_result, "remoteContentAvailableForFetching")|| (-[WBSBrowsingAssistantController result](self, "result"), uint64_t v7 = objc_claimAutoreleasedReturnValue(), v8 = [v7 tableOfContentsAvailable], v7, (v8 & 1) != 0))
      {
        if ([(WBSBrowsingAssistantResult *)self->_result remoteContentState] != 3)
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
        id v9 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[WBSBrowsingAssistantController _shouldContinueFetchingRemoteContent:]((uint64_t)v4, v9);
        }
      }
      else
      {
        v13 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v14 = 138739971;
          id v15 = v4;
          _os_log_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_INFO, "Don't fetch assistant content since first hop check says there is no remote content for %{sensitive}@.", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    else
    {
      id v10 = WBS_LOG_CHANNEL_PREFIXBrowsingAssistant();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[WBSBrowsingAssistantController _shouldContinueFetchingRemoteContent:]((uint64_t)v4, v10);
      }
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (void)updateAssistantContentForURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __81__WBSBrowsingAssistantController_updateAssistantContentForURL_completionHandler___block_invoke;
  v8[3] = &unk_1E5C8CCC0;
  id v9 = v6;
  id v7 = v6;
  [(WBSBrowsingAssistantController *)self fetchAssistantContentFromPegasusForURL:a3 withCompletionHandler:v8];
}

uint64_t __81__WBSBrowsingAssistantController_updateAssistantContentForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = [a2 count] != 0;
  id v4 = *(uint64_t (**)(uint64_t, BOOL))(v2 + 16);
  return v4(v2, v3);
}

- (WBSBrowsingAssistantControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WBSBrowsingAssistantControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WBSBrowsingAssistantResult)result
{
  return self->_result;
}

- (NSString)webpageIdentifier
{
  return self->_webpageIdentifier;
}

- (void)setWebpageIdentifier:(id)a3
{
}

- (NSString)cachedReaderArticleTitle
{
  return self->_cachedReaderArticleTitle;
}

- (void)setCachedReaderArticleTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedReaderArticleTitle, 0);
  objc_storeStrong((id *)&self->_webpageIdentifier, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previousWebpageIdentifier, 0);
  objc_storeStrong((id *)&self->_userDefaultObservation, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
}

- (void)didFindLocalContentWithOptions:(os_log_t)log forURL:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138740227;
  uint64_t v4 = a1;
  __int16 v5 = 2050;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A6B5F000, log, OS_LOG_TYPE_ERROR, "Received invalid local content for URL %{sensitive}@, content: %{public}ld", (uint8_t *)&v3, 0x16u);
}

- (void)_shouldContinueFetchingRemoteContent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138739971;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "We already have a Pegasus request on fly for %{sensitive}@, bail out.", (uint8_t *)&v2, 0xCu);
}

- (void)_shouldContinueFetchingRemoteContent:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138739971;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_ERROR, "We don't have first hop check result for %{sensitive}@, bail out.", (uint8_t *)&v2, 0xCu);
}

@end