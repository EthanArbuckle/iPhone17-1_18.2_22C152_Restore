@interface CDServiceConnection
- (CDServiceConnection)initWithConnection:(id)a3;
- (CDServiceConnectionDelegate)delegate;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)authenticationSessionDeviceStartedAuthentication:(id)a3;
- (void)authenticationSessionDeviceTappedNotification:(id)a3;
- (void)authenticationSessionDidFailWithError:(id)a3;
- (void)authenticationSessionDidFinishWithResponse:(id)a3;
- (void)fetchDaemonStatusWithCompletionHandler:(id)a3;
- (void)performAMSDelegatePurchaseWithRequest:(id)a3 isSandboxPurchase:(BOOL)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)startAuthenticationSessionWithRequest:(id)a3 completionHandler:(id)a4;
@end

@implementation CDServiceConnection

- (CDServiceConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDServiceConnection;
  v6 = [(CDServiceConnection *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  +[BSDescriptionBuilder builderWithObject:self];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FC54;
  v8[3] = &unk_100034800;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CDServiceConnection *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:self];
}

- (id)succinctDescription
{
  v2 = [(CDServiceConnection *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (void)startAuthenticationSessionWithRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v8 = _os_activity_create((void *)&_mh_execute_header, "start authentication session", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v8, &state);

  id v9 = +[CDServiceClient currentClient];
  v10 = cps_service_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v9 bundleIdentifier];
    *(_DWORD *)buf = 138412546;
    v47 = v11;
    __int16 v48 = 2112;
    id v49 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received start authentication session request. client=%@, request=%@", buf, 0x16u);
  }
  v38 = _NSConcreteStackBlock;
  uint64_t v39 = 3221225472;
  v40 = sub_1000108B8;
  v41 = &unk_100034D40;
  id v12 = v7;
  id v42 = v12;
  v13 = objc_retainBlock(&v38);
  v14 = self;
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    sub_10000FD30((uint64_t)self, v9, v6, v13);
  }
  else
  {
    v16 = self;
    char v17 = objc_opt_isKindOfClass();

    if (v17)
    {
      v18 = cps_signpost_log();
      v19 = [v6 identifier];
      v20 = (char *)[v19 hash];

      if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v20, "StartAuthentication", "", buf, 2u);
      }

      sub_10000FE10((uint64_t)self, v9, v6, v13);
    }
    else
    {
      v21 = self;
      char v22 = objc_opt_isKindOfClass();

      if (v22)
      {
        sub_10000FF34((uint64_t)self, v9, v6, v13);
      }
      else
      {
        v23 = self;
        char v24 = objc_opt_isKindOfClass();

        if (v24) {
          goto LABEL_20;
        }
        v25 = self;
        char v26 = objc_opt_isKindOfClass();

        if (v26)
        {
          sub_1000100B8((uint64_t)self, v9, v6, v13);
          goto LABEL_24;
        }
        v27 = self;
        char v28 = objc_opt_isKindOfClass();

        if (v28)
        {
          sub_100010198((uint64_t)self, v9, v6, v13);
          goto LABEL_24;
        }
        v29 = self;
        char v30 = objc_opt_isKindOfClass();

        if ((v30 & 1) != 0
          || (self,
              v31 = objc_claimAutoreleasedReturnValue(),
              char v32 = objc_opt_isKindOfClass(),
              v31,
              (v32 & 1) != 0))
        {
LABEL_20:
          sub_100010014((uint64_t)self, v9, v6, v13);
          goto LABEL_24;
        }
        v33 = self;
        char v34 = objc_opt_isKindOfClass();

        if (v34)
        {
          sub_100010278((uint64_t)self, v9, v6, v13);
        }
        else
        {
          NSErrorUserInfoKey v44 = NSDebugDescriptionErrorKey;
          v35 = +[NSString stringWithFormat:@"Invalid authentication request: %@", v6, v38, v39, v40, v41];
          v45 = v35;
          v36 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
          v37 = +[NSError errorWithDomain:CPSErrorDomain code:101 userInfo:v36];
          ((void (*)(void ***, void *))v13[2])(v13, v37);
        }
      }
    }
  }
LABEL_24:

  os_activity_scope_leave(&state);
}

