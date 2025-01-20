@interface UIKBInputBackdropView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)_isTransitioning;
- (BOOL)supportsLightEffects;
- (NSArray)fullWidthConstraints;
- (NSArray)splitConstraints;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)leftWidthConstraint;
- (NSLayoutConstraint)rightWidthConstraint;
- (UIKBBackdropView)inputBackdropFullView;
- (UIKBBackdropView)inputBackdropLeftView;
- (UIKBBackdropView)inputBackdropRightView;
- (UIKBInputBackdropView)initWithFrame:(CGRect)a3;
- (_UIVisualEffectBackdropView)captureView;
- (double)heightDiff;
- (double)leftWidthDiff;
- (double)rightWidthDiff;
- (double)tallHeight;
- (int)textEffectsVisibilityLevel;
- (int64_t)style;
- (void)_beginSplitTransitionIfNeeded:(double)a3 gapWidth:(double)a4;
- (void)_endSplitTransitionIfNeeded:(BOOL)a3;
- (void)_prepareWithLeftOffset:(double)a3 gapWidth:(double)a4;
- (void)_setInitialProgressWithFrame:(CGRect)a3;
- (void)_setProgress:(double)a3 withFrame:(CGRect)a4;
- (void)_setRenderConfig:(id)a3;
- (void)_updateForEmptyBackdrop:(BOOL)a3;
- (void)_updateForLeftOffset:(double)a3 rightOffset:(double)a4;
- (void)createSplitBackdropIfNeeded;
- (void)dealloc;
- (void)layoutInputBackdropToFullWithRect:(CGRect)a3;
- (void)layoutInputBackdropToSplitWithHeight:(double)a3 innerCorners:(unint64_t)a4;
- (void)layoutInputBackdropToSplitWithLeftViewRect:(CGRect)a3 andRightViewRect:(CGRect)a4 innerCorners:(unint64_t)a5;
- (void)prepareForSnapshotting;
- (void)restoreFromSnapshotting;
- (void)setCaptureView:(id)a3;
- (void)setFullWidthConstraints:(id)a3;
- (void)setGestureProgressForSplit:(double)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setHeightDiff:(double)a3;
- (void)setInputBackdropFullView:(id)a3;
- (void)setInputBackdropLeftView:(id)a3;
- (void)setInputBackdropRightView:(id)a3;
- (void)setLeftWidthConstraint:(id)a3;
- (void)setLeftWidthDiff:(double)a3;
- (void)setProgress:(double)a3 withFrame:(CGRect)a4 innerCorners:(unint64_t)a5;
- (void)setRightWidthConstraint:(id)a3;
- (void)setRightWidthDiff:(double)a3;
- (void)setSplitConstraints:(id)a3;
- (void)setTallHeight:(double)a3;
- (void)transitionToStyle:(int64_t)a3 isSplit:(BOOL)a4;
@end

@implementation UIKBInputBackdropView

