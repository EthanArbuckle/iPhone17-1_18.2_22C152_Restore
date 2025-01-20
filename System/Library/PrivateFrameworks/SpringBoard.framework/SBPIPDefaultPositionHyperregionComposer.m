@interface SBPIPDefaultPositionHyperregionComposer
- (CGPoint)defaultCornerPositionForLayoutSettingsPosition:(unint64_t)a3 proposedCenter:(CGPoint)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6;
- (SBPIPDefaultPositionHyperregionComposer)init;
- (SBPIPPositionHyperregionComposerDelegate)delegate;
- (SBWindowScene)representedWindowScene;
- (id)_unprunedCornersForGeometry:(SBPIPPositionGeometryContext *)a3;
- (id)positionRegionsForRegions:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5;
- (unint64_t)canonicalPositionForPoint:(CGPoint)a3 proposedPosition:(unint64_t)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6;
- (void)_addRegionWithType:(int64_t)a3 geometry:(SBPIPPositionGeometryContext *)a4 toMap:(id)a5;
- (void)_pruneRegionsMap:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5;
- (void)invalidate;
- (void)setDelegate:(id)a3;
- (void)setRepresentedWindowScene:(id)a3;
@end

@implementation SBPIPDefaultPositionHyperregionComposer

- (SBPIPDefaultPositionHyperregionComposer)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBPIPDefaultPositionHyperregionComposer;
  v2 = [(SBPIPDefaultPositionHyperregionComposer *)&v7 init];
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
    v4 = objc_alloc_init(SBPIPPositionHyperregionLibrary);
    regionsLibrary = v2->_regionsLibrary;
    v2->_regionsLibrary = v4;
  }
  return v2;
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained positionRegionComposerDidInvalidate:self];
}

