@interface _UIActionSlider
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAnimating;
- (BOOL)isShowingTrackLabel;
- (BOOL)shouldHideTrackLabelForXPoint:(double)a3;
- (BOOL)xPointIsWithinTrack:(double)a3;
- (CGRect)_trackFrame;
- (CGRect)knobRect;
- (CGRect)trackTextRect;
- (CGSize)knobImageOffset;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)trackSize;
- (NSString)trackText;
- (UIBezierPath)knobMaskPath;
- (UIColor)knobColor;
- (UIEdgeInsets)knobInsets;
- (UIFont)trackFont;
- (UIImage)knobImage;
- (UILabel)trackLabel;
- (UIPanGestureRecognizer)slideGestureRecognizer;
- (UIView)_knobView;
- (_UIActionSlider)initWithCoder:(id)a3;
- (_UIActionSlider)initWithFrame:(CGRect)a3;
- (_UIActionSlider)initWithFrame:(CGRect)a3 vibrantSettings:(id)a4;
- (_UIActionSliderDelegate)delegate;
- (_UIVibrantSettings)vibrantSettings;
- (double)_knobAvailableX;
- (double)_knobHorizontalPosition;
- (double)_knobLeftMostX;
- (double)_knobMaxX;
- (double)_knobMaxXInset;
- (double)_knobMinX;
- (double)_knobMinXInset;
- (double)_knobRightMostX;
- (double)_knobVerticalInset;
- (double)cachedTrackMaskWidth;
- (double)knobPosition;
- (double)knobWidth;
- (double)trackTextBaselineFromBottom;
- (double)trackWidthProportion;
- (id)backgroundColor;
- (id)trackMaskImage;
- (id)trackMaskPath;
- (int64_t)style;
- (int64_t)textStyle;
- (void)_hideTrackLabel:(BOOL)a3;
- (void)_knobPanGesture:(id)a3;
- (void)_makeTrackLabel;
- (void)_showTrackLabel;
- (void)_slideCompleted:(BOOL)a3;
- (void)closeTrackAnimated:(BOOL)a3;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)openTrackAnimated:(BOOL)a3;
- (void)setAnimating:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCachedTrackMaskWidth:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setKnobColor:(id)a3;
- (void)setKnobImage:(id)a3;
- (void)setKnobImageOffset:(CGSize)a3;
- (void)setKnobInsets:(UIEdgeInsets)a3;
- (void)setKnobPosition:(double)a3;
- (void)setKnobWidth:(double)a3;
- (void)setMaskFromImage:(id)a3 onView:(id)a4;
- (void)setMaskPath:(CGPath *)a3 onView:(id)a4;
- (void)setShowingTrackLabel:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTextStyle:(int64_t)a3;
- (void)setTrackFont:(id)a3;
- (void)setTrackSize:(CGSize)a3;
- (void)setTrackText:(id)a3;
- (void)setTrackTextBaselineFromBottom:(double)a3;
- (void)setTrackWidthProportion:(double)a3;
- (void)setVibrantSettings:(id)a3;
- (void)updateAllTrackMasks;
@end

@implementation _UIActionSlider

- (_UIActionSlider)initWithFrame:(CGRect)a3 vibrantSettings:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v52.receiver = self;
  v52.super_class = (Class)_UIActionSlider;
  v11 = -[UIControl initWithFrame:](&v52, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    [(UIView *)v11 setOpaque:0];
    v13 = +[UIColor clearColor];
    [(_UIActionSlider *)v12 setBackgroundColor:v13];

    v12->_trackWidthProportion = 1.0;
    v12->_trackSize.double width = 266.0;
    v12->_knobInsets.left = 3.5;
    v12->_knobInsets.right = 3.5;
    v14 = +[UIDevice currentDevice];
    uint64_t v15 = [v14 userInterfaceIdiom];

    if (v15
      || (+[UIScreen mainScreen],
          v16 = objc_claimAutoreleasedReturnValue(),
          [v16 _referenceBounds],
          double v17 = CGRectGetHeight(v53),
          v16,
          v17 > 480.0))
    {
      double v18 = 5.0;
      uint64_t v19 = 0x403F800000000000;
      uint64_t v20 = 0x4052C00000000000;
      uint64_t v21 = 0x4050400000000000;
    }
    else
    {
      double v18 = 3.5;
      uint64_t v19 = 0x403A800000000000;
      uint64_t v20 = 0x4050400000000000;
      uint64_t v21 = 0x404D000000000000;
    }
    *(void *)&v12->_knobWidth = v21;
    v12->_knobInsets.top = v18;
    v12->_knobInsets.bottom = v18;
    *(void *)&v12->_trackSize.double height = v20;
    *(void *)&v12->_trackTextBaselineFromBottom = v19;
    objc_storeStrong((id *)&v12->_vibrantSettings, a4);
    [(UIView *)v12 bounds];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    v30 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v22, v24, v26, v28);
    contentView = v12->_contentView;
    v12->_contentView = v30;

    [(UIView *)v12 addSubview:v12->_contentView];
    v32 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v23, v25, v27, v29);
    trackBackgroundView = v12->_trackBackgroundView;
    v12->_trackBackgroundView = v32;

    v34 = [(UIView *)v12->_trackBackgroundView layer];
    [v34 setAllowsGroupBlending:0];

    [(UIView *)v12->_contentView addSubview:v12->_trackBackgroundView];
    v35 = objc_alloc_init(_UIActionSliderTrackComponentView);
    trackDodgeView = v12->_trackDodgeView;
    v12->_trackDodgeView = &v35->super;

    v37 = v12->_trackDodgeView;
    v38 = +[UIColor colorWithWhite:0.65 alpha:1.0];
    [(UIView *)v37 setBackgroundColor:v38];

    v39 = [(UIView *)v12->_trackDodgeView layer];
    [v39 setCompositingFilter:*MEMORY[0x1E4F3A018]];

    [(UIView *)v12->_trackBackgroundView addSubview:v12->_trackDodgeView];
    uint64_t v40 = [&stru_1ED0E84C0 copy];
    trackText = v12->_trackText;
    v12->_trackText = (NSString *)v40;

    uint64_t v42 = [off_1E52D39B8 systemFontOfSize:20.0];
    trackFont = v12->_trackFont;
    v12->_trackFont = (UIFont *)v42;

    v12->_showingTrackLabel = 1;
    v44 = objc_alloc_init(_UIActionSliderKnob);
    knobView = v12->_knobView;
    v12->_knobView = v44;

    [(UIView *)v12->_contentView addSubview:v12->_knobView];
    v46 = objc_alloc_init(UIImageView);
    knobImageView = v12->_knobImageView;
    v12->_knobImageView = v46;

    [(UIView *)v12->_knobView addSubview:v12->_knobImageView];
    v48 = [[UIPanGestureRecognizer alloc] initWithTarget:v12 action:sel__knobPanGesture_];
    slideGestureRecognizer = v12->_slideGestureRecognizer;
    v12->_slideGestureRecognizer = v48;

    [(UIPanGestureRecognizer *)v12->_slideGestureRecognizer setMaximumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)v12->_slideGestureRecognizer setMinimumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)v12->_slideGestureRecognizer _setCanPanHorizontally:1];
    [(UIPanGestureRecognizer *)v12->_slideGestureRecognizer _setCanPanVertically:0];
    [(UIPanGestureRecognizer *)v12->_slideGestureRecognizer _setHysteresis:2.0];
    [(UIPanGestureRecognizer *)v12->_slideGestureRecognizer setDelegate:v12];
    [(UIView *)v12 addGestureRecognizer:v12->_slideGestureRecognizer];
    v50 = [(UIView *)v12 layer];
    [v50 setHitTestsAsOpaque:1];
  }
  return v12;
}

