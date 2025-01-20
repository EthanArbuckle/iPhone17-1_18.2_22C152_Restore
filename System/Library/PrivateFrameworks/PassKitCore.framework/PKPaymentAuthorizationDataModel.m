@interface PKPaymentAuthorizationDataModel
- (BOOL)canAddPasses;
- (BOOL)canSupportDisbursementsOnRemoteDevice:(id)a3;
- (BOOL)canSupportMerchantCategoryCodeAccordingToWebService:(id)a3 forPass:(id)a4;
- (BOOL)canSupportMerchantCategoryCodeAccordingToWebService:(id)a3 forPaymentInstrument:(id)a4;
- (BOOL)hasAnyPayLaterOptions;
- (BOOL)isHideMyEmailLoading;
- (BOOL)isInlineSummaryItemsEligible;
- (BOOL)isShippingEditable;
- (BOOL)isValidWithError:(id *)a3;
- (BOOL)isValidWithError:(id *)a3 errorStatus:(int64_t *)a4;
- (BOOL)pinRequired;
- (BOOL)praguePolicyRequired;
- (BOOL)shouldShowPeerPaymentBalanceToggle;
- (BOOL)shouldUpdateContactDataItem;
- (BOOL)supportsEmptyPass;
- (BOOL)supportsPreservePeerPaymentBalance;
- (BOOL)usePeerPaymentBalance;
- (BOOL)wantsInstructions;
- (CNContact)billingAddress;
- (CNContact)cachedRecentAddress;
- (CNContact)originalShippingAddress;
- (CNContact)shippingAddress;
- (CNContact)shippingEmail;
- (CNContact)shippingName;
- (CNContact)shippingPhone;
- (NSArray)acceptedPasses;
- (NSArray)allErrors;
- (NSArray)allNearbyRemoteDevices;
- (NSArray)allRemoteDevices;
- (NSArray)allUnavailableRemoteDevices;
- (NSArray)items;
- (NSArray)paymentContactFormatErrors;
- (NSArray)paymentContentItems;
- (NSArray)paymentErrors;
- (NSArray)paymentSummaryItems;
- (NSArray)pendingTransactions;
- (NSArray)remoteDevices;
- (NSArray)unavailablePasses;
- (NSDecimalNumber)initialTransactionAmount;
- (NSDecimalNumber)installmentAuthorizationAmount;
- (NSDecimalNumber)transactionAmount;
- (NSMutableSet)primaryAccountIdentifiersWithConnectedCardStateSet;
- (NSSet)allAcceptedRemotePaymentInstruments;
- (NSSet)allUnavailableRemotePaymentInstruments;
- (NSString)billingAgreement;
- (NSString)bundleIdentifier;
- (NSString)couponCode;
- (NSString)currencyCode;
- (NSString)defaultPaymentPassUniqueIdentifier;
- (NSString)hostAppLocalizedName;
- (NSString)hostApplicationIdentifier;
- (NSString)installmentBindToken;
- (NSString)installmentGroupIdentifier;
- (NSString)merchantName;
- (NSString)relevantPassUniqueID;
- (NSString)shippingEditableMessage;
- (NSString)shippingType;
- (NSString)teamIdentifier;
- (PKBankAccountInformation)bankAccount;
- (PKContactFormatValidator)contactFormatValidator;
- (PKCurrencyAmount)peerPaymentBalanceForAccountPayment;
- (PKPassLibrary)library;
- (PKPayLaterFinancingController)financingController;
- (PKPayLaterFinancingOption)previouslySelectedFinancingOption;
- (PKPayLaterFinancingOption)selectedFinancingOption;
- (PKPayLaterProductAssessmentCollection)assessmentCollection;
- (PKPayment)payment;
- (PKPaymentApplication)paymentApplication;
- (PKPaymentAuthorizationDataModel)init;
- (PKPaymentAuthorizationDataModel)initWithMode:(int64_t)a3;
- (PKPaymentInstructions)instructions;
- (PKPaymentOffersController)paymentOffersController;
- (PKPaymentOptionsDefaults)defaults;
- (PKPaymentOptionsRecents)recents;
- (PKPaymentOrderDetails)pendingOrderDetails;
- (PKPaymentPass)appleCardPass;
- (PKPaymentPass)pass;
- (PKPaymentPass)peerPaymentPass;
- (PKPaymentRequest)paymentRequest;
- (PKPaymentSummaryItem)totalSummaryItem;
- (PKPaymentWebService)paymentWebService;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (PKPeerPaymentQuote)peerPaymentQuote;
- (PKPeerPaymentService)peerPaymentService;
- (PKRemoteDevice)remoteDevice;
- (PKRemotePaymentInstrument)initialRemotePaymentInstrument;
- (PKRemotePaymentInstrument)remotePaymentInstrument;
- (PKSelectedPaymentOffer)selectedPaymentOffer;
- (PKShippingMethod)shippingMethod;
- (id)_additionalEligiblePaymentPassesForPaymentRequest:(id)a3;
- (id)_billingAddressKey;
- (id)_defaultSelectedPaymentApplicationForPaymentApplications:(id)a3;
- (id)_filterAndProcessPaymentApplicationsUsingConfiguration:(id)a3 withPrimaryPaymentApplication:(id)a4 passHasAssociatedPeerPaymentAccount:(BOOL)a5;
- (id)_filterAndProcessPaymentPassesUsingConfiguration:(id)a3 additionalPaymentPasses:(id)a4;
- (id)_formatAddressContactIfNecessary:(id)a3;
- (id)_inAppPaymentPassesForPaymentRequest:(id)a3;
- (id)_inAppPrivateLabelPaymentPasses;
- (id)acceptedPaymentApplicationsForPass:(id)a3;
- (id)acceptedPaymentApplicationsForRemoteInstrument:(id)a3;
- (id)acceptedRemotePaymentInstrumentsForRemoteDevice:(id)a3;
- (id)automaticallyPresentedPassFromAcceptedPasses:(id)a3;
- (id)defaultSelectedPaymentApplicationForPass:(id)a3;
- (id)defaultSelectedPaymentApplicationForRemoteInstrument:(id)a3;
- (id)enhancedMerchantInfoForPass:(id)a3;
- (id)itemForType:(int64_t)a3;
- (id)paymentErrorsFromLegacyStatus:(int64_t)a3;
- (id)paymentRequestSupportedQuery;
- (id)paymentRequestSupportedRemoteQuery;
- (id)unavailablePaymentApplicationsForPass:(id)a3;
- (id)unavailablePaymentApplicationsForRemoteInstrument:(id)a3;
- (id)updateHandler;
- (int64_t)_displayOrderForDataType:(int64_t)a3;
- (int64_t)_statusForPass:(id)a3;
- (int64_t)fundingMode;
- (int64_t)mode;
- (int64_t)requestedMode;
- (unint64_t)_insertionIndexForItem:(id)a3;
- (unint64_t)connectedCardStateForPass:(id)a3;
- (unint64_t)numberOfOutstandingCouponCodeUpdates;
- (void)_didSetItemForClass:(Class)a3;
- (void)_ensureItemForClass:(Class)a3;
- (void)_ensureItems;
- (void)_ensurePaymentContentItems;
- (void)_ensurePlaceholderItems;
- (void)_notifyModelChanged;
- (void)_populateFinanceKitBalancesIfNecessaryForPasses:(id)a3;
- (void)_populatePeerPaymentBalanceIfNecessaryForPasses:(id)a3;
- (void)_removeDataItem:(id)a3;
- (void)_setDataItem:(id)a3;
- (void)_setPaymentContentDataItems:(id)a3;
- (void)_setStatus:(int64_t)a3 forPass:(id)a4;
- (void)_updatePaymentOfferDataItem;
- (void)_updatePeerPaymentPromotionAvailability;
- (void)beginUpdates;
- (void)endUpdates;
- (void)fallbackToBypassMode;
- (void)paymentOffersDidUpdate;
- (void)recomputeHasAnyPayLaterOptions;
- (void)refreshBillingAddressErrors;
- (void)refreshPaymentMethods;
- (void)refreshPaymentMethodsAndNotifyFinancingController:(BOOL)a3;
- (void)setAssessmentCollection:(id)a3;
- (void)setAutomaticReloadPaymentRequest:(id)a3;
- (void)setBankAccount:(id)a3;
- (void)setBillingAddress:(id)a3;
- (void)setBillingAgreement:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCachedRecentAddress:(id)a3;
- (void)setCanAddPasses:(BOOL)a3;
- (void)setContactFormatValidator:(id)a3;
- (void)setCouponCode:(id)a3;
- (void)setCouponCodeErrors:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDeferredPaymentRequest:(id)a3;
- (void)setEnhancedMerchantInfo:(id)a3 forPass:(id)a4;
- (void)setFinancingController:(id)a3;
- (void)setFundingMode:(int64_t)a3;
- (void)setHasAnyPayLaterOptions:(BOOL)a3;
- (void)setHostAppLocalizedName:(id)a3;
- (void)setHostApplicationIdentifier:(id)a3;
- (void)setInitialRemotePaymentInstrument:(id)a3;
- (void)setInstallmentAuthorizationAmount:(id)a3;
- (void)setInstallmentBindToken:(id)a3;
- (void)setInstallmentGroupIdentifier:(id)a3;
- (void)setInstructions:(id)a3;
- (void)setIsHideMyEmailLoading:(BOOL)a3;
- (void)setLibrary:(id)a3;
- (void)setMultiTokenContexts:(id)a3;
- (void)setNumberOfOutstandingCouponCodeUpdates:(unint64_t)a3;
- (void)setOriginalShippingAddress:(id)a3;
- (void)setPass:(id)a3;
- (void)setPass:(id)a3 withSelectedPaymentApplication:(id)a4;
- (void)setPayment:(id)a3;
- (void)setPaymentApplication:(id)a3;
- (void)setPaymentContentItems:(id)a3;
- (void)setPaymentDateForPaymentRequest:(id)a3;
- (void)setPaymentErrors:(id)a3;
- (void)setPaymentOffersController:(id)a3;
- (void)setPaymentPassWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4;
- (void)setPaymentRequest:(id)a3;
- (void)setPaymentSummaryItems:(id)a3;
- (void)setPaymentWebService:(id)a3;
- (void)setPeerPaymentAccount:(id)a3;
- (void)setPeerPaymentBalanceForAccountPayment:(id)a3;
- (void)setPeerPaymentPass:(id)a3;
- (void)setPeerPaymentQuote:(id)a3;
- (void)setPeerPaymentService:(id)a3;
- (void)setPendingOrderDetails:(id)a3;
- (void)setPendingTransactions:(id)a3;
- (void)setPreviouslySelectedFinancingOption:(id)a3;
- (void)setRecents:(id)a3;
- (void)setRecurringPaymentRequest:(id)a3;
- (void)setRelevantPassUniqueID:(id)a3;
- (void)setRemoteDevice:(id)a3;
- (void)setRemotePaymentInstrument:(id)a3;
- (void)setRemotePaymentInstrument:(id)a3 withSelectedPaymentApplication:(id)a4;
- (void)setSelectedFinancingOption:(id)a3;
- (void)setSelectedPaymentOffer:(id)a3;
- (void)setShippingAddress:(id)a3;
- (void)setShippingAddressErrors:(id)a3;
- (void)setShippingEditable:(BOOL)a3;
- (void)setShippingEditableMessage:(id)a3;
- (void)setShippingEmail:(id)a3;
- (void)setShippingEmailError:(id)a3;
- (void)setShippingMethod:(id)a3;
- (void)setShippingName:(id)a3;
- (void)setShippingPhone:(id)a3;
- (void)setShippingType:(id)a3;
- (void)setStatus:(int64_t)a3 forItemWithType:(int64_t)a4;
- (void)setStatus:(int64_t)a3 forItemWithType:(int64_t)a4 notify:(BOOL)a5;
- (void)setSupportsEmptyPass:(BOOL)a3;
- (void)setSupportsPreservePeerPaymentBalance:(BOOL)a3;
- (void)setTeamIdentifier:(id)a3;
- (void)setUpdateHandler:(id)a3;
- (void)setUsePeerPaymentBalance:(BOOL)a3;
- (void)showPeerPaymentCardDataItem:(BOOL)a3 withCardDataItem:(BOOL)a4;
- (void)updateBillingErrors;
- (void)updatePeerPaymentPromotionForPeerPaymentQuote:(BOOL)a3;
- (void)updateRemoteDevices:(id)a3;
- (void)updateRemoteDevices:(id)a3 ignoreProximity:(BOOL)a4;
@end

@implementation PKPaymentAuthorizationDataModel

- (PKPaymentAuthorizationDataModel)init
{
  return [(PKPaymentAuthorizationDataModel *)self initWithMode:1];
}

- (PKPaymentAuthorizationDataModel)initWithMode:(int64_t)a3
{
  v37.receiver = self;
  v37.super_class = (Class)PKPaymentAuthorizationDataModel;
  v4 = [(PKPaymentAuthorizationDataModel *)&v37 init];
  v5 = v4;
  if (v4)
  {
    v4->_mode = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    items = v5->_items;
    v5->_items = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    typeToItemMap = v5->_typeToItemMap;
    v5->_typeToItemMap = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    billingAddressForFundingSource = v5->_billingAddressForFundingSource;
    v5->_billingAddressForFundingSource = v10;

    v5->_holdPendingUpdatesCount = 0;
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    acceptedApplications = v5->_acceptedApplications;
    v5->_acceptedApplications = v12;

    couponCode = v5->_couponCode;
    v5->_couponCode = (NSString *)&stru_1EE0F5368;

    v15 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    paymentErrors = v5->_paymentErrors;
    v5->_paymentErrors = v15;

    v17 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    clientErrors = v5->_clientErrors;
    v5->_clientErrors = v17;

    v19 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    paymentContactFormatErrors = v5->_paymentContactFormatErrors;
    v5->_paymentContactFormatErrors = v19;

    uint64_t v21 = +[PKPaymentWebService sharedService];
    paymentWebService = v5->_paymentWebService;
    v5->_paymentWebService = (PKPaymentWebService *)v21;

    appleCardEnhancedMerchant = v5->_appleCardEnhancedMerchant;
    v5->_appleCardEnhancedMerchant = 0;

    v24 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.PassKitCore.balancesProvider", v24);
    balancesProviderQueue = v5->_balancesProviderQueue;
    v5->_balancesProviderQueue = (OS_dispatch_queue *)v25;

    v27 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    primaryAccountIdentifiersWithConnectedCardStateSet = v5->_primaryAccountIdentifiersWithConnectedCardStateSet;
    v5->_primaryAccountIdentifiersWithConnectedCardStateSet = v27;

    if (a3 == 2)
    {
      uint64_t v31 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
      instrumentToDeviceMap = v5->_instrumentToDeviceMap;
      v5->_instrumentToDeviceMap = (NSMapTable *)v31;

      uint64_t v33 = [MEMORY[0x1E4F1CA60] dictionary];
      remoteDeviceToAcceptedInstruments = v5->_remoteDeviceToAcceptedInstruments;
      v5->_remoteDeviceToAcceptedInstruments = (NSMutableDictionary *)v33;

      allRemoteDevices = v5->_allRemoteDevices;
      v5->_allRemoteDevices = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      if (a3 != 1)
      {
LABEL_7:
        ABRecordRef v35 = ABPersonCreate();
        CFRelease(v35);
        return v5;
      }
      uint64_t v29 = [MEMORY[0x1E4F1CA60] dictionary];
      allRemoteDevices = v5->_statusForPass;
      v5->_statusForPass = (NSMutableDictionary *)v29;
    }

    goto LABEL_7;
  }
  return v5;
}

- (PKPassLibrary)library
{
  library = self->_library;
  if (!library)
  {
    v4 = +[PKPassLibrary sharedInstance];
    v5 = self->_library;
    self->_library = v4;

    library = self->_library;
  }
  return library;
}

- (PKPaymentOptionsDefaults)defaults
{
  defaults = self->_defaults;
  if (!defaults)
  {
    v4 = +[PKPaymentOptionsDefaults defaults];
    v5 = self->_defaults;
    self->_defaults = v4;

    defaults = self->_defaults;
  }
  return defaults;
}

- (PKPaymentOptionsRecents)recents
{
  recents = self->_recents;
  if (!recents)
  {
    v4 = +[PKPaymentOptionsRecents defaultInstance];
    v5 = self->_recents;
    self->_recents = v4;

    recents = self->_recents;
  }
  return recents;
}

- (void)setFundingMode:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int64_t fundingMode = self->_fundingMode;
  if (fundingMode != a3)
  {
    v6 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = PKPaymentAuthorizationFundingModeToString(fundingMode);
      v8 = PKPaymentAuthorizationFundingModeToString(a3);
      int v9 = 138412546;
      v10 = v7;
      __int16 v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Did update funding mode from %@ to %@", (uint8_t *)&v9, 0x16u);
    }
    self->_int64_t fundingMode = a3;
    [(NSMutableDictionary *)self->_acceptedApplications removeAllObjects];
    [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
  }
}

- (void)setPaymentRequest:(id)a3
{
  id v8 = a3;
  if (self->_paymentRequest)
  {
    [MEMORY[0x1E4F1CA00] raise:@"Illegal state" format:@"paymentRequest property already set"];
  }
  else
  {
    objc_storeStrong((id *)&self->_paymentRequest, a3);
    [(PKPaymentAuthorizationDataModel *)self _ensureItems];
    v5 = [(PKPaymentAuthorizationDataModel *)self transactionAmount];
    v6 = (NSDecimalNumber *)[v5 copy];
    initialTransactionAmount = self->_initialTransactionAmount;
    self->_initialTransactionAmount = v6;
  }
}

