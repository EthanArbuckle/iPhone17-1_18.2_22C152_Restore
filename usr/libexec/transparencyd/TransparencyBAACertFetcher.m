@interface TransparencyBAACertFetcher
- (BOOL)outstandingRemoteFetchSignal;
- (KTNearFutureScheduler)BAACertFetcher;
- (OS_dispatch_group)issuanceGroup;
- (OS_dispatch_queue)issuanceQueue;
- (OS_dispatch_workloop)workloop;
- (TransparencyBAACertFetcher)initWithWorkloop:(id)a3;
- (int64_t)getBAAValidity;
- (void)dealloc;
- (void)deviceIdentityIssuerCert:(id)a3 completionHandler:(id)a4;
- (void)fetchCacheOnly:(BOOL)a3 completion:(id)a4;
- (void)getDeviceCertWithForcedFetch:(BOOL)a3 completionHandler:(id)a4;
- (void)setBAACertFetcher:(id)a3;
- (void)setIssuanceGroup:(id)a3;
- (void)setIssuanceQueue:(id)a3;
- (void)setOutstandingRemoteFetchSignal:(BOOL)a3;
- (void)setWorkloop:(id)a3;
- (void)triggerRemoteBAACertFetch;
@end

@implementation TransparencyBAACertFetcher

- (TransparencyBAACertFetcher)initWithWorkloop:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TransparencyBAACertFetcher;
  v5 = [(TransparencyBAACertFetcher *)&v19 init];
  if (v5)
  {
    id location = 0;
    objc_initWeak(&location, v5);
    v6 = [KTNearFutureScheduler alloc];
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_100214CDC;
    v16 = &unk_1002B72D8;
    objc_copyWeak(&v17, &location);
    v7 = [(KTNearFutureScheduler *)v6 initWithName:@"BAACertFetch" initialDelay:2000000000 exponentialBackoff:7200000000000 maximumDelay:0 keepProcessAlive:0 dependencyDescriptionCode:&v13 block:2.0];
    -[TransparencyBAACertFetcher setBAACertFetcher:](v5, "setBAACertFetcher:", v7, v13, v14, v15, v16);

    [(TransparencyBAACertFetcher *)v5 setWorkloop:v4];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.transparency.deviceCertIssuanceQueue", v8);
    [(TransparencyBAACertFetcher *)v5 setIssuanceQueue:v9];

    dispatch_group_t v10 = dispatch_group_create();
    [(TransparencyBAACertFetcher *)v5 setIssuanceGroup:v10];

    v11 = v5;
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)deviceIdentityIssuerCert:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_100214E5C;
  v10[4] = sub_100214E6C;
  id v11 = 0;
  id v11 = (id)os_transaction_create();
  v8 = [(TransparencyBAACertFetcher *)self workloop];
  id v9 = v7;
  DeviceIdentityIssueClientCertificateWithCompletion();

  _Block_object_dispose(v10, 8);
}

- (int64_t)getBAAValidity
{
  uint64_t v2 = kKTMaxBAACertTTLInMinutes;
  return v2 - arc4random_uniform(kKTBAACertTTLMaxTTLOffsetInMinutes);
}

