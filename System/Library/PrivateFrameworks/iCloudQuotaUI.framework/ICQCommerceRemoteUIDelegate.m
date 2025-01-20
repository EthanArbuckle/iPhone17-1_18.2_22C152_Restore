@interface ICQCommerceRemoteUIDelegate
- (BOOL)_handleResponseForDialog:(id)a3 atIndex:(int64_t)a4;
- (BOOL)_hasUnfinishedOperations;
- (BOOL)_isPurchaseTokenOperation:(id)a3;
- (BOOL)_isSuccessfulPurchaseTokenOperation:(id)a3;
- (BOOL)_loadNativeURL:(id)a3;
- (BOOL)_shouldSuppressDialog:(id)a3 failureType:(int64_t)a4;
- (BOOL)didJustCancelDialog;
- (BOOL)didUserDismissAMSFlow:(id)a3;
- (BOOL)forRetailOffer;
- (BOOL)shouldOfferDeviceOffers;
- (BOOL)shouldOfferFamilySharePlansOnly;
- (BOOL)skipCompletionAlert;
- (BOOL)skipGoBack;
- (BOOL)skipRetryWithoutToken;
- (BOOL)supportsModernAlerts;
- (ICQCommerceRemoteUIDelegate)initWithNavigationController:(id)a3 needsModalPresentation:(BOOL)a4;
- (ICQCommerceRemoteUIDelegateDelegate)delegate;
- (NSDictionary)buyParameters;
- (NSDictionary)requestHeaders;
- (NSString)purchaseToken;
- (id)parentViewControllerForObjectModel:(id)a3;
- (id)presentationContext;
- (int64_t)_statusCodeForFinishedOperation:(id)a3;
- (int64_t)failureType;
- (unint64_t)supportedInterfaceOrientations;
- (void)_clearRetailFollowUpItem;
- (void)_dismissAccountPageViewController:(id)a3 keepCommerceSpinner:(BOOL)a4;
- (void)_dismissAlertsWithCompletion:(id)a3;
- (void)_forgetAccountPageViewController:(id)a3;
- (void)_handleFinishForOperation:(id)a3 withOutput:(id)a4;
- (void)_handleOperationError:(id)a3;
- (void)_popAccountPageViewController:(id)a3 keepCommerceSpinner:(BOOL)a4;
- (void)_popCommerceSpinnerIfNeeded;
- (void)_popObjectModelAnimated:(BOOL)a3;
- (void)_presentAlertWithDialog:(id)a3;
- (void)accountPageViewController:(id)a3 financeInterruptionResolved:(BOOL)a4;
- (void)accountPageViewControllerDidFinish:(id)a3;
- (void)cancelFlowBecause:(id)a3;
- (void)cancelRemoteUI;
- (void)cancelRemoteUIKeeping:(id)a3;
- (void)cleanupLoader;
- (void)dealloc;
- (void)errorWithTitle:(id)a3 andExplanation:(id)a4 dismissedCompletion:(id)a5;
- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)handleDialog:(id)a3;
- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6;
- (void)loadURLforKey:(id)a3;
- (void)makeBuyRequest:(id)a3;
- (void)makeBuyRequest:(id)a3 forceAuth:(BOOL)a4 usePurchaseToken:(BOOL)a5;
- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5;
- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5;
- (void)objectModelPressedBack:(id)a3;
- (void)operation:(id)a3 failedWithError:(id)a4;
- (void)operation:(id)a3 finishedWithOutput:(id)a4;
- (void)processLink:(id)a3 forceAuth:(BOOL)a4;
- (void)processLink:(id)a3 forceAuth:(BOOL)a4 needsAuth:(BOOL)a5;
- (void)processLink:(id)a3 forceAuth:(BOOL)a4 needsAuth:(BOOL)a5 localAuth:(BOOL)a6;
- (void)processLink:(id)a3 forceAuth:(BOOL)a4 needsAuth:(BOOL)a5 localAuth:(BOOL)a6 usePurchaseToken:(BOOL)a7;
- (void)purchaseWithToken:(id)a3 buyParameters:(id)a4 requestHeaders:(id)a5;
- (void)pushSpinner;
- (void)retryPurchaseWithoutToken;
- (void)setBuyParameters:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidJustCancelDialog:(BOOL)a3;
- (void)setFailureType:(int64_t)a3;
- (void)setForRetailOffer:(BOOL)a3;
- (void)setPurchaseToken:(id)a3;
- (void)setRequestHeaders:(id)a3;
- (void)setShouldOfferDeviceOffers:(BOOL)a3;
- (void)setShouldOfferFamilySharePlansOnly:(BOOL)a3;
- (void)setSkipCompletionAlert:(BOOL)a3;
- (void)setSkipGoBack:(BOOL)a3;
- (void)setSkipRetryWithoutToken:(BOOL)a3;
- (void)setSupportsModernAlerts:(BOOL)a3;
- (void)unregisterAuthNotification;
- (void)userCompletedFlow:(int64_t)a3;
@end

@implementation ICQCommerceRemoteUIDelegate

- (BOOL)_isPurchaseTokenOperation:(id)a3
{
  v3 = [a3 requestProperties];
  v4 = [v3 HTTPHeaders];
  v5 = [v4 objectForKeyedSubscript:@"X-Apple-GS-Token"];
  BOOL v6 = v5 != 0;

  return v6;
}

- (int64_t)_statusCodeForFinishedOperation:(id)a3
{
  v3 = [a3 response];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int64_t v4 = [v3 statusCode];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_isSuccessfulPurchaseTokenOperation:(id)a3
{
  return [(ICQCommerceRemoteUIDelegate *)self _statusCodeForFinishedOperation:a3] == 200;
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__ICQCommerceRemoteUIDelegate_operation_finishedWithOutput___block_invoke;
  block[3] = &unk_264922568;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__ICQCommerceRemoteUIDelegate_operation_finishedWithOutput___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F82438] sharedApplication];
  [v2 setNetworkActivityIndicatorVisible:0];

  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 74))
  {
    if (*(void *)(v3 + 80))
    {
      objc_initWeak(&location, (id)v3);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __60__ICQCommerceRemoteUIDelegate_operation_finishedWithOutput___block_invoke_2;
      v10[3] = &unk_264923A50;
      objc_copyWeak(&v13, &location);
      id v11 = *(id *)(a1 + 40);
      id v12 = *(id *)(a1 + 48);
      int64_t v4 = _Block_copy(v10);
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 88);
      *(void *)(v5 + 88) = v4;

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = *(void *)(a1 + 48);
      id v9 = *(void **)(a1 + 32);
      [v9 _handleFinishForOperation:v7 withOutput:v8];
    }
  }
}

void __60__ICQCommerceRemoteUIDelegate_operation_finishedWithOutput___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleFinishForOperation:*(void *)(a1 + 32) withOutput:*(void *)(a1 + 40)];
}

- (void)_handleFinishForOperation:(id)a3 withOutput:(id)a4
{
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  p_finishingOperation = &self->_finishingOperation;
  objc_storeStrong((id *)&self->_finishingOperation, a3);
  v10 = [v7 dataProvider];
  if ([(ICQCommerceRemoteUIDelegate *)self skipGoBack])
  {
    id v11 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "async operation in flight -- skipGoBack set", buf, 2u);
    }
  }
  BOOL v12 = [(ICQCommerceRemoteUIDelegate *)self skipGoBack];
  [(ICQCommerceRemoteUIDelegate *)self setSkipGoBack:0];
  if ([(ICQCommerceRemoteUIDelegate *)self didJustCancelDialog])
  {
    id v13 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "server dialog was just canceled", buf, 2u);
    }
  }
  BOOL v14 = [(ICQCommerceRemoteUIDelegate *)self didJustCancelDialog];
  [(ICQCommerceRemoteUIDelegate *)self setDidJustCancelDialog:0];
  if (([v10 isPlist] & 1) == 0)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x263F637B8]) initWithXML:v8];
    if (PSIsInternalInstall()
      && CFPreferencesGetAppBooleanValue(@"loggingEnabled", @"com.apple.RemoteUI", 0))
    {
      v22 = ICQUSLogForCategory(0);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
        *(_DWORD *)buf = 138412290;
        id v72 = v23;
        _os_log_impl(&dword_22C821000, v22, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }
    }
    if (([v19 succeeded] & 1) == 0)
    {
      v24 = ISError();
      [(ICQCommerceRemoteUIDelegate *)self _handleOperationError:v24];
LABEL_102:

      goto LABEL_103;
    }
    v24 = [v19 uiObjectModel];
    v25 = [v19 actionSignal];
    [v24 setDelegate:self];
    if (!-[NSMutableArray count](self->_objectModels, "count") && [v25 topSignal] == 3) {
      [v25 setTopSignal:2];
    }
    navigationController = self->_navigationController;
    if (!navigationController)
    {
      v27 = objc_alloc_init(ICQCommerceNavigationController);
      v28 = self->_navigationController;
      self->_navigationController = &v27->super;

      [(UINavigationController *)self->_navigationController setModalPresentationStyle:2];
      [(UINavigationController *)self->_navigationController setModalTransitionStyle:0];
    }
    if (![v25 topSignal]) {
      [v25 setTopSignal:2];
    }
    if ([v25 topSignal] == 2)
    {
      v64 = navigationController;
      v67 = v10;
      [(NSMutableArray *)self->_objectModels addObject:v24];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v30 = objc_opt_respondsToSelector();

      if (v30)
      {
        v31 = [v24 defaultPages];
        v32 = [v31 firstObject];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          -[ICQCommerceRemoteUIDelegate _handleFinishForOperation:withOutput:]();
        }
        if (v32)
        {
          id v33 = objc_loadWeakRetained((id *)&self->_delegate);
          [v33 commerceDelegate:self willPresentObjectModel:v24 page:v32];
        }
      }
      v34 = [MEMORY[0x263F086E0] mainBundle];
      v35 = [v34 bundleIdentifier];

      v36 = [(UINavigationController *)self->_navigationController topViewController];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v37 = [v35 isEqualToString:@"com.apple.Preferences"];

        if (v37)
        {
          self->_pseudoModallyPresented = 1;
          v38 = self->_navigationController;
          v70[0] = MEMORY[0x263EF8330];
          v70[1] = 3221225472;
          v70[2] = __68__ICQCommerceRemoteUIDelegate__handleFinishForOperation_withOutput___block_invoke;
          v70[3] = &unk_264921C80;
          v70[4] = self;
          [v24 presentInParentViewController:v38 animated:0 completion:v70];

          v10 = v67;
          goto LABEL_76;
        }
      }
      else
      {
      }
      [v24 presentInParentViewController:self->_navigationController animated:v64 != 0];

      v10 = v67;
      if (!v64)
      {
LABEL_76:
        if (self->_modallyPresented) {
          [(UINavigationController *)self->_parentNavigationController presentViewController:self->_navigationController animated:1 completion:0];
        }
      }
