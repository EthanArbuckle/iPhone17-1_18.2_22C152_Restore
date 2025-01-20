@interface STUIStatusBarLockView
- (BOOL)prefersBaselineAlignment;
- (CGSize)intrinsicContentSize;
- (STUIStatusBarImageView)bodyView;
- (STUIStatusBarImageView)shackleView;
- (STUIStatusBarLockView)initWithFrame:(CGRect)a3;
- (id)completionBlock;
- (void)animateUnlockWithCompletionBlock:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)applyStyleAttributes:(id)a3;
- (void)jiggleWithCompletionBlock:(id)a3;
- (void)resetLock;
- (void)setBodyView:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setShackleView:(id)a3;
@end

@implementation STUIStatusBarLockView

- (STUIStatusBarLockView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)STUIStatusBarLockView;
  v3 = -[STUIStatusBarLockView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[STUIStatusBarImageView initWithFrame:]([STUIStatusBarImageView alloc], "initWithFrame:", 1.0, 2.0, 6.0, 7.0);
    shackleView = v3->_shackleView;
    v3->_shackleView = v4;

    [(STUIStatusBarLockView *)v3 addSubview:v3->_shackleView];
    v6 = -[STUIStatusBarImageView initWithFrame:]([STUIStatusBarImageView alloc], "initWithFrame:", 0.0, 6.0, 8.0, 6.0);
    bodyView = v3->_bodyView;
    v3->_bodyView = v6;

    [(STUIStatusBarLockView *)v3 addSubview:v3->_bodyView];
  }
  return v3;
}

- (void)applyStyleAttributes:(id)a3
{
  id v12 = a3;
  v4 = [(STUIStatusBarImageView *)self->_shackleView image];

  if (!v4)
  {
    v5 = +[STUIStatusBarImageProvider sharedProvider];
    v6 = [v5 imageNamed:@"LockShackle" styleAttributes:v12];
    v7 = [v6 imageWithRenderingMode:2];

    [(STUIStatusBarImageView *)self->_shackleView setImage:v7];
  }
  [(STUIStatusBarImageView *)self->_shackleView applyStyleAttributes:v12];
  v8 = [(STUIStatusBarImageView *)self->_bodyView image];

  if (!v8)
  {
    objc_super v9 = +[STUIStatusBarImageProvider sharedProvider];
    v10 = [v9 imageNamed:@"LockBody" styleAttributes:v12];
    v11 = [v10 imageWithRenderingMode:2];

    [(STUIStatusBarImageView *)self->_bodyView setImage:v11];
  }
  [(STUIStatusBarImageView *)self->_bodyView applyStyleAttributes:v12];
}

- (BOOL)prefersBaselineAlignment
{
  return 1;
}

- (void)resetLock
{
  v3 = [(STUIStatusBarImageView *)self->_shackleView layer];
  [v3 removeAllAnimations];

  v4 = [(STUIStatusBarLockView *)self layer];
  [v4 removeAllAnimations];

  shackleView = self->_shackleView;
  -[STUIStatusBarImageView setFrame:](shackleView, "setFrame:", 1.0, 2.0, 6.0, 7.0);
}

