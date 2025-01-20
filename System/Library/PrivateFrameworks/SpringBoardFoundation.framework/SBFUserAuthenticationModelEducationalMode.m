@interface SBFUserAuthenticationModelEducationalMode
- (BOOL)isPermanentlyBlocked;
- (BOOL)isTemporarilyBlocked;
- (BOOL)isUserRequestedEraseEnabled;
- (SBFUserAuthenticationModelDelegate)delegate;
- (SBFUserAuthenticationModelEducationalMode)initWithKeyBag:(id)a3;
- (double)timeUntilUnblockedSinceReferenceDate;
- (id)_refreshStateAndNotify:(BOOL)a3;
- (void)_refreshStateForMkbState:(id)a3 notify:(BOOL)a4;
- (void)noteNewMkbDeviceLockState:(id)a3;
- (void)notePasscodeEntryBegan;
- (void)notePasscodeEntryCancelled;
- (void)notePasscodeUnlockFailedWithError:(id)a3;
- (void)notePasscodeUnlockSucceeded;
- (void)performPasswordTest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)synchronize;
@end

@implementation SBFUserAuthenticationModelEducationalMode

- (SBFUserAuthenticationModelEducationalMode)initWithKeyBag:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBFUserAuthenticationModelEducationalMode;
  v5 = [(SBFUserAuthenticationModelEducationalMode *)&v10 init];
  if (v5)
  {
    if (v4)
    {
      v6 = (SBFMobileKeyBag *)v4;
    }
    else
    {
      v6 = +[SBFMobileKeyBag sharedInstance];
    }
    keybag = v5->_keybag;
    v5->_keybag = v6;

    id v8 = [(SBFUserAuthenticationModelEducationalMode *)v5 _refreshStateAndNotify:1];
  }

  return v5;
}

- (BOOL)isTemporarilyBlocked
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  [(SBFUserAuthenticationModelEducationalMode *)self timeUntilUnblockedSinceReferenceDate];
  return v4 < v5;
}

- (BOOL)isPermanentlyBlocked
{
  if (self->_pendingWipe) {
    return 1;
  }
  double v3 = [(SBFUserAuthenticationModelEducationalMode *)self _refreshStateAndNotify:0];
  char v4 = [v3 permanentlyBlocked];

  return v4;
}

- (double)timeUntilUnblockedSinceReferenceDate
{
  v2 = [(SBFUserAuthenticationModelEducationalMode *)self _refreshStateAndNotify:0];
  [v2 backOffTime];
  if (v3 <= 0.0)
  {
    v7 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v7 timeIntervalSinceReferenceDate];
    double v6 = v8;
  }
  else
  {
    double v4 = v3;
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v6 = v4 + v5;
  }

  return v6;
}

- (BOOL)isUserRequestedEraseEnabled
{
  return 0;
}

- (void)setDelegate:(id)a3
{
  double v4 = (SBFUserAuthenticationModelDelegate *)a3;
  if (self->_delegate != v4)
  {
    self->_delegate = v4;
    if (self->_pendingWipe)
    {
      double v5 = v4;
      [(SBFUserAuthenticationModelDelegate *)v4 deviceLockModelRequestsDeviceWipe:self];
      double v4 = v5;
    }
  }
}

- (void)synchronize
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18B52E000, v0, v1, "synchronize", v2, v3, v4, v5, v6);
}

- (void)notePasscodeEntryBegan
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18B52E000, v0, v1, "passcodeEntryBegan", v2, v3, v4, v5, v6);
}

- (void)notePasscodeEntryCancelled
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18B52E000, v0, v1, "passcodeEntryCancelled", v2, v3, v4, v5, v6);
}

- (void)notePasscodeUnlockSucceeded
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18B52E000, v0, v1, "passcodeUnlockSucceeded", v2, v3, v4, v5, v6);
}

- (void)notePasscodeUnlockFailedWithError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode notePasscodeUnlockFailedWithError:]((uint64_t)v4, v5);
  }

  uint8_t v6 = [v4 domain];
  if ([v6 isEqualToString:@"com.apple.springboardfoundation.mkb"])
  {
    uint64_t v7 = [v4 code];

    if (v7 == -14) {
      id v8 = [(SBFUserAuthenticationModelEducationalMode *)self _refreshStateAndNotify:1];
    }
  }
  else
  {
  }
}

- (void)noteNewMkbDeviceLockState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode noteNewMkbDeviceLockState:]((uint64_t)v4, v5);
  }

  [(SBFUserAuthenticationModelEducationalMode *)self _refreshStateForMkbState:v4 notify:1];
}

- (void)performPasswordTest:(id)a3
{
  uint64_t v3 = (void (**)(id, unsigned char *))a3;
  id v4 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode performPasswordTest:]();
  }

  char v5 = 0;
  v3[2](v3, &v5);
}

- (id)_refreshStateAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(SBFMobileKeyBag *)self->_keybag state];
  [(SBFUserAuthenticationModelEducationalMode *)self _refreshStateForMkbState:v5 notify:v3];
  return v5;
}

- (void)_refreshStateForMkbState:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  if ([a3 shouldWipe])
  {
    self->_pendingWipe = 1;
  }
  else if (!self->_pendingWipe)
  {
    goto LABEL_5;
  }
  [(SBFUserAuthenticationModelDelegate *)self->_delegate deviceLockModelRequestsDeviceWipe:self];
LABEL_5:
  if (v4)
  {
    delegate = self->_delegate;
    [(SBFUserAuthenticationModelDelegate *)delegate deviceLockStateMayHaveChangedForModel:self];
  }
}

- (SBFUserAuthenticationModelDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
}

- (void)notePasscodeUnlockFailedWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18B52E000, a2, OS_LOG_TYPE_DEBUG, "passcodeUnlockFailed with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)noteNewMkbDeviceLockState:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18B52E000, a2, OS_LOG_TYPE_DEBUG, "noteNewMkbDeviceLockState: %@", (uint8_t *)&v2, 0xCu);
}

- (void)performPasswordTest:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18B52E000, v0, v1, "performPasscodeTest", v2, v3, v4, v5, v6);
}

@end