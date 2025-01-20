@interface SBUIPoseidonIconView
- (BOOL)containsFirstRowIcons;
- (CGAffineTransform)localTransform;
- (CGRect)_physicalButtonNormalizedFrame;
- (CGRect)sidebarFrame;
- (SBUIPoseidonIconView)initWithFrame:(CGRect)a3;
- (SBUIPoseidonIconViewDelegate)delegate;
- (_UILegibilitySettings)legibilitySettings;
- (double)_fontSize;
- (int64_t)state;
- (void)_cancelRestToOpenIdleTimer;
- (void)_cancelRestToOpenProgress;
- (void)_contentSizeCategoryDidChange;
- (void)_startReduceMotionShimmer;
- (void)_startRestToOpenIdleTimer;
- (void)_startShimmer;
- (void)_stopShimmer;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)fillRestToOpenWithDuration:(double)a3;
- (void)layoutSubviews;
- (void)resetRestToOpen;
- (void)setContainsFirstRowIcons:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLocalTransform:(CGAffineTransform *)a3;
- (void)setSidebarFrame:(CGRect)a3;
- (void)setState:(int64_t)a3;
- (void)setState:(int64_t)a3 forIdleTimeout:(BOOL)a4 withCompletion:(id)a5;
@end

@implementation SBUIPoseidonIconView

