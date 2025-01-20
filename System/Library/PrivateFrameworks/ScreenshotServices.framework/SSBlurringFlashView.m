@interface SSBlurringFlashView
+ (double)expectedAnimationDurationForStyle:(unint64_t)a3;
- (SSBlurringFlashView)initWithFrame:(CGRect)a3;
- (double)_cornerRadius;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_blurViewRadiusAnimatorCompleted;
- (void)_runCompletionBlockIfAppropriate;
- (void)_setCornerRadius:(double)a3;
- (void)_superColorViewBackgroundColorAnimatorCompleted;
- (void)flashWithCompletion:(id)a3;
- (void)layoutSubviews;
@end

@implementation SSBlurringFlashView

- (SSBlurringFlashView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SSBlurringFlashView;
  v3 = -[SSFlashView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc_init(SSBlurView);
  blurView = v3->_blurView;
  v3->_blurView = v4;

  [(SSBlurView *)v3->_blurView setBlurRadius:120.0];
  [(SSBlurView *)v3->_blurView setScale:0.125];
  [(SSBlurringFlashView *)v3 addSubview:v3->_blurView];
  v6 = objc_alloc_init(_SSSFlashSuperColorView);
  superColorView = v3->_superColorView;
  v3->_superColorView = v6;

  [(SSBlurringFlashView *)v3 addSubview:v3->_superColorView];
  [(SSBlurView *)v3->_blurView setHidden:1];
  [(_SSSFlashSuperColorView *)v3->_superColorView setHidden:1];
  [(SSBlurringFlashView *)v3 setNeedsLayout];
  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SSBlurringFlashView;
  [(SSBlurringFlashView *)&v5 layoutSubviews];
  blurView = self->_blurView;
  [(SSBlurringFlashView *)self bounds];
  -[SSBlurView setFrame:](blurView, "setFrame:");
  superColorView = self->_superColorView;
  [(SSBlurringFlashView *)self bounds];
  -[_SSSFlashSuperColorView setFrame:](superColorView, "setFrame:");
  [(_SSSFlashSuperColorView *)self->_superColorView setStyle:[(SSFlashView *)self style]];
}

+ (double)expectedAnimationDurationForStyle:(unint64_t)a3
{
  return dbl_21ED09050[a3 == 2];
}

- (void)flashWithCompletion:(id)a3
{
  id v4 = a3;
  completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2]();
    id v6 = self->_completionBlock;
    self->_completionBlock = 0;
  }
  self->_superColorViewBackgroundColorAnimatorCompleted = 0;
  self->_blurViewRadiusAnimatorCompleted = 0;
  v7 = (void *)[v4 copy];
  id v8 = self->_completionBlock;
  self->_completionBlock = v7;

  objc_super v9 = objc_msgSend(objc_alloc(MEMORY[0x263F1C5A0]), "initWithControlPoint1:controlPoint2:", 0.25, 0.100000001, 0.25, 1.0);
  [v9 controlPoint1];
  double v11 = v10;
  [v9 controlPoint2];
  v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1C5A0]), "initWithControlPoint1:controlPoint2:", 0.1, v11, 0.0, v12);
  v14 = self;
  [(SSBlurView *)v14->_blurView setHidden:0];
  [(_SSSFlashSuperColorView *)v14->_superColorView setHidden:0];
  uint64_t v15 = [(SSFlashView *)v14 style];
  id v16 = objc_alloc(MEMORY[0x263F1CB78]);
  double v17 = 2.0;
  if (v15 == 2)
  {
    double v17 = 1.5;
    double v18 = 0.5;
  }
  else
  {
    double v18 = 1.6;
  }
  uint64_t v19 = [v16 initWithDuration:v13 timingParameters:v17];
  superColorViewOpacityAnimator = v14->_superColorViewOpacityAnimator;
  v14->_superColorViewOpacityAnimator = (UIViewPropertyAnimator *)v19;

  v21 = v14->_superColorViewOpacityAnimator;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __43__SSBlurringFlashView_flashWithCompletion___block_invoke;
  v35[3] = &unk_2644EDB30;
  v35[4] = v14;
  [(UIViewPropertyAnimator *)v21 addAnimations:v35];
  uint64_t v22 = [objc_alloc(MEMORY[0x263F1CB78]) initWithDuration:v9 timingParameters:v18];
  blurViewRadiusAnimator = v14->_blurViewRadiusAnimator;
  v14->_blurViewRadiusAnimator = (UIViewPropertyAnimator *)v22;

  v24 = v14->_blurViewRadiusAnimator;
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __43__SSBlurringFlashView_flashWithCompletion___block_invoke_2;
  v34[3] = &unk_2644EDB30;
  v34[4] = v14;
  [(UIViewPropertyAnimator *)v24 addAnimations:v34];
  v25 = v14->_blurViewRadiusAnimator;
  v33[0] = MEMORY[0x263EF8330];
  v33[1] = 3221225472;
  v33[2] = __43__SSBlurringFlashView_flashWithCompletion___block_invoke_3;
  v33[3] = &unk_2644EDB30;
  v33[4] = v14;
  [(UIViewPropertyAnimator *)v25 addAnimations:v33];
  objc_initWeak(&location, v14);
  v26 = v14->_blurViewRadiusAnimator;
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __43__SSBlurringFlashView_flashWithCompletion___block_invoke_4;
  v30[3] = &unk_2644EDCD8;
  objc_copyWeak(&v31, &location);
  [(UIViewPropertyAnimator *)v26 addCompletion:v30];
  v27 = v14->_superColorViewOpacityAnimator;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __43__SSBlurringFlashView_flashWithCompletion___block_invoke_5;
  v28[3] = &unk_2644EDCD8;
  objc_copyWeak(&v29, &location);
  [(UIViewPropertyAnimator *)v27 addCompletion:v28];
  [(UIViewPropertyAnimator *)v14->_superColorViewOpacityAnimator startAnimationAfterDelay:0.1];
  [(UIViewPropertyAnimator *)v14->_blurViewRadiusAnimator startAnimationAfterDelay:0.0];
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

