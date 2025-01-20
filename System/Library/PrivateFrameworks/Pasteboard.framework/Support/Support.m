void sub_100004674(id a1)
{
  uint64_t vars8;

  qword_100039500 = [[PBPasteboardModel alloc] _init];
  _objc_release_x1();
}

void sub_100004AA4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 72) && PBIsPasteboardNameGeneralPasteboard())
  {
    uint64_t v2 = PBDeviceLockedGeneralPasteboardName;
    uint64_t v3 = PBGeneralPasteboardName;
    v4 = objc_msgSend(*(id *)(a1 + 40), "workQueue_pasteboardWithPersistenceName:name:localOnly:", PBDeviceLockedGeneralPasteboardName, PBGeneralPasteboardName, 1);
    if (v4)
    {
      v5 = _PBLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Pulling device-locked pasteboard into general pasteboard.", buf, 2u);
      }

      id v6 = objc_alloc((Class)PBItemCollection);
      v7 = [v4 items];
      id v8 = [v6 initWithItems:v7];

      [v8 setName:v3];
      v9 = [v4 metadata];
      [v8 setMetadata:v9];

      v10 = [v4 privateMetadata];
      [v8 setPrivateMetadata:v10];

      v11 = [v4 expirationDate];
      [v8 setExpirationDate:v11];

      [v8 setPersistent:1];
      v12 = [v4 originatorPersistentID];
      [v8 setOriginatorPersistentID:v12];

      v13 = [v4 originatorBundleID];
      [v8 setOriginatorBundleID:v13];

      v14 = [v4 originatorTeamID];
      [v8 setOriginatorTeamID:v14];

      v15 = [v4 originatorLocalizedName];
      [v8 setOriginatorLocalizedName:v15];

      v16 = [v4 saveBootSession];
      [v8 setSaveBootSession:v16];

      objc_msgSend(v8, "setSaveTimestamp:", objc_msgSend(v4, "saveTimestamp"));
      [v8 setLocalOnly:1];
      id v17 = objc_msgSend(*(id *)(a1 + 40), "workQueue_savePasteboard:isServerToServerCopy:outNotificationState:outChangeCount:", v8, 1, 0, 0);
      objc_msgSend(*(id *)(a1 + 40), "workQueue_deletePasteboardWithPersistenceName:", v2);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "workQueue_pasteboardWithPersistenceName:name:localOnly:", *(void *)(a1 + 32), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 73));
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    if (!*(unsigned char *)(a1 + 74))
    {
      id v18 = 0;
      if (sub_1000134B4())
      {
LABEL_18:
        v19 = *(void **)(a1 + 64);
        if (!v19) {
          goto LABEL_23;
        }
        id v23 = v19;
        id v18 = v18;
        PBDispatchAsyncCallback();

        v20 = v23;
LABEL_22:

        goto LABEL_23;
      }
LABEL_20:
      v21 = *(void **)(a1 + 64);
      if (!v21) {
        goto LABEL_23;
      }
      id v22 = v21;
      id v18 = v18;
      PBDispatchAsyncCallback();

      v20 = v22;
      goto LABEL_22;
    }
    id v18 = [objc_alloc((Class)PBItemCollection) initWithItems:&__NSArray0__struct];
    [v18 setName:*(void *)(a1 + 48)];
    if (*(unsigned char *)(a1 + 72)) {
      [v18 setDeviceLockedPasteboard:1];
    }
  }
  if ((sub_1000134B4() & 1) == 0) {
    goto LABEL_20;
  }
  if (!v18
    || ![v18 isRemote]
    || ([v18 isRemoteMetadataLoaded] & 1) != 0)
  {
    goto LABEL_18;
  }
  objc_msgSend(*(id *)(a1 + 40), "workQueue_faultMetadataForRemotePasteboard:processInfo:completionBlock:", v18, *(void *)(a1 + 56), *(void *)(a1 + 64));
LABEL_23:
}

uint64_t sub_100004EA4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t sub_100004EBC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_100004ED4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  PBPasteboardNameInvalidError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void sub_1000051CC(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "workQueue_pasteboardWithPersistenceName:name:localOnly:", *(void *)(a1 + 40), *(void *)(a1 + 48), 0);
  uint64_t v3 = v2;
  if (v2)
  {
    v4 = [v2 UUID];
    unsigned __int8 v5 = [v4 isEqual:*(void *)(a1 + 56)];

    if (v5)
    {
      id v6 = v3;
      goto LABEL_6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "workQueue_pasteboardWithPersistenceName:name:localOnly:", *(void *)(a1 + 40), *(void *)(a1 + 48), 1);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    sub_1000134B4();
    v12 = *(void **)(a1 + 72);
    if (!v12)
    {
      id v6 = 0;
      goto LABEL_17;
    }
    v10 = (id *)v19;
    v19[0] = v12;
    id v18 = *(id *)(a1 + 48);
    PBDispatchAsyncCallback();

    id v6 = 0;
    goto LABEL_16;
  }
  v7 = [v6 UUID];
  unsigned __int8 v8 = [v7 isEqual:*(void *)(a1 + 56)];

  if (v8)
  {
LABEL_6:
    if (sub_1000134B4()
      && [v6 isRemote]
      && ([v6 isRemoteDataLoaded] & 1) == 0)
    {
      v14 = [*(id *)(a1 + 32) workQueue];
      dispatch_suspend(v14);

      v15 = *(void **)(a1 + 32);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10000551C;
      v21[3] = &unk_100030B88;
      v10 = (id *)v22;
      uint64_t v16 = *(void *)(a1 + 64);
      id v17 = *(id *)(a1 + 72);
      v21[4] = *(void *)(a1 + 32);
      v22[0] = v17;
      objc_msgSend(v15, "workQueue_faultDataForRemotePasteboard:processInfo:completionBlock:", v6, v16, v21);
      goto LABEL_16;
    }
    v9 = *(void **)(a1 + 72);
    if (v9)
    {
      v19[1] = _NSConcreteStackBlock;
      v19[2] = 3221225472;
      v19[3] = sub_1000056A8;
      v19[4] = &unk_100030B10;
      v10 = &v20;
      id v20 = v9;
      id v6 = v6;
      v19[5] = v6;
      PBDispatchAsyncCallback();
      v11 = v6;
LABEL_15:

LABEL_16:
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v13 = *(void **)(a1 + 72);
  if (v13)
  {
    v22[1] = _NSConcreteStackBlock;
    v22[2] = 3221225472;
    v22[3] = sub_1000054B8;
    v22[4] = &unk_100030B10;
    v10 = &v24;
    id v24 = v13;
    id v23 = *(id *)(a1 + 56);
    PBDispatchAsyncCallback();
    v11 = v23;
    goto LABEL_15;
  }
LABEL_17:
}

void sub_1000054B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  PBPasteboardNotAvailableError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void sub_10000551C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  unsigned __int8 v8 = *(void **)(a1 + 40);
  if (v8)
  {
    if (v6)
    {
      v14[1] = _NSConcreteStackBlock;
      v14[2] = 3221225472;
      v14[3] = sub_100005678;
      v14[4] = &unk_100030B10;
      v9 = &v16;
      id v16 = v8;
      v10 = &v15;
      id v15 = v7;
      PBDispatchAsyncCallback();
    }
    else
    {
      v9 = (id *)v14;
      v14[0] = v8;
      v10 = &v12;
      id v12 = v5;
      id v13 = 0;
      PBDispatchAsyncCallback();
    }
  }
  v11 = [*(id *)(a1 + 32) workQueue];
  dispatch_resume(v11);
}

uint64_t sub_100005678(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t sub_100005690(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_1000056A8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_1000056C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  PBPasteboardNameInvalidError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void sub_100005724(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  PBPasteboardNameInvalidError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void sub_100005EBC(uint64_t a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "workQueue_savePasteboard:isServerToServerCopy:outNotificationState:outChangeCount:", *(void *)(a1 + 40), 0, &v7, &v6);
  uint64_t v3 = *(void **)(a1 + 48);
  if (v3)
  {
    id v5 = v3;
    id v4 = v2;
    PBDispatchAsyncCallback();
  }
}

uint64_t sub_100005F8C(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[5] + 16))(a1[5], a1[6], a1[7], a1[4]);
}

void sub_100006248(uint64_t a1)
{
  id v2 = PBPasteboardPersistenceName();
  objc_msgSend(*(id *)(a1 + 56), "workQueue_deletePasteboardWithPersistenceName:", v2);
  if (PBIsPasteboardNameGeneralPasteboard())
  {
    uint64_t v3 = PBPasteboardPersistenceName();
    objc_msgSend(*(id *)(a1 + 56), "workQueue_deletePasteboardWithPersistenceName:", v3);
  }
  sub_10001148C();
  id v4 = *(void **)(a1 + 64);
  if (v4)
  {
    id v5 = v4;
    PBDispatchAsyncCallback();
  }
}

uint64_t sub_100006340(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_1000066A0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v9 = 0;
  uint64_t v3 = objc_msgSend(v2, "workQueue_getAllPasteboardsOutError:", &v9);
  id v4 = v9;
  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    id v8 = v5;
    id v6 = v3;
    id v7 = v4;
    PBDispatchAsyncCallback();
  }
}

uint64_t sub_100006780(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_100006C98(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 entitlementValueForKey:@"application-identifier" ofClass:objc_opt_class()];

  CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
}

uint64_t sub_100006DE4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "workQueue_deleteOrphanedPasteboardFiles");
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    return PBDispatchAsyncCallback();
  }
  return result;
}

uint64_t sub_100006F3C(uint64_t a1)
{
  qword_100039510 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

void sub_100007090(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000070B4(uint64_t a1)
{
  id v2 = _PBLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Received MDMManagingOrgInfoChangedNotification", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateOrgName];
}

uint64_t sub_100007224(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007234(uint64_t a1)
{
}

void sub_10000723C(uint64_t a1)
{
}

uint64_t sub_10000762C(uint64_t a1)
{
  qword_100039520 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

void sub_10000770C(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
    return;
  }
  id v2 = +[NSFileManager defaultManager];
  uint64_t v3 = PBStorageRootURL();
  id v4 = [v3 URLByAppendingPathComponent:PBSchemaFilename];

  id v5 = PBOldPasteboardStorageRootURL();
  id v6 = [v5 path];
  unsigned int v7 = [v2 fileExistsAtPath:v6];

  if (v7)
  {
    [v2 removeItemAtURL:v5 error:0];
    id v8 = _PBLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Removed old pasteboard folder.", buf, 2u);
    }
  }
  id v9 = PBStorageRootURL();
  v10 = [v9 path];
  unsigned int v11 = [v2 fileExistsAtPath:v10];

  if (v11)
  {
    v53 = v2;
    v55 = v5;
    v56 = v4;
    id v12 = +[NSData dataWithContentsOfURL:v4 options:8 error:0];
    id v13 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v12 error:0];
    [v13 setDecodingFailurePolicy:1];
    v14 = self;
    v67[0] = v14;
    id v15 = self;
    v67[1] = v15;
    id v16 = self;
    v67[2] = v16;
    id v17 = +[NSArray arrayWithObjects:v67 count:3];
    id v18 = +[NSSet setWithArray:v17];
    v54 = v13;
    v19 = [v13 decodeTopLevelObjectOfClasses:v18 forKey:NSKeyedArchiveRootObjectKey error:0];

    objc_opt_class();
    id v20 = 0;
    if (objc_opt_isKindOfClass())
    {
      v21 = [v19 objectForKeyedSubscript:PBSchemaVersionKey];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v20 = [v21 unsignedIntegerValue];
      }
      else {
        id v20 = 0;
      }
    }
    v52 = v19;
    id v5 = v55;
    id v2 = v53;
    v28 = v54;
    if (v20 != (id)PBLatestSchemaVersion)
    {
      v30 = _PBLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Starting Pasteboard migration.", buf, 2u);
      }

      v31 = +[NSFileManager defaultManager];
      if (!v20)
      {
        v51 = v12;
        v32 = _PBLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          id v71 = 0;
          __int16 v72 = 2048;
          uint64_t v73 = 1;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Migrating schema from version %lu to %lu...", buf, 0x16u);
        }

        v33 = PBStorageRootURL();
        NSURLResourceKey v74 = NSURLIsDirectoryKey;
        v34 = +[NSArray arrayWithObjects:&v74 count:1];
        v35 = [v31 enumeratorAtURL:v33 includingPropertiesForKeys:v34 options:5 errorHandler:0];

        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v36 = v35;
        id v37 = [v36 countByEnumeratingWithState:&v61 objects:buf count:16];
        if (v37)
        {
          id v38 = v37;
          uint64_t v39 = *(void *)v62;
          do
          {
            for (i = 0; i != v38; i = (char *)i + 1)
            {
              if (*(void *)v62 != v39) {
                objc_enumerationMutation(v36);
              }
              v41 = *(void **)(*((void *)&v61 + 1) + 8 * i);
              id v60 = 0;
              [v41 getResourceValue:&v60 forKey:NSURLIsDirectoryKey error:0];
              id v42 = v60;
              if ([v42 BOOLValue]) {
                [v31 removeItemAtURL:v41 error:0];
              }
            }
            id v38 = [v36 countByEnumeratingWithState:&v61 objects:buf count:16];
          }
          while (v38);
        }

        v43 = _PBLog();
        id v5 = v55;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v68 = 134217984;
          uint64_t v69 = 1;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Migrated schema to version %lu.", v68, 0xCu);
        }

        id v4 = v56;
        id v12 = v51;
        v28 = v54;
      }

      v44 = PBSchemaFileContentsWithVersion();
      id v59 = 0;
      unsigned __int8 v45 = [v44 writeToURL:v4 options:268435457 error:&v59];
      id v46 = v59;

      if ((v45 & 1) == 0)
      {
        v47 = _PBLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v71 = v46;
          _os_log_fault_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_FAULT, "Could not write new schema version file. Error: %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    id v22 = PBStorageRootURL();
    NSFileAttributeKey v65 = NSFileProtectionKey;
    NSURLFileProtectionType v66 = NSURLFileProtectionNone;
    id v23 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
    id v58 = 0;
    unsigned int v24 = [v2 createDirectoryAtURL:v22 withIntermediateDirectories:1 attributes:v23 error:&v58];
    id v25 = v58;

    if (v24)
    {
      v26 = PBSchemaFileContentsWithVersion();
      id v57 = 0;
      unsigned __int8 v27 = [v26 writeToURL:v4 options:268435457 error:&v57];
      v28 = v57;

      if ((v27 & 1) == 0)
      {
        v29 = _PBLog();
        id v12 = v25;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v71 = v28;
          _os_log_fault_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "Could not write new schema version file. Error: %@", buf, 0xCu);
        }

        goto LABEL_44;
      }
    }
    else
    {
      v28 = _PBLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        v49 = __error();
        v50 = strerror(*v49);
        *(_DWORD *)buf = 136315138;
        id v71 = v50;
        _os_log_fault_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_FAULT, "Could not create pasteboard directory. Aborting migration. Error: %s", buf, 0xCu);
      }
    }
    id v12 = v25;
  }
LABEL_44:

  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  v48 = _PBLog();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "Completed pasteboard migration.", buf, 2u);
  }
}

void sub_100007F00(id a1)
{
  qword_100039530 = (uint64_t)dispatch_queue_create("com.apple.Pasteboard.migrationQueue", 0);
  _objc_release_x1();
}

void sub_100007F40(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v9 = a1;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  v14 = [v12 bundleID];
  if (!v11)
  {
    CFStringRef v16 = @"MissingAuthMessage";
    goto LABEL_10;
  }
  uint64_t v15 = (uint64_t)[v11 context];
  if (v15 > 0xC59AA8F622F26FBLL)
  {
    if (v15 > 0x51A2F5DDCA075EA0)
    {
      if (v15 > 0x67510999674CD01DLL)
      {
        switch(v15)
        {
          case 0x67510999674CD01ELL:
            CFStringRef v16 = @"PasteButtonUndoInteractionHUDTextDark";
            goto LABEL_10;
          case 0x70A52C167AE7B042:
            CFStringRef v16 = @"PasteButtonSystemInputAssistantLight";
            goto LABEL_10;
          case 0x7EC07AF570CAADBCLL:
            CFStringRef v16 = @"AccessibilityAssistiveTouchControl";
            goto LABEL_10;
        }
      }
      else
      {
        switch(v15)
        {
          case 0x51A2F5DDCA075EA1:
            CFStringRef v16 = @"EditMenuOOP";
            goto LABEL_10;
          case 0x5597A8D691A21829:
            CFStringRef v16 = @"PasteButtonSystemInputAssistantDark";
            goto LABEL_10;
          case 0x5A4A97C3218CE65BLL:
            CFStringRef v16 = @"KeyShortcutHUD";
            goto LABEL_10;
        }
      }
    }
    else if (v15 > 0x2BB12563A205EBD0)
    {
      switch(v15)
      {
        case 0x2BB12563A205EBD1:
          CFStringRef v16 = @"PasteButtonSystemInputAssistantPopover";
          goto LABEL_10;
        case 0x37CA128B814942F4:
          CFStringRef v16 = @"PasteButtonEditMenuLight";
          goto LABEL_10;
        case 0x41683F1594B2E071:
          CFStringRef v16 = @"ContextMenuOOP";
          goto LABEL_10;
      }
    }
    else
    {
      switch(v15)
      {
        case 0xC59AA8F622F26FCLL:
          CFStringRef v16 = @"PasteButtonUndoInteractionHUDIconDark";
          goto LABEL_10;
        case 0x237A2046F04E760CLL:
          CFStringRef v16 = @"PasteButtonUndoInteractionHUDIconLight";
          goto LABEL_10;
        case 0x25FC7F58D8DEA672:
          CFStringRef v16 = @"UndoSlideGestureOut";
LABEL_10:
          id v23 = (__CFString *)v16;
          goto LABEL_11;
      }
    }
LABEL_66:
    CFStringRef v16 = @"(unknown)";
    goto LABEL_10;
  }
  id v23 = @"KeyCommand";
  if (v15 <= (uint64_t)0xA9745AB1695ED68ALL)
  {
    if (v15 > (uint64_t)0x95DD33C9595B8B09)
    {
      switch(v15)
      {
        case 0x95DD33C9595B8B0ALL:
          CFStringRef v16 = @"AccessibilityVoiceOverRotorMenu";
          goto LABEL_10;
        case 0x9D0980DD8F0CAFCBLL:
          CFStringRef v16 = @"PasteButtonUndoInteractionHUDTextLight";
          goto LABEL_10;
        case 0xA16D1C5A60C000E1:
          CFStringRef v16 = @"PasteButtonCalloutBar";
          goto LABEL_10;
      }
      goto LABEL_66;
    }
    if (v15 != 0x84E6A8CBF3F0F10CLL)
    {
      if (v15 == 0x926FA0AD41ACE950)
      {
        CFStringRef v16 = @"PasteButtonEditMenuDark";
        goto LABEL_10;
      }
      goto LABEL_66;
    }
  }
  else
  {
    if (v15 <= (uint64_t)0xF317E322CB2CEA01)
    {
      switch(v15)
      {
        case 0xA9745AB1695ED68BLL:
          CFStringRef v16 = @"PasteButtonContextMenuDark";
          goto LABEL_10;
        case 0xB40F49E017F83014:
          CFStringRef v16 = @"PasteControlLight";
          goto LABEL_10;
        case 0xC58523F7A4B7A983:
          CFStringRef v16 = @"PasteControlDark";
          goto LABEL_10;
      }
      goto LABEL_66;
    }
    if (v15 != 0xF317E322CB2CEA02)
    {
      if (v15 == 0xF635B19E69CD15ECLL)
      {
        CFStringRef v16 = @"PasteButtonContextMenuLight";
        goto LABEL_10;
      }
      if (v15 == 0x6B3CE0810AAF53ALL)
      {
        CFStringRef v16 = @"AccessibilityVoiceCommand";
        goto LABEL_10;
      }
      goto LABEL_66;
    }
  }
LABEL_11:
  if (has_internal_diagnostics)
  {
    id v17 = _PBLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = [v12 bundleID];
      buf.count[0] = 138412546;
      *(void *)&buf.count[1] = v23;
      LOWORD(buf.hash[1]) = 2112;
      *(void *)((char *)&buf.hash[1] + 2) = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Paste kind: %@ requested by app:%@", (uint8_t *)&buf, 0x16u);
    }
LABEL_20:
    id v24 = v14;
    id v25 = v9;
    id v26 = v10;
    AnalyticsSendEventLazy();

    goto LABEL_21;
  }
  id v19 = v14;
  if (qword_100039540 != -1) {
    dispatch_once(&qword_100039540, &stru_100030DC0);
  }
  v29.tv_sec = 0;
  *(void *)&v29.tv_usec = 0;
  memset(&v28, 0, sizeof(v28));
  gettimeofday(&v29, 0);
  localtime_r(&v29.tv_sec, &v28);
  int data = v28.tm_yday + 366 * v28.tm_year;
  memset(&buf, 0, sizeof(buf));
  CC_SHA256_Init(&buf);
  CC_SHA256_Update(&buf, &unk_100039548, 0x10u);
  CC_SHA256_Update(&buf, &data, 4u);
  if (v19)
  {
    id v20 = (const char *)[v19 UTF8String];
    CC_LONG v21 = strlen(v20);
    CC_SHA256_Update(&buf, v20, v21);
  }
  CC_SHA256_Final(md, &buf);
  unsigned int v22 = *(unsigned __int16 *)md;

  if (v22 <= 0x28F) {
    goto LABEL_20;
  }
