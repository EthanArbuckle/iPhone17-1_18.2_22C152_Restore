@interface STCoreDataDeviceStateStore
- (STCoreDataDeviceStateReverseTransformer)reverseTransformer;
- (STCoreDataDeviceStateStore)initWithObserver:(id)a3 transformer:(id)a4 reverseTransformer:(id)a5;
- (STCoreDataDeviceStateTransformer)transformer;
- (STCoreDataObserver)observer;
- (STDeviceStateChangeObserverDelegate)delegate;
- (id)readDeviceStateChangeForLocalDevice;
- (id)writeDeviceStateChange:(id)a3;
- (void)observer:(id)a3 didObserveCoreDataChanges:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation STCoreDataDeviceStateStore

- (STCoreDataDeviceStateStore)initWithObserver:(id)a3 transformer:(id)a4 reverseTransformer:(id)a5
{
  v8 = (STCoreDataObserver *)a3;
  v9 = (STCoreDataDeviceStateTransformer *)a4;
  v10 = (STCoreDataDeviceStateReverseTransformer *)a5;
  v21.receiver = self;
  v21.super_class = (Class)STCoreDataDeviceStateStore;
  v11 = [(STCoreDataDeviceStateStore *)&v21 init];
  transformer = v11->_transformer;
  v11->_transformer = v9;
  v13 = v9;

  reverseTransformer = v11->_reverseTransformer;
  v11->_reverseTransformer = v10;
  v15 = v10;

  observer = v11->_observer;
  v11->_observer = v8;
  v17 = v8;

  v18 = v11->_observer;
  v19 = [(STCoreDataDeviceStateTransformer *)v13 deviceStateObservationFiltersByTriggerPredicate];
  [(STCoreDataObserver *)v18 addObservationFiltersByTriggerPredicate:v19 forDelegate:v11];

  return v11;
}

- (id)readDeviceStateChangeForLocalDevice
{
  v2 = [(STCoreDataDeviceStateStore *)self transformer];
  v3 = [v2 deviceStateChangeForLocalDevice];

  return v3;
}

- (id)writeDeviceStateChange:(id)a3
{
  id v4 = a3;
  v5 = [(STCoreDataDeviceStateStore *)self reverseTransformer];
  v6 = [v5 handleDeviceStateChange:v4];

  return v6;
}

- (void)observer:(id)a3 didObserveCoreDataChanges:(id)a4
{
  id v5 = a4;
  v6 = [(STCoreDataDeviceStateStore *)self transformer];
  id v10 = 0;
  v7 = [v6 deviceStateChangeForCoreDataChanges:v5 error:&v10];
  id v8 = v10;

  if (v7)
  {
    v9 = [(STCoreDataDeviceStateStore *)self delegate];
    [v9 changeObserver:self didObserveDeviceStateChange:v7];
  }
  else
  {
    v9 = +[STLog coreDataConfigurationStore];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10025D734((uint64_t)v5, (uint64_t)v8, v9);
    }
  }
}

- (STDeviceStateChangeObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (STDeviceStateChangeObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (STCoreDataObserver)observer
{
  return (STCoreDataObserver *)objc_getProperty(self, a2, 16, 1);
}

- (STCoreDataDeviceStateTransformer)transformer
{
  return (STCoreDataDeviceStateTransformer *)objc_getProperty(self, a2, 24, 1);
}

- (STCoreDataDeviceStateReverseTransformer)reverseTransformer
{
  return (STCoreDataDeviceStateReverseTransformer *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reverseTransformer, 0);
  objc_storeStrong((id *)&self->_transformer, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_destroyWeak((id *)&self->delegate);
}

@end