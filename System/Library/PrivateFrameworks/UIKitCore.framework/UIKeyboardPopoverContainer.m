@interface UIKeyboardPopoverContainer
+ (CGRect)frameAtOffset:(CGPoint)a3 keyboardSize:(CGSize)a4 screenSize:(CGSize)a5;
+ (CGSize)pillSize;
+ (CGSize)shadowOffset;
+ (UIColor)borderColor;
+ (UIColor)pillColor;
+ (UIColor)shadowColor;
+ (UIEdgeInsets)contentInsets;
+ (double)arrowHeight;
+ (double)borderWidth;
+ (double)cornerRadius;
+ (double)dragAreaHeight;
+ (double)edgeOffset;
+ (double)extraWidth;
+ (double)pillCornerRadius;
+ (double)pillDistanceToEdge;
+ (double)shadowOpacity;
+ (double)shadowRadius;
+ (id)propertiesForSpecificKeyboardFrame:(CGRect)a3 onScreenSize:(CGSize)a4;
+ (id)propertiesForTargetRect:(CGRect)a3 withHeight:(double)a4 onScreenSize:(CGSize)a5;
- (CGRect)frame;
- (UIKeyboardPopoverContainer)initWithView:(id)a3 usingBackdropStyle:(int64_t)a4;
- (UIView)affordance;
- (UIView)backdropParent;
- (void)_updateKeyboardLayoutGuideForPopover:(CGRect)a3;
- (void)applyProperties:(id)a3;
- (void)invalidate;
- (void)updateBackdropStyle:(int64_t)a3;
@end

@implementation UIKeyboardPopoverContainer

+ (double)edgeOffset
{
  [a1 contentInsets];
  return -v2;
}

+ (double)extraWidth
{
  [a1 contentInsets];
  double v4 = v3;
  [a1 contentInsets];
  return v4 + v5;
}

+ (UIColor)borderColor
{
  double v2 = +[UIKeyboardImpl activeInstance];
  double v3 = [v2 _inheritedRenderConfig];
  int v4 = [v3 lightKeyboard];

  if (v4)
  {
    double v5 = +[UIColor blackColor];
    v6 = [v5 colorWithAlphaComponent:0.08];
  }
  else
  {
    v6 = +[UIColor colorWithWhite:0.38 alpha:1.0];
  }
  return (UIColor *)v6;
}

+ (double)borderWidth
{
  double v2 = +[UIScreen mainScreen];
  [v2 nativeScale];
  double v4 = 1.0 / v3;

  return v4;
}

+ (double)cornerRadius
{
  double v2 = +[UIScreen mainScreen];
  [v2 nativeScale];
  double v4 = 20.0 / v3;

  return v4;
}

+ (double)arrowHeight
{
  double v2 = +[_UIPopoverStandardChromeView standardChromeViewClass];
  [(objc_class *)v2 arrowHeight];
  return result;
}

+ (UIColor)pillColor
{
  return +[UIColor lightGrayColor];
}

+ (double)pillCornerRadius
{
  return 2.0;
}

