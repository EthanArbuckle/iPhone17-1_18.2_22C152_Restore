@interface SBSwitcherToAppExposeSwitcherModifier
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBSwitcherToAppExposeSwitcherModifier)initWithTransitionID:(id)a3 bundleIdentifier:(id)a4 appExposeModifier:(id)a5;
- (double)_offsetForPushingCardsOffscreenAtIndex:(unint64_t)a3;
- (id)_newAppExposeModifier;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
- (id)visibleAppLayouts;
@end

@implementation SBSwitcherToAppExposeSwitcherModifier

- (SBSwitcherToAppExposeSwitcherModifier)initWithTransitionID:(id)a3 bundleIdentifier:(id)a4 appExposeModifier:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  v11 = [(SBTransitionSwitcherModifier *)&v18 initWithTransitionID:v9];
  if (v11)
  {
    if (a4)
    {
      if (v10)
      {
LABEL_4:
        objc_storeStrong((id *)&v11->_appExposeModifier, a5);
        v12 = [SBRouteToAppExposeSwitcherModifier alloc];
        id v13 = [(SBSwitcherToAppExposeSwitcherModifier *)v11 _newAppExposeModifier];
        v14 = [(SBRouteToAppExposeSwitcherModifier *)v12 initWithTransitionID:v9 appExposeModifier:v13];

        [(SBChainableModifier *)v11 addChildModifier:v14 atLevel:0 key:0];
        goto LABEL_5;
      }
    }
    else
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v11, @"SBSwitcherToAppExposeSwitcherModifier.m", 41, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

      if (v10) {
        goto LABEL_4;
      }
    }
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, v11, @"SBSwitcherToAppExposeSwitcherModifier.m", 42, @"Invalid parameter not satisfying: %@", @"appExposeModifier" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v11;
}

- (id)transitionWillBegin
{
  v12.receiver = self;
  v12.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v12 transitionWillBegin];
  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  v4 = [(SBSwitcherToAppExposeSwitcherModifier *)&v11 visibleAppLayouts];
  appLayoutsVisibleBeforeTransition = self->_appLayoutsVisibleBeforeTransition;
  self->_appLayoutsVisibleBeforeTransition = v4;

  [(SBChainableModifier *)self addChildModifier:self->_appExposeModifier atLevel:1 key:0];
  v6 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  v7 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v6];

  v8 = [[SBTimerEventSwitcherEventResponse alloc] initWithDelay:0 validator:@"Switcher to App Expose did begin" reason:0.0];
  id v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v7];

  return v9;
}

- (id)handleTimerEvent:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  v5 = [(SBTransitionSwitcherModifier *)&v25 handleTimerEvent:v4];
  v6 = [v4 reason];
  int v7 = [v6 isEqualToString:@"Switcher to App Expose did begin"];

  if (v7)
  {
    v8 = [(SBSwitcherToAppExposeSwitcherModifier *)self appLayouts];
    id v9 = [v8 firstObject];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        uint64_t v14 = 0;
        v15 = v9;
        do
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v21 + 1) + 8 * v14);
          if (objc_msgSend(v16, "environment", (void)v21) == 1)
          {
            id v9 = v15;
            goto LABEL_12;
          }
          id v9 = v16;

          ++v14;
          v15 = v9;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    if (v9)
    {
      v17 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v9 alignment:0 animated:0];
      objc_super v18 = +[SBChainableModifierEventResponse responseByAppendingResponse:v17 toResponse:v5];

      v19 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
      v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v19 toResponse:v18];
    }
  }

  return v5;
}

- (id)transitionWillUpdate
{
  [(SBChainableModifier *)self removeChildModifier:self->_appExposeModifier];
  appExposeModifier = self->_appExposeModifier;
  self->_appExposeModifier = 0;

  v6.receiver = self;
  v6.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v6 transitionWillUpdate];
  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  -[SBSwitcherToAppExposeSwitcherModifier frameForIndex:](&v19, sel_frameForIndex_);
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
  if (self->_appExposeModifier)
  {
    [(SBSwitcherToAppExposeSwitcherModifier *)self _offsetForPushingCardsOffscreenAtIndex:a3];
    CGFloat v14 = v13;
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRect v21 = CGRectOffset(v20, v14, 0.0);
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
  }
  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  v3 = [(SBSwitcherToAppExposeSwitcherModifier *)&v6 visibleAppLayouts];
  id v4 = [v3 setByAddingObjectsFromSet:self->_appLayoutsVisibleBeforeTransition];

  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBSwitcherToAppExposeSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v10 animationAttributesForLayoutElement:a3];
  double v5 = (void *)[v4 mutableCopy];

  objc_super v6 = [(SBSwitcherToAppExposeSwitcherModifier *)self switcherSettings];
  double v7 = [v6 animationSettings];
  v8 = [v7 toggleAppSwitcherSettings];
  [v5 setLayoutSettings:v8];

  return v5;
}

- (double)_offsetForPushingCardsOffscreenAtIndex:(unint64_t)a3
{
  double v5 = [(SBSwitcherToAppExposeSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  LODWORD(v5) = [v6 environment] != 2;
  [(SBSwitcherToAppExposeSwitcherModifier *)self switcherViewBounds];
  double v8 = v7;
  if ([(SBSwitcherToAppExposeSwitcherModifier *)self isRTLEnabled] != v5) {
    double v8 = -v8;
  }

  return v8;
}

- (id)_newAppExposeModifier
{
  return (id)[(SBAppExposeGridSwitcherModifier *)self->_appExposeModifier copy];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayoutsVisibleBeforeTransition, 0);
  objc_storeStrong((id *)&self->_appExposeModifier, 0);
}

@end