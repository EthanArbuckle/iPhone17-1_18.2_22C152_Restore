@interface PKPerformActionSelectItemView
- (BOOL)_showsExpirationSection;
- (PKPerformActionSelectItemView)init;
- (PKPerformActionSelectItemView)initWithPass:(id)a3 action:(id)a4 paymentDataProvider:(id)a5;
- (PKPerformActionViewDelegate)delegate;
- (UITextField)amountTextField;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)_optionsSectionFooterText;
- (id)_optionsSectionHeaderText;
- (id)pass;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
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

@implementation PKPerformActionSelectItemView

- (PKPerformActionSelectItemView)init
{
  return [(PKPerformActionSelectItemView *)self initWithPass:0 action:0 paymentDataProvider:0];
}

- (PKPerformActionSelectItemView)initWithPass:(id)a3 action:(id)a4 paymentDataProvider:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PKPerformActionSelectItemView;
  v10 = [(PKPerformActionSelectItemView *)&v20 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pass, a3);
    objc_storeStrong((id *)&v11->_action, a4);
    v12 = [v9 selectedActionItems];
    uint64_t v13 = [v12 firstObject];
    selectedItem = v11->_selectedItem;
    v11->_selectedItem = (PKSelectedItemActionItem *)v13;

    int v15 = [(PKPerformActionSelectItemView *)v11 _shouldReverseLayoutDirection];
    uint64_t v16 = 2;
    if (!v15) {
      uint64_t v16 = 0;
    }
    v11->_textAlignment = v16;
    [(PKPerformActionSelectItemView *)v11 setClipsToBounds:0];
    v17 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v11->_dateFormatter;
    v11->_dateFormatter = v17;

    [(NSDateFormatter *)v11->_dateFormatter setDateStyle:3];
    [(NSDateFormatter *)v11->_dateFormatter setTimeStyle:0];
    [(PKPerformActionSelectItemView *)v11 _addSubviews];
  }

  return v11;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPerformActionSelectItemView;
  [(PKPerformActionSelectItemView *)&v4 layoutSubviews];
  tableView = self->_tableView;
  [(PKPerformActionSelectItemView *)self bounds];
  -[UITableView setFrame:](tableView, "setFrame:");
}

- (void)setDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_delegate, v6);
  [v6 setRightBarButtonEnabled:self->_selectedItem != 0];
}

