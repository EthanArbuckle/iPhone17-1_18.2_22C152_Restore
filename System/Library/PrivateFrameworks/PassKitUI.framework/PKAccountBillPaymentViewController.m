@interface PKAccountBillPaymentViewController
+ (BOOL)canPayBillForAccount:(id)a3 displayableError:(id *)a4;
+ (CGSize)smallRingSizeWithAccessibilityLayout:(BOOL)a3;
+ (UIEdgeInsets)contentMargins;
+ (double)ringTopMargin;
+ (double)smallRingTopMargin;
+ (id)alertControllerForDisplayableError:(id)a3;
+ (id)alertControllerForDisplayableError:(id)a3 handler:(id)a4;
+ (id)backgroundColor;
+ (id)displayableErrorForAccount:(id)a3 reason:(unint64_t)a4;
+ (void)_billPaymentViewControllerForAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 configuration:(id)a6 withCompletion:(id)a7;
+ (void)billPaymentViewControllerForAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 configuration:(id)a6 withCompletion:(id)a7;
- (BOOL)_interestLabelIsOutsideSmallRing;
- (CGSize)_layoutScrollViewWithContentWidth:(double)a3;
- (PKAccount)account;
- (PKAccountBillPaymentObserver)observer;
- (PKAccountBillPaymentViewController)initWithAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 suggestedAmountController:(id)a6 configuration:(id)a7 interstitalState:(unint64_t)a8;
- (PKAccountBillPaymentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PKAccountBillPaymentViewController)initWithSuggestedAmountController:(id)a3 account:(id)a4 accountUserCollection:(id)a5 transactionSource:(id)a6 configuration:(id)a7 interstitialState:(unint64_t)a8;
- (PKAccountBillPaymentViewController)initWithSuggestedAmountController:(id)a3 transactionSource:(id)a4;
- (PKAccountUserCollection)accountUserCollection;
- (PKTransactionSource)transactionSource;
- (double)_buttonHeightForButtonWidth:(double)a3;
- (id)_addBankAccountInformationViewController;
- (id)_interestForAmount:(id)a3;
- (id)_interestPostDate;
- (id)_interestStringForAmount:(id)a3;
- (id)_paymentAmount;
- (id)_roundedInterestForAmount:(id)a3;
- (id)_title;
- (id)billPaymentRingView:(id)a3 bottomCurvedTextForSuggestedAmount:(id)a4;
- (id)billPaymentRingView:(id)a3 interestTextForAmount:(id)a4;
- (id)billPaymentRingView:(id)a3 topCurvedTextForSuggestedAmount:(id)a4;
- (id)billPaymentRingViewZeroInterestText:(id)a3;
- (id)disabledBottomCurvedTextForBillPaymentRingView:(id)a3;
- (id)disabledTopCurvedTextForBillPaymentRingView:(id)a3;
- (id)presentationSceneIdentifierForAccountAutomaticPaymentsController:(id)a3;
- (id)presentationSceneIdentifierForAccountBillPaymentController:(id)a3;
- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4;
- (void)_accountDidChange:(id)a3;
- (void)_cancelButtonTapped:(id)a3;
- (void)_configureProductHeroView;
- (void)_contactSupportButtonTapped:(id)a3;
- (void)_dismissViewControllerWithSuccess:(BOOL)a3;
- (void)_interstitialButtonTapped:(id)a3;
- (void)_layoutFooterWithState:(id *)a3;
- (void)_payLaterButtonTapped:(id)a3;
- (void)_payNowButtonTapped:(id)a3;
- (void)_performBillPaymentWithAmount:(id)a3 billPaymentSuggestedAmountDataEvent:(id)a4;
- (void)_presentAddBankAccount;
- (void)_presentAlertControllerForError:(id)a3;
- (void)_reportEventForPassIfNecessary:(id)a3;
- (void)_setAccount:(id)a3;
- (void)_setEnabled:(BOOL)a3;
- (void)_setPayButtonsEnabled:(BOOL)a3;
- (void)_setShowKeyboard:(BOOL)a3;
- (void)_setupAmountDescriptionViewForInterstitial;
- (void)_showKeyboardButtonTapped:(id)a3;
- (void)_showOrHideKeypad;
- (void)_tappedNormalRingViewAmount:(id)a3;
- (void)_tappedSmallRingView:(id)a3;
- (void)_updateForShowKeyboardAnimated:(BOOL)a3;
- (void)_updateLayoutForKeyboardAction:(id)a3;
- (void)_updateNavigationTitle;
- (void)_updatePayNowButtonTitleWithAmount:(id)a3;
- (void)_updateSmallRingInterestString;
- (void)_updateSubtitle;
- (void)accountAutomaticPaymentsController:(id)a3 didSchedulePayment:(id)a4;
- (void)accountAutomaticPaymentsControllerDidSelectSetupCompletionDone:(id)a3 viewController:(id)a4;
- (void)accountBillPaymentController:(id)a3 hasChangedState:(unint64_t)a4 error:(id)a5 updatedAccount:(id)a6;
- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5;
- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4;
- (void)addBankAccountInformationViewControllerDidFinish:(id)a3;
- (void)billPaymentAmountDescriptionView:(id)a3 hasChangedAmount:(id)a4 isValidAmount:(BOOL)a5;
- (void)billPaymentAmountDescriptionViewHasTappedLearnMore:(id)a3;
- (void)billPaymentRingView:(id)a3 amountChanged:(id)a4;
- (void)billPaymentRingView:(id)a3 selectedSuggestedAmount:(id)a4 selectedSuggestedAmountIsTarget:(BOOL)a5 userInitiatedChange:(BOOL)a6;
- (void)dealloc;
- (void)keyboardWillChange:(id)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)loadView;
- (void)scrollViewDidScroll:(id)a3;
- (void)setObserver:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation PKAccountBillPaymentViewController

+ (BOOL)canPayBillForAccount:(id)a3 displayableError:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 schedulePaymentFeatureDescriptor];

    if (v8)
    {
      uint64_t v9 = [v7 stateReason];
      LOBYTE(v8) = v9 != 14;
      uint64_t v10 = 2 * (v9 == 14);
      if (!a4) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v10 = 1;
      if (!a4) {
        goto LABEL_10;
      }
    }
  }
  else
  {
    LOBYTE(v8) = 0;
    uint64_t v10 = 0;
    if (!a4) {
      goto LABEL_10;
    }
  }
  if ((v8 & 1) == 0)
  {
    *a4 = [a1 displayableErrorForAccount:v7 reason:v10];
  }
LABEL_10:

  return v8;
}

+ (id)displayableErrorForAccount:(id)a3 reason:(unint64_t)a4
{
  [a3 feature];
  if (a4 != 2)
  {
    if (a4 == 1)
    {
      v5 = PKLocalizedFeatureString();
    }
    else
    {
      v5 = 0;
    }
LABEL_10:
    id v6 = PKLocalizedFeatureString();
    if (v5) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
  id v6 = PKLocalizedMadisonString(&cfstr_AccountMergeIn.isa);
  uint64_t v7 = PKLocalizedMadisonString(&cfstr_AccountMergeIn_0.isa);
  v5 = (void *)v7;
  if (!v6) {
    goto LABEL_10;
  }
  if (v7) {
    goto LABEL_6;
  }
LABEL_11:
  v5 = PKLocalizedFeatureString();
LABEL_6:
  uint64_t v8 = PKDisplayableErrorCustom();

  return v8;
}

+ (id)alertControllerForDisplayableError:(id)a3
{
  return (id)[a1 alertControllerForDisplayableError:a3 handler:0];
}

+ (id)alertControllerForDisplayableError:(id)a3 handler:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = (void *)MEMORY[0x1E4FB1418];
    id v7 = a3;
    uint64_t v8 = PKTitleForDisplayableError();
    uint64_t v9 = MEMORY[0x1A6221F20](v7);

    a3 = [v6 alertControllerWithTitle:v8 message:v9 preferredStyle:1];

    uint64_t v10 = (void *)MEMORY[0x1E4FB1410];
    v11 = PKLocalizedString(&cfstr_CancelButtonTi.isa);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __81__PKAccountBillPaymentViewController_alertControllerForDisplayableError_handler___block_invoke;
    v14[3] = &unk_1E59CB150;
    id v15 = v5;
    v12 = [v10 actionWithTitle:v11 style:1 handler:v14];

    [a3 addAction:v12];
  }

  return a3;
}

uint64_t __81__PKAccountBillPaymentViewController_alertControllerForDisplayableError_handler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)backgroundColor
{
  return (id)[MEMORY[0x1E4FB1618] systemBackgroundColor];
}

+ (void)billPaymentViewControllerForAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 configuration:(id)a6 withCompletion:(id)a7
{
  id v50 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, PKAccountBillPaymentViewController *))a7;
  if (v15)
  {
    id v39 = a1;
    id v42 = v50;
    v16 = [v42 creditDetails];
    v17 = [v16 accountSummary];
    v18 = [v17 balanceSummary];
    v49 = [v17 adjustedBalance];
    v48 = [v17 pastDueAmount];
    v47 = [v18 pendingPurchases];
    uint64_t v43 = [v17 cyclesPastDue];
    uint64_t v19 = [v16 createdDate];
    id v20 = objc_alloc(MEMORY[0x1E4F1C9A8]);
    v21 = (void *)[v20 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
    uint64_t v22 = [MEMORY[0x1E4F1C9C8] date];
    v46 = v18;
    v45 = (void *)v19;
    if (v19 && [v21 isDate:v19 equalToDate:v22 toUnitGranularity:8]) {
      int v23 = [v21 isDate:v19 equalToDate:v22 toUnitGranularity:4] ^ 1;
    }
    else {
      int v23 = 1;
    }
    int v38 = v23;
    BOOL v24 = (int)v47;
    v44 = (void *)v22;
    if (v47)
    {
      v25 = [MEMORY[0x1E4F28C28] zero];
      BOOL v24 = [v47 compare:v25] == 1;
    }
    id v40 = v12;
    id v41 = v13;
    if (v49)
    {
      v26 = [MEMORY[0x1E4F28C28] zero];
      int v27 = [v49 compare:v26] == 1;
    }
    else
    {
      int v27 = 0;
    }
    BOOL v28 = (int)v48;
    if (v43 <= 0)
    {
      v29 = v42;
      if (v48)
      {
        [MEMORY[0x1E4F28C28] zero];
        v31 = BOOL v30 = v24;
        BOOL v28 = [v48 compare:v31] == 1;

        BOOL v24 = v30;
      }
    }
    else
    {
      v29 = v42;
      BOOL v28 = 1;
    }
    v32 = [v14 earlyInstallmentPlan];
    uint64_t v33 = [v16 numberOfActiveStatementedInstallments];
    if (v32)
    {
      if (v33 <= 1) {
        uint64_t v34 = 6;
      }
      else {
        uint64_t v34 = 7;
      }
    }
    else
    {
      int v35 = newInstallmentsForAccount(v29, 0);
      uint64_t v36 = 5;
      if (!v35) {
        uint64_t v36 = 0;
      }
      if ((v38 | v27 | v24) == 1)
      {
        if ((v27 | v24) == 1)
        {
          if (v28) {
            uint64_t v36 = 4;
          }
          if ((v24 & ~v27) != 0) {
            uint64_t v34 = 3;
          }
          else {
            uint64_t v34 = v36;
          }
        }
        else
        {
          uint64_t v34 = 2;
        }
      }
      else
      {
        uint64_t v34 = 1;
      }
    }
    id v12 = v40;
    id v13 = v41;

    if (v34)
    {
      v37 = [[PKAccountBillPaymentViewController alloc] initWithAccount:v29 accountUserCollection:v40 transactionSource:v41 suggestedAmountController:0 configuration:v14 interstitalState:v34];
      v15[2](v15, v37);
    }
    else
    {
      [v39 _billPaymentViewControllerForAccount:v29 accountUserCollection:v40 transactionSource:v41 configuration:v14 withCompletion:v15];
    }
  }
}

+ (void)_billPaymentViewControllerForAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 configuration:(id)a6 withCompletion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v16 = (void *)MEMORY[0x1E4F84570];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __144__PKAccountBillPaymentViewController__billPaymentViewControllerForAccount_accountUserCollection_transactionSource_configuration_withCompletion___block_invoke;
  v22[3] = &unk_1E59CDEA0;
  id v26 = v14;
  id v27 = v15;
  id v23 = v11;
  id v24 = v12;
  id v25 = v13;
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  id v20 = v11;
  id v21 = v15;
  [v16 defaultControllerForAccount:v20 accountUserCollection:v19 transactionSource:v18 configuration:v17 completion:v22];
}

void __144__PKAccountBillPaymentViewController__billPaymentViewControllerForAccount_accountUserCollection_transactionSource_configuration_withCompletion___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[8];
  id v4 = a2;
  id v5 = [[PKAccountBillPaymentViewController alloc] initWithAccount:a1[4] accountUserCollection:a1[5] transactionSource:a1[6] suggestedAmountController:v4 configuration:a1[7] interstitalState:0];

  (*(void (**)(uint64_t, PKAccountBillPaymentViewController *))(v3 + 16))(v3, v5);
}

+ (UIEdgeInsets)contentMargins
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  if (v2 > 4) {
    double v3 = 44.0;
  }
  else {
    double v3 = dbl_1A0443250[v2];
  }
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

+ (double)ringTopMargin
{
  double v2 = 21.0;
  if ((PKUserInterfaceIdiomSupportsLargeLayouts() & 1) == 0)
  {
    unint64_t v3 = PKUIGetMinScreenType();
    if (v3 > 8) {
      return 64.0;
    }
    else {
      return dbl_1A0443278[v3];
    }
  }
  return v2;
}

+ (double)smallRingTopMargin
{
  double v2 = 14.0;
  if ((PKUserInterfaceIdiomSupportsLargeLayouts() & 1) == 0)
  {
    unint64_t v3 = PKUIGetMinScreenType();
    double v2 = 21.0;
    if (v3 <= 8) {
      return dbl_1A04432C0[v3];
    }
  }
  return v2;
}

+ (CGSize)smallRingSizeWithAccessibilityLayout:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = PKUIGetMinScreenWidthType();
  double v5 = 120.0;
  if (v3) {
    double v5 = 64.0;
  }
  if (!v4) {
    double v5 = 54.0;
  }
  double v6 = v5;
  result.height = v6;
  result.width = v5;
  return result;
}

- (PKAccountBillPaymentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0;
}

- (PKAccountBillPaymentViewController)initWithSuggestedAmountController:(id)a3 transactionSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v7 account];
  uint64_t v9 = [v7 accountUserCollection];
  uint64_t v10 = [(PKAccountBillPaymentViewController *)self initWithSuggestedAmountController:v7 account:v8 accountUserCollection:v9 transactionSource:v6 configuration:0 interstitialState:0];

  return v10;
}

- (PKAccountBillPaymentViewController)initWithSuggestedAmountController:(id)a3 account:(id)a4 accountUserCollection:(id)a5 transactionSource:(id)a6 configuration:(id)a7 interstitialState:(unint64_t)a8
{
  return [(PKAccountBillPaymentViewController *)self initWithAccount:a4 accountUserCollection:a5 transactionSource:a6 suggestedAmountController:a3 configuration:a7 interstitalState:a8];
}

