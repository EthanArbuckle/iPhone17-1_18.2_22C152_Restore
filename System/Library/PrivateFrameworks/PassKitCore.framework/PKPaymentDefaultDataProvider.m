@interface PKPaymentDefaultDataProvider
- (BOOL)isDeviceInRestrictedMode;
- (BOOL)secureElementIsProductionSigned;
- (BOOL)supportsAddingPaymentPasses;
- (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3;
- (BOOL)supportsInAppPaymentsForPass:(id)a3;
- (BOOL)supportsMessagesForPass:(id)a3;
- (BOOL)supportsNotificationsForPass:(id)a3;
- (BOOL)supportsTransactionsForPass:(id)a3;
- (NSString)defaultPaymentPassIdentifier;
- (NSString)secureElementIdentifier;
- (PKOSVersionRequirement)deviceVersion;
- (PKPaymentDataProviderDelegate)delegate;
- (PKPaymentDefaultDataProvider)init;
- (PKPaymentDefaultDataProvider)initWithPaymentService:(id)a3 secureElement:(id)a4;
- (PKPaymentWebService)paymentWebService;
- (id)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8;
- (id)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3;
- (id)expressPassConfigurations;
- (id)messagesAppLaunchTokenForPassWithUniqueIdentifier:(id)a3;
- (id)paymentRewardsBalanceWithIdentifier:(id)a3;
- (id)transactionsAppLaunchTokenForPassWithUniqueIdentifier:(id)a3;
- (id)transactionsForRequest:(id)a3;
- (int64_t)apiVersion;
- (void)_accessDelegatesWithHandler:(id)a3;
- (void)addDelegate:(id)a3;
- (void)approvedTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9;
- (void)archiveMessageWithIdentifier:(id)a3;
- (void)balanceReminderThresholdForBalance:(id)a3 pass:(id)a4 withCompletion:(id)a5;
- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)cancelAutoTopUpForPassWithUniqueIdentifier:(id)a3 balanceIdentifiers:(id)a4 completion:(id)a5;
- (void)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8 completion:(id)a9;
- (void)commutePlanReminderForCommutePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5;
- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4;
- (void)credential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5;
- (void)credentialWithIdentifier:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)deletePaymentTransactionWithIdentifier:(id)a3;
- (void)deletePaymentTransactionsWithIdentifiers:(id)a3;
- (void)didRemoveTransactionsWithSourceIdentifierMapping:(id)a3;
- (void)didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3;
- (void)didUpdateFamilyMembers:(id)a3;
- (void)familyMembersWithCompletion:(id)a3;
- (void)featureApplicationAdded:(id)a3;
- (void)featureApplicationChanged:(id)a3;
- (void)featureApplicationRemoved:(id)a3;
- (void)featureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4;
- (void)hasTransactionsForTransactionSourceIdentifiers:(id)a3 completion:(id)a4;
- (void)installmentPlanTransactionsForTransactionSourceIdentifiers:(id)a3 accountIdentifier:(id)a4 redeemed:(BOOL)a5 withRedemptionType:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 completion:(id)a9;
- (void)installmentPlansWithTransactionReferenceIdentifier:(id)a3 completion:(id)a4;
- (void)installmentTransactionsForInstallmentPlanIdentifier:(id)a3 completion:(id)a4;
- (void)issuerInstallmentTransactionsForTransactionSourceIdentifiers:(id)a3 paymentHashes:(id)a4 completion:(id)a5;
- (void)mapsMerchantsWithCompletion:(id)a3;
- (void)messagesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)passUpgradeWithRequest:(id)a3 pass:(id)a4 visibleViewController:(id)a5 completion:(id)a6;
- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4;
- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 completion:(id)a5;
- (void)peerPaymentCounterpartHandlesForTransactionSourceIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6;
- (void)pendingTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9;
- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4;
- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4;
- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6;
- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5;
- (void)setDefaultPaymentPassIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpressWithPassConfiguration:(id)a3 credential:(id)a4 completion:(id)a5;
- (void)setHideCardBenefitPayLater:(BOOL)a3;
- (void)setHideCardBenefitRewards:(BOOL)a3;
- (void)setHidePayLaterOptions:(BOOL)a3;
- (void)setOrderManagementDisabled:(BOOL)a3;
- (void)setOrderManagementNotificationsDisabled:(BOOL)a3;
- (void)setPaymentHandoffDisabled:(BOOL)a3;
- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3;
- (void)sharingCapabilitiesForPassIdentifier:(id)a3 outHasShares:(BOOL *)a4 outHasShareableEntitlements:(BOOL *)a5;
- (void)submitTransactionAnswerForTransaction:(id)a3 questionType:(unint64_t)a4 answer:(id)a5 completion:(id)a6;
- (void)tilesForPassWithUniqueIdentifier:(id)a3 context:(int64_t)a4 completion:(id)a5;
- (void)transactionCountByPeriodForRequest:(id)a3 calendar:(id)a4 calendarUnit:(unint64_t)a5 includePurchaseTotal:(BOOL)a6 completion:(id)a7;
- (void)transactionReceiptForTransactionWithIdentifier:(id)a3 updateIfNecessary:(BOOL)a4 completion:(id)a5;
- (void)transactionReceiptWithUniqueID:(id)a3 completion:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
- (void)transactionTagsForTransactionWithIdentifier:(id)a3 completion:(id)a4;
- (void)transactionWithIdentifier:(id)a3 didDownloadTransactionReceipt:(id)a4;
- (void)transactionWithReferenceIdentifier:(id)a3 completion:(id)a4;
- (void)transactionWithServiceIdentifier:(id)a3 completion:(id)a4;
- (void)transactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5;
- (void)transactionsForRequest:(id)a3 completion:(id)a4;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 matchingMerchant:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withMerchantCategory:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withPeerPaymentCounterpartHandles:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6 completion:(id)a7;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10;
- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionType:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10;
- (void)transactionsRequiringReviewForAccountWithIdentifier:(id)a3 completion:(id)a4;
- (void)transactionsTotalAmountForRequest:(id)a3 completion:(id)a4;
- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5;
@end

