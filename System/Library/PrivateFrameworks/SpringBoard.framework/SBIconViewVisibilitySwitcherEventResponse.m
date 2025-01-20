@interface SBIconViewVisibilitySwitcherEventResponse
- (BOOL)isVisible;
- (NSSet)excludedIconLocations;
- (SBAppLayout)appLayout;
- (SBFFluidBehaviorSettings)animationSettings;
- (SBIconViewVisibilitySwitcherEventResponse)initWithAppLayout:(id)a3 visible:(BOOL)a4 animationSettings:(id)a5 excludedIconLocations:(id)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBIconViewVisibilitySwitcherEventResponse

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBIconViewVisibilitySwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v10 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendBool:self->_visible withName:@"visible"];
  id v6 = (id)[v4 appendObject:self->_animationSettings withName:@"animationSettings"];
  v7 = [(SBAppLayout *)self->_appLayout succinctDescription];
  id v8 = (id)[v4 appendObject:v7 withName:@"appLayout"];

  return v4;
}

- (int64_t)type
{
  return 13;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (SBFFluidBehaviorSettings)animationSettings
{
  return self->_animationSettings;
}

- (NSSet)excludedIconLocations
{
  return self->_excludedIconLocations;
}

- (SBIconViewVisibilitySwitcherEventResponse)initWithAppLayout:(id)a3 visible:(BOOL)a4 animationSettings:(id)a5 excludedIconLocations:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBIconViewVisibilitySwitcherEventResponse;
  v14 = [(SBChainableModifierEventResponse *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_appLayout, a3);
    v15->_visible = a4;
    objc_storeStrong((id *)&v15->_animationSettings, a5);
    objc_storeStrong((id *)&v15->_excludedIconLocations, a6);
  }

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedIconLocations, 0);
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end