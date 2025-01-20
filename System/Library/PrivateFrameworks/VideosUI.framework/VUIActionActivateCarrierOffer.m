@interface VUIActionActivateCarrierOffer
- (BOOL)isAccountRequired;
- (NSDictionary)additionalParams;
- (NSString)canonicalID;
- (NSString)linkParams;
- (NSString)notificationBody;
- (NSString)notificationTitle;
- (NSString)productCode;
- (VUIActionActivateCarrierOffer)initWithContextData:(id)a3;
- (id)_configurePreflightManager;
- (void)_activateOfferWithCompletionHandler:(id)a3;
- (void)_handleActivationSuccessWithCompletionHandler:(id)a3;
- (void)_notifyDidEndActivationWithError:(id)a3;
- (void)_notifyDidStartActivation;
- (void)_showUIConfirmationForSubTransactionWithCompletion:(id)a3;
- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4;
- (void)handleDialogRequest:(id)a3 completion:(id)a4;
- (void)handleEngagementRequest:(id)a3 completion:(id)a4;
- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4;
- (void)setAdditionalParams:(id)a3;
- (void)setCanonicalID:(id)a3;
- (void)setLinkParams:(id)a3;
- (void)setNotificationBody:(id)a3;
- (void)setNotificationTitle:(id)a3;
- (void)setProductCode:(id)a3;
@end

@implementation VUIActionActivateCarrierOffer

- (VUIActionActivateCarrierOffer)initWithContextData:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VUIActionActivateCarrierOffer;
  v5 = [(VUIActionActivateCarrierOffer *)&v19 init];
  if (v5)
  {
    v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - create", v18, 2u);
    }

    uint64_t v7 = objc_msgSend(v4, "vui_stringForKey:", @"linkParams");
    linkParams = v5->_linkParams;
    v5->_linkParams = (NSString *)v7;

    uint64_t v9 = objc_msgSend(v4, "vui_stringForKey:", @"productCode");
    productCode = v5->_productCode;
    v5->_productCode = (NSString *)v9;

    uint64_t v11 = objc_msgSend(v4, "vui_dictionaryForKey:", @"additionalParams");
    additionalParams = v5->_additionalParams;
    v5->_additionalParams = (NSDictionary *)v11;

    uint64_t v13 = objc_msgSend(v4, "vui_stringForKey:", @"notificationTitle");
    notificationTitle = v5->_notificationTitle;
    v5->_notificationTitle = (NSString *)v13;

    uint64_t v15 = objc_msgSend(v4, "vui_stringForKey:", @"notificationBody");
    notificationBody = v5->_notificationBody;
    v5->_notificationBody = (NSString *)v15;
  }
  return v5;
}

- (BOOL)isAccountRequired
{
  return 1;
}

- (void)_activateOfferWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - activating offer...", buf, 2u);
  }

  v6 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  uint64_t v7 = objc_msgSend(v6, "ams_activeiTunesAccount");

  v8 = [MEMORY[0x1E4F4DC30] createBagForSubProfile];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F4DC30]) initWithAccount:v7 bag:v8 linkParams:self->_linkParams productCode:self->_productCode];
  [v9 setAdditionalLinkingParameters:self->_additionalParams];
  [v9 setDelegate:self];
  v10 = [v9 perform];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__VUIActionActivateCarrierOffer__activateOfferWithCompletionHandler___block_invoke;
  v12[3] = &unk_1E6DF6890;
  id v13 = v4;
  id v11 = v4;
  [v10 addFinishBlock:v12];
}

void __69__VUIActionActivateCarrierOffer__activateOfferWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = VUIDefaultLogObject();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69__VUIActionActivateCarrierOffer__activateOfferWithCompletionHandler___block_invoke_cold_1((uint64_t)v6, v8);
    }

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - Registered for hard bundle offers, result: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v9();
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - performing action...", buf, 2u);
  }

  uint64_t v7 = [(VUIActionActivateCarrierOffer *)self _configurePreflightManager];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke;
  v9[3] = &unk_1E6DF6908;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  [v7 preflightWithOptions:1 completion:v9];
}

