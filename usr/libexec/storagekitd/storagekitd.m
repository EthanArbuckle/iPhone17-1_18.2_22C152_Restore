id sub_10000322C()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t vars8;

  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKDaemonConnectionProtocol];
  v1 = objc_opt_class();
  v2 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, objc_opt_class(), 0);
  [v0 setClasses:v2 forSelector:"eraseWithEraser:reply:" argumentIndex:0 ofReply:0];

  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  [v0 setClasses:v11 forSelector:"eraseWithEraser:reply:" argumentIndex:0 ofReply:1];

  return v0;
}

id sub_1000033D8()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___SKHelperClientProtocol];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  [v0 setClasses:v9 forSelector:"requestWithUUID:didCompleteWithResult:" argumentIndex:1 ofReply:0];

  return v0;
}

uint64_t sub_10000359C(void *a1)
{
  id v1 = a1;
  id v2 = [v1 copyPropertyWithClass:objc_opt_class() key:@"Sealed"];

  if (v2)
  {
    if ([v2 isEqualToString:@"Broken"])
    {
      uint64_t v3 = 2;
    }
    else if ([v2 isEqualToString:@"Yes"])
    {
      uint64_t v3 = 3;
    }
    else
    {
      uint64_t v3 = [v2 isEqualToString:@"No"];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void sub_100004134(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSDictionary *__cdecl sub_1000041C0(id a1)
{
  CFStringRef v4 = @"faultCode";
  id v1 = sub_10000DCBC((uint64_t)"SKAPFSSnapshotDisk+Daemon.m", 76);
  uint64_t v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_1000053D0(id a1)
{
  CFStringRef v4 = @"faultCode";
  id v1 = sub_10000DCBC((uint64_t)"SKMountOperation.m", 190);
  uint64_t v5 = v1;
  id v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

void sub_1000061D8(uint64_t a1)
{
  id v3 = +[SKDaemonManager sharedManager];
  id v2 = [v3 _recacheSyncDisk:*(void *)(a1 + 32)];
}

void sub_10000655C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006570(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) installedFilesystemsMapping];
  id v3 = (void *)qword_100055A78;
  qword_100055A78 = v2;

  CFStringRef v4 = [*(id *)(a1 + 32) extensionFilesystemsMapping];
  byte_100055A80 = [v4 count] != 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v11 = [v5 objectForKeyedSubscript:v10];
        v12 = +[NSPredicate predicateWithBlock:&stru_100048BC8];
        v13 = [v11 filteredArrayUsingPredicate:v12];

        if ([v13 count]
          || ([(id)qword_100055A78 valueForKey:v10],
              v15 = objc_claimAutoreleasedReturnValue(),
              v15,
              !v15))
        {
          v14 = [v5 objectForKeyedSubscript:v10];
          [(id)qword_100055A78 setObject:v14 forKeyedSubscript:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  uint64_t v16 = +[SKFilesystem collectFilesystemsWithPersonalityMapping:qword_100055A78];
  v17 = (void *)qword_100055A70;
  qword_100055A70 = v16;
}

BOOL sub_100006784(id a1, SKFilesystem *a2, NSDictionary *a3)
{
  return [(SKFilesystem *)a2 shouldShow];
}

void sub_100006F04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

_UNKNOWN **sub_100007CD4(void *a1, unsigned char *a2)
{
  id v3 = a1;
  CFStringRef v4 = [v3 objectForKeyedSubscript:@"Base"];
  id v5 = [v3 objectForKeyedSubscript:@"Partition ID"];

  int v6 = sub_10001217C(v4);
  if (v6) {
    int v6 = sub_10001217C(v5);
  }
  if (a2) {
    *a2 = v6;
  }
  if (v6) {
    id v7 = (_UNKNOWN **)v4;
  }
  else {
    id v7 = &off_10004BF20;
  }
  uint64_t v8 = v7;

  return v8;
}

void sub_100008EC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

int64_t sub_100009540(id a1, id a2, id a3)
{
  id v4 = a3;
  id v5 = [a2 objectAtIndexedSubscript:1];
  int v6 = [v4 objectAtIndexedSubscript:1];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_1000098A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009A18(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000A968(uint64_t a1, uint64_t a2)
{
  id v4 = [SKPartitionTable alloc];
  id v5 = [*(id *)(a1 + 32) disk];
  int v6 = [(SKPartitionTable *)v4 initWithDisk:v5 error:a2];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) descriptors];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000ABF0;
    v20[3] = &unk_100048C50;
    uint64_t v8 = v6;
    p_super = &v8->super;
    [v7 enumerateObjectsUsingBlock:v20];

    v9 = [*(id *)(a1 + 32) disk];
    id v19 = 0;
    unsigned __int8 v10 = [v9 cleanupWithError:&v19];
    id v11 = v19;

    if ((v10 & 1) == 0 && v11)
    {
      v12 = sub_10000DD48();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = [*(id *)(a1 + 32) disk];
        *(_DWORD *)buf = 138412546;
        v23 = v13;
        __int16 v24 = 2112;
        id v25 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to cleanup %@, %@", buf, 0x16u);
      }
    }
    unsigned int v14 = [(SKPartitionTable *)v8 writePartitionScheme:0 error:a2];
    id v15 = 0;
    if (v14) {
      id v15 = *(id *)(a1 + 40);
    }

    uint64_t v16 = p_super;
  }
  else
  {
    uint64_t v16 = sub_10000DD48();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = [*(id *)(a1 + 32) disk];
      *(_DWORD *)buf = 136315394;
      v23 = "-[SKEraseDisk(Daemon) createStateMachineWithError:]_block_invoke";
      __int16 v24 = 2112;
      id v25 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Failed to create partition table for %@", buf, 0x16u);
    }
    id v15 = 0;
  }

  return v15;
}

void sub_10000ABF0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = [v2 partitions];
  id v4 = [v3 newPartition];

  [v5 addObject:v4];
}

id sub_10000AC64(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) disk];
  id v5 = [v4 children];

  if (v5 && [v5 count])
  {
    uint64_t v25 = a2;
    int v6 = objc_opt_new();
    id v7 = [*(id *)(a1 + 32) descriptors];
    id v8 = [v7 count];

    if (v8)
    {
      unint64_t v9 = 0;
      while (1)
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10000AFE0;
        v26[3] = &unk_100048C98;
        int v27 = v9;
        unsigned __int8 v10 = +[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v26, v25);
        id v11 = [v5 filteredArrayUsingPredicate:v10];

        if ([v11 count] != (id)1) {
          break;
        }
        v12 = [*(id *)(a1 + 32) descriptors];
        v13 = [v12 objectAtIndexedSubscript:v9];
        unsigned int v14 = [v13 innerDescriptor];

        id v15 = [v11 objectAtIndexedSubscript:0];
        uint64_t v16 = [v14 toVolumeWithDisk:v15];

        [v6 addObject:v16];
        ++v9;
        v17 = [*(id *)(a1 + 32) descriptors];
        id v18 = [v17 count];

        if ((unint64_t)v18 <= v9) {
          goto LABEL_7;
        }
      }
      __int16 v24 = +[SKError errorWithCode:300 disks:v11 userInfo:0];
      id v21 = +[SKError nilWithError:v24 error:v25];
    }
    else
    {
LABEL_7:
      id v11 = objc_opt_new();
      id v19 = [*(id *)(a1 + 32) progress];
      long long v20 = [v11 progress];
      [v19 chainChildProgress:v20 withPendingUnitCount:((uint64_t)((double)(0x64 / (unint64_t)objc_msgSend(v5, "count")) * 0.5));

      if ([v11 createWithVolumes:v6 error:v25]) {
        id v21 = *(id *)(a1 + 40);
      }
      else {
        id v21 = 0;
      }
    }
  }
  else
  {
    int v6 = [*(id *)(a1 + 32) disk];
    v28 = v6;
    id v11 = +[NSArray arrayWithObjects:&v28 count:1];
    v22 = +[SKError errorWithCode:300 disks:v11 userInfo:0];
    id v21 = +[SKError nilWithError:v22 error:a2];
  }

  return v21;
}

BOOL sub_10000AFE0(uint64_t a1, uint64_t a2)
{
  id v3 = +[SKPartitionTable partitionIDFromDisk:a2];
  BOOL v4 = [v3 unsignedLongValue] == (id)(*(int *)(a1 + 32) + 1);

  return v4;
}

id sub_10000B034(uint64_t a1, uint64_t a2)
{
  BOOL v4 = [*(id *)(a1 + 32) disk];
  id v5 = [v4 children];

  if (v5
    && [v5 count]
    && ([*(id *)(a1 + 32) descriptors],
        int v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        id v8 = [v5 count],
        v6,
        v7 == v8))
  {
    unint64_t v9 = [*(id *)(a1 + 32) descriptors];
    id v10 = [v9 count];

    if (v10)
    {
      unint64_t v11 = 0;
      do
      {
        v12 = [v5 objectAtIndexedSubscript:v11];
        v13 = [*(id *)(a1 + 32) descriptors];
        unsigned int v14 = [v13 objectAtIndexedSubscript:v11];
        id v15 = [v14 filesystem];
        +[SKEraseVolume reProbeWithDisk:isEncrypted:](SKEraseVolume, "reProbeWithDisk:isEncrypted:", v12, [v15 isEncrypted]);

        ++v11;
        uint64_t v16 = [*(id *)(a1 + 32) descriptors];
        id v17 = [v16 count];
      }
      while ((unint64_t)v17 > v11);
    }
    id v18 = *(id *)(a1 + 40);
  }
  else
  {
    id v19 = [*(id *)(a1 + 32) disk];
    v23 = v19;
    long long v20 = +[NSArray arrayWithObjects:&v23 count:1];
    id v21 = +[SKError errorWithCode:105 disks:v20 userInfo:0];
    id v18 = +[SKError nilWithError:v21 error:a2];
  }

  return v18;
}

id sub_10000B264(uint64_t a1, uint64_t a2)
{
  BOOL v4 = [*(id *)(a1 + 32) disk];
  id v5 = [v4 children];

  if (v5
    && [v5 count]
    && ([*(id *)(a1 + 32) descriptors],
        int v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 count],
        id v8 = [v5 count],
        v6,
        v7 == v8))
  {
    unint64_t v9 = [*(id *)(a1 + 32) descriptors];
    id v10 = [v9 count];

    if (v10)
    {
      unint64_t v12 = 0;
      uint64_t v36 = kSKDiskMountOptionRecursive;
      uint64_t v13 = kSKDiskUnmountOptionForce;
      *(void *)&long long v11 = 138412546;
      long long v35 = v11;
      do
      {
        unsigned int v14 = [*(id *)(a1 + 32) descriptors:v35];
        id v15 = [v14 objectAtIndexedSubscript:v12];
        uint64_t v16 = [v15 innerDescriptor];

        id v17 = [v16 filesystem];
        id v18 = [v17 majorType];
        unsigned __int8 v19 = [v18 isEqualToString:@"apfs"];

        if ((v19 & 1) == 0)
        {
          long long v20 = [v5 objectAtIndexedSubscript:v12];
          v42[0] = v36;
          v42[1] = v13;
          v43[0] = &__kCFBooleanTrue;
          v43[1] = &__kCFBooleanTrue;
          id v21 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
          id v37 = 0;
          unsigned __int8 v22 = +[SKUnmountOperation unmountWithDisk:v20 options:v21 error:&v37];
          id v23 = v37;

          if ((v22 & 1) == 0 && v23)
          {
            __int16 v24 = sub_10000DD48();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              uint64_t v25 = [*(id *)(a1 + 32) disk];
              v26 = [v25 children];
              int v27 = [v26 objectAtIndexedSubscript:v12];
              *(_DWORD *)buf = v35;
              v39 = v27;
              __int16 v40 = 2112;
              id v41 = v23;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to unmount after reprobe %@, %@", buf, 0x16u);
            }
          }
        }
        ++v12;
        v28 = [*(id *)(a1 + 32) descriptors];
        id v29 = [v28 count];
      }
      while ((unint64_t)v29 > v12);
    }
    id v30 = *(id *)(a1 + 40);
  }
  else
  {
    v31 = [*(id *)(a1 + 32) disk];
    v44 = v31;
    v32 = +[NSArray arrayWithObjects:&v44 count:1];
    v33 = +[SKError errorWithCode:105 disks:v32 userInfo:0];
    id v30 = +[SKError nilWithError:v33 error:a2];
  }

  return v30;
}

SKStateTransitionEntry *sub_10000C2F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[SKStateTransitionEntry entryWithState:a1 event:a2 action:a3 nextState:a4];
}

SKStateTransitionEntry *sub_10000C314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return +[SKStateTransitionEntry entryWithState:a1 event:a2 selector:a3 nextState:a4];
}

id sub_10000C330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[SKStateTransitionEntry entryWithState:a1 event:a2 selector:a3];
}

id sub_10000C348(uint64_t a1, uint64_t a2)
{
  return +[SKStateTransitionEntry entryWithState:a1 event:a2];
}

void sub_10000C3B4(id a1)
{
  qword_100055A88 = [@"\n" dataUsingEncoding:4];

  _objc_release_x1();
}

void sub_10000C768(id a1)
{
  qword_100055A98 = [@"<plist" dataUsingEncoding:4];

  _objc_release_x1();
}

void sub_10000C800(id a1)
{
  qword_100055AA8 = [@"</plist>" dataUsingEncoding:4];

  _objc_release_x1();
}

void sub_10000D49C(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(SKTask *)a2 task];
  [v4 launch];
}

BOOL sub_10000D4E0(id a1, SKTask *a2, NSDictionary *a3)
{
  id v3 = [(SKTask *)a2 task];
  unsigned __int8 v4 = [v3 isRunning];

  return v4;
}

void sub_10000D51C(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  unint64_t v12 = a2;
  unsigned __int8 v4 = [(SKTask *)v12 stdoutParser];

  if (v4)
  {
    id v5 = [(SKTask *)v12 stdoutParser];
    int v6 = [(SKTask *)v12 stdoutHandle];
    id v7 = [v6 readDataUpToLength:4096 error:0];
    [v5 parseData:v7];
  }
  id v8 = [(SKTask *)v12 stderrParser];

  if (v8)
  {
    unint64_t v9 = [(SKTask *)v12 stderrParser];
    id v10 = [(SKTask *)v12 stderrHandle];
    long long v11 = [v10 readDataUpToLength:4096 error:0];
    [v9 parseData:v11];
  }
}

