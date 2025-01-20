@interface CLEEDHelperService
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)notifyMitigationNeeded:(id)a3;
- (BOOL)notifyNewRequestAvailable;
- (CLEEDHelperService)initWithUniverse:(id)a3 pendingRequestsCB:(id)a4 streamingRequestCB:(id)a5 uploadRequestCB:(id)a6 streamingEndCB:(id)a7 uploadListCB:(id)a8 handleResponseCB:(id)a9 mitigationsCB:(id)a10;
- (void)connectToEEDHelper;
- (void)dealloc;
- (void)fetchAllPendingRequestsWithCompletion:(id)a3;
- (void)fetchCurrentMediaUploadRequestWithCompletion:(id)a3;
- (void)fetchCurrentStreamingRequestWithCompletion:(id)a3;
- (void)fetchMitigationsWithCompletion:(id)a3;
- (void)handleResponse:(BOOL)a3 forRequest:(id)a4 completion:(id)a5;
- (void)mediaUploadList:(id)a3 forRequestID:(id)a4 completion:(id)a5;
- (void)streamingSessionEndedForRequestID:(id)a3 completion:(id)a4;
@end

@implementation CLEEDHelperService

- (CLEEDHelperService)initWithUniverse:(id)a3 pendingRequestsCB:(id)a4 streamingRequestCB:(id)a5 uploadRequestCB:(id)a6 streamingEndCB:(id)a7 uploadListCB:(id)a8 handleResponseCB:(id)a9 mitigationsCB:(id)a10
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  v17 = &qword_102419000;
  v18 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v31 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uplo"
          "adListCB:handleResponseCB:mitigationsCB:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v28 = 136446210;
    v29 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uplo"
          "adListCB:handleResponseCB:mitigationsCB:]";
    v25 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uploadListCB:handleResponseCB:mitigationsCB:]", "%s\n", v25);
    if (v25 != (char *)buf) {
      free(v25);
    }
    v17 = &qword_102419000;
  }
  v27.receiver = self;
  v27.super_class = (Class)CLEEDHelperService;
  v19 = [(CLEEDHelperService *)&v27 init];
  if (v19)
  {
    v19->fUniverse = (CLIntersiloUniverse *)a3;
    dispatch_assert_queue_V2([[objc_msgSend(objc_msgSend(a3, "silo"), "queue") retain] autorelease]);
    v19->fPendingRequestsCB = _Block_copy(a4);
    v19->fStreamingRequestCB = _Block_copy(a5);
    v19->fUploadRequestCB = _Block_copy(a6);
    v19->fStreamingEndCB = _Block_copy(a7);
    v19->fUploadListCB = _Block_copy(a8);
    v19->fHandleResponseCB = _Block_copy(a9);
    v19->fFetchMitigationsCB = _Block_copy(a10);
    v20 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.locationd.eedhelper"];
    v19->fListener = v20;
    if (v20)
    {
      -[NSXPCListener _setQueue:[CLIntersiloUniverse silo](v19->fUniverse, "silo") queue];
      [(NSXPCListener *)v19->fListener setDelegate:v19];
      [(NSXPCListener *)v19->fListener activate];
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_10232D3B0);
      }
      v21 = v17[125];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:"
              "uploadListCB:handleResponseCB:mitigationsCB:]";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, Listener activated", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_10232D3B0);
        }
        int v28 = 136446210;
        v29 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:"
              "uploadListCB:handleResponseCB:mitigationsCB:]";
        v22 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uploadListCB:handleResponseCB:mitigationsCB:]", "%s\n", v22);
        if (v22 != (char *)buf) {
          free(v22);
        }
      }
    }
    else
    {
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_10232D3B0);
      }
      v23 = v17[125];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v31 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:"
              "uploadListCB:handleResponseCB:mitigationsCB:]";
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, Could not establish listener", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_10232D3B0);
        }
        int v28 = 136446210;
        v29 = "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:"
              "uploadListCB:handleResponseCB:mitigationsCB:]";
        v26 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDHelperService initWithUniverse:pendingRequestsCB:streamingRequestCB:uploadRequestCB:streamingEndCB:uploadListCB:handleResponseCB:mitigationsCB:]", "%s\n", v26);
        if (v26 != (char *)buf) {
          free(v26);
        }
      }

      return 0;
    }
  }
  return v19;
}

