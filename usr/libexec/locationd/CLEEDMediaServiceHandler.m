@interface CLEEDMediaServiceHandler
- (CLEEDMediaServiceHandler)initWithUniverse:(id)a3 serviceCompletionCB:(id)a4 getMitigationCB:(id)a5 getUploadConfigCB:(id)a6 errorCB:(id)a7;
- (void)cleanup;
- (void)connectToMediaService;
- (void)dealloc;
- (void)handleRemoteProxyError:(id)a3 forProcessIdentifier:(int)a4;
- (void)notifyProcessingCompletion;
- (void)processMediaEndOfExtendedSessionNotification;
- (void)processMediaForMitigations:(id)a3;
- (void)processMediaForRequestID:(id)a3 callUUID:(id)a4 uploadURL:(id)a5 sharedInfoPrefix:(id)a6 combinedSecret:(id)a7 token:(id)a8 mediaList:(id)a9 mitigation:(id)a10 completion:(id)a11;
@end

@implementation CLEEDMediaServiceHandler

- (CLEEDMediaServiceHandler)initWithUniverse:(id)a3 serviceCompletionCB:(id)a4 getMitigationCB:(id)a5 getUploadConfigCB:(id)a6 errorCB:(id)a7
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_102325638);
  }
  v13 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136447234;
    v30 = "-[CLEEDMediaServiceHandler initWithUniverse:serviceCompletionCB:getMitigationCB:getUploadConfigCB:errorCB:]";
    __int16 v31 = 2114;
    id v32 = a3;
    __int16 v33 = 2114;
    id v34 = a4;
    __int16 v35 = 2114;
    id v36 = a7;
    __int16 v37 = 2114;
    id v38 = a5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s[universe:%{public}@,serviceCompletionCB:%{public}@,errorCB:%{public}@,getMitigationCB:%{public}@]", buf, 0x34u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_102325638);
    }
    int v19 = 136447234;
    v20 = "-[CLEEDMediaServiceHandler initWithUniverse:serviceCompletionCB:getMitigationCB:getUploadConfigCB:errorCB:]";
    __int16 v21 = 2114;
    id v22 = a3;
    __int16 v23 = 2114;
    id v24 = a4;
    __int16 v25 = 2114;
    id v26 = a7;
    __int16 v27 = 2114;
    id v28 = a5;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler initWithUniverse:serviceCompletionCB:getMitigationCB:getUploadConfigCB:errorCB:]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)CLEEDMediaServiceHandler;
  v14 = [(CLEEDMediaServiceHandler *)&v18 init];
  v15 = v14;
  if (v14)
  {
    v14->fUniverse = (CLIntersiloUniverse *)a3;
    dispatch_assert_queue_V2((dispatch_queue_t)[objc_msgSend(objc_msgSend(a3, "silo"), "queue")]);
    v15->fConnection = 0;
    v15->fCompletionCallback = _Block_copy(a4);
    v15->fErrorCallback = _Block_copy(a7);
    v15->fGetMitigationCallback = _Block_copy(a5);
    v15->fGetUploadConfigCallback = _Block_copy(a6);
    [(CLEEDMediaServiceHandler *)v15 connectToMediaService];
  }
  return v15;
}

- (void)dealloc
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_102325638);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v14 = "-[CLEEDMediaServiceHandler dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_102325638);
    }
    int v11 = 136446210;
    v12 = "-[CLEEDMediaServiceHandler dealloc]";
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler dealloc]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  fConnection = self->fConnection;
  if (fConnection)
  {

    self->fConnection = 0;
  }
  id fCompletionCallback = self->fCompletionCallback;
  if (fCompletionCallback)
  {
    _Block_release(fCompletionCallback);
    self->id fCompletionCallback = 0;
  }
  id fErrorCallback = self->fErrorCallback;
  if (fErrorCallback)
  {
    _Block_release(fErrorCallback);
    self->id fErrorCallback = 0;
  }
  id fGetMitigationCallback = self->fGetMitigationCallback;
  if (fGetMitigationCallback)
  {
    _Block_release(fGetMitigationCallback);
    self->id fGetMitigationCallback = 0;
  }
  id fGetUploadConfigCallback = self->fGetUploadConfigCallback;
  if (fGetUploadConfigCallback)
  {
    _Block_release(fGetUploadConfigCallback);
    self->id fGetUploadConfigCallback = 0;
  }
  self->fUniverse = 0;
  v10.receiver = self;
  v10.super_class = (Class)CLEEDMediaServiceHandler;
  [(CLEEDMediaServiceHandler *)&v10 dealloc];
}

