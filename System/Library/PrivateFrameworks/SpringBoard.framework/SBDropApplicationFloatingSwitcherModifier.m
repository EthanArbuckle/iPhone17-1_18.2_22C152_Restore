@interface SBDropApplicationFloatingSwitcherModifier
- (BOOL)shouldPerformCrossfadeForReduceMotion;
- (SBDropApplicationFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (id)appLayoutsToResignActive;
- (id)keyboardSuppressionMode;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
@end

@implementation SBDropApplicationFloatingSwitcherModifier

- (SBDropApplicationFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBDropApplicationFloatingSwitcherModifier;
  v11 = [(SBTransitionSwitcherModifier *)&v14 initWithTransitionID:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fromAppLayout, a4);
    objc_storeStrong((id *)&v12->_toAppLayout, a5);
  }

  return v12;
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBDropApplicationFloatingSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  v4 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v2];

  return v4;
}

- (id)visibleAppLayouts
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = v3;
  if (self->_toAppLayout) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_fromAppLayout) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  v19.receiver = self;
  v19.super_class = (Class)SBDropApplicationFloatingSwitcherModifier;
  -[SBDropApplicationFloatingSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v19, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, a4);
  double v8 = v7;
  id v9 = [(SBDropApplicationFloatingSwitcherModifier *)self appLayouts];
  id v10 = v9;
  fromAppLayout = self->_fromAppLayout;
  if (!fromAppLayout
    || ([v9 objectAtIndex:a5],
        v12 = objc_claimAutoreleasedReturnValue(),
        BOOL v13 = [(SBAppLayout *)fromAppLayout isEqual:v12],
        v12,
        double v14 = 1.0,
        !v13))
  {
    toAppLayout = self->_toAppLayout;
    if (toAppLayout)
    {
      v16 = [v10 objectAtIndex:a5];
      BOOL v17 = [(SBAppLayout *)toAppLayout isEqual:v16];

      if (v17) {
        double v14 = 1.0;
      }
      else {
        double v14 = v8;
      }
    }
    else
    {
      double v14 = v8;
    }
  }

  return v14;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (id)appLayoutsToResignActive
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone];
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
}

@end