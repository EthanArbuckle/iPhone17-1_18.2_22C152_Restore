@interface _SBUIBiometricMatchingAssertion
- (NSString)description;
- (_SBUIBiometricMatchingAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 queue:(id)a5 invalidationBlock:(id)a6;
- (_SBUIBiometricMatchingAssertion)initWithMatchMode:(unint64_t)a3 reason:(id)a4 invalidationBlock:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)restartCount;
- (unint64_t)matchMode;
- (void)setRestartCount:(int64_t)a3;
@end

@implementation _SBUIBiometricMatchingAssertion

- (_SBUIBiometricMatchingAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 queue:(id)a5 invalidationBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:@"Use initWithMatchMode:reason:invalidationBlock:" userInfo:0];
  objc_exception_throw(v13);
}

- (_SBUIBiometricMatchingAssertion)initWithMatchMode:(unint64_t)a3 reason:(id)a4 invalidationBlock:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)_SBUIBiometricMatchingAssertion;
  result = [(_SBUIBiometricOperationAssertion *)&v7 initWithIdentifier:@"MatchingAssertion" forReason:a4 queue:MEMORY[0x1E4F14428] invalidationBlock:a5];
  if (result) {
    result->_matchMode = a3;
  }
  return result;
}

- (NSString)description
{
  return (NSString *)[(_SBUIBiometricMatchingAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(_SBUIBiometricMatchingAssertion *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(_SBUIBiometricMatchingAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(_SBUIBiometricMatchingAssertion *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __73___SBUIBiometricMatchingAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E5CCC878;
  id v5 = v4;
  id v10 = v5;
  id v11 = self;
  id v6 = (id)[v5 modifyProem:v9];
  id v7 = v5;

  return v7;
}

- (unint64_t)matchMode
{
  return self->_matchMode;
}

- (int64_t)restartCount
{
  return self->_restartCount;
}

- (void)setRestartCount:(int64_t)a3
{
  self->_restartCount = a3;
}

@end