@implementation PKPaymentDefaultDataProvider

- (PKPaymentDefaultDataProvider)init
{
  v3 = objc_alloc_init(PKSecureElement);
  v4 = [(PKPaymentDefaultDataProvider *)self initWithPaymentService:0 secureElement:v3];

  if (v4)
  {
    v5 = [[PKPaymentService alloc] initWithDelegate:v4];
    paymentService = v4->_paymentService;
    v4->_paymentService = v5;
  }
  return v4;
}

- (PKPaymentDefaultDataProvider)initWithPaymentService:(id)a3 secureElement:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPaymentDefaultDataProvider;
  v9 = [(PKPaymentDefaultDataProvider *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_secureElement, a4);
    objc_storeStrong((id *)&v10->_paymentService, a3);
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    delegates = v10->_delegates;
    v10->_delegates = (NSHashTable *)v11;

    v10->_delegateLock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.passkitcore.paymentdataprovider.replyQueue", 0);
    replyQueue = v10->_replyQueue;
    v10->_replyQueue = (OS_dispatch_queue *)v13;
  }
  return v10;
}

- (void)dealloc
{
  [(PKPaymentService *)self->_paymentService setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentDefaultDataProvider;
  [(PKPaymentDefaultDataProvider *)&v3 dealloc];
}

- (PKPaymentWebService)paymentWebService
{
  paymentWebService = self->_paymentWebService;
  if (!paymentWebService)
  {
    v4 = +[PKPaymentWebService sharedService];
    v5 = self->_paymentWebService;
    self->_paymentWebService = v4;

    paymentWebService = self->_paymentWebService;
  }
  return paymentWebService;
}

- (int64_t)apiVersion
{
  return 2;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained != obj)
  {
    if (WeakRetained) {
      [(PKPaymentDefaultDataProvider *)self removeDelegate:WeakRetained];
    }
    objc_storeWeak((id *)&self->_delegate, obj);
    if (obj) {
      -[PKPaymentDefaultDataProvider addDelegate:](self, "addDelegate:");
    }
  }
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_delegateLock);
    [(NSHashTable *)self->_delegates addObject:v4];
    os_unfair_lock_unlock(&self->_delegateLock);
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_delegateLock);
    [(NSHashTable *)self->_delegates removeObject:v4];
    os_unfair_lock_unlock(&self->_delegateLock);
  }
}

- (void)_accessDelegatesWithHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_delegateLock);
    v5 = [(NSHashTable *)self->_delegates allObjects];
    os_unfair_lock_unlock(&self->_delegateLock);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__PKPaymentDefaultDataProvider__accessDelegatesWithHandler___block_invoke;
    v8[3] = &unk_1E56D8A18;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

