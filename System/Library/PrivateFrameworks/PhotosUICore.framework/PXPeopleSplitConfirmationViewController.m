@interface PXPeopleSplitConfirmationViewController
- (NSArray)commonConstraints;
- (NSArray)landscapeConstraints;
- (NSArray)portraitConstraints;
- (NSLayoutConstraint)controlGuideHeightConstraint;
- (NSLayoutConstraint)denyButtonBottomConstraint;
- (PXPeopleSplitConfirmationViewController)initWithPerson:(id)a3;
- (PXPerson)person;
- (UIBarButtonItem)undoButton;
- (UIButton)confirmButton;
- (UIButton)denyButton;
- (UILayoutGuide)controlLayoutGuide;
- (id)_buttonWithTitle:(id)a3 action:(SEL)a4 andColor:(id)a5;
- (void)_disableActionButtonsWithSelectedButton:(id)a3;
- (void)_enableActionButtons;
- (void)_updateUndoButton;
- (void)confirmTapped:(id)a3;
- (void)contentSizeCategoryDidChangeNotification:(id)a3;
- (void)dealloc;
- (void)denyTapped:(id)a3;
- (void)noMoreSuggestionsAvailableForSuggestionManager:(id)a3;
- (void)setCommonConstraints:(id)a3;
- (void)setConfirmButton:(id)a3;
- (void)setControlGuideHeightConstraint:(id)a3;
- (void)setControlLayoutGuide:(id)a3;
- (void)setDenyButton:(id)a3;
- (void)setLandscapeConstraints:(id)a3;
- (void)setPortraitConstraints:(id)a3;
- (void)setUndoButton:(id)a3;
- (void)suggestionDidDisplay;
- (void)suggestionManager:(id)a3 hasNewSuggestionsAvailable:(id)a4;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
- (void)undoButtonTapped:(id)a3;
- (void)updateViewConstraints;
- (void)updateViewWithViewState:(unint64_t)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PXPeopleSplitConfirmationViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_commonConstraints, 0);
  objc_storeStrong((id *)&self->_landscapeConstraints, 0);
  objc_storeStrong((id *)&self->_portraitConstraints, 0);
  objc_storeStrong((id *)&self->_denyButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_controlGuideHeightConstraint, 0);
  objc_storeStrong((id *)&self->_controlLayoutGuide, 0);
  objc_storeStrong((id *)&self->_undoButton, 0);
  objc_storeStrong((id *)&self->_denyButton, 0);
  objc_storeStrong((id *)&self->_confirmButton, 0);
}

- (PXPerson)person
{
  return self->_person;
}

- (void)setCommonConstraints:(id)a3
{
}

- (void)setLandscapeConstraints:(id)a3
{
}

- (void)setPortraitConstraints:(id)a3
{
}

- (NSLayoutConstraint)denyButtonBottomConstraint
{
  return self->_denyButtonBottomConstraint;
}

- (void)setControlGuideHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)controlGuideHeightConstraint
{
  return self->_controlGuideHeightConstraint;
}

- (void)setControlLayoutGuide:(id)a3
{
}

- (UILayoutGuide)controlLayoutGuide
{
  return self->_controlLayoutGuide;
}

- (void)setUndoButton:(id)a3
{
}

- (UIBarButtonItem)undoButton
{
  return self->_undoButton;
}

- (void)setDenyButton:(id)a3
{
}

- (UIButton)denyButton
{
  return self->_denyButton;
}

- (void)setConfirmButton:(id)a3
{
}

- (UIButton)confirmButton
{
  return self->_confirmButton;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PXPeopleSplitConfirmationViewController;
  id v7 = a4;
  -[PXPeopleSplitConfirmationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__PXPeopleSplitConfirmationViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5DD2A68;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __94__PXPeopleSplitConfirmationViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setNeedsUpdateConstraints];
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    [v6 displayScale];
    double v9 = v8;
  }
  else
  {
    v10 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v10 scale];
    double v9 = v11;
  }
  v12 = [(PXPeopleSplitConfirmationViewController *)self traitCollection];
  [v12 displayScale];
  double v14 = v13;

  if (v14 != v9)
  {
    v15 = [(PXPeopleSplitConfirmationViewController *)self view];
    [v15 setNeedsUpdateConstraints];
  }
}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  id v3 = [(PXPeopleSplitConfirmationViewController *)self view];
  [v3 setNeedsUpdateConstraints];
}

