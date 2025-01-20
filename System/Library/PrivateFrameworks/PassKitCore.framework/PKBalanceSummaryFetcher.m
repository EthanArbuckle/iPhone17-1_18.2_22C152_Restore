@interface PKBalanceSummaryFetcher
- (BOOL)_transactionIsCredit:(id)a3;
- (BOOL)_transactionIsInterest:(id)a3;
- (BOOL)_transactionIsPurchase:(id)a3;
- (PKBalanceSummaryFetcher)initWithTransactionSourceCollection:(id)a3 account:(id)a4;
- (id)_sortedTransactions:(id)a3 ascending:(BOOL)a4;
- (id)_summaryWithTransactions:(id)a3 currency:(id)a4 type:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7;
- (void)balanceSummaryStartingWithDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5 completion:(id)a6;
@end

@implementation PKBalanceSummaryFetcher

- (PKBalanceSummaryFetcher)initWithTransactionSourceCollection:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKBalanceSummaryFetcher;
  v9 = [(PKBalanceSummaryFetcher *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transactionSourceCollection, a3);
    objc_storeStrong((id *)&v10->_account, a4);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.passkitui.balance.work", 0);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v11;

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.passkitui.balance.reply", 0);
    replyQueue = v10->_replyQueue;
    v10->_replyQueue = (OS_dispatch_queue *)v13;

    v15 = objc_alloc_init(PKPaymentDefaultDataProvider);
    paymentDataProvider = v10->_paymentDataProvider;
    v10->_paymentDataProvider = v15;

    [(PKPaymentDefaultDataProvider *)v10->_paymentDataProvider addDelegate:v10];
  }

  return v10;
}

- (void)balanceSummaryStartingWithDate:(id)a3 endDate:(id)a4 type:(unint64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke;
  aBlock[3] = &unk_1E56E4C58;
  unint64_t v29 = a5;
  aBlock[4] = self;
  id v26 = v10;
  id v13 = v11;
  id v27 = v13;
  id v28 = v12;
  id v14 = v12;
  id v15 = v10;
  v16 = _Block_copy(aBlock);
  paymentDataProvider = self->_paymentDataProvider;
  objc_super v18 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSourceIdentifiers];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_3;
  v21[3] = &unk_1E56E5C88;
  v21[4] = self;
  id v22 = v13;
  id v23 = v16;
  unint64_t v24 = a5;
  id v19 = v16;
  id v20 = v13;
  [(PKPaymentDefaultDataProvider *)paymentDataProvider approvedTransactionsForTransactionSourceIdentifiers:v18 withTransactionSource:0 withBackingData:1 startDate:v15 endDate:v20 limit:0 completion:v21];
}

void __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke(void *a1, void *a2)
{
  v3 = (void *)a1[4];
  v4 = (void *)v3[2];
  id v5 = a2;
  v6 = [v4 creditDetails];
  id v7 = [v6 currencyCode];
  id v8 = [v3 _summaryWithTransactions:v5 currency:v7 type:a1[8] startDate:a1[5] endDate:a1[6]];

  v9 = (void *)a1[7];
  if (v9)
  {
    id v10 = *(NSObject **)(a1[4] + 32);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_2;
    v11[3] = &unk_1E56D83D8;
    id v13 = v9;
    id v12 = v8;
    dispatch_async(v10, v11);
  }
}

uint64_t __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(NSObject **)(v4 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_4;
  block[3] = &unk_1E56E43A8;
  uint64_t v11 = *(void *)(a1 + 56);
  block[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_4(uint64_t a1)
{
  if (*(void *)(a1 + 64))
  {
    v2 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v2();
  }
  else
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    uint64_t v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v5 setDay:-10];
    id v6 = [MEMORY[0x1E4F1C9C8] date];
    id v7 = [v4 dateByAddingComponents:v5 toDate:v6 options:0];

    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 40);
    id v10 = [*(id *)(v8 + 8) transactionSourceIdentifiers];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_5;
    v12[3] = &unk_1E56D9038;
    uint64_t v11 = *(void *)(a1 + 40);
    v12[4] = *(void *)(a1 + 32);
    id v13 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    [v9 pendingTransactionsForTransactionSourceIdentifiers:v10 withTransactionSource:0 withBackingData:1 startDate:v7 endDate:v11 limit:0 completion:v12];
  }
}

void __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_6;
  block[3] = &unk_1E56D89F0;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async(v4, block);
}

