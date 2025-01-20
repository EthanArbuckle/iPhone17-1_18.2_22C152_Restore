@interface PKPaymentOffersController
- (BOOL)_eligibleToFetchPaymentOfferCatalog;
- (BOOL)_paymentOfferCriteriaToKeep:(id)a3;
- (BOOL)hasAnyEligiblePaymentOfferCriteriaOfType:(unint64_t)a3;
- (BOOL)hasFetchedCatalogFromServer;
- (BOOL)hasSeenLanguageDisclosureForCriteriaForIdentifier:(id)a3;
- (PKPaymentOffersController)initWithPaymentService:(id)a3 paymentWebService:(id)a4 passLibrary:(id)a5 configuration:(id)a6;
- (PKPaymentOffersControllerConfiguration)configuration;
- (PKPaymentOffersControllerSelectedOfferDetails)selectedOfferDetails;
- (id)_criteriaEligibilityConfigurationForCriteria:(id)a3;
- (id)_eligibleCatalogItems;
- (id)_eligiblePaymentOfferCriteriaForPassUniqueID:(id)a3;
- (id)_redeemablePaymentRewardsBalanceFrom:(id)a3;
- (id)dynamicContentPageForCriteriaIdentifier:(id)a3 pageType:(unint64_t)a4;
- (id)eligiblePaymentOfferCriteriaForPassUniqueID:(id)a3 type:(unint64_t)a4;
- (id)eligiblePaymentOfferCriteriaNoAssociatedPassWithType:(unint64_t)a3;
- (id)eligiblePaymentOfferInstallmentCriteriaRequiringSetup;
- (id)ineligibleDetailsForCriteria:(id)a3;
- (id)loadingDetailsForPaymentOffersForCriteriaIdentifier:(id)a3 passUniqueID:(id)a4;
- (id)paymentOfferCollectionForCriteriaIdentifier:(id)a3 passUniqueID:(id)a4;
- (id)paymentOfferCriteriaForIdentifier:(id)a3;
- (id)paymentOfferCriteriaForPassUniqueID:(id)a3;
- (id)paymentOfferInstallmentCriteriaRequiringSetup;
- (id)paymentRedeemableRewardsBalanceWithPassUniqueIdentifier:(id)a3;
- (id)preferredLocalizationLanguageForCriteriaIdentifier:(id)a3;
- (unint64_t)loadingStateForCatalog;
- (void)_accessObserversWithHandler:(id)a3;
- (void)_addPaymentOffersControllerRequest:(id)a3;
- (void)_executeNextPaymentOffersControllerRequestIfPossible;
- (void)_fetchDeviceMetadataFields:(unint64_t)a3 completion:(id)a4;
- (void)_informObserversPaymentOfferCatalogChanged;
- (void)_informObserversPaymentOfferDynamicContentChanged;
- (void)_informObserversPaymentOffersChangedForPassUniqueID:(id)a3;
- (void)_informObserversSelectedPaymentOfferChangedForPassUniqueID:(id)a3;
- (void)_performCatalogRequest:(id)a3 completion:(id)a4;
- (void)_performDynamicContentRequest:(id)a3 completion:(id)a4;
- (void)_performPaymentOffersRequest:(id)a3 completion:(id)a4;
- (void)_printCatalogEligibilityDebugDetails;
- (void)_updateCatalogLoadingState:(unint64_t)a3;
- (void)_updateLoadingDetailsState:(id)a3 criteriaIdentifier:(id)a4 passUniqueID:(id)a5 requestType:(unint64_t)a6;
- (void)clearCurrentSelectedPaymentOfferDetails;
- (void)markLanguageDisclosureAsSeenForCriteriaForIdentifier:(id)a3;
- (void)registerObserver:(id)a3;
- (void)removeCachedPaymentOffers;
- (void)resetLoadingDetailsForPaymentOffersForCriteriaIdentifier:(id)a3 passUniqueID:(id)a4;
- (void)unregisterObserver:(id)a3;
- (void)updateCurrentSelectedPaymentOffer:(id)a3 updateReason:(unint64_t)a4;
- (void)updateDynamicContentPageForCriteriaIdentifier:(id)a3 pageTypes:(id)a4 completion:(id)a5;
- (void)updatePaymentOfferCatalogWithCompletion:(id)a3;
- (void)updatePaymentOffersForCriteriaIdentifier:(id)a3 paymentPass:(id)a4 reason:(unint64_t)a5 completion:(id)a6;
- (void)updatePaymentRedeemableRewardsBalanceWithPassUniqueIdentifier:(id)a3 completion:(id)a4;
@end

@implementation PKPaymentOffersController

- (PKPaymentOffersController)initWithPaymentService:(id)a3 paymentWebService:(id)a4 passLibrary:(id)a5 configuration:(id)a6
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  v16 = 0;
  if (v11 && v12 && v13 && v14)
  {
    v62.receiver = self;
    v62.super_class = (Class)PKPaymentOffersController;
    v17 = [(PKPaymentOffersController *)&v62 init];
    v18 = v17;
    if (v17)
    {
      v57 = v15;
      objc_storeStrong((id *)&v17->_paymentService, a3);
      objc_storeStrong((id *)&v18->_paymentWebService, a4);
      v19 = [v12 context];
      v20 = [v19 primaryRegion];
      uint64_t v21 = [v20 paymentOffersServiceURL];
      baseURL = v18->_baseURL;
      v18->_baseURL = (NSURL *)v21;

      if (!v18->_baseURL)
      {
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        v56 = v19;
        v23 = [v19 regions];
        v24 = [v23 allValues];

        uint64_t v25 = [v24 countByEnumeratingWithState:&v58 objects:v65 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          uint64_t v27 = *(void *)v59;
          while (2)
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v59 != v27) {
                objc_enumerationMutation(v24);
              }
              uint64_t v29 = [*(id *)(*((void *)&v58 + 1) + 8 * i) paymentOffersServiceURL];
              if (v29)
              {
                v30 = v18->_baseURL;
                v18->_baseURL = (NSURL *)v29;

                goto LABEL_17;
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v58 objects:v65 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }
LABEL_17:

        v19 = v56;
      }
      objc_storeStrong((id *)&v18->_passLibrary, a5);
      objc_storeStrong((id *)&v18->_configuration, a6);
      v18->_lockObservers._os_unfair_lock_opaque = 0;
      uint64_t v31 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
      observers = v18->_observers;
      v18->_observers = (NSHashTable *)v31;

      v33 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
      queuedRequests = v18->_queuedRequests;
      v18->_queuedRequests = v33;

      v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      sessionIdentifierForCriteriaIdentifier = v18->_sessionIdentifierForCriteriaIdentifier;
      v18->_sessionIdentifierForCriteriaIdentifier = v35;

      v37 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      paymentOffersForCriteriaIdentifier = v18->_paymentOffersForCriteriaIdentifier;
      v18->_paymentOffersForCriteriaIdentifier = v37;

      v39 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      dynamicContentPagesByCriteriaIdentifier = v18->_dynamicContentPagesByCriteriaIdentifier;
      v18->_dynamicContentPagesByCriteriaIdentifier = v39;

      v41 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      languageDisclosuresSeenForCriteriaIdentifier = v18->_languageDisclosuresSeenForCriteriaIdentifier;
      v18->_languageDisclosuresSeenForCriteriaIdentifier = v41;

      v43 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      preferredLanguageForCriteriaIdentifier = v18->_preferredLanguageForCriteriaIdentifier;
      v18->_preferredLanguageForCriteriaIdentifier = v43;

      v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      requestLoadingDetails = v18->_requestLoadingDetails;
      v18->_requestLoadingDetails = v45;

      dispatch_queue_t v47 = dispatch_queue_create("com.apple.passkit.PKPaymentOffersController.reply", 0);
      replyQueue = v18->_replyQueue;
      v18->_replyQueue = (OS_dispatch_queue *)v47;

      v18->_catalogLoadingState = 1;
      v49 = objc_alloc_init(PKPaymentOffersControllerSelectedOfferDetails);
      selectedOfferDetails = v18->_selectedOfferDetails;
      v18->_selectedOfferDetails = v49;

      if ([(PKPaymentOffersController *)v18 _eligibleToFetchPaymentOfferCatalog])
      {
        uint64_t v51 = [(PKPaymentService *)v18->_paymentService paymentOffersCatalog];
        catalog = v18->_catalog;
        v18->_catalog = (PKPaymentOfferCatalog *)v51;

        v53 = v18->_catalog;
        if (v53)
        {
          v54 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v64 = v53;
            _os_log_impl(&dword_190E10000, v54, OS_LOG_TYPE_DEFAULT, "Using cached payment offers catalog %@", buf, 0xCu);
          }
        }
      }

      v15 = v57;
    }
    self = v18;
    v16 = self;
  }

  return v16;
}

- (void)updateCurrentSelectedPaymentOffer:(id)a3 updateReason:(unint64_t)a4
{
}

- (void)clearCurrentSelectedPaymentOfferDetails
{
}

- (BOOL)hasFetchedCatalogFromServer
{
  return self->_hasFetchedCatalogFromServer;
}

- (void)updatePaymentOfferCatalogWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[PKPaymentOffersControllerRequest alloc] initPaymentOfferCatalogRequestWithCompletion:v4];

  [(PKPaymentOffersController *)self _addPaymentOffersControllerRequest:v5];
}

