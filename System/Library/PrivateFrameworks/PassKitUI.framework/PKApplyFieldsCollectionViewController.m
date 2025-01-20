@interface PKApplyFieldsCollectionViewController
- (BOOL)_determineNextEnablementWithPage:(id)a3;
- (BOOL)hasFieldsSubmitted;
- (id)_recomputeSections;
- (void)_keyboardWillHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_terminateFlow;
- (void)_updatePrimaryButton;
- (void)handleNextStep;
- (void)primaryButtonTapped;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)recomputeSectionsWithReload:(BOOL)a3;
- (void)reloadDataAnimated:(BOOL)a3;
- (void)showButtonSpinner:(BOOL)a3;
- (void)submitFields;
- (void)verifyAndSubmitFields;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKApplyFieldsCollectionViewController

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)PKApplyFieldsCollectionViewController;
  [(PKApplyCollectionViewController *)&v28 viewDidLoad];
  v3 = [(PKApplyCollectionViewController *)self currentPage];
  v4 = [(PKDynamicCollectionViewController *)self collectionView];
  [v4 setAccessibilityIdentifier:*MEMORY[0x1E4F85240]];
  v5 = [(PKApplyFieldsCollectionViewController *)self _recomputeSections];
  [(PKPaymentSetupOptionsViewController *)self setSections:v5 animated:0];

  v6 = [(PKPaymentSetupOptionsViewController *)self headerView];
  [v6 setAdditionalBottomPadding:4.0];
  [v6 setTitleAccessoriesEnabled:0];
  v7 = PKProvisioningBackgroundColor();
  [v4 setBackgroundColor:v7];
  v8 = [(PKApplyFieldsCollectionViewController *)self view];
  [v8 setBackgroundColor:v7];

  [(PKPaymentSetupOptionsViewController *)self setHeaderBackgroundColor:v7];
  id v9 = v3;
  v10 = [(PKApplyFieldsCollectionViewController *)self navigationItem];
  v11 = [v9 identifier];
  if (v11 != @"taxWithholding")
  {
    v12 = v11;
    if (!v11
      || (char v13 = [(__CFString *)v11 isEqualToString:@"taxWithholding"],
          v12,
          v12,
          (v13 & 1) == 0))
    {
      [v10 setLeftBarButtonItem:0];
      [v10 setHidesBackButton:0];
    }
  }
  v14 = [v9 primaryActionTitle];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    uint64_t v16 = PKUIGetMinScreenWidthType();
    double v17 = -20.0;
    if (!v16) {
      double v17 = -10.0;
    }
    [v6 setAdditionalTopPadding:v17];
    self->_needsToReachEndOfPage = 1;
  }
  else
  {
    id v18 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v19 = PKLocalizedPaymentString(&cfstr_Submit.isa);
    v20 = (void *)[v18 initWithTitle:v19 style:2 target:self action:sel_handleNextStep];

    [v20 setAccessibilityIdentifier:*MEMORY[0x1E4F85720]];
    [v20 setEnabled:0];
    [v10 setRightBarButtonItem:v20];
  }
  v21 = [(PKApplyCollectionViewController *)self controller];
  if ([v21 applicationType] != 5) {
    goto LABEL_13;
  }
  v22 = [v9 secondaryActionTitle];
  uint64_t v23 = [v22 length];

  if (!v23)
  {
    id v24 = objc_alloc(MEMORY[0x1E4FB14A8]);
    v25 = [(PKApplyCollectionViewController *)self controller];
    [v25 featureIdentifier];
    v26 = PKLocalizedFeatureString();
    v21 = (void *)[v24 initWithTitle:v26 style:0 target:self action:sel__terminateFlow];

    [v21 setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
    [v10 setLeftBarButtonItem:v21];
LABEL_13:
  }
  v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v27 addObserver:self selector:sel__keyboardWillShow_ name:*MEMORY[0x1E4FB2C58] object:0];
  [v27 addObserver:self selector:sel__keyboardWillHide_ name:*MEMORY[0x1E4FB2C50] object:0];
  [(PKPaymentSetupOptionsViewController *)self setShouldCollapseHeaderOnKeyboardShow:0];
  [(PKPaymentSetupOptionsViewController *)self setShowNoResultsView:0 animated:0];
}