- (SBUIPoseidonIconView)initWithFrame:(CGRect)a3
{
  v57[3] = *MEMORY[0x1E4F143B8];
  v55.receiver = self;
  v55.super_class = (Class)SBUIPoseidonIconView;
  v3 = -[SBUIPoseidonIconView initWithFrame:](&v55, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];

    v5 = (_UILegibilityView *)objc_alloc_init(MEMORY[0x1E4F43238]);
    coachingButton = v3->_coachingButton;
    v3->_coachingButton = v5;

    [(_UILegibilityView *)v3->_coachingButton setStrength:0.25];
    v7 = v3->_coachingButton;
    v8 = [MEMORY[0x1E4F428B8] whiteColor];
    [(_UILegibilityView *)v7 setBackgroundColor:v8];

    [(SBUIPoseidonIconView *)v3 addSubview:v3->_coachingButton];
    [(SBUIPoseidonIconView *)v3 setClipsToBounds:1];
    v51 = [(_UILegibilityView *)v3->_coachingButton layer];
    [v51 setCornerRadius:5.0];
    [v51 setCornerCurve:*MEMORY[0x1E4F39EA8]];
    v9 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    coachingLabelRotationView = v3->_coachingLabelRotationView;
    v3->_coachingLabelRotationView = v9;

    [(SBUIPoseidonIconView *)v3 addSubview:v3->_coachingLabelRotationView];
    v11 = v3->_coachingLabelRotationView;
    long long v12 = *(_OWORD *)&v3->_localTransform.a;
    long long v13 = *(_OWORD *)&v3->_localTransform.tx;
    long long v53 = *(_OWORD *)&v3->_localTransform.c;
    long long v54 = v13;
    long long v52 = v12;
    [(UIView *)v11 setTransform:&v52];
    uint64_t v14 = [MEMORY[0x1E4F39BD0] layer];
    shimmerGradient = v3->_shimmerGradient;
    v3->_shimmerGradient = (CAGradientLayer *)v14;

    v16 = [MEMORY[0x1E4F428B8] whiteColor];
    v17 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.7];
    v18 = v3->_shimmerGradient;
    id v19 = v17;
    v57[0] = [v19 CGColor];
    id v20 = v16;
    v57[1] = [v20 CGColor];
    id v21 = v19;
    v57[2] = [v21 CGColor];
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:3];
    [(CAGradientLayer *)v18 setColors:v22];

    -[CAGradientLayer setStartPoint:](v3->_shimmerGradient, "setStartPoint:", 0.0, 0.5);
    -[CAGradientLayer setEndPoint:](v3->_shimmerGradient, "setEndPoint:", 1.0, 0.5);
    [(CAGradientLayer *)v3->_shimmerGradient setLocations:&unk_1EFCEAFE8];
    v23 = [SBUILegibilityLabel alloc];
    v24 = [(SBUIPoseidonIconView *)v3 legibilitySettings];
    v25 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v26 = [v25 localizedStringForKey:@"TOUCH_ID" value:&stru_1EFCB7578 table:@"SpringBoardUIServices-j307"];
    v27 = (void *)MEMORY[0x1E4F42A30];
    [(SBUIPoseidonIconView *)v3 _fontSize];
    v28 = objc_msgSend(v27, "systemFontOfSize:weight:");
    uint64_t v29 = [(SBUILegibilityLabel *)v23 initWithSettings:v24 strength:v26 string:v28 font:0.25];
    coachingLabel = v3->_coachingLabel;
    v3->_coachingLabel = (SBUILegibilityLabel *)v29;

    [(SBUILegibilityLabel *)v3->_coachingLabel setNumberOfLines:0];
    [(UIView *)v3->_coachingLabelRotationView addSubview:v3->_coachingLabel];
    v31 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    restToOpenLabelRotationView = v3->_restToOpenLabelRotationView;
    v3->_restToOpenLabelRotationView = v31;

    [(SBUIPoseidonIconView *)v3 addSubview:v3->_restToOpenLabelRotationView];
    v33 = v3->_restToOpenLabelRotationView;
    long long v34 = *(_OWORD *)&v3->_localTransform.a;
    long long v35 = *(_OWORD *)&v3->_localTransform.tx;
    long long v53 = *(_OWORD *)&v3->_localTransform.c;
    long long v54 = v35;
    long long v52 = v34;
    [(UIView *)v33 setTransform:&v52];
    uint64_t v36 = [MEMORY[0x1E4F39BD0] layer];
    progressFillGradient = v3->_progressFillGradient;
    v3->_progressFillGradient = (CAGradientLayer *)v36;

    v38 = v3->_progressFillGradient;
    id v39 = v20;
    v56[0] = [v39 CGColor];
    id v40 = v21;
    v56[1] = [v40 CGColor];
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v56 count:2];
    [(CAGradientLayer *)v38 setColors:v41];

    -[CAGradientLayer setStartPoint:](v3->_progressFillGradient, "setStartPoint:", 0.0, 0.5);
    -[CAGradientLayer setEndPoint:](v3->_progressFillGradient, "setEndPoint:", 1.0, 0.5);
    [(CAGradientLayer *)v3->_progressFillGradient setLocations:&unk_1EFCEB000];
    v42 = [SBUILegibilityLabel alloc];
    v43 = [(SBUIPoseidonIconView *)v3 legibilitySettings];
    v44 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v45 = [v44 localizedStringForKey:@"REST_TO_OPEN" value:&stru_1EFCB7578 table:@"SpringBoardUIServices-j307"];
    v46 = (void *)MEMORY[0x1E4F42A30];
    [(SBUIPoseidonIconView *)v3 _fontSize];
    v47 = objc_msgSend(v46, "systemFontOfSize:weight:");
    uint64_t v48 = [(SBUILegibilityLabel *)v42 initWithSettings:v43 strength:v45 string:v47 font:0.25];
    restToOpenLabel = v3->_restToOpenLabel;
    v3->_restToOpenLabel = (SBUILegibilityLabel *)v48;

    [(SBUILegibilityLabel *)v3->_restToOpenLabel setNumberOfLines:0];
    [(UIView *)v3->_restToOpenLabelRotationView addSubview:v3->_restToOpenLabel];
    [(_UILegibilityView *)v3->_coachingButton setAlpha:0.0];
    [(UIView *)v3->_coachingLabelRotationView setAlpha:0.0];
    [(UIView *)v3->_restToOpenLabelRotationView setAlpha:0.0];
    [(SBUIPoseidonIconView *)v3 setNeedsLayout];
  }
  return v3;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(_UILegibilityView *)self->_coachingButton updateForChangedSettings:v5];
    [(SBUILegibilityLabel *)self->_coachingLabel setLegibilitySettings:v5];
    [(SBUILegibilityLabel *)self->_restToOpenLabel setLegibilitySettings:v5];
  }
}

- (void)setState:(int64_t)a3
{
}

