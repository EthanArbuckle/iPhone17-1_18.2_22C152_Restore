@interface PKDashboardTransactionFetcher
- (BOOL)_containsFrequentTransactionType:(id)a3;
- (BOOL)allowSynchronousFetch;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSSet)counterpartHandles;
- (PKDashboardTransactionFetcher)initWithCounterpartHandles:(id)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5;
- (PKDashboardTransactionFetcher)initWithInstallmentPlan:(id)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5;
- (PKDashboardTransactionFetcher)initWithMerchant:(id)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5;
- (PKDashboardTransactionFetcher)initWithMerchantCategory:(int64_t)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5;
- (PKDashboardTransactionFetcher)initWithRegions:(id)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5;
- (PKDashboardTransactionFetcher)initWithTransactionSourceCollection:(id)a3 paymentDataProvider:(id)a4;
- (PKDashboardTransactionFetcher)initWithTransactionType:(int64_t)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5;
- (PKDashboardTransactionFetcherDelegate)delegate;
- (PKPaymentDataProvider)paymentDataProvider;
- (PKPaymentPass)cashbackPass;
- (PKTransactionSourceCollection)cashbackTransactionSourceCollection;
- (id)_feeTotalForTransaction:(id)a3;
- (id)_sortedTransactions:(id)a3 ascending:(BOOL)a4 limit:(unint64_t)a5;
- (id)_transactionRequestForCurrentFilters;
- (id)_transactionSourceIdentifiers;
- (id)cashbackGroupForDateComponents:(id)a3 cashbackTransactionSourceCollection:(id *)a4;
- (id)cashbackGroupForTransactionWithIdentifier:(id)a3 cashbackTransactionSourceCollection:(id *)a4;
- (id)instantWithdrawalFeesTransactionGroups;
- (unint64_t)limit;
- (unint64_t)type;
- (void)_addCashbackTransactions:(id)a3 currentMonthOnly:(BOOL)a4 completion:(id)a5;
- (void)_addInstantWidthdrawalTransactionsWithCompletion:(id)a3;
- (void)_commonSetup;
- (void)_processPaymentPassTransactionsWithTransactions:(id)a3 currentMonthOnly:(BOOL)a4 sendTransactionsBlock:(id)a5;
- (void)_sendUpdatedTransactions;
- (void)didRemoveTransactionsWithSourceIdentifierMapping:(id)a3;
- (void)filterAmount:(id)a3 comparison:(int64_t)a4;
- (void)filterCategory:(int64_t)a3;
- (void)filterDisputesOnly:(BOOL)a3;
- (void)filterMerchant:(id)a3;
- (void)filterPeerPaymentPaymentMode:(unint64_t)a3;
- (void)filterPeerPaymentSubType:(int64_t)a3;
- (void)filterRegions:(id)a3;
- (void)filterRewardsValue:(id)a3 unit:(unint64_t)a4;
- (void)filterSources:(id)a3;
- (void)filterStatuses:(id)a3;
- (void)filterTags:(id)a3;
- (void)filterTransactionSourceIdentifiers:(id)a3;
- (void)filterTypes:(id)a3;
- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4;
- (void)peerPaymentCounterpartHandlesForTransactionSourceIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6;
- (void)reloadTransactionsWithCompletion:(id)a3;
- (void)setAllowSynchronousFetch:(BOOL)a3;
- (void)setCashbackPass:(id)a3;
- (void)setCashbackTransactionSourceCollection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLimit:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5;
- (void)transactionCountByPeriod:(unint64_t)a3 withCompletion:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4;
- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4;
@end

@implementation PKDashboardTransactionFetcher

- (PKDashboardTransactionFetcher)initWithTransactionSourceCollection:(id)a3 paymentDataProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKDashboardTransactionFetcher;
  v9 = [(PKDashboardTransactionFetcher *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transactionSourceCollection, a3);
    v10->_type = 0;
    objc_storeStrong((id *)&v10->_paymentDataProvider, a4);
    [(PKDashboardTransactionFetcher *)v10 _commonSetup];
  }

  return v10;
}

- (PKDashboardTransactionFetcher)initWithMerchant:(id)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKDashboardTransactionFetcher;
  objc_super v12 = [(PKDashboardTransactionFetcher *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_merchant, a3);
    objc_storeStrong((id *)&v13->_transactionSourceCollection, a4);
    v13->_type = 1;
    objc_storeStrong((id *)&v13->_paymentDataProvider, a5);
    [(PKDashboardTransactionFetcher *)v13 _commonSetup];
  }

  return v13;
}

- (PKDashboardTransactionFetcher)initWithCounterpartHandles:(id)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKDashboardTransactionFetcher;
  id v11 = [(PKDashboardTransactionFetcher *)&v15 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    counterpartHandles = v11->_counterpartHandles;
    v11->_counterpartHandles = (NSSet *)v12;

    objc_storeStrong((id *)&v11->_transactionSourceCollection, a4);
    v11->_type = 2;
    objc_storeStrong((id *)&v11->_paymentDataProvider, a5);
    [(PKDashboardTransactionFetcher *)v11 _commonSetup];
  }

  return v11;
}

- (PKDashboardTransactionFetcher)initWithMerchantCategory:(int64_t)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKDashboardTransactionFetcher;
  id v11 = [(PKDashboardTransactionFetcher *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_merchantCategory = a3;
    objc_storeStrong((id *)&v11->_transactionSourceCollection, a4);
    v12->_type = 3;
    objc_storeStrong((id *)&v12->_paymentDataProvider, a5);
    [(PKDashboardTransactionFetcher *)v12 _commonSetup];
  }

  return v12;
}

- (PKDashboardTransactionFetcher)initWithTransactionType:(int64_t)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKDashboardTransactionFetcher;
  id v11 = [(PKDashboardTransactionFetcher *)&v14 init];
  uint64_t v12 = v11;
  if (v11)
  {
    v11->_transactionType = a3;
    objc_storeStrong((id *)&v11->_transactionSourceCollection, a4);
    v12->_type = 4;
    objc_storeStrong((id *)&v12->_paymentDataProvider, a5);
    [(PKDashboardTransactionFetcher *)v12 _commonSetup];
  }

  return v12;
}

- (PKDashboardTransactionFetcher)initWithInstallmentPlan:(id)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKDashboardTransactionFetcher;
  uint64_t v12 = [(PKDashboardTransactionFetcher *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_installmentPlan, a3);
    objc_storeStrong((id *)&v13->_transactionSourceCollection, a4);
    v13->_type = 5;
    objc_storeStrong((id *)&v13->_paymentDataProvider, a5);
    [(PKDashboardTransactionFetcher *)v13 _commonSetup];
  }

  return v13;
}

- (PKDashboardTransactionFetcher)initWithRegions:(id)a3 transactionSourceCollection:(id)a4 paymentDataProvider:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKDashboardTransactionFetcher;
  uint64_t v12 = [(PKDashboardTransactionFetcher *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_regions, a3);
    objc_storeStrong((id *)&v13->_transactionSourceCollection, a4);
    v13->_type = 6;
    objc_storeStrong((id *)&v13->_paymentDataProvider, a5);
    [(PKDashboardTransactionFetcher *)v13 _commonSetup];
  }

  return v13;
}