- (void)updatePaymentOffersForCriteriaIdentifier:(id)a3 paymentPass:(id)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [[PKPaymentOffersControllerRequest alloc] initPaymentOfferRequestWithCriteriaIdentifierIdentifier:v12 paymentPass:v11 reason:a5 completion:v10];

  [(PKPaymentOffersController *)self _addPaymentOffersControllerRequest:v13];
}

- (id)paymentOfferCollectionForCriteriaIdentifier:(id)a3 passUniqueID:(id)a4
{
  id v5 = PKPaymentOffersControllerGenerateCacheKey(a3, a4);
  if (v5)
  {
    v6 = [(NSMutableDictionary *)self->_paymentOffersForCriteriaIdentifier objectForKeyedSubscript:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)dynamicContentPageForCriteriaIdentifier:(id)a3 pageType:(unint64_t)a4
{
  if (a3)
  {
    id v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_dynamicContentPagesByCriteriaIdentifier, "objectForKeyedSubscript:");
    v6 = [NSNumber numberWithUnsignedInteger:a4];
    v7 = [v5 objectForKeyedSubscript:v6];
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)updateDynamicContentPageForCriteriaIdentifier:(id)a3 pageTypes:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[PKPaymentOffersControllerRequest alloc] initDynamicContentRequestWithCriteriaIdentifier:v10 pageTypes:v9 completion:v8];

  [(PKPaymentOffersController *)self _addPaymentOffersControllerRequest:v11];
}

- (void)removeCachedPaymentOffers
{
  if ([(NSMutableDictionary *)self->_paymentOffersForCriteriaIdentifier count])
  {
    v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Removing cached payment offers", v4, 2u);
    }

    [(NSMutableDictionary *)self->_paymentOffersForCriteriaIdentifier removeAllObjects];
  }
}

- (unint64_t)loadingStateForCatalog
{
  return self->_catalogLoadingState;
}

- (id)loadingDetailsForPaymentOffersForCriteriaIdentifier:(id)a3 passUniqueID:(id)a4
{
  id v5 = PKPaymentOffersControllerGenerateCacheKey(a3, a4);
  if (v5)
  {
    v6 = [(NSMutableDictionary *)self->_requestLoadingDetails objectForKeyedSubscript:&unk_1EE22BAE0];
    v7 = [v6 objectForKeyedSubscript:v5];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)resetLoadingDetailsForPaymentOffersForCriteriaIdentifier:(id)a3 passUniqueID:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v5 = PKPaymentOffersControllerGenerateCacheKey(a3, a4);
    v6 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Reseting payment offers loading state for %@", (uint8_t *)&v8, 0xCu);
    }

    v7 = [(NSMutableDictionary *)self->_requestLoadingDetails objectForKeyedSubscript:&unk_1EE22BAE0];
    [v7 setObject:0 forKeyedSubscript:v5];
  }
}

- (void)_updateCatalogLoadingState:(unint64_t)a3
{
  unint64_t catalogLoadingState = self->_catalogLoadingState;
  self->_unint64_t catalogLoadingState = a3;
  if (catalogLoadingState != a3) {
    [(PKPaymentOffersController *)self _informObserversPaymentOfferCatalogChanged];
  }
}

- (void)_updateLoadingDetailsState:(id)a3 criteriaIdentifier:(id)a4 passUniqueID:(id)a5 requestType:(unint64_t)a6
{
  id v10 = a3;
  if (a4)
  {
    id v22 = v10;
    id v11 = PKPaymentOffersControllerGenerateCacheKey(a4, a5);
    requestLoadingDetails = self->_requestLoadingDetails;
    id v13 = [NSNumber numberWithUnsignedInteger:a6];
    id v14 = [(NSMutableDictionary *)requestLoadingDetails objectForKeyedSubscript:v13];

    v15 = [v14 objectForKeyedSubscript:v11];
    if (!v22 || !v15 || ([v22 isEqual:v15] & 1) == 0)
    {
      if (!v14)
      {
        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v17 = self->_requestLoadingDetails;
        v18 = [NSNumber numberWithUnsignedInteger:a6];
        [(NSMutableDictionary *)v17 setObject:v16 forKeyedSubscript:v18];
      }
      v19 = self->_requestLoadingDetails;
      v20 = [NSNumber numberWithUnsignedInteger:a6];
      uint64_t v21 = [(NSMutableDictionary *)v19 objectForKeyedSubscript:v20];
      [v21 setObject:v22 forKeyedSubscript:v11];

      [(PKPaymentOffersController *)self _informObserversPaymentOfferCatalogChanged];
    }

    id v10 = v22;
  }
}

- (id)eligiblePaymentOfferCriteriaForPassUniqueID:(id)a3 type:(unint64_t)a4
{
  id v5 = [(PKPaymentOffersController *)self _eligiblePaymentOfferCriteriaForPassUniqueID:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __78__PKPaymentOffersController_eligiblePaymentOfferCriteriaForPassUniqueID_type___block_invoke;
  v8[3] = &__block_descriptor_40_e32_B16__0__PKPaymentOfferCriteria_8l;
  v8[4] = a4;
  v6 = objc_msgSend(v5, "pk_firstObjectPassingTest:", v8);

  return v6;
}

BOOL __78__PKPaymentOffersController_eligiblePaymentOfferCriteriaForPassUniqueID_type___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (id)eligiblePaymentOfferCriteriaNoAssociatedPassWithType:(unint64_t)a3
{
  id v4 = [(PKPaymentOffersController *)self _eligiblePaymentOfferCriteriaForPassUniqueID:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __82__PKPaymentOffersController_eligiblePaymentOfferCriteriaNoAssociatedPassWithType___block_invoke;
  v7[3] = &__block_descriptor_40_e39_B32__0__PKPaymentOfferCriteria_8Q16_B24l;
  v7[4] = a3;
  id v5 = objc_msgSend(v4, "pk_objectsPassingTest:", v7);

  return v5;
}

BOOL __82__PKPaymentOffersController_eligiblePaymentOfferCriteriaNoAssociatedPassWithType___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (id)paymentOfferCriteriaForPassUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentOffersController *)self _eligibleCatalogItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PKPaymentOffersController_paymentOfferCriteriaForPassUniqueID___block_invoke;
  v9[3] = &unk_1E56DD688;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "pk_objectsPassingTest:", v9);

  return v7;
}

uint64_t __65__PKPaymentOffersController_paymentOfferCriteriaForPassUniqueID___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 associatedPassUniqueID];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  v7 = v6;
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

- (id)eligiblePaymentOfferInstallmentCriteriaRequiringSetup
{
  v2 = [(PKPaymentOffersController *)self _eligiblePaymentOfferCriteriaForPassUniqueID:0];
  v3 = objc_msgSend(v2, "pk_objectsPassingTest:", &__block_literal_global_65);

  return v3;
}

BOOL __82__PKPaymentOffersController_eligiblePaymentOfferInstallmentCriteriaRequiringSetup__block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 1;
}

- (id)paymentOfferInstallmentCriteriaRequiringSetup
{
  v2 = [(PKPaymentOffersController *)self _eligibleCatalogItems];
  v3 = objc_msgSend(v2, "pk_objectsPassingTest:", &__block_literal_global_117_0);

  return v3;
}

BOOL __74__PKPaymentOffersController_paymentOfferInstallmentCriteriaRequiringSetup__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 associatedPassUniqueID];
  if (v3) {
    BOOL v4 = 0;
  }
  else {
    BOOL v4 = [v2 type] == 1;
  }

  return v4;
}

- (id)paymentOfferCriteriaForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentOffersController *)self _eligibleCatalogItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__PKPaymentOffersController_paymentOfferCriteriaForIdentifier___block_invoke;
  v9[3] = &unk_1E56E29F0;
  id v10 = v4;
  id v6 = v4;
  v7 = objc_msgSend(v5, "pk_firstObjectPassingTest:", v9);

  return v7;
}

uint64_t __63__PKPaymentOffersController_paymentOfferCriteriaForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 identifier];
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  v7 = v6;
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

- (id)_eligiblePaymentOfferCriteriaForPassUniqueID:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPaymentOffersController *)self _eligibleCatalogItems];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__PKPaymentOffersController__eligiblePaymentOfferCriteriaForPassUniqueID___block_invoke;
  v9[3] = &unk_1E56E2A18;
  id v10 = v4;
  id v11 = self;
  id v6 = v4;
  v7 = objc_msgSend(v5, "pk_objectsPassingTest:", v9);

  return v7;
}

uint64_t __74__PKPaymentOffersController__eligiblePaymentOfferCriteriaForPassUniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 associatedPassUniqueID];
  id v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_7;
  }
  uint64_t v8 = v7;
  if (!v6 || !v7)
  {

    uint64_t v10 = 0;
    goto LABEL_9;
  }
  int v9 = [v6 isEqualToString:v7];

  if (v9)
  {
LABEL_7:
    id v6 = [*(id *)(a1 + 40) ineligibleDetailsForCriteria:v3];
    uint64_t v10 = [v6 isEligible];
LABEL_9:

    goto LABEL_10;
  }
  uint64_t v10 = 0;
LABEL_10:

  return v10;
}

