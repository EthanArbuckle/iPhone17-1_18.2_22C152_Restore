@interface MCInteractionClient
- (BOOL)didBeginInstallingNextProfileData:(id)a3;
- (BOOL)didFinishInstallationWithIdentifier:(id)a3 error:(id)a4;
- (BOOL)didUpdateStatus:(id)a3;
- (BOOL)requestCurrentPasscodeOutPasscode:(id *)a3;
- (BOOL)requestMAIDSignIn:(id)a3 personaID:(id)a4 outError:(id *)a5 isCancelled:(BOOL *)a6;
- (BOOL)requestUserInput:(id)a3 delegate:(id)a4 outResult:(id *)a5;
- (BOOL)showUserWarnings:(id)a3 outResult:(BOOL *)a4;
- (MCInteractionClient)initWithXPCClientConnection:(id)a3;
- (NSString)defaultStatus;
- (NSXPCConnection)xpcConnection;
- (void)_receivedUserInput:(id)a3 preflight:(BOOL)a4 payloadIndex:(unint64_t)a5 delegate:(id)a6 semaphore:(id)a7 error:(id)a8 outResponses:(id)a9;
- (void)requestManagedRestoreWithManagedAppleID:(id)a3 personaID:(id)a4;
- (void)setDefaultStatus:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)waitForEnrollmentToFinishWithPersonaID:(id)a3;
@end

@implementation MCInteractionClient

- (MCInteractionClient)initWithXPCClientConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MCInteractionClient;
  v5 = [(MCInteractionClient *)&v8 init];
  v6 = v5;
  if (v5) {
    [(MCInteractionClient *)v5 setXpcConnection:v4];
  }

  return v6;
}

- (BOOL)requestUserInput:(id)a3 delegate:(id)a4 outResult:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG)) {
    sub_1000A213C();
  }
  id v10 = objc_alloc_init((Class)NSMutableArray);
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100018E64;
  v29[3] = &unk_1000EB530;
  v11 = dispatch_semaphore_create(0);
  v30 = v11;
  v12 = objc_retainBlock(v29);
  objc_initWeak(&location, self);
  v13 = [(MCInteractionClient *)self xpcConnection];
  v14 = [v13 remoteObjectProxyWithErrorHandler:v12];
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_100018F48;
  v23 = &unk_1000EB558;
  objc_copyWeak(&v27, &location);
  id v15 = v9;
  id v24 = v15;
  v16 = v11;
  v25 = v16;
  id v17 = v10;
  id v26 = v17;
  [v14 doMCICDidRequestUserInput:v8 completion:&v20];

  dispatch_time_t v18 = dispatch_time(0, 900000000000);
  dispatch_semaphore_wait(v16, v18);
  *a5 = [v17 copy:v20, v21, v22, v23];

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

  return 1;
}

- (BOOL)requestMAIDSignIn:(id)a3 personaID:(id)a4 outError:(id *)a5 isCancelled:(BOOL *)a6
{
  id v10 = a3;
  id v11 = a4;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG)) {
    sub_1000A21C4();
  }
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_100019318;
  v42 = sub_100019328;
  id v43 = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 1;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100019330;
  v28[3] = &unk_1000EB530;
  v12 = dispatch_semaphore_create(0);
  v29 = v12;
  v13 = objc_retainBlock(v28);
  v14 = [(MCInteractionClient *)self xpcConnection];
  id v15 = [v14 remoteObjectProxyWithErrorHandler:v13];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100019414;
  v22[3] = &unk_1000EB580;
  id v24 = &v44;
  v25 = &v38;
  id v26 = &v34;
  id v27 = &v30;
  v16 = v12;
  v23 = v16;
  [v15 doMCICDidRequestMAIDSignIn:v10 personaID:v11 completion:v22];

  dispatch_time_t v17 = dispatch_time(0, 900000000000);
  dispatch_semaphore_wait(v16, v17);
  if (*((unsigned char *)v31 + 24))
  {
    dispatch_time_t v18 = _MCLogObjects[8];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "MAID sign in request timed out after 15 mins", v21, 2u);
    }
  }
  if (a5) {
    *a5 = (id) v39[5];
  }
  *a6 = *((unsigned char *)v35 + 24);
  char v19 = *((unsigned char *)v45 + 24);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v19;
}

