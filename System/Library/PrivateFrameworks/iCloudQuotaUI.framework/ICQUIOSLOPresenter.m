@interface ICQUIOSLOPresenter
+ (id)parsePurchaseParams:(id)a3;
- (BOOL)isLiftUIFlow;
- (ICQUIOSLOPresenter)initWithOffer:(id)a3 link:(id)a4 presenter:(id)a5;
- (ICQUIOSLOPresenterDelegate)delegate;
- (NSString)_sceneIdentifier;
- (id)_createPostPurchaseICQLink;
- (void)_handlePostPurchaseFlow;
- (void)_handlePostPurchaseLiftUIFlow;
- (void)_handlePostPurchaseRemoteUIFlow;
- (void)beginOSLOPurchaseFlow;
- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 completion:(id)a5;
- (void)handleDialogRequest:(id)a3 purchase:(id)a4 completion:(id)a5;
- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 completion:(id)a5;
- (void)liftUIPresenterDidCancel:(id)a3;
- (void)liftUIPresenterDidComplete:(id)a3;
- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5;
- (void)remoteUIFlowManager:(id)a3 didDismissWithError:(id)a4;
- (void)remoteUIFlowManager:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation ICQUIOSLOPresenter

- (ICQUIOSLOPresenter)initWithOffer:(id)a3 link:(id)a4 presenter:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICQUIOSLOPresenter;
  v12 = [(ICQUIOSLOPresenter *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_offer, a3);
    objc_storeStrong((id *)&v13->_link, a4);
    objc_storeWeak((id *)&v13->_presenter, v11);
  }

  return v13;
}

- (NSString)_sceneIdentifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  v3 = [WeakRetained view];
  v4 = [v3 window];
  v5 = [v4 windowScene];
  v6 = [v5 _sceneIdentifier];

  return (NSString *)v6;
}

- (id)_createPostPurchaseICQLink
{
  id v3 = objc_alloc(MEMORY[0x263F88908]);
  v4 = [(NSDictionary *)self->_purchaseParams objectForKeyedSubscript:*MEMORY[0x263F889A8]];
  v5 = (void *)[v3 initWithActionString:v4];

  return v5;
}

- (void)beginOSLOPurchaseFlow
{
  purchase = self->_purchase;
  if (!purchase)
  {
    v4 = +[ICQUIOSLOPresenter parsePurchaseParams:self->_link];
    v5 = [[ICQPurchase alloc] initWithOffer:self->_offer clientInfo:v4];
    v6 = self->_purchase;
    self->_purchase = v5;

    purchase = self->_purchase;
  }
  [(ICQPurchase *)purchase setIsLegacyNativeFlow:1];
  [(ICQPurchase *)self->_purchase setDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  v8 = [WeakRetained view];
  id v9 = [v8 window];
  id v10 = [v9 windowScene];
  id v11 = [v10 _sceneIdentifier];
  [(ICQPurchase *)self->_purchase setPresentingSceneIdentifier:v11];

  [(ICQPurchase *)self->_purchase setPresentingSceneBundleIdentifier:*MEMORY[0x263F889A0]];
  v12 = self->_purchase;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__ICQUIOSLOPresenter_beginOSLOPurchaseFlow__block_invoke;
  v13[3] = &unk_264921C58;
  v13[4] = self;
  [(ICQPurchase *)v12 startPurchaseWithCompletion:v13];
}

void __43__ICQUIOSLOPresenter_beginOSLOPurchaseFlow__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(*(void *)(a1 + 32) + 16) action] == 127)
  {
    v6 = _ICQGetLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __43__ICQUIOSLOPresenter_beginOSLOPurchaseFlow__block_invoke_cold_1(a2, (uint64_t)v5, v6);
    }

    v7 = *(void **)(a1 + 32);
    if (a2)
    {
      [v7 _handlePostPurchaseFlow];
    }
    else
    {
      v8 = [v7 delegate];
      [v8 purchaseFlowCompletedWith:0 error:v5];
    }
  }
}

- (void)_handlePostPurchaseFlow
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[ICQUIOSLOPresenter _handlePostPurchaseFlow]";
  _os_log_error_impl(&dword_22C821000, log, OS_LOG_TYPE_ERROR, "%s Post purchase action not avaialble. Bailing", (uint8_t *)&v1, 0xCu);
}

