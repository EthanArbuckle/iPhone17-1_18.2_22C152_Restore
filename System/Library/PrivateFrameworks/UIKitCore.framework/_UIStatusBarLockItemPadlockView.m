@interface _UIStatusBarLockItemPadlockView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIImageView)bodyView;
- (UIImageView)shackleView;
- (UIStatusBarLockItemView)owner;
- (_UIStatusBarLockItemPadlockView)initWithFrame:(CGRect)a3 owner:(id)a4;
- (id)completionBlock;
- (void)animateUnlockCompletionBlock:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)jiggleCompletionBlock:(id)a3;
- (void)reset;
- (void)setBodyView:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setOwner:(id)a3;
- (void)setShackleView:(id)a3;
@end

@implementation _UIStatusBarLockItemPadlockView

- (_UIStatusBarLockItemPadlockView)initWithFrame:(CGRect)a3 owner:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v9)
    {
      v23 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v23, OS_LOG_TYPE_FAULT, "owner must not be nil.", buf, 2u);
      }
    }
  }
  else if (!v9)
  {
    v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &initWithFrame_owner____s_category) + 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "owner must not be nil.", buf, 2u);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)_UIStatusBarLockItemPadlockView;
  v10 = -[UIView initWithFrame:](&v25, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_owner, v9);
    v12 = [v9 imageWithShadowNamed:@"LockShackle"];
    v13 = [v12 image];

    if ([v9 _shouldReverseLayoutDirection])
    {
      uint64_t v14 = [v13 imageWithHorizontallyFlippedOrientation];

      v13 = (void *)v14;
    }
    v15 = [[UIImageView alloc] initWithImage:v13];
    shackleView = v11->_shackleView;
    v11->_shackleView = v15;

    -[UIImageView setFrame:](v11->_shackleView, "setFrame:", 1.0, 2.0, 6.0, 7.0);
    [(UIView *)v11 addSubview:v11->_shackleView];
    v17 = [v9 imageWithShadowNamed:@"LockBody"];
    v18 = [v17 image];

    if ([v9 _shouldReverseLayoutDirection])
    {
      uint64_t v19 = [v18 imageWithHorizontallyFlippedOrientation];

      v18 = (void *)v19;
    }
    v20 = [[UIImageView alloc] initWithImage:v18];
    bodyView = v11->_bodyView;
    v11->_bodyView = v20;

    -[UIImageView setFrame:](v11->_bodyView, "setFrame:", 0.0, 6.0, 8.0, 6.0);
    [(UIView *)v11 addSubview:v11->_bodyView];
  }
  return v11;
}

- (void)reset
{
  [(UIView *)self setAlpha:1.0];
  shackleView = self->_shackleView;
  -[UIImageView setFrame:](shackleView, "setFrame:", 1.0, 2.0, 6.0, 7.0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 8.0;
  double v4 = 12.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)animateUnlockCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_completionBlock)
  {
    if (v4) {
      dispatch_async(MEMORY[0x1E4F14428], v4);
    }
  }
  else
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &animateUnlockCompletionBlock____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      uint64_t v19 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1853B0000, v19, OS_LOG_TYPE_ERROR, "Unlocking lock icon", v20, 2u);
      }
    }
    v7 = _Block_copy(v5);
    id completionBlock = self->_completionBlock;
    self->_id completionBlock = v7;

    -[UIImageView setFrame:](self->_shackleView, "setFrame:", 1.0, 0.0, 6.0, 7.0);
    id v9 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
    setDefaultLockAnimationParameters(v9);
    LODWORD(v10) = 1066192077;
    [v9 setSpeed:v10];
    v11 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", centerOfRect(1.0, 2.0, 6.0, 7.0));
    [v9 setFromValue:v11];

    v12 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", centerOfRect(1.0, 0.0, 6.0, 7.0));
    [v9 setToValue:v12];

    uint64_t v13 = *MEMORY[0x1E4F39FA0];
    [v9 setFillMode:*MEMORY[0x1E4F39FA0]];
    -[UIImageView setFrame:](self->_shackleView, "setFrame:", 1.0, 0.0, 6.0, 7.0);
    uint64_t v14 = [(UIView *)self->_shackleView layer];
    [v14 addAnimation:v9 forKey:@"unlock"];

    v15 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"opacity"];
    setDefaultLockAnimationParameters(v15);
    LODWORD(v16) = 1066192077;
    [v15 setSpeed:v16];
    [v15 setFromValue:&unk_1ED3F2368];
    [v15 setToValue:&unk_1ED3F2378];
    [v15 setFillMode:v13];
    [v15 setBeginTime:CACurrentMediaTime() + 1.35454545];
    v17 = +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:self];
    [v15 setDelegate:v17];

    v18 = [(UIView *)self layer];
    [v18 addAnimation:v15 forKey:@"fadeOut"];

    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(UIView *)self setAlpha:0.0];
    [MEMORY[0x1E4F39CF8] setDisableActions:0];
  }
}

