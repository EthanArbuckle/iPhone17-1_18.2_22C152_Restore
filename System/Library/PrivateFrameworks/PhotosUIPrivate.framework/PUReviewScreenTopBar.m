@interface PUReviewScreenTopBar
+ (id)supportedButtons;
- (BOOL)_isButtonAvailable:(int64_t)a3;
- (BOOL)_isButtonEnabled:(int64_t)a3;
- (CGPoint)doneButtonCenterAlignmentPoint;
- (NSSet)availableButtons;
- (NSSet)enabledButtons;
- (PUReviewScreenDoneButton)doneButton;
- (PUReviewScreenTopBar)initWithFrame:(CGRect)a3;
- (UIButton)retakeButton;
- (id)_buttonForButtonType:(int64_t)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)backgroundStyle;
- (void)_updateBackgroundColor;
- (void)_updateButtonVisibility;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAvailableButtons:(id)a3;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setDoneButtonCenterAlignmentPoint:(CGPoint)a3;
- (void)setEnabledButtons:(id)a3;
@end

@implementation PUReviewScreenTopBar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retakeButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_enabledButtons, 0);
  objc_storeStrong((id *)&self->_availableButtons, 0);
}

- (UIButton)retakeButton
{
  return self->_retakeButton;
}

- (PUReviewScreenDoneButton)doneButton
{
  return self->_doneButton;
}

- (CGPoint)doneButtonCenterAlignmentPoint
{
  double x = self->_doneButtonCenterAlignmentPoint.x;
  double y = self->_doneButtonCenterAlignmentPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (NSSet)enabledButtons
{
  return self->_enabledButtons;
}

- (NSSet)availableButtons
{
  return self->_availableButtons;
}

- (void)_updateBackgroundColor
{
  unint64_t v3 = [(PUReviewScreenTopBar *)self backgroundStyle];
  if (v3)
  {
    if (v3 != 1) {
      return;
    }
    double v4 = 0.3;
  }
  else
  {
    double v4 = 0.1;
  }
  id v5 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:v4];
  [(PUReviewScreenTopBar *)self setBackgroundColor:v5];
}

- (void)_updateButtonVisibility
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v3 = objc_msgSend((id)objc_opt_class(), "supportedButtons", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v12 + 1) + 8 * v7) integerValue];
        v9 = [(PUReviewScreenTopBar *)self _buttonForButtonType:v8];
        BOOL v10 = [(PUReviewScreenTopBar *)self _isButtonAvailable:v8];
        BOOL v11 = [(PUReviewScreenTopBar *)self _isButtonEnabled:v8];
        [v9 setHidden:!v10];
        [v9 setEnabled:v11];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (id)_buttonForButtonType:(int64_t)a3
{
  if (a3 == 1)
  {
    unint64_t v3 = [(PUReviewScreenTopBar *)self retakeButton];
  }
  else if (a3)
  {
    unint64_t v3 = 0;
  }
  else
  {
    unint64_t v3 = [(PUReviewScreenTopBar *)self doneButton];
  }
  return v3;
}

- (BOOL)_isButtonEnabled:(int64_t)a3
{
  uint64_t v4 = [(PUReviewScreenTopBar *)self enabledButtons];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (BOOL)_isButtonAvailable:(int64_t)a3
{
  uint64_t v4 = [(PUReviewScreenTopBar *)self availableButtons];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  char v6 = [v4 containsObject:v5];

  return v6;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    [(PUReviewScreenTopBar *)self _updateBackgroundColor];
  }
}

- (void)setDoneButtonCenterAlignmentPoint:(CGPoint)a3
{
  if (a3.x != self->_doneButtonCenterAlignmentPoint.x || a3.y != self->_doneButtonCenterAlignmentPoint.y)
  {
    self->_doneButtonCenterAlignmentPoint = a3;
    [(PUReviewScreenTopBar *)self setNeedsLayout];
  }
}

- (void)setEnabledButtons:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  uint64_t v5 = v4;
  if (self->_enabledButtons != v4)
  {
    v9 = v4;
    char v6 = -[NSSet isEqual:](v4, "isEqual:");
    uint64_t v5 = v9;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (NSSet *)[(NSSet *)v9 copy];
      enabledButtons = self->_enabledButtons;
      self->_enabledButtons = v7;

      [(PUReviewScreenTopBar *)self _updateButtonVisibility];
      uint64_t v5 = v9;
    }
  }
}