- (id)positionRegionsForRegions:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5
{
  CGSize v8 = *(CGSize *)&self->_lastInteractionStateContext.projectedPosition.y;
  CGPoint v9 = *(CGPoint *)&self->_lastInteractionStateContext.currentPosition.y;
  CGSize pipStashedSize = *(CGSize *)&self->_lastInteractionStateContext.initialPosition.y;
  CGPoint v99 = v9;
  origin.x = self->_lastInteractionStateContext.projectedPositionStashProgress;
  CGSize pipCurrentSize = *(CGSize *)&self->_lastInteractionStateContext.isStashed;
  CGSize v97 = v8;
  CGPoint v10 = *(CGPoint *)&a5->currentPosition.y;
  CGSize v85 = *(CGSize *)&a5->initialPosition.y;
  CGPoint v86 = v10;
  v87.x = a5->projectedPositionStashProgress;
  CGSize v11 = *(CGSize *)&a5->projectedPosition.y;
  CGSize v83 = *(CGSize *)&a5->isStashed;
  CGSize v84 = v11;
  if ((SBPIPPositionInteractionStateContextIsEqualToContext((unsigned __int8 *)&pipCurrentSize, (unsigned __int8 *)&v83) & 1) == 0)
  {
    *(_OWORD *)&self->_lastInteractionStateContext.isStashed = *(_OWORD *)&a5->isStashed;
    long long v12 = *(_OWORD *)&a5->projectedPosition.y;
    long long v13 = *(_OWORD *)&a5->initialPosition.y;
    long long v14 = *(_OWORD *)&a5->currentPosition.y;
    self->_lastInteractionStateContext.projectedPositionStashProgress = a5->projectedPositionStashProgress;
    *(_OWORD *)&self->_lastInteractionStateContext.initialPosition.y = v13;
    *(_OWORD *)&self->_lastInteractionStateContext.currentPosition.y = v14;
    *(_OWORD *)&self->_lastInteractionStateContext.projectedPosition.y = v12;
    lastResolvedRegionsMap = self->_lastResolvedRegionsMap;
    self->_lastResolvedRegionsMap = 0;
  }
  long long v16 = *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.bottom;
  long long v106 = *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.top;
  long long v107 = v16;
  long long v108 = *(_OWORD *)&self->_lastGeometryContext.offscreenCorners;
  long long v17 = *(_OWORD *)&self->_lastGeometryContext.edgeInsets.bottom;
  long long v102 = *(_OWORD *)&self->_lastGeometryContext.edgeInsets.top;
  long long v103 = v17;
  long long v18 = *(_OWORD *)&self->_lastGeometryContext.minimumPadding.bottom;
  long long v104 = *(_OWORD *)&self->_lastGeometryContext.minimumPadding.top;
  long long v105 = v18;
  CGPoint pipAnchorPointOffset = self->_lastGeometryContext.pipAnchorPointOffset;
  CGSize pipStashedSize = self->_lastGeometryContext.pipStashedSize;
  CGPoint v99 = pipAnchorPointOffset;
  CGSize size = self->_lastGeometryContext.containerBounds.size;
  CGPoint origin = self->_lastGeometryContext.containerBounds.origin;
  CGSize v101 = size;
  CGSize pipLastSteadySize = self->_lastGeometryContext.pipLastSteadySize;
  CGSize pipCurrentSize = self->_lastGeometryContext.pipCurrentSize;
  CGSize v97 = pipLastSteadySize;
  long long v22 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
  long long v93 = *(_OWORD *)&a4->stashedMinimumPadding.top;
  long long v94 = v22;
  long long v95 = *(_OWORD *)&a4->offscreenCorners;
  long long v23 = *(_OWORD *)&a4->edgeInsets.bottom;
  long long v89 = *(_OWORD *)&a4->edgeInsets.top;
  long long v90 = v23;
  long long v24 = *(_OWORD *)&a4->minimumPadding.bottom;
  long long v91 = *(_OWORD *)&a4->minimumPadding.top;
  long long v92 = v24;
  CGPoint v25 = a4->pipAnchorPointOffset;
  CGSize v85 = a4->pipStashedSize;
  CGPoint v86 = v25;
  CGSize v26 = a4->containerBounds.size;
  CGPoint v87 = a4->containerBounds.origin;
  CGSize v88 = v26;
  CGSize v27 = a4->pipLastSteadySize;
  CGSize v83 = a4->pipCurrentSize;
  CGSize v84 = v27;
  if ((SBPIPPositionGeometryContextIsEqualToContext((uint64_t)&pipCurrentSize, (uint64_t)&v83) & 1) == 0)
  {
    self->_lastGeometryContext.CGSize pipCurrentSize = a4->pipCurrentSize;
    CGSize v28 = a4->pipLastSteadySize;
    CGSize v29 = a4->pipStashedSize;
    CGPoint v30 = a4->containerBounds.origin;
    self->_lastGeometryContext.CGPoint pipAnchorPointOffset = a4->pipAnchorPointOffset;
    self->_lastGeometryContext.containerBounds.CGPoint origin = v30;
    self->_lastGeometryContext.CGSize pipLastSteadySize = v28;
    self->_lastGeometryContext.CGSize pipStashedSize = v29;
    CGSize v31 = a4->containerBounds.size;
    long long v32 = *(_OWORD *)&a4->edgeInsets.top;
    long long v33 = *(_OWORD *)&a4->minimumPadding.top;
    *(_OWORD *)&self->_lastGeometryContext.edgeInsets.bottom = *(_OWORD *)&a4->edgeInsets.bottom;
    *(_OWORD *)&self->_lastGeometryContext.minimumPadding.top = v33;
    self->_lastGeometryContext.containerBounds.CGSize size = v31;
    *(_OWORD *)&self->_lastGeometryContext.edgeInsets.top = v32;
    long long v34 = *(_OWORD *)&a4->minimumPadding.bottom;
    long long v35 = *(_OWORD *)&a4->stashedMinimumPadding.top;
    long long v36 = *(_OWORD *)&a4->offscreenCorners;
    *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.bottom = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
    *(_OWORD *)&self->_lastGeometryContext.offscreenCorners = v36;
    *(_OWORD *)&self->_lastGeometryContext.minimumPadding.bottom = v34;
    *(_OWORD *)&self->_lastGeometryContext.stashedMinimumPadding.top = v35;
    v37 = self->_lastResolvedRegionsMap;
    self->_lastResolvedRegionsMap = 0;

    lastRegionsMap = self->_lastRegionsMap;
    self->_lastRegionsMap = 0;
  }
  v39 = self->_lastResolvedRegionsMap;
  if (!v39)
  {
    if (!self->_lastRegionsMap)
    {
      v40 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:3];
      long long v41 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
      long long v106 = *(_OWORD *)&a4->stashedMinimumPadding.top;
      long long v107 = v41;
      long long v108 = *(_OWORD *)&a4->offscreenCorners;
      long long v42 = *(_OWORD *)&a4->edgeInsets.bottom;
      long long v102 = *(_OWORD *)&a4->edgeInsets.top;
      long long v103 = v42;
      long long v43 = *(_OWORD *)&a4->minimumPadding.bottom;
      long long v104 = *(_OWORD *)&a4->minimumPadding.top;
      long long v105 = v43;
      CGPoint v44 = a4->pipAnchorPointOffset;
      CGSize pipStashedSize = a4->pipStashedSize;
      CGPoint v99 = v44;
      CGSize v45 = a4->containerBounds.size;
      CGPoint origin = a4->containerBounds.origin;
      CGSize v101 = v45;
      CGSize v46 = a4->pipLastSteadySize;
      CGSize pipCurrentSize = a4->pipCurrentSize;
      CGSize v97 = v46;
      [(SBPIPDefaultPositionHyperregionComposer *)self _addRegionWithType:1 geometry:&pipCurrentSize toMap:v40];
      long long v47 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
      long long v106 = *(_OWORD *)&a4->stashedMinimumPadding.top;
      long long v107 = v47;
      long long v108 = *(_OWORD *)&a4->offscreenCorners;
      long long v48 = *(_OWORD *)&a4->edgeInsets.bottom;
      long long v102 = *(_OWORD *)&a4->edgeInsets.top;
      long long v103 = v48;
      long long v49 = *(_OWORD *)&a4->minimumPadding.bottom;
      long long v104 = *(_OWORD *)&a4->minimumPadding.top;
      long long v105 = v49;
      CGPoint v50 = a4->pipAnchorPointOffset;
      CGSize pipStashedSize = a4->pipStashedSize;
      CGPoint v99 = v50;
      CGSize v51 = a4->containerBounds.size;
      CGPoint origin = a4->containerBounds.origin;
      CGSize v101 = v51;
      CGSize v52 = a4->pipLastSteadySize;
      CGSize pipCurrentSize = a4->pipCurrentSize;
      CGSize v97 = v52;
      [(SBPIPDefaultPositionHyperregionComposer *)self _addRegionWithType:2 geometry:&pipCurrentSize toMap:v40];
      long long v53 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
      long long v106 = *(_OWORD *)&a4->stashedMinimumPadding.top;
      long long v107 = v53;
      long long v108 = *(_OWORD *)&a4->offscreenCorners;
      long long v54 = *(_OWORD *)&a4->edgeInsets.bottom;
      long long v102 = *(_OWORD *)&a4->edgeInsets.top;
      long long v103 = v54;
      long long v55 = *(_OWORD *)&a4->minimumPadding.bottom;
      long long v104 = *(_OWORD *)&a4->minimumPadding.top;
      long long v105 = v55;
      CGPoint v56 = a4->pipAnchorPointOffset;
      CGSize pipStashedSize = a4->pipStashedSize;
      CGPoint v99 = v56;
      CGSize v57 = a4->containerBounds.size;
      CGPoint origin = a4->containerBounds.origin;
      CGSize v101 = v57;
      CGSize v58 = a4->pipLastSteadySize;
      CGSize pipCurrentSize = a4->pipCurrentSize;
      CGSize v97 = v58;
      [(SBPIPDefaultPositionHyperregionComposer *)self _addRegionWithType:3 geometry:&pipCurrentSize toMap:v40];
      v59 = self->_lastRegionsMap;
      self->_lastRegionsMap = v40;
    }
    v60 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_lastRegionsMap];
    if (a5->hasActiveGesture)
    {
      long long v61 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
      long long v106 = *(_OWORD *)&a4->stashedMinimumPadding.top;
      long long v107 = v61;
      long long v108 = *(_OWORD *)&a4->offscreenCorners;
      long long v62 = *(_OWORD *)&a4->edgeInsets.bottom;
      long long v102 = *(_OWORD *)&a4->edgeInsets.top;
      long long v103 = v62;
      long long v63 = *(_OWORD *)&a4->minimumPadding.bottom;
      long long v104 = *(_OWORD *)&a4->minimumPadding.top;
      long long v105 = v63;
      CGPoint v64 = a4->pipAnchorPointOffset;
      CGSize pipStashedSize = a4->pipStashedSize;
      CGPoint v99 = v64;
      CGSize v65 = a4->containerBounds.size;
      CGPoint origin = a4->containerBounds.origin;
      CGSize v101 = v65;
      CGSize v66 = a4->pipLastSteadySize;
      CGSize pipCurrentSize = a4->pipCurrentSize;
      CGSize v97 = v66;
      [(SBPIPDefaultPositionHyperregionComposer *)self _addRegionWithType:6 geometry:&pipCurrentSize toMap:v60];
    }
    else
    {
      if (a5->isFreelyPositionable)
      {
        long long v67 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
        long long v106 = *(_OWORD *)&a4->stashedMinimumPadding.top;
        long long v107 = v67;
        long long v108 = *(_OWORD *)&a4->offscreenCorners;
        long long v68 = *(_OWORD *)&a4->edgeInsets.bottom;
        long long v102 = *(_OWORD *)&a4->edgeInsets.top;
        long long v103 = v68;
        long long v69 = *(_OWORD *)&a4->minimumPadding.bottom;
        long long v104 = *(_OWORD *)&a4->minimumPadding.top;
        long long v105 = v69;
        CGPoint v70 = a4->pipAnchorPointOffset;
        CGSize pipStashedSize = a4->pipStashedSize;
        CGPoint v99 = v70;
        CGSize v71 = a4->containerBounds.size;
        CGPoint origin = a4->containerBounds.origin;
        CGSize v101 = v71;
        CGSize v72 = a4->pipLastSteadySize;
        CGSize pipCurrentSize = a4->pipCurrentSize;
        CGSize v97 = v72;
        [(SBPIPDefaultPositionHyperregionComposer *)self _addRegionWithType:5 geometry:&pipCurrentSize toMap:v60];
      }
      long long v73 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
      long long v106 = *(_OWORD *)&a4->stashedMinimumPadding.top;
      long long v107 = v73;
      long long v108 = *(_OWORD *)&a4->offscreenCorners;
      long long v74 = *(_OWORD *)&a4->edgeInsets.bottom;
      long long v102 = *(_OWORD *)&a4->edgeInsets.top;
      long long v103 = v74;
      long long v75 = *(_OWORD *)&a4->minimumPadding.bottom;
      long long v104 = *(_OWORD *)&a4->minimumPadding.top;
      long long v105 = v75;
      CGPoint v76 = a4->pipAnchorPointOffset;
      CGSize pipStashedSize = a4->pipStashedSize;
      CGPoint v99 = v76;
      CGSize v77 = a4->containerBounds.size;
      CGPoint origin = a4->containerBounds.origin;
      CGSize v101 = v77;
      CGSize v78 = a4->pipLastSteadySize;
      CGSize pipCurrentSize = a4->pipCurrentSize;
      CGSize v97 = v78;
      CGPoint v79 = *(CGPoint *)&a5->currentPosition.y;
      CGSize v85 = *(CGSize *)&a5->initialPosition.y;
      CGPoint v86 = v79;
      v87.x = a5->projectedPositionStashProgress;
      CGSize v80 = *(CGSize *)&a5->projectedPosition.y;
      CGSize v83 = *(CGSize *)&a5->isStashed;
      CGSize v84 = v80;
      [(SBPIPDefaultPositionHyperregionComposer *)self _pruneRegionsMap:v60 geometry:&pipCurrentSize interaction:&v83];
    }
    v81 = self->_lastResolvedRegionsMap;
    self->_lastResolvedRegionsMap = v60;

    v39 = self->_lastResolvedRegionsMap;
  }
  return v39;
}

