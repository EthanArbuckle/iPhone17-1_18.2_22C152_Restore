@interface PDAccountManager
- (BOOL)_accountSupportsTransactionsWithoutPass:(id)a3;
- (BOOL)_shouldDownloadCreditStatementsForAccountIdentifier:(id)a3;
- (BOOL)_shouldDownloadCreditStatementsForLastStatementDownload:(id)a3 now:(id)a4;
- (BOOL)_shouldDownloadScheduledPaymentsForAccountIdentifier:(id)a3;
- (BOOL)_shouldFetchUpdatedUserInfo:(id)a3;
- (BOOL)_shouldProactivelyFetchAccountUsersForAccount:(id)a3 users:(id)a4;
- (BOOL)_shouldProactivelyFetchEndpoint:(unint64_t)a3 dirty:(BOOL)a4 lastUpdated:(id)a5 fetchPeriodEndpoint:(unint64_t)a6 account:(id)a7;
- (BOOL)_shouldProactivelyFetchEndpoint:(unint64_t)a3 metadataType:(unint64_t)a4 fetchPeriodEndpoint:(unint64_t)a5 account:(id)a6;
- (BOOL)backgroundProvisionInProgressForFeature:(unint64_t)a3;
- (PDAccountManager)initWithPushNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 databaseManager:(id)a5 userNotificationManager:(id)a6 payLaterMerchantProcessor:(id)a7 cloudStoreNotificationCoordinator:(id)a8 deviceEnvironmentStore:(id)a9 databaseRecreated:(BOOL)a10;
- (PDAccountNotificationController)accountNotificationController;
- (id)_amsController;
- (id)_cacheKeyForCreditStatementsWithAccountIdentifier:(id)a3;
- (id)_cacheKeyForScheduledPaymentsWithAccountIdentifier:(id)a3;
- (id)_cacheKeyForUserInfoWithAccountIdentifier:(id)a3;
- (id)_expirationMessagingStartDateForMessagingInfo:(id)a3 account:(id)a4 now:(id)a5;
- (id)_familyMemberAssociatedWithInviteEmail:(id)a3 familyMembers:(id)a4;
- (id)_mockAccountUsers;
- (id)_mockCreditAccountInitialStateWithEvents:(id *)a3;
- (id)_mockInstallmentForAccount:(id)a3 events:(id *)a4;
- (id)_mockPhysicalCards;
- (id)_mockSavingsAccount;
- (id)_promoRewardsMerchantNamesFromDate:(id)a3 toDate:(id)a4 accountIdentifier:(id)a5 altDSID:(id)a6 rewardPercentage:(id *)a7;
- (id)_queue_accountWithIdentifier:(id)a3;
- (id)_queue_insertOrReplaceAccount:(id)a3 extended:(BOOL)a4 deleteSensitiveData:(BOOL)a5;
- (id)_queue_processFinancingPlans:(id)a3 accountIdentifier:(id)a4 updateReasons:(unint64_t)a5;
- (id)_rewardsAmountFromDate:(id)a3 toDate:(id)a4 accountIdentifier:(id)a5 altDSID:(id)a6 rewardTypes:(id *)a7;
- (id)_setupNotificationIdentifierForAccountIdentifier:(id)a3;
- (id)defaultAccountForFeature:(unint64_t)a3 forAccounts:(id)a4;
- (id)pushNotificationTopics;
- (unint64_t)_queueIndexOfAccountWithIdentifier:(id)a3;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_accountsAreInDirtyWithFeatureFailures:(id)a3 completion:(id)a4;
- (void)_addAccountManagerFetchRequest:(id)a3;
- (void)_cleanupSavingsAccountPreferences:(id)a3;
- (void)_creditStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)_creditUserInfoForAccountIdentifier:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5;
- (void)_downloadCreditStatementsForAccountIdentifier:(id)a3 withCompletion:(id)a4;
- (void)_executeDecryptionRequests;
- (void)_executeFetchRequest:(id)a3 completion:(id)a4;
- (void)_executeNextAccountManagerFetchIfPossibleForRequestIdentifier:(id)a3;
- (void)_fetchCreditUserInfoForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)_handlePhysicalCardActionResponse:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)_handlePhysicalCardRequestResponse:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)_insertOrUpdateAccountServicingTokenNotificationWithAccount:(id)a3 notificationUserInfo:(id)a4;
- (void)_managerFetch_cancelFinancingPlanWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_createdZoneWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_exportTransactionsWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_performVirtualCardActionWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_sendAccountReport:(id)a3 completion:(id)a4;
- (void)_managerFetch_sharedAccountCloudStoreWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateAccountUsersWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateAccountWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateAccountsWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateBalancesWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateCreditRecoveryPaymentPlansWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateEnhancedMerchantsWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateFinancingPlansWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updateFundingSourcesWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updatePhysicalCardsWithRequest:(id)a3 completion:(id)a4;
- (void)_managerFetch_updatePromotionsWithRequest:(id)a3 completion:(id)a4;
- (void)_notifyPhysicalCardsChangedWithAccountEvent:(id)a3;
- (void)_paymentWebServiceContextChanged;
- (void)_processAddedAccounts:(id)a3;
- (void)_processChangedAccounts:(id)a3;
- (void)_processDeletedAccounts:(id)a3;
- (void)_processPaymentFailed:(id)a3;
- (void)_processPhysicalCardsFromExtendedAccountResponse:(id)a3 accountIdentifier:(id)a4;
- (void)_processRewardsAddedEvent:(id)a3;
- (void)_processRewardsRedemptionEvent:(id)a3;
- (void)_processUserInfoUpdateEvent:(id)a3;
- (void)_processVirtualCardStatusUpdateEvent:(id)a3;
- (void)_publishStatementsChangedForAccountIdentifier:(id)a3;
- (void)_queueDecryptionRequest:(id)a3;
- (void)_queue_deleteAccounts;
- (void)_queue_fetchNextPaginatedRequestIfNecessaryFromPreviousResponse:(id)a3 newRequest:(id)a4;
- (void)_queue_mergeAccounts:(id)a3 featureFailures:(id)a4;
- (void)_queue_updateAccountsWithPayload:(id)a3;
- (void)_queue_updateAppleBalancePromotionsIfNeccessaryForAccount:(id)a3 currentPromotion:(id)a4;
- (void)_queue_updateCreditRecoveryPaymentPlansIfNecessaryForAccount:(id)a3;
- (void)_queue_updateEnhancedMerchantsIfNecessaryForAccount:(id)a3;
- (void)_queue_updateFinancingPlansIfNeccessaryForAccount:(id)a3;
- (void)_queue_updatePaymentFundingSourcesIfNecessaryForAccount:(id)a3;
- (void)_queue_updatePhysicalCardsIfNecessaryForAccount:(id)a3;
- (void)_queue_updatePromotionsIfNecessaryForAccount:(id)a3;
- (void)_queue_updateSharedAccountCloudStoreIfNeccessaryForAccount:(id)a3 completion:(id)a4;
- (void)_queue_writeFinancingPlanUpdateIfPossibleWithOldFinancingPlan:(id)a3 newFinancingPlan:(id)a4;
- (void)_savingsUserInfoForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)_triggerProvisionPassToWatchWithCompletion:(id)a3;
- (void)_updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 cooldownLevel:(unint64_t)a5 completion:(id)a6;
- (void)_updateAccountPromotionsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 observeCooldownPeriod:(BOOL)a5 completion:(id)a6;
- (void)_updateAccountUsersForAccountWithIdentifier:(id)a3 fromPush:(BOOL)a4 completion:(id)a5;
- (void)_updateCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)_updateFinancingPlansForAccountWithIdentifier:(id)a3 pageOffset:(unint64_t)a4 limit:(unint64_t)a5 ignoreLastUpdatedDate:(BOOL)a6 fromPush:(BOOL)a7 completion:(id)a8;
- (void)_updatePhysicalCardsForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)_updatePushTopics;
- (void)_updateSharedAccountCloudStoreWithAccountIdentifier:(id)a3 fromPush:(BOOL)a4 completion:(id)a5;
- (void)accountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7;
- (void)accountEnhancedMerchantBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountEntityOrderingsForAccountWithIdentifier:(id)a3 entityType:(unint64_t)a4 completion:(id)a5;
- (void)accountForPassWithUniqueID:(id)a3 completion:(id)a4;
- (void)accountHoldsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)accountIsInDirtyStateWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountPendingFamilyMembersForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)accountPromotionBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountStatementMetadataForAllAccountsWithCompletion:(id)a3;
- (void)accountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)accountUsersByAccountIdentifierForFeature:(unint64_t)a3 completion:(id)a4;
- (void)accountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountWithIdentifier:(id)a3 completion:(id)a4;
- (void)accountWithVirtualCardIdentifier:(id)a3 completion:(id)a4;
- (void)accountsAreInDirtyStateWithCompletion:(id)a3;
- (void)accountsForFeature:(unint64_t)a3 completion:(id)a4;
- (void)accountsForProvisioningWithCompletion:(id)a3;
- (void)accountsWithCompletion:(id)a3;
- (void)accountsWithPassLocallyProvisionedWithCompletion:(id)a3;
- (void)activatePhysicalCardWithActivationCode:(id)a3 completion:(id)a4;
- (void)activatePhysicalCardWithIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5;
- (void)appleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)applyPushNotificationToken:(id)a3;
- (void)attemptAppleBalanceSetupWithCompletion:(id)a3;
- (void)beginPhysicalCardAction:(id)a3 onPhysicalCardWithIdentifier:(id)a4 forAccountWithIdentifier:(id)a5 accountUserAltDSID:(id)a6 deviceMetadata:(id)a7 completion:(id)a8;
- (void)beginPhysicalCardRequestWithOrder:(id)a3 forAccountWithIdentifier:(id)a4 accountUserAltDSID:(id)a5 deviceMetadata:(id)a6 completion:(id)a7;
- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStartDate:(id)a4 endDate:(id)a5 completion:(id)a6;
- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStatementIdentifier:(id)a4 completion:(id)a5;
- (void)cancelFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 cancellationReasonIdentifier:(id)a5 cancellationReasonDescription:(id)a6 completion:(id)a7;
- (void)cardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 action:(int64_t)a5 completion:(id)a6;
- (void)cloudStoreNotificationCoordinator:(id)a3 createdZoneWithName:(id)a4 forContainerName:(id)a5 scope:(int64_t)a6;
- (void)completePhysicalCardActionRequest:(id)a3 withSignature:(id)a4 completion:(id)a5;
- (void)completePhysicalCardRequest:(id)a3 withSignature:(id)a4 completion:(id)a5;
- (void)createVirtualCard:(int64_t)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)creditRecoveryPaymentPlanInformationForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5;
- (void)creditRecoveryPaymentPlansForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5;
- (void)creditStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)creditStatementsForStatementIdentifiers:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)dailyCashEligibleDestinationsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)dailyCashNotificationForStartDate:(id)a3 endDate:(id)a4 accountIdentifier:(id)a5 completion:(id)a6;
- (void)databaseRestored;
- (void)dealloc;
- (void)defaultAccountForFeature:(unint64_t)a3 completion:(id)a4;
- (void)deleteAccountEnhancedMerchant:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountPromotion:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountUserWithAltDSID:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)deleteAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)deleteAccountsWithCompletion:(id)a3;
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
- (void)deleteVirtualCardEncryptedDataForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)didAddAccountPendingFamilyMembers:(id)a3;
- (void)environmentStore:(id)a3 storedEnvironment:(id)a4 differsFromCurrent:(id)a5 commitBlock:(id)a6;
- (void)eventWithIdentifier:(id)a3 completion:(id)a4;
- (void)eventsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)eventsForAccountIdentifier:(id)a3 types:(id)a4 startDate:(id)a5 endDate:(id)a6 orderedByDate:(int64_t)a7 limit:(unint64_t)a8 completion:(id)a9;
- (void)exportTransactionDataForAccountIdentifier:(id)a3 withFileFormat:(id)a4 beginDate:(id)a5 endDate:(id)a6 productTimeZone:(id)a7 completion:(id)a8;
- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3;
- (void)fetchAllVirtualCardsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)fetchKeychainCredentialForVirtualCardIdentifier:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5;
- (void)financingPlanForPlanIdentifier:(id)a3 completion:(id)a4;
- (void)financingPlanInstallmentsDueDateRangeForAccountIdentifier:(id)a3 financingPlanStates:(id)a4 completion:(id)a5;
- (void)financingPlansForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)financingPlansForAllAccountsWithCompletion:(id)a3;
- (void)financingPlansWithQueries:(id)a3 completion:(id)a4;
- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4;
- (void)inStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)inactivePhysicalCardForFeatureIdentifier:(unint64_t)a3 completion:(id)a4;
- (void)insertAccountBalanceUpdateNotificationForAccount:(id)a3 updateAmount:(id)a4;
- (void)insertDailyCashNotificationForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)insertEvents:(id)a3 completion:(id)a4;
- (void)insertOrReplaceAccount:(id)a3 extended:(BOOL)a4 deleteSensitiveData:(BOOL)a5 completion:(id)a6;
- (void)insertOrUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateAppleBalancePromotion:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateInStoreTopUpToken:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateLocalAccount:(id)a3 completion:(id)a4;
- (void)insertOrUpdateLocalAccountFinancingPlans:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateLocalAccountUser:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)insertOrUpdateLocalFinancingPlans:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)insertSummaryNotificationForAccountIdentifier:(id)a3 summaryType:(int64_t)a4 completion:(id)a5;
- (void)invalidateTopUpTokenWithIdentifier:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5;
- (void)lastRedemptionEventToDestination:(unint64_t)a3 forAccountIdentifier:(id)a4 altDSID:(id)a5 completion:(id)a6;
- (void)lastUsedInAppFundingSourceForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)markUserViewedIntroduction:(BOOL)a3 forInstallmentIdentifiers:(id)a4 accountIdentifier:(id)a5 completion:(id)a6;
- (void)mergeAccounts:(id)a3 completion:(id)a4;
- (void)noteAccountDeletionWithCompletion:(id)a3;
- (void)noteSecurityCodeActivityWithAction:(int64_t)a3 forSecurityCodeIdentifier:(id)a4 forVirtualCardIdentifier:(id)a5 forAccountIdentifier:(id)a6 completion:(id)a7;
- (void)noteVirtualCardAutoFilledBySafari:(id)a3 completion:(id)a4;
- (void)passAdded:(id)a3;
- (void)passRemoved:(id)a3;
- (void)payLaterCardMagnitudesForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)payLaterMerchantProcessor:(id)a3 didProcessPayLaterMerchant:(id)a4 forFinancingPlan:(id)a5;
- (void)paymentFundingSourceForIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)paymentFundingSourcesForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3;
- (void)performAccountAction:(id)a3 withAccountIdentifier:(id)a4 accountUserAltDSID:(id)a5 completion:(id)a6;
- (void)performVirtualCardAction:(int64_t)a3 forVirtualCardIdentifier:(id)a4 forAccountIdentifier:(id)a5 completion:(id)a6;
- (void)physicalCardForFeatureIdentifier:(unint64_t)a3 activationCode:(id)a4 completion:(id)a5;
- (void)physicalCardsByAccountIdentifierForFeature:(unint64_t)a3 completion:(id)a4;
- (void)physicalCardsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)postAccountChangedNotification;
- (void)processPhysicalCardExpirationMessaging:(id)a3 physicalCards:(id)a4 account:(id)a5;
- (void)promptDetailsForVirtualCard:(id)a3 showNotification:(BOOL)a4;
- (void)recomputePayLaterCardMagntiudesForAccountIdentifier:(id)a3;
- (void)registerObserver:(id)a3;
- (void)reprocessPayLaterFinancingPlansForMerchantCleanup:(id)a3;
- (void)resetAccountBalancesForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)resolveAccountStorefrontCountryMismatchForAccount:(id)a3 newCountryCode:(id)a4 completion:(id)a5;
- (void)rewardsTierSummaryForTransactionSourceIdentifiers:(id)a3 currencyCode:(id)a4 startDate:(id)a5 endDate:(id)a6 completion:(id)a7;
- (void)savingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)scheduleSetupReminderForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)scheduledPaymentsWithAccountIdentifier:(id)a3 includeFailedRecurringPayments:(BOOL)a4 allowFetchFromServer:(BOOL)a5 completion:(id)a6;
- (void)sendAccountReport:(id)a3 trigger:(unint64_t)a4 completion:(id)a5;
- (void)setAccountNotificationController:(id)a3;
- (void)setNeedsSyncToFinanceForAllTransactionsWithCompletion:(id)a3;
- (void)sharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)taxFormsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)termsWithIdentifier:(id)a3 accepted:(BOOL)a4 withAccountIdentifier:(id)a5 completion:(id)a6;
- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4;
- (void)unregisterObserver:(id)a3;
- (void)updateAccount:(id)a3 completion:(id)a4;
- (void)updateAccountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7;
- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 cooldownLevel:(unint64_t)a4 completion:(id)a5;
- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 completion:(id)a5;
- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 completion:(id)a5;
- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 observeCooldownPeriod:(BOOL)a4 completion:(id)a5;
- (void)updateAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 trigger:(unint64_t)a5 completion:(id)a6;
- (void)updateAccountUserNotificationSettings:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6;
- (void)updateAccountUserPreferences:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6;
- (void)updateAccountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)updateAccountWithIdentifier:(id)a3 extended:(BOOL)a4 completion:(id)a5;
- (void)updateAccountsWithCompletion:(id)a3;
- (void)updateCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateCreditStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateImpressionCount:(int64_t)a3 promotionProgramIdentifier:(id)a4 accountIdentifier:(id)a5 completion:(id)a6;
- (void)updateImpressionCountsForPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5;
- (void)updateLastUsedInAppFundingSource:(id)a3 accountIdentifier:(id)a4;
- (void)updateMockAccountWithAccount:(id)a3 completion:(id)a4;
- (void)updatePaymentFundingSourcesForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5;
- (void)updateSavingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateScheduledPaymentsWithAccount:(id)a3 completion:(id)a4;
- (void)updateSharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateTaxFormsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateUserInfoForAccountIdentifier:(id)a3 contact:(id)a4 completion:(id)a5;
- (void)updateVirtualCardsWithAccountIdentifier:(id)a3 completion:(id)a4;
- (void)updateWalletBadgeCount;
- (void)userInfoForAccountIdentifier:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5;
- (void)validateAppleBalanceSecurityRequirementsWithCompletion:(id)a3;
@end

@implementation PDAccountManager

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

- (PDAccountManager)initWithPushNotificationManager:(id)a3 paymentWebServiceCoordinator:(id)a4 databaseManager:(id)a5 userNotificationManager:(id)a6 payLaterMerchantProcessor:(id)a7 cloudStoreNotificationCoordinator:(id)a8 deviceEnvironmentStore:(id)a9 databaseRecreated:(BOOL)a10
{
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v19 = a5;
  id v137 = a6;
  id v138 = a7;
  id v136 = a7;
  id v135 = a8;
  id v134 = a9;
  v165.receiver = self;
  v165.super_class = (Class)PDAccountManager;
  v20 = [(PDAccountManager *)&v165 init];
  v21 = v20;
  if (v20)
  {
    id v131 = v19;
    id v127 = v18;
    id v128 = v17;
    v20->_databaseWillRestore = a10;
    v20->_lockPushTopics._os_unfair_lock_opaque = 0;
    if ((PKUIOnlyDemoModeEnabled() & 1) != 0 || PKStoreDemoModeEnabled())
    {
      v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      accounts = v21->_accounts;
      v21->_accounts = v22;
    }
    else
    {
      accounts = [v19 accounts];
      v24 = [accounts allObjects];
      uint64_t v25 = +[NSMutableArray arrayWithArray:v24];
      v26 = v21->_accounts;
      v21->_accounts = (NSMutableArray *)v25;
    }
    v27 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fetchRequests = v21->_fetchRequests;
    v21->_fetchRequests = v27;

    v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    currentRequests = v21->_currentRequests;
    v21->_currentRequests = v29;

    v31 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    decryptionRequests = v21->_decryptionRequests;
    v21->_decryptionRequests = v31;

    v21->_fetchRequestLock._os_unfair_lock_opaque = 0;
    v21->_backgroundProvisioningLock._os_unfair_lock_opaque = 0;
    v33 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    zoneCreationCompletions = v21->_zoneCreationCompletions;
    v21->_zoneCreationCompletions = v33;

    v21->_zoneCreationCompletionsLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v21->_userNotificationManager, a6);
    objc_storeStrong((id *)&v21->_pushNotificationManager, a3);
    objc_storeStrong((id *)&v21->_cloudStoreNotificationCoordinator, a8);
    p_databaseManager = (void **)&v21->_databaseManager;
    objc_storeStrong((id *)&v21->_databaseManager, a5);
    objc_storeStrong((id *)&v21->_deviceEnvironmentStore, a9);
    objc_storeStrong((id *)&v21->_paymentWebServiceCoordinator, obj);
    [(PDPaymentWebServiceCoordinator *)v21->_paymentWebServiceCoordinator registerObserver:v21];
    v36 = [(PDPaymentWebServiceCoordinator *)v21->_paymentWebServiceCoordinator sharedWebServiceContext];
    v37 = [v36 regions];

    id v38 = objc_alloc_init((Class)NSMutableDictionary);
    long long v161 = 0u;
    long long v162 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    id v39 = v37;
    id v40 = [v39 countByEnumeratingWithState:&v161 objects:v171 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = *(void *)v162;
      do
      {
        for (i = 0; i != v41; i = (char *)i + 1)
        {
          if (*(void *)v162 != v42) {
            objc_enumerationMutation(v39);
          }
          uint64_t v44 = *(void *)(*((void *)&v161 + 1) + 8 * i);
          v45 = [v39 objectForKey:v44];
          v46 = v45;
          if (v21->_hasAccounts) {
            unsigned __int8 v47 = 1;
          }
          else {
            unsigned __int8 v47 = [v45 hasAccounts];
          }
          v21->_hasAccounts = v47;
          v48 = [v46 accountServiceURL];
          if (v48) {
            [v38 setObject:v48 forKey:v44];
          }
        }
        id v41 = [v39 countByEnumeratingWithState:&v161 objects:v171 count:16];
      }
      while (v41);
    }

    v49 = (NSDictionary *)[v38 copy];
    accountServiceURLs = v21->_accountServiceURLs;
    v21->_accountServiceURLs = v49;

    [(PDDeviceEnvironmentStore *)v21->_deviceEnvironmentStore registerClient:v21 withIdentifier:1];
    v51 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v52 = dispatch_queue_create("com.apple.passd.accountmanager.work", v51);
    workQueue = v21->_workQueue;
    v21->_workQueue = (OS_dispatch_queue *)v52;

    v126 = v51;
    dispatch_queue_t v54 = dispatch_queue_create("com.apple.passd.accountmanager.reply", v51);
    replyQueue = v21->_replyQueue;
    v21->_replyQueue = (OS_dispatch_queue *)v54;

    [(PDPushNotificationManager *)v21->_pushNotificationManager registerConsumer:v21];
    [(PDAccountManager *)v21 _updatePushTopics];
    uint64_t v56 = +[NSHashTable pk_weakObjectsHashTableUsingPointerPersonality];
    observers = v21->_observers;
    v21->_observers = (NSHashTable *)v56;

    v21->_lockObservers._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v21->_payLaterMerchantProcessor, v138);
    [(PDPayLaterMerchantProcessor *)v21->_payLaterMerchantProcessor registerObserver:v21];
    id obja = v39;
    id v130 = v38;
    if ((PKUIOnlyDemoModeEnabled() & 1) != 0 || PKStoreDemoModeEnabled())
    {
      id v160 = 0;
      v58 = [(PDAccountManager *)v21 _mockCreditAccountInitialStateWithEvents:&v160];
      id v125 = v160;
      v129 = v58;
      v59 = [v58 associatedPassUniqueID];
      v60 = [(PDDatabaseManager *)v21->_databaseManager passWithUniqueIdentifier:v59];
      v61 = [v60 paymentPass];

      v124 = [(PDDatabaseManager *)v21->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v59];
      -[PDDatabaseManager transactionsForTransactionSourceIdentifiers:withTransactionType:withTransactionSource:withBackingData:startDate:endDate:limit:](v21->_databaseManager, "transactionsForTransactionSourceIdentifiers:withTransactionType:withTransactionSource:withBackingData:startDate:endDate:limit:", 0);
      long long v156 = 0u;
      long long v157 = 0u;
      long long v158 = 0u;
      long long v159 = 0u;
      id v139 = (id)objc_claimAutoreleasedReturnValue();
      id v62 = [v139 countByEnumeratingWithState:&v156 objects:v170 count:16];
      if (v62)
      {
        id v63 = v62;
        uint64_t v64 = *(void *)v157;
        do
        {
          for (j = 0; j != v63; j = (char *)j + 1)
          {
            if (*(void *)v157 != v64) {
              objc_enumerationMutation(v139);
            }
            uint64_t v66 = *(void *)(*((void *)&v156 + 1) + 8 * (void)j);
            v67 = *p_databaseManager;
            v68 = [v61 devicePrimaryPaymentApplication];
            id v69 = [v67 insertOrUpdatePaymentTransaction:v66 withPassUniqueIdentifier:v59 paymentApplication:v68 insertionMode:2 performTruncation:0 insertedTransaction:0];
          }
          id v63 = [v139 countByEnumeratingWithState:&v156 objects:v170 count:16];
        }
        while (v63);
      }
      v70 = *p_databaseManager;
      v71 = [v129 accountIdentifier];
      v72 = [v70 accountEventsForAccountIdentifier:v71 altDSID:0 types:&off_10078C300 startDate:0 endDate:0 orderedByDate:1 limit:0];

      long long v154 = 0u;
      long long v155 = 0u;
      long long v152 = 0u;
      long long v153 = 0u;
      id v73 = v72;
      id v74 = [v73 countByEnumeratingWithState:&v152 objects:v169 count:16];
      if (v74)
      {
        id v75 = v74;
        uint64_t v76 = *(void *)v153;
        do
        {
          for (k = 0; k != v75; k = (char *)k + 1)
          {
            if (*(void *)v153 != v76) {
              objc_enumerationMutation(v73);
            }
            v78 = *p_databaseManager;
            v79 = [*(id *)(*((void *)&v152 + 1) + 8 * (void)k) identifier];
            [v78 deleteAccountEventWithIdentifier:v79];
          }
          id v75 = [v73 countByEnumeratingWithState:&v152 objects:v169 count:16];
        }
        while (v75);
      }

      databaseManager = v21->_databaseManager;
      v81 = [v129 accountIdentifier];
      id v82 = [(PDDatabaseManager *)databaseManager insertOrUpdateAccountUsers:0 forAccountWithIdentifier:v81];

      v83 = v21->_databaseManager;
      v84 = [v129 accountIdentifier];
      id v85 = [(PDDatabaseManager *)v83 replacePhysicalCards:0 forAccountWithIdentifier:v84];

      v149[0] = _NSConcreteStackBlock;
      v149[1] = 3221225472;
      v149[2] = sub_100238E68;
      v149[3] = &unk_10072E198;
      v150 = v21;
      id v151 = v129;
      id v86 = v129;
      [(PDAccountManager *)v150 insertEvents:v125 completion:v149];

      id v38 = v130;
      id v39 = obja;
    }
    if (PKAppleBalanceDemoAccountEnabled())
    {
      v87 = +[PKAppleBalanceMockUtilities mockAppleBalanceAccount];
      v88 = v21->_databaseManager;
      v89 = [v87 accountIdentifier];
      id v90 = [(PDDatabaseManager *)v88 insertOrUpdateAccountUsers:0 forAccountWithIdentifier:v89];

      [(PDAccountManager *)v21 insertOrReplaceAccount:v87 extended:1 deleteSensitiveData:0 completion:0];
      id v39 = obja;
      v91 = +[PKAppleBalanceMockUtilities mockPromotion];
      v92 = [v87 accountIdentifier];
      [(PDAccountManager *)v21 insertOrUpdateAppleBalancePromotion:v91 accountIdentifier:v92 completion:0];
    }
    if (PKSavingsDemoAccountEnabled())
    {
      v93 = [(PDAccountManager *)v21 _mockSavingsAccount];
      v94 = v21->_databaseManager;
      v95 = [v93 accountIdentifier];
      id v96 = [(PDDatabaseManager *)v94 insertOrUpdateAccountUsers:0 forAccountWithIdentifier:v95];

      [(PDAccountManager *)v21 insertOrReplaceAccount:v93 extended:1 deleteSensitiveData:0 completion:0];
      v97 = v21->_databaseManager;
      id v140 = v93;
      v98 = [v93 accountIdentifier];
      [(PDDatabaseManager *)v97 deleteSavingsAccountStatementsForAccount:v98];

      id v99 = objc_alloc_init((Class)NSMutableArray);
      v100 = +[PKSavingsMockUtilities savingsAccountStatementsArray2];
      long long v145 = 0u;
      long long v146 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      id v101 = [v100 countByEnumeratingWithState:&v145 objects:v168 count:16];
      if (v101)
      {
        id v102 = v101;
        uint64_t v103 = *(void *)v146;
        do
        {
          for (m = 0; m != v102; m = (char *)m + 1)
          {
            if (*(void *)v146 != v103) {
              objc_enumerationMutation(v100);
            }
            id v105 = [objc_alloc((Class)PKSavingsAccountStatement) initWithDictionary:*(void *)(*((void *)&v145 + 1) + 8 * (void)m)];
            [v99 addObject:v105];
          }
          id v102 = [v100 countByEnumeratingWithState:&v145 objects:v168 count:16];
        }
        while (v102);
      }
      v106 = *p_databaseManager;
      v107 = [v140 accountIdentifier];
      [v106 insertOrUpdateSavingsAccountStatements:v99 forAccountIdentifier:v107];

      v108 = *p_databaseManager;
      v109 = [v140 accountIdentifier];
      [v108 deleteAccountTaxFormsWithoutPDFForAccount:v109];

      id v110 = objc_alloc_init((Class)NSMutableArray);
      v111 = +[PKSavingsMockUtilities savingsAccountTaxFormsArray2];
      long long v141 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      id v112 = [v111 countByEnumeratingWithState:&v141 objects:v167 count:16];
      if (v112)
      {
        id v113 = v112;
        uint64_t v114 = *(void *)v142;
        do
        {
          for (n = 0; n != v113; n = (char *)n + 1)
          {
            if (*(void *)v142 != v114) {
              objc_enumerationMutation(v111);
            }
            id v116 = [objc_alloc((Class)PKAccountTaxForm) initWithDictionary:*(void *)(*((void *)&v141 + 1) + 8 * (void)n)];
            [v110 addObject:v116];
          }
          id v113 = [v111 countByEnumeratingWithState:&v141 objects:v167 count:16];
        }
        while (v113);
      }
      v117 = *p_databaseManager;
      v118 = [v140 accountIdentifier];
      [v117 insertOrUpdateAccountTaxForms:v110 forAccountIdentifier:v118];

      v119 = +[PKSavingsMockUtilities transfer];
      v120 = *p_databaseManager;
      v166 = v119;
      v121 = +[NSArray arrayWithObjects:&v166 count:1];
      id v122 = [v120 setTransfers:v121 forAccount:v140];

      id v38 = v130;
      id v39 = obja;
    }
    else
    {
      [(PDAccountManager *)v21 deleteLocalAccountWithIdentifier:@"savings-account-mock" completion:0];
    }

    id v18 = v127;
    id v17 = v128;
    id v19 = v131;
  }

  return v21;
}

