@interface UIFocusGuide
- (BOOL)_automaticallyDisableWhenIntersectingFocus;
- (BOOL)_automaticallyPreferOwningView;
- (BOOL)_ignoresSpeedBumpEdges;
- (BOOL)_isEligibleForFocusInteraction;
- (BOOL)_isPromiseFocusRegion;
- (BOOL)_isTransparentFocusRegion;
- (BOOL)_isUnclippable;
- (BOOL)_isUnoccludable;
- (BOOL)_legacy_isEligibleForFocusInteraction;
- (BOOL)_uili_isFocusGuide;
- (BOOL)canBecomeFocused;
- (BOOL)isEnabled;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)_focusRegionFrame;
- (NSArray)preferredFocusEnvironments;
- (NSString)description;
- (UIFocusGuide)init;
- (UIFocusGuide)initWithCoder:(id)a3;
- (UIFocusItemContainer)focusItemContainer;
- (UIView)preferredFocusedView;
- (float)_focusPriority;
- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4;
- (id)_encodablePreferredFocusEnvironments;
- (id)_focusRegionFocusSystem;
- (id)_focusRegionGuides;
- (id)_fulfillPromisedFocusRegion;
- (id)_preferredFocusRegionCoordinateSpace;
- (void)_searchForFocusRegionsInContext:(id)a3;
- (void)_setAutomaticallyDisableWhenIntersectingFocus:(BOOL)a3;
- (void)_setAutomaticallyPreferOwningView:(BOOL)a3;
- (void)encodeWithCoder:(id)a3;
- (void)focusGuideRegion:(id)a3 willParticipateAsDestinationRegionInFocusUpdate:(id)a4;
- (void)setEnabled:(BOOL)enabled;
- (void)setPreferredFocusEnvironments:(NSArray *)preferredFocusEnvironments;
- (void)setPreferredFocusedView:(UIView *)preferredFocusedView;
@end

@implementation UIFocusGuide

- (BOOL)_uili_isFocusGuide
{
  return 1;
}

- (UIFocusGuide)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIFocusGuide;
  result = [(UILayoutGuide *)&v3 init];
  if (result)
  {
    result->_enabled = 1;
    result->_automaticallyDisableWhenIntersectingFocus = 1;
    result->_automaticallyPreferOwningView = 1;
  }
  return result;
}

- (void)_setAutomaticallyPreferOwningView:(BOOL)a3
{
  self->_automaticallyPreferOwningView = a3;
}

- (void).cxx_destruct
{
}

- (void)setPreferredFocusEnvironments:(NSArray *)preferredFocusEnvironments
{
  v4 = preferredFocusEnvironments;
  if (!v4 || self->_preferredFocusEnvironments != v4)
  {
    v8 = v4;
    uint64_t v5 = [(NSArray *)v4 copy];
    v6 = (void *)v5;
    if (v5) {
      v7 = (void *)v5;
    }
    else {
      v7 = (void *)MEMORY[0x1E4F1CBF0];
    }
    objc_storeStrong((id *)&self->_preferredFocusEnvironments, v7);

    v4 = v8;
  }
  self->_didSetPreferredFocusedEnvironments = 1;
}