+ (CGSize)pillSize
{
  double v2 = 36.0;
  double v3 = 5.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (double)pillDistanceToEdge
{
  +[UIKeyboardPopoverContainer borderWidth];
  return v2 + 16.0;
}

+ (double)dragAreaHeight
{
  [a1 borderWidth];
  return v2 + 33.5;
}

- (UIView)affordance
{
  return [(_UIKeyboardPopoverAffordance *)self->_affordance dragArea];
}

+ (UIColor)shadowColor
{
  return +[UIColor blackColor];
}

+ (double)shadowOpacity
{
  return 0.17;
}

+ (double)shadowRadius
{
  double v2 = +[UIScreen mainScreen];
  [v2 nativeScale];
  double v4 = 30.0 / v3;

  return v4;
}

+ (CGSize)shadowOffset
{
  double v2 = +[UIScreen mainScreen];
  [v2 nativeScale];
  double v4 = 17.0 / v3;

  double v5 = 0.0;
  double v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGRect)frame
{
  [(UIView *)self->_popoverContainerView frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIKeyboardPopoverContainer)initWithView:(id)a3 usingBackdropStyle:(int64_t)a4
{
  id v6 = a3;
  v62.receiver = self;
  v62.super_class = (Class)UIKeyboardPopoverContainer;
  v7 = [(UIKeyboardPopoverContainer *)&v62 init];
  if (v7)
  {
    v8 = [_UIPopoverView alloc];
    v9 = +[_UIPopoverStandardChromeView standardChromeViewClass];
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v14 = -[_UIPopoverView initWithFrame:backgroundViewClass:](v8, "initWithFrame:backgroundViewClass:", v9, *MEMORY[0x1E4F1DB28], v11, v12, v13);
    popover = v7->_popover;
    v7->_popover = (_UIPopoverView *)v14;

    [(_UIPopoverView *)v7->_popover setBackgroundStyle:6];
    [(_UIPopoverView *)v7->_popover setArrowDirection:2];
    v16 = [[_UIKeyboardPopover alloc] initWithPopoverView:v7->_popover];
    popoverContainerView = v7->_popoverContainerView;
    v7->_popoverContainerView = v16;

    id v18 = +[UIKeyboardPopoverContainer shadowColor];
    uint64_t v19 = [v18 CGColor];
    v20 = [(UIView *)v7->_popoverContainerView layer];
    [v20 setShadowColor:v19];

    +[UIKeyboardPopoverContainer shadowOpacity];
    float v22 = v21;
    v23 = [(UIView *)v7->_popoverContainerView layer];
    *(float *)&double v24 = v22;
    [v23 setShadowOpacity:v24];

    +[UIKeyboardPopoverContainer shadowRadius];
    double v26 = v25;
    v27 = [(UIView *)v7->_popoverContainerView layer];
    [v27 setShadowRadius:v26];

    +[UIKeyboardPopoverContainer shadowOffset];
    double v29 = v28;
    double v31 = v30;
    v32 = [(UIView *)v7->_popoverContainerView layer];
    objc_msgSend(v32, "setShadowOffset:", v29, v31);

    [v6 insertSubview:v7->_popoverContainerView atIndex:0];
    v33 = [(_UIPopoverView *)v7->_popover contentView];
    v34 = [v33 layer];

    id v35 = [(id)objc_opt_class() borderColor];
    objc_msgSend(v34, "setBorderColor:", objc_msgSend(v35, "CGColor"));

    [(id)objc_opt_class() borderWidth];
    objc_msgSend(v34, "setBorderWidth:");
    [(UIKeyboardPopoverContainer *)v7 updateBackdropStyle:a4];
    v36 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v10, v11, v12, v13);
    v37 = [(_UIPopoverView *)v7->_popover contentView];
    [v37 addSubview:v36];

    v38 = objc_opt_new();
    [(UIView *)v36 addLayoutGuide:v38];
    v39 = [v38 leftAnchor];
    v40 = [(UIView *)v36 leftAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    [v41 setActive:1];

    v42 = [v38 rightAnchor];
    v43 = [(UIView *)v36 rightAnchor];
    v44 = [v42 constraintEqualToAnchor:v43];
    [v44 setActive:1];

    v45 = [v38 topAnchor];
    v46 = [(UIView *)v36 bottomAnchor];
    uint64_t v47 = [v45 constraintEqualToAnchor:v46];
    keyboardAreaHeight = v7->_keyboardAreaHeight;
    v7->_keyboardAreaHeight = (NSLayoutConstraint *)v47;

    [(NSLayoutConstraint *)v7->_keyboardAreaHeight setActive:1];
    v49 = [v38 bottomAnchor];
    v50 = [(UIView *)v36 bottomAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    [v51 setActive:1];

    v52 = -[_UIKeyboardPopoverAffordance initWithFrame:]([_UIKeyboardPopoverAffordance alloc], "initWithFrame:", v10, v11, v12, v13);
    affordance = v7->_affordance;
    v7->_affordance = v52;

    [(UIView *)v7->_affordance setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v36 addSubview:v7->_affordance];
    v54 = (void *)MEMORY[0x1E4F5B268];
    v55 = v7->_affordance;
    +[UIKeyboardPopoverContainer dragAreaHeight];
    v57 = [v54 constraintWithItem:v55 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v56];
    [(UIView *)v36 addConstraint:v57];

    v58 = [MEMORY[0x1E4F5B268] constraintWithItem:v7->_affordance attribute:1 relatedBy:0 toItem:v36 attribute:1 multiplier:1.0 constant:0.0];
    [(UIView *)v36 addConstraint:v58];

    v59 = [MEMORY[0x1E4F5B268] constraintWithItem:v7->_affordance attribute:2 relatedBy:0 toItem:v36 attribute:2 multiplier:1.0 constant:0.0];
    [(UIView *)v36 addConstraint:v59];

    v60 = [MEMORY[0x1E4F5B268] constraintWithItem:v7->_affordance attribute:4 relatedBy:0 toItem:v36 attribute:4 multiplier:1.0 constant:0.0];
    [(UIView *)v36 addConstraint:v60];
  }
  return v7;
}

- (UIView)backdropParent
{
  return (UIView *)[(_UIPopoverView *)self->_popover contentView];
}

- (void)updateBackdropStyle:(int64_t)a3
{
  backdrop = self->_backdrop;
  if (a3 == 3904)
  {
    if (backdrop) {
      [(UIView *)backdrop setAlpha:0.0];
    }
  }
  else
  {
    if (!backdrop)
    {
      id v6 = [UIKBVisualEffectView alloc];
      v7 = -[UIKBBackdropView initWithFrame:style:](v6, "initWithFrame:style:", a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v8 = self->_backdrop;
      self->_backdrop = v7;

      [(UIView *)self->_backdrop setAutoresizingMask:18];
      [(UIView *)self->_backdrop setUserInteractionEnabled:1];
      v9 = [(UIKeyboardPopoverContainer *)self backdropParent];
      [v9 insertSubview:self->_backdrop atIndex:0];

      backdrop = self->_backdrop;
    }
    [(UIView *)backdrop setAlpha:1.0];
    [(UIKBBackdropView *)self->_backdrop transitionToStyle:a3];
  }
  affordance = self->_affordance;
  [(_UIKeyboardPopoverAffordance *)affordance updateForBackdropStyle:a3];
}

+ (UIEdgeInsets)contentInsets
{
  double v2 = +[UIKeyboardImpl activeInstance];
  if (([v2 shouldShowCandidateBar] & 1) == 0)
  {

    goto LABEL_5;
  }
  double v3 = +[UIKeyboardImpl activeInstance];
  double v4 = [v3 inputDelegateManager];
  double v5 = [v4 forwardingInputDelegate];

  if (v5)
  {
LABEL_5:
    +[UIKeyboardPopoverContainer borderWidth];
    double v7 = v8 + 6.5;
    goto LABEL_6;
  }
  +[UIKeyboardPopoverContainer borderWidth];
  double v7 = v6;
LABEL_6:
  +[UIKeyboardPopoverContainer dragAreaHeight];
  double v10 = v9;
  +[UIKeyboardPopoverContainer borderWidth];
  double v12 = v11 + 6.5;
  +[UIKeyboardPopoverContainer borderWidth];
  double v14 = v13 + 6.5;
  double v15 = v7;
  double v16 = v12;
  double v17 = v10;
  result.right = v14;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

+ (id)propertiesForTargetRect:(CGRect)a3 withHeight:(double)a4 onScreenSize:(CGSize)a5
{
  double height = a5.height;
  double x = a3.origin.x;
  double width = a5.width;
  double v7 = a3.size.height;
  double v60 = a3.size.width;
  double y = a3.origin.y;
  v63[6] = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() arrowHeight];
  double v11 = v10;
  +[UIKeyboardImpl floatingWidth];
  double v13 = v12;
  [a1 contentInsets];
  double v15 = v14 + a4;
  [a1 contentInsets];
  double v17 = v15 + v16;
  [a1 contentInsets];
  double v19 = v18;
  [a1 contentInsets];
  double v21 = y;
  double v22 = v7;
  double v23 = v13 + v19 + v20;
  double v24 = y + v7;
  double v25 = height - (y + v7);
  double v26 = v11 + v15;
  if (v25 > v11 + v15)
  {
    char v27 = 0;
    if (x + v60 * 0.5 <= width * 0.5) {
      double v28 = 0.0;
    }
    else {
      double v28 = width - v13;
    }
    double v29 = v24 + v11;
    double v30 = v11 + v17;
    uint64_t v31 = 1;
    double v32 = v23;
    double v33 = v28;
    double v34 = v60;
    double v35 = x;
    double v36 = v17;
    goto LABEL_14;
  }
  double v35 = x;
  double v34 = v60;
  if (y > v26)
  {
    if (x + v60 * 0.5 <= width * 0.5) {
      double v28 = 0.0;
    }
    else {
      double v28 = width - v13;
    }
    double v29 = y - v15 - v11;
    char v27 = 1;
    double v36 = v17;
    double v30 = v11 + v17;
    uint64_t v31 = 2;
    double v32 = v23;
    double v24 = v29;
    goto LABEL_13;
  }
  if (x > v11 + v13)
  {
    char v27 = 0;
    double v28 = 0.0 - v11;
    uint64_t v31 = 8;
    double v32 = v11 + v23;
    double v29 = y;
    double v36 = v17;
    double v30 = v17;
    double v24 = y;
LABEL_13:
    double v33 = v28;
    goto LABEL_14;
  }
  double v36 = v17;
  char v27 = 0;
  if (width - (x + v60) <= v11 + v13)
  {
    uint64_t v31 = 0;
    double v24 = height - v26;
    double v33 = 0.0;
    double v32 = v13 + v19 + v20;
    double v30 = v17;
    double v29 = height - v26;
    double v28 = 0.0;
    goto LABEL_19;
  }
  double v33 = width - v13;
  double v28 = v11 + width - v13;
  double v32 = v11 + v23;
  uint64_t v31 = 4;
  double v29 = y;
  double v30 = v17;
  double v24 = y;
LABEL_14:
  if (v33 < 0.0)
  {
    double v28 = v28 - v33;
    double v33 = 0.0;
    goto LABEL_21;
  }
LABEL_19:
  if (v33 > width - v32)
  {
    double v28 = v28 - (v33 - (width - v30));
    double v33 = width - v13;
  }
LABEL_21:
  if (v24 >= 0.0)
  {
    double v37 = height - v30;
    if (v24 >= height - v30) {
      double v29 = v29 - (v24 - v37);
    }
    else {
      double v37 = v24;
    }
  }
  else
  {
    double v29 = v29 - v24;
    double v37 = 0.0;
  }
  double v59 = v32;
  double v61 = v30;
  char v38 = v27 ^ 1;
  if (v25 > v26) {
    char v38 = 0;
  }
  double v39 = v36;
  double v40 = v36;
  double v41 = v29;
  if ((v38 & 1) == 0)
  {
    double v22 = v34;
    double v21 = v35;
    double v40 = v23;
    double v41 = v28;
  }
  double v42 = v21 + v22 * 0.5 - (v40 * 0.5 + v41);
  double v43 = v23;
  objc_msgSend(a1, "contentInsets", *(void *)&height);
  double v45 = v29 - v44;
  [a1 contentInsets];
  double v47 = v45 - v46;
  [a1 contentInsets];
  double v49 = v28 + v48;
  v62[0] = @"ArrowDirection";
  v50 = [NSNumber numberWithUnsignedInteger:v31];
  v63[0] = v50;
  v62[1] = @"ArrowOffset";
  v51 = [NSNumber numberWithDouble:v42];
  v63[1] = v51;
  v62[2] = _UIKeyboardPopoverKeyboardRect;
  v52 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v49, v47, v43, v39);
  v63[2] = v52;
  v62[3] = @"PopoverRect";
  v53 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v33, v37, v59, v61);
  v63[3] = v53;
  v63[4] = &unk_1ED3F20E8;
  v62[4] = @"Alpha";
  v62[5] = @"KeyboardSize";
  v54 = [NSNumber numberWithDouble:v39];
  v63[5] = v54;
  v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v63 forKeys:v62 count:6];

  return v55;
}

+ (CGRect)frameAtOffset:(CGPoint)a3 keyboardSize:(CGSize)a4 screenSize:(CGSize)a5
{
  double height = a4.height;
  double width = a4.width;
  double x = a3.x;
  CGFloat v9 = a5.height - (a4.height - a3.y);
  [a1 contentInsets];
  double v11 = v9 - v10;
  [a1 contentInsets];
  double v13 = v12;
  [(id)objc_opt_class() arrowHeight];
  double v15 = height + v13 + v14;
  [a1 contentInsets];
  double v17 = v15 + v16;
  [a1 contentInsets];
  double v19 = v18;
  [a1 contentInsets];
  double v21 = width + v19 + v20;
  [a1 contentInsets];
  double v23 = x - v22;
  double v24 = v11;
  double v25 = v21;
  double v26 = v17;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

+ (id)propertiesForSpecificKeyboardFrame:(CGRect)a3 onScreenSize:(CGSize)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double x = a3.origin.x;
  v28[6] = *MEMORY[0x1E4F143B8];
  CGFloat v8 = a4.height - (a3.size.height - a3.origin.y);
  [a1 contentInsets];
  CGFloat v10 = v8 - v9;
  [a1 contentInsets];
  double v12 = v11;
  [(id)objc_opt_class() arrowHeight];
  double v14 = height + v12 + v13;
  [a1 contentInsets];
  double v16 = v14 + v15;
  [a1 contentInsets];
  double v18 = v17;
  [a1 contentInsets];
  double v20 = width + v18 + v19;
  [a1 contentInsets];
  v27[0] = @"ArrowDirection";
  v27[1] = @"ArrowOffset";
  v28[0] = &unk_1ED3F54C0;
  v28[1] = &unk_1ED3F54C0;
  v27[2] = @"PopoverRect";
  double v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x - v21, v10, v20, v16);
  v28[2] = v22;
  v28[3] = &unk_1ED3F20E8;
  v27[3] = @"Alpha";
  v27[4] = @"KeyboardSize";
  double v23 = [NSNumber numberWithDouble:v16];
  v28[4] = v23;
  v27[5] = @"TouchInsets";
  double v24 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithUIEdgeInsets:", -20.0, -20.0, -20.0, -20.0);
  v28[5] = v24;
  double v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:6];

  return v25;
}

