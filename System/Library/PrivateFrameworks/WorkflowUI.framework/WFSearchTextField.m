@interface WFSearchTextField
- (BOOL)_hasSearchText;
- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged;
- (BOOL)resignFirstResponder;
- (CGRect)_adjustedTextOrEditingRect:(CGRect)a3 forBounds:(CGRect)a4;
- (CGRect)_calculateEditingRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5;
- (CGRect)_calculatePlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5;
- (CGRect)_calculateTextRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5;
- (CGRect)_frameForLeftViewWithinBounds:(CGRect)a3 alignment:(int64_t)a4;
- (CGRect)_frameForPlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5 willOverflow:(BOOL *)a6;
- (CGRect)_frameForRightViewWithinBounds:(CGRect)a3 alignment:(int64_t)a4;
- (CGRect)editingRectForBounds:(CGRect)a3;
- (CGRect)leftViewRectForBounds:(CGRect)a3;
- (CGRect)placeholderRectForBounds:(CGRect)a3;
- (CGRect)rightViewRectForBounds:(CGRect)a3;
- (CGRect)textRectForBounds:(CGRect)a3;
- (CGSize)_textFieldAccessorySizeFromBounds:(CGRect)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (WFSearchTextField)initWithStyle:(unint64_t)a3;
- (WFSearchTextFieldDelegate)textFieldDelegate;
- (double)_calculateHeightWithFont;
- (double)_defaultTextFieldHeight;
- (double)_textFieldAccessoryHorizontalMargin;
- (double)_textFieldAccessoryVerticalMargin;
- (double)_textFieldCornerRadius;
- (double)_textFieldHorizontalEdgeMargin;
- (double)_textFieldVerticalMargin;
- (id)_textFieldTextStyle;
- (int64_t)_derivedTextAlignment;
- (int64_t)_derivedTextAlignmentIfEditing:(BOOL)a3;
- (int64_t)alignmentBehavior;
- (unint64_t)style;
- (void)_didBeginEditing:(id)a3;
- (void)_didEndEditing:(id)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_updateTextAlignmentForEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)layoutSubviews;
- (void)setAlignmentBehavior:(int64_t)a3;
- (void)setAlignmentBehavior:(int64_t)a3 animated:(BOOL)a4;
- (void)setFont:(id)a3;
- (void)setReturnKeyType:(int64_t)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setText:(id)a3;
- (void)setTextFieldDelegate:(id)a3;
- (void)setTokens:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateClearButtonVisibility;
- (void)updateStyleForClearButton;
- (void)updateStyleForLeftView;
- (void)updateStyleForPlaceholderView;
- (void)updateStyleForRightView;
- (void)updateVisualStyling;
@end

@implementation WFSearchTextField

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textFieldDelegate);
  objc_storeStrong((id *)&self->_clearButtonImageView, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_cancelButtonImage, 0);
  objc_storeStrong((id *)&self->_magnifyingGlassImage, 0);
  objc_storeStrong((id *)&self->_styledViews, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

- (int64_t)alignmentBehavior
{
  return self->_alignmentBehavior;
}

- (void)setTextFieldDelegate:(id)a3
{
}

- (WFSearchTextFieldDelegate)textFieldDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textFieldDelegate);
  return (WFSearchTextFieldDelegate *)WeakRetained;
}

- (unint64_t)style
{
  return self->_style;
}

- (CGRect)_adjustedTextOrEditingRect:(CGRect)a3 forBounds:(CGRect)a4
{
  v5 = [(WFSearchTextField *)self traitCollection];
  [v5 displayScale];
  uint64_t v7 = v6;

  [(WFSearchTextField *)self bounds];
  [(WFSearchTextField *)self _padding];
  v8 = [(WFSearchTextField *)self font];
  [v8 lineHeight];

  uint64_t v21 = v7;
  UIRectCenteredYInRectScale();
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  if ([(WFSearchTextField *)self textAlignment] == 1)
  {
    if ([(id)*MEMORY[0x263F83300] userInterfaceLayoutDirection] == 1) {
      double v10 = v10 + -7.0;
    }
    else {
      double v10 = v10 + 7.0;
    }
  }
  double v17 = v16 + 6.0;
  double v18 = v12 + -3.0;
  double v19 = v10;
  double v20 = v14;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v18;
  result.origin.x = v19;
  return result;
}

- (CGRect)_frameForPlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5 willOverflow:(BOOL *)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v30[1] = *MEMORY[0x263EF8340];
  double v12 = [(WFSearchTextField *)self traitCollection];
  [v12 displayScale];
  double v14 = v13;

  [(WFSearchTextField *)self _textFieldAccessoryHorizontalMargin];
  double v16 = v15;
  -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
  double v18 = width - (v17 + v17 + v16 * 2.0);
  double v19 = [(WFSearchTextField *)self placeholder];
  uint64_t v29 = *MEMORY[0x263F814F0];
  double v20 = [(WFSearchTextField *)self font];
  v30[0] = v20;
  uint64_t v21 = [NSDictionary dictionaryWithObjects:v30 forKeys:&v29 count:1];
  objc_msgSend(v19, "boundingRectWithSize:options:attributes:context:", 0, v21, 0, width, height);
  double v23 = v22;

  double v24 = ceil(v14 * v23) / v14;
  if (a6) {
    *a6 = v24 > v18;
  }
  UIRectCenteredIntegralRectScale();
  result.size.double height = v28;
  result.size.double width = v27;
  result.origin.double y = v26;
  result.origin.double x = v25;
  return result;
}

