@interface SBTimerSwitcherModifierEvent
- (NSString)reason;
- (SBTimerSwitcherModifierEvent)initWithReason:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)type;
@end

@implementation SBTimerSwitcherModifierEvent

- (int64_t)type
{
  return 15;
}

- (void).cxx_destruct
{
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBTimerSwitcherModifierEvent;
  v4 = [(SBSwitcherModifierEvent *)&v6 descriptionBuilderWithMultilinePrefix:a3];
  [v4 appendString:self->_reason withName:@"reason"];
  return v4;
}

- (SBTimerSwitcherModifierEvent)initWithReason:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTimerSwitcherModifierEvent;
  objc_super v6 = [(SBTimerSwitcherModifierEvent *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_reason, a3);
  }

  return v7;
}

- (NSString)reason
{
  return self->_reason;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBTimerSwitcherModifierEvent;
  v4 = [(SBChainableModifierEvent *)&v8 copyWithZone:a3];
  uint64_t v5 = [(NSString *)self->_reason copy];
  objc_super v6 = (void *)v4[3];
  v4[3] = v5;

  return v4;
}

@end