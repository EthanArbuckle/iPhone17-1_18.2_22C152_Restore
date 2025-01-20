@interface UNSNotificationAuthorizationService
- (BOOL)_queue_isCarPlayAvailableForApplication:(id)a3;
- (UNSNotificationAuthorizationService)initWithDataProviderFactory:(id)a3 settingsService:(id)a4 localizationService:(id)a5;
- (void)_didForegroundApplicationWithBundleIdentifier:(id)a3;
- (void)_queue_requestAuthorizationWithOptions:(unint64_t)a3 forNotificationSourceDescription:(id)a4 withExpirationDate:(id)a5 completionHandler:(id)a6;
- (void)_queue_requestCriticalAlertAuthorizationForNotificationSourceDescription:(id)a3 completionHandler:(id)a4;
- (void)_queue_requestRemoveAuthorizationForNotificationSourceDescription:(id)a3 completionHandler:(id)a4;
- (void)didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4;
- (void)requestAuthorizationWithOptions:(unint64_t)a3 expirationDate:(id)a4 forNotificationSourceDescription:(id)a5 completionHandler:(id)a6;
- (void)requestAuthorizationWithOptions:(unint64_t)a3 forNotificationSourceDescription:(id)a4 completionHandler:(id)a5;
- (void)requestCriticalAlertAuthorizationForNotificationSourceDescription:(id)a3 completionHandler:(id)a4;
- (void)requestRemoveAuthorizationForNotificationSourceDescription:(id)a3 completionHandler:(id)a4;
@end

@implementation UNSNotificationAuthorizationService

- (void)didChangeProcessState:(id)a3 forBundleIdentifier:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v6)
  {
    if ([v9 isRunning])
    {
      v7 = [v9 endowmentNamespaces];
      int v8 = [v7 containsObject:@"com.apple.frontboard.visibility"];

      if (v8) {
        [(UNSNotificationAuthorizationService *)self _didForegroundApplicationWithBundleIdentifier:v6];
      }
    }
  }
}

- (void)_didForegroundApplicationWithBundleIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263F84278] sourceDescriptionWithBundleIdentifier:v4];
  int v6 = [(__CFString *)v5 isAppClip];
  int v7 = [(__CFString *)v5 wantsEphemeralNotifications];
  int v8 = *MEMORY[0x263F1E070];
  BOOL v9 = os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT);
  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (v9)
    {
      v11 = @"NO";
      if (v6) {
        v12 = @"YES";
      }
      else {
        v12 = @"NO";
      }
      *(_DWORD *)buf = 138543874;
      id v17 = v4;
      __int16 v18 = 2114;
      v19 = v12;
      if (v7) {
        v11 = @"YES";
      }
      __int16 v20 = 2114;
      v21 = v11;
      _os_log_impl(&dword_22289A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Foreground app will not request ephemeral notifications isAppClip: %{public}@ wantsEphemeral notifications: %{public}@", buf, 0x20u);
    }
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v4;
      __int16 v18 = 2114;
      v19 = v5;
      _os_log_impl(&dword_22289A000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] App clip wants ephemeral notifications for foregrounded application with source description: %{public}@", buf, 0x16u);
    }
    v13 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:28800.0];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __85__UNSNotificationAuthorizationService__didForegroundApplicationWithBundleIdentifier___block_invoke;
    v14[3] = &unk_26462F230;
    id v15 = v4;
    [(UNSNotificationAuthorizationService *)self requestAuthorizationWithOptions:7 expirationDate:v13 forNotificationSourceDescription:v5 completionHandler:v14];
  }
}

void __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  unint64_t v3 = v2 & 0xFFFFFFFFFFFFFFEFLL;
  v5 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke_2;
  v7[3] = &unk_26462F1B8;
  uint64_t v10 = v2;
  v7[4] = v5;
  id v8 = v4;
  id v9 = *(id *)(a1 + 56);
  objc_msgSend(v5, "_queue_requestAuthorizationWithOptions:forNotificationSourceDescription:withExpirationDate:completionHandler:", v3, v8, v6, v7);
}

