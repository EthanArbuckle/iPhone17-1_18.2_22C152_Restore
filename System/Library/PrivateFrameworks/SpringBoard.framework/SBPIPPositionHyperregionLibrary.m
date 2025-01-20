@interface SBPIPPositionHyperregionLibrary
- (CGRect)_insetRectForEdgeInsets:(UIEdgeInsets)a3 pipSize:(CGSize)a4 containerBounds:(CGRect)a5;
- (CGRect)_validatedInsetRectWithinContainerBoundsWithGeometry:(SBPIPPositionGeometryContext *)a3;
- (CGRect)_validatedMinimumPaddingAndEdgeInsetInsetRect:(SBPIPPositionGeometryContext *)a3;
- (CGRect)_validatedStashedToStashedMaximumumRectWithGeometry:(SBPIPPositionGeometryContext *)a3;
- (NSString)description;
- (SBPIPPositionHyperregionLibrary)init;
- (id)_allUnifiedRegionWithGeometry:(SBPIPPositionGeometryContext *)a3;
- (id)_containerInsetRegionWithGeometry:(SBPIPPositionGeometryContext *)a3;
- (id)_cornersRegionWithGeometry:(SBPIPPositionGeometryContext *)a3;
- (id)_lastKnownRegionForType:(int64_t)a3;
- (id)_offscreenCornersRegionWithGeometry:(SBPIPPositionGeometryContext *)a3;
- (id)_stashedLeftRegionWithGeometry:(SBPIPPositionGeometryContext *)a3;
- (id)_stashedRightRegionWithGeometry:(SBPIPPositionGeometryContext *)a3;
- (id)regionWithType:(int64_t)a3 geometry:(SBPIPPositionGeometryContext *)a4;
- (void)_resetLastKnownRegions;
@end

@implementation SBPIPPositionHyperregionLibrary

- (SBPIPPositionHyperregionLibrary)init
{
  v5.receiver = self;
  v5.super_class = (Class)SBPIPPositionHyperregionLibrary;
  v2 = [(SBPIPPositionHyperregionLibrary *)&v5 init];
  if (v2)
  {
    if (__sb__runningInSpringBoard())
    {
      v2->_isPad = SBFEffectiveDeviceClass() == 2;
    }
    else
    {
      v3 = [MEMORY[0x1E4F42948] currentDevice];
      v2->_isPad = [v3 userInterfaceIdiom] == 1;
    }
  }
  return v2;
}

- (NSString)description
{
  v26[7] = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v24.receiver = self;
  v24.super_class = (Class)SBPIPPositionHyperregionLibrary;
  v4 = [(SBPIPPositionHyperregionLibrary *)&v24 description];
  lastAllUnified = (_UIHyperregionUnion *)&stru_1F3084718;
  v25[0] = @"Corners";
  v25[1] = @"Stashed Left";
  lastCornersRegion = self->_lastCornersRegion;
  lastStashedLeftRegion = self->_lastStashedLeftRegion;
  if (!lastCornersRegion) {
    lastCornersRegion = (_UIHyperregionUnion *)&stru_1F3084718;
  }
  if (!lastStashedLeftRegion) {
    lastStashedLeftRegion = (_UIHyperregionUnion *)&stru_1F3084718;
  }
  v26[0] = lastCornersRegion;
  v26[1] = lastStashedLeftRegion;
  lastStashedRightRegion = self->_lastStashedRightRegion;
  lastOffscreenCorners = self->_lastOffscreenCorners;
  if (!lastStashedRightRegion) {
    lastStashedRightRegion = (_UIHyperregionUnion *)&stru_1F3084718;
  }
  v25[2] = @"Stashed Right";
  v25[3] = @"Offscreen Corners";
  if (lastOffscreenCorners) {
    v10 = (__CFString *)lastOffscreenCorners;
  }
  else {
    v10 = &stru_1F3084718;
  }
  v26[2] = lastStashedRightRegion;
  v26[3] = v10;
  v25[4] = @"Container Inset";
  v25[5] = @"Unified";
  lastContainerInsetRegion = self->_lastContainerInsetRegion;
  if (!lastContainerInsetRegion) {
    lastContainerInsetRegion = (_UIHyperregionUnion *)&stru_1F3084718;
  }
  if (self->_lastAllUnified) {
    lastAllUnified = self->_lastAllUnified;
  }
  v26[4] = lastContainerInsetRegion;
  v26[5] = lastAllUnified;
  v25[6] = @"Geometry";
  long long v12 = *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.bottom;
  v23[10] = *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.top;
  v23[11] = v12;
  v23[12] = *(_OWORD *)&self->_lastGeometryContext.offscreenCorners;
  long long v13 = *(_OWORD *)&self->_lastGeometryContext.edgeInsets.bottom;
  v23[6] = *(_OWORD *)&self->_lastGeometryContext.edgeInsets.top;
  v23[7] = v13;
  long long v14 = *(_OWORD *)&self->_lastGeometryContext.minimumPadding.bottom;
  v23[8] = *(_OWORD *)&self->_lastGeometryContext.minimumPadding.top;
  v23[9] = v14;
  CGPoint pipAnchorPointOffset = self->_lastGeometryContext.pipAnchorPointOffset;
  v23[2] = self->_lastGeometryContext.pipStashedSize;
  v23[3] = pipAnchorPointOffset;
  CGSize size = self->_lastGeometryContext.containerBounds.size;
  v23[4] = self->_lastGeometryContext.containerBounds.origin;
  v23[5] = size;
  CGSize pipLastSteadySize = self->_lastGeometryContext.pipLastSteadySize;
  v23[0] = self->_lastGeometryContext.pipCurrentSize;
  v23[1] = pipLastSteadySize;
  v18 = SBPIPPositionGeometryContextDescription((uint64_t)v23);
  v26[6] = v18;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:7];
  v20 = [v19 description];
  v21 = [v3 stringWithFormat:@"%@\n%@", v4, v20];

  return (NSString *)v21;
}

