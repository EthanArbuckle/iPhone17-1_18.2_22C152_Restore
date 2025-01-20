@interface UITrackingLayoutGuide
- (BOOL)_isRTL;
- (BOOL)animatesChanges;
- (BOOL)animatingConstraintsChange;
- (BOOL)changeOffsetConstants:(UIOffset)a3;
- (BOOL)changeSizingConstants:(CGSize)a3;
- (BOOL)constrainedToWindowGuide;
- (BOOL)skipAnimationOnNextPassOnly;
- (NSArray)constraintsActiveWhenAwayFromEdge:(NSDirectionalRectEdge)edge;
- (NSArray)constraintsActiveWhenNearEdge:(NSDirectionalRectEdge)edge;
- (NSDictionary)edgeConstraints;
- (NSMutableDictionary)awayFromConstraintsByEdge;
- (NSMutableDictionary)nearEdgeConstraintsByEdge;
- (UIEdgeInsets)triggerInsetsForLandscape;
- (UIEdgeInsets)triggerInsetsForPortrait;
- (UIEdgeInsets)triggerProportions;
- (UITrackingLayoutGuide)init;
- (double)animationDuration;
- (id)_awayFromCombinedTrackedConstraintsForEdgeKey:(id)a3;
- (id)_keysFromEdges:(unint64_t)a3;
- (id)_keysInvolvingEdges:(unint64_t)a3;
- (id)_nearEdgeCombinedTrackedConstraintsForEdgeKey:(id)a3;
- (int64_t)owningViewInterfaceLayoutDirection;
- (unint64_t)animationOptions;
- (unint64_t)overlappingEdges;
- (unint64_t)pausedEdges;
- (unint64_t)validatedOverlappingEdges:(unint64_t)a3;
- (void)_createThresholdsFromProportions;
- (void)_layoutOwningViewAnimated:(BOOL)a3;
- (void)_setOwningView:(id)a3;
- (void)_thresholdCheck;
- (void)_thresholdCheckForGuide:(CGRect)a3 inContext:(CGRect)a4;
- (void)_updateForOverlappingEdges:(unint64_t)a3;
- (void)enableAnimations:(BOOL)a3;
- (void)pauseUpdatingConstraintsForEdges:(unint64_t)a3;
- (void)removeAllTrackedConstraints;
- (void)removeTrackedConstraintsFromViewBasedGuide:(id)a3;
- (void)resetAnimationOptions;
- (void)setAnimatesChanges:(BOOL)a3;
- (void)setAnimatingConstraintsChange:(BOOL)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setAnimationOptions:(unint64_t)a3;
- (void)setAwayFromConstraintsByEdge:(id)a3;
- (void)setConstrainedToWindowGuide:(BOOL)a3;
- (void)setConstraints:(NSArray *)trackingConstraints activeWhenAwayFromEdge:(NSDirectionalRectEdge)edge;
- (void)setConstraints:(NSArray *)trackingConstraints activeWhenNearEdge:(NSDirectionalRectEdge)edge;
- (void)setEdgeThresholds:(UIEdgeInsets)a3 forOrientation:(int64_t)a4;
- (void)setNearEdgeConstraintsByEdge:(id)a3;
- (void)setOverlappingEdges:(unint64_t)a3;
- (void)setOwningViewInterfaceLayoutDirection:(int64_t)a3;
- (void)setPausedEdges:(unint64_t)a3;
- (void)setProportionalEdgeThresholds:(UIEdgeInsets)a3;
- (void)setSkipAnimationOnNextPassOnly:(BOOL)a3;
- (void)setTriggerInsetsForLandscape:(UIEdgeInsets)a3;
- (void)setTriggerInsetsForPortrait:(UIEdgeInsets)a3;
- (void)setTriggerProportions:(UIEdgeInsets)a3;
- (void)startUpdatingConstraintsForEdges:(unint64_t)a3;
- (void)stopTrackingConstraintsForEdge:(unint64_t)a3;
- (void)trackConstraintsFromViewBasedGuide:(id)a3;
- (void)updateAnimationDuration:(double)a3 options:(unint64_t)a4;
- (void)updateConstraintsForActiveEdges;
@end

@implementation UITrackingLayoutGuide

- (UITrackingLayoutGuide)init
{
  v8.receiver = self;
  v8.super_class = (Class)UITrackingLayoutGuide;
  v2 = [(UILayoutGuide *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    nearEdgeConstraintsByEdge = v2->_nearEdgeConstraintsByEdge;
    v2->_nearEdgeConstraintsByEdge = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    awayFromConstraintsByEdge = v2->_awayFromConstraintsByEdge;
    v2->_awayFromConstraintsByEdge = v5;

    [(UITrackingLayoutGuide *)v2 resetAnimationOptions];
  }
  return v2;
}

- (void)setConstraints:(NSArray *)trackingConstraints activeWhenNearEdge:(NSDirectionalRectEdge)edge
{
  v18 = trackingConstraints;
  nearEdgeConstraintsByEdge = self->_nearEdgeConstraintsByEdge;
  if (!nearEdgeConstraintsByEdge)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_super v8 = self->_nearEdgeConstraintsByEdge;
    self->_nearEdgeConstraintsByEdge = v7;

    nearEdgeConstraintsByEdge = self->_nearEdgeConstraintsByEdge;
  }
  v9 = [NSNumber numberWithUnsignedInteger:edge];
  [(NSMutableDictionary *)nearEdgeConstraintsByEdge setObject:v18 forKey:v9];

  v10 = [(UILayoutGuide *)self owningView];
  v11 = [v10 window];

  if (v11) {
    [(UITrackingLayoutGuide *)self setConstrainedToWindowGuide:1];
  }
  v12 = [(UILayoutGuide *)self owningView];
  v13 = [v12 _window];
  v14 = [v13 _primaryKeyboardTrackingGuide];
  [v14 trackConstraintsFromViewBasedGuide:self];

  if ((self->_overlappingEdges & edge) != 0)
  {
    v15 = [(UILayoutGuide *)self owningView];
    v16 = [v15 _window];
    v17 = [v16 _primaryKeyboardTrackingGuide];
    [v17 updateConstraintsForActiveEdges];
  }
}