- (void)noMoreSuggestionsAvailableForSuggestionManager:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PXPeopleSplitConfirmationViewController;
  [(PXPeopleConfirmationViewController *)&v5 noMoreSuggestionsAvailableForSuggestionManager:a3];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __90__PXPeopleSplitConfirmationViewController_noMoreSuggestionsAvailableForSuggestionManager___block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __90__PXPeopleSplitConfirmationViewController_noMoreSuggestionsAvailableForSuggestionManager___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateUndoButton];
}

- (void)suggestionManager:(id)a3 hasNewSuggestionsAvailable:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)PXPeopleSplitConfirmationViewController;
  [(PXPeopleConfirmationViewController *)&v6 suggestionManager:a3 hasNewSuggestionsAvailable:a4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__PXPeopleSplitConfirmationViewController_suggestionManager_hasNewSuggestionsAvailable___block_invoke;
  block[3] = &unk_1E5DD36F8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __88__PXPeopleSplitConfirmationViewController_suggestionManager_hasNewSuggestionsAvailable___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateUndoButton];
}

- (void)_updateUndoButton
{
  id v3 = [(PXPeopleConfirmationViewController *)self suggestionManager];
  int v4 = [v3 canUndo];

  id v6 = [(PXPeopleSplitConfirmationViewController *)self navigationItem];
  if (v4)
  {
    objc_super v5 = [(PXPeopleSplitConfirmationViewController *)self undoButton];
    [v6 setLeftBarButtonItem:v5];
  }
  else
  {
    [v6 setLeftBarButtonItem:0];
  }
}

- (void)_disableActionButtonsWithSelectedButton:(id)a3
{
  id v8 = a3;
  int v4 = [(PXPeopleSplitConfirmationViewController *)self confirmButton];
  objc_super v5 = [(PXPeopleSplitConfirmationViewController *)self denyButton];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [v8 titleColorForState:1];
    id v7 = [v8 backgroundImageForState:1];
    [v8 setTitleColor:v6 forState:2];
    [v8 setBackgroundImage:v7 forState:2];
  }
  [v4 setEnabled:0];
  [v5 setEnabled:0];
}

- (void)_enableActionButtons
{
  id v6 = [(PXPeopleSplitConfirmationViewController *)self confirmButton];
  id v3 = [(PXPeopleSplitConfirmationViewController *)self denyButton];
  [v6 setEnabled:1];
  [v3 setEnabled:1];
  [v6 setBackgroundImage:0 forState:2];
  [v3 setBackgroundImage:0 forState:2];
  int v4 = [v6 titleColorForState:0];
  [v6 setTitleColor:v4 forState:2];
  objc_super v5 = [v3 titleColorForState:0];
  [v3 setTitleColor:v5 forState:2];
}

- (id)_buttonWithTitle:(id)a3 action:(SEL)a4 andColor:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4FB14D0];
  id v9 = a5;
  id v10 = a3;
  double v11 = [v8 buttonWithType:1];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 setTitle:v10 forState:0];

  [v11 setTitleColor:v9 forState:0];
  v12 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  [v11 setBackgroundColor:v12];

  double v13 = [v11 layer];
  [v13 setCornerRadius:15.0];

  double v14 = [v11 titleLabel];
  v15 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2908]];
  [v14 setFont:v15];

  [v14 setAdjustsFontForContentSizeCategory:1];
  [v11 setClipsToBounds:1];
  [v11 addTarget:self action:a4 forControlEvents:64];

  return v11;
}