- (PKAccountBillPaymentViewController)initWithAccount:(id)a3 accountUserCollection:(id)a4 transactionSource:(id)a5 suggestedAmountController:(id)a6 configuration:(id)a7 interstitalState:(unint64_t)a8
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v63 = a6;
  id v64 = a7;
  v70.receiver = self;
  v70.super_class = (Class)PKAccountBillPaymentViewController;
  id v18 = [(PKAccountBillPaymentViewController *)&v70 initWithNibName:0 bundle:0];
  id v19 = v18;
  if (v18)
  {
    id v60 = v16;
    id v62 = v17;
    objc_storeStrong((id *)&v18->_account, a3);
    objc_storeStrong((id *)&v19->_accountUserCollection, a4);
    objc_storeStrong((id *)&v19->_transactionSource, a5);
    v19->_unint64_t interstitialState = a8;
    if (a8 > 5) {
      unint64_t v20 = 0;
    }
    else {
      unint64_t v20 = qword_1A0443308[a8];
    }
    v19->_featuredViewState = v20;
    objc_storeStrong((id *)&v19->_configuration, a7);
    v19->_viewIsEnabled = 1;
    v19->_payButtonsEnabled = 1;
    v19->_shouldEnablePayLaterButton = 1;
    CGPoint v21 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v22 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v19->_lastKeyboardFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v19->_lastKeyboardFrame.size = v22;
    v19->_keyboardFrame.origin = v21;
    v19->_keyboardFrame.size = v22;
    objc_storeStrong((id *)&v19->_suggestedAmountController, a6);
    uint64_t v23 = [(PKBillPaymentSuggestedAmountController *)v19->_suggestedAmountController generateAmountSuggestionListWithFinHealth:PKFinHealthBillPaymentSuggestionsEnabled()];
    suggestionList = v19->_suggestionList;
    v19->_suggestionList = (PKBillPaymentSuggestedAmountList *)v23;

    unint64_t interstitialState = v19->_interstitialState;
    if (interstitialState - 6 < 2)
    {
      uint64_t v30 = [v64 earlyInstallmentPlan];
      v31 = (void *)v30;
      if (v30)
      {
        uint64_t v71 = v30;
        uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
        installmentPlans = v19->_installmentPlans;
        v19->_installmentPlans = (NSArray *)v32;
      }
    }
    else if (interstitialState == 5)
    {
      id v69 = objc_alloc_init(MEMORY[0x1E4F1C978]);
      newInstallmentsForAccount(v15, &v69);
      uint64_t v34 = [v69 copy];
      int v35 = v19->_installmentPlans;
      v19->_installmentPlans = (NSArray *)v34;

      id v36 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      v37 = v19->_installmentPlans;
      uint64_t v38 = [(NSArray *)v37 countByEnumeratingWithState:&v65 objects:v72 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v66 != v40) {
              objc_enumerationMutation(v37);
            }
            id v42 = objc_msgSend(*(id *)(*((void *)&v65 + 1) + 8 * i), "identifier", v60);
            [v36 addObject:v42];
          }
          uint64_t v39 = [(NSArray *)v37 countByEnumeratingWithState:&v65 objects:v72 count:16];
        }
        while (v39);
      }

      if ([v36 count])
      {
        uint64_t v43 = [MEMORY[0x1E4F84270] sharedInstance];
        v44 = [(PKAccount *)v19->_account accountIdentifier];
        [v43 markUserViewedIntroduction:1 forInstallmentIdentifiers:v36 accountIdentifier:v44];
      }
    }
    else if (!interstitialState)
    {
      id v26 = objc_alloc(MEMORY[0x1E4F841C0]);
      id v27 = [v17 paymentPass];
      uint64_t v28 = [v26 initWithAccount:v15 paymentPass:v27];
      billPaymentCoordinator = v19->_billPaymentCoordinator;
      v19->_billPaymentCoordinator = (PKAccountBillPaymentController *)v28;

      [(PKAccountBillPaymentController *)v19->_billPaymentCoordinator setDelegate:v19];
    }
    v45 = objc_msgSend(v15, "creditDetails", v60);
    v46 = [v45 rates];
    uint64_t v47 = [v46 aprForPurchases];
    apr = v19->_apr;
    v19->_apr = (NSDecimalNumber *)v47;

    v49 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    interestDateFormatter = v19->_interestDateFormatter;
    v19->_interestDateFormatter = v49;

    v51 = v19->_interestDateFormatter;
    v52 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSDateFormatter *)v51 setLocale:v52];

    [(NSDateFormatter *)v19->_interestDateFormatter setLocalizedDateFormatFromTemplate:@"MMM d"];
    v53 = [v45 currencyCode];
    uint64_t v54 = PKMutableNumberFormatterForCurrencyCode();
    amountFormatter = v19->_amountFormatter;
    v19->_amountFormatter = (NSNumberFormatter *)v54;

    v56 = [(PKAccountBillPaymentViewController *)v19 navigationItem];
    objc_msgSend(v56, "pkui_setupScrollEdgeChromelessAppearance");
    objc_msgSend(v56, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 0.0);
    v57 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:v19 action:sel__cancelButtonTapped_];
    [v57 setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
    [v56 setLeftBarButtonItem:v57];
    v58 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v58 addObserver:v19 selector:sel__accountDidChange_ name:*MEMORY[0x1E4F85BF8] object:0];

    id v16 = v61;
    id v17 = v62;
  }

  return v19;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  CLInUse = self->_CLInUse;
  if (CLInUse)
  {
    [(CLInUseAssertion *)CLInUse invalidate];
    double v5 = self->_CLInUse;
    self->_CLInUse = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)PKAccountBillPaymentViewController;
  [(PKAccountBillPaymentViewController *)&v6 dealloc];
}

- (void)loadView
{
  v108[1] = *MEMORY[0x1E4F143B8];
  v104.receiver = self;
  v104.super_class = (Class)PKAccountBillPaymentViewController;
  [(PKAccountBillPaymentViewController *)&v104 loadView];
  [(PKAccount *)self->_account feature];
  unint64_t featuredViewState = self->_featuredViewState;
  unint64_t v4 = PKUIGetMinScreenType();
  if (featuredViewState != 1 || PKUIGetMinScreenWidthType() || PKIsVision())
  {
    double v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v5;

    [(UILabel *)self->_titleLabel setTextAlignment:1];
    id v7 = self->_titleLabel;
    uint64_t v8 = [(PKAccountBillPaymentViewController *)self _title];
    [(UILabel *)v7 setText:v8];

    uint64_t v9 = self->_titleLabel;
    uint64_t v10 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB2980], (void *)*MEMORY[0x1E4FB27B8], 32770, 0);
    [(UILabel *)v9 setFont:v10];

    [(UILabel *)self->_titleLabel setNumberOfLines:0];
    [(UILabel *)self->_titleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];
  }
  BOOL v14 = featuredViewState != 1 || v4 == 4 || v4 == 5 || v4 == 6 || v4 > 8;
  id v15 = (void **)MEMORY[0x1E4FB28C8];
  id v16 = (void **)MEMORY[0x1E4FB2790];
  if (v14 || PKIsVision())
  {
    id v17 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v17;

    [(UILabel *)self->_subtitleLabel setTextAlignment:1];
    id v19 = self->_subtitleLabel;
    unint64_t v20 = PKFontForDefaultDesign(*v15, *v16, 0x8000, 0);
    [(UILabel *)v19 setFont:v20];

    [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
    [(UILabel *)self->_subtitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F85A60]];
  }
  [(PKAccountBillPaymentViewController *)self _updateSubtitle];
  CGPoint v21 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  smallRingInterestLabel = self->_smallRingInterestLabel;
  self->_smallRingInterestLabel = v21;

  [(UILabel *)self->_smallRingInterestLabel setBaselineAdjustment:1];
  [(UILabel *)self->_smallRingInterestLabel setTextAlignment:1];
  [(UILabel *)self->_smallRingInterestLabel setNumberOfLines:0];
  [(UILabel *)self->_smallRingInterestLabel setAlpha:0.0];
  uint64_t v23 = [[PKBillPaymentRingView alloc] initWithSuggestedAmountList:self->_suggestionList delegate:self dataSource:self];
  ringView = self->_ringView;
  self->_ringView = v23;

  [(PKBillPaymentRingView *)self->_ringView setEnabled:self->_interstitialState == 0];
  [(PKBillPaymentRingView *)self->_ringView setHidden:featuredViewState != 1];
  id v25 = [(PKBillPaymentRingView *)self->_ringView layer];
  objc_msgSend(v25, "setAnchorPoint:", 0.5, 0.0);

  id v26 = [[PKAccountBillPaymentAmountDescriptionView alloc] initWithSuggestedAmountList:self->_suggestionList account:self->_account configuration:self->_configuration delegate:self];
  amountDescriptionView = self->_amountDescriptionView;
  self->_amountDescriptionView = v26;

  uint64_t v28 = self->_amountDescriptionView;
  v29 = [(PKAccount *)self->_account schedulePaymentFeatureDescriptor];
  uint64_t v30 = [v29 minimumAmount];
  [(PKAccountBillPaymentAmountDescriptionView *)v28 setMinimumAmount:v30];

  v31 = self->_amountDescriptionView;
  if (PKBroadwayAllowOverpaymentViaKeypadKey())
  {
    [(PKAccountBillPaymentAmountDescriptionView *)v31 setMaximumAmount:0];
  }
  else
  {
    uint64_t v32 = [(PKBillPaymentSuggestedAmountList *)self->_suggestionList maximumAmount];
    [(PKAccountBillPaymentAmountDescriptionView *)v31 setMaximumAmount:v32];
  }
  [(PKAccountBillPaymentViewController *)self _setupAmountDescriptionViewForInterstitial];
  uint64_t v33 = (NSString *)*v16;
  v95 = (NSString *)*v15;
  v96 = PKFontForDefaultDesign(*v15, *v16, 2, 0);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PKAccountBillPaymentViewController_loadView__block_invoke;
  aBlock[3] = &unk_1E59CDEC8;
  aBlock[4] = v96;
  v97 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  objc_initWeak(&location, self);
  uint64_t v34 = [MEMORY[0x1E4FB1618] labelColor];
  int v35 = [(id)objc_opt_class() backgroundColor];
  v97[2](v97, v34, v35);
  id v36 = (PKLegacyButtonInterface *)objc_claimAutoreleasedReturnValue();
  primaryButton = self->_primaryButton;
  self->_primaryButton = v36;

  [(PKLegacyButtonInterface *)self->_primaryButton setAccessibilityIdentifier:*MEMORY[0x1E4F85878]];
  unint64_t interstitialState = self->_interstitialState;
  if (interstitialState - 4 >= 3)
  {
    if (interstitialState == 7)
    {
      v45 = PKLocalizedFeatureString();
      uint64_t v54 = (void *)MEMORY[0x1E4FB14D8];
      v55 = PKLocalizedFeatureString();
      v56 = PKFontForDefaultDesign(v95, v33);
      v57 = objc_msgSend(v54, "pkui_plainConfigurationWithTitle:font:", v55, v56);

      v58 = (void *)MEMORY[0x1E4FB13F0];
      v98[0] = MEMORY[0x1E4F143A8];
      v98[1] = 3221225472;
      v98[2] = __46__PKAccountBillPaymentViewController_loadView__block_invoke_4;
      v98[3] = &unk_1E59CBEE0;
      objc_copyWeak(&v99, &location);
      v59 = [v58 actionWithHandler:v98];
      id v60 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v57 primaryAction:v59];
      tertiaryButton = self->_tertiaryButton;
      self->_tertiaryButton = v60;

      [(UIButton *)self->_tertiaryButton setConfigurationUpdateHandler:&__block_literal_global_80];
      [(UIButton *)self->_tertiaryButton sizeToFit];

      objc_destroyWeak(&v99);
      goto LABEL_31;
    }
    if (!interstitialState)
    {
      self->_buttonsArePayButtons = 1;
      uint64_t v40 = [(PKAccountBillPaymentViewController *)self _paymentAmount];
      [(PKAccountBillPaymentViewController *)self _updatePayNowButtonTitleWithAmount:v40];

      [(PKLegacyButtonInterface *)self->_primaryButton addTarget:self action:sel__payNowButtonTapped_ forControlEvents:64];
      id v41 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
      id v42 = [MEMORY[0x1E4FB1618] labelColor];
      v97[2](v97, v41, v42);
      uint64_t v43 = (PKLegacyButtonInterface *)objc_claimAutoreleasedReturnValue();
      secondaryButton = self->_secondaryButton;
      self->_secondaryButton = v43;

      v45 = PKLocalizedFeatureString();
      [(PKLegacyButtonInterface *)self->_secondaryButton setTitle:v45 forState:0];
      [(PKLegacyButtonInterface *)self->_secondaryButton addTarget:self action:sel__payLaterButtonTapped_ forControlEvents:64];
      [(PKLegacyButtonInterface *)self->_secondaryButton sizeToFit];
      [(PKLegacyButtonInterface *)self->_secondaryButton setAccessibilityIdentifier:*MEMORY[0x1E4F85978]];
      v46 = (void *)MEMORY[0x1E4FB13F0];
      v100[0] = MEMORY[0x1E4F143A8];
      v100[1] = 3221225472;
      v100[2] = __46__PKAccountBillPaymentViewController_loadView__block_invoke_2;
      v100[3] = &unk_1E59CBEE0;
      objc_copyWeak(&v101, &location);
      uint64_t v47 = [v46 actionWithHandler:v100];
      v48 = PKLocalizedFeatureString();
      v49 = (void *)MEMORY[0x1E4FB14D8];
      id v50 = PKFontForDefaultDesign(v95, v33);
      v51 = objc_msgSend(v49, "pkui_plainConfigurationWithTitle:font:", v48, v50);

      v52 = [MEMORY[0x1E4FB14D0] buttonWithConfiguration:v51 primaryAction:v47];
      v53 = self->_tertiaryButton;
      self->_tertiaryButton = v52;

      [(UIButton *)self->_tertiaryButton setConfigurationUpdateHandler:&__block_literal_global_38];
      [(UIButton *)self->_tertiaryButton sizeToFit];
      [(UIButton *)self->_tertiaryButton setAccessibilityIdentifier:*MEMORY[0x1E4F85AA8]];

      objc_destroyWeak(&v101);
      goto LABEL_33;
    }
    uint64_t v39 = PKLocalizedString(&cfstr_Done.isa);
  }
  else
  {
    uint64_t v39 = PKLocalizedPaymentString(&cfstr_Continue.isa);
  }
  v45 = (void *)v39;
LABEL_31:
  [(PKLegacyButtonInterface *)self->_primaryButton setTitle:v45 forState:0];
  [(PKLegacyButtonInterface *)self->_primaryButton addTarget:self action:sel__interstitialButtonTapped_ forControlEvents:64];
  if (self->_featuredViewState == 2)
  {
    id v62 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    productHeroView = self->_productHeroView;
    self->_productHeroView = v62;

    [(UIImageView *)self->_productHeroView setAccessibilityIgnoresInvertColors:1];
    [(PKAccountBillPaymentViewController *)self _configureProductHeroView];
  }
LABEL_33:

  [(PKLegacyButtonInterface *)self->_primaryButton sizeToFit];
  id v64 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
  scrollView = self->_scrollView;
  self->_scrollView = v64;

  [(UIScrollView *)self->_scrollView setDelegate:self];
  long long v66 = [_PKVisibilityBackdropView alloc];
  long long v67 = -[_PKVisibilityBackdropView initWithFrame:privateStyle:](v66, "initWithFrame:privateStyle:", -2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  blurringView = self->_blurringView;
  self->_blurringView = v67;

  [(_PKVisibilityBackdropView *)self->_blurringView setDelegate:self];
  [(_PKVisibilityBackdropView *)self->_blurringView setUserInteractionEnabled:1];
  [(_PKVisibilityBackdropView *)self->_blurringView pkui_setVisibility:0 animated:0.0];
  id v69 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v69 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
  [v69 addObserver:self selector:sel_keyboardWillChange_ name:*MEMORY[0x1E4FB2C48] object:0];
  [v69 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
  v94 = v69;
  objc_super v70 = [(PKAccountBillPaymentViewController *)self view];
  uint64_t v71 = [(id)objc_opt_class() backgroundColor];
  [v70 setBackgroundColor:v71];

  [v70 addSubview:self->_scrollView];
  [v70 addSubview:self->_blurringView];
  v72 = [(_UIBackdropView *)self->_blurringView contentView];
  [v72 addSubview:self->_tertiaryButton];
  [v72 addSubview:self->_secondaryButton];
  [v72 addSubview:self->_primaryButton];
  [(UIScrollView *)self->_scrollView addSubview:self->_ringView];
  [(UIScrollView *)self->_scrollView addSubview:self->_productHeroView];
  [(UIScrollView *)self->_scrollView addSubview:self->_amountDescriptionView];
  [(UIScrollView *)self->_scrollView addSubview:self->_titleLabel];
  [(UIScrollView *)self->_scrollView addSubview:self->_subtitleLabel];
  [(UIScrollView *)self->_scrollView addSubview:self->_smallRingInterestLabel];
  [v70 setUserInteractionEnabled:self->_viewIsEnabled];
  BOOL v73 = !self->_buttonsArePayButtons || self->_payButtonsEnabled;
  [(PKLegacyButtonInterface *)self->_primaryButton setEnabled:v73];
  BOOL v74 = self->_shouldEnablePayLaterButton && self->_payButtonsEnabled;
  [(PKLegacyButtonInterface *)self->_secondaryButton setEnabled:v74];
  [(PKLegacyButtonInterface *)self->_primaryButton setShowSpinner:!self->_viewIsEnabled];
  [(UIButton *)self->_tertiaryButton setEnabled:self->_viewIsEnabled];
  v75 = [(PKAccountBillPaymentViewController *)self traitCollection];
  v76 = [v75 preferredContentSizeCategory];

  v77 = (NSString *)*MEMORY[0x1E4FB27D0];
  self->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v76, (UIContentSizeCategory)*MEMORY[0x1E4FB27D0]) == NSOrderedDescending;
  self->_usesLargestAccessibilityLayout = (unint64_t)UIContentSizeCategoryCompareToCategory(v76, (UIContentSizeCategory)*MEMORY[0x1E4FB2778]) < 2;
  BOOL v78 = [(PKAccountBillPaymentViewController *)self _interestLabelIsOutsideSmallRing];
  v79 = (void *)*MEMORY[0x1E4FB28F0];
  if (v78) {
    v80 = (NSString *)*MEMORY[0x1E4FB28F0];
  }
  else {
    v80 = v95;
  }
  if (v78) {
    v81 = v33;
  }
  else {
    v81 = v77;
  }
  v82 = PKFontForDesign((void *)*MEMORY[0x1E4FB0938], v80, v81, 0x8000, 0);
  v83 = objc_msgSend(v82, "pk_fixedWidthFont");

  uint64_t v107 = *MEMORY[0x1E4FB06F8];
  uint64_t v84 = v107;
  v108[0] = v83;
  v85 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v108 forKeys:&v107 count:1];
  v86 = (NSMutableDictionary *)[v85 mutableCopy];
  smallRingInterestAttributes = self->_smallRingInterestAttributes;
  self->_smallRingInterestAttributes = v86;

  v88 = PKFontForDefaultDesign(v79, v33, 0x8000, 0);
  v106[0] = v88;
  uint64_t v89 = *MEMORY[0x1E4FB0700];
  v105[0] = v84;
  v105[1] = v89;
  v90 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v106[1] = v90;
  v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v106 forKeys:v105 count:2];
  smallRingInterestDateAttributes = self->_smallRingInterestDateAttributes;
  self->_smallRingInterestDateAttributes = v91;

  [(PKAccountBillPaymentViewController *)self _updateNavigationTitle];
  [(PKAccountBillPaymentViewController *)self _updateForShowKeyboardAnimated:0];
  v93 = [(PKAccountBillPaymentViewController *)self view];
  [v93 setAccessibilityIdentifier:*MEMORY[0x1E4F852E8]];

  objc_destroyWeak(&location);
}