- (CGRect)_calculatePlaceholderRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v12 = [(WFSearchTextField *)self traitCollection];
  [v12 displayScale];
  uint64_t v48 = v13;

  -[WFSearchTextField _frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:](self, "_frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:", a4, v5, 0, x, y, width, height);
  double v16 = v15;
  double v18 = v17;
  if (a4 == 1)
  {
    [(WFSearchTextField *)self _textFieldAccessoryHorizontalMargin];
    double v20 = v19;
    -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
    double v22 = v20 + v21;
    uint64_t v47 = v48;
    UIRectCenteredXInRectScale();
    double v49 = v24;
    double v26 = v25;
    double v28 = v27;
    double v29 = -2.0;
    if (v5) {
      double v29 = 2.0;
    }
    double v30 = v29 + v23;
    double v31 = -0.0;
    if (!v5) {
      double v31 = v22;
    }
    double MinX = v31 + v30;
    [(WFSearchTextField *)self _textFieldAccessoryHorizontalMargin];
    double v34 = v33;
    -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
    double v36 = v34 + v35;
    double v18 = v28;
    double v16 = v26 - v36;
  }
  else
  {
    double v49 = v14;
    -[WFSearchTextField _calculateTextRectForBounds:alignment:isRTL:](self, "_calculateTextRectForBounds:alignment:isRTL:", a4, v5, x, y, width, height);
    if (v5)
    {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v37);
      [(WFSearchTextField *)self _textFieldAccessoryHorizontalMargin];
      double MinX = MaxX - (v16 + v42);
    }
    else
    {
      double MinX = CGRectGetMinX(*(CGRect *)&v37);
    }
  }
  double v43 = v49;
  double v44 = MinX;
  double v45 = v16;
  double v46 = v18;
  result.size.double height = v46;
  result.size.double width = v45;
  result.origin.double y = v43;
  result.origin.double x = v44;
  return result;
}

- (CGRect)_calculateTextRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a4 == 1)
  {
    -[WFSearchTextField _frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:](self, "_frameForPlaceholderRectForBounds:alignment:isRTL:willOverflow:", 1, a5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  }
  else
  {
    [(WFSearchTextField *)self _textFieldHorizontalEdgeMargin];
    double v15 = v14;
    double v16 = 0.0;
    if (!self->_alwaysHideLeadingView)
    {
      -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
      double v18 = v17;
      [(WFSearchTextField *)self _textFieldAccessoryHorizontalMargin];
      double v16 = v18 + v19;
    }
    double v20 = v15 + v16;
    [(WFSearchTextField *)self _textFieldVerticalMargin];
    double v22 = v21;
    [(WFSearchTextField *)self _textFieldVerticalMargin];
    double v24 = v23;
    double v10 = x + v20;
    double v11 = y + v22;
    double v12 = width - (v20 + v20);
    double v13 = height - (v22 + v24) + 10.0;
  }
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGRect)_calculateEditingRectForBounds:(CGRect)a3 alignment:(int64_t)a4 isRTL:(BOOL)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(WFSearchTextField *)self _textFieldHorizontalEdgeMargin];
  double v11 = v10;
  double v12 = 0.0;
  if (!self->_alwaysHideLeadingView)
  {
    -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
    double v14 = v13;
    [(WFSearchTextField *)self _textFieldAccessoryHorizontalMargin];
    double v12 = v14 + v15;
  }
  double v16 = v11 + v12;
  [(WFSearchTextField *)self _textFieldVerticalMargin];
  double v18 = v17;
  [(WFSearchTextField *)self _textFieldVerticalMargin];
  double v19 = y + v18;
  double v20 = width - (v16 + v16);
  double v22 = height - (v18 + v21) + 10.0;
  double v23 = x + v16;
  result.size.double height = v22;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v23;
  return result;
}

- (CGRect)_frameForRightViewWithinBounds:(CGRect)a3 alignment:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = [(WFSearchTextField *)self traitCollection];
  [v10 displayScale];
  uint64_t v12 = v11;

  -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
  UIRectCenteredYInRectScale();
  if (a4 == 1)
  {
    -[WFSearchTextField _calculatePlaceholderRectForBounds:alignment:isRTL:](self, "_calculatePlaceholderRectForBounds:alignment:isRTL:", 1, 1, x, y, width, height, v12);
    CGRectGetMaxX(v17);
    [(WFSearchTextField *)self _textFieldAccessoryHorizontalMargin];
  }
  else
  {
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    CGRectGetMaxX(v18);
    [(WFSearchTextField *)self _textFieldHorizontalEdgeMargin];
    -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
  }
  UIRectCenteredYInRectScale();
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)_frameForLeftViewWithinBounds:(CGRect)a3 alignment:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v10 = [(WFSearchTextField *)self traitCollection];
  [v10 displayScale];
  uint64_t v12 = v11;

  -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
  UIRectCenteredYInRectScale();
  if (a4 == 1)
  {
    -[WFSearchTextField _calculatePlaceholderRectForBounds:alignment:isRTL:](self, "_calculatePlaceholderRectForBounds:alignment:isRTL:", 1, 0, x, y, width, height, v12);
    CGRectGetMinX(v17);
    [(WFSearchTextField *)self _textFieldAccessoryHorizontalMargin];
    -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
  }
  else
  {
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    CGRectGetMinX(v18);
    [(WFSearchTextField *)self _textFieldHorizontalEdgeMargin];
  }
  UIRectCenteredYInRectScale();
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFSearchTextField;
  -[WFSearchTextField _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(UIView *)self->_backgroundView _setContinuousCornerRadius:a3];
  [(UIVisualEffectView *)self->_blurView _setContinuousCornerRadius:a3];
}