- (BOOL)_showsExpirationSection
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = [(PKPass *)self->_pass paymentPass];
  if ([v3 isSuicaPass] && objc_msgSend(v3, "transitCommutePlanType") == 1)
  {
    BOOL v4 = PKPaymentPassCommuteRouteIsValid() != 0;
  }
  else
  {
    id v5 = [(PKPaymentPassAction *)self->_action associatedPlan];
    if (([v5 properties] & 3) == 1)
    {
      id v6 = [v5 passFieldForKey:@"expiryDate"];

      BOOL v4 = v6 != 0;
    }
    else
    {
      BOOL v4 = 0;
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v7 = [(PKPaymentPassAction *)self->_action selectedActionItems];
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
        if (v4)
        {
          v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) newExpirationDate];
          BOOL v4 = v12 != 0;
        }
        else
        {
          BOOL v4 = 0;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v4;
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
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    uint64_t v8 = [(PKPaymentPassAction *)self->_action selectedActionItems];
    int64_t v7 = [v8 count];
  }
  else if (a4)
  {
    int64_t v7 = 0;
  }
  else
  {
    int64_t v7 = [(PKPerformActionSelectItemView *)self _showsExpirationSection];
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([v6 section])
  {
    uint64_t v8 = [v7 dequeueReusableCellWithIdentifier:@"PKPerformActionSelectItemOptionsCellIdentifier"];

    if (!v8) {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"PKPerformActionSelectItemOptionsCellIdentifier"];
    }
    uint64_t v9 = [(PKPaymentPassAction *)self->_action selectedActionItems];
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));
    uint64_t v10 = (PKSelectedItemActionItem *)objc_claimAutoreleasedReturnValue();

    v11 = [(PKSelectedItemActionItem *)v10 amount];
    v12 = [(PKSelectedItemActionItem *)v10 currency];
    uint64_t v13 = PKFormattedCurrencyStringFromNumber();

    long long v14 = [v8 textLabel];
    long long v15 = [v8 detailTextLabel];
    [v14 setTextAlignment:self->_textAlignment];
    long long v16 = [(PKSelectedItemActionItem *)v10 title];
    [v14 setText:v16];

    long long v17 = [MEMORY[0x1E4FB1618] labelColor];
    [v14 setTextColor:v17];

    [v14 setLineBreakMode:4];
    [v15 setTextAlignment:self->_textAlignment];
    [v15 setText:v13];
    v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v15 setFont:v18];

    uint64_t v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v15 setTextColor:v19];

    [v8 setSelectionStyle:3];
    if (v10 == self->_selectedItem) {
      uint64_t v20 = 3;
    }
    else {
      uint64_t v20 = 0;
    }
    [v8 setAccessoryType:v20];
  }
  else
  {
    id v35 = v6;
    uint64_t v8 = [v7 dequeueReusableCellWithIdentifier:@"PKPerformActionSelectItemExpiresCellIdentifier"];

    if (!v8) {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:1 reuseIdentifier:@"PKPerformActionSelectItemExpiresCellIdentifier"];
    }
    uint64_t v10 = [(PKPaymentPassAction *)self->_action associatedPlan];
    v34 = [(PKSelectedItemActionItem *)v10 passFieldForKey:@"expiryDate"];
    -[NSDateFormatter setDateStyle:](self->_dateFormatter, "setDateStyle:", [v34 dateStyle]);
    long long v14 = [v8 textLabel];
    long long v15 = [v8 detailTextLabel];
    dateFormatter = self->_dateFormatter;
    v22 = [(PKSelectedItemActionItem *)v10 expiryDate];
    v23 = [(NSDateFormatter *)dateFormatter stringFromDate:v22];
    [v14 setText:v23];

    v24 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v14 setTextColor:v24];

    uint64_t v25 = *MEMORY[0x1E4FB28C8];
    v26 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [v14 setFont:v26];

    [v14 setTextAlignment:self->_textAlignment];
    v27 = self->_dateFormatter;
    v28 = [(PKSelectedItemActionItem *)self->_selectedItem newExpirationDate];
    v29 = [(NSDateFormatter *)v27 stringFromDate:v28];
    [v15 setText:v29];

    v30 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v25];
    [v15 setFont:v30];

    v31 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [v15 setTextColor:v31];

    uint64_t v13 = v34;
    [v15 setTextAlignment:self->_textAlignment];
    [v8 setSelectionStyle:0];
    [v8 setAccessoryType:0];
    id v6 = v35;
  }

  v32 = PKProvisioningSecondaryBackgroundColor();
  [v8 setBackgroundColor:v32];

  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 44.0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v6 = -[PKPerformActionSelectItemView tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3);
  id v7 = 0;
  if (a4 == 1 && v6 >= 1)
  {
    id v7 = [(PKPerformActionSelectItemView *)self _optionsSectionHeaderText];
  }

  return v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    id v5 = 0;
  }
  else
  {
    if ([(PKPerformActionSelectItemView *)self _showsExpirationSection])
    {
      expiresHeader = self->_expiresHeader;
      if (!expiresHeader)
      {
        uint64_t v9 = objc_alloc_init(PKPerformActionSelectItemExpiresHeader);
        uint64_t v10 = self->_expiresHeader;
        self->_expiresHeader = v9;

        v11 = self->_expiresHeader;
        v12 = PKLocalizedPaymentString(&cfstr_PerformActionS.isa);
        [(PKPerformActionSelectItemExpiresHeader *)v11 setLeadingString:v12];

        uint64_t v13 = self->_expiresHeader;
        long long v14 = PKLocalizedPaymentString(&cfstr_PerformActionS_0.isa);
        [(PKPerformActionSelectItemExpiresHeader *)v13 setTrailingString:v14];

        expiresHeader = self->_expiresHeader;
      }
      id v5 = expiresHeader;
    }
    else
    {
      id v5 = 0;
    }
  }
  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v6 = -[PKPerformActionSelectItemView tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", a3);
  id v7 = 0;
  if (a4 == 1 && v6 >= 1)
  {
    id v7 = [(PKPerformActionSelectItemView *)self _optionsSectionFooterText];
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  if ([v7 section])
  {
    uint64_t v8 = self->_selectedItem;
    uint64_t v9 = [(PKPaymentPassAction *)self->_action selectedActionItems];
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v7, "row"));
    uint64_t v10 = (PKSelectedItemActionItem *)objc_claimAutoreleasedReturnValue();

    if (v8 != v10)
    {
      objc_storeStrong((id *)&self->_selectedItem, v10);
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained setRightBarButtonEnabled:self->_selectedItem != 0];

      if ([(PKPerformActionSelectItemView *)self _showsExpirationSection])
      {
        v12 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
        v19[0] = v12;
        uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
        [v6 reloadRowsAtIndexPaths:v13 withRowAnimation:5];
      }
      long long v14 = [(PKPaymentPassAction *)self->_action selectedActionItems];
      uint64_t v15 = [v14 indexOfObject:v8];

      long long v16 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", v15, objc_msgSend(v7, "section"));
      long long v17 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v16];
      [v17 setAccessoryType:0];
      v18 = [(UITableView *)self->_tableView cellForRowAtIndexPath:v7];
      [v18 setAccessoryType:3];
    }
  }
}

- (id)pass
{
  return self->_pass;
}

- (id)transactionAmount
{
  selectedItem = self->_selectedItem;
  if (selectedItem) {
    [(PKSelectedItemActionItem *)selectedItem amount];
  }
  else {
  v3 = [MEMORY[0x1E4F28C28] zero];
  }

  return v3;
}

- (id)transactionCurrency
{
  selectedItem = self->_selectedItem;
  if (selectedItem)
  {
    selectedItem = [selectedItem currency];
  }

  return selectedItem;
}

- (void)fetchServiceProviderDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F84720] passPropertiesForPass:self->_pass];
  id v6 = [v5 balance];
  selectedItem = self->_selectedItem;
  if (selectedItem)
  {
    uint64_t v8 = [(PKPass *)self->_pass secureElementPass];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __72__PKPerformActionSelectItemView_fetchServiceProviderDataWithCompletion___block_invoke;
    v9[3] = &unk_1E59CC440;
    id v10 = v4;
    [(PKSelectedItemActionItem *)selectedItem serviceProviderDataWithPass:v8 currentLocalBalance:v6 completion:v9];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

uint64_t __72__PKPerformActionSelectItemView_fetchServiceProviderDataWithCompletion___block_invoke(uint64_t a1)
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
  id v7 = PKProvisioningBackgroundColor();
  [(UITableView *)v6 setBackgroundColor:v7];

  uint64_t v8 = self->_tableView;

  [(PKPerformActionSelectItemView *)self addSubview:v8];
}

- (PKPerformActionViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPerformActionViewDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_expiresHeader, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_selectedItem, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_action, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end