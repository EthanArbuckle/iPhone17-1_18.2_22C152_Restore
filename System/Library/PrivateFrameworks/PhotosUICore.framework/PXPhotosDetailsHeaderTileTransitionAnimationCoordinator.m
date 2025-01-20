@interface PXPhotosDetailsHeaderTileTransitionAnimationCoordinator
- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7;
- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7;
- (BOOL)useDoubleSidedAnimationForUpdatedTileWithIdentifier:(PXTileIdentifier *)a3 fromGeometry:(PXTileGeometry *)a4 fromUserData:(id)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7;
- (PXBasicTileAnimationOptions)_basicAnimationOptions;
- (PXPhotosDetailsHeaderTileTransitionAnimationCoordinator)init;
@end

@implementation PXPhotosDetailsHeaderTileTransitionAnimationCoordinator

- (void).cxx_destruct
{
}

- (PXBasicTileAnimationOptions)_basicAnimationOptions
{
  return self->__basicAnimationOptions;
}

- (BOOL)useDoubleSidedAnimationForUpdatedTileWithIdentifier:(PXTileIdentifier *)a3 fromGeometry:(PXTileGeometry *)a4 fromUserData:(id)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  return 0;
}

- (BOOL)getFinalGeometry:(PXTileGeometry *)a3 finalUserData:(id *)a4 forDisappearingTileWithIdentifier:(PXTileIdentifier *)a5 fromGeometry:(PXTileGeometry *)a6 fromUserData:(id)a7
{
  a6->alpha = 0.0;
  CGPoint origin = a6->frame.origin;
  CGSize size = a6->frame.size;
  CGSize v9 = a6->size;
  a3->center = a6->center;
  a3->CGSize size = v9;
  a3->frame.CGPoint origin = origin;
  a3->frame.CGSize size = size;
  long long v10 = *(_OWORD *)&a6->hidden;
  long long v11 = *(_OWORD *)&a6->contentSize.height;
  long long v12 = *(_OWORD *)&a6->contentsRect.size.height;
  *(_OWORD *)&a3->contentsRect.origin.y = *(_OWORD *)&a6->contentsRect.origin.y;
  *(_OWORD *)&a3->contentsRect.size.height = v12;
  *(_OWORD *)&a3->hidden = v10;
  *(_OWORD *)&a3->contentSize.height = v11;
  long long v13 = *(_OWORD *)&a6->transform.a;
  long long v14 = *(_OWORD *)&a6->transform.c;
  long long v15 = *(_OWORD *)&a6->alpha;
  *(_OWORD *)&a3->transform.tx = *(_OWORD *)&a6->transform.tx;
  *(_OWORD *)&a3->alpha = v15;
  *(_OWORD *)&a3->transform.a = v13;
  *(_OWORD *)&a3->transform.c = v14;
  *a4 = a7;
  return 1;
}

- (BOOL)getInitialGeometry:(PXTileGeometry *)a3 initialUserData:(id *)a4 forAppearingTileWithIdentifier:(PXTileIdentifier *)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  a6->alpha = 0.0;
  CGPoint origin = a6->frame.origin;
  CGSize size = a6->frame.size;
  CGSize v9 = a6->size;
  a3->center = a6->center;
  a3->CGSize size = v9;
  a3->frame.CGPoint origin = origin;
  a3->frame.CGSize size = size;
  long long v10 = *(_OWORD *)&a6->hidden;
  long long v11 = *(_OWORD *)&a6->contentSize.height;
  long long v12 = *(_OWORD *)&a6->contentsRect.size.height;
  *(_OWORD *)&a3->contentsRect.origin.y = *(_OWORD *)&a6->contentsRect.origin.y;
  *(_OWORD *)&a3->contentsRect.size.height = v12;
  *(_OWORD *)&a3->hidden = v10;
  *(_OWORD *)&a3->contentSize.height = v11;
  long long v13 = *(_OWORD *)&a6->transform.a;
  long long v14 = *(_OWORD *)&a6->transform.c;
  long long v15 = *(_OWORD *)&a6->alpha;
  *(_OWORD *)&a3->transform.tx = *(_OWORD *)&a6->transform.tx;
  *(_OWORD *)&a3->alpha = v15;
  *(_OWORD *)&a3->transform.a = v13;
  *(_OWORD *)&a3->transform.c = v14;
  *a4 = a7;
  return 1;
}

- (PXPhotosDetailsHeaderTileTransitionAnimationCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)PXPhotosDetailsHeaderTileTransitionAnimationCoordinator;
  v2 = [(PXPhotosDetailsHeaderTileTransitionAnimationCoordinator *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[PXBasicTileAnimationOptions defaultAnimationOptions];
    basicAnimationOptions = v2->__basicAnimationOptions;
    v2->__basicAnimationOptions = (PXBasicTileAnimationOptions *)v3;

    [(PXBasicTileAnimationOptions *)v2->__basicAnimationOptions setShouldNotifyTiles:1];
  }
  return v2;
}

@end