BOOL sub_10000D628(id a1, SKTask *a2, NSDictionary *a3)
{
  id v3 = [(SKTask *)a2 task];
  unsigned __int8 v4 = [v3 isRunning];

  return v4;
}

void sub_10000D664(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(SKTask *)a2 task];
  [v4 waitUntilExit];
}

void sub_10000D6A8(id a1, SKTask *a2, unint64_t a3, BOOL *a4)
{
  unint64_t v12 = a2;
  id v4 = [(SKTask *)v12 stderrParser];

  if (v4)
  {
    id v5 = [(SKTask *)v12 stdoutParser];
    int v6 = [(SKTask *)v12 stdoutHandle];
    id v7 = [v6 readDataToEndOfFile];
    [v5 parseData:v7];
  }
  id v8 = [(SKTask *)v12 stderrParser];

  if (v8)
  {
    unint64_t v9 = [(SKTask *)v12 stderrParser];
    id v10 = [(SKTask *)v12 stderrHandle];
    long long v11 = [v10 readDataToEndOfFile];
    [v9 parseData:v11];
  }
}

BOOL sub_10000D7A4(id a1, SKTask *a2, NSDictionary *a3)
{
  return ![(SKTask *)a2 endedSuccessfully];
}

id sub_10000DCBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = +[NSString stringWithFormat:@"%s:%d", a1, a2];
  id v3 = [v2 dataUsingEncoding:4];
  id v4 = [v3 base64EncodedStringWithOptions:0];

  return v4;
}

id sub_10000DD48()
{
  if (qword_100055AB8 != -1) {
    dispatch_once(&qword_100055AB8, &stru_100048E58);
  }
  if (byte_100055AC0) {
    v0 = (void **)&off_100055790;
  }
  else {
    v0 = (void **)&off_100055788;
  }
  id v1 = *v0;

  return v1;
}

void sub_10000DDB8(id a1)
{
  os_log_t v1 = os_log_create("com.apple.storagekit", "general");
  uint64_t v2 = off_100055788;
  off_100055788 = v1;

  off_100055790 = os_log_create("com.apple.storagekit", "storagekit-install");

  _objc_release_x1();
}

void SKLogSetLogsToConsole()
{
  v0 = sub_10000DD48();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "SKLogSetLogsToConsole/Std is deprecated. Please remove this call", v1, 2u);
  }
}

void SKLogSetLogsToStd()
{
  v0 = sub_10000DD48();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "SKLogSetLogsToStd is deprecated. Please remove this call", v1, 2u);
  }
}

uint64_t SKLogSetLogsToSys(uint64_t result)
{
  byte_100055AC0 = result;
  return result;
}

void sub_10000DF04(os_log_type_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v6 = sub_10000DD48();
  if (os_log_type_enabled(v6, a1))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, a1, "%s", buf, 0xCu);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v13 = sub_10000DD48();
        if (os_log_type_enabled(v13, a1))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v20 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, a1, "%@", buf, 0xCu);
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

void sub_10000E334(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL sub_10000EA54(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 valueForEntitlement:a1];
  BOOL v3 = 0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v2 BOOLValue]) {
      BOOL v3 = 1;
    }
  }

  return v3;
}

void sub_10000ECF4(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  BOOL v3 = sub_10000DD48();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Progress handler failed:%@", (uint8_t *)&v4, 0xCu);
  }
}

id sub_10000F058(uint64_t a1)
{
  v16[0] = @"api";
  uint64_t v2 = +[NSString stringWithCString:*(void *)(a1 + 40) encoding:4];
  v17[0] = v2;
  v16[1] = @"diskType";
  BOOL v3 = [*(id *)(a1 + 32) type];
  v17[1] = v3;
  v16[2] = @"isDiskImage";
  if ([*(id *)(a1 + 32) isDiskImage]) {
    int v4 = &__kCFBooleanTrue;
  }
  else {
    int v4 = &__kCFBooleanFalse;
  }
  v17[2] = v4;
  v16[3] = @"isWritable";
  if ([*(id *)(a1 + 32) isWritable]) {
    id v5 = &__kCFBooleanTrue;
  }
  else {
    id v5 = &__kCFBooleanFalse;
  }
  v17[3] = v5;
  v16[4] = @"isLocked";
  if ([*(id *)(a1 + 32) isLocked]) {
    int v6 = &__kCFBooleanTrue;
  }
  else {
    int v6 = &__kCFBooleanFalse;
  }
  v17[4] = v6;
  v16[5] = @"isExternal";
  if ([*(id *)(a1 + 32) isExternal]) {
    id v7 = &__kCFBooleanTrue;
  }
  else {
    id v7 = &__kCFBooleanFalse;
  }
  v17[5] = v7;
  v16[6] = @"isInternalDisk";
  if ([*(id *)(a1 + 32) isInternal]) {
    id v8 = &__kCFBooleanTrue;
  }
  else {
    id v8 = &__kCFBooleanFalse;
  }
  v17[6] = v8;
  v16[7] = @"isJournaled";
  if ([*(id *)(a1 + 32) isJournaled]) {
    id v9 = &__kCFBooleanTrue;
  }
  else {
    id v9 = &__kCFBooleanFalse;
  }
  v17[7] = v9;
  v16[8] = @"isWholeDisk";
  if ([*(id *)(a1 + 32) isWholeDisk]) {
    uint64_t v10 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v10 = &__kCFBooleanFalse;
  }
  v17[8] = v10;
  v16[9] = @"isOSInternal";
  if ([*(id *)(a1 + 32) isOSInternal]) {
    long long v11 = &__kCFBooleanTrue;
  }
  else {
    long long v11 = &__kCFBooleanFalse;
  }
  v17[9] = v11;
  v16[10] = @"isPhysicalDisk";
  if ([*(id *)(a1 + 32) isPhysicalDisk]) {
    uint64_t v12 = &__kCFBooleanTrue;
  }
  else {
    uint64_t v12 = &__kCFBooleanFalse;
  }
  v17[10] = v12;
  v16[11] = @"role";
  uint64_t v13 = [*(id *)(a1 + 32) role];
  v17[11] = v13;
  long long v14 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:12];

  return v14;
}

id sub_10000FAEC(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:&off_10004BF08];
}

void sub_10000FC98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000FCB8(void *a1, int a2)
{
  uint64_t v2 = a1[5];
  BOOL v3 = *(void **)(a1[4] + 8);
  if (a2) {
    BOOL v4 = *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  id v5 = +[NSNumber numberWithBool:v4];
  id v7 = v5;
  int v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v3 requestWithUUID:v2 didCompleteWithResult:v6];
}

void sub_10000FEE4(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  BOOL v4 = [a2 minimalDictionaryRepresentation];
  id v5 = [v3 _safe_object:v4];

  id v7 = v5;
  int v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [*(id *)(*(void *)(a1 + 32) + 8) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:v6];
}

void sub_10001013C(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  BOOL v4 = [a2 minimalDictionaryRepresentation];
  id v5 = [v3 _safe_object:v4];

  id v7 = v5;
  int v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [*(id *)(*(void *)(a1 + 32) + 8) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:v6];
}

void sub_100010394(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v9) minimalDictionaryRepresentation:v15];
        [v4 addObject:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v7);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void **)(v11 + 8);
  unsigned __int8 v19 = v4;
  long long v14 = +[NSArray arrayWithObjects:&v19 count:1];
  [v13 requestWithUUID:v12 didCompleteWithResult:v14];
}

void sub_100010654(uint64_t a1, uint64_t a2)
{
  id v3 = +[NSNumber numberWithBool:a2];
  id v5 = v3;
  BOOL v4 = +[NSArray arrayWithObjects:&v5 count:1];

  [*(id *)(*(void *)(a1 + 32) + 8) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:v4];
}

id sub_1000108A8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:&__NSArray0__struct];
}

void sub_100010A04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  BOOL v4 = [*(id *)(a1 + 32) _safe_object:a2];
  id v6 = v4;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v3 requestWithUUID:v2 didCompleteWithResult:v5];
}

void sub_100010C48(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v9) minimalDictionaryRepresentation:v16];
        [v4 addObject:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }

  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = (void *)v11[1];
  long long v14 = [v11 _safe_object:v4];
  uint64_t v20 = v14;
  long long v15 = +[NSArray arrayWithObjects:&v20 count:1];
  [v13 requestWithUUID:v12 didCompleteWithResult:v15];
}

void sub_100010F6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * (void)v9) minimalDictionaryRepresentation:v16];
        [v4 addObject:v10];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v7);
  }

  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = (void *)v11[1];
  long long v14 = [v11 _safe_object:v4];
  uint64_t v20 = v14;
  long long v15 = +[NSArray arrayWithObjects:&v20 count:1];
  [v13 requestWithUUID:v12 didCompleteWithResult:v15];
}

NSArray *__cdecl sub_100011208(id a1)
{
  os_log_t v1 = +[SKError errorWithCode:112 userInfo:0];
  BOOL v4 = v1;
  uint64_t v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

void sub_1000112AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  BOOL v4 = [*(id *)(a1 + 32) _safe_object:a2];
  id v6 = v4;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v3 requestWithUUID:v2 didCompleteWithResult:v5];
}

NSArray *__cdecl sub_100011468(id a1)
{
  os_log_t v1 = +[SKError errorWithCode:112 userInfo:0];
  BOOL v4 = v1;
  uint64_t v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

void sub_10001150C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  BOOL v4 = [*(id *)(a1 + 32) _safe_object:a2];
  id v6 = v4;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v3 requestWithUUID:v2 didCompleteWithResult:v5];
}

void sub_1000117B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  BOOL v4 = [*(id *)(a1 + 32) _safe_object:a2];
  id v6 = v4;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v3 requestWithUUID:v2 didCompleteWithResult:v5];
}

NSArray *__cdecl sub_100011950(id a1)
{
  os_log_t v1 = +[SKError errorWithCode:112 userInfo:0];
  BOOL v4 = v1;
  uint64_t v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return (NSArray *)v2;
}

void sub_1000119F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  BOOL v4 = [*(id *)(a1 + 32) _safe_object:a2];
  id v6 = v4;
  id v5 = +[NSArray arrayWithObjects:&v6 count:1];
  [v3 requestWithUUID:v2 didCompleteWithResult:v5];
}

void sub_100011D04(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  if (!a2 || v5)
  {
    id v9 = +[NSNull null];
    v13[0] = v9;
    uint64_t v10 = [*(id *)(a1 + 32) _safe_object:v6];
    v13[1] = v10;
    uint64_t v11 = +[NSArray arrayWithObjects:v13 count:2];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v11);
  }
  else
  {
    uint64_t v8 = *(void **)(a1 + 32);
    id v9 = [a2 minimalDictionaryRepresentation];
    uint64_t v10 = [v8 _safe_object:v9];
    v14[0] = v10;
    uint64_t v11 = +[NSNull null];
    v14[1] = v11;
    uint64_t v12 = +[NSArray arrayWithObjects:v14 count:2];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v12);
  }
}

uint64_t sub_100011FB4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100012090(void *a1, const void *a2)
{
  queue = a1;
  id v3 = malloc_type_calloc(8uLL, 1uLL, 0x50B26848uLL);
  *id v3 = 1;
  dispatch_queue_set_specific(queue, a2, v3, (dispatch_function_t)&_free);
}

void *sub_100012110()
{
  if (qword_100055AC8 != -1) {
    dispatch_once(&qword_100055AC8, &stru_1000490A0);
  }
  result = dispatch_get_specific("isMainQueue");
  if (result) {
    return (void *)(*result != 0);
  }
  return result;
}

void sub_100012168(id a1)
{
}

uint64_t sub_10001217C(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

BOOL sub_1000121D4(void *a1)
{
  id v1 = a1;
  BOOL v2 = v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v1 length] != 0;

  return v2;
}