void __82__PKBalanceSummaryFetcher_balanceSummaryStartingWithDate_endDate_type_completion___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) setByAddingObjectsFromSet:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)_summaryWithTransactions:(id)a3 currency:(id)a4 type:(unint64_t)a5 startDate:(id)a6 endDate:(id)a7
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v29 = a6;
  id v27 = a7;
  id v28 = objc_alloc_init(PKBalanceSummary);
  v30 = v10;
  uint64_t v11 = [(PKBalanceSummaryFetcher *)self _sortedTransactions:v10 ascending:0];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        objc_super v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if ([(PKBalanceSummaryFetcher *)self _transactionIsPurchase:v18]) {
          [v12 addObject:v18];
        }
        if ([(PKBalanceSummaryFetcher *)self _transactionIsInterest:v18]) {
          [v33 addObject:v18];
        }
        if ([(PKBalanceSummaryFetcher *)self _transactionIsCredit:v18]) {
          [v32 addObject:v18];
        }
        id v19 = [v18 rewardsTotalAmount];
        if (v19)
        {
          id v20 = [MEMORY[0x1E4F28C28] zero];
          uint64_t v21 = [v19 compare:v20];

          if (v21) {
            [v31 addObject:v18];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v15);
  }

  id v22 = objc_alloc_init(PKPaymentTransactionGroup);
  [(PKPaymentTransactionGroup *)v22 setType:6];
  [(PKPaymentTransactionGroup *)v22 setTransactions:v12];
  -[PKPaymentTransactionGroup setTransactionCount:](v22, "setTransactionCount:", [v12 count]);
  [(PKPaymentTransactionGroup *)v22 setStartDate:v29];
  [(PKPaymentTransactionGroup *)v22 setEndDate:v27];
  [(PKBalanceSummary *)v28 setOrderedSpendingTransactions:v22];
  id v23 = objc_alloc_init(PKPaymentTransactionGroup);
  [(PKPaymentTransactionGroup *)v23 setType:7];
  [(PKPaymentTransactionGroup *)v23 setTransactions:v33];
  -[PKPaymentTransactionGroup setTransactionCount:](v23, "setTransactionCount:", [v33 count]);
  [(PKPaymentTransactionGroup *)v23 setStartDate:v29];
  [(PKPaymentTransactionGroup *)v23 setEndDate:v27];
  [(PKBalanceSummary *)v28 setOrderedInterestCharges:v23];
  unint64_t v24 = objc_alloc_init(PKPaymentTransactionGroup);
  [(PKPaymentTransactionGroup *)v24 setType:8];
  [(PKPaymentTransactionGroup *)v24 setTransactions:v32];
  -[PKPaymentTransactionGroup setTransactionCount:](v24, "setTransactionCount:", [v32 count]);
  [(PKPaymentTransactionGroup *)v24 setStartDate:v29];
  [(PKPaymentTransactionGroup *)v24 setEndDate:v27];
  [(PKBalanceSummary *)v28 setOrderedCredits:v24];
  v25 = objc_alloc_init(PKPaymentTransactionGroup);
  [(PKPaymentTransactionGroup *)v25 setType:4];
  [(PKPaymentTransactionGroup *)v25 setTransactions:v31];
  -[PKPaymentTransactionGroup setTransactionCount:](v25, "setTransactionCount:", [v31 count]);
  [(PKPaymentTransactionGroup *)v25 setStartDate:v29];
  [(PKPaymentTransactionGroup *)v25 setEndDate:v27];
  [(PKBalanceSummary *)v28 setRewards:v25];

  return v28;
}

- (id)_sortedTransactions:(id)a3 ascending:(BOOL)a4
{
  BOOL v4 = a4;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F29008];
  id v6 = a3;
  id v7 = [v5 sortDescriptorWithKey:@"transactionDate" ascending:v4];
  v11[0] = v7;
  id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  id v9 = [v6 sortedArrayUsingDescriptors:v8];

  return v9;
}

- (BOOL)_transactionIsPurchase:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 transactionType];
  if (v4 == 13) {
    goto LABEL_5;
  }
  if (v4)
  {
    BOOL v6 = 0;
    goto LABEL_7;
  }
  unint64_t v5 = [v3 transactionStatus];
  BOOL v6 = 0;
  if (v5 <= 8 && ((1 << v5) & 0x103) != 0)
  {
LABEL_5:
    id v7 = [v3 amount];
    id v8 = [MEMORY[0x1E4F28C28] zero];
    BOOL v6 = [v7 compare:v8] == 1;
  }
LABEL_7:

  return v6;
}

- (BOOL)_transactionIsInterest:(id)a3
{
  return [a3 transactionType] == 11;
}

- (BOOL)_transactionIsCredit:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 transactionType];
  if (v4 > 0xA || ((1 << v4) & 0x483) == 0)
  {
    BOOL v7 = 0;
  }
  else
  {
    unint64_t v6 = [v3 transactionStatus];
    BOOL v7 = 0;
    if (v6 <= 8 && ((1 << v6) & 0x103) != 0)
    {
      id v8 = [v3 amount];
      id v9 = [MEMORY[0x1E4F28C28] zero];
      BOOL v7 = [v8 compare:v9] == -1;
    }
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
}

@end