- (UIFocusGuide)initWithCoder:(id)a3
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)UIFocusGuide;
  uint64_t v5 = [(UILayoutGuide *)&v26 init];
  v6 = v5;
  if (v5)
  {
    v5->_enabled = 1;
    v5->_automaticallyDisableWhenIntersectingFocus = 1;
    v5->_automaticallyPreferOwningView = 1;
    if ([v4 containsValueForKey:@"_UIFocusGuideEnabledKey"]) {
      v6->_enabled = [v4 decodeBoolForKey:@"_UIFocusGuideEnabledKey"];
    }
    if ([v4 containsValueForKey:@"_UIFocusGuideDidSetPreferredFocusedViewKey"]) {
      v6->_didSetPreferredFocusedEnvironments = [v4 decodeBoolForKey:@"_UIFocusGuideDidSetPreferredFocusedViewKey"];
    }
    if ([v4 containsValueForKey:@"_UIFocusGuideAutomaticallyDisableWhenIntersectingFocusKey"])v6->_automaticallyDisableWhenIntersectingFocus = objc_msgSend(v4, "decodeBoolForKey:", @"_UIFocusGuideAutomaticallyDisableWhenIntersectingFocusKey"); {
    if ([v4 containsValueForKey:@"_UIFocusGuideAutomaticallyPreferOwningViewKey"])
    }
      v6->_automaticallyPreferOwningView = [v4 decodeBoolForKey:@"_UIFocusGuideAutomaticallyPreferOwningViewKey"];
    uint64_t v7 = [v4 decodeObjectForKey:@"_UIFocusGuidePreferredFocusedViewKey"];
    v8 = (void *)v7;
    if (v7)
    {
      v28[0] = v7;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
      preferredFocusEnvironments = v6->_preferredFocusEnvironments;
      v6->_preferredFocusEnvironments = (NSArray *)v9;
    }
    else
    {
      v11 = [v4 decodeObjectForKey:@"_UIFocusGuidePreferredFocusEnvironmentsKey"];
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      preferredFocusEnvironments = v11;
      uint64_t v13 = [(NSArray *)preferredFocusEnvironments countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(preferredFocusEnvironments);
            }
            v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            v18 = _UIFocusEnvironmentSafeCast(v17);

            if (v18) {
              objc_msgSend(v12, "addObject:", v17, (void)v22);
            }
          }
          uint64_t v14 = [(NSArray *)preferredFocusEnvironments countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v14);
      }

      uint64_t v19 = [v12 copy];
      v20 = v6->_preferredFocusEnvironments;
      v6->_preferredFocusEnvironments = (NSArray *)v19;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeBool:self->_enabled forKey:@"_UIFocusGuideEnabledKey"];
  [v5 encodeBool:self->_didSetPreferredFocusedEnvironments forKey:@"_UIFocusGuideDidSetPreferredFocusedViewKey"];
  [v5 encodeBool:self->_automaticallyDisableWhenIntersectingFocus forKey:@"_UIFocusGuideAutomaticallyDisableWhenIntersectingFocusKey"];
  [v5 encodeBool:self->_automaticallyPreferOwningView forKey:@"_UIFocusGuideAutomaticallyPreferOwningViewKey"];
  id v4 = [(UIFocusGuide *)self _encodablePreferredFocusEnvironments];
  if ([v4 count]) {
    [v5 encodeConditionalObject:v4 forKey:@"_UIFocusGuidePreferredFocusEnvironmentsKey"];
  }
}

- (id)_encodablePreferredFocusEnvironments
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(UIFocusGuide *)self preferredFocusEnvironments];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 conformsToProtocol:&unk_1ED402CA0]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (NSArray)preferredFocusEnvironments
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_preferredFocusEnvironments count])
  {
    preferredFocusEnvironments = self->_preferredFocusEnvironments;
LABEL_7:
    id v4 = preferredFocusEnvironments;
    goto LABEL_8;
  }
  if (![(UIFocusGuide *)self _automaticallyPreferOwningView]
    || self->_didSetPreferredFocusedEnvironments
    || ([(UILayoutGuide *)self owningView],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v6))
  {
    preferredFocusEnvironments = self->_preferredFocusEnvironments;
    if (!preferredFocusEnvironments) {
      preferredFocusEnvironments = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    goto LABEL_7;
  }
  uint64_t v7 = [(UILayoutGuide *)self owningView];
  v8[0] = v7;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

LABEL_8:
  return v4;
}

- (UIView)preferredFocusedView
{
  v2 = [(UIFocusGuide *)self preferredFocusEnvironments];
  id v3 = [v2 firstObject];

  if (v3 && _IsKindOfUIView((uint64_t)v3)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (UIView *)v4;
}

- (void)setPreferredFocusedView:(UIView *)preferredFocusedView
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v4 = preferredFocusedView;
  uint64_t v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    [(UIFocusGuide *)self setPreferredFocusEnvironments:v6];
  }
  else
  {
    [(UIFocusGuide *)self setPreferredFocusEnvironments:0];
  }
}

- (id)_focusRegionFocusSystem
{
  v2 = [(UILayoutGuide *)self owningView];
  id v3 = [v2 _focusSystem];

  return v3;
}

