@interface PKPeerPaymentConfirmNameViewController
- (PKPeerPaymentConfirmNameViewController)initWithFamilyMember:(id)a3 delegate:(id)a4 context:(int64_t)a5;
- (PKPeerPaymentConfirmNameViewControllerDelegate)delegate;
- (void)_cancelPressed;
- (void)_continue;
- (void)setDelegate:(id)a3;
- (void)showSpinner:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPeerPaymentConfirmNameViewController

- (PKPeerPaymentConfirmNameViewController)initWithFamilyMember:(id)a3 delegate:(id)a4 context:(int64_t)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [MEMORY[0x1E4F28E58] letterCharacterSet];
  [v11 addCharactersInString:@"-. "];
  v12 = [MEMORY[0x1E4F84C50] paymentSetupFieldWithIdentifier:*MEMORY[0x1E4F87B38]];
  [v12 setAllowedCharacters:v11];
  v13 = [v9 firstName];
  [v12 setDefaultValue:v13];

  [v12 setPopulateFromMeCard:0];
  v14 = [MEMORY[0x1E4F84C50] paymentSetupFieldWithIdentifier:*MEMORY[0x1E4F87B40]];
  [v14 setAllowedCharacters:v11];
  v15 = [v9 lastName];
  [v14 setDefaultValue:v15];

  [v14 setPopulateFromMeCard:0];
  id v16 = objc_alloc(MEMORY[0x1E4F84C88]);
  v23[0] = v12;
  v23[1] = v14;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v18 = (void *)[v16 initWithPaymentSetupFields:v17];

  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentConfirmNameViewController;
  v19 = [(PKPaymentSetupFieldsViewController *)&v22 initWithWebService:0 context:a5 setupDelegate:self setupFieldsModel:v18];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_familyMember, a3);
    objc_storeWeak((id *)&v20->_delegate, v10);
  }

  return v20;
}

- (void)viewDidLoad
{
  v28[1] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)PKPeerPaymentConfirmNameViewController;
  [(PKPaymentSetupFieldsViewController *)&v26 viewDidLoad];
  [(PKPaymentSetupFieldsViewController *)self setHidesBackButton:1 animated:0];
  [(PKPaymentSetupTableViewController *)self context];
  if ((PKPaymentSetupContextIsSetupAssistant() & 1) == 0)
  {
    v3 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel__cancelPressed];
    cancelButton = self->_cancelButton;
    self->_cancelButton = v3;

    v28[0] = self->_cancelButton;
    v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    [(PKPaymentSetupFieldsViewController *)self _setLeftBarButtonItems:v5 animated:0];
  }
  v6 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__donePressed];
  doneButton = self->_doneButton;
  self->_doneButton = v6;

  v27 = self->_doneButton;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1];
  [(PKPaymentSetupFieldsViewController *)self _setRightBarButtonItems:v8 animated:0];

  id v9 = [(PKPaymentSetupTableViewController *)self tableView];
  [v9 setAllowsMultipleSelection:0];
  id v10 = PKPassKitUIBundle();
  v11 = [v10 URLForResource:@"AppleCashIcon" withExtension:@"pdf"];
  double v12 = PKUIScreenScale();
  v13 = PKUIImageFromPDF(v11, 80.0, 80.0, v12);

  v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v13];
  [v14 setContentMode:1];
  [v14 setClipsToBounds:1];
  [v14 _setContinuousCornerRadius:20.0];
  v15 = [(PKPaymentSetupFieldsViewController *)self headerView];
  [v15 setTopPadding:30.0];
  id v16 = [(PKPeerPaymentConfirmNameViewController *)self traitCollection];
  uint64_t v17 = [v16 userInterfaceIdiom];

  uint64_t IsSetupAssistant = 0;
  if ((v17 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [(PKPaymentSetupTableViewController *)self context];
    uint64_t IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  }
  [v15 setStyle:IsSetupAssistant];
  v19 = [v15 titleLabel];
  v20 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentCon_7.isa);
  [v19 setText:v20];

  v21 = [v15 subtitleLabel];
  objc_super v22 = PKLocalizedPeerPaymentLexingtonString(&cfstr_PeerPaymentCon_8.isa);
  [v21 setText:v22];

  [v15 setImageView:v14];
  v23 = [(PKPaymentSetupTableViewController *)self dockView];
  v24 = [v23 footerView];
  [v24 setManualEntryButton:0];

  v25 = [v23 footerView];
  [v25 setSetupLaterButton:0];

  [v23 setPrimaryButton:0];
}

- (void)showSpinner:(BOOL)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (self->_showSpinner != a3)
  {
    self->_showSpinner = a3;
    [(UIBarButtonItem *)self->_cancelButton setEnabled:!a3];
    if (self->_showSpinner)
    {
      spinnerButton = self->_spinnerButton;
      if (!spinnerButton)
      {
        v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        [v5 startAnimating];
        v6 = (UIBarButtonItem *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v5];
        v7 = self->_spinnerButton;
        self->_spinnerButton = v6;

        spinnerButton = self->_spinnerButton;
      }
      v11[0] = spinnerButton;
      p_doneButton = (UIBarButtonItem **)v11;
    }
    else
    {
      doneButton = self->_doneButton;
      p_doneButton = &doneButton;
    }
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:p_doneButton count:1];
    [(PKPaymentSetupFieldsViewController *)self _setRightBarButtonItems:v9 animated:0];
  }
}

- (void)_continue
{
  [(PKPeerPaymentConfirmNameViewController *)self showSpinner:1];
  v3 = [(PKPaymentSetupFieldsViewController *)self fieldForIdentifier:*MEMORY[0x1E4F87B38]];
  id v8 = [v3 submissionString];

  v4 = [(PKPaymentSetupFieldsViewController *)self fieldForIdentifier:*MEMORY[0x1E4F87B40]];
  v5 = [v4 submissionString];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained confirmNameViewController:self enteredFirstName:v8 lastName:v5];
  }
  else {
    [(PKPeerPaymentConfirmNameViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_cancelPressed
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained((id *)p_delegate);
    [v4 confirmNameViewControllerCancelled:self];
  }
  else
  {
    [(PKPeerPaymentConfirmNameViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (PKPeerPaymentConfirmNameViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKPeerPaymentConfirmNameViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);

  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end