- (void)updateStyleForClearButton
{
  id v8 = [(WFSearchTextField *)self _clearButton];
  if (!-[NSHashTable containsObject:](self->_styledViews, "containsObject:"))
  {
    [v8 setContentMode:1];
    [(NSHashTable *)self->_styledViews addObject:v8];
  }
  v3 = [(WFSearchTextField *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];
  objc_super v5 = (id *)MEMORY[0x263F15D58];
  if (v4 != 2) {
    objc_super v5 = (id *)MEMORY[0x263F15D50];
  }
  id v6 = *v5;

  uint64_t v7 = [v8 layer];
  [v7 setCompositingFilter:v6];
}

- (void)updateStyleForRightView
{
  id v9 = [(WFSearchTextField *)self rightView];
  if (!-[NSHashTable containsObject:](self->_styledViews, "containsObject:"))
  {
    [v9 setContentMode:1];
    [(NSHashTable *)self->_styledViews addObject:v9];
  }
  v3 = [(WFSearchTextField *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];
  objc_super v5 = (id *)MEMORY[0x263F15D58];
  if (v4 != 2) {
    objc_super v5 = (id *)MEMORY[0x263F15D50];
  }
  id v6 = *v5;

  uint64_t v7 = [v9 layer];
  [v7 setCompositingFilter:v6];

  if ([(id)*MEMORY[0x263F83300] userInterfaceLayoutDirection] == 1)
  {
    if (self->_alwaysHideLeadingView) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = 3;
    }
    [(WFSearchTextField *)self setRightViewMode:v8];
  }
}

- (void)updateStyleForLeftView
{
  id v9 = [(WFSearchTextField *)self leftView];
  if (!-[NSHashTable containsObject:](self->_styledViews, "containsObject:"))
  {
    [v9 setContentMode:1];
    [(NSHashTable *)self->_styledViews addObject:v9];
  }
  v3 = [(WFSearchTextField *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];
  objc_super v5 = (id *)MEMORY[0x263F15D58];
  if (v4 != 2) {
    objc_super v5 = (id *)MEMORY[0x263F15D50];
  }
  id v6 = *v5;

  uint64_t v7 = [v9 layer];
  [v7 setCompositingFilter:v6];

  if ([(id)*MEMORY[0x263F83300] userInterfaceLayoutDirection] != 1)
  {
    if (self->_alwaysHideLeadingView) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = 3;
    }
    [(WFSearchTextField *)self setLeftViewMode:v8];
  }
}

- (void)updateStyleForPlaceholderView
{
  v3 = [(WFSearchTextField *)self _placeholderView];
  uint64_t v4 = [(WFSearchTextField *)self traitCollection];
  uint64_t v5 = [v4 userInterfaceStyle];
  id v6 = (id *)MEMORY[0x263F15D58];
  if (v5 != 2) {
    id v6 = (id *)MEMORY[0x263F15D50];
  }
  id v7 = *v6;

  uint64_t v8 = [v3 layer];
  [v8 setCompositingFilter:v7];

  id v11 = v3;
  if (v11)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v11;
    }
    else {
      id v9 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  id v10 = v9;

  [v10 setAdjustsFontSizeToFitWidth:1];
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = [(WFSearchTextField *)self traitCollection];
  [v8 displayScale];

  -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  CGRectGetMaxX(v13);
  [(WFSearchTextField *)self _textFieldHorizontalEdgeMargin];
  -[WFSearchTextField _textFieldAccessorySizeFromBounds:](self, "_textFieldAccessorySizeFromBounds:", x, y, width, height);
  UIRectCenteredYInRectScale();
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
  int64_t v8 = [(WFSearchTextField *)self _derivedTextAlignment];
  -[WFSearchTextField _frameForLeftViewWithinBounds:alignment:](self, "_frameForLeftViewWithinBounds:alignment:", v8, x, y, width, height);
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (BOOL)resignFirstResponder
{
  v6.receiver = self;
  v6.super_class = (Class)WFSearchTextField;
  BOOL v3 = [(UISearchTextField *)&v6 resignFirstResponder];
  if (![(WFSearchTextField *)self _hasSearchText])
  {
    uint64_t v4 = [(WFSearchTextField *)self textFieldDelegate];
    [v4 textFieldDidResignFirstResponder];
  }
  return v3;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = [(WFSearchTextField *)self _derivedTextAlignment];
  -[WFSearchTextField _calculateEditingRectForBounds:alignment:isRTL:](self, "_calculateEditingRectForBounds:alignment:isRTL:", v8, [(id)*MEMORY[0x263F83300] userInterfaceLayoutDirection] == 1, x, y, width, height);
  -[WFSearchTextField _adjustedTextOrEditingRect:forBounds:](self, "_adjustedTextOrEditingRect:forBounds:");
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = [(WFSearchTextField *)self _derivedTextAlignment];
  -[WFSearchTextField _calculateTextRectForBounds:alignment:isRTL:](self, "_calculateTextRectForBounds:alignment:isRTL:", v8, [(id)*MEMORY[0x263F83300] userInterfaceLayoutDirection] == 1, x, y, width, height);
  -[WFSearchTextField _adjustedTextOrEditingRect:forBounds:](self, "_adjustedTextOrEditingRect:forBounds:");
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGRect)placeholderRectForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  int64_t v8 = [(WFSearchTextField *)self _derivedTextAlignment];
  BOOL v9 = [(id)*MEMORY[0x263F83300] userInterfaceLayoutDirection] == 1;
  -[WFSearchTextField _calculatePlaceholderRectForBounds:alignment:isRTL:](self, "_calculatePlaceholderRectForBounds:alignment:isRTL:", v8, v9, x, y, width, height);
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (void)setReturnKeyType:(int64_t)a3
{
  if ([(WFSearchTextField *)self returnKeyType] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)WFSearchTextField;
    [(WFSearchTextField *)&v6 setReturnKeyType:a3];
    uint64_t v5 = [MEMORY[0x263F828B0] activeInstance];
    [v5 takeTextInputTraitsFromDelegate];
    [v5 updateReturnKey:1];
  }
}

- (void)setFont:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)WFSearchTextField;
  uint64_t v5 = [(WFSearchTextField *)&v8 font];
  char v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)WFSearchTextField;
    [(WFSearchTextField *)&v7 setFont:v4];
    [(WFSearchTextField *)self invalidateIntrinsicContentSize];
  }
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
  [(WFSearchTextField *)self updateVisualStyling];
}