- (NSArray)constraintsActiveWhenNearEdge:(NSDirectionalRectEdge)edge
{
  if ([(UITrackingLayoutGuide *)self constrainedToWindowGuide])
  {
    nearEdgeConstraintsByEdge = self->_nearEdgeConstraintsByEdge;
    v6 = [NSNumber numberWithUnsignedInteger:edge];
    [(NSMutableDictionary *)nearEdgeConstraintsByEdge objectForKey:v6];
  }
  else
  {
    v6 = [NSNumber numberWithUnsignedInteger:edge];
    [(UITrackingLayoutGuide *)self _nearEdgeCombinedTrackedConstraintsForEdgeKey:v6];
  v7 = };

  if (v7) {
    objc_super v8 = v7;
  }
  else {
    objc_super v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v9 = v8;

  return v9;
}

- (void)setConstraints:(NSArray *)trackingConstraints activeWhenAwayFromEdge:(NSDirectionalRectEdge)edge
{
  v18 = trackingConstraints;
  awayFromConstraintsByEdge = self->_awayFromConstraintsByEdge;
  if (!awayFromConstraintsByEdge)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_super v8 = self->_awayFromConstraintsByEdge;
    self->_awayFromConstraintsByEdge = v7;

    awayFromConstraintsByEdge = self->_awayFromConstraintsByEdge;
  }
  v9 = [NSNumber numberWithUnsignedInteger:edge];
  [(NSMutableDictionary *)awayFromConstraintsByEdge setObject:v18 forKey:v9];

  v10 = [(UILayoutGuide *)self owningView];
  v11 = [v10 window];

  if (v11) {
    [(UITrackingLayoutGuide *)self setConstrainedToWindowGuide:1];
  }
  v12 = [(UILayoutGuide *)self owningView];
  v13 = [v12 _window];
  v14 = [v13 _primaryKeyboardTrackingGuide];
  [v14 trackConstraintsFromViewBasedGuide:self];

  if ((self->_overlappingEdges & edge) == 0)
  {
    v15 = [(UILayoutGuide *)self owningView];
    v16 = [v15 _window];
    v17 = [v16 _primaryKeyboardTrackingGuide];
    [v17 updateConstraintsForActiveEdges];
  }
}

- (NSArray)constraintsActiveWhenAwayFromEdge:(NSDirectionalRectEdge)edge
{
  if ([(UITrackingLayoutGuide *)self constrainedToWindowGuide])
  {
    awayFromConstraintsByEdge = self->_awayFromConstraintsByEdge;
    v6 = [NSNumber numberWithUnsignedInteger:edge];
    [(NSMutableDictionary *)awayFromConstraintsByEdge objectForKey:v6];
  }
  else
  {
    v6 = [NSNumber numberWithUnsignedInteger:edge];
    [(UITrackingLayoutGuide *)self _awayFromCombinedTrackedConstraintsForEdgeKey:v6];
  v7 = };

  if (v7) {
    objc_super v8 = v7;
  }
  else {
    objc_super v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v9 = v8;

  return v9;
}

- (void)stopTrackingConstraintsForEdge:(unint64_t)a3
{
  nearEdgeConstraintsByEdge = self->_nearEdgeConstraintsByEdge;
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v18 = [(NSMutableDictionary *)nearEdgeConstraintsByEdge objectForKey:v6];

  if (v18)
  {
    v7 = [v18 firstObject];
    int v8 = [v7 isActive];

    if (v8) {
      [MEMORY[0x1E4F5B268] deactivateConstraints:v18];
    }
  }
  awayFromConstraintsByEdge = self->_awayFromConstraintsByEdge;
  v10 = [NSNumber numberWithUnsignedInteger:a3];
  v11 = [(NSMutableDictionary *)awayFromConstraintsByEdge objectForKey:v10];

  if (v11)
  {
    v12 = [v11 firstObject];
    int v13 = [v12 isActive];

    if (v13) {
      [MEMORY[0x1E4F5B268] deactivateConstraints:v11];
    }
  }
  v14 = self->_nearEdgeConstraintsByEdge;
  v15 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)v14 removeObjectForKey:v15];

  v16 = self->_awayFromConstraintsByEdge;
  v17 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)v16 removeObjectForKey:v17];
}