void __60__PKPaymentDefaultDataProvider__accessDelegatesWithHandler___block_invoke(uint64_t a1)
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

- (BOOL)isDeviceInRestrictedMode
{
  return [(PKSecureElement *)self->_secureElement isInRestrictedMode];
}

- (NSString)defaultPaymentPassIdentifier
{
  return [(PKPaymentService *)self->_paymentService defaultPaymentPassUniqueIdentifier];
}

- (id)expressPassConfigurations
{
  return [(PKPaymentService *)self->_paymentService expressPassConfigurations];
}

- (NSString)secureElementIdentifier
{
  return [(PKSecureElement *)self->_secureElement primarySecureElementIdentifier];
}

- (BOOL)secureElementIsProductionSigned
{
  return [(PKSecureElement *)self->_secureElement isProductionSigned];
}

- (id)transactionsAppLaunchTokenForPassWithUniqueIdentifier:(id)a3
{
  return [(PKPaymentService *)self->_paymentService transactionsAppLaunchTokenForPassWithUniqueIdentifier:a3];
}

- (id)defaultPaymentApplicationForPassUniqueIdentifier:(id)a3
{
  return [(PKPaymentService *)self->_paymentService defaultPaymentApplicationForPassUniqueIdentifier:a3];
}

- (PKOSVersionRequirement)deviceVersion
{
  return (PKOSVersionRequirement *)+[PKOSVersionRequirement fromDeviceVersion];
}

- (void)setPaymentHandoffDisabled:(BOOL)a3
{
}

- (void)setOrderManagementDisabled:(BOOL)a3
{
}

- (void)setOrderManagementNotificationsDisabled:(BOOL)a3
{
}

- (void)setDefaultPaymentPassIdentifier:(id)a3
{
}

- (void)conflictingExpressPassIdentifiersForPassConfiguration:(id)a3 withCompletion:(id)a4
{
}

- (void)setExpressWithPassConfiguration:(id)a3 credential:(id)a4 completion:(id)a5
{
}

- (void)passUpgradeWithRequest:(id)a3 pass:(id)a4 visibleViewController:(id)a5 completion:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = +[PKPaymentWebService sharedService];
  uint64_t v12 = [v11 targetDevice];
  [v12 noteProvisioningDidBegin];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__PKPaymentDefaultDataProvider_passUpgradeWithRequest_pass_visibleViewController_completion___block_invoke;
  v15[3] = &unk_1E56EC748;
  id v16 = v12;
  id v17 = v8;
  id v13 = v12;
  id v14 = v8;
  [v13 paymentWebService:v11 requestPassUpgrade:v10 pass:v9 completion:v15];
}

uint64_t __93__PKPaymentDefaultDataProvider_passUpgradeWithRequest_pass_visibleViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void **)(a1 + 32);
  return [v3 noteProvisioningDidEnd];
}

- (void)removeExpressPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
}

- (void)transitStateWithPassUniqueIdentifier:(id)a3 paymentApplication:(id)a4 completion:(id)a5
{
}

- (void)credentialWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)setDefaultPaymentApplication:(id)a3 forPassUniqueIdentifier:(id)a4 completion:(id)a5
{
}

- (void)peerPaymentCounterpartHandlesForTransactionSourceIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
}