- (void)setPaymentContentItems:(id)a3
{
  objc_storeStrong((id *)&self->_paymentContentItems, a3);
  [(PKPaymentAuthorizationDataModel *)self _ensurePaymentContentItems];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setBillingAgreement:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  v6 = [v4 whitespaceCharacterSet];
  id v10 = [v5 stringByTrimmingCharactersInSet:v6];

  if ((unint64_t)[v10 length] <= 0x1F4) {
    uint64_t v7 = [v10 length];
  }
  else {
    uint64_t v7 = 500;
  }
  id v8 = [v10 substringToIndex:v7];
  billingAgreement = self->_billingAgreement;
  self->_billingAgreement = v8;

  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setRecurringPaymentRequest:(id)a3
{
  id v4 = a3;
  [v4 sanitize];
  [(PKPaymentRequest *)self->_paymentRequest setRecurringPaymentRequest:v4];
  id v5 = [v4 billingAgreement];

  uint64_t v6 = [v5 length];
  if (v6)
  {
    [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  }
  else
  {
    uint64_t v7 = [(PKPaymentAuthorizationDataModel *)self itemForType:12];
    [(PKPaymentAuthorizationDataModel *)self _removeDataItem:v7];
  }
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setAutomaticReloadPaymentRequest:(id)a3
{
  id v4 = a3;
  [v4 sanitize];
  [(PKPaymentRequest *)self->_paymentRequest setAutomaticReloadPaymentRequest:v4];
  id v5 = [v4 billingAgreement];

  uint64_t v6 = [v5 length];
  if (v6)
  {
    [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  }
  else
  {
    uint64_t v7 = [(PKPaymentAuthorizationDataModel *)self itemForType:12];
    [(PKPaymentAuthorizationDataModel *)self _removeDataItem:v7];
  }
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setDeferredPaymentRequest:(id)a3
{
  id v4 = a3;
  [v4 sanitize];
  [(PKPaymentRequest *)self->_paymentRequest setDeferredPaymentRequest:v4];
  id v5 = [v4 billingAgreement];

  uint64_t v6 = [v5 length];
  if (v6)
  {
    [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  }
  else
  {
    uint64_t v7 = [(PKPaymentAuthorizationDataModel *)self itemForType:12];
    [(PKPaymentAuthorizationDataModel *)self _removeDataItem:v7];
  }
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setMultiTokenContexts:(id)a3
{
  [(PKPaymentRequest *)self->_paymentRequest setMultiTokenContexts:a3];
  if ([(PKPaymentRequest *)self->_paymentRequest isMultiTokenRequest])
  {
    [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  }
  else
  {
    id v4 = [(PKPaymentAuthorizationDataModel *)self itemForType:13];
    [(PKPaymentAuthorizationDataModel *)self _removeDataItem:v4];
  }
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setCouponCode:(id)a3
{
  uint64_t v4 = [a3 copy];
  id v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (__CFString *)v4;
  }
  else {
    uint64_t v6 = &stru_1EE0F5368;
  }
  objc_storeStrong((id *)&self->_couponCode, v6);

  uint64_t v7 = [(NSArray *)self->_paymentErrors pk_objectsPassingTest:&__block_literal_global_37];
  paymentErrors = self->_paymentErrors;
  self->_paymentErrors = v7;

  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

BOOL __49__PKPaymentAuthorizationDataModel_setCouponCode___block_invoke(uint64_t a1, void *a2)
{
  return !PKIsCouponCodeError(a2);
}

- (void)setNumberOfOutstandingCouponCodeUpdates:(unint64_t)a3
{
  self->_numberOfOutstandingCouponCodeUpdates = a3;
  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setCouponCodeErrors:(id)a3
{
  paymentErrors = self->_paymentErrors;
  id v5 = a3;
  uint64_t v6 = [(NSArray *)paymentErrors pk_objectsPassingTest:&__block_literal_global_72];
  uint64_t v7 = self->_paymentErrors;
  self->_paymentErrors = v6;

  objc_msgSend(v5, "pk_arrayByApplyingBlock:", &__block_literal_global_75);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 && [v10 count])
  {
    id v8 = [(NSArray *)self->_paymentErrors arrayByAddingObjectsFromArray:v10];
    int v9 = self->_paymentErrors;
    self->_paymentErrors = v8;
  }
  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

BOOL __55__PKPaymentAuthorizationDataModel_setCouponCodeErrors___block_invoke(uint64_t a1, void *a2)
{
  return !PKIsCouponCodeError(a2);
}

uint64_t __55__PKPaymentAuthorizationDataModel_setCouponCodeErrors___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pk_paymentErrorWithLocalizedDescription");
}

- (void)setShippingEmail:(id)a3
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 emailAddresses];
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [v6 value];

  if (v7) {
    id v8 = (CNContact *)v4;
  }
  else {
    id v8 = 0;
  }
  shippingEmail = self->_shippingEmail;
  self->_shippingEmail = v8;

  unint64_t v10 = 0x1E4F1C000uLL;
  __int16 v11 = (void *)MEMORY[0x1E4F1C978];
  v45[0] = @"email";
  v45[1] = @"contactInfo";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  uint64_t v13 = objc_msgSend(v11, "pk_FilteredShippingErrorsForContactFields:errors:", v12, self->_clientErrors);

  v14 = [(PKPayment *)self->_payment shippingContact];
  v15 = [v14 emailAddress];
  int v16 = [v15 isEqual:v7];

  if (v16)
  {
    v17 = (NSArray *)[(NSArray *)self->_paymentErrors mutableCopy];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v18 = v13;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          if (!-[NSArray containsObject:](self->_paymentErrors, "containsObject:", v23, (void)v38)) {
            [(NSArray *)v17 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v20);
    }

    v24 = (NSArray *)[(NSArray *)v17 copy];
    paymentErrors = self->_paymentErrors;
    self->_paymentErrors = v24;

    unint64_t v10 = 0x1E4F1C000;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E4F1C978];
    v43[0] = @"email";
    v43[1] = @"contactInfo";
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    objc_msgSend(v26, "pk_FilteredShippingErrorsForContactFields:errors:", v27, self->_paymentErrors);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    v28 = [(NSArray *)self->_paymentErrors pk_arrayByRemovingObjectsInArray:v18];
    v17 = self->_paymentErrors;
    self->_paymentErrors = v28;
  }

  contactFormatValidator = self->_contactFormatValidator;
  if (contactFormatValidator)
  {
    BOOL v30 = [(PKContactFormatValidator *)contactFormatValidator emailAddressIsValid:v7];
    uint64_t v31 = (void *)[(NSArray *)self->_paymentContactFormatErrors mutableCopy];
    v32 = *(void **)(v10 + 2424);
    v42 = @"email";
    uint64_t v33 = [v32 arrayWithObjects:&v42 count:1];
    v34 = objc_msgSend(v32, "pk_FilteredShippingErrorsForContactFields:errors:", v33, self->_paymentContactFormatErrors);
    [v31 removeObjectsInArray:v34];

    if (!v30)
    {
      ABRecordRef v35 = PKContactFormatErrorForInvalidEmailAddressFormat();
      [v31 addObject:v35];
    }
    v36 = (NSArray *)objc_msgSend(v31, "copy", (void)v38);
    paymentContactFormatErrors = self->_paymentContactFormatErrors;
    self->_paymentContactFormatErrors = v36;
  }
  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setShippingEmailError:(id)a3
{
  id v7 = a3;
  if (!-[NSArray containsObject:](self->_paymentErrors, "containsObject:"))
  {
    id v4 = (void *)[(NSArray *)self->_paymentErrors mutableCopy];
    [v4 addObject:v7];
    id v5 = (NSArray *)[v4 copy];
    paymentErrors = self->_paymentErrors;
    self->_paymentErrors = v5;

    [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
  }
}

- (void)setShippingPhone:(id)a3
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 phoneNumbers];
  uint64_t v6 = [v5 firstObject];
  id v7 = [v6 value];

  if (v7) {
    id v8 = (CNContact *)v4;
  }
  else {
    id v8 = 0;
  }
  shippingPhone = self->_shippingPhone;
  self->_shippingPhone = v8;

  unint64_t v10 = 0x1E4F1C000uLL;
  __int16 v11 = (void *)MEMORY[0x1E4F1C978];
  v45[0] = @"phone";
  v45[1] = @"contactInfo";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:2];
  uint64_t v13 = objc_msgSend(v11, "pk_FilteredShippingErrorsForContactFields:errors:", v12, self->_clientErrors);

  v14 = [(PKPayment *)self->_payment shippingContact];
  v15 = [v14 phoneNumber];
  int v16 = [v15 isEqual:v7];

  if (v16)
  {
    v17 = (NSArray *)[(NSArray *)self->_paymentErrors mutableCopy];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v18 = v13;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v39 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          if (!-[NSArray containsObject:](self->_paymentErrors, "containsObject:", v23, (void)v38)) {
            [(NSArray *)v17 addObject:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v20);
    }

    v24 = (NSArray *)[(NSArray *)v17 copy];
    paymentErrors = self->_paymentErrors;
    self->_paymentErrors = v24;

    unint64_t v10 = 0x1E4F1C000;
  }
  else
  {
    v26 = (void *)MEMORY[0x1E4F1C978];
    v43[0] = @"phone";
    v43[1] = @"contactInfo";
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    objc_msgSend(v26, "pk_FilteredShippingErrorsForContactFields:errors:", v27, self->_paymentErrors);
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    v28 = [(NSArray *)self->_paymentErrors pk_arrayByRemovingObjectsInArray:v18];
    v17 = self->_paymentErrors;
    self->_paymentErrors = v28;
  }

  contactFormatValidator = self->_contactFormatValidator;
  if (contactFormatValidator)
  {
    BOOL v30 = [(PKContactFormatValidator *)contactFormatValidator phoneNumberIsValid:v7 forCountryCode:0];
    uint64_t v31 = (void *)[(NSArray *)self->_paymentContactFormatErrors mutableCopy];
    v32 = *(void **)(v10 + 2424);
    v42 = @"phone";
    uint64_t v33 = [v32 arrayWithObjects:&v42 count:1];
    v34 = objc_msgSend(v32, "pk_FilteredShippingErrorsForContactFields:errors:", v33, self->_paymentContactFormatErrors);
    [v31 removeObjectsInArray:v34];

    if (!v30)
    {
      ABRecordRef v35 = PKContactFormatErrorForInvalidPhoneNumberFormat();
      [v31 addObject:v35];
    }
    v36 = (NSArray *)objc_msgSend(v31, "copy", (void)v38);
    paymentContactFormatErrors = self->_paymentContactFormatErrors;
    self->_paymentContactFormatErrors = v36;
  }
  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setShippingName:(id)a3
{
  v32[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 nameComponents];

  if (v5) {
    uint64_t v6 = (CNContact *)v4;
  }
  else {
    uint64_t v6 = 0;
  }
  shippingName = self->_shippingName;
  self->_shippingName = v6;

  id v8 = (void *)MEMORY[0x1E4F1C978];
  v32[0] = @"name";
  v32[1] = @"phoneticName";
  v32[2] = @"contactInfo";
  int v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:3];
  unint64_t v10 = objc_msgSend(v8, "pk_FilteredShippingErrorsForContactFields:errors:", v9, self->_clientErrors);

  __int16 v11 = [(PKPayment *)self->_payment shippingContact];
  v12 = [v11 name];
  uint64_t v13 = [v4 nameComponents];
  int v14 = [v12 isEqual:v13];

  if (v14)
  {
    v15 = (void *)[(NSArray *)self->_paymentErrors mutableCopy];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v16 = v10;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          if (!-[NSArray containsObject:](self->_paymentErrors, "containsObject:", v21, (void)v26)) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v18);
    }

    v22 = (NSArray *)[v15 copy];
  }
  else
  {
    uint64_t v23 = (void *)MEMORY[0x1E4F1C978];
    v30[0] = @"name";
    v30[1] = @"phoneticName";
    v30[2] = @"contactInfo";
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
    v15 = objc_msgSend(v23, "pk_FilteredShippingErrorsForContactFields:errors:", v24, self->_paymentErrors);

    v22 = [(NSArray *)self->_paymentErrors pk_arrayByRemovingObjectsInArray:v15];
  }
  paymentErrors = self->_paymentErrors;
  self->_paymentErrors = v22;

  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setShippingAddress:(id)a3
{
  v85[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 nameComponents];
  id v7 = [v5 postalAddresses];
  id v8 = [v7 firstObject];
  int v9 = [v8 value];

  v74 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&self->_originalShippingAddress, a3);
    unint64_t v10 = [(PKPaymentAuthorizationDataModel *)self _formatAddressContactIfNecessary:v5];
    shippingAddress = self->_shippingAddress;
    self->_shippingAddress = v10;
  }
  else
  {
    originalShippingAddress = self->_originalShippingAddress;
    self->_originalShippingAddress = 0;

    shippingAddress = self->_shippingAddress;
    self->_shippingAddress = 0;
  }

  uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
  v85[0] = @"post";
  int v14 = 1;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:1];
  v71 = objc_msgSend(v13, "pk_FilteredShippingErrorsForContactFields:errors:", v15, self->_clientErrors);

  id v16 = (void *)MEMORY[0x1E4F1C978];
  v84 = @"name";
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v84 count:1];
  v73 = objc_msgSend(v16, "pk_FilteredShippingErrorsForContactFields:errors:", v17, self->_clientErrors);

  uint64_t v18 = (void *)MEMORY[0x1E4F1C978];
  v83 = @"phoneticName";
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
  v72 = objc_msgSend(v18, "pk_FilteredShippingErrorsForContactFields:errors:", v19, self->_clientErrors);

  uint64_t v20 = [(PKPaymentRequest *)self->_paymentRequest requiredShippingContactFields];
  if (([v20 containsObject:@"name"] & 1) == 0) {
    int v14 = [v20 containsObject:@"post"];
  }
  v69 = v20;
  int v70 = [v20 containsObject:@"phoneticName"];
  uint64_t v21 = (void *)[(NSArray *)self->_paymentErrors mutableCopy];
  v22 = (void *)MEMORY[0x1E4F1C978];
  v82 = @"post";
  uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
  v24 = objc_msgSend(v22, "pk_FilteredShippingErrorsForContactFields:errors:", v23, self->_paymentErrors);
  [v21 removeObjectsInArray:v24];

  dispatch_queue_t v25 = [(PKPayment *)self->_payment shippingContact];
  long long v26 = [v25 postalAddress];
  int v27 = [v26 isEqual:v9];

  if (v27) {
    [v21 addObjectsFromArray:v71];
  }
  if ([v73 count]) {
    int v28 = 1;
  }
  else {
    int v28 = v14;
  }
  if (v28 == 1)
  {
    long long v29 = (void *)MEMORY[0x1E4F1C978];
    v81 = @"name";
    BOOL v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
    uint64_t v31 = objc_msgSend(v29, "pk_FilteredShippingErrorsForContactFields:errors:", v30, self->_paymentErrors);
    [v21 removeObjectsInArray:v31];

    v32 = [(PKPayment *)self->_payment shippingContact];
    uint64_t v33 = [v32 name];
    if ([v33 isEqual:v6])
    {
      uint64_t v34 = [v73 count];

      if (v34)
      {
        [v21 addObjectsFromArray:v73];
        goto LABEL_19;
      }
    }
    else
    {
    }
    if (v14)
    {
      ABRecordRef v35 = [v5 pkFullName];
      uint64_t v36 = [v35 length];

      if (!v36)
      {
        objc_super v37 = PKLocalizedPaymentString(&cfstr_InAppPaymentSh_6.isa, 0);
        long long v38 = +[PKPaymentRequest paymentContactInvalidErrorWithContactField:@"name" localizedDescription:v37];
        [v21 addObject:v38];

        v79[0] = @"eventType";
        v79[1] = @"authorizationError";
        v80[0] = @"transactionAuthorizationPreferenceError";
        v80[1] = @"shippingContactInvalid";
        long long v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v79 count:2];
        +[PKAnalyticsReporter subject:@"inApp" sendEvent:v39];
      }
    }
  }
LABEL_19:
  if ([v72 count]) {
    int v40 = 1;
  }
  else {
    int v40 = v70;
  }
  if (v40 == 1)
  {
    v68 = v5;
    long long v41 = (void *)MEMORY[0x1E4F1C978];
    v78 = @"phoneticName";
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
    v43 = objc_msgSend(v41, "pk_FilteredShippingErrorsForContactFields:errors:", v42, self->_paymentErrors);
    [v21 removeObjectsInArray:v43];

    v44 = [(PKPayment *)self->_payment shippingContact];
    v45 = [v44 name];
    v46 = [v45 phoneticRepresentation];
    v47 = [v6 phoneticRepresentation];
    if ([v46 isEqual:v47])
    {
      uint64_t v48 = [v72 count];

      if (v48)
      {
        [v21 addObjectsFromArray:v72];
        id v5 = v68;
        goto LABEL_30;
      }
    }
    else
    {
    }
    id v5 = v68;
    if (v70)
    {
      v49 = [v68 pkPhoneticName];
      uint64_t v50 = [v49 length];

      if (!v50)
      {
        v51 = PKLocalizedPaymentString(&cfstr_InAppPaymentSh_8.isa, 0);
        v52 = +[PKPaymentRequest paymentContactInvalidErrorWithContactField:@"phoneticName" localizedDescription:v51];
        [v21 addObject:v52];

        v76[0] = @"eventType";
        v76[1] = @"authorizationError";
        v77[0] = @"transactionAuthorizationPreferenceError";
        v77[1] = @"shippingContactInvalid";
        v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:v76 count:2];
        +[PKAnalyticsReporter subject:@"inApp" sendEvent:v53];
      }
    }
  }
LABEL_30:
  v54 = (NSArray *)[v21 copy];
  paymentErrors = self->_paymentErrors;
  self->_paymentErrors = v54;

  uint64_t v56 = [(PKContactFormatValidator *)self->_contactFormatValidator checkPostalAddressFormat:v9];
  contactFormatValidator = self->_contactFormatValidator;
  v58 = [v9 ISOCountryCode];
  uint64_t v59 = [(PKContactFormatValidator *)contactFormatValidator checkNameFormat:v6 forCountryCode:v58];

  v60 = (void *)[(NSArray *)self->_paymentContactFormatErrors mutableCopy];
  v61 = (void *)MEMORY[0x1E4F1C978];
  v75[0] = @"post";
  v75[1] = @"name";
  v75[2] = @"phoneticName";
  v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:3];
  v63 = objc_msgSend(v61, "pk_FilteredShippingErrorsForContactFields:errors:", v62, self->_paymentContactFormatErrors);
  [v60 removeObjectsInArray:v63];

  if (v56)
  {
    v64 = PKContactFormatErrorsFromShippingAddressFormatErrors(v56);
    [v60 addObjectsFromArray:v64];
  }
  if (v59)
  {
    v65 = PKContactFormatErrorsFromShippingNameComponenentFormatErrors(v59);
    [v60 addObjectsFromArray:v65];
  }
  v66 = (NSArray *)[v60 copy];
  paymentContactFormatErrors = self->_paymentContactFormatErrors;
  self->_paymentContactFormatErrors = v66;

  if ([(PKPaymentAuthorizationDataModel *)self shouldUpdateContactDataItem]) {
    [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  }
  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (BOOL)shouldUpdateContactDataItem
{
  v3 = [(PKPaymentRequest *)self->_paymentRequest requiredShippingContactFields];
  char v4 = [v3 containsObject:@"email"];

  id v5 = [(PKPaymentRequest *)self->_paymentRequest requiredShippingContactFields];
  char v6 = [v5 containsObject:@"phone"];

  id v7 = [(PKPaymentRequest *)self->_paymentRequest requiredShippingContactFields];
  if ([v7 containsObject:@"name"])
  {
    char v8 = 0;
  }
  else
  {
    int v9 = [(PKPaymentRequest *)self->_paymentRequest requiredShippingContactFields];
    char v10 = [v9 containsObject:@"phoneticName"];

    char v8 = v10 ^ 1;
  }

  __int16 v11 = [(PKPaymentRequest *)self->_paymentRequest requiredShippingContactFields];
  char v12 = [v11 containsObject:@"post"];

  return v4 | v6 | (v8 | v12 & [(PKPaymentRequest *)self->_paymentRequest isShippingEditable]) ^ 1;
}

- (void)setShippingMethod:(id)a3
{
  objc_storeStrong((id *)&self->_shippingMethod, a3);
  id v5 = a3;
  uint64_t v6 = objc_opt_class();

  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:v6];
  [(PKPaymentAuthorizationDataModel *)self _updatePeerPaymentPromotionAvailability];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setShippingEditableMessage:(id)a3
{
  objc_storeStrong((id *)&self->_shippingEditableMessage, a3);
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (CNContact)billingAddress
{
  v3 = [(PKPaymentAuthorizationDataModel *)self _billingAddressKey];
  if (v3)
  {
    char v4 = [(NSMutableDictionary *)self->_billingAddressForFundingSource objectForKeyedSubscript:v3];
  }
  else
  {
    char v4 = 0;
  }

  return (CNContact *)v4;
}

- (void)setBillingAddress:(id)a3
{
  id v7 = a3;
  char v4 = [v7 postalAddresses];
  if ([v4 count])
  {
    id v5 = [(PKPaymentAuthorizationDataModel *)self _formatAddressContactIfNecessary:v7];
  }
  else
  {
    id v5 = 0;
  }

  uint64_t v6 = [(PKPaymentAuthorizationDataModel *)self _billingAddressKey];
  if (v6) {
    [(NSMutableDictionary *)self->_billingAddressForFundingSource setObject:v5 forKeyedSubscript:v6];
  }
  [(PKPaymentAuthorizationDataModel *)self refreshBillingAddressErrors];
  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)refreshBillingAddressErrors
{
  v20[3] = *MEMORY[0x1E4F143B8];
  [(PKPaymentAuthorizationDataModel *)self updateBillingErrors];
  v3 = [(PKPaymentAuthorizationDataModel *)self billingAddress];
  char v4 = [v3 nameComponents];
  id v5 = [v3 postalAddresses];
  uint64_t v6 = [v5 firstObject];
  id v7 = [v6 value];

  uint64_t v8 = [(PKContactFormatValidator *)self->_contactFormatValidator checkPostalAddressFormat:v7];
  contactFormatValidator = self->_contactFormatValidator;
  char v10 = [v7 ISOCountryCode];
  uint64_t v11 = [(PKContactFormatValidator *)contactFormatValidator checkNameFormat:v4 forCountryCode:v10];

  char v12 = (void *)[(NSArray *)self->_paymentContactFormatErrors mutableCopy];
  uint64_t v13 = (void *)MEMORY[0x1E4F1C978];
  v20[0] = @"post";
  v20[1] = @"name";
  v20[2] = @"phoneticName";
  int v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];
  v15 = objc_msgSend(v13, "pk_FilteredBillingErrorsForContactFields:errors:", v14, self->_paymentContactFormatErrors);
  [v12 removeObjectsInArray:v15];

  if (v8)
  {
    id v16 = PKContactFormatErrorsFromBillingAddressFormatErrors(v8);
    [v12 addObjectsFromArray:v16];
  }
  if (v11)
  {
    uint64_t v17 = PKContactFormatErrorsFromBillingNameComponenentFormatErrors(v11);
    [v12 addObjectsFromArray:v17];
  }
  uint64_t v18 = (NSArray *)[v12 copy];
  paymentContactFormatErrors = self->_paymentContactFormatErrors;
  self->_paymentContactFormatErrors = v18;
}

- (id)_billingAddressKey
{
  int64_t fundingMode = self->_fundingMode;
  if (fundingMode != 2)
  {
    if (fundingMode == 1)
    {
      uint64_t v6 = [(PKPayLaterFinancingController *)self->_financingController selectedFundingSource];
      id v5 = [v6 identifier];

      goto LABEL_11;
    }
    if (fundingMode) {
      goto LABEL_7;
    }
  }
  int64_t mode = self->_mode;
  if (mode == 2)
  {
    uint64_t v4 = [(PKRemotePaymentInstrument *)self->_remotePaymentInstrument passIdentifier];
    goto LABEL_10;
  }
  if (mode != 1)
  {
LABEL_7:
    id v5 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = [(PKObject *)self->_pass uniqueID];
LABEL_10:
  id v5 = (void *)v4;
LABEL_11:
  return v5;
}

- (void)updateBillingErrors
{
  v116[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PKPaymentRequest *)self->_paymentRequest requiredBillingContactFields];
  unint64_t v4 = 0x1E4F1C000uLL;
  if (![v3 containsObject:@"post"]
    || !self->_paymentApplicationIdentifierForErrors
    || ([(PKPaymentApplication *)self->_paymentApplication applicationIdentifier],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_17;
  }
  uint64_t v6 = (void *)v5;
  paymentApplicationIdentifierForErrors = self->_paymentApplicationIdentifierForErrors;
  uint64_t v8 = [(PKPaymentApplication *)self->_paymentApplication applicationIdentifier];
  LODWORD(paymentApplicationIdentifierForErrors) = [(NSString *)paymentApplicationIdentifierForErrors isEqualToString:v8];

  if (!paymentApplicationIdentifierForErrors)
  {
LABEL_17:
    int v27 = (void *)MEMORY[0x1E4F1C978];
    v112[0] = @"post";
    v112[1] = @"name";
    v112[2] = @"phoneticName";
    int v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v112 count:3];
    char v12 = objc_msgSend(v27, "pk_FilteredBillingErrorsForContactFields:errors:", v28, self->_clientErrors);

    long long v29 = [(NSArray *)self->_paymentErrors pk_arrayByRemovingObjectsInArray:v12];
    paymentErrors = self->_paymentErrors;
    self->_paymentErrors = v29;
    goto LABEL_18;
  }
  int v9 = [(PKPaymentAuthorizationDataModel *)self billingAddress];
  char v10 = [v9 postalAddresses];
  uint64_t v11 = [v10 firstObject];
  char v12 = [v11 value];

  uint64_t v13 = [(PKPayment *)self->_payment billingContact];
  paymentErrors = [v13 postalAddress];

  v15 = (void *)MEMORY[0x1E4F1C978];
  v116[0] = @"post";
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v116 count:1];
  uint64_t v17 = objc_msgSend(v15, "pk_FilteredBillingErrorsForContactFields:errors:", v16, self->_clientErrors);

  v94 = v17;
  if ([v12 isEqual:paymentErrors])
  {
    uint64_t v18 = (NSArray *)[(NSArray *)self->_paymentErrors mutableCopy];
    long long v102 = 0u;
    long long v103 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v102 objects:v115 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v103 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v102 + 1) + 8 * i);
          if (![(NSArray *)self->_paymentErrors containsObject:v24]) {
            [(NSArray *)v18 addObject:v24];
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v102 objects:v115 count:16];
      }
      while (v21);
    }

    dispatch_queue_t v25 = (NSArray *)[(NSArray *)v18 copy];
    long long v26 = self->_paymentErrors;
    self->_paymentErrors = v25;

    unint64_t v4 = 0x1E4F1C000;
    goto LABEL_40;
  }
  if ([v17 count])
  {
    v71 = [(NSArray *)self->_paymentErrors pk_arrayByRemovingObjectsInArray:v17];
    uint64_t v18 = self->_paymentErrors;
    self->_paymentErrors = v71;
LABEL_40:
  }
  v72 = [(PKPaymentAuthorizationDataModel *)self billingAddress];
  v97 = [v72 nameComponents];

  v73 = [(PKPayment *)self->_payment billingContact];
  v74 = [v73 name];

  v75 = *(void **)(v4 + 2424);
  v114[0] = @"name";
  v114[1] = @"phoneticName";
  v76 = [v75 arrayWithObjects:v114 count:2];
  v77 = objc_msgSend(v75, "pk_FilteredBillingErrorsForContactFields:errors:", v76, self->_clientErrors);

  v78 = v97;
  if ([v77 count] && objc_msgSend(v97, "isEqual:", v74))
  {
    v91 = v74;
    v92 = paymentErrors;
    uint64_t v79 = [(NSArray *)self->_paymentErrors mutableCopy];
    v80 = v77;
    v81 = (NSArray *)v79;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    v93 = v80;
    id v82 = v80;
    uint64_t v83 = [v82 countByEnumeratingWithState:&v98 objects:v113 count:16];
    if (v83)
    {
      uint64_t v84 = v83;
      uint64_t v85 = *(void *)v99;
      do
      {
        for (uint64_t j = 0; j != v84; ++j)
        {
          if (*(void *)v99 != v85) {
            objc_enumerationMutation(v82);
          }
          uint64_t v87 = *(void *)(*((void *)&v98 + 1) + 8 * j);
          if (![(NSArray *)self->_paymentErrors containsObject:v87]) {
            [(NSArray *)v81 addObject:v87];
          }
        }
        uint64_t v84 = [v82 countByEnumeratingWithState:&v98 objects:v113 count:16];
      }
      while (v84);
    }

    v88 = (NSArray *)[(NSArray *)v81 copy];
    v89 = self->_paymentErrors;
    self->_paymentErrors = v88;

    v78 = v97;
    unint64_t v4 = 0x1E4F1C000;
    v74 = v91;
    paymentErrors = v92;
    goto LABEL_55;
  }
  if ([v77 count])
  {
    v93 = v77;
    v90 = [(NSArray *)self->_paymentErrors pk_arrayByRemovingObjectsInArray:v77];
    v81 = self->_paymentErrors;
    self->_paymentErrors = v90;
LABEL_55:

    v77 = v93;
  }

