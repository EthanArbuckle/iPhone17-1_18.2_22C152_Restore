@interface PUOneUpAssetTransitionContext
+ (id)oneUpAssetTransitionContextWithContainerView:(id)a3 fromView:(id)a4 snapshotView:(id)a5 transitionInfo:(id)a6;
+ (id)oneUpAssetTransitionContextWithContainerView:(id)a3 fromView:(id)a4 snapshotView:(id)a5 transitionInfo:(id)a6 trailingAssetTransitionInfo:(id)a7 leadingAssetTransitionInfo:(id)a8;
- (BOOL)shouldHideBackground;
- (PUAssetTransitionInfo)leadingAssetTransitionInfo;
- (PUAssetTransitionInfo)trailingAssetTransitionInfo;
- (PUAssetTransitionInfo)transitionInfo;
- (PXAction)executedAction;
- (UIView)containerView;
- (UIView)fromView;
- (UIView)snapshotView;
- (id)animationBlock;
- (id)oneUpTransitionContextWithAnimationBlock:(id)a3;
- (id)oneUpTransitionContextWithContextShouldHideBackground:(BOOL)a3;
- (id)oneUpTransitionContextWithContextWithContainerView:(id)a3;
- (void)_setAnimationBlock:(id)a3;
- (void)_setContainerView:(id)a3;
- (void)_setFromView:(id)a3;
- (void)_setLeadingAssetTransitionInfo:(id)a3;
- (void)_setShouldHideBackground:(BOOL)a3;
- (void)_setSnapshotView:(id)a3;
- (void)_setTrailingAssetTransitionInfo:(id)a3;
- (void)_setTransitionInfo:(id)a3;
- (void)setExecutedAction:(id)a3;
@end

@implementation PUOneUpAssetTransitionContext

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animationBlock, 0);
  objc_storeStrong((id *)&self->_executedAction, 0);
  objc_storeStrong((id *)&self->_leadingAssetTransitionInfo, 0);
  objc_storeStrong((id *)&self->_trailingAssetTransitionInfo, 0);
  objc_storeStrong((id *)&self->_transitionInfo, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_fromView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

- (void)_setAnimationBlock:(id)a3
{
}

- (id)animationBlock
{
  return self->_animationBlock;
}

- (void)setExecutedAction:(id)a3
{
}

- (PXAction)executedAction
{
  return self->_executedAction;
}

- (void)_setLeadingAssetTransitionInfo:(id)a3
{
}

- (PUAssetTransitionInfo)leadingAssetTransitionInfo
{
  return self->_leadingAssetTransitionInfo;
}

- (void)_setTrailingAssetTransitionInfo:(id)a3
{
}

- (PUAssetTransitionInfo)trailingAssetTransitionInfo
{
  return self->_trailingAssetTransitionInfo;
}

- (void)_setTransitionInfo:(id)a3
{
}

- (PUAssetTransitionInfo)transitionInfo
{
  return self->_transitionInfo;
}

- (void)_setShouldHideBackground:(BOOL)a3
{
  self->_shouldHideBackground = a3;
}

- (BOOL)shouldHideBackground
{
  return self->_shouldHideBackground;
}

- (void)_setSnapshotView:(id)a3
{
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)_setFromView:(id)a3
{
}

- (UIView)fromView
{
  return self->_fromView;
}

- (void)_setContainerView:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (id)oneUpTransitionContextWithAnimationBlock:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(PUOneUpAssetTransitionContext);
  [(PUOneUpAssetTransitionContext *)v5 _setContainerView:self->_containerView];
  [(PUOneUpAssetTransitionContext *)v5 _setFromView:self->_fromView];
  [(PUOneUpAssetTransitionContext *)v5 _setSnapshotView:self->_snapshotView];
  [(PUOneUpAssetTransitionContext *)v5 _setTransitionInfo:self->_transitionInfo];
  [(PUOneUpAssetTransitionContext *)v5 _setTrailingAssetTransitionInfo:self->_trailingAssetTransitionInfo];
  [(PUOneUpAssetTransitionContext *)v5 _setLeadingAssetTransitionInfo:self->_leadingAssetTransitionInfo];
  [(PUOneUpAssetTransitionContext *)v5 _setAnimationBlock:v4];

  [(PUOneUpAssetTransitionContext *)v5 _setShouldHideBackground:self->_shouldHideBackground];
  [(PUOneUpAssetTransitionContext *)v5 setExecutedAction:self->_executedAction];
  return v5;
}