- (id)regionWithType:(int64_t)a3 geometry:(SBPIPPositionGeometryContext *)a4
{
  if (a3 <= 0)
  {
    v74 = [MEMORY[0x1E4F28B00] currentHandler];
    [v74 handleFailureInMethod:a2, self, @"SBPIPPositionHyperregionLibrary.m", 100, @"Invalid parameter not satisfying: %@", @"regionType > 0" object file lineNumber description];
  }
  long long v7 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
  long long v86 = *(_OWORD *)&a4->stashedMinimumPadding.top;
  long long v87 = v7;
  long long v88 = *(_OWORD *)&a4->offscreenCorners;
  long long v8 = *(_OWORD *)&a4->edgeInsets.bottom;
  long long v82 = *(_OWORD *)&a4->edgeInsets.top;
  long long v83 = v8;
  long long v9 = *(_OWORD *)&a4->minimumPadding.bottom;
  long long v84 = *(_OWORD *)&a4->minimumPadding.top;
  long long v85 = v9;
  CGPoint pipAnchorPointOffset = a4->pipAnchorPointOffset;
  CGSize pipStashedSize = a4->pipStashedSize;
  CGPoint v79 = pipAnchorPointOffset;
  CGSize size = a4->containerBounds.size;
  CGPoint origin = a4->containerBounds.origin;
  CGSize v81 = size;
  CGSize pipLastSteadySize = a4->pipLastSteadySize;
  CGSize pipCurrentSize = a4->pipCurrentSize;
  CGSize v77 = pipLastSteadySize;
  long long v13 = *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.bottom;
  v75[10] = *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.top;
  v75[11] = v13;
  v75[12] = *(_OWORD *)&self->_lastGeometryContext.offscreenCorners;
  long long v14 = *(_OWORD *)&self->_lastGeometryContext.edgeInsets.bottom;
  v75[6] = *(_OWORD *)&self->_lastGeometryContext.edgeInsets.top;
  v75[7] = v14;
  long long v15 = *(_OWORD *)&self->_lastGeometryContext.minimumPadding.bottom;
  v75[8] = *(_OWORD *)&self->_lastGeometryContext.minimumPadding.top;
  v75[9] = v15;
  CGPoint v16 = self->_lastGeometryContext.pipAnchorPointOffset;
  v75[2] = self->_lastGeometryContext.pipStashedSize;
  v75[3] = v16;
  CGSize v17 = self->_lastGeometryContext.containerBounds.size;
  v75[4] = self->_lastGeometryContext.containerBounds.origin;
  v75[5] = v17;
  CGSize v18 = self->_lastGeometryContext.pipLastSteadySize;
  v75[0] = self->_lastGeometryContext.pipCurrentSize;
  v75[1] = v18;
  if ((SBPIPPositionGeometryContextIsEqualToContext((uint64_t)&pipCurrentSize, (uint64_t)v75) & 1) == 0)
  {
    self->_lastGeometryContext.CGSize pipCurrentSize = a4->pipCurrentSize;
    CGSize v19 = a4->pipLastSteadySize;
    CGSize v20 = a4->pipStashedSize;
    CGPoint v21 = a4->containerBounds.origin;
    self->_lastGeometryContext.CGPoint pipAnchorPointOffset = a4->pipAnchorPointOffset;
    self->_lastGeometryContext.containerBounds.CGPoint origin = v21;
    self->_lastGeometryContext.CGSize pipLastSteadySize = v19;
    self->_lastGeometryContext.CGSize pipStashedSize = v20;
    CGSize v22 = a4->containerBounds.size;
    long long v23 = *(_OWORD *)&a4->edgeInsets.top;
    long long v24 = *(_OWORD *)&a4->minimumPadding.top;
    *(_OWORD *)&self->_lastGeometryContext.edgeInsets.bottom = *(_OWORD *)&a4->edgeInsets.bottom;
    *(_OWORD *)&self->_lastGeometryContext.minimumPadding.top = v24;
    self->_lastGeometryContext.containerBounds.CGSize size = v22;
    *(_OWORD *)&self->_lastGeometryContext.edgeInsets.top = v23;
    long long v25 = *(_OWORD *)&a4->minimumPadding.bottom;
    long long v26 = *(_OWORD *)&a4->stashedMinimumPadding.top;
    long long v27 = *(_OWORD *)&a4->offscreenCorners;
    *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.bottom = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
    *(_OWORD *)&self->_lastGeometryContext.offscreenCorners = v27;
    *(_OWORD *)&self->_lastGeometryContext.minimumPadding.bottom = v25;
    *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.top = v26;
    [(SBPIPPositionHyperregionLibrary *)self _resetLastKnownRegions];
  }
  v28 = [(SBPIPPositionHyperregionLibrary *)self _lastKnownRegionForType:a3];
  if (!v28)
  {
    switch(a3)
    {
      case 1:
        long long v29 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        long long v86 = *(_OWORD *)&a4->stashedMinimumPadding.top;
        long long v87 = v29;
        long long v88 = *(_OWORD *)&a4->offscreenCorners;
        long long v30 = *(_OWORD *)&a4->edgeInsets.bottom;
        long long v82 = *(_OWORD *)&a4->edgeInsets.top;
        long long v83 = v30;
        long long v31 = *(_OWORD *)&a4->minimumPadding.bottom;
        long long v84 = *(_OWORD *)&a4->minimumPadding.top;
        long long v85 = v31;
        CGPoint v32 = a4->pipAnchorPointOffset;
        CGSize pipStashedSize = a4->pipStashedSize;
        CGPoint v79 = v32;
        CGSize v33 = a4->containerBounds.size;
        CGPoint origin = a4->containerBounds.origin;
        CGSize v81 = v33;
        CGSize v34 = a4->pipLastSteadySize;
        CGSize pipCurrentSize = a4->pipCurrentSize;
        CGSize v77 = v34;
        v35 = [(SBPIPPositionHyperregionLibrary *)self _cornersRegionWithGeometry:&pipCurrentSize];
        lastCornersRegion = self->_lastCornersRegion;
        self->_lastCornersRegion = v35;
        goto LABEL_13;
      case 2:
        long long v37 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        long long v86 = *(_OWORD *)&a4->stashedMinimumPadding.top;
        long long v87 = v37;
        long long v88 = *(_OWORD *)&a4->offscreenCorners;
        long long v38 = *(_OWORD *)&a4->edgeInsets.bottom;
        long long v82 = *(_OWORD *)&a4->edgeInsets.top;
        long long v83 = v38;
        long long v39 = *(_OWORD *)&a4->minimumPadding.bottom;
        long long v84 = *(_OWORD *)&a4->minimumPadding.top;
        long long v85 = v39;
        CGPoint v40 = a4->pipAnchorPointOffset;
        CGSize pipStashedSize = a4->pipStashedSize;
        CGPoint v79 = v40;
        CGSize v41 = a4->containerBounds.size;
        CGPoint origin = a4->containerBounds.origin;
        CGSize v81 = v41;
        CGSize v42 = a4->pipLastSteadySize;
        CGSize pipCurrentSize = a4->pipCurrentSize;
        CGSize v77 = v42;
        v43 = [(SBPIPPositionHyperregionLibrary *)self _stashedLeftRegionWithGeometry:&pipCurrentSize];
        lastCornersRegion = self->_lastStashedLeftRegion;
        self->_lastStashedLeftRegion = v43;
        goto LABEL_13;
      case 3:
        long long v44 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        long long v86 = *(_OWORD *)&a4->stashedMinimumPadding.top;
        long long v87 = v44;
        long long v88 = *(_OWORD *)&a4->offscreenCorners;
        long long v45 = *(_OWORD *)&a4->edgeInsets.bottom;
        long long v82 = *(_OWORD *)&a4->edgeInsets.top;
        long long v83 = v45;
        long long v46 = *(_OWORD *)&a4->minimumPadding.bottom;
        long long v84 = *(_OWORD *)&a4->minimumPadding.top;
        long long v85 = v46;
        CGPoint v47 = a4->pipAnchorPointOffset;
        CGSize pipStashedSize = a4->pipStashedSize;
        CGPoint v79 = v47;
        CGSize v48 = a4->containerBounds.size;
        CGPoint origin = a4->containerBounds.origin;
        CGSize v81 = v48;
        CGSize v49 = a4->pipLastSteadySize;
        CGSize pipCurrentSize = a4->pipCurrentSize;
        CGSize v77 = v49;
        v50 = [(SBPIPPositionHyperregionLibrary *)self _stashedRightRegionWithGeometry:&pipCurrentSize];
        lastCornersRegion = self->_lastStashedRightRegion;
        self->_lastStashedRightRegion = v50;
        goto LABEL_13;
      case 4:
        long long v51 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        long long v86 = *(_OWORD *)&a4->stashedMinimumPadding.top;
        long long v87 = v51;
        long long v88 = *(_OWORD *)&a4->offscreenCorners;
        long long v52 = *(_OWORD *)&a4->edgeInsets.bottom;
        long long v82 = *(_OWORD *)&a4->edgeInsets.top;
        long long v83 = v52;
        long long v53 = *(_OWORD *)&a4->minimumPadding.bottom;
        long long v84 = *(_OWORD *)&a4->minimumPadding.top;
        long long v85 = v53;
        CGPoint v54 = a4->pipAnchorPointOffset;
        CGSize pipStashedSize = a4->pipStashedSize;
        CGPoint v79 = v54;
        CGSize v55 = a4->containerBounds.size;
        CGPoint origin = a4->containerBounds.origin;
        CGSize v81 = v55;
        CGSize v56 = a4->pipLastSteadySize;
        CGSize pipCurrentSize = a4->pipCurrentSize;
        CGSize v77 = v56;
        v57 = [(SBPIPPositionHyperregionLibrary *)self _offscreenCornersRegionWithGeometry:&pipCurrentSize];
        lastCornersRegion = self->_lastOffscreenCorners;
        self->_lastOffscreenCorners = v57;
        goto LABEL_13;
      case 5:
        long long v58 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        long long v86 = *(_OWORD *)&a4->stashedMinimumPadding.top;
        long long v87 = v58;
        long long v88 = *(_OWORD *)&a4->offscreenCorners;
        long long v59 = *(_OWORD *)&a4->edgeInsets.bottom;
        long long v82 = *(_OWORD *)&a4->edgeInsets.top;
        long long v83 = v59;
        long long v60 = *(_OWORD *)&a4->minimumPadding.bottom;
        long long v84 = *(_OWORD *)&a4->minimumPadding.top;
        long long v85 = v60;
        CGPoint v61 = a4->pipAnchorPointOffset;
        CGSize pipStashedSize = a4->pipStashedSize;
        CGPoint v79 = v61;
        CGSize v62 = a4->containerBounds.size;
        CGPoint origin = a4->containerBounds.origin;
        CGSize v81 = v62;
        CGSize v63 = a4->pipLastSteadySize;
        CGSize pipCurrentSize = a4->pipCurrentSize;
        CGSize v77 = v63;
        v64 = [(SBPIPPositionHyperregionLibrary *)self _containerInsetRegionWithGeometry:&pipCurrentSize];
        lastCornersRegion = self->_lastContainerInsetRegion;
        self->_lastContainerInsetRegion = v64;
        goto LABEL_13;
      case 6:
        long long v65 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        long long v86 = *(_OWORD *)&a4->stashedMinimumPadding.top;
        long long v87 = v65;
        long long v88 = *(_OWORD *)&a4->offscreenCorners;
        long long v66 = *(_OWORD *)&a4->edgeInsets.bottom;
        long long v82 = *(_OWORD *)&a4->edgeInsets.top;
        long long v83 = v66;
        long long v67 = *(_OWORD *)&a4->minimumPadding.bottom;
        long long v84 = *(_OWORD *)&a4->minimumPadding.top;
        long long v85 = v67;
        CGPoint v68 = a4->pipAnchorPointOffset;
        CGSize pipStashedSize = a4->pipStashedSize;
        CGPoint v79 = v68;
        CGSize v69 = a4->containerBounds.size;
        CGPoint origin = a4->containerBounds.origin;
        CGSize v81 = v69;
        CGSize v70 = a4->pipLastSteadySize;
        CGSize pipCurrentSize = a4->pipCurrentSize;
        CGSize v77 = v70;
        v71 = [(SBPIPPositionHyperregionLibrary *)self _allUnifiedRegionWithGeometry:&pipCurrentSize];
        lastCornersRegion = self->_lastAllUnified;
        self->_lastAllUnified = v71;
LABEL_13:

        break;
      default:
        break;
    }
    v28 = [(SBPIPPositionHyperregionLibrary *)self _lastKnownRegionForType:a3];
  }
  return v28;
}