- (void)_commonSetup
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  self->_lockUpdate._os_unfair_lock_opaque = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSources];
  uint64_t v3 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v8 = [v7 paymentPass];
        id v9 = [v7 account];
        id v10 = [v8 devicePrimaryPaymentApplication];
        uint64_t v11 = [v10 paymentNetworkIdentifier];

        uint64_t v12 = [v7 type];
        if ((unint64_t)(v12 - 2) >= 2)
        {
          if (v12 == 1)
          {
            self->_needsInstantWithdrawalFees = 1;
LABEL_20:
            if ((unint64_t)(v11 - 103) >= 0x24) {
              unint64_t v16 = 10;
            }
            else {
              unint64_t v16 = qword_191674EB0[v11 - 103];
            }
            goto LABEL_23;
          }
          if (v12) {
            goto LABEL_24;
          }
          int v13 = [v8 hasAssociatedPeerPaymentAccount];
          objc_super v14 = [v8 associatedAccountServiceAccountIdentifier];
          if (v14) {
            char v15 = 1;
          }
          else {
            char v15 = v13;
          }

          if (v13)
          {
            self->_needsCashbackUniqueID = 1;
            self->_needsInstantWithdrawalFees = 1;
            self->_cashBackType = 1;
          }
          if ((v15 & 1) == 0) {
            goto LABEL_20;
          }
LABEL_18:
          unint64_t v16 = 0;
          goto LABEL_23;
        }
        if ([v9 type] != 4) {
          goto LABEL_18;
        }
        unint64_t v16 = 0;
        self->_needsCashbackUniqueID = 1;
        self->_cashBackType = 3;
LABEL_23:
        self->_limit = v16;
LABEL_24:
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v4);
  }

  paymentDataProvider = self->_paymentDataProvider;
  if (!paymentDataProvider)
  {
    v18 = objc_alloc_init(PKPaymentDefaultDataProvider);
    v19 = self->_paymentDataProvider;
    self->_paymentDataProvider = (PKPaymentDataProvider *)v18;

    paymentDataProvider = self->_paymentDataProvider;
  }
  [(PKPaymentDataProvider *)paymentDataProvider addDelegate:self];
}

- (void)setLimit:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8 = (NSDate *)a4;
  id v9 = (NSDate *)a5;
  self->_limit = a3;
  startDate = self->_startDate;
  self->_startDate = v8;
  uint64_t v12 = v8;

  endDate = self->_endDate;
  self->_endDate = v9;
}

- (void)filterMerchant:(id)a3
{
}

- (void)filterCategory:(int64_t)a3
{
  self->_merchantCategory = a3;
}

- (void)filterRegions:(id)a3
{
}

- (void)filterTags:(id)a3
{
}

- (void)filterTypes:(id)a3
{
}

- (void)filterSources:(id)a3
{
}

- (void)filterStatuses:(id)a3
{
}

- (void)filterAmount:(id)a3 comparison:(int64_t)a4
{
  self->_amountComparison = a4;
}

- (void)filterRewardsValue:(id)a3 unit:(unint64_t)a4
{
  self->_rewardsValueUnit = a4;
}

- (void)filterPeerPaymentSubType:(int64_t)a3
{
  self->_subType = a3;
}

- (void)filterPeerPaymentPaymentMode:(unint64_t)a3
{
  self->_peerPaymentPaymentMode = a3;
}

- (void)filterTransactionSourceIdentifiers:(id)a3
{
}

- (void)filterDisputesOnly:(BOOL)a3
{
  self->_filterDisputesOnly = a3;
}

- (id)_transactionSourceIdentifiers
{
  filteredTransactionSourceIdentifiers = self->_filteredTransactionSourceIdentifiers;
  if (filteredTransactionSourceIdentifiers)
  {
    uint64_t v3 = filteredTransactionSourceIdentifiers;
  }
  else
  {
    uint64_t v3 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourceIdentifiers];
  }
  return v3;
}

