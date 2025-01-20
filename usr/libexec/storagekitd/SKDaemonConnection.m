@interface SKDaemonConnection
+ (int64_t)checkPrivilegeLevelWithConnection:(id)a3;
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)authorizeRequestForRoot;
- (BOOL)preflightRequestWithSKDisk:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 authorizationNeeded:(BOOL)a7;
- (BOOL)preflightRequestWithSKDisk:(id)a3 entitlementLevel:(int64_t)a4 prettyFunc:(const char *)a5;
- (BOOL)requiresMountAudit;
- (SKDaemonConnection)initWithConnection:(id)a3;
- (id)_safe_object:(id)a3;
- (id)eraseWithEraser:(id)a3 reply:(id)a4;
- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 authorizationNeeded:(BOOL)a7 failResGenFunc:(id)a8;
- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 failResGenFunc:(id)a7;
- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 requireRoot:(BOOL)a7 failResGenFunc:(id)a8;
- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 prettyFunc:(const char *)a5;
- (id)preflightRequestWithDisksArr:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 requireRootForInternal:(BOOL)a7 failResGenFunc:(id)a8;
- (id)resizeDisk:(id)a3 size:(unint64_t)a4 reply:(id)a5;
- (int64_t)privilege;
- (unsigned)authRef;
- (unsigned)gid;
- (unsigned)uid;
- (void)childDisksForWholeDisk:(id)a3 withCompletionUUID:(id)a4;
- (void)diskForPath:(id)a3 withCompletionUUID:(id)a4;
- (void)disksAppeared:(id)a3;
- (void)disksChanged:(id)a3;
- (void)disksDisappeared:(id)a3;
- (void)ejectDisk:(id)a3 withCompletionUUID:(id)a4;
- (void)filesystemsWithCompletionUUID:(id)a3;
- (void)initialPopulateComplete;
- (void)isBusyWithCompletionUUID:(id)a3;
- (void)managerResumed;
- (void)managerStalled;
- (void)mountDisk:(id)a3 options:(id)a4 withCompletionUUID:(id)a5;
- (void)physicalStoresForAPFSVolume:(id)a3 withCompletionUUID:(id)a4;
- (void)recacheDisk:(id)a3 options:(unint64_t)a4 withCompletionUUID:(id)a5;
- (void)renameDisk:(id)a3 to:(id)a4 withCompletionUUID:(id)a5;
- (void)setAuthRef:(unsigned __int8)a3;
- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionUUID:(id)a5;
- (void)setPrivilege:(int64_t)a3;
- (void)syncAllDisksWithCompletionUUID:(id)a3;
- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionUUID:(id)a5;
- (void)volumesForAPFSPS:(id)a3 withCompletionUUID:(id)a4;
- (void)wholeDiskForDiskDictionary:(id)a3 withCompletionUUID:(id)a4;
@end

@implementation SKDaemonConnection

+ (int64_t)checkPrivilegeLevelWithConnection:(id)a3
{
  id v3 = a3;
  v4 = sub_10000DD48();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "A SK client wants to connect", (uint8_t *)v14, 2u);
  }

  if (sub_10000EA54((uint64_t)off_1000557B0, v3))
  {
    v5 = sub_10000DD48();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client entitled for destructive operations", (uint8_t *)v14, 2u);
    }
    int64_t v6 = 3;
    goto LABEL_22;
  }
  if (sub_10000EA54((uint64_t)off_1000557A8, v3))
  {
    v5 = sub_10000DD48();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      int64_t v6 = 2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client entitled for destructive external operations", (uint8_t *)v14, 2u);
    }
    else
    {
      int64_t v6 = 2;
    }
    goto LABEL_22;
  }
  if (!sub_10000EA54((uint64_t)off_1000557A0, v3))
  {
    BOOL v7 = sub_10000EA54((uint64_t)off_100055798, v3);
    v5 = sub_10000DD48();
    BOOL v8 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v8)
      {
        LOWORD(v14[0]) = 0;
        v9 = "Client entitled for information";
        v10 = v5;
        uint32_t v11 = 2;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)v14, v11);
      }
    }
    else if (v8)
    {
      unsigned int v12 = [v3 processIdentifier];
      v14[0] = 67109120;
      v14[1] = v12;
      v9 = "Client (%d) not entitiled, applying default level (information)";
      v10 = v5;
      uint32_t v11 = 8;
      goto LABEL_20;
    }
    int64_t v6 = 0;
    goto LABEL_22;
  }
  v5 = sub_10000DD48();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client entitled for state-changing", (uint8_t *)v14, 2u);
  }
  int64_t v6 = 1;
