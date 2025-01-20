@interface mountEntry
+ (id)newWithName:(id)a3 fileSystem:(id)a4 displayName:(id)a5 storageName:(id)a6 provider:(id)a7 path:(id)a8 mountID:(unsigned int)a9 auditToken:(id)a10 mntTable:(id)a11;
+ (id)newWithObject:(id)a3 path:(id)a4 mntTable:(id)a5;
- (BOOL)ensureConnected:(int)a3 status:(id *)a4;
- (BOOL)isFSKitModule;
- (BOOL)is_connected;
- (BOOL)is_in_unmount_method;
- (BOOL)is_in_unmount_syscall;
- (BOOL)is_inet;
- (BOOL)is_killing_io;
- (BOOL)unmountPreflight:(int)a3;
- (FSAuditToken)auditToken;
- (NSError)domainError;
- (NSString)displayName;
- (NSString)fileSystem;
- (NSString)mntOn;
- (NSString)providerName;
- (NSString)rootLIFileHandle;
- (NSString)stateAsString;
- (NSString)storageName;
- (NSString)volumeName;
- (id)connect;
- (id)doConnect;
- (id)fsObjWithErrorHandler:(id)a3;
- (id)fsSynchObjWithErrorHandler:(id)a3;
- (id)mount:(int)a3;
- (id)mount:(int)a3 options:(id)a4;
- (id)unmount:(int)a3;
- (id)unmountPostflight:(int)a3;
- (int)isMountAtPath:(id)a3 err:(id *)a4;
- (int)mnt_flags;
- (mountEntry)initWithName:(id)a3 fileSystem:(id)a4 displayName:(id)a5 storageName:(id)a6 provider:(id)a7 path:(id)a8 mountID:(unsigned int)a9 auditToken:(id)a10 mntTable:(id)a11;
- (mountEntry)initWithObject:(id)a3 path:(id)a4 mntTable:(id)a5;
- (mountTable)mntTable;
- (unint64_t)currentState;
- (unsigned)encryptedIdx;
- (unsigned)fileno;
- (unsigned)midx;
- (void)copyDisconnectedRootAttrs:(_LIFileAttributes *)a3;
- (void)createMountTaskForBSDName:(id)a3;
- (void)doWait;
- (void)doWakeAndUnlock;
- (void)forgetModuleVolumeWithFlags:(unsigned int)a3 reply:(id)a4;
- (void)getLiveFilesConnectionForPath:(id)a3 withCompletionHandler:(id)a4;
- (void)handleConnectionInterrupted;
- (void)handleConnectionInvalidated;
- (void)refreshPath:(id)a3 displayName:(id)a4 storageName:(id)a5;
- (void)removeMountTask;
- (void)renameToName:(id)a3 reply:(id)a4;
- (void)resetConnectError;
- (void)setCurrentState:(unint64_t)a3;
- (void)setDomainError:(id)a3;
- (void)setFileno:(unsigned int)a3;
- (void)setIs_connected:(BOOL)a3;
- (void)setIs_in_unmount_method:(BOOL)a3;
- (void)setIs_in_unmount_syscall:(BOOL)a3;
- (void)setIs_inet:(BOOL)a3;
- (void)setIs_killing_io:(BOOL)a3;
@end

@implementation mountEntry

- (mountEntry)initWithName:(id)a3 fileSystem:(id)a4 displayName:(id)a5 storageName:(id)a6 provider:(id)a7 path:(id)a8 mountID:(unsigned int)a9 auditToken:(id)a10 mntTable:(id)a11
{
  id v18 = a3;
  id v38 = a4;
  id v37 = a5;
  id v36 = a6;
  id v35 = a7;
  id v34 = a8;
  id v33 = a10;
  id v19 = a11;
  v39.receiver = self;
  v39.super_class = (Class)mountEntry;
  v20 = [(mountEntry *)&v39 init];
  v21 = v20;
  if (v20)
  {
    v20->_is_connected = 0;
    v20->_connecting = 0;
    v20->_is_inet = byte_10006072C;
    *(_WORD *)&v20->_is_killing_io = 0;
    id v32 = v19;
    objc_storeWeak((id *)&v20->_mntTable, v19);
    if (a9 == -1)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v21->_mntTable);
      v21->_midx = [WeakRetained nextIndex];
    }
    else
    {
      v21->_midx = a9;
    }
    objc_storeStrong((id *)&v21->_volumeName, a3);
    objc_storeStrong((id *)&v21->_displayName, a5);
    objc_storeStrong((id *)&v21->_fileSystem, a4);
    objc_storeStrong((id *)&v21->_storageName, a6);
    objc_storeStrong((id *)&v21->_providerName, a7);
    uint64_t v23 = objc_opt_new();
    theLock = v21->_theLock;
    v21->_theLock = (NSCondition *)v23;

    objc_storeStrong((id *)&v21->_mntOn, a8);
    objc_storeStrong((id *)&v21->_auditToken, a10);
    id v25 = objc_loadWeakRetained((id *)&v21->_mntTable);
    [v25 add:v21];

    mountTaskUUID = v21->_mountTaskUUID;
    v21->_currentState = 0;
    v21->_mountTaskUUID = 0;
    v21->_fileno = 2;

    resource = v21->_resource;
    v21->_resource = 0;

    id v19 = v32;
    if (v38)
    {
      if (([v38 isEqualToString:@"exfat"] & 1) != 0
        || ([v38 isEqualToString:@"ntfs"] & 1) != 0
        || ([v38 isEqualToString:@"apfs"] & 1) != 0
        || [v38 isEqualToString:@"hfs"])
      {
        v21->_isFSKitModule = 0;
      }
      else if ([v38 containsString:@"msdos"])
      {
        v21->_isFSKitModule = _os_feature_enabled_impl();
      }
      else
      {
        v21->_isFSKitModule = 1;
      }
    }
    else
    {
      v21->_isFSKitModule = 0;
    }
    instance = v21->_instance;
    v21->_instance = 0;

    volumeID = v21->_volumeID;
    v21->_volumeID = 0;

    v30 = fskit_std_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      sub_10004093C();
    }
  }
  return v21;
}

- (mountEntry)initWithObject:(id)a3 path:(id)a4 mntTable:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = +[FSAuditToken token];
  LODWORD(v19) = -1;
  v13 = [(mountEntry *)self initWithName:0 fileSystem:0 displayName:0 storageName:0 provider:0 path:v10 mountID:v19 auditToken:v12 mntTable:v11];

  if (!v13) {
    goto LABEL_7;
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_10002E4C4;
  v27 = sub_10002E4D4;
  id v28 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_10002E4C4;
  v21[4] = sub_10002E4D4;
  id v22 = 0;
  v13->_is_connected = 1;
  v13->_midx = 0;
  objc_storeStrong((id *)&v13->_fsObj, a3);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10002ED44;
  v20[3] = &unk_100059C58;
  v20[4] = v21;
  v20[5] = &v23;
  [v9 getRootFileHandleWithError:v20];
  v14 = (void *)v24[5];
  if (v14)
  {
    v15 = v14;
    rootLIFileHandle = v13->_rootLIFileHandle;
    v13->_rootLIFileHandle = v15;
  }
  else
  {
    rootLIFileHandle = livefs_std_log();
    if (os_log_type_enabled(rootLIFileHandle, OS_LOG_TYPE_ERROR)) {
      sub_1000409C4();
    }
  }

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  if (!v14) {
    v17 = 0;
  }
  else {
LABEL_7:
  }
    v17 = v13;

  return v17;
}