LABEL_21:
}

id sub_100008660(void *a1)
{
  CFStringRef v1 = (const __CFString *)a1[4];
  CFStringRef v2 = @"(none)";
  if (!v1) {
    CFStringRef v1 = @"(none)";
  }
  v13[0] = v1;
  v12[0] = @"bundleId";
  v12[1] = @"pasteDecision";
  unint64_t v3 = a1[8] - 1;
  if (v3 > 4) {
    CFStringRef v4 = @"Undecided";
  }
  else {
    CFStringRef v4 = off_100030DE0[v3];
  }
  uint64_t v5 = a1[5];
  CFStringRef v6 = (const __CFString *)a1[6];
  v13[1] = v4;
  v13[2] = v5;
  v12[2] = @"pasteDecisionReason";
  v12[3] = @"finalAccessOverrideReason";
  if (v6) {
    CFStringRef v2 = v6;
  }
  v13[3] = v2;
  v12[4] = @"finalPasteDecision";
  unint64_t v7 = a1[9] - 2;
  if (v7 > 3) {
    CFStringRef v8 = @"SilentDeny";
  }
  else {
    CFStringRef v8 = off_100030E08[v7];
  }
  v12[5] = @"pasteKind";
  uint64_t v9 = a1[7];
  v13[4] = v8;
  v13[5] = v9;
  id v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:6];
  return v10;
}

void sub_100008798(id a1)
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  CFStringRef v1 = [v2 deviceIdentifierForVendor];
  [v1 getUUIDBytes:&unk_100039548];
}

void sub_100009BF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100009C0C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009C1C(uint64_t a1)
{
}

void sub_100009C24(void *a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (v6)
  {
    unint64_t v7 = tcc_authorization_record_get_service();
    if (v7 == *(NSObject **)(a1[4] + 40))
    {
      uint64_t v8 = *(void *)(a1[5] + 8);
      if (*(void *)(v8 + 40))
      {
        uint64_t v9 = _PBLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v11) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "tcc_server_message_get_authorization_records_by_identity returned duplicate pasteboard records!", (uint8_t *)&v11, 2u);
        }

        uint64_t v8 = *(void *)(a1[5] + 8);
      }
      objc_storeStrong((id *)(v8 + 40), a2);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (a3)
  {
    id v10 = (unsigned char *)a1[6];
    if (v10) {
      unsigned char *v10 = 1;
    }
    unint64_t v7 = _PBLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      uint64_t v12 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error returned while fetching authorization for credential. error: %@", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_13;
  }
LABEL_14:
}

void sub_100009F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009F54(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (!v6)
  {
    unint64_t v7 = _PBLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (a3)
    {
      if (v8)
      {
        int v12 = 138412290;
        uint64_t v13 = a3;
        uint64_t v9 = "Error returned while fetching identity for credential. error: %@";
        id v10 = v7;
        uint32_t v11 = 12;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v12, v11);
      }
    }
    else if (v8)
    {
      LOWORD(v12) = 0;
      uint64_t v9 = "No existing identity found for credential.";
      id v10 = v7;
      uint32_t v11 = 2;
      goto LABEL_8;
    }

    goto LABEL_10;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
LABEL_10:
}

void sub_10000A110(id a1, __CFError *a2)
{
  unint64_t v3 = _PBLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Error returned while setting TCC value to 'limited': %@", (uint8_t *)&v4, 0xCu);
  }
}

__CFString **sub_10000A518(uint64_t a1)
{
  char v1 = a1;
  id v2 = &off_100030E28 + 2 * a1;
  unint64_t v3 = _PBLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = *v2;
    int v6 = 138412290;
    unint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v6, 0xCu);
  }

  if ((0x20000105318uLL >> v1)) {
    return 0;
  }
  else {
    return v2;
  }
}

uint64_t start()
{
  _set_user_dir_suffix();
  char v1 = _PBLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CC_SHA256_CTX buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Service started.", buf, 2u);
  }

  id v2 = objc_alloc_init((Class)NSMutableSet);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  unint64_t v3 = +[UISPasteVariant allVariants];
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      unint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v7) _keyCommandSpecification];
        if (v8) {
          [v2 addObject:v8];
        }

        unint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  BKSHIDServicesSetAuthenticatedKeyCommands();
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, v2, (CFNotificationCallback)sub_10000A934, @"kBKSHIDServerDiedNotification", 0, CFNotificationSuspensionBehaviorCoalesce);
  notify_register_dispatch("AppleLanguagePreferencesChangedNotification", (int *)&unk_100038FD8, (dispatch_queue_t)&_dispatch_main_q, &stru_100031178);
  id v10 = +[PBMigrator sharedMigrator];
  [v10 performMigrationIfNeeded];

  uint32_t v11 = objc_alloc_init(PBPasteboardServer);
  int v12 = (void *)qword_100039558;
  qword_100039558 = (uint64_t)v11;

  [(id)qword_100039558 start];
  if (CacheDeleteRegisterCallback())
  {
    uint64_t v13 = _PBLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CC_SHA256_CTX buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Could not register for cache deletion service. Ignoring.", buf, 2u);
    }
  }
  v14 = +[NSPort port];
  uint64_t v15 = +[NSRunLoop mainRunLoop];
  [v15 addPort:v14 forMode:NSRunLoopCommonModes];

  CFStringRef v16 = +[NSRunLoop mainRunLoop];
  [v16 run];

  return 0;
}

uint64_t sub_10000A934()
{
  return BKSHIDServicesSetAuthenticatedKeyCommands();
}

void sub_10000A93C(id a1, int a2)
{
}

__CFDictionary *__cdecl sub_10000A950(id a1, __CFDictionary *a2)
{
  id v2 = [(__CFDictionary *)a2 objectForKeyedSubscript:@"CACHE_DELETE_OPERATIONS"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v15;
    *(void *)&long long v4 = 138412290;
    long long v13 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        BOOL v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v9 = objc_msgSend(v8, "isEqualToString:", @"CACHE_DELETE_PERIODIC_OPERATION", v13);
        id v10 = _PBLog();
        BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
        if (v9)
        {
          if (v11)
          {
            *(_WORD *)CC_SHA256_CTX buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Performing periodic pasteboard cache purge", buf, 2u);
          }

          id v10 = +[PBPasteboardModel sharedModel];
          [v10 deleteOrphanedPasteboardFilesCompletionBlock:0];
        }
        else if (v11)
        {
          *(_DWORD *)CC_SHA256_CTX buf = v13;
          long long v19 = v8;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Ignoring cache purge operation: %@", buf, 0xCu);
        }
      }
      id v5 = [v2 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }
  return (__CFDictionary *)v2;
}

id sub_10000AFE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectionWasInvalidated];
}

void sub_10000B684(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = PBPasteboardNameNotAvailableError();
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);

  long long v4 = _PBLog();
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)unint64_t v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "PasteboardWithName", "", v7, 2u);
  }
}

void sub_10000B744(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v7;
  if (([*(id *)(a1 + 32) isAllowedToQueryBundleID] & 1) == 0)
  {
    unsigned int v9 = [v7 items];
    id v8 = [v7 copyWithItems:v9];

    [v8 setSaveBootSession:0];
    [v8 setSaveTimestamp:0];
    [v8 setOriginatorPersistentID:0];
    [v8 setOriginatorBundleID:0];
    [v8 setOriginatorTeamID:0];
    [v8 setOriginatorLocalizedName:0];
    id v10 = [v7 UUID];
    [v8 setUUID:v10];
  }
  BOOL v11 = _PBLog();
  int v12 = v11;
  if (v6)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      int v19 = 138412546;
      uint64_t v20 = v13;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "...requesting pasteboard %@ failed with error: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    int v19 = 138412290;
    uint64_t v20 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "...requesting pasteboard %@ completed successfully", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v15 = *(void *)(a1 + 48);
  if (v15)
  {
    (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v8, v6);
    long long v16 = _PBLog();
    long long v17 = v16;
    os_signpost_id_t v18 = *(void *)(a1 + 56);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LOWORD(v19) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v18, "PasteboardWithName", "", (uint8_t *)&v19, 2u);
    }
  }
}

void sub_10000B998(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = PBPasteboardNameNotAvailableError();
  (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v3);

  long long v4 = _PBLog();
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, v6, "PasteboardWithName", "", v7, 2u);
  }
}

void sub_10000BA58(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = _PBLog();
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v5 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_END, v4, "PasteboardWithName", "", v5, 2u);
  }
}

void sub_10000C3E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) name];
  uint64_t v2 = PBPasteboardNameNotAvailableError();
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v2);
}

void sub_10000C458(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = _PBLog();
  unsigned int v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      id v14 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "...save pasteboard failed with error: %@", (uint8_t *)&v13, 0xCu);
    }
    id v10 = 0;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "...save pasteboard completed successfully.", (uint8_t *)&v13, 2u);
    }

    id v11 = objc_alloc((Class)PBSaveResponse);
    unsigned int v9 = [*(id *)(a1 + 32) sharingToken];
    id v10 = [v11 initWithNotificationState:a2 changeCount:a3 sharingToken:v9];
  }

  uint64_t v12 = *(void *)(a1 + 40);
  if (v12) {
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v10, v7);
  }
}

uint64_t sub_10000C5C0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t sub_10000C5D8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_10000C924(void *a1)
{
  uint64_t v2 = a1[4];
  id v3 = _PBLog();
  os_signpost_id_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = a1[4];
      uint64_t v5 = a1[5];
      *(_DWORD *)CC_SHA256_CTX buf = 138412546;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "...deleting pasteboard name %@ failed with error: %@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = a1[5];
    *(_DWORD *)CC_SHA256_CTX buf = 138412290;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "...deleting pasteboard name %@ completed successfully.", buf, 0xCu);
  }

  id v8 = (void *)a1[6];
  if (v8)
  {
    id v9 = v8;
    PBDispatchAsyncCallback();
  }
}

uint64_t sub_10000CA98(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40), 0);
}

uint64_t sub_10000CAB0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_10000D064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23,id a24,id a25)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v26);
  objc_destroyWeak(location);
  objc_destroyWeak(&a23);
  objc_destroyWeak(&a24);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

id sub_10000D0A8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 invalidate];
}

void sub_10000D0EC(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v5 = objc_loadWeakRetained((id *)(a1 + 64));
  id v6 = objc_loadWeakRetained((id *)(a1 + 72));
  PBAssertIsOnCallbackQueue();
  [v6 recordUserAuthorizationDecision:a2 == 1 auditTokenInfo:*(void *)(a1 + 32)];
  if (v5 && v6) {
    [WeakRetained removeActiveAuthorizationAnnouncer:v5 collection:v6];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = *(id *)(a1 + 40);
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v11) + 16))(*(void *)(*((void *)&v13 + 1) + 8 * (void)v11));
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }

  __int16 v12 = objc_msgSend(WeakRetained, "authorizationReplyBlocks", (void)v13);
  [v12 removeObjectForKey:*(void *)(a1 + 48)];
}

void sub_10000D2E4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) activeAnnouncers];
  [v1 enumerateKeysAndObjectsUsingBlock:&stru_1000312E8];
}

void sub_10000D330(id a1, NSUUID *a2, PBPasteAnnouncing *a3, BOOL *a4)
{
}

void sub_10000D3C8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeAnnouncers];
  id v4 = [v2 objectForKey:*(void *)(a1 + 40)];

  [v4 invalidate];
  id v3 = [*(id *)(a1 + 32) activeAnnouncers];
  [v3 removeObjectForKey:*(void *)(a1 + 40)];
}

uint64_t sub_10000DF1C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_10000DF34(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  PBPasteboardNameNotAvailableError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void sub_10000DF98(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  PBPasteboardNameNotAvailableError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void sub_10000DFFC(id a1)
{
  if ((byte_100039560 & 1) == 0)
  {
    byte_100039560 = 1;
    if (qword_100039580 != -1) {
      dispatch_once(&qword_100039580, &stru_1000315F0);
    }
    uint64_t v1 = (void (*)(uint64_t, Block_layout *))off_100039578;
    v1(1255, &stru_100031350);
  }
}

void sub_10000E07C(id a1)
{
  uint64_t v1 = sub_10001042C();
  dispatch_async(v1, &stru_100031370);
}

void sub_10000E0C4(id a1)
{
  byte_100039560 = 0;
}

void sub_10000E0D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 80);
    if (v7) {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
    goto LABEL_30;
  }
  id v8 = [v5 UUID];
  unsigned __int8 v9 = [v8 isEqual:*(void *)(a1 + 32)];

  if ((v9 & 1) == 0)
  {
    uint64_t v22 = *(void *)(a1 + 80);
    if (!v22) {
      goto LABEL_30;
    }
    uint64_t v23 = PBPasteboardNotAvailableError();
LABEL_15:
    id v24 = (void *)v23;
    (*(void (**)(uint64_t, void, uint64_t))(v22 + 16))(v22, 0, v23);

    goto LABEL_30;
  }
  unint64_t v10 = *(void *)(a1 + 96);
  uint64_t v11 = [v5 items];
  id v12 = [v11 count];

  if (v10 >= (unint64_t)v12)
  {
    uint64_t v22 = *(void *)(a1 + 80);
    if (!v22) {
      goto LABEL_30;
    }
    uint64_t v23 = PBIndexOutOfRangeError();
    goto LABEL_15;
  }
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10000E66C;
  v46[3] = &unk_100031398;
  id v47 = *(id *)(a1 + 80);
  long long v13 = objc_retainBlock(v46);
  objc_initWeak(&location, v5);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_10000E6F0;
  v41[3] = &unk_1000313C0;
  objc_copyWeak(v44, &location);
  long long v14 = *(void **)(a1 + 88);
  v44[1] = *(id *)(a1 + 96);
  id v43 = v14;
  id v42 = *(id *)(a1 + 40);
  long long v15 = objc_retainBlock(v41);
  if (*(unsigned char *)(a1 + 112))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    long long v17 = *(void **)(a1 + 48);
    uint64_t v18 = *(void *)(a1 + 56);
    int v19 = [*(id *)(a1 + 64) pasteSharingToken];
    id v20 = [v17 accessToPasteboard:v5 auditTokenInfo:v16 authenticationMessage:v18 sharingToken:v19 dataOwner:*(void *)(a1 + 104)];

    switch((unint64_t)v20)
    {
      case 1uLL:
        __int16 v21 = _PBLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CC_SHA256_CTX buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Paste denied silently.", buf, 2u);
        }

        goto LABEL_23;
      case 2uLL:
        id v25 = _PBLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)CC_SHA256_CTX buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Paste allowed silently.", buf, 2u);
        }

        if (!PBPreferencesBoolValue()) {
          goto LABEL_28;
        }
        goto LABEL_27;
      case 3uLL:
        id v26 = _PBLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CC_SHA256_CTX buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Paste denied but announced.", buf, 2u);
        }

        [*(id *)(a1 + 72) announcePasteDenied];
        goto LABEL_23;
      case 4uLL:
        unsigned __int8 v27 = _PBLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)CC_SHA256_CTX buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Paste allowed but announced", buf, 2u);
        }

LABEL_27:
        [*(id *)(a1 + 72) announcePasteForPasteboard:v5 auditTokenInfo:*(void *)(a1 + 40)];
        goto LABEL_28;
      case 5uLL:
        if (_os_feature_enabled_impl())
        {
          tm v28 = _PBLog();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
            goto LABEL_37;
          }
          *(_WORD *)CC_SHA256_CTX buf = 0;
          timeval v29 = "Paste requires user authorization. Prompting...";
        }
        else
        {
          tm v28 = _PBLog();
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO)) {
            goto LABEL_37;
          }
          *(_WORD *)CC_SHA256_CTX buf = 0;
          timeval v29 = "Paste allowed but announced.";
        }
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, v29, buf, 2u);
LABEL_37:

        uint64_t v30 = mach_absolute_time();
        v31 = *(void **)(a1 + 40);
        uint64_t v34 = a1 + 64;
        uint64_t v32 = *(void *)(a1 + 64);
        v33 = *(void **)(v34 + 8);
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_10000E790;
        v35[3] = &unk_1000313E8;
        uint64_t v39 = v30;
        id v36 = v31;
        id v37 = v13;
        id v38 = v15;
        [v33 requestUserAuthorizationForPasteboard:v5 auditTokenInfo:v36 loadContext:v32 completionHandler:v35];

        break;
      default:
