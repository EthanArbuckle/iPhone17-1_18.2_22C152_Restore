@interface TKVibrationRecorderProgressView
- (BOOL)isAccessibilityElement;
- (CGRect)_frameForDotAtTimeInterval:(double)a3 duration:(double)a4;
- (CGRect)accessibilityFrame;
- (CGSize)_dotSize;
- (CGSize)intrinsicContentSize;
- (TKVibrationRecorderProgressView)initWithFrame:(CGRect)a3;
- (TKVibrationRecorderProgressView)initWithMaximumTimeInterval:(double)a3 styleProvider:(id)a4;
- (UIOffset)_dotInsets;
- (double)_cappedValueForTimeInterval:(double)result;
- (double)currentTimeInterval;
- (id)_dotTintColor;
- (id)_resizableDotImage;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int)roundedCornersCompensationDelayMode;
- (void)_updateHorizontalConstraintsOfDotForCurrentVibrationComponent:(id)a3 withFrame:(CGRect)a4;
- (void)_updateProgressViewBackgroundColor;
- (void)clearAllVibrationComponents;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)setCurrentTimeInterval:(double)a3;
- (void)setRoundedCornersCompensationDelayMode:(int)a3;
- (void)vibrationComponentDidEnd;
- (void)vibrationComponentDidStart;
@end

@implementation TKVibrationRecorderProgressView

- (TKVibrationRecorderProgressView)initWithFrame:(CGRect)a3
{
  return -[TKVibrationRecorderProgressView initWithMaximumTimeInterval:styleProvider:](self, "initWithMaximumTimeInterval:styleProvider:", 0, 0.0, a3.origin.y, a3.size.width, a3.size.height);
}

