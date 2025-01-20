@interface fskitdExtensionInstance
+ (id)dynamicCast:(id)a3;
+ (id)newContainerID;
+ (id)newForBundle:(id)a3 user:(id)a4 instance:(id)a5;
+ (id)newForBundle:(id)a3 user:(id)a4 instanceUUID:(id)a5 instanceID:(id)a6;
+ (id)newWithDefaultInstanceForBundle:(id)a3 user:(id)a4;
- (BKSAssertion)instanceMemoryAssertion;
- (BOOL)isOurUID;
- (BOOL)isRunning;
- (FSAuditToken)initiatorAuditToken;
- (FSAuditToken)instanceAuditToken;
- (FSContainerIdentifier)containerID;
- (NSDictionary)attributes;
- (NSMutableArray)resourceIDs;
- (NSMutableArray)taskIDs;
- (NSMutableArray)volumeIDs;
- (NSString)bundleID;
- (NSUUID)instanceID;
- (NSUUID)instanceUUID;
- (NSXPCConnection)instanceConnection;
- (_EXExtensionProcess)instanceProc;
- (_EXHostConfiguration)instanceConfig;
- (id)errorFromStartingProc;
- (id)initForBundle:(id)a3 user:(id)a4 instance:(id)a5;
- (id)newXPCConnectionWithError:(id *)a3;
- (int)pid;
- (unsigned)uid;
- (void)addResourceID:(id)a3;
- (void)addTaskID:(id)a3;
- (void)addVolumeID:(id)a3;
- (void)dealloc;
- (void)removeResourceID:(id)a3;
- (void)removeTaskID:(id)a3;
- (void)removeVolumeID:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setContainerID:(id)a3;
- (void)setInitiatorAuditToken:(id)a3;
- (void)setInstanceConfig:(id)a3;
- (void)setInstanceConnection:(id)a3;
- (void)setInstanceMemoryAssertion:(id)a3;
- (void)setInstanceProc:(id)a3;
- (void)setInstanceUUID:(id)a3;
- (void)setResourceIDs:(id)a3;
- (void)setTaskIDs:(id)a3;
- (void)setVolumeIDs:(id)a3;
- (void)terminate;
- (void)weDied;
@end

@implementation fskitdExtensionInstance

- (id)initForBundle:(id)a3 user:(id)a4 instance:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)fskitdExtensionInstance;
  v11 = [(fskitdExtensionInstance *)&v25 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    bundleID = v11->_bundleID;
    v11->_bundleID = v12;

    v11->_uid = getuid();
    v11->_ourUID = 1;
    v14 = (NSUUID *)[v10 copy];
    instanceID = v11->_instanceID;
    v11->_instanceID = v14;

    uint64_t v16 = objc_opt_new();
    resourceIDs = v11->_resourceIDs;
    v11->_resourceIDs = (NSMutableArray *)v16;

    uint64_t v18 = objc_opt_new();
    volumeIDs = v11->_volumeIDs;
    v11->_volumeIDs = (NSMutableArray *)v18;

    v20 = +[fskitdExtensionInstance newContainerID];
    containerID = v11->_containerID;
    v11->_containerID = v20;

    v11->_running = 0;
    uint64_t v22 = objc_opt_new();
    taskIDs = v11->_taskIDs;
    v11->_taskIDs = (NSMutableArray *)v22;

    objc_storeStrong((id *)&v11->_initiatorAuditToken, a4);
  }

  return v11;
}

+ (id)newForBundle:(id)a3 user:(id)a4 instanceUUID:(id)a5 instanceID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc((Class)a1);
  if (v14)
  {
    id v15 = [v14 initForBundle:v10 user:v11 instance:v12];
    id v16 = v15;
    if (v15)
    {
      if ([v15 isOurUID])
      {
        v17 = [(id)qword_100060760 configurationForInstance:v13 ofBundle:v10];
        [v16 setInstanceConfig:v17];

        uint64_t v18 = [v16 instanceConfig];

        if (!v18) {
          goto LABEL_9;
        }
      }
      else
      {
        [v16 setBundleID:v10];
        [v16 setInstanceUUID:v12];
      }
    }
  }
  else
  {
    id v16 = 0;
  }
  id v16 = v16;
  uint64_t v18 = v16;
