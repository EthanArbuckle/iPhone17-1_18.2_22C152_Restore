@interface _IOUIAngelServiceAssertions
- (BOOL)_invalidateCallingHandler:(BOOL)a3 withError:(id *)a4;
- (BOOL)acquireWithError:(id *)a3;
- (BOOL)invalidateAndKillWithExplanation:(id)a3 code:(unint64_t)a4 error:(id *)a5;
- (BOOL)invalidateWithError:(id *)a3;
- (BOOL)isValid;
- (NSString)description;
- (_IOUIAngelServiceAssertions)initWithRBSAssertion:(id)a3 forPid:(int)a4;
- (id)_initWithUnderlyingAssertion:(id)a3 forPid:(int)a4;
- (id)invalidationHandler;
- (id)underlyingAssertion;
- (id)warningHandler;
- (int)pid;
- (os_unfair_lock_s)lock;
- (void)_callInvalidationHandler:(BOOL)a3;
- (void)_callWarningHandler;
- (void)assertion:(id)a3 didInvalidateWithError:(id)a4;
- (void)assertionWillInvalidate:(id)a3;
- (void)dealloc;
- (void)setInvalidationHandler:(id)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setWarningHandler:(id)a3;
@end

@implementation _IOUIAngelServiceAssertions

- (id)_initWithUnderlyingAssertion:(id)a3 forPid:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_IOUIAngelServiceAssertions;
  v8 = [(_IOUIAngelServiceAssertions *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_underlyingAssertion, a3);
    v9->_pid = a4;
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (_IOUIAngelServiceAssertions)initWithRBSAssertion:(id)a3 forPid:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(_IOUIAngelServiceAssertions *)self _initWithUnderlyingAssertion:v6 forPid:v4];
  if (v7) {
    [v6 addObserver:v7];
  }

  return v7;
}

- (BOOL)acquireWithError:(id *)a3
{
  uint64_t v4 = [(_IOUIAngelServiceAssertions *)self underlyingAssertion];
  LOBYTE(a3) = [v4 acquireWithError:a3];

  return (char)a3;
}

- (BOOL)invalidateWithError:(id *)a3
{
  return [(_IOUIAngelServiceAssertions *)self _invalidateCallingHandler:1 withError:a3];
}

- (BOOL)_invalidateCallingHandler:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  if (![(_IOUIAngelServiceAssertions *)self isValid]) {
    return 1;
  }
  id v7 = [(_IOUIAngelServiceAssertions *)self underlyingAssertion];
  unsigned __int8 v8 = [v7 invalidateWithError:a4];

  if (v5)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v9 = dispatch_get_global_queue(0, 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = __67___IOUIAngelServiceAssertions__invalidateCallingHandler_withError___block_invoke;
    v11[3] = &unk_51400;
    objc_copyWeak(&v12, &location);
    dispatch_async(v9, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (BOOL)invalidateAndKillWithExplanation:(id)a3 code:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if ([(_IOUIAngelServiceAssertions *)self isValid])
  {
    id v9 = [objc_alloc((Class)RBSTerminateContext) initWithExplanation:v8];
    BOOL v10 = 1;
    [v9 setReportType:1];
    [v9 setExceptionCode:a4];
    [v9 setMaximumTerminationResistance:20];
    objc_super v11 = +[RBSProcessIdentifier identifierWithPid:[(_IOUIAngelServiceAssertions *)self pid]];
    id v12 = +[RBSProcessPredicate predicateMatchingIdentifier:v11];

    id v13 = [objc_alloc((Class)RBSTerminateRequest) initWithPredicate:v12 context:v9];
    id v17 = 0;
    unsigned __int8 v14 = [v13 execute:&v17];
    id v15 = v17;
    if ((v14 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        -[_IOUIAngelServiceAssertions invalidateAndKillWithExplanation:code:error:](self, (uint64_t)v15);
      }
      BOOL v10 = [(_IOUIAngelServiceAssertions *)self invalidateWithError:a5];
    }
  }
  else
  {
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)isValid
{
  v2 = [(_IOUIAngelServiceAssertions *)self underlyingAssertion];
  unsigned __int8 v3 = [v2 isValid];

  return v3;
}

- (void)_callInvalidationHandler:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(_IOUIAngelServiceAssertions *)self invalidationHandler];

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(_IOUIAngelServiceAssertions *)self underlyingAssertion];
      id v8 = (void *)v7;
      id v9 = @"NO";
      if (v3) {
        id v9 = @"YES";
      }
      int v11 = 138412546;
      uint64_t v12 = v7;
      __int16 v13 = 2112;
      unsigned __int8 v14 = v9;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Calling invalidation handler for assertion %@, server-initiated: %@", (uint8_t *)&v11, 0x16u);
    }
    BOOL v10 = [(_IOUIAngelServiceAssertions *)self invalidationHandler];
    [(_IOUIAngelServiceAssertions *)self setInvalidationHandler:0];
    [(_IOUIAngelServiceAssertions *)self setWarningHandler:0];
    os_unfair_lock_unlock(p_lock);
    if (v10)
    {
      v10[2](v10, v3);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_callWarningHandler
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = [(_IOUIAngelServiceAssertions *)self warningHandler];

  if (v4)
  {
    BOOL v5 = [(_IOUIAngelServiceAssertions *)self warningHandler];
    [(_IOUIAngelServiceAssertions *)self setWarningHandler:0];
    os_unfair_lock_unlock(p_lock);
    if (v5)
    {
      v5[2](v5);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = a3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Did invalidate assertion %@", (uint8_t *)&v6, 0xCu);
  }
  [(_IOUIAngelServiceAssertions *)self _callInvalidationHandler:1];
}

- (void)assertionWillInvalidate:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = a3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Will invalidate assertion %@", (uint8_t *)&v5, 0xCu);
  }
  [(_IOUIAngelServiceAssertions *)self _callWarningHandler];
}

- (NSString)description
{
  v2 = [(_IOUIAngelServiceAssertions *)self underlyingAssertion];
  BOOL v3 = +[NSString stringWithFormat:@"_IOUIAngelServiceAssertions for underlying assertion: %@", v2];

  return (NSString *)v3;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_2();
  _os_log_fault_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "_IOUIAngelServiceAssertions dealloced before being invalidated! %@", v0, 0xCu);
}

- (id)underlyingAssertion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (int)pid
{
  return self->_pid;
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)warningHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setWarningHandler:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_warningHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);

  objc_storeStrong(&self->_underlyingAssertion, 0);
}

- (void)invalidateAndKillWithExplanation:(void *)a1 code:(uint64_t)a2 error:.cold.1(void *a1, uint64_t a2)
{
  int v3 = 134218242;
  uint64_t v4 = (int)[a1 pid];
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not terminate app with pid %ld due to error: %@, invalidating instead", (uint8_t *)&v3, 0x16u);
}

@end