- (CGSize)intrinsicContentSize
{
  double v2 = 8.0;
  double v3 = 12.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)animateUnlockWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (self->_completionBlock)
  {
    if (!v4) {
      goto LABEL_6;
    }
    id v18 = v4;
    (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
  }
  else
  {
    id v18 = v4;
    v5 = _Block_copy(v4);
    id completionBlock = self->_completionBlock;
    self->_id completionBlock = v5;

    -[STUIStatusBarImageView setFrame:](self->_shackleView, "setFrame:", 1.0, 0.0, 6.0, 7.0);
    v7 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
    [v7 setMass:2.0];
    [v7 setStiffness:300.0];
    [v7 setDamping:400.0];
    [v7 setDuration:0.91];
    id v8 = objc_alloc(MEMORY[0x1E4F39C10]);
    LODWORD(v9) = 1046809695;
    LODWORD(v10) = 990250344;
    LODWORD(v11) = 1057860847;
    LODWORD(v12) = 1064564184;
    v13 = (void *)[v8 initWithControlPoints:v9 :v10 :v11 :v12];
    [v7 setTimingFunction:v13];

    LODWORD(v14) = 1066192077;
    [v7 setSpeed:v14];
    v15 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", centerOfRect(1.0, 2.0, 6.0, 7.0));
    [v7 setFromValue:v15];

    v16 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", centerOfRect(1.0, 0.0, 6.0, 7.0));
    [v7 setToValue:v16];

    [v7 setFillMode:*MEMORY[0x1E4F39FA0]];
    [v7 setDelegate:self];
    -[STUIStatusBarImageView setFrame:](self->_shackleView, "setFrame:", 1.0, 0.0, 6.0, 7.0);
    v17 = [(STUIStatusBarImageView *)self->_shackleView layer];
    [v17 addAnimation:v7 forKey:@"unlock"];
  }
  id v4 = v18;
LABEL_6:
}

- (void)jiggleWithCompletionBlock:(id)a3
{
  v32[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t))a3;
  v5 = [(STUIStatusBarLockView *)self layer];
  if (self->_completionBlock)
  {
    if (v4) {
      v4[2](v4, 1);
    }
  }
  else
  {
    v6 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
    v7 = (void *)MEMORY[0x1E4F29238];
    [v5 position];
    id v8 = objc_msgSend(v7, "valueWithCGPoint:");
    [v6 setFromValue:v8];

    double v9 = (void *)MEMORY[0x1E4F29238];
    [v5 position];
    double v11 = v10 + -20.0;
    [v5 position];
    double v12 = [v9 valueWithCGPoint:v11];
    [v6 setToValue:v12];

    [v6 setMass:1.2];
    [v6 setStiffness:1200.0];
    [v6 setDamping:12.0];
    [v6 setDuration:0.6679];
    LODWORD(v13) = 1028404955;
    LODWORD(v14) = 990250344;
    LODWORD(v15) = 1059713387;
    LODWORD(v16) = 1.0;
    v17 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v13 :v14 :v15 :v16];
    [v6 setTimingFunction:v17];
    id v18 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    v31[4] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    v31[5] = v19;
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    v31[6] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    v31[7] = v20;
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    v31[0] = *MEMORY[0x1E4F39B10];
    v31[1] = v21;
    long long v22 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    v31[2] = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    v31[3] = v22;
    v23 = [MEMORY[0x1E4F29238] valueWithCATransform3D:v31];
    [v18 setFromValue:v23];

    v24 = (void *)MEMORY[0x1E4F29238];
    CATransform3DMakeTranslation(&v30, 20.0, 0.0, 0.0);
    v25 = [v24 valueWithCATransform3D:&v30];
    [v18 setToValue:v25];

    [v18 setDuration:0.1012];
    v26 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    [v18 setTimingFunction:v26];

    [v18 setFillMode:*MEMORY[0x1E4F39FA8]];
    v27 = [MEMORY[0x1E4F39B38] animation];
    [v27 setDuration:0.6679];
    v32[0] = v6;
    v32[1] = v18;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    [v27 setAnimations:v28];

    [v27 setDelegate:self];
    [(STUIStatusBarLockView *)self setCompletionBlock:v4];
    v29 = [(STUIStatusBarLockView *)self layer];
    [v29 addAnimation:v27 forKey:@"jiggle"];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = _Block_copy(self->_completionBlock);
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = 0;

  v7 = v8;
  if (v8)
  {
    (*((void (**)(void *, BOOL))v8 + 2))(v8, v4);
    v7 = v8;
  }
}

- (STUIStatusBarImageView)bodyView
{
  return self->_bodyView;
}

- (void)setBodyView:(id)a3
{
}

- (STUIStatusBarImageView)shackleView
{
  return self->_shackleView;
}

- (void)setShackleView:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_shackleView, 0);
  objc_storeStrong((id *)&self->_bodyView, 0);
}

@end