- (void)_queue_requestAuthorizationWithOptions:(unint64_t)a3 forNotificationSourceDescription:(id)a4 withExpirationDate:(id)a5 completionHandler:(id)a6
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 bundleIdentifier];
  v14 = (os_log_t *)MEMORY[0x263F1E070];
  id v15 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v61 = v13;
    __int16 v62 = 2048;
    unint64_t v63 = a3;
    _os_log_impl(&dword_22289A000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting authorization with options %ld", buf, 0x16u);
  }
  v16 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v13];
  if ((a3 & 8) != 0
    && ![(UNSNotificationAuthorizationService *)self _queue_isCarPlayAvailableForApplication:v16])
  {
    id v17 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v61 = v13;
      _os_log_impl(&dword_22289A000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] CarPlay authorization is not permitted", buf, 0xCu);
    }
    a3 &= ~8uLL;
  }
  __int16 v18 = [(UNSDefaultDataProviderFactory *)self->_dataProviderFactory notificationSettingsForBundleIdentifier:v13];
  v19 = v18;
  if ((a3 & 0x6F) != 0)
  {
    if (v11)
    {
      __int16 v20 = *v14;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v61 = v13;
        _os_log_impl(&dword_22289A000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] Suppress user authorization prompt for temporary authorization", buf, 0xCu);
      }
      v21 = (void *)MEMORY[0x263F320D0];
      v52[0] = MEMORY[0x263EF8330];
      v52[1] = 3221225472;
      v52[2] = __148__UNSNotificationAuthorizationService__queue_requestAuthorizationWithOptions_forNotificationSourceDescription_withExpirationDate_completionHandler___block_invoke;
      v52[3] = &unk_26462F258;
      id v53 = v13;
      id v54 = v19;
      v55 = self;
      unint64_t v59 = a3;
      id v56 = v11;
      id v57 = v10;
      id v58 = v12;
      [v21 getUserNotificationConsentForBundleID:v53 completion:v52];

      goto LABEL_40;
    }
    if ([v18 authorizationStatus] == 2 || objc_msgSend(v19, "authorizationStatus") == 1)
    {
      v23 = *v14;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v61 = v13;
        __int16 v62 = 2048;
        unint64_t v63 = a3;
        _os_log_impl(&dword_22289A000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Already registered. Update authorization with options %ld", buf, 0x16u);
      }
      -[UNSDefaultDataProviderFactory updateAuthorizationWithOptions:scheduledDeliveryEnabled:forNotificationSourceDescription:completionHandler:](self->_dataProviderFactory, "updateAuthorizationWithOptions:scheduledDeliveryEnabled:forNotificationSourceDescription:completionHandler:", a3, [v19 scheduledDeliverySetting] == 2, v10, v12);
      goto LABEL_40;
    }
    if ((a3 & 0x10000) != 0)
    {
      v26 = *v14;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v61 = v13;
        _os_log_impl(&dword_22289A000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Suppress user authorization prompt for disabled request", buf, 0xCu);
      }
      dataProviderFactory = self->_dataProviderFactory;
      BOOL v28 = [v19 scheduledDeliverySetting] == 2;
      v29 = dataProviderFactory;
      uint64_t v30 = 1;
      goto LABEL_39;
    }
    if ([v10 suppressUserAuthorizationPrompt])
    {
      v24 = *v14;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v61 = v13;
        v25 = "[%{public}@] Suppress user authorization prompt for system service";
LABEL_37:
        _os_log_impl(&dword_22289A000, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
        goto LABEL_38;
      }
      goto LABEL_38;
    }
    v43 = [MEMORY[0x263F53C50] sharedConnection];
    char v40 = [v43 isNotificationsModificationAllowedForBundleID:v13];

    if ((v40 & 1) == 0)
    {
      v24 = *v14;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v61 = v13;
        v25 = "[%{public}@] Suppress user authorization prompt for restricted application";
        goto LABEL_37;
      }
LABEL_38:
      v32 = self->_dataProviderFactory;
      BOOL v28 = [v19 scheduledDeliverySetting] == 2;
      v29 = v32;
      uint64_t v30 = 2;
