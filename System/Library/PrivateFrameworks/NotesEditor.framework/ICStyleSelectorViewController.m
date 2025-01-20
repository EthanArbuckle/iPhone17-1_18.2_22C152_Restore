@interface ICStyleSelectorViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)configuredForLandscape;
- (BOOL)configuredForPopover;
- (BOOL)currentBIUSContainsStyle:(unint64_t)a3;
- (BOOL)currentNamedStylesContainsStyle:(unsigned int)a3;
- (BOOL)isPopover;
- (ICStyleSelectorDelegate)delegate;
- (NSArray)biusButtons;
- (NSArray)indentationButtons;
- (NSArray)listButtons;
- (NSArray)nonStyleButtons;
- (NSArray)styleButtons;
- (NSArray)styles;
- (NSIndexSet)currentStyles;
- (NSLayoutConstraint)biusContainerTopConstraint;
- (NSLayoutConstraint)biusContainerTopConstraintLandscape;
- (NSLayoutConstraint)boldButtonWidthConstraintLandscape;
- (NSLayoutConstraint)emphasisButtonWidthConstraint;
- (NSLayoutConstraint)emphasisColorPickerButtonWidthConstraint;
- (NSLayoutConstraint)emphasisContainerLeadingConstraint;
- (NSLayoutConstraint)emphasisContainerTrailingConstraint;
- (NSLayoutConstraint)listsContainerBottomConstraint;
- (NSLayoutConstraint)listsContainerLeadingConstraintLandscape;
- (NSLayoutConstraint)listsContainerTopConstraint;
- (NSLayoutConstraint)scrollViewHeightConstraint;
- (NSLayoutConstraint)scrollViewTopConstraint;
- (UIButton)blockQuoteButton;
- (UIButton)boldButton;
- (UIButton)bulletedListButton;
- (UIButton)closeButton;
- (UIButton)dashedListButton;
- (UIButton)emphasisButton;
- (UIButton)emphasisColorPickerButton;
- (UIButton)indentLeftButton;
- (UIButton)indentRightButton;
- (UIButton)italicButton;
- (UIButton)numberedListButton;
- (UIButton)strikethroughButton;
- (UIButton)underlineButton;
- (UILabel)headerLabel;
- (UINavigationBar)navigationBar;
- (UIScrollView)styleScrollView;
- (UIView)biusContainer;
- (UIView)blockQuoteContainer;
- (UIView)emphasisContainer;
- (UIView)headerView;
- (UIView)indentationContainer;
- (UIView)listsContainer;
- (UIView)styleSelectionHighlight;
- (double)preferredHeightForTraitCollection:(id)a3;
- (double)styleButtonPadding;
- (id)biusStyleActionWithStyleBIUS:(unint64_t)a3;
- (id)blockQuoteMenu;
- (id)elementForAXFocusOnDismissal;
- (id)emphasisColorActionWithType:(int64_t)a3 bordered:(BOOL)a4 selectionTogglesEmphasis:(BOOL)a5;
- (id)emphasisColorImageWithType:(int64_t)a3 bordered:(BOOL)a4;
- (id)emphasisMenu;
- (id)fontForICTTNamedStyle:(unsigned int)a3;
- (id)imageForButton:(id)a3;
- (id)imageNameForButton:(id)a3;
- (id)makeInlineMenu;
- (id)makeShortcutMenu;
- (id)namedStyleActionWithNamedStyle:(unsigned int)a3;
- (id)nibBundle;
- (id)styleButtonForStyle:(unsigned int)a3;
- (int64_t)menuElementStateWithSelected:(BOOL)a3;
- (unint64_t)currentBIUS;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)applyAccessibilityInfo;
- (void)applyFixedEmphasisColor:(id)a3;
- (void)configureForOrientation;
- (void)configureForPopover;
- (void)configureViewWithEmphasis;
- (void)dealloc;
- (void)didSelectBulletedList:(id)a3;
- (void)didSelectDashedList:(id)a3;
- (void)didSelectDone:(id)a3;
- (void)didSelectNumberedList:(id)a3;
- (void)indentLeft:(id)a3;
- (void)indentRight:(id)a3;
- (void)namedStyleButtonAction:(id)a3;
- (void)populateStyleScrollView;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)registerForTraitChanges;
- (void)scrollCurrentStyleToVisible:(BOOL)a3;
- (void)selectNamedStyle:(unsigned int)a3;
- (void)setBiusContainer:(id)a3;
- (void)setBiusContainerTopConstraint:(id)a3;
- (void)setBiusContainerTopConstraintLandscape:(id)a3;
- (void)setBlockQuoteButton:(id)a3;
- (void)setBlockQuoteContainer:(id)a3;
- (void)setBoldButton:(id)a3;
- (void)setBoldButtonWidthConstraintLandscape:(id)a3;
- (void)setBulletedListButton:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setConfiguredForLandscape:(BOOL)a3;
- (void)setConfiguredForPopover:(BOOL)a3;
- (void)setCurrentBIUS:(unint64_t)a3;
- (void)setCurrentStyles:(id)a3;
- (void)setCurrentStyles:(id)a3 bius:(unint64_t)a4 animated:(BOOL)a5;
- (void)setDashedListButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setElementForAXFocusOnDismissal:(id)a3;
- (void)setEmphasisButton:(id)a3;
- (void)setEmphasisButtonWidthConstraint:(id)a3;
- (void)setEmphasisColorPickerButton:(id)a3;
- (void)setEmphasisColorPickerButtonWidthConstraint:(id)a3;
- (void)setEmphasisContainer:(id)a3;
- (void)setEmphasisContainerLeadingConstraint:(id)a3;
- (void)setEmphasisContainerTrailingConstraint:(id)a3;
- (void)setHeaderLabel:(id)a3;
- (void)setHeaderView:(id)a3;
- (void)setIndentLeftButton:(id)a3;
- (void)setIndentRightButton:(id)a3;
- (void)setIndentationContainer:(id)a3;
- (void)setItalicButton:(id)a3;
- (void)setListsContainer:(id)a3;
- (void)setListsContainerBottomConstraint:(id)a3;
- (void)setListsContainerLeadingConstraintLandscape:(id)a3;
- (void)setListsContainerTopConstraint:(id)a3;
- (void)setNavigationBar:(id)a3;
- (void)setNumberedListButton:(id)a3;
- (void)setScrollViewHeightConstraint:(id)a3;
- (void)setScrollViewTopConstraint:(id)a3;
- (void)setStrikethroughButton:(id)a3;
- (void)setStyleButtons:(id)a3;
- (void)setStyleScrollView:(id)a3;
- (void)setStyleSelectionHighlight:(id)a3;
- (void)setStyles:(id)a3;
- (void)setUnderlineButton:(id)a3;
- (void)setUpNonStyleButtons;
- (void)toggleBIUS:(id)a3;
- (void)toggleBlockQuote:(id)a3;
- (void)toggleEmphasis:(id)a3;
- (void)updateButtonEnabledState;
- (void)updateHeaderVisibility;
- (void)updateListStyleSelectedState;
- (void)updateNamedStyleSelectedState;
- (void)updateStyleSelectionHighlightAnimated:(BOOL)a3;
- (void)updateViewConstraints;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ICStyleSelectorViewController

- (id)makeShortcutMenu
{
  v19[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x263F82658];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke;
  v15[3] = &unk_2640B9EB0;
  objc_copyWeak(&v16, &location);
  v3 = [v2 elementWithProvider:v15];
  v4 = (void *)MEMORY[0x263F82658];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_10;
  v13[3] = &unk_2640B9EB0;
  objc_copyWeak(&v14, &location);
  v5 = [v4 elementWithProvider:v13];
  v6 = (void *)MEMORY[0x263F82940];
  v19[0] = v5;
  v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  v8 = objc_msgSend(v6, "ic_inlineMenuWithChildren:", v7);

  v9 = (void *)MEMORY[0x263F82940];
  v18[0] = v3;
  v18[1] = v8;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  v11 = [v9 menuWithTitle:&stru_26C10E100 children:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

- (void)setDelegate:(id)a3
{
}

- (id)nibBundle
{
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();

  return (id)[v2 bundleForClass:v3];
}

- (void)viewDidLoad
{
  v45[2] = *MEMORY[0x263EF8340];
  v43.receiver = self;
  v43.super_class = (Class)ICStyleSelectorViewController;
  [(ICStyleSelectorViewController *)&v43 viewDidLoad];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, 20.0, 20.0);
  [(ICStyleSelectorViewController *)self setStyleSelectionHighlight:v3];

  v4 = [(ICStyleSelectorViewController *)self styleSelectionHighlight];
  [v4 setAlpha:0.0];

  v5 = [(ICStyleSelectorViewController *)self styleSelectionHighlight];
  objc_msgSend(v5, "ic_applyRoundedCorners");

  v6 = [(ICStyleSelectorViewController *)self styleScrollView];
  v7 = [(ICStyleSelectorViewController *)self styleSelectionHighlight];
  [v6 addSubview:v7];

  v8 = [(ICStyleSelectorViewController *)self view];
  [v8 layoutMargins];
  double v10 = v9;
  v11 = [(ICStyleSelectorViewController *)self view];
  [v11 layoutMargins];
  double v13 = v12;
  id v14 = [(ICStyleSelectorViewController *)self styleScrollView];
  objc_msgSend(v14, "setContentInset:", 0.0, v10, 0.0, v13);

  v15 = [(ICStyleSelectorViewController *)self view];
  [v15 setAutoresizingMask:0];

  id v16 = [(ICStyleSelectorViewController *)self view];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [MEMORY[0x263F824E8] buttonWithType:7];
  [v17 addTarget:self action:sel_didSelectDone_ forControlEvents:64];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = [(ICStyleSelectorViewController *)self headerView];
  [v18 addSubview:v17];

  [(ICStyleSelectorViewController *)self setCloseButton:v17];
  v40 = (void *)MEMORY[0x263F08938];
  v41 = [(ICStyleSelectorViewController *)self headerView];
  v19 = [v41 layoutMarginsGuide];
  v20 = [v19 trailingAnchor];
  v21 = [(UIButton *)self->_closeButton trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:8.0];
  v45[0] = v22;
  v42 = v17;
  v23 = [v17 centerYAnchor];
  v24 = [(ICStyleSelectorViewController *)self headerView];
  v25 = [v24 centerYAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  v45[1] = v26;
  v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:2];
  [v40 activateConstraints:v27];

  v28 = [MEMORY[0x263F5B4F8] titleStyle];
  v44[0] = v28;
  v29 = [MEMORY[0x263F5B4F8] headingStyle];
  v44[1] = v29;
  v30 = [MEMORY[0x263F5B4F8] subheadingStyle];
  v44[2] = v30;
  v31 = [MEMORY[0x263F5B4F8] bodyStyle];
  v44[3] = v31;
  v32 = [MEMORY[0x263F5B4F8] fixedWidthStyle];
  v44[4] = v32;
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:5];
  [(ICStyleSelectorViewController *)self setStyles:v33];

  if ([(ICStyleSelectorViewController *)self ic_isRTL])
  {
    v34 = [(ICStyleSelectorViewController *)self styles];
    v35 = [v34 reverseObjectEnumerator];
    v36 = [v35 allObjects];
    [(ICStyleSelectorViewController *)self setStyles:v36];

    v37 = [(ICStyleSelectorViewController *)self headerLabel];
    [v37 setTextAlignment:4];
  }
  v38 = [(ICStyleSelectorViewController *)self view];
  [v38 intrinsicContentSize];
  -[ICStyleSelectorViewController setPreferredContentSize:](self, "setPreferredContentSize:");

  v39 = [MEMORY[0x263F08A00] defaultCenter];
  [v39 addObserver:self selector:sel_applyAccessibilityInfo name:*MEMORY[0x263F832E8] object:0];

  [(ICStyleSelectorViewController *)self setConfiguredForPopover:0];
  [(ICStyleSelectorViewController *)self applyAccessibilityInfo];
  [(ICStyleSelectorViewController *)self configureForOrientation];
  [(ICStyleSelectorViewController *)self registerForTraitChanges];
}

- (void)registerForTraitChanges
{
  objc_initWeak(&location, self);
  uint64_t v3 = objc_msgSend(MEMORY[0x263F82DA0], "ic_traitsAffectingSizeAndColor");
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__ICStyleSelectorViewController_registerForTraitChanges__block_invoke;
  v5[3] = &unk_2640B9130;
  objc_copyWeak(&v6, &location);
  id v4 = (id)[(ICStyleSelectorViewController *)self registerForTraitChanges:v3 withHandler:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __56__ICStyleSelectorViewController_registerForTraitChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained traitCollection];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __56__ICStyleSelectorViewController_registerForTraitChanges__block_invoke_2;
  v3[3] = &unk_2640B8140;
  v3[4] = WeakRetained;
  objc_msgSend(v2, "ic_performAsCurrent:", v3);
}