- (void)hasTransactionsForTransactionSourceIdentifiers:(id)a3 completion:(id)a4
{
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 orderedByDate:(int64_t)a8 limit:(int64_t)a9 completion:(id)a10
{
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 limit:(int64_t)a6 completion:(id)a7
{
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withPeerPaymentCounterpartHandles:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8
{
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 matchingMerchant:(id)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 limit:(int64_t)a7 completion:(id)a8
{
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withMerchantCategory:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10
{
}

- (void)transactionsForTransactionSourceIdentifiers:(id)a3 withTransactionType:(int64_t)a4 withTransactionSource:(unint64_t)a5 withBackingData:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 limit:(int64_t)a9 completion:(id)a10
{
}

- (void)pendingTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
}

- (void)approvedTransactionsForTransactionSourceIdentifiers:(id)a3 withTransactionSource:(unint64_t)a4 withBackingData:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7 limit:(int64_t)a8 completion:(id)a9
{
}

- (void)transactionCountByPeriodForRequest:(id)a3 calendar:(id)a4 calendarUnit:(unint64_t)a5 includePurchaseTotal:(BOOL)a6 completion:(id)a7
{
}

- (void)transactionsForRequest:(id)a3 completion:(id)a4
{
}

- (id)transactionsForRequest:(id)a3
{
  return [(PKPaymentService *)self->_paymentService transactionsForRequest:a3];
}

- (void)transactionsTotalAmountForRequest:(id)a3 completion:(id)a4
{
}

- (void)transactionWithServiceIdentifier:(id)a3 completion:(id)a4
{
}

- (void)transactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4 completion:(id)a5
{
}

- (void)transactionWithReferenceIdentifier:(id)a3 completion:(id)a4
{
}

- (void)installmentTransactionsForInstallmentPlanIdentifier:(id)a3 completion:(id)a4
{
}

- (void)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8 completion:(id)a9
{
}

- (id)cashbackByPeriodForTransactionSourceIdentifiers:(id)a3 withStartDate:(id)a4 endDate:(id)a5 calendar:(id)a6 calendarUnit:(unint64_t)a7 type:(unint64_t)a8
{
  return [(PKPaymentService *)self->_paymentService cashbackByPeriodForTransactionSourceIdentifiers:a3 withStartDate:a4 endDate:a5 calendar:a6 calendarUnit:a7 type:a8];
}

- (void)transactionsRequiringReviewForAccountWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)submitTransactionAnswerForTransaction:(id)a3 questionType:(unint64_t)a4 answer:(id)a5 completion:(id)a6
{
}

- (void)installmentPlansWithTransactionReferenceIdentifier:(id)a3 completion:(id)a4
{
}

- (void)installmentPlanTransactionsForTransactionSourceIdentifiers:(id)a3 accountIdentifier:(id)a4 redeemed:(BOOL)a5 withRedemptionType:(unint64_t)a6 startDate:(id)a7 endDate:(id)a8 completion:(id)a9
{
}

- (void)transactionReceiptWithUniqueID:(id)a3 completion:(id)a4
{
}

- (void)transactionReceiptForTransactionWithIdentifier:(id)a3 updateIfNecessary:(BOOL)a4 completion:(id)a5
{
}

- (void)transactionTagsForTransactionWithIdentifier:(id)a3 completion:(id)a4
{
}

- (void)mapsMerchantsWithCompletion:(id)a3
{
}

- (void)deletePaymentTransactionWithIdentifier:(id)a3
{
}

- (void)deletePaymentTransactionsWithIdentifiers:(id)a3
{
}

- (void)balancesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
}

- (void)plansForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
}

- (void)balanceReminderThresholdForBalance:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
}

- (void)setBalanceReminder:(id)a3 forBalance:(id)a4 pass:(id)a5 completion:(id)a6
{
}

- (void)cancelAutoTopUpForPassWithUniqueIdentifier:(id)a3 balanceIdentifiers:(id)a4 completion:(id)a5
{
}

- (void)commutePlanReminderForCommutePlan:(id)a3 pass:(id)a4 withCompletion:(id)a5
{
}

- (void)setCommutePlanReminder:(id)a3 forCommutePlan:(id)a4 pass:(id)a5 completion:(id)a6
{
}

- (void)messagesForPaymentPassWithUniqueIdentifier:(id)a3 completion:(id)a4
{
}

- (void)archiveMessageWithIdentifier:(id)a3
{
}

- (id)messagesAppLaunchTokenForPassWithUniqueIdentifier:(id)a3
{
  return [(PKPaymentService *)self->_paymentService messagesAppLaunchTokenForPassWithUniqueIdentifier:a3];
}

- (BOOL)supportsTransactionsForPass:(id)a3
{
  uint64_t v4 = [a3 secureElementPass];
  if ([v4 isAccessPass])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    uint64_t v6 = [(PKPaymentWebService *)self->_paymentWebService targetDevice];
    long long v7 = [v6 secureElementIdentifiers];
    int v5 = [v4 isPrecursorPass:v7] ^ 1;
  }
  return v5;
}

- (BOOL)supportsMessagesForPass:(id)a3
{
  return 1;
}

- (BOOL)supportsNotificationsForPass:(id)a3
{
  return 1;
}

- (BOOL)supportsInAppPaymentsForPass:(id)a3
{
  uint64_t v3 = [a3 paymentPass];
  uint64_t v4 = [v3 deviceInAppPaymentApplications];
  BOOL v5 = [v4 count] != 0;

  return v5;
}