LABEL_78:

      goto LABEL_102;
    }
    if ([v25 topSignal] == 3)
    {
      v39 = [(UINavigationController *)self->_navigationController viewControllers];
      v68 = v10;
      v40 = (void *)[v39 mutableCopy];

      [(NSMutableArray *)self->_objectModels removeLastObject];
      [v40 removeLastObject];
      v41 = [v24 defaultPages];
      [v41 lastObject];
      v42 = v65 = navigationController;
      [v40 addObject:v42];

      [(NSMutableArray *)self->_objectModels addObject:v24];
      goto LABEL_47;
    }
    if ([v25 topSignal] == 4)
    {
      v68 = v10;
      v47 = [v24 defaultPages];
      uint64_t v48 = [v47 count];

      if (v48)
      {
        if ((unint64_t)[(NSMutableArray *)self->_objectModels count] > 1)
        {
          [(NSMutableArray *)self->_objectModels removeLastObject];
          [(NSMutableArray *)self->_objectModels removeLastObject];
          v50 = [(UINavigationController *)self->_navigationController viewControllers];
          v40 = (void *)[v50 mutableCopy];

          [v40 removeLastObject];
          [v40 removeLastObject];
          [(NSMutableArray *)self->_objectModels addObject:v24];
          v51 = [v24 defaultPages];
          [v51 lastObject];
          v52 = v65 = navigationController;
          [v40 addObject:v52];

LABEL_47:
          [(UINavigationController *)self->_navigationController setViewControllers:v40 animated:0];

          v10 = v68;
          if (!v65) {
            goto LABEL_76;
          }
          goto LABEL_78;
        }
        v49 = ICQUSLogForCategory(0);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22C821000, v49, OS_LOG_TYPE_DEFAULT, "Pop + Replace requires at least 2 existing object models.", buf, 2u);
        }
      }
      else
      {
        [(ICQCommerceRemoteUIDelegate *)self _popObjectModelAnimated:1];
      }
      v10 = v68;
    }
    if (!navigationController) {
      goto LABEL_76;
    }
    goto LABEL_78;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v66 = v10;
    v15 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v72 = v8;
      _os_log_impl(&dword_22C821000, v15, OS_LOG_TYPE_DEFAULT, "Store operation completed with response %@", buf, 0xCu);
    }

    LODWORD(v62) = [(ICQCommerceRemoteUIDelegate *)self _isPurchaseTokenOperation:v7];
    if (v62)
    {
      int64_t v16 = [(ICQCommerceRemoteUIDelegate *)self _statusCodeForFinishedOperation:v7];
      v17 = ICQUSLogForCategory(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = [NSNumber numberWithInteger:v16];
        *(_DWORD *)buf = 138412290;
        id v72 = v18;
        _os_log_impl(&dword_22C821000, v17, OS_LOG_TYPE_DEFAULT, "Purchase token operation status code: %@", buf, 0xCu);
      }
    }
    v19 = objc_msgSend(v8, "objectForKeyedSubscript:", @"failureType", v62);
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      -[ICQCommerceRemoteUIDelegate setFailureType:](self, "setFailureType:", [v19 integerValue]);
      v20 = ICQUSLogForCategory(0);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_msgSend(NSNumber, "numberWithInteger:", -[ICQCommerceRemoteUIDelegate failureType](self, "failureType"));
        *(_DWORD *)buf = 138412290;
        id v72 = v21;
        _os_log_impl(&dword_22C821000, v20, OS_LOG_TYPE_DEFAULT, "ft=%@", buf, 0xCu);
      }
    }
    else
    {
      [(ICQCommerceRemoteUIDelegate *)self setFailureType:0];
    }
    if (([(ICQCommerceRemoteUIDelegate *)self failureType] == 8067
       || [(ICQCommerceRemoteUIDelegate *)self failureType] == 3067)
      && [(ICQCommerceRemoteUIDelegate *)self forRetailOffer])
    {
      [(ICQCommerceRemoteUIDelegate *)self _clearRetailFollowUpItem];
    }
    v43 = [v8 objectForKey:@"dialog"];

    if (!v43)
    {
      v44 = ICQUSLogForCategory(0);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22C821000, v44, OS_LOG_TYPE_DEFAULT, "no dialog; checking for message", buf, 2u);
      }

      v45 = [v8 objectForKey:@"customerMessage"];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v45 length])
      {
        if (v63 && ![(ICQCommerceRemoteUIDelegate *)self skipRetryWithoutToken])
        {
          v53 = ICQUSLogForCategory(0);
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22C821000, v53, OS_LOG_TYPE_DEFAULT, "retryPurchaseWithoutToken", buf, 2u);
          }

          [(ICQCommerceRemoteUIDelegate *)self retryPurchaseWithoutToken];
        }
        else
        {
          v46 = ICQUSLogForCategory(0);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v72 = v45;
            _os_log_impl(&dword_22C821000, v46, OS_LOG_TYPE_DEFAULT, "show error with title: %@", buf, 0xCu);
          }

          v69[0] = MEMORY[0x263EF8330];
          v69[1] = 3221225472;
          v69[2] = __68__ICQCommerceRemoteUIDelegate__handleFinishForOperation_withOutput___block_invoke_105;
          v69[3] = &unk_264921C80;
          v69[4] = self;
          [(ICQCommerceRemoteUIDelegate *)self errorWithTitle:v45 andExplanation:0 dismissedCompletion:v69];
        }
        v10 = v66;
      }
    }
    if ([(ICQCommerceRemoteUIDelegate *)self skipCompletionAlert]
      && (unint64_t)([(ICQCommerceRemoteUIDelegate *)self failureType] - 3067) <= 1)
    {
      [(ICQCommerceRemoteUIDelegate *)self userCompletedFlow:[(ICQCommerceRemoteUIDelegate *)self failureType]];
      v24 = [(UINavigationController *)self->_navigationController topViewController];
      [(ICQCommerceRemoteUIDelegate *)self cancelRemoteUIKeeping:v24];
      goto LABEL_102;
    }
    if (v12)
    {
LABEL_103:

      goto LABEL_104;
    }
    v54 = [v8 objectForKey:@"action"];
    v24 = v54;
    if (v54)
    {
      v55 = [v54 objectForKey:@"kind"];
      int v56 = [v55 isEqualToString:@"GoBack"];

      if (v56)
      {
        v57 = @"server provided action GoBack";
        if (!v14)
        {
LABEL_100:
          [(ICQCommerceRemoteUIDelegate *)self cancelFlowBecause:v57];
          [(ICQCommerceRemoteUIDelegate *)self cancelRemoteUI];
          goto LABEL_101;
        }
        int v58 = 1;
        goto LABEL_97;
      }
      if (!v14) {
        goto LABEL_101;
      }
    }
    else if (!v14)
    {
      goto LABEL_102;
    }
    v57 = 0;
    int v58 = 0;
LABEL_97:
    v59 = [(UINavigationController *)self->_navigationController topViewController];
    topViewController = self->_topViewController;

    if (v59 == topViewController)
    {
      v57 = @"dialog cancelled before any pages pushed";
      goto LABEL_100;
    }
    if (v58) {
      goto LABEL_100;
    }
LABEL_101:
    v10 = v66;
    goto LABEL_102;
  }
LABEL_104:
  v61 = *p_finishingOperation;
  *p_finishingOperation = 0;
}

void __68__ICQCommerceRemoteUIDelegate__handleFinishForOperation_withOutput___block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__ICQCommerceRemoteUIDelegate__handleFinishForOperation_withOutput___block_invoke_2;
  block[3] = &unk_264921C80;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __68__ICQCommerceRemoteUIDelegate__handleFinishForOperation_withOutput___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 8) topViewController];
  id v4 = [v2 arrayWithObject:v3];

  [*(id *)(*(void *)(a1 + 32) + 8) setViewControllers:v4];
}

uint64_t __68__ICQCommerceRemoteUIDelegate__handleFinishForOperation_withOutput___block_invoke_105(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelFlowBecause:@"customer message shown & dismissed"];
  v2 = *(void **)(a1 + 32);
  return [v2 cancelRemoteUI];
}

- (void)_clearRetailFollowUpItem
{
  v2 = dispatch_get_global_queue(0, 0);
  dispatch_async(v2, &__block_literal_global_19);
}

void __55__ICQCommerceRemoteUIDelegate__clearRetailFollowUpItem__block_invoke()
{
  v0 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_22C821000, v0, OS_LOG_TYPE_DEFAULT, "Clearing iCloud follow up item", v8, 2u);
  }

  v1 = AMSGenerateLogCorrelationKey();
  v2 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  uint64_t v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  id v4 = (void *)MEMORY[0x263F27B28];
  uint64_t v5 = [MEMORY[0x263F27C00] bagSubProfile];
  id v6 = [MEMORY[0x263F27C00] bagSubProfileVersion];
  id v7 = [v4 bagForProfile:v5 profileVersion:v6];

  [MEMORY[0x263F27BF8] removeDeviceOfferWithIdentifier:*MEMORY[0x263F27830] account:v3 bag:v7 logKey:v1];
}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__ICQCommerceRemoteUIDelegate_operation_failedWithError___block_invoke;
  v7[3] = &unk_264921B68;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __57__ICQCommerceRemoteUIDelegate_operation_failedWithError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2[10])
  {
    objc_initWeak(&location, v2);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__ICQCommerceRemoteUIDelegate_operation_failedWithError___block_invoke_2;
    aBlock[3] = &unk_264923B30;
    objc_copyWeak(&v10, &location);
    id v9 = *(id *)(a1 + 40);
    uint64_t v3 = _Block_copy(aBlock);
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 88);
    *(void *)(v4 + 88) = v3;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = *(void **)(a1 + 32);
    [v7 _handleOperationError:v6];
  }
}