- (id)_recomputeSections
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [(PKApplyCollectionViewController *)self controller];
  id v5 = [(PKApplyCollectionViewController *)self currentPage];
  v6 = [v5 fieldModel];
  BOOL v7 = [(PKApplyFieldsCollectionViewController *)self _determineNextEnablementWithPage:v5];
  v61 = self;
  v8 = [(PKApplyFieldsCollectionViewController *)self navigationItem];
  id v9 = [v8 rightBarButtonItem];
  [v9 setEnabled:v7];

  v10 = (void *)v4;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v62 = v6;
  id obj = [v6 visiblePaymentSetupFields];
  uint64_t v11 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
  v57 = v5;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v68;
    uint64_t v59 = *(void *)v68;
    v55 = (void *)v4;
    v56 = v3;
    do
    {
      uint64_t v14 = 0;
      uint64_t v58 = v12;
      do
      {
        if (*(void *)v68 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v67 + 1) + 8 * v14);
        uint64_t v16 = objc_msgSend(v15, "identifier", v55);
        int v17 = [v62 requirementsMetForFieldWithIdentifier:v16];

        if (v17)
        {
          if ([v15 fieldType] == 5)
          {
            id v18 = [v15 pickerFieldObject];
            uint64_t v19 = [(PKApplyRequiredFieldSectionController *)v18 pickerType];
            if (v19 != 2)
            {
              if (v19 == 1)
              {
                v20 = [[PKApplyRadioPickerSectionController alloc] initWithController:v10 applyPage:v5 picker:v18];
                [(PKApplyCollectionViewSectionController *)v20 setDynamicCollectionDelegate:v61];
                [v3 addObject:v20];
                goto LABEL_33;
              }
LABEL_35:

              goto LABEL_36;
            }
            v20 = [[PKApplyMultilevelListPickerSectionController alloc] initWithController:v10 applyPage:v5 picker:v18];
            [(PKApplyCollectionViewSectionController *)v20 setDynamicCollectionDelegate:v61];
            [v3 addObject:v20];
            v34 = [(PKApplyRequiredFieldSectionController *)v18 currentValue];
            v35 = [v34 nextLevelPicker];

            if (v35)
            {
              while (2)
              {
                if ([v35 fieldType] == 5)
                {
                  uint64_t v36 = [v35 pickerType];
                  if (v36 == 1)
                  {
                    v37 = off_1E59C2A70;
LABEL_28:
                    v38 = (void *)[objc_alloc(*v37) initWithController:v10 applyPage:v5 picker:v35];
                    [v38 setDynamicCollectionDelegate:v61];
                  }
                  else
                  {
                    if (v36 == 2)
                    {
                      v37 = off_1E59C2A20;
                      goto LABEL_28;
                    }
                    v38 = 0;
                  }
                  [v3 safelyAddObject:v38];
                }
                v39 = [v35 currentValue];
                uint64_t v40 = [v39 nextLevelPicker];

                v35 = (void *)v40;
                if (!v40) {
                  break;
                }
                continue;
              }
            }
            uint64_t v12 = v58;
LABEL_33:
          }
          else
          {
            if ([v15 fieldType] == 3)
            {
              id v18 = [v15 labelFieldObject];
              id v21 = objc_alloc_init(MEMORY[0x1E4F84488]);
              v22 = [(PKApplyRequiredFieldSectionController *)v18 title];
              [v21 setFooterText:v22];

              id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v63 = 0u;
              long long v64 = 0u;
              long long v65 = 0u;
              long long v66 = 0u;
              id v24 = [(PKApplyRequiredFieldSectionController *)v18 links];
              uint64_t v25 = [v24 countByEnumeratingWithState:&v63 objects:v71 count:16];
              if (v25)
              {
                uint64_t v26 = v25;
                uint64_t v27 = *(void *)v64;
                do
                {
                  for (uint64_t i = 0; i != v26; ++i)
                  {
                    if (*(void *)v64 != v27) {
                      objc_enumerationMutation(v24);
                    }
                    v29 = (void *)[objc_alloc(MEMORY[0x1E4F84490]) initWithDictionary:*(void *)(*((void *)&v63 + 1) + 8 * i)];
                    [v23 safelyAddObject:v29];
                  }
                  uint64_t v26 = [v24 countByEnumeratingWithState:&v63 objects:v71 count:16];
                }
                while (v26);
              }

              [v21 setLinks:v23];
              v10 = v55;
              id v5 = v57;
              v30 = [[PKApplyInlineFooterSectionController alloc] initWithController:v55 applyPage:v57 content:v21 delegate:v61];
              [(PKApplyCollectionViewSectionController *)v30 setDynamicCollectionDelegate:v61];
              id v3 = v56;
              [v56 addObject:v30];
            }
            else
            {
              v31 = [PKApplyRequiredFieldSectionController alloc];
              v32 = [(PKApplyCollectionViewController *)v61 controller];
              v33 = [(PKApplyCollectionViewController *)v61 page];
              id v18 = [(PKApplyRequiredFieldSectionController *)v31 initWithController:v32 applyPage:v33 field:v15];

              [(PKApplyCollectionViewSectionController *)v18 setDynamicCollectionDelegate:v61];
              [v3 safelyAddObject:v18];
              id v5 = v57;
            }
            uint64_t v12 = v58;
          }
          uint64_t v13 = v59;
          goto LABEL_35;
        }
LABEL_36:
        ++v14;
      }
      while (v14 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v67 objects:v72 count:16];
    }
    while (v12);
  }

  v41 = [v3 firstObject];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v43 = [v3 firstObject];
    [v43 setIsTopmostSection:1];
  }
  if (v61->_useInlinePrimaryButton == 1)
  {
    v44 = [v57 primaryActionTitle];
    uint64_t v45 = [v44 length];

    if (v45)
    {
      v46 = [(PKApplyCollectionViewSectionController *)[PKApplyPrimaryActionSectionController alloc] initWithController:v10 applyPage:v57];
      [(PKApplyCollectionViewSectionController *)v46 setDynamicCollectionDelegate:v61];
      [(PKApplyPrimaryActionSectionController *)v46 setPrimaryButtonLoading:v61->_primaryButtonLoading];
      [v3 addObject:v46];
    }
  }
  v47 = [(PKDynamicCollectionViewController *)v61 collectionView];
  [v47 contentSize];
  double v49 = v48;
  [v47 frame];
  double v51 = v50;
  [v47 contentInset];
  if (v49 > v51 - v52)
  {
    [v47 safeAreaInsets];
    objc_msgSend(v47, "setScrollIndicatorInsets:");
    [v47 setShowsVerticalScrollIndicator:1];
    [v47 flashScrollIndicators];
  }
  v53 = (void *)[v3 copy];

  return v53;
}