- (void)jiggleCompletionBlock:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(UIView *)self layer];
  if (self->_completionBlock)
  {
    if (v4) {
      dispatch_async(MEMORY[0x1E4F14428], v4);
    }
  }
  else
  {
    unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("StatusBar", &jiggleCompletionBlock____s_category);
    if (*(unsigned char *)CategoryCachedImpl)
    {
      v32 = *(NSObject **)(CategoryCachedImpl + 8);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_ERROR, "Jiggling lock icon", buf, 2u);
      }
    }
    v7 = [MEMORY[0x1E4F39C90] animationWithKeyPath:@"position"];
    v8 = (void *)MEMORY[0x1E4F29238];
    [v5 position];
    id v9 = objc_msgSend(v8, "valueWithCGPoint:");
    [v7 setFromValue:v9];

    double v10 = (void *)MEMORY[0x1E4F29238];
    [v5 position];
    double v12 = v11 + -20.0;
    [v5 position];
    uint64_t v13 = [v10 valueWithCGPoint:v12];
    [v7 setToValue:v13];

    [v7 setMass:1.2];
    [v7 setStiffness:1200.0];
    [v7 setDamping:12.0];
    [v7 setDuration:0.6679];
    LODWORD(v14) = 1028404955;
    LODWORD(v15) = 990250344;
    LODWORD(v16) = 1059713387;
    LODWORD(v17) = 1.0;
    v18 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v14 :v15 :v16 :v17];
    [v7 setTimingFunction:v18];
    uint64_t v19 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"transform"];
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v38 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v39 = v20;
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v40 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v41 = v21;
    long long v22 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    *(_OWORD *)buf = *MEMORY[0x1E4F39B10];
    long long v35 = v22;
    long long v23 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v36 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v37 = v23;
    v24 = [MEMORY[0x1E4F29238] valueWithCATransform3D:buf];
    [v19 setFromValue:v24];

    objc_super v25 = (void *)MEMORY[0x1E4F29238];
    CATransform3DMakeTranslation(&v33, 20.0, 0.0, 0.0);
    v26 = [v25 valueWithCATransform3D:&v33];
    [v19 setToValue:v26];

    [v19 setDuration:0.1012];
    v27 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    [v19 setTimingFunction:v27];

    [v19 setFillMode:*MEMORY[0x1E4F39FA8]];
    v28 = [MEMORY[0x1E4F39B38] animation];
    [v28 setDuration:0.6679];
    v42[0] = v7;
    v42[1] = v19;
    v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:2];
    [v28 setAnimations:v29];

    v30 = +[_UIViewWeakCAAnimationDelegate weakAnimationDelegate:self];
    [v28 setDelegate:v30];

    [(_UIStatusBarLockItemPadlockView *)self setCompletionBlock:v4];
    v31 = [(UIView *)self layer];
    [v31 addAnimation:v28 forKey:@"jiggle"];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  v7 = _Block_copy(self->_completionBlock);
  id completionBlock = self->_completionBlock;
  self->_id completionBlock = 0;

  v6 = v7;
  if (v7)
  {
    (*((void (**)(void *))v7 + 2))(v7);
    v6 = v7;
  }
}

- (UIImageView)bodyView
{
  return self->_bodyView;
}

- (void)setBodyView:(id)a3
{
}

- (UIImageView)shackleView
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

- (UIStatusBarLockItemView)owner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  return (UIStatusBarLockItemView *)WeakRetained;
}

- (void)setOwner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_shackleView, 0);
  objc_storeStrong((id *)&self->_bodyView, 0);
}

@end