- (void)updateVisualStyling
{
  BOOL v3 = [(WFSearchTextField *)self traitCollection];
  id v4 = (void *)MEMORY[0x263F82DA0];
  id v36 = v3;
  uint64_t v5 = [v3 preferredContentSizeCategory];
  char v6 = WFUIContentSizeCategoryClip(v5, (void *)*MEMORY[0x263F83488], (void *)*MEMORY[0x263F83408]);
  objc_super v7 = [v4 traitCollectionWithPreferredContentSizeCategory:v6];

  objc_super v8 = (void *)MEMORY[0x263F81708];
  BOOL v9 = [(WFSearchTextField *)self _textFieldTextStyle];
  double v10 = [v8 preferredFontForTextStyle:v9 compatibleWithTraitCollection:v7];

  double v11 = [MEMORY[0x263F82818] configurationWithFont:v10];
  if ([(WFSearchTextField *)self _derivedTextAlignment] == 1)
  {
    self->_alwaysHideLeadingView = 0;
  }
  else
  {
    double v12 = [v7 preferredContentSizeCategory];
    self->_alwaysHideLeadingView = UIContentSizeCategoryIsAccessibilityCategory(v12);
  }
  [(WFSearchTextField *)self setFont:v10];
  clearButtonImageView = self->_clearButtonImageView;
  double v14 = [MEMORY[0x263F827E8] systemImageNamed:@"xmark.circle.fill" withConfiguration:v11];
  [(UIImageView *)clearButtonImageView setImage:v14];

  if (updateVisualStyling_onceToken != -1) {
    dispatch_once(&updateVisualStyling_onceToken, &__block_literal_global_116);
  }
  uint64_t v15 = [v36 userInterfaceStyle];
  if (v15 == 2) {
    [MEMORY[0x263F825C8] labelColor];
  }
  else {
  double v16 = [MEMORY[0x263F825C8] systemBlueColor];
  }
  [(WFSearchTextField *)self setTintColor:v16];

  CGRect v17 = [MEMORY[0x263F825C8] labelColor];
  [(WFSearchTextField *)self setTextColor:v17];

  CGRect v18 = [(WFSearchTextField *)self _placeholderLabel];
  if (v15 == 2) {
    [MEMORY[0x263F825C8] colorWithWhite:0.46 alpha:1.0];
  }
  else {
  double v19 = [MEMORY[0x263F825C8] secondaryLabelColor];
  }
  [v18 setTextColor:v19];

  double v20 = [(WFSearchTextField *)self leftView];
  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v21 = v20;
    }
    else {
      double v21 = 0;
    }
  }
  else
  {
    double v21 = 0;
  }
  id v22 = v21;

  double v23 = [(WFSearchTextField *)self rightView];
  if (v23)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v24 = v23;
    }
    else {
      double v24 = 0;
    }
  }
  else
  {
    double v24 = 0;
  }
  id v25 = v24;

  double v26 = &updateVisualStyling_darkModeMagnifyingGlass;
  if (v15 != 2) {
    double v26 = &updateVisualStyling_lightModeMagnifyingGlass;
  }
  objc_storeStrong((id *)&self->_magnifyingGlassImage, (id)*v26);
  if ([(id)*MEMORY[0x263F83300] userInterfaceLayoutDirection] == 1) {
    double v27 = v25;
  }
  else {
    double v27 = v22;
  }
  [v27 setImage:self->_magnifyingGlassImage];
  double v28 = [(UIView *)self->_backgroundView layer];
  [v28 setCornerCurve:*MEMORY[0x263F15A20]];

  double v29 = [(UIView *)self->_backgroundView layer];
  [(WFSearchTextField *)self _textFieldCornerRadius];
  objc_msgSend(v29, "setCornerRadius:");

  [(WFSearchTextField *)self updateStyleForLeftView];
  [(WFSearchTextField *)self updateStyleForRightView];
  [(WFSearchTextField *)self updateStyleForClearButton];
  [(WFSearchTextField *)self updateStyleForPlaceholderView];
  if ([(WFSearchTextField *)self style] != 1)
  {
    double v30 = [(WFSearchTextField *)self traitCollection];
    uint64_t v31 = [v30 userInterfaceStyle];
    v32 = (id *)MEMORY[0x263F15D58];
    if (v31 != 2) {
      v32 = (id *)MEMORY[0x263F15D50];
    }
    id v33 = *v32;

    double v34 = [(UIView *)self->_backgroundView layer];
    [v34 setCompositingFilter:v33];
  }
  double v35 = [(WFSearchTextField *)self layer];
  [v35 setAllowsGroupBlending:0];
}