- (id)_lastKnownRegionForType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) <= 5) {
    self = (SBPIPPositionHyperregionLibrary *)*((id *)&self->_lastGeometryContext.orientation + a3);
  }
  return self;
}

- (void)_resetLastKnownRegions
{
  lastCornersRegion = self->_lastCornersRegion;
  self->_lastCornersRegion = 0;

  lastStashedLeftRegion = self->_lastStashedLeftRegion;
  self->_lastStashedLeftRegion = 0;

  lastStashedRightRegion = self->_lastStashedRightRegion;
  self->_lastStashedRightRegion = 0;

  lastOffscreenCorners = self->_lastOffscreenCorners;
  self->_lastOffscreenCorners = 0;

  lastContainerInsetRegion = self->_lastContainerInsetRegion;
  self->_lastContainerInsetRegion = 0;

  lastAllUnified = self->_lastAllUnified;
  self->_lastAllUnified = 0;
}

- (id)_cornersRegionWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  v39[4] = *MEMORY[0x1E4F143B8];
  objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F43198]) initWithDimensions:2];
  v39[0] = v5;
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F43198]) initWithDimensions:2];
  v39[1] = v6;
  long long v7 = (void *)[objc_alloc(MEMORY[0x1E4F43198]) initWithDimensions:2];
  v39[2] = v7;
  long long v8 = (void *)[objc_alloc(MEMORY[0x1E4F43198]) initWithDimensions:2];
  v39[3] = v8;
  long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:4];

  long long v10 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v38[10] = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v38[11] = v10;
  v38[12] = *(_OWORD *)&a3->offscreenCorners;
  long long v11 = *(_OWORD *)&a3->edgeInsets.bottom;
  v38[6] = *(_OWORD *)&a3->edgeInsets.top;
  v38[7] = v11;
  long long v12 = *(_OWORD *)&a3->minimumPadding.bottom;
  v38[8] = *(_OWORD *)&a3->minimumPadding.top;
  v38[9] = v12;
  CGPoint pipAnchorPointOffset = a3->pipAnchorPointOffset;
  v38[2] = a3->pipStashedSize;
  v38[3] = pipAnchorPointOffset;
  CGSize size = a3->containerBounds.size;
  v38[4] = a3->containerBounds.origin;
  v38[5] = size;
  CGSize pipLastSteadySize = a3->pipLastSteadySize;
  v38[0] = a3->pipCurrentSize;
  v38[1] = pipLastSteadySize;
  [(SBPIPPositionHyperregionLibrary *)self _validatedInsetRectWithinContainerBoundsWithGeometry:v38];
  CGFloat x = v41.origin.x;
  double y = v41.origin.y;
  CGFloat width = v41.size.width;
  CGFloat height = v41.size.height;
  double MaxY = CGRectGetMaxY(v41);
  v42.origin.CGFloat x = x;
  v42.origin.double y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v42);
  v43.origin.CGFloat x = x;
  v43.origin.double y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double v31 = CGRectGetMaxX(v43);
  v44.origin.CGFloat x = x;
  v44.origin.double y = y;
  v44.size.CGFloat width = width;
  v44.size.CGFloat height = height;
  double v21 = CGRectGetMaxY(v44);
  -[SBPIPPositionHyperregionLibrary _insetRectForEdgeInsets:pipSize:containerBounds:](self, "_insetRectForEdgeInsets:pipSize:containerBounds:", a3->edgeInsets.top, a3->edgeInsets.left, a3->edgeInsets.bottom, a3->edgeInsets.right, a3->pipCurrentSize.width, a3->pipCurrentSize.height, *(void *)&a3->containerBounds.origin.x, *(void *)&a3->containerBounds.origin.y, *(void *)&a3->containerBounds.size.width, *(void *)&a3->containerBounds.size.height);
  if (SBRectContainsPoint()) {
    double v22 = MaxY;
  }
  else {
    double v22 = y;
  }
  double v32 = v22;
  int v23 = SBRectContainsPoint();
  if (v23) {
    double v24 = v31;
  }
  else {
    double v24 = MaxX;
  }
  if (!v23) {
    double v21 = y;
  }
  long long v25 = [v9 objectAtIndexedSubscript:0];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke;
  v37[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(CGFloat *)&v37[4] = x;
  *(double *)&v37[5] = y;
  [v25 _mutateValue:v37];

  long long v26 = [v9 objectAtIndexedSubscript:1];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke_2;
  v36[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(CGFloat *)&v36[4] = x;
  *(double *)&v36[5] = v32;
  [v26 _mutateValue:v36];

  long long v27 = [v9 objectAtIndexedSubscript:2];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke_3;
  v35[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(double *)&v35[4] = v24;
  *(double *)&v35[5] = v21;
  [v27 _mutateValue:v35];

  v28 = [v9 objectAtIndexedSubscript:3];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke_4;
  v34[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(double *)&v34[4] = MaxX;
  *(double *)&v34[5] = y;
  [v28 _mutateValue:v34];

  long long v29 = (void *)[objc_alloc(MEMORY[0x1E4F431A8]) initWithDimensions:2];
  [v29 _setRegions:v9];

  return v29;
}

double __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke_3(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __62__SBPIPPositionHyperregionLibrary__cornersRegionWithGeometry___block_invoke_4(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

- (id)_offscreenCornersRegionWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  if (a3->offscreenCorners == -1)
  {
    double v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBPIPPositionHyperregionLibrary.m", 197, @"Invalid parameter not satisfying: %@", @"geometry.offscreenCorners != UIRectCornerAllCorners" object file lineNumber description];
  }
  v4 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
  unint64_t offscreenCorners = a3->offscreenCorners;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  long long v6 = *(_OWORD *)&a3->minimumPadding.top;
  long long v35 = *(_OWORD *)&a3->minimumPadding.bottom;
  long long v7 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  long long v36 = *(_OWORD *)&a3->stashedMinimumPadding.top;
  long long v37 = v7;
  long long v38 = *(_OWORD *)&a3->offscreenCorners;
  CGPoint origin = a3->containerBounds.origin;
  CGSize size = a3->containerBounds.size;
  long long v9 = *(_OWORD *)&a3->edgeInsets.bottom;
  long long v32 = *(_OWORD *)&a3->edgeInsets.top;
  long long v33 = v9;
  long long v34 = v6;
  CGSize pipCurrentSize = a3->pipCurrentSize;
  CGSize pipLastSteadySize = a3->pipLastSteadySize;
  CGPoint pipAnchorPointOffset = a3->pipAnchorPointOffset;
  CGSize pipStashedSize = a3->pipStashedSize;
  CGPoint v29 = pipAnchorPointOffset;
  CGPoint v30 = origin;
  int v23 = __71__SBPIPPositionHyperregionLibrary__offscreenCornersRegionWithGeometry___block_invoke;
  double v24 = &unk_1E6B07A38;
  CGSize v26 = pipCurrentSize;
  id v12 = v4;
  id v25 = v12;
  long long v13 = v22;
  if (offscreenCorners)
  {
    char v39 = 0;
    uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)offscreenCorners);
    v14.i16[0] = vaddlv_u8(v14);
    int v15 = v14.i32[0];
    if (v14.i32[0])
    {
      unint64_t v16 = 0;
      do
      {
        if (((1 << v16) & offscreenCorners) != 0)
        {
          ((void (*)(void *))v23)(v13);
          if (v39) {
            break;
          }
          --v15;
        }
        if (v16 > 0x3E) {
          break;
        }
        ++v16;
      }
      while (v15 > 0);
    }
  }

  CGSize v17 = (void *)[objc_alloc(MEMORY[0x1E4F431A8]) initWithDimensions:2];
  [v17 _setRegions:v12];

  return v17;
}

void __71__SBPIPPositionHyperregionLibrary__offscreenCornersRegionWithGeometry___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F43198]) initWithDimensions:2];
  double v5 = *(double *)(a1 + 64);
  double v6 = *(double *)(a1 + 56) * 0.5;
  if (a2 == 8 || a2 == 2) {
    double v7 = v6 + CGRectGetMaxX(*(CGRect *)(a1 + 104)) + *(double *)(a1 + 192);
  }
  else {
    double v7 = CGRectGetMinX(*(CGRect *)(a1 + 104)) - *(double *)(a1 + 192) - v6;
  }
  double v8 = v5 * 0.5;
  if (a2 == 8 || a2 == 4) {
    double v9 = v8 + CGRectGetMaxY(*(CGRect *)(a1 + 104)) + *(double *)(a1 + 184);
  }
  else {
    double v9 = CGRectGetMinY(*(CGRect *)(a1 + 104)) - *(double *)(a1 + 168) - v8;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __71__SBPIPPositionHyperregionLibrary__offscreenCornersRegionWithGeometry___block_invoke_2;
  v10[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(double *)&v10[4] = v7;
  *(double *)&v10[5] = v9;
  [v4 _mutateValue:v10];
  [*(id *)(a1 + 32) addObject:v4];
}

double __71__SBPIPPositionHyperregionLibrary__offscreenCornersRegionWithGeometry___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

- (id)_stashedLeftRegionWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F431A8]) initWithDimensions:2];
  long long v6 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v25[10] = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v25[11] = v6;
  v25[12] = *(_OWORD *)&a3->offscreenCorners;
  long long v7 = *(_OWORD *)&a3->edgeInsets.bottom;
  v25[6] = *(_OWORD *)&a3->edgeInsets.top;
  void v25[7] = v7;
  long long v8 = *(_OWORD *)&a3->minimumPadding.bottom;
  v25[8] = *(_OWORD *)&a3->minimumPadding.top;
  v25[9] = v8;
  CGPoint pipAnchorPointOffset = a3->pipAnchorPointOffset;
  v25[2] = a3->pipStashedSize;
  v25[3] = pipAnchorPointOffset;
  CGSize size = a3->containerBounds.size;
  v25[4] = a3->containerBounds.origin;
  v25[5] = size;
  CGSize pipLastSteadySize = a3->pipLastSteadySize;
  v25[0] = a3->pipCurrentSize;
  v25[1] = pipLastSteadySize;
  [(SBPIPPositionHyperregionLibrary *)self _validatedMinimumPaddingAndEdgeInsetInsetRect:v25];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v16 = a3->pipCurrentSize.width * -0.5;
  CGFloat v17 = CGRectGetMinX(a3->containerBounds) + v16;
  v28.size.CGFloat width = 0.0;
  v28.origin.CGFloat x = v17;
  v28.origin.double y = v13;
  v28.size.CGFloat height = v15;
  CGFloat MaxX = CGRectGetMaxX(v28);
  v29.size.CGFloat width = 0.0;
  v29.origin.CGFloat x = v17;
  v29.origin.double y = v13;
  v29.size.CGFloat height = v15;
  CGFloat MaxY = CGRectGetMaxY(v29);
  CGSize v20 = (void *)[objc_alloc(MEMORY[0x1E4F431A0]) initWithDimensions:2];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __66__SBPIPPositionHyperregionLibrary__stashedLeftRegionWithGeometry___block_invoke;
  v24[3] = &__block_descriptor_64_e9_v16__0_d8l;
  *(CGFloat *)&v24[4] = v17;
  *(CGFloat *)&v24[5] = v13;
  v24[6] = 0;
  *(CGFloat *)&v24[7] = v15;
  [v20 _mutateMinimumPoint:v24];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __66__SBPIPPositionHyperregionLibrary__stashedLeftRegionWithGeometry___block_invoke_2;
  v23[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(CGFloat *)&v23[4] = MaxX;
  *(CGFloat *)&v23[5] = MaxY;
  [v20 _mutateMaximumPoint:v23];
  v26[0] = v20;
  double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v5 _setRegions:v21];

  return v5;
}

