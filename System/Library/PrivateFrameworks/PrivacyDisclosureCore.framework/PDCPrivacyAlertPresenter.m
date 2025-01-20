@interface PDCPrivacyAlertPresenter
+ (id)sharedPresenter;
- (PDCPrivacyAlertPresenter)init;
- (void)_activateAlertHandleForIdentity:(id)a3 settings:(id)a4 repsonseHandler:(id)a5;
- (void)_ensureAppIsLaunchableWithIdentity:(id)a3 completion:(id)a4;
- (void)activateRemoteAlertWithIdentity:(id)a3 requestHandle:(id)a4 forcePresent:(BOOL)a5 completionHandler:(id)a6;
- (void)didCancelRequestHandle:(id)a3;
- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleDidActivate:(id)a3;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
@end

@implementation PDCPrivacyAlertPresenter

+ (id)sharedPresenter
{
  if (sharedPresenter_onceToken != -1) {
    dispatch_once(&sharedPresenter_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedPresenter_presenter;

  return v2;
}

uint64_t __43__PDCPrivacyAlertPresenter_sharedPresenter__block_invoke()
{
  sharedPresenter_presenter = objc_alloc_init(PDCPrivacyAlertPresenter);

  return MEMORY[0x270F9A758]();
}

- (PDCPrivacyAlertPresenter)init
{
  v10.receiver = self;
  v10.super_class = (Class)PDCPrivacyAlertPresenter;
  v2 = [(PDCPrivacyAlertPresenter *)&v10 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.PrivacyDisclosure.PrivacyAlertPresenter", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x263F08968] weakToWeakObjectsMapTable];
    requestToAlertMap = v2->_requestToAlertMap;
    v2->_requestToAlertMap = (NSMapTable *)v6;

    v8 = v2;
  }

  return v2;
}

- (void)_ensureAppIsLaunchableWithIdentity:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v17 = 0;
  uint64_t v6 = [a3 findApplicationRecordWithError:&v17];
  id v7 = v17;
  if ([v6 applicationMissingRequiredSINF])
  {
    v8 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = v8;
      objc_super v10 = [v6 bundleIdentifier];
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_25A653000, v9, OS_LOG_TYPE_INFO, "Request application repair for %@", buf, 0xCu);
    }
    id v11 = objc_alloc(MEMORY[0x263F254F0]);
    v12 = [v6 bundleIdentifier];
    v13 = (void *)[v11 initWithBundleID:v12];

    [v13 setExitReason:16];
    v14 = [MEMORY[0x263F254F8] defaultService];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __74__PDCPrivacyAlertPresenter__ensureAppIsLaunchableWithIdentity_completion___block_invoke;
    v15[3] = &unk_265479D00;
    id v16 = v5;
    [v14 repairAppWithOptions:v13 replyHandler:v15];
  }
  else
  {
    (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
  }
}

void __74__PDCPrivacyAlertPresenter__ensureAppIsLaunchableWithIdentity_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  if (v5)
  {
    uint64_t v6 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __74__PDCPrivacyAlertPresenter__ensureAppIsLaunchableWithIdentity_completion___block_invoke_cold_1((uint64_t)v5, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)activateRemoteAlertWithIdentity:(id)a3 requestHandle:(id)a4 forcePresent:(BOOL)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke;
  v16[3] = &unk_265479D78;
  v16[4] = self;
  id v17 = v10;
  BOOL v20 = a5;
  id v18 = v11;
  id v19 = v12;
  id v13 = v11;
  id v14 = v10;
  id v15 = v12;
  [(PDCPrivacyAlertPresenter *)self _ensureAppIsLaunchableWithIdentity:v14 completion:v16];
}

void __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke(uint64_t a1, char a2)
{
  if (a2)
  {
    v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke_2;
    block[3] = &unk_265479D50;
    id v4 = *(id *)(a1 + 40);
    char v12 = *(unsigned char *)(a1 + 64);
    uint64_t v5 = *(void *)(a1 + 32);
    id v8 = v4;
    uint64_t v9 = v5;
    id v11 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 48);
    dispatch_async(v3, block);
  }
  else
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