+ (id)newWithName:(id)a3 fileSystem:(id)a4 displayName:(id)a5 storageName:(id)a6 provider:(id)a7 path:(id)a8 mountID:(unsigned int)a9 auditToken:(id)a10 mntTable:(id)a11
{
  id v18 = a11;
  id v19 = a10;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  LODWORD(v28) = a9;
  id v26 = [objc_alloc((Class)a1) initWithName:v25 fileSystem:v24 displayName:v23 storageName:v22 provider:v21 path:v20 mountID:v28 auditToken:v19 mntTable:v18];

  return v26;
}

+ (id)newWithObject:(id)a3 path:(id)a4 mntTable:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithObject:v10 path:v9 mntTable:v8];

  return v11;
}

- (void)refreshPath:(id)a3 displayName:(id)a4 storageName:(id)a5
{
  id v8 = (NSString *)a3;
  id v9 = (NSString *)a4;
  id v10 = (NSString *)a5;
  mntOn = self->_mntOn;
  self->_mntOn = v8;
  v15 = v8;

  displayName = self->_displayName;
  self->_displayName = v9;
  v13 = v9;

  storageName = self->_storageName;
  self->_storageName = v10;
}

- (id)fsObjWithErrorHandler:(id)a3
{
  id v4 = a3;
  if (self->_midx)
  {
    if (!self->_isFSKitModule)
    {
      v7 = [(NSXPCConnection *)self->_theConn remoteObjectProxyWithErrorHandler:v4];
      if (v7) {
        v6 = +[LiveFSVolumeCore_FSFileNameBridge newWithProxy:v7];
      }
      else {
        v6 = 0;
      }

      goto LABEL_10;
    }
    v5 = +[FSVolumeConnectorBridge newWithConnection:self->_theConn errorHandler:v4];
  }
  else
  {
    v5 = self->_fsObj;
  }
  v6 = v5;
LABEL_10:

  return v6;
}

- (id)fsSynchObjWithErrorHandler:(id)a3
{
  id v4 = a3;
  if (self->_midx)
  {
    if (!self->_isFSKitModule)
    {
      v7 = [(NSXPCConnection *)self->_theConn synchronousRemoteObjectProxyWithErrorHandler:v4];
      if (v7) {
        v6 = +[LiveFSVolumeCore_FSFileNameBridge newWithProxy:v7];
      }
      else {
        v6 = 0;
      }

      goto LABEL_10;
    }
    v5 = +[FSVolumeConnectorBridge newWithSyncConnection:self->_theConn errorHandler:v4];
  }
  else
  {
    v5 = self->_fsObj;
  }
  v6 = v5;
LABEL_10:

  return v6;
}

- (void)doWait
{
  self->_waiters = 1;
  [(NSCondition *)self->_theLock wait];
}

- (void)doWakeAndUnlock
{
  BOOL waiters = self->_waiters;
  self->_BOOL waiters = 0;
  [(NSCondition *)self->_theLock unlock];
  if (waiters)
  {
    theLock = self->_theLock;
    [(NSCondition *)theLock broadcast];
  }
}

- (unint64_t)currentState
{
  [(NSCondition *)self->_theLock lock];
  unint64_t currentState = self->_currentState;
  [(NSCondition *)self->_theLock unlock];
  return currentState;
}

- (NSString)stateAsString
{
  unint64_t v2 = [(mountEntry *)self currentState];
  if (v2 > 2) {
    return (NSString *)@"unknown";
  }
  else {
    return &off_100059E80[v2]->isa;
  }
}

- (void)setCurrentState:(unint64_t)a3
{
  [(NSCondition *)self->_theLock lock];
  self->_unint64_t currentState = a3;

  [(mountEntry *)self doWakeAndUnlock];
}