- (void)setState:(int64_t)a3 forIdleTimeout:(BOOL)a4 withCompletion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  if (self->_state != a3)
  {
    self->_state = a3;
    switch(a3)
    {
      case 2:
        [(SBUIPoseidonIconView *)self _stopShimmer];
        v17 = [(SBUIPoseidonIconView *)self delegate];
        [v17 poseidonIconViewCoachingStateDidChange:self];

        v18 = (void *)MEMORY[0x1E4F42FF0];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_7;
        v21[3] = &unk_1E5CCC580;
        v21[4] = self;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_8;
        v19[3] = &unk_1E5CCECD8;
        v19[4] = self;
        id v20 = v8;
        [v18 animateWithDuration:v21 animations:v19 completion:0.15];

        break;
      case 1:
        v9 = (void *)MEMORY[0x1E4F42FF0];
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_5;
        v23[3] = &unk_1E5CCC580;
        v23[4] = self;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_6;
        v22[3] = &unk_1E5CCC6E8;
        v22[4] = self;
        double v14 = 0.0;
        v15 = v23;
        v16 = v22;
LABEL_10:
        [v9 animateWithDuration:v15 animations:v16 completion:v14];
        break;
      case 0:
        [(SBUIPoseidonIconView *)self _stopShimmer];
        [(SBUIPoseidonIconView *)self _cancelRestToOpenIdleTimer];
        if (v5)
        {
          [(_UILegibilityView *)self->_coachingButton frame];
          v9 = (void *)MEMORY[0x1E4F42FF0];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke;
          v27[3] = &unk_1E5CCECB0;
          v27[4] = self;
          v27[5] = v10;
          v27[6] = v11;
          v27[7] = v12;
          v27[8] = v13;
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_2;
          v26[3] = &unk_1E5CCC6E8;
          v26[4] = self;
          double v14 = 0.5;
          v15 = v27;
          v16 = v26;
        }
        else
        {
          v9 = (void *)MEMORY[0x1E4F42FF0];
          v25[0] = MEMORY[0x1E4F143A8];
          v25[1] = 3221225472;
          v25[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_3;
          v25[3] = &unk_1E5CCC580;
          v25[4] = self;
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_4;
          v24[3] = &unk_1E5CCC6E8;
          v24[4] = self;
          double v14 = 0.15;
          v15 = v25;
          v16 = v24;
        }
        goto LABEL_10;
    }
    [(SBUIPoseidonIconView *)self _cancelRestToOpenProgress];
    [(SBUIPoseidonIconView *)self setNeedsLayout];
  }
}

uint64_t __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 408), "setFrame:", *(double *)(a1 + 40), -*(double *)(a1 + 64), *(double *)(a1 + 56));
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 440);
  return [v2 setAlpha:0.0];
}

void __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 poseidonIconViewCoachingStateDidChange:*(void *)(a1 + 32)];
}

uint64_t __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.0];
  id v2 = *(void **)(*(void *)(a1 + 32) + 440);
  return [v2 setAlpha:0.0];
}

void __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 poseidonIconViewCoachingStateDidChange:*(void *)(a1 + 32)];
}

uint64_t __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_5(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.7];
  id v2 = *(void **)(*(void *)(a1 + 32) + 440);
  return [v2 setAlpha:0.0];
}

void __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 poseidonIconViewCoachingStateDidChange:*(void *)(a1 + 32)];
}

uint64_t __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_7(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 408) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.0];
  id v2 = *(void **)(*(void *)(a1 + 32) + 440);
  return [v2 setAlpha:0.7];
}

uint64_t __63__SBUIPoseidonIconView_setState_forIdleTimeout_withCompletion___block_invoke_8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  return [v3 _startRestToOpenIdleTimer];
}