- (id)_unprunedCornersForGeometry:(SBPIPPositionGeometryContext *)a3
{
  regionsLibrary = self->_regionsLibrary;
  long long v4 = *(_OWORD *)&a3->stashedMinimumPadding.bottom;
  v12[10] = *(_OWORD *)&a3->stashedMinimumPadding.top;
  v12[11] = v4;
  v12[12] = *(_OWORD *)&a3->offscreenCorners;
  long long v5 = *(_OWORD *)&a3->edgeInsets.bottom;
  v12[6] = *(_OWORD *)&a3->edgeInsets.top;
  v12[7] = v5;
  long long v6 = *(_OWORD *)&a3->minimumPadding.bottom;
  v12[8] = *(_OWORD *)&a3->minimumPadding.top;
  v12[9] = v6;
  CGPoint pipAnchorPointOffset = a3->pipAnchorPointOffset;
  v12[2] = a3->pipStashedSize;
  v12[3] = pipAnchorPointOffset;
  CGSize size = a3->containerBounds.size;
  v12[4] = a3->containerBounds.origin;
  v12[5] = size;
  CGSize pipLastSteadySize = a3->pipLastSteadySize;
  v12[0] = a3->pipCurrentSize;
  v12[1] = pipLastSteadySize;
  CGPoint v10 = [(SBPIPPositionHyperregionLibrary *)regionsLibrary regionWithType:1 geometry:v12];
  return v10;
}

