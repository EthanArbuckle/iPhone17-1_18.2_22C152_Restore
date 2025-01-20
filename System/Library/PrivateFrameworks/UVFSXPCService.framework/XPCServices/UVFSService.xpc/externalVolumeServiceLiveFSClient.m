@interface externalVolumeServiceLiveFSClient
+ (id)newClient;
- (BOOL)sameVolumeAlreadyLoaded:(id)a3 device:(id)a4 withError:(id *)a5;
- (id)getUniqueName:(id)a3 withError:(id *)a4;
- (id)registerNewVolume:(id)a3 listener:(id)a4 device:(id)a5;
@end

@implementation externalVolumeServiceLiveFSClient

+ (id)newClient
{
  return [a1 newConnectionForService:@"machp://com.apple.filesystems.localLiveFiles"];
}

- (id)registerNewVolume:(id)a3 listener:(id)a4 device:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_100020C10;
  v42 = sub_100020C20;
  id v43 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  v12 = *(void **)&self->LiveFSClient_opaque[OBJC_IVAR___LiveFSClient_conn];
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100020C28;
  v35[3] = &unk_100038CE8;
  v37 = &v38;
  v13 = v11;
  v36 = v13;
  v14 = [v12 remoteObjectProxyWithErrorHandler:v35];
  v29 = _NSConcreteStackBlock;
  uint64_t v30 = 3221225472;
  v31 = sub_100020CAC;
  v32 = &unk_100038CE8;
  v34 = &v38;
  v15 = v13;
  v33 = v15;
  [v14 addVolume:v8 listener:v9 description:v10 reply:&v29];
  dispatch_time_t v16 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v15, v16))
  {
    v17 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100027564(v17, v18, v19, v20, v21, v22, v23, v24);
    }
    uint64_t v25 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 60, 0, v29, v30, v31, v32);
    v26 = (void *)v39[5];
    v39[5] = v25;
  }
  id v27 = (id)v39[5];

  _Block_object_dispose(&v38, 8);

  return v27;
}

- (id)getUniqueName:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = sub_100020C10;
  v42 = sub_100020C20;
  id v43 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100020C10;
  v36 = sub_100020C20;
  id v37 = 0;
  id v8 = *(void **)&self->LiveFSClient_opaque[OBJC_IVAR___LiveFSClient_conn];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100020FF8;
  v29[3] = &unk_100038CE8;
  v31 = &v38;
  id v9 = v7;
  uint64_t v30 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v29];
  if (a4) {
    *a4 = 0;
  }
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10002107C;
  v25[3] = &unk_100038D10;
  id v27 = &v32;
  v28 = &v38;
  dispatch_semaphore_t v11 = v9;
  v26 = v11;
  [v10 uniqueNameForName:v6 reply:v25];
  dispatch_time_t v12 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v11, v12))
  {
    v13 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10002768C(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    uint64_t v21 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:60 userInfo:0];
    uint64_t v22 = (void *)v39[5];
    v39[5] = v21;
  }
  if (a4) {
    *a4 = (id) v39[5];
  }
  id v23 = (id)v33[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  return v23;
}

- (BOOL)sameVolumeAlreadyLoaded:(id)a3 device:(id)a4 withError:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x3032000000;
  v50 = sub_100020C10;
  v51 = sub_100020C20;
  id v52 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_100020C10;
  v45 = sub_100020C20;
  id v46 = 0;
  dispatch_semaphore_t v11 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10002798C(v11);
  }
  dispatch_time_t v12 = *(void **)&self->LiveFSClient_opaque[OBJC_IVAR___LiveFSClient_conn];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000214EC;
  v38[3] = &unk_100038CE8;
  uint64_t v40 = &v47;
  v13 = v10;
  v39 = v13;
  uint64_t v14 = [v12 remoteObjectProxyWithErrorHandler:v38];
  uint64_t v32 = _NSConcreteStackBlock;
  uint64_t v33 = 3221225472;
  uint64_t v34 = sub_100021570;
  v35 = &unk_100038D38;
  id v37 = &v41;
  uint64_t v15 = v13;
  v36 = v15;
  [v14 listVolumes:&v32];
  dispatch_time_t v16 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v15, v16))
  {
    uint64_t v17 = userfs_log_default;
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100027954(v17, v18, v19, v20, v21, v22, v23, v24);
      if (!a5)
      {
LABEL_7:
        if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
          sub_1000278C8();
        }
LABEL_21:
        BOOL v30 = 0;
        goto LABEL_22;
      }
    }
    else if (!a5)
    {
      goto LABEL_7;
    }
    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 60, 0, v32, v33, v34, v35);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  uint64_t v25 = (void *)v48[5];
  if (v25)
  {
    if (a5) {
      *a5 = v25;
    }
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10002783C();
    }
    goto LABEL_21;
  }
  v26 = objc_msgSend((id)v42[5], "objectForKeyedSubscript:", v8, v32, v33, v34, v35);
  if (!v26
    || ([(id)v42[5] objectForKeyedSubscript:v8],
        id v27 = objc_claimAutoreleasedReturnValue(),
        unsigned int v28 = [v27 isEqual:v9],
        v27,
        v26,
        !v28))
  {
    if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100027730();
    }
    goto LABEL_21;
  }
  v29 = userfs_log_default;
  if (os_log_type_enabled((os_log_t)userfs_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_1000277B8(v29);
  }
  BOOL v30 = 1;
LABEL_22:

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

  return v30;
}

@end