- (void)fillRestToOpenWithDuration:(double)a3
{
  [(SBUIPoseidonIconView *)self _cancelRestToOpenIdleTimer];
  if (a3 > 0.0)
  {
    [(UIView *)self->_restToOpenLabelRotationView alpha];
    if (BSFloatGreaterThanFloat()) {
      [(UIView *)self->_restToOpenLabelRotationView setAlpha:1.0];
    }
    progressFillGradient = self->_progressFillGradient;
    [(UIView *)self->_restToOpenLabelRotationView bounds];
    double v7 = v6 * 1.2;
    [(UIView *)self->_restToOpenLabelRotationView bounds];
    -[CAGradientLayer setFrame:](progressFillGradient, "setFrame:", 0.0, 0.0, v7);
    id v8 = [(UIView *)self->_restToOpenLabelRotationView layer];
    [v8 setMask:self->_progressFillGradient];

    id v11 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"locations"];
    v9 = [(CAGradientLayer *)self->_progressFillGradient locations];
    [v11 setFromValue:v9];

    [v11 setToValue:&unk_1EFCEB018];
    LODWORD(v10) = 1.0;
    [v11 setRepeatCount:v10];
    [v11 setDuration:a3];
    [v11 setDelegate:self];
    [(CAGradientLayer *)self->_progressFillGradient removeAllAnimations];
    [(CAGradientLayer *)self->_progressFillGradient addAnimation:v11 forKey:@"fillGradient"];
    self->_fullProgressFillDuration = a3;
    self->_startProgressFillTime = CACurrentMediaTime();
    self->_isFilling = 1;
  }
}

