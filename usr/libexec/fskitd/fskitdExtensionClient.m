@interface fskitdExtensionClient
+ (void)closeResource:(id)a3 andRevoke:(BOOL)a4;
+ (void)postTaskStatusUpdate:(id)a3;
- (fskitdExtensionInstance)ourInstance;
- (void)closeResource:(id)a3 replyHandler:(id)a4;
- (void)configureUserClient:(id)a3 replyHandler:(id)a4;
- (void)isVolumeIDUsed:(id)a3 bundle:(id)a4 replyHandler:(id)a5;
- (void)revokeResource:(id)a3 replyHandler:(id)a4;
- (void)setOurInstance:(id)a3;
- (void)taskStatusUpdate:(id)a3;
- (void)terminateExtension;
- (void)wipeResource:(id)a3 replyHandler:(id)a4;
@end

@implementation fskitdExtensionClient

+ (void)postTaskStatusUpdate:(id)a3
{
  id v3 = a3;
  v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [v3 taskID];
    unsigned int v6 = [v3 taskState];
    v7 = [v3 taskPurpose];
    *(_DWORD *)buf = 138412802;
    v42 = v5;
    __int16 v43 = 1024;
    unsigned int v44 = v6;
    __int16 v45 = 2112;
    v46 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Got task update id %@ state %d purpose %@", buf, 0x1Cu);
  }
  id v8 = v3;
  v9 = [(id)qword_100060740 tasks];
  objc_sync_enter(v9);
  v10 = [(id)qword_100060740 tasks];
  v11 = [v8 taskID];
  v12 = [v10 objectForKey:v11];

  if (v12)
  {
    id v13 = [v8 taskState];
    v14 = [v8 taskErrorState];
    v15 = [v12 updatedDescriptionInState:v13 error:v14];

    v16 = [(id)qword_100060740 tasks];
    v17 = [v8 taskID];
    [v16 setObject:v15 forKey:v17];
  }
  else
  {
    v16 = fskit_std_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v18 = [v8 taskID];
      sub_10003DED8(v18, buf, v16);
    }
    v15 = v8;
  }

  objc_sync_exit(v9);
  if (v12)
  {
    v19 = [v8 taskResource];
    if (v19)
    {
      v20 = [v8 taskResource];
      BOOL v21 = [v20 kind] == (id)1;

      if (v21)
      {
        v22 = [v8 taskResource];
        v23 = +[FSBlockDeviceResource dynamicCast:v22];

        if (v23)
        {
          v19 = [v23 BSDName];
        }
        else
        {
          v19 = 0;
        }
      }
      else
      {
        v19 = 0;
      }
    }
    if ([v8 taskState] == 3)
    {
      v24 = (void *)qword_100060740;
      v25 = [v15 taskID];
      [v24 removeReferencesToTask:v25];

      [(id)qword_100060740 taskSetChanged];
      if (v19)
      {
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100017D54;
        v38[3] = &unk_100059460;
        id v39 = v8;
        id v40 = v19;
        +[fskitdDAOperations setFSKitAdditions:0 disk:v40 replyHandler:v38];

        v26 = v39;
LABEL_23:
      }
    }
    else if (v19)
    {
      v26 = +[NSMutableDictionary dictionary];
      v27 = [v8 taskID];
      v28 = [v27 description];
      [v26 setObject:v28 forKeyedSubscript:FSDADiskTaskIDKey];

      v29 = [v8 taskPurpose];
      [v26 setObject:v29 forKeyedSubscript:FSDADiskTaskPurposeKey];

      v30 = [v8 taskBundleID];
      [v26 setObject:v30 forKeyedSubscript:FSDADiskTaskBundleIDKey];

      v31 = [v8 taskExtensionInstanceID];
      v32 = [v31 description];
      [v26 setObject:v32 forKeyedSubscript:FSDADiskTaskExtensionInstanceKey];

      unsigned int v33 = [v8 taskState];
      if (v33 <= 3) {
        [v26 setObject:*(void *)*(&off_1000594C8 + (char)v33) forKeyedSubscript:FSDADiskTaskStateKey];
      }
      +[fskitdDAOperations setFSKitAdditions:v26 disk:v19 replyHandler:&stru_100059480];
      goto LABEL_23;
    }
    v34 = [(id)qword_100060740 taskUpdateClients];
    objc_sync_enter(v34);
    v35 = [(id)qword_100060740 taskUpdateClients];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_100017DEC;
    v36[3] = &unk_1000594A8;
    id v37 = v15;
    [v35 enumerateObjectsUsingBlock:v36];

    objc_sync_exit(v34);
  }
}