- (void)reloadTransactionsWithCompletion:(id)a3
{
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x2020000000;
    v88[3] = self->_limit;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke;
    aBlock[3] = &unk_1E56ED660;
    aBlock[4] = self;
    v87 = v88;
    id v7 = v5;
    id v86 = v7;
    id v8 = _Block_copy(aBlock);
    id v9 = [(PKDashboardTransactionFetcher *)self _transactionSourceIdentifiers];
    switch(self->_type)
    {
      case 0uLL:
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_30;
          }
          paymentDataProvider = self->_paymentDataProvider;
          startDate = self->_startDate;
          endDate = self->_endDate;
          unint64_t limit = self->_limit;
          v78[0] = MEMORY[0x1E4F143A8];
          v78[1] = 3221225472;
          v78[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_8;
          v78[3] = &unk_1E56D8748;
          v78[4] = self;
          id v79 = v8;
          [(PKPaymentDataProvider *)paymentDataProvider transactionsForTransactionSourceIdentifiers:v9 withTransactionSource:0 withBackingData:1 startDate:startDate endDate:endDate limit:limit completion:v78];
          v17 = v79;
          break;
        }
        id v10 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
        unint64_t v11 = [v10 associatedAccountFeatureIdentifier];
        unint64_t v12 = v11;
        if (v11 <= 4 && ((1 << v11) & 0x16) != 0)
        {
          BOOL v13 = 1;
        }
        else
        {
          uint64_t v3 = [v10 devicePrimaryContactlessPaymentApplication];
          uint64_t v47 = [v3 paymentNetworkIdentifier];
          BOOL v13 = v47 == 129 || v47 == 138;
        }
        if (v12 > 4 || ((1 << v12) & 0x16) == 0) {

        }
        if ([(NSArray *)self->_types count]) {
          BOOL v49 = [(PKDashboardTransactionFetcher *)self _containsFrequentTransactionType:self->_types];
        }
        else {
          BOOL v49 = 1;
        }
        if (self->_startDate)
        {
          uint64_t v50 = 0;
        }
        else
        {
          if (self->_endDate) {
            BOOL v51 = 0;
          }
          else {
            BOOL v51 = v49;
          }
          uint64_t v50 = v51 & v13;
        }
        v52 = [(PKDashboardTransactionFetcher *)self _transactionRequestForCurrentFilters];
        unint64_t v53 = [v52 limit];
        if (v50)
        {
          v54 = [MEMORY[0x1E4F1C9C8] date];
          v55 = PKStartOfMonth(v54);
          [v52 setStartDate:v55];

          v56 = PKStartOfNextMonth(v54);
          [v52 setEndDate:v56];
        }
        v57 = self->_paymentDataProvider;
        if (self->_allowSynchronousFetch && v53 && v53 <= 0xA)
        {
          v58 = [(PKPaymentDataProvider *)self->_paymentDataProvider transactionsForRequest:v52];
          v59 = [MEMORY[0x1E4F1CAD0] setWithArray:v58];
          [(PKDashboardTransactionFetcher *)self _processPaymentPassTransactionsWithTransactions:v59 currentMonthOnly:v50 sendTransactionsBlock:v8];
        }
        else
        {
          v80[0] = MEMORY[0x1E4F143A8];
          v80[1] = 3221225472;
          v80[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_2;
          v80[3] = &unk_1E56ED6B0;
          char v84 = v50;
          v80[4] = self;
          v83 = v88;
          id v81 = v52;
          id v82 = v8;
          [(PKPaymentDataProvider *)v57 transactionsForRequest:v81 completion:v80];
        }
        goto LABEL_32;
      case 1uLL:
        if (![(PKMerchant *)self->_merchant hasMapsMatch]
          || [(PKMerchant *)self->_merchant useRawMerchantData])
        {
          uint64_t v26 = [(PKMerchant *)self->_merchant name];
          if (v26)
          {
          }
          else
          {
            v40 = [(PKMerchant *)self->_merchant rawName];

            if (!v40) {
              goto LABEL_30;
            }
          }
        }
        char v41 = objc_opt_respondsToSelector();
        v42 = self->_paymentDataProvider;
        if (v41)
        {
          v43 = [(PKDashboardTransactionFetcher *)self _transactionRequestForCurrentFilters];
          v76[0] = MEMORY[0x1E4F143A8];
          v76[1] = 3221225472;
          v76[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_11;
          v76[3] = &unk_1E56D9100;
          id v77 = v7;
          [(PKPaymentDataProvider *)v42 transactionsForRequest:v43 completion:v76];

          v17 = v77;
          break;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_30;
        }
        v44 = self->_paymentDataProvider;
        merchant = self->_merchant;
        unint64_t v46 = self->_limit;
        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_13;
        v74[3] = &unk_1E56E4710;
        id v75 = v8;
        [(PKPaymentDataProvider *)v44 transactionsForTransactionSourceIdentifiers:v9 matchingMerchant:merchant withTransactionSource:0 withBackingData:1 limit:v46 completion:v74];
        v17 = v75;
        break;
      case 2uLL:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_30;
        }
        objc_super v14 = self->_paymentDataProvider;
        counterpartHandles = self->_counterpartHandles;
        unint64_t v16 = self->_limit;
        v72[0] = MEMORY[0x1E4F143A8];
        v72[1] = 3221225472;
        v72[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_15;
        v72[3] = &unk_1E56E4710;
        id v73 = v8;
        [(PKPaymentDataProvider *)v14 transactionsForTransactionSourceIdentifiers:v9 withPeerPaymentCounterpartHandles:counterpartHandles withTransactionSource:0 withBackingData:1 limit:v16 completion:v72];
        v17 = v73;
        break;
      case 3uLL:
        char v18 = objc_opt_respondsToSelector();
        v19 = self->_paymentDataProvider;
        if (v18)
        {
          v20 = [(PKDashboardTransactionFetcher *)self _transactionRequestForCurrentFilters];
          v70[0] = MEMORY[0x1E4F143A8];
          v70[1] = 3221225472;
          v70[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_17;
          v70[3] = &unk_1E56D9100;
          id v71 = v7;
          [(PKPaymentDataProvider *)v19 transactionsForRequest:v20 completion:v70];

          v17 = v71;
        }
        else if (objc_opt_respondsToSelector())
        {
          v31 = self->_paymentDataProvider;
          int64_t merchantCategory = self->_merchantCategory;
          v33 = self->_startDate;
          v34 = self->_endDate;
          unint64_t v35 = self->_limit;
          v68[0] = MEMORY[0x1E4F143A8];
          v68[1] = 3221225472;
          v68[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_19;
          v68[3] = &unk_1E56E4710;
          id v69 = v8;
          [(PKPaymentDataProvider *)v31 transactionsForTransactionSourceIdentifiers:v9 withMerchantCategory:merchantCategory withTransactionSource:0 withBackingData:1 startDate:v33 endDate:v34 limit:v35 completion:v68];
          v17 = v69;
        }
        else
        {
LABEL_30:
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_27;
          block[3] = &unk_1E56D8360;
          id v61 = v7;
          dispatch_async(MEMORY[0x1E4F14428], block);
          v17 = v61;
        }
        break;
      case 4uLL:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_30;
        }
        long long v21 = self->_paymentDataProvider;
        int64_t transactionType = self->_transactionType;
        long long v23 = self->_startDate;
        long long v24 = self->_endDate;
        unint64_t v25 = self->_limit;
        v66[0] = MEMORY[0x1E4F143A8];
        v66[1] = 3221225472;
        v66[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_21;
        v66[3] = &unk_1E56E4710;
        id v67 = v8;
        [(PKPaymentDataProvider *)v21 transactionsForTransactionSourceIdentifiers:v9 withTransactionType:transactionType withTransactionSource:0 withBackingData:1 startDate:v23 endDate:v24 limit:v25 completion:v66];
        v17 = v67;
        break;
      case 5uLL:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_30;
        }
        v27 = self->_paymentDataProvider;
        v28 = [(PKCreditInstallmentPlan *)self->_installmentPlan identifier];
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_23;
        v64[3] = &unk_1E56E4710;
        id v65 = v8;
        [(PKPaymentDataProvider *)v27 installmentTransactionsForInstallmentPlanIdentifier:v28 completion:v64];

        v17 = v65;
        break;
      case 6uLL:
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_30;
        }
        v29 = self->_paymentDataProvider;
        v30 = [(PKDashboardTransactionFetcher *)self _transactionRequestForCurrentFilters];
        v62[0] = MEMORY[0x1E4F143A8];
        v62[1] = 3221225472;
        v62[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_25;
        v62[3] = &unk_1E56D9100;
        id v63 = v7;
        [(PKPaymentDataProvider *)v29 transactionsForRequest:v30 completion:v62];

        v17 = v63;
        break;
      default:
        goto LABEL_30;
    }

LABEL_32:
    _Block_object_dispose(v88, 8);
  }
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) _sortedTransactions:a2 ascending:0 limit:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a2];
  uint64_t v5 = *(unsigned __int8 *)(a1 + 64);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_3;
  v8[3] = &unk_1E56ED688;
  char v13 = v5;
  uint64_t v12 = *(void *)(a1 + 56);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  id v11 = *(id *)(a1 + 48);
  [v3 _processPaymentPassTransactionsWithTransactions:v4 currentMonthOnly:v5 sendTransactionsBlock:v8];
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (*(unsigned char *)(a1 + 64) && (unint64_t)[v3 count] <= 9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 10;
    [*(id *)(a1 + 32) setStartDate:*(void *)(*(void *)(a1 + 40) + 264)];
    [*(id *)(a1 + 32) setEndDate:*(void *)(*(void *)(a1 + 40) + 272)];
    [*(id *)(a1 + 32) setLimit:10];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v7 = *(void **)(v5 + 16);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_4;
    v12[3] = &unk_1E56D8810;
    v12[4] = v5;
    id v13 = *(id *)(a1 + 48);
    [v7 transactionsForRequest:v6 completion:v12];
    id v8 = v13;
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_7;
    v9[3] = &unk_1E56D83D8;
    id v11 = *(id *)(a1 + 48);
    id v10 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v9);

    id v8 = v11;
  }
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:a2];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_5;
  v5[3] = &unk_1E56E4710;
  id v6 = *(id *)(a1 + 40);
  [v3 _processPaymentPassTransactionsWithTransactions:v4 currentMonthOnly:0 sendTransactionsBlock:v5];
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_6;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_8(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_9;
  v4[3] = &unk_1E56E4710;
  id v3 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v3 _processPaymentPassTransactionsWithTransactions:a2 currentMonthOnly:0 sendTransactionsBlock:v4];
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_10;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_12;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_13(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_14;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_15(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_16;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_18;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_19(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_20;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_21(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_22;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_23(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_24;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_25(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_26;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_26(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __66__PKDashboardTransactionFetcher_reloadTransactionsWithCompletion___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_transactionRequestForCurrentFilters
{
  id v3 = objc_alloc_init(PKPaymentTransactionRequest);
  id v4 = [(PKDashboardTransactionFetcher *)self _transactionSourceIdentifiers];
  [(PKPaymentTransactionRequest *)v3 setTransactionSourceIdentifiers:v4];

  [(PKPaymentTransactionRequest *)v3 setTransactionTypes:self->_types];
  [(PKPaymentTransactionRequest *)v3 setTransactionSources:self->_sources];
  [(PKPaymentTransactionRequest *)v3 setTransactionStatuses:self->_statuses];
  [(PKPaymentTransactionRequest *)v3 setRegions:self->_regions];
  [(PKPaymentTransactionRequest *)v3 setMerchant:self->_merchant];
  [(PKPaymentTransactionRequest *)v3 setMerchantCategory:self->_merchantCategory];
  [(PKPaymentTransactionRequest *)v3 setStartDate:self->_startDate];
  [(PKPaymentTransactionRequest *)v3 setEndDate:self->_endDate];
  [(PKPaymentTransactionRequest *)v3 setDateOrder:1];
  [(PKPaymentTransactionRequest *)v3 setAmount:self->_amount];
  [(PKPaymentTransactionRequest *)v3 setAmountComparison:self->_amountComparison];
  [(PKPaymentTransactionRequest *)v3 setLimit:self->_limit];
  [(PKPaymentTransactionRequest *)v3 setTags:self->_tags];
  [(PKPaymentTransactionRequest *)v3 setRewardsValue:self->_rewardsValue];
  [(PKPaymentTransactionRequest *)v3 setRewardsValueUnit:self->_rewardsValueUnit];
  [(PKPaymentTransactionRequest *)v3 setPeerPaymentSubType:self->_subType];
  [(PKPaymentTransactionRequest *)v3 setPeerPaymentPaymentMode:self->_peerPaymentPaymentMode];
  [(PKPaymentTransactionRequest *)v3 setDisputesOnly:self->_filterDisputesOnly];
  return v3;
}

- (void)transactionCountByPeriod:(unint64_t)a3 withCompletion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
    uint64_t v8 = [v7 associatedAccountFeatureIdentifier];

    BOOL v9 = (unint64_t)(v8 - 1) < 2;
    if ((unint64_t)(v8 - 1) > 1)
    {
      id v10 = objc_alloc_init(PKPaymentTransactionRequest);
      id v11 = [(PKDashboardTransactionFetcher *)self _transactionSourceIdentifiers];
      [(PKPaymentTransactionRequest *)v10 setTransactionSourceIdentifiers:v11];
    }
    else
    {
      id v10 = [(PKDashboardTransactionFetcher *)self _transactionRequestForCurrentFilters];
    }
    paymentDataProvider = self->_paymentDataProvider;
    id v13 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __73__PKDashboardTransactionFetcher_transactionCountByPeriod_withCompletion___block_invoke;
    v15[3] = &unk_1E56ED6D8;
    BOOL v18 = v9;
    unint64_t v16 = v10;
    id v17 = v6;
    objc_super v14 = v10;
    [(PKPaymentDataProvider *)paymentDataProvider transactionCountByPeriodForRequest:v14 calendar:v13 calendarUnit:a3 includePurchaseTotal:0 completion:v15];
  }
}

void __73__PKDashboardTransactionFetcher_transactionCountByPeriod_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          BOOL v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v10 = [*(id *)(a1 + 32) transactionTypes];
          [v9 setTransactionTypes:v10];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v6);
    }
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __73__PKDashboardTransactionFetcher_transactionCountByPeriod_withCompletion___block_invoke_2;
  v13[3] = &unk_1E56D83D8;
  id v11 = *(id *)(a1 + 40);
  id v14 = v4;
  id v15 = v11;
  id v12 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v13);
}

uint64_t __73__PKDashboardTransactionFetcher_transactionCountByPeriod_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)peerPaymentCounterpartHandlesForTransactionSourceIdentifier:(id)a3 startDate:(id)a4 endDate:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    paymentDataProvider = self->_paymentDataProvider;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __122__PKDashboardTransactionFetcher_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke;
    v15[3] = &unk_1E56D9100;
    id v16 = v13;
    [(PKPaymentDataProvider *)paymentDataProvider peerPaymentCounterpartHandlesForTransactionSourceIdentifier:v10 startDate:v11 endDate:v12 completion:v15];
  }
}

