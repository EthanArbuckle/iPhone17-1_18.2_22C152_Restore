@interface PDUserEvaluationEnvironment
+ (BOOL)isTransactionRelevant:(id)a3;
+ (id)_applePayRelevantTransactionTypes;
+ (id)availableKeysAndOperators;
- (BOOL)_hasDefaultCreditAccountTransactionOfTransactionSourceType:(unint64_t)a3;
- (BOOL)_hasPaymentOfferCriteriaOfType:(unint64_t)a3;
- (BOOL)_hasSavingsAccountAccountTransactionOfTransactionType:(int64_t)a3 fundingSourceTypes:(id)a4;
- (BOOL)anyCreditAccountStateIsClosed;
- (BOOL)anyCreditAccountStateIsRemoved;
- (BOOL)defaultCreditAccountHasActiveInstallment;
- (BOOL)defaultCreditAccountHasAutopaySetup;
- (BOOL)defaultCreditAccountHasDisputeOpen;
- (BOOL)defaultCreditAccountHasDynamicSecurityCode;
- (BOOL)defaultCreditAccountHasInAppTransaction;
- (BOOL)defaultCreditAccountHasInStoreTransaction;
- (BOOL)defaultCreditAccountHasMapsBrandIdentifier:(id)a3;
- (BOOL)defaultCreditAccountHasMapsBrandIdentifierLast30Days:(id)a3;
- (BOOL)defaultCreditAccountHasMapsIdentifier:(id)a3;
- (BOOL)defaultCreditAccountHasMapsIdentifierLast30Days:(id)a3;
- (BOOL)defaultCreditAccountHasMerchantIdentifier30Days:(id)a3;
- (BOOL)defaultCreditAccountHasMerchantIdentifier:(id)a3;
- (BOOL)defaultCreditAccountHasPhysicalCard;
- (BOOL)defaultCreditAccountHasPhysicalCardTransaction;
- (BOOL)defaultCreditAccountHasUnderageParticipant;
- (BOOL)defaultCreditAccountHasUsedInstallments;
- (BOOL)defaultCreditAccountHasVirtualCard;
- (BOOL)defaultCreditAccountHasVirtualCardTransaction;
- (BOOL)defaultCreditAccountHasWebTransaction;
- (BOOL)defaultCreditAccountInDisasterRecovery;
- (BOOL)defaultCreditAccountInGrace;
- (BOOL)defaultCreditAccountIsCoOwner;
- (BOOL)defaultCreditAccountIsShared;
- (BOOL)defaultCreditAccountPassIsDefault;
- (BOOL)defaultCreditAccountRequiresDebtCollectionNotices;
- (BOOL)defaultCreditAccountSupportsShowNotifications;
- (BOOL)familyCircleFamilyOrganizer;
- (BOOL)familyCircleHasFamily;
- (BOOL)familyCircleParent;
- (BOOL)hasActivePromotionIdentifier:(id)a3;
- (BOOL)hasActivePromotionIdentifierExpiringSoon:(id)a3;
- (BOOL)hasAnyConnectedCardWithBankConnect;
- (BOOL)hasAppleAccountCardProvisioned;
- (BOOL)hasApplePayTransaction;
- (BOOL)hasBankConnectEligibleCard;
- (BOOL)hasDebitCard;
- (BOOL)hasDefaultCreditAccount;
- (BOOL)hasEverMadeIssuerInstallmentTransaction;
- (BOOL)hasEverMadePayWithRewardsTransaction;
- (BOOL)hasEverProvisionedPayLaterPass;
- (BOOL)hasInstalledApp:(id)a3;
- (BOOL)hasIssuerInstallmentCard;
- (BOOL)hasMapsBrandIdentifier:(id)a3;
- (BOOL)hasMapsIdentifier:(id)a3;
- (BOOL)hasMerchantIdentifier:(id)a3;
- (BOOL)hasPairedWatch;
- (BOOL)hasPayLaterAccount;
- (BOOL)hasPayLaterPass;
- (BOOL)hasPayWithRewardsCard;
- (BOOL)hasPaymentCard;
- (BOOL)hasPaymentTransaction;
- (BOOL)hasPeerPaymentAccount;
- (BOOL)hasPeerPaymentPassProvisioned;
- (BOOL)hasSavingsAccount;
- (BOOL)hasTransitPassForCurrentLocation;
- (BOOL)hasTransitTransaction;
- (BOOL)hasUnexpiredTransitPassForCurrentLocation;
- (BOOL)isApplePayActive;
- (BOOL)isApplePaySetupAvailable;
- (BOOL)isDeviceRegisteredWithBroker;
- (BOOL)isPayLaterHidden;
- (BOOL)isPrimaryAppleAccountVerified;
- (BOOL)peerPaymentAccountHasBalance;
- (BOOL)peerPaymentAccountHasContactlessTransaction;
- (BOOL)peerPaymentAccountHasSentMoneyToAnyParticipant;
- (BOOL)peerPaymentAccountHasTransaction;
- (BOOL)peerPaymentHasAutoReloadEnabled;
- (BOOL)peerPaymentHasOnlinePurchaseTransaction;
- (BOOL)peerPaymentHasP2PTransaction;
- (BOOL)peerPaymentHasReceivedDeviceTapTransactions;
- (BOOL)peerPaymentHasReceivedP2PPayment;
- (BOOL)peerPaymentHasSentDeviceTapTransaction;
- (BOOL)peerPaymentHasSentP2PPayment;
- (BOOL)peerPaymentHasSetupRecurringP2PPayment;
- (BOOL)peerPaymentHasSetupRecurringP2PPaymentForAnyParticipant;
- (BOOL)savingsAccountHasCashTransferIn;
- (BOOL)savingsAccountHasExternalTransferIn;
- (BOOL)savingsAccountHasExternalTransferOut;
- (CLPlacemark)currentPlacemark;
- (NSDecimalNumber)defaultCreditAccountAvailableCredit;
- (NSDecimalNumber)defaultCreditAccountLifetimeRewards;
- (NSSet)cardTypesWithExpressEnabled;
- (NSSet)defaultCreditAccountSupportedDestinations;
- (NSSet)discoveryCTAsCompleted;
- (NSSet)discoveryCTAsTapped;
- (NSSet)discoveryItemsDismissed;
- (NSSet)discoveryItemsExpanded;
- (NSSet)discoveryItemsWithActionedStatus;
- (NSSet)discoveryItemsWithActiveStatus;
- (NSSet)discoveryItemsWithDismissedStatus;
- (NSSet)discoveryItemsWithWaitingForTriggerStatus;
- (NSSet)enrolledAuthenticationMechanisms;
- (NSSet)expressTransitNetworksForCurrentLocation;
- (NSSet)passStyles;
- (NSSet)secureElementCardTypes;
- (NSSet)sentTransitDCINotifications;
- (NSSet)sentTransitOpenLoopRenotifiedInMarketNotifications;
- (NSSet)sentTransitOpenLoopUpgradeNotifications;
- (NSSet)supportedMarketsForCurrentLocation;
- (NSSet)supportedTransitMarketsForCurrentLocation;
- (NSSet)supportedTransitNetworksForCurrentLocation;
- (NSSet)transitNetworksPresent;
- (NSSet)transitNetworksPresentAndUnexpired;
- (NSSet)unexpiredPassStyles;
- (NSSet)unexpiredSecureElementCardTypes;
- (NSString)currentDefaultCreditApplicationState;
- (NSString)defaultCreditAccountPhysicalAppleCardStatus;
- (NSString)defaultCreditAccountRewardsDestination;
- (NSString)deviceLanguage;
- (PDUserEvaluationEnvironment)init;
- (PDUserEvaluationEnvironment)initWithAccountManager:(id)a3 applyManager:(id)a4 databaseManager:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 paymentWebServiceCoordinator:(id)a7 transitNotificationService:(id)a8 familyCircleManager:(id)a9 expressPassManager:(id)a10 discoveryManager:(id)a11;
- (id)_accountUsersForAccountIdentifier:(id)a3 accessLevel:(unint64_t)a4;
- (id)_creditAccountPhysicalCardsForAccountIdentifier:(id)a3;
- (id)_creditAccountUsersForAccountIdentifier:(id)a3;
- (id)_creditAccountWithIdentifier:(id)a3;
- (id)_defaultCreditAccountAccountStatement;
- (id)_defaultCreditAccountAccountSummary;
- (id)_defaultCreditAccountCreditAccountDetails;
- (id)_defaultCreditAccountSupportedDestinations;
- (id)_familyMemberWithAltDSID:(id)a3;
- (id)_unactivatedPhysicalCardForAltDSID:(id)a3;
- (id)debugDescription;
- (id)discoveryItemStatus;
- (id)enumeratorOfDefaultCreditAccountActivePromotionIdentifiers;
- (id)enumeratorOfDefaultCreditAccountActivePromotionIdentifiersExpiringSoon;
- (id)enumeratorOfDefaultCreditAccountMapsBrandIdentifiers;
- (id)enumeratorOfDefaultCreditAccountMapsBrandIdentifiersLast30Days;
- (id)enumeratorOfDefaultCreditAccountMapsIdentifiers;
- (id)enumeratorOfDefaultCreditAccountMapsIdentifiersLast30Days;
- (id)enumeratorOfDefaultCreditAccountMerchantIdentifiers;
- (id)enumeratorOfDefaultCreditAccountMerchantIdentifiersLast30Days;
- (id)enumeratorOfInstalledApps;
- (id)enumeratorOfMapsBrandIdentifiers;
- (id)enumeratorOfMapsIdentifiers;
- (id)enumeratorOfMerchantIdentifiers;
- (id)memberOfDefaultCreditAccountActivePromotionIdentifiers:(id)a3;
- (id)memberOfDefaultCreditAccountActivePromotionIdentifiersExpiringSoon:(id)a3;
- (id)memberOfDefaultCreditAccountMapsBrandIdentifiers:(id)a3;
- (id)memberOfDefaultCreditAccountMapsBrandIdentifiersLast30Days:(id)a3;
- (id)memberOfDefaultCreditAccountMapsIdentifiers:(id)a3;
- (id)memberOfDefaultCreditAccountMapsIdentifiersLast30Days:(id)a3;
- (id)memberOfDefaultCreditAccountMerchantIdentifiers:(id)a3;
- (id)memberOfDefaultCreditAccountMerchantIdentifiersLast30Days:(id)a3;
- (id)memberOfInstalledApps:(id)a3;
- (id)memberOfMapsBrandIdentifiers:(id)a3;
- (id)memberOfMapsIdentifiers:(id)a3;
- (id)memberOfMerchantIdentifiers:(id)a3;
- (int64_t)_countOfFinancingPlansOfType:(unint64_t)a3;
- (int64_t)_countOfFinancingPlansWithSate:(unint64_t)a3;
- (int64_t)currentDefaultCreditApplictionDaysSinceLastUpdated;
- (int64_t)daysSinceAppleAccountInStoreTopUp;
- (int64_t)daysSinceLastDeviceTapSendTransaction;
- (int64_t)daysSinceLastPeerPaymentTransaction;
- (int64_t)daysSinceLastTransaction;
- (int64_t)daysSinceOldestCreditCardIngestDate;
- (int64_t)daysSinceOldestPaymentPassIngestDate;
- (int64_t)daysSinceParticipantPeerPaymentAccountIdentifiedDate;
- (int64_t)daysSincePhysicalAppleCardShipmentUpdate;
- (int64_t)defaultCreditAccountAccessLevel;
- (int64_t)defaultCreditAccountBalanceStatus;
- (int64_t)defaultCreditAccountCyclesPastDue;
- (int64_t)defaultCreditAccountDaysSinceCreatedDate;
- (int64_t)defaultCreditAccountDaysSinceDisputeOpened;
- (int64_t)defaultCreditAccountDaysSinceLastTransaction;
- (int64_t)defaultCreditAccountDaysUntilActivePromotionExpires:(id)a3;
- (int64_t)defaultCreditAccountParticipantUsersCount;
- (int64_t)defaultCreditAccountSetupFeatureState;
- (int64_t)defaultCreditAccountState;
- (int64_t)defaultCreditApplicationCount;
- (int64_t)familyCircleAgeCategory;
- (int64_t)familyCircleCurrentUserAge;
- (int64_t)familyCircleDaysSinceNewestJoinedDate;
- (int64_t)familyCircleMembersCount;
- (int64_t)familyCircleMembersUnderAge;
- (int64_t)familyCircleMinimumMemberAge;
- (int64_t)payLaterDaysSinceFirstActiveLoan;
- (int64_t)payLaterNumberOfActiveLoans;
- (int64_t)payLaterNumberOfCanceledLoans;
- (int64_t)payLaterNumberOfCompleteLoans;
- (int64_t)payLaterNumberOfDelinquentLoans;
- (int64_t)payLaterNumberOfLoans;
- (int64_t)payLaterNumberOfPendingLoans;
- (int64_t)peerPaymentAccountBalanceBase;
- (int64_t)peerPaymentAccountDaysSinceCreatedDate;
- (int64_t)peerPaymentAccountDaysSinceIdentifiedDate;
- (int64_t)peerPaymentAccountStage;
- (int64_t)peerPaymentAccountState;
- (int64_t)peerPaymentAccountStateReason;
- (int64_t)peerPaymentDaysSinceLastP2PTransaction;
- (int64_t)peerPaymentDaysSinceLastP2PTransactionToAnyParticipant;
- (int64_t)peerPaymentDaysSinceLastPurchaseTransaction;
- (int64_t)peerPaymentFamilyParticipantAccounts;
- (int64_t)peerPaymentNumberOfDeviceTapTransactions;
- (int64_t)savingsAccountBinnedBalance;
- (int64_t)savingsAccountDaysSinceCreatedDate;
- (unint64_t)countOfDefaultCreditAccountActivePromotionIdentifiers;
- (unint64_t)countOfDefaultCreditAccountActivePromotionIdentifiersExpiringSoon;
- (unint64_t)countOfDefaultCreditAccountMapsBrandIdentifiers;
- (unint64_t)countOfDefaultCreditAccountMapsBrandIdentifiersLast30Days;
- (unint64_t)countOfDefaultCreditAccountMapsIdentifiers;
- (unint64_t)countOfDefaultCreditAccountMapsIdentifiersLast30Days;
- (unint64_t)countOfDefaultCreditAccountMerchantIdentifiers;
- (unint64_t)countOfDefaultCreditAccountMerchantIdentifiersLast30Days;
- (unint64_t)countOfInstalledApps;
- (unint64_t)countOfMapsBrandIdentifiers;
- (unint64_t)countOfMapsIdentifiers;
- (unint64_t)countOfMerchantIdentifiers;
- (unint64_t)peerPaymentAccountRole;
- (void)_prefetchDataSources:(id)a3 completion:(id)a4;
- (void)preflightForKeys:(id)a3 completion:(id)a4;
- (void)updateDisputeState;
@end

@implementation PDUserEvaluationEnvironment

