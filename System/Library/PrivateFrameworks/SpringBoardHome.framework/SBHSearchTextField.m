@interface SBHSearchTextField
+ (id)borderColorForUserInterfaceStyle:(int64_t)a3;
+ (int64_t)_derivedTextAlignmentForBehavior:(int64_t)a3 hasSearchText:(BOOL)a4 isEditing:(BOOL)a5;
- (BOOL)_hasSearchText;
- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged;
- (CGRect)_adjustedTextOrEditingRect:(CGRect)a3 forBounds:(CGRect)a4;
- (CGRect)_calculateEditingRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5;
- (CGRect)_calculatePlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5;
- (CGRect)_calculateTextRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5;
- (CGRect)_frameForLeftViewWithinBounds:(CGRect)a3 alignment:(int64_t)a4;
- (CGRect)_frameForPlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5 willOverflow:(BOOL *)a6;
- (CGRect)_frameForRightViewWithinBounds:(CGRect)a3 alignment:(int64_t)a4;
- (CGRect)clearButtonRectForBounds:(CGRect)a3;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)leftViewRectForBounds:(CGRect)a3;
- (CGRect)placeholderRectForBounds:(CGRect)a3;
- (CGRect)rightViewRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SBHSearchTextField)initWithFrame:(CGRect)a3;
- (double)_calculateHeightWithFont;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (int64_t)_derivedTextAlignment;
- (int64_t)_derivedTextAlignmentIfEditing:(BOOL)a3;
- (int64_t)alignmentBehavior;
- (void)_didBeginEditing:(id)a3;
- (void)_didEndEditing:(id)a3;
- (void)_effectiveAppearanceDidChange;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_textDidChange:(id)a3;
- (void)_updateTextAlignmentForEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)layoutSubviews;
- (void)setAlignmentBehavior:(int64_t)a3;
- (void)setAlignmentBehavior:(int64_t)a3 animated:(BOOL)a4;
- (void)setFont:(id)a3;
- (void)setReturnKeyType:(int64_t)a3;
- (void)updateBorderVisualStyling;
- (void)updateStyleForClearButton;
- (void)updateStyleForLeftView;
- (void)updateStyleForPlaceholderView;
- (void)updateStyleForRightView;
- (void)updateVisualStyling;
@end

@implementation SBHSearchTextField

- (SBHSearchTextField)initWithFrame:(CGRect)a3
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)SBHSearchTextField;
  v3 = -[SBHSearchTextField initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SBHSearchTextField *)v3 setAccessibilityIdentifier:@"dewey-search-field"];
    [(SBHSearchTextField *)v4 setBorderStyle:0];
    uint64_t v5 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:19];
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = (UIView *)v5;

    [(UIView *)v4->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [(UIView *)v4->_backgroundView layer];
    [v7 setBorderWidth:0.3];

    [(SBHSearchTextField *)v4 updateBorderVisualStyling];
    [(UIView *)v4->_backgroundView setAutoresizingMask:18];
    v8 = v4->_backgroundView;
    [(SBHSearchTextField *)v4 bounds];
    -[UIView setFrame:](v8, "setFrame:");
    [(UIView *)v4->_backgroundView _setContinuousCornerRadius:16.0];
    [(SBHSearchTextField *)v4 addSubview:v4->_backgroundView];
    [(SBHSearchTextField *)v4 sendSubviewToBack:v4->_backgroundView];
    [(SBHSearchTextField *)v4 setReturnKeyType:6];
    [(SBHSearchTextField *)v4 setKeyboardAppearance:1];
    [(SBHSearchTextField *)v4 setAutocorrectionType:1];
    [(SBHSearchTextField *)v4 setSpellCheckingType:1];
    [(SBHSearchTextField *)v4 setEnablesReturnKeyAutomatically:1];
    [(SBHSearchTextField *)v4 setMinimumFontSize:10.0];
    [(SBHSearchTextField *)v4 updateVisualStyling];
    uint64_t v9 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    styledViews = v4->_styledViews;
    v4->_styledViews = (NSHashTable *)v9;

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v4 selector:sel__didEndEditing_ name:*MEMORY[0x1E4FB3020] object:v4];

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v4 selector:sel__didBeginEditing_ name:*MEMORY[0x1E4FB3010] object:v4];

    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v4 selector:sel__textDidChange_ name:*MEMORY[0x1E4FB3018] object:v4];

    v4->_alignmentBehavior = 0;
    [(SBHSearchTextField *)v4 _updateTextAlignmentForEditing:0 animated:0];
    v14 = self;
    v20[0] = v14;
    v15 = self;
    v20[1] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:2];
    id v17 = (id)[(SBHSearchTextField *)v4 registerForTraitChanges:v16 withAction:sel__effectiveAppearanceDidChange];
  }
  return v4;
}

