@interface EPActiveDeviceAssertionFactoryObserverWrapper
- (EPActiveDeviceAssertionFactoryObserver)observer;
- (void)assertionFactoryDidBecomeIdle:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation EPActiveDeviceAssertionFactoryObserverWrapper

- (void)assertionFactoryDidBecomeIdle:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  v5 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained assertionFactoryDidBecomeIdle:v6];
  }
}

- (EPActiveDeviceAssertionFactoryObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (EPActiveDeviceAssertionFactoryObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end