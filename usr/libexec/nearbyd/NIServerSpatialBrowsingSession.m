@interface NIServerSpatialBrowsingSession
- (NIServerSpatialBrowsingSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5;
- (NISpatialBrowsingConfiguration)configuration;
- (duration<long)nominalCycleRate;
- (id).cxx_construct;
- (id)configure;
- (id)lastConfiguration;
- (id)pauseWithSource:(int64_t)a3;
- (id)run;
- (unint64_t)requiresUWBToRun;
- (void)invalidate;
@end

@implementation NIServerSpatialBrowsingSession

- (NIServerSpatialBrowsingSession)initWithResourcesManager:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = objc_opt_class();
  if (v11 != objc_opt_class())
  {
    v25 = +[NSAssertionHandler currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"NIServerSpatialBrowsingSession.mm" lineNumber:33 description:@"NIServerSpatialBrowsingSession given invalid configuration."];
  }
  v12 = [v9 serverSessionIdentifier];

  if (!v12)
  {
    v26 = +[NSAssertionHandler currentHandler];
    [v26 handleFailureInMethod:a2, self, @"NIServerSpatialBrowsingSession.mm", 34, @"Invalid parameter not satisfying: %@", @"resourcesManager.serverSessionIdentifier" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)NIServerSpatialBrowsingSession;
  id v13 = [(NIServerBaseSession *)&v28 initWithResourcesManager:v9 configuration:v10 error:a5];
  if (v13)
  {
    id v14 = [v10 copy];
    v15 = (void *)*((void *)v13 + 10);
    *((void *)v13 + 10) = v14;

    if (v9)
    {
      [v9 protobufLogger];
      long long v16 = v27;
    }
    else
    {
      long long v16 = 0uLL;
    }
    v17 = (std::__shared_weak_count *)*((void *)v13 + 7);
    *((_OWORD *)v13 + 3) = v16;
    if (v17) {
      sub_10001A970(v17);
    }
    uint64_t v18 = [v9 clientConnectionQueue];
    v19 = (void *)*((void *)v13 + 8);
    *((void *)v13 + 8) = v18;

    v20 = [v9 serverSessionIdentifier];
    uint64_t v21 = [v20 UUIDString];
    v22 = (void *)*((void *)v13 + 9);
    *((void *)v13 + 9) = v21;

    id v23 = v13;
  }

  return (NIServerSpatialBrowsingSession *)v13;
}

- (duration<long)nominalCycleRate
{
  return (duration<long long, std::ratio<1, 1000>>)2000;
}

- (id)lastConfiguration
{
  return self->_configuration;
}

- (unint64_t)requiresUWBToRun
{
  return 2;
}

- (id)configure
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  if (!self->_configuration) {
    sub_10042D3F8();
  }
  v3 = qword_1008ABDE0;
  if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
  {
    configuration = self->_configuration;
    int v6 = 138412290;
    v7 = configuration;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ses-sptbrows,Configure. Configuration given: %@", (uint8_t *)&v6, 0xCu);
  }
  return 0;
}

- (id)run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v24.receiver = self;
  v24.super_class = (Class)NIServerSpatialBrowsingSession;
  v20 = [(NIServerBaseSession *)&v24 resourcesManager];
  v3 = [v20 recentlyObservedObjectsCache];
  if (v3)
  {
    [(NISpatialBrowsingConfiguration *)self->_configuration maxNearbyObjectAge];
    uint64_t v5 = v4;
    int v6 = [v3 getMostRecentObjectsWithMaxAge:];
    for (unint64_t i = 0; (unint64_t)[v6 count] > i; ++i)
    {
      v8 = +[NSNumber numberWithInt:(i + 1)];
      id v9 = [v6 objectAtIndexedSubscript:i];
      [v9 overrideSpatialScore:v8];

      id v10 = [v6 objectAtIndexedSubscript:i];
      uint64_t v11 = [v10 bluetoothAdvertisingAddress];
      v12 = sub_1002224F4(v11);

      if (v12)
      {
        id v13 = [v6 objectAtIndexedSubscript:i];
        [v13 setDeviceIdentifier:v12];
      }
    }
    id v14 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v26 = v5;
      __int16 v27 = 2112;
      objc_super v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#ses-sptbrows,Returning most recent objects (max age: %0.2f sec): %@", buf, 0x16u);
    }
    clientQueue = self->_clientQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002E2A5C;
    block[3] = &unk_100846588;
    id v22 = v20;
    id v23 = v6;
    id v16 = v6;
    dispatch_async((dispatch_queue_t)clientQueue, block);

    v17 = 0;
  }
  else
  {
    uint64_t v18 = qword_1008ABDE0;
    if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
      sub_10042D424(v18);
    }
    NSErrorUserInfoKey v29 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v30 = @"Internal observation not enabled.";
    id v16 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    v17 = +[NSError errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v16];
  }

  return v17;
}

- (id)pauseWithSource:(int64_t)a3
{
  return 0;
}

- (void)invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_clientQueue);
  v3.receiver = self;
  v3.super_class = (Class)NIServerSpatialBrowsingSession;
  [(NIServerBaseSession *)&v3 invalidate];
}

- (NISpatialBrowsingConfiguration)configuration
{
  return (NISpatialBrowsingConfiguration *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_containerUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  cntrl = (std::__shared_weak_count *)self->_pbLogger.__cntrl_;
  if (cntrl)
  {
    sub_10001A970(cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  return self;
}

@end