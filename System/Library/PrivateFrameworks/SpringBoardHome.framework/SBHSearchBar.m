@interface SBHSearchBar
- (BOOL)alignsTextFieldOnPixelBoundaries;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)isFirstResponder;
- (BOOL)isPortraitOrientation;
- (BOOL)resignFirstResponder;
- (BOOL)showsCancelButton;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 forVisualConfiguration:(id)a4;
- (NSString)text;
- (SBFFeatherBlurView)backgroundView;
- (SBHSearchBar)initWithFrame:(CGRect)a3;
- (SBHSearchBarDelegate)delegate;
- (SBHSearchTextField)searchTextField;
- (SBHSearchVisualConfiguration)activeSearchConfiguration;
- (SBHSearchVisualConfiguration)inactiveSearchConfiguration;
- (SBIconListLayoutProvider)listLayoutProvider;
- (UIButton)cancelButton;
- (double)_performHeightCalculationForVisualConfiguration:(id)a3;
- (double)backgroundViewBottomInsetToTextField;
- (id)_currentVisualConfiguration;
- (id)focusGroupIdentifier;
- (void)_accessibilityBoldStatusDidChange:(id)a3;
- (void)_cancelButtonTapped:(id)a3;
- (void)_invalidateIntrinsicContentSizeAndNotify;
- (void)_preferredContentSizeCategoryDidChange;
- (void)_searchBarTextFieldDidChangeText:(id)a3;
- (void)_updateCancelButtonFont;
- (void)layoutSubviews;
- (void)setAlignsTextFieldOnPixelBoundaries:(BOOL)a3;
- (void)setBackgroundViewBottomInsetToTextField:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusGroupIdentifier:(id)a3;
- (void)setInactiveSearchConfiguration:(id)a3;
- (void)setListLayoutProvider:(id)a3;
- (void)setPortraitOrientation:(BOOL)a3;
- (void)setSearchTextField:(id)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)setShowsCancelButton:(BOOL)a3 animated:(BOOL)a4;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation SBHSearchBar

- (SBHSearchBar)initWithFrame:(CGRect)a3
{
  v27[1] = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)SBHSearchBar;
  v3 = -[SBHSearchBar initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x1E4FA5F00]) initWithRecipe:1];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (SBFFeatherBlurView *)v4;

    [(SBHSearchBar *)v3 addSubview:v3->_backgroundView];
    v3->_backgroundViewBottomInsetToTextField = *(double *)MEMORY[0x1E4FB30D8];
    uint64_t v6 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    cancelButton = v3->_cancelButton;
    v3->_cancelButton = (UIButton *)v6;

    v8 = v3->_cancelButton;
    v9 = SBHBundle();
    v10 = [v9 localizedStringForKey:@"APP_LIBRARY_SEARCH_CANCEL_BUTTON_TITLE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    [(UIButton *)v8 setTitle:v10 forState:0];

    [(UIButton *)v3->_cancelButton sizeToFit];
    [(UIButton *)v3->_cancelButton setAlpha:0.0];
    [(UIButton *)v3->_cancelButton setPointerInteractionEnabled:1];
    [(UIButton *)v3->_cancelButton addTarget:v3 action:sel__cancelButtonTapped_ forControlEvents:64];
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v3 selector:sel__accessibilityBoldStatusDidChange_ name:*MEMORY[0x1E4FB2420] object:0];

    [(SBHSearchBar *)v3 addSubview:v3->_cancelButton];
    [(SBHSearchBar *)v3 _updateCancelButtonFont];
    v12 = [SBHSearchTextField alloc];
    uint64_t v13 = -[SBHSearchTextField initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    searchTextField = v3->_searchTextField;
    v3->_searchTextField = (SBHSearchTextField *)v13;

    [(UISearchTextField *)v3->_searchTextField setDelegate:v3];
    v15 = v3->_searchTextField;
    v16 = SBHBundle();
    v17 = [v16 localizedStringForKey:@"APP_LIBRARY_SEARCH_PLACEHOLDER" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    [(SBHSearchTextField *)v15 setPlaceholder:v17];

    v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v18 addObserver:v3 selector:sel__searchBarTextFieldDidChangeText_ name:*MEMORY[0x1E4FB3018] object:v3->_searchTextField];

    [(SBHSearchBar *)v3 addSubview:v3->_searchTextField];
    v19 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v20 = [v19 userInterfaceIdiom];

    double v21 = 16.0;
    if ((v20 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      double v21 = 20.0;
    }
    v3->_textFieldCancelButtonSpacing = v21;
    v3->_alignsTextFieldOnPixelBoundaries = 1;
    v3->_portraitOrientation = 1;
    [(SBHSearchBar *)v3 setAccessibilityIdentifier:@"dewey-search-bar"];
    [(SBHSearchBar *)v3 _setIgnoresLayerTransformForSafeAreaInsets:1];
    v22 = self;
    v27[0] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    id v24 = (id)[(SBHSearchBar *)v3 registerForTraitChanges:v23 withAction:sel__preferredContentSizeCategoryDidChange];
  }
  return v3;
}

