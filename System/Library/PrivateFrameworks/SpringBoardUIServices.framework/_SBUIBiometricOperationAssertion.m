@interface _SBUIBiometricOperationAssertion
- (NSSet)operations;
- (NSString)description;
- (_SBUIBiometricOperationAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 queue:(id)a5 invalidationBlock:(id)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setOperations:(id)a3;
@end

@implementation _SBUIBiometricOperationAssertion

- (_SBUIBiometricOperationAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 queue:(id)a5 invalidationBlock:(id)a6
{
  id v10 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89___SBUIBiometricOperationAssertion_initWithIdentifier_forReason_queue_invalidationBlock___block_invoke;
  v15[3] = &unk_1E5CCE2F8;
  id v16 = v10;
  v14.receiver = self;
  v14.super_class = (Class)_SBUIBiometricOperationAssertion;
  id v11 = v10;
  v12 = [(BSSimpleAssertion *)&v14 initWithIdentifier:a3 forReason:a4 queue:a5 invalidationBlock:v15];

  return v12;
}

- (NSString)description
{
  return (NSString *)[(_SBUIBiometricOperationAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_SBUIBiometricOperationAssertion *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_SBUIBiometricOperationAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(_SBUIBiometricOperationAssertion *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74___SBUIBiometricOperationAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E5CCC878;
  id v5 = v4;
  id v10 = v5;
  id v11 = self;
  id v6 = (id)[v5 modifyProem:v9];
  id v7 = v5;

  return v7;
}

- (NSSet)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end