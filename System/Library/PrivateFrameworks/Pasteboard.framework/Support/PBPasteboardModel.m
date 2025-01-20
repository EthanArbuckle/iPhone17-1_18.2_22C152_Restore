@interface PBPasteboardModel
+ (id)sharedModel;
- (NSMutableDictionary)workQueue_pasteboardCache;
- (OS_dispatch_queue)workQueue;
- (id)_init;
- (id)workQueue_getAllPasteboardsOutError:(id *)a3;
- (id)workQueue_pasteboardWithPersistenceName:(id)a3 name:(id)a4 localOnly:(BOOL)a5;
- (id)workQueue_pasteboardWithPersistenceName:(id)a3 name:(id)a4 localOnly:(BOOL)a5 deleteIfExpired:(BOOL)a6;
- (id)workQueue_saveGeneralPasteboardFromContinuityPasteboard:(id)a3;
- (id)workQueue_savePasteboard:(id)a3 isServerToServerCopy:(BOOL)a4 outNotificationState:(unint64_t *)a5 outChangeCount:(int64_t *)a6;
- (id)workQueue_unserializePasteboardWithPersistenceName:(id)a3;
- (void)_clearRemotePasteboard;
- (void)_pushRemotePasteboard:(id)a3;
- (void)_remotePasteboardDidBecomeAvailable:(BOOL)a3;
- (void)_remotePasteboardWillBeFetched:(id)a3;
- (void)deleteOrphanedPasteboardFilesCompletionBlock:(id)a3;
- (void)deletePasteboardNamed:(id)a3 bundleID:(id)a4 teamID:(id)a5 completionBlock:(id)a6;
- (void)getAllPasteboardsCompletionBlock:(id)a3;
- (void)getExistingPasteboardWithPersistenceName:(id)a3 name:(id)a4 UUID:(id)a5 processInfo:(id)a6 completionBlock:(id)a7;
- (void)getPasteboardNamed:(id)a3 bundleID:(id)a4 teamID:(id)a5 createIfNeeded:(BOOL)a6 localOnly:(BOOL)a7 processInfo:(id)a8 deviceIsLocked:(BOOL)a9 completionBlock:(id)a10;
- (void)getPasteboardWithPersistenceName:(id)a3 name:(id)a4 createIfNeeded:(BOOL)a5 localOnly:(BOOL)a6 processInfo:(id)a7 deviceIsLocked:(BOOL)a8 completionBlock:(id)a9;
- (void)savePasteboard:(id)a3 deviceIslocked:(BOOL)a4 completionBlock:(id)a5;
- (void)setWorkQueue:(id)a3;
- (void)setWorkQueue_pasteboardCache:(id)a3;
- (void)workQueue_createRemoteGeneralPasteboardWithChangeCount:(int64_t)a3;
- (void)workQueue_deleteOrphanedPasteboardFiles;
- (void)workQueue_deletePasteboardWithPersistenceName:(id)a3;
- (void)workQueue_deletePasteboardWithPersistenceName:(id)a3 regenerateGeneralPasteboard:(BOOL)a4;
- (void)workQueue_faultDataForRemotePasteboard:(id)a3 processInfo:(id)a4 completionBlock:(id)a5;
- (void)workQueue_faultMetadataForRemotePasteboard:(id)a3 processInfo:(id)a4 completionBlock:(id)a5;
- (void)workQueue_reallyFaultDataForRemotePasteboard:(id)a3 processInfo:(id)a4 completionBlock:(id)a5;
- (void)workQueue_reallyFaultMetadataForRemotePasteboard:(id)a3 processInfo:(id)a4 completionBlock:(id)a5;
- (void)workQueue_removeRemotePasteboardAndRestoreGeneralPasteboard;
@end