- (TKVibrationRecorderProgressView)initWithMaximumTimeInterval:(double)a3 styleProvider:(id)a4
{
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)TKVibrationRecorderProgressView;
  v8 = -[TKVibrationRecorderProgressView initWithFrame:](&v21, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = v8;
  if (a3 <= 0.0)
  {
    v10 = v8;
    v9 = 0;
    goto LABEL_5;
  }
  if (v8)
  {
    objc_storeStrong((id *)&v8->_styleProvider, a4);
    v9->_currentTimeInterval = 0.0;
    v9->_maximumTimeInterval = a3;
    v9->_currentVibrationComponentDidBeginTimeInterval = -1.0;
    v9->_previousPauseDidBeginTimeInterval = -1.0;
    v10 = (TKVibrationRecorderProgressView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    v11 = [v7 vibrationRecorderProgressViewTrackColor];
    [(TKVibrationRecorderProgressView *)v10 setBackgroundColor:v11];

    [(TKVibrationRecorderProgressView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TKVibrationRecorderProgressView *)v9 addSubview:v10];
    [(UIView *)v10 tk_constrainLayoutAttribute:1 asEqualToValueOfItem:v9];
    [(UIView *)v10 tk_constrainLayoutAttribute:2 asEqualToValueOfItem:v9];
    [(UIView *)v10 tk_constrainLayoutAttribute:3 asEqualToValueOfItem:v9];
    [(UIView *)v10 tk_constrainLayoutAttribute:4 asEqualToValueOfItem:v9];
    v12 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
    progressView = v9->_progressView;
    v9->_progressView = v12;

    v14 = v9->_progressView;
    v15 = [(TKVibrationRecorderProgressView *)v9 tintColor];
    [(UIView *)v14 setBackgroundColor:v15];

    [(UIView *)v9->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TKVibrationRecorderProgressView *)v9 addSubview:v9->_progressView];
    [(UIView *)v9->_progressView tk_constrainLayoutAttribute:1 asEqualToValueOfItem:v9];
    [(UIView *)v9->_progressView tk_constrainLayoutAttribute:3 asEqualToValueOfItem:v9];
    [(UIView *)v9->_progressView tk_constrainLayoutAttribute:4 asEqualToValueOfItem:v9];
    uint64_t v16 = [(UIView *)v9->_progressView tk_addedConstraintForLayoutAttribute:7 asEqualToValueOfItem:v9 withMultiplier:0.0];
    progressViewWidthConstraint = v9->_progressViewWidthConstraint;
    v9->_progressViewWidthConstraint = (NSLayoutConstraint *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    dots = v9->_dots;
    v9->_dots = v18;

LABEL_5:
  }

  return v9;
}

- (void)setCurrentTimeInterval:(double)a3
{
  self->_currentTimeInterval = a3;
  -[TKVibrationRecorderProgressView _cappedValueForTimeInterval:](self, "_cappedValueForTimeInterval:");
  double v5 = v4;
  double v6 = v4 / self->_maximumTimeInterval;
  int v7 = [(TKVibrationRecorderProgressView *)self roundedCornersCompensationDelayMode];
  if (v7 == 2)
  {
    [(TKVibrationRecorderProgressView *)self _dotInsets];
    double v11 = v10;
    [(TKVibrationRecorderProgressView *)self _dotSize];
    double v9 = v11 + v12 * 0.5;
  }
  else
  {
    if (v7 != 1) {
      goto LABEL_12;
    }
    [(TKVibrationRecorderProgressView *)self _dotInsets];
    double v9 = v8;
  }
  if (v9 > 0.0 && v5 > 0.0)
  {
    [(TKVibrationRecorderProgressView *)self bounds];
    double v13 = v9 / CGRectGetWidth(v21);
    double v14 = v6 - (1.0 - (v13 + v13));
    if (v14 < 0.0) {
      double v14 = 0.0;
    }
    double v15 = v6 - v13 * (1.0 - v14 / (v13 + v13));
    if (v15 >= 2.22044605e-16) {
      double v6 = v15;
    }
    else {
      double v6 = 2.22044605e-16;
    }
  }
LABEL_12:
  [(NSLayoutConstraint *)self->_progressViewWidthConstraint tk_removeFromContainer];
  uint64_t v16 = [(UIView *)self->_progressView tk_addedConstraintForLayoutAttribute:7 asEqualToValueOfItem:self withMultiplier:v6];
  progressViewWidthConstraint = self->_progressViewWidthConstraint;
  self->_progressViewWidthConstraint = v16;

  if (self->_dotForCurrentVibrationComponent)
  {
    double v18 = v5 - self->_currentVibrationComponentDidBeginTimeInterval;
    -[TKVibrationRecorderProgressView _frameForDotAtTimeInterval:duration:](self, "_frameForDotAtTimeInterval:duration:");
    -[TKVibrationRecorderProgressView _updateHorizontalConstraintsOfDotForCurrentVibrationComponent:withFrame:](self, "_updateHorizontalConstraintsOfDotForCurrentVibrationComponent:withFrame:", self->_dotForCurrentVibrationComponent);
    dotForCurrentVibrationComponent = self->_dotForCurrentVibrationComponent;
    [(TKVibrationRecorderProgressDotImageView *)dotForCurrentVibrationComponent setDuration:v18];
  }
}

- (void)_updateProgressViewBackgroundColor
{
  progressView = self->_progressView;
  id v3 = [(TKVibrationRecorderProgressView *)self tintColor];
  [(UIView *)progressView setBackgroundColor:v3];
}

- (id)_resizableDotImage
{
  return (id)[(TKVibrationRecorderStyleProvider *)self->_styleProvider vibrationRecorderProgressViewResizableDotImage];
}

- (CGSize)_dotSize
{
  v2 = [(TKVibrationRecorderProgressView *)self _resizableDotImage];
  [v2 size];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIOffset)_dotInsets
{
  [(TKVibrationRecorderStyleProvider *)self->_styleProvider vibrationRecorderProgressViewDotHorizontalInset];
  double v3 = 0.0;
  result.vertical = v3;
  result.horizontal = v2;
  return result;
}

- (id)_dotTintColor
{
  return (id)[(TKVibrationRecorderStyleProvider *)self->_styleProvider vibrationRecorderProgressViewDotTintColor];
}

- (void)vibrationComponentDidStart
{
  [(TKVibrationRecorderProgressView *)self _cappedValueForTimeInterval:self->_currentTimeInterval];
  double v4 = v3;
  self->_currentVibrationComponentDidBeginTimeInterval = v3;
  double v5 = [TKVibrationRecorderProgressDotImageView alloc];
  double v6 = [(TKVibrationRecorderProgressView *)self _resizableDotImage];
  double v7 = [(TKVibrationRecorderProgressDotImageView *)v5 initWithImage:v6];

  double v8 = [(TKVibrationRecorderProgressView *)self _dotTintColor];
  [(TKVibrationRecorderProgressDotImageView *)v7 setTintColor:v8];

  [(TKVibrationRecorderProgressDotImageView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(TKVibrationRecorderProgressView *)self addSubview:v7];
  [(TKVibrationRecorderProgressView *)self _frameForDotAtTimeInterval:v4 duration:0.0];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  [(UIView *)v7 tk_constrainLayoutAttribute:10 asEqualToValueOfItem:self];
  -[TKVibrationRecorderProgressView _updateHorizontalConstraintsOfDotForCurrentVibrationComponent:withFrame:](self, "_updateHorizontalConstraintsOfDotForCurrentVibrationComponent:withFrame:", v7, v10, v12, v14, v16);
  [(TKVibrationRecorderProgressDotImageView *)v7 setTimeInterval:v4];
  [(TKVibrationRecorderProgressDotImageView *)v7 setDuration:0.0];
  [(TKVibrationRecorderProgressDotImageView *)v7 setPreviousPauseTimeInterval:self->_previousPauseDidBeginTimeInterval];
  [(TKVibrationRecorderProgressDotImageView *)v7 setPreviousPauseDuration:v4 - self->_previousPauseDidBeginTimeInterval];
  [(TKVibrationRecorderStyleProvider *)self->_styleProvider vibrationRecorderProgressViewAccessibilityAdditionalHeight];
  -[TKVibrationRecorderProgressDotImageView setAccessibilityFrameAdditionalHeight:](v7, "setAccessibilityFrameAdditionalHeight:");
  [(NSMutableArray *)self->_dots addObject:v7];
  dotForCurrentVibrationComponent = self->_dotForCurrentVibrationComponent;
  self->_dotForCurrentVibrationComponent = v7;

  UIAccessibilityNotifications v18 = *MEMORY[0x263F1CE18];

  UIAccessibilityPostNotification(v18, 0);
}

- (void)vibrationComponentDidEnd
{
  dotForCurrentVibrationComponent = self->_dotForCurrentVibrationComponent;
  self->_dotForCurrentVibrationComponent = 0;

  dotForCurrentVibrationComponentLeftConstraint = self->_dotForCurrentVibrationComponentLeftConstraint;
  self->_dotForCurrentVibrationComponentLeftConstraint = 0;

  dotForCurrentVibrationComponentRightConstraint = self->_dotForCurrentVibrationComponentRightConstraint;
  self->_dotForCurrentVibrationComponentRightConstraint = 0;

  self->_currentVibrationComponentDidBeginTimeInterval = -1.0;
  [(TKVibrationRecorderProgressView *)self _cappedValueForTimeInterval:self->_currentTimeInterval];
  self->_previousPauseDidBeginTimeInterval = v6;
}

- (void)clearAllVibrationComponents
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = self->_dots;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "removeFromSuperview", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_dots removeAllObjects];
  [(TKVibrationRecorderProgressView *)self vibrationComponentDidEnd];
  self->_previousPauseDidBeginTimeInterval = -1.0;
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F1D7C8];
  [(TKVibrationRecorderStyleProvider *)self->_styleProvider vibrationRecorderProgressViewHeight];
  double v4 = v3;
  double v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)_updateHorizontalConstraintsOfDotForCurrentVibrationComponent:(id)a3 withFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v9 = a3;
  [(TKVibrationRecorderProgressView *)self bounds];
  CGFloat v10 = CGRectGetWidth(v23);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __107__TKVibrationRecorderProgressView__updateHorizontalConstraintsOfDotForCurrentVibrationComponent_withFrame___block_invoke;
  v19[3] = &unk_264589D50;
  id v20 = v9;
  CGRect v21 = self;
  CGFloat v22 = v10;
  id v11 = v9;
  double v12 = (void (**)(void, void, double))MEMORY[0x223C781A0](v19);
  [(NSLayoutConstraint *)self->_dotForCurrentVibrationComponentLeftConstraint tk_removeFromContainer];
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v24);
  v12[2](v12, 1, MinX);
  double v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  dotForCurrentVibrationComponentLeftConstraint = self->_dotForCurrentVibrationComponentLeftConstraint;
  self->_dotForCurrentVibrationComponentLeftConstraint = v14;

  [(NSLayoutConstraint *)self->_dotForCurrentVibrationComponentRightConstraint tk_removeFromContainer];
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGFloat MaxX = CGRectGetMaxX(v25);
  v12[2](v12, 2, MaxX);
  v17 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  dotForCurrentVibrationComponentRightConstraint = self->_dotForCurrentVibrationComponentRightConstraint;
  self->_dotForCurrentVibrationComponentRightConstraint = v17;
}