- (void)getLiveFilesConnectionForPath:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, id))a4;
  if (self->_isFSKitModule)
  {
    [(id)qword_100060740 taskSetChanged];
    if ([(NSString *)self->_fileSystem localizedCaseInsensitiveContainsString:@"MSDOS"])
    {
      id v8 = @"com.apple.fskit.msdos";
LABEL_15:
      id v16 = [objc_alloc((Class)NSUUID) initWithUUIDString:self->_volumeName];
      [v16 fs_volumeIdentifier];
      v17 = (FSVolumeIdentifier *)objc_claimAutoreleasedReturnValue();
      p_volumeID = (uint64_t *)&self->_volumeID;
      volumeID = self->_volumeID;
      self->_volumeID = v17;

      uint64_t v52 = 0;
      v53 = (id *)&v52;
      uint64_t v54 = 0x3032000000;
      v55 = sub_10002E4C4;
      v56 = sub_10002E4D4;
      id v57 = 0;
      uint64_t v46 = 0;
      v47 = &v46;
      uint64_t v48 = 0x3032000000;
      v49 = sub_10002E4C4;
      v50 = sub_10002E4D4;
      id v51 = 0;
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      v63 = sub_10002E4C4;
      v64 = sub_10002E4D4;
      id v65 = 0;
      id v20 = fskit_std_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v58 = 136315650;
        v59 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
        __int16 v60 = 2112;
        *(void *)v61 = v8;
        *(_WORD *)&v61[8] = 2112;
        *(void *)&v61[10] = v16;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%s: Trying to find a FSVolumeConnector using bundleID (%@) and volumeID (%@)", v58, 0x20u);
      }

      auditToken = self->_auditToken;
      id v22 = self->_volumeID;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_10002FD00;
      v44[3] = &unk_100059748;
      v44[4] = &v52;
      v44[5] = &v46;
      [(id)qword_100060748 existingExtensionForBundle:v8 user:auditToken volume:v22 replyHandler:v44];
      if (v53[5])
      {
        id v23 = fskit_std_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v58 = 136315906;
          v59 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
          __int16 v60 = 1024;
          *(_DWORD *)v61 = 637;
          *(_WORD *)&v61[4] = 2112;
          *(void *)&v61[6] = v8;
          *(_WORD *)&v61[14] = 2112;
          *(void *)&v61[16] = v16;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s:%d: No extension instance found for bundleID (%@) volumeID (%@)", v58, 0x26u);
        }

        v7[2](v7, 0, v53[5]);
      }
      else
      {
        p_instance = &self->_instance;
        objc_storeStrong((id *)p_instance, (id)v47[5]);
        id v25 = fskit_std_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v58 = 136315906;
          v59 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
          __int16 v60 = 1024;
          *(_DWORD *)v61 = 642;
          *(_WORD *)&v61[4] = 2112;
          *(void *)&v61[6] = v8;
          *(_WORD *)&v61[14] = 2112;
          *(void *)&v61[16] = v16;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s:%d: Found extension instance for bundleID (%@) volumeID (%@)", v58, 0x26u);
        }

        id v26 = *p_instance;
        v27 = v53;
        id obj = v53[5];
        id v28 = [(fskitdExtensionInstance *)v26 newXPCConnectionWithError:&obj];
        objc_storeStrong(v27 + 5, obj);
        if (v53[5])
        {
          v29 = fskit_std_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            id v30 = v53[5];
            *(_DWORD *)v58 = 136315394;
            v59 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
            __int16 v60 = 2112;
            *(void *)v61 = v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s: Connecting to extension instance reported error %@", v58, 0x16u);
          }

          v7[2](v7, 0, v53[5]);
        }
        else
        {
          v31 = fskit_std_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v58 = 136315394;
            v59 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
            __int16 v60 = 1024;
            *(_DWORD *)v61 = 648;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s:%d: creating FSModuleXPC sync proxy", v58, 0x12u);
          }

          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472;
          v42[2] = sub_10002FD80;
          v42[3] = &unk_100058868;
          v42[4] = &v52;
          id v32 = [v28 synchronousRemoteObjectProxyWithErrorHandler:v42];
          id v33 = fskit_std_log();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            sub_100040AC8(p_volumeID, v33);
          }

          uint64_t v34 = *p_volumeID;
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_10002FD90;
          v41[3] = &unk_100059CA8;
          v41[4] = buf;
          v41[5] = &v52;
          [v32 getVolumeEndpoint:v34 replyHandler:v41];
          if (v53[5])
          {
            id v35 = fskit_std_log();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v58 = 136315394;
              v59 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
              __int16 v60 = 1024;
              *(_DWORD *)v61 = 663;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%s:%d: No FSVolumeConnector endpoint found", v58, 0x12u);
            }

            v7[2](v7, 0, v53[5]);
          }
          else
          {
            id v36 = fskit_std_log();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v58 = 136315394;
              v59 = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
              __int16 v60 = 1024;
              *(_DWORD *)v61 = 666;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s:%d: FSVolumeConnector endpoint found", v58, 0x12u);
            }

            id v37 = objc_alloc((Class)NSXPCConnection);
            id v38 = [v37 initWithListenerEndpoint:*(void *)(*(void *)&buf[8] + 40)];
            ((void (**)(id, id, id))v7)[2](v7, v38, v53[5]);
          }
        }
      }
      _Block_object_dispose(buf, 8);

      _Block_object_dispose(&v46, 8);
      _Block_object_dispose(&v52, 8);

      goto LABEL_41;
    }
    if ([(NSString *)self->_fileSystem localizedCaseInsensitiveContainsString:@"passthroughfs"])
    {
      id v8 = @"com.apple.fskit.passthroughfs";
      goto LABEL_15;
    }
    uint64_t v52 = 0;
    v53 = (id *)&v52;
    uint64_t v54 = 0x3032000000;
    v55 = sub_10002E4C4;
    v56 = sub_10002E4D4;
    id v57 = 0;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x3032000000;
    v49 = sub_10002E4C4;
    v50 = sub_10002E4D4;
    id v51 = 0;
    fileSystem = self->_fileSystem;
    v13 = self->_auditToken;
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10002FC78;
    v45[3] = &unk_100059C80;
    v45[4] = &v52;
    v45[5] = &v46;
    [(id)qword_100060768 currentExtensionForShortName:fileSystem auditToken:v13 replyHandler:v45];
    uint64_t v14 = v47[5];
    if (v14)
    {
      v15 = fskit_std_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&buf[4] = "-[mountEntry getLiveFilesConnectionForPath:withCompletionHandler:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: No extension instance found for bundleID (%@)", buf, 0x16u);
      }

      v7[2](v7, 0, (id)v47[5]);
      id v8 = 0;
    }
    else
    {
      id v8 = [v53[5] bundleIdentifier];
    }
    _Block_object_dispose(&v46, 8);

    _Block_object_dispose(&v52, 8);
    if (!v14) {
      goto LABEL_15;
    }
  }
  else
  {
    id v9 = fskit_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100040A38();
    }

    providerName = self->_providerName;
    volumeName = self->_volumeName;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_10002FE18;
    v39[3] = &unk_100059CD0;
    v40 = v7;
    +[LIFSClientConnector getLiveFilesConnectionForProvider:providerName volume:volumeName withHandler:v39];
    id v8 = v40;
  }
LABEL_41:
}

- (void)createMountTaskForBSDName:(id)a3
{
  id v14 = a3;
  +[FSBlockDeviceResource proxyResourceForBSDName:](FSBlockDeviceResource, "proxyResourceForBSDName:");
  id v4 = (FSResource *)objc_claimAutoreleasedReturnValue();
  resource = self->_resource;
  self->_resource = v4;

  [(FSResource *)self->_resource setState:6];
  id v6 = (NSUUID *)objc_opt_new();
  mountTaskUUID = self->_mountTaskUUID;
  self->_mountTaskUUID = v6;

  id v8 = +[FSTaskDescription taskDescriptionWithID:self->_mountTaskUUID state:1 purpose:FSTaskPurposeActivate error:0 bundleID:@"Unknown" extensionID:0 resource:self->_resource];
  id v9 = [(id)qword_100060740 tasks];
  objc_sync_enter(v9);
  id v10 = [(id)qword_100060740 tasks];
  [v10 setObject:v8 forKey:self->_mountTaskUUID];

  objc_sync_exit(v9);
  [(id)qword_100060740 taskSetChanged];
  id v11 = [(id)qword_100060740 resourceManager];
  objc_sync_enter(v11);
  v12 = [(id)qword_100060740 resourceManager];
  [v12 addResource:self->_resource];

  v13 = [(id)qword_100060740 resourceManager];
  [v13 addTaskUUID:self->_mountTaskUUID resource:self->_resource];

  objc_sync_exit(v11);
}