uint64_t __56__ICStyleSelectorViewController_registerForTraitChanges__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) populateStyleScrollView];
  [*(id *)(a1 + 32) updateNamedStyleSelectedState];
  v2 = *(void **)(a1 + 32);

  return [v2 updateStyleSelectionHighlightAnimated:0];
}

- (void)viewSafeAreaInsetsDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)ICStyleSelectorViewController;
  [(ICStyleSelectorViewController *)&v4 viewSafeAreaInsetsDidChange];
  uint64_t v3 = [(ICStyleSelectorViewController *)self view];
  [v3 setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
  v9.receiver = self;
  v9.super_class = (Class)ICStyleSelectorViewController;
  [(ICStyleSelectorViewController *)&v9 updateViewConstraints];
  [(ICStyleSelectorViewController *)self updateHeaderVisibility];
  [(ICStyleSelectorViewController *)self configureForOrientation];
  uint64_t v3 = [(ICStyleSelectorViewController *)self view];
  [v3 layoutMargins];
  double v5 = v4;
  id v6 = [(ICStyleSelectorViewController *)self listsContainerBottomConstraint];
  [v6 setConstant:v5];

  if (ICInternalSettingsIsEmphasisEnabled())
  {
    [(ICStyleSelectorViewController *)self configureViewWithEmphasis];
  }
  else
  {
    v7 = [(ICStyleSelectorViewController *)self emphasisContainer];

    if (v7)
    {
      v8 = [(ICStyleSelectorViewController *)self emphasisContainer];
      [v8 removeFromSuperview];
    }
  }
}

- (void)viewWillLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)ICStyleSelectorViewController;
  [(ICStyleSelectorViewController *)&v22 viewWillLayoutSubviews];
  if ([(ICStyleSelectorViewController *)self isPopover])
  {
    uint64_t v3 = [(ICStyleSelectorViewController *)self view];
    double v4 = v3;
    double v5 = 20.0;
    double v6 = 20.0;
    double v7 = 20.0;
  }
  else
  {
    v8 = [(ICStyleSelectorViewController *)self traitCollection];
    if ([v8 verticalSizeClass] == 2) {
      double v9 = 36.0;
    }
    else {
      double v9 = 8.0;
    }

    uint64_t v3 = [(ICStyleSelectorViewController *)self view];
    double v4 = v3;
    double v5 = 15.0;
    double v7 = 15.0;
    double v6 = v9;
  }
  objc_msgSend(v3, "setLayoutMargins:", 0.0, v5, v6, v7);

  double v10 = [(ICStyleSelectorViewController *)self view];
  [v10 layoutMargins];
  double v12 = v11;
  double v13 = [(ICStyleSelectorViewController *)self view];
  [v13 layoutMargins];
  double v15 = v14;
  id v16 = [(ICStyleSelectorViewController *)self styleScrollView];
  objc_msgSend(v16, "setContentInset:", 0.0, v12, 0.0, v15);

  v17 = [(ICStyleSelectorViewController *)self view];
  [v17 layoutMargins];
  double v19 = v18;
  v20 = [(ICStyleSelectorViewController *)self listsContainerBottomConstraint];
  [v20 setConstant:v19];

  [(ICStyleSelectorViewController *)self updateHeaderVisibility];
  v21 = [(ICStyleSelectorViewController *)self view];
  [v21 invalidateIntrinsicContentSize];

  [(ICStyleSelectorViewController *)self setUpNonStyleButtons];
}

- (void)viewDidLayoutSubviews
{
  uint64_t v3 = [(ICStyleSelectorViewController *)self styleScrollView];
  [v3 bounds];
  double v5 = v4;
  double v6 = [(ICStyleSelectorViewController *)self styleScrollView];
  [v6 contentSize];
  double v8 = v7;

  if (v5 <= v8)
  {
    [(ICStyleSelectorViewController *)self scrollCurrentStyleToVisible:0];
    double v19 = [(ICStyleSelectorViewController *)self styleScrollView];
    id v21 = v19;
    uint64_t v20 = 1;
  }
  else
  {
    double v9 = [(ICStyleSelectorViewController *)self view];
    [v9 bounds];
    double v11 = v10;
    double v12 = [(ICStyleSelectorViewController *)self styleScrollView];
    [v12 contentSize];
    double v14 = (v11 - v13) * 0.5;
    double v15 = [(ICStyleSelectorViewController *)self styleScrollView];
    [v15 frame];
    double v17 = -floor(v14 - v16);
    double v18 = [(ICStyleSelectorViewController *)self styleScrollView];
    objc_msgSend(v18, "setContentOffset:", v17, 0.0);

    double v19 = [(ICStyleSelectorViewController *)self styleScrollView];
    id v21 = v19;
    uint64_t v20 = 0;
  }
  [v19 setScrollEnabled:v20];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ICStyleSelectorViewController;
  [(ICNAViewController *)&v7 viewWillAppear:a3];
  if ([(ICStyleSelectorViewController *)self isPopover]) {
    [(ICStyleSelectorViewController *)self configureForPopover];
  }
  double v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_contentSizeCategoryDidChange name:*MEMORY[0x263F83428] object:0];

  double v5 = [(ICStyleSelectorViewController *)self traitCollection];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__ICStyleSelectorViewController_viewWillAppear___block_invoke;
  v6[3] = &unk_2640B8140;
  v6[4] = self;
  objc_msgSend(v5, "ic_performAsCurrent:", v6);
}

uint64_t __48__ICStyleSelectorViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) populateStyleScrollView];
  [*(id *)(a1 + 32) updateNamedStyleSelectedState];
  v2 = *(void **)(a1 + 32);

  return [v2 applyAccessibilityInfo];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICStyleSelectorViewController;
  [(ICStyleSelectorViewController *)&v6 viewDidAppear:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F831C0];
  double v5 = [(ICStyleSelectorViewController *)self view];
  UIAccessibilityPostNotification(v4, v5);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICStyleSelectorViewController;
  [(ICStyleSelectorViewController *)&v5 viewWillDisappear:a3];
  UIAccessibilityNotifications v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x263F83428] object:0];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ICStyleSelectorViewController;
  [(ICStyleSelectorViewController *)&v6 viewDidDisappear:a3];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F831C0];
  objc_super v5 = [(ICStyleSelectorViewController *)self elementForAXFocusOnDismissal];
  UIAccessibilityPostNotification(v4, v5);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  if (ICInternalSettingsIsEmphasisEnabled())
  {
    [(ICStyleSelectorViewController *)self setUpNonStyleButtons];
    v11.receiver = self;
    v11.super_class = (Class)ICStyleSelectorViewController;
    [(ICStyleSelectorViewController *)&v11 presentViewController:v9 animated:v5 completion:v8];
  }
  else
  {
    id v10 = [(ICStyleSelectorViewController *)self delegate];
    [v10 styleSelector:self presentViewController:v9 animated:v5 completion:v8];
  }
}

- (void)configureForPopover
{
  uint64_t v3 = [(ICStyleSelectorViewController *)self delegate];
  int v4 = [v3 styleSelectorShouldUseCompactTopInset:self];

  if (v4) {
    double v5 = 60.0;
  }
  else {
    double v5 = 79.0;
  }
  objc_super v6 = [(ICStyleSelectorViewController *)self scrollViewTopConstraint];
  [v6 setConstant:v5];

  if (![(ICStyleSelectorViewController *)self configuredForPopover])
  {
    objc_super v7 = [(ICStyleSelectorViewController *)self biusContainerTopConstraint];
    [v7 setConstant:12.0];

    id v8 = [(ICStyleSelectorViewController *)self listsContainerTopConstraint];
    [v8 setConstant:12.0];

    id v9 = [(ICStyleSelectorViewController *)self listsContainerBottomConstraint];
    [v9 setConstant:16.0];

    [(ICStyleSelectorViewController *)self setConfiguredForPopover:1];
  }
}

- (void)dealloc
{
  [MEMORY[0x263F8C6D0] cancelPreviousPerformRequestsWithTarget:self];
  v3.receiver = self;
  v3.super_class = (Class)ICStyleSelectorViewController;
  [(ICNAViewController *)&v3 dealloc];
}

- (double)styleButtonPadding
{
  double v3 = 12.0;
  if (![(ICStyleSelectorViewController *)self isPopover])
  {
    int v4 = [(ICStyleSelectorViewController *)self traitCollection];
    if ([v4 verticalSizeClass] == 1) {
      double v3 = 21.0;
    }
    else {
      double v3 = 12.0;
    }
  }
  return v3;
}

- (void)didSelectDone:(id)a3
{
  id v4 = [(ICStyleSelectorViewController *)self delegate];
  [v4 styleSelectorDidCancel:self];
}

- (void)toggleBlockQuote:(id)a3
{
  id v4 = [(ICStyleSelectorViewController *)self delegate];
  [v4 styleSelectorToggleBlockQuote:self];

  id v7 = [(ICStyleSelectorViewController *)self delegate];
  uint64_t v5 = [v7 styleSelectorSelectionHasBlockQuote:self];
  objc_super v6 = [(ICStyleSelectorViewController *)self blockQuoteButton];
  [v6 setSelected:v5];
}

- (void)toggleBIUS:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "setSelected:", objc_msgSend(v4, "isSelected") ^ 1);
  id v6 = [(ICStyleSelectorViewController *)self delegate];
  uint64_t v5 = [v4 tag];

  [v6 styleSelector:self toggleBIUS:v5];
}

- (void)indentLeft:(id)a3
{
  id v4 = [(ICStyleSelectorViewController *)self delegate];
  [v4 styleSelectorDidIndentLeft:self];

  [(ICStyleSelectorViewController *)self updateButtonEnabledState];
}

- (void)indentRight:(id)a3
{
  id v4 = [(ICStyleSelectorViewController *)self delegate];
  [v4 styleSelectorDidIndentRight:self];

  [(ICStyleSelectorViewController *)self updateButtonEnabledState];
}

- (void)didSelectDashedList:(id)a3
{
  id v4 = [MEMORY[0x263F088D0] indexSetWithIndex:101];
  [(ICStyleSelectorViewController *)self setCurrentStyles:v4 bius:[(ICStyleSelectorViewController *)self currentBIUS] animated:0];

  uint64_t v5 = [(ICStyleSelectorViewController *)self delegate];
  [v5 styleSelector:self didSelectStyle:101];

  [(ICStyleSelectorViewController *)self updateButtonEnabledState];
}

- (void)didSelectNumberedList:(id)a3
{
  id v4 = [MEMORY[0x263F088D0] indexSetWithIndex:102];
  [(ICStyleSelectorViewController *)self setCurrentStyles:v4 bius:[(ICStyleSelectorViewController *)self currentBIUS] animated:0];

  uint64_t v5 = [(ICStyleSelectorViewController *)self delegate];
  [v5 styleSelector:self didSelectStyle:102];

  [(ICStyleSelectorViewController *)self updateButtonEnabledState];
}

- (void)didSelectBulletedList:(id)a3
{
  id v4 = [MEMORY[0x263F088D0] indexSetWithIndex:100];
  [(ICStyleSelectorViewController *)self setCurrentStyles:v4 bius:[(ICStyleSelectorViewController *)self currentBIUS] animated:0];

  uint64_t v5 = [(ICStyleSelectorViewController *)self delegate];
  [v5 styleSelector:self didSelectStyle:100];

  [(ICStyleSelectorViewController *)self updateButtonEnabledState];
}

- (void)setStyles:(id)a3
{
  uint64_t v5 = (NSArray *)a3;
  p_styles = &self->_styles;
  if (self->_styles != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_styles, a3);
    p_styles = (NSArray **)[(ICStyleSelectorViewController *)self populateStyleScrollView];
    uint64_t v5 = v7;
  }

  MEMORY[0x270F9A758](p_styles, v5);
}

- (void)setCurrentStyles:(id)a3 bius:(unint64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  [(ICStyleSelectorViewController *)self loadViewIfNeeded];
  [(ICStyleSelectorViewController *)self setCurrentBIUS:a4];
  [(ICStyleSelectorViewController *)self setCurrentStyles:v8];

  [(ICStyleSelectorViewController *)self updateStyleSelectionHighlightAnimated:v5];
  [(ICStyleSelectorViewController *)self updateNamedStyleSelectedState];
  [(ICStyleSelectorViewController *)self updateListStyleSelectedState];
  [(ICStyleSelectorViewController *)self updateButtonEnabledState];

  [(ICStyleSelectorViewController *)self scrollCurrentStyleToVisible:v5];
}

