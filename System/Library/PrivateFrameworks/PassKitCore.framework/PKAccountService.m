@interface PKAccountService
+ (PKAccountService)sharedInstance;
- (OS_dispatch_queue)replyQueue;
- (PKAccountService)init;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)accountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6;
- (id)errorHandlerForMethod:(SEL)a3 completion:(id)a4;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_accountsChanged:(id)a3;
- (void)accountAdded:(id)a3;
- (void)accountChanged:(id)a3;
- (void)accountEnhancedMerchantBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountEntityOrderingsForAccountWithIdentifier:(id)a3 entityType:(unint64_t)a4 completion:(id)a5;
- (void)accountFinancingPlanAdded:(id)a3 accountIdentifier:(id)a4;
- (void)accountFinancingPlanRemoved:(id)a3 accountIdentifier:(id)a4;
- (void)accountFinancingPlanUpdated:(id)a3 oldFinancingPlan:(id)a4 accountIdentifier:(id)a5;
- (void)accountForPassWithUniqueID:(id)a3 completion:(id)a4;
- (void)accountHoldsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)accountPendingFamilyMembersForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)accountPromotionBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountRemoved:(id)a3;
- (void)accountStatementMetadataForAllAccountsWithCompletion:(id)a3;
- (void)accountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)accountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountWithVirtualCardIdentifier:(id)a3 completion:(id)a4;
- (void)accountsForProvisioningWithCompletion:(id)a3;
- (void)accountsWithCompletion:(id)a3;
- (void)accountsWithPassLocallyProvisionedWithCompletion:(id)a3;
- (void)activateBroadwayPhysicalCardWithActivationCode:(id)a3 completion:(id)a4;
- (void)activatePhysicalCard:(id)a3 withActivationCode:(id)a4 forFeatureIdentifier:(unint64_t)a5 completion:(id)a6;
- (void)appleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)attemptAppleBalanceSetupWithCompletion:(id)a3;
- (void)attemptAppleStoredValueSetupWithCompletion:(id)a3;
- (void)backgroundProvisionInProgressForFeature:(unint64_t)a3 withCompletion:(id)a4;
- (void)beginPhysicalCardAction:(id)a3 onPhysicalCardWithIdentifier:(id)a4 forAccountWithIdentifier:(id)a5 accountUserAltDSID:(id)a6 deviceMetadata:(id)a7 completion:(id)a8;
- (void)beginPhysicalCardRequestWithOrder:(id)a3 forAccountWithIdentifier:(id)a4 accountUserAltDSID:(id)a5 deviceMetadata:(id)a6 completion:(id)a7;
- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStartDate:(id)a4 endDate:(id)a5 completion:(id)a6;
- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStatementIdentifier:(id)a4 completion:(id)a5;
- (void)cancelFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 cancellationReasonIdentifier:(id)a5 cancellationReasonDescription:(id)a6 completion:(id)a7;
- (void)cardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 action:(int64_t)a5 completion:(id)a6;
- (void)completePhysicalCardActionRequest:(id)a3 withSignature:(id)a4 completion:(id)a5;
- (void)completePhysicalCardRequest:(id)a3 withSignature:(id)a4 completion:(id)a5;
- (void)createVirtualCard:(int64_t)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)creditRecoveryPaymentPlanInformationForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5;
- (void)creditRecoveryPaymentPlansChangedForAccountIdentifier:(id)a3;
- (void)creditRecoveryPaymentPlansForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5;
- (void)creditStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)creditStatementsForStatementIdentifiers:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)dailyCashEligibleDestinationsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)defaultAccountForFeature:(unint64_t)a3 completion:(id)a4;
- (void)deleteAccountEnhancedMerchant:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountPromotion:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountUserWithAltDSID:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteAppleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteBeneficiaryWithIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)deleteEventWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteEventsWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)deleteEventsWithAccountIdentifier:(id)a3 excludingTypes:(id)a4 completion:(id)a5;
- (void)deleteFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)deleteFinancingPlansForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)deleteFinancingPlansForAllAccountsWithCompletion:(id)a3;
- (void)deleteInStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteLocalAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)didAddAccountPendingFamilyMembers:(id)a3;
- (void)didRemoveAppleBalancePromotionWithUniqueIdentifier:(id)a3 forAccountIdentifier:(id)a4;
- (void)didUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 lastUpdate:(id)a5;
- (void)didUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4;
- (void)didUpdateAppleBalancePromotion:(id)a3 forAccountIdentifier:(id)a4;
- (void)didUpdateInStoreTopUpToken:(id)a3 forAccountIdentifier:(id)a4;
- (void)didUpdatePaymentFundingSources:(id)a3 accountIdentifier:(id)a4;
- (void)eventsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)eventsForAccountIdentifier:(id)a3 types:(id)a4 startDate:(id)a5 endDate:(id)a6 orderedByDate:(int64_t)a7 limit:(unint64_t)a8 completion:(id)a9;
- (void)exportTransactionDataForAccountIdentifier:(id)a3 withFileFormat:(id)a4 beginDate:(id)a5 endDate:(id)a6 productTimeZone:(id)a7 completion:(id)a8;
- (void)fetchKeychainCredentialForVirtualCardIdentifier:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)financingPlanForPlanIdentifier:(id)a3 completion:(id)a4;
- (void)financingPlanInstallmentsDueDateRangeForAccountIdentifier:(id)a3 financingPlanStates:(id)a4 completion:(id)a5;
- (void)financingPlansForAllAccountsWithCompletion:(id)a3;
- (void)financingPlansWithQueries:(id)a3 completion:(id)a4;
- (void)financingPlansWithQuery:(id)a3 completion:(id)a4;
- (void)inStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)inactivePhysicalCardForFeatureIdentifier:(unint64_t)a3 completion:(id)a4;
- (void)insertDailyCashNotificationForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)insertEvents:(id)a3 withAccountidentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateInStoreTopUpToken:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateLocalAccount:(id)a3 completion:(id)a4;
- (void)insertOrUpdateLocalFinancingPlans:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertSummaryNotificationForAccountIdentifier:(id)a3 summaryType:(int64_t)a4 completion:(id)a5;
- (void)invalidateTopUpTokenWithIdentifier:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)lastRedemptionEventToDestination:(unint64_t)a3 forAccountIdentifier:(id)a4 altDSID:(id)a5 completion:(id)a6;
- (void)lastUsedInAppFundingSourceForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)markUserViewedIntroduction:(BOOL)a3 forInstallmentIdentifiers:(id)a4 accountIdentifier:(id)a5;
- (void)noteSecurityCodeActivityWithAction:(int64_t)a3 forSecurityCodeIdentifier:(id)a4 forVirtualCardIdentifier:(id)a5 forAccountIdentifier:(id)a6 completion:(id)a7;
- (void)noteVirtualCardAutoFilledBySafari:(id)a3 completion:(id)a4;
- (void)payLaterCardMagnitudesChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)payLaterCardMagnitudesForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)paymentFundingSourceForIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)paymentFundingSourcesForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)performAccountAction:(id)a3 withAccountIdentifier:(id)a4 accountUserAltDSID:(id)a5 completion:(id)a6;
- (void)performVirtualCardAction:(int64_t)a3 forVirtualCardIdentifier:(id)a4 forAccountIdentifier:(id)a5 completion:(id)a6;
- (void)physicalCardForFeatureIdentifier:(unint64_t)a3 activationCode:(id)a4 completion:(id)a5;
- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4;
- (void)physicalCardsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)processPhysicalCardExpirationMessaging:(id)a3 physicalCards:(id)a4 account:(id)a5;
- (void)registerObserver:(id)a3;
- (void)reprocessPayLaterFinancingPlansForMerchantCleanup:(id)a3;
- (void)resetAccountBalancesForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)rewardsTierSummaryForTransactionSourceIdentifiers:(id)a3 currencyCode:(id)a4 startDate:(id)a5 endDate:(id)a6 completion:(id)a7;
- (void)savingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)scheduleSetupReminderForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)scheduledPaymentsChangedForAccountIdentifier:(id)a3;
- (void)scheduledPaymentsWithAccountIdentifier:(id)a3 includeFailedRecurringPayments:(BOOL)a4 allowFetchFromServer:(BOOL)a5 completion:(id)a6;
- (void)scheduledPaymentsWithAccountIdentifier:(id)a3 includeFailedRecurringPayments:(BOOL)a4 completion:(id)a5;
- (void)setNeedsSyncToFinanceForAllTransactionsWithCompletion:(id)a3;
- (void)setReplyQueue:(id)a3;
- (void)sharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)statementsChangedForAccountIdentifier:(id)a3;
- (void)taxFormsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)termsWithIdentifier:(id)a3 accepted:(BOOL)a4 withAccountIdentifier:(id)a5 completion:(id)a6;
- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4;
- (void)triggerStatementMetadataProcessingForAccountIdentifier:(id)a3 statementIdentifier:(id)a4 completion:(id)a5;
- (void)unregisterObserver:(id)a3;
- (void)updateAccountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7;
- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 cooldownLevel:(unint64_t)a4 completion:(id)a5;
- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 cooldownLevel:(unint64_t)a5 completion:(id)a6;
- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 observeCooldownPeriod:(BOOL)a5 completion:(id)a6;
- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 observeCooldownPeriod:(BOOL)a4 completion:(id)a5;
- (void)updateAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)updateAccountUserNotificationSettings:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6;
- (void)updateAccountUserPreferences:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6;
- (void)updateAccountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountWithIdentifier:(id)a3 extended:(BOOL)a4 completion:(id)a5;
- (void)updateAccountsWithCompletion:(id)a3;
- (void)updateCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateCreditStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateFinancingPlansForAccountWithIdentifier:(id)a3 pageOffset:(unint64_t)a4 limit:(unint64_t)a5 ignoreLastUpdatedDate:(BOOL)a6 forceFetch:(BOOL)a7 completion:(id)a8;
- (void)updateImpressionCount:(int64_t)a3 promotionProgramIdentifier:(id)a4 accountIdentifier:(id)a5 completion:(id)a6;
- (void)updateImpressionCountsForPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)updateLastUsedInAppFundingSource:(id)a3 accountIdentifier:(id)a4;
- (void)updateMockAccountWithAccount:(id)a3 completion:(id)a4;
- (void)updatePaymentFundingSourcesForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)updatePhysicalCardsForAccountWithIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)updateSavingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateScheduledPaymentsWithAccount:(id)a3 completion:(id)a4;
- (void)updateSharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateTaxFormsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateUserInfoForAccountIdentifier:(id)a3 contact:(id)a4 completion:(id)a5;
- (void)updateVirtualCardsWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateWalletBadgeCountWithCompletion:(id)a3;
- (void)userInfoForAccountIdentifier:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5;
- (void)validateAppleBalanceSecurityRequirementsWithCompletion:(id)a3;
- (void)virtualCardsInKeychainWithCompletion:(id)a3;
- (void)writeVirtualCardToKeychain:(id)a3 completion:(id)a4;
@end

@implementation PKAccountService

void __34__PKAccountService_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1EB403610;
  qword_1EB403610 = (uint64_t)v1;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers addObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

+ (PKAccountService)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PKAccountService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_288 != -1) {
    dispatch_once(&_MergedGlobals_288, block);
  }
  v2 = (void *)qword_1EB403610;
  return (PKAccountService *)v2;
}

- (PKAccountService)init
{
  v14.receiver = self;
  v14.super_class = (Class)PKAccountService;
  v2 = [(PKAccountService *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.passkit.pkpassservice.reply", 0);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v3;

    v5 = [PKXPCService alloc];
    v6 = PDAccountServiceInterface();
    v7 = PKAccountServiceInterface();
    uint64_t v8 = [(PKXPCService *)v5 initWithMachServiceName:@"com.apple.passd.account" remoteObjectInterface:v6 exportedObjectInterface:v7 exportedObject:v2];
    remoteService = v2->_remoteService;
    v2->_remoteService = (PKXPCService *)v8;

    v2->_lockObservers._os_unfair_lock_opaque = 0;
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v10;

    v12 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v12 addObserver:v2 selector:sel__accountsChanged_ name:@"PKAccountServiceAccountsChangedDistributedNotification" object:0 suspensionBehavior:2];
  }
  return v2;
}

- (void)updateFinancingPlansForAccountWithIdentifier:(id)a3 pageOffset:(unint64_t)a4 limit:(unint64_t)a5 ignoreLastUpdatedDate:(BOOL)a6 forceFetch:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  id v15 = a8;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __136__PKAccountService_PayLater__updateFinancingPlansForAccountWithIdentifier_pageOffset_limit_ignoreLastUpdatedDate_forceFetch_completion___block_invoke;
  v23[3] = &unk_1E56D8388;
  id v16 = v15;
  id v24 = v16;
  id v17 = a3;
  v18 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v23];
  v19 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v18];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __136__PKAccountService_PayLater__updateFinancingPlansForAccountWithIdentifier_pageOffset_limit_ignoreLastUpdatedDate_forceFetch_completion___block_invoke_2;
  v21[3] = &unk_1E56D90B0;
  v21[4] = self;
  id v22 = v16;
  id v20 = v16;
  [v19 updateFinancingPlansForAccountWithIdentifier:v17 pageOffset:a4 limit:a5 ignoreLastUpdatedDate:v9 forceFetch:v8 completion:v21];
}

uint64_t __136__PKAccountService_PayLater__updateFinancingPlansForAccountWithIdentifier_pageOffset_limit_ignoreLastUpdatedDate_forceFetch_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __136__PKAccountService_PayLater__updateFinancingPlansForAccountWithIdentifier_pageOffset_limit_ignoreLastUpdatedDate_forceFetch_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = [*(id *)(a1 + 32) replyQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __136__PKAccountService_PayLater__updateFinancingPlansForAccountWithIdentifier_pageOffset_limit_ignoreLastUpdatedDate_forceFetch_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  BOOL v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __136__PKAccountService_PayLater__updateFinancingPlansForAccountWithIdentifier_pageOffset_limit_ignoreLastUpdatedDate_forceFetch_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)cancelFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 cancellationReasonIdentifier:(id)a5 cancellationReasonDescription:(id)a6 completion:(id)a7
{
  id v13 = a7;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __152__PKAccountService_PayLater__cancelFinancingPlanWithIdentifier_accountIdentifier_cancellationReasonIdentifier_cancellationReasonDescription_completion___block_invoke;
  v24[3] = &unk_1E56D8388;
  id v14 = v13;
  id v25 = v14;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v24];
  id v20 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v19];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __152__PKAccountService_PayLater__cancelFinancingPlanWithIdentifier_accountIdentifier_cancellationReasonIdentifier_cancellationReasonDescription_completion___block_invoke_2;
  v22[3] = &unk_1E56D9528;
  v22[4] = self;
  id v23 = v14;
  id v21 = v14;
  [v20 cancelFinancingPlanWithIdentifier:v18 accountIdentifier:v17 cancellationReasonIdentifier:v16 cancellationReasonDescription:v15 completion:v22];
}