- (id)doConnect
{
  uint64_t v78 = 0;
  v79 = &v78;
  uint64_t v80 = 0x3032000000;
  v81 = sub_10002E4C4;
  v82 = sub_10002E4D4;
  id v83 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  BOOL isFSKitModule = self->_isFSKitModule;
  [(NSCondition *)self->_theLock lock];
  self->_is_connected = 0;
  if (dword_100060728)
  {
    v5 = livefs_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      mntOn = self->_mntOn;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = mntOn;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "doConnect: starting at %@", (uint8_t *)&buf, 0xCu);
    }
  }
  theConn = self->_theConn;
  self->_theConn = 0;

  rootLIFileHandle = self->_rootLIFileHandle;
  self->_rootLIFileHandle = 0;

  if (!self->_domainError)
  {
    [(NSCondition *)self->_theLock unlock];
    v13 = self->_mntOn;
    v15 = livefs_std_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Tweaked path is %{public}@", (uint8_t *)&buf, 0xCu);
    }

    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_1000308E4;
    v73[3] = &unk_100059CF8;
    v76 = &v78;
    id v16 = v3;
    BOOL v77 = isFSKitModule;
    v74 = v16;
    v75 = self;
    [(mountEntry *)self getLiveFilesConnectionForPath:v13 withCompletionHandler:v73];
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    if (!self->_theConn)
    {
      id v26 = fskit_std_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100040B68(v26, v27, v28, v29, v30, v31, v32, v33);
      }

      uint64_t v34 = fs_errorForPOSIXError();
      v17 = (void *)v79[5];
      v79[5] = v34;
      goto LABEL_44;
    }
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_100030C20;
    v72[3] = &unk_100058868;
    v72[4] = &v78;
    v17 = [(mountEntry *)self fsSynchObjWithErrorHandler:v72];
    id v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "About to get root fh", (uint8_t *)&buf, 2u);
    }

    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_100030C30;
    v71[3] = &unk_100059D20;
    v71[4] = self;
    v71[5] = &v78;
    [v17 getRootFileHandleWithError:v71];
    if (!self->_is_connected)
    {
LABEL_44:

      [(NSCondition *)self->_theLock lock];
      id v14 = v74;
      goto LABEL_45;
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v91 = 0x3032000000;
    v92 = sub_10002E4C4;
    v93 = sub_10002E4D4;
    id v94 = 0;
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x3032000000;
    v68 = sub_10002E4C4;
    v69 = sub_10002E4D4;
    id v70 = 0;
    uint64_t v59 = 0;
    __int16 v60 = &v59;
    uint64_t v61 = 0x3032000000;
    v62 = sub_10002E4C4;
    v63 = sub_10002E4D4;
    id v64 = 0;
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100030DCC;
    v58[3] = &unk_100058868;
    uint8_t v58[4] = &v59;
    id v19 = [(mountEntry *)self fsSynchObjWithErrorHandler:v58];
    id v20 = self->_rootLIFileHandle;
    id v21 = +[FSFileName nameWithCString:"_S_f_location"];
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_100030DDC;
    v57[3] = &unk_100059D48;
    v57[4] = &buf;
    v57[5] = &v59;
    [v19 otherAttributeOf:v20 named:v21 requestID:0 reply:v57];

    if (!v60[5])
    {
      id v22 = self->_rootLIFileHandle;
      id v23 = +[FSFileName nameWithCString:"_S_f_type"];
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_100030EE0;
      v56[3] = &unk_100059D48;
      v56[4] = &v65;
      v56[5] = &v59;
      [v19 otherAttributeOf:v22 named:v23 requestID:0 reply:v56];
    }
    id v24 = (void *)v66[5];
    if (v24) {
      BOOL v25 = [v24 caseInsensitiveCompare:@"smb"] == 0;
    }
    else {
      BOOL v25 = 0;
    }
    id v35 = (void *)v60[5];
    if (v35
      && ([v35 domain],
          id v36 = objc_claimAutoreleasedReturnValue(),
          unsigned int v37 = [v36 isEqual:NSPOSIXErrorDomain],
          v36,
          v60[5]))
    {
      if (self->_mountTaskUUID) {
        int v38 = 1;
      }
      else {
        int v38 = v25;
      }
      if ((v38 & v37 & 1) == 0)
      {
        objc_super v39 = fskit_std_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v53 = (NSUUID *)v60[5];
          uint64_t v54 = v66[5];
          mountTaskUUID = self->_mountTaskUUID;
          *(_DWORD *)v84 = 138412802;
          v85 = v53;
          __int16 v86 = 2112;
          uint64_t v87 = v54;
          __int16 v88 = 2112;
          v89 = mountTaskUUID;
          _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "error creating mountTask:err:%@:type:%@:mountTask:%@", v84, 0x20u);
        }

        v40 = v79;
        id v41 = (id)v60[5];
        v42 = (void *)v40[5];
        v40[5] = (uint64_t)v41;
LABEL_39:

LABEL_43:
        _Block_object_dispose(&v59, 8);

        _Block_object_dispose(&v65, 8);
        _Block_object_dispose(&buf, 8);

        goto LABEL_44;
      }
    }
    else
    {
      if (self->_mountTaskUUID) {
        char v43 = 1;
      }
      else {
        char v43 = v25;
      }
      if ((v43 & 1) == 0)
      {
        uint64_t v48 = fskit_std_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          v49 = *(NSUUID **)(*((void *)&buf + 1) + 40);
          uint64_t v50 = v66[5];
          *(_DWORD *)v84 = 138412546;
          v85 = v49;
          __int16 v86 = 2112;
          uint64_t v87 = v50;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "creating mount task to %@ with type %@", v84, 0x16u);
        }

        [(mountEntry *)self createMountTaskForBSDName:*(void *)(*((void *)&buf + 1) + 40)];
        goto LABEL_43;
      }
    }
    v44 = fskit_std_log();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = self->_mountTaskUUID;
      uint64_t v46 = v60[5];
      v47 = (NSUUID *)v66[5];
      *(_DWORD *)v84 = 138412802;
      v85 = v45;
      __int16 v86 = 2112;
      uint64_t v87 = v46;
      __int16 v88 = 2112;
      v89 = v47;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "not creating mount task:mountTaskUUID:%@:err:%@:type:%@", v84, 0x20u);
    }

    v42 = (void *)v79[5];
    v79[5] = 0;
    goto LABEL_39;
  }
  id v9 = livefs_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    domainError = self->_domainError;
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = domainError;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "doConnect exiting as domain has error %@", (uint8_t *)&buf, 0xCu);
  }

  id v11 = v79;
  v12 = self->_domainError;
  v13 = 0;
  id v14 = v11[5];
  v11[5] = (uint64_t)v12;
LABEL_45:

  self->_connecting = 0;
  objc_storeStrong((id *)&self->lastConnectError, (id)v79[5]);
  [(mountEntry *)self doWakeAndUnlock];
  id v51 = (id)v79[5];

  _Block_object_dispose(&v78, 8);

  return v51;
}