PKContinuousButton *__46__PKAccountBillPaymentViewController_loadView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v10 = 0x402C000000000000;
  long long v11 = xmmword_1A040E960;
  int64x2_t v12 = vdupq_n_s64(2uLL);
  id v7 = [[PKContinuousButton alloc] initWithConfiguration:&v10];
  [(PKContinuousButton *)v7 setTintColor:v6];

  [(PKContinuousButton *)v7 updateTitleColorWithColor:v5];
  [(PKContinuousButton *)v7 updateActivityIndicatorColorWithColor:v5];

  -[PKContinuousButton setContentEdgeInsets:](v7, "setContentEdgeInsets:", 0.0, 14.0, 0.0, 14.0);
  uint64_t v8 = [(PKContinuousButton *)v7 titleLabel];
  [v8 setFont:*(void *)(a1 + 32)];
  [v8 setAdjustsFontSizeToFitWidth:1];

  return v7;
}

void __46__PKAccountBillPaymentViewController_loadView__block_invoke_2(uint64_t a1, void *a2)
{
  double v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  unint64_t v4 = [v3 sender];

  [WeakRetained _showKeyboardButtonTapped:v4];
}

void __46__PKAccountBillPaymentViewController_loadView__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setExclusiveTouch:1];
  id v3 = [v2 titleLabel];
  [v3 setTextAlignment:1];

  id v4 = [v2 titleLabel];

  [v4 setNumberOfLines:0];
}

void __46__PKAccountBillPaymentViewController_loadView__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 sender];

  [WeakRetained _contactSupportButtonTapped:v4];
}