- (UIKBInputBackdropView)initWithFrame:(CGRect)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)UIKBInputBackdropView;
  v3 = -[UIView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v20.receiver = v3;
    v20.super_class = (Class)UIKBInputBackdropView;
    v5 = [(UIView *)&v20 _inheritedRenderConfig];
    v4->_style = [v5 backdropStyle];

    v6 = [UIKBBackdropView alloc];
    [(UIView *)v4 bounds];
    uint64_t v7 = -[UIKBBackdropView initWithFrame:style:](v6, "initWithFrame:style:", v4->_style);
    inputBackdropFullView = v4->_inputBackdropFullView;
    v4->_inputBackdropFullView = (UIKBBackdropView *)v7;

    [(UIView *)v4->_inputBackdropFullView setTranslatesAutoresizingMaskIntoConstraints:0];
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 && UIKeyboardDeviceSupportsSplit())
    {
      v9 = [_UIVisualEffectBackdropView alloc];
      [(UIView *)v4 bounds];
      uint64_t v10 = -[_UIVisualEffectSubview initWithFrame:](v9, "initWithFrame:");
      captureView = v4->_captureView;
      v4->_captureView = (_UIVisualEffectBackdropView *)v10;

      [(UIView *)v4->_captureView setAutoresizingMask:20];
      [(UIView *)v4 insertSubview:v4->_captureView atIndex:0];
      [(UIVisualEffectView *)v4->_inputBackdropFullView _setCaptureView:v4->_captureView];
      v12 = [UIKBBackdropView alloc];
      [(UIView *)v4 bounds];
      uint64_t v13 = -[UIKBBackdropView initWithFrame:style:](v12, "initWithFrame:style:", v4->_style);
      inputBackdropLeftView = v4->_inputBackdropLeftView;
      v4->_inputBackdropLeftView = (UIKBBackdropView *)v13;

      v15 = [UIKBBackdropView alloc];
      [(UIView *)v4 bounds];
      uint64_t v16 = -[UIKBBackdropView initWithFrame:style:](v15, "initWithFrame:style:", v4->_style);
      inputBackdropRightView = v4->_inputBackdropRightView;
      v4->_inputBackdropRightView = (UIKBBackdropView *)v16;

      v22[0] = v4->_inputBackdropLeftView;
      v22[1] = v4->_inputBackdropRightView;
      v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
      [(UIVisualEffectView *)v4->_inputBackdropFullView _setCaptureDependents:v18];
    }
    [(UIView *)v4 bounds];
    [(UIKBInputBackdropView *)v4 layoutInputBackdropToFullWithRect:"layoutInputBackdropToFullWithRect:"];
    [(UIView *)v4 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)dealloc
{
  [(UIKBInputBackdropView *)self setFullWidthConstraints:0];
  [(UIKBInputBackdropView *)self setSplitConstraints:0];
  [(UIKBInputBackdropView *)self setLeftWidthConstraint:0];
  [(UIKBInputBackdropView *)self setRightWidthConstraint:0];
  [(UIKBInputBackdropView *)self setHeightConstraint:0];
  v3.receiver = self;
  v3.super_class = (Class)UIKBInputBackdropView;
  [(UIView *)&v3 dealloc];
}

