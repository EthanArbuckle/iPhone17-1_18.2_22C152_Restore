@interface UIContextMenuDismissToWindowSceneActivationAnimation
@end

@implementation UIContextMenuDismissToWindowSceneActivationAnimation

uint64_t __86___UIContextMenuDismissToWindowSceneActivationAnimation_animateAlongsideScenePlatter___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  v2 = *(void **)(a1 + 32);
  return [v2 setHidesCollapsedSourceView:0];
}

uint64_t __86___UIContextMenuDismissToWindowSceneActivationAnimation_animateAlongsideScenePlatter___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  double v6 = fmin(CGRectGetHeight(v11), 110.0);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, CGRectGetWidth(v12), v6);
  CGAffineTransformMakeScale(&v10, 0.2, 0.2);
  v7 = *(void **)(a1 + 32);
  CGAffineTransform v9 = v10;
  [v7 setTransform:&v9];
  [*(id *)(a1 + 32) setAlpha:0.0];
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

@end