void __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2050000000;
  v2 = (void *)getBSMutableSettingsClass_softClass;
  uint64_t v18 = getBSMutableSettingsClass_softClass;
  if (!getBSMutableSettingsClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    BOOL v20 = __getBSMutableSettingsClass_block_invoke;
    v21 = &unk_265479DF0;
    v22 = &v15;
    __getBSMutableSettingsClass_block_invoke((uint64_t)&buf);
    v2 = (void *)v16[3];
  }
  v3 = v2;
  _Block_object_dispose(&v15, 8);
  id v4 = objc_alloc_init(v3);
  uint64_t v5 = [*(id *)(a1 + 32) identityString];
  [v4 setObject:v5 forSetting:0];

  uint64_t v6 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
  [v4 setObject:v6 forSetting:1];

  id v7 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = v7;
    id v10 = [v8 identityString];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_25A653000, v9, OS_LOG_TYPE_DEFAULT, "Request privacy remote alert for bundle: [%@]", (uint8_t *)&buf, 0xCu);
  }
  id v11 = *(void **)(a1 + 40);
  uint64_t v12 = *(void *)(a1 + 32);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke_11;
  v13[3] = &unk_265479D28;
  id v14 = *(id *)(a1 + 56);
  [v11 _activateAlertHandleForIdentity:v12 settings:v4 repsonseHandler:v13];
  [*(id *)(*(void *)(a1 + 40) + 24) setObject:*(void *)(*(void *)(a1 + 40) + 8) forKey:*(void *)(a1 + 48)];
}

void __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke_11(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = [a2 info];
  id v4 = [v3 objectForSetting:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_25A653000, v6, OS_LOG_TYPE_DEFAULT, "Succeed to get user response from remote alert: [%@]", (uint8_t *)&v8, 0xCu);
    }
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v5 integerValue]);
  }
  else
  {
    id v7 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke_11_cold_1((uint64_t)v4, v7);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_activateAlertHandleForIdentity:(id)a3 settings:(id)a4 repsonseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2050000000;
  id v11 = (void *)getSBSRemoteAlertDefinitionClass_softClass;
  uint64_t v42 = getSBSRemoteAlertDefinitionClass_softClass;
  if (!getSBSRemoteAlertDefinitionClass_softClass)
  {
    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 3221225472;
    v36 = __getSBSRemoteAlertDefinitionClass_block_invoke;
    v37 = &unk_265479DF0;
    v38 = &v39;
    __getSBSRemoteAlertDefinitionClass_block_invoke((uint64_t)&v34);
    id v11 = (void *)v40[3];
  }
  uint64_t v12 = v11;
  _Block_object_dispose(&v39, 8);
  id v13 = (void *)[[v12 alloc] initWithServiceName:@"com.apple.PDUIApp" viewControllerClassName:@"PDURemoteViewController"];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2050000000;
  id v14 = (void *)getSBSRemoteAlertConfigurationContextClass_softClass;
  uint64_t v42 = getSBSRemoteAlertConfigurationContextClass_softClass;
  if (!getSBSRemoteAlertConfigurationContextClass_softClass)
  {
    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 3221225472;
    v36 = __getSBSRemoteAlertConfigurationContextClass_block_invoke;
    v37 = &unk_265479DF0;
    v38 = &v39;
    __getSBSRemoteAlertConfigurationContextClass_block_invoke((uint64_t)&v34);
    id v14 = (void *)v40[3];
  }
  uint64_t v15 = v14;
  _Block_object_dispose(&v39, 8);
  id v16 = objc_alloc_init(v15);
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2050000000;
  uint64_t v17 = (void *)getBSActionClass_softClass;
  uint64_t v42 = getBSActionClass_softClass;
  if (!getBSActionClass_softClass)
  {
    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 3221225472;
    v36 = __getBSActionClass_block_invoke;
    v37 = &unk_265479DF0;
    v38 = &v39;
    __getBSActionClass_block_invoke((uint64_t)&v34);
    uint64_t v17 = (void *)v40[3];
  }
  uint64_t v18 = v17;
  _Block_object_dispose(&v39, 8);
  id v19 = [v18 alloc];
  BOOL v20 = [MEMORY[0x263F29BB8] responderWithHandler:v10];
  v21 = (void *)[v19 initWithInfo:v9 responder:v20];

  v22 = [MEMORY[0x263EFFA08] setWithObject:v21];
  [v16 setActions:v22];

  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2050000000;
  uint64_t v23 = (void *)getSBSRemoteAlertHandleClass_softClass;
  uint64_t v42 = getSBSRemoteAlertHandleClass_softClass;
  if (!getSBSRemoteAlertHandleClass_softClass)
  {
    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 3221225472;
    v36 = __getSBSRemoteAlertHandleClass_block_invoke;
    v37 = &unk_265479DF0;
    v38 = &v39;
    __getSBSRemoteAlertHandleClass_block_invoke((uint64_t)&v34);
    uint64_t v23 = (void *)v40[3];
  }
  id v24 = v23;
  _Block_object_dispose(&v39, 8);
  v25 = (SBSRemoteAlertHandle *)[v24 newHandleWithDefinition:v13 configurationContext:v16];
  alertHandle = self->_alertHandle;
  self->_alertHandle = v25;

  [(SBSRemoteAlertHandle *)self->_alertHandle registerObserver:self];
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2050000000;
  v27 = (void *)getSBSRemoteAlertActivationContextClass_softClass;
  uint64_t v42 = getSBSRemoteAlertActivationContextClass_softClass;
  if (!getSBSRemoteAlertActivationContextClass_softClass)
  {
    uint64_t v34 = MEMORY[0x263EF8330];
    uint64_t v35 = 3221225472;
    v36 = __getSBSRemoteAlertActivationContextClass_block_invoke;
    v37 = &unk_265479DF0;
    v38 = &v39;
    __getSBSRemoteAlertActivationContextClass_block_invoke((uint64_t)&v34);
    v27 = (void *)v40[3];
  }
  v28 = v27;
  _Block_object_dispose(&v39, 8);
  id v29 = objc_alloc_init(v28);
  getSBSRemoteAlertPresentationTargetClass();
  if ([(id)objc_opt_class() instancesRespondToSelector:sel_initWithTargetPredicate_])
  {
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2050000000;
    v30 = (void *)getSBSRemoteAlertPresentationTargetPredicateClass_softClass;
    uint64_t v42 = getSBSRemoteAlertPresentationTargetPredicateClass_softClass;
    if (!getSBSRemoteAlertPresentationTargetPredicateClass_softClass)
    {
      uint64_t v34 = MEMORY[0x263EF8330];
      uint64_t v35 = 3221225472;
      v36 = __getSBSRemoteAlertPresentationTargetPredicateClass_block_invoke;
      v37 = &unk_265479DF0;
      v38 = &v39;
      __getSBSRemoteAlertPresentationTargetPredicateClass_block_invoke((uint64_t)&v34);
      v30 = (void *)v40[3];
    }
    id v31 = v30;
    _Block_object_dispose(&v39, 8);
    v32 = [v31 predicateForLaunchingApplicationIdentity:v8];
    v33 = (void *)[objc_alloc((Class)getSBSRemoteAlertPresentationTargetClass()) initWithTargetPredicate:v32];
    [v33 setShouldDismissInSwitcher:0];
    [v29 setPresentationTarget:v33];
  }
  [(SBSRemoteAlertHandle *)self->_alertHandle activateWithContext:v29];
}

