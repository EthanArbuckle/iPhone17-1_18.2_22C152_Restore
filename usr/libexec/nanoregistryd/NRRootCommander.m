@interface NRRootCommander
+ (BOOL)_supportsWatchCompanionCapability;
- (NRRootCommander)init;
- (id)_daemonConnection;
- (id)_daemonProxyWithErrorString:(id)a3 withErrorHandler:(id)a4;
- (id)_enableNanoDaemons:(unint64_t)a3 didEnable:(BOOL *)a4;
- (id)_getLocalPairingStorePairingID:(id)a3;
- (id)_syncDaemonProxyWithErrorString:(id)a3 withErrorHandler:(id)a4;
- (id)backupHash;
- (id)enableNanoDaemons:(unint64_t)a3 didEnable:(BOOL *)a4;
- (void)_deletePairedStoreWithUUID:(id)a3 withQueue:(id)a4 withCompletion:(id)a5;
- (void)_initialize;
- (void)checkIfFlaggedForRecoveryWithQueue:(id)a3 completion:(id)a4;
- (void)cleanupPairedStoreWithUUIDs:(id)a3 withIndex:(unint64_t)a4 withQueue:(id)a5 withCompletion:(id)a6;
- (void)clearRecoveryFlagWithQueue:(id)a3 completion:(id)a4;
- (void)deletePairedStoreWithUUID:(id)a3 withQueue:(id)a4 withCompletion:(id)a5;
- (void)deleteQuarantinedDataWithStoreUUID:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)quarantineDataWithStoreUUID:(id)a3 services:(id)a4 queue:(id)a5 completion:(id)a6;
- (void)unquarantineDataWithStoreUUID:(id)a3 services:(id)a4 queue:(id)a5 completion:(id)a6;
@end

@implementation NRRootCommander

- (NRRootCommander)init
{
  v5.receiver = self;
  v5.super_class = (Class)NRRootCommander;
  v2 = [(NRRootCommander *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NRRootCommander *)v2 _initialize];
  }
  return v3;
}

+ (BOOL)_supportsWatchCompanionCapability
{
  if (qword_1001A1160 != -1) {
    dispatch_once(&qword_1001A1160, &stru_100167908);
  }
  return byte_1001A1158;
}

- (void)_initialize
{
  if (qword_1001A1168 != -1) {
    dispatch_once(&qword_1001A1168, &stru_100167928);
  }
}

- (id)_daemonConnection
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100056D30;
  block[3] = &unk_1001655F8;
  block[4] = self;
  if (qword_1001A1180 != -1) {
    dispatch_once(&qword_1001A1180, block);
  }
  return (id)qword_1001A1178;
}

- (id)_daemonProxyWithErrorString:(id)a3 withErrorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NRRootCommander *)self _daemonConnection];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100056FCC;
  v13[3] = &unk_1001678C0;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = [v8 remoteObjectProxyWithErrorHandler:v13];

  return v11;
}

- (id)_syncDaemonProxyWithErrorString:(id)a3 withErrorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(NRRootCommander *)self _daemonConnection];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100057154;
  v13[3] = &unk_1001678C0;
  id v14 = v6;
  id v15 = v7;
  id v9 = v7;
  id v10 = v6;
  v11 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v13];

  return v11;
}

- (id)enableNanoDaemons:(unint64_t)a3 didEnable:(BOOL *)a4
{
  return [(NRRootCommander *)self _enableNanoDaemons:a3 didEnable:a4];
}