- (void)undoButtonTapped:(id)a3
{
  [(PXPeopleSplitConfirmationViewController *)self _disableActionButtonsWithSelectedButton:a3];
  id v4 = [(PXPeopleSplitConfirmationViewController *)self undoManager];
  if ([v4 canUndo]) {
    [v4 undo];
  }
}

- (void)denyTapped:(id)a3
{
  id v4 = a3;
  [(PXPeopleSplitConfirmationViewController *)self _disableActionButtonsWithSelectedButton:v4];
  v8.receiver = self;
  v8.super_class = (Class)PXPeopleSplitConfirmationViewController;
  [(PXPeopleConfirmationViewController *)&v8 denyTapped:v4];

  objc_super v5 = (void *)MEMORY[0x1E4FB1EB0];
  id v6 = [(PXPeopleSplitConfirmationViewController *)self denyButton];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__PXPeopleSplitConfirmationViewController_denyTapped___block_invoke;
  v7[3] = &unk_1E5DD36F8;
  v7[4] = self;
  [v5 transitionWithView:v6 duration:5242880 options:v7 animations:0 completion:0.33];
}

void __54__PXPeopleSplitConfirmationViewController_denyTapped___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) denyButton];
  [v1 setHighlighted:1];
}

- (void)confirmTapped:(id)a3
{
  id v4 = a3;
  [(PXPeopleSplitConfirmationViewController *)self _disableActionButtonsWithSelectedButton:v4];
  v8.receiver = self;
  v8.super_class = (Class)PXPeopleSplitConfirmationViewController;
  [(PXPeopleConfirmationViewController *)&v8 confirmTapped:v4];

  objc_super v5 = (void *)MEMORY[0x1E4FB1EB0];
  id v6 = [(PXPeopleSplitConfirmationViewController *)self confirmButton];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PXPeopleSplitConfirmationViewController_confirmTapped___block_invoke;
  v7[3] = &unk_1E5DD36F8;
  v7[4] = self;
  [v5 transitionWithView:v6 duration:5242880 options:v7 animations:0 completion:0.33];
}

void __57__PXPeopleSplitConfirmationViewController_confirmTapped___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) confirmButton];
  [v1 setHighlighted:1];
}

- (void)suggestionDidDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)PXPeopleSplitConfirmationViewController;
  [(PXPeopleConfirmationViewController *)&v3 suggestionDidDisplay];
  [(PXPeopleSplitConfirmationViewController *)self _enableActionButtons];
}

- (void)updateViewWithViewState:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PXPeopleSplitConfirmationViewController;
  -[PXPeopleConfirmationViewController updateViewWithViewState:](&v10, sel_updateViewWithViewState_);
  uint64_t v5 = (a3 < 6) & (0x2Cu >> a3);
  id v6 = [(PXPeopleConfirmationViewController *)self descriptionLabel];
  [v6 setHidden:v5];

  id v7 = [(PXPeopleSplitConfirmationViewController *)self confirmButton];
  [v7 setHidden:v5];

  objc_super v8 = [(PXPeopleSplitConfirmationViewController *)self denyButton];
  [v8 setHidden:v5];

  id v9 = [(PXPeopleConfirmationViewController *)self countView];
  [v9 setHidden:v5];
}