- (int)textEffectsVisibilityLevel
{
  return 9;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (BOOL)supportsLightEffects
{
  return 0;
}

- (void)_updateForEmptyBackdrop:(BOOL)a3
{
  if (a3)
  {
    self->_style = 3903;
    v4 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    [v4 transitionToStyle:self->_style];

    v5 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
    [v5 setBackgroundEffects:MEMORY[0x1E4F1CBF0]];

    uint64_t v7 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    [v7 setContentEffects:v6];

    id v10 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    [v10 setBackgroundColor:0];
  }
  else
  {
    id v10 = +[UIColor systemBackgroundColor];
    v8 = [v10 colorWithAlphaComponent:0.1];
    v9 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    [v9 setBackgroundColor:v8];
  }
}

- (void)_setRenderConfig:(id)a3
{
  id v6 = a3;
  if ([v6 animatedBackground]
    && ![(UIKBInputBackdropView *)self supportsLightEffects]
    || [v6 emptyBackground])
  {
    [(UIKBInputBackdropView *)self _updateForEmptyBackdrop:1];
  }
  else
  {
    int64_t style = self->_style;
    if (style != [v6 backdropStyle] && objc_msgSend(v6, "backdropStyle") != 3904) {
      [(UIKBInputBackdropView *)self _updateForEmptyBackdrop:0];
    }
    self->_int64_t style = [v6 backdropStyle];
    v5 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    [v5 _setRenderConfig:v6];
  }
}

- (void)transitionToStyle:(int64_t)a3 isSplit:(BOOL)a4
{
  if (a3 != 3903)
  {
    if (a3 != 3904)
    {
      p_int64_t style = &self->_style;
      if (self->_style != a3) {
        -[UIKBInputBackdropView _updateForEmptyBackdrop:](self, "_updateForEmptyBackdrop:", 0, a4);
      }
      goto LABEL_10;
    }
    if ([(UIKBInputBackdropView *)self supportsLightEffects])
    {
      p_int64_t style = &self->_style;
LABEL_10:
      *p_int64_t style = a3;
      _UIKBEffectsForStyle(a3, 0);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = [(UIKBInputBackdropView *)self inputBackdropFullView];
      [v7 setBackgroundEffects:v8];

      return;
    }
  }
  [(UIKBInputBackdropView *)self _updateForEmptyBackdrop:1];
}

- (void)prepareForSnapshotting
{
  _UIKBEffectsForStyle(self->_style, 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [(UIKBInputBackdropView *)self inputBackdropFullView];
  [v3 setBackgroundEffects:v4];
}

- (void)restoreFromSnapshotting
{
  _UIKBEffectsForStyle(self->_style, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_super v3 = [(UIKBInputBackdropView *)self inputBackdropFullView];
  [v3 setBackgroundEffects:v4];
}

- (void)createSplitBackdropIfNeeded
{
  v59[5] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(UIKBInputBackdropView *)self inputBackdropFullView];
  id v4 = [v3 superview];

  if (v4)
  {
    v5 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    [v5 removeFromSuperview];
  }
  id v6 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v7 = [(UIKBInputBackdropView *)self inputBackdropRightView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  captureView = self->_captureView;
  v9 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
  id v10 = [v9 superview];

  if (!v10)
  {
    v11 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
    [(UIView *)self insertSubview:v11 atIndex:captureView != 0];
  }
  v12 = [(UIKBInputBackdropView *)self inputBackdropRightView];
  uint64_t v13 = [v12 superview];

  if (!v13)
  {
    v14 = [(UIKBInputBackdropView *)self inputBackdropRightView];
    [(UIView *)self insertSubview:v14 atIndex:captureView != 0];
  }
  [(UIKBInputBackdropView *)self transitionToStyle:self->_style isSplit:1];
  v15 = [(UIKBInputBackdropView *)self splitConstraints];

  if (!v15)
  {
    v58 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
    v57 = [v58 leftAnchor];
    v56 = [(UIView *)self leftAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v59[0] = v55;
    v53 = [(UIView *)self rightAnchor];
    v54 = [(UIKBInputBackdropView *)self inputBackdropRightView];
    v52 = [v54 rightAnchor];
    v51 = [v53 constraintEqualToAnchor:v52];
    v59[1] = v51;
    v50 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
    v49 = [v50 topAnchor];
    v48 = [(UIView *)self topAnchor];
    v47 = [v49 constraintEqualToAnchor:v48];
    v59[2] = v47;
    v46 = [(UIKBInputBackdropView *)self inputBackdropRightView];
    v45 = [v46 topAnchor];
    uint64_t v16 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
    v17 = [v16 topAnchor];
    v18 = [v45 constraintEqualToAnchor:v17];
    v59[3] = v18;
    v19 = [(UIKBInputBackdropView *)self inputBackdropRightView];
    objc_super v20 = [v19 bottomAnchor];
    objc_super v21 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
    v22 = [v21 bottomAnchor];
    v23 = [v20 constraintEqualToAnchor:v22];
    v59[4] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:5];
    [(UIKBInputBackdropView *)self setSplitConstraints:v24];
  }
  v25 = [(UIKBInputBackdropView *)self splitConstraints];
  v26 = [v25 firstObject];
  char v27 = [v26 isActive];

  if ((v27 & 1) == 0)
  {
    v28 = (void *)MEMORY[0x1E4F5B268];
    v29 = [(UIKBInputBackdropView *)self splitConstraints];
    [v28 activateConstraints:v29];
  }
  v30 = [(UIKBInputBackdropView *)self leftWidthConstraint];

  if (!v30)
  {
    v31 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
    v32 = [v31 widthAnchor];
    [(UIView *)self bounds];
    v34 = [v32 constraintEqualToConstant:v33 * 0.6];
    [(UIKBInputBackdropView *)self setLeftWidthConstraint:v34];
  }
  v35 = [(UIKBInputBackdropView *)self rightWidthConstraint];

  if (!v35)
  {
    v36 = [(UIKBInputBackdropView *)self inputBackdropRightView];
    v37 = [v36 widthAnchor];
    [(UIView *)self bounds];
    v39 = [v37 constraintEqualToConstant:v38 * 0.6];
    [(UIKBInputBackdropView *)self setRightWidthConstraint:v39];
  }
  v40 = [(UIKBInputBackdropView *)self heightConstraint];

  if (!v40)
  {
    v41 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
    v42 = [v41 heightAnchor];
    v43 = [v42 constraintEqualToConstant:self->_tallHeight];
    [(UIKBInputBackdropView *)self setHeightConstraint:v43];

    v44 = [(UIKBInputBackdropView *)self heightConstraint];
    [v44 setActive:1];
  }
}

- (void)layoutInputBackdropToSplitWithLeftViewRect:(CGRect)a3 andRightViewRect:(CGRect)a4 innerCorners:(unint64_t)a5
{
  double width = a4.size.width;
  double height = a3.size.height;
  double v8 = a3.size.width;
  [(UIKBInputBackdropView *)self createSplitBackdropIfNeeded];
  id v10 = [(UIKBInputBackdropView *)self heightConstraint];
  [v10 setConstant:height];

  [(UIKBInputBackdropView *)self _updateForLeftOffset:v8 rightOffset:width];
  v11 = [(UIKBInputBackdropView *)self leftWidthConstraint];
  char v12 = [v11 isActive];

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = [(UIKBInputBackdropView *)self leftWidthConstraint];
    [v13 setActive:1];
  }
  v14 = [(UIKBInputBackdropView *)self leftWidthConstraint];
  [v14 setConstant:v8];

  v15 = [(UIKBInputBackdropView *)self rightWidthConstraint];
  char v16 = [v15 isActive];

  if ((v16 & 1) == 0)
  {
    v17 = [(UIKBInputBackdropView *)self rightWidthConstraint];
    [v17 setActive:1];
  }
  v18 = [(UIKBInputBackdropView *)self rightWidthConstraint];
  [v18 setConstant:width];

  self->_innerCorners = a5;
  v19 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
  [v19 updateCorners:a5 & 0xA];

  id v20 = [(UIKBInputBackdropView *)self inputBackdropRightView];
  [v20 updateCorners:a5 & 5];
}

- (void)layoutInputBackdropToSplitWithHeight:(double)a3 innerCorners:(unint64_t)a4
{
  [(UIKBInputBackdropView *)self createSplitBackdropIfNeeded];
  uint64_t v7 = [(UIKBInputBackdropView *)self heightConstraint];
  [v7 setConstant:a3];

  self->_innerCorners = a4;
  double v8 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
  [v8 updateCorners:a4 & 0xA];

  id v9 = [(UIKBInputBackdropView *)self inputBackdropRightView];
  [v9 updateCorners:a4 & 5];
}

- (void)layoutInputBackdropToFullWithRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v50[4] = *MEMORY[0x1E4F143B8];
  double v8 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
  id v9 = [v8 superview];
  if (v9)
  {
  }
  else
  {
    id v10 = [(UIKBInputBackdropView *)self inputBackdropRightView];
    v11 = [v10 superview];

    if (!v11) {
      goto LABEL_5;
    }
  }
  char v12 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
  [v12 removeFromSuperview];

  uint64_t v13 = [(UIKBInputBackdropView *)self inputBackdropRightView];
  [v13 removeFromSuperview];

LABEL_5:
  v14 = [(UIKBInputBackdropView *)self inputBackdropFullView];
  [(UIView *)self insertSubview:v14 atIndex:self->_captureView != 0];

  v15 = [(UIKBInputBackdropView *)self fullWidthConstraints];

  if (!v15)
  {
    v49 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    v48 = [v49 leftAnchor];
    v47 = [(UIView *)self leftAnchor];
    v46 = [v48 constraintEqualToAnchor:v47 constant:0.0];
    v50[0] = v46;
    v45 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    v44 = [v45 topAnchor];
    v43 = [(UIView *)self topAnchor];
    v42 = [v44 constraintEqualToAnchor:v43 constant:0.0];
    v50[1] = v42;
    char v16 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    v17 = [v16 widthAnchor];
    v18 = [(UIView *)self widthAnchor];
    v19 = [v17 constraintEqualToAnchor:v18 constant:0.0];
    v50[2] = v19;
    id v20 = [(UIKBInputBackdropView *)self inputBackdropFullView];
    objc_super v21 = [v20 heightAnchor];
    v22 = [(UIView *)self heightAnchor];
    v23 = [v21 constraintEqualToAnchor:v22 constant:0.0];
    v50[3] = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
    [(UIKBInputBackdropView *)self setFullWidthConstraints:v24];
  }
  v25 = [(UIKBInputBackdropView *)self fullWidthConstraints];
  v26 = [v25 firstObject];
  char v27 = [v26 isActive];

  if ((v27 & 1) == 0)
  {
    v28 = (void *)MEMORY[0x1E4F5B268];
    v29 = [(UIKBInputBackdropView *)self fullWidthConstraints];
    [v28 activateConstraints:v29];
  }
  [(UIView *)self bounds];
  v52.origin.double x = x;
  v52.origin.double y = y;
  v52.size.double width = width;
  v52.size.double height = height;
  if (!CGRectEqualToRect(v51, v52))
  {
    [(UIView *)self bounds];
    double v31 = width - v30;
    [(UIView *)self bounds];
    double v33 = height - v32;
    v34 = [(UIKBInputBackdropView *)self fullWidthConstraints];
    v35 = [v34 objectAtIndex:0];
    [v35 setConstant:x];

    v36 = [(UIKBInputBackdropView *)self fullWidthConstraints];
    v37 = [v36 objectAtIndex:1];
    [v37 setConstant:y];

    double v38 = [(UIKBInputBackdropView *)self fullWidthConstraints];
    v39 = [v38 objectAtIndex:2];
    objc_msgSend(v39, "setConstant:", fmax(v31, 0.0));

    v40 = [(UIKBInputBackdropView *)self fullWidthConstraints];
    v41 = [v40 objectAtIndex:3];
    objc_msgSend(v41, "setConstant:", fmax(v33, 0.0));

    [(UIView *)self layoutIfNeeded];
  }
}

- (void)_setProgress:(double)a3 withFrame:(CGRect)a4
{
}

- (void)setProgress:(double)a3 withFrame:(CGRect)a4 innerCorners:(unint64_t)a5
{
  if (a3 >= 0.0)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    CGFloat y = a4.origin.y;
    CGFloat x = a4.origin.x;
    if (!CGRectIsEmpty(a4))
    {
      if (a3 == 0.0
        && (char v12 = &OBJC_IVAR___UIKBInputBackdropView__savedStartRect,
            p_hasStartRect = &self->_hasStartRect,
            !self->_hasStartRect)
        || a3 == 1.0
        && (char v12 = &OBJC_IVAR___UIKBInputBackdropView__savedEndRect,
            p_hasStartRect = &self->_hasEndRect,
            !self->_hasEndRect))
      {
        BOOL *p_hasStartRect = 1;
        v14 = (CGFloat *)((char *)self + *v12);
        CGFloat *v14 = x;
        v14[1] = y;
        v14[2] = width;
        v14[3] = height;
      }
      p_double height = &self->_savedEndRect.size.height;
      CGFloat v16 = self->_savedEndRect.size.height;
      double v17 = self->_savedStartRect.size.height;
      BOOL v18 = v16 <= v17;
      if (v16 <= v17) {
        CGFloat v16 = self->_savedStartRect.size.height;
      }
      self->_tallHeight = v16;
      if (!v18) {
        p_double height = &self->_savedStartRect.size.height;
      }
      self->_heightDiff = v16 - *p_height;
      if (a3 == 0.0)
      {
        if (!self->_isTransitioning)
        {
          double v19 = *MEMORY[0x1E4F1DAD8];
          double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
          -[UIKBInputBackdropView layoutInputBackdropToFullWithRect:](self, "layoutInputBackdropToFullWithRect:", v19, v20, width, height);
        }
      }
      else
      {
        [(UIKBInputBackdropView *)self _prepareWithLeftOffset:round(self->_transitionLeftOffset + (1.0 - a3) * (ceil(width * 0.5) - self->_transitionLeftOffset)) gapWidth:round(self->_transitionGap * a3)];
        [(UIKBInputBackdropView *)self layoutInputBackdropToSplitWithHeight:a5 innerCorners:height];
        [(UIKBInputBackdropView *)self setGestureProgressForSplit:a3];
      }
    }
  }
}

