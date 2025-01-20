@interface PKAccountAutomaticPaymentsSetupCompleteViewController
- (PKAccountAutomaticPaymentsSetupCompleteViewController)initWithController:(id)a3;
- (id)_paymentDateString;
- (id)_paymentDayNameString;
- (id)_paymentDayString;
- (id)_supplementaryMessageAttributedString;
- (id)bodyString;
- (int64_t)_paymentDay;
- (void)explanationViewDidSelectContinue:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKAccountAutomaticPaymentsSetupCompleteViewController

- (PKAccountAutomaticPaymentsSetupCompleteViewController)initWithController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKAccountAutomaticPaymentsSetupCompleteViewController;
  v6 = [(PKExplanationViewController *)&v9 initWithContext:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    v7->_featureIdentifier = [v5 featureIdentifier];
    [(PKAccountAutomaticPaymentsSetupCompleteViewController *)v7 setModalInPresentation:1];
  }

  return v7;
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)PKAccountAutomaticPaymentsSetupCompleteViewController;
  [(PKExplanationViewController *)&v18 viewDidLoad];
  v3 = [(PKExplanationViewController *)self explanationView];
  v4 = PKLocalizedFeatureString();
  [v3 setTitleText:v4];

  id v5 = [(PKAccountAutomaticPaymentsSetupCompleteViewController *)self bodyString];
  [v3 setBodyText:v5];

  [v3 setDelegate:self];
  [v3 setShowPrivacyView:0];
  [v3 showCheckmark:0 animated:0];
  [v3 setBodyViewPadding:35.0];
  objc_initWeak(&location, self);
  v6 = [MEMORY[0x1E4F850F8] sharedInstance];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__PKAccountAutomaticPaymentsSetupCompleteViewController_viewDidLoad__block_invoke;
  v14[3] = &unk_1E59CB9A0;
  objc_copyWeak(&v16, &location);
  id v7 = v3;
  id v15 = v7;
  [v6 authorizationStatusWithCompletion:v14];

  v8 = [v7 dockView];
  objc_super v9 = [v8 primaryButton];
  v10 = PKLocalizedFeatureString();
  [v9 setTitle:v10 forState:0];

  objc_msgSend(v9, "setContentEdgeInsets:", 0.0, 16.0, 0.0, 16.0);
  v11 = [v9 titleLabel];
  [v11 setAdjustsFontSizeToFitWidth:1];

  [v9 sizeToFit];
  v12 = [(PKAccountAutomaticPaymentsSetupCompleteViewController *)self navigationItem];
  [v12 setLeftBarButtonItem:0];

  v13 = [(PKAccountAutomaticPaymentsSetupCompleteViewController *)self navigationItem];
  [v13 setHidesBackButton:1];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __68__PKAccountAutomaticPaymentsSetupCompleteViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, char a3)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __68__PKAccountAutomaticPaymentsSetupCompleteViewController_viewDidLoad__block_invoke_2;
  v6[3] = &unk_1E59CB978;
  objc_copyWeak(v8, (id *)(a1 + 40));
  char v9 = a3;
  v8[1] = a2;
  id v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(v8);
}

void __68__PKAccountAutomaticPaymentsSetupCompleteViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(unsigned char *)(a1 + 56) && *(void *)(a1 + 48) != 2)
  {
    id v5 = WeakRetained;
    v3 = objc_alloc_init(PKAccountBillPaymentMessageContentView);
    [(PKAccountBillPaymentMessageContentView *)v3 setSystemImage:@"bell"];
    v4 = [v5 _supplementaryMessageAttributedString];
    [(PKAccountBillPaymentMessageContentView *)v3 setAttributedMessage:v4];

    [*(id *)(a1 + 32) setBodyView:v3];
    id WeakRetained = v5;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKAccountAutomaticPaymentsSetupCompleteViewController;
  [(PKAccountAutomaticPaymentsSetupCompleteViewController *)&v5 viewDidAppear:a3];
  v4 = [(PKExplanationViewController *)self explanationView];
  [v4 setShowCheckmark:1];
}