@implementation PBPasteboardModel

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)PBPasteboardModel;
  v2 = [(PBPasteboardModel *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.pasteboard.PBPasteboardModel-work-queue", 0);
    [(PBPasteboardModel *)v2 setWorkQueue:v3];

    v4 = +[NSMutableDictionary dictionary];
    [(PBPasteboardModel *)v2 setWorkQueue_pasteboardCache:v4];
  }
  return v2;
}

+ (id)sharedModel
{
  if (qword_100039508 != -1) {
    dispatch_once(&qword_100039508, &stru_100030AE8);
  }
  v2 = (void *)qword_100039500;
  return v2;
}

- (id)workQueue_unserializePasteboardWithPersistenceName:(id)a3
{
  id v3 = a3;
  v4 = PBStorageRootURL();
  v5 = +[PBItemCollection unserializeCollectionFromBaseURL:v4 persistenceName:v3 outError:0];

  return v5;
}

- (id)workQueue_pasteboardWithPersistenceName:(id)a3 name:(id)a4 localOnly:(BOOL)a5
{
  return [(PBPasteboardModel *)self workQueue_pasteboardWithPersistenceName:a3 name:a4 localOnly:a5 deleteIfExpired:1];
}

- (id)workQueue_pasteboardWithPersistenceName:(id)a3 name:(id)a4 localOnly:(BOOL)a5 deleteIfExpired:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  v13 = 0;
  if (v10 && v11)
  {
    int v14 = 5;
    while (1)
    {
      v15 = [(PBPasteboardModel *)self workQueue_pasteboardCache];
      v13 = [v15 objectForKeyedSubscript:v10];

      if (!v7) {
        break;
      }
      if (!v13 || [v13 isRemote])
      {
        uint64_t v16 = [(PBPasteboardModel *)self workQueue_unserializePasteboardWithPersistenceName:v10];

        if (!v16) {
          goto LABEL_19;
        }
        v17 = [(PBPasteboardModel *)self workQueue_pasteboardCache];
        v18 = [v17 objectForKeyedSubscript:v10];

        if (!v18) {
          goto LABEL_13;
        }
        goto LABEL_14;
      }
LABEL_15:
      if (!v6) {
        goto LABEL_21;
      }
      v21 = [v13 expirationDate];
      if (!v21
        || (+[NSDate date],
            v22 = objc_claimAutoreleasedReturnValue(),
            id v23 = [v22 compare:v21],
            v22,
            v23 != (id)1))
      {

        goto LABEL_21;
      }

      [(PBPasteboardModel *)self workQueue_deletePasteboardWithPersistenceName:v10];
      if (!--v14)
      {
LABEL_19:
        v13 = 0;
        goto LABEL_21;
      }
    }
    if (v13) {
      goto LABEL_15;
    }
    uint64_t v19 = [(PBPasteboardModel *)self workQueue_unserializePasteboardWithPersistenceName:v10];
    if (!v19) {
      goto LABEL_19;
    }
    uint64_t v16 = v19;
LABEL_13:
    v20 = [(PBPasteboardModel *)self workQueue_pasteboardCache];
    [v20 setObject:v16 forKeyedSubscript:v10];

LABEL_14:
    v13 = (void *)v16;
    goto LABEL_15;
  }
LABEL_21:

  return v13;
}

- (void)getPasteboardWithPersistenceName:(id)a3 name:(id)a4 createIfNeeded:(BOOL)a5 localOnly:(BOOL)a6 processInfo:(id)a7 deviceIsLocked:(BOOL)a8 completionBlock:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a9;
  uint64_t v19 = v18;
  if (v15 && v16)
  {
    v20 = [(PBPasteboardModel *)self workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004AA4;
    block[3] = &unk_100030B38;
    BOOL v30 = a8;
    v21 = (id *)v26;
    v26[0] = v15;
    v26[1] = self;
    id v27 = v16;
    BOOL v31 = a6;
    BOOL v32 = a5;
    id v28 = v17;
    id v29 = v19;
    dispatch_async(v20, block);

    v22 = v27;
LABEL_6:

    goto LABEL_7;
  }
  if (v18)
  {
    v21 = &v24;
    id v24 = v18;
    id v23 = v16;
    PBDispatchAsyncCallback();
    v22 = v23;
    goto LABEL_6;
  }
LABEL_7:
}

