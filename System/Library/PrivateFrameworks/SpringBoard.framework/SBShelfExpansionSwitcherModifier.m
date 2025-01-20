@interface SBShelfExpansionSwitcherModifier
- (BOOL)_isEffectivelyInShelf;
- (BOOL)_isMovingFromLeadingToTrailing;
- (BOOL)isFocusEnabledForAppLayout:(id)a3;
- (BOOL)shouldInterruptForRemovalEvent:(id)a3;
- (BOOL)shouldUpdateAnimatableProperty:(id)a3;
- (CGPoint)_bezierPointFromTime:(double)a3 start:(CGPoint)a4 target:(CGPoint)a5;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBShelfExpansionSwitcherModifier)initWithTransitionID:(id)a3 expand:(BOOL)a4 style:(unint64_t)a5 target:(CGPoint)a6 animationDelegate:(id)a7;
- (SBShelfExpansionSwitcherModifierDelegate)animationDelegate;
- (double)_presentationValueForIndex:(unint64_t)a3;
- (double)modelValueForAnimatableProperty:(id)a3 currentValue:(double)a4 creating:(BOOL)a5;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (double)shelfBackgroundBlurOpacity;
- (id)_visibleOrderedAppLayouts;
- (id)animatablePropertyIdentifiers;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleAnimatablePropertyChangedEvent:(id)a3;
- (id)settingsForAnimatableProperty:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
- (int64_t)updateModeForAnimatableProperty:(id)a3;
- (unint64_t)transactionCompletionOptions;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBShelfExpansionSwitcherModifier

- (SBShelfExpansionSwitcherModifier)initWithTransitionID:(id)a3 expand:(BOOL)a4 style:(unint64_t)a5 target:(CGPoint)a6 animationDelegate:(id)a7
{
  CGFloat y = a6.y;
  CGFloat x = a6.x;
  id v13 = a7;
  v20.receiver = self;
  v20.super_class = (Class)SBShelfExpansionSwitcherModifier;
  v14 = [(SBTransitionSwitcherModifier *)&v20 initWithTransitionID:a3];
  v15 = v14;
  if (v14)
  {
    v14->_expand = a4;
    v14->_target.CGFloat x = x;
    v14->_target.CGFloat y = y;
    v14->_style = a5;
    objc_storeWeak((id *)&v14->_animationDelegate, v13);
    v15->_topMostLayoutElements_lastAppLayoutsGenCount = 0x7FFFFFFFFFFFFFFFLL;
    v15->_topMostLayoutElements_lastOrientation = 0;
    CGPoint v17 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v16 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    v15->_topMostLayoutElements_lastContainerViewBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    v15->_topMostLayoutElements_lastContainerViewBounds.size = v16;
    v15->_topMostLayoutElements_lastSwitcherViewBounds.origin = v17;
    v15->_topMostLayoutElements_lastSwitcherViewBounds.size = v16;
    v15->_topMostLayoutElements_lastContentOffset = (CGPoint)SBInvalidPoint;
    topMostLayoutElements_lastElements = v15->_topMostLayoutElements_lastElements;
    v15->_topMostLayoutElements_lastElements = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v15;
}

- (void)didMoveToParentModifier:(id)a3
{
  v23.receiver = self;
  v23.super_class = (Class)SBShelfExpansionSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v23, sel_didMoveToParentModifier_);
  if (a3)
  {
    v5 = [(SBShelfExpansionSwitcherModifier *)self medusaSettings];
    v6 = v5;
    if (self->_style == 1)
    {
      v7 = [v5 switcherShelfGenieRopeSettings];
      ropeSettings = self->_ropeSettings;
      self->_ropeSettings = v7;

      [v6 switcherShelfCardGenieDismissedScale];
      self->_dismissalScale = v9;
      [v6 switcherShelfCardGenieResponseIncrementScalar];
      self->_perIndexResponseIncrement = v10;
      if (self->_expand) {
        [v6 switcherShelfCardGeniePresentationSettings];
      }
      else {
      v11 = [v6 switcherShelfCardGenieDismissalSettings];
      }
      settings = self->_settings;
      self->_settings = v11;

      [v6 switcherShelfGenieBezierCurvePointYDeltaFromTarget];
      self->_bezierCurvePointYDeltaFromTarget = v18;
      [v6 switcherShelfGenieBezierCurveXExponent];
      self->_bezierCurveXExponent = v19;
      [v6 switcherShelfGenieBezierCurveYExponent];
      self->_bezierCurveYExponent = v20;
      [v6 switcherShelfGenieBezierCurveScaleExponent];
      self->_bezierCurveScaleExponent = v21;
    }
    else
    {
      v12 = [v5 switcherShelfNonGenieRopeSettings];
      id v13 = self->_ropeSettings;
      self->_ropeSettings = v12;

      [v6 switcherShelfCardNonGenieDismissedScale];
      self->_dismissalScale = v14;
      [v6 switcherShelfCardNonGenieResponseIncrementScalar];
      self->_perIndexResponseIncrement = v15;
      if (self->_expand) {
        [v6 switcherShelfCardNonGeniePresentationSettings];
      }
      else {
      CGSize v16 = [v6 switcherShelfCardNonGenieDismissalSettings];
      }
      v22 = self->_settings;
      self->_settings = v16;
    }
  }
}