LABEL_18:
  BOOL v30 = [(PKPaymentAuthorizationDataModel *)self billingAddress];

  if (!v30) {
    return;
  }
  uint64_t v31 = [(PKPaymentRequest *)self->_paymentRequest requiredBillingContactFields];
  if ([v31 containsObject:@"name"]) {
    int v32 = 1;
  }
  else {
    int v32 = [v31 containsObject:@"post"];
  }
  int v33 = [v31 containsObject:@"phoneticName"];
  uint64_t v34 = *(void **)(v4 + 2424);
  v111 = @"name";
  ABRecordRef v35 = [v34 arrayWithObjects:&v111 count:1];
  v96 = objc_msgSend(v34, "pk_FilteredBillingErrorsForContactFields:errors:", v35, self->_paymentErrors);

  uint64_t v36 = *(void **)(v4 + 2424);
  v110 = @"phoneticName";
  objc_super v37 = [v36 arrayWithObjects:&v110 count:1];
  long long v38 = objc_msgSend(v36, "pk_FilteredBillingErrorsForContactFields:errors:", v37, self->_paymentErrors);

  long long v39 = (void *)[(NSArray *)self->_paymentErrors mutableCopy];
  if (v32)
  {
    int v40 = v33;
    long long v41 = v31;
    v42 = v38;
    v43 = [(PKPayment *)self->_payment billingContact];
    v44 = [v43 name];
    v45 = [(PKPaymentAuthorizationDataModel *)self billingAddress];
    v46 = [v45 nameComponents];
    char v47 = [v44 isEqual:v46];

    if (v47)
    {
      long long v38 = v42;
      uint64_t v31 = v41;
      int v33 = v40;
      if ([v96 count]) {
        goto LABEL_29;
      }
    }
    else
    {
      [v39 removeObjectsInArray:v96];
      [v96 count];
      long long v38 = v42;
      uint64_t v31 = v41;
      int v33 = v40;
    }
    uint64_t v48 = [(PKPaymentAuthorizationDataModel *)self billingAddress];
    v49 = [v48 pkFullName];
    uint64_t v50 = [v49 length];

    if (!v50)
    {
      v51 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo.isa, 0);
      v52 = +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:@"name" localizedDescription:v51];
      [v39 addObject:v52];

      v108[0] = @"eventType";
      v108[1] = @"authorizationError";
      v109[0] = @"transactionAuthorizationPreferenceError";
      v109[1] = @"billingContactInvalid";
      v53 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:2];
      +[PKAnalyticsReporter subject:@"inApp" sendEvent:v53];
    }
  }
LABEL_29:
  if (v33)
  {
    v95 = v31;
    v54 = v38;
    v55 = [(PKPayment *)self->_payment billingContact];
    uint64_t v56 = [v55 name];
    v57 = [v56 phoneticRepresentation];
    v58 = [(PKPaymentAuthorizationDataModel *)self billingAddress];
    uint64_t v59 = [v58 nameComponents];
    v60 = [v59 phoneticRepresentation];
    char v61 = [v57 isEqual:v60];

    if ((v61 & 1) == 0)
    {
      long long v38 = v54;
      [v39 removeObjectsInArray:v54];
      [v54 count];
      uint64_t v31 = v95;
      goto LABEL_34;
    }
    long long v38 = v54;
    uint64_t v62 = [v54 count];
    uint64_t v31 = v95;
    if (!v62)
    {
LABEL_34:
      v63 = [(PKPaymentAuthorizationDataModel *)self billingAddress];
      v64 = [v63 pkPhoneticName];
      uint64_t v65 = [v64 length];

      if (!v65)
      {
        v66 = PKLocalizedPaymentString(&cfstr_InAppPaymentCo_0.isa, 0);
        v67 = +[PKPaymentRequest paymentBillingAddressInvalidErrorWithKey:@"phoneticName" localizedDescription:v66];
        [v39 addObject:v67];

        v106[0] = @"eventType";
        v106[1] = @"authorizationError";
        v107[0] = @"transactionAuthorizationPreferenceError";
        v107[1] = @"billingContactInvalid";
        v68 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v107 forKeys:v106 count:2];
        +[PKAnalyticsReporter subject:@"inApp" sendEvent:v68];
      }
    }
  }
  v69 = (NSArray *)[v39 copy];
  int v70 = self->_paymentErrors;
  self->_paymentErrors = v69;
}

- (void)setShippingAddressErrors:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v10), "pk_paymentErrorWithLocalizedDescription", (void)v19);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v8);
  }

  char v12 = (void *)MEMORY[0x1E4F1C978];
  uint64_t v23 = @"post";
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  int v14 = objc_msgSend(v12, "pk_FilteredShippingErrorsForContactFields:errors:", v13, self->_paymentErrors);

  v15 = [(NSArray *)self->_paymentErrors pk_arrayByRemovingObjectsInArray:v14];
  paymentErrors = self->_paymentErrors;
  self->_paymentErrors = v15;

  if (v5 && [v5 count])
  {
    uint64_t v17 = [(NSArray *)self->_paymentErrors arrayByAddingObjectsFromArray:v5];
    uint64_t v18 = self->_paymentErrors;
    self->_paymentErrors = v17;
  }
  if ([(PKPaymentAuthorizationDataModel *)self shouldUpdateContactDataItem]) {
    [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  }
  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
}

- (NSArray)allErrors
{
  if (self->_paymentErrors || self->_paymentContactFormatErrors)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v4 = v3;
    if (self->_paymentErrors) {
      objc_msgSend(v3, "addObjectsFromArray:");
    }
    if (self->_paymentContactFormatErrors) {
      objc_msgSend(v4, "addObjectsFromArray:");
    }
    id v5 = (void *)[v4 copy];
  }
  else
  {
    id v5 = 0;
  }
  return (NSArray *)v5;
}

- (void)setPaymentErrors:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v10), "pk_paymentErrorWithLocalizedDescription", (void)v18);
        [(NSArray *)v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  paymentErrors = self->_paymentErrors;
  self->_paymentErrors = v5;
  uint64_t v13 = v5;

  int v14 = [(PKPaymentApplication *)self->_paymentApplication applicationIdentifier];
  paymentApplicationIdentifierForErrors = self->_paymentApplicationIdentifierForErrors;
  self->_paymentApplicationIdentifierForErrors = v14;

  id v16 = (NSArray *)[(NSArray *)v13 copy];
  clientErrors = self->_clientErrors;
  self->_clientErrors = v16;
}

- (void)setPeerPaymentService:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentService, a3);
  id v7 = a3;
  id v5 = [(PKPeerPaymentService *)self->_peerPaymentService account];
  peerPaymentAccount = self->_peerPaymentAccount;
  self->_peerPaymentAccount = v5;
}

- (void)setPeerPaymentQuote:(id)a3
{
  id v18 = a3;
  objc_storeStrong((id *)&self->_peerPaymentQuote, a3);
  if ([(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsPreserveCurrentBalance])
  {
    id v5 = [(PKPeerPaymentQuote *)self->_peerPaymentQuote recipient];
    if (v5)
    {
      self->_supportsPreservePeerPaymentBalance = 1;
      p_supportsPreservePeerPaymentBalance = &self->_supportsPreservePeerPaymentBalance;
    }
    else
    {
      id v7 = [(PKPaymentRequest *)self->_paymentRequest peerPaymentRequest];
      self->_supportsPreservePeerPaymentBalance = [v7 hasUndeterminedRecipient];
      p_supportsPreservePeerPaymentBalance = &self->_supportsPreservePeerPaymentBalance;
    }
    if (*p_supportsPreservePeerPaymentBalance)
    {
      uint64_t v8 = [(PKPaymentAuthorizationDataModel *)self acceptedPasses];
      self->_supportsPreservePeerPaymentBalance = [v8 count] != 0;

      goto LABEL_9;
    }
  }
  else
  {
    self->_supportsPreservePeerPaymentBalance = 0;
    p_supportsPreservePeerPaymentBalance = &self->_supportsPreservePeerPaymentBalance;
  }
  BOOL *p_supportsPreservePeerPaymentBalance = 0;
LABEL_9:
  uint64_t v9 = [v18 recipient];
  if (v9)
  {

LABEL_12:
    char v12 = [v18 firstQuoteItemOfType:2];
    BOOL v13 = v12 != 0;

    int v14 = [v18 firstQuoteItemOfType:1];
    BOOL v15 = v14 != 0;

    [(PKPaymentAuthorizationDataModel *)self showPeerPaymentCardDataItem:v13 withCardDataItem:v15];
LABEL_13:
    [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
    goto LABEL_14;
  }
  uint64_t v10 = [(PKPaymentRequest *)self->_paymentRequest peerPaymentRequest];
  int v11 = [v10 hasUndeterminedRecipient];

  if (v11) {
    goto LABEL_12;
  }
  id v16 = [v18 firstQuoteItemOfType:3];
  if (v16)
  {

LABEL_20:
    [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
    goto LABEL_13;
  }
  uint64_t v17 = [v18 firstQuoteItemOfType:4];

  if (v17) {
    goto LABEL_20;
  }
LABEL_14:
}

- (void)setBankAccount:(id)a3
{
  id v21 = a3;
  objc_storeStrong((id *)&self->_bankAccount, a3);
  id v5 = [(PKPaymentAuthorizationDataModel *)self peerPaymentBalanceForAccountPayment];
  id v6 = [v5 amount];

  id v7 = [(PKPaymentAuthorizationDataModel *)self itemForType:9];
  uint64_t v8 = [(PKPaymentAuthorizationDataModel *)self itemForType:2];
  if (v8 && v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v10 = [v9 compare:v6];

    paymentRequest = self->_paymentRequest;
    if (v10 == -1)
    {
      BOOL v13 = [(PKPaymentRequest *)paymentRequest paymentSummaryItems];
      int v14 = [v13 lastObject];
      BOOL v15 = [v14 amount];

      uint64_t v16 = [v15 compare:v6];
      BOOL v12 = v16 != 1;

      if (![(PKPaymentRequest *)self->_paymentRequest isAccountServiceTransferRequest])
      {
        if (v16 == 1) {
          goto LABEL_9;
        }
        goto LABEL_12;
      }
    }
    else
    {
      if (![(PKPaymentRequest *)paymentRequest isAccountServiceTransferRequest]) {
        goto LABEL_9;
      }
      BOOL v12 = 0;
    }
    uint64_t v17 = [(PKPaymentRequest *)self->_paymentRequest accountServiceTransferRequest];
    int v18 = [v17 supportsSplitPayment];

    if (v18 && !v12) {
      goto LABEL_9;
    }
LABEL_12:
    [(PKPaymentAuthorizationDataModel *)self _removeDataItem:v7];
    goto LABEL_13;
  }
LABEL_9:
  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  if (self->_bankAccount)
  {
    pass = self->_pass;
    self->_pass = 0;

    paymentApplication = self->_paymentApplication;
    self->_paymentApplication = 0;
  }
LABEL_13:
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setPeerPaymentBalanceForAccountPayment:(id)a3
{
  id v21 = a3;
  objc_storeStrong((id *)&self->_peerPaymentBalanceForAccountPayment, a3);
  if (self->_peerPaymentBalanceForAccountPayment) {
    [(PKSecureElementPass *)self->_peerPaymentPass setPeerPaymentBalance:v21];
  }
  id v5 = [(PKPaymentAuthorizationDataModel *)self itemForType:2];
  id v6 = [v21 amount];
  id v7 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v8 = [v6 compare:v7];

  uint64_t v9 = [(PKPaymentRequest *)self->_paymentRequest accountServiceTransferRequest];
  uint64_t v10 = [v9 transferType];

  BOOL v12 = (v10 & 0xFFFFFFFFFFFFFFFELL) != 2 && v8 != 1;
  if (!v21 || v12)
  {
    [(PKPaymentAuthorizationDataModel *)self _removeDataItem:v5];
    BOOL v13 = v5;
  }
  else
  {
    [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
    BOOL v13 = [(PKPaymentAuthorizationDataModel *)self itemForType:2];

    int v14 = [v13 pass];
    [v14 setPeerPaymentBalance:v21];

    BOOL v15 = [(PKPaymentRequest *)self->_paymentRequest accountServiceTransferRequest];
    int v16 = [v15 supportsSplitPayment];

    if (v16)
    {
      uint64_t v17 = [(PKPaymentRequest *)self->_paymentRequest paymentSummaryItems];
      int v18 = [v17 lastObject];
      long long v19 = [v18 amount];

      if ([v19 compare:v6] != 1)
      {
        long long v20 = [(PKPaymentAuthorizationDataModel *)self itemForType:9];
        [(PKPaymentAuthorizationDataModel *)self _removeDataItem:v20];
      }
    }
  }
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setPaymentDateForPaymentRequest:(id)a3
{
  id v4 = a3;
  id v8 = [v4 paymentDate];
  uint64_t v5 = [v4 paymentFrequency];
  id v6 = [v4 paymentTimeZone];

  if ((unint64_t)(v5 - 4) < 4 || v5 == 2)
  {
    [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
    id v7 = [(PKPaymentAuthorizationDataModel *)self itemForType:10];
    [v7 setPaymentDate:v8];
    [v7 setPaymentFrequency:v5];
    [v7 setPaymentTimeZone:v6];
    [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
  }
}

- (NSString)merchantName
{
  unint64_t v3 = [(PKPaymentRequest *)self->_paymentRequest requestType];
  id v4 = [(PKPaymentRequest *)self->_paymentRequest paymentSummaryItems];
  uint64_t v5 = v4;
  if (v3 == 10) {
    [v4 firstObject];
  }
  else {
  id v6 = [v4 lastObject];
  }

  id v7 = [v6 label];

  return (NSString *)v7;
}

- (NSString)currencyCode
{
  return [(PKPaymentRequest *)self->_paymentRequest currencyCode];
}

- (void)setPaymentSummaryItems:(id)a3
{
  [(PKPaymentRequest *)self->_paymentRequest setPaymentSummaryItems:a3];
  id v4 = [(PKPaymentAuthorizationDataModel *)self paymentSummaryItems];
  unint64_t v5 = [v4 count];

  if (v5 >= 2) {
    [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  }
  if ([(PKPaymentRequest *)self->_paymentRequest requestType] == 2
    || ([(PKPaymentRequest *)self->_paymentRequest peerPaymentRequest],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (id v7 = (void *)v6,
        [(PKPeerPaymentQuote *)self->_peerPaymentQuote recipient],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    uint64_t v9 = [(PKPaymentAuthorizationDataModel *)self paymentSummaryItems];
    uint64_t v10 = [v9 count];

    if (v10 == 1)
    {
      int v11 = [(PKPaymentAuthorizationDataModel *)self itemForType:8];
      [(PKPaymentAuthorizationDataModel *)self _removeDataItem:v11];
    }
  }
  [(PKPaymentAuthorizationDataModel *)self _updatePeerPaymentPromotionAvailability];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (NSArray)paymentSummaryItems
{
  return [(PKPaymentRequest *)self->_paymentRequest paymentSummaryItems];
}

- (NSDecimalNumber)transactionAmount
{
  if ([(PKPaymentRequest *)self->_paymentRequest requestType] == 10)
  {
    unint64_t v3 = [(PKPaymentRequest *)self->_paymentRequest paymentSummaryItems];
    id v4 = [v3 lastObject];
    unint64_t v5 = [v4 amount];
  }
  else
  {
    unint64_t v3 = [(PKPaymentAuthorizationDataModel *)self totalSummaryItem];
    unint64_t v5 = [v3 amount];
  }

  return (NSDecimalNumber *)v5;
}

- (PKPaymentSummaryItem)totalSummaryItem
{
  unint64_t v3 = [(PKPaymentRequest *)self->_paymentRequest requestType];
  id v4 = [(PKPaymentRequest *)self->_paymentRequest paymentSummaryItems];
  unint64_t v5 = v4;
  if (v3 == 10) {
    [v4 firstObject];
  }
  else {
  uint64_t v6 = [v4 lastObject];
  }

  return (PKPaymentSummaryItem *)v6;
}

- (NSArray)items
{
  v2 = (void *)[(NSMutableArray *)self->_items copy];
  return (NSArray *)v2;
}

- (BOOL)isInlineSummaryItemsEligible
{
  if ([(PKPaymentRequest *)self->_paymentRequest requestType]
    && [(PKPaymentRequest *)self->_paymentRequest requestType] != 11)
  {
    return 0;
  }
  unint64_t v3 = [(PKPaymentRequest *)self->_paymentRequest multiTokenContexts];
  uint64_t v4 = [v3 count];

  if (v4) {
    return 0;
  }
  id v7 = [(PKPaymentRequest *)self->_paymentRequest recurringPaymentRequest];
  if (v7)
  {
    BOOL v5 = 0;
LABEL_8:

    return v5;
  }
  id v8 = [(PKPaymentRequest *)self->_paymentRequest automaticReloadPaymentRequest];

  if (!v8)
  {
    id v7 = [(PKPaymentRequest *)self->_paymentRequest deferredPaymentRequest];
    BOOL v5 = v7 == 0;
    goto LABEL_8;
  }
  return 0;
}

- (id)automaticallyPresentedPassFromAcceptedPasses:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(PKPaymentRequest *)self->_paymentRequest originatingURL];
  if ((uint64_t)self->_hostApplicationIdentifier | v6)
  {
    id v24 = v5;
    uint64_t v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (!v8) {
      goto LABEL_19;
    }
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (v6)
        {
          BOOL v13 = [*(id *)(*((void *)&v26 + 1) + 8 * i) associatedWebDomains];
          int v14 = [(id)v6 host];
          if ([v13 containsObject:v14])
          {
            char v15 = [v12 settings];

            if ((v15 & 0x10) != 0) {
              goto LABEL_15;
            }
          }
          else
          {
          }
        }
        if (!self->_hostApplicationIdentifier) {
          continue;
        }
        int v16 = [v12 associatedApplicationIdentifiers];
        if ([v16 containsObject:self->_hostApplicationIdentifier])
        {
          char v17 = [v12 settings];

          if ((v17 & 0x10) == 0) {
            continue;
          }
LABEL_15:
          -[NSObject addObject:](v25, "addObject:", v12, v24);
          continue;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
      if (!v9)
      {
LABEL_19:

        int v18 = v25;
        if ([v25 count])
        {
          long long v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"ingestedDate" ascending:1];
          BOOL v30 = v19;
          long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
          [v25 sortUsingDescriptors:v20];

          id v21 = [v25 firstObject];
        }
        else
        {
          id v21 = 0;
        }
        id v5 = v24;
        goto LABEL_26;
      }
    }
  }
  int v18 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    long long v22 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412290;
    int v33 = v22;
    _os_log_impl(&dword_190E10000, v18, OS_LOG_TYPE_DEFAULT, "Warning: %@ requested without a valid hostApplicationIdentifier or web domain. This is likely not what you want!", buf, 0xCu);
  }
  id v21 = 0;
LABEL_26:

  return v21;
}

- (void)setUpdateHandler:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id updateHandler = self->_updateHandler;
  self->_id updateHandler = v4;
}

- (void)beginUpdates
{
}

- (void)endUpdates
{
  unint64_t holdPendingUpdatesCount = self->_holdPendingUpdatesCount;
  if (holdPendingUpdatesCount)
  {
    self->_unint64_t holdPendingUpdatesCount = holdPendingUpdatesCount - 1;
    id updateHandler = (void (**)(void))self->_updateHandler;
    if (updateHandler) {
      updateHandler[2]();
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"No matching beginUpdates"];
  }
}

- (id)itemForType:(int64_t)a3
{
  typeToItemMap = self->_typeToItemMap;
  uint64_t v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)typeToItemMap objectForKey:v4];

  return v5;
}

- (void)_setDataItem:(id)a3
{
  id v7 = a3;
  if (([(id)objc_opt_class() supportsMultipleItems] & 1) == 0)
  {
    uint64_t v4 = -[PKPaymentAuthorizationDataModel itemForType:](self, "itemForType:", [v7 type]);
    if (v4) {
      [(PKPaymentAuthorizationDataModel *)self _removeDataItem:v4];
    }
    typeToItemMap = self->_typeToItemMap;
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "type"));
    [(NSMutableDictionary *)typeToItemMap setObject:v7 forKey:v6];
  }
  [(NSMutableArray *)self->_items insertObject:v7 atIndex:[(PKPaymentAuthorizationDataModel *)self _insertionIndexForItem:v7]];
}

- (void)_setPaymentContentDataItems:(id)a3
{
  items = self->_items;
  id v5 = a3;
  id v9 = [(NSMutableArray *)items indexesOfObjectsPassingTest:&__block_literal_global_111];
  [(NSMutableArray *)self->_items removeObjectsAtIndexes:v9];
  id v6 = objc_alloc(MEMORY[0x1E4F28D60]);
  id v7 = [v5 firstObject];
  uint64_t v8 = objc_msgSend(v6, "initWithIndexesInRange:", -[PKPaymentAuthorizationDataModel _insertionIndexForItem:](self, "_insertionIndexForItem:", v7), objc_msgSend(v5, "count"));

  [(NSMutableArray *)self->_items insertObjects:v5 atIndexes:v8];
}

BOOL __63__PKPaymentAuthorizationDataModel__setPaymentContentDataItems___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

- (unint64_t)_insertionIndexForItem:(id)a3
{
  items = self->_items;
  id v5 = a3;
  uint64_t v6 = [(NSMutableArray *)items count];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__PKPaymentAuthorizationDataModel__insertionIndexForItem___block_invoke;
  v9[3] = &unk_1E56DFBE8;
  v9[4] = self;
  unint64_t v7 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](items, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, v6, 1024, v9);

  return v7;
}

uint64_t __58__PKPaymentAuthorizationDataModel__insertionIndexForItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  uint64_t v7 = objc_msgSend(v5, "_displayOrderForDataType:", objc_msgSend(a2, "type"));
  uint64_t v8 = *(void **)(a1 + 32);
  uint64_t v9 = [v6 type];

  uint64_t v10 = [v8 _displayOrderForDataType:v9];
  if (v7 < v10) {
    return -1;
  }
  else {
    return v7 != v10;
  }
}

- (int64_t)_displayOrderForDataType:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      int64_t result = 2;
      break;
    case 2:
      if ([(PKPaymentRequest *)self->_paymentRequest requestType] == 1) {
        int64_t result = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        int64_t result = 0;
      }
      break;
    case 3:
      if ([(PKPaymentRequest *)self->_paymentRequest requestType] == 1) {
        int64_t result = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        int64_t result = 1;
      }
      break;
    case 4:
      int64_t result = 5;
      break;
    case 5:
      int64_t result = 7;
      break;
    case 6:
      int64_t result = 8;
      break;
    case 7:
      int64_t result = 9;
      break;
    case 8:
      int64_t result = 13;
      break;
    case 9:
      int64_t result = 3;
      break;
    case 10:
      int64_t result = 4;
      break;
    case 11:
      int64_t result = 10;
      break;
    case 12:
      int64_t result = 6;
      break;
    case 13:
      int64_t result = 11;
      break;
    default:
      int64_t result = 0x7FFFFFFFFFFFFFFFLL;
      break;
  }
  return result;
}

