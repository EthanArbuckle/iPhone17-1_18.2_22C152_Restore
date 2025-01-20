@interface SBUISystemApertureButton
- (SBUISystemApertureButton)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation SBUISystemApertureButton

- (SBUISystemApertureButton)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBUISystemApertureButton;
  v3 = -[SBUISystemApertureButton initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(SBUISystemApertureButton *)v3 titleLabel];
    [v5 setAdjustsFontForContentSizeCategory:1];
    objc_initWeak(&location, v4);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __42__SBUISystemApertureButton_initWithFrame___block_invoke;
    v7[3] = &unk_1E5CCD458;
    objc_copyWeak(&v8, &location);
    [(SBUISystemApertureButton *)v4 setConfigurationUpdateHandler:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v4;
}

void __42__SBUISystemApertureButton_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sbui_updateConfiguration");
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBUISystemApertureButton;
  unsigned int v5 = [(SBUISystemApertureButton *)&v15 isHighlighted];
  v14.receiver = self;
  v14.super_class = (Class)SBUISystemApertureButton;
  [(SBUISystemApertureButton *)&v14 setHighlighted:v3];
  if (v5 != v3)
  {
    [(SBUISystemApertureButton *)self bounds];
    double v7 = v6;
    [(SBUISystemApertureButton *)self bounds];
    if (v7 >= v8) {
      double v9 = v7;
    }
    else {
      double v9 = v8;
    }
    double v10 = fmax((v9 + -6.0) / v9, 0.9);
    double v11 = 0.37;
    v12[1] = 3221225472;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[2] = __43__SBUISystemApertureButton_setHighlighted___block_invoke;
    v12[3] = &unk_1E5CCD480;
    v12[4] = self;
    if (v3) {
      double v11 = 0.26;
    }
    BOOL v13 = v3;
    *(double *)&v12[5] = v10;
    [MEMORY[0x1E4F42FF0] animateWithSpringDuration:2 bounce:v12 initialSpringVelocity:0 delay:v11 options:0.0 animations:0.0 completion:0.0];
  }
}

uint64_t __43__SBUISystemApertureButton_setHighlighted___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  double v3 = 0.7;
  if (!*(unsigned char *)(a1 + 48)) {
    double v3 = 1.0;
  }
  [v2 setAlpha:v3];
  v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 48))
  {
    CGAffineTransformMakeScale(&v7, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  }
  else
  {
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v7.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v7.c = v5;
    *(_OWORD *)&v7.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  return [v4 setTransform:&v7];
}

@end