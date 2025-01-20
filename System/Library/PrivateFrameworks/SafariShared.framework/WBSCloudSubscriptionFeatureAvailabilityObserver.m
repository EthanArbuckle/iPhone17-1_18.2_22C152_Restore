@interface WBSCloudSubscriptionFeatureAvailabilityObserver
+ (WBSCloudSubscriptionFeatureAvailabilityObserver)porcupineAvailabilityObserver;
+ (WBSCloudSubscriptionFeatureAvailabilityObserver)provisionNewHideMyEmailAvailabilityObserver;
- (BOOL)_overridenAvailability;
- (WBSCloudSubscriptionFeatureAvailabilityObserver)initWithFeatureIdentifier:(id)a3;
- (void)_requestFeatureEligibilityBlockingQueueUntilResponse:(BOOL)a3;
- (void)_requestFeatureObjectBlockingQueueUntilResponse:(BOOL)a3;
- (void)dealloc;
- (void)getFeatureAvailabilityWithCompletionHandler:(id)a3;
- (void)getFeatureEligibilityWithCompletionHandler:(id)a3;
@end

@implementation WBSCloudSubscriptionFeatureAvailabilityObserver

void __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke_3_cold_1(v7, v5);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v8;
    _os_log_impl(&dword_1A6B5F000, v7, OS_LOG_TYPE_INFO, "Did receive feature eligibility for cloud subscription feature %@", buf, 0xCu);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    *(unsigned char *)(v9 + 40) = a2;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v10 = *(NSObject **)(v9 + 8);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke_16;
    v11[3] = &unk_1E5C8CF28;
    v11[4] = v9;
    char v12 = a2;
    dispatch_async(v10, v11);
  }
}

void __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke_3_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to get cloud feature eligibility: %{public}@", v7, v8, v9, v10, 2u);
}

void __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke_3_cold_1(v8, v6);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 16);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v9;
    _os_log_impl(&dword_1A6B5F000, v8, OS_LOG_TYPE_INFO, "Did receive feature availability for cloud subscription feature %@", buf, 0xCu);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    v11 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = v5;
    id v12 = v5;

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v13 = *(NSObject **)(v10 + 8);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke_9;
    v15[3] = &unk_1E5C8C920;
    v15[4] = v10;
    id v16 = v5;
    id v14 = v5;
    dispatch_async(v13, v15);
  }
}

void __80__WBSCloudSubscriptionFeatureAvailabilityObserver_porcupineAvailabilityObserver__block_invoke()
{
  v0 = [[WBSCloudSubscriptionFeatureAvailabilityObserver alloc] initWithFeatureIdentifier:@"networking.privacy.subscriber"];
  v1 = (void *)porcupineAvailabilityObserver_porcupineAvailabilityObserver;
  porcupineAvailabilityObserver_porcupineAvailabilityObserver = (uint64_t)v0;
}

- (WBSCloudSubscriptionFeatureAvailabilityObserver)initWithFeatureIdentifier:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBSCloudSubscriptionFeatureAvailabilityObserver;
  id v5 = [(WBSCloudSubscriptionFeatureAvailabilityObserver *)&v18 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.WBSCloudSubscriptionFeatureAvailabilityObserver", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [v4 copy];
    featureIdentifier = v5->_featureIdentifier;
    v5->_featureIdentifier = (NSString *)v8;

    if (!CloudSubscriptionFeaturesLibraryCore_frameworkLibrary)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = __CloudSubscriptionFeaturesLibraryCore_block_invoke;
      location[3] = &__block_descriptor_40_e5_v8__0l;
      location[4] = 0;
      long long v20 = xmmword_1E5C8E120;
      uint64_t v21 = 0;
      CloudSubscriptionFeaturesLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (CloudSubscriptionFeaturesLibraryCore_frameworkLibrary)
    {
      objc_initWeak(location, v5);
      uint64_t v10 = (void *)MEMORY[0x1E4F59BB8];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __77__WBSCloudSubscriptionFeatureAvailabilityObserver_initWithFeatureIdentifier___block_invoke;
      v16[3] = &unk_1E5C8E0B0;
      objc_copyWeak(&v17, location);
      uint64_t v11 = [v10 registerForFeatureChangeNotificationsUsingBlock:v16];
      changeObserverToken = v5->_changeObserverToken;
      v5->_changeObserverToken = (FeatureChangeObserver *)v11;

      [(WBSCloudSubscriptionFeatureAvailabilityObserver *)v5 _requestFeatureObjectBlockingQueueUntilResponse:1];
      [(WBSCloudSubscriptionFeatureAvailabilityObserver *)v5 _requestFeatureEligibilityBlockingQueueUntilResponse:1];
      objc_destroyWeak(&v17);
      objc_destroyWeak(location);
    }
    else
    {
      v13 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1A6B5F000, v13, OS_LOG_TYPE_INFO, "Running in an environment where CloudSubscriptionFeatures framework is not available.", (uint8_t *)location, 2u);
      }
    }
    id v14 = v5;
  }

  return v5;
}