void __46__PKAccountBillPaymentViewController_loadView__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setExclusiveTouch:1];
  id v3 = [v2 titleLabel];
  [v3 setTextAlignment:1];

  id v4 = [v2 titleLabel];

  [v4 setNumberOfLines:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKAccountBillPaymentViewController;
  [(PKAccountBillPaymentViewController *)&v11 traitCollectionDidChange:v4];
  id v5 = [(PKAccountBillPaymentViewController *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  if (v4 && v5)
  {
    id v7 = [v4 preferredContentSizeCategory];
    NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v7, v6);

    if (v8 == NSOrderedSame) {
      goto LABEL_10;
    }
  }
  else if (!v5 || v4)
  {
    goto LABEL_10;
  }
  self->_usesAccessibilityLayout = UIContentSizeCategoryCompareToCategory(v6, (UIContentSizeCategory)*MEMORY[0x1E4FB27D0]) == NSOrderedDescending;
  uint64_t v9 = [(PKAccountBillPaymentViewController *)self viewIfLoaded];
  uint64_t v10 = v9;
  if (v9) {
    [v9 setNeedsLayout];
  }

LABEL_10:
}

- (void)viewWillLayoutSubviews
{
  v82.receiver = self;
  v82.super_class = (Class)PKAccountBillPaymentViewController;
  id v3 = [(PKAccountBillPaymentViewController *)&v82 viewWillLayoutSubviews];
  id v4 = (void *)MEMORY[0x1A6224460](v3);
  self->_inLayoutSubviews = 1;
  id v5 = [(PKAccountBillPaymentViewController *)self view];
  [v5 safeAreaInsets];
  double v7 = v6;
  double v9 = v8;
  [v5 bounds];
  CGFloat v11 = v10;
  double v13 = v12;
  CGFloat v75 = v15;
  double v76 = v14;
  -[UIScrollView setFrame:](self->_scrollView, "setFrame:");
  memset(&slice, 0, sizeof(slice));
  [(id)objc_opt_class() contentMargins];
  objc_msgSend(v5, "pkui_readableContentBoundsWithMargins:");
  double v17 = v16;
  uint64_t v18 = PKUIGetMinScreenWidthType();
  double v19 = 15.0;
  if (!v18) {
    double v19 = 10.0;
  }
  double rect_16 = v19;
  PKFloatRoundToPixel();
  double v21 = fmin(v20, 360.0);
  double v22 = fmin(v17, 360.0);
  double v23 = __60__PKAccountBillPaymentViewController_viewWillLayoutSubviews__block_invoke(self->_secondaryButton);
  double v24 = __60__PKAccountBillPaymentViewController_viewWillLayoutSubviews__block_invoke(self->_primaryButton);
  BOOL v25 = v23 <= v21 && v24 <= v21;
  if (v25 && self->_primaryButton && self->_secondaryButton)
  {
    int v26 = 0;
  }
  else
  {
    int v26 = 1;
    double v21 = v22;
  }
  [(PKAccountBillPaymentViewController *)self _buttonHeightForButtonWidth:v21];
  double v28 = v27;
  remainder.origin.CGFloat x = v11;
  remainder.origin.double y = v76;
  remainder.size.CGFloat width = v75;
  remainder.size.CGFloat height = v13;
  CGFloat rect = v11;
  double rect_8 = v22;
  if (PKUIGetMinScreenWidthType())
  {
    BOOL v29 = [(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts];
    double v30 = 19.0;
    if (!v29) {
      double v30 = 24.0;
    }
    double v31 = 35.0;
    if (v29) {
      double v31 = 24.0;
    }
  }
  else
  {
    double v30 = 19.0;
    double v31 = 24.0;
  }
  double v32 = v28 + v30;
  double rect_24 = v17;
  double v74 = v7;
  if (self->_showKeyboard)
  {
    double v67 = v31;
    uint64_t v33 = &OBJC_IVAR___PKTitleDetailValueTextView__accessory;
    double v68 = v28;
    double v69 = v13;
    if (PKViewVisibilityStateIsVisible())
    {
      CGFloat x = *MEMORY[0x1E4F1DB20];
      double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      if (!CGRectIsNull(self->_keyboardFrame))
      {
        uint64_t v38 = [v5 window];
        uint64_t v39 = v38;
        if (v38)
        {
          objc_msgSend(v38, "convertRect:fromWindow:", 0, self->_keyboardFrame.origin.x, self->_keyboardFrame.origin.y, self->_keyboardFrame.size.width, self->_keyboardFrame.size.height);
          objc_msgSend(v5, "convertRect:fromView:", 0);
          CGFloat x = v40;
          double y = v41;
          CGFloat width = v42;
          CGFloat height = v43;
        }

        uint64_t v33 = &OBJC_IVAR___PKTitleDetailValueTextView__accessory;
      }
    }
    else
    {
      CGFloat x = self->_lastKeyboardFrame.origin.x;
      double y = self->_lastKeyboardFrame.origin.y;
      CGFloat width = self->_lastKeyboardFrame.size.width;
      CGFloat height = self->_lastKeyboardFrame.size.height;
    }
    v83.origin.CGFloat x = x;
    v83.origin.double y = y;
    v83.size.CGFloat width = width;
    v83.size.CGFloat height = height;
    double v46 = 0.0;
    if (!CGRectIsNull(v83) && ([MEMORY[0x1E4FB18E0] isInHardwareKeyboardMode] & 1) == 0)
    {
      double v47 = fmax(v76 + v69 - y - v9, 0.0);
      double v32 = v32 + v47;
      double v46 = v47 + 0.0;
    }
    v48 = (double *)((char *)self + v33[962]);
    double *v48 = x;
    v48[1] = y;
    v48[2] = width;
    v48[3] = height;
    double v13 = v69;
    double v31 = v67;
    double v28 = v68;
    if (v26)
    {
LABEL_34:
      if (self->_primaryButton && self->_secondaryButton) {
        double v32 = v28 + 15.0 + v32;
      }
    }
  }
  else
  {
    double v44 = v28 + 3.0 + 3.0;
    if (!self->_tertiaryButton) {
      double v44 = -0.0;
    }
    double v32 = v32 + v44;
    CGSize v45 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_lastKeyboardFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_lastKeyboardFrame.size = v45;
    double v46 = 0.0;
    if (v26) {
      goto LABEL_34;
    }
  }
  if (self->_showKeyboard || v9 <= 0.0 && !self->_tertiaryButton)
  {
    double v49 = v28;
    if (v9 <= 0.0) {
      double v50 = v31;
    }
    else {
      double v50 = v9;
    }
    double v32 = v50 + v32;
    double v46 = v50 + v46;
  }
  else
  {
    double v49 = v28;
  }
  double v51 = v9 + v32;
  v84.origin.CGFloat x = rect;
  v84.size.CGFloat width = v75;
  v84.origin.double y = v76;
  v84.size.CGFloat height = v13;
  CGRectDivide(v84, &slice, &remainder, v9 + v32, CGRectMaxYEdge);
  -[_PKVisibilityBackdropView setFrame:](self->_blurringView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  [(_PKVisibilityBackdropView *)self->_blurringView layoutIfNeeded];
  [(UIScrollView *)self->_scrollView contentInset];
  double v52 = v9 + v32 - v9;
  if (v52 != v53) {
    -[UIScrollView setContentInset:](self->_scrollView, "setContentInset:");
  }
  double v54 = v9 + v46;
  [(UIScrollView *)self->_scrollView verticalScrollIndicatorInsets];
  if (v52 != v55) {
    -[UIScrollView setVerticalScrollIndicatorInsets:](self->_scrollView, "setVerticalScrollIndicatorInsets:");
  }
  *(double *)v77 = rect_24;
  *(double *)&v77[1] = rect_8;
  *(double *)&v77[2] = v21;
  *(double *)&v77[3] = v49;
  *(double *)&v77[4] = rect_16;
  *(double *)&v77[5] = v54;
  char v78 = v26;
  memset(v79, 0, sizeof(v79));
  [(PKAccountBillPaymentViewController *)self _layoutFooterWithState:v77];
  [(PKAccountBillPaymentViewController *)self _layoutScrollViewWithContentWidth:rect_24];
  double v57 = v56;
  double v59 = v58;
  [(UIScrollView *)self->_scrollView contentSize];
  if (v57 != v61 || v59 != v60) {
    -[UIScrollView setContentSize:](self->_scrollView, "setContentSize:", v57, v59);
  }
  [(UIScrollView *)self->_scrollView bounds];
  if (v59 <= v63 - v74 - v51) {
    double v64 = 0.0;
  }
  else {
    double v64 = fmin(fmax((v59 - v62 - (v13 - v51)) / (v13 - v51 + 8.0 - (v13 - v51)), 0.0), 1.0);
  }
  [(_PKVisibilityBackdropView *)self->_blurringView pkui_setVisibility:0 animated:v64];
  scrollView = self->_scrollView;
  long long v66 = [(PKAccountBillPaymentViewController *)self navigationItem];
  [(UIScrollView *)scrollView pkui_adjustManualScrollEdgeAppearanceProgressForNavigationItem:v66];
}

double __60__PKAccountBillPaymentViewController_viewWillLayoutSubviews__block_invoke(void *a1)
{
  if (!a1) {
    return 0.0;
  }
  id v1 = a1;
  [v1 contentEdgeInsets];
  double v3 = v2;
  double v5 = v4;
  double v6 = [v1 titleLabel];

  objc_msgSend(v6, "pkui_sizeThatFits:", 1.79769313e308, 1.79769313e308);
  double v8 = v7;

  return v5 + v3 + v8;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKAccountBillPaymentViewController;
  [(PKAccountBillPaymentViewController *)&v3 viewDidLayoutSubviews];
  self->_inLayoutSubviews = 0;
}

- (CGSize)_layoutScrollViewWithContentWidth:(double)a3
{
  [(UIScrollView *)self->_scrollView bounds];
  double v117 = v5;
  uint64_t v107 = v6;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", a3, 1.79769313e308);
  double v113 = v8;
  double v115 = v7;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", a3, 1.79769313e308);
  double v109 = v10;
  double v111 = v9;
  -[PKAccountBillPaymentAmountDescriptionView sizeThatFits:](self->_amountDescriptionView, "sizeThatFits:", a3, 1.79769313e308);
  double v119 = v12;
  double v121 = v11;
  double v105 = a3;
  -[PKBillPaymentRingView sizeThatFits:](self->_ringView, "sizeThatFits:", a3, 1.79769313e308);
  double v14 = v13;
  double v16 = v15;
  double v17 = [(UIImageView *)self->_productHeroView image];
  [v17 size];
  PKSizeAspectFit();
  double v19 = v18;
  double v21 = v20;

  [(id)objc_opt_class() smallRingSizeWithAccessibilityLayout:self->_usesAccessibilityLayout];
  double v24 = v22;
  double v25 = v22 / v14;
  if (self->_showKeyboard) {
    double v26 = v23;
  }
  else {
    double v26 = v16;
  }
  if (!self->_showKeyboard) {
    double v22 = v14;
  }
  double v98 = v22;
  double v100 = v26;
  double v27 = 1.0;
  double v103 = v25;
  if (self->_showKeyboard) {
    double v28 = v25;
  }
  else {
    double v28 = 1.0;
  }
  sCGFloat x = v28;
  if (self->_showKeyboard) {
    double v27 = 0.05;
  }
  double v118 = v27;
  BOOL v29 = (long long *)MEMORY[0x1E4F1DAD8];
  double v30 = *MEMORY[0x1E4F1DAD8];
  double v31 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  -[UILabel setBounds:](self->_titleLabel, "setBounds:", *MEMORY[0x1E4F1DAD8], v31, v115, v113);
  -[UILabel setBounds:](self->_subtitleLabel, "setBounds:", v30, v31, v111, v109);
  -[PKAccountBillPaymentAmountDescriptionView setBounds:](self->_amountDescriptionView, "setBounds:", v30, v31, v121, v119);
  -[UIImageView setBounds:](self->_productHeroView, "setBounds:", v30, v31, v19, v21);
  -[PKBillPaymentRingView setBounds:](self->_ringView, "setBounds:", v30, v31, v14, v16);
  [(PKBillPaymentRingView *)self->_ringView layoutIfNeeded];
  BOOL v32 = [(PKAccountBillPaymentViewController *)self _interestLabelIsOutsideSmallRing];
  if (v32)
  {
    smallRingInterestLabel = self->_smallRingInterestLabel;
    double v34 = v105;
    double v35 = 1.79769313e308;
  }
  else
  {
    [(PKBillPaymentRingView *)self->_ringView ringWidth];
    double v34 = v24 + v36 * -2.0 * v103 + -10.0;
    smallRingInterestLabel = self->_smallRingInterestLabel;
    double v35 = v34;
  }
  -[UILabel sizeThatFits:](smallRingInterestLabel, "sizeThatFits:", v34, v35);
  double v38 = v37;
  double v40 = v39;
  -[UILabel setBounds:](self->_smallRingInterestLabel, "setBounds:", v30, v31, v37, v39);
  double v42 = *MEMORY[0x1E4F1DB28];
  double v41 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v44 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  uint64_t v129 = 0;
  v130 = (double *)&v129;
  uint64_t v131 = 0x3010000000;
  v132 = "";
  long long v133 = *v29;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke;
  aBlock[3] = &unk_1E59CDEF0;
  aBlock[4] = &v129;
  *(double *)&void aBlock[5] = v117;
  aBlock[6] = v107;
  CGSize v45 = (double (**)(void, double, double))_Block_copy(aBlock);
  double v46 = v130;
  long long v127 = *((_OWORD *)v130 + 2);
  if (self->_titleLabel)
  {
    unint64_t v47 = PKUIGetMinScreenWidthType();
    double v48 = 7.0;
    if (v47 > 4) {
      double v48 = 15.0;
    }
    double v46 = v130;
    double v49 = v130[5] + v118 * v48;
  }
  else
  {
    if (!self->_subtitleLabel)
    {
      BOOL v57 = v32;
      double v106 = v41;
      double v108 = v42;
      double v102 = v44;
      double v104 = v43;
      goto LABEL_26;
    }
    double v49 = v130[5] + v118 * 20.0;
  }
  v46[5] = v49;
  double v102 = v44;
  double v104 = v43;
  double v106 = v41;
  double v108 = v42;
  if (self->_titleLabel)
  {
    double v50 = v45[2](v45, v115 * v118, v113 * v118);
    double v106 = v51;
    double v108 = v50;
    double v102 = v53;
    double v104 = v52;
    double v46 = v130;
    v130[5] = v130[5] + v118 * 15.0;
  }
  if (self->_subtitleLabel)
  {
    double v42 = v45[2](v45, v111 * v118, v109 * v118);
    double v41 = v54;
    double v43 = v55;
    double v44 = v56;
    BOOL v57 = v32;
    double v46 = v130;
  }
  else
  {
    BOOL v57 = v32;
  }
LABEL_26:
  if (self->_showKeyboard) {
    *((_OWORD *)v46 + 2) = v127;
  }
  long long v126 = *((_OWORD *)v46 + 2);
  double v114 = v43;
  double v116 = v41;
  double v112 = v44;
  if (self->_featuredViewState == 1)
  {
    if (self->_showKeyboard) {
      [(id)objc_opt_class() smallRingTopMargin];
    }
    else {
      [(id)objc_opt_class() ringTopMargin];
    }
    double v59 = v130 + 5;
    double v61 = v130[5];
  }
  else
  {
    double v60 = v46[5];
    double v59 = v46 + 5;
    double v58 = v60;
    double v61 = 20.0;
  }
  double *v59 = v61 + v58;
  double v62 = v45[2](v45, v98, v100);
  double v64 = v63;
  double v66 = v65;
  double v68 = v67;
  PKSizeAlignedInRect();
  double v110 = v69;
  double v99 = v71;
  double v101 = v70;
  double v97 = v72;
  if (!self->_featuredViewState) {
    *((_OWORD *)v130 + 2) = v126;
  }
  if (v57)
  {
    v130[5] = v130[5] + 8.0;
    v45[2](v45, v38, v40);
  }
  else
  {
    PKSizeAlignedInRect();
  }
  double v92 = v76;
  double v93 = v75;
  double v94 = v74;
  double v96 = v73;
  double v77 = v42;
  v130[5] = v130[5] + 20.0;
  double v78 = v45[2](v45, v121, v119);
  double v120 = v80;
  double v122 = v79;
  double v81 = v78;
  double v83 = v82;
  if (self->_showKeyboard) {
    double v84 = 0.0;
  }
  else {
    double v84 = 1.0;
  }
  [(UILabel *)self->_titleLabel setAlpha:v84];
  [(UILabel *)self->_subtitleLabel setAlpha:v84];
  [(UIButton *)self->_tertiaryButton setAlpha:v84];
  [(UIImageView *)self->_productHeroView setAlpha:v84];
  LOBYTE(v85) = self->_showKeyboard;
  [(UILabel *)self->_smallRingInterestLabel setAlpha:(double)v85];
  ringView = self->_ringView;
  CATransform3DMakeScale(&v125, sx, sx, 1.0);
  [(PKBillPaymentRingView *)ringView setTransform3D:&v125];
  memset(&v124, 0, sizeof(v124));
  CATransform3DMakeScale(&v124, v118, v118, 1.0);
  titleLabel = self->_titleLabel;
  CATransform3D v123 = v124;
  [(UILabel *)titleLabel setTransform3D:&v123];
  subtitleLabel = self->_subtitleLabel;
  CATransform3D v123 = v124;
  [(UILabel *)subtitleLabel setTransform3D:&v123];
  __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke_2(self->_titleLabel, v108, v106, v104, v102);
  __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke_2(self->_subtitleLabel, v77, v116, v114, v112);
  __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke_2(self->_ringView, v62, v64, v66, v68);
  __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke_2(self->_productHeroView, v110, v101, v99, v97);
  __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke_2(self->_smallRingInterestLabel, v96, v94, v93, v92);
  __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke_2(self->_amountDescriptionView, v81, v122, v83, v120);
  double v89 = fmax(v130[5], 0.0);

  _Block_object_dispose(&v129, 8);
  double v90 = v117;
  double v91 = v89;
  result.CGFloat height = v91;
  result.CGFloat width = v90;
  return result;
}

uint64_t __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke(uint64_t a1, double a2, double a3)
{
  uint64_t result = PKSizeAlignedInRect();
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = a3
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 40);
  return result;
}

void __72__PKAccountBillPaymentViewController__layoutScrollViewWithContentWidth___block_invoke_2(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = a1;
  id v12 = [v9 layer];
  [v12 anchorPoint];
  objc_msgSend(v9, "setCenter:", a2 + v10 * a4, a3 + v11 * a5);
}

- (void)_layoutFooterWithState:(id *)a3
{
  double v5 = [(_UIBackdropView *)self->_blurringView contentView];
  memset(&slice, 0, sizeof(slice));
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  v22.origin.CGFloat x = v6;
  v22.origin.double y = v8;
  v22.size.CGFloat width = v10;
  v22.size.CGFloat height = v12;
  if ([v5 _shouldReverseLayoutDirection]) {
    CGRectEdge v14 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v14 = CGRectMinXEdge;
  }
  v24.origin.CGFloat x = v7;
  v24.origin.double y = v9;
  v24.size.CGFloat width = v11;
  v24.size.CGFloat height = v13;
  CGRectDivide(v24, &slice, &v22, a3->var4, CGRectMaxYEdge);
  tertiaryButton = self->_tertiaryButton;
  if (tertiaryButton)
  {
    -[UIButton sizeThatFits:](tertiaryButton, "sizeThatFits:", a3->var1, 1.79769313e308);
    CGFloat height = a3->var2.height;
    if (self->_showKeyboard)
    {
      slice.origin.CGFloat x = v22.origin.x;
      slice.origin.double y = v22.origin.y + v22.size.height + 3.0;
      slice.size.CGFloat width = v22.size.width;
      slice.size.CGFloat height = height;
      double v17 = self->_tertiaryButton;
      PKSizeAlignedInRect();
      -[UIButton setFrame:](v17, "setFrame:");
    }
    else
    {
      CGRectDivide(v22, &slice, &v22, 3.0, CGRectMaxYEdge);
      CGRectDivide(v22, &slice, &v22, a3->var2.height, CGRectMaxYEdge);
      double v18 = self->_tertiaryButton;
      PKSizeAlignedInRect();
      -[UIButton setFrame:](v18, "setFrame:");
      CGRectDivide(v22, &slice, &v22, 3.0, CGRectMaxYEdge);
    }
  }
  if (!a3->var5)
  {
    PKSizeAlignedInRect();
    CGRect v22 = v25;
    CGRectDivide(v25, &v22, &slice, a3->var2.height, CGRectMaxYEdge);
    CGRectDivide(v22, &slice, &v22, a3->var2.width, v14);
    secondaryButton = self->_secondaryButton;
    PKSizeAlignedInRect();
    -[PKLegacyButtonInterface setFrame:](secondaryButton, "setFrame:");
    CGRectDivide(v22, &slice, &v22, a3->var3, v14);
    primaryButton = self->_primaryButton;
LABEL_16:
    PKSizeAlignedInRect();
    -[PKLegacyButtonInterface setFrame:](primaryButton, "setFrame:");
    goto LABEL_17;
  }
  if (self->_primaryButton)
  {
    CGRectDivide(v22, &slice, &v22, a3->var2.height, CGRectMaxYEdge);
    double v19 = self->_primaryButton;
    PKSizeAlignedInRect();
    -[PKLegacyButtonInterface setFrame:](v19, "setFrame:");
    if (self->_primaryButton)
    {
      if (self->_secondaryButton) {
        CGRectDivide(v22, &slice, &v22, 15.0, CGRectMaxYEdge);
      }
    }
  }
  if (self->_secondaryButton)
  {
    CGRectDivide(v22, &slice, &v22, a3->var2.height, CGRectMaxYEdge);
    primaryButton = self->_secondaryButton;
    goto LABEL_16;
  }
LABEL_17:
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKAccountBillPaymentViewController;
  [(PKAccountBillPaymentViewController *)&v11 viewWillAppear:a3];
  self->_visibilitdouble y = 1;
  [(PKAccountBillPaymentController *)self->_billPaymentCoordinator setDelegate:self];
  if (self->_hasAnimatedRing || ![(PKBillPaymentRingView *)self->_ringView isEnabled]) {
    goto LABEL_14;
  }
  double v4 = [(PKBillPaymentSuggestedAmountList *)self->_suggestionList suggestedAmountWithCategory:18];
  double v5 = [v4 amount];

  if (!v5)
  {
    double v5 = [(PKBillPaymentSuggestedAmountList *)self->_suggestionList maximumAmount];
  }
  configuration = self->_configuration;
  if (configuration)
  {
    uint64_t v7 = [(PKAccountServiceAccountResolutionConfiguration *)configuration billPayAmountType];
    switch(v7)
    {
      case 3:
        uint64_t v8 = [(PKAccountServiceAccountResolutionConfiguration *)self->_configuration billPayAmount];
        goto LABEL_12;
      case 2:
        uint64_t v8 = [(PKBillPaymentSuggestedAmountList *)self->_suggestionList minimumAmount];
        goto LABEL_12;
      case 1:
        uint64_t v8 = [(PKBillPaymentSuggestedAmountList *)self->_suggestionList remainingStatementAmount];
LABEL_12:
        CGFloat v9 = (void *)v8;

        double v5 = v9;
        break;
    }
  }
  [(PKBillPaymentRingView *)self->_ringView prepareForInitialDisplayWithAmount:v5];

LABEL_14:
  if (self->_showKeyboard)
  {
    CGFloat v10 = [(PKAccountBillPaymentViewController *)self view];
    [v10 setNeedsLayout];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)PKAccountBillPaymentViewController;
  [(PKAccountBillPaymentViewController *)&v6 viewDidAppear:a3];
  self->_visibilitdouble y = 2;
  if (!self->_hasAnimatedRing)
  {
    [(PKBillPaymentRingView *)self->_ringView completeInitialDisplayAnimated:1];
    self->_hasAnimatedRing = 1;
  }
  [(PKAccountBillPaymentViewController *)self _showOrHideKeypad];
  if (self->_showKeyboard)
  {
    double v4 = [(PKAccountBillPaymentViewController *)self view];
    [v4 setNeedsLayout];
  }
  uint64_t v7 = *MEMORY[0x1E4F86308];
  v8[0] = *MEMORY[0x1E4F864A0];
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(PKAccountBillPaymentViewController *)self _reportEventForPassIfNecessary:v5];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKAccountBillPaymentViewController;
  [(PKAccountBillPaymentViewController *)&v7 viewWillDisappear:a3];
  self->_visibilitdouble y = 3;
  CLInUse = self->_CLInUse;
  if (CLInUse)
  {
    [(CLInUseAssertion *)CLInUse invalidate];
    double v5 = self->_CLInUse;
    self->_CLInUse = 0;
  }
  if (self->_showKeyboard)
  {
    objc_super v6 = [(PKAccountBillPaymentViewController *)self view];
    [v6 setNeedsLayout];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)PKAccountBillPaymentViewController;
  [(PKAccountBillPaymentViewController *)&v6 viewDidDisappear:a3];
  self->_visibilitdouble y = 0;
  if (self->_showKeyboard)
  {
    double v4 = [(PKAccountBillPaymentViewController *)self view];
    [v4 setNeedsLayout];
  }
  uint64_t v7 = *MEMORY[0x1E4F86308];
  v8[0] = *MEMORY[0x1E4F864A8];
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [(PKAccountBillPaymentViewController *)self _reportEventForPassIfNecessary:v5];
}

- (void)billPaymentRingView:(id)a3 selectedSuggestedAmount:(id)a4 selectedSuggestedAmountIsTarget:(BOOL)a5 userInitiatedChange:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v20[2] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (!self->_interstitialState)
  {
    CGFloat v10 = [(PKBillPaymentSuggestedAmountList *)self->_suggestionList suggestedAmountGapMessageForStartSuggestedAmount:v9];
    objc_super v11 = v10;
    if (v7 || !v10)
    {
      CGFloat v12 = [v9 title];
      CGFloat v13 = v9;
    }
    else
    {
      CGFloat v12 = [v10 title];
      CGFloat v13 = v11;
    }
    CGRectEdge v14 = [v13 message];
    [(PKAccountBillPaymentAmountDescriptionView *)self->_amountDescriptionView setTitleText:v12];
    [(PKAccountBillPaymentAmountDescriptionView *)self->_amountDescriptionView setDescriptionText:v14];
    double v15 = [(PKAccountBillPaymentViewController *)self view];
    [v15 setNeedsLayout];

    if (v6)
    {
      uint64_t v16 = *MEMORY[0x1E4F86100];
      v19[0] = *MEMORY[0x1E4F86308];
      v19[1] = v16;
      double v17 = @"false";
      if (v7) {
        double v17 = @"true";
      }
      v20[0] = *MEMORY[0x1E4F86108];
      v20[1] = v17;
      double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
      [(PKAccountBillPaymentViewController *)self _reportEventForPassIfNecessary:v18];
    }
  }
}

- (void)billPaymentRingView:(id)a3 amountChanged:(id)a4
{
  id v5 = a4;
  id v8 = v5;
  if (self->_showKeyboard)
  {
    id v6 = [(PKAccountBillPaymentViewController *)self _paymentAmount];
  }
  else
  {
    id v6 = v5;
  }
  BOOL v7 = v6;
  [(PKAccountBillPaymentViewController *)self _updatePayNowButtonTitleWithAmount:v6];
}

- (id)billPaymentRingView:(id)a3 topCurvedTextForSuggestedAmount:(id)a4
{
  [(PKAccount *)self->_account feature];
  id v5 = [(PKAccount *)self->_account creditDetails];
  id v6 = [(PKAccountServiceAccountResolutionConfiguration *)self->_configuration earlyInstallmentPlan];
  if (v6) {
    [v5 totalBalance];
  }
  else {
  BOOL v7 = [v5 cardBalance];
  }

  id v8 = [v7 amount];
  id v9 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v10 = [v8 compare:v9];

  if (v10 == -1)
  {
    uint64_t v11 = [v7 negativeValue];

    BOOL v7 = (void *)v11;
  }
  CGFloat v12 = [v7 formattedStringValue];
  if (v12)
  {
    if (v10 == -1)
    {
      double v17 = v12;
      uint64_t v13 = PKLocalizedFeatureString();

      CGFloat v12 = (void *)v13;
    }
    [(PKAccountServiceAccountResolutionConfiguration *)self->_configuration earlyInstallmentPlan];

    double v17 = v12;
    CGRectEdge v14 = PKLocalizedFeatureString();
  }
  else
  {
    CGRectEdge v14 = 0;
  }
  double v15 = objc_msgSend(v14, "pk_uppercaseStringForPreferredLocale", v17);

  return v15;
}

