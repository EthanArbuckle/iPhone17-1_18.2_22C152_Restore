@interface AccessoryCurrentLocationAction
- (AccessoryCurrentLocationAction)initWithAccessory:(id)a3 locator:(id)a4 event:(int64_t)a5 completion:(id)a6;
- (BOOL)shouldCancelAction:(id)a3;
- (BOOL)shouldWaitForAction:(id)a3;
- (FMDInternalAccessory)accessory;
- (FMDLocation)location;
- (FMDLocator)locator;
- (FMDispatchTimer)discoveryWaitTimer;
- (FMFuture)accessoryUpdateFuture;
- (id)actionCompletion;
- (id)actionType;
- (id)completion;
- (int64_t)event;
- (void)_completeLocate;
- (void)_finishAction;
- (void)_retrieveLocationNow;
- (void)_stopLocator;
- (void)accessoryDidUpdate:(id)a3;
- (void)runWithCompletion:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setAccessoryUpdateFuture:(id)a3;
- (void)setActionCompletion:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setDiscoveryWaitTimer:(id)a3;
- (void)setEvent:(int64_t)a3;
- (void)setLocation:(id)a3;
- (void)setLocator:(id)a3;
- (void)updateLocationMetaData;
- (void)validateAccessoryDiscoveryDate;
- (void)willCancelAction;
@end

@implementation AccessoryCurrentLocationAction

- (AccessoryCurrentLocationAction)initWithAccessory:(id)a3 locator:(id)a4 event:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)AccessoryCurrentLocationAction;
  v13 = [(AccessoryCurrentLocationAction *)&v16 init];
  v14 = v13;
  if (v13)
  {
    [(AccessoryCurrentLocationAction *)v13 setAccessory:v10];
    [(AccessoryCurrentLocationAction *)v14 setLocator:v11];
    [(AccessoryCurrentLocationAction *)v14 setEvent:a5];
    [(AccessoryCurrentLocationAction *)v14 setActionCompletion:v12];
  }

  return v14;
}

- (id)actionType
{
  return @"AccessoryCurrentLocationAction";
}

- (void)willCancelAction
{
  [(AccessoryCurrentLocationAction *)self _stopLocator];

  [(AccessoryCurrentLocationAction *)self _finishAction];
}

- (void)runWithCompletion:(id)a3
{
  [(AccessoryCurrentLocationAction *)self setCompletion:a3];
  v4 = sub_100004238();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Accessory current location : accessory is connected.", v5, 2u);
  }

  [(AccessoryCurrentLocationAction *)self _retrieveLocationNow];
}

- (BOOL)shouldCancelAction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(AccessoryCurrentLocationAction *)self accessory];
    v6 = [v5 accessoryIdentifier];
    v7 = [v4 accessory];
    v8 = [v7 accessoryIdentifier];
    unsigned __int8 v9 = [v6 isEqual:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)shouldWaitForAction:(id)a3
{
  return 0;
}

- (void)_retrieveLocationNow
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Accessory current location requesting location.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  id v4 = [(AccessoryCurrentLocationAction *)self locator];
  v5 = [(AccessoryCurrentLocationAction *)self accessory];
  v6 = [v5 accessoryIdentifier];
  v7 = [v6 stringValue];

  v8 = [(AccessoryCurrentLocationAction *)self event];
  objc_initWeak(&location, v4);
  unsigned __int8 v9 = [v4 locatorPublisher];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000D06C;
  v18[3] = &unk_1002D9350;
  objc_copyWeak(&v20, buf);
  id v10 = v7;
  id v19 = v10;
  v21[1] = v8;
  objc_copyWeak(v21, &location);
  [v9 startPublishingWithBlock:v18];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000D1AC;
  v15[3] = &unk_1002D9238;
  objc_copyWeak(&v17, buf);
  id v11 = v10;
  id v16 = v11;
  [v4 setStoppedLocatorBlock:v15];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000D2BC;
  v13[3] = &unk_1002D9378;
  id v14 = v4;
  id v12 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(v21);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  objc_destroyWeak(buf);
}