+ (id)availableKeysAndOperators
{
  v4[0] = @"currentRegion";
  v4[1] = @"deviceLanguage";
  v5[0] = &off_10078AB60;
  v5[1] = &off_10078AB60;
  v4[2] = @"isApplePayActive";
  v4[3] = @"isApplePaySetupAvailable";
  v5[2] = &off_10078AB78;
  v5[3] = &off_10078AB78;
  v4[4] = @"isPrimaryAppleAccountVerified";
  v4[5] = @"isDeviceRegisteredWithBroker";
  v5[4] = &off_10078AB78;
  v5[5] = &off_10078AB78;
  v4[6] = @"hasPaymentCard";
  v4[7] = @"hasDebitCard";
  v5[6] = &off_10078AB78;
  v5[7] = &off_10078AB78;
  v4[8] = @"hasApplePayTransaction";
  v4[9] = @"daysSinceLastTransaction";
  v5[8] = &off_10078AB78;
  v5[9] = &off_10078AB90;
  v4[10] = @"daysSinceOldestPaymentPassIngestDate";
  v4[11] = @"daysSinceOldestCreditCardIngestDate";
  v5[10] = &off_10078AB90;
  v5[11] = &off_10078AB90;
  v4[12] = @"defaultCreditAccountSetupFeatureState";
  v4[13] = @"hasDefaultCreditAccount";
  v5[12] = &off_10078AB90;
  v5[13] = &off_10078AB78;
  v4[14] = @"defaultCreditAccountState";
  v4[15] = @"defaultCreditAccountLifetimeRewards";
  v5[14] = &off_10078AB90;
  v5[15] = &off_10078AB90;
  v4[16] = @"defaultCreditAccountHasPhysicalCard";
  v4[17] = @"defaultCreditAccountHasVirtualCard";
  v5[16] = &off_10078AB78;
  v5[17] = &off_10078AB78;
  v4[18] = @"defaultCreditAccountHasDynamicSecurityCode";
  v4[19] = @"defaultCreditAccountRequiresDebtCollectionNotices";
  v5[18] = &off_10078AB78;
  v5[19] = &off_10078AB78;
  v4[20] = @"defaultCreditAccountBalanceStatus";
  v4[21] = @"defaultCreditAccountCyclesPastDue";
  v5[20] = &off_10078AB90;
  v5[21] = &off_10078AB90;
  v4[22] = @"defaultCreditAccountInGrace";
  v4[23] = @"defaultCreditAccountInDisasterRecovery";
  v5[22] = &off_10078AB78;
  v5[23] = &off_10078AB78;
  v4[24] = @"defaultCreditAccountHasDisputeOpen";
  v4[25] = @"defaultCreditAccountDaysSinceDisputeOpened";
  v5[24] = &off_10078AB78;
  v5[25] = &off_10078AB90;
  v4[26] = @"defaultCreditAccountAvailableCredit";
  v4[27] = @"defaultCreditAccountSupportsShowNotifications";
  v5[26] = &off_10078AB90;
  v5[27] = &off_10078AB78;
  v4[28] = @"defaultCreditAccountPassIsDefault";
  v4[29] = @"defaultCreditAccountDaysSinceLastTransaction";
  v5[28] = &off_10078AB78;
  v5[29] = &off_10078AB90;
  v4[30] = @"defaultCreditAccountHasInStoreTransaction";
  v4[31] = @"defaultCreditAccountHasInAppTransaction";
  v5[30] = &off_10078AB78;
  v5[31] = &off_10078AB78;
  v4[32] = @"defaultCreditAccountHasWebTransaction";
  v4[33] = @"defaultCreditAccountHasVirtualCardTransaction";
  v5[32] = &off_10078AB78;
  v5[33] = &off_10078AB78;
  v4[34] = @"defaultCreditAccountHasPhysicalCardTransaction";
  v4[35] = @"defaultCreditAccountDaysSinceCreatedDate";
  v5[34] = &off_10078AB78;
  v5[35] = &off_10078AB90;
  v4[36] = @"defaultCreditAccountHasActiveInstallment";
  v4[37] = @"defaultCreditAccountHasUsedInstallments";
  v5[36] = &off_10078AB78;
  v5[37] = &off_10078AB78;
  v4[38] = @"defaultCreditAccountMerchantIdentifiers";
  v4[39] = @"defaultCreditAccountMerchantIdentifiersLast30Days";
  v5[38] = &off_10078ABA8;
  v5[39] = &off_10078ABA8;
  v4[40] = @"defaultCreditAccountMapsIdentifiers";
  v4[41] = @"defaultCreditAccountMapsIdentifiersLast30Days";
  v5[40] = &off_10078ABA8;
  v5[41] = &off_10078ABA8;
  v4[42] = @"defaultCreditAccountMapsBrandIdentifiers";
  v4[43] = @"defaultCreditAccountMapsBrandIdentifiersLast30Days";
  v5[42] = &off_10078ABA8;
  v5[43] = &off_10078ABA8;
  v4[44] = @"defaultCreditAccountSupportedDestinations";
  v4[45] = @"defaultCreditAccountRewardsDestination";
  v5[44] = &off_10078ABA8;
  v5[45] = &off_10078AB60;
  v4[46] = @"defaultCreditApplicationCount";
  v4[47] = @"currentDefaultCreditApplictionDaysSinceLastUpdated";
  v5[46] = &off_10078AB90;
  v5[47] = &off_10078AB90;
  v4[48] = @"currentDefaultCreditApplicationState";
  v4[49] = @"defaultCreditAccountIsShared";
  v5[48] = &off_10078AB60;
  v5[49] = &off_10078AB78;
  v4[50] = @"defaultCreditAccountAccessLevel";
  v4[51] = @"defaultCreditAccountIsCoOwner";
  v5[50] = &off_10078AB90;
  v5[51] = &off_10078AB78;
  v4[52] = @"defaultCreditAccountParticipantUsersCount";
  v4[53] = @"defaultCreditAccountHasUnderageParticipant";
  v5[52] = &off_10078AB90;
  v5[53] = &off_10078AB78;
  v4[54] = @"defaultCreditAccountPhysicalAppleCardStatus";
  v4[55] = @"daysSincePhysicalAppleCardShipmentUpdate";
  v5[54] = &off_10078AB60;
  v5[55] = &off_10078AB90;
  v4[56] = @"defaultCreditAccountActivePromotionIdentifiers";
  v4[57] = @"defaultCreditAccountActivePromotionIdentifiersExpiringSoon";
  v5[56] = &off_10078ABA8;
  v5[57] = &off_10078ABA8;
  v4[58] = @"defaultCreditAccountDaysUntilActivePromotionExpires";
  v4[59] = @"defaultCreditAccountHasAutopaySetup";
  v5[58] = &off_10078ABC0;
  v5[59] = &off_10078AB78;
  v4[60] = @"merchantIdentifiers";
  v4[61] = @"mapsIdentifiers";
  v5[60] = &off_10078ABA8;
  v5[61] = &off_10078ABA8;
  v4[62] = @"mapsBrandIdentifiers";
  v4[63] = @"hasPaymentTransaction";
  v5[62] = &off_10078ABA8;
  v5[63] = &off_10078AB78;
  v4[64] = @"hasTransitTransaction";
  v5[64] = &off_10078AB78;
  v4[65] = @"anyCreditAccountStateIsClosed";
  v5[65] = &off_10078AB78;
  v4[66] = @"anyCreditAccountStateIsRemoved";
  v5[66] = &off_10078AB78;
  v4[67] = @"passStyles";
  v5[67] = &off_10078ABA8;
  v4[68] = @"unexpiredPassStyles";
  v5[68] = &off_10078ABA8;
  v4[69] = @"secureElementCardTypes";
  v5[69] = &off_10078ABA8;
  v4[70] = @"unexpiredSecureElementCardTypes";
  v5[70] = &off_10078ABA8;
  v4[71] = @"transitNetworksPresent";
  v5[71] = &off_10078ABA8;
  v4[72] = @"transitNetworksPresentAndUnexpired";
  v5[72] = &off_10078ABA8;
  v4[73] = @"hasPeerPaymentAccount";
  v5[73] = &off_10078AB78;
  v4[74] = @"hasPeerPaymentPassProvisioned";
  v5[74] = &off_10078AB78;
  v4[75] = @"peerPaymentAccountState";
  v5[75] = &off_10078AB90;
  v4[76] = @"peerPaymentAccountStage";
  v5[76] = &off_10078AB90;
  v4[77] = @"peerPaymentAccountStateReason";
  v5[77] = &off_10078AB90;
  v4[78] = @"peerPaymentAccountHasTransaction";
  v5[78] = &off_10078AB78;
  v4[79] = @"peerPaymentAccountHasContactlessTransaction";
  v5[79] = &off_10078AB78;
  v4[80] = @"peerPaymentHasOnlinePurchaseTransaction";
  v5[80] = &off_10078AB78;
  v4[81] = @"daysSinceLastPeerPaymentTransaction";
  v5[81] = &off_10078AB90;
  v4[82] = @"peerPaymentDaysSinceLastP2PTransaction";
  v5[82] = &off_10078AB90;
  v4[83] = @"peerPaymentDaysSinceLastP2PTransactionToAnyParticipant";
  v5[83] = &off_10078AB90;
  v4[84] = @"peerPaymentAccountHasBalance";
  v5[84] = &off_10078AB78;
  v4[85] = @"peerPaymentAccountBalanceBase";
  v5[85] = &off_10078AB90;
  v4[86] = @"peerPaymentHasP2PTransaction";
  v5[86] = &off_10078AB78;
  v4[87] = @"peerPaymentHasAutoReloadEnabled";
  v5[87] = &off_10078AB78;
  v4[88] = @"peerPaymentHasSetupRecurringP2PPayment";
  v5[88] = &off_10078AB78;
  v4[89] = @"peerPaymentHasSetupRecurringP2PPaymentForAnyParticipant";
  v5[89] = &off_10078AB78;
  v4[90] = @"peerPaymentDaysSinceLastPurchaseTransaction";
  v5[90] = &off_10078AB90;
  v4[91] = @"peerPaymentHasSentP2PPayment";
  v5[91] = &off_10078AB78;
  v4[92] = @"peerPaymentHasReceivedP2PPayment";
  v5[92] = &off_10078AB78;
  v4[93] = @"peerPaymentHasSentDeviceTapTransaction";
  v5[93] = &off_10078AB78;
  v4[94] = @"peerPaymentHasReceivedDeviceTapTransaction";
  v5[94] = &off_10078AB78;
  v4[95] = @"peerPaymentNumberOfDeviceTapTransactions";
  v5[95] = &off_10078AB90;
  v4[96] = @"daysSinceLastDeviceTapSendTransaction";
  v5[96] = &off_10078AB90;
  v4[97] = @"peerPaymentFamilyParticipantAccounts";
  v5[97] = &off_10078AB90;
  v4[98] = @"peerPaymentAccountRole";
  v5[98] = &off_10078AB90;
  v4[99] = @"peerPaymentAccountDaysSinceCreatedDate";
  v5[99] = &off_10078AB90;
  v4[100] = @"peerPaymentAccountDaysSinceIdentifiedDate";
  v5[100] = &off_10078AB90;
  v4[101] = @"daysSinceParticipantPeerPaymentAccountIdentifiedDate";
  v5[101] = &off_10078AB90;
  v4[102] = @"peerPaymentAccountHasSentMoneyToAnyParticipant";
  v5[102] = &off_10078AB78;
  v4[103] = @"familyCircleFamilyOrganizer";
  v5[103] = &off_10078AB78;
  v4[104] = @"familyCircleParent";
  v5[104] = &off_10078AB78;
  v4[105] = @"familyCircleHasFamily";
  v5[105] = &off_10078AB78;
  v4[106] = @"familyCircleCurrentUserAge";
  v5[106] = &off_10078AB90;
  v4[107] = @"familyCircleMembersUnderAge";
  v5[107] = &off_10078AB90;
  v4[108] = @"familyCircleMembersCount";
  v5[108] = &off_10078AB90;
  v4[109] = @"familyCircleDaysSinceNewestJoinedDate";
  v5[109] = &off_10078AB90;
  v4[110] = @"familyCircleMinimumMemberAge";
  v5[110] = &off_10078AB90;
  v4[111] = @"familyCircleAgeCategory";
  v5[111] = &off_10078AB90;
  v4[112] = @"discoveryItemsWithActiveStatus";
  v5[112] = &off_10078ABD8;
  v4[113] = @"discoveryItemsWithActionedStatus";
  v5[113] = &off_10078ABD8;
  v4[114] = @"discoveryItemsWithDismissedStatus";
  v5[114] = &off_10078ABD8;
  v4[115] = @"discoveryItemsWithWaitingForTriggerStatus";
  v5[115] = &off_10078ABD8;
  v4[116] = @"discoveryItemsExpanded";
  v5[116] = &off_10078ABD8;
  v4[117] = @"discoveryItemsDismissed";
  v5[117] = &off_10078ABD8;
  v4[118] = @"discoveryCTAsTapped";
  v5[118] = &off_10078ABD8;
  v4[119] = @"discoveryCTAsCompleted";
  v5[119] = &off_10078ABD8;
  v4[120] = @"sentTransitDCINotifications";
  v5[120] = &off_10078ABD8;
  v4[121] = @"sentTransitOpenLoopUpgradeNotifications";
  v5[121] = &off_10078ABD8;
  v4[122] = @"sentTransitOpenLoopRenotifiedInMarketNotifications";
  v5[122] = &off_10078ABD8;
  v4[123] = @"cardTypesWithExpressEnabled";
  v5[123] = &off_10078ABD8;
  v4[124] = @"supportedMarketsForCurrentLocation";
  v5[124] = &off_10078ABD8;
  v4[125] = @"supportedTransitMarketsForCurrentLocation";
  v5[125] = &off_10078ABD8;
  v4[126] = @"supportedTransitNetworksForCurrentLocation";
  v5[126] = &off_10078ABD8;
  v4[127] = @"expressTransitNetworksForCurrentLocation";
  v5[127] = &off_10078ABD8;
  v4[128] = @"hasTransitPassForCurrentLocation";
  v5[128] = &off_10078AB78;
  v4[129] = @"hasUnexpiredTransitPassForCurrentLocation";
  v5[129] = &off_10078AB78;
  v4[130] = @"currentPlacemark";
  v5[130] = &off_10078ABC0;
  v4[131] = @"currentPlacemark.ISOcountryCode";
  v5[131] = &off_10078AB60;
  v4[132] = @"currentPlacemark.postalCode";
  v5[132] = &off_10078AB60;
  v4[133] = @"currentPlacemark.administrativeArea";
  v5[133] = &off_10078AB60;
  v4[134] = @"currentPlacemark.subAdministrativeArea";
  v5[134] = &off_10078AB60;
  v4[135] = @"currentPlacemark.locality";
  v5[135] = &off_10078AB60;
  v4[136] = @"currentPlacemark.subLocality";
  v5[136] = &off_10078AB60;
  v4[137] = @"hasPayLaterAccount";
  v5[137] = &off_10078AB78;
  v4[138] = @"isPayLaterHidden";
  v5[138] = &off_10078AB78;
  v4[139] = @"hasEverProvisionedPayLaterPass";
  v5[139] = &off_10078AB78;
  v4[140] = @"hasPayLaterPass";
  v5[140] = &off_10078AB78;
  v4[141] = @"payLaterNumberOfLoans";
  v5[141] = &off_10078AB90;
  v4[142] = @"payLaterDaysSinceFirstActiveLoan";
  v5[142] = &off_10078AB90;
  v4[143] = @"payLaterNumberOfActiveLoans";
  v5[143] = &off_10078AB90;
  v4[144] = @"payLaterNumberOfPendingLoans";
  v5[144] = &off_10078AB90;
  v4[145] = @"payLaterNumberOfDelinquentLoans";
  v5[145] = &off_10078AB90;
  v4[146] = @"payLaterNumberOfCanceledLoans";
  v5[146] = &off_10078AB90;
  v4[147] = @"payLaterNumberOfCompleteLoans";
  v5[147] = &off_10078AB90;
  v4[148] = @"hasSavingsAccount";
  v5[148] = &off_10078AB78;
  v4[149] = @"savingsAccountDaysSinceCreatedDate";
  v5[149] = &off_10078AB90;
  v4[150] = @"savingsAccountHasExternalTransferIn";
  v5[150] = &off_10078AB78;
  v4[151] = @"savingsAccountHasExternalTransferOut";
  v5[151] = &off_10078AB78;
  v4[152] = @"savingsAccountHasCashTransferIn";
  v5[152] = &off_10078AB78;
  v4[153] = @"savingsAccountBinnedBalance";
  v5[153] = &off_10078AB90;
  v4[154] = @"installedApps";
  v5[154] = &off_10078ABA8;
  v4[155] = @"hasPairedWatch";
  v5[155] = &off_10078AB78;
  v4[156] = @"enrolledAuthenticationMechanisms";
  v5[156] = &off_10078ABA8;
  v4[157] = @"hasIssuerInstallmentCard";
  v5[157] = &off_10078AB78;
  v4[158] = @"hasEverMadeIssuerInstallmentTransaction";
  v5[158] = &off_10078AB78;
  v4[159] = @"hasBankConnectEligibleCard";
  v5[159] = &off_10078AB78;
  v4[160] = @"hasAnyConnectedCardWithBankConnect";
  v5[160] = &off_10078AB78;
  v4[161] = @"hasRewardsCard";
  v5[161] = &off_10078AB78;
  v4[162] = @"hasEverMadeRewardsTransaction";
  v5[162] = &off_10078AB78;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:163];
  return v2;
}

+ (BOOL)isTransactionRelevant:(id)a3
{
  id v4 = a3;
  v5 = [a1 _applePayRelevantTransactionTypes];
  id v6 = [v4 transactionType];

  v7 = +[NSNumber numberWithInteger:v6];
  unsigned __int8 v8 = [v5 containsObject:v7];

  return v8;
}

+ (id)_applePayRelevantTransactionTypes
{
  return &off_10078C1E0;
}

- (PDUserEvaluationEnvironment)init
{
  return [(PDUserEvaluationEnvironment *)self initWithAccountManager:0 applyManager:0 databaseManager:0 peerPaymentWebServiceCoordinator:0 paymentWebServiceCoordinator:0 transitNotificationService:0 familyCircleManager:0 expressPassManager:0 discoveryManager:0];
}

- (PDUserEvaluationEnvironment)initWithAccountManager:(id)a3 applyManager:(id)a4 databaseManager:(id)a5 peerPaymentWebServiceCoordinator:(id)a6 paymentWebServiceCoordinator:(id)a7 transitNotificationService:(id)a8 familyCircleManager:(id)a9 expressPassManager:(id)a10 discoveryManager:(id)a11
{
  id v57 = a3;
  id v56 = a4;
  id v55 = a5;
  id v54 = a6;
  id v53 = a7;
  id v52 = a8;
  id v51 = a9;
  id v50 = a10;
  id v49 = a11;
  v58.receiver = self;
  v58.super_class = (Class)PDUserEvaluationEnvironment;
  v18 = [(PDUserEvaluationEnvironment *)&v58 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_accountManager, a3);
    objc_storeStrong((id *)&v19->_applyManager, a4);
    objc_storeStrong((id *)&v19->_databaseManager, a5);
    objc_storeStrong((id *)&v19->_peerPaymentWebServiceCoordinator, a6);
    objc_storeStrong((id *)&v19->_paymentWebServiceCoordinator, a7);
    objc_storeStrong((id *)&v19->_transitNotificationService, a8);
    objc_storeStrong((id *)&v19->_familyCircleManager, a9);
    objc_storeStrong((id *)&v19->_expressPassManager, a10);
    objc_storeStrong((id *)&v19->_discoveryManager, a11);
    v19->_prefetchedFamilyMemberType = -1;
    v19->_daysSinceLastPeerPaymentP2PTransaction = -1;
    v19->_peerPaymentDaysSinceLastP2PTransactionToAnyParticipant = -1;
    v19->_peerPaymentDaysSinceLastPurchaseTransaction = -1;
    v19->_familyCircleCurrentUserAge = -1;
    v19->_familyCircleMembersUnderAge = -1;
    v19->_familyCircleDaysSinceNewestJoinedDate = -1;
    v19->_familyCircleMinimumMemberAge = -1;
    v19->_daysSinceOldestPaymentPassIngestDate = -1;
    v19->_daysSinceOldestCreditCardIngestDate = -1;
    v19->_payLaterDaysSinceFirstActiveLoan = -1;
    v19->_daysSinceLastDefaultCreditAccountTransaction = -1;
    v19->_daysSinceLastApplePayTransaction = -1;
    v19->_daysSinceLastPeerPaymentTransaction = -1;
    v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queriedMerchantIdentifierPresence = v19->_queriedMerchantIdentifierPresence;
    v19->_queriedMerchantIdentifierPresence = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queriedMapsIdentifierPresence = v19->_queriedMapsIdentifierPresence;
    v19->_queriedMapsIdentifierPresence = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queriedMapsBrandIdentifierPresence = v19->_queriedMapsBrandIdentifierPresence;
    v19->_queriedMapsBrandIdentifierPresence = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queriedDefaultCreditAccountMerchantIdentifierPresence = v19->_queriedDefaultCreditAccountMerchantIdentifierPresence;
    v19->_queriedDefaultCreditAccountMerchantIdentifierPresence = v26;

    v28 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence = v19->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence;
    v19->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence = v28;

    v30 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queriedDefaultCreditAccountMapsIdentifierPresence = v19->_queriedDefaultCreditAccountMapsIdentifierPresence;
    v19->_queriedDefaultCreditAccountMapsIdentifierPresence = v30;

    v32 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence = v19->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence;
    v19->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence = v32;

    v34 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queriedDefaultCreditAccountMapsBrandIdentifierPresence = v19->_queriedDefaultCreditAccountMapsBrandIdentifierPresence;
    v19->_queriedDefaultCreditAccountMapsBrandIdentifierPresence = v34;

    v36 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence = v19->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence;
    v19->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence = v36;

    v38 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queriedDefaultCreditAccountActivePromotionIdentifiersPresence = v19->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence;
    v19->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence = v38;

    v40 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence = v19->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence;
    v19->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence = v40;

    v42 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queriedDefaultCreditAccountDaysUntilActivePromotionExpires = v19->_queriedDefaultCreditAccountDaysUntilActivePromotionExpires;
    v19->_queriedDefaultCreditAccountDaysUntilActivePromotionExpires = v42;

    v19->_peerPaymentDaysSinceLastDeviceTapSendTransaction = -1;
    v44 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    queriedAppIdentifierPresence = v19->_queriedAppIdentifierPresence;
    v19->_queriedAppIdentifierPresence = v44;

    *(_OWORD *)&v19->_defaultPhysicalCardStatus = xmmword_1005B3580;
    v19->_rulesNeedLocation = [(PDDiscoveryManager *)v19->_discoveryManager rulesNeedLocation];
    v19->_rulesNeedPlacemark = [(PDDiscoveryManager *)v19->_discoveryManager rulesNeedPlacemark];
    v46 = (FKBankConnectEvaluationManager *)objc_alloc_init(off_100805968());
    bankConnectEvaluationManager = v19->_bankConnectEvaluationManager;
    v19->_bankConnectEvaluationManager = v46;
  }
  return v19;
}

- (NSString)deviceLanguage
{
  return (NSString *)+[NSLocale pk_deviceLanguage];
}

- (BOOL)isApplePayActive
{
  if (self->_hasQueriedApplePayActive) {
    return self->_isApplePayActive;
  }
  unsigned __int8 v4 = [(PDDatabaseManager *)self->_databaseManager passExistsWithPassType:1];
  BOOL result = v4 & [(PDDatabaseManager *)self->_databaseManager hasAnyTransactions];
  self->_isApplePayActive = result;
  self->_hasQueriedApplePayActive = 1;
  return result;
}

- (BOOL)isApplePaySetupAvailable
{
  if (self->_hasQueriedApplePaySetUpState) {
    return self->_isApplePaySetupAvailable;
  }
  if (PKSecureElementIsAvailable() && (PKCurrentUserIsGuestUser() & 1) == 0) {
    int v4 = PKCurrentUserIsInSharingMode() ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }
  v5 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
  id v6 = [v5 paymentSetupSupportedInRegion];

  if (v6) {
    BOOL result = v4;
  }
  else {
    BOOL result = 0;
  }
  self->_isApplePaySetupAvailable = result;
  self->_hasQueriedApplePaySetUpState = 1;
  return result;
}

- (BOOL)isPrimaryAppleAccountVerified
{
  return PKHasVerifiedPrimaryAppleAccount() != 0;
}

- (BOOL)isDeviceRegisteredWithBroker
{
  if (!self->_hasQueriedBrokerRegistration)
  {
    v3 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator sharedWebService];
    int v4 = [v3 context];
    self->_isBrokerRegistered = [v4 isRegistered];

    self->_hasQueriedBrokerRegistration = 1;
  }
  return self->_isBrokerRegistered;
}

- (BOOL)hasPaymentCard
{
  if (self->_hasQueriedPaymentCards) {
    return self->_hasPaymentCard;
  }
  BOOL result = [(PDDatabaseManager *)self->_databaseManager passExistsWithPassType:1];
  self->_hasPaymentCard = result;
  self->_hasQueriedPaymentCards = 1;
  return result;
}

- (BOOL)hasDebitCard
{
  if (self->_hasQueriedDebitCards) {
    return self->_hasDebitCard;
  }
  BOOL result = [(PDDatabaseManager *)self->_databaseManager passExistsWithPaymentType:1];
  self->_hasDebitCard = result;
  self->_hasQueriedDebitCards = 1;
  return result;
}

- (BOOL)hasApplePayTransaction
{
  if (!self->_hasQueriedApplePayTransactions)
  {
    v3 = +[PDUserEvaluationEnvironment _applePayRelevantTransactionTypes];
    int v4 = [(PDDatabaseManager *)self->_databaseManager transactionsOfTypes:v3 withTransactionSource:0 withBackingData:0 limit:1];
    v5 = [v4 firstObject];
    self->_hasApplePayTransaction = v5 != 0;

    self->_hasQueriedApplePayTransactions = 1;
  }
  return self->_hasApplePayTransaction;
}

- (int64_t)daysSinceLastTransaction
{
  if (!self->_hasQueriedDaysSinceLastTransaction)
  {
    v3 = +[PDUserEvaluationEnvironment _applePayRelevantTransactionTypes];
    int v4 = [(PDDatabaseManager *)self->_databaseManager transactionsOfTypes:v3 withTransactionSource:0 withBackingData:0 limit:1];
    v5 = [v4 firstObject];
    if (v5)
    {
      id v6 = +[NSDate date];
      v7 = [v5 transactionDate];
      [v6 timeIntervalSinceDate:v7];
      double v9 = v8;

      self->_daysSinceLastApplePayTransaction = vcvtmd_s64_f64(v9 / 86400.0);
    }
    self->_hasQueriedDaysSinceLastTransaction = 1;
  }
  return self->_daysSinceLastApplePayTransaction;
}

- (int64_t)daysSinceOldestPaymentPassIngestDate
{
  if (!self->_hasQueriedDaysSinceOldestPaymentPassIngestDate)
  {
    v3 = [(PDDatabaseManager *)self->_databaseManager passesOfType:1];
    int v4 = [v3 objectsPassingTest:&stru_1007397F8];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      id v7 = v6;
      double v8 = 0;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v5);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "ingestedDate", (void)v17);
          if (v11 && (!v8 || [v8 compare:v11] == (id)1))
          {
            id v12 = v11;

            double v8 = v12;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);

      if (v8)
      {
        v13 = +[NSDate date];
        [v13 timeIntervalSinceDate:v8];
        double v15 = v14;

        self->_daysSinceOldestPaymentPassIngestDate = vcvtmd_s64_f64(v15 / 86400.0);
      }
    }
    else
    {

      double v8 = 0;
    }
    self->_hasQueriedDaysSinceOldestPaymentPassIngestDate = 1;
  }
  return self->_daysSinceOldestPaymentPassIngestDate;
}

- (int64_t)daysSinceOldestCreditCardIngestDate
{
  if (!self->_hasQueriedDaysSinceOldestCreditCardIngestDate)
  {
    v3 = [(PKAccount *)self->_prefetchedDefaultCreditAccount associatedPassUniqueID];
    int v4 = [(PDDatabaseManager *)self->_databaseManager passesOfType:1];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100139760;
    v23[3] = &unk_100739820;
    id v5 = v3;
    id v24 = v5;
    id v6 = [v4 objectsPassingTest:v23];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v7 = v6;
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v8)
    {
      id v9 = v8;
      v10 = 0;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v7);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "ingestedDate", (void)v19);
          if (v13 && (!v10 || [v10 compare:v13] == (id)1))
          {
            id v14 = v13;

            v10 = v14;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v9);

      if (v10)
      {
        double v15 = +[NSDate date];
        [v15 timeIntervalSinceDate:v10];
        double v17 = v16;

        self->_daysSinceOldestPaymentPassIngestDate = vcvtmd_s64_f64(v17 / 86400.0);
      }
    }
    else
    {

      v10 = 0;
    }
    self->_hasQueriedDaysSinceOldestPaymentPassIngestDate = 1;
  }
  return self->_daysSinceOldestPaymentPassIngestDate;
}

- (int64_t)defaultCreditAccountSetupFeatureState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int64_t v2 = -1;
  uint64_t v9 = -1;
  prefetchedSetupFeatures = self->_prefetchedSetupFeatures;
  if (prefetchedSetupFeatures)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1001398EC;
    v5[3] = &unk_100739848;
    v5[4] = &v6;
    [(NSArray *)prefetchedSetupFeatures enumerateObjectsUsingBlock:v5];
    int64_t v2 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (BOOL)hasDefaultCreditAccount
{
  return self->_prefetchedDefaultCreditAccount != 0;
}

- (int64_t)defaultCreditAccountState
{
  int64_t result = (int64_t)self->_prefetchedDefaultCreditAccount;
  if (result) {
    return (int64_t)[(id)result state];
  }
  return result;
}