- (void)getPasteboardNamed:(id)a3 bundleID:(id)a4 teamID:(id)a5 createIfNeeded:(BOOL)a6 localOnly:(BOOL)a7 processInfo:(id)a8 deviceIsLocked:(BOOL)a9 completionBlock:(id)a10
{
  BOOL v11 = a7;
  BOOL v12 = a6;
  id v15 = a10;
  id v16 = a8;
  id v17 = a3;
  PBPasteboardPersistenceName();
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [(PBPasteboardModel *)self getPasteboardWithPersistenceName:v18 name:v17 createIfNeeded:v12 localOnly:v11 processInfo:v16 deviceIsLocked:a9 completionBlock:v15];
}

- (void)getExistingPasteboardWithPersistenceName:(id)a3 name:(id)a4 UUID:(id)a5 processInfo:(id)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (v12 && v13)
  {
    id v18 = [(PBPasteboardModel *)self workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000051CC;
    block[3] = &unk_100030BB0;
    void block[4] = self;
    id v23 = v12;
    id v24 = v13;
    id v25 = v14;
    id v27 = v17;
    id v26 = v15;
    dispatch_async(v18, block);

    uint64_t v19 = v23;
LABEL_6:

    goto LABEL_7;
  }
  if (v16)
  {
    id v21 = v16;
    id v20 = v13;
    PBDispatchAsyncCallback();

    uint64_t v19 = v21;
    goto LABEL_6;
  }
LABEL_7:
}

