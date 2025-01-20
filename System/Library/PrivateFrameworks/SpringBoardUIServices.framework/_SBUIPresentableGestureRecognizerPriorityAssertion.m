@interface _SBUIPresentableGestureRecognizerPriorityAssertion
- (NSString)description;
- (NSString)reason;
- (_SBUIPresentableGestureRecognizerPriorityAssertion)initWithReason:(id)a3 invalidationHandler:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _SBUIPresentableGestureRecognizerPriorityAssertion

- (void)dealloc
{
  [(_SBUIPresentableGestureRecognizerPriorityAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_SBUIPresentableGestureRecognizerPriorityAssertion;
  [(_SBUIPresentableGestureRecognizerPriorityAssertion *)&v3 dealloc];
}

- (_SBUIPresentableGestureRecognizerPriorityAssertion)initWithReason:(id)a3 invalidationHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"SBUIPresentableGestureRecognizerPriorityAssertion.m", 26, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"SBUIPresentableGestureRecognizerPriorityAssertion.m", 27, @"Invalid parameter not satisfying: %@", @"invalidationHandler" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)_SBUIPresentableGestureRecognizerPriorityAssertion;
  v10 = [(_SBUIPresentableGestureRecognizerPriorityAssertion *)&v19 init];
  if (v10)
  {
    uint64_t v11 = [v7 copy];
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    id invalidationHandler = v10->_invalidationHandler;
    v10->_id invalidationHandler = (id)v13;

    v15 = SBLogBanners();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v10;
      _os_log_impl(&dword_1A7607000, v15, OS_LOG_TYPE_DEFAULT, "Acquired gesture recognizer priority assertion: %{public}@", buf, 0xCu);
    }
  }
  return v10;
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id invalidationHandler = self->_invalidationHandler;
  if (invalidationHandler)
  {
    v4 = (void (**)(void, void))[invalidationHandler copy];
    id v5 = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    ((void (**)(void, _SBUIPresentableGestureRecognizerPriorityAssertion *))v4)[2](v4, self);
    v6 = SBLogBanners();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = self;
      _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_DEFAULT, "Invalidated gesture recognizer priority assertion: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (NSString)description
{
  return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; reason: %@>",
                       objc_opt_class(),
                       self,
                       self->_reason);
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end