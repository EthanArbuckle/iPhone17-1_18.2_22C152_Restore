@interface SBFUserAuthenticationModelSEP
- (BOOL)_isDeviceWipePreferenceEnabled;
- (BOOL)isPermanentlyBlocked;
- (BOOL)isTemporarilyBlocked;
- (BOOL)isUserRequestedEraseEnabled;
- (NSString)description;
- (SBFUserAuthenticationModelDelegate)delegate;
- (SBFUserAuthenticationModelSEP)initWithKeyBag:(id)a3;
- (double)timeUntilUnblockedSinceReferenceDate;
- (id)_initWithKeyBag:(id)a3 profileConnection:(id)a4;
- (id)descriptionBuilder;
- (void)_refreshStateAndNotify:(BOOL)a3;
- (void)_refreshStateForMkbState:(id)a3 notify:(BOOL)a4;
- (void)clearBlockedState;
- (void)noteNewMkbDeviceLockState:(id)a3;
- (void)notePasscodeEntryBegan;
- (void)notePasscodeEntryCancelled;
- (void)notePasscodeUnlockFailedWithError:(id)a3;
- (void)notePasscodeUnlockSucceeded;
- (void)performPasswordTest:(id)a3;
- (void)refreshBlockedState;
- (void)setDelegate:(id)a3;
- (void)synchronize;
@end

@implementation SBFUserAuthenticationModelSEP

- (BOOL)isTemporarilyBlocked
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  [(SBFUserAuthenticationModelSEP *)self timeUntilUnblockedSinceReferenceDate];
  return v4 < v5;
}

- (double)timeUntilUnblockedSinceReferenceDate
{
  return self->_unblockTime;
}

- (BOOL)isPermanentlyBlocked
{
  return self->_permanentlyBlocked;
}

- (id)_initWithKeyBag:(id)a3 profileConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBFUserAuthenticationModelSEP;
  v8 = [(SBFUserAuthenticationModelSEP *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_profileConnection, a4);
    if (v6)
    {
      v10 = (SBFMobileKeyBag *)v6;
    }
    else
    {
      v10 = +[SBFMobileKeyBag sharedInstance];
    }
    keybag = v9->_keybag;
    v9->_keybag = v10;

    v12 = objc_alloc_init(SBSecurityDefaults);
    securityDefaults = v9->_securityDefaults;
    v9->_securityDefaults = v12;

    [(SBFUserAuthenticationModelSEP *)v9 _refreshStateAndNotify:1];
  }

  return v9;
}

- (SBFUserAuthenticationModelSEP)initWithKeyBag:(id)a3
{
  double v4 = (void *)MEMORY[0x1E4F74230];
  id v5 = a3;
  id v6 = [v4 sharedConnection];
  id v7 = [(SBFUserAuthenticationModelSEP *)self _initWithKeyBag:v5 profileConnection:v6];

  return v7;
}

- (void)synchronize
{
  v2 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode synchronize]();
  }
}

- (void)notePasscodeEntryBegan
{
  v2 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode notePasscodeEntryBegan]();
  }

  MKBPrewarmSPS();
}

- (void)notePasscodeEntryCancelled
{
  v2 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode notePasscodeEntryCancelled]();
  }
}

- (void)notePasscodeUnlockSucceeded
{
  double v3 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode notePasscodeUnlockSucceeded]();
  }

  [(SBFUserAuthenticationModelSEP *)self _refreshStateForMkbState:0 notify:1];
}

- (void)notePasscodeUnlockFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode notePasscodeUnlockFailedWithError:]((uint64_t)v4, v5);
  }

  id v6 = [v4 domain];
  if ([v6 isEqualToString:@"com.apple.springboardfoundation.mkb"])
  {
    if ([v4 code] == -14)
    {

LABEL_8:
      [(SBFUserAuthenticationModelSEP *)self _refreshStateAndNotify:1];
      goto LABEL_9;
    }
    uint64_t v7 = [v4 code];

    if (v7 == -13) {
      goto LABEL_8;
    }
  }
  else
  {
  }
LABEL_9:
}

- (void)performPasswordTest:(id)a3
{
  double v3 = (void (**)(id, unsigned char *))a3;
  id v4 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode performPasswordTest:]();
  }

  char v5 = 0;
  v3[2](v3, &v5);
}

- (void)clearBlockedState
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18B52E000, v0, v1, "clearBlockedState", v2, v3, v4, v5, v6);
}

- (void)refreshBlockedState
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_2(&dword_18B52E000, v0, v1, "refreshBlockedState", v2, v3, v4, v5, v6);
}

- (void)noteNewMkbDeviceLockState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SBLogAuthenticationModel();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SBFUserAuthenticationModelEducationalMode noteNewMkbDeviceLockState:]((uint64_t)v4, v5);
  }

  [(SBFUserAuthenticationModelSEP *)self _refreshStateForMkbState:v4 notify:1];
}