- (void)dealloc
{
  [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PDAccountManager;
  [(PDAccountManager *)&v3 dealloc];
}

- (void)_paymentWebServiceContextChanged
{
  objc_super v3 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Payment Web Service context changed in PDAccountManager", buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002390FC;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(workQueue, block);
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
    v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100239748;
    v8[3] = &unk_10072FDC8;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

- (void)databaseRestored
{
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002398B8;
  block[3] = &unk_10072E1E8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (void)_queue_mergeAccounts:(id)a3 featureFailures:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v84 = v6;
  id v76 = [v6 mutableCopy];
  id v74 = objc_alloc_init((Class)NSMutableArray);
  id v78 = objc_alloc_init((Class)NSMutableArray);
  id v75 = objc_alloc_init((Class)NSMutableArray);
  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v115 = 0u;
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  v89 = self;
  id obj = self->_accounts;
  id v9 = [(NSMutableArray *)obj countByEnumeratingWithState:&v115 objects:v134 count:16];
  v83 = v7;
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v116;
    uint64_t v79 = *(void *)v116;
    v81 = v8;
    do
    {
      v12 = 0;
      id v85 = v10;
      do
      {
        if (*(void *)v116 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v115 + 1) + 8 * (void)v12);
        v14 = objc_msgSend(v7, "errorForFeature:", objc_msgSend(v13, "feature"));
        if (v14)
        {
          [v8 addObject:v13];
        }
        else
        {
          long long v113 = 0u;
          long long v114 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          id v15 = v84;
          id v16 = [v15 countByEnumeratingWithState:&v111 objects:v133 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v112;
LABEL_10:
            uint64_t v19 = 0;
            while (1)
            {
              if (*(void *)v112 != v18) {
                objc_enumerationMutation(v15);
              }
              v20 = *(void **)(*((void *)&v111 + 1) + 8 * v19);
              v21 = [v13 accountIdentifier];
              v22 = [v20 accountIdentifier];
              id v23 = v21;
              id v24 = v22;
              if (v23 == v24) {
                break;
              }
              uint64_t v25 = v24;
              if (v23 && v24)
              {
                unsigned __int8 v26 = [v23 isEqualToString:v24];

                if (v26) {
                  goto LABEL_23;
                }
              }
              else
              {
              }
              if (v17 == (id)++v19)
              {
                id v17 = [v15 countByEnumeratingWithState:&v111 objects:v133 count:16];
                if (v17) {
                  goto LABEL_10;
                }
                goto LABEL_21;
              }
            }

LABEL_23:
            id v27 = v20;

            if (!v27) {
              goto LABEL_26;
            }
            [v76 removeObject:v27];
            id v8 = v81;
            id v10 = v85;
            if ([v27 state] == (id)5)
            {
              [v78 addObject:v13];
              goto LABEL_30;
            }
            [v81 addObject:v27];
            v29 = [v13 transactionSourceIdentifier];
            [v27 setTransactionSourceIdentifier:v29];

            uint64_t v11 = v79;
            v14 = 0;
            if (([v27 isContentEqualToAccount:v13] & 1) == 0)
            {
              v132[0] = v13;
              v132[1] = v27;
              v30 = +[NSArray arrayWithObjects:v132 count:2];
              [v75 addObject:v30];
            }
            id v7 = v83;
          }
          else
          {
LABEL_21:

LABEL_26:
            id v8 = v81;
            id v10 = v85;
            if ([v13 isCloudAccount]) {
              v28 = v81;
            }
            else {
              v28 = v78;
            }
            [v28 addObject:v13];
            id v27 = 0;
LABEL_30:
            id v7 = v83;
            uint64_t v11 = v79;
            v14 = 0;
          }
        }
        v12 = (char *)v12 + 1;
      }
      while (v12 != v10);
      id v31 = [(NSMutableArray *)obj countByEnumeratingWithState:&v115 objects:v134 count:16];
      id v10 = v31;
    }
    while (v31);
  }

  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id v32 = v76;
  id v33 = [v32 countByEnumeratingWithState:&v107 objects:v131 count:16];
  if (v33)
  {
    id v34 = v33;
    uint64_t v35 = *(void *)v108;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v108 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void **)(*((void *)&v107 + 1) + 8 * i);
        if ([v37 state] != (id)5)
        {
          [v74 addObject:v37];
          [v8 addObject:v37];
        }
      }
      id v34 = [v32 countByEnumeratingWithState:&v107 objects:v131 count:16];
    }
    while (v34);
  }

  uint64_t v38 = +[NSDate date];
  long long v103 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v39 = v8;
  id v40 = [v39 countByEnumeratingWithState:&v103 objects:v130 count:16];
  if (v40)
  {
    id v41 = v40;
    uint64_t v42 = *(void *)v104;
    do
    {
      for (j = 0; j != v41; j = (char *)j + 1)
      {
        if (*(void *)v104 != v42) {
          objc_enumerationMutation(v39);
        }
        [*(id *)(*((void *)&v103 + 1) + 8 * (void)j) setLastUpdated:v38];
      }
      id v41 = [v39 countByEnumeratingWithState:&v103 objects:v130 count:16];
    }
    while (v41);
  }
  v80 = (void *)v38;
  id v82 = v32;

  v77 = v39;
  uint64_t v44 = [(PDDatabaseManager *)v89->_databaseManager setAccounts:v39];
  uint64_t v45 = +[NSMutableArray arrayWithArray:v44];
  accounts = v89->_accounts;
  v89->_accounts = (NSMutableArray *)v45;

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id v86 = v74;
  id v90 = [v86 countByEnumeratingWithState:&v99 objects:v129 count:16];
  if (v90)
  {
    id obja = *(id *)v100;
    do
    {
      for (k = 0; k != v90; k = (char *)k + 1)
      {
        if (*(id *)v100 != obja) {
          objc_enumerationMutation(v86);
        }
        v48 = *(void **)(*((void *)&v99 + 1) + 8 * (void)k);
        long long v95 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        long long v98 = 0u;
        v49 = v89->_accounts;
        id v50 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v95 objects:v128 count:16];
        if (v50)
        {
          id v51 = v50;
          uint64_t v52 = *(void *)v96;
          do
          {
            for (m = 0; m != v51; m = (char *)m + 1)
            {
              if (*(void *)v96 != v52) {
                objc_enumerationMutation(v49);
              }
              dispatch_queue_t v54 = *(void **)(*((void *)&v95 + 1) + 8 * (void)m);
              v55 = [v54 accountIdentifier];
              uint64_t v56 = [v48 accountIdentifier];
              id v57 = v55;
              id v58 = v56;
              if (v57 == v58)
              {

LABEL_73:
                id v57 = [v54 transactionSourceIdentifier];
                [v48 setTransactionSourceIdentifier:v57];
LABEL_74:

                continue;
              }
              v59 = v58;
              if (v57) {
                BOOL v60 = v58 == 0;
              }
              else {
                BOOL v60 = 1;
              }
              if (v60)
              {

                goto LABEL_74;
              }
              unsigned __int8 v61 = [v57 isEqualToString:v58];

              if (v61) {
                goto LABEL_73;
              }
            }
            id v51 = [(NSMutableArray *)v49 countByEnumeratingWithState:&v95 objects:v128 count:16];
          }
          while (v51);
        }
      }
      id v90 = [v86 countByEnumeratingWithState:&v99 objects:v129 count:16];
    }
    while (v90);
  }

  id v62 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
  {
    id v63 = [(NSMutableArray *)v89->_accounts count];
    id v64 = [v86 count];
    id v65 = [v78 count];
    id v66 = [v75 count];
    *(_DWORD *)buf = 134218752;
    id v121 = v63;
    __int16 v122 = 2048;
    id v123 = v64;
    __int16 v124 = 2048;
    id v125 = v65;
    __int16 v126 = 2048;
    id v127 = v66;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Accounts merged, total accounts: %lu, added: %lu, deleted: %lu, changed: %lu", buf, 0x2Au);
  }

  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v67 = v89->_accounts;
  id v68 = [(NSMutableArray *)v67 countByEnumeratingWithState:&v91 objects:v119 count:16];
  if (v68)
  {
    id v69 = v68;
    uint64_t v70 = *(void *)v92;
    do
    {
      for (n = 0; n != v69; n = (char *)n + 1)
      {
        if (*(void *)v92 != v70) {
          objc_enumerationMutation(v67);
        }
        v72 = *(void **)(*((void *)&v91 + 1) + 8 * (void)n);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          id v73 = [v72 accountIdentifier];
          *(_DWORD *)buf = 138412546;
          id v121 = v73;
          __int16 v122 = 2112;
          id v123 = v72;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Account %@: %@", buf, 0x16u);
        }
      }
      id v69 = [(NSMutableArray *)v67 countByEnumeratingWithState:&v91 objects:v119 count:16];
    }
    while (v69);
  }

  [(PDAccountManager *)v89 _processAddedAccounts:v86];
  [(PDAccountManager *)v89 _processDeletedAccounts:v78];
  [(PDAccountManager *)v89 _processChangedAccounts:v75];
  if ([v86 count] || objc_msgSend(v78, "count") || objc_msgSend(v75, "count")) {
    [(PDAccountManager *)v89 postAccountChangedNotification];
  }
}

- (void)mergeAccounts:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10023A3DC;
  block[3] = &unk_10072E9D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)insertOrReplaceAccount:(id)a3 extended:(BOOL)a4 deleteSensitiveData:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  if (v10)
  {
    workQueue = self->_workQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10023A574;
    v13[3] = &unk_100741DF8;
    v13[4] = self;
    id v14 = v10;
    BOOL v16 = a4;
    BOOL v17 = a5;
    id v15 = v11;
    dispatch_async(workQueue, v13);
  }
}

- (id)_queue_insertOrReplaceAccount:(id)a3 extended:(BOOL)a4 deleteSensitiveData:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = [v8 accountIdentifier];
  unint64_t v10 = [(PDAccountManager *)self _queueIndexOfAccountWithIdentifier:v9];

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v11 = [(PDDatabaseManager *)self->_databaseManager insertOrUpdateAccount:v8];
    if (!v11)
    {
      id v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = [v8 accountIdentifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to save account %@ in database.", buf, 0xCu);
      }
      id v11 = v8;
    }
    [(NSMutableArray *)self->_accounts addObject:v11];
    id v33 = v11;
    id v14 = +[NSArray arrayWithObjects:&v33 count:1];
    [(PDAccountManager *)self _processAddedAccounts:v14];
    id v15 = 0;
  }
  else
  {
    id v15 = [(NSMutableArray *)self->_accounts objectAtIndex:v10];
    if (!a4 && [v8 supportsExtendedFetch])
    {
      BOOL v16 = [v8 creditDetails];
      BOOL v17 = [v15 creditDetails];
      uint64_t v18 = v17;
      if (v16 && v17)
      {
        uint64_t v19 = [v17 virtualCards];
        [v16 setVirtualCards:v19];

        v20 = [v18 installmentPlans];
        [v16 setInstallmentPlans:v20];

        v21 = [v16 accountSummary];
        v22 = [v18 accountSummary];
        objc_msgSend(v21, "setAutoPayEnabled:", objc_msgSend(v22, "autoPayEnabled"));

        id v23 = [v16 accountSummary];
        id v24 = [v18 accountSummary];
        uint64_t v25 = [v24 currentStatement];
        [v23 setCurrentStatement:v25];
      }
    }
    if ([v15 isEqual:v8])
    {
      id v11 = 0;
      goto LABEL_24;
    }
    databaseManager = self->_databaseManager;
    if (v5) {
      [(PDDatabaseManager *)databaseManager deleteVirtualCardEncryptedDataForAccount:v8];
    }
    else {
    id v11 = [(PDDatabaseManager *)databaseManager insertOrUpdateAccount:v8];
    }
    if (!v11)
    {
      id v27 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = [v8 accountIdentifier];
        *(_DWORD *)buf = 138412290;
        uint64_t v35 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Failed to save account %@ in database.", buf, 0xCu);
      }
      id v11 = v8;
    }
    [(NSMutableArray *)self->_accounts replaceObjectAtIndex:v10 withObject:v11];
    v31[0] = v15;
    v31[1] = v11;
    id v14 = +[NSArray arrayWithObjects:v31 count:2];
    id v32 = v14;
    v29 = +[NSArray arrayWithObjects:&v32 count:1];
    [(PDAccountManager *)self _processChangedAccounts:v29];
  }
  [(PDAccountManager *)self postAccountChangedNotification];
LABEL_24:

  return v11;
}

- (void)deleteLocalAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10023AABC;
    block[3] = &unk_10072E9D8;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)insertOrUpdateLocalAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10023AD20;
    v9[3] = &unk_100731830;
    id v11 = v7;
    v9[4] = self;
    id v10 = v6;
    [(PDAccountManager *)self insertOrReplaceAccount:v10 extended:1 deleteSensitiveData:0 completion:v9];
  }
  else if (v7)
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)insertOrUpdateLocalFinancingPlans:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10023AF94;
    v11[3] = &unk_100741E20;
    v11[4] = self;
    id v12 = v10;
    [(PDAccountManager *)self insertOrUpdateLocalAccountFinancingPlans:v8 forAccountWithIdentifier:v9 completion:v11];
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)setNeedsSyncToFinanceForAllTransactionsWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10023B0F4;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)noteAccountDeletionWithCompletion:(id)a3
{
  id v6 = a3;
  +[PKVirtualCard deleteAllLocalKeychainVirtualCards];
  id v4 = dispatch_get_global_queue(-32768, 0);
  PKForceRefreshBAACertificateAndKey();

  id v5 = +[PKPaymentSession startApplePayTrustSessionWithCompletion:&stru_100741E80];
  [(PDAccountManager *)self deleteAccountsWithCompletion:v6];
}

- (void)deleteAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10023B438;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)updateMockAccountWithAccount:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((PKUIOnlyDemoModeEnabled() & 1) != 0 || PKStoreDemoModeEnabled())
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10023B5C4;
    v8[3] = &unk_100731830;
    id v10 = v7;
    void v8[4] = self;
    id v9 = v6;
    [(PDAccountManager *)self insertOrReplaceAccount:v9 extended:1 deleteSensitiveData:0 completion:v8];
  }
}

- (void)_queue_deleteAccounts
{
  id v3 = [(NSMutableArray *)self->_accounts copy];
  [(PDDatabaseManager *)self->_databaseManager deleteAllAccounts];
  [(NSMutableArray *)self->_accounts removeAllObjects];
  [(PDAccountManager *)self postAccountChangedNotification];
  [(PDAccountManager *)self _processDeletedAccounts:v3];
}

- (void)_processAddedAccounts:(id)a3
{
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_10023BBF4;
  v38[3] = &unk_100741EA8;
  id v4 = a3;
  id v39 = v4;
  id v40 = self;
  [(PDAccountManager *)self _accessObserversWithHandler:v38];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        id v10 = [v9 accountIdentifier];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10023BD24;
        v32[3] = &unk_100741ED0;
        id v11 = v10;
        id v33 = v11;
        [(PDAccountManager *)self userInfoForAccountIdentifier:v11 forceFetch:0 completion:v32];
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_10023BDE8;
        v30[3] = &unk_100741EF8;
        id v12 = v11;
        id v31 = v12;
        [(PDAccountManager *)self updateScheduledPaymentsWithAccount:v9 completion:v30];
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_10023BEAC;
        v28[3] = &unk_100741F20;
        id v13 = v12;
        id v29 = v13;
        [(PDAccountManager *)self updatePhysicalCardsForAccountWithIdentifier:v13 force:0 completion:v28];
        if ([v9 isSharedAccount])
        {
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_10023BF70;
          v26[3] = &unk_100741F48;
          id v14 = v13;
          id v27 = v14;
          [(PDAccountManager *)self updateSharedAccountCloudStoreWithAccountIdentifier:v14 completion:v26];
          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_10023C034;
          v24[3] = &unk_100741F20;
          id v25 = v14;
          [(PDAccountManager *)self updateAccountUsersForAccountWithIdentifier:v25 completion:v24];
        }
        id v15 = [v9 feature];
        if (v15 == (id)5)
        {
          [(PDAccountManager *)self _cleanupSavingsAccountPreferences:v9];
        }
        else if (v15 == (id)2)
        {
          if ([v9 showCardPromotions])
          {
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_10023C0F8;
            v22[3] = &unk_100741EF8;
            id v23 = v13;
            [(PDAccountManager *)self updateAccountPromotionsForAccountWithIdentifier:v23 completion:v22];
          }
          if ([v9 showEnhancedMerchants])
          {
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_10023C1BC;
            v20[3] = &unk_100741EF8;
            id v21 = v13;
            [(PDAccountManager *)self updateAccountEnhancedMerchantsForAccountWithIdentifier:v21 completion:v20];
          }
        }
        BOOL v16 = [v9 creditDetails];
        BOOL v17 = [v16 accountSummary];
        uint64_t v18 = [v17 currentStatement];

        if (v18) {
          [(PDAccountManager *)self _publishStatementsChangedForAccountIdentifier:v13];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    }
    while (v6);
  }

  if ([obj count]) {
    [(PDAccountManager *)self _updatePushTopics];
  }
}

- (void)_processChangedAccounts:(id)a3
{
  v144[0] = _NSConcreteStackBlock;
  v144[1] = 3221225472;
  v144[2] = sub_10023CEF0;
  v144[3] = &unk_100741EA8;
  id v4 = a3;
  id v145 = v4;
  long long v146 = self;
  long long v106 = self;
  [(PDAccountManager *)self _accessObserversWithHandler:v144];
  long long v142 = 0u;
  long long v143 = 0u;
  long long v140 = 0u;
  long long v141 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v140 objects:v153 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v141;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v141 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v140 + 1) + 8 * i);
        if ([v10 count] == (id)2)
        {
          id v11 = [v10 objectAtIndexedSubscript:0];
          id v12 = [v10 objectAtIndexedSubscript:1];
          id v13 = [v11 creditDetails];
          id v14 = [v13 accountSummary];
          id v15 = [v14 currentStatement];

          BOOL v16 = [v12 creditDetails];
          BOOL v17 = [v16 accountSummary];
          uint64_t v18 = [v17 currentStatement];

          if ((PKEqualObjects() & 1) == 0)
          {
            uint64_t v19 = [v18 accountIdentifier];
            [(PDAccountManager *)v106 _publishStatementsChangedForAccountIdentifier:v19];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v140 objects:v153 count:16];
    }
    while (v7);
  }

  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  id obj = v5;
  id v20 = [obj countByEnumeratingWithState:&v136 objects:v152 count:16];
  if (v20)
  {
    id v22 = v20;
    uint64_t v23 = *(void *)v137;
    long long v91 = v118;
    long long v92 = v121;
    uint64_t v93 = PKAccountVirtualCardIdentifierKey;
    v89 = v112;
    id v90 = v115;
    v88 = v109;
    *(void *)&long long v21 = 138412290;
    long long v87 = v21;
    uint64_t v94 = *(void *)v137;
    do
    {
      id v24 = 0;
      id v95 = v22;
      do
      {
        if (*(void *)v137 != v23) {
          objc_enumerationMutation(obj);
        }
        id v25 = *(void **)(*((void *)&v136 + 1) + 8 * (void)v24);
        if (objc_msgSend(v25, "count", v87, v88, v89, v90, v91, v92) == (id)2)
        {
          unsigned __int8 v26 = [v25 objectAtIndexedSubscript:0];
          id v27 = [v25 objectAtIndexedSubscript:1];
          databaseManager = v106->_databaseManager;
          id v29 = [v27 associatedPassUniqueID];
          [(PDDatabaseManager *)databaseManager recomputeCategoryVisualizationMagnitudesForPassUniqueID:v29 withStyle:0];

          v30 = [v27 creditDetails];
          id v31 = [v30 virtualCards];

          long long v107 = v26;
          id v32 = [v26 creditDetails];
          id v33 = [v32 virtualCards];

          long long v34 = [v31 valueForKey:v93];
          long long v35 = [v33 valueForKey:v93];
          long long v105 = v27;
          [v27 state];
          long long v102 = v33;
          long long v103 = v24;
          long long v101 = v35;
          if (PKAccountStateIsTerminal()
            && ([v107 state], (PKAccountStateIsTerminal() & 1) == 0))
          {
            long long v134 = 0u;
            long long v135 = 0u;
            long long v132 = 0u;
            long long v133 = 0u;
            id v78 = v33;
            id v79 = [v78 countByEnumeratingWithState:&v132 objects:v151 count:16];
            if (v79)
            {
              id v80 = v79;
              uint64_t v81 = *(void *)v133;
              do
              {
                for (j = 0; j != v80; j = (char *)j + 1)
                {
                  if (*(void *)v133 != v81) {
                    objc_enumerationMutation(v78);
                  }
                  v83 = *(void **)(*((void *)&v132 + 1) + 8 * (void)j);
                  v84 = [v83 keychainVirtualCard];

                  if (v84)
                  {
                    id v85 = PKLogFacilityTypeGetObject();
                    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "Account in terminal state: removing virtual card from Keychain", buf, 2u);
                    }

                    [v83 deleteKeychainVirtualCard];
                  }
                }
                id v80 = [v78 countByEnumeratingWithState:&v132 objects:v151 count:16];
              }
              while (v80);
            }

            if ([v105 feature] == (id)5)
            {
              [(PDAccountManager *)v106 _cleanupSavingsAccountPreferences:v105];
              PKSavingsSetHasDismissedClosedAccountMessage();
            }
          }
          else
          {
            if ([v35 isEqualToSet:v34])
            {
              long long v126 = 0u;
              long long v127 = 0u;
              long long v124 = 0u;
              long long v125 = 0u;
              id v36 = v33;
              id v37 = [v36 countByEnumeratingWithState:&v124 objects:v149 count:16];
              if (v37)
              {
                id v38 = v37;
                uint64_t v39 = *(void *)v125;
                do
                {
                  for (k = 0; k != v38; k = (char *)k + 1)
                  {
                    if (*(void *)v125 != v39) {
                      objc_enumerationMutation(v36);
                    }
                    id v41 = *(void **)(*((void *)&v124 + 1) + 8 * (void)k);
                    v123[0] = _NSConcreteStackBlock;
                    v123[1] = 3221225472;
                    v123[2] = sub_10023D064;
                    v123[3] = &unk_100741F70;
                    v123[4] = v41;
                    uint64_t v42 = objc_msgSend(v31, "pk_anyObjectPassingTest:", v123);
                    if ([v41 hasSensitiveCredentials])
                    {
                      [v42 supportsLocalStorage];
                    }
                    else
                    {
                      unsigned __int8 v43 = [v42 hasSensitiveCredentials];
                      if ([v42 supportsLocalStorage] && (v43 & 1) == 0)
                      {
                        uint64_t v44 = [v41 identifier];
                        uint64_t v45 = [v107 accountIdentifier];
                        [(PDAccountManager *)v106 performVirtualCardAction:1 forVirtualCardIdentifier:v44 forAccountIdentifier:v45 completion:&stru_100741FB0];
                      }
                    }
                  }
                  id v38 = [v36 countByEnumeratingWithState:&v124 objects:v149 count:16];
                }
                while (v38);
              }
            }
            else
            {
              v46 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Reconciling deletion of virtual cards in keychain", buf, 2u);
              }

              long long v130 = 0u;
              long long v131 = 0u;
              long long v128 = 0u;
              long long v129 = 0u;
              id v36 = v33;
              id v47 = [v36 countByEnumeratingWithState:&v128 objects:v150 count:16];
              if (v47)
              {
                id v48 = v47;
                uint64_t v49 = *(void *)v129;
                do
                {
                  for (m = 0; m != v48; m = (char *)m + 1)
                  {
                    if (*(void *)v129 != v49) {
                      objc_enumerationMutation(v36);
                    }
                    id v51 = *(void **)(*((void *)&v128 + 1) + 8 * (void)m);
                    uint64_t v52 = [v51 identifier];
                    if ([v34 containsObject:v52])
                    {
                    }
                    else
                    {
                      v53 = [v51 keychainVirtualCard];

                      if (v53) {
                        [v51 deleteKeychainVirtualCard];
                      }
                    }
                  }
                  id v48 = [v36 countByEnumeratingWithState:&v128 objects:v150 count:16];
                }
                while (v48);
              }
            }
          }
          dispatch_queue_t v54 = [v107 creditDetails];
          v55 = [v105 creditDetails];
          id v97 = [v107 state];
          id v104 = [v105 state];
          uint64_t v56 = [v54 cardBalance];
          id v57 = [v55 cardBalance];
          unsigned int v99 = [v56 isEqual:v57];

          id v58 = [v54 accountSummary];
          v59 = [v58 creditLimit];
          BOOL v60 = [v55 accountSummary];
          unsigned __int8 v61 = [v60 creditLimit];
          unsigned int v62 = [v59 isEqual:v61];

          if (!v99 || !v62 || v97 != v104)
          {
            CFStringRef v63 = @"State Changed";
            if (v97 == v104) {
              CFStringRef v63 = 0;
            }
            if (!v62) {
              CFStringRef v63 = @"Limit Changed";
            }
            if (v99) {
              CFStringRef v64 = v63;
            }
            else {
              CFStringRef v64 = @"Balance Changed";
            }
            id v65 = PDUtilityQueue();
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            v121[0] = sub_10023D168;
            v121[1] = &unk_10072E1E8;
            __int16 v122 = (__CFString *)v64;
            dispatch_async(v65, block);
          }
          long long v100 = v54;
          id v66 = [v54 accountSummary];
          unsigned int v67 = [v66 recoveryPaymentPlansSupported];

          long long v98 = v55;
          id v68 = [v55 accountSummary];
          unsigned int v69 = [v68 recoveryPaymentPlansSupported];

          int v70 = v67 ^ 1;
          uint64_t v23 = v94;
          id v22 = v95;
          id v24 = v103;
          if (((v67 ^ 1) & v69 & 1) != 0 || v97 != v104)
          {
            v71 = [v105 accountIdentifier];
            v117[0] = _NSConcreteStackBlock;
            v117[1] = 3221225472;
            v118[0] = sub_10023D18C;
            v118[1] = &unk_100741EF8;
            id v119 = v105;
            [(PDAccountManager *)v106 _updateCreditRecoveryPaymentPlansForAccountIdentifier:v71 force:1 completion:v117];
          }
          if (((v70 | v69) & 1) == 0)
          {
            v114[0] = _NSConcreteStackBlock;
            v114[1] = 3221225472;
            v115[0] = sub_10023D270;
            v115[1] = &unk_100741EA8;
            v115[2] = v106;
            id v116 = v105;
            [(PDAccountManager *)v106 _accessObserversWithHandler:v114];
          }
          unsigned __int8 v72 = [v107 isSharedAccount];
          unsigned int v73 = [v105 isSharedAccount];
          if ((v72 & 1) == 0 && v73)
          {
            id v74 = [v105 accountIdentifier];
            id v75 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v87;
              id v148 = v74;
              _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Updating shared account cloud store for account %@ since it just became a shared account", buf, 0xCu);
            }

            v111[0] = _NSConcreteStackBlock;
            v111[1] = 3221225472;
            v112[0] = sub_10023D2E8;
            v112[1] = &unk_100741F48;
            id v76 = v74;
            id v113 = v76;
            [(PDAccountManager *)v106 updateSharedAccountCloudStoreWithAccountIdentifier:v76 completion:v111];
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v87;
              id v148 = v76;
              _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Updating account users of account %@ since it just became a shared account", buf, 0xCu);
            }

            v108[0] = _NSConcreteStackBlock;
            v108[1] = 3221225472;
            v109[0] = sub_10023D3AC;
            v109[1] = &unk_100741F20;
            id v110 = v76;
            id v77 = v76;
            [(PDAccountManager *)v106 updateAccountUsersForAccountWithIdentifier:v77 completion:v108];
          }
        }
        id v24 = (char *)v24 + 1;
      }
      while (v24 != v22);
      id v86 = [obj countByEnumeratingWithState:&v136 objects:v152 count:16];
      id v22 = v86;
    }
    while (v86);
  }

  if ([obj count]) {
    [(PDAccountManager *)v106 _updatePushTopics];
  }
}

- (void)_processDeletedAccounts:(id)a3
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10023D65C;
  v19[3] = &unk_100741EA8;
  id v4 = a3;
  id v20 = v4;
  long long v21 = self;
  [(PDAccountManager *)self _accessObserversWithHandler:v19];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "feature", (void)v15) == (id)5) {
          [(PDAccountManager *)self _cleanupSavingsAccountPreferences:0];
        }
        id v11 = [v10 creditDetails];
        id v12 = [v11 accountSummary];
        id v13 = [v12 currentStatement];

        if (v13)
        {
          id v14 = [v10 accountIdentifier];
          [(PDAccountManager *)self _publishStatementsChangedForAccountIdentifier:v14];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v22 count:16];
    }
    while (v7);
  }

  if ([v5 count]) {
    [(PDAccountManager *)self _updatePushTopics];
  }
}

- (void)dailyCashNotificationForStartDate:(id)a3 endDate:(id)a4 accountIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v13)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10023D89C;
    v15[3] = &unk_100742000;
    v15[4] = self;
    id v19 = v13;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    [(PDAccountManager *)self accountWithIdentifier:v18 completion:v15];
  }
}

- (id)_promoRewardsMerchantNamesFromDate:(id)a3 toDate:(id)a4 accountIdentifier:(id)a5 altDSID:(id)a6 rewardPercentage:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v49 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v15 = +[NSDecimalNumber zero];
  id v40 = v14;
  uint64_t v42 = v12;
  unsigned __int8 v43 = v11;
  [(PDDatabaseManager *)self->_databaseManager accountEventsForAccountIdentifier:v13 altDSID:v14 types:&off_10078C318 startDate:v11 endDate:v12 orderedByDate:1 limit:0];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v46 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  id v16 = 0;
  if (!v46)
  {
    id v17 = (void *)v15;
    goto LABEL_33;
  }
  uint64_t v45 = *(void *)v60;
  id v50 = self;
  id v51 = v13;
  id v17 = (void *)v15;
  do
  {
    uint64_t v18 = 0;
    do
    {
      if (*(void *)v60 != v45) {
        objc_enumerationMutation(obj);
      }
      uint64_t v48 = v18;
      v53 = *(void **)(*((void *)&v59 + 1) + 8 * v18);
      id v19 = [v53 items];
      id v20 = [v19 anyObject];

      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v47 = v20;
      id v54 = [v20 transactionIdentifiers];
      id v21 = [v54 countByEnumeratingWithState:&v55 objects:v63 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v56;
        uint64_t v52 = *(void *)v56;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v56 != v23) {
              objc_enumerationMutation(v54);
            }
            id v25 = [(PDDatabaseManager *)self->_databaseManager transactionWithServiceIdentifier:*(void *)(*((void *)&v55 + 1) + 8 * i) accountIdentifier:v13 accountType:2];
            unsigned __int8 v26 = v25;
            if (v25)
            {
              id v27 = [v25 rewards];
              if (([v27 containsItemOfType:5] & 1) != 0
                || [v27 containsItemOfType:1])
              {
                v28 = [v53 date];
                id v29 = v28;
                if (!v16 || [v28 compare:v16] == (id)1)
                {
                  id v30 = v29;

                  id v16 = v30;
                }
                id v31 = [v27 totalEligibleValueForUnit:1];
                id v32 = +[NSDecimalNumber zero];

                if (v17 == v32)
                {
                  id v33 = v31;
LABEL_21:
                  id v34 = v33;
                }
                else
                {
                  if (v17 != v31)
                  {
                    id v33 = +[NSDecimalNumber notANumber];
                    goto LABEL_21;
                  }
                  id v34 = v17;
                }
                long long v35 = [v26 merchant];
                id v36 = [v35 displayName];

                if (v36) {
                  [v49 addObject:v36];
                }

                self = v50;
                id v13 = v51;
                id v17 = v34;
                uint64_t v23 = v52;
              }
            }
          }
          id v22 = [v54 countByEnumeratingWithState:&v55 objects:v63 count:16];
        }
        while (v22);
      }

      uint64_t v18 = v48 + 1;
    }
    while ((id)(v48 + 1) != v46);
    id v46 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  }
  while (v46);
