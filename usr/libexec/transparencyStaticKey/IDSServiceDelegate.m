@interface IDSServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (KTIDSSessionHandler)idsTransport;
- (OS_dispatch_queue)xpcQueue;
- selfAccountKey:(id *)a3;
- (id)staticKeyFeatureNotEnabled:(id)a3;
- (void)deleteKTSession:(id)a3 complete:(id)a4;
- (void)getKTSessionByHandle:(id)a3 complete:(id)a4;
- (void)getKTSessionByID:(id)a3 complete:(id)a4;
- (void)listKTSession:(id)a3;
- (void)sasTTR:(id)a3 toHandle:(id)a4 pushToken:(id)a5 complete:(id)a6;
- (void)setIdsTransport:(id)a3;
- (void)setXpcQueue:(id)a3;
- (void)setupKTSession:(id)a3 complete:(id)a4;
@end

@implementation IDSServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [v5 valueForEntitlement:@"com.apple.transparency.kt"];
  unsigned __int8 v7 = [v6 BOOLValue];

  if (v7)
  {
    if (qword_1000A7460 != -1) {
      dispatch_once(&qword_1000A7460, &stru_10008CB38);
    }
    v8 = qword_1000A7468;
    if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Accepting new connection", (uint8_t *)v15, 2u);
    }
    v9 = [(IDSServiceDelegate *)self xpcQueue];
    [v5 _setQueue:v9];

    v10 = +[TransparencyXPCIDSInterface interface];
    [v5 setExportedInterface:v10];

    [v5 setExportedObject:self];
    [v5 resume];
  }
  else
  {
    v11 = [v5 valueForEntitlement:@"application-identifier"];
    if (qword_1000A7460 != -1) {
      dispatch_once(&qword_1000A7460, &stru_10008CB18);
    }
    v12 = (void *)qword_1000A7468;
    if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_ERROR))
    {
      v13 = v12;
      v15[0] = 67109378;
      v15[1] = [v5 processIdentifier];
      __int16 v16 = 2114;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "ids rejecting client %d/[%{public}@] due to lack of entitlement", (uint8_t *)v15, 0x12u);
    }
  }

  return v7;
}

- (id)staticKeyFeatureNotEnabled:(id)a3
{
  return +[TransparencyError errorWithDomain:kTransparencyErrorInternal, -298, @"Feature not enabled: %@", a3 code description];
}

- selfAccountKey:(id *)a3
{
  uint64_t v35 = 0;
  v36 = (id *)&v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_100005024;
  v39 = sub_100005034;
  id v40 = 0;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_100005024;
  v33 = sub_100005034;
  id v34 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10000503C;
  v25[3] = &unk_10008CB88;
  v27 = &v29;
  v28 = &v35;
  v26 = dispatch_semaphore_create(0);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100005188;
  v22[3] = &unk_10008CBB0;
  v24 = &v35;
  v4 = v26;
  v23 = v4;
  +[TransparencyXPCConnection invokeIDSSupportWithBlock:v25 errorHandler:v22];
  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    uint64_t v6 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-321 description:@"timeout getting self public key"];
    id v7 = v36[5];
    v36[5] = (id)v6;

    if (qword_1000A7460 != -1) {
      dispatch_once(&qword_1000A7460, &stru_10008CBD0);
    }
    v8 = qword_1000A7468;
    if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_ERROR))
    {
      id v9 = v36[5];
      *(_DWORD *)buf = 138543362;
      id v42 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Timed out to get account public key: %{public}@", buf, 0xCu);
    }
    if (a3)
    {
      id v10 = v36[5];
      if (v10)
      {
LABEL_8:
        v11 = 0;
        *a3 = v10;
        goto LABEL_20;
      }
    }
    goto LABEL_19;
  }
  uint64_t v12 = v30[5];
  if (!v12)
  {
    if (qword_1000A7460 != -1) {
      dispatch_once(&qword_1000A7460, &stru_10008CBF0);
    }
    v15 = qword_1000A7468;
    if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_ERROR))
    {
      id v16 = v36[5];
      *(_DWORD *)buf = 138543362;
      id v42 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to get account public key: %{public}@", buf, 0xCu);
    }
    if (a3)
    {
      id v10 = v36[5];
      if (v10) {
        goto LABEL_8;
      }
    }
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  v13 = v36;
  id obj = v36[5];
  v11 = +[KTAccountPublicID ktAccountPublicIDWithPublicKeyInfo:v12 error:&obj];
  objc_storeStrong(v13 + 5, obj);
  if (v11)
  {
    id v14 = v11;
  }
  else
  {
    if (qword_1000A7460 != -1) {
      dispatch_once(&qword_1000A7460, &stru_10008CC10);
    }
    v18 = qword_1000A7468;
    if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_ERROR))
    {
      id v19 = v36[5];
      *(_DWORD *)buf = 138543362;
      id v42 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Failed to convert public key: %{public}@", buf, 0xCu);
    }
    if (a3)
    {
      id v20 = v36[5];
      if (v20) {
        *a3 = v20;
      }
    }
  }