- (double)_calculateHeightWithFont
{
  v3 = [(SBHSearchTextField *)self traitCollection];
  [v3 displayScale];

  v4 = [(SBHSearchTextField *)self font];
  [v4 lineHeight];
  double v6 = v5 + 26.0;
  [v4 descender];
  double v8 = v6 + v7;
  double v9 = 48.0;
  if (v8 >= 48.0)
  {
    BSFloatCeilForScale();
    double v9 = v10;
  }

  return v9;
}

- (CGSize)intrinsicContentSize
{
  [(SBHSearchTextField *)self _calculateHeightWithFont];
  double v4 = v3;
  v7.receiver = self;
  v7.super_class = (Class)SBHSearchTextField;
  [(UISearchTextField *)&v7 intrinsicContentSize];
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v15.receiver = self;
  v15.super_class = (Class)SBHSearchTextField;
  -[SBHSearchTextField sizeThatFits:](&v15, sel_sizeThatFits_, a3.width, a3.height);
  double v6 = v5;
  double v8 = v7;
  [(SBHSearchTextField *)self _calculateHeightWithFont];
  double v10 = v9;
  if (!SBHSizeGreaterThanOrEqualToSize(width, v9, v6, v8))
  {
    double v11 = SBHSizeScaledToFill(width, v10, v6, v8);
    double width = SBHSizeCeiling(v11);
    double v10 = v12;
  }
  double v13 = width;
  double v14 = v10;
  result.height = v14;
  result.double width = v13;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SBHSearchTextField;
  [(UISearchTextField *)&v3 layoutSubviews];
  [(SBHSearchTextField *)self updateVisualStyling];
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (void)_didEndEditing:(id)a3
{
}

- (void)_didBeginEditing:(id)a3
{
}

- (void)_textDidChange:(id)a3
{
  if ([(SBHSearchTextField *)self _hasSearchText]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 1;
  }
  [(SBHSearchTextField *)self setClearButtonMode:v4];
}

- (void)setAlignmentBehavior:(int64_t)a3
{
}

- (void)setAlignmentBehavior:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_alignmentBehavior != a3)
  {
    BOOL v4 = a4;
    self->_alignmentBehavior = a3;
    uint64_t v6 = [(SBHSearchTextField *)self isEditing];
    [(SBHSearchTextField *)self _updateTextAlignmentForEditing:v6 animated:v4];
  }
}

- (BOOL)_hasSearchText
{
  v2 = [(UISearchTextField *)self text];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

+ (int64_t)_derivedTextAlignmentForBehavior:(int64_t)a3 hasSearchText:(BOOL)a4 isEditing:(BOOL)a5
{
  if (a5) {
    int64_t v5 = 4;
  }
  else {
    int64_t v5 = 1;
  }
  if (a3) {
    return 4;
  }
  else {
    return v5;
  }
}

- (int64_t)_derivedTextAlignment
{
  uint64_t v3 = [(SBHSearchTextField *)self isEditing];
  return [(SBHSearchTextField *)self _derivedTextAlignmentIfEditing:v3];
}

- (int64_t)_derivedTextAlignmentIfEditing:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(SBHSearchTextField *)self _hasSearchText];
  int64_t alignmentBehavior = self->_alignmentBehavior;
  double v7 = objc_opt_class();
  return [v7 _derivedTextAlignmentForBehavior:alignmentBehavior hasSearchText:v5 isEditing:v3];
}