- (void)_prepareWithLeftOffset:(double)a3 gapWidth:(double)a4
{
  self->_transitionGap = a4;
  [(UIView *)self bounds];
  [(UIKBInputBackdropView *)self _updateForLeftOffset:a3 rightOffset:v7 - (a3 + a4)];
  [(UIKBInputBackdropView *)self createSplitBackdropIfNeeded];
}

- (void)_updateForLeftOffset:(double)a3 rightOffset:(double)a4
{
  self->_transitionLeftOffset = a3;
  self->_transitionRightOffset = a4;
  [(UIView *)self bounds];
  double v7 = (v6 + self->_transitionLeftOffset - self->_transitionRightOffset) * 0.5;
  self->_leftWidthDiff = v7 - a3;
  [(UIView *)self bounds];
  self->_rightWidthDiff = v8
                        - v7
                        - (self->_transitionLeftOffset
                         - self->_transitionRightOffset)
                        - self->_transitionRightOffset;
}

- (void)setGestureProgressForSplit:(double)a3
{
  if (a3 > 0.0)
  {
    v5 = [(UIKBInputBackdropView *)self inputBackdropRightView];
    uint64_t v6 = [v5 superview];
    if (v6)
    {
      double v7 = (void *)v6;
      double v8 = [(UIKBInputBackdropView *)self inputBackdropLeftView];
      id v9 = [v8 superview];

      if (v9)
      {
LABEL_10:
        v14 = [(UIKBInputBackdropView *)self leftWidthConstraint];
        char v15 = [v14 isActive];

        if ((v15 & 1) == 0)
        {
          CGFloat v16 = [(UIKBInputBackdropView *)self leftWidthConstraint];
          [v16 setActive:1];
        }
        double v17 = [(UIKBInputBackdropView *)self rightWidthConstraint];
        char v18 = [v17 isActive];

        if ((v18 & 1) == 0)
        {
          double v19 = [(UIKBInputBackdropView *)self rightWidthConstraint];
          [v19 setActive:1];
        }
        double v20 = self->_tallHeight - self->_heightDiff * a3;
        objc_super v21 = [(UIKBInputBackdropView *)self heightConstraint];
        [v21 setConstant:v20];

        if (self->_transitionGap <= 0.0)
        {
          [(UIView *)self bounds];
          double v27 = v26 * 0.6;
          v28 = [(UIKBInputBackdropView *)self leftWidthConstraint];
          [v28 setConstant:v27];

          [(UIView *)self bounds];
          double v25 = v29 * 0.6;
        }
        else
        {
          if (a3 >= 0.055) {
            double v22 = 1.0 - (a3 * 1.05820106 + -1.05820106 + 1.0);
          }
          else {
            double v22 = 1.0;
          }
          double v23 = self->_transitionLeftOffset + round(v22 * self->_leftWidthDiff);
          v24 = [(UIKBInputBackdropView *)self leftWidthConstraint];
          [v24 setConstant:v23];

          double v25 = self->_transitionRightOffset + round(v22 * self->_rightWidthDiff);
        }
        id v30 = [(UIKBInputBackdropView *)self rightWidthConstraint];
        [v30 setConstant:v25];

        return;
      }
    }
    else
    {
    }
    [(UIKBInputBackdropView *)self createSplitBackdropIfNeeded];
    goto LABEL_10;
  }
  double x = self->_savedStartRect.origin.x;
  double y = self->_savedStartRect.origin.y;
  double width = self->_savedStartRect.size.width;
  double height = self->_savedStartRect.size.height;
  -[UIKBInputBackdropView layoutInputBackdropToFullWithRect:](self, "layoutInputBackdropToFullWithRect:", x, y, width, height);
}