- (id)workQueue_savePasteboard:(id)a3 isServerToServerCopy:(BOOL)a4 outNotificationState:(unint64_t *)a5 outChangeCount:(int64_t *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  BOOL v11 = +[NSFileManager defaultManager];
  id v12 = PBStorageRootURL();
  id v13 = [v12 path];
  unsigned __int8 v14 = [v11 fileExistsAtPath:v13];

  if ((v14 & 1) == 0)
  {
    id v15 = PBStorageRootURL();
    NSFileAttributeKey v57 = NSFileProtectionKey;
    NSFileProtectionType v58 = NSFileProtectionNone;
    id v16 = +[NSDictionary dictionaryWithObjects:&v58 forKeys:&v57 count:1];
    [v11 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:v16 error:0];

    id v17 = PBStorageRootURL();
    id v18 = [v17 URLByAppendingPathComponent:PBSchemaFilename];

    uint64_t v19 = PBSchemaFileContentsWithVersion();
    [v19 writeToURL:v18 options:268435457 error:0];
  }
  id v20 = [v10 name];

  if (!v20)
  {
    id v25 = PBCannotSerializePasteboardError();
    id v26 = 0;
    unint64_t v27 = 0;
    if (v25) {
      goto LABEL_35;
    }
    goto LABEL_31;
  }
  id v21 = [v10 persistenceName];
  v22 = [v10 name];
  id v23 = [(PBPasteboardModel *)self workQueue_pasteboardWithPersistenceName:v21 name:v22 localOnly:0 deleteIfExpired:0];

  if (v23) {
    uint64_t v24 = (uint64_t)[v23 changeCount] + 1;
  }
  else {
    uint64_t v24 = 1;
  }
  [v10 setChangeCount:v24];
  id v28 = [v10 persistenceName];
  if (v28)
  {
    v52 = self;
    id v29 = [(PBPasteboardModel *)self workQueue_pasteboardCache];
    [v29 setObject:v10 forKeyedSubscript:v28];

    LODWORD(v29) = [v10 isPersistent];
    BOOL v30 = _PBLog();
    BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
    if (v29)
    {
      if (v31)
      {
        BOOL v32 = [v10 name];
        *(_DWORD *)buf = 138412290;
        v54 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Saving pasteboard named: %@", buf, 0xCu);
      }
      BOOL v33 = [v10 originatorAllowedToCopyOnPaste] != 0;
      v34 = PBStorageRootURL();
      id v25 = [v10 serializeToBaseURL:v34 isServerToServerCopy:v8 allowedToCopyOnPaste:v33];

      v35 = PBStorageRootURL();
      [v10 setStorageBaseURL:v35];

      v36 = [v10 directoryName];
      v37 = PBStorageRootURL();
      v38 = [v37 URLByAppendingPathComponent:v36 isDirectory:1];
      sub_100012144(v10, v38);

      unint64_t v27 = sub_10001148C();
      id v26 = [v10 changeCount];
    }
    else
    {
      if (v31)
      {
        v41 = [v10 name];
        *(_DWORD *)buf = 138412290;
        v54 = v41;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Skipped saving non-persistent pasteboard named: %@", buf, 0xCu);
      }
      unint64_t v27 = sub_10001148C();
      id v26 = [v10 changeCount];
      id v25 = 0;
    }
    if (sub_1000134B4() && [v10 isGeneralPasteboard])
    {
      v51 = a5;
      v42 = a6;
      unsigned int v43 = [v10 isLocalOnly];
      v44 = _PBLog();
      BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);
      if (v43)
      {
        a6 = v42;
        if (v45)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Not advertising local-only general pasteboard over Continuity.", buf, 2u);
        }

        [(PBPasteboardModel *)v52 _clearRemotePasteboard];
      }
      else
      {
        a6 = v42;
        if (v45)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Advertising general pasteboard over Continuity.", buf, 2u);
        }

        [(PBPasteboardModel *)v52 _pushRemotePasteboard:v10];
      }
      a5 = v51;
    }
  }
  else
  {
    v39 = _PBLog();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      [v10 name];
      v48 = v47 = a6;
      [v10 originatorTeamID];
      v50 = v49 = a5;
      *(_DWORD *)buf = 138412546;
      v54 = v48;
      __int16 v55 = 2112;
      v56 = v50;
      _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Pasteboard named %@ for team ID %@ cannot be persisted.", buf, 0x16u);

      a5 = v49;
      a6 = v47;
    }

    v40 = [v10 name];
    id v25 = PBPasteboardNameInvalidError();

    id v26 = 0;
    unint64_t v27 = 0;
  }

  if (!v25)
  {
LABEL_31:
    if (a5) {
      *a5 = v27;
    }
    if (a6) {
      *a6 = (int64_t)v26;
    }
  }
LABEL_35:

  return v25;
}

- (void)savePasteboard:(id)a3 deviceIslocked:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    id v10 = [v8 name];
    int v11 = PBIsPasteboardNameGeneralPasteboard();

    if (v11)
    {
      id v12 = _PBLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Saving general pasteboard as locked-device pasteboard.", buf, 2u);
      }

      [v8 setDeviceLockedPasteboard:1];
      [v8 setLocalOnly:1];
    }
  }
  id v13 = [(PBPasteboardModel *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005EBC;
  block[3] = &unk_100030C00;
  void block[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  dispatch_async(v13, block);
}

- (void)workQueue_deletePasteboardWithPersistenceName:(id)a3
{
}

- (void)workQueue_deletePasteboardWithPersistenceName:(id)a3 regenerateGeneralPasteboard:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    BOOL v7 = _PBLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Deleting pasteboard named: %@", (uint8_t *)&v13, 0xCu);
    }

    if (v4
      && (uint64_t v8 = PBGeneralPasteboardName, [v6 isEqualToString:PBGeneralPasteboardName]))
    {
      id v9 = [objc_alloc((Class)PBItemCollection) initWithItems:0];
      [v9 setName:v8];
      id v10 = [(PBPasteboardModel *)self workQueue_savePasteboard:v9 isServerToServerCopy:0 outNotificationState:0 outChangeCount:0];
    }
    else
    {
      sub_100011410(v6);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      int v11 = +[NSFileManager defaultManager];
      [v11 removeItemAtURL:v9 error:0];

      id v12 = [(PBPasteboardModel *)self workQueue_pasteboardCache];
      [v12 removeObjectForKey:v6];
    }
  }
}