- (void)resetRestToOpen
{
  [(SBUIPoseidonIconView *)self _cancelRestToOpenProgress];
  [(SBUIPoseidonIconView *)self _startRestToOpenIdleTimer];
  [(SBUIPoseidonIconView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v71.receiver = self;
  v71.super_class = (Class)SBUIPoseidonIconView;
  [(SBUIPoseidonIconView *)&v71 layoutSubviews];
  if ((unint64_t)(self->_state - 1) <= 1)
  {
    [(SBUIPoseidonIconView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    [(SBUIPoseidonIconView *)self frame];
    double v8 = v7;
    double v10 = v9;
    id v11 = (id *)MEMORY[0x1E4F43630];
    if ((unint64_t)([(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation] - 1) >= 2) {
      double v8 = v10;
    }
    [(SBUIPoseidonIconView *)self _physicalButtonNormalizedFrame];
    -[_UILegibilityView setFrame:](self->_coachingButton, "setFrame:", v4 * v12, v6 * v13 + -18.0, v8 * v14, 24.0);
    [(_UILegibilityView *)self->_coachingButton center];
    double v16 = v15;
    [(_UILegibilityView *)self->_coachingButton frame];
    double v17 = v4 - CGRectGetMaxX(v72);
    int64_t state = self->_state;
    if (state == 1)
    {
      -[SBUILegibilityLabel sizeThatFits:](self->_coachingLabel, "sizeThatFits:", 250.0, v6);
      double v20 = v19;
      double v22 = v21;
      unint64_t v23 = [*v11 activeInterfaceOrientation] - 3;
      [(_UILegibilityView *)self->_coachingButton frame];
      double v24 = CGRectGetMaxY(v73) + 10.0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      double v27 = v20;
      double v28 = v22;
      if (v23 > 1)
      {
        double v30 = v24 + CGRectGetHeight(*(CGRect *)&v25) * 0.5;
        [(SBUILegibilityLabel *)self->_coachingLabel baselineOffset];
        double v29 = v30 - v31;
        if (v20 >= 82.0) {
          double v16 = v4 - v17 + v20 * -0.5;
        }
      }
      else
      {
        double v29 = v24 + CGRectGetWidth(*(CGRect *)&v25) * 0.5;
      }
      if ([*v11 activeInterfaceOrientation] == 1) {
        uint64_t v32 = 2;
      }
      else {
        uint64_t v32 = 2 * ([*v11 activeInterfaceOrientation] == 4);
      }
      [(SBUILegibilityLabel *)self->_coachingLabel setTextAlignment:v32];
      -[UIView setBounds:](self->_coachingLabelRotationView, "setBounds:", 0.0, 0.0, v20, v22);
      -[UIView setCenter:](self->_coachingLabelRotationView, "setCenter:", v16, v29);
      coachingLabel = self->_coachingLabel;
      [(UIView *)self->_coachingLabelRotationView bounds];
      -[SBUILegibilityLabel setFrame:](coachingLabel, "setFrame:");
      if ([*v11 activeInterfaceOrientation] == 3 && self->_containsFirstRowIcons)
      {
        [(UIView *)self->_coachingLabelRotationView setHidden:1];
      }
      else
      {
        [(UIView *)self->_coachingLabelRotationView setHidden:0];
        [(SBUIPoseidonIconView *)self _startShimmer];
      }
      int64_t state = self->_state;
    }
    if (state == 2)
    {
      -[SBUILegibilityLabel sizeThatFits:](self->_restToOpenLabel, "sizeThatFits:", 250.0, v6);
      double v35 = v34;
      double v37 = v36;
      unint64_t v38 = [*v11 activeInterfaceOrientation] - 3;
      [(_UILegibilityView *)self->_coachingButton frame];
      double v39 = CGRectGetMaxY(v74) + 10.0;
      uint64_t v40 = 0;
      uint64_t v41 = 0;
      double v42 = v35;
      double v43 = v37;
      if (v38 > 1)
      {
        double v45 = v39 + CGRectGetHeight(*(CGRect *)&v40) * 0.5;
        [(SBUILegibilityLabel *)self->_restToOpenLabel baselineOffset];
        double v44 = v45 - v46;
        if (v35 >= 82.0) {
          double v16 = v4 - v17 + v35 * -0.5;
        }
      }
      else
      {
        double v44 = v39 + CGRectGetWidth(*(CGRect *)&v40) * 0.5;
      }
      if ([*v11 activeInterfaceOrientation] == 1) {
        uint64_t v47 = 2;
      }
      else {
        uint64_t v47 = 2 * ([*v11 activeInterfaceOrientation] == 4);
      }
      [(SBUILegibilityLabel *)self->_restToOpenLabel setTextAlignment:v47];
      if ([*v11 activeInterfaceOrientation] == 3)
      {
        BOOL containsFirstRowIcons = self->_containsFirstRowIcons;
        if (self->_containsFirstRowIcons) {
          double v16 = v16 + 10.0;
        }
      }
      else
      {
        BOOL containsFirstRowIcons = 0;
      }
      -[UIView setBounds:](self->_restToOpenLabelRotationView, "setBounds:", 0.0, 0.0, v35, v37);
      -[UIView setCenter:](self->_restToOpenLabelRotationView, "setCenter:", v16, v44);
      if (containsFirstRowIcons)
      {
        [(UIView *)self->_restToOpenLabelRotationView frame];
        double v50 = v49;
        double v52 = v51;
        double v54 = v53;
        double v56 = v55;
        v57 = [(SBUIPoseidonIconView *)self superview];
        -[SBUIPoseidonIconView convertRect:toView:](self, "convertRect:toView:", v57, v50, v52, v54, v56);
        CGFloat v59 = v58;
        double v61 = v60;
        CGFloat v63 = v62;
        double v65 = v64;

        v75.origin.x = v59;
        v75.origin.y = v61;
        v75.size.width = v63;
        v75.size.height = v65;
        if (CGRectIntersectsRect(self->_sidebarFrame, v75))
        {
          double v66 = v61 + v65 - self->_sidebarFrame.origin.y;
          [(UIView *)self->_restToOpenLabelRotationView center];
          double v68 = v66 + v67 + 3.0;
          restToOpenLabelRotationView = self->_restToOpenLabelRotationView;
          [(UIView *)restToOpenLabelRotationView center];
          [(UIView *)restToOpenLabelRotationView setCenter:v68];
        }
      }
      restToOpenLabel = self->_restToOpenLabel;
      [(UIView *)self->_restToOpenLabelRotationView bounds];
      -[SBUILegibilityLabel setFrame:](restToOpenLabel, "setFrame:");
    }
  }
}

- (void)setLocalTransform:(CGAffineTransform *)a3
{
  p_localTransform = &self->_localTransform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_localTransform.c;
  *(_OWORD *)&v14.a = *(_OWORD *)&self->_localTransform.a;
  *(_OWORD *)&v14.c = v7;
  *(_OWORD *)&v14.tx = *(_OWORD *)&self->_localTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v14))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_localTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_localTransform->tx = v9;
    *(_OWORD *)&p_localTransform->a = v8;
    coachingLabelRotationView = self->_coachingLabelRotationView;
    long long v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v11;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    [(UIView *)coachingLabelRotationView setTransform:&t1];
    restToOpenLabelRotationView = self->_restToOpenLabelRotationView;
    long long v13 = *(_OWORD *)&p_localTransform->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&p_localTransform->a;
    *(_OWORD *)&t1.c = v13;
    *(_OWORD *)&t1.tx = *(_OWORD *)&p_localTransform->tx;
    [(UIView *)restToOpenLabelRotationView setTransform:&t1];
  }
}

- (double)_fontSize
{
  uint64_t v2 = [MEMORY[0x1E4F42738] sharedApplication];
  double v3 = [v2 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E4F43760])
    || UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E4F43768])
    || UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E4F43770])
    || UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E4F43778]))
  {
    double v4 = 32.0;
  }
  else
  {
    double v4 = 28.0;
    if (!UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E4F43780]))
    {
      double v4 = 24.0;
      if (!UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E4F43790]))
      {
        double v4 = 22.0;
        if (!UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E4F43798]))
        {
          double v4 = 20.0;
          if (!UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E4F437A0]))
          {
            double v4 = 19.0;
            if (!UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E4F437B0]))
            {
              double v4 = 18.0;
              if (!UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E4F437B8])
                && !UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E4F437C8]))
              {
                if (UIContentSizeCategoryIsEqualToCategory(v3, (NSString *)*MEMORY[0x1E4F437A8])) {
                  double v4 = 16.0;
                }
                else {
                  double v4 = 18.0;
                }
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

- (CGRect)_physicalButtonNormalizedFrame
{
  if (_physicalButtonNormalizedFrame_onceToken != -1) {
    dispatch_once(&_physicalButtonNormalizedFrame_onceToken, &__block_literal_global_42);
  }
  double v3 = *((double *)&_physicalButtonNormalizedFrame_frame + 1);
  double v2 = *(double *)&_physicalButtonNormalizedFrame_frame;
  double v4 = *(double *)&qword_1E97303C8;
  double v5 = unk_1E97303D0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

void __54__SBUIPoseidonIconView__physicalButtonNormalizedFrame__block_invoke()
{
  CFDataRef v0 = (const __CFData *)MGCopyAnswer();
  if (v0)
  {
    CFDataRef v1 = v0;
    CFTypeID v2 = CFGetTypeID(v0);
    if (v2 == CFDataGetTypeID())
    {
      BytePtr = (long long *)CFDataGetBytePtr(v1);
      long long v4 = BytePtr[1];
      _physicalButtonNormalizedFrame_frame = *BytePtr;
      *(_OWORD *)&qword_1E97303C8 = v4;
    }
    CFRelease(v1);
  }
}

- (void)_contentSizeCategoryDidChange
{
  coachingLabel = self->_coachingLabel;
  long long v4 = (void *)MEMORY[0x1E4F42A30];
  [(SBUIPoseidonIconView *)self _fontSize];
  double v5 = objc_msgSend(v4, "systemFontOfSize:weight:");
  [(SBUILegibilityLabel *)coachingLabel setFont:v5];

  restToOpenLabel = self->_restToOpenLabel;
  long long v7 = (void *)MEMORY[0x1E4F42A30];
  [(SBUIPoseidonIconView *)self _fontSize];
  long long v8 = objc_msgSend(v7, "systemFontOfSize:weight:");
  [(SBUILegibilityLabel *)restToOpenLabel setFont:v8];

  [(SBUIPoseidonIconView *)self setNeedsLayout];
}

- (void)_cancelRestToOpenProgress
{
  v12[2] = *MEMORY[0x1E4F143B8];
  double v3 = [(CAGradientLayer *)self->_progressFillGradient animationForKey:@"fillGradient"];

  if (v3)
  {
    self->_isFilling = 0;
    CFTimeInterval v4 = CACurrentMediaTime() - self->_startProgressFillTime;
    CFTimeInterval v5 = v4 / self->_fullProgressFillDuration;
    long long v6 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"locations"];
    long long v7 = [NSNumber numberWithDouble:v5 + -0.05];
    v12[0] = v7;
    long long v8 = [NSNumber numberWithDouble:v5 + 0.05];
    v12[1] = v8;
    long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
    [v6 setFromValue:v9];

    double v10 = [(CAGradientLayer *)self->_progressFillGradient locations];
    [v6 setToValue:v10];

    LODWORD(v11) = 1.0;
    [v6 setRepeatCount:v11];
    [v6 setDuration:v4 * 0.5];
    [v6 setDelegate:self];
    [(CAGradientLayer *)self->_progressFillGradient removeAllAnimations];
    [(CAGradientLayer *)self->_progressFillGradient addAnimation:v6 forKey:@"unfillGradient"];
  }
}

- (void)_startShimmer
{
  if (!self->_idleUntilShimmerTimer)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__SBUIPoseidonIconView__startShimmer__block_invoke;
    v5[3] = &unk_1E5CCED00;
    v5[4] = self;
    double v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v5 block:2.0];
    idleUntilShimmerTimer = self->_idleUntilShimmerTimer;
    self->_idleUntilShimmerTimer = v3;
  }
}