- (void)removeAllTrackedConstraints
{
  v3 = [(UILayoutGuide *)self owningView];
  v4 = [v3 window];

  if (v4)
  {
    v5 = [(UILayoutGuide *)self owningView];
    v6 = [v5 window];
    v7 = [v6 _primaryKeyboardTrackingGuide];
    [v7 removeTrackedConstraintsFromViewBasedGuide:self];
  }
  [(NSMutableDictionary *)self->_nearEdgeConstraintsByEdge removeAllObjects];
  awayFromConstraintsByEdge = self->_awayFromConstraintsByEdge;
  [(NSMutableDictionary *)awayFromConstraintsByEdge removeAllObjects];
}

- (void)setConstrainedToWindowGuide:(BOOL)a3
{
  if (self->_constrainedToWindowGuide != a3) {
    self->_constrainedToWindowGuide = a3;
  }
}

- (BOOL)constrainedToWindowGuide
{
  return self->_constrainedToWindowGuide;
}

- (id)_nearEdgeCombinedTrackedConstraintsForEdgeKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(UILayoutGuide *)self owningView];
  v6 = [v5 window];
  if (v6)
  {

LABEL_4:
    id v8 = 0;
    goto LABEL_5;
  }
  BOOL v7 = [(UITrackingLayoutGuide *)self constrainedToWindowGuide];

  if (v7) {
    goto LABEL_4;
  }
  v10 = [(NSMutableDictionary *)self->_nearEdgeConstraintsByEdge objectForKey:v4];
  if (v10)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v11 = objc_msgSend(v10, "allKeys", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [v10 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          if ([v16 count]) {
            [v8 addObjectsFromArray:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }

    if ([v8 count]) {
      goto LABEL_21;
    }
  }
  id v8 = 0;
LABEL_21:

LABEL_5:
  return v8;
}

- (id)_awayFromCombinedTrackedConstraintsForEdgeKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(UILayoutGuide *)self owningView];
  v6 = [v5 window];
  if (v6)
  {

LABEL_4:
    id v8 = 0;
    goto LABEL_5;
  }
  BOOL v7 = [(UITrackingLayoutGuide *)self constrainedToWindowGuide];

  if (v7) {
    goto LABEL_4;
  }
  v10 = [(NSMutableDictionary *)self->_awayFromConstraintsByEdge objectForKey:v4];
  if (v10)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v11 = objc_msgSend(v10, "allKeys", 0);
    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [v10 objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          if ([v16 count]) {
            [v8 addObjectsFromArray:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }

    if ([v8 count]) {
      goto LABEL_21;
    }
  }
  id v8 = 0;
LABEL_21:

LABEL_5:
  return v8;
}

- (NSMutableDictionary)nearEdgeConstraintsByEdge
{
  return self->_nearEdgeConstraintsByEdge;
}

- (void)setNearEdgeConstraintsByEdge:(id)a3
{
}

- (NSMutableDictionary)awayFromConstraintsByEdge
{
  return self->_awayFromConstraintsByEdge;
}

- (void)setAwayFromConstraintsByEdge:(id)a3
{
}

- (UIEdgeInsets)triggerInsetsForPortrait
{
  double top = self->_triggerInsetsForPortrait.top;
  double left = self->_triggerInsetsForPortrait.left;
  double bottom = self->_triggerInsetsForPortrait.bottom;
  double right = self->_triggerInsetsForPortrait.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTriggerInsetsForPortrait:(UIEdgeInsets)a3
{
  self->_triggerInsetsForPortrait = a3;
}

- (UIEdgeInsets)triggerInsetsForLandscape
{
  double top = self->_triggerInsetsForLandscape.top;
  double left = self->_triggerInsetsForLandscape.left;
  double bottom = self->_triggerInsetsForLandscape.bottom;
  double right = self->_triggerInsetsForLandscape.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTriggerInsetsForLandscape:(UIEdgeInsets)a3
{
  self->_triggerInsetsForLandscape = a3;
}

- (UIEdgeInsets)triggerProportions
{
  double top = self->_triggerProportions.top;
  double left = self->_triggerProportions.left;
  double bottom = self->_triggerProportions.bottom;
  double right = self->_triggerProportions.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTriggerProportions:(UIEdgeInsets)a3
{
  self->_triggerProportions = a3;
}

- (unint64_t)overlappingEdges
{
  return self->_overlappingEdges;
}

- (void)setOverlappingEdges:(unint64_t)a3
{
  self->_overlappingEdges = a3;
}

- (unint64_t)pausedEdges
{
  return self->_pausedEdges;
}

- (void)setPausedEdges:(unint64_t)a3
{
  self->_pausedEdges = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (unint64_t)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(unint64_t)a3
{
  self->_animationOptions = a3;
}

- (BOOL)animatingConstraintsChange
{
  return self->_animatingConstraintsChange;
}

- (void)setAnimatingConstraintsChange:(BOOL)a3
{
  self->_animatingConstraintsChange = a3;
}

- (BOOL)animatesChanges
{
  return self->_animatesChanges;
}

- (void)setAnimatesChanges:(BOOL)a3
{
  self->_animatesChanges = a3;
}

- (BOOL)skipAnimationOnNextPassOnly
{
  return self->_skipAnimationOnNextPassOnly;
}

- (void)setSkipAnimationOnNextPassOnly:(BOOL)a3
{
  self->_skipAnimationOnNextPassOnly = a3;
}

- (int64_t)owningViewInterfaceLayoutDirection
{
  return self->_owningViewInterfaceLayoutDirection;
}

- (void)setOwningViewInterfaceLayoutDirection:(int64_t)a3
{
  self->_owningViewInterfaceLayoutDirection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_awayFromConstraintsByEdge, 0);
  objc_storeStrong((id *)&self->_nearEdgeConstraintsByEdge, 0);
}

- (NSDictionary)edgeConstraints
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12[0] = @"UIKBNearEdgeConstraintsByEdge";
  uint64_t v3 = [(UITrackingLayoutGuide *)self nearEdgeConstraintsByEdge];
  id v4 = (void *)v3;
  uint64_t v5 = MEMORY[0x1E4F1CC08];
  if (v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CC08];
  }
  v12[1] = @"UIKBAwayFromEdgeConstraintsByEdge";
  v13[0] = v6;
  uint64_t v7 = [(UITrackingLayoutGuide *)self awayFromConstraintsByEdge];
  id v8 = (void *)v7;
  if (v7) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = v5;
  }
  v13[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return (NSDictionary *)v10;
}

- (void)_setOwningView:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UITrackingLayoutGuide;
  [(UILayoutGuide *)&v6 _setOwningView:v4];
  uint64_t v5 = [v4 window];

  if (v5) {
    [(UITrackingLayoutGuide *)self setConstrainedToWindowGuide:1];
  }
  self->_owningViewInterfaceLayoutDirection = [v4 effectiveUserInterfaceLayoutDirection];
  if (vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_triggerProportions.top), (int32x4_t)vceqzq_f64(*(float64x2_t *)&self->_triggerProportions.bottom))))))[(UITrackingLayoutGuide *)self _createThresholdsFromProportions]; {
}
  }