- (BOOL)supportsExpressForAutomaticSelectionTechnologyType:(int64_t)a3
{
  return +[PKSecureElement supportsExpressForAutomaticSelectionTechnologyType:a3];
}

- (BOOL)supportsAddingPaymentPasses
{
  return 1;
}

- (void)familyMembersWithCompletion:(id)a3
{
}

- (void)photosForFamilyMembersWithDSIDs:(id)a3 completion:(id)a4
{
}

- (void)featureApplicationsForAccountIdentifier:(id)a3 completion:(id)a4
{
}

- (void)issuerInstallmentTransactionsForTransactionSourceIdentifiers:(id)a3 paymentHashes:(id)a4 completion:(id)a5
{
}

- (id)paymentRewardsBalanceWithIdentifier:(id)a3
{
  return [(PKPaymentService *)self->_paymentService paymentRewardsBalanceWithIdentifier:a3];
}

- (void)paymentRewardsRedemptionsForPassUniqueIdentifier:(id)a3 paymentHashes:(id)a4 completion:(id)a5
{
}

- (void)tilesForPassWithUniqueIdentifier:(id)a3 context:(int64_t)a4 completion:(id)a5
{
}

- (void)sharingCapabilitiesForPassIdentifier:(id)a3 outHasShares:(BOOL *)a4 outHasShareableEntitlements:(BOOL *)a5
{
}

- (void)setHidePayLaterOptions:(BOOL)a3
{
}

- (void)setHideCardBenefitPayLater:(BOOL)a3
{
}

- (void)setHideCardBenefitRewards:(BOOL)a3
{
}

- (void)didUpdateDefaultPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__PKPaymentDefaultDataProvider_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E56EC770;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v6];
}

void __80__PKPaymentDefaultDataProvider_didUpdateDefaultPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didUpdateDefaultPaymentPassWithUniqueIdentifier:*(void *)(a1 + 32)];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableMessageService:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke;
  v8[3] = &unk_1E56EC798;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v8];
}

void __88__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didEnableMessageService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didEnableMessageService:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didReceiveMessage___block_invoke;
  v10[3] = &unk_1E56EC7C0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v10];
}

void __82__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didReceiveMessage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didReceiveMessage:*(void *)(a1 + 40)];
  }
}

- (void)passWithUniqueIdentifier:(id)a3 didUpdateTiles:(id)a4 forContext:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__PKPaymentDefaultDataProvider_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke;
  v12[3] = &unk_1E56EC7E8;
  id v13 = v8;
  id v14 = v9;
  int64_t v15 = a5;
  id v10 = v9;
  id v11 = v8;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v12];
}

void __83__PKPaymentDefaultDataProvider_passWithUniqueIdentifier_didUpdateTiles_forContext___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 passWithUniqueIdentifier:a1[4] didUpdateTiles:a1[5] forContext:a1[6]];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __92__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke;
  v8[3] = &unk_1E56EC798;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v8];
}

void __92__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didEnableTransactionService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didEnableTransactionService:*(unsigned __int8 *)(a1 + 40)];
  }
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __82__PKPaymentDefaultDataProvider_transactionSourceIdentifier_didReceiveTransaction___block_invoke;
  v10[3] = &unk_1E56EC7C0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v10];
}

void __82__PKPaymentDefaultDataProvider_transactionSourceIdentifier_didReceiveTransaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transactionSourceIdentifier:*(void *)(a1 + 32) didReceiveTransaction:*(void *)(a1 + 40)];
  }
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __95__PKPaymentDefaultDataProvider_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke;
  v10[3] = &unk_1E56EC7C0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v10];
}

void __95__PKPaymentDefaultDataProvider_transactionSourceIdentifier_didRemoveTransactionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transactionSourceIdentifier:*(void *)(a1 + 32) didRemoveTransactionWithIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)didRemoveTransactionsWithSourceIdentifierMapping:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__PKPaymentDefaultDataProvider_didRemoveTransactionsWithSourceIdentifierMapping___block_invoke;
  v6[3] = &unk_1E56EC770;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v6];
}

void __81__PKPaymentDefaultDataProvider_didRemoveTransactionsWithSourceIdentifierMapping___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didRemoveTransactionsWithSourceIdentifierMapping:*(void *)(a1 + 32)];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateWithTransitPassProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __99__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke;
  v10[3] = &unk_1E56EC7C0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v10];
}

