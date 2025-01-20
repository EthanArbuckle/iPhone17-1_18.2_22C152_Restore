@interface UISlidingBarState
- (BOOL)_leadingEntirelyOverlapsMain;
- (BOOL)_shouldUseSlidingBars;
- (BOOL)_supplementaryEntirelyOverlapsMain;
- (BOOL)_trailingEntirelyOverlapsMain;
- (BOOL)_treatLeadingHiddenAsOverlaps;
- (BOOL)_treatSupplementaryHiddenAsOverlaps;
- (BOOL)_treatTrailingHiddenAsOverlaps;
- (BOOL)isCollapsed;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLeadingVisible;
- (BOOL)isSupplementaryVisible;
- (BOOL)isTrailingVisible;
- (BOOL)leadingOverlapsMain;
- (BOOL)matchesRequest:(id)a3;
- (BOOL)supplementaryOverlapsMain;
- (BOOL)trailingOverlapsMain;
- (UISlidingBarConfiguration)configuration;
- (double)_absoluteDistanceFromRequest:(id)a3;
- (double)_distanceFromRequest:(id)a3;
- (double)_keyboardAdjustment;
- (double)_leadingOverlayWidth;
- (double)_rubberBandInset;
- (double)_supplementaryOverlayWidth;
- (double)_trailingOverlayWidth;
- (double)leadingDragOffset;
- (double)leadingOffscreenWidth;
- (double)leadingWidth;
- (double)mainWidth;
- (double)supplementaryDragOffset;
- (double)supplementaryOffscreenWidth;
- (double)supplementaryWidth;
- (double)trailingDragOffset;
- (double)trailingOffscreenWidth;
- (double)trailingWidth;
- (id)_configuration;
- (id)_interactiveStateRequest;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)stateRequest;
- (int64_t)_collapsedState;
- (unint64_t)hash;
- (void)_setCollapsedState:(int64_t)a3;
- (void)_setLeadingOverlayWidth:(double)a3;
- (void)_setSupplementaryOverlayWidth:(double)a3;
- (void)_setTrailingOverlayWidth:(double)a3;
- (void)_setTreatLeadingHiddenAsOverlaps:(BOOL)a3;
- (void)_setTreatSupplementaryHiddenAsOverlaps:(BOOL)a3;
- (void)_setTreatTrailingHiddenAsOverlaps:(BOOL)a3;
- (void)setConfiguration:(id)a3;
- (void)setLeadingDragOffset:(double)a3;
- (void)setLeadingOffscreenWidth:(double)a3;
- (void)setLeadingWidth:(double)a3;
- (void)setMainWidth:(double)a3;
- (void)setSupplementaryDragOffset:(double)a3;
- (void)setSupplementaryOffscreenWidth:(double)a3;
- (void)setSupplementaryWidth:(double)a3;
- (void)setTrailingDragOffset:(double)a3;
- (void)setTrailingOffscreenWidth:(double)a3;
- (void)setTrailingWidth:(double)a3;
- (void)set_keyboardAdjustment:(double)a3;
- (void)set_rubberBandInset:(double)a3;
@end

@implementation UISlidingBarState

- (BOOL)_leadingEntirelyOverlapsMain
{
  if ([(UISlidingBarState *)self leadingOverlapsMain])
  {
    [(UISlidingBarState *)self _leadingOverlayWidth];
    double v4 = v3;
    [(UISlidingBarState *)self leadingWidth];
    if (v4 == v5) {
      return 1;
    }
  }
  v6 = [(UISlidingBarState *)self _configuration];
  if (![v6 supplementaryEdge])
  {
    BOOL v7 = [(UISlidingBarState *)self _supplementaryEntirelyOverlapsMain];

    return v7;
  }

  return 0;
}

- (BOOL)_supplementaryEntirelyOverlapsMain
{
  BOOL v3 = [(UISlidingBarState *)self supplementaryOverlapsMain];
  if (v3)
  {
    [(UISlidingBarState *)self _supplementaryOverlayWidth];
    double v5 = v4;
    [(UISlidingBarState *)self supplementaryWidth];
    LOBYTE(v3) = v5 == v6;
  }
  return v3;
}