- (NSString)defaultPaymentPassUniqueIdentifier
{
  v2 = [(PKPaymentAuthorizationDataModel *)self paymentRequest];
  unint64_t v3 = +[PKPassLibrary sharedInstance];
  uint64_t v4 = [v3 _defaultPaymentPassForPaymentRequest:v2];

  id v5 = [v4 uniqueID];

  return (NSString *)v5;
}

- (void)_ensureItems
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  [(PKPaymentAuthorizationDataModel *)self _ensurePlaceholderItems];
  int64_t mode = self->_mode;
  if (mode != 3)
  {
    if (mode != 1) {
      goto LABEL_37;
    }
    if ([(PKPaymentRequest *)self->_paymentRequest requestType] == 1)
    {
      uint64_t v4 = [(PKPaymentRequest *)self->_paymentRequest passTypeIdentifier];
      id v5 = [(PKPaymentRequest *)self->_paymentRequest passSerialNumber];
      if ([v4 length] && objc_msgSend(v5, "length"))
      {
        id v6 = [(PKPaymentAuthorizationDataModel *)self library];
        uint64_t v7 = [v6 passWithPassTypeIdentifier:v4 serialNumber:v5];
        uint64_t v8 = [v7 paymentPass];

        if (v8) {
          [(PKPaymentAuthorizationDataModel *)self setPass:v8];
        }
      }
      else
      {
        int v14 = [(PKPaymentAuthorizationDataModel *)self library];
        uint64_t v8 = [v14 defaultPaymentPassesWithRemotePasses:0];

        if ([v8 count])
        {
          char v15 = [v8 firstObject];
          [(PKPaymentAuthorizationDataModel *)self setPass:v15];
        }
      }

LABEL_32:
      if (![(PKPaymentRequest *)self->_paymentRequest _isAMPPayment])
      {
        unint64_t v31 = [(PKPaymentRequest *)self->_paymentRequest requestType];
        if (v31 > 5 || ((1 << v31) & 0x2C) == 0) {
          goto LABEL_37;
        }
      }
      goto LABEL_35;
    }
    uint64_t v4 = [(PKPaymentAuthorizationDataModel *)self acceptedPasses];
    if ([(PKPaymentRequest *)self->_paymentRequest isPayLaterPaymentRequest])
    {
      uint64_t v9 = [(PKPaymentRequest *)self->_paymentRequest payLaterPaymentRequest];
      uint64_t v10 = [v9 defaultBankAccount];
      int v11 = [v9 defaultPassUniqueID];
      BOOL v12 = v11;
      if (v11)
      {
        v115[0] = MEMORY[0x1E4F143A8];
        v115[1] = 3221225472;
        v115[2] = __47__PKPaymentAuthorizationDataModel__ensureItems__block_invoke;
        v115[3] = &unk_1E56DE6C8;
        id v116 = v11;
        uint64_t v13 = objc_msgSend(v4, "pk_firstObjectPassingTest:", v115);
      }
      else
      {
        uint64_t v13 = 0;
      }
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v13 = 0;
    }
    if ([(PKPaymentRequest *)self->_paymentRequest isVirtualCardRequest]
      || ([(PKPaymentRequest *)self->_paymentRequest peerPaymentRequest],
          int v16 = objc_claimAutoreleasedReturnValue(),
          [v16 peerPaymentQuote],
          char v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = [v17 isRecurringPayment],
          v17,
          v16,
          v18))
    {
      long long v19 = [(PKPaymentRequest *)self->_paymentRequest passSerialNumber];
      long long v20 = v19;
      if (v19)
      {
        v113[0] = MEMORY[0x1E4F143A8];
        v113[1] = 3221225472;
        v113[2] = __47__PKPaymentAuthorizationDataModel__ensureItems__block_invoke_2;
        v113[3] = &unk_1E56DE6C8;
        id v114 = v19;
        uint64_t v21 = objc_msgSend(v4, "pk_firstObjectPassingTest:", v113);

        uint64_t v13 = v21;
      }
    }
    if ([(PKPaymentRequest *)self->_paymentRequest isServiceProviderPaymentRequest])
    {
      long long v22 = [(PKPaymentRequest *)self->_paymentRequest serviceProviderOrder];
      uint64_t v23 = [v22 serviceProviderData];

      id v24 = [v23 objectForKey:@"primaryAccountIdentifier"];
      uint64_t v25 = [(PKPaymentAuthorizationDataModel *)self library];
      uint64_t v26 = [v25 passWithFPANIdentifier:v24];

      uint64_t v13 = v26;
    }
    if (!(v13 | v10))
    {
      uint64_t v13 = objc_msgSend(v4, "pk_firstObjectPassingTest:", &__block_literal_global_116);
    }
    long long v27 = [(PKPaymentAuthorizationDataModel *)self automaticallyPresentedPassFromAcceptedPasses:v4];
    if (v27)
    {
      [(PKPaymentAuthorizationDataModel *)self setPass:v27];
      long long v28 = self;
      long long v29 = v27;
    }
    else
    {
      if (!v13)
      {
        if (v10)
        {
          [(PKPaymentAuthorizationDataModel *)self setBankAccount:v10];
        }
        else if (self->_supportsEmptyPass)
        {
          [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
          [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
        }
        goto LABEL_31;
      }
      [(PKPaymentAuthorizationDataModel *)self setPass:v13];
      long long v28 = self;
      long long v29 = (void *)v13;
    }
    BOOL v30 = [(PKPaymentAuthorizationDataModel *)v28 defaultSelectedPaymentApplicationForPass:v29];
    [(PKPaymentAuthorizationDataModel *)self setPaymentApplication:v30];

LABEL_31:
    goto LABEL_32;
  }
LABEL_35:
  int v32 = [(PKPaymentRequest *)self->_paymentRequest paymentContentItems];
  uint64_t v33 = [v32 count];

  if (v33)
  {
    uint64_t v34 = [(PKPaymentRequest *)self->_paymentRequest paymentContentItems];
    [(PKPaymentAuthorizationDataModel *)self setPaymentContentItems:v34];
  }
LABEL_37:
  ABRecordRef v35 = [(PKPaymentRequest *)self->_paymentRequest recurringPaymentRequest];
  [(PKPaymentAuthorizationDataModel *)self setRecurringPaymentRequest:v35];

  uint64_t v36 = [(PKPaymentRequest *)self->_paymentRequest automaticReloadPaymentRequest];
  [(PKPaymentAuthorizationDataModel *)self setAutomaticReloadPaymentRequest:v36];

  objc_super v37 = [(PKPaymentRequest *)self->_paymentRequest deferredPaymentRequest];
  [(PKPaymentAuthorizationDataModel *)self setDeferredPaymentRequest:v37];

  long long v38 = [(PKPaymentRequest *)self->_paymentRequest multiTokenContexts];
  [(PKPaymentAuthorizationDataModel *)self setMultiTokenContexts:v38];

  if ([(PKPaymentRequest *)self->_paymentRequest supportsCouponCode])
  {
    long long v39 = [(PKPaymentRequest *)self->_paymentRequest couponCode];
    [(PKPaymentAuthorizationDataModel *)self setCouponCode:v39];
  }
  int v40 = [(PKPaymentRequest *)self->_paymentRequest availableShippingMethods];
  long long v41 = [v40 methods];
  uint64_t v42 = [v41 count];

  if (v42)
  {
    v43 = [(PKPaymentRequest *)self->_paymentRequest availableShippingMethods];
    v44 = [v43 defaultMethod];
    [(PKPaymentAuthorizationDataModel *)self setShippingMethod:v44];
  }
  v45 = PKShippingTypeToString([(PKPaymentRequest *)self->_paymentRequest shippingType]);
  [(PKPaymentAuthorizationDataModel *)self setShippingType:v45];

  [(PKPaymentAuthorizationDataModel *)self setShippingEditable:[(PKPaymentRequest *)self->_paymentRequest isShippingEditable]];
  v46 = [(PKPaymentRequest *)self->_paymentRequest shippingEditableMessage];
  [(PKPaymentAuthorizationDataModel *)self setShippingEditableMessage:v46];

  char v47 = [(PKPaymentRequest *)self->_paymentRequest requiredBillingContactFields];
  int v48 = [v47 containsObject:@"post"];

  if (v48)
  {
    v49 = [(PKPaymentRequest *)self->_paymentRequest billingContact];

    paymentRequest = self->_paymentRequest;
    if (v49)
    {
      v51 = [(PKPaymentRequest *)paymentRequest billingContact];
      v52 = [v51 cnMutableContact];
    }
    else if ([(PKPaymentRequest *)paymentRequest billingAddress])
    {
      v52 = objc_msgSend(MEMORY[0x1E4F1B8F8], "contactWithABRecordRef:", -[PKPaymentRequest billingAddress](self->_paymentRequest, "billingAddress"));
    }
    else
    {
      v52 = 0;
    }
    [(PKPaymentAuthorizationDataModel *)self setBillingAddress:v52];
  }
  v53 = [(PKPaymentRequest *)self->_paymentRequest shippingContact];

  v54 = self->_paymentRequest;
  if (v53)
  {
    v55 = [(PKPaymentRequest *)v54 shippingContact];
    uint64_t v56 = [v55 cnMutableContact];

    [v56 setContactSource:4];
  }
  else if ([(PKPaymentRequest *)v54 shippingAddress])
  {
    uint64_t v56 = objc_msgSend(MEMORY[0x1E4F1B8F8], "contactWithABRecordRef:", -[PKPaymentRequest shippingAddress](self->_paymentRequest, "shippingAddress"));
  }
  else
  {
    uint64_t v56 = 0;
  }
  v57 = [(PKPaymentRequest *)self->_paymentRequest requiredShippingContactFields];
  if ([v57 containsObject:@"post"])
  {
    v58 = [v56 postalAddresses];
    uint64_t v59 = [v58 count];

    if (v59) {
      [(PKPaymentAuthorizationDataModel *)self setShippingAddress:v56];
    }
  }
  else
  {
  }
  v60 = [(PKPaymentRequest *)self->_paymentRequest requiredShippingContactFields];
  if ([v60 containsObject:@"email"])
  {
    v57 = [v56 emailAddresses];
    uint64_t v61 = [v57 count];

    if (v61) {
      [(PKPaymentAuthorizationDataModel *)self setShippingEmail:v56];
    }
  }
  else
  {
  }
  uint64_t v62 = [(PKPaymentRequest *)self->_paymentRequest requiredShippingContactFields];
  if ([v62 containsObject:@"phone"])
  {
    v57 = [v56 phoneNumbers];
    uint64_t v63 = [v57 count];

    if (v63) {
      [(PKPaymentAuthorizationDataModel *)self setShippingPhone:v56];
    }
  }
  else
  {
  }
  v64 = [(PKPaymentRequest *)self->_paymentRequest requiredShippingContactFields];
  char v65 = [v64 containsObject:@"name"];
  if ((v65 & 1) != 0
    || ([(PKPaymentRequest *)self->_paymentRequest requiredShippingContactFields],
        v57 = objc_claimAutoreleasedReturnValue(),
        ([v57 containsObject:@"phoneticName"] & 1) != 0))
  {
    v66 = [(PKPaymentRequest *)self->_paymentRequest shippingContact];
    v67 = [v66 name];

    if ((v65 & 1) == 0) {
    if (v67)
    }
      [(PKPaymentAuthorizationDataModel *)self setShippingName:v56];
  }
  else
  {
  }
  if ([(PKPaymentRequest *)self->_paymentRequest isPeerPaymentRequest])
  {
    v68 = +[PKPassLibrary sharedInstance];
    v69 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
    int v70 = [v68 passWithUniqueID:v69];
    peerPaymentPass = self->_peerPaymentPass;
    self->_peerPaymentPass = v70;

    v72 = [(PKPaymentRequest *)self->_paymentRequest peerPaymentRequest];
    v73 = [v72 peerPaymentQuote];
    if ([(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsPreserveCurrentBalance])
    {
      v74 = [v73 recipient];
      if (v74) {
        char v75 = 1;
      }
      else {
        char v75 = [v72 hasUndeterminedRecipient];
      }
      self->_supportsPreservePeerPaymentBalance = v75;

      if (self->_supportsPreservePeerPaymentBalance) {
        self->_usePeerPaymentBalance = ([(PKObject *)self->_peerPaymentPass settings] & 0x800) == 0;
      }
    }
    else
    {
      self->_supportsPreservePeerPaymentBalance = 0;
    }
    v76 = self->_peerPaymentPass;
    v77 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount currentBalance];
    [(PKSecureElementPass *)v76 setPeerPaymentBalance:v77];

    [(PKPaymentAuthorizationDataModel *)self setPeerPaymentQuote:v73];
  }
  if ([(PKPaymentRequest *)self->_paymentRequest requestType] == 2
    && [(PKPaymentRequest *)self->_paymentRequest accountPaymentSupportsPeerPayment])
  {
    v78 = +[PKPassLibrary sharedInstance];
    uint64_t v79 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
    v80 = [v78 passWithUniqueID:v79];
    v81 = self->_peerPaymentPass;
    self->_peerPaymentPass = v80;

    id v82 = self->_peerPaymentPass;
    uint64_t v83 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount currentBalance];
    [(PKSecureElementPass *)v82 setPeerPaymentBalance:v83];

    uint64_t v84 = [(PKSecureElementPass *)self->_peerPaymentPass peerPaymentBalance];
    BOOL v85 = [(PKPaymentRequest *)self->_paymentRequest accountPaymentUsePeerPaymentBalance];
    self->_usePeerPaymentBalance = v85;
    if (v85) {
      [(PKPaymentAuthorizationDataModel *)self setPeerPaymentBalanceForAccountPayment:v84];
    }
  }
  if ([(PKPaymentRequest *)self->_paymentRequest requestType] == 2)
  {
    v86 = [(PKPaymentRequest *)self->_paymentRequest bankAccounts];
    uint64_t v87 = [v86 count];

    if (v87)
    {
      v88 = [(PKPaymentRequest *)self->_paymentRequest bankAccounts];
      v89 = [(PKPaymentRequest *)self->_paymentRequest accountServiceTransferRequest];
      v90 = v89;
      if (!v89 || ([v89 defaultBankAccount], (id v91 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
        id v91 = [v88 firstObject];
        if ((unint64_t)[v88 count] >= 2)
        {
          v92 = PKSharedCacheGetStringForKey(@"LastBankAccountIdentifier");
          if ([v92 length])
          {
            long long v111 = 0u;
            long long v112 = 0u;
            long long v109 = 0u;
            long long v110 = 0u;
            obuint64_t j = v88;
            uint64_t v93 = [obj countByEnumeratingWithState:&v109 objects:v117 count:16];
            if (v93)
            {
              uint64_t v94 = v93;
              long long v105 = v91;
              v106 = v90;
              v107 = v88;
              uint64_t v95 = *(void *)v110;
              while (2)
              {
                for (uint64_t i = 0; i != v94; ++i)
                {
                  if (*(void *)v110 != v95) {
                    objc_enumerationMutation(obj);
                  }
                  v97 = *(void **)(*((void *)&v109 + 1) + 8 * i);
                  long long v98 = objc_msgSend(v97, "identifier", v105);
                  id v99 = v92;
                  id v100 = v98;
                  if (v99 == v100)
                  {

LABEL_107:
                    id v91 = v97;

                    v90 = v106;
                    v88 = v107;
                    goto LABEL_108;
                  }
                  long long v101 = v100;
                  if (v92 && v100)
                  {
                    int v102 = [v99 isEqualToString:v100];

                    if (v102) {
                      goto LABEL_107;
                    }
                  }
                  else
                  {
                  }
                }
                uint64_t v94 = [obj countByEnumeratingWithState:&v109 objects:v117 count:16];
                if (v94) {
                  continue;
                }
                break;
              }
              v90 = v106;
              v88 = v107;
              id v91 = v105;
            }
LABEL_108:
          }
        }
      }
      [(PKPaymentAuthorizationDataModel *)self setBankAccount:v91];
      long long v103 = [(PKPaymentAuthorizationDataModel *)self itemForType:9];
      long long v104 = [(PKSecureElementPass *)self->_peerPaymentPass peerPaymentBalance];
      [v103 setPeerPaymentBalance:v104];
    }
  }
  if ([(PKPaymentRequest *)self->_paymentRequest requestType] == 2) {
    [(PKPaymentAuthorizationDataModel *)self setPaymentDateForPaymentRequest:self->_paymentRequest];
  }
  [(PKPaymentAuthorizationDataModel *)self _updatePeerPaymentPromotionAvailability];
}

uint64_t __47__PKPaymentAuthorizationDataModel__ensureItems__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 uniqueID];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

uint64_t __47__PKPaymentAuthorizationDataModel__ensureItems__block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 serialNumber];
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  uint64_t v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

uint64_t __47__PKPaymentAuthorizationDataModel__ensureItems__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isPayLaterPass] ^ 1;
}