- (_UIActionSlider)initWithFrame:(CGRect)a3
{
  return -[_UIActionSlider initWithFrame:vibrantSettings:](self, "initWithFrame:vibrantSettings:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIActionSlider)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIActionSlider;
  return [(UIControl *)&v4 initWithCoder:a3];
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style == a3) {
    return;
  }
  self->_style = a3;
  switch(a3)
  {
    case 2:
      [(UIView *)self->_trackDodgeView removeFromSuperview];
      [(UIView *)self->_trackBlurView removeFromSuperview];
      trackSolidView = (_UIBackdropView *)self->_trackSolidView;
      if (!trackSolidView)
      {
        v6 = objc_alloc_init(_UIActionSliderTrackComponentView);
        v7 = self->_trackSolidView;
        self->_trackSolidView = &v6->super;

        [(_UIActionSlider *)self setCachedTrackMaskWidth:0.0];
        trackSolidView = (_UIBackdropView *)self->_trackSolidView;
      }
      p_trackBackgroundView = &self->_trackBackgroundView;
      goto LABEL_12;
    case 1:
      if (!self->_trackBlurView)
      {
        v8 = [[_UIBackdropView alloc] initWithPrivateStyle:2020];
        trackBlurView = self->_trackBlurView;
        self->_trackBlurView = v8;

        [(_UIActionSlider *)self setCachedTrackMaskWidth:0.0];
      }
      [(UIView *)self->_trackDodgeView removeFromSuperview];
      [(UIView *)self->_trackSolidView removeFromSuperview];
      p_trackBackgroundView = &self->_trackBackgroundView;
      trackSolidView = self->_trackBlurView;
      goto LABEL_12;
    case 0:
      [(UIView *)self->_trackBlurView removeFromSuperview];
      [(UIView *)self->_trackSolidView removeFromSuperview];
      p_trackBackgroundView = &self->_trackBackgroundView;
      trackSolidView = (_UIBackdropView *)self->_trackDodgeView;
LABEL_12:
      [(UIView *)*p_trackBackgroundView insertSubview:trackSolidView atIndex:0];
      break;
  }
  [(UIView *)self setNeedsLayout];
}

- (UIBezierPath)knobMaskPath
{
  [(_UIActionSlider *)self knobRect];
  return +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:");
}

- (UIImage)knobImage
{
  return [(UIImageView *)self->_knobImageView image];
}

- (void)setKnobImage:(id)a3
{
  [(UIImageView *)self->_knobImageView setImage:a3];
  [(UIView *)self setNeedsLayout];
}