uint64_t __107__TKVibrationRecorderProgressView__updateHorizontalConstraintsOfDotForCurrentVibrationComponent_withFrame___block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withMultiplier:", a2, 9, *(void *)(a1 + 40), (a3 + a3) / *(double *)(a1 + 48));
}

- (CGRect)_frameForDotAtTimeInterval:(double)a3 duration:(double)a4
{
  [(TKVibrationRecorderProgressView *)self _dotSize];
  double v8 = v7;
  double v10 = v9;
  double v11 = v7 * 0.5;
  [(TKVibrationRecorderProgressView *)self _dotInsets];
  double v13 = v12;
  double v15 = v14;
  double v16 = v12 + v11;
  [(TKVibrationRecorderProgressView *)self bounds];
  double v17 = CGRectGetWidth(v37) - v13 - v11 - v16;
  double maximumTimeInterval = self->_maximumTimeInterval;
  double v19 = a3 / maximumTimeInterval * v17;
  double v20 = a4 / maximumTimeInterval * v17;
  double v21 = v19 + v20 - (v17 - (v11 + v11));
  double v22 = 0.0;
  if (v21 < 0.0) {
    double v21 = 0.0;
  }
  double v23 = v20 + v11 * (v21 / (v11 + v11));
  double v24 = v11 - v19;
  if (v11 - v19 < 0.0) {
    double v24 = 0.0;
  }
  double v25 = v24 / v11;
  double v26 = v19 - v11 * (v24 / v11);
  double v27 = v23 + v11 * v25;
  double v28 = v8 * 1.2 - v27;
  if (v28 < 0.0) {
    double v28 = 0.0;
  }
  double v29 = v27 - v8 * (1.0 - v28 / (v8 * 1.2));
  if (v29 < 0.0) {
    double v29 = 0.0;
  }
  double v30 = v17 - v11 - (v26 + v29);
  if (v30 < 0.0)
  {
    double v31 = -v30;
    double v32 = v29 + v30;
    if (v32 >= 0.0) {
      double v22 = v32;
    }
    double v26 = v26 - (v31 - (v29 - v22));
    double v29 = v22;
  }
  double v33 = v16 + v26;
  double v34 = v8 + v29;
  double v35 = v15;
  double v36 = v10;
  result.size.CGFloat height = v36;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v35;
  result.origin.CGFloat x = v33;
  return result;
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)TKVibrationRecorderProgressView;
  [(TKVibrationRecorderProgressView *)&v3 didMoveToSuperview];
  [(TKVibrationRecorderProgressView *)self _updateProgressViewBackgroundColor];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)TKVibrationRecorderProgressView;
  [(TKVibrationRecorderProgressView *)&v3 didMoveToWindow];
  [(TKVibrationRecorderProgressView *)self _updateProgressViewBackgroundColor];
}