uint64_t __152__PKAccountService_PayLater__cancelFinancingPlanWithIdentifier_accountIdentifier_cancellationReasonIdentifier_cancellationReasonDescription_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __152__PKAccountService_PayLater__cancelFinancingPlanWithIdentifier_accountIdentifier_cancellationReasonIdentifier_cancellationReasonDescription_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) replyQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __152__PKAccountService_PayLater__cancelFinancingPlanWithIdentifier_accountIdentifier_cancellationReasonIdentifier_cancellationReasonDescription_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __152__PKAccountService_PayLater__cancelFinancingPlanWithIdentifier_accountIdentifier_cancellationReasonIdentifier_cancellationReasonDescription_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)financingPlansForAllAccountsWithCompletion:(id)a3
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PKAccountService_PayLater__financingPlansForAllAccountsWithCompletion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v6 = v5;
  id v13 = v6;
  v7 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v12];
  id v8 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PKAccountService_PayLater__financingPlansForAllAccountsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8810;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 financingPlansForAllAccountsWithCompletion:v10];
}

uint64_t __73__PKAccountService_PayLater__financingPlansForAllAccountsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __73__PKAccountService_PayLater__financingPlansForAllAccountsWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) replyQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PKAccountService_PayLater__financingPlansForAllAccountsWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __73__PKAccountService_PayLater__financingPlansForAllAccountsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)financingPlansWithQuery:(id)a3 completion:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v21[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __65__PKAccountService_PayLater__financingPlansWithQuery_completion___block_invoke_2;
    v14[3] = &unk_1E56ED2E8;
    v14[4] = self;
    id v16 = v7;
    id v15 = v6;
    id v9 = v7;
    [(PKAccountService *)self financingPlansWithQueries:v8 completion:v14];

    id v10 = v16;
  }
  else
  {
    uint64_t v11 = [(PKAccountService *)self replyQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__PKAccountService_PayLater__financingPlansWithQuery_completion___block_invoke;
    v17[3] = &unk_1E56D8360;
    id v18 = v7;
    id v12 = v17;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __dispatch_async_ar_block_invoke_16;
    block[3] = &unk_1E56D8360;
    id v20 = v12;
    id v13 = v7;
    dispatch_async(v11, block);

    id v10 = v18;
  }
}

uint64_t __65__PKAccountService_PayLater__financingPlansWithQuery_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __65__PKAccountService_PayLater__financingPlansWithQuery_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2)
  {
    id v3 = *(void **)(a1 + 40);
    id v4 = a2;
    id v6 = [v3 queryIdentifier];
    id v5 = [v4 objectForKeyedSubscript:v6];

    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
  }
}

- (void)financingPlansWithQueries:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__PKAccountService_PayLater__financingPlansWithQueries_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__PKAccountService_PayLater__financingPlansWithQueries_completion___block_invoke_2;
  v13[3] = &unk_1E56DE680;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 financingPlansWithQueries:v9 completion:v13];
}

uint64_t __67__PKAccountService_PayLater__financingPlansWithQueries_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __67__PKAccountService_PayLater__financingPlansWithQueries_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) replyQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67__PKAccountService_PayLater__financingPlansWithQueries_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __67__PKAccountService_PayLater__financingPlansWithQueries_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)financingPlanInstallmentsDueDateRangeForAccountIdentifier:(id)a3 financingPlanStates:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __119__PKAccountService_PayLater__financingPlanInstallmentsDueDateRangeForAccountIdentifier_financingPlanStates_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __119__PKAccountService_PayLater__financingPlanInstallmentsDueDateRangeForAccountIdentifier_financingPlanStates_completion___block_invoke_2;
  v16[3] = &unk_1E56F0A70;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 financingPlanInstallmentsDueDateRangeForAccountIdentifier:v12 financingPlanStates:v11 completion:v16];
}

uint64_t __119__PKAccountService_PayLater__financingPlanInstallmentsDueDateRangeForAccountIdentifier_financingPlanStates_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __119__PKAccountService_PayLater__financingPlanInstallmentsDueDateRangeForAccountIdentifier_financingPlanStates_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) replyQueue];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __119__PKAccountService_PayLater__financingPlanInstallmentsDueDateRangeForAccountIdentifier_financingPlanStates_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __119__PKAccountService_PayLater__financingPlanInstallmentsDueDateRangeForAccountIdentifier_financingPlanStates_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)reprocessPayLaterFinancingPlansForMerchantCleanup:(id)a3
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__PKAccountService_PayLater__reprocessPayLaterFinancingPlansForMerchantCleanup___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v6 = v5;
  id v13 = v6;
  id v7 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v12];
  id v8 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__PKAccountService_PayLater__reprocessPayLaterFinancingPlansForMerchantCleanup___block_invoke_2;
  v10[3] = &unk_1E56D8A18;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 reprocessPayLaterFinancingPlansForMerchantCleanup:v10];
}

uint64_t __80__PKAccountService_PayLater__reprocessPayLaterFinancingPlansForMerchantCleanup___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __80__PKAccountService_PayLater__reprocessPayLaterFinancingPlansForMerchantCleanup___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) replyQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __80__PKAccountService_PayLater__reprocessPayLaterFinancingPlansForMerchantCleanup___block_invoke_3;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __80__PKAccountService_PayLater__reprocessPayLaterFinancingPlansForMerchantCleanup___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteFinancingPlansForAllAccountsWithCompletion:(id)a3
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__PKAccountService_PayLater__deleteFinancingPlansForAllAccountsWithCompletion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v6 = v5;
  id v13 = v6;
  id v7 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v12];
  id v8 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __79__PKAccountService_PayLater__deleteFinancingPlansForAllAccountsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8A18;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 deleteFinancingPlansForAllAccountsWithCompletion:v10];
}

uint64_t __79__PKAccountService_PayLater__deleteFinancingPlansForAllAccountsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79__PKAccountService_PayLater__deleteFinancingPlansForAllAccountsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) replyQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __79__PKAccountService_PayLater__deleteFinancingPlansForAllAccountsWithCompletion___block_invoke_3;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __79__PKAccountService_PayLater__deleteFinancingPlansForAllAccountsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteFinancingPlansForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__PKAccountService_PayLater__deleteFinancingPlansForAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __82__PKAccountService_PayLater__deleteFinancingPlansForAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D8A18;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 deleteFinancingPlansForAccountIdentifier:v9 completion:v13];
}

uint64_t __82__PKAccountService_PayLater__deleteFinancingPlansForAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __82__PKAccountService_PayLater__deleteFinancingPlansForAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) replyQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __82__PKAccountService_PayLater__deleteFinancingPlansForAccountIdentifier_completion___block_invoke_3;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __82__PKAccountService_PayLater__deleteFinancingPlansForAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)deleteFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__PKAccountService_PayLater__deleteFinancingPlanWithIdentifier_accountIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__PKAccountService_PayLater__deleteFinancingPlanWithIdentifier_accountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D8A18;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 deleteFinancingPlanWithIdentifier:v12 accountIdentifier:v11 completion:v16];
}

uint64_t __93__PKAccountService_PayLater__deleteFinancingPlanWithIdentifier_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __93__PKAccountService_PayLater__deleteFinancingPlanWithIdentifier_accountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) replyQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __93__PKAccountService_PayLater__deleteFinancingPlanWithIdentifier_accountIdentifier_completion___block_invoke_3;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __93__PKAccountService_PayLater__deleteFinancingPlanWithIdentifier_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)payLaterCardMagnitudesForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__PKAccountService_PayLater__payLaterCardMagnitudesForAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__PKAccountService_PayLater__payLaterCardMagnitudesForAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56F0A98;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 payLaterCardMagnitudesForAccountIdentifier:v9 completion:v13];
}

uint64_t __84__PKAccountService_PayLater__payLaterCardMagnitudesForAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t __84__PKAccountService_PayLater__payLaterCardMagnitudesForAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)financingPlanForPlanIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__PKAccountService_PayLater__financingPlanForPlanIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PKAccountService_PayLater__financingPlanForPlanIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56F0AC0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 financingPlanForPlanIdentifier:v9 completion:v13];
}

uint64_t __72__PKAccountService_PayLater__financingPlanForPlanIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __72__PKAccountService_PayLater__financingPlanForPlanIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) replyQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PKAccountService_PayLater__financingPlanForPlanIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_16;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __72__PKAccountService_PayLater__financingPlanForPlanIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKAccountService;
  [(PKAccountService *)&v4 dealloc];
}

- (void)_accountsChanged:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"PKAccountServiceAccountsChangedNotification" object:self];
}

- (id)errorHandlerForMethod:(SEL)a3 completion:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PKAccountService_errorHandlerForMethod_completion___block_invoke;
  aBlock[3] = &unk_1E56DC960;
  id v12 = v6;
  SEL v13 = a3;
  aBlock[4] = self;
  id v7 = v6;
  id v8 = _Block_copy(aBlock);
  id v9 = _Block_copy(v8);

  return v9;
}

void __53__PKAccountService_errorHandlerForMethod_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "XPC Failure in -[PKAccountService %@];",
      (uint8_t *)&buf,
      0xCu);
  }
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __53__PKAccountService_errorHandlerForMethod_completion___block_invoke_22;
  v11[3] = &unk_1E56D8428;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v3;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  *(void *)&long long buf = MEMORY[0x1E4F143A8];
  *((void *)&buf + 1) = 3221225472;
  id v16 = __dispatch_async_ar_block_invoke_23;
  id v17 = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v3;
  dispatch_async(v6, &buf);
}

uint64_t __53__PKAccountService_errorHandlerForMethod_completion___block_invoke_22(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService remoteObjectProxyWithErrorHandler:a3];
}

- (id)_synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  return [(PKXPCService *)self->_remoteService synchronousRemoteObjectProxyWithErrorHandler:a3];
}

- (void)accountsWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __43__PKAccountService_accountsWithCompletion___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    uint64_t v8 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v12];
    id v9 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __43__PKAccountService_accountsWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56D90B0;
    v10[4] = self;
    id v11 = v7;
    [v9 accountsWithCompletion:v10];
  }
}

uint64_t __43__PKAccountService_accountsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __43__PKAccountService_accountsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__PKAccountService_accountsWithCompletion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __43__PKAccountService_accountsWithCompletion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)accountsForProvisioningWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __58__PKAccountService_accountsForProvisioningWithCompletion___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    id v8 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v12];
    id v9 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__PKAccountService_accountsForProvisioningWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56F5C28;
    v10[4] = self;
    id v11 = v7;
    [v9 accountsForProvisioningWithCompletion:v10];
  }
}

uint64_t __58__PKAccountService_accountsForProvisioningWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

void __58__PKAccountService_accountsForProvisioningWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __58__PKAccountService_accountsForProvisioningWithCompletion___block_invoke_3;
  v17[3] = &unk_1E56E3E20;
  id v11 = *(id *)(a1 + 40);
  id v18 = v7;
  id v19 = v8;
  uint64_t v12 = *(void *)(a1 + 32);
  id v20 = v9;
  uint64_t v21 = v12;
  id v22 = v11;
  id v13 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v24 = v13;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v10, block);
}

uint64_t __58__PKAccountService_accountsForProvisioningWithCompletion___block_invoke_3(void *a1)
{
  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

- (void)accountsWithPassLocallyProvisionedWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__PKAccountService_accountsWithPassLocallyProvisionedWithCompletion___block_invoke;
    v12[3] = &unk_1E56D8388;
    id v7 = v5;
    id v13 = v7;
    id v8 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v12];
    id v9 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PKAccountService_accountsWithPassLocallyProvisionedWithCompletion___block_invoke_2;
    v10[3] = &unk_1E56D90B0;
    v10[4] = self;
    id v11 = v7;
    [v9 accountsWithPassLocallyProvisionedWithCompletion:v10];
  }
}

uint64_t __69__PKAccountService_accountsWithPassLocallyProvisionedWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __69__PKAccountService_accountsWithPassLocallyProvisionedWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PKAccountService_accountsWithPassLocallyProvisionedWithCompletion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __69__PKAccountService_accountsWithPassLocallyProvisionedWithCompletion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)updateAccountsWithCompletion:(id)a3
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__PKAccountService_updateAccountsWithCompletion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v6 = v5;
  id v13 = v6;
  id v7 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v12];
  id v8 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__PKAccountService_updateAccountsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D90B0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 updateAccountsWithCompletion:v10];
}

uint64_t __49__PKAccountService_updateAccountsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __49__PKAccountService_updateAccountsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __49__PKAccountService_updateAccountsWithCompletion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __49__PKAccountService_updateAccountsWithCompletion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)updateMockAccountWithAccount:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__PKAccountService_updateMockAccountWithAccount_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__PKAccountService_updateMockAccountWithAccount_completion___block_invoke_2;
  v13[3] = &unk_1E56F5C50;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 updateMockAccountWithAccount:v9 completion:v13];
}

uint64_t __60__PKAccountService_updateMockAccountWithAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __60__PKAccountService_updateMockAccountWithAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__PKAccountService_updateMockAccountWithAccount_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __60__PKAccountService_updateMockAccountWithAccount_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)accountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__PKAccountService_accountWithIdentifier_completion___block_invoke;
    v15[3] = &unk_1E56D8388;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    uint64_t v11 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
    id v12 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__PKAccountService_accountWithIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1E56D8860;
    v13[4] = self;
    id v14 = v9;
    [v12 accountWithIdentifier:v10 completion:v13];
  }
}

uint64_t __53__PKAccountService_accountWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __53__PKAccountService_accountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__PKAccountService_accountWithIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __53__PKAccountService_accountWithIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)accountWithVirtualCardIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __64__PKAccountService_accountWithVirtualCardIdentifier_completion___block_invoke;
    v15[3] = &unk_1E56D8388;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    id v11 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
    id v12 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __64__PKAccountService_accountWithVirtualCardIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1E56D8860;
    v13[4] = self;
    id v14 = v9;
    [v12 accountWithVirtualCardIdentifier:v10 completion:v13];
  }
}

uint64_t __64__PKAccountService_accountWithVirtualCardIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __64__PKAccountService_accountWithVirtualCardIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PKAccountService_accountWithVirtualCardIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __64__PKAccountService_accountWithVirtualCardIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)accountForPassWithUniqueID:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __58__PKAccountService_accountForPassWithUniqueID_completion___block_invoke;
    v15[3] = &unk_1E56D8388;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    id v11 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
    id v12 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__PKAccountService_accountForPassWithUniqueID_completion___block_invoke_2;
    v13[3] = &unk_1E56F5C50;
    v13[4] = self;
    id v14 = v9;
    [v12 accountForPassWithUniqueID:v10 completion:v13];
  }
}

uint64_t __58__PKAccountService_accountForPassWithUniqueID_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __58__PKAccountService_accountForPassWithUniqueID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PKAccountService_accountForPassWithUniqueID_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __58__PKAccountService_accountForPassWithUniqueID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updateAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__PKAccountService_updateAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__PKAccountService_updateAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D8860;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 updateAccountWithIdentifier:v9 extended:0 completion:v13];
}