LABEL_23:
        ((void (*)(void *, void))v13[2])(v13, 0);
        break;
    }
  }
  else
  {
LABEL_28:
    ((void (*)(void *, void))v15[2])(v15, 0);
  }

  objc_destroyWeak(v44);
  objc_destroyWeak(&location);

LABEL_30:
}

void sub_10000E61C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E66C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = a2;
    PBNotAuthorizedError();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id))(v2 + 16))(v2, v3, v4);
  }
}

void sub_10000E6F0(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained items];
  id v6 = [v5 objectAtIndexedSubscript:*(void *)(a1 + 56)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000E790(uint64_t a1, uint64_t a2)
{
  id v5 = objc_msgSend(objc_alloc((Class)PBResponseMetadata), "initWithAuthorizationStartTime:authorizationEndTime:authorizationAdmonished:", *(void *)(a1 + 56), mach_absolute_time(), objc_msgSend(*(id *)(a1 + 32), "hasAppleSignature"));
  uint64_t v4 = 48;
  if (!a2) {
    uint64_t v4 = 40;
  }
  (*(void (**)(void))(*(void *)(a1 + v4) + 16))();
}

uint64_t sub_10000EA78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000EA98(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  unsigned __int8 v9 = [a3 representationConformingToType:*(void *)(a1 + 32)];
  if (v9)
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000ECD0;
    v20[3] = &unk_100031460;
    uint64_t v23 = *(id *)(a1 + 40);
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 56);
    id v21 = v10;
    uint64_t v25 = v11;
    id v22 = v7;
    id v24 = *(id *)(a1 + 48);
    id v12 = [v9 loadWithCompletionHandler:v20];

    long long v13 = v23;
  }
  else
  {
    long long v14 = _PBLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)CC_SHA256_CTX buf = 138412290;
      uint64_t v27 = v19;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Cannot find representation for type %@", buf, 0xCu);
    }

    uint64_t v15 = *(void *)(a1 + 40);
    if (v15)
    {
      uint64_t v16 = PBCannotLoadRepresentationError();
      (*(void (**)(uint64_t, id, void *))(v15 + 16))(v15, v8, v16);
    }
    long long v17 = _PBLog();
    long long v13 = v17;
    os_signpost_id_t v18 = *(void *)(a1 + 56);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)CC_SHA256_CTX buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v18, "RequestItem", "", buf, 2u);
    }
  }
}

void sub_10000ECD0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = _PBLog();
  long long v14 = v13;
  if (v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v24 = 138412290;
      id v25 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "...item request failed. Error: %@", (uint8_t *)&v24, 0xCu);
    }

    uint64_t v15 = *(void *)(a1 + 48);
    if (v15) {
      (*(void (**)(uint64_t, void, id))(v15 + 16))(v15, *(void *)(a1 + 32), v11);
    }
    if (v12) {
      v12[2](v12);
    }
    uint64_t v16 = _PBLog();
    long long v17 = v16;
    os_signpost_id_t v18 = *(void *)(a1 + 64);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LOWORD(v24) = 0;
LABEL_22:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, v18, "RequestItem", "", (uint8_t *)&v24, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "...item request completed successfully.", (uint8_t *)&v24, 2u);
    }

    uint64_t v19 = [*(id *)(a1 + 40) name];
    int v20 = PBIsPasteboardNameGeneralPasteboard();

    if (v20)
    {
      id v21 = [*(id *)(a1 + 40) creationDate];
      _PBStatLogPasteAge();
    }
    uint64_t v22 = *(void *)(a1 + 56);
    if (v22) {
      (*(void (**)(uint64_t, id, id, void, void))(v22 + 16))(v22, v9, v10, *(void *)(a1 + 32), 0);
    }
    if (v12) {
      v12[2](v12);
    }
    uint64_t v23 = _PBLog();
    long long v17 = v23;
    os_signpost_id_t v18 = *(void *)(a1 + 64);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      LOWORD(v24) = 0;
      goto LABEL_22;
    }
  }
}

uint64_t sub_10000F14C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F160(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v7 = a3;
  id v31 = a4;
  id v8 = a5;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v9 = sub_1000126F4();
  id v10 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v47;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v15 = [v7 representationConformingToType:v14];
        uint64_t v16 = v15;
        if (v15)
        {
          long long v17 = [v15 typeIdentifier];
          if ([v17 isEqualToString:v14])
          {

LABEL_16:
            id v22 = v14;

            if (*(unsigned char *)(a1 + 64)) {
              uint64_t v23 = &stru_1000314C8;
            }
            else {
              uint64_t v23 = &stru_1000314E8;
            }
            id v24 = objc_alloc_init((Class)NSMutableDictionary);
            uint64_t v25 = *(void *)(a1 + 32);
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472;
            v42[2] = sub_10000F5A8;
            v42[3] = &unk_100031510;
            id v26 = v24;
            id v43 = v26;
            v44 = v23;
            uint64_t v27 = [v7 enumeratePatternDetectionsForPatterns:v25 usingBlock:v42];
            if ([v27 count])
            {
              v32[0] = _NSConcreteStackBlock;
              v32[1] = 3221225472;
              v32[2] = sub_10000F634;
              v32[3] = &unk_100031538;
              id v39 = *(id *)(a1 + 56);
              int v20 = v31;
              id v33 = v31;
              id v34 = v22;
              id v35 = *(id *)(a1 + 40);
              id v36 = v27;
              id v37 = v26;
              v40 = v23;
              id v38 = v7;
              id v41 = *(id *)(a1 + 48);
              id v28 = [v16 loadDataWithCompletion:v32];
            }
            else
            {
              uint64_t v29 = *(void *)(a1 + 48);
              int v20 = v31;
              if (v29) {
                (*(void (**)(uint64_t, id, void))(v29 + 16))(v29, v26, 0);
              }
            }

            goto LABEL_24;
          }
          char v18 = sub_1000127F0(v8, v14);

          if (v18) {
            goto LABEL_16;
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  uint64_t v19 = _PBLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)CC_SHA256_CTX buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Cannot find representation for any text type", buf, 2u);
  }

  int v20 = v31;
  uint64_t v21 = *(void *)(a1 + 48);
  if (v21) {
    (*(void (**)(uint64_t, void *, void))(v21 + 16))(v21, &__NSDictionary0__struct, 0);
  }
LABEL_24:
}

PBItemDetection *__cdecl sub_10000F530(id a1, PBItemDetection *a2)
{
  uint64_t v2 = a2;
  return v2;
}

PBItemDetection *__cdecl sub_10000F558(id a1, PBItemDetection *a2)
{
  if ([(PBItemDetection *)a2 present]) {
    +[PBItemDetection detectionPresent];
  }
  else {
  uint64_t v2 = +[PBItemDetection detectionAbsent];
  }
  return (PBItemDetection *)v2;
}

void sub_10000F5A8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a2;
  v6(v5, a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v7];
}

void sub_10000F634(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _PBLog();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (!v6)
  {
    if (v8)
    {
      *(_WORD *)CC_SHA256_CTX buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "... loading finished successfully.", buf, 2u);
    }

    id v10 = [objc_alloc((Class)NSString) initWithData:v5 encoding:sub_100012960(*(void **)(a1 + 40))];
    id v11 = v10;
    if (v10)
    {
      id v27 = v10;
      id v28 = v5;
      uint64_t v12 = [*(id *)(a1 + 48) detectionsForPatterns:*(void *)(a1 + 56) inValue:v10];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v13 = *(id *)(a1 + 56);
      id v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v30;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            uint64_t v19 = *(void *)(a1 + 88);
            int v20 = [v12 objectForKeyedSubscript:v18];
            uint64_t v21 = (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v20);
            [*(id *)(a1 + 64) setObject:v21 forKeyedSubscript:v18];
          }
          id v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v15);
      }

      [*(id *)(a1 + 72) addPatternDetections:v12];
      uint64_t v22 = *(void *)(a1 + 96);
      if (v22) {
        (*(void (**)(uint64_t, void, void))(v22 + 16))(v22, *(void *)(a1 + 64), 0);
      }
      id v11 = v27;
      id v5 = v28;
    }
    else
    {
      uint64_t v23 = _PBLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v26 = *(void **)(a1 + 40);
        *(_DWORD *)CC_SHA256_CTX buf = 138412290;
        id v35 = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Cannot create string representation for type %@", buf, 0xCu);
      }

      uint64_t v24 = *(void *)(a1 + 80);
      if (!v24) {
        goto LABEL_24;
      }
      uint64_t v25 = *(void *)(a1 + 32);
      uint64_t v12 = PBCannotLoadRepresentationError();
      (*(void (**)(uint64_t, uint64_t, void *))(v24 + 16))(v24, v25, v12);
    }

LABEL_24:
    goto LABEL_25;
  }
  if (v8)
  {
    *(_DWORD *)CC_SHA256_CTX buf = 138412290;
    id v35 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "... loading failed with error: %@", buf, 0xCu);
  }

  uint64_t v9 = *(void *)(a1 + 80);
  if (v9) {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, *(void *)(a1 + 32), v6);
  }
LABEL_25:
}

uint64_t sub_10000FBB4(uint64_t a1)
{
  uint64_t v2 = _PBLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "...janitorial tasks complete.", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return PBDispatchAsyncCallback();
  }
  return result;
}

void sub_10000FED8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _PBLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)CC_SHA256_CTX buf = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "...completed enumerating all pasteboards. Error: %@", buf, 0xCu);
  }

  BOOL v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v11 = v8;
    id v9 = v5;
    id v10 = v6;
    PBDispatchAsyncCallback();
  }
}

uint64_t sub_100010024(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_10001003C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  PBNotAuthorizedError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

id sub_10001042C()
{
  if (qword_100039570 != -1) {
    dispatch_once(&qword_100039570, &stru_1000315D0);
  }
  v0 = (void *)qword_100039568;
  return v0;
}

void sub_100010480(id a1)
{
  qword_100039568 = (uint64_t)dispatch_queue_create("com.apple.pasteboard._soundQueue", 0);
  _objc_release_x1();
}

void sub_1000104C0(id a1)
{
  uint64_t v1 = dlopen("/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox", 1);
  if (!v1)
  {
    id v3 = _PBLog();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      goto LABEL_7;
    }
    int v7 = 136315138;
    BOOL v8 = dlerror();
    uint64_t v4 = "Could not load AudioToolbox framework. Error: %s";
    id v5 = v3;
    uint32_t v6 = 12;
LABEL_10:
    _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, v4, (uint8_t *)&v7, v6);
    goto LABEL_7;
  }
  id v2 = dlsym(v1, "AudioServicesPlaySystemSoundWithCompletion");
  if (v2)
  {
    off_100039578 = v2;
    return;
  }
  id v3 = _PBLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v7 = 136315394;
    BOOL v8 = "AudioServicesPlaySystemSoundWithCompletion";
    __int16 v9 = 2080;
    id v10 = dlerror();
    uint64_t v4 = "Could not load symbol %s. Error: %s";
    id v5 = v3;
    uint32_t v6 = 22;
    goto LABEL_10;
  }
LABEL_7:
}

uint64_t sub_100010698()
{
  qword_100039588 = objc_opt_new();
  return _objc_release_x1();
}

uint64_t sub_1000108EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000108FC(uint64_t a1)
{
}

void sub_100010904(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isTrustedToRequestAuthenticationMessages] & 1) == 0)
  {
    id v5 = _PBLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint32_t v6 = [*(id *)(a1 + 32) bundleID];
      *(_DWORD *)CC_SHA256_CTX buf = 138543362;
      uint64_t v16 = (uint64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ requested an authentication message, but didn't have the appropriate entitlement", buf, 0xCu);
    }
    goto LABEL_61;
  }
  if (([*(id *)(a1 + 40) _isRequester:*(void *)(a1 + 32) allowedToRequestAuthenticationMessageWithContext:*(void *)(a1 + 64)] & 1) == 0)
  {
    id v5 = _PBLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_61:

      uint64_t v3 = PBErrorMake();
      uint64_t v4 = *(void *)(a1 + 48);
      goto LABEL_62;
    }
    uint64_t v7 = [*(id *)(a1 + 32) bundleID];
    BOOL v8 = (void *)v7;
    uint64_t v9 = *(void *)(a1 + 64);
    if (v9 <= 0xC59AA8F622F26FBLL)
    {
      CFStringRef v10 = @"KeyCommand";
      if (v9 <= (uint64_t)0xA9745AB1695ED68ALL)
      {
        if (v9 <= (uint64_t)0x95DD33C9595B8B09)
        {
          if (v9 == 0x84E6A8CBF3F0F10CLL) {
            goto LABEL_60;
          }
          if (v9 == 0x926FA0AD41ACE950)
          {
            CFStringRef v10 = @"PasteButtonEditMenuDark";
            goto LABEL_60;
          }
        }
        else
        {
          switch(v9)
          {
            case 0x95DD33C9595B8B0ALL:
              CFStringRef v10 = @"AccessibilityVoiceOverRotorMenu";
              goto LABEL_60;
            case 0x9D0980DD8F0CAFCBLL:
              CFStringRef v10 = @"PasteButtonUndoInteractionHUDTextLight";
              goto LABEL_60;
            case 0xA16D1C5A60C000E1:
              CFStringRef v10 = @"PasteButtonCalloutBar";
              goto LABEL_60;
          }
        }
      }
      else if (v9 > (uint64_t)0xF317E322CB2CEA01)
      {
        switch(v9)
        {
          case 0xF317E322CB2CEA02:
            goto LABEL_60;
          case 0xF635B19E69CD15ECLL:
            CFStringRef v10 = @"PasteButtonContextMenuLight";
            goto LABEL_60;
          case 0x6B3CE0810AAF53ALL:
            CFStringRef v10 = @"AccessibilityVoiceCommand";
            goto LABEL_60;
        }
      }
      else
      {
        switch(v9)
        {
          case 0xA9745AB1695ED68BLL:
            CFStringRef v10 = @"PasteButtonContextMenuDark";
            goto LABEL_60;
          case 0xB40F49E017F83014:
            CFStringRef v10 = @"PasteControlLight";
            goto LABEL_60;
          case 0xC58523F7A4B7A983:
            CFStringRef v10 = @"PasteControlDark";
            goto LABEL_60;
        }
      }
    }
    else if (v9 > 0x51A2F5DDCA075EA0)
    {
      if (v9 > 0x67510999674CD01DLL)
      {
        switch(v9)
        {
          case 0x67510999674CD01ELL:
            CFStringRef v10 = @"PasteButtonUndoInteractionHUDTextDark";
            goto LABEL_60;
          case 0x70A52C167AE7B042:
            CFStringRef v10 = @"PasteButtonSystemInputAssistantLight";
            goto LABEL_60;
          case 0x7EC07AF570CAADBCLL:
            CFStringRef v10 = @"AccessibilityAssistiveTouchControl";
            goto LABEL_60;
        }
      }
      else
      {
        switch(v9)
        {
          case 0x51A2F5DDCA075EA1:
            CFStringRef v10 = @"EditMenuOOP";
            goto LABEL_60;
          case 0x5597A8D691A21829:
            CFStringRef v10 = @"PasteButtonSystemInputAssistantDark";
            goto LABEL_60;
          case 0x5A4A97C3218CE65BLL:
            CFStringRef v10 = @"KeyShortcutHUD";
            goto LABEL_60;
        }
      }
    }
    else if (v9 > 0x2BB12563A205EBD0)
    {
      switch(v9)
      {
        case 0x2BB12563A205EBD1:
          CFStringRef v10 = @"PasteButtonSystemInputAssistantPopover";
          goto LABEL_60;
        case 0x37CA128B814942F4:
          CFStringRef v10 = @"PasteButtonEditMenuLight";
          goto LABEL_60;
        case 0x41683F1594B2E071:
          CFStringRef v10 = @"ContextMenuOOP";
          goto LABEL_60;
      }
    }
    else
    {
      switch(v9)
      {
        case 0xC59AA8F622F26FCLL:
          CFStringRef v10 = @"PasteButtonUndoInteractionHUDIconDark";
          goto LABEL_60;
        case 0x237A2046F04E760CLL:
          CFStringRef v10 = @"PasteButtonUndoInteractionHUDIconLight";
          goto LABEL_60;
        case 0x25FC7F58D8DEA672:
          CFStringRef v10 = @"UndoSlideGestureOut";
LABEL_60:
          *(_DWORD *)CC_SHA256_CTX buf = 138543618;
          uint64_t v16 = v7;
          __int16 v17 = 2114;
          CFStringRef v18 = v10;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Client %{public}@ requested an authentication message for context %{public}@, but wasn't allowed.", buf, 0x16u);

          goto LABEL_61;
      }
    }
    CFStringRef v10 = @"(unknown)";
    goto LABEL_60;
  }
  id v2 = *(void **)(*(void *)(a1 + 40) + 16);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100010ED0;
  v13[3] = &unk_100031610;
  long long v14 = *(_OWORD *)(a1 + 64);
  uint64_t v3 = [v2 buildMessage:v13];
  uint64_t v4 = *(void *)(a1 + 56);
LABEL_62:
  uint64_t v11 = *(void *)(v4 + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v3;
}

void sub_100010ED0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setEventType:1];
  [v3 setOriginIdentifier:0x30D8E242D30C9F99];
  [v3 setContext:*(void *)(a1 + 32)];
  [v3 setVersionedPID:*(void *)(a1 + 40)];
  [v3 setRegistrantEntitled:1];
}