- (double)_cappedValueForTimeInterval:(double)result
{
  if (result < 0.0) {
    CGRect result = 0.0;
  }
  if (result >= self->_maximumTimeInterval) {
    return self->_maximumTimeInterval;
  }
  return result;
}

- (BOOL)isAccessibilityElement
{
  return [(NSMutableArray *)self->_dots count] == 0;
}

- (id)accessibilityLabel
{
  return (id)TLLocalizedString();
}

- (id)accessibilityValue
{
  objc_super v3 = TLLocalizedString();
  if ([@"VIBRATION_RECORDER_PROGRESS_VALUE_FORMAT" isEqualToString:v3])
  {
    v8.receiver = self;
    v8.super_class = (Class)TKVibrationRecorderProgressView;
    double v4 = [(TKVibrationRecorderProgressView *)&v8 accessibilityValue];
  }
  else
  {
    double v5 = +[TKVibrationInterfaceUtilities descriptionForDuration:self->_currentTimeInterval];
    uint64_t v6 = +[TKVibrationInterfaceUtilities descriptionForDuration:self->_maximumTimeInterval];
    double v4 = objc_msgSend(NSString, "stringWithFormat:", v3, v5, v6);
  }

  return v4;
}

- (CGRect)accessibilityFrame
{
  [(TKVibrationRecorderStyleProvider *)self->_styleProvider vibrationRecorderProgressViewAccessibilityAdditionalHeight];
  double v4 = v3;
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderProgressView;
  [(TKVibrationRecorderProgressView *)&v5 accessibilityFrame];
  return CGRectInset(v6, 0.0, v4 * -0.5);
}

- (double)currentTimeInterval
{
  return self->_currentTimeInterval;
}

- (int)roundedCornersCompensationDelayMode
{
  return self->_roundedCornersCompensationDelayMode;
}

- (void)setRoundedCornersCompensationDelayMode:(int)a3
{
  self->_roundedCornersCompensationDelayMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dots, 0);
  objc_storeStrong((id *)&self->_dotForCurrentVibrationComponentRightConstraint, 0);
  objc_storeStrong((id *)&self->_dotForCurrentVibrationComponentLeftConstraint, 0);
  objc_storeStrong((id *)&self->_dotForCurrentVibrationComponent, 0);
  objc_storeStrong((id *)&self->_progressViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_progressView, 0);

  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end