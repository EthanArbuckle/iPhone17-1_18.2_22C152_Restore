@interface _UIFocusGuideRegion
- (BOOL)_canBeOccludedByRegionsAbove;
- (BOOL)_canOccludeRegionsBelow;
- (BOOL)_ignoresSpeedBumpEdges;
- (BOOL)_isEnabledForFocusedRegion:(id)a3 inSnapshot:(id)a4;
- (BOOL)_isUnclippable;
- (BOOL)_isUnoccludable;
- (BOOL)_shouldCropRegionToSearchArea;
- (BOOL)_shouldUseNextFocusedItemForLinearSorting;
- (BOOL)isEqual:(id)a3;
- (UIFocusEnvironment)owningEnvironment;
- (_UIFocusGuideRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4;
- (_UIFocusGuideRegionDelegate)delegate;
- (float)_focusPriority;
- (id)_debugAssociatedObject;
- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3;
- (id)_delegatePreferredFocusEnvironmentsForMovementRequest:(id)a3;
- (id)_fallbackFocusItemForMovementRequest:(id)a3 inFocusMap:(id)a4 withSnapshot:(id)a5;
- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4;
- (id)_focusedItemForLinearSorting:(id)a3 inMap:(id)a4 withSnapshot:(id)a5;
- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 inMap:(id)a4 withSnapshot:(id)a5;
- (int64_t)_preferredDistanceComparisonType;
- (unint64_t)_focusableBoundaries;
- (void)_setFocusPriority:(float)a3;
- (void)_setIgnoresSpeedBumpEdges:(BOOL)a3;
- (void)_setIsUnclippable:(BOOL)a3;
- (void)_setIsUnoccludable:(BOOL)a3;
- (void)_willParticipateAsDestinationRegionInFocusUpdate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOwningEnvironment:(id)a3;
@end

@implementation _UIFocusGuideRegion

- (_UIFocusGuideRegion)initWithFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIFocusGuideRegion;
  result = -[_UIFocusRegion initWithFrame:coordinateSpace:](&v5, sel_initWithFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->__focusPriority = 500.0;
  }
  return result;
}

- (id)_focusRegionWithAdjustedFrame:(CGRect)a3 coordinateSpace:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_UIFocusGuideRegion;
  objc_super v5 = -[_UIFocusRegion _focusRegionWithAdjustedFrame:coordinateSpace:](&v9, sel__focusRegionWithAdjustedFrame_coordinateSpace_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = [(_UIFocusGuideRegion *)self delegate];
  [v5 setDelegate:v6];

  v7 = [(_UIFocusGuideRegion *)self owningEnvironment];
  [v5 setOwningEnvironment:v7];

  objc_msgSend(v5, "_setIsUnoccludable:", -[_UIFocusGuideRegion _isUnoccludable](self, "_isUnoccludable"));
  [(_UIFocusGuideRegion *)self _focusPriority];
  objc_msgSend(v5, "_setFocusPriority:");
  objc_msgSend(v5, "_setIgnoresSpeedBumpEdges:", -[_UIFocusGuideRegion _ignoresSpeedBumpEdges](self, "_ignoresSpeedBumpEdges"));
  objc_msgSend(v5, "_setIsUnclippable:", -[_UIFocusGuideRegion _isUnclippable](self, "_isUnclippable"));
  return v5;
}