- (unint64_t)canonicalPositionForPoint:(CGPoint)a3 proposedPosition:(unint64_t)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6
{
  CGPoint v18 = a3;
  long long v7 = *(_OWORD *)&a5->stashedMinimumPadding.bottom;
  v17[10] = *(_OWORD *)&a5->stashedMinimumPadding.top;
  v17[11] = v7;
  v17[12] = *(_OWORD *)&a5->offscreenCorners;
  long long v8 = *(_OWORD *)&a5->edgeInsets.bottom;
  v17[6] = *(_OWORD *)&a5->edgeInsets.top;
  v17[7] = v8;
  long long v9 = *(_OWORD *)&a5->minimumPadding.bottom;
  v17[8] = *(_OWORD *)&a5->minimumPadding.top;
  v17[9] = v9;
  CGPoint pipAnchorPointOffset = a5->pipAnchorPointOffset;
  v17[2] = a5->pipStashedSize;
  v17[3] = pipAnchorPointOffset;
  CGSize size = a5->containerBounds.size;
  v17[4] = a5->containerBounds.origin;
  v17[5] = size;
  CGSize pipLastSteadySize = a5->pipLastSteadySize;
  v17[0] = a5->pipCurrentSize;
  v17[1] = pipLastSteadySize;
  long long v13 = [(SBPIPDefaultPositionHyperregionComposer *)self _unprunedCornersForGeometry:v17];
  uint64_t v14 = [v13 _regionIndexForClosestPoint:0 toPoint:&v18];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = SBLogPIP();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[SBPIPDefaultPositionHyperregionComposer canonicalPositionForPoint:proposedPosition:geometry:interaction:]();
    }

    uint64_t v14 = a4;
  }

  return v14;
}