- (void)setCurrentBIUS:(unint64_t)a3
{
  self->_currentBIUS = a3;
  unint64_t v5 = a3 & 1;
  id v6 = [(ICStyleSelectorViewController *)self boldButton];
  [v6 setSelected:v5];

  id v7 = [(ICStyleSelectorViewController *)self italicButton];
  [v7 setSelected:(a3 >> 1) & 1];

  id v8 = [(ICStyleSelectorViewController *)self underlineButton];
  [v8 setSelected:(a3 >> 2) & 1];

  id v9 = [(ICStyleSelectorViewController *)self strikethroughButton];
  [v9 setSelected:(a3 >> 3) & 1];

  if (ICInternalSettingsIsEmphasisEnabled())
  {
    id v10 = [(ICStyleSelectorViewController *)self emphasisButton];
    [v10 setSelected:(a3 >> 4) & 1];
  }
  objc_super v11 = [(ICStyleSelectorViewController *)self delegate];
  uint64_t v12 = [v11 styleSelectorSelectionHasBlockQuote:self];

  id v13 = [(ICStyleSelectorViewController *)self blockQuoteButton];
  [v13 setSelected:v12];
}

- (UIButton)boldButton
{
  v2 = [(ICStyleSelectorViewController *)self biusContainer];
  double v3 = [v2 viewWithTag:1];

  return (UIButton *)v3;
}

- (UIButton)italicButton
{
  v2 = [(ICStyleSelectorViewController *)self biusContainer];
  double v3 = [v2 viewWithTag:2];

  return (UIButton *)v3;
}

- (UIButton)underlineButton
{
  v2 = [(ICStyleSelectorViewController *)self biusContainer];
  double v3 = [v2 viewWithTag:4];

  return (UIButton *)v3;
}

- (UIButton)strikethroughButton
{
  v2 = [(ICStyleSelectorViewController *)self biusContainer];
  double v3 = [v2 viewWithTag:8];

  return (UIButton *)v3;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICStyleSelectorViewController *)self headerView];
  [v5 frame];
  double v6 = CGRectGetMaxY(v10) + 4.0 + 8.0;

  uint64_t v7 = [v4 verticalSizeClass];
  double v8 = 104.0;
  if (v7 == 2) {
    double v8 = 188.0;
  }
  return v6 + v8;
}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke(uint64_t a1, void *a2)
{
  v54[8] = *MEMORY[0x263EF8340];
  v37 = a2;
  double v3 = (void *)MEMORY[0x263F823D0];
  id v4 = [MEMORY[0x263F5B4F8] titleStyle];
  unint64_t v5 = [v4 name];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_2;
  v52[3] = &unk_2640B9E88;
  double v6 = (id *)(a1 + 32);
  objc_copyWeak(&v53, (id *)(a1 + 32));
  v36 = [v3 actionWithTitle:v5 image:0 identifier:0 handler:v52];

  uint64_t v7 = (void *)MEMORY[0x263F823D0];
  double v8 = [MEMORY[0x263F5B4F8] headingStyle];
  id v9 = [v8 name];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_3;
  v50[3] = &unk_2640B9E88;
  objc_copyWeak(&v51, (id *)(a1 + 32));
  v35 = [v7 actionWithTitle:v9 image:0 identifier:0 handler:v50];

  CGRect v10 = (void *)MEMORY[0x263F823D0];
  objc_super v11 = [MEMORY[0x263F5B4F8] subheadingStyle];
  uint64_t v12 = [v11 name];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_4;
  v48[3] = &unk_2640B9E88;
  objc_copyWeak(&v49, (id *)(a1 + 32));
  v34 = [v10 actionWithTitle:v12 image:0 identifier:0 handler:v48];

  id v13 = (void *)MEMORY[0x263F823D0];
  double v14 = [MEMORY[0x263F5B4F8] bodyStyle];
  double v15 = [v14 name];
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_5;
  v46[3] = &unk_2640B9E88;
  objc_copyWeak(&v47, (id *)(a1 + 32));
  v33 = [v13 actionWithTitle:v15 image:0 identifier:0 handler:v46];

  double v16 = (void *)MEMORY[0x263F823D0];
  double v17 = [MEMORY[0x263F5B4F8] fixedWidthStyle];
  double v18 = [v17 name];
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_6;
  v44[3] = &unk_2640B9E88;
  objc_copyWeak(&v45, (id *)(a1 + 32));
  double v19 = [v16 actionWithTitle:v18 image:0 identifier:0 handler:v44];

  uint64_t v20 = (void *)MEMORY[0x263F823D0];
  id v21 = [MEMORY[0x263F5B4F8] dashStyle];
  objc_super v22 = [v21 name];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_7;
  v42[3] = &unk_2640B9E88;
  objc_copyWeak(&v43, v6);
  v23 = [v20 actionWithTitle:v22 image:0 identifier:0 handler:v42];

  v24 = (void *)MEMORY[0x263F823D0];
  v25 = [MEMORY[0x263F5B4F8] numberedStyle];
  v26 = [v25 name];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_8;
  v40[3] = &unk_2640B9E88;
  objc_copyWeak(&v41, v6);
  v27 = [v24 actionWithTitle:v26 image:0 identifier:0 handler:v40];

  v28 = (void *)MEMORY[0x263F823D0];
  v29 = [MEMORY[0x263F5B4F8] bulletStyle];
  v30 = [v29 name];
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_9;
  v38[3] = &unk_2640B9E88;
  objc_copyWeak(&v39, v6);
  v31 = [v28 actionWithTitle:v30 image:0 identifier:0 handler:v38];

  v54[0] = v36;
  v54[1] = v35;
  v54[2] = v34;
  v54[3] = v33;
  v54[4] = v19;
  v54[5] = v23;
  v54[6] = v27;
  v54[7] = v31;
  v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:8];
  v37[2](v37, v32);

  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v45);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);

  objc_destroyWeak(&v51);
  objc_destroyWeak(&v53);
}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 styleSelector:WeakRetained didSelectStyle:0];
}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 styleSelector:WeakRetained didSelectStyle:1];
}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 styleSelector:WeakRetained didSelectStyle:2];
}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 styleSelector:WeakRetained didSelectStyle:3];
}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 styleSelector:WeakRetained didSelectStyle:4];
}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 styleSelector:WeakRetained didSelectStyle:101];
}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 styleSelector:WeakRetained didSelectStyle:102];
}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 styleSelector:WeakRetained didSelectStyle:100];
}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_10(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  double v3 = a2;
  id v4 = (void *)MEMORY[0x263F823D0];
  unint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
  double v6 = [v5 localizedStringForKey:@"Block Quote" value:&stru_26C10E100 table:0];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_11;
  v9[3] = &unk_2640B9E88;
  objc_copyWeak(&v10, (id *)(a1 + 32));
  uint64_t v7 = [v4 actionWithTitle:v6 image:0 identifier:0 handler:v9];

  v11[0] = v7;
  double v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  v3[2](v3, v8);

  objc_destroyWeak(&v10);
}

void __49__ICStyleSelectorViewController_makeShortcutMenu__block_invoke_11(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 styleSelectorToggleBlockQuote:WeakRetained];
}

- (BOOL)currentBIUSContainsStyle:(unint64_t)a3
{
  return (a3 & ~[(ICStyleSelectorViewController *)self currentBIUS]) == 0;
}

- (BOOL)currentNamedStylesContainsStyle:(unsigned int)a3
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  id v4 = [(ICStyleSelectorViewController *)self currentStyles];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__ICStyleSelectorViewController_currentNamedStylesContainsStyle___block_invoke;
  v6[3] = &unk_2640B9ED8;
  unsigned int v7 = a3;
  v6[4] = &v8;
  [v4 enumerateIndexesUsingBlock:v6];

  LOBYTE(a3) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return a3;
}

uint64_t __65__ICStyleSelectorViewController_currentNamedStylesContainsStyle___block_invoke(uint64_t result, int a2, unsigned char *a3)
{
  if (*(_DWORD *)(result + 40) == a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (int64_t)menuElementStateWithSelected:(BOOL)a3
{
  return a3;
}

- (id)biusStyleActionWithStyleBIUS:(unint64_t)a3
{
  objc_initWeak(&location, self);
  unint64_t v5 = NSStringForSymbolImageNameFromICStyleBIUS();
  BOOL v6 = [(ICStyleSelectorViewController *)self currentBIUSContainsStyle:a3];
  unsigned int v7 = objc_msgSend(MEMORY[0x263F827E8], "ic_systemImageNamed:textStyle:scale:", v5, *MEMORY[0x263F83570], -1);
  if (v6)
  {
    uint64_t v8 = [MEMORY[0x263F825C8] darkTextColor];
    id v9 = [v7 imageWithTintColor:v8];

    uint64_t v10 = [MEMORY[0x263F825C8] whiteColor];
    unsigned int v7 = objc_msgSend(v9, "ic_imageCenteredWithBackgroundColor:size:cornerRadius:", v10, 34.0, 34.0, 8.0);
  }
  char v11 = (void *)MEMORY[0x263F823D0];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __62__ICStyleSelectorViewController_biusStyleActionWithStyleBIUS___block_invoke;
  v15[3] = &unk_2640B9F00;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  uint64_t v12 = objc_msgSend(v11, "ic_actionWithImage:handler:", v7, v15);
  id v13 = [MEMORY[0x263F5B4F8] icaxStyleDescriptionForBIUSStyle:a3];
  [v12 setAccessibilityLabel:v13];

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);

  return v12;
}

void __62__ICStyleSelectorViewController_biusStyleActionWithStyleBIUS___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  [v2 styleSelector:WeakRetained toggleBIUS:*(void *)(a1 + 40)];
}

- (id)namedStyleActionWithNamedStyle:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  objc_initWeak(&location, self);
  unint64_t v5 = [MEMORY[0x263F5B4F8] styleForNamedStyle:v3];
  BOOL v6 = (void *)MEMORY[0x263F823D0];
  unsigned int v7 = [v5 attributedName];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __64__ICStyleSelectorViewController_namedStyleActionWithNamedStyle___block_invoke;
  v11[3] = &unk_2640B9F28;
  objc_copyWeak(&v12, &location);
  int v13 = v3;
  uint64_t v8 = objc_msgSend(v6, "ic_actionWithAttributedTitle:handler:", v7, v11);

  objc_msgSend(v8, "setState:", -[ICStyleSelectorViewController menuElementStateWithSelected:](self, "menuElementStateWithSelected:", -[ICStyleSelectorViewController currentNamedStylesContainsStyle:](self, "currentNamedStylesContainsStyle:", v3)));
  id v9 = [MEMORY[0x263F5B4F8] icaxStyleDescriptionForNamedStyle:v3];
  [v8 setAccessibilityLabel:v9];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v8;
}

void __64__ICStyleSelectorViewController_namedStyleActionWithNamedStyle___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained selectNamedStyle:*(unsigned int *)(a1 + 40)];
}

- (id)emphasisMenu
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F5B150];
  id v4 = [MEMORY[0x263EFF980] arrayWithCapacity:*MEMORY[0x263F5B150] + 1];
  if (v3)
  {
    uint64_t v5 = 0;
    do
    {
      BOOL v6 = [(ICStyleSelectorViewController *)self emphasisColorActionWithType:++v5 bordered:1 selectionTogglesEmphasis:1];
      objc_msgSend(v4, "ic_addNonNilObject:", v6);
    }
    while (v3 != v5);
  }
  unsigned int v7 = [(ICStyleSelectorViewController *)self delegate];
  uint64_t v8 = [v7 currentEmphasisType];

  if (v8)
  {
    id v9 = [(ICStyleSelectorViewController *)self emphasisColorImageWithType:v8 bordered:1];
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = (void *)MEMORY[0x263F82940];
  char v11 = [MEMORY[0x263F086E0] mainBundle];
  id v12 = [v11 localizedStringForKey:@"Highlight" value:&stru_26C10E100 table:0];
  int v13 = [v10 menuWithTitle:v12 image:v9 identifier:0 options:0 children:v4];

  double v14 = (void *)MEMORY[0x263F82940];
  v18[0] = v13;
  double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
  double v16 = objc_msgSend(v14, "ic_inlineMenuWithChildren:", v15);

  return v16;
}