- (void)deletePasteboardNamed:(id)a3 bundleID:(id)a4 teamID:(id)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(PBPasteboardModel *)self workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006248;
  block[3] = &unk_100030C50;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = self;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

- (id)workQueue_getAllPasteboardsOutError:(id *)a3
{
  id v20 = +[NSMutableArray array];
  id v3 = +[NSFileManager defaultManager];
  BOOL v4 = PBStorageRootURL();
  NSURLResourceKey v30 = NSURLIsDirectoryKey;
  v5 = +[NSArray arrayWithObjects:&v30 count:1];
  id v6 = [v3 enumeratorAtURL:v4 includingPropertiesForKeys:v5 options:1 errorHandler:0];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v24;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v23 + 1) + 8 * (void)v11);
        id v22 = 0;
        [v12 getResourceValue:&v22 forKey:NSURLIsDirectoryKey error:0];
        id v13 = v22;
        if ([v13 BOOLValue])
        {
          id v14 = PBStorageRootURL();
          id v21 = 0;
          id v15 = +[PBItemCollection unserializeCollectionFromPasteboardURL:v12 baseURL:v14 outError:&v21];
          id v16 = v21;

          if (v15)
          {
            [v20 addObject:v15];
          }
          else
          {
            id v17 = _PBLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v28 = v16;
              _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "Could not read pasteboard. Ignoring. Error: %@", buf, 0xCu);
            }
          }
        }

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v9);
  }

  if (a3) {
    *a3 = 0;
  }

  return v20;
}

- (void)getAllPasteboardsCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [(PBPasteboardModel *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000066A0;
  v7[3] = &unk_100030C78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)workQueue_deleteOrphanedPasteboardFiles
{
  v2 = +[NSMutableSet set];
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100006C98;
  v45[3] = &unk_100030CA0;
  id v33 = v2;
  id v46 = v33;
  BOOL v31 = v3;
  [v3 enumerateApplicationsOfType:0 block:v45];
  id v4 = _PBLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)v49 = v33;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Installed team IDs: %@", buf, 0xCu);
  }

  BOOL v32 = +[NSMutableArray array];
  v5 = +[NSFileManager defaultManager];
  id v6 = PBStorageRootURL();
  NSURLResourceKey v51 = NSURLIsDirectoryKey;
  id v7 = +[NSArray arrayWithObjects:&v51 count:1];
  id v8 = [v5 enumeratorAtURL:v6 includingPropertiesForKeys:v7 options:1 errorHandler:0];

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v8;
  id v9 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v42;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v12);
        id v40 = 0;
        [v13 getResourceValue:&v40 forKey:NSURLIsDirectoryKey error:0];
        id v15 = v40;
        if ([v15 BOOLValue])
        {
          id v16 = PBStorageRootURL();
          id v39 = 0;
          id v17 = +[PBItemCollection unserializeCollectionFromPasteboardURL:v13 baseURL:v16 outError:&v39];
          id v18 = v39;

          if (v17)
          {
            if (([v17 isSystemPasteboard] & 1) == 0)
            {
              uint64_t v19 = [v17 originatorTeamID];
              if (v19 && ([v33 containsObject:v19] & 1) == 0)
              {
                id v20 = [v17 persistenceName];
                [v32 addObject:v20];
              }
              goto LABEL_16;
            }
          }
          else
          {
            uint64_t v19 = _PBLog();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)v49 = v18;
              _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "Could not read pasteboard. Error: %@", buf, 0xCu);
            }