- (void)_setInitialProgressWithFrame:(CGRect)a3
{
  double v3 = floor(a3.size.width * 0.555);
  -[UIKBInputBackdropView layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:](self, "layoutInputBackdropToSplitWithLeftViewRect:andRightViewRect:innerCorners:", -1, 0.0, 0.0, v3, a3.size.height, a3.size.width - v3, 0.0, v3, a3.size.height);
}

- (void)_beginSplitTransitionIfNeeded:(double)a3 gapWidth:(double)a4
{
  if (!self->_isTransitioning)
  {
    [(UIKBInputBackdropView *)self _prepareWithLeftOffset:a3 gapWidth:a4];
    self->_isTransitioning = 1;
    self->_hasStartRect = 0;
    self->_hasEndRect = 0;
  }
}

- (void)_endSplitTransitionIfNeeded:(BOOL)a3
{
  if (self->_isTransitioning)
  {
    self->_isTransitioning = 0;
    if (a3)
    {
      [(UIKBInputBackdropView *)self setGestureProgressForSplit:1.0];
      if (self->_hasEndRect)
      {
        double height = self->_savedEndRect.size.height;
      }
      else
      {
        [(UIView *)self frame];
        double height = v9;
      }
      [(UIKBInputBackdropView *)self layoutInputBackdropToSplitWithHeight:[(UIView *)self _clipCornersOfView:self] innerCorners:height];
    }
    else
    {
      if (self->_hasStartRect)
      {
        double x = self->_savedStartRect.origin.x;
        double y = self->_savedStartRect.origin.y;
        double width = self->_savedStartRect.size.width;
        double v8 = self->_savedStartRect.size.height;
      }
      else
      {
        [(UIView *)self frame];
      }
      if (self->_transitionGap == 0.0) {
        double v8 = self->_savedEndRect.size.height;
      }
      -[UIKBInputBackdropView layoutInputBackdropToFullWithRect:](self, "layoutInputBackdropToFullWithRect:", x, y, width, v8);
    }
    [(UIView *)self _removeAllAnimations:1];
  }
}