id sub_100011024(void *a1)
{
  id result = [*(id *)(a1[4] + 16) validateMessage:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result == (id)2;
  return result;
}

id sub_100011410(void *a1)
{
  id v1 = a1;
  id v2 = PBStorageRootURL();
  id v3 = PBSHA1HashOfString();

  uint64_t v4 = [v2 URLByAppendingPathComponent:v3];

  return v4;
}

uint64_t sub_10001148C()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v6 = 0;
  if (qword_1000395E8 != -1) {
    dispatch_once(&qword_1000395E8, &stru_100031790);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011564;
  block[3] = &unk_100031688;
  block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_1000395E0, block);
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

uint64_t sub_100011564(uint64_t a1)
{
  if (qword_1000395F8 != -1) {
    dispatch_once(&qword_1000395F8, &stru_1000317B0);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = atomic_fetch_add(&qword_1000395F0, 1uLL) + 1;
  if (qword_100039600 != -1) {
    dispatch_once(&qword_100039600, &stru_1000317D0);
  }
  notify_set_state(dword_100039598, *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  id v2 = (const char *)[PBPasteboardChangedNotifyNotification UTF8String];
  return notify_post(v2);
}

PBAuditTokenInfo *sub_100011628(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)atoken.val = *(_OWORD *)a1;
  *(_OWORD *)&atoken.val[4] = v2;
  uint64_t v3 = audit_token_to_pid(&atoken);
  uint64_t v4 = objc_alloc_init(PBAuditTokenInfo);
  long long v5 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)atoken.val = *(_OWORD *)a1;
  *(_OWORD *)&atoken.val[4] = v5;
  uint64_t v6 = SecTaskCreateWithAuditToken(0, &atoken);
  uint64_t v7 = v6;
  if (v6)
  {
    *(void *)error = 0;
    CFDictionaryRef v8 = SecTaskCopyValuesForEntitlements(v6, (CFArrayRef)&off_100033A18, (CFErrorRef *)error);
    CFDictionaryRef v9 = v8;
    if (v8)
    {
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100011CE0;
      v43[3] = &unk_1000316B0;
      CFDictionaryRef v44 = v8;
      CFStringRef v10 = objc_retainBlock(v43);
      [(PBAuditTokenInfo *)v4 setAllowedToQueryBundleID:((unsigned int (*)(void *, const __CFString *))v10[2])(v10, @"com.apple.Pasteboard.originating-bundle-id-query") != 0];
      [(PBAuditTokenInfo *)v4 setAllowedAccessInBackground:((unsigned int (*)(void *, const __CFString *))v10[2])(v10, @"com.apple.Pasteboard.background-access") != 0];
      [(PBAuditTokenInfo *)v4 setAllowedToPerformJanitorialTasks:((unsigned int (*)(void *, const __CFString *))v10[2])(v10, @"com.apple.Pasteboard.trigger-janitor") != 0];
      [(PBAuditTokenInfo *)v4 setAllowedToPasteUnchecked:((unsigned int (*)(void *, const __CFString *))v10[2])(v10, @"com.apple.Pasteboard.paste-unchecked") != 0];
      [(PBAuditTokenInfo *)v4 setAllowedToCopyOnPaste:((unsigned int (*)(void *, const __CFString *))v10[2])(v10, @"com.apple.Pasteboard.copy-on-paste") != 0];
      [(PBAuditTokenInfo *)v4 setTrustedToRequestAuthenticationMessages:((unsigned int (*)(void *, const __CFString *))v10[2])(v10, @"com.apple.Pasteboard.trusted-authentication-message-request") != 0];
      BOOL v11 = ((uint64_t (*)(void *, const __CFString *))v10[2])(v10, @"com.apple.Pasteboard.trusted-bundle-layout") != 0;

      uint64_t v12 = v44;
    }
    else
    {
      uint64_t v12 = _PBLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        atoken.val[0] = 134218242;
        *(void *)&atoken.val[1] = (int)v3;
        LOWORD(atoken.val[3]) = 2112;
        *(void *)((char *)&atoken.val[3] + 2) = *(void *)error;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Could not obtain entitlements for process with pid %ld: %@", (uint8_t *)&atoken, 0x16u);
      }
      BOOL v11 = 0;
    }

    id v13 = (__CFString *)SecTaskCopySigningIdentifier(v7, 0);
    [(PBAuditTokenInfo *)v4 setHasAppleSignature:[(__CFString *)v13 hasPrefix:@"com.apple."]];
  }
  else
  {
    BOOL v11 = 0;
  }
  id v42 = 0;
  long long v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)atoken.val = *(_OWORD *)a1;
  *(_OWORD *)&atoken.val[4] = v14;
  id v15 = +[LSBundleRecord bundleRecordForAuditToken:&atoken error:&v42];
  id v38 = v42;
  cf = v7;
  if (!v15)
  {
    if (proc_pidpath_audittoken((audit_token_t *)a1, &atoken, 0x400u))
    {
      uint64_t v25 = +[NSURL fileURLWithFileSystemRepresentation:&atoken isDirectory:0 relativeToURL:0];
      id v26 = v25;
      if (!v11)
      {
        if (v25)
        {
          uint64_t v18 = v3;
          uint64_t v21 = [v25 lastPathComponent];

LABEL_41:
          uint64_t v22 = 0;
          uint64_t v23 = 0;
LABEL_45:
          __int16 v17 = 0;
          uint64_t v24 = 0;
          goto LABEL_46;
        }
LABEL_37:
        long long v32 = _PBLog();
        uint64_t v18 = v3;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)error = 134217984;
          *(void *)&error[4] = (int)v3;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "WARNING: Cannot determine name of process with pid %ld", error, 0xCu);
        }

        uint64_t v21 = +[NSString stringWithFormat:@"(pid:%ld)", (int)v3];
        goto LABEL_41;
      }
    }
    else
    {
      if (!v11) {
        goto LABEL_37;
      }
      id v26 = 0;
    }
    *(void *)error = 0;
    id v41 = 0;
    int v27 = CPCopyBundleIdentifierAndTeamFromSecTaskRef();
    if (v27) {
      uint64_t v22 = v41;
    }
    else {
      uint64_t v22 = 0;
    }
    if (v27) {
      uint64_t v23 = *(void **)error;
    }
    else {
      uint64_t v23 = 0;
    }
    if (v26 && (uint64_t v28 = _CFBundleCopyBundleURLForExecutableURL()) != 0)
    {
      long long v29 = (const void *)v28;
      uint64_t v18 = v3;
      Unique = (__CFBundle *)_CFBundleCreateUnique();
      if (Unique)
      {
        long long v31 = Unique;
        uint64_t v21 = CFBundleGetValueForInfoDictionaryKey(Unique, _kCFBundleDisplayNameKey);
        CFRelease(v31);
      }
      else
      {
        uint64_t v21 = 0;
      }
      CFRelease(v29);
    }
    else
    {
      uint64_t v18 = v3;
      uint64_t v21 = 0;
    }

    goto LABEL_45;
  }
  id v16 = v15;
  objc_opt_class();
  __int16 v17 = v16;
  if (objc_opt_isKindOfClass())
  {
    __int16 v17 = [v16 containingBundleRecord];
  }
  uint64_t v18 = v3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v19 = v17;
  }
  else {
    uint64_t v19 = 0;
  }
  id v20 = v19;

  if (v20)
  {
    uint64_t v21 = [v20 localizedName];
    uint64_t v22 = [v20 bundleIdentifier];
    uint64_t v23 = [v20 teamIdentifier];
    uint64_t v24 = [v20 persistentIdentifier];
  }
  else
  {
    uint64_t v21 = [v16 localizedName];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v16 effectiveBundleIdentifier];
    }
    else {
    uint64_t v22 = [v16 bundleIdentifier];
    }
    uint64_t v24 = [v16 persistentIdentifier];
    __int16 v17 = 0;
    uint64_t v23 = 0;
  }
LABEL_46:
  [(PBAuditTokenInfo *)v4 setLocalizedName:v21];
  [(PBAuditTokenInfo *)v4 setPid:v18];
  long long v33 = *(_OWORD *)(a1 + 16);
  v40[0] = *(_OWORD *)a1;
  v40[1] = v33;
  [(PBAuditTokenInfo *)v4 setAuditToken:v40];
  [(PBAuditTokenInfo *)v4 setPersistentIdentifier:v24];
  [(PBAuditTokenInfo *)v4 setTeamID:v23];
  [(PBAuditTokenInfo *)v4 setBundleID:v22];

  id v34 = [v15 URL];
  [(PBAuditTokenInfo *)v4 setBundleURL:v34];

  id v35 = [v15 SDKVersion];
  [(PBAuditTokenInfo *)v4 setLinkedOnVersion:v35];

  id v36 = self;
  [(PBAuditTokenInfo *)v4 setIsExtension:objc_opt_isKindOfClass() & 1];

  if (cf) {
    CFRelease(cf);
  }

  return v4;
}

id sub_100011CE0(uint64_t a1, uint64_t a2)
{
  long long v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  if (objc_opt_respondsToSelector()) {
    id v3 = [v2 BOOLValue];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

uint64_t sub_100011D3C(void *a1, void *a2, char *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (![v6 isExtension]
    || (PBIsPasteboardNameGeneralPasteboard() & 1) != 0
    || (+[LSApplicationWorkspace defaultWorkspace],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v6 linkedOnVersion],
        CFDictionaryRef v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v7 isVersion:v8 greaterThanOrEqualToVersion:@"14.5"],
        v8,
        v7,
        v9))
  {
    CFStringRef v10 = +[RBSProcessStateDescriptor descriptor];
    [v10 setValues:1];
    uint64_t v11 = FBSSceneVisibilityEndowmentNamespace;
    uint64_t v30 = FBSSceneVisibilityEndowmentNamespace;
    uint64_t v12 = +[NSArray arrayWithObjects:&v30 count:1];
    [v10 setEndowmentNamespaces:v12];

    id v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v6 pid]);
    long long v14 = +[RBSProcessPredicate predicateMatchingIdentifier:v13];
    id v27 = 0;
    id v15 = +[RBSProcessState statesForPredicate:v14 withDescriptor:v10 error:&v27];
    id v16 = v27;

    if ([v15 count] == (id)1)
    {
      __int16 v17 = [v15 objectAtIndexedSubscript:0];
      unsigned int v18 = [v17 taskState];
      if ((v18 == 4 || v18 == 2)
        && ([v17 endowmentNamespaces],
            uint64_t v19 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v20 = [v19 containsObject:v11],
            v19,
            (v20 & 1) != 0))
      {
        uint64_t v21 = 1;
        char v22 = 1;
      }
      else
      {
        uint64_t v21 = (uint64_t)[v6 isAllowedAccessInBackground];
        char v22 = 0;
      }
    }
    else
    {
      __int16 v17 = _PBLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        unsigned int v25 = [v6 pid];
        *(_DWORD *)CC_SHA256_CTX buf = 67109378;
        LODWORD(v29[0]) = v25;
        WORD2(v29[0]) = 2112;
        *(void *)((char *)v29 + 6) = v16;
        _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Could not get process state for pid %d. Error: %@", buf, 0x12u);
      }
      char v22 = 0;
      uint64_t v21 = 1;
    }

    if (a3) {
      *a3 = v22;
    }
    if ((v21 & 1) == 0)
    {
      uint64_t v23 = _PBLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        id v26 = [v6 bundleID];
        *(_DWORD *)CC_SHA256_CTX buf = 138412290;
        v29[0] = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Not allowing bundle ID %@ access to the pasteboard while it's not foreground.", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

id sub_100012074(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v3 persistentIdentifier];
  uint64_t v6 = [v4 originatorPersistentID];
  uint64_t v7 = [v3 bundleID];

  CFDictionaryRef v8 = [v4 originatorBundleID];

  if (v5 | v6)
  {
    id v9 = [(id)v5 isEqualToData:v6];
  }
  else
  {
    if (!v7)
    {
      id v10 = 0;
      goto LABEL_7;
    }
    id v9 = [v7 isEqualToString:v8];
  }
  id v10 = v9;
LABEL_7:

  return v10;
}

void sub_100012144(void *a1, void *a2)
{
  id v3 = a1;
  id v32 = a2;
  id v4 = +[NSMutableSet set];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v31 = v3;
  id obj = [v3 items];
  id v5 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v5)
  {
    id v6 = v5;
    id v36 = *(id *)v49;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(id *)v49 != v36) {
          objc_enumerationMutation(obj);
        }
        CFDictionaryRef v8 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v9 = [v8 availableTypes];
        id v10 = [v9 countByEnumeratingWithState:&v44 objects:v58 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v45;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v45 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void *)(*((void *)&v44 + 1) + 8 * (void)j);
              id v15 = [v8 persistentFileNameForType:v14];
              [v4 addObject:v15];

              id v16 = [v8 persistentBookmarkFileNameForType:v14];
              [v4 addObject:v16];
            }
            id v11 = [v9 countByEnumeratingWithState:&v44 objects:v58 count:16];
          }
          while (v11);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v6);
  }

  __int16 v17 = +[NSFileManager defaultManager];
  NSURLResourceKey v57 = NSURLNameKey;
  unsigned int v18 = +[NSArray arrayWithObjects:&v57 count:1];
  long long v33 = v17;
  uint64_t v19 = [v17 enumeratorAtURL:v32 includingPropertiesForKeys:v18 options:5 errorHandler:&stru_1000316F0];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  unsigned __int8 v20 = v19;
  id v21 = [v20 countByEnumeratingWithState:&v40 objects:v56 count:16];
  id v37 = v20;
  if (!v21) {
    goto LABEL_34;
  }
  id v22 = v21;
  obja = 0;
  uint64_t v23 = *(void *)v41;
  do
  {
    for (k = 0; k != v22; k = (char *)k + 1)
    {
      if (*(void *)v41 != v23) {
        objc_enumerationMutation(v37);
      }
      unsigned int v25 = *(char **)(*((void *)&v40 + 1) + 8 * (void)k);
      id v38 = 0;
      id v39 = 0;
      unsigned int v26 = [v25 getResourceValue:&v39 forKey:NSURLNameKey error:&v38];
      id v27 = v39;
      id v28 = v38;
      if (v26)
      {
        if (([v27 isEqualToString:@"Manifest.plist"] & 1) == 0
          && ([v4 containsObject:v27] & 1) == 0)
        {
          long long v29 = _PBLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)CC_SHA256_CTX buf = 138412290;
            v53 = v25;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Removing unused file %@", buf, 0xCu);
          }

          [v33 removeItemAtURL:v25 error:0];
          ++obja;
        }
      }
      else
      {
        uint64_t v30 = _PBLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)CC_SHA256_CTX buf = 138412546;
          v53 = v25;
          __int16 v54 = 2112;
          id v55 = v28;
          _os_log_fault_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "Could not get properties of file URL %@, error: %@", buf, 0x16u);
        }
      }
    }
    id v22 = [v37 countByEnumeratingWithState:&v40 objects:v56 count:16];
  }
  while (v22);

  if (obja)
  {
    unsigned __int8 v20 = _PBLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)CC_SHA256_CTX buf = 134217984;
      v53 = obja;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Removed %lu files.", buf, 0xCu);
    }
LABEL_34:
  }
}

BOOL sub_10001261C(id a1, NSURL *a2, NSError *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = _PBLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Could not enumerate directory entry %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

id sub_1000126F4()
{
  if (qword_1000395A8 != -1) {
    dispatch_once(&qword_1000395A8, &stru_100031710);
  }
  uint64_t v0 = (void *)qword_1000395A0;
  return v0;
}

void sub_100012748(id a1)
{
  v3[0] = kUTTypeUTF8PlainText;
  v3[1] = kUTTypeUTF16PlainText;
  v3[2] = kUTTypePlainText;
  v3[3] = kUTTypeText;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:4];
  long long v2 = (void *)qword_1000395A0;
  qword_1000395A0 = v1;
}

uint64_t sub_1000127F0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (qword_1000395B8 != -1) {
    dispatch_once(&qword_1000395B8, &stru_100031730);
  }
  if ([(id)qword_1000395B0 containsObject:v4])
  {
    uint64_t v5 = 1;
  }
  else
  {
    id v6 = +[LSApplicationWorkspace defaultWorkspace];
    uint64_t v7 = [v3 linkedOnVersion];
    uint64_t v5 = [v6 isVersion:v7 greaterThanOrEqualToVersion:@"17.0"] ^ 1;
  }
  return v5;
}

void sub_1000128C4(id a1)
{
  v3[0] = kUTTypeUTF8PlainText;
  v3[1] = kUTTypeUTF16PlainText;
  v3[2] = kUTTypePlainText;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:3];
  long long v2 = (void *)qword_1000395B0;
  qword_1000395B0 = v1;
}

id sub_100012960(void *a1)
{
  uint64_t v1 = qword_1000395C8;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_1000395C8, &stru_100031750);
  }
  id v3 = [(id)qword_1000395C0 objectForKeyedSubscript:v2];

  id v4 = [v3 unsignedIntegerValue];
  return v4;
}

void sub_1000129DC(id a1)
{
  v3[0] = kUTTypeUTF8PlainText;
  v3[1] = kUTTypeUTF16PlainText;
  v4[0] = &off_100033B28;
  v4[1] = &off_100033B40;
  v3[2] = kUTTypePlainText;
  void v3[3] = kUTTypeText;
  v4[2] = &off_100033B28;
  v4[3] = &off_100033B28;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4];
  id v2 = (void *)qword_1000395C0;
  qword_1000395C0 = v1;
}

id sub_100012AA0()
{
  if (qword_1000395D8 != -1) {
    dispatch_once(&qword_1000395D8, &stru_100031770);
  }
  uint64_t v0 = (void *)qword_1000395D0;
  return v0;
}

void sub_100012AF4(id a1)
{
  *(_OWORD *)in = 0u;
  memset(v8, 0, sizeof(v8));
  size_t v5 = 37;
  memset(uu, 0, sizeof(uu));
  if (sysctlbyname("kern.bootsessionuuid", in, &v5, 0, 0) || uuid_parse(in, uu))
  {
    uint64_t v1 = _PBLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "Could not get boot session UUID.", v4, 2u);
    }

    id v2 = +[NSUUID UUID];
  }
  else
  {
    id v2 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:uu];
  }
  id v3 = (void *)qword_1000395D0;
  qword_1000395D0 = (uint64_t)v2;
}

void sub_100012C0C(id a1)
{
  qword_1000395E0 = (uint64_t)dispatch_queue_create("com.apple.Pasteboard.notify-count-queue", 0);
  _objc_release_x1();
}

void sub_100012C4C(id a1)
{
  uint64_t v1 = arc4random();
  qword_1000395F0 = arc4random() | (unint64_t)(v1 << 32);
}

void sub_100012C84(id a1)
{
  uint32_t v1 = notify_register_check((const char *)[PBPasteboardChangedNotifyNotification UTF8String], &dword_100039598);
  if (v1)
  {
    uint32_t v2 = v1;
    id v3 = _PBLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4[0] = 67109120;
      v4[1] = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Could not register for notify token. Error: %u", (uint8_t *)v4, 8u);
    }
  }
}

void sub_100013428(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = +[PBItemDetection detectionPresentWithValue:a3];
  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v5];
}

uint64_t sub_1000134B4()
{
  return PBPreferencesBoolValue();
}

void sub_100013888(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = a5;
  uint64_t v45 = 0;
  long long v46 = &v45;
  uint64_t v47 = 0x3032000000;
  long long v48 = sub_100013CA0;
  long long v49 = sub_100013CB0;
  id v50 = 0;
  uint64_t v39 = 0;
  long long v40 = &v39;
  uint64_t v41 = 0x3032000000;
  long long v42 = sub_100013CA0;
  long long v43 = sub_100013CB0;
  id v13 = v11;
  id v44 = v13;
  uint64_t v14 = &AnalyticsSendEventLazy_ptr;
  if (v9)
  {
    id v15 = [*(id *)(a1 + 32) type];
    PBTemporaryFileName();
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      [v9 writeToURL:v16 atomically:0];
      __int16 v17 = [*(id *)(a1 + 32) item];
      unsigned int v18 = [v17 metadata];
      uint64_t v19 = [v18 objectForKeyedSubscript:PBMetadataSuggestedNameKey];

      unsigned __int8 v20 = [*(id *)(a1 + 32) type];
      id v21 = PBFilenameWithProperExtension();
      id v36 = v10;

      id v22 = [*(id *)(a1 + 32) type];
      obj[1] = 0;
      obj[2] = 0;
      uint64_t v23 = PBCloneURLToTemporaryFolder();
      id v24 = 0;
      id v25 = 0;

      if (v25)
      {
        uint64_t v26 = PBCannotCreateTemporaryFile();
        id v27 = (void *)v40[5];
        v40[5] = v26;
      }
      else
      {
        long long v31 = v46;
        id v32 = v23;
        id v27 = (void *)v31[5];
        v31[5] = (uint64_t)v32;
      }

      long long v33 = +[NSFileManager defaultManager];
      [v33 removeItemAtURL:v16 error:0];

      id v10 = v36;
      uint64_t v14 = &AnalyticsSendEventLazy_ptr;
    }
    else
    {
      uint64_t v30 = PBCannotCreateTemporaryFile();
      id v21 = (void *)v40[5];
      v40[5] = v30;
    }
  }
  else
  {
    if (!v10) {
      goto LABEL_11;
    }
    id v16 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:0];
    id v21 = [v10 url];
    long long v29 = (id *)(v40 + 5);
    id v28 = (void *)v40[5];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100013CB8;
    v37[3] = &unk_100031820;
    v37[4] = *(void *)(a1 + 32);
    v37[5] = &v39;
    v37[6] = &v45;
    obj[0] = v28;
    [v16 coordinateReadingItemAtURL:v21 options:1 error:obj byAccessor:v37];
    objc_storeStrong(v29, obj[0]);
  }

