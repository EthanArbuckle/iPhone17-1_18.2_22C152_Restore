@interface PKSelectActionGroupView
- (PKPaymentPassActionGroup)selectedActionGroup;
- (PKSelectActionGroupView)initWithPass:(id)a3 actionGroups:(id)a4;
- (PKSelectActionGroupViewDelegate)delegate;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addSubviews;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setSelectedActionGroup:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PKSelectActionGroupView

- (PKSelectActionGroupView)initWithPass:(id)a3 actionGroups:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKSelectActionGroupView;
  v9 = [(PKSelectActionGroupView *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pass, a3);
    selectedActionGroup = v10->_selectedActionGroup;
    v10->_selectedActionGroup = 0;

    uint64_t v12 = [v8 copy];
    actionGroups = v10->_actionGroups;
    v10->_actionGroups = (NSArray *)v12;

    v14 = [[PKSelectActionGroupHeader alloc] initWithTitle:@"Choose Group" subtitle:@"Choose an action group for which to see actions."];
    actionGroupHeader = v10->_actionGroupHeader;
    v10->_actionGroupHeader = v14;

    [(PKSelectActionGroupView *)v10 _addSubviews];
  }

  return v10;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKSelectActionGroupView;
  [(PKSelectActionGroupView *)&v4 layoutSubviews];
  tableView = self->_tableView;
  [(PKSelectActionGroupView *)self bounds];
  -[UITableView setFrame:](tableView, "setFrame:");
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v6);
  [v6 setRightBarButtonEnabled:self->_selectedActionGroup != 0];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_actionGroups count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithIdentifier:@"PKSelectActionGroupCellIdentifier"];
  if (!v7) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"PKSelectActionGroupCellIdentifier"];
  }
  -[NSArray objectAtIndexedSubscript:](self->_actionGroups, "objectAtIndexedSubscript:", [v6 row]);
  id v8 = (PKPaymentPassActionGroup *)objc_claimAutoreleasedReturnValue();
  v9 = [(PKPaymentPassActionGroup *)v8 title];
  v10 = [(PKPaymentPassActionGroup *)v8 actionGroupDescription];
  v11 = [v7 textLabel];
  [v11 setText:v9];
  uint64_t v12 = [MEMORY[0x1E4FB1618] labelColor];
  [v11 setTextColor:v12];

  v13 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v11 setFont:v13];

  v14 = [v7 detailTextLabel];
  [v14 setText:v10];
  v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28F0]];
  [v14 setFont:v15];

  v16 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v14 setTextColor:v16];

  [v7 setSelectionStyle:0];
  selectedActionGroup = self->_selectedActionGroup;
  if (selectedActionGroup != v8 || selectedActionGroup == 0) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = 3;
  }
  [v7 setAccessoryType:v19];
  v20 = PKProvisioningSecondaryBackgroundColor();
  [v7 setBackgroundColor:v20];

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 120.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  return self->_actionGroupHeader;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  p_selectedActionGroup = &self->_selectedActionGroup;
  v9 = self->_selectedActionGroup;
  -[NSArray objectAtIndex:](self->_actionGroups, "objectAtIndex:", [v7 row]);
  v10 = (PKPaymentPassActionGroup *)objc_claimAutoreleasedReturnValue();
  if (v9 != v10)
  {
    objc_storeStrong((id *)&self->_selectedActionGroup, v10);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained setRightBarButtonEnabled:*p_selectedActionGroup != 0];

    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_delegate);
      [v14 selectActionGroupViewDidSelectActionGroup:*p_selectedActionGroup];
    }
    NSUInteger v15 = [(NSArray *)self->_actionGroups indexOfObject:v9];
    v16 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v15, objc_msgSend(v7, "section"));
    v18[0] = v16;
    v18[1] = v7;
    objc_super v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
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

  id v8 = self->_tableView;

  [(PKSelectActionGroupView *)self addSubview:v8];
}

- (PKPaymentPassActionGroup)selectedActionGroup
{
  return self->_selectedActionGroup;
}

- (void)setSelectedActionGroup:(id)a3
{
}

- (PKSelectActionGroupViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKSelectActionGroupViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedActionGroup, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_actionGroupHeader, 0);
  objc_storeStrong((id *)&self->_actionGroups, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end