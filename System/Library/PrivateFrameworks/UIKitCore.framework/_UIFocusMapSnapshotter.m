@interface _UIFocusMapSnapshotter
- (BOOL)clipToSnapshotRect;
- (BOOL)ignoresRootContainerClippingRect;
- (CGRect)snapshotFrame;
- (UICoordinateSpace)coordinateSpace;
- (UIFocusSystem)focusSystem;
- (_UIFocusMapSnapshotter)init;
- (_UIFocusMapSnapshotter)initWithFocusSystem:(id)a3 rootContainer:(id)a4 coordinateSpace:(id)a5 searchInfo:(id)a6 ignoresRootContainerClippingRect:(BOOL)a7;
- (_UIFocusMovementInfo)movementInfo;
- (_UIFocusRegion)focusedRegion;
- (_UIFocusRegionContainer)regionsContainer;
- (_UIFocusRegionContainer)rootContainer;
- (_UIFocusSearchInfo)searchInfo;
- (id)_searchAreaForContainerSearchRect:(CGRect)a3;
- (id)captureSnapshot;
- (void)setClipToSnapshotRect:(BOOL)a3;
- (void)setFocusedRegion:(id)a3;
- (void)setIgnoresRootContainerClippingRect:(BOOL)a3;
- (void)setMovementInfo:(id)a3;
- (void)setRegionsContainer:(id)a3;
- (void)setSearchInfo:(id)a3;
- (void)setSnapshotFrame:(CGRect)a3;
@end

@implementation _UIFocusMapSnapshotter

- (_UIFocusMapSnapshotter)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"_UIFocusMapSnapshotter.m" lineNumber:37 description:@"-init is not a valid initializer for this class."];

  return 0;
}

- (_UIFocusMapSnapshotter)initWithFocusSystem:(id)a3 rootContainer:(id)a4 coordinateSpace:(id)a5 searchInfo:(id)a6 ignoresRootContainerClippingRect:(BOOL)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (v13)
  {
    if (v14) {
      goto LABEL_3;
    }
LABEL_8:
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshotter.m", 44, @"Invalid parameter not satisfying: %@", @"rootContainer" object file lineNumber description];

    if (v15) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshotter.m", 43, @"Invalid parameter not satisfying: %@", @"focusSystem" object file lineNumber description];

  if (!v14) {
    goto LABEL_8;
  }
LABEL_3:
  if (v15) {
    goto LABEL_4;
  }
LABEL_9:
  v23 = [MEMORY[0x1E4F28B00] currentHandler];
  [v23 handleFailureInMethod:a2, self, @"_UIFocusMapSnapshotter.m", 45, @"Invalid parameter not satisfying: %@", @"coordinateSpace" object file lineNumber description];

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)_UIFocusMapSnapshotter;
  v17 = [(_UIFocusMapSnapshotter *)&v24 init];
  v18 = v17;
  if (v17)
  {
    objc_storeWeak((id *)&v17->_focusSystem, v13);
    objc_storeWeak((id *)&v18->_rootContainer, v14);
    objc_storeWeak((id *)&v18->_coordinateSpace, v15);
    CGSize v19 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v18->_snapshotFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v18->_snapshotFrame.size = v19;
    v18->_snapshotFrameIsEmpty = 1;
    v18->_ignoresRootContainerClippingRect = a7;
    v18->_clipToSnapshotRect = 1;
    objc_storeStrong((id *)&v18->_searchInfo, a6);
  }

  return v18;
}

- (void)setSnapshotFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(self->_snapshotFrame, a3))
  {
    self->_snapshotFrame.origin.CGFloat x = x;
    self->_snapshotFrame.origin.CGFloat y = y;
    self->_snapshotFrame.size.CGFloat width = width;
    self->_snapshotFrame.size.CGFloat height = height;
    v8.origin.CGFloat x = x;
    v8.origin.CGFloat y = y;
    v8.size.CGFloat width = width;
    v8.size.CGFloat height = height;
    self->_snapshotFrameIsEmptCGFloat y = CGRectIsEmpty(v8);
  }
}

- (id)_searchAreaForContainerSearchRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  double x = a3.origin.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  [WeakRetained bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  if ((_UIRectSmartIntersectsRect(v9, v11, v13, v15, x, y, width, height) & 1) == 0)
  {
    double x = _UIRectThatJustBarelyIntersectsRect(x, y, width, height, v10, v12, v14, v16);
    CGFloat y = v17;
    CGFloat width = v18;
    CGFloat height = v19;
  }
  v20 = self->_focusedRegion;
  if (v20)
  {
    +[_UIFocusRegionEvaluator frameForRegion:v20 inCoordinateSpace:WeakRetained];
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    if ((_UIRectSmartIntersectsRect(v21, v23, v25, v27, x, y, width, height) & 1) == 0)
    {
      double x = _UIRectThatJustBarelyIntersectsRect(x, y, width, height, v22, v24, v26, v28);
      CGFloat y = v29;
      CGFloat width = v30;
      CGFloat height = v31;
    }
  }
  id v32 = objc_loadWeakRetained((id *)&self->_rootContainer);
  v33 = _UIFocusItemSafeCast(v32);
  double v34 = _UIFocusItemFrameInCoordinateSpace(v33, WeakRetained);
  CGFloat v36 = v35;
  CGFloat v38 = v37;
  CGFloat v40 = v39;

  v47.origin.double x = v34;
  v47.origin.CGFloat y = v36;
  v47.size.CGFloat width = v38;
  v47.size.CGFloat height = v40;
  if (!CGRectIsNull(v47) && (_UIRectSmartIntersectsRect(v34, v36, v38, v40, x, y, width, height) & 1) == 0)
  {
    double x = _UIRectThatJustBarelyIntersectsRect(x, y, width, height, v34, v36, v38, v40);
    CGFloat y = v41;
    CGFloat width = v42;
    CGFloat height = v43;
  }
  v44 = -[_UIFocusMapRect initWithFrame:coordinateSpace:]([_UIFocusMapRect alloc], "initWithFrame:coordinateSpace:", WeakRetained, x, y, width, height);

  return v44;
}

- (id)captureSnapshot
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  v4 = WeakRetained;
  if (self->_snapshotFrameIsEmpty)
  {
    [WeakRetained bounds];
    double x = v5;
    double y = v7;
    double width = v9;
    double height = v11;
  }
  else
  {
    double x = self->_snapshotFrame.origin.x;
    double y = self->_snapshotFrame.origin.y;
    double width = self->_snapshotFrame.size.width;
    double height = self->_snapshotFrame.size.height;
  }
  CGFloat v13 = -[_UIFocusMapRect initWithFrame:coordinateSpace:]([_UIFocusMapRect alloc], "initWithFrame:coordinateSpace:", v4, x, y, width, height);
  CGFloat v14 = -[_UIFocusMapSnapshotter _searchAreaForContainerSearchRect:](self, "_searchAreaForContainerSearchRect:", x, y, width, height);
  id v15 = [[_UIFocusMapSnapshot alloc] _initWithSnapshotter:self mapArea:v13 searchArea:v14];

  return v15;
}

- (UIFocusSystem)focusSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  return (UIFocusSystem *)WeakRetained;
}

- (_UIFocusRegionContainer)rootContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootContainer);
  return (_UIFocusRegionContainer *)WeakRetained;
}

- (UICoordinateSpace)coordinateSpace
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_coordinateSpace);
  return (UICoordinateSpace *)WeakRetained;
}

- (_UIFocusRegion)focusedRegion
{
  return self->_focusedRegion;
}

- (void)setFocusedRegion:(id)a3
{
}

- (_UIFocusRegionContainer)regionsContainer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_regionsContainer);
  return (_UIFocusRegionContainer *)WeakRetained;
}

- (void)setRegionsContainer:(id)a3
{
}

- (_UIFocusSearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (void)setSearchInfo:(id)a3
{
}

- (_UIFocusMovementInfo)movementInfo
{
  return self->_movementInfo;
}

- (void)setMovementInfo:(id)a3
{
}

- (CGRect)snapshotFrame
{
  double x = self->_snapshotFrame.origin.x;
  double y = self->_snapshotFrame.origin.y;
  double width = self->_snapshotFrame.size.width;
  double height = self->_snapshotFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)clipToSnapshotRect
{
  return self->_clipToSnapshotRect;
}

- (void)setClipToSnapshotRect:(BOOL)a3
{
  self->_clipToSnapshotRect = a3;
}

- (BOOL)ignoresRootContainerClippingRect
{
  return self->_ignoresRootContainerClippingRect;
}

- (void)setIgnoresRootContainerClippingRect:(BOOL)a3
{
  self->_ignoresRootContainerClippingRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movementInfo, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_destroyWeak((id *)&self->_regionsContainer);
  objc_storeStrong((id *)&self->_focusedRegion, 0);
  objc_destroyWeak((id *)&self->_coordinateSpace);
  objc_destroyWeak((id *)&self->_rootContainer);
  objc_destroyWeak((id *)&self->_focusSystem);
}

@end