- (NSDecimalNumber)defaultCreditAccountLifetimeRewards
{
  v3 = +[NSDecimalNumber zero];
  int v4 = [(PDUserEvaluationEnvironment *)self _defaultCreditAccountAccountStatement];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 rewardsLifetime];

    v3 = (void *)v6;
  }

  return (NSDecimalNumber *)v3;
}

- (BOOL)defaultCreditAccountHasPhysicalCard
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (!prefetchedDefaultCreditAccount) {
    return 0;
  }
  int v4 = [(PKAccount *)prefetchedDefaultCreditAccount accountIdentifier];
  id v5 = [(PDUserEvaluationEnvironment *)self _creditAccountPhysicalCardsForAccountIdentifier:v4];

  if (v5) {
    BOOL v6 = [v5 count] != 0;
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)defaultCreditAccountHasVirtualCard
{
  int64_t v2 = [(PDUserEvaluationEnvironment *)self _defaultCreditAccountCreditAccountDetails];
  v3 = v2;
  if (v2)
  {
    int v4 = [v2 virtualCards];
    id v5 = v4;
    if (v4) {
      BOOL v6 = [v4 count] != 0;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)defaultCreditAccountHasDynamicSecurityCode
{
  int64_t v2 = [(PDUserEvaluationEnvironment *)self _defaultCreditAccountCreditAccountDetails];
  v3 = v2;
  if (v2)
  {
    int v4 = [v2 virtualCards];
    id v5 = v4;
    if (v4 && [v4 count])
    {
      BOOL v6 = [v5 anyObject];
      unsigned __int8 v7 = [v6 hasDynamicSecurityCode];
    }
    else
    {
      unsigned __int8 v7 = 0;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (BOOL)defaultCreditAccountRequiresDebtCollectionNotices
{
  int64_t v2 = [(PDUserEvaluationEnvironment *)self _defaultCreditAccountAccountSummary];
  v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 requiresDebtCollectionNotices];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (int64_t)defaultCreditAccountBalanceStatus
{
  int64_t v2 = [(PDUserEvaluationEnvironment *)self _defaultCreditAccountAccountSummary];
  v3 = v2;
  if (v2) {
    id v4 = [v2 balanceStatus];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (int64_t)defaultCreditAccountCyclesPastDue
{
  int64_t v2 = [(PDUserEvaluationEnvironment *)self _defaultCreditAccountAccountSummary];
  v3 = v2;
  if (v2) {
    id v4 = [v2 cyclesPastDue];
  }
  else {
    id v4 = 0;
  }

  return (int64_t)v4;
}

- (BOOL)defaultCreditAccountInGrace
{
  int64_t v2 = [(PDUserEvaluationEnvironment *)self _defaultCreditAccountCreditAccountDetails];
  v3 = [v2 accountSummary];
  id v4 = v3;
  if (v3) {
    unsigned __int8 v5 = [v3 inGrace];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)defaultCreditAccountInDisasterRecovery
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (prefetchedDefaultCreditAccount) {
    LOBYTE(prefetchedDefaultCreditAccount) = [(PKAccount *)prefetchedDefaultCreditAccount stateReason] == (id)2;
  }
  return (char)prefetchedDefaultCreditAccount;
}

- (void)updateDisputeState
{
  if (!self->_hasQueriedForDisputeState)
  {
    self->_defaultCreditAccountHasDisputeOpen = 0;
    self->_defaultCreditAccountDaysSinceDisputeOpened = -1;
    if (self->_prefetchedDefaultCreditAccount)
    {
      id v8 = [(PDDatabaseManager *)self->_databaseManager transactionsForAdjustmentType:1 limit:1];
      if ([v8 count])
      {
        self->_defaultCreditAccountHasDisputeOpen = 1;
        v3 = [v8 firstObject];
        id v4 = [v3 transactionDate];
        unsigned __int8 v5 = +[NSDate date];
        [v5 timeIntervalSinceDate:v4];
        double v7 = v6;

        self->_defaultCreditAccountDaysSinceDisputeOpened = vcvtmd_s64_f64(v7 / 86400.0);
      }
      else
      {
        self->_defaultCreditAccountHasDisputeOpen = 0;
        self->_defaultCreditAccountDaysSinceDisputeOpened = -1;
      }
      self->_hasQueriedForDisputeState = 1;
    }
  }
}

- (BOOL)defaultCreditAccountHasDisputeOpen
{
  return self->_defaultCreditAccountHasDisputeOpen;
}

- (int64_t)defaultCreditAccountDaysSinceDisputeOpened
{
  return self->_defaultCreditAccountDaysSinceDisputeOpened;
}

- (NSDecimalNumber)defaultCreditAccountAvailableCredit
{
  v3 = +[NSDecimalNumber zero];
  id v4 = [(PDUserEvaluationEnvironment *)self _defaultCreditAccountAccountSummary];
  unsigned __int8 v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 availableCredit];

    v3 = (void *)v6;
  }

  return (NSDecimalNumber *)v3;
}

- (BOOL)defaultCreditAccountSupportsShowNotifications
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (prefetchedDefaultCreditAccount) {
    LOBYTE(prefetchedDefaultCreditAccount) = [(PKAccount *)prefetchedDefaultCreditAccount supportsShowNotifications];
  }
  return (char)prefetchedDefaultCreditAccount;
}

- (BOOL)defaultCreditAccountPassIsDefault
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (!prefetchedDefaultCreditAccount) {
    return 0;
  }
  if (!self->_defaultPassUniqueIdentifier)
  {
    PDUserSpecifiedDefaultPaymentPassUniqueIdentifier();
    id v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    defaultPassUniqueIdentifier = self->_defaultPassUniqueIdentifier;
    self->_defaultPassUniqueIdentifier = v4;

    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  }
  uint64_t v6 = [(PKAccount *)prefetchedDefaultCreditAccount associatedPassUniqueID];
  double v7 = self->_defaultPassUniqueIdentifier;
  id v8 = v6;
  uint64_t v9 = v7;
  v10 = v9;
  if (v8 == v9)
  {
    unsigned __int8 v11 = 1;
  }
  else
  {
    unsigned __int8 v11 = 0;
    if (v8 && v9) {
      unsigned __int8 v11 = [(NSString *)v8 isEqualToString:v9];
    }
  }

  return v11;
}

- (int64_t)defaultCreditAccountDaysSinceLastTransaction
{
  int64_t result = self->_daysSinceLastDefaultCreditAccountTransaction;
  if (result < 0 && self->_prefetchedDefaultCreditAccount)
  {
    id v4 = [(PKAccount *)self->_prefetchedDefaultCreditAccount associatedPassUniqueID];
    unsigned __int8 v5 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v4];
    uint64_t v6 = [(PDDatabaseManager *)self->_databaseManager transactionsForTransactionSourceIdentifiers:v5 withTransactionSource:0 withBackingData:0 limit:1];
    if ([v6 count] == (id)1)
    {
      double v7 = [v6 anyObject];
      id v8 = [v7 transactionDate];
      uint64_t v9 = +[NSDate date];
      [v9 timeIntervalSinceDate:v8];
      double v11 = v10;

      self->_daysSinceLastDefaultCreditAccountTransaction = vcvtmd_s64_f64(v11 / 86400.0);
    }

    return self->_daysSinceLastDefaultCreditAccountTransaction;
  }
  return result;
}

- (BOOL)defaultCreditAccountHasInStoreTransaction
{
  if (self->_hasQueriedDefaultCreditAccountInStoreTransaction) {
    return self->_hasDefaultCreditAccountInStoreTransaction;
  }
  BOOL result = [(PDUserEvaluationEnvironment *)self _hasDefaultCreditAccountTransactionOfTransactionSourceType:1];
  self->_hasDefaultCreditAccountInStoreTransaction = result;
  self->_hasQueriedDefaultCreditAccountInStoreTransaction = 1;
  return result;
}

- (BOOL)defaultCreditAccountHasInAppTransaction
{
  if (self->_hasQueriedDefaultCreditAccountInAppTransaction) {
    return self->_hasDefaultCreditAccountInAppTransaction;
  }
  BOOL result = [(PDUserEvaluationEnvironment *)self _hasDefaultCreditAccountTransactionOfTransactionSourceType:2];
  self->_hasDefaultCreditAccountInAppTransaction = result;
  self->_hasQueriedDefaultCreditAccountInAppTransaction = 1;
  return result;
}

- (BOOL)defaultCreditAccountHasWebTransaction
{
  if (self->_hasQueriedDefaultCreditAccountWebTransaction) {
    return self->_hasDefaultCreditAccountWebTransaction;
  }
  BOOL result = [(PDUserEvaluationEnvironment *)self _hasDefaultCreditAccountTransactionOfTransactionSourceType:3];
  self->_hasDefaultCreditAccountWebTransaction = result;
  self->_hasQueriedDefaultCreditAccountWebTransaction = 1;
  return result;
}

- (BOOL)defaultCreditAccountHasVirtualCardTransaction
{
  if (self->_hasQueriedDefaultCreditAccountVirtualCardTransaction) {
    return self->_hasDefaultCreditAccountVirtualCardTransaction;
  }
  BOOL result = [(PDUserEvaluationEnvironment *)self _hasDefaultCreditAccountTransactionOfTransactionSourceType:6];
  self->_hasDefaultCreditAccountVirtualCardTransaction = result;
  self->_hasQueriedDefaultCreditAccountVirtualCardTransaction = 1;
  return result;
}

- (BOOL)defaultCreditAccountHasPhysicalCardTransaction
{
  if (self->_hasQueriedDefaultCreditAccountPhysicalCardTransaction) {
    return self->_hasDefaultCreditAccountPhysicalCardTransaction;
  }
  BOOL result = [(PDUserEvaluationEnvironment *)self _hasDefaultCreditAccountTransactionOfTransactionSourceType:5];
  self->_hasDefaultCreditAccountPhysicalCardTransaction = result;
  self->_hasQueriedDefaultCreditAccountPhysicalCardTransaction = 1;
  return result;
}

- (int64_t)defaultCreditAccountDaysSinceCreatedDate
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (!prefetchedDefaultCreditAccount) {
    return -1;
  }
  if (![(PKAccount *)prefetchedDefaultCreditAccount isCoOwner]) {
    goto LABEL_5;
  }
  id v4 = [(PKAccount *)self->_prefetchedDefaultCreditAccount previousAccountIdentifiers];
  id v5 = [v4 count];

  if (!v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [(PKAccount *)self->_prefetchedDefaultCreditAccount previousAccountIdentifiers];
  double v7 = [v6 anyObject];

  id v8 = [(PDUserEvaluationEnvironment *)self _creditAccountWithIdentifier:v7];
  uint64_t v9 = [v8 creditDetails];
  double v10 = [v9 createdDate];

  if (!v10)
  {
LABEL_5:
    double v11 = [(PKAccount *)self->_prefetchedDefaultCreditAccount creditDetails];
    double v10 = [v11 createdDate];
  }
  id v12 = +[NSDate date];
  [v12 timeIntervalSinceDate:v10];
  double v14 = v13;

  int64_t v15 = vcvtmd_s64_f64(v14 / 86400.0);
  return v15;
}

- (BOOL)defaultCreditAccountHasActiveInstallment
{
  int64_t v2 = [(PDUserEvaluationEnvironment *)self _defaultCreditAccountCreditAccountDetails];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = objc_msgSend(v2, "installmentPlans", 0);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) state] == (id)2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (NSSet)defaultCreditAccountSupportedDestinations
{
  return (NSSet *)[(PDUserEvaluationEnvironment *)self _defaultCreditAccountSupportedDestinations];
}

- (NSString)defaultCreditAccountRewardsDestination
{
  int64_t v2 = [(PKAccount *)self->_prefetchedDefaultCreditAccount creditDetails];
  [v2 rewardsDestination];
  v3 = PKAccountRewardRedemptionTypeToString();

  return (NSString *)v3;
}

- (BOOL)defaultCreditAccountHasUsedInstallments
{
  int64_t v2 = [(PDUserEvaluationEnvironment *)self _defaultCreditAccountCreditAccountDetails];
  v3 = [v2 installmentPlans];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)defaultCreditAccountHasAutopaySetup
{
  uint64_t v3 = [(PKAccount *)self->_prefetchedDefaultCreditAccount accountIdentifier];
  BOOL v4 = (void *)v3;
  if (!self->_hasQueriedDefaultCreditAccountHasAutopaySetup && v3 != 0)
  {
    uint64_t v6 = [(PDDatabaseManager *)self->_databaseManager scheduledPaymentsWithAccountIdentifier:v3 includeFailedRecurringPayments:0];
    self->_BOOL hasDefaultCreditAccountAutopaySetup = objc_msgSend(v6, "pk_containsObjectPassingTest:", &stru_100739888);
    self->_hasQueriedDefaultCreditAccountHasAutopaySetup = 1;
  }
  BOOL hasDefaultCreditAccountAutopaySetup = self->_hasDefaultCreditAccountAutopaySetup;

  return hasDefaultCreditAccountAutopaySetup;
}

- (id)memberOfDefaultCreditAccountMerchantIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_queriedDefaultCreditAccountMerchantIdentifierPresence objectForKeyedSubscript:v4];
  if (!v5)
  {
    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
    if (prefetchedDefaultCreditAccount)
    {
      double v7 = [(PKAccount *)prefetchedDefaultCreditAccount associatedPassUniqueID];
      databaseManager = self->_databaseManager;
      id v9 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
      BOOL v10 = [(PDDatabaseManager *)databaseManager hasAnyTransactionsWithMerchantIdentifiers:v9 forPassUniqueIdentifier:v7];

      uint64_t v5 = +[NSNumber numberWithBool:v10];
      [(NSMutableDictionary *)self->_queriedDefaultCreditAccountMerchantIdentifierPresence setObject:v5 forKeyedSubscript:v4];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  if ([v5 BOOLValue]) {
    id v11 = v4;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (unint64_t)countOfDefaultCreditAccountMerchantIdentifiers
{
  return (unint64_t)[(NSMutableDictionary *)self->_queriedDefaultCreditAccountMerchantIdentifierPresence count];
}

- (id)enumeratorOfDefaultCreditAccountMerchantIdentifiers
{
  queriedDefaultCreditAccountMerchantIdentifierPresence = self->_queriedDefaultCreditAccountMerchantIdentifierPresence;
  uint64_t v3 = +[NSNumber numberWithBool:1];
  id v4 = [(NSMutableDictionary *)queriedDefaultCreditAccountMerchantIdentifierPresence allKeysForObject:v3];
  uint64_t v5 = [v4 objectEnumerator];

  return v5;
}

- (id)memberOfDefaultCreditAccountMerchantIdentifiersLast30Days:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence objectForKeyedSubscript:v4];
  if (!v5)
  {
    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
    if (prefetchedDefaultCreditAccount)
    {
      double v7 = [(PKAccount *)prefetchedDefaultCreditAccount associatedPassUniqueID];
      long long v8 = +[NSDate dateWithTimeIntervalSinceNow:-2592000.0];
      databaseManager = self->_databaseManager;
      id v10 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
      id v11 = +[NSDate date];
      BOOL v12 = [(PDDatabaseManager *)databaseManager hasAnyTransactionsWithMerchantIdentifiers:v10 forPassUniqueIdentifier:v7 startDate:v8 endDate:v11];

      uint64_t v5 = +[NSNumber numberWithBool:v12];
      [(NSMutableDictionary *)self->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence setObject:v5 forKeyedSubscript:v4];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  if ([v5 BOOLValue]) {
    id v13 = v4;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (unint64_t)countOfDefaultCreditAccountMerchantIdentifiersLast30Days
{
  return (unint64_t)[(NSMutableDictionary *)self->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence count];
}

- (id)enumeratorOfDefaultCreditAccountMerchantIdentifiersLast30Days
{
  queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence = self->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence;
  uint64_t v3 = +[NSNumber numberWithBool:1];
  id v4 = [(NSMutableDictionary *)queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence allKeysForObject:v3];
  uint64_t v5 = [v4 objectEnumerator];

  return v5;
}

- (id)memberOfDefaultCreditAccountMapsIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_queriedDefaultCreditAccountMapsIdentifierPresence objectForKeyedSubscript:v4];
  if (!v5)
  {
    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
    if (prefetchedDefaultCreditAccount)
    {
      double v7 = [(PKAccount *)prefetchedDefaultCreditAccount associatedPassUniqueID];
      databaseManager = self->_databaseManager;
      id v9 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
      BOOL v10 = [(PDDatabaseManager *)databaseManager hasAnyTransactionsWithMapsIdentifiers:v9 forPassUniqueIdentifier:v7];

      uint64_t v5 = +[NSNumber numberWithBool:v10];
      [(NSMutableDictionary *)self->_queriedDefaultCreditAccountMapsIdentifierPresence setObject:v5 forKeyedSubscript:v4];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  if ([v5 BOOLValue]) {
    id v11 = v4;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (unint64_t)countOfDefaultCreditAccountMapsIdentifiers
{
  return (unint64_t)[(NSMutableDictionary *)self->_queriedDefaultCreditAccountMapsIdentifierPresence count];
}

- (id)enumeratorOfDefaultCreditAccountMapsIdentifiers
{
  queriedDefaultCreditAccountMapsIdentifierPresence = self->_queriedDefaultCreditAccountMapsIdentifierPresence;
  uint64_t v3 = +[NSNumber numberWithBool:1];
  id v4 = [(NSMutableDictionary *)queriedDefaultCreditAccountMapsIdentifierPresence allKeysForObject:v3];
  uint64_t v5 = [v4 objectEnumerator];

  return v5;
}

- (id)memberOfDefaultCreditAccountMapsIdentifiersLast30Days:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence objectForKeyedSubscript:v4];
  if (!v5)
  {
    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
    if (prefetchedDefaultCreditAccount)
    {
      double v7 = [(PKAccount *)prefetchedDefaultCreditAccount associatedPassUniqueID];
      long long v8 = +[NSDate dateWithTimeIntervalSinceNow:-2592000.0];
      databaseManager = self->_databaseManager;
      id v10 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
      id v11 = +[NSDate date];
      BOOL v12 = [(PDDatabaseManager *)databaseManager hasAnyTransactionsWithMapsIdentifiers:v10 forPassUniqueIdentifier:v7 startDate:v8 endDate:v11];

      uint64_t v5 = +[NSNumber numberWithBool:v12];
      [(NSMutableDictionary *)self->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence setObject:v5 forKeyedSubscript:v4];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  if ([v5 BOOLValue]) {
    id v13 = v4;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (unint64_t)countOfDefaultCreditAccountMapsIdentifiersLast30Days
{
  return (unint64_t)[(NSMutableDictionary *)self->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence count];
}

- (id)enumeratorOfDefaultCreditAccountMapsIdentifiersLast30Days
{
  queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence = self->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence;
  uint64_t v3 = +[NSNumber numberWithBool:1];
  id v4 = [(NSMutableDictionary *)queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence allKeysForObject:v3];
  uint64_t v5 = [v4 objectEnumerator];

  return v5;
}

- (id)memberOfDefaultCreditAccountMapsBrandIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_queriedDefaultCreditAccountMapsBrandIdentifierPresence objectForKeyedSubscript:v4];
  if (!v5)
  {
    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
    if (prefetchedDefaultCreditAccount)
    {
      double v7 = [(PKAccount *)prefetchedDefaultCreditAccount associatedPassUniqueID];
      databaseManager = self->_databaseManager;
      id v9 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
      BOOL v10 = [(PDDatabaseManager *)databaseManager hasAnyTransactionsWithMapsBrandIdentifiers:v9 forPassUniqueIdentifier:v7];

      uint64_t v5 = +[NSNumber numberWithBool:v10];
      [(NSMutableDictionary *)self->_queriedDefaultCreditAccountMapsBrandIdentifierPresence setObject:v5 forKeyedSubscript:v4];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  if ([v5 BOOLValue]) {
    id v11 = v4;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

- (unint64_t)countOfDefaultCreditAccountMapsBrandIdentifiers
{
  return (unint64_t)[(NSMutableDictionary *)self->_queriedDefaultCreditAccountMapsBrandIdentifierPresence count];
}

- (id)enumeratorOfDefaultCreditAccountMapsBrandIdentifiers
{
  queriedDefaultCreditAccountMapsBrandIdentifierPresence = self->_queriedDefaultCreditAccountMapsBrandIdentifierPresence;
  uint64_t v3 = +[NSNumber numberWithBool:1];
  id v4 = [(NSMutableDictionary *)queriedDefaultCreditAccountMapsBrandIdentifierPresence allKeysForObject:v3];
  uint64_t v5 = [v4 objectEnumerator];

  return v5;
}

- (id)memberOfDefaultCreditAccountMapsBrandIdentifiersLast30Days:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence objectForKeyedSubscript:v4];
  if (!v5)
  {
    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
    if (prefetchedDefaultCreditAccount)
    {
      double v7 = [(PKAccount *)prefetchedDefaultCreditAccount associatedPassUniqueID];
      long long v8 = +[NSDate dateWithTimeIntervalSinceNow:-2592000.0];
      databaseManager = self->_databaseManager;
      id v10 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
      id v11 = +[NSDate date];
      BOOL v12 = [(PDDatabaseManager *)databaseManager hasAnyTransactionsWithMapsBrandIdentifiers:v10 forPassUniqueIdentifier:v7 startDate:v8 endDate:v11];

      uint64_t v5 = +[NSNumber numberWithBool:v12];
      [(NSMutableDictionary *)self->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence setObject:v5 forKeyedSubscript:v4];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  if ([v5 BOOLValue]) {
    id v13 = v4;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

- (unint64_t)countOfDefaultCreditAccountMapsBrandIdentifiersLast30Days
{
  return (unint64_t)[(NSMutableDictionary *)self->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence count];
}

- (id)enumeratorOfDefaultCreditAccountMapsBrandIdentifiersLast30Days
{
  queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence = self->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence;
  uint64_t v3 = +[NSNumber numberWithBool:1];
  id v4 = [(NSMutableDictionary *)queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence allKeysForObject:v3];
  uint64_t v5 = [v4 objectEnumerator];

  return v5;
}

- (BOOL)defaultCreditAccountIsShared
{
  return [(PKAccount *)self->_prefetchedDefaultCreditAccount isSharedAccount];
}

- (int64_t)defaultCreditAccountAccessLevel
{
  return (int64_t)[(PKAccount *)self->_prefetchedDefaultCreditAccount accessLevel];
}

- (BOOL)defaultCreditAccountIsCoOwner
{
  return [(PKAccount *)self->_prefetchedDefaultCreditAccount isCoOwner];
}

- (int64_t)defaultCreditAccountParticipantUsersCount
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (!prefetchedDefaultCreditAccount || !self->_prefetchedCreditAccountUsers) {
    return 0;
  }
  id v4 = [(PKAccount *)prefetchedDefaultCreditAccount accountIdentifier];
  uint64_t v5 = [(PDUserEvaluationEnvironment *)self _accountUsersForAccountIdentifier:v4 accessLevel:2];
  id v6 = [v5 count];

  return (int64_t)v6;
}

- (BOOL)defaultCreditAccountHasUnderageParticipant
{
  if (!self->_hasQueriedDefaultCreditAccountHasUnderageParticipant)
  {
    prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
    if (prefetchedDefaultCreditAccount)
    {
      if (self->_prefetchedCreditAccountUsers && self->_prefetchedFamilyMembers)
      {
        uint64_t v5 = [(PKAccount *)prefetchedDefaultCreditAccount accountIdentifier];
        [(PDUserEvaluationEnvironment *)self _accountUsersForAccountIdentifier:v5 accessLevel:2];
        long long v14 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        id v6 = (id)objc_claimAutoreleasedReturnValue();
        id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v15;
          while (2)
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v15 != v9) {
                objc_enumerationMutation(v6);
              }
              id v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "altDSID", (void)v14);
              BOOL v12 = [(PDUserEvaluationEnvironment *)self _familyMemberWithAltDSID:v11];
              id v13 = v12;
              if (v12
                && (unint64_t)[v12 age] >= 0xD
                && (unint64_t)[v13 age] <= 0x11)
              {
                self->_defaultCreditAccountHasUnderageParticipant = 1;

                goto LABEL_18;
              }
            }
            id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
            if (v8) {
              continue;
            }
            break;
          }
        }
LABEL_18:

        self->_hasQueriedDefaultCreditAccountHasUnderageParticipant = 1;
      }
    }
  }
  return self->_defaultCreditAccountHasUnderageParticipant;
}

- (NSString)defaultCreditAccountPhysicalAppleCardStatus
{
  unint64_t defaultPhysicalCardStatus = self->_defaultPhysicalCardStatus;
  if (defaultPhysicalCardStatus > 3) {
    return (NSString *)@"ordered";
  }
  else {
    return (NSString *)*(&off_100739C48 + defaultPhysicalCardStatus);
  }
}

- (int64_t)daysSincePhysicalAppleCardShipmentUpdate
{
  return self->_daysSincePhysicalAppleCardShipmentUpdate;
}

- (id)memberOfDefaultCreditAccountActivePromotionIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence objectForKeyedSubscript:v4];
  uint64_t v6 = [(PKAccount *)self->_prefetchedDefaultCreditAccount accountIdentifier];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (!v8)
  {
    uint64_t v9 = [(PDDatabaseManager *)self->_databaseManager accountPromotionForProgramIdentifier:v4 accountIdentifier:v6];
    id v10 = v9;
    if (v9) {
      BOOL v11 = [v9 state] == (id)2;
    }
    else {
      BOOL v11 = 0;
    }
    uint64_t v5 = +[NSNumber numberWithBool:v11];
    [(NSMutableDictionary *)self->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence setObject:v5 forKeyedSubscript:v4];
  }
  if ([v5 BOOLValue]) {
    id v12 = v4;
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (unint64_t)countOfDefaultCreditAccountActivePromotionIdentifiers
{
  return (unint64_t)[(NSMutableDictionary *)self->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence count];
}

- (id)enumeratorOfDefaultCreditAccountActivePromotionIdentifiers
{
  queriedDefaultCreditAccountActivePromotionIdentifiersPresence = self->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence;
  uint64_t v3 = +[NSNumber numberWithBool:1];
  id v4 = [(NSMutableDictionary *)queriedDefaultCreditAccountActivePromotionIdentifiersPresence allKeysForObject:v3];
  uint64_t v5 = [v4 objectEnumerator];

  return v5;
}

- (id)memberOfDefaultCreditAccountActivePromotionIdentifiersExpiringSoon:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence objectForKeyedSubscript:v4];
  uint64_t v6 = [(PKAccount *)self->_prefetchedDefaultCreditAccount accountIdentifier];
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == 0;
  }
  if (!v8)
  {
    uint64_t v9 = [(PDDatabaseManager *)self->_databaseManager accountPromotionForProgramIdentifier:v4 accountIdentifier:v6];
    id v10 = v9;
    if (v9 && [v9 state] == (id)2) {
      id v11 = [v10 expiringSoon];
    }
    else {
      id v11 = 0;
    }
    uint64_t v5 = +[NSNumber numberWithBool:v11];
    [(NSMutableDictionary *)self->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence setObject:v5 forKeyedSubscript:v4];
  }
  if ([v5 BOOLValue]) {
    id v12 = v4;
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (unint64_t)countOfDefaultCreditAccountActivePromotionIdentifiersExpiringSoon
{
  return (unint64_t)[(NSMutableDictionary *)self->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence count];
}

- (id)enumeratorOfDefaultCreditAccountActivePromotionIdentifiersExpiringSoon
{
  queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence = self->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence;
  uint64_t v3 = +[NSNumber numberWithBool:1];
  id v4 = [(NSMutableDictionary *)queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence allKeysForObject:v3];
  uint64_t v5 = [v4 objectEnumerator];

  return v5;
}

- (BOOL)anyCreditAccountStateIsClosed
{
  prefetchedCreditAccounts = self->_prefetchedCreditAccounts;
  if (prefetchedCreditAccounts && !self->_hasQueriedAnyCreditAccountIsClosed)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = prefetchedCreditAccounts;
    id v5 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "state", (void)v10) == (id)4)
          {
            self->_anyCreditAccountIsClosed = 1;
            goto LABEL_13;
          }
        }
        id v6 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    self->_hasQueriedAnyCreditAccountIsClosed = 1;
  }
  return self->_anyCreditAccountIsClosed;
}

- (BOOL)anyCreditAccountStateIsRemoved
{
  prefetchedCreditAccounts = self->_prefetchedCreditAccounts;
  if (prefetchedCreditAccounts && !self->_hasQueriedAnyCreditAccountIsRemoved)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = prefetchedCreditAccounts;
    id v5 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "state", (void)v10) == (id)5)
          {
            self->_anyCreditAccountIsRemoved = 1;
            goto LABEL_13;
          }
        }
        id v6 = [(NSSet *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:

    self->_hasQueriedAnyCreditAccountIsRemoved = 1;
  }
  return self->_anyCreditAccountIsRemoved;
}

