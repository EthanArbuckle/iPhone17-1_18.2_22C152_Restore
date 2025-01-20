@interface SBSAContainerPanGestureDescriptionMutator
- (CGPoint)initialLocation;
- (CGPoint)translation;
- (id)_containerPanGestureDescription;
- (void)setInitialLocation:(CGPoint)a3;
- (void)setTranslation:(CGPoint)a3;
@end

@implementation SBSAContainerPanGestureDescriptionMutator

- (CGPoint)initialLocation
{
  v2 = [(SBSAContainerPanGestureDescriptionMutator *)self _containerPanGestureDescription];
  [v2 initialLocation];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setInitialLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(SBSAContainerPanGestureDescriptionMutator *)self _containerPanGestureDescription];
  objc_msgSend(v5, "_setInitialLocation:", x, y);
}

- (CGPoint)translation
{
  v2 = [(SBSAContainerPanGestureDescriptionMutator *)self _containerPanGestureDescription];
  [v2 translation];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)setTranslation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(SBSAContainerPanGestureDescriptionMutator *)self _containerPanGestureDescription];
  objc_msgSend(v5, "_setTranslation:", x, y);
}

- (id)_containerPanGestureDescription
{
  v2 = [(SBSAGestureDescriptionMutator *)self gestureDescription];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

@end