- (void)_requestFeatureEligibilityBlockingQueueUntilResponse:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(WBSCloudSubscriptionFeatureAvailabilityObserver *)self _overridenAvailability];
  dispatch_queue_t v6 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      featureIdentifier = self->_featureIdentifier;
      *(_DWORD *)buf = 138412290;
      id v14 = featureIdentifier;
      _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Found local override for cloud subscription feature %@. Skipping eligibility lookup.", buf, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = self->_featureIdentifier;
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Requesting feature eligibility for cloud subscription feature %@", buf, 0xCu);
    }
    queue = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke;
    v11[3] = &unk_1E5C8CF28;
    v11[4] = self;
    BOOL v12 = a3;
    dispatch_async(queue, v11);
  }
}

- (void)_requestFeatureObjectBlockingQueueUntilResponse:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(WBSCloudSubscriptionFeatureAvailabilityObserver *)self _overridenAvailability];
  dispatch_queue_t v6 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      featureIdentifier = self->_featureIdentifier;
      *(_DWORD *)buf = 138412290;
      id v14 = featureIdentifier;
      _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Found local override for cloud subscription feature %@. Skipping availability lookup.", buf, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      uint64_t v9 = self->_featureIdentifier;
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_1A6B5F000, v6, OS_LOG_TYPE_INFO, "Requesting feature availability for cloud subscription feature %@", buf, 0xCu);
    }
    queue = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke;
    v11[3] = &unk_1E5C8CF28;
    BOOL v12 = a3;
    v11[4] = self;
    dispatch_async(queue, v11);
  }
}

uint64_t __94__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureEligibilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  int v3 = [*(id *)(a1 + 32) _overridenAvailability];
  id v4 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __94__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureEligibilityWithCompletionHandler___block_invoke_cold_1(v2, v4);
    }
    dispatch_queue_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    if (v5) {
      __94__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureEligibilityWithCompletionHandler___block_invoke_cold_2(v2);
    }
    dispatch_queue_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  return v6();
}

- (BOOL)_overridenAvailability
{
  uint64_t v2 = [@"WBSCloudFeatureOverride." stringByAppendingString:self->_featureIdentifier];
  int v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [v3 BOOLForKey:v2];

  return v4;
}

void __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    if (*(unsigned char *)(a1 + 40)) {
      dispatch_block_t v2 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &__block_literal_global_14_0);
    }
    else {
      dispatch_block_t v2 = 0;
    }
    int v3 = (void *)MEMORY[0x1E4F59BB8];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
    BOOL v5 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_safariApplicationPlatformBundleIdentifier");
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke_3;
    v7[3] = &unk_1E5C8E100;
    v7[4] = *(void *)(a1 + 32);
    id v6 = v2;
    id v8 = v6;
    [v3 getFeatureEligibilityForFeatureWithId:v4 bundleId:v5 completion:v7];

    if (v6) {
      dispatch_block_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  }
}

+ (WBSCloudSubscriptionFeatureAvailabilityObserver)porcupineAvailabilityObserver
{
  if (porcupineAvailabilityObserver_onceToken != -1) {
    dispatch_once(&porcupineAvailabilityObserver_onceToken, &__block_literal_global_27);
  }
  dispatch_block_t v2 = (void *)porcupineAvailabilityObserver_porcupineAvailabilityObserver;
  return (WBSCloudSubscriptionFeatureAvailabilityObserver *)v2;
}

void __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    dispatch_block_t v2 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &__block_literal_global_19);
  }
  else {
    dispatch_block_t v2 = 0;
  }
  int v3 = (void *)MEMORY[0x1E4F59BB8];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke_3;
  v7[3] = &unk_1E5C8E0D8;
  v7[4] = v4;
  id v6 = v2;
  id v8 = v6;
  [v3 requestFeatureWithId:v5 completion:v7];
  if (v6) {
    dispatch_block_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)getFeatureEligibilityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureEligibilityWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __77__WBSCloudSubscriptionFeatureAvailabilityObserver_initWithFeatureIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _requestFeatureObjectBlockingQueueUntilResponse:0];
  [WeakRetained _requestFeatureEligibilityBlockingQueueUntilResponse:0];
}