- (void)dealloc
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v9 = "-[CLEEDHelperService dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v6 = 136446210;
    v7 = "-[CLEEDHelperService dealloc]";
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService dealloc]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(NSMutableArray *)self->fConnections removeAllObjects];

  self->fConnections = 0;
  [(NSXPCListener *)self->fListener invalidate];

  self->fListener = 0;
  _Block_release(self->fPendingRequestsCB);
  self->fPendingRequestsCB = 0;
  _Block_release(self->fStreamingRequestCB);
  self->fStreamingRequestCB = 0;
  _Block_release(self->fUploadRequestCB);
  self->fUploadRequestCB = 0;
  _Block_release(self->fStreamingEndCB);
  self->fStreamingEndCB = 0;
  _Block_release(self->fUploadListCB);
  self->fUploadListCB = 0;
  _Block_release(self->fHandleResponseCB);
  self->fHandleResponseCB = 0;
  _Block_release(self->fFetchMitigationsCB);
  self->fFetchMitigationsCB = 0;
  v5.receiver = self;
  v5.super_class = (Class)CLEEDHelperService;
  [(CLEEDHelperService *)&v5 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  int v6 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v31 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
    __int16 v32 = 1024;
    unsigned int v33 = [a4 processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, client[%d]", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v26 = 136446466;
    objc_super v27 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
    __int16 v28 = 1024;
    unsigned int v29 = [a4 processIdentifier];
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService listener:shouldAcceptNewConnection:]", "%s\n", v14);
    if (v14 != (char *)buf) {
      free(v14);
    }
  }
  if (qword_102488850 != -1) {
    dispatch_once(&qword_102488850, &stru_10232D278);
  }
  id v7 = [a4 valueForEntitlement:@"com.apple.locationd.eedhelperservice"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v7 BOOLValue])
  {
    fConnections = self->fConnections;
    if (!fConnections)
    {
      fConnections = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->fConnections = fConnections;
    }
    [(NSMutableArray *)fConnections addObject:a4];
    [a4 _setQueue:[-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]];
    [a4 setExportedInterface:qword_102488840];
    [a4 setExportedObject:self];
    [a4 setRemoteObjectInterface:qword_102488848];
    objc_initWeak(&location, self);
    objc_initWeak(&from, a4);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_101552ADC;
    v21[3] = &unk_10232D2A0;
    objc_copyWeak(&v22, &location);
    objc_copyWeak(&v23, &from);
    [a4 setInvalidationHandler:v21];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_101552CF0;
    v19[3] = &unk_1022B20F8;
    objc_copyWeak(&v20, &from);
    [a4 setInterruptionHandler:v19];
    [a4 activate];
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    v9 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = [a4 processIdentifier];
      *(_DWORD *)buf = 136446466;
      v31 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
      __int16 v32 = 1026;
      unsigned int v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, New connection resumed with pid:%{public}d", buf, 0x12u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_10232D3B0);
      }
      unsigned int v16 = [a4 processIdentifier];
      int v26 = 136446466;
      objc_super v27 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
      __int16 v28 = 1026;
      unsigned int v29 = v16;
      v17 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService listener:shouldAcceptNewConnection:]", "%s\n", v17);
      if (v17 != (char *)buf) {
        free(v17);
      }
    }
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
    LOBYTE(v11) = 1;
  }
  else
  {
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    v12 = qword_1024193E8;
    if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_ERROR))
    {
      unsigned int v13 = [+[NSXPCConnection currentConnection] processIdentifier];
      *(_DWORD *)buf = 136446466;
      v31 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
      __int16 v32 = 1024;
      unsigned int v33 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#EED2FWK,%{public}s, Error in entilement check. Client[%d] does not have entitlement", buf, 0x12u);
    }
    BOOL v11 = sub_10013D1A0(115, 0);
    if (v11)
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_10232D3B0);
      }
      int v26 = 136446466;
      objc_super v27 = "-[CLEEDHelperService listener:shouldAcceptNewConnection:]";
      __int16 v28 = 1024;
      unsigned int v29 = [+[NSXPCConnection currentConnection] processIdentifier];
      v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLEEDHelperService listener:shouldAcceptNewConnection:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
      LOBYTE(v11) = 0;
    }
  }
  return v11;
}

- (void)connectToEEDHelper
{
  dispatch_assert_queue_V2((dispatch_queue_t)[-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  v2 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    objc_super v5 = "-[CLEEDHelperService connectToEEDHelper]";
    __int16 v6 = 1026;
    unsigned int v7 = [+[NSXPCConnection currentConnection] processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d], client connected to CLEEDHelperService", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    [+[NSXPCConnection currentConnection] processIdentifier];
    v3 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService connectToEEDHelper]", "%s\n", v3);
    if (v3 != (char *)buf) {
      free(v3);
    }
  }
}