- (id)ineligibleDetailsForCriteria:(id)a3
{
  id v4 = a3;
  unint64_t v28 = 0;
  id v5 = [(PKPaymentOffersController *)self _criteriaEligibilityConfigurationForCriteria:v4];
  id v6 = [v4 identifier];
  id v7 = [(PKPaymentOffersController *)self preferredLocalizationLanguageForCriteriaIdentifier:v6];

  uint64_t v8 = [(PKPaymentOffersControllerConfiguration *)self->_configuration originURL];

  if (!v5)
  {
    BOOL v18 = v8 != 0;
    uint64_t v19 = 1;
LABEL_14:
    v20 = +[PKPaymentOfferCriteriaIneligibleDetails ineligibleDetailsWithReason:v19 preferredLanguage:v7 criteria:v4 isWebPaymentRequest:v18];
    goto LABEL_18;
  }
  if (([v4 eligibleWithConfiguration:v5 ineligibleReason:&v28] & 1) == 0)
  {
    if (v28 > 0x12) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = qword_191674838[v28];
    }
    BOOL v18 = v8 != 0;
    goto LABEL_14;
  }
  int v9 = [v4 identifier];
  uint64_t v10 = [v4 associatedPassUniqueID];
  id v11 = PKPaymentOffersControllerGenerateCacheKey(v9, v10);

  id v12 = [(NSMutableDictionary *)self->_paymentOffersForCriteriaIdentifier objectForKeyedSubscript:v11];
  uint64_t v13 = [v4 type];
  if (v13)
  {
    if (v13 == 1)
    {
      id v14 = [v12 installmentAssessment];
      v15 = v14;
      if (v14 && ([v14 isEligible] & 1) == 0)
      {
        uint64_t v22 = [v15 offerEligibility];
        if ((unint64_t)(v22 - 1) >= 0xA) {
          uint64_t v23 = 1;
        }
        else {
          uint64_t v23 = qword_1916748D0[v22 - 1];
        }
        uint64_t v27 = v23;
        v24 = [v15 dynamicContent];
        uint64_t v25 = [v24 dynamicContentPageForPageType:5];
        uint64_t v26 = [v25 subtitle];

        v20 = +[PKPaymentOfferCriteriaIneligibleDetails ineligibleDetailsWithReason:v27 preferredLanguage:v7 overrideDisplayString:v26 criteria:v4 isWebPaymentRequest:v8 != 0];

        goto LABEL_17;
      }
    }
    BOOL v16 = v8 != 0;
    uint64_t v17 = 0;
  }
  else
  {
    BOOL v16 = v8 != 0;
    uint64_t v17 = 1;
  }
  v20 = +[PKPaymentOfferCriteriaIneligibleDetails ineligibleDetailsWithReason:v17 preferredLanguage:v7 criteria:v4 isWebPaymentRequest:v16];
LABEL_17:

LABEL_18:
  return v20;
}

- (BOOL)hasAnyEligiblePaymentOfferCriteriaOfType:(unint64_t)a3
{
  id v5 = [(PKPaymentOffersController *)self _eligibleCatalogItems];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__PKPaymentOffersController_hasAnyEligiblePaymentOfferCriteriaOfType___block_invoke;
  v7[3] = &unk_1E56DDBC0;
  v7[4] = self;
  void v7[5] = a3;
  LOBYTE(a3) = objc_msgSend(v5, "pk_containsObjectPassingTest:", v7);

  return a3;
}

uint64_t __70__PKPaymentOffersController_hasAnyEligiblePaymentOfferCriteriaOfType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 type] == *(void *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) ineligibleDetailsForCriteria:v3];
    uint64_t v5 = [v4 isEligible];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hasSeenLanguageDisclosureForCriteriaForIdentifier:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = -[NSMutableDictionary objectForKeyedSubscript:](self->_languageDisclosuresSeenForCriteriaIdentifier, "objectForKeyedSubscript:");
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)markLanguageDisclosureAsSeenForCriteriaForIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Updating language disclosure as seen for criteria identifier: %@", (uint8_t *)&v6, 0xCu);
    }

    [(NSMutableDictionary *)self->_languageDisclosuresSeenForCriteriaIdentifier setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v4];
  }
}

- (id)preferredLocalizationLanguageForCriteriaIdentifier:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PKPassKitBundle();
  int v6 = [v5 preferredLocalizations];
  uint64_t v7 = [v6 firstObject];
  uint64_t v8 = (void *)v7;
  int v9 = @"en";
  if (v7) {
    int v9 = (__CFString *)v7;
  }
  uint64_t v10 = v9;

  id v11 = [(PKPaymentOffersController *)self paymentOfferCriteriaForIdentifier:v4];
  if (!v11)
  {
    v15 = v10;
    goto LABEL_41;
  }
  id v12 = [(NSMutableDictionary *)self->_preferredLanguageForCriteriaIdentifier objectForKeyedSubscript:v4];
  uint64_t v13 = v12;
  if (!v12)
  {
    if ([v11 type] != 1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v14 = v10;
      goto LABEL_39;
    }
    id v45 = v11;
    v56 = [v45 supportedLanguages];
    id v51 = v4;
    v49 = v6;
    v50 = v5;
    dispatch_queue_t v47 = v11;
    v48 = v10;
    v46 = self;
    if ([v56 count])
    {
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      id v16 = v6;
      uint64_t v57 = [v16 countByEnumeratingWithState:&v73 objects:v84 count:16];
      if (v57)
      {
        v15 = 0;
        obuint64_t j = v16;
        uint64_t v54 = *(void *)v74;
        do
        {
          for (uint64_t i = 0; i != v57; ++i)
          {
            if (*(void *)v74 != v54) {
              objc_enumerationMutation(obj);
            }
            BOOL v18 = *(void **)(*((void *)&v73 + 1) + 8 * i);
            long long v69 = 0u;
            long long v70 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            id v19 = v56;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v69 objects:v83 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              long long v59 = v15;
              uint64_t v22 = *(void *)v70;
              while (2)
              {
                for (uint64_t j = 0; j != v21; ++j)
                {
                  if (*(void *)v70 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  v24 = *(void **)(*((void *)&v69 + 1) + 8 * j);
                  id v25 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v18];
                  id v26 = v24;
                  uint64_t v27 = v26;
                  if (v25 == v26)
                  {

LABEL_33:
                    v15 = v18;

                    goto LABEL_34;
                  }
                  if (v26) {
                    BOOL v28 = v25 == 0;
                  }
                  else {
                    BOOL v28 = 1;
                  }
                  if (v28)
                  {
                  }
                  else
                  {
                    int v29 = [v25 isEqualToString:v26];

                    if (v29)
                    {
                      uint64_t v27 = v25;
                      goto LABEL_33;
                    }
                  }
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v69 objects:v83 count:16];
                if (v21) {
                  continue;
                }
                break;
              }
              v15 = v59;
            }
LABEL_34:
          }
          uint64_t v57 = [obj countByEnumeratingWithState:&v73 objects:v84 count:16];
        }
        while (v57);

        id v4 = v51;
        int v6 = v49;
        uint64_t v5 = v50;
        id v11 = v47;
        uint64_t v10 = v48;
        v30 = v46;
        if (v15) {
          goto LABEL_73;
        }
      }
      else
      {
      }
    }
    long long v60 = [v5 localizations];
    long long v65 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id obja = v56;
    uint64_t v58 = [obja countByEnumeratingWithState:&v65 objects:v82 count:16];
    if (v58)
    {
      uint64_t v55 = *(void *)v66;
      while (2)
      {
        for (uint64_t k = 0; k != v58; ++k)
        {
          if (*(void *)v66 != v55) {
            objc_enumerationMutation(obja);
          }
          v33 = *(void **)(*((void *)&v65 + 1) + 8 * k);
          long long v61 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          long long v64 = 0u;
          id v34 = v60;
          uint64_t v35 = [v34 countByEnumeratingWithState:&v61 objects:v81 count:16];
          if (v35)
          {
            uint64_t v36 = v35;
            uint64_t v37 = *(void *)v62;
LABEL_52:
            uint64_t v38 = 0;
            while (1)
            {
              if (*(void *)v62 != v37) {
                objc_enumerationMutation(v34);
              }
              v39 = *(void **)(*((void *)&v61 + 1) + 8 * v38);
              id v40 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v39];
              id v41 = v33;
              v42 = v41;
              if (v40 == v41) {
                break;
              }
              if (v33 && v40)
              {
                char v43 = [v40 isEqualToString:v41];

                if (v43)
                {
                  v42 = v40;
                  goto LABEL_65;
                }
              }
              else
              {
              }
              if (v36 == ++v38)
              {
                uint64_t v36 = [v34 countByEnumeratingWithState:&v61 objects:v81 count:16];
                if (v36) {
                  goto LABEL_52;
                }
                goto LABEL_63;
              }
            }

LABEL_65:
            v15 = v39;

            if (!v15) {
              goto LABEL_66;
            }

            id v4 = v51;
            int v6 = v49;
            uint64_t v5 = v50;
            uint64_t v10 = v48;
            goto LABEL_72;
          }
LABEL_63:

LABEL_66:
          v44 = PKLogFacilityTypeGetObject(6uLL);
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v78 = v33;
            __int16 v79 = 2112;
            id v80 = v51;
            _os_log_impl(&dword_190E10000, v44, OS_LOG_TYPE_DEFAULT, "Server has a supported language of %@ for criteriaIdentifier %@, but that is not a supported language in the PKPassKitBundle", buf, 0x16u);
          }
        }
        uint64_t v58 = [obja countByEnumeratingWithState:&v65 objects:v82 count:16];
        if (v58) {
          continue;
        }
        break;
      }
    }

    uint64_t v10 = v48;
    v15 = v48;
    id v4 = v51;
    int v6 = v49;
    uint64_t v5 = v50;
LABEL_72:
    v30 = v46;
    id v11 = v47;
    uint64_t v13 = 0;