- (id)billPaymentRingView:(id)a3 bottomCurvedTextForSuggestedAmount:(id)a4
{
  id v5 = a4;
  if ([(PKAccount *)self->_account showBillPaymentInterest])
  {
    [(PKAccount *)self->_account feature];
    id v6 = [v5 amount];
    BOOL v7 = [(PKAccountBillPaymentViewController *)self _interestForAmount:v6];

    if (v7
      && ([MEMORY[0x1E4F28C28] zero],
          id v8 = objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = [v7 compare:v8],
          v8,
          v9 == 1))
    {
      uint64_t v10 = [(PKAccountBillPaymentViewController *)self _interestPostDate];
      uint64_t v11 = [(NSDateFormatter *)self->_interestDateFormatter stringFromDate:v10];
      uint64_t v12 = PKLocalizedFeatureString();
    }
    else
    {
      CGRectEdge v14 = [(PKAccount *)self->_account creditDetails];
      uint64_t v10 = [v14 accountSummary];

      uint64_t v11 = [v10 unpostedInterest];
      if ([v10 inGrace]) {
        BOOL v15 = v11 == 0;
      }
      else {
        BOOL v15 = 1;
      }
      if (!v15)
      {
        uint64_t v16 = [MEMORY[0x1E4F28C28] zero];
        [v11 compare:v16];
      }
      uint64_t v12 = PKLocalizedFeatureString();
    }
    double v17 = (void *)v12;

    uint64_t v13 = objc_msgSend(v17, "pk_uppercaseStringForPreferredLocale");
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)disabledTopCurvedTextForBillPaymentRingView:(id)a3
{
  [(PKAccount *)self->_account feature];
  double v4 = [(PKAccount *)self->_account creditDetails];
  id v5 = v4;
  if (self->_interstitialState - 1 > 2)
  {
    uint64_t v11 = 0;
  }
  else
  {
    id v6 = [v4 cardBalance];
    BOOL v7 = [v6 amount];
    id v8 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v9 = [v7 compare:v8];

    if (v9 == -1)
    {
      uint64_t v12 = [v6 negativeValue];

      BOOL v15 = [v12 formattedStringValue];
      uint64_t v10 = PKLocalizedFeatureString();

      id v6 = v12;
    }
    else
    {
      uint64_t v10 = [v6 formattedStringValue];
    }
    if (objc_msgSend(v5, "numberOfActiveStatementedInstallments", v15) >= 1)
    {
      [(PKAccountServiceAccountResolutionConfiguration *)self->_configuration earlyInstallmentPlan];
    }
    BOOL v15 = v10;
    uint64_t v11 = PKLocalizedFeatureString();
  }
  uint64_t v13 = objc_msgSend(v11, "pk_uppercaseStringForPreferredLocale", v15);

  return v13;
}

- (id)disabledBottomCurvedTextForBillPaymentRingView:(id)a3
{
  [(PKAccount *)self->_account feature];
  double v4 = [(PKAccount *)self->_account creditDetails];
  id v5 = [v4 currencyCode];
  id v6 = [v4 accountSummary];
  BOOL v7 = v6;
  if (self->_interstitialState - 1 > 2)
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v8 = [v6 availableCredit];
    uint64_t v9 = PKCurrencyAmountCreate(v8, v5);

    uint64_t v13 = [v9 formattedStringValue];
    uint64_t v10 = PKLocalizedFeatureString();
  }
  uint64_t v11 = objc_msgSend(v10, "pk_uppercaseStringForPreferredLocale", v13);

  return v11;
}

- (id)billPaymentRingView:(id)a3 interestTextForAmount:(id)a4
{
  return [(PKAccountBillPaymentViewController *)self _interestStringForAmount:a4];
}

- (id)billPaymentRingViewZeroInterestText:(id)a3
{
  amountFormatter = self->_amountFormatter;
  double v4 = objc_msgSend(MEMORY[0x1E4F28C28], "zero", a3);
  id v5 = [(NSNumberFormatter *)amountFormatter stringFromNumber:v4];

  return v5;
}

- (void)_updateSmallRingInterestString
{
  if ([(PKAccount *)self->_account showBillPaymentInterest])
  {
    objc_super v3 = [(PKAccountBillPaymentViewController *)self _interestPostDate];
    double v4 = [(PKAccountBillPaymentViewController *)self _paymentAmount];
    id v5 = [(PKAccountBillPaymentViewController *)self _interestStringForAmount:v4];

    [(PKAccount *)self->_account feature];
    id v6 = [(PKBillPaymentRingView *)self->_ringView currentStartColor];
    if (!v6)
    {
      id v6 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    }
    [(NSMutableDictionary *)self->_smallRingInterestAttributes setObject:v6 forKey:*MEMORY[0x1E4FB0700]];
    if (!v3 || ![v5 length]) {
      goto LABEL_10;
    }
    BOOL v7 = [(PKAccountBillPaymentViewController *)self _interestLabelIsOutsideSmallRing];
    id v8 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v9 = v7 ? @"%@ " : @"%@\n";
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", v9, v5);
    uint64_t v11 = (void *)[v8 initWithString:v10 attributes:self->_smallRingInterestAttributes];

    uint64_t v12 = [(NSDateFormatter *)self->_interestDateFormatter stringFromDate:v3];
    uint64_t v13 = PKLocalizedFeatureString();
    CGRectEdge v14 = objc_msgSend(v13, "pk_uppercaseStringForPreferredLocale", v12);

    BOOL v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v14 attributes:self->_smallRingInterestDateAttributes];
    uint64_t v16 = (void *)[v11 mutableCopy];
    [v16 appendAttributedString:v15];
    id v24 = (id)[v16 copy];

    if (!v24)
    {
LABEL_10:
      double v17 = [(PKAccount *)self->_account creditDetails];
      double v18 = [v17 accountSummary];

      double v19 = [v18 unpostedInterest];
      if ([v18 inGrace]) {
        BOOL v20 = v19 == 0;
      }
      else {
        BOOL v20 = 1;
      }
      if (!v20)
      {
        double v21 = [MEMORY[0x1E4F28C28] zero];
        [v19 compare:v21];
      }
      CGRect v22 = PKLocalizedFeatureString();
      double v23 = objc_msgSend(v22, "pk_uppercaseStringForPreferredLocale");

      id v24 = (id)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v23 attributes:self->_smallRingInterestDateAttributes];
    }
    [(UILabel *)self->_smallRingInterestLabel setAttributedText:v24];
  }
}

- (void)billPaymentAmountDescriptionView:(id)a3 hasChangedAmount:(id)a4 isValidAmount:(BOOL)a5
{
  BOOL v5 = a5;
  ringView = self->_ringView;
  id v8 = a4;
  [(PKBillPaymentRingView *)ringView setAmount:v8 animated:1 userInitiatedWithKeypad:1];
  [(PKAccountBillPaymentViewController *)self _updatePayNowButtonTitleWithAmount:v8];

  [(PKAccountBillPaymentViewController *)self _setPayButtonsEnabled:v5];
  [(PKAccountBillPaymentViewController *)self _updateSmallRingInterestString];
  [(PKBillPaymentRingView *)self->_ringView setNeedsLayout];
  id v9 = [(PKAccountBillPaymentViewController *)self view];
  [v9 setNeedsLayout];
}

- (void)billPaymentAmountDescriptionViewHasTappedLearnMore:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  double v4 = [[PKAccountBillPaymentLearnMoreViewController alloc] initWithAccount:self->_account];
  BOOL v5 = [[PKNavigationController alloc] initWithRootViewController:v4];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKNavigationController *)v5 setModalPresentationStyle:3];
    id v6 = [(PKAccountBillPaymentViewController *)self navigationController];
    [v6 presentViewController:v5 withTransition:8 completion:0];
  }
  else
  {
    id v6 = [(PKAccountBillPaymentViewController *)self navigationController];
    [v6 presentViewController:v5 animated:1 completion:0];
  }

  uint64_t v7 = *MEMORY[0x1E4F86380];
  uint64_t v8 = *MEMORY[0x1E4F86120];
  v11[0] = *MEMORY[0x1E4F86308];
  v11[1] = v8;
  uint64_t v9 = *MEMORY[0x1E4F865C8];
  v12[0] = v7;
  v12[1] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  [(PKAccountBillPaymentViewController *)self _reportEventForPassIfNecessary:v10];
}

- (void)accountBillPaymentController:(id)a3 hasChangedState:(unint64_t)a4 error:(id)a5 updatedAccount:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = v12;
  self->_performingAction = 0;
  switch(a4)
  {
    case 2uLL:
      [(PKAccountBillPaymentViewController *)self _setEnabled:1];
      [(PKAccountBillPaymentViewController *)self _showOrHideKeypad];
      [(PKBillPaymentSuggestedAmountController *)self->_suggestedAmountController recordPaymentActionWithDifferentialPrivacy:0];
      [(PKBillPaymentSuggestedAmountController *)self->_suggestedAmountController recordPaymentRingAction:1];
      break;
    case 1uLL:
      if (v12) {
        [(PKAccountBillPaymentViewController *)self _setAccount:v12];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
      if (objc_opt_respondsToSelector())
      {
        BOOL v15 = [(PKAccountBillPaymentController *)self->_billPaymentCoordinator payments];
        [WeakRetained accountBillPaymentViewController:self didSchedulePayments:v15];
      }
      if ([(PKBillPaymentRingView *)self->_ringView isSmall]) {
        uint64_t v16 = 3;
      }
      else {
        uint64_t v16 = 1;
      }
      [(PKBillPaymentSuggestedAmountController *)self->_suggestedAmountController recordPaymentActionWithDifferentialPrivacy:v16];
      if ([(PKBillPaymentRingView *)self->_ringView isSmall]) {
        uint64_t v17 = 2;
      }
      else {
        uint64_t v17 = 4;
      }
      [(PKBillPaymentSuggestedAmountController *)self->_suggestedAmountController recordPaymentRingAction:v17];
      double v18 = [(PKAccountBillPaymentController *)self->_billPaymentCoordinator payments];
      if ([v18 count])
      {
        double v19 = [(PKTransactionSource *)self->_transactionSource paymentPass];
        BOOL v20 = [[PKAccountBillPaymentConfirmationViewController alloc] initWithAccount:self->_account previousAccountSummary:self->_previousAccountSummary paymentPass:v19 payments:v18 suggestionList:self->_suggestionList interestForPaymentTotal:self->_interestForPaymentTotal interestForStatementBalance:self->_interestForStatementBalance];
        objc_initWeak(&location, self);
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __104__PKAccountBillPaymentViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke;
        v22[3] = &unk_1E59CB268;
        objc_copyWeak(&v24, &location);
        double v21 = v20;
        double v23 = v21;
        [(PKAccountBillPaymentConfirmationViewController *)v21 preflightWithCompletion:v22];

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
      else
      {
        [(PKAccountBillPaymentViewController *)self _dismissViewControllerWithSuccess:1];
      }

      break;
    case 0uLL:
      [(PKAccountBillPaymentViewController *)self _presentAlertControllerForError:v11];
      break;
  }
}

void __104__PKAccountBillPaymentViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __104__PKAccountBillPaymentViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke_2;
  v2[3] = &unk_1E59CB010;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __104__PKAccountBillPaymentViewController_accountBillPaymentController_hasChangedState_error_updatedAccount___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = [WeakRetained navigationController];
    [v3 pushViewController:*(void *)(a1 + 32) animated:1];

    id WeakRetained = v4;
  }
}

- (id)presentationSceneIdentifierForAccountBillPaymentController:(id)a3
{
  id v3 = [(PKAccountBillPaymentViewController *)self view];
  id v4 = [v3 window];
  BOOL v5 = [v4 windowScene];
  id v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)accountAutomaticPaymentsController:(id)a3 didSchedulePayment:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  if (objc_opt_respondsToSelector())
  {
    v8[0] = v5;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [WeakRetained accountBillPaymentViewController:self didSchedulePayments:v7];
  }
}

- (void)accountAutomaticPaymentsControllerDidSelectSetupCompletionDone:(id)a3 viewController:(id)a4
{
}

- (id)presentationSceneIdentifierForAccountAutomaticPaymentsController:(id)a3
{
  id v3 = [(PKAccountBillPaymentViewController *)self view];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  id v6 = [v5 _sceneIdentifier];

  return v6;
}

- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  billPaymentCoordinator = self->_billPaymentCoordinator;
  id v8 = a4;
  id v5 = (void *)MEMORY[0x1E4F1C978];
  id v6 = a4;
  uint64_t v7 = [v5 arrayWithObjects:&v8 count:1];
  -[PKAccountBillPaymentController setFundingSources:](billPaymentCoordinator, "setFundingSources:", v7, v8, v9);
}

- (void)addBankAccountInformationViewControllerDidFinish:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__PKAccountBillPaymentViewController_addBankAccountInformationViewControllerDidFinish___block_invoke;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = self;
  [(PKAccountBillPaymentViewController *)self dismissViewControllerAnimated:1 completion:v3];
}

void __87__PKAccountBillPaymentViewController_addBankAccountInformationViewControllerDidFinish___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1320);
  *(void *)(v2 + 1320) = 0;

  [*(id *)(a1 + 32) _showOrHideKeypad];
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[127];
  id v6 = [v4 _paymentAmount];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __87__PKAccountBillPaymentViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_2;
  v7[3] = &unk_1E59CDF18;
  v7[4] = *(void *)(a1 + 32);
  [v5 canPerformBillPaymentWithAmount:v6 scheduledDate:0 completion:v7];
}

void __87__PKAccountBillPaymentViewController_addBankAccountInformationViewControllerDidFinish___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    id v7 = v5;
    [*(id *)(a1 + 32) _payNowButtonTapped:0];
  }
  else
  {
    if (!v5) {
      goto LABEL_6;
    }
    id v7 = v5;
    [*(id *)(a1 + 32) _presentAlertControllerForError:v5];
  }
  id v6 = v7;
LABEL_6:
}

- (void)_performBillPaymentWithAmount:(id)a3 billPaymentSuggestedAmountDataEvent:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!self->_CLInUse)
  {
    id v8 = (void *)MEMORY[0x1E4F1E5E8];
    uint64_t v9 = PKPassKitCoreBundle();
    id v10 = (CLInUseAssertion *)[v8 newAssertionForBundle:v9 withReason:@"Perform Account Service Now Payment"];
    CLInUse = self->_CLInUse;
    self->_CLInUse = v10;
  }
  if (self->_performingAction)
  {
    id v12 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315138;
      CGRect v22 = "-[PKAccountBillPaymentViewController _performBillPaymentWithAmount:billPaymentSuggestedAmountDataEvent:]";
      _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "%s: Cannot Present - already performing action", (uint8_t *)&v21, 0xCu);
    }
  }
  else
  {
    self->_performingAction = 1;
    [(PKAccountBillPaymentViewController *)self _setEnabled:0];
    uint64_t v13 = [(PKAccount *)self->_account creditDetails];
    CGRectEdge v14 = [v13 accountSummary];
    previousAccountSummardouble y = self->_previousAccountSummary;
    self->_previousAccountSummardouble y = v14;

    uint64_t v16 = [(PKAccountBillPaymentViewController *)self _roundedInterestForAmount:v6];
    interestForPaymentTotal = self->_interestForPaymentTotal;
    self->_interestForPaymentTotal = v16;

    double v18 = [(PKCreditAccountSummary *)self->_previousAccountSummary remainingStatementBalance];
    double v19 = [(PKAccountBillPaymentViewController *)self _roundedInterestForAmount:v18];
    interestForStatementBalance = self->_interestForStatementBalance;
    self->_interestForStatementBalance = v19;

    [(PKAccountBillPaymentController *)self->_billPaymentCoordinator performBillPaymentActionWithAmount:v6 billPaymentSuggestedAmountDataEvent:v7];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v3 = [(PKAccountBillPaymentViewController *)self view];
  [v3 setNeedsLayout];
}

- (void)accountServiceAccountResolutionController:(id)a3 requestsPresentViewController:(id)a4 animated:(BOOL)a5
{
}

- (int64_t)visibilityBackdropView:(id)a3 preferredStyleForTraitCollection:(id)a4
{
  if (objc_msgSend(a4, "userInterfaceStyle", a3) == 2) {
    return 2030;
  }
  else {
    return 2010;
  }
}

