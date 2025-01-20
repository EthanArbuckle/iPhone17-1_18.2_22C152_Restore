@interface FMDSecureLocationPublisher
- (BOOL)publishPreviouslyReceivedLocation;
- (BOOL)startedPublishing;
- (FMDSecureLocationConfig)config;
- (FMDSecureLocationInfo)lastPublishedLocation;
- (FMDSecureLocationInfo)lastPublishedVisit;
- (FMDSecureLocationInfo)lastReceivedLocation;
- (FMDSecureLocationPublisher)initWithConfiguration:(id)a3;
- (OS_dispatch_queue)publishQueue;
- (OS_dispatch_queue)serialQueue;
- (id)_persistedLastPublishedTimestamp;
- (id)criteriaMetBlock;
- (id)publishingBlock;
- (void)_persistLastPublishedTimestamp:(id)a3;
- (void)_publishResultLocation:(id)a3;
- (void)processUpdatedLocation:(id)a3;
- (void)publishCriteriaMetBlock:(id)a3;
- (void)setConfig:(id)a3;
- (void)setCriteriaMetBlock:(id)a3;
- (void)setLastPublishedLocation:(id)a3;
- (void)setLastPublishedVisit:(id)a3;
- (void)setLastReceivedLocation:(id)a3;
- (void)setPublishQueue:(id)a3;
- (void)setPublishingBlock:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setStartedPublishing:(BOOL)a3;
- (void)startPublisherWithBlock:(id)a3;
@end

@implementation FMDSecureLocationPublisher

- (FMDSecureLocationPublisher)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FMDSecureLocationPublisher;
  v6 = [(FMDSecureLocationPublisher *)&v12 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.findmydevice.locationPublisherQueue", 0);
    serialQueue = v6->_serialQueue;
    v6->_serialQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.findmydevice.publishingBlockQueue", 0);
    publishQueue = v6->_publishQueue;
    v6->_publishQueue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v6->_config, a3);
  }

  return v6;
}

- (void)startPublisherWithBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(FMDSecureLocationPublisher *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B16F8;
  block[3] = &unk_1002D9DD0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)publishCriteriaMetBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(FMDSecureLocationPublisher *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B1848;
  block[3] = &unk_1002D9DD0;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)processUpdatedLocation:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(FMDSecureLocationPublisher *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B198C;
  block[3] = &unk_1002D9238;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (BOOL)publishPreviouslyReceivedLocation
{
  v2 = self;
  uint64_t v6 = 0;
  dispatch_queue_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(FMDSecureLocationPublisher *)self serialQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000B2384;
  v5[3] = &unk_1002DA4D0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)_publishResultLocation:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDSecureLocationPublisher *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = +[FMNetworkMonitor sharedInstance];
  unsigned int v7 = [v6 isMonitoring];

  if (v7)
  {
    uint64_t v8 = +[FMNetworkMonitor sharedInstance];
    unsigned __int8 v9 = [v8 isNetworkUp];

    if ((v9 & 1) == 0)
    {
      v10 = sub_1000599A8();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "SecureLocationPublisher: network is not up. lets keep location, not publish it", buf, 2u);
      }

      [(FMDSecureLocationPublisher *)self setLastReceivedLocation:v4];
      goto LABEL_14;
    }
  }
  else
  {
    v11 = sub_1000599A8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "SecureLocationPublisher: we are not monitoring network. lets publish and try", buf, 2u);
    }
  }
  [(FMDSecureLocationPublisher *)self setLastPublishedLocation:v4];
  objc_super v12 = [(FMDSecureLocationPublisher *)self publishingBlock];
  if (v12)
  {
    v13 = [(FMDSecureLocationPublisher *)self publishQueue];
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_1000B27EC;
    v21 = &unk_1002D97B0;
    v23 = v12;
    id v14 = v4;
    id v22 = v14;
    dispatch_async(v13, &v18);

    v15 = [v14 locationInfo:v18, v19, v20, v21];
    v16 = [v15 timestamp];
    [(FMDSecureLocationPublisher *)self _persistLastPublishedTimestamp:v16];

    [(FMDSecureLocationPublisher *)self setLastReceivedLocation:0];
    v17 = v23;
  }
  else
  {
    v17 = sub_1000599A8();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SecureLocationPublisher: no publish block to send locations to", buf, 2u);
    }
  }

LABEL_14:
}

- (id)_persistedLastPublishedTimestamp
{
  v2 = [(FMDSecureLocationPublisher *)self serialQueue];
  dispatch_assert_queue_V2(v2);

  v3 = +[FMPreferencesUtil objectForKey:@"secureLocationsLastPublishedTimestamp" inDomain:kFMDNotBackedUpPrefDomain];
  id v4 = v3;
  if (v3)
  {
    [v3 doubleValue];
    id v5 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_persistLastPublishedTimestamp:(id)a3
{
  id v4 = a3;
  id v5 = [(FMDSecureLocationPublisher *)self serialQueue];
  dispatch_assert_queue_V2(v5);

  if (v4)
  {
    [v4 timeIntervalSince1970];
    uint64_t v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    +[FMPreferencesUtil setObject:v6 forKey:@"secureLocationsLastPublishedTimestamp" inDomain:kFMDNotBackedUpPrefDomain];
  }
  unsigned int v7 = sub_1000599A8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SecureLocationPublisher: Persisted lastPublished %@", (uint8_t *)&v8, 0xCu);
  }
}

- (FMDSecureLocationConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (id)publishingBlock
{
  return self->_publishingBlock;
}

- (void)setPublishingBlock:(id)a3
{
}

- (BOOL)startedPublishing
{
  return self->_startedPublishing;
}

- (void)setStartedPublishing:(BOOL)a3
{
  self->_startedPublishing = a3;
}

- (FMDSecureLocationInfo)lastPublishedLocation
{
  return self->_lastPublishedLocation;
}

- (void)setLastPublishedLocation:(id)a3
{
}

- (FMDSecureLocationInfo)lastPublishedVisit
{
  return self->_lastPublishedVisit;
}

- (void)setLastPublishedVisit:(id)a3
{
}

- (FMDSecureLocationInfo)lastReceivedLocation
{
  return self->_lastReceivedLocation;
}

- (void)setLastReceivedLocation:(id)a3
{
}

- (id)criteriaMetBlock
{
  return self->_criteriaMetBlock;
}

- (void)setCriteriaMetBlock:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (OS_dispatch_queue)publishQueue
{
  return self->_publishQueue;
}

- (void)setPublishQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publishQueue, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong(&self->_criteriaMetBlock, 0);
  objc_storeStrong((id *)&self->_lastReceivedLocation, 0);
  objc_storeStrong((id *)&self->_lastPublishedVisit, 0);
  objc_storeStrong((id *)&self->_lastPublishedLocation, 0);
  objc_storeStrong(&self->_publishingBlock, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end