uint64_t __59__PKAccountService_updateAccountWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __59__PKAccountService_updateAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__PKAccountService_updateAccountWithIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __59__PKAccountService_updateAccountWithIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)updateAccountWithIdentifier:(id)a3 extended:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __68__PKAccountService_updateAccountWithIdentifier_extended_completion___block_invoke;
  v17[3] = &unk_1E56D8388;
  id v10 = v9;
  id v18 = v10;
  id v11 = a3;
  id v12 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v17];
  id v13 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__PKAccountService_updateAccountWithIdentifier_extended_completion___block_invoke_2;
  v15[3] = &unk_1E56D8860;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 updateAccountWithIdentifier:v11 extended:v5 completion:v15];
}

uint64_t __68__PKAccountService_updateAccountWithIdentifier_extended_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __68__PKAccountService_updateAccountWithIdentifier_extended_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__PKAccountService_updateAccountWithIdentifier_extended_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __68__PKAccountService_updateAccountWithIdentifier_extended_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)updateAccountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__PKAccountService_updateAccountUsersForAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PKAccountService_updateAccountUsersForAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56E9380;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 updateAccountUsersForAccountWithIdentifier:v9 completion:v13];
}

uint64_t __74__PKAccountService_updateAccountUsersForAccountWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __74__PKAccountService_updateAccountUsersForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PKAccountService_updateAccountUsersForAccountWithIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __74__PKAccountService_updateAccountUsersForAccountWithIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)accountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__PKAccountService_accountUsersForAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PKAccountService_accountUsersForAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D8748;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 accountUsersForAccountWithIdentifier:v9 completion:v13];
}

uint64_t __68__PKAccountService_accountUsersForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __68__PKAccountService_accountUsersForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__PKAccountService_accountUsersForAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __68__PKAccountService_accountUsersForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)deleteAccountUserWithAltDSID:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__PKAccountService_deleteAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__PKAccountService_deleteAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D9528;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 deleteAccountUserWithAltDSID:v12 forAccountWithIdentifier:v11 completion:v16];
}

uint64_t __85__PKAccountService_deleteAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __85__PKAccountService_deleteAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__PKAccountService_deleteAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __85__PKAccountService_deleteAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)deleteBeneficiaryWithIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__PKAccountService_deleteBeneficiaryWithIdentifier_accountIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__PKAccountService_deleteBeneficiaryWithIdentifier_accountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D9528;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 deleteBeneficiaryWithIdentifier:v12 accountIdentifier:v11 completion:v16];
}

uint64_t __81__PKAccountService_deleteBeneficiaryWithIdentifier_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __81__PKAccountService_deleteBeneficiaryWithIdentifier_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__PKAccountService_deleteBeneficiaryWithIdentifier_accountIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __81__PKAccountService_deleteBeneficiaryWithIdentifier_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updateAccountUserPreferences:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6
{
  id v11 = a6;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __111__PKAccountService_updateAccountUserPreferences_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke;
  v21[3] = &unk_1E56D8388;
  id v12 = v11;
  id v22 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v21];
  id v17 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v16];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __111__PKAccountService_updateAccountUserPreferences_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_2;
  v19[3] = &unk_1E56F5C78;
  v19[4] = self;
  id v20 = v12;
  id v18 = v12;
  [v17 updateAccountUserPreferences:v15 forAccountUserWithAltDSID:v14 forAccountWithIdentifier:v13 completion:v19];
}

uint64_t __111__PKAccountService_updateAccountUserPreferences_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __111__PKAccountService_updateAccountUserPreferences_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __111__PKAccountService_updateAccountUserPreferences_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __111__PKAccountService_updateAccountUserPreferences_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)updateAccountUserNotificationSettings:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6
{
  id v11 = a6;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __120__PKAccountService_updateAccountUserNotificationSettings_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke;
  v21[3] = &unk_1E56D8388;
  id v12 = v11;
  id v22 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v21];
  id v17 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v16];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __120__PKAccountService_updateAccountUserNotificationSettings_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_2;
  v19[3] = &unk_1E56F5C78;
  v19[4] = self;
  id v20 = v12;
  id v18 = v12;
  [v17 updateAccountUserNotificationSettings:v15 forAccountUserWithAltDSID:v14 forAccountWithIdentifier:v13 completion:v19];
}

uint64_t __120__PKAccountService_updateAccountUserNotificationSettings_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __120__PKAccountService_updateAccountUserNotificationSettings_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __120__PKAccountService_updateAccountUserNotificationSettings_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __120__PKAccountService_updateAccountUserNotificationSettings_forAccountUserWithAltDSID_forAccountWithIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)deleteAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __59__PKAccountService_deleteAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__PKAccountService_deleteAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D9528;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 deleteAccountWithIdentifier:v9 completion:v13];
}

uint64_t __59__PKAccountService_deleteAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __59__PKAccountService_deleteAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PKAccountService_deleteAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __59__PKAccountService_deleteAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)deleteLocalAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__PKAccountService_deleteLocalAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PKAccountService_deleteLocalAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D9528;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 deleteLocalAccountWithIdentifier:v9 completion:v13];
}

uint64_t __64__PKAccountService_deleteLocalAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __64__PKAccountService_deleteLocalAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __64__PKAccountService_deleteLocalAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __64__PKAccountService_deleteLocalAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)insertOrUpdateLocalAccount:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__PKAccountService_insertOrUpdateLocalAccount_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__PKAccountService_insertOrUpdateLocalAccount_completion___block_invoke_2;
  v13[3] = &unk_1E56F5C50;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 insertOrUpdateLocalAccount:v9 completion:v13];
}

uint64_t __58__PKAccountService_insertOrUpdateLocalAccount_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __58__PKAccountService_insertOrUpdateLocalAccount_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PKAccountService_insertOrUpdateLocalAccount_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __58__PKAccountService_insertOrUpdateLocalAccount_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)insertOrUpdateLocalFinancingPlans:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__PKAccountService_insertOrUpdateLocalFinancingPlans_accountIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__PKAccountService_insertOrUpdateLocalFinancingPlans_accountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D8810;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 insertOrUpdateLocalFinancingPlans:v12 accountIdentifier:v11 completion:v16];
}

uint64_t __83__PKAccountService_insertOrUpdateLocalFinancingPlans_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __83__PKAccountService_insertOrUpdateLocalFinancingPlans_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__PKAccountService_insertOrUpdateLocalFinancingPlans_accountIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __83__PKAccountService_insertOrUpdateLocalFinancingPlans_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)setNeedsSyncToFinanceForAllTransactionsWithCompletion:(id)a3
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PKAccountService_setNeedsSyncToFinanceForAllTransactionsWithCompletion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v6 = v5;
  id v13 = v6;
  id v7 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v12];
  id v8 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__PKAccountService_setNeedsSyncToFinanceForAllTransactionsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D86A8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 setNeedsSyncToFinanceForAllTransactionsWithCompletion:v10];
}

uint64_t __74__PKAccountService_setNeedsSyncToFinanceForAllTransactionsWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __74__PKAccountService_setNeedsSyncToFinanceForAllTransactionsWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __74__PKAccountService_setNeedsSyncToFinanceForAllTransactionsWithCompletion___block_invoke_3;
  v5[3] = &unk_1E56D8680;
  id v6 = *(id *)(a1 + 40);
  char v7 = a2;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v9 = v4;
  dispatch_async(v3, block);
}

uint64_t __74__PKAccountService_setNeedsSyncToFinanceForAllTransactionsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 40));
  }
  return result;
}

- (void)scheduleSetupReminderForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:&__block_literal_global_223];
  id v10 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __77__PKAccountService_scheduleSetupReminderForAccountWithIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E56D8A18;
  void v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 scheduleSetupReminderForAccountWithIdentifier:v8 completion:v12];
}

void __77__PKAccountService_scheduleSetupReminderForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__PKAccountService_scheduleSetupReminderForAccountWithIdentifier_completion___block_invoke_3;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __77__PKAccountService_scheduleSetupReminderForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)insertSummaryNotificationForAccountIdentifier:(id)a3 summaryType:(int64_t)a4 completion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__PKAccountService_insertSummaryNotificationForAccountIdentifier_summaryType_completion___block_invoke;
  v17[3] = &unk_1E56D8388;
  id v10 = v9;
  id v18 = v10;
  id v11 = a3;
  id v12 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v17];
  id v13 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__PKAccountService_insertSummaryNotificationForAccountIdentifier_summaryType_completion___block_invoke_2;
  v15[3] = &unk_1E56D9528;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 insertSummaryNotificationForAccountIdentifier:v11 summaryType:a4 completion:v15];
}

uint64_t __89__PKAccountService_insertSummaryNotificationForAccountIdentifier_summaryType_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __89__PKAccountService_insertSummaryNotificationForAccountIdentifier_summaryType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__PKAccountService_insertSummaryNotificationForAccountIdentifier_summaryType_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __89__PKAccountService_insertSummaryNotificationForAccountIdentifier_summaryType_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)insertDailyCashNotificationForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__PKAccountService_insertDailyCashNotificationForAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PKAccountService_insertDailyCashNotificationForAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D9528;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 insertDailyCashNotificationForAccountIdentifier:v9 completion:v13];
}

uint64_t __79__PKAccountService_insertDailyCashNotificationForAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79__PKAccountService_insertDailyCashNotificationForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__PKAccountService_insertDailyCashNotificationForAccountIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __79__PKAccountService_insertDailyCashNotificationForAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)paymentFundingSourcesForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__PKAccountService_paymentFundingSourcesForAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PKAccountService_paymentFundingSourcesForAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D8810;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 paymentFundingSourcesForAccountIdentifier:v9 completion:v13];
}

uint64_t __73__PKAccountService_paymentFundingSourcesForAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __73__PKAccountService_paymentFundingSourcesForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PKAccountService_paymentFundingSourcesForAccountIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __73__PKAccountService_paymentFundingSourcesForAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)paymentFundingSourceForIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__PKAccountService_paymentFundingSourceForIdentifier_accountIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __83__PKAccountService_paymentFundingSourceForIdentifier_accountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56F5CA0;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 paymentFundingSourceForIdentifier:v12 accountIdentifier:v11 completion:v16];
}

uint64_t __83__PKAccountService_paymentFundingSourceForIdentifier_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __83__PKAccountService_paymentFundingSourceForIdentifier_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__PKAccountService_paymentFundingSourceForIdentifier_accountIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __83__PKAccountService_paymentFundingSourceForIdentifier_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updatePaymentFundingSourcesForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __85__PKAccountService_updatePaymentFundingSourcesForAccountIdentifier_force_completion___block_invoke;
  v17[3] = &unk_1E56D8388;
  id v10 = v9;
  id v18 = v10;
  id v11 = a3;
  id v12 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v17];
  id v13 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__PKAccountService_updatePaymentFundingSourcesForAccountIdentifier_force_completion___block_invoke_2;
  v15[3] = &unk_1E56D90B0;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 updatePaymentFundingSourcesForAccountIdentifier:v11 force:v5 completion:v15];
}

uint64_t __85__PKAccountService_updatePaymentFundingSourcesForAccountIdentifier_force_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __85__PKAccountService_updatePaymentFundingSourcesForAccountIdentifier_force_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__PKAccountService_updatePaymentFundingSourcesForAccountIdentifier_force_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __85__PKAccountService_updatePaymentFundingSourcesForAccountIdentifier_force_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)defaultAccountForFeature:(unint64_t)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __56__PKAccountService_defaultAccountForFeature_completion___block_invoke;
    v14[3] = &unk_1E56D8388;
    id v9 = v7;
    id v15 = v9;
    id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v14];
    id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__PKAccountService_defaultAccountForFeature_completion___block_invoke_2;
    v12[3] = &unk_1E56F5CC8;
    void v12[4] = self;
    id v13 = v9;
    [v11 defaultAccountForFeature:a3 completion:v12];
  }
}

uint64_t __56__PKAccountService_defaultAccountForFeature_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __56__PKAccountService_defaultAccountForFeature_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)termsWithIdentifier:(id)a3 accepted:(BOOL)a4 withAccountIdentifier:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v11 = a6;
  id v12 = v11;
  if (v11)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __82__PKAccountService_termsWithIdentifier_accepted_withAccountIdentifier_completion___block_invoke;
    v20[3] = &unk_1E56D8388;
    id v13 = v11;
    id v21 = v13;
    id v14 = a5;
    id v15 = a3;
    id v16 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v20];
    id v17 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v16];

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __82__PKAccountService_termsWithIdentifier_accepted_withAccountIdentifier_completion___block_invoke_2;
    v18[3] = &unk_1E56D8388;
    id v19 = v13;
    [v17 termsWithIdentifier:v15 accepted:v7 withAccountIdentifier:v14 completion:v18];
  }
}

uint64_t __82__PKAccountService_termsWithIdentifier_accepted_withAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __82__PKAccountService_termsWithIdentifier_accepted_withAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performAccountAction:(id)a3 withAccountIdentifier:(id)a4 accountUserAltDSID:(id)a5 completion:(id)a6
{
  id v11 = a6;
  id v12 = v11;
  if (v11)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    void v21[2] = __93__PKAccountService_performAccountAction_withAccountIdentifier_accountUserAltDSID_completion___block_invoke;
    v21[3] = &unk_1E56D8388;
    id v13 = v11;
    id v22 = v13;
    id v14 = a5;
    id v15 = a4;
    id v16 = a3;
    id v17 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v21];
    id v18 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v17];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __93__PKAccountService_performAccountAction_withAccountIdentifier_accountUserAltDSID_completion___block_invoke_2;
    v19[3] = &unk_1E56D8860;
    v19[4] = self;
    id v20 = v13;
    [v18 performAccountAction:v16 withAccountIdentifier:v15 accountUserAltDSID:v14 completion:v19];
  }
}

uint64_t __93__PKAccountService_performAccountAction_withAccountIdentifier_accountUserAltDSID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __93__PKAccountService_performAccountAction_withAccountIdentifier_accountUserAltDSID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__PKAccountService_performAccountAction_withAccountIdentifier_accountUserAltDSID_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __93__PKAccountService_performAccountAction_withAccountIdentifier_accountUserAltDSID_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)userInfoForAccountIdentifier:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__PKAccountService_userInfoForAccountIdentifier_forceFetch_completion___block_invoke;
    v17[3] = &unk_1E56D8388;
    id v11 = v9;
    id v18 = v11;
    id v12 = a3;
    id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v17];
    id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __71__PKAccountService_userInfoForAccountIdentifier_forceFetch_completion___block_invoke_2;
    v15[3] = &unk_1E56F5CF0;
    void v15[4] = self;
    id v16 = v11;
    [v14 userInfoForAccountIdentifier:v12 forceFetch:v5 completion:v15];
  }
}