- (void)_preferredContentSizeCategoryDidChange
{
  [(SBHSearchBar *)self _updateCancelButtonFont];
  [(SBHSearchBar *)self setNeedsLayout];
  [(SBHSearchBar *)self layoutIfNeeded];
}

- (void)_accessibilityBoldStatusDidChange:(id)a3
{
  [(SBHSearchBar *)self _updateCancelButtonFont];
  [(SBHSearchBar *)self setNeedsLayout];
  [(SBHSearchBar *)self layoutIfNeeded];
}

- (BOOL)canBecomeFirstResponder
{
  return [(UISearchTextField *)self->_searchTextField canBecomeFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  return [(UISearchTextField *)self->_searchTextField becomeFirstResponder];
}

- (BOOL)canResignFirstResponder
{
  return [(UISearchTextField *)self->_searchTextField canResignFirstResponder];
}

- (BOOL)resignFirstResponder
{
  return [(UISearchTextField *)self->_searchTextField resignFirstResponder];
}

- (BOOL)isFirstResponder
{
  return [(SBHSearchTextField *)self->_searchTextField isEditing];
}

- (NSString)text
{
  return (NSString *)[(UISearchTextField *)self->_searchTextField text];
}

- (void)setShowsCancelButton:(BOOL)a3
{
}

- (void)setShowsCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showsCancelButton != a3)
  {
    BOOL v4 = a4;
    int v7 = [MEMORY[0x1E4FB1EB0] _isInAnimationBlock];
    [(SBHSearchBar *)self frame];
    double v9 = v8;
    double v11 = v10;
    -[SBHSearchBar sizeThatFits:](self, "sizeThatFits:", v8, v10);
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    self->_showsCancelButton = a3;
    -[SBHSearchBar sizeThatFits:](self, "sizeThatFits:", v9, v11);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __46__SBHSearchBar_setShowsCancelButton_animated___block_invoke;
    v20[3] = &unk_1E6AB1550;
    v20[4] = self;
    BOOL v21 = a3;
    v20[5] = v13;
    v20[6] = v15;
    v20[7] = v16;
    v20[8] = v17;
    v18 = _Block_copy(v20);
    v19 = v18;
    if (v7 || !v4) {
      (*((void (**)(void *))v18 + 2))(v18);
    }
    else {
      [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:6 animations:v18 completion:0];
    }
  }
}

uint64_t __46__SBHSearchBar_setShowsCancelButton_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 72);
  [*(id *)(*(void *)(a1 + 32) + 472) setAlpha:(double)*(unint64_t *)&a2];
  [*(id *)(a1 + 32) setNeedsLayout];
  if (*(double *)(a1 + 40) != *(double *)(a1 + 56) || *(double *)(a1 + 48) != *(double *)(a1 + 64)) {
    [*(id *)(a1 + 32) _invalidateIntrinsicContentSizeAndNotify];
  }
  BOOL v4 = *(void **)(a1 + 32);
  return [v4 layoutIfNeeded];
}

- (void)setSearchTextField:(id)a3
{
  v5 = (SBHSearchTextField *)a3;
  searchTextField = self->_searchTextField;
  if (searchTextField != v5)
  {
    int v7 = v5;
    [(SBHSearchTextField *)searchTextField removeFromSuperview];
    objc_storeStrong((id *)&self->_searchTextField, a3);
    [(SBHSearchBar *)self addSubview:self->_searchTextField];
    [(SBHSearchBar *)self setNeedsLayout];
    [(SBHSearchBar *)self _invalidateIntrinsicContentSizeAndNotify];
    [(SBHSearchBar *)self layoutIfNeeded];
    v5 = v7;
  }
}

- (void)setInactiveSearchConfiguration:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    BOOL v4 = (SBHSearchVisualConfiguration *)[v6 copy];
    inactiveSearchConfiguration = self->_inactiveSearchConfiguration;
    self->_inactiveSearchConfiguration = v4;

    [(SBHSearchBar *)self setNeedsLayout];
    [(SBHSearchBar *)self _invalidateIntrinsicContentSizeAndNotify];
  }
}