LABEL_11:
  uint64_t v34 = *(void *)(a1 + 40);
  if (v34) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v34, v46[5], v40[5]);
  }
  if (v12) {
    v12[2](v12);
  }
  if (v46[5])
  {
    id v35 = [v14[254] defaultManager];
    [v35 removeItemAtURL:v46[5] error:0];
  }
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
}

void sub_100013C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

uint64_t sub_100013CA0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100013CB0(uint64_t a1)
{
}

void sub_100013CB8(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    id v5 = [v3 item];
    id v6 = [v5 metadata];
    uint64_t v7 = [v6 objectForKeyedSubscript:PBMetadataSuggestedNameKey];

    int v8 = [*(id *)(a1 + 32) type];
    id v9 = PBCloneURLToTemporaryFolder();

    id v10 = 0;
    id v11 = 0;

    if (v11)
    {
      uint64_t v12 = PBCannotCreateTemporaryFile();
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    else
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8);
      id v16 = v9;
      uint64_t v14 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v16;
    }
  }
}

void sub_100013F7C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = a5;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3032000000;
  id v35 = sub_100013CA0;
  id v36 = sub_100013CB0;
  id v37 = 0;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  long long v29 = sub_100013CA0;
  uint64_t v30 = sub_100013CB0;
  id v13 = v11;
  id v31 = v13;
  if (v9)
  {
    uint64_t v14 = +[NSInputStream inputStreamWithData:v9];
    uint64_t v15 = (void *)v33[5];
    v33[5] = v14;

    uint64_t v16 = *(void *)(a1 + 32);
    if (v16) {
      (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, v33[5], v13);
    }
    if (v12) {
      v12[2](v12);
    }
  }
  else if (v10)
  {
    __int16 v17 = [v10 url];
    id v18 = (id)PBCoordinatedRead();

    id v19 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:0];
    unsigned __int8 v20 = [v10 url];
    id v22 = (id *)(v27 + 5);
    id v21 = (void *)v27[5];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100014238;
    v24[3] = &unk_1000318B0;
    v24[4] = &v26;
    v24[5] = &v32;
    id obj = v21;
    [v19 coordinateReadingItemAtURL:v20 options:1 error:&obj byAccessor:v24];
    objc_storeStrong(v22, obj);
  }
  uint64_t v23 = *(void *)(a1 + 32);
  if (v23) {
    (*(void (**)(uint64_t, uint64_t, id))(v23 + 16))(v23, v33[5], v13);
  }
  if (v12) {
    v12[2](v12);
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
}

void sub_10001420C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100014238(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v3 + 40);
  id v4 = +[NSFileHandle fileHandleForReadingFromURL:a2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    uint64_t v5 = +[PBRemotePasteboardItemProviderInputStream inputStreamWithFileHandle:v4];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

void sub_100014D10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _PBLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)CC_SHA256_CTX buf = 138412290;
      id v67 = v6;
      _os_log_fault_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Could not request remote pasteboard data. Error: %@", buf, 0xCu);
    }

    int v8 = *(void **)(a1 + 56);
    if (v8)
    {
      id v58 = _NSConcreteStackBlock;
      uint64_t v59 = 3221225472;
      id v60 = sub_1000151CC;
      long long v61 = &unk_100030B10;
      id v9 = &v63;
      id v63 = v8;
      id v62 = *(id *)(a1 + 32);
      PBDispatchAsyncCallback();

LABEL_31:
    }
  }
  else
  {
    id obj = v5;
    uint64_t v38 = a1;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v40 = [v5 countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v40)
    {
      uint64_t v39 = *(void *)v55;
      uint64_t v42 = PBMetadataSuggestedNameKey;
      uint64_t v10 = v48;
      p_info = &@".net".info;
      uint64_t v12 = &unk_100031900;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v55 != v39) {
            objc_enumerationMutation(obj);
          }
          uint64_t v41 = v13;
          uint64_t v14 = *(void **)(*((void *)&v54 + 1) + 8 * v13);
          id v15 = objc_alloc_init((Class)PBItem);
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          id v45 = [v14 types];
          id v16 = [v45 countByEnumeratingWithState:&v50 objects:v64 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v51;
            uint64_t v43 = *(void *)v51;
            do
            {
              id v19 = 0;
              id v44 = v17;
              do
              {
                if (*(void *)v51 != v18) {
                  objc_enumerationMutation(v45);
                }
                unsigned __int8 v20 = *(void **)(*((void *)&v50 + 1) + 8 * (void)v19);
                id v21 = [v20 type];
                if ([v20 conformsToProtocol:p_info[251]])
                {
                  id v22 = v12;
                  uint64_t v23 = v10;
                  id v24 = p_info;
                  id v25 = v20;
                  uint64_t v26 = [v15 metadata];
                  id v27 = [v26 mutableCopy];
                  uint64_t v28 = v27;
                  if (v27) {
                    id v29 = v27;
                  }
                  else {
                    id v29 = objc_alloc_init((Class)NSMutableDictionary);
                  }
                  uint64_t v30 = v29;

                  id v31 = [v25 getFileName];

                  if (v31) {
                    [v30 setObject:v31 forKeyedSubscript:v42];
                  }
                  [v15 setMetadata:v30];

                  p_info = v24;
                  uint64_t v10 = v23;
                  uint64_t v12 = v22;
                  uint64_t v18 = v43;
                  id v17 = v44;
                }
                v47[0] = _NSConcreteStackBlock;
                v47[1] = 3221225472;
                v48[0] = sub_10001523C;
                v48[1] = v12;
                id v49 = v21;
                id v32 = v21;
                objc_msgSend(v15, "v2_addRepresentationType:preferredRepresentation:loader:", v32, 1, v47);

                id v19 = (char *)v19 + 1;
              }
              while (v17 != v19);
              id v17 = [v45 countByEnumeratingWithState:&v50 objects:v64 count:16];
            }
            while (v17);
          }

          long long v33 = [v15 availableTypes];
          id v34 = [v33 count];

          if (v34) {
            [*(id *)(v38 + 48) addObject:v15];
          }

          uint64_t v13 = v41 + 1;
        }
        while ((id)(v41 + 1) != v40);
        id v40 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
      }
      while (v40);
    }
    a1 = v38;
    [*(id *)(v38 + 32) setItems:*(void *)(v38 + 48)];
    [*(id *)(v38 + 32) setRemoteMetadataLoaded];
    id v35 = *(void **)(v38 + 56);
    id v6 = 0;
    id v5 = obj;
    if (v35)
    {
      id v9 = &v46;
      id v46 = v35;
      PBDispatchAsyncCallback();
      goto LABEL_31;
    }
  }
  id v36 = [*(id *)(a1 + 40) workQueue];
  dispatch_resume(v36);
}

void sub_1000151CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) UUID];
  uint32_t v2 = PBPasteboardNotAvailableError();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

uint64_t sub_10001523C(uint64_t a1, void (**a2)(void, void, void, void, void))
{
  if (a2)
  {
    id v3 = a2;
    id v4 = PBCannotLoadRepresentationError();
    ((void (**)(void, void, void, void *, void))a2)[2](v3, 0, 0, v4, 0);
  }
  return 0;
}

uint64_t sub_1000152B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100015448(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_100015460(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  id v5 = *(void **)(a1 + 48);
  if (v5)
  {
    if (v3)
    {
      id v6 = v10;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100015584;
      v10[3] = &unk_100030B10;
      v10[5] = v5;
      uint64_t v7 = v4;
    }
    else
    {
      id v6 = v9;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10001559C;
      v9[3] = &unk_100030B10;
      v9[5] = v5;
      uint64_t v7 = *(void **)(a1 + 32);
    }
    v6[4] = v7;
    PBDispatchAsyncCallback();
  }
  int v8 = [*(id *)(a1 + 40) workQueue];
  dispatch_resume(v8);
}

uint64_t sub_100015584(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t sub_10001559C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_1000157AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _PBLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CC_SHA256_CTX buf = 138412290;
      id v61 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Could not request remote pasteboard data. Error: %@", buf, 0xCu);
    }

    int v8 = *(void **)(a1 + 56);
    if (v8)
    {
      long long v52 = _NSConcreteStackBlock;
      uint64_t v53 = 3221225472;
      long long v54 = sub_100015C54;
      long long v55 = &unk_100030B10;
      id v57 = v8;
      id v56 = *(id *)(a1 + 32);
      PBDispatchAsyncCallback();
    }
    id v9 = [*(id *)(a1 + 40) workQueue];
    dispatch_resume(v9);
  }
  else
  {
    id obj = v5;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v34 = [v5 countByEnumeratingWithState:&v48 objects:v59 count:16];
    if (v34)
    {
      uint64_t v32 = *(void *)v49;
      uint64_t v36 = PBMetadataSuggestedNameKey;
      uint64_t v10 = v43;
      p_info = &@".net".info;
      uint64_t v12 = &unk_100031900;
      uint64_t v33 = a1;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v49 != v32) {
            objc_enumerationMutation(obj);
          }
          uint64_t v35 = v13;
          uint64_t v14 = *(void **)(*((void *)&v48 + 1) + 8 * v13);
          id v15 = objc_alloc_init((Class)PBItem);
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v39 = [v14 types];
          id v16 = [v39 countByEnumeratingWithState:&v44 objects:v58 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v45;
            uint64_t v37 = *(void *)v45;
            do
            {
              id v19 = 0;
              id v38 = v17;
              do
              {
                if (*(void *)v45 != v18) {
                  objc_enumerationMutation(v39);
                }
                unsigned __int8 v20 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v19);
                id v21 = [v20 type];
                if ([v20 conformsToProtocol:p_info[251]])
                {
                  id v22 = v12;
                  uint64_t v23 = v10;
                  id v24 = p_info;
                  id v25 = v20;
                  uint64_t v26 = [v15 metadata];
                  id v27 = [v26 mutableCopy];

                  uint64_t v28 = [v25 getFileName];

                  p_info = v24;
                  uint64_t v10 = v23;
                  uint64_t v12 = v22;
                  id v17 = v38;
                  [v27 setObject:v28 forKeyedSubscript:v36];

                  [v15 setMetadata:v27];
                  uint64_t v18 = v37;
                }
                v42[0] = _NSConcreteStackBlock;
                v42[1] = 3221225472;
                v43[0] = sub_100015CC8;
                v43[1] = v12;
                v43[2] = v20;
                objc_msgSend(v15, "v2_addRepresentationType:preferredRepresentation:loader:", v21, 1, v42);

                id v19 = (char *)v19 + 1;
              }
              while (v17 != v19);
              id v17 = [v39 countByEnumeratingWithState:&v44 objects:v58 count:16];
            }
            while (v17);
          }

          a1 = v33;
          [*(id *)(v33 + 48) addObject:v15];

          uint64_t v13 = v35 + 1;
        }
        while ((id)(v35 + 1) != v34);
        id v34 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
      }
      while (v34);
    }
    [*(id *)(a1 + 32) setItems:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) setRemoteDataLoaded];
    id v9 = objc_msgSend(*(id *)(a1 + 40), "workQueue_saveGeneralPasteboardFromContinuityPasteboard:", *(void *)(a1 + 32));
    id v29 = *(void **)(a1 + 56);
    if (v29)
    {
      id v41 = v29;
      id v40 = v9;
      PBDispatchAsyncCallback();
    }
    uint64_t v30 = [*(id *)(a1 + 40) workQueue];
    dispatch_resume(v30);

    id v6 = 0;
    id v5 = obj;
  }
}

void sub_100015C54(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) UUID];
  uint32_t v2 = PBPasteboardNotAvailableError();
  (*(void (**)(uint64_t, void, void *))(v1 + 16))(v1, 0, v2);
}

uint64_t sub_100015CC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016278;
  v7[3] = &unk_1000319A0;
  id v8 = v3;
  id v5 = v3;
  [v4 getDataWithCompletionBlock:v7];

  return 0;
}

uint64_t sub_100015D64(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t sub_100015EEC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_100015F04(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  id v8 = *(void **)(a1 + 40);
  if (v8)
  {
    if (v6)
    {
      id v9 = v13;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100016038;
      v13[3] = &unk_100030B10;
      v13[5] = v8;
      uint64_t v10 = v7;
    }
    else
    {
      id v9 = v12;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100016050;
      v12[3] = &unk_100030B10;
      v12[5] = v8;
      uint64_t v10 = v5;
    }
    v9[4] = v10;
    PBDispatchAsyncCallback();
  }
  id v11 = [*(id *)(a1 + 32) workQueue];
  dispatch_resume(v11);
}

uint64_t sub_100016038(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t sub_100016050(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_100016118(uint64_t a1)
{
  uint32_t v2 = objc_msgSend(*(id *)(a1 + 32), "workQueue_pasteboardWithPersistenceName:name:localOnly:", PBGeneralPasteboardName, PBGeneralPasteboardName, 0);
  id v5 = v2;
  if (v2) {
    uint64_t v3 = (uint64_t)[v2 changeCount] + 1;
  }
  else {
    uint64_t v3 = 1;
  }
  id v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    objc_msgSend(v4, "workQueue_createRemoteGeneralPasteboardWithChangeCount:", v3);
  }
  else {
    objc_msgSend(v4, "workQueue_removeRemotePasteboardAndRestoreGeneralPasteboard", v3);
  }
}

uint64_t sub_100016260(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100016278(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 && !v6)
  {
    [v5 open];
    id v8 = NSTemporaryDirectory();
    id v9 = [v8 stringByAppendingPathComponent:@"data"];

    bzero(v43, 0x401uLL);
    id v10 = v9;
    [v10 fileSystemRepresentation];
    int v11 = CPOpenTemporaryFile();
    if (v11 == -1)
    {
      id v19 = _PBLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        id v27 = __error();
        uint64_t v28 = strerror(*v27);
        __CC_SHA256_CTX buf = 136315394;
        id v40 = "NSProgress *_loadRemoteItemProvider(NSObject<UAPasteboardItemProviding> *__strong, void (^__strong)(NSData"
              " *__strong, PBSecurityScopedURLWrapper *__strong, NSError *__strong, void (^__strong)(void)))_block_invoke";
        __int16 v41 = 2080;
        uint64_t v42 = v28;
        _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "%s: Cannot create temporary file for incoming data stream. Error: %s", (uint8_t *)&__buf, 0x16u);
      }

      [v5 close];
      id v13 = 0;
      goto LABEL_23;
    }
    int v12 = v11;
    id v13 = +[NSURL fileURLWithFileSystemRepresentation:v43 isDirectory:0 relativeToURL:0];
    if ([v5 hasBytesAvailable])
    {
      while (1)
      {
        size_t v14 = (size_t)[v5 read:&__buf maxLength:1024];
        if ((v14 & 0x8000000000000000) != 0)
        {
          unsigned __int8 v20 = _PBLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            id v24 = [v5 streamError];
            *(_DWORD *)CC_SHA256_CTX buf = 136315394;
            uint64_t v36 = "NSProgress *_loadRemoteItemProvider(NSObject<UAPasteboardItemProviding> *__strong, void (^__strong)(NS"
                  "Data *__strong, PBSecurityScopedURLWrapper *__strong, NSError *__strong, void (^__strong)(void)))_block_invoke";
            __int16 v37 = 2112;
            id v38 = v24;
            _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%s: Stream error: %@", buf, 0x16u);
          }
          goto LABEL_21;
        }
        size_t v15 = v14;
        if (v14)
        {
          if (write(v12, &__buf, v14) == -1) {
            break;
          }
        }
        if ((objc_msgSend(v5, "hasBytesAvailable", v15) & 1) == 0) {
          goto LABEL_9;
        }
      }
      unsigned __int8 v20 = _PBLog();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        goto LABEL_21;
      }
      id v29 = __error();
      uint64_t v30 = strerror(*v29);
      *(_DWORD *)CC_SHA256_CTX buf = 136315394;
      uint64_t v36 = "NSProgress *_loadRemoteItemProvider(NSObject<UAPasteboardItemProviding> *__strong, void (^__strong)(NSData *"
            "__strong, PBSecurityScopedURLWrapper *__strong, NSError *__strong, void (^__strong)(void)))_block_invoke";
      __int16 v37 = 2080;
      id v38 = v30;
      uint64_t v23 = "%s: Cannot write to file. Error: %s";
    }
    else
    {
LABEL_9:
      if (lseek(v12, 0, 0) != -1)
      {
        [v5 close];
        id v16 = [objc_alloc((Class)PBSecurityScopedURLWrapper) initWithURLWithoutIssuingExtension:v13];
        id v32 = *(id *)(a1 + 32);
        id v13 = v13;
        id v17 = v16;
        PBDispatchAsyncCallback();

        goto LABEL_25;
      }
      unsigned __int8 v20 = _PBLog();
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        goto LABEL_21;
      }
      id v21 = __error();
      id v22 = strerror(*v21);
      *(_DWORD *)CC_SHA256_CTX buf = 136315394;
      uint64_t v36 = "NSProgress *_loadRemoteItemProvider(NSObject<UAPasteboardItemProviding> *__strong, void (^__strong)(NSData *"
            "__strong, PBSecurityScopedURLWrapper *__strong, NSError *__strong, void (^__strong)(void)))_block_invoke";
      __int16 v37 = 2080;
      id v38 = v22;
      uint64_t v23 = "%s: Cannot seek to beginning of file. Error: %s";
    }
    _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, v23, buf, 0x16u);
LABEL_21:

    [v5 close];
    close(v12);
    if (v13)
    {
      id v25 = +[NSFileManager defaultManager];
      [v25 removeItemAtURL:v13 error:0];
    }
LABEL_23:
    uint64_t v26 = *(void **)(a1 + 32);
    if (!v26)
    {
LABEL_26:

      goto LABEL_27;
    }
    id v31 = v26;
    PBDispatchAsyncCallback();
    id v17 = v31;