void __122__PKDashboardTransactionFetcher_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __122__PKDashboardTransactionFetcher_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_2;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __122__PKDashboardTransactionFetcher_peerPaymentCounterpartHandlesForTransactionSourceIdentifier_startDate_endDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)cashbackGroupForTransactionWithIdentifier:(id)a3 cashbackTransactionSourceCollection:(id *)a4
{
  if (a4) {
    *a4 = self->_cashbackTransactionSourceCollection;
  }
  cashbackGroups = self->_cashbackGroups;
  return [(NSDictionary *)cashbackGroups objectForKey:a3];
}

- (id)cashbackGroupForDateComponents:(id)a3 cashbackTransactionSourceCollection:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = [(NSDictionary *)self->_cashbackGroups allValues];
  id v9 = (id)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v16 = a4;
    uint64_t v10 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v13 = [v12 startDate];
        int v14 = [v7 date:v13 matchesComponents:v6];

        if (v14)
        {
          id v9 = v12;
          goto LABEL_11;
        }
      }
      id v9 = (id)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9) {
        continue;
      }
      break;
    }
LABEL_11:
    a4 = v16;
  }

  if (a4) {
    *a4 = self->_cashbackTransactionSourceCollection;
  }

  return v9;
}

- (void)setCashbackPass:(id)a3
{
  id v10 = a3;
  objc_storeStrong((id *)&self->_cashbackPass, a3);
  id v5 = [v10 uniqueID];
  cashbackPassUniqueID = self->_cashbackPassUniqueID;
  self->_cashbackPassUniqueID = v5;

  if (v10)
  {
    self->_needsCashbackUniqueID = 0;
    id v7 = [[PKTransactionSource alloc] initWithPaymentPass:self->_cashbackPass];
    id v8 = [[PKTransactionSourceCollection alloc] initWithTransactionSource:v7];
    cashbackTransactionSourceCollection = self->_cashbackTransactionSourceCollection;
    self->_cashbackTransactionSourceCollection = v8;
  }
  else
  {
    self->_needsCashbackUniqueID = 1;
    id v7 = (PKTransactionSource *)self->_cashbackTransactionSourceCollection;
    self->_cashbackTransactionSourceCollection = 0;
  }
}

- (id)instantWithdrawalFeesTransactionGroups
{
  return self->_instantWithdrawalFeeGroups;
}

