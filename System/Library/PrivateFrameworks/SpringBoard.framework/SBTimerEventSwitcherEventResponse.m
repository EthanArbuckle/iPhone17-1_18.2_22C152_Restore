@interface SBTimerEventSwitcherEventResponse
- (NSString)reason;
- (SBTimerEventSwitcherEventResponse)initWithDelay:(double)a3 validator:(id)a4 reason:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBTimerEventSwitcherEventResponse

- (void).cxx_destruct
{
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBTimerEventSwitcherEventResponse;
  v4 = [(SBChainableModifierEventResponse *)&v6 descriptionBuilderWithMultilinePrefix:a3];
  [v4 appendString:self->_reason withName:@"reason"];
  return v4;
}

- (int64_t)type
{
  return 17;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBTimerEventSwitcherEventResponse)initWithDelay:(double)a3 validator:(id)a4 reason:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)SBTimerEventSwitcherEventResponse;
  v10 = [(SBChainableModifierEventResponse *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_reason, a5);
    [(SBChainableModifierEventResponse *)v11 setDelay:v8 withValidator:a3];
  }

  return v11;
}

@end