- (void)setAvailableButtons:(id)a3
{
  uint64_t v4 = (NSSet *)a3;
  uint64_t v5 = v4;
  if (self->_availableButtons != v4)
  {
    v9 = v4;
    char v6 = -[NSSet isEqual:](v4, "isEqual:");
    uint64_t v5 = v9;
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = (NSSet *)[(NSSet *)v9 copy];
      availableButtons = self->_availableButtons;
      self->_availableButtons = v7;

      [(PUReviewScreenTopBar *)self _updateButtonVisibility];
      uint64_t v5 = v9;
    }
  }
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PUReviewScreenTopBar;
  [(PUReviewScreenTopBar *)&v4 didMoveToWindow];
  unint64_t v3 = [(PUReviewScreenTopBar *)self window];

  if (v3) {
    [(PUReviewScreenTopBar *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v45.receiver = self;
  v45.super_class = (Class)PUReviewScreenTopBar;
  [(PUReviewScreenTopBar *)&v45 layoutSubviews];
  [(PUReviewScreenTopBar *)self bounds];
  CGFloat v43 = v4;
  CGFloat v44 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  v9 = [(PUReviewScreenTopBar *)self doneButton];
  BOOL v10 = [(PUReviewScreenTopBar *)self window];
  [v10 frame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  objc_msgSend(v9, "setPreferredStyle:", +[PUReviewScreenUtilities doneButtonStyleForReferenceBounds:](PUReviewScreenUtilities, "doneButtonStyleForReferenceBounds:", v12, v14, v16, v18));
  v19 = [(PUReviewScreenTopBar *)self retakeButton];
  [v9 intrinsicContentSize];
  double v21 = v20;
  double v23 = v22;
  [v19 intrinsicContentSize];
  double v42 = v24;
  double v26 = v25;
  objc_msgSend(v9, "setTappableEdgeInsets:", 10.0, 10.0, 10.0, 10.0);
  [(PUReviewScreenTopBar *)self doneButtonCenterAlignmentPoint];
  double v29 = v28;
  double v30 = v27;
  if (v28 == *MEMORY[0x1E4F1DAD8] && v27 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    double v35 = 15.0;
    CGFloat v37 = v43;
    CGFloat v36 = v44;
  }
  else
  {
    v32 = [(PUReviewScreenTopBar *)self window];
    -[PUReviewScreenTopBar convertPoint:fromView:](self, "convertPoint:fromView:", v32, v29, v30);
    double v34 = v33;

    v46.origin.double x = v44;
    v46.origin.double y = v6;
    v46.size.width = v43;
    v46.size.height = v8;
    double v35 = CGRectGetMaxX(v46) - (v21 * 0.5 + v34);
    CGFloat v36 = v44;
    CGFloat v37 = v43;
  }
  CGFloat v38 = v6;
  double v39 = v8;
  double v40 = v8 * 0.5;
  objc_msgSend(v9, "frameForAlignmentRect:", CGRectGetMaxX(*(CGRect *)&v36) - v21 - v35, v8 * 0.5 - v23 * 0.5, v21, v23);
  double v41 = fmax(v26, 40.0);
  objc_msgSend(v9, "setFrame:");
  objc_msgSend(v19, "setFrame:", v35, v40 - v41 * 0.5, fmax(v42, 60.0), v41);
}

- (PUReviewScreenTopBar)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)PUReviewScreenTopBar;
  double v3 = -[PUReviewScreenTopBar initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[PUReviewScreenDoneButton doneButton];
    doneButton = v3->_doneButton;
    v3->_doneButton = (PUReviewScreenDoneButton *)v4;

    [(PUReviewScreenTopBar *)v3 addSubview:v3->_doneButton];
    uint64_t v6 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    retakeButton = v3->_retakeButton;
    v3->_retakeButton = (UIButton *)v6;

    double v8 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0];
    v9 = [(UIButton *)v3->_retakeButton titleLabel];
    [v9 setFont:v8];

    BOOL v10 = v3->_retakeButton;
    double v11 = PULocalizedString(@"PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_RETAKE");
    [(UIButton *)v10 setTitle:v11 forState:0];

    double v12 = v3->_retakeButton;
    double v13 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIButton *)v12 setTitleColor:v13 forState:0];

    [(PUReviewScreenTopBar *)v3 addSubview:v3->_retakeButton];
    uint64_t v14 = [MEMORY[0x1E4F1CAD0] set];
    availableButtons = v3->_availableButtons;
    v3->_availableButtons = (NSSet *)v14;

    [(PUReviewScreenTopBar *)v3 _updateButtonVisibility];
    [(PUReviewScreenTopBar *)v3 _updateBackgroundColor];
  }
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PUReviewScreenTopBar;
  -[PUReviewScreenTopBar hitTest:withEvent:](&v7, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (PUReviewScreenTopBar *)objc_claimAutoreleasedReturnValue();
  if ([(PUReviewScreenTopBar *)self backgroundStyle] <= 1 && v5 == self)
  {

    double v5 = 0;
  }
  return v5;
}

+ (id)supportedButtons
{
  if (supportedButtons_onceToken_78345 != -1) {
    dispatch_once(&supportedButtons_onceToken_78345, &__block_literal_global_78346);
  }
  v2 = (void *)supportedButtons_supportedButtons_78347;
  return v2;
}

void __40__PUReviewScreenTopBar_supportedButtons__block_invoke()
{
  v0 = (void *)supportedButtons_supportedButtons_78347;
  supportedButtons_supportedButtons_78347 = (uint64_t)&unk_1F078B4F8;
}

@end