LABEL_22:

  return v6;
}

- (SKDaemonConnection)initWithConnection:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SKDaemonConnection;
  v5 = [(SKDaemonConnection *)&v17 init];
  if (!v5)
  {
LABEL_14:
    v9 = v5;
    goto LABEL_15;
  }
  int64_t v6 = +[SKDaemonConnection checkPrivilegeLevelWithConnection:v4];
  *((void *)v5 + 4) = v6;
  if (v6 != -1)
  {
    if (sub_10000EA54((uint64_t)off_1000557B8, v4))
    {
      BOOL v7 = sub_10000DD48();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Client has audited mounts entitlement", buf, 2u);
      }

      v5[16] = 1;
    }
    BOOL v8 = sub_10000322C();
    [v4 setExportedInterface:v8];

    [v4 setExportedObject:v5];
    *((_DWORD *)v5 + 5) = [v4 effectiveUserIdentifier];
    *((_DWORD *)v5 + 6) = [v4 effectiveGroupIdentifier];
    if (v4) {
      [v4 auditToken];
    }
    else {
      memset(buf, 0, 32);
    }
    long long v10 = *(_OWORD *)&buf[16];
    *(_OWORD *)(v5 + 40) = *(_OWORD *)buf;
    *(_OWORD *)(v5 + 56) = v10;
    uint32_t v11 = sub_1000033D8();
    [v4 setRemoteObjectInterface:v11];

    uint64_t v12 = [v4 remoteObjectProxyWithErrorHandler:&stru_100048E98];
    v13 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v12;

    v14 = sub_10000DD48();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = [v4 processIdentifier];
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = "-[SKDaemonConnection initWithConnection:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Connected via XPC from pid %d", buf, 0x12u);
    }

    goto LABEL_14;
  }
  v9 = 0;
LABEL_15:

  return v9;
}

- (BOOL)authorizeRequestForRoot
{
  v2 = sub_10000DD48();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315138;
    v5 = "-[SKDaemonConnection authorizeRequestForRoot]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s: Not allowed for non-root users on this platform", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (BOOL)preflightRequestWithSKDisk:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 authorizationNeeded:(BOOL)a7
{
  id v11 = a3;
  uint64_t v12 = (char *)a5;
  if (!v11)
  {
    v14 = sub_10000DD48();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v16 = "Couldn't find disk for given disk dictionary.";
      objc_super v17 = v14;
      uint32_t v18 = 2;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  int64_t v13 = [(SKDaemonConnection *)self privilege];
  if ([v11 isExternal] && (id)-[SKDaemonConnection privilege](self, "privilege") == (id)2) {
    int64_t v13 = 3;
  }
  if (v13 < a4)
  {
    v14 = sub_10000DD48();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v15)
      {
        *(_DWORD *)buf = 138543362;
        v26 = v12;
        v16 = "Missing entitlement, request denied for UUID: %{public}@.";
LABEL_14:
        objc_super v17 = v14;
        uint32_t v18 = 12;
        goto LABEL_15;
      }
    }
    else if (v15)
    {
      *(_DWORD *)buf = 136446210;
      v26 = a6;
      v16 = "Missing entitlement, request denied for API: %{public}s.";
      goto LABEL_14;
    }
LABEL_16:
    BOOL v20 = 0;
    goto LABEL_17;
  }
  v19 = +[SKDaemonManager sharedManager];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000F058;
  v22[3] = &unk_100048EC0;
  v24 = a6;
  v23 = v11;
  [v19 logEvent:@"com.apple.StorageKit.storagekitd.usage" eventPayloadBuilder:v22];

  BOOL v20 = 1;
  v14 = v23;
LABEL_17:

  return v20;
}