LABEL_39:
      [(UNSDefaultDataProviderFactory *)v29 requestAuthorizationStatus:v30 withOptions:a3 scheduledDeliveryEnabled:v28 forNotificationSourceDescription:v10 completionHandler:v12];
      goto LABEL_40;
    }
    if ((a3 & 0x40) != 0)
    {
      v33 = *v14;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v61 = v13;
        _os_log_impl(&dword_22289A000, v33, OS_LOG_TYPE_DEFAULT, "[%{public}@] Suppress user authorization prompt for provisional request", buf, 0xCu);
      }
      v34 = self->_dataProviderFactory;
      BOOL v28 = [v19 scheduledDeliverySetting] == 2;
      v29 = v34;
      uint64_t v30 = 3;
      goto LABEL_39;
    }
    if (_os_feature_enabled_impl())
    {
      v44 = [(UNSNotificationSettingsService *)self->_settingsService notificationSystemSettings];
      uint64_t v41 = [v44 scheduledDeliverySetting];

      uint64_t v31 = 32;
      if (v41 == 2) {
        uint64_t v31 = 40;
      }
    }
    else
    {
      uint64_t v31 = 32;
    }
    id v39 = *(id *)((char *)&self->super.isa + v31);
    v35 = *v14;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v61 = v13;
      _os_log_impl(&dword_22289A000, v35, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request notification user authorization prompt", buf, 0xCu);
    }
    v45 = [(UNCLocalizationService *)self->_localizationService bundleWithIdentifier:v13];
    v38 = [v45 localizedInfoDictionary];
    v42 = objc_msgSend(v38, "bs_safeObjectForKey:ofType:", @"NSUserNotificationsUsageDescription", objc_opt_class());
    if (!v42)
    {
      v36 = [v45 infoDictionary];
      v42 = objc_msgSend(v36, "bs_safeObjectForKey:ofType:", @"NSUserNotificationsUsageDescription", objc_opt_class());
    }
    v37 = [v10 displayName];
    v46[0] = MEMORY[0x263EF8330];
    v46[1] = 3221225472;
    v46[2] = __148__UNSNotificationAuthorizationService__queue_requestAuthorizationWithOptions_forNotificationSourceDescription_withExpirationDate_completionHandler___block_invoke_85;
    v46[3] = &unk_26462F280;
    id v47 = v13;
    v48 = self;
    unint64_t v51 = a3;
    id v49 = v10;
    id v50 = v12;
    [v39 requestAuthorizationForBundleIdentifier:v47 displayName:v37 usageDescription:v42 withResult:v46];
  }
  else
  {
    uint64_t v22 = *v14;
    if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v61 = v13;
      _os_log_impl(&dword_22289A000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] No options requiring notification authorization", buf, 0xCu);
    }
    if (v12) {
      (*((void (**)(id, uint64_t, void))v12 + 2))(v12, [v19 hasEnabledSettings], 0);
    }
  }
LABEL_40:
}

- (void)requestAuthorizationWithOptions:(unint64_t)a3 forNotificationSourceDescription:(id)a4 completionHandler:(id)a5
{
}

- (void)requestAuthorizationWithOptions:(unint64_t)a3 expirationDate:(id)a4 forNotificationSourceDescription:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke;
  block[3] = &unk_26462F1E0;
  id v20 = v12;
  unint64_t v21 = a3;
  block[4] = self;
  id v18 = v11;
  id v19 = v10;
  id v14 = v12;
  id v15 = v10;
  id v16 = v11;
  dispatch_async(queue, block);
}

void __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ((*(unsigned char *)(a1 + 56) & 0x10) != 0)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(NSObject **)(v7 + 56);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke_3;
    block[3] = &unk_26462F190;
    block[4] = v7;
    id v10 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    char v13 = a2;
    id v11 = v5;
    dispatch_async(v8, block);
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    }
  }
}

void __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke_4;
  v4[3] = &unk_26462F168;
  id v6 = *(id *)(a1 + 56);
  char v7 = *(unsigned char *)(a1 + 64);
  id v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_queue_requestCriticalAlertAuthorizationForNotificationSourceDescription:completionHandler:", v3, v4);
}

