@interface _SBUIPresentableDismissalPreventionAssertion
+ (BOOL)_isValidBannerDismissalSource:(int64_t)a3;
- (NSString)description;
- (NSString)reason;
- (_SBUIPresentableDismissalPreventionAssertion)initWithDismissalSource:(int64_t)a3 reason:(id)a4 invalidationHandler:(id)a5;
- (int64_t)dismissalSource;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _SBUIPresentableDismissalPreventionAssertion

- (void)dealloc
{
  [(_SBUIPresentableDismissalPreventionAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_SBUIPresentableDismissalPreventionAssertion;
  [(_SBUIPresentableDismissalPreventionAssertion *)&v3 dealloc];
}

- (_SBUIPresentableDismissalPreventionAssertion)initWithDismissalSource:(int64_t)a3 reason:(id)a4 invalidationHandler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  if ([(id)objc_opt_class() _isValidBannerDismissalSource:a3])
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_10:
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBUIPresentableDismissalPreventionAssertion.m", 27, @"Invalid parameter not satisfying: %@", @"reason" object file lineNumber description];

    if (v10) {
      goto LABEL_4;
    }
    goto LABEL_11;
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"SBUIPresentableDismissalPreventionAssertion.m", 26, @"Invalid parameter not satisfying: %@", @"[[self class] _isValidBannerDismissalSource:dismissalSource]" object file lineNumber description];

  if (!v9) {
    goto LABEL_10;
  }
LABEL_3:
  if (v10) {
    goto LABEL_4;
  }
LABEL_11:
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SBUIPresentableDismissalPreventionAssertion.m", 28, @"Invalid parameter not satisfying: %@", @"invalidationHandler" object file lineNumber description];

LABEL_4:
  v22.receiver = self;
  v22.super_class = (Class)_SBUIPresentableDismissalPreventionAssertion;
  v11 = [(_SBUIPresentableDismissalPreventionAssertion *)&v22 init];
  v12 = v11;
  if (v11)
  {
    v11->_dismissalSource = a3;
    uint64_t v13 = [v9 copy];
    reason = v12->_reason;
    v12->_reason = (NSString *)v13;

    uint64_t v15 = [v10 copy];
    id invalidationHandler = v12->_invalidationHandler;
    v12->_id invalidationHandler = (id)v15;

    v17 = SBLogBanners();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v12;
      _os_log_impl(&dword_1A7607000, v17, OS_LOG_TYPE_DEFAULT, "Acquired banner dismissal prevention assertion: %{public}@", buf, 0xCu);
    }
  }
  return v12;
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

    ((void (**)(void, _SBUIPresentableDismissalPreventionAssertion *))v4)[2](v4, self);
    v6 = SBLogBanners();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      v8 = self;
      _os_log_impl(&dword_1A7607000, v6, OS_LOG_TYPE_DEFAULT, "Invalidated banner dismissal prevention assertion: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

+ (BOOL)_isValidBannerDismissalSource:(int64_t)a3
{
  return a3 == 1;
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = @"[INVALID]";
  int64_t dismissalSource = self->_dismissalSource;
  if (dismissalSource == 1) {
    id v5 = @"transition";
  }
  if (!dismissalSource) {
    id v5 = @"none";
  }
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; dismissalSource: %@; reason: %@>",
                       v4,
                       self,
                       v5,
                       self->_reason);
}

- (NSString)reason
{
  return self->_reason;
}

- (int64_t)dismissalSource
{
  return self->_dismissalSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
}

@end