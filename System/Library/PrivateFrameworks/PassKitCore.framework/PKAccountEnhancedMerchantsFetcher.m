@interface PKAccountEnhancedMerchantsFetcher
- (BOOL)dataIsWithinThresholdForCooldownLevel:(unint64_t)a3;
- (PKAccountEnhancedMerchantsFetcher)initWithAccountIdentifier:(id)a3 accountService:(id)a4;
- (id)_enhancedMerchantBehaviorCopy;
- (id)_lastUpdateCopy;
- (id)addUpdateHandler:(id)a3;
- (id)enhancedMerchantMatchingPaymentIdentifier:(id)a3;
- (id)enhancedMerchants;
- (id)enhancedMerchantsWithOrderingContext:(unint64_t)a3;
- (void)_executeWithLock:(id)a3;
- (void)_reloadDataIncludeOrderings:(BOOL)a3 includeBehavior:(BOOL)a4 includeMerchants:(BOOL)a5 completion:(id)a6;
- (void)_setLastUpdate:(id)a3;
- (void)_triggerUpdateHandlers;
- (void)dealloc;
- (void)didUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 lastUpdate:(id)a5;
- (void)reloadDataWithCompletion:(id)a3;
- (void)removeUpdateHandler:(id)a3;
- (void)setItems:(id)a3;
- (void)updateDataWithCooldownLevel:(unint64_t)a3 ignoreErrorBackoff:(BOOL)a4 completion:(id)a5;
@end

@implementation PKAccountEnhancedMerchantsFetcher

- (PKAccountEnhancedMerchantsFetcher)initWithAccountIdentifier:(id)a3 accountService:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKAccountEnhancedMerchantsFetcher;
  v9 = [(PKAccountEnhancedMerchantsFetcher *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountIdentifier, a3);
    objc_storeStrong((id *)&v10->_accountService, a4);
    uint64_t v11 = [MEMORY[0x1E4F1C978] array];
    items = v10->_items;
    v10->_items = (NSArray *)v11;

    orderings = v10->_orderings;
    v10->_orderings = 0;

    v14 = objc_alloc_init(PKAccountEnhancedMerchantBehavior);
    behavior = v10->_behavior;
    v10->_behavior = v14;

    lastUpdate = v10->_lastUpdate;
    v10->_lastUpdate = 0;

    v10->_itemsLock._os_unfair_lock_opaque = 0;
    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    tokenToUpdateHandlerMap = v10->_tokenToUpdateHandlerMap;
    v10->_tokenToUpdateHandlerMap = (NSMutableDictionary *)v17;

    v10->_updateHandlersLock._os_unfair_lock_opaque = 0;
    [(PKAccountService *)v10->_accountService registerObserver:v10];
  }

  return v10;
}

- (void)dealloc
{
  [(PKAccountService *)self->_accountService unregisterObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)PKAccountEnhancedMerchantsFetcher;
  [(PKAccountEnhancedMerchantsFetcher *)&v3 dealloc];
}

- (void)reloadDataWithCompletion:(id)a3
{
}