LABEL_9:

  return v18;
}

+ (id)newWithDefaultInstanceForBundle:(id)a3 user:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[FSModuleHost defaultInstanceUUID];
  id v9 = [a1 newForBundle:v7 user:v6 instance:v8];

  return v9;
}

+ (id)newForBundle:(id)a3 user:(id)a4 instance:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)_EXExtensionInstanceIdentifier) initWithIdentifier:v8];
  id v12 = [a1 newForBundle:v10 user:v9 instanceUUID:v8 instanceID:v11];

  return v12;
}

- (void)dealloc
{
  instanceConnection = self->_instanceConnection;
  if (instanceConnection)
  {
    [(NSXPCConnection *)instanceConnection invalidate];
    v4 = self->_instanceConnection;
    self->_instanceConnection = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)fskitdExtensionInstance;
  [(fskitdExtensionInstance *)&v5 dealloc];
}

- (void)weDied
{
  v3 = fs_errorForPOSIXError();
  v4 = fskit_std_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    containerID = self->_containerID;
    *(_DWORD *)buf = 138412290;
    v21 = containerID;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Boom!🤯 Instance %@ died", buf, 0xCu);
  }

  id v6 = self;
  objc_sync_enter(v6);
  id v7 = v6->_taskIDs;
  uint64_t v8 = objc_opt_new();
  taskIDs = v6->_taskIDs;
  v6->_taskIDs = (NSMutableArray *)v8;

  instanceProc = v6->_instanceProc;
  v6->_instanceProc = 0;
  id v11 = instanceProc;

  v6->_running = 0;
  objc_sync_exit(v6);

  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_100034FA4;
  v17 = &unk_100059EA0;
  id v18 = v3;
  v19 = v6;
  id v12 = v3;
  [(NSMutableArray *)v7 enumerateObjectsUsingBlock:&v14];

  id v13 = fskit_std_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Death came for them", buf, 2u);
  }

  [objc_msgSend((id)qword_100060748, "cleanUpInstance:", v6, v14, v15, v16, v17);
}

- (id)errorFromStartingProc
{
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = sub_1000356F8;
  v48 = sub_100035708;
  id v49 = 0;
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = !v2->_running;
  objc_sync_exit(v2);

  if (!v3)
  {
    v4 = 0;
    objc_super v5 = 0;
    id v6 = 0;
    id v7 = 0;
LABEL_3:
    id v8 = 0;
    goto LABEL_4;
  }
  if (v2->_ourUID)
  {
    objc_initWeak(&location, v2);
    id v6 = [(_EXHostConfiguration *)v2->_instanceConfig copy];
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100035710;
    v42[3] = &unk_100058DB0;
    objc_copyWeak(&v43, &location);
    [v6 setInterruptionHandler:v42];
    id v10 = (id *)(v45 + 5);
    id obj = (id)v45[5];
    id v7 = +[_EXExtensionProcess extensionProcessWithConfiguration:v6 error:&obj];
    objc_storeStrong(v10, obj);
    if (v45[5])
    {
      id v11 = fskit_std_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        containerID = v2->_containerID;
        uint64_t v13 = v45[5];
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = containerID;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to start instance %@: %@", buf, 0x16u);
      }

      id v8 = (id)v45[5];
      objc_destroyWeak(&v43);
      objc_destroyWeak(&location);
      v4 = 0;
      objc_super v5 = 0;
      goto LABEL_4;
    }
    id v21 = [v7 rbs_pid];
    v23 = [(_EXHostConfiguration *)v2->_instanceConfig extensionIdentity];
    objc_super v5 = [v23 attributes];

    if (v7) {
      [v7 auditToken];
    }
    else {
      memset(v40, 0, sizeof(v40));
    }
    v4 = +[FSAuditToken tokenWithToken:v40];
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);
LABEL_23:
    v26 = v2;
    objc_sync_enter(v26);
    if (v2->_running)
    {
      objc_sync_exit(v26);

      goto LABEL_3;
    }
    v2->_running = 1;
    objc_storeStrong((id *)&v26->_instanceProc, v7);
    v26->_pid = (int)v21;
    objc_storeStrong((id *)&v26->_attributes, v5);
    objc_storeStrong((id *)&v26->_instanceAuditToken, v4);
    objc_sync_exit(v26);

    v27 = fskit_std_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v21;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "About to grab assertion on pid %d", buf, 8u);
    }

    id v28 = objc_alloc((Class)BKSProcessAssertion);
    id v29 = [v28 initWithPID:v21 flags:14 reason:13 name:@"com.apple.extension.session"];

    if (v29)
    {
      if (([v29 acquire] & 1) == 0)
      {
        v32 = fskit_std_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          sub_10004198C(v32);
        }

        [v29 invalidate];
        goto LABEL_36;
      }
      v30 = (BKSAssertion *)v29;
      instanceMemoryAssertion = v26->_instanceMemoryAssertion;
      v26->_instanceMemoryAssertion = v30;
    }
    else
    {
      instanceMemoryAssertion = fskit_std_log();
      if (os_log_type_enabled(instanceMemoryAssertion, OS_LOG_TYPE_ERROR)) {
        sub_100041948(instanceMemoryAssertion);
      }
    }