- (NSSet)passStyles
{
  passStyles = self->_passStyles;
  if (!passStyles)
  {
    id v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v5 = self->_passStyles;
    self->_passStyles = v4;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [(PDDatabaseManager *)self->_databaseManager passStyles];
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        long long v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = self->_passStyles;
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) integerValue];
          long long v12 = PKPassStyleToString();
          [(NSMutableSet *)v11 addObject:v12];

          long long v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    passStyles = self->_passStyles;
  }
  id v13 = [(NSMutableSet *)passStyles copy];
  return (NSSet *)v13;
}

- (NSSet)unexpiredPassStyles
{
  unexpiredPassStyles = self->_unexpiredPassStyles;
  if (!unexpiredPassStyles)
  {
    id v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v5 = self->_unexpiredPassStyles;
    self->_unexpiredPassStyles = v4;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [(PDDatabaseManager *)self->_databaseManager unexpiredPassStyles];
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        long long v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = self->_unexpiredPassStyles;
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) integerValue];
          long long v12 = PKPassStyleToString();
          [(NSMutableSet *)v11 addObject:v12];

          long long v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    unexpiredPassStyles = self->_unexpiredPassStyles;
  }
  id v13 = [(NSMutableSet *)unexpiredPassStyles copy];
  return (NSSet *)v13;
}

- (NSSet)secureElementCardTypes
{
  cardTypes = self->_cardTypes;
  if (!cardTypes)
  {
    id v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v5 = self->_cardTypes;
    self->_cardTypes = v4;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [(PDDatabaseManager *)self->_databaseManager secureElementCardTypes];
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        long long v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = self->_cardTypes;
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) integerValue];
          long long v12 = PKPaymentCardTypeToString();
          [(NSMutableSet *)v11 addObject:v12];

          long long v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    cardTypes = self->_cardTypes;
  }
  id v13 = [(NSMutableSet *)cardTypes copy];
  return (NSSet *)v13;
}

- (NSSet)unexpiredSecureElementCardTypes
{
  unexpiredCardTypes = self->_unexpiredCardTypes;
  if (!unexpiredCardTypes)
  {
    id v4 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    id v5 = self->_unexpiredCardTypes;
    self->_unexpiredCardTypes = v4;

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = [(PDDatabaseManager *)self->_databaseManager unexpiredSecureElementCardTypes];
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        long long v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = self->_unexpiredCardTypes;
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)v10) integerValue];
          long long v12 = PKPaymentCardTypeToString();
          [(NSMutableSet *)v11 addObject:v12];

          long long v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    unexpiredCardTypes = self->_unexpiredCardTypes;
  }
  id v13 = [(NSMutableSet *)unexpiredCardTypes copy];
  return (NSSet *)v13;
}

- (NSSet)transitNetworksPresent
{
  transitNetworksPresent = self->_transitNetworksPresent;
  if (!transitNetworksPresent)
  {
    id v4 = [(PDDatabaseManager *)self->_databaseManager transitNetworksForPassesMatchingTransitType:0 expired:0];
    id v5 = self->_transitNetworksPresent;
    self->_transitNetworksPresent = v4;

    transitNetworksPresent = self->_transitNetworksPresent;
  }
  return +[NSSet setWithArray:transitNetworksPresent];
}

- (NSSet)transitNetworksPresentAndUnexpired
{
  transitNetworksPresentAndUnexpired = self->_transitNetworksPresentAndUnexpired;
  if (!transitNetworksPresentAndUnexpired)
  {
    id v4 = [(PDDatabaseManager *)self->_databaseManager transitNetworksForPassesMatchingTransitType:0 expired:2];
    id v5 = self->_transitNetworksPresentAndUnexpired;
    self->_transitNetworksPresentAndUnexpired = v4;

    transitNetworksPresentAndUnexpired = self->_transitNetworksPresentAndUnexpired;
  }
  return +[NSSet setWithArray:transitNetworksPresentAndUnexpired];
}

- (id)memberOfMerchantIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_queriedMerchantIdentifierPresence objectForKeyedSubscript:v4];
  if (!v5)
  {
    databaseManager = self->_databaseManager;
    id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
    BOOL v8 = [(PDDatabaseManager *)databaseManager hasAnyTransactionsWithMerchantIdentifiers:v7];

    id v5 = +[NSNumber numberWithBool:v8];
    [(NSMutableDictionary *)self->_queriedMerchantIdentifierPresence setObject:v5 forKeyedSubscript:v4];
  }
  if ([v5 BOOLValue]) {
    id v9 = v4;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)countOfMerchantIdentifiers
{
  return (unint64_t)[(NSMutableDictionary *)self->_queriedMerchantIdentifierPresence count];
}

- (id)enumeratorOfMerchantIdentifiers
{
  queriedMerchantIdentifierPresence = self->_queriedMerchantIdentifierPresence;
  uint64_t v3 = +[NSNumber numberWithBool:1];
  id v4 = [(NSMutableDictionary *)queriedMerchantIdentifierPresence allKeysForObject:v3];
  id v5 = [v4 objectEnumerator];

  return v5;
}

- (id)memberOfMapsIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_queriedMapsIdentifierPresence objectForKeyedSubscript:v4];
  if (!v5)
  {
    databaseManager = self->_databaseManager;
    id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
    BOOL v8 = [(PDDatabaseManager *)databaseManager hasAnyTransactionsWithMapsIdentifiers:v7];

    id v5 = +[NSNumber numberWithBool:v8];
    [(NSMutableDictionary *)self->_queriedMapsIdentifierPresence setObject:v5 forKeyedSubscript:v4];
  }
  if ([v5 BOOLValue]) {
    id v9 = v4;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)countOfMapsIdentifiers
{
  return (unint64_t)[(NSMutableDictionary *)self->_queriedMapsIdentifierPresence count];
}

- (id)enumeratorOfMapsIdentifiers
{
  queriedMapsIdentifierPresence = self->_queriedMapsIdentifierPresence;
  uint64_t v3 = +[NSNumber numberWithBool:1];
  id v4 = [(NSMutableDictionary *)queriedMapsIdentifierPresence allKeysForObject:v3];
  id v5 = [v4 objectEnumerator];

  return v5;
}

- (id)memberOfMapsBrandIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_queriedMapsBrandIdentifierPresence objectForKeyedSubscript:v4];
  if (!v5)
  {
    databaseManager = self->_databaseManager;
    id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);
    BOOL v8 = [(PDDatabaseManager *)databaseManager hasAnyTransactionsWithMapsBrandIdentifiers:v7];

    id v5 = +[NSNumber numberWithBool:v8];
    [(NSMutableDictionary *)self->_queriedMapsBrandIdentifierPresence setObject:v5 forKeyedSubscript:v4];
  }
  if ([v5 BOOLValue]) {
    id v9 = v4;
  }
  else {
    id v9 = 0;
  }

  return v9;
}

- (unint64_t)countOfMapsBrandIdentifiers
{
  return (unint64_t)[(NSMutableDictionary *)self->_queriedMapsBrandIdentifierPresence count];
}

- (id)enumeratorOfMapsBrandIdentifiers
{
  queriedMapsBrandIdentifierPresence = self->_queriedMapsBrandIdentifierPresence;
  uint64_t v3 = +[NSNumber numberWithBool:1];
  id v4 = [(NSMutableDictionary *)queriedMapsBrandIdentifierPresence allKeysForObject:v3];
  id v5 = [v4 objectEnumerator];

  return v5;
}

- (BOOL)hasPaymentTransaction
{
  if (self->_hasQueriedPaymentTransaction) {
    return self->_hasPaymentTransaction;
  }
  BOOL result = [(PDDatabaseManager *)self->_databaseManager hasAnyTransactionsOfType:0];
  self->_hasPaymentTransaction = result;
  self->_hasQueriedPaymentTransaction = 1;
  return result;
}

- (BOOL)hasTransitTransaction
{
  if (self->_hasQueriedTransitTransaction) {
    return self->_hasTransitTransaction;
  }
  BOOL result = [(PDDatabaseManager *)self->_databaseManager hasAnyTransactionsOfType:2];
  self->_hasTransitTransaction = result;
  self->_hasQueriedTransitTransaction = 1;
  return result;
}

- (int64_t)defaultCreditApplicationCount
{
  int64_t result = (int64_t)self->_prefetchedCreditApplications;
  if (result) {
    return (int64_t)[(id)result count];
  }
  return result;
}

- (int64_t)currentDefaultCreditApplictionDaysSinceLastUpdated
{
  if (!self->_prefetchedCurrentCreditApplication) {
    return -1;
  }
  uint64_t v3 = +[NSDate date];
  id v4 = [(PKFeatureApplication *)self->_prefetchedCurrentCreditApplication lastUpdated];
  [v3 timeIntervalSinceDate:v4];
  double v6 = v5;

  return vcvtmd_s64_f64(v6 / 86400.0);
}

- (NSString)currentDefaultCreditApplicationState
{
  id v2 = [(PKFeatureApplication *)self->_prefetchedCurrentCreditApplication applicationState];
  return (NSString *)_PKFeatureApplicationStateToString(v2);
}

- (BOOL)hasPeerPaymentAccount
{
  return self->_prefetchedPeerPaymentAccount != 0;
}

- (BOOL)hasPeerPaymentPassProvisioned
{
  if (!self->_hasQueriedPeerPaymentPassProvisioned)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      databaseManager = self->_databaseManager;
      double v5 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedPassUniqueID];
      double v6 = [(PDDatabaseManager *)databaseManager passWithUniqueIdentifier:v5];
      id v7 = [v6 paymentPass];

      BOOL v8 = [v7 devicePrimaryPaymentApplication];
      self->_peerPaymentPassProvisioned = v8 != 0;

      self->_hasQueriedPeerPaymentPassProvisioned = 1;
    }
  }
  return self->_peerPaymentPassProvisioned;
}

- (int64_t)peerPaymentAccountState
{
  int64_t result = (int64_t)self->_prefetchedPeerPaymentAccount;
  if (result) {
    return (int64_t)[(id)result state];
  }
  return result;
}

- (int64_t)peerPaymentAccountStage
{
  int64_t result = (int64_t)self->_prefetchedPeerPaymentAccount;
  if (result) {
    return (int64_t)[(id)result stage];
  }
  return result;
}

- (int64_t)peerPaymentAccountStateReason
{
  int64_t result = (int64_t)self->_prefetchedPeerPaymentAccount;
  if (result) {
    return (int64_t)[(id)result stateReason];
  }
  return result;
}

- (BOOL)peerPaymentAccountHasTransaction
{
  if (!self->_hasQueriedPeerPaymentTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedPassUniqueID];
      double v5 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v4];
      double v6 = [(PDDatabaseManager *)self->_databaseManager transactionsForTransactionSourceIdentifiers:v5 withTransactionSource:0 withBackingData:0 limit:1];
      self->_hasPeerPaymentTransaction = [v6 count] != 0;
      self->_hasQueriedPeerPaymentTransaction = 1;
    }
  }
  return self->_hasPeerPaymentTransaction;
}

- (BOOL)peerPaymentAccountHasContactlessTransaction
{
  if (!self->_hasQueriedPeerPaymentContaclessTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedPassUniqueID];
      double v5 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v4];
      self->_hasPeerPaymentContactlessTransaction = [(PDDatabaseManager *)self->_databaseManager hasPaymentTransactionForTransactionSourceIdentifiers:v5 withTransactionSource:1];
      self->_hasQueriedPeerPaymentContaclessTransaction = 1;
    }
  }
  return self->_hasPeerPaymentContactlessTransaction;
}

- (BOOL)peerPaymentHasOnlinePurchaseTransaction
{
  if (!self->_hasQueriedPeerPaymentOnlinePurchaseTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedPassUniqueID];
      double v5 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v4];
      unsigned __int8 v6 = [(PDDatabaseManager *)self->_databaseManager hasPaymentTransactionForTransactionSourceIdentifiers:v5 withTransactionSource:3];
      BOOL v7 = 1;
      if ((v6 & 1) == 0) {
        BOOL v7 = [(PDDatabaseManager *)self->_databaseManager hasPaymentTransactionForTransactionSourceIdentifiers:v5 withTransactionSource:2];
      }
      self->_hasPeerPaymentOnlinePurchaseTransaction = v7;
      self->_hasQueriedPeerPaymentOnlinePurchaseTransaction = 1;
    }
  }
  return self->_hasPeerPaymentOnlinePurchaseTransaction;
}

- (int64_t)daysSinceLastPeerPaymentTransaction
{
  if (!self->_hasQueriedPeerPaymentDaysSinceLastTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedPassUniqueID];
      double v5 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v4];
      unsigned __int8 v6 = [(PDDatabaseManager *)self->_databaseManager transactionsForTransactionSourceIdentifiers:v5 withTransactionSource:0 withBackingData:0 limit:1];
      BOOL v7 = [v6 anyObject];

      if (v7)
      {
        BOOL v8 = +[NSDate date];
        id v9 = [v7 transactionDate];
        [v8 timeIntervalSinceDate:v9];
        double v11 = v10;

        self->_daysSinceLastPeerPaymentTransaction = vcvtmd_s64_f64(v11 / 86400.0);
      }
      self->_hasQueriedPeerPaymentDaysSinceLastTransaction = 1;
    }
  }
  return self->_daysSinceLastPeerPaymentTransaction;
}

- (int64_t)peerPaymentDaysSinceLastP2PTransaction
{
  if (!self->_hasQueriedPeerPaymentDaysSinceLastP2PTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedPassUniqueID];
      double v5 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v4];
      databaseManager = self->_databaseManager;
      BOOL v7 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount transactionSourceIdentifier];
      BOOL v8 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount createdDate];
      id v9 = +[NSDate date];
      double v10 = [(PDDatabaseManager *)databaseManager peerPaymentCounterpartHandlesForTransactionSourceIdentifier:v7 startDate:v8 endDate:v9];
      double v11 = +[NSSet setWithArray:v10];

      if (![v11 count])
      {
LABEL_16:
        self->_hasQueriedPeerPaymentDaysSinceLastP2PTransaction = 1;

        return self->_daysSinceLastPeerPaymentP2PTransaction;
      }
      long long v12 = [(PDDatabaseManager *)self->_databaseManager transactionsForTransactionSourceIdentifiers:v5 withPeerPaymentCounterpartHandles:v11 forPeerPaymentSubtype:1 withTransactionSource:0 withBackingData:0 limit:1];
      id v13 = [v12 anyObject];

      long long v14 = [(PDDatabaseManager *)self->_databaseManager transactionsForTransactionSourceIdentifiers:v5 withPeerPaymentCounterpartHandles:v11 forPeerPaymentSubtype:2 withTransactionSource:0 withBackingData:0 limit:1];
      long long v15 = [v14 anyObject];

      if (v13 && v15)
      {
        long long v16 = +[NSDate date];
        long long v17 = [v13 transactionDate];
        [v16 timeIntervalSinceDate:v17];
        double v19 = v18;

        int64_t v20 = vcvtmd_s64_f64(v19 / 86400.0);
        long long v21 = +[NSDate date];
        long long v22 = [v15 transactionDate];
        [v21 timeIntervalSinceDate:v22];
        double v24 = v23;

        int64_t v25 = vcvtmd_s64_f64(v24 / 86400.0);
        if (v20 < v25) {
          int64_t v25 = v20;
        }
      }
      else
      {
        if (v13)
        {
          v26 = +[NSDate date];
          v27 = v13;
        }
        else
        {
          if (!v15)
          {
LABEL_15:

            goto LABEL_16;
          }
          v26 = +[NSDate date];
          v27 = v15;
        }
        v28 = [v27 transactionDate];
        [v26 timeIntervalSinceDate:v28];
        double v30 = v29;

        int64_t v25 = vcvtmd_s64_f64(v30 / 86400.0);
      }
      self->_daysSinceLastPeerPaymentP2PTransaction = v25;
      goto LABEL_15;
    }
  }
  return self->_daysSinceLastPeerPaymentP2PTransaction;
}

