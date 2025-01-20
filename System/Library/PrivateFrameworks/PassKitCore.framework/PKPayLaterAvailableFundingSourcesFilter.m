@interface PKPayLaterAvailableFundingSourcesFilter
- (PKPayLaterAvailableFundingSourcesFilter)initWithPassLibrary:(id)a3 peerPaymentAccount:(id)a4 defaultPassUniqueIdentifier:(id)a5;
- (PKPeerPaymentAccount)peerPaymentAccount;
- (id)_availableFundingSourcesForSupportedRepaymentTypes:(unint64_t)a3 supportedRepaymentCountries:(id)a4 supportedRepaymentNetworks:(id)a5 eligibleBankSources:(id)a6 lastUsedFundingSources:(id)a7 installmentAmount:(id)a8;
- (id)_filterLastUsedFundingSources:(id)a3 paymentSources:(id)a4;
- (id)_filterPrePaidPaymentApplicationsIfNecessaryFromSources:(id)a3;
- (id)_payLaterPassPaymentSourcesForPasses:(id)a3;
- (id)_sortPaymentSources:(id)a3;
- (id)availableFundingSourcesForFinancingOption:(id)a3 eligibleBankSources:(id)a4 lastUsedFundingSources:(id)a5;
- (id)availableFundingSourcesForPaymentIntentDetails:(id)a3 currencyAmount:(id)a4 planIdentifier:(id)a5 primaryPaymentSource:(id)a6;
- (void)_addAccountPaymentSourcesToPaymentSourcesIfNecessary:(id)a3 supportedRepaymentTypes:(unint64_t)a4 eligibleBankSources:(id)a5;
- (void)_assignPrioritiesToPaymentSources:(id)a3 lastUsedFundingSources:(id)a4;
- (void)_filterCashPassIfNecessaryFromPasses:(id)a3 supportedRepaymentTypes:(unint64_t)a4 installmentAmount:(id)a5;
- (void)_prioritizePaymentSource:(id)a3 inPaymentSources:(id)a4;
- (void)clearCache;
- (void)setPeerPaymentAccount:(id)a3;
@end

@implementation PKPayLaterAvailableFundingSourcesFilter

- (PKPayLaterAvailableFundingSourcesFilter)initWithPassLibrary:(id)a3 peerPaymentAccount:(id)a4 defaultPassUniqueIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterAvailableFundingSourcesFilter;
  v12 = [(PKPayLaterAvailableFundingSourcesFilter *)&v16 init];
  if (v12)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    availableFundingSources = v12->_availableFundingSources;
    v12->_availableFundingSources = v13;

    objc_storeStrong((id *)&v12->_peerPaymentAccount, a4);
    objc_storeStrong((id *)&v12->_passLibrary, a3);
    objc_storeStrong((id *)&v12->_defaultPassUniqueIdentifier, a5);
  }

  return v12;
}