LABEL_73:
    [(NSMutableDictionary *)v30->_preferredLanguageForCriteriaIdentifier setObject:v15 forKeyedSubscript:v4];

    goto LABEL_40;
  }
  id v14 = v12;
LABEL_39:
  v15 = v14;
LABEL_40:

LABEL_41:
  return v15;
}

- (void)_addPaymentOffersControllerRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (PKPaymentOffersControllerRequest *)a3;
  if (v4)
  {
    if ([(PKPaymentOffersControllerRequest *)self->_currentRequest coalesceWithRequest:v4])
    {
      PKLogFacilityTypeGetObject(6uLL);
      uint64_t v5 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v5->super.super, OS_LOG_TYPE_DEFAULT))
      {
        currentRequest = self->_currentRequest;
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = currentRequest;
        _os_log_impl(&dword_190E10000, &v5->super.super, OS_LOG_TYPE_DEFAULT, "Coalescing incoming payment offers controller request onto current request %@", buf, 0xCu);
      }
LABEL_19:
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v5 = self->_queuedRequests;
      uint64_t v7 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v15;
        while (2)
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v15 != v9) {
              objc_enumerationMutation(v5);
            }
            id v11 = *(PKPaymentOffersControllerRequest **)(*((void *)&v14 + 1) + 8 * i);
            if (-[PKPaymentOffersControllerRequest coalesceWithRequest:](v11, "coalesceWithRequest:", v4, (void)v14))
            {
              uint64_t v13 = PKLogFacilityTypeGetObject(6uLL);
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v20 = v11;
                _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Coalescing incoming payment offers controller request onto queued request %@", buf, 0xCu);
              }

              goto LABEL_19;
            }
          }
          uint64_t v8 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v8) {
            continue;
          }
          break;
        }
      }

      [(NSMutableOrderedSet *)self->_queuedRequests addObject:v4];
      id v12 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v20 = v4;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Adding incoming payment offers controller request onto queued list %@", buf, 0xCu);
      }

      [(PKPaymentOffersController *)self _executeNextPaymentOffersControllerRequestIfPossible];
    }
  }
}

- (void)_executeNextPaymentOffersControllerRequestIfPossible
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!self->_currentRequest)
  {
    id v3 = [(NSMutableOrderedSet *)self->_queuedRequests firstObject];
    currentRequest = self->_currentRequest;
    self->_currentRequest = v3;

    uint64_t v5 = self->_currentRequest;
    if (v5)
    {
      int v6 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v12 = v5;
        _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Starting payment offers controller request %@", buf, 0xCu);
      }

      [(NSMutableOrderedSet *)self->_queuedRequests removeObjectAtIndex:0];
      objc_initWeak((id *)buf, self);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __81__PKPaymentOffersController__executeNextPaymentOffersControllerRequestIfPossible__block_invoke;
      aBlock[3] = &unk_1E56E2A40;
      objc_copyWeak(&v10, (id *)buf);
      uint64_t v7 = _Block_copy(aBlock);
      unint64_t v8 = [(PKPaymentOffersControllerRequest *)self->_currentRequest type];
      if (v8)
      {
        if (v8 == 1)
        {
          [(PKPaymentOffersController *)self _performPaymentOffersRequest:self->_currentRequest completion:v7];
        }
        else if (v8 == 2)
        {
          [(PKPaymentOffersController *)self _performDynamicContentRequest:self->_currentRequest completion:v7];
        }
      }
      else
      {
        [(PKPaymentOffersController *)self _performCatalogRequest:self->_currentRequest completion:v7];
      }

      objc_destroyWeak(&v10);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __81__PKPaymentOffersController__executeNextPaymentOffersControllerRequestIfPossible__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (v4)
    {
      uint64_t v7 = PKLocalizedPaymentString(&cfstr_GenericErrorTi.isa, 0);
      unint64_t v8 = PKLocalizedPaymentString(&cfstr_GenericErrorMe.isa, 0);
      uint64_t v9 = PKDisplayableErrorCustomWithType(-1, v7, v8, v4, 0);
      id v10 = (void *)*((void *)v6 + 4);
      *((void *)v6 + 4) = v9;
    }
    else
    {
      uint64_t v7 = (void *)WeakRetained[4];
      WeakRetained[4] = 0;
    }

    id v11 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *((void *)v6 + 11);
      *(_DWORD *)buf = 138412290;
      uint64_t v25 = v12;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Completed payment offers controller request %@", buf, 0xCu);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v13 = objc_msgSend(*((id *)v6 + 11), "completions", 0);
    uint64_t v14 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v20;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v20 != v16) {
            objc_enumerationMutation(v13);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * v17++) + 16))();
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v15);
    }

    BOOL v18 = (void *)*((void *)v6 + 11);
    *((void *)v6 + 11) = 0;

    [v6 _executeNextPaymentOffersControllerRequestIfPossible];
  }
}

- (BOOL)_eligibleToFetchPaymentOfferCatalog
{
  if (PKPaymentOffersEligibleToFetchCatalog(self->_paymentWebService))
  {
    if (!self->_baseURL)
    {
      id v3 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Not fetching payment offers since there is no baseURL", buf, 2u);
      }
      goto LABEL_15;
    }
    id v3 = [(PKPaymentOffersControllerConfiguration *)self->_configuration currencyCode];
    if (v3)
    {
      if (self->_catalogLoadingState)
      {
        BOOL v4 = 1;
LABEL_16:

        return v4;
      }
      uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_14;
      }
      __int16 v9 = 0;
      id v6 = "Not fetching payment offers because the loading state is not applicable";
      uint64_t v7 = (uint8_t *)&v9;
    }
    else
    {
      uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

LABEL_15:
        BOOL v4 = 0;
        goto LABEL_16;
      }
      __int16 v10 = 0;
      id v6 = "Not fetching payment offers because there is no currencyCode defined";
      uint64_t v7 = (uint8_t *)&v10;
    }
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    goto LABEL_14;
  }
  return 0;
}

- (id)_eligibleCatalogItems
{
  id v3 = [(PKPaymentOfferCatalog *)self->_catalog catalog];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__PKPaymentOffersController__eligibleCatalogItems__block_invoke;
  v6[3] = &unk_1E56DD688;
  v6[4] = self;
  BOOL v4 = objc_msgSend(v3, "pk_objectsPassingTest:", v6);

  return v4;
}

uint64_t __50__PKPaymentOffersController__eligibleCatalogItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _paymentOfferCriteriaToKeep:a2];
}

- (BOOL)_paymentOfferCriteriaToKeep:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 type];
  if (!v4) {
    goto LABEL_9;
  }
  if (v4 != 2)
  {
    if (v4 != 1) {
      goto LABEL_7;
    }
    if (!PKHideCardBenefitPayLater())
    {
      uint64_t v5 = [v3 associatedPassUniqueID];

      if (v5 || !PKHidePayLaterOptions()) {
        goto LABEL_7;
      }
    }
LABEL_9:
    BOOL v6 = 0;
    goto LABEL_10;
  }
  if (PKHideCardBenefitRewards()) {
    goto LABEL_9;
  }
LABEL_7:
  BOOL v6 = 1;
LABEL_10:

  return v6;
}

- (void)_performCatalogRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 type])
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    char v21 = 0;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3032000000;
    v18[3] = __Block_byref_object_copy__20;
    v18[4] = __Block_byref_object_dispose__20;
    id v19 = 0;
    unint64_t v8 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    objc_initWeak(&location, self);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke;
    v15[3] = &unk_1E56E2AB8;
    objc_copyWeak(&v16, &location);
    v15[4] = self;
    v15[5] = v18;
    v15[6] = v20;
    [(PKAsyncUnaryOperationComposer *)v8 addOperation:v15];
    __int16 v9 = [MEMORY[0x1E4F1CA98] null];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_137;
    v11[3] = &unk_1E56E2AE0;
    id v12 = v7;
    uint64_t v13 = v20;
    uint64_t v14 = v18;
    id v10 = [(PKAsyncUnaryOperationComposer *)v8 evaluateWithInput:v9 completion:v11];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

    _Block_object_dispose(v18, 8);
    _Block_object_dispose(v20, 8);
  }
}

void __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v11 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained _eligibleToFetchPaymentOfferCatalog])
    {
      [v11 _updateCatalogLoadingState:1];
      id v12 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Fetching Payment Offer Catalog", buf, 2u);
      }

      uint64_t v13 = *(void **)(*(void *)(a1 + 32) + 8);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_132;
      v16[3] = &unk_1E56E2A90;
      objc_copyWeak(&v22, (id *)(a1 + 56));
      uint64_t v20 = *(void *)(a1 + 40);
      id v19 = v9;
      id v14 = v8;
      uint64_t v15 = *(void *)(a1 + 32);
      id v17 = v14;
      uint64_t v18 = v15;
      uint64_t v21 = *(void *)(a1 + 48);
      [v13 updatePaymentOffersCatalogWithCompletion:v16];

      objc_destroyWeak(&v22);
    }
    else
    {
      [v11 _updateCatalogLoadingState:0];
      (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
    }
  }
}

void __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_132(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_2;
  block[3] = &unk_1E56E2A68;
  objc_copyWeak(&v19, (id *)(a1 + 72));
  id v13 = v6;
  long long v11 = *(_OWORD *)(a1 + 48);
  id v7 = (id)v11;
  long long v17 = v11;
  id v14 = *(id *)(a1 + 32);
  id v15 = v5;
  uint64_t v8 = *(void *)(a1 + 64);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v18 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v19);
}