- (void)fetchDaemonStatusWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  id v5 = _os_activity_create((void *)&_mh_execute_header, "fetch daemon status", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &v10);

  id v6 = +[CDServiceClient currentClient];
  id v7 = cps_service_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v6 bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received fetch daemon status request. client=%@", buf, 0xCu);
  }
  if ([v6 hasDaemonStatusEntitlement])
  {
    if (_BSIsInternalInstall())
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained serviceConnection:self fetchDaemonStatusWithCompletionHandler:v4];
    }
    else
    {
      WeakRetained = +[NSError errorWithDomain:CPSErrorDomain code:101 userInfo:0];
      v4[2](v4, 0, WeakRetained);
    }
  }
  else
  {
    WeakRetained = +[NSError errorWithDomain:CPSErrorDomain code:103 userInfo:0];
    v4[2](v4, 0, WeakRetained);
  }

  os_activity_scope_leave(&v10);
}

- (void)performAMSDelegatePurchaseWithRequest:(id)a3 isSandboxPurchase:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  v8 = (void (**)(id, void, void *))a5;
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  id v9 = _os_activity_create((void *)&_mh_execute_header, "perform AMS delegate purchase", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v9, &v23);

  os_activity_scope_state_s v10 = +[CDServiceClient currentClient];
  v11 = cps_service_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 bundleIdentifier];
    *(_DWORD *)buf = 138412290;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received perform AMS delegate purchase. client=%@", buf, 0xCu);
  }
  if ([v10 hasAMSDelegatePurchaseEntitlement])
  {
    if (_BSIsInternalInstall())
    {
      v13 = &AMSAccountMediaTypeProduction;
      if (v6) {
        v13 = &AMSAccountMediaTypeAppStoreSandbox;
      }
      v14 = +[ACAccountStore ams_sharedAccountStoreForMediaType:*v13];
      v15 = [v14 ams_activeiTunesAccount];

      v16 = +[AMSDelegatePurchaseTask bagSubProfile];
      char v17 = +[AMSDelegatePurchaseTask bagSubProfileVersion];
      v18 = +[AMSBag bagForProfile:v16 profileVersion:v17];

      id v19 = [objc_alloc((Class)AMSDelegatePurchaseTask) initWithDelegatePurchaseRequest:v7 bag:v18 account:v15];
      v20 = [v19 performDelegatePurchase];
      [v20 addFinishBlock:v8];
    }
    else
    {
      char v22 = cps_service_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100021DE0(v22);
      }

      v15 = +[NSError errorWithDomain:CPSErrorDomain code:101 userInfo:0];
      v8[2](v8, 0, v15);
    }
  }
  else
  {
    v21 = cps_service_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100021E24(v21);
    }

    v15 = +[NSError errorWithDomain:CPSErrorDomain code:103 userInfo:0];
    v8[2](v8, 0, v15);
  }

  os_activity_scope_leave(&v23);
}

- (void)authenticationSessionDeviceTappedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [[CDServiceClient alloc] initWithConnection:self->_connection];
  if ([(CDServiceClient *)v5 shouldReceiveDeviceEvents])
  {
    v10.opaque[0] = 0;
    v10.opaque[1] = 0;
    BOOL v6 = _os_activity_create((void *)&_mh_execute_header, "send device accepted notification event", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &v10);

    id v7 = cps_service_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(CDServiceClient *)v5 bundleIdentifier];
      *(_DWORD *)buf = 138412546;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending device accepted notification event to client. client=%@, device=%@", buf, 0x16u);
    }
    id v9 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_100034D60];
    [v9 authenticationSessionDeviceTappedNotification:v4];

    os_activity_scope_leave(&v10);
  }
}

- (void)authenticationSessionDeviceStartedAuthentication:(id)a3
{
  id v4 = a3;
  id v5 = [[CDServiceClient alloc] initWithConnection:self->_connection];
  if ([(CDServiceClient *)v5 shouldReceiveDeviceEvents])
  {
    v10.opaque[0] = 0;
    v10.opaque[1] = 0;
    BOOL v6 = _os_activity_create((void *)&_mh_execute_header, "send device started authentication event", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v6, &v10);

    id v7 = cps_service_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(CDServiceClient *)v5 bundleIdentifier];
      *(_DWORD *)buf = 138412546;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sending device accepted notification event to client. client=%@, device=%@", buf, 0x16u);
    }
    id v9 = [(NSXPCConnection *)self->_connection remoteObjectProxyWithErrorHandler:&stru_100034D80];
    [v9 authenticationSessionDeviceStartedAuthentication:v4];

    os_activity_scope_leave(&v10);
  }
}

- (void)authenticationSessionDidFinishWithResponse:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 authenticationSessionDidFinishWithResponse:v4];
}

- (void)authenticationSessionDidFailWithError:(id)a3
{
  connection = self->_connection;
  id v4 = a3;
  id v5 = [(NSXPCConnection *)connection remoteObjectProxy];
  [v5 authenticationSessionDidFailWithError:v4];
}

- (CDServiceConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CDServiceConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end