void __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1, char a2)
{
  [*(id *)(a1 + 32) _notifyDidStartActivation];
  if (a2)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_22;
    v8[3] = &unk_1E6DF68E0;
    id v4 = *(void **)(a1 + 32);
    id v5 = *(id *)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    id v9 = v5;
    [v4 _activateOfferWithCompletionHandler:v8];
    id v6 = v9;
  }
  else
  {
    uint64_t v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - Activation are restricted", buf, 2u);
    }

    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"TRANSACTION_RESTRICTED_CONTENT" code:0 userInfo:0];
    [*(id *)(a1 + 32) _notifyDidEndActivationWithError:v6];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_22(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = VUIDefaultLogObject();
  uint64_t v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_22_cold_1((uint64_t)v5, v7);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    uint64_t v12 = __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_23;
    id v13 = &unk_1E6DF68B8;
    id v8 = *(id *)(a1 + 40);
    uint64_t v9 = *(void *)(a1 + 32);
    id v16 = v8;
    uint64_t v14 = v9;
    id v15 = v5;
    if ([MEMORY[0x1E4F29060] isMainThread]) {
      v12((uint64_t)block);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - Activation successful", v10, 2u);
    }

    [*(id *)(a1 + 32) _handleActivationSuccessWithCompletionHandler:*(void *)(a1 + 40)];
  }
}

void __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_23(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_2;
  v5[3] = &unk_1E6DF68B8;
  id v2 = *(id *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v7 = v2;
  v5[4] = v3;
  id v6 = v4;
  +[VUIApplicationRouter dismissOrPopViewControllerWithId:@"CommerceViewControllerIdentifier" completion:v5];
}

uint64_t __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_2(uint64_t result)
{
  if (*(void *)(result + 48))
  {
    uint64_t v1 = result;
    [*(id *)(result + 32) _notifyDidEndActivationWithError:*(void *)(result + 40)];
    id v2 = *(uint64_t (**)(void))(*(void *)(v1 + 48) + 16);
    return v2();
  }
  return result;
}

- (void)_handleActivationSuccessWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB5088] sharedInstance];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke;
  id v11 = &unk_1E6DF6930;
  uint64_t v12 = self;
  id v13 = v4;
  id v6 = v4;
  [v5 fetchConfigurationWithOptions:0 cachePolicy:3 queryParameters:0 completion:&v8];

  id v7 = objc_msgSend(MEMORY[0x1E4FB5170], "sharedInstance", v8, v9, v10, v11, v12);
  [v7 fetchSubscriptionData:1 completion:&__block_literal_global_49];
}

void __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_1E2BD7000, v5, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - UTS Subscription state refreshed. error: %@", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  uint64_t v8 = __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke_29;
  uint64_t v9 = &unk_1E6DF41E8;
  id v6 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = v6;
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v7[0], 3221225472)) {
    v8((uint64_t)v7);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke_29(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E6DF41E8;
  id v2 = *(id *)(a1 + 40);
  v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  +[VUIApplicationRouter dismissOrPopViewControllerWithId:@"CommerceViewControllerIdentifier" completion:v3];
}

void __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _notifyDidEndActivationWithError:0];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke_3;
    v3[3] = &unk_1E6DF3DD0;
    id v2 = *(void **)(a1 + 32);
    id v4 = *(id *)(a1 + 40);
    [v2 _showUIConfirmationForSubTransactionWithCompletion:v3];
  }
}

uint64_t __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__VUIActionActivateCarrierOffer__handleActivationSuccessWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VUIDefaultLogObject();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      id v7 = "ActivateCarrierOffer - successfully refreshed subscription store";
      uint64_t v8 = v5;
      uint32_t v9 = 2;
LABEL_6:
      _os_log_impl(&dword_1E2BD7000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, v9);
    }
  }
  else if (v6)
  {
    int v10 = 138412290;
    id v11 = v4;
    id v7 = "ActivateCarrierOffer - error refreshing subscriptions from finance: %@";
    uint64_t v8 = v5;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

- (void)handleEngagementRequest:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 logKey];
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - handle engagement request: %@", buf, 0xCu);
  }
  uint64_t v12 = MEMORY[0x1E4F143A8];
  id v13 = __68__VUIActionActivateCarrierOffer_handleEngagementRequest_completion___block_invoke;
  uint64_t v14 = &unk_1E6DF4AD0;
  id v15 = v5;
  id v16 = v6;
  uint32_t v9 = (void *)MEMORY[0x1E4F29060];
  id v10 = v6;
  id v11 = v5;
  if (objc_msgSend(v9, "isMainThread", v12, 3221225472)) {
    v13((uint64_t)&v12);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v12);
  }
}