uint64_t sub_100012238(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_100012290(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

uint64_t sub_1000122E8(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

id sub_100012340(void *a1)
{
  id v1 = a1;
  if (sub_10001217C(v1)) {
    id v2 = [v1 BOOLValue];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id sub_100012388(void *a1)
{
  id v1 = a1;
  if (sub_10001217C(v1)) {
    id v2 = [v1 unsignedLongLongValue];
  }
  else {
    id v2 = 0;
  }

  return v2;
}

__CFString *sub_1000123D0(void *a1)
{
  id v1 = a1;
  if (sub_1000121D4(v1)) {
    id v2 = v1;
  }
  else {
    id v2 = &stru_10004A7A8;
  }
  id v3 = v2;

  return v3;
}

BOOL sub_100012418(void *a1)
{
  id v1 = a1;
  if (sub_1000121D4(v1))
  {
    id v2 = [objc_alloc((Class)NSUUID) initWithUUIDString:v1];
    BOOL v3 = v2 != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

uint64_t sub_100012474(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t sub_1000124CC(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t sub_100012524(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t sub_10001257C(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t sub_1000125D4(void *a1)
{
  if (a1)
  {
    id v1 = a1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 1;
  }
  return isKindOfClass & 1;
}

uint64_t sub_10001262C(unint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    return (uint64_t)[(id)a1 isEqual:a2];
  }
  else {
    return 1;
  }
}

void sub_100012F00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100012F50(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v25;
    uint64_t v7 = &APFSCancelContainerResize_ptr;
    uint64_t v8 = &kSKDiskFileSystemAPFS;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(v3);
        }
        id v10 = [objc_alloc((Class)v7[248]) initWithDictionaryRepresentation:*(void *)(*((void *)&v24 + 1) + 8 * (void)v9)];
        uint64_t v11 = [v10 type];
        if ([v11 isEqualToString:*v8]
          && (unsigned int v12 = [v10 isEncrypted],
              v12 == [*(id *)(a1 + 32) isEncrypted]))
        {
          unsigned int v23 = [v10 isCaseSensitive];
          unsigned int v13 = [*(id *)(a1 + 32) isCaseSensitive];
          id v14 = v5;
          uint64_t v15 = v6;
          uint64_t v16 = a1;
          long long v17 = v8;
          long long v18 = v7;
          id v19 = v3;
          unsigned int v20 = v13;

          BOOL v21 = v23 == v20;
          id v3 = v19;
          uint64_t v7 = v18;
          uint64_t v8 = v17;
          a1 = v16;
          uint64_t v6 = v15;
          id v5 = v14;
          if (v21) {
            [*(id *)(a1 + 32) setFilesystem:v10];
          }
        }
        else
        {
        }
        id v9 = (char *)v9 + 1;
      }
      while (v5 != v9);
      id v22 = [v3 countByEnumeratingWithState:&v24 objects:v28 count:16];
      id v5 = v22;
    }
    while (v22);
  }
}

void sub_100013664(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100014374(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100014478(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000144BC(id a1)
{
  unsigned int v4 = 0;
  size_t v3 = 4;
  sysctlbyname("hw.logicalcpu", &v4, &v3, 0, 0);
  id v1 = sub_10000DD48();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "# CPUs: %u", buf, 8u);
  }

  int v2 = v4;
  if (v4 <= 1) {
    int v2 = 1;
  }
  dword_100055AD8 = v2;
}

void sub_1000145F0(id a1)
{
  qword_100055AE8 = objc_alloc_init(SKDaemon);

  _objc_release_x1();
}

void sub_1000146A4(id a1)
{
  id v1 = sub_10000DD48();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)size_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGTERM received", v3, 2u);
  }

  int v2 = +[SKDaemonManager sharedManager];
  [v2 _scheduleGenericOperationWithCompletionBlock:&stru_100049148];
}

void sub_100014730(id a1)
{
  id v1 = sub_10000DD48();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGTERM handling complete, quitting now", v2, 2u);
  }

  exit(0);
}

id sub_100014C24(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleWithMatchingEvent:a2];
}

void sub_100014E5C(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v2 = +[SKDaemonManager sharedManager];
    [v2 removeListener:*(void *)(a1 + 32)];
  }
  [*(id *)(a1 + 40) setNumConnectedClients:[*(id *)(a1 + 40) numConnectedClients] - 1];
  size_t v3 = sub_10000DD48();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    unsigned int v5 = [*(id *)(a1 + 40) numConnectedClients];
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 1024;
    unsigned int v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ removed. There are now %u client(s) connected to storagetkid", (uint8_t *)&v6, 0x12u);
  }
}

id sub_1000154FC(uint64_t a1, void *a2)
{
  size_t v3 = [a2 diskIdentifier];
  uint64_t v4 = [*(id *)(a1 + 32) diskIdentifier];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_100015A3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_100016590(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v4 disk];
  int v6 = [v4 syncDiskFromDaemon:v5 error:a2];
  [*(id *)(a1 + 32) setDisk:v6];

  uint64_t v7 = [*(id *)(a1 + 32) disk];

  if (v7)
  {
    __int16 v8 = objc_opt_class();
    unsigned int v9 = [*(id *)(a1 + 32) disk];
    id v10 = [*(id *)(a1 + 32) descriptor];
    uint64_t v11 = [v10 filesystem];
    [v8 reProbeWithDisk:v9 isEncrypted:[v11 isEncrypted]];

    id v12 = *(id *)(a1 + 40);
  }
  else
  {
    unsigned int v13 = sub_10000DD48();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136315138;
      uint64_t v16 = "-[SKEraseVolume(Daemon) createStateMachineWithError:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Failed to sync disk from Daemon", (uint8_t *)&v15, 0xCu);
    }

    id v12 = 0;
  }

  return v12;
}

id sub_100016720(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) disk];
  v16[0] = kSKDiskMountOptionRecursive;
  v16[1] = kSKDiskUnmountOptionForce;
  v17[0] = &__kCFBooleanTrue;
  v17[1] = &__kCFBooleanTrue;
  size_t v3 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v11 = 0;
  unsigned __int8 v4 = +[SKUnmountOperation unmountWithDisk:v2 options:v3 error:&v11];
  id v5 = v11;

  if ((v4 & 1) == 0 && v5)
  {
    int v6 = sub_10000DD48();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [*(id *)(a1 + 32) disk];
      *(_DWORD *)buf = 138412546;
      unsigned int v13 = v7;
      __int16 v14 = 2112;
      id v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to unmount after repbore %@, %@", buf, 0x16u);
    }
  }
  __int16 v8 = [*(id *)(a1 + 32) progress];
  [v8 setCompletedUnitCount:100];

  id v9 = *(id *)(a1 + 40);
  return v9;
}

id sub_1000168BC(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = [*(id *)(a1 + 32) disk];
  id v22 = 0;
  unsigned __int8 v5 = [v4 cleanupWithError:&v22];
  id v6 = v22;

  if ((v5 & 1) == 0 && v6)
  {
    uint64_t v7 = sub_10000DD48();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v8 = [*(id *)(a1 + 32) disk];
      *(_DWORD *)buf = 138412546;
      long long v26 = v8;
      __int16 v27 = 2112;
      id v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to cleanup %@, %@", buf, 0x16u);
    }
  }
  id v9 = [*(id *)(a1 + 32) disk];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_10;
  }
  id v11 = [*(id *)(a1 + 32) disk];
  id v12 = [v11 container];

  if (v12)
  {
    uint64_t v13 = [v12 designatedPhysicalStore];
    if (v13)
    {
      __int16 v14 = (void *)v13;
      [*(id *)(a1 + 32) setDisk:v13];

LABEL_10:
      id v15 = *(id *)(a1 + 40);
      goto LABEL_13;
    }
    unsigned int v23 = v12;
    id v19 = +[NSArray arrayWithObjects:&v23 count:1];
    unsigned int v20 = +[SKError errorWithCode:117 disks:v19 userInfo:0];
    id v15 = +[SKError nilWithError:v20 error:a2];
  }
  else
  {
    uint64_t v16 = [*(id *)(a1 + 32) disk];
    long long v24 = v16;
    long long v17 = +[NSArray arrayWithObjects:&v24 count:1];
    long long v18 = +[SKError errorWithCode:117 disks:v17 userInfo:0];
    id v15 = +[SKError nilWithError:v18 error:a2];
  }
LABEL_13:

  return v15;
}

id sub_100016B58(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = objc_opt_new();
  unsigned __int8 v5 = [*(id *)(a1 + 32) progress];
  id v6 = [v4 progress];
  [v5 chainChildProgress:v6 withPendingUnitCount:50];

  uint64_t v7 = [*(id *)(a1 + 32) descriptor];
  __int16 v8 = [*(id *)(a1 + 32) disk];
  id v9 = [v7 toVolumeWithDisk:v8];
  uint64_t v13 = v9;
  id v10 = +[NSArray arrayWithObjects:&v13 count:1];
  LODWORD(a2) = [v4 createWithVolumes:v10 error:a2];

  if (a2) {
    id v11 = *(id *)(a1 + 40);
  }
  else {
    id v11 = 0;
  }

  return v11;
}

id sub_100016CB8(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = [*(id *)(a1 + 32) disk];
  unsigned int v5 = [v4 isWholeDisk];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) disk];
    unsigned int v7 = [v6 wipeDiskWithError:a2];

    if (v7) {
      id v8 = *(id *)(a1 + 40);
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v9 = [SKPartitionTable alloc];
    id v10 = [*(id *)(a1 + 32) disk];
    id v11 = [(SKPartitionTable *)v9 initWithDisk:v10 error:a2];

    id v12 = [*(id *)(a1 + 32) disk];
    uint64_t v13 = +[SKPartitionTable partitionIDFromDisk:v12];

    if (v13)
    {
      __int16 v14 = [*(id *)(a1 + 32) descriptor];
      id v15 = [v14 filesystem];
      unsigned int v16 = [(SKPartitionTable *)v11 overwritePartitionAt:v13 filesystem:v15 error:a2];

      if (v16) {
        id v8 = *(id *)(a1 + 40);
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      long long v17 = [*(id *)(a1 + 32) disk];
      BOOL v21 = v17;
      long long v18 = +[NSArray arrayWithObjects:&v21 count:1];
      id v19 = +[SKError errorWithCode:300 disks:v18 userInfo:0];
      id v8 = +[SKError nilWithError:v19 error:a2];
    }
  }

  return v8;
}

id sub_100016ED8(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v4 = *(void **)(a1 + 32);
  unsigned int v5 = [v4 disk];
  id v6 = [v4 syncDiskFromDaemon:v5 error:a2];
  [*(id *)(a1 + 32) setDisk:v6];

  unsigned int v7 = [*(id *)(a1 + 32) disk];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 32) disk];
    id v59 = 0;
    unsigned __int8 v9 = [v8 cleanupWithError:&v59];
    id v10 = v59;

    if ((v9 & 1) == 0 && v10)
    {
      id v11 = sub_10000DD48();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = [*(id *)(a1 + 32) disk];
        *(_DWORD *)buf = 138412546;
        v64 = v12;
        __int16 v65 = 2112;
        v66 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to cleanup %@, %@", buf, 0x16u);
      }
    }
    uint64_t v13 = [*(id *)(a1 + 32) disk];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v14 = [*(id *)(a1 + 32) disk];
      id v15 = [v14 container];
      unsigned int v16 = [v15 isLiveFSAPFSDisk];

      if (v16)
      {
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_35;
      }
    }
    else
    {
    }
    long long v18 = +[NSNumber numberWithInteger:0];
    id v19 = [*(id *)(a1 + 32) disk];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v21 = [*(id *)(a1 + 32) disk];
    id v22 = v21;
    if (isKindOfClass)
    {
      unsigned int v23 = [v21 diskIdentifier];
      long long v24 = [v23 substringFromIndex:4];
      long long v25 = [v24 componentsSeparatedByString:@"s"];

      if ((unint64_t)[v25 count] <= 1)
      {
        v50 = sub_10000DD48();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v51 = [*(id *)(a1 + 32) disk];
          v52 = [v51 diskIdentifier];
          *(_DWORD *)buf = 136315394;
          v64 = "-[SKEraseVolume(Daemon) createStateMachineWithError:]_block_invoke";
          __int16 v65 = 2114;
          v66 = v52;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%s: Invalid BSD name for APFS volume: %{public}@", buf, 0x16u);
        }
        id v17 = +[SKError nilWithPOSIXCode:22 error:a2];
        goto LABEL_34;
      }
      long long v26 = [v25 objectAtIndexedSubscript:1];
      uint64_t v27 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (char *)[v26 integerValue] - 1);

      id v28 = [*(id *)(a1 + 32) disk];
      uint64_t v29 = [v28 container];

      id v30 = v25;
      long long v18 = (void *)v27;
      long long v25 = (void *)v29;
    }
    else
    {
      objc_opt_class();
      char v31 = objc_opt_isKindOfClass();

      if ((v31 & 1) == 0) {
        goto LABEL_28;
      }
      id v30 = [*(id *)(a1 + 32) disk];
      long long v25 = [v30 container];
    }

    if (v25)
    {
      v60[0] = kAPFSVolumeNameKey;
      v32 = [*(id *)(a1 + 32) descriptor];
      v33 = [v32 name];
      v61[0] = v33;
      v61[1] = v18;
      v58 = v18;
      v60[1] = kAPFSVolumeFSIndexKey;
      v60[2] = kAPFSVolumeCaseSensitiveKey;
      v34 = [*(id *)(a1 + 32) descriptor];
      long long v35 = [v34 filesystem];
      unsigned int v36 = [v35 isCaseSensitive];
      id v37 = &__kCFBooleanFalse;
      if (v36) {
        id v37 = &__kCFBooleanTrue;
      }
      v60[3] = kAPFSVolumeCreateSynchronousKey;
      v61[2] = v37;
      v61[3] = &__kCFBooleanTrue;
      v38 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:4];
      v39 = +[NSMutableDictionary dictionaryWithDictionary:v38];

      __int16 v40 = [*(id *)(a1 + 32) descriptor];
      id v41 = [v40 password];

      if (v41)
      {
        v42 = [*(id *)(a1 + 32) descriptor];
        v43 = [v42 password];
        [v39 setObject:v43 forKeyedSubscript:kAPFSVolumeEncryptedKey];
      }
      id v44 = [v25 diskIdentifier];
      [v44 UTF8String];
      uint64_t v45 = APFSVolumeCreate();

      if (v45)
      {
        v46 = sub_10000DD48();
        long long v18 = v58;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          v47 = [*(id *)(a1 + 32) disk];
          *(_DWORD *)buf = 136315394;
          v64 = "-[SKEraseVolume(Daemon) createStateMachineWithError:]_block_invoke";
          __int16 v65 = 2112;
          v66 = v47;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%s: Failed to create volume %@", buf, 0x16u);
        }
        id v17 = +[SKError nilWithOSStatus:v45 error:a2];
      }
      else
      {
        v53 = [SKIOMedia alloc];
        v54 = [v25 diskIdentifier];
        v55 = [(SKIOMedia *)v53 initWithDevName:v54];

        [(SKIOObject *)v55 waitIOKitQuiet];
        v56 = [*(id *)(a1 + 32) progress];
        [v56 setCompletedUnitCount:100];

        id v17 = *(id *)(a1 + 40);
        long long v18 = v58;
      }

      goto LABEL_34;
    }
LABEL_28:
    long long v25 = [*(id *)(a1 + 32) disk];
    v62 = v25;
    v48 = +[NSArray arrayWithObjects:&v62 count:1];
    v49 = +[SKError errorWithCode:117 disks:v48 userInfo:0];
    id v17 = +[SKError nilWithError:v49 error:a2];

LABEL_34:
    goto LABEL_35;
  }
  id v10 = sub_10000DD48();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v64 = "-[SKEraseVolume(Daemon) createStateMachineWithError:]_block_invoke_3";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Failed to sync disk from Daemon", buf, 0xCu);
  }
  id v17 = 0;
LABEL_35:

  return v17;
}

NSDictionary *__cdecl sub_100018898(id a1)
{
  CFStringRef v4 = @"faultCode";
  id v1 = sub_10000DCBC((uint64_t)"SKBaseDiskArbOperation.m", 118);
  unsigned int v5 = v1;
  int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

id sub_100019AEC(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = sub_10000DD48();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    unsigned __int8 v9 = "void _diskArbOperationCallback(DADiskRef, DADissenterRef, void *)";
    __int16 v10 = 2112;
    uint64_t v11 = a1;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: diskRef = %@", (uint8_t *)&v8, 0x16u);
  }

  return [a3 diskArbCallbackWithDissenter:a2];
}

void sub_100019E88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, char a17)
{
}