- (void)trackConstraintsFromViewBasedGuide:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = (UITrackingLayoutGuide *)a3;
  if (v4 != self && ![(UITrackingLayoutGuide *)self constrainedToWindowGuide])
  {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v4);
    objc_super v6 = [(UITrackingLayoutGuide *)v4 edgeConstraints];
    uint64_t v7 = [v6 objectForKey:@"UIKBNearEdgeConstraintsByEdge"];

    v29 = v7;
    v26 = v4;
    if ([v7 count])
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      obuint64_t j = [v7 allKeys];
      uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v35 != v10) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            uint64_t v13 = [(NSMutableDictionary *)self->_nearEdgeConstraintsByEdge objectForKey:v12];
            id v14 = (id)[v13 mutableCopy];

            if (!v14) {
              id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            v15 = [v29 objectForKey:v12];
            [v14 setObject:v15 forKey:v5];

            [(NSMutableDictionary *)self->_nearEdgeConstraintsByEdge setObject:v14 forKey:v12];
          }
          uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v9);
      }
    }
    v16 = [(UITrackingLayoutGuide *)v4 edgeConstraints];
    long long v17 = [v16 objectForKey:@"UIKBAwayFromEdgeConstraintsByEdge"];

    if ([v17 count])
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id obja = [v17 allKeys];
      uint64_t v18 = [obja countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v31;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v31 != v20) {
              objc_enumerationMutation(obja);
            }
            uint64_t v22 = *(void *)(*((void *)&v30 + 1) + 8 * j);
            v23 = [(NSMutableDictionary *)self->_awayFromConstraintsByEdge objectForKey:v22];
            id v24 = (id)[v23 mutableCopy];

            if (!v24) {
              id v24 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            v25 = [v17 objectForKey:v22];
            [v24 setObject:v25 forKey:v5];

            [(NSMutableDictionary *)self->_awayFromConstraintsByEdge setObject:v24 forKey:v22];
          }
          uint64_t v19 = [obja countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v19);
      }

      id v4 = v26;
    }
  }
}

- (void)removeTrackedConstraintsFromViewBasedGuide:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = (UITrackingLayoutGuide *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    [(UITrackingLayoutGuide *)v4 removeAllTrackedConstraints];
  }
  else if (![(UITrackingLayoutGuide *)self constrainedToWindowGuide])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%p", v5);
    v29 = v28 = v5;
    objc_super v6 = [(UITrackingLayoutGuide *)v5 edgeConstraints];
    uint64_t v7 = [v6 objectForKey:@"UIKBNearEdgeConstraintsByEdge"];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v27 = v7;
    uint64_t v8 = [v7 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v35 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          id v14 = [(NSMutableDictionary *)self->_nearEdgeConstraintsByEdge objectForKey:v13];
          v15 = (void *)[v14 mutableCopy];

          if (v15)
          {
            [v15 removeObjectForKey:v29];
            [(NSMutableDictionary *)self->_nearEdgeConstraintsByEdge setObject:v15 forKey:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v10);
    }

    v16 = [(UITrackingLayoutGuide *)v28 edgeConstraints];
    long long v17 = [v16 objectForKey:@"UIKBAwayFromEdgeConstraintsByEdge"];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v26 = v17;
    uint64_t v18 = [v17 allKeys];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * j);
          id v24 = [(NSMutableDictionary *)self->_awayFromConstraintsByEdge objectForKey:v23];
          v25 = (void *)[v24 mutableCopy];

          if (v25)
          {
            [v25 removeObjectForKey:v29];
            [(NSMutableDictionary *)self->_awayFromConstraintsByEdge setObject:v25 forKey:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v20);
    }

    uint64_t v5 = v28;
  }
}