- (BOOL)shouldInterruptForRemovalEvent:(id)a3
{
  return self->_expand;
}

- (id)animatablePropertyIdentifiers
{
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", @"SBShelfRopeAnimatableProperty", @"SBShelfBackgroundBlurAnimatableProperty", 0);
  v4 = [(SBShelfExpansionSwitcherModifier *)self _visibleOrderedAppLayouts];
  if ([v4 count])
  {
    unint64_t v5 = 0;
    uint64_t v6 = -1;
    do
    {
      uint64_t v7 = [v4 count];
      v8 = [NSString stringWithFormat:@"%ld%@", v7 + v6, @"-SBShelfExpansionSwitcherModifier"];
      [v3 addObject:v8];

      ++v5;
      --v6;
    }
    while (v5 < [v4 count]);
  }

  return v3;
}

- (double)modelValueForAnimatableProperty:(id)a3 currentValue:(double)a4 creating:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  if ([v7 isEqualToString:@"SBShelfRopeAnimatableProperty"])
  {
    double v8 = 1.0;
    if (self->_expand) {
      double v9 = 1.0;
    }
    else {
      double v9 = 0.0;
    }
    if (self->_expand) {
      double v8 = 0.0;
    }
    if (v5) {
      double v10 = v8;
    }
    else {
      double v10 = v9;
    }
    goto LABEL_37;
  }
  if ([v7 isEqualToString:@"SBShelfBackgroundBlurAnimatableProperty"])
  {
    if (v5)
    {
      if (self->_expand) {
        double v10 = 0.0;
      }
      else {
        double v10 = 1.0;
      }
      goto LABEL_37;
    }
    if (self->_expand)
    {
      v11 = [(SBShelfExpansionSwitcherModifier *)self appLayouts];
      if ([v11 count])
      {
        uint64_t v12 = [v11 count];
        BOOL v13 = [(SBShelfExpansionSwitcherModifier *)self _isMovingFromLeadingToTrailing];
        uint64_t v14 = -1;
        if (!v13) {
          uint64_t v14 = -v12;
        }
        double v15 = [NSString stringWithFormat:@"%ld%@", v14 + v12, @"-SBShelfExpansionSwitcherModifier"];
        [(SBShelfExpansionSwitcherModifier *)self presentationValueForAnimatableProperty:v15];
        -[SBShelfExpansionSwitcherModifier modelValueForAnimatableProperty:currentValue:creating:](self, "modelValueForAnimatableProperty:currentValue:creating:", v15, 0);
        double v10 = v16;
      }
      else
      {
        double v10 = 1.0;
      }

      goto LABEL_37;
    }
LABEL_31:
    double v10 = 0.0;
    goto LABEL_37;
  }
  if (v5)
  {
    if ([(SBShelfExpansionSwitcherModifier *)self _isEffectivelyInShelf]) {
      double v10 = 1.0;
    }
    else {
      double v10 = 0.0;
    }
    goto LABEL_37;
  }
  if (!self->_expand) {
    goto LABEL_31;
  }
  uint64_t v17 = _SBShelfExpansionIndexFromAnimatableIdentifier(v7);
  double v10 = 1.0;
  if (v17 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v18 = v17;
    double v19 = [(SBShelfExpansionSwitcherModifier *)self _visibleOrderedAppLayouts];
    uint64_t v20 = [v19 count];

    [(SBShelfExpansionSwitcherModifier *)self presentationValueForAnimatableProperty:@"SBShelfRopeAnimatableProperty"];
    double v22 = v21;
    double v23 = 1.0 / (double)(unint64_t)(v20 + 1);
    BOOL v24 = [(SBShelfExpansionSwitcherModifier *)self _isMovingFromLeadingToTrailing];
    if (!self->_style || v24)
    {
      if (v18 <= vcvtmd_u64_f64(v22 / v23)) {
        double v10 = 1.0;
      }
      else {
        double v10 = 0.0;
      }
    }
    else if (v18 >= (unint64_t)((double)(unint64_t)(v20 - 1) - floor(v22 / v23)))
    {
      double v10 = 1.0;
    }
    else
    {
      double v10 = 0.0;
    }
  }
