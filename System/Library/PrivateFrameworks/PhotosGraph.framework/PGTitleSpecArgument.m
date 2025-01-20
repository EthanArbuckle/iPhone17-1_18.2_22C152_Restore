@interface PGTitleSpecArgument
- (BOOL)requiresInput;
- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4;
- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5;
- (id)inputVariable;
- (void)setInputVariable:(id)a3;
- (void)setRequiresInput:(BOOL)a3;
@end

@implementation PGTitleSpecArgument

- (void).cxx_destruct
{
}

- (void)setInputVariable:(id)a3
{
}

- (id)inputVariable
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setRequiresInput:(BOOL)a3
{
  self->_requiresInput = a3;
}

- (BOOL)requiresInput
{
  return self->_requiresInput;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5
{
  return 0;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  return 0;
}

@end