- (void)_reloadDataIncludeOrderings:(BOOL)a3 includeBehavior:(BOOL)a4 includeMerchants:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v10 = a6;
  uint64_t v11 = v10;
  if (v10 && !v6 && !v7 && !v8) {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
  }
  v12 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  objc_initWeak(&location, self);
  if (v8)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke;
    v22[3] = &unk_1E56E5CB0;
    objc_copyWeak(&v23, &location);
    [(PKAsyncUnaryOperationComposer *)v12 addOperation:v22];
    objc_destroyWeak(&v23);
  }
  if (v7)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_4;
    v20[3] = &unk_1E56E5CB0;
    objc_copyWeak(&v21, &location);
    [(PKAsyncUnaryOperationComposer *)v12 addOperation:v20];
    objc_destroyWeak(&v21);
  }
  if (v6)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_7;
    v18[3] = &unk_1E56E5CB0;
    objc_copyWeak(&v19, &location);
    [(PKAsyncUnaryOperationComposer *)v12 addOperation:v18];
    objc_destroyWeak(&v19);
  }
  v13 = [MEMORY[0x1E4F1CA98] null];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_9;
  v16[3] = &unk_1E56E3B10;
  id v14 = v11;
  id v17 = v14;
  id v15 = [(PKAsyncUnaryOperationComposer *)v12 evaluateWithInput:v13 completion:v16];

  objc_destroyWeak(&location);
}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (id *)(a1 + 32);
  WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v14 = WeakRetained[1];
    v13 = (void *)WeakRetained[2];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_2;
    v15[3] = &unk_1E56F0C50;
    objc_copyWeak(&v18, v10);
    id v17 = v9;
    id v16 = v8;
    [v13 accountEntityOrderingsForAccountWithIdentifier:v14 entityType:1 completion:v15];

    objc_destroyWeak(&v18);
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }
}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_3;
    v8[3] = &unk_1E56D8A90;
    v8[4] = WeakRetained;
    id v9 = v3;
    [v5 _executeWithLock:v8];
    (*(void (**)(void, void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, v6, v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_3(uint64_t a1)
{
}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (id *)(a1 + 32);
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v14 = WeakRetained[1];
    v13 = (void *)WeakRetained[2];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_5;
    v15[3] = &unk_1E56F0C78;
    objc_copyWeak(&v18, v10);
    id v17 = v9;
    id v16 = v8;
    [v13 accountEnhancedMerchantBehaviorForAccountWithIdentifier:v14 completion:v15];

    objc_destroyWeak(&v18);
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }
}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_6;
    v8[3] = &unk_1E56D8A90;
    v8[4] = WeakRetained;
    id v9 = v3;
    [v5 _executeWithLock:v8];
    (*(void (**)(void, void, void, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0, v6, v7);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_6(uint64_t a1)
{
  v2 = *(PKAccountEnhancedMerchantBehavior **)(a1 + 40);
  id v3 = v2;
  if (!v2) {
    id v3 = objc_alloc_init(PKAccountEnhancedMerchantBehavior);
  }
  v4 = v3;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), v3);
  if (!v2)
  {
  }
}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (id *)(a1 + 32);
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v14 = WeakRetained[1];
    v13 = (void *)WeakRetained[2];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_8;
    v15[3] = &unk_1E56F0C50;
    objc_copyWeak(&v18, v10);
    id v17 = v9;
    id v16 = v8;
    [v13 accountEnhancedMerchantsForAccountWithIdentifier:v14 completion:v15];

    objc_destroyWeak(&v18);
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v9 + 2))(v9, v8, 1);
  }
}

void __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setItems:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __109__PKAccountEnhancedMerchantsFetcher__reloadDataIncludeOrderings_includeBehavior_includeMerchants_completion___block_invoke_9(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  [a4 isCanceled];
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)updateDataWithCooldownLevel:(unint64_t)a3 ignoreErrorBackoff:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, uint64_t))a5;
  BOOL v9 = [(PKAccountEnhancedMerchantsFetcher *)self dataIsWithinThresholdForCooldownLevel:a3];
  id v10 = PKLogFacilityTypeGetObject(0xEuLL);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v21 = a3;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Account enhanced merchants were updated within the specified time interval (level %ld), returning existing data", buf, 0xCu);
    }

    if (v8) {
      v8[2](v8, 1);
    }
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v21 = a3;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Updating account enhanced merchants to within cooldown level %ld", buf, 0xCu);
    }

    v12 = [(PKAccountEnhancedMerchantsFetcher *)self _enhancedMerchantBehaviorCopy];
    objc_initWeak((id *)buf, self);
    accountIdentifier = self->_accountIdentifier;
    accountService = self->_accountService;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __95__PKAccountEnhancedMerchantsFetcher_updateDataWithCooldownLevel_ignoreErrorBackoff_completion___block_invoke;
    v16[3] = &unk_1E56F0CC8;
    id v18 = v8;
    objc_copyWeak(v19, (id *)buf);
    v19[1] = (id)a3;
    id v15 = v12;
    id v17 = v15;
    [(PKAccountService *)accountService updateAccountEnhancedMerchantsForAccountWithIdentifier:accountIdentifier ignoreErrorBackoff:v5 cooldownLevel:a3 completion:v16];

    objc_destroyWeak(v19);
    objc_destroyWeak((id *)buf);
  }
}

void __95__PKAccountEnhancedMerchantsFetcher_updateDataWithCooldownLevel_ignoreErrorBackoff_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = PKLogFacilityTypeGetObject(0xEuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Account enhanced merchant update failed: %@", buf, 0xCu);
    }

    uint64_t v11 = *(void *)(a1 + 40);
    if (v11) {
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (!WeakRetained)
    {
      uint64_t v13 = *(void *)(a1 + 40);
      if (v13) {
        (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
      }
    }
    [WeakRetained setItems:v7];
    [WeakRetained _setLastUpdate:v9];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __95__PKAccountEnhancedMerchantsFetcher_updateDataWithCooldownLevel_ignoreErrorBackoff_completion___block_invoke_21;
    v16[3] = &unk_1E56F0CA0;
    id v14 = v9;
    uint64_t v15 = *(void *)(a1 + 56);
    id v17 = v14;
    uint64_t v20 = v15;
    id v18 = *(id *)(a1 + 32);
    id v19 = *(id *)(a1 + 40);
    [WeakRetained _reloadDataIncludeOrderings:1 includeBehavior:1 includeMerchants:0 completion:v16];
  }
}