void __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke_9(uint64_t a1)
{
}

uint64_t __104__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureEligibilityBlockingQueueUntilResponse___block_invoke_16(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 40) = *(unsigned char *)(result + 40);
  return result;
}

- (void)dealloc
{
  if (self->_changeObserverToken) {
    objc_msgSend(MEMORY[0x1E4F59BB8], "unregisterForFeatureChangeNotificationsUsingObserver:");
  }
  v3.receiver = self;
  v3.super_class = (Class)WBSCloudSubscriptionFeatureAvailabilityObserver;
  [(WBSCloudSubscriptionFeatureAvailabilityObserver *)&v3 dealloc];
}

- (void)getFeatureAvailabilityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureAvailabilityWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __95__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureAvailabilityWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  if ([*(id *)(a1 + 32) _overridenAvailability])
  {
    objc_super v3 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __95__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureAvailabilityWithCompletionHandler___block_invoke_cold_1(v2, v3);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v4 = *(id *)(*(void *)v2 + 32);
    if (objc_opt_respondsToSelector())
    {
      char v5 = [v4 canUse];
    }
    else if (v4)
    {
      char v5 = [v4 status] == 0;
    }
    else
    {
      char v5 = 0;
    }
    id v6 = WBS_LOG_CHANNEL_PREFIXAppleAccount();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __95__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureAvailabilityWithCompletionHandler___block_invoke_cold_2(v2, v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

+ (WBSCloudSubscriptionFeatureAvailabilityObserver)provisionNewHideMyEmailAvailabilityObserver
{
  if (provisionNewHideMyEmailAvailabilityObserver_onceToken != -1) {
    dispatch_once(&provisionNewHideMyEmailAvailabilityObserver_onceToken, &__block_literal_global_24);
  }
  uint64_t v2 = (void *)provisionNewHideMyEmailAvailabilityObserver_hideMyEmailAvailabilityObserver;
  return (WBSCloudSubscriptionFeatureAvailabilityObserver *)v2;
}

void __94__WBSCloudSubscriptionFeatureAvailabilityObserver_provisionNewHideMyEmailAvailabilityObserver__block_invoke()
{
  v0 = [[WBSCloudSubscriptionFeatureAvailabilityObserver alloc] initWithFeatureIdentifier:@"mail.hide-my-email.create"];
  v1 = (void *)provisionNewHideMyEmailAvailabilityObserver_hideMyEmailAvailabilityObserver;
  provisionNewHideMyEmailAvailabilityObserver_hideMyEmailAvailabilityObserver = (uint64_t)v0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureObject, 0);
  objc_storeStrong((id *)&self->_changeObserverToken, 0);
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __99__WBSCloudSubscriptionFeatureAvailabilityObserver__requestFeatureObjectBlockingQueueUntilResponse___block_invoke_3_cold_1(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_0(&dword_1A6B5F000, v5, v6, "Failed to get cloud feature object: %{public}@", v7, v8, v9, v10, 2u);
}

void __95__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureAvailabilityWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Found local override for cloud feature %@. Returning feature availble: YES", (uint8_t *)&v3, 0xCu);
}

void __95__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureAvailabilityWithCompletionHandler___block_invoke_cold_2(uint64_t a1, char a2)
{
  uint64_t v2 = @"NO";
  if (a2) {
    uint64_t v2 = @"YES";
  }
  int v3 = v2;
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0(&dword_1A6B5F000, v4, v5, "Returning cloud feature %@ availability from CloudSubscriptionFeatures: %@", v6, v7, v8, v9, v10);
}

void __94__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureEligibilityWithCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1A6B5F000, a2, OS_LOG_TYPE_DEBUG, "Found local override for cloud feature %@. Returning feature eligible: YES", (uint8_t *)&v3, 0xCu);
}

void __94__WBSCloudSubscriptionFeatureAvailabilityObserver_getFeatureEligibilityWithCompletionHandler___block_invoke_cold_2(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)a1 + 40)) {
    v1 = @"YES";
  }
  else {
    v1 = @"NO";
  }
  uint64_t v2 = v1;
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_0(&dword_1A6B5F000, v3, v4, "Returning cloud feature %@ eligibility from CloudSubscriptionFeatures: %@", v5, v6, v7, v8, v9);
}

@end