- (int64_t)peerPaymentDaysSinceLastP2PTransactionToAnyParticipant
{
  if (!self->_hasQueriedPeerPaymentDaysSinceLastP2PTransactionToAnyParticipant)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      if (self->_prefetchedFamilyMembers)
      {
        v33 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedPassUniqueID];
        v32 = -[PDDatabaseManager transactionSourceIdentifiersForPassUniqueIdentifier:](self->_databaseManager, "transactionSourceIdentifiersForPassUniqueIdentifier:");
        id v5 = objc_alloc_init((Class)NSMutableSet);
        long long v38 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        unsigned __int8 v6 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount associatedAccountInformation];
        BOOL v7 = [v6 associatedAccounts];

        id v8 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v39;
          do
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v39 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              if (objc_msgSend(v12, "role", v32) == (id)1)
              {
                id v13 = [v12 altDSID];
                [v5 addObject:v13];
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v38 objects:v43 count:16];
          }
          while (v9);
        }

        id v14 = objc_alloc_init((Class)NSMutableSet);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v15 = self->_prefetchedFamilyMembers;
        id v16 = [(NSArray *)v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v16)
        {
          id v17 = v16;
          uint64_t v18 = *(void *)v35;
          do
          {
            for (j = 0; j != v17; j = (char *)j + 1)
            {
              if (*(void *)v35 != v18) {
                objc_enumerationMutation(v15);
              }
              int64_t v20 = *(void **)(*((void *)&v34 + 1) + 8 * (void)j);
              if ((objc_msgSend(v20, "isMe", v32) & 1) == 0)
              {
                long long v21 = [v20 altDSID];
                unsigned int v22 = [v5 containsObject:v21];

                if (v22)
                {
                  double v23 = [v20 appleID];
                  [v14 addObject:v23];

                  double v24 = [v20 appleIDAliases];
                  int64_t v25 = [v24 allObjects];
                  [v14 addObjectsFromArray:v25];
                }
              }
            }
            id v17 = [(NSArray *)v15 countByEnumeratingWithState:&v34 objects:v42 count:16];
          }
          while (v17);
        }

        if ([v14 count])
        {
          v26 = [(PDDatabaseManager *)self->_databaseManager transactionsForTransactionSourceIdentifiers:v32 withPeerPaymentCounterpartHandles:v14 forPeerPaymentSubtype:1 withTransactionSource:0 withBackingData:0 limit:1];
          v27 = [v26 anyObject];

          if (v27)
          {
            v28 = +[NSDate date];
            double v29 = [v27 transactionDate];
            [v28 timeIntervalSinceDate:v29];
            double v31 = v30;

            self->_peerPaymentDaysSinceLastP2PTransactionToAnyParticipant = vcvtmd_s64_f64(v31 / 86400.0);
          }
        }
        self->_hasQueriedPeerPaymentDaysSinceLastP2PTransactionToAnyParticipant = 1;
      }
    }
  }
  return self->_peerPaymentDaysSinceLastP2PTransactionToAnyParticipant;
}

- (BOOL)peerPaymentAccountHasBalance
{
  prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
  if (!prefetchedPeerPaymentAccount) {
    return 0;
  }
  uint64_t v3 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount currentBalance];
  id v4 = [v3 amount];

  id v5 = +[NSDecimalNumber zero];
  BOOL v6 = [v4 compare:v5] == (id)1;

  return v6;
}

- (int64_t)peerPaymentAccountBalanceBase
{
  prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
  if (!prefetchedPeerPaymentAccount) {
    return 0;
  }
  uint64_t v3 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount currentBalance];
  id v4 = [v3 currency];
  unsigned int v5 = [v4 isEqualToString:@"USD"];

  if (v5)
  {
    BOOL v6 = [v3 amountByConvertingToSmallestCommonCurrencyUnit];
    uint64_t v7 = (uint64_t)[v6 longLongValue];

    uint64_t v8 = 50;
    uint64_t v9 = 20;
    if (v7 <= 1999) {
      uint64_t v9 = 0;
    }
    if (v7 <= 4999) {
      uint64_t v8 = v9;
    }
    if (v7 <= 9999) {
      int64_t v10 = v8;
    }
    else {
      int64_t v10 = 100;
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (BOOL)peerPaymentHasP2PTransaction
{
  if (!self->_hasQueriedPeerPaymentHasP2PTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedPassUniqueID];
      unsigned int v5 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v4];
      databaseManager = self->_databaseManager;
      uint64_t v7 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount createdDate];
      uint64_t v8 = +[NSDate date];
      uint64_t v9 = [(PDDatabaseManager *)databaseManager peerPaymentTransactionServiceIdentifiersForTransactionSourceIdentifiers:v5 withPeerPaymentSubtype:1 withTransactionSource:0 withBackingData:0 startDate:v7 endDate:v8];
      if ([v9 count])
      {
        self->_hasPeerPaymentP2PTransaction = 1;
      }
      else
      {
        int64_t v10 = self->_databaseManager;
        double v11 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount createdDate];
        long long v12 = +[NSDate date];
        id v13 = [(PDDatabaseManager *)v10 peerPaymentTransactionServiceIdentifiersForTransactionSourceIdentifiers:v5 withPeerPaymentSubtype:2 withTransactionSource:0 withBackingData:0 startDate:v11 endDate:v12];
        self->_hasPeerPaymentP2PTransaction = [v13 count] != 0;
      }
      self->_hasQueriedPeerPaymentHasP2PTransaction = 1;
    }
  }
  return self->_hasPeerPaymentP2PTransaction;
}

- (BOOL)peerPaymentHasAutoReloadEnabled
{
  if (!self->_hasQueriedPeerPaymentHasAutoReloadEnabled)
  {
    uint64_t v3 = [(PDDatabaseManager *)self->_databaseManager peerPaymentRecurringPaymentsWithType:3];
    self->_hasPeerPaymentAutoReloadEnabled = [v3 count] != 0;
    self->_hasQueriedPeerPaymentHasAutoReloadEnabled = 1;
  }
  return self->_hasPeerPaymentAutoReloadEnabled;
}

- (BOOL)peerPaymentHasSetupRecurringP2PPayment
{
  if (!self->_hasQueriedPeerPaymentHasSetupRecurringP2PPayment)
  {
    [(PDDatabaseManager *)self->_databaseManager peerPaymentRecurringPaymentsWithType:1];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v3);
          }
          if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "sentByMe", (void)v8))
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
        id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    self->_hasPeerPaymentSetupRecurringP2PPayment = (char)v4;
    self->_hasQueriedPeerPaymentHasSetupRecurringP2PPayment = 1;
  }
  return self->_hasPeerPaymentSetupRecurringP2PPayment;
}

- (BOOL)peerPaymentHasSetupRecurringP2PPaymentForAnyParticipant
{
  if (!self->_hasQueriedPeerPaymentHasSetupRecurringP2PPaymentForAnyParticipant && self->_prefetchedPeerPaymentAccount)
  {
    id v3 = objc_alloc_init((Class)NSMutableSet);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v4 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount associatedAccountInformation];
    uint64_t v5 = [v4 associatedAccounts];

    id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if ([v10 role] == (id)1)
          {
            long long v11 = [v10 altDSID];
            [v3 addObject:v11];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v7);
    }

    long long v12 = [(PDDatabaseManager *)self->_databaseManager peerPaymentRecurringPaymentsWithType:1];
    self->_hasPeerPaymentSetupRecurringP2PPaymentForAnyParticipant = 0;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v13 = v12;
    id v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v23;
      do
      {
        for (j = 0; j != v15; j = (char *)j + 1)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
          double v19 = objc_msgSend(v18, "recipientAltDSID", (void)v22);
          if ([v3 containsObject:v19])
          {
            unsigned int v20 = [v18 sentByMe];

            if (v20)
            {
              self->_hasPeerPaymentSetupRecurringP2PPaymentForAnyParticipant = 1;
              goto LABEL_23;
            }
          }
          else
          {
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v15);
    }
LABEL_23:

    self->_hasQueriedPeerPaymentHasSetupRecurringP2PPaymentForAnyParticipant = 1;
  }
  return self->_hasPeerPaymentSetupRecurringP2PPaymentForAnyParticipant;
}

- (int64_t)peerPaymentDaysSinceLastPurchaseTransaction
{
  if (!self->_hasQueriedPeerPaymentDaysSinceLastPurchaseTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedPassUniqueID];
      uint64_t v5 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v4];
      databaseManager = self->_databaseManager;
      id v7 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount createdDate];
      uint64_t v8 = +[NSDate date];
      long long v9 = [(PDDatabaseManager *)databaseManager transactionsForTransactionSourceIdentifiers:v5 withTransactionType:0 withTransactionSource:0 withBackingData:0 startDate:v7 endDate:v8 limit:1];
      long long v10 = [v9 anyObject];

      if (v10)
      {
        long long v11 = +[NSDate date];
        long long v12 = [v10 transactionDate];
        [v11 timeIntervalSinceDate:v12];
        double v14 = v13;

        self->_peerPaymentDaysSinceLastPurchaseTransaction = vcvtmd_s64_f64(v14 / 86400.0);
      }
      self->_hasQueriedPeerPaymentDaysSinceLastPurchaseTransaction = 1;
    }
  }
  return self->_peerPaymentDaysSinceLastPurchaseTransaction;
}

- (BOOL)peerPaymentHasSentP2PPayment
{
  if (!self->_hasQueriedPeerPaymentHasSentP2PPayment)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedPassUniqueID];
      uint64_t v5 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v4];
      databaseManager = self->_databaseManager;
      id v7 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount createdDate];
      uint64_t v8 = +[NSDate date];
      long long v9 = [(PDDatabaseManager *)databaseManager peerPaymentTransactionServiceIdentifiersForTransactionSourceIdentifiers:v5 withPeerPaymentSubtype:1 withTransactionSource:0 withBackingData:0 startDate:v7 endDate:v8];
      self->_hasSentPeerPaymentP2PPayment = [v9 count] != 0;

      self->_hasQueriedPeerPaymentHasSentP2PPayment = 1;
    }
  }
  return self->_hasSentPeerPaymentP2PPayment;
}

- (BOOL)peerPaymentHasReceivedP2PPayment
{
  if (!self->_hasQueriedPeerPaymentHasReceivedP2PPayment)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedPassUniqueID];
      uint64_t v5 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v4];
      databaseManager = self->_databaseManager;
      id v7 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount createdDate];
      uint64_t v8 = +[NSDate date];
      long long v9 = [(PDDatabaseManager *)databaseManager peerPaymentTransactionServiceIdentifiersForTransactionSourceIdentifiers:v5 withPeerPaymentSubtype:2 withTransactionSource:0 withBackingData:0 startDate:v7 endDate:v8];
      self->_hasReceivedPeerPaymentP2PPayment = [v9 count] != 0;

      self->_hasQueriedPeerPaymentHasReceivedP2PPayment = 1;
    }
  }
  return self->_hasReceivedPeerPaymentP2PPayment;
}

- (BOOL)peerPaymentHasSentDeviceTapTransaction
{
  if (!self->_hasQueriedPeerPaymentHasSentDeviceTapTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedPassUniqueID];
      uint64_t v5 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v4];
      if ([v5 count])
      {
        id v6 = objc_alloc_init((Class)PKPaymentTransactionRequest);
        [v6 setTransactionSourceIdentifiers:v5];
        [v6 setPeerPaymentSubType:1];
        [v6 setPeerPaymentPaymentMode:2];
        id v7 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount createdDate];
        [v6 setStartDate:v7];

        uint64_t v8 = +[NSDate date];
        [v6 setEndDate:v8];

        self->_hasSentPeerPaymentDeviceTapTransaction = (uint64_t)[(PDDatabaseManager *)self->_databaseManager transactionsCountForRequest:v6] > 0;
        self->_hasQueriedPeerPaymentHasSentDeviceTapTransaction = 1;
      }
    }
  }
  return self->_hasSentPeerPaymentDeviceTapTransaction;
}

- (BOOL)peerPaymentHasReceivedDeviceTapTransactions
{
  if (!self->_hasQueriedPeerPaymentHasReceivedDeviceTapTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedPassUniqueID];
      uint64_t v5 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v4];
      if ([v5 count])
      {
        id v6 = objc_alloc_init((Class)PKPaymentTransactionRequest);
        [v6 setTransactionSourceIdentifiers:v5];
        [v6 setPeerPaymentSubType:2];
        [v6 setPeerPaymentPaymentMode:2];
        id v7 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount createdDate];
        [v6 setStartDate:v7];

        uint64_t v8 = +[NSDate date];
        [v6 setEndDate:v8];

        self->_hasReceivedPeerPaymentDeviceTapTransaction = (uint64_t)[(PDDatabaseManager *)self->_databaseManager transactionsCountForRequest:v6] > 0;
        self->_hasQueriedPeerPaymentHasReceivedDeviceTapTransaction = 1;
      }
    }
  }
  return self->_hasReceivedPeerPaymentDeviceTapTransaction;
}

- (int64_t)peerPaymentNumberOfDeviceTapTransactions
{
  id v3 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount associatedPassUniqueID];
  id v4 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v3];
  if ([v4 count])
  {
    id v5 = objc_alloc_init((Class)PKPaymentTransactionRequest);
    [v5 setTransactionSourceIdentifiers:v4];
    [v5 setPeerPaymentPaymentMode:2];
    uint64_t v6 = [(PDDatabaseManager *)self->_databaseManager transactionsCountForRequest:v5];
    uint64_t v7 = 3;
    uint64_t v8 = 2;
    if (v6 <= 2) {
      uint64_t v8 = v6 > 0;
    }
    if (v6 <= 5) {
      uint64_t v7 = v8;
    }
    if (v6 <= 9) {
      int64_t v9 = v7;
    }
    else {
      int64_t v9 = 4;
    }
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (int64_t)daysSinceLastDeviceTapSendTransaction
{
  if (!self->_hasQueriedPeerPaymentDaysSinceLastDeviceTapSendTransaction)
  {
    prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
    if (prefetchedPeerPaymentAccount)
    {
      id v4 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedPassUniqueID];
      id v5 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v4];
      id v6 = objc_alloc_init((Class)PKPaymentTransactionRequest);
      [v6 setTransactionSourceIdentifiers:v5];
      [v6 setPeerPaymentSubType:1];
      [v6 setPeerPaymentPaymentMode:2];
      uint64_t v7 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount createdDate];
      [v6 setStartDate:v7];

      uint64_t v8 = +[NSDate date];
      [v6 setEndDate:v8];

      [v6 setLimit:1];
      int64_t v9 = [(PDDatabaseManager *)self->_databaseManager transactionsForRequest:v6];
      long long v10 = [v9 firstObject];

      if (v10)
      {
        long long v11 = +[NSDate date];
        long long v12 = [v10 transactionDate];
        [v11 timeIntervalSinceDate:v12];
        double v14 = v13;

        self->_peerPaymentDaysSinceLastDeviceTapSendTransaction = vcvtmd_s64_f64(v14 / 86400.0);
      }
      self->_hasQueriedPeerPaymentDaysSinceLastDeviceTapSendTransaction = 1;
    }
  }
  return self->_peerPaymentDaysSinceLastDeviceTapSendTransaction;
}

- (int64_t)peerPaymentFamilyParticipantAccounts
{
  prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
  if (!prefetchedPeerPaymentAccount) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedAccountInformation];
  id v4 = [v3 associatedAccounts];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    int64_t v8 = 1;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      if ([*(id *)(*((void *)&v11 + 1) + 8 * v9) role] == (id)1) {
        break;
      }
      if (v6 == (id)++v9)
      {
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_4;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    int64_t v8 = 0;
  }

  return v8;
}

- (unint64_t)peerPaymentAccountRole
{
  unint64_t result = (unint64_t)self->_prefetchedPeerPaymentAccount;
  if (result) {
    return (unint64_t)[(id)result role];
  }
  return result;
}

- (int64_t)peerPaymentAccountDaysSinceCreatedDate
{
  uint64_t v3 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount createdDate];
  id v4 = (void *)v3;
  if (self->_prefetchedPeerPaymentAccount) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    int64_t v9 = -1;
  }
  else
  {
    id v6 = +[NSCalendar currentCalendar];
    uint64_t v7 = +[NSDate date];
    int64_t v8 = [v6 components:16 fromDate:v4 toDate:v7 options:0];
    int64_t v9 = (int64_t)[v8 day];
  }
  return v9;
}

- (int64_t)peerPaymentAccountDaysSinceIdentifiedDate
{
  uint64_t v3 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount identifiedDate];
  id v4 = (void *)v3;
  if (self->_prefetchedPeerPaymentAccount) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    int64_t v9 = -1;
  }
  else
  {
    id v6 = +[NSDate date];
    [v6 timeIntervalSinceDate:v4];
    double v8 = v7;

    int64_t v9 = vcvtmd_s64_f64(v8 / 86400.0);
  }

  return v9;
}

- (int64_t)daysSinceParticipantPeerPaymentAccountIdentifiedDate
{
  prefetchedPeerPaymentAccount = self->_prefetchedPeerPaymentAccount;
  if (prefetchedPeerPaymentAccount)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v3 = [(PKPeerPaymentAccount *)prefetchedPeerPaymentAccount associatedAccountInformation];
    id v4 = [v3 associatedAccounts];

    id v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (!v5)
    {
      int64_t v17 = -1;
      goto LABEL_18;
    }
    id v6 = v5;
    double v7 = 0;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if ([v10 role] == (id)1)
        {
          long long v11 = [v10 identifiedDate];
          long long v12 = v11;
          if (!v7 || [v11 compare:v7] == (id)1)
          {
            id v13 = v12;

            double v7 = v13;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);

    if (v7)
    {
      long long v14 = +[NSDate date];
      [v14 timeIntervalSinceDate:v7];
      double v16 = v15;

      int64_t v17 = vcvtmd_s64_f64(v16 / 86400.0);
      id v4 = v7;
LABEL_18:

      return v17;
    }
  }
  return -1;
}

- (BOOL)peerPaymentAccountHasSentMoneyToAnyParticipant
{
  if (self->_hasQueriedPeerPaymentHasSentMoneyToAnyParticipant) {
    return self->_hasSentMoneyToAnyParticipant;
  }
  if (!self->_prefetchedPeerPaymentAccount) {
    return self->_hasSentMoneyToAnyParticipant;
  }
  prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
  if (!prefetchedFamilyMembers) {
    return self->_hasSentMoneyToAnyParticipant;
  }
  self->_hasQueriedPeerPaymentHasSentMoneyToAnyParticipant = 1;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v5 = prefetchedFamilyMembers;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v32;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v5);
        }
        int64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if ([v9 isMe])
        {
          id v10 = objc_alloc((Class)NSMutableSet);
          long long v11 = [v9 appleIDAliases];
          id v6 = [v10 initWithSet:v11];

          long long v12 = [v9 appleID];
          [v6 addObject:v12];

          goto LABEL_15;
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  if ([v6 count])
  {
    long long v26 = v6;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = [(PKPeerPaymentAccount *)self->_prefetchedPeerPaymentAccount associatedAccountInformation];
    long long v14 = [v13 associatedAccounts];

    id v15 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v28;
      while (2)
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          long long v19 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
          if ([v19 role] == (id)1)
          {
            databaseManager = self->_databaseManager;
            long long v21 = [v19 transactionSourceIdentifier];
            long long v22 = +[NSSet setWithObject:v21];
            long long v23 = [v19 createdDate];
            long long v24 = +[NSDate date];
            unint64_t v25 = [(PDDatabaseManager *)databaseManager transactionsCountForTransactionSourceIdentifiers:v22 withPeerPaymentCounterpartHandles:v26 forPeerPaymentSubtype:2 startDate:v23 endDate:v24];

            if (v25)
            {
              self->_hasSentMoneyToAnyParticipant = 1;
              goto LABEL_28;
            }
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_28:

    return self->_hasSentMoneyToAnyParticipant;
  }

  return 0;
}

- (BOOL)familyCircleFamilyOrganizer
{
  if (!self->_hasQueriedFamilyCircleFamilyOrganizer)
  {
    prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
    if (prefetchedFamilyMembers)
    {
      long long v13 = 0u;
      long long v14 = 0u;
      long long v11 = 0u;
      long long v12 = 0u;
      id v4 = prefetchedFamilyMembers;
      id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v12;
LABEL_5:
        uint64_t v7 = 0;
        while (1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * v7);
          if (objc_msgSend(v8, "isMe", (void)v11)) {
            break;
          }
          if (v5 == (id)++v7)
          {
            id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
            if (v5) {
              goto LABEL_5;
            }
            goto LABEL_14;
          }
        }
        int64_t v9 = v8;

        if (v9)
        {
          LOBYTE(v5) = [(NSArray *)v9 isOrganizer];
          id v4 = v9;
          goto LABEL_14;
        }
        LOBYTE(v5) = 0;
      }
      else
      {
LABEL_14:
      }
      self->_familyCircleFamilyOrganizer = (char)v5;
      self->_hasQueriedFamilyCircleFamilyOrganizer = 1;
    }
  }
  return self->_familyCircleFamilyOrganizer;
}

- (BOOL)familyCircleParent
{
  if (!self->_hasQueriedFamilyCircleParent)
  {
    prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
    if (prefetchedFamilyMembers)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v4 = prefetchedFamilyMembers;
      id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v14;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v14 != v7) {
              objc_enumerationMutation(v4);
            }
            int64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
            if (objc_msgSend(v9, "isMe", (void)v13))
            {
              id v11 = v9;

              self->_hasQueriedFamilyCircleParent = 1;
              if (v11)
              {
                unsigned __int8 v10 = [v11 isParent];
              }
              else
              {
                unsigned __int8 v10 = 0;
              }
              goto LABEL_15;
            }
          }
          id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }

      unsigned __int8 v10 = 0;
      self->_hasQueriedFamilyCircleParent = 1;
LABEL_15:
      self->_familyCircleParent = v10;
    }
  }
  return self->_familyCircleParent;
}

- (BOOL)familyCircleHasFamily
{
  if (!self->_hasQueriedFamilyCircleHasFamily)
  {
    prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
    if (prefetchedFamilyMembers)
    {
      self->_familyCircleHasFamily = [(NSArray *)prefetchedFamilyMembers count] != 0;
      self->_hasQueriedFamilyCircleHasFamily = 1;
    }
  }
  return self->_familyCircleHasFamily;
}

- (int64_t)familyCircleCurrentUserAge
{
  if (!self->_hasQueriedFamilyCircleCurrentUserAge)
  {
    prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
    if (prefetchedFamilyMembers)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v4 = prefetchedFamilyMembers;
      id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v5)
      {
        uint64_t v6 = *(void *)v17;
        while (2)
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v17 != v6) {
              objc_enumerationMutation(v4);
            }
            uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            if (objc_msgSend(v8, "isMe", (void)v16))
            {
              id v5 = v8;
              goto LABEL_13;
            }
          }
          id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