void __57__ICQCommerceRemoteUIDelegate_operation_failedWithError___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleOperationError:*(void *)(a1 + 32)];
}

- (void)_handleOperationError:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 commerceDelegate:self loadDidFailWithError:v4];
  }
  id v8 = [MEMORY[0x263F82438] sharedApplication];
  [v8 setNetworkActivityIndicatorVisible:0];

  if ([v4 code] == 16 || objc_msgSend(v4, "code") == 4)
  {
    id v9 = [(UINavigationController *)self->_navigationController topViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = [(UINavigationController *)self->_navigationController popViewControllerAnimated:1];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v11 = [v9 table];
        BOOL v12 = [v11 indexPathForSelectedRow];
        [v11 deselectRowAtIndexPath:v12 animated:1];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v15 = [v9 tableViewOM];
          int64_t v16 = [v15 tableView];

          v17 = [v16 indexPathForSelectedRow];
          [v16 deselectRowAtIndexPath:v17 animated:1];
        }
      }
    }
  }
  else
  {
    id v13 = [v4 localizedDescription];
    BOOL v14 = [v4 localizedFailureReason];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __53__ICQCommerceRemoteUIDelegate__handleOperationError___block_invoke;
    v18[3] = &unk_264921B68;
    v18[4] = self;
    id v19 = v4;
    [(ICQCommerceRemoteUIDelegate *)self errorWithTitle:v13 andExplanation:v14 dismissedCompletion:v18];
  }
}

uint64_t __53__ICQCommerceRemoteUIDelegate__handleOperationError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [NSString stringWithFormat:@"operation error shown & dismissed (error:%@)", *(void *)(a1 + 40)];
  [v2 cancelFlowBecause:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 cancelRemoteUI];
}

- (void)errorWithTitle:(id)a3 andExplanation:(id)a4 dismissedCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __81__ICQCommerceRemoteUIDelegate_errorWithTitle_andExplanation_dismissedCompletion___block_invoke;
  v14[3] = &unk_264923B80;
  id v15 = v8;
  id v16 = v9;
  v17 = self;
  id v18 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __81__ICQCommerceRemoteUIDelegate_errorWithTitle_andExplanation_dismissedCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  if (![v2 length] && !objc_msgSend(*(id *)(a1 + 40), "length"))
  {
    id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v9 localizedStringForKey:@"DEFAULT_ERROR_TITLE" value:&stru_26DFF2C90 table:@"CloudGroup"];
    goto LABEL_6;
  }
  id v4 = *(void **)(a1 + 32);
  id v5 = SSError();
  char v6 = [v5 localizedDescription];
  LODWORD(v4) = [v4 isEqualToString:v6];

  if (v4)
  {
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"DEFAULT_ERROR_GENERIC" value:&stru_26DFF2C90 table:@"CloudGroup"];

    id v2 = v7;
    id v9 = v3;
    id v3 = 0;
LABEL_6:

    id v2 = (id)v8;
  }
  id v10 = [MEMORY[0x263F82418] alertControllerWithTitle:v2 message:v3 preferredStyle:1];
  id v11 = (void *)MEMORY[0x263F82400];
  id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"DISMISS" value:&stru_26DFF2C90 table:@"CloudGroup"];
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  id v19 = __81__ICQCommerceRemoteUIDelegate_errorWithTitle_andExplanation_dismissedCompletion___block_invoke_2;
  v20 = &unk_264923B58;
  BOOL v14 = *(void **)(a1 + 56);
  uint64_t v21 = *(void *)(a1 + 48);
  id v22 = v14;
  id v15 = [v11 actionWithTitle:v13 style:0 handler:&v17];
  objc_msgSend(v10, "addAction:", v15, v17, v18, v19, v20, v21);

  id v16 = [*(id *)(a1 + 48) presentationContext];
  [v16 presentViewController:v10 animated:1 completion:0];
}

void __81__ICQCommerceRemoteUIDelegate_errorWithTitle_andExplanation_dismissedCompletion___block_invoke_2(uint64_t a1)
{
  id v9 = [*(id *)(*(void *)(a1 + 32) + 8) topViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 8) popViewControllerAnimated:1];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = [v9 table];
      id v4 = [v3 indexPathForSelectedRow];
      [v3 deselectRowAtIndexPath:v4 animated:1];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = [v9 tableViewOM];
        char v6 = [v5 tableView];

        id v7 = [v6 indexPathForSelectedRow];
        [v6 deselectRowAtIndexPath:v7 animated:1];
      }
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

- (void)unregisterAuthNotification
{
  self->_registeredAuthNotification = 0;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F7BDA0], 0);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x263F7BD98], 0);
  id v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v6 = (const __CFString *)*MEMORY[0x263F7BD90];
  CFNotificationCenterRemoveObserver(v5, self, v6, 0);
}

- (BOOL)_hasUnfinishedOperations
{
  id v3 = [(NSOperationQueue *)self->_queue operations];
  BOOL v6 = ([v3 count] != 1
     || ([v3 firstObject],
         id v4 = (ISURLOperation *)objc_claimAutoreleasedReturnValue(),
         finishingOperation = self->_finishingOperation,
         v4,
         v4 != finishingOperation))
    && [v3 count] != 0;

  return v6;
}

- (void)cleanupLoader
{
  if ([(ICQCommerceRemoteUIDelegate *)self _hasUnfinishedOperations])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = objc_loadWeakRetained((id *)&self->_delegate);
      BOOL v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.Preferences.cloud-storage-offers" code:1 userInfo:0];
      [v5 commerceDelegate:self loadDidFailWithError:v6];
    }
    id v7 = [MEMORY[0x263F82438] sharedApplication];
    [v7 setNetworkActivityIndicatorVisible:0];
  }
  uint64_t v8 = [(NSOperationQueue *)self->_queue operations];
  [v8 enumerateObjectsUsingBlock:&__block_literal_global_157];

  queue = self->_queue;
  [(NSOperationQueue *)queue cancelAllOperations];
}

void __44__ICQCommerceRemoteUIDelegate_cleanupLoader__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v2 setDelegate:0];
  }
}

- (void)pushSpinner
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__ICQCommerceRemoteUIDelegate_pushSpinner__block_invoke;
  block[3] = &unk_264921C80;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __42__ICQCommerceRemoteUIDelegate_pushSpinner__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v18 = objc_alloc_init(ICQCommerceSpinner);
    char v4 = [*(id *)(*(void *)(a1 + 32) + 8) topViewController];
    id v5 = [v4 navigationItem];

    id v6 = objc_alloc(MEMORY[0x263F824A8]);
    id v7 = [v5 leftBarButtonItem];
    uint64_t v8 = [v7 title];
    id v9 = (void *)[v6 initWithTitle:v8 style:0 target:0 action:0];

    [v9 setEnabled:0];
    id v10 = objc_alloc(MEMORY[0x263F824A8]);
    id v11 = [v5 rightBarButtonItem];
    id v12 = [v11 title];
    id v13 = (void *)[v10 initWithTitle:v12 style:2 target:0 action:0];

    [v13 setEnabled:0];
    BOOL v14 = [(ICQCommerceSpinner *)v18 navigationItem];
    [v14 setLeftBarButtonItem:v9];

    id v15 = [(ICQCommerceSpinner *)v18 navigationItem];
    [v15 setRightBarButtonItem:v13];

    id v16 = [v5 title];
    uint64_t v17 = [(ICQCommerceSpinner *)v18 navigationItem];
    [v17 setTitle:v16];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "showViewController:sender:", v18);
  }
}

- (void)_popCommerceSpinnerIfNeeded
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v3 = [(UINavigationController *)self->_navigationController topViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "popping commerce spinner", v7, 2u);
    }

    id v6 = [(UINavigationController *)self->_navigationController popViewControllerAnimated:1];
  }
}

- (void)purchaseWithToken:(id)a3 buyParameters:(id)a4 requestHeaders:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(ICQCommerceRemoteUIDelegate *)self setSkipCompletionAlert:1];
  [(ICQCommerceRemoteUIDelegate *)self setPurchaseToken:v10];

  [(ICQCommerceRemoteUIDelegate *)self setBuyParameters:v9];
  [(ICQCommerceRemoteUIDelegate *)self setRequestHeaders:v8];

  id v11 = [MEMORY[0x263F086E0] mainBundle];
  id v12 = [v11 bundleIdentifier];

  int v13 = [v12 isEqualToString:@"com.apple.preferences"];
  BOOL v14 = _ICQGetLogSystem();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "Freshmint using AMSPurchase flow.", buf, 2u);
    }

    [(ICQCommerceRemoteUIDelegate *)self makeBuyRequest:&stru_26DFF2C90];
  }
  else
  {
    if (v15)
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "Freshmint using legacy purchase flow.", v18, 2u);
    }

    if (v10)
    {
      uint64_t v16 = 0;
      uint64_t v17 = 1;
    }
    else
    {
      uint64_t v16 = 1;
      uint64_t v17 = 0;
    }
    [(ICQCommerceRemoteUIDelegate *)self makeBuyRequest:&stru_26DFF2C90 forceAuth:v16 usePurchaseToken:v17];
  }
}

