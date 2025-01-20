@interface TrafficIncidentAuthenticationManager
+ (id)sharedInstance;
- (BOOL)_isUUIDValid;
- (BOOL)isSupported;
- (TrafficIncidentAuthenticationManager)init;
- (id)_clientDataHash;
- (id)_keyId;
- (id)_storedUUID;
- (void)_attestKeyId:(id)a3 completionHandler:(id)a4;
- (void)_generateAssertionKeyId:(id)a3 completionHandler:(id)a4;
- (void)_generateKey:(id)a3;
- (void)_incrementSubmissionCount;
- (void)_refreshStoredUUID;
- (void)_rollOverKeyId:(id)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)generateAuthenticationInfoWithCompletionHandler:(id)a3;
- (void)rolloverAnonymousId;
- (void)submissionDidFailAttestation;
@end

@implementation TrafficIncidentAuthenticationManager

- (TrafficIncidentAuthenticationManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)TrafficIncidentAuthenticationManager;
  v2 = [(TrafficIncidentAuthenticationManager *)&v10 init];
  if (v2)
  {
    v3 = +[UIApplication sharedMapsDelegate];
    v4 = dispatch_get_global_queue(2, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100017528;
    v7[3] = &unk_1012E5D58;
    v8 = v2;
    id v9 = v3;
    id v5 = v3;
    dispatch_async(v4, v7);
  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_101610168 != -1) {
    dispatch_once(&qword_101610168, &stru_101303690);
  }
  v2 = (void *)qword_101610160;

  return v2;
}

- (void)dealloc
{
  v3 = +[UIApplication sharedMapsDelegate];
  v4 = [v3 submissionManager];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentAuthenticationManager;
  [(TrafficIncidentAuthenticationManager *)&v5 dealloc];
}

- (void)generateAuthenticationInfoWithCompletionHandler:(id)a3
{
  id v11 = a3;
  if ([(TrafficIncidentAuthenticationManager *)self isSupported])
  {
    v4 = +[NSUserDefaults standardUserDefaults];
    objc_super v5 = [v4 objectForKey:@"TrafficIncidentAuthenicationInfo"];
    v6 = [v5 objectForKey:@"TrafficIncidentAuthenicationKeyId"];
    v7 = [v5 objectForKey:@"TrafficIncidentAuthenicationAttested"];

    [(TrafficIncidentAuthenticationManager *)self _incrementSubmissionCount];
    unsigned int v8 = [(TrafficIncidentAuthenticationManager *)self _isUUIDValid];
    if (v5 && v6)
    {
      if (v7) {
        unsigned int v9 = 0;
      }
      else {
        unsigned int v9 = v8;
      }
      if (v9 == 1)
      {
        [(TrafficIncidentAuthenticationManager *)self _attestKeyId:v6 completionHandler:v11];
      }
      else if (!v7 || ((v8 ^ 1) & 1) != 0)
      {
        if ((v8 & 1) == 0) {
          [(TrafficIncidentAuthenticationManager *)self _rollOverKeyId:v6 completionHandler:v11];
        }
      }
      else
      {
        [(TrafficIncidentAuthenticationManager *)self _generateAssertionKeyId:v6 completionHandler:v11];
      }
    }
    else
    {
      [(TrafficIncidentAuthenticationManager *)self _generateKey:v11];
    }
  }
  else
  {
    objc_super v10 = v11;
    if (!v11) {
      goto LABEL_14;
    }
    (*((void (**)(id, void))v11 + 2))(v11, 0);
  }
  objc_super v10 = v11;
LABEL_14:
}

- (void)rolloverAnonymousId
{
  v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setObject:0 forKey:@"TrafficIncidentAuthenicationInfo"];

  [(TrafficIncidentAuthenticationManager *)self _refreshStoredUUID];
}

- (void)_generateKey:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_100576E2C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TrafficIncidentAuthenticationManager: _generateKey:", buf, 2u);
  }

  v6 = +[DCAppAttestService sharedService];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100967F2C;
  v8[3] = &unk_1013036B8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 generateKeyWithCompletionHandler:v8];
}

- (void)_attestKeyId:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = sub_100576E2C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "TrafficIncidentAuthenticationManager: _attestKeyId:", buf, 2u);
  }

  id v9 = [(TrafficIncidentAuthenticationManager *)self _clientDataHash];
  objc_super v10 = +[DCAppAttestService sharedService];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100968230;
  v13[3] = &unk_1013036E0;
  v15 = self;
  id v16 = v7;
  id v14 = v6;
  id v11 = v6;
  id v12 = v7;
  [v10 attestKey:v11 clientDataHash:v9 completionHandler:v13];
}