void __40__WFSearchTextField_updateVisualStyling__block_invoke()
{
  id v8 = [MEMORY[0x263F82818] configurationWithWeight:4];
  v0 = [MEMORY[0x263F827E8] _systemImageNamed:@"magnifyingglass" withConfiguration:v8];
  v1 = [MEMORY[0x263F825C8] colorWithWhite:0.46 alpha:1.0];
  uint64_t v2 = [v0 imageWithTintColor:v1 renderingMode:1];
  BOOL v3 = (void *)updateVisualStyling_darkModeMagnifyingGlass;
  updateVisualStyling_darkModeMagnifyingGlass = v2;

  id v4 = [MEMORY[0x263F827E8] _systemImageNamed:@"magnifyingglass" withConfiguration:v8];
  uint64_t v5 = [MEMORY[0x263F825C8] secondaryLabelColor];
  uint64_t v6 = [v4 imageWithTintColor:v5 renderingMode:1];
  objc_super v7 = (void *)updateVisualStyling_lightModeMagnifyingGlass;
  updateVisualStyling_lightModeMagnifyingGlass = v6;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFSearchTextField;
  [(WFSearchTextField *)&v11 traitCollectionDidChange:v4];
  [(NSHashTable *)self->_styledViews removeAllObjects];
  [(WFSearchTextField *)self updateVisualStyling];
  if (v4)
  {
    uint64_t v5 = [v4 preferredContentSizeCategory];
    uint64_t v6 = [(WFSearchTextField *)self traitCollection];
    objc_super v7 = [v6 preferredContentSizeCategory];

    if (v5 != v7)
    {
      id v8 = [(WFSearchTextField *)self traitCollection];
      BOOL v9 = [v8 preferredContentSizeCategory];
      IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v9);

      if (IsAccessibilityCategory) {
        [(WFSearchTextField *)self invalidateIntrinsicContentSize];
      }
    }
  }
}

- (void)setTokens:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFSearchTextField;
  [(UISearchTextField *)&v4 setTokens:a3];
  [(WFSearchTextField *)self updateClearButtonVisibility];
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFSearchTextField;
  [(UISearchTextField *)&v4 setText:a3];
  [(WFSearchTextField *)self updateClearButtonVisibility];
}

- (void)_updateTextAlignmentForEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v6 = [(WFSearchTextField *)self _derivedTextAlignmentIfEditing:a3];
  if (v6 != [(WFSearchTextField *)self textAlignment])
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __61__WFSearchTextField__updateTextAlignmentForEditing_animated___block_invoke;
    v9[3] = &unk_2649CB118;
    v9[4] = self;
    v9[5] = v6;
    objc_super v7 = _Block_copy(v9);
    id v8 = v7;
    if (v4) {
      [MEMORY[0x263F82E00] _animateUsingDefaultTimingWithOptions:6 animations:v7 completion:0];
    }
    else {
      (*((void (**)(void *))v7 + 2))(v7);
    }
  }
}

uint64_t __61__WFSearchTextField__updateTextAlignmentForEditing_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) setTextAlignment:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (int64_t)_derivedTextAlignmentIfEditing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(WFSearchTextField *)self _hasSearchText] && !v3) {
    return 4;
  }
  if (v3) {
    int64_t v6 = 4;
  }
  else {
    int64_t v6 = 1;
  }
  if (self->_alignmentBehavior) {
    return 4;
  }
  else {
    return v6;
  }
}

- (int64_t)_derivedTextAlignment
{
  uint64_t v3 = [(WFSearchTextField *)self isEditing];
  return [(WFSearchTextField *)self _derivedTextAlignmentIfEditing:v3];
}

- (BOOL)_hasSearchText
{
  uint64_t v3 = [(UISearchTextField *)self text];
  if ([v3 length])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(UISearchTextField *)self tokens];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (void)setAlignmentBehavior:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_alignmentBehavior != a3)
  {
    BOOL v4 = a4;
    self->_alignmentBehavior = a3;
    uint64_t v6 = [(WFSearchTextField *)self isEditing];
    [(WFSearchTextField *)self _updateTextAlignmentForEditing:v6 animated:v4];
  }
}

- (void)setAlignmentBehavior:(int64_t)a3
{
}