uint64_t __71__PKAccountService_userInfoForAccountIdentifier_forceFetch_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __71__PKAccountService_userInfoForAccountIdentifier_forceFetch_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PKAccountService_userInfoForAccountIdentifier_forceFetch_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __71__PKAccountService_userInfoForAccountIdentifier_forceFetch_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)updateUserInfoForAccountIdentifier:(id)a3 contact:(id)a4 completion:(id)a5
{
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__PKAccountService_updateUserInfoForAccountIdentifier_contact_completion___block_invoke;
    v18[3] = &unk_1E56D8388;
    id v11 = v9;
    id v19 = v11;
    id v12 = a4;
    id v13 = a3;
    id v14 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
    uint64_t v15 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v14];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __74__PKAccountService_updateUserInfoForAccountIdentifier_contact_completion___block_invoke_2;
    v16[3] = &unk_1E56F5D18;
    v16[4] = self;
    id v17 = v11;
    [v15 updateUserInfoForAccountIdentifier:v13 contact:v12 completion:v16];
  }
}

uint64_t __74__PKAccountService_updateUserInfoForAccountIdentifier_contact_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __74__PKAccountService_updateUserInfoForAccountIdentifier_contact_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PKAccountService_updateUserInfoForAccountIdentifier_contact_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __74__PKAccountService_updateUserInfoForAccountIdentifier_contact_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)lastUsedInAppFundingSourceForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __78__PKAccountService_lastUsedInAppFundingSourceForAccountIdentifier_completion___block_invoke;
    v15[3] = &unk_1E56D8388;
    id v9 = v7;
    id v16 = v9;
    id v10 = a3;
    id v11 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
    id v12 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v11];

    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __78__PKAccountService_lastUsedInAppFundingSourceForAccountIdentifier_completion___block_invoke_2;
    v13[3] = &unk_1E56F5D40;
    v13[4] = self;
    id v14 = v9;
    [v12 lastUsedInAppFundingSourceForAccountIdentifier:v10 completion:v13];
  }
}

uint64_t __78__PKAccountService_lastUsedInAppFundingSourceForAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __78__PKAccountService_lastUsedInAppFundingSourceForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__PKAccountService_lastUsedInAppFundingSourceForAccountIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __78__PKAccountService_lastUsedInAppFundingSourceForAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updateLastUsedInAppFundingSource:(id)a3 accountIdentifier:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:0];
    [v8 updateLastUsedInAppFundingSource:v7 accountIdentifier:v6];
  }
}

- (void)eventsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__PKAccountService_eventsForAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__PKAccountService_eventsForAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56E9380;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 eventsForAccountIdentifier:v9 completion:v13];
}

uint64_t __58__PKAccountService_eventsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __58__PKAccountService_eventsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__PKAccountService_eventsForAccountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __58__PKAccountService_eventsForAccountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)eventsForAccountIdentifier:(id)a3 types:(id)a4 startDate:(id)a5 endDate:(id)a6 orderedByDate:(int64_t)a7 limit:(unint64_t)a8 completion:(id)a9
{
  id v17 = a9;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __102__PKAccountService_eventsForAccountIdentifier_types_startDate_endDate_orderedByDate_limit_completion___block_invoke;
  v28[3] = &unk_1E56D8388;
  id v18 = v17;
  id v29 = v18;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  id v23 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v28];
  id v24 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v23];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __102__PKAccountService_eventsForAccountIdentifier_types_startDate_endDate_orderedByDate_limit_completion___block_invoke_2;
  v26[3] = &unk_1E56D90B0;
  v26[4] = self;
  id v27 = v18;
  id v25 = v18;
  [v24 eventsForAccountIdentifier:v22 types:v21 startDate:v20 endDate:v19 orderedByDate:a7 limit:a8 completion:v26];
}

uint64_t __102__PKAccountService_eventsForAccountIdentifier_types_startDate_endDate_orderedByDate_limit_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __102__PKAccountService_eventsForAccountIdentifier_types_startDate_endDate_orderedByDate_limit_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__PKAccountService_eventsForAccountIdentifier_types_startDate_endDate_orderedByDate_limit_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __102__PKAccountService_eventsForAccountIdentifier_types_startDate_endDate_orderedByDate_limit_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)deleteEventsWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__PKAccountService_deleteEventsWithAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PKAccountService_deleteEventsWithAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D9528;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 deleteEventsWithAccountIdentifier:v9 completion:v13];
}

uint64_t __65__PKAccountService_deleteEventsWithAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __65__PKAccountService_deleteEventsWithAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PKAccountService_deleteEventsWithAccountIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __65__PKAccountService_deleteEventsWithAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)deleteEventWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__PKAccountService_deleteEventWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__PKAccountService_deleteEventWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D9528;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 deleteEventWithIdentifier:v9 completion:v13];
}

uint64_t __57__PKAccountService_deleteEventWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __57__PKAccountService_deleteEventWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PKAccountService_deleteEventWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __57__PKAccountService_deleteEventWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)deleteEventsWithAccountIdentifier:(id)a3 excludingTypes:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__PKAccountService_deleteEventsWithAccountIdentifier_excludingTypes_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__PKAccountService_deleteEventsWithAccountIdentifier_excludingTypes_completion___block_invoke_2;
  v16[3] = &unk_1E56D9528;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 deleteEventsWithAccountIdentifier:v12 excludingTypes:v11 completion:v16];
}

uint64_t __80__PKAccountService_deleteEventsWithAccountIdentifier_excludingTypes_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __80__PKAccountService_deleteEventsWithAccountIdentifier_excludingTypes_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PKAccountService_deleteEventsWithAccountIdentifier_excludingTypes_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __80__PKAccountService_deleteEventsWithAccountIdentifier_excludingTypes_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)insertEvents:(id)a3 withAccountidentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__PKAccountService_insertEvents_withAccountidentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__PKAccountService_insertEvents_withAccountidentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D9528;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 insertEvents:v12 withAccountidentifier:v11 completion:v16];
}

uint64_t __66__PKAccountService_insertEvents_withAccountidentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __66__PKAccountService_insertEvents_withAccountidentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PKAccountService_insertEvents_withAccountidentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __66__PKAccountService_insertEvents_withAccountidentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updateCreditStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__PKAccountService_updateCreditStatementsForAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __74__PKAccountService_updateCreditStatementsForAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56E9380;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 updateCreditStatementsForAccountIdentifier:v9 completion:v13];
}

uint64_t __74__PKAccountService_updateCreditStatementsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __74__PKAccountService_updateCreditStatementsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __74__PKAccountService_updateCreditStatementsForAccountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __74__PKAccountService_updateCreditStatementsForAccountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)creditStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__PKAccountService_creditStatementsForAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __68__PKAccountService_creditStatementsForAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56E9380;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 creditStatementsForAccountIdentifier:v9 completion:v13];
}

uint64_t __68__PKAccountService_creditStatementsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __68__PKAccountService_creditStatementsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __68__PKAccountService_creditStatementsForAccountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __68__PKAccountService_creditStatementsForAccountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)creditStatementsForStatementIdentifiers:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__PKAccountService_creditStatementsForStatementIdentifiers_accountIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__PKAccountService_creditStatementsForStatementIdentifiers_accountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56E9380;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 creditStatementsForStatementIdentifiers:v12 accountIdentifier:v11 completion:v16];
}

uint64_t __89__PKAccountService_creditStatementsForStatementIdentifiers_accountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __89__PKAccountService_creditStatementsForStatementIdentifiers_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __89__PKAccountService_creditStatementsForStatementIdentifiers_accountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __89__PKAccountService_creditStatementsForStatementIdentifiers_accountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)updateSavingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PKAccountService_updateSavingsStatementsForAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PKAccountService_updateSavingsStatementsForAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D90B0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 updateSavingsStatementsForAccountIdentifier:v9 completion:v13];
}

uint64_t __75__PKAccountService_updateSavingsStatementsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __75__PKAccountService_updateSavingsStatementsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PKAccountService_updateSavingsStatementsForAccountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __75__PKAccountService_updateSavingsStatementsForAccountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)savingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__PKAccountService_savingsStatementsForAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__PKAccountService_savingsStatementsForAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D90B0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 savingsStatementsForAccountIdentifier:v9 completion:v13];
}

uint64_t __69__PKAccountService_savingsStatementsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __69__PKAccountService_savingsStatementsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PKAccountService_savingsStatementsForAccountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __69__PKAccountService_savingsStatementsForAccountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)accountStatementMetadataForAllAccountsWithCompletion:(id)a3
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PKAccountService_accountStatementMetadataForAllAccountsWithCompletion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v6 = v5;
  id v13 = v6;
  id v7 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v12];
  id v8 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __73__PKAccountService_accountStatementMetadataForAllAccountsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8450;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 accountStatementMetadataForAllAccountsWithCompletion:v10];
}

uint64_t __73__PKAccountService_accountStatementMetadataForAllAccountsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __73__PKAccountService_accountStatementMetadataForAllAccountsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__PKAccountService_accountStatementMetadataForAllAccountsWithCompletion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __73__PKAccountService_accountStatementMetadataForAllAccountsWithCompletion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)accountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__PKAccountService_accountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __96__PKAccountService_accountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56F5D68;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 accountStatementMetadataForStatementIdentifier:v12 accountIdentifier:v11 completion:v16];
}

uint64_t __96__PKAccountService_accountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __96__PKAccountService_accountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__PKAccountService_accountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __96__PKAccountService_accountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)updateAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102__PKAccountService_updateAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __102__PKAccountService_updateAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56F5D68;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 updateAccountStatementMetadataForStatementIdentifier:v12 accountIdentifier:v11 completion:v16];
}

uint64_t __102__PKAccountService_updateAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __102__PKAccountService_updateAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __102__PKAccountService_updateAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __102__PKAccountService_updateAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)deleteAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102__PKAccountService_deleteAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __102__PKAccountService_deleteAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D9528;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 deleteAccountStatementMetadataForStatementIdentifier:v12 accountIdentifier:v11 completion:v16];
}

uint64_t __102__PKAccountService_deleteAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __102__PKAccountService_deleteAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __102__PKAccountService_deleteAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __102__PKAccountService_deleteAccountStatementMetadataForStatementIdentifier_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)triggerStatementMetadataProcessingForAccountIdentifier:(id)a3 statementIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __106__PKAccountService_triggerStatementMetadataProcessingForAccountIdentifier_statementIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __106__PKAccountService_triggerStatementMetadataProcessingForAccountIdentifier_statementIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56F5D68;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 triggerStatementMetadataProcessingForAccountIdentifier:v12 statementIdentifier:v11 completion:v16];
}

uint64_t __106__PKAccountService_triggerStatementMetadataProcessingForAccountIdentifier_statementIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __106__PKAccountService_triggerStatementMetadataProcessingForAccountIdentifier_statementIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __106__PKAccountService_triggerStatementMetadataProcessingForAccountIdentifier_statementIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __106__PKAccountService_triggerStatementMetadataProcessingForAccountIdentifier_statementIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)updateTaxFormsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__PKAccountService_updateTaxFormsForAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__PKAccountService_updateTaxFormsForAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D90B0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 updateTaxFormsForAccountIdentifier:v9 completion:v13];
}

uint64_t __66__PKAccountService_updateTaxFormsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __66__PKAccountService_updateTaxFormsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PKAccountService_updateTaxFormsForAccountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __66__PKAccountService_updateTaxFormsForAccountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)taxFormsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __60__PKAccountService_taxFormsForAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__PKAccountService_taxFormsForAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D90B0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 taxFormsForAccountIdentifier:v9 completion:v13];
}

uint64_t __60__PKAccountService_taxFormsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __60__PKAccountService_taxFormsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__PKAccountService_taxFormsForAccountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __60__PKAccountService_taxFormsForAccountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)lastRedemptionEventToDestination:(unint64_t)a3 forAccountIdentifier:(id)a4 altDSID:(id)a5 completion:(id)a6
{
  id v11 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __93__PKAccountService_lastRedemptionEventToDestination_forAccountIdentifier_altDSID_completion___block_invoke;
  v20[3] = &unk_1E56D8388;
  id v12 = v11;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  uint64_t v15 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v20];
  id v16 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v15];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __93__PKAccountService_lastRedemptionEventToDestination_forAccountIdentifier_altDSID_completion___block_invoke_2;
  v18[3] = &unk_1E56F5D90;
  void v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 lastRedemptionEventToDestination:a3 forAccountIdentifier:v14 altDSID:v13 completion:v18];
}

uint64_t __93__PKAccountService_lastRedemptionEventToDestination_forAccountIdentifier_altDSID_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __93__PKAccountService_lastRedemptionEventToDestination_forAccountIdentifier_altDSID_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__PKAccountService_lastRedemptionEventToDestination_forAccountIdentifier_altDSID_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __93__PKAccountService_lastRedemptionEventToDestination_forAccountIdentifier_altDSID_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)createVirtualCard:(int64_t)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__PKAccountService_createVirtualCard_forAccountIdentifier_completion___block_invoke;
  v17[3] = &unk_1E56D8388;
  id v10 = v9;
  id v18 = v10;
  id v11 = a4;
  id v12 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v17];
  id v13 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __70__PKAccountService_createVirtualCard_forAccountIdentifier_completion___block_invoke_2;
  v15[3] = &unk_1E56F5DB8;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 createVirtualCard:a3 forAccountIdentifier:v11 completion:v15];
}

uint64_t __70__PKAccountService_createVirtualCard_forAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

void __70__PKAccountService_createVirtualCard_forAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __70__PKAccountService_createVirtualCard_forAccountIdentifier_completion___block_invoke_3;
  v17[3] = &unk_1E56E3E20;
  id v11 = *(id *)(a1 + 40);
  id v18 = v7;
  id v19 = v8;
  uint64_t v12 = *(void *)(a1 + 32);
  id v20 = v9;
  uint64_t v21 = v12;
  id v22 = v11;
  id v13 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v24 = v13;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v10, block);
}

uint64_t __70__PKAccountService_createVirtualCard_forAccountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

- (void)performVirtualCardAction:(int64_t)a3 forVirtualCardIdentifier:(id)a4 forAccountIdentifier:(id)a5 completion:(id)a6
{
  id v11 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __102__PKAccountService_performVirtualCardAction_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke;
  v20[3] = &unk_1E56D8388;
  id v12 = v11;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v20];
  id v16 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v15];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __102__PKAccountService_performVirtualCardAction_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_2;
  v18[3] = &unk_1E56F5DB8;
  void v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 performVirtualCardAction:a3 forVirtualCardIdentifier:v14 forAccountIdentifier:v13 completion:v18];
}

uint64_t __102__PKAccountService_performVirtualCardAction_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

void __102__PKAccountService_performVirtualCardAction_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __102__PKAccountService_performVirtualCardAction_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_3;
  v17[3] = &unk_1E56E3E20;
  id v11 = *(id *)(a1 + 40);
  id v18 = v7;
  id v19 = v8;
  uint64_t v12 = *(void *)(a1 + 32);
  id v20 = v9;
  uint64_t v21 = v12;
  id v22 = v11;
  id v13 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v24 = v13;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v10, block);
}