LABEL_25:

    goto LABEL_26;
  }
  uint64_t v18 = *(void **)(a1 + 32);
  if (v18)
  {
    id v34 = v18;
    id v33 = v7;
    PBDispatchAsyncCallback();

    id v10 = v34;
LABEL_27:
  }
}

uint64_t sub_100016784(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, 0, *(void *)(a1 + 32), 0);
}

void sub_1000167A4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100016844;
  void v3[3] = &unk_100030D58;
  uint64_t v2 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  (*(void (**)(uint64_t, void, uint64_t, void, void *))(v2 + 16))(v2, 0, v1, 0, v3);
}

void sub_100016844(uint64_t a1)
{
  id v2 = +[NSFileManager defaultManager];
  [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];
}

void sub_1000168A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  PBCannotLoadRemotePasteboardError();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, id, void))(v1 + 16))(v1, 0, 0, v2, 0);
}

void sub_100016B18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_100016B54(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _PBLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)CC_SHA256_CTX buf = 138412290;
    id v8 = v3;
    _os_log_fault_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "Failed to paste request authorization due to XPC error: %@", buf, 0xCu);
  }

  id v6 = *(id *)(a1 + 32);
  PBDispatchAsyncCallback();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained invalidate];
}

uint64_t sub_100016C84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100016C98(uint64_t a1)
{
  id v3 = *(id *)(a1 + 32);
  PBDispatchAsyncCallback();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "invalidate", _NSConcreteStackBlock, 3221225472, sub_100016D38, &unk_100030C28);
}

uint64_t sub_100016D38(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

id sub_100016EDC(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 UUIDString];
  id v5 = +[NSString stringWithFormat:@"%@-%@", v4, v3];

  id v6 = PBSHA1HashOfString();

  return v6;
}

void sub_100017094(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setItemQueue_isStoredOnServer:", 1);
  id v3 = objc_msgSend(*v2, "itemQueue_typeOrder");
  id v4 = [v3 array];

  objc_initWeak(&location, *v2);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v18 + 1) + 8 * (void)v7);
        id v9 = [*(id *)(a1 + 32) UUID];
        id v10 = sub_10001730C(v9, *(void **)(a1 + 40), v8);

        id v11 = objc_alloc((Class)PBItemRepresentation);
        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100017388;
        v15[3] = &unk_100031A68;
        objc_copyWeak(&v17, &location);
        v15[4] = v8;
        id v12 = v10;
        id v16 = v12;
        id v13 = objc_msgSend(v11, "initWithType:preferredRepresentation:v2_loader:", v8, 1, v15);
        objc_msgSend(*(id *)(a1 + 32), "itemQueue_setItemRepresentation:", v13);

        objc_destroyWeak(&v17);
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  objc_destroyWeak(&location);
}

void sub_1000172C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
}

id sub_10001730C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = sub_100016EDC(a1, a3);
  uint64_t v7 = [v5 URLByAppendingPathComponent:v6 isDirectory:0];

  return v7;
}

id sub_100017388(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = _PBLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [WeakRetained UUID];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(a1 + 40);
    *(_DWORD *)CC_SHA256_CTX buf = 134218754;
    id v38 = WeakRetained;
    __int16 v39 = 2112;
    id v40 = v6;
    __int16 v41 = 2112;
    uint64_t v42 = v7;
    __int16 v43 = 2112;
    id v44 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Loading item %p %@ type %@ from URL %@", buf, 0x2Au);
  }
  id v9 = [*(id *)(a1 + 40) URLByAppendingPathExtension:@"bookmark"];
  if (!v9
    || (+[NSFileManager defaultManager],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v9 path],
        id v11 = objc_claimAutoreleasedReturnValue(),
        unsigned int v12 = [v10 fileExistsAtPath:v11],
        v11,
        v10,
        !v12))
  {
    id v15 = [objc_alloc((Class)PBSecurityScopedURLWrapper) initWithURL:*(void *)(a1 + 40) readonly:1 extensionClass:@"com.apple.Pasteboard-readonly"];
    (*((void (**)(id, void, id, void, void, void))v3 + 2))(v3, 0, v15, 0, 0, 0);
    id v13 = 0;
    goto LABEL_24;
  }
  id v13 = objc_alloc_init((Class)NSProgress);
  id v36 = 0;
  size_t v14 = +[NSURL bookmarkDataWithContentsOfURL:v9 error:&v36];
  id v15 = v36;
  if (v15 || !v14)
  {
    uint64_t v23 = _PBLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v28 = [WeakRetained UUID];
      uint64_t v29 = *(void *)(a1 + 32);
      *(_DWORD *)CC_SHA256_CTX buf = 134218754;
      id v38 = WeakRetained;
      __int16 v39 = 2112;
      id v40 = v28;
      __int16 v41 = 2114;
      uint64_t v42 = v29;
      __int16 v43 = 2112;
      id v44 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to load bookmark for item %p %@ type %{public}@. Error: %@", buf, 0x2Au);
    }
  }
  else
  {
    char v35 = 0;
    id v16 = PBStorageRootURL();
    id v34 = 0;
    id v17 = +[NSURL URLByResolvingBookmarkData:v14 options:256 relativeToURL:v16 bookmarkDataIsStale:&v35 error:&v34];
    id v15 = v34;

    if (v35)
    {
      long long v18 = _PBLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = [WeakRetained UUID];
        uint64_t v31 = *(void *)(a1 + 32);
        *(_DWORD *)CC_SHA256_CTX buf = 134218498;
        id v38 = WeakRetained;
        __int16 v39 = 2112;
        id v40 = v30;
        __int16 v41 = 2114;
        uint64_t v42 = v31;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Item %p %@ type %{public}@ bookmark data is stale. Using it anyway.", buf, 0x20u);
      }
    }
    if (v17)
    {
      [v13 setTotalUnitCount:2];
      long long v19 = _PBLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        long long v20 = [WeakRetained UUID];
        uint64_t v21 = *(void *)(a1 + 32);
        *(_DWORD *)CC_SHA256_CTX buf = 134218498;
        id v38 = WeakRetained;
        __int16 v39 = 2112;
        id v40 = v20;
        __int16 v41 = 2114;
        uint64_t v42 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Item %p %@ type %{public}@ successfully resolved bookmark data.", buf, 0x20u);
      }
      objc_initWeak((id *)buf, v13);
      objc_copyWeak(&v33, (id *)buf);
      id v32 = v3;
      id v22 = PBCoordinatedRead();
      [v13 addChild:v22 withPendingUnitCount:2];

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);

      goto LABEL_23;
    }
    id v24 = _PBLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      id v25 = [WeakRetained UUID];
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)CC_SHA256_CTX buf = 134218754;
      id v38 = WeakRetained;
      __int16 v39 = 2112;
      id v40 = v25;
      __int16 v41 = 2112;
      uint64_t v42 = v26;
      __int16 v43 = 2112;
      id v44 = v15;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Item %p %@ type %@ could not resolved bookmark data to a URL. Error: %@", buf, 0x2Au);
    }
  }
  (*((void (**)(id, void, void, void, id, void))v3 + 2))(v3, 0, 0, 0, v15, 0);
LABEL_23:

LABEL_24:
  return v13;
}

void sub_100017904(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001792C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained setCompletedUnitCount:1];
  id v8 = v6;
  id v9 = v8;
  id v10 = 0;
  id v11 = 0;
  id v12 = v8;
  if (v5 && !v8)
  {
    id v13 = [*(id *)(a1 + 40) suggestedName];
    id v10 = PBCloneURLToTemporaryFolder();
    id v11 = 0;
    id v12 = 0;

    size_t v14 = _PBLog();
    id v15 = v14;
    if (v10)
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
LABEL_8:

        goto LABEL_9;
      }
      id v16 = *(void **)(a1 + 40);
      uint64_t v17 = [v16 UUID];
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)CC_SHA256_CTX buf = 134218498;
      id v32 = v16;
      __int16 v33 = 2112;
      uint64_t v34 = v17;
      long long v19 = (void *)v17;
      __int16 v35 = 2114;
      uint64_t v36 = v18;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Item %p %@ type %{public}@ successfully made a local copy of a bookmarked file.", buf, 0x20u);
    }
    else
    {
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_8;
      }
      id v24 = *(void **)(a1 + 40);
      uint64_t v25 = [v24 UUID];
      uint64_t v26 = *(void *)(a1 + 32);
      *(_DWORD *)CC_SHA256_CTX buf = 134218754;
      id v32 = v24;
      __int16 v33 = 2112;
      uint64_t v34 = v25;
      long long v19 = (void *)v25;
      __int16 v35 = 2114;
      uint64_t v36 = v26;
      __int16 v37 = 2114;
      id v38 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Item %p %@ type %{public}@ could not make a copy of a bookmarked file. Error: %{public}@", buf, 0x2Au);
    }

    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(WeakRetained, "setCompletedUnitCount:", objc_msgSend(WeakRetained, "totalUnitCount"));
  id v27 = v10;
  uint64_t v28 = v9;
  uint64_t v29 = v11;
  id v30 = *(id *)(a1 + 48);
  id v20 = v12;
  id v21 = v11;
  id v22 = v9;
  id v23 = v10;
  PBDispatchAsyncCallback();
}

void sub_100017C3C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    id v8 = [objc_alloc((Class)PBSecurityScopedURLWrapper) initWithURL:*(void *)(a1 + 32) readonly:1];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    id v2 = _PBLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v4 = *(void **)(a1 + 40);
      id v5 = [v4 UUID];
      uint64_t v6 = *(void *)(a1 + 48);
      uint64_t v7 = *(void *)(a1 + 56);
      *(_DWORD *)CC_SHA256_CTX buf = 134218754;
      id v10 = v4;
      __int16 v11 = 2112;
      id v12 = v5;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      __int16 v15 = 2114;
      uint64_t v16 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Item %p %@ type %{public}@ could not coordinate reading bookmarked file. Error: %{public}@", buf, 0x2Au);
    }
    id v3 = +[NSFileManager defaultManager];
    [v3 removeItemAtURL:*(void *)(a1 + 64) error:0];

    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
}

id sub_100018448(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveRepresentationsToBaseURL:*(void *)(a1 + 40) types:*(void *)(a1 + 48) fileProtectionType:*(void *)(a1 + 56) allowedToCopyOnPaste:*(unsigned __int8 *)(a1 + 72) completionBlock:*(void *)(a1 + 64)];
}

void sub_100018460(id *a1)
{
  id v2 = objc_msgSend(a1[4], "subarrayWithRange:", 1, (char *)objc_msgSend(a1[4], "count") - 1);
  id v4 = a1[6];
  id v5 = a1[7];
  id v6 = a1[8];
  id v3 = v2;
  PBDispatchAsyncCallback();
}

id sub_100018554(uint64_t a1)
{
  return [*(id *)(a1 + 32) _saveRepresentationsToBaseURL:*(void *)(a1 + 40) types:*(void *)(a1 + 48) fileProtectionType:*(void *)(a1 + 56) allowedToCopyOnPaste:*(unsigned __int8 *)(a1 + 72) completionBlock:*(void *)(a1 + 64)];
}

void sub_10001856C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    if ([v9 isEqualToString:NSFileProtectionCompleteUntilFirstUserAuthentication])
    {
      uint64_t v10 = 0x40000000;
    }
    else if ([v9 isEqualToString:NSFileProtectionNone])
    {
      uint64_t v10 = 0x10000000;
    }
    else
    {
      uint64_t v10 = 0x20000000;
    }

    id v21 = 0;
    [v5 writeToURL:v8 options:v10 error:&v21];
    id v7 = v21;
  }
  __int16 v11 = _PBLog();
  id v12 = v11;
  if (v7)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = *(void **)(a1 + 48);
      uint64_t v18 = *(void *)(a1 + 56);
      *(_DWORD *)CC_SHA256_CTX buf = 134218498;
      id v23 = v17;
      __int16 v24 = 2112;
      uint64_t v25 = v18;
      __int16 v26 = 2112;
      id v27 = v7;
      _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "Could not save item %p representation type %@. Error: %@", buf, 0x20u);
    }

    __int16 v13 = *(void **)(a1 + 64);
    if (v13)
    {
      id v20 = v13;
      id v19 = v7;
      PBDispatchAsyncCallback();
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [*(id *)(a1 + 48) UUID];
      uint64_t v15 = *(void *)(a1 + 56);
      uint64_t v16 = *(void **)(a1 + 32);
      *(_DWORD *)CC_SHA256_CTX buf = 138412802;
      id v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Saved item %@ type %@ to %@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

uint64_t sub_1000187D4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1000187E8(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = v8;
  id v10 = v8;
  if (v7)
  {
    id v10 = v8;
    if (!v8)
    {
      if (!a3 || !*(unsigned char *)(a1 + 80))
      {
        uint64_t v16 = +[NSFileManager defaultManager];
        uint64_t v17 = *(void *)(a1 + 40);
        id v23 = 0;
        [v16 moveItemAtURL:v7 toURL:v17 error:&v23];
        id v10 = v23;

        __int16 v11 = _PBLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v19 = *(void **)(a1 + 48);
          uint64_t v18 = *(void **)(a1 + 56);
          uint64_t v20 = *(void *)(a1 + 40);
          *(_DWORD *)CC_SHA256_CTX buf = 134218498;
          id v27 = v19;
          __int16 v28 = 2114;
          id v29 = v18;
          __int16 v30 = 2112;
          uint64_t v31 = v20;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Saved file for item %p representation type %{public}@ to %@", buf, 0x20u);
        }
        goto LABEL_13;
      }
      id v25 = 0;
      __int16 v11 = [v7 bookmarkDataWithOptions:1024 includingResourceValuesForKeys:0 relativeToURL:0 error:&v25];
      id v10 = v25;
      if (!v10 && v11)
      {
        uint64_t v12 = *(void *)(a1 + 32);
        id v24 = 0;
        unsigned int v13 = +[NSURL writeBookmarkData:v11 toURL:v12 options:256 error:&v24];
        id v10 = v24;
        uint64_t v14 = _PBLog();
        uint64_t v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)CC_SHA256_CTX buf = 138412290;
            id v27 = v7;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Successfully wrote bookmark data for %@", buf, 0xCu);
          }

LABEL_13:
          (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
          goto LABEL_20;
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CC_SHA256_CTX buf = 138412546;
          id v27 = v7;
          __int16 v28 = 2114;
          id v29 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to write bookmark data for %@. Error: %{public}@", buf, 0x16u);
        }
      }
    }
  }
  id v21 = *(void **)(a1 + 72);
  if (v21)
  {
    id v22 = v21;
    id v10 = v10;
    PBDispatchAsyncCallback();
  }
LABEL_20:
}

uint64_t sub_100018AE4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100018AF8(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    id v8 = +[NSFileManager defaultManager];
    uint64_t v9 = a1[4];
    id v21 = 0;
    [v8 moveItemAtURL:v5 toURL:v9 error:&v21];
    id v7 = v21;
  }
  id v10 = _PBLog();
  __int16 v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      uint64_t v17 = a1[5];
      uint64_t v16 = a1[6];
      uint64_t v18 = a1[4];
      *(_DWORD *)CC_SHA256_CTX buf = 134218754;
      uint64_t v23 = v17;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      __int16 v26 = 2112;
      uint64_t v27 = v18;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Could not copy file for item %p representation type %@ to %@. Error: %@", buf, 0x2Au);
    }

    uint64_t v12 = (void *)a1[7];
    if (v12)
    {
      id v20 = v12;
      id v19 = v7;
      PBDispatchAsyncCallback();
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = a1[5];
      uint64_t v13 = a1[6];
      uint64_t v15 = a1[4];
      *(_DWORD *)CC_SHA256_CTX buf = 134218498;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      uint64_t v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Saved file for item %p representation type %@ to %@", buf, 0x20u);
    }

    (*(void (**)(void))(a1[8] + 16))();
  }
}

uint64_t sub_100018D14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100018D28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100018EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018F08(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100018F18(uint64_t a1)
{
}

void sub_100018F20(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "itemQueue_typeOrder");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 array];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

uint64_t sub_100018F88(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (!v5) {
    [*(id *)(a1 + 32) setStorageBaseURL:*(void *)(a1 + 40)];
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  }
  return _objc_release_x1();
}

uint64_t sub_10001936C(const void *a1)
{
  return PBDispatchAsyncCallback();
}

id sub_100019570()
{
  if (qword_100039618 != -1) {
    dispatch_once(&qword_100039618, &stru_100031B50);
  }
  uint64_t v0 = (void *)qword_100039610;
  return v0;
}

void sub_1000195C4(id a1)
{
  qword_100039610 = +[NSBundle bundleForClass:objc_opt_class()];
  _objc_release_x1();
}

void sub_100019620(uint64_t a1)
{
  objc_getAssociatedObject(*(id *)(a1 + 32), &unk_100039608);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  CFRelease(*(CFTypeRef *)(a1 + 32));
  [v2 authorizationDidCompleteWithPasteAllowed:*(void *)(a1 + 40) == 1];
}

void sub_100019E00(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = _PBLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Failed to announce paste due to XPC error: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100019F6C(id a1, NSError *a2)
{
  id v2 = a2;
  uint64_t v3 = _PBLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Failed to announce deny due to XPC error: %@", (uint8_t *)&v4, 0xCu);
  }
}

