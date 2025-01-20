@interface SBPIPBehaviorOverrideAssertion
- (NSString)cameraSensorAttributionBundleIdentifier;
- (SBPIPBehaviorOverrideAssertion)initWithReason:(int64_t)a3 identifier:(id)a4 cameraSensorAttributionBundleIdentifier:(id)a5 invalidationBlock:(id)a6;
- (SBPIPBehaviorOverrideAssertion)initWithReason:(int64_t)a3 identifier:(id)a4 invalidationBlock:(id)a5;
- (SBPIPBehaviorOverrideAssertion)initWithReason:(int64_t)a3 invalidationBlock:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)behaviorOverrideReason;
@end

@implementation SBPIPBehaviorOverrideAssertion

- (SBPIPBehaviorOverrideAssertion)initWithReason:(int64_t)a3 identifier:(id)a4 cameraSensorAttributionBundleIdentifier:(id)a5 invalidationBlock:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SBPIPControllerOverrideAssertions.m", 63, @"Invalid parameter not satisfying: %@", @"reason != SBPIPBehaviorOverrideReasonNone" object file lineNumber description];
  }
  v14 = [(SBPIPBehaviorOverrideAssertion *)self initWithReason:a3 identifier:v11 invalidationBlock:v13];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    cameraSensorAttributionBundleIdentifier = v14->_cameraSensorAttributionBundleIdentifier;
    v14->_cameraSensorAttributionBundleIdentifier = (NSString *)v15;
  }
  return v14;
}

- (SBPIPBehaviorOverrideAssertion)initWithReason:(int64_t)a3 identifier:(id)a4 invalidationBlock:(id)a5
{
  if ((unint64_t)a3 > 9) {
    v6 = 0;
  }
  else {
    v6 = off_1E6B083F8[a3];
  }
  v8.receiver = self;
  v8.super_class = (Class)SBPIPBehaviorOverrideAssertion;
  return [(BSSimpleAssertion *)&v8 initWithIdentifier:a4 forReason:v6 queue:MEMORY[0x1E4F14428] invalidationBlock:a5];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBPIPBehaviorOverrideAssertion;
  v4 = [(BSSimpleAssertion *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  v5 = [(SBPIPBehaviorOverrideAssertion *)self cameraSensorAttributionBundleIdentifier];
  [v4 appendString:v5 withName:@"camera sensor bundle identifier" skipIfEmpty:1];

  return v4;
}

- (NSString)cameraSensorAttributionBundleIdentifier
{
  return self->_cameraSensorAttributionBundleIdentifier;
}

- (int64_t)behaviorOverrideReason
{
  v2 = [(BSSimpleAssertion *)self reason];
  int64_t v3 = SBPIPStashStateOverrideReasonForString(v2);

  return v3;
}

- (SBPIPBehaviorOverrideAssertion)initWithReason:(int64_t)a3 invalidationBlock:(id)a4
{
  id v6 = a4;
  objc_super v7 = (objc_class *)objc_opt_class();
  objc_super v8 = NSStringFromClass(v7);
  v9 = [(SBPIPBehaviorOverrideAssertion *)self initWithReason:a3 identifier:v8 invalidationBlock:v6];

  return v9;
}

- (void).cxx_destruct
{
}

@end