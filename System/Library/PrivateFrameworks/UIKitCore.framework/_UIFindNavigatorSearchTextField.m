@interface _UIFindNavigatorSearchTextField
+ (id)_newlineImageForSize:(CGSize)a3 withTraitCollection:(id)a4;
- (BOOL)_canResignIfContainsFirstResponder;
- (BOOL)_delegateShouldScrollToVisibleWhenBecomingFirstResponder;
- (BOOL)_isTextRectWideEnoughForRightView:(CGRect)a3;
- (BOOL)_showsClearButtonWhenNonEmpty:(BOOL)a3;
- (BOOL)canResignFirstResponder;
- (BOOL)keyboardDidAppear;
- (CGRect)_applyRightViewOffsetIfApplicable:(CGRect)a3;
- (CGRect)_availableTextRectForBounds:(CGRect)a3 forEditing:(BOOL)a4;
- (CGRect)_availableTextRectForBounds:(CGRect)a3 forEditing:(BOOL)a4 accountForRightView:(BOOL)a5;
- (CGRect)_baselineLeftViewRectForBounds:(CGRect)a3;
- (CGRect)rightViewRectForBounds:(CGRect)a3;
- (CGRect)visibleRect;
- (_UIFindNavigatorSearchTextField)initWithFrame:(CGRect)a3;
- (id)text;
- (id)undoManager;
- (int64_t)keyboardAppearance;
- (void)insertNewline;
- (void)layoutSubviews;
- (void)setKeyboardDidAppear:(BOOL)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation _UIFindNavigatorSearchTextField

- (_UIFindNavigatorSearchTextField)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_UIFindNavigatorSearchTextField;
  v3 = -[UITextField initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(UITextField *)v3 _systemBackgroundView];
    [v5 setBackgroundContainer:1];
    objc_initWeak(&location, v4);
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __49___UIFindNavigatorSearchTextField_initWithFrame___block_invoke;
    v9[3] = &unk_1E52DA728;
    objc_copyWeak(&v10, &location);
    id v7 = (id)[v6 addObserverForName:@"UIKeyboardDidShowNotification" object:0 queue:0 usingBlock:v9];

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)willMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIFindNavigatorSearchTextField;
  -[UISearchTextField willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (!a3) {
    self->_keyboardDidAppear = 0;
  }
}

- (CGRect)visibleRect
{
  v2 = [(UIView *)self window];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)_canResignIfContainsFirstResponder
{
  return 0;
}

- (BOOL)canResignFirstResponder
{
  double v3 = [(UIResponder *)self _ui_findNavigatorResponder];
  char v4 = [v3 isChangingInputModes];

  if (v4) {
    return 0;
  }
  double v5 = [(UIResponder *)self _ui_findNavigatorResponder];
  if (v5)
  {
    BOOL keyboardDidAppear = self->_keyboardDidAppear;

    if (!keyboardDidAppear) {
      return 0;
    }
  }
  v8.receiver = self;
  v8.super_class = (Class)_UIFindNavigatorSearchTextField;
  return [(UISearchTextField *)&v8 canResignFirstResponder];
}

- (int64_t)keyboardAppearance
{
  v2 = [(UIResponder *)self _ui_findNavigatorResponder];
  int64_t v3 = [v2 keyboardAppearance];

  return v3;
}

- (id)undoManager
{
  v2 = [(UIView *)self nextResponder];
  int64_t v3 = [v2 undoManager];

  return v3;
}

- (BOOL)_delegateShouldScrollToVisibleWhenBecomingFirstResponder
{
  return 0;
}

- (BOOL)_showsClearButtonWhenNonEmpty:(BOOL)a3
{
  BOOL v4 = [(UIView *)self isFirstResponder];
  if (v4)
  {
    LOBYTE(v4) = [(UISearchTextField *)self _hasContent];
  }
  return v4;
}