- (void)_queue_requestCriticalAlertAuthorizationForNotificationSourceDescription:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = (void (**)(id, BOOL, void))a4;
  id v8 = [v6 bundleIdentifier];
  id v9 = (os_log_t *)MEMORY[0x263F1E070];
  id v10 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v8;
    _os_log_impl(&dword_22289A000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting critical alert authorization", buf, 0xCu);
  }
  id v11 = [(UNSDefaultDataProviderFactory *)self->_dataProviderFactory notificationSettingsForBundleIdentifier:v8];
  if ([v11 criticalAlertSetting])
  {
    id v12 = *v9;
    if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138543362;
    v27 = v8;
    char v13 = "[%{public}@] Already registered for critical alerts.";
    goto LABEL_16;
  }
  if (([v6 allowCriticalAlerts] & 1) == 0)
  {
    id v12 = *v9;
    if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138543362;
    v27 = v8;
    char v13 = "[%{public}@] Critical alert authorization is not permitted";
    goto LABEL_16;
  }
  id v14 = [MEMORY[0x263F53C50] sharedConnection];
  char v15 = [v14 isNotificationsModificationAllowedForBundleID:v8];

  if ((v15 & 1) == 0)
  {
    id v12 = *v9;
    if (!os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_DWORD *)buf = 138543362;
    v27 = v8;
    char v13 = "[%{public}@] Suppress critical alert user authorization prompt for restricted application";
LABEL_16:
    _os_log_impl(&dword_22289A000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
LABEL_17:
    if (v7) {
      v7[2](v7, [v11 criticalAlertSetting] == 2, 0);
    }
    goto LABEL_19;
  }
  int v16 = [v6 suppressUserAuthorizationPrompt];
  id v17 = *v9;
  BOOL v18 = os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT);
  if (v16)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138543362;
      v27 = v8;
      _os_log_impl(&dword_22289A000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Suppress critical alert user authorization prompt for system service", buf, 0xCu);
    }
    [(UNSDefaultDataProviderFactory *)self->_dataProviderFactory setCriticalAlertAuthorization:1 forNotificationSourceDescription:v6 completionHandler:v7];
  }
  else
  {
    if (v18)
    {
      *(_DWORD *)buf = 138543362;
      v27 = v8;
      _os_log_impl(&dword_22289A000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request critical alert user authorization prompt", buf, 0xCu);
    }
    criticalAlertAuthorizationAlertController = self->_criticalAlertAuthorizationAlertController;
    id v20 = [v6 displayName];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __130__UNSNotificationAuthorizationService__queue_requestCriticalAlertAuthorizationForNotificationSourceDescription_completionHandler___block_invoke;
    v21[3] = &unk_26462F2A8;
    id v22 = v8;
    v23 = self;
    id v24 = v6;
    v25 = v7;
    [(UNSAuthorizationAlertController *)criticalAlertAuthorizationAlertController requestAuthorizationForBundleIdentifier:v22 displayName:v20 usageDescription:&stru_26D509FA0 withResult:v21];
  }
LABEL_19:
}

- (UNSNotificationAuthorizationService)initWithDataProviderFactory:(id)a3 settingsService:(id)a4 localizationService:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)UNSNotificationAuthorizationService;
  id v12 = [(UNSNotificationAuthorizationService *)&v26 init];
  char v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_dataProviderFactory, a3);
    objc_storeStrong((id *)&v13->_settingsService, a4);
    objc_storeStrong((id *)&v13->_localizationService, a5);
    id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.usernotificationsserver.AuthorizationService", v14);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v15;

    id v17 = [(UNSAuthorizationAlertController *)[UNSCriticalAlertAuthorizationAlertController alloc] initWithQueue:v13->_queue];
    criticalAlertAuthorizationAlertController = v13->_criticalAlertAuthorizationAlertController;
    v13->_criticalAlertAuthorizationAlertController = v17;

    id v19 = [(UNSAuthorizationAlertController *)[UNSNotificationAuthorizationAlertController alloc] initWithQueue:v13->_queue];
    notificationAuthorizationAlertController = v13->_notificationAuthorizationAlertController;
    v13->_notificationAuthorizationAlertController = v19;

    unint64_t v21 = [(UNSAuthorizationAlertController *)[UNSNotificationDeliveryAuthorizationAlertController alloc] initWithQueue:v13->_queue];
    notificationDeliveryAuthorizationAlertController = v13->_notificationDeliveryAuthorizationAlertController;
    v13->_notificationDeliveryAuthorizationAlertController = v21;

    v23 = (CRCarPlayAppPolicyEvaluator *)objc_alloc_init(MEMORY[0x263F30E78]);
    policyEvaluator = v13->_policyEvaluator;
    v13->_policyEvaluator = v23;
  }
  return v13;
}