- (CGPoint)defaultCornerPositionForLayoutSettingsPosition:(unint64_t)a3 proposedCenter:(CGPoint)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6
{
  long long v7 = *(_OWORD *)&a5->stashedMinimumPadding.bottom;
  v21[10] = *(_OWORD *)&a5->stashedMinimumPadding.top;
  v21[11] = v7;
  v21[12] = *(_OWORD *)&a5->offscreenCorners;
  long long v8 = *(_OWORD *)&a5->edgeInsets.bottom;
  v21[6] = *(_OWORD *)&a5->edgeInsets.top;
  v21[7] = v8;
  long long v9 = *(_OWORD *)&a5->minimumPadding.bottom;
  v21[8] = *(_OWORD *)&a5->minimumPadding.top;
  v21[9] = v9;
  CGPoint pipAnchorPointOffset = a5->pipAnchorPointOffset;
  v21[2] = a5->pipStashedSize;
  v21[3] = pipAnchorPointOffset;
  CGSize size = a5->containerBounds.size;
  v21[4] = a5->containerBounds.origin;
  v21[5] = size;
  CGSize pipLastSteadySize = a5->pipLastSteadySize;
  v21[0] = a5->pipCurrentSize;
  v21[1] = pipLastSteadySize;
  long long v13 = [(SBPIPDefaultPositionHyperregionComposer *)self _unprunedCornersForGeometry:v21];
  uint64_t v14 = [v13 _regions];

  v15 = [v14 objectAtIndex:a3];
  long long v16 = (double *)[v15 _value];

  double v17 = *v16;
  double v18 = v16[1];

  double v19 = v17;
  double v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (void)_addRegionWithType:(int64_t)a3 geometry:(SBPIPPositionGeometryContext *)a4 toMap:(id)a5
{
  regionsLibrary = self->_regionsLibrary;
  long long v7 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
  long long v26 = *(_OWORD *)&a4->stashedMinimumPadding.top;
  long long v27 = v7;
  long long v28 = *(_OWORD *)&a4->offscreenCorners;
  long long v8 = *(_OWORD *)&a4->edgeInsets.bottom;
  long long v22 = *(_OWORD *)&a4->edgeInsets.top;
  long long v23 = v8;
  long long v9 = *(_OWORD *)&a4->minimumPadding.bottom;
  long long v24 = *(_OWORD *)&a4->minimumPadding.top;
  long long v25 = v9;
  CGPoint pipAnchorPointOffset = a4->pipAnchorPointOffset;
  CGSize pipStashedSize = a4->pipStashedSize;
  CGPoint v19 = pipAnchorPointOffset;
  CGSize size = a4->containerBounds.size;
  CGPoint origin = a4->containerBounds.origin;
  CGSize v21 = size;
  CGSize pipLastSteadySize = a4->pipLastSteadySize;
  CGSize pipCurrentSize = a4->pipCurrentSize;
  CGSize v17 = pipLastSteadySize;
  id v13 = a5;
  uint64_t v14 = [(SBPIPPositionHyperregionLibrary *)regionsLibrary regionWithType:a3 geometry:&pipCurrentSize];
  v15 = objc_msgSend(NSNumber, "numberWithInteger:", a3, pipCurrentSize, v17, pipStashedSize, v19, origin, v21, v22, v23, v24, v25, v26, v27, v28);
  [v13 setObject:v14 forKey:v15];
}

- (void)_pruneRegionsMap:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5
{
  id v9 = a3;
  CGPoint v10 = v9;
  if (!a5->isInteractive && a5->isStashed) {
    [v9 removeObjectForKey:&unk_1F334AB68];
  }
  double Width = CGRectGetWidth(a4->containerBounds);
  double v12 = CGRectGetWidth(a4->containerBounds);
  double v13 = CGRectGetWidth(a4->containerBounds);
  if (self->_isPad) {
    double v14 = 6.0;
  }
  else {
    double v14 = 2.0;
  }
  double x = a5->initialPosition.x;
  double v16 = a5->currentPosition.x;
  double projectedPositionStashProgress = a5->projectedPositionStashProgress;
  double currentPositionStashProgress = a5->currentPositionStashProgress;
  int v18 = __sb__runningInSpringBoard();
  if (!v18)
  {
    long long v5 = [MEMORY[0x1E4F42948] currentDevice];
    if (![v5 userInterfaceIdiom] && SBFEffectiveHomeButtonType() == 2)
    {
      p_int64_t orientation = &a4->orientation;
      unint64_t v22 = a4->orientation - 3;

      if (v22 >= 2) {
        goto LABEL_30;
      }
      goto LABEL_21;
    }
LABEL_19:

    goto LABEL_30;
  }
  char v19 = v18;
  if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
    goto LABEL_30;
  }
  if (SBFEffectiveHomeButtonType() != 2)
  {
    if (v19) {
      goto LABEL_30;
    }
    goto LABEL_19;
  }
  p_int64_t orientation = &a4->orientation;
  int64_t orientation = a4->orientation;
  if (v19)
  {
    if ((unint64_t)(orientation - 3) > 1) {
      goto LABEL_30;
    }
    goto LABEL_22;
  }
  if ((unint64_t)(orientation - 3) > 1) {
    goto LABEL_30;
  }
LABEL_21:
  int64_t orientation = *p_orientation;
LABEL_22:
  long long v23 = SBLogPIP();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
  if (orientation == 3)
  {
    if (v24) {
      -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.9();
    }

    long long v25 = &unk_1F334AB80;
  }
  else
  {
    if (v24) {
      -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:]0();
    }

    long long v25 = &unk_1F334AB98;
  }
  [v10 removeObjectForKey:v25];
