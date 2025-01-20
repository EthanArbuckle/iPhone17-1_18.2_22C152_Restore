@interface _SBIdleTimerConfigurationInfo
- (NSString)description;
- (NSString)reason;
- (SBIdleTimerRequestConfiguration)configuration;
- (_SBIdleTimerConfigurationInfo)initWithConfiguration:(id)a3 reason:(id)a4;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation _SBIdleTimerConfigurationInfo

- (_SBIdleTimerConfigurationInfo)initWithConfiguration:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SBIdleTimerConfigurationInfo;
  v9 = [(_SBIdleTimerConfigurationInfo *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    uint64_t v11 = [v8 copy];
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;
  }
  return v10;
}

- (NSString)description
{
  return (NSString *)[(_SBIdleTimerConfigurationInfo *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_SBIdleTimerConfigurationInfo *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_reason withName:@"reason"];
  id v5 = (id)[v3 appendObject:self->_configuration withName:@"configuration"];
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_SBIdleTimerConfigurationInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (SBIdleTimerRequestConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end