id sub_10001A158(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

id sub_10001A2B0()
{
  if (qword_100039628 != -1) {
    dispatch_once(&qword_100039628, &stru_100031C10);
  }
  uint64_t v0 = (void *)qword_100039620;
  return v0;
}

void sub_10001A31C(id a1)
{
  qword_100039620 = +[NSBundle bundleForClass:objc_opt_class()];
  _objc_release_x1();
}

void sub_10001A508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A7B0(_Unwind_Exception *a1)
{
}

void sub_10001A9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10001AB44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Block_object_dispose(&a15, 8);

  _Block_object_dispose((const void *)(v21 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001AB74(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001AB84(uint64_t a1)
{
}

uint64_t sub_10001AB8C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  int IsDomainTopLevel = _CFHostIsDomainTopLevel();
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  if (IsDomainTopLevel)
  {
    *(unsigned char *)(v10 + 24) = 1;
  }
  else if (*(unsigned char *)(v10 + 24))
  {
    *a4 = 1;
  }
  return _objc_release_x1();
}

void sub_10001AC1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001ACBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001AD90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001ADE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001AE2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001AE3C(void *a1)
{
  id v1 = a1;
  if (qword_100039650 != -1) {
    dispatch_once(&qword_100039650, &stru_100031C58);
  }
  id v2 = (id *)pthread_getspecific(qword_100039648);
  uint64_t v3 = v2;
  if (!v2) {
    operator new();
  }
  if (![*v2 isEqualToString:v1])
  {
    id v5 = [v1 copy];
    id v6 = *v3;
    *uint64_t v3 = v5;

    id v37 = v1;
    uint64_t v7 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    id v8 = [v37 stringByTrimmingCharactersInSet:v7];
    if ([v8 length])
    {
      objc_msgSend(v8, "safari_stringByRemovingUnnecessaryCharactersFromUserTypedURLString");
      id v9 = (id)objc_claimAutoreleasedReturnValue();

      if ([v9 length])
      {
        id v10 = [v9 rangeOfCharacterFromSet:v7];
        id v11 = [v9 rangeOfString:@"/"];
        if (v10 == (id)0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_10;
        }
        uint64_t v17 = [v9 substringToIndex:v10];
        uint64_t v18 = sub_10001B6B0(v17);
        if (![v18 length]) {
          goto LABEL_25;
        }
        id v19 = v18;
        if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100039660, memory_order_acquire) & 1) == 0
          && __cxa_guard_acquire(&qword_100039660))
        {
          qword_100039658 = (uint64_t)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"data", @"file", @"ftp", @"ftps", @"http", @"https", @"javascript", 0);
          __cxa_guard_release(&qword_100039660);
        }
        if (![v19 length])
        {

          goto LABEL_59;
        }
        unsigned __int8 v20 = [(id)qword_100039658 containsObject:v19];

        if (v20)
        {
LABEL_25:
          uint64_t v21 = [v18 length];
          if (!v21 || v21 != (char *)[v17 length] - 1)
          {
            if (objc_msgSend(v17, "_webkit_looksLikeAbsoluteURL"))
            {
              uint64_t v4 = 1;
LABEL_60:

LABEL_73:
              goto LABEL_74;
            }
            if ([v17 rangeOfString:@"?"] != (id)0x7FFFFFFFFFFFFFFFLL)
            {

LABEL_10:
              if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
              {
LABEL_33:
                id v9 = v9;
                if ([v9 length]
                  && (__int16 v24 = (char *)[v9 length] - 1,
                      [v9 characterAtIndex:v24] == 58))
                {
                  uint64_t v25 = sub_10001BAD4(v9);

                  if ((char *)v25 == v24) {
                    goto LABEL_44;
                  }
                }
                else
                {
                }
                if (objc_msgSend(v9, "_webkit_looksLikeAbsoluteURL"))
                {
                  __int16 v26 = sub_10001B6B0(v9);
                  uint64_t v17 = v26;
                  if (v11 != (id)0x7FFFFFFFFFFFFFFFLL)
                  {
                    id v30 = v26;
                    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100039670, memory_order_acquire) & 1) == 0
                      && __cxa_guard_acquire(&qword_100039670))
                    {
                      qword_100039668 = (uint64_t)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"site", @"link", @"related", @"cache", 0);
                      __cxa_guard_release(&qword_100039670);
                    }
                    if ([v30 length])
                    {
                      uint64_t v31 = (void *)qword_100039668;
                      id v32 = [v30 lowercaseString];
                      LODWORD(v31) = [v31 containsObject:v32];

                      uint64_t v4 = v31 ^ 1;
                    }
                    else
                    {

                      uint64_t v4 = 1;
                    }
                    goto LABEL_73;
                  }
                  if (([v9 isEqualToString:@"about:blank"] & 1) == 0)
                  {
                    if (sub_10001B728(v17)) {
                      uint64_t v4 = 1;
                    }
                    else {
                      uint64_t v4 = 3;
                    }
                    goto LABEL_73;
                  }
                  goto LABEL_70;
                }
LABEL_44:
                id v27 = [v9 rangeOfString:@"."];
                id v28 = v27;
                if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  if (v27 && v27 != (id)0x7FFFFFFFFFFFFFFFLL && (uint64_t v38 = 0, (sub_10001B860(v9, &v38) & 1) != 0))
                  {
                    uint64_t v4 = v38;
                  }
                  else if ([v9 caseInsensitiveCompare:@"localhost"])
                  {
                    uint64_t v4 = 3;
                  }
                  else
                  {
                    uint64_t v4 = 2;
                  }
                  goto LABEL_74;
                }
                id v9 = v9;
                if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100039690, memory_order_acquire) & 1) == 0
                  && __cxa_guard_acquire(&qword_100039690))
                {
                  qword_100039688 = sub_10001BB38();
                  __cxa_guard_release(&qword_100039690);
                }
                id v29 = [v9 rangeOfCharacterFromSet:qword_100039688];

                if (v29 == (id)0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v4 = 3;
                  goto LABEL_74;
                }
                uint64_t v17 = 0;
                if (v28)
                {
                  if (v28 != (id)0x7FFFFFFFFFFFFFFFLL)
                  {
                    uint64_t v17 = [v9 substringToIndex:v11];
                    uint64_t v38 = 0;
                    if (sub_10001B860(v17, &v38))
                    {
                      uint64_t v4 = v38;
                      goto LABEL_73;
                    }
                  }
                }
                __int16 v33 = [v9 rangeOfString:@"/" options:4];
                if (v33 != (char *)[v9 length] - 1)
                {
                  uint64_t v34 = [v9 rangeOfString:@"#" options:4];
                  if (v34 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL || v34 <= v33)
                  {
                    id v35 = [v9 rangeOfString:@"?" options:4];
                    if (v35 == (id)0x7FFFFFFFFFFFFFFFLL || v35 <= v11)
                    {
                      if ([v9 hasPrefix:@"localhost/"]) {
                        uint64_t v4 = 2;
                      }
                      else {
                        uint64_t v4 = 3;
                      }
                      goto LABEL_73;
                    }
                  }
                }
LABEL_70:
                uint64_t v4 = 2;
                goto LABEL_73;
              }
              id v12 = v9;
              if ([v12 length])
              {
                uint64_t v13 = (char *)[v12 rangeOfString:@":" options:4];

                if (v13 != (char *)0x7FFFFFFFFFFFFFFFLL)
                {
                  uint64_t v14 = (char *)[v12 length] - 1;
                  if (v13 != v14)
                  {
                    uint64_t v15 = v13 + 1;
                    while (v15 <= v14)
                    {
                      unsigned int v16 = [v12 characterAtIndex:v15];
                      if (v16 <= 0xFF)
                      {
                        ++v15;
                        if ((_DefaultRuneLocale.__runetype[v16] & 0x400) != 0) {
                          continue;
                        }
                      }
                      goto LABEL_31;
                    }
                    id v22 = [v12 substringToIndex:v13];
                    goto LABEL_32;
                  }
                }
              }
              else
              {
              }
LABEL_31:
              id v22 = v12;
LABEL_32:
              id v23 = v22;

              id v9 = v23;
              goto LABEL_33;
            }
          }
        }
LABEL_59:
        uint64_t v4 = 0;
        goto LABEL_60;
      }
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = 4;
      id v9 = v8;
    }
LABEL_74:

    v3[1] = (id)v4;
    goto LABEL_75;
  }
  uint64_t v4 = (uint64_t)v3[1];
LABEL_75:

  return v4;
}

void sub_10001B520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  __cxa_guard_abort(&qword_100039690);

  _Unwind_Resume(a1);
}

void sub_10001B640(id a1)
{
}

id *sub_10001B65C(id *result)
{
  if (result)
  {

    operator delete();
  }
  return result;
}

id sub_10001B6B0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_10001BAD4(v1);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = [v1 substringToIndex:v2];
  }

  return v3;
}

void sub_10001B718(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001B728(void *a1)
{
  id v1 = a1;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100039680, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100039680))
  {
    qword_100039678 = (uint64_t)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"data", @"facetime", @"gamecenter", @"irc", @"javascript", @"mailto", @"man", @"message", @"radar", @"spotify", @"tel", 0);
    __cxa_guard_release(&qword_100039680);
  }
  if ([v1 length]) {
    id v2 = [(id)qword_100039678 containsObject:v1];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

void sub_10001B83C(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_100039680);

  _Unwind_Resume(a1);
}

uint64_t sub_10001B860(void *a1, void *a2)
{
  id v3 = a1;
  if ([v3 length])
  {
    uint64_t v4 = [v3 lowercaseString];
    id v5 = objc_msgSend(v4, "safari_possibleTopLevelDomainCorrectionForUserTypedString");
    if ([v5 length])
    {
      id v6 = v5;

      uint64_t v4 = v6;
    }
    uint64_t v7 = objc_msgSend(v4, "safari_highLevelDomainFromHost");
    if ([v7 length])
    {

LABEL_6:
      *a2 = 2 * ([v4 rangeOfString:@"@"] == (id)0x7FFFFFFFFFFFFFFFLL);
      uint64_t v8 = 1;
LABEL_14:

      goto LABEL_15;
    }
    id v9 = v4;
    if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000396A0, memory_order_acquire) & 1) == 0
      && __cxa_guard_acquire(&qword_1000396A0))
    {
      qword_100039698 = (uint64_t)objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"private", @"box", @"local", 0);
      __cxa_guard_release(&qword_1000396A0);
    }
    if (![v9 length]
      || (id v10 = (char *)[v9 rangeOfString:@"." options:4], v10 == (char *)0x7FFFFFFFFFFFFFFFLL)
      || v10 + 1 == [v9 length])
    {
    }
    else
    {
      uint64_t v12 = qword_100039698;
      uint64_t v13 = objc_msgSend(v9, "substringFromIndex:");
      uint64_t v14 = [v13 lowercaseString];
      LOBYTE(v12) = [(id)v12 containsObject:v14];

      if (v12) {
        goto LABEL_6;
      }
    }
    uint64_t v8 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = 0;
LABEL_15:

  return v8;
}

void sub_10001BA58(_Unwind_Exception *a1)
{
  __cxa_guard_abort(&qword_1000396A0);

  _Unwind_Resume(a1);
}

uint64_t sub_10001BAD4(void *a1)
{
  id v1 = a1;
  if ([v1 length]) {
    uint64_t v2 = (uint64_t)[v1 rangeOfString:@":"];
  }
  else {
    uint64_t v2 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v2;
}

void sub_10001BB24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001BB38()
{
  id v0 = objc_alloc_init((Class)NSMutableCharacterSet);
  id v1 = +[NSCharacterSet decimalDigitCharacterSet];
  [v0 formUnionWithCharacterSet:v1];

  uint64_t v2 = +[NSCharacterSet punctuationCharacterSet];
  [v0 formUnionWithCharacterSet:v2];

  id v3 = +[NSCharacterSet symbolCharacterSet];
  [v0 formUnionWithCharacterSet:v3];

  uint64_t v4 = [v0 invertedSet];

  return v4;
}

void sub_10001BBF8(_Unwind_Exception *a1)
{
  id v3 = v2;

  _Unwind_Resume(a1);
}

void sub_10001C83C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C874(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001C884(uint64_t a1)
{
}

void sub_10001C88C(void *a1, void *a2, void *a3, char a4, uint64_t a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a6;
  if ([v12 count])
  {
    uint64_t v15 = [v12 firstObject];
    uint64_t v41 = 0;
    uint64_t v42 = &v41;
    uint64_t v43 = 0x2020000000;
    char v44 = 0;
    unsigned int v16 = PBItemQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001D030;
    block[3] = &unk_100030D30;
    id v40 = &v41;
    id v17 = v15;
    id v39 = v17;
    dispatch_sync(v16, block);

    if (!*((unsigned char *)v42 + 24) || (a4 & 1) != 0)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10001D07C;
      v21[3] = &unk_100031D28;
      id v25 = v14;
      id v22 = v12;
      id v23 = v11;
      id v24 = v13;
      char v26 = a4;
      char v27 = a5;
      [v17 saveRepresentationsToStorageBaseURL:v23 fileProtectionType:v24 allowedToCopyOnPaste:a5 completionBlock:v21];

      id v19 = v25;
    }
    else
    {
      uint64_t v18 = objc_msgSend(v12, "subarrayWithRange:", 1, (char *)objc_msgSend(v12, "count") - 1);
      id v28 = _NSConcreteStackBlock;
      uint64_t v29 = 3221225472;
      id v30 = sub_10001D064;
      uint64_t v31 = &unk_100031D00;
      id v32 = v11;
      id v19 = v18;
      id v33 = v19;
      id v34 = v13;
      char v36 = a4;
      char v37 = a5;
      id v35 = v14;
      PBDispatchAsyncCallback();
    }
    _Block_object_dispose(&v41, 8);
    goto LABEL_9;
  }
  if (v14)
  {
    id v20 = v14;
    PBDispatchAsyncCallback();
    id v17 = v20;
LABEL_9:
  }
}

void sub_10001CB9C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10001CBB8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10001CE60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001CE78(uint64_t a1)
{
  uint64_t v2 = objc_getAssociatedObject(*(id *)(a1 + 32), &unk_1000396A8);
  if (v2)
  {
    id v3 = v2;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 authorizationDecisionForAuditTokenInfo:*(void *)(a1 + 40) timestamp:*(void *)(a1 + 56)];
    uint64_t v2 = v3;
  }
}

void sub_10001CFA0(uint64_t a1)
{
  uint64_t v2 = objc_getAssociatedObject(*(id *)(a1 + 32), &unk_1000396A8);
  if (!v2)
  {
    id v3 = objc_alloc_init(PBUserAuthorizationLedger);
    objc_setAssociatedObject(*(id *)(a1 + 32), &unk_1000396A8, v3, (void *)1);
    uint64_t v2 = v3;
  }
  id v4 = v2;
  [v2 recordUserAuthorizationDecision:*(unsigned __int8 *)(a1 + 48) auditTokenInfo:*(void *)(a1 + 40)];
}

id sub_10001D030(uint64_t a1)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "itemQueue_isStoredOnServer");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

uint64_t sub_10001D064(uint64_t a1)
{
  return sub_10001C88C(*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(void *)(a1 + 56));
}

void sub_10001D07C(id *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v6 = objc_msgSend(a1[4], "subarrayWithRange:", 1, (char *)objc_msgSend(a1[4], "count") - 1);
    id v7 = a1[5];
    id v8 = a1[6];
    id v9 = a1[7];
    id v5 = v6;
    PBDispatchAsyncCallback();

    goto LABEL_5;
  }
  id v4 = a1[7];
  if (v4)
  {
    id v11 = v4;
    id v10 = v3;
    PBDispatchAsyncCallback();

    id v5 = v11;
LABEL_5:
  }
}

uint64_t sub_10001D1F8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10001D20C(uint64_t a1)
{
  return sub_10001C88C(*(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65), *(void *)(a1 + 56));
}

uint64_t sub_10001D224(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

double sub_10001E778(const __CTFont *a1, double a2)
{
  off_1000394D8();
  id v5 = v4;
  double Leading = CTFontGetLeading(a1);
  double v7 = Leading + CTFontGetAscent(a1);
  return (v7 + CTFontGetDescent(a1)) * a2 / *v5;
}

PBCalloutBarPasteButtonDrawing *sub_10001F598(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PBCalloutBarPasteButtonDrawing alloc] initWithStyle:*(void *)(a1 + 32) tag:v3];

  return v4;
}

PBSystemInputAssistantPasteButtonDrawing *sub_10001F600(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PBSystemInputAssistantPasteButtonDrawing alloc] initWithStyle:*(void *)(a1 + 32) tag:v3];

  return v4;
}

PBUndoInteractionHUDIconPasteButtonDrawing *sub_10001F668(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PBUndoInteractionHUDIconPasteButtonDrawing alloc] initWithStyle:*(void *)(a1 + 32) tag:v3];

  return v4;
}

PBUndoInteractionHUDTextPasteButtonDrawing *sub_10001F6D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PBUndoInteractionHUDTextPasteButtonDrawing alloc] initWithStyle:*(void *)(a1 + 32) tag:v3];

  return v4;
}

id sub_10001F738(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  id v4 = +[PBContextMenuPasteButtonDrawing drawingWithStyle:tag:size:](PBContextMenuPasteButtonDrawing, "drawingWithStyle:tag:size:", v2, v3, [v3 layoutSize]);

  return v4;
}

PBEditMenuPasteButtonDrawing *sub_10001F7A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[PBEditMenuPasteButtonDrawing alloc] initWithStyle:*(void *)(a1 + 32) tag:v3];

  return v4;
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BKSHIDServicesSetAuthenticatedKeyCommands()
{
  return _BKSHIDServicesSetAuthenticatedKeyCommands();
}

