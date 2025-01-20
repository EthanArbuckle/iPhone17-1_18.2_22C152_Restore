@interface SBInitiateSystemApertureBounceSwitcherEventResponse
- (NSUUID)suppressionIdentifierToInvalidate;
- (SBAppLayout)appLayout;
- (SBInitiateSystemApertureBounceSwitcherEventResponse)initWithAppLayout:(id)a3 suppressionIdentifierToInvalidate:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBInitiateSystemApertureBounceSwitcherEventResponse

- (int64_t)type
{
  return 37;
}

- (SBInitiateSystemApertureBounceSwitcherEventResponse)initWithAppLayout:(id)a3 suppressionIdentifierToInvalidate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBInitiateSystemApertureBounceSwitcherEventResponse;
  v9 = [(SBChainableModifierEventResponse *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appLayout, a3);
    objc_storeStrong((id *)&v10->_suppressionIdentifierToInvalidate, a4);
  }

  return v10;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBInitiateSystemApertureBounceSwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v10 descriptionBuilderWithMultilinePrefix:a3];
  v5 = [(SBAppLayout *)self->_appLayout succinctDescription];
  id v6 = (id)[v4 appendObject:v5 withName:@"appLayout"];

  id v7 = [(NSUUID *)self->_suppressionIdentifierToInvalidate UUIDString];
  id v8 = (id)[v4 appendObject:v7 withName:@"suppression id to invalidate"];

  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (NSUUID)suppressionIdentifierToInvalidate
{
  return self->_suppressionIdentifierToInvalidate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressionIdentifierToInvalidate, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end