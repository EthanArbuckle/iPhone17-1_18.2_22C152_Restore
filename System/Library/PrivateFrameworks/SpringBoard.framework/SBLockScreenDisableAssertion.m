@interface SBLockScreenDisableAssertion
+ (void)initialize;
- (SBLockScreenDisableAssertion)initWithIdentifier:(id)a3;
- (id)description;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBLockScreenDisableAssertion

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (void *)MEMORY[0x1E4FA79C0];
    uint64_t v3 = objc_opt_class();
    [v2 setLockScreenDisableAssertionClass:v3];
  }
}

- (SBLockScreenDisableAssertion)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBLockScreenDisableAssertion;
  v5 = [(SBLockScreenDisableAssertion *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [(id)SBApp authenticationController];
    uint64_t v9 = [v8 createKeybagUnlockAssertionWithReason:v5->_identifier];
    disableLockAssertion = v5->_disableLockAssertion;
    v5->_disableLockAssertion = (SBFAuthenticationAssertion *)v9;

    [(SBFAuthenticationAssertion *)v5->_disableLockAssertion activate];
    v11 = +[SBLockScreenManager sharedInstance];
    [v11 addLockScreenDisableAssertion:v5];
  }
  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: reason %@>", v5, self->_identifier];

  return v6;
}

- (void)dealloc
{
  uint64_t v3 = +[SBLockScreenManager sharedInstance];
  [v3 removeLockScreenDisableAssertion:self];

  [(SBFAuthenticationAssertion *)self->_disableLockAssertion invalidate];
  v4.receiver = self;
  v4.super_class = (Class)SBLockScreenDisableAssertion;
  [(SBLockScreenDisableAssertion *)&v4 dealloc];
}

- (void)invalidate
{
  uint64_t v3 = +[SBLockScreenManager sharedInstance];
  [v3 removeLockScreenDisableAssertion:self];

  disableLockAssertion = self->_disableLockAssertion;
  [(SBFAuthenticationAssertion *)disableLockAssertion invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableLockAssertion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end