- (id)availableFundingSourcesForFinancingOption:(id)a3 eligibleBankSources:(id)a4 lastUsedFundingSources:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 identifier];
  v12 = v11;
  if (v8 && [v11 length])
  {
    v13 = [(NSMutableDictionary *)self->_availableFundingSources objectForKey:v12];
    if ([v13 count])
    {
      id v14 = v13;
    }
    else
    {
      v15 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v26 = (uint64_t)v12;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Looking up available funding sources for option %@", buf, 0xCu);
      }

      objc_super v16 = [v8 installmentAmount];
      v17 = [v16 currencyAmount];

      uint64_t v18 = [v8 supportedRepaymentTypes];
      v19 = [v8 supportedRepaymentNetworks];
      v24 = [v8 supportedRepaymentCountries];
      -[PKPayLaterAvailableFundingSourcesFilter _availableFundingSourcesForSupportedRepaymentTypes:supportedRepaymentCountries:supportedRepaymentNetworks:eligibleBankSources:lastUsedFundingSources:installmentAmount:](self, "_availableFundingSourcesForSupportedRepaymentTypes:supportedRepaymentCountries:supportedRepaymentNetworks:eligibleBankSources:lastUsedFundingSources:installmentAmount:", v18);
      id v14 = (id)objc_claimAutoreleasedReturnValue();
      [(NSMutableDictionary *)self->_availableFundingSources setObject:v14 forKey:v12];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v20 = [v14 count];
        [v8 identifier];
        v21 = v23 = v17;
        *(_DWORD *)buf = 134218242;
        uint64_t v26 = v20;
        __int16 v27 = 2112;
        v28 = v21;
        _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "Found %ld available funding sources for financing option %@", buf, 0x16u);

        v17 = v23;
      }
    }
  }
  else
  {
    id v14 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

- (void)clearCache
{
}

- (id)availableFundingSourcesForPaymentIntentDetails:(id)a3 currencyAmount:(id)a4 planIdentifier:(id)a5 primaryPaymentSource:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v26 = a6;
  v13 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v28 = (uint64_t)v12;
    _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Looking up available funding sources for planIdentifier %@", buf, 0xCu);
  }

  id v14 = v11;
  uint64_t v15 = [v10 supportedRepaymentTypes];
  uint64_t v16 = [v10 supportedRepaymentNetworks];
  v17 = [v10 bankAcceptedFundingSources];
  uint64_t v18 = [v10 supportedRepaymentCountries];
  v19 = [v10 lastUsedFundingSources];
  v25 = (void *)v16;
  [(PKPayLaterAvailableFundingSourcesFilter *)self _availableFundingSourcesForSupportedRepaymentTypes:v15 supportedRepaymentCountries:v18 supportedRepaymentNetworks:v16 eligibleBankSources:v17 lastUsedFundingSources:v19 installmentAmount:v14];
  v21 = uint64_t v20 = v12;
  v22 = (void *)[v21 mutableCopy];

  [(PKPayLaterAvailableFundingSourcesFilter *)self _prioritizePaymentSource:v26 inPaymentSources:v22];
  [(NSMutableDictionary *)self->_availableFundingSources setObject:v22 forKey:v20];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v23 = [v22 count];
    *(_DWORD *)buf = 134218242;
    uint64_t v28 = v23;
    __int16 v29 = 2112;
    v30 = v20;
    _os_log_impl(&dword_190E10000, v13, OS_LOG_TYPE_DEFAULT, "Found %ld available funding sources for planIdentifier %@", buf, 0x16u);
  }

  return v22;
}

- (id)_availableFundingSourcesForSupportedRepaymentTypes:(unint64_t)a3 supportedRepaymentCountries:(id)a4 supportedRepaymentNetworks:(id)a5 eligibleBankSources:(id)a6 lastUsedFundingSources:(id)a7 installmentAmount:(id)a8
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = (void *)MEMORY[0x1E4F1CBF0];
  if (a3)
  {
    id v15 = a8;
    id v16 = a7;
    id v17 = a6;
    id v18 = a5;
    id v19 = a4;
    uint64_t v20 = objc_alloc_init(PKPaymentRequest);
    [(PKPaymentRequest *)v20 setMerchantCapabilities:(__rbit32(a3) >> 28) & 0xC];
    [(PKPaymentRequest *)v20 setSupportedNetworks:v18];

    [(PKPaymentRequest *)v20 setSupportedCountries:v19];
    v21 = [(PKPassLibrary *)self->_passLibrary inAppPaymentPassesForPaymentRequest:v20];
    v22 = [v21 allObjects];
    uint64_t v23 = (void *)[v22 mutableCopy];

    [(PKPayLaterAvailableFundingSourcesFilter *)self _filterCashPassIfNecessaryFromPasses:v23 supportedRepaymentTypes:a3 installmentAmount:v15];
    v24 = [(PKPayLaterAvailableFundingSourcesFilter *)self _payLaterPassPaymentSourcesForPasses:v23];
    v25 = [(PKPayLaterAvailableFundingSourcesFilter *)self _filterPrePaidPaymentApplicationsIfNecessaryFromSources:v24];

    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(PKPayLaterAvailableFundingSourcesFilter *)self _addAccountPaymentSourcesToPaymentSourcesIfNecessary:v26 supportedRepaymentTypes:a3 eligibleBankSources:v17];

    [v26 addObjectsFromArray:v25];
    __int16 v27 = [(PKPayLaterAvailableFundingSourcesFilter *)self _filterLastUsedFundingSources:v16 paymentSources:v26];

    uint64_t v28 = (void *)[v26 copy];
    [(PKPayLaterAvailableFundingSourcesFilter *)self _assignPrioritiesToPaymentSources:v28 lastUsedFundingSources:v27];
    uint64_t v29 = [(PKPayLaterAvailableFundingSourcesFilter *)self _sortPaymentSources:v28];
    v30 = (void *)v29;
    if (v29) {
      uint64_t v31 = (void *)v29;
    }
    else {
      uint64_t v31 = v8;
    }
    id v32 = v31;

    v33 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      int v35 = 138412290;
      id v36 = v32;
      _os_log_impl(&dword_190E10000, v33, OS_LOG_TYPE_DEFAULT, "Sorted available payment sources %@", (uint8_t *)&v35, 0xCu);
    }

    id v8 = (void *)[v32 copy];
  }
  return v8;
}

