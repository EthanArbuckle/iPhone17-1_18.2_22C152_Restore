@interface PKPassShareRedemptionActivationCodeSectionController
- (BOOL)requiresActivationCode;
- (BOOL)textFieldShouldReturn:(id)a3 forListCell:(id)a4;
- (NSString)enteredActivationCode;
- (PKPassShareActivationOptions)activationOptions;
- (PKPassShareRedemptionActivationCodeSectionController)init;
- (PKPassShareRedemptionActivationCodeSectionController)initWithMode:(unint64_t)a3 delegate:(id)a4;
- (void)_endEditing;
- (void)decorateListCell:(id)a3 forRowItem:(id)a4;
- (void)didSelectItem:(id)a3;
- (void)reloadItemsAnimated:(BOOL)a3;
- (void)setActivationOptions:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3 forListCell:(id)a4;
@end

@implementation PKPassShareRedemptionActivationCodeSectionController

- (PKPassShareRedemptionActivationCodeSectionController)init
{
  return 0;
}

- (PKPassShareRedemptionActivationCodeSectionController)initWithMode:(unint64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKPassShareRedemptionActivationCodeSectionController;
  v7 = [(PKPassShareSectionController *)&v19 initWithIdentifiers:&unk_1EF2BA260];
  v8 = v7;
  if (v7)
  {
    v7->_mode = a3;
    objc_storeWeak((id *)&v7->_delegate, v6);
    objc_initWeak(&location, v8);
    v9 = (void *)MEMORY[0x1E4FB1578];
    uint64_t v10 = objc_opt_class();
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __78__PKPassShareRedemptionActivationCodeSectionController_initWithMode_delegate___block_invoke;
    v16 = &unk_1E59DEDE8;
    objc_copyWeak(&v17, &location);
    v11 = [v9 registrationWithCellClass:v10 configurationHandler:&v13];
    -[PKPaymentSetupListSectionController setCellRegistration:](v8, "setCellRegistration:", v11, v13, v14, v15, v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __78__PKPassShareRedemptionActivationCodeSectionController_initWithMode_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained decorateListCell:v8 forRowItem:v6];
  }
}

- (void)setActivationOptions:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_activationOptions, a3);
  [(PKPassShareRedemptionActivationCodeSectionController *)self reloadItemsAnimated:0];
  v5 = [(PKPassShareActivationOptions *)self->_activationOptions primaryOption];
  id v6 = [v5 value];
  if (v6) {
    objc_storeStrong((id *)&self->_enteredActivationCode, v6);
  }
  if ([v5 type] == 1)
  {
    v7 = [v5 value];
    self->_requiresActivationCode = v7 == 0;
  }
  else
  {
    self->_requiresActivationCode = 0;
  }
  [(PKPassShareRedemptionActivationCodeSectionController *)self reloadItemsAnimated:0];
}

- (void)reloadItemsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PKPassShareRedemptionActivationCodeSectionController *)self requiresActivationCode])
  {
    id v11 = [(PKPassShareActivationOptions *)self->_activationOptions primaryOption];
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v11 type];
    if (PKPassShareActivationOptionTypeIsActivationCode())
    {
      id v6 = [[PKSharePreviewRowItem alloc] initWithIdentifier:@"EnterActivationCode"];
      v7 = PKLocalizedShareableCredentialString(&cfstr_ShareOverviewA_0.isa);
      [(PKSharePreviewRowItem *)v6 setTitle:v7];

      id v8 = PKLocalizedShareableCredentialString(&cfstr_ShareActivatio_7.isa);
      [(PKSharePreviewRowItem *)v6 setSubtitle:v8];

      [v5 addObject:v6];
    }
    [(PKPaymentSetupListSectionController *)self setItems:v5];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained reloadDataAnimated:v3];
  }
  else
  {
    uint64_t v10 = MEMORY[0x1E4F1CBF0];
    [(PKPaymentSetupListSectionController *)self setItems:v10];
  }
}

- (void)decorateListCell:(id)a3 forRowItem:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PKListTextFieldContentConfiguration valueCellConfiguration];
  v9 = [v6 subtitle];
  [v8 setPlaceholderText:v9];

  uint64_t v10 = [v6 title];

  [v8 setSecondaryText:v10];
  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 10.0, 10.0, 0.0);
  [v8 setKeyboardType:4];
  [v8 setReturnKeyType:9];
  id v11 = [v8 secondaryTextProperties];
  v12 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], (NSString *)*MEMORY[0x1E4FB27D0]);
  [v11 setFont:v12];

  [v8 setFocusTextField:0];
  [v7 setContentConfiguration:v8];
  [v7 setDelegate:self];
  id v13 = objc_alloc(MEMORY[0x1E4FB14A8]);
  uint64_t v14 = PKLocalizedString(&cfstr_Done.isa);
  v15 = (void *)[v13 initWithTitle:v14 style:2 target:self action:sel__endEditing];

  v17[0] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v7 setToolbarItems:v16];

  [v7 setConfigurationUpdateHandler:&__block_literal_global_229];
}

void __84__PKPassShareRedemptionActivationCodeSectionController_decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  v4 = (void *)MEMORY[0x1E4FB1498];
  id v5 = a2;
  id v6 = [v4 listGroupedCellConfiguration];
  if ([v9 isHighlighted] & 1) != 0 || (objc_msgSend(v9, "isSelected"))
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] tableCellDefaultSelectionTintColor];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  }
  id v8 = (void *)v7;
  [v6 setBackgroundColor:v7];

  [v5 setBackgroundConfiguration:v6];
}

- (void)didSelectItem:(id)a3
{
  p_delegate = &self->_delegate;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained deselectCells];

  id v6 = objc_loadWeakRetained((id *)p_delegate);
  id v7 = [v6 cellForItem:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v7 beginEditing];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3 forListCell:(id)a4
{
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3 forListCell:(id)a4
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained setIsEnteringActivationCode:1];

  id v6 = objc_loadWeakRetained((id *)p_delegate);
  [v6 reloadDataAnimated:1];
}

- (void)_endEditing
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v5 = [(PKPaymentSetupListSectionController *)self items];
  id v6 = [v5 firstObject];
  id v13 = [WeakRetained cellForItem:v6];

  if (v13)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v13;
      [v7 endEditing];
      id v8 = [v7 textFieldText];

      enteredActivationCode = self->_enteredActivationCode;
      self->_enteredActivationCode = v8;
    }
  }
  id v10 = objc_loadWeakRetained((id *)p_delegate);
  [v10 setIsEnteringActivationCode:0];

  id v11 = objc_loadWeakRetained((id *)p_delegate);
  [v11 activationCodeDidChange];

  id v12 = objc_loadWeakRetained((id *)p_delegate);
  [v12 reloadDataAnimated:1];
}

- (PKPassShareActivationOptions)activationOptions
{
  return self->_activationOptions;
}

- (BOOL)requiresActivationCode
{
  return self->_requiresActivationCode;
}

- (NSString)enteredActivationCode
{
  return self->_enteredActivationCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enteredActivationCode, 0);
  objc_storeStrong((id *)&self->_activationOptions, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end