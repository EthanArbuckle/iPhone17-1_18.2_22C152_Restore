@interface SBCaptureApplicationLaunchAssertion
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)reason;
- (NSUUID)identifier;
- (SBCaptureApplicationLaunchAssertion)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 reason:(id)a5 invalidationHandler:(id)a6;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)invalidate;
@end

@implementation SBCaptureApplicationLaunchAssertion

- (SBCaptureApplicationLaunchAssertion)initWithIdentifier:(id)a3 bundleIdentifier:(id)a4 reason:(id)a5 invalidationHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)SBCaptureApplicationLaunchAssertion;
  v14 = [(SBCaptureApplicationLaunchAssertion *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSUUID *)v15;

    uint64_t v17 = [v11 copy];
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    reason = v14->_reason;
    v14->_reason = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    id invalidationHandler = v14->_invalidationHandler;
    v14->_id invalidationHandler = (id)v21;
  }
  return v14;
}

- (NSString)description
{
  return (NSString *)[(SBCaptureApplicationLaunchAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBCaptureApplicationLaunchAssertion *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_identifier withName:@"identifier"];
  id v5 = (id)[v3 appendObject:self->_bundleIdentifier withName:@"bundleIdentifier"];
  id v6 = (id)[v3 appendObject:self->_reason withName:@"reason"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBCaptureApplicationLaunchAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (void)invalidate
{
  id invalidationHandler = (void (**)(id, SBCaptureApplicationLaunchAssertion *))self->_invalidationHandler;
  if (invalidationHandler)
  {
    invalidationHandler[2](invalidationHandler, self);
    id v4 = self->_invalidationHandler;
    self->_id invalidationHandler = 0;
  }
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end