- (void)_filterCashPassIfNecessaryFromPasses:(id)a3 supportedRepaymentTypes:(unint64_t)a4 installmentAmount:(id)a5
{
  char v5 = a4;
  id v7 = a3;
  id v8 = [(PKPeerPaymentAccount *)self->_peerPaymentAccount associatedPassUniqueID];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __122__PKPayLaterAvailableFundingSourcesFilter__filterCashPassIfNecessaryFromPasses_supportedRepaymentTypes_installmentAmount___block_invoke;
  v19[3] = &unk_1E56DF970;
  id v9 = v8;
  id v20 = v9;
  uint64_t v10 = [v7 indexOfObjectPassingTest:v19];
  uint64_t v11 = v10;
  if ((v5 & 4) != 0 && v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v12 = [(PKPassLibrary *)self->_passLibrary passWithUniqueID:v9];
    v13 = [v12 paymentPass];

    id v14 = [v13 devicePrimaryPaymentApplication];
    uint64_t v15 = [v14 state];

    if (v15 == 1)
    {
      id v16 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v18 = 0;
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Adding apple cash card as a repayment method", v18, 2u);
      }

      [v7 safelyAddObject:v13];
    }
  }
  else if ((v5 & 4) == 0 && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v17 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_190E10000, v17, OS_LOG_TYPE_DEFAULT, "Filtering out apple cash card as a financing option repayment method", v18, 2u);
    }

    [v7 removeObjectAtIndex:v11];
  }
}

uint64_t __122__PKPayLaterAvailableFundingSourcesFilter__filterCashPassIfNecessaryFromPasses_supportedRepaymentTypes_installmentAmount___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueID];
  v4 = *(void **)(a1 + 32);
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
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

- (id)_filterPrePaidPaymentApplicationsIfNecessaryFromSources:(id)a3
{
  return (id)objc_msgSend(a3, "pk_objectsPassingTest:", &__block_literal_global_35);
}

BOOL __99__PKPayLaterAvailableFundingSourcesFilter__filterPrePaidPaymentApplicationsIfNecessaryFromSources___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 paymentApplication];
  BOOL v3 = [v2 fundingSourcePaymentType] != 3;

  return v3;
}

- (id)_payLaterPassPaymentSourcesForPasses:(id)a3
{
  return (id)objc_msgSend(a3, "pk_arrayByApplyingBlock:", &__block_literal_global_28_0);
}

PKPayLaterPassPaymentSource *__80__PKPayLaterAvailableFundingSourcesFilter__payLaterPassPaymentSourcesForPasses___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  BOOL v3 = [v2 devicePrimaryPaymentApplication];
  v4 = [[PKPayLaterPassPaymentSource alloc] initWithPaymentPass:v2 paymentApplication:v3];

  return v4;
}

