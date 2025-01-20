@interface NFManagedConfigMonitor
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation NFManagedConfigMonitor

- (void)dealloc
{
  v3 = [sub_10022F55C() sharedConnection];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NFManagedConfigMonitor;
  [(NFManagedConfigMonitor *)&v4 dealloc];
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if (self)
  {
    v5 = [sub_10022F55C() sharedConnection];
    self->_isAllowed = [v5 isNFCAllowed];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained managedConfigChanged:self->_isAllowed];
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end