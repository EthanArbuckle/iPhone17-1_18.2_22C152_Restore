@interface PDApplicationAuthorizationHandle
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (PDApplicationAuthorizationHandle)init;
- (void)configurationWithReply:(id)a3;
- (void)detachWithReply:(id)a3;
- (void)displayForRequest:(id)a3 target:(id)a4 withReply:(id)a5;
- (void)performActionWithReply:(id)a3;
@end

@implementation PDApplicationAuthorizationHandle

- (PDApplicationAuthorizationHandle)init
{
  return 0;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  signed int v8 = [v7 processIdentifier];
  v9 = [v7 valueForEntitlement:@"com.apple.wallet.application-authorization.ui"];
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || ![v9 BOOLValue])
  {
    v20 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v31 = self;
      __int16 v32 = 2048;
      id v33 = v7;
      __int16 v34 = 2048;
      uint64_t v35 = v8;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "PDApplicationAuthorizationHandle (%p): rejecting connection %p - remote process %ld missing entitlement com.apple.wallet.application-authorization.ui.", buf, 0x20u);
    }
    goto LABEL_13;
  }
  v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v31 = self;
    __int16 v32 = 2048;
    id v33 = v7;
    __int16 v34 = 2048;
    uint64_t v35 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "PDApplicationAuthorizationHandle (%p): accepting connection %p for remote process %ld.", buf, 0x20u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (!self->_started)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (self->_uiConnected)
  {
LABEL_16:
    os_unfair_lock_unlock(&self->_lock);
    v20 = v6;
    sub_10034C5B8((uint64_t)self, 0, 0);
LABEL_13:
    BOOL v11 = 0;
    goto LABEL_14;
  }
  self->_uiConnected = 1;
  BOOL v11 = !self->_invalidated;
  if (!self->_invalidated)
  {
    objc_storeStrong((id *)&self->_uiConnection, a4);
    uiConnection = self->_uiConnection;
    v13 = (void *)PKApplicationAuthorizationViewServiceInterface_Remote();
    [(NSXPCConnection *)uiConnection setExportedInterface:v13];

    v14 = self->_uiConnection;
    v15 = (void *)PKApplicationAuthorizationViewServiceInterface_Service();
    [(NSXPCConnection *)v14 setRemoteObjectInterface:v15];

    [(NSXPCConnection *)self->_uiConnection setExportedObject:self];
    v16 = self->_uiConnection;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10034D238;
    v28[3] = &unk_10072E198;
    v28[4] = self;
    id v17 = v7;
    id v29 = v17;
    v18 = self;
    [(NSXPCConnection *)v16 setInterruptionHandler:v28];
    v19 = self->_uiConnection;
    v22 = _NSConcreteStackBlock;
    uint64_t v23 = 3221225472;
    v24 = sub_10034D308;
    v25 = &unk_10072E198;
    v26 = v18;
    id v27 = v17;
    [(NSXPCConnection *)v19 setInvalidationHandler:&v22];
    [(NSXPCConnection *)self->_uiConnection activate];
  }
  os_unfair_lock_unlock(&self->_lock);
  v20 = 0;
LABEL_14:

  return v11;
}

- (void)displayForRequest:(id)a3 target:(id)a4 withReply:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  BOOL v11 = (void (**)(void))a5;
  BOOL v12 = v9 != 0;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
    goto LABEL_9;
  }
  v16 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "PDApplicationAuthorizationHandle (%p): cannot display - no request - invalidating.", buf, 0xCu);
  }

  if (!v10)
  {
LABEL_9:
    id v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PDApplicationAuthorizationHandle (%p): cannot display - no presentation target - invalidating.", buf, 0xCu);
    }

    BOOL v12 = 0;
  }
LABEL_3:
  os_unfair_lock_lock(&self->_lock);
  if (self->_started)
  {
    v18 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v22 = self;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PDApplicationAuthorizationHandle (%p): cannot display - handle already attempted display - invalidating.", buf, 0xCu);
    }

    goto LABEL_15;
  }
  self->_started = 1;
  if (!v12)
  {
LABEL_15:
    os_unfair_lock_unlock(&self->_lock);
    v11[2](v11);
    sub_10034C5B8((uint64_t)self, 0, 0);
    goto LABEL_16;
  }
  objc_storeStrong((id *)&self->_request, a3);
  objc_storeStrong((id *)&self->_target, a4);
  v13 = +[NSXPCListener anonymousListener];
  listener = self->_listener;
  self->_listener = v13;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener activate];
  os_unfair_lock_unlock(&self->_lock);
  remoteInterfacePresenter = self->_remoteInterfacePresenter;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10034D774;
  v19[3] = &unk_10072F788;
  v20 = v11;
  sub_10020D30C((uint64_t)remoteInterfacePresenter, self, v19);

LABEL_16:
}

- (void)detachWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    id v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "PDApplicationAuthorizationHandle (%p): received remote detach.", (uint8_t *)&v6, 0xCu);
  }

  atomic_exchange(&self->_detached._Value, 1u);
  v4[2](v4);
  if (self) {
    sub_10034C5B8((uint64_t)self, 0, 0);
  }
}

- (void)configurationWithReply:(id)a3
{
  p_lock = &self->_lock;
  v5 = (void (**)(id, id, PKRemoteAlertPresentationTarget *))a3;
  os_unfair_lock_lock(p_lock);
  request = self->_request;
  id v7 = self->_target;
  signed int v8 = request;
  os_unfair_lock_unlock(p_lock);
  v5[2](v5, v8, v7);
}

- (void)performActionWithReply:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10034DA1C;
  v8[3] = &unk_10072F788;
  id v4 = a3;
  id v9 = v4;
  v5 = (void *)sub_10034D3D0((uint64_t)self, v8);
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10034DA30;
    v6[3] = &unk_1007304D8;
    id v7 = v4;
    [v5 performActionWithReply:v6];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiConnection, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_invalidationCompletions, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_remoteInterfacePresenter, 0);
}

@end