double __66__SBPIPPositionHyperregionLibrary__stashedLeftRegionWithGeometry___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __66__SBPIPPositionHyperregionLibrary__stashedLeftRegionWithGeometry___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

- (id)_stashedRightRegionWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F431A8]) initWithDimensions:2];
  long long v6 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v25[10] = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v25[11] = v6;
  v25[12] = *(_OWORD *)&a3->offscreenCorners;
  long long v7 = *(_OWORD *)&a3->edgeInsets.bottom;
  v25[6] = *(_OWORD *)&a3->edgeInsets.top;
  void v25[7] = v7;
  long long v8 = *(_OWORD *)&a3->minimumPadding.bottom;
  v25[8] = *(_OWORD *)&a3->minimumPadding.top;
  v25[9] = v8;
  CGPoint pipAnchorPointOffset = a3->pipAnchorPointOffset;
  v25[2] = a3->pipStashedSize;
  v25[3] = pipAnchorPointOffset;
  CGSize size = a3->containerBounds.size;
  v25[4] = a3->containerBounds.origin;
  v25[5] = size;
  CGSize pipLastSteadySize = a3->pipLastSteadySize;
  v25[0] = a3->pipCurrentSize;
  v25[1] = pipLastSteadySize;
  [(SBPIPPositionHyperregionLibrary *)self _validatedMinimumPaddingAndEdgeInsetInsetRect:v25];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v16 = a3->pipCurrentSize.width * 0.5;
  CGFloat v17 = v16 + CGRectGetMaxX(a3->containerBounds);
  v28.size.CGFloat width = 0.0;
  v28.origin.CGFloat x = v17;
  v28.origin.double y = v13;
  v28.size.CGFloat height = v15;
  CGFloat MaxX = CGRectGetMaxX(v28);
  v29.size.CGFloat width = 0.0;
  v29.origin.CGFloat x = v17;
  v29.origin.double y = v13;
  v29.size.CGFloat height = v15;
  CGFloat MaxY = CGRectGetMaxY(v29);
  CGSize v20 = (void *)[objc_alloc(MEMORY[0x1E4F431A0]) initWithDimensions:2];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __67__SBPIPPositionHyperregionLibrary__stashedRightRegionWithGeometry___block_invoke;
  v24[3] = &__block_descriptor_64_e9_v16__0_d8l;
  *(CGFloat *)&v24[4] = v17;
  *(CGFloat *)&v24[5] = v13;
  v24[6] = 0;
  *(CGFloat *)&v24[7] = v15;
  [v20 _mutateMinimumPoint:v24];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __67__SBPIPPositionHyperregionLibrary__stashedRightRegionWithGeometry___block_invoke_2;
  v23[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(CGFloat *)&v23[4] = MaxX;
  *(CGFloat *)&v23[5] = MaxY;
  [v20 _mutateMaximumPoint:v23];
  v26[0] = v20;
  double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  [v5 _setRegions:v21];

  return v5;
}