uint64_t BSVersionedPIDForAuditToken()
{
  return _BSVersionedPIDForAuditToken();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return _CFBundleGetValueForInfoDictionaryKey(bundle, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

SInt32 CFUserNotificationDisplayNotice(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle)
{
  return _CFUserNotificationDisplayNotice(timeout, flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle);
}

CGColorRef CGColorGetConstantColor(CFStringRef colorName)
{
  return _CGColorGetConstantColor(colorName);
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

uint64_t CGFontCacheGetLocalCache()
{
  return _CGFontCacheGetLocalCache();
}

uint64_t CGFontCacheReset()
{
  return _CGFontCacheReset();
}

uint64_t CPCopyBundleIdentifierAndTeamFromApplicationIdentifier()
{
  return _CPCopyBundleIdentifierAndTeamFromApplicationIdentifier();
}

uint64_t CPCopyBundleIdentifierAndTeamFromSecTaskRef()
{
  return _CPCopyBundleIdentifierAndTeamFromSecTaskRef();
}

uint64_t CPOpenTemporaryFile()
{
  return _CPOpenTemporaryFile();
}

CTFontRef CTFontCreateUIFontForLanguage(CTFontUIFontType uiType, CGFloat size, CFStringRef language)
{
  return _CTFontCreateUIFontForLanguage(uiType, size, language);
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return _CTFontCreateWithFontDescriptor(descriptor, size, matrix);
}

uint64_t CTFontDescriptorCreateWithTextStyleAndAttributes()
{
  return _CTFontDescriptorCreateWithTextStyleAndAttributes();
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  return _CTFontGetAscent(font);
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  return _CTFontGetDescent(font);
}

CGFloat CTFontGetLeading(CTFontRef font)
{
  return _CTFontGetLeading(font);
}

uint64_t CTFontRemoveFromCaches()
{
  return _CTFontRemoveFromCaches();
}

CTParagraphStyleRef CTParagraphStyleCreate(const CTParagraphStyleSetting *settings, size_t settingCount)
{
  return _CTParagraphStyleCreate(settings, settingCount);
}

uint64_t CacheDeleteRegisterCallback()
{
  return _CacheDeleteRegisterCallback();
}

uint64_t DDResultGetCategory()
{
  return _DDResultGetCategory();
}

uint64_t DDResultHasType()
{
  return _DDResultHasType();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PBAssertIsOnCallbackQueue()
{
  return _PBAssertIsOnCallbackQueue();
}

uint64_t PBCannotCreateTemporaryFile()
{
  return _PBCannotCreateTemporaryFile();
}

uint64_t PBCannotLoadRemotePasteboardError()
{
  return _PBCannotLoadRemotePasteboardError();
}

uint64_t PBCannotLoadRepresentationError()
{
  return _PBCannotLoadRepresentationError();
}

uint64_t PBCannotSerializePasteboardError()
{
  return _PBCannotSerializePasteboardError();
}

uint64_t PBCannotUnserializePasteboardError()
{
  return _PBCannotUnserializePasteboardError();
}

uint64_t PBCloneURLToTemporaryFolder()
{
  return _PBCloneURLToTemporaryFolder();
}

uint64_t PBCoordinatedRead()
{
  return _PBCoordinatedRead();
}

uint64_t PBDispatchAsyncCallback()
{
  return _PBDispatchAsyncCallback();
}

uint64_t PBErrorMake()
{
  return _PBErrorMake();
}

uint64_t PBFilenameWithProperExtension()
{
  return _PBFilenameWithProperExtension();
}

uint64_t PBIndexOutOfRangeError()
{
  return _PBIndexOutOfRangeError();
}

uint64_t PBIsPasteboardNameAllowed()
{
  return _PBIsPasteboardNameAllowed();
}

uint64_t PBIsPasteboardNameGeneralPasteboard()
{
  return _PBIsPasteboardNameGeneralPasteboard();
}

uint64_t PBItemQueue()
{
  return _PBItemQueue();
}

uint64_t PBNewClientToServerXPCInterface()
{
  return _PBNewClientToServerXPCInterface();
}

uint64_t PBNotAuthorizedError()
{
  return _PBNotAuthorizedError();
}

uint64_t PBOldPasteboardStorageRootURL()
{
  return _PBOldPasteboardStorageRootURL();
}

uint64_t PBPasteboardNameInvalidError()
{
  return _PBPasteboardNameInvalidError();
}

uint64_t PBPasteboardNameNotAvailableError()
{
  return _PBPasteboardNameNotAvailableError();
}

uint64_t PBPasteboardNotAvailableError()
{
  return _PBPasteboardNotAvailableError();
}

uint64_t PBPasteboardPersistenceName()
{
  return _PBPasteboardPersistenceName();
}

uint64_t PBPreferencesBoolValue()
{
  return _PBPreferencesBoolValue();
}

uint64_t PBPreferencesDoubleValue()
{
  return _PBPreferencesDoubleValue();
}

uint64_t PBSHA1HashOfString()
{
  return _PBSHA1HashOfString();
}

uint64_t PBSchemaFileContentsWithVersion()
{
  return _PBSchemaFileContentsWithVersion();
}

uint64_t PBStorageRootURL()
{
  return _PBStorageRootURL();
}

uint64_t PBTemporaryFileName()
{
  return _PBTemporaryFileName();
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return _SecTaskCopyValuesForEntitlements(task, entitlements, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t UISCalloutBarFontSize()
{
  return _UISCalloutBarFontSize();
}

uint64_t _AXSInvertColorsEnabled()
{
  return __AXSInvertColorsEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return __CFBundleCopyBundleURLForExecutableURL();
}

uint64_t _CFBundleCreateUnique()
{
  return __CFBundleCreateUnique();
}

uint64_t _CFHostIsDomainTopLevel()
{
  return __CFHostIsDomainTopLevel();
}

uint64_t _PBDefaultMaxGeneralPasteboardAgeForLockState()
{
  return __PBDefaultMaxGeneralPasteboardAgeForLockState();
}

uint64_t _PBLog()
{
  return __PBLog();
}

uint64_t _PBStatLogPasteAge()
{
  return __PBStatLogPasteAge();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return _audit_token_to_pid(atoken);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath_audittoken(audittoken, buffer, buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return _pthread_getspecific(a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return _pthread_key_create(a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return _pthread_setspecific(a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return _tcc_authorization_record_get_authorization_right();
}

uint64_t tcc_authorization_record_get_service()
{
  return _tcc_authorization_record_get_service();
}

uint64_t tcc_credential_create_for_process_with_audit_token()
{
  return _tcc_credential_create_for_process_with_audit_token();
}

uint64_t tcc_message_options_create()
{
  return _tcc_message_options_create();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return _tcc_message_options_set_reply_handler_policy();
}

uint64_t tcc_message_options_set_request_prompt_policy()
{
  return _tcc_message_options_set_request_prompt_policy();
}

uint64_t tcc_server_create()
{
  return _tcc_server_create();
}

uint64_t tcc_server_message_get_authorization_records_by_identity()
{
  return _tcc_server_message_get_authorization_records_by_identity();
}

uint64_t tcc_server_message_get_identity_for_credential()
{
  return _tcc_server_message_get_identity_for_credential();
}

uint64_t tcc_server_message_set_authorization_value()
{
  return _tcc_server_message_set_authorization_value();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return _tcc_service_singleton_for_CF_name();
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

id objc_msgSend_SDKVersion(void *a1, const char *a2, ...)
{
  return [a1 SDKVersion];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__clearRemotePasteboard(void *a1, const char *a2, ...)
{
  return [a1 _clearRemotePasteboard];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__keyCommandSpecification(void *a1, const char *a2, ...)
{
  return [a1 _keyCommandSpecification];
}

id objc_msgSend_accessibilityButtonShapes(void *a1, const char *a2, ...)
{
  return [a1 accessibilityButtonShapes];
}

id objc_msgSend_activeAnnouncers(void *a1, const char *a2, ...)
{
  return [a1 activeAnnouncers];
}

id objc_msgSend_alignmentRect(void *a1, const char *a2, ...)
{
  return [a1 alignmentRect];
}

id objc_msgSend_allVariants(void *a1, const char *a2, ...)
{
  return [a1 allVariants];
}

id objc_msgSend_allowedClassesForSecureCoding(void *a1, const char *a2, ...)
{
  return [a1 allowedClassesForSecureCoding];
}

id objc_msgSend_announceDeniedPaste(void *a1, const char *a2, ...)
{
  return [a1 announceDeniedPaste];
}

id objc_msgSend_announcePasteDenied(void *a1, const char *a2, ...)
{
  return [a1 announcePasteDenied];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_authorizationRecords(void *a1, const char *a2, ...)
{
  return [a1 authorizationRecords];
}

id objc_msgSend_authorizationReplyBlocks(void *a1, const char *a2, ...)
{
  return [a1 authorizationReplyBlocks];
}

id objc_msgSend_availableTypes(void *a1, const char *a2, ...)
{
  return [a1 availableTypes];
}

id objc_msgSend_backgroundAverage(void *a1, const char *a2, ...)
{
  return [a1 backgroundAverage];
}

id objc_msgSend_backgroundAverageContrastThreshold(void *a1, const char *a2, ...)
{
  return [a1 backgroundAverageContrastThreshold];
}

id objc_msgSend_backgroundStandardDeviation(void *a1, const char *a2, ...)
{
  return [a1 backgroundStandardDeviation];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_changeCount(void *a1, const char *a2, ...)
{
  return [a1 changeCount];
}

id objc_msgSend_clientToServerConnection(void *a1, const char *a2, ...)
{
  return [a1 clientToServerConnection];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return [a1 containingBundleRecord];
}

id objc_msgSend_contentOrigin(void *a1, const char *a2, ...)
{
  return [a1 contentOrigin];
}

id objc_msgSend_contentScaleLevel(void *a1, const char *a2, ...)
{
  return [a1 contentScaleLevel];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_coreResult(void *a1, const char *a2, ...)
{
  return [a1 coreResult];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_cumulativeContentsTransform(void *a1, const char *a2, ...)
{
  return [a1 cumulativeContentsTransform];
}

id objc_msgSend_cumulativeLayerTransform(void *a1, const char *a2, ...)
{
  return [a1 cumulativeLayerTransform];
}

id objc_msgSend_cumulativeOpacity(void *a1, const char *a2, ...)
{
  return [a1 cumulativeOpacity];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentRemoteDeviceName(void *a1, const char *a2, ...)
{
  return [a1 currentRemoteDeviceName];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 decimalDigitCharacterSet];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_detectedOcclusion(void *a1, const char *a2, ...)
{
  return [a1 detectedOcclusion];
}

id objc_msgSend_detectionAbsent(void *a1, const char *a2, ...)
{
  return [a1 detectionAbsent];
}

id objc_msgSend_detectionPresent(void *a1, const char *a2, ...)
{
  return [a1 detectionPresent];
}

id objc_msgSend_deviceIdentifierForVendor(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifierForVendor];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_directoryName(void *a1, const char *a2, ...)
{
  return [a1 directoryName];
}

id objc_msgSend_displayMode(void *a1, const char *a2, ...)
{
  return [a1 displayMode];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_drawingSize(void *a1, const char *a2, ...)
{
  return [a1 drawingSize];
}

id objc_msgSend_effectiveBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveBundleIdentifier];
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return [a1 endowmentNamespaces];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 expirationDate];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getFileName(void *a1, const char *a2, ...)
{
  return [a1 getFileName];
}

id objc_msgSend_glyph(void *a1, const char *a2, ...)
{
  return [a1 glyph];
}

id objc_msgSend_groupingSeparator(void *a1, const char *a2, ...)
{
  return [a1 groupingSeparator];
}

id objc_msgSend_hasAccessibilityContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 hasAccessibilityContentSizeCategory];
}

id objc_msgSend_hasAppleSignature(void *a1, const char *a2, ...)
{
  return [a1 hasAppleSignature];
}

id objc_msgSend_hasBytesAvailable(void *a1, const char *a2, ...)
{
  return [a1 hasBytesAvailable];
}

id objc_msgSend_hasInsecureFilter(void *a1, const char *a2, ...)
{
  return [a1 hasInsecureFilter];
}

id objc_msgSend_hasLineBreak(void *a1, const char *a2, ...)
{
  return [a1 hasLineBreak];
}

id objc_msgSend_hasTrailingGutter(void *a1, const char *a2, ...)
{
  return [a1 hasTrailingGutter];
}

id objc_msgSend_hitTestInformationFromEndEvent(void *a1, const char *a2, ...)
{
  return [a1 hitTestInformationFromEndEvent];
}

id objc_msgSend_hitTestInformationFromStartEvent(void *a1, const char *a2, ...)
{
  return [a1 hitTestInformationFromStartEvent];
}

id objc_msgSend_homeScreenEndpoint(void *a1, const char *a2, ...)
{
  return [a1 homeScreenEndpoint];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_isAllowedAccessInBackground(void *a1, const char *a2, ...)
{
  return [a1 isAllowedAccessInBackground];
}

id objc_msgSend_isAllowedToCopyOnPaste(void *a1, const char *a2, ...)
{
  return [a1 isAllowedToCopyOnPaste];
}

id objc_msgSend_isAllowedToPasteUnchecked(void *a1, const char *a2, ...)
{
  return [a1 isAllowedToPasteUnchecked];
}

id objc_msgSend_isAllowedToPerformJanitorialTasks(void *a1, const char *a2, ...)
{
  return [a1 isAllowedToPerformJanitorialTasks];
}

id objc_msgSend_isAllowedToQueryBundleID(void *a1, const char *a2, ...)
{
  return [a1 isAllowedToQueryBundleID];
}

id objc_msgSend_isBlockingMainThread(void *a1, const char *a2, ...)
{
  return [a1 isBlockingMainThread];
}

id objc_msgSend_isContinuityPasteboardWithManagedDataAllowed(void *a1, const char *a2, ...)
{
  return [a1 isContinuityPasteboardWithManagedDataAllowed];
}

id objc_msgSend_isDeviceLockedPasteboard(void *a1, const char *a2, ...)
{
  return [a1 isDeviceLockedPasteboard];
}

id objc_msgSend_isExtension(void *a1, const char *a2, ...)
{
  return [a1 isExtension];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isFromUIFramework(void *a1, const char *a2, ...)
{
  return [a1 isFromUIFramework];
}

id objc_msgSend_isGeneralPasteboard(void *a1, const char *a2, ...)
{
  return [a1 isGeneralPasteboard];
}

id objc_msgSend_isLocalOnly(void *a1, const char *a2, ...)
{
  return [a1 isLocalOnly];
}

id objc_msgSend_isManagedPasteboardRequired(void *a1, const char *a2, ...)
{
  return [a1 isManagedPasteboardRequired];
}

id objc_msgSend_isManagedToUnmanagedPasteAllowed(void *a1, const char *a2, ...)
{
  return [a1 isManagedToUnmanagedPasteAllowed];
}

id objc_msgSend_isOpenInRestrictionInEffect(void *a1, const char *a2, ...)
{
  return [a1 isOpenInRestrictionInEffect];
}

id objc_msgSend_isOrWasRemote(void *a1, const char *a2, ...)
{
  return [a1 isOrWasRemote];
}

id objc_msgSend_isPasteboardManagementEnabled(void *a1, const char *a2, ...)
{
  return [a1 isPasteboardManagementEnabled];
}

id objc_msgSend_isPersistent(void *a1, const char *a2, ...)
{
  return [a1 isPersistent];
}

id objc_msgSend_isRemote(void *a1, const char *a2, ...)
{
  return [a1 isRemote];
}

id objc_msgSend_isRemoteDataLoaded(void *a1, const char *a2, ...)
{
  return [a1 isRemoteDataLoaded];
}

id objc_msgSend_isRemoteMetadataLoaded(void *a1, const char *a2, ...)
{
  return [a1 isRemoteMetadataLoaded];
}

id objc_msgSend_isSystemPasteboard(void *a1, const char *a2, ...)
{
  return [a1 isSystemPasteboard];
}

id objc_msgSend_isTrustedToRequestAuthenticationMessages(void *a1, const char *a2, ...)
{
  return [a1 isTrustedToRequestAuthenticationMessages];
}

id objc_msgSend_isUnmanagedToManagedPasteAllowed(void *a1, const char *a2, ...)
{
  return [a1 isUnmanagedToManagedPasteAllowed];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_keyInput(void *a1, const char *a2, ...)
{
  return [a1 keyInput];
}

id objc_msgSend_keyModifierFlags(void *a1, const char *a2, ...)
{
  return [a1 keyModifierFlags];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_layoutDirection(void *a1, const char *a2, ...)
{
  return [a1 layoutDirection];
}

id objc_msgSend_layoutSize(void *a1, const char *a2, ...)
{
  return [a1 layoutSize];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkedOnVersion(void *a1, const char *a2, ...)
{
  return [a1 linkedOnVersion];
}

id objc_msgSend_localization(void *a1, const char *a2, ...)
{
  return [a1 localization];
}

id objc_msgSend_localizedAnnouncementText(void *a1, const char *a2, ...)
{
  return [a1 localizedAnnouncementText];
}

id objc_msgSend_localizedAuthorizationText(void *a1, const char *a2, ...)
{
  return [a1 localizedAuthorizationText];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_managingOrganizationInformation(void *a1, const char *a2, ...)
{
  return [a1 managingOrganizationInformation];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_minWidth(void *a1, const char *a2, ...)
{
  return [a1 minWidth];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_orgName(void *a1, const char *a2, ...)
{
  return [a1 orgName];
}

id objc_msgSend_originIdentifier(void *a1, const char *a2, ...)
{
  return [a1 originIdentifier];
}

id objc_msgSend_originatorAllowedToCopyOnPaste(void *a1, const char *a2, ...)
{
  return [a1 originatorAllowedToCopyOnPaste];
}

id objc_msgSend_originatorBundleID(void *a1, const char *a2, ...)
{
  return [a1 originatorBundleID];
}

id objc_msgSend_originatorDataOwner(void *a1, const char *a2, ...)
{
  return [a1 originatorDataOwner];
}

id objc_msgSend_originatorLocalizedName(void *a1, const char *a2, ...)
{
  return [a1 originatorLocalizedName];
}

id objc_msgSend_originatorPersistentID(void *a1, const char *a2, ...)
{
  return [a1 originatorPersistentID];
}

id objc_msgSend_originatorTeamID(void *a1, const char *a2, ...)
{
  return [a1 originatorTeamID];
}

id objc_msgSend_pasteSharingToken(void *a1, const char *a2, ...)
{
  return [a1 pasteSharingToken];
}

id objc_msgSend_pasteWasAllowed(void *a1, const char *a2, ...)
{
  return [a1 pasteWasAllowed];
}

id objc_msgSend_pasteboardServiceListener(void *a1, const char *a2, ...)
{
  return [a1 pasteboardServiceListener];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_patterns(void *a1, const char *a2, ...)
{
  return [a1 patterns];
}

id objc_msgSend_performMigrationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 performMigrationIfNeeded];
}

id objc_msgSend_persistenceName(void *a1, const char *a2, ...)
{
  return [a1 persistenceName];
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 persistentIdentifier];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_preferredRepresentation(void *a1, const char *a2, ...)
{
  return [a1 preferredRepresentation];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_privateMetadata(void *a1, const char *a2, ...)
{
  return [a1 privateMetadata];
}

id objc_msgSend_punctuationCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 punctuationCharacterSet];
}

id objc_msgSend_remoteDeviceName(void *a1, const char *a2, ...)
{
  return [a1 remoteDeviceName];
}

id objc_msgSend_remotePasteboard(void *a1, const char *a2, ...)
{
  return [a1 remotePasteboard];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_saveBootSession(void *a1, const char *a2, ...)
{
  return [a1 saveBootSession];
}

id objc_msgSend_saveTimestamp(void *a1, const char *a2, ...)
{
  return [a1 saveTimestamp];
}

id objc_msgSend_secureName(void *a1, const char *a2, ...)
{
  return [a1 secureName];
}

id objc_msgSend_secureNameStatus(void *a1, const char *a2, ...)
{
  return [a1 secureNameStatus];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setRemoteDataLoaded(void *a1, const char *a2, ...)
{
  return [a1 setRemoteDataLoaded];
}

id objc_msgSend_setRemoteMetadataLoaded(void *a1, const char *a2, ...)
{
  return [a1 setRemoteMetadataLoaded];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedMigrator(void *a1, const char *a2, ...)
{
  return [a1 sharedMigrator];
}

id objc_msgSend_sharedModel(void *a1, const char *a2, ...)
{
  return [a1 sharedModel];
}

id objc_msgSend_sharingToken(void *a1, const char *a2, ...)
{
  return [a1 sharingToken];
}

id objc_msgSend_site(void *a1, const char *a2, ...)
{
  return [a1 site];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return [a1 streamError];
}

id objc_msgSend_suggestedName(void *a1, const char *a2, ...)
{
  return [a1 suggestedName];
}

id objc_msgSend_symbolCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 symbolCharacterSet];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return [a1 taskState];
}

id objc_msgSend_tccSyncMessageOptions(void *a1, const char *a2, ...)
{
  return [a1 tccSyncMessageOptions];
}

id objc_msgSend_teamID(void *a1, const char *a2, ...)
{
  return [a1 teamID];
}

id objc_msgSend_teamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 teamIdentifier];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_titleOrigin(void *a1, const char *a2, ...)
{
  return [a1 titleOrigin];
}

id objc_msgSend_titleWidth(void *a1, const char *a2, ...)
{
  return [a1 titleWidth];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 typeIdentifier];
}

id objc_msgSend_types(void *a1, const char *a2, ...)
{
  return [a1 types];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateOrgName(void *a1, const char *a2, ...)
{
  return [a1 updateOrgName];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userActivityListener(void *a1, const char *a2, ...)
{
  return [a1 userActivityListener];
}

id objc_msgSend_versionedPID(void *a1, const char *a2, ...)
{
  return [a1 versionedPID];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}