- (void)makeBuyRequest:(id)a3 forceAuth:(BOOL)a4 usePurchaseToken:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "Preparing StoreService purchase request.", v26, 2u);
  }

  id v10 = objc_alloc_init(MEMORY[0x263F7B290]);
  [v10 setURLBagKey:@"buyProduct"];
  uint64_t v11 = [(ICQCommerceRemoteUIDelegate *)self buyParameters];
  if (v11 && (id v12 = (void *)v11, v13 = [v8 length], v12, !v13))
  {
    BOOL v15 = [(ICQCommerceRemoteUIDelegate *)self buyParameters];
    uint64_t v16 = [v15 mutableCopy];
  }
  else
  {
    BOOL v14 = NSURL;
    BOOL v15 = [v8 stringByRemovingPercentEncoding];
    uint64_t v16 = [v14 copyDictionaryForQueryString:v15 unescapedValues:0];
  }
  uint64_t v17 = (void *)v16;

  uint64_t v18 = [v17 objectForKeyedSubscript:@"forRetailOffer"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v18 BOOLValue]) {
    [(ICQCommerceRemoteUIDelegate *)self setForRetailOffer:1];
  }
  id v19 = [MEMORY[0x263F89480] sharedInstance];
  v20 = [v19 guid];
  [v17 setObject:v20 forKey:@"guid"];

  uint64_t v21 = [MEMORY[0x263F08AC0] dataWithPropertyList:v17 format:100 options:0 error:0];
  [v10 setHTTPBody:v21];
  [v10 setHTTPMethod:@"POST"];
  [v10 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
  if (v5
    && ([(ICQCommerceRemoteUIDelegate *)self purchaseToken],
        id v22 = objc_claimAutoreleasedReturnValue(),
        v22,
        v22))
  {
    [(ICQCommerceRemoteUIDelegate *)self processLink:v10 forceAuth:0 needsAuth:0 localAuth:0 usePurchaseToken:1];
  }
  else
  {
    [(ICQCommerceRemoteUIDelegate *)self processLink:v10 forceAuth:v6 needsAuth:1 localAuth:1];
  }
  if (!self->_registeredAuthNotification)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)AuthSubmitted, (CFStringRef)*MEMORY[0x263F7BDA0], 0, CFNotificationSuspensionBehaviorCoalesce);
    v24 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v24, self, (CFNotificationCallback)AuthSubmitted, (CFStringRef)*MEMORY[0x263F7BD98], 0, CFNotificationSuspensionBehaviorCoalesce);
    v25 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v25, self, (CFNotificationCallback)AuthCancelled, (CFStringRef)*MEMORY[0x263F7BD90], 0, CFNotificationSuspensionBehaviorCoalesce);
    self->_registeredAuthNotification = 1;
  }
}

- (void)retryPurchaseWithoutToken
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__ICQCommerceRemoteUIDelegate_retryPurchaseWithoutToken__block_invoke;
  block[3] = &unk_264921C80;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __56__ICQCommerceRemoteUIDelegate_retryPurchaseWithoutToken__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) skipRetryWithoutToken];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setSkipRetryWithoutToken:1];
    id v3 = *(void **)(a1 + 32);
    return [v3 makeBuyRequest:&stru_26DFF2C90];
  }
  return result;
}

- (void)loadURLforKey:(id)a3
{
  self->_cancelled = 0;
  char v4 = (objc_class *)MEMORY[0x263F7B290];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setURLBagKey:v5];
  LODWORD(v4) = [v5 isEqualToString:@"mint-offers"];

  if (v4)
  {
    if ([(ICQCommerceRemoteUIDelegate *)self shouldOfferFamilySharePlansOnly]) {
      [v6 setValue:@"true" forRequestParameter:@"sharePlanOnly"];
    }
    if ([(ICQCommerceRemoteUIDelegate *)self shouldOfferDeviceOffers]) {
      [v6 setValue:@"true" forRequestParameter:@"deviceOffers"];
    }
  }
  [(ICQCommerceRemoteUIDelegate *)self processLink:v6 forceAuth:0 needsAuth:0];
}

- (void)cancelFlowBecause:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  char v4 = (__CFString *)a3;
  if (self->_cancelled)
  {
    id v5 = _ICQGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[ICQCommerceRemoteUIDelegate cancelFlowBecause:]();
    }
    goto LABEL_10;
  }
  id v6 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"reasons";
    if (v4) {
      id v7 = v4;
    }
    int v10 = 138543362;
    uint64_t v11 = v7;
    _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "user flow is ending because %{public}@", (uint8_t *)&v10, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 commerceDelegateDidCancel:self];
LABEL_10:
  }
}

- (void)userCompletedFlow:(int64_t)a3
{
  v22[1] = *MEMORY[0x263EF8340];
  if (self->_cancelled)
  {
    id v3 = _ICQGetLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[ICQCommerceRemoteUIDelegate userCompletedFlow:]();
    }
    goto LABEL_24;
  }
  unsigned int v6 = 0;
  if (a3 && a3 != 3067)
  {
    if (a3 == 3068)
    {
      unsigned int v6 = 2;
      goto LABEL_12;
    }
    id v7 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 134217984;
      int64_t v18 = a3;
      _os_log_impl(&dword_22C821000, v7, OS_LOG_TYPE_DEFAULT, "unexpected failure type %lld; handling as generic failure",
        (uint8_t *)&v17,
        0xCu);
    }

    unsigned int v6 = 3;
  }
  if (!a3)
  {
    char v9 = 0;
LABEL_17:

LABEL_18:
    +[ICQPurchase clearCacheAndNotifyClients];
    id v3 = 0;
    goto LABEL_19;
  }
LABEL_12:
  uint64_t v8 = SSError();
  char v9 = (void *)v8;
  if (!v6 || !v8) {
    goto LABEL_17;
  }
  int v10 = (void *)MEMORY[0x263F087E8];
  uint64_t v21 = *MEMORY[0x263F08608];
  v22[0] = v8;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v22 forKeys:&v21 count:1];
  id v3 = [v10 errorWithDomain:@"com.apple.Preferences.cloud-storage-offers" code:v6 userInfo:v11];

  if (!v3) {
    goto LABEL_18;
  }
LABEL_19:
  uint64_t v12 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = [NSNumber numberWithInteger:a3];
    int v17 = 138412546;
    int64_t v18 = (int64_t)v13;
    __int16 v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_22C821000, v12, OS_LOG_TYPE_DEFAULT, "user completed flow with ft=%@, error %@", (uint8_t *)&v17, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    id v16 = objc_loadWeakRetained((id *)&self->_delegate);
    [v16 commerceDelegate:self didCompleteWithError:v3];
  }
  else
  {
    [(ICQCommerceRemoteUIDelegate *)self cancelFlowBecause:@"flow is complete and client did not implement commerceDelegate:didCompleteWithError:"];
  }
LABEL_24:
}

- (void)cancelRemoteUI
{
}

- (void)cancelRemoteUIKeeping:(id)a3
{
  id v4 = a3;
  if (!self->_cancelled)
  {
    id v11 = v4;
    [(ICQCommerceRemoteUIDelegate *)self cleanupLoader];
    if (self->_pseudoModallyPresented)
    {
      navigationController = self->_navigationController;
    }
    else
    {
      if (v11 || !self->_modallyPresented)
      {
        [(NSMutableArray *)self->_objectModels removeAllObjects];
        uint64_t v8 = self->_navigationController;
        topViewController = self->_topViewController;
        if (v11) {
          [(UINavigationController *)v8 removeViewControllersAfter:topViewController before:v11 animated:0];
        }
        else {
          id v10 = [(UINavigationController *)v8 popToViewController:topViewController animated:1];
        }
        goto LABEL_8;
      }
      navigationController = self->_parentNavigationController;
    }
    [(UINavigationController *)navigationController dismissViewControllerAnimated:1 completion:0];
LABEL_8:
    unsigned int v6 = self->_navigationController;
    self->_navigationController = 0;

    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    dispatch_after(v7, MEMORY[0x263EF83A0], &__block_literal_global_201);
    self->_cancelled = 1;
    id v4 = v11;
  }
}

void __53__ICQCommerceRemoteUIDelegate_cancelRemoteUIKeeping___block_invoke()
{
  id v0 = +[ICQQuotaRequestManager sharedManager];
  [v0 noteQuotaInfoChanged];
}

- (void)makeBuyRequest:(id)a3
{
  v32[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Performing AMSPurchase request.", (uint8_t *)buf, 2u);
  }

  unsigned int v6 = [(ICQCommerceRemoteUIDelegate *)self buyParameters];
  if (v6 && (BOOL v7 = [v4 length] == 0, v6, v7))
  {
    uint64_t v8 = [(ICQCommerceRemoteUIDelegate *)self buyParameters];
    v26 = (void *)[v8 mutableCopy];

    objc_msgSend(v26, "objectForKeyedSubscript:", @"forRetailOffer", v26);
  }
  else
  {
    v24 = (void *)[NSURL copyDictionaryForQueryString:v4 unescapedValues:0];
    objc_msgSend(v24, "objectForKeyedSubscript:", @"forRetailOffer", v24);
  char v9 = };
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v9 BOOLValue]) {
    [(ICQCommerceRemoteUIDelegate *)self setForRetailOffer:1];
  }
  id v10 = objc_alloc(MEMORY[0x263F27E38]);
  id v11 = [MEMORY[0x263F27B28] quotaBag];
  uint64_t v12 = (void *)[v10 initWithBag:v11];

  [v12 setDelegate:self];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F27E30]) initWithConfiguration:v12];
  id v14 = objc_alloc(MEMORY[0x263F27E28]);
  char v15 = [MEMORY[0x263F27B80] buyParamsWithString:v4];
  id v16 = (void *)[v14 initWithPurchaseType:0 buyParams:v15];

  [v16 setUserInitiated:1];
  [v16 setAdditionalHeaders:&unk_26E01F2F8];
  v31 = @"mtTopic";
  v32[0] = @"xp_its_main";
  int v17 = [NSDictionary dictionaryWithObjects:v32 forKeys:&v31 count:1];
  [v16 setMetricsOverlay:v17];

  int64_t v18 = objc_msgSend(MEMORY[0x263EFB210], "ams_sharedAccountStore");
  if (objc_msgSend(v18, "ams_isActiveAccountCombined")) {
    objc_msgSend(v18, "ams_activeiTunesAccount");
  }
  else {
  __int16 v19 = objc_msgSend(v18, "ams_activeiCloudAccount");
  }
  [v16 setAccount:v19];

  v20 = [MEMORY[0x263F27E08] currentProcess];
  uint64_t v21 = [NSString stringWithFormat:@"CastleSettings/1.0"];
  [v20 setUserAgentSuffix:v21];

  [v16 setClientInfo:v20];
  char v30 = v16;
  id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
  v23 = [v13 enquePurchases:v22];

  objc_initWeak(buf, self);
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke;
  v27[3] = &unk_264923BA8;
  objc_copyWeak(&v28, buf);
  [v23 addFinishBlock:v27];
  objc_destroyWeak(&v28);
  objc_destroyWeak(buf);
}

