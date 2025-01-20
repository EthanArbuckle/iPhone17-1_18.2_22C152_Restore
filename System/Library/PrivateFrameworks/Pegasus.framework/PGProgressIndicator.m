@interface PGProgressIndicator
- (BOOL)includesWaitingToPlayIndicator;
- (PGProgressIndicator)initWithFrame:(CGRect)a3;
- (UIColor)customElapsedTrackTintColor;
- (double)progress;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_applyPulseState;
- (void)_performLayout;
- (void)_setCornerRadius:(double)a3;
- (void)_transitionToPulseStateIfNeeded:(int64_t)a3;
- (void)_updateElapsedTrackTintColor;
- (void)_updatePulseAnimatorIfNeeded;
- (void)layoutSubviews;
- (void)setCustomElapsedTrackTintColor:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setIncludesWaitingToPlayIndicator:(BOOL)a3;
- (void)setProgress:(double)a3;
@end

@implementation PGProgressIndicator

- (PGProgressIndicator)initWithFrame:(CGRect)a3
{
  v18.receiver = self;
  v18.super_class = (Class)PGProgressIndicator;
  v3 = -[PGMaterialView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PGProgressIndicator *)v3 setUserInteractionEnabled:0];
    v5 = [PGVibrantFillView alloc];
    [(PGProgressIndicator *)v4 bounds];
    uint64_t v6 = -[PGVibrantFillView initWithFrame:](v5, "initWithFrame:");
    completeTrack = v4->_completeTrack;
    v4->_completeTrack = (PGVibrantFillView *)v6;

    v8 = v4->_completeTrack;
    [(PGProgressIndicator *)v4 bounds];
    -[PGVibrantFillView setFrame:](v8, "setFrame:");
    v9 = v4->_completeTrack;
    v10 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.1];
    [(PGVibrantFillView *)v9 setTintColor:v10];

    v11 = [(PGMaterialView *)v4 contentView];
    [v11 addSubview:v4->_completeTrack];

    v12 = [PGVibrantFillView alloc];
    [(PGProgressIndicator *)v4 bounds];
    uint64_t v13 = -[PGVibrantFillView initWithFrame:](v12, "initWithFrame:");
    elapsedTrack = v4->_elapsedTrack;
    v4->_elapsedTrack = (PGVibrantFillView *)v13;

    v15 = v4->_elapsedTrack;
    [(PGProgressIndicator *)v4 bounds];
    -[PGVibrantFillView setFrame:](v15, "setFrame:");
    v16 = [(PGMaterialView *)v4 contentView];
    [v16 addSubview:v4->_elapsedTrack];

    [(PGProgressIndicator *)v4 _updateElapsedTrackTintColor];
  }
  return v4;
}

- (void)setCustomElapsedTrackTintColor:(id)a3
{
  v4 = (UIColor *)a3;
  customElapsedTrackTintColor = self->_customElapsedTrackTintColor;
  if (customElapsedTrackTintColor != v4)
  {
    v8 = v4;
    if (([(UIColor *)customElapsedTrackTintColor isEqual:v4] & 1) == 0)
    {
      uint64_t v6 = (UIColor *)[(UIColor *)v8 copy];
      v7 = self->_customElapsedTrackTintColor;
      self->_customElapsedTrackTintColor = v6;

      [(PGProgressIndicator *)self _updateElapsedTrackTintColor];
    }
  }

  MEMORY[0x1F41817F8]();
}

- (void)setProgress:(double)a3
{
  int IsValid = CGFloatIsValid();
  double v6 = 0.0;
  double v7 = fmin(fmax(a3, 0.0), 1.0);
  if (IsValid) {
    double v6 = v7;
  }
  if (self->_progress != v6)
  {
    self->_progress = v6;
    [(PGProgressIndicator *)self _performLayout];
  }
}

