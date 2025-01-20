@interface LTUIErrorViewController
- (BOOL)_canShowWhileLocked;
- (LTUIErrorViewController)initWithError:(id)a3;
- (void)_updateBackground;
- (void)drawCloseButton;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation LTUIErrorViewController

- (LTUIErrorViewController)initWithError:(id)a3
{
  v38[3] = *MEMORY[0x263EF8340];
  v36.receiver = self;
  v36.super_class = (Class)LTUIErrorViewController;
  v3 = [(LTUIErrorViewController *)&v36 initWithNibName:0 bundle:0];
  if (v3)
  {
    v4 = [MEMORY[0x263F1C550] clearColor];
    v5 = [(LTUIErrorViewController *)v3 view];
    [v5 setBackgroundColor:v4];

    v6 = (void *)[objc_alloc(MEMORY[0x263F1CB68]) initWithNibName:0 bundle:0];
    id v7 = objc_alloc(MEMORY[0x263F1C768]);
    v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 setNumberOfLines:0];
    [v8 setTextAlignment:1];
    v9 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [v8 setTextColor:v9];

    v10 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D260]];
    [v8 setFont:v10];

    [v8 setMaximumContentSizeCategory:*MEMORY[0x263F1D168]];
    v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v34 localizedStringForKey:@"UNAVAILABLE_ERROR" value:&stru_26C917F28 table:0];
    [v8 setText:v11];

    v12 = [v6 view];
    [v12 addSubview:v8];

    v27 = (void *)MEMORY[0x263F08938];
    v31 = [v8 leadingAnchor];
    v33 = [v6 view];
    v32 = [v33 safeAreaLayoutGuide];
    v30 = [v32 leadingAnchor];
    v29 = [v31 constraintEqualToSystemSpacingAfterAnchor:v30 multiplier:1.0];
    v38[0] = v29;
    v13 = v6;
    v26 = v6;
    v28 = [v6 view];
    [v28 safeAreaLayoutGuide];
    v14 = v35 = v3;
    v15 = [v14 trailingAnchor];
    v16 = [v8 trailingAnchor];
    v17 = [v15 constraintEqualToSystemSpacingAfterAnchor:v16 multiplier:1.0];
    v38[1] = v17;
    v18 = [v8 centerYAnchor];
    v19 = [v13 view];
    v20 = [v19 centerYAnchor];
    v21 = [v18 constraintEqualToAnchor:v20];
    v38[2] = v21;
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:3];
    [v27 activateConstraints:v22];

    v3 = v35;
    v37 = v26;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
    [(LTUIErrorViewController *)v35 setViewControllers:v23];

    [(LTUIErrorViewController *)v35 _updateBackground];
    v24 = v35;
  }
  return v3;
}

- (void)_updateBackground
{
  v30[4] = *MEMORY[0x263EF8340];
  v3 = [(LTUIErrorViewController *)self viewControllers];
  v4 = [v3 firstObject];

  if (v4)
  {
    v5 = [v4 view];
    v6 = [v5 subviews];
    id v7 = [v6 firstObject];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (([(LTUIErrorViewController *)self _isInPopoverPresentation] & 1) != 0
      || (isKindOfClass & 1) != 0)
    {
      if ((isKindOfClass & 1) != 0
        && [(LTUIErrorViewController *)self _isInPopoverPresentation])
      {
        [v7 removeFromSuperview];
      }
    }
    else
    {
      v29 = [MEMORY[0x263F1C480] effectWithStyle:9];
      v9 = (void *)[objc_alloc(MEMORY[0x263F1CB98]) initWithEffect:v29];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
      v10 = [v4 view];
      [v10 insertSubview:v9 atIndex:0];

      v21 = (void *)MEMORY[0x263F08938];
      v27 = [v9 topAnchor];
      v28 = [v4 view];
      v26 = [v28 topAnchor];
      v25 = [v27 constraintEqualToAnchor:v26];
      v30[0] = v25;
      v23 = [v9 bottomAnchor];
      v24 = [v4 view];
      v22 = [v24 bottomAnchor];
      v20 = [v23 constraintEqualToAnchor:v22];
      v30[1] = v20;
      v18 = [v9 leadingAnchor];
      v19 = [v4 view];
      v11 = [v19 leadingAnchor];
      v12 = [v18 constraintEqualToAnchor:v11];
      v30[2] = v12;
      v13 = [v9 trailingAnchor];
      v14 = [v4 view];
      v15 = [v14 trailingAnchor];
      v16 = [v13 constraintEqualToAnchor:v15];
      v30[3] = v16;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:4];
      [v21 activateConstraints:v17];
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LTUIErrorViewController;
  [(LTUIErrorViewController *)&v5 viewWillAppear:a3];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__LTUIErrorViewController_viewWillAppear___block_invoke;
  v4[3] = &unk_2642FFD00;
  v4[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v4];
}

uint64_t __42__LTUIErrorViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBackground];
}

- (void)viewDidAppear:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__LTUIErrorViewController_viewDidAppear___block_invoke;
  v3[3] = &unk_2642FFD00;
  v3[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v3];
}

uint64_t __41__LTUIErrorViewController_viewDidAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) drawCloseButton];
}

- (void)drawCloseButton
{
  if ([(LTUIErrorViewController *)self _isInPopoverPresentation])
  {
    id v10 = [(LTUIErrorViewController *)self viewControllers];
    v3 = [v10 firstObject];
    v4 = [v3 navigationItem];
    [v4 setRightBarButtonItem:0];
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__LTUIErrorViewController_drawCloseButton__block_invoke;
    v11[3] = &unk_2642FFD28;
    v11[4] = self;
    objc_super v5 = [MEMORY[0x263F1C3C0] actionWithHandler:v11];
    v6 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:24 primaryAction:v5];
    id v7 = [(LTUIErrorViewController *)self viewControllers];
    v8 = [v7 firstObject];
    v9 = [v8 navigationItem];
    [v9 setRightBarButtonItem:v6];
  }
}

void __42__LTUIErrorViewController_drawCloseButton__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentingViewController];
  [v1 dismissViewControllerAnimated:1 completion:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)LTUIErrorViewController;
  -[LTUIErrorViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __78__LTUIErrorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v5[3] = &unk_2642FFD00;
  v5[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v5];
}

uint64_t __78__LTUIErrorViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) drawCloseButton];
  v2 = *(void **)(a1 + 32);

  return [v2 _updateBackground];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

@end