uint64_t __95__PKAccountEnhancedMerchantsFetcher_updateDataWithCooldownLevel_ignoreErrorBackoff_completion___block_invoke_21(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = DateIsWithinThresholdForCooldownLevel(*(void **)(a1 + 32), *(void *)(a1 + 56), *(void **)(a1 + 40));
  id v3 = PKLogFacilityTypeGetObject(0xEuLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 56);
      int v9 = 134217984;
      uint64_t v10 = v5;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Successfully updated account enhanced merchants to within cooldown level %ld", (uint8_t *)&v9, 0xCu);
    }

    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      id v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v8 = *(void *)(a1 + 56);
      int v9 = 134217984;
      uint64_t v10 = v8;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Account enhanced merchants not updated to within provided cooldown level of %ld", (uint8_t *)&v9, 0xCu);
    }

    uint64_t result = *(void *)(a1 + 48);
    if (result)
    {
      id v7 = *(uint64_t (**)(void))(result + 16);
      return v7();
    }
  }
  return result;
}

- (BOOL)dataIsWithinThresholdForCooldownLevel:(unint64_t)a3
{
  uint64_t v5 = [(PKAccountEnhancedMerchantsFetcher *)self _lastUpdateCopy];
  uint64_t v6 = [(PKAccountEnhancedMerchantsFetcher *)self _enhancedMerchantBehaviorCopy];
  LOBYTE(a3) = DateIsWithinThresholdForCooldownLevel(v5, a3, v6);

  return a3;
}

- (id)enhancedMerchants
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  BOOL v4 = (void *)[(NSArray *)self->_items copy];
  os_unfair_lock_unlock(p_itemsLock);
  return v4;
}

- (id)enhancedMerchantsWithOrderingContext:(unint64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = [(PKAccountEnhancedMerchantsFetcher *)self enhancedMerchants];
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    p_itemsLock = &self->_itemsLock;
    os_unfair_lock_lock(&self->_itemsLock);
    orderings = self->_orderings;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __74__PKAccountEnhancedMerchantsFetcher_enhancedMerchantsWithOrderingContext___block_invoke;
    v26[3] = &__block_descriptor_40_e33_B16__0__PKAccountEntityOrdering_8l;
    v26[4] = a3;
    int v9 = [(NSArray *)orderings pk_firstObjectPassingTest:v26];
    uint64_t v10 = (void *)[v9 copy];
    os_unfair_lock_unlock(p_itemsLock);
    if (v10)
    {
      uint64_t v20 = v10;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      uint64_t v11 = [v10 ordering];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            v21[0] = MEMORY[0x1E4F143A8];
            v21[1] = 3221225472;
            v21[2] = __74__PKAccountEnhancedMerchantsFetcher_enhancedMerchantsWithOrderingContext___block_invoke_2;
            v21[3] = &unk_1E56F0D10;
            v21[4] = v16;
            id v17 = objc_msgSend(v5, "pk_firstObjectPassingTest:", v21);
            [v6 safelyAddObject:v17];
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      id v18 = (void *)[v6 copy];
      uint64_t v10 = v20;
    }
    else
    {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }
  return v18;
}

BOOL __74__PKAccountEnhancedMerchantsFetcher_enhancedMerchantsWithOrderingContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  return v2 == [a2 context];
}

uint64_t __74__PKAccountEnhancedMerchantsFetcher_enhancedMerchantsWithOrderingContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 privateIdentifier];
  id v4 = v2;
  id v5 = v3;
  uint64_t v6 = v5;
  if (v4 == v5)
  {
    uint64_t v8 = 1;
  }
  else
  {
    if (v4) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = [v4 isEqualToString:v5];
    }
  }

  return v8;
}

- (id)enhancedMerchantMatchingPaymentIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(PKAccountEnhancedMerchantsFetcher *)self enhancedMerchants];
    uint64_t v6 = [v4 lowercaseString];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __79__PKAccountEnhancedMerchantsFetcher_enhancedMerchantMatchingPaymentIdentifier___block_invoke;
    v9[3] = &unk_1E56F0D10;
    id v4 = v6;
    id v10 = v4;
    BOOL v7 = objc_msgSend(v5, "pk_firstObjectPassingTest:", v9);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