LABEL_16:
          }
        }

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v10);
  }

  if ([v32 count])
  {
    id v21 = _PBLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      unsigned int v22 = [v32 count];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v49 = v22;
      *(_WORD *)&v49[4] = 2112;
      *(void *)&v49[6] = v32;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Removing %u pasteboards:\n%@", buf, 0x12u);
    }

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v23 = v32;
    id v24 = [v23 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v36;
      do
      {
        for (i = 0; i != v25; i = (char *)i + 1)
        {
          if (*(void *)v36 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          [(PBPasteboardModel *)self workQueue_deletePasteboardWithPersistenceName:v28];
        }
        id v25 = [v23 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v25);
    }
  }
}

- (void)deleteOrphanedPasteboardFilesCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = [(PBPasteboardModel *)self workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006DE4;
  v7[3] = &unk_100030C78;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (NSMutableDictionary)workQueue_pasteboardCache
{
  return self->_workQueue_pasteboardCache;
}

- (void)setWorkQueue_pasteboardCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue_pasteboardCache, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)_pushRemotePasteboard:(id)a3
{
  id v3 = a3;
  id v20 = objc_alloc_init((Class)NSMutableArray);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v3;
  id obj = [v3 items];
  id v4 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v8 = objc_alloc_init((Class)UAPasteboardItem);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v9 = [v7 availableTypes];
        id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v23;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v23 != v12) {
                objc_enumerationMutation(v9);
              }
              id v14 = [[PBRemotePasteboardItemProvider alloc] initWithType:*(void *)(*((void *)&v22 + 1) + 8 * (void)j) item:v7];
              [v8 addType:v14];
            }
            id v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
          }
          while (v11);
        }

        id v15 = [v8 types];
        id v16 = [v15 count];

        if (v16) {
          [v20 addObject:v8];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }

  if ([v20 count])
  {
    id v17 = [v20 copy];
    +[UASharedPasteboard localPasteboardDidAddItems:forGeneration:](UASharedPasteboard, "localPasteboardDidAddItems:forGeneration:", v17, [v18 changeCount]);
  }
}

- (void)_clearRemotePasteboard
{
}

- (void)workQueue_removeRemotePasteboardAndRestoreGeneralPasteboard
{
  id v3 = [(PBPasteboardModel *)self workQueue_pasteboardCache];
  uint64_t v4 = PBGeneralPasteboardName;
  id v5 = [v3 objectForKeyedSubscript:PBGeneralPasteboardName];

  if (v5 && [v5 isRemote])
  {
    id v6 = [(PBPasteboardModel *)self workQueue_pasteboardCache];
    [v6 removeObjectForKey:v4];

    id v7 = [(PBPasteboardModel *)self workQueue_pasteboardWithPersistenceName:v4 name:v4 localOnly:0];
    if (!v7)
    {
      id v7 = [objc_alloc((Class)PBItemCollection) initWithItems:&__NSArray0__struct];
      [v7 setName:v4];
    }
    id v8 = _PBLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v7 UUID];
      int v13 = 136315650;
      id v14 = "-[PBPasteboardModel(ContinuityPasteboard) workQueue_removeRemotePasteboardAndRestoreGeneralPasteboard]";
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s: Removed remote pasteboard and replaced with pasteboard %@ with UUID %@", (uint8_t *)&v13, 0x20u);
    }
    objc_msgSend(v7, "setChangeCount:", (char *)objc_msgSend(v5, "changeCount") + 1);
    id v10 = PBStorageRootURL();
    id v11 = [v7 serializeToBaseURL:v10];

    if (v11)
    {
      uint64_t v12 = _PBLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        int v13 = 136315138;
        id v14 = "-[PBPasteboardModel(ContinuityPasteboard) workQueue_removeRemotePasteboardAndRestoreGeneralPasteboard]";
        _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "%s: Could not save general pasteboard after removing remote pastedoard.", (uint8_t *)&v13, 0xCu);
      }
    }
    sub_10001148C();
  }
}