- (void)_addCashbackTransactions:(id)a3 currentMonthOnly:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (self->_allowSynchronousFetch)
  {
    if (self->_startDate) {
      BOOL v10 = self->_endDate == 0;
    }
    else {
      BOOL v10 = 1;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  uint64_t v11 = [MEMORY[0x1E4F1C9C8] date];
  id v12 = (void *)v11;
  endDate = self->_endDate;
  if (!endDate) {
    endDate = (NSDate *)v11;
  }
  int v14 = endDate;
  id v15 = self->_startDate;
  if (!v15)
  {
    if (a4)
    {
      PKStartOfMonth(v12);
      id v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v16 = [MEMORY[0x1E4F1C9C8] date];
      id v15 = [v16 dateByAddingTimeInterval:-2678400.0];
    }
  }
  if (self->_limit && [v8 count] >= self->_limit)
  {
    long long v17 = -[PKDashboardTransactionFetcher _sortedTransactions:ascending:limit:](self, "_sortedTransactions:ascending:limit:", v8, 0);
    long long v18 = [v17 lastObject];
    uint64_t v19 = [v18 transactionDate];

    id v15 = (NSDate *)v19;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PKDashboardTransactionFetcher__addCashbackTransactions_currentMonthOnly_completion___block_invoke;
  aBlock[3] = &unk_1E56E0000;
  id v20 = v8;
  id v34 = v20;
  unint64_t v35 = self;
  id v21 = v9;
  id v36 = v21;
  uint64_t v22 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    paymentDataProvider = self->_paymentDataProvider;
    long long v24 = [(PKTransactionSourceCollection *)self->_cashbackTransactionSourceCollection transactionSourceIdentifiers];
    unint64_t v25 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v26 = [(PKPaymentDataProvider *)paymentDataProvider cashbackByPeriodForTransactionSourceIdentifiers:v24 withStartDate:v15 endDate:v14 calendar:v25 calendarUnit:16 type:self->_cashBackType];

    v22[2](v22, v26);
  }
  else if (objc_opt_respondsToSelector())
  {
    v30 = self->_paymentDataProvider;
    v27 = [(PKTransactionSourceCollection *)self->_cashbackTransactionSourceCollection transactionSourceIdentifiers];
    v28 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    unint64_t cashBackType = self->_cashBackType;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __86__PKDashboardTransactionFetcher__addCashbackTransactions_currentMonthOnly_completion___block_invoke_2;
    v31[3] = &unk_1E56D9100;
    v32 = v22;
    [(PKPaymentDataProvider *)v30 cashbackByPeriodForTransactionSourceIdentifiers:v27 withStartDate:v15 endDate:v14 calendar:v28 calendarUnit:16 type:cashBackType completion:v31];
  }
  else if (v21)
  {
    (*((void (**)(id, id))v21 + 2))(v21, v20);
  }
}

void __86__PKDashboardTransactionFetcher__addCashbackTransactions_currentMonthOnly_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v85 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v86 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:*(void *)(a1 + 32)];
  id v4 = (NSDecimalNumber *)v3;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  uint64_t v84 = a1;
  id obj = *(id *)(a1 + 32);
  uint64_t v5 = [obj countByEnumeratingWithState:&v95 objects:v102 count:16];
  v76 = v4;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v96;
    uint64_t v77 = *(void *)v96;
    do
    {
      uint64_t v8 = 0;
      uint64_t v78 = v6;
      do
      {
        if (*(void *)v96 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v95 + 1) + 8 * v8);
        if ([v9 transactionType] == 8)
        {
          BOOL v10 = [v9 redemptionEvent];
          uint64_t v11 = [v10 items];
          id v12 = [v11 anyObject];

          id v13 = [v9 merchantProvidedDescription];
          v83 = v12;
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            int v14 = [v12 transactionIdentifiers];
            if ([v14 count])
            {
              BOOL v15 = 0;
            }
            else
            {
              id v16 = [v12 rewardsAddedIdentifiers];
              BOOL v15 = [v16 count] == 0;
            }
          }
          else
          {
            BOOL v15 = 0;
          }
          long long v17 = [v9 referenceIdentifier];
          id v82 = v13;
          if ([v17 length])
          {
            long long v18 = v13;
            if (v18 == @"Daily Cash") {
              goto LABEL_18;
            }
            uint64_t v19 = v18;
            if (v18)
            {
              char v20 = [(__CFString *)v18 isEqualToString:@"Daily Cash"];

              if (v20)
              {
LABEL_18:

                goto LABEL_26;
              }
              uint64_t v22 = v19;
              if (v22 == @"Daily Cash") {
                int v21 = 1;
              }
              else {
                int v21 = -[__CFString isEqualToString:](v22, "isEqualToString:");
              }
            }
            else
            {
              int v21 = 0;
            }
          }
          else
          {
            int v21 = 0;
          }

          if ((v15 | v21) == 1)
          {
LABEL_26:
            id v81 = v10;
            [v86 removeObject:v9];
            v80 = [v9 transactionDate];
            long long v23 = PKStartOfDay(v80);
            long long v91 = 0u;
            long long v92 = 0u;
            long long v93 = 0u;
            long long v94 = 0u;
            id v4 = v4;
            uint64_t v24 = [(NSDecimalNumber *)v4 countByEnumeratingWithState:&v91 objects:v101 count:16];
            if (v24)
            {
              uint64_t v25 = v24;
              uint64_t v26 = *(void *)v92;
LABEL_28:
              uint64_t v27 = 0;
              while (1)
              {
                if (*(void *)v92 != v26) {
                  objc_enumerationMutation(v4);
                }
                v28 = *(void **)(*((void *)&v91 + 1) + 8 * v27);
                v29 = [v28 startDate];
                v30 = v29;
                if (v23 && v29)
                {
                  char v31 = [v23 isEqual:v29];

                  if (v31) {
                    goto LABEL_39;
                  }
                }
                else
                {

                  if (v23 == v30)
                  {
LABEL_39:
                    v32 = v28;

                    if (!v32) {
                      goto LABEL_43;
                    }
                    v33 = [(PKPaymentTransactionGroup *)v32 transactions];
                    id v34 = [v33 arrayByAddingObject:v9];
                    [(PKPaymentTransactionGroup *)v32 setTransactions:v34];

                    unint64_t v35 = [(PKPaymentTransactionGroup *)v32 totalAmount];
                    id v36 = [v35 amount];
                    v37 = [v9 amount];
                    v38 = objc_msgSend(v37, "pk_absoluteValue");
                    v39 = [v36 decimalNumberByAdding:v38];

                    v40 = [(PKPaymentTransactionGroup *)v32 totalAmount];
                    char v41 = [v40 currency];
                    v42 = PKCurrencyAmountCreate(v39, v41, 0);
                    [(PKPaymentTransactionGroup *)v32 setTotalAmount:v42];

                    v43 = [(PKPaymentTransactionGroup *)v32 endDate];
                    v44 = v80;
                    uint64_t v45 = [v80 compare:v43];

                    unint64_t v46 = v83;
                    if (v45 == 1) {
                      [(PKPaymentTransactionGroup *)v32 setEndDate:v80];
                    }
                    [(PKPaymentTransactionGroup *)v32 setTransactionCount:[(PKPaymentTransactionGroup *)v32 transactionCount] + 1];
                    uint64_t v7 = v77;
                    uint64_t v6 = v78;
                    BOOL v10 = v81;
                    goto LABEL_44;
                  }
                }
                if (v25 == ++v27)
                {
                  uint64_t v25 = [(NSDecimalNumber *)v4 countByEnumeratingWithState:&v91 objects:v101 count:16];
                  if (v25) {
                    goto LABEL_28;
                  }
                  break;
                }
              }
            }

LABEL_43:
            v32 = objc_alloc_init(PKPaymentTransactionGroup);
            uint64_t v47 = [v9 transactionDate];
            v48 = PKStartOfDay(v47);
            [(PKPaymentTransactionGroup *)v32 setStartDate:v48];

            v44 = v80;
            [(PKPaymentTransactionGroup *)v32 setEndDate:v80];
            [(PKPaymentTransactionGroup *)v32 setType:5];
            BOOL v49 = [v9 amount];
            objc_msgSend(v49, "pk_absoluteValue");
            uint64_t v50 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
            BOOL v51 = [v9 currencyCode];
            v52 = PKCurrencyAmountCreate(v50, v51, 0);
            [(PKPaymentTransactionGroup *)v32 setTotalAmount:v52];

            [(PKPaymentTransactionGroup *)v32 setTransactionCount:1];
            v100 = v9;
            unint64_t v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v100 count:1];
            [(PKPaymentTransactionGroup *)v32 setTransactions:v53];

            [(NSDecimalNumber *)v4 arrayByAddingObject:v32];
            v39 = v4;
            id v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
            uint64_t v7 = v77;
            uint64_t v6 = v78;
            BOOL v10 = v81;
            unint64_t v46 = v83;
LABEL_44:
          }
          else
          {
            unint64_t v46 = v83;
          }
        }
        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v95 objects:v102 count:16];
    }
    while (v6);
  }

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  v54 = v4;
  uint64_t v55 = [(NSDecimalNumber *)v54 countByEnumeratingWithState:&v87 objects:v99 count:16];
  if (!v55) {
    goto LABEL_62;
  }
  uint64_t v56 = v55;
  uint64_t v57 = *(void *)v88;
  do
  {
    for (uint64_t i = 0; i != v56; ++i)
    {
      if (*(void *)v88 != v57) {
        objc_enumerationMutation(v54);
      }
      v59 = *(void **)(*((void *)&v87 + 1) + 8 * i);
      v60 = objc_alloc_init(PKPaymentTransaction);
      [(PKPaymentTransaction *)v60 setTransactionType:9];
      id v61 = [v59 totalAmount];
      v62 = [v61 amount];
      [(PKPaymentTransaction *)v60 setAmount:v62];

      id v63 = [v61 currency];
      [(PKPaymentTransaction *)v60 setCurrencyCode:v63];

      v64 = [v59 endDate];
      [(PKPaymentTransaction *)v60 setTransactionDate:v64];

      [(PKPaymentTransaction *)v60 setTransactionStatus:1];
      id v65 = [*(id *)(*(void *)(v84 + 40) + 8) transactionSourceIdentifiers];
      v66 = [v65 anyObject];
      [(PKPaymentTransaction *)v60 setTransactionSourceIdentifier:v66];

      id v67 = [v59 transactions];
      v68 = [v67 firstObject];

      uint64_t v69 = [v68 redemptionType];
      if (!v69)
      {
        uint64_t v70 = [v68 accountType];
LABEL_59:
        [(PKPaymentTransaction *)v60 setAccountType:v70];
        goto LABEL_60;
      }
      uint64_t v70 = v69;
      if (v69 == 1 || v69 == 3) {
        goto LABEL_59;
      }
LABEL_60:
      [v86 addObject:v60];
      id v71 = [(PKPaymentTransaction *)v60 identifier];
      [v85 setObject:v59 forKey:v71];
    }
    uint64_t v56 = [(NSDecimalNumber *)v54 countByEnumeratingWithState:&v87 objects:v99 count:16];
  }
  while (v56);
