@interface _SBSceneHandleObserverBehavior
+ (id)behaviorFromObserver:(id)a3;
- (BOOL)didCreateScene;
- (BOOL)didDestroyScene;
- (BOOL)didUpdateClientSettingsWithDiff;
- (BOOL)didUpdateContentState;
- (BOOL)didUpdatePairingStatusForExternalSceneIdentifiers;
- (BOOL)didUpdateSettingsWithDiff;
- (BOOL)replacedWithSceneHandle;
- (SBSceneHandleObserver)observer;
- (_SBSceneHandleObserverBehavior)initWithObserver:(id)a3;
- (void)setDidCreateScene:(BOOL)a3;
- (void)setDidDestroyScene:(BOOL)a3;
- (void)setDidUpdateClientSettingsWithDiff:(BOOL)a3;
- (void)setDidUpdateContentState:(BOOL)a3;
- (void)setDidUpdatePairingStatusForExternalSceneIdentifiers:(BOOL)a3;
- (void)setDidUpdateSettingsWithDiff:(BOOL)a3;
- (void)setReplacedWithSceneHandle:(BOOL)a3;
@end

@implementation _SBSceneHandleObserverBehavior

+ (id)behaviorFromObserver:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithObserver:v3];

  return v4;
}

- (_SBSceneHandleObserverBehavior)initWithObserver:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_SBSceneHandleObserverBehavior;
  v5 = [(_SBSceneHandleObserverBehavior *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_observer, v4);
    v6->_didCreateScene = objc_opt_respondsToSelector() & 1;
    v6->_didDestroyScene = objc_opt_respondsToSelector() & 1;
    v6->_didUpdateContentState = objc_opt_respondsToSelector() & 1;
    v6->_didUpdateSettingsWithDiff = objc_opt_respondsToSelector() & 1;
    v6->_didUpdateClientSettingsWithDiff = objc_opt_respondsToSelector() & 1;
    v6->_didUpdatePairingStatusForExternalSceneIdentifiers = objc_opt_respondsToSelector() & 1;
    v6->_replacedWithSceneHandle = objc_opt_respondsToSelector() & 1;
  }

  return v6;
}

- (BOOL)didUpdateSettingsWithDiff
{
  return self->_didUpdateSettingsWithDiff;
}

- (BOOL)didUpdateClientSettingsWithDiff
{
  return self->_didUpdateClientSettingsWithDiff;
}

- (BOOL)didUpdateContentState
{
  return self->_didUpdateContentState;
}

- (BOOL)didCreateScene
{
  return self->_didCreateScene;
}

- (void).cxx_destruct
{
}

- (SBSceneHandleObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (SBSceneHandleObserver *)WeakRetained;
}

- (void)setDidCreateScene:(BOOL)a3
{
  self->_didCreateScene = a3;
}

- (BOOL)didDestroyScene
{
  return self->_didDestroyScene;
}

- (void)setDidDestroyScene:(BOOL)a3
{
  self->_didDestroyScene = a3;
}

- (void)setDidUpdateContentState:(BOOL)a3
{
  self->_didUpdateContentState = a3;
}

- (void)setDidUpdateSettingsWithDiff:(BOOL)a3
{
  self->_didUpdateSettingsWithDiff = a3;
}

- (void)setDidUpdateClientSettingsWithDiff:(BOOL)a3
{
  self->_didUpdateClientSettingsWithDiff = a3;
}

- (BOOL)didUpdatePairingStatusForExternalSceneIdentifiers
{
  return self->_didUpdatePairingStatusForExternalSceneIdentifiers;
}

- (void)setDidUpdatePairingStatusForExternalSceneIdentifiers:(BOOL)a3
{
  self->_didUpdatePairingStatusForExternalSceneIdentifiers = a3;
}

- (BOOL)replacedWithSceneHandle
{
  return self->_replacedWithSceneHandle;
}

- (void)setReplacedWithSceneHandle:(BOOL)a3
{
  self->_replacedWithSceneHandle = a3;
}

@end