- (void)_addAccountPaymentSourcesToPaymentSourcesIfNecessary:(id)a3 supportedRepaymentTypes:(unint64_t)a4 eligibleBankSources:(id)a5
{
  if ((a4 & 8) != 0) {
    [a3 addObjectsFromArray:a5];
  }
}

- (void)_assignPrioritiesToPaymentSources:(id)a3 lastUsedFundingSources:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 firstObject];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __100__PKPayLaterAvailableFundingSourcesFilter__assignPrioritiesToPaymentSources_lastUsedFundingSources___block_invoke;
  aBlock[3] = &unk_1E56DF9B8;
  id v27 = v6;
  id v36 = v27;
  v30 = (unsigned int (**)(void *, id, uint64_t))_Block_copy(aBlock);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    id v28 = v7;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        uint64_t v13 = [v12 type];
        if (v13 == 2)
        {
          id v15 = v12;
          id v19 = [v15 accountPaymentFundingSource];
          id v14 = [v19 identifier];

          if (v30[2](v30, v14, 8)) {
            uint64_t v20 = 1000;
          }
          else {
            uint64_t v20 = 800;
          }
          [v15 setPriority:v20];
          goto LABEL_29;
        }
        if (v13 != 1) {
          continue;
        }
        id v14 = v12;
        id v15 = [v14 paymentPass];
        id v16 = [v15 uniqueID];
        id v17 = [v15 primaryAccountIdentifier];
        if ((((uint64_t (*)(void *, void *, uint64_t))v30[2])(v30, v17, 1) & 1) == 0)
        {
          defaultPassUniqueIdentifier = self->_defaultPassUniqueIdentifier;
          v22 = v16;
          uint64_t v23 = defaultPassUniqueIdentifier;
          if (v22 == v23)
          {

            goto LABEL_23;
          }
          v24 = v23;
          if (v22) {
            BOOL v25 = v23 == 0;
          }
          else {
            BOOL v25 = 1;
          }
          if (v25)
          {
          }
          else
          {
            BOOL v26 = [(NSString *)v22 isEqualToString:v23];

            if (v26)
            {
LABEL_23:
              uint64_t v18 = 600;
LABEL_27:
              id v7 = v28;
              goto LABEL_28;
            }
          }
          if ([v15 hasAssociatedPeerPaymentAccount]) {
            uint64_t v18 = 400;
          }
          else {
            uint64_t v18 = 200;
          }
          goto LABEL_27;
        }
        uint64_t v18 = 1000;
LABEL_28:
        [v14 setPriority:v18];

LABEL_29:
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v9);
  }
}

uint64_t __100__PKPayLaterAvailableFundingSourcesFilter__assignPrioritiesToPaymentSources_lastUsedFundingSources___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  if (v6 && [v6 type] == a3)
  {
    id v7 = [*(id *)(a1 + 32) identifier];
    id v8 = v5;
    uint64_t v9 = v8;
    if (v7 == v8)
    {
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = 0;
      if (v8 && v7) {
        uint64_t v10 = [v7 isEqualToString:v8];
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)_filterLastUsedFundingSources:(id)a3 paymentSources:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v5;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Last used funding sources before filter: %@", buf, 0xCu);
  }
  oslog = v7;

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __88__PKPayLaterAvailableFundingSourcesFilter__filterLastUsedFundingSources_paymentSources___block_invoke;
        v18[3] = &unk_1E56DF9E0;
        v18[4] = v14;
        if (objc_msgSend(v6, "pk_containsObjectPassingTest:", v18, oslog)) {
          [v8 addObject:v14];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v8;
    _os_log_impl(&dword_190E10000, oslog, OS_LOG_TYPE_DEFAULT, "Last used funding sources after filter: %@", buf, 0xCu);
  }

  id v15 = (void *)[v8 copy];
  return v15;
}