- (id)connect
{
  if (!self->_midx)
  {
    id v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      int v38 = "-[mountEntry connect]";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s returning without connection, idx 0", buf, 0xCu);
    }

    goto LABEL_17;
  }
  [(NSCondition *)self->_theLock lock];
  if (dword_100060728)
  {
    dispatch_semaphore_t v3 = livefs_std_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_is_connected) {
        id v4 = "";
      }
      else {
        id v4 = "not ";
      }
      unsigned int midx = self->_midx;
      BOOL v6 = !self->_connecting;
      *(_DWORD *)long long buf = 136315906;
      int v38 = "-[mountEntry connect]";
      __int16 v39 = 2080;
      v40 = v4;
      if (v6) {
        v7 = "no";
      }
      else {
        v7 = "yes";
      }
      __int16 v41 = 1024;
      unsigned int v42 = midx;
      __int16 v43 = 2080;
      v44 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s entered is %sConnected id %d connecting %s", buf, 0x26u);
    }
  }
  if (self->_is_connected)
  {
    [(NSCondition *)self->_theLock unlock];
LABEL_17:
    id v9 = 0;
    goto LABEL_18;
  }
  while (1)
  {
    unint64_t currentState = self->_currentState;
    if (currentState) {
      break;
    }
    v12 = livefs_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100040E58(buf, &buf[1], v12);
    }

    [(mountEntry *)self doWait];
  }
  if (currentState == 2)
  {
    lastConnectError = self->lastConnectError;
    if (lastConnectError)
    {
      id v14 = lastConnectError;
    }
    else
    {
      fs_errorForPOSIXError();
      id v14 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    id v9 = v14;
    [(NSCondition *)self->_theLock unlock];
    id v21 = livefs_std_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100040E98(v21, v22, v23, v24, v25, v26, v27, v28);
    }
  }
  else
  {
    if (!self->_connecting)
    {
      self->_connecting = 1;
      v15 = dispatch_get_global_queue(2, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10003145C;
      block[3] = &unk_100058D88;
      block[4] = self;
      dispatch_async(v15, block);
    }
    if (self->_is_connected)
    {
LABEL_31:
      BOOL is_connected = 1;
LABEL_32:
      unint64_t v17 = self->_currentState;
    }
    else
    {
      char v29 = 0;
      while (1)
      {
        if (self->lastConnectError)
        {
          BOOL is_connected = 0;
          goto LABEL_32;
        }
        unint64_t v17 = self->_currentState;
        if (v17 != 1) {
          break;
        }
        if ((dword_100060728 != 0) | v29 & 1)
        {
          uint64_t v30 = livefs_std_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v35 = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "About to sleep for connecting", v35, 2u);
          }
        }
        [(mountEntry *)self doWait];
        if ((dword_100060728 != 0) | v29 & 1)
        {
          uint64_t v31 = livefs_std_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v35 = 0;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Waking from sleep for connecting", v35, 2u);
          }
        }
        if (!self->_is_connected)
        {
          if (self->lastConnectError || (self->_currentState != 1) | v29 & 1) {
            continue;
          }
          uint64_t v32 = livefs_std_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
            sub_100040E18(&v33, v34, v32);
          }

          char v29 = 1;
          if (!self->_is_connected) {
            continue;
          }
        }
        goto LABEL_31;
      }
      BOOL is_connected = 0;
    }
    if (v17 == 2 && !self->lastConnectError)
    {
      fs_errorForPOSIXError();
      id v18 = (NSError *)objc_claimAutoreleasedReturnValue();
      id v19 = self->lastConnectError;
      self->lastConnectError = v18;

      BOOL is_connected = self->_is_connected;
    }
    id v20 = self->lastConnectError;
    [(NSCondition *)self->_theLock unlock];
    if (is_connected) {
      id v9 = 0;
    }
    else {
      id v9 = v20;
    }
  }
LABEL_18:

  return v9;
}

- (unsigned)encryptedIdx
{
  return dword_100060788 + self->_midx;
}

- (void)handleConnectionInvalidated
{
  self->_BOOL is_connected = 0;
  id v4 = [(NSXPCConnection *)self->_theConn exportedObject];
  if (v4) {
    [v4 connectionWasInterupted];
  }
  theConn = self->_theConn;
  self->_theConn = 0;
}

- (void)handleConnectionInterrupted
{
  dispatch_semaphore_t v3 = dispatch_get_global_queue(2, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003158C;
  block[3] = &unk_100058D88;
  block[4] = self;
  dispatch_async(v3, block);
}

- (BOOL)ensureConnected:(int)a3 status:(id *)a4
{
  [(NSCondition *)self->_theLock lock];
  *a4 = 0;
  if (self->_is_connected)
  {
    [(NSCondition *)self->_theLock unlock];
    LOBYTE(v7) = 1;
  }
  else
  {
    [(NSCondition *)self->_theLock unlock];
    if (a3)
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      id v8 = [(mountEntry *)self connect];
      BOOL v7 = v8 == 0;
      if (v8)
      {
        id v9 = livefs_std_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100040F48();
        }

        *a4 = v8;
      }
    }
  }
  return v7;
}

- (void)copyDisconnectedRootAttrs:(_LIFileAttributes *)a3
{
  *(_OWORD *)&a3->var0 = 0u;
  *(_OWORD *)&a3->var2 = 0u;
  *(void *)&a3->var19 = 0;
  a3->var17 = 0u;
  a3->var18 = 0u;
  a3->var15 = 0u;
  a3->var16 = 0u;
  a3->var13 = 0u;
  a3->var14 = 0u;
  *(_OWORD *)&a3->var9 = 0u;
  *(_OWORD *)&a3->var11 = 0u;
  *(_OWORD *)&a3->var5 = 0u;
  a3->var1 = 7647;
  *(void *)&a3->var3 = 0x16D00000002;
  a3->var11 = self->_fileno;
  a3->var13.tv_sec = 1546329600;
  a3->var15.tv_sec = 1546329600;
  a3->var14.tv_sec = 1546329600;
  a3->var5 = 2;
  a3->var6 = getuid();
  a3->var7 = getgid();
  *(int64x2_t *)&a3->var9 = vdupq_n_s64(1uLL);
}

- (id)mount:(int)a3
{
  return [(mountEntry *)self mount:*(void *)&a3 options:0];
}

- (id)mount:(int)a3 options:(id)a4
{
  memset(v69, 0, sizeof(v69));
  BOOL v6 = livefs_std_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[mountEntry mount:options:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: will mount over LIFSv2", buf, 0xCu);
  }

  BOOL v7 = [(mountEntry *)self mntOn];
  id v8 = [v7 stringByStandardizingPath];
  p_realMountPath = &self->realMountPath;
  realMountPath = self->realMountPath;
  self->realMountPath = v8;

  if (dword_100060728 >= 2)
  {
    id v11 = livefs_std_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->realMountPath;
      v13 = [(mountEntry *)self mntOn];
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v12;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "realMountPath = %@, mntOn = %@", buf, 0x16u);
    }
  }
  id v14 = [(mountEntry *)self mntOn];
  if ([v14 hasPrefix:@"/private/"])
  {
    unsigned __int8 v15 = [(NSString *)*p_realMountPath hasPrefix:@"/private"];

    if (v15) {
      goto LABEL_11;
    }
    id v16 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"%@%@", @"/private", *p_realMountPath];
    id v14 = *p_realMountPath;
    *p_realMountPath = v16;
  }

