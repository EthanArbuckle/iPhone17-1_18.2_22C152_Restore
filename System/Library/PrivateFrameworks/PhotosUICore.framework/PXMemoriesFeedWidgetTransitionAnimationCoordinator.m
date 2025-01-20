@interface PXMemoriesFeedWidgetTransitionAnimationCoordinator
- (BOOL)useDoubleSidedAnimationForUpdatedTileWithIdentifier:(PXTileIdentifier *)a3 fromGeometry:(PXTileGeometry *)a4 fromUserData:(id)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7;
@end

@implementation PXMemoriesFeedWidgetTransitionAnimationCoordinator

- (BOOL)useDoubleSidedAnimationForUpdatedTileWithIdentifier:(PXTileIdentifier *)a3 fromGeometry:(PXTileGeometry *)a4 fromUserData:(id)a5 toGeometry:(PXTileGeometry *)a6 toUserData:(id)a7
{
  double x = a4->center.x;
  double y = a4->center.y;
  double width = a4->size.width;
  double height = a4->size.height;
  CGAffineTransform transform = a4->transform;
  double alpha = a4->alpha;
  double zPosition = a4->zPosition;
  int hidden = a4->hidden;
  double v33 = a4->contentSize.width;
  double v31 = a4->contentSize.height;
  CGFloat v28 = a4->contentsRect.origin.y;
  CGFloat v29 = a4->contentsRect.origin.x;
  CGFloat v26 = a4->contentsRect.size.height;
  CGFloat v27 = a4->contentsRect.size.width;
  coordinateSpaceIdentifier = a4->coordinateSpaceIdentifier;
  double v14 = a6->center.x;
  double v13 = a6->center.y;
  double v16 = a6->size.width;
  double v15 = a6->size.height;
  CGAffineTransform v38 = a6->transform;
  double v34 = a6->alpha;
  double v36 = a6->zPosition;
  int v17 = a6->hidden;
  double v32 = a6->contentSize.width;
  double v30 = a6->contentSize.height;
  CGFloat v24 = a6->contentsRect.origin.y;
  CGFloat v25 = a6->contentsRect.origin.x;
  CGFloat v22 = a6->contentsRect.size.height;
  CGFloat v23 = a6->contentsRect.size.width;
  v18 = a6->coordinateSpaceIdentifier;
  if (!CGRectEqualToRect(a4->frame, a6->frame)) {
    return 1;
  }
  BOOL result = 1;
  if (x == v14 && y == v13 && width == v16 && height == v15)
  {
    CGAffineTransform t1 = transform;
    CGAffineTransform t2 = v38;
    BOOL v20 = CGAffineTransformEqualToTransform(&t1, &t2);
    BOOL result = 1;
    if (v20 && zPosition == v36 && hidden == v17 && alpha == v34 && v33 == v32 && v31 == v30)
    {
      v42.origin.double y = v28;
      v42.origin.double x = v29;
      v42.size.double height = v26;
      v42.size.double width = v27;
      v43.origin.double y = v24;
      v43.origin.double x = v25;
      v43.size.double height = v22;
      v43.size.double width = v23;
      BOOL v21 = !CGRectEqualToRect(v42, v43);
      return coordinateSpaceIdentifier != v18 || v21;
    }
  }
  return result;
}

@end