- (void)_accountDidChange:(id)a3
{
  if (self->_account)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F84270], "sharedInstance", a3);
    id v5 = [(PKAccount *)self->_account accountIdentifier];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __56__PKAccountBillPaymentViewController__accountDidChange___block_invoke;
    v6[3] = &unk_1E59CB1C8;
    v6[4] = self;
    [v4 accountWithIdentifier:v5 completion:v6];
  }
}

void __56__PKAccountBillPaymentViewController__accountDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__PKAccountBillPaymentViewController__accountDidChange___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __56__PKAccountBillPaymentViewController__accountDidChange___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setAccount:*(void *)(a1 + 40)];
}

- (void)_setAccount:(id)a3
{
  id v7 = a3;
  char v5 = -[PKAccount isContentEqualToAccount:](self->_account, "isContentEqualToAccount:");
  objc_storeStrong((id *)&self->_account, a3);
  if ((v5 & 1) == 0)
  {
    id v6 = [(PKCompoundInterestCalculator *)self->_interestCalculator configuration];
    [v6 updateWithCreditAccount:v7];

    [(NSMutableDictionary *)self->_cachedInterestResults removeAllObjects];
  }
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = [a3 userInfo];
  char v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PKAccountBillPaymentViewController_keyboardWillShow___block_invoke;
  v7[3] = &unk_1E59CADB8;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(PKAccountBillPaymentViewController *)self _updateLayoutForKeyboardAction:v7];
}

BOOL __55__PKAccountBillPaymentViewController_keyboardWillShow___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  CGFloat v3 = *(double *)(v2 + 1144);
  CGFloat v4 = *(double *)(v2 + 1152);
  CGFloat v5 = *(double *)(v2 + 1160);
  CGFloat v6 = *(double *)(v2 + 1168);
  *(unsigned char *)(v2 + 1137) = 1;
  uint64_t v8 = *(void *)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  uint64_t v9 = (void *)(v8 + 1144);
  if (v7)
  {
    [v7 CGRectValue];
    *uint64_t v9 = v10;
    v9[1] = v11;
    v9[2] = v12;
    v9[3] = v13;
  }
  else
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)uint64_t v9 = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(v8 + 1160) = v14;
  }
  v16.origin.CGFloat x = v3;
  v16.origin.double y = v4;
  v16.size.CGFloat width = v5;
  v16.size.CGFloat height = v6;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1144), v16);
}

- (void)keyboardWillChange:(id)a3
{
  if (self->_keyboardVisible)
  {
    CGFloat v4 = [a3 userInfo];
    CGFloat v5 = [v4 objectForKey:*MEMORY[0x1E4FB2BD8]];

    if (v5)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __57__PKAccountBillPaymentViewController_keyboardWillChange___block_invoke;
      v6[3] = &unk_1E59CADB8;
      v6[4] = self;
      id v7 = v5;
      [(PKAccountBillPaymentViewController *)self _updateLayoutForKeyboardAction:v6];
    }
  }
}

BOOL __57__PKAccountBillPaymentViewController_keyboardWillChange___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  CGFloat v3 = v2 + 143;
  CGFloat v4 = *((double *)v2 + 143);
  CGFloat v5 = *((double *)v2 + 144);
  CGFloat v6 = *((double *)v2 + 145);
  CGFloat v7 = *((double *)v2 + 146);
  [*(id *)(a1 + 40) CGRectValue];
  *CGFloat v3 = v8;
  v3[1] = v9;
  v3[2] = v10;
  v3[3] = v11;
  v13.origin.CGFloat x = v4;
  v13.origin.double y = v5;
  v13.size.CGFloat width = v6;
  v13.size.CGFloat height = v7;
  return !CGRectEqualToRect(*(CGRect *)(*(void *)(a1 + 32) + 1144), v13);
}

- (void)keyboardWillHide:(id)a3
{
  if (self->_keyboardVisible)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __55__PKAccountBillPaymentViewController_keyboardWillHide___block_invoke;
    v3[3] = &unk_1E59CADE0;
    v3[4] = self;
    [(PKAccountBillPaymentViewController *)self _updateLayoutForKeyboardAction:v3];
  }
}

BOOL __55__PKAccountBillPaymentViewController_keyboardWillHide___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CGRect v8 = *(CGRect *)(v1 + 1144);
  *(unsigned char *)(v1 + 1137) = 0;
  uint64_t v2 = (_OWORD *)(*(void *)(a1 + 32) + 1144);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
  *uint64_t v2 = *MEMORY[0x1E4F1DB20];
  v2[1] = v3;
  *(void *)&long long v3 = *(void *)(*(void *)(a1 + 32) + 1144);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 1152);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 1160);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1168);
  return !CGRectEqualToRect(*(CGRect *)&v3, v8);
}

- (void)_updateLayoutForKeyboardAction:(id)a3
{
  uint64_t v4 = (uint64_t (**)(void))a3;
  if (v4)
  {
    if (self->_showKeyboard)
    {
      uint64_t v5 = [(PKAccountBillPaymentViewController *)self viewIfLoaded];
    }
    else
    {
      uint64_t v5 = 0;
    }
    int IsVisible = PKViewVisibilityStateIsVisible();
    int v7 = IsVisible;
    if (v5 && IsVisible) {
      [v5 layoutIfNeeded];
    }
    int v8 = v4[2](v4);
    if (v5)
    {
      if (v8)
      {
        [v5 setNeedsLayout];
        if (v7)
        {
          uint64_t v9 = (void *)MEMORY[0x1E4FB1EB0];
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __69__PKAccountBillPaymentViewController__updateLayoutForKeyboardAction___block_invoke;
          v10[3] = &unk_1E59CA7D0;
          id v11 = v5;
          [v9 _animateUsingDefaultTimingWithOptions:134 animations:v10 completion:0];
        }
      }
    }
  }
}

uint64_t __69__PKAccountBillPaymentViewController__updateLayoutForKeyboardAction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_cancelButtonTapped:(id)a3
{
  [(PKAccountBillPaymentAmountDescriptionView *)self->_amountDescriptionView dismissKeyboard];
  id v4 = [(PKAccountBillPaymentViewController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)_contactSupportButtonTapped:(id)a3
{
  id v4 = [PKBusinessChatInstallmentPaymentContext alloc];
  account = self->_account;
  uint64_t v6 = [(PKTransactionSource *)self->_transactionSource paymentPass];
  BOOL v15 = [(PKBusinessChatInstallmentPaymentContext *)v4 initWithAccount:account paymentPass:v6];

  id v7 = objc_alloc_init(MEMORY[0x1E4F84278]);
  [v7 setBusinessChatContext:v15];
  if (!self->_accountResolutionController)
  {
    int v8 = [PKAccountServiceAccountResolutionController alloc];
    uint64_t v9 = self->_account;
    accountUserCollection = self->_accountUserCollection;
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F850C8]) initWithTransactionSource:self->_transactionSource];
    uint64_t v12 = [(PKAccountServiceAccountResolutionController *)v8 initWithAccount:v9 accountUserCollection:accountUserCollection transactionSourceCollection:v11];
    accountResolutionController = self->_accountResolutionController;
    self->_accountResolutionController = v12;

    [(PKAccountServiceAccountResolutionController *)self->_accountResolutionController setDelegate:self];
  }
  if (+[PKBusinessChatController deviceSupportsBusinessChat])
  {
    uint64_t v14 = 3;
  }
  else
  {
    uint64_t v14 = 2;
  }
  [(PKAccountServiceAccountResolutionController *)self->_accountResolutionController presentFlowForAccountResolution:v14 configuration:v7 completion:0];
}

- (void)_showKeyboardButtonTapped:(id)a3
{
}

- (void)_tappedSmallRingView:(id)a3
{
}

- (void)_tappedNormalRingViewAmount:(id)a3
{
}

- (void)_setShowKeyboard:(BOOL)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  if (((!self->_showKeyboard ^ a3) & 1) == 0)
  {
    BOOL v3 = a3;
    uint64_t v5 = [(PKAccountBillPaymentViewController *)self view];
    [v5 layoutIfNeeded];
    self->_BOOL showKeyboard = v3;
    [v5 setNeedsLayout];
    if (v3)
    {
      uint64_t v6 = [(PKBillPaymentRingView *)self->_ringView amount];
      [(PKAccountBillPaymentAmountDescriptionView *)self->_amountDescriptionView setAmount:v6];

      [(PKAccountBillPaymentViewController *)self _updateNavigationTitle];
      [(PKAccountBillPaymentViewController *)self _updateForShowKeyboardAnimated:1];
      [(PKAccountBillPaymentViewController *)self _showOrHideKeypad];
    }
    else
    {
      [(PKAccountBillPaymentViewController *)self _updateNavigationTitle];
      [(PKAccountBillPaymentViewController *)self _updateForShowKeyboardAnimated:1];
      [(PKAccountBillPaymentViewController *)self _showOrHideKeypad];
      [(PKAccountBillPaymentViewController *)self _setPayButtonsEnabled:1];
      id v7 = [(PKAccountBillPaymentViewController *)self _paymentAmount];
      [(PKAccountBillPaymentViewController *)self _updatePayNowButtonTitleWithAmount:v7];

      [(PKAccountBillPaymentAmountDescriptionView *)self->_amountDescriptionView normalizeEnteredAmount];
    }
    [(UIScrollView *)self->_scrollView pkui_naturalRestingBounds];
    double v9 = v8;
    double v11 = v10;
    [(UIScrollView *)self->_scrollView contentOffset];
    if (v9 != v13 || v11 != v12) {
      -[UIScrollView setContentOffset:animated:](self->_scrollView, "setContentOffset:animated:", 1, v9, v11);
    }
    uint64_t v15 = *MEMORY[0x1E4F86380];
    uint64_t v16 = *MEMORY[0x1E4F86120];
    BOOL showKeyboard = self->_showKeyboard;
    v21[0] = *MEMORY[0x1E4F86308];
    v21[1] = v16;
    double v18 = (uint64_t *)MEMORY[0x1E4F86CC0];
    if (!showKeyboard) {
      double v18 = (uint64_t *)MEMORY[0x1E4F86510];
    }
    uint64_t v19 = *v18;
    v22[0] = v15;
    v22[1] = v19;
    BOOL v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    [(PKAccountBillPaymentViewController *)self _reportEventForPassIfNecessary:v20];
  }
}

- (void)_updateForShowKeyboardAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_showKeyboard) {
    uint64_t v5 = 1288;
  }
  else {
    uint64_t v5 = 1280;
  }
  uint64_t v6 = (void **)((char *)&self->super.super.super.isa + v5);
  if (*(Class *)((char *)&self->super.super.super.isa + v5))
  {
    -[PKBillPaymentRingView removeGestureRecognizer:](self->_ringView, "removeGestureRecognizer:");
    id v7 = *v6;
    *uint64_t v6 = 0;
  }
  double v8 = [(PKAccountBillPaymentViewController *)self viewIfLoaded];
  double v9 = v8;
  if (v8)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__PKAccountBillPaymentViewController__updateForShowKeyboardAnimated___block_invoke;
    aBlock[3] = &unk_1E59CD7B0;
    aBlock[4] = self;
    BOOL v22 = v3;
    id v21 = v8;
    double v10 = (void (**)(void))_Block_copy(aBlock);
    objc_initWeak(&location, self);
    BOOL showKeyboard = self->_showKeyboard;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __69__PKAccountBillPaymentViewController__updateForShowKeyboardAnimated___block_invoke_2;
    uint64_t v16 = &unk_1E59CC270;
    objc_copyWeak(&v17, &location);
    BOOL v18 = showKeyboard;
    double v12 = (void (**)(void *, uint64_t))_Block_copy(&v13);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E4FB1EB0], "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v10, v12, v13, v14, v15, v16);
    }
    else
    {
      v10[2](v10);
      v12[2](v12, 1);
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

uint64_t __69__PKAccountBillPaymentViewController__updateForShowKeyboardAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1216) setShowAmount:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1136)];
  [*(id *)(*(void *)(a1 + 32) + 1224) setIsSmall:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1136)];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 1136))
  {
    unint64_t v3 = PKUIGetMinScreenType();
    uint64_t v2 = *(void *)(a1 + 32);
    if (v3 < 4)
    {
      uint64_t v4 = 0;
    }
    else if (*(unsigned char *)(v2 + 1135))
    {
      uint64_t v4 = objc_msgSend((id)v2, "pkui_userInterfaceIdiomSupportsLargeLayouts");
      uint64_t v2 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v4 = 1;
    }
    if (v3 > 8) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v4 = 1;
    uint64_t v5 = 1;
  }
  [*(id *)(v2 + 1216) setShowDescriptionLabels:v4];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 1216) setShowDescriptionSubtitle:v5];
  if (*(unsigned char *)(a1 + 48))
  {
    id v7 = *(void **)(a1 + 40);
    return [v7 layoutIfNeeded];
  }
  return result;
}

void __69__PKAccountBillPaymentViewController__updateForShowKeyboardAnimated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      if (*((unsigned char *)WeakRetained + 1136) && !*((void *)WeakRetained + 160) && *((void *)WeakRetained + 153))
      {
        id v8 = WeakRetained;
        uint64_t v3 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:WeakRetained action:sel__tappedSmallRingView_];
        uint64_t v4 = (void *)*((void *)v8 + 160);
        *((void *)v8 + 160) = v3;

        [*((id *)v8 + 153) addGestureRecognizer:*((void *)v8 + 160)];
LABEL_11:
        id WeakRetained = v8;
      }
    }
    else if (!*((unsigned char *)WeakRetained + 1136) && !*((void *)WeakRetained + 161) && *((void *)WeakRetained + 153))
    {
      id v8 = WeakRetained;
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:WeakRetained action:sel__tappedNormalRingViewAmount_];
      uint64_t v6 = (void *)*((void *)v8 + 161);
      *((void *)v8 + 161) = v5;

      id v7 = [*((id *)v8 + 153) enterCurrencyAmountView];
      [v7 addGestureRecognizer:*((void *)v8 + 161)];

      goto LABEL_11;
    }
  }
}

- (void)_payNowButtonTapped:(id)a3
{
  if (PKStoreDemoModeEnabled())
  {
    PKUIStoreDemoGatewayViewController();
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [(PKAccountBillPaymentViewController *)self presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    uint64_t v4 = [(PKAccountBillPaymentViewController *)self _paymentAmount];
    [(PKAccountBillPaymentViewController *)self _setEnabled:0];
    billPaymentCoordinator = self->_billPaymentCoordinator;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __58__PKAccountBillPaymentViewController__payNowButtonTapped___block_invoke;
    v8[3] = &unk_1E59CDC80;
    v8[4] = self;
    id v9 = v4;
    id v6 = v4;
    [(PKAccountBillPaymentController *)billPaymentCoordinator canPerformBillPaymentWithAmount:v6 scheduledDate:0 completion:v8];
  }
}

void __58__PKAccountBillPaymentViewController__payNowButtonTapped___block_invoke(uint64_t a1, int a2, void *a3)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 976) accountIdentifier];
    id v7 = [*(id *)(*(void *)(a1 + 32) + 976) creditDetails];
    id v8 = [v7 accountSummary];
    id v9 = [v8 currentStatement];
    double v10 = [v9 identifier];

    double v11 = [*(id *)(*(void *)(a1 + 32) + 1032) billPaymentSelectedSuggestedAmountDataEventForAmount:*(void *)(a1 + 40) accountIdentifier:v6 statementIdentifier:v10];
    [*(id *)(a1 + 32) _performBillPaymentWithAmount:*(void *)(a1 + 40) billPaymentSuggestedAmountDataEvent:v11];
  }
  else
  {
    double v12 = *(void **)(a1 + 32);
    if (v5)
    {
      [v12 _presentAlertControllerForError:v5];
    }
    else
    {
      [v12 _presentAddBankAccount];
      [*(id *)(a1 + 32) _setEnabled:1];
    }
  }
  uint64_t v13 = *(void **)(a1 + 32);
  uint64_t v14 = *MEMORY[0x1E4F86120];
  v17[0] = *MEMORY[0x1E4F86308];
  v17[1] = v14;
  uint64_t v15 = *MEMORY[0x1E4F86808];
  v18[0] = *MEMORY[0x1E4F86380];
  v18[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v13 _reportEventForPassIfNecessary:v16];
}