double __67__SBPIPPositionHyperregionLibrary__stashedRightRegionWithGeometry___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __67__SBPIPPositionHyperregionLibrary__stashedRightRegionWithGeometry___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

- (id)_containerInsetRegionWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F431A8]) initWithDimensions:2];
  long long v6 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v23[10] = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v23[11] = v6;
  v23[12] = *(_OWORD *)&a3->offscreenCorners;
  long long v7 = *(_OWORD *)&a3->edgeInsets.bottom;
  void v23[6] = *(_OWORD *)&a3->edgeInsets.top;
  v23[7] = v7;
  long long v8 = *(_OWORD *)&a3->minimumPadding.bottom;
  v23[8] = *(_OWORD *)&a3->minimumPadding.top;
  v23[9] = v8;
  CGPoint pipAnchorPointOffset = a3->pipAnchorPointOffset;
  v23[2] = a3->pipStashedSize;
  v23[3] = pipAnchorPointOffset;
  CGSize size = a3->containerBounds.size;
  v23[4] = a3->containerBounds.origin;
  v23[5] = size;
  CGSize pipLastSteadySize = a3->pipLastSteadySize;
  v23[0] = a3->pipCurrentSize;
  v23[1] = pipLastSteadySize;
  [(SBPIPPositionHyperregionLibrary *)self _validatedInsetRectWithinContainerBoundsWithGeometry:v23];
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  CGFloat MaxX = CGRectGetMaxX(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v27);
  CGSize v18 = (void *)[objc_alloc(MEMORY[0x1E4F431A0]) initWithDimensions:2];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __69__SBPIPPositionHyperregionLibrary__containerInsetRegionWithGeometry___block_invoke;
  v22[3] = &__block_descriptor_64_e9_v16__0_d8l;
  *(CGFloat *)&v22[4] = x;
  *(CGFloat *)&v22[5] = y;
  *(CGFloat *)&v22[6] = width;
  *(CGFloat *)&v22[7] = height;
  [v18 _mutateMinimumPoint:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __69__SBPIPPositionHyperregionLibrary__containerInsetRegionWithGeometry___block_invoke_2;
  v21[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(CGFloat *)&v21[4] = MaxX;
  *(CGFloat *)&v21[5] = MaxY;
  [v18 _mutateMaximumPoint:v21];
  v24[0] = v18;
  CGSize v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [v5 _setRegions:v19];

  return v5;
}

double __69__SBPIPPositionHyperregionLibrary__containerInsetRegionWithGeometry___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __69__SBPIPPositionHyperregionLibrary__containerInsetRegionWithGeometry___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

- (id)_allUnifiedRegionWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F431A8]) initWithDimensions:2];
  long long v6 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v23[10] = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v23[11] = v6;
  v23[12] = *(_OWORD *)&a3->offscreenCorners;
  long long v7 = *(_OWORD *)&a3->edgeInsets.bottom;
  void v23[6] = *(_OWORD *)&a3->edgeInsets.top;
  v23[7] = v7;
  long long v8 = *(_OWORD *)&a3->minimumPadding.bottom;
  v23[8] = *(_OWORD *)&a3->minimumPadding.top;
  v23[9] = v8;
  CGPoint pipAnchorPointOffset = a3->pipAnchorPointOffset;
  v23[2] = a3->pipStashedSize;
  v23[3] = pipAnchorPointOffset;
  CGSize size = a3->containerBounds.size;
  v23[4] = a3->containerBounds.origin;
  v23[5] = size;
  CGSize pipLastSteadySize = a3->pipLastSteadySize;
  v23[0] = a3->pipCurrentSize;
  v23[1] = pipLastSteadySize;
  [(SBPIPPositionHyperregionLibrary *)self _validatedStashedToStashedMaximumumRectWithGeometry:v23];
  CGFloat x = v26.origin.x;
  CGFloat y = v26.origin.y;
  CGFloat width = v26.size.width;
  CGFloat height = v26.size.height;
  CGFloat MaxX = CGRectGetMaxX(v26);
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  CGFloat MaxY = CGRectGetMaxY(v27);
  CGSize v18 = (void *)[objc_alloc(MEMORY[0x1E4F431A0]) initWithDimensions:2];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  void v22[2] = __65__SBPIPPositionHyperregionLibrary__allUnifiedRegionWithGeometry___block_invoke;
  v22[3] = &__block_descriptor_64_e9_v16__0_d8l;
  *(CGFloat *)&v22[4] = x;
  *(CGFloat *)&v22[5] = y;
  *(CGFloat *)&v22[6] = width;
  *(CGFloat *)&v22[7] = height;
  [v18 _mutateMinimumPoint:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __65__SBPIPPositionHyperregionLibrary__allUnifiedRegionWithGeometry___block_invoke_2;
  v21[3] = &__block_descriptor_48_e9_v16__0_d8l;
  *(CGFloat *)&v21[4] = MaxX;
  *(CGFloat *)&v21[5] = MaxY;
  [v18 _mutateMaximumPoint:v21];
  v24[0] = v18;
  CGSize v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
  [v5 _setRegions:v19];

  return v5;
}

double __65__SBPIPPositionHyperregionLibrary__allUnifiedRegionWithGeometry___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

double __65__SBPIPPositionHyperregionLibrary__allUnifiedRegionWithGeometry___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = *(void *)(a1 + 32);
  double result = *(double *)(a1 + 40);
  *(double *)(a2 + 8) = result;
  return result;
}