LABEL_36:
    goto LABEL_3;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v55 = sub_1000356F8;
  v56 = sub_100035708;
  id v57 = 0;
  id location = 0;
  p_id location = &location;
  uint64_t v36 = 0x3032000000;
  v37 = sub_1000356F8;
  v38 = sub_100035708;
  id v39 = 0;
  bundleID = v2->_bundleID;
  instanceUUID = v2->_instanceUUID;
  uint64_t uid = v2->_uid;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100035754;
  v33[3] = &unk_100059EC8;
  v33[4] = buf;
  v33[5] = &location;
  v33[6] = &v44;
  [(id)qword_100060768 startExtension:bundleID instanceID:instanceUUID uid:uid replyHandler:v33];
  uint64_t v17 = v45[5];
  if (v17)
  {
    id v18 = fskit_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v2->_containerID;
      uint64_t v20 = v45[5];
      *(_DWORD *)v50 = 138412546;
      v51 = v19;
      __int16 v52 = 2112;
      uint64_t v53 = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Failed to start instance %@: %@", v50, 0x16u);
    }

    id v21 = 0;
    v4 = 0;
    objc_super v5 = 0;
    id v22 = (id)v45[5];
    id v8 = v22;
  }
  else
  {
    id v21 = [p_location[5] pid];
    objc_super v5 = [*(id *)(*(void *)&buf[8] + 40) attributes];
    id v8 = 0;
    id v22 = p_location[5];
    v4 = v22;
  }
  BOOL v24 = v17 == 0;
  id v25 = v22;
  _Block_object_dispose(&location, 8);

  _Block_object_dispose(buf, 8);
  id v6 = 0;
  id v7 = 0;
  if (v24) {
    goto LABEL_23;
  }
LABEL_4:

  _Block_object_dispose(&v44, 8);

  return v8;
}