- (void)fetchCacheOnly:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(TransparencyBAACertFetcher *)self issuanceGroup];
  objc_sync_enter(v7);
  if ([(TransparencyBAACertFetcher *)self outstandingRemoteFetchSignal])
  {
    if (qword_10032F408 != -1) {
      dispatch_once(&qword_10032F408, &stru_1002CA700);
    }
    v8 = qword_10032F410;
    if (os_log_type_enabled((os_log_t)qword_10032F410, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "An existing remote cert fetch is in progress. Waiting for that to finish.", buf, 2u);
    }
    id v9 = [(TransparencyBAACertFetcher *)self issuanceGroup];
    dispatch_group_t v10 = [(TransparencyBAACertFetcher *)self issuanceQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002153C4;
    block[3] = &unk_1002BA140;
    block[4] = self;
    id v23 = v6;
    id v11 = v6;
    dispatch_group_notify(v9, v10, block);

    objc_sync_exit(v7);
  }
  else
  {
    objc_sync_exit(v7);

    if (a3)
    {
      v12 = &kMAOptionsBAASkipNetworkRequest;
    }
    else
    {
      v13 = [(TransparencyBAACertFetcher *)self issuanceGroup];
      objc_sync_enter(v13);
      uint64_t v14 = [(TransparencyBAACertFetcher *)self issuanceGroup];
      dispatch_group_enter(v14);

      [(TransparencyBAACertFetcher *)self setOutstandingRemoteFetchSignal:1];
      objc_sync_exit(v13);

      v12 = &kMAOptionsBAAIgnoreExistingKeychainItems;
    }
    v27[0] = kTransparencyBAACertKeychainLabelKey;
    v26[0] = kMAOptionsBAAKeychainLabel;
    v26[1] = kMAOptionsBAAValidity;
    v15 = +[NSNumber numberWithLongLong:[(TransparencyBAACertFetcher *)self getBAAValidity]];
    v27[1] = v15;
    v27[2] = kTransparencyBAACertKeychainAccessGroup;
    v26[2] = kMAOptionsBAAKeychainAccessGroup;
    v26[3] = kMAOptionsBAAOIDSToInclude;
    v25[0] = kMAOptionsBAAOIDUCRTDeviceIdentifiers;
    v25[1] = kMAOptionsBAAOIDDeviceOSInformation;
    v16 = +[NSArray arrayWithObjects:v25 count:2];
    v27[3] = v16;
    v26[4] = kMAOptionsUseSoftwareGeneratedKey;
    v27[4] = &__kCFBooleanTrue;
    id v17 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:5];
    id v7 = [v17 mutableCopy];

    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:*v12];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1002153D4;
    v19[3] = &unk_1002CA728;
    BOOL v21 = a3;
    v19[4] = self;
    id v20 = v6;
    id v18 = v6;
    [(TransparencyBAACertFetcher *)self deviceIdentityIssuerCert:v7 completionHandler:v19];
  }
}

- (void)triggerRemoteBAACertFetch
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100215508;
  v2[3] = &unk_1002CA770;
  v2[4] = self;
  [(TransparencyBAACertFetcher *)self fetchCacheOnly:0 completion:v2];
}

- (void)getDeviceCertWithForcedFetch:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10021571C;
  v6[3] = &unk_1002C9C28;
  id v7 = self;
  id v8 = a4;
  id v5 = v8;
  [(TransparencyBAACertFetcher *)v7 fetchCacheOnly:!v4 completion:v6];
}

- (void)dealloc
{
  v3 = [(TransparencyBAACertFetcher *)self BAACertFetcher];
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)TransparencyBAACertFetcher;
  [(TransparencyBAACertFetcher *)&v4 dealloc];
}

- (KTNearFutureScheduler)BAACertFetcher
{
  return (KTNearFutureScheduler *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBAACertFetcher:(id)a3
{
}

- (OS_dispatch_workloop)workloop
{
  return (OS_dispatch_workloop *)objc_getProperty(self, a2, 24, 1);
}

- (void)setWorkloop:(id)a3
{
}

- (OS_dispatch_group)issuanceGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIssuanceGroup:(id)a3
{
}

- (OS_dispatch_queue)issuanceQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIssuanceQueue:(id)a3
{
}

- (BOOL)outstandingRemoteFetchSignal
{
  return self->_outstandingRemoteFetchSignal;
}

- (void)setOutstandingRemoteFetchSignal:(BOOL)a3
{
  self->_outstandingRemoteFetchSignal = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuanceQueue, 0);
  objc_storeStrong((id *)&self->_issuanceGroup, 0);
  objc_storeStrong((id *)&self->_workloop, 0);

  objc_storeStrong((id *)&self->_BAACertFetcher, 0);
}

@end