void __37__SBUIPoseidonIconView__startShimmer__block_invoke(uint64_t a1)
{
  BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  uint64_t v3 = *(void *)(a1 + 32);
  if (IsReduceMotionEnabled && !*(void *)(v3 + 504))
  {
    [(id)v3 _startReduceMotionShimmer];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __37__SBUIPoseidonIconView__startShimmer__block_invoke_2;
    v17[3] = &unk_1E5CCED00;
    v17[4] = *(void *)(a1 + 32);
    uint64_t v13 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:1 repeats:v17 block:3.5];
    uint64_t v14 = *(void *)(a1 + 32);
    double v15 = *(void **)(v14 + 504);
    *(void *)(v14 + 504) = v13;
  }
  else
  {
    [*(id *)(v3 + 432) alpha];
    if (BSFloatGreaterThanFloat()) {
      [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:1.0];
    }
    uint64_t v4 = *(void *)(a1 + 32);
    CFTimeInterval v5 = *(void **)(v4 + 488);
    [*(id *)(v4 + 432) bounds];
    double v7 = -v6;
    [*(id *)(*(void *)(a1 + 32) + 432) bounds];
    double v9 = v8 * 3.0;
    [*(id *)(*(void *)(a1 + 32) + 432) bounds];
    objc_msgSend(v5, "setFrame:", v7, 0.0, v9);
    double v10 = [*(id *)(*(void *)(a1 + 32) + 432) layer];
    [v10 setMask:*(void *)(*(void *)(a1 + 32) + 488)];

    id v16 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"locations"];
    double v11 = [*(id *)(*(void *)(a1 + 32) + 488) locations];
    [v16 setFromValue:v11];

    [v16 setToValue:&unk_1EFCEB030];
    LODWORD(v12) = 2139095040;
    [v16 setRepeatCount:v12];
    [v16 setDuration:2.5];
    [*(id *)(*(void *)(a1 + 32) + 488) addAnimation:v16 forKey:@"animateGradient"];
  }
}