- (NSArray)commonConstraints
{
  v74[17] = *MEMORY[0x1E4F143B8];
  commonConstraints = self->_commonConstraints;
  if (!commonConstraints)
  {
    id v4 = [(PXPeopleSplitConfirmationViewController *)self confirmButton];
    uint64_t v5 = [(PXPeopleSplitConfirmationViewController *)self denyButton];
    v72 = [(PXPeopleConfirmationViewController *)self suggestionView];
    id v6 = [(PXPeopleConfirmationViewController *)self descriptionLabel];
    id v7 = [(PXPeopleConfirmationViewController *)self countView];
    objc_super v8 = [(PXPeopleSplitConfirmationViewController *)self view];
    id v9 = [v8 safeAreaLayoutGuide];

    objc_super v10 = [(PXPeopleSplitConfirmationViewController *)self controlLayoutGuide];
    double v11 = [v5 bottomAnchor];
    v12 = [v10 bottomAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12];

    denyButtonBottomConstraint = self->_denyButtonBottomConstraint;
    self->_denyButtonBottomConstraint = v13;
    v15 = v13;

    v71 = [v6 topAnchor];
    v70 = [v10 topAnchor];
    v69 = [v71 constraintEqualToAnchor:v70 constant:15.0];
    v74[0] = v69;
    v68 = [v7 topAnchor];
    v67 = [v6 bottomAnchor];
    v66 = [v68 constraintEqualToAnchor:v67 constant:5.0];
    v74[1] = v66;
    v65 = [v4 heightAnchor];
    v64 = [v65 constraintEqualToConstant:50.0];
    v74[2] = v64;
    v63 = [v5 heightAnchor];
    v62 = [v4 heightAnchor];
    v61 = [v63 constraintEqualToAnchor:v62];
    v74[3] = v61;
    v73 = v5;
    v59 = [v5 widthAnchor];
    v58 = [v4 widthAnchor];
    v57 = [v59 constraintEqualToAnchor:v58];
    v74[4] = v57;
    v60 = v6;
    v55 = [v6 widthAnchor];
    v54 = [v10 widthAnchor];
    v53 = [v55 constraintEqualToAnchor:v54];
    v74[5] = v53;
    v56 = v7;
    v52 = [v7 widthAnchor];
    v51 = [v10 widthAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v74[6] = v50;
    v49 = [v5 centerXAnchor];
    v48 = [v4 centerXAnchor];
    v46 = [v49 constraintEqualToAnchor:v48];
    v74[7] = v46;
    v44 = [v6 centerXAnchor];
    v42 = [v4 centerXAnchor];
    v41 = [v44 constraintEqualToAnchor:v42];
    v74[8] = v41;
    v40 = [v7 centerXAnchor];
    v39 = [v4 centerXAnchor];
    v38 = [v40 constraintEqualToAnchor:v39];
    v74[9] = v38;
    v37 = [v72 topAnchor];
    v36 = [v9 topAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v74[10] = v35;
    v34 = [v72 leadingAnchor];
    v33 = [v9 leadingAnchor];
    v32 = [v34 constraintEqualToAnchor:v33];
    v74[11] = v32;
    v31 = [v10 trailingAnchor];
    v47 = v9;
    v30 = [v9 trailingAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v74[12] = v29;
    v43 = v10;
    v28 = [v10 bottomAnchor];
    id v16 = [v9 bottomAnchor];
    v17 = [v28 constraintEqualToAnchor:v16];
    v74[13] = v17;
    v18 = v4;
    v45 = v4;
    v19 = [v4 centerXAnchor];
    v20 = [v10 centerXAnchor];
    v21 = [v19 constraintEqualToAnchor:v20];
    v74[14] = v21;
    v22 = [v18 bottomAnchor];
    v23 = [v73 topAnchor];
    v24 = [v22 constraintEqualToAnchor:v23 constant:-5.0];
    v74[15] = v24;
    v74[16] = v15;
    v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:17];
    v26 = self->_commonConstraints;
    self->_commonConstraints = v25;

    commonConstraints = self->_commonConstraints;
  }
  return commonConstraints;
}

- (NSArray)landscapeConstraints
{
  v36[6] = *MEMORY[0x1E4F143B8];
  landscapeConstraints = self->_landscapeConstraints;
  if (!landscapeConstraints)
  {
    id v4 = [(PXPeopleSplitConfirmationViewController *)self confirmButton];
    uint64_t v5 = [(PXPeopleConfirmationViewController *)self suggestionView];
    id v6 = [(PXPeopleSplitConfirmationViewController *)self controlLayoutGuide];
    id v7 = [(PXPeopleSplitConfirmationViewController *)self view];
    objc_super v8 = [v7 safeAreaLayoutGuide];

    v35 = [v6 topAnchor];
    id v9 = v8;
    v34 = [v8 topAnchor];
    v33 = [v35 constraintEqualToAnchor:v34];
    v36[0] = v33;
    v32 = [v6 leadingAnchor];
    v28 = v5;
    v31 = [v5 trailingAnchor];
    v29 = [v32 constraintEqualToAnchor:v31];
    v36[1] = v29;
    v27 = [v4 leadingAnchor];
    v30 = v6;
    v25 = [v6 leadingAnchor];
    v24 = [v27 constraintEqualToAnchor:v25 constant:42.0];
    v36[2] = v24;
    v26 = v4;
    v22 = [v4 trailingAnchor];
    objc_super v10 = [v6 trailingAnchor];
    double v11 = [v22 constraintEqualToAnchor:v10 constant:-42.0];
    v36[3] = v11;
    v12 = [v5 bottomAnchor];
    double v13 = v9;
    v23 = v9;
    double v14 = [v9 bottomAnchor];
    v15 = [v12 constraintEqualToAnchor:v14];
    v36[4] = v15;
    id v16 = [v4 widthAnchor];
    v17 = [v13 widthAnchor];
    v18 = [v16 constraintEqualToAnchor:v17 multiplier:0.33];
    v36[5] = v18;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:6];
    v20 = self->_landscapeConstraints;
    self->_landscapeConstraints = v19;

    landscapeConstraints = self->_landscapeConstraints;
  }
  return landscapeConstraints;
}

- (NSArray)portraitConstraints
{
  v34[7] = *MEMORY[0x1E4F143B8];
  portraitConstraints = self->_portraitConstraints;
  if (!portraitConstraints)
  {
    id v4 = [(PXPeopleConfirmationViewController *)self suggestionView];
    uint64_t v5 = [(PXPeopleSplitConfirmationViewController *)self controlLayoutGuide];
    v23 = [(PXPeopleSplitConfirmationViewController *)self confirmButton];
    id v6 = [(PXPeopleSplitConfirmationViewController *)self view];
    id v7 = [v6 safeAreaLayoutGuide];

    [(PXPeopleSplitConfirmationViewController *)self controlGuideHeightConstraint];
    v33 = v32 = v5;
    v31 = [v5 topAnchor];
    v30 = [v4 bottomAnchor];
    v29 = [v31 constraintEqualToAnchor:v30];
    v34[0] = v29;
    v28 = [v5 leadingAnchor];
    v27 = [v7 leadingAnchor];
    v26 = [v28 constraintEqualToAnchor:v27];
    v34[1] = v26;
    v25 = [v4 trailingAnchor];
    objc_super v8 = v7;
    v21 = v7;
    v24 = [v7 trailingAnchor];
    v22 = [v25 constraintEqualToAnchor:v24];
    v34[2] = v22;
    v20 = [v4 heightAnchor];
    v19 = [v4 widthAnchor];
    id v9 = [v20 constraintGreaterThanOrEqualToAnchor:v19 multiplier:0.5];
    v34[3] = v9;
    objc_super v10 = [v4 heightAnchor];
    double v11 = [v4 widthAnchor];
    v12 = [v10 constraintLessThanOrEqualToAnchor:v11];
    v34[4] = v12;
    double v13 = [v23 widthAnchor];
    double v14 = [v8 widthAnchor];
    v15 = [v13 constraintEqualToAnchor:v14 multiplier:0.8];
    v34[5] = v15;
    v34[6] = v33;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:7];
    v17 = self->_portraitConstraints;
    self->_portraitConstraints = v16;

    portraitConstraints = self->_portraitConstraints;
  }
  return portraitConstraints;
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB27A8] object:0];

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleSplitConfirmationViewController;
  [(PXPeopleSplitConfirmationViewController *)&v4 dealloc];
}

