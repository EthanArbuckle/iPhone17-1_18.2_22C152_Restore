@interface NPKAssertion
- (BOOL)isAcquired;
- (NPKAssertion)initWithType:(unint64_t)a3 reason:(id)a4;
- (NSString)reason;
- (id)_errorWithUnderlyingError:(id)a3;
- (unint64_t)state;
- (unint64_t)type;
- (void)acquireWithCompletion:(id)a3;
- (void)invalidateWithCompletion:(id)a3;
@end

@implementation NPKAssertion

- (NPKAssertion)initWithType:(unint64_t)a3 reason:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NPKAssertion;
  v8 = [(NPKAssertion *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_reason, a4);
    v9->_state = 0;
  }

  return v9;
}

- (BOOL)isAcquired
{
  return [(NPKAssertion *)self state] == 1;
}

- (void)acquireWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  unint64_t state = self->_state;
  if (!state)
  {
    v10 = 0;
    uint64_t v11 = 1;
    self->_unint64_t state = 1;
    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  if (state == 1)
  {
    id v7 = pk_General_log();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      v9 = pk_General_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        v13 = self;
        _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Attempt to acquire assertion that has already been acquired: %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  v10 = [(NPKAssertion *)self _errorWithUnderlyingError:@"Assertion already taken. Cannot acquire an assertion more than once"];
  uint64_t v11 = 0;
  if (v5) {
LABEL_8:
  }
    ((void (**)(void, uint64_t, void *))v5)[2](v5, v11, v10);
LABEL_9:
}

- (void)invalidateWithCompletion:(id)a3
{
  id v4 = (void (**)(id, BOOL, void *))a3;
  unint64_t state = self->_state;
  id v7 = v4;
  if (state != 1)
  {
    v6 = [(NPKAssertion *)self _errorWithUnderlyingError:@"Cannot invalidate an unaquired or invalid assertion"];
    if (!v7) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  v6 = 0;
  self->_unint64_t state = 2;
  if (v4) {
LABEL_5:
  }
    v7[2](v7, state == 1, v6);
LABEL_6:
}

- (id)_errorWithUnderlyingError:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v5 = v4;
  if (v3) {
    [v4 setObject:v3 forKeyedSubscript:*MEMORY[0x263F08320]];
  }
  v6 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.NPKAssertionErrorDomain" code:0 userInfo:v5];

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
}

@end