LABEL_20:
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);

  return v11;
}

- (void)setupKTSession:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  if (qword_1000A7460 != -1) {
    dispatch_once(&qword_1000A7460, &stru_10008CC30);
  }
  v8 = (void *)qword_1000A7468;
  if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    id v10 = [v6 peer];
    v11 = [v6 lastUsedAddressOfMe];
    *(_DWORD *)buf = 138412546;
    id v25 = v10;
    __int16 v26 = 2112;
    v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setupKTSession to peer: %{mark.hash}@ from: %{mark.hash}@", buf, 0x16u);
  }
  uint64_t v12 = [(IDSServiceDelegate *)self idsTransport];

  if (v12)
  {
    id v23 = 0;
    v13 = [(IDSServiceDelegate *)self selfAccountKey:&v23];
    id v14 = v23;
    if (v13)
    {
      if (qword_1000A7460 != -1) {
        dispatch_once(&qword_1000A7460, &stru_10008CC70);
      }
      v15 = qword_1000A7468;
      if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "setupKTSession got account key: %{public}@", buf, 0xCu);
      }
      id v16 = [v13 publicKeyInfo];
      v17 = [(IDSServiceDelegate *)self idsTransport];
      v18 = [v17 setupMailbox:v6 publicInfo:v16];

      [v18 setStateUpdate:&stru_10008CCB0];
      id v19 = [(IDSServiceDelegate *)self idsTransport];
      [v19 startSession:v18];

      id v20 = [v18 mapMailbox];
      if (qword_1000A7460 != -1) {
        dispatch_once(&qword_1000A7460, &stru_10008CD10);
      }
      v21 = qword_1000A7468;
      if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v25 = v20;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "setupKTSession setup complete: %{public}@", buf, 0xCu);
      }
      v7[2](v7, v20, 0);
    }
    else
    {
      if (qword_1000A7460 != -1) {
        dispatch_once(&qword_1000A7460, &stru_10008CC50);
      }
      v22 = qword_1000A7468;
      if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to convert public key: %{public}@", buf, 0xCu);
      }
      ((void (**)(id, void *, id))v7)[2](v7, 0, v14);
    }
  }
  else
  {
    id v14 = [(IDSServiceDelegate *)self staticKeyFeatureNotEnabled:@"IDS protocol"];
    ((void (**)(id, void *, id))v7)[2](v7, 0, v14);
  }
}

- (void)listKTSession:(id)a3
{
  id v5 = a3;
  id v7 = [(IDSServiceDelegate *)self idsTransport];
  id v6 = [v7 listSessions];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);
}

- (void)deleteKTSession:(id)a3 complete:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v10 = [(IDSServiceDelegate *)self idsTransport];
  id v9 = [v10 deleteSessionByID:v8];

  (*((void (**)(id, id))a4 + 2))(v7, v9);
}

- (void)getKTSessionByHandle:(id)a3 complete:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(IDSServiceDelegate *)self idsTransport];
  id v10 = [v9 findSessionByHandle:v8];

  uint64_t v12 = v10;
  v11 = +[NSArray arrayWithObjects:&v12 count:1];
  (*((void (**)(id, void *))a4 + 2))(v7, v11);
}

- (void)getKTSessionByID:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = [(IDSServiceDelegate *)self idsTransport];
  id v9 = [v8 findSessionByID:v6];

  if (qword_1000A7460 != -1) {
    dispatch_once(&qword_1000A7460, &stru_10008CD30);
  }
  id v10 = qword_1000A7468;
  if (os_log_type_enabled((os_log_t)qword_1000A7468, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138543618;
    id v12 = v6;
    __int16 v13 = 2114;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "getKTSessionByID: %{public}@ found %{public}@", (uint8_t *)&v11, 0x16u);
  }
  v7[2](v7, v9);
}

- (void)sasTTR:(id)a3 toHandle:(id)a4 pushToken:(id)a5 complete:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = (void (**)(id, void))a6;
  if (+[TransparencyAnalytics hasInternalDiagnostics])
  {
    __int16 v13 = [(IDSServiceDelegate *)self idsTransport];
    [v13 sasTTR:v14 toHandle:v10 pushToken:v11];
  }
  v12[2](v12, 0);
}

- (OS_dispatch_queue)xpcQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcQueue:(id)a3
{
}

- (KTIDSSessionHandler)idsTransport
{
  return (KTIDSSessionHandler *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdsTransport:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsTransport, 0);

  objc_storeStrong((id *)&self->_xpcQueue, 0);
}

@end