LABEL_62:

  uint64_t v72 = [v85 copy];
  uint64_t v73 = *(void *)(v84 + 40);
  v74 = *(void **)(v73 + 224);
  *(void *)(v73 + 224) = v72;

  uint64_t v75 = *(void *)(v84 + 48);
  if (v75) {
    (*(void (**)(uint64_t, void *))(v75 + 16))(v75, v86);
  }
}

void __86__PKDashboardTransactionFetcher__addCashbackTransactions_currentMonthOnly_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__PKDashboardTransactionFetcher__addCashbackTransactions_currentMonthOnly_completion___block_invoke_3;
  v6[3] = &unk_1E56D83D8;
  id v4 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __86__PKDashboardTransactionFetcher__addCashbackTransactions_currentMonthOnly_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_addInstantWidthdrawalTransactionsWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (objc_opt_respondsToSelector())
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
    paymentDataProvider = self->_paymentDataProvider;
    id v7 = [(PKDashboardTransactionFetcher *)self _transactionSourceIdentifiers];
    if (self->_startDate) {
      startDate = self->_startDate;
    }
    else {
      startDate = v5;
    }
    id v9 = PKStartOfYear(startDate);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__PKDashboardTransactionFetcher__addInstantWidthdrawalTransactionsWithCompletion___block_invoke;
    v11[3] = &unk_1E56D8748;
    v11[4] = self;
    id v12 = v4;
    [(PKPaymentDataProvider *)paymentDataProvider transactionsForTransactionSourceIdentifiers:v7 withTransactionType:5 withTransactionSource:0 withBackingData:1 startDate:v9 endDate:v5 limit:0 completion:v11];
  }
  else
  {
    instantWithdrawalFeeGroups = self->_instantWithdrawalFeeGroups;
    self->_instantWithdrawalFeeGroups = 0;

    if (v4) {
      v4[2](v4);
    }
  }
}

void __82__PKDashboardTransactionFetcher__addInstantWidthdrawalTransactionsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKDashboardTransactionFetcher__addInstantWidthdrawalTransactionsWithCompletion___block_invoke_2;
  block[3] = &unk_1E56D89F0;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __82__PKDashboardTransactionFetcher__addInstantWidthdrawalTransactionsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) _sortedTransactions:*(void *)(a1 + 40) ascending:0 limit:*(void *)(*(void *)(a1 + 32) + 184)];
  v2 = objc_msgSend(v1, "pk_objectsPassingTest:", &__block_literal_global_150);

  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v54 = [MEMORY[0x1E4F28C28] zero];
  id v4 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v2;
  uint64_t v52 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
  if (v52)
  {
    id v49 = v3;
    uint64_t v50 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v52; ++i)
      {
        if (*(void *)v61 != v50) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        id v7 = [v6 transactionDate];
        id v8 = PKStartOfDay(v7);

        id v9 = [*(id *)(a1 + 32) _feeTotalForTransaction:v6];
        if (v9)
        {
          unint64_t v53 = v6;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          id v10 = v3;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v56 objects:v65 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v57;
            uint64_t v55 = v9;
LABEL_9:
            uint64_t v14 = 0;
            while (1)
            {
              if (*(void *)v57 != v13) {
                objc_enumerationMutation(v10);
              }
              BOOL v15 = *(void **)(*((void *)&v56 + 1) + 8 * v14);
              id v16 = [v15 startDate];
              long long v17 = [v4 components:14 fromDate:v16];

              if ([v4 date:v8 matchesComponents:v17]) {
                break;
              }

              if (v12 == ++v14)
              {
                uint64_t v12 = [v10 countByEnumeratingWithState:&v56 objects:v65 count:16];
                id v9 = v55;
                if (v12) {
                  goto LABEL_9;
                }
                goto LABEL_15;
              }
            }
            id v18 = v15;

            id v9 = v55;
            if (!v18) {
              goto LABEL_18;
            }
            uint64_t v19 = [v18 transactions];
            char v20 = [v19 arrayByAddingObject:v53];
            [v18 setTransactions:v20];

            int v21 = [v18 totalAmount];
            uint64_t v22 = [v21 amount];
            long long v23 = objc_msgSend(v55, "pk_absoluteValue");
            uint64_t v24 = [v22 decimalNumberByAdding:v23];

            uint64_t v25 = [v18 totalAmount];
            uint64_t v26 = [v25 currency];
            uint64_t v27 = PKCurrencyAmountCreate(v24, v26, 0);
            [v18 setTotalAmount:v27];

            id v9 = v55;
          }
          else
          {
LABEL_15:

LABEL_18:
            uint64_t v24 = objc_alloc_init(PKPaymentTransactionGroup);
            v28 = [v53 transactionDate];
            v29 = PKStartOfMonth(v28);
            [(NSDecimalNumber *)v24 setStartDate:v29];

            v30 = [v53 transactionDate];
            char v31 = PKEndOfMonth(v30);
            [(NSDecimalNumber *)v24 setEndDate:v31];

            [(NSDecimalNumber *)v24 setType:3];
            objc_msgSend(v9, "pk_absoluteValue");
            v32 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
            v33 = [v53 currencyCode];
            id v34 = PKCurrencyAmountCreate(v32, v33, 0);
            [(NSDecimalNumber *)v24 setTotalAmount:v34];

            [(NSDecimalNumber *)v24 setTransactionCount:0];
            v64 = v53;
            unint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v64 count:1];
            [(NSDecimalNumber *)v24 setTransactions:v35];

            [v10 addObject:v24];
            id v18 = 0;
          }

          id v36 = objc_msgSend(v9, "pk_absoluteValue");
          uint64_t v37 = [(NSDecimalNumber *)v54 decimalNumberByAdding:v36];

          v54 = (NSDecimalNumber *)v37;
          id v3 = v49;
        }
      }
      uint64_t v52 = [obj countByEnumeratingWithState:&v60 objects:v66 count:16];
    }
    while (v52);
  }

  if ([v3 count])
  {
    v38 = objc_alloc_init(PKPaymentTransactionGroup);
    v39 = PKStartOfYear(*(void **)(*(void *)(a1 + 32) + 264));
    [(PKPaymentTransactionGroup *)v38 setStartDate:v39];

    v40 = [MEMORY[0x1E4F1C9C8] date];
    [(PKPaymentTransactionGroup *)v38 setEndDate:v40];

    [(PKPaymentTransactionGroup *)v38 setType:3];
    char v41 = [v3 firstObject];
    v42 = [v41 totalAmount];
    v43 = [v42 currency];
    v44 = PKCurrencyAmountCreate(v54, v43, 0);
    [(PKPaymentTransactionGroup *)v38 setTotalAmount:v44];

    [(PKPaymentTransactionGroup *)v38 setTransactionCount:0];
    [(PKPaymentTransactionGroup *)v38 setTransactions:0];
    [v3 addObject:v38];
  }
  uint64_t v45 = [v3 count];
  if (v45) {
    unint64_t v46 = (void *)[v3 copy];
  }
  else {
    unint64_t v46 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 240), v46);
  if (v45) {

  }
  uint64_t v47 = *(void *)(a1 + 48);
  if (v47) {
    (*(void (**)(void))(v47 + 16))();
  }
}