- (id)bodyString
{
  int64_t v3 = [(PKAccountAutomaticPaymentsController *)self->_controller paymentFrequency];
  v4 = [(PKAccountAutomaticPaymentsSetupCompleteViewController *)self _paymentDateString];
  if ([(PKAccountAutomaticPaymentsController *)self->_controller paymentPreset] != 1) {
    goto LABEL_5;
  }
  objc_super v5 = [(PKAccountAutomaticPaymentsController *)self->_controller amount];
  v6 = [v5 amount];
  id v7 = [(PKAccountAutomaticPaymentsController *)self->_controller account];
  v8 = [v7 creditDetails];
  char v9 = [v8 currencyCode];
  v10 = PKFormattedCurrencyStringFromNumber();

  if (v10)
  {
    switch(v3)
    {
      case 4:
      case 5:
        v11 = [(PKAccountAutomaticPaymentsSetupCompleteViewController *)self _paymentDayNameString];
        goto LABEL_14;
      case 6:
        [(PKAccountAutomaticPaymentsSetupCompleteViewController *)self _paymentDay];
        v11 = [(PKAccountAutomaticPaymentsSetupCompleteViewController *)self _paymentDayString];
LABEL_14:
        objc_super v18 = v10;
        v19 = v11;
        v12 = PKLocalizedFeatureString();

        break;
      case 7:
        objc_super v18 = v10;
        v12 = PKLocalizedFeatureString();
        break;
      default:
        goto LABEL_7;
    }
  }
  else
  {
LABEL_5:
    switch(v3)
    {
      case 4:
      case 5:
        objc_super v18 = [(PKAccountAutomaticPaymentsSetupCompleteViewController *)self _paymentDayNameString];
        v12 = PKLocalizedFeatureString();

        goto LABEL_11;
      case 6:
        [(PKAccountAutomaticPaymentsSetupCompleteViewController *)self _paymentDay];
        objc_super v18 = [(PKAccountAutomaticPaymentsSetupCompleteViewController *)self _paymentDayString];
        v12 = PKLocalizedFeatureString();

        goto LABEL_11;
      case 7:
        v12 = PKLocalizedFeatureString();
LABEL_11:
        v10 = 0;
        break;
      default:
        v10 = 0;
LABEL_7:
        v12 = 0;
        break;
    }
  }
  if (![(PKAccountAutomaticPaymentsController *)self->_controller willSkipFirstPayment]|| (int64_t v13 = [(PKAccountAutomaticPaymentsController *)self->_controller paymentPreset], v13 == 2)|| v13 == 3)
  {
    uint64_t v14 = PKLocalizedFeatureString();
    if (v14)
    {
      id v15 = (void *)v14;
      uint64_t v16 = [v12 stringByAppendingFormat:@" %@", v14];

      v12 = (void *)v16;
    }
  }

  return v12;
}

- (void)explanationViewDidSelectContinue:(id)a3
{
  id v4 = [(PKAccountAutomaticPaymentsController *)self->_controller delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 accountAutomaticPaymentsControllerDidSelectSetupCompletionDone:self->_controller viewController:self];
  }
  else {
    [(PKAccountAutomaticPaymentsSetupCompleteViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (int64_t)_paymentDay
{
  int64_t result = [(PKAccountAutomaticPaymentsController *)self->_controller scheduledDay];
  if ((unint64_t)(result - 1) >= 0x1F)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    objc_super v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    v6 = [(PKAccountAutomaticPaymentsController *)self->_controller account];
    id v7 = [v6 creditDetails];
    v8 = [v7 productTimeZone];
    [v5 setTimeZone:v8];

    char v9 = [(PKAccountAutomaticPaymentsController *)self->_controller paymentDate];
    int64_t v10 = [v5 component:16 fromDate:v9];

    return v10;
  }
  return result;
}

- (id)_paymentDayString
{
  int64_t v3 = [(PKAccountAutomaticPaymentsController *)self->_controller account];
  id v4 = [v3 creditDetails];
  objc_super v5 = [v4 productTimeZone];

  id v6 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v7 = (void *)[v6 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  [v7 setTimeZone:v5];
  v8 = [(PKAccountAutomaticPaymentsController *)self->_controller paymentDate];
  char v9 = PKLocalizedFeatureString();
  int64_t v10 = v9;
  if (v9) {
    int v11 = [v9 isEqualToString:@"1"];
  }
  else {
    int v11 = 0;
  }
  int64_t v12 = [(PKAccountAutomaticPaymentsController *)self->_controller scheduledDay];
  if ((unint64_t)(v12 - 1) <= 0x1E)
  {
    int64_t v13 = v12;
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v15 = [v7 nextDateAfterDate:v14 matchingUnit:16 value:v13 options:2];

    v8 = (void *)v15;
  }
  if (v11)
  {
    [v7 component:16 fromDate:v8];
    uint64_t v16 = PKOrdinalStringForInteger();
  }
  else
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v17 setTimeZone:v5];
    [v17 setLocalizedDateFormatFromTemplate:@"d"];
    uint64_t v16 = [v17 stringFromDate:v8];
  }

  return v16;
}

- (id)_paymentDayNameString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v4 = [(PKAccountAutomaticPaymentsController *)self->_controller account];
  objc_super v5 = [v4 creditDetails];
  id v6 = [v5 productTimeZone];
  [v3 setTimeZone:v6];

  [v3 setLocalizedDateFormatFromTemplate:@"EEEE"];
  id v7 = [(PKAccountAutomaticPaymentsController *)self->_controller paymentDate];
  v8 = [v3 stringFromDate:v7];

  return v8;
}

- (id)_paymentDateString
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v4 = [(PKAccountAutomaticPaymentsController *)self->_controller account];
  objc_super v5 = [v4 creditDetails];
  id v6 = [v5 productTimeZone];
  [v3 setTimeZone:v6];

  [v3 setLocalizedDateFormatFromTemplate:@"EEEE, MMMM d"];
  id v7 = [(PKAccountAutomaticPaymentsController *)self->_controller paymentDate];
  v8 = [v3 stringFromDate:v7];

  return v8;
}

- (id)_supplementaryMessageAttributedString
{
  uint64_t v2 = *MEMORY[0x1E4FB26C0];
  id v3 = PKLocalizedFeatureString();
  id v4 = PKLocalizedFeatureString();
  objc_super v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E48]), "initWithString:", v4, v3);
  id v6 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  uint64_t v7 = [v4 rangeOfString:v3];
  uint64_t v9 = v8;
  int64_t v10 = [MEMORY[0x1E4FB1618] linkColor];
  objc_msgSend(v5, "pk_addLinkURL:toRange:withColor:isUnderlined:", v6, v7, v9, v10, 0);

  int v11 = (void *)[v5 copy];

  return v11;
}

- (void).cxx_destruct
{
}

@end