uint64_t __102__PKAccountService_performVirtualCardAction_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

- (void)updateVirtualCardsWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__PKAccountService_updateVirtualCardsWithAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __71__PKAccountService_updateVirtualCardsWithAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56F5DE0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 updateVirtualCardsWithAccountIdentifier:v9 completion:v13];
}

uint64_t __71__PKAccountService_updateVirtualCardsWithAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

void __71__PKAccountService_updateVirtualCardsWithAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__PKAccountService_updateVirtualCardsWithAccountIdentifier_completion___block_invoke_3;
  v17[3] = &unk_1E56E3E20;
  id v11 = *(id *)(a1 + 40);
  id v18 = v7;
  id v19 = v8;
  uint64_t v12 = *(void *)(a1 + 32);
  id v20 = v9;
  uint64_t v21 = v12;
  id v22 = v11;
  id v13 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v24 = v13;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v10, block);
}

uint64_t __71__PKAccountService_updateVirtualCardsWithAccountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

- (void)cardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 action:(int64_t)a5 completion:(id)a6
{
  id v11 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __82__PKAccountService_cardCredentialsForVirtualCard_authorization_action_completion___block_invoke;
  v20[3] = &unk_1E56D8388;
  id v12 = v11;
  id v21 = v12;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v20];
  id v16 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v15];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __82__PKAccountService_cardCredentialsForVirtualCard_authorization_action_completion___block_invoke_2;
  v18[3] = &unk_1E56F5E08;
  void v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 cardCredentialsForVirtualCard:v14 authorization:v13 action:a5 completion:v18];
}

uint64_t __82__PKAccountService_cardCredentialsForVirtualCard_authorization_action_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __82__PKAccountService_cardCredentialsForVirtualCard_authorization_action_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__PKAccountService_cardCredentialsForVirtualCard_authorization_action_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __82__PKAccountService_cardCredentialsForVirtualCard_authorization_action_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)noteVirtualCardAutoFilledBySafari:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__PKAccountService_noteVirtualCardAutoFilledBySafari_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PKAccountService_noteVirtualCardAutoFilledBySafari_completion___block_invoke_2;
  v13[3] = &unk_1E56D9528;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 noteVirtualCardAutoFilledBySafari:v9 completion:v13];
}

uint64_t __65__PKAccountService_noteVirtualCardAutoFilledBySafari_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __65__PKAccountService_noteVirtualCardAutoFilledBySafari_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PKAccountService_noteVirtualCardAutoFilledBySafari_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __65__PKAccountService_noteVirtualCardAutoFilledBySafari_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)fetchKeychainCredentialForVirtualCardIdentifier:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __100__PKAccountService_fetchKeychainCredentialForVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __100__PKAccountService_fetchKeychainCredentialForVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D9528;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 fetchKeychainCredentialForVirtualCardIdentifier:v12 forAccountIdentifier:v11 completion:v16];
}

uint64_t __100__PKAccountService_fetchKeychainCredentialForVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __100__PKAccountService_fetchKeychainCredentialForVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __100__PKAccountService_fetchKeychainCredentialForVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __100__PKAccountService_fetchKeychainCredentialForVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)writeVirtualCardToKeychain:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__PKAccountService_writeVirtualCardToKeychain_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__PKAccountService_writeVirtualCardToKeychain_completion___block_invoke_2;
  v13[3] = &unk_1E56D8A18;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 writeVirtualCardToKeychain:v9 completion:v13];
}

uint64_t __58__PKAccountService_writeVirtualCardToKeychain_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __58__PKAccountService_writeVirtualCardToKeychain_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PKAccountService_writeVirtualCardToKeychain_completion___block_invoke_3;
  v5[3] = &unk_1E56D83D8;
  id v3 = *(id *)(a1 + 40);
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v8 = v4;
  dispatch_async(v2, block);
}

uint64_t __58__PKAccountService_writeVirtualCardToKeychain_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)virtualCardsInKeychainWithCompletion:(id)a3
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__PKAccountService_virtualCardsInKeychainWithCompletion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v6 = v5;
  id v13 = v6;
  id v7 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v12];
  id v8 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PKAccountService_virtualCardsInKeychainWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D8748;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 virtualCardsInKeychainWithCompletion:v10];
}

uint64_t __57__PKAccountService_virtualCardsInKeychainWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __57__PKAccountService_virtualCardsInKeychainWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__PKAccountService_virtualCardsInKeychainWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __57__PKAccountService_virtualCardsInKeychainWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)noteSecurityCodeActivityWithAction:(int64_t)a3 forSecurityCodeIdentifier:(id)a4 forVirtualCardIdentifier:(id)a5 forAccountIdentifier:(id)a6 completion:(id)a7
{
  id v13 = a7;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __138__PKAccountService_noteSecurityCodeActivityWithAction_forSecurityCodeIdentifier_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke;
  v23[3] = &unk_1E56D8388;
  id v14 = v13;
  id v24 = v14;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v23];
  id v19 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v18];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __138__PKAccountService_noteSecurityCodeActivityWithAction_forSecurityCodeIdentifier_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_2;
  v21[3] = &unk_1E56F5E30;
  void v21[4] = self;
  id v22 = v14;
  id v20 = v14;
  [v19 noteSecurityCodeActivityWithAction:a3 forSecurityCodeIdentifier:v17 forVirtualCardIdentifier:v16 forAccountIdentifier:v15 completion:v21];
}

uint64_t __138__PKAccountService_noteSecurityCodeActivityWithAction_forSecurityCodeIdentifier_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __138__PKAccountService_noteSecurityCodeActivityWithAction_forSecurityCodeIdentifier_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __138__PKAccountService_noteSecurityCodeActivityWithAction_forSecurityCodeIdentifier_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __138__PKAccountService_noteSecurityCodeActivityWithAction_forSecurityCodeIdentifier_forVirtualCardIdentifier_forAccountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)physicalCardsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__PKAccountService_physicalCardsForAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__PKAccountService_physicalCardsForAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D8748;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 physicalCardsForAccountWithIdentifier:v9 completion:v13];
}

uint64_t __69__PKAccountService_physicalCardsForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __69__PKAccountService_physicalCardsForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKAccountService_physicalCardsForAccountWithIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  dispatch_async(v4, block);
}

uint64_t __69__PKAccountService_physicalCardsForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updatePhysicalCardsForAccountWithIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __81__PKAccountService_updatePhysicalCardsForAccountWithIdentifier_force_completion___block_invoke;
  v17[3] = &unk_1E56D8388;
  id v10 = v9;
  id v18 = v10;
  id v11 = a3;
  id v12 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v17];
  id v13 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__PKAccountService_updatePhysicalCardsForAccountWithIdentifier_force_completion___block_invoke_2;
  v15[3] = &unk_1E56E9380;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 updatePhysicalCardsForAccountWithIdentifier:v11 force:v5 completion:v15];
}

uint64_t __81__PKAccountService_updatePhysicalCardsForAccountWithIdentifier_force_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __81__PKAccountService_updatePhysicalCardsForAccountWithIdentifier_force_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__PKAccountService_updatePhysicalCardsForAccountWithIdentifier_force_completion___block_invoke_3;
  v11[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v8;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, v11);
}

uint64_t __81__PKAccountService_updatePhysicalCardsForAccountWithIdentifier_force_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)beginPhysicalCardRequestWithOrder:(id)a3 forAccountWithIdentifier:(id)a4 accountUserAltDSID:(id)a5 deviceMetadata:(id)a6 completion:(id)a7
{
  id v13 = a7;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __124__PKAccountService_beginPhysicalCardRequestWithOrder_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke;
  v24[3] = &unk_1E56D8388;
  id v14 = v13;
  id v25 = v14;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v24];
  id v20 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v19];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __124__PKAccountService_beginPhysicalCardRequestWithOrder_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_2;
  v22[3] = &unk_1E56F5E58;
  v22[4] = self;
  id v23 = v14;
  id v21 = v14;
  [v20 beginPhysicalCardRequestWithOrder:v18 forAccountWithIdentifier:v17 accountUserAltDSID:v16 deviceMetadata:v15 completion:v22];
}

uint64_t __124__PKAccountService_beginPhysicalCardRequestWithOrder_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void, uint64_t))(result + 16))(result, 0, 0, 0, 0, a2);
  }
  return result;
}

void __124__PKAccountService_beginPhysicalCardRequestWithOrder_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __124__PKAccountService_beginPhysicalCardRequestWithOrder_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_3;
  v25[3] = &unk_1E56DE0C0;
  id v17 = *(id *)(a1 + 40);
  id v26 = v11;
  id v27 = v12;
  id v28 = v13;
  id v29 = v14;
  uint64_t v18 = *(void *)(a1 + 32);
  id v30 = v15;
  uint64_t v31 = v18;
  id v32 = v17;
  id v19 = v25;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v34 = v19;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  id v24 = v11;
  dispatch_async(v16, block);
}

uint64_t __124__PKAccountService_beginPhysicalCardRequestWithOrder_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[10];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6], a1[7], a1[8]);
  }
  return result;
}

- (void)completePhysicalCardRequest:(id)a3 withSignature:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __73__PKAccountService_completePhysicalCardRequest_withSignature_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__PKAccountService_completePhysicalCardRequest_withSignature_completion___block_invoke_2;
  v16[3] = &unk_1E56F5E80;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 completePhysicalCardRequest:v12 withSignature:v11 completion:v16];
}

uint64_t __73__PKAccountService_completePhysicalCardRequest_withSignature_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

void __73__PKAccountService_completePhysicalCardRequest_withSignature_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__PKAccountService_completePhysicalCardRequest_withSignature_completion___block_invoke_3;
  v17[3] = &unk_1E56E3E20;
  id v11 = *(id *)(a1 + 40);
  id v18 = v7;
  id v19 = v8;
  uint64_t v12 = *(void *)(a1 + 32);
  id v20 = v9;
  uint64_t v21 = v12;
  id v22 = v11;
  id v13 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v24 = v13;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v10, block);
}

uint64_t __73__PKAccountService_completePhysicalCardRequest_withSignature_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

- (void)beginPhysicalCardAction:(id)a3 onPhysicalCardWithIdentifier:(id)a4 forAccountWithIdentifier:(id)a5 accountUserAltDSID:(id)a6 deviceMetadata:(id)a7 completion:(id)a8
{
  id v15 = a8;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __143__PKAccountService_beginPhysicalCardAction_onPhysicalCardWithIdentifier_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke;
  v27[3] = &unk_1E56D8388;
  id v16 = v15;
  id v28 = v16;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v27];
  id v23 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v22];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __143__PKAccountService_beginPhysicalCardAction_onPhysicalCardWithIdentifier_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_2;
  v25[3] = &unk_1E56F5EA8;
  void v25[4] = self;
  id v26 = v16;
  id v24 = v16;
  [v23 beginPhysicalCardAction:v21 onPhysicalCardWithIdentifier:v20 forAccountWithIdentifier:v19 accountUserAltDSID:v18 deviceMetadata:v17 completion:v25];
}

uint64_t __143__PKAccountService_beginPhysicalCardAction_onPhysicalCardWithIdentifier_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void, uint64_t))(result + 16))(result, 0, 0, 0, 0, a2);
  }
  return result;
}

void __143__PKAccountService_beginPhysicalCardAction_onPhysicalCardWithIdentifier_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __143__PKAccountService_beginPhysicalCardAction_onPhysicalCardWithIdentifier_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_3;
  v25[3] = &unk_1E56DE0C0;
  id v17 = *(id *)(a1 + 40);
  id v26 = v11;
  id v27 = v12;
  id v28 = v13;
  id v29 = v14;
  uint64_t v18 = *(void *)(a1 + 32);
  id v30 = v15;
  uint64_t v31 = v18;
  id v32 = v17;
  id v19 = v25;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v34 = v19;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  id v24 = v11;
  dispatch_async(v16, block);
}

uint64_t __143__PKAccountService_beginPhysicalCardAction_onPhysicalCardWithIdentifier_forAccountWithIdentifier_accountUserAltDSID_deviceMetadata_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[10];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6], a1[7], a1[8]);
  }
  return result;
}

- (void)completePhysicalCardActionRequest:(id)a3 withSignature:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__PKAccountService_completePhysicalCardActionRequest_withSignature_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__PKAccountService_completePhysicalCardActionRequest_withSignature_completion___block_invoke_2;
  v16[3] = &unk_1E56F5DE0;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 completePhysicalCardActionRequest:v12 withSignature:v11 completion:v16];
}

uint64_t __79__PKAccountService_completePhysicalCardActionRequest_withSignature_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

void __79__PKAccountService_completePhysicalCardActionRequest_withSignature_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__PKAccountService_completePhysicalCardActionRequest_withSignature_completion___block_invoke_3;
  v17[3] = &unk_1E56E3E20;
  id v11 = *(id *)(a1 + 40);
  id v18 = v7;
  id v19 = v8;
  uint64_t v12 = *(void *)(a1 + 32);
  id v20 = v9;
  uint64_t v21 = v12;
  id v22 = v11;
  id v13 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v24 = v13;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v10, block);
}

uint64_t __79__PKAccountService_completePhysicalCardActionRequest_withSignature_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

- (void)activateBroadwayPhysicalCardWithActivationCode:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __78__PKAccountService_activateBroadwayPhysicalCardWithActivationCode_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78__PKAccountService_activateBroadwayPhysicalCardWithActivationCode_completion___block_invoke_2;
  v13[3] = &unk_1E56D86A8;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 activatePhysicalCardWithActivationCode:v9 completion:v13];
}

uint64_t __78__PKAccountService_activateBroadwayPhysicalCardWithActivationCode_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __78__PKAccountService_activateBroadwayPhysicalCardWithActivationCode_completion___block_invoke_2(uint64_t a1, char a2)
{
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__PKAccountService_activateBroadwayPhysicalCardWithActivationCode_completion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __78__PKAccountService_activateBroadwayPhysicalCardWithActivationCode_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)inactivePhysicalCardForFeatureIdentifier:(unint64_t)a3 completion:(id)a4
{
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __72__PKAccountService_inactivePhysicalCardForFeatureIdentifier_completion___block_invoke;
  v14[3] = &unk_1E56D8388;
  id v8 = v7;
  id v15 = v8;
  char v9 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v14];
  id v10 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PKAccountService_inactivePhysicalCardForFeatureIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E56F5ED0;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 inactivatePhysicalCardForFeatureIdentifier:a3 completion:v12];
}

uint64_t __72__PKAccountService_inactivePhysicalCardForFeatureIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __72__PKAccountService_inactivePhysicalCardForFeatureIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PKAccountService_inactivePhysicalCardForFeatureIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __72__PKAccountService_inactivePhysicalCardForFeatureIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)physicalCardForFeatureIdentifier:(unint64_t)a3 activationCode:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__PKAccountService_physicalCardForFeatureIdentifier_activationCode_completion___block_invoke;
  v17[3] = &unk_1E56D8388;
  id v10 = v9;
  id v18 = v10;
  id v11 = a4;
  id v12 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v17];
  id v13 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__PKAccountService_physicalCardForFeatureIdentifier_activationCode_completion___block_invoke_2;
  v15[3] = &unk_1E56F5ED0;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 physicalCardForFeatureIdentifier:a3 activationCode:v11 completion:v15];
}