uint64_t __137__UNSNotificationAuthorizationService_requestAuthorizationWithOptions_expirationDate_forNotificationSourceDescription_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    if (*(unsigned char *)(a1 + 48)) {
      a2 = 1;
    }
    else {
      a2 = a2;
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a2, *(void *)(a1 + 32));
  }
  return result;
}

- (void)requestRemoveAuthorizationForNotificationSourceDescription:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __116__UNSNotificationAuthorizationService_requestRemoveAuthorizationForNotificationSourceDescription_completionHandler___block_invoke;
  block[3] = &unk_26462F208;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __116__UNSNotificationAuthorizationService_requestRemoveAuthorizationForNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestRemoveAuthorizationForNotificationSourceDescription:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)requestCriticalAlertAuthorizationForNotificationSourceDescription:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __123__UNSNotificationAuthorizationService_requestCriticalAlertAuthorizationForNotificationSourceDescription_completionHandler___block_invoke;
  block[3] = &unk_26462F208;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __123__UNSNotificationAuthorizationService_requestCriticalAlertAuthorizationForNotificationSourceDescription_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_requestCriticalAlertAuthorizationForNotificationSourceDescription:completionHandler:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

void __85__UNSNotificationAuthorizationService__didForegroundApplicationWithBundleIdentifier___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_ERROR)) {
    __85__UNSNotificationAuthorizationService__didForegroundApplicationWithBundleIdentifier___block_invoke_cold_1();
  }
}

void __148__UNSNotificationAuthorizationService__queue_requestAuthorizationWithOptions_forNotificationSourceDescription_withExpirationDate_completionHandler___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_ERROR)) {
      __148__UNSNotificationAuthorizationService__queue_requestAuthorizationWithOptions_forNotificationSourceDescription_withExpirationDate_completionHandler___block_invoke_cold_1();
    }
  }
  else if (a2)
  {
    if ([*(id *)(a1 + 40) authorizationStatus] == 2
      || [*(id *)(a1 + 40) authorizationStatus] == 3)
    {
      id v9 = (void *)*MEMORY[0x263F1E070];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        id v10 = *(void **)(a1 + 40);
        id v12 = v9;
        [v10 authorizationStatus];
        id v13 = UNAuthorizationStatusString();
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v11;
        __int16 v20 = 2114;
        id v21 = v13;
        _os_log_impl(&dword_22289A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Already authorized with %{public}@. Not requesting ephemeral authorization.", buf, 0x16u);
      }
    }
    else
    {
      int v16 = *MEMORY[0x263F1E070];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        uint64_t v19 = v17;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_impl(&dword_22289A000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting temporary authorization with user consent with last grant date %@", buf, 0x16u);
      }
      objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "requestAuthorizationStatus:withOptions:scheduledDeliveryEnabled:expirationDate:lastUserGrantDate:forNotificationSourceDescription:completionHandler:", 4, *(void *)(a1 + 80), objc_msgSend(*(id *)(a1 + 40), "scheduledDeliverySetting") == 2, *(void *)(a1 + 56), v7, *(void *)(a1 + 64), *(void *)(a1 + 72));
    }
  }
  else
  {
    id v14 = *MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v19 = v15;
      _os_log_impl(&dword_22289A000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting authorization denial due to user response", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 48) + 8) requestAuthorizationStatus:1 withOptions:*(void *)(a1 + 80) scheduledDeliveryEnabled:0 forNotificationSourceDescription:*(void *)(a1 + 64) completionHandler:*(void *)(a1 + 72)];
  }
}