- (void)_updateTextAlignmentForEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v6 = [(SBHSearchTextField *)self _derivedTextAlignmentIfEditing:a3];
  if (v6 != [(SBHSearchTextField *)self textAlignment])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __62__SBHSearchTextField__updateTextAlignmentForEditing_animated___block_invoke;
    v9[3] = &unk_1E6AAC838;
    v9[4] = self;
    v9[5] = v6;
    double v7 = _Block_copy(v9);
    double v8 = v7;
    if (v4) {
      [MEMORY[0x1E4FB1EB0] _animateUsingDefaultTimingWithOptions:6 animations:v7 completion:0];
    }
    else {
      (*((void (**)(void *))v7 + 2))(v7);
    }
  }
}

uint64_t __62__SBHSearchTextField__updateTextAlignmentForEditing_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) setTextAlignment:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)_effectiveAppearanceDidChange
{
  [(NSHashTable *)self->_styledViews removeAllObjects];
  [(SBHSearchTextField *)self updateVisualStyling];
  [(SBHSearchTextField *)self updateBorderVisualStyling];
  BOOL v3 = [(SBHSearchTextField *)self traitCollection];
  BOOL v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  if (IsAccessibilityCategory)
  {
    [(SBHSearchTextField *)self invalidateIntrinsicContentSize];
  }
}

- (void)updateVisualStyling
{
  BOOL v3 = [(SBHSearchTextField *)self traitCollection];
  BOOL v4 = (void *)MEMORY[0x1E4FB1E20];
  id v24 = v3;
  BOOL v5 = [v3 preferredContentSizeCategory];
  int64_t v6 = UIContentSizeCategoryClip();
  double v7 = [v4 traitCollectionWithPreferredContentSizeCategory:v6];

  double v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998] compatibleWithTraitCollection:v7];
  if ([(SBHSearchTextField *)self _derivedTextAlignment] == 1)
  {
    self->_alwaysHideLeadingView = 0;
  }
  else
  {
    double v9 = [v7 preferredContentSizeCategory];
    self->_alwaysHideLeadingView = UIContentSizeCategoryIsAccessibilityCategory(v9);
  }
  [(SBHSearchTextField *)self setFont:v8];
  if (updateVisualStyling_onceToken != -1) {
    dispatch_once(&updateVisualStyling_onceToken, &__block_literal_global_75);
  }
  double v10 = [MEMORY[0x1E4FB1618] whiteColor];
  [(SBHSearchTextField *)self setTintColor:v10];

  double v11 = [MEMORY[0x1E4FB1618] whiteColor];
  [(SBHSearchTextField *)self setTextColor:v11];

  uint64_t v12 = [v24 userInterfaceStyle];
  double v13 = [MEMORY[0x1E4FB1618] colorWithRed:0.32 green:0.32 blue:0.32 alpha:1.0];
  objc_opt_class();
  double v14 = [(SBHSearchTextField *)self leftView];
  objc_super v15 = SBFSafeCast();

  objc_opt_class();
  v16 = [(SBHSearchTextField *)self rightView];
  id v17 = SBFSafeCast();

  v18 = [(SBHSearchTextField *)self _clearButton];
  objc_super v19 = [(SBHSearchTextField *)self _placeholderLabel];
  [v19 setTextColor:v13];
  v20 = &updateVisualStyling_darkModeMagnifyingGlass;
  if (v12 == 2)
  {
    v21 = &updateVisualStyling_darkModeCancel;
  }
  else
  {
    v20 = &updateVisualStyling_lightModeMagnifyingGlass;
    v21 = &updateVisualStyling_lightModeCancel;
  }
  objc_storeStrong((id *)&self->_magnifyingGlassImage, (id)*v20);
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
    v22 = v17;
  }
  else {
    v22 = v15;
  }
  [v22 setImage:self->_magnifyingGlassImage];
  objc_storeStrong((id *)&self->_cancelButtonImage, (id)*v21);
  [v18 setImage:self->_cancelButtonImage forState:0];
  [(SBHSearchTextField *)self updateStyleForLeftView];
  [(SBHSearchTextField *)self updateStyleForRightView];
  [(SBHSearchTextField *)self updateStyleForClearButton];
  [(SBHSearchTextField *)self updateStyleForPlaceholderView];
  v23 = [(SBHSearchTextField *)self layer];
  [v23 setAllowsGroupBlending:0];
}