- (BOOL)_isEnabledForFocusedRegion:(id)a3 inSnapshot:(id)a4
{
  if (!a3) {
    return 1;
  }
  id v6 = a4;
  id v7 = a3;
  v8 = [v6 originalRegionForRegion:self];
  [v6 snapshotFrameForRegion:v8];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [v6 snapshotFrameForRegion:v7];
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v43.origin.CGFloat x = v10;
  v43.origin.CGFloat y = v12;
  v43.size.CGFloat width = v14;
  v43.size.CGFloat height = v16;
  if (CGRectIsNull(v43)
    || (v44.origin.CGFloat x = v18, v44.origin.y = v20, v44.size.width = v22, v44.size.height = v24, CGRectIsNull(v44)))
  {
    char v25 = 1;
  }
  else
  {
    v45.origin.CGFloat x = v10;
    v45.origin.CGFloat y = v12;
    v45.size.CGFloat width = v14;
    v45.size.CGFloat height = v16;
    CGRect v46 = CGRectStandardize(v45);
    CGFloat x = v46.origin.x;
    CGFloat y = v46.origin.y;
    CGFloat width = v46.size.width;
    CGFloat height = v46.size.height;
    v46.origin.CGFloat x = v18;
    v46.origin.CGFloat y = v20;
    v46.size.CGFloat width = v22;
    v46.size.CGFloat height = v24;
    CGRect v47 = CGRectStandardize(v46);
    CGFloat v30 = v47.origin.x;
    CGFloat v31 = v47.origin.y;
    CGFloat v32 = v47.size.width;
    CGFloat v33 = v47.size.height;
    CGFloat v41 = y;
    CGFloat v42 = x;
    v47.origin.CGFloat x = x;
    v47.origin.CGFloat y = y;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    CGFloat v34 = CGRectGetMinX(v47) + 0.0001;
    v48.origin.CGFloat x = v30;
    v48.origin.CGFloat y = v31;
    v48.size.CGFloat width = v32;
    v48.size.CGFloat height = v33;
    if (v34 <= CGRectGetMaxX(v48))
    {
      v49.origin.CGFloat y = v41;
      v49.origin.CGFloat x = x;
      v49.size.CGFloat width = width;
      v49.size.CGFloat height = height;
      CGFloat v36 = CGRectGetMaxX(v49) + -0.0001;
      v50.origin.CGFloat x = v30;
      v50.origin.CGFloat y = v31;
      v50.size.CGFloat width = v32;
      v50.size.CGFloat height = v33;
      BOOL v35 = v36 >= CGRectGetMinX(v50);
    }
    else
    {
      BOOL v35 = 0;
    }
    v51.origin.CGFloat x = x;
    v51.origin.CGFloat y = v41;
    v51.size.CGFloat width = width;
    v51.size.CGFloat height = height;
    CGFloat v37 = CGRectGetMinY(v51) + 0.0001;
    v52.origin.CGFloat x = v30;
    v52.origin.CGFloat y = v31;
    v52.size.CGFloat width = v32;
    v52.size.CGFloat height = v33;
    if (v37 <= CGRectGetMaxY(v52))
    {
      v53.origin.CGFloat x = v42;
      v53.origin.CGFloat y = v41;
      v53.size.CGFloat width = width;
      v53.size.CGFloat height = height;
      CGFloat v39 = CGRectGetMaxY(v53) + -0.0001;
      v54.origin.CGFloat x = v30;
      v54.origin.CGFloat y = v31;
      v54.size.CGFloat width = v32;
      v54.size.CGFloat height = v33;
      BOOL v38 = v39 >= CGRectGetMinY(v54);
    }
    else
    {
      BOOL v38 = 0;
    }
    char v25 = !v35 || !v38;
  }

  return v25;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIFocusGuideRegion;
  if ([(_UIFocusRegion *)&v12 isEqual:v4])
  {
    objc_super v5 = (id *)v4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v7 = objc_loadWeakRetained(v5 + 7);
    if (WeakRetained == v7)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_owningEnvironment);
      id v10 = objc_loadWeakRetained(v5 + 8);
      BOOL v8 = v9 == v10
        && self->__isUnoccludable == *((unsigned __int8 *)v5 + 48)
        && self->__focusPriority == *((float *)v5 + 13)
        && self->__ignoresSpeedBumpEdges == *((unsigned __int8 *)v5 + 49)
        && self->__isUnclippable == *((unsigned __int8 *)v5 + 50);
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)_canOccludeRegionsBelow
{
  return 0;
}

- (BOOL)_canBeOccludedByRegionsAbove
{
  return ![(_UIFocusGuideRegion *)self _isUnoccludable];
}

- (BOOL)_shouldCropRegionToSearchArea
{
  return dyld_program_sdk_at_least();
}