LABEL_37:

  return v10;
}

- (int64_t)updateModeForAnimatableProperty:(id)a3
{
  return 3;
}

- (id)settingsForAnimatableProperty:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"SBShelfRopeAnimatableProperty"])
  {
    uint64_t v5 = 192;
LABEL_11:
    id v12 = *(id *)((char *)&self->super.super.super.super.isa + v5);
LABEL_12:
    v11 = v12;
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"SBShelfBackgroundBlurAnimatableProperty"])
  {
    if (self->_expand)
    {
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
      [v6 setDampingRatio:1.0];
      id v7 = [(SBShelfExpansionSwitcherModifier *)self appLayouts];
      unint64_t v8 = [v7 count];

      if (v8 >= 5) {
        unint64_t v9 = 5;
      }
      else {
        unint64_t v9 = v8;
      }
      [(SBFFluidBehaviorSettings *)self->_settings response];
      [v6 setResponse:v10 + (double)v9 * self->_perIndexResponseIncrement];

      v11 = 0;
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if (self->_expand)
  {
LABEL_10:
    uint64_t v5 = 184;
    goto LABEL_11;
  }
  uint64_t v14 = _SBShelfExpansionIndexFromAnimatableIdentifier(v4);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v27.receiver = self;
    v27.super_class = (Class)SBShelfExpansionSwitcherModifier;
    id v12 = [(SBShelfExpansionSwitcherModifier *)&v27 settingsForAnimatableProperty:v4];
    goto LABEL_12;
  }
  unint64_t v15 = v14;
  double v16 = [(SBShelfExpansionSwitcherModifier *)self _visibleOrderedAppLayouts];
  unint64_t v17 = [v16 count];

  double v18 = (double)v15;
  double v19 = (double)v17 + -1.0;
  unint64_t v20 = 5 - (unint64_t)((double)v15 / v19 * 5.0);
  BOOL v21 = [(SBShelfExpansionSwitcherModifier *)self _isMovingFromLeadingToTrailing];
  unint64_t v22 = (unint64_t)((double)(unint64_t)v18 / v19 * 5.0);
  if (v21) {
    unint64_t v22 = v20;
  }
  if (self->_style == 1) {
    unint64_t v20 = v22;
  }
  [(SBFFluidBehaviorSettings *)self->_settings dampingRatio];
  double v24 = v23;
  [(SBFFluidBehaviorSettings *)self->_settings response];
  double v26 = v25 + (double)v20 * self->_perIndexResponseIncrement;
  v11 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
  [v11 setResponse:v26];
  [v11 setDampingRatio:v24];
  CAFrameRateRange v29 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v29.minimum, *(double *)&v29.maximum, *(double *)&v29.preferred);
