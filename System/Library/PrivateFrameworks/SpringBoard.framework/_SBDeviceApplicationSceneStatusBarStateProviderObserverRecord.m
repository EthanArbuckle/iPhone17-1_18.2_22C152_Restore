@interface _SBDeviceApplicationSceneStatusBarStateProviderObserverRecord
- (SBDeviceApplicationSceneStatusBarStateObserver)observer;
- (SBDeviceApplicationSceneStatusBarStateObserverFlags)flags;
- (_SBDeviceApplicationSceneStatusBarStateProviderObserverRecord)initWithObserver:(id)a3 andFlags:(SBDeviceApplicationSceneStatusBarStateObserverFlags)a4;
@end

@implementation _SBDeviceApplicationSceneStatusBarStateProviderObserverRecord

- (void).cxx_destruct
{
}

- (_SBDeviceApplicationSceneStatusBarStateProviderObserverRecord)initWithObserver:(id)a3 andFlags:(SBDeviceApplicationSceneStatusBarStateObserverFlags)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SBDeviceApplicationSceneStatusBarStateProviderObserverRecord;
  v7 = [(_SBDeviceApplicationSceneStatusBarStateProviderObserverRecord *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_observer, v6);
    v8->_flags = a4;
  }

  return v8;
}

- (SBDeviceApplicationSceneStatusBarStateObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (SBDeviceApplicationSceneStatusBarStateObserver *)WeakRetained;
}

- (SBDeviceApplicationSceneStatusBarStateObserverFlags)flags
{
  return self->_flags;
}

@end