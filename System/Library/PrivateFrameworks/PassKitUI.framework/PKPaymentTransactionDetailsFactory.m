@interface PKPaymentTransactionDetailsFactory
- (BOOL)canShowTransactionHistoryForTransaction:(id)a3 transactionSourceCollection:(id)a4;
- (PKPaymentTransactionDetailsFactory)initWithContactResolver:(id)a3 peerPaymentWebService:(id)a4 paymentServiceDataProvider:(id)a5 detailViewStyle:(int64_t)a6;
- (id)_transactionFetcherWithTransactionSourceCollection:(id)a3 transaction:(id)a4;
- (id)detailViewControllerForTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 bankConnectInstitution:(id)a8 physicalCards:(id)a9;
- (id)historyViewControllerForTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8;
- (void)historyViewControllerForTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 completion:(id)a9;
@end

@implementation PKPaymentTransactionDetailsFactory

- (PKPaymentTransactionDetailsFactory)initWithContactResolver:(id)a3 peerPaymentWebService:(id)a4 paymentServiceDataProvider:(id)a5 detailViewStyle:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentTransactionDetailsFactory;
  v14 = [(PKPaymentTransactionDetailsFactory *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_contactResolver, a3);
    objc_storeStrong((id *)&v15->_peerPaymentWebService, a4);
    objc_storeStrong((id *)&v15->_paymentServiceDataProvider, a5);
    v15->_detailViewStyle = a6;
  }

  return v15;
}

- (BOOL)canShowTransactionHistoryForTransaction:(id)a3 transactionSourceCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v5 transactionType];
  LOBYTE(v8) = 0;
  if (v7 <= 0xD)
  {
    if (((1 << v7) & 0x2C00) != 0) {
      goto LABEL_6;
    }
    if (((1 << v7) & 3) != 0)
    {
      v9 = [v5 merchant];
      v10 = [v9 name];
      if (v10)
      {

        goto LABEL_6;
      }
      if (([v9 hasMapsMatch] & 1) == 0) {
        goto LABEL_23;
      }
      char v17 = [v9 useRawMerchantData];

      if (v17) {
        goto LABEL_22;
      }
LABEL_6:
      id v11 = [v6 paymentPass];
      if (!v11)
      {
        LOBYTE(v8) = 1;
        id v13 = [v6 transactionSourcesForType:1];
        if (![v13 count])
        {
          v14 = [v6 transactionSourcesForType:3];
          if ([v14 count])
          {
            LOBYTE(v8) = 1;
          }
          else
          {
            v18 = [v6 transactionSourcesForType:2];
            LOBYTE(v8) = [v18 count] != 0;
          }
        }

        v9 = 0;
        goto LABEL_27;
      }
      v9 = v11;
      id v12 = [v11 associatedAccountServiceAccountIdentifier];
      if (v12)
      {

LABEL_19:
        int v8 = [MEMORY[0x1E4F84D18] transactionIsPaymentForPayLaterFinancingPlan:v5] ^ 1;
LABEL_27:

        goto LABEL_28;
      }
      if ([v9 hasAssociatedPeerPaymentAccount]) {
        goto LABEL_19;
      }
LABEL_23:
      LOBYTE(v8) = 0;
      goto LABEL_27;
    }
    if (v7 == 3)
    {
      v9 = [v5 peerPaymentCounterpartHandle];
      uint64_t v15 = [v5 peerPaymentType];
      LOBYTE(v8) = 0;
      if (![v9 length] || v15 == 4 || v15 == 5) {
        goto LABEL_27;
      }
      uint64_t v16 = [v5 peerPaymentPaymentMode];

      if (v16 != 2) {
        goto LABEL_6;
      }
LABEL_22:
      LOBYTE(v8) = 0;
    }
  }
LABEL_28:

  return v8;
}

- (id)_transactionFetcherWithTransactionSourceCollection:(id)a3 transaction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 transactionType] == 3)
  {
    int v8 = [v6 peerPaymentCounterpartHandle];
    v9 = [(PKContactResolver *)self->_contactResolver contactForHandle:v8];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [v10 addObject:v8];
    if (v9)
    {
      id v11 = [v9 emailAddresses];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __101__PKPaymentTransactionDetailsFactory__transactionFetcherWithTransactionSourceCollection_transaction___block_invoke;
      v22[3] = &unk_1E59CC4E8;
      id v12 = v10;
      id v23 = v12;
      [v11 enumerateObjectsUsingBlock:v22];

      id v13 = [v9 phoneNumbers];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __101__PKPaymentTransactionDetailsFactory__transactionFetcherWithTransactionSourceCollection_transaction___block_invoke_2;
      v20[3] = &unk_1E59CC4E8;
      id v21 = v12;
      [v13 enumerateObjectsUsingBlock:v20];
    }
    id v14 = objc_alloc(MEMORY[0x1E4F84620]);
    uint64_t v15 = (void *)[v10 copy];
    uint64_t v16 = (void *)[v14 initWithCounterpartHandles:v15 transactionSourceCollection:v7 paymentDataProvider:self->_paymentServiceDataProvider];
  }
  else
  {
    id v17 = objc_alloc(MEMORY[0x1E4F84620]);
    v18 = [v6 merchant];
    uint64_t v16 = (void *)[v17 initWithMerchant:v18 transactionSourceCollection:v7 paymentDataProvider:self->_paymentServiceDataProvider];
  }

  return v16;
}