- (CGRect)_validatedInsetRectWithinContainerBoundsWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  double width = a3->pipCurrentSize.width;
  double height = a3->pipCurrentSize.height;
  double x = a3->containerBounds.origin.x;
  double y = a3->containerBounds.origin.y;
  double v11 = a3->containerBounds.size.width;
  double v10 = a3->containerBounds.size.height;
  -[SBPIPPositionHyperregionLibrary _insetRectForEdgeInsets:pipSize:containerBounds:](self, "_insetRectForEdgeInsets:pipSize:containerBounds:", a3->edgeInsets.top, a3->edgeInsets.left, a3->edgeInsets.bottom, a3->edgeInsets.right, a3->pipCurrentSize.width, height, *(void *)&x, *(void *)&y, *(void *)&v11, *(void *)&v10);
  CGFloat aRect_24 = v13;
  CGFloat v80 = v12;
  CGFloat aRect_8 = v15;
  CGFloat aRect_16 = v14;
  int v16 = __sb__runningInSpringBoard();
  char v17 = v16;
  if (v16)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_22;
    }
    if (SBFEffectiveHomeButtonType() != 2)
    {
      if (v17) {
        goto LABEL_22;
      }
LABEL_12:

      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v3 userInterfaceIdiom] || SBFEffectiveHomeButtonType() != 2) {
      goto LABEL_12;
    }
  }
  v96.origin.double y = aRect_24;
  v96.origin.double x = v80;
  v96.size.double height = aRect_8;
  v96.size.double width = aRect_16;
  BOOL IsNull = CGRectIsNull(v96);
  BOOL v19 = IsNull;
  if (v17)
  {
    if (!IsNull) {
      goto LABEL_22;
    }
  }
  else
  {

    if (!v19) {
      goto LABEL_22;
    }
  }
  double top = a3->minimumPadding.top;
  double left = a3->minimumPadding.left;
  double bottom = a3->minimumPadding.bottom;
  double right = a3->minimumPadding.right;
  int64_t orientation = a3->orientation;
  if ((unint64_t)(orientation - 3) > 1)
  {
    if (orientation == 1) {
      double top = a3->edgeInsets.top;
    }
    else {
      double bottom = a3->edgeInsets.bottom;
    }
  }
  else if (orientation == 3)
  {
    double left = a3->edgeInsets.left;
  }
  else
  {
    double right = a3->edgeInsets.right;
  }
  v97.origin.double x = x + left;
  v97.origin.double y = y + top;
  v97.size.double width = v11 - (right + left);
  v97.size.double height = v10 - (bottom + top);
  CGRect v98 = CGRectInset(v97, width * 0.5, height * 0.5);
  CGFloat aRect_24 = v98.origin.y;
  CGFloat v80 = v98.origin.x;
  CGFloat aRect_8 = v98.size.height;
  CGFloat aRect_16 = v98.size.width;
LABEL_22:
  -[SBPIPPositionHyperregionLibrary _insetRectForEdgeInsets:pipSize:containerBounds:](self, "_insetRectForEdgeInsets:pipSize:containerBounds:", a3->minimumPadding.top, a3->minimumPadding.left, a3->minimumPadding.bottom, a3->minimumPadding.right, width, height, *(void *)&x, *(void *)&y, *(void *)&v11, *(void *)&v10);
  CGFloat v73 = v11;
  CGFloat v74 = v10;
  CGFloat v72 = y;
  v75.double height = height;
  CGFloat aRect = x;
  double v25 = v99.origin.x;
  v75.double width = width;
  double v26 = v99.origin.y;
  double v27 = v99.size.width;
  double v28 = v99.size.height;
  v114.origin.double y = aRect_24;
  v114.origin.double x = v80;
  v114.size.double height = aRect_8;
  v114.size.double width = aRect_16;
  CGRect v100 = CGRectIntersection(v99, v114);
  double v29 = v100.origin.x;
  double v30 = v100.origin.y;
  double v31 = v100.size.width;
  double v32 = v100.size.height;
  BOOL v33 = CGRectIsNull(v100);
  CGFloat v68 = v28;
  CGFloat v69 = v27;
  if (v33) {
    double v34 = v28;
  }
  else {
    double v34 = v32;
  }
  if (v33) {
    double v35 = v27;
  }
  else {
    double v35 = v31;
  }
  CGFloat v70 = v26;
  CGFloat v71 = v25;
  if (v33) {
    double v36 = v26;
  }
  else {
    double v36 = v30;
  }
  if (v33) {
    double v37 = v25;
  }
  else {
    double v37 = v29;
  }
  CGFloat v38 = v37;
  CGFloat v39 = v36;
  CGFloat v40 = v35;
  CGFloat v41 = v34;
  if (CGRectIsNull(*(CGRect *)(&v34 - 3)))
  {
    -[SBPIPPositionHyperregionLibrary _insetRectForEdgeInsets:pipSize:containerBounds:](self, "_insetRectForEdgeInsets:pipSize:containerBounds:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24), v75, *(void *)&aRect, *(void *)&v72, *(void *)&v73, *(void *)&v74);
    CGFloat v38 = v42;
    CGFloat v39 = v43;
    CGFloat v40 = v44;
    CGFloat v41 = v45;
    long long v46 = SBLogPIP();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v101.origin.double y = aRect_24;
      v101.origin.double x = v80;
      v101.size.double height = aRect_8;
      v101.size.double width = aRect_16;
      CGPoint v47 = NSStringFromRect(v101);
      v102.origin.double y = v70;
      v102.origin.double x = v71;
      v102.size.double height = v68;
      v102.size.double width = v69;
      CGSize v48 = NSStringFromRect(v102);
      CGSize v49 = NSStringFromSize(v75);
      v103.origin.double x = aRect;
      v103.origin.double y = v72;
      v103.size.double width = v73;
      v103.size.double height = v74;
      v50 = NSStringFromRect(v103);
      long long v51 = NSStringFromUIEdgeInsets(a3->minimumPadding);
      v104.origin.double x = v38;
      v104.origin.double y = v39;
      v104.size.double width = v40;
      v104.size.double height = v41;
      long long v52 = NSStringFromRect(v104);
      *(_DWORD *)buf = 134219522;
      long long v82 = self;
      __int16 v83 = 2114;
      long long v84 = v47;
      __int16 v85 = 2114;
      long long v86 = v48;
      __int16 v87 = 2114;
      long long v88 = v49;
      __int16 v89 = 2114;
      v90 = v50;
      __int16 v91 = 2114;
      v92 = v51;
      __int16 v93 = 2114;
      v94 = v52;
      _os_log_error_impl(&dword_1D85BA000, v46, OS_LOG_TYPE_ERROR, "[%p][Layout][Insets] Position Hyperregion Library falling back to maximum rect size as inset rect is still too small. Desired inset rect: %{public}@, minimum inset rect: %{public}@, pipSize: %{public}@, bounds: %{public}@, minimumPadding: %{public}@, using: %{public}@", buf, 0x48u);
    }
  }
  else
  {
    v105.origin.double x = v29;
    v105.origin.double y = v30;
    v105.size.double width = v31;
    v105.size.double height = v32;
    if (!CGRectIsNull(v105)) {
      goto LABEL_41;
    }
    long long v46 = SBLogPIP();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      v109.origin.double y = aRect_24;
      v109.origin.double x = v80;
      v109.size.double height = aRect_8;
      v109.size.double width = aRect_16;
      CGSize v62 = NSStringFromRect(v109);
      v110.origin.double y = v70;
      v110.origin.double x = v71;
      v110.size.double height = v68;
      v110.size.double width = v69;
      CGSize v63 = NSStringFromRect(v110);
      v64 = NSStringFromSize(v75);
      v111.origin.double x = aRect;
      v111.origin.double y = v72;
      v111.size.double width = v73;
      v111.size.double height = v74;
      long long v65 = NSStringFromRect(v111);
      long long v66 = NSStringFromUIEdgeInsets(a3->minimumPadding);
      v112.origin.double x = v38;
      v112.origin.double y = v39;
      v112.size.double width = v40;
      v112.size.double height = v41;
      long long v67 = NSStringFromRect(v112);
      *(_DWORD *)buf = 134219522;
      long long v82 = self;
      __int16 v83 = 2114;
      long long v84 = v62;
      __int16 v85 = 2114;
      long long v86 = v63;
      __int16 v87 = 2114;
      long long v88 = v64;
      __int16 v89 = 2114;
      v90 = v65;
      __int16 v91 = 2114;
      v92 = v66;
      __int16 v93 = 2114;
      v94 = v67;
      _os_log_error_impl(&dword_1D85BA000, v46, OS_LOG_TYPE_ERROR, "[%p][Layout][Insets] Position Hyperregion Library couldn't satisfy required edge insets. Desired inset rect: %{public}@, minimum inset rect: %{public}@, pipSize: %{public}@, bounds: %{public}@, minimumPadding: %{public}@, using: %{public}@", buf, 0x48u);
    }
  }

