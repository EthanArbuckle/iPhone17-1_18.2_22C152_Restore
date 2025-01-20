@interface SBBaseWindowSceneStatusBarChangeAssertion
- (NSString)description;
- (NSString)reason;
- (SBBaseWindowSceneStatusBarChangeAssertion)init;
- (id)_initWithWindowSceneStatusBarAssertionManager:(id)a3 reason:(id)a4;
@end

@implementation SBBaseWindowSceneStatusBarChangeAssertion

- (SBBaseWindowSceneStatusBarChangeAssertion)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBWindowSceneStatusBarChangeAssertion.m" lineNumber:23 description:@"You cannot invoke this directly."];

  return 0;
}

- (id)_initWithWindowSceneStatusBarAssertionManager:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBBaseWindowSceneStatusBarChangeAssertion;
  v8 = [(SBBaseWindowSceneStatusBarChangeAssertion *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v7 copy];
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

    objc_storeWeak((id *)&v8->_assertionManager, v6);
  }

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@:%p = reason:%@>", v5, self, self->_reason];

  return (NSString *)v6;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assertionManager);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end