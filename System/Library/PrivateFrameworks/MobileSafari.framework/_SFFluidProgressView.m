@interface _SFFluidProgressView
+ (double)defaultHeight;
- (BOOL)alignsToTop;
- (BOOL)isShowingProgress;
- (BOOL)progressAnimationSuppressed;
- (CGRect)_progressBarBoundsForValue:(double)a3;
- (UIColor)progressBarFillColor;
- (_SFFluidProgressView)initWithFrame:(CGRect)a3;
- (_SFFluidProgressViewDelegate)delegate;
- (double)cornerRadius;
- (void)_animateUsingDefaultTiming:(BOOL)a3 stepAnimationTime:(double)a4 options:(unint64_t)a5 animations:(id)a6 completion:(id)a7;
- (void)_finishProgressBarWithDuration:(double)a3;
- (void)fluidProgressController:(id)a3 setProgressToCurrentPosition:(id)a4;
- (void)fluidProgressController:(id)a3 startFluidProgressBar:(id)a4 animateFillFade:(BOOL)a5;
- (void)fluidProgressController:(id)a3 suppressProgressAnimation:(BOOL)a4 duringFluidProgressState:(id)a5 animated:(BOOL)a6;
- (void)fluidProgressController:(id)a3 updateFluidProgressBar:(id)a4 completion:(id)a5;
- (void)fluidProgressControllerFinishProgressBar:(id)a3 animateFillFade:(BOOL)a4;
- (void)layoutSubviews;
- (void)setAlignToTop:(BOOL)a3;
- (void)setAlignsToTop:(BOOL)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setProgressAnimationSuppressed:(BOOL)a3;
- (void)setProgressAnimationSuppressed:(BOOL)a3 duringFluidProgressState:(id)a4 animated:(BOOL)a5;
- (void)setProgressBarFillColor:(id)a3;
- (void)setProgressToCurrentPositionForState:(id)a3;
@end

@implementation _SFFluidProgressView

- (void)layoutSubviews
{
  [(_SFFluidProgressView *)self bounds];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38___SFFluidProgressView_layoutSubviews__block_invoke;
  v7[3] = &unk_1E54EA190;
  v7[4] = self;
  v7[5] = v3;
  v7[6] = v4;
  v7[7] = v5;
  v7[8] = v6;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
}

+ (double)defaultHeight
{
  if (defaultHeight_onceToken != -1) {
    dispatch_once(&defaultHeight_onceToken, &__block_literal_global_48);
  }
  return *(double *)&defaultHeight_height;
}

- (_SFFluidProgressView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)_SFFluidProgressView;
  uint64_t v3 = -[_SFFluidProgressView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v4 = v3;
  if (v3)
  {
    [(_SFFluidProgressView *)v3 setClipsToBounds:1];
    uint64_t v5 = [MEMORY[0x1E4FB1618] clearColor];
    [(_SFFluidProgressView *)v4 setBackgroundColor:v5];

    [(_SFFluidProgressView *)v4 setUserInteractionEnabled:0];
    BOOL v6 = [(UIView *)v4 _sf_usesLeftToRightLayout];
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
    progressBarFillColor = v4->_progressBarFillColor;
    v4->_progressBarFillColor = (UIColor *)v7;

    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    progressBar = v4->_progressBar;
    v4->_progressBar = v9;

    if (v6) {
      double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    else {
      double v11 = 0.0;
    }
    if (v6) {
      double v12 = *MEMORY[0x1E4F1DAD8];
    }
    else {
      double v12 = 1.0;
    }
    v13 = [(UIView *)v4->_progressBar layer];
    objc_msgSend(v13, "setAnchorPoint:", v12, v11);

    [(UIView *)v4->_progressBar setBackgroundColor:v4->_progressBarFillColor];
    [(UIView *)v4->_progressBar setAccessibilityIdentifier:@"FluidProgressView"];
    v14 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    clippingView = v4->_clippingView;
    v4->_clippingView = v14;

    [(UIView *)v4->_clippingView setClipsToBounds:1];
    v16 = [(UIView *)v4->_clippingView layer];
    objc_msgSend(v16, "setAnchorPoint:", v12, v11);

    [(UIView *)v4->_clippingView addSubview:v4->_progressBar];
    [(_SFFluidProgressView *)v4 addSubview:v4->_clippingView];
    v17 = v4;
  }

  return v4;
}

- (void)setDelegate:(id)a3
{
}

- (void)setProgressToCurrentPositionForState:(id)a3
{
  p_state = &self->_state;
  id v5 = a3;
  objc_storeWeak((id *)p_state, v5);
  [v5 fluidProgressValue];
  -[_SFFluidProgressView _progressBarBoundsForValue:](self, "_progressBarBoundsForValue:");
  -[UIView setBounds:](self->_clippingView, "setBounds:");
  uint64_t v6 = [v5 fluidProgressAnimationPhase];

  if (v6 != 5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained fluidProgressViewWillShowProgress:self];
  }
}