- (void)setKnobImageOffset:(CGSize)a3
{
  if (self->_knobImageOffset.width != a3.width || self->_knobImageOffset.height != a3.height)
  {
    self->_knobImageOffset = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (UIColor)knobColor
{
  return [(_UIActionSliderKnob *)self->_knobView knobColor];
}

- (void)setKnobColor:(id)a3
{
}

- (void)setTrackText:(id)a3
{
  if (self->_trackText != a3)
  {
    objc_super v4 = (NSString *)[a3 copy];
    trackText = self->_trackText;
    self->_trackText = v4;

    [(_UIActionSliderLabel *)self->_trackLabel setText:self->_trackText];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setTrackFont:(id)a3
{
  v5 = (UIFont *)a3;
  if (self->_trackFont != v5)
  {
    objc_storeStrong((id *)&self->_trackFont, a3);
    [(_UIActionSliderLabel *)self->_trackLabel setFont:v5];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setTrackSize:(CGSize)a3
{
  if (a3.width != self->_trackSize.width || a3.height != self->_trackSize.height)
  {
    self->_trackSize = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (UILabel)trackLabel
{
  if ([(_UIActionSlider *)self textStyle] != 1)
  {
    id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Can't call -trackLabel when -textStyle is not _UIActionSliderTextStyleSolid" userInfo:0];
    objc_exception_throw(v5);
  }
  trackLabel = self->_trackLabel;
  if (!trackLabel)
  {
    [(_UIActionSlider *)self _makeTrackLabel];
    trackLabel = self->_trackLabel;
  }
  return (UILabel *)trackLabel;
}

- (void)setKnobPosition:(double)a3
{
  if (self->_knobPosition != a3)
  {
    self->_knobPosition = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setKnobWidth:(double)a3
{
  if (self->_knobWidth != a3)
  {
    self->_knobWidth = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setKnobInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_knobInsets.left
    || a3.top != self->_knobInsets.top
    || a3.right != self->_knobInsets.right
    || a3.bottom != self->_knobInsets.bottom)
  {
    self->_knobInsets = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (CGRect)knobRect
{
  [(_UIActionSlider *)self _knobWidth];
  double v4 = v3;
  [(_UIActionSlider *)self _knobHorizontalPosition];
  double v6 = v5;
  [(_UIActionSlider *)self _knobVerticalInset];
  double v8 = v7;
  double v9 = v6;
  double v10 = v4;
  double v11 = v4;
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v8;
  result.origin.double x = v9;
  return result;
}

- (CGRect)trackTextRect
{
  int v3 = *((_DWORD *)&self->super.super._viewFlags + 4);
  [(_UIActionSlider *)self _trackFrame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(_UIActionSlider *)self _knobWidth];
  double v13 = v12;
  [(_UIActionSlider *)self _knobMinXInset];
  memset(&remainder, 0, sizeof(remainder));
  memset(&slice, 0, sizeof(slice));
  unint64_t v14 = (*(void *)&v3 & 0x80000uLL) >> 18;
  CGRectEdge v15 = v14 ^ 2;
  CGFloat v17 = v13 + v16;
  v85.origin.double x = v5;
  v85.origin.double y = v7;
  v85.size.double width = v9;
  v85.size.double height = v11;
  CGFloat rect = v11;
  CGRectDivide(v85, &slice, &remainder, v17, (CGRectEdge)v14);
  CGRectDivide(remainder, &slice, &remainder, 13.0, v15);
  -[_UIActionSliderLabel sizeThatFits:](self->_trackLabel, "sizeThatFits:", remainder.size.width, remainder.size.height);
  double v19 = v18;
  double v21 = v20;
  [(UIView *)self _currentScreenScale];
  UIRectCenteredXInRectScale(0.0, 0.0, v19, v21, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height, v22);
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat v28 = v27;
  CGFloat v30 = v29;
  v86.origin.double x = v5;
  v86.origin.double y = v7;
  v86.size.double width = v9;
  v86.size.double height = v11;
  double v31 = CGRectGetWidth(v86) + -252.0;
  double v75 = v31;
  if ((*(void *)&v3 & 0x80000) != 0) {
    double v32 = v31;
  }
  else {
    double v32 = 86.0;
  }
  CGFloat v77 = v24;
  CGFloat v79 = v26;
  v87.origin.double x = v24;
  v87.origin.double y = v26;
  CGFloat v76 = v28;
  v87.size.double width = v28;
  double v81 = v30;
  v87.size.double height = v30;
  CGFloat v33 = v9;
  double MinX = CGRectGetMinX(v87);
  v88.origin.double x = v5;
  CGFloat v82 = v7;
  v88.origin.double y = v7;
  v88.size.double width = v9;
  v88.size.double height = rect;
  if (MinX - CGRectGetMinX(v88) >= v32)
  {
    double v35 = v77;
  }
  else
  {
    v89.origin.double x = v5;
    v89.origin.double y = v7;
    v89.size.double width = v9;
    v89.size.double height = rect;
    double v35 = v32 + CGRectGetMinX(v89);
  }
  CGFloat v36 = rect;
  if ((v3 & 0x80000) != 0) {
    double v37 = 86.0;
  }
  else {
    double v37 = v75;
  }
  CGFloat v38 = v5;
  CGFloat v39 = v82;
  CGFloat v40 = v33;
  double MaxX = CGRectGetMaxX(*(CGRect *)(&v36 - 3));
  v90.origin.double x = v35;
  v90.origin.double y = v26;
  double v42 = v76;
  v90.size.double width = v76;
  v90.size.double height = v30;
  if (MaxX - CGRectGetMaxX(v90) < v37)
  {
    v91.origin.double x = v5;
    v91.origin.double y = v82;
    v91.size.double width = v33;
    v91.size.double height = rect;
    CGFloat v43 = CGRectGetMaxX(v91) - v37;
    v92.origin.double x = v35;
    v92.origin.double y = v79;
    v92.size.double width = v76;
    v92.size.double height = v30;
    double v35 = v43 - CGRectGetWidth(v92);
    double v42 = v76;
  }
  v93.origin.double x = v35;
  v93.origin.double y = v79;
  v93.size.double width = v42;
  v93.size.double height = v30;
  double v44 = CGRectGetMinX(v93);
  v94.origin.double x = v5;
  v94.origin.double y = v82;
  v94.size.double width = v33;
  v94.size.double height = rect;
  double v45 = v35;
  if (v44 - CGRectGetMinX(v94) < v32)
  {
    CGFloat v46 = v42;
    v95.origin.double x = v5;
    v95.origin.double y = v82;
    v95.size.double width = v33;
    v95.size.double height = rect;
    CGFloat v47 = CGRectGetMaxX(v95) - (v37 + -4.0);
    v96.origin.double x = v35;
    v96.origin.double y = v79;
    v96.size.double width = v46;
    v96.size.double height = v81;
    double v45 = v47 - CGRectGetWidth(v96);
    double v42 = v46;
  }
  v48 = [(_UIActionSlider *)self trackText];
  int64_t v49 = [(_UIActionSlider *)self textStyle];
  [(UIView *)self->_trackBackgroundView bounds];
  CGFloat v51 = v50;
  CGFloat v53 = v52;
  CGFloat v55 = v54;
  CGFloat v57 = v56;
  if (v49 == 1
    && ([(_UIActionSliderLabel *)self->_trackLabel numberOfLines] > 1
     || ![(_UIActionSliderLabel *)self->_trackLabel numberOfLines])
    && [v48 containsString:@"\n"])
  {
    v97.origin.double x = v51;
    v97.origin.double y = v53;
    v97.size.double width = v55;
    v97.size.double height = v57;
    double Height = CGRectGetHeight(v97);
    v98.origin.double x = v45;
    v98.origin.double y = v79;
    v98.size.double width = v42;
    CGFloat v59 = v81;
    v98.size.double height = v81;
    double v60 = (Height - CGRectGetHeight(v98)) * 0.5;
  }
  else
  {
    CGFloat v78 = v45;
    char v61 = objc_opt_respondsToSelector();
    trackLabel = self->_trackLabel;
    CGFloat v63 = v51;
    if (v61)
    {
      CGFloat v59 = v81;
      -[_UIActionSliderLabel baselineOffsetFromBottomWithSize:](trackLabel, "baselineOffsetFromBottomWithSize:", v42, v81);
      double v65 = v64;
    }
    else
    {
      [(_UIActionSliderLabel *)trackLabel _baselineOffsetFromBottom];
      double v65 = v66;
      CGFloat v59 = v81;
    }
    [(_UIActionSlider *)self trackTextBaselineFromBottom];
    double v68 = v67;
    v99.origin.double x = v63;
    v99.origin.double y = v53;
    v99.size.double width = v55;
    v99.size.double height = v57;
    double v69 = CGRectGetHeight(v99);
    double v45 = v78;
    v100.origin.double y = v79;
    v100.origin.double x = v78;
    v100.size.double width = v42;
    v100.size.double height = v59;
    double v60 = v69 - (CGRectGetHeight(v100) - v65) - v68;
  }
  double v70 = v60 + 0.0;

  double v71 = v45;
  double v72 = v70;
  double v73 = v42;
  double v74 = v59;
  result.size.double height = v74;
  result.size.double width = v73;
  result.origin.double y = v72;
  result.origin.double x = v71;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  CGFloat v5 = [(UIView *)self superview];
  double v6 = v5;
  if (v5)
  {
    [v5 bounds];
    double v7 = CGRectGetWidth(v15);
  }
  else
  {
    double v8 = +[UIScreen mainScreen];
    [v8 bounds];
    double v7 = CGRectGetWidth(v16);
  }
  if (width >= v7 || width <= 0.0) {
    double width = v7;
  }
  [(_UIActionSlider *)self trackSize];
  double v11 = v10 + 0.0;

  double v12 = width;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (void)openTrackAnimated:(BOOL)a3
{
  if (a3)
  {
    [(_UIActionSlider *)self _hideTrackLabel:1];
    [(_UIActionSlider *)self setAnimating:1];
    double v4 = [(UIView *)self->_trackBackgroundView layer];
    [v4 removeAllAnimations];

    CGFloat v5 = [(UIView *)self->_trackDodgeView layer];
    [v5 removeAllAnimations];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37___UIActionSlider_openTrackAnimated___block_invoke;
    v10[3] = &unk_1E52D9CD0;
    v10[4] = self;
    v10[5] = 0x3FD3333333333333;
    +[UIView performWithoutAnimation:v10];
    v8[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37___UIActionSlider_openTrackAnimated___block_invoke_2;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __37___UIActionSlider_openTrackAnimated___block_invoke_3;
    v8[3] = &unk_1E52DC3A0;
    +[UIView _animateUsingDefaultDampedSpringWithDelay:0 initialSpringVelocity:v9 options:v8 animations:0.05 completion:0.0];
    dispatch_time_t v6 = dispatch_time(0, 150000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37___UIActionSlider_openTrackAnimated___block_invoke_4;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_after(v6, MEMORY[0x1E4F14428], block);
  }
  else
  {
    [(_UIActionSlider *)self setTrackWidthProportion:1.0];
    [(_UIActionSlider *)self _showTrackLabel];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)closeTrackAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  -[_UIActionSlider _hideTrackLabel:](self, "_hideTrackLabel:");
  if (v3)
  {
    CGFloat v5 = [(UIView *)self->_trackBackgroundView layer];
    [v5 removeAllAnimations];

    dispatch_time_t v6 = [(UIView *)self->_trackDodgeView layer];
    [v6 removeAllAnimations];

    [(_UIActionSlider *)self setAnimating:1];
    [(_UIActionSlider *)self updateAllTrackMasks];
    v7[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38___UIActionSlider_closeTrackAnimated___block_invoke;
    v8[3] = &unk_1E52D9F70;
    v8[4] = self;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __38___UIActionSlider_closeTrackAnimated___block_invoke_2;
    v7[3] = &unk_1E52DC3A0;
    +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v8 completion:v7];
  }
  else
  {
    [(_UIActionSlider *)self setTrackWidthProportion:0.0];
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setBackgroundColor:(id)a3
{
}

- (id)backgroundColor
{
  return [(UIView *)self->_trackSolidView backgroundColor];
}

- (CGRect)_trackFrame
{
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(_UIActionSlider *)self trackSize];
  double v12 = v11;
  v17.origin.double x = v4;
  v17.origin.double y = v6;
  v17.size.double width = v8;
  v17.size.double height = v10;
  if (CGRectGetWidth(v17) > v12)
  {
    v18.origin.double x = v4;
    v18.origin.double y = v6;
    v18.size.double width = v8;
    v18.size.double height = v10;
    double v4 = v4 + (CGRectGetWidth(v18) - v12) * 0.5;
    CGFloat v8 = v12;
  }
  double v13 = v6 + 0.0;
  double v14 = v4;
  double v15 = v8;
  double v16 = v10;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v13;
  result.origin.double x = v14;
  return result;
}

- (double)_knobMinXInset
{
  [(_UIActionSlider *)self knobInsets];
  return v2;
}

- (double)_knobMaxXInset
{
  [(_UIActionSlider *)self knobInsets];
  return v2;
}

- (double)_knobVerticalInset
{
  [(_UIActionSlider *)self knobInsets];
  return v2 + 0.0;
}

- (double)_knobHorizontalPosition
{
  [(_UIActionSlider *)self _knobAvailableX];
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0) {
    double v4 = -(v3 * self->_knobPosition);
  }
  else {
    double v4 = v3 * self->_knobPosition;
  }
  [(_UIActionSlider *)self _knobMinX];
  return v5 + v4;
}

- (double)_knobMinX
{
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0) {
    [(_UIActionSlider *)self _knobRightMostX];
  }
  else {
    [(_UIActionSlider *)self _knobLeftMostX];
  }
  return result;
}

- (double)_knobMaxX
{
  if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0) {
    [(_UIActionSlider *)self _knobLeftMostX];
  }
  else {
    [(_UIActionSlider *)self _knobRightMostX];
  }
  return result;
}

- (double)_knobLeftMostX
{
  [(_UIActionSlider *)self _trackFrame];
  double MinX = CGRectGetMinX(v6);
  [(_UIActionSlider *)self _knobMinXInset];
  return MinX + v4;
}

- (double)_knobRightMostX
{
  [(_UIActionSlider *)self _trackFrame];
  double MaxX = CGRectGetMaxX(v8);
  [(_UIActionSlider *)self _knobMaxXInset];
  double v5 = MaxX - v4;
  [(_UIActionSlider *)self _knobWidth];
  return v5 - v6;
}

- (double)_knobAvailableX
{
  [(_UIActionSlider *)self _knobMaxX];
  double v4 = v3;
  [(_UIActionSlider *)self _knobMinX];
  return vabdd_f64(v4, v5);
}

- (BOOL)xPointIsWithinTrack:(double)a3
{
  int v4 = *((_DWORD *)&self->super.super._viewFlags + 4);
  [(_UIActionSlider *)self _knobMinX];
  if ((*(void *)&v4 & 0x80000) != 0) {
    return v5 >= a3;
  }
  else {
    return v5 <= a3;
  }
}

- (BOOL)shouldHideTrackLabelForXPoint:(double)a3
{
  int v4 = *((_DWORD *)&self->super.super._viewFlags + 4);
  [(_UIActionSlider *)self _knobMinX];
  if ((*(void *)&v4 & 0x80000) != 0) {
    return v5 > a3;
  }
  else {
    return v5 < a3;
  }
}

- (void)didMoveToSuperview
{
  v5.receiver = self;
  v5.super_class = (Class)_UIActionSlider;
  [(UIView *)&v5 didMoveToSuperview];
  if (![(_UIActionSlider *)self textStyle])
  {
    [(_UIActionSlider *)self trackWidthProportion];
    if (v3 >= 1.0)
    {
      trackLabel = self->_trackLabel;
      if (!trackLabel)
      {
        [(_UIActionSlider *)self _makeTrackLabel];
        trackLabel = self->_trackLabel;
      }
      [(_UIActionSliderLabel *)trackLabel startAnimating];
    }
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)_UIActionSlider;
  [(UIView *)&v3 didMoveToWindow];
  [(_UIActionSlider *)self setCachedTrackMaskWidth:0.0];
  [(UIView *)self setNeedsLayout];
}

- (void)_makeTrackLabel
{
  id v11 = [(_UIActionSlider *)self trackText];
  objc_super v3 = [(_UIActionSlider *)self trackFont];
  int64_t v4 = [(_UIActionSlider *)self textStyle];
  if (v4 == 1)
  {
    double v6 = objc_alloc_init(UILabel);
    CGRect v8 = +[UIColor colorWithWhite:1.0 alpha:0.9];
    [(UILabel *)v6 setTextColor:v8];

    [(UILabel *)v6 setText:v11];
    [(UILabel *)v6 setFont:v3];
  }
  else if (v4)
  {
    double v6 = 0;
  }
  else
  {
    objc_super v5 = [(_UIActionSlider *)self vibrantSettings];
    double v6 = [[_UIGlintyStringView alloc] initWithText:v11 andFont:v3];
    [(UILabel *)v6 setAllowsLuminanceAdjustments:0];
    [(UILabel *)v6 setUsesBackgroundDimming:1];
    [(UILabel *)v6 setVibrantSettings:v5];
    double v7 = [v5 legibilitySettings];
    [(UILabel *)v6 setLegibilitySettings:v7];

    [(UILabel *)v6 setChevronStyle:0];
    [(UILabel *)v6 setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v6 updateText];
  }
  [(_UIActionSliderLabel *)self->_trackLabel removeFromSuperview];
  trackLabel = self->_trackLabel;
  self->_trackLabel = (_UIActionSliderLabel *)v6;
  CGFloat v10 = v6;

  [(UIView *)self addSubview:v10];
}

- (void)layoutSubviews
{
  v66.receiver = self;
  v66.super_class = (Class)_UIActionSlider;
  [(UIView *)&v66 layoutSubviews];
  [(UIView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(UIView *)self _currentScreenScale];
  double v12 = v11;
  if (v11 <= 0.0)
  {
    double v13 = +[UIScreen mainScreen];
    [v13 scale];
    double v12 = v14;

    if (v12 <= 0.0) {
      double v12 = 1.0;
    }
  }
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10);
  [(_UIActionSlider *)self _knobWidth];
  UIRoundToViewScale(self);
  double v16 = v15;
  [(_UIActionSlider *)self _knobMinXInset];
  UIRoundToViewScale(self);
  double v18 = v17;
  [(_UIActionSlider *)self _knobMaxXInset];
  UIRoundToViewScale(self);
  double v20 = v19;
  [(_UIActionSlider *)self _trackFrame];
  double v25 = v21;
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  if (self->_trackWidthProportion >= 1.0)
  {
    if (self->_knobPosition > 0.0)
    {
      [(_UIActionSlider *)self _knobAvailableX];
      double v32 = v31 * self->_knobPosition;
      v68.origin.double x = v25;
      v68.origin.double y = v26;
      v68.size.double width = v27;
      v68.size.double height = v28;
      CGFloat v33 = CGRectGetWidth(v68) - v32;
      v69.origin.double x = v25;
      v69.origin.double y = v26;
      v69.size.double width = v27;
      v69.size.double height = v28;
      double v34 = CGRectGetHeight(v69) - v33;
      double v35 = v34 * 0.5;
      double v28 = v28 - fmax(v34, 0.0);
      BOOL v36 = v34 <= 0.0;
      double v37 = -0.0;
      if (v36) {
        double v35 = -0.0;
      }
      double v26 = v26 + v35;
      if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) == 0) {
        double v37 = v32;
      }
      double v25 = v25 + v37;
      double v27 = v27 - v32;
    }
  }
  else
  {
    double v29 = v16 + v18 + v20;
    double v30 = v21;
    if ((*((_DWORD *)&self->super.super._viewFlags + 4) & 0x80000) != 0) {
      double v30 = (CGRectGetMaxX(*(CGRect *)&v21) - v29) * (1.0 - self->_trackWidthProportion);
    }
    v67.origin.double x = v25;
    v67.origin.double y = v26;
    v67.size.double width = v27;
    v67.size.double height = v28;
    double v27 = v29 + (CGRectGetWidth(v67) - v29) * self->_trackWidthProportion;
    double v25 = v30;
  }
  -[UIView setFrame:](self->_trackBackgroundView, "setFrame:", v25, v26, v27, v28);
  [(UIView *)self->_trackBackgroundView bounds];
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  -[UIView setFrame:](self->_trackDodgeView, "setFrame:");
  -[UIView setFrame:](self->_trackBlurView, "setFrame:", v39, v41, v43, v45);
  -[UIView setFrame:](self->_trackSolidView, "setFrame:", v39, v41, v43, v45);
  [(_UIActionSlider *)self cachedTrackMaskWidth];
  double v47 = v46;
  v70.origin.double x = v39;
  v70.origin.double y = v41;
  v70.size.double width = v43;
  v70.size.double height = v45;
  if (v47 != CGRectGetWidth(v70))
  {
    v71.origin.double x = v39;
    v71.origin.double y = v41;
    v71.size.double width = v43;
    v71.size.double height = v45;
    if (CGRectGetWidth(v71) > 0.0) {
      [(_UIActionSlider *)self updateAllTrackMasks];
    }
  }
  [(_UIActionSlider *)self knobRect];
  double v52 = UIRectIntegralWithScale(v48, v49, v50, v51, v12);
  double v54 = v53;
  double v56 = v55;
  [(UIView *)self->_knobView setFrame:v52];
  knobImageView = self->_knobImageView;
  if (knobImageView)
  {
    -[UIImageView sizeThatFits:](knobImageView, "sizeThatFits:", v54, v56);
    double v60 = UIRectCenteredIntegralRectScale(0.0, 0.0, v58, v59, 0.0, 0.0, v54, v56, v12);
    -[UIImageView setFrame:](self->_knobImageView, "setFrame:", floor(v12 * (v60 + self->_knobImageOffset.width)) / v12, floor(v12 * (v61 + self->_knobImageOffset.height)) / v12);
  }
  if (self->_trackLabel || ([(_UIActionSlider *)self _makeTrackLabel], self->_trackLabel))
  {
    [(_UIActionSlider *)self trackTextRect];
    [(_UIActionSliderLabel *)self->_trackLabel setFrame:UIRectIntegralWithScale(v62, v63, v64, v65, v12)];
  }
}

- (id)trackMaskImage
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  double v3 = [(UIView *)self _screen];
  [(UIView *)self->_trackBackgroundView bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v3 scale];
  double v13 = v12;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v26.origin.double x = v5;
  v26.origin.double y = v7;
  v26.size.double width = v9;
  v26.size.double height = v11;
  size_t v15 = vcvtpd_u64_f64(v13 * CGRectGetWidth(v26));
  v27.origin.double x = v5;
  v27.origin.double y = v7;
  v27.size.double width = v9;
  v27.size.double height = v11;
  CGFloat Height = CGRectGetHeight(v27);
  double v17 = CGBitmapContextCreate(0, v15, vcvtpd_u64_f64(v13 * Height), 8uLL, 4 * v15, DeviceRGB, 2u);
  CGContextScaleCTM(v17, v13, v13);
  v28.origin.double x = 0.0;
  v28.origin.double y = 0.0;
  v28.size.double width = v9;
  v28.size.double height = v11;
  CGContextClearRect(v17, v28);
  v23[0] = xmmword_186B94C20;
  v23[1] = unk_186B94C30;
  double v18 = CGColorCreate(DeviceRGB, (const CGFloat *)v23);
  CGContextSetFillColorWithColor(v17, v18);
  CGColorRelease(v18);
  _UIActionSliderTrackMaskPath(v5, v7, v9, v11);
  id v19 = objc_claimAutoreleasedReturnValue();
  CGContextAddPath(v17, (CGPathRef)[v19 CGPath]);
  CGContextFillPath(v17);
  Image = CGBitmapContextCreateImage(v17);
  CGContextRelease(v17);
  CGColorSpaceRelease(DeviceRGB);
  double v21 = +[UIImage imageWithCGImage:Image scale:0 orientation:v13];
  CGImageRelease(Image);

  return v21;
}

- (id)trackMaskPath
{
  [(UIView *)self->_trackBackgroundView bounds];
  return _UIActionSliderTrackMaskPath(v2, v3, v4, v5);
}

- (void)updateAllTrackMasks
{
  if ([(_UIActionSlider *)self isAnimating])
  {
    id v3 = [(_UIActionSlider *)self trackMaskPath];
    MutableCopdouble y = CGPathCreateMutableCopy((CGPathRef)[v3 CGPath]);
    [(_UIActionSlider *)self setMaskPath:MutableCopy onView:self->_trackDodgeView];
    if (self->_trackSolidView) {
      -[_UIActionSlider setMaskPath:onView:](self, "setMaskPath:onView:", MutableCopy);
    }
    CGPathRelease(MutableCopy);

    p_trackBlurView = &self->_trackBlurView;
    if (!self->_trackBlurView)
    {
      id v9 = 0;
      goto LABEL_12;
    }
    goto LABEL_10;
  }
  id v9 = [(_UIActionSlider *)self trackMaskImage];
  -[_UIActionSlider setMaskFromImage:onView:](self, "setMaskFromImage:onView:");
  if (self->_trackSolidView) {
    -[_UIActionSlider setMaskFromImage:onView:](self, "setMaskFromImage:onView:", v9);
  }
  uint64_t v6 = (uint64_t)v9;
  p_trackBlurView = &self->_trackBlurView;
  trackBlurView = self->_trackBlurView;
  if (trackBlurView)
  {
    if (v9)
    {
LABEL_11:
      id v9 = (id)v6;
      double v8 = [(_UIBackdropView *)trackBlurView inputSettings];
      [v8 setFilterMaskImage:v9];
      [v8 setGrayscaleTintMaskImage:v9];
      [v8 setColorTintMaskImage:v9];

      goto LABEL_12;
    }
LABEL_10:
    uint64_t v6 = [(_UIActionSlider *)self trackMaskImage];
    trackBlurView = *p_trackBlurView;
    goto LABEL_11;
  }
LABEL_12:
  [(UIView *)self->_trackBackgroundView bounds];
  [(_UIActionSlider *)self setCachedTrackMaskWidth:CGRectGetWidth(v11)];
}

- (void)setMaskPath:(CGPath *)a3 onView:(id)a4
{
  id v10 = a4;
  CGFloat v5 = [v10 layer];
  uint64_t v6 = [v5 mask];
  CGFloat v7 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v9 = [MEMORY[0x1E4F39C88] layer];

    objc_msgSend(v9, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    [v9 setDelegate:v10];
    [v5 setMask:v9];
    uint64_t v6 = v9;
  }
  [v10 bounds];
  objc_msgSend(v6, "setBounds:");
  [v6 setPath:a3];
}

- (void)setMaskFromImage:(id)a3 onView:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  uint64_t v8 = [v7 CGImage];
  id v22 = [MEMORY[0x1E4F39BE8] layer];
  [v6 bounds];
  objc_msgSend(v22, "setBounds:");
  objc_msgSend(v22, "setAnchorPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  [v7 scale];
  objc_msgSend(v22, "setContentsScale:");
  [v22 setDelegate:v6];
  [v7 size];
  double v10 = v9;
  double v12 = v11;
  [v7 capInsets];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  objc_msgSend(v22, "setContentsCenter:", v16 / v10, v14 / v12, (v10 - v20 - v16) / v10, (v12 - v14 - v18) / v12);
  [v22 setContents:v8];
  double v21 = [v6 layer];

  [v21 setMask:v22];
}

- (void)_showTrackLabel
{
  if (![(_UIActionSlider *)self isShowingTrackLabel])
  {
    if (!self->_trackLabel) {
      [(_UIActionSlider *)self _makeTrackLabel];
    }
    if ([(_UIActionSlider *)self textStyle])
    {
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __34___UIActionSlider__showTrackLabel__block_invoke;
      v3[3] = &unk_1E52D9F70;
      v3[4] = self;
      +[UIView animateWithDuration:v3 animations:0.15];
    }
    else
    {
      [(_UIActionSliderLabel *)self->_trackLabel fadeInWithDuration:0.15];
    }
    [(_UIActionSlider *)self setShowingTrackLabel:1];
  }
}

- (void)_hideTrackLabel:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIActionSlider *)self isShowingTrackLabel])
  {
    if (!self->_trackLabel) {
      [(_UIActionSlider *)self _makeTrackLabel];
    }
    if ([(_UIActionSlider *)self textStyle])
    {
      double v5 = 0.15;
      if (!v3) {
        double v5 = 0.0;
      }
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __35___UIActionSlider__hideTrackLabel___block_invoke;
      v7[3] = &unk_1E52D9F70;
      v7[4] = self;
      +[UIView animateWithDuration:v7 animations:v5];
    }
    else
    {
      trackLabel = self->_trackLabel;
      if (v3) {
        [(_UIActionSliderLabel *)trackLabel fadeOutWithDuration:0.15];
      }
      else {
        [(_UIActionSliderLabel *)trackLabel hide];
      }
    }
    [(_UIActionSlider *)self setShowingTrackLabel:0];
  }
}

- (void)_slideCompleted:(BOOL)a3
{
  BOOL v3 = a3;
  [(_UIActionSlider *)self setAnimating:1];
  [(_UIActionSlider *)self updateAllTrackMasks];
  self->_slideGestureInitialPoint = (CGPoint)*MEMORY[0x1E4F1DAD8];
  v8[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __35___UIActionSlider__slideCompleted___block_invoke;
  v9[3] = &unk_1E52D9FC0;
  BOOL v10 = v3;
  v9[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35___UIActionSlider__slideCompleted___block_invoke_2;
  v8[3] = &unk_1E52DC3A0;
  +[UIView _animateUsingDefaultTimingWithOptions:0 animations:v9 completion:v8];
  if (v3)
  {
    double v5 = [(_UIActionSlider *)self delegate];
    [(UIControl *)self _incrementStatisticsForUserActionForEvents:64];
    if (objc_opt_respondsToSelector()) {
      [v5 actionSliderDidCompleteSlide:self];
    }
  }
  else
  {
    dispatch_time_t v6 = dispatch_time(0, 150000000);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35___UIActionSlider__slideCompleted___block_invoke_3;
    v7[3] = &unk_1E52D9F70;
    v7[4] = self;
    dispatch_after(v6, MEMORY[0x1E4F14428], v7);
    double v5 = [(_UIActionSlider *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 actionSliderDidCancelSlide:self];
    }
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  CGFloat v4 = (UIPanGestureRecognizer *)a3;
  double v5 = v4;
  BOOL v10 = 1;
  if (self->_slideGestureRecognizer == v4)
  {
    [(UIPanGestureRecognizer *)v4 locationInView:self->_knobView];
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    [(UIView *)self->_knobView bounds];
    v12.double x = v7;
    v12.double y = v9;
    if (!CGRectContainsPoint(v13, v12)) {
      BOOL v10 = 0;
    }
  }

  return v10;
}

- (void)_knobPanGesture:(id)a3
{
  id v27 = a3;
  int v4 = *((_DWORD *)&self->super.super._viewFlags + 4);
  [(_UIActionSlider *)self _knobMinX];
  double v6 = v5;
  [(_UIActionSlider *)self _knobAvailableX];
  double v8 = v7;
  [v27 locationInView:self];
  double v10 = v9;
  CGFloat v12 = v11;
  p_slideGestureInitialPoint = &self->_slideGestureInitialPoint;
  double x = self->_slideGestureInitialPoint.x;
  [v27 velocityInView:self];
  double v16 = v15;
  double v17 = self->_slideGestureInitialPoint.x;
  if ((v4 & 0x80000) != 0)
  {
    double v18 = x - v10;
    if (v17 < 0.0)
    {
      [(_UIActionSlider *)self _knobMinX];
      goto LABEL_6;
    }
LABEL_7:
    double v20 = v8;
    goto LABEL_8;
  }
  double v18 = v10 - x;
  if (v17 >= 0.0) {
    goto LABEL_7;
  }
  [(_UIActionSlider *)self _knobMaxX];
LABEL_6:
  double v20 = v19;
LABEL_8:
  double v21 = [(_UIActionSlider *)self delegate];
  double v22 = v18 / v20;
  switch([v27 state])
  {
    case 1:
      p_slideGestureInitialPoint->double x = v10;
      self->_slideGestureInitialPoint.double y = v12;
      if ([(_UIActionSlider *)self shouldHideTrackLabelForXPoint:v10]) {
        [(_UIActionSlider *)self _hideTrackLabel:1];
      }
      if (objc_opt_respondsToSelector()) {
        [v21 actionSliderDidBeginSlide:self];
      }
      goto LABEL_22;
    case 2:
      if (![(_UIActionSlider *)self xPointIsWithinTrack:v10])
      {
        p_knobPosition = &self->_knobPosition;
        self->_knobPosition = 0.0;
LABEL_35:
        double *p_knobPosition = 0.0;
        [(_UIActionSlider *)self _showTrackLabel];
        goto LABEL_36;
      }
      if (![(_UIActionSlider *)self xPointIsWithinTrack:p_slideGestureInitialPoint->x])
      {
        if ([(_UIActionSlider *)self xPointIsWithinTrack:p_slideGestureInitialPoint->x]) {
          double v6 = p_slideGestureInitialPoint->x;
        }
        double v22 = vabdd_f64(v10, v6) / v8;
      }
      p_knobPosition = &self->_knobPosition;
      self->_knobPosition = v22;
      if (v22 <= 0.0) {
        goto LABEL_35;
      }
      if (v22 > 1.0) {
        double *p_knobPosition = 1.0;
      }
      [(_UIActionSlider *)self _hideTrackLabel:1];
LABEL_36:
      [(UIView *)self setNeedsLayout];
      [(UIView *)self setNeedsDisplay];
      if (objc_opt_respondsToSelector()) {
        [v21 actionSlider:self didUpdateSlideWithValue:*p_knobPosition];
      }
LABEL_22:

      return;
    case 3:
      BOOL v25 = v16 >= 150.0 && v22 >= 0.4;
      uint64_t v24 = v18 / (v20 * 0.6) >= 0.999000013 || v25;
      double v23 = self;
      goto LABEL_21;
    case 4:
    case 5:
      double v23 = self;
      uint64_t v24 = 0;
LABEL_21:
      [(_UIActionSlider *)v23 _slideCompleted:v24];
      goto LABEL_22;
    default:
      goto LABEL_22;
  }
}

- (int64_t)style
{
  return self->_style;
}

- (int64_t)textStyle
{
  return self->_textStyle;
}

- (void)setTextStyle:(int64_t)a3
{
  self->_textStyle = a3;
}

- (CGSize)knobImageOffset
{
  double width = self->_knobImageOffset.width;
  double height = self->_knobImageOffset.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)trackText
{
  return self->_trackText;
}

- (UIFont)trackFont
{
  return self->_trackFont;
}

- (CGSize)trackSize
{
  double width = self->_trackSize.width;
  double height = self->_trackSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)trackTextBaselineFromBottom
{
  return self->_trackTextBaselineFromBottom;
}

- (void)setTrackTextBaselineFromBottom:(double)a3
{
  self->_trackTextBaselineFromBottom = a3;
}

- (UIPanGestureRecognizer)slideGestureRecognizer
{
  return self->_slideGestureRecognizer;
}

- (_UIActionSliderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIActionSliderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)knobPosition
{
  return self->_knobPosition;
}

- (double)knobWidth
{
  return self->_knobWidth;
}

- (UIEdgeInsets)knobInsets
{
  double top = self->_knobInsets.top;
  double left = self->_knobInsets.left;
  double bottom = self->_knobInsets.bottom;
  double right = self->_knobInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)trackWidthProportion
{
  return self->_trackWidthProportion;
}

- (void)setTrackWidthProportion:(double)a3
{
  self->_trackWidthProportion = a3;
}

- (BOOL)isShowingTrackLabel
{
  return self->_showingTrackLabel;
}

- (void)setShowingTrackLabel:(BOOL)a3
{
  self->_showingTrackLabel = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (double)cachedTrackMaskWidth
{
  return self->_cachedTrackMaskWidth;
}

- (void)setCachedTrackMaskWidth:(double)a3
{
  self->_cachedTrackMaskWidth = a3;
}

- (UIView)_knobView
{
  return &self->_knobView->super;
}

- (_UIVibrantSettings)vibrantSettings
{
  return self->_vibrantSettings;
}

- (void)setVibrantSettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrantSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trackFont, 0);
  objc_storeStrong((id *)&self->_trackText, 0);
  objc_storeStrong((id *)&self->_slideGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_trackLabel, 0);
  objc_storeStrong((id *)&self->_knobImageView, 0);
  objc_storeStrong((id *)&self->_knobView, 0);
  objc_storeStrong((id *)&self->_trackSolidView, 0);
  objc_storeStrong((id *)&self->_trackBlurView, 0);
  objc_storeStrong((id *)&self->_trackBackgroundView, 0);
  objc_storeStrong((id *)&self->_trackDodgeView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end