@interface NTKVictoryLogoButton
- (NTKVictoryLogoButton)initWithFrame:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation NTKVictoryLogoButton

- (NTKVictoryLogoButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKVictoryLogoButton;
  v3 = -[NTKAdjustableTapTargetButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    -[NTKAdjustableTapTargetButton setTouchEdgeInsets:](v3, "setTouchEdgeInsets:", -20.0, -20.0, -20.0, -20.0);
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKVictoryLogoButton;
  -[NTKVictoryLogoButton setHighlighted:](&v11, sel_setHighlighted_);
  v5 = (void *)MEMORY[0x1E4FB1EB0];
  if (v3)
  {
    objc_super v6 = v10;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v7 = __39__NTKVictoryLogoButton_setHighlighted___block_invoke;
  }
  else
  {
    objc_super v6 = &v8;
    uint64_t v8 = MEMORY[0x1E4F143A8];
    uint64_t v9 = 3221225472;
    v7 = __39__NTKVictoryLogoButton_setHighlighted___block_invoke_2;
  }
  v6[2] = (uint64_t)v7;
  v6[3] = (uint64_t)&unk_1E62BFF20;
  v6[4] = (uint64_t)self;
  objc_msgSend(v5, "animateWithDuration:animations:", 0.15, v8, v9);
}

uint64_t __39__NTKVictoryLogoButton_setHighlighted___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.9, 0.9);
  v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];
  return [*(id *)(a1 + 32) setAlpha:0.6];
}

uint64_t __39__NTKVictoryLogoButton_setHighlighted___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

@end