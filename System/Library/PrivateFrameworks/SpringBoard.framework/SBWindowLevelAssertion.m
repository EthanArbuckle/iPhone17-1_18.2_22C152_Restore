@interface SBWindowLevelAssertion
- (NSString)description;
- (NSString)reason;
- (SBWindowLevelAssertion)initWithPriority:(int64_t)a3 windowLevel:(double)a4 reason:(id)a5 invalidationHandler:(id)a6;
- (double)windowLevel;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)priority;
- (void)invalidate;
@end

@implementation SBWindowLevelAssertion

- (SBWindowLevelAssertion)initWithPriority:(int64_t)a3 windowLevel:(double)a4 reason:(id)a5 invalidationHandler:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SBWindowLevelAssertion;
  v12 = [(SBWindowLevelAssertion *)&v19 init];
  v13 = v12;
  if (v12)
  {
    v12->_priority = a3;
    v12->_windowLevel = a4;
    uint64_t v14 = [v10 copy];
    reason = v13->_reason;
    v13->_reason = (NSString *)v14;

    uint64_t v16 = [v11 copy];
    id invalidationHandler = v13->_invalidationHandler;
    v13->_id invalidationHandler = (id)v16;
  }
  return v13;
}

- (NSString)description
{
  return (NSString *)[(SBWindowLevelAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBWindowLevelAssertion *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_reason withName:@"reason"];
  id v5 = (id)[v3 appendFloat:@"windowLevel" withName:self->_windowLevel];
  id v6 = (id)[v3 appendInteger:self->_priority withName:@"priority"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBWindowLevelAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (void)invalidate
{
  id invalidationHandler = self->_invalidationHandler;
  if (invalidationHandler)
  {
    id v5 = (void (**)(id, SBWindowLevelAssertion *))[invalidationHandler copy];
    id v4 = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    v5[2](v5, self);
  }
}

- (double)windowLevel
{
  return self->_windowLevel;
}

- (int64_t)priority
{
  return self->_priority;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end