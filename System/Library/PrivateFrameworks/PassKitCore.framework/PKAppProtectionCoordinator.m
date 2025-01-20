@interface PKAppProtectionCoordinator
+ (id)shared;
- (BOOL)isEffectivelyLocked;
- (void)isShieldRequiredWithCompletion:(id)a3;
- (void)registerObserver:(id)a3;
- (void)requestAccess;
- (void)requestAccessWithCompletion:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation PKAppProtectionCoordinator

+ (id)shared
{
  if (qword_1EB403348 != -1) {
    dispatch_once(&qword_1EB403348, &__block_literal_global_173);
  }
  v2 = (void *)_MergedGlobals_264;
  return v2;
}

void __36__PKAppProtectionCoordinator_shared__block_invoke()
{
  v0 = objc_alloc_init(PKAppProtectionCoordinator);
  v1 = (void *)_MergedGlobals_264;
  _MergedGlobals_264 = (uint64_t)v0;
}

- (BOOL)isEffectivelyLocked
{
  v2 = +[_PKAppProtectionCoordinator shared];
  char v3 = [v2 isEffectivelyLocked];

  return v3;
}

- (void)isShieldRequiredWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[_PKAppProtectionCoordinator shared];
  [v4 isShieldRequiredWithCompletionHandler:v3];
}

- (void)requestAccess
{
  id v2 = +[_PKAppProtectionCoordinator shared];
  [v2 requestAccess];
}

- (void)requestAccessWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[_PKAppProtectionCoordinator shared];
  [v4 requestAccessWithCompletionHandler:v3];
}

- (void)registerObserver:(id)a3
{
  id v3 = a3;
  id v4 = +[_PKAppProtectionCoordinator shared];
  [v4 registerObserver:v3];
}

- (void)unregisterObserver:(id)a3
{
  id v3 = a3;
  id v4 = +[_PKAppProtectionCoordinator shared];
  [v4 unregisterObserver:v3];
}

@end