- (id)newXPCConnectionWithError:(id *)a3
{
  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_running)
  {
    if (a3)
    {
      fs_errorForPOSIXError();
      id v12 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  instanceConnection = v4->_instanceConnection;
  if (!instanceConnection)
  {
    if (v4->_ourUID)
    {
      id v6 = (NSXPCConnection *)[(_EXExtensionProcess *)v4->_instanceProc newXPCConnectionWithError:a3];
      id v7 = v4->_instanceConnection;
      v4->_instanceConnection = v6;

LABEL_5:
      instanceConnection = v4->_instanceConnection;
      if (instanceConnection)
      {
        id v8 = instanceConnection;
        id v9 = objc_opt_new();
        [v9 setOurInstance:v4];
        id v10 = +[FSKitConstants FSModuleExtensionXPCProtocol];
        [(NSXPCConnection *)v8 setRemoteObjectInterface:v10];

        [(NSXPCConnection *)v8 setExportedObject:v9];
        id v11 = +[FSKitConstants FSModuleExtensionHostXPCProtocol];
        [(NSXPCConnection *)v8 setExportedInterface:v11];

        [(NSXPCConnection *)v8 resume];
        instanceConnection = v4->_instanceConnection;
      }
      goto LABEL_7;
    }
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = sub_1000356F8;
    v34 = sub_100035708;
    id v35 = 0;
    uint64_t v24 = 0;
    id v25 = &v24;
    uint64_t v26 = 0x3032000000;
    v27 = sub_1000356F8;
    id v28 = sub_100035708;
    id v29 = 0;
    bundleID = v4->_bundleID;
    instanceUUID = v4->_instanceUUID;
    uint64_t uid = v4->_uid;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100035B60;
    v23[3] = &unk_100059CA8;
    v23[4] = &v30;
    v23[5] = &v24;
    [(id)qword_100060768 getNSXPCListenerEndpoint:bundleID instanceID:instanceUUID uid:uid replyHandler:v23];
    id v16 = (void *)v25[5];
    if (v16)
    {
      if (a3) {
        *a3 = v16;
      }
    }
    else
    {
      id v17 = objc_alloc((Class)NSXPCConnection);
      id v18 = (NSXPCConnection *)[v17 initWithListenerEndpoint:v31[5]];
      v19 = v4->_instanceConnection;
      v4->_instanceConnection = v18;

      uint64_t v20 = fskit_std_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v21 = v4->_instanceConnection;
        *(_DWORD *)buf = 138412290;
        v37 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "non-ours instance connection got %@", buf, 0xCu);
      }
    }
    _Block_object_dispose(&v24, 8);

    _Block_object_dispose(&v30, 8);
    if (!v16) {
      goto LABEL_5;
    }
LABEL_17:
    id v12 = 0;
    goto LABEL_18;
  }
LABEL_7:
  id v12 = instanceConnection;
LABEL_18:
  objc_sync_exit(v4);

  return v12;
}

- (void)terminate
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v3);
  v4 = [(fskitdExtensionInstance *)v2 resourceIDs];
  [v4 enumerateObjectsUsingBlock:&stru_100059EE8];

  objc_sync_exit(v3);
  if (v2->_running)
  {
    if (!v2->_ourUID) {
      [(id)qword_100060768 stopExtension:v2->_bundleID instanceID:v2->_instanceUUID uid:v2->_uid replyHandler:&stru_100059F08];
    }
    uint64_t pid = v2->_pid;
    id v6 = fskit_std_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100041AC0(pid, v6);
    }

    id v7 = objc_alloc_init((Class)RBSTerminateContext);
    id v8 = +[NSString stringWithFormat:@"Request to terminate instance process (%d)", pid];
    [v7 setExplanation:v8];

    id v9 = objc_alloc((Class)RBSTerminateRequest);
    uint64_t v10 = +[NSNumber numberWithInt:pid];
    id v11 = [v9 initWithProcessIdentifier:v10 context:v7];

    id v17 = 0;
    LOBYTE(v10) = [v11 execute:&v17];
    id v12 = v17;
    if ((v10 & 1) == 0)
    {
      uint64_t v13 = fskit_std_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        id v14 = [v12 description];
        sub_100041A54(v14, buf, v13);
      }
    }
    instanceProc = v2->_instanceProc;
    v2->_instanceProc = 0;

    v2->_running = 0;
    id v16 = fskit_std_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1000419D0(v16);
    }
  }
  objc_sync_exit(v2);
}

+ (id)dynamicCast:(id)a3
{
  id v3 = a3;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)addResourceID:(id)a3
{
  id v5 = a3;
  v4 = self->_resourceIDs;
  objc_sync_enter(v4);
  if (([(NSMutableArray *)self->_resourceIDs containsObject:v5] & 1) == 0) {
    [(NSMutableArray *)self->_resourceIDs addObject:v5];
  }
  objc_sync_exit(v4);
}