- (void)setPortraitOrientation:(BOOL)a3
{
  if (self->_portraitOrientation != a3)
  {
    self->_portraitOrientation = a3;
    [(SBHSearchBar *)self setNeedsLayout];
    [(SBHSearchBar *)self _invalidateIntrinsicContentSizeAndNotify];
  }
}

- (void)setAlignsTextFieldOnPixelBoundaries:(BOOL)a3
{
  if (self->_alignsTextFieldOnPixelBoundaries != a3)
  {
    self->_alignsTextFieldOnPixelBoundaries = a3;
    [(SBHSearchBar *)self setNeedsLayout];
  }
}

- (void)setListLayoutProvider:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listLayoutProvider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_listLayoutProvider, obj);
    id v6 = [obj layoutForIconLocation:@"SBIconLocationRoot"];
    [v6 iconImageInfo];
    SBHIconListLayoutNonDefaultIconGridSizeClassLayoutInsets(v6, 1);
    BSFloatFloorForScale();
    self->_textFieldHorizontalLayoutInsets.top = 0.0;
    self->_textFieldHorizontalLayoutInsets.left = v7;
    self->_textFieldHorizontalLayoutInsets.bottom = 0.0;
    self->_textFieldHorizontalLayoutInsets.right = v7;
    double v8 = [obj layoutForIconLocation:@"SBIconLocationAppLibrary"];
    double v9 = [v8 appLibraryVisualConfiguration];
    searchTextField = self->_searchTextField;
    [v9 searchContinuousCornerRadius];
    -[SBHSearchTextField _setContinuousCornerRadius:](searchTextField, "_setContinuousCornerRadius:");
    if (!self->_inactiveSearchConfiguration)
    {
      double v11 = [v9 standardSearchVisualConfiguration];
      inactiveSearchConfiguration = self->_inactiveSearchConfiguration;
      self->_inactiveSearchConfiguration = v11;
    }
    uint64_t v13 = [v9 activeSearchVisualConfiguration];
    activeSearchConfiguration = self->_activeSearchConfiguration;
    self->_activeSearchConfiguration = v13;

    [(SBHSearchBar *)self setNeedsLayout];
    [(SBHSearchBar *)self layoutIfNeeded];

    v5 = obj;
  }
}