- (void)requestManagedRestoreWithManagedAppleID:(id)a3 personaID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG)) {
    sub_1000A224C();
  }
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  char v16 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_100019318;
  v13[4] = sub_100019328;
  id v14 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  char v12 = 0;
  id v8 = [(MCInteractionClient *)self xpcConnection];
  id v9 = [v8 remoteObjectProxyWithErrorHandler:&stru_1000EB5A0];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100019748;
  v10[3] = &unk_1000EB5C8;
  v10[4] = v15;
  v10[5] = v13;
  v10[6] = v11;
  [v9 doMCICDidRequestManagedRestoreWithManagedAppleID:v6 personaID:v7 completion:v10];

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(v15, 8);
}

- (void)_receivedUserInput:(id)a3 preflight:(BOOL)a4 payloadIndex:(unint64_t)a5 delegate:(id)a6 semaphore:(id)a7 error:(id)a8 outResponses:(id)a9
{
  BOOL v13 = a4;
  id v15 = a3;
  id v16 = a6;
  dispatch_time_t v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG))
  {
    sub_1000A22D4();
    if (v13) {
      goto LABEL_3;
    }
LABEL_5:
    [v19 addObjectsFromArray:v15];
    dispatch_semaphore_signal(v17);
    goto LABEL_6;
  }
  if (!v13) {
    goto LABEL_5;
  }
LABEL_3:
  id v34 = 0;
  [v16 interactionClient:self didRequestPreflightUserInputResponses:v15 forPayloadIndex:a5 outError:&v34];
  id v20 = v34;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100019AD0;
  v32[3] = &unk_1000EB530;
  uint64_t v21 = v17;
  char v33 = v21;
  v22 = objc_retainBlock(v32);
  objc_initWeak(&location, self);
  v23 = [(MCInteractionClient *)self xpcConnection];
  id v24 = [v23 remoteObjectProxyWithErrorHandler:v22];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100019BB4;
  v26[3] = &unk_1000EB558;
  objc_copyWeak(&v30, &location);
  id v27 = v16;
  v28 = v21;
  id v29 = v19;
  [v24 doMCICDidFinishPreflightWithError:v20 completion:v26];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  id v18 = v25;
LABEL_6:
}

- (BOOL)showUserWarnings:(id)a3 outResult:(BOOL *)a4
{
  id v6 = a3;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG)) {
    sub_1000A235C();
  }
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_100019318;
  id v26 = sub_100019328;
  id v27 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100019EC0;
  v19[3] = &unk_1000EB5F0;
  uint64_t v21 = &v22;
  id v7 = dispatch_semaphore_create(0);
  id v20 = v7;
  id v8 = objc_retainBlock(v19);
  id v9 = [(MCInteractionClient *)self xpcConnection];
  id v10 = [v9 remoteObjectProxyWithErrorHandler:v8];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100019FC4;
  void v15[3] = &unk_1000EB618;
  dispatch_time_t v17 = &v22;
  id v18 = &v28;
  id v11 = v7;
  id v16 = v11;
  [v10 doMCICDidRequestShowUserWarnings:v6 completion:v15];

  dispatch_time_t v12 = dispatch_time(0, 600000000000);
  if (dispatch_semaphore_wait(v11, v12) || v23[5])
  {
    BOOL v13 = 0;
  }
  else
  {
    *a4 = *((unsigned char *)v29 + 24);
    BOOL v13 = 1;
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v13;
}

