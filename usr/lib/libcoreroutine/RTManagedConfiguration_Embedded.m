@interface RTManagedConfiguration_Embedded
- (BOOL)effectiveBoolValueForSetting:(id)a3;
- (BOOL)isDiagnosticsAndUsageAllowed;
- (BOOL)isFindMyCarAllowed;
- (BOOL)isHealthDataSubmissionAllowed;
- (id)stringToManagedConfigurationKey:(id)a3;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation RTManagedConfiguration_Embedded

- (BOOL)effectiveBoolValueForSetting:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F74230];
  id v5 = a3;
  v6 = [v4 sharedConnection];
  v7 = [(RTManagedConfiguration_Embedded *)self stringToManagedConfigurationKey:v5];

  LOBYTE(v5) = [v6 effectiveBoolValueForSetting:v7] == 1;
  return (char)v5;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(RTManagedConfiguration *)self delegate];
  if (v5 != v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)RTManagedConfiguration_Embedded;
    [(RTManagedConfiguration *)&v8 setDelegate:v4];
    v6 = [MEMORY[0x1E4F74230] sharedConnection];
    v7 = v6;
    if (v4) {
      [v6 registerObserver:self];
    }
    else {
      [v6 unregisterObserver:self];
    }
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F74230] sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RTManagedConfiguration_Embedded;
  [(RTManagedConfiguration_Embedded *)&v4 dealloc];
}

- (id)stringToManagedConfigurationKey:(id)a3
{
  id v3 = a3;
  if ([@"RTFeatureDiagnosticsSubmissionAllowed" isEqualToString:v3])
  {
    objc_super v4 = (id *)MEMORY[0x1E4F73FB8];
LABEL_5:
    id v5 = *v4;
    goto LABEL_7;
  }
  if ([@"RTFeatureFindMyCarAllowed" isEqualToString:v3])
  {
    objc_super v4 = (id *)MEMORY[0x1E4F73FF8];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v4 = [(RTManagedConfiguration *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 didReceiveEffectiveSettingsChangedNotification];
  }
}

- (BOOL)isDiagnosticsAndUsageAllowed
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isDiagnosticSubmissionAllowed];

  return v3;
}

- (BOOL)isFindMyCarAllowed
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isFindMyCarAllowed];

  return v3;
}

- (BOOL)isHealthDataSubmissionAllowed
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isHealthDataSubmissionAllowed];

  return v3;
}

@end