- (void)updateClearButtonVisibility
{
  BOOL v3 = [(WFSearchTextField *)self _hasSearchText];
  [(UIButton *)self->_clearButton alpha];
  if (((v3 ^ (v4 != 1.0)) & 1) == 0)
  {
    clearButtonImageView = self->_clearButtonImageView;
    if (v3)
    {
      CGAffineTransformMakeScale(&v10, 0.8, 0.8);
      double v6 = 0.25;
    }
    else
    {
      long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      *(_OWORD *)&v10.a = *MEMORY[0x263F000D0];
      *(_OWORD *)&v10.c = v7;
      *(_OWORD *)&v10.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      double v6 = 0.15;
    }
    [(UIImageView *)clearButtonImageView setTransform:&v10];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __48__WFSearchTextField_updateClearButtonVisibility__block_invoke;
    v8[3] = &unk_2649CBA30;
    v8[4] = self;
    BOOL v9 = v3;
    [MEMORY[0x263F82E00] _animateUsingSpringWithDampingRatio:1 response:v8 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:v6 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
  }
}

uint64_t __48__WFSearchTextField_updateClearButtonVisibility__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1256) layer];
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 0.0;
  }
  else {
    double v3 = 1.0;
  }
  double v4 = [NSNumber numberWithDouble:v3];
  [v2 setValue:v4 forKeyPath:@"filters.gaussianBlur.inputRadius"];

  if (*(unsigned char *)(a1 + 40)) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 1248) setAlpha:v5];
  double v6 = *(void **)(*(void *)(a1 + 32) + 1256);
  if (*(unsigned char *)(a1 + 40))
  {
    long long v7 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v9.a = *MEMORY[0x263F000D0];
    *(_OWORD *)&v9.c = v7;
    *(_OWORD *)&v9.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  }
  else
  {
    CGAffineTransformMakeScale(&v9, 0.87, 0.87);
  }
  return [v6 setTransform:&v9];
}

- (void)_didBeginEditing:(id)a3
{
  [(WFSearchTextField *)self _updateTextAlignmentForEditing:1 animated:1];
  [(WFSearchTextField *)self updateClearButtonVisibility];
}