- (BOOL)didFinishInstallationWithIdentifier:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG)) {
    sub_1000A23E4();
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10001A1E8;
  v17[3] = &unk_1000EB530;
  id v8 = dispatch_semaphore_create(0);
  id v18 = v8;
  id v9 = objc_retainBlock(v17);
  id v10 = [(MCInteractionClient *)self xpcConnection];
  id v11 = [v10 remoteObjectProxyWithErrorHandler:v9];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10001A2CC;
  void v15[3] = &unk_1000EB530;
  id v16 = v8;
  dispatch_time_t v12 = v8;
  [v11 doMCICDidFinishInstallationWithIdentifier:v6 error:v7 completion:v15];

  dispatch_time_t v13 = dispatch_time(0, 10000000);
  dispatch_semaphore_wait(v12, v13);

  return 1;
}

- (BOOL)didUpdateStatus:(id)a3
{
  v5 = (NSString *)a3;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG)) {
    sub_1000A246C();
  }
  objc_storeStrong((id *)&self->_lastStatus, a3);
  if (!v5) {
    v5 = self->_defaultStatus;
  }
  id v6 = [(MCInteractionClient *)self xpcConnection];
  id v7 = [v6 remoteObjectProxyWithErrorHandler:&stru_1000EB638];
  [v7 doMCICDidUpdateStatus:v5 completion:&stru_1000EB638];

  return 1;
}

- (BOOL)didBeginInstallingNextProfileData:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG)) {
    sub_1000A24F4();
  }
  v5 = [(MCInteractionClient *)self xpcConnection];
  id v6 = [v5 remoteObjectProxyWithErrorHandler:&stru_1000EB658];
  [v6 doMCICDidBeginInstallingNextProfileData:v4 completion:&stru_1000EB658];

  return 1;
}

- (BOOL)requestCurrentPasscodeOutPasscode:(id *)a3
{
  if (os_log_type_enabled(_MCLogObjects[8], OS_LOG_TYPE_DEBUG)) {
    sub_1000A257C();
  }
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100019318;
  uint64_t v24 = sub_100019328;
  id v25 = 0;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10001A840;
  v18[3] = &unk_1000EB530;
  v5 = dispatch_semaphore_create(0);
  id v19 = v5;
  id v6 = objc_retainBlock(v18);
  id v7 = [(MCInteractionClient *)self xpcConnection];
  id v8 = [v7 remoteObjectProxyWithErrorHandler:v6];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001A924;
  v14[3] = &unk_1000EB680;
  id v16 = &v26;
  dispatch_time_t v17 = &v20;
  id v9 = v5;
  id v15 = v9;
  [v8 doMCICDidRequestCurrentPasscodeWithCompletion:v14];

  dispatch_time_t v10 = dispatch_time(0, 300000000000);
  dispatch_semaphore_wait(v9, v10);
  int v11 = *((unsigned __int8 *)v27 + 24);
  if (a3 && *((unsigned char *)v27 + 24))
  {
    *a3 = (id) v21[5];
    int v11 = *((unsigned __int8 *)v27 + 24);
  }
  BOOL v12 = v11 != 0;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  return v12;
}

- (void)waitForEnrollmentToFinishWithPersonaID:(id)a3
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001AAD4;
  void v11[3] = &unk_1000EB530;
  id v4 = dispatch_semaphore_create(0);
  BOOL v12 = v4;
  v5 = objc_retainBlock(v11);
  id v6 = [(MCInteractionClient *)self xpcConnection];
  id v7 = [v6 remoteObjectProxyWithErrorHandler:v5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001ABD8;
  v9[3] = &unk_1000EAC80;
  dispatch_time_t v10 = v4;
  id v8 = v4;
  [v7 doMCICWaitForEnrollmentToFinishWithCompletion:v9];

  dispatch_semaphore_wait(v8, 0x4E94914F0000uLL);
}

- (NSString)defaultStatus
{
  return self->_defaultStatus;
}

- (void)setDefaultStatus:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_defaultStatus, a3);
  if (!self->_lastStatus) {
    [(MCInteractionClient *)self didUpdateStatus:self->_defaultStatus];
  }
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_lastStatus, 0);

  objc_storeStrong((id *)&self->_defaultStatus, 0);
}

@end