- (void)pauseUpdatingConstraintsForEdges:(unint64_t)a3
{
  self->_pausedEdges = a3;
  self->_overlappingEdges = 0;
  [(UITrackingLayoutGuide *)self setSkipAnimationOnNextPassOnly:1];
  [(UITrackingLayoutGuide *)self _thresholdCheck];
}

- (void)startUpdatingConstraintsForEdges:(unint64_t)a3
{
  if (a3 == 15) {
    self->_pausedEdges = 0;
  }
  else {
    self->_pausedEdges &= ~a3;
  }
  self->_overlappingEdges = 0;
  [(UITrackingLayoutGuide *)self setSkipAnimationOnNextPassOnly:1];
  [(UITrackingLayoutGuide *)self _thresholdCheck];
}

- (void)updateConstraintsForActiveEdges
{
  self->_overlappingEdges = 0;
  [(UITrackingLayoutGuide *)self setSkipAnimationOnNextPassOnly:1];
  [(UITrackingLayoutGuide *)self _thresholdCheck];
}

- (BOOL)changeOffsetConstants:(UIOffset)a3
{
  if (a3.horizontal >= 0.0) {
    double horizontal = a3.horizontal;
  }
  else {
    double horizontal = 0.0;
  }
  if (a3.vertical >= 0.0) {
    double vertical = a3.vertical;
  }
  else {
    double vertical = 0.0;
  }
  objc_super v6 = [(UILayoutGuide *)self _systemConstraints];
  uint64_t v7 = [v6 objectAtIndexedSubscript:1];
  [v7 constant];
  double v9 = v8;
  uint64_t v10 = [(UILayoutGuide *)self _systemConstraints];
  uint64_t v11 = [v10 objectAtIndexedSubscript:2];
  [v11 constant];
  double v13 = v12;

  BOOL v14 = v13 == vertical && v9 == horizontal;
  v15 = [(UILayoutGuide *)self _systemConstraints];
  v16 = [v15 objectAtIndexedSubscript:1];
  [v16 setConstant:horizontal];

  long long v17 = [(UILayoutGuide *)self _systemConstraints];
  uint64_t v18 = [v17 objectAtIndexedSubscript:2];
  [v18 setConstant:vertical];

  if (!v14) {
    [(UITrackingLayoutGuide *)self setSkipAnimationOnNextPassOnly:1];
  }
  [(UITrackingLayoutGuide *)self _thresholdCheck];
  return v14;
}

- (BOOL)changeSizingConstants:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  objc_super v6 = [(UILayoutGuide *)self _systemConstraints];
  uint64_t v7 = [v6 objectAtIndexedSubscript:0];
  [v7 constant];
  double v9 = v8;
  uint64_t v10 = [(UILayoutGuide *)self _systemConstraints];
  uint64_t v11 = [v10 objectAtIndexedSubscript:3];
  [v11 constant];
  double v13 = v12;

  BOOL v14 = v13 != height || v9 != width;
  v15 = [(UILayoutGuide *)self _systemConstraints];
  v16 = [v15 objectAtIndexedSubscript:0];
  [v16 setConstant:width];

  long long v17 = [(UILayoutGuide *)self _systemConstraints];
  uint64_t v18 = [v17 objectAtIndexedSubscript:3];
  [v18 setConstant:height];

  if (!v14) {
    [(UITrackingLayoutGuide *)self setSkipAnimationOnNextPassOnly:1];
  }
  [(UITrackingLayoutGuide *)self _thresholdCheck];
  return v14;
}

- (void)_layoutOwningViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__UITrackingLayoutGuide_Internal___layoutOwningViewAnimated___block_invoke;
  aBlock[3] = &unk_1E52D9F70;
  aBlock[4] = self;
  uint64_t v5 = _Block_copy(aBlock);
  objc_super v6 = v5;
  if (v3)
  {
    if (!self->_animatingConstraintsChange
      && self->_animatesChanges
      && [(UITrackingLayoutGuide *)self constrainedToWindowGuide])
    {
      self->_animatingConstraintsChange = 1;
      double animationDuration = self->_animationDuration;
      unint64_t animationOptions = self->_animationOptions;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __61__UITrackingLayoutGuide_Internal___layoutOwningViewAnimated___block_invoke_2;
      v10[3] = &unk_1E52DA040;
      id v11 = v6;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __61__UITrackingLayoutGuide_Internal___layoutOwningViewAnimated___block_invoke_3;
      v9[3] = &unk_1E52DC3A0;
      v9[4] = self;
      +[UIView animateWithDuration:animationOptions delay:v10 options:v9 animations:animationDuration completion:0.0];
    }
  }
  else
  {
    (*((void (**)(void *))v5 + 2))(v5);
  }
}

