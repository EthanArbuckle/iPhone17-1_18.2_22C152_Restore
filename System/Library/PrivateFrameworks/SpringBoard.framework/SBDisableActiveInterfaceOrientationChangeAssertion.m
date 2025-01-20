@interface SBDisableActiveInterfaceOrientationChangeAssertion
- (NSString)description;
- (SBDisableActiveInterfaceOrientationChangeAssertion)initWithReason:(id)a3 nudgeOrientationOnInvalidate:(BOOL)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBDisableActiveInterfaceOrientationChangeAssertion

- (SBDisableActiveInterfaceOrientationChangeAssertion)initWithReason:(id)a3 nudgeOrientationOnInvalidate:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBDisableActiveInterfaceOrientationChangeAssertion;
  v9 = [(SBDisableActiveInterfaceOrientationChangeAssertion *)&v14 init];
  if (v9)
  {
    if (!v8)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:v9 file:@"SBDisableActiveInterfaceOrientationChangeAssertion.m" lineNumber:25 description:@"Reason is required."];
    }
    objc_storeStrong((id *)&v9->_reason, a3);
    v9->_nudge = a4;
    v10 = BKLogOrientationGlobal();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      reason = v9->_reason;
      *(_DWORD *)buf = 138543362;
      v16 = reason;
      _os_log_impl(&dword_1D85BA000, v10, OS_LOG_TYPE_INFO, "Created disableActiveInterfaceOrientationChangeAssertion with reason: %{public}@", buf, 0xCu);
    }

    [(id)SBApp addDisableActiveInterfaceOrientationChangeAssertion:v9];
  }

  return v9;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Dealloc'd a disableActiveInterfaceOrientationChangeAssertion that wasn't invalidated, reason was: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)invalidate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    int v3 = BKLogOrientationGlobal();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      reason = self->_reason;
      int v5 = 138543362;
      v6 = reason;
      _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Invalidated disableActiveInterfaceOrientationChangeAssertion with reason: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [(id)SBApp removeDisableActiveInterfaceOrientationChangeAssertion:self nudgeOrientationIfRemovingLast:self->_nudge];
  }
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"<%p: reason='%@'>", self, self->_reason];
}

@end