- (id)blockQuoteMenu
{
  v19[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)MEMORY[0x263F823D0];
  id v4 = objc_msgSend(MEMORY[0x263F086A0], "ic_blockQuoteMenuItemAttributedString");
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  double v15 = __47__ICStyleSelectorViewController_blockQuoteMenu__block_invoke;
  double v16 = &unk_2640B9E88;
  objc_copyWeak(&v17, &location);
  uint64_t v5 = objc_msgSend(v3, "ic_actionWithAttributedTitle:handler:", v4, &v13);

  BOOL v6 = [(ICStyleSelectorViewController *)self delegate];
  objc_msgSend(v5, "setState:", objc_msgSend(v6, "styleSelectorSelectionHasBlockQuote:", self));

  unsigned int v7 = [(ICStyleSelectorViewController *)self blockQuoteButton];
  uint64_t v8 = [v7 accessibilityLabel];
  [v5 setAccessibilityLabel:v8];

  id v9 = (void *)MEMORY[0x263F82940];
  v19[0] = v5;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  char v11 = objc_msgSend(v9, "ic_inlineMenuWithChildren:", v10);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v11;
}

void __47__ICStyleSelectorViewController_blockQuoteMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained toggleBlockQuote:WeakRetained];
}

- (void)toggleEmphasis:(id)a3
{
  id v4 = [(ICStyleSelectorViewController *)self delegate];
  [v4 toggleEmphasis];

  uint64_t v5 = [(ICStyleSelectorViewController *)self delegate];
  unint64_t v6 = [v5 currentBIUSForStyleSelector];

  id v7 = [(ICStyleSelectorViewController *)self emphasisButton];
  [v7 setSelected:(v6 >> 4) & 1];
}

- (id)makeInlineMenu
{
  v19[1] = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x263F82658];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __47__ICStyleSelectorViewController_makeInlineMenu__block_invoke;
  v15[3] = &unk_2640B9EB0;
  objc_copyWeak(&v16, &location);
  uint64_t v3 = [v2 elementWithUncachedProvider:v15];
  id v4 = (void *)MEMORY[0x263F82940];
  v19[0] = v3;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:1];
  unint64_t v6 = objc_msgSend(v4, "ic_inlineMenuWithElementSize:children:", 0, v5);

  id v7 = (void *)MEMORY[0x263F82658];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__ICStyleSelectorViewController_makeInlineMenu__block_invoke_2;
  v13[3] = &unk_2640B9EB0;
  objc_copyWeak(&v14, &location);
  uint64_t v8 = [v7 elementWithUncachedProvider:v13];
  id v9 = (void *)MEMORY[0x263F82940];
  v18[0] = v6;
  v18[1] = v8;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  char v11 = [v9 menuWithChildren:v10];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v11;
}

void __47__ICStyleSelectorViewController_makeInlineMenu__block_invoke(uint64_t a1, void *a2)
{
  v12[4] = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 32);
  uint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v5 = [WeakRetained delegate];
  [v5 styleSelectorWillShowInlineMenu:WeakRetained];

  unint64_t v6 = [WeakRetained biusStyleActionWithStyleBIUS:1];
  id v7 = [WeakRetained biusStyleActionWithStyleBIUS:2];
  uint64_t v8 = [WeakRetained biusStyleActionWithStyleBIUS:4];
  id v9 = [WeakRetained biusStyleActionWithStyleBIUS:8];
  v12[0] = v6;
  v12[1] = v7;
  v12[2] = v8;
  v12[3] = v9;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];
  char v11 = (void *)[v10 copy];
  v3[2](v3, v11);
}

void __47__ICStyleSelectorViewController_makeInlineMenu__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  uint64_t v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  uint64_t v4 = [WeakRetained emphasisMenu];
  uint64_t v5 = [WeakRetained namedStyleActionWithNamedStyle:0];
  uint64_t v6 = [WeakRetained namedStyleActionWithNamedStyle:1];
  id v7 = [WeakRetained namedStyleActionWithNamedStyle:2];
  uint64_t v8 = [WeakRetained namedStyleActionWithNamedStyle:3];
  id v9 = [WeakRetained namedStyleActionWithNamedStyle:4];
  uint64_t v10 = [WeakRetained namedStyleActionWithNamedStyle:102];
  char v11 = [WeakRetained namedStyleActionWithNamedStyle:101];
  id v12 = [WeakRetained namedStyleActionWithNamedStyle:100];
  uint64_t v17 = v6;
  double v18 = (void *)v6;
  double v19 = (void *)v4;
  uint64_t v13 = (void *)v5;
  id v14 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithObjects:", v4, v5, v17, v7, v8, v9, v10, v11, v12, 0);
  if (ICInternalSettingsIsBlockQuoteEnabled())
  {
    double v15 = [WeakRetained blockQuoteMenu];
    [v14 addObject:v15];
  }
  id v16 = (void *)[v14 copy];
  v3[2](v3, v16);
}

- (NSArray)biusButtons
{
  void v9[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICStyleSelectorViewController *)self boldButton];
  v9[0] = v3;
  uint64_t v4 = [(ICStyleSelectorViewController *)self italicButton];
  v9[1] = v4;
  uint64_t v5 = [(ICStyleSelectorViewController *)self underlineButton];
  v9[2] = v5;
  uint64_t v6 = [(ICStyleSelectorViewController *)self strikethroughButton];
  v9[3] = v6;
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:4];

  return (NSArray *)v7;
}

- (NSArray)listButtons
{
  v8[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICStyleSelectorViewController *)self bulletedListButton];
  uint64_t v4 = [(ICStyleSelectorViewController *)self dashedListButton];
  v8[1] = v4;
  uint64_t v5 = [(ICStyleSelectorViewController *)self numberedListButton];
  v8[2] = v5;
  uint64_t v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:3];

  return (NSArray *)v6;
}

- (NSArray)indentationButtons
{
  v7[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICStyleSelectorViewController *)self indentLeftButton];
  v7[0] = v3;
  uint64_t v4 = [(ICStyleSelectorViewController *)self indentRightButton];
  v7[1] = v4;
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:2];

  return (NSArray *)v5;
}

- (NSArray)nonStyleButtons
{
  uint64_t v3 = [(ICStyleSelectorViewController *)self biusButtons];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (ICInternalSettingsIsEmphasisEnabled())
  {
    uint64_t v5 = [(ICStyleSelectorViewController *)self emphasisButton];
    [v4 addObject:v5];

    uint64_t v6 = *MEMORY[0x263F5B150];
    id v7 = [MEMORY[0x263EFF980] arrayWithCapacity:*MEMORY[0x263F5B150]];
    if (v6)
    {
      uint64_t v8 = 0;
      do
      {
        id v9 = [(ICStyleSelectorViewController *)self emphasisColorActionWithType:++v8 bordered:0 selectionTogglesEmphasis:0];
        objc_msgSend(v7, "ic_addNonNilObject:", v9);
      }
      while (v6 != v8);
    }
    uint64_t v10 = [MEMORY[0x263F82940] menuWithChildren:v7];
    char v11 = [(ICStyleSelectorViewController *)self emphasisColorPickerButton];
    [v11 setMenu:v10];

    id v12 = [(ICStyleSelectorViewController *)self emphasisColorPickerButton];
    [v12 setShowsMenuAsPrimaryAction:1];

    uint64_t v13 = [(ICStyleSelectorViewController *)self emphasisColorPickerButton];
    [v4 addObject:v13];
  }
  id v14 = [(ICStyleSelectorViewController *)self listButtons];
  [v4 addObjectsFromArray:v14];

  double v15 = [(ICStyleSelectorViewController *)self indentationButtons];
  [v4 addObjectsFromArray:v15];

  id v16 = [(ICStyleSelectorViewController *)self blockQuoteButton];
  [v4 addObject:v16];

  return (NSArray *)v4;
}

- (void)applyFixedEmphasisColor:(id)a3
{
  uint64_t v4 = ICEmphasisColorTypeForTag();
  id v5 = [(ICStyleSelectorViewController *)self delegate];
  [v5 toggleEmphasisWithType:v4];
}

- (id)emphasisColorActionWithType:(int64_t)a3 bordered:(BOOL)a4 selectionTogglesEmphasis:(BOOL)a5
{
  BOOL v6 = a4;
  objc_initWeak(&location, self);
  id v9 = NSStringForEmphasisColorType();
  uint64_t v10 = [(ICStyleSelectorViewController *)self emphasisColorImageWithType:a3 bordered:v6];
  char v11 = (void *)MEMORY[0x263F823D0];
  uint64_t v15 = MEMORY[0x263EF8330];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __95__ICStyleSelectorViewController_emphasisColorActionWithType_bordered_selectionTogglesEmphasis___block_invoke;
  double v18 = &unk_2640B9F50;
  BOOL v20 = a5;
  objc_copyWeak(v19, &location);
  v19[1] = (id)a3;
  id v12 = [v11 actionWithTitle:v9 image:v10 identifier:0 handler:&v15];
  uint64_t v13 = [(ICStyleSelectorViewController *)self delegate];
  objc_msgSend(v12, "setState:", objc_msgSend(v13, "currentEmphasisType") == a3);

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);

  return v12;
}

void __95__ICStyleSelectorViewController_emphasisColorActionWithType_bordered_selectionTogglesEmphasis___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (*(unsigned char *)(a1 + 48)
    && (id v3 = objc_loadWeakRetained((id *)(a1 + 32)),
        [v3 delegate],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 currentEmphasisType],
        uint64_t v6 = *(void *)(a1 + 40),
        v4,
        v3,
        v5 == v6))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v8 = [WeakRetained delegate];
    [v8 toggleEmphasis];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v8 = [WeakRetained delegate];
    [v8 toggleEmphasisWithType:*(void *)(a1 + 40)];
  }

  id v9 = objc_loadWeakRetained((id *)(a1 + 32));
  [v9 setUpNonStyleButtons];
}

- (id)emphasisColorImageWithType:(int64_t)a3 bordered:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = ICColorForEmphasisColorType();
  if (v4)
  {
    uint64_t v6 = [MEMORY[0x263F825C8] labelColor];
    double v7 = 2.0;
    double v8 = 15.0;
  }
  else
  {
    uint64_t v6 = 0;
    double v7 = 0.0;
    double v8 = 13.0;
  }
  id v9 = objc_msgSend(MEMORY[0x263F827E8], "ic_makeCircularImageWithColor:diameter:borderColor:borderWidth:", v5, v6, v8, v7);

  return v9;
}

- (void)configureViewWithEmphasis
{
  v49[1] = *MEMORY[0x263EF8340];
  id v3 = [(ICStyleSelectorViewController *)self view];
  BOOL v4 = [v3 window];
  uint64_t v5 = [v4 windowScene];
  if ((unint64_t)([v5 interfaceOrientation] - 3) > 1) {
    int v6 = 0;
  }
  else {
    int v6 = ![(ICStyleSelectorViewController *)self isPopover];
  }

  double v7 = (void *)MEMORY[0x263F08938];
  double v8 = [(ICStyleSelectorViewController *)self emphasisContainer];
  id v9 = [(ICStyleSelectorViewController *)self biusContainer];
  id v10 = [v7 constraintWithItem:v8 attribute:5 relatedBy:0 toItem:v9 attribute:6 multiplier:1.0 constant:8.0];
  [(ICStyleSelectorViewController *)self setEmphasisContainerLeadingConstraint:v10];

  char v11 = (void *)MEMORY[0x263F08938];
  id v12 = [(ICStyleSelectorViewController *)self emphasisContainerLeadingConstraint];
  v49[0] = v12;
  uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:1];
  [v11 activateConstraints:v13];

  if (v6
    && ([(ICStyleSelectorViewController *)self emphasisContainerTrailingConstraint], id v14 = objc_claimAutoreleasedReturnValue(), v14, v14))
  {
    uint64_t v15 = (void *)MEMORY[0x263F08938];
    uint64_t v16 = [(ICStyleSelectorViewController *)self emphasisContainerTrailingConstraint];
    v48 = v16;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v48 count:1];
    [v15 deactivateConstraints:v17];

    double v18 = (void *)MEMORY[0x263F08938];
    double v19 = [(ICStyleSelectorViewController *)self emphasisButton];
    BOOL v20 = [(ICStyleSelectorViewController *)self boldButton];
    id v21 = [v18 constraintWithItem:v19 attribute:7 relatedBy:0 toItem:v20 attribute:7 multiplier:0.9 constant:0.0];
    [(ICStyleSelectorViewController *)self setEmphasisButtonWidthConstraint:v21];

    objc_super v22 = (void *)MEMORY[0x263F08938];
    v23 = [(ICStyleSelectorViewController *)self emphasisColorPickerButton];
    v24 = [(ICStyleSelectorViewController *)self emphasisButton];
    v25 = [v22 constraintWithItem:v23 attribute:7 relatedBy:0 toItem:v24 attribute:7 multiplier:0.75 constant:0.0];
    [(ICStyleSelectorViewController *)self setEmphasisColorPickerButtonWidthConstraint:v25];

    v26 = (void *)MEMORY[0x263F08938];
    v27 = [(ICStyleSelectorViewController *)self emphasisButtonWidthConstraint];
    v47[0] = v27;
    v28 = [(ICStyleSelectorViewController *)self emphasisColorPickerButtonWidthConstraint];
    v47[1] = v28;
    v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:2];
    [v26 activateConstraints:v29];
  }
  else
  {
    v30 = [(ICStyleSelectorViewController *)self emphasisButtonWidthConstraint];

    if (v30)
    {
      v31 = (void *)MEMORY[0x263F08938];
      v32 = [(ICStyleSelectorViewController *)self emphasisButtonWidthConstraint];
      v46 = v32;
      v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
      [v31 deactivateConstraints:v33];
    }
    v34 = [(ICStyleSelectorViewController *)self emphasisColorPickerButtonWidthConstraint];

    if (v34)
    {
      v35 = (void *)MEMORY[0x263F08938];
      v36 = [(ICStyleSelectorViewController *)self emphasisColorPickerButtonWidthConstraint];
      id v45 = v36;
      v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
      [v35 deactivateConstraints:v37];
    }
    v38 = [(ICStyleSelectorViewController *)self emphasisContainerTrailingConstraint];

    if (!v38)
    {
      id v39 = (void *)MEMORY[0x263F08938];
      v40 = [(ICStyleSelectorViewController *)self emphasisContainer];
      id v41 = [(ICStyleSelectorViewController *)self blockQuoteButton];
      v42 = [v39 constraintWithItem:v40 attribute:6 relatedBy:0 toItem:v41 attribute:6 multiplier:1.0 constant:0.0];
      [(ICStyleSelectorViewController *)self setEmphasisContainerTrailingConstraint:v42];
    }
    id v43 = (void *)MEMORY[0x263F08938];
    v27 = [(ICStyleSelectorViewController *)self emphasisContainerTrailingConstraint];
    v44 = v27;
    v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v44 count:1];
    [v43 activateConstraints:v28];
  }
}