uint64_t sub_100019EB8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100019EC8(uint64_t a1)
{
}

void sub_100019ED0(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  size_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained[10] finished])
    {
      uint64_t v4 = [v3[9] disk];
      id v5 = v3[7];
      v3[7] = (id)v4;

LABEL_10:
      [v3 finished];
      goto LABEL_11;
    }
    id v8 = v3[10];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id obj = *(id *)(v9 + 40);
    unsigned __int8 v10 = [v8 nextWithError:&obj];
    objc_storeStrong((id *)(v9 + 40), obj);
    if ((v10 & 1) == 0)
    {
      objc_storeStrong(v3 + 6, *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
      goto LABEL_10;
    }
    unsigned int v7 = +[SKDaemonManager sharedManager];
    id v11 = objc_loadWeakRetained(v3 + 12);
    [v7 syncAllDisksWithCompletionBlock:v11];
  }
  else
  {
    id v6 = +[SKBaseManager sharedManager];
    [v6 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_1000492B0];

    unsigned int v7 = sub_10000DD48();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v14 = "-[SKEraseOperation run]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "%s: Failed to get strongref from weakself", buf, 0xCu);
    }
  }

LABEL_11:
}

NSDictionary *__cdecl sub_10001A098(id a1)
{
  CFStringRef v4 = @"faultCode";
  id v1 = sub_10000DCBC((uint64_t)"SKEraseOperation.m", 95);
  id v5 = v1;
  int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

uint64_t start()
{
  id v1 = +[SKDaemon sharedDaemon];
  [v1 startServer];

  int v2 = +[NSRunLoop mainRunLoop];
  [v2 run];

  return 0;
}

void sub_10001B35C(uint64_t a1)
{
  id v3 = +[SKDaemonManager sharedManager];
  id v2 = [v3 _recacheSyncDisk:*(void *)(a1 + 32)];
}

void sub_10001B4D4(id a1)
{
  if (sub_100012110())
  {
    qword_100055AF0 = objc_alloc_init(SKDaemonManager);
    _objc_release_x1();
  }
  else
  {
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &stru_100049318);
  }
}

void sub_10001B540(id a1)
{
  qword_100055AF0 = objc_alloc_init(SKDaemonManager);

  _objc_release_x1();
}

void sub_10001BEA4(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001BF64;
  v6[3] = &unk_100049340;
  id v3 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_semaphore_t v7 = v2;
  id v8 = v4;
  id v5 = v2;
  [v3 dispatchToWorkThread:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t sub_10001BF64(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  dispatch_semaphore_t v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

id sub_10001C078(uint64_t a1, void *a2)
{
  id v4 = sub_10000DD48();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    dispatch_semaphore_t v7 = "void DiskDisappearedCallback(DADiskRef, void *)";
    __int16 v8 = 2112;
    uint64_t v9 = a1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Received DA disappear notification for %@", (uint8_t *)&v6, 0x16u);
  }

  return [a2 _handleDANotificationWithDisk:a1 operation:off_100055A40];
}

id sub_10001C154(uint64_t a1, uint64_t a2, void *a3)
{
  int v6 = sub_10000DD48();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315650;
    uint64_t v9 = "void DiskDescriptionChangedCallback(DADiskRef, CFArrayRef, void *)";
    __int16 v10 = 2112;
    uint64_t v11 = a1;
    __int16 v12 = 2114;
    uint64_t v13 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: Received DA changed notification for %@. Changed keys: %{public}@", (uint8_t *)&v8, 0x20u);
  }

  return [a3 _handleDANotificationWithDisk:a1 operation:off_100055A38];
}

id sub_10001C240(void *a1)
{
  dispatch_semaphore_t v2 = sub_10000DD48();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "void DiskListCompleteCallback(void *)";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Received DA list complete callback", (uint8_t *)&v4, 0xCu);
  }

  return [a1 setDiskListCompleteReceived:1];
}

id sub_10001C2F8(uint64_t a1, void *a2)
{
  int v4 = sub_10000DD48();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    dispatch_semaphore_t v7 = "void DiskAppearedCallback(DADiskRef, void *)";
    __int16 v8 = 2112;
    uint64_t v9 = a1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Received DA appear notification for %@", (uint8_t *)&v6, 0x16u);
  }

  return [a2 _handleDANotificationWithDisk:a1 operation:off_100055A30];
}

void sub_10001C48C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001C51C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001C59C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001CA5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001CBE4(uint64_t a1)
{
  dispatch_semaphore_t v2 = [*(id *)(a1 + 32) rootWholeDisk];
  if (v2)
  {
    id v3 = [(SKDiskResizerBase *)[SKLastPartitionResizer alloc] initWithDisk:v2 requestedSize:*(void *)(a1 + 40)];
    int v4 = sub_10000DD48();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412546;
      __int16 v12 = v2;
      __int16 v13 = 2048;
      unint64_t v14 = [(SKLastPartitionResizer *)v3 currentSize];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Current size of %@: %lld bytes", (uint8_t *)&v11, 0x16u);
    }

    unint64_t v5 = [(SKLastPartitionResizer *)v3 currentSize] & 0xFFF;
    int v6 = [(SKLastPartitionResizer *)v3 currentSize];
    if (v5) {
      int v6 = &v6[-([(SKLastPartitionResizer *)v3 currentSize] & 0xFFF) + 4096];
    }
    unint64_t v7 = [(SKDiskResizerBase *)v3 requestedSize] & 0xFFF;
    __int16 v8 = [(SKDiskResizerBase *)v3 requestedSize];
    if (v7) {
      __int16 v8 = &v8[-([(SKDiskResizerBase *)v3 requestedSize] & 0xFFF) + 4096];
    }
    if (v6 == v8)
    {
      uint64_t v9 = sub_10000DD48();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315138;
        __int16 v12 = "-[SKDaemonManager performVMDiskResizeWithSize:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Disk was already resized", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      id v10 = [*(id *)(a1 + 32) resize:v2 toSize:*(void *)(a1 + 40) completionBlock:&stru_100049388];
    }
  }
}

void sub_10001CDC4(id a1, NSError *a2)
{
  dispatch_semaphore_t v2 = a2;
  id v3 = sub_10000DD48();
  int v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      id v10 = "-[SKDaemonManager performVMDiskResizeWithSize:]_block_invoke";
      __int16 v11 = 2112;
      __int16 v12 = v2;
      unint64_t v5 = "%s: VM disk resize failed: %@, shutting down";
      int v6 = v4;
      os_log_type_t v7 = OS_LOG_TYPE_ERROR;
      uint32_t v8 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[SKDaemonManager performVMDiskResizeWithSize:]_block_invoke";
    unint64_t v5 = "%s: VM disk resized successfully, shutting down";
    int v6 = v4;
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    uint32_t v8 = 12;
    goto LABEL_6;
  }

  reboot3();
}

uint64_t sub_10001CFD4(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 48) = +[NSDate date];

  return _objc_release_x1();
}

id sub_10001D028(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001D098;
  v3[3] = &unk_100048B88;
  v3[4] = v1;
  return [v1 dispatchToWorkThread:v3];
}

id sub_10001D098(uint64_t a1)
{
  return [*(id *)(a1 + 32) _diskQueueHeartbeat];
}

void sub_10001D43C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

double sub_10001D484(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) timeIntervalSinceNow];
  double result = -v2;
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

id sub_10001D4C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _diskQueueWatchdog];
}

void sub_10001D654(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D810(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001DA4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001DA70(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001DA80(uint64_t a1)
{
}

uint64_t sub_10001DA88(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _processDiskNotificationsForMap:*(void *)(a1 + 40) isCompleteDiskList:0];

  return _objc_release_x1();
}

void sub_10001DDE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001DE78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10001E05C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10001E0FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001E790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_10001E7C8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _processDiskNotificationsForMap:*(void *)(a1 + 40) isCompleteDiskList:0];

  return _objc_release_x1();
}

uint64_t sub_10001E990(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _fullRecacheWithDisks:*(void *)(a1 + 40) options:*(void *)(a1 + 56)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    int v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_10001EB70(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  int v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  int v6 = sub_10001EC20;
  os_log_type_t v7 = &unk_100048EE8;
  uint32_t v8 = v2;
  id v9 = *(id *)(a1 + 40);
  [v2 dispatchToWorkThread:&v4];
  id v3 = [*(id *)(a1 + 40) finishedSemaphore:v4, v5, v6, v7, v8];
  dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
}

void *sub_10001EC20(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 88) count];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v2 && !*(void *)(v3 + 96))
  {
    int v4 = sub_10000DD48();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315394;
      id v17 = "-[SKDaemonManager _scheduleOperation:]_block_invoke_2";
      __int16 v18 = 2112;
      uint64_t v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Scheduling operation: %@", buf, 0x16u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
    uint64_t v6 = +[NSDate date];
    uint64_t v7 = *(void *)(a1 + 32);
    uint32_t v8 = *(void **)(v7 + 48);
    *(void *)(v7 + 48) = v6;

    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001EE4C;
    block[3] = &unk_100048B88;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
    dispatch_time_t v10 = dispatch_time(0, 15000000000);
    uint64_t v11 = *(void *)(a1 + 32);
    __int16 v12 = *(NSObject **)(v11 + 40);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_10001EEC4;
    v14[3] = &unk_100048B88;
    v14[4] = v11;
    dispatch_after(v10, v12, v14);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  [*(id *)(v3 + 88) addObject:*(void *)(a1 + 40)];
  uint64_t result = *(void **)(a1 + 32);
  if (!result[12]) {
    return [result _advanceOperationQueueOnWorkQueue];
  }
  return result;
}

id sub_10001EE4C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001EEBC;
  v3[3] = &unk_100048B88;
  v3[4] = v1;
  return [v1 dispatchToWorkThread:v3];
}

id sub_10001EEBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _diskQueueHeartbeat];
}

id sub_10001EEC4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _diskQueueWatchdog];
}

id sub_10001EF38(uint64_t a1)
{
  return [*(id *)(a1 + 32) _advanceOperationQueueOnWorkQueue];
}

void sub_10001F474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10001F608(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001F788(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10001F9F4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  int v4 = [v2 visibleDiskRoles];
  uint64_t v5 = [v3 objectForKey:@"role"];

  id v6 = [v4 containsObject:v5];
  return v6;
}

id sub_10001FB70(uint64_t a1)
{
  id v2 = sub_10000DD48();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Timeout waiting for DA idle", v4, 2u);
  }

  return [*(id *)(a1 + 32) _idleCallback];
}

void sub_10001FDA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001FDBC(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 112);
  objc_sync_enter(v2);
  id v3 = [*(id *)(*(void *)(a1 + 32) + 112) count];
  objc_sync_exit(v2);

  char v4 = *(unsigned char *)(a1 + 40);
  if (!v3)
  {
    if (!*(unsigned char *)(a1 + 40)) {
      goto LABEL_5;
    }
    char v4 = 1;
  }
  uint64_t v5 = *(void **)(a1 + 32);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100020028;
  v20[3] = &unk_1000494C8;
  char v21 = v4;
  void v20[4] = v5;
  v20[5] = v3;
  [v5 dispatchSyncToWorkThread:v20];
LABEL_5:
  id v6 = [*(id *)(a1 + 32) syncAllDisksSemaphores];
  BOOL v7 = [v6 count] == 0;

  if (!v7)
  {
    uint32_t v8 = sub_10000DD48();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_time_t v9 = [*(id *)(a1 + 32) syncAllDisksSemaphores];
      unsigned int v10 = [v9 count];
      *(_DWORD *)buf = 136315394;
      long long v24 = "-[SKDaemonManager _idleCallback]_block_invoke";
      __int16 v25 = 1024;
      unsigned int v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Notifying %u client(s)", buf, 0x12u);
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v11 = [*(id *)(a1 + 32) syncAllDisksSemaphores];
    id v12 = [v11 countByEnumeratingWithState:&v16 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v17;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v11);
          }
          dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((void *)&v16 + 1) + 8 * i));
        }
        id v12 = [v11 countByEnumeratingWithState:&v16 objects:v22 count:16];
      }
      while (v12);
    }

    id v15 = [*(id *)(a1 + 32) syncAllDisksSemaphores];
    [v15 removeAllObjects];
  }
}

void sub_10002000C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100020028(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100020168;
  v6[3] = &unk_1000494A0;
  void v6[4] = v2;
  char v7 = *(unsigned char *)(a1 + 48);
  [v2 dispatchSyncToEjectThread:v6];
  id v3 = sub_10000DD48();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (*(unsigned char *)(a1 + 48)) {
      CFStringRef v5 = @" (complete disk list)";
    }
    else {
      CFStringRef v5 = &stru_10004A7A8;
    }
    *(_DWORD *)buf = 136315650;
    dispatch_time_t v9 = "-[SKDaemonManager _idleCallback]_block_invoke_2";
    __int16 v10 = 1024;
    int v11 = v4;
    __int16 v12 = 2112;
    CFStringRef v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: %u DA notification(s) handled%@", buf, 0x1Cu);
  }
}

id sub_100020168(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processDiskNotificationsWithCompleteDiskList:*(unsigned __int8 *)(a1 + 40)];
}

void sub_100020408(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100020858(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 32) + 96) dmAsyncFinishedForDisk:*(void *)(a1 + 48) mainError:*(unsigned int *)(a1 + 56) detailError:*(unsigned int *)(a1 + 60) dictionary:*(void *)(a1 + 40)];
  }
  id v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

void sub_100020984(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = [*(id *)(a1 + 32) diskArbCallbacksQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100020A5C;
  v9[3] = &unk_100048EE8;
  v9[4] = *(void *)(a1 + 32);
  dispatch_semaphore_t v10 = v2;
  uint64_t v4 = v2;
  dispatch_async(v3, v9);

  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v5, v6, v7, v8);
}

void sub_100020A5C(uint64_t a1)
{
  dispatch_semaphore_t v2 = [*(id *)(a1 + 32) notificationsSyncQueue];
  uint64_t v4 = _NSConcreteStackBlock;
  uint64_t v5 = 3221225472;
  uint64_t v6 = sub_100020B48;
  uint64_t v7 = &unk_100048EE8;
  id v3 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v3;
  dispatch_async(v2, &v4);

  DAUnregisterCallback(*(DASessionRef *)(*(void *)(a1 + 32) + 72), j__objc_msgSend__idleCallback, *(void **)(a1 + 32));
  DARegisterIdleCallback();
  [*(id *)(a1 + 32) startForceIdleTimer:v4, v5, v6, v7, v8];
}