- (void)workQueue_createRemoteGeneralPasteboardWithChangeCount:(int64_t)a3
{
  id v9 = objc_alloc_init((Class)PBItemCollection);
  [v9 setIsRemote:1];
  id v5 = +[UASharedPasteboard remotePasteboard];
  id v6 = [v5 currentRemoteDeviceName];
  [v9 setRemoteDeviceName:v6];

  uint64_t v7 = PBGeneralPasteboardName;
  [v9 setName:PBGeneralPasteboardName];
  [v9 setChangeCount:a3];
  id v8 = [(PBPasteboardModel *)self workQueue_pasteboardCache];
  [v8 setObject:v9 forKeyedSubscript:v7];

  sub_10001148C();
}

- (id)workQueue_saveGeneralPasteboardFromContinuityPasteboard:(id)a3
{
  id v4 = a3;
  id v5 = [(PBPasteboardModel *)self workQueue_pasteboardCache];
  uint64_t v6 = PBGeneralPasteboardName;
  id v7 = [v5 objectForKeyedSubscript:PBGeneralPasteboardName];

  if (v7 == v4)
  {
    id v9 = objc_alloc((Class)PBItemCollection);
    id v10 = [v4 items];
    id v11 = [v9 initWithItems:v10];

    [v11 setName:v6];
    objc_msgSend(v11, "setChangeCount:", objc_msgSend(v4, "changeCount"));
    objc_msgSend(v11, "setIsOrWasRemote:", objc_msgSend(v4, "isOrWasRemote"));
    uint64_t v12 = [v4 remoteDeviceName];
    [v11 setRemoteDeviceName:v12];

    int v13 = [v4 UUID];
    [v11 setUUID:v13];

    id v14 = [(PBPasteboardModel *)self workQueue_pasteboardCache];
    [v14 setObject:v11 forKeyedSubscript:v6];

    __int16 v15 = PBStorageRootURL();
    id v16 = [v11 serializeToBaseURL:v15];

    if (v16)
    {
      __int16 v17 = _PBLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        int v20 = 136315138;
        uint64_t v21 = "-[PBPasteboardModel(ContinuityPasteboard) workQueue_saveGeneralPasteboardFromContinuityPasteboard:]";
        _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "%s: Cannot save general pasteboard after retrieving it from remote pasteboard.", (uint8_t *)&v20, 0xCu);
      }
    }
    id v18 = PBStorageRootURL();
    [v11 setStorageBaseURL:v18];

    id v8 = v11;
  }
  else
  {
    id v8 = v7;
  }

  return v8;
}

- (void)workQueue_reallyFaultMetadataForRemotePasteboard:(id)a3 processInfo:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v12 = [(PBPasteboardModel *)self workQueue];
  dispatch_suspend(v12);

  id v13 = [v9 pid];
  id v14 = _PBLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = [v9 bundleID];
    *(_DWORD *)buf = 136315650;
    long long v26 = "-[PBPasteboardModel(ContinuityPasteboard) workQueue_reallyFaultMetadataForRemotePasteboard:processInfo:completionBlock:]";
    __int16 v27 = 2112;
    long long v28 = v15;
    __int16 v29 = 1024;
    int v30 = (int)v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s: Requesting remote pasteboard types for process with bundle ID %@, pid %d", buf, 0x1Cu);
  }
  id v16 = +[UASharedPasteboard remotePasteboard];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100014D10;
  v20[3] = &unk_100031928;
  id v21 = v8;
  long long v22 = self;
  id v23 = v11;
  id v24 = v10;
  id v17 = v11;
  id v18 = v8;
  id v19 = v10;
  [v16 requestRemotePasteboardTypesForProcess:v13 withCompletion:v20];
}