void __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_cold_2((uint64_t)v4, v6);
  }

  if (WeakRetained)
  {
    if ([WeakRetained didUserDismissAMSFlow:v4])
    {
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_212;
      v13[3] = &unk_264921C80;
      v13[4] = WeakRetained;
      BOOL v7 = MEMORY[0x263EF83A0];
      uint64_t v8 = v13;
    }
    else
    {
      if (v4)
      {
        id v10 = [v4 userInfo];
        id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F27860]];

        objc_msgSend(WeakRetained, "userCompletedFlow:", objc_msgSend(v11, "integerValue"));
      }
      else
      {
        [WeakRetained userCompletedFlow:0];
      }
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_2;
      v12[3] = &unk_264921C80;
      v12[4] = WeakRetained;
      BOOL v7 = MEMORY[0x263EF83A0];
      uint64_t v8 = v12;
    }
    dispatch_async(v7, v8);
  }
  else
  {
    char v9 = _ICQGetLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_cold_1();
    }
  }
}

void __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_212(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 48) lastObject];
  [v1 stopNavigationBarSpinner];
}

void __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    if (*(unsigned char *)(v1 + 40) || *(unsigned char *)(v1 + 104))
    {
      [*(id *)(a1 + 32) cancelRemoteUIKeeping:0];
    }
    else
    {
      id v3 = [*(id *)(v1 + 8) topViewController];
      [(id)v1 cancelRemoteUIKeeping:v3];
    }
    id v4 = [*(id *)(*(void *)(a1 + 32) + 48) lastObject];
    [v4 stopNavigationBarSpinner];
  }
}

- (BOOL)didUserDismissAMSFlow:(id)a3
{
  id v3 = a3;
  if ([v3 code] == 100)
  {
    id v4 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = 0;
      id v5 = "Authentication failed";
      unsigned int v6 = (uint8_t *)&v12;
LABEL_8:
      _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  BOOL v7 = [v3 domain];
  if (![v7 isEqualToString:*MEMORY[0x263F27850]])
  {

    goto LABEL_11;
  }
  uint64_t v8 = [v3 code];

  if (v8 != 6)
  {
LABEL_11:
    BOOL v9 = 0;
    goto LABEL_12;
  }
  id v4 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v11 = 0;
    id v5 = "User Cancelled Oslo sheet";
    unsigned int v6 = (uint8_t *)&v11;
    goto LABEL_8;
  }
LABEL_9:

  BOOL v9 = 1;
LABEL_12:

  return v9;
}

- (void)processLink:(id)a3 forceAuth:(BOOL)a4
{
}

- (void)processLink:(id)a3 forceAuth:(BOOL)a4 needsAuth:(BOOL)a5
{
}

- (void)processLink:(id)a3 forceAuth:(BOOL)a4 needsAuth:(BOOL)a5 localAuth:(BOOL)a6
{
}

- (void)processLink:(id)a3 forceAuth:(BOOL)a4 needsAuth:(BOOL)a5 localAuth:(BOOL)a6 usePurchaseToken:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a4;
  uint64_t v86 = *MEMORY[0x263EF8340];
  id v11 = a3;
  NSUInteger v12 = [(NSOperationQueue *)self->_queue operationCount];
  uint64_t v13 = _ICQGetLogSystem();
  id v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ICQCommerceRemoteUIDelegate processLink:forceAuth:needsAuth:localAuth:usePurchaseToken:]();
    }
    goto LABEL_39;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v14, OS_LOG_TYPE_DEFAULT, "Performing legacy ISStoreURLOperation for quota purchase.", buf, 2u);
  }
  BOOL v78 = v9;

  id v14 = objc_alloc_init(MEMORY[0x263F89528]);
  char v15 = +[ISDataProvider provider];
  [v15 setParent:self];
  [v14 setDataProvider:v15];
  id v16 = [MEMORY[0x263F25750] sharedManager];
  int v17 = [v16 primaryAccount];

  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"ISAlwaysSendGuid", @"com.apple.itunesstored", 0);
  __int16 v19 = [v11 URLBagKey];
  if (v19)
  {

    goto LABEL_8;
  }
  int v74 = AppBooleanValue;
  v53 = [v11 URL];
  v54 = [v53 scheme];
  [v54 lowercaseString];
  v55 = v14;
  BOOL v56 = v8;
  BOOL v57 = v7;
  int v58 = v17;
  v60 = v59 = v15;
  char v76 = [v60 isEqualToString:@"https"];

  char v15 = v59;
  int v17 = v58;
  BOOL v7 = v57;
  BOOL v8 = v56;
  id v14 = v55;

  if ((v76 & 1) != 0 || v74)
  {
LABEL_8:
    v20 = [MEMORY[0x263F7B288] contextForSignIn];
    uint64_t v21 = [v17 username];
    [v20 setAccountName:v21];

    id v22 = NSNumber;
    v23 = [v17 personID];
    v24 = objc_msgSend(v22, "numberWithUnsignedLongLong:", objc_msgSend(v23, "longLongValue"));
    [v20 setRequiredUniqueIdentifier:v24];

    [v20 setAccountNameEditable:0];
    [v20 setShouldFollowAccountButtons:1];
    if (v78)
    {
      [v20 setPromptStyle:1];
    }
    else if (!v8)
    {
      goto LABEL_12;
    }
    [v14 setNeedsAuthentication:1];
LABEL_12:
    [v14 setAuthenticationContext:v20];
    v77 = v17;
    if (v7
      && ([(ICQCommerceRemoteUIDelegate *)self purchaseToken],
          v25 = objc_claimAutoreleasedReturnValue(),
          v25,
          v25))
    {
      v26 = [MEMORY[0x263F25820] currentInfo];
      uint64_t v27 = [v26 clientInfoHeader];

      if (v27) {
        [v11 setValue:v27 forHTTPHeaderField:@"X-MMe-Client-Info"];
      }
      uint64_t v73 = (void *)v27;
      v75 = v20;
      v79 = v15;
      id v28 = [v17 account];
      uint64_t v29 = objc_msgSend(v28, "aa_altDSID");

      if (v29) {
        [v11 setValue:v29 forHTTPHeaderField:@"X-Apple-ADSID"];
      }
      id v72 = (void *)v29;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      char v30 = [(ICQCommerceRemoteUIDelegate *)self requestHeaders];
      uint64_t v31 = [v30 countByEnumeratingWithState:&v80 objects:v85 count:16];
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v81;
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v81 != v33) {
              objc_enumerationMutation(v30);
            }
            uint64_t v35 = *(void *)(*((void *)&v80 + 1) + 8 * i);
            v36 = [(ICQCommerceRemoteUIDelegate *)self requestHeaders];
            int v37 = [v36 objectForKeyedSubscript:v35];

            [v11 setValue:v37 forHTTPHeaderField:v35];
          }
          uint64_t v32 = [v30 countByEnumeratingWithState:&v80 objects:v85 count:16];
        }
        while (v32);
      }

      v38 = (void *)MGCopyAnswer();
      [v11 setValue:v38 forHTTPHeaderField:@"X-Mme-Device-Id"];
      v39 = [MEMORY[0x263EFFA18] systemTimeZone];
      v40 = [v39 abbreviation];
      [v11 setValue:v40 forHTTPHeaderField:@"X-MMe-Timezone"];

      v41 = [MEMORY[0x263EFF960] currentLocale];
      v42 = [v41 objectForKey:*MEMORY[0x263EFF4D0]];
      v43 = [v42 uppercaseString];
      [v11 setValue:v43 forHTTPHeaderField:@"X-MMe-Country"];

      v44 = v72;
      if (v72)
      {
        id v45 = v72;
      }
      else
      {
        id v45 = [v77 personID];
      }
      v61 = v45;
      v20 = v75;
      uint64_t v62 = NSString;
      int v63 = [(ICQCommerceRemoteUIDelegate *)self purchaseToken];
      v64 = [v62 stringWithFormat:@"%@:%@", v61, v63];

      v65 = [v64 dataUsingEncoding:4];
      v66 = [v65 base64EncodedStringWithOptions:0];
      if (v66) {
        [v11 setValue:v66 forHTTPHeaderField:@"X-Apple-GS-Token"];
      }

      char v15 = v79;
      v50 = v73;
    }
    else
    {
      v46 = NSString;
      v47 = [v17 personID];
      uint64_t v48 = [v17 authToken];
      v49 = [v46 stringWithFormat:@"%@:%@", v47, v48];

      v50 = v49;
      v51 = [v49 dataUsingEncoding:4];
      uint64_t v52 = [v51 base64EncodedStringWithOptions:0];

      v44 = (void *)v52;
      v38 = [NSString stringWithFormat:@"%@", v52];
      [v11 setValue:v38 forHTTPHeaderField:@"Authorization"];
    }

    v67 = [MEMORY[0x263F89480] sharedInstance];
    v68 = [v67 guid];
    [v11 setValue:v68 forRequestParameter:@"guid"];

    int v17 = v77;
  }
  v69 = [MEMORY[0x263EFF8C0] arrayWithObject:@"CastleSettings/1.0"];
  [v11 setUserAgentComponents:v69];

  [v14 setRequestProperties:v11];
  [v14 setDelegate:self];
  if (!self->_registeredDialogNotification)
  {
    v70 = [MEMORY[0x263F08A00] defaultCenter];
    [v70 addObserver:self selector:sel_handleDialog_ name:*MEMORY[0x263F893F8] object:0];

    self->_registeredDialogNotification = 1;
  }
  v71 = [MEMORY[0x263F82438] sharedApplication];
  [v71 setNetworkActivityIndicatorVisible:1];

  [(NSOperationQueue *)self->_queue addOperation:v14];
LABEL_39:
}

