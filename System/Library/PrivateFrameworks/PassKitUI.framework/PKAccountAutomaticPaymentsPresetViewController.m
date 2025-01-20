@interface PKAccountAutomaticPaymentsPresetViewController
- (BOOL)shouldMapSection:(unint64_t)a3;
- (PKAccountAutomaticPaymentsPresetViewController)initWithController:(id)a3;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableHeaderView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_handleNext:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation PKAccountAutomaticPaymentsPresetViewController

- (PKAccountAutomaticPaymentsPresetViewController)initWithController:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKAccountAutomaticPaymentsPresetViewController;
  v6 = [(PKSectionTableViewController *)&v30 initWithStyle:1 numberOfSections:1];
  v7 = v6;
  if (v6)
  {
    p_controller = (id *)&v6->_controller;
    objc_storeStrong((id *)&v6->_controller, a3);
    uint64_t v9 = [*p_controller account];
    account = v7->_account;
    v7->_account = (PKAccount *)v9;

    v7->_featureIdentifier = [*p_controller featureIdentifier];
    uint64_t v11 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
    selectedIndexPath = v7->_selectedIndexPath;
    v7->_selectedIndexPath = (NSIndexPath *)v11;

    v13 = [(PKAccount *)v7->_account scheduleRecurringPaymentsFeatureDescriptor];
    char v14 = [v13 paymentPresets];
    v29 = v13;
    uint64_t v15 = [v13 paymentFrequencies];
    v16 = [MEMORY[0x1E4F1CA48] array];
    v17 = v16;
    if ((v14 & 4) != 0) {
      [v16 addObject:&unk_1EF2B9468];
    }
    if ((v14 & 2) != 0) {
      [v17 addObject:&unk_1EF2B9480];
    }
    v18 = [(PKAccount *)v7->_account creditDetails];
    v19 = [v18 accountSummary];

    v20 = [v19 creditLimit];
    if (v20)
    {
      [MEMORY[0x1E4F28C28] zero];
      v22 = id v21 = v5;
      uint64_t v23 = [v22 compare:v20];

      id v5 = v21;
      if ((v14 & 1) != 0 && v15 && v23 == -1) {
        [v17 addObject:&unk_1EF2B9498];
      }
    }
    uint64_t v24 = [v17 copy];
    paymentPresets = v7->_paymentPresets;
    v7->_paymentPresets = (NSArray *)v24;

    uint64_t v26 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", -[NSArray indexOfObject:](v7->_paymentPresets, "indexOfObject:", &unk_1EF2B9468), 0);
    v27 = v7->_selectedIndexPath;
    v7->_selectedIndexPath = (NSIndexPath *)v26;

    [(PKSectionTableViewController *)v7 setSkipSetupForReadableContentGuide:1];
  }

  return v7;
}

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)PKAccountAutomaticPaymentsPresetViewController;
  [(PKSectionTableViewController *)&v10 viewDidLoad];
  v3 = [(PKAccountAutomaticPaymentsPresetViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"paymentPresetCellReuseIdentifier"];
  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  v4 = [(PKAccountAutomaticPaymentsPresetViewController *)self tableHeaderView];
  [v3 setTableHeaderView:v4];

  [v3 selectRowAtIndexPath:self->_selectedIndexPath animated:0 scrollPosition:0];
  id v5 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v6 = PKLocalizedPaymentString(&cfstr_Next.isa);
  v7 = (void *)[v5 initWithTitle:v6 style:2 target:self action:sel__handleNext_];

  [v7 setAccessibilityIdentifier:*MEMORY[0x1E4F85720]];
  v8 = [(PKAccountAutomaticPaymentsPresetViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v7];
  uint64_t v9 = [(PKAccountAutomaticPaymentsPresetViewController *)self view];
  [v9 setAccessibilityIdentifier:*MEMORY[0x1E4F85270]];
}

- (id)tableHeaderView
{
  tableHeaderView = self->_tableHeaderView;
  if (!tableHeaderView)
  {
    v4 = PKLocalizedFeatureString();
    id v5 = PKLocalizedFeatureString();
    v6 = [PKTableHeaderView alloc];
    v7 = -[PKTableHeaderView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v8 = self->_tableHeaderView;
    self->_tableHeaderView = v7;

    uint64_t v9 = [(PKTableHeaderView *)self->_tableHeaderView titleLabel];
    [v9 setText:v4];

    objc_super v10 = [(PKTableHeaderView *)self->_tableHeaderView subtitleLabel];
    [v10 setText:v5];

    [(PKTableHeaderView *)self->_tableHeaderView setTopPadding:5.0];
    [(PKTableHeaderView *)self->_tableHeaderView setBottomPadding:60.0];
    uint64_t v11 = self->_tableHeaderView;
    v12 = [(PKAccountAutomaticPaymentsPresetViewController *)self tableView];
    [v12 bounds];
    -[PKTableHeaderView sizeThatFits:](v11, "sizeThatFits:", CGRectGetWidth(v19), 3.40282347e38);
    double v14 = v13;
    double v16 = v15;

    -[PKTableHeaderView setFrame:](self->_tableHeaderView, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v14, v16);
    tableHeaderView = self->_tableHeaderView;
  }

  return tableHeaderView;
}

- (void)_handleNext:(id)a3
{
  v4 = [(NSArray *)self->_paymentPresets objectAtIndex:[(NSIndexPath *)self->_selectedIndexPath row]];
  uint64_t v5 = [v4 integerValue];

  [(PKAccountAutomaticPaymentsController *)self->_controller setPaymentPreset:v5];
  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    [(PKAccountAutomaticPaymentsController *)self->_controller setPaymentFrequency:7];
    [(PKAccountAutomaticPaymentsController *)self->_controller setPaymentDate:0];
    [(PKAccountAutomaticPaymentsController *)self->_controller setAmount:0];
  }
  controller = self->_controller;

  [(PKAccountAutomaticPaymentsController *)controller presentNextViewControllerFromViewController:self];
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  return 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4FB2F28];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_paymentPresets count];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  p_selectedIndexPath = &self->_selectedIndexPath;
  if (([v6 isEqual:*p_selectedIndexPath] & 1) == 0)
  {
    objc_storeStrong((id *)p_selectedIndexPath, a4);
    [v8 reloadData];
  }
  [v8 deselectRowAtIndexPath:v6 animated:1];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v7 isEqual:self->_selectedIndexPath];
  uint64_t v9 = -[NSArray objectAtIndex:](self->_paymentPresets, "objectAtIndex:", [v7 row]);
  uint64_t v10 = [v9 integerValue];

  unint64_t v11 = v10 - 1;
  int v27 = v8;
  if ((unint64_t)(v10 - 1) > 2)
  {
    double v13 = 0;
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = PKLocalizedFeatureString();
    double v13 = PKLocalizedFeatureString();
  }
  double v14 = [v6 dequeueReusableCellWithIdentifier:@"paymentPresetCellReuseIdentifier" forIndexPath:v7];
  double v15 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
  v28 = (void *)v12;
  [v15 setText:v12];
  [v15 setSecondaryText:v13];
  [v14 setMinimumHeight:60.0];
  double v16 = [v15 textProperties];
  v17 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v16 setFont:v17];

  v18 = [v15 secondaryTextProperties];
  CGRect v19 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
  [v18 setFont:v19];

  [v18 setNumberOfLines:0];
  [v14 setContentConfiguration:v15];
  v20 = [v14 accessoryView];
  if (!v20)
  {
    id v21 = [v14 traitCollection];
    PKUICellAccessoryCheckmarkConfiguration(v21);
    v22 = id v26 = v6;

    uint64_t v23 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark" withConfiguration:v22];
    v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v23];
    [v14 setAccessoryView:v20];

    id v6 = v26;
  }
  [v20 setHidden:v27 ^ 1u];
  [v14 setSelectionStyle:0];
  if (v11 > 2) {
    uint64_t v24 = (void *)MEMORY[0x1E4F85B28];
  }
  else {
    uint64_t v24 = (void *)qword_1E59D7060[v11];
  }
  [v14 setAccessibilityIdentifier:*v24];

  return v14;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v5 = [(NSArray *)self->_paymentPresets objectAtIndex:[(NSIndexPath *)self->_selectedIndexPath row]];
  uint64_t v6 = [v5 integerValue];

  unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
  int v8 = [(PKAccount *)self->_account creditDetails];
  uint64_t v9 = [v8 installmentPlans];
  int v10 = objc_msgSend(v9, "pk_hasObjectPassingTest:", &__block_literal_global_124);

  if (v7 != 2 || v10 == 0)
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = PKLocalizedFeatureString();
  }

  return v12;
}

uint64_t __84__PKAccountAutomaticPaymentsPresetViewController_tableView_titleForFooterInSection___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isComplete] ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPresets, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end