- (void)removeResourceID:(id)a3
{
  id v5 = a3;
  v4 = self->_resourceIDs;
  objc_sync_enter(v4);
  if ([(NSMutableArray *)self->_resourceIDs containsObject:v5]) {
    [(NSMutableArray *)self->_resourceIDs removeObject:v5];
  }
  objc_sync_exit(v4);
}

- (void)addVolumeID:(id)a3
{
  id v5 = a3;
  v4 = self->_volumeIDs;
  objc_sync_enter(v4);
  if (([(NSMutableArray *)self->_volumeIDs containsObject:v5] & 1) == 0) {
    [(NSMutableArray *)self->_volumeIDs addObject:v5];
  }
  objc_sync_exit(v4);
}

- (void)removeVolumeID:(id)a3
{
  id v5 = a3;
  v4 = self->_volumeIDs;
  objc_sync_enter(v4);
  if ([(NSMutableArray *)self->_volumeIDs containsObject:v5]) {
    [(NSMutableArray *)self->_volumeIDs removeObject:v5];
  }
  objc_sync_exit(v4);
}

- (void)addTaskID:(id)a3
{
  id v5 = a3;
  v4 = self->_taskIDs;
  objc_sync_enter(v4);
  if (([(NSMutableArray *)self->_taskIDs containsObject:v5] & 1) == 0) {
    [(NSMutableArray *)self->_taskIDs addObject:v5];
  }
  objc_sync_exit(v4);
}

- (void)removeTaskID:(id)a3
{
  id v5 = a3;
  v4 = self->_taskIDs;
  objc_sync_enter(v4);
  if ([(NSMutableArray *)self->_taskIDs containsObject:v5]) {
    [(NSMutableArray *)self->_taskIDs removeObject:v5];
  }
  objc_sync_exit(v4);
}

+ (id)newContainerID
{
  return (id)objc_opt_new();
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSUUID)instanceUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void)setInstanceUUID:(id)a3
{
}

- (NSUUID)instanceID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (FSContainerIdentifier)containerID
{
  return (FSContainerIdentifier *)objc_getProperty(self, a2, 56, 1);
}

- (void)setContainerID:(id)a3
{
}

- (FSAuditToken)initiatorAuditToken
{
  return (FSAuditToken *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInitiatorAuditToken:(id)a3
{
}

- (FSAuditToken)instanceAuditToken
{
  return (FSAuditToken *)objc_getProperty(self, a2, 72, 1);
}

- (unsigned)uid
{
  return self->_uid;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (NSMutableArray)resourceIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setResourceIDs:(id)a3
{
}

- (NSMutableArray)volumeIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setVolumeIDs:(id)a3
{
}

- (NSXPCConnection)instanceConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 96, 1);
}

- (void)setInstanceConnection:(id)a3
{
}

- (BKSAssertion)instanceMemoryAssertion
{
  return (BKSAssertion *)objc_getProperty(self, a2, 104, 1);
}

- (void)setInstanceMemoryAssertion:(id)a3
{
}

- (NSMutableArray)taskIDs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTaskIDs:(id)a3
{
}

- (BOOL)isOurUID
{
  return self->_ourUID;
}

- (int)pid
{
  return self->_pid;
}

- (_EXHostConfiguration)instanceConfig
{
  return (_EXHostConfiguration *)objc_getProperty(self, a2, 120, 1);
}

- (void)setInstanceConfig:(id)a3
{
}

- (_EXExtensionProcess)instanceProc
{
  return (_EXExtensionProcess *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInstanceProc:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceProc, 0);
  objc_storeStrong((id *)&self->_instanceConfig, 0);
  objc_storeStrong((id *)&self->_taskIDs, 0);
  objc_storeStrong((id *)&self->_instanceMemoryAssertion, 0);
  objc_storeStrong((id *)&self->_instanceConnection, 0);
  objc_storeStrong((id *)&self->_volumeIDs, 0);
  objc_storeStrong((id *)&self->_resourceIDs, 0);
  objc_storeStrong((id *)&self->_instanceAuditToken, 0);
  objc_storeStrong((id *)&self->_initiatorAuditToken, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_instanceID, 0);
  objc_storeStrong((id *)&self->_instanceUUID, 0);

  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end