- (id)parentViewControllerForObjectModel:(id)a3
{
  id v4 = a3;
  navigationController = self->_navigationController;
  if (!navigationController) {
    -[ICQCommerceRemoteUIDelegate parentViewControllerForObjectModel:]();
  }
  unsigned int v6 = navigationController;

  return v6;
}

- (void)_popObjectModelAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(NSMutableArray *)self->_objectModels count]) {
    -[ICQCommerceRemoteUIDelegate _popObjectModelAnimated:]();
  }
  id v5 = [(NSMutableArray *)self->_objectModels lastObject];
  id v12 = [v5 defaultPages];

  [(NSMutableArray *)self->_objectModels removeLastObject];
  uint64_t v6 = [v12 count] - 1;
  if (v6 >= 0)
  {
    do
    {
      BOOL v7 = [v12 objectAtIndex:v6];
      BOOL v8 = [(UINavigationController *)self->_navigationController topViewController];

      if (v8 == v7)
      {
        if (v6) {
          BOOL v9 = 0;
        }
        else {
          BOOL v9 = v3;
        }
        id v10 = [(UINavigationController *)self->_navigationController popViewControllerAnimated:v9];
      }
    }
    while (v6-- > 0);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return MEMORY[0x270F55308](self, a2);
}

- (void)objectModelPressedBack:(id)a3
{
  id v9 = a3;
  id v4 = [(UINavigationController *)self->_navigationController topViewController];
  id v5 = [(UINavigationController *)self->_navigationController popViewControllerAnimated:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    if (v6)
    {
      BOOL v7 = [v9 defaultPages];
      int v8 = [v7 containsObject:v6];

      if (v8) {
        [(NSMutableArray *)self->_objectModels removeLastObject];
      }
    }
  }
  else
  {
    id v6 = 0;
  }
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 objectForKeyedSubscript:@"ams_followup"];
  if ([v10 isEqualToString:@"clear"]) {
    [(ICQCommerceRemoteUIDelegate *)self _clearRetailFollowUpItem];
  }
  if ([v8 isEqualToString:@"cancel"])
  {
    [(ICQCommerceRemoteUIDelegate *)self cancelFlowBecause:@"cancel button pressed in RUI object model"];
    [(ICQCommerceRemoteUIDelegate *)self cancelRemoteUI];
  }
  else if ([v8 isEqualToString:@"buy"])
  {
    id v11 = [v20 defaultPages];
    id v12 = [v11 lastObject];
    uint64_t v13 = [v12 navTitle];

    [v20 startNavigationBarSpinnerWithTitle:v13];
    id v14 = [MEMORY[0x263EFF9A0] dictionary];
    char v15 = [v20 defaultPages];
    id v16 = [v15 lastObject];
    [v16 populatePostbackDictionary:v14];

    int v17 = [v14 objectForKey:@"quota"];
    if (!v17)
    {
      int64_t v18 = [v9 objectForKeyedSubscript:@"id"];
      int v19 = [v18 isEqualToString:@"quota"];

      if (v19)
      {
        int v17 = [v9 objectForKeyedSubscript:@"value"];
      }
      else
      {
        int v17 = 0;
      }
    }
    [(ICQCommerceRemoteUIDelegate *)self makeBuyRequest:v17];
  }
  else if ([v8 isEqualToString:@"pop"])
  {
    [(ICQCommerceRemoteUIDelegate *)self _popObjectModelAnimated:1];
  }
}

- (void)objectModel:(id)a3 pressedLink:(id)a4 httpMethod:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  if (![(ICQCommerceRemoteUIDelegate *)self _loadNativeURL:v8])
  {
    id v10 = [v9 lowercaseString];
    int v11 = [v10 isEqualToString:@"post"];

    if (v11)
    {
      id v12 = [MEMORY[0x263EFF9A0] dictionary];
      uint64_t v13 = [v19 defaultPages];
      id v14 = [v13 lastObject];
      [v14 populatePostbackDictionary:v12];

      char v15 = [MEMORY[0x263F08AC0] dataWithPropertyList:v12 format:100 options:0 error:0];
    }
    else
    {
      char v15 = 0;
    }
    id v16 = (void *)[objc_alloc(MEMORY[0x263F7B290]) initWithURL:v8];
    [v16 setHTTPMethod:v9];
    if (v15)
    {
      [v16 setHTTPBody:v15];
      [v16 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"Content-Type"];
    }
    int v17 = [v8 scheme];
    int64_t v18 = [v17 lowercaseString];
    -[ICQCommerceRemoteUIDelegate processLink:forceAuth:needsAuth:](self, "processLink:forceAuth:needsAuth:", v16, 0, [v18 isEqualToString:@"https"]);
  }
}

- (BOOL)_loadNativeURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 scheme];
  int v5 = [v4 isEqualToString:@"ams-ui"];

  if (v5)
  {
    id v6 = [MEMORY[0x263F01880] defaultWorkspace];
    [v6 openSensitiveURL:v3 withOptions:0];
  }
  return v5;
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
  id v4 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "accountPageViewController finished", v5, 2u);
  }

  [(ICQCommerceRemoteUIDelegate *)self cancelFlowBecause:@"account page view controller did finish"];
  [(ICQCommerceRemoteUIDelegate *)self cancelRemoteUI];
}

- (void)accountPageViewController:(id)a3 financeInterruptionResolved:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = (SKAccountPageViewController *)a3;
  if (self->_accountPageViewController != v6) {
    -[ICQCommerceRemoteUIDelegate accountPageViewController:financeInterruptionResolved:]();
  }
  BOOL v7 = v6;
  id v8 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    if (v4) {
      id v9 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    char v15 = v9;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "accountPageViewController finance interruption resolved: %@", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__ICQCommerceRemoteUIDelegate_accountPageViewController_financeInterruptionResolved___block_invoke;
  block[3] = &unk_264921C30;
  block[4] = self;
  id v12 = v7;
  BOOL v13 = v4;
  id v10 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __85__ICQCommerceRemoteUIDelegate_accountPageViewController_financeInterruptionResolved___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _popAccountPageViewController:*(void *)(a1 + 40) keepCommerceSpinner:*(unsigned __int8 *)(a1 + 48)];
  if (*(unsigned char *)(a1 + 48))
  {
    id v2 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v5 = 0;
      _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "retry the buy after fixing payment method", v5, 2u);
    }

    return [*(id *)(a1 + 32) makeBuyRequest:&stru_26DFF2C90];
  }
  else
  {
    [*(id *)(a1 + 32) cancelFlowBecause:@"payment method not established"];
    BOOL v4 = *(void **)(a1 + 32);
    return [v4 cancelRemoteUI];
  }
}

- (void)_dismissAccountPageViewController:(id)a3 keepCommerceSpinner:(BOOL)a4
{
  id v6 = (SKAccountPageViewController *)a3;
  if (self->_accountPageViewController != v6) {
    -[ICQCommerceRemoteUIDelegate _dismissAccountPageViewController:keepCommerceSpinner:]();
  }
  BOOL v7 = v6;
  id v8 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "dismiss accountPageViewController", buf, 2u);
  }

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __85__ICQCommerceRemoteUIDelegate__dismissAccountPageViewController_keepCommerceSpinner___block_invoke;
  v10[3] = &unk_264921C30;
  BOOL v12 = a4;
  void v10[4] = self;
  int v11 = v7;
  id v9 = v7;
  [(SKAccountPageViewController *)v9 dismissViewControllerAnimated:1 completion:v10];
}

uint64_t __85__ICQCommerceRemoteUIDelegate__dismissAccountPageViewController_keepCommerceSpinner___block_invoke(uint64_t a1)
{
  id v2 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "accountPageViewController dismissed", v4, 2u);
  }

  if (!*(unsigned char *)(a1 + 48)) {
    [*(id *)(a1 + 32) _popCommerceSpinnerIfNeeded];
  }
  return [*(id *)(a1 + 32) _forgetAccountPageViewController:*(void *)(a1 + 40)];
}

- (void)_popAccountPageViewController:(id)a3 keepCommerceSpinner:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = (SKAccountPageViewController *)a3;
  if (self->_accountPageViewController != v6) {
    -[ICQCommerceRemoteUIDelegate _popAccountPageViewController:keepCommerceSpinner:]();
  }
  BOOL v7 = v6;
  id v8 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = @"NO";
    if (v4) {
      id v9 = @"YES";
    }
    int v19 = 138412290;
    id v20 = v9;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "pop accountPageViewController; keepCommerceSpinner: %@",
      (uint8_t *)&v19,
      0xCu);
  }

  uint64_t v10 = [(UINavigationController *)self->_navigationController topViewController];
  if ((SKAccountPageViewController *)v10 == v7)
  {
LABEL_13:
    uint64_t v16 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_22C821000, v16, OS_LOG_TYPE_DEFAULT, "popping accountPageViewController", (uint8_t *)&v19, 2u);
    }

    id v17 = [(UINavigationController *)self->_navigationController popViewControllerAnimated:v4];
    int v11 = (UIViewController *)v7;
  }
  else
  {
    int v11 = (UIViewController *)v10;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      topViewController = self->_topViewController;
      BOOL v13 = ICQUSLogForCategory(0);
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v11 == topViewController)
      {
        if (v14)
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "popped to initial view controller; not popping further",
            (uint8_t *)&v19,
            2u);
        }

        goto LABEL_22;
      }
      if (v14)
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_22C821000, v13, OS_LOG_TYPE_DEFAULT, "popping unknown VC; assuming it's after the accountPageViewController",
          (uint8_t *)&v19,
          2u);
      }

      id v15 = [(UINavigationController *)self->_navigationController popViewControllerAnimated:0];
      int v11 = [(UINavigationController *)self->_navigationController topViewController];
      if (v11 == (UIViewController *)v7) {
        goto LABEL_13;
      }
    }
    int64_t v18 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_22C821000, v18, OS_LOG_TYPE_DEFAULT, "at CommerceSpinner", (uint8_t *)&v19, 2u);
    }
  }
LABEL_22:

  if (!v4) {
    [(ICQCommerceRemoteUIDelegate *)self _popCommerceSpinnerIfNeeded];
  }
  [(ICQCommerceRemoteUIDelegate *)self _forgetAccountPageViewController:v7];
}

