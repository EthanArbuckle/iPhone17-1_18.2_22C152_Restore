@interface SKUISlideshowAnimator
- (UIImageView)imageView;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setImageView:(id)a3;
@end

@implementation SKUISlideshowAnimator

- (double)transitionDuration:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUISlideshowAnimator transitionDuration:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 0.400000006;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUISlideshowAnimator animateTransition:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  v14 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  v15 = [v14 view];
  v16 = [v13 view];
  v17 = [v4 containerView];
  [v4 finalFrameForViewController:v14];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [v15 setAlpha:0.0];
  objc_msgSend(v15, "setFrame:", v19, v21, v23, v25);
  [v17 insertSubview:v15 aboveSubview:v16];
  v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1FE0]), "initWithFrame:privateStyle:", 2020, v19, v21, v23, v25);
  [v26 setAlpha:0.0];
  [v26 setAutoresizingMask:18];
  [v17 addSubview:v26];
  imageView = self->_imageView;
  [(UIImageView *)imageView frame];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  v36 = [(UIImageView *)self->_imageView superview];
  objc_msgSend(v17, "convertRect:fromView:", v36, v29, v31, v33, v35);
  -[UIImageView setFrame:](imageView, "setFrame:");

  [v17 addSubview:self->_imageView];
  v37 = (void *)MEMORY[0x1E4FB1EB0];
  [(SKUISlideshowAnimator *)self transitionDuration:v4];
  double v39 = v38;
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __43__SKUISlideshowAnimator_animateTransition___block_invoke;
  v52[3] = &unk_1E6427D90;
  id v53 = v26;
  v54 = self;
  double v55 = v19;
  double v56 = v21;
  double v57 = v23;
  double v58 = v25;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __43__SKUISlideshowAnimator_animateTransition___block_invoke_2;
  v43[3] = &unk_1E6429A38;
  double v48 = v19;
  double v49 = v21;
  double v50 = v23;
  double v51 = v25;
  id v44 = v15;
  v45 = self;
  id v46 = v53;
  id v47 = v4;
  id v40 = v4;
  id v41 = v53;
  id v42 = v15;
  [v37 animateWithDuration:v52 animations:v43 completion:v39];
}

uint64_t __43__SKUISlideshowAnimator_animateTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 40) + 8);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);

  return objc_msgSend(v2, "setFrame:", v3, v4, v5, v6);
}

uint64_t __43__SKUISlideshowAnimator_animateTransition___block_invoke_2(uint64_t a1)
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

- (void)transitionDuration:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)animateTransition:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end