@interface MFTaskAssertion
+ (id)log;
- (BOOL)isValid;
- (MFTaskAssertion)initWithName:(id)a3;
- (MFTaskAssertion)initWithName:(id)a3 expiration:(double)a4 preventIdleSleep:(BOOL)a5;
- (MFTaskAssertion)initWithName:(id)a3 preventIdleSleep:(BOOL)a4;
- (void)cancelTimer;
- (void)dealloc;
- (void)invalidate;
@end

@implementation MFTaskAssertion

- (MFTaskAssertion)initWithName:(id)a3
{
  return [(MFTaskAssertion *)self initWithName:a3 expiration:0 preventIdleSleep:0.0];
}

- (void)dealloc
{
  [(MFTaskAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MFTaskAssertion;
  [(MFTaskAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  [(BKSProcessAssertion *)self->_assertion invalidate];
  [(EFProcessTransaction *)self->_transaction invalidate];
  [(MFTaskAssertion *)self cancelTimer];
}

- (void)cancelTimer
{
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
}

- (MFTaskAssertion)initWithName:(id)a3 expiration:(double)a4 preventIdleSleep:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v31.receiver = self;
  v31.super_class = (Class)MFTaskAssertion;
  id v9 = [(MFTaskAssertion *)&v31 init];
  if (v9)
  {
    v10 = MFUserAgent();
    int v11 = [v10 isMaild];

    if (v11)
    {
      uint64_t v12 = [MEMORY[0x1E4F60E10] transactionWithDescription:v8];
      v13 = (void *)*((void *)v9 + 1);
      *((void *)v9 + 1) = v12;
    }
    else
    {
      v14 = MFUserAgent();
      int v15 = [v14 isMobileMail];

      if (v15)
      {
LABEL_12:
        id v25 = v9;
        goto LABEL_13;
      }
      if (v5) {
        uint64_t v16 = 3;
      }
      else {
        uint64_t v16 = 7;
      }
      id v17 = objc_alloc(MEMORY[0x1E4F4E280]);
      uint64_t v18 = getpid();
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __60__MFTaskAssertion_initWithName_expiration_preventIdleSleep___block_invoke;
      v29[3] = &unk_1E5D404F0;
      id v30 = v8;
      uint64_t v19 = [v17 initWithPID:v18 flags:v16 reason:10004 name:v30 withHandler:v29];
      v20 = (void *)*((void *)v9 + 2);
      *((void *)v9 + 2) = v19;

      if (a4 > 0.0)
      {
        dispatch_source_t v21 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, MEMORY[0x1E4F14428]);
        v22 = (void *)*((void *)v9 + 3);
        *((void *)v9 + 3) = v21;

        dispatch_time_t v23 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
        dispatch_source_set_timer(*((dispatch_source_t *)v9 + 3), v23, 0xFFFFFFFFFFFFFFFFLL, 0);
        v24 = *((void *)v9 + 3);
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __60__MFTaskAssertion_initWithName_expiration_preventIdleSleep___block_invoke_5;
        v27[3] = &unk_1E5D3B5C0;
        id v28 = v9;
        dispatch_source_set_event_handler(v24, v27);
        dispatch_resume(*((dispatch_object_t *)v9 + 3));
      }
      v13 = v30;
    }

    goto LABEL_12;
  }
LABEL_13:

  return (MFTaskAssertion *)v9;
}

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__MFTaskAssertion_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_34 != -1) {
    dispatch_once(&log_onceToken_34, block);
  }
  v2 = (void *)log_log_34;
  return v2;
}

void __22__MFTaskAssertion_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_34;
  log_log_34 = (uint64_t)v1;
}

void __60__MFTaskAssertion_initWithName_expiration_preventIdleSleep___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = +[MFTaskAssertion log];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v6;
      v7 = "Acquired task assertion: %{public}@";
LABEL_6:
      _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543362;
    uint64_t v10 = v8;
    v7 = "could not aquire task assertion: %{public}@";
    goto LABEL_6;
  }
}

uint64_t __60__MFTaskAssertion_initWithName_expiration_preventIdleSleep___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (MFTaskAssertion)initWithName:(id)a3 preventIdleSleep:(BOOL)a4
{
  return [(MFTaskAssertion *)self initWithName:a3 expiration:a4 preventIdleSleep:0.0];
}

- (BOOL)isValid
{
  return [(BKSProcessAssertion *)self->_assertion valid];
}

@end