- (id)_enableNanoDaemons:(unint64_t)a3 didEnable:(BOOL *)a4
{
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_1000576CC;
  v29 = sub_1000576DC;
  id v30 = 0;
  if (![(id)objc_opt_class() _supportsWatchCompanionCapability])
  {
    id v15 = nr_daemon_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (!v16) {
      goto LABEL_23;
    }
    id v7 = nr_daemon_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Skipping NanoLaunchDaemon setup because platform doesn't support NLDs", (uint8_t *)&buf, 2u);
    }
    goto LABEL_22;
  }
  id v7 = [(id)qword_1001A1170 objectForKeyedSubscript:@"daemonsEnabled"];
  unsigned int v8 = [v7 integerValue];
  id v9 = nr_daemon_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    v11 = nr_daemon_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "prefs value: %d", (uint8_t *)&buf, 8u);
    }
  }
  if ((v8 == 0) == v8 < 4)
  {
    if (v8) {
      goto LABEL_9;
    }
LABEL_16:
    v17 = nr_daemon_log();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      v19 = nr_daemon_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [&off_100177B80 objectAtIndexedSubscript:a3];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ NanoLaunchDaemons", (uint8_t *)&buf, 0xCu);
      }
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000576E4;
    v24[3] = &unk_1001657F0;
    v24[4] = &v25;
    id v14 = [(NRRootCommander *)self _syncDaemonProxyWithErrorString:@"setting nano daemon state" withErrorHandler:v24];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v36 = 0x3032000000;
    v37 = sub_1000576CC;
    v38 = sub_1000576DC;
    id v39 = +[NROSTransaction transactionWithName:@"daemons"];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100057798;
    v23[3] = &unk_100167990;
    v23[4] = &v31;
    v23[5] = &v25;
    v23[6] = &buf;
    v23[7] = a3;
    [v14 xpcEnableNanoDaemons:a3 withCompletion:v23];
    _Block_object_dispose(&buf, 8);

    goto LABEL_21;
  }
  if (!v8 || v8 - 1 != a3) {
    goto LABEL_16;
  }
LABEL_9:
  v12 = nr_daemon_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    id v14 = nr_daemon_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping NanoLaunchDaemon setup because already set", (uint8_t *)&buf, 2u);
    }
LABEL_21:
  }
LABEL_22:

LABEL_23:
  if (a4) {
    *a4 = *((unsigned char *)v32 + 24);
  }
  id v21 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);

  return v21;
}

- (void)deletePairedStoreWithUUID:(id)a3 withQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = dispatch_get_global_queue(25, 0);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100057A08;
  v15[3] = &unk_1001666B8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

- (void)_deletePairedStoreWithUUID:(id)a3 withQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = nr_daemon_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    id v13 = nr_daemon_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v8 UUIDString];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "deleting paired store %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  if ([(id)objc_opt_class() _supportsWatchCompanionCapability])
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100057DC4;
    v29[3] = &unk_100165A70;
    id v15 = v10;
    id v31 = v15;
    id v16 = v9;
    id v30 = v16;
    id v17 = [(NRRootCommander *)self _daemonProxyWithErrorString:@"deleting paired store" withErrorHandler:v29];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v33 = 0x3032000000;
    char v34 = sub_1000576CC;
    v35 = sub_1000576DC;
    id v36 = +[NROSTransaction transactionWithName:@"delete"];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100057F34;
    v25[3] = &unk_1001679B8;
    id v27 = v15;
    v26 = v16;
    p_long long buf = &buf;
    [v17 xpcDeletePairedStoreWithUUID:v8 withCompletion:v25];

    _Block_object_dispose(&buf, 8);
    id v18 = v31;
  }
  else
  {
    v19 = +[NSFileManager defaultManager];
    v20 = [(NRRootCommander *)self _getLocalPairingStorePairingID:v8];
    id v24 = 0;
    [v19 removeItemAtPath:v20 error:&v24];
    id v18 = v24;

    if (v10)
    {
      if (v9)
      {
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10005802C;
        v21[3] = &unk_100165A70;
        id v23 = v10;
        id v18 = v18;
        id v22 = v18;
        dispatch_async(v9, v21);
      }
      else
      {
        (*((void (**)(id, id))v10 + 2))(v10, v18);
      }
    }
  }
}

- (id)_getLocalPairingStorePairingID:(id)a3
{
  id v3 = a3;
  v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  objc_super v5 = [v4 objectAtIndex:0];
  id v6 = [v5 stringByAppendingPathComponent:@"DeviceRegistry"];

  if (v3)
  {
    id v7 = [v3 UUIDString];
    uint64_t v8 = [v6 stringByAppendingPathComponent:v7];

    id v6 = (void *)v8;
  }

  return v6;
}

