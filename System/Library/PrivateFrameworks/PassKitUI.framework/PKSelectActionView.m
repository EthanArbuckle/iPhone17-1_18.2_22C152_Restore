@interface PKSelectActionView
- (PKPaymentPassAction)selectedAction;
- (PKSelectActionView)initWithPass:(id)a3 actions:(id)a4 actionType:(unint64_t)a5 balanceDictionary:(id)a6;
- (PKSelectActionViewDelegate)delegate;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_balanceForTopUpAction:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addSubviews;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setSelectedAction:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PKSelectActionView

- (PKSelectActionView)initWithPass:(id)a3 actions:(id)a4 actionType:(unint64_t)a5 balanceDictionary:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)PKSelectActionView;
  v14 = [(PKSelectActionView *)&v27 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pass, a3);
    selectedAction = v15->_selectedAction;
    v15->_selectedAction = 0;

    v15->_actionType = a5;
    objc_storeStrong((id *)&v15->_balances, a6);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __72__PKSelectActionView_initWithPass_actions_actionType_balanceDictionary___block_invoke;
    v26[3] = &__block_descriptor_40_e36_B32__0__PKPaymentPassAction_8Q16_B24l;
    v26[4] = a5;
    uint64_t v17 = objc_msgSend(v12, "pk_objectsPassingTest:", v26);
    actions = v15->_actions;
    v15->_actions = (NSArray *)v17;

    v19 = PKLocalizedPaymentString(&cfstr_MultipleBalanc.isa);
    v20 = PKLocalizedPaymentString(&cfstr_MultipleBalanc_0.isa);
    if (v15->_actionType == 2)
    {
      uint64_t v21 = PKPassLocalizedStringWithFormat();

      uint64_t v22 = PKPassLocalizedStringWithFormat();

      v19 = (void *)v21;
      v20 = (void *)v22;
    }
    v23 = [[PKSelectActionHeader alloc] initWithTitle:v19 subtitle:v20];
    actionHeader = v15->_actionHeader;
    v15->_actionHeader = v23;

    [(PKSelectActionView *)v15 _addSubviews];
  }

  return v15;
}

BOOL __72__PKSelectActionView_initWithPass_actions_actionType_balanceDictionary___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == *(void *)(a1 + 32);
}

- (id)_balanceForTopUpAction:(id)a3
{
  id v4 = a3;
  if ([v4 type] != 1)
  {
    v7 = 0;
    goto LABEL_15;
  }
  v5 = [v4 associatedEnteredValueIdentifier];
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v5, 0);
    v7 = [(NSDictionary *)self->_balances objectForKeyedSubscript:v6];
  }
  else
  {
    v7 = 0;
  }
  uint64_t v8 = [v4 relevantPropertyIdentifier];
  v9 = (void *)v8;
  if (v7 || !v8)
  {
    if (v5 || v7 || v8) {
      goto LABEL_14;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v10 = objc_msgSend(v11, "initWithObjects:", *MEMORY[0x1E4F87980], 0);
  }
  else
  {
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v8, 0);
  }
  id v12 = (void *)v10;
  v7 = [(NSDictionary *)self->_balances objectForKeyedSubscript:v10];

