@interface VolumeManagerDelegate
- (id)childConnectionForDevice:(id)a3;
- (void)LiveMountService:(id)a3 addDisk:(id)a4 fileSystemType:(id)a5 reply:(id)a6;
- (void)LiveMountService:(id)a3 addVolume:(id)a4 atServer:(id)a5 credentialType:(int64_t)a6 credential:(id)a7 reply:(id)a8;
- (void)LiveMountService:(id)a3 ejectDisk:(id)a4 usingFlags:(unsigned int)a5 reply:(id)a6;
- (void)LiveMountService:(id)a3 ejectVolume:(id)a4 named:(id)a5 withFlags:(unsigned int)a6 reply:(id)a7;
- (void)LiveMountService:(id)a3 ejectVolumeCluster:(id)a4 withFlags:(unsigned int)a5 reply:(id)a6;
- (void)LiveMountService:(id)a3 sharesAtServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6 reply:(id)a7;
- (void)LiveMountService:(id)a3 unlockVolume:(id)a4 password:(id)a5 saveToKeychain:(BOOL)a6 completionHandler:(id)a7;
- (void)handleInvalidation:(id)a3 fileSystemType:(id)a4 service:(id)a5;
@end

@implementation VolumeManagerDelegate

- (void)handleInvalidation:(id)a3 fileSystemType:(id)a4 service:(id)a5
{
  id v5 = a3;
  v6 = qword_10000D6C0;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Connection Interrupted for UVFSService UUID: %@", buf, 0xCu);
  }
  v7 = qword_10000D6B8;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002888;
  block[3] = &unk_1000082C0;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

- (void)LiveMountService:(id)a3 addDisk:(id)a4 fileSystemType:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v38 = (void (**)(id, uint64_t, void))a6;
  v13 = objc_opt_new();
  uint64_t v70 = 0;
  v71 = &v70;
  uint64_t v72 = 0x2020000000;
  int v73 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  uint64_t v64 = 0;
  v65 = &v64;
  uint64_t v66 = 0x3032000000;
  v67 = sub_100002C24;
  v68 = sub_100002C34;
  id v69 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x3032000000;
  v61 = sub_100002C24;
  v62 = sub_100002C34;
  id v63 = 0;
  v15 = qword_10000D6C0;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v75 = v11;
    __int16 v76 = 2112;
    id v77 = v12;
    __int16 v78 = 2112;
    v79 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "liveFSService:delegate:addDisk:%@:fileSystemType:%@:start:%@", buf, 0x20u);
  }
  id v16 = [objc_alloc((Class)NSXPCConnection) initWithServiceName:@"com.apple.filesystems.lifs.userfsd.UVFSService"];
  v17 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UVFSServiceProtocol];
  [v16 setRemoteObjectInterface:v17];

  v18 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UVFSServiceCallbackProtocol];
  [v16 setExportedInterface:v18];

  v19 = objc_alloc_init(UVFSServiceNotifciations);
  [v16 setExportedObject:v19];

  [v16 _setUUID:v13];
  objc_initWeak(&location, self);
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100003494;
  v52[3] = &unk_1000082E8;
  objc_copyWeak(&v56, &location);
  id v20 = v13;
  id v53 = v20;
  id v21 = v12;
  id v54 = v21;
  id v37 = v10;
  id v55 = v37;
  [v16 setInterruptionHandler:v52];
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1000034EC;
  v50[3] = &unk_1000082C0;
  id v22 = v11;
  id v51 = v22;
  [v16 setInvalidationHandler:v50];
  id v23 = [[ChildProcess alloc] initForDevice:v22 withConnection:v16];
  [v23 setUUID:v20];
  id v24 = (id)qword_10000D6A8;
  objc_sync_enter(v24);
  [(id)qword_10000D6A8 setObject:v23 forKeyedSubscript:v22];
  objc_sync_exit(v24);

  [v16 resume];
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100003538;
  v47[3] = &unk_100008310;
  v49 = &v64;
  v25 = v14;
  v48 = v25;
  v26 = [v16 remoteObjectProxyWithErrorHandler:v47];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000035BC;
  v43[3] = &unk_100008338;
  v45 = &v64;
  v46 = &v70;
  v27 = v25;
  v44 = v27;
  [v26 startUp:v43];
  dispatch_time_t v28 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v27, v28))
  {
    uint64_t v29 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:60 userInfo:0];
    v30 = (void *)v65[5];
    v65[5] = v29;
  }
  if (v65[5])
  {
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR)) {
      sub_100004CEC();
    }
    v38[2](v38, v65[5], 0);
  }
  else
  {
    [v23 setPid:*((unsigned int *)v71 + 6)];
    v31 = qword_10000D6C0;
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "liveFSService:delegate:addDisk:XPCService:startup:done", buf, 2u);
    }
    if (byte_10000D698) {
      uint64_t v32 = 3;
    }
    else {
      uint64_t v32 = 2;
    }
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100003638;
    v39[3] = &unk_100008360;
    v41 = &v64;
    v42 = &v58;
    v33 = v27;
    v40 = v33;
    [v26 createVolumesForTheDevice:v22 fsType:v21 how:v32 withReply:v39];
    dispatch_semaphore_wait(v33, 0xFFFFFFFFFFFFFFFFLL);
    v34 = qword_10000D6C0;
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEFAULT))
    {
      v35 = (void *)v65[5];
      uint64_t v36 = v59[5];
      *(_DWORD *)buf = 138413058;
      id v75 = v22;
      __int16 v76 = 2112;
      id v77 = v21;
      __int16 v78 = 2112;
      v79 = v35;
      __int16 v80 = 2112;
      uint64_t v81 = v36;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "liveFSService:delegate:addDisk:%@:fileSystemType:%@:finish:%@,%@", buf, 0x2Au);
    }
    v38[2](v38, v65[5], v59[5]);
  }
  objc_destroyWeak(&v56);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&v70, 8);
}