LABEL_11:
  if (self->_midx)
  {
    unint64_t v17 = 0;
    self->_mnt_flags = a3;
    goto LABEL_67;
  }
  if (dword_100060728 >= 2)
  {
    id v18 = livefs_std_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "mountTable->mount: Enter", buf, 2u);
    }
  }
  uint64_t v19 = [(id)qword_100060770 mkMountPath:*p_realMountPath mountID:0];
  if (v19)
  {
    unint64_t v17 = (void *)v19;
    id v20 = livefs_std_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_10004137C();
    }

    goto LABEL_67;
  }
  if (dword_100060728 >= 2)
  {
    id v21 = livefs_std_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      rootLIFileHandle = self->_rootLIFileHandle;
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = rootLIFileHandle;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Got fh = %@", buf, 0xCu);
    }
  }
  if (!self->_rootLIFileHandle)
  {
    unint64_t v17 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
    goto LABEL_67;
  }
  sub_1000031DC([(mountEntry *)self midx], self->_rootLIFileHandle, v69);
  uint64_t v23 = (char *)malloc_type_malloc(0x81uLL, 0xCF491FD8uLL);
  uint64_t v24 = v23;
  if (v23)
  {
    uint64_t v25 = 0;
    uint64_t v26 = v23 + 1;
    do
    {
      unint64_t v27 = *((unsigned __int8 *)v69 + v25);
      *(v26 - 1) = a0123456789abcd[v27 >> 4];
      *uint64_t v26 = a0123456789abcd[v27 & 0xF];
      v26 += 2;
      ++v25;
    }
    while (v25 != 64);
    v23[128] = 0;
  }
  if (dword_100060728 >= 2)
  {
    uint64_t v28 = livefs_std_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = off_1000603A8;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = v24;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Mounting file system on port %@ with rootfh = %s", buf, 0x16u);
    }
  }
  unsigned int v29 = [(mountEntry *)self is_inet];
  CFStringRef v30 = @"proto=ticotsord";
  if (v29) {
    CFStringRef v30 = @"proto=tcp";
  }
  uint64_t v31 = 10;
  if ((a3 & 8) != 0) {
    uint64_t v31 = 0;
  }
  uint64_t v32 = +[NSMutableString stringWithFormat:@"fpnfs,noatime,%@,port=%@,rsize=%d,wsize=%d,readahead=%d,dsize=%d,actimeo=%d,locallocks,noquota,noexec,noowners,nobrowse", v30, off_1000603A8, 0x80000, 0x10000, 4, 0x10000, v31];
  uint8_t v33 = v32;
  if ((a3 & 0x10) == 0)
  {
    if ((a3 & 0x400) == 0) {
      goto LABEL_40;
    }
LABEL_44:
    [v33 appendString:@",nofollow"];
    if (v24) {
      goto LABEL_41;
    }
    goto LABEL_45;
  }
  [v32 appendString:@",sync"];
  if ((a3 & 0x400) != 0) {
    goto LABEL_44;
  }
LABEL_40:
  if (v24)
  {
LABEL_41:
    [v33 appendFormat:@",fh=%s", v24];
    free(v24);
    goto LABEL_46;
  }
LABEL_45:
  [v33 appendString:@",pfh"];
LABEL_46:
  __argv = "/sbin/mount_lifs";
  v67[0] = "-v";
  v67[1] = "-o";
  id v34 = v33;
  v67[2] = [v34 UTF8String];
  v67[3] = ":/";
  id v35 = [(mountEntry *)self mntOn];
  long long v68 = (unint64_t)[v35 UTF8String];

  id v36 = objc_alloc_init((Class)NSMutableString);
  unsigned int v37 = "/sbin/mount_lifs";
  if ("/sbin/mount_lifs")
  {
    int v38 = (const char **)v67;
    do
    {
      [v36 appendFormat:@"%s ", v37];
      __int16 v39 = *v38++;
      unsigned int v37 = v39;
    }
    while (v39);
  }
  *(void *)v63 = 0;
  v64[0] = 0;
  posix_spawnattr_t v62 = 0;
  v40 = livefs_std_log();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v36;
    _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "cmd: %@", buf, 0xCu);
  }

  posix_spawn_file_actions_init(v64);
  posix_spawn_file_actions_addinherit_np(v64, 0);
  posix_spawn_file_actions_addinherit_np(v64, 1);
  posix_spawn_file_actions_addinherit_np(v64, 2);
  posix_spawnattr_init(&v62);
  posix_spawnattr_setflags(&v62, 0x4000);
  if (posix_spawn(v63, "/sbin/mount_lifs", v64, &v62, &__argv, environ))
  {
    __int16 v41 = livefs_std_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      sub_100041304();
    }
    goto LABEL_62;
  }
  do
  {
    if (waitpid(v63[0], &v63[1], 0) != -1)
    {
      if ((v63[1] & 0x7F) != 0)
      {
        unsigned int v42 = livefs_std_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_100041280();
        }
        int v43 = -1;
      }
      else
      {
        int v43 = BYTE1(v63[1]);
        if (!BYTE1(v63[1])) {
          goto LABEL_74;
        }
        unsigned int v42 = livefs_std_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_100041208();
        }
      }

LABEL_74:
      posix_spawnattr_destroy(&v62);
      posix_spawn_file_actions_destroy(v64);

      if (v43) {
        goto LABEL_63;
      }
      uint64_t v46 = [(mountEntry *)self mntOn];
      v47 = (const char *)[v46 UTF8String];
      *(_OWORD *)id v64 = xmmword_100048770;
      uint64_t v65 = 0;
      uint64_t v72 = 0;
      long long v71 = 0u;
      memset(buf, 0, sizeof(buf));
      if (getattrlist(v47, v64, buf, 0x38uLL, 0))
      {
        uint64_t v48 = livefs_std_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_100041154((uint64_t)v47, v48);
        }
      }
      else
      {
        if ((buf[10] & 2) != 0)
        {
          int v56 = *(_DWORD *)&buf[24];
          int v55 = *(_DWORD *)&buf[28];

          id v57 = livefs_std_log();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
          {
            id v58 = [(mountEntry *)self mntOn];
            id v59 = [v58 UTF8String];
            *(_DWORD *)long long buf = 136315394;
            *(void *)&uint8_t buf[4] = v59;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v56;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "%s: FMT CAPS: 0x%08x", buf, 0x12u);
          }
          uint64_t v46 = livefs_std_log();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            id v60 = [(mountEntry *)self mntOn];
            id v61 = [v60 UTF8String];
            *(_DWORD *)long long buf = 136315394;
            *(void *)&uint8_t buf[4] = v61;
            *(_WORD *)&buf[12] = 1024;
            *(_DWORD *)&buf[14] = v55;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "%s: INT CAPS: 0x%08x", buf, 0x12u);
          }
          goto LABEL_82;
        }
        uint64_t v48 = livefs_std_log();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_1000410D4((uint64_t)v47, v48, v49, v50, v51, v52, v53, v54);
        }
      }

LABEL_82:
      unint64_t v17 = 0;
      self->_mnt_flags = a3;
      goto LABEL_66;
    }
  }
  while (*__error() == 4);
  __int16 v41 = livefs_std_log();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
    sub_100041048();
  }
