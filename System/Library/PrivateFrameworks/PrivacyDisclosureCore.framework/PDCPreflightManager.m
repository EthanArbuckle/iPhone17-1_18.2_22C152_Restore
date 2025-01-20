@interface PDCPreflightManager
+ (BOOL)isPreflightFeatureEnabled;
- (BOOL)_requiresPreflightForApplication:(id)a3;
- (BOOL)_requiresPreflightForApplicationRecord:(id)a3;
- (OS_dispatch_queue)queue;
- (PDCConsentStore)consentStore;
- (PDCPreflightManager)initWithTargetQueue:(id)a3;
- (PDCPreflightManager)initWithTargetQueue:(id)a3 consentStore:(id)a4;
- (id)_preflightLaunchForApplication:(id)a3 withCompletionHandler:(id)a4;
- (void)setConsentStore:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation PDCPreflightManager

void __48__PDCPreflightManager_isPreflightFeatureEnabled__block_invoke()
{
  char v0 = _os_feature_enabled_impl();
  if (isGreenTea_once != -1) {
    dispatch_once(&isGreenTea_once, &__block_literal_global_42);
  }
  int v1 = isGreenTea_result;
  char v2 = _os_feature_enabled_impl();
  char v3 = ct_green_tea_logging_enabled();
  if (isRunningInDemoMode_once != -1) {
    dispatch_once(&isRunningInDemoMode_once, &__block_literal_global_47);
  }
  if (v1) {
    char v4 = 1;
  }
  else {
    char v4 = v2;
  }
  if (isRunningInDemoMode_result) {
    char v5 = 0;
  }
  else {
    char v5 = v4;
  }
  isPreflightFeatureEnabled_result = v5 & (v0 | v3);
}

- (BOOL)_requiresPreflightForApplication:(id)a3
{
  id v4 = a3;
  id v10 = 0;
  char v5 = [v4 findApplicationRecordWithError:&v10];
  id v6 = v10;
  if (v6)
  {
    v7 = PDC_LOG_CHANNEL_PREFIXPrivacyDisclosureCore();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      PDCCurrentRegulatoryDisclosureVersionForApplicationIdentity_cold_1((uint64_t)v4, (uint64_t)v6, v7);
    }
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = [(PDCPreflightManager *)self _requiresPreflightForApplicationRecord:v5];
  }

  return v8;
}

- (BOOL)_requiresPreflightForApplicationRecord:(id)a3
{
  id v4 = a3;
  if (+[PDCPreflightManager isPreflightFeatureEnabled])
  {
    char v5 = [v4 regulatoryPrivacyDisclosureVersion];
    if (v5)
    {
      id v6 = [(PDCPreflightManager *)self consentStore];
      v7 = [v4 bundleIdentifier];
      BOOL v8 = [v6 userConsentedRegulatoryDisclosureVersionForBundleIdentifier:v7];

      int v9 = [v5 isEqual:v8] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (BOOL)isPreflightFeatureEnabled
{
  if (isPreflightFeatureEnabled_once != -1) {
    dispatch_once(&isPreflightFeatureEnabled_once, &__block_literal_global_4);
  }
  return isPreflightFeatureEnabled_result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consentStore, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (PDCPreflightManager)initWithTargetQueue:(id)a3
{
  id v4 = a3;
  char v5 = PDCGlobalConsentStoreInstance();
  id v6 = [(PDCPreflightManager *)self initWithTargetQueue:v4 consentStore:v5];

  return v6;
}

- (PDCPreflightManager)initWithTargetQueue:(id)a3 consentStore:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PDCPreflightManager;
  BOOL v8 = [(PDCPreflightManager *)&v16 init];
  if (v8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"PDCPreflightManager.0x%p", v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    id v10 = (const char *)[v9 UTF8String];
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create_with_target_V2(v10, v11, v6);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    objc_storeStrong((id *)&v8->_consentStore, a4);
    v14 = v8;
  }
  return v8;
}

- (id)_preflightLaunchForApplication:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PDCPreflightManager *)self _requiresPreflightForApplication:v6])
  {
    BOOL v8 = [[PDCPreflightRequestHandle alloc] initWithQueue:self->_queue completionHandler:v7];
    id v9 = +[PDCPrivacyAlertPresenter sharedPresenter];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __76__PDCPreflightManager__preflightLaunchForApplication_withCompletionHandler___block_invoke_2;
    v14[3] = &unk_265479F10;
    id v10 = (id *)&v15;
    v11 = v8;
    v15 = v11;
    [v9 activateRemoteAlertWithIdentity:v6 requestHandle:v11 forcePresent:0 completionHandler:v14];
  }
  else
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__PDCPreflightManager__preflightLaunchForApplication_withCompletionHandler___block_invoke;
    block[3] = &unk_265479EE8;
    id v10 = &v17;
    id v17 = v7;
    dispatch_async(queue, block);
    v11 = +[PDCPreflightRequestHandle alreadyCompletedRequestHandle];
  }

  return v11;
}

uint64_t __76__PDCPreflightManager__preflightLaunchForApplication_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__PDCPreflightManager__preflightLaunchForApplication_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 - 1) > 2) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = qword_25A6591E8[a2 - 1];
  }
  return [*(id *)(a1 + 32) completeRequestWithResponse:v2];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (PDCConsentStore)consentStore
{
  return self->_consentStore;
}

- (void)setConsentStore:(id)a3
{
}

@end