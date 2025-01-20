@interface UICollectionView
@end

@implementation UICollectionView

void __75__UICollectionView_Utilities__stk_performRippleAnimationAtIndexPath_delay___block_invoke(double *a1, void *a2)
{
  v2 = (void *)*((void *)a1 + 4);
  uint64_t v3 = *((void *)a1 + 5);
  double v4 = a1[6];
  id v5 = a2;
  id v7 = [v2 animationForCell:v5 sourceCell:v3 triggerDelay:v4];
  v6 = [v5 layer];

  [v6 addAnimation:v7 forKey:@"ripple"];
}

@end