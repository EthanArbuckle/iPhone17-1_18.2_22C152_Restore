@interface ManagedConfigurationProvider
- (BOOL)improveSafetyAllowed;
- (ManagedConfigurationProvider)init;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)setImproveSafetyAllowed:(BOOL)a3;
@end

@implementation ManagedConfigurationProvider

- (ManagedConfigurationProvider)init
{
  v10.receiver = self;
  v10.super_class = (Class)ManagedConfigurationProvider;
  v2 = [(ManagedConfigurationProvider *)&v10 init];
  v3 = v2;
  if (v2)
  {
    [(ManagedConfigurationProvider *)v2 setImproveSafetyAllowed:0];
    v4 = dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 4);
    v3->_mcDylibHandle = v4;
    if (v4)
    {
      Class Class = objc_getClass("MCProfileConnection");
      qword_1001D7E88 = (uint64_t)Class;
      if (Class)
      {
        id v6 = [(objc_class *)Class sharedConnection];
        [v6 registerObserver:v3];
        -[ManagedConfigurationProvider setImproveSafetyAllowed:](v3, "setImproveSafetyAllowed:", [v6 isSafetyDataSubmissionAllowed]);
      }
      else
      {
        v8 = *(NSObject **)(qword_1001D8080 + 112);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_10014B624(v8);
        }
      }
    }
    else
    {
      v7 = *(NSObject **)(qword_1001D8080 + 112);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10014B5E0(v7);
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_msgSend(objc_msgSend((id)qword_1001D7E88, "sharedConnection"), "removeObserver:", self);
  mcDylibHandle = self->_mcDylibHandle;
  if (mcDylibHandle) {
    dlclose(mcDylibHandle);
  }
  v4.receiver = self;
  v4.super_class = (Class)ManagedConfigurationProvider;
  [(ManagedConfigurationProvider *)&v4 dealloc];
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v5 = [a3 isSafetyDataSubmissionAllowed];
  id v6 = *(NSObject **)(qword_1001D8080 + 112);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10014B668((char)v5, v6);
  }
  if (v5 != [(ManagedConfigurationProvider *)self improveSafetyAllowed]) {
    [(ManagedConfigurationProvider *)self setImproveSafetyAllowed:v5];
  }
}

- (BOOL)improveSafetyAllowed
{
  return self->_improveSafetyAllowed;
}

- (void)setImproveSafetyAllowed:(BOOL)a3
{
  self->_improveSafetyAllowed = a3;
}

@end