void __41__SBHSearchTextField_updateVisualStyling__block_invoke()
{
  id v16 = [MEMORY[0x1E4FB1830] configurationWithWeight:4];
  v0 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"magnifyingglass" withConfiguration:v16];
  v1 = [MEMORY[0x1E4FB1618] colorWithRed:0.32 green:0.32 blue:0.32 alpha:1.0];
  uint64_t v2 = [v0 imageWithTintColor:v1 renderingMode:1];
  BOOL v3 = (void *)updateVisualStyling_darkModeMagnifyingGlass;
  updateVisualStyling_darkModeMagnifyingGlass = v2;

  BOOL v4 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"magnifyingglass" withConfiguration:v16];
  BOOL v5 = [MEMORY[0x1E4FB1618] colorWithRed:0.32 green:0.32 blue:0.32 alpha:1.0];
  uint64_t v6 = [v4 imageWithTintColor:v5 renderingMode:1];
  double v7 = (void *)updateVisualStyling_lightModeMagnifyingGlass;
  updateVisualStyling_lightModeMagnifyingGlass = v6;

  double v8 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"xmark.circle.fill" withConfiguration:v16];
  double v9 = [MEMORY[0x1E4FB1618] colorWithRed:0.32 green:0.32 blue:0.32 alpha:1.0];
  uint64_t v10 = [v8 imageWithTintColor:v9 renderingMode:1];
  double v11 = (void *)updateVisualStyling_darkModeCancel;
  updateVisualStyling_darkModeCancel = v10;

  uint64_t v12 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"xmark.circle.fill" withConfiguration:v16];
  double v13 = [MEMORY[0x1E4FB1618] colorWithRed:0.32 green:0.32 blue:0.32 alpha:1.0];
  uint64_t v14 = [v12 imageWithTintColor:v13 renderingMode:1];
  objc_super v15 = (void *)updateVisualStyling_lightModeCancel;
  updateVisualStyling_lightModeCancel = v14;
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHSearchTextField;
  BOOL v5 = [(SBHSearchTextField *)&v8 font];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBHSearchTextField;
    [(SBHSearchTextField *)&v7 setFont:v4];
    [(SBHSearchTextField *)self invalidateIntrinsicContentSize];
  }
}