LABEL_33:

  if (a7) {
    objc_storeStrong(a7, v17);
  }
  id v37 = [v49 copy];

  return v37;
}

- (id)_rewardsAmountFromDate:(id)a3 toDate:(id)a4 accountIdentifier:(id)a5 altDSID:(id)a6 rewardTypes:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = +[NSDecimalNumber zero];
  id v43 = objc_alloc_init((Class)NSMutableSet);
  id v38 = v14;
  id v40 = v13;
  id v41 = v12;
  uint64_t v42 = v11;
  id v16 = [(PDDatabaseManager *)self->_databaseManager accountEventsForAccountIdentifier:v13 altDSID:v14 types:&off_10078C330 startDate:v11 endDate:v12 orderedByDate:1 limit:0];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v17 = [v16 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v44 = 0;
    uint64_t v19 = *(void *)v46;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v46 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        id v22 = [v21 items];
        uint64_t v23 = [v22 anyObject];

        if (v23)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v24 = [v23 status];
            if (v24 == @"success"
              || (id v25 = v24) != 0
              && (unsigned int v26 = [(__CFString *)v24 isEqualToString:@"success"],
                  v25,
                  v25,
                  v26))
            {
              id v27 = [v23 currencyAmount];
              v28 = [v27 amount];

              if (v28)
              {
                uint64_t v29 = [v15 decimalNumberByAdding:v28];

                id v30 = [v21 date];
                id v31 = v30;
                if (!v44 || [v30 compare:v44] == (id)1)
                {
                  id v32 = v31;

                  uint64_t v44 = v32;
                }
                id v33 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v23 type]);
                objc_msgSend(v43, "pk_safelyAddObject:", v33);

                uint64_t v15 = (void *)v29;
              }
            }
          }
        }
      }
      id v18 = [v16 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v18);
  }
  else
  {
    uint64_t v44 = 0;
  }

  id v34 = [v43 count];
  if (a7 && v34) {
    *a7 = [v43 copy];
  }
  id v35 = v15;

  return v35;
}

- (void)accountsAreInDirtyStateWithCompletion:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10023E7C4;
  v7[3] = &unk_10072FDC8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)_accountsAreInDirtyWithFeatureFailures:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10023EA9C;
  block[3] = &unk_10072E9D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)accountIsInDirtyStateWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10023EDA0;
  block[3] = &unk_10072E9D8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (unint64_t)_queueIndexOfAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_accounts count])
  {
    unint64_t v5 = 0;
    while (1)
    {
      id v6 = [(NSMutableArray *)self->_accounts objectAtIndex:v5];
      id v7 = [v6 accountIdentifier];
      unsigned __int8 v8 = [v4 isEqualToString:v7];

      if (v8) {
        break;
      }
      if (++v5 >= (unint64_t)[(NSMutableArray *)self->_accounts count]) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (void)postAccountChangedNotification
{
  id v2 = +[NSDistributedNotificationCenter defaultCenter];
  [v2 postNotificationName:PKAccountServiceAccountsChangedDistributedNotification object:0];
}

- (BOOL)_accountSupportsTransactionsWithoutPass:(id)a3
{
  return [a3 type] == (id)4;
}

- (id)_mockCreditAccountInitialStateWithEvents:(id *)a3
{
  id v3 = objc_alloc_init((Class)PKAccount);
  [v3 setAccountIdentifier:@"1234567890"];
  [v3 setSharedAccount:1];
  id v4 = PKCurrentUserAltDSID();
  [v3 setAltDSID:v4];

  [v3 setFeature:2];
  [v3 setType:1];
  [v3 setState:1];
  id v91 = v3;
  [v3 setAccessLevel:1];
  unint64_t v5 = +[NSDate date];
  [v3 setLastUpdated:v5];

  id v6 = objc_alloc_init((Class)PKCreditAccountDetails);
  id v7 = +[NSDate dateWithTimeIntervalSinceNow:-7257600.0];
  [v6 setCreatedDate:v7];

  [v6 setCountryCode:@"US"];
  [v6 setCurrencyCode:@"USD"];
  unsigned __int8 v8 = +[NSTimeZone timeZoneWithName:@"America/New_York"];
  [v6 setProductTimeZone:v8];

  [v6 setCardType:3];
  [v6 setAssociatedPassTypeIdentifier:@"paymentpass.com.apple.wallet.dev"];
  id v95 = v6;
  [v6 setAssociatedPassSerialNumber:@"00001111122223333444332211113344321"];
  id v9 = objc_alloc_init((Class)PKVirtualCard);
  id v10 = +[NSUUID UUID];
  id v11 = [v10 UUIDString];
  [v9 setIdentifier:v11];

  [v9 setCardholderName:@"John Appleseed"];
  [v9 setState:1];
  [v9 setType:1];
  [v9 setFPANSuffix:@"5619"];
  [v9 setExpiration:@"03/27"];
  [v9 setHasDynamicSecurityCode:1];
  id v12 = +[NSUUID UUID];
  id v13 = [v12 UUIDString];
  [v9 setSecurityCodeIdentifier:v13];

  id v14 = +[NSDate dateWithTimeIntervalSinceNow:3600.0];
  [v9 setSecurityCodeExpiration:v14];

  uint64_t v15 = +[NSDate date];
  [v9 setLastUpdatedDate:v15];

  v88 = v9;
  id v16 = +[NSSet setWithObject:v9];
  [v6 setVirtualCards:v16];

  id v17 = objc_alloc_init((Class)PKCreditAccountSummary);
  id v18 = +[NSDecimalNumber decimalNumberWithString:@"10000.00"];
  [v17 setCreditLimit:v18];

  uint64_t v19 = +[NSDecimalNumber decimalNumberWithString:@"8317.45"];
  [v17 setAvailableCredit:v19];

  id v20 = +[NSDecimalNumber decimalNumberWithString:@"1682.55"];
  [v17 setCurrentBalance:v20];

  id v21 = +[NSDecimalNumber zero];
  [v17 setRewardsBalance:v21];

  id v22 = +[NSDecimalNumber decimalNumberWithString:@"1243.45"];
  [v17 setRemainingStatementBalance:v22];

  uint64_t v23 = +[NSDecimalNumber decimalNumberWithString:@"25.00"];
  [v17 setRemainingMinimumPayment:v23];

  id v24 = +[NSDate date];
  id v25 = PKEndOfMonth();
  [v17 setPaymentDueDate:v25];

  [v17 setLastPaymentDate:0];
  [v17 setAutoPayEnabled:0];
  [v17 setCyclesPastDue:0];
  [v17 setBalanceStatus:1];
  [v17 setRequiresDebtCollectionNotices:0];
  unsigned int v26 = +[NSDecimalNumber zero];
  [v17 setUnpostedInterest:v26];

  [v17 setUnpostedInterestTimestamp:0];
  [v17 setInGrace:1];
  id v27 = +[NSDecimalNumber zero];
  [v17 setChargeOffPreventionAmount:v27];

  v28 = +[NSDecimalNumber zero];
  [v17 setPastDueAmount:v28];

  id v29 = objc_alloc_init((Class)PKCreditAccountBalanceSummary);
  id v30 = +[NSDate date];
  [v29 setOpeningDate:v30];

  id v31 = +[NSDate date];
  id v32 = PKEndOfMonth();
  [v29 setClosingDate:v32];

  id v33 = +[NSDecimalNumber decimalNumberWithString:@"5317.45"];
  [v29 setPurchases:v33];

  id v34 = +[NSDecimalNumber zero];
  [v29 setPendingPurchases:v34];

  id v35 = +[NSDecimalNumber zero];
  [v29 setBalanceTransfers:v35];

  id v36 = +[NSDecimalNumber zero];
  [v29 setInterestCharged:v36];

  id v37 = +[NSDecimalNumber zero];
  [v29 setFeesCharged:v37];

  id v38 = +[NSDecimalNumber decimalNumberWithString:@"1576.16"];
  [v29 setPaymentsAndCredits:v38];

  uint64_t v39 = +[NSDecimalNumber zero];
  [v29 setRewardsEarned:v39];

  id v40 = +[NSDecimalNumber zero];
  [v29 setRewardsRedeemed:v40];

  uint64_t v94 = v17;
  long long v87 = v29;
  [v17 setBalanceSummary:v29];
  id v41 = objc_alloc_init((Class)PKCreditAccountStatement);
  uint64_t v42 = +[NSUUID UUID];
  id v43 = [v42 UUIDString];
  [v41 setIdentifier:v43];

  uint64_t v44 = +[NSDate date];
  long long v45 = PKStartOfMonth();
  [v41 setOpeningDate:v45];

  long long v46 = +[NSDate date];
  long long v47 = PKEndOfMonth();
  [v41 setClosingDate:v47];

  long long v48 = +[NSDate date];
  id v49 = PKEndOfNextMonth();
  [v41 setPaymentDueDate:v49];

  [v41 setCurrencyCode:@"USD"];
  id v50 = +[NSDecimalNumber decimalNumberWithString:@"1243.45"];
  [v41 setStatementBalance:v50];

  id v51 = +[NSDecimalNumber decimalNumberWithString:@"10.00"];
  [v41 setMinimumDue:v51];

  uint64_t v52 = +[NSDecimalNumber decimalNumberWithString:@"1576.16"];
  [v41 setPurchases:v52];

  v53 = +[NSDecimalNumber zero];
  [v41 setFeesCharged:v53];

  id v54 = +[NSDecimalNumber decimalNumberWithString:@"20.00"];
  [v41 setInterestCharged:v54];

  long long v55 = +[NSDecimalNumber zero];
  [v41 setBalanceTransfers:v55];

  long long v56 = +[NSDecimalNumber zero];
  [v41 setPaymentsAndCredits:v56];

  long long v57 = +[NSDecimalNumber zero];
  [v41 setRewardsBalance:v57];

  long long v58 = +[NSDecimalNumber zero];
  [v41 setRewardsEarned:v58];

  long long v59 = +[NSDecimalNumber zero];
  [v41 setRewardsRedeemed:v59];

  long long v60 = +[NSDecimalNumber zero];
  [v41 setRewardsYTD:v60];

  long long v61 = +[NSDecimalNumber zero];
  [v41 setRewardsLifetime:v61];

  v84 = v41;
  [v17 setCurrentStatement:v41];
  id v93 = objc_alloc_init((Class)PKCreditAccountRates);
  long long v62 = +[NSDecimalNumber decimalNumberWithString:@".1824"];
  [v93 setAprForPurchases:v62];

  id v63 = objc_alloc_init((Class)PKCreditAccountFeatureDescriptor);
  [v63 setIdentifier:PKCreditAccountFeatureDescriptorIdentifierSchedulePayment];
  CFStringRef v64 = +[NSDecimalNumber decimalNumberWithString:@"0.01"];
  [v63 setMinimumAmount:v64];

  id v65 = +[NSDecimalNumber decimalNumberWithString:@"100000"];
  [v63 setMaximumAmount:v65];

  [v63 setMerchantIdentifier:@"com.apple.creditservices"];
  v98[0] = PKPaymentNetworkVisa;
  v98[1] = PKPaymentNetworkMasterCard;
  v98[2] = PKPaymentNetworkAmex;
  v98[3] = PKPaymentNetworkDiscover;
  id v66 = +[NSArray arrayWithObjects:v98 count:4];
  [v63 setSupportedNetworks:v66];

  [v63 setMerchantCapabilities:8];
  [v63 setPaymentFundingSourceTypes:3];
  [v63 setPaymentFrequencies:0];
  [v63 setPaymentTermsIdentifier:0];
  id v92 = objc_alloc_init((Class)PKCreditAccountFeatureDescriptor);
  [v92 setIdentifier:PKCreditAccountFeatureDescriptorIdentifierShowAccountSummary];
  id v67 = objc_alloc_init((Class)PKCreditAccountFeatureDescriptor);
  [v67 setIdentifier:PKCreditAccountFeatureDescriptorIdentifierScheduleRecurringPayments];
  id v68 = +[NSDecimalNumber decimalNumberWithString:@"0.01"];
  [v67 setMinimumAmount:v68];

  unsigned int v69 = +[NSDecimalNumber decimalNumberWithString:@"100000"];
  [v67 setMaximumAmount:v69];

  [v67 setMerchantIdentifier:@"com.apple.creditservices"];
  v97[0] = PKPaymentNetworkVisa;
  v97[1] = PKPaymentNetworkMasterCard;
  v97[2] = PKPaymentNetworkAmex;
  v97[3] = PKPaymentNetworkDiscover;
  int v70 = +[NSArray arrayWithObjects:v97 count:4];
  [v67 setSupportedNetworks:v70];

  [v67 setMerchantCapabilities:8];
  [v67 setPaymentFundingSourceTypes:3];
  [v67 setPaymentFrequencies:0];
  [v67 setPaymentTermsIdentifier:0];
  id v71 = objc_alloc_init((Class)PKCreditAccountFeatureDescriptor);
  [v71 setIdentifier:PKAccountFeatureDescriptorIdentifierAddFundingSource];
  id v72 = objc_alloc_init((Class)PKCreditAccountFeatureDescriptor);
  [v72 setIdentifier:PKCreditAccountFeatureDescriptorIdentifierShowVirtualCard];
  id v73 = objc_alloc_init((Class)PKCreditAccountFeatureDescriptor);
  [v73 setIdentifier:PKCreditAccountFeatureDescriptorIdentifierDynamicSecurityCodes];
  id v74 = objc_alloc_init((Class)PKCreditAccountFeatureDescriptor);
  [v74 setIdentifier:PKAccountFeatureDescriptorIdentifierShowNotifications];
  id v75 = objc_alloc_init((Class)PKCreditAccountFeatureDescriptor);
  [v75 setIdentifier:PKCreditAccountFeatureDescriptorIdentifierRedeemRewards];
  [v75 setSupportedDestinations:&off_10078C348];
  id v76 = +[NSDecimalNumber decimalNumberWithString:@"1.15"];
  [v75 setSavingsAPY:v76];

  [v95 setAccountSummary:v94];
  [v95 setRates:v93];
  id v77 = [objc_alloc((Class)PKAccountDetails) initWithCreditDetails:v95];
  [v91 setDetails:v77];

  id v85 = v73;
  id v86 = v71;
  id v78 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v63, v92, v67, v71, v72, v73, v74, v75, 0);
  [v91 setSupportedFeatures:v78];

  id v79 = [v91 creditDetails];
  id v96 = 0;
  id v80 = [(PDAccountManager *)self _mockInstallmentForAccount:v91 events:&v96];
  id v81 = v96;
  id v82 = +[NSSet setWithObject:v80];
  [v79 setInstallmentPlans:v82];

  if (a3) {
    *a3 = v81;
  }

  return v91;
}

- (id)_mockAccountUsers
{
  id v2 = PKCurrentUserAltDSID();
  if (v2)
  {
    id v3 = objc_alloc_init((Class)PKAccountUser);
    [v3 setFirstName:@"Lani"];
    [v3 setLastName:@"Martinez"];
    [v3 setAppleID:@"ars.im027@icloud.com"];
    id v4 = [v3 appleID];
    unint64_t v5 = +[NSSet setWithObject:v4];
    [v3 setAddressableHandles:v5];

    [v3 setAltDSID:v2];
    [v3 setAccessLevel:1];
    [v3 setAccountState:1];
    id v6 = objc_alloc_init((Class)PKAccountUser);
    [v6 setFirstName:@"Tu"];
    [v6 setLastName:@"Nguyen"];
    [v6 setAppleID:@"ars.im010@icloud.com"];
    id v7 = [v6 appleID];
    unsigned __int8 v8 = +[NSSet setWithObject:v7];
    [v6 setAddressableHandles:v8];

    id v9 = +[NSString stringWithFormat:@"%@-2", v2];
    [v6 setAltDSID:v9];

    [v6 setAccessLevel:1];
    [v6 setAccountState:1];
    id v10 = objc_alloc_init((Class)PKAccountUser);
    [v10 setFirstName:@"Tamara"];
    [v10 setLastName:@"Nguyen"];
    [v10 setAppleID:@"ars.im029@icloud.com"];
    id v11 = [v10 appleID];
    id v12 = +[NSSet setWithObject:v11];
    [v10 setAddressableHandles:v12];

    id v13 = +[NSString stringWithFormat:@"%@-3", v2];
    [v10 setAltDSID:v13];

    [v10 setAccessLevel:2];
    [v10 setAccountState:1];
    id v14 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v3, v6, v10, 0);
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (id)_mockPhysicalCards
{
  id v2 = PKCurrentUserAltDSID();
  if (v2)
  {
    id v3 = objc_alloc_init((Class)PKPhysicalCard);
    id v4 = +[NSUUID UUID];
    unint64_t v5 = [v4 UUIDString];
    [v3 setIdentifier:v5];

    [v3 setState:2];
    [v3 setNameOnCard:@"John Appleseed"];
    [v3 setFPANSuffix:@"1234"];
    [v3 setAccountUserAltDSID:v2];
    id v6 = +[NSDate date];
    [v3 setLastUpdated:v6];

    id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v3, 0);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)_mockInstallmentForAccount:(id)a3 events:(id *)a4
{
  id v70 = a3;
  unint64_t v5 = PKNumberInstallmentDemoPayments();
  id v67 = a4;
  id v68 = v5;
  if (v5) {
    uint64_t v6 = (uint64_t)[v5 integerValue];
  }
  else {
    uint64_t v6 = 4;
  }
  if ((v6 & (unint64_t)~(v6 >> 63)) >= 0x18) {
    uint64_t v7 = 24;
  }
  else {
    uint64_t v7 = v6 & ~(v6 >> 63);
  }
  unsigned __int8 v8 = [v70 creditDetails];
  id v9 = [v8 currencyCode];

  id v10 = [v70 creditDetails];
  id v11 = [v10 currencyCode];
  id v12 = @"USD";
  if (v11) {
    id v12 = v9;
  }
  id v75 = v12;

  id v13 = +[NSDate date];
  id v14 = +[NSCalendar autoupdatingCurrentCalendar];
  id v15 = objc_alloc_init((Class)NSDateComponents);
  [v15 setHour:-10];
  id v73 = v14;
  id v66 = v15;
  id v71 = [v14 dateByAddingComponents:v15 toDate:v13 options:0];

  id v16 = +[NSDecimalNumber decimalNumberWithString:@"31.20"];
  unint64_t v72 = v7;
  id v17 = +[NSNumber numberWithInteger:v7];
  id v18 = v17;
  if (v17)
  {
    [v17 decimalValue];
  }
  else
  {
    v79[0] = 0;
    v79[1] = 0;
    int v80 = 0;
  }
  uint64_t v19 = +[NSDecimalNumber decimalNumberWithDecimal:v79];
  uint64_t v20 = [v16 decimalNumberByMultiplyingBy:v19];

  id v21 = objc_alloc_init((Class)PKCreditInstallmentPlan);
  [v21 setIdentifier:@"demo-installment-plan-id1"];
  [v21 setState:2];
  [v21 setDuration:24];
  [v21 setCurrencyCode:v75];
  id v22 = +[NSDecimalNumber decimalNumberWithString:@"749.60"];
  [v21 setTotalAmount:v22];

  uint64_t v23 = +[NSDecimalNumber decimalNumberWithString:@"749.60"];
  [v21 setTotalProductAmount:v23];

  [v21 setPeriodType:1];
  id v24 = +[NSDecimalNumber zero];
  [v21 setApr:v24];

  id v25 = objc_alloc_init((Class)PKInstallmentPlanSummary);
  unsigned int v26 = +[NSDecimalNumber decimalNumberWithString:@"1100"];
  [v25 setCurrentBalance:v26];

  [v25 setCurrencyCode:v75];
  id v65 = v16;
  [v25 setMinimumDue:v16];
  id v63 = (void *)v20;
  [v25 setPaymentsToDateAmount:v20];
  long long v62 = v25;
  [v21 setSummary:v25];
  id v27 = objc_alloc_init((Class)PKInstallmentPlanMerchant);
  [v27 setIdentifier:@"demo-installment-merchant-id1"];
  [v27 setName:@"Apple Store"];
  [v27 setCategoryCode:2842];
  [v27 setCity:@"Cupertino"];
  [v27 setState:@"CA"];
  [v27 setPostalCode:@"95014"];
  [v27 setCountry:@"US"];
  long long v61 = v27;
  [v21 setMerchant:v27];
  id v28 = objc_alloc_init((Class)PKCreditInstallmentPlanProduct);
  [v28 setIdentifier:@"demo-installment-product-id1"];
  [v28 setModel:@"iPhone 11 Pro"];
  [v28 setCapacity:@"128GB"];
  [v28 setColor:@"Space Grey"];
  [v28 setUpgradeEligible:1];
  [v28 setWarrantyYears:2];
  id v29 = +[NSSet setWithObject:@"AppleCare+"];
  [v28 setFeatures:v29];

  id v30 = PKSerialNumber();
  [v28 setSerialNumber:v30];

  [v28 setIconURLs:&off_10078C610];
  [v28 setSplashImageURLs:&off_10078C638];
  long long v60 = v28;
  [v21 setProduct:v28];
  id v31 = objc_alloc_init((Class)PKCreditInstallmentPlanLineItem);
  [v31 setType:1];
  id v32 = +[NSDecimalNumber decimalNumberWithString:@"1100"];
  [v31 setAmount:v32];

  [v31 setDuration:24];
  long long v59 = v31;
  id v84 = v31;
  id v33 = +[NSArray arrayWithObjects:&v84 count:1];
  [v21 setLineItems:v33];

  id v34 = [v70 creditDetails];
  CFStringRef v64 = v21;
  id v35 = +[NSSet setWithObject:v21];
  [v34 setInstallmentPlans:v35];

  id v69 = objc_alloc_init((Class)NSMutableSet);
  id v74 = objc_alloc_init((Class)NSMutableArray);
  for (unint64_t i = 0; i != 24; ++i)
  {
    id v37 = objc_alloc_init((Class)NSDateComponents);
    [v37 setMonth:i - v72];
    id v76 = v37;
    id v38 = [v73 dateByAddingComponents:v37 toDate:v71 options:0];
    uint64_t v39 = PKEndOfMonth();
    id v78 = PKStartOfMonth();
    id v77 = PKStartOfNextMonth();
    id v40 = 0;
    id v41 = 0;
    if (i < v72)
    {
      id v41 = +[NSString stringWithFormat:@"demo-installment-statement-id%ld", i];
      v82[0] = @"identifier";
      v82[1] = @"statementBalance";
      v83[0] = v41;
      v83[1] = @"1325";
      v82[2] = @"minimumDue";
      v82[3] = @"purchases";
      v83[2] = @"25";
      v83[3] = @"1300";
      v82[4] = @"balanceTransfers";
      v82[5] = @"interestCharged";
      v83[4] = @"0.0";
      v83[5] = @"12.3";
      v82[6] = @"feesCharged";
      v82[7] = @"paymentsAndCredits";
      v83[6] = @"0.0";
      v83[7] = @"425";
      v82[8] = @"rewardsBalance";
      v82[9] = @"rewardsEarned";
      v83[8] = @"2.56";
      v83[9] = @"6.7";
      v82[10] = @"rewardsRedeemed";
      v82[11] = @"rewardsYTD";
      v83[10] = @"12.4";
      v83[11] = @"76.4";
      v82[12] = @"rewardsLifetime";
      v82[13] = @"currencyCode";
      v83[12] = @"120.4";
      v83[13] = v75;
      uint64_t v42 = +[NSDictionary dictionaryWithObjects:v83 forKeys:v82 count:14];
      id v40 = [objc_alloc((Class)PKCreditAccountStatement) initWithDictionary:v42];
      [v40 setClosingDate:v39];
      [v40 setOpeningDate:v78];
      [v40 setPaymentDueDate:v77];
      id v43 = objc_alloc_init((Class)PKAccountEvent);
      [v43 setType:3];
      uint64_t v44 = +[NSUUID UUID];
      long long v45 = [v44 UUIDString];
      [v43 setIdentifier:v45];

      long long v46 = [v70 accountIdentifier];
      [v43 setAccountIdentifier:v46];

      long long v47 = +[NSSet setWithObject:v40];
      [v43 setItems:v47];

      long long v48 = [v39 dateByAddingTimeInterval:600.0];
      [v43 setDate:v48];

      id v49 = +[NSUUID UUID];
      id v50 = [v49 UUIDString];
      [v43 setIdentifier:v50];

      [v69 addObject:v43];
    }
    id v51 = objc_alloc_init((Class)PKCreditInstallmentPlanPayment);
    uint64_t v52 = +[NSString stringWithFormat:@"demo-installment-payment-id%ld", i];
    if (i > 4)
    {
      v53 = 0;
    }
    else
    {
      v53 = +[NSDecimalNumber decimalNumberWithString:@"31.20"];
    }
    [v51 setIdentifier:v52];
    [v51 setStatementIdentifier:v41];
    [v51 setStatement:v40];
    [v51 setCurrencyCode:v75];
    id v54 = +[NSDecimalNumber decimalNumberWithString:@"31.20"];
    [v51 setAmountDue:v54];

    [v51 setAmountPaid:v53];
    [v51 setDueDate:v39];
    id v55 = objc_alloc_init((Class)PKCreditInstallmentPlanLineItem);
    [v55 setType:1];
    long long v56 = +[NSDecimalNumber decimalNumberWithString:@"31.20"];
    [v55 setAmount:v56];

    [v55 setDuration:24];
    id v81 = v55;
    long long v57 = +[NSArray arrayWithObjects:&v81 count:1];
    [v51 setLineItems:v57];

    [v74 addObject:v51];
  }
  [v64 setPayments:v74];
  if (v67) {
    id *v67 = [v69 copy];
  }

  return v64;
}

- (id)_mockSavingsAccount
{
  id v2 = objc_alloc_init((Class)PKAccount);
  [v2 setAccountIdentifier:@"savings-account-mock"];
  [v2 setFeature:5];
  [v2 setType:4];
  [v2 setState:1];
  [v2 setAccessLevel:1];
  id v3 = +[NSDate date];
  id v37 = v2;
  [v2 setLastUpdated:v3];

  id v4 = objc_alloc_init((Class)PKSavingsAccountDetails);
  unint64_t v5 = +[NSDate date];
  [v4 setLastUpdatedDate:v5];

  uint64_t v6 = +[NSDate dateWithTimeIntervalSinceNow:-7257600.0];
  [v4 setCreatedDate:v6];

  [v4 setCountryCode:@"US"];
  [v4 setCurrencyCode:@"USD"];
  [v4 setRoutingNumber:@"121202211"];
  [v4 setAccountNumber:@"927392017351"];
  uint64_t v7 = +[NSTimeZone timeZoneWithName:@"America/New_York"];
  [v4 setProductTimeZone:v7];

  [v4 setTermsAcceptanceRequired:0];
  unsigned __int8 v8 = +[NSURL URLWithString:@"https://www.apple.com"];
  [v4 setPrivacyPolicyURL:v8];

  [v4 setBusinessChatIdentifier:@"1234567890-1234567890-1234567890"];
  id v9 = +[NSURL URLWithString:@"https://www.apple.com"];
  [v4 setContactWebsite:v9];

  [v4 setContactNumber:@"1-877-255-5923"];
  [v4 setTermsIdentifier:@"someTermsIdentifier"];
  id v10 = objc_alloc_init((Class)PKSavingsAccountSummary);
  id v11 = +[NSDecimalNumber decimalNumberWithString:@"510.00"];
  [v10 setCurrentBalance:v11];

  id v12 = +[NSDecimalNumber decimalNumberWithString:@"500.00"];
  [v10 setAvailableBalance:v12];

  id v13 = +[NSDecimalNumber decimalNumberWithString:@"12.55"];
  [v10 setPendingBalance:v13];

  id v14 = +[NSDecimalNumber decimalNumberWithString:@"85.32"];
  [v10 setInterestYTD:v14];

  id v15 = +[NSDecimalNumber decimalNumberWithString:@"263.29"];
  [v10 setInterestTotal:v15];

  id v16 = +[NSDecimalNumber decimalNumberWithString:@"1.05"];
  [v10 setAPY:v16];

  id v38 = v4;
  [v4 setAccountSummary:v10];
  id v17 = [objc_alloc((Class)PKAccountDetails) initWithSavingsDetails:v4];
  [v2 setDetails:v17];

  id v36 = objc_alloc_init((Class)PKSavingsAccountFeatureDescriptor);
  [v36 setIdentifier:PKSavingsAccountFeatureDescriptorIdentifierViewTaxDocuments];
  id v18 = objc_alloc_init((Class)PKSavingsAccountFeatureDescriptor);
  [v18 setIdentifier:PKSavingsAccountFeatureDescriptorIdentifierShowAccountSummary];
  id v19 = objc_alloc_init((Class)PKSavingsAccountFeatureDescriptor);
  [v19 setIdentifier:PKSavingsAccountFeatureDescriptorIdentifierOneTimeDeposit];
  uint64_t v20 = +[NSDecimalNumber decimalNumberWithString:@"0.01"];
  [v19 setMinimumAmount:v20];

  id v21 = +[NSDecimalNumber decimalNumberWithString:@"250000"];
  [v19 setMaximumAmount:v21];

  [v19 setTransferTermsIdentifier:@"123-2421445-25745-24124"];
  [v19 setFundingSourceTypes:3];
  [v19 setTransferFrequencies:2];
  id v22 = objc_alloc_init((Class)PKSavingsAccountFeatureDescriptor);
  [v22 setIdentifier:PKSavingsAccountFeatureDescriptorIdentifierOneTimeWithdrawal];
  uint64_t v23 = +[NSDecimalNumber decimalNumberWithString:@"0.01"];
  [v22 setMinimumAmount:v23];

  id v24 = +[NSDecimalNumber decimalNumberWithString:@"250000"];
  [v22 setMaximumAmount:v24];

  [v22 setTransferTermsIdentifier:@"123-2421445-25745-24124"];
  [v22 setFundingSourceTypes:3];
  [v22 setTransferFrequencies:2];
  id v25 = objc_alloc_init((Class)PKSavingsAccountFeatureDescriptor);
  [v25 setIdentifier:PKSavingsAccountFeatureDescriptorIdentifierOneTimeDepositWithAppleCash];
  unsigned int v26 = +[NSDecimalNumber decimalNumberWithString:@"1.00"];
  [v25 setMinimumAmount:v26];

  id v27 = +[NSDecimalNumber decimalNumberWithString:@"10000"];
  [v25 setMaximumAmount:v27];

  [v25 setTransferTermsIdentifier:@"123-2421445-25745-24124"];
  [v25 setFundingSourceTypes:2];
  [v25 setTransferFrequencies:2];
  id v28 = objc_alloc_init((Class)PKSavingsAccountFeatureDescriptor);
  [v28 setIdentifier:PKSavingsAccountFeatureDescriptorIdentifierOneTimeWithdrawalWithAppleCash];
  id v29 = +[NSDecimalNumber decimalNumberWithString:@"1.00"];
  [v28 setMinimumAmount:v29];

  id v30 = +[NSDecimalNumber decimalNumberWithString:@"10000"];
  [v28 setMaximumAmount:v30];

  [v28 setTransferTermsIdentifier:@"123-2421445-25745-24124"];
  [v28 setFundingSourceTypes:2];
  [v28 setTransferFrequencies:2];
  id v31 = objc_alloc_init((Class)PKSavingsAccountFeatureDescriptor);
  [v31 setIdentifier:PKSavingsAccountFeatureDescriptorIdentifierExportTransactionData];
  [v31 setSupportedFileFormatsForTransactionData:&off_10078C360];
  id v32 = objc_alloc_init((Class)PKSavingsAccountFeatureDescriptor);
  [v32 setIdentifier:PKSavingsAccountFeatureDescriptorIdentifierViewStatement];
  id v33 = +[NSMutableSet setWithObjects:](NSMutableSet, "setWithObjects:", v36, v18, v19, v22, v25, v28, v31, v32, 0);
  id v34 = [v33 copy];
  [v37 setSupportedFeatures:v34];

  return v37;
}

- (void)passAdded:(id)a3
{
  id v4 = [a3 associatedAccountServiceAccountIdentifier];
  unint64_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100241390;
    v6[3] = &unk_10072E750;
    v6[4] = self;
    id v7 = v4;
    [(PDAccountManager *)self accountWithIdentifier:v7 completion:v6];
  }
}

- (void)passRemoved:(id)a3
{
  id v4 = [a3 associatedAccountServiceAccountIdentifier];
  unint64_t v5 = v4;
  if (v4)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100241608;
    v12[3] = &unk_10072E1E8;
    id v6 = v4;
    id v13 = v6;
    [(PDAccountManager *)self deleteVirtualCardEncryptedDataForAccountIdentifier:v6 completion:v12];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002416B4;
    v10[3] = &unk_10072E1E8;
    id v7 = v6;
    id v11 = v7;
    [(PDAccountManager *)self deleteFinancingPlansForAccountIdentifier:v7 completion:v10];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100241760;
    v8[3] = &unk_10072E750;
    void v8[4] = self;
    id v9 = v7;
    [(PDAccountManager *)self accountWithIdentifier:v9 completion:v8];
  }
}

