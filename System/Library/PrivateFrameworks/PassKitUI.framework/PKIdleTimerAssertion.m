@interface PKIdleTimerAssertion
- (PKIdleTimerAssertion)init;
- (PKIdleTimerAssertion)initWithReason:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation PKIdleTimerAssertion

- (PKIdleTimerAssertion)init
{
  return 0;
}

- (PKIdleTimerAssertion)initWithReason:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    v14.receiver = self;
    v14.super_class = (Class)PKIdleTimerAssertion;
    self = [(PKIdleTimerAssertion *)&v14 init];
    if (self)
    {
      v6 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v5;
        _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, "Taking idle timer assertion with reason: %@", buf, 0xCu);
      }

      objc_storeStrong((id *)&self->_reason, a3);
      if (PKRunningInViewService())
      {
        v7 = [MEMORY[0x1E4F6F2E8] sharedInstance];
        v8 = (BSInvalidatable *)[v7 newAssertionToDisableIdleTimerForReason:self->_reason error:0];
        idleTimerAssertion = self->_idleTimerAssertion;
        self->_idleTimerAssertion = v8;

        if (!self->_idleTimerAssertion)
        {
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v10 = "Failed to acquire idle timer assertion";
LABEL_11:
            _os_log_impl(&dword_19F450000, v6, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
            goto LABEL_12;
          }
          goto LABEL_12;
        }
      }
      else
      {
        v12 = [MEMORY[0x1E4FB1438] sharedApplication];
        [v12 _setIdleTimerDisabled:1 forReason:self->_reason];
      }
    }
    self = self;
    v11 = self;
    goto LABEL_15;
  }
  v6 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v10 = "Missing reason for idle timer assertion";
    goto LABEL_11;
  }
LABEL_12:

  v11 = 0;
LABEL_15:

  return v11;
}

- (void)invalidate
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (atomic_exchange(&self->_invalidated._Value, 1u))
  {
    v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      reason = self->_reason;
      int v7 = 138412290;
      v8 = reason;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating idle timer assertion with reason: %@", (uint8_t *)&v7, 0xCu);
    }

    idleTimerAssertion = self->_idleTimerAssertion;
    if (idleTimerAssertion)
    {
      [(BSInvalidatable *)idleTimerAssertion invalidate];
      v6 = self->_idleTimerAssertion;
      self->_idleTimerAssertion = 0;
    }
    else
    {
      v6 = [MEMORY[0x1E4FB1438] sharedApplication];
      [v6 _setIdleTimerDisabled:0 forReason:self->_reason];
    }
  }
}

- (void)dealloc
{
  [(PKIdleTimerAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKIdleTimerAssertion;
  [(PKIdleTimerAssertion *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimerAssertion, 0);

  objc_storeStrong((id *)&self->_reason, 0);
}

@end