- (void)setReturnKeyType:(int64_t)a3
{
  if ([(SBHSearchTextField *)self returnKeyType] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHSearchTextField;
    [(SBHSearchTextField *)&v6 setReturnKeyType:a3];
    BOOL v5 = [MEMORY[0x1E4FB1900] activeInstance];
    [v5 takeTextInputTraitsFromDelegate];
    [v5 updateReturnKey:1];
  }
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = [(SBHSearchTextField *)self _derivedTextAlignment];
  BOOL v9 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1;
  -[SBHSearchTextField _calculatePlaceholderRectForBounds:alignment:isRTL:](self, "_calculatePlaceholderRectForBounds:alignment:isRTL:", v8, v9, x, y, width, height);
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = [(SBHSearchTextField *)self _derivedTextAlignment];
  -[SBHSearchTextField _calculateTextRectForBounds:alignment:isRTL:](self, "_calculateTextRectForBounds:alignment:isRTL:", v8, [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1, x, y, width, height);
  -[SBHSearchTextField _adjustedTextOrEditingRect:forBounds:](self, "_adjustedTextOrEditingRect:forBounds:");
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = [(SBHSearchTextField *)self _derivedTextAlignment];
  -[SBHSearchTextField _calculateEditingRectForBounds:alignment:isRTL:](self, "_calculateEditingRectForBounds:alignment:isRTL:", v8, [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1, x, y, width, height);
  -[SBHSearchTextField _adjustedTextOrEditingRect:forBounds:](self, "_adjustedTextOrEditingRect:forBounds:");
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGRect)clearButtonRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = [(SBHSearchTextField *)self _derivedTextAlignment];
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1) {
    -[SBHSearchTextField _frameForLeftViewWithinBounds:alignment:](self, "_frameForLeftViewWithinBounds:alignment:", v8, x, y, width, height);
  }
  else {
    -[SBHSearchTextField _frameForRightViewWithinBounds:alignment:](self, "_frameForRightViewWithinBounds:alignment:", v8, x, y, width, height);
  }
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGRect)leftViewRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = [(SBHSearchTextField *)self _derivedTextAlignment];
  -[SBHSearchTextField _frameForLeftViewWithinBounds:alignment:](self, "_frameForLeftViewWithinBounds:alignment:", v8, x, y, width, height);
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = [(SBHSearchTextField *)self _derivedTextAlignment];
  -[SBHSearchTextField _frameForRightViewWithinBounds:alignment:](self, "_frameForRightViewWithinBounds:alignment:", v8, x, y, width, height);
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (void)updateStyleForPlaceholderView
{
  id v7 = [(SBHSearchTextField *)self _placeholderView];
  if (!-[NSHashTable containsObject:](self->_styledViews, "containsObject:"))
  {
    BOOL v3 = [(UIView *)self->_backgroundView visualStylingProviderForCategory:1];
    [v3 automaticallyUpdateView:v7 withStyle:1];

    id v4 = [v7 layer];
    BOOL v5 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    [v4 setCompositingFilter:v5];

    [(NSHashTable *)self->_styledViews addObject:v7];
  }
  objc_opt_class();
  objc_super v6 = SBFSafeCast();
  [v6 setAdjustsFontSizeToFitWidth:1];
}

- (void)updateStyleForLeftView
{
  id v7 = [(SBHSearchTextField *)self leftView];
  if (!-[NSHashTable containsObject:](self->_styledViews, "containsObject:"))
  {
    BOOL v3 = [(UIView *)self->_backgroundView visualStylingProviderForCategory:1];
    [v3 automaticallyUpdateView:v7 withStyle:1];

    id v4 = [v7 layer];
    BOOL v5 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    [v4 setCompositingFilter:v5];

    [v7 setContentMode:1];
    [(NSHashTable *)self->_styledViews addObject:v7];
  }
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] != 1)
  {
    if (self->_alwaysHideLeadingView) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 3;
    }
    [(SBHSearchTextField *)self setLeftViewMode:v6];
  }
}

- (void)updateStyleForRightView
{
  id v7 = [(SBHSearchTextField *)self rightView];
  if (!-[NSHashTable containsObject:](self->_styledViews, "containsObject:"))
  {
    BOOL v3 = [(UIView *)self->_backgroundView visualStylingProviderForCategory:1];
    [v3 automaticallyUpdateView:v7 withStyle:1];

    id v4 = [v7 layer];
    BOOL v5 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    [v4 setCompositingFilter:v5];

    [v7 setContentMode:1];
    [(NSHashTable *)self->_styledViews addObject:v7];
  }
  if ([(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection] == 1)
  {
    if (self->_alwaysHideLeadingView) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 3;
    }
    [(SBHSearchTextField *)self setRightViewMode:v6];
  }
}