- (void)accountsForProvisioningWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100241C24;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, v7);
  }
}

- (void)accountsWithPassLocallyProvisionedWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100242184;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, v7);
  }
}

- (void)accountsWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    workQueue = self->_workQueue;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10024241C;
    v7[3] = &unk_10072FDC8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(workQueue, v7);
  }
}

- (void)accountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100242698;
    block[3] = &unk_10072E9D8;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (id)_queue_accountWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  unint64_t v5 = self->_accounts;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (unint64_t i = 0; i != v6; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "accountIdentifier", (void)v15);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        id v11 = v4;
        id v12 = v11;
        if (v10 == v11)
        {

LABEL_16:
          id v6 = [v9 copy];
          goto LABEL_17;
        }
        if (v4 && v10)
        {
          unsigned __int8 v13 = [v10 isEqualToString:v11];

          if (v13) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v6;
}

- (void)accountsForFeature:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100242A78;
    v8[3] = &unk_100742028;
    unint64_t v10 = a3;
    id v9 = v6;
    [(PDAccountManager *)self accountsWithCompletion:v8];
  }
}

- (void)accountWithVirtualCardIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100242C98;
    block[3] = &unk_10072E9D8;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)accountForPassWithUniqueID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100242F04;
    block[3] = &unk_10072E9D8;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)updateAccount:(id)a3 completion:(id)a4
{
}

- (void)updateAccountsWithCompletion:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    unint64_t v5 = objc_alloc_init(PDAccountManagerAllAccountsRequest);
    [(PDAccountManagerAllAccountsRequest *)v5 addCompletion:v4];

    [(PDAccountManager *)self _addAccountManagerFetchRequest:v5];
  }
}

- (void)_managerFetch_updateAccountsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating accounts", buf, 2u);
  }

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100243490;
  v36[3] = &unk_100731538;
  id v9 = v7;
  v36[4] = self;
  id v37 = v9;
  id v10 = objc_retainBlock(v36);
  if ((PKUIOnlyDemoModeEnabled() & 1) != 0 || PKStoreDemoModeEnabled())
  {
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100243554;
    v34[3] = &unk_1007346F0;
    v34[4] = self;
    id v35 = v10;
    id v11 = v10;
    [(PDAccountManager *)self accountsWithCompletion:v34];
  }
  else
  {
    id v12 = [(NSMutableArray *)self->_accounts count];
    v32[0] = 0;
    v32[1] = v32;
    v32[2] = 0x2020000000;
    char v33 = 0;
    *(void *)buf = 0;
    id v27 = buf;
    uint64_t v28 = 0x3032000000;
    id v29 = sub_100020A5C;
    id v30 = sub_100021020;
    id v31 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = sub_100020A5C;
    void v24[4] = sub_100021020;
    id v25 = 0;
    id v13 = objc_alloc_init((Class)NSMutableArray);
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100243750;
    block[3] = &unk_100742168;
    block[4] = self;
    id v18 = v13;
    id v21 = v24;
    id v22 = buf;
    BOOL v23 = v12 != 0;
    id v19 = v10;
    uint64_t v20 = v32;
    long long v15 = v10;
    id v16 = v13;
    dispatch_async(workQueue, block);

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(v32, 8);
  }
}

- (void)updateAccountWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)updateAccountWithIdentifier:(id)a3 extended:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (v8)
    {
      workQueue = self->_workQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1002443A8;
      v12[3] = &unk_100730238;
      void v12[4] = self;
      id v13 = v8;
      BOOL v15 = a4;
      id v14 = v9;
      dispatch_async(workQueue, v12);
    }
    else
    {
      id v11 = +[NSError errorWithDomain:PKAccountErrorDomain code:3 userInfo:0];
      (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v11);
    }
  }
}

- (void)lastUsedInAppFundingSourceForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  unint64_t v5 = (void (**)(id, void *))a4;
  if (v5)
  {
    if (v7)
    {
      id v6 = PDLastUsedInAppFundingSourceForAccountIdentifier();
      v5[2](v5, v6);
    }
    else
    {
      v5[2](v5, 0);
    }
  }
}

- (void)updateLastUsedInAppFundingSource:(id)a3 accountIdentifier:(id)a4
{
  if (a4) {
    _PDSetLastUsedInAppFundingSource(a4, a3);
  }
}

- (void)updateAccountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)_updateAccountUsersForAccountWithIdentifier:(id)a3 fromPush:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[PDAccountManagerUsersRequest alloc] initWithAccountIdentifier:v9 fromPush:v5];

  [(PDAccountManagerUsersRequest *)v10 addCompletion:v8];
  [(PDAccountManager *)self _addAccountManagerFetchRequest:v10];
}

- (BOOL)_shouldProactivelyFetchAccountUsersForAccount:(id)a3 users:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v7)
  {
    id v8 = v7;
    char v9 = 0;
    id v10 = 0;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(v6);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        unsigned __int8 v14 = [v13 isDirty];
        if (!v10
          || ([v13 lastUpdated],
              BOOL v15 = objc_claimAutoreleasedReturnValue(),
              [v15 timeIntervalSinceDate:v10],
              double v17 = v16,
              v15,
              v17 < 0.0))
        {
          uint64_t v18 = [v13 lastUpdated];

          id v10 = (void *)v18;
        }
        v9 |= v14;
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
  else
  {
    char v9 = 0;
    id v10 = 0;
  }
  BOOL v19 = [(PDAccountManager *)self _shouldProactivelyFetchEndpoint:3 dirty:v9 & 1 lastUpdated:v10 fetchPeriodEndpoint:3 account:v5];

  return v19;
}

- (void)_managerFetch_updateAccountUsersWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  if (v8)
  {
    workQueue = self->_workQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100244ACC;
    v11[3] = &unk_100731F10;
    id v14 = v7;
    v11[4] = self;
    id v12 = v8;
    id v13 = v6;
    dispatch_async(workQueue, v11);
  }
  else if (v7)
  {
    id v10 = +[NSError errorWithDomain:PKAccountErrorDomain code:3 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }
}

- (void)_queue_updateSharedAccountCloudStoreIfNeccessaryForAccount:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 accountIdentifier];
  char v9 = [(PDDatabaseManager *)self->_databaseManager sharedAccountCloudStoreForAccountIdentifier:v8];
  id v10 = [v9 isDirty];
  uint64_t v11 = [v9 lastUpdated];
  LODWORD(v10) = [(PDAccountManager *)self _shouldProactivelyFetchEndpoint:4 dirty:v10 lastUpdated:v11 fetchPeriodEndpoint:4 account:v7];

  if (v10)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10024587C;
    v19[3] = &unk_100742230;
    id v12 = (id *)v20;
    id v13 = v8;
    v20[0] = v13;
    v20[1] = self;
    id v21 = v6;
    id v14 = v6;
    [(PDAccountManager *)self updateSharedAccountCloudStoreWithAccountIdentifier:v13 completion:v19];
  }
  else
  {
    replyQueue = self->_replyQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1002459AC;
    v17[3] = &unk_10072F788;
    id v12 = &v18;
    id v18 = v6;
    id v16 = v6;
    dispatch_async(replyQueue, v17);
  }
}

- (void)accountUsersForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100245A8C;
    v9[3] = &unk_100742280;
    v9[4] = self;
    id v11 = v7;
    id v10 = v6;
    [(PDAccountManager *)self accountWithIdentifier:v10 completion:v9];
  }
}

- (void)accountUsersByAccountIdentifierForFeature:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1002460E4;
    v8[3] = &unk_1007422A8;
    void v8[4] = self;
    unint64_t v10 = a3;
    id v9 = v6;
    [(PDAccountManager *)self accountsWithCompletion:v8];
  }
}

- (void)physicalCardsByAccountIdentifierForFeature:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100246328;
    v8[3] = &unk_1007422A8;
    unint64_t v10 = a3;
    void v8[4] = self;
    id v9 = v6;
    [(PDAccountManager *)self accountsWithCompletion:v8];
  }
}

- (void)deleteAccountUserWithAltDSID:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002465A8;
  v12[3] = &unk_100742208;
  id v13 = a4;
  id v14 = v8;
  BOOL v15 = self;
  id v16 = a5;
  id v9 = v16;
  id v10 = v8;
  id v11 = v13;
  [(PDAccountManager *)self accountWithIdentifier:v11 completion:v12];
}

- (void)updateAccountUserPreferences:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10024686C;
  v15[3] = &unk_100742370;
  v15[4] = self;
  id v16 = a4;
  id v17 = a5;
  id v18 = v10;
  id v19 = a6;
  id v11 = v19;
  id v12 = v10;
  id v13 = v17;
  id v14 = v16;
  [(PDAccountManager *)self accountWithIdentifier:v13 completion:v15];
}

- (void)updateAccountUserNotificationSettings:(id)a3 forAccountUserWithAltDSID:(id)a4 forAccountWithIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100246CB4;
  block[3] = &unk_100731F38;
  block[4] = self;
  id v20 = v11;
  id v21 = v12;
  id v22 = v10;
  id v23 = v13;
  id v15 = v13;
  id v16 = v10;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(workQueue, block);
}

- (void)insertOrUpdateLocalAccountUser:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && v9)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100246F28;
    v12[3] = &unk_100730578;
    void v12[4] = self;
    id v13 = v9;
    id v14 = v8;
    id v15 = v10;
    dispatch_async(workQueue, v12);
  }
}

- (void)_managerFetch_updateAccountWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 accountIdentifier];
  unsigned __int8 v9 = [v7 fetchExtendedAccount];

  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v30 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating account with identifier %@", buf, 0xCu);
  }

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1002473D4;
  v26[3] = &unk_1007423E8;
  id v11 = v6;
  id v28 = v11;
  void v26[4] = self;
  id v12 = v8;
  id v27 = v12;
  id v13 = objc_retainBlock(v26);
  if ((PKUIOnlyDemoModeEnabled() & 1) == 0 && (PKStoreDemoModeEnabled() & 1) == 0)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1002474A4;
    v21[3] = &unk_100742460;
    unsigned __int8 v25 = v9;
    id v22 = v12;
    id v23 = self;
    long long v24 = v13;
    [(PDAccountManager *)self accountWithIdentifier:v22 completion:v21];

    id v17 = v22;
    goto LABEL_10;
  }
  id v14 = (__CFString *)v12;
  id v15 = v14;
  if (v14 == @"1234567890"
    || v14
    && (unsigned int v16 = [(__CFString *)v14 isEqualToString:@"1234567890"],
        v15,
        v16))
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100247A00;
    v18[3] = &unk_100742488;
    v18[4] = self;
    unsigned __int8 v20 = v9;
    id v19 = v13;
    [(PDAccountManager *)self accountWithIdentifier:v15 completion:v18];
    id v17 = v19;
LABEL_10:
  }
}

- (void)_processPhysicalCardsFromExtendedAccountResponse:(id)a3 accountIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = [a3 physicalCards];
  if ([v7 count])
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100247BF4;
    block[3] = &unk_10072E238;
    block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)deleteAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Delete account with identifier %@", buf, 0xCu);
  }

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10024806C;
  v11[3] = &unk_100742528;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(PDAccountManager *)self accountWithIdentifier:v10 completion:v11];
}

- (void)defaultAccountForFeature:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10024855C;
    v8[3] = &unk_100742550;
    void v8[4] = self;
    id v9 = v6;
    unint64_t v10 = a3;
    [(PDAccountManager *)self accountsWithCompletion:v8];
  }
}

- (id)defaultAccountForFeature:(unint64_t)a3 forAccounts:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (!a3
    || (long long v22 = 0u,
        long long v23 = 0u,
        long long v20 = 0u,
        long long v21 = 0u,
        (id v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16]) == 0))
  {
    id v9 = 0;
    goto LABEL_21;
  }
  id v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v21;
  do
  {
    for (unint64_t i = 0; i != v8; unint64_t i = (char *)i + 1)
    {
      if (*(void *)v21 != v10) {
        objc_enumerationMutation(v6);
      }
      id v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
      if ([v12 feature] == (id)a3)
      {
        if (!v9)
        {
          id v9 = v12;
          continue;
        }
        unint64_t v13 = sub_10024879C(v9);
        unint64_t v14 = sub_10024879C(v12);
        if (v13 != v14)
        {
          if (v14 >= v13) {
            continue;
          }
LABEL_16:
          id v18 = v12;

          id v9 = v18;
          continue;
        }
        id v15 = [v12 lastUpdated];
        unsigned int v16 = [v9 lastUpdated];
        id v17 = [v15 compare:v16];

        [v9 state];
        if (PKAccountStateIsTerminal())
        {
          [v12 state];
          if ((PKAccountStateIsTerminal() & 1) == 0) {
            goto LABEL_16;
          }
        }
        if (v17 == (id)1) {
          goto LABEL_16;
        }
      }
    }
    id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  }
  while (v8);
LABEL_21:

  return v9;
}

- (void)performAccountAction:(id)a3 withAccountIdentifier:(id)a4 accountUserAltDSID:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ((PKUIOnlyDemoModeEnabled() & 1) == 0 && (PKStoreDemoModeEnabled() & 1) == 0)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1002489A4;
    v17[3] = &unk_100742370;
    id v18 = v11;
    id v19 = v12;
    id v20 = v10;
    long long v21 = self;
    id v22 = v13;
    [(PDAccountManager *)self accountWithIdentifier:v18 completion:v17];

    goto LABEL_11;
  }
  unint64_t v14 = (__CFString *)v11;
  id v15 = v14;
  if (v14 == @"1234567890")
  {
    unsigned int v16 = 1;
  }
  else
  {
    if (!v14) {
      goto LABEL_11;
    }
    unsigned int v16 = [(__CFString *)v14 isEqualToString:@"1234567890"];
  }

  if (v13 && v16) {
    (*((void (**)(id, void, void))v13 + 2))(v13, 0, 0);
  }
LABEL_11:
}

- (void)termsWithIdentifier:(id)a3 accepted:(BOOL)a4 withAccountIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void))a6;
  if (PKUIOnlyDemoModeEnabled() & 1) != 0 || (PKStoreDemoModeEnabled())
  {
    if (v12) {
      v12[2](v12, 0);
    }
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100248EF0;
    v13[3] = &unk_1007425C8;
    id v14 = v11;
    BOOL v18 = a4;
    id v15 = v10;
    unsigned int v16 = self;
    id v17 = v12;
    [(PDAccountManager *)self accountWithIdentifier:v14 completion:v13];
  }
}

- (void)userInfoForAccountIdentifier:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100249244;
  v10[3] = &unk_100742640;
  id v11 = a3;
  id v12 = a5;
  void v10[4] = self;
  BOOL v13 = a4;
  id v8 = v11;
  id v9 = v12;
  [(PDAccountManager *)self accountWithIdentifier:v8 completion:v10];
}

- (void)_creditUserInfoForAccountIdentifier:(id)a3 forceFetch:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PDDatabaseManager *)self->_databaseManager primaryAccountIdentifierForAssociatedAccountIdentifier:v8];
  if (v10)
  {
    id v11 = +[PKPaymentOptionsDefaults defaults];
    id v12 = [v11 defaultBillingAddressForPrimaryAccountIdentifier:v10];
    if (!v12)
    {
      id v12 = [v11 defaultBillingAddressForPrimaryAccountIdentifier:v8];
      if (v12)
      {
        [v11 setDefaultBillingAddress:v12 forPrimaryAccountIdentifier:v10];
        [v11 deleteDefaultBillingAddressForPrimaryAccountIdentifier:v8];
      }
    }
    BOOL v13 = [(PDAccountManager *)self _cacheKeyForUserInfoWithAccountIdentifier:v8];
    int BoolForKey = PKSharedCacheGetBoolForKey();
    if (!v12 || a4 || BoolForKey)
    {
      unsigned int v16 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updating account user info", buf, 2u);
      }

      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1002497B0;
      v17[3] = &unk_100742668;
      id v18 = v12;
      id v19 = v13;
      id v20 = v9;
      [(PDAccountManager *)self _fetchCreditUserInfoForAccountIdentifier:v8 completion:v17];
    }
    else if (v9)
    {
      (*((void (**)(id, void *, void))v9 + 2))(v9, v12, 0);
    }
  }
  else if (v9)
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cannot get userInfo for nil primaryAccountIdentifier", buf, 2u);
    }

    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)updateUserInfoForAccountIdentifier:(id)a3 contact:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10024993C;
    v11[3] = &unk_100742208;
    v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    [(PDAccountManager *)self accountWithIdentifier:v12 completion:v11];
  }
}

- (void)_fetchCreditUserInfoForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id, void))a4;
  if (v7)
  {
    if (PKUIOnlyDemoModeEnabled() & 1) != 0 || (PKStoreDemoModeEnabled())
    {
      id v8 = (__CFString *)v6;
      if (v8 == @"1234567890"
        || (id v9 = v8) != 0
        && (unsigned int v10 = [(__CFString *)v8 isEqualToString:@"1234567890"],
            v9,
            v10))
      {
        id v11 = objc_alloc_init((Class)CNMutableContact);
        [v11 setGivenName:@"John"];
        [v11 setFamilyName:@"Appleseed"];
        id v12 = objc_alloc_init((Class)CNMutablePostalAddress);
        [v12 setStreet:@"1 Apple Park Way"];
        [v12 setCity:@"Cupertino"];
        [v12 setState:@"CA"];
        [v12 setCountry:@"US"];
        [v12 setPostalCode:@"95014"];
        id v13 = [v12 copy];
        id v14 = +[CNLabeledValue labeledValueWithLabel:CNLabelHome value:v13];

        id v20 = v14;
        id v15 = +[NSArray arrayWithObjects:&v20 count:1];
        [v11 setPostalAddresses:v15];

        id v16 = [v11 copy];
        v7[2](v7, v16, 0);
      }
    }
    else
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10024A098;
      v17[3] = &unk_100742528;
      void v17[4] = self;
      id v18 = v6;
      id v19 = v7;
      [(PDAccountManager *)self accountWithIdentifier:v18 completion:v17];
    }
  }
}

- (BOOL)_shouldFetchUpdatedUserInfo:(id)a3
{
  id v3 = [(PDAccountManager *)self _cacheKeyForUserInfoWithAccountIdentifier:a3];
  char BoolForKey = PKSharedCacheGetBoolForKey();

  return BoolForKey;
}

- (id)_cacheKeyForUserInfoWithAccountIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"%@-%@", PKSharedCacheLastUserInfoUpdateKey, a3];
}

- (void)_savingsUserInfoForAccountIdentifier:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10024A5B4;
  v7[3] = &unk_100742528;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(PDAccountManager *)v8 accountWithIdentifier:v6 completion:v7];
}

- (void)_insertOrUpdateAccountServicingTokenNotificationWithAccount:(id)a3 notificationUserInfo:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v6 PKStringForKey:@"token"];
  id v8 = [v6 PKDateForKey:@"expirationDate"];

  if (v7 && v8)
  {
    id v9 = [[PDAccountServicingTokenUserNotification alloc] initWithAccount:v10 servicingToken:v7 expirationDate:v8];
    [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v9];
  }
}

- (void)_cleanupSavingsAccountPreferences:(id)a3
{
  id v4 = [a3 state];
  if (v4 == (id)1
    || (!a3 || v4 == (id)4)
    && (PKSavingsSetHasDismissedEducationInterestMessage(),
        PKSavingsSetPreviousAPYForUpdateMessage(),
        PKSavingsSetHideCashTransferMessage(),
        PKSavingsSetHasDismissedFixRewardsMessage(),
        !a3))
  {
    PKSavingsSetHasDismissedClosedAccountMessage();
    PKSavingsSetHasDismissedPendingApplicationMessage();
  }
}

- (void)deleteBeneficiaryWithIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10024AB04;
  v12[3] = &unk_100742758;
  id v13 = a4;
  id v14 = v8;
  id v15 = self;
  id v16 = a5;
  id v9 = v8;
  id v10 = v13;
  id v11 = v16;
  [(PDAccountManager *)self accountWithIdentifier:v10 completion:v12];
}

- (void)insertEvents:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10024ADD0;
  block[3] = &unk_10072E9D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)eventsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10024B674;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)eventsForAccountIdentifier:(id)a3 types:(id)a4 startDate:(id)a5 endDate:(id)a6 orderedByDate:(int64_t)a7 limit:(unint64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  if (v19)
  {
    workQueue = self->_workQueue;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10024B898;
    v21[3] = &unk_1007427A8;
    void v21[4] = self;
    id v22 = v15;
    id v23 = v16;
    id v24 = v17;
    id v25 = v18;
    int64_t v27 = a7;
    unint64_t v28 = a8;
    id v26 = v19;
    dispatch_async(workQueue, v21);
  }
}

- (void)eventWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10024BA4C;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)deleteEventsWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10024BBE8;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)deleteEventWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10024BFB4;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)deleteEventsWithAccountIdentifier:(id)a3 excludingTypes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10024C290;
  v15[3] = &unk_100730578;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (void)lastRedemptionEventToDestination:(unint64_t)a3 forAccountIdentifier:(id)a4 altDSID:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10024C694;
    block[3] = &unk_100730288;
    void block[4] = self;
    unint64_t v18 = a3;
    id v15 = v10;
    id v16 = v11;
    id v17 = v12;
    dispatch_async(workQueue, block);
  }
}

- (void)_processRewardsRedemptionEvent:(id)a3
{
  id v74 = a3;
  if (([v74 updateReasonIsInitialDownload] & 1) == 0 && !PKSharedCacheGetIntegerForKey())
  {
    databaseManager = self->_databaseManager;
    id v5 = [v74 accountIdentifier];
    unint64_t v6 = [(PDDatabaseManager *)databaseManager successfulRedemptionEventsToPeerPaymentForAccountIdentifier:v5];

    if (v6) {
      PKSharedCacheSetObjectForKey();
    }
  }
  id v7 = [v74 items];
  id v8 = [v7 anyObject];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [v8 status];
      if (v9 == @"success"
        || (id v10 = v9) != 0
        && (unsigned int v11 = [(__CFString *)v9 isEqualToString:@"success"],
            v10,
            v10,
            v11))
      {
        unint64_t v72 = [v74 accountIdentifier];
        id v71 = -[PDDatabaseManager accountWithIdentifier:](self->_databaseManager, "accountWithIdentifier:");
        id v70 = [v71 associatedPassUniqueID];
        id v12 = -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:](self->_databaseManager, "transactionSourceIdentifiersForPassUniqueIdentifier:");
        id v77 = [v12 anyObject];

        id v13 = self->_databaseManager;
        id v14 = [v74 identifier];
        id v15 = [(PDDatabaseManager *)v13 transactionWithReferenceIdentifier:v14];

        id v76 = self;
        if (v15)
        {
          if ([v15 suppressBehavior] == (id)1)
          {
LABEL_50:
            id v69 = v15;
            id v42 = [v8 type];
            long long v82 = 0u;
            long long v83 = 0u;
            long long v84 = 0u;
            long long v85 = 0u;
            id v73 = v8;
            id v43 = [v8 transactionIdentifiers];
            id v44 = [v43 countByEnumeratingWithState:&v82 objects:v99 count:16];
            if (v44)
            {
              id v45 = v44;
              uint64_t v46 = *(void *)v83;
              do
              {
                for (unint64_t i = 0; i != v45; unint64_t i = (char *)i + 1)
                {
                  if (*(void *)v83 != v46) {
                    objc_enumerationMutation(v43);
                  }
                  long long v48 = *(void **)(*((void *)&v82 + 1) + 8 * i);
                  id v50 = [(PDDatabaseManager *)self->_databaseManager transactionWithServiceIdentifier:v48 transactionSourceIdentifier:v77];
                  id v51 = v50;
                  if (v50 && [v50 redemptionType] != v42)
                  {
                    uint64_t v52 = PKLogFacilityTypeGetObject();
                    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v95 = v48;
                      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Updating redemption type for transaction %@", buf, 0xCu);
                    }

                    if ([v74 updateReasonIsInitialDownload]) {
                      [v51 addUpdateReasons:4];
                    }
                    self = v76;
                    id v53 = [(PDDatabaseManager *)v76->_databaseManager updateRedemptionType:v42 forPaymentTransaction:v51 sourceIdentifier:v77];
                  }
                }
                id v45 = [v43 countByEnumeratingWithState:&v82 objects:v99 count:16];
              }
              while (v45);
            }

            long long v80 = 0u;
            long long v81 = 0u;
            long long v78 = 0u;
            long long v79 = 0u;
            id obj = [v73 rewardsAddedIdentifiers];
            id v54 = [obj countByEnumeratingWithState:&v78 objects:v98 count:16];
            if (v54)
            {
              id v55 = v54;
              uint64_t v56 = *(void *)v79;
              do
              {
                for (j = 0; j != v55; j = (char *)j + 1)
                {
                  if (*(void *)v79 != v56) {
                    objc_enumerationMutation(obj);
                  }
                  long long v58 = *(void **)(*((void *)&v78 + 1) + 8 * (void)j);
                  long long v60 = [(PDDatabaseManager *)self->_databaseManager accountEventWithIdentifier:v58];
                  long long v61 = v60;
                  if (v60)
                  {
                    long long v62 = [v60 items];
                    id v63 = [v62 anyObject];

                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0 && ![v63 type])
                    {
                      CFStringRef v64 = PKLogFacilityTypeGetObject();
                      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
                      {
                        id v65 = PKAccountRewardRedemptionTypeToString();
                        *(_DWORD *)buf = 138412546;
                        id v95 = v65;
                        __int16 v96 = 2112;
                        id v97 = v58;
                        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Updating redemption type to %@ for event %@", buf, 0x16u);
                      }
                      [v63 setType:v42];
                      self = v76;
                      [(PDDatabaseManager *)v76->_databaseManager insertOrUpdateAccountEvent:v61];
                    }
                    else
                    {
                      self = v76;
                    }
                  }
                  else
                  {
                    id v63 = PKLogFacilityTypeGetObject();
                    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v95 = v58;
                      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Could not find rewards added with identifier %@", buf, 0xCu);
                    }
                  }
                }
                id v55 = [obj countByEnumeratingWithState:&v78 objects:v98 count:16];
              }
              while (v55);
            }

            id v8 = v73;
            goto LABEL_81;
          }
          id v16 = [v8 transactionIdentifiers];
          if ([v16 count])
          {
          }
          else
          {
            id v20 = [v8 rewardsAddedIdentifiers];
            id v21 = [v20 count];

            if (!v21)
            {
              id v66 = PKLogFacilityTypeGetObject();
              if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                id v95 = v74;
                _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Disbursement has no associated transactions or added events: %@", buf, 0xCu);
              }

              userNotificationManager = self->_userNotificationManager;
              id v68 = +[PDPassPaymentTransactionUserNotification notificationIdentifierForPaymentTransaction:v15];
              [(PDUserNotificationManager *)userNotificationManager removeUserNotificationWithIdentifier:v68];

              goto LABEL_50;
            }
          }
          if ([v74 updateReasonIsInitialDownload]) {
            [v15 addUpdateReasons:4];
          }
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          id v22 = [v8 transactionIdentifiers];
          id v23 = [v22 countByEnumeratingWithState:&v90 objects:v101 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v91;
            while (2)
            {
              for (k = 0; k != v24; k = (char *)k + 1)
              {
                if (*(void *)v91 != v25) {
                  objc_enumerationMutation(v22);
                }
                int64_t v27 = *(void **)(*((void *)&v90 + 1) + 8 * (void)k);
                unint64_t v28 = [(PDDatabaseManager *)self->_databaseManager ambiguousTransactionWithServiceIdentifier:v27];

                if (!v28)
                {
                  id v30 = PKLogFacilityTypeGetObject();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v95 = v27;
                    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "No card transaction for identifier: %@", buf, 0xCu);
                  }

                  char v29 = 1;
                  self = v76;
                  goto LABEL_31;
                }
                self = v76;
              }
              id v24 = [v22 countByEnumeratingWithState:&v90 objects:v101 count:16];
              if (v24) {
                continue;
              }
              break;
            }
          }
          char v29 = 0;
LABEL_31:

          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          id v31 = [v8 rewardsAddedIdentifiers];
          id v32 = [v31 countByEnumeratingWithState:&v86 objects:v100 count:16];
          if (v32)
          {
            id v33 = v32;
            uint64_t v34 = *(void *)v87;
            while (2)
            {
              for (m = 0; m != v33; m = (char *)m + 1)
              {
                if (*(void *)v87 != v34) {
                  objc_enumerationMutation(v31);
                }
                id v36 = *(void **)(*((void *)&v86 + 1) + 8 * (void)m);
                id v37 = [(PDDatabaseManager *)self->_databaseManager accountEventWithIdentifier:v36];

                if (!v37)
                {
                  id v41 = PKLogFacilityTypeGetObject();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v95 = v36;
                    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "No rewards added event for identifier: %@", buf, 0xCu);
                  }

                  self = v76;
                  goto LABEL_46;
                }
                self = v76;
              }
              id v33 = [v31 countByEnumeratingWithState:&v86 objects:v100 count:16];
              if (v33) {
                continue;
              }
              break;
            }
          }

          if ((v29 & 1) == 0)
          {
            id v38 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v39 = [v15 serviceIdentifier];
              *(_DWORD *)buf = 138412290;
              id v95 = v39;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Suppressing transaction from UI: %@", buf, 0xCu);
            }
            id v40 = [(PDDatabaseManager *)self->_databaseManager updateSuppressBehavior:1 forPaymentTransaction:v15 sourceIdentifier:v77];
            goto LABEL_50;
          }
