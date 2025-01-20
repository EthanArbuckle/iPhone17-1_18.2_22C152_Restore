@interface SBSystemNotesPositionHyperregionComposer
- (NSString)description;
- (SBPIPPositionHyperregionComposerDelegate)delegate;
- (SBSystemNotesPositionHyperregionComposer)init;
- (id)positionRegionsForRegions:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5;
- (unint64_t)canonicalPositionForPoint:(CGPoint)a3 proposedPosition:(unint64_t)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6;
- (void)_addOffscreenCornersToRegions:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4;
- (void)_setupStateCapture;
- (void)dealloc;
- (void)invalidate;
- (void)performActionsWithTransientStateChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setupForEdgeProtectCornerSwipe;
- (void)setupForInteractiveCornerGesture;
- (void)setupForInteractiveCornerGestureEnd;
- (void)setupForInteractiveDismissalToSize:(CGSize)a3;
- (void)setupForStandardBehavior;
- (void)setupForSwipesFromCorners:(unint64_t)a3 animated:(BOOL)a4;
@end

@implementation SBSystemNotesPositionHyperregionComposer

- (SBSystemNotesPositionHyperregionComposer)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBSystemNotesPositionHyperregionComposer;
  v2 = [(SBSystemNotesPositionHyperregionComposer *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_state = 0;
    v4 = objc_alloc_init(SBPIPPositionHyperregionLibrary);
    regionsLibrary = v3->_regionsLibrary;
    v3->_regionsLibrary = v4;

    v3->_animationState = 2;
    [(SBSystemNotesPositionHyperregionComposer *)v3 _setupStateCapture];
  }
  return v3;
}

- (void)dealloc
{
  [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSystemNotesPositionHyperregionComposer;
  [(SBSystemNotesPositionHyperregionComposer *)&v3 dealloc];
}

- (void)_setupStateCapture
{
  [(BSInvalidatable *)self->_stateCaptureInvalidatable invalidate];
  objc_initWeak(&location, self);
  objc_super v3 = objc_msgSend(NSString, "stringWithFormat:", @"PictureInPicture - SBSystemNotesPositionHyperregionComposer - %p", self);
  id v4 = MEMORY[0x1E4F14428];
  objc_copyWeak(&v7, &location);
  BSLogAddStateCaptureBlockWithTitle();
  v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  stateCaptureInvalidatable = self->_stateCaptureInvalidatable;
  self->_stateCaptureInvalidatable = v5;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

id __62__SBSystemNotesPositionHyperregionComposer__setupStateCapture__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v3 = [WeakRetained description];
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

- (NSString)description
{
  v16[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)SBSystemNotesPositionHyperregionComposer;
  id v4 = [(SBSystemNotesPositionHyperregionComposer *)&v14 description];
  v15[0] = @"State";
  v5 = [NSNumber numberWithUnsignedInteger:self->_state];
  v16[0] = v5;
  v15[1] = @"Animation State";
  v6 = [NSNumber numberWithUnsignedInt:self->_animationState];
  v16[1] = v6;
  v15[2] = @"Offscreen Corners";
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:self->_offscreenCorners];
  v8 = (void *)v7;
  v15[3] = @"Regions Library";
  regionsLibrary = self->_regionsLibrary;
  if (!regionsLibrary) {
    regionsLibrary = (SBPIPPositionHyperregionLibrary *)&stru_1F3084718;
  }
  v16[2] = v7;
  v16[3] = regionsLibrary;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:4];
  v11 = [v10 description];
  v12 = [v3 stringWithFormat:@"%@\n%@", v4, v11];

  return (NSString *)v12;
}

- (void)performActionsWithTransientStateChange:(id)a3
{
  unint64_t state = self->_state;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  if (self->_state != state)
  {
    self->_unint64_t state = state;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained positionRegionComposerNeedsUpdate:self behavior:self->_animationState];
  }
}