LABEL_13:

      self->_hasQueriedFamilyCircleCurrentUserAge = 1;
      id v9 = [v5 age];
      if (!v9)
      {
        unsigned __int8 v10 = [v5 dateOfBirth];
        id v11 = PKLogFacilityTypeGetObject();
        BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (v10)
        {
          if (v12)
          {
            *(_DWORD *)buf = 138412290;
            long long v21 = v10;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "The current users age is zero. Trying to figure out age from date of birth %@", buf, 0xCu);
          }

          id v11 = +[NSCalendar currentCalendar];
          long long v13 = +[NSDate date];
          long long v14 = [v11 components:4 fromDate:v10 toDate:v13 options:0];
          id v9 = [v14 year];
        }
        else
        {
          if (v12)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "The current users age is zero and there is no date of birth defined", buf, 2u);
          }
          id v9 = 0;
        }
      }
      self->_familyCircleCurrentUserAge = (int64_t)v9;
    }
  }
  return self->_familyCircleCurrentUserAge;
}

- (int64_t)familyCircleMembersUnderAge
{
  if (!self->_hasQueriedFamilyCircleMembersUnderAge)
  {
    prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
    if (prefetchedFamilyMembers)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v4 = prefetchedFamilyMembers;
      id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        id v6 = v5;
        int64_t v7 = 0;
        uint64_t v8 = *(void *)v13;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v13 != v8) {
              objc_enumerationMutation(v4);
            }
            unsigned __int8 v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            if ((objc_msgSend(v10, "isMe", (void)v12) & 1) == 0
              && (unint64_t)[v10 age] < 0x12)
            {
              ++v7;
            }
          }
          id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v6);
      }
      else
      {
        int64_t v7 = 0;
      }

      self->_familyCircleMembersUnderAge = v7;
      self->_hasQueriedFamilyCircleMembersUnderAge = 1;
    }
  }
  return self->_familyCircleMembersUnderAge;
}

- (int64_t)familyCircleMembersCount
{
  if (!self->_hasQueriedfamilyCircleMembersCount)
  {
    prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
    if (prefetchedFamilyMembers)
    {
      self->_familyCircleMembersCount = [(NSArray *)prefetchedFamilyMembers count];
      self->_hasQueriedfamilyCircleMembersCount = 1;
    }
  }
  return self->_familyCircleMembersCount;
}

- (int64_t)familyCircleDaysSinceNewestJoinedDate
{
  prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
  if (prefetchedFamilyMembers && !self->_hasQueriedFamilyCircleDaysSinceNewestJoinedDate)
  {
    id v4 = [(NSArray *)prefetchedFamilyMembers pk_arrayByApplyingBlock:&stru_1007398C8];
    id v5 = [v4 sortedArrayUsingSelector:"compare:"];

    id v6 = [v5 lastObject];
    int64_t v7 = +[NSCalendar currentCalendar];
    uint64_t v8 = +[NSDate date];
    id v9 = [v7 components:16 fromDate:v6 toDate:v8 options:0];
    self->_familyCircleDaysSinceNewestJoinedDate = (int64_t)[v9 day];

    self->_hasQueriedFamilyCircleDaysSinceNewestJoinedDate = 1;
  }
  return self->_familyCircleDaysSinceNewestJoinedDate;
}

- (int64_t)familyCircleMinimumMemberAge
{
  if (!self->_hasQueriedFamilyCircleMinimumMemberAge)
  {
    prefetchedFamilyMembers = self->_prefetchedFamilyMembers;
    if (prefetchedFamilyMembers)
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v4 = prefetchedFamilyMembers;
      id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)v13;
        unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            unsigned __int8 v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
            if (objc_msgSend(v10, "age", (void)v12) && (unint64_t)objc_msgSend(v10, "age") < v8) {
              unint64_t v8 = (unint64_t)[v10 age];
            }
          }
          id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
        }
        while (v6);
      }
      else
      {
        unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      }

      self->_familyCircleMinimumMemberAge = v8;
      self->_hasQueriedFamilyCircleMinimumMemberAge = 1;
    }
  }
  return self->_familyCircleMinimumMemberAge;
}

- (int64_t)familyCircleAgeCategory
{
  if (self->_prefetchedFamilyMemberType) {
    return -1;
  }
  else {
    return 0;
  }
}

- (id)discoveryItemStatus
{
  discoveryItemStatus = self->_discoveryItemStatus;
  if (!discoveryItemStatus)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v5 = self->_discoveryItemStatus;
    self->_discoveryItemStatus = v4;

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [(PDDatabaseManager *)self->_databaseManager discoveryItems];
    id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          long long v12 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v11 status]);
          long long v13 = self->_discoveryItemStatus;
          long long v14 = [v11 identifier];
          [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];
        }
        id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    discoveryItemStatus = self->_discoveryItemStatus;
  }
  id v15 = [(NSMutableDictionary *)discoveryItemStatus copy];
  return v15;
}

- (NSSet)discoveryItemsWithActiveStatus
{
  uint64_t v3 = +[NSNumber numberWithInt:2];
  id v4 = [(PDUserEvaluationEnvironment *)self discoveryItemStatus];
  id v5 = [v4 allKeysForObject:v3];
  id v6 = +[NSSet setWithArray:v5];

  return (NSSet *)v6;
}

- (NSSet)discoveryItemsWithActionedStatus
{
  uint64_t v3 = +[NSNumber numberWithInt:3];
  id v4 = [(PDUserEvaluationEnvironment *)self discoveryItemStatus];
  id v5 = [v4 allKeysForObject:v3];
  id v6 = +[NSSet setWithArray:v5];

  return (NSSet *)v6;
}

- (NSSet)discoveryItemsWithDismissedStatus
{
  uint64_t v3 = +[NSNumber numberWithInt:4];
  id v4 = [(PDUserEvaluationEnvironment *)self discoveryItemStatus];
  id v5 = [v4 allKeysForObject:v3];
  id v6 = +[NSSet setWithArray:v5];

  return (NSSet *)v6;
}

- (NSSet)discoveryItemsWithWaitingForTriggerStatus
{
  uint64_t v3 = +[NSNumber numberWithInt:5];
  id v4 = [(PDUserEvaluationEnvironment *)self discoveryItemStatus];
  id v5 = [v4 allKeysForObject:v3];
  id v6 = +[NSSet setWithArray:v5];

  return (NSSet *)v6;
}

- (NSSet)discoveryItemsExpanded
{
  discoveryItemsExpanded = self->_discoveryItemsExpanded;
  if (!discoveryItemsExpanded)
  {
    id v4 = [(PDDiscoveryManager *)self->_discoveryManager identifiersOfTappedDiscoveryItems];
    id v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = (NSSet *)objc_alloc_init((Class)NSSet);
    }
    id v7 = self->_discoveryItemsExpanded;
    self->_discoveryItemsExpanded = v6;

    discoveryItemsExpanded = self->_discoveryItemsExpanded;
  }
  return discoveryItemsExpanded;
}

- (NSSet)discoveryItemsDismissed
{
  discoveryItemsDismissed = self->_discoveryItemsDismissed;
  if (!discoveryItemsDismissed)
  {
    id v4 = [(PDDiscoveryManager *)self->_discoveryManager identifiersOfDismissedDiscoveryItems];
    id v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = (NSSet *)objc_alloc_init((Class)NSSet);
    }
    id v7 = self->_discoveryItemsDismissed;
    self->_discoveryItemsDismissed = v6;

    discoveryItemsDismissed = self->_discoveryItemsDismissed;
  }
  return discoveryItemsDismissed;
}

- (NSSet)discoveryCTAsTapped
{
  discoveryCTAsTapped = self->_discoveryCTAsTapped;
  if (!discoveryCTAsTapped)
  {
    id v4 = [(PDDiscoveryManager *)self->_discoveryManager identifiersOfTappedDiscoveryItems];
    id v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = (NSSet *)objc_alloc_init((Class)NSSet);
    }
    id v7 = self->_discoveryCTAsTapped;
    self->_discoveryCTAsTapped = v6;

    discoveryCTAsTapped = self->_discoveryCTAsTapped;
  }
  return discoveryCTAsTapped;
}

- (NSSet)discoveryCTAsCompleted
{
  discoveryCTAsCompleted = self->_discoveryCTAsCompleted;
  if (!discoveryCTAsCompleted)
  {
    id v4 = [(PDDiscoveryManager *)self->_discoveryManager identifiersOfCompletedDiscoveryItems];
    id v5 = v4;
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = (NSSet *)objc_alloc_init((Class)NSSet);
    }
    id v7 = self->_discoveryCTAsCompleted;
    self->_discoveryCTAsCompleted = v6;

    discoveryCTAsCompleted = self->_discoveryCTAsCompleted;
  }
  return discoveryCTAsCompleted;
}

- (BOOL)hasPayLaterAccount
{
  return self->_prefetchedPayLaterAccount != 0;
}

- (BOOL)isPayLaterHidden
{
  return _PKHidePayLaterOptions(self, a2);
}

- (BOOL)hasEverProvisionedPayLaterPass
{
  if (!self->_hasQueriedHasEverProvisionedPayLaterPass)
  {
    prefetchedPayLaterAccount = self->_prefetchedPayLaterAccount;
    if (prefetchedPayLaterAccount)
    {
      self->_hasQueriedHasEverProvisionedPayLaterPass = 1;
      id v4 = [(PKAccount *)prefetchedPayLaterAccount payLaterDetails];
      self->_hasEverProvisionedPayLaterPass = [v4 hasProvisionedPass];
    }
  }
  return self->_hasEverProvisionedPayLaterPass;
}

- (BOOL)hasPayLaterPass
{
  if (!self->_hasQueriedHasPayLaterPass)
  {
    prefetchedPayLaterAccount = self->_prefetchedPayLaterAccount;
    if (prefetchedPayLaterAccount)
    {
      self->_hasQueriedHasPayLaterPass = 1;
      id v4 = [(PKAccount *)prefetchedPayLaterAccount associatedPassUniqueID];
      self->_hasPayLaterPass = [(PDDatabaseManager *)self->_databaseManager passExistsWithUniqueID:v4];
    }
  }
  return self->_hasPayLaterPass;
}

- (int64_t)payLaterNumberOfLoans
{
  if (!self->_hasQueriedPayLaterNumberOfLoans)
  {
    prefetchedPayLaterFinancingPlans = self->_prefetchedPayLaterFinancingPlans;
    if (prefetchedPayLaterFinancingPlans)
    {
      self->_payLaterNumberOfLoans = [(NSArray *)prefetchedPayLaterFinancingPlans count];
      self->_hasQueriedPayLaterNumberOfLoans = 1;
    }
  }
  return self->_payLaterNumberOfLoans;
}

- (int64_t)payLaterDaysSinceFirstActiveLoan
{
  if (!self->_hasQueriedPayLaterDaysSinceFirstActiveLoan)
  {
    prefetchedPayLaterFinancingPlans = self->_prefetchedPayLaterFinancingPlans;
    if (prefetchedPayLaterFinancingPlans)
    {
      id v4 = [(NSArray *)prefetchedPayLaterFinancingPlans pk_objectsPassingTest:&stru_100739908];
      id v5 = +[NSSortDescriptor sortDescriptorWithKey:@"planSummary.transactionDate" ascending:1];
      id v15 = v5;
      id v6 = +[NSArray arrayWithObjects:&v15 count:1];
      id v7 = [v4 sortedArrayUsingDescriptors:v6];
      id v8 = [v7 firstObject];

      if (v8)
      {
        uint64_t v9 = +[NSDate date];
        unsigned __int8 v10 = [v8 planSummary];
        id v11 = [v10 transactionDate];
        [v9 timeIntervalSinceDate:v11];
        double v13 = v12;

        self->_payLaterDaysSinceFirstActiveLoan = vcvtmd_s64_f64(v13 / 86400.0);
      }
      self->_hasQueriedPayLaterDaysSinceFirstActiveLoan = 1;
    }
  }
  return self->_payLaterDaysSinceFirstActiveLoan;
}

- (int64_t)payLaterNumberOfActiveLoans
{
  if (!self->_hasQueriedPayLaterNumberOfActiveLoans && self->_prefetchedPayLaterFinancingPlans)
  {
    self->_payLaterNumberOfActiveLoans = [(PDUserEvaluationEnvironment *)self _countOfFinancingPlansWithSate:1];
    self->_hasQueriedPayLaterNumberOfActiveLoans = 1;
  }
  return self->_payLaterNumberOfActiveLoans;
}

- (int64_t)payLaterNumberOfPendingLoans
{
  if (!self->_hasQueriedPayLaterNumberOfPendingLoans && self->_prefetchedPayLaterFinancingPlans)
  {
    int64_t v3 = [(PDUserEvaluationEnvironment *)self _countOfFinancingPlansWithSate:2];
    self->_payLaterNumberOfPendingLoans = [(PDUserEvaluationEnvironment *)self _countOfFinancingPlansWithSate:3]+ v3;
    self->_hasQueriedPayLaterNumberOfPendingLoans = 1;
  }
  return self->_payLaterNumberOfPendingLoans;
}

- (int64_t)payLaterNumberOfDelinquentLoans
{
  if (!self->_hasQueriedPayLaterNumberOfDelinquentLoans && self->_prefetchedPayLaterFinancingPlans)
  {
    self->_payLaterNumberOfDelinquentLoans = [(PDUserEvaluationEnvironment *)self _countOfFinancingPlansWithSate:4];
    self->_hasQueriedPayLaterNumberOfDelinquentLoans = 1;
  }
  return self->_payLaterNumberOfDelinquentLoans;
}

- (int64_t)payLaterNumberOfCanceledLoans
{
  if (!self->_hasQueriedPayLaterNumberOfCanceledLoans && self->_prefetchedPayLaterFinancingPlans)
  {
    self->_payLaterNumberOfCanceledLoans = [(PDUserEvaluationEnvironment *)self _countOfFinancingPlansWithSate:5];
    self->_hasQueriedPayLaterNumberOfCanceledLoans = 1;
  }
  return self->_payLaterNumberOfCanceledLoans;
}

- (int64_t)payLaterNumberOfCompleteLoans
{
  if (!self->_hasQueriedPayLaterNumberOfCompleteLoans && self->_prefetchedPayLaterFinancingPlans)
  {
    self->_payLaterNumberOfCompleteLoans = [(PDUserEvaluationEnvironment *)self _countOfFinancingPlansWithSate:6];
    self->_hasQueriedPayLaterNumberOfCompleteLoans = 1;
  }
  return self->_payLaterNumberOfCompleteLoans;
}

- (int64_t)_countOfFinancingPlansOfType:(unint64_t)a3
{
  prefetchedPayLaterFinancingPlans = self->_prefetchedPayLaterFinancingPlans;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10013F574;
  v5[3] = &unk_100739928;
  v5[4] = a3;
  return (int64_t)[(NSArray *)prefetchedPayLaterFinancingPlans pk_countObjectsPassingTest:v5];
}

- (int64_t)_countOfFinancingPlansWithSate:(unint64_t)a3
{
  prefetchedPayLaterFinancingPlans = self->_prefetchedPayLaterFinancingPlans;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10013F618;
  v5[3] = &unk_100739928;
  v5[4] = a3;
  return (int64_t)[(NSArray *)prefetchedPayLaterFinancingPlans pk_countObjectsPassingTest:v5];
}

- (BOOL)hasSavingsAccount
{
  return self->_prefetchedSavingsAccount != 0;
}

- (int64_t)savingsAccountDaysSinceCreatedDate
{
  uint64_t v3 = [(PKAccount *)self->_prefetchedSavingsAccount createdDate];
  id v4 = (void *)v3;
  if (self->_prefetchedSavingsAccount) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    int64_t v9 = -1;
  }
  else
  {
    id v6 = +[NSCalendar currentCalendar];
    id v7 = +[NSDate date];
    id v8 = [v6 components:16 fromDate:v4 toDate:v7 options:0];
    int64_t v9 = (int64_t)[v8 day];
  }
  return v9;
}

- (BOOL)savingsAccountHasExternalTransferIn
{
  if (self->_hasQueriedSavingsAccountExternalTransferInTransaction) {
    return self->_hasSavingsAccountExternalTransferInTransaction;
  }
  BOOL result = [(PDUserEvaluationEnvironment *)self _hasSavingsAccountAccountTransactionOfTransactionType:6 fundingSourceTypes:&off_10078C1F8];
  self->_hasSavingsAccountExternalTransferInTransaction = result;
  self->_hasQueriedSavingsAccountExternalTransferInTransaction = 1;
  return result;
}

- (BOOL)savingsAccountHasExternalTransferOut
{
  if (self->_hasQueriedSavingsAccountExternalTransferOutTransaction) {
    return self->_hasSavingsAccountExternalTransferOutTransaction;
  }
  BOOL result = [(PDUserEvaluationEnvironment *)self _hasSavingsAccountAccountTransactionOfTransactionType:5 fundingSourceTypes:&off_10078C210];
  self->_hasSavingsAccountExternalTransferOutTransaction = result;
  self->_hasQueriedSavingsAccountExternalTransferOutTransaction = 1;
  return result;
}

- (BOOL)savingsAccountHasCashTransferIn
{
  if (self->_hasQueriedSavingsAccountCashTransferInTransaction) {
    return self->_hasSavingsAccountCashTransferInTransaction;
  }
  BOOL result = [(PDUserEvaluationEnvironment *)self _hasSavingsAccountAccountTransactionOfTransactionType:6 fundingSourceTypes:&off_10078C228];
  self->_hasSavingsAccountCashTransferInTransaction = result;
  self->_hasQueriedSavingsAccountCashTransferInTransaction = 1;
  return result;
}

- (int64_t)savingsAccountBinnedBalance
{
  prefetchedSavingsAccount = self->_prefetchedSavingsAccount;
  if (!prefetchedSavingsAccount) {
    return -1;
  }
  uint64_t v3 = [(PKAccount *)prefetchedSavingsAccount savingsDetails];
  id v4 = [v3 accountSummary];
  BOOL v5 = [v4 currentBalance];

  id v6 = [v3 currencyCode];
  id v7 = v6;
  if (v5 && [v6 isEqualToString:@"USD"])
  {
    id v8 = PKCurrencyAmountMake();
    int64_t v9 = [v8 amountByConvertingToSmallestCommonCurrencyUnit];
    uint64_t v10 = (uint64_t)[v9 longLongValue];

    if (v10 <= 14999999)
    {
      if (v10 <= 9999999)
      {
        if (v10 <= 7499999)
        {
          if (v10 <= 4999999)
          {
            if (v10 <= 1999999)
            {
              if (v10 <= 999999)
              {
                if (v10 <= 499999)
                {
                  if (v10 <= 399999)
                  {
                    if (v10 <= 299999)
                    {
                      if (v10 <= 199999)
                      {
                        if (v10 <= 149999)
                        {
                          if (v10 <= 99999)
                          {
                            if (v10 <= 74999)
                            {
                              if (v10 <= 49999)
                              {
                                if (v10 <= 24999) {
                                  int64_t v11 = 0;
                                }
                                else {
                                  int64_t v11 = 250;
                                }
                              }
                              else
                              {
                                int64_t v11 = 500;
                              }
                            }
                            else
                            {
                              int64_t v11 = 750;
                            }
                          }
                          else
                          {
                            int64_t v11 = 1000;
                          }
                        }
                        else
                        {
                          int64_t v11 = 1500;
                        }
                      }
                      else
                      {
                        int64_t v11 = 2000;
                      }
                    }
                    else
                    {
                      int64_t v11 = 3000;
                    }
                  }
                  else
                  {
                    int64_t v11 = 4000;
                  }
                }
                else
                {
                  int64_t v11 = 5000;
                }
              }
              else
              {
                int64_t v11 = 10000;
              }
            }
            else
            {
              int64_t v11 = 20000;
            }
          }
          else
          {
            int64_t v11 = 50000;
          }
        }
        else
        {
          int64_t v11 = 75000;
        }
      }
      else
      {
        int64_t v11 = 100000;
      }
    }
    else
    {
      int64_t v11 = 150000;
    }
  }
  else
  {
    int64_t v11 = -1;
  }

  return v11;
}

- (BOOL)_hasPaymentOfferCriteriaOfType:(unint64_t)a3
{
  prefetchedPaymentOfferCatalog = self->_prefetchedPaymentOfferCatalog;
  if (!prefetchedPaymentOfferCatalog) {
    return 0;
  }
  BOOL v5 = [(PKPaymentOfferCatalog *)prefetchedPaymentOfferCatalog catalog];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10013FAF8;
  v8[3] = &unk_100739948;
  v8[4] = a3;
  unsigned __int8 v6 = objc_msgSend(v5, "pk_containsObjectPassingTest:", v8);

  return v6;
}

- (BOOL)hasBankConnectEligibleCard
{
  return [(FKBankConnectEvaluationManager *)self->_bankConnectEvaluationManager hasAnyConnectedCardWithBankConnect];
}

- (BOOL)hasAnyConnectedCardWithBankConnect
{
  return [(FKBankConnectEvaluationManager *)self->_bankConnectEvaluationManager hasAnyEligibleBankConnectCard];
}

- (BOOL)hasIssuerInstallmentCard
{
  return [(PDUserEvaluationEnvironment *)self _hasPaymentOfferCriteriaOfType:1];
}

- (BOOL)hasEverMadeIssuerInstallmentTransaction
{
  return PKSharedCacheGetBoolForKey();
}

- (BOOL)hasPayWithRewardsCard
{
  return [(PDUserEvaluationEnvironment *)self _hasPaymentOfferCriteriaOfType:2];
}

- (BOOL)hasEverMadePayWithRewardsTransaction
{
  return PKSharedCacheGetBoolForKey();
}

- (BOOL)hasAppleAccountCardProvisioned
{
  if (!self->_hasQueriedHasAppleAccountCard)
  {
    prefetchedAppleBalanceAccount = self->_prefetchedAppleBalanceAccount;
    if (prefetchedAppleBalanceAccount)
    {
      self->_hasQueriedHasAppleAccountCard = 1;
      id v4 = [(PKAccount *)prefetchedAppleBalanceAccount associatedPassUniqueID];
      self->_hasAppleAccountCard = [(PDDatabaseManager *)self->_databaseManager passExistsWithUniqueID:v4];
    }
  }
  return self->_hasAppleAccountCard;
}