- (void)applyProperties:(id)a3
{
  id v4 = a3;
  double v5 = [v4 objectForKey:@"PopoverRect"];
  double v6 = v5;
  if (v5)
  {
    [v5 rectValue];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    popover = self->_popover;
    if (popover) {
      [(UIView *)popover transform];
    }
    else {
      memset(&t1, 0, sizeof(t1));
    }
    long long v44 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v45 = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&t2.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&t2.c = v44;
    long long v43 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&t2.tdouble x = v43;
    if (CGAffineTransformEqualToTransform(&t1, &t2))
    {
      -[UIView setFrame:](self->_popoverContainerView, "setFrame:", v8, v10, v12, v14);
    }
    else
    {
      double v16 = self->_popover;
      if (v16) {
        [(UIView *)v16 transform];
      }
      else {
        memset(&v48, 0, sizeof(v48));
      }
      *(_OWORD *)&t2.a = v45;
      *(_OWORD *)&t2.c = v44;
      *(_OWORD *)&t2.tdouble x = v43;
      if (!CGAffineTransformEqualToTransform(&v48, &t2))
      {
        double v17 = [(UIView *)self->_popoverContainerView layer];
        [v17 anchorPoint];
        double v19 = v8 + v12 * v18;

        double v20 = [(UIView *)self->_popoverContainerView layer];
        [v20 anchorPoint];
        double v22 = v10 + v14 * v21;

        -[UIView setCenter:](self->_popoverContainerView, "setCenter:", v19, v22);
        -[UIView setBounds:](self->_popoverContainerView, "setBounds:", 0.0, 0.0, v12, v14);
      }
    }
    -[UIKeyboardPopoverContainer _updateKeyboardLayoutGuideForPopover:](self, "_updateKeyboardLayoutGuideForPopover:", v8, v10, v12, v14, v43, v44, v45);
  }
  double v23 = [v4 objectForKey:@"ArrowOffset"];
  double v24 = v23;
  if (v23)
  {
    [v23 doubleValue];
    -[_UIPopoverView setArrowOffset:](self->_popover, "setArrowOffset:");
  }
  double v25 = [v4 objectForKey:@"ArrowDirection"];

  if (v25) {
    uint64_t v26 = [v25 integerValue];
  }
  else {
    uint64_t v26 = 0;
  }
  [(_UIPopoverView *)self->_popover setArrowDirection:v26];
  char v27 = [v4 objectForKey:@"Alpha"];

  if (v27)
  {
    [v27 doubleValue];
    -[UIView setAlpha:](self->_popoverContainerView, "setAlpha:");
  }
  double v28 = [v4 objectForKey:@"TouchInsets"];

  if (v28)
  {
    [v28 UIEdgeInsetsValue];
  }
  else
  {
    double v31 = 0.0;
    double v30 = 0.0;
    double v29 = 0.0;
    double v32 = 0.0;
  }
  -[UIView _setTouchInsets:](self->_popover, "_setTouchInsets:", v29, v30, v31, v32);
  double v33 = self->_popover;
  if ([(_UIPopoverView *)v33 arrowDirection]) {
    +[UIPopoverBackgroundView _contentViewCornerRadiusForArrowDirection:[(_UIPopoverView *)self->_popover arrowDirection]];
  }
  else {
    [(id)objc_opt_class() cornerRadius];
  }
  -[_UIPopoverView _setCornerRadius:](v33, "_setCornerRadius:");
  double v34 = [(_UIPopoverView *)self->_popover contentView];
  double v35 = [v34 layer];

  double v36 = [v4 objectForKey:@"KeyboardSize"];

  if (v36)
  {
    [v36 doubleValue];
  }
  else
  {
    [(UIView *)self->_popoverContainerView frame];
    double v37 = v38;
  }
  [(NSLayoutConstraint *)self->_keyboardAreaHeight setConstant:-v37];
  double v39 = [v4 objectForKey:@"Transform"];

  if (v39)
  {
    memset(&t2, 0, sizeof(t2));
    [v39 CGAffineTransformValue];
    CGAffineTransform v47 = t2;
    double v40 = self->_popover;
    double v41 = &v47;
  }
  else
  {
    double v40 = self->_popover;
    long long v42 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v46[0] = *MEMORY[0x1E4F1DAB8];
    v46[1] = v42;
    v46[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v41 = (CGAffineTransform *)v46;
  }
  [(UIView *)v40 setTransform:v41];
}

- (void)_updateKeyboardLayoutGuideForPopover:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!+[UIAssistantBarButtonItemProvider _isScribbleButtonsVisible])
  {
    if (+[UIKeyboard isInputSystemUI])
    {
      id v25 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      double v8 = [(UIView *)self->_popover _rootInputWindowController];
      uint64_t v9 = [v8 isTranslating];

      objc_msgSend(v25, "keyboardVisibilityDidChangeWithFrame:visible:tracking:", 1, v9, x, y, width, height);
    }
    else
    {
      v37.origin.double x = x;
      v37.origin.double y = y;
      v37.size.double width = width;
      v37.size.double height = height;
      if (!CGRectEqualToRect(*MEMORY[0x1E4F1DB28], v37))
      {
        double v10 = [(UIView *)self->_popover window];
        double v11 = [v10 screen];
        double v12 = [v11 fixedCoordinateSpace];

        double v13 = [(UIView *)self->_popover window];
        double v14 = [v13 windowScene];
        double v15 = [v14 coordinateSpace];

        double v16 = [(UIView *)self->_popover window];
        double v17 = [v16 windowScene];
        double v18 = +[UITextEffectsWindow activeTextEffectsWindowForWindowScene:v17];
        [v18 hostedViewReference];
        uint64_t v20 = v19;
        uint64_t v22 = v21;

        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __67__UIKeyboardPopoverContainer__updateKeyboardLayoutGuideForPopover___block_invoke;
        v26[3] = &unk_1E52FD688;
        double v29 = x;
        double v30 = y;
        double v31 = width;
        double v32 = height;
        BOOL v35 = v15 == 0;
        v26[4] = self;
        id v27 = v12;
        id v28 = v15;
        uint64_t v33 = v20;
        uint64_t v34 = v22;
        id v23 = v15;
        id v24 = v12;
        +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v26];
      }
    }
  }
}

