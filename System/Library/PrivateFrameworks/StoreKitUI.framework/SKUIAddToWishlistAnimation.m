@interface SKUIAddToWishlistAnimation
- (SKUIAddToWishlistAnimation)initWithImage:(id)a3 buttonItem:(id)a4 navigationBar:(id)a5;
- (void)animateWithCompletionBlock:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
@end

@implementation SKUIAddToWishlistAnimation

- (SKUIAddToWishlistAnimation)initWithImage:(id)a3 buttonItem:(id)a4 navigationBar:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIAddToWishlistAnimation initWithImage:buttonItem:navigationBar:]();
  }
  v32.receiver = self;
  v32.super_class = (Class)SKUIAddToWishlistAnimation;
  v12 = [(SKUIAddToWishlistAnimation *)&v32 init];
  v13 = v12;
  if (v12)
  {
    id v27 = v9;
    objc_storeStrong((id *)&v12->_image, a3);
    v14 = [v10 image];
    v15 = [v10 title];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v26 = v11;
    v16 = [v11 _allViews];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v29;
      v25 = v13;
      while (2)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v29 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v22 = [v21 imageForState:0];
            v23 = [v21 titleForState:0];
            if (v22 == v14)
            {
              v22 = v14;
LABEL_19:
              v13 = v25;
              objc_storeStrong((id *)&v25->_targetButton, v21);

              goto LABEL_20;
            }
            if ([v15 isEqualToString:v23]) {
              goto LABEL_19;
            }
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v28 objects:v33 count:16];
        v13 = v25;
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_20:

    if (!v13->_targetButton)
    {

      v13 = 0;
    }
    id v9 = v27;
    id v11 = v26;
  }
  return v13;
}

- (void)animateWithCompletionBlock:(id)a3
{
  v64[3] = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F39CF8];
  id v5 = a3;
  [v4 begin];
  v6 = (void *)[v5 copy];

  id completionBlock = self->_completionBlock;
  self->_id completionBlock = v6;

  v8 = self;
  id v9 = (void *)__AddToWishlistAnimations;
  if (!__AddToWishlistAnimations)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v11 = (void *)__AddToWishlistAnimations;
    __AddToWishlistAnimations = (uint64_t)v10;

    id v9 = (void *)__AddToWishlistAnimations;
  }
  [v9 addObject:v8];

  v12 = [(UINavigationButton *)v8->_targetButton window];
  targetButton = v8->_targetButton;
  [(UINavigationButton *)targetButton bounds];
  -[UINavigationButton convertRect:toView:](targetButton, "convertRect:toView:", v12);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v8->_image];
  [v22 frame];
  float v24 = (v19 - v23) * 0.5;
  float v26 = (v21 - v25) * 0.5;
  objc_msgSend(v22, "setFrame:", v15 + floorf(v24), v17 + floorf(v26));
  [v12 addSubview:v22];
  id v27 = (void *)MEMORY[0x1E4FB1EB0];
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __57__SKUIAddToWishlistAnimation_animateWithCompletionBlock___block_invoke;
  v61[3] = &unk_1E6422020;
  id v62 = v22;
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __57__SKUIAddToWishlistAnimation_animateWithCompletionBlock___block_invoke_2;
  v59[3] = &unk_1E64223D0;
  id v60 = v62;
  id v28 = v62;
  [v27 animateWithDuration:0x20000 delay:v61 options:v59 animations:0.4 completion:0.0];
  long long v29 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform"];
  [v29 setBeginTime:CACurrentMediaTime() + 0.4];
  [v29 setDelegate:v8];
  [v29 setDuration:0.33];
  [v29 setFillMode:*MEMORY[0x1E4F39FA0]];
  UIAnimationDragCoefficient();
  *(float *)&double v31 = 1.0 / v30;
  [v29 setSpeed:v31];
  [v29 setKeyTimes:&unk_1F1D620C0];
  objc_super v32 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
  v64[0] = v32;
  v33 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A480]];
  v64[1] = v33;
  uint64_t v34 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  v64[2] = v34;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:3];
  [v29 setTimingFunctions:v35];

  long long v49 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  long long v55 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v48 = v55;
  long long v56 = v49;
  long long v47 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v57 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v46 = v57;
  long long v58 = v47;
  long long v45 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  long long v51 = *MEMORY[0x1E4F39B10];
  long long v44 = v51;
  long long v52 = v45;
  long long v43 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  long long v53 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  long long v42 = v53;
  long long v54 = v43;
  v36 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v51];
  v63[0] = v36;
  v37 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeScale(&v50, 1.4, 1.4, 1.0);
  v38 = [v37 valueWithCATransform3D:&v50];
  v63[1] = v38;
  long long v55 = v48;
  long long v56 = v49;
  long long v57 = v46;
  long long v58 = v47;
  long long v51 = v44;
  long long v52 = v45;
  long long v53 = v42;
  long long v54 = v43;
  v39 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v51];
  v63[2] = v39;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:3];
  [v29 setValues:v40];

  v41 = [(UINavigationButton *)v8->_targetButton layer];
  [v41 addAnimation:v29 forKey:@"WishlistPop"];

  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __57__SKUIAddToWishlistAnimation_animateWithCompletionBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 0.0, 0.0);
  return [v1 setTransform:&v3];
}

uint64_t __57__SKUIAddToWishlistAnimation_animateWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v8 = a3;
  id completionBlock = (void (**)(void))self->_completionBlock;
  if (completionBlock)
  {
    completionBlock[2]();
    id v6 = self->_completionBlock;
    self->_id completionBlock = 0;
  }
  [(id)__AddToWishlistAnimations removeObject:self];
  if (![(id)__AddToWishlistAnimations count])
  {
    v7 = (void *)__AddToWishlistAnimations;
    __AddToWishlistAnimations = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetButton, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong(&self->_completionBlock, 0);
}

- (void)initWithImage:buttonItem:navigationBar:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIAddToWishlistAnimation initWithImage:buttonItem:navigationBar:]";
}

@end