void sub_100020B48(uint64_t a1)
{
  dispatch_semaphore_t v2 = [*(id *)(a1 + 32) syncAllDisksSemaphores];
  [v2 addObject:*(void *)(a1 + 40)];

  id v3 = sub_10000DD48();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) syncAllDisksSemaphores];
    int v5 = 136315394;
    uint64_t v6 = "-[SKDaemonManager syncAllDisksWithCompletionBlock:]_block_invoke_3";
    __int16 v7 = 1024;
    unsigned int v8 = [v4 count];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: %d client(s) are now waiting for idle", (uint8_t *)&v5, 0x12u);
  }
}

uint64_t sub_100020CC8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100020D9C(uint64_t a1)
{
  memset(&v9, 0, sizeof(v9));
  if (!fstatat(-2, (const char *)[*(id *)(a1 + 32) fileSystemRepresentation], &v9, 544))
  {
    if (devname_r(v9.st_dev, 0x6000u, (char *)buf, 1024))
    {
      __int16 v7 = DADiskCreateFromBSDName(0, *(DASessionRef *)(*(void *)(a1 + 40) + 72), (const char *)buf);
      if (v7)
      {
        uint64_t v6 = [*(id *)(a1 + 40) _diskWithDADisk:v7];
LABEL_11:

        goto LABEL_12;
      }
    }
    else
    {
      __int16 v7 = sub_10000DD48();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)dispatch_semaphore_t v10 = 136315394;
        int v11 = "-[SKDaemonManager diskForPath:withCallbackBlock:]_block_invoke";
        __int16 v12 = 2112;
        uint64_t v13 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Can't get BSD name for %@", v10, 0x16u);
      }
    }
    uint64_t v6 = 0;
    goto LABEL_11;
  }
  int v2 = *__error();
  id v3 = sub_10000DD48();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = strerror(v2);
    *(_DWORD *)buf = 136315650;
    id v15 = "-[SKDaemonManager diskForPath:withCallbackBlock:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    __int16 v18 = 2080;
    long long v19 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: fstatat of %@ failed: %s", buf, 0x20u);
  }

  uint64_t v6 = 0;
LABEL_12:
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100021128(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) wholeDiskForDisk:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10002124C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isWholeDisk])
  {
    id v2 = [*(id *)(a1 + 32) privateCache];
    id v9 = [v2 sortedChildren];

    id v3 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v9 count]);
    if ([v9 count])
    {
      unint64_t v4 = 0;
      do
      {
        int v5 = *(void **)(a1 + 40);
        uint64_t v6 = [v9 objectAtIndexedSubscript:v4];
        __int16 v7 = [v5 _diskWithDADisk:v6];

        [v3 addObject:v7];
        ++v4;
      }
      while ((unint64_t)[v9 count] > v4);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v8();
  }
}

void sub_100021430(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) lastOperationName];
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, v2 != 0);
}

BOOL sub_100021514(id a1, SKFilesystem *a2, NSDictionary *a3)
{
  return [(SKFilesystem *)a2 shouldShow];
}

uint64_t sub_100022B60(uint64_t a1, void *a2)
{
  return 0;
}

uint64_t sub_100023DB8(uint64_t a1)
{
  if (a1) {
    unsigned int v1 = 1;
  }
  else {
    unsigned int v1 = 16;
  }
  if (a1 == 1) {
    return 8;
  }
  else {
    return v1;
  }
}

uint64_t sub_100023DD4(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:kSKDiskTypeGPTWholeDisk])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:kSKDiskTypeMBRWholeDisk])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:kSKDiskTypeAPMWholeDisk])
  {
    uint64_t v2 = 1;
  }
  else
  {
    uint64_t v2 = 512;
  }

  return v2;
}

NSDictionary *__cdecl sub_100023F9C(id a1)
{
  CFStringRef v4 = @"faultCode";
  id v1 = sub_10000DCBC((uint64_t)"SKPartitionTable.m", 67);
  int v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_1000248E8(id a1)
{
  CFStringRef v4 = @"faultCode";
  id v1 = sub_10000DCBC((uint64_t)"SKPartitionTable.m", 141);
  int v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_100024998(id a1)
{
  CFStringRef v4 = @"faultCode";
  id v1 = sub_10000DCBC((uint64_t)"SKPartitionTable.m", 149);
  int v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_100024DCC(id a1)
{
  CFStringRef v4 = @"faultCode";
  id v1 = sub_10000DCBC((uint64_t)"SKPartitionTable.m", 180);
  int v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

NSDictionary *__cdecl sub_100024E7C(id a1)
{
  CFStringRef v4 = @"faultCode";
  id v1 = sub_10000DCBC((uint64_t)"SKPartitionTable.m", 187);
  int v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

void sub_1000265D8(id a1)
{
  id v1 = sub_10000DD48();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    id v3 = "-[SKRemoteAPFSFormatTask initWithName:disk:caseSensitive:password:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%s: Connection to fsrunner interrupted", (uint8_t *)&v2, 0xCu);
  }
}

void sub_100026680(id a1)
{
  id v1 = sub_10000DD48();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    id v3 = "-[SKRemoteAPFSFormatTask initWithName:disk:caseSensitive:password:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%s: Connection to fsrunner invalidated", (uint8_t *)&v2, 0xCu);
  }
}

void sub_1000269CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_1000269F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100026A00(uint64_t a1)
{
}

void sub_100026A08(uint64_t a1, void *a2)
{
}

void sub_100026A18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_semaphore_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

NSDictionary *__cdecl sub_100027040(id a1)
{
  CFStringRef v4 = @"faultCode";
  id v1 = sub_10000DCBC((uint64_t)"SKFilesystemMaintainer.m", 204);
  id v5 = v1;
  int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

id sub_100027820(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  uint64_t v15 = 0;
  uint64_t v9 = 0;
  dispatch_semaphore_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = sub_1000269F0;
  uint64_t v13 = sub_100026A00;
  id v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100027964;
  v8[3] = &unk_100049720;
  v8[4] = &v9;
  id v6 = +[FSTaskOptionsBundle bundleForArguments:&v15 count:0 extension:v5 operationType:a2 errorHandler:v8];
  if (a3) {
    *a3 = (id) v10[5];
  }
  _Block_object_dispose(&v9, 8);

  return v6;
}

void sub_10002794C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027964(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFStringRef v4 = sub_10000DD48();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "FSTaskOptionsBundle *createOptionsBundle(NSString *__strong, FSTaskType, NSError *__autoreleasing *)_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s: Error in creating options bundle %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void sub_1000281CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028418(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = sub_10000DD48();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v15 = "-[SKFilesystemMaintainer createReceiverUsingFSKit:opts:taskGroup:writable:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s: Failed to perform maintenance with %@", buf, 0x16u);
    }

    uint64_t v8 = [*(id *)(a1 + 32) msgHandler];
    [v8 setError:v6];
  }
  __int16 v9 = [*(id *)(a1 + 40) client];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000285A8;
  v11[3] = &unk_100049748;
  id v10 = *(void **)(a1 + 48);
  v11[4] = *(void *)(a1 + 40);
  id v12 = v10;
  id v13 = *(id *)(a1 + 56);
  [v9 getFSProgressForTask:v5 replyHandler:v11];
}

void sub_1000285A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = [*(id *)(a1 + 32) progress];
    uint64_t v8 = [v5 progress];
    __int16 v9 = [*(id *)(a1 + 32) disks];
    [v7 addChild:v8 withPendingUnitCount:0x64 / [v9 count]];
  }
  if (v6)
  {
    id v10 = [*(id *)(a1 + 32) progress];
    uint64_t v11 = [*(id *)(a1 + 32) disks];
    id v12 = +[SKProgress progressWithTotalUnitCount:](SKProgress, "progressWithTotalUnitCount:", 0x64 / (unint64_t)[v11 count]);
    [v10 addChild:v12 withPendingUnitCount:0];

    id v13 = sub_10000DD48();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      int v15 = 136315650;
      __int16 v16 = "-[SKFilesystemMaintainer createReceiverUsingFSKit:opts:taskGroup:writable:]_block_invoke";
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s: Failed to get progress for %@, %@", (uint8_t *)&v15, 0x20u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

BOOL sub_100028DD0(id a1, SKDisk *a2, NSDictionary *a3)
{
  id v3 = [(SKDisk *)a2 filesystem];
  BOOL v4 = v3 == 0;

  return v4;
}

NSArray *__cdecl sub_10002903C(id a1, SKDisk *a2, id *a3)
{
  id v3 = a2;
  unsigned int v4 = [(SKDisk *)v3 isWritable];
  id v5 = [(SKDisk *)v3 filesystem];
  uint64_t v6 = [v5 verificationArgs];
  int v7 = (void *)v6;
  if (v4)
  {
    v13[0] = v6;
    uint64_t v8 = [(SKDisk *)v3 filesystem];
    __int16 v9 = [v8 liveVerificationArgs];
    v13[1] = v9;
    id v10 = +[NSArray arrayWithObjects:v13 count:2];
  }
  else
  {
    uint64_t v12 = v6;
    id v10 = +[NSArray arrayWithObjects:&v12 count:1];
  }

  return (NSArray *)v10;
}

NSArray *__cdecl sub_100029558(id a1, SKDisk *a2, id *a3)
{
  unsigned int v4 = a2;
  uint64_t v15 = kSKDiskMountOptionRecursive;
  __int16 v16 = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  LOBYTE(a3) = [(SKDisk *)v4 unmountWithOptions:v5 error:a3];

  if (a3)
  {
    uint64_t v6 = [(SKDisk *)v4 filesystem];
    int v7 = [v6 repairArgs];
    id v10 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    uint64_t v6 = sub_10000DD48();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v12 = "-[SKFilesystemMaintainer repairWithError:]_block_invoke";
      __int16 v13 = 2112;
      uint64_t v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s: Failed to unmount disk %@ for repair", buf, 0x16u);
    }
    uint64_t v8 = 0;
  }

  return (NSArray *)v8;
}

void sub_100029964(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002997C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = sub_10000DD48();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __int16 v9 = [v5 taskID];
      *(_DWORD *)buf = 136315906;
      unsigned int v23 = "-[SKFilesystemCreator setupTaskUpdateHandlerWithClient:taskPairs:error:]_block_invoke";
      __int16 v24 = 2112;
      __int16 v25 = v9;
      __int16 v26 = 1024;
      unsigned int v27 = [v5 taskState];
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Task update %@ received, state %d, error: %@", buf, 0x26u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v5 taskID];
    *(_DWORD *)buf = 136315650;
    unsigned int v23 = "-[SKFilesystemCreator setupTaskUpdateHandlerWithClient:taskPairs:error:]_block_invoke";
    __int16 v24 = 2112;
    __int16 v25 = v10;
    __int16 v26 = 1024;
    unsigned int v27 = [v5 taskState];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: Task update %@ received, state %d", buf, 0x1Cu);
  }
  if ([v5 taskState] == 3)
  {
    id v11 = *(id *)(a1 + 32);
    objc_sync_enter(v11);
    uint64_t v12 = *(void **)(a1 + 32);
    __int16 v13 = [v5 taskID];
    uint64_t v14 = +[NSPredicate predicateWithFormat:@"msgHandler.taskID == %@", v13];
    uint64_t v15 = [v12 filteredArrayUsingPredicate:v14];

    if ([v15 count] == (id)1)
    {
      __int16 v16 = [v15 firstObject];
      __int16 v17 = [v16 msgHandler];
      uint64_t v18 = [v17 group];
      dispatch_group_leave(v18);
    }
    else
    {
      __int16 v19 = +[SKBaseManager sharedManager];
      [v19 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&stru_100049830];

      __int16 v16 = sub_10000DD48();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        id v20 = [v5 taskID];
        unsigned int v21 = [v15 count];
        *(_DWORD *)buf = 136315650;
        unsigned int v23 = "-[SKFilesystemCreator setupTaskUpdateHandlerWithClient:taskPairs:error:]_block_invoke_2";
        __int16 v24 = 2112;
        __int16 v25 = v20;
        __int16 v26 = 1024;
        unsigned int v27 = v21;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "%s: Task %@ completed, matching tasks: %d", buf, 0x1Cu);
      }
    }

    objc_sync_exit(v11);
  }
}

void sub_100029CA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

NSDictionary *__cdecl sub_100029CCC(id a1)
{
  CFStringRef v4 = @"faultCode";
  id v1 = sub_10000DCBC((uint64_t)"SKFilesystemMaintainer.m", 685);
  id v5 = v1;
  int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return (NSDictionary *)v2;
}

void sub_100029D7C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = sub_10000DD48();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      int v7 = "-[SKFilesystemCreator setupTaskUpdateHandlerWithClient:taskPairs:error:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s: Failed setting task update handler: %@", (uint8_t *)&v6, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002A8BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002A8D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = sub_10000DD48();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "-[SKFilesystemCreator createWithVolumes:error:]_block_invoke";
    __int16 v20 = 2112;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: Reached reply of task %@", buf, 0x16u);
  }

  __int16 v8 = [*(id *)(a1 + 32) msgHandler];
  [v8 setTaskID:v5];

  if (v6)
  {
    id v9 = sub_10000DD48();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "-[SKFilesystemCreator createWithVolumes:error:]_block_invoke";
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Failed to format: %@", buf, 0x16u);
    }

    id v10 = [*(id *)(a1 + 32) msgHandler];
    [v10 completed:v6 replyHandler:&stru_1000498C0];
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002AAD8;
    v15[3] = &unk_100049748;
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = *(void **)(a1 + 56);
    v15[4] = *(void *)(a1 + 48);
    id v13 = v12;
    uint64_t v14 = *(void *)(a1 + 64);
    id v16 = v13;
    uint64_t v17 = v14;
    [v11 getFSProgressForTask:v5 replyHandler:v15];
  }
}