LABEL_62:

  int v43 = -1;
LABEL_63:
  v44 = livefs_std_log();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
    sub_100040FC0(v43);
  }

  unint64_t v17 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v43 userInfo:0];
  [(mountEntry *)self removeMountTask];
LABEL_66:

LABEL_67:

  return v17;
}

- (void)renameToName:(id)a3 reply:(id)a4
{
  id v7 = a3;
  id v8 = (void (**)(id, void *))a4;
  id v9 = (void *)qword_100060740;
  volumeName = self->_volumeName;
  providerName = self->_providerName;
  id v20 = 0;
  unsigned __int8 v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472;
  unint64_t v17 = sub_1000322B8;
  id v18 = &unk_100059630;
  id v12 = v7;
  id v19 = v12;
  v13 = [v9 updateMountEntry:volumeName provider:providerName settingsDictionary:&v20 updateBlock:&v15];
  id v14 = v20;
  if (v13)
  {
    v8[2](v8, v13);
  }
  else
  {
    objc_storeStrong((id *)&self->_displayName, a3);
    +[LivefsDomainManager updateDomain:reply:](LivefsDomainManager, "updateDomain:reply:", v14, v8, v15, v16, v17, v18);
  }
}

- (int)isMountAtPath:(id)a3 err:(id *)a4
{
  id v5 = a3;
  id v14 = 0;
  if (v5)
  {
    int v6 = getmntinfo_r_np(&v14, 2);
    if (v6)
    {
      LODWORD(v7) = v6;
      id v8 = (const char *)[v5 UTF8String];
      int v9 = 0;
      id v10 = v14;
      if (v8 && (int)v7 >= 1)
      {
        id v11 = v8;
        uint64_t v7 = v7;
        f_mntonname = v14->f_mntonname;
        while (strcmp(v11, f_mntonname))
        {
          f_mntonname += 2168;
          if (!--v7)
          {
            int v9 = 0;
            goto LABEL_14;
          }
        }
        int v9 = 1;
      }
LABEL_14:
      free(v10);
    }
    else
    {
      if (a4)
      {
        *a4 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
      }
      int v9 = -1;
    }
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (BOOL)unmountPreflight:(int)a3
{
  if (!self->realMountPath) {
    return 0;
  }
  dispatch_semaphore_t v3 = self;
  objc_sync_enter(v3);
  if (*(_WORD *)&v3->_is_in_unmount_method)
  {
    BOOL v5 = 0;
  }
  else
  {
    BOOL v5 = 1;
    v3->_is_in_unmount_method = 1;
  }
  objc_sync_exit(v3);

  return v5;
}

- (void)removeMountTask
{
  p_mountTaskUUID = &self->_mountTaskUUID;
  id v4 = self->_mountTaskUUID;
  objc_sync_enter(v4);
  if (*p_mountTaskUUID)
  {
    BOOL v5 = livefs_std_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100041460();
    }

    [(id)qword_100060740 removeReferencesToTask:*p_mountTaskUUID];
    int v6 = *p_mountTaskUUID;
    *p_mountTaskUUID = 0;
  }
  objc_sync_exit(v4);

  uint64_t v7 = self->_resource;
  objc_sync_enter(v7);
  if (self->_resource)
  {
    id v8 = livefs_std_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = [(FSResource *)self->_resource getResourceID];
      sub_1000413F4(v9, v13, v8);
    }

    id v10 = [(id)qword_100060740 resourceManager];
    objc_sync_enter(v10);
    id v11 = [(id)qword_100060740 resourceManager];
    [v11 removeResource:self->_resource];

    objc_sync_exit(v10);
    resource = self->_resource;
    self->_resource = 0;
  }
  objc_sync_exit(v7);
}

- (id)unmountPostflight:(int)a3
{
  char v3 = a3;
  BOOL v5 = self->realMountPath;
  if ((v3 & 2) != 0)
  {
    self->_BOOL is_connected = 0;
    theConn = self->_theConn;
    self->_theConn = 0;

    uint64_t v7 = v5;
    int v8 = rmdir([(NSString *)v7 fileSystemRepresentation]);
    [(mountEntry *)self setCurrentState:2];
    if (v8)
    {
      int v9 = livefs_std_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000414E4(v7);
      }
    }
  }
  id v10 = self;
  objc_sync_enter(v10);
  *(_WORD *)&v10->_is_killing_io = 0;
  objc_sync_exit(v10);

  [(mountEntry *)v10 removeMountTask];
  return 0;
}

- (id)unmount:(int)a3
{
  char v3 = a3;
  BOOL v5 = self->realMountPath;
  int v6 = v5;
  if ((v3 & 2) == 0
    || ([(NSString *)v5 isEqual:@"/private/var/mobile/Library/LiveFiles"] & 1) != 0
    || ![(NSString *)v6 hasPrefix:@"/private/var/mobile/Library/LiveFiles"]
    || !fsctl([(NSString *)v6 fileSystemRepresentation], 0x20006E04uLL, 0, 0))
  {
    uint64_t v7 = 0;
    if ((v3 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  __error();
  uint64_t v7 = getNSErrorFromLiveFSErrno();
  int v8 = livefs_std_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1000415DC();
  }

  if ((v3 & 4) != 0)
  {
LABEL_10:
    int v9 = self;
    objc_sync_enter(v9);
    v9->_is_killing_io = 1;
    objc_sync_exit(v9);
  }
LABEL_11:
  id v37 = v7;
  unsigned int v10 = [(mountEntry *)self isMountAtPath:v6 err:&v37];
  id v11 = v37;

  if ((v10 & 0x80000000) != 0)
  {
    unsigned int v29 = livefs_std_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      sub_100041574();
    }

    goto LABEL_39;
  }
  if (v10 != 1)
  {
LABEL_39:
    CFStringRef v30 = 0;
    goto LABEL_49;
  }
  id v36 = v6;
  int v12 = (v3 & 1) << 19;
  v13 = v6;
  if (!unmount([(NSString *)v13 fileSystemRepresentation], v12)) {
    goto LABEL_34;
  }
  unsigned int v14 = 0;
  while (1)
  {
    unsigned int v15 = v14;
    uint64_t v16 = *__error();
    BOOL v17 = (v3 & 1) != 0 && v16 == 35;
    int v18 = v17;
    if (v17) {
      ++v14;
    }
    if (!v18 || v15 > 3) {
      break;
    }
    +[NSThread sleepForTimeInterval:0.002];
    storageName = self->_storageName;
    id v21 = livefs_std_log();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
    if (storageName)
    {
      if (v22)
      {
        uint64_t v23 = self->_storageName;
        *(_DWORD *)long long buf = 138412290;
        __int16 v39 = v23;
        uint64_t v24 = v21;
        uint64_t v25 = "unmount for %@ slept while looping";
        uint32_t v26 = 12;
LABEL_32:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, v25, buf, v26);
      }
    }
    else if (v22)
    {
      *(_WORD *)long long buf = 0;
      uint64_t v24 = v21;
      uint64_t v25 = "unmount for <unknown> slept while looping";
      uint32_t v26 = 2;
      goto LABEL_32;
    }

    if (!unmount([(NSString *)v13 fileSystemRepresentation], (v3 & 1) << 19))goto LABEL_34; {
  }
    }
  if ((v3 & 5) != 0 || !v16)
  {
    if (v16)
    {
      unint64_t v27 = livefs_std_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        realMountPath = self->realMountPath;
        *(_DWORD *)long long buf = 138412802;
        __int16 v39 = realMountPath;
        __int16 v40 = 1024;
        int v41 = v12;
        __int16 v42 = 1024;
        int v43 = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "unmount for %@ with %#x returned %{darwin.errno}d", buf, 0x18u);
      }
      goto LABEL_48;
    }
