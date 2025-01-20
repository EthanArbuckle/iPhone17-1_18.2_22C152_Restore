@interface SKUISlideshowDismissalAnimator
- (CGRect)imageRect;
- (UIImageView)imageView;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setImageRect:(CGRect)a3;
- (void)setImageView:(id)a3;
@end

@implementation SKUISlideshowDismissalAnimator

- (double)transitionDuration:(id)a3
{
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v3 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v3) {
        -[SKUISlideshowDismissalAnimator transitionDuration:](v3, v4, v5, v6, v7, v8, v9, v10);
      }
    }
  }
  return 0.25;
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
        -[SKUISlideshowDismissalAnimator animateTransition:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v13 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  v14 = [v4 viewControllerForKey:*MEMORY[0x1E4FB30C8]];
  v15 = [v14 view];
  v16 = [v13 view];
  v17 = [v4 containerView];
  [v4 finalFrameForViewController:v14];
  objc_msgSend(v15, "setFrame:");
  [v16 frame];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  [(UIImageView *)self->_imageView frame];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [(UIImageView *)self->_imageView superview];
  objc_msgSend(v17, "convertRect:fromView:", v34, v27, v29, v31, v33);
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;

  [v16 setAlpha:0.0];
  v43 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1FE0]), "initWithFrame:privateStyle:", 2020, v19, v21, v23, v25);
  [v43 setAlpha:1.0];
  [v43 setAutoresizingMask:18];
  [v17 addSubview:v43];
  -[UIImageView setFrame:](self->_imageView, "setFrame:", self->_imageRect.origin.x, self->_imageRect.origin.y, self->_imageRect.size.width, self->_imageRect.size.height);
  [v17 addSubview:self->_imageView];
  v44 = (void *)MEMORY[0x1E4FB1EB0];
  [(SKUISlideshowDismissalAnimator *)self transitionDuration:v4];
  double v46 = v45;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __52__SKUISlideshowDismissalAnimator_animateTransition___block_invoke;
  v54[3] = &unk_1E6427D90;
  id v55 = v43;
  v56 = self;
  uint64_t v57 = v36;
  uint64_t v58 = v38;
  uint64_t v59 = v40;
  uint64_t v60 = v42;
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __52__SKUISlideshowDismissalAnimator_animateTransition___block_invoke_2;
  v50[3] = &unk_1E6425E78;
  v50[4] = self;
  id v51 = v55;
  id v52 = v16;
  id v53 = v4;
  id v47 = v4;
  id v48 = v16;
  id v49 = v55;
  [v44 animateWithDuration:v54 animations:v50 completion:v46];
}

uint64_t __52__SKUISlideshowDismissalAnimator_animateTransition___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(*(void *)(a1 + 40) + 8);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 72);

  return objc_msgSend(v2, "setFrame:", v3, v4, v5, v6);
}

uint64_t __52__SKUISlideshowDismissalAnimator_animateTransition___block_invoke_2(uint64_t a1)
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

- (void)transitionDuration:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)animateTransition:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end