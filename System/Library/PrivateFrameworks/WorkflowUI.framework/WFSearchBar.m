@interface WFSearchBar
- (BOOL)alignsTextFieldOnPixelBoundaries;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)isFirstResponder;
- (BOOL)isPortraitOrientation;
- (BOOL)resignFirstResponder;
- (BOOL)showsCancelButton;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3 forVisualConfiguration:(id)a4;
- (NSString)text;
- (UIButton)cancelButton;
- (WFSearchBar)initWithStyle:(unint64_t)a3;
- (WFSearchBarDelegate)delegate;
- (WFSearchTextField)searchTextField;
- (double)_performHeightCalculationForVisualConfiguration:(id)a3;
- (id)_currentVisualConfiguration;
- (id)activeSearchConfiguration;
- (id)focusGroupIdentifier;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)inactiveSearchConfiguration;
- (int64_t)textFieldDefaultAlignmentBehavior;
- (void)_accessibilityBoldStatusDidChange:(id)a3;
- (void)_cancelButtonTapped:(id)a3;
- (void)_searchBarTextFieldDidChangeText:(id)a3;
- (void)_updateCancelButtonFont;
- (void)layoutSubviews;
- (void)reset;
- (void)setAlignsTextFieldOnPixelBoundaries:(BOOL)a3;
- (void)setCancelButtonTrailingPadding:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusGroupIdentifier:(id)a3;
- (void)setInactiveSearchConfiguration:(id)a3;
- (void)setPortraitOrientation:(BOOL)a3;
- (void)setSearchTextField:(id)a3;
- (void)setShowsCancelButton:(BOOL)a3;
- (void)setShowsCancelButton:(BOOL)a3 animated:(BOOL)a4;
- (void)setTextFieldDefaultAlignmentBehavior:(int64_t)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidResignFirstResponder;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WFSearchBar

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inactiveSearchConfiguration, 0);
  objc_storeStrong(&self->_activeSearchConfiguration, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_searchTextField, 0);
}

- (BOOL)isPortraitOrientation
{
  return self->_portraitOrientation;
}

- (id)inactiveSearchConfiguration
{
  return self->_inactiveSearchConfiguration;
}

- (id)activeSearchConfiguration
{
  return self->_activeSearchConfiguration;
}

- (BOOL)alignsTextFieldOnPixelBoundaries
{
  return self->_alignsTextFieldOnPixelBoundaries;
}

- (BOOL)showsCancelButton
{
  return self->_showsCancelButton;
}

- (int64_t)textFieldDefaultAlignmentBehavior
{
  return self->_textFieldDefaultAlignmentBehavior;
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setDelegate:(id)a3
{
}

- (WFSearchBarDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFSearchBarDelegate *)WeakRetained;
}

- (WFSearchTextField)searchTextField
{
  return self->_searchTextField;
}

- (void)_updateCancelButtonFont
{
  v3 = (void *)MEMORY[0x263F82DA0];
  v4 = [(WFSearchBar *)self traitCollection];
  v5 = [v4 preferredContentSizeCategory];
  v6 = UIContentSizeCategoryClip(v5, (void *)*MEMORY[0x263F83458], (void *)*MEMORY[0x263F83408]);
  id v12 = [v3 traitCollectionWithPreferredContentSizeCategory:v6];

  v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570] compatibleWithTraitCollection:v12];
  v8 = [(UIButton *)self->_cancelButton titleLabel];
  [v8 setFont:v7];

  [(UIButton *)self->_cancelButton sizeToFit];
  cancelButton = self->_cancelButton;
  v10 = [(WFSearchBar *)self traitCollection];
  if ([v10 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] systemWhiteColor];
  }
  else {
  v11 = [MEMORY[0x263F825C8] systemBlueColor];
  }
  [(UIButton *)cancelButton setTitleColor:v11 forState:0];
}

- (double)_performHeightCalculationForVisualConfiguration:(id)a3
{
  id v4 = a3;
  v5 = [(WFSearchBar *)self searchTextField];
  [v5 intrinsicContentSize];
  double v7 = v6;

  if ([(WFSearchBar *)self isPortraitOrientation]) {
    [v4 textFieldPortraitLayoutInsets];
  }
  else {
    [v4 textFieldLandscapeLayoutInsets];
  }
  double v10 = v8;
  double v11 = v9;

  return v11 + v7 + v10;
}