void __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
  id v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_20;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    id v10 = WeakRetained[12];
    objc_storeStrong(v3 + 12, *(id *)(a1 + 48));
    *((unsigned char *)v3 + 104) = 1;
    [v3 _updateCatalogLoadingState:3];
    id v11 = *(id *)(a1 + 48);
    if (v10) {
      BOOL v12 = v11 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (v12)
    {
      if (v10 != v11)
      {
LABEL_16:
        id v13 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = *(void *)(a1 + 48);
          int v15 = 138412290;
          uint64_t v16 = v14;
          _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Payment Offer Catalog has changed: %@", (uint8_t *)&v15, 0xCu);
        }

        [*(id *)(a1 + 56) _printCatalogEligibilityDebugDetails];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
        [v3 _informObserversPaymentOfferCatalogChanged];
      }
    }
    else if ((objc_msgSend(v10, "isEqual:") & 1) == 0)
    {
      goto LABEL_16;
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();

    goto LABEL_20;
  }
  id v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    uint64_t v16 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Error getting payment offer catalog: %@", (uint8_t *)&v15, 0xCu);
  }

  [v3 _updateCatalogLoadingState:2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  id v9 = *(void **)(v6 + 40);
  id v7 = (id *)(v6 + 40);
  uint64_t v8 = v9;
  if (!v9) {
    uint64_t v8 = *(void **)(a1 + 32);
  }
  objc_storeStrong(v7, v8);
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_20:
}

void __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_137(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_2_138;
  block[3] = &unk_1E56DF6D0;
  id v3 = *(id *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __63__PKPaymentOffersController__performCatalogRequest_completion___block_invoke_2_138(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)_performPaymentOffersRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] == 1)
  {
    uint64_t v8 = [(PKPaymentOffersControllerRequest *)self->_currentRequest criteriaIdentifier];
    id v9 = [(PKPaymentOffersControllerRequest *)self->_currentRequest paymentPass];
    id v10 = [v9 uniqueID];
    id v11 = [(PKPaymentOffersController *)self paymentOfferCriteriaForIdentifier:v8];
    v73[0] = 0;
    v73[1] = v73;
    v73[2] = 0x3032000000;
    v73[3] = __Block_byref_object_copy__20;
    v73[4] = __Block_byref_object_dispose__20;
    if (v8)
    {
      BOOL v12 = [(NSMutableDictionary *)self->_sessionIdentifierForCriteriaIdentifier objectForKeyedSubscript:v8];
    }
    else
    {
      BOOL v12 = 0;
    }
    id v74 = v12;
    v71[0] = 0;
    v71[1] = v71;
    v71[2] = 0x3032000000;
    v71[3] = __Block_byref_object_copy__20;
    v71[4] = __Block_byref_object_dispose__20;
    id v72 = [v9 devicePrimaryPaymentApplication];
    v69[0] = 0;
    v69[1] = v69;
    v69[2] = 0x3032000000;
    v69[3] = __Block_byref_object_copy__20;
    v69[4] = __Block_byref_object_dispose__20;
    id v70 = 0;
    uint64_t v63 = 0;
    long long v64 = &v63;
    uint64_t v65 = 0x3032000000;
    long long v66 = __Block_byref_object_copy__20;
    long long v67 = __Block_byref_object_dispose__20;
    id v68 = 0;
    uint64_t v57 = 0;
    uint64_t v58 = &v57;
    uint64_t v59 = 0x3032000000;
    long long v60 = __Block_byref_object_copy__20;
    long long v61 = __Block_byref_object_dispose__20;
    id v62 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x2020000000;
    char v56 = 0;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x3032000000;
    v53[3] = __Block_byref_object_copy__20;
    v53[4] = __Block_byref_object_dispose__20;
    id v54 = 0;
    id v13 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    objc_initWeak(&location, self);
    uint64_t v14 = +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithState:1];
    [(PKPaymentOffersController *)self _updateLoadingDetailsState:v14 criteriaIdentifier:v8 passUniqueID:v10 requestType:1];

    if ([v11 type] == 1 && objc_msgSend(v11, "requiresChallenge"))
    {
      int v15 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v16 = [v15 UUIDString];
      uint64_t v17 = (void *)v58[5];
      v58[5] = v16;

      uint64_t v18 = [(id)v58[5] dataUsingEncoding:4];
      id v19 = [v18 SHA256Hash];
      uint64_t v20 = [v19 hexEncoding];
      uint64_t v21 = (void *)v64[5];
      v64[5] = v20;
    }
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x3032000000;
    v50[3] = __Block_byref_object_copy__20;
    v50[4] = __Block_byref_object_dispose__20;
    id v51 = 0;
    if (!v9)
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke;
      v48[3] = &unk_1E56E2B58;
      objc_copyWeak(&v49, &location);
      v48[4] = self;
      v48[5] = v50;
      [(PKAsyncUnaryOperationComposer *)v13 addOperation:v48];
      objc_destroyWeak(&v49);
    }
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_4;
    v32[3] = &unk_1E56E2BD0;
    objc_copyWeak(&v47, &location);
    id v22 = v11;
    id v33 = v22;
    id v23 = v8;
    id v34 = v23;
    v39 = v53;
    id v24 = v10;
    id v35 = v24;
    uint64_t v36 = self;
    id v40 = v73;
    id v41 = v71;
    id v25 = v9;
    id v37 = v25;
    v42 = v50;
    char v43 = v69;
    v44 = &v63;
    id v38 = v6;
    id v45 = &v57;
    v46 = v55;
    [(PKAsyncUnaryOperationComposer *)v13 addOperation:v32];
    uint64_t v26 = [MEMORY[0x1E4F1CA98] null];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_154;
    v28[3] = &unk_1E56E2AE0;
    id v29 = v7;
    v30 = v55;
    uint64_t v31 = v53;
    id v27 = [(PKAsyncUnaryOperationComposer *)v13 evaluateWithInput:v26 completion:v28];

    objc_destroyWeak(&v47);
    _Block_object_dispose(v50, 8);

    objc_destroyWeak(&location);
    _Block_object_dispose(v53, 8);

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(&v57, 8);

    _Block_object_dispose(&v63, 8);
    _Block_object_dispose(v69, 8);

    _Block_object_dispose(v71, 8);
    _Block_object_dispose(v73, 8);
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v11 = *(void **)(*(void *)(a1 + 32) + 160);
    if (!v11)
    {
      BOOL v12 = [PKODIServiceProviderAssessment alloc];
      uint64_t v13 = *MEMORY[0x1E4F5CB80];
      uint64_t v14 = PKPassKitCoreBundle();
      uint64_t v15 = [(PKODIServiceProviderAssessment *)v12 initWithServiceProviderIdentifier:v13 locationBundle:v14];
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v17 = *(void **)(v16 + 160);
      *(void *)(v16 + 160) = v15;

      [*(id *)(*(void *)(a1 + 32) + 160) startAssessment];
      id v11 = *(void **)(*(void *)(a1 + 32) + 160);
    }
    [v11 computeAssessment];
    uint64_t v18 = *(void **)(*(void *)(a1 + 32) + 160);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_2;
    v19[3] = &unk_1E56E2B30;
    objc_copyWeak(&v23, (id *)(a1 + 48));
    uint64_t v22 = *(void *)(a1 + 40);
    id v21 = v9;
    id v20 = v8;
    [v18 waitForAssessmentWithContinueBlock:v19];

    objc_destroyWeak(&v23);
  }
}

void __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_3;
  block[3] = &unk_1E56E2B08;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  char v14 = a3;
  id v10 = v5;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v8;
  long long v12 = v8;
  id v11 = *(id *)(a1 + 32);
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v13);
}

void __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (*(unsigned char *)(a1 + 72)) {
      [WeakRetained[20] provideSessionFeedback:2];
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(a1 + 32));
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id WeakRetained = v3;
  }
}