- (int64_t)daysSinceAppleAccountInStoreTopUp
{
  if (!self->_hasQueriedDaysSinceAppleAccountInStoreTopUp)
  {
    self->_hasQueriedDaysSinceAppleAccountInStoreTopUp = 1;
    self->_daysSinceAppleAccountInStoreTopUp = -1;
    prefetchedAppleBalanceAccount = self->_prefetchedAppleBalanceAccount;
    if (prefetchedAppleBalanceAccount)
    {
      id v4 = [(PKAccount *)prefetchedAppleBalanceAccount associatedPassUniqueID];
      BOOL v5 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v4];
      id v6 = objc_alloc_init((Class)PKPaymentTransactionRequest);
      [v6 setTransactionSourceIdentifiers:v5];
      [v6 setTransactionTypes:&off_10078C240];
      [v6 setTopUpSubtype:6];
      [v6 setLimit:1];
      id v7 = [(PDDatabaseManager *)self->_databaseManager transactionsForRequest:v6];
      id v8 = [v7 firstObject];

      if (v8)
      {
        int64_t v9 = +[NSDate date];
        uint64_t v10 = [v8 transactionDate];
        [v9 timeIntervalSinceDate:v10];
        double v12 = v11;

        self->_daysSinceAppleAccountInStoreTopUp = vcvtmd_s64_f64(v12 / 86400.0);
      }
    }
  }
  return self->_daysSinceAppleAccountInStoreTopUp;
}

- (id)memberOfInstalledApps:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NSMutableDictionary *)self->_queriedAppIdentifierPresence objectForKeyedSubscript:v4];
  if (!v5)
  {
    id v6 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithStoreItemIdentifier:error:", objc_msgSend(v4, "unsignedLongLongValue"), 0);
    id v7 = v6;
    if (v6)
    {
      id v8 = [v6 applicationState];
      BOOL v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isInstalled]);
    }
    else
    {
      BOOL v5 = +[NSNumber numberWithBool:0];
    }
    [(NSMutableDictionary *)self->_queriedAppIdentifierPresence setObject:v5 forKeyedSubscript:v4];
  }
  if ([v5 BOOLValue]) {
    int64_t v9 = v4;
  }
  else {
    int64_t v9 = 0;
  }
  id v10 = v9;

  return v10;
}

- (unint64_t)countOfInstalledApps
{
  queriedAppIdentifierPresence = self->_queriedAppIdentifierPresence;
  uint64_t v3 = +[NSNumber numberWithBool:1];
  id v4 = [(NSMutableDictionary *)queriedAppIdentifierPresence allKeysForObject:v3];
  id v5 = [v4 count];

  return (unint64_t)v5;
}

- (id)enumeratorOfInstalledApps
{
  queriedAppIdentifierPresence = self->_queriedAppIdentifierPresence;
  uint64_t v3 = +[NSNumber numberWithBool:1];
  id v4 = [(NSMutableDictionary *)queriedAppIdentifierPresence allKeysForObject:v3];
  id v5 = [v4 objectEnumerator];

  return v5;
}

- (BOOL)hasPairedWatch
{
  if (self->_hasQueriedPairedWatch) {
    return self->_hasPairedWatch;
  }
  self->_hasQueriedPairedWatch = 1;
  BOOL result = PKIsPairedWithWatch() != 0;
  self->_hasPairedWatch = result;
  return result;
}

- (NSSet)enrolledAuthenticationMechanisms
{
  prefetchedEnrolledAuthenticationMechanisms = self->_prefetchedEnrolledAuthenticationMechanisms;
  if (!prefetchedEnrolledAuthenticationMechanisms)
  {
    long long v20 = self;
    id v4 = [objc_alloc((Class)NSMutableSet) initWithCapacity:4];
    if (PKPasscodeEnabled()) {
      [v4 addObject:@"Passcode"];
    }
    [(objc_class *)off_100805970() availableDevices];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v5 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v25;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v25 != v7) {
            objc_enumerationMutation(obj);
          }
          int64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v10 = [v9 type];
          if (v10 == (id)2) {
            CFStringRef v11 = @"Face ID";
          }
          else {
            CFStringRef v11 = 0;
          }
          if (v10 == (id)1) {
            CFStringRef v12 = @"Touch ID";
          }
          else {
            CFStringRef v12 = v11;
          }
          Class v13 = (Class)off_100805978();
          id v23 = 0;
          long long v14 = [(objc_class *)v13 deviceWithDescriptor:v9 error:&v23];
          id v15 = v23;
          if (!v15)
          {
            id v22 = 0;
            long long v16 = [v14 identitiesWithError:&v22];
            id v15 = v22;
            if (!v15 && [v16 count]) {
              [v4 addObject:v12];
            }
          }
        }
        id v6 = [obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v6);
    }
    long long v17 = (NSSet *)[v4 copy];
    long long v18 = v20->_prefetchedEnrolledAuthenticationMechanisms;
    v20->_prefetchedEnrolledAuthenticationMechanisms = v17;

    prefetchedEnrolledAuthenticationMechanisms = v20->_prefetchedEnrolledAuthenticationMechanisms;
  }
  return prefetchedEnrolledAuthenticationMechanisms;
}

- (void)preflightForKeys:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v25 = a4;
  id v6 = objc_alloc_init((Class)NSMutableSet);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      CFStringRef v11 = 0;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = PDUEEKeyFromString(*(void **)(*((void *)&v28 + 1) + 8 * (void)v11));
        Class v13 = &off_10078AC50;
        switch(v12)
        {
          case 3:
            Class v13 = &off_10078ACC8;
            goto LABEL_25;
          case 4:
          case 5:
          case 6:
          case 7:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
          case 20:
          case 21:
          case 22:
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
          case 31:
          case 32:
          case 33:
          case 34:
          case 35:
          case 36:
          case 40:
          case 41:
          case 42:
          case 47:
          case 48:
          case 49:
          case 50:
            [v6 addObject:&off_10078AC20];
            [v6 addObject:&off_10078AC08];
            Class v13 = &off_10078AC80;
            goto LABEL_25;
          case 37:
          case 38:
          case 39:
            goto LABEL_25;
          case 43:
            [v6 addObject:&off_10078ACE0];
            goto LABEL_21;
          case 44:
            [v6 addObject:&off_10078ACE0];
            long long v14 = v6;
            id v15 = &off_10078AC20;
            goto LABEL_23;
          case 45:
          case 46:
          case 112:
LABEL_21:
            Class v13 = &off_10078AC20;
            goto LABEL_25;
          case 51:
          case 52:
            Class v13 = &off_10078AC08;
            goto LABEL_25;
          case 64:
          case 65:
          case 66:
          case 67:
          case 68:
          case 69:
          case 70:
          case 71:
          case 72:
          case 73:
          case 75:
          case 76:
          case 78:
          case 79:
          case 80:
          case 81:
          case 83:
          case 84:
          case 85:
          case 86:
          case 87:
          case 88:
          case 89:
          case 90:
          case 91:
          case 92:
          case 93:
          case 94:
            Class v13 = &off_10078AC38;
            goto LABEL_25;
          case 74:
          case 82:
            long long v14 = v6;
            id v15 = &off_10078AC38;
LABEL_23:
            objc_msgSend(v14, "addObject:", v15, v25);
            goto LABEL_24;
          case 95:
          case 96:
          case 97:
          case 98:
          case 99:
          case 100:
          case 101:
          case 102:
LABEL_24:
            Class v13 = &off_10078AC98;
            goto LABEL_25;
          case 103:
            Class v13 = &off_10078ACB0;
            goto LABEL_25;
          case 121:
          case 122:
          case 123:
            Class v13 = &off_10078AC68;
            goto LABEL_25;
          case 124:
            Class v13 = &off_10078AD28;
            goto LABEL_25;
          case 125:
          case 126:
          case 127:
          case 128:
          case 129:
          case 130:
            Class v13 = &off_10078AD40;
            goto LABEL_25;
          case 131:
            Class v13 = &off_10078AD58;
            goto LABEL_25;
          case 132:
          case 134:
          case 135:
            Class v13 = &off_10078ACF8;
            goto LABEL_25;
          case 136:
          case 137:
          case 138:
          case 139:
          case 140:
          case 141:
          case 142:
            Class v13 = &off_10078AD10;
            goto LABEL_25;
          case 143:
          case 144:
          case 145:
          case 146:
          case 147:
          case 148:
            Class v13 = &off_10078AD70;
            goto LABEL_25;
          case 152:
          case 156:
            Class v13 = &off_10078AD88;
            goto LABEL_25;
          case 158:
          case 159:
            Class v13 = &off_10078ADA0;
LABEL_25:
            objc_msgSend(v6, "addObject:", v13, v25);
            break;
          default:
            break;
        }
        CFStringRef v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v16 = [v7 countByEnumeratingWithState:&v28 objects:v32 count:16];
      id v9 = v16;
    }
    while (v16);
  }

  id v17 = [v6 containsObject:&off_10078AD40];
  if (v17)
  {
    if (self->_rulesNeedLocation) {
      goto LABEL_37;
    }
    BOOL v18 = 1;
  }
  else
  {
    if (!self->_rulesNeedLocation) {
      goto LABEL_37;
    }
    BOOL v18 = 0;
  }
  self->_rulesNeedLocation = v18;
  -[PDDiscoveryManager setRulesNeedLocation:](self->_discoveryManager, "setRulesNeedLocation:", v17, v25);
LABEL_37:
  id v19 = objc_msgSend(v6, "containsObject:", &off_10078AD58, v25);
  if (v19)
  {
    if (self->_rulesNeedPlacemark) {
      goto LABEL_43;
    }
    BOOL v20 = 1;
  }
  else
  {
    if (!self->_rulesNeedPlacemark) {
      goto LABEL_43;
    }
    BOOL v20 = 0;
  }
  self->_rulesNeedPlacemark = v20;
  [(PDDiscoveryManager *)self->_discoveryManager setRulesNeedPlacemark:v19];
LABEL_43:
  [(PDUserEvaluationEnvironment *)self _prefetchDataSources:v6 completion:v26];
  if ([v7 containsObject:@"hasTransitPassForCurrentLocation"])
  {
    databaseManager = self->_databaseManager;
    id v22 = [(PDUserEvaluationEnvironment *)self supportedTransitNetworksForCurrentLocation];
    self->_hasTransitPassForCurrentLocation = [(PDDatabaseManager *)databaseManager passExistsForTransitNetworks:v22 isTransitCard:1 expired:0];
  }
  if ([v7 containsObject:@"hasUnexpiredTransitPassForCurrentLocation"])
  {
    id v23 = self->_databaseManager;
    long long v24 = [(PDUserEvaluationEnvironment *)self supportedTransitNetworksForCurrentLocation];
    self->_hasUnexpiredTransitPassForCurrentLocation = [(PDDatabaseManager *)v23 passExistsForTransitNetworks:v24 isTransitCard:1 expired:2];
  }
}

- (void)_prefetchDataSources:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [v6 anyObject];
    uint64_t v9 = (int)[v8 intValue];
    [v6 removeObject:v8];
    objc_initWeak(&location, self);
    switch(v9)
    {
      case 1:
        uint64_t v10 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_1005151FC();
        }

        accountManager = self->_accountManager;
        v115[0] = _NSConcreteStackBlock;
        v115[1] = 3221225472;
        v115[2] = sub_10014161C;
        v115[3] = &unk_100739970;
        uint64_t v12 = &v118;
        objc_copyWeak(&v118, &location);
        id v116 = v6;
        id v117 = v7;
        [(PDAccountManager *)accountManager accountsForFeature:2 completion:v115];

        Class v13 = v116;
        goto LABEL_59;
      case 2:
        long long v31 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          sub_100515230();
        }

        long long v32 = self->_accountManager;
        v111[0] = _NSConcreteStackBlock;
        v111[1] = 3221225472;
        v111[2] = sub_100141698;
        v111[3] = &unk_100739998;
        uint64_t v12 = &v114;
        objc_copyWeak(&v114, &location);
        id v112 = v6;
        id v113 = v7;
        [(PDAccountManager *)v32 defaultAccountForFeature:2 completion:v111];

        Class v13 = v112;
        goto LABEL_59;
      case 3:
        long long v14 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
          sub_100515264();
        }

        peerPaymentWebServiceCoordinator = self->_peerPaymentWebServiceCoordinator;
        v107[0] = _NSConcreteStackBlock;
        v107[1] = 3221225472;
        v107[2] = sub_100141848;
        v107[3] = &unk_1007399C0;
        uint64_t v12 = &v110;
        objc_copyWeak(&v110, &location);
        id v108 = v6;
        id v109 = v7;
        [(PDPeerPaymentWebServiceCoordinator *)peerPaymentWebServiceCoordinator accountWithPreventingServerFetch:1 completion:v107];

        Class v13 = v108;
        goto LABEL_59;
      case 4:
        long long v33 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          sub_100515298();
        }

        long long v34 = [(PDPaymentWebServiceCoordinator *)self->_paymentWebServiceCoordinator paymentSetupFeaturesCoordinator];
        uint64_t v35 = PKPassdBundleIdentifier;
        v103[0] = _NSConcreteStackBlock;
        v103[1] = 3221225472;
        v103[2] = sub_1001418C4;
        v103[3] = &unk_1007399E8;
        objc_copyWeak(&v106, &location);
        id v104 = v6;
        id v105 = v7;
        [v34 staticPaymentSetupFeaturesForSourceApplicationID:v35 blockServerFetch:1 completion:v103];

        long long v36 = &v106;
        goto LABEL_60;
      case 5:
        id v16 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          sub_1005152CC();
        }

        applyManager = self->_applyManager;
        v99[0] = _NSConcreteStackBlock;
        v99[1] = 3221225472;
        v99[2] = sub_1001419F8;
        v99[3] = &unk_1007399E8;
        uint64_t v12 = &v102;
        objc_copyWeak(&v102, &location);
        id v100 = v6;
        id v101 = v7;
        [(PDApplyManager *)applyManager applicationsWithCompletion:v99];

        Class v13 = v100;
        goto LABEL_59;
      case 6:
        long long v37 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
          sub_100515300();
        }

        transitNotificationService = self->_transitNotificationService;
        v95[0] = _NSConcreteStackBlock;
        v95[1] = 3221225472;
        v95[2] = sub_100141C28;
        v95[3] = &unk_100739A10;
        uint64_t v12 = &v98;
        objc_copyWeak(&v98, &location);
        id v96 = v6;
        id v97 = v7;
        [(PDTransitNotificationService *)transitNotificationService sentTransitNotificationStateWithHandler:v95];

        Class v13 = v96;
        goto LABEL_59;
      case 7:
        long long v39 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
          sub_100515334();
        }

        familyCircleManager = self->_familyCircleManager;
        v91[0] = _NSConcreteStackBlock;
        v91[1] = 3221225472;
        v91[2] = sub_100141CEC;
        v91[3] = &unk_1007399E8;
        uint64_t v12 = &v94;
        objc_copyWeak(&v94, &location);
        id v92 = v6;
        id v93 = v7;
        [(PDFamilyCircleManager *)familyCircleManager familyMembersWithCachePolicy:2 completion:v91];

        Class v13 = v92;
        goto LABEL_59;
      case 8:
        long long v41 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
          sub_100515368();
        }

        v42 = self->_familyCircleManager;
        v87[0] = _NSConcreteStackBlock;
        v87[1] = 3221225472;
        v87[2] = sub_100141D68;
        v87[3] = &unk_100739A38;
        uint64_t v12 = &v90;
        objc_copyWeak(&v90, &location);
        id v88 = v6;
        id v89 = v7;
        [(PDFamilyCircleManager *)v42 memberTypeForCurrentUserWithCachePolicy:2 completion:v87];

        Class v13 = v88;
        goto LABEL_59;
      case 9:
        v43 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
          sub_10051539C();
        }

        expressPassManager = self->_expressPassManager;
        v83[0] = _NSConcreteStackBlock;
        v83[1] = 3221225472;
        v83[2] = sub_100141DC4;
        v83[3] = &unk_100739970;
        uint64_t v12 = &v86;
        objc_copyWeak(&v86, &location);
        id v84 = v6;
        id v85 = v7;
        sub_10018E790((uint64_t)expressPassManager, v83);

        Class v13 = v84;
        goto LABEL_59;
      case 10:
        BOOL v18 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          sub_1005153D0();
        }

        id v19 = self->_accountManager;
        v79[0] = _NSConcreteStackBlock;
        v79[1] = 3221225472;
        v79[2] = sub_100141F3C;
        v79[3] = &unk_100739A60;
        uint64_t v12 = &v82;
        objc_copyWeak(&v82, &location);
        id v80 = v6;
        id v81 = v7;
        [(PDAccountManager *)v19 accountUsersByAccountIdentifierForFeature:2 completion:v79];

        Class v13 = v80;
        goto LABEL_59;
      case 11:
        v45 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          sub_1005154A0();
        }

        v46 = PDDefaultQueue();
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_100142318;
        v63[3] = &unk_100739B78;
        v63[4] = self;
        id v64 = v6;
        id v65 = v7;
        objc_copyWeak(&v66, &location);
        dispatch_async(v46, v63);

        objc_destroyWeak(&v66);
        break;
      case 12:
        BOOL v20 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          sub_1005154D4();
        }

        long long v21 = PDDefaultQueue();
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100142C10;
        block[3] = &unk_100739BC8;
        block[4] = self;
        uint64_t v12 = &v62;
        objc_copyWeak(&v62, &location);
        id v60 = v6;
        id v61 = v7;
        dispatch_async(v21, block);

        Class v13 = v60;
        goto LABEL_59;
      case 13:
        id v22 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          sub_10051546C();
        }

        id v23 = self->_accountManager;
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472;
        v67[2] = sub_10014229C;
        v67[3] = &unk_100739A60;
        uint64_t v12 = &v70;
        objc_copyWeak(&v70, &location);
        id v68 = v6;
        id v69 = v7;
        [(PDAccountManager *)v23 physicalCardsByAccountIdentifierForFeature:2 completion:v67];

        Class v13 = v68;
        goto LABEL_59;
      case 14:
        v47 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
          sub_100515404();
        }

        v48 = self->_accountManager;
        v75[0] = _NSConcreteStackBlock;
        v75[1] = 3221225472;
        v75[2] = sub_100141FB8;
        v75[3] = &unk_100739998;
        uint64_t v12 = &v78;
        objc_copyWeak(&v78, &location);
        id v76 = v6;
        id v77 = v7;
        [(PDAccountManager *)v48 defaultAccountForFeature:3 completion:v75];

        Class v13 = v76;
        goto LABEL_59;
      case 15:
        long long v24 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
          sub_100515438();
        }

        id v25 = self->_accountManager;
        v71[0] = _NSConcreteStackBlock;
        v71[1] = 3221225472;
        v71[2] = sub_100142220;
        v71[3] = &unk_100739998;
        uint64_t v12 = &v74;
        objc_copyWeak(&v74, &location);
        id v72 = v6;
        id v73 = v7;
        [(PDAccountManager *)v25 defaultAccountForFeature:3 completion:v71];

        Class v13 = v72;
        goto LABEL_59;
      case 16:
        long long v26 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          sub_100515508();
        }

        long long v27 = self->_accountManager;
        v55[0] = _NSConcreteStackBlock;
        v55[1] = 3221225472;
        v55[2] = sub_100142D68;
        v55[3] = &unk_100739998;
        uint64_t v12 = &v58;
        objc_copyWeak(&v58, &location);
        id v56 = v6;
        id v57 = v7;
        [(PDAccountManager *)v27 defaultAccountForFeature:5 completion:v55];

        Class v13 = v56;
        goto LABEL_59;
      case 17:
        long long v28 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
          sub_10051553C();
        }

        long long v29 = [(PDDatabaseManager *)self->_databaseManager paymentOfferCatalog];
        prefetchedPaymentOfferCatalog = self->_prefetchedPaymentOfferCatalog;
        self->_prefetchedPaymentOfferCatalog = v29;

        [(PDUserEvaluationEnvironment *)self _prefetchDataSources:v6 completion:v7];
        break;
      case 18:
        id v49 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG)) {
          sub_100515570();
        }

        id v50 = self->_accountManager;
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_100142DE4;
        v51[3] = &unk_100739998;
        uint64_t v12 = &v54;
        objc_copyWeak(&v54, &location);
        id v52 = v6;
        id v53 = v7;
        [(PDAccountManager *)v50 defaultAccountForFeature:4 completion:v51];

        Class v13 = v52;
LABEL_59:

        long long v36 = v12;