LABEL_14:
LABEL_15:

  return v7;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKSelectActionView;
  [(PKSelectActionView *)&v4 layoutSubviews];
  tableView = self->_tableView;
  [(PKSelectActionView *)self bounds];
  -[UITableView setFrame:](tableView, "setFrame:");
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v9 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v9);
  [v9 setRightBarButtonEnabled:self->_selectedAction != 0];

  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = WeakRetained;
  if (self->_selectedAction)
  {
    objc_msgSend(WeakRetained, "selectActionViewDidSelectAction:");
  }
  else
  {
    uint64_t v8 = -[NSArray objectAtIndexedSubscript:](self->_actions, "objectAtIndexedSubscript:");
    [v7 selectActionViewDidSelectAction:v8];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_actions count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"PKSelectActionCellIdentifier"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"PKSelectActionCellIdentifier"];
  }
  -[NSArray objectAtIndexedSubscript:](self->_actions, "objectAtIndexedSubscript:", [v6 row]);
  uint64_t v8 = (PKPaymentPassAction *)objc_claimAutoreleasedReturnValue();
  id v9 = [(PKPaymentPassAction *)v8 title];
  id v10 = [(PKPaymentPassAction *)v8 actionDescription];
  unint64_t actionType = self->_actionType;
  if (actionType == 1)
  {
    uint64_t v17 = [(PKSelectActionView *)self _balanceForTopUpAction:v8];
    id v13 = v17;
    if (v17)
    {
      uint64_t v18 = [v17 localizedTitle];

      uint64_t v19 = [v13 formattedValue];

      id v10 = (id)v19;
      id v9 = (id)v18;
    }
  }
  else
  {
    if (actionType != 2) {
      goto LABEL_9;
    }
    id v12 = [(PKPaymentPassAction *)v8 associatedPlan];
    id v13 = [v12 title];

    v14 = [v13 label];

    v15 = [v13 value];

    PKCommutePlanFieldEitherLabelOrValueIsEmpty();
    v16 = [(PKPass *)self->_pass paymentPass];
    v31 = v15;
    PKCommutePlanFormatTitleFromLabelAndValue();
    id v9 = v14;

    id v10 = v15;
  }

LABEL_9:
  v20 = objc_msgSend(v7, "textLabel", v31);
  [v20 setText:v9];
  uint64_t v21 = [MEMORY[0x1E4FB1618] labelColor];
  [v20 setTextColor:v21];

  uint64_t v22 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v20 setFont:v22];

  v23 = [v7 detailTextLabel];
  [v23 setText:v10];
  v24 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [v23 setFont:v24];

  v25 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v23 setTextColor:v25];

  [v7 setSelectionStyle:0];
  selectedAction = self->_selectedAction;
  if (selectedAction != v8 || selectedAction == 0) {
    uint64_t v28 = 0;
  }
  else {
    uint64_t v28 = 3;
  }
  [v7 setAccessoryType:v28];
  v29 = PKProvisioningSecondaryBackgroundColor();
  [v7 setBackgroundColor:v29];

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 120.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return self->_actionHeader;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  p_selectedAction = &self->_selectedAction;
  id v9 = self->_selectedAction;
  -[NSArray objectAtIndex:](self->_actions, "objectAtIndex:", [v7 row]);
  id v10 = (PKPaymentPassAction *)objc_claimAutoreleasedReturnValue();
  if (v9 != v10)
  {
    objc_storeStrong((id *)&self->_selectedAction, v10);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained setRightBarButtonEnabled:*p_selectedAction != 0];

    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      [v14 selectActionViewDidSelectAction:*p_selectedAction];
    }
    NSUInteger v15 = [(NSArray *)self->_actions indexOfObject:v9];
    v16 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v15, objc_msgSend(v7, "section"));
    v18[0] = v16;
    v18[1] = v7;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    [v6 reloadRowsAtIndexPaths:v17 withRowAnimation:5];
  }
}

- (void)_addSubviews
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  objc_super v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setScrollEnabled:1];
  [(UITableView *)self->_tableView setAlwaysBounceVertical:1];
  id v6 = self->_tableView;
  id v7 = PKProvisioningBackgroundColor();
  [(UITableView *)v6 setBackgroundColor:v7];

  uint64_t v8 = self->_tableView;

  [(PKSelectActionView *)self addSubview:v8];
}

- (PKPaymentPassAction)selectedAction
{
  return self->_selectedAction;
}

- (void)setSelectedAction:(id)a3
{
}

- (PKSelectActionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKSelectActionViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_actionHeader, 0);
  objc_storeStrong((id *)&self->_balances, 0);
  objc_storeStrong((id *)&self->_actions, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end