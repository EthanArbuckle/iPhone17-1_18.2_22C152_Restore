@interface SBiPadOSWindowModeChangeTransitionModifier
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (SBAppLayout)fromAppLayout;
- (SBAppLayout)toAppLayout;
- (SBiPadOSWindowModeChangeTransitionModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5;
- (unint64_t)maskedCornersForIndex:(unint64_t)a3;
@end

@implementation SBiPadOSWindowModeChangeTransitionModifier

- (SBiPadOSWindowModeChangeTransitionModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5
{
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBiPadOSWindowModeChangeTransitionModifier;
  v12 = [(SBTransitionSwitcherModifier *)&v16 initWithTransitionID:a3];
  if (v12)
  {
    if (v10)
    {
      if (v11)
      {
LABEL_4:
        objc_storeStrong((id *)&v12->_fromAppLayout, a4);
        objc_storeStrong((id *)&v12->_toAppLayout, a5);
        goto LABEL_5;
      }
    }
    else
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, v12, @"SBiPadOSWindowModeChangeTransitionModifier.m", 16, @"Invalid parameter not satisfying: %@", @"fromAppLayout" object file lineNumber description];

      if (v11) {
        goto LABEL_4;
      }
    }
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, v12, @"SBiPadOSWindowModeChangeTransitionModifier.m", 17, @"Invalid parameter not satisfying: %@", @"toAppLayout" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v12;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  if ([(SBAppLayout *)self->_fromAppLayout containsAnyItemFromAppLayout:v6]
    || [(SBAppLayout *)self->_toAppLayout containsAnyItemFromAppLayout:v6])
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBiPadOSWindowModeChangeTransitionModifier;
    BOOL v7 = [(SBiPadOSWindowModeChangeTransitionModifier *)&v9 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  }

  return v7;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  v5 = [(SBiPadOSWindowModeChangeTransitionModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  v9.receiver = self;
  v9.super_class = (Class)SBiPadOSWindowModeChangeTransitionModifier;
  id v7 = [(SBTransitionSwitcherModifier *)&v9 maskedCornersForIndex:a3];
  if ([(SBAppLayout *)self->_toAppLayout isOrContainsAppLayout:v6]
    && (![(SBiPadOSWindowModeChangeTransitionModifier *)self isChamoisWindowingUIEnabled]|| [(SBiPadOSWindowModeChangeTransitionModifier *)self appLayoutContainsAnUnoccludedMaximizedDisplayItem:v6]))
  {
    id v7 = 0;
  }

  return (unint64_t)v7;
}

- (SBAppLayout)fromAppLayout
{
  return self->_fromAppLayout;
}

- (SBAppLayout)toAppLayout
{
  return self->_toAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end