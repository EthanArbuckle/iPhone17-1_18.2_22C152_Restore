@interface STQueryIDSDestinationsOperation
- (NSArray)destinations;
- (NSDictionary)originalDestinationByIDSDestination;
- (NSString)serviceName;
- (OS_dispatch_queue)serviceQueryQueue;
- (STQueryIDSDestinationsOperation)initWithServiceName:(id)a3 destinations:(id)a4;
- (void)main;
- (void)setOriginalDestinationByIDSDestination:(id)a3;
- (void)setServiceName:(id)a3;
- (void)setServiceQueryQueue:(id)a3;
@end

@implementation STQueryIDSDestinationsOperation

- (STQueryIDSDestinationsOperation)initWithServiceName:(id)a3 destinations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)STQueryIDSDestinationsOperation;
  v9 = [(STOperation *)&v16 init];
  if (v9)
  {
    dispatch_queue_t v10 = dispatch_queue_create((const char *)[@"com.apple.ScreenTimeAgent.ids-query-delegate" UTF8String], 0);
    serviceQueryQueue = v9->_serviceQueryQueue;
    v9->_serviceQueryQueue = (OS_dispatch_queue *)v10;

    v12 = (NSArray *)[v8 copy];
    destinations = v9->_destinations;
    v9->_destinations = v12;

    objc_storeStrong((id *)&v9->_serviceName, a3);
  }
  v14 = +[STLog familyMessaging];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v18 = "-[STQueryIDSDestinationsOperation initWithServiceName:destinations:]";
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \ndestinations: %{public}@", buf, 0x16u);
  }

  return v9;
}

- (void)main
{
  v3 = +[STLog familyMessaging];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    destinations = self->_destinations;
    *(_DWORD *)buf = 136446466;
    v28 = "-[STQueryIDSDestinationsOperation main]";
    __int16 v29 = 2114;
    v30 = destinations;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \ndestinations: %{public}@ - entered", buf, 0x16u);
  }

  v5 = [(STQueryIDSDestinationsOperation *)self destinations];
  v6 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v5 count]);

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = [(STQueryIDSDestinationsOperation *)self destinations];
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v11);
        v13 = (void *)IDSCopyAddressDestinationForDestination();
        [v6 setObject:v12 forKeyedSubscript:v13];

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }

  id v14 = [v6 copy];
  [(STQueryIDSDestinationsOperation *)self setOriginalDestinationByIDSDestination:v14];

  v15 = +[STLog familyMessaging];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    originalDestinationByIDSDestination = self->_originalDestinationByIDSDestination;
    *(_DWORD *)buf = 136446466;
    v28 = "-[STQueryIDSDestinationsOperation main]";
    __int16 v29 = 2114;
    v30 = originalDestinationByIDSDestination;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[v1] %{public}s: \noriginalDestinationByIDSDestination: %{public}@", buf, 0x16u);
  }

  v17 = +[IDSIDQueryController sharedInstance];
  v18 = [v6 allKeys];
  __int16 v19 = [(STQueryIDSDestinationsOperation *)self serviceName];
  id v20 = [(STQueryIDSDestinationsOperation *)self serviceQueryQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10005FE00;
  v21[3] = &unk_1002FD548;
  v21[4] = self;
  [v17 refreshIDStatusForDestinations:v18 service:v19 listenerID:@"STAgent" queue:v20 completionBlock:v21];
}

- (OS_dispatch_queue)serviceQueryQueue
{
  return self->_serviceQueryQueue;
}

- (void)setServiceQueryQueue:(id)a3
{
}

- (NSArray)destinations
{
  return self->_destinations;
}

- (NSDictionary)originalDestinationByIDSDestination
{
  return self->_originalDestinationByIDSDestination;
}

- (void)setOriginalDestinationByIDSDestination:(id)a3
{
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_originalDestinationByIDSDestination, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_serviceQueryQueue, 0);
}

@end