- (BOOL)preflightRequestWithSKDisk:(id)a3 entitlementLevel:(int64_t)a4 prettyFunc:(const char *)a5
{
  return [(SKDaemonConnection *)self preflightRequestWithSKDisk:a3 entitlementLevel:a4 completionUUID:0 prettyFunc:a5 authorizationNeeded:1];
}

- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 prettyFunc:(const char *)a5
{
  id v8 = a3;
  v9 = sub_10000DD48();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v8;
    __int16 v17 = 2080;
    uint32_t v18 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s", (uint8_t *)&v15, 0x16u);
  }

  long long v10 = +[SKDaemonManager sharedManager];
  id v11 = [v10 knownDiskForDictionary:v8];

  unsigned int v12 = [(SKDaemonConnection *)self preflightRequestWithSKDisk:v11 entitlementLevel:a4 completionUUID:0 prettyFunc:a5 authorizationNeeded:1];
  id v13 = 0;
  if (v12) {
    id v13 = v11;
  }

  return v13;
}

- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 failResGenFunc:(id)a7
{
  return [(SKDaemonConnection *)self preflightRequestWithDiskDict:a3 entitlementLevel:a4 completionUUID:a5 prettyFunc:a6 authorizationNeeded:1 failResGenFunc:a7];
}

- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 requireRoot:(BOOL)a7 failResGenFunc:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = (void (**)(void))a8;
  if (v9 && ![(SKDaemonConnection *)self authorizeRequestForRoot])
  {
    progressHandler = self->_progressHandler;
    v19 = v16[2](v16);
    [(SKHelperClientProtocol *)progressHandler requestWithUUID:v15 didCompleteWithResult:v19];

    __int16 v17 = 0;
  }
  else
  {
    __int16 v17 = [(SKDaemonConnection *)self preflightRequestWithDiskDict:v14 entitlementLevel:a4 completionUUID:v15 prettyFunc:a6 authorizationNeeded:!v9 failResGenFunc:v16];
  }

  return v17;
}

- (id)preflightRequestWithDiskDict:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 authorizationNeeded:(BOOL)a7 failResGenFunc:(id)a8
{
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = (void (**)(void))a8;
  __int16 v17 = sub_10000DD48();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412802;
    id v25 = v14;
    __int16 v26 = 2080;
    v27 = a6;
    __int16 v28 = 2114;
    id v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s with UUID: %{public}@", (uint8_t *)&v24, 0x20u);
  }

  uint32_t v18 = +[SKDaemonManager sharedManager];
  v19 = [v18 knownDiskForDictionary:v14];

  if ([(SKDaemonConnection *)self preflightRequestWithSKDisk:v19 entitlementLevel:a4 completionUUID:v15 prettyFunc:a6 authorizationNeeded:v9])
  {
    id v20 = v19;
  }
  else
  {
    progressHandler = self->_progressHandler;
    v22 = v16[2](v16);
    [(SKHelperClientProtocol *)progressHandler requestWithUUID:v15 didCompleteWithResult:v22];

    id v20 = 0;
  }

  return v20;
}

- (id)preflightRequestWithDisksArr:(id)a3 entitlementLevel:(int64_t)a4 completionUUID:(id)a5 prettyFunc:(const char *)a6 requireRootForInternal:(BOOL)a7 failResGenFunc:(id)a8
{
  BOOL v33 = a7;
  id v13 = a3;
  id v34 = a5;
  id v14 = (void (**)(void))a8;
  id v15 = sub_10000DD48();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v41 = v13;
    __int16 v42 = 2080;
    v43 = a6;
    __int16 v44 = 2114;
    id v45 = v34;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s with UUID: %{public}@", buf, 0x20u);
  }

  id v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v13 count]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v13;
  id v17 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v36;
    v31 = v14;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        v22 = +[SKDaemonManager sharedManager];
        v23 = [v22 knownDiskForDictionary:v21];

        if (!v23)
        {
          v27 = sub_10000DD48();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Couldn't find disk for given disk dictionary.", buf, 2u);
          }