- (CGRect)_applyRightViewOffsetIfApplicable:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v8 = [(UITextField *)self rightView];
  if (v8)
  {
    double v9 = (void *)v8;
    BOOL v10 = [(_UIFindNavigatorSearchTextField *)self _showsClearButtonWhenNonEmpty:[(UITextField *)self isEditing]];

    if (v10)
    {
      BOOL v11 = [(UIView *)self _shouldReverseLayoutDirection];
      [(UITextField *)self clearButtonRect];
      double v12 = CGRectGetWidth(v18);
      if (v11) {
        double v13 = v12;
      }
      else {
        double v13 = -v12;
      }
      v19.origin.CGFloat x = x;
      v19.origin.CGFloat y = y;
      v19.size.CGFloat width = width;
      v19.size.CGFloat height = height;
      CGRect v20 = CGRectOffset(v19, v13, 0.0);
      CGFloat x = v20.origin.x;
      CGFloat y = v20.origin.y;
      CGFloat width = v20.size.width;
      CGFloat height = v20.size.height;
    }
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)_baselineLeftViewRectForBounds:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)_UIFindNavigatorSearchTextField;
  -[UITextField _baselineLeftViewRectForBounds:](&v20, sel__baselineLeftViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([(UIView *)self _shouldReverseLayoutDirection])
  {
    -[_UIFindNavigatorSearchTextField _applyRightViewOffsetIfApplicable:](self, "_applyRightViewOffsetIfApplicable:", v5, v7, v9, v11);
    double v5 = v12;
    double v7 = v13;
    double v9 = v14;
    double v11 = v15;
  }
  double v16 = v5;
  double v17 = v7;
  double v18 = v9;
  double v19 = v11;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (CGRect)rightViewRectForBounds:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)_UIFindNavigatorSearchTextField;
  -[UISearchTextField rightViewRectForBounds:](&v20, sel_rightViewRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (![(UIView *)self _shouldReverseLayoutDirection])
  {
    -[_UIFindNavigatorSearchTextField _applyRightViewOffsetIfApplicable:](self, "_applyRightViewOffsetIfApplicable:", v5, v7, v9, v11);
    double v5 = v12;
    double v7 = v13;
    double v9 = v14;
    double v11 = v15;
  }
  double v16 = v5;
  double v17 = v7;
  double v18 = v9;
  double v19 = v11;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (BOOL)_isTextRectWideEnoughForRightView:(CGRect)a3
{
  double width = a3.size.width;
  [(UIView *)self bounds];
  -[_UIFindNavigatorSearchTextField rightViewRectForBounds:](self, "rightViewRectForBounds:");
  return width - CGRectGetWidth(v6) > 44.0;
}

- (CGRect)_availableTextRectForBounds:(CGRect)a3 forEditing:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  BOOL v10 = -[_UIFindNavigatorSearchTextField _showsClearButtonWhenNonEmpty:](self, "_showsClearButtonWhenNonEmpty:");
  -[_UIFindNavigatorSearchTextField _availableTextRectForBounds:forEditing:accountForRightView:](self, "_availableTextRectForBounds:forEditing:accountForRightView:", v4, v10, x, y, width, height);
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)_availableTextRectForBounds:(CGRect)a3 forEditing:(BOOL)a4 accountForRightView:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v25.receiver = self;
  v25.super_class = (Class)_UIFindNavigatorSearchTextField;
  -[UISearchTextField _availableTextRectForBounds:forEditing:](&v25, sel__availableTextRectForBounds_forEditing_, a4);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  if (v5)
  {
    double v19 = [(UITextField *)self rightView];
    if (v19 && ![(UIView *)self _shouldReverseLayoutDirection])
    {
      BOOL v24 = -[_UIFindNavigatorSearchTextField _isTextRectWideEnoughForRightView:](self, "_isTextRectWideEnoughForRightView:", v12, v14, v16, v18);

      if (v24)
      {
        -[_UIFindNavigatorSearchTextField rightViewRectForBounds:](self, "rightViewRectForBounds:", x, y, width, height);
        double v16 = v16 - CGRectGetWidth(v26);
      }
    }
    else
    {
    }
  }
  double v20 = v12;
  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)_UIFindNavigatorSearchTextField;
  [(UISearchTextField *)&v9 layoutSubviews];
  [(UIView *)self bounds];
  -[_UIFindNavigatorSearchTextField _availableTextRectForBounds:forEditing:accountForRightView:](self, "_availableTextRectForBounds:forEditing:accountForRightView:", [(UITextField *)self isEditing], 0, v3, v4, v5, v6);
  uint64_t v7 = -[_UIFindNavigatorSearchTextField _isTextRectWideEnoughForRightView:](self, "_isTextRectWideEnoughForRightView:") ^ 1;
  double v8 = [(UITextField *)self rightView];
  [v8 setHidden:v7];
}