void __68__VUIActionActivateCarrierOffer_handleEngagementRequest_completion___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(MEMORY[0x1E4F4DBD8], "vui_defaultBag");
  uint64_t v3 = +[VUIApplicationRouter topMostVisibleViewController];
  if (v3)
  {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F4DFB8]) initWithRequest:*(void *)(a1 + 32) bag:v2 presentingViewController:v3];
    id v5 = [v4 presentEngagement];
    [v5 addFinishBlock:*(void *)(a1 + 40)];
  }
  else
  {
    id v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __68__VUIActionActivateCarrierOffer_handleEngagementRequest_completion___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 logKey];
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - handle auth request: %@", buf, 0xCu);
  }
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = __70__VUIActionActivateCarrierOffer_handleAuthenticateRequest_completion___block_invoke;
  uint64_t v14 = &unk_1E6DF4AD0;
  id v15 = v5;
  id v16 = v6;
  uint64_t v9 = (void *)MEMORY[0x1E4F29060];
  id v10 = v6;
  id v11 = v5;
  if (objc_msgSend(v9, "isMainThread", v12, 3221225472)) {
    v13((uint64_t)&v12);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v12);
  }
}

void __70__VUIActionActivateCarrierOffer_handleAuthenticateRequest_completion___block_invoke(uint64_t a1)
{
  id v2 = +[VUIApplicationRouter topMostVisibleViewController];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F4DF30]) initWithRequest:*(void *)(a1 + 32) presentingViewController:v2];
    id v4 = [v3 performAuthentication];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __70__VUIActionActivateCarrierOffer_handleAuthenticateRequest_completion___block_invoke_2;
    v12[3] = &unk_1E6DF5998;
    id v13 = *(id *)(a1 + 40);
    [v4 addFinishBlock:v12];
  }
  else
  {
    uint64_t v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __70__VUIActionActivateCarrierOffer_handleAuthenticateRequest_completion___block_invoke_cold_1(v3, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void __70__VUIActionActivateCarrierOffer_handleAuthenticateRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 authenticationResults];
    int v10 = 138412546;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - finished auth request: %@, %@", (uint8_t *)&v10, 0x16u);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v5 logKey];
    *(_DWORD *)buf = 138412290;
    v18 = v8;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - handle dialog request: %@", buf, 0xCu);
  }
  uint64_t v12 = MEMORY[0x1E4F143A8];
  id v13 = __64__VUIActionActivateCarrierOffer_handleDialogRequest_completion___block_invoke;
  uint64_t v14 = &unk_1E6DF4AD0;
  id v15 = v5;
  id v16 = v6;
  uint64_t v9 = (void *)MEMORY[0x1E4F29060];
  id v10 = v6;
  id v11 = v5;
  if (objc_msgSend(v9, "isMainThread", v12, 3221225472)) {
    v13((uint64_t)&v12);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], &v12);
  }
}

void __64__VUIActionActivateCarrierOffer_handleDialogRequest_completion___block_invoke(uint64_t a1)
{
  id v2 = +[VUIApplicationRouter topMostVisibleViewController];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F4DF28]) initWithRequest:*(void *)(a1 + 32) presentingViewController:v2];
    id v4 = [v3 present];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__VUIActionActivateCarrierOffer_handleDialogRequest_completion___block_invoke_2;
    v12[3] = &unk_1E6DF6978;
    id v13 = *(id *)(a1 + 32);
    id v14 = *(id *)(a1 + 40);
    [v4 addFinishBlock:v12];
  }
  else
  {
    uint64_t v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __64__VUIActionActivateCarrierOffer_handleDialogRequest_completion___block_invoke_cold_1(v3, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void __64__VUIActionActivateCarrierOffer_handleDialogRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = [v5 selectedActionIdentifier];
  uint64_t v9 = [v7 locateActionWithIdentifier:v8];
  uint64_t v10 = [v9 style];

  uint64_t v11 = VUIDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 134218498;
    uint64_t v15 = v10;
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - finished dialog with actionStyle %ld for request: %@, %@", (uint8_t *)&v14, 0x20u);
  }

  if ((unint64_t)(v10 - 1) <= 1)
  {
    uint64_t v12 = VUIDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1E2BD7000, v12, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - User canceled dialog", (uint8_t *)&v14, 2u);
    }
  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v5, v6);
  }
}