- (void)setIncludesWaitingToPlayIndicator:(BOOL)a3
{
  self->_includesWaitingToPlayIndicator = a3;
  [(PGProgressIndicator *)self _updatePulseAnimatorIfNeeded];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PGProgressIndicator;
  -[PGProgressIndicator setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PGProgressIndicator *)self _performLayout];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PGProgressIndicator;
  [(PGMaterialView *)&v3 layoutSubviews];
  [(PGProgressIndicator *)self _performLayout];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)_setCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PGProgressIndicator;
  -[PGMaterialView _setCornerRadius:](&v5, sel__setCornerRadius_);
  [(PGVibrantFillView *)self->_completeTrack _setCornerRadius:a3];
  [(PGVibrantFillView *)self->_elapsedTrack _setCornerRadius:a3];
}

- (void)_performLayout
{
  completeTrack = self->_completeTrack;
  objc_super v4 = [(PGMaterialView *)self contentView];
  [v4 bounds];
  -[PGVibrantFillView setFrame:](completeTrack, "setFrame:");

  objc_super v5 = [(PGMaterialView *)self contentView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  [(PGProgressIndicator *)self progress];
  UIRoundToViewScale();
  -[PGVibrantFillView setFrame:](self->_elapsedTrack, "setFrame:", v7, v9, v12, v11);
  [(PGProgressIndicator *)self bounds];
  double v13 = CGRectGetHeight(v15) * 0.5;

  [(PGProgressIndicator *)self _setCornerRadius:v13];
}

- (void)_updateElapsedTrackTintColor
{
  elapsedTrack = self->_elapsedTrack;
  uint64_t v3 = [(PGProgressIndicator *)self customElapsedTrackTintColor];
  id v5 = (id)v3;
  if (v3)
  {
    [(PGVibrantFillView *)elapsedTrack setTintColor:v3];
  }
  else
  {
    objc_super v4 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.35];
    [(PGVibrantFillView *)elapsedTrack setTintColor:v4];
  }
}

- (void)_updatePulseAnimatorIfNeeded
{
  BOOL v3 = [(PGProgressIndicator *)self includesWaitingToPlayIndicator];
  int64_t pulseState = self->_pulseState;
  if (v3 && !pulseState)
  {
    uint64_t v5 = 1;
LABEL_9:
    [(PGProgressIndicator *)self _transitionToPulseStateIfNeeded:v5];
    return;
  }
  if (pulseState) {
    char v6 = v3;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0)
  {
    uint64_t v5 = 0;
    goto LABEL_9;
  }
}

- (void)_transitionToPulseStateIfNeeded:(int64_t)a3
{
  if (self->_pulseState != a3)
  {
    self->_int64_t pulseState = a3;
    p_pulseAnimator = &self->_pulseAnimator;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_pulseAnimator);
    if ([WeakRetained isRunning]
      && [WeakRetained isInterruptible])
    {
      [WeakRetained stopAnimation:0];
      [WeakRetained finishAnimationAtPosition:2];
    }
    if (a3) {
      double v7 = 1.0;
    }
    else {
      double v7 = 0.2;
    }
    uint64_t v14 = 0;
    CGRect v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    objc_super v18 = __Block_byref_object_dispose_;
    id v8 = objc_alloc(MEMORY[0x1E4F43008]);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__PGProgressIndicator__transitionToPulseStateIfNeeded___block_invoke;
    v13[3] = &unk_1E610C280;
    v13[4] = self;
    id v19 = (id)[v8 initWithDuration:3 curve:v13 animations:v7];
    objc_initWeak(&location, self);
    double v9 = (void *)v15[5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __55__PGProgressIndicator__transitionToPulseStateIfNeeded___block_invoke_2;
    v10[3] = &unk_1E610C500;
    objc_copyWeak(v11, &location);
    v10[4] = &v14;
    v11[1] = (id)a3;
    [v9 addCompletion:v10];
    objc_storeWeak((id *)p_pulseAnimator, (id)v15[5]);
    [(id)v15[5] startAnimation];
    objc_destroyWeak(v11);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v14, 8);
  }
}