- (void)setupForSwipesFromCorners:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a4) {
    int v7 = 2;
  }
  else {
    int v7 = 0;
  }
  if (self->_state != 1 || self->_offscreenCorners != a3 || self->_animationState != v7)
  {
    self->_unint64_t state = 1;
    self->_offscreenCorners = a3;
    self->_animationState = v7;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained positionRegionComposerNeedsUpdate:self behavior:self->_animationState];

    v9 = SBLogPIP();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = _SBFLoggingMethodProem();
      v11 = [MEMORY[0x1E4F28E78] string];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v18 = __SBNSStringFromUIRectCorner_block_invoke;
      v19 = &unk_1E6AF5510;
      id v12 = v11;
      id v20 = v12;
      v13 = v17;
      if (a3)
      {
        buf[0] = 0;
        uint8x8_t v14 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
        v14.i16[0] = vaddlv_u8(v14);
        int v15 = v14.i32[0];
        if (v14.i32[0])
        {
          unint64_t v16 = 0;
          do
          {
            if (((1 << v16) & a3) != 0)
            {
              ((void (*)(void *))v18)(v13);
              if (buf[0]) {
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

      *(_DWORD *)buf = 138543874;
      v22 = v10;
      __int16 v23 = 2114;
      id v24 = v12;
      __int16 v25 = 1024;
      BOOL v26 = v4;
      _os_log_debug_impl(&dword_1D85BA000, v9, OS_LOG_TYPE_DEBUG, "[%{public}@][Hyper] corners: %{public}@ animated: %{BOOL}u", buf, 0x1Cu);
    }
  }
}

- (void)setupForInteractiveCornerGesture
{
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_26();
  v0 = _SBFLoggingMethodProem();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_1D85BA000, v1, v2, "[%{public}@][Hyper]", v3, v4, v5, v6, v7);
}

- (void)setupForInteractiveCornerGestureEnd
{
  if (self->_state != 3)
  {
    self->_unint64_t state = 3;
    self->_animationState = 2;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained positionRegionComposerNeedsUpdate:self behavior:self->_animationState];

    uint64_t v4 = SBLogPIP();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[SBSystemNotesPositionHyperregionComposer setupForInteractiveCornerGesture]();
    }
  }
}

- (void)setupForStandardBehavior
{
  if (self->_state)
  {
    self->_unint64_t state = 0;
    self->_animationState = 2;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained positionRegionComposerNeedsUpdate:self behavior:self->_animationState];

    uint64_t v4 = SBLogPIP();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[SBSystemNotesPositionHyperregionComposer setupForInteractiveCornerGesture]();
    }
  }
}

- (void)setupForInteractiveDismissalToSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_state != 4
    || (self->_dismissToSize.width == a3.width ? (BOOL v6 = self->_dismissToSize.height == a3.height) : (BOOL v6 = 0), !v6))
  {
    self->_unint64_t state = 4;
    self->_dismissToSize = a3;
    self->_animationState = 2;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained positionRegionComposerNeedsUpdate:self behavior:self->_animationState];

    v8 = SBLogPIP();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = _SBFLoggingMethodProem();
      v16.CGFloat width = width;
      v16.CGFloat height = height;
      v10 = NSStringFromCGSize(v16);
      int v11 = 138543618;
      id v12 = v9;
      __int16 v13 = 2114;
      uint8x8_t v14 = v10;
      _os_log_debug_impl(&dword_1D85BA000, v8, OS_LOG_TYPE_DEBUG, "[%{public}@][Hyper] toSize: %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)setupForEdgeProtectCornerSwipe
{
  if (self->_state != 5)
  {
    self->_unint64_t state = 5;
    self->_animationState = 2;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained positionRegionComposerNeedsUpdate:self behavior:self->_animationState];

    uint64_t v4 = SBLogPIP();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[SBSystemNotesPositionHyperregionComposer setupForInteractiveCornerGesture]();
    }
  }
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained positionRegionComposerDidInvalidate:self];
}