- (id)childConnectionForDevice:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEBUG)) {
    sub_100004EA8();
  }
  id v4 = (id)qword_10000D6A8;
  objc_sync_enter(v4);
  id v5 = [(id)qword_10000D6A8 objectForKeyedSubscript:v3];
  objc_sync_exit(v4);

  v6 = qword_10000D6C0;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEBUG)) {
    sub_100004E28((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
  }

  return v5;
}

- (void)LiveMountService:(id)a3 ejectDisk:(id)a4 usingFlags:(unsigned int)a5 reply:(id)a6
{
  id v25 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a6;
  id v11 = v9;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  v38 = sub_100002C24;
  v39 = sub_100002C34;
  id v40 = 0;
  uint64_t v12 = qword_10000D6C0;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v42 = "-[VolumeManagerDelegate LiveMountService:ejectDisk:usingFlags:reply:]";
    __int16 v43 = 2112;
    id v44 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s:%@:start", buf, 0x16u);
  }
  id v13 = (id)qword_10000D6A8;
  objc_sync_enter(v13);
  dispatch_semaphore_t v14 = [(id)qword_10000D6A8 objectForKeyedSubscript:v11];
  objc_sync_exit(v13);

  if (v14)
  {
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    id v16 = [v14 helper];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100003C54;
    v32[3] = &unk_100008310;
    v34 = &v35;
    v17 = v15;
    v33 = v17;
    v18 = [v16 remoteObjectProxyWithErrorHandler:v32];

    uint64_t v19 = a5;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100003CB4;
    v29[3] = &unk_100008310;
    v31 = &v35;
    id v20 = v17;
    v30 = v20;
    [v18 ejectVolumesForDevice:v11 how:v19 withReply:v29];
    dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
    if ([(id)v36[5] code] == (id)16)
    {
      if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEBUG)) {
        sub_100005038();
      }
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100003D14;
      v26[3] = &unk_100008310;
      dispatch_time_t v28 = &v35;
      id v21 = v20;
      v27 = v21;
      [v18 ejectVolumesForDevice:v11 how:7 withReply:v26];
      dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
      if (v36[5] && os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR)) {
        sub_100004FB4();
      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR)) {
      sub_100004F30();
    }
    uint64_t v22 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:19 userInfo:0];
    v18 = (void *)v36[5];
    v36[5] = v22;
  }

  id v23 = qword_10000D6C0;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = v36[5];
    *(_DWORD *)buf = 136315650;
    v42 = "-[VolumeManagerDelegate LiveMountService:ejectDisk:usingFlags:reply:]";
    __int16 v43 = 2112;
    id v44 = v11;
    __int16 v45 = 2112;
    uint64_t v46 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s:%@:finish:%@", buf, 0x20u);
  }
  v10[2](v10, v36[5]);

  _Block_object_dispose(&v35, 8);
}