+ (void)closeResource:(id)a3 andRevoke:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  unsigned int v6 = fskit_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10003DF30(v5);
  }

  v7 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v7);
  id v8 = [(id)qword_100060740 resourceManager];
  [v8 removeResource:v5];

  objc_sync_exit(v7);
  if (v4)
  {
    [v5 revoke];
  }
  else
  {
    v9 = +[FSBlockDeviceResource dynamicCast:v5];
    v10 = v9;
    if (v9) {
      [v9 terminate];
    }
  }
}

- (void)terminateExtension
{
}

- (void)taskStatusUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(id)qword_100060740 tasks];
  objc_sync_enter(v5);
  unsigned int v6 = [(id)qword_100060740 tasks];
  v7 = [v4 taskID];
  id v8 = [v6 objectForKey:v7];

  objc_sync_exit(v5);
  if (!v8)
  {
    v17 = fskit_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10003DFC4(v4);
    }
    goto LABEL_14;
  }
  v9 = [v4 taskExtensionInstanceID];
  p_ourInstance = &self->_ourInstance;
  v11 = [(fskitdExtensionInstance *)self->_ourInstance instanceID];
  v12 = [v11 fs_containerIdentifier];
  unsigned __int8 v13 = [v9 isEqual:v12];

  if ((v13 & 1) == 0)
  {
    v17 = fskit_std_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_10003E0EC(v4, (id *)p_ourInstance, v17);
    }
LABEL_14:

    goto LABEL_15;
  }
  [(id)objc_opt_class() postTaskStatusUpdate:v4];
  if ([v4 taskState] == 3)
  {
    v14 = *p_ourInstance;
    if (v14)
    {
      v15 = [v4 taskID];
      [(fskitdExtensionInstance *)v14 removeTaskID:v15];
    }
    if ([v8 terminateExtensionWhenFinished])
    {
      v16 = fskit_std_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_10003E058(v4);
      }

      [(fskitdExtensionClient *)self terminateExtension];
    }
  }
LABEL_15:
}

- (void)wipeResource:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10003E48C(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  if (!v6 || [v6 kind] != (id)1)
  {
    id v37 = fskit_std_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_10003E1D4(v37);
    }
    goto LABEL_14;
  }
  v16 = fskit_std_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    sub_10003E3F8(v6);
  }

  v17 = [(fskitdExtensionInstance *)self->_ourInstance resourceIDs];
  v18 = [v6 getResourceID];
  unsigned __int8 v19 = [v17 containsObject:v18];

  if ((v19 & 1) == 0)
  {
    id v37 = fskit_std_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_10003E364(v6);
    }
    goto LABEL_14;
  }
  v20 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v20);
  BOOL v21 = [(id)qword_100060740 resourceManager];
  v22 = [v6 getResourceID];
  v23 = [v21 getResource:v22];

  objc_sync_exit(v20);
  if (!v23)
  {
    id v37 = fskit_std_log();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      sub_10003E258(v6);
    }
LABEL_14:

    v23 = fs_errorForPOSIXError();
    v7[2](v7, v23);
    goto LABEL_15;
  }
  v24 = +[FSBlockDeviceResource dynamicCast:v23];
  id v25 = [objc_alloc((Class)NSXPCConnection) initWithMachServiceName:@"com.apple.fskit.fskit_helper" options:4096];
  v26 = +[FSKitConstants FSKitHelperProtocol];
  [v25 setRemoteObjectInterface:v26];

  [v25 resume];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100018520;
  v40[3] = &unk_1000591E8;
  v27 = v7;
  v41 = v27;
  v28 = [v25 remoteObjectProxyWithErrorHandler:v40];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100018594;
  v38[3] = &unk_1000591E8;
  id v39 = v27;
  [v28 wipeFS:v24 replyHandler:v38];
  v29 = fskit_std_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    sub_10003E2EC(v29, v30, v31, v32, v33, v34, v35, v36);
  }