- (BOOL)_determineNextEnablementWithPage:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v4 = objc_msgSend(v3, "fieldModel", 0);
  id v5 = [v4 visiblePaymentSetupFields];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v6)
  {
    BOOL v20 = 1;
    goto LABEL_27;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v23;
  do
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v23 != v8) {
        objc_enumerationMutation(v5);
      }
      v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
      if ([v10 fieldType] == 5)
      {
        uint64_t v11 = [v10 pickerFieldObject];
        uint64_t v12 = [v11 currentValue];
        if (([v11 isOptional] & 1) == 0 && !v12) {
          goto LABEL_24;
        }
        uint64_t v13 = [v12 nextLevelPicker];

        if (v13)
        {
          while (1)
          {
            uint64_t v14 = v12;
            uint64_t v12 = [v13 currentValue];

            if (([v13 isOptional] & 1) == 0 && !v12) {
              break;
            }
            uint64_t v15 = [v12 nextLevelPicker];

            uint64_t v13 = (void *)v15;
            if (!v15) {
              goto LABEL_16;
            }
          }
          uint64_t v11 = v13;
LABEL_24:

LABEL_25:
          BOOL v20 = 0;
          goto LABEL_27;
        }
LABEL_16:

        goto LABEL_17;
      }
      if ([v10 isOptional]) {
        goto LABEL_17;
      }
      uint64_t v12 = [v10 currentValue];
      if (v12) {
        goto LABEL_16;
      }
      uint64_t v16 = [v3 fieldModel];
      int v17 = [v10 identifier];
      char v18 = [v16 requirementsMetForFieldWithIdentifier:v17];

      if (v18) {
        goto LABEL_25;
      }
LABEL_17:
      ++v9;
    }
    while (v9 != v7);
    uint64_t v19 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    uint64_t v7 = v19;
    BOOL v20 = 1;
  }
  while (v19);
LABEL_27:

  return v20;
}

- (void)reloadDataAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PKApplyFieldsCollectionViewController;
  -[PKDynamicCollectionViewController reloadDataAnimated:](&v6, sel_reloadDataAnimated_);
  id v5 = [(PKApplyFieldsCollectionViewController *)self _recomputeSections];
  [(PKPaymentSetupOptionsViewController *)self setSections:v5 animated:v3];
}