- (void)_didEndEditing:(id)a3
{
  [(WFSearchTextField *)self _updateTextAlignmentForEditing:0 animated:1];
  [(WFSearchTextField *)self updateClearButtonVisibility];
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)WFSearchTextField;
  [(UISearchTextField *)&v3 layoutSubviews];
  [(WFSearchTextField *)self updateVisualStyling];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)WFSearchTextField;
  -[WFSearchTextField sizeThatFits:](&v14, sel_sizeThatFits_, a3.width, a3.height);
  double v6 = v5;
  double v8 = v7;
  [(WFSearchTextField *)self _calculateHeightWithFont];
  double v10 = v9;
  if (width < v6 || v9 < v8)
  {
    double v12 = fmax(width / v6, v9 / v8);
    double width = ceil(v6 * v12);
    double v10 = ceil(v8 * v12);
  }
  double v13 = width;
  result.double height = v10;
  result.double width = v13;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(WFSearchTextField *)self _calculateHeightWithFont];
  double v4 = v3;
  v7.receiver = self;
  v7.super_class = (Class)WFSearchTextField;
  [(UISearchTextField *)&v7 intrinsicContentSize];
  double v6 = v4;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (double)_calculateHeightWithFont
{
  double v3 = [(WFSearchTextField *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  double v6 = [(WFSearchTextField *)self font];
  [(WFSearchTextField *)self _textFieldVerticalMargin];
  double v8 = v7;
  [v6 lineHeight];
  double v10 = v9 + v8 * 2.0;
  [v6 descender];
  double v12 = v10 + v11;
  [(WFSearchTextField *)self _defaultTextFieldHeight];
  if (v12 >= v13)
  {
    double v15 = ceil(v5 * v12) / v5;
  }
  else
  {
    [(WFSearchTextField *)self _defaultTextFieldHeight];
    double v15 = v14;
  }

  return v15;
}

- (CGSize)_textFieldAccessorySizeFromBounds:(CGRect)a3
{
  double height = a3.size.height;
  [(WFSearchTextField *)self _textFieldAccessoryVerticalMargin];
  double v5 = fmax(height + v4 * -2.0, 0.0);
  double v6 = v5;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (double)_textFieldHorizontalEdgeMargin
{
  unint64_t v2 = [(WFSearchTextField *)self style];
  double result = 8.0;
  if (v2 - 1 <= 3) {
    return dbl_22DCC3498[v2 - 1];
  }
  return result;
}

- (double)_defaultTextFieldHeight
{
  unint64_t v2 = [(WFSearchTextField *)self style];
  if (v2 - 1 > 3) {
    return 36.0;
  }
  else {
    return dbl_22DCC3478[v2 - 1];
  }
}

- (double)_textFieldAccessoryHorizontalMargin
{
  unint64_t v2 = [(WFSearchTextField *)self style];
  BOOL v3 = v2 == 1 || v2 == 4;
  double result = 6.0;
  if (v3) {
    return 8.0;
  }
  return result;
}

- (double)_textFieldAccessoryVerticalMargin
{
  unint64_t v2 = [(WFSearchTextField *)self style];
  double result = 8.0;
  if (v2 - 1 <= 3) {
    return dbl_22DCC3458[v2 - 1];
  }
  return result;
}

- (double)_textFieldVerticalMargin
{
  unint64_t v2 = [(WFSearchTextField *)self style];
  double result = 0.0;
  if (v2 - 1 <= 3) {
    return dbl_22DCC3438[v2 - 1];
  }
  return result;
}

- (id)_textFieldTextStyle
{
  unint64_t v2 = [(WFSearchTextField *)self style];
  if ((unint64_t)(v2 - 1) <= 3) {
    unint64_t v2 = (char *)**((id **)&unk_2649CB138 + (void)(v2 - 1));
  }
  return v2;
}

- (double)_textFieldCornerRadius
{
  unint64_t v2 = [(WFSearchTextField *)self style];
  double result = 9.0;
  if (v2 - 1 <= 3) {
    return dbl_22DCC3418[v2 - 1];
  }
  return result;
}

- (WFSearchTextField)initWithStyle:(unint64_t)a3
{
  v78[4] = *MEMORY[0x263EF8340];
  v76.receiver = self;
  v76.super_class = (Class)WFSearchTextField;
  double v4 = -[WFSearchTextField initWithFrame:](&v76, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  double v5 = v4;
  if (v4)
  {
    [(WFSearchTextField *)v4 setBorderStyle:0];
    v5->_style = a3;
    double v6 = (void *)MEMORY[0x263F15C58];
    double v7 = (uint64_t *)MEMORY[0x263F15C78];
    double v8 = (void *)MEMORY[0x263F15C60];
    unint64_t v9 = 0x263EFF000uLL;
    if (a3 == 1)
    {
      double v10 = objc_alloc_init(WFBackdropView);
      backgroundView = v5->_backgroundView;
      v5->_backgroundView = &v10->super;

      double v12 = v5->_backgroundView;
      double v13 = [MEMORY[0x263F825C8] clearColor];
      [(UIView *)v12 setBackgroundColor:v13];

      double v14 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15CE8]];
      [v14 setValue:&unk_26E1CA8E8 forKey:*MEMORY[0x263F15CB0]];
      uint64_t v15 = *MEMORY[0x263F15BF8];
      [v14 setValue:&unk_26E1CA988 forKey:*MEMORY[0x263F15BF8]];
      double v16 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B50]];
      [v16 setValue:&unk_26E1CA9B8 forKey:v15];
      CGRect v17 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B10]];
      [v17 setValue:&unk_26E1CA9C8 forKey:v15];
      CGRect v18 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
      [v18 setValue:&unk_26E1CA9D8 forKey:*MEMORY[0x263F15C80]];
      [v18 setValue:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F15C68]];
      [v18 setValue:MEMORY[0x263EFFA80] forKey:*v6];
      uint64_t v19 = *v7;
      double v20 = v7;
      double v21 = v8;
      [v18 setValue:@"default" forKey:v19];
      [v18 setValue:@"default" forKey:*v8];
      id v22 = [(UIView *)v5->_backgroundView layer];
      v78[0] = v14;
      v78[1] = v16;
      v78[2] = v17;
      v78[3] = v18;
      double v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v78 count:4];
      [v22 setFilters:v23];

      double v8 = v21;
      double v7 = v20;
      double v6 = (void *)MEMORY[0x263F15C58];

      unint64_t v9 = 0x263EFF000;
    }
    else
    {
      double v24 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
      id v25 = v5->_backgroundView;
      v5->_backgroundView = v24;

      double v26 = v5->_backgroundView;
      double v14 = [MEMORY[0x263F825C8] colorWithDynamicProvider:&__block_literal_global_9245];
      [(UIView *)v26 setBackgroundColor:v14];
    }

    [(UIView *)v5->_backgroundView setUserInteractionEnabled:0];
    [(UIView *)v5->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v5->_backgroundView setAutoresizingMask:18];
    double v27 = v5->_backgroundView;
    [(WFSearchTextField *)v5 bounds];
    -[UIView setFrame:](v27, "setFrame:");
    [(WFSearchTextField *)v5 addSubview:v5->_backgroundView];
    [(WFSearchTextField *)v5 sendSubviewToBack:v5->_backgroundView];
    [(WFSearchTextField *)v5 setReturnKeyType:6];
    double v28 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v29 = [v28 userInterfaceIdiom];

    [(WFSearchTextField *)v5 setAutocorrectionType:(v29 & 0xFFFFFFFFFFFFFFFBLL) != 1];
    double v30 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v31 = [v30 userInterfaceIdiom];

    [(WFSearchTextField *)v5 setSpellCheckingType:(v31 & 0xFFFFFFFFFFFFFFFBLL) != 1];
    [(WFSearchTextField *)v5 setEnablesReturnKeyAutomatically:1];
    [(WFSearchTextField *)v5 setMinimumFontSize:10.0];
    [(WFSearchTextField *)v5 updateVisualStyling];
    uint64_t v32 = [MEMORY[0x263F824E8] buttonWithType:0];
    clearButton = v5->_clearButton;
    v5->_clearButton = (UIButton *)v32;

    [(UIButton *)v5->_clearButton setAlpha:0.0];
    [(WFSearchTextField *)v5 setRightView:v5->_clearButton];
    [(WFSearchTextField *)v5 setRightViewMode:3];
    [(WFSearchTextField *)v5 setClearButtonMode:0];
    double v34 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    clearButtonImageView = v5->_clearButtonImageView;
    v5->_clearButtonImageView = v34;

    [(UIImageView *)v5->_clearButtonImageView setContentMode:4];
    id v36 = v5->_clearButtonImageView;
    [(UIButton *)v5->_clearButton bounds];
    -[UIImageView setFrame:](v36, "setFrame:");
    [(UIImageView *)v5->_clearButtonImageView setAutoresizingMask:18];
    uint64_t v37 = v5->_clearButtonImageView;
    v38 = [MEMORY[0x263F825C8] systemGray2Color];
    [(UIImageView *)v37 setTintColor:v38];

    [(UIImageView *)v5->_clearButtonImageView setUserInteractionEnabled:0];
    [(UIButton *)v5->_clearButton addSubview:v5->_clearButtonImageView];
    v39 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
    [v39 setName:@"gaussianBlur"];
    [v39 setValue:&unk_26E1CA998 forKey:*MEMORY[0x263F15C80]];
    uint64_t v40 = MEMORY[0x263EFFA80];
    [v39 setValue:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F15C68]];
    [v39 setValue:v40 forKey:*v6];
    [v39 setValue:@"default" forKey:*v7];
    [v39 setValue:@"default" forKey:*v8];
    v41 = [(UIImageView *)v5->_clearButtonImageView layer];
    v77 = v39;
    double v42 = [*(id *)(v9 + 2240) arrayWithObjects:&v77 count:1];
    [v41 setFilters:v42];

    double v43 = v5->_clearButton;
    double v44 = (void *)MEMORY[0x263F823D0];
    v74[0] = MEMORY[0x263EF8330];
    v74[1] = 3221225472;
    v74[2] = __35__WFSearchTextField_initWithStyle___block_invoke_2;
    v74[3] = &unk_2649CB998;
    double v45 = v5;
    v75 = v45;
    double v46 = [v44 actionWithHandler:v74];
    [(UIButton *)v43 addAction:v46 forControlEvents:1];

    uint64_t v47 = v5->_clearButton;
    uint64_t v48 = (void *)MEMORY[0x263F823D0];
    v72[0] = MEMORY[0x263EF8330];
    v72[1] = 3221225472;
    v72[2] = __35__WFSearchTextField_initWithStyle___block_invoke_4;
    v72[3] = &unk_2649CB998;
    double v49 = v45;
    v73 = v49;
    v50 = [v48 actionWithHandler:v72];
    [(UIButton *)v47 addAction:v50 forControlEvents:16];

    v51 = v5->_clearButton;
    v52 = (void *)MEMORY[0x263F823D0];
    v70[0] = MEMORY[0x263EF8330];
    v70[1] = 3221225472;
    v70[2] = __35__WFSearchTextField_initWithStyle___block_invoke_6;
    v70[3] = &unk_2649CB998;
    v53 = v49;
    v71 = v53;
    v54 = [v52 actionWithHandler:v70];
    [(UIButton *)v51 addAction:v54 forControlEvents:64];

    v55 = v5->_clearButton;
    v56 = (void *)MEMORY[0x263F823D0];
    v68[0] = MEMORY[0x263EF8330];
    v68[1] = 3221225472;
    v68[2] = __35__WFSearchTextField_initWithStyle___block_invoke_7;
    v68[3] = &unk_2649CB998;
    v57 = v53;
    v69 = v57;
    v58 = [v56 actionWithHandler:v68];
    [(UIButton *)v55 addAction:v58 forControlEvents:352];

    uint64_t v59 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    styledViews = v57->_styledViews;
    v57->_styledViews = (NSHashTable *)v59;

    v61 = [MEMORY[0x263F08A00] defaultCenter];
    [v61 addObserver:v57 selector:sel__didEndEditing_ name:*MEMORY[0x263F83AD0] object:v57];

    v62 = [MEMORY[0x263F08A00] defaultCenter];
    [v62 addObserver:v57 selector:sel__didBeginEditing_ name:*MEMORY[0x263F83AC0] object:v57];

    v63 = [MEMORY[0x263F08A00] defaultCenter];
    [v63 addObserver:v57 selector:sel__textDidChange_ name:*MEMORY[0x263F83AC8] object:v57];

    v57->_alignmentBehavior = 0;
    [(WFSearchTextField *)v57 _updateTextAlignmentForEditing:0 animated:0];
    v64 = v5->_clearButton;
    v65 = WFLocalizedString(@"Clear search field");
    [(UIButton *)v64 setAccessibilityLabel:v65];

    v66 = v57;
  }

  return v5;
}