- (BOOL)isUserRequestedEraseEnabled
{
  return self->_userRequestedEraseEnabled;
}

- (void)setDelegate:(id)a3
{
  id v4 = (SBFUserAuthenticationModelDelegate *)a3;
  if (self->_delegate != v4)
  {
    self->_delegate = v4;
    if (self->_pendingWipe)
    {
      uint64_t v5 = v4;
      [(SBFUserAuthenticationModelDelegate *)v4 deviceLockModelRequestsDeviceWipe:self];
      id v4 = v5;
    }
  }
}

- (NSString)description
{
  uint64_t v2 = [(SBFUserAuthenticationModelSEP *)self descriptionBuilder];
  uint64_t v3 = [v2 build];

  return (NSString *)v3;
}

- (id)descriptionBuilder
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:self->_unblockTime];
  id v5 = (id)[v3 appendObject:v4 withName:@"unblockTime"];

  id v6 = (id)[v3 appendBool:self->_permanentlyBlocked withName:@"permanentlyBlocked"];
  id v7 = (id)[v3 appendBool:self->_pendingWipe withName:@"pendingWipe"];
  return v3;
}

- (void)_refreshStateAndNotify:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SBFMobileKeyBag *)self->_keybag state];
  [(SBFUserAuthenticationModelSEP *)self _refreshStateForMkbState:v5 notify:v3];
}

- (BOOL)_isDeviceWipePreferenceEnabled
{
  return [(SBSecurityDefaults *)self->_securityDefaults isDeviceWipeEnabled];
}

- (void)_refreshStateForMkbState:(id)a3 notify:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = (SBFUserAuthenticationModelSEP *)a3;
  id v7 = SBLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v25 = 138543618;
    v26 = v6;
    __int16 v27 = 2112;
    v28 = self;
    _os_log_impl(&dword_18B52E000, v7, OS_LOG_TYPE_INFO, "Refreshing state from MKB state %{public}@. Current state = %@", (uint8_t *)&v25, 0x16u);
  }

  uint64_t v8 = [(SBFUserAuthenticationModelSEP *)v6 failedAttemptCount];
  if (v8 < 1)
  {
    BOOL v13 = 0;
    BOOL v14 = 0;
    BOOL v15 = 0;
    goto LABEL_15;
  }
  int64_t v9 = v8;
  int64_t v10 = [(SBFMobileKeyBag *)self->_keybag maxUnlockAttempts];
  int v11 = [(MCProfileConnection *)self->_profileConnection effectiveBoolValueForSetting:*MEMORY[0x1E4F73FE0]];
  BOOL v12 = v11 != 2;
  if (v9 < v10)
  {
    BOOL v13 = 0;
    BOOL v14 = 0;
LABEL_14:
    BOOL v15 = v12;
    goto LABEL_15;
  }
  int v16 = v11;
  v17 = [(MCProfileConnection *)self->_profileConnection valueRestrictionForFeature:*MEMORY[0x1E4F740B8]];

  if (v16 == 2)
  {
    if (v17)
    {
      BOOL v14 = 0;
      BOOL v15 = 0;
      BOOL v13 = 1;
      goto LABEL_15;
    }
LABEL_13:
    BOOL v13 = 0;
    BOOL v14 = 1;
    goto LABEL_14;
  }
  BOOL v18 = [(SBFUserAuthenticationModelSEP *)self _isDeviceWipePreferenceEnabled];
  BOOL v14 = 0;
  BOOL v13 = 1;
  BOOL v15 = 1;
  if (!v18 && !v17) {
    goto LABEL_13;
  }
LABEL_15:
  self->_pendingWipe = v13;
  self->_permanentlyBlocked = v14;
  self->_userRequestedEraseEnabled = v15;
  [(SBFUserAuthenticationModelSEP *)v6 backOffTime];
  if (v14 || (double v20 = v19, v19 <= 0.0))
  {
    v21 = [MEMORY[0x1E4F1C9C8] distantPast];
    [v21 timeIntervalSinceReferenceDate];
  }
  else
  {
    v21 = [MEMORY[0x1E4F1C9C8] date];
    [v21 timeIntervalSinceReferenceDate];
    double v23 = v20 + v22;
  }
  self->_unblockTime = v23;

  if (self->_pendingWipe) {
    [(SBFUserAuthenticationModelDelegate *)self->_delegate deviceLockModelRequestsDeviceWipe:self];
  }
  if (v4) {
    [(SBFUserAuthenticationModelDelegate *)self->_delegate deviceLockStateMayHaveChangedForModel:self];
  }
  v24 = SBLogCommon();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    int v25 = 138412290;
    v26 = self;
    _os_log_impl(&dword_18B52E000, v24, OS_LOG_TYPE_INFO, "New MKB state = %@", (uint8_t *)&v25, 0xCu);
  }
}

- (SBFUserAuthenticationModelDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_securityDefaults, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
}

@end