uint64_t __37__SBUIPoseidonIconView__startShimmer__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startReduceMotionShimmer];
}

- (void)_startReduceMotionShimmer
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke;
  v3[3] = &unk_1E5CCC580;
  v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke_2;
  v2[3] = &unk_1E5CCC6E8;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:v2 completion:1.5];
}

uint64_t __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 536) == 1) {
    return [*(id *)(v1 + 432) setAlpha:1.0];
  }
  return result;
}

uint64_t __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke_3;
  v3[3] = &unk_1E5CCC580;
  uint64_t v4 = *(void *)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke_4;
  v2[3] = &unk_1E5CCC6E8;
  v2[4] = v4;
  return [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:v2 completion:1.5];
}

uint64_t __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 536) == 1) {
    return [*(id *)(v1 + 432) setAlpha:0.7];
  }
  return result;
}

void __49__SBUIPoseidonIconView__startReduceMotionShimmer__block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 432) layer];
  [v1 removeAllAnimations];
}

- (void)_stopShimmer
{
  [(UIView *)self->_coachingLabelRotationView alpha];
  if (BSFloatGreaterThanFloat()) {
    [(UIView *)self->_coachingLabelRotationView setAlpha:0.7];
  }
  uint64_t v3 = [(UIView *)self->_coachingLabelRotationView layer];
  [v3 setMask:0];

  idleUntilShimmerTimer = self->_idleUntilShimmerTimer;
  if (idleUntilShimmerTimer)
  {
    [(NSTimer *)idleUntilShimmerTimer invalidate];
    CFTimeInterval v5 = self->_idleUntilShimmerTimer;
    self->_idleUntilShimmerTimer = 0;
  }
  double v6 = [(UIView *)self->_coachingLabelRotationView layer];
  [v6 removeAllAnimations];

  reduceMotionShimmerTimer = self->_reduceMotionShimmerTimer;
  if (reduceMotionShimmerTimer)
  {
    [(NSTimer *)reduceMotionShimmerTimer invalidate];
    double v8 = self->_reduceMotionShimmerTimer;
    self->_reduceMotionShimmerTimer = 0;
  }
}

