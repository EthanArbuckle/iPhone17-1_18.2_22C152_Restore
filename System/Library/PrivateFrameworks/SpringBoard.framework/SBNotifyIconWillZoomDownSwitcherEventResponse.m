@interface SBNotifyIconWillZoomDownSwitcherEventResponse
- (SBAppLayout)appLayout;
- (SBNotifyIconWillZoomDownSwitcherEventResponse)initWithAppLayout:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBNotifyIconWillZoomDownSwitcherEventResponse

- (int64_t)type
{
  return 14;
}

- (SBNotifyIconWillZoomDownSwitcherEventResponse)initWithAppLayout:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBNotifyIconWillZoomDownSwitcherEventResponse;
  v6 = [(SBChainableModifierEventResponse *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appLayout, a3);
  }

  return v7;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBNotifyIconWillZoomDownSwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v8 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = [(SBAppLayout *)self->_appLayout succinctDescription];
  id v6 = (id)[v4 appendObject:v5 withName:@"appLayout"];

  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (void).cxx_destruct
{
}

@end