uint64_t __79__PKAccountService_physicalCardForFeatureIdentifier_activationCode_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __79__PKAccountService_physicalCardForFeatureIdentifier_activationCode_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__PKAccountService_physicalCardForFeatureIdentifier_activationCode_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __79__PKAccountService_physicalCardForFeatureIdentifier_activationCode_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)activatePhysicalCard:(id)a3 withActivationCode:(id)a4 forFeatureIdentifier:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __92__PKAccountService_activatePhysicalCard_withActivationCode_forFeatureIdentifier_completion___block_invoke;
  v20[3] = &unk_1E56D8388;
  id v11 = v10;
  id v21 = v11;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v20];
  id v15 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v14];

  id v16 = [v13 identifier];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__PKAccountService_activatePhysicalCard_withActivationCode_forFeatureIdentifier_completion___block_invoke_2;
  v18[3] = &unk_1E56DE098;
  void v18[4] = self;
  id v19 = v11;
  id v17 = v11;
  [v15 activatePhysicalCardWithIdentifier:v16 activationCode:v12 completion:v18];
}

uint64_t __92__PKAccountService_activatePhysicalCard_withActivationCode_forFeatureIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 3);
  }
  return result;
}

void __92__PKAccountService_activatePhysicalCard_withActivationCode_forFeatureIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __92__PKAccountService_activatePhysicalCard_withActivationCode_forFeatureIdentifier_completion___block_invoke_3;
  v6[3] = &unk_1E56D8590;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = a2;
  v6[4] = *(void *)(a1 + 32);
  id v5 = v6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v10 = v5;
  dispatch_async(v4, block);
}

uint64_t __92__PKAccountService_activatePhysicalCard_withActivationCode_forFeatureIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 48));
  }
  return result;
}

- (void)processPhysicalCardExpirationMessaging:(id)a3 physicalCards:(id)a4 account:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:0];
  id v13 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v12];

  [v13 processPhysicalCardExpirationMessaging:v11 physicalCards:v10 account:v9];
}

- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStatementIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __120__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStatementIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __120__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStatementIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D90B0;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:v12 withStatementIdentifier:v11 completion:v16];
}

uint64_t __120__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStatementIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __120__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStatementIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __120__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStatementIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __120__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStatementIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStartDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  id v11 = a6;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __118__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStartDate_endDate_completion___block_invoke;
  v21[3] = &unk_1E56D8388;
  id v12 = v11;
  id v22 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v21];
  id v17 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v16];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __118__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStartDate_endDate_completion___block_invoke_2;
  v19[3] = &unk_1E56D90B0;
  v19[4] = self;
  id v20 = v12;
  id v18 = v12;
  [v17 billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:v15 withStartDate:v14 endDate:v13 completion:v19];
}

uint64_t __118__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStartDate_endDate_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __118__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStartDate_endDate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __118__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStartDate_endDate_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __118__PKAccountService_billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier_withStartDate_endDate_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)scheduledPaymentsWithAccountIdentifier:(id)a3 includeFailedRecurringPayments:(BOOL)a4 allowFetchFromServer:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v11 = a6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __122__PKAccountService_scheduledPaymentsWithAccountIdentifier_includeFailedRecurringPayments_allowFetchFromServer_completion___block_invoke;
  v19[3] = &unk_1E56D8388;
  id v12 = v11;
  id v20 = v12;
  id v13 = a3;
  id v14 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v19];
  uint64_t v15 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v14];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __122__PKAccountService_scheduledPaymentsWithAccountIdentifier_includeFailedRecurringPayments_allowFetchFromServer_completion___block_invoke_2;
  v17[3] = &unk_1E56D90B0;
  void v17[4] = self;
  id v18 = v12;
  id v16 = v12;
  [v15 scheduledPaymentsWithAccountIdentifier:v13 includeFailedRecurringPayments:v7 allowFetchFromServer:v6 completion:v17];
}

uint64_t __122__PKAccountService_scheduledPaymentsWithAccountIdentifier_includeFailedRecurringPayments_allowFetchFromServer_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __122__PKAccountService_scheduledPaymentsWithAccountIdentifier_includeFailedRecurringPayments_allowFetchFromServer_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __122__PKAccountService_scheduledPaymentsWithAccountIdentifier_includeFailedRecurringPayments_allowFetchFromServer_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __122__PKAccountService_scheduledPaymentsWithAccountIdentifier_includeFailedRecurringPayments_allowFetchFromServer_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)scheduledPaymentsWithAccountIdentifier:(id)a3 includeFailedRecurringPayments:(BOOL)a4 completion:(id)a5
{
}

- (void)updateScheduledPaymentsWithAccount:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __66__PKAccountService_updateScheduledPaymentsWithAccount_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__PKAccountService_updateScheduledPaymentsWithAccount_completion___block_invoke_2;
  v13[3] = &unk_1E56D90B0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 updateScheduledPaymentsWithAccount:v9 completion:v13];
}

uint64_t __66__PKAccountService_updateScheduledPaymentsWithAccount_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __66__PKAccountService_updateScheduledPaymentsWithAccount_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __66__PKAccountService_updateScheduledPaymentsWithAccount_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __66__PKAccountService_updateScheduledPaymentsWithAccount_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)markUserViewedIntroduction:(BOOL)a3 forInstallmentIdentifiers:(id)a4 accountIdentifier:(id)a5
{
  BOOL v6 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:0];
  id v12 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v11];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __91__PKAccountService_markUserViewedIntroduction_forInstallmentIdentifiers_accountIdentifier___block_invoke;
  v13[3] = &unk_1E56DB8E8;
  v13[4] = self;
  [v12 markUserViewedIntroduction:v6 forInstallmentIdentifiers:v10 accountIdentifier:v9 completion:v13];
}

void __91__PKAccountService_markUserViewedIntroduction_forInstallmentIdentifiers_accountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__PKAccountService_markUserViewedIntroduction_forInstallmentIdentifiers_accountIdentifier___block_invoke_2;
  v8[3] = &unk_1E56D8A90;
  id v9 = v3;
  uint64_t v10 = v4;
  BOOL v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v12 = v6;
  id v7 = v3;
  dispatch_async(v5, block);
}

void __91__PKAccountService_markUserViewedIntroduction_forInstallmentIdentifiers_accountIdentifier___block_invoke_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = v1;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error in markBillPaymentInstallmentInterstitialViewedForInstallment: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)exportTransactionDataForAccountIdentifier:(id)a3 withFileFormat:(id)a4 beginDate:(id)a5 endDate:(id)a6 productTimeZone:(id)a7 completion:(id)a8
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:0];
  id v22 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v21];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __122__PKAccountService_exportTransactionDataForAccountIdentifier_withFileFormat_beginDate_endDate_productTimeZone_completion___block_invoke;
  v24[3] = &unk_1E56F5EF8;
  void v24[4] = self;
  id v25 = v15;
  id v23 = v15;
  [v22 exportTransactionDataForAccountIdentifier:v20 withFileFormat:v19 beginDate:v18 endDate:v17 productTimeZone:v16 completion:v24];
}

void __122__PKAccountService_exportTransactionDataForAccountIdentifier_withFileFormat_beginDate_endDate_productTimeZone_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __122__PKAccountService_exportTransactionDataForAccountIdentifier_withFileFormat_beginDate_endDate_productTimeZone_completion___block_invoke_2;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __122__PKAccountService_exportTransactionDataForAccountIdentifier_withFileFormat_beginDate_endDate_productTimeZone_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)sharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:0];
  id v10 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __76__PKAccountService_sharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke;
  v12[3] = &unk_1E56F5F20;
  void v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 sharedAccountCloudStoreWithAccountIdentifier:v8 completion:v12];
}

void __76__PKAccountService_sharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__PKAccountService_sharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke_2;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __76__PKAccountService_sharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updateSharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:0];
  id v10 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__PKAccountService_updateSharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke;
  v12[3] = &unk_1E56F5F48;
  void v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 updateSharedAccountCloudStoreWithAccountIdentifier:v8 completion:v12];
}

void __82__PKAccountService_updateSharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __82__PKAccountService_updateSharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __82__PKAccountService_updateSharedAccountCloudStoreWithAccountIdentifier_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)didAddAccountPendingFamilyMembers:(id)a3
{
  id v5 = a3;
  id v6 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:0];
  id v7 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v6];

  [v7 didAddAccountPendingFamilyMembers:v5];
}

- (void)accountPendingFamilyMembersForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:0];
  id v10 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__PKAccountService_accountPendingFamilyMembersForAccountIdentifier_completion___block_invoke;
  v12[3] = &unk_1E56D90B0;
  void v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 accountPendingFamilyMembersForAccountIdentifier:v8 completion:v12];
}

void __79__PKAccountService_accountPendingFamilyMembersForAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__PKAccountService_accountPendingFamilyMembersForAccountIdentifier_completion___block_invoke_2;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __79__PKAccountService_accountPendingFamilyMembersForAccountIdentifier_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (id)accountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__84;
  id v21 = __Block_byref_object_dispose__84;
  id v22 = 0;
  id v13 = [(PKAccountService *)self _synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_53_1];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__PKAccountService_accountBalancesForAccountIdentifier_startDate_endDate_type___block_invoke_54;
  v16[3] = &unk_1E56E9888;
  v16[4] = self;
  void v16[5] = &v17;
  [v13 accountBalancesForAccountIdentifier:v10 startDate:v11 endDate:v12 type:a6 completion:v16];
  id v14 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v14;
}

void __79__PKAccountService_accountBalancesForAccountIdentifier_startDate_endDate_type___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (v2)
  {
    id v3 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "XPC Error fetching balances %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __79__PKAccountService_accountBalancesForAccountIdentifier_startDate_endDate_type___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Error fetching balances %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (void)updateAccountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7
{
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  uint64_t v17 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:0];
  id v18 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v17];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __96__PKAccountService_updateAccountBalancesForAccountIdentifier_startDate_endDate_type_completion___block_invoke;
  v20[3] = &unk_1E56D90B0;
  void v20[4] = self;
  id v21 = v13;
  id v19 = v13;
  [v18 updateAccountBalancesForAccountIdentifier:v16 startDate:v15 endDate:v14 type:a6 completion:v20];
}

void __96__PKAccountService_updateAccountBalancesForAccountIdentifier_startDate_endDate_type_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__PKAccountService_updateAccountBalancesForAccountIdentifier_startDate_endDate_type_completion___block_invoke_2;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __96__PKAccountService_updateAccountBalancesForAccountIdentifier_startDate_endDate_type_completion___block_invoke_2(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)resetAccountBalancesForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:0];
  id v10 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PKAccountService_resetAccountBalancesForAccountIdentifier_completion___block_invoke;
  v12[3] = &unk_1E56D9528;
  void v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v10 resetAccountBalancesForAccountIdentifier:v8 completion:v12];
}

void __72__PKAccountService_resetAccountBalancesForAccountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__PKAccountService_resetAccountBalancesForAccountIdentifier_completion___block_invoke_2;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __72__PKAccountService_resetAccountBalancesForAccountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)attemptAppleBalanceSetupWithCompletion:(id)a3
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__PKAccountService_attemptAppleBalanceSetupWithCompletion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v6 = v5;
  id v13 = v6;
  id v7 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v12];
  id v8 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __59__PKAccountService_attemptAppleBalanceSetupWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D9528;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 attemptAppleBalanceSetupWithCompletion:v10];
}

uint64_t __59__PKAccountService_attemptAppleBalanceSetupWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __59__PKAccountService_attemptAppleBalanceSetupWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__PKAccountService_attemptAppleBalanceSetupWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __59__PKAccountService_attemptAppleBalanceSetupWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)attemptAppleStoredValueSetupWithCompletion:(id)a3
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__PKAccountService_attemptAppleStoredValueSetupWithCompletion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v6 = v5;
  id v13 = v6;
  id v7 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v12];
  id v8 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __63__PKAccountService_attemptAppleStoredValueSetupWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D9528;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 attemptAppleBalanceSetupWithCompletion:v10];
}

uint64_t __63__PKAccountService_attemptAppleStoredValueSetupWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __63__PKAccountService_attemptAppleStoredValueSetupWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PKAccountService_attemptAppleStoredValueSetupWithCompletion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __63__PKAccountService_attemptAppleStoredValueSetupWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)validateAppleBalanceSecurityRequirementsWithCompletion:(id)a3
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PKAccountService_validateAppleBalanceSecurityRequirementsWithCompletion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v6 = v5;
  id v13 = v6;
  id v7 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v12];
  id v8 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PKAccountService_validateAppleBalanceSecurityRequirementsWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D84A0;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 validateAppleBalanceSecurityRequirementsWithCompletion:v10];
}

uint64_t __75__PKAccountService_validateAppleBalanceSecurityRequirementsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __75__PKAccountService_validateAppleBalanceSecurityRequirementsWithCompletion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PKAccountService_validateAppleBalanceSecurityRequirementsWithCompletion___block_invoke_3;
  v11[3] = &unk_1E56D8630;
  id v7 = *(id *)(a1 + 40);
  char v15 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v5;
  uint64_t v13 = v8;
  id v14 = v7;
  id v9 = v11;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v17 = v9;
  id v10 = v5;
  dispatch_async(v6, block);
}

uint64_t __75__PKAccountService_validateAppleBalanceSecurityRequirementsWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__PKAccountService_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __75__PKAccountService_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_2;
  v13[3] = &unk_1E56D86A8;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 triggerCloudStoreZoneCreationForAccount:v9 withCompletion:v13];
}

uint64_t __75__PKAccountService_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __75__PKAccountService_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_2(uint64_t a1, char a2)
{
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PKAccountService_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __75__PKAccountService_triggerCloudStoreZoneCreationForAccount_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)backgroundProvisionInProgressForFeature:(unint64_t)a3 withCompletion:(id)a4
{
  id v7 = a4;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__PKAccountService_backgroundProvisionInProgressForFeature_withCompletion___block_invoke;
  v14[3] = &unk_1E56D8388;
  id v8 = v7;
  id v15 = v8;
  char v9 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v14];
  id v10 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PKAccountService_backgroundProvisionInProgressForFeature_withCompletion___block_invoke_2;
  v12[3] = &unk_1E56D86A8;
  void v12[4] = self;
  id v13 = v8;
  id v11 = v8;
  [v10 backgroundProvisionInProgressForFeature:a3 withCompletion:v12];
}

