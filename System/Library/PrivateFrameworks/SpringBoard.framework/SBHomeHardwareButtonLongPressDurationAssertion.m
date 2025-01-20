@interface SBHomeHardwareButtonLongPressDurationAssertion
- (NSString)description;
- (NSString)reason;
- (SBHomeHardwareButtonLongPressDurationAssertion)initWithReason:(id)a3 duration:(double)a4;
- (double)duration;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation SBHomeHardwareButtonLongPressDurationAssertion

- (SBHomeHardwareButtonLongPressDurationAssertion)initWithReason:(id)a3 duration:(double)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBHomeHardwareButtonLongPressDurationAssertion;
  v7 = [(SBHomeHardwareButtonLongPressDurationAssertion *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_duration = a4;
    uint64_t v9 = [v6 copy];
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;
  }
  return v8;
}

- (NSString)description
{
  return (NSString *)[(SBHomeHardwareButtonLongPressDurationAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBHomeHardwareButtonLongPressDurationAssertion *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBHomeHardwareButtonLongPressDurationAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBHomeHardwareButtonLongPressDurationAssertion *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __88__SBHomeHardwareButtonLongPressDurationAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __88__SBHomeHardwareButtonLongPressDurationAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 16) withName:@"reason"];
  return (id)[*(id *)(a1 + 32) appendTimeInterval:@"duration" withName:0 decomposeUnits:*(double *)(*(void *)(a1 + 40) + 8)];
}

- (double)duration
{
  return self->_duration;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
}

@end