LABEL_30:
  if (!a5->isInteractive) {
    goto LABEL_71;
  }
  double v26 = Width * 0.5;
  if (a5->isStashed)
  {
    double v27 = v13 / v14;
    if (x >= v27 + CGRectGetMinX(a4->containerBounds) || v16 >= v27 + CGRectGetMinX(a4->containerBounds))
    {
      if (x <= CGRectGetMaxX(a4->containerBounds) - v27 || v16 <= CGRectGetMaxX(a4->containerBounds) - v27)
      {
LABEL_43:
        if (projectedPositionStashProgress < 0.15)
        {
          CGSize v46 = SBLogPIP();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG)) {
            -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.6();
          }

          [v10 removeObjectForKey:&unk_1F334AB80];
          [v10 removeObjectForKey:&unk_1F334AB98];
        }
        goto LABEL_47;
      }
      v39 = SBLogPIP();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.8();
      }

      CGSize v29 = [v10 objectForKey:&unk_1F334AB68];
      CGPoint v30 = (void *)[v29 copy];
      v40 = (void *)MEMORY[0x1E4F1CA48];
      long long v41 = [v30 _regions];
      long long v33 = [v40 arrayWithArray:v41];

      long long v42 = [v29 _regions];
      long long v43 = [v42 objectAtIndex:0];
      [v33 removeObject:v43];

      CGPoint v44 = [v29 _regions];
      CGSize v45 = [v44 objectAtIndex:1];
      [v33 removeObject:v45];

      [v30 _setRegions:v33];
      v38 = &unk_1F334AB80;
    }
    else
    {
      long long v28 = SBLogPIP();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.7();
      }

      CGSize v29 = [v10 objectForKey:&unk_1F334AB68];
      CGPoint v30 = (void *)[v29 copy];
      CGSize v31 = (void *)MEMORY[0x1E4F1CA48];
      long long v32 = [v30 _regions];
      long long v33 = [v31 arrayWithArray:v32];

      long long v34 = [v29 _regions];
      long long v35 = [v34 objectAtIndex:3];
      [v33 removeObject:v35];

      long long v36 = [v29 _regions];
      v37 = [v36 objectAtIndex:2];
      [v33 removeObject:v37];

      [v30 _setRegions:v33];
      v38 = &unk_1F334AB98;
    }
    [v10 setObject:v30 forKey:&unk_1F334AB68];
    [v10 removeObjectForKey:v38];

    goto LABEL_43;
  }