- (id)_nextFocusedItemForFocusMovementRequest:(id)a3 inMap:(id)a4 withSnapshot:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [v8 focusedItemInfo];
  objc_super v12 = [v11 focusedRegion];
  BOOL v13 = [(_UIFocusGuideRegion *)self _isEnabledForFocusedRegion:v12 inSnapshot:v10];

  if (v13)
  {
    CGFloat v14 = [(_UIFocusGuideRegion *)self _delegatePreferredFocusEnvironmentsForMovementRequest:v8];
    if (![v14 count])
    {
      double v15 = [(_UIFocusGuideRegion *)self owningEnvironment];
      uint64_t v16 = _UIFocusEnvironmentPreferredFocusEnvironments(v15);

      CGFloat v14 = (void *)v16;
    }
    double v17 = objc_alloc_init(_UIDeepestPreferredEnvironmentSearch);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v18 = v14;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v27 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = -[_UIDeepestPreferredEnvironmentSearch deepestPreferredFocusableItemForEnvironment:withRequest:](v17, "deepestPreferredFocusableItemForEnvironment:withRequest:", *(void *)(*((void *)&v26 + 1) + 8 * i), v8, (void)v26);
          if (v23)
          {
            CGFloat v24 = (void *)v23;

            goto LABEL_15;
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    CGFloat v24 = [(_UIFocusGuideRegion *)self _fallbackFocusItemForMovementRequest:v8 inFocusMap:v9 withSnapshot:v10];
LABEL_15:
  }
  else
  {
    CGFloat v24 = 0;
  }

  return v24;
}

- (BOOL)_shouldUseNextFocusedItemForLinearSorting
{
  return 0;
}

- (id)_focusedItemForLinearSorting:(id)a3 inMap:(id)a4 withSnapshot:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = [(_UIFocusGuideRegion *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v12 = [v11 focusItemForSorting];
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)_UIFocusGuideRegion;
    uint64_t v12 = [(_UIFocusRegion *)&v15 _focusedItemForLinearSorting:v8 inMap:v9 withSnapshot:v10];
  }
  BOOL v13 = (void *)v12;

  return v13;
}

- (id)_fallbackFocusItemForMovementRequest:(id)a3 inFocusMap:(id)a4 withSnapshot:(id)a5
{
  return 0;
}

- (unint64_t)_focusableBoundaries
{
  if (dyld_program_sdk_at_least()) {
    return 32;
  }
  else {
    return 16;
  }
}

- (int64_t)_preferredDistanceComparisonType
{
  if (!dyld_program_sdk_at_least()) {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)_UIFocusGuideRegion;
  return [(_UIFocusRegion *)&v4 _preferredDistanceComparisonType];
}

- (void)_willParticipateAsDestinationRegionInFocusUpdate:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(_UIFocusGuideRegion *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v4 focusGuideRegion:self willParticipateAsDestinationRegionInFocusUpdate:v6];
  }
  else
  {
    objc_super v5 = [v6 _focusedGuide];

    if (!v5) {
      [v6 _setFocusRedirectedByGuide:1];
    }
  }
}

- (id)_delegatePreferredFocusEnvironmentsForMovementRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(_UIFocusGuideRegion *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [v5 focusGuideRegion:self preferredFocusEnvironmentsForMovementRequest:v4];
  }
  else
  {
    id v6 = 0;
  }
  if (v6) {
    id v7 = v6;
  }
  else {
    id v7 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v8 = v7;

  return v8;
}

- (id)_debugAssociatedObject
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (id)_debugDrawingConfigurationWithDebugInfo:(id)a3
{
  id v4 = a3;
  objc_super v5 = [v4 snapshot];
  id v6 = [v5 focusedRegion];
  id v7 = [v4 snapshot];

  LODWORD(v4) = [(_UIFocusGuideRegion *)self _isEnabledForFocusedRegion:v6 inSnapshot:v7];
  if (v4)
  {
    id v8 = +[_UIFocusRegionDebugDrawingConfiguration guideConfigurationForRegion:self];
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (_UIFocusGuideRegionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIFocusGuideRegionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIFocusEnvironment)owningEnvironment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owningEnvironment);
  return (UIFocusEnvironment *)WeakRetained;
}

- (void)setOwningEnvironment:(id)a3
{
}

- (BOOL)_isUnoccludable
{
  return self->__isUnoccludable;
}

- (void)_setIsUnoccludable:(BOOL)a3
{
  self->__isUnoccludable = a3;
}

- (float)_focusPriority
{
  return self->__focusPriority;
}

- (void)_setFocusPriority:(float)a3
{
  self->__focusPrioritCGFloat y = a3;
}

- (BOOL)_ignoresSpeedBumpEdges
{
  return self->__ignoresSpeedBumpEdges;
}

- (void)_setIgnoresSpeedBumpEdges:(BOOL)a3
{
  self->__ignoresSpeedBumpEdges = a3;
}

- (BOOL)_isUnclippable
{
  return self->__isUnclippable;
}

- (void)_setIsUnclippable:(BOOL)a3
{
  self->__isUnclippable = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owningEnvironment);
  objc_destroyWeak((id *)&self->_delegate);
}

@end