BOOL __82__PKDashboardTransactionFetcher__addInstantWidthdrawalTransactionsWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 secondaryFundingSourceType] == 2;
}

- (void)_processPaymentPassTransactionsWithTransactions:(id)a3 currentMonthOnly:(BOOL)a4 sendTransactionsBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__52;
  v26[4] = __Block_byref_object_dispose__52;
  id v10 = v8;
  id v27 = v10;
  uint64_t v11 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke;
  v25[3] = &unk_1E56E9040;
  v25[4] = self;
  [(PKAsyncUnaryOperationComposer *)v11 addOperation:v25];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_3;
  v22[3] = &unk_1E56E0F90;
  v22[4] = self;
  id v12 = v10;
  id v23 = v12;
  uint64_t v24 = v26;
  [(PKAsyncUnaryOperationComposer *)v11 addOperation:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_4;
  v21[3] = &unk_1E56E9040;
  v21[4] = self;
  [(PKAsyncUnaryOperationComposer *)v11 addOperation:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_7;
  v19[3] = &unk_1E56E92B8;
  v19[4] = self;
  v19[5] = v26;
  BOOL v20 = a4;
  [(PKAsyncUnaryOperationComposer *)v11 addOperation:v19];
  uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_2_76;
  v16[3] = &unk_1E56ED728;
  id v14 = v9;
  id v17 = v14;
  id v18 = v26;
  id v15 = [(PKAsyncUnaryOperationComposer *)v11 evaluateWithInput:v13 completion:v16];

  _Block_object_dispose(v26, 8);
}

void __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  id v9 = *(unsigned char **)(a1 + 32);
  if (v9[232])
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_2;
    v10[3] = &unk_1E56D83D8;
    id v12 = v7;
    id v11 = v6;
    [v9 _addInstantWidthdrawalTransactionsWithCompletion:v10];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

uint64_t __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [*(id *)(*(void *)(a1 + 32) + 8) account];

  if (!v8)
  {
    v7[2](v7, v6, 0);
    goto LABEL_19;
  }
  id v25 = v6;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v10) {
    goto LABEL_17;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v27 != v12) {
        objc_enumerationMutation(v9);
      }
      id v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      id v15 = [v14 referenceIdentifier];
      if (![v15 length])
      {

        continue;
      }
      if ([v14 transactionType] == 5)
      {
      }
      else
      {
        uint64_t v16 = [v14 transactionType];

        if (v16 != 6) {
          continue;
        }
      }
      id v17 = [v14 transfers];
      uint64_t v18 = [v17 count];

      if (!v18)
      {
        uint64_t v19 = [v14 transactionDate];
        [v19 timeIntervalSinceNow];
        double v21 = fabs(v20);

        if (v21 < 3.0)
        {
          uint64_t v22 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "pk_setByRemovingObject:", v14);
          uint64_t v23 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v24 = *(void **)(v23 + 40);
          *(void *)(v23 + 40) = v22;

          os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
          *(unsigned char *)(*(void *)(a1 + 32) + 37) = 1;
          os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 32));
        }
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  }
  while (v11);
LABEL_17:

  id v6 = v25;
  v7[2](v7, v25, 0);
LABEL_19:
}

void __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 208))
  {
    id v9 = +[PKAccountService sharedInstance];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_5;
    v10[3] = &unk_1E56ED700;
    void v10[4] = *(void *)(a1 + 32);
    id v12 = v8;
    id v11 = v6;
    [v9 defaultAccountForFeature:2 completion:v10];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_6;
  v6[3] = &unk_1E56DEB98;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v10 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_6(void *a1)
{
  v2 = (void *)a1[4];
  if (v2)
  {
    uint64_t v3 = [v2 associatedPassUniqueID];
    uint64_t v4 = a1[5];
    id v5 = *(void **)(v4 + 192);
    *(void *)(v4 + 192) = v3;

    id v6 = +[PKPassLibrary sharedInstance];
    id v7 = [v6 passWithUniqueID:*(void *)(a1[5] + 192)];
    uint64_t v8 = [v7 paymentPass];
    uint64_t v9 = a1[5];
    id v10 = *(void **)(v9 + 280);
    *(void *)(v9 + 280) = v8;

    id v11 = [[PKTransactionSource alloc] initWithPaymentPass:*(void *)(a1[5] + 280)];
    id v12 = [[PKTransactionSourceCollection alloc] initWithTransactionSource:v11];
    uint64_t v13 = a1[5];
    id v14 = *(void **)(v13 + 200);
    *(void *)(v13 + 200) = v12;
  }
  *(unsigned char *)(a1[5] + 208) = 0;
  id v15 = *(uint64_t (**)(void))(a1[7] + 16);
  return v15();
}

void __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = *(void **)(a1 + 32);
  if (!v10[24]) {
    goto LABEL_6;
  }
  id v11 = (void *)v10[11];
  if (v11)
  {
    if ([v11 containsObject:&unk_1EE22C170])
    {
      id v10 = *(void **)(a1 + 32);
      goto LABEL_5;
    }
LABEL_6:
    v9[2](v9, v8, 0);
    goto LABEL_7;
  }
LABEL_5:
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(*(void *)(v12 + 8) + 40);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 48);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_74;
  v15[3] = &unk_1E56E9268;
  uint64_t v18 = v12;
  id v17 = v9;
  id v16 = v8;
  [v10 _addCashbackTransactions:v13 currentMonthOnly:v14 completion:v15];

LABEL_7:
}

