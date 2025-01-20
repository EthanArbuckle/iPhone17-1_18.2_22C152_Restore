@interface PKPerformActionPurchaseNewView
- (PKPerformActionPurchaseNewView)init;
- (PKPerformActionPurchaseNewView)initWithPass:(id)a3 action:(id)a4 paymentDataProvider:(id)a5;
- (PKPerformActionViewDelegate)delegate;
- (UITextField)amountTextField;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_optionsSectionFooterText;
- (id)_optionsSectionHeaderText;
- (id)pass;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)transactionAmount;
- (id)transactionCurrency;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addSubviews;
- (void)fetchServiceProviderDataWithCompletion:(id)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation PKPerformActionPurchaseNewView

- (PKPerformActionPurchaseNewView)init
{
  return [(PKPerformActionPurchaseNewView *)self initWithPass:0 action:0 paymentDataProvider:0];
}

- (PKPerformActionPurchaseNewView)initWithPass:(id)a3 action:(id)a4 paymentDataProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PKPerformActionPurchaseNewView;
  v10 = [(PKPerformActionPurchaseNewView *)&v18 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pass, a3);
    objc_storeStrong((id *)&v11->_action, a4);
    int v12 = [(PKPerformActionPurchaseNewView *)v11 _shouldReverseLayoutDirection];
    uint64_t v13 = 2;
    if (!v12) {
      uint64_t v13 = 0;
    }
    v11->_textAlignment = v13;
    v14 = [v9 purchaseNewActionItems];
    uint64_t v15 = [v14 firstObject];
    purchaseNewItem = v11->_purchaseNewItem;
    v11->_purchaseNewItem = (PKPurchaseNewActionItem *)v15;

    [(PKPerformActionPurchaseNewView *)v11 setClipsToBounds:0];
    [(PKPerformActionPurchaseNewView *)v11 _addSubviews];
  }

  return v11;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPerformActionPurchaseNewView;
  [(PKPerformActionPurchaseNewView *)&v4 layoutSubviews];
  tableView = self->_tableView;
  [(PKPerformActionPurchaseNewView *)self bounds];
  -[UITableView setFrame:](tableView, "setFrame:");
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v6);
  [v6 setRightBarButtonEnabled:self->_purchaseNewItem != 0];
}

- (id)_optionsSectionHeaderText
{
  return (id)[(PKPaymentPassAction *)self->_action headerText];
}

- (id)_optionsSectionFooterText
{
  return (id)[(PKPaymentPassAction *)self->_action footerText];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v4 = [(PKPaymentPassAction *)self->_action purchaseNewActionItems];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"PKPerformActionPurchaseNewCellIdentifier"];
  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"PKPerformActionPurchaseNewCellIdentifier"];
  }
  id v8 = [(PKPaymentPassAction *)self->_action purchaseNewActionItems];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndex:v9];

  v11 = [(PKPurchaseNewActionItem *)v10 amount];
  int v12 = [(PKPurchaseNewActionItem *)v10 currency];
  uint64_t v13 = PKFormattedCurrencyStringFromNumber();

  v14 = [v7 textLabel];
  uint64_t v15 = [v7 detailTextLabel];
  [v14 setTextAlignment:self->_textAlignment];
  v16 = [(PKPurchaseNewActionItem *)v10 title];
  [v14 setText:v16];

  v17 = [MEMORY[0x1E4FB1618] labelColor];
  [v14 setTextColor:v17];

  [v14 setLineBreakMode:4];
  [v15 setTextAlignment:self->_textAlignment];
  [v15 setText:v13];
  objc_super v18 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v15 setTextColor:v18];

  [v7 setSelectionStyle:3];
  if (v10 == self->_purchaseNewItem) {
    uint64_t v19 = 3;
  }
  else {
    uint64_t v19 = 0;
  }
  [v7 setAccessoryType:v19];
  v20 = PKProvisioningSecondaryBackgroundColor();
  [v7 setBackgroundColor:v20];

  return v7;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 44.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  [v17 deselectRowAtIndexPath:v6 animated:1];
  v7 = self->_purchaseNewItem;
  id v8 = [(PKPaymentPassAction *)self->_action purchaseNewActionItems];
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "row"));
  uint64_t v9 = (PKPurchaseNewActionItem *)objc_claimAutoreleasedReturnValue();

  if (v7 != v9)
  {
    objc_storeStrong((id *)&self->_purchaseNewItem, v9);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained setRightBarButtonEnabled:self->_purchaseNewItem != 0];

    v11 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
    [v17 reloadSections:v11 withRowAnimation:5];

    int v12 = [(PKPaymentPassAction *)self->_action purchaseNewActionItems];
    uint64_t v13 = [v12 indexOfObject:v7];

    v14 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v13, objc_msgSend(v6, "section"));
    uint64_t v15 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v14];
    [v15 setAccessoryType:0];
    v16 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v6];
    [v16 setAccessoryType:3];
  }
}

- (id)pass
{
  return self->_pass;
}

- (id)transactionAmount
{
  purchaseNewItem = self->_purchaseNewItem;
  if (purchaseNewItem) {
    [(PKPurchaseNewActionItem *)purchaseNewItem amount];
  }
  else {
  v3 = [MEMORY[0x1E4F28C28] zero];
  }

  return v3;
}

- (id)transactionCurrency
{
  purchaseNewItem = self->_purchaseNewItem;
  if (purchaseNewItem)
  {
    purchaseNewItem = [purchaseNewItem currency];
  }

  return purchaseNewItem;
}

- (void)fetchServiceProviderDataWithCompletion:(id)a3
{
  id v4 = a3;
  int64_t v5 = v4;
  purchaseNewItem = self->_purchaseNewItem;
  if (purchaseNewItem)
  {
    v7 = [(PKPass *)self->_pass secureElementPass];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__PKPerformActionPurchaseNewView_fetchServiceProviderDataWithCompletion___block_invoke;
    v8[3] = &unk_1E59CC440;
    id v9 = v5;
    [(PKPurchaseNewActionItem *)purchaseNewItem serviceProviderDataWithItemForPass:v7 completion:v8];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __73__PKPerformActionPurchaseNewView_fetchServiceProviderDataWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (UITextField)amountTextField
{
  return 0;
}

- (void)_addSubviews
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1D00]);
  id v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setScrollEnabled:1];
  [(UITableView *)self->_tableView setAlwaysBounceVertical:1];
  id v6 = self->_tableView;
  v7 = PKProvisioningBackgroundColor();
  [(UITableView *)v6 setBackgroundColor:v7];

  id v8 = self->_tableView;

  [(PKPerformActionPurchaseNewView *)self addSubview:v8];
}

- (PKPerformActionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPerformActionViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_purchaseNewItem, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end