- (void)_forgetAccountPageViewController:(id)a3
{
  BOOL v4 = (SKAccountPageViewController *)a3;
  if (self->_accountPageViewController != v4) {
    -[ICQCommerceRemoteUIDelegate _forgetAccountPageViewController:]();
  }
  id v6 = v4;
  [(SKAccountPageViewController *)v4 setDelegate:0];
  accountPageViewController = self->_accountPageViewController;
  self->_accountPageViewController = 0;
}

- (BOOL)_shouldSuppressDialog:(id)a3 failureType:(int64_t)a4
{
  BOOL result = [(ICQCommerceRemoteUIDelegate *)self skipCompletionAlert];
  if ((unint64_t)(a4 - 3067) >= 2) {
    return 0;
  }
  return result;
}

- (void)handleDialog:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 object];
    *(_DWORD *)buf = 138412290;
    int v11 = v6;
    _os_log_impl(&dword_22C821000, v5, OS_LOG_TYPE_DEFAULT, "Dialog notification arrived... %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __44__ICQCommerceRemoteUIDelegate_handleDialog___block_invoke;
  v8[3] = &unk_264921B68;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __44__ICQCommerceRemoteUIDelegate_handleDialog___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __44__ICQCommerceRemoteUIDelegate_handleDialog___block_invoke_2;
  v2[3] = &unk_264921B68;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 _dismissAlertsWithCompletion:v2];
}

void __44__ICQCommerceRemoteUIDelegate_handleDialog___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldSuppressDialog:failureType:", *(void *)(*(void *)(a1 + 32) + 64), objc_msgSend(*(id *)(a1 + 32), "failureType")))
  {
    id v2 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = [*(id *)(a1 + 32) failureType];
      id v4 = [*(id *)(*(void *)(a1 + 32) + 64) title];
      int v5 = [*(id *)(*(void *)(a1 + 32) + 64) message];
      int v15 = 134218498;
      uint64_t v16 = v3;
      __int16 v17 = 2114;
      int64_t v18 = v4;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "suppressing dialog of failureType:%lld, title:%{public}@, message:%{public}@", (uint8_t *)&v15, 0x20u);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 64);
    *(void *)(v6 + 64) = 0;
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 40) object];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 64);
    *(void *)(v9 + 64) = v8;

    int v11 = ICQUSLogForCategory(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [*(id *)(a1 + 32) failureType];
      BOOL v13 = [*(id *)(*(void *)(a1 + 32) + 64) title];
      BOOL v14 = [*(id *)(*(void *)(a1 + 32) + 64) message];
      int v15 = 134218498;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      int64_t v18 = v13;
      __int16 v19 = 2114;
      id v20 = v14;
      _os_log_impl(&dword_22C821000, v11, OS_LOG_TYPE_DEFAULT, "Presenting dialog of failureType:%lld, title:%{public}@, message:%{public}@", (uint8_t *)&v15, 0x20u);
    }
    [*(id *)(a1 + 32) _presentAlertWithDialog:*(void *)(*(void *)(a1 + 32) + 64)];
  }
}

- (void)_dismissAlertsWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  int v5 = v4;
  alertController = self->_alertController;
  if (alertController)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __60__ICQCommerceRemoteUIDelegate__dismissAlertsWithCompletion___block_invoke;
    v7[3] = &unk_2649223B8;
    v7[4] = self;
    uint64_t v8 = v4;
    [(UIAlertController *)alertController dismissViewControllerAnimated:1 completion:v7];
  }
  else
  {
    v4[2](v4);
  }
}

uint64_t __60__ICQCommerceRemoteUIDelegate__dismissAlertsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 64);
  *(void *)(v2 + 64) = 0;

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)_presentAlertWithDialog:(id)a3
{
  id v4 = a3;
  int v5 = (void *)MEMORY[0x263F82418];
  uint64_t v6 = [v4 title];
  id v7 = [v4 message];
  uint64_t v8 = [v5 alertControllerWithTitle:v6 message:v7 preferredStyle:1];
  alertController = self->_alertController;
  self->_alertController = v8;

  uint64_t v10 = [v4 buttons];
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  int v15 = __55__ICQCommerceRemoteUIDelegate__presentAlertWithDialog___block_invoke;
  uint64_t v16 = &unk_264923BF8;
  __int16 v17 = self;
  id v18 = v4;
  id v11 = v4;
  [v10 enumerateObjectsUsingBlock:&v13];

  uint64_t v12 = [(ICQCommerceRemoteUIDelegate *)self presentationContext];
  [v12 presentViewController:self->_alertController animated:1 completion:0];
}

void __55__ICQCommerceRemoteUIDelegate__presentAlertWithDialog___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v5 = *(void **)(*(void *)(a1 + 32) + 80);
  uint64_t v6 = (void *)MEMORY[0x263F82400];
  id v7 = [a2 title];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__ICQCommerceRemoteUIDelegate__presentAlertWithDialog___block_invoke_2;
  v10[3] = &unk_264923BD0;
  uint64_t v8 = *(void **)(a1 + 40);
  void v10[4] = *(void *)(a1 + 32);
  id v11 = v8;
  uint64_t v12 = a3;
  uint64_t v9 = [v6 actionWithTitle:v7 style:0 handler:v10];
  [v5 addAction:v9];
}

void __55__ICQCommerceRemoteUIDelegate__presentAlertWithDialog___block_invoke_2(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) _handleResponseForDialog:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = 0;

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 88);
  if (v5)
  {
    if ((v2 & 1) == 0)
    {
      uint64_t v6 = ICQUSLogForCategory(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_22C821000, v6, OS_LOG_TYPE_DEFAULT, "need to wait for async response", v9, 2u);
      }

      *(unsigned char *)(*(void *)(a1 + 32) + 110) = 1;
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 88);
    }
    (*(void (**)(void))(v5 + 16))();
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 88);
    *(void *)(v7 + 88) = 0;
  }
}

- (id)presentationContext
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  navigationController = self->_navigationController;
  if (!navigationController) {
    navigationController = self->_parentNavigationController;
  }
  uint64_t v3 = navigationController;
  id v4 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [(UINavigationController *)v3 presentedViewController];
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl(&dword_22C821000, v4, OS_LOG_TYPE_DEFAULT, "Presenting alert on controller: %@ - %@", (uint8_t *)&v7, 0x16u);
  }
  return v3;
}

- (BOOL)_handleResponseForDialog:(id)a3 atIndex:(int64_t)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = [v6 buttons];
  if ([v7 count] <= (unint64_t)a4)
  {
    BOOL v17 = 1;
  }
  else
  {
    uint64_t v8 = [v7 objectAtIndex:a4];
    switch([v8 actionType])
    {
      case 1u:
        __int16 v9 = [v8 parameter];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = [NSURL URLWithString:v9];

          __int16 v9 = (void *)v10;
        }
        uint64_t v11 = [v9 schemeSwizzledURL];
        [v8 urlType];
        id v12 = objc_alloc(MEMORY[0x263F7B290]);
        uint64_t v13 = [MEMORY[0x263F08BD8] requestWithURL:v11];
        uint64_t v14 = (void *)[v12 initWithURLRequest:v13];

        int v15 = [v11 scheme];
        uint64_t v16 = [v15 lowercaseString];
        -[ICQCommerceRemoteUIDelegate processLink:forceAuth:needsAuth:](self, "processLink:forceAuth:needsAuth:", v14, 0, [v16 isEqualToString:@"https"]);

        goto LABEL_15;
      case 2u:
        id v18 = [v8 parameter];
        __int16 v19 = ICQUSLogForCategory(0);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          char v30 = v18;
          _os_log_impl(&dword_22C821000, v19, OS_LOG_TYPE_DEFAULT, "GotoFinance %@", buf, 0xCu);
        }

        if (self->_accountPageViewController)
        {
          id v20 = ICQUSLogForCategory(0);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            -[ICQCommerceRemoteUIDelegate _handleResponseForDialog:atIndex:]();
          }
        }
        uint64_t v21 = (SKAccountPageViewController *)[objc_alloc(MEMORY[0x263F17F90]) initWithAccountURL:v18];
        accountPageViewController = self->_accountPageViewController;
        self->_accountPageViewController = v21;

        [(SKAccountPageViewController *)self->_accountPageViewController setDelegate:self];
        v23 = self->_accountPageViewController;
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __64__ICQCommerceRemoteUIDelegate__handleResponseForDialog_atIndex___block_invoke;
        v28[3] = &unk_264921C80;
        v28[4] = self;
        [(SKAccountPageViewController *)v23 loadWithCompletionBlock:v28];

        goto LABEL_25;
      case 3u:
        __int16 v9 = [v8 parameter];
        [(ICQCommerceRemoteUIDelegate *)self makeBuyRequest:v9];
LABEL_15:

        BOOL v17 = 0;
        break;
      case 4u:
        v24 = [v8 parameter];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v25 = [NSURL URLWithString:v24];

          v24 = (void *)v25;
        }
        if ([v24 isSafeExternalURL])
        {
          v26 = [MEMORY[0x263F82438] sharedApplication];
          [v26 openURL:v24 options:MEMORY[0x263EFFA78] completionHandler:0];
        }
        goto LABEL_25;
      case 5u:
        [(ICQCommerceRemoteUIDelegate *)self cancelFlowBecause:@"dialog button pressed with action GoBack"];
        goto LABEL_24;
      case 0xBu:
        [v8 performDefaultActionForDialog:v6];
LABEL_24:
        [(ICQCommerceRemoteUIDelegate *)self cancelRemoteUI];
LABEL_25:
        BOOL v17 = 1;
        break;
      default:
        [(ICQCommerceRemoteUIDelegate *)self _popCommerceSpinnerIfNeeded];
        BOOL v17 = 1;
        [(ICQCommerceRemoteUIDelegate *)self setDidJustCancelDialog:1];
        break;
    }
  }
  return v17;
}

uint64_t __64__ICQCommerceRemoteUIDelegate__handleResponseForDialog_atIndex___block_invoke(uint64_t a1)
{
  char v2 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "accountPageViewController completed loading; pushing with loaded HTML content",
      v4,
      2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) pushViewController:*(void *)(*(void *)(a1 + 32) + 32) animated:1];
}