void __67__UIKeyboardPopoverContainer__updateKeyboardLayoutGuideForPopover___block_invoke(uint64_t a1, void *a2)
{
  id v67 = a2;
  if ([v67 isTrackingKeyboard])
  {
    [v67 bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    double v11 = [*(id *)(*(void *)(a1 + 32) + 24) window];
    [v11 bounds];
    v79.origin.CGFloat x = v12;
    v79.origin.CGFloat y = v13;
    v79.size.CGFloat width = v14;
    v79.size.CGFloat height = v15;
    v69.origin.CGFloat x = v4;
    v69.origin.CGFloat y = v6;
    v69.size.CGFloat width = v8;
    v69.size.CGFloat height = v10;
    if (CGRectEqualToRect(v69, v79) && ![v67 _isHostedInAnotherProcess])
    {
    }
    else
    {
      int v16 = *(unsigned __int8 *)(a1 + 104);

      if (!v16)
      {
        double v17 = [v67 coordinateSpace];
        [v67 frame];
        objc_msgSend(v17, "convertRect:toCoordinateSpace:", *(void *)(a1 + 40));
        double v19 = v18;
        double v21 = v20;
        double v23 = v22;
        double v25 = v24;

        objc_msgSend(*(id *)(a1 + 48), "convertRect:fromCoordinateSpace:", *(void *)(a1 + 40), v19, v21, v23, v25);
        CGFloat x = v70.origin.x;
        CGFloat y = v70.origin.y;
        CGFloat width = v70.size.width;
        CGFloat height = v70.size.height;
        v80.size.CGFloat width = *(CGFloat *)(a1 + 72);
        v80.size.CGFloat height = *(CGFloat *)(a1 + 80);
        v80.origin.CGFloat x = *(double *)(a1 + 56) - *(double *)(a1 + 88);
        v80.origin.CGFloat y = *(double *)(a1 + 64) - *(double *)(a1 + 96);
        CGRect v71 = CGRectIntersection(v70, v80);
        double MinX = v71.origin.x;
        double MaxY = v71.origin.y;
        double v32 = v71.size.width;
        double v33 = v71.size.height;
        if (CGRectIsEmpty(v71))
        {
          v72.origin.CGFloat x = x;
          v72.origin.CGFloat y = y;
          v72.size.CGFloat width = width;
          v72.size.CGFloat height = height;
          double MinX = CGRectGetMinX(v72);
          v73.origin.CGFloat x = x;
          v73.origin.CGFloat y = y;
          v73.size.CGFloat width = width;
          v73.size.CGFloat height = height;
          double MaxY = CGRectGetMaxY(v73);
          [v67 frame];
          double v32 = v34;
          [v67 insetForDismissedKeyboardGuide];
          double v33 = v35;
        }
        objc_msgSend(*(id *)(a1 + 48), "convertRect:toCoordinateSpace:", *(void *)(a1 + 40), MinX, MaxY, v32, v33);
        double v37 = v36;
        double v39 = v38;
        double v41 = v40;
        double v43 = v42;
        long long v44 = [v67 coordinateSpace];
        objc_msgSend(v44, "convertRect:fromCoordinateSpace:", *(void *)(a1 + 40), v37, v39, v41, v43);
        CGFloat v46 = v45;
        CGFloat v48 = v47;
        double v50 = v49;
        double v52 = v51;

        v53 = v67;
        goto LABEL_10;
      }
    }
    v54 = [*(id *)(*(void *)(a1 + 32) + 24) window];
    objc_msgSend(v67, "convertRect:fromWindow:", v54, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
    CGFloat v56 = v55;
    CGFloat v58 = v57;
    CGFloat v60 = v59;
    CGFloat v62 = v61;

    [v67 frame];
    v81.origin.CGFloat x = v56;
    v81.origin.CGFloat y = v58;
    v81.size.CGFloat width = v60;
    v81.size.CGFloat height = v62;
    CGRect v75 = CGRectIntersection(v74, v81);
    v53 = v67;
    CGFloat v46 = v75.origin.x;
    CGFloat v48 = v75.origin.y;
    double v50 = v75.size.width;
    double v52 = v75.size.height;
LABEL_10:
    v63 = [v53 _primaryKeyboardTrackingGuide];
    objc_msgSend(v63, "changeSizingConstants:", v50, v52);

    v64 = [v67 _primaryKeyboardTrackingGuide];
    v76.origin.CGFloat x = v46;
    v76.origin.CGFloat y = v48;
    v76.size.CGFloat width = v50;
    v76.size.CGFloat height = v52;
    double v65 = CGRectGetMinX(v76);
    [v67 frame];
    double v66 = CGRectGetMaxY(v77);
    v78.origin.CGFloat x = v46;
    v78.origin.CGFloat y = v48;
    v78.size.CGFloat width = v50;
    v78.size.CGFloat height = v52;
    objc_msgSend(v64, "changeOffsetConstants:", v65, v66 - CGRectGetMaxY(v78));
  }
}

- (void)invalidate
{
  [(UIView *)self->_popover removeFromSuperview];
  popover = self->_popover;
  self->_popover = 0;

  [(UIView *)self->_popoverContainerView removeFromSuperview];
  popoverContainerView = self->_popoverContainerView;
  self->_popoverContainerView = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardAreaHeight, 0);
  objc_storeStrong((id *)&self->_affordance, 0);
  objc_storeStrong((id *)&self->_popover, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
  objc_storeStrong((id *)&self->_popoverContainerView, 0);
}

@end