uint64_t __55__PGProgressIndicator__transitionToPulseStateIfNeeded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyPulseState];
}

void __55__PGProgressIndicator__transitionToPulseStateIfNeeded___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v14 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    char v6 = WeakRetained + 56;
    id v7 = objc_loadWeakRetained(WeakRetained + 56);
    if (a2 || v5 != v7)
    {
    }
    else
    {
      int v8 = [v14 includesWaitingToPlayIndicator];

      if (!v8) {
        goto LABEL_11;
      }
      objc_storeWeak(v6, 0);
      uint64_t v9 = *(void *)(a1 + 48);
      if (v9 == 2)
      {
        double v10 = v14;
        uint64_t v11 = 1;
      }
      else
      {
        if (v9 != 1) {
          goto LABEL_11;
        }
        double v10 = v14;
        uint64_t v11 = 2;
      }
      [v10 _transitionToPulseStateIfNeeded:v11];
    }
  }
LABEL_11:
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  double v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

- (void)_applyPulseState
{
  [(PGProgressIndicator *)self frame];
  double Width = CGRectGetWidth(v27);
  double v4 = 1.0;
  double v5 = 1.0;
  if (Width > 10.0)
  {
    double v5 = (Width + -1.5) / Width;
    double v4 = (Width + 1.5) / Width;
  }
  int64_t pulseState = self->_pulseState;
  if (pulseState == 2)
  {
    elapsedTrack = self->_elapsedTrack;
    double v10 = [(PGProgressIndicator *)self customElapsedTrackTintColor];
    if (v10)
    {
      [(PGVibrantFillView *)elapsedTrack setTintColor:v10];
    }
    else
    {
      objc_super v18 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.45];
      [(PGVibrantFillView *)elapsedTrack setTintColor:v18];
    }
    completeTrack = self->_completeTrack;
    v20 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.375];
    [(PGVibrantFillView *)completeTrack setTintColor:v20];

    CGAffineTransformMakeScale(&v24, v4, v4);
    v17 = &v24;
  }
  else if (pulseState == 1)
  {
    uint64_t v11 = self->_elapsedTrack;
    uint64_t v12 = [(PGProgressIndicator *)self customElapsedTrackTintColor];
    if (v12)
    {
      [(PGVibrantFillView *)v11 setTintColor:v12];
    }
    else
    {
      v21 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.15];
      [(PGVibrantFillView *)v11 setTintColor:v21];
    }
    v22 = self->_completeTrack;
    v23 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.05];
    [(PGVibrantFillView *)v22 setTintColor:v23];

    CGAffineTransformMakeScale(&v25, v5, v5);
    v17 = &v25;
  }
  else
  {
    if (pulseState) {
      return;
    }
    id v7 = self->_elapsedTrack;
    int v8 = [(PGProgressIndicator *)self customElapsedTrackTintColor];
    if (v8)
    {
      [(PGVibrantFillView *)v7 setTintColor:v8];
    }
    else
    {
      double v13 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.35];
      [(PGVibrantFillView *)v7 setTintColor:v13];
    }
    uint64_t v14 = self->_completeTrack;
    CGRect v15 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.1];
    [(PGVibrantFillView *)v14 setTintColor:v15];

    long long v16 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v26[0] = *MEMORY[0x1E4F1DAB8];
    v26[1] = v16;
    v26[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v17 = (CGAffineTransform *)v26;
  }
  [(PGProgressIndicator *)self setTransform:v17];
}

- (double)progress
{
  return self->_progress;
}

- (UIColor)customElapsedTrackTintColor
{
  return self->_customElapsedTrackTintColor;
}

- (BOOL)includesWaitingToPlayIndicator
{
  return self->_includesWaitingToPlayIndicator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customElapsedTrackTintColor, 0);
  objc_destroyWeak((id *)&self->_pulseAnimator);
  objc_storeStrong((id *)&self->_completeTrack, 0);

  objc_storeStrong((id *)&self->_elapsedTrack, 0);
}

@end