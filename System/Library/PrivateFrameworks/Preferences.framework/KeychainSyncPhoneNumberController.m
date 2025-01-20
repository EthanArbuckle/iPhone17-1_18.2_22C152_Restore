@interface KeychainSyncPhoneNumberController
- (id)specifiers;
- (void)controllerDone;
- (void)loadView;
- (void)nextPressed;
- (void)phoneSettingsFragment:(id)a3 didChangePhoneNumber:(id)a4 countryInfo:(id)a5;
- (void)reloadSpecifiers;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation KeychainSyncPhoneNumberController

- (void)loadView
{
  v17.receiver = self;
  v17.super_class = (Class)KeychainSyncPhoneNumberController;
  [(PSListController *)&v17 loadView];
  id v3 = objc_alloc(MEMORY[0x1E4F427C0]);
  v4 = PS_LocalizedStringForKeychainSync(@"NEXT");
  v5 = (void *)[v3 initWithTitle:v4 style:2 target:self action:sel_nextPressed];

  v6 = [(KeychainSyncPhoneNumberController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  v7 = +[PSKeychainSyncManager sharedManager];
  if (![v7 isRunningInBuddy]) {
    goto LABEL_4;
  }
  v8 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v9 = [v8 userInterfaceIdiom];

  if (!v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F42B38]);
    v11 = (UILabel *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    footerLabel = self->_footerLabel;
    self->_footerLabel = v11;

    v13 = self->_footerLabel;
    v14 = [MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
    [(UILabel *)v13 setFont:v14];

    [(UILabel *)self->_footerLabel setNumberOfLines:0];
    v15 = self->_footerLabel;
    v16 = PS_LocalizedStringForKeychainSync(@"PHONE_NUMBER_DESCRIPTION_NO_NEWLINES");
    [(UILabel *)v15 setText:v16];

    [(UILabel *)self->_footerLabel setTextAlignment:1];
    v7 = [(KeychainSyncPhoneNumberController *)self view];
    [v7 addSubview:self->_footerLabel];
LABEL_4:
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(KeychainSyncPhoneNumberController *)self navigationItem];
  v6 = [v5 rightBarButtonItem];
  v7 = [(KeychainSyncPhoneSettingsFragment *)self->_phoneSettingsFragment phoneNumber];
  if ([v7 length])
  {
    v8 = [(KeychainSyncPhoneSettingsFragment *)self->_phoneSettingsFragment countryInfo];
    [v6 setEnabled:v8 != 0];
  }
  else
  {
    [v6 setEnabled:0];
  }

  v9.receiver = self;
  v9.super_class = (Class)KeychainSyncPhoneNumberController;
  [(PSListController *)&v9 viewWillAppear:v3];
}

- (id)specifiers
{
  BOOL v3 = PS_LocalizedStringForKeychainSync(@"PHONE_NUMBER");
  [(PSKeychainSyncViewController *)self setTitle:v3];

  specifiers = self->super.super._specifiers;
  if (!specifiers)
  {
    phoneSettingsFragment = self->_phoneSettingsFragment;
    if (!phoneSettingsFragment)
    {
      v6 = [[KeychainSyncPhoneSettingsFragment alloc] initWithListController:self];
      v7 = self->_phoneSettingsFragment;
      self->_phoneSettingsFragment = v6;

      v8 = self->_phoneSettingsFragment;
      objc_super v9 = PS_LocalizedStringForKeychainSync(@"PHONE_NUMBER");
      [(KeychainSyncPhoneSettingsFragment *)v8 setTitle:v9];

      [(KeychainSyncPhoneSettingsFragment *)self->_phoneSettingsFragment setDelegate:self];
      phoneSettingsFragment = self->_phoneSettingsFragment;
    }
    id v10 = [(KeychainSyncPhoneSettingsFragment *)phoneSettingsFragment specifiers];
    v11 = self->super.super._specifiers;
    self->super.super._specifiers = v10;

    specifiers = self->super.super._specifiers;
  }
  return specifiers;
}

- (void)reloadSpecifiers
{
  [(KeychainSyncPhoneSettingsFragment *)self->_phoneSettingsFragment reloadSpecifiers];
  v3.receiver = self;
  v3.super_class = (Class)KeychainSyncPhoneNumberController;
  [(PSListController *)&v3 reloadSpecifiers];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)KeychainSyncPhoneNumberController;
  [(PSListController *)&v8 viewDidAppear:a3];
  if ([(KeychainSyncPhoneNumberController *)self isMovingToParentViewController])
  {
    v4 = +[PSKeychainSyncManager sharedManager];
    if ([v4 isRunningInBuddy])
    {
      v5 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v6 = [v5 userInterfaceIdiom];

      if (v6 != 1) {
        return;
      }
    }
    else
    {
    }
    v7 = [(KeychainSyncPhoneSettingsFragment *)self->_phoneSettingsFragment phoneNumberCell];
    [v7 becomeFirstResponder];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(KeychainSyncPhoneSettingsFragment *)self->_phoneSettingsFragment resignFirstResponder];
  v5.receiver = self;
  v5.super_class = (Class)KeychainSyncPhoneNumberController;
  [(PSListController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidLayoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)KeychainSyncPhoneNumberController;
  [(PSListController *)&v18 viewDidLayoutSubviews];
  if (self->_footerLabel)
  {
    BOOL v3 = [(KeychainSyncPhoneNumberController *)self view];
    [v3 bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    double v9 = v8;
    CGFloat v11 = v10;

    footerLabel = self->_footerLabel;
    v19.origin.x = v5;
    v19.origin.y = v7;
    v19.size.width = v9;
    v19.size.height = v11;
    CGRect v20 = CGRectInset(v19, 15.0, 0.0);
    -[UILabel sizeThatFits:](footerLabel, "sizeThatFits:", v20.size.width, v20.size.height);
    double v14 = v13;
    double v16 = v15;
    *(float *)&double v13 = (v9 - v13) * 0.5;
    double v17 = floorf(*(float *)&v13);
    v21.origin.x = v5;
    v21.origin.y = v7;
    v21.size.width = v9;
    v21.size.height = v11;
    -[UILabel setFrame:](self->_footerLabel, "setFrame:", v17, CGRectGetMaxY(v21) - v16 + -25.0, v14, v16);
  }
}

- (void)controllerDone
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"phoneNumber";
  BOOL v3 = [(KeychainSyncPhoneSettingsFragment *)self->_phoneSettingsFragment unformattedPhoneNumber];
  v7[1] = @"countryInfo";
  v8[0] = v3;
  double v4 = [(KeychainSyncPhoneSettingsFragment *)self->_phoneSettingsFragment countryInfo];
  v8[1] = v4;
  CGFloat v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  double v6 = [(PSKeychainSyncViewController *)self delegate];
  [v6 keychainSyncController:self didFinishWithResult:v5 error:0];
}

- (void)nextPressed
{
  [(KeychainSyncPhoneSettingsFragment *)self->_phoneSettingsFragment resignFirstResponder];
  [(KeychainSyncPhoneNumberController *)self controllerDone];
}

- (void)phoneSettingsFragment:(id)a3 didChangePhoneNumber:(id)a4 countryInfo:(id)a5
{
  id v7 = a4;
  id v12 = [(KeychainSyncPhoneNumberController *)self navigationItem];
  double v8 = [v12 rightBarButtonItem];
  uint64_t v9 = [v7 length];

  if (a5) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  uint64_t v11 = !v10;
  [v8 setEnabled:v11];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerLabel, 0);
  objc_storeStrong((id *)&self->_phoneSettingsFragment, 0);
}

@end