- (void)didCancelRequestHandle:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__PDCPrivacyAlertPresenter_didCancelRequestHandle___block_invoke;
  v7[3] = &unk_265479DA0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __51__PDCPrivacyAlertPresenter_didCancelRequestHandle___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 40)];
  [v1 invalidate];
}

- (void)remoteAlertHandleDidActivate:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134217984;
    id v6 = v3;
    _os_log_impl(&dword_25A653000, v4, OS_LOG_TYPE_INFO, "Did active remote alert, handle : [%p]", (uint8_t *)&v5, 0xCu);
  }
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    id v12 = v4;
    _os_log_impl(&dword_25A653000, v5, OS_LOG_TYPE_INFO, "Did deactive remote alert, handle : [%p]", buf, 0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __59__PDCPrivacyAlertPresenter_remoteAlertHandleDidDeactivate___block_invoke;
  v8[3] = &unk_265479DA0;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(queue, v8);
}

uint64_t __59__PDCPrivacyAlertPresenter_remoteAlertHandleDidDeactivate___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 8))
  {
    *(void *)(v1 + 8) = 0;
    return MEMORY[0x270F9A758]();
  }
  return result;
}

- (void)remoteAlertHandle:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__PDCPrivacyAlertPresenter_remoteAlertHandle_didInvalidateWithError___block_invoke;
  block[3] = &unk_265479DC8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __69__PDCPrivacyAlertPresenter_remoteAlertHandle_didInvalidateWithError___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 8))
  {
    v2 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __69__PDCPrivacyAlertPresenter_remoteAlertHandle_didInvalidateWithError___block_invoke_cold_1(a1, v2);
    }
    uint64_t v4 = *(void *)(a1 + 32);
    id v3 = *(void **)(a1 + 40);
    if (v3 == *(void **)(v4 + 8))
    {
      *(void *)(v4 + 8) = 0;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestToAlertMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_alertHandle, 0);
}

void __74__PDCPrivacyAlertPresenter__ensureAppIsLaunchableWithIdentity_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25A653000, a2, OS_LOG_TYPE_ERROR, "Application repair failed with error: %@", (uint8_t *)&v2, 0xCu);
}

void __105__PDCPrivacyAlertPresenter_activateRemoteAlertWithIdentity_requestHandle_forcePresent_completionHandler___block_invoke_11_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_25A653000, a2, OS_LOG_TYPE_ERROR, "Error to receive user response from remote alert: [%@]", (uint8_t *)&v2, 0xCu);
}

void __69__PDCPrivacyAlertPresenter_remoteAlertHandle_didInvalidateWithError___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 134218242;
  uint64_t v5 = v2;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_25A653000, a2, OS_LOG_TYPE_ERROR, "Invalidate remote alert, handle : [%p], error: %@", (uint8_t *)&v4, 0x16u);
}

@end