- (void)updateViewConstraints
{
  objc_super v3 = [(PXPeopleSplitConfirmationViewController *)self view];
  [v3 bounds];
  CGFloat x = v40.origin.x;
  CGFloat y = v40.origin.y;
  CGFloat width = v40.size.width;
  CGFloat height = v40.size.height;
  double v8 = CGRectGetWidth(v40);
  v41.origin.CGFloat x = x;
  v41.origin.CGFloat y = y;
  v41.size.CGFloat width = width;
  v41.size.CGFloat height = height;
  double v9 = CGRectGetHeight(v41);
  objc_super v10 = (void *)MEMORY[0x1E4F28DC8];
  if (v8 >= v9) {
    [(PXPeopleSplitConfirmationViewController *)self portraitConstraints];
  }
  else {
  double v11 = [(PXPeopleSplitConfirmationViewController *)self landscapeConstraints];
  }
  [v10 deactivateConstraints:v11];

  v12 = [(PXPeopleSplitConfirmationViewController *)self traitCollection];
  uint64_t v13 = [v12 horizontalSizeClass];
  uint64_t v14 = [v12 verticalSizeClass];
  v15 = [(PXPeopleConfirmationViewController *)self descriptionLabel];
  id v16 = [v15 font];

  v17 = [(PXPeopleSplitConfirmationViewController *)self confirmButton];
  v18 = [v17 titleLabel];
  v19 = [v18 font];

  v20 = [(PXPeopleSplitConfirmationViewController *)self denyButton];
  v21 = [v20 titleLabel];
  v22 = [v21 font];

  if (v8 < v9 && v13 == 1)
  {
    double v23 = 40.0;
    double v24 = 66.0;
    double v25 = 66.0;
  }
  else
  {
    BOOL v26 = v8 < v9;
    if (v14 != 1) {
      BOOL v26 = 1;
    }
    if (v8 >= v9) {
      double v24 = dbl_1AB35A1B0[v14 != 1];
    }
    else {
      double v24 = 74.0;
    }
    if (v26) {
      double v25 = 71.0;
    }
    else {
      double v25 = 86.0;
    }
    double v23 = 81.0;
  }
  [v16 _scaledValueForValue:v23];
  double v28 = v27;
  [v19 _scaledValueForValue:v24];
  double v30 = v29;
  [v22 _scaledValueForValue:v25];
  double v32 = v28 + v30 + v31 * 2.0;
  v33 = [(PXPeopleSplitConfirmationViewController *)self controlGuideHeightConstraint];
  [v33 setConstant:v32];

  [v3 safeAreaInsets];
  if (v34 == 0.0) {
    double v35 = -15.0;
  }
  else {
    double v35 = 0.0;
  }
  v36 = [(PXPeopleSplitConfirmationViewController *)self denyButtonBottomConstraint];
  [v36 setConstant:v35];

  v37 = (void *)MEMORY[0x1E4F28DC8];
  if (v8 >= v9) {
    [(PXPeopleSplitConfirmationViewController *)self landscapeConstraints];
  }
  else {
  v38 = [(PXPeopleSplitConfirmationViewController *)self portraitConstraints];
  }
  [v37 activateConstraints:v38];

  v39.receiver = self;
  v39.super_class = (Class)PXPeopleSplitConfirmationViewController;
  [(PXPeopleSplitConfirmationViewController *)&v39 updateViewConstraints];
}

