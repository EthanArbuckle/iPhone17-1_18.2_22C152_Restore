@interface _SBUISimulatedLockoutAssertion
- (NSString)description;
- (_SBUISimulatedLockoutAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 queue:(id)a5 invalidationBlock:(id)a6;
- (_SBUISimulatedLockoutAssertion)initWithLockoutState:(unint64_t)a3 reason:(id)a4 invalidationBlock:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)lockoutState;
@end

@implementation _SBUISimulatedLockoutAssertion

- (_SBUISimulatedLockoutAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 queue:(id)a5 invalidationBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Use initWithLockoutState:reason:invalidationBlock:" userInfo:0];
  objc_exception_throw(v13);
}

- (_SBUISimulatedLockoutAssertion)initWithLockoutState:(unint64_t)a3 reason:(id)a4 invalidationBlock:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)_SBUISimulatedLockoutAssertion;
  result = [(BSSimpleAssertion *)&v7 initWithIdentifier:@"PasscodeRequiredAssertion" forReason:a4 queue:MEMORY[0x1E4F14428] invalidationBlock:a5];
  if (result) {
    result->_lockoutState = a3;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[(_SBUISimulatedLockoutAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_SBUISimulatedLockoutAssertion *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_SBUISimulatedLockoutAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(_SBUISimulatedLockoutAssertion *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72___SBUISimulatedLockoutAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E5CCC878;
  id v5 = v4;
  id v10 = v5;
  id v11 = self;
  id v6 = (id)[v5 modifyProem:v9];
  id v7 = v5;

  return v7;
}

- (unint64_t)lockoutState
{
  return self->_lockoutState;
}

@end