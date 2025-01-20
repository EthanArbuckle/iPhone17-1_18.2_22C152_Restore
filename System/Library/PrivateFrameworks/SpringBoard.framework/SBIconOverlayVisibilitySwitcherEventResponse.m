@interface SBIconOverlayVisibilitySwitcherEventResponse
- (BOOL)isVisible;
- (SBAppLayout)appLayout;
- (SBIconOverlayVisibilitySwitcherEventResponse)initWithAppLayout:(id)a3 visible:(BOOL)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBIconOverlayVisibilitySwitcherEventResponse

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBIconOverlayVisibilitySwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v9 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendBool:self->_visible withName:@"visible"];
  v6 = [(SBAppLayout *)self->_appLayout succinctDescription];
  id v7 = (id)[v4 appendObject:v6 withName:@"appLayout"];

  return v4;
}

- (void).cxx_destruct
{
}

- (int64_t)type
{
  return 12;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (SBIconOverlayVisibilitySwitcherEventResponse)initWithAppLayout:(id)a3 visible:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBIconOverlayVisibilitySwitcherEventResponse;
  v8 = [(SBChainableModifierEventResponse *)&v11 init];
  objc_super v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appLayout, a3);
    v9->_visible = a4;
  }

  return v9;
}

@end