- (id)oneUpTransitionContextWithContextShouldHideBackground:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = objc_alloc_init(PUOneUpAssetTransitionContext);
  [(PUOneUpAssetTransitionContext *)v5 _setContainerView:self->_containerView];
  [(PUOneUpAssetTransitionContext *)v5 _setFromView:self->_fromView];
  [(PUOneUpAssetTransitionContext *)v5 _setSnapshotView:self->_snapshotView];
  [(PUOneUpAssetTransitionContext *)v5 _setTransitionInfo:self->_transitionInfo];
  [(PUOneUpAssetTransitionContext *)v5 _setTrailingAssetTransitionInfo:self->_trailingAssetTransitionInfo];
  [(PUOneUpAssetTransitionContext *)v5 _setLeadingAssetTransitionInfo:self->_leadingAssetTransitionInfo];
  [(PUOneUpAssetTransitionContext *)v5 _setShouldHideBackground:v3];
  [(PUOneUpAssetTransitionContext *)v5 setExecutedAction:self->_executedAction];
  return v5;
}

- (id)oneUpTransitionContextWithContextWithContainerView:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(PUOneUpAssetTransitionContext);
  [(PUOneUpAssetTransitionContext *)v5 _setContainerView:v4];

  [(PUOneUpAssetTransitionContext *)v5 _setFromView:self->_fromView];
  [(PUOneUpAssetTransitionContext *)v5 _setSnapshotView:self->_snapshotView];
  [(PUOneUpAssetTransitionContext *)v5 _setTransitionInfo:self->_transitionInfo];
  [(PUOneUpAssetTransitionContext *)v5 _setTrailingAssetTransitionInfo:self->_trailingAssetTransitionInfo];
  [(PUOneUpAssetTransitionContext *)v5 _setLeadingAssetTransitionInfo:self->_leadingAssetTransitionInfo];
  [(PUOneUpAssetTransitionContext *)v5 _setShouldHideBackground:self->_shouldHideBackground];
  [(PUOneUpAssetTransitionContext *)v5 setExecutedAction:self->_executedAction];
  return v5;
}

+ (id)oneUpAssetTransitionContextWithContainerView:(id)a3 fromView:(id)a4 snapshotView:(id)a5 transitionInfo:(id)a6 trailingAssetTransitionInfo:(id)a7 leadingAssetTransitionInfo:(id)a8
{
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = objc_alloc_init(PUOneUpAssetTransitionContext);
  [(PUOneUpAssetTransitionContext *)v19 _setContainerView:v18];

  [(PUOneUpAssetTransitionContext *)v19 _setFromView:v17];
  [(PUOneUpAssetTransitionContext *)v19 _setSnapshotView:v16];

  [(PUOneUpAssetTransitionContext *)v19 _setTransitionInfo:v15];
  [(PUOneUpAssetTransitionContext *)v19 _setTrailingAssetTransitionInfo:v14];

  [(PUOneUpAssetTransitionContext *)v19 _setLeadingAssetTransitionInfo:v13];
  return v19;
}

+ (id)oneUpAssetTransitionContextWithContainerView:(id)a3 fromView:(id)a4 snapshotView:(id)a5 transitionInfo:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = objc_alloc_init(PUOneUpAssetTransitionContext);
  [(PUOneUpAssetTransitionContext *)v13 _setContainerView:v12];

  [(PUOneUpAssetTransitionContext *)v13 _setFromView:v11];
  [(PUOneUpAssetTransitionContext *)v13 _setSnapshotView:v10];

  [(PUOneUpAssetTransitionContext *)v13 _setTransitionInfo:v9];
  return v13;
}

@end