- (void)workQueue_faultMetadataForRemotePasteboard:(id)a3 processInfo:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isRemote] && !objc_msgSend(v8, "isRemoteMetadataLoaded"))
  {
    id v13 = [(PBPasteboardModel *)self workQueue];
    dispatch_suspend(v13);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100015460;
    v14[3] = &unk_100031950;
    id v11 = (id *)v16;
    v16[0] = v10;
    uint64_t v12 = (id *)v15;
    v15[0] = v8;
    v15[1] = self;
    [(PBPasteboardModel *)self workQueue_reallyFaultMetadataForRemotePasteboard:v15[0] processInfo:v9 completionBlock:v14];
    goto LABEL_6;
  }
  if (v10)
  {
    v16[1] = _NSConcreteStackBlock;
    v16[2] = 3221225472;
    v16[3] = sub_100015448;
    v16[4] = &unk_100030B10;
    id v11 = &v18;
    id v18 = v10;
    uint64_t v12 = &v17;
    id v17 = v8;
    PBDispatchAsyncCallback();
LABEL_6:
  }
}

- (void)workQueue_reallyFaultDataForRemotePasteboard:(id)a3 processInfo:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v12 = [(PBPasteboardModel *)self workQueue];
  dispatch_suspend(v12);

  id v13 = [v9 pid];
  id v14 = _PBLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    __int16 v15 = [v9 bundleID];
    *(_DWORD *)buf = 136315650;
    long long v26 = "-[PBPasteboardModel(ContinuityPasteboard) workQueue_reallyFaultDataForRemotePasteboard:processInfo:completionBlock:]";
    __int16 v27 = 2112;
    long long v28 = v15;
    __int16 v29 = 1024;
    int v30 = (int)v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%s: Requesting remote pasteboard data for process with bundle ID %@, pid %d", buf, 0x1Cu);
  }
  id v16 = +[UASharedPasteboard remotePasteboard];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000157AC;
  v20[3] = &unk_100031928;
  id v21 = v8;
  long long v22 = self;
  id v23 = v11;
  id v24 = v10;
  id v17 = v11;
  id v18 = v8;
  id v19 = v10;
  [v16 requestRemotePasteboardDataForProcess:v13 withCompletion:v20];
}

- (void)workQueue_faultDataForRemotePasteboard:(id)a3 processInfo:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isRemote] && !objc_msgSend(v8, "isRemoteDataLoaded"))
  {
    uint64_t v12 = [(PBPasteboardModel *)self workQueue];
    dispatch_suspend(v12);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100015F04;
    v13[3] = &unk_100030B88;
    id v11 = (id *)v14;
    v13[4] = self;
    v14[0] = v10;
    [(PBPasteboardModel *)self workQueue_reallyFaultDataForRemotePasteboard:v8 processInfo:v9 completionBlock:v13];
    goto LABEL_6;
  }
  if (v10)
  {
    v14[1] = _NSConcreteStackBlock;
    v14[2] = 3221225472;
    v14[3] = sub_100015EEC;
    void v14[4] = &unk_100030B10;
    id v11 = &v16;
    id v16 = v10;
    id v15 = v8;
    PBDispatchAsyncCallback();

LABEL_6:
  }
}

- (void)_remotePasteboardDidBecomeAvailable:(BOOL)a3
{
  if (PBPreferencesBoolValue())
  {
    id v5 = [(PBPasteboardModel *)self workQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100016118;
    v6[3] = &unk_100031978;
    v6[4] = self;
    BOOL v7 = a3;
    dispatch_async(v5, v6);
  }
}

- (void)_remotePasteboardWillBeFetched:(id)a3
{
  id v4 = a3;
  if (PBPreferencesBoolValue())
  {
    id v5 = [(PBPasteboardModel *)self workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016260;
    block[3] = &unk_100031588;
    id v7 = v4;
    dispatch_async(v5, block);
  }
}

@end