- (BOOL)isShowingProgress
{
  return ![(UIView *)self->_clippingView isHidden];
}

- (CGRect)_progressBarBoundsForValue:(double)a3
{
  [(UIView *)self->_clippingView bounds];
  double v6 = v5;
  double v8 = v7;
  BOOL v9 = [(UIView *)self _sf_usesLeftToRightLayout];
  double v10 = -a3;
  if (v9) {
    double v10 = 0.0;
  }
  double v11 = v6;
  double v12 = a3;
  double v13 = v8;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (void)setProgressBarFillColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_progressBarFillColor != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_progressBarFillColor, a3);
    [(UIView *)self->_progressBar setBackgroundColor:self->_progressBarFillColor];
    double v5 = v6;
  }
}

- (void)setAlignsToTop:(BOOL)a3
{
  self->_alignsToTop = a3;
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[_SFFluidProgressView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:");
  }
}

- (void)setAlignToTop:(BOOL)a3
{
  if (self->_alignsToTop != a3)
  {
    self->_alignsToTop = a3;
    [(_SFFluidProgressView *)self setNeedsLayout];
  }
}

- (void)setProgressAnimationSuppressed:(BOOL)a3 duringFluidProgressState:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  id v8 = a4;
  BOOL v9 = v8;
  if (self->_progressAnimationSuppressed != v6)
  {
    self->_progressAnimationSuppressed = v6;
    if (v8)
    {
      if ([v8 fluidProgressAnimationPhase] != 5)
      {
        if (v5)
        {
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __89___SFFluidProgressView_setProgressAnimationSuppressed_duringFluidProgressState_animated___block_invoke;
          v10[3] = &unk_1E54EA208;
          v10[4] = self;
          BOOL v11 = v6;
          [MEMORY[0x1E4FB1EB0] animateWithDuration:50331652 delay:v10 options:0 animations:0.4 completion:0.0];
        }
        else
        {
          [(UIView *)self->_clippingView setAlpha:(double)!v6];
        }
      }
    }
  }
}

- (void)_finishProgressBarWithDuration:(double)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __55___SFFluidProgressView__finishProgressBarWithDuration___block_invoke;
  v4[3] = &unk_1E54E9858;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55___SFFluidProgressView__finishProgressBarWithDuration___block_invoke_2;
  v3[3] = &unk_1E54E9998;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:50331652 delay:v4 options:v3 animations:a3 completion:0.0];
}