- (void)handleAuthenticateRequest:(id)a3 purchase:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "We were asked to authenticate.  Attempting silent authentication.", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__ICQUIOSLOPresenter_handleAuthenticateRequest_purchase_completion___block_invoke;
  block[3] = &unk_2649224C0;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __68__ICQUIOSLOPresenter_handleAuthenticateRequest_purchase_completion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 48));
  id v3 = objc_alloc(MEMORY[0x263F27FC0]);
  v4 = [*(id *)(a1 + 40) account];
  id v5 = [*(id *)(a1 + 40) options];
  v6 = (void *)[v3 initWithAccount:v4 presentingViewController:WeakRetained options:v5];

  id v7 = [v6 performAuthentication];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__ICQUIOSLOPresenter_handleAuthenticateRequest_purchase_completion___block_invoke_2;
  v8[3] = &unk_264922498;
  id v9 = *(id *)(a1 + 48);
  [v7 addFinishBlock:v8];
}

void __68__ICQUIOSLOPresenter_handleAuthenticateRequest_purchase_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = _ICQGetLogSystem();
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

- (void)handleDialogRequest:(id)a3 purchase:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "We were asked to handle a dialog request", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__ICQUIOSLOPresenter_handleDialogRequest_purchase_completion___block_invoke;
  block[3] = &unk_2649224C0;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __62__ICQUIOSLOPresenter_handleDialogRequest_purchase_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  v2 = (void *)[objc_alloc(MEMORY[0x263F27FB8]) initWithRequest:a1[5] presentingViewController:WeakRetained];
  id v3 = [v2 present];
  [v3 addFinishBlock:a1[6]];
}

- (void)handleEngagementRequest:(id)a3 purchase:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = _ICQGetLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22C821000, v9, OS_LOG_TYPE_DEFAULT, "We were asked to handle an engagement request", buf, 2u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__ICQUIOSLOPresenter_handleEngagementRequest_purchase_completion___block_invoke;
  block[3] = &unk_2649224C0;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __66__ICQUIOSLOPresenter_handleEngagementRequest_purchase_completion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 48));
  id v2 = objc_alloc(MEMORY[0x263F27FE8]);
  uint64_t v3 = a1[5];
  v4 = [MEMORY[0x263F27B28] quotaBag];
  id v5 = (void *)[v2 initWithRequest:v3 bag:v4 presentingViewController:WeakRetained];

  id v6 = [v5 presentEngagement];
  [v6 addFinishBlock:a1[6]];
}

- (BOOL)isLiftUIFlow
{
  return 1;
}

+ (id)parsePurchaseParams:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x263EFF9A0];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = _ICQStringForAction();
  [v5 setObject:v6 forKeyedSubscript:*MEMORY[0x263F889C8]];

  id v7 = [v4 parameters];
  uint64_t v8 = *MEMORY[0x263F889B0];
  id v9 = [v7 objectForKeyedSubscript:*MEMORY[0x263F889B0]];
  [v5 setObject:v9 forKeyedSubscript:v8];

  id v10 = [v4 parameters];
  id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F889C0]];
  [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x263F88998]];

  v12 = [v4 parameters];
  uint64_t v13 = *MEMORY[0x263F889B8];
  id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x263F889B8]];
  [v5 setObject:v14 forKeyedSubscript:v13];

  objc_super v15 = [v4 parameters];
  uint64_t v16 = *MEMORY[0x263F889E0];
  v17 = [v15 objectForKeyedSubscript:*MEMORY[0x263F889E0]];
  [v5 setObject:v17 forKeyedSubscript:v16];

  v18 = [v4 parameters];
  uint64_t v19 = *MEMORY[0x263F889D0];
  v20 = [v18 objectForKeyedSubscript:*MEMORY[0x263F889D0]];
  [v5 setObject:v20 forKeyedSubscript:v19];

  v21 = [v4 parameters];
  uint64_t v22 = *MEMORY[0x263F889D8];
  v23 = [v21 objectForKeyedSubscript:*MEMORY[0x263F889D8]];
  [v5 setObject:v23 forKeyedSubscript:v22];

  v24 = [v4 parameters];

  uint64_t v25 = *MEMORY[0x263F889A8];
  v26 = [v24 objectForKeyedSubscript:*MEMORY[0x263F889A8]];
  [v5 setObject:v26 forKeyedSubscript:v25];

  v27 = (void *)[v5 copy];
  return v27;
}