void __61__UITrackingLayoutGuide_Internal___layoutOwningViewAnimated___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) constrainedToWindowGuide];
  BOOL v3 = [*(id *)(a1 + 32) owningView];
  id v5 = v3;
  if (v2)
  {
    [v3 layoutIfNeeded];
  }
  else
  {
    id v4 = [v3 _window];
    [v4 layoutViewsForTrackedGuides];
  }
}

uint64_t __61__UITrackingLayoutGuide_Internal___layoutOwningViewAnimated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __61__UITrackingLayoutGuide_Internal___layoutOwningViewAnimated___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 225) = 0;
  return result;
}

- (void)updateAnimationDuration:(double)a3 options:(unint64_t)a4
{
  self->_double animationDuration = a3;
  self->_unint64_t animationOptions = a4;
}

- (void)resetAnimationOptions
{
  self->_double animationDuration = 0.3;
  self->_unint64_t animationOptions = 0;
  self->_animatesChanges = 1;
}

- (void)enableAnimations:(BOOL)a3
{
  self->_animatesChanges = a3;
}

- (void)setProportionalEdgeThresholds:(UIEdgeInsets)a3
{
  self->_triggerProportions = a3;
}

- (void)setEdgeThresholds:(UIEdgeInsets)a3 forOrientation:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 2)
  {
    if ((unint64_t)(a4 - 3) > 1) {
      return;
    }
    id v4 = &OBJC_IVAR___UITrackingLayoutGuide__triggerInsetsForLandscape;
  }
  else
  {
    id v4 = &OBJC_IVAR___UITrackingLayoutGuide__triggerInsetsForPortrait;
  }
  *(UIEdgeInsets *)((char *)&self->super.super.isa + *v4) = a3;
}

- (unint64_t)validatedOverlappingEdges:(unint64_t)a3
{
  return a3;
}

- (void)_createThresholdsFromProportions
{
  BOOL v3 = [(UILayoutGuide *)self owningView];

  if (v3)
  {
    id v4 = [(UILayoutGuide *)self owningView];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;

    double top = self->_triggerProportions.top;
    double left = self->_triggerProportions.left;
    double v11 = v6 * left;
    double bottom = self->_triggerProportions.bottom;
    double right = self->_triggerProportions.right;
    double v14 = v6 * right;
    double v15 = v8 * top;
    double v16 = v8 * bottom;
    double v17 = v8 * left;
    double v18 = v8 * right;
    double v19 = v6 * top;
    double v20 = v6 * bottom;
    if (v6 <= v8) {
      double v21 = v19;
    }
    else {
      double v21 = v15;
    }
    if (v6 <= v8) {
      double v22 = v17;
    }
    else {
      double v22 = v11;
    }
    if (v6 <= v8) {
      double v23 = v20;
    }
    else {
      double v23 = v16;
    }
    if (v6 > v8)
    {
      double v24 = v20;
    }
    else
    {
      double v19 = v15;
      double v17 = v11;
      double v24 = v16;
    }
    if (v6 <= v8) {
      double v25 = v14;
    }
    else {
      double v25 = v18;
    }
    self->_triggerInsetsForPortrait.double top = v19;
    self->_triggerInsetsForPortrait.double left = v17;
    self->_triggerInsetsForPortrait.double bottom = v24;
    self->_triggerInsetsForPortrait.double right = v25;
    if (v6 <= v8) {
      double v26 = v18;
    }
    else {
      double v26 = v14;
    }
    self->_triggerInsetsForLandscape.double top = v21;
    self->_triggerInsetsForLandscape.double left = v22;
    self->_triggerInsetsForLandscape.double bottom = v23;
    self->_triggerInsetsForLandscape.double right = v26;
  }
}

- (BOOL)_isRTL
{
  return self->_owningViewInterfaceLayoutDirection == 1;
}