void __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_74(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __120__PKDashboardTransactionFetcher__processPaymentPassTransactionsWithTransactions_currentMonthOnly_sendTransactionsBlock___block_invoke_2_76(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

- (id)_feeTotalForTransaction:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 currencyCode];
  id v5 = [MEMORY[0x1E4F28C28] zero];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v22 = v3;
  id v6 = [v3 fees];
  id v7 = [v6 fees];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (!v8) {
    goto LABEL_17;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v24 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = [*(id *)(*((void *)&v23 + 1) + 8 * i) currencyAmount];
      uint64_t v13 = [v12 currency];
      id v14 = v4;
      id v15 = v13;
      if (v14 == v15)
      {

LABEL_12:
        id v16 = [v12 amount];
        [v5 decimalNumberByAdding:v16];
        v5 = id v14 = v5;
LABEL_14:

        goto LABEL_15;
      }
      id v16 = v15;
      if (!v4 || !v15)
      {

        goto LABEL_14;
      }
      int v17 = [v14 isEqualToString:v15];

      if (v17) {
        goto LABEL_12;
      }
LABEL_15:
    }
    uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
  }
  while (v9);
LABEL_17:

  uint64_t v18 = [MEMORY[0x1E4F28C28] zero];
  if ([v5 compare:v18]) {
    uint64_t v19 = v5;
  }
  else {
    uint64_t v19 = 0;
  }
  id v20 = v19;

  return v20;
}

- (id)_sortedTransactions:(id)a3 ascending:(BOOL)a4 limit:(unint64_t)a5
{
  BOOL v6 = a4;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (self->_startDate)
  {
    uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"transactionDate >= %@", self->_startDate];
    uint64_t v10 = [v8 filteredSetUsingPredicate:v9];

    id v8 = (id)v10;
  }
  if (self->_endDate)
  {
    id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"transactionDate <= %@", self->_endDate];
    uint64_t v12 = [v8 filteredSetUsingPredicate:v11];

    id v8 = (id)v12;
  }
  uint64_t v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"transactionDate" ascending:v6];
  v18[0] = v13;
  id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v15 = [v8 sortedArrayUsingDescriptors:v14];

  if (a5 && [v15 count] > a5)
  {
    uint64_t v16 = objc_msgSend(v15, "subarrayWithRange:", 0, a5);

    id v15 = (void *)v16;
  }

  return v15;
}

- (void)_sendUpdatedTransactions
{
  p_lockUpdate = &self->_lockUpdate;
  os_unfair_lock_lock(&self->_lockUpdate);
  if (self->_pendingUpdate)
  {
    self->_hasMoreUpdates = 1;
    os_unfair_lock_unlock(p_lockUpdate);
  }
  else
  {
    self->_pendingUpdate = 1;
    os_unfair_lock_unlock(p_lockUpdate);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __57__PKDashboardTransactionFetcher__sendUpdatedTransactions__block_invoke;
    v4[3] = &unk_1E56E26F8;
    void v4[4] = self;
    [(PKDashboardTransactionFetcher *)self reloadTransactionsWithCompletion:v4];
  }
}

void __57__PKDashboardTransactionFetcher__sendUpdatedTransactions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  id v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained transactionsChanged:v3];
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_time_t v6 = dispatch_time(0, 3000000000);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PKDashboardTransactionFetcher__sendUpdatedTransactions__block_invoke_2;
  v7[3] = &unk_1E56DD818;
  objc_copyWeak(&v8, &location);
  dispatch_after(v6, MEMORY[0x1E4F14428], v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __57__PKDashboardTransactionFetcher__sendUpdatedTransactions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 8;
    id v4 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 8);
    int v3 = BYTE1(v4[9]._os_unfair_lock_opaque);
    LOWORD(v4[9]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v2);
    id WeakRetained = v4;
    if (v3)
    {
      [(os_unfair_lock_s *)v4 _sendUpdatedTransactions];
      id WeakRetained = v4;
    }
  }
}

- (BOOL)_containsFrequentTransactionType:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        unint64_t v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "integerValue", (void)v9);
        if (v7 < 0xA && ((0x269u >> v7) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)transactionSourceIdentifier:(id)a3 didReceiveTransaction:(id)a4
{
  id v8 = a3;
  uint64_t v5 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourceIdentifiers];
  if ([v5 containsObject:v8])
  {
  }
  else
  {
    dispatch_time_t v6 = [(PKTransactionSourceCollection *)self->_cashbackTransactionSourceCollection transactionSourceIdentifiers];
    int v7 = [v6 containsObject:v8];

    if (!v7) {
      goto LABEL_5;
    }
  }
  [(PKDashboardTransactionFetcher *)self _sendUpdatedTransactions];
LABEL_5:
}

- (void)transactionSourceIdentifier:(id)a3 didRemoveTransactionWithIdentifier:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  dispatch_time_t v6 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  id v13 = v7;
  long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
  long long v11 = (void *)[v9 initWithArray:v10];
  v15[0] = v11;
  long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];

  [(PKDashboardTransactionFetcher *)self didRemoveTransactionsWithSourceIdentifierMapping:v12];
}

- (void)didRemoveTransactionsWithSourceIdentifierMapping:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v7 = [v5 allKeys];

  id v11 = (id)[v6 initWithArray:v7];
  id v8 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourceIdentifiers];
  if ([v8 intersectsSet:v11])
  {
  }
  else
  {
    id v9 = [(PKTransactionSourceCollection *)self->_cashbackTransactionSourceCollection transactionSourceIdentifiers];
    int v10 = [v9 intersectsSet:v11];

    if (!v10) {
      goto LABEL_5;
    }
  }
  [(PKDashboardTransactionFetcher *)self _sendUpdatedTransactions];
LABEL_5:
}

- (void)paymentPassWithUniqueIdentifier:(id)a3 didEnableTransactionService:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  id v7 = [v6 uniqueID];
  id v14 = v5;
  id v8 = v7;
  if (v8 == v14) {
    goto LABEL_12;
  }
  if (v14 && v8)
  {
    char v9 = [v14 isEqualToString:v8];

    if (v9) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  cashbackPassUniqueID = self->_cashbackPassUniqueID;
  id v11 = (NSString *)v14;
  long long v12 = cashbackPassUniqueID;
  if (v12 == v11)
  {
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  if (v14 && v12)
  {
    BOOL v13 = [(NSString *)v11 isEqualToString:v12];

    if (v13) {
LABEL_14:
    }
      [(PKDashboardTransactionFetcher *)self _sendUpdatedTransactions];
  }
  else
  {
  }
}

- (PKTransactionSourceCollection)cashbackTransactionSourceCollection
{
  return self->_cashbackTransactionSourceCollection;
}

- (void)setCashbackTransactionSourceCollection:(id)a3
{
}

- (PKDashboardTransactionFetcherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKDashboardTransactionFetcherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)limit
{
  return self->_limit;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSSet)counterpartHandles
{
  return self->_counterpartHandles;
}

- (BOOL)allowSynchronousFetch
{
  return self->_allowSynchronousFetch;
}

- (void)setAllowSynchronousFetch:(BOOL)a3
{
  self->_allowSynchronousFetch = a3;
}

- (PKPaymentPass)cashbackPass
{
  return self->_cashbackPass;
}

- (PKPaymentDataProvider)paymentDataProvider
{
  return self->_paymentDataProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cashbackPass, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_instantWithdrawalFeeGroups, 0);
  objc_storeStrong((id *)&self->_cashbackGroups, 0);
  objc_storeStrong((id *)&self->_cashbackTransactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_cashbackPassUniqueID, 0);
  objc_storeStrong((id *)&self->_filteredTransactionSourceIdentifiers, 0);
  objc_storeStrong((id *)&self->_rewardsValue, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_statuses, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_installmentPlan, 0);
  objc_storeStrong((id *)&self->_counterpartHandles, 0);
  objc_storeStrong((id *)&self->_merchant, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end