LABEL_41:
  long long v53 = SBLogPIP();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
  {
    v106.origin.double x = v38;
    v106.origin.double y = v39;
    v106.size.double width = v40;
    v106.size.double height = v41;
    long long v58 = NSStringFromRect(v106);
    long long v59 = NSStringFromUIEdgeInsets(a3->edgeInsets);
    v107.origin.double y = v70;
    v107.origin.double x = v71;
    v107.size.double height = v68;
    v107.size.double width = v69;
    long long v60 = NSStringFromRect(v107);
    v108.origin.double x = v29;
    v108.size.double width = v31;
    v108.origin.double y = v30;
    v108.size.double height = v32;
    CGPoint v61 = NSStringFromRect(v108);
    *(_DWORD *)buf = 134219010;
    long long v82 = self;
    __int16 v83 = 2114;
    long long v84 = v58;
    __int16 v85 = 2114;
    long long v86 = v59;
    __int16 v87 = 2114;
    long long v88 = v60;
    __int16 v89 = 2114;
    v90 = v61;
    _os_log_debug_impl(&dword_1D85BA000, v53, OS_LOG_TYPE_DEBUG, "[%p][Layout][Insets] Validated inset rect: validatedInsetRect%{public}@\t for edgeInsets{%{public}@} minimumInsetRect{%{public}@} insetsIntersection{%{public}@}", buf, 0x34u);
  }
  double v54 = v38;
  double v55 = v39;
  double v56 = v40;
  double v57 = v41;
  result.size.double height = v57;
  result.size.double width = v56;
  result.origin.double y = v55;
  result.origin.double x = v54;
  return result;
}

- (CGRect)_validatedMinimumPaddingAndEdgeInsetInsetRect:(SBPIPPositionGeometryContext *)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  double width = a3->pipStashedSize.width;
  double height = a3->pipStashedSize.height;
  -[SBPIPPositionHyperregionLibrary _insetRectForEdgeInsets:pipSize:containerBounds:](self, "_insetRectForEdgeInsets:pipSize:containerBounds:", a3->stashedMinimumPadding.top, a3->stashedMinimumPadding.left, a3->stashedMinimumPadding.bottom, a3->stashedMinimumPadding.right, width, height, *(void *)&a3->containerBounds.origin.x, *(void *)&a3->containerBounds.origin.y, *(void *)&a3->containerBounds.size.width, *(void *)&a3->containerBounds.size.height);
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v69 = v11;
  CGFloat v14 = v13;
  -[SBPIPPositionHyperregionLibrary _insetRectForEdgeInsets:pipSize:containerBounds:](self, "_insetRectForEdgeInsets:pipSize:containerBounds:", a3->edgeInsets.top, a3->edgeInsets.left, a3->edgeInsets.bottom, a3->edgeInsets.right, width, height, *(void *)&a3->containerBounds.origin.x, *(void *)&a3->containerBounds.origin.y, *(void *)&a3->containerBounds.size.width, *(void *)&a3->containerBounds.size.height);
  CGFloat v16 = v15;
  v99.origin.CGFloat y = v17;
  v99.size.double width = v18;
  v99.size.double height = v19;
  v87.origin.double x = v8;
  v87.origin.CGFloat y = v10;
  v87.size.double width = v12;
  v87.size.double height = v14;
  v99.origin.double x = v16;
  CGFloat v62 = v99.size.width;
  CGFloat y = v99.origin.y;
  CGFloat aRect = v99.size.height;
  CGRect v88 = CGRectIntersection(v87, v99);
  double x = v88.origin.x;
  double v21 = v88.origin.y;
  double v22 = v88.size.width;
  double v23 = v88.size.height;
  BOOL IsNull = CGRectIsNull(v88);
  if (IsNull) {
    double v25 = v8;
  }
  else {
    double v25 = x;
  }
  CGFloat v65 = v8;
  CGFloat v66 = v25;
  CGFloat v64 = v10;
  if (IsNull) {
    CGFloat v26 = v10;
  }
  else {
    CGFloat v26 = v21;
  }
  double v27 = v69;
  if (!IsNull) {
    double v27 = v22;
  }
  CGFloat v67 = v27;
  double v68 = v14;
  if (IsNull) {
    double v28 = v14;
  }
  else {
    double v28 = v23;
  }
  CGFloat v59 = x;
  CGFloat v60 = v21;
  v89.origin.double x = x;
  v89.origin.CGFloat y = v21;
  CGFloat v57 = v22;
  CGFloat v58 = v23;
  v89.size.double width = v22;
  v89.size.double height = v23;
  if (CGRectIsNull(v89))
  {
    double v29 = SBLogPIP();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v95.origin.double x = v16;
      v95.size.double width = v62;
      v95.origin.CGFloat y = y;
      v95.size.double height = aRect;
      long long v51 = NSStringFromRect(v95);
      v96.origin.CGFloat y = v64;
      v96.origin.double x = v65;
      v96.size.double height = v14;
      v96.size.double width = v69;
      long long v52 = NSStringFromRect(v96);
      long long v53 = NSStringFromSize(a3->pipCurrentSize);
      double v54 = NSStringFromRect(a3->containerBounds);
      double v55 = NSStringFromUIEdgeInsets(a3->stashedMinimumPadding);
      v97.origin.double x = v66;
      v97.size.double width = v67;
      v97.origin.CGFloat y = v26;
      v97.size.double height = v28;
      double v56 = NSStringFromRect(v97);
      *(_DWORD *)buf = 134219522;
      CGFloat v71 = self;
      __int16 v72 = 2114;
      CGFloat v73 = v51;
      __int16 v74 = 2114;
      NSSize v75 = v52;
      __int16 v76 = 2114;
      CGSize v77 = v53;
      __int16 v78 = 2114;
      CGPoint v79 = v54;
      __int16 v80 = 2114;
      CGSize v81 = v55;
      __int16 v82 = 2114;
      __int16 v83 = v56;
      _os_log_error_impl(&dword_1D85BA000, v29, OS_LOG_TYPE_ERROR, "[%p][Layout][Insets] Position Hyperregion Library couldn't satisfy required edge insets. Desired inset rect: %{public}@, stashed minimum inset rect: %{public}@, pipSize: %{public}@, bounds: %{public}@, minimumPadding: %{public}@, using: %{public}@", buf, 0x48u);
    }
  }
  CGFloat v30 = v16;
  int v31 = 0;
  if (self->_isPad)
  {
    CGFloat v33 = v26;
    CGFloat v34 = v28;
    CGFloat v35 = v28;
    CGFloat v36 = v26;
    CGFloat v38 = v66;
    CGFloat v37 = v67;
    CGFloat v39 = v66;
  }
  else
  {
    BOOL v32 = v28 / v68 < 0.7;
    CGFloat v33 = v26;
    CGFloat v34 = v28;
    CGFloat v35 = v28;
    CGFloat v36 = v26;
    CGFloat v38 = v66;
    CGFloat v37 = v67;
    CGFloat v39 = v66;
    if (v32)
    {
      int v31 = 1;
      CGFloat v36 = v64;
      CGFloat v39 = v65;
      CGFloat v35 = v68;
      CGFloat v37 = v69;
    }
  }
  CGFloat v40 = SBLogPIP();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
  {
    v90.origin.double x = v39;
    v90.origin.CGFloat y = v36;
    v90.size.double width = v37;
    v90.size.double height = v35;
    double v45 = NSStringFromRect(v90);
    long long v46 = NSStringFromUIEdgeInsets(a3->edgeInsets);
    v91.origin.CGFloat y = v64;
    v91.origin.double x = v65;
    v91.size.double height = v68;
    v91.size.double width = v69;
    CGPoint v47 = NSStringFromRect(v91);
    v92.origin.double x = v30;
    v92.size.double width = v62;
    v92.origin.CGFloat y = y;
    v92.size.double height = aRect;
    CGSize v48 = NSStringFromRect(v92);
    v93.origin.double x = v59;
    v93.origin.CGFloat y = v60;
    v93.size.double width = v57;
    v93.size.double height = v58;
    CGSize v49 = NSStringFromRect(v93);
    v94.origin.double x = v38;
    v94.origin.CGFloat y = v33;
    v94.size.double width = v67;
    v94.size.double height = v34;
    v50 = NSStringFromRect(v94);
    *(_DWORD *)buf = 134219778;
    CGFloat v71 = self;
    __int16 v72 = 2114;
    CGFloat v73 = v45;
    __int16 v74 = 2114;
    NSSize v75 = v46;
    __int16 v76 = 2114;
    CGSize v77 = v47;
    __int16 v78 = 2114;
    CGPoint v79 = v48;
    __int16 v80 = 2114;
    CGSize v81 = v49;
    __int16 v82 = 2114;
    __int16 v83 = v50;
    __int16 v84 = 1024;
    int v85 = v31;
    _os_log_debug_impl(&dword_1D85BA000, v40, OS_LOG_TYPE_DEBUG, "[%p][Layout][Insets] Validated container inset rect for stashed-sized PIP: validatedInsetRect%{public}@\t for edgeInsets{%{public}@} minimumPaddingRect{%{public}@} insetRect{%{public}@} intersection{%{public}@} validatedRect{%{public}@} shouldIgnoreInsetRect{%{BOOL}u}", buf, 0x4Eu);
  }
  double v41 = v39;
  double v42 = v36;
  double v43 = v37;
  double v44 = v35;
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.CGFloat y = v42;
  result.origin.double x = v41;
  return result;
}