- (BOOL)isPopover
{
  v2 = [(ICStyleSelectorViewController *)self popoverPresentationController];
  if (v2) {
    char v3 = 1;
  }
  else {
    char v3 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
  }

  return v3;
}

- (void)scrollCurrentStyleToVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(ICStyleSelectorViewController *)self currentStyles];
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    double v7 = [(ICStyleSelectorViewController *)self styleSelectionHighlight];
    [v7 frame];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;

    uint64_t v16 = [(ICStyleSelectorViewController *)self styleScrollView];
    [v16 contentSize];
    CGFloat v18 = v17;
    double v19 = [(ICStyleSelectorViewController *)self styleScrollView];
    [v19 contentSize];
    v29.size.double height = v20;
    v29.origin.double x = 0.0;
    v29.origin.double y = 0.0;
    v27.origin.double x = v9;
    v27.origin.double y = v11;
    v27.size.double width = v13;
    v27.size.double height = v15;
    v29.size.double width = v18;
    CGRect v28 = CGRectIntersection(v27, v29);
    double x = v28.origin.x;
    double y = v28.origin.y;
    double width = v28.size.width;
    double height = v28.size.height;

    id v25 = [(ICStyleSelectorViewController *)self styleScrollView];
    objc_msgSend(v25, "scrollRectToVisible:animated:", v3, x, y, width, height);
  }
}

- (id)fontForICTTNamedStyle:(unsigned int)a3
{
  BOOL v4 = [(ICStyleSelectorViewController *)self traitCollection];
  uint64_t v5 = [v4 preferredContentSizeCategory];

  uint64_t v6 = (void *)fontForICTTNamedStyle__validCategories;
  if (!fontForICTTNamedStyle__validCategories)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F83458], *MEMORY[0x263F83488], *MEMORY[0x263F83470], *MEMORY[0x263F83468], *MEMORY[0x263F83450], *MEMORY[0x263F83440], *MEMORY[0x263F83430], 0);
    double v8 = (void *)fontForICTTNamedStyle__validCategories;
    fontForICTTNamedStyle__validCategories = v7;

    uint64_t v6 = (void *)fontForICTTNamedStyle__validCategories;
  }
  if (([v6 containsObject:v5] & 1) == 0)
  {
    id v9 = (id)*MEMORY[0x263F83430];

    uint64_t v5 = v9;
  }
  switch(a3)
  {
    case 0u:
      uint64_t v10 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForTitleTextWithContentSizeCategory:", v5);
      goto LABEL_11;
    case 1u:
      objc_msgSend(MEMORY[0x263F81708], "ic_pointSizeForBodyTextWithContentSizeCategory:", v5);
      double v12 = [MEMORY[0x263F81708] systemFontOfSize:round(v11 * *MEMORY[0x263F5B558]) weight:*MEMORY[0x263F81828]];
      CGFloat v13 = objc_msgSend(v12, "ic_fontWithSingleLineA");

      goto LABEL_12;
    case 2u:
      uint64_t v10 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForSubheadingTextWithContentSizeCategory:", v5);
      goto LABEL_11;
    case 4u:
      uint64_t v10 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForFixedWidthTextWithContentSizeCategory:", v5);
      goto LABEL_11;
    default:
      uint64_t v10 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForBodyTextWithContentSizeCategory:", v5);
LABEL_11:
      CGFloat v13 = (void *)v10;
LABEL_12:

      return v13;
  }
}

- (void)updateHeaderVisibility
{
  BOOL v3 = [(ICStyleSelectorViewController *)self isPopover];
  BOOL v4 = [(ICStyleSelectorViewController *)self headerView];
  uint64_t v5 = v4;
  if (v3)
  {
    [v4 setHidden:1];

    uint64_t v6 = [(ICStyleSelectorViewController *)self navigationBar];
    [v6 setHidden:0];

    uint64_t v7 = [(ICStyleSelectorViewController *)self view];
    [v7 safeAreaInsets];
    double v9 = v8;

    uint64_t v10 = [(ICStyleSelectorViewController *)self navigationBar];
    [v10 frame];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v29.origin.double x = v12;
    v29.origin.double y = v14;
    v29.size.double width = v16;
    v29.size.double height = v18;
    double MinX = CGRectGetMinX(v29);
    v30.origin.double x = v12;
    v30.origin.double y = v14;
    v30.size.double width = v16;
    v30.size.double height = v18;
    double MinY = CGRectGetMinY(v30);
    v31.origin.double x = v12;
    v31.origin.double y = v14;
    v31.size.double width = v16;
    v31.size.double height = v18;
    double Width = CGRectGetWidth(v31);
    objc_super v22 = [(ICStyleSelectorViewController *)self navigationBar];
    objc_msgSend(v22, "setFrame:", MinX, MinY, Width, v9 + 50.0);

    id v27 = objc_alloc_init(MEMORY[0x263F829A8]);
    objc_msgSend(v27, "setTitlePositionAdjustment:", 0.0, v9);
    v23 = [(ICStyleSelectorViewController *)self navigationBar];
    [v23 setStandardAppearance:v27];

    [(ICStyleSelectorViewController *)self configureForPopover];
  }
  else
  {
    [v4 setHidden:0];

    v24 = [(ICStyleSelectorViewController *)self navigationBar];
    [v24 setHidden:1];

    id v27 = [(ICStyleSelectorViewController *)self headerView];
    [v27 frame];
    CGFloat v25 = CGRectGetMaxY(v32) + 4.0;
    v26 = [(ICStyleSelectorViewController *)self scrollViewTopConstraint];
    [v26 setConstant:v25];
  }
}

- (void)configureForOrientation
{
  v35[3] = *MEMORY[0x263EF8340];
  BOOL v3 = [(ICStyleSelectorViewController *)self view];
  BOOL v4 = [v3 window];
  uint64_t v5 = [v4 windowScene];
  if ((unint64_t)([v5 interfaceOrientation] - 3) > 1) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = [(ICStyleSelectorViewController *)self isPopover] ^ 1;
  }

  if (v6 != [(ICStyleSelectorViewController *)self configuredForLandscape])
  {
    uint64_t v7 = [(ICStyleSelectorViewController *)self listsContainerLeadingConstraintLandscape];

    if (!v7)
    {
      double v8 = [(ICStyleSelectorViewController *)self biusContainerTopConstraintLandscape];

      if (v8) {
        objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.biusContainerTopConstraintLandscape) == nil)", "-[ICStyleSelectorViewController configureForOrientation]", 1, 0, @"Expected nil value for '%s'", "self.biusContainerTopConstraintLandscape");
      }
      double v9 = [(ICStyleSelectorViewController *)self boldButtonWidthConstraintLandscape];

      if (v9) {
        objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((self.boldButtonWidthConstraintLandscape) == nil)", "-[ICStyleSelectorViewController configureForOrientation]", 1, 0, @"Expected nil value for '%s'", "self.boldButtonWidthConstraintLandscape");
      }
      if (ICInternalSettingsIsEmphasisEnabled()) {
        [(ICStyleSelectorViewController *)self emphasisContainer];
      }
      else {
      uint64_t v10 = [(ICStyleSelectorViewController *)self biusContainer];
      }
      double v11 = (void *)MEMORY[0x263F08938];
      CGFloat v12 = [(ICStyleSelectorViewController *)self listsContainer];
      double v13 = [v11 constraintWithItem:v12 attribute:5 relatedBy:0 toItem:v10 attribute:6 multiplier:1.0 constant:8.0];
      [(ICStyleSelectorViewController *)self setListsContainerLeadingConstraintLandscape:v13];

      CGFloat v14 = (void *)MEMORY[0x263F08938];
      double v15 = [(ICStyleSelectorViewController *)self biusContainer];
      CGFloat v16 = [(ICStyleSelectorViewController *)self listsContainer];
      double v17 = [v14 constraintWithItem:v15 attribute:3 relatedBy:0 toItem:v16 attribute:3 multiplier:1.0 constant:0.0];
      [(ICStyleSelectorViewController *)self setBiusContainerTopConstraintLandscape:v17];

      CGFloat v18 = (void *)MEMORY[0x263F08938];
      double v19 = [(ICStyleSelectorViewController *)self boldButton];
      CGFloat v20 = [(ICStyleSelectorViewController *)self dashedListButton];
      id v21 = [v18 constraintWithItem:v19 attribute:7 relatedBy:0 toItem:v20 attribute:7 multiplier:1.0 constant:0.0];
      [(ICStyleSelectorViewController *)self setBoldButtonWidthConstraintLandscape:v21];
    }
    objc_super v22 = [(ICStyleSelectorViewController *)self scrollViewHeightConstraint];
    [v22 setConstant:48.0];

    if (v6) {
      float v23 = 751.0;
    }
    else {
      float v23 = 749.0;
    }
    v24 = [(ICStyleSelectorViewController *)self listsContainerLeadingConstraintLandscape];
    *(float *)&double v25 = v23;
    [v24 setPriority:v25];

    v26 = [(ICStyleSelectorViewController *)self biusContainerTopConstraintLandscape];
    *(float *)&double v27 = v23;
    [v26 setPriority:v27];

    CGRect v28 = [(ICStyleSelectorViewController *)self boldButtonWidthConstraintLandscape];
    *(float *)&double v29 = v23;
    [v28 setPriority:v29];

    if (!v7)
    {
      CGRect v30 = (void *)MEMORY[0x263F08938];
      CGRect v31 = [(ICStyleSelectorViewController *)self listsContainerLeadingConstraintLandscape];
      v35[0] = v31;
      CGRect v32 = [(ICStyleSelectorViewController *)self biusContainerTopConstraintLandscape];
      v35[1] = v32;
      v33 = [(ICStyleSelectorViewController *)self boldButtonWidthConstraintLandscape];
      v35[2] = v33;
      v34 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:3];
      [v30 activateConstraints:v34];
    }
    [(ICStyleSelectorViewController *)self populateStyleScrollView];
    [(ICStyleSelectorViewController *)self updateNamedStyleSelectedState];
    [(ICStyleSelectorViewController *)self updateStyleSelectionHighlightAnimated:0];
    [(ICStyleSelectorViewController *)self setConfiguredForLandscape:v6];
  }
}

- (void)updateStyleSelectionHighlightAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v42 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(ICStyleSelectorViewController *)self styleSelectionHighlight];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  CGFloat v14 = [(ICStyleSelectorViewController *)self currentStyles];
  uint64_t v15 = [v14 firstIndex];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  CGFloat v16 = [(ICStyleSelectorViewController *)self styleButtons];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        if ([*(id *)(*((void *)&v37 + 1) + 8 * i) tag] == v15)
        {
          int v21 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v37 objects:v41 count:16];
      if (v18) {
        continue;
      }
      break;
    }
  }
  int v21 = 0;