- (id)_currentVisualConfiguration
{
  BOOL v3 = [(WFSearchBar *)self showsCancelButton];
  id v4 = &OBJC_IVAR___WFSearchBar__inactiveSearchConfiguration;
  if (v3) {
    id v4 = &OBJC_IVAR___WFSearchBar__activeSearchConfiguration;
  }
  v5 = *(Class *)((char *)&self->super.super.super.isa + *v4);
  return v5;
}

- (void)textFieldDidResignFirstResponder
{
  uint64_t v3 = [(UISearchTextField *)self->_searchTextField text];
  if (!v3
    || (id v4 = (void *)v3,
        [(UISearchTextField *)self->_searchTextField text],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        !v6))
  {
    [(WFSearchBar *)self setShowsCancelButton:0 animated:1];
  }
}

- (void)_searchBarTextFieldDidChangeText:(id)a3
{
  id v5 = [(WFSearchBar *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(UISearchTextField *)self->_searchTextField text];
    [v5 searchBar:self textDidChange:v4];
  }
}

- (void)_cancelButtonTapped:(id)a3
{
  [(WFSearchBar *)self reset];
  id v5 = [(WFSearchBar *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(UISearchTextField *)self->_searchTextField text];
    [v5 searchBar:self textDidChange:v4];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return [a3 resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = [(WFSearchBar *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 searchBarDidBeginEditing:self];
  }
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return 1;
}

- (void)reset
{
  [(WFSearchTextField *)self->_searchTextField setTokens:MEMORY[0x263EFFA68]];
  [(WFSearchTextField *)self->_searchTextField setText:&stru_26E1A5FC0];
  [(WFSearchBar *)self setNeedsLayout];
  [(WFSearchBar *)self layoutIfNeeded];
  uint64_t v3 = [(WFSearchBar *)self searchTextField];
  [v3 resignFirstResponder];

  [(WFSearchBar *)self setShowsCancelButton:0 animated:1];
}

- (void)layoutSubviews
{
  v71.receiver = self;
  v71.super_class = (Class)WFSearchBar;
  [(WFSearchBar *)&v71 layoutSubviews];
  [(WFSearchBar *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(WFSearchBar *)self _currentVisualConfiguration];
  id v12 = [(WFSearchBar *)self traitCollection];
  [v12 displayScale];
  uint64_t v68 = v13;

  [(WFSearchBar *)self safeAreaInsets];
  if ([(WFSearchBar *)self isPortraitOrientation]) {
    [v11 textFieldPortraitLayoutInsets];
  }
  else {
    [v11 textFieldLandscapeLayoutInsets];
  }
  UIEdgeInsetsAdd();
  double v15 = v4 + v14;
  double v17 = v6 + v16;
  double v19 = v8 - (v14 + v18);
  double v21 = v10 - (v16 + v20);
  [v11 textFieldWidth];
  double v23 = v22;
  double v24 = (v8 - v22) * 0.5;
  if (v23 <= 0.0)
  {
    CGFloat v25 = v15;
  }
  else
  {
    double v19 = v23;
    CGFloat v25 = v24;
  }
  [(UIButton *)self->_cancelButton frame];
  double v67 = v26;
  v27 = [(WFSearchBar *)self searchTextField];
  [v27 intrinsicContentSize];

  double textFieldCancelButtonSpacing = self->_textFieldCancelButtonSpacing;
  double v28 = *MEMORY[0x263F00148];
  double v29 = *(double *)(MEMORY[0x263F00148] + 8);
  if (self->_alignsTextFieldOnPixelBoundaries)
  {
    uint64_t v56 = v68;
    UIRectCenteredIntegralRectScale();
  }
  else
  {
    UIRectCenteredRect();
  }
  double v69 = v30;
  double v70 = v28;
  double v62 = v33;
  double v63 = v32;
  double v65 = v29;
  double rect = v31;
  CGFloat v57 = v21;
  UIEdgeInsetsAdd();
  double v60 = v35;
  double v61 = v34;
  double v58 = v37;
  double v59 = v36;
  UIEdgeInsetsAdd();
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  v46 = (id *)MEMORY[0x263F83300];
  if (self->_showsCancelButton)
  {
    uint64_t v47 = [(id)*MEMORY[0x263F83300] userInterfaceLayoutDirection];
    double v48 = v67 + textFieldCancelButtonSpacing + self->_cancelButtonTrailingPadding;
    if (v47 == 1) {
      double v41 = v41 + v48;
    }
    else {
      double v45 = v45 + v48;
    }
  }
  -[WFSearchTextField setBounds:](self->_searchTextField, "setBounds:", v70, v65, v63 - (v41 + v45), v62 - (v39 + v43), v56);
  searchTextField = self->_searchTextField;
  UIRectGetCenter();
  -[WFSearchTextField setCenter:](searchTextField, "setCenter:");
  [(UIButton *)self->_cancelButton frame];
  v72.origin.x = v69;
  v72.origin.y = rect;
  v72.size.width = v63;
  v72.size.height = v62;
  CGRectGetMidY(v72);
  LODWORD(searchTextField) = self->_showsCancelButton;
  uint64_t v50 = [*v46 userInterfaceLayoutDirection];
  if (searchTextField)
  {
    double v51 = v69 + v60;
    double v52 = rect + v61;
    double v53 = v63 - (v60 + v58);
    double v54 = v62 - (v61 + v59);
    if (v50 == 1) {
      CGRectGetMinX(*(CGRect *)&v51);
    }
    else {
      CGRectGetMaxX(*(CGRect *)&v51);
    }
  }
  else if (v50 == 1)
  {
    v73.origin.x = v69;
    v73.origin.y = rect;
    v73.size.width = v63;
    v73.size.height = v62;
    CGRectGetMinX(v73);
  }
  else
  {
    v74.origin.x = v25;
    v74.size.width = v19;
    v74.size.height = v57;
    v74.origin.y = v17;
    CGRectGetMaxX(v74);
  }
  UIRectIntegralWithScale();
  -[UIButton setBounds:](self->_cancelButton, "setBounds:", v70, v65);
  cancelButton = self->_cancelButton;
  UIRectGetCenter();
  -[UIButton setCenter:](cancelButton, "setCenter:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(WFSearchBar *)self _currentVisualConfiguration];
  -[WFSearchBar sizeThatFits:forVisualConfiguration:](self, "sizeThatFits:forVisualConfiguration:", v6, width, height);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3 = [(WFSearchBar *)self searchTextField];
  [v3 intrinsicContentSize];
  double v5 = v4;

  double v6 = [(WFSearchBar *)self _currentVisualConfiguration];
  [(WFSearchBar *)self _performHeightCalculationForVisualConfiguration:v6];
  double v8 = v7;

  double v9 = v5;
  double v10 = v8;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)setFocusGroupIdentifier:(id)a3
{
}

- (id)focusGroupIdentifier
{
  return (id)[(WFSearchTextField *)self->_searchTextField focusGroupIdentifier];
}

- (CGSize)sizeThatFits:(CGSize)a3 forVisualConfiguration:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  double v8 = [(WFSearchBar *)self searchTextField];
  objc_msgSend(v8, "sizeThatFits:", width, height);
  double v10 = v9;

  [(WFSearchBar *)self _performHeightCalculationForVisualConfiguration:v7];
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)setAlignsTextFieldOnPixelBoundaries:(BOOL)a3
{
  if (self->_alignsTextFieldOnPixelBoundaries != a3)
  {
    self->_alignsTextFieldOnPixelBoundaries = a3;
    [(WFSearchBar *)self setNeedsLayout];
  }
}

- (void)setPortraitOrientation:(BOOL)a3
{
  if (self->_portraitOrientation != a3)
  {
    self->_portraitOrientation = a3;
    [(WFSearchBar *)self setNeedsLayout];
    [(WFSearchBar *)self _invalidateIntrinsicContentSizeAndNotify];
  }
}

- (void)setInactiveSearchConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = self->_inactiveSearchConfiguration;
  id v6 = v4;
  id v10 = v6;
  if (v5 == v6)
  {

    goto LABEL_9;
  }
  if (!v6 || !v5)
  {

    goto LABEL_8;
  }
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
LABEL_8:
    double v8 = (void *)[v10 copy];
    id inactiveSearchConfiguration = self->_inactiveSearchConfiguration;
    self->_id inactiveSearchConfiguration = v8;

    [(WFSearchBar *)self setNeedsLayout];
    [(WFSearchBar *)self _invalidateIntrinsicContentSizeAndNotify];
  }
LABEL_9:
}

- (void)setSearchTextField:(id)a3
{
  id v5 = (WFSearchTextField *)a3;
  searchTextField = self->_searchTextField;
  if (searchTextField != v5)
  {
    char v7 = v5;
    [(WFSearchTextField *)searchTextField removeFromSuperview];
    objc_storeStrong((id *)&self->_searchTextField, a3);
    [(WFSearchBar *)self addSubview:self->_searchTextField];
    [(WFSearchBar *)self setNeedsLayout];
    [(WFSearchBar *)self _invalidateIntrinsicContentSizeAndNotify];
    [(WFSearchBar *)self layoutIfNeeded];
    id v5 = v7;
  }
}

- (void)setShowsCancelButton:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_showsCancelButton != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    int v7 = [MEMORY[0x263F82E00] _isInAnimationBlock];
    [(WFSearchBar *)self bounds];
    double v9 = v8;
    double v11 = v10;
    -[WFSearchBar sizeThatFits:](self, "sizeThatFits:", v8, v10);
    uint64_t v13 = v12;
    uint64_t v15 = v14;
    self->_showsCancelButton = v5;
    -[WFSearchBar sizeThatFits:](self, "sizeThatFits:", v9, v11);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __45__WFSearchBar_setShowsCancelButton_animated___block_invoke;
    v24[3] = &unk_2649CAE08;
    v24[4] = self;
    BOOL v25 = v5;
    v24[5] = v13;
    v24[6] = v15;
    v24[7] = v16;
    v24[8] = v17;
    double v18 = _Block_copy(v24);
    double v19 = v18;
    if (v7 || !v4) {
      (*((void (**)(void *))v18 + 2))(v18);
    }
    else {
      [MEMORY[0x263F82E00] _animateUsingDefaultTimingWithOptions:6 animations:v18 completion:0];
    }
    double v20 = [(WFSearchBar *)self delegate];
    if (v5)
    {
      if (objc_opt_respondsToSelector()) {
        [v20 searchBarCancelButtonWillAppear:self];
      }
      double v21 = [(WFSearchBar *)self searchTextField];
      double v22 = v21;
      int64_t v23 = 1;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        [v20 searchBarCancelButtonWillHide:self];
      }
      double v22 = [(WFSearchBar *)self searchTextField];
      int64_t v23 = [(WFSearchBar *)self textFieldDefaultAlignmentBehavior];
      double v21 = v22;
    }
    [v21 setAlignmentBehavior:v23 animated:1];
  }
}