- (void)viewDidLoad
{
  v38.receiver = self;
  v38.super_class = (Class)PXPeopleSplitConfirmationViewController;
  [(PXPeopleConfirmationViewController *)&v38 viewDidLoad];
  objc_super v3 = [(PXPeopleSplitConfirmationViewController *)self view];
  objc_super v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  uint64_t v5 = [objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_doneTapped_];
  id v6 = [(PXPeopleSplitConfirmationViewController *)self navigationItem];
  v37 = (void *)v5;
  [v6 setRightBarButtonItem:v5];

  v36 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:21 target:self action:sel_undoButtonTapped_];
  -[PXPeopleSplitConfirmationViewController setUndoButton:](self, "setUndoButton:");
  id v7 = objc_alloc_init(MEMORY[0x1E4FB1940]);
  [v3 addLayoutGuide:v7];
  double v8 = v7;
  [(PXPeopleSplitConfirmationViewController *)self setControlLayoutGuide:v7];
  double v9 = [(PXPeopleConfirmationViewController *)self descriptionLabel];
  [v9 setAdjustsFontForContentSizeCategory:1];
  [v9 setHidden:1];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v10 = *MEMORY[0x1E4FB2990];
  double v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2990]];
  uint64_t v12 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v10 addingSymbolicTraits:2 options:0];
  uint64_t v13 = (void *)MEMORY[0x1E4FB08E0];
  [v11 pointSize];
  double v35 = (void *)v12;
  uint64_t v14 = objc_msgSend(v13, "fontWithDescriptor:size:", v12);

  double v34 = (void *)v14;
  [v9 setFont:v14];
  [v3 addSubview:v9];
  v15 = -[PXAnimatedCountView initWithFrame:]([PXAnimatedCountView alloc], "initWithFrame:", 0.0, 0.0, 200.0, 44.0);
  [(PXAnimatedCountView *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PXPeopleConfirmationViewController *)self setCountView:v15];
  v33 = v15;
  [v3 addSubview:v15];
  id v16 = [(PXPeopleSplitConfirmationViewController *)self person];
  v17 = objc_msgSend(v16, "px_localizedName");
  double v32 = v17;
  if ([v17 length])
  {
    v18 = PXLocalizedStringForPersonOrPetAndVisibility(v16, 0, @"PXPeopleConfirmButtonThisIsPerson");
    uint64_t v19 = PXStringWithValidatedFormat();

    v20 = PXLocalizedStringForPersonOrPetAndVisibility(v16, 0, @"PXPeopleDenyButtonNotThisPerson");
    double v30 = v17;
    v21 = PXStringWithValidatedFormat();
  }
  else
  {
    uint64_t v19 = PXLocalizedStringForPersonOrPetAndVisibility(v16, 0, @"PXPeopleConfirmButtonUnnamed");
    v21 = PXLocalizedStringForPersonOrPetAndVisibility(v16, 0, @"PXPeopleDenyButtonUnnamed");
  }
  double v31 = (void *)v19;
  v22 = objc_msgSend(v3, "tintColor", v30);
  double v23 = [(PXPeopleSplitConfirmationViewController *)self _buttonWithTitle:v19 action:sel_confirmTapped_ andColor:v22];

  [v3 addSubview:v23];
  [(PXPeopleSplitConfirmationViewController *)self setConfirmButton:v23];
  [v23 setHidden:1];
  double v24 = [MEMORY[0x1E4FB1618] systemRedColor];
  double v25 = [(PXPeopleSplitConfirmationViewController *)self _buttonWithTitle:v21 action:sel_denyTapped_ andColor:v24];

  [v3 addSubview:v25];
  [(PXPeopleSplitConfirmationViewController *)self setDenyButton:v25];
  [v25 setHidden:1];
  BOOL v26 = [v8 heightAnchor];
  double v27 = [v26 constraintGreaterThanOrEqualToConstant:100.0];

  [(PXPeopleSplitConfirmationViewController *)self setControlGuideHeightConstraint:v27];
  double v28 = (void *)MEMORY[0x1E4F28DC8];
  double v29 = [(PXPeopleSplitConfirmationViewController *)self commonConstraints];
  [v28 activateConstraints:v29];
}

- (PXPeopleSplitConfirmationViewController)initWithPerson:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXPeopleSplitConfirmationViewController;
  id v6 = [(PXPeopleConfirmationViewController *)&v12 initWithPerson:v5];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_person, a3);
    double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel_contentSizeCategoryDidChangeNotification_ name:*MEMORY[0x1E4FB27A8] object:0];

    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    id v10 = (id)[(PXPeopleSplitConfirmationViewController *)v7 registerForTraitChanges:v9 withAction:sel_traitEnvironment_didChangeTraitCollection_];
  }
  return v7;
}

@end