uint64_t __43__SSBlurringFlashView_flashWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.0];
}

uint64_t __43__SSBlurringFlashView_flashWithCompletion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setBlurRadius:0.0];
}

uint64_t __43__SSBlurringFlashView_flashWithCompletion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setScale:1.0];
}

void __43__SSBlurringFlashView_flashWithCompletion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _blurViewRadiusAnimatorCompleted];
}

void __43__SSBlurringFlashView_flashWithCompletion___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _superColorViewBackgroundColorAnimatorCompleted];
}

- (void)_blurViewRadiusAnimatorCompleted
{
  self->_blurViewRadiusAnimatorCompleted = 1;
  [(SSBlurringFlashView *)self _runCompletionBlockIfAppropriate];
}

- (void)_superColorViewBackgroundColorAnimatorCompleted
{
  self->_superColorViewBackgroundColorAnimatorCompleted = 1;
  [(SSBlurringFlashView *)self _runCompletionBlockIfAppropriate];
}

- (void)_runCompletionBlockIfAppropriate
{
  if (self->_superColorViewBackgroundColorAnimatorCompleted && self->_blurViewRadiusAnimatorCompleted)
  {
    completionBlock = (void (**)(id, SEL))self->_completionBlock;
    if (completionBlock)
    {
      completionBlock[2](completionBlock, a2);
      id v4 = self->_completionBlock;
      self->_completionBlock = 0;
    }
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)_setCornerRadius:(double)a3
{
  -[SSBlurView _setCornerRadius:](self->_blurView, "_setCornerRadius:");
  superColorView = self->_superColorView;
  [(_SSSFlashSuperColorView *)superColorView _setCornerRadius:a3];
}

- (double)_cornerRadius
{
  [(SSBlurView *)self->_blurView _cornerRadius];
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurViewRadiusAnimator, 0);
  objc_storeStrong((id *)&self->_superColorViewOpacityAnimator, 0);
  objc_storeStrong((id *)&self->_superColorView, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end