- (void)_startRestToOpenIdleTimer
{
  [(SBUIPoseidonIconView *)self _cancelRestToOpenIdleTimer];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__SBUIPoseidonIconView__startRestToOpenIdleTimer__block_invoke;
  v5[3] = &unk_1E5CCED00;
  v5[4] = self;
  uint64_t v3 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v5 block:3.0];
  restToOpenIdleTimer = self->_restToOpenIdleTimer;
  self->_restToOpenIdleTimer = v3;
}

uint64_t __49__SBUIPoseidonIconView__startRestToOpenIdleTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setState:0 forIdleTimeout:1 withCompletion:0];
}

- (void)_cancelRestToOpenIdleTimer
{
  restToOpenIdleTimer = self->_restToOpenIdleTimer;
  if (restToOpenIdleTimer)
  {
    [(NSTimer *)restToOpenIdleTimer invalidate];
    uint64_t v4 = self->_restToOpenIdleTimer;
    self->_restToOpenIdleTimer = 0;
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
  {
    CFTimeInterval v5 = [(UIView *)self->_restToOpenLabelRotationView layer];
    [v5 setMask:0];

    if (!self->_isFilling)
    {
      [(UIView *)self->_restToOpenLabelRotationView alpha];
      if (BSFloatGreaterThanFloat()) {
        [(UIView *)self->_restToOpenLabelRotationView setAlpha:0.7];
      }
    }
    [(SBUIPoseidonIconView *)self setNeedsLayout];
  }
}

- (SBUIPoseidonIconViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBUIPoseidonIconViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (int64_t)state
{
  return self->_state;
}

- (CGAffineTransform)localTransform
{
  long long v3 = *(_OWORD *)&self[12].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[12].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[12].tx;
  return self;
}

- (BOOL)containsFirstRowIcons
{
  return self->_containsFirstRowIcons;
}

- (void)setContainsFirstRowIcons:(BOOL)a3
{
  self->_BOOL containsFirstRowIcons = a3;
}

- (CGRect)sidebarFrame
{
  double x = self->_sidebarFrame.origin.x;
  double y = self->_sidebarFrame.origin.y;
  double width = self->_sidebarFrame.size.width;
  double height = self->_sidebarFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSidebarFrame:(CGRect)a3
{
  self->_sidebarFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reduceMotionShimmerTimer, 0);
  objc_storeStrong((id *)&self->_idleUntilShimmerTimer, 0);
  objc_storeStrong((id *)&self->_shimmerGradient, 0);
  objc_storeStrong((id *)&self->_progressFillGradient, 0);
  objc_storeStrong((id *)&self->_restToOpenIdleTimer, 0);
  objc_storeStrong((id *)&self->_restToOpenLabelRotationView, 0);
  objc_storeStrong((id *)&self->_coachingLabelRotationView, 0);
  objc_storeStrong((id *)&self->_restToOpenLabel, 0);
  objc_storeStrong((id *)&self->_coachingLabel, 0);
  objc_storeStrong((id *)&self->_coachingButton, 0);
}

@end