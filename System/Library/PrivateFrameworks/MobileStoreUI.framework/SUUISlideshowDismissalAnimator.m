@interface SUUISlideshowDismissalAnimator
- (CGRect)imageRect;
- (UIImageView)imageView;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setImageRect:(CGRect)a3;
- (void)setImageView:(id)a3;
@end

@implementation SUUISlideshowDismissalAnimator

- (double)transitionDuration:(id)a3
{
  return 0.25;
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
  objc_msgSend(v7, "setFrame:");
  [v8 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  [(UIImageView *)self->_imageView frame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v26 = [(UIImageView *)self->_imageView superview];
  objc_msgSend(v9, "convertRect:fromView:", v26, v19, v21, v23, v25);
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  uint64_t v34 = v33;

  [v8 setAlpha:0.0];
  v35 = objc_msgSend(objc_alloc(MEMORY[0x263F82EB8]), "initWithFrame:privateStyle:", 2020, v11, v13, v15, v17);
  [v35 setAlpha:1.0];
  [v35 setAutoresizingMask:18];
  [v9 addSubview:v35];
  -[UIImageView setFrame:](self->_imageView, "setFrame:", self->_imageRect.origin.x, self->_imageRect.origin.y, self->_imageRect.size.width, self->_imageRect.size.height);
  [v9 addSubview:self->_imageView];
  v36 = (void *)MEMORY[0x263F82E00];
  [(SUUISlideshowDismissalAnimator *)self transitionDuration:v4];
  double v38 = v37;
  v46[0] = MEMORY[0x263EF8330];
  v46[1] = 3221225472;
  v46[2] = __52__SUUISlideshowDismissalAnimator_animateTransition___block_invoke;
  v46[3] = &unk_265403B48;
  id v47 = v35;
  v48 = self;
  uint64_t v49 = v28;
  uint64_t v50 = v30;
  uint64_t v51 = v32;
  uint64_t v52 = v34;
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __52__SUUISlideshowDismissalAnimator_animateTransition___block_invoke_2;
  v42[3] = &unk_2654037C8;
  v42[4] = self;
  id v43 = v47;
  id v44 = v8;
  id v45 = v4;
  id v39 = v4;
  id v40 = v8;
  id v41 = v47;
  [v36 animateWithDuration:v46 animations:v42 completion:v38];
}

uint64_t __52__SUUISlideshowDismissalAnimator_animateTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(*(void *)(a1 + 40) + 8);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);
  return objc_msgSend(v2, "setFrame:", v3, v4, v5, v6);
}

uint64_t __52__SUUISlideshowDismissalAnimator_animateTransition___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;

  [*(id *)(a1 + 40) removeFromSuperview];
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

- (CGRect)imageRect
{
  double x = self->_imageRect.origin.x;
  double y = self->_imageRect.origin.y;
  double width = self->_imageRect.size.width;
  double height = self->_imageRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setImageRect:(CGRect)a3
{
  self->_imageRect = a3;
}

- (void).cxx_destruct
{
}

@end