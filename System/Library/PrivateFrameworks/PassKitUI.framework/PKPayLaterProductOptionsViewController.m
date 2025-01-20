@interface PKPayLaterProductOptionsViewController
- (PKPayLaterProductOptionsViewController)initWithSetupFlowController:(id)a3 dynamicContentPageType:(unint64_t)a4;
- (void)_loadNextViewController;
- (void)_selectedEligibleAssessment;
- (void)productOptionsSectionController:(id)a3 didSelectFinancingOption:(id)a4;
- (void)productOptionsSectionController:(id)a3 didSelectPreliminaryAssessment:(id)a4;
- (void)reloadAllSectionsAnimated:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation PKPayLaterProductOptionsViewController

- (PKPayLaterProductOptionsViewController)initWithSetupFlowController:(id)a3 dynamicContentPageType:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterProductOptionsViewController;
  v7 = [(PKPayLaterSetupViewController *)&v14 initWithSetupFlowController:v6 dynamicContentPageType:a4];
  v8 = v7;
  if (v7)
  {
    v7->_pageType = a4;
    v9 = [PKPayLaterProductOptionsSectionController alloc];
    v10 = [(PKPayLaterSetupViewController *)v8 dynamicContentPage];
    uint64_t v11 = [(PKPayLaterProductOptionsSectionController *)v9 initWithSetupFlowController:v6 dynamicContentPage:v10 delegate:v8];
    sectionController = v8->_sectionController;
    v8->_sectionController = (PKPayLaterProductOptionsSectionController *)v11;

    [(PKPayLaterSectionController *)v8->_sectionController setDynamicCollectionDelegate:v8];
  }

  return v8;
}

- (void)viewDidLoad
{
  v22[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)PKPayLaterProductOptionsViewController;
  [(PKPayLaterSetupViewController *)&v21 viewDidLoad];
  v3 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
  v4 = [v3 headerTitle];
  [(PKPaymentSetupOptionsViewController *)self setTitleText:v4];

  v5 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
  id v6 = [v5 headerSubtitle];
  [(PKPaymentSetupOptionsViewController *)self setSubtitleText:v6];

  [(PKPaymentSetupOptionsViewController *)self setShowSearchBar:0];
  [(PKPayLaterSetupViewController *)self setRightBarButton:0];
  v7 = [(PKPaymentSetupOptionsViewController *)self dockView];
  v8 = [v7 footerView];
  if (self->_pageType == 6)
  {
    v9 = [(PKPayLaterSetupViewController *)self setupController];
    v10 = [v9 financingController];
    uint64_t v11 = [v10 assessmentCollection];

    v12 = [v11 eligibleProductAssessments];
    uint64_t v13 = [v12 count];

    objc_super v14 = [(PKPayLaterSetupViewController *)self setupController];
    uint64_t v15 = [v14 controllerContext];

    if ((unint64_t)(v15 - 1) <= 2 && self->_pageType == 6) {
      [v7 setAdditionalLinkView:0];
    }
    if (v13 < 2)
    {
      v16 = [(PKPayLaterSetupViewController *)self dynamicContentPage];
      v17 = [v16 primaryActionTitle];

      if (v17)
      {
        v18 = [v7 primaryButton];
        [v18 setTitle:v17 forState:0];

        v19 = [v7 primaryButton];
        [v19 addTarget:self action:sel__selectedEligibleAssessment forControlEvents:64];
      }
      else
      {
        [v7 setPrimaryButton:0];
      }
      [v8 setManualEntryButton:0];
    }
    else
    {
      [(PKPaymentSetupOptionsViewController *)self removeSetupDockView];
    }
  }
  v22[0] = self->_sectionController;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v20 animated:0];
}

- (void)reloadAllSectionsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = self->_sectionController;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  [(PKPaymentSetupOptionsViewController *)self setSections:v5 animated:v3];
}