- (id)positionRegionsForRegions:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4 interaction:(SBPIPPositionInteractionStateContext *)a5
{
  v8 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a3];
  v9 = v8;
  CGPoint pipAnchorPointOffset = a4->pipAnchorPointOffset;
  CGSize pipStashedSize = a4->pipStashedSize;
  CGPoint v62 = pipAnchorPointOffset;
  CGSize size = a4->containerBounds.size;
  CGPoint origin = a4->containerBounds.origin;
  CGSize v64 = size;
  CGSize pipLastSteadySize = a4->pipLastSteadySize;
  CGSize pipCurrentSize = a4->pipCurrentSize;
  CGSize v60 = pipLastSteadySize;
  CGFloat top = a4->edgeInsets.top;
  CGFloat left = a4->edgeInsets.left;
  CGFloat bottom = a4->edgeInsets.bottom;
  CGFloat right = a4->edgeInsets.right;
  long long v17 = *(_OWORD *)&a4->minimumPadding.bottom;
  unint64_t state = self->_state;
  long long v57 = *(_OWORD *)&a4->minimumPadding.top;
  long long v58 = v17;
  CGFloat v20 = a4->stashedMinimumPadding.top;
  CGFloat v19 = a4->stashedMinimumPadding.left;
  CGFloat v22 = a4->stashedMinimumPadding.bottom;
  CGFloat v21 = a4->stashedMinimumPadding.right;
  int64_t orientation = a4->orientation;
  unint64_t offscreenCorners = self->_offscreenCorners;
  switch(state)
  {
    case 1uLL:
      [v8 removeAllObjects];
      CGSize v41 = pipStashedSize;
      CGPoint v42 = v62;
      CGPoint v43 = origin;
      CGSize v44 = v64;
      CGSize v39 = pipCurrentSize;
      CGSize v40 = v60;
      double v45 = top;
      CGFloat v46 = left;
      uint64_t v47 = *(void *)&bottom;
      CGFloat v48 = right;
      long long v49 = v57;
      long long v50 = v58;
      double v51 = v20;
      CGFloat v52 = v19;
      uint64_t v53 = *(void *)&v22;
      CGFloat v54 = v21;
      unint64_t v55 = offscreenCorners;
      int64_t v56 = orientation;
      [(SBSystemNotesPositionHyperregionComposer *)self _addOffscreenCornersToRegions:v9 geometry:&v39];
      break;
    case 2uLL:
    case 4uLL:
      [v8 removeAllObjects];
      double v25 = *MEMORY[0x1E4F437F8];
      double v26 = *(double *)(MEMORY[0x1E4F437F8] + 8);
      uint64_t v27 = *(void *)(MEMORY[0x1E4F437F8] + 16);
      double v28 = *(double *)(MEMORY[0x1E4F437F8] + 24);
      if (self->_state == 4)
      {
        CGSize pipCurrentSize = self->_dismissToSize;
        CGSize v60 = pipCurrentSize;
      }
      regionsLibrary = self->_regionsLibrary;
      CGSize v41 = pipStashedSize;
      CGPoint v42 = v62;
      CGPoint v43 = origin;
      CGSize v44 = v64;
      CGSize v39 = pipCurrentSize;
      CGSize v40 = v60;
      double v45 = v25;
      CGFloat v46 = v26;
      uint64_t v47 = v27;
      CGFloat v48 = v28;
      long long v49 = v57;
      long long v50 = v58;
      double v51 = v20;
      CGFloat v52 = v19;
      uint64_t v53 = *(void *)&v22;
      CGFloat v54 = v21;
      unint64_t v55 = offscreenCorners;
      int64_t v56 = orientation;
      v30 = [(SBPIPPositionHyperregionLibrary *)regionsLibrary regionWithType:5 geometry:&v39];
      [v9 setObject:v30 forKey:&unk_1F334A928];
      if (!a5->isStashed && self->_state != 4)
      {
        CGSize v41 = pipStashedSize;
        CGPoint v42 = v62;
        CGPoint v43 = origin;
        CGSize v44 = v64;
        CGSize v39 = pipCurrentSize;
        CGSize v40 = v60;
        double v45 = v25;
        CGFloat v46 = v26;
        uint64_t v47 = v27;
        CGFloat v48 = v28;
        long long v49 = v57;
        long long v50 = v58;
        double v51 = v20;
        CGFloat v52 = v19;
        uint64_t v53 = *(void *)&v22;
        CGFloat v54 = v21;
        unint64_t v55 = offscreenCorners;
        int64_t v56 = orientation;
        [(SBSystemNotesPositionHyperregionComposer *)self _addOffscreenCornersToRegions:v9 geometry:&v39];
      }

      break;
    case 3uLL:
      [v8 removeObjectForKey:&unk_1F334A940];
      [v9 removeObjectForKey:&unk_1F334A958];
      break;
    case 5uLL:
      CGFloat Height = CGRectGetHeight(a4->containerBounds);
      CGFloat v32 = a4->edgeInsets.left;
      double v33 = Height - a4->pipStashedSize.height + -25.0;
      v34 = self->_regionsLibrary;
      CGSize v41 = pipStashedSize;
      CGPoint v42 = v62;
      CGPoint v43 = origin;
      CGSize v44 = v64;
      CGSize v39 = pipCurrentSize;
      CGSize v40 = v60;
      double v45 = v33;
      CGFloat v46 = v32;
      uint64_t v47 = 0x4039000000000000;
      CGFloat v48 = right;
      long long v49 = v57;
      long long v50 = v58;
      double v51 = v33;
      CGFloat v52 = v32;
      uint64_t v53 = 0x4039000000000000;
      CGFloat v54 = right;
      unint64_t v55 = offscreenCorners;
      int64_t v56 = orientation;
      v35 = [(SBPIPPositionHyperregionLibrary *)v34 regionWithType:2 geometry:&v39];
      [v9 setObject:v35 forKey:&unk_1F334A940];
      v36 = self->_regionsLibrary;
      CGSize v41 = pipStashedSize;
      CGPoint v42 = v62;
      CGPoint v43 = origin;
      CGSize v44 = v64;
      CGSize v39 = pipCurrentSize;
      CGSize v40 = v60;
      double v45 = v33;
      CGFloat v46 = v32;
      uint64_t v47 = 0x4039000000000000;
      CGFloat v48 = right;
      long long v49 = v57;
      long long v50 = v58;
      double v51 = v33;
      CGFloat v52 = v32;
      uint64_t v53 = 0x4039000000000000;
      CGFloat v54 = right;
      unint64_t v55 = offscreenCorners;
      int64_t v56 = orientation;
      v37 = [(SBPIPPositionHyperregionLibrary *)v36 regionWithType:3 geometry:&v39];
      [v9 setObject:v37 forKey:&unk_1F334A958];

      break;
    default:
      break;
  }
  return v9;
}