- (void)cleanupPairedStoreWithUUIDs:(id)a3 withIndex:(unint64_t)a4 withQueue:(id)a5 withCompletion:(id)a6
{
  id v10 = a3;
  v11 = a5;
  id v12 = a6;
  id v13 = nr_daemon_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    id v15 = nr_daemon_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "cleaning up paired stores except %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
  if ([(id)objc_opt_class() _supportsWatchCompanionCapability])
  {
    id v16 = [(id)qword_1001A1170 objectForKeyedSubscript:@"cleanupIndex"];
    id v17 = (char *)[v16 unsignedLongLongValue];
    id v18 = nr_daemon_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      v20 = nr_daemon_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v17;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "token value: %lld", (uint8_t *)&buf, 0xCu);
      }
    }
    if (v17 - 1 != (char *)a4 || v17 == 0)
    {
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1000585FC;
      v37[3] = &unk_100165A70;
      id v21 = v12;
      id v39 = v21;
      id v22 = v11;
      v38 = v22;
      id v23 = [(NRRootCommander *)self _daemonProxyWithErrorString:@"cleaning up paired stores" withErrorHandler:v37];
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v41 = 0x3032000000;
      v42 = sub_1000576CC;
      v43 = sub_1000576DC;
      id v44 = +[NROSTransaction transactionWithName:@"cleanup"];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_10005876C;
      v32[3] = &unk_1001679E0;
      unint64_t v36 = a4;
      id v34 = v21;
      uint64_t v33 = v22;
      p_long long buf = &buf;
      [v23 xpcCleanupPairingStoreWithUUIDs:v10 withCompletion:v32];

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      id v24 = nr_daemon_log();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        v26 = nr_daemon_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Skipping cleanup, looks like we've already completed it", (uint8_t *)&buf, 2u);
        }
      }
      if (v12)
      {
        if (v11)
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000588F4;
          block[3] = &unk_100165D10;
          id v31 = v12;
          dispatch_async(v11, block);
        }
        else
        {
          (*((void (**)(id, void))v12 + 2))(v12, 0);
        }
      }
    }
  }
  else if (v12)
  {
    if (v11)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100058908;
      v28[3] = &unk_100165D10;
      id v29 = v12;
      dispatch_async(v11, v28);
    }
    else
    {
      id v27 = nrGetPairingError();
      (*((void (**)(id, void *))v12 + 2))(v12, v27);
    }
  }
}

- (void)quarantineDataWithStoreUUID:(id)a3 services:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(id)objc_opt_class() _supportsWatchCompanionCapability])
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100058BF0;
    v26[3] = &unk_100165A70;
    id v14 = v13;
    id v28 = v14;
    id v15 = v12;
    id v27 = v15;
    id v16 = [(NRRootCommander *)self _daemonProxyWithErrorString:@"quarantining data" withErrorHandler:v26];
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = sub_1000576CC;
    v24[4] = sub_1000576DC;
    id v25 = +[NROSTransaction transactionWithName:@"quarantining"];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100058D34;
    v20[3] = &unk_1001679B8;
    id v22 = v14;
    id v21 = v15;
    id v23 = v24;
    [v16 xpcQuarantineDataWithStoreUUID:v10 services:v11 completion:v20];
    id v17 = &v28;

    _Block_object_dispose(v24, 8);
LABEL_5:

    goto LABEL_6;
  }
  if (v13)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100058E64;
    v18[3] = &unk_100165D10;
    id v17 = &v19;
    id v19 = v13;
    dispatch_async(v12, v18);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)unquarantineDataWithStoreUUID:(id)a3 services:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(id)objc_opt_class() _supportsWatchCompanionCapability])
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10005914C;
    v26[3] = &unk_100165A70;
    id v14 = v13;
    id v28 = v14;
    id v15 = v12;
    id v27 = v15;
    id v16 = [(NRRootCommander *)self _daemonProxyWithErrorString:@"unquarantining data" withErrorHandler:v26];
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = sub_1000576CC;
    v24[4] = sub_1000576DC;
    id v25 = +[NROSTransaction transactionWithName:@"unquarantining"];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100059290;
    v20[3] = &unk_1001679B8;
    id v22 = v14;
    id v21 = v15;
    id v23 = v24;
    [v16 xpcUnquarantineDataWithStoreUUID:v10 services:v11 completion:v20];
    id v17 = &v28;

    _Block_object_dispose(v24, 8);