LABEL_46:
          id v17 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v18 = [v15 serviceIdentifier];
            *(_DWORD *)buf = 138412290;
            id v95 = v18;
            id v19 = "Not suppressing transaction from UI: %@, waiting for more events";
            goto LABEL_48;
          }
        }
        else
        {
          id v17 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            unint64_t v18 = [v74 identifier];
            *(_DWORD *)buf = 138412290;
            id v95 = v18;
            id v19 = "No disbursement found for %@";
LABEL_48:
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
          }
        }

        goto LABEL_50;
      }
    }
  }
LABEL_81:
}

- (void)_processRewardsAddedEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 items];
  unint64_t v6 = [v5 anyObject];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v6 type])
  {
    id v7 = [v6 identifier];
    id v8 = [(PDDatabaseManager *)self->_databaseManager redemptionAccountEventWithRewardsAddedIdentifier:v7];
    id v9 = v8;
    if (v8 && [v8 type] == (id)1)
    {
      id v10 = [v9 items];
      unsigned int v11 = [v10 anyObject];

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v11 type])
      {
        objc_msgSend(v6, "setType:", -[NSObject type](v11, "type"));
        [(PDDatabaseManager *)self->_databaseManager insertOrUpdateAccountEvent:v4];
      }
      databaseManager = self->_databaseManager;
      id v13 = [v9 identifier];
      id v14 = [(PDDatabaseManager *)databaseManager transactionWithReferenceIdentifier:v13];

      if (v14)
      {
        if ([v4 updateReasonIsInitialDownload]) {
          [v14 addUpdateReasons:4];
        }
        id v15 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          id v16 = [v14 serviceIdentifier];
          int v20 = 138412290;
          id v21 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Suppressing transaction from UI following rewards added event: %@", (uint8_t *)&v20, 0xCu);
        }
        id v17 = self->_databaseManager;
        unint64_t v18 = [v14 transactionSourceIdentifier];
        id v19 = [(PDDatabaseManager *)v17 updateSuppressBehavior:1 forPaymentTransaction:v14 sourceIdentifier:v18];
      }
    }
    else
    {
      unsigned int v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138412290;
        id v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Could not find redemption event for rewards added: %@", (uint8_t *)&v20, 0xCu);
      }
    }
  }
}

- (void)_processUserInfoUpdateEvent:(id)a3
{
  id v4 = a3;
  id v5 = [v4 items];
  unint64_t v6 = [v5 anyObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 updatedDate];
    id v8 = [v4 accountIdentifier];
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "User info event update received", buf, 2u);
    }

    [v7 timeIntervalSinceNow];
    if (v10 > -300.0)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "User info event update deferred to next view of account details", v12, 2u);
      }

      unsigned int v11 = [(PDAccountManager *)self _cacheKeyForUserInfoWithAccountIdentifier:v8];
      PKSharedCacheSetBoolForKey();
    }
  }
}

- (void)_processPaymentFailed:(id)a3
{
  id v7 = a3;
  id v3 = [v7 updateReasonIsInitialDownload];
  id v4 = v7;
  if ((v3 & 1) == 0)
  {
    id v5 = [v7 items];
    unint64_t v6 = [v5 anyObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      PKSharedCacheSetBoolForKey();
    }

    id v4 = v7;
  }
  _objc_release_x1(v3, v4);
}

- (void)_processVirtualCardStatusUpdateEvent:(id)a3
{
  id v3 = a3;
  if (([v3 updateReasonIsInitialDownload] & 1) == 0)
  {
    id v4 = [v3 items];
    id v5 = [v4 anyObject];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_13:

      goto LABEL_14;
    }
    unint64_t v6 = (char *)[v5 reason];
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = PKStringFromAccountVirtualCardStatusUpdateReason();
      *(_DWORD *)buf = 138412290;
      unint64_t v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Virtual card event update received of type: %@", buf, 0xCu);
    }
    id v9 = [v5 updatedVirtualCards];
    if ((unint64_t)(v6 - 2) >= 3)
    {
      if (v6 != (char *)1)
      {
LABEL_12:

        goto LABEL_13;
      }
      double v10 = [v3 accountIdentifier];
      PKAppleCardSetShouldShowVPANUpdatedMessage();
    }
    if ([v9 count] == (id)1)
    {
      unsigned int v11 = [v9 firstObject];
      id v12 = [v11 lastUpdatedDate];
      [v12 timeIntervalSinceNow];
      double v14 = v13;

      if (v14 > -172800.0)
      {
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_10024D874;
        v15[3] = &unk_100741F20;
        id v16 = v11;
        +[PKVirtualCard queryKeychainForVirtualCards:v15];
      }
    }
    goto LABEL_12;
  }
LABEL_14:
}

- (void)_notifyPhysicalCardsChangedWithAccountEvent:(id)a3
{
  id v4 = [a3 accountIdentifier];
  [(PDDatabaseManager *)self->_databaseManager physicalCardsForAccountWithIdentifier:v4];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10024DACC;
  v7[3] = &unk_1007424D8;
  void v7[4] = self;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [(PDAccountManager *)self _accessObserversWithHandler:v7];
}

- (void)processPhysicalCardExpirationMessaging:(id)a3 physicalCards:(id)a4 account:(id)a5
{
  id v60 = a3;
  id v8 = a4;
  id v64 = a5;
  uint64_t v9 = [v64 accountIdentifier];
  id v65 = self;
  long long v62 = [(PDDatabaseManager *)self->_databaseManager passUniqueIdentifierWithAssociatedAccountIdentifier:v9];
  double v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v79 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Updating physical card expiration messaging for account %@", buf, 0xCu);
  }
  oslog = v10;
  id v68 = (void *)v9;

  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v8;
  id v11 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
  if (!v11)
  {
    id v13 = 0;
    id v66 = 0;
    goto LABEL_31;
  }
  id v12 = v11;
  id v66 = 0;
  id v13 = 0;
  uint64_t v14 = *(void *)v75;
  while (2)
  {
    id v15 = 0;
    do
    {
      if (*(void *)v75 != v14) {
        objc_enumerationMutation(obj);
      }
      id v16 = *(void **)(*((void *)&v74 + 1) + 8 * (void)v15);
      id v17 = [v16 accountUserAltDSID];
      if (!v17) {
        goto LABEL_14;
      }
      unint64_t v18 = PKCurrentUserAltDSID();
      id v19 = v17;
      id v20 = v18;
      if (v19 == v20)
      {

LABEL_14:
        id v23 = (char *)[v16 state];
        if ((unint64_t)(v23 - 2) >= 3)
        {
          if (v23 != (char *)5)
          {
            if (v23 == (char *)1)
            {
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "User has unactivated physical card, not showing messaging", buf, 2u);
              }

              id v69 = obj;
LABEL_105:
              unint64_t v28 = v64;
              char v29 = v68;
              goto LABEL_106;
            }
            goto LABEL_17;
          }
          id v24 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
          uint64_t v25 = [v64 productTimeZone];
          [v24 setTimeZone:v25];

          if ([v16 isExpiredInCalendar:v24])
          {
            id v26 = v16;

            id v66 = v26;
          }
        }
        else
        {
          id v24 = v13;
          id v13 = v16;
        }

LABEL_17:
        if (v13 && v66)
        {

          goto LABEL_31;
        }
        goto LABEL_24;
      }
      id v21 = v20;
      if (!v20)
      {

        goto LABEL_24;
      }
      unsigned __int8 v22 = [v19 isEqualToString:v20];

      if (v22) {
        goto LABEL_14;
      }
LABEL_24:

      id v15 = (char *)v15 + 1;
    }
    while (v12 != v15);
    id v27 = [obj countByEnumeratingWithState:&v74 objects:v83 count:16];
    id v12 = v27;
    if (v27) {
      continue;
    }
    break;
  }
LABEL_31:

  unint64_t v28 = v64;
  if ([v64 supportsShowNotifications])
  {
    char v29 = v68;
    if (([v64 blockNotifications] & 1) != 0 || objc_msgSend(v64, "state") != (id)1) {
      unsigned int v63 = 0;
    }
    else {
      unsigned int v63 = [v64 supportsRequestPhysicalCard];
    }
  }
  else
  {
    unsigned int v63 = 0;
    char v29 = v68;
  }
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v69 = v60;
  id v30 = [v69 countByEnumeratingWithState:&v70 objects:v82 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v71;
    while (1)
    {
      for (unint64_t i = 0; i != v31; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v71 != v32) {
          objc_enumerationMutation(v69);
        }
        uint64_t v34 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        id v35 = [v34 physicalCardIdentifier];
        id v36 = [v34 messagingType];
        if (v36 == (id)2)
        {
          if (v13)
          {
            id v44 = [v13 identifier];
            id v43 = v35;
            id v45 = v44;
            id v41 = v45;
            if (v43 == v45) {
              goto LABEL_79;
            }
            if (v43) {
              BOOL v46 = v45 == 0;
            }
            else {
              BOOL v46 = 1;
            }
            if (v46)
            {
LABEL_69:

              goto LABEL_101;
            }
            unsigned __int8 v47 = [(PDAccountPhysicalCardExpiredNotification *)v43 isEqualToString:v45];

            if (v47) {
              goto LABEL_80;
            }
            goto LABEL_102;
          }
          if (!v66) {
            goto LABEL_103;
          }
          long long v48 = [v66 identifier];
          id v43 = v35;
          id v49 = v48;
          if (v43 == v49)
          {
            id v41 = v43;
LABEL_79:

LABEL_80:
LABEL_81:
            PKAppleCardPhysicalCardExpiredMessagingStartDate();
            id v41 = (PDAccountPhysicalCardExpiredNotification *)objc_claimAutoreleasedReturnValue();
            if (v41)
            {
              id v43 = (PDAccountPhysicalCardExpiredNotification *)oslog;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v79 = (uint64_t)v35;
                __int16 v80 = 2112;
                long long v81 = v41;
                uint64_t v52 = oslog;
                id v53 = "We have already scheduled a start date for physical card expired messaging for card %@: %@";
LABEL_84:
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, v53, buf, 0x16u);
              }
LABEL_101:

LABEL_102:
              goto LABEL_103;
            }
            id v55 = +[NSDate now];
            id v43 = [(PDAccountManager *)v65 _expirationMessagingStartDateForMessagingInfo:v34 account:v64 now:v55];

            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v79 = (uint64_t)v35;
              __int16 v80 = 2112;
              long long v81 = v43;
              _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Set physical card expired messaging start date for card %@ to %@", buf, 0x16u);
            }

            PKAppleCardSetPhysicalCardExpiredMessagingStartDate();
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v79 = (uint64_t)v68;
              _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Updating physical card expiration messaging for account %@", buf, 0xCu);
            }

            if (!v63 || v13 && [v13 state] != (id)4) {
              goto LABEL_101;
            }
            id v54 = [[PDAccountPhysicalCardExpiredNotification alloc] initWithAccountIdentifier:v68 physicalCardIdentifier:v35 forPassUniqueIdentifier:v62];
            [(PDUserNotification *)v54 setDate:v43];
            [(PDUserNotificationManager *)v65->_userNotificationManager insertUserNotification:v54];
LABEL_100:

            goto LABEL_101;
          }
          id v41 = v49;
          if (v43) {
            BOOL v50 = v49 == 0;
          }
          else {
            BOOL v50 = 1;
          }
          if (v50) {
            goto LABEL_69;
          }
          unsigned __int8 v56 = [(PDAccountPhysicalCardExpiredNotification *)v43 isEqualToString:v49];

          if (v56) {
            goto LABEL_81;
          }
        }
        else if (v36 == (id)1 && v13 != 0)
        {
          id v38 = [v13 identifier];
          uint64_t v39 = v35;
          id v40 = v38;
          if (v39 == v40)
          {

LABEL_72:
            PKAppleCardPhysicalCardExpiringSoonMessagingStartDate();
            id v41 = (PDAccountPhysicalCardExpiredNotification *)objc_claimAutoreleasedReturnValue();
            if (v41)
            {
              id v43 = (PDAccountPhysicalCardExpiredNotification *)oslog;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v79 = (uint64_t)v39;
                __int16 v80 = 2112;
                long long v81 = v41;
                uint64_t v52 = oslog;
                id v53 = "We have already scheduled a start date for physical card expiring soon messaging for card %@: %@";
                goto LABEL_84;
              }
              goto LABEL_101;
            }
            PKAppleCardPhysicalCardExpiredMessagingStartDate();
            id v43 = (PDAccountPhysicalCardExpiredNotification *)objc_claimAutoreleasedReturnValue();
            if (v43)
            {
              id v54 = (PDAccountPhysicalCardExpiredNotification *)oslog;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v79 = (uint64_t)v39;
                __int16 v80 = 2112;
                long long v81 = v43;
                _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "We have already scheduled a start date for physical card expired messaging for card %@: %@", buf, 0x16u);
                id v54 = (PDAccountPhysicalCardExpiredNotification *)oslog;
              }
            }
            else
            {
              long long v57 = +[NSDate now];
              id v54 = [(PDAccountManager *)v65 _expirationMessagingStartDateForMessagingInfo:v34 account:v64 now:v57];

              if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v79 = (uint64_t)v39;
                __int16 v80 = 2112;
                long long v81 = v54;
                _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Set physical card expiring soon messaging start date for card %@ to %@", buf, 0x16u);
              }

              PKAppleCardSetPhysicalCardExpiringSoonMessagingStartDate();
              if (v63 && [v13 state] != (id)4)
              {
                long long v58 = [[PDAccountPhysicalCardExpiringSoonNotification alloc] initWithAccount:v64 physicalCard:v13 forPassUniqueIdentifier:v62];
                [(PDUserNotification *)v58 setDate:v54];
                [(PDUserNotificationManager *)v65->_userNotificationManager insertUserNotification:v58];
              }
            }
            goto LABEL_100;
          }
          id v41 = v40;
          if (v39) {
            BOOL v42 = v40 == 0;
          }
          else {
            BOOL v42 = 1;
          }
          if (v42)
          {

            id v43 = v39;
            goto LABEL_101;
          }
          unsigned int v51 = [(PDAccountPhysicalCardExpiredNotification *)v39 isEqualToString:v40];

          if (v51) {
            goto LABEL_72;
          }
        }
LABEL_103:
      }
      id v31 = [v69 countByEnumeratingWithState:&v70 objects:v82 count:16];
      if (!v31) {
        goto LABEL_105;
      }
    }
  }
LABEL_106:
}

- (id)_expirationMessagingStartDateForMessagingInfo:(id)a3 account:(id)a4 now:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  id v8 = +[NSCalendar currentCalendar];
  if ((char *)[v8 component:32 fromDate:v7] - 7 <= (char *)0xB)
  {
    uint64_t v9 = (char *)[v6 scatterInterval];
    if ((unint64_t)(v9 - 1) >= 0xA8BF) {
      uint64_t v10 = 3600;
    }
    else {
      uint64_t v10 = (uint64_t)v9;
    }
    id v11 = [v7 dateByAddingTimeInterval:(double)v10];
    if ((char *)[v8 component:32 fromDate:v11] - 7 >= (char *)0xC)
    {
    }
    else
    {
      id v12 = [v7 dateByAddingTimeInterval:(double)arc4random_uniform(v10)];

      if (v12) {
        goto LABEL_10;
      }
    }
  }
  id v13 = objc_alloc_init((Class)NSDateComponents);
  [v13 setHour:7];
  uint64_t v14 = [v8 nextDateAfterDate:v7 matchingComponents:v13 options:0];
  id v12 = [v14 dateByAddingTimeInterval:(double)arc4random_uniform(0xA8C0u)];

LABEL_10:
  return v12;
}

- (void)updateCreditStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10024E6A4;
  v7[3] = &unk_1007427D0;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(PDAccountManager *)v8 _downloadCreditStatementsForAccountIdentifier:v6 withCompletion:v7];
}

- (void)creditStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10024EAD4;
  v6[3] = &unk_1007423C0;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(PDAccountManager *)v7 accountWithIdentifier:a3 completion:v6];
}

- (void)creditStatementsForStatementIdentifiers:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10024F00C;
  v10[3] = &unk_100742820;
  id v11 = a3;
  id v12 = a5;
  void v10[4] = self;
  id v8 = v11;
  id v9 = v12;
  [(PDAccountManager *)self accountWithIdentifier:a4 completion:v10];
}

- (void)_creditStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v8 = a3;
  id v6 = (void (**)(id, void *, void))a4;
  id v7 = [(PDDatabaseManager *)self->_databaseManager creditAccountStatementsForAccountIdentifier:v8];
  if (v6) {
    v6[2](v6, v7, 0);
  }
  if ([(PDAccountManager *)self _shouldDownloadCreditStatementsForAccountIdentifier:v8])
  {
    [(PDAccountManager *)self updateCreditStatementsForAccountIdentifier:v8 completion:0];
  }
}

- (void)_publishStatementsChangedForAccountIdentifier:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10024F4B0;
  v4[3] = &unk_100741EA8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PDAccountManager *)v5 _accessObserversWithHandler:v4];
}

- (id)_cacheKeyForCreditStatementsWithAccountIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"%@-%@", PKSharedCacheLastCreditStatementDownloadKey, a3];
}

- (BOOL)_shouldDownloadCreditStatementsForAccountIdentifier:(id)a3
{
  id v3 = self;
  id v4 = [(PDAccountManager *)self _cacheKeyForCreditStatementsWithAccountIdentifier:a3];
  id v5 = PKSharedCacheGetDateForKey();
  id v6 = +[NSDate date];
  LOBYTE(v3) = [(PDAccountManager *)v3 _shouldDownloadCreditStatementsForLastStatementDownload:v5 now:v6];

  return (char)v3;
}

- (BOOL)_shouldDownloadCreditStatementsForLastStatementDownload:(id)a3 now:(id)a4
{
  if (!a3) {
    return 1;
  }
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  id v8 = [v7 components:12 fromDate:v6];

  id v9 = [v8 year];
  id v10 = [v8 month];
  id v11 = [v7 components:28 fromDate:v5];

  id v12 = [v11 year];
  id v13 = [v11 month];
  uint64_t v14 = (uint64_t)[v11 day];
  BOOL v16 = (uint64_t)v12 > (uint64_t)v9 || (uint64_t)v13 > (uint64_t)v10;
  BOOL v17 = v14 >= 2 && v16;

  return v17;
}

- (void)_downloadCreditStatementsForAccountIdentifier:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (PKUIOnlyDemoModeEnabled() & 1) != 0 || (PKStoreDemoModeEnabled())
    {
      id v8 = (__CFString *)v6;
      if (v8 == @"1234567890"
        || (id v9 = v8) != 0
        && (unsigned int v10 = [(__CFString *)v8 isEqualToString:@"1234567890"],
            v9,
            v10))
      {
        (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
      }
    }
    else
    {
      id v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Downloading credit statements for account %@", buf, 0xCu);
      }

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10024F874;
      v12[3] = &unk_100742528;
      id v13 = v6;
      uint64_t v14 = self;
      id v15 = v7;
      [(PDAccountManager *)self accountWithIdentifier:v13 completion:v12];
    }
  }
}

- (void)updateSavingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_10024FC10;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)savingsStatementsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100250254;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)updateTaxFormsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_1002503FC;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)taxFormsForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_1002509E4;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)createVirtualCard:(int64_t)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (PKBAAUtilitiesAvailable())
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100250C40;
    v12[3] = &unk_100742988;
    id v14 = v9;
    void v12[4] = self;
    id v13 = v8;
    int64_t v15 = a3;
    [(PDAccountManager *)self accountWithIdentifier:v13 completion:v12];

    id v10 = v14;
LABEL_7:

    goto LABEL_8;
  }
  id v11 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error calling create virtual card, BAA utilities unavailable", buf, 2u);
  }

  if (v9)
  {
    id v10 = +[NSError errorWithDomain:PKAccountErrorDomain code:8 userInfo:0];
    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v10);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)performVirtualCardAction:(int64_t)a3 forVirtualCardIdentifier:(id)a4 forAccountIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = [[PDAccountManagerVirtualCardActionRequest alloc] initWithAccountIdentifier:v11];

  [(PDAccountManagerVirtualCardActionRequest *)v13 setVirtualCardIdentifier:v12];
  [(PDAccountManagerVirtualCardActionRequest *)v13 setAction:a3];
  [(PDAccountManagerVirtualCardActionRequest *)v13 addCompletion:v10];

  [(PDAccountManager *)self _addAccountManagerFetchRequest:v13];
}

- (void)_managerFetch_performVirtualCardActionWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (PKBAAUtilitiesAvailable())
  {
    id v8 = [v6 accountIdentifier];
    id v9 = [v6 virtualCardIdentifier];
    id v10 = [v6 action];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100251848;
    v14[3] = &unk_100742AA0;
    v14[4] = self;
    id v15 = v9;
    id v17 = v7;
    id v18 = v10;
    id v16 = v8;
    id v11 = v8;
    id v12 = v9;
    [(PDAccountManager *)self accountWithIdentifier:v11 completion:v14];

LABEL_7:
    goto LABEL_8;
  }
  id v13 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Error calling virtual card action, BAA utilities unavailable", buf, 2u);
  }

  if (v7)
  {
    id v12 = +[NSError errorWithDomain:PKAccountErrorDomain code:8 userInfo:0];
    (*((void (**)(id, void, void, id))v7 + 2))(v7, 0, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)updateVirtualCardsWithAccountIdentifier:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1002524FC;
  v8[3] = &unk_100742820;
  id v9 = a3;
  id v10 = a4;
  void v8[4] = self;
  id v6 = v9;
  id v7 = v10;
  [(PDAccountManager *)self accountWithIdentifier:v6 completion:v8];
}

- (void)cardCredentialsForVirtualCard:(id)a3 authorization:(id)a4 action:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = v12;
  if (v11 && v12)
  {
    unsigned int v14 = [v10 hasSensitiveCredentials];
    if ([v10 hasDynamicSecurityCode])
    {
      id v15 = +[NSDate date];
      id v16 = [v10 securityCodeExpiration];
      BOOL v17 = [v15 compare:v16] == (id)1;

      if (!v14) {
        goto LABEL_11;
      }
    }
    else
    {
      BOOL v17 = 0;
      if (!v14)
      {
LABEL_11:
        id v19 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v20 = @"NO";
          if (v14) {
            CFStringRef v21 = @"YES";
          }
          else {
            CFStringRef v21 = @"NO";
          }
          if (v17) {
            CFStringRef v20 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          CFStringRef v37 = v21;
          __int16 v38 = 2112;
          CFStringRef v39 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Virtual card hasSensitiveCredentials: %@, hasExpiredDynamicSecurityCode: %@; try fetching",
            buf,
            0x16u);
        }

        unsigned __int8 v22 = [v10 identifier];
        id v23 = [(PDDatabaseManager *)self->_databaseManager accountWithVirtualCardIdentifier:v22];
        id v24 = [v23 accountIdentifier];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        void v31[2] = sub_100252E58;
        v31[3] = &unk_100742B18;
        v31[4] = self;
        id v32 = v11;
        int64_t v35 = a5;
        id v34 = v13;
        id v33 = v10;
        [(PDAccountManager *)self performVirtualCardAction:1 forVirtualCardIdentifier:v22 forAccountIdentifier:v24 completion:v31];

        goto LABEL_19;
      }
    }
    if (!v17)
    {
      workQueue = self->_workQueue;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100253188;
      v25[3] = &unk_10073FD58;
      id v26 = v10;
      id v27 = v11;
      int64_t v30 = a5;
      unint64_t v28 = self;
      id v29 = v13;
      dispatch_async(workQueue, v25);

      goto LABEL_19;
    }
    goto LABEL_11;
  }
  if (v12) {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
LABEL_19:
}

- (void)_queueDecryptionRequest:(id)a3
{
  id v4 = a3;
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 virtualCard];
    int v7 = 138412290;
    id v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Adding virtual card decryption request \nvirtual card: %@", (uint8_t *)&v7, 0xCu);
  }
  [(NSMutableArray *)self->_decryptionRequests addObject:v4];
  [(PDAccountManager *)self _executeDecryptionRequests];
}

- (void)_executeDecryptionRequests
{
  if (!self->_processingVirtualCardDecryptionRequest && [(NSMutableArray *)self->_decryptionRequests count])
  {
    id v3 = [(NSMutableArray *)self->_decryptionRequests firstObject];
    if (v3)
    {
      self->_processingVirtualCardDecryptionRequest = 1;
      objc_initWeak(&location, self);
      v9[0] = 0;
      v9[1] = v9;
      v9[2] = 0x3032000000;
      v9[3] = sub_100020A5C;
      v9[4] = sub_100021020;
      id v10 = [v3 virtualCard];
      id v4 = [v3 authorization];
      id v5 = [v3 completion];
      objc_copyWeak(&v8, &location);
      id v7 = v5;
      id v6 = v3;
      PKPersistentBAACertificateAndKey();

      objc_destroyWeak(&v8);
      _Block_object_dispose(v9, 8);

      objc_destroyWeak(&location);
    }
  }
}

- (void)fetchKeychainCredentialForVirtualCardIdentifier:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (PKBAAUtilitiesAvailable())
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10025410C;
    v13[3] = &unk_100742758;
    id v16 = v10;
    void v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    [(PDAccountManager *)self accountWithIdentifier:v15 completion:v13];

    id v11 = v16;
LABEL_7:

    goto LABEL_8;
  }
  id v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error calling legacy virtual card, BAA utilities unavailable", buf, 2u);
  }

  if (v10)
  {
    id v11 = +[NSError errorWithDomain:PKAccountErrorDomain code:8 userInfo:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v11);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)promptDetailsForVirtualCard:(id)a3 showNotification:(BOOL)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100254D58;
  v6[3] = &unk_100742C70;
  BOOL v9 = a4;
  id v7 = a3;
  id v8 = self;
  id v5 = v7;
  [(PDAccountManager *)self accountWithVirtualCardIdentifier:v5 completion:v6];
}

- (void)deleteVirtualCardEncryptedDataForAccountIdentifier:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100254ED8;
  v6[3] = &unk_10072E9B0;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(PDAccountManager *)v7 accountWithIdentifier:a3 completion:v6];
}

- (void)noteVirtualCardAutoFilledBySafari:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100255178;
  v8[3] = &unk_1007368F0;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(PDAccountManager *)self accountsWithCompletion:v8];
}

- (void)fetchAllVirtualCardsForAccountIdentifier:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100255640;
  v7[3] = &unk_100742528;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(PDAccountManager *)v8 accountWithIdentifier:v6 completion:v7];
}

- (void)noteSecurityCodeActivityWithAction:(int64_t)a3 forSecurityCodeIdentifier:(id)a4 forVirtualCardIdentifier:(id)a5 forAccountIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100255AD8;
  v18[3] = &unk_100742D58;
  v18[4] = self;
  id v19 = a6;
  id v20 = v13;
  id v21 = v12;
  id v22 = a7;
  int64_t v23 = a3;
  id v14 = v22;
  id v15 = v12;
  id v16 = v13;
  id v17 = v19;
  [(PDAccountManager *)self accountWithIdentifier:v17 completion:v18];
}

- (void)physicalCardsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_100256210;
      block[3] = &unk_10072E9D8;
      void block[4] = self;
      id v11 = v6;
      id v12 = v8;
      dispatch_async(workQueue, block);
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)_queue_updatePhysicalCardsIfNecessaryForAccount:(id)a3
{
  id v4 = a3;
  if (v4
    && [(PDAccountManager *)self _shouldProactivelyFetchEndpoint:10 metadataType:7 fetchPeriodEndpoint:9 account:v4])
  {
    id v5 = [v4 accountIdentifier];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1002563E8;
    v6[3] = &unk_100741F20;
    id v7 = v4;
    [(PDAccountManager *)self _updatePhysicalCardsForAccountIdentifier:v5 force:0 completion:v6];
  }
}

- (void)_updatePhysicalCardsForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[PDAccountManagerPhysicalCardsRequest alloc] initWithAccountIdentifier:v9 force:v5];

  [(PDAccountManagerPhysicalCardsRequest *)v10 addCompletion:v8];
  [(PDAccountManager *)self _addAccountManagerFetchRequest:v10];
}

- (void)_managerFetch_updatePhysicalCardsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetching physical cards for account with identifier %@", buf, 0xCu);
  }

  if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002567CC;
    v12[3] = &unk_100742DF8;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    [(PDAccountManager *)self accountWithIdentifier:v13 completion:v12];

    id v10 = v13;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100256750;
    block[3] = &unk_10072F788;
    id v17 = v7;
    dispatch_async(replyQueue, block);
    id v10 = v17;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)beginPhysicalCardRequestWithOrder:(id)a3 forAccountWithIdentifier:(id)a4 accountUserAltDSID:(id)a5 deviceMetadata:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_1002575B0;
  v20[3] = &unk_100742E98;
  id v21 = v13;
  id v22 = v12;
  id v23 = a6;
  id v24 = v14;
  uint64_t v25 = self;
  id v26 = a7;
  id v15 = v26;
  id v16 = v14;
  id v17 = v23;
  id v18 = v12;
  id v19 = v13;
  [(PDAccountManager *)self accountWithIdentifier:v19 completion:v20];
}

- (void)completePhysicalCardRequest:(id)a3 withSignature:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [objc_alloc((Class)PKAccountWebServiceApplePayTrustRequest) initWithApplePayTrustProtocol:v8];
  [v11 setSignature:v10];

  paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100257ABC;
  v16[3] = &unk_10073C918;
  id v17 = v11;
  id v18 = self;
  id v19 = v8;
  id v20 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:v16];
}

- (void)_handlePhysicalCardRequestResponse:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100257D74;
  v11[3] = &unk_100742208;
  id v12 = a3;
  id v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  [(PDAccountManager *)self accountWithIdentifier:v9 completion:v11];
}

- (void)_handlePhysicalCardActionResponse:(id)a3 forAccountIdentifier:(id)a4 completion:(id)a5
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10025810C;
  v11[3] = &unk_100742208;
  id v12 = a3;
  id v13 = self;
  id v14 = a4;
  id v15 = a5;
  id v8 = v15;
  id v9 = v14;
  id v10 = v12;
  [(PDAccountManager *)self accountWithIdentifier:v9 completion:v11];
}

- (void)beginPhysicalCardAction:(id)a3 onPhysicalCardWithIdentifier:(id)a4 forAccountWithIdentifier:(id)a5 accountUserAltDSID:(id)a6 deviceMetadata:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10025851C;
  v24[3] = &unk_100742F38;
  id v25 = v14;
  id v26 = v15;
  id v27 = v16;
  id v28 = a7;
  id v29 = v17;
  int64_t v30 = self;
  id v31 = a8;
  id v18 = v31;
  id v19 = v17;
  id v20 = v28;
  id v21 = v16;
  id v22 = v15;
  id v23 = v14;
  [(PDAccountManager *)self accountWithIdentifier:v21 completion:v24];
}