LABEL_47:
  double v47 = v12 / 6.0;
  double v48 = v26 + CGRectGetMinX(a4->containerBounds);
  double v49 = v26 + CGRectGetMinX(a4->containerBounds);
  if (x < v48)
  {
    if (v16 < v49)
    {
      CGPoint v50 = SBLogPIP();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
        -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:]();
      }

      [v10 removeObjectForKey:&unk_1F334AB98];
      if (!a5->isStashed && !self->_isPad && currentPositionStashProgress < 0.25)
      {
        CGSize v51 = SBLogPIP();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
          -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:]();
        }
LABEL_69:
        CGSize v52 = &unk_1F334AB80;
        goto LABEL_70;
      }
      goto LABEL_71;
    }
    if (v16 >= CGRectGetMaxX(a4->containerBounds) - v47) {
      goto LABEL_71;
    }
    CGSize v51 = SBLogPIP();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
      -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:]();
    }
LABEL_65:
    CGSize v52 = &unk_1F334AB98;
LABEL_70:

    [v10 removeObjectForKey:v52];
    goto LABEL_71;
  }
  if (v16 > v49)
  {
    [v10 removeObjectForKey:&unk_1F334AB80];
    if (a5->isStashed || self->_isPad || currentPositionStashProgress >= 0.25) {
      goto LABEL_71;
    }
    CGSize v51 = SBLogPIP();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
      -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.4();
    }
    goto LABEL_65;
  }
  if (v16 > CGRectGetMaxX(a4->containerBounds) - v47)
  {
    CGSize v51 = SBLogPIP();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG)) {
      -[SBPIPDefaultPositionHyperregionComposer _pruneRegionsMap:geometry:interaction:].cold.5();
    }
    goto LABEL_69;
  }
