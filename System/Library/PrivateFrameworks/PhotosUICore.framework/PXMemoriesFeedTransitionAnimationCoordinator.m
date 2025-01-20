@interface PXMemoriesFeedTransitionAnimationCoordinator
- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7;
- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7;
- (BOOL)useDoubleSidedAnimation;
- (PXMemoriesFeedTransitionAnimationCoordinator)init;
- (id)optionsForAnimatingTileWithIdentifier:(PXTileIdentifier *)a3 animationType:(int64_t)a4 fromGeometry:(PXTileGeometry *)a5 fromUserData:(id)a6 toGeometry:(PXTileGeometry *)a7 toUserData:(id)a8;
- (void)setUseDoubleSidedAnimation:(BOOL)a3;
@end

@implementation PXMemoriesFeedTransitionAnimationCoordinator

- (void).cxx_destruct
{
}

- (void)setUseDoubleSidedAnimation:(BOOL)a3
{
  self->_useDoubleSidedAnimation = a3;
}

- (BOOL)useDoubleSidedAnimation
{
  return self->_useDoubleSidedAnimation;
}

- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7
{
  CGRect contentsRect = a6->contentsRect;
  coordinateSpaceIdentifier = a6->coordinateSpaceIdentifier;
  long long v11 = *(_OWORD *)&a6->zPosition;
  CGSize contentSize = a6->contentSize;
  memmove(a3, a6, 0x70uLL);
  a3->alpha = 0.0;
  a3->CGSize contentSize = contentSize;
  a3->CGRect contentsRect = contentsRect;
  a3->coordinateSpaceIdentifier = coordinateSpaceIdentifier;
  *(_OWORD *)&a3->zPosition = v11;
  *a4 = a7;
  return 1;
}

- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  CGRect contentsRect = a6->contentsRect;
  coordinateSpaceIdentifier = a6->coordinateSpaceIdentifier;
  long long v11 = *(_OWORD *)&a6->zPosition;
  CGSize contentSize = a6->contentSize;
  memmove(a3, a6, 0x70uLL);
  a3->alpha = 0.0;
  a3->CGSize contentSize = contentSize;
  a3->CGRect contentsRect = contentsRect;
  a3->coordinateSpaceIdentifier = coordinateSpaceIdentifier;
  *(_OWORD *)&a3->zPosition = v11;
  *a4 = a7;
  return 1;
}

- (id)optionsForAnimatingTileWithIdentifier:(PXTileIdentifier *)a3 animationType:(int64_t)a4 fromGeometry:(PXTileGeometry *)a5 fromUserData:(id)a6 toGeometry:(PXTileGeometry *)a7 toUserData:(id)a8
{
  return self->_basicOptions;
}

- (PXMemoriesFeedTransitionAnimationCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXMemoriesFeedTransitionAnimationCoordinator;
  v2 = [(PXMemoriesFeedTransitionAnimationCoordinator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[PXBasicTileAnimationOptions defaultAnimationOptions];
    basicOptions = v2->_basicOptions;
    v2->_basicOptions = (PXBasicTileAnimationOptions *)v3;

    [(PXBasicTileAnimationOptions *)v2->_basicOptions setShouldNotifyTiles:1];
  }
  return v2;
}

@end