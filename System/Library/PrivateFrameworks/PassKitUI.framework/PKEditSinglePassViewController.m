@interface PKEditSinglePassViewController
- (BOOL)handleDeletePassRequestWithPass:(id)a3 forViewController:(id)a4;
- (PKEditSinglePassViewController)initWithGroup:(id)a3 pass:(id)a4;
- (id)_barcodePassDetailsViewControllerForBarcodePass:(id)a3;
- (id)_paymentPassDetailsViewControllerForPaymentPass:(id)a3;
- (id)group;
- (id)pass;
- (void)_deletePassConfirmed;
- (void)_deletePassPressed;
- (void)_didPresentDetailViewController;
- (void)_doneButtonPressed;
- (void)_moreButtonPressed;
- (void)disableDeleteButton;
- (void)enableDeleteButton;
- (void)passViewSetup;
- (void)passWasUpdated:(id)a3;
- (void)setPerformanceTest:(int64_t)a3;
- (void)setPerformanceTestName:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKEditSinglePassViewController

- (PKEditSinglePassViewController)initWithGroup:(id)a3 pass:(id)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)PKEditSinglePassViewController;
  v9 = [(PKEditSinglePassViewController *)&v26 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_group, a3);
    objc_storeStrong((id *)&v10->_pass, a4);
    v10->_performanceTest = 0;
    id v11 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v12 = PKLocalizedString(&cfstr_PassEditingDel.isa);
    uint64_t v13 = [v11 initWithTitle:v12 style:0 target:v10 action:sel__deletePassPressed];
    deleteBarButton = v10->_deleteBarButton;
    v10->_deleteBarButton = (UIBarButtonItem *)v13;

    uint64_t v15 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
    flexibleSpace = v10->_flexibleSpace;
    v10->_flexibleSpace = (UIBarButtonItem *)v15;

    id v17 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v18 = PKUIBigInfoButtonImageWithDefaultConfiguration();
    uint64_t v19 = [v17 initWithImage:v18 style:0 target:v10 action:sel__moreButtonPressed];
    infoButton = v10->_infoButton;
    v10->_infoButton = (UIBarButtonItem *)v19;

    v21 = v10->_infoButton;
    v22 = [MEMORY[0x1E4FB1618] labelColor];
    [(UIBarButtonItem *)v21 setTintColor:v22];

    v23 = [(PKEditSinglePassViewController *)v10 navigationItem];
    [v23 setRightBarButtonItem:v10->_infoButton];

    v27[0] = v10->_flexibleSpace;
    v27[1] = v10->_deleteBarButton;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
    [(PKEditSinglePassViewController *)v10 setToolbarItems:v24];

    [(PKEditSinglePassViewController *)v10 passViewSetup];
  }

  return v10;
}

- (void)setPerformanceTest:(int64_t)a3
{
  self->_performanceTest = a3;
}