LABEL_13:

  return v11;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SBShelfExpansionSwitcherModifier;
  -[SBShelfExpansionSwitcherModifier frameForIndex:](&v15, sel_frameForIndex_);
  UIRectGetCenter();
  double v6 = v5;
  double v8 = v7;
  [(SBShelfExpansionSwitcherModifier *)self _presentationValueForIndex:a3];
  if (self->_style == 1)
  {
    long double v10 = 1.0 - v9;
    -[SBShelfExpansionSwitcherModifier _bezierPointFromTime:start:target:](self, "_bezierPointFromTime:start:target:", (double)pow(1.0 - v9, self->_bezierCurveXExponent), v6, v8, self->_target.x, self->_target.y);
    -[SBShelfExpansionSwitcherModifier _bezierPointFromTime:start:target:](self, "_bezierPointFromTime:start:target:", (double)pow(v10, self->_bezierCurveYExponent), v6, v8, self->_target.x, self->_target.y);
  }
  else
  {
    [(SBShelfExpansionSwitcherModifier *)self switcherViewBounds];
    [(SBShelfExpansionSwitcherModifier *)self switcherViewBounds];
  }
  UIRectCenteredAboutPoint();
  result.size.height = v14;
  result.size.width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (BOOL)shouldUpdateAnimatableProperty:(id)a3
{
  return [(SBTransitionSwitcherModifier *)self transitionPhase] != 1;
}

- (double)scaleForIndex:(unint64_t)a3
{
  -[SBShelfExpansionSwitcherModifier _presentationValueForIndex:](self, "_presentationValueForIndex:");
  if (self->_style == 1)
  {
    double v6 = fmax(v5, 0.0);
    if (v6 >= 1.0) {
      double v8 = 0.0;
    }
    else {
      double v8 = 1.0 - v6;
    }
    double dismissalScale = self->_dismissalScale;
    double v9 = dismissalScale + (1.0 - dismissalScale) * (1.0 - pow(v8, self->_bezierCurveScaleExponent));
  }
  else
  {
    double v9 = self->_dismissalScale + v5 * (1.0 - self->_dismissalScale);
  }
  v12.receiver = self;
  v12.super_class = (Class)SBShelfExpansionSwitcherModifier;
  [(SBShelfExpansionSwitcherModifier *)&v12 scaleForIndex:a3];
  return v9 * v10;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  if (self->_style == 1) {
    return 1.0;
  }
  -[SBShelfExpansionSwitcherModifier _presentationValueForIndex:](self, "_presentationValueForIndex:", a5, a4);
  return result;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  [(SBShelfExpansionSwitcherModifier *)self _presentationValueForIndex:a4];
  double v8 = v7;
  v11.receiver = self;
  v11.super_class = (Class)SBShelfExpansionSwitcherModifier;
  [(SBShelfExpansionSwitcherModifier *)&v11 shadowOpacityForLayoutRole:a3 atIndex:a4];
  return v8 * v9 + 0.0;
}

- (double)shelfBackgroundBlurOpacity
{
  [(SBShelfExpansionSwitcherModifier *)self presentationValueForAnimatableProperty:@"SBShelfBackgroundBlurAnimatableProperty"];
  return result;
}

- (unint64_t)transactionCompletionOptions
{
  return 6;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBShelfExpansionSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v6 animationAttributesForLayoutElement:a3];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setUpdateMode:1];
  return v4;
}