- (CGRect)_validatedStashedToStashedMaximumumRectWithGeometry:(SBPIPPositionGeometryContext *)a3
{
  long long v6 = *(_OWORD *)&a3->minimumPadding.bottom;
  long long v7 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  long long v8 = *(_OWORD *)&a3->offscreenCorners;
  long long v52 = *(_OWORD *)&a3->stashedMinimumPadding.top;
  long long v53 = v7;
  long long v54 = v8;
  CGSize size = a3->containerBounds.size;
  long long v10 = *(_OWORD *)&a3->edgeInsets.bottom;
  long long v11 = *(_OWORD *)&a3->minimumPadding.top;
  long long v48 = *(_OWORD *)&a3->edgeInsets.top;
  long long v49 = v10;
  long long v50 = v11;
  long long v51 = v6;
  CGSize pipLastSteadySize = a3->pipLastSteadySize;
  CGPoint pipAnchorPointOffset = a3->pipAnchorPointOffset;
  CGPoint origin = a3->containerBounds.origin;
  CGSize pipStashedSize = a3->pipStashedSize;
  CGPoint v45 = pipAnchorPointOffset;
  double width = a3->pipLastSteadySize.width;
  CGPoint v46 = origin;
  CGSize v47 = size;
  CGSize pipCurrentSize = a3->pipCurrentSize;
  CGSize v43 = pipLastSteadySize;
  [(SBPIPPositionHyperregionLibrary *)self _validatedMinimumPaddingAndEdgeInsetInsetRect:&pipCurrentSize];
  CGFloat v17 = v16;
  CGFloat height = v18;
  double v20 = width * 0.5;
  double v21 = CGRectGetMinX(a3->containerBounds) - width * 0.5;
  double v22 = width + CGRectGetWidth(a3->containerBounds);
  int v23 = __sb__runningInSpringBoard();
  if (!v23)
  {
    uint64_t v3 = [MEMORY[0x1E4F42948] currentDevice];
    if (![v3 userInterfaceIdiom] && SBFEffectiveHomeButtonType() == 2)
    {
      p_int64_t orientation = &a3->orientation;
      unint64_t v27 = a3->orientation - 3;

      if (v27 >= 2) {
        goto LABEL_19;
      }
      goto LABEL_15;
    }
LABEL_13:

    goto LABEL_19;
  }
  char v24 = v23;
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
    goto LABEL_19;
  }
  if (SBFEffectiveHomeButtonType() != 2)
  {
    if (v24) {
      goto LABEL_19;
    }
    goto LABEL_13;
  }
  p_int64_t orientation = &a3->orientation;
  int64_t orientation = a3->orientation;
  if (v24)
  {
    if ((unint64_t)(orientation - 3) > 1) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  if ((unint64_t)(orientation - 3) > 1) {
    goto LABEL_19;
  }
LABEL_15:
  int64_t orientation = *p_orientation;
LABEL_16:
  if (orientation == 3) {
    double v21 = v20;
  }
  double v22 = CGRectGetWidth(a3->containerBounds);
LABEL_19:
  double x = a3->pipAnchorPointOffset.x;
  double y = a3->pipAnchorPointOffset.y;
  if (x != *MEMORY[0x1E4F1DAD8] || y != *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    CGFloat v30 = -fabs(x);
    CGFloat v31 = -fabs(y);
    v55.origin.double x = v21;
    v55.origin.double y = v17;
    v55.size.double width = v22;
    v55.size.CGFloat height = height;
    CGRect v56 = CGRectInset(v55, v30, v31);
    double v21 = v56.origin.x;
    CGFloat v17 = v56.origin.y;
    double v22 = v56.size.width;
    CGFloat height = v56.size.height;
  }
  long long v32 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  long long v52 = *(_OWORD *)&a3->stashedMinimumPadding.top;
  long long v53 = v32;
  long long v54 = *(_OWORD *)&a3->offscreenCorners;
  long long v33 = *(_OWORD *)&a3->edgeInsets.bottom;
  long long v48 = *(_OWORD *)&a3->edgeInsets.top;
  long long v49 = v33;
  long long v34 = *(_OWORD *)&a3->minimumPadding.bottom;
  long long v50 = *(_OWORD *)&a3->minimumPadding.top;
  long long v51 = v34;
  CGPoint v35 = a3->pipAnchorPointOffset;
  CGSize pipStashedSize = a3->pipStashedSize;
  CGPoint v45 = v35;
  CGSize v36 = a3->containerBounds.size;
  CGPoint v46 = a3->containerBounds.origin;
  CGSize v47 = v36;
  CGSize v37 = a3->pipLastSteadySize;
  CGSize pipCurrentSize = a3->pipCurrentSize;
  CGSize v43 = v37;
  [(SBPIPPositionHyperregionLibrary *)self _validatedInsetRectWithinContainerBoundsWithGeometry:&pipCurrentSize];
  v59.origin.double x = v38;
  v59.origin.double y = v39;
  v59.size.double width = v40;
  v59.size.CGFloat height = v41;
  v57.origin.double x = v21;
  v57.origin.double y = v17;
  v57.size.double width = v22;
  v57.size.CGFloat height = height;
  return CGRectUnion(v57, v59);
}

- (CGRect)_insetRectForEdgeInsets:(UIEdgeInsets)a3 pipSize:(CGSize)a4 containerBounds:(CGRect)a5
{
  CGFloat v5 = a3.top + a5.origin.y;
  CGFloat v6 = a5.size.width - (a3.left + a3.right);
  v7.size.CGFloat height = a5.size.height - (a3.top + a3.bottom);
  v7.origin.double x = a3.left + a5.origin.x;
  v7.origin.double y = v5;
  v7.size.double width = v6;
  return CGRectInset(v7, a4.width * 0.5, a4.height * 0.5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastAllUnified, 0);
  objc_storeStrong((id *)&self->_lastContainerInsetRegion, 0);
  objc_storeStrong((id *)&self->_lastOffscreenCorners, 0);
  objc_storeStrong((id *)&self->_lastStashedRightRegion, 0);
  objc_storeStrong((id *)&self->_lastStashedLeftRegion, 0);
  objc_storeStrong((id *)&self->_lastCornersRegion, 0);
}

@end