- (unint64_t)canonicalPositionForPoint:(CGPoint)a3 proposedPosition:(unint64_t)a4 geometry:(SBPIPPositionGeometryContext *)a5 interaction:(SBPIPPositionInteractionStateContext *)a6
{
  return a4;
}

- (void)_addOffscreenCornersToRegions:(id)a3 geometry:(SBPIPPositionGeometryContext *)a4
{
  regionsLibrary = self->_regionsLibrary;
  long long v5 = *(_OWORD *)&a4->stashedMinimumPadding.bottom;
  long long v23 = *(_OWORD *)&a4->stashedMinimumPadding.top;
  long long v24 = v5;
  long long v25 = *(_OWORD *)&a4->offscreenCorners;
  long long v6 = *(_OWORD *)&a4->edgeInsets.bottom;
  long long v19 = *(_OWORD *)&a4->edgeInsets.top;
  long long v20 = v6;
  long long v7 = *(_OWORD *)&a4->minimumPadding.bottom;
  long long v21 = *(_OWORD *)&a4->minimumPadding.top;
  long long v22 = v7;
  CGPoint pipAnchorPointOffset = a4->pipAnchorPointOffset;
  CGSize pipStashedSize = a4->pipStashedSize;
  CGPoint v16 = pipAnchorPointOffset;
  CGSize size = a4->containerBounds.size;
  CGPoint origin = a4->containerBounds.origin;
  CGSize v18 = size;
  CGSize pipLastSteadySize = a4->pipLastSteadySize;
  CGSize pipCurrentSize = a4->pipCurrentSize;
  CGSize v14 = pipLastSteadySize;
  id v11 = a3;
  id v12 = [(SBPIPPositionHyperregionLibrary *)regionsLibrary regionWithType:4 geometry:&pipCurrentSize];
  objc_msgSend(v11, "setObject:forKey:", v12, &unk_1F334A970, pipCurrentSize, v14, pipStashedSize, v16, origin, v18, v19, v20, v21, v22, v23, v24, v25);
}

- (SBPIPPositionHyperregionComposerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBPIPPositionHyperregionComposerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stateCaptureInvalidatable, 0);
  objc_storeStrong((id *)&self->_regionsLibrary, 0);
}

@end