- (void)recomputeSectionsWithReload:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PKApplyFieldsCollectionViewController *)self _recomputeSections];
  if (v3)
  {
    objc_super v6 = v5;
    [(PKPaymentSetupOptionsViewController *)self setSections:v5 animated:1];
    id v5 = v6;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKApplyFieldsCollectionViewController;
  [(PKPaymentSetupOptionsViewController *)&v6 viewWillAppear:a3];
  uint64_t v4 = [(PKApplyFieldsCollectionViewController *)self view];
  [v4 setNeedsLayout];

  id v5 = [(PKApplyFieldsCollectionViewController *)self view];
  [v5 layoutIfNeeded];

  [(PKApplyFieldsCollectionViewController *)self _updatePrimaryButton];
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v6 = [(PKApplyFieldsCollectionViewController *)self navigationController];
  [v6 pushViewController:v5 animated:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKApplyFieldsCollectionViewController;
  [(PKApplyCollectionViewController *)&v6 viewDidAppear:a3];
  uint64_t v4 = [(PKDynamicCollectionViewController *)self collectionView];
  id v5 = v4;
  if (self->_needsToReachEndOfPage && self->_useInlinePrimaryButton == 1) {
    [v4 flashScrollIndicators];
  }
}

- (void)_updatePrimaryButton
{
  BOOL v3 = [(PKDynamicCollectionViewController *)self collectionView];
  if (self->_needsToReachEndOfPage)
  {
    id v15 = v3;
    [v3 contentSize];
    BOOL v3 = v15;
    if (v4 != 0.0)
    {
      [v15 frame];
      double v6 = v5;
      [v15 adjustedContentInset];
      double v8 = v7;
      [v15 adjustedContentInset];
      double v10 = v9;
      [v15 contentOffset];
      double v12 = v11;
      [v15 contentSize];
      if (self->_useInlinePrimaryButton || v13 - (v6 - v8 - v10) - v12 <= 24.0)
      {
        self->_useInlinePrimaryButton = 2;
      }
      else
      {
        [(PKPaymentSetupOptionsViewController *)self removeSetupDockView];
        self->_useInlinePrimaryButton = 1;
        uint64_t v14 = [(PKApplyFieldsCollectionViewController *)self _recomputeSections];
        [(PKPaymentSetupOptionsViewController *)self setSections:v14 animated:0];

        [v15 setShowsVerticalScrollIndicator:1];
      }
      BOOL v3 = v15;
    }
  }
}

- (void)handleNextStep
{
  [(PKPaymentSetupOptionsViewController *)self setShowNavigationBarSpinner:1];

  [(PKApplyFieldsCollectionViewController *)self verifyAndSubmitFields];
}

- (void)showButtonSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  self->_primaryButtonLoading = a3;
  if (self->_useInlinePrimaryButton == 2)
  {
    double v5 = [(PKPaymentSetupOptionsViewController *)self dockView];
    id v6 = [v5 primaryButton];

    [v6 setShowSpinner:v3];
    [v6 setEnabled:v3 ^ 1];
  }
  else
  {
    if (a3) {
      return;
    }
    id v6 = [(PKApplyFieldsCollectionViewController *)self _recomputeSections];
    -[PKPaymentSetupOptionsViewController setSections:animated:](self, "setSections:animated:");
  }
}

- (void)primaryButtonTapped
{
  [(PKApplyFieldsCollectionViewController *)self showButtonSpinner:1];

  [(PKApplyFieldsCollectionViewController *)self verifyAndSubmitFields];
}

- (void)verifyAndSubmitFields
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v21 = [(PKApplyCollectionViewController *)self currentPage];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v2 = [v21 fieldModel];
  id obj = [v2 visiblePaymentSetupFields];

  uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (!v3)
  {

LABEL_17:
    [(PKApplyFieldsCollectionViewController *)self submitFields];
    goto LABEL_18;
  }
  char v4 = 0;
  uint64_t v24 = *(void *)v31;