- (void)fetchAllPendingRequestsWithCompletion:(id)a3
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  objc_super v5 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    unsigned int v16 = "-[CLEEDHelperService fetchAllPendingRequestsWithCompletion:]";
    __int16 v17 = 1026;
    unsigned int v18 = [+[NSXPCConnection currentConnection] processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d]", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v11 = 136446466;
    v12 = "-[CLEEDHelperService fetchAllPendingRequestsWithCompletion:]";
    __int16 v13 = 1026;
    unsigned int v14 = [+[NSXPCConnection currentConnection] processIdentifier];
    unsigned int v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService fetchAllPendingRequestsWithCompletion:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  dispatch_assert_queue_V2([-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]);
  fPendingRequestsCB = (void (**)(id, void *))self->fPendingRequestsCB;
  if (fPendingRequestsCB)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1015533B8;
    v8[3] = &unk_10232D2C8;
    v8[4] = self;
    v8[5] = a3;
    fPendingRequestsCB[2](fPendingRequestsCB, v8);
  }
  else
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"EED is unable to service this request";
    [objc_alloc((Class)NSError) initWithDomain:@"com.apple.CoreLocation.CLEEDHelperService" code:7 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1)];
  }
}

- (void)fetchCurrentMediaUploadRequestWithCompletion:(id)a3
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  objc_super v5 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    unsigned int v16 = "-[CLEEDHelperService fetchCurrentMediaUploadRequestWithCompletion:]";
    __int16 v17 = 1026;
    unsigned int v18 = [+[NSXPCConnection currentConnection] processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d]", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v11 = 136446466;
    v12 = "-[CLEEDHelperService fetchCurrentMediaUploadRequestWithCompletion:]";
    __int16 v13 = 1026;
    unsigned int v14 = [+[NSXPCConnection currentConnection] processIdentifier];
    unsigned int v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService fetchCurrentMediaUploadRequestWithCompletion:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)[-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]);
  fUploadRequestCB = (void (**)(id, void *))self->fUploadRequestCB;
  if (fUploadRequestCB)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1015538B0;
    v8[3] = &unk_10232D2F0;
    v8[4] = self;
    v8[5] = a3;
    fUploadRequestCB[2](fUploadRequestCB, v8);
  }
  else
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"EED is unable to service this request";
    (*((void (**)(id, void, id))a3 + 2))(a3, 0, [objc_alloc((Class)NSError) initWithDomain:@"com.apple.CoreLocation.CLEEDHelperService" code:7 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1)]);
  }
}

- (void)fetchCurrentStreamingRequestWithCompletion:(id)a3
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  objc_super v5 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    unsigned int v16 = "-[CLEEDHelperService fetchCurrentStreamingRequestWithCompletion:]";
    __int16 v17 = 1026;
    unsigned int v18 = [+[NSXPCConnection currentConnection] processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d]", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v11 = 136446466;
    v12 = "-[CLEEDHelperService fetchCurrentStreamingRequestWithCompletion:]";
    __int16 v13 = 1026;
    unsigned int v14 = [+[NSXPCConnection currentConnection] processIdentifier];
    unsigned int v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService fetchCurrentStreamingRequestWithCompletion:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)[-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]);
  fStreamingRequestCB = (void (**)(id, void *))self->fStreamingRequestCB;
  if (fStreamingRequestCB)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_101553DB0;
    v8[3] = &unk_10232D318;
    v8[4] = self;
    v8[5] = a3;
    fStreamingRequestCB[2](fStreamingRequestCB, v8);
  }
  else
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"EED is unable to service this request";
    (*((void (**)(id, void, id))a3 + 2))(a3, 0, [objc_alloc((Class)NSError) initWithDomain:@"com.apple.CoreLocation.CLEEDHelperService" code:7 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1)]);
  }
}

