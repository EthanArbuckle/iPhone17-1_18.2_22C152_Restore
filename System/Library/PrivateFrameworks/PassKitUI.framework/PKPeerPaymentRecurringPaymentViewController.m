@interface PKPeerPaymentRecurringPaymentViewController
- (PKPeerPaymentRecurringPaymentViewController)initWithContext:(int64_t)a3 peerPaymentService:(id)a4 transactionSourceCollection:(id)a5 familyCollection:(id)a6;
- (void)preflightWithCompletion:(id)a3;
- (void)recurringPaymentsChanged;
- (void)reloadRecurringPaymentsWithCompletion:(id)a3;
- (void)showDetailsForRecurringPaymentIdentifier:(id)a3;
@end

@implementation PKPeerPaymentRecurringPaymentViewController

- (PKPeerPaymentRecurringPaymentViewController)initWithContext:(int64_t)a3 peerPaymentService:(id)a4 transactionSourceCollection:(id)a5 familyCollection:(id)a6
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKPeerPaymentRecurringPaymentViewController;
  v14 = [(PKDynamicCollectionViewController *)&v24 init];
  v15 = v14;
  if (v14)
  {
    v14->_context = a3;
    objc_storeStrong((id *)&v14->_peerPaymentService, a4);
    [(PKPeerPaymentService *)v15->_peerPaymentService registerObserver:v15];
    v16 = objc_alloc_init(PKPeerPaymentRecurringPaymentSectionController);
    paymentsSectionController = v15->_paymentsSectionController;
    v15->_paymentsSectionController = v16;

    [(PKPeerPaymentRecurringPaymentSectionController *)v15->_paymentsSectionController setSourceCollection:v12];
    [(PKPeerPaymentRecurringPaymentSectionController *)v15->_paymentsSectionController setFamilyCollection:v13];
    [(PKPeerPaymentRecurringPaymentSectionController *)v15->_paymentsSectionController setDelegate:v15];
    v18 = objc_alloc_init(PKPeerPaymentRecurringPaymentActionSectionController);
    v19 = [v11 account];
    [(PKPeerPaymentRecurringPaymentActionSectionController *)v18 setAccount:v19];

    [(PKPeerPaymentRecurringPaymentActionSectionController *)v18 setSourceCollection:v12];
    [(PKPeerPaymentRecurringPaymentActionSectionController *)v18 setFamilyCollection:v13];
    [(PKPeerPaymentRecurringPaymentActionSectionController *)v18 setDelegate:v15];
    v25[0] = v15->_paymentsSectionController;
    v25[1] = v18;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    [(PKDynamicCollectionViewController *)v15 setSections:v20 animated:0];

    v21 = [(PKPeerPaymentRecurringPaymentViewController *)v15 navigationItem];
    v22 = PKLocalizedPeerPaymentRecurringString(&cfstr_DashboardMoreM.isa);
    [v21 setTitle:v22];
  }
  return v15;
}

- (void)preflightWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__PKPeerPaymentRecurringPaymentViewController_preflightWithCompletion___block_invoke;
  v6[3] = &unk_1E59CAD40;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PKPeerPaymentRecurringPaymentViewController *)self reloadRecurringPaymentsWithCompletion:v6];
}

void __71__PKPeerPaymentRecurringPaymentViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1072), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)showDetailsForRecurringPaymentIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = self->_payments;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (void)v16);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        id v12 = v4;
        id v13 = v12;
        if (v11 == v12)
        {
        }
        else
        {
          if (!v4 || !v11)
          {

LABEL_16:
            continue;
          }
          int v14 = [v11 isEqualToString:v12];

          if (!v14) {
            goto LABEL_16;
          }
        }
        if ([v10 type] != 1) {
          goto LABEL_16;
        }
        int v15 = [v10 sentByMe];

        if (v15)
        {
          [(PKPeerPaymentRecurringPaymentSectionController *)self->_paymentsSectionController didSelectItem:v10];
          goto LABEL_19;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
LABEL_19:
}

- (void)reloadRecurringPaymentsWithCompletion:(id)a3
{
  id v4 = a3;
  peerPaymentService = self->_peerPaymentService;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__PKPeerPaymentRecurringPaymentViewController_reloadRecurringPaymentsWithCompletion___block_invoke;
  v7[3] = &unk_1E59CAD40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PKPeerPaymentService *)peerPaymentService recurringPaymentsWithCompletion:v7];
}

void __85__PKPeerPaymentRecurringPaymentViewController_reloadRecurringPaymentsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__PKPeerPaymentRecurringPaymentViewController_reloadRecurringPaymentsWithCompletion___block_invoke_2;
  block[3] = &unk_1E59CE110;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __85__PKPeerPaymentRecurringPaymentViewController_reloadRecurringPaymentsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "type", (void)v13) == 1 && objc_msgSend(v8, "sentByMe")) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v9 = [v2 sortedArrayUsingComparator:&__block_literal_global_190];
  id v10 = *(void **)(*(void *)(a1 + 40) + 1080);
  id v11 = (void *)[v9 copy];
  [v10 setPayments:v11];

  [*(id *)(a1 + 40) reloadDataAnimated:1];
  uint64_t v12 = *(void *)(a1 + 48);
  if (v12) {
    (*(void (**)(uint64_t, void))(v12 + 16))(v12, *(void *)(a1 + 32));
  }
}

uint64_t __85__PKPeerPaymentRecurringPaymentViewController_reloadRecurringPaymentsWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  uint64_t v5 = [a3 createdDate];
  uint64_t v6 = [v4 createdDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)recurringPaymentsChanged
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentsSectionController, 0);
  objc_storeStrong((id *)&self->_payments, 0);

  objc_storeStrong((id *)&self->_peerPaymentService, 0);
}

@end