- (void)connectToMediaService
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_102325638);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v20 = "-[CLEEDMediaServiceHandler connectToMediaService]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_102325638);
    }
    int v17 = 136446210;
    objc_super v18 = "-[CLEEDMediaServiceHandler connectToMediaService]";
    objc_super v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler connectToMediaService]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  if (qword_102487A78 != -1) {
    dispatch_once(&qword_102487A78, &stru_1023255D0);
  }
  if (!self->fConnection)
  {
    v4 = (NSXPCConnection *)[objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.corelocation.eedmediaservice"];
    self->fConnection = v4;
    [(NSXPCConnection *)v4 setRemoteObjectInterface:qword_102487A68];
    [(NSXPCConnection *)self->fConnection setExportedInterface:qword_102487A70];
    [(NSXPCConnection *)self->fConnection setExportedObject:self];
    -[NSXPCConnection _setQueue:](self->fConnection, "_setQueue:[CLIntersiloUniverse silo](self->fUniverse, "silo") queue");
    [(NSXPCConnection *)self->fConnection setInvalidationHandler:&stru_1023255F0];
    objc_initWeak(&location, self);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_101427750;
    v14[3] = &unk_102325618;
    objc_copyWeak(&v15, &location);
    v14[4] = self;
    [(NSXPCConnection *)self->fConnection setInterruptionHandler:v14];
    [(NSXPCConnection *)self->fConnection activate];
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_102325638);
    }
    v5 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v20 = "-[CLEEDMediaServiceHandler connectToMediaService]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, connection to EEDMediaService configured", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_102325638);
      }
      int v17 = 136446210;
      objc_super v18 = "-[CLEEDMediaServiceHandler connectToMediaService]";
      int v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler connectToMediaService]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    uint64_t v6 = (*((uint64_t (**)(void))self->fGetMitigationCallback + 2))();
    uint64_t v7 = (*((uint64_t (**)(void))self->fGetUploadConfigCallback + 2))();
    fConnection = self->fConnection;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_101427B44;
    v13[3] = &unk_1022B8750;
    v13[4] = self;
    [[-[NSXPCConnection remoteObjectProxyWithErrorHandler:](fConnection, "remoteObjectProxyWithErrorHandler:", v13) connectToMediaService:v6 uploadConfig:v7];
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_102325638);
    }
    v9 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v20 = "-[CLEEDMediaServiceHandler connectToMediaService]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, establishing connection to EEDMediaService", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_102325638);
      }
      int v17 = 136446210;
      objc_super v18 = "-[CLEEDMediaServiceHandler connectToMediaService]";
      v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler connectToMediaService]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)handleRemoteProxyError:(id)a3 forProcessIdentifier:(int)a4
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_102325638);
  }
  uint64_t v7 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136446978;
    int v11 = "-[CLEEDMediaServiceHandler handleRemoteProxyError:forProcessIdentifier:]";
    __int16 v12 = 1026;
    int v13 = a4;
    __int16 v14 = 2114;
    id v15 = [a3 localizedDescription];
    __int16 v16 = 2114;
    id v17 = [a3 localizedFailureReason];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s[%{public}d]: %{public}@ %{public}@\n", buf, 0x26u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_102325638);
    }
    [a3 localizedDescription];
    [a3 localizedFailureReason];
    v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDMediaServiceHandler handleRemoteProxyError:forProcessIdentifier:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  id fErrorCallback = (void (**)(id, id))self->fErrorCallback;
  if (fErrorCallback) {
    fErrorCallback[2](fErrorCallback, a3);
  }
}