LABEL_5:

    goto LABEL_6;
  }
  if (v13)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000593C0;
    v18[3] = &unk_100165D10;
    id v17 = &v19;
    id v19 = v13;
    dispatch_async(v12, v18);
    goto LABEL_5;
  }
LABEL_6:
}

- (void)deleteQuarantinedDataWithStoreUUID:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(id)objc_opt_class() _supportsWatchCompanionCapability])
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100059694;
    v23[3] = &unk_100165A70;
    id v11 = v10;
    id v25 = v11;
    id v12 = v9;
    id v24 = v12;
    id v13 = [(NRRootCommander *)self _daemonProxyWithErrorString:@"deleting quarantined data" withErrorHandler:v23];
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = sub_1000576CC;
    void v21[4] = sub_1000576DC;
    id v22 = +[NROSTransaction transactionWithName:@"deletingQ"];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100059788;
    v17[3] = &unk_100167A08;
    id v19 = v11;
    id v18 = v12;
    v20 = v21;
    [v13 xpcDeleteQuarantinedDataWithStoreUUID:v8 completion:v17];
    id v14 = &v25;

    _Block_object_dispose(v21, 8);
LABEL_5:

    goto LABEL_6;
  }
  if (v10)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100059840;
    v15[3] = &unk_100165D10;
    id v14 = &v16;
    id v16 = v10;
    dispatch_async(v9, v15);
    goto LABEL_5;
  }
LABEL_6:
}

- (id)backupHash
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_1000576CC;
  id v25 = sub_1000576DC;
  id v26 = 0;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  if ([(id)objc_opt_class() _supportsWatchCompanionCapability])
  {
    id v3 = [(NRRootCommander *)self _daemonConnection];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100059BEC;
    v16[3] = &unk_100167A30;
    v16[4] = &v17;
    v4 = [v3 synchronousRemoteObjectProxyWithErrorHandler:v16];

    if (v4)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v28 = 0x3032000000;
      id v29 = sub_1000576CC;
      id v30 = sub_1000576DC;
      id v31 = +[NROSTransaction transactionWithName:@"backupHash"];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100059C7C;
      v15[3] = &unk_100167A58;
      void v15[4] = &v17;
      void v15[5] = &v21;
      v15[6] = &buf;
      [v4 xpcGetBackupHashWithCompletion:v15];
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      *((unsigned char *)v18 + 24) = 1;
    }
  }
  if (*((unsigned char *)v18 + 24))
  {
    objc_super v5 = nr_daemon_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      id v7 = nr_daemon_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Recursing due to xpc failure", (uint8_t *)&buf, 2u);
      }
    }
    sleep(1u);
    id v8 = [(NRRootCommander *)self backupHash];
  }
  else
  {
    id v9 = nr_daemon_log();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      id v11 = nr_daemon_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = v22[5];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Returning backupHash %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v8 = (id)v22[5];
  }
  id v13 = v8;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (void)checkIfFlaggedForRecoveryWithQueue:(id)a3 completion:(id)a4
{
  id v5 = a4;
  BOOL v6 = v5;
  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100059DD8;
    block[3] = &unk_100165D10;
    id v8 = v5;
    dispatch_async((dispatch_queue_t)a3, block);
  }
}

- (void)clearRecoveryFlagWithQueue:(id)a3 completion:(id)a4
{
  id v5 = a4;
  BOOL v6 = v5;
  if (v5)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100059E88;
    block[3] = &unk_100165D10;
    id v8 = v5;
    dispatch_async((dispatch_queue_t)a3, block);
  }
}

@end