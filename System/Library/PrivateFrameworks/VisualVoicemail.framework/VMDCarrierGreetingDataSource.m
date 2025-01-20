@interface VMDCarrierGreetingDataSource
- (BOOL)isGreetingChangeSupportedForAccountUUID:(id)a3;
- (NSMutableDictionary)greetingsByUUID;
- (NSOperationQueue)delegateQueue;
- (OS_dispatch_queue)queue;
- (VMCarrierBundleClient)carrierBundleClient;
- (VMCarrierServicesController)carrierServicesController;
- (VMDCarrierGreetingDataSource)init;
- (VMDCarrierGreetingDataSource)initWithServicesController:(id)a3 telephonyClient:(id)a4;
- (VMGreetingDataSourceDelegate)delegate;
- (VMTelephonyClient)telephonyClient;
- (double)maximumGreetingDurationForAccountUUID:(id)a3;
- (id)greetingForUUID:(id)a3;
- (os_unfair_lock_s)accessorLock;
- (void)_handleGreetingChangedByCarrier:(id)a3;
- (void)greetingForAccountUUID:(id)a3 completion:(id)a4;
- (void)notifyDelegateGreetingDidChangeByCarrierForAccountUUID:(id)a3;
- (void)notifyDelegateGreetingDidChangeForAccountUUID:(id)a3;
- (void)notifyDelegateGreetingWillChangeForAccountUUID:(id)a3;
- (void)performAtomicAccessorBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setGreeting:(id)a3 forAccountUUID:(id)a4 completion:(id)a5;
- (void)setGreeting:(id)a3 forUUID:(id)a4;
- (void)setTelephonyClient:(id)a3;
@end

@implementation VMDCarrierGreetingDataSource

- (VMDCarrierGreetingDataSource)init
{
  return 0;
}

- (VMDCarrierGreetingDataSource)initWithServicesController:(id)a3 telephonyClient:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)VMDCarrierGreetingDataSource;
  v9 = [(VMDCarrierGreetingDataSource *)&v24 init];
  if (v9)
  {
    v10 = objc_msgSend((id)objc_opt_class(), "vm_classIdentifier");
    v11 = NSStringFromSelector("queue");
    v12 = +[NSString stringWithFormat:@"%@.%@", v10, v11];

    id v13 = v12;
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v14;

    v9->_accessorLock._os_unfair_lock_opaque = 0;
    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    greetingsByUUID = v9->_greetingsByUUID;
    v9->_greetingsByUUID = v16;

    objc_storeStrong((id *)&v9->_carrierServicesController, a3);
    [(VMDCarrierGreetingDataSource *)v9 setTelephonyClient:v8];
    v18 = [VMCarrierBundleClient alloc];
    v19 = [(VMDCarrierGreetingDataSource *)v9 telephonyClient];
    v20 = [(VMCarrierBundleClient *)v18 initWithTelephonyClient:v19 queue:v9->_queue];
    carrierBundleClient = v9->_carrierBundleClient;
    v9->_carrierBundleClient = v20;

    v22 = +[NSNotificationCenter defaultCenter];
    [v22 addObserver:v9 selector:"_handleGreetingChangedByCarrier:" name:@"VVServiceGreetingChangedByCarrierNotification" object:0];
  }
  return v9;
}

- (void)_handleGreetingChangedByCarrier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = [v4 userInfo];

    if (v6)
    {
      id v7 = [v5 userInfo];
      id v8 = [v7 valueForKey:@"accountUUID"];

      if (v8)
      {
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100015D90;
        v9[3] = &unk_1000C11B8;
        v9[4] = self;
        id v10 = v8;
        [(VMDCarrierGreetingDataSource *)self performAtomicAccessorBlock:v9];
      }
    }
  }
}

- (VMGreetingDataSourceDelegate)delegate
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100015E9C;
  v9 = sub_100015EAC;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015EB4;
  v4[3] = &unk_1000C1190;
  v4[4] = self;
  v4[5] = &v5;
  [(VMDCarrierGreetingDataSource *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (VMGreetingDataSourceDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015F94;
  v4[3] = &unk_1000C11B8;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(VMDCarrierGreetingDataSource *)v5 performAtomicAccessorBlock:v4];
}

- (NSOperationQueue)delegateQueue
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  id v8 = sub_100015E9C;
  v9 = sub_100015EAC;
  id v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100016104;
  v4[3] = &unk_1000C1190;
  void v4[4] = self;
  v4[5] = &v5;
  [(VMDCarrierGreetingDataSource *)self performAtomicAccessorBlock:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSOperationQueue *)v2;
}

- (void)setDelegateQueue:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000161E4;
  v4[3] = &unk_1000C11B8;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(VMDCarrierGreetingDataSource *)v5 performAtomicAccessorBlock:v4];
}

- (id)greetingForUUID:(id)a3
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_100015E9C;
  dispatch_queue_t v14 = sub_100015EAC;
  id v15 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001637C;
  v6[3] = &unk_1000C1960;
  v9 = &v10;
  uint64_t v7 = self;
  id v3 = a3;
  id v8 = v3;
  [(VMDCarrierGreetingDataSource *)v7 performAtomicAccessorBlock:v6];
  id v4 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v4;
}