- (void)completePhysicalCardActionRequest:(id)a3 withSignature:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [objc_alloc((Class)PKAccountWebServiceApplePayTrustRequest) initWithApplePayTrustProtocol:v8];
  [v11 setSignature:v10];

  paymentWebServiceCoordinator = self->_paymentWebServiceCoordinator;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100258A34;
  v16[3] = &unk_10073C918;
  id v17 = v11;
  id v18 = self;
  id v19 = v8;
  id v20 = v9;
  id v13 = v9;
  id v14 = v8;
  id v15 = v11;
  [(PDPaymentWebServiceCoordinator *)paymentWebServiceCoordinator performHandlerOnSharedWebServiceQueue:v16];
}

- (void)activatePhysicalCardWithActivationCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100258CD0;
    v8[3] = &unk_100742F88;
    void v8[4] = self;
    id v9 = v6;
    id v10 = v7;
    [(PDAccountManager *)self inactivePhysicalCardForFeatureIdentifier:2 completion:v8];
  }
}

- (void)inactivePhysicalCardForFeatureIdentifier:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100258E7C;
    v8[3] = &unk_10072E9B0;
    void v8[4] = self;
    id v9 = v6;
    [(PDAccountManager *)self defaultAccountForFeature:a3 completion:v8];
  }
}

- (void)physicalCardForFeatureIdentifier:(unint64_t)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = PKFeatureIdentifierToString();
      *(_DWORD *)buf = 138412546;
      id v17 = v8;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "physicalCardForFeatureIdentifier called with rawActivationCode %@, feature: %@", buf, 0x16u);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100259194;
    v12[3] = &unk_100742820;
    id v15 = v9;
    id v13 = v8;
    id v14 = self;
    [(PDAccountManager *)self defaultAccountForFeature:a3 completion:v12];
  }
}

- (void)activatePhysicalCardWithIdentifier:(id)a3 activationCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if ([v9 containsString:@"wallet://activate/nfc"])
    {
      id v11 = +[NSURLComponents componentsWithString:v9];
      [v11 queryItems];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      id v13 = [v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v13)
      {
        id v14 = v13;
        id v33 = v11;
        id v34 = self;
        id v15 = v9;
        id v35 = v8;
        uint64_t v16 = *(void *)v42;
        while (2)
        {
          for (unint64_t i = 0; i != v14; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v42 != v16) {
              objc_enumerationMutation(v12);
            }
            __int16 v18 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            id v19 = [v18 name];
            if (v19 != @"uid")
            {
              id v20 = v19;
              if (!v19) {
                continue;
              }
              unsigned int v21 = [(__CFString *)v19 isEqualToString:@"uid"];

              if (!v21) {
                continue;
              }
            }
            id v9 = [v18 value];

            self = v34;
            id v8 = v35;
            goto LABEL_15;
          }
          id v14 = [v12 countByEnumeratingWithState:&v41 objects:v45 count:16];
          if (v14) {
            continue;
          }
          break;
        }
        self = v34;
        id v8 = v35;
        id v9 = v15;
LABEL_15:
        id v11 = v33;
      }
    }
    id v22 = [(PDDatabaseManager *)self->_databaseManager accountWithPhysicalCardIdentifier:v8];
    databaseManager = self->_databaseManager;
    id v24 = [v22 accountIdentifier];
    id v25 = [(PDDatabaseManager *)databaseManager physicalCardsForAccountWithIdentifier:v24];

    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10025989C;
    v39[3] = &unk_1007424B0;
    id v26 = v8;
    id v40 = v26;
    uint64_t v27 = objc_msgSend(v25, "pk_anyObjectPassingTest:", v39);
    id v28 = (void *)v27;
    if (v22 && v27)
    {
      id v29 = [objc_alloc((Class)PKPhysicalCardAction) initWithActionType:4];
      [v29 setActivationCode:v9];
      [v22 accountIdentifier];
      v30 = id v36 = v9;
      [v28 accountUserAltDSID];
      v32 = id v31 = self;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100259920;
      v37[3] = &unk_100742FB0;
      id v38 = v10;
      [(PDAccountManager *)v31 beginPhysicalCardAction:v29 onPhysicalCardWithIdentifier:v26 forAccountWithIdentifier:v30 accountUserAltDSID:v32 deviceMetadata:0 completion:v37];

      id v9 = v36;
    }
    else
    {
      (*((void (**)(id, uint64_t))v10 + 2))(v10, 2);
    }
  }
}

- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStatementIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100259B8C;
    v12[3] = &unk_100730578;
    void v12[4] = self;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    dispatch_async(workQueue, v12);
  }
}

- (void)billPaymentSelectedSuggestedAmountDataEventsForAccountIdentifier:(id)a3 withStartDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100259DC4;
    block[3] = &unk_100731F38;
    void block[4] = self;
    id v16 = v10;
    id v17 = v11;
    id v18 = v12;
    id v19 = v13;
    dispatch_async(workQueue, block);
  }
}

- (void)scheduledPaymentsWithAccountIdentifier:(id)a3 includeFailedRecurringPayments:(BOOL)a4 allowFetchFromServer:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, void *, void))a6;
  id v12 = [(PDDatabaseManager *)self->_databaseManager scheduledPaymentsWithAccountIdentifier:v10 includeFailedRecurringPayments:v8];
  if (v11) {
    v11[2](v11, v12, 0);
  }
  if (v7
    && [(PDAccountManager *)self _shouldDownloadScheduledPaymentsForAccountIdentifier:v10])
  {
    id v13 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Downloading scheduled payments for account %@", buf, 0xCu);
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10025A06C;
    v14[3] = &unk_10072F200;
    v14[4] = self;
    [(PDAccountManager *)self accountWithIdentifier:v10 completion:v14];
  }
}

- (void)updateScheduledPaymentsWithAccount:(id)a3 completion:(id)a4
{
  id v6 = a4;
  [a3 accountIdentifier];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10025A148;
  v9[3] = &unk_100742820;
  id v11 = self;
  id v12 = v6;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v10;
  id v8 = v6;
  [(PDAccountManager *)self accountWithIdentifier:v7 completion:v9];
}

- (id)_cacheKeyForScheduledPaymentsWithAccountIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"%@-%@", PKSharedCacheLastScheduledPaymentsDownloadKey, a3];
}

- (BOOL)_shouldDownloadScheduledPaymentsForAccountIdentifier:(id)a3
{
  id v3 = [(PDAccountManager *)self _cacheKeyForScheduledPaymentsWithAccountIdentifier:a3];
  id v4 = PKSharedCacheGetDateForKey();
  BOOL v5 = v4;
  if (v4)
  {
    [v4 timeIntervalSinceNow];
    BOOL v7 = fabs(v6) >= 86400.0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (void)accountHoldsForAccountIdentifier:(id)a3 completion:(id)a4
{
  BOOL v7 = (void (**)(id, void *))a4;
  double v6 = [(PDDatabaseManager *)self->_databaseManager placedHoldsWithAccountIdentifier:a3];
  if (v7) {
    v7[2](v7, v6);
  }
}

- (void)scheduleSetupReminderForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10025AB10;
  v7[3] = &unk_100742528;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(PDAccountManager *)v8 accountWithIdentifier:v6 completion:v7];
}

- (id)_setupNotificationIdentifierForAccountIdentifier:(id)a3
{
  return +[NSString stringWithFormat:@"%@%@", @"accountSetup-", a3];
}

- (void)insertSummaryNotificationForAccountIdentifier:(id)a3 summaryType:(int64_t)a4 completion:(id)a5
{
  id v9 = a5;
  [(PDAccountNotificationController *)self->_accountNotificationController insertSummaryNotificationForAccountIdentifier:a3 summaryType:a4];
  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
    id v8 = v9;
  }
}

- (void)insertDailyCashNotificationForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  accountNotificationController = self->_accountNotificationController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10025AED4;
  v9[3] = &unk_10072F788;
  id v10 = v6;
  id v8 = v6;
  [(PDAccountNotificationController *)accountNotificationController updateDailyCashNotificationsForAccountIdentifier:a3 date:0 completion:v9];
}

- (void)markUserViewedIntroduction:(BOOL)a3 forInstallmentIdentifiers:(id)a4 accountIdentifier:(id)a5 completion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10025AFC8;
  v11[3] = &unk_100742460;
  id v12 = self;
  id v13 = a4;
  BOOL v15 = a3;
  id v14 = a6;
  id v9 = v14;
  id v10 = v13;
  [(PDAccountManager *)v12 accountWithIdentifier:a5 completion:v11];
}

- (void)exportTransactionDataForAccountIdentifier:(id)a3 withFileFormat:(id)a4 beginDate:(id)a5 endDate:(id)a6 productTimeZone:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10025B480;
  v24[3] = &unk_100743050;
  id v29 = a7;
  id v30 = a8;
  void v24[4] = self;
  id v25 = v14;
  id v26 = v16;
  id v27 = v17;
  id v28 = v15;
  id v18 = v29;
  id v19 = v15;
  id v20 = v17;
  id v21 = v16;
  id v22 = v14;
  id v23 = v30;
  [(PDAccountManager *)self accountWithIdentifier:v22 completion:v24];
}

- (void)updateAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 trigger:(unint64_t)a5 completion:(id)a6
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10025B7C8;
  v12[3] = &unk_1007430A0;
  id v13 = self;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  unint64_t v17 = a5;
  id v9 = v15;
  id v10 = v14;
  id v11 = v16;
  [(PDAccountManager *)v13 accountWithIdentifier:v9 completion:v12];
}

- (void)deleteAccountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10025BDF8;
  v10[3] = &unk_100737110;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v14;
  id v8 = v13;
  id v9 = v12;
  [(PDAccountManager *)v11 accountsWithCompletion:v10];
}

- (void)accountStatementMetadataForAllAccountsWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10025C09C;
  v4[3] = &unk_1007346F0;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(PDAccountManager *)v5 accountsWithCompletion:v4];
}

- (void)accountStatementMetadataForStatementIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10025C4D0;
  v10[3] = &unk_100738DE8;
  id v11 = self;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v7 = v13;
  id v8 = v12;
  id v9 = v14;
  [(PDAccountManager *)v11 accountWithIdentifier:v7 completion:v10];
}

- (void)_managerFetch_exportTransactionsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  id v9 = v8;
  if (v8)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10025C8B8;
    v12[3] = &unk_100730C10;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    dispatch_async(workQueue, v12);
  }
  else if (v7)
  {
    id v11 = +[NSError errorWithDomain:PKAccountErrorDomain code:3 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (void)cloudStoreNotificationCoordinator:(id)a3 createdZoneWithName:(id)a4 forContainerName:(id)a5 scope:(int64_t)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = PKCurrentCloudStoreApplePayContainerName();
  id v12 = v10;
  id v13 = v11;
  if (v13 == v12)
  {
  }
  else
  {
    id v14 = v13;
    if (!v12 || !v13)
    {

      goto LABEL_23;
    }
    unsigned int v15 = [v12 isEqualToString:v13];

    if (!v15) {
      goto LABEL_23;
    }
  }
  if (a6 == 2)
  {
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10025D3F8;
    v36[3] = &unk_1007430F0;
    id v16 = v9;
    id v37 = v16;
    id v38 = v12;
    CFStringRef v39 = self;
    unint64_t v17 = objc_retainBlock(v36);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10025D4F0;
    v35[3] = &unk_100743140;
    v35[4] = self;
    id v18 = objc_retainBlock(v35);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10025D740;
    void v32[3] = &unk_10072E198;
    id v19 = v16;
    id v33 = v19;
    id v34 = self;
    id v20 = objc_retainBlock(v32);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10025D9D8;
    v29[3] = &unk_10073A328;
    v29[4] = self;
    id v21 = v19;
    id v30 = v21;
    id v22 = v17;
    id v31 = v22;
    id v23 = objc_retainBlock(v29);
    id v24 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v21;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "PDAccountManager: The %@ zone was created.", buf, 0xCu);
    }

    id v27 = 0;
    uint64_t v28 = 0;
    +[PKCloudStoreZone zoneValueForZoneName:v21 outZoneType:&v28 outAccountIdentifier:&v27 altDSID:0];
    id v25 = v27;
    switch(v28)
    {
      case 0:
      case 3:
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v21;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Not alerting account service of created zoneName %@", buf, 0xCu);
        }

        break;
      case 1:
        ((void (*)(void *, uint64_t))v23[2])(v23, 2);
        break;
      case 2:
      case 4:
      case 5:
      case 6:
      case 8:
        ((void (*)(void *, id))v22[2])(v22, v25);
        break;
      case 7:
        ((void (*)(void *, uint64_t))v18[2])(v18, 4);
        ((void (*)(void *))v20[2])(v20);
        break;
      default:
        break;
    }
  }
  else
  {
    id v26 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v9;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Ignoring zone creation for zoneName %@", buf, 0xCu);
    }
  }
LABEL_23:
}

- (void)_managerFetch_createdZoneWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 zoneAccountIdentifier];
  id v9 = [v6 zoneName];
  if (v8)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    void v20[2] = sub_10025DDFC;
    v20[3] = &unk_1007431B0;
    id v10 = (id *)v21;
    v21[0] = v6;
    v21[1] = self;
    id v24 = v7;
    id v11 = v8;
    id v22 = v11;
    id v12 = v9;
    id v23 = v12;
    id v13 = objc_retainBlock(v20);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10025E3B0;
    v16[3] = &unk_100742528;
    id v17 = v12;
    id v18 = self;
    id v19 = v13;
    id v14 = v13;
    [(PDAccountManager *)self accountWithIdentifier:v11 completion:v16];

LABEL_5:
    goto LABEL_6;
  }
  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10025DD80;
    block[3] = &unk_10072F788;
    id v10 = &v26;
    id v26 = v7;
    dispatch_async(replyQueue, block);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)sharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10025E748;
      v11[3] = &unk_100742280;
      void v11[4] = self;
      id v13 = v7;
      id v12 = v6;
      [(PDAccountManager *)self accountWithIdentifier:v12 completion:v11];

      id v9 = v13;
    }
    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_10025E734;
      block[3] = &unk_10072F788;
      id v15 = v7;
      dispatch_async(replyQueue, block);
      id v9 = v15;
    }
  }
}

- (void)updateSharedAccountCloudStoreWithAccountIdentifier:(id)a3 completion:(id)a4
{
}

- (void)_updateSharedAccountCloudStoreWithAccountIdentifier:(id)a3 fromPush:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[PDAccountManagerSharedAccountCloudStoreRequest alloc] initWithAccountIdentifier:v9 fromPush:v5];

  [(PDAccountManagerSharedAccountCloudStoreRequest *)v10 addCompletion:v8];
  [(PDAccountManager *)self _addAccountManagerFetchRequest:v10];
}

- (void)_managerFetch_sharedAccountCloudStoreWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  if (v8)
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating shared account cloud store for account identifier %@", buf, 0xCu);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10025EDAC;
    v12[3] = &unk_100742DF8;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    [(PDAccountManager *)self accountWithIdentifier:v13 completion:v12];

    id v10 = v13;
    goto LABEL_7;
  }
  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10025ED30;
    block[3] = &unk_10072F788;
    id v17 = v7;
    dispatch_async(replyQueue, block);
    id v10 = v17;
LABEL_7:
  }
}

- (void)paymentFundingSourcesForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10025F86C;
      v11[3] = &unk_100742528;
      void v11[4] = self;
      id v12 = v6;
      id v13 = v8;
      [(PDAccountManager *)self accountWithIdentifier:v12 completion:v11];

      id v9 = v12;
    }
    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_10025F858;
      block[3] = &unk_10072F788;
      id v15 = v7;
      dispatch_async(replyQueue, block);
      id v9 = v15;
    }
  }
}

- (void)paymentFundingSourceForIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v10)
  {
    if (v8)
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10025FB94;
      v14[3] = &unk_100742208;
      v14[4] = self;
      id v15 = v8;
      id v16 = v9;
      id v17 = v11;
      [(PDAccountManager *)self accountWithIdentifier:v16 completion:v14];

      id v12 = v15;
    }
    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_10025FB80;
      block[3] = &unk_10072F788;
      id v19 = v10;
      dispatch_async(replyQueue, block);
      id v12 = v19;
    }
  }
}

- (void)updatePaymentFundingSourcesForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[PDAccountManagerFundingSourcesRequest alloc] initWithAccountIdentifier:v9 force:v5];

  [(PDAccountManagerFundingSourcesRequest *)v10 addCompletion:v8];
  [(PDAccountManager *)self _addAccountManagerFetchRequest:v10];
}

- (void)_managerFetch_updateFundingSourcesWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  if (v8)
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Updating funding sources for account identifier %@", buf, 0xCu);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100260060;
    v12[3] = &unk_100742DF8;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    [(PDAccountManager *)self accountWithIdentifier:v13 completion:v12];

    id v10 = v13;
    goto LABEL_7;
  }
  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10025FFE4;
    block[3] = &unk_10072F788;
    id v17 = v7;
    dispatch_async(replyQueue, block);
    id v10 = v17;
LABEL_7:
  }
}

- (void)_queue_updatePaymentFundingSourcesIfNecessaryForAccount:(id)a3
{
  id v4 = a3;
  if (v4
    && [(PDAccountManager *)self _shouldProactivelyFetchEndpoint:6 metadataType:2 fetchPeriodEndpoint:6 account:v4])
  {
    BOOL v5 = [v4 accountIdentifier];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100260BEC;
    v6[3] = &unk_100741EF8;
    id v7 = v4;
    [(PDAccountManager *)self updatePaymentFundingSourcesForAccountIdentifier:v5 force:0 completion:v6];
  }
}

- (void)didAddAccountPendingFamilyMembers:(id)a3
{
  id v4 = a3;
  replyQueue = self->_replyQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100260D68;
  v7[3] = &unk_10072E198;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(replyQueue, v7);
}

- (void)accountPendingFamilyMembersForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100260E3C;
    block[3] = &unk_100731830;
    id v12 = v7;
    void block[4] = self;
    id v11 = v6;
    dispatch_async(replyQueue, block);
  }
}

- (void)accountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7
{
  if (a7)
  {
    databaseManager = self->_databaseManager;
    id v12 = (void (**)(id, id, void))a7;
    id v13 = [(PDDatabaseManager *)databaseManager accountBalancesForAccountIdentifier:a3 startDate:a4 endDate:a5 type:a6 limit:0];
    v12[2](v12, v13, 0);
  }
}

- (void)updateAccountBalancesForAccountIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 type:(unint64_t)a6 completion:(id)a7
{
  id v47 = a3;
  id v46 = a4;
  id v12 = a5;
  id v13 = a7;
  if (v13)
  {
    id v44 = v13;
    id v14 = [(PDDatabaseManager *)self->_databaseManager accountBalancesForAccountIdentifier:v47 startDate:v46 endDate:0 type:1 limit:1];
    id v15 = [v14 firstObject];
    id v45 = [v15 date];

    if (!v45 || (v16 = [v45 compare:v46], id v17 = v45, v16 != (id)1)) {
      id v17 = v46;
    }
    id v18 = v17;
    if (a6 == 2)
    {
      if (v45)
      {
        [v45 timeIntervalSinceNow];
        unsigned int v19 = fabs(v20) > 600.0;
      }
      else
      {
        unsigned int v19 = 1;
      }
    }
    else if (a6 == 1 && ([v45 isToday] & 1) == 0)
    {
      unsigned int v19 = [v45 isYesterday] ^ 1;
    }
    else
    {
      unsigned int v19 = 0;
    }
    uint64_t v63 = 0;
    id v64 = &v63;
    uint64_t v65 = 0x3032000000;
    id v66 = sub_100020A5C;
    id v67 = sub_100021020;
    id v68 = [(PDDatabaseManager *)self->_databaseManager accountEndpointMetadataForAccountIdentifier:v47 endpoint:5];
    if (v19)
    {
      id v21 = (void *)v64[5];
      if (!v21)
      {
        id v22 = [[PDAccountWebServiceEndpointMetadata alloc] initWithAccountIdentifier:v47 endpoint:5];
        id v23 = (void *)v64[5];
        v64[5] = (uint64_t)v22;

        id v21 = (void *)v64[5];
      }
      id v24 = [v21 lastUpdated];
      id v25 = v24;
      if (v24 && ([v24 timeIntervalSinceNow], fabs(v26) < 600.0))
      {
        id v27 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v25;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Not fetching balances because recent fetch at %@", buf, 0xCu);
        }

        int v28 = 0;
      }
      else
      {
        int v28 = 1;
      }
      if ([v18 compare:v12] == (id)1)
      {
        id v29 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v18;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v12;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Start date %@ after end date %@", buf, 0x16u);
        }
      }
      else
      {

        if (v28)
        {
          id v30 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
          long long v43 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
          id v31 = [v43 dateByAddingUnit:16 value:365 toDate:v18 options:0];
          id v32 = PKEndOfDay();

          *(void *)buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          long long v70 = sub_100020A5C;
          long long v71 = sub_100021020;
          id v72 = 0;
          while ([v32 compare:v12])
          {
            if ([v32 compare:v12] == (id)1)
            {
              id v33 = v12;

              id v32 = v33;
            }
            id v34 = v18;
            id v35 = v32;
            v56[0] = _NSConcreteStackBlock;
            v56[1] = 3221225472;
            v56[2] = sub_10026168C;
            v56[3] = &unk_100743250;
            id v36 = v34;
            id v57 = v36;
            id v37 = v35;
            id v58 = v37;
            id v38 = v47;
            long long v61 = buf;
            unint64_t v62 = a6;
            id v59 = v38;
            id v60 = self;
            [v30 addOperation:v56];
            id v32 = v12;
            id v18 = v36;
            if (v37 != v12)
            {
              id v18 = [v37 dateByAddingTimeInterval:1.0];

              CFStringRef v39 = [v43 dateByAddingUnit:16 value:365 toDate:v18 options:0];
              id v32 = PKEndOfDay();
            }
          }
          id v41 = +[NSNull null];
          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_100261C60;
          v48[3] = &unk_100743278;
          id v53 = &v63;
          id v54 = buf;
          id v52 = v44;
          v48[4] = self;
          id v49 = v47;
          id v50 = v46;
          id v51 = v12;
          unint64_t v55 = a6;
          id v42 = [v30 evaluateWithInput:v41 completion:v48];

          _Block_object_dispose(buf, 8);
          goto LABEL_37;
        }
      }
    }
    id v40 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v12;
      *(_WORD *)&buf[22] = 2112;
      long long v70 = (uint64_t (*)(uint64_t, uint64_t))v45;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Not requesting balances from %@ to %@, most recent from %@", buf, 0x20u);
    }

    id v30 = +[NSError errorWithDomain:PKAccountErrorDomain code:9 userInfo:0];
    (*((void (**)(id, void, id))v44 + 2))(v44, 0, v30);
LABEL_37:

    _Block_object_dispose(&v63, 8);
    id v13 = v44;
  }
}

- (void)resetAccountBalancesForAccountIdentifier:(id)a3 completion:(id)a4
{
  databaseManager = self->_databaseManager;
  id v8 = (void (**)(id, void))a4;
  id v7 = a3;
  [(PDDatabaseManager *)databaseManager resetAccountBalancesForAccountIdentifier:v7];
  [(PDDatabaseManager *)self->_databaseManager deleteAccountEndpointMetadataForAccountIdentifier:v7 endpoint:5];

  v8[2](v8, 0);
}

- (void)_updateFinancingPlansForAccountWithIdentifier:(id)a3 pageOffset:(unint64_t)a4 limit:(unint64_t)a5 ignoreLastUpdatedDate:(BOOL)a6 fromPush:(BOOL)a7 completion:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  id v12 = a8;
  id v13 = a3;
  id v14 = [[PDAccountManagerFinancingPlansRequest alloc] initWithAccountIdentifier:v13 fromPush:v8];

  if (PKPayLaterIgnoreLastUpdatedDate())
  {
    id v15 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PKPayLaterIgnoreLastUpdatedDate flag is set", v16, 2u);
    }

    BOOL v9 = 1;
  }
  [(PDAccountManagerFinancingPlansRequest *)v14 setIgnoreLastUpdatedDate:v9];
  [(PDAccountManagerFinancingPlansRequest *)v14 addCompletion:v12];

  [(PDAccountManager *)self _addAccountManagerFetchRequest:v14];
}

- (void)_managerFetch_updateFinancingPlansWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [v6 accountIdentifier];
  BOOL v9 = v8;
  if (v8)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100261FF4;
    v12[3] = &unk_100730C10;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    dispatch_async(workQueue, v12);
  }
  else if (v7)
  {
    id v11 = +[NSError errorWithDomain:PKAccountErrorDomain code:3 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

- (id)_queue_processFinancingPlans:(id)a3 accountIdentifier:(id)a4 updateReasons:(unint64_t)a5
{
  id v8 = a3;
  id v38 = a4;
  id v9 = objc_alloc_init((Class)NSMutableArray);
  id v35 = objc_alloc_init((Class)NSMutableArray);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v50;
    uint64_t v34 = *(void *)v50;
    do
    {
      id v13 = 0;
      id v36 = v11;
      do
      {
        if (*(void *)v50 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v49 + 1) + 8 * (void)v13);
        databaseManager = self->_databaseManager;
        id v16 = [v14 planIdentifier];
        id v17 = [(PDDatabaseManager *)databaseManager financingPlanWithIdentifier:v16];

        if ([v14 state] != (id)7)
        {
          double v20 = [(PDDatabaseManager *)self->_databaseManager insertOrUpdateFinancingPlan:v14 forAccountIdentifier:v38];
          unint64_t v21 = a5;
          [v20 addUpdateReasons:a5];
          id v22 = v9;
          [v9 safelyAddObject:v20];
          [(PDAccountManager *)self _queue_writeFinancingPlanUpdateIfPossibleWithOldFinancingPlan:v17 newFinancingPlan:v20];
          id v23 = [v20 merchant];
          id v24 = [v17 merchant];
          if (v24) {
            BOOL v25 = 1;
          }
          else {
            BOOL v25 = v23 == 0;
          }
          if (!v25 || ([v23 payLaterMerchantDictionaryIsEqual:v24] & 1) == 0)
          {
            double v26 = [v20 planIdentifier];
            id v27 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v54 = v26;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Merchant data did change for plan %@. Setting requiresMerchantReprocessing to true.", buf, 0xCu);
            }

            [v23 setRequiresMerchantReprocessing:1];
            [(PDDatabaseManager *)self->_databaseManager updateProcessedPayLaterMerchant:v23 forFinancingPlanIdentifier:v26];
            uint64_t v28 = [(PDDatabaseManager *)self->_databaseManager financingPlanWithIdentifier:v26];

            double v20 = (void *)v28;
          }
          if (v20 && !v17)
          {
            v43[0] = _NSConcreteStackBlock;
            v43[1] = 3221225472;
            v43[2] = sub_100263260;
            v43[3] = &unk_1007424D8;
            v43[4] = self;
            id v44 = v20;
            id v45 = v38;
            [(PDAccountManager *)self _accessObserversWithHandler:v43];
            id v29 = &v45;
            id v30 = &v44;
            goto LABEL_24;
          }
          if (v20 && v17)
          {
            v39[0] = _NSConcreteStackBlock;
            v39[1] = 3221225472;
            v39[2] = sub_1002632C4;
            v39[3] = &unk_100742190;
            void v39[4] = self;
            id v40 = v20;
            id v41 = v17;
            id v42 = v38;
            [(PDAccountManager *)self _accessObserversWithHandler:v39];

            id v29 = &v41;
            id v30 = &v40;
LABEL_24:
          }
          [v35 safelyAddObject:v20];

          id v9 = v22;
          a5 = v21;
          uint64_t v12 = v34;
          id v11 = v36;
          goto LABEL_29;
        }
        [v17 addUpdateReasons:a5];
        [v9 safelyAddObject:v14];
        [(PDAccountManager *)self _queue_writeFinancingPlanUpdateIfPossibleWithOldFinancingPlan:v17 newFinancingPlan:0];
        id v18 = self->_databaseManager;
        if (v14) {
          unsigned int v19 = v14;
        }
        else {
          unsigned int v19 = v17;
        }
        id v31 = [v19 planIdentifier];
        [(PDDatabaseManager *)v18 deleteFinancingPlanWithIdentifier:v31 forAccountIdentifier:v38];

        if (v17)
        {
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_1002631FC;
          v46[3] = &unk_1007424D8;
          v46[4] = self;
          id v47 = v17;
          id v48 = v38;
          [(PDAccountManager *)self _accessObserversWithHandler:v46];
        }
LABEL_29:

        id v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [obj countByEnumeratingWithState:&v49 objects:v55 count:16];
    }
    while (v11);
  }

  if ([v35 count]) {
    [(PDPayLaterMerchantProcessor *)self->_payLaterMerchantProcessor processFinancingPlans:v35];
  }
  [(PDAccountManager *)self recomputePayLaterCardMagntiudesForAccountIdentifier:v38];
  id v32 = [v9 copy];

  return v32;
}

- (void)_queue_writeFinancingPlanUpdateIfPossibleWithOldFinancingPlan:(id)a3 newFinancingPlan:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (PKPayLaterSaveFinancingPlanJSONOnUpdate() && v5 | v6)
  {
    id v7 = PKPayLaterFinancingPlanUpdatesDirectory();
    id v8 = +[NSFileManager defaultManager];
    id v9 = +[NSDate date];
    id v10 = PKISO8601DateStringFromDate();

    id v11 = [v7 path];
    unsigned __int8 v12 = [v8 fileExistsAtPath:v11];

    if ((v12 & 1) == 0) {
      [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:0];
    }
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1002637B4;
    v46[3] = &unk_100743318;
    id v34 = v10;
    id v47 = v34;
    id v48 = v7;
    id v13 = v8;
    id v49 = v13;
    id v14 = objc_retainBlock(v46);
    ((void (*)(void *, unint64_t, uint64_t))v14[2])(v14, v5, 1);
    id v33 = v14;
    unint64_t v35 = v6;
    ((void (*)(void *, unint64_t, void))v14[2])(v14, v6, 0);
    id v38 = v7;
    id v15 = [v7 path];
    CFStringRef v39 = v13;
    id v16 = [v13 contentsOfDirectoryAtPath:v15 error:0];

    id v40 = objc_alloc_init((Class)NSMutableArray);
    id v36 = v16;
    if ((unint64_t)[v16 count] >= 0x33)
    {
      unint64_t v32 = v5;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id obj = v16;
      id v17 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v43;
        do
        {
          for (unint64_t i = 0; i != v18; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v43 != v19) {
              objc_enumerationMutation(obj);
            }
            unint64_t v21 = [v38 URLByAppendingPathComponent:*(void *)(*((void *)&v42 + 1) + 8 * i)];
            id v22 = [v21 path];

            id v23 = [v39 attributesOfItemAtPath:v22 error:0];
            id v24 = [v23 objectForKey:NSFileCreationDate];
            id v25 = objc_alloc_init((Class)NSMutableDictionary);
            [v25 safelySetObject:v24 forKey:NSFileCreationDate];
            [v25 safelySetObject:v22 forKey:@"FilePath"];
            [v40 addObject:v25];
          }
          id v18 = [obj countByEnumeratingWithState:&v42 objects:v54 count:16];
        }
        while (v18);
      }

      [v40 sortUsingComparator:&stru_100743358];
      uint64_t v26 = (uint64_t)[obj count] - 50;
      unint64_t v5 = v32;
      if (v26 >= 1)
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          uint64_t v28 = [v40 objectAtIndexedSubscript:j];
          id v29 = [v28 objectForKeyedSubscript:@"FilePath"];
          id v41 = 0;
          [v39 removeItemAtPath:v29 error:&v41];
          id v30 = v41;
          if (v30)
          {
            id v31 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              long long v51 = v29;
              __int16 v52 = 2112;
              id v53 = v30;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Error removing file at path %@:, error: %@", buf, 0x16u);
            }
          }
        }
      }
    }

    unint64_t v6 = v35;
  }
}