LABEL_15:
}

- (void)isVolumeIDUsed:(id)a3 bundle:(id)a4 replyHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = fskit_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10003E6E0(v11, v12, v13, v14, v15, v16, v17, v18);
  }

  unsigned __int8 v19 = (void *)qword_100060748;
  v20 = [(fskitdExtensionInstance *)self->_ourInstance initiatorAuditToken];
  [v19 isVolumeIDUsed:v10 bundle:v9 user:v20 replyHandler:v8];

  BOOL v21 = fskit_std_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
    sub_10003E668(v21, v22, v23, v24, v25, v26, v27, v28);
  }
}

- (void)configureUserClient:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  id v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10003E7D0(v8, v9, v10, v11, v12, v13, v14, v15);
  }

  uint64_t v16 = [(fskitdExtensionInstance *)self->_ourInstance attributes];
  uint64_t v17 = [v16 objectForKeyedSubscript:FSModuleIdentityAttributeSupportsBlockResources];

  uint64_t v18 = [(fskitdExtensionInstance *)self->_ourInstance attributes];
  unsigned __int8 v19 = [v18 objectForKeyedSubscript:FSModuleIdentityAttributeSupportsKOIO];

  v20 = [(fskitdExtensionInstance *)self->_ourInstance instanceAuditToken];
  BOOL v21 = +[LiveFSUserClient defaultClient];
  uint64_t v22 = fskit_std_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v23 = [v20 pid];
    unsigned int v24 = [v20 pidversion];
    if (v17)
    {
      unsigned int v25 = [v17 BOOLValue];
      if (v19)
      {
LABEL_6:
        unsigned int v26 = [v19 BOOLValue];
LABEL_9:
        int v38 = 136316162;
        id v39 = "-[fskitdExtensionClient configureUserClient:replyHandler:]";
        __int16 v40 = 1024;
        unsigned int v41 = v23;
        __int16 v42 = 1024;
        unsigned int v43 = v24;
        __int16 v44 = 1024;
        unsigned int v45 = v25;
        __int16 v46 = 1024;
        unsigned int v47 = v26;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s: pid %d pidversion %d supportsBlockResources %d supportsKOIO %d", (uint8_t *)&v38, 0x24u);
        goto LABEL_10;
      }
    }
    else
    {
      unsigned int v25 = 0;
      if (v19) {
        goto LABEL_6;
      }
    }
    unsigned int v26 = 0;
    goto LABEL_9;
  }
LABEL_10:

  if (v17)
  {
    id v27 = 0;
    if ([v17 BOOLValue] && v19) {
      id v27 = [v19 BOOLValue];
    }
  }
  else
  {
    id v27 = 0;
  }
  unsigned int v28 = [v21 configureUserClient:[v6 machPort] pid:[v20 pid] pidversion:[v20 pidversion] supportKOIO:v27];
  v29 = fskit_std_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
    sub_10003E758(v29, v30, v31, v32, v33, v34, v35, v36);
  }

  if (v28)
  {
    id v37 = fs_errorForPOSIXError();
    v7[2](v7, v37);
  }
  else
  {
    v7[2](v7, 0);
  }
}

- (void)revokeResource:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10003E8D8(v6);
  }

  [(id)objc_opt_class() closeResource:v6 andRevoke:1];
  ourInstance = self->_ourInstance;
  uint64_t v10 = [v6 getResourceID];
  [(fskitdExtensionInstance *)ourInstance removeResourceID:v10];

  uint64_t v11 = fskit_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10003E848(v6);
  }

  v7[2](v7, 0);
}

- (void)closeResource:(id)a3 replyHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void))a4;
  id v8 = fskit_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10003E9F8(v6);
  }

  [(id)objc_opt_class() closeResource:v6 andRevoke:0];
  ourInstance = self->_ourInstance;
  uint64_t v10 = [v6 getResourceID];
  [(fskitdExtensionInstance *)ourInstance removeResourceID:v10];

  uint64_t v11 = fskit_std_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10003E968(v6);
  }

  v7[2](v7, 0);
}

- (fskitdExtensionInstance)ourInstance
{
  return (fskitdExtensionInstance *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOurInstance:(id)a3
{
}

- (void).cxx_destruct
{
}

@end