void sub_10002AAD8(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    int v7 = [a1[4] progress];
    __int16 v8 = [v5 progress];
    [v7 addChild:v8 withPendingUnitCount:0x64 / [a1[5] count]];
  }
  if (v6)
  {
    id v9 = [a1[4] progress];
    id v10 = +[SKProgress progressWithTotalUnitCount:0];
    [v9 addChild:v10 withPendingUnitCount:0x64 / [a1[5] count]];

    id v11 = sub_10000DD48();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [a1[6] disk];
      int v13 = 136315650;
      uint64_t v14 = "-[SKFilesystemCreator createWithVolumes:error:]_block_invoke_2";
      __int16 v15 = 2112;
      id v16 = v12;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s: Failed to get progress for %@, %@", (uint8_t *)&v13, 0x20u);
    }
  }
}

void sub_10002AC70(uint64_t a1, void *a2)
{
  if (a2)
  {
    int v2 = *(void **)(a1 + 32);
    id v3 = a2;
    id v4 = [v2 progress];
    [v4 setLocalizedAdditionalDescription:v3];
  }
}

void sub_10002ACD8(uint64_t a1, void *a2)
{
  if (a2)
  {
    int v2 = *(void **)(a1 + 32);
    id v3 = a2;
    id v4 = [v2 progress];
    [v4 setLocalizedAdditionalDescription:v3];
  }
}

void sub_10002BC84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002BDD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002BF1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002BFE0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002C334(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) childrenOperations];
  id v3 = [v4 objectAtIndexedSubscript:*(void *)(a1 + 48)];
  [v2 _processNotificationWithDiskOperation:v3];
}

void sub_10002C754(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  id v5 = [v2 notificationsCache];
  id v3 = [v5 disksToProcess];
  id v4 = [v3 objectAtIndexedSubscript:*(void *)(a1 + 40)];
  [v2 _processNotificationsWithDiskOperations:v4];
}

void sub_10002D1CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002D4F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

id sub_10002E498(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) callbackBlock];
  v2[2](v2, 0);

  id v3 = *(void **)(a1 + 32);

  return [v3 finished];
}

void sub_10002E8FC(uint64_t a1, void *a2)
{
  id v3 = [a2 userInfo];
  [v3 removeObserver:*(void *)(a1 + 32) forKeyPath:_NSProgressRemoteLocalizedAdditionalDescriptionKey];
}

void sub_10002F5D0(uint64_t a1)
{
  int v2 = sub_10000DD48();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    id v6 = "-[SKLastPartitionResizer fsResize:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Cancelling APFS resize", (uint8_t *)&v5, 0xCu);
  }

  id v3 = [*(id *)(a1 + 32) resizablePart];
  id v4 = [v3 diskIdentifier];
  [v4 UTF8String];
  APFSCancelContainerResize();
}

uint64_t _deleteVolumeGroup(void *a1, void *a2, uint64_t a3, NSObject **a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  [v10 UTF8String];
  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:a3];
  v32 = 0;
  uint64_t Volumes = APFSContainerVolumeGroupGetVolumes();
  if (Volumes)
  {
    uint64_t v13 = Volumes;
    uint64_t v14 = sub_10000DD48();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      long long v35 = "OSStatus _deleteVolumeGroup(NSString *__strong, NSString *__strong, unsigned char *, NSMutableArray<NSNumber"
            " *> *__autoreleasing *, NSString *__autoreleasing *)";
      __int16 v36 = 2114;
      *(void *)id v37 = v11;
      *(_WORD *)&v37[8] = 1024;
      *(_DWORD *)&v37[10] = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Failed to get volumes in group %{public}@, res=%d", buf, 0x1Cu);
    }
  }
  else
  {
    uint64_t v14 = v32;
    __int16 v15 = sub_10000DD48();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      long long v35 = "OSStatus _deleteVolumeGroup(NSString *__strong, NSString *__strong, unsigned char *, NSMutableArray<NSNumber"
            " *> *__autoreleasing *, NSString *__autoreleasing *)";
      __int16 v36 = 1024;
      *(_DWORD *)id v37 = [v32 count];
      *(_WORD *)&v37[4] = 2114;
      *(void *)&v37[6] = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: There are %d volumes in group %{public}@", buf, 0x1Cu);
    }

    if ([v32 count] == (id)2)
    {
      uint64_t v16 = APFSContainerVolumeGroupRemove();
      if (v16)
      {
        uint64_t v13 = v16;
        __int16 v17 = sub_10000DD48();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315906;
          long long v35 = "OSStatus _deleteVolumeGroup(NSString *__strong, NSString *__strong, unsigned char *, NSMutableArray<NSNu"
                "mber *> *__autoreleasing *, NSString *__autoreleasing *)";
          __int16 v36 = 2114;
          *(void *)id v37 = v11;
          *(_WORD *)&v37[8] = 2114;
          *(void *)&v37[10] = v10;
          __int16 v38 = 1024;
          int v39 = v13;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s: Failed to remove volume group %{public}@ from %{public}@, res = %d", buf, 0x26u);
        }
      }
      else
      {
        unsigned int v27 = a4;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v18 = v32;
        id v19 = [v18 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v29;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v29 != v21) {
                objc_enumerationMutation(v18);
              }
              id v23 = [objc_alloc((Class)NSString) initWithFormat:@"%@s%@", v10, *(void *)(*((void *)&v28 + 1) + 8 * i)];
              if (([v23 isEqualToString:v9] & 1) == 0)
              {
                id v24 = v23;
                *a5 = v24;

                goto LABEL_22;
              }
            }
            id v20 = [v18 countByEnumeratingWithState:&v28 objects:v33 count:16];
            if (v20) {
              continue;
            }
            break;
          }
        }
LABEL_22:

        __int16 v25 = sub_10000DD48();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          long long v35 = "OSStatus _deleteVolumeGroup(NSString *__strong, NSString *__strong, unsigned char *, NSMutableArray<NSNu"
                "mber *> *__autoreleasing *, NSString *__autoreleasing *)";
          __int16 v36 = 2114;
          *(void *)id v37 = v11;
          *(_WORD *)&v37[8] = 2114;
          *(void *)&v37[10] = v10;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: Volume group %{public}@ removed from %{public}@", buf, 0x20u);
        }

        uint64_t v14 = v18;
        uint64_t v13 = 0;
        *unsigned int v27 = v14;
      }
    }
    else
    {
      uint64_t v13 = 0;
    }
  }

  return v13;
}

uint64_t SK_DM_APFSUtils_deleteVolume(void *a1)
{
  id v1 = a1;
  v26[0] = 0;
  v26[1] = 0;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  int v2 = [v1 substringFromIndex:4];
  id v3 = [v2 componentsSeparatedByString:@"s"];

  if ((unint64_t)[v3 count] < 2)
  {
    int v5 = 0;
  }
  else
  {
    id v4 = [v3 objectAtIndexedSubscript:0];
    int v5 = +[NSString stringWithFormat:@"disk%@", v4];
  }
  id v6 = v1;
  id v7 = [v6 UTF8String];
  id v8 = v5;
  id v9 = [v8 UTF8String];
  uint64_t v10 = 22;
  if (v7 && v9)
  {
    int v11 = APFSGetVolumeGroupID();
    id v12 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:v26];
    uint64_t v13 = sub_10000DD48();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      __int16 v17 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
      __int16 v18 = 2114;
      id v19 = v6;
      __int16 v20 = 2114;
      id v21 = v12;
      __int16 v22 = 1024;
      int v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Volume %{public}@, group %{public}@ (get volume group res = %d)", buf, 0x26u);
    }

    uint64_t v10 = APFSVolumeDelete();
    uint64_t v14 = sub_10000DD48();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v17 = "OSStatus SK_DM_APFSUtils_deleteVolume(NSString *__strong)";
      __int16 v18 = 2114;
      id v19 = v6;
      __int16 v20 = 1024;
      LODWORD(v21) = v10;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: Delete of APFS volume %{public}@ returned %d", buf, 0x1Cu);
    }
  }
  return v10;
}

void sub_1000302EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void SK_DM_updateFileVaultProperties(void *a1, char a2)
{
  id v3 = a1;
  +[SKDaemonManager sharedManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000303DC;
  v6[3] = &unk_100049988;
  char v9 = a2;
  id v7 = v3;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = v8;
  id v5 = v3;
  [v4 dispatchToWorkThread:v6];
}

void sub_1000303DC(uint64_t a1)
{
  int v2 = sub_10000DD48();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 48);
    *(_DWORD *)buf = 136315650;
    __int16 v38 = "void SK_DM_updateFileVaultProperties(NSString *__strong, BOOL)_block_invoke";
    __int16 v39 = 2114;
    uint64_t v40 = v3;
    __int16 v41 = 1024;
    int v42 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Updating FileVault property of %{public}@ (and group members) to %d", buf, 0x1Cu);
  }

  id v5 = [*(id *)(a1 + 40) _cachedDiskWithDiskIdentifier:*(void *)(a1 + 32)];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    id v7 = [v6 container];
    if (v7)
    {
      id v8 = [v6 apfsVolumeGroupUUID];
      char v9 = objc_opt_new();
      uint64_t v10 = v9;
      if (v8)
      {
        id v25 = v6;
        __int16 v26 = v5;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        uint64_t v24 = v7;
        int v11 = [v7 volumes];
        id v12 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v32;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v32 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              __int16 v17 = [v16 apfsVolumeGroupUUID];
              unsigned int v18 = [v8 isEqual:v17];

              if (v18) {
                [v10 addObject:v16];
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v31 objects:v36 count:16];
          }
          while (v13);
        }

        id v6 = v25;
        id v5 = v26;
        id v7 = v24;
      }
      else
      {
        [v9 addObject:v6];
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v19 = v10;
      id v20 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v28;
        do
        {
          for (j = 0; j != v21; j = (char *)j + 1)
          {
            if (*(void *)v28 != v22) {
              objc_enumerationMutation(v19);
            }
            [*(id *)(*((void *)&v27 + 1) + 8 * (void)j) setDefaultEffaceable:*(unsigned char *)(a1 + 48) == 0];
          }
          id v21 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v21);
      }

      [*(id *)(a1 + 40) _disksChanged:v19];
    }
  }
}

void sub_1000306C8()
{
}

void sub_1000306F4()
{
  __assert_rtn("+[SKStateTransitionTable tableWithTransitionEntries:selectorTarget:]", "SKStateMachine.m", 83, "events[entry.event] == nil");
}

uint64_t APFSCancelContainerResize()
{
  return _APFSCancelContainerResize();
}

uint64_t APFSContainerResize()
{
  return _APFSContainerResize();
}

uint64_t APFSContainerVolumeGroupAdd()
{
  return _APFSContainerVolumeGroupAdd();
}

uint64_t APFSContainerVolumeGroupGet()
{
  return _APFSContainerVolumeGroupGet();
}

uint64_t APFSContainerVolumeGroupGetVolumes()
{
  return _APFSContainerVolumeGroupGetVolumes();
}

uint64_t APFSContainerVolumeGroupRemove()
{
  return _APFSContainerVolumeGroupRemove();
}

uint64_t APFSContainerWipeVolumeKeys()
{
  return _APFSContainerWipeVolumeKeys();
}

uint64_t APFSExtendedSpaceInfo()
{
  return _APFSExtendedSpaceInfo();
}

uint64_t APFSGetVolumeGroupID()
{
  return _APFSGetVolumeGroupID();
}

uint64_t APFSVolumeCreate()
{
  return _APFSVolumeCreate();
}

uint64_t APFSVolumeDelete()
{
  return _APFSVolumeDelete();
}

uint64_t APFSVolumeGetVEKState()
{
  return _APFSVolumeGetVEKState();
}