- (void)fetchMitigationsWithCompletion:(id)a3
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  objc_super v5 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    unsigned int v16 = "-[CLEEDHelperService fetchMitigationsWithCompletion:]";
    __int16 v17 = 1026;
    unsigned int v18 = [+[NSXPCConnection currentConnection] processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d]", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v11 = 136446466;
    v12 = "-[CLEEDHelperService fetchMitigationsWithCompletion:]";
    __int16 v13 = 1026;
    unsigned int v14 = [+[NSXPCConnection currentConnection] processIdentifier];
    unsigned int v7 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService fetchMitigationsWithCompletion:]", "%s\n", v7);
    if (v7 != (char *)buf) {
      free(v7);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)[-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]);
  fFetchMitigationsCB = (void (**)(id, void *))self->fFetchMitigationsCB;
  if (fFetchMitigationsCB)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1015542A8;
    v8[3] = &unk_10232D340;
    v8[4] = self;
    v8[5] = a3;
    fFetchMitigationsCB[2](fFetchMitigationsCB, v8);
  }
  else
  {
    NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
    CFStringRef v10 = @"EED is unable to service this request";
    (*((void (**)(id, void, id))a3 + 2))(a3, 0, [objc_alloc((Class)NSError) initWithDomain:@"com.apple.CoreLocation.CLEEDHelperService" code:7 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1)]);
  }
}

- (void)mediaUploadList:(id)a3 forRequestID:(id)a4 completion:(id)a5
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  NSErrorUserInfoKey v9 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v24 = "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]";
    __int16 v25 = 1026;
    LODWORD(v26) = [+[NSXPCConnection currentConnection] processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d]", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v17 = 136446466;
    unsigned int v18 = "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]";
    __int16 v19 = 1026;
    LODWORD(v20) = [+[NSXPCConnection currentConnection] processIdentifier];
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)[-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  CFStringRef v10 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446723;
    v24 = "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]";
    __int16 v25 = 2113;
    id v26 = a3;
    __int16 v27 = 2114;
    id v28 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, received mediaUploadList:%{private}@ forRequestID:%{public}@", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v17 = 136446723;
    unsigned int v18 = "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]";
    __int16 v19 = 2113;
    id v20 = a3;
    __int16 v21 = 2114;
    id v22 = a4;
    __int16 v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService mediaUploadList:forRequestID:completion:]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  fUploadListCB = (void (**)(id, id, id, void *))self->fUploadListCB;
  if (fUploadListCB)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_101554938;
    v14[3] = &unk_10232D368;
    v14[4] = self;
    v14[5] = a5;
    fUploadListCB[2](fUploadListCB, a3, a4, v14);
  }
  else
  {
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    CFStringRef v16 = @"EED is unable to service this request";
    (*((void (**)(id, id))a5 + 2))(a5, [objc_alloc((Class)NSError) initWithDomain:@"com.apple.CoreLocation.CLEEDHelperService" code:7 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)]);
  }
}

- (void)streamingSessionEndedForRequestID:(id)a3 completion:(id)a4
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  unsigned int v7 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    id v20 = "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]";
    __int16 v21 = 1026;
    LODWORD(v22) = [+[NSXPCConnection currentConnection] processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d]", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v15 = 136446466;
    CFStringRef v16 = "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]";
    __int16 v17 = 1026;
    LODWORD(v18) = [+[NSXPCConnection currentConnection] processIdentifier];
    CFStringRef v10 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]", "%s\n", v10);
    if (v10 != (char *)buf) {
      free(v10);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)[-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  v8 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    id v20 = "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]";
    __int16 v21 = 2114;
    id v22 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, received streamingSessionEndedForRequestID:%{public}@", buf, 0x16u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v15 = 136446466;
    CFStringRef v16 = "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]";
    __int16 v17 = 2114;
    id v18 = a3;
    int v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService streamingSessionEndedForRequestID:completion:]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  fStreamingEndCB = (void (**)(id, id, void *))self->fStreamingEndCB;
  if (fStreamingEndCB)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_101554F88;
    v12[3] = &unk_10232D368;
    v12[4] = self;
    v12[5] = a4;
    fStreamingEndCB[2](fStreamingEndCB, a3, v12);
  }
  else
  {
    NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
    CFStringRef v14 = @"EED is unable to service this request";
    [objc_alloc((Class)NSError) initWithDomain:@"com.apple.CoreLocation.CLEEDHelperService" code:7 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1)];
  }
}