LABEL_21:
          progressHandler = self->_progressHandler;
          id v14 = v31;
          id v29 = v31[2](v31);
          [(SKHelperClientProtocol *)progressHandler requestWithUUID:v34 didCompleteWithResult:v29];
          id v25 = obj;

          id v26 = 0;
          goto LABEL_22;
        }
        if (v33)
        {
          unsigned int v24 = [v23 isInternal];
          if (![(SKDaemonConnection *)self preflightRequestWithSKDisk:v23 entitlementLevel:a4 completionUUID:v34 prettyFunc:a6 authorizationNeeded:v24 ^ 1]|| v24 && ![(SKDaemonConnection *)self authorizeRequestForRoot])
          {
            goto LABEL_21;
          }
        }
        else if (![(SKDaemonConnection *)self preflightRequestWithSKDisk:v23 entitlementLevel:a4 completionUUID:v34 prettyFunc:a6 authorizationNeeded:1])
        {
          goto LABEL_21;
        }
        [v16 addObject:v23];
      }
      id v18 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
      id v14 = v31;
      if (v18) {
        continue;
      }
      break;
    }
  }
  id v25 = obj;

  id v26 = v16;
LABEL_22:

  return v26;
}

- (void)initialPopulateComplete
{
}

- (void)disksAppeared:(id)a3
{
}

- (void)disksChanged:(id)a3
{
}

- (void)disksDisappeared:(id)a3
{
}

- (void)managerStalled
{
}

- (void)managerResumed
{
}

- (void)syncAllDisksWithCompletionUUID:(id)a3
{
  id v4 = a3;
  v5 = sub_10000DD48();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "DAEMON - waiting for initialPopulateComplete", buf, 2u);
  }

  int64_t v6 = +[SKDaemonManager sharedManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000FAEC;
  v8[3] = &unk_100048EE8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 syncAllDisksWithCompletionBlock:v8];
}

- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionUUID:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  long long v10 = sub_10000DD48();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SKDaemonConnection setDaemonOptionsWithLanguage:authRef:withCompletionUUID:]";
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Preflight at %s with UUID: %{public}@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v17 = 1;
  id v11 = +[SKDaemonManager sharedManager];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000FCB8;
  v13[3] = &unk_100048F10;
  v13[4] = self;
  id v12 = v9;
  id v14 = v12;
  id v15 = buf;
  [v11 setDaemonOptionsWithLanguage:v8 authRef:v6 withCompletionBlock:v13];

  _Block_object_dispose(buf, 8);
}

- (void)diskForPath:(id)a3 withCompletionUUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_10000DD48();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v14 = "-[SKDaemonConnection diskForPath:withCompletionUUID:]";
    __int16 v15 = 2114;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preflight at %s with UUID: %{public}@", buf, 0x16u);
  }

  id v9 = +[SKDaemonManager sharedManager];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000FEE4;
  v11[3] = &unk_100048F38;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 diskForPath:v7 withCallbackBlock:v11];
}

- (void)wholeDiskForDiskDictionary:(id)a3 withCompletionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000DD48();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v6;
    __int16 v17 = 2080;
    id v18 = "-[SKDaemonConnection wholeDiskForDiskDictionary:withCompletionUUID:]";
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s with UUID: %{public}@", buf, 0x20u);
  }

  id v9 = +[SKDaemonManager sharedManager];
  id v10 = +[SKDaemonManager sharedManager];
  id v11 = [v10 knownDiskForDictionary:v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10001013C;
  v13[3] = &unk_100048F38;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v9 wholeDiskForDisk:v11 withCallbackBlock:v13];
}

- (void)childDisksForWholeDisk:(id)a3 withCompletionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000DD48();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v6;
    __int16 v17 = 2080;
    id v18 = "-[SKDaemonConnection childDisksForWholeDisk:withCompletionUUID:]";
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s with UUID: %{public}@", buf, 0x20u);
  }

  id v9 = +[SKDaemonManager sharedManager];
  id v10 = +[SKDaemonManager sharedManager];
  id v11 = [v10 knownDiskForDictionary:v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100010394;
  v13[3] = &unk_100048F60;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v9 childDisksForWholeDisk:v11 withCallbackBlock:v13];
}

- (void)isBusyWithCompletionUUID:(id)a3
{
  id v4 = a3;
  v5 = sub_10000DD48();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SKDaemonConnection isBusyWithCompletionUUID:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Preflight at %s with UUID: %{public}@", buf, 0x16u);
  }

  id v6 = +[SKDaemonManager sharedManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010654;
  v8[3] = &unk_100048F88;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 isBusy:v8];
}