+ (id)_newlineImageForSize:(CGSize)a3 withTraitCollection:(id)a4
{
  double height = a3.height;
  CGFloat width = a3.width;
  id v6 = a4;
  uint64_t v7 = +[UIColor secondarySystemFillColor];
  double v8 = [v7 resolvedColorWithTraitCollection:v6];

  objc_super v9 = +[UIColor labelColor];
  BOOL v10 = [v9 resolvedColorWithTraitCollection:v6];

  double v11 = +[UIImage systemImageNamed:@"return"];
  double v12 = [v11 imageWithTintColor:v10];

  [v6 displayScale];
  double v14 = v13;

  _UIGraphicsBeginImageContextWithOptions(0, 0, width, height, v14);
  ContextStack = GetContextStack(0);
  if (*(int *)ContextStack < 1) {
    double v16 = 0;
  }
  else {
    double v16 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
  }
  CGFloat v17 = *MEMORY[0x1E4F1DAD8];
  double v18 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v19 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x1E4F1DAD8], v18, width, height, height * 0.25);
  [v19 addClip];

  [v8 setFill];
  v23.origin.double x = v17;
  v23.origin.double y = v18;
  v23.size.CGFloat width = width;
  v23.size.double height = height;
  CGContextFillRect(v16, v23);
  v24.origin.double x = v17;
  v24.origin.double y = v18;
  v24.size.CGFloat width = width;
  v24.size.double height = height;
  CGRect v25 = CGRectInset(v24, 1.0, 1.0);
  objc_msgSend(v12, "drawInRect:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
  double v20 = _UIGraphicsGetImageFromCurrentImageContext(0);
  UIGraphicsEndImageContext();

  return v20;
}

- (void)insertNewline
{
  double v3 = [(UITextField *)self font];
  [v3 capHeight];
  double v4 = [(UITextField *)self font];
  [v4 descender];
  UICeilToViewScale(self);
  double v6 = v5;

  id v18 = objc_alloc_init((Class)off_1E52D2EB0);
  uint64_t v7 = objc_opt_class();
  double v8 = [(UIView *)self traitCollection];
  objc_super v9 = objc_msgSend(v7, "_newlineImageForSize:withTraitCollection:", v8, v6, v6);
  [v18 setImage:v9];

  BOOL v10 = [(UITextField *)self font];
  [v10 descender];
  objc_msgSend(v18, "setBounds:", 0.0, v11 * 0.5, v6, v6);

  double v12 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v18];
  double v13 = [(UITextField *)self textStorage];
  [v13 appendAttributedString:v12];

  double v14 = [(UITextField *)self selectedTextRange];
  double v15 = [v14 end];
  double v16 = [(UITextField *)self positionFromPosition:v15 inDirection:2 offset:1];

  CGFloat v17 = [(UITextField *)self textRangeFromPosition:v16 toPosition:v16];
  [(UITextField *)self setSelectedTextRange:v17];

  [(UIControl *)self _sendActionsForEvents:0x20000 withEvent:0];
}

- (id)text
{
  v7.receiver = self;
  v7.super_class = (Class)_UIFindNavigatorSearchTextField;
  v2 = [(UISearchTextField *)&v7 text];
  __int16 v6 = -4;
  double v3 = [NSString stringWithCharacters:&v6 length:1];
  double v4 = [v2 stringByReplacingOccurrencesOfString:v3 withString:@"\n"];

  return v4;
}

- (BOOL)keyboardDidAppear
{
  return self->_keyboardDidAppear;
}

- (void)setKeyboardDidAppear:(BOOL)a3
{
  self->_BOOL keyboardDidAppear = a3;
}

@end