- (void)handleResponse:(BOOL)a3 forRequest:(id)a4 completion:(id)a5
{
  BOOL v7 = a3;
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  NSErrorUserInfoKey v9 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446466;
    v24 = "-[CLEEDHelperService handleResponse:forRequest:completion:]";
    __int16 v25 = 1026;
    unsigned int v26 = [+[NSXPCConnection currentConnection] processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s[client:%{public}d]", buf, 0x12u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v17 = 136446466;
    id v18 = "-[CLEEDHelperService handleResponse:forRequest:completion:]";
    __int16 v19 = 1026;
    unsigned int v20 = [+[NSXPCConnection currentConnection] processIdentifier];
    v12 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService handleResponse:forRequest:completion:]", "%s\n", v12);
    if (v12 != (char *)buf) {
      free(v12);
    }
  }
  dispatch_assert_queue_V2([-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]);
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  CFStringRef v10 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446722;
    v24 = "-[CLEEDHelperService handleResponse:forRequest:completion:]";
    __int16 v25 = 1026;
    unsigned int v26 = v7;
    __int16 v27 = 2114;
    id v28 = a4;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, received handleResponse:%{public}u forRequestID:%{public}@", buf, 0x1Cu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v17 = 136446722;
    id v18 = "-[CLEEDHelperService handleResponse:forRequest:completion:]";
    __int16 v19 = 1026;
    unsigned int v20 = v7;
    __int16 v21 = 2114;
    id v22 = a4;
    NSErrorUserInfoKey v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService handleResponse:forRequest:completion:]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  fHandleResponseCB = (void (**)(id, BOOL, id, void *))self->fHandleResponseCB;
  if (fHandleResponseCB)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1015555FC;
    v14[3] = &unk_10232D390;
    v14[4] = self;
    v14[5] = a5;
    fHandleResponseCB[2](fHandleResponseCB, v7, a4, v14);
  }
  else
  {
    NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
    CFStringRef v16 = @"EED is unable to service this request";
    (*((void (**)(id, void, id))a5 + 2))(a5, 0, [objc_alloc((Class)NSError) initWithDomain:@"com.apple.CoreLocation.CLEEDHelperService" code:7 userInfo:[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1)]);
  }
}

- (BOOL)notifyNewRequestAvailable
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  v3 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    unsigned int v33 = "-[CLEEDHelperService notifyNewRequestAvailable]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v25 = 136446210;
    unsigned int v26 = "-[CLEEDHelperService notifyNewRequestAvailable]";
    int v17 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService notifyNewRequestAvailable]", "%s\n", v17);
    if (v17 != (char *)buf) {
      free(v17);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)[-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]);
  fConnections = self->fConnections;
  if (fConnections)
  {
    fConnections = (NSMutableArray *)[(NSMutableArray *)fConnections count];
    if (fConnections)
    {
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_10232D3B0);
      }
      objc_super v5 = qword_1024193E8;
      if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446210;
        unsigned int v33 = "-[CLEEDHelperService notifyNewRequestAvailable]";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, received notifyNewRequestAvailable request from EED", buf, 0xCu);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_10232D3B0);
        }
        int v25 = 136446210;
        unsigned int v26 = "-[CLEEDHelperService notifyNewRequestAvailable]";
        id v18 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService notifyNewRequestAvailable]", "%s\n", v18);
        if (v18 != (char *)buf) {
          free(v18);
        }
      }
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      __int16 v6 = self->fConnections;
      id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v22;
        do
        {
          CFStringRef v10 = 0;
          do
          {
            if (*(void *)v22 != v9) {
              objc_enumerationMutation(v6);
            }
            int v11 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v10);
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_101555DE8;
            v20[3] = &unk_1022B8750;
            v20[4] = v11;
            id v12 = [v11 remoteObjectProxyWithErrorHandler:v20];
            if (v12)
            {
              NSErrorUserInfoKey v13 = v12;
              if (qword_1024193E0 != -1) {
                dispatch_once(&qword_1024193E0, &stru_10232D3B0);
              }
              CFStringRef v14 = qword_1024193E8;
              if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446722;
                unsigned int v33 = "-[CLEEDHelperService notifyNewRequestAvailable]";
                __int16 v34 = 2114;
                v35 = v11;
                __int16 v36 = 2114;
                v37 = v13;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, notifying connection:%{public}@, remote:%{public}@", buf, 0x20u);
              }
              if (sub_10013D1A0(115, 2))
              {
                bzero(buf, 0x65CuLL);
                if (qword_1024193E0 != -1) {
                  dispatch_once(&qword_1024193E0, &stru_10232D3B0);
                }
                int v25 = 136446722;
                unsigned int v26 = "-[CLEEDHelperService notifyNewRequestAvailable]";
                __int16 v27 = 2114;
                id v28 = v11;
                __int16 v29 = 2114;
                v30 = v13;
                NSErrorUserInfoKey v15 = (char *)_os_log_send_and_compose_impl();
                sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService notifyNewRequestAvailable]", "%s\n", v15);
                if (v15 != (char *)buf) {
                  free(v15);
                }
              }
              [v13 notifyNewRequestAvailable];
            }
            CFStringRef v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v16 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
          id v8 = v16;
        }
        while (v16);
      }
      LOBYTE(fConnections) = 1;
    }
  }
  return (char)fConnections;
}