- (void)cleanup
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_102325638);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    objc_super v10 = "-[CLEEDMediaServiceHandler cleanup]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_102325638);
    }
    uint64_t v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler cleanup]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  fConnection = self->fConnection;
  if (fConnection)
  {
    [(NSXPCConnection *)fConnection invalidate];
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_102325638);
    }
    v5 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = self->fConnection;
      *(_DWORD *)buf = 136446466;
      objc_super v10 = "-[CLEEDMediaServiceHandler cleanup]";
      __int16 v11 = 2114;
      __int16 v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, client[%{public}@] disconnected from EEDMediaService", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_102325638);
      }
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler cleanup]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)processMediaForRequestID:(id)a3 callUUID:(id)a4 uploadURL:(id)a5 sharedInfoPrefix:(id)a6 combinedSecret:(id)a7 token:(id)a8 mediaList:(id)a9 mitigation:(id)a10 completion:(id)a11
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_102325638);
  }
  id v15 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136448259;
    v44 = "-[CLEEDMediaServiceHandler processMediaForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:m"
          "ediaList:mitigation:completion:]";
    __int16 v45 = 2114;
    id v46 = a3;
    __int16 v47 = 2114;
    id v48 = a4;
    __int16 v49 = 2114;
    id v50 = a5;
    __int16 v51 = 2113;
    id v52 = a6;
    __int16 v53 = 2113;
    id v54 = a7;
    __int16 v55 = 2113;
    id v56 = a8;
    __int16 v57 = 2114;
    id v58 = a10;
    __int16 v59 = 2114;
    id v60 = a9;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, requestID:%{public}@, callUUID:%{public}@, url:%{public}@, prefix:%{private}@, combinedsecret:%{private}@, token:%{private}@, mitigation:%{public}@, mediaList:%{public}@", buf, 0x5Cu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_102325638);
    }
    int v25 = 136448259;
    id v26 = "-[CLEEDMediaServiceHandler processMediaForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:m"
          "ediaList:mitigation:completion:]";
    __int16 v27 = 2114;
    id v28 = a3;
    __int16 v29 = 2114;
    id v30 = a4;
    __int16 v31 = 2114;
    id v32 = a5;
    __int16 v33 = 2113;
    id v34 = a6;
    __int16 v35 = 2113;
    id v36 = a7;
    __int16 v37 = 2113;
    id v38 = a8;
    __int16 v39 = 2114;
    id v40 = a10;
    __int16 v41 = 2114;
    id v42 = a9;
    id v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler processMediaForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:mediaList:mitigation:completion:]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
  fConnection = self->fConnection;
  if (!fConnection)
  {
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    CFStringRef v24 = @"No valid connection";
    [objc_alloc((Class)NSError) initWithDomain:@"com.apple.locationd.CLEEDMediaServiceHandler" code:8 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1)];
    fConnection = self->fConnection;
  }
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1014284D0;
  v22[3] = &unk_1022B8750;
  v22[4] = self;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_101428518;
  v21[3] = &unk_1022C7578;
  v21[4] = a11;
  [[-[NSXPCConnection remoteObjectProxyWithErrorHandler:](fConnection, "remoteObjectProxyWithErrorHandler:", v22) processMediaServicesForRequestID:callUUID:uploadURL:sharedInfoPrefix:combinedSecret:token:mediaList:mitigation:completion:a3, a4, a5, a6, a7, a8, a9, a10, v21];
}

- (void)notifyProcessingCompletion
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_102325638);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v7 = "-[CLEEDMediaServiceHandler notifyProcessingCompletion]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_102325638);
    }
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler notifyProcessingCompletion]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  id fCompletionCallback = (void (**)(void))self->fCompletionCallback;
  if (fCompletionCallback) {
    fCompletionCallback[2]();
  }
}

- (void)processMediaForMitigations:(id)a3
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_102325638);
  }
  v5 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    __int16 v16 = "-[CLEEDMediaServiceHandler processMediaForMitigations:]";
    __int16 v17 = 2114;
    id v18 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, mitigation:%{public}@", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_102325638);
    }
    int v11 = 136446466;
    __int16 v12 = "-[CLEEDMediaServiceHandler processMediaForMitigations:]";
    __int16 v13 = 2114;
    id v14 = a3;
    v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler processMediaForMitigations:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  fConnection = self->fConnection;
  if (fConnection)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_101428C58;
    v10[3] = &unk_1022B8750;
    v10[4] = self;
    [[-[NSXPCConnection remoteObjectProxyWithErrorHandler:](fConnection, "remoteObjectProxyWithErrorHandler:", v10) processMediaServicesMitigations:a3];
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_102325638);
    }
    uint64_t v7 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v16 = "-[CLEEDMediaServiceHandler processMediaForMitigations:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, No valid connection, skipping", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_102325638);
      }
      int v11 = 136446210;
      __int16 v12 = "-[CLEEDMediaServiceHandler processMediaForMitigations:]";
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDMediaServiceHandler processMediaForMitigations:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
  }
}

- (void)processMediaEndOfExtendedSessionNotification
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_102325638);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    __int16 v12 = "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_102325638);
    }
    int v9 = 136446210;
    objc_super v10 = "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]";
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  fConnection = self->fConnection;
  if (fConnection)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10142900C;
    v8[3] = &unk_1022B8750;
    v8[4] = self;
    [fConnection remoteObjectProxyWithErrorHandler:v8 processMediaServicesEndOfExtendedSessionNotification];
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_102325638);
    }
    v5 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446210;
      __int16 v12 = "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, No valid connection, skipping", buf, 0xCu);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_102325638);
      }
      int v9 = 136446210;
      objc_super v10 = "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]";
      uint64_t v7 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDMediaServiceHandler processMediaEndOfExtendedSessionNotification]", "%s\n", v7);
      if (v7 != (char *)buf) {
        free(v7);
      }
    }
  }
}

@end