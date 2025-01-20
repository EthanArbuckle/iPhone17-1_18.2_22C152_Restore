@interface PKRewardsSummaryFetcher
- (BOOL)isPaymentPassRelevant:(id)a3;
- (BOOL)isTransactionSourceIdentifierRelevant:(id)a3;
- (PKRewardsSummaryFetcher)initWithTransactionSourceCollection:(id)a3 account:(id)a4;
- (id)_relevantTransactionSourceIdentifiers;
- (void)rewardsTierSummariesWithCompletion:(id)a3;
@end

@implementation PKRewardsSummaryFetcher

- (PKRewardsSummaryFetcher)initWithTransactionSourceCollection:(id)a3 account:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKRewardsSummaryFetcher;
  v9 = [(PKRewardsSummaryFetcher *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a4);
    objc_storeStrong((id *)&v10->_transactionSourceCollection, a3);
  }

  return v10;
}

- (BOOL)isTransactionSourceIdentifierRelevant:(id)a3
{
  id v4 = a3;
  v5 = [(PKRewardsSummaryFetcher *)self _relevantTransactionSourceIdentifiers];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)isPaymentPassRelevant:(id)a3
{
  id v4 = a3;
  v5 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection paymentPass];
  char v6 = [v5 uniqueID];
  id v7 = v4;
  id v8 = v6;
  v9 = v8;
  if (v8 == v7)
  {
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
    if (v7 && v8) {
      char v10 = [v7 isEqualToString:v8];
    }
  }

  return v10;
}

- (void)rewardsTierSummariesWithCompletion:(id)a3
{
  id v4 = a3;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__80;
  v35[4] = __Block_byref_object_dispose__80;
  id v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__80;
  v33[4] = __Block_byref_object_dispose__80;
  id v34 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__80;
  v31[4] = __Block_byref_object_dispose__80;
  id v32 = 0;
  v5 = [MEMORY[0x1E4F1C9C8] now];
  char v6 = PKStartOfMonth(v5);
  id v7 = PKStartOfYear(v5);
  id v8 = dispatch_group_create();
  v9 = +[PKAccountService sharedInstance];
  char v10 = [(PKRewardsSummaryFetcher *)self _relevantTransactionSourceIdentifiers];
  v11 = [(PKAccount *)self->_account creditDetails];
  objc_super v12 = [v11 currencyCode];

  dispatch_group_enter(v8);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke;
  v28[3] = &unk_1E56F4560;
  v30 = v35;
  v13 = v8;
  v29 = v13;
  [v9 rewardsTierSummaryForTransactionSourceIdentifiers:v10 currencyCode:v12 startDate:v6 endDate:0 completion:v28];
  dispatch_group_enter(v13);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke_2;
  v25[3] = &unk_1E56F4560;
  v27 = v33;
  v14 = v13;
  v26 = v14;
  [v9 rewardsTierSummaryForTransactionSourceIdentifiers:v10 currencyCode:v12 startDate:v7 endDate:0 completion:v25];
  dispatch_group_enter(v14);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke_3;
  v22[3] = &unk_1E56F4560;
  v24 = v31;
  v15 = v14;
  v23 = v15;
  [v9 rewardsTierSummaryForTransactionSourceIdentifiers:v10 currencyCode:v12 startDate:0 endDate:0 completion:v22];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke_4;
  v17[3] = &unk_1E56E9DA8;
  id v18 = v4;
  v19 = v35;
  v20 = v33;
  v21 = v31;
  id v16 = v4;
  dispatch_group_notify(v15, MEMORY[0x1E4F14428], v17);

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);

  _Block_object_dispose(v35, 8);
}

void __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __62__PKRewardsSummaryFetcher_rewardsTierSummariesWithCompletion___block_invoke_4(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void))(result + 16))(result, *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40));
  }
  return result;
}

- (id)_relevantTransactionSourceIdentifiers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(PKTransactionSourceCollection *)self->_transactionSourceCollection transactionSources];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v10 = [v9 type];
        if (v10)
        {
          if (v10 != 2) {
            continue;
          }
          v11 = [v9 accountUser];
          int v12 = [v11 isCurrentUser];

          if (!v12) {
            continue;
          }
        }
        v13 = [v9 transactionSourceIdentifiers];
        [v3 unionSet:v13];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v14 = (void *)[v3 copy];
  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transactionSourceCollection, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end