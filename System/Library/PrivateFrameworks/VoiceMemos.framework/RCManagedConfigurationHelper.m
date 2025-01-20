@interface RCManagedConfigurationHelper
+ (BOOL)cloudSyncIsAllowed;
+ (BOOL)isProfanityFiltered;
- (RCManagedConfigurationHelperDelegate)delegate;
- (void)_notifyDelegateOfChange;
- (void)_startObserving;
- (void)_stopObserving;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation RCManagedConfigurationHelper

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (a3)
  {
    [(RCManagedConfigurationHelper *)self _startObserving];
  }
  else
  {
    [(RCManagedConfigurationHelper *)self _stopObserving];
  }
}

- (void)_startObserving
{
  if (!self->_observing)
  {
    self->_observing = 1;
    id v3 = [MEMORY[0x1E4F74230] sharedConnection];
    [v3 registerObserver:self];
  }
}

- (void)dealloc
{
  [(RCManagedConfigurationHelper *)self _stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)RCManagedConfigurationHelper;
  [(RCManagedConfigurationHelper *)&v3 dealloc];
}

- (void)_notifyDelegateOfChange
{
  id v2 = [(RCManagedConfigurationHelper *)self delegate];
  if (v2) {
    objc_msgSend(v2, "managedConfigurationUpdated:", +[RCManagedConfigurationHelper cloudSyncIsAllowed](RCManagedConfigurationHelper, "cloudSyncIsAllowed"));
  }
}

- (void)_stopObserving
{
  if (self->_observing)
  {
    self->_observing = 0;
    id v3 = [MEMORY[0x1E4F74230] sharedConnection];
    [v3 unregisterObserver:self];
  }
}

+ (BOOL)cloudSyncIsAllowed
{
  id v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isCloudSyncAllowed:@"com.apple.VoiceMemos"];

  return v3;
}

+ (BOOL)isProfanityFiltered
{
  id v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F28]] == 1;

  return v3;
}

- (RCManagedConfigurationHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RCManagedConfigurationHelperDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end