- (BOOL)_isTransitioning
{
  return self->_isTransitioning;
}

- (int64_t)style
{
  return self->_style;
}

- (UIKBBackdropView)inputBackdropFullView
{
  return self->_inputBackdropFullView;
}

- (void)setInputBackdropFullView:(id)a3
{
}

- (UIKBBackdropView)inputBackdropLeftView
{
  return self->_inputBackdropLeftView;
}

- (void)setInputBackdropLeftView:(id)a3
{
}

- (UIKBBackdropView)inputBackdropRightView
{
  return self->_inputBackdropRightView;
}

- (void)setInputBackdropRightView:(id)a3
{
}

- (_UIVisualEffectBackdropView)captureView
{
  return self->_captureView;
}

- (void)setCaptureView:(id)a3
{
}

- (NSArray)splitConstraints
{
  return self->_splitConstraints;
}

- (void)setSplitConstraints:(id)a3
{
}

- (NSArray)fullWidthConstraints
{
  return self->_fullWidthConstraints;
}

- (void)setFullWidthConstraints:(id)a3
{
}

- (NSLayoutConstraint)leftWidthConstraint
{
  return self->_leftWidthConstraint;
}

- (void)setLeftWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)rightWidthConstraint
{
  return self->_rightWidthConstraint;
}

- (void)setRightWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (double)leftWidthDiff
{
  return self->_leftWidthDiff;
}

- (void)setLeftWidthDiff:(double)a3
{
  self->_leftWidthDiff = a3;
}

- (double)rightWidthDiff
{
  return self->_rightWidthDiff;
}

- (void)setRightWidthDiff:(double)a3
{
  self->_rightWidthDiff = a3;
}

- (double)tallHeight
{
  return self->_tallHeight;
}

- (void)setTallHeight:(double)a3
{
  self->_tallHeight = a3;
}

- (double)heightDiff
{
  return self->_heightDiff;
}

- (void)setHeightDiff:(double)a3
{
  self->_heightDiff = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_rightWidthConstraint, 0);
  objc_storeStrong((id *)&self->_leftWidthConstraint, 0);
  objc_storeStrong((id *)&self->_fullWidthConstraints, 0);
  objc_storeStrong((id *)&self->_splitConstraints, 0);
  objc_storeStrong((id *)&self->_captureView, 0);
  objc_storeStrong((id *)&self->_inputBackdropRightView, 0);
  objc_storeStrong((id *)&self->_inputBackdropLeftView, 0);
  objc_storeStrong((id *)&self->_inputBackdropFullView, 0);
}

@end