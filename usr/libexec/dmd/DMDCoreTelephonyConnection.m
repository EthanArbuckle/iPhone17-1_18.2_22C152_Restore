@interface DMDCoreTelephonyConnection
- (DMDCoreTelephonyConnection)init;
- (void)dealloc;
- (void)fetchCachedVinylInfoWithCompletion:(id)a3;
- (void)refreshCellularPlansWithCSN:(id)a3 serverURL:(id)a4 completion:(id)a5;
@end

@implementation DMDCoreTelephonyConnection

- (DMDCoreTelephonyConnection)init
{
  v4.receiver = self;
  v4.super_class = (Class)DMDCoreTelephonyConnection;
  v2 = [(DMDCoreTelephonyConnection *)&v4 init];
  if (v2) {
    v2->ctConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();
  }
  return v2;
}

- (void)dealloc
{
  ctConnection = self->ctConnection;
  if (ctConnection)
  {
    CFRelease(ctConnection);
    self->ctConnection = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)DMDCoreTelephonyConnection;
  [(DMDCoreTelephonyConnection *)&v4 dealloc];
}

- (void)fetchCachedVinylInfoWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void (**)(void, void, void))v4;
  if (self->ctConnection)
  {
    id v6 = v4;
    v14 = v6;
    uint64_t CachedVinylInfo = _CTServerConnectionStandaloneGetCachedVinylInfo();
    if (HIDWORD(CachedVinylInfo))
    {
      uint64_t v8 = CachedVinylInfo;
      v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", _NSConcreteStackBlock, 3221225472, sub_100038DA0, &unk_1000CAD60, v6, DMFCoreTelephonyErrorCodeKey);
      v16[0] = v9;
      v15[1] = DMFCoreTelephonyErrorDomainKey;
      v10 = +[NSNumber numberWithInt:v8];
      v16[1] = v10;
      v11 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000831D8();
      }
      v12 = DMFErrorWithCodeAndUserInfo();
      (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v12);
    }
    else
    {
      _CTServerConnectionSendBarrier();
    }
  }
  else
  {
    v13 = DMFErrorWithCodeAndUserInfo();
    ((void (**)(void, void, void *))v5)[2](v5, 0, v13);
  }
}

- (void)refreshCellularPlansWithCSN:(id)a3 serverURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = [a4 absoluteString];
  if (self->ctConnection)
  {
    id v11 = v9;
    v19 = v11;
    uint64_t v12 = _CTServerConnectionStandaloneDownloadProfile();
    if (HIDWORD(v12))
    {
      uint64_t v13 = v12;
      v14 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", _NSConcreteStackBlock, 3221225472, sub_100039078, &unk_1000CAD88, v11, DMFCoreTelephonyErrorCodeKey);
      v21[0] = v14;
      v20[1] = DMFCoreTelephonyErrorDomainKey;
      v15 = +[NSNumber numberWithInt:v13];
      v21[1] = v15;
      v16 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_1000832D8();
      }
      v17 = DMFErrorWithCodeAndUserInfo();
      (*((void (**)(id, void *))v11 + 2))(v11, v17);
    }
    else
    {
      _CTServerConnectionSendBarrier();
    }
  }
  else
  {
    v18 = DMFErrorWithCodeAndUserInfo();
    (*((void (**)(id, void *))v9 + 2))(v9, v18);
  }
}

@end