- (void)refreshPaymentMethods
{
  unavailablePasses = self->_unavailablePasses;
  self->_unavailablePasses = 0;

  acceptedPasses = self->_acceptedPasses;
  self->_acceptedPasses = 0;

  [(PKPayLaterFinancingController *)self->_financingController refreshAvailableFundingSources];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)refreshPaymentMethodsAndNotifyFinancingController:(BOOL)a3
{
  BOOL v3 = a3;
  unavailablePasses = self->_unavailablePasses;
  self->_unavailablePasses = 0;

  acceptedPasses = self->_acceptedPasses;
  self->_acceptedPasses = 0;

  if (v3) {
    [(PKPayLaterFinancingController *)self->_financingController refreshAvailableFundingSources];
  }
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)_updatePeerPaymentPromotionAvailability
{
  if ([(PKPaymentRequest *)self->_paymentRequest requestType]) {
    BOOL v3 = [(PKPaymentRequest *)self->_paymentRequest requestType] != 11;
  }
  else {
    BOOL v3 = 0;
  }
  if (self->_mode != 1
    || v3
    || [(PKPaymentRequest *)self->_paymentRequest isPeerPaymentRequest]
    || !self->_peerPaymentPass)
  {
    return;
  }
  id v22 = [(PKPaymentAuthorizationDataModel *)self itemForType:+[PKPaymentCardDataItem dataType]];
  if (![(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsCardBalancePromotion]) {
    goto LABEL_12;
  }
  uint64_t v4 = [(PKObject *)self->_pass uniqueID];
  id v5 = [(PKObject *)self->_peerPaymentPass uniqueID];
  id v6 = v5;
  if (!v4 || !v5)
  {

    if (v4 == v6) {
      goto LABEL_12;
    }
LABEL_15:
    uint64_t v8 = [(PKSecureElementPass *)self->_peerPaymentPass peerPaymentBalance];
    uint64_t v9 = [(PKPaymentRequest *)self->_paymentRequest paymentSummaryItems];
    uint64_t v10 = [v9 lastObject];

    if (![v10 type])
    {
      int v11 = [v8 currency];
      BOOL v12 = [(PKPaymentRequest *)self->_paymentRequest currencyCode];
      if ([v11 caseInsensitiveCompare:v12])
      {
      }
      else
      {
        uint64_t v13 = [v8 amount];
        int v14 = [v10 amount];
        uint64_t v15 = [v13 compare:v14];

        if (v15 != -1)
        {
          int v16 = [MEMORY[0x1E4F28C28] zero];
          char v17 = [v10 amount];
          uint64_t v18 = [v16 compare:v17];

          [v22 setShowPeerPaymentBalance:v18 == -1];
          [v22 setPeerPaymentBalance:v8];
          if (v18 == -1
            && [(PKPaymentRequest *)self->_paymentRequest isPayLaterPaymentRequest])
          {
            long long v19 = [(PKPaymentAuthorizationDataModel *)self itemForType:+[PKBankAccountDataItem dataType]];
            long long v20 = [(PKPaymentRequest *)self->_paymentRequest payLaterPaymentRequest];
            uint64_t v21 = [v20 showPeerPaymentBalance];
            [v22 setShowPeerPaymentBalance:v21];
            [v19 setShowPeerPaymentBalance:v21];
          }
          goto LABEL_19;
        }
      }
    }
    [v22 setShowPeerPaymentBalance:0];
    [v22 setPeerPaymentBalance:v8];
LABEL_19:

    goto LABEL_20;
  }
  char v7 = [v4 isEqual:v5];

  if ((v7 & 1) == 0) {
    goto LABEL_15;
  }
LABEL_12:
  [v22 setShowPeerPaymentBalance:0];
LABEL_20:
}

- (void)updatePeerPaymentPromotionForPeerPaymentQuote:(BOOL)a3
{
  if (self->_supportsPreservePeerPaymentBalance)
  {
    peerPaymentQuote = self->_peerPaymentQuote;
    if (peerPaymentQuote)
    {
      BOOL v5 = a3;
      id v6 = [(PKPeerPaymentQuote *)peerPaymentQuote recipient];
      if (v6)
      {
      }
      else
      {
        char v7 = [(PKPaymentRequest *)self->_paymentRequest peerPaymentRequest];
        int v8 = [v7 hasUndeterminedRecipient];

        if (!v8) {
          return;
        }
      }
      id v13 = [(PKPaymentAuthorizationDataModel *)self itemForType:+[PKPaymentCardDataItem dataType]];
      if ([(PKPeerPaymentAccount *)self->_peerPaymentAccount supportsCardBalancePromotion])
      {
        uint64_t v9 = [(PKSecureElementPass *)self->_peerPaymentPass peerPaymentBalance];
        if (v9)
        {
          uint64_t v10 = [MEMORY[0x1E4F28C28] zero];
          int v11 = [v9 amount];
          BOOL v12 = [v10 compare:v11] == -1;
        }
        else
        {
          BOOL v12 = 0;
        }
        [v13 setShowPeerPaymentBalance:v5 & v12];
        [v13 setPeerPaymentBalance:v9];
      }
      else
      {
        [v13 setShowPeerPaymentBalance:0];
      }
    }
  }
}

- (BOOL)shouldShowPeerPaymentBalanceToggle
{
  if (!self->_supportsPreservePeerPaymentBalance) {
    return 0;
  }
  peerPaymentQuote = self->_peerPaymentQuote;
  if (!peerPaymentQuote) {
    return 0;
  }
  uint64_t v4 = [(PKPeerPaymentQuote *)peerPaymentQuote recipient];
  if (v4)
  {
    char v5 = 1;
  }
  else
  {
    id v6 = [(PKPaymentRequest *)self->_paymentRequest peerPaymentRequest];
    char v5 = [v6 hasUndeterminedRecipient];
  }
  return v5;
}

- (id)enhancedMerchantInfoForPass:(id)a3
{
  if ([a3 isAppleCardPass]) {
    uint64_t v4 = self->_appleCardEnhancedMerchant;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4;
}

- (void)setEnhancedMerchantInfo:(id)a3 forPass:(id)a4
{
  char v7 = (PKAccountEnhancedMerchant *)a3;
  if ([a4 isAppleCardPass])
  {
    appleCardEnhancedMerchant = self->_appleCardEnhancedMerchant;
    if (v7 && appleCardEnhancedMerchant)
    {
      if ([(PKAccountEnhancedMerchant *)appleCardEnhancedMerchant isEqual:v7]) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
    if (appleCardEnhancedMerchant != v7)
    {
LABEL_7:
      objc_storeStrong((id *)&self->_appleCardEnhancedMerchant, a3);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__PKPaymentAuthorizationDataModel_setEnhancedMerchantInfo_forPass___block_invoke;
      block[3] = &unk_1E56D8AE0;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
LABEL_8:
}

uint64_t __67__PKPaymentAuthorizationDataModel_setEnhancedMerchantInfo_forPass___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyModelChanged];
}

- (void)_didSetItemForClass:(Class)a3
{
  -[PKPaymentAuthorizationDataModel _ensureItemForClass:](self, "_ensureItemForClass:");
  id v5 = [(PKPaymentAuthorizationDataModel *)self itemForType:[(objc_class *)a3 dataType]];
  if ([v5 status] == 1) {
    -[PKPaymentAuthorizationDataModel setStatus:forItemWithType:notify:](self, "setStatus:forItemWithType:notify:", 0, [v5 type], 0);
  }
}

- (void)_ensureItemForClass:(Class)a3
{
  id v5 = [(PKPaymentAuthorizationDataModel *)self itemForType:[(objc_class *)a3 dataType]];
  if (!v5)
  {
    id v6 = (id)[[a3 alloc] initWithModel:self];
    [(PKPaymentAuthorizationDataModel *)self _setDataItem:v6];
    id v5 = v6;
  }
}

- (void)_removeDataItem:(id)a3
{
  if (a3)
  {
    items = self->_items;
    id v5 = a3;
    [(NSMutableArray *)items removeObject:v5];
    typeToItemMap = self->_typeToItemMap;
    char v7 = NSNumber;
    uint64_t v8 = [v5 type];

    id v9 = [v7 numberWithInteger:v8];
    [(NSMutableDictionary *)typeToItemMap removeObjectForKey:v9];
  }
}

- (void)_ensurePaymentContentItems
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_paymentContentItems;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        uint64_t v10 = [PKPaymentContentDataItem alloc];
        int v11 = -[PKPaymentContentDataItem initWithContentItem:](v10, "initWithContentItem:", v9, (void)v12);
        [(PKPaymentDataItem *)v11 setStatus:0];
        [v3 addObject:v11];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [(PKPaymentAuthorizationDataModel *)self _setPaymentContentDataItems:v3];
}

- (void)_ensurePlaceholderItems
{
  id v3 = [(PKPaymentRequest *)self->_paymentRequest requiredShippingContactFields];
  int v4 = [v3 containsObject:@"post"];

  if (v4) {
    [(PKPaymentAuthorizationDataModel *)self _ensureItemForClass:objc_opt_class()];
  }
  if ([(PKPaymentAuthorizationDataModel *)self shouldUpdateContactDataItem]) {
    [(PKPaymentAuthorizationDataModel *)self _ensureItemForClass:objc_opt_class()];
  }
  uint64_t v5 = [(PKPaymentRequest *)self->_paymentRequest paymentSummaryItems];
  unint64_t v6 = [v5 count];

  if (v6 >= 2)
  {
    uint64_t v7 = objc_opt_class();
    [(PKPaymentAuthorizationDataModel *)self _ensureItemForClass:v7];
  }
}

- (void)_notifyModelChanged
{
  id updateHandler = (void (**)(void))self->_updateHandler;
  if (updateHandler)
  {
    if (!self->_holdPendingUpdatesCount) {
      updateHandler[2]();
    }
  }
}

- (id)_additionalEligiblePaymentPassesForPaymentRequest:(id)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (self->_financingController && _os_feature_enabled_impl())
  {
    unint64_t v5 = [(PKPayLaterFinancingController *)self->_financingController payLaterPassEligibility];
    unint64_t v6 = [(PKPayLaterFinancingController *)self->_financingController payLaterPass];
    if (v6 && (v5 == 4 || v5 == 1))
    {
      uint64_t v7 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Adding pay later pass to accepted passes array", v10, 2u);
      }

      [v4 safelyAddObject:v6];
    }
  }
  if ([v4 count]) {
    uint64_t v8 = (void *)[v4 copy];
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_inAppPaymentPassesForPaymentRequest:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PKPaymentAuthorizationDataModel *)self _additionalEligiblePaymentPassesForPaymentRequest:v4];
  unint64_t v6 = [(PKPaymentAuthorizationDataModel *)self library];
  uint64_t v7 = [v6 _sortedPaymentPassesForPaymentRequest:v4 additionalPaymentPasses:v5];

  uint64_t v8 = [(PKPaymentAuthorizationDataModel *)self _filterAndProcessPaymentPassesUsingConfiguration:v7 additionalPaymentPasses:v5];

  return v8;
}

- (id)_inAppPrivateLabelPaymentPasses
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!self->_hostApplicationIdentifier)
  {
    id v4 = [(PKPaymentRequest *)self->_paymentRequest originatingURL];

    if (!v4)
    {
      unint64_t v5 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v6 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412290;
        uint64_t v21 = v6;
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Warning: %@ requested without a valid hostApplicationIdentifier. This is likely not what you want!", buf, 0xCu);
      }
    }
  }
  uint64_t v7 = [(PKPaymentRequest *)self->_paymentRequest originatingURL];

  uint64_t v8 = [(PKPaymentAuthorizationDataModel *)self library];
  if (v7)
  {
    uint64_t v9 = [(PKPaymentRequest *)self->_paymentRequest originatingURL];
    uint64_t v10 = [v9 host];
    int v11 = [(PKPaymentRequest *)self->_paymentRequest supportedCountries];
    long long v12 = objc_msgSend(v8, "inAppPrivateLabelPaymentPassesForWebDomain:issuerCountryCodes:isMultiTokensRequest:", v10, v11, -[PKPaymentRequest isMultiTokenRequest](self->_paymentRequest, "isMultiTokenRequest"));
  }
  else
  {
    hostApplicationIdentifier = self->_hostApplicationIdentifier;
    uint64_t v9 = [(PKPaymentRequest *)self->_paymentRequest supportedCountries];
    long long v12 = objc_msgSend(v8, "inAppPrivateLabelPaymentPassesForApplicationIdentifier:issuerCountryCodes:isMultiTokensRequest:", hostApplicationIdentifier, v9, -[PKPaymentRequest isMultiTokenRequest](self->_paymentRequest, "isMultiTokenRequest"));
  }

  long long v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"ingestedDate" ascending:1];
  long long v19 = v14;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  int v16 = [v12 sortedArrayUsingDescriptors:v15];

  uint64_t v17 = [(PKPaymentAuthorizationDataModel *)self _filterAndProcessPaymentPassesUsingConfiguration:v16 additionalPaymentPasses:0];

  return v17;
}

- (id)_filterAndProcessPaymentApplicationsUsingConfiguration:(id)a3 withPrimaryPaymentApplication:(id)a4 passHasAssociatedPeerPaymentAccount:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = v8;
  if ([(PKPaymentRequest *)self->_paymentRequest isPayLaterPaymentRequest]) {
    BOOL v11 = !v5;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11
    || ([(PKPaymentRequest *)self->_paymentRequest payLaterPaymentRequest],
        long long v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v12 supportedRepaymentTypes],
        v12,
        long long v14 = v10,
        (v13 & 4) == 0))
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __156__PKPaymentAuthorizationDataModel__filterAndProcessPaymentApplicationsUsingConfiguration_withPrimaryPaymentApplication_passHasAssociatedPeerPaymentAccount___block_invoke;
    v35[3] = &unk_1E56DFC10;
    v35[4] = self;
    long long v14 = objc_msgSend(v10, "pk_objectsPassingTest:", v35);
  }
  long long v15 = [(PKPaymentRequest *)self->_paymentRequest originatingURL];

  if (v15)
  {
    int v16 = self->_paymentWebService;
    uint64_t v17 = [(PKPaymentWebService *)v16 context];
    uint64_t v18 = [v17 configuration];
    long long v19 = [v18 unsupportedWebPaymentConfigurations];

    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __156__PKPaymentAuthorizationDataModel__filterAndProcessPaymentApplicationsUsingConfiguration_withPrimaryPaymentApplication_passHasAssociatedPeerPaymentAccount___block_invoke_2;
    v33[3] = &unk_1E56DFC38;
    v33[4] = self;
    id v34 = v19;
    id v20 = v19;
    uint64_t v21 = objc_msgSend(v14, "pk_objectsPassingTest:", v33);

    long long v14 = (void *)v21;
  }
  uint64_t v22 = [(PKPaymentRequest *)self->_paymentRequest remoteNetworkRequestPaymentTopicID];
  uint64_t v23 = [v22 length];

  if (v23)
  {
    id v24 = +[PKWebServiceRemoteNetworkPaymentFeature remoteNetworkPaymentFeatureWithWebService:self->_paymentWebService];
    uint64_t v25 = v24;
    if (v24 && ![v24 enabled])
    {
      uint64_t v26 = MEMORY[0x1E4F1CBF0];
    }
    else
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __156__PKPaymentAuthorizationDataModel__filterAndProcessPaymentApplicationsUsingConfiguration_withPrimaryPaymentApplication_passHasAssociatedPeerPaymentAccount___block_invoke_3;
      v31[3] = &unk_1E56DFC10;
      id v32 = v25;
      uint64_t v26 = objc_msgSend(v14, "pk_objectsPassingTest:", v31);

      long long v14 = v32;
    }

    long long v14 = (void *)v26;
  }
  long long v27 = PKSortedPaymentApplicationsByAID(v14, v9, 1);

  long long v28 = [(PKPaymentRequest *)self->_paymentRequest countryCode];
  long long v29 = PKSortedPaymentApplicationsBySupportedInAppMerchantCountryCode(v27, v28);

  return v29;
}

uint64_t __156__PKPaymentAuthorizationDataModel__filterAndProcessPaymentApplicationsUsingConfiguration_withPrimaryPaymentApplication_passHasAssociatedPeerPaymentAccount___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 paymentRequestSupportedQuery];
  uint64_t v5 = [v3 canProcessPayment:v4];

  return v5;
}

uint64_t __156__PKPaymentAuthorizationDataModel__filterAndProcessPaymentApplicationsUsingConfiguration_withPrimaryPaymentApplication_passHasAssociatedPeerPaymentAccount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = objc_msgSend(v4, "supportsWebPaymentMode:withExclusionList:", objc_msgSend(v3, "requestedMode"), *(void *)(a1 + 40));

  return v5;
}

uint64_t __156__PKPaymentAuthorizationDataModel__filterAndProcessPaymentApplicationsUsingConfiguration_withPrimaryPaymentApplication_passHasAssociatedPeerPaymentAccount___block_invoke_3(uint64_t a1, void *a2)
{
  if (!*(void *)(a1 + 32)) {
    return 1;
  }
  uint64_t v3 = [a2 paymentNetworkIdentifier];
  id v4 = [*(id *)(a1 + 32) unsupportedNetworks];
  uint64_t v5 = [NSNumber numberWithInteger:v3];
  uint64_t v6 = [v4 containsObject:v5] ^ 1;

  return v6;
}

- (id)_filterAndProcessPaymentPassesUsingConfiguration:(id)a3 additionalPaymentPasses:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [v6 count];
  uint64_t v9 = [v7 count];
  id v10 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    id v32 = @"N";
    *(_DWORD *)buf = 134218498;
    unint64_t v50 = v8;
    if (!v6) {
      id v32 = @"Y";
    }
    __int16 v51 = 2112;
    v52 = v32;
    __int16 v53 = 2048;
    uint64_t v54 = v9;
    _os_log_debug_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEBUG, "Pass filtering: Passes passed into _filterAndProcessPaymentPassesUsingConfiguration: %ld, isNil: %@, additionalPaymentPasses: %ld", buf, 0x20u);
  }

  BOOL v11 = objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global_130);
  long long v12 = [(PKPaymentRequest *)self->_paymentRequest originatingURL];

  char v13 = (void *)&unk_191661000;
  if (v12)
  {
    long long v14 = self->_paymentWebService;
    long long v15 = [(PKPaymentWebService *)v14 context];
    int v16 = [v15 configuration];
    uint64_t v17 = [v16 unsupportedWebPaymentConfigurations];

    if (self->_mode == 2)
    {
      uint64_t v18 = 2;
    }
    else if (self->_remoteDevice)
    {
      uint64_t v18 = 2;
    }
    else
    {
      uint64_t v18 = 1;
    }
    char v13 = &unk_191661000;
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_2;
    v45[3] = &unk_1E56DFC60;
    id v47 = v17;
    uint64_t v48 = v18;
    id v46 = v11;
    id v20 = v17;
    long long v19 = objc_msgSend(v6, "pk_objectsPassingTest:", v45);

    if (v8 > [v19 count])
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v35 = [v19 count];
        *(_DWORD *)buf = 134217984;
        unint64_t v50 = v8 - v35;
        _os_log_debug_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEBUG, "Pass filtering: Passes removed after payment mode filter: %ld", buf, 0xCu);
      }
    }
  }
  else
  {
    long long v19 = v6;
  }
  v43[0] = MEMORY[0x1E4F143A8];
  uint64_t v21 = v13[259];
  v43[1] = v21;
  void v43[2] = __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_132;
  v43[3] = &unk_1E56DF970;
  id v22 = v11;
  id v44 = v22;
  uint64_t v23 = objc_msgSend(v19, "pk_objectsPassingTest:", v43);

  if (v8 > [v23 count])
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v33 = [v23 count];
      *(_DWORD *)buf = 134217984;
      unint64_t v50 = v8 - v33;
      _os_log_debug_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEBUG, "Pass filtering: Passes removed after shell filter: %ld", buf, 0xCu);
    }
  }
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = v21;
  v42[2] = __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_133;
  v42[3] = &unk_1E56DF970;
  v42[4] = self;
  id v24 = objc_msgSend(v23, "pk_objectsPassingTest:", v42);

  if (v8 > [v24 count])
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v34 = [v24 count];
      *(_DWORD *)buf = 134217984;
      unint64_t v50 = v8 - v34;
      _os_log_debug_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEBUG, "Pass filtering: Passes removed after MCC filter: %ld", buf, 0xCu);
    }
  }
  uint64_t v25 = [(PKPaymentRequest *)self->_paymentRequest remoteNetworkRequestPaymentTopicID];
  uint64_t v26 = [v25 length];

  if (v26)
  {
    long long v27 = +[PKWebServiceRemoteNetworkPaymentFeature remoteNetworkPaymentFeatureWithWebService:self->_paymentWebService];
    long long v28 = v27;
    if (v27 && ![v27 enabled])
    {
      long long v29 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      uint64_t v37 = MEMORY[0x1E4F143A8];
      uint64_t v38 = v21;
      long long v39 = __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_134;
      int v40 = &unk_1E56DF970;
      id v41 = v28;
      long long v29 = objc_msgSend(v24, "pk_objectsPassingTest:", &v37);

      id v24 = v41;
    }

    if (v8 > [v29 count])
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v36 = [v29 count];
        *(_DWORD *)buf = 134217984;
        unint64_t v50 = v8 - v36;
        _os_log_debug_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEBUG, "Pass filtering: Passes removed after remote network payment filter: %ld", buf, 0xCu);
      }
    }
  }
  else
  {
    long long v29 = v24;
  }
  -[PKPaymentAuthorizationDataModel _populatePeerPaymentBalanceIfNecessaryForPasses:](self, "_populatePeerPaymentBalanceIfNecessaryForPasses:", v29, v37, v38, v39, v40);
  id v30 = v29;

  return v30;
}

uint64_t __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueID];
}

uint64_t __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count]
    && (id v4 = *(void **)(a1 + 32),
        [v3 uniqueID],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v4) = [v4 containsObject:v5],
        v5,
        (v4 & 1) != 0))
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = [v3 supportsWebPaymentMode:*(void *)(a1 + 48) withExclusionList:*(void *)(a1 + 40)];
  }

  return v6;
}

uint64_t __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_132(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 uniqueID];
    int v6 = [v4 containsObject:v5];
  }
  else
  {
    int v6 = 0;
  }
  uint64_t v7 = [v3 isShellPass] ^ 1 | v6;

  return v7;
}

uint64_t __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_133(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) canSupportMerchantCategoryCodeAccordingToWebService:*(void *)(*(void *)(a1 + 32) + 384) forPass:a2];
}