- (void)setPerformanceTestName:(id)a3
{
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKEditSinglePassViewController;
  [(PKEditSinglePassViewController *)&v5 viewDidLoad];
  v3 = [(PKEditSinglePassViewController *)self view];
  v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  [(PKEditSinglePassViewController *)self passViewSetup];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKEditSinglePassViewController;
  [(PKEditSinglePassViewController *)&v5 viewWillAppear:a3];
  [(PKEditSinglePassViewController *)self enableDeleteButton];
  v4 = [(PKEditSinglePassViewController *)self navigationController];
  [v4 setToolbarHidden:0 animated:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKEditSinglePassViewController;
  [(PKEditSinglePassViewController *)&v5 viewDidAppear:a3];
  int64_t performanceTest = self->_performanceTest;
  if (performanceTest == 1)
  {
    [(PKEditSinglePassViewController *)self _moreButtonPressed];
  }
  else if (performanceTest == 3)
  {
    [(PKEditSinglePassViewController *)self _deletePassConfirmed];
  }
}

- (void)viewWillLayoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)PKEditSinglePassViewController;
  [(PKEditSinglePassViewController *)&v28 viewWillLayoutSubviews];
  v3 = [(PKEditSinglePassViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v5 + v16;
  double v18 = v7 + v12;
  double v20 = v9 - (v16 + v19);
  [(PKPassView *)self->_passView sizeOfFront];
  passView = self->_passView;
  if (v21 >= v20)
  {
    PKFloatRoundToPixel();
    double v25 = v27;
    double v26 = -16.0;
  }
  else
  {
    double v23 = v21;
    PKFloatRoundToPixel();
    double v17 = v24;
    double v25 = v18 + 16.0;
    double v26 = -32.0;
    double v20 = v23;
  }
  -[PKPassView setFrame:](passView, "setFrame:", v17, v25, v20, v11 - (v13 + v15) + v26);
}

- (void)passViewSetup
{
  v3 = [(PKPass *)self->_pass localizedDescription];
  [(PKEditSinglePassViewController *)self setTitle:v3];

  double v4 = [(PKEditSinglePassViewController *)self viewIfLoaded];
  if (v4)
  {
    id v8 = v4;
    double v5 = self->_passView;
    double v6 = [[PKPassView alloc] initWithPass:self->_pass content:5];
    passView = self->_passView;
    self->_passView = v6;

    [(PKPassView *)self->_passView setModallyPresented:1];
    [v8 addSubview:self->_passView];
    [v8 setNeedsLayout];
    if (v5) {
      [(PKPassView *)v5 removeFromSuperview];
    }

    double v4 = v8;
  }
}

- (void)passWasUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_pass, a3);

  [(PKEditSinglePassViewController *)self passViewSetup];
}

- (BOOL)handleDeletePassRequestWithPass:(id)a3 forViewController:(id)a4
{
  id v5 = a4;
  [(PKEditSinglePassViewController *)self _deletePassConfirmed];
  [v5 dismissViewControllerAnimated:1 completion:0];

  return 1;
}

- (void)_deletePassPressed
{
  v3 = PKLocalizedString(&cfstr_RemoveSheetCan.isa);
  double v4 = PKLocalizedString(&cfstr_PassEditingDel_0.isa);
  id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  double v6 = [MEMORY[0x1E4FB1410] actionWithTitle:v3 style:1 handler:0];
  [v5 addAction:v6];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __52__PKEditSinglePassViewController__deletePassPressed__block_invoke;
  v8[3] = &unk_1E59CB1F0;
  v8[4] = self;
  double v7 = [MEMORY[0x1E4FB1410] actionWithTitle:v4 style:2 handler:v8];
  [v5 addAction:v7];

  [(PKEditSinglePassViewController *)self presentViewController:v5 animated:1 completion:0];
}

uint64_t __52__PKEditSinglePassViewController__deletePassPressed__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deletePassConfirmed];
}

- (void)_deletePassConfirmed
{
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85C38], 0);
  [(PKEditSinglePassViewController *)self disableDeleteButton];
  id v3 = [MEMORY[0x1E4F84898] sharedInstance];
  [v3 removePass:self->_pass];
}

- (void)_moreButtonPressed
{
  PKPassType v3 = [(PKPass *)self->_pass passType];
  if (v3 == PKPassTypeSecureElement)
  {
    double v6 = [(PKPass *)self->_pass paymentPass];
    double v4 = [(PKEditSinglePassViewController *)self _paymentPassDetailsViewControllerForPaymentPass:v6];

    if (v4)
    {
LABEL_4:
      id v5 = [[PKNavigationController alloc] initWithRootViewController:v4];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __52__PKEditSinglePassViewController__moreButtonPressed__block_invoke;
      v7[3] = &unk_1E59CA7D0;
      v7[4] = self;
      [(PKEditSinglePassViewController *)self presentViewController:v5 animated:1 completion:v7];

      return;
    }
  }
  else if (v3 == PKPassTypeBarcode)
  {
    double v4 = [(PKEditSinglePassViewController *)self _barcodePassDetailsViewControllerForBarcodePass:self->_pass];
    if (v4) {
      goto LABEL_4;
    }
  }

  [(PKEditSinglePassViewController *)self _didPresentDetailViewController];
}