- (BOOL)notifyMitigationNeeded:(id)a3
{
  if (qword_1024193E0 != -1) {
    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
  }
  v4 = qword_1024193E8;
  if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    v35 = "-[CLEEDHelperService notifyMitigationNeeded:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024193E0 != -1) {
      dispatch_once(&qword_1024193E0, &stru_10232D3B0);
    }
    int v27 = 136446210;
    id v28 = "-[CLEEDHelperService notifyMitigationNeeded:]";
    id v18 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService notifyMitigationNeeded:]", "%s\n", v18);
    if (v18 != (char *)buf) {
      free(v18);
    }
  }
  dispatch_assert_queue_V2([-[CLIntersiloUniverse silo](self->fUniverse, "silo") queue]);
  fConnections = self->fConnections;
  if (fConnections)
  {
    fConnections = (NSMutableArray *)[(NSMutableArray *)fConnections count];
    if (fConnections)
    {
      if (qword_1024193E0 != -1) {
        dispatch_once(&qword_1024193E0, &stru_10232D3B0);
      }
      __int16 v6 = qword_1024193E8;
      if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        v35 = "-[CLEEDHelperService notifyMitigationNeeded:]";
        __int16 v36 = 2114;
        id v37 = a3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#EED2FWK,%{public}s, received notifyMitigationNeeded:%{public}@ from EED", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024193E0 != -1) {
          dispatch_once(&qword_1024193E0, &stru_10232D3B0);
        }
        int v27 = 136446466;
        id v28 = "-[CLEEDHelperService notifyMitigationNeeded:]";
        __int16 v29 = 2114;
        id v30 = a3;
        __int16 v19 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService notifyMitigationNeeded:]", "%s\n", v19);
        if (v19 != (char *)buf) {
          free(v19);
        }
      }
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v7 = self->fConnections;
      id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v33 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v24;
        do
        {
          int v11 = 0;
          do
          {
            if (*(void *)v24 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v11);
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_101556648;
            v22[3] = &unk_1022B8750;
            v22[4] = v12;
            id v13 = [v12 remoteObjectProxyWithErrorHandler:v22];
            if (v13)
            {
              CFStringRef v14 = v13;
              if (objc_opt_respondsToSelector())
              {
                if (qword_1024193E0 != -1) {
                  dispatch_once(&qword_1024193E0, &stru_10232D3B0);
                }
                NSErrorUserInfoKey v15 = qword_1024193E8;
                if (os_log_type_enabled((os_log_t)qword_1024193E8, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446722;
                  v35 = "-[CLEEDHelperService notifyMitigationNeeded:]";
                  __int16 v36 = 2114;
                  id v37 = v12;
                  __int16 v38 = 2114;
                  v39 = v14;
                  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "#EED2FWK,%{public}s, notifying connection:%{public}@, remote:%{public}@", buf, 0x20u);
                }
                if (sub_10013D1A0(115, 2))
                {
                  bzero(buf, 0x65CuLL);
                  if (qword_1024193E0 != -1) {
                    dispatch_once(&qword_1024193E0, &stru_10232D3B0);
                  }
                  int v27 = 136446722;
                  id v28 = "-[CLEEDHelperService notifyMitigationNeeded:]";
                  __int16 v29 = 2114;
                  id v30 = v12;
                  __int16 v31 = 2114;
                  __int16 v32 = v14;
                  id v16 = (char *)_os_log_send_and_compose_impl();
                  sub_1004BA5E4("Generic", 1, 0, 2, "-[CLEEDHelperService notifyMitigationNeeded:]", "%s\n", v16);
                  if (v16 != (char *)buf) {
                    free(v16);
                  }
                }
                [v14 notifyMitigationNeeded:a3];
              }
            }
            int v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v17 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v33 count:16];
          id v9 = v17;
        }
        while (v17);
      }
      LOBYTE(fConnections) = 1;
    }
  }
  return (char)fConnections;
}

@end