uint64_t __108__PKPaymentAuthorizationDataModel__filterAndProcessPaymentPassesUsingConfiguration_additionalPaymentPasses___block_invoke_134(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(void *)(a1 + 32))
  {
    uint64_t v5 = [v3 issuerCountryCode];
    int v6 = [*(id *)(a1 + 32) unsupportedIssuerCardCountryCodes];
    id v20 = (void *)v5;
    int v19 = [v6 containsObject:v5];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = [v4 paymentApplications];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      LOBYTE(v10) = 0;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = [*(id *)(*((void *)&v21 + 1) + 8 * i) paymentNetworkIdentifier];
          if (v10)
          {
            int v10 = 1;
          }
          else
          {
            uint64_t v14 = v13;
            long long v15 = [*(id *)(a1 + 32) unsupportedNetworks];
            int v16 = [NSNumber numberWithInteger:v14];
            int v10 = [v15 containsObject:v16];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
    else
    {
      int v10 = 0;
    }

    uint64_t v17 = (v19 | v10) ^ 1u;
  }
  else
  {
    uint64_t v17 = 1;
  }

  return v17;
}

- (void)_populatePeerPaymentBalanceIfNecessaryForPasses:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassSerialNumber];
  int v6 = v5;
  if (self->_peerPaymentAccount) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __83__PKPaymentAuthorizationDataModel__populatePeerPaymentBalanceIfNecessaryForPasses___block_invoke;
    v12[3] = &unk_1E56DE6C8;
    id v13 = v5;
    uint64_t v8 = objc_msgSend(v4, "pk_firstObjectPassingTest:", v12);
    if (v8)
    {
      uint64_t v9 = PKLogFacilityTypeGetObject(7uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        long long v15 = v8;
        _os_log_debug_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEBUG, "Fetching peer payment balance for pass: %@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_peerPaymentPass, v8);
      int v10 = [(PKPeerPaymentService *)self->_peerPaymentService balanceForPass:v8];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v11 = [v10 formattedStringValue];
        *(_DWORD *)buf = 138412290;
        long long v15 = v11;
        _os_log_debug_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEBUG, "Obtained peer payment balance: %@", buf, 0xCu);
      }
      [v8 setPeerPaymentBalance:v10];
      [(PKPaymentAuthorizationDataModel *)self _updatePeerPaymentPromotionAvailability];
    }
  }
}

uint64_t __83__PKPaymentAuthorizationDataModel__populatePeerPaymentBalanceIfNecessaryForPasses___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 serialNumber];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  BOOL v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (void)_populateFinanceKitBalancesIfNecessaryForPasses:(id)a3
{
  id v4 = a3;
  if (PKBankConnectEnabled())
  {
    objc_initWeak(&location, self);
    balancesProviderQueue = self->_balancesProviderQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__PKPaymentAuthorizationDataModel__populateFinanceKitBalancesIfNecessaryForPasses___block_invoke;
    block[3] = &unk_1E56D9150;
    objc_copyWeak(&v8, &location);
    id v7 = v4;
    dispatch_async(balancesProviderQueue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __83__PKPaymentAuthorizationDataModel__populateFinanceKitBalancesIfNecessaryForPasses___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = objc_alloc_init((Class)getFKBankConnectOsloProviderClass[0]());
    id v5 = (void *)WeakRetained[15];
    WeakRetained[15] = v4;

    if (WeakRetained[15])
    {
      id v6 = objc_msgSend(*(id *)(a1 + 32), "pk_createArrayBySafelyApplyingBlock:", &__block_literal_global_136);
      if ([v6 count])
      {
        id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
      }
      else
      {
        id v7 = 0;
      }
      id v8 = (void *)WeakRetained[15];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __83__PKPaymentAuthorizationDataModel__populateFinanceKitBalancesIfNecessaryForPasses___block_invoke_3;
      v10[3] = &unk_1E56DFC88;
      objc_copyWeak(&v13, v2);
      id v11 = *(id *)(a1 + 32);
      id v9 = v7;
      id v12 = v9;
      [v8 listenForAccountsWithPrimaryAccountIdentifiers:v9 callback:v10];

      objc_destroyWeak(&v13);
    }
  }
}

uint64_t __83__PKPaymentAuthorizationDataModel__populateFinanceKitBalancesIfNecessaryForPasses___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 primaryAccountIdentifier];
}

void __83__PKPaymentAuthorizationDataModel__populateFinanceKitBalancesIfNecessaryForPasses___block_invoke_3(id *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __83__PKPaymentAuthorizationDataModel__populateFinanceKitBalancesIfNecessaryForPasses___block_invoke_4;
  v5[3] = &unk_1E56DEC10;
  objc_copyWeak(&v9, a1 + 6);
  id v6 = v3;
  id v7 = a1[4];
  id v8 = a1[5];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v9);
}

void __83__PKPaymentAuthorizationDataModel__populateFinanceKitBalancesIfNecessaryForPasses___block_invoke_4(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && [*(id *)(a1 + 32) count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    obuint64_t j = *(id *)(a1 + 40);
    uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v16 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v8 = [v7 primaryAccountIdentifier];
          id v9 = [*(id *)(a1 + 32) accountForPrimaryIdentifier:v8];
          [v7 setBankConnectAccount:v9];
          int v10 = [v7 primaryAccountIdentifier];
          id v11 = [WeakRetained[19] primaryAccountIdentifier];
          int v12 = [v10 isEqualToString:v11];

          if (v12) {
            [WeakRetained[19] setBankConnectAccount:v9];
          }
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v4);
    }

    id v13 = [WeakRetained primaryAccountIdentifiersWithConnectedCardStateSet];
    [v13 unionSet:*(void *)(a1 + 48)];

    [WeakRetained _notifyModelChanged];
  }
}

- (id)_formatAddressContactIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  contactFormatValidator = self->_contactFormatValidator;
  id v7 = v4;
  if (contactFormatValidator)
  {
    id v8 = [v4 postalAddresses];
    id v9 = [v8 firstObject];
    int v10 = [v9 value];
    id v11 = [(PKContactFormatValidator *)contactFormatValidator formatPostalAddress:v10];

    id v7 = v5;
    if (v11)
    {
      int v12 = (void *)[v5 mutableCopy];
      id v13 = [v12 postalAddresses];
      uint64_t v14 = [v13 firstObject];

      long long v15 = [v14 labeledValueBySettingValue:v11];

      long long v16 = [v12 postalAddresses];
      long long v17 = (void *)[v16 mutableCopy];

      [v17 setObject:v15 atIndexedSubscript:0];
      long long v18 = (void *)[v17 copy];
      [v12 setPostalAddresses:v18];

      id v7 = (void *)[v12 copy];
      int v19 = [v5 valueSource];
      [v7 setValueSource:v19];

      [v7 setFormattingConstrained:1];
    }
  }
  return v7;
}

- (id)paymentErrorsFromLegacyStatus:(int64_t)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 4:
      id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v10 = *MEMORY[0x1E4F28568];
      v15[0] = @"PKPaymentErrorContactField";
      v15[1] = v10;
      v16[0] = @"contactInfo";
      v16[1] = &stru_1EE0F5368;
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
      id v6 = (void *)[v9 initWithDomain:@"PKPaymentErrorDomain" code:1 userInfo:v5];
      id v7 = objc_msgSend(v6, "pk_paymentErrorWithLocalizedDescription");
      long long v17 = v7;
      id v8 = &v17;
      goto LABEL_7;
    case 3:
      id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v12 = *MEMORY[0x1E4F28568];
      v18[0] = @"PKPaymentErrorContactField";
      v18[1] = v12;
      v19[0] = @"post";
      v19[1] = &stru_1EE0F5368;
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
      id v6 = (void *)[v11 initWithDomain:@"PKPaymentErrorDomain" code:1 userInfo:v5];
      id v7 = objc_msgSend(v6, "pk_paymentErrorWithLocalizedDescription");
      uint64_t v20 = v7;
      id v8 = &v20;
      goto LABEL_7;
    case 2:
      id v3 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v4 = *MEMORY[0x1E4F28568];
      v21[0] = @"PKPaymentErrorContactField";
      v21[1] = v4;
      v22[0] = @"post";
      v22[1] = &stru_1EE0F5368;
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
      id v6 = (void *)[v3 initWithDomain:@"PKPaymentErrorDomain" code:2 userInfo:v5];
      id v7 = objc_msgSend(v6, "pk_paymentErrorWithLocalizedDescription");
      v23[0] = v7;
      id v8 = (void **)v23;
LABEL_7:
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

      goto LABEL_9;
  }
  id v13 = 0;
LABEL_9:
  return v13;
}

- (BOOL)isValidWithError:(id *)a3
{
  return [(PKPaymentAuthorizationDataModel *)self isValidWithError:a3 errorStatus:0];
}

- (BOOL)isValidWithError:(id *)a3 errorStatus:(int64_t *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_mode == 1 && self->_remoteDevice)
  {
    id v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = [(PKPaymentAuthorizationDataModel *)self itemForType:3];
    id v9 = objc_msgSend(v7, "arrayWithObjects:", v8, 0);
  }
  else
  {
    items = self->_items;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    void v22[2] = __64__PKPaymentAuthorizationDataModel_isValidWithError_errorStatus___block_invoke;
    v22[3] = &unk_1E56DFCB0;
    v22[4] = self;
    id v9 = [(NSMutableArray *)items pk_objectsPassingTest:v22];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v11);
        }
        if (![*(id *)(*((void *)&v18 + 1) + 8 * i) isValidWithError:a3 errorStatus:a4])
        {

          goto LABEL_17;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v18 objects:v23 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  if ([(PKPaymentAuthorizationDataModel *)self wantsInstructions] && !self->_instructions)
  {
    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPassKitErrorDomain" code:-3008 userInfo:0];
      BOOL v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_17:
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 1;
  }

  return v16;
}

uint64_t __64__PKPaymentAuthorizationDataModel_isValidWithError_errorStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 176);
  switch(v5)
  {
    case 2:
      goto LABEL_4;
    case 1:
      if (([v3 context] & 2) == 0) {
        break;
      }
      goto LABEL_7;
    case 0:
LABEL_4:
      if (([v3 context] & 1) == 0) {
        break;
      }
LABEL_7:
      uint64_t v6 = 1;
      goto LABEL_8;
  }
  uint64_t v6 = 0;
LABEL_8:

  return v6;
}

- (PKPaymentPass)pass
{
  return self->_pass;
}

- (void)setPaymentPassWithPassTypeIdentifier:(id)a3 serialNumber:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PKPaymentAuthorizationDataModel *)self library];
  id v9 = [v8 passWithPassTypeIdentifier:v7 serialNumber:v6];

  uint64_t v10 = [v9 paymentPass];

  [(PKPaymentAuthorizationDataModel *)self setPass:v10];
  if (v10)
  {
    v12[0] = v10;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [(PKPaymentAuthorizationDataModel *)self _populatePeerPaymentBalanceIfNecessaryForPasses:v11];
  }
}

- (void)setPass:(id)a3
{
  id v4 = a3;
  id v5 = [v4 devicePrimaryInAppPaymentApplication];
  [(PKPaymentAuthorizationDataModel *)self setPass:v4 withSelectedPaymentApplication:v5];
}

- (void)setPass:(id)a3 withSelectedPaymentApplication:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_pass, a3);
  objc_storeStrong((id *)&self->_paymentApplication, a4);
  if (!self->_paymentApplication)
  {
    id v8 = [(PKPaymentAuthorizationDataModel *)self defaultSelectedPaymentApplicationForPass:v11];
    paymentApplication = self->_paymentApplication;
    self->_paymentApplication = v8;
  }
  if (self->_pass)
  {
    bankAccount = self->_bankAccount;
    self->_bankAccount = 0;
  }
  [(PKPaymentAuthorizationDataModel *)self updateBillingErrors];
  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  [(PKPaymentAuthorizationDataModel *)self _updatePeerPaymentPromotionAvailability];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setPaymentApplication:(id)a3
{
  objc_storeStrong((id *)&self->_paymentApplication, a3);
  [(PKPaymentAuthorizationDataModel *)self updateBillingErrors];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (PKRemoteDevice)remoteDevice
{
  if (self->_mode == 1)
  {
    v2 = self->_remoteDevice;
  }
  else
  {
    v2 = [(NSMapTable *)self->_instrumentToDeviceMap objectForKey:self->_remotePaymentInstrument];
  }
  return v2;
}

- (NSArray)remoteDevices
{
  return self->_allRemoteDevices;
}

- (NSArray)allNearbyRemoteDevices
{
  allRemoteDevices = self->_allRemoteDevices;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PKPaymentAuthorizationDataModel_allNearbyRemoteDevices__block_invoke;
  v5[3] = &unk_1E56DFCD8;
  void v5[4] = self;
  id v3 = [(NSArray *)allRemoteDevices pk_objectsPassingTest:v5];
  return (NSArray *)v3;
}

BOOL __57__PKPaymentAuthorizationDataModel_allNearbyRemoteDevices__block_invoke(uint64_t a1, void *a2)
{
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 40);
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 40)) {
    int v2 = [a2 proximityState] == 0;
  }
  return v2 != 0;
}

- (NSArray)allUnavailableRemoteDevices
{
  if (self->_ignoreProximity || (allRemoteDevices = self->_allRemoteDevices) == 0)
  {
    int v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    int v2 = [(NSArray *)allRemoteDevices pk_objectsPassingTest:&__block_literal_global_142];
  }
  return (NSArray *)v2;
}

BOOL __62__PKPaymentAuthorizationDataModel_allUnavailableRemoteDevices__block_invoke(uint64_t a1, void *a2)
{
  return [a2 proximityState] != 0;
}

- (void)setRemoteDevice:(id)a3
{
  id v5 = a3;
  if (self->_mode == 1)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_remoteDevice, a3);
    id v5 = v6;
  }
}

- (void)setRemotePaymentInstrument:(id)a3 withSelectedPaymentApplication:(id)a4
{
  id v6 = (PKRemotePaymentInstrument *)a3;
  id v7 = (PKPaymentApplication *)a4;
  remotePaymentInstrument = self->_remotePaymentInstrument;
  self->_remotePaymentInstrument = v6;
  id v9 = v6;

  paymentApplication = self->_paymentApplication;
  self->_paymentApplication = v7;
  id v11 = v7;

  [(PKPaymentAuthorizationDataModel *)self updateBillingErrors];
  uint64_t v12 = objc_opt_class();

  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:v12];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setRemotePaymentInstrument:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentAuthorizationDataModel *)self defaultSelectedPaymentApplicationForRemoteInstrument:v4];
  [(PKPaymentAuthorizationDataModel *)self setRemotePaymentInstrument:v4 withSelectedPaymentApplication:v5];
}

- (void)updateRemoteDevices:(id)a3
{
}

- (void)updateRemoteDevices:(id)a3 ignoreProximity:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(NSMapTable *)self->_instrumentToDeviceMap removeAllObjects];
  [(NSMutableDictionary *)self->_remoteDeviceToAcceptedInstruments removeAllObjects];
  [(NSMutableDictionary *)self->_acceptedApplications removeAllObjects];
  id v7 = [MEMORY[0x1E4F1CA80] set];
  id v8 = [MEMORY[0x1E4F1CA80] set];
  id v9 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v49 = (PKRemotePaymentInstrument *)v4;
    __int16 v50 = 2112;
    id v51 = v6;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Updating remote devices for payment authorization model, ignoreProximity: %ld, remoteDevices: %@", buf, 0x16u);
  }

  self->_ignoreProximity = v4;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __71__PKPaymentAuthorizationDataModel_updateRemoteDevices_ignoreProximity___block_invoke;
  v47[3] = &unk_1E56DFCD8;
  v47[4] = self;
  uint64_t v10 = objc_msgSend(v6, "pk_objectsPassingTest:", v47);

  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __71__PKPaymentAuthorizationDataModel_updateRemoteDevices_ignoreProximity___block_invoke_2;
  v44[3] = &unk_1E56DFD48;
  v44[4] = self;
  id v38 = v7;
  id v45 = v38;
  id v37 = v8;
  id v46 = v37;
  [v10 enumerateObjectsUsingBlock:v44];
  id v11 = [(PKPaymentAuthorizationDataModel *)self paymentRequestSupportedRemoteQuery];
  uint64_t v12 = +[PKRemoteDevice acceptedComparatorWithPaymentSupportedQuery:v11];
  long long v39 = v10;
  uint64_t v13 = [v10 sortedArrayUsingComparator:v12];
  allRemoteDevices = self->_allRemoteDevices;
  self->_allRemoteDevices = v13;

  objc_storeStrong((id *)&self->_allAcceptedRemotePaymentInstruments, v7);
  objc_storeStrong((id *)&self->_allUnavailableRemotePaymentInstruments, v8);
  long long v15 = [(PKPaymentRequest *)self->_paymentRequest originatingURL];
  BOOL v16 = [v15 host];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v17 = [(NSArray *)self->_allRemoteDevices firstObject];
  long long v18 = [v17 remotePaymentInstruments];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v40 objects:v54 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        if ([v23 supportsAutomaticSelection])
        {
          uint64_t v24 = [v23 associatedWebDomains];
          int v25 = [v24 containsObject:v16];

          if (v25)
          {
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Found automatic selection remote instrument, promoting it", buf, 2u);
            }

            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v26 = [v23 description];
              *(_DWORD *)buf = 138412290;
              v49 = v26;
              _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
            }
            objc_storeStrong((id *)&self->_remotePaymentInstrument, v23);
            goto LABEL_18;
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v40 objects:v54 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  if (!self->_remotePaymentInstrument || (objc_msgSend(v38, "containsObject:") & 1) == 0)
  {
    long long v27 = [(NSArray *)self->_allRemoteDevices firstObject];
    long long v28 = [v27 remotePaymentInstruments];
    long long v29 = [v28 firstObject];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [v27 deviceName];
      unint64_t v31 = [v27 uniqueID];
      *(_DWORD *)buf = 138412802;
      v49 = v30;
      __int16 v50 = 2112;
      id v51 = v31;
      __int16 v52 = 2112;
      __int16 v53 = v29;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Selecting default remote device name: %@, uniqueID: %@, payment instrument: %@", buf, 0x20u);
    }
    remotePaymentInstrument = self->_remotePaymentInstrument;
    self->_remotePaymentInstrument = v29;
    uint64_t v33 = v29;

    uint64_t v34 = [(PKPaymentAuthorizationDataModel *)self defaultSelectedPaymentApplicationForRemoteInstrument:self->_remotePaymentInstrument];
    paymentApplication = self->_paymentApplication;
    self->_paymentApplication = v34;

    [(PKPaymentAuthorizationDataModel *)self updateBillingErrors];
  }
  if (!self->_initialRemotePaymentInstrument)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = self->_remotePaymentInstrument;
      *(_DWORD *)buf = 138412290;
      v49 = v36;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Selecting initial remote payment instrument: %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&self->_initialRemotePaymentInstrument, self->_remotePaymentInstrument);
  }
  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

uint64_t __71__PKPaymentAuthorizationDataModel_updateRemoteDevices_ignoreProximity___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 userDisabled])
  {
    [v3 type];
    uint64_t v4 = 0;
  }
  else
  {
    int v5 = [v3 deviceDisabled];
    char v6 = v5;
    uint64_t v4 = v5 ^ 1u;
    if (![v3 type] && (v6 & 1) == 0) {
      uint64_t v4 = [v3 isLocked] ^ 1;
    }
  }
  if ([v3 type])
  {
    if ([v3 type] == 1) {
      uint64_t v4 = v4;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  if ([*(id *)(*(void *)(a1 + 32) + 184) requestType] == 10) {
    uint64_t v4 = [*(id *)(a1 + 32) canSupportDisbursementsOnRemoteDevice:v3];
  }

  return v4;
}

void __71__PKPaymentAuthorizationDataModel_updateRemoteDevices_ignoreProximity___block_invoke_2(id *a1, void *a2)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 defaultRemotePaymentInstrument];
  int v5 = [a1[4] paymentRequestSupportedRemoteQuery];
  char v6 = +[PKRemotePaymentInstrument sortDescriptorForDefaultPaymentInstrument:v4 paymentSupportedQuery:v5];

  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"ingestedDate" ascending:1];
  id v8 = [v3 remotePaymentInstruments];
  v25[0] = v6;
  v25[1] = v7;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  uint64_t v10 = [v8 sortedArrayUsingDescriptors:v9];

  [v3 setRemotePaymentInstruments:v10];
  id v11 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v12 = a1[4];
  int v13 = v12[40];
  if (!v12[40])
  {
    int v13 = [v3 proximityState] == 0;
    uint64_t v12 = a1[4];
  }
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __71__PKPaymentAuthorizationDataModel_updateRemoteDevices_ignoreProximity___block_invoke_3;
  v19[3] = &unk_1E56DFD20;
  v19[4] = v12;
  id v20 = v3;
  BOOL v24 = v13 != 0;
  id v21 = a1[5];
  id v22 = v11;
  id v23 = a1[6];
  id v14 = v11;
  id v15 = v3;
  [v10 enumerateObjectsUsingBlock:v19];
  BOOL v16 = (void *)*((void *)a1[4] + 9);
  long long v17 = (void *)[v14 copy];
  long long v18 = [v15 uniqueID];
  [v16 setObject:v17 forKey:v18];
}

void __71__PKPaymentAuthorizationDataModel_updateRemoteDevices_ignoreProximity___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [*(id *)(*(void *)(a1 + 32) + 64) setObject:*(void *)(a1 + 40) forKey:v3];
  if (!*(unsigned char *)(a1 + 72)
    || [v3 hasAssociatedPeerPaymentAccount]
    && (![v3 hasAssociatedPeerPaymentAccount]
     || [v3 peerPaymentAccountState] == 3))
  {
    goto LABEL_16;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = objc_msgSend(v3, "paymentApplications", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v5)
  {
LABEL_13:

LABEL_16:
    id v11 = (id *)(a1 + 64);
    goto LABEL_17;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v13;
LABEL_7:
  uint64_t v8 = 0;
  while (1)
  {
    if (*(void *)v13 != v7) {
      objc_enumerationMutation(v4);
    }
    id v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
    uint64_t v10 = [*(id *)(a1 + 32) paymentRequestSupportedRemoteQuery];
    LOBYTE(v9) = [v9 canProcessPayment:v10];

    if (v9) {
      break;
    }
    if (v6 == ++v8)
    {
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        goto LABEL_7;
      }
      goto LABEL_13;
    }
  }

  if (![*(id *)(a1 + 32) canSupportMerchantCategoryCodeAccordingToWebService:*(void *)(*(void *)(a1 + 32) + 384) forPaymentInstrument:v3])goto LABEL_16; {
  [*(id *)(a1 + 48) addObject:v3];
  }
  id v11 = (id *)(a1 + 56);
LABEL_17:
  [*v11 addObject:v3];
}