void __35__WFSearchTextField_initWithStyle___block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F82E00];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __35__WFSearchTextField_initWithStyle___block_invoke_3;
  v2[3] = &unk_2649CBF20;
  id v3 = *(id *)(a1 + 32);
  [v1 animateWithDuration:v2 animations:0 completion:0.0];
}

void __35__WFSearchTextField_initWithStyle___block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F82E00];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __35__WFSearchTextField_initWithStyle___block_invoke_5;
  v2[3] = &unk_2649CBF20;
  id v3 = *(id *)(a1 + 32);
  [v1 animateWithDuration:v2 animations:0 completion:0.25];
}

void __35__WFSearchTextField_initWithStyle___block_invoke_6(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isFirstResponder] & 1) == 0) {
    [*(id *)(a1 + 32) becomeFirstResponder];
  }
  [*(id *)(a1 + 32) setTokens:MEMORY[0x263EFFA68]];
  [*(id *)(a1 + 32) setText:&stru_26E1A5FC0];
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:*MEMORY[0x263F83AC8] object:*(void *)(a1 + 32)];
}

void __35__WFSearchTextField_initWithStyle___block_invoke_7(uint64_t a1)
{
  v1 = (void *)MEMORY[0x263F82E00];
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __35__WFSearchTextField_initWithStyle___block_invoke_8;
  v2[3] = &unk_2649CBF20;
  id v3 = *(id *)(a1 + 32);
  [v1 animateWithDuration:v2 animations:0 completion:0.25];
}

uint64_t __35__WFSearchTextField_initWithStyle___block_invoke_8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1256) setAlpha:1.0];
}

uint64_t __35__WFSearchTextField_initWithStyle___block_invoke_5(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1256) setAlpha:0.5];
}

uint64_t __35__WFSearchTextField_initWithStyle___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1256) setAlpha:0.5];
}

id __35__WFSearchTextField_initWithStyle___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 userInterfaceStyle] == 2) {
    [MEMORY[0x263F825C8] colorWithRed:0.363 green:0.363 blue:0.402 alpha:0.24];
  }
  else {
  id v2 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.075];
  }
  return v2;
}

@end