@interface PUIFitnessPlusAnalyticsConsentCoordinator
- (BOOL)fetchAnalyticsConsent;
- (PUIFitnessPlusAnalyticsConsentCoordinator)init;
- (void)fetchSubscriptionStatusWithCompletion:(id)a3;
- (void)setAnalyticsConsent:(BOOL)a3 completion:(id)a4;
@end

@implementation PUIFitnessPlusAnalyticsConsentCoordinator

- (PUIFitnessPlusAnalyticsConsentCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)PUIFitnessPlusAnalyticsConsentCoordinator;
  return [(PUIFitnessPlusAnalyticsConsentCoordinator *)&v3 init];
}

- (BOOL)fetchAnalyticsConsent
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id AMSAcknowledgePrivacyTaskClass = getAMSAcknowledgePrivacyTaskClass();
  objc_super v3 = getOBPrivacyImproveFitnessPlusIdentifier();
  LODWORD(AMSAcknowledgePrivacyTaskClass) = [AMSAcknowledgePrivacyTaskClass hasPreviouslyAcknowledgedPrivacyIdentifier:v3];

  id v4 = getAMSAcknowledgePrivacyTaskClass();
  v5 = getOBPrivacyImproveFitnessPlusIdentifier();
  LODWORD(v4) = [v4 hasRejectedPrivacyIdentifier:v5];

  unsigned int v6 = AMSAcknowledgePrivacyTaskClass & (v4 ^ 1);
  v7 = _PUILoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl(&dword_1E4AD5000, v7, OS_LOG_TYPE_DEFAULT, "PUIFitnessPlusAnalyticsConsentCoordinator isOptedIn %d", (uint8_t *)v9, 8u);
  }

  return v6;
}

- (void)setAnalyticsConsent:(BOOL)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)getAMSAcknowledgePrivacyTaskClass());
  v7 = getOBPrivacyImproveFitnessPlusIdentifier();
  v8 = (void *)[v6 initWithPrivacyIdentifier:v7];

  if (a3) {
    [v8 acknowledgePrivacy];
  }
  else {
  v9 = [v8 rejectPrivacy];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__PUIFitnessPlusAnalyticsConsentCoordinator_setAnalyticsConsent_completion___block_invoke;
  v11[3] = &unk_1E6E9CA48;
  BOOL v13 = a3;
  id v12 = v5;
  id v10 = v5;
  [v9 addFinishBlock:v11];
}

void __76__PUIFitnessPlusAnalyticsConsentCoordinator_setAnalyticsConsent_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _PUILoggingFacility();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      int v8 = *(unsigned __int8 *)(a1 + 40);
      int v11 = 67109120;
      int v12 = v8;
      _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, "PUIFitnessPlusAnalyticsConsentCoordinator successfully updated opt in privacy preference: %d", (uint8_t *)&v11, 8u);
    }
  }
  else if (v7)
  {
    int v9 = *(unsigned __int8 *)(a1 + 40);
    id v10 = [v5 localizedDescription];
    int v11 = 67109378;
    int v12 = v9;
    __int16 v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_1E4AD5000, v6, OS_LOG_TYPE_DEFAULT, "PUIFitnessPlusAnalyticsConsentCoordinator failed to update opt in privacy preference to %d with error: %@", (uint8_t *)&v11, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSubscriptionStatusWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0;
  int v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v4 = (void *)getASDSubscriptionEntitlementsClass_softClass;
  uint64_t v14 = getASDSubscriptionEntitlementsClass_softClass;
  if (!getASDSubscriptionEntitlementsClass_softClass)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __getASDSubscriptionEntitlementsClass_block_invoke;
    v10[3] = &unk_1E6E9C7F8;
    v10[4] = &v11;
    __getASDSubscriptionEntitlementsClass_block_invoke((uint64_t)v10);
    id v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  id v6 = [v5 sharedInstance];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __83__PUIFitnessPlusAnalyticsConsentCoordinator_fetchSubscriptionStatusWithCompletion___block_invoke;
  v8[3] = &unk_1E6E9CA70;
  id v9 = v3;
  id v7 = v3;
  [v6 getSubscriptionEntitlementsForSegment:2 ignoreCaches:0 requestingBundleId:@"com.apple.Preferences" withCacheInfoResultHandler:v8];
}

void __83__PUIFitnessPlusAnalyticsConsentCoordinator_fetchSubscriptionStatusWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a2;
  id v9 = a5;
  if (!v8 || ![v8 count])
  {
    id v10 = _PUILoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __83__PUIFitnessPlusAnalyticsConsentCoordinator_fetchSubscriptionStatusWithCompletion___block_invoke_cold_1(v9, v10);
    }
    goto LABEL_8;
  }
  if (a4)
  {
    id v10 = _PUILoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __83__PUIFitnessPlusAnalyticsConsentCoordinator_fetchSubscriptionStatusWithCompletion___block_invoke_cold_2(v10);
    }
LABEL_8:

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_9;
  }
  uint64_t v11 = [v8 firstObject];
  if (([v11 isTrialPeriod] & 1) != 0
    || ([v11 isOfferPeriod] & 1) != 0
    || ([v11 isInGracePeriod] & 1) != 0)
  {
    BOOL v12 = 1;
  }
  else
  {
    uint64_t v14 = [v11 expiryDate];
    [v14 timeIntervalSinceReferenceDate];
    double v16 = v15;
    v17 = [MEMORY[0x1E4F1C9C8] date];
    [v17 timeIntervalSinceReferenceDate];
    BOOL v12 = v16 > v18;
  }
  uint64_t v13 = _PUILoggingFacility();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109120;
    v19[1] = v12;
    _os_log_impl(&dword_1E4AD5000, v13, OS_LOG_TYPE_DEFAULT, "PUIFitnessPlusAnalyticsConsentCoordinator isSubscribed %d", (uint8_t *)v19, 8u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
LABEL_9:
}

void __83__PUIFitnessPlusAnalyticsConsentCoordinator_fetchSubscriptionStatusWithCompletion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1E4AD5000, a2, OS_LOG_TYPE_ERROR, "PUIFitnessPlusAnalyticsConsentCoordinator failed to fetch subscription status with error: %@", (uint8_t *)&v4, 0xCu);
}

void __83__PUIFitnessPlusAnalyticsConsentCoordinator_fetchSubscriptionStatusWithCompletion___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1E4AD5000, log, OS_LOG_TYPE_ERROR, "PUIFitnessPlusAnalyticsConsentCoordinator failed to fetch subscription status; cache expired",
    v1,
    2u);
}

@end