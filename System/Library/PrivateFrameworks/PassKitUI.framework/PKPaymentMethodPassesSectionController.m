@interface PKPaymentMethodPassesSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (PKPaymentMethodPassesSectionController)initWithDelegate:(id)a3 request:(id)a4 selectedPass:(id)a5;
- (id)cellRegistrationForItem:(id)a3;
- (id)identifiers;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
- (void)didSelectItem:(id)a3;
@end

@implementation PKPaymentMethodPassesSectionController

- (PKPaymentMethodPassesSectionController)initWithDelegate:(id)a3 request:(id)a4 selectedPass:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentMethodPassesSectionController;
  v11 = [(PKPaymentMethodPassesSectionController *)&v15 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_request, a4);
    objc_storeStrong((id *)&v12->_selectedPass, a5);
    v13 = PKLocalizedPaymentString(&cfstr_PaymentMethodP.isa);
    [(PKDynamicListSectionController *)v12 setHeaderText:v13];
  }
  return v12;
}

- (id)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"passes";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 1;
}

- (void)didSelectItem:(id)a3
{
  v4 = [a3 paymentPass];
  selectedPass = self->_selectedPass;
  self->_selectedPass = v4;
  v6 = v4;

  self = (PKPaymentMethodPassesSectionController *)((char *)self + 64);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super.isa);
  [WeakRetained reloadDataAnimated:1];

  id v8 = objc_loadWeakRetained((id *)&self->super.super.isa);
  [v8 selectedPass:v6];
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v26 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v5 = [MEMORY[0x1E4F84898] sharedInstance];
  v6 = [v5 _sortedPaymentPassesForPaymentRequest:self->_request];
  passes = self->_passes;
  self->_passes = v6;

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obj = self->_passes;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v14 = [PKPaymentMethodSelectionItem alloc];
        objc_super v15 = [v13 uniqueID];
        v16 = [(PKPaymentMethodSelectionItem *)v14 initWithIdentifier:v15];

        [(PKPaymentMethodSelectionItem *)v16 setPaymentPass:v13];
        v17 = [(PKPaymentPass *)self->_selectedPass uniqueID];
        v18 = [v13 uniqueID];
        id v19 = v17;
        id v20 = v18;
        v21 = v20;
        if (v19 == v20)
        {
          uint64_t v23 = 1;
        }
        else
        {
          if (v19) {
            BOOL v22 = v20 == 0;
          }
          else {
            BOOL v22 = 1;
          }
          if (v22) {
            uint64_t v23 = 0;
          }
          else {
            uint64_t v23 = [v19 isEqualToString:v20];
          }
        }

        [(PKPaymentMethodSelectionItem *)v16 setSelected:v23];
        [v8 addObject:v16];
      }
      uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }

  v24 = (void *)[v8 copy];
  [v26 appendItems:v24];

  return v26;
}

- (id)cellRegistrationForItem:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 registrationWithCellClass:v4 configurationHandler:&__block_literal_global_262];
}

uint64_t __66__PKPaymentMethodPassesSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 configureWithItem:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_selectedPass, 0);
  objc_storeStrong((id *)&self->_passes, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end