- (void)setGreeting:(id)a3 forUUID:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100016490;
  v9[3] = &unk_1000C11E0;
  v9[4] = self;
  id v10 = a4;
  id v11 = v6;
  id v7 = v6;
  id v8 = v10;
  [(VMDCarrierGreetingDataSource *)self performAtomicAccessorBlock:v9];
}

- (void)performAtomicAccessorBlock:(id)a3
{
  id v6 = (void (**)(void))a3;
  if (v6)
  {
    os_unfair_lock_lock_with_options();
    v6[2]();
    os_unfair_lock_unlock(&self->_accessorLock);
  }
  else
  {
    uint64_t v5 = +[NSAssertionHandler currentHandler];
    [v5 handleFailureInMethod:a2, self, @"VMDCarrierGreetingDataSource.m", 163, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
}

- (void)notifyDelegateGreetingWillChangeForAccountUUID:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = objc_loadWeakRetained((id *)&self->_delegateQueue);
  id v7 = [v6 underlyingQueue];

  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  if (objc_opt_respondsToSelector())
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001679C;
    block[3] = &unk_1000C11E0;
    id v10 = WeakRetained;
    id v11 = self;
    id v12 = v4;
    dispatch_async(v7, block);
  }
}

- (void)notifyDelegateGreetingDidChangeForAccountUUID:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = objc_loadWeakRetained((id *)&self->_delegateQueue);
  id v7 = [v6 underlyingQueue];

  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  if (objc_opt_respondsToSelector())
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000168B4;
    block[3] = &unk_1000C11E0;
    id v10 = WeakRetained;
    id v11 = self;
    id v12 = v4;
    dispatch_async(v7, block);
  }
}

- (void)notifyDelegateGreetingDidChangeByCarrierForAccountUUID:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v6 = objc_loadWeakRetained((id *)&self->_delegateQueue);
  id v7 = [v6 underlyingQueue];

  if (!v7)
  {
    id v7 = &_dispatch_main_q;
    id v8 = &_dispatch_main_q;
  }
  if (objc_opt_respondsToSelector())
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000169C4;
    v9[3] = &unk_1000C11B8;
    id v10 = WeakRetained;
    id v11 = v4;
    dispatch_async(v7, v9);
  }
}

- (BOOL)isGreetingChangeSupportedForAccountUUID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VMDCarrierGreetingDataSource *)self carrierServicesController];
  unsigned int v6 = [v5 isAccountSubscribed:v4];

  if (v6)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = [(VMDCarrierGreetingDataSource *)self telephonyClient];
    id v8 = [v7 contexts];
    v9 = [v8 subscriptions];

    id v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v25;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v25 != v12) {
            objc_enumerationMutation(v9);
          }
          dispatch_queue_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          id v15 = [v14 labelID];
          v16 = [v4 UUIDString];
          unsigned int v17 = [v15 isEqual:v16];

          if (v17)
          {
            v19 = [(VMDCarrierGreetingDataSource *)self carrierBundleClient];
            v20 = [v14 context];
            unsigned int v18 = [v19 isGreetingChangeSupportedForSubscription:v20];

            goto LABEL_13;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    unsigned int v18 = 0;
LABEL_13:
  }
  else
  {
    unsigned int v18 = 0;
  }
  v21 = vm_vmd_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v22 = @"not supported";
    if (v18) {
      CFStringRef v22 = @"supported";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v29 = v22;
    __int16 v30 = 2112;
    id v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Greeting is %@ for account %@", buf, 0x16u);
  }

  return v18;
}

- (double)maximumGreetingDurationForAccountUUID:(id)a3
{
  id v4 = a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [(VMDCarrierGreetingDataSource *)self telephonyClient];
  unsigned int v6 = [v5 contexts];
  id v7 = [v6 subscriptions];

  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  double v9 = 0.0;
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v22;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        dispatch_queue_t v14 = [v13 labelID];
        id v15 = [v4 UUIDString];
        unsigned int v16 = [v14 isEqual:v15];

        if (v16)
        {
          unsigned int v17 = [(VMDCarrierGreetingDataSource *)self carrierBundleClient];
          unsigned int v18 = [v13 context];
          [v17 maximumGreetingDurationForSubscription:v18];
          double v9 = v19;

          goto LABEL_11;
        }
      }
      id v10 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)greetingForAccountUUID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(VMDCarrierGreetingDataSource *)self carrierServicesController];
  [v8 greetingForAccountUUID:v7 completion:v6];
}

- (void)setGreeting:(id)a3 forAccountUUID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(VMDCarrierGreetingDataSource *)self carrierServicesController];
  [v11 setGreeting:v10 forAccountUUID:v9 completion:v8];
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableDictionary)greetingsByUUID
{
  return self->_greetingsByUUID;
}

- (VMCarrierServicesController)carrierServicesController
{
  return self->_carrierServicesController;
}

- (VMCarrierBundleClient)carrierBundleClient
{
  return self->_carrierBundleClient;
}

- (VMTelephonyClient)telephonyClient
{
  return self->_telephonyClient;
}

- (void)setTelephonyClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_telephonyClient, 0);
  objc_storeStrong((id *)&self->_carrierBundleClient, 0);
  objc_storeStrong((id *)&self->_carrierServicesController, 0);
  objc_storeStrong((id *)&self->_greetingsByUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegateQueue);
  objc_destroyWeak((id *)&self->_delegate);
}

@end