void __101__PKPaymentTransactionDetailsFactory__transactionFetcherWithTransactionSourceCollection_transaction___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 value];
  if (v3)
  {
    v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    v3 = v4;
  }
}

void __101__PKPaymentTransactionDetailsFactory__transactionFetcherWithTransactionSourceCollection_transaction___block_invoke_2(uint64_t a1, void *a2)
{
  v3 = [a2 value];
  id v5 = [v3 fullyQualifiedDigits];

  v4 = v5;
  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    v4 = v5;
  }
}

- (id)detailViewControllerForTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 bankConnectInstitution:(id)a8 physicalCards:(id)a9
{
  id v15 = a8;
  id v16 = a9;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  if ([v21 transactionType] == 14)
  {
    v22 = [PKInstallmentPlanDetailsViewController alloc];
    uint64_t v23 = [v21 installmentPlan];

    uint64_t v24 = [MEMORY[0x1E4F84270] sharedInstance];
    v25 = [(PKInstallmentPlanDetailsViewController *)v22 initWithAccount:v18 installmentPlan:v23 accountService:v24 accountUserCollection:v17 familyMemberCollection:v19 transactionSourceCollection:v20];

    id v17 = v18;
    id v18 = v19;
    id v19 = v20;
    id v20 = (id)v24;
    id v21 = (id)v23;
  }
  else
  {
    LOBYTE(v27) = 1;
    v25 = [[PKPaymentTransactionDetailViewController alloc] initWithTransaction:v21 transactionSourceCollection:v20 familyCollection:v19 account:v18 accountUserCollection:v17 bankConnectInstitution:v15 physicalCards:v16 contactResolver:self->_contactResolver peerPaymentWebService:self->_peerPaymentWebService paymentServiceDataProvider:self->_paymentServiceDataProvider detailViewStyle:self->_detailViewStyle allowTransactionLinks:v27];
  }

  return v25;
}

- (id)historyViewControllerForTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  uint64_t v20 = [v14 transactionType];
  if (v20 == 10)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F84D10]);
    [v21 setType:9];
    [v14 amount];
    v34 = self;
    uint64_t v27 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
    v28 = [v14 currencyCode];
    v29 = PKCurrencyAmountCreate(v27, v28);
    [v21 setTotalAmount:v29];

    id v35 = v14;
    v25 = (void *)MEMORY[0x1E4F1C978];
    v26 = &v35;
    goto LABEL_5;
  }
  if (v20 == 11)
  {
    id v21 = objc_alloc_init(MEMORY[0x1E4F84D10]);
    [v21 setType:7];
    v22 = [v14 amount];
    uint64_t v23 = [v14 currencyCode];
    PKCurrencyAmountCreate(v22, v23);
    uint64_t v24 = v34 = self;
    [v21 setTotalAmount:v24];

    v36[0] = v14;
    v25 = (void *)MEMORY[0x1E4F1C978];
    v26 = (id *)v36;
LABEL_5:
    v30 = [v25 arrayWithObjects:v26 count:1];
    [v21 setTransactions:v30];

    [v21 setTransactionCount:1];
    v31 = [[PKTransactionHistoryViewController alloc] initWithTransactionGroup:v21 transactionSourceCollection:v15 familyCollection:v16 account:v17 accountUserCollection:v18 physicalCards:v19 fetcher:0 transactionHistory:0 detailViewStyle:v34->_detailViewStyle];
    goto LABEL_7;
  }
  id v21 = [(PKPaymentTransactionDetailsFactory *)self _transactionFetcherWithTransactionSourceCollection:v15 transaction:v14];
  v31 = [[PKTransactionHistoryViewController alloc] initWithFetcher:v21 transactionSourceCollection:v15 familyCollection:v16 account:v17 accountUserCollection:v18 physicalCards:v19 featuredTransaction:v14 selectedTransactions:0 transactionHistory:0];