- (void)_payLaterButtonTapped:(id)a3
{
  id v4 = a3;
  if (PKStoreDemoModeEnabled())
  {
    id v5 = PKUIStoreDemoGatewayViewController();
    [(PKAccountBillPaymentViewController *)self presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    objc_initWeak(&location, self);
    id v6 = [MEMORY[0x1E4F84270] sharedInstance];
    id v7 = [(PKAccount *)self->_account accountIdentifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke;
    v8[3] = &unk_1E59CDFB0;
    objc_copyWeak(&v9, &location);
    v8[4] = self;
    [v6 scheduledPaymentsWithAccountIdentifier:v7 includeFailedRecurringPayments:1 completion:v8];

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v9);
}

void __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_2(uint64_t a1)
{
  v45[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = objc_msgSend(*(id *)(a1 + 32), "pk_objectsPassingTest:", &__block_literal_global_187);
    id v4 = WeakRetained[122];
    [v4 feature];
    BOOL v35 = [v3 count] != 0;
    id v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
    id v6 = (void *)MEMORY[0x1E4FB1410];
    id v7 = PKLocalizedFeatureString();
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_4;
    v43[3] = &unk_1E59CB1F0;
    v43[4] = WeakRetained;
    uint64_t v8 = [v6 actionWithTitle:v7 style:0 handler:v43];

    [v8 setAccessibilityIdentifier:*MEMORY[0x1E4F85A18]];
    if (([v4 isClosedAndChargedOff] & 1) == 0)
    {
      id v9 = [v4 creditDetails];
      double v10 = [v9 accountSummary];
      double v11 = [v10 paymentDueDate];

      if (v11)
      {
        id v12 = objc_alloc(MEMORY[0x1E4F1C9A8]);
        uint64_t v33 = (void *)[v12 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
        uint64_t v13 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v14 = [v33 components:16 fromDate:v13 toDate:v11 options:0];
        uint64_t v15 = v8;
        uint64_t v16 = [v14 day];

        BOOL v17 = v16 <= 0;
        uint64_t v8 = v15;
        uint64_t v18 = !v17;
        [v15 setEnabled:v18];
      }
    }
    [v5 addAction:v8];
    uint64_t v19 = PKLocalizedFeatureString();
    BOOL v20 = (void *)MEMORY[0x1E4FB1410];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_5;
    v37[3] = &unk_1E59CDF88;
    BOOL v42 = v35;
    id v38 = v4;
    id v39 = v3;
    uint64_t v21 = *(void *)(a1 + 40);
    double v40 = WeakRetained;
    uint64_t v41 = v21;
    id v36 = v3;
    id v34 = v4;
    BOOL v22 = (void *)v19;
    uint64_t v23 = [v20 actionWithTitle:v19 style:0 handler:v37];
    [v23 setAccessibilityIdentifier:*MEMORY[0x1E4F858D8]];
    [v5 addAction:v23];
    id v24 = (void *)MEMORY[0x1E4FB1410];
    CGRect v25 = PKLocalizedFeatureString();
    [v24 actionWithTitle:v25 style:1 handler:0];
    double v27 = v26 = v8;

    [v27 setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
    [v5 addAction:v27];
    double v28 = [v5 popoverPresentationController];
    [v28 setSourceView:*(void *)(*(void *)(a1 + 40) + 1264)];
    [v28 setPermittedArrowDirections:2];
    [WeakRetained presentViewController:v5 animated:1 completion:0];
    uint64_t v29 = *MEMORY[0x1E4F86380];
    uint64_t v30 = *MEMORY[0x1E4F86120];
    v44[0] = *MEMORY[0x1E4F86308];
    v44[1] = v30;
    uint64_t v31 = *MEMORY[0x1E4F867F8];
    v45[0] = v29;
    v45[1] = v31;
    BOOL v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];
    [WeakRetained _reportEventForPassIfNecessary:v32];

    [WeakRetained[128] recordPaymentActionWithDifferentialPrivacy:2];
    [WeakRetained[128] recordPaymentRingAction:3];
  }
}

uint64_t __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 isRecurring];
}

void __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [PKAccountBillPaymentPayLaterViewController alloc];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[122];
  uint64_t v5 = v3[169];
  uint64_t v6 = v3[127];
  uint64_t v7 = v3[123];
  uint64_t v8 = v3[129];
  id v9 = [v3 _paymentAmount];
  id v12 = [(PKAccountBillPaymentPayLaterViewController *)v2 initWithAccount:v4 accountUserCollection:v5 billPaymentController:v6 transactionSource:v7 suggestionList:v8 selectedAmount:v9];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1360));
  [(PKAccountBillPaymentPayLaterViewController *)v12 setObserver:WeakRetained];

  double v11 = [*(id *)(a1 + 32) navigationController];
  [v11 pushViewController:v12 animated:1];
}

void __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F84D50] sharedService];
  if (*(unsigned char *)(a1 + 64))
  {
    id v3 = [PKCreditAccountPaymentDetailsViewController alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = [*(id *)(a1 + 40) firstObject];
    uint64_t v6 = [(PKCreditAccountPaymentDetailsViewController *)v3 initWithAccount:v4 payment:v5 paymentWebService:v2 overrideViewStyle:2];

    uint64_t v7 = [*(id *)(a1 + 48) navigationController];
    [v7 pushViewController:v6 animated:1];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F84270] sharedInstance];
    uint64_t v8 = [[PKAccountAutomaticPaymentsController alloc] initWithAccountService:v6 paymentWebService:v2 account:*(void *)(a1 + 32) context:0];
    [(PKAccountAutomaticPaymentsController *)v8 setDelegate:*(void *)(a1 + 48)];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_6;
    v9[3] = &unk_1E59CDF60;
    int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
    [(PKAccountAutomaticPaymentsController *)v8 nextViewControllerFromViewController:0 withCompletion:v9];
  }
}

void __60__PKAccountBillPaymentViewController__payLaterButtonTapped___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [[PKNavigationController alloc] initWithRootViewController:v3];

  if (objc_msgSend(*(id *)(a1 + 32), "pkui_userInterfaceIdiomSupportsLargeLayouts")) {
    [(PKNavigationController *)v4 setModalPresentationStyle:2];
  }
  [*(id *)(a1 + 40) presentViewController:v4 animated:1 completion:0];
}

- (void)_interstitialButtonTapped:(id)a3
{
  id v4 = a3;
  if ((self->_interstitialState & 0xFFFFFFFFFFFFFFFCLL) == 4)
  {
    objc_initWeak(&location, self);
    uint64_t v5 = objc_opt_class();
    account = self->_account;
    accountUserCollection = self->_accountUserCollection;
    transactionSource = self->_transactionSource;
    configuration = self->_configuration;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __64__PKAccountBillPaymentViewController__interstitialButtonTapped___block_invoke;
    v10[3] = &unk_1E59CDFD8;
    objc_copyWeak(&v11, &location);
    [v5 _billPaymentViewControllerForAccount:account accountUserCollection:accountUserCollection transactionSource:transactionSource configuration:configuration withCompletion:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    [(PKAccountBillPaymentViewController *)self _cancelButtonTapped:v4];
  }
}

void __64__PKAccountBillPaymentViewController__interstitialButtonTapped___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __64__PKAccountBillPaymentViewController__interstitialButtonTapped___block_invoke_2;
  v5[3] = &unk_1E59CB010;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __64__PKAccountBillPaymentViewController__interstitialButtonTapped___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      int8x16_t v10 = WeakRetained;
      int IsVisible = PKViewVisibilityStateIsVisible();
      id WeakRetained = v10;
      if (IsVisible)
      {
        id v4 = [v10 navigationController];
        uint64_t v5 = [v4 viewControllers];
        id v6 = (void *)[v5 mutableCopy];

        unint64_t v7 = [v6 indexOfObjectIdenticalTo:v10];
        unint64_t v8 = [v6 count];
        if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v9 = v8 - v7;
          if (v8 > v7) {
            objc_msgSend(v6, "removeObjectsInRange:", v7, v9);
          }
        }
        objc_msgSend(v6, "addObject:", *(void *)(a1 + 32), v9);
        [v4 setViewControllers:v6 animated:1];

        id WeakRetained = v10;
      }
    }
  }
}

- (double)_buttonHeightForButtonWidth:(double)a3
{
  primaryButton = self->_primaryButton;
  if (primaryButton)
  {
    -[PKLegacyButtonInterface sizeThatFits:](primaryButton, "sizeThatFits:", a3, 1.79769313e308);
    double v7 = fmax(v6, 50.0);
    secondaryButton = self->_secondaryButton;
    if (!secondaryButton) {
      return v7;
    }
LABEL_6:
    -[PKLegacyButtonInterface sizeThatFits:](secondaryButton, "sizeThatFits:", a3, 1.79769313e308);
    return fmax(v9, v7);
  }
  secondaryButton = self->_secondaryButton;
  if (secondaryButton)
  {
    double v7 = 50.0;
    goto LABEL_6;
  }
  return 0.0;
}

- (void)_updatePayNowButtonTitleWithAmount:(id)a3
{
  if (self->_buttonsArePayButtons)
  {
    account = self->_account;
    id v5 = a3;
    [(PKAccount *)account feature];
    id v7 = [(NSNumberFormatter *)self->_amountFormatter stringFromNumber:v5];

    double v6 = PKLocalizedFeatureString();
    -[PKLegacyButtonInterface setTitle:forState:](self->_primaryButton, "setTitle:forState:", v6, 0, v7);
  }
}

- (id)_interestForAmount:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (!self->_interestCalculator)
    {
      double v6 = [MEMORY[0x1E4F845C8] configurationWithCreditAccount:self->_account];
      [v6 setCalculationMethod:1];
      id v7 = (PKCompoundInterestCalculator *)[objc_alloc(MEMORY[0x1E4F845C0]) initWithConfiguration:v6];
      interestCalculator = self->_interestCalculator;
      self->_interestCalculator = v7;

      double v9 = [MEMORY[0x1E4F1CA60] dictionary];
      cachedInterestResults = self->_cachedInterestResults;
      self->_cachedInterestResults = v9;

      id v11 = [(PKTransactionSource *)self->_transactionSource transactionSourceIdentifiers];
      accountUserCollection = self->_accountUserCollection;
      if (accountUserCollection)
      {
        uint64_t v13 = [(PKAccountUserCollection *)accountUserCollection transactionSourceIdentifiers];
        if (v13)
        {
          uint64_t v14 = [v11 setByAddingObjectsFromSet:v13];

          id v11 = (void *)v14;
        }
      }
      id v15 = objc_alloc_init(MEMORY[0x1E4F84C38]);
      uint64_t v16 = [v6 periodStartDate];
      BOOL v17 = [v6 periodEndDate];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      void v19[2] = __57__PKAccountBillPaymentViewController__interestForAmount___block_invoke;
      v19[3] = &unk_1E59CE000;
      v19[4] = self;
      [v15 approvedTransactionsForTransactionSourceIdentifiers:v11 withTransactionSource:0 withBackingData:1 startDate:v16 endDate:v17 limit:0 completion:v19];
    }
    id v5 = [(NSMutableDictionary *)self->_cachedInterestResults objectForKey:v4];
    if (!v5)
    {
      id v5 = [(PKCompoundInterestCalculator *)self->_interestCalculator compoundInterestWithPaymentOfAmount:v4];
      [(NSMutableDictionary *)self->_cachedInterestResults setObject:v5 forKey:v4];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void __57__PKAccountBillPaymentViewController__interestForAmount___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PKAccountBillPaymentViewController__interestForAmount___block_invoke_2;
  v5[3] = &unk_1E59CA870;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __57__PKAccountBillPaymentViewController__interestForAmount___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1040) configuration];
  id v3 = [*(id *)(a1 + 40) allObjects];
  [v2 setPeriodTransactions:v3];

  id v4 = *(void **)(*(void *)(a1 + 32) + 1048);

  return [v4 removeAllObjects];
}

- (id)_paymentAmount
{
  uint64_t v2 = 23;
  if (!self->_showKeyboard) {
    uint64_t v2 = 22;
  }
  id v3 = [*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___PKAccountBillPaymentViewController__account[v2]) amount];

  return v3;
}

- (void)_setEnabled:(BOOL)a3
{
  if (((!self->_viewIsEnabled ^ a3) & 1) == 0)
  {
    self->_viewIsEnabled = a3;
    id v6 = [(PKAccountBillPaymentViewController *)self viewIfLoaded];
    [v6 setUserInteractionEnabled:self->_viewIsEnabled];
    [(PKAccountBillPaymentViewController *)self _setPayButtonsEnabled:self->_viewIsEnabled];
    [(PKLegacyButtonInterface *)self->_primaryButton setShowSpinner:!self->_viewIsEnabled];
    [(UIButton *)self->_tertiaryButton setEnabled:self->_viewIsEnabled];
    id v4 = [(PKAccountBillPaymentViewController *)self navigationItem];
    id v5 = [v4 leftBarButtonItem];
    [v5 setEnabled:self->_viewIsEnabled];

    [v6 setNeedsLayout];
  }
}

- (void)_setPayButtonsEnabled:(BOOL)a3
{
  if (((!self->_payButtonsEnabled ^ a3) & 1) == 0)
  {
    self->_payButtonsEnabled = a3;
    primaryButton = self->_primaryButton;
    if (self->_buttonsArePayButtons) {
      BOOL v5 = a3;
    }
    else {
      *(void *)&a3 = 1;
    }
    [(PKLegacyButtonInterface *)primaryButton setEnabled:a3];
    secondaryButton = self->_secondaryButton;
    BOOL v7 = self->_shouldEnablePayLaterButton && self->_payButtonsEnabled;
    [(PKLegacyButtonInterface *)secondaryButton setEnabled:v7];
  }
}

