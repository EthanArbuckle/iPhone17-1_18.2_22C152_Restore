@interface _TVProductTemplateZoomAnimator
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
@end

@implementation _TVProductTemplateZoomAnimator

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v3 = a3;
  v4 = [v3 containerView];
  v5 = [v3 viewControllerForKey:*MEMORY[0x263F1D7B0]];
  v6 = [v3 viewControllerForKey:*MEMORY[0x263F1D7A0]];
  v7 = [v5 view];
  [v4 bounds];
  objc_msgSend(v7, "setFrame:");
  [v7 setAlpha:0.0];
  CGAffineTransformMakeScale(&v39, 1.5, 1.5);
  [v7 setTransform:&v39];
  v8 = [v7 layer];
  [v8 setShouldRasterize:1];

  v9 = [v7 layer];
  v10 = [MEMORY[0x263F1C920] mainScreen];
  [v10 scale];
  if (v11 <= 1.0) {
    double v12 = 1.0;
  }
  else {
    double v12 = 1.5;
  }
  [v9 setRasterizationScale:v12];

  v13 = [v6 view];
  v14 = [v13 layer];
  [v14 setShouldRasterize:1];

  v15 = [v13 layer];
  [v15 setRasterizationScale:1.0];

  [v4 insertSubview:v7 aboveSubview:v13];
  objc_initWeak(&location, v3);
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __52___TVProductTemplateZoomAnimator_animateTransition___block_invoke;
  v34[3] = &unk_264BA8890;
  id v16 = v7;
  id v35 = v16;
  id v17 = v13;
  id v36 = v17;
  objc_copyWeak(&v37, &location);
  v18 = (void *)MEMORY[0x230FC9DC0](v34);
  v19 = (void *)MEMORY[0x263F1CB60];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __52___TVProductTemplateZoomAnimator_animateTransition___block_invoke_2;
  v31[3] = &unk_264BA64A0;
  id v20 = v17;
  id v32 = v20;
  id v21 = v16;
  id v33 = v21;
  [v19 animateWithDuration:0 delay:v31 options:0 animations:0.33 completion:0.0];
  v22 = (void *)MEMORY[0x263F1CB60];
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __52___TVProductTemplateZoomAnimator_animateTransition___block_invoke_3;
  v28[3] = &unk_264BA64A0;
  id v23 = v21;
  id v29 = v23;
  id v24 = v20;
  id v30 = v24;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __52___TVProductTemplateZoomAnimator_animateTransition___block_invoke_4;
  v26[3] = &unk_264BA70C0;
  id v25 = v18;
  id v27 = v25;
  [v22 animateWithDuration:4 delay:v28 options:v26 animations:0.5 completion:0.0];

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

@end