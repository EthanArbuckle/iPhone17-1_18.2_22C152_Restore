@interface AEMinimalTemplateStepIf
- (BOOL)negated;
- (NSMutableArray)elseSteps;
- (NSMutableArray)thenSteps;
- (NSString)conditional;
- (void)setConditional:(id)a3;
- (void)setElseSteps:(id)a3;
- (void)setNegated:(BOOL)a3;
- (void)setThenSteps:(id)a3;
@end

@implementation AEMinimalTemplateStepIf

- (NSString)conditional
{
  return self->_conditional;
}

- (void)setConditional:(id)a3
{
}

- (BOOL)negated
{
  return self->_negated;
}

- (void)setNegated:(BOOL)a3
{
  self->_negated = a3;
}

- (NSMutableArray)thenSteps
{
  return self->_thenSteps;
}

- (void)setThenSteps:(id)a3
{
}

- (NSMutableArray)elseSteps
{
  return self->_elseSteps;
}

- (void)setElseSteps:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elseSteps, 0);
  objc_storeStrong((id *)&self->_thenSteps, 0);

  objc_storeStrong((id *)&self->_conditional, 0);
}

@end