- (void)LiveMountService:(id)a3 ejectVolume:(id)a4 named:(id)a5 withFlags:(unsigned int)a6 reply:(id)a7
{
  id v25 = a3;
  id v24 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(id, void))a7;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = sub_100002C24;
  uint64_t v36 = sub_100002C34;
  id v37 = 0;
  id v13 = qword_10000D6C0;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[VolumeManagerDelegate LiveMountService:ejectVolume:named:withFlags:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s:%@:start", buf, 0x16u);
  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000041F8;
  v31[3] = &unk_100008388;
  v31[4] = &v32;
  [v25 listVolumes:v31];
  dispatch_semaphore_t v14 = [(id)v33[5] objectForKeyedSubscript:v11];
  if (v14)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = (id)v33[5];
    id v16 = [v15 countByEnumeratingWithState:&v27 objects:v42 count:16];
    unsigned int v23 = a6;
    int v17 = 0;
    if (v16)
    {
      uint64_t v18 = *(void *)v28;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = [(id)v33[5] objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * i)];
          unsigned int v21 = [v20 isEqualToString:v14];

          v17 += v21;
        }
        id v16 = [v15 countByEnumeratingWithState:&v27 objects:v42 count:16];
      }
      while (v16);
    }

    if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEBUG)) {
      sub_10000518C();
    }
    if (v17 == 1)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v39 = sub_100002C24;
      id v40 = sub_100002C34;
      id v41 = 0;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000424C;
      v26[3] = &unk_1000083B0;
      void v26[4] = buf;
      [v25 ejectDisk:v14 usingFlags:v23 reply:v26];
      if (*(void *)(*(void *)&buf[8] + 40))
      {
        if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_ERROR)) {
          sub_100005124();
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEBUG))
      {
        sub_1000050B0();
      }
      _Block_object_dispose(buf, 8);
    }
  }
  uint64_t v22 = qword_10000D6C0;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[VolumeManagerDelegate LiveMountService:ejectVolume:named:withFlags:reply:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s:%@:finish", buf, 0x16u);
  }
  v12[2](v12, 0);

  _Block_object_dispose(&v32, 8);
}

- (void)LiveMountService:(id)a3 ejectVolumeCluster:(id)a4 withFlags:(unsigned int)a5 reply:(id)a6
{
  id v7 = a6;
  id v8 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
  (*((void (**)(id, id))a6 + 2))(v7, v8);
}

- (void)LiveMountService:(id)a3 addVolume:(id)a4 atServer:(id)a5 credentialType:(int64_t)a6 credential:(id)a7 reply:(id)a8
{
  id v9 = a8;
  id v10 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
  (*((void (**)(id, id))a8 + 2))(v9, v10);
}

- (void)LiveMountService:(id)a3 sharesAtServer:(id)a4 credentialType:(int64_t)a5 credential:(id)a6 reply:(id)a7
{
  id v8 = a7;
  id v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:45 userInfo:0];
  (*((void (**)(id, void, id))a7 + 2))(v8, 0, v9);
}

- (void)LiveMountService:(id)a3 unlockVolume:(id)a4 password:(id)a5 saveToKeychain:(BOOL)a6 completionHandler:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = qword_10000D6C0;
  if (os_log_type_enabled((os_log_t)qword_10000D6C0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v28 = "-[VolumeManagerDelegate LiveMountService:unlockVolume:password:saveToKeychain:completionHandler:]";
    __int16 v29 = 2112;
    id v30 = v13;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s:%@:start", buf, 0x16u);
  }
  int v17 = [v12 descriptionForVolume:v13];
  if (v17
    && ([(VolumeManagerDelegate *)self childConnectionForDevice:v17],
        (uint64_t v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v19 = v18;
    id v20 = [v18 helper];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100004674;
    v25[3] = &unk_1000083D8;
    id v21 = v15;
    id v26 = v21;
    uint64_t v22 = [v20 remoteObjectProxyWithErrorHandler:v25];

    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100004684;
    v23[3] = &unk_1000083D8;
    id v24 = v21;
    [v22 unlockVolume:v13 password:v14 saveToKeychain:v8 completionHandler:v23];
  }
  else
  {
    uint64_t v19 = getNSErrorFromLiveFSErrno();
    (*((void (**)(id, void *))v15 + 2))(v15, v19);
  }
}

@end