@interface SBInjectVelocitySwitcherEventResponse
- (NSString)key;
- (SBAppLayout)appLayout;
- (SBInjectVelocitySwitcherEventResponse)initWithVelocity:(id)a3 forKey:(id)a4 appLayout:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)velocity;
- (int64_t)type;
@end

@implementation SBInjectVelocitySwitcherEventResponse

- (int64_t)type
{
  return 7;
}

- (SBInjectVelocitySwitcherEventResponse)initWithVelocity:(id)a3 forKey:(id)a4 appLayout:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBInjectVelocitySwitcherEventResponse;
  v12 = [(SBChainableModifierEventResponse *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(&v12->_velocity, a3);
    objc_storeStrong((id *)&v13->_appLayout, a5);
    uint64_t v14 = [v10 copy];
    key = v13->_key;
    v13->_key = (NSString *)v14;
  }
  return v13;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBInjectVelocitySwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v8 descriptionBuilderWithMultilinePrefix:a3];
  [v4 appendString:self->_key withName:@"key"];
  v5 = [(SBAppLayout *)self->_appLayout succinctDescription];
  id v6 = (id)[v4 appendObject:v5 withName:@"appLayout"];

  return v4;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (NSString)key
{
  return self->_key;
}

- (id)velocity
{
  return self->_velocity;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_velocity, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end