- (BOOL)leadingOverlapsMain
{
  [(UISlidingBarState *)self _leadingOverlayWidth];
  if (v3 > 0.0) {
    return 1;
  }
  [(UISlidingBarState *)self leadingWidth];
  if (v4 == 0.0 && [(UISlidingBarState *)self _treatLeadingHiddenAsOverlaps]) {
    return 1;
  }
  double v5 = [(UISlidingBarState *)self _configuration];
  if (![v5 supplementaryEdge])
  {
    BOOL v6 = [(UISlidingBarState *)self supplementaryOverlapsMain];

    return v6;
  }

  return 0;
}

- (BOOL)_treatSupplementaryHiddenAsOverlaps
{
  return self->__treatSupplementaryHiddenAsOverlaps;
}

- (id)_configuration
{
  return self->_configuration;
}

- (BOOL)supplementaryOverlapsMain
{
  [(UISlidingBarState *)self _supplementaryOverlayWidth];
  if (v3 > 0.0) {
    return 1;
  }
  [(UISlidingBarState *)self supplementaryWidth];
  if (v5 != 0.0) {
    return 0;
  }
  return [(UISlidingBarState *)self _treatSupplementaryHiddenAsOverlaps];
}

- (double)supplementaryWidth
{
  return self->_supplementaryWidth;
}

- (double)_supplementaryOverlayWidth
{
  return self->__supplementaryOverlayWidth;
}

- (double)leadingWidth
{
  return self->_leadingWidth;
}

- (BOOL)_treatLeadingHiddenAsOverlaps
{
  return self->__treatLeadingHiddenAsOverlaps;
}

- (double)_leadingOverlayWidth
{
  return self->__leadingOverlayWidth;
}

- (BOOL)isCollapsed
{
  return (unint64_t)([(UISlidingBarState *)self _collapsedState] - 1) < 2;
}

- (int64_t)_collapsedState
{
  return self->__collapsedState;
}

- (void).cxx_destruct
{
}

- (BOOL)isLeadingVisible
{
  [(UISlidingBarState *)self leadingWidth];
  double v4 = v3;
  [(UISlidingBarState *)self leadingDragOffset];
  return v4 - v5 > 0.0;
}

- (BOOL)isTrailingVisible
{
  [(UISlidingBarState *)self trailingWidth];
  double v4 = v3;
  [(UISlidingBarState *)self trailingDragOffset];
  return v4 - v5 > 0.0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [(UISlidingBarState *)self leadingWidth];
  objc_msgSend(v4, "setLeadingWidth:");
  [(UISlidingBarState *)self leadingOffscreenWidth];
  objc_msgSend(v4, "setLeadingOffscreenWidth:");
  [(UISlidingBarState *)self trailingWidth];
  objc_msgSend(v4, "setTrailingWidth:");
  [(UISlidingBarState *)self trailingOffscreenWidth];
  objc_msgSend(v4, "setTrailingOffscreenWidth:");
  [(UISlidingBarState *)self supplementaryWidth];
  objc_msgSend(v4, "setSupplementaryWidth:");
  [(UISlidingBarState *)self supplementaryOffscreenWidth];
  objc_msgSend(v4, "setSupplementaryOffscreenWidth:");
  [(UISlidingBarState *)self _rubberBandInset];
  objc_msgSend(v4, "set_rubberBandInset:");
  [(UISlidingBarState *)self mainWidth];
  objc_msgSend(v4, "setMainWidth:");
  [(UISlidingBarState *)self leadingDragOffset];
  objc_msgSend(v4, "setLeadingDragOffset:");
  [(UISlidingBarState *)self trailingDragOffset];
  objc_msgSend(v4, "setTrailingDragOffset:");
  [(UISlidingBarState *)self supplementaryDragOffset];
  objc_msgSend(v4, "setSupplementaryDragOffset:");
  [(UISlidingBarState *)self _leadingOverlayWidth];
  objc_msgSend(v4, "_setLeadingOverlayWidth:");
  [(UISlidingBarState *)self _trailingOverlayWidth];
  objc_msgSend(v4, "_setTrailingOverlayWidth:");
  [(UISlidingBarState *)self _supplementaryOverlayWidth];
  objc_msgSend(v4, "_setSupplementaryOverlayWidth:");
  objc_msgSend(v4, "_setTreatLeadingHiddenAsOverlaps:", -[UISlidingBarState _treatLeadingHiddenAsOverlaps](self, "_treatLeadingHiddenAsOverlaps"));
  objc_msgSend(v4, "_setTreatTrailingHiddenAsOverlaps:", -[UISlidingBarState _treatTrailingHiddenAsOverlaps](self, "_treatTrailingHiddenAsOverlaps"));
  objc_msgSend(v4, "_setTreatSupplementaryHiddenAsOverlaps:", -[UISlidingBarState _treatSupplementaryHiddenAsOverlaps](self, "_treatSupplementaryHiddenAsOverlaps"));
  double v5 = [(UISlidingBarState *)self configuration];
  [v4 setConfiguration:v5];

  objc_msgSend(v4, "_setCollapsedState:", -[UISlidingBarState _collapsedState](self, "_collapsedState"));
  [(UISlidingBarState *)self _keyboardAdjustment];
  objc_msgSend(v4, "set_keyboardAdjustment:");
  return v4;
}

