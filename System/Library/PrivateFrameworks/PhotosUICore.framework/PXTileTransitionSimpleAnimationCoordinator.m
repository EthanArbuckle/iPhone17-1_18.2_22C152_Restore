@interface PXTileTransitionSimpleAnimationCoordinator
- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7;
- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7;
- (BOOL)useDoubleSidedAnimationForUpdatedTileWithIdentifier:(PXTileIdentifier *)a3 fromGeometry:(PXTileGeometry *)a4 fromUserData:(id)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7;
- (NSObject)animationOptions;
- (PXTileTransitionSimpleAnimationCoordinator)init;
- (PXTileTransitionSimpleAnimationCoordinator)initWithAnimationOptions:(id)a3;
@end

@implementation PXTileTransitionSimpleAnimationCoordinator

- (void).cxx_destruct
{
}

- (NSObject)animationOptions
{
  return self->_animationOptions;
}

- (BOOL)useDoubleSidedAnimationForUpdatedTileWithIdentifier:(PXTileIdentifier *)a3 fromGeometry:(PXTileGeometry *)a4 fromUserData:(id)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  return 0;
}

- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7
{
  return 0;
}

- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  return 0;
}

- (PXTileTransitionSimpleAnimationCoordinator)initWithAnimationOptions:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXTileTransitionSimpleAnimationCoordinator;
  v6 = [(PXTileTransitionSimpleAnimationCoordinator *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_animationOptions, a3);
  }

  return v7;
}

- (PXTileTransitionSimpleAnimationCoordinator)init
{
  return [(PXTileTransitionSimpleAnimationCoordinator *)self initWithAnimationOptions:0];
}

@end