uint64_t __75__PKAccountService_backgroundProvisionInProgressForFeature_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __75__PKAccountService_backgroundProvisionInProgressForFeature_withCompletion___block_invoke_2(uint64_t a1, char a2)
{
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__PKAccountService_backgroundProvisionInProgressForFeature_withCompletion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __75__PKAccountService_backgroundProvisionInProgressForFeature_withCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)invalidateTopUpTokenWithIdentifier:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__PKAccountService_invalidateTopUpTokenWithIdentifier_forAccountWithIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__PKAccountService_invalidateTopUpTokenWithIdentifier_forAccountWithIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D9528;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 invalidateTopUpTokenWithIdentifier:v12 forAccountWithIdentifier:v11 completion:v16];
}

uint64_t __91__PKAccountService_invalidateTopUpTokenWithIdentifier_forAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __91__PKAccountService_invalidateTopUpTokenWithIdentifier_forAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__PKAccountService_invalidateTopUpTokenWithIdentifier_forAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __91__PKAccountService_invalidateTopUpTokenWithIdentifier_forAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)appleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __77__PKAccountService_appleBalancePromotionForAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__PKAccountService_appleBalancePromotionForAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56F5F70;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 appleBalancePromotionForAccountWithIdentifier:v9 completion:v13];
}

uint64_t __77__PKAccountService_appleBalancePromotionForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __77__PKAccountService_appleBalancePromotionForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__PKAccountService_appleBalancePromotionForAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __77__PKAccountService_appleBalancePromotionForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)deleteAppleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __83__PKAccountService_deleteAppleBalancePromotionForAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PKAccountService_deleteAppleBalancePromotionForAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D9528;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 deleteAppleBalancePromotionForAccountWithIdentifier:v9 completion:v13];
}

uint64_t __83__PKAccountService_deleteAppleBalancePromotionForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __83__PKAccountService_deleteAppleBalancePromotionForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __83__PKAccountService_deleteAppleBalancePromotionForAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __83__PKAccountService_deleteAppleBalancePromotionForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)inStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__PKAccountService_inStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PKAccountService_inStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56F5F98;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 inStoreTopUpTokenForAccountWithIdentifier:v9 completion:v13];
}

uint64_t __73__PKAccountService_inStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __73__PKAccountService_inStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PKAccountService_inStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __73__PKAccountService_inStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)insertOrUpdateInStoreTopUpToken:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__PKAccountService_insertOrUpdateInStoreTopUpToken_accountIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__PKAccountService_insertOrUpdateInStoreTopUpToken_accountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D9528;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 insertOrUpdateInStoreTopUpToken:v12 accountIdentifier:v11 completion:v16];
}

uint64_t __81__PKAccountService_insertOrUpdateInStoreTopUpToken_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __81__PKAccountService_insertOrUpdateInStoreTopUpToken_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__PKAccountService_insertOrUpdateInStoreTopUpToken_accountIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __81__PKAccountService_insertOrUpdateInStoreTopUpToken_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)deleteInStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79__PKAccountService_deleteInStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__PKAccountService_deleteInStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D9528;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 deleteInStoreTopUpTokenForAccountWithIdentifier:v9 completion:v13];
}

uint64_t __79__PKAccountService_deleteInStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79__PKAccountService_deleteInStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__PKAccountService_deleteInStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __79__PKAccountService_deleteInStoreTopUpTokenForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)dailyCashEligibleDestinationsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__PKAccountService_dailyCashEligibleDestinationsForAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __85__PKAccountService_dailyCashEligibleDestinationsForAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56F5FC0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 dailyCashEligibleDestinationsForAccountWithIdentifier:v9 completion:v13];
}

uint64_t __85__PKAccountService_dailyCashEligibleDestinationsForAccountWithIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __85__PKAccountService_dailyCashEligibleDestinationsForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__PKAccountService_dailyCashEligibleDestinationsForAccountWithIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __85__PKAccountService_dailyCashEligibleDestinationsForAccountWithIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)accountHoldsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__PKAccountService_accountHoldsForAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  id v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__PKAccountService_accountHoldsForAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D90B0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 accountHoldsForAccountIdentifier:v9 completion:v13];
}

uint64_t __64__PKAccountService_accountHoldsForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __64__PKAccountService_accountHoldsForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __64__PKAccountService_accountHoldsForAccountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __64__PKAccountService_accountHoldsForAccountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)rewardsTierSummaryForTransactionSourceIdentifiers:(id)a3 currencyCode:(id)a4 startDate:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v13 = a7;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __112__PKAccountService_rewardsTierSummaryForTransactionSourceIdentifiers_currencyCode_startDate_endDate_completion___block_invoke;
  v24[3] = &unk_1E56D8388;
  id v14 = v13;
  id v25 = v14;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  id v19 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v24];
  id v20 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v19];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __112__PKAccountService_rewardsTierSummaryForTransactionSourceIdentifiers_currencyCode_startDate_endDate_completion___block_invoke_2;
  v22[3] = &unk_1E56F5FE8;
  v22[4] = self;
  id v23 = v14;
  id v21 = v14;
  [v20 rewardsTierSummaryForTransactionSourceIdentifiers:v18 currencyCode:v17 startDate:v16 endDate:v15 completion:v22];
}

uint64_t __112__PKAccountService_rewardsTierSummaryForTransactionSourceIdentifiers_currencyCode_startDate_endDate_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __112__PKAccountService_rewardsTierSummaryForTransactionSourceIdentifiers_currencyCode_startDate_endDate_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __112__PKAccountService_rewardsTierSummaryForTransactionSourceIdentifiers_currencyCode_startDate_endDate_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __112__PKAccountService_rewardsTierSummaryForTransactionSourceIdentifiers_currencyCode_startDate_endDate_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 observeCooldownPeriod:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __101__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_observeCooldownPeriod_completion___block_invoke;
  v17[3] = &unk_1E56D8388;
  id v10 = v9;
  id v18 = v10;
  id v11 = a3;
  id v12 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v17];
  id v13 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __101__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_observeCooldownPeriod_completion___block_invoke_2;
  v15[3] = &unk_1E56D90B0;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 updateAccountPromotionsForAccountWithIdentifier:v11 observeCooldownPeriod:v5 completion:v15];
}

uint64_t __101__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_observeCooldownPeriod_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __101__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_observeCooldownPeriod_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __101__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_observeCooldownPeriod_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __101__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_observeCooldownPeriod_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 observeCooldownPeriod:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v11 = a6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __120__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_ignoreErrorBackoff_observeCooldownPeriod_completion___block_invoke;
  v19[3] = &unk_1E56D8388;
  id v12 = v11;
  id v20 = v12;
  id v13 = a3;
  id v14 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v19];
  uint64_t v15 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v14];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __120__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_ignoreErrorBackoff_observeCooldownPeriod_completion___block_invoke_2;
  v17[3] = &unk_1E56D90B0;
  void v17[4] = self;
  id v18 = v12;
  id v16 = v12;
  [v15 updateAccountPromotionsForAccountWithIdentifier:v13 ignoreErrorBackoff:v7 observeCooldownPeriod:v6 completion:v17];
}

uint64_t __120__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_ignoreErrorBackoff_observeCooldownPeriod_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __120__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_ignoreErrorBackoff_observeCooldownPeriod_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __120__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_ignoreErrorBackoff_observeCooldownPeriod_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __120__PKAccountService_updateAccountPromotionsForAccountWithIdentifier_ignoreErrorBackoff_observeCooldownPeriod_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)insertOrUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__PKAccountService_insertOrUpdateAccountPromotions_accountIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__PKAccountService_insertOrUpdateAccountPromotions_accountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D9528;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 insertOrUpdateAccountPromotions:v12 accountIdentifier:v11 completion:v16];
}

uint64_t __81__PKAccountService_insertOrUpdateAccountPromotions_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __81__PKAccountService_insertOrUpdateAccountPromotions_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__PKAccountService_insertOrUpdateAccountPromotions_accountIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  BOOL v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __81__PKAccountService_insertOrUpdateAccountPromotions_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)accountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__PKAccountService_accountPromotionsForAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PKAccountService_accountPromotionsForAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D8810;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 accountPromotionsForAccountWithIdentifier:v9 completion:v13];
}

uint64_t __73__PKAccountService_accountPromotionsForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __73__PKAccountService_accountPromotionsForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73__PKAccountService_accountPromotionsForAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __73__PKAccountService_accountPromotionsForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)deleteAccountPromotion:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__PKAccountService_deleteAccountPromotion_forAccountWithIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __79__PKAccountService_deleteAccountPromotion_forAccountWithIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D9528;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 deleteAccountPromotion:v12 forAccountWithIdentifier:v11 completion:v16];
}

uint64_t __79__PKAccountService_deleteAccountPromotion_forAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79__PKAccountService_deleteAccountPromotion_forAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __79__PKAccountService_deleteAccountPromotion_forAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __79__PKAccountService_deleteAccountPromotion_forAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updateImpressionCountsForPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__PKAccountService_updateImpressionCountsForPromotions_accountIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __85__PKAccountService_updateImpressionCountsForPromotions_accountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D9528;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 updateImpressionCountsForPromotions:v12 accountIdentifier:v11 completion:v16];
}

uint64_t __85__PKAccountService_updateImpressionCountsForPromotions_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __85__PKAccountService_updateImpressionCountsForPromotions_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __85__PKAccountService_updateImpressionCountsForPromotions_accountIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __85__PKAccountService_updateImpressionCountsForPromotions_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updateImpressionCount:(int64_t)a3 promotionProgramIdentifier:(id)a4 accountIdentifier:(id)a5 completion:(id)a6
{
  id v11 = a6;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __98__PKAccountService_updateImpressionCount_promotionProgramIdentifier_accountIdentifier_completion___block_invoke;
  v20[3] = &unk_1E56D8388;
  id v12 = v11;
  id v21 = v12;
  id v13 = a5;
  id v14 = a4;
  id v15 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v20];
  id v16 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v15];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __98__PKAccountService_updateImpressionCount_promotionProgramIdentifier_accountIdentifier_completion___block_invoke_2;
  v18[3] = &unk_1E56D9528;
  void v18[4] = self;
  id v19 = v12;
  id v17 = v12;
  [v16 updateImpressionCount:a3 promotionProgramIdentifier:v14 accountIdentifier:v13 completion:v18];
}

uint64_t __98__PKAccountService_updateImpressionCount_promotionProgramIdentifier_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __98__PKAccountService_updateImpressionCount_promotionProgramIdentifier_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __98__PKAccountService_updateImpressionCount_promotionProgramIdentifier_accountIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __98__PKAccountService_updateImpressionCount_promotionProgramIdentifier_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)accountPromotionBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__PKAccountService_accountPromotionBehaviorForAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__PKAccountService_accountPromotionBehaviorForAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56F6010;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 accountPromotionBehaviorForAccountWithIdentifier:v9 completion:v13];
}

uint64_t __80__PKAccountService_accountPromotionBehaviorForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __80__PKAccountService_accountPromotionBehaviorForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PKAccountService_accountPromotionBehaviorForAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __80__PKAccountService_accountPromotionBehaviorForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 cooldownLevel:(unint64_t)a4 completion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __100__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_cooldownLevel_completion___block_invoke;
  v17[3] = &unk_1E56D8388;
  id v10 = v9;
  id v18 = v10;
  id v11 = a3;
  id v12 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v17];
  id v13 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __100__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_cooldownLevel_completion___block_invoke_2;
  v15[3] = &unk_1E56D90B0;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 updateAccountEnhancedMerchantsForAccountWithIdentifier:v11 cooldownLevel:a4 completion:v15];
}

uint64_t __100__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_cooldownLevel_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __100__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_cooldownLevel_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __100__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_cooldownLevel_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __100__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_cooldownLevel_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 cooldownLevel:(unint64_t)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v11 = a6;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __119__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_ignoreErrorBackoff_cooldownLevel_completion___block_invoke;
  v19[3] = &unk_1E56D8388;
  id v12 = v11;
  id v20 = v12;
  id v13 = a3;
  id v14 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v19];
  uint64_t v15 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v14];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __119__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_ignoreErrorBackoff_cooldownLevel_completion___block_invoke_2;
  v17[3] = &unk_1E56F6038;
  void v17[4] = self;
  id v18 = v12;
  id v16 = v12;
  [v15 updateAccountEnhancedMerchantsForAccountWithIdentifier:v13 ignoreErrorBackoff:v7 cooldownLevel:a5 completion:v17];
}

uint64_t __119__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_ignoreErrorBackoff_cooldownLevel_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t, void))(result + 16))(result, 0, a2, 0);
  }
  return result;
}

void __119__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_ignoreErrorBackoff_cooldownLevel_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __119__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_ignoreErrorBackoff_cooldownLevel_completion___block_invoke_3;
  v17[3] = &unk_1E56E3E20;
  id v11 = *(id *)(a1 + 40);
  id v18 = v7;
  id v19 = v8;
  uint64_t v12 = *(void *)(a1 + 32);
  id v20 = v9;
  uint64_t v21 = v12;
  id v22 = v11;
  id v13 = v17;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v24 = v13;
  id v14 = v9;
  id v15 = v8;
  id v16 = v7;
  dispatch_async(v10, block);
}

uint64_t __119__PKAccountService_updateAccountEnhancedMerchantsForAccountWithIdentifier_ignoreErrorBackoff_cooldownLevel_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[8];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, a1[4], a1[5], a1[6]);
  }
  return result;
}

- (void)insertOrUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __88__PKAccountService_insertOrUpdateAccountEnhancedMerchants_accountIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __88__PKAccountService_insertOrUpdateAccountEnhancedMerchants_accountIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D9528;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 insertOrUpdateAccountEnhancedMerchants:v12 accountIdentifier:v11 completion:v16];
}

uint64_t __88__PKAccountService_insertOrUpdateAccountEnhancedMerchants_accountIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __88__PKAccountService_insertOrUpdateAccountEnhancedMerchants_accountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__PKAccountService_insertOrUpdateAccountEnhancedMerchants_accountIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __88__PKAccountService_insertOrUpdateAccountEnhancedMerchants_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)accountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__PKAccountService_accountEnhancedMerchantsForAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __80__PKAccountService_accountEnhancedMerchantsForAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D8810;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 accountEnhancedMerchantsForAccountWithIdentifier:v9 completion:v13];
}

uint64_t __80__PKAccountService_accountEnhancedMerchantsForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __80__PKAccountService_accountEnhancedMerchantsForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __80__PKAccountService_accountEnhancedMerchantsForAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __80__PKAccountService_accountEnhancedMerchantsForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)deleteAccountEnhancedMerchant:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __86__PKAccountService_deleteAccountEnhancedMerchant_forAccountWithIdentifier_completion___block_invoke;
  v18[3] = &unk_1E56D8388;
  id v10 = v9;
  id v19 = v10;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v18];
  id v14 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v13];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __86__PKAccountService_deleteAccountEnhancedMerchant_forAccountWithIdentifier_completion___block_invoke_2;
  v16[3] = &unk_1E56D9528;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 deleteAccountEnhancedMerchant:v12 forAccountWithIdentifier:v11 completion:v16];
}