LABEL_11:

  objc_super v22 = [(ICStyleSelectorViewController *)self currentStyles];
  uint64_t v23 = [v22 count];

  double v24 = 0.0;
  if (v21 && v23 == 1)
  {
    double v25 = [(ICStyleSelectorViewController *)self styleButtonForStyle:v15];
    [v25 frame];
    double v7 = v26;
    double v9 = v27;
    double v11 = v28;
    double v13 = v29;

    double v24 = 1.0;
  }
  CGRect v30 = [(ICStyleSelectorViewController *)self styleSelectionHighlight];
  CGRect v31 = v30;
  if (v3)
  {
    [v30 alpha];
    double v33 = v32;

    if (v24 != 0.0 && v33 == 0.0)
    {
      v34 = [(ICStyleSelectorViewController *)self styleSelectionHighlight];
      objc_msgSend(v34, "setFrame:", v7, v9, v11, v13);
    }
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __71__ICStyleSelectorViewController_updateStyleSelectionHighlightAnimated___block_invoke;
    v36[3] = &unk_2640B9F78;
    v36[4] = self;
    *(double *)&v36[5] = v7;
    *(double *)&v36[6] = v9;
    *(double *)&v36[7] = v11;
    *(double *)&v36[8] = v13;
    *(double *)&v36[9] = v24;
    [MEMORY[0x263F82E00] _animateUsingSpringWithDuration:0 delay:v36 options:0 mass:2.0 stiffness:0.0 damping:1.0 initialVelocity:500.0 animations:37.0 completion:0.0];
  }
  else
  {
    objc_msgSend(v30, "setFrame:", v7, v9, v11, v13);

    v35 = [(ICStyleSelectorViewController *)self styleSelectionHighlight];
    [v35 setAlpha:v24];
  }
}

void __71__ICStyleSelectorViewController_updateStyleSelectionHighlightAnimated___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = [*(id *)(a1 + 32) styleSelectionHighlight];
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  double v7 = *(double *)(a1 + 72);
  id v8 = [*(id *)(a1 + 32) styleSelectionHighlight];
  [v8 setAlpha:v7];
}

- (void)updateNamedStyleSelectedState
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  double v3 = [(ICStyleSelectorViewController *)self currentStyles];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    double v5 = [(ICStyleSelectorViewController *)self currentStyles];
    int v6 = [v5 firstIndex];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    double v7 = [(ICStyleSelectorViewController *)self styleButtons];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "setSelected:", objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "tag") == v6);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v9);
    }
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v7 = [(ICStyleSelectorViewController *)self styleButtons];
    uint64_t v12 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * j) setSelected:0];
        }
        uint64_t v13 = [v7 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v13);
    }
  }
}

- (void)updateListStyleSelectedState
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v3 = [(ICStyleSelectorViewController *)self listsContainer];
  uint64_t v4 = [v3 subviews];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        uint64_t v9 = ICDynamicCast();
        if (v9)
        {
          uint64_t v10 = [(ICStyleSelectorViewController *)self currentStyles];
          if ([v10 count] == 1)
          {
            uint64_t v11 = [v9 tag];
            uint64_t v12 = [(ICStyleSelectorViewController *)self currentStyles];
            objc_msgSend(v9, "setSelected:", v11 == objc_msgSend(v12, "firstIndex"));
          }
          else
          {
            [v9 setSelected:0];
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (void)populateStyleScrollView
{
  double v3 = [(ICStyleSelectorViewController *)self traitCollection];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__ICStyleSelectorViewController_populateStyleScrollView__block_invoke;
  v4[3] = &unk_2640B8140;
  v4[4] = self;
  objc_msgSend(v3, "ic_performAsCurrent:", v4);
}

void __56__ICStyleSelectorViewController_populateStyleScrollView__block_invoke(uint64_t a1)
{
  uint64_t v67 = *MEMORY[0x263EF8340];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v1 = [*(id *)(a1 + 32) styleButtons];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v60 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v59 + 1) + 8 * i) removeFromSuperview];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v59 objects:v66 count:16];
    }
    while (v3);
  }

  v48 = [MEMORY[0x263EFF980] array];
  uint64_t v6 = [*(id *)(a1 + 32) delegate];
  int v7 = [v6 styleSelectorShouldDisableTextStyles:*(void *)(a1 + 32)];

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) styles];
  uint64_t v49 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
  if (v49)
  {
    unsigned int v47 = v7 ^ 1;
    CGFloat x = *MEMORY[0x263F001A8];
    CGFloat y = *(double *)(MEMORY[0x263F001A8] + 8);
    CGFloat width = *(double *)(MEMORY[0x263F001A8] + 16);
    CGFloat height = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v46 = *(void *)v56;
    uint64_t v45 = *MEMORY[0x263F814F0];
    uint64_t v44 = *MEMORY[0x263F81500];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v56 != v46) {
          objc_enumerationMutation(obj);
        }
        uint64_t v54 = v12;
        long long v13 = *(void **)(*((void *)&v55 + 1) + 8 * v12);
        uint64_t v63 = v45;
        long long v14 = objc_msgSend(*(id *)(a1 + 32), "fontForICTTNamedStyle:", objc_msgSend(v13, "ttStyle"));
        v64 = v14;
        v52 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];

        id v15 = objc_alloc(MEMORY[0x263F086A0]);
        long long v16 = [v13 name];
        long long v17 = (void *)[v15 initWithString:v16 attributes:v52];

        [v17 size];
        double v19 = v18;
        [*(id *)(a1 + 32) styleButtonPadding];
        CGFloat v21 = v19 + v20 * 2.0;
        v68.origin.CGFloat x = x;
        v68.origin.CGFloat y = y;
        v68.size.CGFloat width = width;
        v68.size.CGFloat height = height;
        CGFloat MaxX = CGRectGetMaxX(v68);
        long long v23 = [*(id *)(a1 + 32) scrollViewHeightConstraint];
        [v23 constant];
        CGFloat v25 = v24;

        v69.origin.CGFloat y = 0.0;
        v69.origin.CGFloat x = MaxX;
        v69.size.CGFloat width = v21;
        v69.size.CGFloat height = v25;
        CGRect v70 = CGRectIntegral(v69);
        CGFloat x = v70.origin.x;
        CGFloat y = v70.origin.y;
        CGFloat width = v70.size.width;
        CGFloat height = v70.size.height;
        uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x263F824E8]), "initWithFrame:", v70.origin.x, v70.origin.y, v70.size.width, v70.size.height);
        objc_msgSend(v26, "setTag:", objc_msgSend(v13, "ttStyle"));
        id v51 = [MEMORY[0x263F825C8] labelColor];
        v50 = [MEMORY[0x263F825C8] secondaryLabelColor];
        double v27 = [MEMORY[0x263F825C8] systemWhiteColor];
        double v28 = [MEMORY[0x263F825C8] systemGrayColor];
        uint64_t v29 = [v17 length];
        CGRect v30 = (void *)[v17 mutableCopy];
        objc_msgSend(v30, "addAttribute:value:range:", v44, v51, 0, v29);
        [v26 setAttributedTitle:v30 forState:0];
        CGRect v31 = (void *)[v17 mutableCopy];
        objc_msgSend(v31, "addAttribute:value:range:", v44, v50, 0, v29);
        [v26 setAttributedTitle:v31 forState:1];
        double v32 = (void *)[v17 mutableCopy];
        objc_msgSend(v32, "addAttribute:value:range:", v44, v27, 0, v29);
        [v26 setAttributedTitle:v32 forState:4];
        double v33 = (void *)[v17 mutableCopy];
        objc_msgSend(v33, "addAttribute:value:range:", v44, v28, 0, v29);
        [v26 setAttributedTitle:v33 forState:2];
        [v26 addTarget:*(void *)(a1 + 32) action:sel_namedStyleButtonAction_ forControlEvents:64];
        [v26 setAdjustsImageSizeForAccessibilityContentSizeCategory:0];
        v34 = [v26 titleLabel];
        [v34 setTextAlignment:1];

        [v26 setEnabled:v47];
        [v48 addObject:v26];
        v35 = [*(id *)(a1 + 32) styleScrollView];
        [v35 addSubview:v26];

        uint64_t v12 = v54 + 1;
      }
      while (v49 != v54 + 1);
      uint64_t v49 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
    }
    while (v49);
  }

  v36 = [v48 lastObject];
  [v36 frame];
  double v37 = CGRectGetMaxX(v71);
  long long v38 = [*(id *)(a1 + 32) styleScrollView];
  [v38 frame];
  double v40 = v39;
  id v41 = [*(id *)(a1 + 32) styleScrollView];
  objc_msgSend(v41, "setContentSize:", v37, v40);

  uint64_t v42 = (void *)[v48 copy];
  [*(id *)(a1 + 32) setStyleButtons:v42];
}

- (void)namedStyleButtonAction:(id)a3
{
  uint64_t v4 = [a3 tag];

  [(ICStyleSelectorViewController *)self selectNamedStyle:v4];
}

- (void)selectNamedStyle:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v5 = [MEMORY[0x263F088D0] indexSetWithIndex:a3];
  [(ICStyleSelectorViewController *)self setCurrentStyles:v5 bius:[(ICStyleSelectorViewController *)self currentBIUS] animated:1];

  id v6 = [(ICStyleSelectorViewController *)self delegate];
  [v6 styleSelector:self didSelectStyle:v3];
}

- (id)styleButtonForStyle:(unsigned int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(ICStyleSelectorViewController *)self styleButtons];
  id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    uint64_t v7 = a3;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 tag] == v7)
        {
          id v5 = v9;
          goto LABEL_11;
        }
      }
      id v5 = (id)[v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (void)updateButtonEnabledState
{
  uint64_t v3 = [(ICStyleSelectorViewController *)self delegate];
  uint64_t v4 = [v3 styleSelectorCanIndentLeft:self];

  id v5 = [(ICStyleSelectorViewController *)self indentLeftButton];
  [v5 setEnabled:v4];

  uint64_t v6 = [(ICStyleSelectorViewController *)self delegate];
  uint64_t v7 = [v6 styleSelectorCanIndentRight:self];

  uint64_t v8 = [(ICStyleSelectorViewController *)self indentRightButton];
  [v8 setEnabled:v7];

  UIAccessibilityNotifications v9 = *MEMORY[0x263F831C0];

  UIAccessibilityPostNotification(v9, 0);
}

- (void)setUpNonStyleButtons
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(ICStyleSelectorViewController *)self delegate];
  uint64_t v4 = [v3 presentingViewControllerForStyleSelector:self];
  id v5 = [v4 view];
  CGRect v31 = [v5 tintColor];

  if (ICInternalSettingsIsEmphasisEnabled())
  {
    long long v47 = 0uLL;
    long long v48 = 0uLL;
    long long v45 = 0uLL;
    long long v46 = 0uLL;
    uint64_t v6 = [(ICStyleSelectorViewController *)self biusContainer];
    v52[0] = v6;
    uint64_t v7 = [(ICStyleSelectorViewController *)self emphasisContainer];
    v52[1] = v7;
    uint64_t v8 = [(ICStyleSelectorViewController *)self listsContainer];
    v52[2] = v8;
    UIAccessibilityNotifications v9 = [(ICStyleSelectorViewController *)self indentationContainer];
    v52[3] = v9;
    uint64_t v10 = [(ICStyleSelectorViewController *)self blockQuoteContainer];
    void v52[4] = v10;
    long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:5];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v46 != v13) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v45 + 1) + 8 * i), "ic_applyRoundedCorners", v31);
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v12);
    }
  }
  else
  {
    long long v43 = 0uLL;
    long long v44 = 0uLL;
    long long v41 = 0uLL;
    long long v42 = 0uLL;
    id v15 = [(ICStyleSelectorViewController *)self biusContainer];
    v50[0] = v15;
    uint64_t v16 = [(ICStyleSelectorViewController *)self listsContainer];
    v50[1] = v16;
    long long v17 = [(ICStyleSelectorViewController *)self indentationContainer];
    v50[2] = v17;
    double v18 = [(ICStyleSelectorViewController *)self blockQuoteContainer];
    v50[3] = v18;
    long long v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:4];

    uint64_t v19 = [v11 countByEnumeratingWithState:&v41 objects:v51 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v42;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(v11);
          }
          objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * j), "ic_applyRoundedCorners", v31);
        }
        uint64_t v19 = [v11 countByEnumeratingWithState:&v41 objects:v51 count:16];
      }
      while (v19);
    }
  }

  objc_initWeak(&location, self);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v22 = [(ICStyleSelectorViewController *)self nonStyleButtons];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v23; ++k)
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void **)(*((void *)&v36 + 1) + 8 * k);
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __53__ICStyleSelectorViewController_setUpNonStyleButtons__block_invoke;
        v32[3] = &unk_2640B9FA0;
        id v33 = v31;
        objc_copyWeak(&v35, &location);
        v34 = self;
        [v26 setConfigurationUpdateHandler:v32];
        objc_destroyWeak(&v35);
      }
      uint64_t v23 = [v22 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v23);
  }

  double v27 = [(ICStyleSelectorViewController *)self styleSelectionHighlight];
  [v27 setBackgroundColor:v31];

  double v28 = [(ICStyleSelectorViewController *)self indentationContainer];
  [v28 setSemanticContentAttribute:3];

  uint64_t v29 = [(ICStyleSelectorViewController *)self indentLeftButton];
  [v29 setSemanticContentAttribute:3];

  CGRect v30 = [(ICStyleSelectorViewController *)self indentRightButton];
  [v30 setSemanticContentAttribute:3];

  objc_destroyWeak(&location);
}