- (double)supplementaryOffscreenWidth
{
  return self->_supplementaryOffscreenWidth;
}

- (UISlidingBarConfiguration)configuration
{
  v2 = (void *)[(UISlidingBarConfiguration *)self->_configuration copy];
  return (UISlidingBarConfiguration *)v2;
}

- (double)leadingOffscreenWidth
{
  return self->_leadingOffscreenWidth;
}

- (double)trailingOffscreenWidth
{
  return self->_trailingOffscreenWidth;
}

- (BOOL)trailingOverlapsMain
{
  [(UISlidingBarState *)self _trailingOverlayWidth];
  if (v3 > 0.0) {
    return 1;
  }
  [(UISlidingBarState *)self trailingWidth];
  if (v4 == 0.0 && [(UISlidingBarState *)self _treatTrailingHiddenAsOverlaps]) {
    return 1;
  }
  double v5 = [(UISlidingBarState *)self _configuration];
  if ([v5 supplementaryEdge] == 1)
  {
    BOOL v6 = [(UISlidingBarState *)self supplementaryOverlapsMain];

    if (v6) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (double)trailingWidth
{
  return self->_trailingWidth;
}

- (BOOL)_treatTrailingHiddenAsOverlaps
{
  return self->__treatTrailingHiddenAsOverlaps;
}

- (double)_trailingOverlayWidth
{
  return self->__trailingOverlayWidth;
}

- (double)trailingDragOffset
{
  return self->_trailingDragOffset;
}

- (void)setConfiguration:(id)a3
{
}

- (void)_setCollapsedState:(int64_t)a3
{
  self->__collapsedState = a3;
}

- (double)mainWidth
{
  return self->_mainWidth;
}

- (BOOL)isSupplementaryVisible
{
  double v3 = [(UISlidingBarState *)self _configuration];
  uint64_t v4 = [v3 supplementaryEdge];

  if (v4)
  {
    [(UISlidingBarState *)self trailingWidth];
    double v6 = v5;
    [(UISlidingBarState *)self trailingDragOffset];
  }
  else
  {
    [(UISlidingBarState *)self leadingWidth];
    double v6 = v8;
    [(UISlidingBarState *)self leadingDragOffset];
  }
  double v9 = v7;
  [(UISlidingBarState *)self supplementaryDragOffset];
  double v11 = v10;
  [(UISlidingBarState *)self supplementaryWidth];
  if (v12 <= 0.0) {
    return 0;
  }
  [(UISlidingBarState *)self supplementaryWidth];
  return v6 + v13 - (v9 + v11) > 0.0;
}

- (double)supplementaryDragOffset
{
  return self->_supplementaryDragOffset;
}

- (double)leadingDragOffset
{
  return self->_leadingDragOffset;
}

- (void)set_rubberBandInset:(double)a3
{
  self->__rubberBandInset = a3;
}

- (void)set_keyboardAdjustment:(double)a3
{
  self->__keyboardAdjustment = a3;
}

- (void)setTrailingWidth:(double)a3
{
  self->_trailingWidth = a3;
}

- (void)setTrailingOffscreenWidth:(double)a3
{
  self->_trailingOffscreenWidth = a3;
}

- (void)setTrailingDragOffset:(double)a3
{
  self->_trailingDragOffset = a3;
}

- (void)setSupplementaryWidth:(double)a3
{
  self->_supplementaryWidth = a3;
}

- (void)setSupplementaryOffscreenWidth:(double)a3
{
  self->_supplementaryOffscreenWidth = a3;
}

- (void)setSupplementaryDragOffset:(double)a3
{
  self->_supplementaryDragOffset = a3;
}

- (void)setMainWidth:(double)a3
{
  self->_mainWidth = a3;
}

- (void)setLeadingWidth:(double)a3
{
  self->_leadingWidth = a3;
}

- (void)setLeadingOffscreenWidth:(double)a3
{
  self->_leadingOffscreenWidth = a3;
}

- (void)setLeadingDragOffset:(double)a3
{
  self->_leadingDragOffset = a3;
}

- (void)_setTreatTrailingHiddenAsOverlaps:(BOOL)a3
{
  self->__treatTrailingHiddenAsOverlaps = a3;
}

- (void)_setTreatSupplementaryHiddenAsOverlaps:(BOOL)a3
{
  self->__treatSupplementaryHiddenAsOverlaps = a3;
}

- (void)_setTreatLeadingHiddenAsOverlaps:(BOOL)a3
{
  self->__treatLeadingHiddenAsOverlaps = a3;
}

- (void)_setTrailingOverlayWidth:(double)a3
{
  self->__trailingOverlayWidth = a3;
}

- (void)_setSupplementaryOverlayWidth:(double)a3
{
  self->__supplementaryOverlayWidth = a3;
}

- (void)_setLeadingOverlayWidth:(double)a3
{
  self->__leadingOverlayWidth = a3;
}

- (double)_rubberBandInset
{
  return self->__rubberBandInset;
}

- (double)_keyboardAdjustment
{
  return self->__keyboardAdjustment;
}

- (BOOL)_trailingEntirelyOverlapsMain
{
  if ([(UISlidingBarState *)self trailingOverlapsMain])
  {
    [(UISlidingBarState *)self _trailingOverlayWidth];
    double v4 = v3;
    [(UISlidingBarState *)self trailingWidth];
    if (v4 == v5) {
      return 1;
    }
  }
  double v6 = [(UISlidingBarState *)self _configuration];
  if ([v6 supplementaryEdge] == 1)
  {
    BOOL v7 = [(UISlidingBarState *)self _supplementaryEntirelyOverlapsMain];

    if (v7) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (id)description
{
  v19.receiver = self;
  v19.super_class = (Class)UISlidingBarState;
  double v3 = [(UISlidingBarState *)&v19 description];
  double v4 = (void *)[v3 mutableCopy];

  if (os_variant_has_internal_diagnostics())
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __32__UISlidingBarState_description__block_invoke;
    aBlock[3] = &unk_1E52E99B0;
    id v6 = v4;
    id v18 = v6;
    BOOL v7 = (void (**)(void *, __CFString *, uint64_t, double))_Block_copy(aBlock);
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __32__UISlidingBarState_description__block_invoke_2;
    v15 = &unk_1E52E99D8;
    id v8 = v6;
    id v16 = v8;
    double v9 = (void (**)(void *, BOOL, __CFString *, uint64_t))_Block_copy(&v12);
    v7[2](v7, @"leadingWidth", 1, self->_leadingWidth);
    v7[2](v7, @"leadingOffscreenWidth", 1, self->_leadingOffscreenWidth);
    [(UISlidingBarState *)self _leadingOverlayWidth];
    ((void (*)(void (**)(void *, __CFString *, uint64_t, double), __CFString *, uint64_t))v7[2])(v7, @"leadingOverlayWidth", 1);
    v7[2](v7, @"trailingWidth", 1, self->_trailingWidth);
    v7[2](v7, @"trailingOffscreenWidth", 1, self->_trailingOffscreenWidth);
    [(UISlidingBarState *)self _trailingOverlayWidth];
    ((void (*)(void (**)(void *, __CFString *, uint64_t, double), __CFString *, uint64_t))v7[2])(v7, @"trailingOverlayWidth", 1);
    v7[2](v7, @"supplementaryWidth", 1, self->_supplementaryWidth);
    v7[2](v7, @"supplementaryOffscreenWidth", 1, self->_supplementaryOffscreenWidth);
    [(UISlidingBarState *)self _supplementaryOverlayWidth];
    ((void (*)(void (**)(void *, __CFString *, uint64_t, double), __CFString *, uint64_t))v7[2])(v7, @"supplementaryOverlayWidth", 1);
    [(UISlidingBarState *)self _rubberBandInset];
    ((void (*)(void (**)(void *, __CFString *, uint64_t, double), __CFString *, uint64_t))v7[2])(v7, @"rubberBandInset", 1);
    v7[2](v7, @"mainWidth", 1, self->_mainWidth);
    v7[2](v7, @"leadingDragOffset", 1, self->_leadingDragOffset);
    v7[2](v7, @"trailingDragOffset", 1, self->_trailingDragOffset);
    v7[2](v7, @"supplementaryDragOffset", 1, self->_supplementaryDragOffset);
    v9[2](v9, [(UISlidingBarState *)self leadingOverlapsMain], @"leadingOverlapsMain", 1);
    v9[2](v9, [(UISlidingBarState *)self trailingOverlapsMain], @"trailingOverlapsMain", 1);
    v9[2](v9, [(UISlidingBarState *)self supplementaryOverlapsMain], @"supplementaryOverlapsMain", 1);
    configuration = self->_configuration;
    double v11 = _StringFromCollapsedState([(UISlidingBarState *)self _collapsedState]);
    [v8 appendFormat:@" configuration=%p collapsedState=%@", configuration, v11, v12, v13, v14, v15];
  }
  return v4;
}

uint64_t __32__UISlidingBarState_description__block_invoke(uint64_t result, uint64_t a2, char a3, double a4)
{
  if (a4 != 0.0 || (a3 & 1) == 0) {
    return [*(id *)(result + 32) appendFormat:@" %@=%g", a2, *(void *)&a4, v4, v5];
  }
  return result;
}

void __32__UISlidingBarState_description__block_invoke_2(uint64_t a1, int a2, void *a3, int a4)
{
  id v7 = a3;
  if (a4)
  {
    if (!a2) {
      goto LABEL_8;
    }
    id v8 = *(void **)(a1 + 32);
    id v11 = v7;
    double v9 = @" %@";
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    double v10 = @"NO";
    if (a2) {
      double v10 = @"YES";
    }
    id v11 = v7;
    uint64_t v12 = v10;
    double v9 = @" %@=%@";
  }
  id v13 = v7;
  objc_msgSend(v8, "appendFormat:", v9, v11, v12);
  id v7 = v13;
LABEL_8:
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    [(UISlidingBarState *)self leadingWidth];
    double v7 = v6;
    [v5 leadingWidth];
    if (v7 != v8) {
      goto LABEL_19;
    }
    [(UISlidingBarState *)self _leadingOverlayWidth];
    double v10 = v9;
    [v5 _leadingOverlayWidth];
    if (v10 != v11) {
      goto LABEL_19;
    }
    [(UISlidingBarState *)self leadingOffscreenWidth];
    double v13 = v12;
    [v5 leadingOffscreenWidth];
    if (v13 != v14) {
      goto LABEL_19;
    }
    [(UISlidingBarState *)self trailingWidth];
    double v16 = v15;
    [v5 trailingWidth];
    if (v16 != v17) {
      goto LABEL_19;
    }
    [(UISlidingBarState *)self _trailingOverlayWidth];
    double v19 = v18;
    [v5 _trailingOverlayWidth];
    if (v19 != v20) {
      goto LABEL_19;
    }
    [(UISlidingBarState *)self trailingOffscreenWidth];
    double v22 = v21;
    [v5 trailingOffscreenWidth];
    if (v22 != v23) {
      goto LABEL_19;
    }
    [(UISlidingBarState *)self supplementaryWidth];
    double v25 = v24;
    [v5 supplementaryWidth];
    if (v25 != v26) {
      goto LABEL_19;
    }
    [(UISlidingBarState *)self supplementaryOffscreenWidth];
    double v28 = v27;
    [v5 supplementaryOffscreenWidth];
    if (v28 != v29) {
      goto LABEL_19;
    }
    [(UISlidingBarState *)self _supplementaryOverlayWidth];
    double v31 = v30;
    [v5 _supplementaryOverlayWidth];
    if (v31 != v32) {
      goto LABEL_19;
    }
    [(UISlidingBarState *)self _rubberBandInset];
    double v34 = v33;
    [v5 _rubberBandInset];
    if (v34 != v35) {
      goto LABEL_19;
    }
    [(UISlidingBarState *)self mainWidth];
    double v37 = v36;
    [v5 mainWidth];
    if (v37 != v38) {
      goto LABEL_19;
    }
    [(UISlidingBarState *)self leadingDragOffset];
    double v40 = v39;
    [v5 leadingDragOffset];
    if (v40 != v41) {
      goto LABEL_19;
    }
    [(UISlidingBarState *)self trailingDragOffset];
    double v43 = v42;
    [v5 trailingDragOffset];
    if (v43 != v44) {
      goto LABEL_19;
    }
    [(UISlidingBarState *)self supplementaryDragOffset];
    double v46 = v45;
    [v5 supplementaryDragOffset];
    if (v46 == v47
      && (int v48 = [(UISlidingBarState *)self leadingOverlapsMain],
          v48 == [v5 leadingOverlapsMain])
      && (int v49 = [(UISlidingBarState *)self trailingOverlapsMain],
          v49 == [v5 trailingOverlapsMain]))
    {
      v52 = [(UISlidingBarState *)self _configuration];
      v53 = [v5 _configuration];
      if ([v52 isEqual:v53]
        && (int64_t v54 = [(UISlidingBarState *)self _collapsedState],
            v54 == [v5 _collapsedState]))
      {
        [(UISlidingBarState *)self _keyboardAdjustment];
        double v56 = v55;
        [v5 _keyboardAdjustment];
        BOOL v50 = v56 == v57;
      }
      else
      {
        BOOL v50 = 0;
      }
    }
    else
    {
LABEL_19:
      BOOL v50 = 0;
    }
  }
  else
  {
    BOOL v50 = 0;
  }

  return v50;
}

- (unint64_t)hash
{
  [(UISlidingBarState *)self leadingWidth];
  unint64_t v4 = (unint64_t)v3;
  [(UISlidingBarState *)self trailingWidth];
  unint64_t v6 = (unint64_t)v5 ^ v4;
  [(UISlidingBarState *)self supplementaryWidth];
  unint64_t v8 = (unint64_t)v7;
  double v9 = [(UISlidingBarState *)self _configuration];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)_shouldUseSlidingBars
{
  return 0;
}

- (BOOL)matchesRequest:(id)a3
{
  [(UISlidingBarState *)self _absoluteDistanceFromRequest:a3];
  return v3 == 0.0;
}

- (double)_distanceFromRequest:(id)a3
{
  if (!a3) {
    return 1.79769313e308;
  }
  id v4 = a3;
  [(UISlidingBarState *)self leadingWidth];
  double v6 = v5;
  [v4 leadingWidth];
  double v8 = v6 - v7;
  [(UISlidingBarState *)self trailingWidth];
  double v10 = v9;
  [v4 trailingWidth];
  double v12 = v8 + v10 - v11;
  [(UISlidingBarState *)self supplementaryWidth];
  double v14 = v13;
  [v4 supplementaryWidth];
  double v16 = v15;

  return v12 + v14 - v16;
}

- (double)_absoluteDistanceFromRequest:(id)a3
{
  if (!a3) {
    return 1.79769313e308;
  }
  id v4 = a3;
  [(UISlidingBarState *)self leadingWidth];
  double v6 = v5;
  [v4 leadingWidth];
  double v8 = vabdd_f64(v6, v7);
  [(UISlidingBarState *)self trailingWidth];
  double v10 = v9;
  [v4 trailingWidth];
  double v12 = v8 + vabdd_f64(v10, v11);
  [(UISlidingBarState *)self supplementaryWidth];
  double v14 = v13;
  [v4 supplementaryWidth];
  double v16 = v15;

  return v12 + vabdd_f64(v14, v16);
}

- (id)stateRequest
{
  double v3 = objc_alloc_init(UISlidingBarStateRequest);
  [(UISlidingBarState *)self leadingWidth];
  -[UISlidingBarStateRequest setLeadingWidth:](v3, "setLeadingWidth:");
  [(UISlidingBarState *)self leadingOffscreenWidth];
  -[UISlidingBarStateRequest setLeadingOffscreenWidth:](v3, "setLeadingOffscreenWidth:");
  [(UISlidingBarState *)self trailingWidth];
  -[UISlidingBarStateRequest setTrailingWidth:](v3, "setTrailingWidth:");
  [(UISlidingBarState *)self trailingOffscreenWidth];
  -[UISlidingBarStateRequest setTrailingOffscreenWidth:](v3, "setTrailingOffscreenWidth:");
  [(UISlidingBarState *)self supplementaryWidth];
  -[UISlidingBarStateRequest setSupplementaryWidth:](v3, "setSupplementaryWidth:");
  [(UISlidingBarState *)self supplementaryOffscreenWidth];
  -[UISlidingBarStateRequest setSupplementaryOffscreenWidth:](v3, "setSupplementaryOffscreenWidth:");
  [(UISlidingBarState *)self mainWidth];
  -[UISlidingBarStateRequest setMainWidth:](v3, "setMainWidth:");
  return v3;
}

- (id)_interactiveStateRequest
{
  double v3 = objc_alloc_init(UISlidingBarStateRequest);
  [(UISlidingBarState *)self _rubberBandInset];
  -[UISlidingBarStateRequest setRubberBandInset:](v3, "setRubberBandInset:");
  [(UISlidingBarState *)self supplementaryWidth];
  if (v4 <= 0.0)
  {
    [(UISlidingBarState *)self leadingWidth];
    double v15 = v14;
    [(UISlidingBarState *)self leadingDragOffset];
    [(UISlidingBarStateRequest *)v3 setLeadingWidth:v15 - v16];
    [(UISlidingBarState *)self trailingWidth];
    double v18 = v17;
    [(UISlidingBarState *)self trailingDragOffset];
    [(UISlidingBarStateRequest *)v3 setTrailingWidth:v18 - v19];
    goto LABEL_11;
  }
  double v5 = v4;
  double v6 = [(UISlidingBarState *)self _configuration];
  uint64_t v7 = [v6 supplementaryEdge];

  if (!v7)
  {
    [(UISlidingBarState *)self leadingWidth];
    double v21 = v20;
    [(UISlidingBarState *)self leadingDragOffset];
    double v23 = v22;
    [(UISlidingBarState *)self supplementaryDragOffset];
    double v13 = v23 + v24;
    if (v21 > 0.0)
    {
      [(UISlidingBarStateRequest *)v3 setLeadingWidth:v21 - v13];
      goto LABEL_8;
    }
LABEL_9:
    double v26 = v5 - v13;
    double v25 = v3;
    goto LABEL_10;
  }
  [(UISlidingBarState *)self trailingWidth];
  double v9 = v8;
  [(UISlidingBarState *)self trailingDragOffset];
  double v11 = v10;
  [(UISlidingBarState *)self supplementaryDragOffset];
  double v13 = v11 + v12;
  if (v9 <= 0.0) {
    goto LABEL_9;
  }
  [(UISlidingBarStateRequest *)v3 setTrailingWidth:v9 - v13];
LABEL_8:
  double v25 = v3;
  double v26 = v5;
LABEL_10:
  [(UISlidingBarStateRequest *)v25 setSupplementaryWidth:v26];
LABEL_11:
  return v3;
}

@end