- (void)_finishAction
{
  v3 = sub_100004238();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Accessory current location terminating.", v9, 2u);
  }

  id v4 = [(AccessoryCurrentLocationAction *)self discoveryWaitTimer];
  [v4 cancel];

  [(AccessoryCurrentLocationAction *)self setDiscoveryWaitTimer:0];
  v5 = [(AccessoryCurrentLocationAction *)self actionCompletion];

  if (v5)
  {
    v6 = [(AccessoryCurrentLocationAction *)self actionCompletion];
    v7 = [(AccessoryCurrentLocationAction *)self location];
    ((void (**)(void, void *))v6)[2](v6, v7);

    [(AccessoryCurrentLocationAction *)self setActionCompletion:0];
  }
  v8 = [(AccessoryCurrentLocationAction *)self completion];
  [(AccessoryCurrentLocationAction *)self setCompletion:0];
  if (v8) {
    v8[2](v8);
  }
}

- (void)_completeLocate
{
  id v3 = objc_alloc_init((Class)FMFuture);
  [(AccessoryCurrentLocationAction *)self setAccessoryUpdateFuture:v3];

  objc_initWeak(&location, self);
  id v4 = [(AccessoryCurrentLocationAction *)self accessoryUpdateFuture];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D5E8;
  v12[3] = &unk_1002D93A0;
  objc_copyWeak(&v13, &location);
  id v5 = [v4 addCompletionBlock:v12];

  id v6 = objc_alloc((Class)FMDispatchTimer);
  id v7 = &_dispatch_main_q;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000D628;
  v10[3] = &unk_1002D93C8;
  objc_copyWeak(&v11, &location);
  id v8 = [v6 initWithQueue:&_dispatch_main_q timeout:v10 completion:3.0];
  [(AccessoryCurrentLocationAction *)self setDiscoveryWaitTimer:v8];

  unsigned __int8 v9 = [(AccessoryCurrentLocationAction *)self discoveryWaitTimer];
  [v9 start];

  [(AccessoryCurrentLocationAction *)self validateAccessoryDiscoveryDate];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_stopLocator
{
  id v3 = [(AccessoryCurrentLocationAction *)self locator];
  [(AccessoryCurrentLocationAction *)self setLocator:0];
  [v3 stopLocator];
}

- (void)validateAccessoryDiscoveryDate
{
  id v3 = [(AccessoryCurrentLocationAction *)self accessory];
  id v7 = [v3 lastDiscoveryDate];

  [v7 timeIntervalSinceNow];
  if (v4 >= -60.0)
  {
    [(AccessoryCurrentLocationAction *)self updateLocationMetaData];
    id v5 = [(AccessoryCurrentLocationAction *)self accessoryUpdateFuture];
    id v6 = [(AccessoryCurrentLocationAction *)self location];
    [v5 finishWithResult:v6];
  }
}

- (void)updateLocationMetaData
{
  id v3 = [(AccessoryCurrentLocationAction *)self accessory];
  double v4 = [v3 lastKnownLocationDeviceInfo];

  id v5 = [(AccessoryCurrentLocationAction *)self location];
  id v6 = [v5 metaDataRecord];
  CFStringRef v8 = @"deviceInfo";
  unsigned __int8 v9 = v4;
  id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  [v6 appendMetaData:v7];
}

- (void)accessoryDidUpdate:(id)a3
{
  id v8 = a3;
  double v4 = [v8 accessoryIdentifier];
  id v5 = [(AccessoryCurrentLocationAction *)self accessory];
  id v6 = [v5 accessoryIdentifier];
  unsigned int v7 = [v4 isEqual:v6];

  if (v7)
  {
    [(AccessoryCurrentLocationAction *)self setAccessory:v8];
    [(AccessoryCurrentLocationAction *)self validateAccessoryDiscoveryDate];
  }
}

- (FMDInternalAccessory)accessory
{
  return (FMDInternalAccessory *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccessory:(id)a3
{
}

- (FMDLocator)locator
{
  return self->_locator;
}

- (void)setLocator:(id)a3
{
}

- (int64_t)event
{
  return self->_event;
}

- (void)setEvent:(int64_t)a3
{
  self->_event = a3;
}

- (id)actionCompletion
{
  return self->_actionCompletion;
}

- (void)setActionCompletion:(id)a3
{
}

- (FMDLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (FMFuture)accessoryUpdateFuture
{
  return self->_accessoryUpdateFuture;
}

- (void)setAccessoryUpdateFuture:(id)a3
{
}

- (FMDispatchTimer)discoveryWaitTimer
{
  return self->_discoveryWaitTimer;
}

- (void)setDiscoveryWaitTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryWaitTimer, 0);
  objc_storeStrong((id *)&self->_accessoryUpdateFuture, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong(&self->_actionCompletion, 0);
  objc_storeStrong((id *)&self->_locator, 0);

  objc_storeStrong((id *)&self->_accessory, 0);
}

@end