- (ICQCommerceRemoteUIDelegate)initWithNavigationController:(id)a3 needsModalPresentation:(BOOL)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ICQCommerceRemoteUIDelegate;
  int v7 = [(ICQCommerceRemoteUIDelegate *)&v20 init];
  uint64_t v8 = v7;
  if (v7)
  {
    if (!v6) {
      -[ICQCommerceRemoteUIDelegate initWithNavigationController:needsModalPresentation:]();
    }
    v7->_BOOL modallyPresented = a4;
    __int16 v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    objectModels = v8->_objectModels;
    v8->_objectModels = v9;

    BOOL modallyPresented = v8->_modallyPresented;
    id v12 = (UINavigationController *)v6;
    uint64_t v13 = v12;
    if (modallyPresented)
    {
      parentNavigationController = v8->_parentNavigationController;
      v8->_parentNavigationController = v12;
    }
    else
    {
      navigationController = v8->_navigationController;
      v8->_navigationController = v12;

      uint64_t v16 = [(UINavigationController *)v13 topViewController];
      parentNavigationController = (UINavigationController *)v8->_topViewController;
      v8->_topViewController = (UIViewController *)v16;
    }

    BOOL v17 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    queue = v8->_queue;
    v8->_queue = v17;
  }
  return v8;
}

- (void)dealloc
{
  [(ICQCommerceRemoteUIDelegate *)self cleanupLoader];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x263F7BDA0], 0);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)*MEMORY[0x263F7BD98], 0);
  uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self, (CFNotificationName)*MEMORY[0x263F7BD90], 0);
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x263F893F8] object:0];

  v7.receiver = self;
  v7.super_class = (Class)ICQCommerceRemoteUIDelegate;
  [(ICQCommerceRemoteUIDelegate *)&v7 dealloc];
}

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  uint64_t v10 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "We were asked to authenticate.  Attempting silent authentication.", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__ICQCommerceRemoteUIDelegate_handleAuthenticateRequest_purchase_purchaseQueue_completion___block_invoke;
  block[3] = &unk_2649224C0;
  id v14 = v8;
  int v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __91__ICQCommerceRemoteUIDelegate_handleAuthenticateRequest_purchase_purchaseQueue_completion___block_invoke(id *a1)
{
  id v2 = objc_alloc(MEMORY[0x263F27FC0]);
  uint64_t v3 = [a1[4] account];
  id v4 = [a1[5] presentationContext];
  uint64_t v5 = [a1[4] options];
  id v6 = (void *)[v2 initWithAccount:v3 presentingViewController:v4 options:v5];

  objc_super v7 = [v6 performAuthentication];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __91__ICQCommerceRemoteUIDelegate_handleAuthenticateRequest_purchase_purchaseQueue_completion___block_invoke_2;
  v8[3] = &unk_264922498;
  id v9 = a1[6];
  [v7 addFinishBlock:v8];
}

void __91__ICQCommerceRemoteUIDelegate_handleAuthenticateRequest_purchase_purchaseQueue_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  objc_super v7 = ICQUSLogForCategory(0);
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __68__ICQUIOSLOPresenter_handleAuthenticateRequest_purchase_completion___block_invoke_2_cold_1((uint64_t)v5, v8);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_22C821000, v8, OS_LOG_TYPE_DEFAULT, "Successfully finished silent authentication.", v9, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)handleDialogRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  uint64_t v10 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "We were asked to handle a dialog request", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __85__ICQCommerceRemoteUIDelegate_handleDialogRequest_purchase_purchaseQueue_completion___block_invoke;
  block[3] = &unk_2649224C0;
  id v14 = v8;
  int v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __85__ICQCommerceRemoteUIDelegate_handleDialogRequest_purchase_purchaseQueue_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F27FB8]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) presentationContext];
  id v6 = (id)[v2 initWithRequest:v3 presentingViewController:v4];

  id v5 = [v6 present];
  [v5 addFinishBlock:*(void *)(a1 + 48)];
}

- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 purchaseQueue:(id)a5 completion:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  uint64_t v10 = ICQUSLogForCategory(0);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v10, OS_LOG_TYPE_DEFAULT, "We were asked to handle an engagement request", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__ICQCommerceRemoteUIDelegate_handleEngagementRequest_purchase_purchaseQueue_completion___block_invoke;
  block[3] = &unk_2649224C0;
  id v14 = v8;
  int v15 = self;
  id v16 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __89__ICQCommerceRemoteUIDelegate_handleEngagementRequest_purchase_purchaseQueue_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F27FE8]);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [MEMORY[0x263F27B28] quotaBag];
  id v5 = [*(id *)(a1 + 40) presentationContext];
  id v7 = (id)[v2 initWithRequest:v3 bag:v4 presentingViewController:v5];

  id v6 = [v7 presentEngagement];
  [v6 addFinishBlock:*(void *)(a1 + 48)];
}

- (ICQCommerceRemoteUIDelegateDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICQCommerceRemoteUIDelegateDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)skipRetryWithoutToken
{
  return self->_skipRetryWithoutToken;
}

- (void)setSkipRetryWithoutToken:(BOOL)a3
{
  self->_skipRetryWithoutToken = a3;
}

- (BOOL)skipCompletionAlert
{
  return self->_skipCompletionAlert;
}

- (void)setSkipCompletionAlert:(BOOL)a3
{
  self->_skipCompletionAlert = a3;
}

- (BOOL)supportsModernAlerts
{
  return self->_supportsModernAlerts;
}

- (void)setSupportsModernAlerts:(BOOL)a3
{
  self->_supportsModernAlerts = a3;
}

- (BOOL)shouldOfferFamilySharePlansOnly
{
  return self->_shouldOfferFamilySharePlansOnly;
}

- (void)setShouldOfferFamilySharePlansOnly:(BOOL)a3
{
  self->_shouldOfferFamilySharePlansOnly = a3;
}

- (BOOL)shouldOfferDeviceOffers
{
  return self->_shouldOfferDeviceOffers;
}

- (void)setShouldOfferDeviceOffers:(BOOL)a3
{
  self->_shouldOfferDeviceOffers = a3;
}

- (BOOL)skipGoBack
{
  return self->_skipGoBack;
}

- (void)setSkipGoBack:(BOOL)a3
{
  self->_skipGoBack = a3;
}

- (BOOL)didJustCancelDialog
{
  return self->_didJustCancelDialog;
}

- (void)setDidJustCancelDialog:(BOOL)a3
{
  self->_didJustCancelDialog = a3;
}

- (BOOL)forRetailOffer
{
  return self->_forRetailOffer;
}

- (void)setForRetailOffer:(BOOL)a3
{
  self->_forRetailOffer = a3;
}

- (NSString)purchaseToken
{
  return self->_purchaseToken;
}

- (void)setPurchaseToken:(id)a3
{
}

- (NSDictionary)buyParameters
{
  return self->_buyParameters;
}

- (void)setBuyParameters:(id)a3
{
}

- (NSDictionary)requestHeaders
{
  return self->_requestHeaders;
}

- (void)setRequestHeaders:(id)a3
{
}

- (int64_t)failureType
{
  return self->_failureType;
}

- (void)setFailureType:(int64_t)a3
{
  self->_failureType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHeaders, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_purchaseToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_finishingOperation, 0);
  objc_storeStrong(&self->_queuedCompletionBlock, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_objectModels, 0);
  objc_storeStrong((id *)&self->_accountPageViewController, 0);
  objc_storeStrong((id *)&self->_topViewController, 0);
  objc_storeStrong((id *)&self->_parentNavigationController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

- (void)_handleFinishForOperation:withOutput:.cold.1()
{
}

- (void)cancelFlowBecause:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Cancel called on already cancelled ICQCommerceRemoteUIDelegate", v2, v3, v4, v5, v6);
}

- (void)userCompletedFlow:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "Completed called on already cancelled ICQCommerceRemoteUIDelegate", v2, v3, v4, v5, v6);
}

void __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "CommerceRemoteUIDelegate object got destroyed.", v2, v3, v4, v5, v6);
}

void __46__ICQCommerceRemoteUIDelegate_makeBuyRequest___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "AMS Purchase completed with error %@", (uint8_t *)&v2, 0xCu);
}

- (void)processLink:forceAuth:needsAuth:localAuth:usePurchaseToken:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "ISStoreURLOperation request is already in progress. Bailing", v2, v3, v4, v5, v6);
}

- (void)parentViewControllerForObjectModel:.cold.1()
{
}

- (void)_popObjectModelAnimated:.cold.1()
{
}

- (void)accountPageViewController:financeInterruptionResolved:.cold.1()
{
  __assert_rtn("-[ICQCommerceRemoteUIDelegate accountPageViewController:financeInterruptionResolved:]", "ICQCommerceRemoteUIDelegate.m", 1143, "_accountPageViewController == viewController");
}

- (void)_dismissAccountPageViewController:keepCommerceSpinner:.cold.1()
{
  __assert_rtn("-[ICQCommerceRemoteUIDelegate _dismissAccountPageViewController:keepCommerceSpinner:]", "ICQCommerceRemoteUIDelegate.m", 1161, "_accountPageViewController == viewController");
}

- (void)_popAccountPageViewController:keepCommerceSpinner:.cold.1()
{
  __assert_rtn("-[ICQCommerceRemoteUIDelegate _popAccountPageViewController:keepCommerceSpinner:]", "ICQCommerceRemoteUIDelegate.m", 1177, "_accountPageViewController == viewController");
}

- (void)_forgetAccountPageViewController:.cold.1()
{
  __assert_rtn("-[ICQCommerceRemoteUIDelegate _forgetAccountPageViewController:]", "ICQCommerceRemoteUIDelegate.m", 1207, "_accountPageViewController == viewController");
}

- (void)_handleResponseForDialog:atIndex:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_22C821000, v0, v1, "more than one GotoFinance in the same flow!", v2, v3, v4, v5, v6);
}

- (void)initWithNavigationController:needsModalPresentation:.cold.1()
{
}

@end