@interface SUUISlideshowAnimator
- (UIImageView)imageView;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation SUUISlideshowAnimator

- (double)transitionDuration:(id)a3
{
  return 0.400000006;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewControllerForKey:*MEMORY[0x263F83C00]];
  v6 = [v4 viewControllerForKey:*MEMORY[0x263F83C10]];
  v7 = [v6 view];
  v8 = [v5 view];
  v9 = [v4 containerView];
  [v4 finalFrameForViewController:v6];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [v7 setAlpha:0.0];
  objc_msgSend(v7, "setFrame:", v11, v13, v15, v17);
  [v9 insertSubview:v7 aboveSubview:v8];
  v18 = objc_msgSend(objc_alloc(MEMORY[0x263F82EB8]), "initWithFrame:privateStyle:", 2020, v11, v13, v15, v17);
  [v18 setAlpha:0.0];
  [v18 setAutoresizingMask:18];
  [v9 addSubview:v18];
  imageView = self->_imageView;
  [(UIImageView *)imageView frame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v28 = [(UIImageView *)self->_imageView superview];
  objc_msgSend(v9, "convertRect:fromView:", v28, v21, v23, v25, v27);
  -[UIImageView setFrame:](imageView, "setFrame:");

  [v9 addSubview:self->_imageView];
  v29 = (void *)MEMORY[0x263F82E00];
  [(SUUISlideshowAnimator *)self transitionDuration:v4];
  double v31 = v30;
  v44[0] = MEMORY[0x263EF8330];
  v44[1] = 3221225472;
  v44[2] = __43__SUUISlideshowAnimator_animateTransition___block_invoke;
  v44[3] = &unk_265403B48;
  id v45 = v18;
  v46 = self;
  double v47 = v11;
  double v48 = v13;
  double v49 = v15;
  double v50 = v17;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __43__SUUISlideshowAnimator_animateTransition___block_invoke_2;
  v35[3] = &unk_265403B70;
  double v40 = v11;
  double v41 = v13;
  double v42 = v15;
  double v43 = v17;
  id v36 = v7;
  v37 = self;
  id v38 = v45;
  id v39 = v4;
  id v32 = v4;
  id v33 = v45;
  id v34 = v7;
  [v29 animateWithDuration:v44 animations:v35 completion:v31];
}

uint64_t __43__SUUISlideshowAnimator_animateTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 40) + 8);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);
  return objc_msgSend(v2, "setFrame:", v3, v4, v5, v6);
}

uint64_t __43__SUUISlideshowAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  [*(id *)(*(void *)(a1 + 40) + 8) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  [*(id *)(a1 + 48) removeFromSuperview];
  double v4 = *(void **)(a1 + 56);
  return [v4 completeTransition:1];
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end