- (void)_handlePostPurchaseLiftUIFlow
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self->_liftUIPresenter)
  {
    id v2 = _ICQGetLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v20 = "-[ICQUIOSLOPresenter _handlePostPurchaseLiftUIFlow]";
      _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "LiftUI presenter has already been dismissed, %s will be ignored", buf, 0xCu);
    }
  }
  else
  {
    id v4 = [MEMORY[0x263EFB210] defaultStore];
    id v2 = objc_msgSend(v4, "aa_primaryAppleAccount");

    id v5 = +[ICQUIOSLOPresenter parsePurchaseParams:self->_link];
    id v6 = objc_alloc(NSURL);
    id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x263F889D0]];
    uint64_t v8 = (void *)[v6 initWithString:v7];

    id v9 = [ICQLiftUIPresenter alloc];
    id v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[ICQPurchase statusCode](self->_purchase, "statusCode", @"purchaseStatus"));
    v17[1] = @"amsErrorCodes";
    v18[0] = v10;
    id v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[ICQPurchase amsServerErrorCode](self->_purchase, "amsServerErrorCode"));
    v18[1] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    uint64_t v13 = [(ICQLiftUIPresenter *)v9 initWithURL:v8 account:v2 data:v12];
    liftUIPresenter = self->_liftUIPresenter;
    self->_liftUIPresenter = v13;

    [(ICQLiftUIPresenter *)self->_liftUIPresenter setDelegate:self];
    objc_super v15 = self->_liftUIPresenter;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    [(ICQLiftUIPresenter *)v15 presentInViewController:WeakRetained animated:1];
  }
}

- (void)_handlePostPurchaseRemoteUIFlow
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (self->_remoteUIPresenter)
  {
    id v2 = _ICQGetLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[ICQUIOSLOPresenter _handlePostPurchaseRemoteUIFlow]";
      _os_log_impl(&dword_22C821000, v2, OS_LOG_TYPE_DEFAULT, "RemoteUI presenter has already been dismissed, %s will be ignored", buf, 0xCu);
    }
  }
  else
  {
    id v4 = [MEMORY[0x263EFB210] defaultStore];
    id v2 = objc_msgSend(v4, "aa_primaryAppleAccount");

    id v5 = [ICQUIRemoteUIPresenter alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
    id v7 = [(ICQUIRemoteUIPresenter *)v5 initWithAccount:v2 presenter:WeakRetained];
    remoteUIPresenter = self->_remoteUIPresenter;
    self->_remoteUIPresenter = v7;

    [(ICQUIRemoteUIPresenter *)self->_remoteUIPresenter setDelegate:self];
    id v9 = +[ICQUIOSLOPresenter parsePurchaseParams:self->_link];
    id v10 = objc_alloc(NSURL);
    id v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F889D0]];
    v12 = (void *)[v10 initWithString:v11];

    uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F089E0]) initWithURL:v12];
    [v13 setHTTPMethod:@"POST"];
    [v13 setValue:@"application/x-plist" forHTTPHeaderField:@"Accept"];
    [v13 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
    v23[0] = @"purchaseStatus";
    id v14 = objc_msgSend(NSNumber, "numberWithInteger:", -[ICQPurchase statusCode](self->_purchase, "statusCode"));
    v23[1] = @"amsErrorCodes";
    v24[0] = v14;
    objc_super v15 = objc_msgSend(NSNumber, "numberWithInteger:", -[ICQPurchase amsServerErrorCode](self->_purchase, "amsServerErrorCode"));
    v24[1] = v15;
    uint64_t v16 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];

    id v22 = 0;
    v17 = [MEMORY[0x263F08AC0] dataWithPropertyList:v16 format:100 options:0 error:&v22];
    v18 = (char *)v22;
    if (v18)
    {
      uint64_t v19 = _ICQGetLogSystem();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v18;
        _os_log_impl(&dword_22C821000, v19, OS_LOG_TYPE_DEFAULT, "Could not convert message body to XML for post purchase flow. Error: %@", buf, 0xCu);
      }
    }
    else
    {
      [v13 setHTTPBody:v17];
    }
    v20 = self->_remoteUIPresenter;
    uint64_t v21 = (void *)[v13 copy];
    [(ICQUIRemoteUIPresenter *)v20 beginRUIFlowWithRequest:v21];
  }
}

- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  uint64_t v8 = _ICQGetLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ICQUIOSLOPresenter remoteUIFlowManager:didCompleteFlowWithSuccess:error:](v5, v7);
  }

  id v9 = [(ICQUIOSLOPresenter *)self delegate];
  [v9 purchaseFlowCompletedWith:v5 error:v7];
}

- (void)remoteUIFlowManager:(id)a3 didDismissWithError:(id)a4
{
  id v5 = a4;
  id v6 = _ICQGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ICQUIOSLOPresenter remoteUIFlowManager:didDismissWithError:](v5, v6);
  }

  id v7 = [(ICQUIOSLOPresenter *)self delegate];
  [v7 purchaseFlowCompletedWith:0 error:v5];
}

- (void)remoteUIFlowManager:(id)a3 didLoadWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v5 = a4;
  id v6 = a5;
  id v7 = _ICQGetLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ICQUIOSLOPresenter remoteUIFlowManager:didLoadWithSuccess:error:](v5, v6);
  }
}

- (void)liftUIPresenterDidComplete:(id)a3
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ICQUIOSLOPresenter liftUIPresenterDidComplete:](v4);
  }

  BOOL v5 = [(ICQUIOSLOPresenter *)self delegate];
  [v5 purchaseFlowCompletedWith:1 error:0];
}

- (void)liftUIPresenterDidCancel:(id)a3
{
  id v4 = _ICQGetLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[ICQUIOSLOPresenter liftUIPresenterDidComplete:](v4);
  }

  BOOL v5 = [(ICQUIOSLOPresenter *)self delegate];
  [v5 purchaseFlowCompletedWith:0 error:0];
}

- (ICQUIOSLOPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICQUIOSLOPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_liftUIPresenter, 0);
  objc_storeStrong((id *)&self->_remoteUIPresenter, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_purchase, 0);
  objc_storeStrong((id *)&self->_purchaseParams, 0);
  objc_storeStrong((id *)&self->_postPurchaseFlowLink, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_offer, 0);
}

void __43__ICQUIOSLOPresenter_beginOSLOPurchaseFlow__block_invoke_cold_1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl(&dword_22C821000, log, OS_LOG_TYPE_DEBUG, "OSLO Flow completed with success: %d and error: %@", (uint8_t *)v3, 0x12u);
}

void __68__ICQUIOSLOPresenter_handleAuthenticateRequest_purchase_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22C821000, a2, OS_LOG_TYPE_ERROR, "Error attempting silent auth: %@", (uint8_t *)&v2, 0xCu);
}

- (void)remoteUIFlowManager:(uint64_t)a1 didCompleteFlowWithSuccess:(void *)a2 error:.cold.1(uint64_t a1, void *a2)
{
  int v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_22C821000, v3, v4, "OSLO Post Purchase did complete flow with success: %d error: %@", v5, v6, v7, v8, v9);
}

- (void)remoteUIFlowManager:(void *)a1 didDismissWithError:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_22C821000, a2, OS_LOG_TYPE_DEBUG, "OSLO Post Purchase did dismiss flow with error: %@", (uint8_t *)&v4, 0xCu);
}

- (void)remoteUIFlowManager:(uint64_t)a1 didLoadWithSuccess:(void *)a2 error:.cold.1(uint64_t a1, void *a2)
{
  int v2 = [a2 localizedDescription];
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_22C821000, v3, v4, "OSLO Post Purchase did load flow with success: %d, error: %@", v5, v6, v7, v8, v9);
}

- (void)liftUIPresenterDidComplete:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_22C821000, log, OS_LOG_TYPE_DEBUG, "OSLO Post Purchase liftUIPresenterDidComplete", v1, 2u);
}

@end