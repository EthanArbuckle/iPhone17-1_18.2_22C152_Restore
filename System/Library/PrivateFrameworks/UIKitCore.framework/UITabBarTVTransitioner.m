@interface UITabBarTVTransitioner
@end

@implementation UITabBarTVTransitioner

uint64_t __45___UITabBarTVTransitioner_animateTransition___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __45___UITabBarTVTransitioner_animateTransition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __45___UITabBarTVTransitioner_animateTransition___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 frame];
  CGRect v11 = CGRectOffset(v10, dbl_186B94210[*(unsigned char *)(a1 + 80) == 0], 0.0);
  objc_msgSend(v2, "setFrame:", v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
  v3 = *(void **)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  double v7 = *(double *)(a1 + 72);
  return objc_msgSend(v3, "setFrame:", v4, v5, v6, v7);
}

uint64_t __45___UITabBarTVTransitioner_animateTransition___block_invoke_4(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return [*(id *)(result + 32) finishTransition];
  }
  return result;
}

uint64_t __45___UITabBarTVTransitioner_animateTransition___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:1.0];
}

uint64_t __45___UITabBarTVTransitioner_animateTransition___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishTransition];
}

@end