void __53__ICStyleSelectorViewController_setUpNonStyleButtons__block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  uint64_t v3 = [MEMORY[0x263F824F0] plainButtonConfiguration];
  uint64_t v4 = [MEMORY[0x263F82498] clearConfiguration];
  if ([v15 isSelected])
  {
    [v4 setBackgroundColor:*(void *)(a1 + 32)];
  }
  else
  {
    if ([v15 isHighlighted]) {
      [MEMORY[0x263F825C8] systemFillColor];
    }
    else {
    id v5 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
    }
    [v4 setBackgroundColor:v5];
  }
  [v3 setBackground:v4];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = [WeakRetained imageForButton:v15];
  [v3 setImage:v7];

  [v15 setConfiguration:v3];
  id v8 = [*(id *)(a1 + 40) blockQuoteButton];

  if (v8 == v15)
  {
    [v15 setEnabled:1];
  }
  else
  {
    UIAccessibilityNotifications v9 = [*(id *)(a1 + 40) delegate];
    objc_msgSend(v15, "setEnabled:", objc_msgSend(v9, "styleSelectorShouldDisableTextStyles:", *(void *)(a1 + 40)) ^ 1);
  }
  if ([v15 isSelected]) {
    [MEMORY[0x263F825C8] systemWhiteColor];
  }
  else {
  uint64_t v10 = [MEMORY[0x263F825C8] labelColor];
  }
  [v15 setTintColor:v10];

  id v11 = [*(id *)(a1 + 40) emphasisColorPickerButton];

  if (v11 == v15)
  {
    ic_currentEmphasisColorTypeDefault();
    uint64_t v12 = NSStringForEmphasisColorType();
    if ([v12 length]) {
      uint64_t v13 = v12;
    }
    else {
      uint64_t v13 = 0;
    }
    long long v14 = [*(id *)(a1 + 40) emphasisColorPickerButton];
    [v14 setAccessibilityValue:v13];
  }
}

- (id)imageNameForButton:(id)a3
{
  id v4 = a3;
  id v5 = [(ICStyleSelectorViewController *)self boldButton];

  if (v5 == v4)
  {
    uint64_t v16 = @"bold";
  }
  else
  {
    id v6 = [(ICStyleSelectorViewController *)self italicButton];

    if (v6 == v4)
    {
      uint64_t v16 = @"italic";
    }
    else
    {
      id v7 = [(ICStyleSelectorViewController *)self underlineButton];

      if (v7 == v4)
      {
        uint64_t v16 = @"underline";
      }
      else
      {
        id v8 = [(ICStyleSelectorViewController *)self strikethroughButton];

        if (v8 == v4)
        {
          uint64_t v16 = @"strikethrough";
        }
        else
        {
          id v9 = [(ICStyleSelectorViewController *)self dashedListButton];

          if (v9 == v4)
          {
            uint64_t v16 = @"list.dash";
          }
          else
          {
            id v10 = [(ICStyleSelectorViewController *)self numberedListButton];

            if (v10 == v4)
            {
              uint64_t v16 = @"list.number";
            }
            else
            {
              id v11 = [(ICStyleSelectorViewController *)self bulletedListButton];

              if (v11 == v4)
              {
                uint64_t v16 = @"list.bullet";
              }
              else
              {
                id v12 = [(ICStyleSelectorViewController *)self indentLeftButton];

                if (v12 == v4)
                {
                  uint64_t v16 = @"decrease.indent";
                }
                else
                {
                  id v13 = [(ICStyleSelectorViewController *)self indentRightButton];

                  if (v13 == v4)
                  {
                    uint64_t v16 = @"increase.indent";
                  }
                  else
                  {
                    id v14 = [(ICStyleSelectorViewController *)self blockQuoteButton];

                    if (v14 == v4)
                    {
                      uint64_t v16 = @"line.vertical.and.rectangle.fill";
                    }
                    else if (ICInternalSettingsIsEmphasisEnabled() {
                           && ([(ICStyleSelectorViewController *)self emphasisButton],
                    }
                               id v15 = (id)objc_claimAutoreleasedReturnValue(),
                               v15,
                               v15 == v4))
                    {
                      uint64_t v16 = @"highlighter";
                    }
                    else
                    {
                      if (ICInternalSettingsIsEmphasisEnabled())
                      {
                        [(ICStyleSelectorViewController *)self emphasisColorPickerButton];
                      }
                      uint64_t v16 = 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v16;
}

- (id)imageForButton:(id)a3
{
  v34[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(ICStyleSelectorViewController *)self emphasisColorPickerButton];

  if (v5 != v4)
  {
    id v6 = [(ICStyleSelectorViewController *)self imageNameForButton:v4];
    if (!v6)
    {
      id v12 = 0;
      goto LABEL_26;
    }
    id v7 = (id)*MEMORY[0x263F83628];
    id v8 = (id)*MEMORY[0x263F83430];
    id v9 = [(ICStyleSelectorViewController *)self biusContainer];
    id v10 = [v9 subviews];
    int v11 = [v10 containsObject:v4];

    if (v11)
    {
      id v12 = objc_msgSend(MEMORY[0x263F827E8], "ic_systemImageNamed:textStyle:scale:maxContentSizeCategory:", v6, v7, 3, v8);
LABEL_25:

      goto LABEL_26;
    }
    id v16 = [(ICStyleSelectorViewController *)self blockQuoteButton];

    char v17 = [v4 isSelected];
    if (v16 != v4)
    {
      if (v17)
      {
        double v18 = [MEMORY[0x263F825C8] systemWhiteColor];
        CGRect v31 = v18;
        uint64_t v19 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v20 = &v31;
      }
      else
      {
        if ([v4 isEnabled])
        {
          double v18 = [MEMORY[0x263F825C8] labelColor];
          v30[0] = v18;
          uint64_t v24 = [MEMORY[0x263F825C8] secondaryLabelColor];
          v30[1] = v24;
          CGFloat v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:2];

LABEL_20:
          uint64_t v27 = objc_msgSend(MEMORY[0x263F827E8], "ic_hierarchicalSystemImageNamed:colors:fontTextStyle:scale:maxContentSizeCategory:", v6, v25, v7, 3, v8);
LABEL_24:
          id v12 = (void *)v27;

          goto LABEL_25;
        }
        double v18 = [MEMORY[0x263F825C8] secondaryLabelColor];
        uint64_t v29 = v18;
        uint64_t v19 = (void *)MEMORY[0x263EFF8C0];
        uint64_t v20 = &v29;
      }
      CGFloat v25 = [v19 arrayWithObjects:v20 count:1];
      goto LABEL_20;
    }
    if (v17)
    {
      CGFloat v21 = [MEMORY[0x263F825C8] systemWhiteColor];
      v34[0] = v21;
      long long v22 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v23 = (void **)v34;
    }
    else
    {
      if ([v4 isEnabled])
      {
        CGFloat v21 = [MEMORY[0x263F825C8] labelColor];
        v33[0] = v21;
        uint64_t v26 = [MEMORY[0x263F825C8] tertiaryLabelColor];
        v33[1] = v26;
        CGFloat v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:2];

LABEL_23:
        uint64_t v27 = objc_msgSend(MEMORY[0x263F827E8], "ic_hierarchicalNonSystemImageNamed:colors:fontTextStyle:scale:maxContentSizeCategory:", v6, v25, *MEMORY[0x263F83570], 3, *MEMORY[0x263F83450]);
        goto LABEL_24;
      }
      CGFloat v21 = [MEMORY[0x263F825C8] tertiaryLabelColor];
      double v32 = v21;
      long long v22 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v23 = &v32;
    }
    CGFloat v25 = [v22 arrayWithObjects:v23 count:1];
    goto LABEL_23;
  }
  id v13 = [(ICStyleSelectorViewController *)self delegate];
  uint64_t v14 = [v13 currentEmphasisType];

  if (!v14) {
    ic_currentEmphasisColorTypeDefault();
  }
  id v15 = (void *)MEMORY[0x263F827E8];
  id v6 = ICColorForEmphasisColorType();
  id v12 = objc_msgSend(v15, "ic_makeCircularImageWithColor:diameter:", v6, 12.0);
LABEL_26:

  return v12;
}

- (void)applyAccessibilityInfo
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  if (UIAccessibilityIsVoiceOverRunning())
  {
    uint64_t v3 = [(ICStyleSelectorViewController *)self popoverPresentationController];
    [v3 setPassthroughViews:0];
  }
  id v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 localizedStringForKey:@"Hide format menu" value:&stru_26C10E100 table:0];
  id v6 = [(ICStyleSelectorViewController *)self closeButton];
  [v6 setAccessibilityLabel:v5];

  id v7 = [MEMORY[0x263F086E0] mainBundle];
  id v8 = [v7 localizedStringForKey:@"bold" value:&stru_26C10E100 table:0];
  id v9 = [(ICStyleSelectorViewController *)self boldButton];
  [v9 setAccessibilityLabel:v8];

  id v10 = [MEMORY[0x263F086E0] mainBundle];
  int v11 = [v10 localizedStringForKey:@"italic" value:&stru_26C10E100 table:0];
  id v12 = [(ICStyleSelectorViewController *)self italicButton];
  [v12 setAccessibilityLabel:v11];

  id v13 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v14 = [v13 localizedStringForKey:@"underline" value:&stru_26C10E100 table:0];
  id v15 = [(ICStyleSelectorViewController *)self underlineButton];
  [v15 setAccessibilityLabel:v14];

  id v16 = [MEMORY[0x263F086E0] mainBundle];
  char v17 = [v16 localizedStringForKey:@"strikethrough" value:&stru_26C10E100 table:0];
  double v18 = [(ICStyleSelectorViewController *)self strikethroughButton];
  [v18 setAccessibilityLabel:v17];

  uint64_t v19 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v20 = [v19 localizedStringForKey:@"dashed list" value:&stru_26C10E100 table:0];
  CGFloat v21 = [(ICStyleSelectorViewController *)self dashedListButton];
  [v21 setAccessibilityLabel:v20];

  long long v22 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v23 = [v22 localizedStringForKey:@"numbered list" value:&stru_26C10E100 table:0];
  uint64_t v24 = [(ICStyleSelectorViewController *)self numberedListButton];
  [v24 setAccessibilityLabel:v23];

  CGFloat v25 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v26 = [v25 localizedStringForKey:@"bulleted list" value:&stru_26C10E100 table:0];
  uint64_t v27 = [(ICStyleSelectorViewController *)self bulletedListButton];
  [v27 setAccessibilityLabel:v26];

  double v28 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v29 = [v28 localizedStringForKey:@"outdent" value:&stru_26C10E100 table:0];
  CGRect v30 = [(ICStyleSelectorViewController *)self indentLeftButton];
  [v30 setAccessibilityLabel:v29];

  CGRect v31 = [MEMORY[0x263F086E0] mainBundle];
  double v32 = [v31 localizedStringForKey:@"indent" value:&stru_26C10E100 table:0];
  id v33 = [(ICStyleSelectorViewController *)self indentRightButton];
  [v33 setAccessibilityLabel:v32];

  v34 = [MEMORY[0x263F086E0] mainBundle];
  id v35 = [v34 localizedStringForKey:@"block quote" value:&stru_26C10E100 table:0];
  long long v36 = [(ICStyleSelectorViewController *)self blockQuoteButton];
  [v36 setAccessibilityLabel:v35];

  long long v37 = [MEMORY[0x263F086E0] mainBundle];
  long long v38 = [v37 localizedStringForKey:@"Highlight" value:&stru_26C10E100 table:0];
  long long v39 = [(ICStyleSelectorViewController *)self emphasisButton];
  [v39 setAccessibilityLabel:v38];

  double v40 = [MEMORY[0x263F086E0] mainBundle];
  long long v41 = [v40 localizedStringForKey:@"Highlight color" value:&stru_26C10E100 table:0];
  long long v42 = [(ICStyleSelectorViewController *)self emphasisColorPickerButton];
  [v42 setAccessibilityLabel:v41];

  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v43 = [(ICStyleSelectorViewController *)self styleButtons];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v75 objects:v79 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v76;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v76 != v46) {
          objc_enumerationMutation(v43);
        }
        [*(id *)(*((void *)&v75 + 1) + 8 * v47++) _accessibilitySetIsSpeakThisElement:1];
      }
      while (v45 != v47);
      uint64_t v45 = [v43 countByEnumeratingWithState:&v75 objects:v79 count:16];
    }
    while (v45);
  }

  long long v48 = [(ICStyleSelectorViewController *)self boldButton];
  [v48 _accessibilitySetIsSpeakThisElement:1];

  uint64_t v49 = [(ICStyleSelectorViewController *)self italicButton];
  [v49 _accessibilitySetIsSpeakThisElement:1];

  v50 = [(ICStyleSelectorViewController *)self underlineButton];
  [v50 _accessibilitySetIsSpeakThisElement:1];

  id v51 = [(ICStyleSelectorViewController *)self strikethroughButton];
  [v51 _accessibilitySetIsSpeakThisElement:1];

  v52 = [(ICStyleSelectorViewController *)self dashedListButton];
  [v52 _accessibilitySetIsSpeakThisElement:1];

  id v53 = [(ICStyleSelectorViewController *)self numberedListButton];
  [v53 _accessibilitySetIsSpeakThisElement:1];

  uint64_t v54 = [(ICStyleSelectorViewController *)self bulletedListButton];
  [v54 _accessibilitySetIsSpeakThisElement:1];

  long long v55 = [(ICStyleSelectorViewController *)self indentLeftButton];
  [v55 _accessibilitySetIsSpeakThisElement:1];

  long long v56 = [(ICStyleSelectorViewController *)self indentRightButton];
  [v56 _accessibilitySetIsSpeakThisElement:1];

  long long v57 = [(ICStyleSelectorViewController *)self blockQuoteButton];
  [v57 _accessibilitySetIsSpeakThisElement:1];

  long long v58 = [(ICStyleSelectorViewController *)self emphasisButton];
  [v58 _accessibilitySetIsSpeakThisElement:1];

  long long v59 = [(ICStyleSelectorViewController *)self emphasisColorPickerButton];
  [v59 _accessibilitySetIsSpeakThisElement:1];

  long long v60 = [(ICStyleSelectorViewController *)self headerView];
  [v60 setShowsLargeContentViewer:1];

  long long v61 = [(ICStyleSelectorViewController *)self headerView];
  id v62 = objc_alloc_init(MEMORY[0x263F828F8]);
  [v61 addInteraction:v62];

  uint64_t v63 = [(ICStyleSelectorViewController *)self headerLabel];
  v64 = [v63 text];
  v65 = [(ICStyleSelectorViewController *)self headerView];
  [v65 setLargeContentTitle:v64];

  v66 = [(ICStyleSelectorViewController *)self closeButton];
  [v66 setShowsLargeContentViewer:1];

  uint64_t v67 = [(ICStyleSelectorViewController *)self closeButton];
  id v68 = objc_alloc_init(MEMORY[0x263F828F8]);
  [v67 addInteraction:v68];

  CGRect v69 = [MEMORY[0x263F086E0] mainBundle];
  CGRect v70 = [v69 localizedStringForKey:@"Close" value:&stru_26C10E100 table:0];
  CGRect v71 = [(ICStyleSelectorViewController *)self closeButton];
  [v71 setLargeContentTitle:v70];

  v72 = [(ICStyleSelectorViewController *)self closeButton];
  v73 = [v72 currentImage];
  v74 = [(ICStyleSelectorViewController *)self closeButton];
  [v74 setLargeContentImage:v73];
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3.receiver = self;
  v3.super_class = (Class)ICStyleSelectorViewController;
  [(ICStyleSelectorViewController *)&v3 _accessibilityLoadAccessibilityInformation];
  [(ICStyleSelectorViewController *)self applyAccessibilityInfo];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICStyleSelectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICStyleSelectorDelegate *)WeakRetained;
}

- (unint64_t)currentBIUS
{
  return self->_currentBIUS;
}

- (NSIndexSet)currentStyles
{
  return self->_currentStyles;
}

- (void)setCurrentStyles:(id)a3
{
}

- (id)elementForAXFocusOnDismissal
{
  id WeakRetained = objc_loadWeakRetained(&self->_elementForAXFocusOnDismissal);

  return WeakRetained;
}

- (void)setElementForAXFocusOnDismissal:(id)a3
{
}

- (UIScrollView)styleScrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_styleScrollView);

  return (UIScrollView *)WeakRetained;
}