uint64_t __45__WFSearchBar_setShowsCancelButton_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 72);
  [*(id *)(*(void *)(a1 + 32) + 480) setAlpha:(double)*(unint64_t *)&a2];
  [*(id *)(a1 + 32) setNeedsLayout];
  if (*(double *)(a1 + 40) != *(double *)(a1 + 56) || *(double *)(a1 + 48) != *(double *)(a1 + 64)) {
    [*(id *)(a1 + 32) _invalidateIntrinsicContentSizeAndNotify];
  }
  BOOL v4 = *(void **)(a1 + 32);
  return [v4 layoutIfNeeded];
}

- (void)setShowsCancelButton:(BOOL)a3
{
}

- (NSString)text
{
  return (NSString *)[(UISearchTextField *)self->_searchTextField text];
}

- (BOOL)isFirstResponder
{
  return [(WFSearchTextField *)self->_searchTextField isEditing];
}

- (BOOL)resignFirstResponder
{
  return [(WFSearchTextField *)self->_searchTextField resignFirstResponder];
}

- (BOOL)canResignFirstResponder
{
  return [(UISearchTextField *)self->_searchTextField canResignFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  return [(UISearchTextField *)self->_searchTextField becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return [(UISearchTextField *)self->_searchTextField canBecomeFirstResponder];
}

- (void)_accessibilityBoldStatusDidChange:(id)a3
{
  [(WFSearchBar *)self _updateCancelButtonFont];
  [(WFSearchBar *)self setNeedsLayout];
  [(WFSearchBar *)self layoutIfNeeded];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFSearchBar;
  [(WFSearchBar *)&v4 traitCollectionDidChange:a3];
  [(WFSearchBar *)self _updateCancelButtonFont];
  [(WFSearchBar *)self setNeedsLayout];
  [(WFSearchBar *)self layoutIfNeeded];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WFSearchBar;
  -[WFSearchBar hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  BOOL v5 = (WFSearchBar *)objc_claimAutoreleasedReturnValue();
  id v6 = v5;
  if (v5 == self) {
    int v7 = 0;
  }
  else {
    int v7 = v5;
  }

  return v7;
}

- (void)setCancelButtonTrailingPadding:(double)a3
{
  self->_cancelButtonTrailingPadding = a3;
}

- (void)setTextFieldDefaultAlignmentBehavior:(int64_t)a3
{
  self->_textFieldDefaultAlignmentBehavior = a3;
  id v4 = [(WFSearchBar *)self searchTextField];
  [v4 setAlignmentBehavior:a3 animated:0];
}

- (WFSearchBar)initWithStyle:(unint64_t)a3
{
  v18.receiver = self;
  v18.super_class = (Class)WFSearchBar;
  id v4 = -[WFSearchBar initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F824E8] buttonWithType:1];
    cancelButton = v4->_cancelButton;
    v4->_cancelButton = (UIButton *)v5;

    int v7 = v4->_cancelButton;
    double v8 = WFLocalizedString(@"Cancel");
    [(UIButton *)v7 setTitle:v8 forState:0];

    [(UIButton *)v4->_cancelButton sizeToFit];
    [(UIButton *)v4->_cancelButton setAlpha:0.0];
    [(UIButton *)v4->_cancelButton addTarget:v4 action:sel__cancelButtonTapped_ forControlEvents:64];
    objc_super v9 = v4->_cancelButton;
    double v10 = [MEMORY[0x263F825C8] systemWhiteColor];
    [(UIButton *)v9 setTitleColor:v10 forState:0];

    double v11 = [MEMORY[0x263F08A00] defaultCenter];
    [v11 addObserver:v4 selector:sel__accessibilityBoldStatusDidChange_ name:*MEMORY[0x263F83190] object:0];

    [(WFSearchBar *)v4 addSubview:v4->_cancelButton];
    [(WFSearchBar *)v4 _updateCancelButtonFont];
    uint64_t v12 = [[WFSearchTextField alloc] initWithStyle:a3];
    searchTextField = v4->_searchTextField;
    v4->_searchTextField = v12;

    [(WFSearchTextField *)v4->_searchTextField setTextFieldDelegate:v4];
    [(UISearchTextField *)v4->_searchTextField setDelegate:v4];
    uint64_t v14 = v4->_searchTextField;
    uint64_t v15 = WFLocalizedString(@"Search Shortcuts");
    [(WFSearchTextField *)v14 setPlaceholder:v15];

    uint64_t v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v4 selector:sel__searchBarTextFieldDidChangeText_ name:*MEMORY[0x263F83AC8] object:v4->_searchTextField];

    [(WFSearchBar *)v4 addSubview:v4->_searchTextField];
    v4->_double textFieldCancelButtonSpacing = 16.0;
    v4->_cancelButtonTrailingPadding = 0.0;
    v4->_alignsTextFieldOnPixelBoundaries = 1;
    v4->_portraitOrientation = 1;
    v4->_textFieldDefaultAlignmentBehavior = 0;
    [(WFSearchBar *)v4 _setIgnoresLayerTransformForSafeAreaInsets:1];
  }
  return v4;
}

@end