uint64_t __79__PKAccountEnhancedMerchantsFetcher_enhancedMerchantMatchingPaymentIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 hashedPaymentIdentifiers];
  if ([v4 containsObject:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v6 = [v3 paymentIdentifiers];
    uint64_t v5 = [v6 containsObject:*(void *)(a1 + 32)];
  }
  return v5;
}

- (id)_enhancedMerchantBehaviorCopy
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  id v4 = (void *)[(PKAccountEnhancedMerchantBehavior *)self->_behavior copy];
  os_unfair_lock_unlock(p_itemsLock);
  return v4;
}

- (id)_lastUpdateCopy
{
  p_itemsLock = &self->_itemsLock;
  os_unfair_lock_lock(&self->_itemsLock);
  id v4 = (void *)[(NSDate *)self->_lastUpdate copy];
  os_unfair_lock_unlock(p_itemsLock);
  return v4;
}

- (void)setItems:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PKAccountEnhancedMerchantsFetcher_setItems___block_invoke;
  v6[3] = &unk_1E56D8A90;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKAccountEnhancedMerchantsFetcher *)self _executeWithLock:v6];
}

void __46__PKAccountEnhancedMerchantsFetcher_setItems___block_invoke(uint64_t a1)
{
}

- (void)_setLastUpdate:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PKAccountEnhancedMerchantsFetcher__setLastUpdate___block_invoke;
  v6[3] = &unk_1E56D8A90;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKAccountEnhancedMerchantsFetcher *)self _executeWithLock:v6];
}

void __52__PKAccountEnhancedMerchantsFetcher__setLastUpdate___block_invoke(uint64_t a1)
{
}

- (void)_executeWithLock:(id)a3
{
  if (a3)
  {
    p_itemsLock = &self->_itemsLock;
    id v4 = (void (**)(void))a3;
    os_unfair_lock_lock(p_itemsLock);
    v4[2](v4);

    os_unfair_lock_unlock(p_itemsLock);
  }
}

- (id)addUpdateHandler:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29128];
  id v5 = a3;
  uint64_t v6 = [v4 UUID];
  p_updateHandlersLock = &self->_updateHandlersLock;
  os_unfair_lock_lock(&self->_updateHandlersLock);
  tokenToUpdateHandlerMap = self->_tokenToUpdateHandlerMap;
  int v9 = _Block_copy(v5);

  [(NSMutableDictionary *)tokenToUpdateHandlerMap setObject:v9 forKey:v6];
  os_unfair_lock_unlock(p_updateHandlersLock);
  return v6;
}

- (void)removeUpdateHandler:(id)a3
{
  p_updateHandlersLock = &self->_updateHandlersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_updateHandlersLock);
  [(NSMutableDictionary *)self->_tokenToUpdateHandlerMap removeObjectForKey:v5];

  os_unfair_lock_unlock(p_updateHandlersLock);
}

- (void)_triggerUpdateHandlers
{
  p_updateHandlersLock = &self->_updateHandlersLock;
  os_unfair_lock_lock(&self->_updateHandlersLock);
  [(NSMutableDictionary *)self->_tokenToUpdateHandlerMap enumerateKeysAndObjectsUsingBlock:&__block_literal_global_181];
  os_unfair_lock_unlock(p_updateHandlersLock);
}

void __59__PKAccountEnhancedMerchantsFetcher__triggerUpdateHandlers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PKAccountEnhancedMerchantsFetcher__triggerUpdateHandlers__block_invoke_2;
  block[3] = &unk_1E56D8360;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __59__PKAccountEnhancedMerchantsFetcher__triggerUpdateHandlers__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)didUpdateAccountEnhancedMerchants:(id)a3 accountIdentifier:(id)a4 lastUpdate:(id)a5
{
  id v15 = a3;
  id v8 = a4;
  id v9 = a5;
  accountIdentifier = self->_accountIdentifier;
  uint64_t v11 = (NSString *)v8;
  uint64_t v12 = accountIdentifier;
  if (v12 == v11)
  {

    goto LABEL_7;
  }
  uint64_t v13 = v12;
  if (!v11 || !v12)
  {

    goto LABEL_9;
  }
  BOOL v14 = [(NSString *)v11 isEqualToString:v12];

  if (v14)
  {
LABEL_7:
    [(PKAccountEnhancedMerchantsFetcher *)self setItems:v15];
    [(PKAccountEnhancedMerchantsFetcher *)self _setLastUpdate:v9];
    [(PKAccountEnhancedMerchantsFetcher *)self _triggerUpdateHandlers];
  }
LABEL_9:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenToUpdateHandlerMap, 0);
  objc_storeStrong((id *)&self->_lastUpdate, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_orderings, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_accountService, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

@end