- (void)_thresholdCheck
{
  [(UILayoutGuide *)self layoutFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v15 = [(UILayoutGuide *)self owningView];
  [v15 bounds];
  -[UITrackingLayoutGuide _thresholdCheckForGuide:inContext:](self, "_thresholdCheckForGuide:inContext:", v4, v6, v8, v10, v11, v12, v13, v14);
}

- (void)_thresholdCheckForGuide:(CGRect)a3 inContext:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v30 = a4.origin.x;
  CGFloat v7 = a3.origin.x;
  uint64_t v9 = 3;
  if (a4.size.width > a4.size.height) {
    uint64_t v9 = 4;
  }
  double v10 = (double *)((char *)self + OBJC_IVAR___UITrackingLayoutGuide__nearEdgeConstraintsByEdge[v9]);
  double v40 = *v10;
  double v38 = v10[1];
  double v39 = v10[3];
  double v41 = v10[2];
  CGFloat v31 = a3.origin.x;
  CGFloat v32 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.size.width;
  CGFloat v13 = a3.size.height;
  CGFloat v33 = a3.size.height;
  double MinY = CGRectGetMinY(a3);
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  double v37 = MinY - CGRectGetMinY(v43);
  v44.origin.CGFloat x = v7;
  v44.origin.CGFloat y = v11;
  v44.size.CGFloat width = v12;
  v44.size.CGFloat height = v13;
  double MinX = CGRectGetMinX(v44);
  v45.origin.CGFloat x = v30;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  double v36 = MinX - CGRectGetMinX(v45);
  v46.origin.CGFloat x = v30;
  v46.origin.CGFloat y = y;
  v46.size.CGFloat width = width;
  v46.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v46);
  v47.origin.CGFloat x = v31;
  v47.origin.CGFloat y = v11;
  v47.size.CGFloat width = v32;
  v47.size.CGFloat height = v33;
  double v35 = MaxY - CGRectGetMaxY(v47);
  v48.origin.CGFloat x = v30;
  v48.origin.CGFloat y = y;
  v48.size.CGFloat width = width;
  v48.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v48);
  v49.origin.CGFloat x = v31;
  v49.origin.CGFloat y = v11;
  v49.size.CGFloat width = v32;
  v49.size.CGFloat height = v33;
  double v18 = MaxX - CGRectGetMaxX(v49);
  BOOL v19 = [(UITrackingLayoutGuide *)self _isRTL];
  uint64_t v20 = 2;
  if (v19) {
    uint64_t v21 = 8;
  }
  else {
    uint64_t v21 = 2;
  }
  if (!v19) {
    uint64_t v20 = 8;
  }
  unint64_t pausedEdges = self->_pausedEdges;
  if (v36 >= v38 || (pausedEdges & v21) != 0) {
    uint64_t v21 = 0;
  }
  if (v18 >= v39 || (pausedEdges & v20) != 0) {
    uint64_t v20 = 0;
  }
  uint64_t v25 = v21 | v20;
  BOOL v26 = v37 <= v40 && (self->_pausedEdges & 1) == 0;
  uint64_t v27 = v25 | v26;
  uint64_t v28 = (pausedEdges >> 2) & 1;
  if (v35 > v41) {
    LODWORD(v28) = 1;
  }
  if (v28) {
    uint64_t v29 = v27;
  }
  else {
    uint64_t v29 = v27 | 4;
  }
  -[UITrackingLayoutGuide _updateForOverlappingEdges:](self, "_updateForOverlappingEdges:", v29, v41, v35);
}

- (void)_updateForOverlappingEdges:(unint64_t)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if (self->_overlappingEdges != a3)
  {
    unint64_t v5 = -[UITrackingLayoutGuide validatedOverlappingEdges:](self, "validatedOverlappingEdges:");
    self->_overlappingEdges = v5;
    if (a3) {
      unint64_t v6 = self->_pausedEdges | v5 ^ 0xF;
    }
    else {
      unint64_t v6 = 15;
    }
    CGFloat v7 = [(UITrackingLayoutGuide *)self _keysInvolvingEdges:v5];
    double v8 = [(UITrackingLayoutGuide *)self _keysFromEdges:self->_overlappingEdges];
    uint64_t v9 = [(UITrackingLayoutGuide *)self _keysInvolvingEdges:v6];
    double v36 = [(UITrackingLayoutGuide *)self _keysFromEdges:v6];
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v51 != v15) {
            objc_enumerationMutation(v12);
          }
          double v17 = -[UITrackingLayoutGuide _awayFromCombinedTrackedConstraintsForEdgeKey:](self, "_awayFromCombinedTrackedConstraintsForEdgeKey:", *(void *)(*((void *)&v50 + 1) + 8 * i), v36);
          if (v17) {
            [v10 addObjectsFromArray:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v50 objects:v57 count:16];
      }
      while (v14);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v18 = v8;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v46 objects:v56 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v47;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v47 != v21) {
            objc_enumerationMutation(v18);
          }
          double v23 = -[UITrackingLayoutGuide _nearEdgeCombinedTrackedConstraintsForEdgeKey:](self, "_nearEdgeCombinedTrackedConstraintsForEdgeKey:", *(void *)(*((void *)&v46 + 1) + 8 * j), v36);
          if (v23) {
            [v11 addObjectsFromArray:v23];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v46 objects:v56 count:16];
      }
      while (v20);
    }

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v24 = v9;
    uint64_t v25 = [v24 countByEnumeratingWithState:&v42 objects:v55 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v43;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v43 != v27) {
            objc_enumerationMutation(v24);
          }
          uint64_t v29 = -[UITrackingLayoutGuide _nearEdgeCombinedTrackedConstraintsForEdgeKey:](self, "_nearEdgeCombinedTrackedConstraintsForEdgeKey:", *(void *)(*((void *)&v42 + 1) + 8 * k), v36);
          if (v29) {
            [v10 addObjectsFromArray:v29];
          }
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v42 objects:v55 count:16];
      }
      while (v26);
    }
    double v37 = v12;

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v30 = v36;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v38 objects:v54 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v39;
      do
      {
        for (uint64_t m = 0; m != v32; ++m)
        {
          if (*(void *)v39 != v33) {
            objc_enumerationMutation(v30);
          }
          double v35 = -[UITrackingLayoutGuide _awayFromCombinedTrackedConstraintsForEdgeKey:](self, "_awayFromCombinedTrackedConstraintsForEdgeKey:", *(void *)(*((void *)&v38 + 1) + 8 * m), v36, v37, (void)v38);
          if (v35) {
            [v11 addObjectsFromArray:v35];
          }
        }
        uint64_t v32 = [v30 countByEnumeratingWithState:&v38 objects:v54 count:16];
      }
      while (v32);
    }

    if ([v10 count])
    {
      [MEMORY[0x1E4F5B268] deactivateConstraints:v10];
      if (![v11 count]) {
        goto LABEL_49;
      }
    }
    else if (![v11 count])
    {
LABEL_50:
      -[UITrackingLayoutGuide setSkipAnimationOnNextPassOnly:](self, "setSkipAnimationOnNextPassOnly:", 0, v36);

      return;
    }
    objc_msgSend(MEMORY[0x1E4F5B268], "activateConstraints:", v11, v36);