uint64_t __52__PKEditSinglePassViewController__moreButtonPressed__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didPresentDetailViewController];
}

- (void)_doneButtonPressed
{
}

- (id)_paymentPassDetailsViewControllerForPaymentPass:(id)a3
{
  if (a3)
  {
    double v4 = (objc_class *)MEMORY[0x1E4F84A88];
    id v5 = a3;
    id v6 = objc_alloc_init(v4);
    double v7 = [PKPaymentPassDetailViewController alloc];
    group = self->_group;
    double v9 = [MEMORY[0x1E4F84D50] sharedService];
    double v10 = [MEMORY[0x1E4F84E10] sharedService];
    id v11 = objc_alloc_init(MEMORY[0x1E4F848A0]);
    double v12 = [(PKPaymentPassDetailViewController *)v7 initWithPass:v5 group:group groupsController:0 webService:v9 peerPaymentWebService:v10 style:0 passLibraryDataProvider:v11 paymentServiceDataProvider:v6];

    [(PKPaymentPassDetailViewController *)v12 setDeleteOverrider:self];
    [(PKPaymentPassDetailViewController *)v12 setShowDoneButton:1];
  }
  else
  {
    double v12 = 0;
  }

  return v12;
}

- (id)_barcodePassDetailsViewControllerForBarcodePass:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [[PKBarcodePassDetailViewController alloc] initWithPass:v4];

    [(PKBarcodePassDetailViewController *)v5 setDeleteOverrider:self];
    [(PKBarcodePassDetailViewController *)v5 setShowDoneButton:1];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)enableDeleteButton
{
  [(UIBarButtonItem *)self->_deleteBarButton setEnabled:1];
  deleteBarButton = self->_deleteBarButton;
  id v4 = [MEMORY[0x1E4FB1618] redColor];
  [(UIBarButtonItem *)deleteBarButton setTintColor:v4];

  id v6 = [(PKEditSinglePassViewController *)self navigationController];
  id v5 = [v6 toolbar];
  [v5 setNeedsLayout];
}

- (void)disableDeleteButton
{
  [(UIBarButtonItem *)self->_deleteBarButton setEnabled:0];
  deleteBarButton = self->_deleteBarButton;
  id v4 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
  [(UIBarButtonItem *)deleteBarButton setTintColor:v4];

  id v6 = [(PKEditSinglePassViewController *)self navigationController];
  id v5 = [v6 toolbar];
  [v5 setNeedsLayout];
}

- (void)_didPresentDetailViewController
{
  if (self->_performanceTest == 1)
  {
    self->_int64_t performanceTest = 0;
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __65__PKEditSinglePassViewController__didPresentDetailViewController__block_invoke;
    v2[3] = &unk_1E59CA7D0;
    v2[4] = self;
    [(PKEditSinglePassViewController *)self dismissViewControllerAnimated:1 completion:v2];
  }
}

void __65__PKEditSinglePassViewController__didPresentDetailViewController__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popToRootViewControllerAnimated:1];
}

- (id)group
{
  return self->_group;
}

- (id)pass
{
  return self->_pass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performanceTestName, 0);
  objc_storeStrong((id *)&self->_infoButton, 0);
  objc_storeStrong((id *)&self->_flexibleSpace, 0);
  objc_storeStrong((id *)&self->_deleteBarButton, 0);
  objc_storeStrong((id *)&self->_passView, 0);
  objc_storeStrong((id *)&self->_pass, 0);

  objc_storeStrong((id *)&self->_group, 0);
}

@end