void __99__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didUpdateWithTransitPassProperties___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    [v5 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didUpdateWithTransitPassProperties:*(void *)(a1 + 40)];
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) felicaProperties];
    [v5 paymentPassWithUniqueIdentifier:v3 didUpdateWithFelicaPassProperties:v4];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceiveBalanceUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke;
  v10[3] = &unk_1E56EC7C0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v10];
}

void __88__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didReceiveBalanceUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didReceiveBalanceUpdate:*(void *)(a1 + 40)];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didReceivePlanUpdate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __85__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke;
  v10[3] = &unk_1E56EC7C0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v10];
}

void __85__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didReceivePlanUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:*(void *)(a1 + 32) didReceivePlanUpdate:*(void *)(a1 + 40)];
  }
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didUpdateBalanceReminder:(id)a4 forBalanceWithIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __114__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke;
  v14[3] = &unk_1E56EC810;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v14];
}

void __114__PKPaymentDefaultDataProvider_paymentPassWithUniqueIdentifier_didUpdateBalanceReminder_forBalanceWithIdentifier___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentPassWithUniqueIdentifier:a1[4] didUpdateBalanceReminder:a1[5] forBalanceWithIdentifier:a1[6]];
  }
}

- (void)sharesDidUpdateWithPaymentPassWithUniqueIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__PKPaymentDefaultDataProvider_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke;
  v6[3] = &unk_1E56EC770;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v6];
}

void __83__PKPaymentDefaultDataProvider_sharesDidUpdateWithPaymentPassWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 sharesDidUpdateWithPaymentPassWithUniqueIdentifier:*(void *)(a1 + 32)];
  }
}

- (void)credential:(id)a3 forPaymentApplication:(id)a4 didUpdateRangingSuspensionReasons:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __99__PKPaymentDefaultDataProvider_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke;
  v12[3] = &unk_1E56EC7E8;
  id v13 = v8;
  id v14 = v9;
  unint64_t v15 = a5;
  id v10 = v9;
  id v11 = v8;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v12];
}

void __99__PKPaymentDefaultDataProvider_credential_forPaymentApplication_didUpdateRangingSuspensionReasons___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 credential:a1[4] forPaymentApplication:a1[5] didUpdateRangingSuspensionReasons:a1[6]];
  }
}

- (void)transactionWithIdentifier:(id)a3 didDownloadTransactionReceipt:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __88__PKPaymentDefaultDataProvider_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke;
  v10[3] = &unk_1E56EC7C0;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v10];
}

void __88__PKPaymentDefaultDataProvider_transactionWithIdentifier_didDownloadTransactionReceipt___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 transactionWithIdentifier:*(void *)(a1 + 32) didDownloadTransactionReceipt:*(void *)(a1 + 40)];
  }
}

- (void)featureApplicationAdded:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__PKPaymentDefaultDataProvider_featureApplicationAdded___block_invoke;
  v6[3] = &unk_1E56EC770;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v6];
}

void __56__PKPaymentDefaultDataProvider_featureApplicationAdded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureApplicationAdded:*(void *)(a1 + 32)];
  }
}

- (void)featureApplicationChanged:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PKPaymentDefaultDataProvider_featureApplicationChanged___block_invoke;
  v6[3] = &unk_1E56EC770;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v6];
}

void __58__PKPaymentDefaultDataProvider_featureApplicationChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureApplicationChanged:*(void *)(a1 + 32)];
  }
}

- (void)featureApplicationRemoved:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__PKPaymentDefaultDataProvider_featureApplicationRemoved___block_invoke;
  v6[3] = &unk_1E56EC770;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v6];
}

void __58__PKPaymentDefaultDataProvider_featureApplicationRemoved___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 featureApplicationRemoved:*(void *)(a1 + 32)];
  }
}

- (void)didUpdateFamilyMembers:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PKPaymentDefaultDataProvider_didUpdateFamilyMembers___block_invoke;
  v6[3] = &unk_1E56EC770;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentDefaultDataProvider *)self _accessDelegatesWithHandler:v6];
}

void __55__PKPaymentDefaultDataProvider_didUpdateFamilyMembers___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 didUpdateFamilyMembers:*(void *)(a1 + 32)];
  }
}

- (PKPaymentDataProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKPaymentDataProviderDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_secureElement, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end