uint64_t __86__PKAccountService_deleteAccountEnhancedMerchant_forAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __86__PKAccountService_deleteAccountEnhancedMerchant_forAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__PKAccountService_deleteAccountEnhancedMerchant_forAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __86__PKAccountService_deleteAccountEnhancedMerchant_forAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)accountEnhancedMerchantBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__PKAccountService_accountEnhancedMerchantBehaviorForAccountWithIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__PKAccountService_accountEnhancedMerchantBehaviorForAccountWithIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56F6060;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 accountEnhancedMerchantBehaviorForAccountWithIdentifier:v9 completion:v13];
}

uint64_t __87__PKAccountService_accountEnhancedMerchantBehaviorForAccountWithIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __87__PKAccountService_accountEnhancedMerchantBehaviorForAccountWithIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__PKAccountService_accountEnhancedMerchantBehaviorForAccountWithIdentifier_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __87__PKAccountService_accountEnhancedMerchantBehaviorForAccountWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updateCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __84__PKAccountService_updateCreditRecoveryPaymentPlansForAccountIdentifier_completion___block_invoke;
  v15[3] = &unk_1E56D8388;
  id v8 = v7;
  id v16 = v8;
  id v9 = a3;
  id v10 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v15];
  uint64_t v11 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v10];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __84__PKAccountService_updateCreditRecoveryPaymentPlansForAccountIdentifier_completion___block_invoke_2;
  v13[3] = &unk_1E56D90B0;
  v13[4] = self;
  id v14 = v8;
  id v12 = v8;
  [v11 updateCreditRecoveryPaymentPlansForAccountIdentifier:v9 completion:v13];
}

uint64_t __84__PKAccountService_updateCreditRecoveryPaymentPlansForAccountIdentifier_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void __84__PKAccountService_updateCreditRecoveryPaymentPlansForAccountIdentifier_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__PKAccountService_updateCreditRecoveryPaymentPlansForAccountIdentifier_completion___block_invoke_3;
  v12[3] = &unk_1E56D8518;
  id v8 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v6;
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = v8;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v18 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, block);
}

uint64_t __84__PKAccountService_updateCreditRecoveryPaymentPlansForAccountIdentifier_completion___block_invoke_3(void *a1)
{
  uint64_t result = a1[7];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, a1[4], a1[5]);
  }
  return result;
}

- (void)creditRecoveryPaymentPlansForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __99__PKAccountService_creditRecoveryPaymentPlansForAccountIdentifier_allowFetchFromServer_completion___block_invoke;
  v17[3] = &unk_1E56D8388;
  id v10 = v9;
  id v18 = v10;
  id v11 = a3;
  id v12 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v17];
  id v13 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __99__PKAccountService_creditRecoveryPaymentPlansForAccountIdentifier_allowFetchFromServer_completion___block_invoke_2;
  v15[3] = &unk_1E56D8810;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 creditRecoveryPaymentPlansForAccountIdentifier:v11 allowFetchFromServer:v5 completion:v15];
}

uint64_t __99__PKAccountService_creditRecoveryPaymentPlansForAccountIdentifier_allowFetchFromServer_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __99__PKAccountService_creditRecoveryPaymentPlansForAccountIdentifier_allowFetchFromServer_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __99__PKAccountService_creditRecoveryPaymentPlansForAccountIdentifier_allowFetchFromServer_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __99__PKAccountService_creditRecoveryPaymentPlansForAccountIdentifier_allowFetchFromServer_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)creditRecoveryPaymentPlanInformationForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __109__PKAccountService_creditRecoveryPaymentPlanInformationForAccountIdentifier_allowFetchFromServer_completion___block_invoke;
  v17[3] = &unk_1E56D8388;
  id v10 = v9;
  id v18 = v10;
  id v11 = a3;
  id v12 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v17];
  id v13 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __109__PKAccountService_creditRecoveryPaymentPlanInformationForAccountIdentifier_allowFetchFromServer_completion___block_invoke_2;
  v15[3] = &unk_1E56F60B0;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 creditRecoveryPaymentPlanInformationForAccountIdentifier:v11 allowFetchFromServer:v5 completion:v15];
}

uint64_t __109__PKAccountService_creditRecoveryPaymentPlanInformationForAccountIdentifier_allowFetchFromServer_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, 0);
  }
  return result;
}

void __109__PKAccountService_creditRecoveryPaymentPlanInformationForAccountIdentifier_allowFetchFromServer_completion___block_invoke_2(uint64_t a1, char a2, char a3)
{
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __109__PKAccountService_creditRecoveryPaymentPlanInformationForAccountIdentifier_allowFetchFromServer_completion___block_invoke_3;
  v9[3] = &unk_1E56F6088;
  id v7 = *(id *)(a1 + 40);
  char v11 = a2;
  char v12 = a3;
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v7;
  id v8 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v8;
  dispatch_async(v6, block);
}

uint64_t __109__PKAccountService_creditRecoveryPaymentPlanInformationForAccountIdentifier_allowFetchFromServer_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(unsigned __int8 *)(a1 + 49));
  }
  return result;
}

- (void)accountEntityOrderingsForAccountWithIdentifier:(id)a3 entityType:(unint64_t)a4 completion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __89__PKAccountService_accountEntityOrderingsForAccountWithIdentifier_entityType_completion___block_invoke;
  v17[3] = &unk_1E56D8388;
  id v10 = v9;
  id v18 = v10;
  id v11 = a3;
  char v12 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v17];
  id v13 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v12];

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__PKAccountService_accountEntityOrderingsForAccountWithIdentifier_entityType_completion___block_invoke_2;
  v15[3] = &unk_1E56D8810;
  void v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v13 accountEntityOrderingsForAccountWithIdentifier:v11 entityType:a4 completion:v15];
}

uint64_t __89__PKAccountService_accountEntityOrderingsForAccountWithIdentifier_entityType_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __89__PKAccountService_accountEntityOrderingsForAccountWithIdentifier_entityType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__PKAccountService_accountEntityOrderingsForAccountWithIdentifier_entityType_completion___block_invoke_3;
  v9[3] = &unk_1E56D8428;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v3;
  uint64_t v11 = v6;
  id v12 = v5;
  id v7 = v9;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v14 = v7;
  id v8 = v3;
  dispatch_async(v4, block);
}

uint64_t __89__PKAccountService_accountEntityOrderingsForAccountWithIdentifier_entityType_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (void)updateWalletBadgeCountWithCompletion:(id)a3
{
  id v5 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__PKAccountService_updateWalletBadgeCountWithCompletion___block_invoke;
  v12[3] = &unk_1E56D8388;
  id v6 = v5;
  id v13 = v6;
  id v7 = [(PKAccountService *)self errorHandlerForMethod:a2 completion:v12];
  id v8 = [(PKAccountService *)self _remoteObjectProxyWithErrorHandler:v7];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__PKAccountService_updateWalletBadgeCountWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56D86A8;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v8 updateWalletBadgeCountWithCompletion:v10];
}

uint64_t __57__PKAccountService_updateWalletBadgeCountWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void __57__PKAccountService_updateWalletBadgeCountWithCompletion___block_invoke_2(uint64_t a1, char a2)
{
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PKAccountService_updateWalletBadgeCountWithCompletion___block_invoke_3;
  v7[3] = &unk_1E56D8478;
  id v5 = *(id *)(a1 + 40);
  char v9 = a2;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_23;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  dispatch_async(v4, block);
}

uint64_t __57__PKAccountService_updateWalletBadgeCountWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  }
  return result;
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_lockObservers);
  }
}

- (void)_accessObserversWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lockObservers);
    id v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__PKAccountService__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E56D8A18;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

void __48__PKAccountService__accessObserversWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)accountAdded:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__PKAccountService_accountAdded___block_invoke;
  v6[3] = &unk_1E56F60D8;
  id v7 = v4;
  id v5 = v4;
  [(PKAccountService *)self _accessObserversWithHandler:v6];
}

void __33__PKAccountService_accountAdded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accountAdded:*(void *)(a1 + 32)];
  }
}

- (void)accountChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__PKAccountService_accountChanged___block_invoke;
  v6[3] = &unk_1E56F60D8;
  id v7 = v4;
  id v5 = v4;
  [(PKAccountService *)self _accessObserversWithHandler:v6];
}

void __35__PKAccountService_accountChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accountChanged:*(void *)(a1 + 32)];
  }
}

- (void)accountRemoved:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__PKAccountService_accountRemoved___block_invoke;
  v6[3] = &unk_1E56F60D8;
  id v7 = v4;
  id v5 = v4;
  [(PKAccountService *)self _accessObserversWithHandler:v6];
}

void __35__PKAccountService_accountRemoved___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accountRemoved:*(void *)(a1 + 32)];
  }
}

- (void)statementsChangedForAccountIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PKAccountService_statementsChangedForAccountIdentifier___block_invoke;
  v6[3] = &unk_1E56F60D8;
  id v7 = v4;
  id v5 = v4;
  [(PKAccountService *)self _accessObserversWithHandler:v6];
}

void __58__PKAccountService_statementsChangedForAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 statementsChangedForAccountIdentifier:*(void *)(a1 + 32)];
  }
}

- (void)scheduledPaymentsChangedForAccountIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__PKAccountService_scheduledPaymentsChangedForAccountIdentifier___block_invoke;
  v6[3] = &unk_1E56F60D8;
  id v7 = v4;
  id v5 = v4;
  [(PKAccountService *)self _accessObserversWithHandler:v6];
}

void __65__PKAccountService_scheduledPaymentsChangedForAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 scheduledPaymentsChangedForAccountIdentifier:*(void *)(a1 + 32)];
  }
}

- (void)didUpdatePaymentFundingSources:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__PKAccountService_didUpdatePaymentFundingSources_accountIdentifier___block_invoke;
  v10[3] = &unk_1E56F6100;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKAccountService *)self _accessObserversWithHandler:v10];
}

void __69__PKAccountService_didUpdatePaymentFundingSources_accountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didUpdatePaymentFundingSources:*(void *)(a1 + 32) accountIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)accountUsersChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __61__PKAccountService_accountUsersChanged_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E56F6100;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKAccountService *)self _accessObserversWithHandler:v10];
}

void __61__PKAccountService_accountUsersChanged_forAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accountUsersChanged:*(void *)(a1 + 32) forAccountIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)physicalCardsChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__PKAccountService_physicalCardsChanged_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E56F6100;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKAccountService *)self _accessObserversWithHandler:v10];
}

void __62__PKAccountService_physicalCardsChanged_forAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 physicalCardsChanged:*(void *)(a1 + 32) forAccountIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)accountFinancingPlanAdded:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__PKAccountService_accountFinancingPlanAdded_accountIdentifier___block_invoke;
  v10[3] = &unk_1E56F6100;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKAccountService *)self _accessObserversWithHandler:v10];
}

void __64__PKAccountService_accountFinancingPlanAdded_accountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accountFinancingPlanAdded:*(void *)(a1 + 32) accountIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)accountFinancingPlanUpdated:(id)a3 oldFinancingPlan:(id)a4 accountIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__PKAccountService_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke;
  v14[3] = &unk_1E56F6128;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(PKAccountService *)self _accessObserversWithHandler:v14];
}

void __83__PKAccountService_accountFinancingPlanUpdated_oldFinancingPlan_accountIdentifier___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accountFinancingPlanUpdated:a1[4] oldFinancingPlan:a1[5] accountIdentifier:a1[6]];
  }
}

- (void)accountFinancingPlanRemoved:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __66__PKAccountService_accountFinancingPlanRemoved_accountIdentifier___block_invoke;
  v10[3] = &unk_1E56F6100;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKAccountService *)self _accessObserversWithHandler:v10];
}

void __66__PKAccountService_accountFinancingPlanRemoved_accountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 accountFinancingPlanRemoved:*(void *)(a1 + 32) accountIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)payLaterCardMagnitudesChanged:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__PKAccountService_payLaterCardMagnitudesChanged_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E56F6100;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKAccountService *)self _accessObserversWithHandler:v10];
}

void __71__PKAccountService_payLaterCardMagnitudesChanged_forAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 payLaterCardMagnitudesChanged:*(void *)(a1 + 32) forAccountIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)didUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __65__PKAccountService_didUpdateAccountPromotions_accountIdentifier___block_invoke;
  v10[3] = &unk_1E56F6100;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKAccountService *)self _accessObserversWithHandler:v10];
}

void __65__PKAccountService_didUpdateAccountPromotions_accountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didUpdateAccountPromotions:*(void *)(a1 + 32) accountIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)didUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 lastUpdate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __83__PKAccountService_didUpdateAccountEnhancedMerchants_accountIdentifier_lastUpdate___block_invoke;
  v14[3] = &unk_1E56F6128;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(PKAccountService *)self _accessObserversWithHandler:v14];
}

void __83__PKAccountService_didUpdateAccountEnhancedMerchants_accountIdentifier_lastUpdate___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didUpdateAccountEnhancedMerchants:a1[4] accountIdentifier:a1[5] lastUpdate:a1[6]];
  }
}

- (void)creditRecoveryPaymentPlansChangedForAccountIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__PKAccountService_creditRecoveryPaymentPlansChangedForAccountIdentifier___block_invoke;
  v6[3] = &unk_1E56F60D8;
  id v7 = v4;
  id v5 = v4;
  [(PKAccountService *)self _accessObserversWithHandler:v6];
}

void __74__PKAccountService_creditRecoveryPaymentPlansChangedForAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 creditRecoveryPaymentPlansChangedForAccountIdentifier:*(void *)(a1 + 32)];
  }
}

- (void)didUpdateAppleBalancePromotion:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__PKAccountService_didUpdateAppleBalancePromotion_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E56F6100;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKAccountService *)self _accessObserversWithHandler:v10];
}

void __72__PKAccountService_didUpdateAppleBalancePromotion_forAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didUpdateAppleBalancePromotion:*(void *)(a1 + 32) forAccountIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)didRemoveAppleBalancePromotionWithUniqueIdentifier:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __92__PKAccountService_didRemoveAppleBalancePromotionWithUniqueIdentifier_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E56F6100;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKAccountService *)self _accessObserversWithHandler:v10];
}

void __92__PKAccountService_didRemoveAppleBalancePromotionWithUniqueIdentifier_forAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didRemoveAppleBalancePromotionWithUniqueIdentifier:*(void *)(a1 + 32) forAccountIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)didUpdateInStoreTopUpToken:(id)a3 forAccountIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__PKAccountService_didUpdateInStoreTopUpToken_forAccountIdentifier___block_invoke;
  v10[3] = &unk_1E56F6100;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKAccountService *)self _accessObserversWithHandler:v10];
}

void __68__PKAccountService_didUpdateInStoreTopUpToken_forAccountIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didUpdateInStoreTopUpToken:*(void *)(a1 + 32) forAccountIdentifier:*(void *)(a1 + 40)];
  }
}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void)setReplyQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_remoteService, 0);
}

@end