- (void)financingPlansForAllAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100263B64;
    v6[3] = &unk_1007346F0;
    void v6[4] = self;
    id v7 = v4;
    [(PDAccountManager *)self accountsWithCompletion:v6];
  }
}

- (void)financingPlansWithQueries:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    unint64_t v21 = v7;
    id v9 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
    id v10 = objc_alloc_init((Class)NSMutableDictionary);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v22 = v6;
    id obj = v6;
    id v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v32;
      do
      {
        for (unint64_t i = 0; i != v12; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v16 = objc_msgSend(v15, "accountIdentifier", v21);
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_100264134;
          v27[3] = &unk_100730C60;
          v27[4] = self;
          id v28 = v16;
          id v29 = v15;
          id v30 = v10;
          id v17 = v16;
          [v9 addOperation:v27];
        }
        id v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v12);
    }

    id v18 = +[NSNull null];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10026445C;
    v24[3] = &unk_1007347D0;
    void v24[4] = self;
    id v8 = v21;
    id v25 = v10;
    id v26 = v21;
    id v19 = v10;
    id v20 = [v9 evaluateWithInput:v18 completion:v24];

    id v6 = v22;
  }
}

- (void)financingPlansForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100264628;
    v8[3] = &unk_100742528;
    void v8[4] = self;
    id v9 = v6;
    id v10 = v7;
    [(PDAccountManager *)self accountWithIdentifier:v9 completion:v8];
  }
}

- (void)financingPlanForPlanIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_1002648A8;
    block[3] = &unk_10072E9D8;
    void block[4] = self;
    id v10 = v6;
    id v11 = v7;
    dispatch_async(workQueue, block);
  }
}

- (void)financingPlanInstallmentsDueDateRangeForAccountIdentifier:(id)a3 financingPlanStates:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100264A74;
    v11[3] = &unk_100742208;
    void v11[4] = self;
    id v12 = v8;
    id v13 = v9;
    id v14 = v10;
    [(PDAccountManager *)self accountWithIdentifier:v12 completion:v11];
  }
}

- (void)reprocessPayLaterFinancingPlansForMerchantCleanup:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100264D10;
  v7[3] = &unk_10072FDC8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)deleteFinancingPlansForAllAccountsWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100264EEC;
    v6[3] = &unk_1007346F0;
    void v6[4] = self;
    id v7 = v4;
    [(PDAccountManager *)self accountsWithCompletion:v6];
  }
}

- (void)cancelFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 cancellationReasonIdentifier:(id)a5 cancellationReasonDescription:(id)a6 completion:(id)a7
{
  id v17 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, PDAccountManagerFinancingPlanCancellationRequest *))a7;
  if (v17 && v12)
  {
    id v16 = [[PDAccountManagerFinancingPlanCancellationRequest alloc] initWithAccountIdentifier:v12 planIdentifier:v17 cancellationReasonIdentifier:v13 cancellationReasonDescription:v14];
    [(PDAccountManagerFinancingPlanCancellationRequest *)v16 addCompletion:v15];
    [(PDAccountManager *)self _addAccountManagerFetchRequest:v16];
  }
  else
  {
    if (!v15) {
      goto LABEL_7;
    }
    id v16 = +[NSError errorWithDomain:PKAccountErrorDomain code:3 userInfo:0];
    v15[2](v15, v16);
  }

LABEL_7:
}

- (void)_managerFetch_cancelFinancingPlanWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  id v9 = v8;
  if (v8)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100265584;
    v12[3] = &unk_100730C10;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    dispatch_async(workQueue, v12);
  }
  else if (v7)
  {
    id v11 = +[NSError errorWithDomain:PKAccountErrorDomain code:3 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)deleteFinancingPlansForAccountIdentifier:(id)a3 completion:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100265DA8;
  v6[3] = &unk_10072E9B0;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(PDAccountManager *)v7 accountWithIdentifier:a3 completion:v6];
}

- (void)deleteFinancingPlanWithIdentifier:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100266254;
  v15[3] = &unk_100730578;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (void)recomputePayLaterCardMagntiudesForAccountIdentifier:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002664A8;
  v7[3] = &unk_10072E198;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

- (void)payLaterCardMagnitudesForAccountIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100266694;
  block[3] = &unk_10072E9D8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

- (void)_queue_updateFinancingPlansIfNeccessaryForAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 accountIdentifier];
    id v7 = [(PDDatabaseManager *)self->_databaseManager accountEndpointMetadataForAccountIdentifier:v6 endpoint:1];
    id v8 = [v7 isDirty];
    id v9 = [v7 localLastUpdated];
    LODWORD(v8) = [(PDAccountManager *)self _shouldProactivelyFetchEndpoint:5 dirty:v8 lastUpdated:v9 fetchPeriodEndpoint:5 account:v5];

    if (v8)
    {
      id v10 = [v5 accountIdentifier];
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1002668B8;
      v11[3] = &unk_100741EF8;
      id v12 = v6;
      [(PDAccountManager *)self _updateFinancingPlansForAccountWithIdentifier:v10 pageOffset:0 limit:0 ignoreLastUpdatedDate:0 fromPush:0 completion:v11];
    }
  }
}

- (void)insertOrUpdateLocalAccountFinancingPlans:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v9)
  {
    workQueue = self->_workQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100266A88;
    v13[3] = &unk_100730578;
    void v13[4] = self;
    id v14 = v8;
    id v15 = v9;
    id v16 = v11;
    dispatch_async(workQueue, v13);
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)payLaterMerchantProcessor:(id)a3 didProcessPayLaterMerchant:(id)a4 forFinancingPlan:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  void block[2] = sub_100266C28;
  block[3] = &unk_10072E238;
  id v13 = v8;
  id v14 = v7;
  id v15 = self;
  id v10 = v7;
  id v11 = v8;
  dispatch_async(workQueue, block);
}

- (void)environmentStore:(id)a3 storedEnvironment:(id)a4 differsFromCurrent:(id)a5 commitBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  if ([v12 localeDiffersFromEnvironment:v11])
  {
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100266F20;
    v14[3] = &unk_1007433F8;
    objc_copyWeak(&v15, &location);
    [(PDAccountManager *)self defaultAccountForFeature:4 completion:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  v13[2](v13);
}

- (void)rewardsTierSummaryForTransactionSourceIdentifiers:(id)a3 currencyCode:(id)a4 startDate:(id)a5 endDate:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  workQueue = self->_workQueue;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100267120;
  v23[3] = &unk_10072FEA8;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(workQueue, v23);
}

- (void)sendAccountReport:(id)a3 trigger:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = (void (**)(void, void))v9;
  if (v8)
  {
    id v11 = [v8 accountIdentifier];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10026733C;
    v13[3] = &unk_100743420;
    void v13[4] = self;
    id v14 = v8;
    id v15 = v10;
    unint64_t v16 = a4;
    [(PDAccountManager *)self accountWithIdentifier:v11 completion:v13];
  }
  else if (v9)
  {
    id v12 = +[NSError errorWithDomain:PKAccountErrorDomain code:3 userInfo:0];
    ((void (**)(void, void *))v10)[2](v10, v12);
  }
}

- (void)_managerFetch_sendAccountReport:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  id v9 = v8;
  if (v8)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002677CC;
    v12[3] = &unk_100730C10;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    dispatch_async(workQueue, v12);
  }
  else if (v7)
  {
    id v11 = +[NSError errorWithDomain:PKAccountErrorDomain code:3 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 observeCooldownPeriod:(BOOL)a4 completion:(id)a5
{
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)updateAccountPromotionsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 completion:(id)a5
{
}

- (void)_updateAccountPromotionsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 observeCooldownPeriod:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = [[PDAccountManagerPromotionsRequest alloc] initWithAccountIdentifier:v11 ignoreErrorBackoff:v7 observeCooldownPeriod:v6];

  [(PDAccountManagerPromotionsRequest *)v12 addCompletion:v10];
  [(PDAccountManager *)self _addAccountManagerFetchRequest:v12];
}

- (void)insertOrUpdateAccountPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (a3 && a4)
  {
    [(PDDatabaseManager *)self->_databaseManager insertOrUpdateAccountPromotions:a3 accountIdentifier:a4];
    replyQueue = self->_replyQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100267F88;
    v13[3] = &unk_10072F788;
    id v11 = &v14;
    id v14 = v9;
    id v12 = v13;
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100267F74;
    block[3] = &unk_10072F788;
    id v11 = &v16;
    id v16 = v8;
    id v12 = block;
  }
  dispatch_async(replyQueue, v12);
}

- (void)accountPromotionsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1002680E4;
      v11[3] = &unk_100742528;
      void v11[4] = self;
      id v12 = v6;
      id v13 = v8;
      [(PDAccountManager *)self accountWithIdentifier:v12 completion:v11];

      id v9 = v12;
    }
    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_1002680D0;
      block[3] = &unk_10072F788;
      id v15 = v7;
      dispatch_async(replyQueue, block);
      id v9 = v15;
    }
  }
}

- (void)deleteAccountPromotion:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100268380;
  v15[3] = &unk_100730578;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (void)updateImpressionCountsForPromotions:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9 && [v8 count])
  {
    [(PDDatabaseManager *)self->_databaseManager updateImpressionCountsForPromotions:v8 accountIdentifier:v9];
    replyQueue = self->_replyQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100268600;
    v16[3] = &unk_10072F788;
    id v12 = &v17;
    id v17 = v10;
    id v13 = v10;
    id v14 = v16;
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100268588;
    block[3] = &unk_10072F788;
    id v12 = &v19;
    id v19 = v10;
    id v15 = v10;
    id v14 = block;
  }
  dispatch_async(replyQueue, v14);
}

- (void)updateImpressionCount:(int64_t)a3 promotionProgramIdentifier:(id)a4 accountIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = v10;
  if (a4 && a5)
  {
    [(PDDatabaseManager *)self->_databaseManager updateImpressionCount:a3 promotionProgramIdentifier:a4 accountIdentifier:a5];
    replyQueue = self->_replyQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1002687BC;
    v15[3] = &unk_10072F788;
    id v13 = &v16;
    id v16 = v11;
    id v14 = v15;
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100268744;
    block[3] = &unk_10072F788;
    id v13 = &v18;
    id v18 = v10;
    id v14 = block;
  }
  dispatch_async(replyQueue, v14);
}

- (void)_managerFetch_updatePromotionsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  id v9 = v8;
  if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1002689AC;
    v12[3] = &unk_100742DF8;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    [(PDAccountManager *)self accountWithIdentifier:v13 completion:v12];

    id v10 = v13;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100268930;
    block[3] = &unk_10072F788;
    id v17 = v7;
    dispatch_async(replyQueue, block);
    id v10 = v17;
    goto LABEL_5;
  }
LABEL_6:
}

- (void)_queue_updatePromotionsIfNecessaryForAccount:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 accountIdentifier];
    if ([v5 showCardPromotions])
    {
      [v5 feature];
      uint64_t v7 = PDAccountEndpointBackOffAccountTypeFromFeatureIdentifier();
      id v8 = [(PDDatabaseManager *)self->_databaseManager accountEndpointMetadataForAccountIdentifier:v6 endpoint:3];
      if ([v8 isDirty])
      {
        id v9 = [(PDDatabaseManager *)self->_databaseManager nextPossibleFetchDateForAccountType:v7 endpointType:7 accountIdentifier:v6];
        if (v9
          && (+[NSDate date],
              id v10 = objc_claimAutoreleasedReturnValue(),
              [v10 timeIntervalSinceDate:v9],
              double v12 = v11,
              v10,
              v12 > 0.0))
        {
          id v13 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v18 = v6;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Fetching promotions that are dirty for account %@", buf, 0xCu);
          }

          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_100269C98;
          v15[3] = &unk_100741EF8;
          id v16 = v6;
          [(PDAccountManager *)self _updateAccountPromotionsForAccountWithIdentifier:v16 ignoreErrorBackoff:0 observeCooldownPeriod:0 completion:v15];
          id v9 = v16;
        }
        else
        {
          id v14 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v18 = v6;
            __int16 v19 = 2112;
            id v20 = v9;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not fetching promotions that are dirty for account %@ since the next possible fetch date is %@", buf, 0x16u);
          }
        }
      }
    }
    else
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not fetching promotions for account %@ because it is not a supported feature on this account", buf, 0xCu);
      }
    }
  }
}

- (void)accountPromotionBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100269EA4;
      v11[3] = &unk_100742528;
      void v11[4] = self;
      id v12 = v6;
      id v13 = v8;
      [(PDAccountManager *)self accountWithIdentifier:v12 completion:v11];

      id v9 = v12;
    }
    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_100269E90;
      block[3] = &unk_10072F788;
      id v15 = v7;
      dispatch_async(replyQueue, block);
      id v9 = v15;
    }
  }
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 cooldownLevel:(unint64_t)a4 completion:(id)a5
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10026A0D8;
  v9[3] = &unk_100743528;
  id v10 = a5;
  id v8 = v10;
  [(PDAccountManager *)self _updateAccountEnhancedMerchantsForAccountWithIdentifier:a3 ignoreErrorBackoff:0 cooldownLevel:a4 completion:v9];
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10026A1AC;
  v9[3] = &unk_100743528;
  id v10 = a5;
  id v8 = v10;
  [(PDAccountManager *)self _updateAccountEnhancedMerchantsForAccountWithIdentifier:a3 ignoreErrorBackoff:v5 cooldownLevel:0 completion:v9];
}

- (void)_updateAccountEnhancedMerchantsForAccountWithIdentifier:(id)a3 ignoreErrorBackoff:(BOOL)a4 cooldownLevel:(unint64_t)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = [[PDAccountManagerEnhancedMerchantsRequest alloc] initWithAccountIdentifier:v11 ignoreErrorBackoff:v7 cooldownLevel:a5];

  [(PDAccountManagerEnhancedMerchantsRequest *)v12 addCompletion:v10];
  [(PDAccountManager *)self _addAccountManagerFetchRequest:v12];
}

- (void)insertOrUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = v8;
  if (a3 && a4)
  {
    [(PDDatabaseManager *)self->_databaseManager insertOrUpdateAccountEnhancedMerchants:a3 accountIdentifier:a4];
    replyQueue = self->_replyQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10026A3A8;
    v13[3] = &unk_10072F788;
    id v11 = &v14;
    id v14 = v9;
    id v12 = v13;
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10026A394;
    block[3] = &unk_10072F788;
    id v11 = &v16;
    id v16 = v8;
    id v12 = block;
  }
  dispatch_async(replyQueue, v12);
}

- (void)accountEnhancedMerchantsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10026A504;
      v11[3] = &unk_100742528;
      void v11[4] = self;
      id v12 = v6;
      id v13 = v8;
      [(PDAccountManager *)self accountWithIdentifier:v12 completion:v11];

      id v9 = v12;
    }
    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_10026A4F0;
      block[3] = &unk_10072F788;
      id v15 = v7;
      dispatch_async(replyQueue, block);
      id v9 = v15;
    }
  }
}

- (void)deleteAccountEnhancedMerchant:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10026A7A0;
  v15[3] = &unk_100730578;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(workQueue, v15);
}

- (void)_managerFetch_updateEnhancedMerchantsWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  id v9 = v8;
  if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10026AA40;
    v12[3] = &unk_100742DF8;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    [(PDAccountManager *)self accountWithIdentifier:v13 completion:v12];

    id v10 = v13;
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10026A9C0;
    block[3] = &unk_10072F788;
    id v17 = v7;
    dispatch_async(replyQueue, block);
    id v10 = v17;
    goto LABEL_5;
  }
LABEL_6:
}

- (void)_managerFetch_updateBalancesWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [v6 accountIdentifier];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10026BAF0;
    v9[3] = &unk_100742DF8;
    void v9[4] = self;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = v7;
    id v11 = v6;
    id v8 = v10;
    [(PDAccountManager *)self accountWithIdentifier:v8 completion:v9];
  }
}

- (void)_queue_updateEnhancedMerchantsIfNecessaryForAccount:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = [v4 accountIdentifier];
    if ([v5 showEnhancedMerchants])
    {
      [v5 feature];
      uint64_t v7 = PDAccountEndpointBackOffAccountTypeFromFeatureIdentifier();
      id v8 = [(PDDatabaseManager *)self->_databaseManager accountEndpointMetadataForAccountIdentifier:v6 endpoint:4];
      if ([v8 isDirty])
      {
        id v9 = [(PDDatabaseManager *)self->_databaseManager nextPossibleFetchDateForAccountType:v7 endpointType:8 accountIdentifier:v6];
        if (v9
          && (+[NSDate date],
              id v10 = objc_claimAutoreleasedReturnValue(),
              [v10 timeIntervalSinceDate:v9],
              double v12 = v11,
              v10,
              v12 > 0.0))
        {
          id v13 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v18 = v6;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Fetching enhanced merchants that are dirty for account %@", buf, 0xCu);
          }

          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_10026C248;
          v15[3] = &unk_100743640;
          id v16 = v6;
          [(PDAccountManager *)self _updateAccountEnhancedMerchantsForAccountWithIdentifier:v16 ignoreErrorBackoff:0 cooldownLevel:0 completion:v15];
          id v9 = v16;
        }
        else
        {
          id v14 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v18 = v6;
            __int16 v19 = 2112;
            id v20 = v9;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not fetching enhanced merchants that are dirty for account %@ since the next possible fetch date is %@", buf, 0x16u);
          }
        }
      }
    }
    else
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not fetching enhanced merchants for account %@ because it is not a supported feature on this account", buf, 0xCu);
      }
    }
  }
}

- (void)accountEnhancedMerchantBehaviorForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10026C454;
      v11[3] = &unk_100742528;
      void v11[4] = self;
      id v12 = v6;
      id v13 = v8;
      [(PDAccountManager *)self accountWithIdentifier:v12 completion:v11];

      id v9 = v12;
    }
    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_10026C440;
      block[3] = &unk_10072F788;
      id v15 = v7;
      dispatch_async(replyQueue, block);
      id v9 = v15;
    }
  }
}

- (void)updateCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 completion:(id)a4
{
}

- (void)creditRecoveryPaymentPlansForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    if (v8)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10026C730;
      v13[3] = &unk_100743668;
      void v13[4] = self;
      id v15 = v9;
      BOOL v16 = a4;
      id v14 = v8;
      [(PDAccountManager *)self accountWithIdentifier:v14 completion:v13];

      double v11 = v15;
    }
    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_10026C71C;
      block[3] = &unk_10072F788;
      id v18 = v9;
      dispatch_async(replyQueue, block);
      double v11 = v18;
    }
  }
}

- (void)creditRecoveryPaymentPlanInformationForAccountIdentifier:(id)a3 allowFetchFromServer:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    if (v8)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10026CAEC;
      v13[3] = &unk_100736918;
      double v11 = &v14;
      id v14 = v9;
      [(PDAccountManager *)self creditRecoveryPaymentPlansForAccountIdentifier:v8 allowFetchFromServer:v6 completion:v13];
    }
    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_10026CAD4;
      block[3] = &unk_10072F788;
      double v11 = &v16;
      id v16 = v9;
      dispatch_async(replyQueue, block);
    }
  }
}

- (void)_queue_updateCreditRecoveryPaymentPlansIfNecessaryForAccount:(id)a3
{
  id v4 = a3;
  if (v4
    && [(PDAccountManager *)self _shouldProactivelyFetchEndpoint:9 metadataType:6 fetchPeriodEndpoint:8 account:v4])
  {
    BOOL v5 = [v4 accountIdentifier];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10026CCF0;
    v6[3] = &unk_100741EF8;
    id v7 = v4;
    [(PDAccountManager *)self _updateCreditRecoveryPaymentPlansForAccountIdentifier:v5 force:0 completion:v6];
  }
}

- (void)_updateCreditRecoveryPaymentPlansForAccountIdentifier:(id)a3 force:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = [[PDAccountManagerCreditRecoveryPaymentPlansRequest alloc] initWithAccountIdentifier:v9 force:v5];

  [(PDAccountManagerCreditRecoveryPaymentPlansRequest *)v10 addCompletion:v8];
  [(PDAccountManager *)self _addAccountManagerFetchRequest:v10];
}

- (void)_managerFetch_updateCreditRecoveryPaymentPlansWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 accountIdentifier];
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Fetching payment plans for account with identifier %@", buf, 0xCu);
  }

  if (v8)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10026D0D4;
    v12[3] = &unk_100742DF8;
    void v12[4] = self;
    id v13 = v8;
    id v15 = v7;
    id v14 = v6;
    [(PDAccountManager *)self accountWithIdentifier:v13 completion:v12];

    id v10 = v13;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10026D058;
    block[3] = &unk_10072F788;
    id v17 = v7;
    dispatch_async(replyQueue, block);
    id v10 = v17;
    goto LABEL_7;
  }
LABEL_8:
}

- (void)accountEntityOrderingsForAccountWithIdentifier:(id)a3 entityType:(unint64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    if (v8 && a4)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10026DEDC;
      v13[3] = &unk_100743420;
      void v13[4] = self;
      id v14 = v8;
      unint64_t v16 = a4;
      id v15 = v10;
      [(PDAccountManager *)self accountWithIdentifier:v14 completion:v13];

      double v11 = v14;
    }
    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_10026DEC8;
      block[3] = &unk_10072F788;
      id v18 = v9;
      dispatch_async(replyQueue, block);
      double v11 = v18;
    }
  }
}

- (BOOL)_shouldProactivelyFetchEndpoint:(unint64_t)a3 metadataType:(unint64_t)a4 fetchPeriodEndpoint:(unint64_t)a5 account:(id)a6
{
  id v10 = a6;
  double v11 = [v10 accountIdentifier];
  id v12 = [(PDDatabaseManager *)self->_databaseManager accountEndpointMetadataForAccountIdentifier:v11 endpoint:a4];
  id v13 = [v12 lastUpdated];
  LOBYTE(a5) = -[PDAccountManager _shouldProactivelyFetchEndpoint:dirty:lastUpdated:fetchPeriodEndpoint:account:](self, "_shouldProactivelyFetchEndpoint:dirty:lastUpdated:fetchPeriodEndpoint:account:", a3, [v12 isDirty], v13, a5, v10);

  return a5;
}

- (BOOL)_shouldProactivelyFetchEndpoint:(unint64_t)a3 dirty:(BOOL)a4 lastUpdated:(id)a5 fetchPeriodEndpoint:(unint64_t)a6 account:(id)a7
{
  BOOL v9 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = [v13 fetchPeriods];
  unsigned __int8 v15 = [v14 endpointIsBlocked:a6];
  [v14 fetchPeriodForEndpoint:a6];
  unsigned int v16 = +[PKAccountFetchPeriods isLastUpdatedOutOfDate:fetchPeriod:](PKAccountFetchPeriods, "isLastUpdatedOutOfDate:fetchPeriod:", v12);
  [v13 feature];
  uint64_t v17 = PDAccountEndpointBackOffAccountTypeFromFeatureIdentifier();
  id v18 = [v13 accountIdentifier];

  if (v15)
  {
    __int16 v19 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = PDAccountEndpointBackOffEndpointTypeToString(a3);
      int v34 = 138412546;
      unint64_t v35 = v20;
      __int16 v36 = 2112;
      id v37 = v18;
      id v21 = "Not proactively fetching %@ endpoint for account %@ since the endpoint is blocked";
      id v22 = v19;
      uint32_t v23 = 22;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v34, v23);

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (v9)
  {
    __int16 v19 = [(PDDatabaseManager *)self->_databaseManager nextPossibleFetchDateForAccountType:v17 endpointType:a3 accountIdentifier:v18];
    if (v19
      && (+[NSDate date],
          id v24 = objc_claimAutoreleasedReturnValue(),
          [v24 timeIntervalSinceDate:v19],
          double v26 = v25,
          v24,
          v26 <= 0.0))
    {
      id v27 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        long long v32 = PDAccountEndpointBackOffEndpointTypeToString(a3);
        int v34 = 138412802;
        unint64_t v35 = v32;
        __int16 v36 = 2112;
        id v37 = v18;
        __int16 v38 = 2112;
        CFStringRef v39 = v19;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Not proactively fetching %@ endpoint which is dirty for account %@ since the next possible fetch date is %@", (uint8_t *)&v34, 0x20u);
      }
      BOOL v29 = 0;
    }
    else
    {
      id v27 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        id v28 = PDAccountEndpointBackOffEndpointTypeToString(a3);
        int v34 = 138412546;
        unint64_t v35 = v28;
        __int16 v36 = 2112;
        id v37 = v18;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Proactively fetching %@ endpoint which is dirty for account %@", (uint8_t *)&v34, 0x16u);
      }
      BOOL v29 = 1;
    }
  }
  else
  {
    __int16 v19 = PKLogFacilityTypeGetObject();
    BOOL v30 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
    if (!v16)
    {
      if (v30)
      {
        id v20 = PDAccountEndpointBackOffEndpointTypeToString(a3);
        int v34 = 138412802;
        unint64_t v35 = v20;
        __int16 v36 = 2112;
        id v37 = v18;
        __int16 v38 = 2112;
        CFStringRef v39 = v12;
        id v21 = "Not proactively fetching %@ endpoint for account %@ since endpoint is not dirty and not out of date. Last "
              "fetch date was %@";
        id v22 = v19;
        uint32_t v23 = 32;
        goto LABEL_16;
      }
LABEL_17:
      BOOL v29 = 0;
      goto LABEL_22;
    }
    if (v30)
    {
      long long v31 = PDAccountEndpointBackOffEndpointTypeToString(a3);
      int v34 = 138412802;
      unint64_t v35 = v31;
      __int16 v36 = 2112;
      id v37 = v18;
      __int16 v38 = 2112;
      CFStringRef v39 = v12;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Proactively fetching %@ endpoint for account %@ since the last fetch date was %@", (uint8_t *)&v34, 0x20u);
    }
    BOOL v29 = 1;
  }
LABEL_22:

  return v29;
}

- (void)_addAccountManagerFetchRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 requestIdentifier];
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Account manager request incoming %@", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_fetchRequestLock);
  [(NSMutableDictionary *)self->_fetchRequests objectForKey:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "coalesceWithRequest:", v4, (void)v14))
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v19 = v4;
            __int16 v20 = 2112;
            id v21 = v12;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Account manager request coalesced %@ onto existing request %@", buf, 0x16u);
          }

          id v6 = v4;
          id v13 = v7;
          goto LABEL_20;
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  if (v4)
  {
    id v13 = v7;
    if (!v7)
    {
      id v13 = objc_alloc_init((Class)NSMutableArray);
      [(NSMutableDictionary *)self->_fetchRequests setObject:v13 forKey:v5];
    }
    -[NSObject addObject:](v13, "addObject:", v4, (void)v14);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      __int16 v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Account manager request queued %@", buf, 0xCu);
    }
    id v7 = v4;
LABEL_20:

    id v7 = v13;
  }
  os_unfair_lock_unlock(&self->_fetchRequestLock);
  [(PDAccountManager *)self _executeNextAccountManagerFetchIfPossibleForRequestIdentifier:v5];
}

- (void)_executeNextAccountManagerFetchIfPossibleForRequestIdentifier:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_fetchRequestLock);
  uint64_t v5 = [(NSMutableDictionary *)self->_currentRequests objectForKey:v4];
  if (v5)
  {
    id v6 = (void *)v5;
    os_unfair_lock_unlock(&self->_fetchRequestLock);
  }
  else
  {
    id v7 = [(NSMutableDictionary *)self->_fetchRequests objectForKey:v4];
    uint64_t v8 = [v7 firstObject];
    if (v8)
    {
      id v9 = (void *)v8;
      [v7 removeObjectAtIndex:0];
      currentRequests = self->_currentRequests;
      id v11 = v9;
      [(NSMutableDictionary *)currentRequests setObject:v11 forKey:v4];

      os_unfair_lock_unlock(&self->_fetchRequestLock);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10026E8B4;
      v12[3] = &unk_10072E198;
      void v12[4] = self;
      id v13 = v4;
      [(PDAccountManager *)self _executeFetchRequest:v11 completion:v12];
    }
    else
    {

      os_unfair_lock_unlock(&self->_fetchRequestLock);
    }
  }
}