- (BOOL)isFocusEnabledForAppLayout:(id)a3
{
  return self->_expand;
}

- (id)topMostLayoutElements
{
  unint64_t v3 = [(SBShelfExpansionSwitcherModifier *)self appLayoutsGenerationCount];
  int64_t v4 = [(SBShelfExpansionSwitcherModifier *)self switcherInterfaceOrientation];
  [(SBShelfExpansionSwitcherModifier *)self containerViewBounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(SBShelfExpansionSwitcherModifier *)self switcherViewBounds];
  CGFloat v28 = v14;
  CGFloat v29 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [(SBShelfExpansionSwitcherModifier *)self scrollViewContentOffset];
  double v20 = v19;
  double v22 = v21;
  if (*(_OWORD *)&self->_topMostLayoutElements_lastAppLayoutsGenCount != __PAIR128__(v4, v3)) {
    goto LABEL_10;
  }
  v32.origin.CGFloat x = v6;
  v32.origin.CGFloat y = v8;
  v32.size.width = v10;
  v32.size.height = v12;
  if (!CGRectEqualToRect(self->_topMostLayoutElements_lastContainerViewBounds, v32)) {
    goto LABEL_10;
  }
  v33.origin.CGFloat y = v28;
  v33.origin.CGFloat x = v29;
  v33.size.width = v16;
  v33.size.height = v18;
  if (!CGRectEqualToRect(self->_topMostLayoutElements_lastSwitcherViewBounds, v33)) {
    goto LABEL_10;
  }
  if (self->_topMostLayoutElements_lastContentOffset.x != v20
    || self->_topMostLayoutElements_lastContentOffset.y != v22)
  {
LABEL_10:
    self->_topMostLayoutElements_lastAppLayoutsGenCount = v3;
    self->_topMostLayoutElements_lastOrientation = v4;
    self->_topMostLayoutElements_lastContainerViewBounds.origin.CGFloat x = v6;
    self->_topMostLayoutElements_lastContainerViewBounds.origin.CGFloat y = v8;
    self->_topMostLayoutElements_lastContainerViewBounds.size.width = v10;
    self->_topMostLayoutElements_lastContainerViewBounds.size.height = v12;
    self->_topMostLayoutElements_lastSwitcherViewBounds.origin.CGFloat x = v29;
    self->_topMostLayoutElements_lastSwitcherViewBounds.origin.CGFloat y = v28;
    self->_topMostLayoutElements_lastSwitcherViewBounds.size.width = v16;
    self->_topMostLayoutElements_lastSwitcherViewBounds.size.height = v18;
    self->_topMostLayoutElements_lastContentOffset.CGFloat x = v20;
    self->_topMostLayoutElements_lastContentOffset.CGFloat y = v22;
    v30.receiver = self;
    v30.super_class = (Class)SBShelfExpansionSwitcherModifier;
    double v24 = [(SBShelfExpansionSwitcherModifier *)&v30 topMostLayoutElements];
    topMostLayoutElements_lastElements = self->_topMostLayoutElements_lastElements;
    self->_topMostLayoutElements_lastElements = v24;
  }
  double v26 = self->_topMostLayoutElements_lastElements;
  return v26;
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBShelfExpansionSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  unint64_t v3 = [[SBPreemptAnimationSwitcherEventResponse alloc] initWithOptions:3];
  int64_t v4 = SBAppendSwitcherModifierResponse(v3, v2);

  return v4;
}

- (id)handleAnimatablePropertyChangedEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBShelfExpansionSwitcherModifier;
  unint64_t v3 = [(SBSwitcherModifier *)&v7 handleAnimatablePropertyChangedEvent:a3];
  int64_t v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:1];
  double v5 = SBAppendSwitcherModifierResponse(v4, v3);

  return v5;
}

