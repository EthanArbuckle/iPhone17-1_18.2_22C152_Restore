@interface PKTransactionSupportStatementNameSectionController
- (BOOL)shouldHighlightItem:(id)a3;
- (PKTransactionSupportStatementNameSectionController)initWithMerchantStatementName:(id)a3;
- (id)_decorateListCell:(id)a3 forRowItem:(id)a4;
- (id)headerAttributedStringForIdentifier:(id)a3;
- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4;
@end

@implementation PKTransactionSupportStatementNameSectionController

- (PKTransactionSupportStatementNameSectionController)initWithMerchantStatementName:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKTransactionSupportStatementNameSectionController;
  v6 = [(PKPaymentSetupListSectionController *)&v18 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_merchantStatementName, a3);
    objc_initWeak(&location, v7);
    v8 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v9 = objc_opt_class();
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __84__PKTransactionSupportStatementNameSectionController_initWithMerchantStatementName___block_invoke;
    v15 = &unk_1E59CBB38;
    objc_copyWeak(&v16, &location);
    v10 = [v8 registrationWithCellClass:v9 configurationHandler:&v12];
    -[PKPaymentSetupListSectionController setCellRegistration:](v7, "setCellRegistration:", v10, v12, v13, v14, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __84__PKTransactionSupportStatementNameSectionController_initWithMerchantStatementName___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v8 = (id)[WeakRetained _decorateListCell:v9 forRowItem:v6];
  }
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = PKLocalizedPaymentString(&cfstr_TransactionDet_27.isa);
  v4 = [v3 localizedUppercaseString];

  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  v11[0] = *MEMORY[0x1E4FB06F8];
  id v6 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2950], (void *)*MEMORY[0x1E4FB27D0], 0, 0);
  v12[0] = v6;
  v11[1] = *MEMORY[0x1E4FB0700];
  v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v12[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = (void *)[v5 initWithString:v4 attributes:v8];

  return v9;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1358]);
  v8[0] = self->_merchantStatementName;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v5 appendItems:v6];

  return v5;
}

- (BOOL)shouldHighlightItem:(id)a3
{
  return 0;
}

- (id)_decorateListCell:(id)a3 forRowItem:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4FB1948];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 valueCellConfiguration];
  [v8 setText:v6];

  [v7 setContentConfiguration:v8];

  return v8;
}

- (void).cxx_destruct
{
}

@end