LABEL_60:
        objc_destroyWeak(v36);
        break;
      default:
        break;
    }
    objc_destroyWeak(&location);
  }
  else if (v7)
  {
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

- (BOOL)_hasSavingsAccountAccountTransactionOfTransactionType:(int64_t)a3 fundingSourceTypes:(id)a4
{
  id v6 = a4;
  id v7 = [(PKAccount *)self->_prefetchedSavingsAccount transactionSourceIdentifier];
  if (v7)
  {
    id v8 = +[NSSet setWithObject:v7];
    id v9 = objc_alloc_init((Class)PKPaymentTransactionRequest);
    [v9 setTransactionSourceIdentifiers:v8];
    uint64_t v10 = +[NSNumber numberWithInteger:a3];
    long long v14 = v10;
    CFStringRef v11 = +[NSArray arrayWithObjects:&v14 count:1];
    [v9 setTransactionTypes:v11];

    [v9 setFundingSourceTypes:v6];
    BOOL v12 = [(PDDatabaseManager *)self->_databaseManager transactionsCountForRequest:v9] != 0;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)_hasDefaultCreditAccountTransactionOfTransactionSourceType:(unint64_t)a3
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (prefetchedDefaultCreditAccount)
  {
    id v6 = [(PKAccount *)prefetchedDefaultCreditAccount associatedPassUniqueID];
    id v7 = [(PDDatabaseManager *)self->_databaseManager transactionSourceIdentifiersForPassUniqueIdentifier:v6];
    LOBYTE(a3) = [(PDDatabaseManager *)self->_databaseManager hasPaymentTransactionForTransactionSourceIdentifiers:v7 withTransactionSource:a3];

    LOBYTE(prefetchedDefaultCreditAccount) = a3;
  }
  return (char)prefetchedDefaultCreditAccount;
}

- (id)_defaultCreditAccountCreditAccountDetails
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (prefetchedDefaultCreditAccount)
  {
    uint64_t v3 = [(PKAccount *)prefetchedDefaultCreditAccount creditDetails];
    id v4 = v3;
    if (v3) {
      id v5 = v3;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_defaultCreditAccountAccountSummary
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (prefetchedDefaultCreditAccount)
  {
    uint64_t v3 = [(PKAccount *)prefetchedDefaultCreditAccount creditDetails];
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 accountSummary];
      id v6 = v5;
      if (v5) {
        id v7 = v5;
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_defaultCreditAccountAccountStatement
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (prefetchedDefaultCreditAccount)
  {
    uint64_t v3 = [(PKAccount *)prefetchedDefaultCreditAccount creditDetails];
    id v4 = v3;
    if (v3)
    {
      id v5 = [v3 accountSummary];
      id v6 = v5;
      if (v5)
      {
        id v7 = [v5 currentStatement];
        id v8 = v7;
        if (v7) {
          id v9 = v7;
        }
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)_defaultCreditAccountSupportedDestinations
{
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  if (prefetchedDefaultCreditAccount)
  {
    uint64_t v3 = [(PKAccount *)prefetchedDefaultCreditAccount redeemRewardsFeatureDescriptor];
    id v4 = [v3 supportedDestinations];

    if (v4)
    {
      id v5 = +[NSSet setWithArray:v4];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_creditAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_prefetchedCreditAccounts;
  id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "accountIdentifier", (void)v16);
        id v11 = v4;
        id v12 = v10;
        if (v12 == v11)
        {

LABEL_16:
          id v6 = v9;
          goto LABEL_17;
        }
        Class v13 = v12;
        if (v4 && v12)
        {
          unsigned __int8 v14 = [v11 isEqualToString:v12];

          if (v14) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v6 = [(NSSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v6;
}

- (id)_familyMemberWithAltDSID:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_prefetchedFamilyMembers;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "altDSID", (void)v16);
        id v11 = v4;
        id v12 = v10;
        if (v12 == v11)
        {

LABEL_16:
          id v6 = v9;
          goto LABEL_17;
        }
        Class v13 = v12;
        if (v4 && v12)
        {
          unsigned __int8 v14 = [v11 isEqualToString:v12];

          if (v14) {
            goto LABEL_16;
          }
        }
        else
        {
        }
      }
      id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return v6;
}

- (id)_creditAccountPhysicalCardsForAccountIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[NSDictionary objectForKey:](self->_prefetchedPhysicalCards, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_creditAccountUsersForAccountIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = -[NSDictionary objectForKey:](self->_prefetchedCreditAccountUsers, "objectForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)_accountUsersForAccountIdentifier:(id)a3 accessLevel:(unint64_t)a4
{
  if (a3)
  {
    id v5 = -[NSDictionary objectForKey:](self->_prefetchedCreditAccountUsers, "objectForKey:");
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100143678;
    v8[3] = &unk_100739BE8;
    v8[4] = a4;
    id v6 = [v5 objectsPassingTest:v8];
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (id)_unactivatedPhysicalCardForAltDSID:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAccount *)self->_prefetchedDefaultCreditAccount accountIdentifier];
  id v6 = [(PDUserEvaluationEnvironment *)self _creditAccountPhysicalCardsForAccountIdentifier:v5];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "accountUserAltDSID", (void)v19);
        id v13 = v4;
        id v14 = v12;
        id v15 = v14;
        if (v14 == v13)
        {
        }
        else
        {
          if (!v4 || !v14)
          {

LABEL_15:
            continue;
          }
          unsigned int v16 = [v13 isEqualToString:v14];

          if (!v16) {
            goto LABEL_15;
          }
        }
        id v17 = [v11 state];

        if (v17 == (id)1)
        {
          id v8 = v11;
          goto LABEL_18;
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }
LABEL_18:

  return v8;
}

- (BOOL)defaultCreditAccountHasMerchantIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = self;
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = [(PKAccount *)prefetchedDefaultCreditAccount associatedPassUniqueID];
  id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v5, 0);

  LOBYTE(v3) = [(PDDatabaseManager *)v3->_databaseManager hasAnyTransactionsWithMerchantIdentifiers:v7 forPassUniqueIdentifier:v6];
  return (char)v3;
}

- (BOOL)defaultCreditAccountHasMerchantIdentifier30Days:(id)a3
{
  if (!a3) {
    return 0;
  }
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = [(PKAccount *)prefetchedDefaultCreditAccount associatedPassUniqueID];
  id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v5, 0);

  id v8 = +[NSDate dateWithTimeIntervalSinceNow:-2592000.0];
  databaseManager = self->_databaseManager;
  uint64_t v10 = +[NSDate date];
  LOBYTE(databaseManager) = [(PDDatabaseManager *)databaseManager hasAnyTransactionsWithMerchantIdentifiers:v7 forPassUniqueIdentifier:v6 startDate:v8 endDate:v10];

  return (char)databaseManager;
}

- (BOOL)defaultCreditAccountHasMapsIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = self;
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = [(PKAccount *)prefetchedDefaultCreditAccount associatedPassUniqueID];
  id v7 = objc_alloc((Class)NSSet);
  id v8 = [v5 integerValue];

  uint64_t v9 = +[NSNumber numberWithInteger:v8];
  id v10 = objc_msgSend(v7, "initWithObjects:", v9, 0);

  LOBYTE(v3) = [(PDDatabaseManager *)v3->_databaseManager hasAnyTransactionsWithMapsIdentifiers:v10 forPassUniqueIdentifier:v6];
  return (char)v3;
}

- (BOOL)defaultCreditAccountHasMapsIdentifierLast30Days:(id)a3
{
  if (!a3) {
    return 0;
  }
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = [(PKAccount *)prefetchedDefaultCreditAccount associatedPassUniqueID];
  id v7 = objc_alloc((Class)NSSet);
  id v8 = [v5 integerValue];

  uint64_t v9 = +[NSNumber numberWithInteger:v8];
  id v10 = objc_msgSend(v7, "initWithObjects:", v9, 0);

  id v11 = +[NSDate dateWithTimeIntervalSinceNow:-2592000.0];
  databaseManager = self->_databaseManager;
  id v13 = +[NSDate date];
  LOBYTE(databaseManager) = [(PDDatabaseManager *)databaseManager hasAnyTransactionsWithMapsIdentifiers:v10 forPassUniqueIdentifier:v6 startDate:v11 endDate:v13];

  return (char)databaseManager;
}

- (BOOL)defaultCreditAccountHasMapsBrandIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = self;
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = [(PKAccount *)prefetchedDefaultCreditAccount associatedPassUniqueID];
  id v7 = objc_alloc((Class)NSSet);
  id v8 = [v5 integerValue];

  uint64_t v9 = +[NSNumber numberWithInteger:v8];
  id v10 = objc_msgSend(v7, "initWithObjects:", v9, 0);

  LOBYTE(v3) = [(PDDatabaseManager *)v3->_databaseManager hasAnyTransactionsWithMapsBrandIdentifiers:v10 forPassUniqueIdentifier:v6];
  return (char)v3;
}

- (BOOL)defaultCreditAccountHasMapsBrandIdentifierLast30Days:(id)a3
{
  if (!a3) {
    return 0;
  }
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = [(PKAccount *)prefetchedDefaultCreditAccount associatedPassUniqueID];
  id v7 = objc_alloc((Class)NSSet);
  id v8 = [v5 integerValue];

  uint64_t v9 = +[NSNumber numberWithInteger:v8];
  id v10 = objc_msgSend(v7, "initWithObjects:", v9, 0);

  id v11 = +[NSDate dateWithTimeIntervalSinceNow:-2592000.0];
  databaseManager = self->_databaseManager;
  id v13 = +[NSDate date];
  LOBYTE(databaseManager) = [(PDDatabaseManager *)databaseManager hasAnyTransactionsWithMapsBrandIdentifiers:v10 forPassUniqueIdentifier:v6 startDate:v11 endDate:v13];

  return (char)databaseManager;
}

- (BOOL)hasActivePromotionIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = [(PKAccount *)prefetchedDefaultCreditAccount accountIdentifier];
  id v7 = [(PDDatabaseManager *)self->_databaseManager accountPromotionForProgramIdentifier:v5 accountIdentifier:v6];

  if (v7) {
    BOOL v8 = [v7 state] == (id)2;
  }
  else {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)hasActivePromotionIdentifierExpiringSoon:(id)a3
{
  if (!a3) {
    return 0;
  }
  prefetchedDefaultCreditAccount = self->_prefetchedDefaultCreditAccount;
  id v5 = a3;
  id v6 = [(PKAccount *)prefetchedDefaultCreditAccount accountIdentifier];
  id v7 = [(PDDatabaseManager *)self->_databaseManager accountPromotionForProgramIdentifier:v5 accountIdentifier:v6];

  if (v7 && [v7 state] == (id)2) {
    unsigned __int8 v8 = [v7 expiringSoon];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (int64_t)defaultCreditAccountDaysUntilActivePromotionExpires:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_queriedDefaultCreditAccountDaysUntilActivePromotionExpires objectForKeyedSubscript:v4];
    id v6 = v5;
    if (v5) {
      int64_t v7 = (int64_t)[v5 integerValue];
    }
    else {
      int64_t v7 = -1;
    }
    uint64_t v8 = [(PKAccount *)self->_prefetchedDefaultCreditAccount accountIdentifier];
    uint64_t v9 = (void *)v8;
    if (!v6 && v8)
    {
      id v10 = [(PDDatabaseManager *)self->_databaseManager accountPromotionForProgramIdentifier:v4 accountIdentifier:v8];
      id v11 = v10;
      if (v10 && [v10 state] == (id)2)
      {
        id v12 = [v11 endDate];
        [v12 timeIntervalSinceNow];
        int64_t v7 = vcvtmd_s64_f64(v13 / 86400.0);
      }
      id v14 = +[NSNumber numberWithInteger:v7];
      [(NSMutableDictionary *)self->_queriedDefaultCreditAccountDaysUntilActivePromotionExpires setObject:v14 forKeyedSubscript:v4];
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

- (BOOL)hasMerchantIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v4, 0);

  LOBYTE(self) = [(PDDatabaseManager *)self->_databaseManager hasAnyTransactionsWithMerchantIdentifiers:v5];
  return (char)self;
}

- (BOOL)hasMapsIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = objc_alloc((Class)NSSet);
  id v6 = [v4 integerValue];

  int64_t v7 = +[NSNumber numberWithInteger:v6];
  id v8 = objc_msgSend(v5, "initWithObjects:", v7, 0);

  LOBYTE(self) = [(PDDatabaseManager *)self->_databaseManager hasAnyTransactionsWithMapsIdentifiers:v8];
  return (char)self;
}

- (BOOL)hasMapsBrandIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = objc_alloc((Class)NSSet);
  id v6 = [v4 integerValue];

  int64_t v7 = +[NSNumber numberWithInteger:v6];
  id v8 = objc_msgSend(v5, "initWithObjects:", v7, 0);

  LOBYTE(self) = [(PDDatabaseManager *)self->_databaseManager hasAnyTransactionsWithMapsBrandIdentifiers:v8];
  return (char)self;
}

- (BOOL)hasInstalledApp:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = a3;
  id v4 = objc_alloc((Class)LSApplicationRecord);
  id v5 = [v3 integerValue];

  id v6 = [v4 initWithStoreItemIdentifier:v5 error:0];
  int64_t v7 = v6;
  if (v6)
  {
    id v8 = [v6 applicationState];
    unsigned __int8 v9 = [v8 isInstalled];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)debugDescription
{
  +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", @"<%@: %p;\n",
    objc_opt_class(),
  id v3 = self);
  id v4 = v3;
  if (self->_isApplePayActive) {
    CFStringRef v5 = @"YES";
  }
  else {
    CFStringRef v5 = @"NO";
  }
  [v3 appendFormat:@"%@: '%@';\n", @"isApplePayActive", v5];
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"hasDefaultCreditAccount",
    self->_prefetchedDefaultCreditAccount);
  objc_msgSend(v4, "appendFormat:", @"%@: '%ld';\n",
    @"daysSinceOldestPaymentPassIngestDate",
    self->_daysSinceOldestPaymentPassIngestDate);
  objc_msgSend(v4, "appendFormat:", @"%@: '%ld';\n",
    @"daysSinceOldestCreditCardIngestDate",
    self->_daysSinceOldestPaymentPassIngestDate);
  if (self->_hasDefaultCreditAccountVirtualCardTransaction) {
    id v6 = &__kCFBooleanTrue;
  }
  else {
    id v6 = &__kCFBooleanFalse;
  }
  [v4 appendFormat:@"%@: '%@';\n", @"defaultCreditAccountHasVirtualCard", v6];
  objc_msgSend(v4, "appendFormat:", @"%@: '%ld';\n",
    @"defaultCreditAccountDaysSinceDisputeOpened",
    self->_defaultCreditAccountDaysSinceDisputeOpened);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"defaultCreditAccountMerchantIdentifiers",
    self->_queriedDefaultCreditAccountMerchantIdentifierPresence);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"defaultCreditAccountMerchantIdentifiersLast30Days",
    self->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"defaultCreditAccountMapsIdentifiers",
    self->_queriedDefaultCreditAccountMapsIdentifierPresence);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"defaultCreditAccountMapsIdentifiersLast30Days",
    self->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"defaultCreditAccountMapsBrandIdentifiers",
    self->_queriedDefaultCreditAccountMapsBrandIdentifierPresence);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"defaultCreditAccountMapsBrandIdentifiersLast30Days",
    self->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"defaultCreditAccountActivePromotionIdentifiers",
    self->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"defaultCreditAccountActivePromotionIdentifiersExpiringSoon",
    self->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"defaultCreditAccountDaysUntilActivePromotionExpires",
    self->_queriedDefaultCreditAccountDaysUntilActivePromotionExpires);
  [v4 appendFormat:@"%@: '%@';\n", @"passStyles", self->_passStyles];
  [v4 appendFormat:@"%@: '%@';\n", @"unexpiredPassStyles", self->_unexpiredPassStyles];
  [v4 appendFormat:@"%@: '%@';\n", @"secureElementCardTypes", self->_cardTypes];
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"unexpiredSecureElementCardTypes",
    self->_unexpiredCardTypes);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"transitNetworksPresent",
    self->_transitNetworksPresent);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"transitNetworksPresentAndUnexpired",
    self->_transitNetworksPresentAndUnexpired);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"merchantIdentifiers",
    self->_queriedMerchantIdentifierPresence);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"mapsIdentifiers",
    self->_queriedMapsIdentifierPresence);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"mapsBrandIdentifiers",
    self->_queriedMapsBrandIdentifierPresence);
  if (self->_hasPaymentTransaction) {
    int64_t v7 = &__kCFBooleanTrue;
  }
  else {
    int64_t v7 = &__kCFBooleanFalse;
  }
  [v4 appendFormat:@"%@: '%@';\n", @"hasPaymentTransaction", v7];
  if (self->_hasTransitTransaction) {
    id v8 = &__kCFBooleanTrue;
  }
  else {
    id v8 = &__kCFBooleanFalse;
  }
  [v4 appendFormat:@"%@: '%@';\n", @"hasTransitTransaction", v8];
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"discoveryItemsExpanded",
    self->_discoveryItemsExpanded);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"discoveryItemsDismissed",
    self->_discoveryItemsDismissed);
  [v4 appendFormat:@"%@: '%@';\n", @"discoveryCTAsTapped", self->_discoveryCTAsTapped];
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"discoveryCTAsCompleted",
    self->_discoveryCTAsCompleted);
  [v4 appendFormat:@"%@: '%@';\n", @"installedApps", self->_queriedAppIdentifierPresence];
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"supportedMarketsForCurrentLocation",
    self->_supportedMarketsForCurrentLocation);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"supportedTransitMarketsForCurrentLocation",
    self->_supportedTransitMarketsForCurrentLocation);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"supportedTransitNetworksForCurrentLocation",
    self->_supportedTransitNetworksForCurrentLocation);
  objc_msgSend(v4, "appendFormat:", @"%@: '%@';\n",
    @"expressTransitNetworksForCurrentLocation",
    self->_expressTransitNetworksForCurrentLocation);
  if (self->_hasTransitPassForCurrentLocation) {
    CFStringRef v9 = @"YES";
  }
  else {
    CFStringRef v9 = @"NO";
  }
  [v4 appendFormat:@"%@: '%@';\n", @"hasTransitPassForCurrentLocation", v9];
  if (self->_hasUnexpiredTransitPassForCurrentLocation) {
    CFStringRef v10 = @"YES";
  }
  else {
    CFStringRef v10 = @"NO";
  }
  [v4 appendFormat:@"%@: '%@';\n", @"hasUnexpiredTransitPassForCurrentLocation", v10];
  [v4 appendFormat:@"%@: '%@';\n", @"currentPlacemark", self->_currentPlacemark];
  [v4 appendFormat:@">"];
  return v4;
}

- (NSSet)sentTransitDCINotifications
{
  return self->_sentTransitDCINotifications;
}

- (NSSet)sentTransitOpenLoopUpgradeNotifications
{
  return self->_sentTransitOpenLoopUpgradeNotifications;
}

- (NSSet)sentTransitOpenLoopRenotifiedInMarketNotifications
{
  return self->_sentTransitOpenLoopRenotifiedInMarketNotifications;
}

- (NSSet)cardTypesWithExpressEnabled
{
  return self->_cardTypesWithExpressEnabled;
}

- (NSSet)supportedMarketsForCurrentLocation
{
  return self->_supportedMarketsForCurrentLocation;
}

- (NSSet)supportedTransitMarketsForCurrentLocation
{
  return self->_supportedTransitMarketsForCurrentLocation;
}

- (NSSet)supportedTransitNetworksForCurrentLocation
{
  return self->_supportedTransitNetworksForCurrentLocation;
}

- (NSSet)expressTransitNetworksForCurrentLocation
{
  return self->_expressTransitNetworksForCurrentLocation;
}

- (CLPlacemark)currentPlacemark
{
  return self->_currentPlacemark;
}

- (BOOL)hasTransitPassForCurrentLocation
{
  return self->_hasTransitPassForCurrentLocation;
}

- (BOOL)hasUnexpiredTransitPassForCurrentLocation
{
  return self->_hasUnexpiredTransitPassForCurrentLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressTransitNetworksForCurrentLocation, 0);
  objc_storeStrong((id *)&self->_supportedTransitNetworksForCurrentLocation, 0);
  objc_storeStrong((id *)&self->_supportedTransitMarketsForCurrentLocation, 0);
  objc_storeStrong((id *)&self->_supportedMarketsForCurrentLocation, 0);
  objc_storeStrong((id *)&self->_cardTypesWithExpressEnabled, 0);
  objc_storeStrong((id *)&self->_sentTransitOpenLoopRenotifiedInMarketNotifications, 0);
  objc_storeStrong((id *)&self->_sentTransitOpenLoopUpgradeNotifications, 0);
  objc_storeStrong((id *)&self->_sentTransitDCINotifications, 0);
  objc_storeStrong((id *)&self->_currentPlacemark, 0);
  objc_storeStrong((id *)&self->_latestValidLocation, 0);
  objc_storeStrong((id *)&self->_queriedAppIdentifierPresence, 0);
  objc_storeStrong((id *)&self->_queriedDefaultCreditAccountDaysUntilActivePromotionExpires, 0);
  objc_storeStrong((id *)&self->_queriedDefaultCreditAccountActivePromotionIdentifiersExpiringSoonPresence, 0);
  objc_storeStrong((id *)&self->_queriedDefaultCreditAccountActivePromotionIdentifiersPresence, 0);
  objc_storeStrong((id *)&self->_queriedDefaultCreditAccountMapsBrandIdentifierLast30DaysPresence, 0);
  objc_storeStrong((id *)&self->_queriedDefaultCreditAccountMapsBrandIdentifierPresence, 0);
  objc_storeStrong((id *)&self->_queriedDefaultCreditAccountMapsIdentifierLast30DaysPresence, 0);
  objc_storeStrong((id *)&self->_queriedDefaultCreditAccountMapsIdentifierPresence, 0);
  objc_storeStrong((id *)&self->_queriedDefaultCreditAccountMerchantIdentifierLast30DaysPresence, 0);
  objc_storeStrong((id *)&self->_queriedDefaultCreditAccountMerchantIdentifierPresence, 0);
  objc_storeStrong((id *)&self->_queriedMapsBrandIdentifierPresence, 0);
  objc_storeStrong((id *)&self->_queriedMapsIdentifierPresence, 0);
  objc_storeStrong((id *)&self->_queriedMerchantIdentifierPresence, 0);
  objc_storeStrong((id *)&self->_prefetchedEnrolledAuthenticationMechanisms, 0);
  objc_storeStrong((id *)&self->_prefetchedAppleBalanceAccount, 0);
  objc_storeStrong((id *)&self->_prefetchedPaymentOfferCatalog, 0);
  objc_storeStrong((id *)&self->_prefetchedSavingsAccount, 0);
  objc_storeStrong((id *)&self->_prefetchedPayLaterAccount, 0);
  objc_storeStrong((id *)&self->_prefetchedPayLaterFinancingPlans, 0);
  objc_storeStrong((id *)&self->_discoveryCTAsCompleted, 0);
  objc_storeStrong((id *)&self->_discoveryCTAsTapped, 0);
  objc_storeStrong((id *)&self->_discoveryItemsDismissed, 0);
  objc_storeStrong((id *)&self->_discoveryItemsExpanded, 0);
  objc_storeStrong((id *)&self->_discoveryItemStatus, 0);
  objc_storeStrong((id *)&self->_transitNetworksPresentAndUnexpired, 0);
  objc_storeStrong((id *)&self->_transitNetworksPresent, 0);
  objc_storeStrong((id *)&self->_unexpiredCardTypes, 0);
  objc_storeStrong((id *)&self->_cardTypes, 0);
  objc_storeStrong((id *)&self->_unexpiredPassStyles, 0);
  objc_storeStrong((id *)&self->_passStyles, 0);
  objc_storeStrong((id *)&self->_prefetchedFamilyMembers, 0);
  objc_storeStrong((id *)&self->_prefetchedSetupFeatures, 0);
  objc_storeStrong((id *)&self->_prefetchedPeerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_prefetchedCurrentCreditApplication, 0);
  objc_storeStrong((id *)&self->_prefetchedCreditApplications, 0);
  objc_storeStrong((id *)&self->_defaultPassUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_prefetchedDefaultCreditAccount, 0);
  objc_storeStrong((id *)&self->_prefetchedCreditAccountUsers, 0);
  objc_storeStrong((id *)&self->_prefetchedPhysicalCards, 0);
  objc_storeStrong((id *)&self->_prefetchedCreditAccounts, 0);
  objc_storeStrong((id *)&self->_bankConnectEvaluationManager, 0);
  objc_storeStrong((id *)&self->_discoveryManager, 0);
  objc_storeStrong((id *)&self->_expressPassManager, 0);
  objc_storeStrong((id *)&self->_familyCircleManager, 0);
  objc_storeStrong((id *)&self->_transitNotificationService, 0);
  objc_storeStrong((id *)&self->_paymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebServiceCoordinator, 0);
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_applyManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end