LABEL_3:
  uint64_t v5 = 0;
  while (1)
  {
    if (*(void *)v31 != v24) {
      objc_enumerationMutation(obj);
    }
    id v6 = *(void **)(*((void *)&v30 + 1) + 8 * v5);
    if ([v6 isFieldTypePicker])
    {
      double v7 = [v6 pickerFieldObject];
      double v8 = [v7 currentValue];
      double v9 = [v8 submissionConfirmationTitle];
      double v10 = [v8 submissionConfirmationDescription];
      if (![v9 length]) {
        goto LABEL_10;
      }
      if ([v10 length])
      {
        objc_initWeak(&location, self);
        double v11 = (void *)MEMORY[0x1E4FB1410];
        double v12 = [(PKApplyCollectionViewController *)self controller];
        [v12 featureIdentifier];
        double v13 = PKLocalizedFeatureString();
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __62__PKApplyFieldsCollectionViewController_verifyAndSubmitFields__block_invoke;
        v27[3] = &unk_1E59CCFF0;
        objc_copyWeak(&v28, &location);
        uint64_t v14 = [v11 actionWithTitle:v13 style:1 handler:v27];

        id v15 = (void *)MEMORY[0x1E4FB1410];
        uint64_t v16 = [(PKApplyCollectionViewController *)self controller];
        [v16 featureIdentifier];
        int v17 = PKLocalizedFeatureString();
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __62__PKApplyFieldsCollectionViewController_verifyAndSubmitFields__block_invoke_2;
        v25[3] = &unk_1E59CCFF0;
        objc_copyWeak(&v26, &location);
        char v18 = [v15 actionWithTitle:v17 style:0 handler:v25];

        uint64_t v19 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
        [v19 addAction:v14];
        [v19 addAction:v18];
        [v19 setPreferredAction:v18];
        [(PKApplyFieldsCollectionViewController *)self presentViewController:v19 animated:1 completion:0];

        objc_destroyWeak(&v26);
        objc_destroyWeak(&v28);
        objc_destroyWeak(&location);
        int v20 = 0;
        char v4 = 1;
      }
      else
      {
LABEL_10:
        int v20 = 1;
      }

      if (!v20) {
        break;
      }
    }
    if (v3 == ++v5)
    {
      uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v3) {
        goto LABEL_3;
      }
      break;
    }
  }

  if ((v4 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_18:
}

void __62__PKApplyFieldsCollectionViewController_verifyAndSubmitFields__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained showButtonSpinner:0];
    [v2 setShowNavigationBarSpinner:0];
    id WeakRetained = v2;
  }
}

void __62__PKApplyFieldsCollectionViewController_verifyAndSubmitFields__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained submitFields];
    id WeakRetained = v2;
  }
}

- (void)submitFields
{
  uint64_t v3 = [(PKApplyCollectionViewController *)self controller];
  char v4 = [(PKApplyCollectionViewController *)self currentPage];
  if ([v3 featureIdentifier] == 5
    && (([v4 identifier],
         uint64_t v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(),
         v5 == @"taxWithholding")
     || (id v6 = v5) != 0
     && (int v7 = [(__CFString *)v5 isEqualToString:@"taxWithholding"],
         v6,
         v6,
         v7)))
  {
    double v8 = [PKApplyTermsVerifyingViewController alloc];
    double v9 = [(PKApplyCollectionViewController *)self setupDelegate];
    int64_t v10 = [(PKPaymentSetupOptionsViewController *)self context];
    id v11 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    double v12 = [(PKApplyCollectionViewController *)self controller];
    double v13 = [v12 featureApplication];
    uint64_t v14 = [v13 applicationTermsIdentifier];
    id v15 = objc_msgSend(v11, "initWithObjects:", v14, 0);
    uint64_t v16 = [(PKApplyTermsVerifyingViewController *)v8 initWithController:v3 setupDelegate:v9 context:v10 termsIdentifiers:v15 applyPage:v4];

    int v17 = [(PKApplyFieldsCollectionViewController *)self navigationController];
    [v17 pushViewController:v16 animated:1];
  }
  else
  {
    objc_initWeak(&location, self);
    char v18 = [(PKApplyCollectionViewController *)self controller];
    uint64_t v19 = [(PKApplyCollectionViewController *)self currentPage];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __53__PKApplyFieldsCollectionViewController_submitFields__block_invoke;
    v20[3] = &unk_1E59CB9C8;
    objc_copyWeak(&v21, &location);
    [v18 submitFieldsPage:v19 completion:v20];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __53__PKApplyFieldsCollectionViewController_submitFields__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PKApplyFieldsCollectionViewController_submitFields__block_invoke_2;
  block[3] = &unk_1E59CB378;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __53__PKApplyFieldsCollectionViewController_submitFields__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (*(_OWORD *)(a1 + 32) == 0)
    {
      WeakRetained[1353] = 1;
      [WeakRetained _terminateFlow];
    }
    else
    {
      objc_msgSend(WeakRetained, "handleNextViewController:displayableError:");
      [v3 showButtonSpinner:0];
      [v3 setShowNavigationBarSpinner:0];
    }
    id WeakRetained = v3;
  }
}

- (void)_terminateFlow
{
  id v3 = [(PKApplyCollectionViewController *)self setupDelegate];
  id v5 = v3;
  if (v3)
  {
    [v3 viewControllerDidTerminateSetupFlow:self];
  }
  else
  {
    char v4 = [(PKApplyFieldsCollectionViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_keyboardWillShow:(id)a3
{
}

- (void)_keyboardWillHide:(id)a3
{
}

- (BOOL)hasFieldsSubmitted
{
  return self->_hasFieldsSubmitted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerSectionController, 0);

  objc_storeStrong((id *)&self->_inlineFooterSectionController, 0);
}

@end