- (id)_configurePreflightManager
{
  id v2 = +[VUIPreflightManager defaultPreflightManager];
  uint64_t v3 = +[VUIApplicationRouter topPresentedViewController];
  [v2 setPresentingController:v3];

  [v2 setRestrictionsCheckType:2];
  return v2;
}

- (void)_showUIConfirmationForSubTransactionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIActionActivateCarrierOffer *)self notificationTitle];
  id v6 = (void *)[v5 copy];

  uint64_t v7 = [(VUIActionActivateCarrierOffer *)self notificationBody];
  uint64_t v8 = (void *)[v7 copy];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  int v14 = __84__VUIActionActivateCarrierOffer__showUIConfirmationForSubTransactionWithCompletion___block_invoke;
  uint64_t v15 = &unk_1E6DF4510;
  id v16 = v6;
  id v17 = v8;
  id v18 = v4;
  uint64_t v9 = (void *)MEMORY[0x1E4F29060];
  id v10 = v4;
  id v11 = v8;
  id v12 = v6;
  if ([v9 isMainThread]) {
    v14(block);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __84__VUIActionActivateCarrierOffer__showUIConfirmationForSubTransactionWithCompletion___block_invoke(void *a1)
{
  return +[VUIActionCommerceTransaction displayConfirmationUIWithTitle:a1[4] andBody:a1[5] completion:a1[6]];
}

- (void)_notifyDidStartActivation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [(VUIActionActivateCarrierOffer *)self linkParams];
  uint64_t v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v2;
    _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - notify start, linkParams: %@", buf, 0xCu);
  }

  id v4 = +[VUIPurchaser sharedInstance];
  [v4 rememberPurchasing:v2];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v7 = @"TransactionID";
  uint64_t v8 = v2;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v5 postNotificationName:@"VUIPurchaseOrSubscribeRequestDidStartNotification" object:0 userInfo:v6];
}

- (void)_notifyDidEndActivationWithError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VUIActionActivateCarrierOffer *)self linkParams];
  id v6 = [(VUIActionActivateCarrierOffer *)self canonicalID];
  uint64_t v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = v5;
    __int16 v13 = 2112;
    int v14 = v6;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "ActivateCarrierOffer - notify end, linkParams: %@, canonicalID: %@, error:%@", (uint8_t *)&v11, 0x20u);
  }

  uint64_t v8 = +[VUIPurchaser sharedInstance];
  [v8 forgetPurchasing:v5];
  uint64_t v9 = objc_opt_new();
  [v9 setObject:v5 forKeyedSubscript:@"TransactionID"];
  if (v4) {
    [v9 setObject:v4 forKeyedSubscript:@"Error"];
  }
  id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v10 postNotificationName:@"VUISubscribeRequestDidFinishNotification" object:0 userInfo:v9];
}

- (NSString)linkParams
{
  return self->_linkParams;
}

- (void)setLinkParams:(id)a3
{
}

- (NSString)productCode
{
  return self->_productCode;
}

- (void)setProductCode:(id)a3
{
}

- (NSDictionary)additionalParams
{
  return self->_additionalParams;
}

- (void)setAdditionalParams:(id)a3
{
}

- (NSString)notificationTitle
{
  return self->_notificationTitle;
}

- (void)setNotificationTitle:(id)a3
{
}

- (NSString)notificationBody
{
  return self->_notificationBody;
}

- (void)setNotificationBody:(id)a3
{
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void)setCanonicalID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_notificationBody, 0);
  objc_storeStrong((id *)&self->_notificationTitle, 0);
  objc_storeStrong((id *)&self->_additionalParams, 0);
  objc_storeStrong((id *)&self->_productCode, 0);
  objc_storeStrong((id *)&self->_linkParams, 0);
}

void __69__VUIActionActivateCarrierOffer__activateOfferWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "ActivateCarrierOffer - Error running the hard bundle offer registration. %@", (uint8_t *)&v2, 0xCu);
}

void __78__VUIActionActivateCarrierOffer_performWithTargetResponder_completionHandler___block_invoke_22_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "ActivateCarrierOffer - Activation failed: %@", (uint8_t *)&v2, 0xCu);
}

void __68__VUIActionActivateCarrierOffer_handleEngagementRequest_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __70__VUIActionActivateCarrierOffer_handleAuthenticateRequest_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__VUIActionActivateCarrierOffer_handleDialogRequest_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end