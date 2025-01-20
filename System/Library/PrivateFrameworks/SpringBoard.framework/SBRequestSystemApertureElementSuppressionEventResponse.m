@interface SBRequestSystemApertureElementSuppressionEventResponse
- (BOOL)wantsGlobalSuppression;
- (BOOL)wantsKeyLineEnabled;
- (NSUUID)invalidationIdentifier;
- (SBAppLayout)appLayout;
- (SBRequestSystemApertureElementSuppressionEventResponse)initWithAppLayout:(id)a3 wantsGlobalSuppression:(BOOL)a4 wantsKeyLineEnabled:(BOOL)a5 invalidationIdentifier:(id)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBRequestSystemApertureElementSuppressionEventResponse

- (int64_t)type
{
  return 35;
}

- (SBRequestSystemApertureElementSuppressionEventResponse)initWithAppLayout:(id)a3 wantsGlobalSuppression:(BOOL)a4 wantsKeyLineEnabled:(BOOL)a5 invalidationIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)SBRequestSystemApertureElementSuppressionEventResponse;
  v13 = [(SBChainableModifierEventResponse *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_appLayout, a3);
    objc_storeStrong((id *)&v14->_invalidationIdentifier, a6);
    v14->_wantsGlobalSuppression = a4;
    v14->_wantsKeyLineEnabled = a5;
  }

  return v14;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBRequestSystemApertureElementSuppressionEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v12 descriptionBuilderWithMultilinePrefix:a3];
  v5 = [(SBAppLayout *)self->_appLayout succinctDescription];
  id v6 = (id)[v4 appendObject:v5 withName:@"appLayout"];

  id v7 = (id)[v4 appendBool:self->_wantsGlobalSuppression withName:@"wantsGlobalSuppression"];
  id v8 = (id)[v4 appendBool:self->_wantsKeyLineEnabled withName:@"wantsKeyLineEnabled"];
  v9 = [(NSUUID *)self->_invalidationIdentifier UUIDString];
  id v10 = (id)[v4 appendObject:v9 withName:@"invalidationIdentifier"];

  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (NSUUID)invalidationIdentifier
{
  return self->_invalidationIdentifier;
}

- (BOOL)wantsGlobalSuppression
{
  return self->_wantsGlobalSuppression;
}

- (BOOL)wantsKeyLineEnabled
{
  return self->_wantsKeyLineEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationIdentifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end