uint64_t APFSVolumeRole()
{
  return _APFSVolumeRole();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t CacheDeleteCopyPurgeableSpaceWithInfo()
{
  return _CacheDeleteCopyPurgeableSpaceWithInfo();
}

CFDictionaryRef DADiskCopyDescription(DADiskRef disk)
{
  return _DADiskCopyDescription(disk);
}

io_service_t DADiskCopyIOMedia(DADiskRef disk)
{
  return _DADiskCopyIOMedia(disk);
}

DADiskRef DADiskCopyWholeDisk(DADiskRef disk)
{
  return _DADiskCopyWholeDisk(disk);
}

DADiskRef DADiskCreateFromBSDName(CFAllocatorRef allocator, DASessionRef session, const char *name)
{
  return _DADiskCreateFromBSDName(allocator, session, name);
}

DADiskRef DADiskCreateFromIOMedia(CFAllocatorRef allocator, DASessionRef session, io_service_t media)
{
  return _DADiskCreateFromIOMedia(allocator, session, media);
}

DADiskRef DADiskCreateFromVolumePath(CFAllocatorRef allocator, DASessionRef session, CFURLRef path)
{
  return _DADiskCreateFromVolumePath(allocator, session, path);
}

void DADiskEject(DADiskRef disk, DADiskEjectOptions options, DADiskEjectCallback callback, void *context)
{
}

const char *__cdecl DADiskGetBSDName(DADiskRef disk)
{
  return _DADiskGetBSDName(disk);
}

void DADiskMountWithArguments(DADiskRef disk, CFURLRef path, DADiskMountOptions options, DADiskMountCallback callback, void *context, CFStringRef *arguments)
{
}

void DADiskRename(DADiskRef disk, CFStringRef name, DADiskRenameOptions options, DADiskRenameCallback callback, void *context)
{
}

void DADiskUnmount(DADiskRef disk, DADiskUnmountOptions options, DADiskUnmountCallback callback, void *context)
{
}

uint64_t DADissenterGetProcessID()
{
  return _DADissenterGetProcessID();
}

DAReturn DADissenterGetStatus(DADissenterRef dissenter)
{
  return _DADissenterGetStatus(dissenter);
}

CFStringRef DADissenterGetStatusString(DADissenterRef dissenter)
{
  return _DADissenterGetStatusString(dissenter);
}

void DARegisterDiskAppearedCallback(DASessionRef session, CFDictionaryRef match, DADiskAppearedCallback callback, void *context)
{
}

void DARegisterDiskDescriptionChangedCallback(DASessionRef session, CFDictionaryRef match, CFArrayRef watch, DADiskDescriptionChangedCallback callback, void *context)
{
}

void DARegisterDiskDisappearedCallback(DASessionRef session, CFDictionaryRef match, DADiskDisappearedCallback callback, void *context)
{
}

uint64_t DARegisterDiskListCompleteCallback()
{
  return _DARegisterDiskListCompleteCallback();
}

uint64_t DARegisterIdleCallback()
{
  return _DARegisterIdleCallback();
}

DASessionRef DASessionCreate(CFAllocatorRef allocator)
{
  return _DASessionCreate(allocator);
}

uint64_t DASessionKeepAlive()
{
  return _DASessionKeepAlive();
}

void DASessionSetDispatchQueue(DASessionRef session, dispatch_queue_t queue)
{
}

void DAUnregisterCallback(DASessionRef session, void *callback, void *context)
{
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return _IOBSDNameMatching(mainPort, options, bsdName);
}

uint64_t IOEngineInitialize()
{
  return _IOEngineInitialize();
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return _IOIteratorIsValid(iterator);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return _IOObjectCopyClass(object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return _IORegistryEntryCreateIterator(entry, plane, options, iterator);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryIteratorExitEntry(io_iterator_t iterator)
{
  return _IORegistryIteratorExitEntry(iterator);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceWaitQuiet(io_service_t service, mach_timespec_t *waitTime)
{
  return _IOServiceWaitQuiet(service, waitTime);
}

uint64_t MKCFBuildPartition()
{
  return _MKCFBuildPartition();
}

uint64_t MKCFCreateFSInfo()
{
  return _MKCFCreateFSInfo();
}

uint64_t MKCFCreateMap()
{
  return _MKCFCreateMap();
}

uint64_t MKCFCreateMedia()
{
  return _MKCFCreateMedia();
}

uint64_t MKCFDisposeMedia()
{
  return _MKCFDisposeMedia();
}

uint64_t MKCFReadMedia()
{
  return _MKCFReadMedia();
}

uint64_t MKCFUpdateScheme()
{
  return _MKCFUpdateScheme();
}

uint64_t MKCFWriteMedia()
{
  return _MKCFWriteMedia();
}

uint64_t MKCFWriteScheme()
{
  return _MKCFWriteScheme();
}

uint64_t MKHFSGetResizeLimits()
{
  return _MKHFSGetResizeLimits();
}

uint64_t MKHFSResizeVolume()
{
  return _MKHFSResizeVolume();
}

uint64_t MKMediaCreateWithPath()
{
  return _MKMediaCreateWithPath();
}

uint64_t MKTypeToHuman()
{
  return _MKTypeToHuman();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

char *__cdecl devname_r(dev_t a1, mode_t a2, char *buf, int len)
{
  return _devname_r(a1, a2, buf, len);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

int fstatat(int a1, const char *a2, stat *a3, int a4)
{
  return _fstatat(a1, a2, a3, a4);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return _getattrlist(a1, a2, a3, a4, a5);
}

int getmntinfo_r_np(statfs **a1, int a2)
{
  return _getmntinfo_r_np(a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
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
  return [super a2];
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t reboot3()
{
  return _reboot3();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return _strnlen(__s1, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_BSDName(void *a1, const char *a2, ...)
{
  return [a1 BSDName];
}

id objc_msgSend_DAstatus(void *a1, const char *a2, ...)
{
  return [a1 DAstatus];
}

id objc_msgSend_DAstatusString(void *a1, const char *a2, ...)
{
  return [a1 DAstatusString];
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

id objc_msgSend__advanceOperationQueue(void *a1, const char *a2, ...)
{
  return [a1 _advanceOperationQueue];
}

id objc_msgSend__advanceOperationQueueOnWorkQueue(void *a1, const char *a2, ...)
{
  return [a1 _advanceOperationQueueOnWorkQueue];
}

id objc_msgSend__cacheContainerInfo(void *a1, const char *a2, ...)
{
  return [a1 _cacheContainerInfo];
}

id objc_msgSend__cacheFilesystem(void *a1, const char *a2, ...)
{
  return [a1 _cacheFilesystem];
}

id objc_msgSend__cacheInfo(void *a1, const char *a2, ...)
{
  return [a1 _cacheInfo];
}

id objc_msgSend__cacheNoFilesystem(void *a1, const char *a2, ...)
{
  return [a1 _cacheNoFilesystem];
}

id objc_msgSend__cacheVolumeGroup(void *a1, const char *a2, ...)
{
  return [a1 _cacheVolumeGroup];
}

id objc_msgSend__getFilesystem(void *a1, const char *a2, ...)
{
  return [a1 _getFilesystem];
}

id objc_msgSend__getIdentifierForStat(void *a1, const char *a2, ...)
{
  return [a1 _getIdentifierForStat];
}

id objc_msgSend__getOwnerUsingStat(void *a1, const char *a2, ...)
{
  return [a1 _getOwnerUsingStat];
}

id objc_msgSend__idleCallback(void *a1, const char *a2, ...)
{
  return [a1 _idleCallback];
}

id objc_msgSend__invalidateExtendedDiskInfoCache(void *a1, const char *a2, ...)
{
  return [a1 _invalidateExtendedDiskInfoCache];
}

id objc_msgSend__supportsRecaching(void *a1, const char *a2, ...)
{
  return [a1 _supportsRecaching];
}

id objc_msgSend__wholeDisksToEject(void *a1, const char *a2, ...)
{
  return [a1 _wholeDisksToEject];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_activeFSM(void *a1, const char *a2, ...)
{
  return [a1 activeFSM];
}

id objc_msgSend_addMissingDisappearedDisks(void *a1, const char *a2, ...)
{
  return [a1 addMissingDisappearedDisks];
}

id objc_msgSend_allDisks(void *a1, const char *a2, ...)
{
  return [a1 allDisks];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_apfsContainerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 apfsContainerIdentifier];
}

id objc_msgSend_apfsContainerUUID(void *a1, const char *a2, ...)
{
  return [a1 apfsContainerUUID];
}

id objc_msgSend_apfsRole(void *a1, const char *a2, ...)
{
  return [a1 apfsRole];
}

id objc_msgSend_apfsUUID(void *a1, const char *a2, ...)
{
  return [a1 apfsUUID];
}

id objc_msgSend_apfsVolumeGroupUUID(void *a1, const char *a2, ...)
{
  return [a1 apfsVolumeGroupUUID];
}

id objc_msgSend_appearedDisks(void *a1, const char *a2, ...)
{
  return [a1 appearedDisks];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attempt(void *a1, const char *a2, ...)
{
  return [a1 attempt];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_authenticateOnInit(void *a1, const char *a2, ...)
{
  return [a1 authenticateOnInit];
}

id objc_msgSend_authorizeRequestForRoot(void *a1, const char *a2, ...)
{
  return [a1 authorizeRequestForRoot];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_boosterQueue(void *a1, const char *a2, ...)
{
  return [a1 boosterQueue];
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return [a1 buffer];
}

id objc_msgSend_buildFilesystems(void *a1, const char *a2, ...)
{
  return [a1 buildFilesystems];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheEncryptionInfo(void *a1, const char *a2, ...)
{
  return [a1 cacheEncryptionInfo];
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return [a1 callback];
}

id objc_msgSend_callbackBlock(void *a1, const char *a2, ...)
{
  return [a1 callbackBlock];
}

id objc_msgSend_canPartitionDisk(void *a1, const char *a2, ...)
{
  return [a1 canPartitionDisk];
}

id objc_msgSend_canResize(void *a1, const char *a2, ...)
{
  return [a1 canResize];
}

id objc_msgSend_caseSensitive(void *a1, const char *a2, ...)
{
  return [a1 caseSensitive];
}

id objc_msgSend_changedDisks(void *a1, const char *a2, ...)
{
  return [a1 changedDisks];
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return [a1 children];
}

id objc_msgSend_childrenOperations(void *a1, const char *a2, ...)
{
  return [a1 childrenOperations];
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return [a1 client];
}

id objc_msgSend_clientUID(void *a1, const char *a2, ...)
{
  return [a1 clientUID];
}

id objc_msgSend_completeDiskArbOp(void *a1, const char *a2, ...)
{
  return [a1 completeDiskArbOp];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_connectionToService(void *a1, const char *a2, ...)
{
  return [a1 connectionToService];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_containerBSDName(void *a1, const char *a2, ...)
{
  return [a1 containerBSDName];
}

id objc_msgSend_contentMask(void *a1, const char *a2, ...)
{
  return [a1 contentMask];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyDesignatedPhysicalStoreUUID(void *a1, const char *a2, ...)
{
  return [a1 copyDesignatedPhysicalStoreUUID];
}

id objc_msgSend_copyNextObject(void *a1, const char *a2, ...)
{
  return [a1 copyNextObject];
}

id objc_msgSend_copyParent(void *a1, const char *a2, ...)
{
  return [a1 copyParent];
}

id objc_msgSend_copyPhysicalStoresIOMedia(void *a1, const char *a2, ...)
{
  return [a1 copyPhysicalStoresIOMedia];
}

id objc_msgSend_copyPhysicalStoresUUIDs(void *a1, const char *a2, ...)
{
  return [a1 copyPhysicalStoresUUIDs];
}

id objc_msgSend_copyProperties(void *a1, const char *a2, ...)
{
  return [a1 copyProperties];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_counter(void *a1, const char *a2, ...)
{
  return [a1 counter];
}

id objc_msgSend_createDASession(void *a1, const char *a2, ...)
{
  return [a1 createDASession];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentOperationName(void *a1, const char *a2, ...)
{
  return [a1 currentOperationName];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentSize(void *a1, const char *a2, ...)
{
  return [a1 currentSize];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_daDisk(void *a1, const char *a2, ...)
{
  return [a1 daDisk];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultEffaceable(void *a1, const char *a2, ...)
{
  return [a1 defaultEffaceable];
}

id objc_msgSend_defaultErrorCode(void *a1, const char *a2, ...)
{
  return [a1 defaultErrorCode];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_descriptors(void *a1, const char *a2, ...)
{
  return [a1 descriptors];
}

id objc_msgSend_designatedPhysicalStore(void *a1, const char *a2, ...)
{
  return [a1 designatedPhysicalStore];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_disappearedDisks(void *a1, const char *a2, ...)
{
  return [a1 disappearedDisks];
}

id objc_msgSend_disk(void *a1, const char *a2, ...)
{
  return [a1 disk];
}

id objc_msgSend_diskArbCallbacksQueue(void *a1, const char *a2, ...)
{
  return [a1 diskArbCallbacksQueue];
}

id objc_msgSend_diskArbOpDone(void *a1, const char *a2, ...)
{
  return [a1 diskArbOpDone];
}

id objc_msgSend_diskArbSession(void *a1, const char *a2, ...)
{
  return [a1 diskArbSession];
}

id objc_msgSend_diskIdentifier(void *a1, const char *a2, ...)
{
  return [a1 diskIdentifier];
}

id objc_msgSend_diskListCompleteReceived(void *a1, const char *a2, ...)
{
  return [a1 diskListCompleteReceived];
}

id objc_msgSend_diskObjectID(void *a1, const char *a2, ...)
{
  return [a1 diskObjectID];
}

id objc_msgSend_diskRepresentation(void *a1, const char *a2, ...)
{
  return [a1 diskRepresentation];
}

id objc_msgSend_diskToEject(void *a1, const char *a2, ...)
{
  return [a1 diskToEject];
}

id objc_msgSend_disks(void *a1, const char *a2, ...)
{
  return [a1 disks];
}

id objc_msgSend_disksNotificationsWaiters(void *a1, const char *a2, ...)
{
  return [a1 disksNotificationsWaiters];
}

id objc_msgSend_disksToMount(void *a1, const char *a2, ...)
{
  return [a1 disksToMount];
}

id objc_msgSend_disksToProcess(void *a1, const char *a2, ...)
{
  return [a1 disksToProcess];
}

id objc_msgSend_disksToUnmount(void *a1, const char *a2, ...)
{
  return [a1 disksToUnmount];
}

id objc_msgSend_dissenterPID(void *a1, const char *a2, ...)
{
  return [a1 dissenterPID];
}

id objc_msgSend_dmPersonality(void *a1, const char *a2, ...)
{
  return [a1 dmPersonality];
}

id objc_msgSend_effectiveGroupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveGroupIdentifier];
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserIdentifier];
}

id objc_msgSend_endedSuccessfully(void *a1, const char *a2, ...)
{
  return [a1 endedSuccessfully];
}

id objc_msgSend_entriesMap(void *a1, const char *a2, ...)
{
  return [a1 entriesMap];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_event(void *a1, const char *a2, ...)
{
  return [a1 event];
}

id objc_msgSend_eventFromSize(void *a1, const char *a2, ...)
{
  return [a1 eventFromSize];
}

id objc_msgSend_expectedDiskIdentifier(void *a1, const char *a2, ...)
{
  return [a1 expectedDiskIdentifier];
}

id objc_msgSend_extensionFilesystemsMapping(void *a1, const char *a2, ...)
{
  return [a1 extensionFilesystemsMapping];
}

id objc_msgSend_fileHandleForReading(void *a1, const char *a2, ...)
{
  return [a1 fileHandleForReading];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_filesystem(void *a1, const char *a2, ...)
{
  return [a1 filesystem];
}

id objc_msgSend_filesystemType(void *a1, const char *a2, ...)
{
  return [a1 filesystemType];
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return [a1 finished];
}

id objc_msgSend_finishedSemaphore(void *a1, const char *a2, ...)
{
  return [a1 finishedSemaphore];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flushMediaRef(void *a1, const char *a2, ...)
{
  return [a1 flushMediaRef];
}

id objc_msgSend_force(void *a1, const char *a2, ...)
{
  return [a1 force];
}

id objc_msgSend_formatArgs(void *a1, const char *a2, ...)
{
  return [a1 formatArgs];
}

id objc_msgSend_formatExecutable(void *a1, const char *a2, ...)
{
  return [a1 formatExecutable];
}

id objc_msgSend_frameworkBundle(void *a1, const char *a2, ...)
{
  return [a1 frameworkBundle];
}

id objc_msgSend_freeSpace(void *a1, const char *a2, ...)
{
  return [a1 freeSpace];
}

id objc_msgSend_fs(void *a1, const char *a2, ...)
{
  return [a1 fs];
}

id objc_msgSend_fsInfo(void *a1, const char *a2, ...)
{
  return [a1 fsInfo];
}

id objc_msgSend_fsType(void *a1, const char *a2, ...)
{
  return [a1 fsType];
}

id objc_msgSend_getAPFSVolumeRole(void *a1, const char *a2, ...)
{
  return [a1 getAPFSVolumeRole];
}

id objc_msgSend_getConnection(void *a1, const char *a2, ...)
{
  return [a1 getConnection];
}

id objc_msgSend_getDataVolumeBSD(void *a1, const char *a2, ...)
{
  return [a1 getDataVolumeBSD];
}

id objc_msgSend_getSectorSize(void *a1, const char *a2, ...)
{
  return [a1 getSectorSize];
}

id objc_msgSend_group(void *a1, const char *a2, ...)
{
  return [a1 group];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_innerDescriptor(void *a1, const char *a2, ...)
{
  return [a1 innerDescriptor];
}

id objc_msgSend_installedFilesystemsMapping(void *a1, const char *a2, ...)
{
  return [a1 installedFilesystemsMapping];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidated(void *a1, const char *a2, ...)
{
  return [a1 invalidated];
}

id objc_msgSend_ioContent(void *a1, const char *a2, ...)
{
  return [a1 ioContent];
}

id objc_msgSend_ioObj(void *a1, const char *a2, ...)
{
  return [a1 ioObj];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isCaseSensitive(void *a1, const char *a2, ...)
{
  return [a1 isCaseSensitive];
}

id objc_msgSend_isDiskImage(void *a1, const char *a2, ...)
{
  return [a1 isDiskImage];
}

id objc_msgSend_isEncrypted(void *a1, const char *a2, ...)
{
  return [a1 isEncrypted];
}

id objc_msgSend_isExtension(void *a1, const char *a2, ...)
{
  return [a1 isExtension];
}

id objc_msgSend_isExternal(void *a1, const char *a2, ...)
{
  return [a1 isExternal];
}

id objc_msgSend_isIOMediaDisk(void *a1, const char *a2, ...)
{
  return [a1 isIOMediaDisk];
}

id objc_msgSend_isIOSRootSnapshot(void *a1, const char *a2, ...)
{
  return [a1 isIOSRootSnapshot];
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return [a1 isInternal];
}

id objc_msgSend_isJournaled(void *a1, const char *a2, ...)
{
  return [a1 isJournaled];
}

id objc_msgSend_isLiveFSAPFSDisk(void *a1, const char *a2, ...)
{
  return [a1 isLiveFSAPFSDisk];
}

id objc_msgSend_isLiveFSContainer(void *a1, const char *a2, ...)
{
  return [a1 isLiveFSContainer];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isOSInternal(void *a1, const char *a2, ...)
{
  return [a1 isOSInternal];
}

id objc_msgSend_isPhysicalDisk(void *a1, const char *a2, ...)
{
  return [a1 isPhysicalDisk];
}

id objc_msgSend_isRealEFIPartition(void *a1, const char *a2, ...)
{
  return [a1 isRealEFIPartition];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isTrusted(void *a1, const char *a2, ...)
{
  return [a1 isTrusted];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isVirtualDiskType(void *a1, const char *a2, ...)
{
  return [a1 isVirtualDiskType];
}

id objc_msgSend_isWholeDisk(void *a1, const char *a2, ...)
{
  return [a1 isWholeDisk];
}

id objc_msgSend_isWritable(void *a1, const char *a2, ...)
{
  return [a1 isWritable];
}

id objc_msgSend_lastDiskObjectIDLock(void *a1, const char *a2, ...)
{
  return [a1 lastDiskObjectIDLock];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastOperationName(void *a1, const char *a2, ...)
{
  return [a1 lastOperationName];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_launch(void *a1, const char *a2, ...)
{
  return [a1 launch];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineData(void *a1, const char *a2, ...)
{
  return [a1 lineData];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_liveDiskIdentifier(void *a1, const char *a2, ...)
{
  return [a1 liveDiskIdentifier];
}

id objc_msgSend_liveVerificationArgs(void *a1, const char *a2, ...)
{
  return [a1 liveVerificationArgs];
}

id objc_msgSend_localizedAdditionalDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedAdditionalDescription];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_majorType(void *a1, const char *a2, ...)
{
  return [a1 majorType];
}

id objc_msgSend_managerResumed(void *a1, const char *a2, ...)
{
  return [a1 managerResumed];
}

id objc_msgSend_managerStalled(void *a1, const char *a2, ...)
{
  return [a1 managerStalled];
}

id objc_msgSend_mediaRef(void *a1, const char *a2, ...)
{
  return [a1 mediaRef];
}

id objc_msgSend_mediaUUID(void *a1, const char *a2, ...)
{
  return [a1 mediaUUID];
}

id objc_msgSend_messages(void *a1, const char *a2, ...)
{
  return [a1 messages];
}

id objc_msgSend_minimalDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 minimalDictionaryRepresentation];
}

id objc_msgSend_mountFlags(void *a1, const char *a2, ...)
{
  return [a1 mountFlags];
}

id objc_msgSend_mountPoint(void *a1, const char *a2, ...)
{
  return [a1 mountPoint];
}

id objc_msgSend_msgHandler(void *a1, const char *a2, ...)
{
  return [a1 msgHandler];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newDAError(void *a1, const char *a2, ...)
{
  return [a1 newDAError];
}

id objc_msgSend_newPartition(void *a1, const char *a2, ...)
{
  return [a1 newPartition];
}

id objc_msgSend_newPerformOperation(void *a1, const char *a2, ...)
{
  return [a1 newPerformOperation];
}

id objc_msgSend_newlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 newlineCharacterSet];
}

id objc_msgSend_nextDiskObjectID(void *a1, const char *a2, ...)
{
  return [a1 nextDiskObjectID];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nextState(void *a1, const char *a2, ...)
{
  return [a1 nextState];
}

id objc_msgSend_nonResizableSize(void *a1, const char *a2, ...)
{
  return [a1 nonResizableSize];
}

id objc_msgSend_notificationsCache(void *a1, const char *a2, ...)
{
  return [a1 notificationsCache];
}

id objc_msgSend_notificationsProcessingQueue(void *a1, const char *a2, ...)
{
  return [a1 notificationsProcessingQueue];
}

id objc_msgSend_notificationsSyncQueue(void *a1, const char *a2, ...)
{
  return [a1 notificationsSyncQueue];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numConnectedClients(void *a1, const char *a2, ...)
{
  return [a1 numConnectedClients];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_originalSize(void *a1, const char *a2, ...)
{
  return [a1 originalSize];
}

id objc_msgSend_ownerUID(void *a1, const char *a2, ...)
{
  return [a1 ownerUID];
}

id objc_msgSend_partitions(void *a1, const char *a2, ...)
{
  return [a1 partitions];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return [a1 password];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_physicalStores(void *a1, const char *a2, ...)
{
  return [a1 physicalStores];
}

id objc_msgSend_pipe(void *a1, const char *a2, ...)
{
  return [a1 pipe];
}

id objc_msgSend_plistEndTag(void *a1, const char *a2, ...)
{
  return [a1 plistEndTag];
}

id objc_msgSend_plistStartTag(void *a1, const char *a2, ...)
{
  return [a1 plistStartTag];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_preIdleOperationMap(void *a1, const char *a2, ...)
{
  return [a1 preIdleOperationMap];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_privateCache(void *a1, const char *a2, ...)
{
  return [a1 privateCache];
}

id objc_msgSend_privilege(void *a1, const char *a2, ...)
{
  return [a1 privilege];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processedDisk(void *a1, const char *a2, ...)
{
  return [a1 processedDisk];
}

id objc_msgSend_processingGroup(void *a1, const char *a2, ...)
{
  return [a1 processingGroup];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_progressHandler(void *a1, const char *a2, ...)
{
  return [a1 progressHandler];
}

id objc_msgSend_purgeableSpace(void *a1, const char *a2, ...)
{
  return [a1 purgeableSpace];
}

id objc_msgSend_queues(void *a1, const char *a2, ...)
{
  return [a1 queues];
}

id objc_msgSend_raidTraverse(void *a1, const char *a2, ...)
{
  return [a1 raidTraverse];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_rawIOContent(void *a1, const char *a2, ...)
{
  return [a1 rawIOContent];
}

id objc_msgSend_readDataToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 readDataToEndOfFile];
}

id objc_msgSend_receiver(void *a1, const char *a2, ...)
{
  return [a1 receiver];
}

id objc_msgSend_recursive(void *a1, const char *a2, ...)
{
  return [a1 recursive];
}

id objc_msgSend_registerDiskArbCallbacks(void *a1, const char *a2, ...)
{
  return [a1 registerDiskArbCallbacks];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeLIFSAPFSContainers(void *a1, const char *a2, ...)
{
  return [a1 removeLIFSAPFSContainers];
}

id objc_msgSend_repairArgs(void *a1, const char *a2, ...)
{
  return [a1 repairArgs];
}

id objc_msgSend_requestedSize(void *a1, const char *a2, ...)
{
  return [a1 requestedSize];
}

id objc_msgSend_requiresEraseDiskForAPFS(void *a1, const char *a2, ...)
{
  return [a1 requiresEraseDiskForAPFS];
}

id objc_msgSend_resizablePart(void *a1, const char *a2, ...)
{
  return [a1 resizablePart];
}

id objc_msgSend_resizeError(void *a1, const char *a2, ...)
{
  return [a1 resizeError];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_rootWholeDisk(void *a1, const char *a2, ...)
{
  return [a1 rootWholeDisk];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_schemeID(void *a1, const char *a2, ...)
{
  return [a1 schemeID];
}

id objc_msgSend_sectorSize(void *a1, const char *a2, ...)
{
  return [a1 sectorSize];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return [a1 selector];
}

id objc_msgSend_selectorTarget(void *a1, const char *a2, ...)
{
  return [a1 selectorTarget];
}

id objc_msgSend_semaphore(void *a1, const char *a2, ...)
{
  return [a1 semaphore];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setupSigtermHandler(void *a1, const char *a2, ...)
{
  return [a1 setupSigtermHandler];
}

id objc_msgSend_sharedDaemon(void *a1, const char *a2, ...)
{
  return [a1 sharedDaemon];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_skProgress(void *a1, const char *a2, ...)
{
  return [a1 skProgress];
}

id objc_msgSend_sortedChildren(void *a1, const char *a2, ...)
{
  return [a1 sortedChildren];
}

id objc_msgSend_standardError(void *a1, const char *a2, ...)
{
  return [a1 standardError];
}

id objc_msgSend_standardOutput(void *a1, const char *a2, ...)
{
  return [a1 standardOutput];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startForceIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 startForceIdleTimer];
}

id objc_msgSend_startLocation(void *a1, const char *a2, ...)
{
  return [a1 startLocation];
}

id objc_msgSend_startRange(void *a1, const char *a2, ...)
{
  return [a1 startRange];
}

id objc_msgSend_startServer(void *a1, const char *a2, ...)
{
  return [a1 startServer];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stderrHandle(void *a1, const char *a2, ...)
{
  return [a1 stderrHandle];
}

id objc_msgSend_stderrParser(void *a1, const char *a2, ...)
{
  return [a1 stderrParser];
}

id objc_msgSend_stdoutHandle(void *a1, const char *a2, ...)
{
  return [a1 stdoutHandle];
}

id objc_msgSend_stdoutParser(void *a1, const char *a2, ...)
{
  return [a1 stdoutParser];
}

id objc_msgSend_supportsJournaling(void *a1, const char *a2, ...)
{
  return [a1 supportsJournaling];
}

id objc_msgSend_syncAllDisksSemaphores(void *a1, const char *a2, ...)
{
  return [a1 syncAllDisksSemaphores];
}

id objc_msgSend_syncSharedManager(void *a1, const char *a2, ...)
{
  return [a1 syncSharedManager];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_targetDisk(void *a1, const char *a2, ...)
{
  return [a1 targetDisk];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return [a1 task];
}

id objc_msgSend_taskDone(void *a1, const char *a2, ...)
{
  return [a1 taskDone];
}

id objc_msgSend_taskID(void *a1, const char *a2, ...)
{
  return [a1 taskID];
}

id objc_msgSend_taskPairs(void *a1, const char *a2, ...)
{
  return [a1 taskPairs];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return [a1 taskState];
}

id objc_msgSend_tasks(void *a1, const char *a2, ...)
{
  return [a1 tasks];
}

id objc_msgSend_terminationStatus(void *a1, const char *a2, ...)
{
  return [a1 terminationStatus];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_totalSpace(void *a1, const char *a2, ...)
{
  return [a1 totalSpace];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return [a1 totalUnitCount];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return [a1 uid];
}

id objc_msgSend_unformattedSize(void *a1, const char *a2, ...)
{
  return [a1 unformattedSize];
}

id objc_msgSend_unlocalizedEncryptedName(void *a1, const char *a2, ...)
{
  return [a1 unlocalizedEncryptedName];
}

id objc_msgSend_unlocalizedName(void *a1, const char *a2, ...)
{
  return [a1 unlocalizedName];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_updateRAIDDisks(void *a1, const char *a2, ...)
{
  return [a1 updateRAIDDisks];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_verificationArgs(void *a1, const char *a2, ...)
{
  return [a1 verificationArgs];
}

id objc_msgSend_visibleDiskRoles(void *a1, const char *a2, ...)
{
  return [a1 visibleDiskRoles];
}

id objc_msgSend_volumeKind(void *a1, const char *a2, ...)
{
  return [a1 volumeKind];
}

id objc_msgSend_volumeName(void *a1, const char *a2, ...)
{
  return [a1 volumeName];
}

id objc_msgSend_volumeType(void *a1, const char *a2, ...)
{
  return [a1 volumeType];
}

id objc_msgSend_volumes(void *a1, const char *a2, ...)
{
  return [a1 volumes];
}

id objc_msgSend_waitForCompletionQueue(void *a1, const char *a2, ...)
{
  return [a1 waitForCompletionQueue];
}

id objc_msgSend_waitIOKitQuiet(void *a1, const char *a2, ...)
{
  return [a1 waitIOKitQuiet];
}

id objc_msgSend_waitUntilExit(void *a1, const char *a2, ...)
{
  return [a1 waitUntilExit];
}

id objc_msgSend_waitables(void *a1, const char *a2, ...)
{
  return [a1 waitables];
}

id objc_msgSend_wholeDADisk(void *a1, const char *a2, ...)
{
  return [a1 wholeDADisk];
}

id objc_msgSend_wholeDiskOperation(void *a1, const char *a2, ...)
{
  return [a1 wholeDiskOperation];
}

id objc_msgSend_xmlOutputArg(void *a1, const char *a2, ...)
{
  return [a1 xmlOutputArg];
}