- (NSArray)acceptedPasses
{
  v26[1] = *MEMORY[0x1E4F143B8];
  p_acceptedPasses = (id *)&self->_acceptedPasses;
  acceptedPasses = self->_acceptedPasses;
  if (!acceptedPasses)
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(7uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_debug_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEBUG, "Pass filtering: Accepted passes unknown, determining...", (uint8_t *)&v24, 2u);
    }

    if ([(PKPaymentRequest *)self->_paymentRequest requestType] == 5
      || [(PKPaymentRequest *)self->_paymentRequest requestType] == 4)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v24) = 0;
        _os_log_debug_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEBUG, "Pass filtering: Installment/Physical Card request", (uint8_t *)&v24, 2u);
      }

      uint64_t v6 = +[PKPassLibrary sharedInstance];
      uint64_t v7 = [v6 passWithUniqueID:self->_relevantPassUniqueID];
      uint64_t v8 = [v7 paymentPass];

      if (v8)
      {
        v26[0] = v8;
        uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
        id v10 = *p_acceptedPasses;
        id *p_acceptedPasses = (id)v9;
      }
    }
    else
    {
      BOOL v11 = [(PKPaymentRequest *)self->_paymentRequest isPayLaterPaymentRequest];
      BOOL v12 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
      if (v11)
      {
        if (v12)
        {
          LOWORD(v24) = 0;
          _os_log_debug_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEBUG, "Pass filtering: Pay Later request", (uint8_t *)&v24, 2u);
        }

        uint64_t v8 = [(PKPaymentRequest *)self->_paymentRequest payLaterPaymentRequest];
        long long v13 = [(PKPaymentAuthorizationDataModel *)self library];
        long long v14 = [(PKPaymentAuthorizationDataModel *)self peerPaymentAccount];
        long long v15 = [v8 acceptedPassesWithPassLibrary:v13 peerPaymentAccount:v14];
        BOOL v16 = self->_acceptedPasses;
        self->_acceptedPasses = v15;

        [(PKPaymentAuthorizationDataModel *)self _populatePeerPaymentBalanceIfNecessaryForPasses:self->_acceptedPasses];
      }
      else
      {
        if (v12)
        {
          LOWORD(v24) = 0;
          _os_log_debug_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEBUG, "Pass filtering: Other payment request type", (uint8_t *)&v24, 2u);
        }

        uint64_t v8 = [(PKPaymentAuthorizationDataModel *)self _inAppPaymentPassesForPaymentRequest:self->_paymentRequest];
        uint64_t v17 = [(PKPaymentRequest *)self->_paymentRequest supportedNetworks];
        int v18 = [v17 containsObject:@"PrivateLabel"];

        if (v18)
        {
          uint64_t v19 = [(PKPaymentAuthorizationDataModel *)self _inAppPrivateLabelPaymentPasses];
          id v20 = [MEMORY[0x1E4F1C978] arrayWithArray:v8];
          uint64_t v21 = [v20 arrayByAddingObjectsFromArray:v19];

          uint64_t v8 = (void *)v21;
        }
        objc_storeStrong(p_acceptedPasses, v8);
        [(PKPaymentAuthorizationDataModel *)self _populatePeerPaymentBalanceIfNecessaryForPasses:self->_acceptedPasses];
        if (![(PKPaymentRequest *)self->_paymentRequest requestType]) {
          [(PKPaymentAuthorizationDataModel *)self _populateFinanceKitBalancesIfNecessaryForPasses:self->_acceptedPasses];
        }
      }
    }

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v23 = [*p_acceptedPasses count];
      int v24 = 134217984;
      uint64_t v25 = v23;
      _os_log_debug_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEBUG, "Pass filtering: Accepted passes count: %ld", (uint8_t *)&v24, 0xCu);
    }

    acceptedPasses = (NSArray *)*p_acceptedPasses;
  }
  return acceptedPasses;
}

- (PKPaymentPass)appleCardPass
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  int v2 = [(PKPaymentAuthorizationDataModel *)self acceptedPasses];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v10 != v5) {
        objc_enumerationMutation(v2);
      }
      uint64_t v7 = [*(id *)(*((void *)&v9 + 1) + 8 * v6) paymentPass];
      if ([v7 isAppleCardPass]) {
        break;
      }

      if (v4 == ++v6)
      {
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    uint64_t v7 = 0;
  }

  return (PKPaymentPass *)v7;
}

- (id)paymentRequestSupportedRemoteQuery
{
  uint64_t v3 = [(PKPaymentRequest *)self->_paymentRequest supportedNetworks];
  uint64_t v4 = objc_msgSend(v3, "pk_arrayByApplyingBlock:", &__block_literal_global_149);

  unint64_t v5 = [(PKPaymentRequest *)self->_paymentRequest requestType];
  PKMerchantCapability v6 = [(PKPaymentRequest *)self->_paymentRequest merchantCapabilities];
  uint64_t v7 = [(PKPaymentRequest *)self->_paymentRequest countryCode];
  if (v5 == 10)
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKPaymentRequest requestType](self->_paymentRequest, "requestType"));
    LOBYTE(v11) = [(PKPaymentRequest *)self->_paymentRequest isMultiTokenRequest];
    long long v9 = +[PKPaymentRequestSupportedQuery inAppQueryWithSupportedNetworkIDs:v4 merchantCapabilities:v6 merchantCountryCode:v7 paymentMode:2 paymentApplicationStates:0 paymentRequestType:v8 isMultiTokensRequest:v11 webService:self->_paymentWebService];
  }
  else
  {
    long long v9 = +[PKPaymentRequestSupportedQuery webQueryWithSupportedNetworkIDs:v4 merchantCapabilities:v6 merchantCountryCode:v7 paymentMode:2 paymentApplicationStates:0 isMultiTokensRequest:[(PKPaymentRequest *)self->_paymentRequest isMultiTokenRequest] webService:self->_paymentWebService];
  }

  return v9;
}

uint64_t __69__PKPaymentAuthorizationDataModel_paymentRequestSupportedRemoteQuery__block_invoke(uint64_t a1, void *a2)
{
  int v2 = NSNumber;
  uint64_t v3 = PKPaymentCredentialTypeForPaymentNetworkName(a2);
  return [v2 numberWithInteger:v3];
}

- (id)paymentRequestSupportedQuery
{
  int64_t fundingMode = self->_fundingMode;
  if (fundingMode) {
    BOOL v4 = fundingMode == 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_6;
  }
  if (fundingMode == 1)
  {
    if (!_os_feature_enabled_impl())
    {
      selectedFinancingOption = self->_selectedFinancingOption;
      if (!selectedFinancingOption) {
        selectedFinancingOption = self->_previouslySelectedFinancingOption;
      }
      long long v13 = selectedFinancingOption;
      unint64_t v5 = [(PKPayLaterFinancingOption *)v13 supportedRepaymentNetworks];
      PKMerchantCapability v6 = PKPaymentCredentialTypesForPaymentNetworkNames(v5);
      uint64_t v14 = (__rbit32([(PKPayLaterFinancingOption *)v13 supportedRepaymentTypes]) >> 28) & 0xC;
      uint64_t v8 = [(PKPaymentRequest *)self->_paymentRequest countryCode];
      int64_t v15 = [(PKPaymentAuthorizationDataModel *)self requestedMode];
      long long v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKPaymentRequest requestType](self->_paymentRequest, "requestType"));
      LOBYTE(v17) = [(PKPaymentRequest *)self->_paymentRequest isMultiTokenRequest];
      uint64_t v11 = +[PKPaymentRequestSupportedQuery inAppQueryWithSupportedNetworkIDs:v6 merchantCapabilities:v14 merchantCountryCode:v8 paymentMode:v15 paymentApplicationStates:0 paymentRequestType:v10 isMultiTokensRequest:v17 webService:self->_paymentWebService];

      goto LABEL_7;
    }
LABEL_6:
    unint64_t v5 = [(PKPaymentRequest *)self->_paymentRequest supportedNetworks];
    PKMerchantCapability v6 = PKPaymentCredentialTypesForPaymentNetworkNames(v5);
    PKMerchantCapability v7 = [(PKPaymentRequest *)self->_paymentRequest merchantCapabilities];
    uint64_t v8 = [(PKPaymentRequest *)self->_paymentRequest countryCode];
    int64_t v9 = [(PKPaymentAuthorizationDataModel *)self requestedMode];
    long long v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PKPaymentRequest requestType](self->_paymentRequest, "requestType"));
    LOBYTE(v17) = [(PKPaymentRequest *)self->_paymentRequest isMultiTokenRequest];
    uint64_t v11 = +[PKPaymentRequestSupportedQuery inAppQueryWithSupportedNetworkIDs:v6 merchantCapabilities:v7 merchantCountryCode:v8 paymentMode:v9 paymentApplicationStates:0 paymentRequestType:v10 isMultiTokensRequest:v17 webService:self->_paymentWebService];
LABEL_7:

    goto LABEL_14;
  }
  uint64_t v11 = 0;
LABEL_14:
  return v11;
}

- (int64_t)requestedMode
{
  if (self->_mode == 2) {
    return 2;
  }
  if (self->_remoteDevice) {
    return 2;
  }
  return 1;
}

- (id)acceptedPaymentApplicationsForPass:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 uniqueID];
  if (v5)
  {
    PKMerchantCapability v6 = [(NSMutableDictionary *)self->_acceptedApplications objectForKey:v5];
    if (!v6)
    {
      PKMerchantCapability v7 = [v4 deviceInAppPaymentApplications];
      uint64_t v8 = [v7 allObjects];
      int64_t v9 = [v4 devicePrimaryInAppPaymentApplication];
      PKMerchantCapability v6 = -[PKPaymentAuthorizationDataModel _filterAndProcessPaymentApplicationsUsingConfiguration:withPrimaryPaymentApplication:passHasAssociatedPeerPaymentAccount:](self, "_filterAndProcessPaymentApplicationsUsingConfiguration:withPrimaryPaymentApplication:passHasAssociatedPeerPaymentAccount:", v8, v9, [v4 hasAssociatedPeerPaymentAccount]);

      [(NSMutableDictionary *)self->_acceptedApplications setObject:v6 forKey:v5];
    }
  }
  else
  {
    PKMerchantCapability v6 = 0;
  }

  return v6;
}

- (id)unavailablePaymentApplicationsForPass:(id)a3
{
  acceptedApplications = self->_acceptedApplications;
  id v4 = a3;
  unint64_t v5 = [v4 uniqueID];
  PKMerchantCapability v6 = [(NSMutableDictionary *)acceptedApplications objectForKey:v5];
  PKMerchantCapability v7 = objc_msgSend(v6, "pk_arrayByApplyingBlock:", &__block_literal_global_153);

  uint64_t v8 = [v4 deviceInAppPaymentApplications];

  int64_t v9 = [v8 allObjects];

  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  BOOL v16 = __73__PKPaymentAuthorizationDataModel_unavailablePaymentApplicationsForPass___block_invoke_2;
  uint64_t v17 = &unk_1E56DFD90;
  id v18 = v7;
  id v19 = &__block_literal_global_153;
  id v10 = v7;
  uint64_t v11 = [v9 indexesOfObjectsPassingTest:&v14];
  long long v12 = objc_msgSend(v9, "objectsAtIndexes:", v11, v14, v15, v16, v17);

  return v12;
}

id __73__PKPaymentAuthorizationDataModel_unavailablePaymentApplicationsForPass___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 applicationIdentifier];
  uint64_t v4 = [v2 paymentType];

  unint64_t v5 = PKPaymentMethodTypeToString(v4);
  PKMerchantCapability v6 = [v3 stringByAppendingString:v5];

  return v6;
}

uint64_t __73__PKPaymentAuthorizationDataModel_unavailablePaymentApplicationsForPass___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = [v1 containsObject:v2] ^ 1;

  return v3;
}

- (id)defaultSelectedPaymentApplicationForPass:(id)a3
{
  if (a3)
  {
    uint64_t v4 = -[PKPaymentAuthorizationDataModel acceptedPaymentApplicationsForPass:](self, "acceptedPaymentApplicationsForPass:");
    unint64_t v5 = [(PKPaymentAuthorizationDataModel *)self _defaultSelectedPaymentApplicationForPaymentApplications:v4];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (id)defaultSelectedPaymentApplicationForRemoteInstrument:(id)a3
{
  if (a3)
  {
    uint64_t v4 = -[PKPaymentAuthorizationDataModel acceptedPaymentApplicationsForRemoteInstrument:](self, "acceptedPaymentApplicationsForRemoteInstrument:");
    unint64_t v5 = [(PKPaymentAuthorizationDataModel *)self _defaultSelectedPaymentApplicationForPaymentApplications:v4];
  }
  else
  {
    unint64_t v5 = 0;
  }
  return v5;
}

- (id)_defaultSelectedPaymentApplicationForPaymentApplications:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] <= 1)
  {
    id v5 = [v4 firstObject];
    goto LABEL_27;
  }
  PKMerchantCapability v6 = [(PKPaymentRequest *)self->_paymentRequest supportedNetworks];
  if ([v6 count]) {
    BOOL v7 = [(PKPaymentRequest *)self->_paymentRequest respectSupportedNetworksOrder];
  }
  else {
    BOOL v7 = 0;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v25 = v4;
  id v8 = v4;
  uint64_t v28 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  id v9 = 0;
  if (v28)
  {
    uint64_t v27 = *(void *)v30;
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
    BOOL v26 = v7;
LABEL_8:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v30 != v27) {
        objc_enumerationMutation(v8);
      }
      long long v12 = *(void **)(*((void *)&v29 + 1) + 8 * v11);
      long long v13 = [(PKPaymentRequest *)self->_paymentRequest countryCode];
      char v14 = [v12 isRequiredForMerchantInCountry:v13];

      if (v14)
      {
        id v5 = v12;

        goto LABEL_26;
      }
      if (v7)
      {
        uint64_t v15 = PKPaymentNetworkNameForPaymentCredentialType([v12 paymentNetworkIdentifier]);
        uint64_t v16 = [v6 indexOfObject:v15];
        uint64_t v17 = v16;
        if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_17;
        }
        if (v16 < v10) {
          goto LABEL_17;
        }
        if (v16 == v10)
        {
          id v18 = v8;
          id v19 = self;
          id v20 = v6;
          uint64_t v21 = [v12 inAppPriority];
          uint64_t v17 = v10;
          BOOL v22 = v21 <= [v9 inAppPriority];
          PKMerchantCapability v6 = v20;
          self = v19;
          id v8 = v18;
          BOOL v7 = v26;
          if (!v22)
          {
LABEL_17:
            id v23 = v12;

            id v9 = v23;
            uint64_t v10 = v17;
          }
        }
      }
      else
      {
        if (v10 != 0x7FFFFFFFFFFFFFFFLL && [v12 inAppPriority] <= v10) {
          goto LABEL_22;
        }
        uint64_t v10 = [v12 inAppPriority];
        uint64_t v15 = v9;
        id v9 = v12;
      }

LABEL_22:
      if (v28 == ++v11)
      {
        uint64_t v28 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v28) {
          goto LABEL_8;
        }
        break;
      }
    }
  }

  id v9 = v9;
  id v5 = v9;
LABEL_26:

  id v4 = v25;
LABEL_27:

  return v5;
}

- (id)acceptedRemotePaymentInstrumentsForRemoteDevice:(id)a3
{
  remoteDeviceToAcceptedInstruments = self->_remoteDeviceToAcceptedInstruments;
  id v4 = [a3 uniqueID];
  id v5 = [(NSMutableDictionary *)remoteDeviceToAcceptedInstruments objectForKey:v4];

  return v5;
}

- (id)acceptedPaymentApplicationsForRemoteInstrument:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_acceptedApplications objectForKey:v4];
  if (!v5)
  {
    PKMerchantCapability v6 = [v4 paymentApplications];
    BOOL v7 = [v4 primaryPaymentApplication];
    id v5 = -[PKPaymentAuthorizationDataModel _filterAndProcessPaymentApplicationsUsingConfiguration:withPrimaryPaymentApplication:passHasAssociatedPeerPaymentAccount:](self, "_filterAndProcessPaymentApplicationsUsingConfiguration:withPrimaryPaymentApplication:passHasAssociatedPeerPaymentAccount:", v6, v7, [v4 hasAssociatedPeerPaymentAccount]);

    [(NSMutableDictionary *)self->_acceptedApplications setObject:v5 forKey:v4];
  }

  return v5;
}

- (id)unavailablePaymentApplicationsForRemoteInstrument:(id)a3
{
  acceptedApplications = self->_acceptedApplications;
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)acceptedApplications objectForKey:v4];
  PKMerchantCapability v6 = objc_msgSend(v5, "pk_arrayByApplyingBlock:", &__block_literal_global_155);

  BOOL v7 = [v4 paymentApplications];

  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  char v14 = __85__PKPaymentAuthorizationDataModel_unavailablePaymentApplicationsForRemoteInstrument___block_invoke_2;
  uint64_t v15 = &unk_1E56DFD90;
  id v16 = v6;
  id v17 = &__block_literal_global_155;
  id v8 = v6;
  id v9 = [v7 indexesOfObjectsPassingTest:&v12];
  uint64_t v10 = objc_msgSend(v7, "objectsAtIndexes:", v9, v12, v13, v14, v15);

  return v10;
}

id __85__PKPaymentAuthorizationDataModel_unavailablePaymentApplicationsForRemoteInstrument___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 applicationIdentifier];
  uint64_t v4 = [v2 paymentType];

  id v5 = PKPaymentMethodTypeToString(v4);
  PKMerchantCapability v6 = [v3 stringByAppendingString:v5];

  return v6;
}

uint64_t __85__PKPaymentAuthorizationDataModel_unavailablePaymentApplicationsForRemoteInstrument___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = [v1 containsObject:v2] ^ 1;

  return v3;
}

- (BOOL)canSupportMerchantCategoryCodeAccordingToWebService:(id)a3 forPass:(id)a4
{
  id v6 = a4;
  BOOL v7 = +[PKWebServiceMerchantCategoryCodesFeature merchantCategoryCodesFeatureWithWebService:a3];
  if (v7 && [(PKPaymentRequest *)self->_paymentRequest merchantCategoryCode])
  {
    id v8 = [v7 appleCardUnsupportedMerchantCategoryCodes];
    id v9 = [v7 appleCashUnsupportedMerchantCategoryCodes];
    uint64_t v10 = [(PKPaymentRequest *)self->_paymentRequest merchantCategoryCode];
    if ([v6 isPeerPaymentPass] && v9)
    {
      uint64_t v11 = [NSNumber numberWithShort:v10];
      uint64_t v12 = v9;
    }
    else
    {
      char v13 = 1;
      if (![v6 isAppleCardPass] || !v8) {
        goto LABEL_11;
      }
      uint64_t v11 = [NSNumber numberWithShort:v10];
      uint64_t v12 = v8;
    }
    char v14 = [v12 containsObject:v11];

    char v13 = v14 ^ 1;
LABEL_11:

    goto LABEL_12;
  }
  char v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)canSupportMerchantCategoryCodeAccordingToWebService:(id)a3 forPaymentInstrument:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ((unint64_t)([v7 associatedAccountFeatureIdentifier] - 3) >= 0xFFFFFFFFFFFFFFFELL
    && [(PKPaymentRequest *)self->_paymentRequest merchantCategoryCode])
  {
    id v8 = +[PKWebServiceMerchantCategoryCodesFeature merchantCategoryCodesFeatureWithWebService:v6];
    id v9 = v8;
    if (!v8)
    {
      char v15 = 1;
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v10 = [v8 appleCardUnsupportedMerchantCategoryCodes];
    uint64_t v11 = [v9 appleCashUnsupportedMerchantCategoryCodes];
    uint64_t v12 = [(PKPaymentRequest *)self->_paymentRequest merchantCategoryCode];
    if ([v7 associatedAccountFeatureIdentifier] == 1 && v11)
    {
      char v13 = [NSNumber numberWithShort:v12];
      char v14 = v11;
    }
    else
    {
      char v15 = 1;
      if ([v7 associatedAccountFeatureIdentifier] != 2 || !v10) {
        goto LABEL_13;
      }
      char v13 = [NSNumber numberWithShort:v12];
      char v14 = v10;
    }
    char v16 = [v14 containsObject:v13];

    char v15 = v16 ^ 1;
LABEL_13:

    goto LABEL_14;
  }
  char v15 = 1;
LABEL_15:

  return v15;
}

- (BOOL)canSupportDisbursementsOnRemoteDevice:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 type] || objc_msgSend(v3, "majorOperatingSystemVersion") >= 11)
    && ([v3 type] != 1 || objc_msgSend(v3, "majorOperatingSystemVersion") >= 18);

  return v4;
}