- (void)updateStyleForClearButton
{
  id v6 = [(SBHSearchTextField *)self _clearButton];
  if (!-[NSHashTable containsObject:](self->_styledViews, "containsObject:"))
  {
    BOOL v3 = [(UIView *)self->_backgroundView visualStylingProviderForCategory:1];
    [v3 automaticallyUpdateView:v6 withStyle:1];

    id v4 = [v6 layer];
    BOOL v5 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
    [v4 setCompositingFilter:v5];

    [v6 setContentMode:1];
    [(NSHashTable *)self->_styledViews addObject:v6];
  }
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBHSearchTextField;
  -[SBHSearchTextField _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(UIView *)self->_backgroundView _setContinuousCornerRadius:a3];
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6 = a5;
  [(SBHSearchTextField *)self bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double Height = v13;
  if ([(SBHSearchTextField *)self _derivedTextAlignment] != 1)
  {
    -[SBHSearchTextField editingRectForBounds:](self, "editingRectForBounds:", v8, v10, v12, Height);
    double v16 = v15;
    double v18 = v17;
    v24.origin.double x = v8;
    v24.origin.double y = v10;
    v24.size.double width = v12;
    v24.size.double height = Height;
    double Height = CGRectGetHeight(v24);
    double v10 = 0.0;
    double v8 = v16;
    double v12 = v18;
  }
  objc_super v19 = (void *)MEMORY[0x1E4FB1AD8];
  v20 = [v6 identifier];
  v21 = objc_msgSend(v19, "regionWithRect:identifier:", v20, v8, v10, v12, Height);

  return v21;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4FB1AE0];
  objc_super v5 = [(SBHSearchTextField *)self font];
  [v5 lineHeight];
  id v6 = objc_msgSend(v4, "beamWithPreferredLength:axis:", 2);

  double v7 = [MEMORY[0x1E4FB1AE8] styleWithShape:v6 constrainedAxes:2];

  return v7;
}

