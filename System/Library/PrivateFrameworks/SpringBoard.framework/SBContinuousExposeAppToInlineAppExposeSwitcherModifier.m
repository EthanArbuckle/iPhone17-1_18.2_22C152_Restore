@interface SBContinuousExposeAppToInlineAppExposeSwitcherModifier
- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBContinuousExposeAppToInlineAppExposeSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 activeAppLayout:(id)a5 appExposeBundleIdentifier:(id)a6;
- (id)_inlineAppExposeAppLayouts;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
@end

@implementation SBContinuousExposeAppToInlineAppExposeSwitcherModifier

- (SBContinuousExposeAppToInlineAppExposeSwitcherModifier)initWithTransitionID:(id)a3 direction:(int64_t)a4 activeAppLayout:(id)a5 appExposeBundleIdentifier:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SBContinuousExposeAppToInlineAppExposeSwitcherModifier;
  v13 = [(SBTransitionSwitcherModifier *)&v16 initWithTransitionID:a3];
  v14 = v13;
  if (v13)
  {
    v13->_direction = a4;
    objc_storeStrong((id *)&v13->_activeAppLayout, a5);
    objc_storeStrong((id *)&v14->_appExposeBundleIdentifier, a6);
  }

  return v14;
}

- (id)transitionWillBegin
{
  v9.receiver = self;
  v9.super_class = (Class)SBContinuousExposeAppToInlineAppExposeSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v9 transitionWillBegin];
  v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  v5 = SBAppendSwitcherModifierResponse(v4, v3);

  if ([(SBTransitionSwitcherModifier *)self transitionPhase] == 1)
  {
    v6 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
    uint64_t v7 = SBAppendSwitcherModifierResponse(v6, v5);

    v5 = (void *)v7;
  }
  return v5;
}

- (id)visibleAppLayouts
{
  v8.receiver = self;
  v8.super_class = (Class)SBContinuousExposeAppToInlineAppExposeSwitcherModifier;
  v3 = [(SBContinuousExposeAppToInlineAppExposeSwitcherModifier *)&v8 visibleAppLayouts];
  v4 = v3;
  if (self->_direction)
  {
    id v5 = v3;
  }
  else
  {
    v6 = [(SBContinuousExposeAppToInlineAppExposeSwitcherModifier *)self _inlineAppExposeAppLayouts];
    id v5 = [v4 setByAddingObjectsFromArray:v6];
  }
  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_direction == 1)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposeAppToInlineAppExposeSwitcherModifier;
    id v6 = [(SBTransitionSwitcherModifier *)&v9 adjustedAppLayoutsForAppLayouts:v4];
  }
  uint64_t v7 = v6;

  return v7;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v29.receiver = self;
  v29.super_class = (Class)SBContinuousExposeAppToInlineAppExposeSwitcherModifier;
  -[SBContinuousExposeAppToInlineAppExposeSwitcherModifier frameForIndex:](&v29, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(SBContinuousExposeAppToInlineAppExposeSwitcherModifier *)self appLayouts];
  v14 = [v13 objectAtIndex:a3];

  unint64_t v15 = [(SBTransitionSwitcherModifier *)self transitionPhase];
  if (([v14 isEqual:self->_activeAppLayout] & 1) == 0)
  {
    objc_super v16 = [v14 continuousExposeIdentifier];
    char v17 = [v16 containsString:self->_appExposeBundleIdentifier];

    if ((v17 & 1) == 0)
    {
      v18 = [(SBContinuousExposeAppToInlineAppExposeSwitcherModifier *)self chamoisLayoutAttributes];
      [v18 stripWidth];
      double v20 = v19;

      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] == 1)
      {
        [(SBContinuousExposeAppToInlineAppExposeSwitcherModifier *)self containerViewBounds];
        double v22 = v10 * 0.5 + v21;
      }
      else
      {
        double v22 = v10 * -0.5 - v20;
      }
      int64_t direction = self->_direction;
      if (direction || v15 != 2)
      {
        if (v15 == 1 && direction == 1) {
          double v6 = v22;
        }
      }
      else
      {
        double v6 = v22;
      }
    }
  }

  double v25 = v6;
  double v26 = v8;
  double v27 = v10;
  double v28 = v12;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  id v5 = a4;
  double v6 = [(SBContinuousExposeAppToInlineAppExposeSwitcherModifier *)self appLayouts];
  uint64_t v7 = [v6 indexOfObject:v5];

  [(SBContinuousExposeAppToInlineAppExposeSwitcherModifier *)self frameForIndex:v7];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_inlineAppExposeAppLayouts
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = [(SBContinuousExposeAppToInlineAppExposeSwitcherModifier *)self appLayouts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v9 = [v8 continuousExposeIdentifier];
        if ([v9 containsString:self->_appExposeBundleIdentifier])
        {
          char v10 = [v8 isEqual:self->_activeAppLayout];

          if ((v10 & 1) == 0) {
            [v12 addObject:v8];
          }
        }
        else
        {
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appExposeBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_activeAppLayout, 0);
}

@end