- (void)recacheDisk:(id)a3 options:(unint64_t)a4 withCompletionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = sub_10000DD48();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v18 = v8;
    __int16 v19 = 2080;
    id v20 = "-[SKDaemonConnection recacheDisk:options:withCompletionUUID:]";
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s with UUID: %{public}@", buf, 0x20u);
  }

  id v11 = +[SKDaemonManager sharedManager];
  __int16 v12 = +[SKDaemonManager sharedManager];
  id v13 = [v12 knownDiskForDictionary:v8];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000108A8;
  v15[3] = &unk_100048EE8;
  v15[4] = self;
  id v16 = v9;
  id v14 = v9;
  [v11 recacheDisk:v13 options:a4 callbackBlock:v15];
}

- (void)filesystemsWithCompletionUUID:(id)a3
{
  id v4 = a3;
  v5 = sub_10000DD48();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SKDaemonConnection filesystemsWithCompletionUUID:]";
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Preflight at %s with UUID: %{public}@", buf, 0x16u);
  }

  id v6 = +[SKDaemonManager sharedManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100010A04;
  v8[3] = &unk_100048F60;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v6 filesystemsWithCallbackBlock:v8];
}

- (void)physicalStoresForAPFSVolume:(id)a3 withCompletionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000DD48();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v6;
    __int16 v17 = 2080;
    id v18 = "-[SKDaemonConnection physicalStoresForAPFSVolume:withCompletionUUID:]";
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s with UUID: %{public}@", buf, 0x20u);
  }

  id v9 = +[SKDaemonManager sharedManager];
  id v10 = +[SKDaemonManager sharedManager];
  id v11 = [v10 knownDiskForDictionary:v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100010C48;
  v13[3] = &unk_100048F60;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v9 physicalStoresForAPFSVolume:v11 completionBlock:v13];
}

- (void)volumesForAPFSPS:(id)a3 withCompletionUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000DD48();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v6;
    __int16 v17 = 2080;
    id v18 = "-[SKDaemonConnection volumesForAPFSPS:withCompletionUUID:]";
    __int16 v19 = 2114;
    id v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preflight for %@ at %s with UUID: %{public}@", buf, 0x20u);
  }

  id v9 = +[SKDaemonManager sharedManager];
  id v10 = +[SKDaemonManager sharedManager];
  id v11 = [v10 knownDiskForDictionary:v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100010F6C;
  v13[3] = &unk_100048F60;
  v13[4] = self;
  id v14 = v7;
  id v12 = v7;
  [v9 volumesForAPFSPS:v11 completionBlock:v13];
}

- (void)renameDisk:(id)a3 to:(id)a4 withCompletionUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = -[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:](self, "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:", a3, 1, v9, "-[SKDaemonConnection renameDisk:to:withCompletionUUID:]", &stru_100048FC8);
  if (v10)
  {
    id v11 = +[SKDaemonManager sharedManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000112AC;
    v12[3] = &unk_100048FF0;
    v12[4] = self;
    id v13 = v9;
    [v11 renameDisk:v10 to:v8 withCompletionBlock:v12];
  }
}

- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionUUID:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = -[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:](self, "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:", a3, 1, v9, "-[SKDaemonConnection unmountDisk:options:withCompletionUUID:]", &stru_100049010);
  if (v10)
  {
    id v11 = +[SKDaemonManager sharedManager];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001150C;
    v12[3] = &unk_100048FF0;
    v12[4] = self;
    id v13 = v9;
    [v11 unmountDisk:v10 options:v8 withCompletionBlock:v12];
  }
}