- (void)setStyleScrollView:(id)a3
{
}

- (NSArray)styleButtons
{
  return self->_styleButtons;
}

- (void)setStyleButtons:(id)a3
{
}

- (UIView)biusContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_biusContainer);

  return (UIView *)WeakRetained;
}

- (void)setBiusContainer:(id)a3
{
}

- (UIView)emphasisContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_emphasisContainer);

  return (UIView *)WeakRetained;
}

- (void)setEmphasisContainer:(id)a3
{
}

- (UIView)listsContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listsContainer);

  return (UIView *)WeakRetained;
}

- (void)setListsContainer:(id)a3
{
}

- (UIView)indentationContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indentationContainer);

  return (UIView *)WeakRetained;
}

- (void)setIndentationContainer:(id)a3
{
}

- (UIView)blockQuoteContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_blockQuoteContainer);

  return (UIView *)WeakRetained;
}

- (void)setBlockQuoteContainer:(id)a3
{
}

- (UIView)headerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerView);

  return (UIView *)WeakRetained;
}

- (void)setHeaderView:(id)a3
{
}

- (UILabel)headerLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_headerLabel);

  return (UILabel *)WeakRetained;
}

- (void)setHeaderLabel:(id)a3
{
}

- (UINavigationBar)navigationBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);

  return (UINavigationBar *)WeakRetained;
}

- (void)setNavigationBar:(id)a3
{
}

- (void)setBoldButton:(id)a3
{
}

- (void)setItalicButton:(id)a3
{
}

- (void)setUnderlineButton:(id)a3
{
}

- (void)setStrikethroughButton:(id)a3
{
}

- (UIButton)dashedListButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dashedListButton);

  return (UIButton *)WeakRetained;
}

- (void)setDashedListButton:(id)a3
{
}

- (UIButton)numberedListButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_numberedListButton);

  return (UIButton *)WeakRetained;
}

- (void)setNumberedListButton:(id)a3
{
}

- (UIButton)bulletedListButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bulletedListButton);

  return (UIButton *)WeakRetained;
}

- (void)setBulletedListButton:(id)a3
{
}

- (UIButton)indentLeftButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indentLeftButton);

  return (UIButton *)WeakRetained;
}

- (void)setIndentLeftButton:(id)a3
{
}

- (UIButton)indentRightButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_indentRightButton);

  return (UIButton *)WeakRetained;
}

- (void)setIndentRightButton:(id)a3
{
}

- (UIButton)blockQuoteButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_blockQuoteButton);

  return (UIButton *)WeakRetained;
}

- (void)setBlockQuoteButton:(id)a3
{
}

- (UIButton)emphasisButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_emphasisButton);

  return (UIButton *)WeakRetained;
}

- (void)setEmphasisButton:(id)a3
{
}

- (UIButton)emphasisColorPickerButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_emphasisColorPickerButton);

  return (UIButton *)WeakRetained;
}

- (void)setEmphasisColorPickerButton:(id)a3
{
}

- (UIButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (NSLayoutConstraint)listsContainerBottomConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listsContainerBottomConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setListsContainerBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)listsContainerTopConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listsContainerTopConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setListsContainerTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)biusContainerTopConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_biusContainerTopConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setBiusContainerTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrollViewTopConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewTopConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setScrollViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrollViewHeightConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrollViewHeightConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setScrollViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)listsContainerLeadingConstraintLandscape
{
  return self->_listsContainerLeadingConstraintLandscape;
}

- (void)setListsContainerLeadingConstraintLandscape:(id)a3
{
}

- (NSLayoutConstraint)biusContainerTopConstraintLandscape
{
  return self->_biusContainerTopConstraintLandscape;
}

- (void)setBiusContainerTopConstraintLandscape:(id)a3
{
}

- (NSLayoutConstraint)boldButtonWidthConstraintLandscape
{
  return self->_boldButtonWidthConstraintLandscape;
}

- (void)setBoldButtonWidthConstraintLandscape:(id)a3
{
}

- (NSLayoutConstraint)emphasisContainerLeadingConstraint
{
  return self->_emphasisContainerLeadingConstraint;
}

- (void)setEmphasisContainerLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)emphasisContainerTrailingConstraint
{
  return self->_emphasisContainerTrailingConstraint;
}

- (void)setEmphasisContainerTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)emphasisButtonWidthConstraint
{
  return self->_emphasisButtonWidthConstraint;
}

- (void)setEmphasisButtonWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)emphasisColorPickerButtonWidthConstraint
{
  return self->_emphasisColorPickerButtonWidthConstraint;
}

- (void)setEmphasisColorPickerButtonWidthConstraint:(id)a3
{
}

- (UIView)styleSelectionHighlight
{
  return self->_styleSelectionHighlight;
}

- (void)setStyleSelectionHighlight:(id)a3
{
}

- (NSArray)styles
{
  return self->_styles;
}

- (BOOL)configuredForLandscape
{
  return self->_configuredForLandscape;
}

- (void)setConfiguredForLandscape:(BOOL)a3
{
  self->_configuredForLandscape = a3;
}

- (BOOL)configuredForPopover
{
  return self->_configuredForPopover;
}

- (void)setConfiguredForPopover:(BOOL)a3
{
  self->_configuredForPopover = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styles, 0);
  objc_storeStrong((id *)&self->_styleSelectionHighlight, 0);
  objc_storeStrong((id *)&self->_emphasisColorPickerButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_emphasisButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_emphasisContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_emphasisContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_boldButtonWidthConstraintLandscape, 0);
  objc_storeStrong((id *)&self->_biusContainerTopConstraintLandscape, 0);
  objc_storeStrong((id *)&self->_listsContainerLeadingConstraintLandscape, 0);
  objc_destroyWeak((id *)&self->_scrollViewHeightConstraint);
  objc_destroyWeak((id *)&self->_scrollViewTopConstraint);
  objc_destroyWeak((id *)&self->_biusContainerTopConstraint);
  objc_destroyWeak((id *)&self->_listsContainerTopConstraint);
  objc_destroyWeak((id *)&self->_listsContainerBottomConstraint);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_destroyWeak((id *)&self->_emphasisColorPickerButton);
  objc_destroyWeak((id *)&self->_emphasisButton);
  objc_destroyWeak((id *)&self->_blockQuoteButton);
  objc_destroyWeak((id *)&self->_indentRightButton);
  objc_destroyWeak((id *)&self->_indentLeftButton);
  objc_destroyWeak((id *)&self->_bulletedListButton);
  objc_destroyWeak((id *)&self->_numberedListButton);
  objc_destroyWeak((id *)&self->_dashedListButton);
  objc_destroyWeak((id *)&self->_strikethroughButton);
  objc_destroyWeak((id *)&self->_underlineButton);
  objc_destroyWeak((id *)&self->_italicButton);
  objc_destroyWeak((id *)&self->_boldButton);
  objc_destroyWeak((id *)&self->_navigationBar);
  objc_destroyWeak((id *)&self->_headerLabel);
  objc_destroyWeak((id *)&self->_headerView);
  objc_destroyWeak((id *)&self->_blockQuoteContainer);
  objc_destroyWeak((id *)&self->_indentationContainer);
  objc_destroyWeak((id *)&self->_listsContainer);
  objc_destroyWeak((id *)&self->_emphasisContainer);
  objc_destroyWeak((id *)&self->_biusContainer);
  objc_storeStrong((id *)&self->_styleButtons, 0);
  objc_destroyWeak((id *)&self->_styleScrollView);
  objc_destroyWeak(&self->_elementForAXFocusOnDismissal);
  objc_storeStrong((id *)&self->_currentStyles, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end