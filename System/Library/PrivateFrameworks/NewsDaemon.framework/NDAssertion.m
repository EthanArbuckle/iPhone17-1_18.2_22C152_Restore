@interface NDAssertion
- (NDAssertion)init;
- (NDAssertion)initWithName:(id)a3;
- (NDAssertion)initWithName:(id)a3 options:(int64_t)a4;
- (OS_os_transaction)transaction;
- (unsigned)powerAssertionID;
- (void)dealloc;
@end

@implementation NDAssertion

- (NDAssertion)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NDAssertion init]";
    __int16 v9 = 2080;
    v10 = "NDAssertion.m";
    __int16 v11 = 1024;
    int v12 = 29;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1E00ED000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NDAssertion init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NDAssertion)initWithName:(id)a3 options:(int64_t)a4
{
  char v4 = a4;
  id v6 = (__CFString *)a3;
  v14.receiver = self;
  v14.super_class = (Class)NDAssertion;
  v7 = [(NDAssertion *)&v14 init];
  if (v7)
  {
    if (v4)
    {
      [(__CFString *)v6 UTF8String];
      uint64_t v8 = os_transaction_create();
      transaction = v7->_transaction;
      v7->_transaction = (OS_os_transaction *)v8;
    }
    if ((v4 & 2) != 0)
    {
      IOPMAssertionID AssertionID = 0;
      if (IOPMAssertionCreateWithDescription(@"PreventUserIdleSystemSleep", v6, 0, 0, 0, 60.0, @"TimeoutActionTurnOff", &AssertionID))
      {
        v10 = *MEMORY[0x1E4F7DDE8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F7DDE8], OS_LOG_TYPE_ERROR)) {
          -[NDAssertion initWithName:options:]((uint64_t)v6, v10);
        }
        IOPMAssertionID v11 = 0;
      }
      else
      {
        IOPMAssertionID v11 = AssertionID;
      }
      v7->_powerIOPMAssertionID AssertionID = v11;
    }
  }

  return v7;
}

- (NDAssertion)initWithName:(id)a3
{
  return [(NDAssertion *)self initWithName:a3 options:3];
}

- (void)dealloc
{
  if ([(NDAssertion *)self powerAssertionID]) {
    IOPMAssertionRelease([(NDAssertion *)self powerAssertionID]);
  }
  v3.receiver = self;
  v3.super_class = (Class)NDAssertion;
  [(NDAssertion *)&v3 dealloc];
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (unsigned)powerAssertionID
{
  return self->_powerAssertionID;
}

- (void).cxx_destruct
{
}

- (void)initWithName:(uint64_t)a1 options:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E00ED000, a2, OS_LOG_TYPE_ERROR, "failed to create a power assertion, name=%{public}@", (uint8_t *)&v2, 0xCu);
}

@end