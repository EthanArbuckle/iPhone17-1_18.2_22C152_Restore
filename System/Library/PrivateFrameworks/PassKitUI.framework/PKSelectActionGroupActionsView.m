@interface PKSelectActionGroupActionsView
- (BOOL)isLoading;
- (PKPaymentPassAction)selectedAction;
- (PKSelectActionGroupActionsView)initWithPass:(id)a3 actionGroup:(id)a4;
- (PKSelectActionGroupActionsViewDelegate)delegate;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addSubviews;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setLoading:(BOOL)a3;
- (void)setSelectedAction:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PKSelectActionGroupActionsView

- (PKSelectActionGroupActionsView)initWithPass:(id)a3 actionGroup:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKSelectActionGroupActionsView;
  v9 = [(PKSelectActionGroupActionsView *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pass, a3);
    selectedAction = v10->_selectedAction;
    v10->_selectedAction = 0;

    objc_storeStrong((id *)&v10->_actionGroup, a4);
    uint64_t v12 = [v8 actions];
    actions = v10->_actions;
    v10->_actions = (NSArray *)v12;

    v14 = [PKSelectActionGroupActionsHeader alloc];
    v15 = PKLocalizedPaymentString(&cfstr_ActionGroupCho.isa);
    v16 = PKLocalizedPaymentString(&cfstr_ActionGroupCho_0.isa);
    uint64_t v17 = [(PKSelectActionGroupActionsHeader *)v14 initWithPass:v7 title:v15 subtitle:v16];
    actionGroupActionsHeader = v10->_actionGroupActionsHeader;
    v10->_actionGroupActionsHeader = (PKSelectActionGroupActionsHeader *)v17;

    [(PKSelectActionGroupActionsView *)v10 _addSubviews];
  }

  return v10;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKSelectActionGroupActionsView;
  [(PKSelectActionGroupActionsView *)&v4 layoutSubviews];
  tableView = self->_tableView;
  [(PKSelectActionGroupActionsView *)self bounds];
  -[UITableView setFrame:](tableView, "setFrame:");
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v6);
  [v6 setRightBarButtonEnabled:self->_selectedAction != 0];
}

- (void)setLoading:(BOOL)a3
{
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
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"PKSelectActionGroupActionCellIdentifier"];
  if (!v7) {
    id v7 = [[PKCommutePlanDetailsTableViewCell alloc] initWithStyle:3 reuseIdentifier:@"PKSelectActionGroupActionCellIdentifier"];
  }
  id v8 = v7;
  -[NSArray objectAtIndexedSubscript:](self->_actions, "objectAtIndexedSubscript:", [v6 row]);
  v9 = (PKPaymentPassAction *)objc_claimAutoreleasedReturnValue();
  v10 = [(PKPaymentPassAction *)v9 title];
  v18 = [(PKPaymentPassAction *)v9 actionDescription];
  PKCommutePlanFormatTitleFromLabelAndValue();
  id v11 = v10;

  id v12 = v18;
  [(PKCommutePlanDetailsTableViewCell *)v8 setPrimaryText:v11];
  [(PKCommutePlanDetailsTableViewCell *)v8 setSecondaryText:v12];
  [(PKCommutePlanDetailsTableViewCell *)v8 setSelectionStyle:0];
  selectedAction = self->_selectedAction;

  if (selectedAction != v9 || selectedAction == 0) {
    uint64_t v15 = 0;
  }
  else {
    uint64_t v15 = 3;
  }
  -[PKCommutePlanDetailsTableViewCell setAccessoryType:](v8, "setAccessoryType:", v15, v18);
  v16 = PKProvisioningSecondaryBackgroundColor();
  [(PKCommutePlanDetailsTableViewCell *)v8 setBackgroundColor:v16];

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if ([(PKSelectActionGroupActionsHeader *)self->_actionGroupActionsHeader isLoading])
  {
    [(PKSelectActionGroupActionsView *)self bounds];
    return v5;
  }
  else
  {
    actionGroupActionsHeader = self->_actionGroupActionsHeader;
    [(PKSelectActionGroupActionsView *)self bounds];
    -[PKSelectActionGroupActionsHeader sizeThatFits:](actionGroupActionsHeader, "sizeThatFits:", v8, 1.79769313e308);
    return v9;
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return self->_actionGroupActionsHeader;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  p_selectedAction = &self->_selectedAction;
  double v9 = self->_selectedAction;
  -[NSArray objectAtIndex:](self->_actions, "objectAtIndex:", [v7 row]);
  v10 = (PKPaymentPassAction *)objc_claimAutoreleasedReturnValue();
  if (v9 != v10)
  {
    objc_storeStrong((id *)&self->_selectedAction, v10);
    p_delegate = &self->_delegate;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained setRightBarButtonEnabled:*p_selectedAction != 0];

    if (v9)
    {
      NSUInteger v13 = [(NSArray *)self->_actions indexOfObject:v9];
      v14 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v13, objc_msgSend(v7, "section"));
      v19[0] = v14;
      v19[1] = v7;
      uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
      [v6 reloadRowsAtIndexPaths:v15 withRowAnimation:5];
    }
    else
    {
      v20[0] = v7;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
      [v6 reloadRowsAtIndexPaths:v14 withRowAnimation:5];
    }

    id v16 = objc_loadWeakRetained((id *)p_delegate);
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      id v18 = objc_loadWeakRetained((id *)p_delegate);
      [v18 selectActionGroupActionsViewDidSelectActionGroupAction:*p_selectedAction];
    }
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

  double v8 = self->_tableView;

  [(PKSelectActionGroupActionsView *)self addSubview:v8];
}

- (PKPaymentPassAction)selectedAction
{
  return self->_selectedAction;
}

- (void)setSelectedAction:(id)a3
{
}

- (PKSelectActionGroupActionsViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKSelectActionGroupActionsViewDelegate *)WeakRetained;
}

- (BOOL)isLoading
{
  return self->_loading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_actionGroupActionsHeader, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_actionGroup, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end