- (id)_visibleOrderedAppLayouts
{
  v13.receiver = self;
  v13.super_class = (Class)SBShelfExpansionSwitcherModifier;
  id v3 = [(SBShelfExpansionSwitcherModifier *)&v13 appLayoutsGenerationCount];
  v12.receiver = self;
  v12.super_class = (Class)SBShelfExpansionSwitcherModifier;
  [(SBShelfExpansionSwitcherModifier *)&v12 scrollViewContentOffset];
  if (self->_cached_appLayoutsGenCount != v3
    || (self->_cached_scrollViewContentOffset.x == v4 ? (BOOL v6 = self->_cached_scrollViewContentOffset.y == v5) : (BOOL v6 = 0),
        !v6 || (objc_super v7 = self->_cached_visibleOrderedAppLayouts) == 0))
  {
    self->_cached_appLayoutsGenCount = (unint64_t)v3;
    self->_cached_scrollViewContentOffset.CGFloat x = v4;
    self->_cached_scrollViewContentOffset.CGFloat y = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
    double v9 = [WeakRetained orderedVisibleAppLayoutsForShelfExpansionModifier:self];
    cached_visibleOrderedAppLayouts = self->_cached_visibleOrderedAppLayouts;
    self->_cached_visibleOrderedAppLayouts = v9;

    objc_super v7 = self->_cached_visibleOrderedAppLayouts;
  }
  return v7;
}

- (BOOL)_isMovingFromLeadingToTrailing
{
  double x = self->_target.x;
  [(SBShelfExpansionSwitcherModifier *)self switcherViewBounds];
  return [(SBShelfExpansionSwitcherModifier *)self isRTLEnabled] ^ (x >= v4 * 0.5);
}

- (BOOL)_isEffectivelyInShelf
{
  return ([(SBTransitionSwitcherModifier *)self transitionPhase] == 1) ^ self->_expand;
}

- (CGPoint)_bezierPointFromTime:(double)a3 start:(CGPoint)a4 target:(CGPoint)a5
{
  double y = a4.y;
  double x = a4.x;
  long double v7 = fmin(fmax(a3, 0.0), 1.0);
  CGFloat v8 = a5.x - a4.x;
  CGFloat v9 = v8 * 3.0;
  CGFloat v10 = -(v8 * 3.0 - (a5.x - a5.x) * 3.0);
  CGFloat v17 = v8 - v8 * 3.0 - v10;
  double v11 = (y - y) * 3.0;
  double v12 = -(v11 - (a5.y + self->_bezierCurvePointYDeltaFromTarget - a4.y) * 3.0);
  CGFloat v13 = a5.y - a4.y - v11 - v12;
  long double v14 = pow(v7, 3.0);
  double v15 = y + v7 * v7 * v12 + v13 * v14 + v11 * v7;
  double v16 = x + v10 * (v7 * v7) + v17 * v14 + v9 * v7;
  result.double y = v15;
  result.double x = v16;
  return result;
}

- (double)_presentationValueForIndex:(unint64_t)a3
{
  double v5 = [(SBShelfExpansionSwitcherModifier *)self _visibleOrderedAppLayouts];
  if ([v5 count])
  {
    if ([v5 count] <= a3) {
      a3 = [v5 count] - 1;
    }
    uint64_t v6 = [v5 count];
    long double v7 = [NSString stringWithFormat:@"%ld%@", v6 + ~a3, @"-SBShelfExpansionSwitcherModifier"];
    [(SBShelfExpansionSwitcherModifier *)self presentationValueForAnimatableProperty:v7];
    double v9 = v8;
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (SBShelfExpansionSwitcherModifierDelegate)animationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationDelegate);
  return (SBShelfExpansionSwitcherModifierDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animationDelegate);
  objc_storeStrong((id *)&self->_topMostLayoutElements_lastElements, 0);
  objc_storeStrong((id *)&self->_cached_visibleOrderedAppLayouts, 0);
  objc_storeStrong((id *)&self->_ropeSettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end