- (CGRect)_focusRegionFrame
{
  id v3 = [(UILayoutGuide *)self owningView];

  if (v3)
  {
    id v4 = [(UILayoutGuide *)self owningView];
    [(UILayoutGuide *)self layoutFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    long long v13 = [(UILayoutGuide *)self owningView];
    long long v14 = [v13 _window];
    objc_msgSend(v4, "convertRect:toCoordinateSpace:", v14, v6, v8, v10, v12);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
  }
  else
  {
    double v16 = *MEMORY[0x1E4F1DB28];
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  double v23 = v16;
  double v24 = v18;
  double v25 = v20;
  double v26 = v22;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (BOOL)_legacy_isEligibleForFocusInteraction
{
  if (![(UIFocusGuide *)self isEnabled]) {
    return 0;
  }
  id v3 = [(UILayoutGuide *)self owningView];
  if (v3)
  {
    id v4 = [(UIFocusGuide *)self preferredFocusedView];
    char v5 = -[UIView _containsPreferredFocusableView](v4);
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)canBecomeFocused
{
  return 1;
}

- (UIFocusItemContainer)focusItemContainer
{
  return 0;
}

- (id)_childFocusRegionsInRect:(CGRect)a3 inCoordinateSpace:(id)a4
{
  return 0;
}

- (BOOL)_isPromiseFocusRegion
{
  return 0;
}

- (id)_fulfillPromisedFocusRegion
{
  return 0;
}

- (BOOL)_isTransparentFocusRegion
{
  return 0;
}

- (id)_focusRegionGuides
{
  return 0;
}

- (BOOL)_isEligibleForFocusInteraction
{
  if (![(UIFocusGuide *)self isEnabled]) {
    return 0;
  }
  id v3 = [(UILayoutGuide *)self owningView];
  if (v3)
  {
    id v4 = [(UIFocusGuide *)self preferredFocusEnvironments];
    BOOL v5 = [v4 count] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  v2 = [(UILayoutGuide *)self owningView];
  id v3 = [v2 _screen];
  id v4 = [v3 coordinateSpace];

  return v4;
}

- (void)_searchForFocusRegionsInContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [_UIFocusGuideRegion alloc];
  [(UILayoutGuide *)self layoutFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  long long v14 = [(UILayoutGuide *)self owningView];
  double v15 = [v14 coordinateSpace];
  double v16 = -[_UIFocusGuideRegion initWithFrame:coordinateSpace:](v5, "initWithFrame:coordinateSpace:", v15, v7, v9, v11, v13);

  [(_UIFocusGuideRegion *)v16 setDelegate:self];
  [(_UIFocusGuideRegion *)v16 _setIsUnoccludable:[(UIFocusGuide *)self _isUnoccludable]];
  [(UIFocusGuide *)self _focusPriority];
  -[_UIFocusGuideRegion _setFocusPriority:](v16, "_setFocusPriority:");
  [(_UIFocusGuideRegion *)v16 _setIgnoresSpeedBumpEdges:[(UIFocusGuide *)self _ignoresSpeedBumpEdges]];
  [(_UIFocusGuideRegion *)v16 _setIsUnclippable:[(UIFocusGuide *)self _isUnclippable]];
  [v4 addRegion:v16];
}

- (BOOL)_isUnoccludable
{
  return 0;
}

- (BOOL)_isUnclippable
{
  return 0;
}

- (float)_focusPriority
{
  return 500.0;
}

- (BOOL)_ignoresSpeedBumpEdges
{
  return 0;
}

- (void)focusGuideRegion:(id)a3 willParticipateAsDestinationRegionInFocusUpdate:(id)a4
{
  id v6 = a4;
  BOOL v5 = [v6 _focusedGuide];

  if (!v5) {
    [v6 _setFocusedGuide:self];
  }
}

- (NSString)description
{
  id v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)UIFocusGuide;
  id v4 = [(UILayoutGuide *)&v9 description];
  BOOL v5 = [(UIFocusGuide *)self isEnabled];
  id v6 = @"NO";
  if (v5) {
    id v6 = @"YES";
  }
  double v7 = [v3 stringWithFormat:@"%@, isEnabled: %@", v4, v6];

  return (NSString *)v7;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)enabled
{
  self->_enabled = enabled;
}

- (BOOL)_automaticallyPreferOwningView
{
  return self->_automaticallyPreferOwningView;
}

- (BOOL)_automaticallyDisableWhenIntersectingFocus
{
  return self->_automaticallyDisableWhenIntersectingFocus;
}

- (void)_setAutomaticallyDisableWhenIntersectingFocus:(BOOL)a3
{
  self->_automaticallyDisableWhenIntersectingFocus = a3;
}

@end