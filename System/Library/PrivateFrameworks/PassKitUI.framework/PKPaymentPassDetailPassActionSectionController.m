@interface PKPaymentPassDetailPassActionSectionController
+ (BOOL)validForPaymentPass:(id)a3;
- (PKPaymentPassDetailPassActionSectionController)initWithPass:(id)a3 viewStyle:(int64_t)a4 paymentDataProvider:(id)a5 webService:(id)a6 transitBalanceModel:(id)a7 delegate:(id)a8;
- (PKPaymentPassDetailPassActionSectionControllerDelegate)delegate;
- (PKTransitBalanceModel)transitBalanceModel;
- (id)allSectionIdentifiers;
- (id)sectionIdentifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4;
- (void)_computeActionBundle;
- (void)setDelegate:(id)a3;
- (void)setTransitBalanceModel:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5;
@end

@implementation PKPaymentPassDetailPassActionSectionController

- (PKPaymentPassDetailPassActionSectionController)initWithPass:(id)a3 viewStyle:(int64_t)a4 paymentDataProvider:(id)a5 webService:(id)a6 transitBalanceModel:(id)a7 delegate:(id)a8
{
  id v15 = a3;
  id v16 = a5;
  id v24 = a6;
  id v23 = a7;
  id v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PKPaymentPassDetailPassActionSectionController;
  v18 = [(PKPaymentPassDetailSectionController *)&v25 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_pass, a3);
    v19->_viewStyle = a4;
    objc_storeWeak((id *)&v19->_delegate, v17);
    objc_storeStrong((id *)&v19->_transitBalanceModel, a7);
    objc_storeStrong((id *)&v19->_webService, a6);
    uint64_t v20 = +[PKPaymentPassDetailAutoReloadSectionController enteredValueActionForPass:v19->_pass];
    action = v19->_action;
    v19->_action = (PKPaymentPassAction *)v20;

    objc_storeStrong((id *)&v19->_paymentDataProvider, a5);
    [(PKPaymentPassDetailPassActionSectionController *)v19 _computeActionBundle];
  }

  return v19;
}

- (id)allSectionIdentifiers
{
  v4[2] = *MEMORY[0x1E4F143B8];
  v4[0] = @"AddMoneySection";
  v4[1] = @"BuyPassesSection";
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:2];

  return v2;
}

- (void)setTransitBalanceModel:(id)a3
{
  v5 = (PKTransitBalanceModel *)a3;
  if (v5 && self->_transitBalanceModel != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_transitBalanceModel, a3);
    [(PKPaymentPassDetailPassActionSectionController *)self _computeActionBundle];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = [(PKPaymentPassDetailPassActionSectionController *)self sectionIdentifiers];
    [WeakRetained reloadSections:v7];

    v5 = v8;
  }
}

- (id)sectionIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (![(PKPaymentPassDetailSectionController *)self currentSegment])
  {
    uint64_t v4 = +[PKPaymentPassDetailAutoReloadSectionController enteredValueActionForPass:self->_pass];
    if (v4)
    {
      v5 = (void *)v4;
      int v6 = [(PKTransitBalanceModel *)self->_transitBalanceModel hasBalanceContent];

      if (v6) {
        [v3 addObject:@"AddMoneySection"];
      }
    }
    v7 = [(PKPaymentPass *)self->_pass actionGroups];
    uint64_t v8 = [v7 count];

    if (v8) {
      [v3 addObject:@"BuyPassesSection"];
    }
  }
  v9 = (void *)[v3 copy];

  return v9;
}

+ (BOOL)validForPaymentPass:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 devicePrimaryPaymentApplication];
  [v4 state];
  int IsPersonalized = PKPaymentApplicationStateIsPersonalized();

  if (IsPersonalized)
  {
    int v6 = +[PKPaymentPassDetailAutoReloadSectionController enteredValueActionForPass:v3];

    if (v6)
    {
      LOBYTE(v7) = 1;
    }
    else
    {
      uint64_t v8 = [v3 actionGroups];
      BOOL v7 = [v8 count] != 0;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSectionIdentifier:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if (PKEqualObjects())
  {
    v9 = PKPassLocalizedStringWithFormat();
    v10 = -[PKPaymentPassDetailSectionController linkCellWithText:forTableView:](self, "linkCellWithText:forTableView:", v9, v7, 0);

    PKAccessibilityIDCellSet(v10, (void *)*MEMORY[0x1E4F851D0]);
  }
  else if (PKEqualObjects())
  {
    v11 = [(PKPaymentPass *)self->_pass actionGroups];
    v12 = [v11 firstObject];
    v13 = [v12 title];

    v14 = [(PKPaymentPass *)self->_pass paymentPass];
    id v15 = [v14 actionLocalizations];

    if (v13) {
      BOOL v16 = v15 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (!v16)
    {
      uint64_t v17 = [v15 objectForKeyedSubscript:v13];

      v13 = (void *)v17;
    }
    if (!v13)
    {
      uint64_t v20 = 0;
      id v18 = (id)PKPassLocalizedStringWithFormat();
    }
    v10 = -[PKPaymentPassDetailSectionController linkCellWithText:forTableView:](self, "linkCellWithText:forTableView:", v13, v7, v20);
    PKAccessibilityIDCellSet(v10, (void *)*MEMORY[0x1E4F85318]);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4 sectionIdentifier:(id)a5
{
  id v8 = a5;
  [a3 deselectRowAtIndexPath:a4 animated:1];
  if (PKEqualObjects())
  {
    id v13 = 0;
    uint64_t v14 = 1;
    char v9 = [(PKPaymentPass *)self->_pass canPerformAction:self->_action unableReason:&v14 displayableError:&v13];
    id v10 = v13;
    if ((v9 & 1) != 0 || v14 == 2)
    {
      v11 = [[PKPerformActionViewController alloc] initWithPass:self->_pass action:self->_action viewStyle:self->_viewStyle paymentDataProvider:self->_paymentDataProvider];
    }
    else
    {
      v11 = +[PKPerformActionViewController alertControllerForUnableReason:v14 action:self->_action displayableError:v10 addCardActionHandler:0];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained presentPassActionViewController:v11];

    goto LABEL_9;
  }
  if (PKEqualObjects())
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 presentCombinedPassActionViewControllerFromBundle:self->_actionBundle];
LABEL_9:
  }
}

- (void)_computeActionBundle
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPaymentPass *)self->_pass actionGroups];
  id v4 = objc_alloc_init(MEMORY[0x1E4F84B60]);
  [v4 setActionGroups:v3];
  v5 = [(PKTransitBalanceModel *)self->_transitBalanceModel filteredActionsForDisplayableEntities];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (void)v14) == 2
          && [v12 isActionAvailable]
          && ([v12 unavailableActionBehavior] & 2) == 0)
        {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  [v4 setOrAddActions:v6];
  actionBundle = self->_actionBundle;
  self->_actionBundle = (PKPaymentPassActionBundle *)v4;
}

- (PKPaymentPassDetailPassActionSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPaymentPassDetailPassActionSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PKTransitBalanceModel)transitBalanceModel
{
  return self->_transitBalanceModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitBalanceModel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_actionBundle, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_paymentDataProvider, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end