LABEL_49:
    [(UITrackingLayoutGuide *)self _layoutOwningViewAnimated:[(UITrackingLayoutGuide *)self skipAnimationOnNextPassOnly] ^ 1];
    goto LABEL_50;
  }
  [(UITrackingLayoutGuide *)self setSkipAnimationOnNextPassOnly:0];
}

- (id)_keysFromEdges:(unint64_t)a3
{
  char v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v5 = v4;
  if ((v3 & 1) == 0)
  {
    uint64_t v6 = v3 & 2;
    goto LABEL_17;
  }
  [v4 addObject:&unk_1ED3F3420];
  if ((v3 & 2) != 0)
  {
    [v5 addObject:&unk_1ED3F3438];
    if ((v3 & 8) != 0)
    {
      [v5 addObject:&unk_1ED3F3450];
      if ((v3 & 4) == 0)
      {
        [v5 addObject:&unk_1ED3F3498];
LABEL_18:
        [v5 addObject:&unk_1ED3F34E0];
        if ((v3 & 8) == 0)
        {
          if ((v3 & 4) == 0) {
            goto LABEL_30;
          }
          goto LABEL_23;
        }
        [v5 addObject:&unk_1ED3F34F8];
        if ((v3 & 4) != 0)
        {
          [v5 addObject:&unk_1ED3F3510];
LABEL_23:
          uint64_t v8 = v3 & 8;
          [v5 addObject:&unk_1ED3F3528];
LABEL_27:
          [v5 addObject:&unk_1ED3F3540];
          if (!v8) {
            goto LABEL_30;
          }
          [v5 addObject:&unk_1ED3F3558];
        }
LABEL_29:
        [v5 addObject:&unk_1ED3F3570];
        goto LABEL_30;
      }
      [v5 addObject:&unk_1ED3F3468];
    }
    else if ((v3 & 4) == 0)
    {
      goto LABEL_18;
    }
    uint64_t v7 = v3 & 8;
    [v5 addObject:&unk_1ED3F3480];
  }
  else
  {
    uint64_t v7 = v3 & 8;
  }
  uint64_t v6 = v3 & 2;
  if (v7)
  {
    [v5 addObject:&unk_1ED3F3498];
    if ((v3 & 4) == 0) {
      goto LABEL_17;
    }
    [v5 addObject:&unk_1ED3F34B0];
  }
  else if ((v3 & 4) == 0)
  {
    goto LABEL_17;
  }
  [v5 addObject:&unk_1ED3F34C8];
LABEL_17:
  if (v6) {
    goto LABEL_18;
  }
  uint64_t v8 = v3 & 8;
  if ((v3 & 4) != 0) {
    goto LABEL_27;
  }
  if ((v3 & 8) != 0) {
    goto LABEL_29;
  }
LABEL_30:
  return v5;
}

- (id)_keysInvolvingEdges:(unint64_t)a3
{
  char v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v5 = v4;
  if (v3)
  {
    [v4 addObject:&unk_1ED3F3420];
    [v5 addObject:&unk_1ED3F3438];
    [v5 addObject:&unk_1ED3F34C8];
    [v5 addObject:&unk_1ED3F3498];
    [v5 addObject:&unk_1ED3F3450];
    [v5 addObject:&unk_1ED3F3480];
    [v5 addObject:&unk_1ED3F34B0];
    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:&unk_1ED3F34E0];
  [v5 addObject:&unk_1ED3F3528];
  [v5 addObject:&unk_1ED3F34F8];
  [v5 addObject:&unk_1ED3F3510];
  [v5 addObject:&unk_1ED3F3438];
  [v5 addObject:&unk_1ED3F3480];
  [v5 addObject:&unk_1ED3F3450];
  if ((v3 & 4) == 0)
  {
LABEL_4:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_13:
  [v5 addObject:&unk_1ED3F3540];
  [v5 addObject:&unk_1ED3F34C8];
  [v5 addObject:&unk_1ED3F3528];
  [v5 addObject:&unk_1ED3F3558];
  [v5 addObject:&unk_1ED3F3480];
  [v5 addObject:&unk_1ED3F34B0];
  [v5 addObject:&unk_1ED3F3510];
  if ((v3 & 8) != 0)
  {
LABEL_5:
    [v5 addObject:&unk_1ED3F3570];
    [v5 addObject:&unk_1ED3F3498];
    [v5 addObject:&unk_1ED3F34F8];
    [v5 addObject:&unk_1ED3F3558];
    [v5 addObject:&unk_1ED3F3450];
    [v5 addObject:&unk_1ED3F34B0];
    [v5 addObject:&unk_1ED3F3510];
  }
LABEL_6:
  if ([v5 count]) {
    [v5 addObject:&unk_1ED3F3468];
  }
  return v5;
}

@end