- (NSArray)unavailablePasses
{
  unavailablePasses = self->_unavailablePasses;
  if (!unavailablePasses)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([(PKPaymentRequest *)self->_paymentRequest isPeerPaymentRequest])
    {
      id v6 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
      [v4 safelyAddObject:v6];
    }
    if ([(PKPaymentRequest *)self->_paymentRequest isPayLaterPaymentRequest])
    {
      id v7 = [(PKPaymentRequest *)self->_paymentRequest payLaterPaymentRequest];
      id v8 = [v7 payLaterPassUniqueID];
      [v4 safelyAddObject:v8];
    }
    id v9 = [(PKPaymentAuthorizationDataModel *)self acceptedPasses];
    uint64_t v10 = [v9 valueForKey:@"uniqueID"];

    uint64_t v11 = [(PKPaymentAuthorizationDataModel *)self library];
    uint64_t v12 = [v11 passesOfType:1];

    if (self->_financingController && _os_feature_enabled_impl())
    {
      char v13 = [(PKPayLaterFinancingController *)self->_financingController payLaterPass];
      char v14 = [(PKPayLaterFinancingController *)self->_financingController payLaterAccount];
      char v15 = v14;
      if (v14)
      {
        if (([v14 hidePayLaterInPaymentSheet] & 1) == 0)
        {
          unint64_t v16 = [(PKPayLaterFinancingController *)self->_financingController payLaterPassEligibility];
          if (v16 == 5 || v16 == 2)
          {
            id v17 = [v13 uniqueID];
            [v5 safelyAddObject:v17];
          }
        }
      }
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __52__PKPaymentAuthorizationDataModel_unavailablePasses__block_invoke;
    void v25[3] = &unk_1E56DFDB8;
    id v26 = v10;
    id v27 = v5;
    id v28 = v4;
    id v18 = v4;
    id v19 = v5;
    id v20 = v10;
    uint64_t v21 = objc_msgSend(v12, "pk_objectsPassingTest:", v25);
    BOOL v22 = [v21 sortedArrayUsingComparator:&__block_literal_global_162_0];
    id v23 = self->_unavailablePasses;
    self->_unavailablePasses = v22;

    unavailablePasses = self->_unavailablePasses;
  }
  return unavailablePasses;
}

uint64_t __52__PKPaymentAuthorizationDataModel_unavailablePasses__block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)a1[4];
  id v5 = [v3 uniqueID];
  LOBYTE(v4) = [v4 containsObject:v5];

  if ((v4 & 1) != 0
    || (([v3 isAccessPass] & 1) != 0
     || ([v3 isIdentityPass] & 1) != 0
     || [v3 isShellPass])
    && (id v6 = (void *)a1[5],
        [v3 uniqueID],
        id v7 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v6) = [v6 containsObject:v7],
        v7,
        !v6))
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v8 = (void *)a1[6];
    id v9 = [v3 uniqueID];
    uint64_t v10 = [v8 containsObject:v9] ^ 1;
  }
  return v10;
}

uint64_t __52__PKPaymentAuthorizationDataModel_unavailablePasses__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 comparePassDatesToPass:a2 searchOption:3];
}

- (BOOL)wantsInstructions
{
  return 0;
}

- (BOOL)praguePolicyRequired
{
  return 0;
}

- (BOOL)pinRequired
{
  id v3 = [(PKPaymentAuthorizationDataModel *)self paymentApplication];
  if ([v3 inAppPINRequired])
  {
    id v4 = [v3 inAppPINRequiredCurrency];
    id v5 = [(PKPaymentAuthorizationDataModel *)self currencyCode];
    uint64_t v6 = [v4 caseInsensitiveCompare:v5];

    id v7 = [v3 inAppPINRequiredAmount];
    id v8 = [(PKPaymentAuthorizationDataModel *)self transactionAmount];
    uint64_t v9 = [v7 compare:v8];

    uint64_t v10 = [(PKPaymentAuthorizationDataModel *)self pass];
    int64_t v11 = [(PKPaymentAuthorizationDataModel *)self _statusForPass:v10];

    if (v6) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v9 == -1;
    }
    BOOL v14 = v12 || v11 == 3;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)setStatus:(int64_t)a3 forItemWithType:(int64_t)a4
{
}

- (void)setStatus:(int64_t)a3 forItemWithType:(int64_t)a4 notify:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = [(PKPaymentAuthorizationDataModel *)self itemForType:a4];
  [v10 setStatus:a3];
  if (a4 == 3)
  {
    uint64_t v9 = [v10 pass];
    [(PKPaymentAuthorizationDataModel *)self _setStatus:a3 forPass:v9];
  }
  if (v5) {
    [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
  }
}

- (void)_setStatus:(int64_t)a3 forPass:(id)a4
{
  if (a4)
  {
    statusForPass = self->_statusForPass;
    uint64_t v6 = NSNumber;
    id v7 = a4;
    id v9 = [v6 numberWithInteger:a3];
    id v8 = [v7 uniqueID];

    [(NSMutableDictionary *)statusForPass setObject:v9 forKey:v8];
  }
}

- (int64_t)_statusForPass:(id)a3
{
  statusForPass = self->_statusForPass;
  id v4 = [a3 uniqueID];
  BOOL v5 = [(NSMutableDictionary *)statusForPass objectForKey:v4];

  if (v5) {
    int64_t v6 = [v5 integerValue];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)fallbackToBypassMode
{
  id v3 = PKLogFacilityTypeGetObject(7uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Falling back to bypass mode", v8, 2u);
  }

  id v4 = [(PKPaymentAuthorizationDataModel *)self itemForType:+[PKPaymentCardDataItem dataType]];
  if (v4) {
    [(NSMutableArray *)self->_items removeObject:v4];
  }
  statusForPass = self->_statusForPass;
  self->_statusForPass = 0;

  pass = self->_pass;
  self->_pass = 0;

  paymentApplication = self->_paymentApplication;
  self->_paymentApplication = 0;

  self->_int64_t mode = 3;
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)showPeerPaymentCardDataItem:(BOOL)a3 withCardDataItem:(BOOL)a4
{
  BOOL v4 = a4;
  int v5 = a3;
  if (!a3)
  {
    id v8 = [(PKPaymentAuthorizationDataModel *)self itemForType:2];
    if (v8) {
      [(PKPaymentAuthorizationDataModel *)self _removeDataItem:v8];
    }

    if (!v4) {
      goto LABEL_3;
    }
LABEL_9:
    [(PKPaymentAuthorizationDataModel *)self _ensureItemForClass:objc_opt_class()];
    goto LABEL_10;
  }
  [(PKPaymentAuthorizationDataModel *)self _ensureItemForClass:objc_opt_class()];
  if (v4) {
    goto LABEL_9;
  }
LABEL_3:
  id v7 = [(PKPaymentAuthorizationDataModel *)self itemForType:3];
  if (v7) {
    [(PKPaymentAuthorizationDataModel *)self _removeDataItem:v7];
  }

LABEL_10:
  [(PKPaymentAuthorizationDataModel *)self updatePeerPaymentPromotionForPeerPaymentQuote:v4 & ~v5];
}

- (void)setFinancingController:(id)a3
{
  objc_storeStrong((id *)&self->_financingController, a3);
  [(PKPaymentAuthorizationDataModel *)self recomputeHasAnyPayLaterOptions];
}

- (void)setSelectedFinancingOption:(id)a3
{
  BOOL v4 = (PKPayLaterFinancingOption *)a3;
  int v5 = v4;
  selectedFinancingOption = self->_selectedFinancingOption;
  if (selectedFinancingOption) {
    BOOL v7 = selectedFinancingOption == v4;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    BOOL v8 = -[PKPayLaterFinancingOption isAmountDetailsEqualToFinancingOption:](v4, "isAmountDetailsEqualToFinancingOption:");
    selectedFinancingOption = self->_selectedFinancingOption;
    if (!v8)
    {
      objc_storeStrong((id *)&self->_previouslySelectedFinancingOption, self->_selectedFinancingOption);
      selectedFinancingOption = self->_selectedFinancingOption;
    }
  }
  id v9 = [(PKPayLaterFinancingOption *)selectedFinancingOption selectionIdentifier];
  id v10 = [(PKPayLaterFinancingOption *)v5 selectionIdentifier];
  id v11 = v9;
  id v12 = v10;
  if (v11 == v12)
  {

    goto LABEL_15;
  }
  char v13 = v12;
  if (!v11 || !v12)
  {

    goto LABEL_14;
  }
  char v14 = [v11 isEqualToString:v12];

  if ((v14 & 1) == 0) {
LABEL_14:
  }
    [(NSMutableDictionary *)self->_acceptedApplications removeAllObjects];
LABEL_15:
  char v15 = self->_selectedFinancingOption;
  self->_selectedFinancingOption = v5;
  unint64_t v16 = v5;

  uint64_t v17 = objc_opt_class();
  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:v17];
  [(PKPaymentAuthorizationDataModel *)self recomputeHasAnyPayLaterOptions];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setPreviouslySelectedFinancingOption:(id)a3
{
  int v5 = (PKPayLaterFinancingOption *)a3;
  if (self->_previouslySelectedFinancingOption != v5)
  {
    int64_t v6 = v5;
    objc_storeStrong((id *)&self->_previouslySelectedFinancingOption, a3);
    [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:objc_opt_class()];
    [(PKPaymentAuthorizationDataModel *)self recomputeHasAnyPayLaterOptions];
    [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
    int v5 = v6;
  }
}

- (void)setAssessmentCollection:(id)a3
{
  objc_storeStrong((id *)&self->_assessmentCollection, a3);
  id v5 = a3;
  [(PKPaymentAuthorizationDataModel *)self recomputeHasAnyPayLaterOptions];
  uint64_t v6 = objc_opt_class();

  [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:v6];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)paymentOffersDidUpdate
{
  [(PKPaymentAuthorizationDataModel *)self recomputeHasAnyPayLaterOptions];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)setSelectedPaymentOffer:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPaymentOffer, a3);
  [(PKPaymentAuthorizationDataModel *)self _updatePaymentOfferDataItem];
  [(PKPaymentAuthorizationDataModel *)self recomputeHasAnyPayLaterOptions];
  [(PKPaymentAuthorizationDataModel *)self _notifyModelChanged];
}

- (void)_updatePaymentOfferDataItem
{
  if (self->_selectedPaymentOffer
    || ([(PKPaymentOffersController *)self->_paymentOffersController selectedOfferDetails],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 requiresUserAction],
        v3,
        v4))
  {
    uint64_t v5 = objc_opt_class();
    [(PKPaymentAuthorizationDataModel *)self _didSetItemForClass:v5];
  }
  else
  {
    id v6 = [(PKPaymentAuthorizationDataModel *)self itemForType:17];
    [(PKPaymentAuthorizationDataModel *)self _removeDataItem:v6];
  }
}

- (void)setPaymentOffersController:(id)a3
{
  objc_storeStrong((id *)&self->_paymentOffersController, a3);
  [(PKPaymentAuthorizationDataModel *)self recomputeHasAnyPayLaterOptions];
}

- (void)recomputeHasAnyPayLaterOptions
{
  id v3 = [(PKPayLaterFinancingController *)self->_financingController assessmentCollection];
  int v4 = [v3 eligibleProductAssessments];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    self->_hasAnyPayLaterOptions = 1;
  }
  else if ([(PKPaymentOffersController *)self->_paymentOffersController hasAnyEligiblePaymentOfferCriteriaOfType:1])
  {
    self->_hasAnyPayLaterOptions = 1;
  }
  else
  {
    self->_hasAnyPayLaterOptions = 0;
  }
}

- (unint64_t)connectedCardStateForPass:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentAuthorizationDataModel *)self primaryAccountIdentifiersWithConnectedCardStateSet];
  id v6 = [v4 primaryAccountIdentifier];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    BOOL v8 = [v4 bankConnectAccount];
    if (v8) {
      unint64_t v9 = 1;
    }
    else {
      unint64_t v9 = 2;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (int64_t)mode
{
  return self->_mode;
}

- (int64_t)fundingMode
{
  return self->_fundingMode;
}

- (PKPaymentRequest)paymentRequest
{
  return self->_paymentRequest;
}

- (NSArray)paymentContentItems
{
  return self->_paymentContentItems;
}

- (NSString)hostAppLocalizedName
{
  return self->_hostAppLocalizedName;
}

- (void)setHostAppLocalizedName:(id)a3
{
}

- (NSString)hostApplicationIdentifier
{
  return self->_hostApplicationIdentifier;
}

- (void)setHostApplicationIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)relevantPassUniqueID
{
  return self->_relevantPassUniqueID;
}

- (void)setRelevantPassUniqueID:(id)a3
{
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
}

- (NSString)billingAgreement
{
  return self->_billingAgreement;
}

- (NSString)couponCode
{
  return self->_couponCode;
}

- (unint64_t)numberOfOutstandingCouponCodeUpdates
{
  return self->_numberOfOutstandingCouponCodeUpdates;
}

- (CNContact)shippingEmail
{
  return self->_shippingEmail;
}

- (BOOL)isHideMyEmailLoading
{
  return self->_isHideMyEmailLoading;
}

- (void)setIsHideMyEmailLoading:(BOOL)a3
{
  self->_isHideMyEmailLoading = a3;
}

- (CNContact)shippingPhone
{
  return self->_shippingPhone;
}

- (CNContact)shippingName
{
  return self->_shippingName;
}

- (CNContact)shippingAddress
{
  return self->_shippingAddress;
}

- (CNContact)originalShippingAddress
{
  return self->_originalShippingAddress;
}

- (void)setOriginalShippingAddress:(id)a3
{
}

- (PKShippingMethod)shippingMethod
{
  return self->_shippingMethod;
}

- (NSString)shippingType
{
  return self->_shippingType;
}

- (void)setShippingType:(id)a3
{
}

- (BOOL)isShippingEditable
{
  return self->_shippingEditable;
}

- (void)setShippingEditable:(BOOL)a3
{
  self->_shippingEditable = a3;
}

- (NSString)shippingEditableMessage
{
  return self->_shippingEditableMessage;
}

- (NSArray)paymentErrors
{
  return self->_paymentErrors;
}

- (PKPayment)payment
{
  return self->_payment;
}

- (void)setPayment:(id)a3
{
}

- (NSArray)paymentContactFormatErrors
{
  return self->_paymentContactFormatErrors;
}

- (PKContactFormatValidator)contactFormatValidator
{
  return self->_contactFormatValidator;
}

- (void)setContactFormatValidator:(id)a3
{
}

- (void)setDefaults:(id)a3
{
}

- (void)setRecents:(id)a3
{
}

- (void)setLibrary:(id)a3
{
}

- (PKPaymentWebService)paymentWebService
{
  return self->_paymentWebService;
}

- (void)setPaymentWebService:(id)a3
{
}

- (PKPeerPaymentService)peerPaymentService
{
  return self->_peerPaymentService;
}

- (PKPaymentPass)peerPaymentPass
{
  return self->_peerPaymentPass;
}

- (void)setPeerPaymentPass:(id)a3
{
}

- (NSArray)pendingTransactions
{
  return self->_pendingTransactions;
}

- (void)setPendingTransactions:(id)a3
{
}

- (PKPaymentOrderDetails)pendingOrderDetails
{
  return self->_pendingOrderDetails;
}

- (void)setPendingOrderDetails:(id)a3
{
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (NSDecimalNumber)initialTransactionAmount
{
  return self->_initialTransactionAmount;
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (void)setPeerPaymentAccount:(id)a3
{
}

- (PKPeerPaymentQuote)peerPaymentQuote
{
  return self->_peerPaymentQuote;
}

- (BOOL)supportsPreservePeerPaymentBalance
{
  return self->_supportsPreservePeerPaymentBalance;
}

- (void)setSupportsPreservePeerPaymentBalance:(BOOL)a3
{
  self->_supportsPreservePeerPaymentBalance = a3;
}

- (BOOL)usePeerPaymentBalance
{
  return self->_usePeerPaymentBalance;
}

- (void)setUsePeerPaymentBalance:(BOOL)a3
{
  self->_usePeerPaymentBalance = a3;
}

- (PKBankAccountInformation)bankAccount
{
  return self->_bankAccount;
}

- (PKCurrencyAmount)peerPaymentBalanceForAccountPayment
{
  return self->_peerPaymentBalanceForAccountPayment;
}

- (NSString)installmentBindToken
{
  return self->_installmentBindToken;
}

- (void)setInstallmentBindToken:(id)a3
{
}

- (NSString)installmentGroupIdentifier
{
  return self->_installmentGroupIdentifier;
}

- (void)setInstallmentGroupIdentifier:(id)a3
{
}

- (NSDecimalNumber)installmentAuthorizationAmount
{
  return self->_installmentAuthorizationAmount;
}

- (void)setInstallmentAuthorizationAmount:(id)a3
{
}

- (PKPaymentApplication)paymentApplication
{
  return self->_paymentApplication;
}

- (BOOL)canAddPasses
{
  return self->_canAddPasses;
}

- (void)setCanAddPasses:(BOOL)a3
{
  self->_canAddPasses = a3;
}

- (BOOL)supportsEmptyPass
{
  return self->_supportsEmptyPass;
}

- (void)setSupportsEmptyPass:(BOOL)a3
{
  self->_supportsEmptyPass = a3;
}

- (PKPaymentInstructions)instructions
{
  return self->_instructions;
}

- (void)setInstructions:(id)a3
{
}

- (NSArray)allRemoteDevices
{
  return self->_allRemoteDevices;
}

- (PKRemotePaymentInstrument)remotePaymentInstrument
{
  return self->_remotePaymentInstrument;
}

- (PKRemotePaymentInstrument)initialRemotePaymentInstrument
{
  return self->_initialRemotePaymentInstrument;
}

- (void)setInitialRemotePaymentInstrument:(id)a3
{
}

- (NSSet)allAcceptedRemotePaymentInstruments
{
  return self->_allAcceptedRemotePaymentInstruments;
}

- (NSSet)allUnavailableRemotePaymentInstruments
{
  return self->_allUnavailableRemotePaymentInstruments;
}

- (PKPayLaterFinancingOption)selectedFinancingOption
{
  return self->_selectedFinancingOption;
}

- (PKPayLaterFinancingOption)previouslySelectedFinancingOption
{
  return self->_previouslySelectedFinancingOption;
}

- (PKPayLaterProductAssessmentCollection)assessmentCollection
{
  return self->_assessmentCollection;
}

- (PKPayLaterFinancingController)financingController
{
  return self->_financingController;
}

- (BOOL)hasAnyPayLaterOptions
{
  return self->_hasAnyPayLaterOptions;
}

- (void)setHasAnyPayLaterOptions:(BOOL)a3
{
  self->_hasAnyPayLaterOptions = a3;
}

- (PKPaymentOffersController)paymentOffersController
{
  return self->_paymentOffersController;
}

- (PKSelectedPaymentOffer)selectedPaymentOffer
{
  return self->_selectedPaymentOffer;
}

- (CNContact)cachedRecentAddress
{
  return self->_cachedRecentAddress;
}

- (void)setCachedRecentAddress:(id)a3
{
}

- (NSMutableSet)primaryAccountIdentifiersWithConnectedCardStateSet
{
  return self->_primaryAccountIdentifiersWithConnectedCardStateSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAccountIdentifiersWithConnectedCardStateSet, 0);
  objc_storeStrong((id *)&self->_cachedRecentAddress, 0);
  objc_storeStrong((id *)&self->_selectedPaymentOffer, 0);
  objc_storeStrong((id *)&self->_paymentOffersController, 0);
  objc_storeStrong((id *)&self->_financingController, 0);
  objc_storeStrong((id *)&self->_assessmentCollection, 0);
  objc_storeStrong((id *)&self->_previouslySelectedFinancingOption, 0);
  objc_storeStrong((id *)&self->_selectedFinancingOption, 0);
  objc_storeStrong((id *)&self->_allUnavailableRemotePaymentInstruments, 0);
  objc_storeStrong((id *)&self->_allAcceptedRemotePaymentInstruments, 0);
  objc_storeStrong((id *)&self->_initialRemotePaymentInstrument, 0);
  objc_storeStrong((id *)&self->_remotePaymentInstrument, 0);
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_paymentApplication, 0);
  objc_storeStrong((id *)&self->_installmentAuthorizationAmount, 0);
  objc_storeStrong((id *)&self->_installmentGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_installmentBindToken, 0);
  objc_storeStrong((id *)&self->_peerPaymentBalanceForAccountPayment, 0);
  objc_storeStrong((id *)&self->_bankAccount, 0);
  objc_storeStrong((id *)&self->_peerPaymentQuote, 0);
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_initialTransactionAmount, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong((id *)&self->_pendingOrderDetails, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_storeStrong((id *)&self->_peerPaymentPass, 0);
  objc_storeStrong((id *)&self->_peerPaymentService, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_contactFormatValidator, 0);
  objc_storeStrong((id *)&self->_paymentContactFormatErrors, 0);
  objc_storeStrong((id *)&self->_payment, 0);
  objc_storeStrong((id *)&self->_paymentErrors, 0);
  objc_storeStrong((id *)&self->_shippingEditableMessage, 0);
  objc_storeStrong((id *)&self->_shippingType, 0);
  objc_storeStrong((id *)&self->_shippingMethod, 0);
  objc_storeStrong((id *)&self->_originalShippingAddress, 0);
  objc_storeStrong((id *)&self->_shippingAddress, 0);
  objc_storeStrong((id *)&self->_shippingName, 0);
  objc_storeStrong((id *)&self->_shippingPhone, 0);
  objc_storeStrong((id *)&self->_shippingEmail, 0);
  objc_storeStrong((id *)&self->_couponCode, 0);
  objc_storeStrong((id *)&self->_billingAgreement, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_relevantPassUniqueID, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_hostApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_hostAppLocalizedName, 0);
  objc_storeStrong((id *)&self->_paymentContentItems, 0);
  objc_storeStrong((id *)&self->_paymentRequest, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_clientErrors, 0);
  objc_storeStrong((id *)&self->_paymentApplicationIdentifierForErrors, 0);
  objc_storeStrong(&self->_bankConnectOsloProvider, 0);
  objc_storeStrong((id *)&self->_balancesProviderQueue, 0);
  objc_storeStrong((id *)&self->_appleCardEnhancedMerchant, 0);
  objc_storeStrong((id *)&self->_acceptedApplications, 0);
  objc_storeStrong((id *)&self->_statusForPass, 0);
  objc_storeStrong((id *)&self->_allRemoteDevices, 0);
  objc_storeStrong((id *)&self->_remoteDeviceToAcceptedInstruments, 0);
  objc_storeStrong((id *)&self->_instrumentToDeviceMap, 0);
  objc_storeStrong((id *)&self->_unavailablePasses, 0);
  objc_storeStrong((id *)&self->_acceptedPasses, 0);
  objc_storeStrong((id *)&self->_billingAddressForFundingSource, 0);
  objc_storeStrong((id *)&self->_typeToItemMap, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end