- (void)_executeFetchRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_10026F1A4;
  v76[3] = &unk_10072FDC8;
  v76[4] = self;
  id v7 = a4;
  id v77 = v7;
  uint64_t v8 = objc_retainBlock(v76);
  id v9 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v79 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Account manager request started %@", buf, 0xCu);
  }

  switch((unint64_t)[v6 requestType])
  {
    case 0uLL:
      id v10 = v6;
      v73[0] = _NSConcreteStackBlock;
      v73[1] = 3221225472;
      v73[2] = sub_10026F24C;
      v73[3] = &unk_10072DFD8;
      id v11 = &v74;
      id v74 = v10;
      id v12 = (id *)&v75;
      long long v75 = v8;
      [(PDAccountManager *)self _managerFetch_updateAccountsWithRequest:v10 completion:v73];
      goto LABEL_20;
    case 1uLL:
      id v13 = v6;
      v70[0] = _NSConcreteStackBlock;
      v70[1] = 3221225472;
      v70[2] = sub_10026F298;
      v70[3] = &unk_1007436B8;
      id v11 = &v71;
      id v71 = v13;
      id v12 = (id *)&v72;
      id v72 = v8;
      [(PDAccountManager *)self _managerFetch_updateAccountWithRequest:v13 completion:v70];
      goto LABEL_20;
    case 2uLL:
      id v14 = v6;
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_10026F2E4;
      v67[3] = &unk_1007436E0;
      id v11 = &v68;
      id v68 = v14;
      id v12 = (id *)&v69;
      id v69 = v8;
      [(PDAccountManager *)self _managerFetch_performVirtualCardActionWithRequest:v14 completion:v67];
      goto LABEL_20;
    case 3uLL:
      id v15 = v6;
      v64[0] = _NSConcreteStackBlock;
      v64[1] = 3221225472;
      v64[2] = sub_10026F334;
      v64[3] = &unk_100743708;
      id v11 = &v65;
      id v65 = v15;
      id v12 = (id *)&v66;
      id v66 = v8;
      [(PDAccountManager *)self _managerFetch_updateAccountUsersWithRequest:v15 completion:v64];
      goto LABEL_20;
    case 4uLL:
      id v16 = v6;
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_10026F380;
      v61[3] = &unk_100743730;
      id v11 = &v62;
      id v62 = v16;
      id v12 = (id *)&v63;
      uint64_t v63 = v8;
      [(PDAccountManager *)self _managerFetch_sharedAccountCloudStoreWithRequest:v16 completion:v61];
      goto LABEL_20;
    case 5uLL:
      id v17 = v6;
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_10026F3CC;
      v58[3] = &unk_1007305A0;
      id v11 = &v59;
      id v59 = v17;
      id v12 = (id *)&v60;
      id v60 = v8;
      [(PDAccountManager *)self _managerFetch_createdZoneWithRequest:v17 completion:v58];
      goto LABEL_20;
    case 6uLL:
      id v18 = v6;
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_10026F418;
      v55[3] = &unk_10072DFD8;
      id v11 = &v56;
      id v56 = v18;
      id v12 = (id *)&v57;
      id v57 = v8;
      [(PDAccountManager *)self _managerFetch_updateFinancingPlansWithRequest:v18 completion:v55];
      goto LABEL_20;
    case 7uLL:
      id v19 = v6;
      v52[0] = _NSConcreteStackBlock;
      v52[1] = 3221225472;
      v52[2] = sub_10026F464;
      v52[3] = &unk_10072DFD8;
      id v11 = &v53;
      id v53 = v19;
      id v12 = (id *)&v54;
      id v54 = v8;
      [(PDAccountManager *)self _managerFetch_updateFundingSourcesWithRequest:v19 completion:v52];
      goto LABEL_20;
    case 8uLL:
      id v20 = v6;
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10026F4B0;
      v49[3] = &unk_10072DFD8;
      id v11 = &v50;
      id v50 = v20;
      id v12 = (id *)&v51;
      long long v51 = v8;
      [(PDAccountManager *)self _managerFetch_updatePromotionsWithRequest:v20 completion:v49];
      goto LABEL_20;
    case 9uLL:
      id v21 = v6;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_10026F4FC;
      v46[3] = &unk_100743758;
      id v11 = &v47;
      id v47 = v21;
      id v12 = (id *)&v48;
      id v48 = v8;
      [(PDAccountManager *)self _managerFetch_updateEnhancedMerchantsWithRequest:v21 completion:v46];
      goto LABEL_20;
    case 0xAuLL:
      id v22 = v6;
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_10026F54C;
      v43[3] = &unk_10072DFD8;
      id v11 = &v44;
      id v44 = v22;
      id v12 = (id *)&v45;
      long long v45 = v8;
      [(PDAccountManager *)self _managerFetch_updateBalancesWithRequest:v22 completion:v43];
      goto LABEL_20;
    case 0xBuLL:
      id v23 = v6;
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_10026F598;
      v40[3] = &unk_10073D508;
      id v11 = &v41;
      id v41 = v23;
      id v12 = (id *)&v42;
      long long v42 = v8;
      [(PDAccountManager *)self _managerFetch_sendAccountReport:v23 completion:v40];
      goto LABEL_20;
    case 0xCuLL:
      id v24 = v6;
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10026F5E0;
      v37[3] = &unk_100743078;
      id v11 = &v38;
      id v38 = v24;
      id v12 = (id *)&v39;
      CFStringRef v39 = v8;
      [(PDAccountManager *)self _managerFetch_exportTransactionsWithRequest:v24 completion:v37];
      goto LABEL_20;
    case 0xDuLL:
      id v25 = v6;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10026F62C;
      v34[3] = &unk_10073D508;
      id v11 = &v35;
      id v35 = v25;
      id v12 = (id *)&v36;
      __int16 v36 = v8;
      [(PDAccountManager *)self _managerFetch_cancelFinancingPlanWithRequest:v25 completion:v34];
      goto LABEL_20;
    case 0xEuLL:
      id v26 = v6;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      void v31[2] = sub_10026F674;
      v31[3] = &unk_10072DFD8;
      id v11 = &v32;
      id v32 = v26;
      id v12 = (id *)&v33;
      long long v33 = v8;
      [(PDAccountManager *)self _managerFetch_updateCreditRecoveryPaymentPlansWithRequest:v26 completion:v31];
      goto LABEL_20;
    case 0xFuLL:
      id v27 = v6;
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10026F6C0;
      v28[3] = &unk_100743708;
      id v11 = &v29;
      id v29 = v27;
      id v12 = (id *)&v30;
      BOOL v30 = v8;
      [(PDAccountManager *)self _managerFetch_updatePhysicalCardsWithRequest:v27 completion:v28];
LABEL_20:

      break;
    default:
      break;
  }
}

- (void)_queue_fetchNextPaginatedRequestIfNecessaryFromPreviousResponse:(id)a3 newRequest:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 && v6 && [a3 moreComing])
  {
    uint64_t v8 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Performing paginated request %@ because moreComing is true", (uint8_t *)&v9, 0xCu);
    }

    [(PDAccountManager *)self _addAccountManagerFetchRequest:v7];
  }
}

- (void)_updatePushTopics
{
  id v3 = objc_alloc((Class)NSMutableSet);
  id v4 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator accountServicePushTopics];
  id v5 = [v3 initWithSet:v4];

  os_unfair_lock_t lock = &self->_lockPushTopics;
  os_unfair_lock_lock(&self->_lockPushTopics);
  id v34 = [(NSSet *)self->_accountServicePushNotificationTopics copy];
  id v33 = [(NSDictionary *)self->_additionalPushNotificationTopics copy];
  if (![v5 count]) {
    [v5 addObject:@"com.apple.account.service"];
  }
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v35 = self;
  id v7 = self->_accounts;
  id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v13 = [v12 additionalPushTopics];
        id v14 = objc_alloc_init((Class)NSMutableArray);
        id v15 = [v13 account];
        [v14 safelyAddObject:v15];

        id v16 = [v13 extendedAccount];
        [v14 safelyAddObject:v16];

        id v17 = [v13 payments];
        [v14 safelyAddObject:v17];

        id v18 = [v13 users];
        [v14 safelyAddObject:v18];

        id v19 = [v13 sharedAccountCloudStore];
        [v14 safelyAddObject:v19];

        id v20 = [v13 financingPlans];
        [v14 safelyAddObject:v20];

        id v21 = [v13 physicalCards];
        [v14 safelyAddObject:v21];

        id v22 = [v13 virtualCards];
        [v14 safelyAddObject:v22];

        id v23 = [v13 servicingToken];
        [v14 safelyAddObject:v23];

        id v24 = [v13 fundingSources];
        [v14 safelyAddObject:v24];

        id v25 = [v13 creditRecoveryPaymentPlans];
        [v14 safelyAddObject:v25];

        id v26 = [v12 accountIdentifier];
        [v6 setObject:v14 forKey:v26];
      }
      id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v9);
  }

  id v27 = (NSDictionary *)[v6 copy];
  additionalPushNotificationTopics = v35->_additionalPushNotificationTopics;
  v35->_additionalPushNotificationTopics = v27;

  id v29 = (NSSet *)[v5 copy];
  accountServicePushNotificationTopics = v35->_accountServicePushNotificationTopics;
  v35->_accountServicePushNotificationTopics = v29;

  if (PKEqualObjects())
  {
    char v31 = PKEqualObjects();
    os_unfair_lock_unlock(lock);

    if (v31) {
      goto LABEL_15;
    }
  }
  else
  {
    os_unfair_lock_unlock(lock);
  }
  [(PDPushNotificationManager *)v35->_pushNotificationManager recalculatePushTopics];
LABEL_15:
}

- (id)pushNotificationTopics
{
  p_lockPushTopics = &self->_lockPushTopics;
  os_unfair_lock_lock(&self->_lockPushTopics);
  accountServicePushNotificationTopics = self->_accountServicePushNotificationTopics;
  if (accountServicePushNotificationTopics) {
    id v5 = [(NSSet *)accountServicePushNotificationTopics mutableCopy];
  }
  else {
    id v5 = objc_alloc_init((Class)NSMutableSet);
  }
  additionalPushNotificationTopics = self->_additionalPushNotificationTopics;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10026FD24;
  v11[3] = &unk_100738B40;
  id v7 = v5;
  id v12 = v7;
  [(NSDictionary *)additionalPushNotificationTopics enumerateKeysAndObjectsUsingBlock:v11];
  os_unfair_lock_unlock(p_lockPushTopics);

  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Account push topics: %@", buf, 0xCu);
  }

  id v9 = [v7 copy];
  return v9;
}

- (void)handlePushNotificationForTopic:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v24 = v6;
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received push for push topic: %@. userInfo: %@", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_lockPushTopics);
  unsigned __int8 v9 = [(NSSet *)self->_accountServicePushNotificationTopics containsObject:v6];
  os_unfair_lock_unlock(&self->_lockPushTopics);
  if ((v9 & 1) != 0
    || (-[PDPaymentWebServiceCoordinator accountServicePushTopics](self->_paymentWebServiceCoordinator, "accountServicePushTopics"), uint64_t v10 = objc_claimAutoreleasedReturnValue(), v11 = [v10 containsObject:v6], v10, v11))
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_10026FF30;
    block[3] = &unk_10072E198;
    id v21 = v7;
    id v22 = self;
    id v13 = v7;
    dispatch_async(workQueue, block);
    id v14 = v21;
  }
  else
  {
    id v15 = self->_workQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10026FF90;
    v17[3] = &unk_10072E238;
    void v17[4] = self;
    id v18 = v6;
    id v19 = v7;
    id v16 = v7;
    dispatch_async(v15, v17);

    id v14 = v18;
  }
}

- (void)applyPushNotificationToken:(id)a3
{
  id v4 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received push token %@", (uint8_t *)&v5, 0xCu);
  }
}

- (void)_queue_updateAccountsWithPayload:(id)a3
{
  id v4 = a3;
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100271B38;
  v30[3] = &unk_10072E1E8;
  void v30[4] = self;
  int v5 = objc_retainBlock(v30);
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating accounts with payload %@", buf, 0xCu);
  }

  id v7 = [v4 accountIdentifier];
  unint64_t v8 = [(PDAccountManager *)self _queueIndexOfAccountWithIdentifier:v7];
  if (v4 && v7 && v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    switch((unint64_t)[v4 endpoint])
    {
      case 0uLL:
        goto LABEL_7;
      case 1uLL:
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating account %@ following push", buf, 0xCu);
        }

        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_100271BB4;
        v28[3] = &unk_100743780;
        id v29 = v7;
        [(PDAccountManager *)self updateAccountWithIdentifier:v29 extended:0 completion:v28];
        unsigned __int8 v9 = v29;
        goto LABEL_20;
      case 2uLL:
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating financing plans of account %@ following push", buf, 0xCu);
        }

        id v10 = [v4 ignoreLastUpdatedDate];
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100271C60;
        v26[3] = &unk_100741EF8;
        id v27 = v7;
        [(PDAccountManager *)self _updateFinancingPlansForAccountWithIdentifier:v27 pageOffset:0 limit:0 ignoreLastUpdatedDate:v10 fromPush:1 completion:v26];
        unsigned __int8 v9 = v27;
        goto LABEL_20;
      case 3uLL:
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updating funding sources of account %@ following push", buf, 0xCu);
        }

        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_100271D24;
        v24[3] = &unk_100741EF8;
        id v25 = v7;
        [(PDAccountManager *)self updatePaymentFundingSourcesForAccountIdentifier:v25 force:1 completion:v24];
        unsigned __int8 v9 = v25;
        goto LABEL_20;
      case 5uLL:
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reseting cloud store zones for account %@ following push", buf, 0xCu);
        }

        unint64_t v11 = [(PDAccountManager *)self _queueIndexOfAccountWithIdentifier:v7];
        if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
          break;
        }
        id v12 = [(NSMutableArray *)self->_accounts objectAtIndex:v11];
        id v13 = [v12 cloudStoreZoneNames];
        if ([v13 count])
        {
          cloudStoreNotificationCoordinator = self->_cloudStoreNotificationCoordinator;
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          void v21[2] = sub_100271DE8;
          v21[3] = &unk_100732CB8;
          id v22 = v13;
          id v23 = v7;
          [(PDCloudStoreNotificationCoordinator *)cloudStoreNotificationCoordinator recreateZones:v22 completion:v21];

          id v6 = v22;
        }
        else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No zones to reset on account %@ following push", buf, 0xCu);
        }

        goto LABEL_32;
      case 6uLL:
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v32 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reset balances for account %@ following push", buf, 0xCu);
        }

        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_100271EB4;
        v19[3] = &unk_10072F6E8;
        id v20 = v7;
        [(PDAccountManager *)self resetAccountBalancesForAccountIdentifier:v20 completion:v19];
        unsigned __int8 v9 = v20;
LABEL_20:

        break;
      case 7uLL:
        id v15 = [v4 topUpTokenIdentifier];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v32 = v15;
          __int16 v33 = 2112;
          id v34 = v7;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Invalidate top up token with identifier %@ for account %@ following push", buf, 0x16u);
        }

        v16[0] = _NSConcreteStackBlock;
        v16[1] = 3221225472;
        v16[2] = sub_100271F78;
        v16[3] = &unk_10073CFE0;
        id v17 = v15;
        id v18 = v7;
        id v12 = v15;
        [(PDAccountManager *)self invalidateTopUpTokenWithIdentifier:v12 forAccountWithIdentifier:v18 completion:v16];

LABEL_32:
        break;
      default:
        break;
    }
  }
  else
  {
LABEL_7:
    ((void (*)(void *))v5[2])(v5);
  }
}

- (void)familyCircleManagerDidUpdateFamilyMembers:(id)a3
{
  id v4 = a3;
  int v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PDAccountManager: familyCircleManagerDidUpdateFamilyMembers", buf, 2u);
  }

  id v6 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  id v7 = [(PDDatabaseManager *)self->_databaseManager accountPendingFamilyMembersWithDisplayedNotification:0];
  id v8 = objc_alloc_init((Class)NSMutableSet);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100272304;
  void v32[3] = &unk_100730C60;
  id v9 = v4;
  id v33 = v9;
  id v34 = v7;
  id v35 = self;
  id v10 = v8;
  id v36 = v10;
  id v11 = v7;
  [v6 addOperation:v32];
  id v12 = objc_alloc_init((Class)NSMutableSet);
  id v13 = objc_alloc_init((Class)NSMutableDictionary);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10027255C;
  v26[3] = &unk_100733B00;
  id v27 = v9;
  id v28 = v10;
  id v29 = self;
  id v14 = v12;
  id v30 = v14;
  id v15 = v13;
  id v31 = v15;
  id v16 = v10;
  id v17 = v9;
  [v6 addOperation:v26];
  id v18 = +[NSNull null];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100272908;
  v22[3] = &unk_10073AB70;
  id v23 = v14;
  id v24 = self;
  id v25 = v15;
  id v19 = v15;
  id v20 = v14;
  id v21 = [v6 evaluateWithInput:v18 completion:v22];
}

- (id)_familyMemberAssociatedWithInviteEmail:(id)a3 familyMembers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && [v6 count])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = v7;
    id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v26;
      id v23 = v7;
      while (2)
      {
        for (unint64_t i = 0; i != v9; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          objc_msgSend(v12, "appleID", v23);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          id v14 = v5;
          id v15 = v14;
          if (v13 == v14)
          {
            id v17 = v14;
            id v13 = v14;
LABEL_26:

LABEL_27:
LABEL_28:

LABEL_29:
            id v21 = v12;
            id v7 = v23;
            goto LABEL_30;
          }
          if (v13)
          {
            unsigned __int8 v16 = [v13 isEqualToString:v14];

            if (v16) {
              goto LABEL_28;
            }
          }
          else
          {
          }
          id v17 = [v12 appleIDAliases];
          if ([v17 containsObject:v15]) {
            goto LABEL_27;
          }
          id v18 = [v12 inviteEmail];
          id v19 = v15;
          id v15 = v19;
          if (v18 == v19)
          {

            goto LABEL_26;
          }
          if (v18)
          {
            unsigned __int8 v20 = [v18 isEqualToString:v19];

            if (v20) {
              goto LABEL_29;
            }
          }
          else
          {
          }
        }
        id v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
        id v21 = 0;
        id v7 = v23;
        if (v9) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v21 = 0;
    }
LABEL_30:
  }
  else
  {
    id v21 = 0;
  }

  return v21;
}

- (void)attemptAppleBalanceSetupWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  int v5 = PKAppleBalanceBackgroundProvisionDisabled();
  uint64_t v46 = 0;
  id v47 = &v46;
  uint64_t v48 = 0x3032000000;
  id v49 = sub_100020A5C;
  id v50 = sub_100021020;
  PKDisplayableErrorForCommonType();
  id v51 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_backgroundProvisioningLock);
  if (self->_isBackgroundProvisioningAppleBalance || (v5 & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_backgroundProvisioningLock);
    uint64_t v10 = PKLogFacilityTypeGetObject();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        id v12 = "Apple Balance background provision disabled in internal settings";
LABEL_11:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      }
    }
    else if (v11)
    {
      *(_WORD *)buf = 0;
      id v12 = "Apple Balance background provisioning already in progress";
      goto LABEL_11;
    }

    v4[2](v4, v47[5]);
    goto LABEL_13;
  }
  self->_isBackgroundProvisioningAppleBalance = 1;
  os_unfair_lock_unlock(&self->_backgroundProvisioningLock);
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Attempting background provision of Apple Balance", buf, 2u);
  }

  id v7 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  *(void *)buf = 0;
  id v41 = buf;
  uint64_t v42 = 0x3032000000;
  long long v43 = sub_100020A5C;
  id v44 = sub_100021020;
  id v45 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_100020A5C;
  void v38[4] = sub_100021020;
  id v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = sub_100020A5C;
  void v36[4] = sub_100021020;
  id v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = sub_100020A5C;
  void v34[4] = sub_100021020;
  id v35 = 0;
  objc_initWeak(&location, self);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  void v31[2] = sub_100273624;
  v31[3] = &unk_100743868;
  objc_copyWeak(&v32, &location);
  void v31[4] = self;
  void v31[5] = buf;
  v31[6] = &v46;
  [v7 addOperation:v31];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100273918;
  v29[3] = &unk_1007438B8;
  objc_copyWeak(&v30, &location);
  v29[4] = v38;
  void v29[5] = buf;
  v29[6] = &v46;
  [v7 addOperation:v29];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100273B3C;
  v28[3] = &unk_100743908;
  void v28[4] = v38;
  v28[5] = v36;
  v28[6] = buf;
  v28[7] = &v46;
  [v7 addOperation:v28];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100273E8C;
  v27[3] = &unk_100743930;
  v27[4] = v38;
  void v27[5] = v36;
  v27[6] = buf;
  [v7 addOperation:v27];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100274070;
  v26[3] = &unk_100743908;
  void v26[4] = v36;
  void v26[5] = v38;
  v26[6] = buf;
  v26[7] = &v46;
  [v7 addOperation:v26];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100274354;
  v24[3] = &unk_1007439A8;
  objc_copyWeak(&v25, &location);
  void v24[4] = buf;
  void v24[5] = &v46;
  [v7 addOperation:v24];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100274598;
  v23[3] = &unk_1007439F8;
  v23[4] = v36;
  void v23[5] = v38;
  v23[6] = v34;
  v23[7] = buf;
  v23[8] = &v46;
  [v7 addOperation:v23];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  void v21[2] = sub_10027488C;
  v21[3] = &unk_100743A48;
  objc_copyWeak(&v22, &location);
  void v21[4] = buf;
  [v7 addOperation:v21];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100274A44;
  v19[3] = &unk_1007438B8;
  objc_copyWeak(&v20, &location);
  void v19[4] = v34;
  v19[5] = buf;
  v19[6] = &v46;
  [v7 addOperation:v19];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100274CF4;
  v17[3] = &unk_100743A48;
  objc_copyWeak(&v18, &location);
  void v17[4] = buf;
  [v7 addOperation:v17];
  id v8 = +[NSNull null];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100274E5C;
  v13[3] = &unk_100743AB8;
  objc_copyWeak(&v16, &location);
  id v14 = v4;
  id v15 = buf;
  id v9 = [v7 evaluateWithInput:v8 completion:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
  _Block_object_dispose(v34, 8);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(buf, 8);
LABEL_13:
  _Block_object_dispose(&v46, 8);
}

- (void)validateAppleBalanceSecurityRequirementsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)PKAsyncUnaryOperationComposer);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  char v24 = 1;
  v21[0] = 0;
  v21[1] = v21;
  void v21[2] = 0x3032000000;
  v21[3] = sub_100020A5C;
  void v21[4] = sub_100021020;
  id v22 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 1;
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100275284;
  v17[3] = &unk_100743AE0;
  void v17[4] = v23;
  [v5 addOperation:v17];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100275328;
  v15[3] = &unk_1007438B8;
  objc_copyWeak(&v16, &location);
  void v15[4] = v19;
  void v15[5] = v23;
  v15[6] = v21;
  [v5 addOperation:v15];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100275634;
  v13[3] = &unk_1007438B8;
  objc_copyWeak(&v14, &location);
  void v13[4] = v23;
  void v13[5] = v19;
  v13[6] = v21;
  [v5 addOperation:v13];
  id v6 = +[NSNull null];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100275914;
  v9[3] = &unk_100743B58;
  id v7 = v4;
  id v10 = v7;
  BOOL v11 = v23;
  id v12 = v21;
  id v8 = [v5 evaluateWithInput:v6 completion:v9];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v23, 8);
}

- (void)triggerCloudStoreZoneCreationForAccount:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (v7)
  {
    if (v6)
    {
      cloudStoreNotificationCoordinator = self->_cloudStoreNotificationCoordinator;
      id v10 = [v6 cloudStoreZoneNames];
      LOBYTE(cloudStoreNotificationCoordinator) = [(PDCloudStoreNotificationCoordinator *)cloudStoreNotificationCoordinator hasCachedCloudStoreZoneInApplePayContainerForZoneNames:v10];

      if (cloudStoreNotificationCoordinator)
      {
        v8[2](v8, 1);
      }
      else
      {
        objc_initWeak(&location, self);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_100275AC0;
        v11[3] = &unk_100743B80;
        id v12 = v6;
        objc_copyWeak(&v15, &location);
        id v13 = self;
        id v14 = v8;
        [(PDAccountManager *)self insertOrReplaceAccount:v12 extended:1 deleteSensitiveData:0 completion:v11];

        objc_destroyWeak(&v15);
        objc_destroyWeak(&location);
      }
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

- (void)_triggerProvisionPassToWatchWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  if (v4 && PKIsPairedWithWatch())
  {
    id v3 = objc_alloc_init(off_100806738());
    [v3 provisionPassForRemoteCredentialWithType:135 andIdentifier:0 completion:&stru_100743BA0];
    v4[2](v4, 1);
  }
}

- (BOOL)backgroundProvisionInProgressForFeature:(unint64_t)a3
{
  if (a3 != 4) {
    return 0;
  }
  p_backgroundProvisioningLock = &self->_backgroundProvisioningLock;
  os_unfair_lock_lock(&self->_backgroundProvisioningLock);
  BOOL isBackgroundProvisioningAppleBalance = self->_isBackgroundProvisioningAppleBalance;
  os_unfair_lock_unlock(p_backgroundProvisioningLock);
  return isBackgroundProvisioningAppleBalance;
}

- (void)insertAccountBalanceUpdateNotificationForAccount:(id)a3 updateAmount:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Inserting balance update notification with amount %@ for account %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [PDAccountBalanceUpdateUserNotification alloc];
  id v10 = [v6 associatedPassUniqueID];
  BOOL v11 = [(PDAccountBalanceUpdateUserNotification *)v9 initWithAmount:v7 forPassUniqueIdentifier:v10];

  [(PDUserNotificationManager *)self->_userNotificationManager insertUserNotification:v11];
}

- (id)_amsController
{
  amsController = self->_amsController;
  if (!amsController)
  {
    id v4 = (PKAMSTopUpController *)objc_alloc_init((Class)PKAMSTopUpController);
    id v5 = self->_amsController;
    self->_amsController = v4;

    amsController = self->_amsController;
  }
  return amsController;
}

- (void)_queue_updateAppleBalancePromotionsIfNeccessaryForAccount:(id)a3 currentPromotion:(id)a4
{
  id v6 = a3;
  if (v6)
  {
    id v7 = a4;
    id v8 = [v6 fetchPeriods];
    unsigned int v9 = [v8 endpointIsBlocked:7];
    [v8 fetchPeriodForEndpoint:7];
    double v11 = v10;
    int v12 = [v7 lastUpdatedDate];

    unsigned int v13 = +[PKAccountFetchPeriods isLastUpdatedOutOfDate:v12 fetchPeriod:v11];
    if (v9)
    {
      __int16 v14 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Not fetching Apple Balance promotion: endpoint is blocked", buf, 2u);
      }
    }
    else
    {
      if (!v13)
      {
LABEL_10:

        goto LABEL_11;
      }
      id v15 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Fetching Apple Balance promotion: promotion is out of date", buf, 2u);
      }

      id v16 = [v6 accountIdentifier];
      id v17 = [(PDAccountManager *)self _amsController];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10027612C;
      v18[3] = &unk_100743BE8;
      v18[4] = self;
      id v19 = v16;
      __int16 v14 = v16;
      [v17 requestDTUConfigurationWithCompletion:v18];
    }
    goto LABEL_10;
  }
LABEL_11:
}

- (void)appleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100276558;
      v11[3] = &unk_100742528;
      void v11[4] = self;
      id v12 = v6;
      id v13 = v8;
      [(PDAccountManager *)self accountWithIdentifier:v12 completion:v11];

      unsigned int v9 = v12;
    }
    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_100276544;
      block[3] = &unk_10072F788;
      id v15 = v7;
      dispatch_async(replyQueue, block);
      unsigned int v9 = v15;
    }
  }
}

- (void)insertOrUpdateAppleBalancePromotion:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = v10;
  if (v8 && v9)
  {
    workQueue = self->_workQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100276884;
    block[3] = &unk_100730578;
    void block[4] = self;
    id v16 = v8;
    id v17 = v9;
    id v18 = v11;
    dispatch_async(workQueue, block);

    id v13 = v16;
  }
  else
  {
    replyQueue = self->_replyQueue;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100276868;
    void v19[3] = &unk_10072F788;
    id v20 = v10;
    dispatch_async(replyQueue, v19);
    id v13 = v20;
  }
}

- (void)deleteAppleBalancePromotionForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v6)
  {
    workQueue = self->_workQueue;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100276B80;
    v12[3] = &unk_10072E9D8;
    void v12[4] = self;
    id v13 = v6;
    id v14 = v8;
    dispatch_async(workQueue, v12);

    id v10 = v13;
  }
  else
  {
    replyQueue = self->_replyQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    void block[2] = sub_100276B64;
    block[3] = &unk_10072F788;
    id v16 = v7;
    dispatch_async(replyQueue, block);
    id v10 = v16;
  }
}

- (void)inStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      workQueue = self->_workQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100276E74;
      v12[3] = &unk_10072E9D8;
      void v12[4] = self;
      id v13 = v6;
      id v14 = v8;
      dispatch_async(workQueue, v12);

      id v10 = v13;
    }
    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_100276E60;
      block[3] = &unk_10072F788;
      id v16 = v7;
      dispatch_async(replyQueue, block);
      id v10 = v16;
    }
  }
}

- (void)insertOrUpdateInStoreTopUpToken:(id)a3 accountIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = v10;
  if (v10)
  {
    if (v8 && v9)
    {
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_1002770BC;
      block[3] = &unk_100730578;
      void block[4] = self;
      id v16 = v8;
      id v17 = v9;
      id v18 = v11;
      dispatch_async(workQueue, block);

      id v13 = v16;
    }
    else
    {
      replyQueue = self->_replyQueue;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1002770A8;
      void v19[3] = &unk_10072F788;
      id v20 = v10;
      dispatch_async(replyQueue, v19);
      id v13 = v20;
    }
  }
}

- (void)deleteInStoreTopUpTokenForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    if (v6)
    {
      workQueue = self->_workQueue;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1002773AC;
      v12[3] = &unk_10072E9D8;
      void v12[4] = self;
      id v13 = v6;
      id v14 = v8;
      dispatch_async(workQueue, v12);

      id v10 = v13;
    }
    else
    {
      replyQueue = self->_replyQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      void block[2] = sub_100277398;
      block[3] = &unk_10072F788;
      id v16 = v7;
      dispatch_async(replyQueue, block);
      id v10 = v16;
    }
  }
}

- (void)invalidateTopUpTokenWithIdentifier:(id)a3 forAccountWithIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        objc_initWeak(location, self);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100277634;
        v13[3] = &unk_100743C10;
        id v14 = v8;
        objc_copyWeak(&v17, location);
        id v15 = v9;
        id v16 = v10;
        [(PDAccountManager *)self inStoreTopUpTokenForAccountWithIdentifier:v15 completion:v13];

        objc_destroyWeak(&v17);
        objc_destroyWeak(location);
        goto LABEL_11;
      }
      double v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        id v12 = "Error: tried to invalidate top up token with nil account identifier";
        goto LABEL_9;
      }
    }
    else
    {
      double v11 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        id v12 = "Error: tried to invalidate top up token with nil token identifier";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)location, 2u);
      }
    }

    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
LABEL_11:
}

- (void)resolveAccountStorefrontCountryMismatchForAccount:(id)a3 newCountryCode:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = v10;
  if (v8 && v9)
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v9;
      __int16 v23 = 2112;
      id v24 = v8;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Storefront Country Mismatch: attempting to resolve mismatch for new country code %@ for account %@", buf, 0x16u);
    }

    id v13 = [v8 accountIdentifier];
    id v14 = [v8 accountBaseURL];
    id v15 = objc_alloc_init((Class)PKAccountWebServiceResolveStorefrontCountryMismatchRequest);
    [v15 setAccountIdentifier:v13];
    [v15 setBaseURL:v14];
    [v15 setCountryCode:v9];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Storefront Country Mismatch: deleting local account with identifier %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100277AA4;
    v17[3] = &unk_100743C88;
    objc_copyWeak(&v20, (id *)buf);
    id v16 = v15;
    id v18 = v16;
    id v19 = v11;
    [(PDAccountManager *)self deleteLocalAccountWithIdentifier:v13 completion:v17];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
  }
}

- (void)dailyCashEligibleDestinationsForAccountWithIdentifier:(id)a3 completion:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100277FF4;
  v8[3] = &unk_100742528;
  id v9 = a3;
  id v10 = self;
  id v11 = a4;
  id v6 = v11;
  id v7 = v9;
  [(PDAccountManager *)self accountWithIdentifier:v7 completion:v8];
}

- (void)updateWalletBadgeCount
{
}

- (void)paymentWebServiceCoordinatorWebServiceDidChange:(id)a3
{
}

- (PDAccountNotificationController)accountNotificationController
{
  return self->_accountNotificationController;
}

- (void)setAccountNotificationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountNotificationController, 0);
  objc_storeStrong((id *)&self->_amsController, 0);
  objc_storeStrong((id *)&self->_zoneCreationCompletions, 0);
  objc_storeStrong((id *)&self->_currentRequests, 0);
  objc_storeStrong((id *)&self->_fetchRequests, 0);
  objc_storeStrong((id *)&self->_userNotificationManager, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_decryptionRequests, 0);
  objc_storeStrong((id *)&self->_additionalPushNotificationTopics, 0);
  objc_storeStrong((id *)&self->_accountServicePushNotificationTopics, 0);
  objc_storeStrong((id *)&self->_accountServiceURLs, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_deviceEnvironmentStore, 0);
  objc_storeStrong((id *)&self->_cloudStoreNotificationCoordinator, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_pushNotificationManager, 0);
  objc_storeStrong((id *)&self->_payLaterMerchantProcessor, 0);
}

@end