@interface UIFocusContainerGuide
- (BOOL)_isEligibleForFocusInteraction;
- (UIFocusContainerGuide)init;
- (void)_searchForFocusRegionsInContext:(id)a3;
@end

@implementation UIFocusContainerGuide

- (UIFocusContainerGuide)init
{
  v5.receiver = self;
  v5.super_class = (Class)UIFocusContainerGuide;
  v2 = [(UIFocusGuide *)&v5 init];
  v3 = v2;
  if (v2) {
    [(UIFocusGuide *)v2 _setAutomaticallyPreferOwningView:0];
  }
  return v3;
}

- (BOOL)_isEligibleForFocusInteraction
{
  if (![(UIFocusGuide *)self isEnabled]) {
    return 0;
  }
  v3 = [(UILayoutGuide *)self owningView];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)_searchForFocusRegionsInContext:(id)a3
{
  id v4 = a3;
  objc_super v5 = [_UIFocusContainerGuideRegion alloc];
  [(UILayoutGuide *)self layoutFrame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(UILayoutGuide *)self owningView];
  v15 = [v14 coordinateSpace];
  v19 = -[_UIFocusGuideRegion initWithFrame:coordinateSpace:](v5, "initWithFrame:coordinateSpace:", v15, v7, v9, v11, v13);

  [(_UIFocusGuideRegion *)v19 setDelegate:self];
  v16 = [(UILayoutGuide *)self owningView];
  v17 = [(UILayoutGuide *)self owningView];
  v18 = _UIFocusRegionContainerFromEnvironmentAndContainer((uint64_t)v16, (uint64_t)v17);
  [(_UIFocusContainerGuideRegion *)v19 setContentFocusRegionContainer:v18];

  [v4 addRegion:v19];
}

@end