- (CGRect)_frameForLeftViewWithinBounds:(CGRect)a3 alignment:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = [(SBHSearchTextField *)self traitCollection];
  [v10 displayScale];
  uint64_t v12 = v11;

  UIRectCenteredYInRectScale();
  if (a4 == 1)
  {
    -[SBHSearchTextField _calculatePlaceholderRectForBounds:alignment:isRTL:](self, "_calculatePlaceholderRectForBounds:alignment:isRTL:", 1, 0, x, y, width, height, v12);
  }
  else
  {
    double v13 = x;
    double v14 = y;
    double v15 = width;
    double v16 = height;
  }
  CGRectGetMinX(*(CGRect *)&v13);
  UIRectCenteredYInRectScale();
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)_frameForRightViewWithinBounds:(CGRect)a3 alignment:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = [(SBHSearchTextField *)self traitCollection];
  [v10 displayScale];
  uint64_t v12 = v11;

  UIRectCenteredYInRectScale();
  if (a4 == 1)
  {
    -[SBHSearchTextField _calculatePlaceholderRectForBounds:alignment:isRTL:](self, "_calculatePlaceholderRectForBounds:alignment:isRTL:", 1, 1, x, y, width, height, v12);
  }
  else
  {
    double v13 = x;
    double v14 = y;
    double v15 = width;
    double v16 = height;
  }
  CGRectGetMaxX(*(CGRect *)&v13);
  UIRectCenteredYInRectScale();
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)_calculateEditingRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5
{
  double v5 = a3.size.height + -26.0;
  double v6 = v5 + 8.0 + 16.0;
  if (v5 < 0.0) {
    double v6 = 24.0;
  }
  if (self->_alwaysHideLeadingView) {
    double v6 = 16.0;
  }
  double v7 = a3.origin.x + v6;
  double v8 = a3.origin.y + 13.0;
  double v9 = a3.size.width - (v6 + v6);
  result.size.double height = v5;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (CGRect)_calculateTextRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5
{
  if (a4 == 1)
  {
    -[SBHSearchTextField _frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:](self, "_frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:", 1, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  else
  {
    double v8 = a3.size.height + -26.0;
    double v9 = v8 + 8.0 + 16.0;
    if (v8 < 0.0) {
      double v9 = 24.0;
    }
    if (self->_alwaysHideLeadingView) {
      double v9 = 16.0;
    }
    double v5 = a3.origin.x + v9;
    double v6 = a3.origin.y + 13.0;
    double v7 = a3.size.width - (v9 + v9);
  }
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)_calculatePlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v12 = [(SBHSearchTextField *)self traitCollection];
  [v12 displayScale];

  -[SBHSearchTextField _frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:](self, "_frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:", a4, v5, 0, x, y, width, height);
  double v15 = v14;
  double v17 = v16;
  if (a4 == 1)
  {
    if (height + -26.0 >= 0.0) {
      double v18 = height + -26.0 + 8.0;
    }
    else {
      double v18 = 8.0;
    }
    UIRectCenteredXInRectScale();
    double v15 = v22;
    double v23 = -2.0;
    if (v5) {
      double v23 = 2.0;
    }
    double v24 = v23 + v19;
    double v25 = -0.0;
    if (!v5) {
      double v25 = v18;
    }
    double MinX = v25 + v24;
    double v17 = v20 - v18;
  }
  else
  {
    double v27 = v13;
    -[SBHSearchTextField _calculateTextRectForBounds:alignment:isRTL:](self, "_calculateTextRectForBounds:alignment:isRTL:", a4, v5, x, y, width, height);
    if (v5) {
      double MinX = CGRectGetMaxX(*(CGRect *)&v28) - (v17 + 8.0);
    }
    else {
      double MinX = CGRectGetMinX(*(CGRect *)&v28);
    }
    double v21 = v27;
  }
  double v32 = v15;
  double v33 = v17;
  result.size.double height = v21;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = MinX;
  return result;
}

- (CGRect)_frameForPlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5 willOverflow:(BOOL *)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  v22[1] = *MEMORY[0x1E4F143B8];
  double v10 = [(SBHSearchTextField *)self traitCollection];
  [v10 displayScale];

  double v11 = height + -26.0;
  if (height + -26.0 < 0.0) {
    double v11 = 0.0;
  }
  double v12 = width - (v11 * 2.0 + 16.0);
  double v13 = [(SBHSearchTextField *)self placeholder];
  uint64_t v21 = *MEMORY[0x1E4FB06F8];
  double v14 = [(SBHSearchTextField *)self font];
  v22[0] = v14;
  double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
  objc_msgSend(v13, "boundingRectWithSize:options:attributes:context:", 0, v15, 0, width, height);

  BSSizeCeilForScale();
  if (a6) {
    *a6 = v16 > v12;
  }
  UIRectCenteredIntegralRectScale();
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

+ (id)borderColorForUserInterfaceStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = objc_msgSend(MEMORY[0x1E4FB1618], "colorWithWhite:alpha:", dbl_1D81E9648[a3], 0.08, v3);
  }
  return v5;
}

- (void)updateBorderVisualStyling
{
  uint64_t v3 = [(SBHSearchTextField *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  id v6 = [(UIView *)self->_backgroundView layer];
  id v5 = [(id)objc_opt_class() borderColorForUserInterfaceStyle:v4];
  objc_msgSend(v6, "setBorderColor:", objc_msgSend(v5, "CGColor"));
}

- (CGRect)_adjustedTextOrEditingRect:(CGRect)a3 forBounds:(CGRect)a4
{
  id v5 = [(SBHSearchTextField *)self traitCollection];
  [v5 displayScale];

  [(SBHSearchTextField *)self bounds];
  [(SBHSearchTextField *)self _padding];
  id v6 = [(SBHSearchTextField *)self font];
  [v6 lineHeight];

  BSFloatFloorForScale();
  UIRectCenteredYInRectScale();
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v8;
  result.origin.double x = v7;
  return result;
}

- (int64_t)alignmentBehavior
{
  return self->_alignmentBehavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelButtonImage, 0);
  objc_storeStrong((id *)&self->_magnifyingGlassImage, 0);
  objc_storeStrong((id *)&self->_styledViews, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end