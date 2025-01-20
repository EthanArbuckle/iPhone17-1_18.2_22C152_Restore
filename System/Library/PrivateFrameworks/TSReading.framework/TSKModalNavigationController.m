@interface TSKModalNavigationController
- (BOOL)isFullscreenViewController;
- (BOOL)showTopSeparator;
- (TSKModalNavigationController)initWithRootViewController:(id)a3;
- (int64_t)positionForBar:(id)a3;
- (void)dealloc;
- (void)layoutViews;
- (void)p_statusBarWillChange:(id)a3;
- (void)setIsFullscreenViewController:(BOOL)a3;
- (void)setShowTopSeparator:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TSKModalNavigationController

- (TSKModalNavigationController)initWithRootViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)TSKModalNavigationController;
  v3 = [(TSKModalNavigationController *)&v6 initWithRootViewController:a3];
  if (v3)
  {
    v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v3 selector:sel_p_statusBarWillChange_ name:*MEMORY[0x263F1D0C0] object:0];
    v3->mIsFullscreenViewController = 1;
  }
  return v3;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  [(UIView *)self->mTopSeparator removeFromSuperview];

  v3.receiver = self;
  v3.super_class = (Class)TSKModalNavigationController;
  [(TSKModalNavigationController *)&v3 dealloc];
}

- (void)setShowTopSeparator:(BOOL)a3
{
  if (self->mShowTopSeparator != a3)
  {
    self->mShowTopSeparator = a3;
    if ([(TSKModalNavigationController *)self isViewLoaded])
    {
      [(TSKModalNavigationController *)self layoutViews];
    }
  }
}

- (void)p_statusBarWillChange:(id)a3
{
  if (TSUPhoneUI())
  {
    if (self->mIsFullscreenViewController)
    {
      v4 = (void *)MEMORY[0x263F08D40];
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication"), "keyWindow"), "windowScene"), "statusBarManager"), "statusBarFrame");
      v5 = objc_msgSend(v4, "valueWithCGRect:");
      if (v5)
      {
        [v5 CGRectValue];
        if (v6 >= v7) {
          double v8 = v7;
        }
        else {
          double v8 = v6;
        }
        v9 = (void *)[(TSKModalNavigationController *)self navigationBar];
        [v9 frame];
        v13[0] = MEMORY[0x263EF8330];
        v13[1] = 3221225472;
        v13[2] = __54__TSKModalNavigationController_p_statusBarWillChange___block_invoke;
        v13[3] = &unk_2646B0A58;
        v13[6] = v10;
        *(double *)&v13[7] = v8;
        v13[8] = v11;
        v13[9] = v12;
        v13[4] = v9;
        v13[5] = self;
        [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v13 options:0 animations:0.35 completion:0.0];
      }
    }
  }
}

uint64_t __54__TSKModalNavigationController_p_statusBarWillChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "view"), "setNeedsLayout");
  v2 = (void *)[*(id *)(a1 + 40) view];

  return [v2 layoutIfNeeded];
}

- (void)layoutViews
{
  BOOL v3 = [(TSKModalNavigationController *)self showTopSeparator];
  mTopSeparator = self->mTopSeparator;
  if (v3)
  {
    if (!mTopSeparator)
    {
      v5 = (void *)[(TSKModalNavigationController *)self navigationBar];
      [v5 bounds];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      self->mTopSeparator = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v6, v8, v10, 1.0);
      TSUScreenScale();
      v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", v7, v9, v11, 1.0 / v12);
      objc_msgSend(v13, "setBackgroundColor:", objc_msgSend(MEMORY[0x263F1C550], "colorWithWhite:alpha:", 0.78, 1.0));
      [v13 setUserInteractionEnabled:0];
      [v13 setAutoresizingMask:2];
      [(UIView *)self->mTopSeparator addSubview:v13];

      [(UIView *)self->mTopSeparator setUserInteractionEnabled:0];
      [(UIView *)self->mTopSeparator setAutoresizingMask:34];
      v14 = self->mTopSeparator;
      [v5 addSubview:v14];
    }
  }
  else if (mTopSeparator)
  {
    [(UIView *)mTopSeparator removeFromSuperview];

    self->mTopSeparator = 0;
  }
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)TSKModalNavigationController;
  [(TSKModalNavigationController *)&v3 viewDidLoad];
  [(TSKModalNavigationController *)self layoutViews];
}

- (int64_t)positionForBar:(id)a3
{
  if (self->mIsFullscreenViewController) {
    return 3;
  }
  else {
    return 2;
  }
}

- (BOOL)showTopSeparator
{
  return self->mShowTopSeparator;
}

- (BOOL)isFullscreenViewController
{
  return self->mIsFullscreenViewController;
}

- (void)setIsFullscreenViewController:(BOOL)a3
{
  self->mIsFullscreenViewController = a3;
}

@end