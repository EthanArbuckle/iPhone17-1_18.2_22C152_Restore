@interface SBAppUnderFloatingSwitcherSwitcherModifier
- (BOOL)wantsAsynchronousSurfaceRetentionAssertion;
- (SBAppUnderFloatingSwitcherSwitcherModifier)initWithActiveAppLayout:(id)a3;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (id)appLayoutsToResignActive;
- (id)keyboardSuppressionMode;
@end

@implementation SBAppUnderFloatingSwitcherSwitcherModifier

- (SBAppUnderFloatingSwitcherSwitcherModifier)initWithActiveAppLayout:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBAppUnderFloatingSwitcherSwitcherModifier;
  v6 = [(SBSwitcherModifier *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appLayout, a3);
  }

  return v7;
}

- (id)appLayoutsToResignActive
{
  v2 = (void *)MEMORY[0x1E4F1C9E8];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [(SBAppUnderFloatingSwitcherSwitcherModifier *)self appLayouts];
  id v5 = [v3 setWithArray:v4];
  v6 = [v2 dictionaryWithObject:v5 forKey:&unk_1F334A430];

  return v6;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes];
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(1u, 0);
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 0;
}

- (void).cxx_destruct
{
}

@end