LABEL_71:
}

- (SBPIPPositionHyperregionComposerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBPIPPositionHyperregionComposerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SBWindowScene)representedWindowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_representedWindowScene);
  return (SBWindowScene *)WeakRetained;
}

- (void)setRepresentedWindowScene:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_representedWindowScene);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastResolvedRegionsMap, 0);
  objc_storeStrong((id *)&self->_lastRegionsMap, 0);
  objc_storeStrong((id *)&self->_regionsLibrary, 0);
}

- (void)canonicalPositionForPoint:proposedPosition:geometry:interaction:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D85BA000, v1, OS_LOG_TYPE_ERROR, "Unexpectedly could not find index for cornersRegion: %{public}@; controller %{public}@",
    v2,
    0x16u);
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%p][Layout][Regions] Position: removing left hand side stash region. Interaction began and ended on the left side but not close enough to the stashed region.", v2, v3, v4, v5, v6);
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%p][Layout][Regions] Position: removing right hand side stash region since interaction began and ended on the left.", v2, v3, v4, v5, v6);
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%p][Layout][Regions] Position: removing right hand side stash region. Interaction began on the left and ended on the right hand side, but not close enough to the right edge.", v2, v3, v4, v5, v6);
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%p][Layout][Regions] Position: removing right hand side stash region. Interaction began and ended on the right side but not close enough to the stashed region.", v2, v3, v4, v5, v6);
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.5()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%p][Layout][Regions] Position: removing left hand side stash region. Interaction began on the right and ended on the left hand side, but not close enough to the left edge.", v2, v3, v4, v5, v6);
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.6()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%p][Layout][Regions] Position: removing stash regions since interaction ended not stashed.", v2, v3, v4, v5, v6);
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.7()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%p][Layout][Regions] Position: removing right hand side regions since interaction started stashed, left side.", v2, v3, v4, v5, v6);
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.8()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%p][Layout][Regions] Position: removing left hand side regions since interaction started stashed, right side.", v2, v3, v4, v5, v6);
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.9()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%p][Layout][Regions] Position: removing left stash region since in landscape right orientation on a notched phone.", v2, v3, v4, v5, v6);
}

- (void)_pruneRegionsMap:geometry:interaction:.cold.10()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1D85BA000, v0, v1, "[%p][Layout][Regions] Position: removing right stash region since in landscape left orientation on a notched phone.", v2, v3, v4, v5, v6);
}

@end