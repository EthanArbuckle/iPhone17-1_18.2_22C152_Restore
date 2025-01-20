@interface PKPaymentMethodRemovedSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (PKPaymentMethodRemovedSectionController)initWithPaymentMethodName:(id)a3 paymentMethodIdentifier:(id)a4;
- (id)cellRegistrationForItem:(id)a3;
- (id)identifiers;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
@end

@implementation PKPaymentMethodRemovedSectionController

- (PKPaymentMethodRemovedSectionController)initWithPaymentMethodName:(id)a3 paymentMethodIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentMethodRemovedSectionController;
  v9 = [(PKPaymentMethodRemovedSectionController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_removedPaymentMethodName, a3);
    objc_storeStrong((id *)&v10->_removedPaymentMethodIdentifier, a4);
    v11 = PKLocalizedPaymentString(&cfstr_PassDetailsAut_3.isa);
    v12 = objc_msgSend(v11, "pk_uppercaseStringForPreferredLocale");
    [(PKDynamicListSectionController *)v10 setHeaderText:v12];
  }
  return v10;
}

- (id)identifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"removedpass";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  if (self->_removedPaymentMethodName && self->_removedPaymentMethodIdentifier)
  {
    v6 = [[PKPaymentMethodSelectionItem alloc] initWithIdentifier:self->_removedPaymentMethodIdentifier];
    [(PKPaymentMethodSelectionItem *)v6 setPaymentMethodName:self->_removedPaymentMethodName];
    v9[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [v5 appendItems:v7];
  }

  return v5;
}

- (id)cellRegistrationForItem:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v4 = objc_opt_class();

  return (id)[v3 registrationWithCellClass:v4 configurationHandler:&__block_literal_global_277];
}

uint64_t __67__PKPaymentMethodRemovedSectionController_cellRegistrationForItem___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 configureWithItem:a4];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedPaymentMethodIdentifier, 0);

  objc_storeStrong((id *)&self->_removedPaymentMethodName, 0);
}

@end