@interface PLTimedDispatchGroupEnterSession
- (BOOL)_lock_leaveIfPossible;
- (BOOL)didTimeout;
- (BOOL)leave;
- (BOOL)leaveWithResult:(id)a3;
- (BOOL)wasCancelled;
- (PLTimedDispatchGroupEnterSession)initWithGroup:(id)a3 queue:(id)a4 timeout:(double)a5 name:(id)a6;
- (id)description;
- (id)result;
- (void)_handleTimeoutCallback;
- (void)cancel;
- (void)enter;
@end

@implementation PLTimedDispatchGroupEnterSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lock_result, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (BOOL)didTimeout
{
  v2 = [(PLTimedDispatchGroupEnterSession *)self result];
  if ([v2 isFailure])
  {
    v3 = [v2 error];
    char v4 = PLIsErrorEqualToCode();
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)result
{
  v2 = PLSafeResultWithUnfairLock();
  return v2;
}

id __42__PLTimedDispatchGroupEnterSession_result__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40);
}

- (BOOL)leaveWithResult:(id)a3
{
  id v6 = a3;
  id v3 = v6;
  char v4 = PLBoolResultWithUnfairLock();

  return v4;
}

uint64_t __52__PLTimedDispatchGroupEnterSession_leaveWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_lock_leaveIfPossible");
  if (v2) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  }
  return v2;
}

- (BOOL)leave
{
  id v3 = (void *)MEMORY[0x1E4F8B9B8];
  char v4 = [MEMORY[0x1E4F1CA98] null];
  v5 = [v3 successWithResult:v4];

  LOBYTE(self) = [(PLTimedDispatchGroupEnterSession *)self leaveWithResult:v5];
  return (char)self;
}

- (BOOL)wasCancelled
{
  uint64_t v2 = [(PLTimedDispatchGroupEnterSession *)self result];
  id v3 = v2;
  if (v2 && [v2 isFailure])
  {
    char v4 = [v3 error];
    v5 = [v4 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      id v6 = [v3 error];
      BOOL v7 = [v6 code] == 3072;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)cancel
{
  id v3 = (void *)MEMORY[0x1E4F8B9B8];
  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  char v4 = [v3 failureWithError:v5];
  [(PLTimedDispatchGroupEnterSession *)self leaveWithResult:v4];
}

- (void)enter
{
  dispatch_group_enter((dispatch_group_t)self->_group);
  if (self->_timeout != 0.0)
  {
    objc_initWeak(&location, self);
    dispatch_time_t v3 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
    queue = self->_queue;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__PLTimedDispatchGroupEnterSession_enter__block_invoke;
    v5[3] = &unk_1E5875F08;
    objc_copyWeak(&v6, &location);
    dispatch_after(v3, queue, v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __41__PLTimedDispatchGroupEnterSession_enter__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleTimeoutCallback];
}

- (void)_handleTimeoutCallback
{
  uint64_t v2 = PLBackendGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Timed dispatch group session timed out waiting for group leave", buf, 2u);
  }

  PLSafeRunWithUnfairLock();
}

void __58__PLTimedDispatchGroupEnterSession__handleTimeoutCallback__block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(*(id *)(a1 + 32), "_lock_leaveIfPossible"))
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F8B9B8];
    dispatch_time_t v3 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v4 = *MEMORY[0x1E4F8C500];
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 48);
    v11 = @"name";
    v12[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    BOOL v7 = [v3 errorWithDomain:v4 code:46512 userInfo:v6];
    uint64_t v8 = [v2 failureWithError:v7];
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
}

- (BOOL)_lock_leaveIfPossible
{
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL lock_didLeave = self->_lock_didLeave;
  if (!self->_lock_didLeave)
  {
    self->_BOOL lock_didLeave = 1;
    dispatch_group_leave((dispatch_group_t)self->_group);
  }
  return !lock_didLeave;
}

- (id)description
{
  dispatch_time_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ %p> %@", v5, self, self->_name];

  return v6;
}

- (PLTimedDispatchGroupEnterSession)initWithGroup:(id)a3 queue:(id)a4 timeout:(double)a5 name:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)PLTimedDispatchGroupEnterSession;
  v14 = [(PLTimedDispatchGroupEnterSession *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_group, a3);
    objc_storeStrong((id *)&v15->_queue, a4);
    v15->_timeout = a5;
    v15->_lock._os_unfair_lock_opaque = 0;
    uint64_t v16 = [v13 copy];
    name = v15->_name;
    v15->_name = (NSString *)v16;
  }
  return v15;
}

@end