uint64_t __148__UNSNotificationAuthorizationService__queue_requestAuthorizationWithOptions_forNotificationSourceDescription_withExpirationDate_completionHandler___block_invoke_85(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ((unint64_t)(a2 - 1) <= 1)
  {
    id v4 = *MEMORY[0x263F1E070];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[4];
      int v17 = 138543362;
      uint64_t v18 = v5;
      _os_log_impl(&dword_22289A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Approved by user", (uint8_t *)&v17, 0xCu);
    }
    BOOL v6 = a2 == 2;
    uint64_t v7 = a1[6];
    id v8 = *(void **)(a1[5] + 8);
    uint64_t v10 = a1[7];
    uint64_t v9 = a1[8];
    uint64_t v11 = 2;
    return [v8 requestAuthorizationStatus:v11 withOptions:v9 scheduledDeliveryEnabled:v6 forNotificationSourceDescription:v7 completionHandler:v10];
  }
  id v12 = *MEMORY[0x263F1E070];
  BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT);
  if (!a2)
  {
    if (v13)
    {
      uint64_t v16 = a1[4];
      int v17 = 138543362;
      uint64_t v18 = v16;
      _os_log_impl(&dword_22289A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Denied by user", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v7 = a1[6];
    id v8 = *(void **)(a1[5] + 8);
    uint64_t v10 = a1[7];
    uint64_t v9 = a1[8];
    uint64_t v11 = 1;
    BOOL v6 = 0;
    return [v8 requestAuthorizationStatus:v11 withOptions:v9 scheduledDeliveryEnabled:v6 forNotificationSourceDescription:v7 completionHandler:v10];
  }
  if (v13)
  {
    uint64_t v14 = a1[4];
    int v17 = 138543362;
    uint64_t v18 = v14;
    _os_log_impl(&dword_22289A000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] No response by user", (uint8_t *)&v17, 0xCu);
  }
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

uint64_t __130__UNSNotificationAuthorizationService__queue_requestCriticalAlertAuthorizationForNotificationSourceDescription_completionHandler___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = *MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = @"denied";
    uint64_t v6 = a1[4];
    if (a2 == 1) {
      uint64_t v5 = @"approved";
    }
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    _os_log_impl(&dword_22289A000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Critical alert %{public}@ by user", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1[5] + 8) setCriticalAlertAuthorization:a2 == 1 forNotificationSourceDescription:a1[6] completionHandler:a1[7]];
}

- (BOOL)_queue_isCarPlayAvailableForApplication:(id)a3
{
  id v4 = [MEMORY[0x263F30E68] declarationForAppProxy:a3];
  uint64_t v5 = [(CRCarPlayAppPolicyEvaluator *)self->_policyEvaluator effectivePolicyForAppDeclaration:v4];
  char v6 = [v5 showsNotifications];

  return v6;
}

- (void)_queue_requestRemoveAuthorizationForNotificationSourceDescription:(id)a3 completionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v8 = (void *)*MEMORY[0x263F1E070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E070], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = v8;
    __int16 v10 = [v6 bundleIdentifier];
    int v11 = 138543362;
    uint64_t v12 = v10;
    _os_log_impl(&dword_22289A000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting remove authorization", (uint8_t *)&v11, 0xCu);
  }
  [(UNSDefaultDataProviderFactory *)self->_dataProviderFactory requestRemoveAuthorizationforNotificationSourceDescription:v6 completionHandler:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policyEvaluator, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localizationService, 0);
  objc_storeStrong((id *)&self->_notificationDeliveryAuthorizationAlertController, 0);
  objc_storeStrong((id *)&self->_notificationAuthorizationAlertController, 0);
  objc_storeStrong((id *)&self->_criticalAlertAuthorizationAlertController, 0);
  objc_storeStrong((id *)&self->_settingsService, 0);
  objc_storeStrong((id *)&self->_dataProviderFactory, 0);
}

void __85__UNSNotificationAuthorizationService__didForegroundApplicationWithBundleIdentifier___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22289A000, v0, v1, "Request for temporary authorization for bundleId: %{public}@ failed with error: %{public}@");
}

void __148__UNSNotificationAuthorizationService__queue_requestAuthorizationWithOptions_forNotificationSourceDescription_withExpirationDate_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_22289A000, v0, v1, "[%{public}@] Retrieving user notifications consent for ephemeral notifications failed with error %{public}@");
}

@end