LABEL_34:
    unint64_t v27 = livefs_std_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = self->realMountPath;
      *(_DWORD *)long long buf = 138412802;
      __int16 v39 = v28;
      __int16 v40 = 1024;
      int v41 = v12;
      __int16 v42 = 1024;
      int v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "unmount for %@ with %#x returned %d", buf, 0x18u);
    }
LABEL_48:

    CFStringRef v30 = 0;
    int v6 = v36;
    goto LABEL_49;
  }
  uint64_t v31 = livefs_std_log();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412802;
    __int16 v39 = v13;
    __int16 v40 = 1024;
    int v41 = v12;
    __int16 v42 = 1024;
    int v43 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "unmount for %@ with %#x failed: %{darwin.errno}d]", buf, 0x18u);
  }

  uint64_t v32 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v16 userInfo:0];

  uint8_t v33 = self;
  objc_sync_enter(v33);
  v33->_is_in_unmount_method = 0;
  objc_sync_exit(v33);

  id v11 = v32;
  CFStringRef v30 = v11;
  int v6 = v36;
LABEL_49:

  return v30;
}

- (void)forgetModuleVolumeWithFlags:(unsigned int)a3 reply:(id)a4
{
  int v6 = (void (**)(id, void *))a4;
  if (![(mountEntry *)self isFSKitModule])
  {
    unsigned int v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10004173C();
    }
    goto LABEL_9;
  }
  instance = self->_instance;
  if (!instance)
  {
    unsigned int v10 = fskit_std_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100041650();
    }
LABEL_9:

    id v11 = fs_errorForPOSIXError();
    v6[2](v6, v11);

    goto LABEL_17;
  }
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint32_t v26 = sub_10002E4C4;
  unint64_t v27 = sub_10002E4D4;
  id v28 = 0;
  id obj = 0;
  id v8 = [(fskitdExtensionInstance *)instance newXPCConnectionWithError:&obj];
  objc_storeStrong(&v28, obj);
  if (v24[5])
  {
    int v9 = fskit_std_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000416C8();
    }

    v6[2](v6, (void *)v24[5]);
  }
  else
  {
    int v12 = fskit_std_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      CFStringRef v30 = "-[mountEntry forgetModuleVolumeWithFlags:reply:]";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: Creating FSModuleXPC sync proxy", buf, 0xCu);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100032F70;
    v21[3] = &unk_100059568;
    v21[4] = self;
    void v21[5] = &v23;
    v13 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v21];
    volumeID = self->_volumeID;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100032FEC;
    v20[3] = &unk_100058868;
    v20[4] = &v23;
    [v13 deactivateVolume:volumeID numericOptions:a3 replyHandler:v20];
    unsigned int v15 = [(id)qword_100060740 resourceManager];
    objc_sync_enter(v15);
    uint64_t v16 = [(id)qword_100060740 resourceManager];
    BOOL v17 = [(FSResource *)self->_resource getResourceID];
    int v18 = [v16 getResource:v17];

    [v18 setState:0];
    id v19 = [(id)qword_100060740 resourceManager];
    [v19 updateResource:v18];

    objc_sync_exit(v15);
    [(FSResource *)self->_resource revoke];
    [(fskitdExtensionInstance *)self->_instance terminate];
    v6[2](v6, (void *)v24[5]);
  }
  _Block_object_dispose(&v23, 8);

LABEL_17:
}

- (void)resetConnectError
{
  self->lastConnectError = 0;
  _objc_release_x1();
}

- (BOOL)is_connected
{
  return self->_is_connected;
}

- (void)setIs_connected:(BOOL)a3
{
  self->_BOOL is_connected = a3;
}

- (BOOL)is_inet
{
  return self->_is_inet;
}

- (void)setIs_inet:(BOOL)a3
{
  self->_is_inet = a3;
}

- (BOOL)is_killing_io
{
  return self->_is_killing_io;
}

- (void)setIs_killing_io:(BOOL)a3
{
  self->_is_killing_io = a3;
}

- (BOOL)is_in_unmount_method
{
  return self->_is_in_unmount_method;
}

- (void)setIs_in_unmount_method:(BOOL)a3
{
  self->_is_in_unmount_method = a3;
}

- (BOOL)is_in_unmount_syscall
{
  return self->_is_in_unmount_syscall;
}

- (void)setIs_in_unmount_syscall:(BOOL)a3
{
  self->_is_in_unmount_syscall = a3;
}

- (unsigned)midx
{
  return self->_midx;
}

- (NSString)volumeName
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)fileSystem
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)storageName
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)providerName
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)mntOn
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (mountTable)mntTable
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mntTable);

  return (mountTable *)WeakRetained;
}

- (NSString)rootLIFileHandle
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (NSError)domainError
{
  return (NSError *)objc_getProperty(self, a2, 184, 1);
}

- (void)setDomainError:(id)a3
{
}

- (unsigned)fileno
{
  return self->_fileno;
}

- (void)setFileno:(unsigned int)a3
{
  self->_fileno = a3;
}

- (int)mnt_flags
{
  return self->_mnt_flags;
}

- (BOOL)isFSKitModule
{
  return self->_isFSKitModule;
}

- (FSAuditToken)auditToken
{
  return (FSAuditToken *)objc_getProperty(self, a2, 192, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_domainError, 0);
  objc_storeStrong((id *)&self->_rootLIFileHandle, 0);
  objc_destroyWeak((id *)&self->_mntTable);
  objc_storeStrong((id *)&self->_mntOn, 0);
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_storageName, 0);
  objc_storeStrong((id *)&self->_fileSystem, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_volumeName, 0);
  objc_storeStrong((id *)&self->_volumeID, 0);
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_mountTaskUUID, 0);
  objc_storeStrong((id *)&self->lastConnectError, 0);
  objc_storeStrong((id *)&self->_theLock, 0);
  objc_storeStrong((id *)&self->_theConn, 0);
  objc_storeStrong((id *)&self->_fsObj, 0);

  objc_storeStrong((id *)&self->realMountPath, 0);
}

@end