void __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v54 = a2;
  id v56 = a3;
  id v57 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 144));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40))
      {
        long long v8 = PKLogFacilityTypeGetObject(6uLL);
      }
      else
      {
        char v14 = [MEMORY[0x1E4F29128] UUID];
        uint64_t v15 = [v14 UUIDString];
        uint64_t v16 = *(void *)(*(void *)(a1 + 88) + 8);
        uint64_t v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;

        long long v8 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = *(void **)(a1 + 40);
          uint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
          *(_DWORD *)buf = 138412546;
          id v73 = v18;
          __int16 v74 = 2112;
          uint64_t v75 = v19;
          _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Creating a new session identifier for criteriaIdentifier %@: %@", buf, 0x16u);
        }

        [WeakRetained[6] setObject:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 40)];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = *(void **)(a1 + 40);
        uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        id v73 = v20;
        __int16 v74 = 2112;
        uint64_t v75 = v21;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Fetching Payment Offers for %@, sessionIdentifier %@", buf, 0x16u);
      }

      id v55 = *(id *)(*(void *)(a1 + 56) + 40);
      v53 = [*(id *)(a1 + 32) passTypeIdentifier];
      if (v53)
      {
        uint64_t v22 = [WeakRetained[2] context];
        id v23 = [v22 regionForIdentifier:v53];
        id v24 = [v23 paymentOffersServiceURL];
        id v25 = v24;
        if (!v24) {
          id v25 = *(void **)(*(void *)(a1 + 56) + 40);
        }
        id v26 = v25;

        id v55 = v26;
      }
      id v27 = objc_alloc_init(PKPaymentOfferWebServicePaymentOffers);
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setBaseURL:v55];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setCriteriaIdentifier:*(void *)(a1 + 40)];
      BOOL v28 = [*(id *)(a1 + 32) passSerialNumber];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setPassSerialNumber:v28];

      id v29 = [*(id *)(a1 + 32) passTypeIdentifier];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setPassTypeIdentifier:v29];

      v30 = [*(id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) dpanIdentifier];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setDpanIdentifier:v30];

      uint64_t v31 = [*(id *)(a1 + 64) primaryAccountIdentifier];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setFpanIdentifier:v31];

      v32 = [WeakRetained[21] transactionAmount];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setAmount:v32];

      id v33 = [WeakRetained[21] currencyCode];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setCurrencyCode:v33];

      id v34 = [WeakRetained[21] merchantCountryCode];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setCountryCode:v34];

      id v35 = [WeakRetained[21] supportedNetworks];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setSupportedNetworks:v35];

      -[PKPaymentOfferWebServicePaymentOffers setPayLaterSuppressionMode:](v27, "setPayLaterSuppressionMode:", [WeakRetained[21] payLaterSuppressionMode]);
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setSessionIdentifier:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
      uint64_t v36 = [WeakRetained[21] merchantIdentifier];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setMerchantIdentifier:v36];

      id v37 = [WeakRetained[21] originURL];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setOriginURL:v37];

      id v38 = [WeakRetained[21] webMerchantIdentifier];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setWebMerchantIdentifier:v38];

      v39 = [WeakRetained[21] webMerchantName];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setWebMerchantName:v39];

      id v40 = [WeakRetained[21] merchantName];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setMerchantName:v40];

      id v41 = [WeakRetained[21] adamIdentifier];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setAdamIdentifier:v41];

      [(PKPaymentOfferWebServicePaymentOffers *)v27 setFraudAssessment:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setDeviceMetadata:*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)];
      [(PKPaymentOfferWebServicePaymentOffers *)v27 setChallenge:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40)];
      -[PKPaymentOfferWebServicePaymentOffers setHandoff:](v27, "setHandoff:", [*(id *)(a1 + 72) updateReason] == 4);
      id v42 = WeakRetained[2];
      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_151;
      v58[3] = &unk_1E56E2BA8;
      objc_copyWeak(&v71, (id *)(a1 + 144));
      uint64_t v43 = *(void *)(a1 + 104);
      uint64_t v66 = *(void *)(a1 + 80);
      uint64_t v67 = v43;
      id v59 = *(id *)(a1 + 40);
      id v60 = *(id *)(a1 + 48);
      id v65 = v57;
      id v61 = v56;
      long long v68 = *(_OWORD *)(a1 + 120);
      uint64_t v69 = *(void *)(a1 + 136);
      id v44 = *(id *)(a1 + 64);
      uint64_t v45 = *(void *)(a1 + 88);
      id v62 = v44;
      uint64_t v70 = v45;
      id v46 = *(id *)(a1 + 72);
      uint64_t v47 = *(void *)(a1 + 56);
      id v63 = v46;
      uint64_t v64 = v47;
      [v42 paymentOffersWithRequest:v27 completion:v58];

      objc_destroyWeak(&v71);
    }
    else
    {
      id v55 = [NSString stringWithFormat:@"Cannot fetch payment offers for %@ since there is no criteria for that identifier", *(void *)(a1 + 40)];
      id v9 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v73 = v55;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
      id v11 = *(void **)(v10 + 40);
      if (v11)
      {
        id v12 = v11;
        id v13 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v12;
      }
      else
      {
        v48 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v76 = *MEMORY[0x1E4F28568];
        v77[0] = v55;
        id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
        uint64_t v49 = [v48 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v13];
        uint64_t v50 = *(void *)(*(void *)(a1 + 80) + 8);
        id v51 = *(void **)(v50 + 40);
        *(void *)(v50 + 40) = v49;
      }
      v52 = +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithError:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
      [WeakRetained _updateLoadingDetailsState:v52 criteriaIdentifier:*(void *)(a1 + 40) passUniqueID:*(void *)(a1 + 48) requestType:1];

      (*((void (**)(id, id, void))v57 + 2))(v57, v56, 0);
    }
  }
}

void __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_151(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_2_152;
  v13[3] = &unk_1E56E2B80;
  objc_copyWeak(&v27, (id *)(a1 + 136));
  id v14 = v6;
  long long v23 = *(_OWORD *)(a1 + 88);
  id v15 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  id v22 = *(id *)(a1 + 80);
  id v17 = *(id *)(a1 + 48);
  id v18 = v5;
  long long v24 = *(_OWORD *)(a1 + 104);
  uint64_t v25 = *(void *)(a1 + 120);
  id v7 = *(id *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 128);
  id v19 = v7;
  uint64_t v26 = v8;
  id v9 = *(id *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 72);
  id v20 = v9;
  uint64_t v21 = v10;
  id v11 = v5;
  id v12 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v13);

  objc_destroyWeak(&v27);
}

void __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_2_152(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 152));
  if (!WeakRetained) {
    goto LABEL_42;
  }
  id v3 = *(void **)(a1 + 32);
  if (!v3)
  {
    uint64_t v10 = [*(id *)(a1 + 64) assessmentCollection];
    id v11 = PKValidatePaymentOfferCollection(v10);
    if (v11)
    {
      id v12 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v35 = v11;
        _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, "Error validating the payment offer assessment %@", buf, 0xCu);
      }

      uint64_t v13 = *(void *)(*(void *)(a1 + 104) + 8);
      id v16 = *(void **)(v13 + 40);
      id v14 = (id *)(v13 + 40);
      id v15 = v16;
      if (v16) {
        id v17 = v15;
      }
      else {
        id v17 = v11;
      }
      objc_storeStrong(v14, v17);
      if (*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)) {
        [WeakRetained[20] provideSessionFeedback:1];
      }
      id v18 = +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithError:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
      [WeakRetained _updateLoadingDetailsState:v18 criteriaIdentifier:*(void *)(a1 + 40) passUniqueID:*(void *)(a1 + 48) requestType:1];

      (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
LABEL_41:

      goto LABEL_42;
    }
    uint64_t v19 = [WeakRetained preferredLocalizationLanguageForCriteriaIdentifier:*(void *)(a1 + 40)];
    id v20 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      id v35 = v21;
      __int16 v36 = 2112;
      uint64_t v37 = v19;
      _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Setting preferred language for criteriaIdentifier %@ as %@", buf, 0x16u);
    }

    id v33 = (void *)v19;
    [v10 populatePreferredLanguage:v19];
    id v22 = *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
    if (v22)
    {
      uint64_t v23 = *(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40);
      if (v23)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v35 = v22;
          __int16 v36 = 2112;
          uint64_t v37 = v23;
          _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Setting challenge on actionURL as %@ and challengeVerifier %@", buf, 0x16u);
        }

        [v10 populateChallenge:*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 40) verifier:*(void *)(*(void *)(*(void *)(a1 + 128) + 8) + 40)];
      }
    }
    long long v24 = PKPaymentOffersControllerGenerateCacheKey(*(void **)(a1 + 40), *(void **)(a1 + 48));
    uint64_t v25 = [WeakRetained[7] objectForKeyedSubscript:v24];
    [WeakRetained[7] setObject:v10 forKeyedSubscript:v24];
    uint64_t v26 = +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithState:3];
    [WeakRetained _updateLoadingDetailsState:v26 criteriaIdentifier:*(void *)(a1 + 40) passUniqueID:*(void *)(a1 + 48) requestType:1];

    if (v10 && v25)
    {
      if ([v25 isEqual:v10]) {
        goto LABEL_34;
      }
    }
    else if (v25 == v10)
    {
LABEL_34:
      if (*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)) {
        [WeakRetained[20] provideSessionFeedback:0];
      }
      BOOL v28 = [WeakRetained[22] selectedPaymentOffer];
      id v29 = [v28 selectedOfferIdentifier];

      v30 = [v10 selectedPaymentOfferWithCriteriaIdentifier:*(void *)(a1 + 40) paymentPass:*(void *)(a1 + 72) sessionIdentifier:*(void *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) previousSelectedOfferIdentifier:v29];
      if (objc_msgSend(WeakRetained[22], "updateCurrentSelectedPaymentOffer:updateReason:", v30, objc_msgSend(*(id *)(a1 + 80), "updateReason")))
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v31 = *(void **)(a1 + 40);
          uint64_t v32 = *(void *)(*(void *)(a1 + 88) + 176);
          *(_DWORD *)buf = 138412546;
          id v35 = v31;
          __int16 v36 = 2112;
          uint64_t v37 = v32;
          _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Selected Payment Offer Changed for identifier %@: %@", buf, 0x16u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = 1;
        [WeakRetained _informObserversSelectedPaymentOfferChangedForPassUniqueID:*(void *)(a1 + 48)];
      }
      (*(void (**)(void))(*(void *)(a1 + 96) + 16))();

      goto LABEL_41;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      id v35 = v27;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v10;
      _os_log_impl(&dword_190E10000, v20, OS_LOG_TYPE_DEFAULT, "Payment Offers Assessment collection has changed for identifier %@: %@", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = 1;
    [WeakRetained _informObserversPaymentOffersChangedForPassUniqueID:*(void *)(a1 + 48)];
    goto LABEL_34;
  }
  long long v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v3;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Error getting payment offers: %@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 104) + 8);
  uint64_t v8 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  id v7 = v8;
  if (!v8) {
    id v7 = *(void **)(a1 + 32);
  }
  objc_storeStrong(v6, v7);
  if (*(void *)(*(void *)(*(void *)(a1 + 112) + 8) + 40)) {
    [WeakRetained[20] provideSessionFeedback:1];
  }
  id v9 = +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithError:*(void *)(*(void *)(*(void *)(a1 + 104) + 8) + 40)];
  [WeakRetained _updateLoadingDetailsState:v9 criteriaIdentifier:*(void *)(a1 + 40) passUniqueID:*(void *)(a1 + 48) requestType:1];

  (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
LABEL_42:
}

