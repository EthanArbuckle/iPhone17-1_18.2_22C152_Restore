@interface TRAUserInterfaceStyleResolutionPolicyInfo
- (TRASettingsActuationContext)actuationContext;
- (TRAUserInterfaceStyleResolutionPolicyInfo)initWithActuationContext:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setActuationContext:(id)a3;
@end

@implementation TRAUserInterfaceStyleResolutionPolicyInfo

- (TRAUserInterfaceStyleResolutionPolicyInfo)initWithActuationContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRAUserInterfaceStyleResolutionPolicyInfo;
  v5 = [(TRAUserInterfaceStyleResolutionPolicyInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    actuationContext = v5->_actuationContext;
    v5->_actuationContext = (TRASettingsActuationContext *)v6;
  }
  return v5;
}

- (id)succinctDescription
{
  v2 = [(TRAUserInterfaceStyleResolutionPolicyInfo *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = v3;
  actuationContext = self->_actuationContext;
  if (actuationContext) {
    id v6 = (id)[v3 appendObject:actuationContext withName:@"Actuation Context"];
  }
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(TRAUserInterfaceStyleResolutionPolicyInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (TRASettingsActuationContext)actuationContext
{
  return self->_actuationContext;
}

- (void)setActuationContext:(id)a3
{
}

- (void).cxx_destruct
{
}

@end