- (void)setBackgroundViewBottomInsetToTextField:(double)a3
{
  if (self->_backgroundViewBottomInsetToTextField != a3)
  {
    self->_backgroundViewBottomInsetToTextField = a3;
    [(SBHSearchBar *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3 forVisualConfiguration:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  double v8 = [(SBHSearchBar *)self searchTextField];
  objc_msgSend(v8, "effectiveLayoutSizeFittingSize:", width, height);
  double v10 = v9;

  [(SBHSearchBar *)self _performHeightCalculationForVisualConfiguration:v7];
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (id)focusGroupIdentifier
{
  return (id)[(SBHSearchTextField *)self->_searchTextField focusGroupIdentifier];
}

- (void)setFocusGroupIdentifier:(id)a3
{
}

- (CGSize)intrinsicContentSize
{
  v3 = [(SBHSearchBar *)self searchTextField];
  [v3 intrinsicContentSize];
  double v5 = v4;

  id v6 = [(SBHSearchBar *)self _currentVisualConfiguration];
  [(SBHSearchBar *)self _performHeightCalculationForVisualConfiguration:v6];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(SBHSearchBar *)self _currentVisualConfiguration];
  -[SBHSearchBar sizeThatFits:forVisualConfiguration:](self, "sizeThatFits:forVisualConfiguration:", v6, width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (void)layoutSubviews
{
  v78.receiver = self;
  v78.super_class = (Class)SBHSearchBar;
  [(SBHSearchBar *)&v78 layoutSubviews];
  [(SBHSearchBar *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v75 = v7;
  double v72 = v8;
  double v9 = [(SBHSearchBar *)self _currentVisualConfiguration];
  double v10 = [(SBHSearchBar *)self window];
  double v11 = [(SBHSearchBar *)self traitCollection];
  [v11 displayScale];

  double v12 = [(SBHSearchBar *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v12 safeAreaInsetsForSearchBar:self];
  }
  else {
    [(SBHSearchBar *)self safeAreaInsets];
  }
  if ([(SBHSearchBar *)self isPortraitOrientation]) {
    [v9 textFieldPortraitLayoutInsets];
  }
  else {
    [v9 textFieldLandscapeLayoutInsets];
  }
  UIEdgeInsetsAdd();
  double v14 = v4 + v13;
  double v16 = v6 + v15;
  double v18 = v75 - (v13 + v17);
  double v20 = v72 - (v15 + v19);
  [v9 textFieldWidth];
  double v22 = v21;
  double v23 = (v75 - v21) * 0.5;
  if (v22 <= 0.0)
  {
    CGFloat v24 = v14;
  }
  else
  {
    double v18 = v22;
    CGFloat v24 = v23;
  }
  [(UIButton *)self->_cancelButton frame];
  double v71 = v25;
  objc_super v26 = [(SBHSearchBar *)self searchTextField];
  [v26 intrinsicContentSize];

  double textFieldCancelButtonSpacing = self->_textFieldCancelButtonSpacing;
  if (self->_alignsTextFieldOnPixelBoundaries) {
    UIRectCenteredIntegralRectScale();
  }
  else {
    UIRectCenteredRect();
  }
  double v73 = v28;
  double v74 = v27;
  double v76 = v30;
  double v77 = v29;
  CGFloat v63 = v18;
  CGFloat v64 = v20;
  CGFloat v65 = v16;
  UIEdgeInsetsAdd();
  double v68 = v32;
  double v69 = v31;
  double v66 = v34;
  double v67 = v33;
  UIEdgeInsetsAdd();
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  v43 = (id *)MEMORY[0x1E4FB2608];
  if (self->_showsCancelButton)
  {
    uint64_t v44 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
    double v45 = v71 + textFieldCancelButtonSpacing;
    if (v44 == 1) {
      double v38 = v45 + v38;
    }
    else {
      double v42 = v45 + v42;
    }
  }
  double v46 = v74 + v38;
  double v47 = v77 - (v38 + v42);
  double v48 = v76 - (v36 + v40);
  searchTextField = self->_searchTextField;
  BSRectWithSize();
  -[SBHSearchTextField setBounds:](searchTextField, "setBounds:");
  v50 = self->_searchTextField;
  UIRectGetCenter();
  -[SBHSearchTextField setCenter:](v50, "setCenter:");
  if (self->_backgroundViewBottomInsetToTextField != *MEMORY[0x1E4FB30D8])
  {
    v79.origin.x = v46;
    v79.origin.y = v73 + v36;
    v79.size.double width = v47;
    v79.size.double height = v48;
    CGRectGetMaxY(v79);
  }
  backgroundView = self->_backgroundView;
  BSRectWithSize();
  -[SBFFeatherBlurView setBounds:](backgroundView, "setBounds:");
  v52 = self->_backgroundView;
  UIRectGetCenter();
  -[SBFFeatherBlurView setCenter:](v52, "setCenter:");
  v53 = (void *)MEMORY[0x1E4FA5F00];
  [(SBFFeatherBlurView *)self->_backgroundView frame];
  v54 = objc_msgSend(v53, "matchMoveAnimationForFrame:relativeToView:", v10);
  v55 = [(SBFFeatherBlurView *)self->_backgroundView layer];
  [v55 addAnimation:v54 forKey:@"SBHSearchBarMatchMoveAnimation"];

  [(UIButton *)self->_cancelButton frame];
  v80.origin.x = v74;
  v80.origin.y = v73;
  v80.size.double width = v77;
  v80.size.double height = v76;
  CGRectGetMidY(v80);
  LODWORD(v55) = self->_showsCancelButton;
  uint64_t v56 = [*v43 userInterfaceLayoutDirection];
  if (v55)
  {
    double v57 = v74 + v68;
    double v58 = v73 + v69;
    double v59 = v77 - (v68 + v66);
    double v60 = v76 - (v69 + v67);
    if (v56 == 1) {
      CGRectGetMinX(*(CGRect *)&v57);
    }
    else {
      CGRectGetMaxX(*(CGRect *)&v57);
    }
  }
  else if (v56 == 1)
  {
    v81.origin.x = v74;
    v81.origin.y = v73;
    v81.size.double height = v76;
    v81.size.double width = v77;
    CGRectGetMinX(v81);
  }
  else
  {
    v82.origin.x = v24;
    v82.size.double width = v63;
    v82.size.double height = v64;
    v82.origin.y = v65;
    CGRectGetMaxX(v82);
  }
  UIRectIntegralWithScale();
  cancelButton = self->_cancelButton;
  BSRectWithSize();
  -[UIButton setBounds:](cancelButton, "setBounds:");
  v62 = self->_cancelButton;
  UIRectGetCenter();
  -[UIButton setCenter:](v62, "setCenter:");
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  double v4 = [(SBHSearchBar *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v4 searchBarShouldBeginEditing:self])
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = 1;
    [(SBHSearchBar *)self setShowsCancelButton:1 animated:1];
  }

  return v5;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = [(SBHSearchBar *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 searchBarTextDidBeginEditing:self];
  }
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  id v4 = [(SBHSearchBar *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 searchBarShouldEndEditing:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = [(SBHSearchBar *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 searchBarTextDidEndEditing:self];
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  double v9 = [(SBHSearchBar *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v10 = objc_msgSend(v9, "searchBar:shouldChangeTextInRange:replacementText:", self, location, length, v8);
  }
  else {
    char v10 = 1;
  }

  return v10;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  char v5 = [(SBHSearchBar *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v5 searchBarShouldReturn:self])
  {
    [v4 resignFirstResponder];
    BOOL v6 = 1;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_cancelButtonTapped:(id)a3
{
  [(UISearchTextField *)self->_searchTextField setText:&stru_1F2FA0300];
  id v4 = [(SBHSearchBar *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 searchBarCancelButtonClicked:self];
  }
  [(SBHSearchBar *)self setShowsCancelButton:0 animated:1];
}

- (void)_searchBarTextFieldDidChangeText:(id)a3
{
  id v5 = [(SBHSearchBar *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(UISearchTextField *)self->_searchTextField text];
    [v5 searchBar:self textDidChange:v4];
  }
}

- (id)_currentVisualConfiguration
{
  BOOL v3 = [(SBHSearchBar *)self showsCancelButton];
  id v4 = &OBJC_IVAR___SBHSearchBar__inactiveSearchConfiguration;
  if (v3) {
    id v4 = &OBJC_IVAR___SBHSearchBar__activeSearchConfiguration;
  }
  id v5 = *(Class *)((char *)&self->super.super.super.super.isa + *v4);
  return v5;
}

- (void)_invalidateIntrinsicContentSizeAndNotify
{
  [(SBHSearchBar *)self invalidateIntrinsicContentSize];
  id v3 = [(SBHSearchBar *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 searchBarDidInvalidateIntrinsicContentSize:self];
  }
}

- (double)_performHeightCalculationForVisualConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(SBHSearchBar *)self searchTextField];
  [v5 intrinsicContentSize];
  double v7 = v6;

  if ([(SBHSearchBar *)self isPortraitOrientation]) {
    [v4 textFieldPortraitLayoutInsets];
  }
  else {
    [v4 textFieldLandscapeLayoutInsets];
  }
  double v10 = v8;
  double v11 = v9;

  return v11 + v7 + v10;
}

- (void)_updateCancelButtonFont
{
  id v3 = (void *)MEMORY[0x1E4FB1E20];
  id v4 = [(SBHSearchBar *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];
  double v6 = UIContentSizeCategoryClip();
  id v9 = [v3 traitCollectionWithPreferredContentSizeCategory:v6];

  double v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8] compatibleWithTraitCollection:v9];
  double v8 = [(UIButton *)self->_cancelButton titleLabel];
  [v8 setFont:v7];

  [(UIButton *)self->_cancelButton sizeToFit];
}

- (SBHSearchTextField)searchTextField
{
  return self->_searchTextField;
}

- (SBHSearchBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBHSearchBarDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (BOOL)alignsTextFieldOnPixelBoundaries
{
  return self->_alignsTextFieldOnPixelBoundaries;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listLayoutProvider);
  return (SBIconListLayoutProvider *)WeakRetained;
}

- (SBHSearchVisualConfiguration)activeSearchConfiguration
{
  return self->_activeSearchConfiguration;
}

- (SBHSearchVisualConfiguration)inactiveSearchConfiguration
{
  return self->_inactiveSearchConfiguration;
}

- (BOOL)isPortraitOrientation
{
  return self->_portraitOrientation;
}

- (SBFFeatherBlurView)backgroundView
{
  return self->_backgroundView;
}

- (double)backgroundViewBottomInsetToTextField
{
  return self->_backgroundViewBottomInsetToTextField;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_inactiveSearchConfiguration, 0);
  objc_storeStrong((id *)&self->_activeSearchConfiguration, 0);
  objc_destroyWeak((id *)&self->_listLayoutProvider);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchTextField, 0);
}

@end