uint64_t __88__PKPayLaterAvailableFundingSourcesFilter__filterLastUsedFundingSources_paymentSources___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 type];
  if (v4 == 2)
  {
    uint64_t v12 = [v3 identifier];
    uint64_t v13 = [*(id *)(a1 + 32) identifier];
    id v10 = v12;
    id v14 = v13;
    if (v10 == v14)
    {
      uint64_t v11 = 1;
      id v8 = v10;
    }
    else
    {
      id v8 = v14;
      uint64_t v11 = 0;
      if (v10 && v14) {
        uint64_t v11 = [v10 isEqualToString:v14];
      }
    }
    id v5 = v10;
    goto LABEL_16;
  }
  if (v4 == 1)
  {
    id v5 = [v3 paymentPass];
    id v6 = [v5 primaryAccountIdentifier];
    id v7 = [*(id *)(a1 + 32) identifier];
    id v8 = v6;
    id v9 = v7;
    id v10 = v9;
    if (v8 == v9)
    {
      uint64_t v11 = 1;
    }
    else
    {
      uint64_t v11 = 0;
      if (v8 && v9) {
        uint64_t v11 = [v8 isEqualToString:v9];
      }
    }

LABEL_16:
    goto LABEL_17;
  }
  uint64_t v11 = 0;
LABEL_17:

  return v11;
}

- (void)_prioritizePaymentSource:(id)a3 inPaymentSources:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __85__PKPayLaterAvailableFundingSourcesFilter__prioritizePaymentSource_inPaymentSources___block_invoke;
    v10[3] = &unk_1E56DFA08;
    id v11 = v5;
    uint64_t v7 = [v6 indexOfObjectPassingTest:v10];
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = v7;
      id v9 = [v6 objectAtIndexedSubscript:v7];
      [v6 removeObjectAtIndex:v8];
      [v6 insertObject:v9 atIndex:0];
    }
  }
}

uint64_t __85__PKPayLaterAvailableFundingSourcesFilter__prioritizePaymentSource_inPaymentSources___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 32) identifier];
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {

    goto LABEL_7;
  }
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    char v9 = [v6 isEqualToString:v7];

    if (v9) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  uint64_t v11 = [*(id *)(a1 + 32) type];
  if (v11 != [v3 type] || objc_msgSend(*(id *)(a1 + 32), "type") != 1) {
    goto LABEL_25;
  }
  uint64_t v12 = *(void **)(a1 + 32);
  id v13 = v3;
  id v14 = v12;
  id v15 = [v13 paymentPass];
  id v16 = [v13 paymentApplication];
  id v17 = [v14 paymentPass];
  uint64_t v18 = [v14 paymentApplication];

  long long v19 = [v15 primaryAccountIdentifier];
  long long v20 = [v17 primaryAccountIdentifier];
  id v21 = v19;
  id v22 = v20;
  if (v21 == v22) {
    goto LABEL_22;
  }
  uint64_t v23 = v22;
  if (v21 && v22)
  {
    char v24 = [v21 isEqualToString:v22];

    if (v24) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  id v25 = [v16 dpanIdentifier];
  uint64_t v26 = [v18 dpanIdentifier];
  id v21 = v25;
  id v27 = v26;
  if (v21 == v27)
  {
LABEL_22:

LABEL_23:
    goto LABEL_7;
  }
  id v28 = v27;
  if (!v21 || !v27)
  {

LABEL_25:
    uint64_t v10 = 0;
    goto LABEL_26;
  }
  char v29 = [v21 isEqualToString:v27];

  if ((v29 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_7:
  uint64_t v10 = 1;
LABEL_26:

  return v10;
}

- (id)_sortPaymentSources:(id)a3
{
  return (id)[a3 sortedArrayUsingSelector:sel_compare_];
}

- (void)setPeerPaymentAccount:(id)a3
{
  objc_storeStrong((id *)&self->_peerPaymentAccount, a3);
  [(PKPayLaterAvailableFundingSourcesFilter *)self clearCache];
}

- (PKPeerPaymentAccount)peerPaymentAccount
{
  return self->_peerPaymentAccount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerPaymentAccount, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_defaultPassUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_availableFundingSources, 0);
}

@end