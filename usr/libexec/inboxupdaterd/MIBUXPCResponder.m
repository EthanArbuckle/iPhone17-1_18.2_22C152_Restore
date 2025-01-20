@interface MIBUXPCResponder
- (NSXPCConnection)xpcConnection;
- (id)_verifyBooleanEntitlement:(id)a3;
- (void)connectToWiFiWithReply:(id)a3;
- (void)eapConfigurationWithReply:(id)a3;
- (void)isInBoxUpdateModeWithReply:(id)a3;
- (void)isInDiagnosticModeWithReply:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)stopWiFiMonitorWithReply:(id)a3;
- (void)terminateInBoxUpdateWithReply:(id)a3;
@end

@implementation MIBUXPCResponder

- (void)isInBoxUpdateModeWithReply:(id)a3
{
  v3 = (void (**)(id, id, void))a3;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A000);
  }
  v4 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling isInBoxUpdateMode: xpc call", v6, 2u);
  }
  v5 = +[MIBUDeviceController sharedInstance];
  v3[2](v3, [v5 isInBoxUpdateMode], 0);
}

- (void)isInDiagnosticModeWithReply:(id)a3
{
  v3 = (void (**)(id, id, void))a3;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A020);
  }
  v4 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling isInDiagnosticMode: xpc call", v6, 2u);
  }
  v5 = +[MIBUDeviceController sharedInstance];
  v3[2](v3, [v5 isInDiagnosticMode], 0);
}

- (void)eapConfigurationWithReply:(id)a3
{
  v4 = (void (**)(id, uint64_t, uint64_t, uint64_t, uint64_t))a3;
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = sub_100016128;
  v33 = sub_100016138;
  id v34 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_100016128;
  v27 = sub_100016138;
  id v28 = 0;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_100016128;
  v21 = sub_100016138;
  id v22 = 0;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A040);
  }
  v5 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling eapConfigurationWithCompletion: xpc call", buf, 2u);
  }
  uint64_t v6 = [(MIBUXPCResponder *)self _verifyBooleanEntitlement:@"com.apple.private.mobileinboxupdater.eapCredentialEnabled"];
  v7 = (void *)v18[5];
  v18[5] = v6;

  if (v18[5]) {
    goto LABEL_13;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000161A8;
  v16[3] = &unk_10005A068;
  v16[4] = &v17;
  v16[5] = &v29;
  v16[6] = &v23;
  +[MIBUCertHelper readSUIdentityWithCompletion:v16];
  if (!os_variant_has_internal_content()) {
    goto LABEL_13;
  }
  v8 = +[MIBUTestPreferences sharedInstance];
  v9 = [v8 factorySUKeyPath];

  if (!v9) {
    goto LABEL_13;
  }
  v10 = +[MIBUTestPreferences sharedInstance];
  v11 = [v10 factorySUKeyIsSEP];

  if (v11)
  {
    v12 = +[MIBUTestPreferences sharedInstance];
    v13 = [v12 factorySUKeyIsSEP];
    uint64_t v14 = (uint64_t)[v13 BOOLValue];

    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A088);
    }
    v15 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Overriding isSEPKey=%d", buf, 8u);
    }
  }
  else
  {
LABEL_13:
    uint64_t v14 = 1;
  }
  v4[2](v4, v30[5], v24[5], v14, v18[5]);
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
}

- (void)terminateInBoxUpdateWithReply:(id)a3
{
  v4 = (void (**)(id, id))a3;
  if (qword_10006C958 != -1) {
    dispatch_once(&qword_10006C958, &stru_10005A0A8);
  }
  v5 = qword_10006C950;
  if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Handling terminateInBoxUpdateWithCompletion: xpc call", buf, 2u);
  }
  uint64_t v6 = [(MIBUXPCResponder *)self _verifyBooleanEntitlement:@"com.apple.private.mobileinboxupdater.terminationEnabled"];
  if (v6)
  {
    id v8 = (id)v6;
  }
  else
  {
    v7 = +[MIBUMainController sharedInstance];
    id v9 = 0;
    [v7 cleanup:&v9];
    id v8 = v9;
  }
  v4[2](v4, v8);
}