- (void)mountDisk:(id)a3 options:(id)a4 withCompletionUUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[SKDaemonManager sharedManager];
  id v12 = [v11 knownDiskForDictionary:v10];

  id v13 = [SKMountOperation alloc];
  __int16 v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  __int16 v21 = sub_1000117B0;
  id v22 = &unk_100048FF0;
  v23 = self;
  id v14 = v8;
  id v24 = v14;
  __int16 v15 = [(SKMountOperation *)v13 initWithDisk:v12 options:v9 connection:self completionBlock:&v19];

  if (v15)
  {
    if (-[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:](self, "preflightRequestWithSKDisk:entitlementLevel:completionUUID:prettyFunc:authorizationNeeded:", v12, 1, v14, "-[SKDaemonConnection mountDisk:options:withCompletionUUID:]", [(SKMountOperation *)v15 authenticateOnInit] ^ 1))
    {
      id v16 = +[SKDaemonManager sharedManager];
      [v16 _scheduleOperation:v15];
    }
    else
    {
      progressHandler = self->_progressHandler;
      id v16 = +[SKError errorWithCode:112 userInfo:0];
      id v25 = v16;
      id v18 = +[NSArray arrayWithObjects:&v25 count:1];
      [(SKHelperClientProtocol *)progressHandler requestWithUUID:v14 didCompleteWithResult:v18];
    }
  }
}

- (void)ejectDisk:(id)a3 withCompletionUUID:(id)a4
{
  id v6 = a4;
  id v7 = -[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:](self, "preflightRequestWithDiskDict:entitlementLevel:completionUUID:prettyFunc:failResGenFunc:", a3, 1, v6, "-[SKDaemonConnection ejectDisk:withCompletionUUID:]", &stru_100049030);
  if (v7)
  {
    id v8 = +[SKDaemonManager sharedManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000119F4;
    v9[3] = &unk_100048FF0;
    v9[4] = self;
    id v10 = v6;
    [v8 ejectDisk:v7 withCompletionBlock:v9];
  }
}

- (id)_safe_object:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = +[NSNull null];
  }
  id v6 = v5;

  return v6;
}

- (id)eraseWithEraser:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_10000DD48();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2082;
    __int16 v21 = "-[SKDaemonConnection eraseWithEraser:reply:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preflight check for %@ at %{public}s", buf, 0x16u);
  }

  id v9 = [v6 disk];
  unsigned __int8 v10 = -[SKDaemonConnection preflightRequestWithSKDisk:entitlementLevel:prettyFunc:](self, "preflightRequestWithSKDisk:entitlementLevel:prettyFunc:", v9, 3, "-[SKDaemonConnection eraseWithEraser:reply:]");

  if (v10)
  {
    id v11 = +[SKDaemonManager sharedManager];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100011D04;
    v15[3] = &unk_100049058;
    v15[4] = self;
    id v16 = v7;
    id v12 = [v11 eraseWithEraser:v6 completionBlock:v15];
    id v13 = v16;
  }
  else
  {
    id v11 = +[SKError errorWithCode:112 userInfo:0];
    __int16 v17 = v11;
    id v13 = +[NSArray arrayWithObjects:&v17 count:1];
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
    id v12 = 0;
  }

  return v12;
}

- (id)resizeDisk:(id)a3 size:(unint64_t)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = -[SKDaemonConnection preflightRequestWithDiskDict:entitlementLevel:prettyFunc:](self, "preflightRequestWithDiskDict:entitlementLevel:prettyFunc:", a3, 3, "-[SKDaemonConnection resizeDisk:size:reply:]");
  if (v9)
  {
    unsigned __int8 v10 = +[SKDaemonManager sharedManager];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    _DWORD v14[2] = sub_100011FB4;
    v14[3] = &unk_100049080;
    id v15 = v8;
    id v11 = [v10 resize:v9 toSize:a4 completionBlock:v14];
  }
  else
  {
    id v12 = +[SKError errorWithCode:112 userInfo:0];
    (*((void (**)(id, void *))v8 + 2))(v8, v12);

    id v11 = 0;
  }

  return v11;
}

- (int64_t)privilege
{
  return self->_privilege;
}

- (void)setPrivilege:(int64_t)a3
{
  self->_privilege = a3;
}

- (BOOL)requiresMountAudit
{
  return self->_requiresMountAudit;
}

- (unsigned)uid
{
  return self->_uid;
}

- (unsigned)gid
{
  return self->_gid;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (unsigned)authRef
{
  return self->_authRef;
}

- (void)setAuthRef:(unsigned __int8)a3
{
  self->_authRef = a3;
}

- (void).cxx_destruct
{
}

@end