- (void)fluidProgressController:(id)a3 startFluidProgressBar:(id)a4 animateFillFade:(BOOL)a5
{
  BOOL v5 = a5;
  objc_storeWeak((id *)&self->_state, a4);
  [(UIView *)self->_clippingView setHidden:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained fluidProgressViewWillShowProgress:self];

  clippingView = self->_clippingView;
  [(_SFFluidProgressView *)self _progressBarBoundsForValue:0.0];
  -[UIView setBounds:](clippingView, "setBounds:");
  double v9 = 0.25;
  if (!v5) {
    double v9 = 0.0;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __86___SFFluidProgressView_fluidProgressController_startFluidProgressBar_animateFillFade___block_invoke;
  v10[3] = &unk_1E54E9858;
  v10[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:50331652 delay:v10 options:0 animations:v9 completion:0.0];
}

- (void)_animateUsingDefaultTiming:(BOOL)a3 stepAnimationTime:(double)a4 options:(unint64_t)a5 animations:(id)a6 completion:(id)a7
{
  if (a3) {
    objc_msgSend(MEMORY[0x1E4FB1EB0], "_animateUsingDefaultTimingWithOptions:animations:completion:", 50331648, a6, a7, a4);
  }
  else {
    [MEMORY[0x1E4FB1EB0] animateWithDuration:a5 | 0x3000000 delay:a6 options:a7 animations:a4 completion:0.0];
  }
}

- (void)fluidProgressController:(id)a3 updateFluidProgressBar:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, void))a5;
  uint64_t v9 = [v7 fluidProgressAnimationPhase];
  if (self->_progressAnimationSuppressed)
  {
    if (v8) {
      v8[2](v8, 0);
    }
  }
  else
  {
    BOOL v10 = v9 == 4;
    BOOL v11 = [v7 nextFluidProgressAnimation];
    if ([v7 isFluidProgressStalled]) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = 196608;
    }
    double v13 = [(_SFFluidProgressView *)self window];

    double v14 = 0.0;
    if (!v13) {
      double v14 = 0.25;
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82___SFFluidProgressView_fluidProgressController_updateFluidProgressBar_completion___block_invoke;
    v19[3] = &unk_1E54E9AB0;
    v19[4] = self;
    id v20 = v11;
    BOOL v21 = v10;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __82___SFFluidProgressView_fluidProgressController_updateFluidProgressBar_completion___block_invoke_2;
    v16[3] = &unk_1E54ECB60;
    double v18 = v14;
    v17 = v8;
    id v15 = v11;
    [(_SFFluidProgressView *)self _animateUsingDefaultTiming:v10 stepAnimationTime:v12 options:v19 animations:v16 completion:0.25];
  }
}

- (void)fluidProgressControllerFinishProgressBar:(id)a3 animateFillFade:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeWeak((id *)&self->_state, 0);
  double v6 = 0.4;
  if (!v4) {
    double v6 = 0.0;
  }

  [(_SFFluidProgressView *)self _finishProgressBarWithDuration:v6];
}

- (void)fluidProgressController:(id)a3 setProgressToCurrentPosition:(id)a4
{
  clippingView = self->_clippingView;
  objc_msgSend(a4, "fluidProgressValue", a3);
  -[_SFFluidProgressView _progressBarBoundsForValue:](self, "_progressBarBoundsForValue:");

  -[UIView setBounds:](clippingView, "setBounds:");
}

- (void)fluidProgressController:(id)a3 suppressProgressAnimation:(BOOL)a4 duringFluidProgressState:(id)a5 animated:(BOOL)a6
{
}

- (BOOL)progressAnimationSuppressed
{
  return self->_progressAnimationSuppressed;
}

- (void)setProgressAnimationSuppressed:(BOOL)a3
{
  self->_progressAnimationSuppressed = a3;
}

- (_SFFluidProgressViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFFluidProgressViewDelegate *)WeakRetained;
}

- (UIColor)progressBarFillColor
{
  return self->_progressBarFillColor;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)alignsToTop
{
  return self->_alignsToTop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressBarFillColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_state);
  objc_storeStrong((id *)&self->_clippingView, 0);

  objc_storeStrong((id *)&self->_progressBar, 0);
}

@end