- (void)_dismissViewControllerWithSuccess:(BOOL)a3
{
  id v3 = [(PKAccountBillPaymentViewController *)self presentingViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (void)_presentAddBankAccount
{
  id v4 = [(PKAccountBillPaymentViewController *)self _addBankAccountInformationViewController];
  [v4 setOfferKeychainPreFill:1];
  id v3 = [[PKNavigationController alloc] initWithRootViewController:v4];
  [(PKNavigationController *)v3 setSupportedInterfaceOrientations:2];
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKNavigationController *)v3 setModalPresentationStyle:2];
  }
  [(PKAccountBillPaymentViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (id)_addBankAccountInformationViewController
{
  addBankAccountViewController = self->_addBankAccountViewController;
  if (!addBankAccountViewController)
  {
    id v4 = [PKAddBankAccountInformationViewController alloc];
    BOOL v5 = (void *)[objc_alloc(MEMORY[0x1E4F84550]) initWithType:1];
    id v6 = [(PKAccount *)self->_account creditDetails];
    BOOL v7 = [v6 countryCode];
    unint64_t v8 = [(PKAddBankAccountInformationViewController *)v4 initWithDelegate:self bankInformation:v5 accountCountryCode:v7 featureAccount:self->_account];
    double v9 = self->_addBankAccountViewController;
    self->_addBankAccountViewController = v8;

    addBankAccountViewController = self->_addBankAccountViewController;
  }

  return addBankAccountViewController;
}

- (id)_interestPostDate
{
  uint64_t v2 = [(PKAccount *)self->_account creditDetails];
  id v3 = [v2 accountSummary];
  id v4 = [v3 balanceSummary];
  BOOL v5 = [v4 closingDate];

  return v5;
}

- (id)_roundedInterestForAmount:(id)a3
{
  id v4 = a3;
  if ([(PKAccount *)self->_account showBillPaymentInterest])
  {
    BOOL v5 = [(PKAccountBillPaymentViewController *)self _interestForAmount:v4];
    uint64_t v6 = [MEMORY[0x1E4F84578] roundingHandler];
    BOOL v7 = [v5 decimalNumberByRoundingAccordingToBehavior:v6];

    unint64_t v8 = [MEMORY[0x1E4F28C28] zero];
    LOBYTE(v6) = [v7 isEqualToNumber:v8];

    if (v6) {
      id v9 = 0;
    }
    else {
      id v9 = v7;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_interestStringForAmount:(id)a3
{
  id v4 = [(PKAccountBillPaymentViewController *)self _roundedInterestForAmount:a3];
  if (v4)
  {
    BOOL v5 = [(NSNumberFormatter *)self->_amountFormatter stringFromNumber:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_interestLabelIsOutsideSmallRing
{
  if (PKIsVision()) {
    return 0;
  }
  if (!PKUIGetMinScreenWidthType() || self->_usesAccessibilityLayout) {
    return 1;
  }
  ringView = self->_ringView;

  return [(PKBillPaymentRingView *)ringView isHidden];
}

- (void)_updateNavigationTitle
{
  if (self->_showKeyboard || self->_titleLabel)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [(PKAccountBillPaymentViewController *)self _title];
  }
  id v4 = (id)v3;
  [(PKAccountBillPaymentViewController *)self setTitle:v3];
}

- (id)_title
{
  [(PKAccount *)self->_account feature];
  switch(self->_interstitialState)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      id v4 = PKLocalizedFeatureString();
      if (!v4) {
        goto LABEL_4;
      }
      goto LABEL_5;
    case 5uLL:
      if ([(NSArray *)self->_installmentPlans count] < 2) {
        uint64_t v3 = @"BILL_PAYMENT_INTERSTITIAL_NEW_INSTALLMENT_TITLE";
      }
      else {
        uint64_t v3 = @"BILL_PAYMENT_INTERSTITIAL_NEW_MULTI_INSTALLMENT_TITLE";
      }
      goto LABEL_11;
    case 6uLL:
    case 7uLL:
      uint64_t v3 = @"BILL_PAYMENT_INTERSTITIAL_EARLY_INSTALLMENT_PAYMENT_TITLE";
LABEL_11:
      id v4 = PKLocalizedBeekmanString(&v3->isa);
      if (!v4) {
        goto LABEL_4;
      }
      goto LABEL_5;
    default:
LABEL_4:
      id v4 = PKLocalizedFeatureString();
LABEL_5:
      return v4;
  }
}

- (void)_updateSubtitle
{
  if (self->_subtitleLabel)
  {
    [(PKAccount *)self->_account feature];
    id v57 = [(PKAccount *)self->_account creditDetails];
    uint64_t v3 = [v57 accountSummary];
    id v4 = [v3 currentStatement];
    BOOL v5 = createDateFormatter();
    switch(self->_interstitialState)
    {
      case 1uLL:
      case 2uLL:
      case 3uLL:
        uint64_t v6 = PKLocalizedFeatureString();
        goto LABEL_34;
      case 4uLL:
        BOOL v7 = [v57 currencyCode];
        if (accountCurrentStatementIsLastMonthsStatement(self->_account))
        {
          unint64_t v8 = [v4 closingDate];
          if (v8)
          {
            uint64_t v9 = [v5 stringFromDate:v8];
          }
          else
          {
            uint64_t v9 = 0;
          }
        }
        else
        {
          uint64_t v9 = 0;
          unint64_t v8 = 0;
        }
        uint64_t v31 = [v3 pastDueAmount];
        double v52 = v31;
        if (v31)
        {
          PKCurrencyAmountCreate(v31, v7);
          uint64_t v31 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
        }
        double v49 = v31;
        uint64_t v32 = [(NSDecimalNumber *)v31 formattedStringValue];
        uint64_t v33 = (void *)v32;
        double v55 = (void *)v9;
        if (v32 && v9)
        {
          CGSize v45 = (void *)v9;
          double v46 = (void *)v32;
LABEL_49:
          uint64_t v34 = PKLocalizedFeatureString();
          goto LABEL_50;
        }
        if (v32)
        {
          CGSize v45 = (void *)v32;
          goto LABEL_49;
        }
        if (v9)
        {
          CGSize v45 = (void *)v9;
          goto LABEL_49;
        }
        uint64_t v34 = PKLocalizedFeatureString();
LABEL_50:
        uint64_t v14 = (__CFString *)v34;
        if (objc_msgSend(v3, "requiresDebtCollectionNotices", v45, v46))
        {
          PKLocalizedFeatureString();
          BOOL v35 = v48 = v7;
          [(__CFString *)v14 stringByAppendingString:v35];
          unint64_t v47 = v8;
          v37 = id v36 = v5;

          uint64_t v14 = (__CFString *)v37;
          BOOL v5 = v36;
          unint64_t v8 = v47;
          BOOL v7 = v48;
        }

        if (v14)
        {
LABEL_35:
          BOOL v29 = 0;
          goto LABEL_62;
        }
LABEL_13:
        id v15 = [v3 pastDueAmount];
        double v56 = v5;
        double v51 = v15;
        if ([v3 cyclesPastDue] <= 0)
        {
          if (v15)
          {
            uint64_t v16 = [MEMORY[0x1E4F28C28] zero];
            LODWORD(v15) = [v15 compare:v16] == 1;
          }
        }
        else
        {
          LODWORD(v15) = 1;
        }
        BOOL v17 = [(PKBillPaymentSuggestedAmountList *)self->_suggestionList remainingStatementAmount];
        uint64_t v18 = [v3 paymentDueDate];
        double v53 = v4;
        if (v17)
        {
          uint64_t v19 = [MEMORY[0x1E4F28C28] zero];
          BOOL v20 = [v17 compare:v19] == 1;
        }
        else
        {
          BOOL v20 = 0;
        }
        double v54 = [v57 productTimeZone];
        uint64_t v21 = [(PKAccount *)self->_account stateReason];
        BOOL v22 = createBaseDateFormatter();
        [v22 setTimeStyle:1];
        if (v15) {
          goto LABEL_21;
        }
        if (v18) {
          BOOL v24 = v20;
        }
        else {
          BOOL v24 = 0;
        }
        if (v24)
        {
          int IsSingular = PKHourOfDateIsSingular();
          double v26 = @"ACCOUNT_SERVICE_BILL_PAYMENT_PAYMENT_DUE_BY";
          if (IsSingular) {
            double v26 = @"ACCOUNT_SERVICE_BILL_PAYMENT_PAYMENT_DUE_BY_HOUR_ONE";
          }
          double v27 = v26;
          double v28 = [v22 stringFromDate:v18];
          [v56 stringFromDate:v18];
          v46 = CGSize v45 = v28;
          uint64_t v23 = PKLocalizedFeatureString();
        }
        else if (v20)
        {
          uint64_t v23 = 0;
        }
        else if (v21 == 2)
        {
LABEL_21:
          uint64_t v23 = PKLocalizedFeatureString();
        }
        else
        {
          if (v18)
          {
            uint64_t v30 = PKEndOfNextMonthAndTimeZone();
          }
          else
          {
            id v38 = [MEMORY[0x1E4F1C9C8] date];
            uint64_t v30 = PKEndOfNextMonthAndTimeZone();
          }
          int v39 = PKHourOfDateIsSingular();
          double v40 = @"ACCOUNT_SERVICE_BILL_PAYMENT_NO_PAYMENTS_DUE_UNTIL";
          if (v39) {
            double v40 = @"ACCOUNT_SERVICE_BILL_PAYMENT_NO_PAYMENTS_DUE_UNTIL_HOUR_ONE";
          }
          uint64_t v41 = v40;
          uint64_t v42 = [v22 stringFromDate:v30];
          uint64_t v43 = v30;
          double v50 = (void *)v30;
          double v44 = (void *)v42;
          [v56 stringFromDate:v43];
          v46 = CGSize v45 = v44;
          uint64_t v23 = PKLocalizedFeatureString();
        }
        BOOL v29 = v23 == 0;
        if (v23) {
          uint64_t v14 = (__CFString *)v23;
        }
        else {
          uint64_t v14 = @" ";
        }
        id v4 = v53;
        BOOL v5 = v56;
LABEL_62:
        -[UILabel setText:](self->_subtitleLabel, "setText:", v14, v45, v46);
        [(UILabel *)self->_subtitleLabel setHidden:v29];

        break;
      case 5uLL:
        if ([(NSArray *)self->_installmentPlans count] < 2) {
          int8x16_t v10 = @"BILL_PAYMENT_INTERSTITIAL_NEW_INSTALLMENT_MESSAGE";
        }
        else {
          int8x16_t v10 = @"BILL_PAYMENT_INTERSTITIAL_NEW_MULTI_INSTALLMENT_MESSAGE";
        }
        uint64_t v6 = PKLocalizedBeekmanString(&v10->isa);
LABEL_34:
        uint64_t v14 = (__CFString *)v6;
        if (v6) {
          goto LABEL_35;
        }
        goto LABEL_13;
      case 6uLL:
        id v11 = [v57 rates];
        id v12 = [v11 formattedAPRForPurchasesPercentageString];

        PKLocalizedBeekmanString(&cfstr_BillPaymentInt_4.isa, &stru_1EF1B4C70.isa, v12);
        goto LABEL_12;
      case 7uLL:
        uint64_t v13 = [v57 rates];
        id v12 = [v13 formattedAPRForPurchasesPercentageString];

        PKLocalizedBeekmanString(&cfstr_BillPaymentInt_5.isa, &stru_1EF1B4C70.isa, v12);
LABEL_12:
        uint64_t v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (!v14) {
          goto LABEL_13;
        }
        goto LABEL_35;
      default:
        goto LABEL_13;
    }
  }
}

- (void)_setupAmountDescriptionViewForInterstitial
{
  if (self->_interstitialState)
  {
    [(PKAccount *)self->_account feature];
    uint64_t v3 = 0;
    id v4 = 0;
    switch(self->_interstitialState)
    {
      case 1uLL:
        BOOL v5 = [(PKAccount *)self->_account creditDetails];
        uint64_t v6 = [v5 createdDate];

        PKLocalizedFeatureString();
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v7 = createDateFormatter();
        unint64_t v8 = PKEndOfNextMonth();
        uint64_t v9 = [v7 stringFromDate:v8];
        goto LABEL_6;
      case 2uLL:
        int8x16_t v10 = [(PKAccount *)self->_account creditDetails];
        id v11 = [v10 accountSummary];
        uint64_t v6 = [v11 paymentDueDate];

        PKLocalizedFeatureString();
        id v14 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v7 = createDateFormatter();
        unint64_t v8 = PKEndOfNextMonth();
        uint64_t v9 = [v7 stringFromDate:v8];
LABEL_6:
        uint64_t v13 = v9;
        uint64_t v3 = PKLocalizedFeatureString();

        id v4 = v14;
        break;
      case 3uLL:
        PKLocalizedFeatureString();
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = PKLocalizedFeatureString();
        goto LABEL_9;
      case 4uLL:
        break;
      case 5uLL:
        PKLocalizedBeekmanString(&cfstr_BillPaymentInt_6.isa);
        id v15 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = PKLocalizedBeekmanString(&cfstr_BillPaymentInt_7.isa);
LABEL_9:
        id v4 = v15;
        uint64_t v3 = (void *)v12;
        break;
      default:
        id v4 = 0;
        break;
    }
    id v16 = v4;
    -[PKAccountBillPaymentAmountDescriptionView setTitleText:](self->_amountDescriptionView, "setTitleText:", v4, v13);
    [(PKAccountBillPaymentAmountDescriptionView *)self->_amountDescriptionView setDescriptionText:v3];
  }
}

- (void)_configureProductHeroView
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PKAccountBillPaymentViewController__configureProductHeroView__block_invoke;
  aBlock[3] = &unk_1E59CA898;
  aBlock[4] = self;
  uint64_t v3 = (void (**)(void *, void *))_Block_copy(aBlock);
  id v4 = [(NSArray *)self->_installmentPlans firstObject];
  BOOL v5 = [v4 product];
  uint64_t v6 = [v5 iconURLForScale:0 suffix:PKUIScreenScale()];

  if (v6)
  {
    BOOL v7 = [MEMORY[0x1E4F84830] sharedImageAssetDownloader];
    unint64_t v8 = [v7 cachedDataForURL:v6];
    if (v8)
    {
      uint64_t v9 = [MEMORY[0x1E4FB1818] imageWithData:v8];
      v3[2](v3, v9);
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __63__PKAccountBillPaymentViewController__configureProductHeroView__block_invoke_2;
      v10[3] = &unk_1E59CE028;
      id v11 = v3;
      [v7 downloadFromUrl:v6 completionHandler:v10];
      uint64_t v9 = v11;
    }
  }
  else
  {
    BOOL v7 = PKUIImageNamed(@"Hero_Apply-CCS");
    v3[2](v3, v7);
  }
}

void __63__PKAccountBillPaymentViewController__configureProductHeroView__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 1312) setImage:a2];
    id v3 = [*(id *)(a1 + 32) view];
    [v3 setNeedsLayout];
  }
}

void __63__PKAccountBillPaymentViewController__configureProductHeroView__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  if (v6 && !a4)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__PKAccountBillPaymentViewController__configureProductHeroView__block_invoke_3;
    v7[3] = &unk_1E59CAD68;
    id v9 = *(id *)(a1 + 32);
    id v8 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

void __63__PKAccountBillPaymentViewController__configureProductHeroView__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [MEMORY[0x1E4FB1818] imageWithData:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)_showOrHideKeypad
{
  BOOL showKeyboard = self->_showKeyboard;
  amountDescriptionView = self->_amountDescriptionView;
  if (showKeyboard) {
    [(PKAccountBillPaymentAmountDescriptionView *)amountDescriptionView showKeyboard];
  }
  else {
    [(PKAccountBillPaymentAmountDescriptionView *)amountDescriptionView dismissKeyboard];
  }
}

- (void)_presentAlertControllerForError:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[PKAccountFlowController displayableErrorForError:v4 featureIdentifier:[(PKAccount *)self->_account feature] genericErrorTitle:0 genericErrorMessage:0];
  objc_initWeak(&location, self);
  id v6 = objc_opt_class();
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int8x16_t v10 = __70__PKAccountBillPaymentViewController__presentAlertControllerForError___block_invoke;
  id v11 = &unk_1E59CA7F8;
  objc_copyWeak(&v12, &location);
  BOOL v7 = [v6 alertControllerForDisplayableError:v5 handler:&v8];
  if (v7) {
    -[PKAccountBillPaymentViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0, v8, v9, v10, v11);
  }
  else {
    -[PKAccountBillPaymentViewController _setEnabled:](self, "_setEnabled:", 1, v8, v9, v10, v11);
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __70__PKAccountBillPaymentViewController__presentAlertControllerForError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showOrHideKeypad];
  [WeakRetained _setEnabled:1];
}

- (void)_reportEventForPassIfNecessary:(id)a3
{
  id v10 = a3;
  id v4 = (void *)MEMORY[0x1E4F843E0];
  BOOL v5 = [(PKTransactionSource *)self->_transactionSource paymentPass];
  id v6 = [v4 subjectToReportDashboardAnalyticsForPass:v5];

  if (v10 && v6)
  {
    BOOL v7 = (void *)[v10 mutableCopy];
    [v7 setObject:*MEMORY[0x1E4F86248] forKey:*MEMORY[0x1E4F86730]];
    uint64_t v8 = (void *)MEMORY[0x1E4F843E0];
    uint64_t v9 = (void *)[v7 copy];
    [v8 subject:v6 sendEvent:v9];
  }
}

- (PKAccount)account
{
  return self->_account;
}

- (PKAccountUserCollection)accountUserCollection
{
  return self->_accountUserCollection;
}

- (PKTransactionSource)transactionSource
{
  return self->_transactionSource;
}

- (PKAccountBillPaymentObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (PKAccountBillPaymentObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_accountUserCollection, 0);
  objc_storeStrong((id *)&self->_CLInUse, 0);
  objc_storeStrong((id *)&self->_accountResolutionController, 0);
  objc_storeStrong((id *)&self->_addBankAccountViewController, 0);
  objc_storeStrong((id *)&self->_productHeroView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_blurringView, 0);
  objc_storeStrong((id *)&self->_ringViewAmountTapRecognizer, 0);
  objc_storeStrong((id *)&self->_ringViewTapRecognizer, 0);
  objc_storeStrong((id *)&self->_smallRingInterestLabel, 0);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_tertiaryButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_amountDescriptionView, 0);
  objc_storeStrong((id *)&self->_interestForStatementBalance, 0);
  objc_storeStrong((id *)&self->_interestForPaymentTotal, 0);
  objc_storeStrong((id *)&self->_previousAccountSummary, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_smallRingInterestDateAttributes, 0);
  objc_storeStrong((id *)&self->_smallRingInterestAttributes, 0);
  objc_storeStrong((id *)&self->_apr, 0);
  objc_storeStrong((id *)&self->_amountFormatter, 0);
  objc_storeStrong((id *)&self->_interestDateFormatter, 0);
  objc_storeStrong((id *)&self->_cachedInterestResults, 0);
  objc_storeStrong((id *)&self->_interestCalculator, 0);
  objc_storeStrong((id *)&self->_suggestionList, 0);
  objc_storeStrong((id *)&self->_suggestedAmountController, 0);
  objc_storeStrong((id *)&self->_billPaymentCoordinator, 0);
  objc_storeStrong((id *)&self->_installmentPlans, 0);
  objc_storeStrong((id *)&self->_transactionSource, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end