- (void)productOptionsSectionController:(id)a3 didSelectFinancingOption:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v5 identifier];
    int v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "User selected pay later financing option identifier: %@", (uint8_t *)&v9, 0xCu);
  }
  v8 = [(PKPayLaterSetupViewController *)self setupController];
  [v8 setSelectedFinancingOption:v5];

  [(PKPayLaterProductOptionsViewController *)self _loadNextViewController];
}

- (void)productOptionsSectionController:(id)a3 didSelectPreliminaryAssessment:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [v5 productType];
  id v6 = PKPayLaterAccountProductTypeToString();
  v7 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "User selected pay later preliminary assessment type: %@", (uint8_t *)&v9, 0xCu);
  }

  v8 = [(PKPayLaterSetupViewController *)self setupController];
  [v8 setSelectedPreliminaryAssessment:v5];

  [(PKPayLaterProductOptionsViewController *)self _loadNextViewController];
}

- (void)_loadNextViewController
{
  [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:1];
  objc_initWeak(&location, self);
  BOOL v3 = [(PKPayLaterSetupViewController *)self setupController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke;
  v4[3] = &unk_1E59CB9C8;
  objc_copyWeak(&v5, &location);
  [v3 nextViewControllerFromState:4 parentViewController:self completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      id v9 = [WeakRetained navigationController];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_2;
      v13[3] = &unk_1E59CB6D8;
      v13[4] = v8;
      objc_msgSend(v9, "pk_presentPaymentSetupViewController:animated:completion:", v5, 1, v13);
    }
    else
    {
      if (!v6)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_5;
        v11[3] = &unk_1E59CA7D0;
        v11[4] = WeakRetained;
        [WeakRetained dismissSetupFlowWithCompletion:v11];
        goto LABEL_5;
      }
      v10 = PKAccountDisplayableError();
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_3;
      v12[3] = &unk_1E59CA7D0;
      v12[4] = v8;
      id v9 = PKAlertForDisplayableErrorWithHandlers(v10, 0, v12, 0);

      if (v9) {
        [v8 presentViewController:v9 animated:1 completion:0];
      }
    }
  }
LABEL_5:
}

uint64_t __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

uint64_t __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_4;
  v3[3] = &unk_1E59CA7D0;
  v3[4] = v1;
  return [v1 dismissSetupFlowWithCompletion:v3];
}

uint64_t __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

uint64_t __65__PKPayLaterProductOptionsViewController__loadNextViewController__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowNavigationBarSpinner:0];
}

- (void)_selectedEligibleAssessment
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKPayLaterSetupViewController *)self setupController];
  v4 = [v3 financingController];
  id v5 = [v4 assessmentCollection];

  id v6 = [v5 eligibleProductAssessments];
  if ([v6 count])
  {
    v7 = [v6 firstObject];
    v8 = [v7 preliminaryAssessment];
    if (v8)
    {
      [(PKPayLaterProductOptionsViewController *)self productOptionsSectionController:self->_sectionController didSelectPreliminaryAssessment:v8];
    }
    else
    {
      v10 = [v7 financingOptions];
      uint64_t v11 = [v10 count];

      if (v11 == 1)
      {
        sectionController = self->_sectionController;
        uint64_t v13 = [v7 financingOptions];
        objc_super v14 = [v13 firstObject];
        [(PKPayLaterProductOptionsViewController *)self productOptionsSectionController:sectionController didSelectFinancingOption:v14];
      }
      else
      {
        uint64_t v15 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412290;
          v19 = v7;
          _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Error: There is no preliminaryAssessment or financingOption to select %@", (uint8_t *)&v18, 0xCu);
        }

        v16 = PKAccountDisplayableError();
        id v17 = PKAlertForDisplayableErrorWithHandlers(v16, 0, 0, 0);

        if (v17) {
          [(PKPayLaterProductOptionsViewController *)self presentViewController:v17 animated:1 completion:0];
        }
      }
    }
  }
  else
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "There are no eligible pay later assessments to display to the user %@", (uint8_t *)&v18, 0xCu);
    }

    [(PKPayLaterSetupViewController *)self doneButtonTapped];
  }
}

- (void).cxx_destruct
{
}

@end