- (void)connectToWiFiWithReply:(id)a3
{
  v3 = (void (**)(id, id))a3;
  if (os_variant_has_internal_content())
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A0C8);
    }
    v4 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling connectToWiFi: xpc call", buf, 2u);
    }
    v5 = +[MIBUWiFiHelper sharedInstance];
    id v8 = 0;
    [v5 connectAndMonitor:&v8];
    id v6 = v8;
    v3[2](v3, v6);

    v3 = (void (**)(id, id))v6;
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A0E8);
    }
    v7 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[MIBUXPCResponder connectToWiFiWithReply:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s is only supported on internal builds", buf, 0xCu);
    }
    v3[2](v3, 0);
  }
}

- (void)stopWiFiMonitorWithReply:(id)a3
{
  v3 = (void (**)(id, void))a3;
  if (os_variant_has_internal_content())
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A108);
    }
    v4 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Handling stopWiFiMonitor: xpc call", (uint8_t *)&v7, 2u);
    }
    v5 = +[MIBUWiFiHelper sharedInstance];
    [v5 stopMonitor];
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A128);
    }
    id v6 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      id v8 = "-[MIBUXPCResponder stopWiFiMonitorWithReply:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s is only supported on internal builds", (uint8_t *)&v7, 0xCu);
    }
  }
  v3[2](v3, 0);
}

- (id)_verifyBooleanEntitlement:(id)a3
{
  id v4 = a3;
  v5 = [(MIBUXPCResponder *)self xpcConnection];
  id v6 = v5;
  if (!v5)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A148);
    }
    v11 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003F3A8(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    uint64_t v38 = 0;
    uint64_t v19 = @"Failed to get XPC connection";
    v20 = (id *)&v38;
    v21 = &v38;
    uint64_t v22 = 2415919104;
    goto LABEL_19;
  }
  uint64_t v7 = [v5 valueForEntitlement:v4];
  if (!v7)
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A168);
    }
    uint64_t v23 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003F3E0((uint64_t)v4, v23);
    }
    uint64_t v37 = 0;
    uint64_t v19 = @"Entitlement %@ not found";
    uint64_t v34 = (uint64_t)v4;
    v20 = (id *)&v37;
    v21 = &v37;
    uint64_t v22 = 2415919105;
LABEL_19:
    sub_1000102B8(v21, v22, 0, v19, v15, v16, v17, v18, v34);
    id v8 = 0;
    goto LABEL_30;
  }
  id v8 = (void *)v7;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v8 BOOLValue])
    {
      id v9 = 0;
      goto LABEL_6;
    }
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A1A8);
    }
    uint64_t v29 = qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003F458((uint64_t)v4, v29);
    }
    uint64_t v35 = 0;
    v20 = (id *)&v35;
    sub_1000102B8(&v35, 2415919105, 0, @"Entitlement %@ is FALSE", v30, v31, v32, v33, (uint64_t)v4);
  }
  else
  {
    if (qword_10006C958 != -1) {
      dispatch_once(&qword_10006C958, &stru_10005A188);
    }
    v24 = (void *)qword_10006C950;
    if (os_log_type_enabled((os_log_t)qword_10006C950, OS_LOG_TYPE_ERROR)) {
      sub_10003F4D0((uint64_t)v4, v24);
    }
    uint64_t v36 = 0;
    v20 = (id *)&v36;
    sub_1000102B8(&v36, 2415919105, 0, @"Entitlement %@ invalid", v25, v26, v27, v28, (uint64_t)v4);
  }
LABEL_30:
  id v9 = *v20;
LABEL_6:

  return v9;
}

- (NSXPCConnection)xpcConnection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_xpcConnection);

  return (NSXPCConnection *)WeakRetained;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end