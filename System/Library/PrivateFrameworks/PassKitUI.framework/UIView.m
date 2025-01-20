@interface UIView
@end

@implementation UIView

uint64_t __88__UIView_PKUIAnimationUtilities__pkui_setFrame_withAdditiveAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __89__UIView_PKUIAnimationUtilities__pkui_setBounds_withAdditiveAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __91__UIView_PKUIAnimationUtilities__pkui_setPosition_withAdditiveAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __92__UIView_PKUIAnimationUtilities__pkui_setTransform_withAdditiveAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __80__UIView_PKUIAnimationUtilities__pkui_setAlpha_withAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__UIView_PKUIAnimationUtilities__pkui_setBackgroundColor_withAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__UIView_PKUIAnimationUtilities__pkui_setCornerRadius_withAdditiveAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __88__UIView_PKUIAnimationUtilities__pkui_setShadowOpacity_withAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__UIView_PKUIAnimationUtilities__pkui_setShadowOffset_withAdditiveAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __95__UIView_PKUIAnimationUtilities__pkui_setShadowRadius_withAdditiveAnimationFactory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__UIView_PKUIAnimationUtilities__pkui_setBounds_withAdditiveAnimationFactory_accumulator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __90__UIView_PKUIAnimationUtilities__pkui_setPosition_withAdditiveAnimationFactory_animation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __91__UIView_PKUIAnimationUtilities__pkui_setTransform_withAdditiveAnimationFactory_animation___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 120);
  v7[4] = *(_OWORD *)(a1 + 104);
  v7[5] = v2;
  long long v3 = *(_OWORD *)(a1 + 152);
  v7[6] = *(_OWORD *)(a1 + 136);
  v7[7] = v3;
  long long v4 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v4;
  long long v5 = *(_OWORD *)(a1 + 88);
  v7[2] = *(_OWORD *)(a1 + 72);
  v7[3] = v5;
  return [v1 setTransform3D:v7];
}

uint64_t __79__UIView_PKUIAnimationUtilities__pkui_setAlpha_withAnimationFactory_animation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

uint64_t __89__UIView_PKUIAnimationUtilities__pkui_setBackgroundColor_withAnimationFactory_animation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

void __89__UIView_PKUIAnimationUtilities__pkui_setBackgroundColor_withAnimationFactory_animation___block_invoke_2(void *a1)
{
  long long v3 = (void *)a1[4];
  long long v2 = (void *)a1[5];
  if (v2)
  {
    objc_msgSend(v3, "setFromValue:", objc_msgSend(v2, "backgroundColor"));
  }
  else
  {
    long long v4 = (void *)a1[6];
    long long v5 = v4;
    if (!v4)
    {
      long long v5 = [MEMORY[0x1E4FB1618] clearColor];
    }
    objc_msgSend(v3, "setFromValue:", objc_msgSend(v5, "CGColor"));
    if (!v4) {
  }
    }
  v6 = (void *)a1[4];
  v7 = (void *)a1[7];
  v8 = v7;
  if (!v7)
  {
    v8 = [MEMORY[0x1E4FB1618] clearColor];
  }
  id v9 = v8;
  objc_msgSend(v6, "setToValue:", objc_msgSend(v8, "CGColor"));
  if (!v7)
  {
  }
}

@end