void __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_154(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_2_155;
  block[3] = &unk_1E56DF6D0;
  id v3 = *(id *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __69__PKPaymentOffersController__performPaymentOffersRequest_completion___block_invoke_2_155(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)_performDynamicContentRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] == 2)
  {
    uint64_t v8 = [(PKPaymentOffersControllerRequest *)self->_currentRequest criteriaIdentifier];
    id v9 = [(PKPaymentOffersControllerRequest *)self->_currentRequest dynamicPageTypes];
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    char v31 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = __Block_byref_object_copy__20;
    void v28[4] = __Block_byref_object_dispose__20;
    id v29 = 0;
    uint64_t v10 = objc_alloc_init(PKAsyncUnaryOperationComposer);
    objc_initWeak(&location, self);
    id v11 = +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithState:1];
    [(PKPaymentOffersController *)self _updateLoadingDetailsState:v11 criteriaIdentifier:v8 passUniqueID:0 requestType:2];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke;
    void v20[3] = &unk_1E56E2C48;
    objc_copyWeak(&v26, &location);
    id v12 = v8;
    id v21 = v12;
    long long v24 = v28;
    id v13 = v9;
    id v22 = v13;
    uint64_t v23 = self;
    uint64_t v25 = v30;
    [(PKAsyncUnaryOperationComposer *)v10 addOperation:v20];
    id v14 = [MEMORY[0x1E4F1CA98] null];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_162;
    v16[3] = &unk_1E56E2AE0;
    id v17 = v7;
    id v18 = v30;
    uint64_t v19 = v28;
    id v15 = [(PKAsyncUnaryOperationComposer *)v10 evaluateWithInput:v14 completion:v16];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(v30, 8);
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

void __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  id v35 = a3;
  id v36 = a4;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained)
  {
    uint64_t v8 = *(void **)(a1 + 32);
    if (v8)
    {
      id v9 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        id v46 = v8;
        __int16 v47 = 2112;
        uint64_t v48 = v10;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Fetching Payment Offer Dynamic Content for %@, pageTypes %@", buf, 0x16u);
      }

      id v11 = *(id *)(*(void *)(a1 + 48) + 40);
      id v12 = [*(id *)(*(void *)(a1 + 48) + 88) paymentPass];
      id v13 = [v12 passTypeIdentifier];

      if (v13)
      {
        id v14 = [WeakRetained[2] context];
        id v15 = [v14 regionForIdentifier:v13];
        id v16 = [v15 paymentOffersServiceURL];
        id v17 = v16;
        if (!v16) {
          id v17 = *(void **)(*(void *)(a1 + 48) + 40);
        }
        id v18 = v17;

        id v11 = v18;
      }
      uint64_t v19 = objc_alloc_init(PKPaymentOfferWebServiceDynamicContentRequest);
      [(PKPaymentOfferWebServiceDynamicContentRequest *)v19 setBaseURL:v11];
      [(PKPaymentOfferWebServiceDynamicContentRequest *)v19 setCriteriaIdentifier:*(void *)(a1 + 32)];
      id v20 = [*(id *)(a1 + 40) allObjects];
      [(PKPaymentOfferWebServiceDynamicContentRequest *)v19 setTypes:v20];

      id v21 = WeakRetained[2];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_160;
      v37[3] = &unk_1E56E2C20;
      objc_copyWeak(&v44, (id *)(a1 + 72));
      uint64_t v42 = *(void *)(a1 + 56);
      id v38 = *(id *)(a1 + 32);
      id v41 = v36;
      id v39 = v35;
      id v22 = *(id *)(a1 + 40);
      uint64_t v23 = *(void *)(a1 + 64);
      id v40 = v22;
      uint64_t v43 = v23;
      [v21 paymentOffersDynamicContentWithRequest:v19 completion:v37];

      objc_destroyWeak(&v44);
    }
    else
    {
      id v11 = [NSString stringWithFormat:@"Cannot fetch payment offer dynamic content %@ since there is no criteria for that identifier", 0];
      long long v24 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v11;
        _os_log_impl(&dword_190E10000, v24, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      }

      uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
      id v26 = *(void **)(v25 + 40);
      if (v26)
      {
        id v27 = v26;
        BOOL v28 = *(void **)(v25 + 40);
        *(void *)(v25 + 40) = v27;
      }
      else
      {
        id v29 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v49 = *MEMORY[0x1E4F28568];
        v50[0] = v11;
        BOOL v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:&v49 count:1];
        uint64_t v30 = [v29 errorWithDomain:@"PKPassKitErrorDomain" code:-1 userInfo:v28];
        uint64_t v31 = *(void *)(*(void *)(a1 + 56) + 8);
        uint64_t v32 = *(void **)(v31 + 40);
        *(void *)(v31 + 40) = v30;
      }
      id v33 = +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithError:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
      [WeakRetained _updateLoadingDetailsState:v33 criteriaIdentifier:*(void *)(a1 + 32) passUniqueID:0 requestType:2];

      (*((void (**)(id, id, void))v36 + 2))(v36, v35, 0);
    }
  }
}

void __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_160(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_2;
  block[3] = &unk_1E56E2BF8;
  objc_copyWeak(&v19, (id *)(a1 + 80));
  uint64_t v7 = *(void *)(a1 + 64);
  id v11 = v6;
  uint64_t v17 = v7;
  id v12 = *(id *)(a1 + 32);
  id v16 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = v5;
  uint64_t v18 = *(void *)(a1 + 72);
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v19);
}

void __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 96));
  id v3 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_37;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Error getting payment offer dynamic content: %@", buf, 0xCu);
    }

    uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
    id v9 = *(void **)(v6 + 40);
    uint64_t v7 = (id *)(v6 + 40);
    id v8 = v9;
    if (!v9) {
      id v8 = *(void **)(a1 + 32);
    }
    objc_storeStrong(v7, v8);
    uint64_t v10 = +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithError:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];
    [v3 _updateLoadingDetailsState:v10 criteriaIdentifier:*(void *)(a1 + 40) passUniqueID:0 requestType:2];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
    goto LABEL_37;
  }
  id v11 = [WeakRetained[16] objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v3[16] setObject:v11 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  id v29 = v3;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v12 = *(id *)(a1 + 56);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
        uint64_t v18 = [v11 objectForKeyedSubscript:v17];
        id v19 = [*(id *)(a1 + 64) dynamicContent];
        id v20 = objc_msgSend(v19, "dynamicContentPageForPageType:", objc_msgSend(v17, "integerValue"));

        if (v20) {
          BOOL v21 = 1;
        }
        else {
          BOOL v21 = v18 == 0;
        }
        if (v21)
        {
          if (v18) {
            BOOL v22 = v20 == 0;
          }
          else {
            BOOL v22 = 1;
          }
          if (v22)
          {
            if (v18 == v20) {
              goto LABEL_27;
            }
LABEL_26:
            *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
            uint64_t v23 = [v29[16] objectForKeyedSubscript:*(void *)(a1 + 40)];
            [v23 setObject:v20 forKeyedSubscript:v17];

            goto LABEL_27;
          }
          char v24 = [v18 isEqual:v20];
          if ((v24 & 1) == 0) {
            goto LABEL_26;
          }
        }
LABEL_27:

        ++v16;
      }
      while (v14 != v16);
      uint64_t v25 = [v12 countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v14 = v25;
    }
    while (v25);
  }

  id v26 = +[PKPaymentOffersControllerLoadingDetails loadingDetailsWithState:3];
  id v3 = v29;
  [v29 _updateLoadingDetailsState:v26 criteriaIdentifier:*(void *)(a1 + 40) passUniqueID:0 requestType:2];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    id v27 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = v28;
      _os_log_impl(&dword_190E10000, v27, OS_LOG_TYPE_DEFAULT, "Payment Offer dynamic content changed for criteriaIdentifier %@", buf, 0xCu);
    }

    [v29 _informObserversPaymentOfferDynamicContentChanged];
  }
  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();

LABEL_37:
}