LABEL_7:
  v32 = v31;

  return v32;
}

- (void)historyViewControllerForTransaction:(id)a3 transactionSourceCollection:(id)a4 familyCollection:(id)a5 account:(id)a6 accountUserCollection:(id)a7 physicalCards:(id)a8 completion:(id)a9
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (v21)
  {
    uint64_t v22 = [v15 transactionType];
    if (v22 == 10)
    {
      v36 = self;
      uint64_t v23 = (PKTransactionHistoryViewController *)objc_alloc_init(MEMORY[0x1E4F84D10]);
      [(PKTransactionHistoryViewController *)v23 setType:9];
      [v15 amount];
      id v37 = v17;
      v30 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      [v15 currencyCode];
      id v26 = v18;
      v31 = (NSString *)objc_claimAutoreleasedReturnValue();
      v32 = PKCurrencyAmountCreate(v30, v31);
      [(PKTransactionHistoryViewController *)v23 setTotalAmount:v32];

      id v18 = v26;
      id v47 = v15;
      v28 = (void *)MEMORY[0x1E4F1C978];
      v29 = &v47;
    }
    else
    {
      if (v22 != 11)
      {
        id v35 = [(PKPaymentTransactionDetailsFactory *)self _transactionFetcherWithTransactionSourceCollection:v16 transaction:v15];
        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __174__PKPaymentTransactionDetailsFactory_historyViewControllerForTransaction_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_completion___block_invoke;
        v38[3] = &unk_1E59CC538;
        v39 = v35;
        id v40 = v16;
        id v41 = v17;
        id v42 = v18;
        id v43 = v19;
        id v44 = v20;
        id v45 = v15;
        id v46 = v21;
        uint64_t v23 = v35;
        [(PKTransactionHistoryViewController *)v23 reloadTransactionsWithCompletion:v38];

        v34 = v39;
        goto LABEL_8;
      }
      v36 = self;
      uint64_t v23 = (PKTransactionHistoryViewController *)objc_alloc_init(MEMORY[0x1E4F84D10]);
      [(PKTransactionHistoryViewController *)v23 setType:7];
      uint64_t v24 = [v15 amount];
      [v15 currencyCode];
      id v37 = v17;
      v25 = (NSString *)objc_claimAutoreleasedReturnValue();
      PKCurrencyAmountCreate(v24, v25);
      uint64_t v27 = v26 = v18;
      [(PKTransactionHistoryViewController *)v23 setTotalAmount:v27];

      id v18 = v26;
      v48[0] = v15;
      v28 = (void *)MEMORY[0x1E4F1C978];
      v29 = (id *)v48;
    }
    v33 = [v28 arrayWithObjects:v29 count:1];
    [(PKTransactionHistoryViewController *)v23 setTransactions:v33];

    id v17 = v37;
    [(PKTransactionHistoryViewController *)v23 setTransactionCount:1];
    v34 = [[PKTransactionHistoryViewController alloc] initWithTransactionGroup:v23 transactionSourceCollection:v16 familyCollection:v37 account:v26 accountUserCollection:v19 physicalCards:v20 fetcher:0 transactionHistory:0 detailViewStyle:v36->_detailViewStyle];
    (*((void (**)(id, PKTransactionHistoryViewController *))v21 + 2))(v21, v34);
LABEL_8:
  }
}

void __174__PKPaymentTransactionDetailsFactory_historyViewControllerForTransaction_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_completion___block_invoke(id *a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __174__PKPaymentTransactionDetailsFactory_historyViewControllerForTransaction_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_completion___block_invoke_2;
  block[3] = &unk_1E59CC510;
  id v6 = a1[4];
  id v7 = a1[5];
  id v8 = a1[6];
  id v9 = a1[7];
  id v10 = a1[8];
  id v11 = a1[9];
  id v12 = a1[10];
  id v13 = v3;
  id v14 = a1[11];
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __174__PKPaymentTransactionDetailsFactory_historyViewControllerForTransaction_transactionSourceCollection_familyCollection_account_accountUserCollection_physicalCards_completion___block_invoke_2(void *a1)
{
  v2 = [[PKTransactionHistoryViewController alloc] initWithFetcher:a1[4] transactionSourceCollection:a1[5] familyCollection:a1[6] account:a1[7] accountUserCollection:a1[8] physicalCards:a1[9] featuredTransaction:a1[10] selectedTransactions:0 transactionHistory:a1[11]];
  (*(void (**)(void))(a1[12] + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentServiceDataProvider, 0);
  objc_storeStrong((id *)&self->_peerPaymentWebService, 0);

  objc_storeStrong((id *)&self->_contactResolver, 0);
}

@end