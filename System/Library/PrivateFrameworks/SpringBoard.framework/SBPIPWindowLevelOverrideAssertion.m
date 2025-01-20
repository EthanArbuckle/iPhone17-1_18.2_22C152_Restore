@interface SBPIPWindowLevelOverrideAssertion
- (SBPIPWindowLevelOverrideAssertion)initWithWindowLevel:(unint64_t)a3 reason:(int64_t)a4 identifier:(id)a5 invalidationBlock:(id)a6;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (unint64_t)windowLevel;
@end

@implementation SBPIPWindowLevelOverrideAssertion

- (SBPIPWindowLevelOverrideAssertion)initWithWindowLevel:(unint64_t)a3 reason:(int64_t)a4 identifier:(id)a5 invalidationBlock:(id)a6
{
  v8.receiver = self;
  v8.super_class = (Class)SBPIPWindowLevelOverrideAssertion;
  result = [(SBPIPBehaviorOverrideAssertion *)&v8 initWithReason:a4 identifier:a5 invalidationBlock:a6];
  if (result) {
    result->_windowLevel = a3;
  }
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBPIPWindowLevelOverrideAssertion;
  v4 = [(SBPIPBehaviorOverrideAssertion *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendUInt64:self->_windowLevel withName:@"Window Level"];
  return v4;
}

- (unint64_t)windowLevel
{
  return self->_windowLevel;
}

@end