void __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_162(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_2_163;
  block[3] = &unk_1E56DF6D0;
  id v3 = *(id *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __70__PKPaymentOffersController__performDynamicContentRequest_completion___block_invoke_2_163(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)_fetchDeviceMetadataFields:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  uint64_t v7 = [(PKPaymentWebService *)self->_paymentWebService targetDevice];
  if (objc_opt_respondsToSelector())
  {
    paymentWebService = self->_paymentWebService;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __67__PKPaymentOffersController__fetchDeviceMetadataFields_completion___block_invoke;
    v9[3] = &unk_1E56E2C98;
    objc_copyWeak(&v11, &location);
    id v10 = v6;
    [v7 paymentWebService:paymentWebService deviceMetadataWithFields:a3 completion:v9];

    objc_destroyWeak(&v11);
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }

  objc_destroyWeak(&location);
}

void __67__PKPaymentOffersController__fetchDeviceMetadataFields_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PKPaymentOffersController__fetchDeviceMetadataFields_completion___block_invoke_2;
  block[3] = &unk_1E56E2C70;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __67__PKPaymentOffersController__fetchDeviceMetadataFields_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

- (id)_criteriaEligibilityConfigurationForCriteria:(id)a3
{
  uint64_t v4 = [a3 type];
  if (v4 == 2)
  {
    uint64_t v13 = [PKPaymentOfferRewardsCriteriaEligibilityConfiguration alloc];
    id v6 = [(PKPaymentOffersControllerConfiguration *)self->_configuration transactionAmount];
    id v7 = [(PKPaymentOffersControllerConfiguration *)self->_configuration currencyCode];
    id v12 = [(PKPaymentOfferRewardsCriteriaEligibilityConfiguration *)v13 initWithAmount:v6 currencyCode:v7 options:[(PKPaymentOffersControllerConfiguration *)self->_configuration options]];
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    id v5 = [PKPaymentOfferInstallmentCriteriaEligibilityConfiguration alloc];
    id v6 = [(PKPaymentOffersControllerConfiguration *)self->_configuration transactionAmount];
    id v7 = [(PKPaymentOffersControllerConfiguration *)self->_configuration currencyCode];
    id v8 = [(PKPaymentOffersControllerConfiguration *)self->_configuration merchantCountryCode];
    id v9 = [(PKPaymentWebService *)self->_paymentWebService targetDevice];
    id v10 = [v9 deviceRegion];
    id v11 = [(PKPaymentOffersControllerConfiguration *)self->_configuration supportedNetworks];
    id v12 = [(PKPaymentOfferInstallmentCriteriaEligibilityConfiguration *)v5 initWithAmount:v6 currencyCode:v7 merchantCountryCode:v8 deviceRegion:v10 supportedNetworks:v11 merchantCapabilities:[(PKPaymentOffersControllerConfiguration *)self->_configuration merchantCapabilities] payLaterSuppressionMode:[(PKPaymentOffersControllerConfiguration *)self->_configuration payLaterSuppressionMode] options:[(PKPaymentOffersControllerConfiguration *)self->_configuration options]];

LABEL_5:
    goto LABEL_7;
  }
  id v12 = 0;
LABEL_7:
  return v12;
}

- (void)_printCatalogEligibilityDebugDetails
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Payment offer catalog eligibility debug details:", buf, 2u);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [(PKPaymentOfferCatalog *)self->_catalog catalog];
  uint64_t v4 = [obj countByEnumeratingWithState:&v24 objects:v38 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v25;
    *(void *)&long long v5 = 138413314;
    long long v20 = v5;
    do
    {
      uint64_t v8 = 0;
      uint64_t v21 = v6;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        id v10 = -[PKPaymentOffersController _criteriaEligibilityConfigurationForCriteria:](self, "_criteriaEligibilityConfigurationForCriteria:", v9, v20);
        unint64_t v23 = 0;
        int v11 = [v9 eligibleWithConfiguration:v10 ineligibleReason:&v23];
        BOOL v12 = [(PKPaymentOffersController *)self _paymentOfferCriteriaToKeep:v9];
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = [v9 identifier];
          uint64_t v14 = [v9 associatedPassUniqueID];
          uint64_t v15 = v7;
          if (v11) {
            uint64_t v16 = @"YES";
          }
          else {
            uint64_t v16 = @"NO";
          }
          uint64_t v17 = PKPaymentOfferCriteriaIneligibleReasonToString(v23);
          uint64_t v18 = (void *)v17;
          *(_DWORD *)buf = v20;
          id v19 = @"NO";
          if (!v12) {
            id v19 = @"YES";
          }
          id v29 = v13;
          __int16 v30 = 2112;
          long long v31 = v14;
          __int16 v32 = 2112;
          long long v33 = v16;
          uint64_t v7 = v15;
          uint64_t v6 = v21;
          __int16 v34 = 2112;
          uint64_t v35 = v17;
          __int16 v36 = 2112;
          uint64_t v37 = v19;
          _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PaymentOfferID: %@, passUniqueID: %@, eligibility: %@ ineligibleReason: %@, filteredFromUI: %@", buf, 0x34u);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v38 count:16];
    }
    while (v6);
  }
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
    long long v5 = [(NSHashTable *)self->_observers allObjects];
    os_unfair_lock_unlock(&self->_lockObservers);
    replyQueue = self->_replyQueue;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __57__PKPaymentOffersController__accessObserversWithHandler___block_invoke;
    v8[3] = &unk_1E56D8A18;
    id v9 = v5;
    id v10 = v4;
    id v7 = v5;
    dispatch_async(replyQueue, v8);
  }
}

void __57__PKPaymentOffersController__accessObserversWithHandler___block_invoke(uint64_t a1)
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

- (void)_informObserversPaymentOfferCatalogChanged
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __71__PKPaymentOffersController__informObserversPaymentOfferCatalogChanged__block_invoke;
  v2[3] = &unk_1E56E2CC0;
  v2[4] = self;
  [(PKPaymentOffersController *)self _accessObserversWithHandler:v2];
}

void __71__PKPaymentOffersController__informObserversPaymentOfferCatalogChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentOfferCatalogChanged:*(void *)(a1 + 32)];
  }
}

- (void)_informObserversPaymentOffersChangedForPassUniqueID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__PKPaymentOffersController__informObserversPaymentOffersChangedForPassUniqueID___block_invoke;
  v6[3] = &unk_1E56E2CE8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentOffersController *)self _accessObserversWithHandler:v6];
}

void __81__PKPaymentOffersController__informObserversPaymentOffersChangedForPassUniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentOffersChanged:*(void *)(a1 + 32) forPassUniqueIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)_informObserversSelectedPaymentOfferChangedForPassUniqueID:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __88__PKPaymentOffersController__informObserversSelectedPaymentOfferChangedForPassUniqueID___block_invoke;
  v6[3] = &unk_1E56E2CE8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKPaymentOffersController *)self _accessObserversWithHandler:v6];
}

void __88__PKPaymentOffersController__informObserversSelectedPaymentOfferChangedForPassUniqueID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 selectedPaymentOfferChanged:*(void *)(a1 + 32) forPassUniqueIdentifier:*(void *)(a1 + 40)];
  }
}

- (void)_informObserversPaymentOfferDynamicContentChanged
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __78__PKPaymentOffersController__informObserversPaymentOfferDynamicContentChanged__block_invoke;
  v2[3] = &unk_1E56E2CC0;
  v2[4] = self;
  [(PKPaymentOffersController *)self _accessObserversWithHandler:v2];
}

void __78__PKPaymentOffersController__informObserversPaymentOfferDynamicContentChanged__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 paymentOfferDynamicContentChanged:*(void *)(a1 + 32)];
  }
}

- (void)updatePaymentRedeemableRewardsBalanceWithPassUniqueIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  long long v8 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Fetching Payment Rewards Balances", buf, 2u);
  }

  paymentService = self->_paymentService;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__PKPaymentOffersController_updatePaymentRedeemableRewardsBalanceWithPassUniqueIdentifier_completion___block_invoke;
  v11[3] = &unk_1E56E2D38;
  objc_copyWeak(&v13, &location);
  id v10 = v7;
  void v11[4] = self;
  id v12 = v10;
  [(PKPaymentService *)paymentService updatePaymentRewardsBalancesWithPassUniqueIdentifier:v6 completion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __102__PKPaymentOffersController_updatePaymentRedeemableRewardsBalanceWithPassUniqueIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__PKPaymentOffersController_updatePaymentRedeemableRewardsBalanceWithPassUniqueIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E56E2D10;
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v11 = v5;
  id v12 = v6;
  id v13 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v14);
}

void __102__PKPaymentOffersController_updatePaymentRedeemableRewardsBalanceWithPassUniqueIdentifier_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3)
    {
      id v5 = WeakRetained;
      id v4 = [*(id *)(a1 + 32) _redeemablePaymentRewardsBalanceFrom:*(void *)(a1 + 40)];
      (*(void (**)(uint64_t, void *, void))(v3 + 16))(v3, v4, *(void *)(a1 + 48));

      id WeakRetained = v5;
    }
  }
}

- (id)paymentRedeemableRewardsBalanceWithPassUniqueIdentifier:(id)a3
{
  id v4 = [(PKPaymentService *)self->_paymentService paymentRewardsBalancesWithPassUniqueIdentifier:a3];
  id v5 = [(PKPaymentOffersController *)self _redeemablePaymentRewardsBalanceFrom:v4];

  return v5;
}

- (id)_redeemablePaymentRewardsBalanceFrom:(id)a3
{
  return (id)objc_msgSend(a3, "pk_firstObjectPassingTest:", &__block_literal_global_187);
}

BOOL __66__PKPaymentOffersController__redeemablePaymentRewardsBalanceFrom___block_invoke(uint64_t a1, void *a2)
{
  return [a2 eligibility] == 1;
}

- (PKPaymentOffersControllerConfiguration)configuration
{
  return self->_configuration;
}

- (PKPaymentOffersControllerSelectedOfferDetails)selectedOfferDetails
{
  return self->_selectedOfferDetails;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedOfferDetails, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_paymentOffersODISession, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_dynamicContentPagesByCriteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_requestLoadingDetails, 0);
  objc_storeStrong((id *)&self->_catalog, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_queuedRequests, 0);
  objc_storeStrong((id *)&self->_preferredLanguageForCriteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_languageDisclosuresSeenForCriteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_paymentOffersForCriteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifierForCriteriaIdentifier, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_paymentWebService, 0);
  objc_storeStrong((id *)&self->_paymentService, 0);
}

@end