- (void)_generateAssertionKeyId:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = sub_100576E2C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "TrafficIncidentAuthenticationManager: _generateAssertionKeyId:", buf, 2u);
  }

  id v9 = [(TrafficIncidentAuthenticationManager *)self _clientDataHash];
  objc_super v10 = +[DCAppAttestService sharedService];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100968614;
  v12[3] = &unk_1012E5F00;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v10 generateAssertion:v7 clientDataHash:v9 completionHandler:v12];
}

- (void)_rollOverKeyId:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = sub_100576E2C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "TrafficIncidentAuthenticationManager: _rollOverKeyId:", buf, 2u);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1009688FC;
  v10[3] = &unk_101303708;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(TrafficIncidentAuthenticationManager *)self _generateAssertionKeyId:v7 completionHandler:v10];
}

- (void)_refreshStoredUUID
{
  v2 = +[NSUUID UUID];
  v3 = [v2 UUIDString];

  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setObject:v3 forKey:@"TrafficIncidentAuthenicationUUID"];
  [v4 setInteger:0 forKey:@"TrafficIncidentAuthenicationSubmissionCount"];
  [v4 setDouble:@"TrafficIncidentAuthenicationRolloverTimestamp" forKey:CFAbsoluteTimeGetCurrent()];
  objc_super v5 = sub_100576E2C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TrafficIncidentAuthenticationManager: did refreshStoredUUID", v6, 2u);
  }
}

- (void)_incrementSubmissionCount
{
  id v2 = objc_alloc_init((Class)NSUserDefaults);
  v3 = (char *)[v2 integerForKey:@"TrafficIncidentAuthenicationSubmissionCount"];

  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setInteger:v3 + 1 forKey:@"TrafficIncidentAuthenicationSubmissionCount"];
}

- (id)_storedUUID
{
  id v2 = objc_alloc_init((Class)NSUserDefaults);
  v3 = [v2 objectForKey:@"TrafficIncidentAuthenicationUUID"];

  return v3;
}

- (BOOL)_isUUIDValid
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"TrafficIncidentAuthenicationUUID"];
  [v2 doubleForKey:@"TrafficIncidentAuthenicationRolloverTimestamp"];
  double v5 = v4;
  double Current = CFAbsoluteTimeGetCurrent();
  if (v3)
  {
    double v7 = Current - v5;
    GEOConfigGetDouble();
    if (v7 >= v8)
    {
      id v10 = [v2 integerForKey:@"TrafficIncidentAuthenicationSubmissionCount"];
      BOOL v9 = (uint64_t)v10 <= GEOConfigGetUInteger();
    }
    else
    {
      BOOL v9 = 1;
    }
  }
  else
  {
    [v2 integerForKey:@"TrafficIncidentAuthenicationSubmissionCount" Current];
    BOOL v9 = 0;
  }

  return v9;
}

- (id)_keyId
{
  id v2 = +[NSUserDefaults standardUserDefaults];
  v3 = [v2 objectForKey:@"TrafficIncidentAuthenicationInfo"];
  double v4 = [v3 objectForKey:@"TrafficIncidentAuthenicationKeyId"];

  return v4;
}

- (id)_clientDataHash
{
  id v2 = [(TrafficIncidentAuthenticationManager *)self _storedUUID];
  v3 = +[NSMutableData dataWithLength:32];
  id v4 = v2;
  double v5 = (const char *)[v4 cStringUsingEncoding:1];
  id v6 = +[NSData dataWithBytes:v5 length:strlen(v5)];
  id v7 = [v6 bytes];
  CC_LONG v8 = [v6 length];
  id v9 = v3;
  CC_SHA256(v7, v8, (unsigned __int8 *)[v9 mutableBytes]);

  return v9;
}

- (void)submissionDidFailAttestation
{
  v3 = sub_100576E2C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "TrafficIncidentAuthenticationManager: submissionDidFailAttestation", v5, 2u);
  }

  [(TrafficIncidentAuthenticationManager *)self rolloverAnonymousId];
  id v4 = +[TrafficIncidentsStorageManager sharedInstance];
  [v4 resubmitLastReport];
}

- (BOOL)isSupported
{
  return self->_supported;
}

@end