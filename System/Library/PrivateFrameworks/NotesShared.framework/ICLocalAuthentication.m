@interface ICLocalAuthentication
+ (BOOL)biometricsAvailable;
+ (BOOL)biometricsEnrolled;
+ (BOOL)biometricsLockedOut;
+ (BOOL)hasPasscode;
+ (LAContext)biometricsContext;
+ (NSData)biometricsPolicyState;
+ (NSError)biometricsContextError;
+ (int64_t)biometricsPolicy;
+ (int64_t)biometricsType;
+ (void)checkBiometricsPolicyState;
+ (void)refreshBiometricsContext;
+ (void)refreshHasPasscode;
+ (void)setBiometricsContext:(id)a3;
+ (void)setBiometricsContextError:(id)a3;
+ (void)setHasPasscode:(BOOL)a3;
@end

@implementation ICLocalAuthentication

+ (void)refreshHasPasscode
{
  if (([MEMORY[0x1E4F83738] isRunningUnitTests] & 1) == 0)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F30B50]);
    uint64_t v2 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "canEvaluatePolicy:error:", 2, 0));
    v3 = (void *)_hasPasscode;
    _hasPasscode = v2;
  }
}

+ (void)refreshBiometricsContext
{
  if (([MEMORY[0x1E4F83738] isRunningUnitTests] & 1) == 0)
  {
    id v3 = a1;
    objc_sync_enter(v3);
    id v4 = objc_alloc_init(MEMORY[0x1E4F30B50]);
    [v3 setBiometricsContext:v4];

    v5 = [v3 biometricsContext];
    id v7 = 0;
    objc_msgSend(v5, "canEvaluatePolicy:error:", objc_msgSend(v3, "biometricsPolicy"), &v7);
    id v6 = v7;

    [v3 setBiometricsContextError:v6];
    objc_sync_exit(v3);
  }
}

+ (void)setBiometricsContextError:(id)a3
{
  id v4 = a3;
  id obj = a1;
  objc_sync_enter(obj);
  v5 = (void *)_biometricsContextError;
  _biometricsContextError = (uint64_t)v4;

  objc_sync_exit(obj);
}

+ (void)setBiometricsContext:(id)a3
{
  id v4 = a3;
  id obj = a1;
  objc_sync_enter(obj);
  v5 = (void *)_biometricsContext;
  _biometricsContext = (uint64_t)v4;

  objc_sync_exit(obj);
}

+ (int64_t)biometricsPolicy
{
  if (ICInternalSettingsIsOnenessUnlockEnabled()) {
    return 4;
  }
  else {
    return 1;
  }
}

+ (LAContext)biometricsContext
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (void *)_biometricsContext;
  if (!_biometricsContext)
  {
    [v2 refreshBiometricsContext];
    id v3 = (void *)_biometricsContext;
  }
  id v4 = v3;
  objc_sync_exit(v2);

  return (LAContext *)v4;
}

+ (NSError)biometricsContextError
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (id)_biometricsContextError;
  objc_sync_exit(v2);

  return (NSError *)v3;
}

+ (BOOL)biometricsAvailable
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = [v2 biometricsContext];
  if (v3)
  {
    id v4 = [v2 biometricsContextError];
    BOOL v5 = [v4 code] != -6;
  }
  else
  {
    BOOL v5 = 0;
  }

  objc_sync_exit(v2);
  return v5;
}

+ (BOOL)biometricsEnrolled
{
  id v2 = a1;
  objc_sync_enter(v2);
  if ([v2 biometricsAvailable])
  {
    id v3 = [v2 biometricsContextError];
    BOOL v4 = [v3 code] != -7;
  }
  else
  {
    BOOL v4 = 0;
  }
  objc_sync_exit(v2);

  return v4;
}

+ (BOOL)biometricsLockedOut
{
  id v2 = a1;
  objc_sync_enter(v2);
  if ([v2 biometricsAvailable])
  {
    id v3 = [v2 biometricsContextError];
    BOOL v4 = [v3 code] == -8;
  }
  else
  {
    BOOL v4 = 0;
  }
  objc_sync_exit(v2);

  return v4;
}

+ (int64_t)biometricsType
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = [v2 biometricsContext];
  int64_t v4 = [v3 biometryType];

  objc_sync_exit(v2);
  return v4;
}

+ (NSData)biometricsPolicyState
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = [v2 biometricsContext];
  int64_t v4 = [v3 evaluatedPolicyDomainState];
  BOOL v5 = (void *)[v4 copy];

  objc_sync_exit(v2);
  return (NSData *)v5;
}

+ (void)checkBiometricsPolicyState
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = [v2 biometricsContextError];
  if (v3)
  {

    goto LABEL_24;
  }
  if (([MEMORY[0x1E4F83738] isRunningInApp] & 1) != 0
    || ([MEMORY[0x1E4F83738] isRunningUnitTests] & 1) != 0)
  {
    int64_t v4 = +[ICKeychain dataForIdentifier:@"ICPasswordPolicyDomainStateKey" account:0];
    BOOL v5 = [v2 biometricsPolicyState];
    id v6 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v4) {
      id v7 = 0;
    }
    else {
      id v7 = v4;
    }
    unint64_t v8 = v7;
    if (v6 == v5) {
      v9 = 0;
    }
    else {
      v9 = v5;
    }
    unint64_t v10 = v9;
    if (v8 | v10)
    {
      v11 = (void *)v10;
      if (v8) {
        BOOL v12 = v10 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12)
      {
      }
      else
      {
        char v13 = [(id)v8 isEqual:v10];

        if (v13) {
          goto LABEL_23;
        }
      }
      v14 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1C3A61000, v14, OS_LOG_TYPE_INFO, "Cached biometrics policy state has changed", v16, 2u);
      }

      v15 = [v2 biometricsPolicyState];
      +[ICKeychain setData:v15 forIdentifier:@"ICPasswordPolicyDomainStateKey" account:0 error:0];

      BOOL v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 postNotificationName:@"ICLocalAuthenticationDidChangeBiometricsPolicyStateNotification" object:v2];
    }

LABEL_23:
  }
LABEL_24:
  objc_sync_exit(v2);
}

+ (BOOL)hasPasscode
{
  id v2 = a1;
  objc_sync_enter(v2);
  id v3 = (void *)_hasPasscode;
  if (!_hasPasscode)
  {
    [v2 refreshHasPasscode];
    id v3 = (void *)_hasPasscode;
  }
  char v4 = [v3 BOOLValue];
  objc_sync_exit(v2);

  return v4;
}

+ (void)setHasPasscode:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = a1;
  objc_sync_enter(obj);
  uint64_t v4 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
  BOOL v5 = (void *)_hasPasscode;
  _hasPasscode = v4;

  objc_sync_exit(obj);
}

@end