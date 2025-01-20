void sub_100001F6C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void v11[4];
  id v12;
  void v13[4];
  id v14;
  void v15[4];
  id v16;
  void v17[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;

  switch(*(void *)(a1 + 48))
  {
    case 0:
      v2 = *(void **)(*(void *)(a1 + 32) + 32);
      v3 = *(void *)(a1 + 56);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100007CD0;
      v13[3] = &unk_10002CB40;
      v14 = *(id *)(a1 + 40);
      [v2 allBackupsWithTimeout:v3 completion:v13];
      v4 = v14;
      goto LABEL_8;
    case 1:
      v7 = *(void **)(*(void *)(a1 + 32) + 32);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100007CBC;
      v15[3] = &unk_10002CB40;
      v16 = *(id *)(a1 + 40);
      [v7 localBackupsWithCompletion:v15];
      v4 = v16;
      goto LABEL_8;
    case 2:
      v8 = *(void **)(*(void *)(a1 + 32) + 32);
      v9 = *(void *)(a1 + 56);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100002C6C;
      v17[3] = &unk_10002CB40;
      v18 = *(id *)(a1 + 40);
      [v8 iCloudBackupsWithTimeout:v9 completion:v17];
      v4 = v18;
      goto LABEL_8;
    case 3:
      v10 = *(void **)(*(void *)(a1 + 32) + 48);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_100007CE4;
      v11[3] = &unk_10002CB68;
      v12 = *(id *)(a1 + 40);
      [v10 sendBackupListRequestWithResponseBlock:v11];
      v4 = v12;
LABEL_8:

      break;
    default:
      v5 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 134217984;
        v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unknown backup type: %lu", buf, 0xCu);
      }
      break;
  }
}

void sub_10000241C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 88), 8);
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_10000250C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = objc_msgSend(v3, "allValues", 0);
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v10 backupType] == (id)1) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100002A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100002C6C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000031E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000031F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003208(uint64_t a1)
{
}

void sub_100003210(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000033D8(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 24);
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  [v1 addObject:v2];
}

id sub_10000342C(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v6));
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeAllObjects", (void)v8);
}

id sub_100003620(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v6) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v6));
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "removeAllObjects", (void)v8);
}

void sub_1000037D8(id a1)
{
  Class v1 = NSClassFromString(@"NTKFaceSnapshotClient");
  if (v1)
  {
    Class v2 = v1;
    SEL v3 = NSSelectorFromString(@"sharedInstance");
    if (objc_opt_respondsToSelector())
    {
      qword_100034FA0 = [(objc_class *)v2 performSelector:v3];
      _objc_release_x1();
    }
  }
}

BOOL sub_100003910(uint64_t a1, uint64_t a2)
{
  while (1)
  {
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
      return v3 == 0;
    }
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error))
    {
      int v3 = 1;
      return v3 == 0;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    uint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        LOBYTE(v6) = 0;
        int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v3 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LOBYTE(v6) = 0;
    }
LABEL_13:
    if (v3) {
      BOOL v10 = 1;
    }
    else {
      BOOL v10 = (v6 & 7) == 4;
    }
    if (v10) {
      return v3 == 0;
    }
    if ((PBReaderSkipValueWithTag() & 1) == 0) {
      return 0;
    }
  }
}

uint64_t sub_100003C0C(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t v12 = PBReaderReadData();
      long long v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100004004(uint64_t a1)
{
  Class v2 = nb_daemon_log;
  BOOL v3 = os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT);
  uint64_t v4 = NRPairedDeviceRegistryDeviceDidUnpairNotification;
  if (v3)
  {
    int v9 = 138412290;
    uint64_t v10 = NRPairedDeviceRegistryDeviceDidUnpairNotification;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Add Observer for: %@", (uint8_t *)&v9, 0xCu);
  }
  unsigned int v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:*(void *)(a1 + 32) selector:"_handleDeviceUnpaired:" name:v4 object:0];

  unint64_t v6 = [[NBRemoteObjectClassC alloc] initWithDelegate:*(void *)(a1 + 32) andQueue:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t v7 = *(void *)(a1 + 32);
  char v8 = *(void **)(v7 + 8);
  *(void *)(v7 + 8) = v6;
}

void sub_1000041B0(uint64_t a1)
{
  Class v2 = [*(id *)(a1 + 32) manager];

  if (!v2)
  {
    BOOL v3 = objc_alloc_init(NBiCloudBackupManager);
    [*(id *)(a1 + 32) setManager:v3];
  }
  [*(id *)(a1 + 32) startSchedulerIfNecessary];
  uint64_t v4 = [*(id *)(a1 + 32) manager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004294;
  v6[3] = &unk_10002C820;
  id v5 = *(id *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v4 backupList:v6];
}

id sub_100004294(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  Class v2 = *(void **)(a1 + 32);

  return [v2 setManager:0];
}

void sub_1000043A0(uint64_t a1)
{
  Class v2 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "restoreWithID: %@", buf, 0xCu);
  }
  uint64_t v4 = [*(id *)(a1 + 40) manager];

  if (!v4)
  {
    id v5 = objc_alloc_init(NBiCloudBackupManager);
    [*(id *)(a1 + 40) setManager:v5];
  }
  unint64_t v6 = [*(id *)(a1 + 40) manager];
  uint64_t v7 = *(void *)(a1 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000450C;
  v9[3] = &unk_10002C848;
  id v8 = *(id *)(a1 + 48);
  v9[4] = *(void *)(a1 + 40);
  id v10 = v8;
  [v6 restoreBackupWithID:v7 completion:v9];
}

id sub_10000450C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  Class v2 = *(void **)(a1 + 32);

  return [v2 setManager:0];
}

void sub_100004618(uint64_t a1)
{
  Class v2 = [*(id *)(a1 + 32) manager];

  if (!v2)
  {
    uint64_t v3 = objc_alloc_init(NBiCloudBackupManager);
    [*(id *)(a1 + 32) setManager:v3];
  }
  uint64_t v4 = [*(id *)(a1 + 32) manager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004700;
  v7[3] = &unk_10002C848;
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v4 removeBackupWithID:v5 withCompletion:v7];
}

id sub_100004700(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  Class v2 = *(void **)(a1 + 32);

  return [v2 setManager:0];
}

void sub_10000480C(uint64_t a1)
{
  Class v2 = [*(id *)(a1 + 32) manager];

  if (!v2)
  {
    uint64_t v3 = objc_alloc_init(NBiCloudBackupManager);
    [*(id *)(a1 + 32) setManager:v3];
  }
  NSLog(@"restoreWithURL: %@", *(void *)(a1 + 40));
  uint64_t v4 = [*(id *)(a1 + 32) manager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004908;
  v7[3] = &unk_10002C848;
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v4 restoreBackupWithURL:v5 completion:v7];
}

id sub_100004908(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  Class v2 = *(void **)(a1 + 32);

  return [v2 setManager:0];
}

void sub_100004A14(uint64_t a1)
{
  Class v2 = [*(id *)(a1 + 32) manager];

  if (!v2)
  {
    uint64_t v3 = objc_alloc_init(NBiCloudBackupManager);
    [*(id *)(a1 + 32) setManager:v3];
  }
  NSLog(@"iCloudBackupPayloadToPath: %@", *(void *)(a1 + 40));
  uint64_t v4 = [*(id *)(a1 + 32) manager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004B10;
  v7[3] = &unk_10002C898;
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v6;
  [v4 backupPayloadForID:v5 completion:v7];
}

id sub_100004B10(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  Class v2 = *(void **)(a1 + 32);

  return [v2 setManager:0];
}

void sub_100004BF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "createInitialBackup finshed with error %@", (uint8_t *)&v5, 0xCu);
  }
  [*(id *)(a1 + 32) setManager:0];
}

id sub_100004D80(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  Class v2 = *(void **)(a1 + 32);

  return [v2 setManager:0];
}

id sub_100004EA8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  Class v2 = *(void **)(a1 + 32);

  return [v2 setManager:0];
}

uint64_t sub_1000050A0(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t v12 = PBReaderReadData();
      long long v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_1000058E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  char v4 = objc_msgSend(v3, "allKeys", 0);
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        int v10 = [v3 objectForKeyedSubscript:v9];
        [*(id *)(*(void *)(a1 + 32) + 16) setObject:v10 forKeyedSubscript:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 16) allValues];
  (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);
}

void sub_100005CCC(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

void sub_100005F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100005F6C(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:a2 forKeyedSubscript:*(void *)(a1 + 40)];
    id v3 = [*(id *)(a1 + 32) persistMetadataIndex];
    if (!v3) {
      [*(id *)(a1 + 32) pruneLocalBackups];
    }
  }
  else
  {
    char v4 = +[NSFileManager defaultManager];
    [v4 removeItemAtPath:*(void *)(a1 + 48) error:0];

    id v3 = 0;
  }

  return v3;
}

void sub_1000060D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    id v29 = v3;
    __int16 v30 = 2112;
    uint64_t v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Got backup: %@ for ID: %@", buf, 0x16u);
  }
  if (!v3) {
    goto LABEL_9;
  }
  if (![v3 backupType])
  {
    v17 = [*(id *)(a1 + 40) pathToBackup:v3];
    v18 = +[NSFileManager defaultManager];
    id v27 = 0;
    [v18 removeItemAtPath:v17 error:&v27];
    id v19 = v27;

    if (v19)
    {
      v20 = [v19 domain];
      if ([v20 isEqualToString:NSCocoaErrorDomain])
      {
        id v21 = [v19 code];

        if (v21 == (id)4) {
          goto LABEL_20;
        }
      }
      else
      {
      }
      v22 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v19;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Failed to remove Backup: %@", buf, 0xCu);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
LABEL_20:
    v23 = *(void **)(*(void *)(a1 + 40) + 16);
    v24 = [v3 uuid];
    [v23 removeObjectForKey:v24];

    uint64_t v11 = [*(id *)(a1 + 40) persistMetadataIndex];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_21;
  }
  if ([v3 backupType] == (id)1)
  {
    id v6 = *(void **)(*(void *)(a1 + 40) + 24);
    if (!v6)
    {
      uint64_t v7 = objc_opt_new();
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void **)(v8 + 24);
      *(void *)(v8 + 24) = v7;

      id v6 = *(void **)(*(void *)(a1 + 40) + 24);
    }
    uint64_t v10 = *(void *)(a1 + 32);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10000644C;
    v25[3] = &unk_10002C988;
    id v26 = *(id *)(a1 + 48);
    [v6 deleteBackupWithID:v10 completion:v25];
    uint64_t v11 = v26;
    goto LABEL_21;
  }
LABEL_9:
  uint64_t v12 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = v12;
    long long v14 = [v3 uuid];
    long long v15 = [v14 UUIDString];
    *(_DWORD *)buf = 138412290;
    id v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Backup (%@) could not be found", buf, 0xCu);
  }
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v11 = NBError();
  (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v11);
LABEL_21:
}

uint64_t sub_10000644C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000064C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 count] >= 5)
  {
    id v22 = v3;
    char v4 = +[NSMutableArray arrayWithArray:v3];
    [v4 sortUsingComparator:&stru_10002C9F0];
    uint64_t v5 = (char *)[v4 count] - 1;
    if ((unint64_t)v5 >= 5)
    {
      id v6 = (os_log_t *)&nb_daemon_log;
      uint64_t v7 = v25;
      uint64_t v8 = &unk_10002CA18;
      v23 = v4;
      do
      {
        os_log_t v9 = *v6;
        if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = v9;
          uint64_t v11 = [v4 objectAtIndexedSubscript:v5];
          uint64_t v12 = [v11 uuid];
          [v4 objectAtIndexedSubscript:v5];
          long long v13 = v7;
          uint64_t v14 = a1;
          long long v15 = v8;
          v17 = uint64_t v16 = v6;
          v18 = [v17 lastModificationDate];
          *(_DWORD *)buf = 138412546;
          id v29 = v12;
          __int16 v30 = 2112;
          uint64_t v31 = v18;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "pruneLocalBackups: Deleting backup with UUID: %@ and modification date: %@", buf, 0x16u);

          id v6 = v16;
          uint64_t v8 = v15;
          a1 = v14;
          uint64_t v7 = v13;
          char v4 = v23;
        }
        id v19 = *(void **)(a1 + 32);
        v20 = [v4 objectAtIndexedSubscript:v5];
        id v21 = [v20 uuid];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v25[0] = sub_100006798;
        v25[1] = v8;
        id v26 = v4;
        id v27 = v5;
        [v19 deleteBackupWithID:v21 withCompletion:v24];

        --v5;
      }
      while ((unint64_t)v5 > 4);
    }

    id v3 = v22;
  }
}

int64_t sub_100006728(id a1, NBBackup *a2, NBBackup *a3)
{
  char v4 = a3;
  uint64_t v5 = [(NBBackup *)a2 lastModificationDate];
  id v6 = [(NBBackup *)v4 lastModificationDate];

  id v7 = [v6 compare:v5];
  return (int64_t)v7;
}

void sub_100006798(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    char v4 = (void *)nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      id v7 = v4;
      uint64_t v8 = [v6 objectAtIndexedSubscript:v5];
      os_log_t v9 = [v8 uuid];
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to delete backup: %@ with error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

void sub_1000068E8(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v2 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "timed out waiting for result from icloud", v6, 2u);
    }
    uint64_t v3 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v5 = [WeakRetained metadataIndex];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);
  }
}

void sub_1000069A4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  id v6 = objc_opt_new();
  if (a3)
  {
    id v7 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to add iCloud backups", v15, 2u);
    }
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v14 = [v13 uuid];
          [v6 setObject:v13 forKey:v14];
        }
        id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007088(id a1)
{
  NBBackupDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"index"];
  uint64_t v2 = (void *)qword_100034FB0;
  qword_100034FB0 = v1;
}

void sub_100007368(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;

  id v5 = [[NBBackupIndexManager alloc] initWithiCloudBackup:*(void *)(*(void *)(a1 + 32) + 56)];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  [*(id *)(*(void *)(a1 + 32) + 32) pruneLocalBackups];
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  dispatch_source_t v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_memorypressure, 0, 6uLL, *(dispatch_queue_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 24);
  *(void *)(v12 + 24) = v11;

  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v14 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  id v22 = _NSConcreteStackBlock;
  uint64_t v23 = 3221225472;
  v24 = sub_100007544;
  v25 = &unk_10002CAD8;
  objc_copyWeak(&v26, &location);
  dispatch_source_set_event_handler(v14, &v22);
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  long long v15 = [NBRemoteObjectClassC alloc];
  long long v16 = -[NBRemoteObjectClassC initWithDelegate:andQueue:](v15, "initWithDelegate:andQueue:", *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 32) + 16), v22, v23, v24, v25);
  uint64_t v17 = *(void *)(a1 + 32);
  long long v18 = *(void **)(v17 + 48);
  *(void *)(v17 + 48) = v16;

  id v19 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.nanobackup"];
  uint64_t v20 = *(void *)(a1 + 32);
  id v21 = *(void **)(v20 + 8);
  *(void *)(v20 + 8) = v19;

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDelegate:");
  [*(id *)(*(void *)(a1 + 32) + 8) resume];
  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

void sub_100007528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007544(uint64_t a1)
{
  uint64_t v2 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received memory warning", v7, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double Current = CFAbsoluteTimeGetCurrent();
  if (Current - *(double *)&qword_100034FC0 > 10.0)
  {
    id v5 = [WeakRetained backupIndexManager];
    [v5 purgeCache];

    uint64_t v6 = [WeakRetained exclusionListManager];
    [v6 purgeCache];
  }
  qword_100034FC0 = *(void *)&Current;
}

void sub_100007670(id a1)
{
  qword_100034FD0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___NBServerProtocol];

  _objc_release_x1();
}

void sub_1000076B8(uint64_t a1)
{
  uint64_t v2 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v5 = 134217984;
    id v6 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Connection invalidated: (%p)", (uint8_t *)&v5, 0xCu);
  }
}

uint64_t sub_100007BA8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138412802;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ couldn't enumerate %@: %@", (uint8_t *)&v10, 0x20u);
  }

  return 1;
}

uint64_t sub_100007CBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007CD0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007CE4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007F60(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100007F78(uint64_t a1)
{
  uint64_t v2 = +[NRPairedDeviceRegistry sharedInstance];
  uint64_t v3 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  char v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  id v5 = [v4 firstObject];

  id v6 = [v5 valueForProperty:NRDevicePropertyIsAltAccount];
  LOBYTE(v3) = [v6 BOOLValue];

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  if (v3)
  {
    uint64_t v9 = *(void **)(v7 + 48);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100008240;
    v13[3] = &unk_10002C988;
    int v10 = &v14;
    id v14 = *(id *)(a1 + 48);
    [v9 sendDeleteBackupRequest:v8 withResponseBlock:v13];
  }
  else
  {
    uint64_t v11 = *(void **)(v7 + 32);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100008124;
    v15[3] = &unk_10002CBB8;
    int v10 = &v16;
    id v12 = v8;
    id v16 = v12;
    id v17 = *(id *)(a1 + 48);
    [v11 deleteBackupWithID:v12 withCompletion:v15];
  }
}

void sub_100008124(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = nb_daemon_log;
  BOOL v5 = os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v12 = 138412546;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v3;
      uint64_t v8 = "Error occured deleting backup (%@): (%@)";
      uint64_t v9 = v4;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else if (v5)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v11;
    uint64_t v8 = "Successfully deleted backup (%@)";
    uint64_t v9 = v4;
    uint32_t v10 = 12;
    goto LABEL_6;
  }
  (*(void (**)(void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v3, v6);
}

uint64_t sub_100008240(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000084C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100008798(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000087B0(uint64_t a1)
{
  uint64_t v2 = +[NRPairedDeviceRegistry sharedInstance];
  uint64_t v3 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  char v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  BOOL v5 = [v4 firstObject];

  uint64_t v6 = [v5 valueForProperty:NRDevicePropertyIsAltAccount];
  LOBYTE(v3) = [v6 BOOLValue];

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  if (v3)
  {
    uint64_t v9 = *(void **)(v7 + 48);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100009A50;
    v15[3] = &unk_10002C988;
    uint32_t v10 = &v16;
    id v16 = *(id *)(a1 + 56);
    [v9 sendRestoreRequest:v8 withResponseBlock:v15];
  }
  else
  {
    uint64_t v11 = *(void **)(v7 + 32);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100008978;
    v17[3] = &unk_10002CC58;
    uint32_t v10 = (id *)v18;
    id v12 = v8;
    v18[0] = v12;
    id v13 = *(id *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 32);
    id v20 = v13;
    v18[1] = v14;
    id v19 = *(id *)(a1 + 48);
    [v11 backupForID:v12 completion:v17];
  }
}

void sub_100008978(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    char v4 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v5 = *(NSObject **)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v56 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Backup for backupID (%@) could not be found", buf, 0xCu);
    }
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = NBError();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
  }
  if (![v3 backupType])
  {
    id v13 = [(id)objc_opt_class() retrieveGizmoWithPairingID:*(void *)(a1 + 48)];
    if (!v13)
    {
      uint64_t v14 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = *(NSObject **)(a1 + 48);
        *(_DWORD *)buf = 138412290;
        v56 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Failed to find device with pairingID: (%@)", buf, 0xCu);
      }
      uint64_t v16 = *(void *)(a1 + 56);
      id v17 = NBError();
      (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v17);
    }
    long long v18 = [v13 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
    if (!v18)
    {
      id v19 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v13;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to resolve pairing data store path for device: (%@)", buf, 0xCu);
      }
      uint64_t v20 = *(void *)(a1 + 56);
      id v21 = NBError();
      (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v21);
    }
    id v22 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Restoring from tombstone backup.", buf, 2u);
    }
    uint64_t v23 = [*(id *)(*(void *)(a1 + 40) + 32) pathToBackup:v3];
    +[NSFileManager defaultManager];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100009230;
    v51[3] = &unk_10002CC08;
    id v24 = (id)objc_claimAutoreleasedReturnValue();
    id v52 = v24;
    id v53 = *(id *)(a1 + 48);
    id v25 = v18;
    id v54 = v25;
    id v26 = objc_retainBlock(v51);
    uint64_t v27 = [(id)objc_opt_class() localUserDefaultsDirectoryForBackupDirectory:v23];
    v43 = (void *)v27;
    v44 = v26;
    if ([v24 fileExistsAtPath:v27])
    {
      v28 = ((void (*)(void *, uint64_t))v26[2])(v26, v27);
      if (v28) {
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
    else
    {
      v28 = 0;
    }
    uint64_t v31 = [(id)objc_opt_class() remoteBackupDirectoryForBackupDirectory:v23];
    v32 = [*(id *)(a1 + 40) preferencesSyncBackupDirectoryForPairingDataStore:v25];
    v45 = v25;
    if ([v24 fileExistsAtPath:v32])
    {
      v33 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v56 = v32;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Paired device already has a backup directory (%@)", buf, 0xCu);
      }
      v50 = v28;
      [v24 removeItemAtPath:v32 error:&v50];
      v34 = v50;

      if (v34)
      {
        v35 = nb_daemon_log;
        if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v56 = v32;
          __int16 v57 = 2112;
          v58 = v34;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Failed to delete the paired device existing backup directory (%@) with error: (%@)", buf, 0x16u);
        }
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
    else
    {
      v42 = v23;
      v36 = [v32 stringByDeletingLastPathComponent];
      if ([v24 fileExistsAtPath:v36])
      {
        v34 = v28;
      }
      else
      {
        v37 = nb_daemon_log;
        if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v36;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "PreferencesSync directory does not exist. Create it at path (%@)", buf, 0xCu);
        }
        NSFileAttributeKey v61 = NSFileProtectionKey;
        NSFileProtectionType v62 = NSFileProtectionNone;
        v38 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
        v49 = v28;
        [v24 createDirectoryAtPath:v36 withIntermediateDirectories:1 attributes:v38 error:&v49];
        v34 = v49;

        if (v34)
        {
          v39 = nb_daemon_log;
          if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v56 = v36;
            __int16 v57 = 2112;
            v58 = v34;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Failed to create PreferencesSync directory (%@) with error: (%@)", buf, 0x16u);
          }
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
      }

      uint64_t v23 = v42;
    }
    if ([v24 fileExistsAtPath:v31])
    {
      v48 = v34;
      [v24 copyItemAtPath:v31 toPath:v32 error:&v48];
      v40 = v48;

      if (v40)
      {
        v41 = nb_daemon_log;
        if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v56 = v31;
          __int16 v57 = 2112;
          v58 = v32;
          __int16 v59 = 2112;
          v60 = v40;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Failed to copy (%@) to (%@) with error: (%@)", buf, 0x20u);
        }
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
    else
    {
      v40 = v34;
    }
    [*(id *)(a1 + 40) migrateLegacyContactPreferencesFromBackup:v3 device:v13];
    [*(id *)(a1 + 40) migrateLegacyDigitalTouchPreferencesFromBackup:v3 device:v13];
    [*(id *)(a1 + 40) migrateFitnessPreferencesFromBackup:v3 device:v13];
    [*(id *)(a1 + 40) migrateBreathePreferencesFromBackup:v3];

    goto LABEL_49;
  }
  if ([v3 backupType] != (id)1)
  {
    id v29 = (void *)nb_daemon_log;
    if (!os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_50;
    }
    id v13 = v29;
    __int16 v30 = [v3 backupType];
    *(_DWORD *)buf = 134217984;
    v56 = v30;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unknown backup type: %lu", buf, 0xCu);
LABEL_49:

    goto LABEL_50;
  }
  uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 56);
  if (!v8)
  {
    uint64_t v9 = objc_opt_new();
    uint64_t v10 = *(void *)(a1 + 40);
    uint64_t v11 = *(void **)(v10 + 56);
    *(void *)(v10 + 56) = v9;

    uint64_t v8 = *(void **)(*(void *)(a1 + 40) + 56);
  }
  id v12 = [v3 uuid];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100009830;
  v46[3] = &unk_10002CC30;
  v46[4] = *(void *)(a1 + 40);
  id v47 = *(id *)(a1 + 56);
  [v8 backupPayloadForID:v12 completion:v46];

LABEL_50:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

id sub_100009230(void *a1, void *a2)
{
  id v4 = a2;
  BOOL v5 = (void *)a1[4];
  uint64_t v43 = 0;
  v35 = v4;
  uint64_t v6 = objc_msgSend(v5, "contentsOfDirectoryAtPath:error:");
  id v7 = 0;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v35;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Could not list content of directory (%@)", buf, 0xCu);
    }
    id v10 = v8;
    id v2 = v10;
  }
  else
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v6;
    id v11 = [obj countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v11)
    {
      id v12 = v11;
      id v10 = 0;
      uint64_t v34 = *(void *)v40;
      v32 = v6;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v40 != v34) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v15 = [v35 stringByAppendingPathComponent:v14];
          uint64_t v16 = +[NSData dataWithContentsOfFile:v15];

          id v38 = 0;
          id v17 = +[NSPropertyListSerialization propertyListWithData:v16 options:0 format:0 error:&v38];
          id v18 = v38;

          if (v18)
          {
            __int16 v30 = nb_daemon_log;
            if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              id v45 = v14;
              __int16 v46 = 2112;
              id v47 = v18;
              __int16 v48 = 2112;
              id v49 = v16;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Failed to unserialize domain (%@) with error: (%@) for data: (%@)", buf, 0x20u);
            }
            id v10 = v18;

            id v2 = v10;
LABEL_32:
            uint64_t v6 = v32;

            goto LABEL_33;
          }
          id v19 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:v14 pairingID:a1[5] pairingDataStore:a1[6]];
          uint64_t v20 = v19;
          if (v19)
          {
            v36[0] = _NSConcreteStackBlock;
            v36[1] = 3221225472;
            v36[2] = sub_100009740;
            v36[3] = &unk_10002CBE0;
            v36[4] = v14;
            id v21 = v19;
            id v37 = v21;
            [v17 enumerateKeysAndObjectsUsingBlock:v36];
            id v22 = nb_daemon_log;
            if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v45 = v14;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Synchronizing domain (%@)", buf, 0xCu);
            }
            id v10 = [v21 synchronize];
            if (v10)
            {
              uint64_t v23 = nb_daemon_log;
              if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                id v45 = v21;
                __int16 v46 = 2112;
                id v47 = v14;
                __int16 v48 = 2112;
                id v49 = v10;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to synchronize domain accessor (%@) for domain (%@) with error: (%@)", buf, 0x20u);
              }
              id v2 = v10;
              int v24 = 1;
            }
            else
            {
              int v24 = 0;
            }
          }
          else
          {
            id v25 = (void *)nb_daemon_log;
            if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              id v26 = (void *)a1[5];
              uint64_t v27 = v25;
              v28 = [v26 UUIDString];
              id v29 = (void *)a1[6];
              *(_DWORD *)buf = 138412802;
              id v45 = v14;
              __int16 v46 = 2112;
              id v47 = v28;
              __int16 v48 = 2112;
              id v49 = v29;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Failed to instanciate NPSDomainAccessor for domain: (%@); pairingID: (%@); pairingDataStore: (%@)",
                buf,
                0x20u);
            }
            id v10 = 0;
            id v2 = 0;
            int v24 = 1;
          }

          if (v24) {
            goto LABEL_32;
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v39 objects:v50 count:16];
        uint64_t v6 = v32;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      id v10 = 0;
    }

    id v2 = 0;
  }
LABEL_33:

  return v2;
}

void sub_100009740(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Restoring <%@, %@> to (%@)", (uint8_t *)&v9, 0x20u);
  }
  [*(id *)(a1 + 40) setObject:v6 forKey:v5];
}

void sub_100009830(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to download backup payload from iCloud: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100009984;
    v9[3] = &unk_10002C988;
    id v10 = *(id *)(a1 + 40);
    [v8 sendBackupPayload:v5 withResponseBlock:v9];
  }
}

void sub_100009984(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "backup payload response with error: %@", (uint8_t *)&v5, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100009A50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100009D24(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100009D3C(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009E00;
  v4[3] = &unk_10002CCF8;
  id v2 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v2;
  id v6 = *(id *)(a1 + 48);
  id v3 = sub_100009E00((id *)v4);
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

id sub_100009E00(id *a1)
{
  uint64_t v56 = 0;
  __int16 v57 = &v56;
  uint64_t v58 = 0x3032000000;
  __int16 v59 = sub_10000A6B0;
  v60 = sub_10000A6C0;
  id v61 = 0;
  id v2 = [(id)objc_opt_class() retrieveGizmoWithPairingID:a1[5]];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = NRDevicePropertyLocalPairingDataStorePath;
    id v5 = [v2 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
    if (!v5)
    {
      id v21 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v3;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Failed to resolve pairing data store path for existing device: (%@)", buf, 0xCu);
      }
      NBError();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_48;
    }
    id v6 = [(id)objc_opt_class() retrieveGizmoWithPairingID:a1[6]];
    id v7 = v6;
    if (!v6)
    {
      id v22 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        id v23 = a1[6];
        *(_DWORD *)buf = 138412290;
        id v63 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Failed to find device with pairingID: (%@)", buf, 0xCu);
      }
      NBError();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    }
    uint64_t v8 = [v6 valueForProperty:v4];
    if (!v8)
    {
      int v24 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v7;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Failed to resolve pairing data store path for device: (%@)", buf, 0xCu);
      }
      NBError();
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
    id v9 = +[NPSDomainAccessor copyDomainListForPairingID:a1[5] pairingDataStore:v5];
    id v10 = [v9 mutableCopy];

    __int16 v11 = [*((id *)a1[4] + 5) excludedPerGizmoDomains];
    [v10 minusSet:v11];
    id v12 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Excluding the following domains from the restore: (%@)", buf, 0xCu);
    }
    __int16 v13 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v63 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Restoring domains: (%@)", buf, 0xCu);
    }
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_10000A6C8;
    v49[3] = &unk_10002CCD0;
    id v50 = a1[6];
    id v14 = v8;
    id v51 = v14;
    v55 = &v56;
    id v52 = a1[5];
    id v15 = v5;
    id v16 = a1[4];
    id v53 = v15;
    id v54 = v16;
    [v10 enumerateObjectsUsingBlock:v49];
    id v17 = (void *)v57[5];
    if (v17)
    {
      id v18 = v17;
LABEL_45:

LABEL_46:
LABEL_47:

LABEL_48:
      goto LABEL_49;
    }
    id v45 = +[NSFileManager defaultManager];
    id v25 = [a1[4] preferencesSyncBackupDirectoryForPairingDataStore:v14];
    v44 = [a1[4] preferencesSyncBackupDirectoryForPairingDataStore:v15];
    id v26 = v25;
    if ([v45 fileExistsAtPath:v25])
    {
      uint64_t v27 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v63 = v25;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Paired device already has a backup directory (%@)", buf, 0xCu);
      }
      v28 = (id *)(v57 + 5);
      id obj = (id)v57[5];
      [v45 removeItemAtPath:v25 error:&obj];
      objc_storeStrong(v28, obj);
      if (v57[5])
      {
        id v29 = nb_daemon_log;
        if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v30 = (void *)v57[5];
          *(_DWORD *)buf = 138412546;
          id v63 = v25;
          __int16 v64 = 2112;
          v65 = v30;
          uint64_t v31 = "Failed to delete the paired device existing backup directory (%@) with error: (%@)";
          v32 = v29;
          uint32_t v33 = 22;
LABEL_41:
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
          goto LABEL_42;
        }
        goto LABEL_42;
      }
    }
    else
    {
      uint64_t v43 = [v25 stringByDeletingLastPathComponent];
      id v26 = v25;
      if (([v45 fileExistsAtPath:v43] & 1) == 0)
      {
        uint64_t v34 = nb_daemon_log;
        if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v63 = v43;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "PreferencesSync directory does not exist. Create it at path (%@)", buf, 0xCu);
        }
        NSFileAttributeKey v68 = NSFileProtectionKey;
        NSFileProtectionType v69 = NSFileProtectionNone;
        v35 = +[NSDictionary dictionaryWithObjects:&v69 forKeys:&v68 count:1];
        v36 = (id *)(v57 + 5);
        id v47 = (id)v57[5];
        [v45 createDirectoryAtPath:v43 withIntermediateDirectories:1 attributes:v35 error:&v47];
        objc_storeStrong(v36, v47);
        id v26 = v25;

        if (v57[5])
        {
          id v37 = nb_daemon_log;
          if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
          {
            id v38 = (void *)v57[5];
            *(_DWORD *)buf = 138412546;
            id v63 = v43;
            __int16 v64 = 2112;
            v65 = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Failed to create PreferencesSync directory (%@) with error: (%@)", buf, 0x16u);
          }
          id v18 = (id)v57[5];

          goto LABEL_44;
        }
      }
    }
    if (![v45 fileExistsAtPath:v44]
      || (long long v39 = (id *)(v57 + 5),
          id v46 = (id)v57[5],
          [v45 copyItemAtPath:v44 toPath:v26 error:&v46],
          objc_storeStrong(v39, v46),
          !v57[5]))
    {
      [a1[4] migrateBreathePreferencesFromDevice:v3];
      id v18 = 0;
      goto LABEL_44;
    }
    long long v40 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v41 = v57[5];
      *(_DWORD *)buf = 138412802;
      id v63 = v44;
      __int16 v64 = 2112;
      v65 = v26;
      __int16 v66 = 2112;
      uint64_t v67 = v41;
      uint64_t v31 = "Failed to copy (%@) to (%@) with error: (%@)";
      v32 = v40;
      uint32_t v33 = 32;
      goto LABEL_41;
    }
LABEL_42:
    id v18 = (id)v57[5];
LABEL_44:

    goto LABEL_45;
  }
  id v19 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v20 = a1[5];
    *(_DWORD *)buf = 138412290;
    id v63 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to find existing device with pairingID: (%@)", buf, 0xCu);
  }
  NBError();
  id v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_49:

  _Block_object_dispose(&v56, 8);

  return v18;
}

void sub_10000A66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A6B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000A6C0(uint64_t a1)
{
}

void sub_10000A6C8(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:v5 pairingID:a1[4] pairingDataStore:a1[5]];
  if (v6)
  {
    id v7 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:v5 pairingID:a1[6] pairingDataStore:a1[7]];
    uint64_t v8 = v7;
    if (v7)
    {
      uint64_t v9 = [v7 synchronize];
      uint64_t v10 = *(void *)(a1[9] + 8);
      __int16 v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;

      if (!*(void *)(*(void *)(a1[9] + 8) + 40))
      {
        id v12 = [v8 copyKeyList];
        id v13 = [v12 mutableCopy];

        id v14 = [*(id *)(a1[8] + 40) excludedKeysInDomain:v5];
        [v13 minusSet:v14];
        id v15 = nb_daemon_log;
        if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v38 = v5;
          __int16 v39 = 2112;
          id v40 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Excluding the following keys in domain (%@) from the backup: (%@)", buf, 0x16u);
        }
        id v16 = nb_daemon_log;
        if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v38 = v13;
          __int16 v39 = 2112;
          id v40 = v5;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Restoring keys (%@) in domain (%@)", buf, 0x16u);
        }
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10000AA94;
        v33[3] = &unk_10002CCA8;
        id v34 = v8;
        id v35 = v5;
        id v17 = v6;
        id v36 = v17;
        [v13 enumerateObjectsUsingBlock:v33];
        uint64_t v18 = [v17 synchronize];
        uint64_t v19 = *(void *)(a1[9] + 8);
        id v20 = *(void **)(v19 + 40);
        *(void *)(v19 + 40) = v18;

        if (*(void *)(*(void *)(a1[9] + 8) + 40)) {
          *a3 = 1;
        }

        goto LABEL_18;
      }
    }
    else
    {
      uint64_t v27 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (void *)a1[6];
        uint64_t v29 = a1[7];
        *(_DWORD *)buf = 138412802;
        id v38 = v5;
        __int16 v39 = 2112;
        id v40 = v28;
        __int16 v41 = 2112;
        uint64_t v42 = v29;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Failed to instanciate NPSDomainAccessor for domain: (%@); existingPairingID: (%@); existingPairingDataStore: (%@)",
          buf,
          0x20u);
      }
      uint64_t v30 = NBError();
      uint64_t v31 = *(void *)(a1[9] + 8);
      v32 = *(void **)(v31 + 40);
      *(void *)(v31 + 40) = v30;
    }
    *a3 = 1;
LABEL_18:

    goto LABEL_19;
  }
  id v21 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = (void *)a1[4];
    uint64_t v23 = a1[5];
    *(_DWORD *)buf = 138412802;
    id v38 = v5;
    __int16 v39 = 2112;
    id v40 = v22;
    __int16 v41 = 2112;
    uint64_t v42 = v23;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Failed to instanciate NPSDomainAccessor for domain: (%@); pairingID: (%@); pairingDataStore: (%@)",
      buf,
      0x20u);
  }
  uint64_t v24 = NBError();
  uint64_t v25 = *(void *)(a1[9] + 8);
  id v26 = *(void **)(v25 + 40);
  *(void *)(v25 + 40) = v24;

  *a3 = 1;
LABEL_19:
}

void sub_10000AA94(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:v3];
  id v5 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v7 = 138412802;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Read <%@, %@>: (%@)", (uint8_t *)&v7, 0x20u);
  }
  [*(id *)(a1 + 48) setObject:v4 forKey:v3];
}

uint64_t sub_10000ADF8(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

void sub_10000AE18(void *a1)
{
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10000A6B0;
  id v13 = sub_10000A6C0;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000AF50;
  v6[3] = &unk_10002CDC0;
  id v2 = (void *)a1[5];
  v6[4] = a1[4];
  id v7 = v2;
  uint64_t v8 = &v9;
  id v3 = sub_10000AF50((uint64_t)v6);
  uint64_t v4 = a1[6];
  if (v4)
  {
    if (v3) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v10[5];
    }
    (*(void (**)(uint64_t, uint64_t, void *))(v4 + 16))(v4, v5, v3);
  }

  _Block_object_dispose(&v9, 8);
}

void sub_10000AF38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000AF50(uint64_t a1)
{
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_10000A6B0;
  uint64_t v25 = sub_10000A6C0;
  id v26 = 0;
  id v2 = [(id)objc_opt_class() retrieveGizmoWithPairingID:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 valueForProperty:NRDevicePropertyLocalPairingDataStorePath];
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 32);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000B204;
      v15[3] = &unk_10002CD98;
      uint64_t v19 = &v21;
      void v15[4] = v5;
      id v16 = *(id *)(a1 + 40);
      id v7 = v4;
      uint64_t v8 = *(void *)(a1 + 48);
      id v17 = v7;
      uint64_t v20 = v8;
      id v18 = v3;
      [v6 createNewBackup:v15];
      id v9 = (id)v22[5];
    }
    else
    {
      id v12 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v28 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to retrieve the pairing data store for pairingID: (%@)", buf, 0xCu);
      }
      NBError();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v10 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to find device with pairingID: (%@)", buf, 0xCu);
    }
    NBError();
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v21, 8);

  return v9;
}

void sub_10000B1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B204(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[NSFileManager defaultManager];
  NSFileAttributeKey v85 = NSFileProtectionKey;
  NSFileProtectionType v86 = NSFileProtectionNone;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v86 forKeys:&v85 count:1];
  uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v12 + 40);
  [v10 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:v11 error:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);

  uint64_t v13 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (!v13) {
    goto LABEL_4;
  }
  id v14 = [v13 domain];
  if ([v14 isEqualToString:NSCocoaErrorDomain])
  {
    id v15 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) code];

    if (v15 == (id)516)
    {
LABEL_4:
      id v16 = [(id)objc_opt_class() localUserDefaultsDirectoryForBackupDirectory:v8];
      NSFileAttributeKey v83 = NSFileProtectionKey;
      NSFileProtectionType v84 = NSFileProtectionNone;
      id v17 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
      uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
      id v75 = *(id *)(v18 + 40);
      [v10 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:v17 error:&v75];
      objc_storeStrong((id *)(v18 + 40), v75);

      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        uint64_t v19 = nb_daemon_log;
        if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          *(_DWORD *)buf = 138412546;
          id v78 = v8;
          __int16 v79 = 2112;
          v80 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to create backup directory for local settings (%@) with error: (%@)", buf, 0x16u);
        }
      }
      else
      {
        id v23 = +[NPSDomainAccessor copyDomainListForPairingID:*(void *)(a1 + 40) pairingDataStore:*(void *)(a1 + 48)];
        id v24 = [v23 mutableCopy];

        uint64_t v25 = [*(id *)(*(void *)(a1 + 32) + 40) excludedPerGizmoDomains];
        [v24 minusSet:v25];
        id v26 = nb_daemon_log;
        if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v78 = v25;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Excluding the following domains from the backup: (%@)", buf, 0xCu);
        }
        uint64_t v27 = nb_daemon_log;
        if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v78 = v24;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Capturing domains: (%@)", buf, 0xCu);
        }
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472;
        v69[2] = sub_10000BCD0;
        v69[3] = &unk_10002CD70;
        id v70 = *(id *)(a1 + 40);
        id v28 = *(id *)(a1 + 48);
        uint64_t v74 = *(void *)(a1 + 64);
        uint64_t v29 = *(void *)(a1 + 32);
        id v71 = v28;
        uint64_t v72 = v29;
        id v73 = v16;
        [v24 enumerateObjectsUsingBlock:v69];
        if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
        {
          uint64_t v67 = [(id)objc_opt_class() remoteBackupDirectoryForBackupDirectory:v8];
          __int16 v66 = [*(id *)(a1 + 32) preferencesSyncBackupDirectoryForPairingDataStore:*(void *)(a1 + 48)];
          if (objc_msgSend(v10, "fileExistsAtPath:")
            && (uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8),
                id v68 = *(id *)(v30 + 40),
                [v10 copyItemAtPath:v66 toPath:v67 error:&v68],
                objc_storeStrong((id *)(v30 + 40), v68),
                *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)))
          {
            uint64_t v31 = nb_daemon_log;
            if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v32 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
              *(_DWORD *)buf = 138412802;
              id v78 = v66;
              __int16 v79 = 2112;
              v80 = v67;
              __int16 v81 = 2112;
              uint64_t v82 = v32;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Failed to copy (%@) to (%@) with error: (%@)", buf, 0x20u);
            }
          }
          else
          {
            uint32_t v33 = [v8 stringByAppendingPathComponent:@"ActiveWatchFace.png"];
            uint64_t v34 = +[NBWatchFaceSnapshotter captureWatchFaceForPairingID:*(void *)(a1 + 40) toFilePath:v33];
            uint64_t v35 = *(void *)(*(void *)(a1 + 64) + 8);
            id v36 = *(void **)(v35 + 40);
            *(void *)(v35 + 40) = v34;

            if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
            {
              v65 = v33;
              uint64_t v37 = objc_opt_new();
              uint64_t v38 = *(void *)(*(void *)(a1 + 72) + 8);
              __int16 v39 = *(void **)(v38 + 40);
              *(void *)(v38 + 40) = v37;

              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setUuid:v7];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setBackupType:0];
              id v40 = +[NSDate date];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setLastModificationDate:v40];

              __int16 v41 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [(id)objc_opt_class() recursiveDirectorySize:v8]);
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setSizeInBytes:v41];

              uint64_t v42 = [*(id *)(a1 + 56) valueForProperty:NRDevicePropertyName];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setName:v42];

              uint64_t v43 = [*(id *)(a1 + 56) valueForProperty:NRDevicePropertyProductType];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setProductType:v43];

              v44 = [*(id *)(a1 + 56) valueForProperty:NRDevicePropertySystemName];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setProductName:v44];

              id v45 = [*(id *)(a1 + 56) valueForProperty:NRDevicePropertySystemVersion];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setSystemVersion:v45];

              id v46 = [*(id *)(a1 + 56) valueForProperty:NRDevicePropertySystemBuildVersion];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setSystemBuildVersion:v46];

              id v47 = [*(id *)(a1 + 56) valueForProperty:NRDevicePropertyMarketingVersion];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setMarketingVersion:v47];

              __int16 v48 = [*(id *)(a1 + 56) valueForProperty:NRDevicePropertyColor];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDeviceColor:v48];

              id v49 = [*(id *)(a1 + 56) valueForProperty:NRDevicePropertyEnclosureColor];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDeviceEnclosureColor:v49];

              id v50 = [*(id *)(a1 + 56) valueForProperty:NRDevicePropertyDmin];
              id v51 = [v50 objectForKeyedSubscript:&off_10002E7F0];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setBottomEnclosureMaterial:v51];

              id v52 = [v50 objectForKeyedSubscript:&off_10002E808];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setTopEnclosureMaterial:v52];

              id v53 = [v50 objectForKeyedSubscript:&off_10002E820];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setFcmMaterial:v53];

              id v54 = [v50 objectForKeyedSubscript:&off_10002E838];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setBcmWindowMaterial:v54];

              v55 = [*(id *)(a1 + 56) valueForProperty:NRDevicePropertyDeviceCoverGlassColor];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setCoverGlassColor:v55];

              uint64_t v56 = [*(id *)(a1 + 56) valueForProperty:NRDevicePropertyDeviceHousingColor];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setHousingColor:v56];

              __int16 v57 = [*(id *)(a1 + 56) valueForProperty:NRDevicePropertyDeviceBackingColor];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setBackingColor:v57];

              uint64_t v58 = +[MCProfileConnection sharedConnection];
              objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setDiagnosticsOptInEnabled:", objc_msgSend(v58, "effectiveBoolValueForSetting:", MCFeatureDiagnosticsSubmissionAllowed) == 1);

              objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), "setLocationOptInEnabled:", +[CLLocationManager locationServicesEnabled](CLLocationManager, "locationServicesEnabled"));
              __int16 v59 = [*(id *)(a1 + 56) valueForProperty:NRDevicePropertyCSN];
              [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setDeviceCSN:v59];

              uint64_t v60 = v9[2](v9, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
              uint64_t v61 = *(void *)(*(void *)(a1 + 64) + 8);
              NSFileProtectionType v62 = *(void **)(v61 + 40);
              *(void *)(v61 + 40) = v60;

              if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
              {
                id v63 = nb_daemon_log;
                if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
                {
                  __int16 v64 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
                  *(_DWORD *)buf = 138412290;
                  id v78 = v64;
                  _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "Backing up succeeded: (%@)", buf, 0xCu);
                }
                [*(id *)(*(void *)(a1 + 32) + 32) pruneLocalBackups];
              }

              uint32_t v33 = v65;
            }
          }
        }
      }
      goto LABEL_29;
    }
  }
  else
  {
  }
  uint64_t v21 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v22 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    *(_DWORD *)buf = 138412546;
    id v78 = v8;
    __int16 v79 = 2112;
    v80 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Failed to create backup directory (%@) with error: (%@)", buf, 0x16u);
  }
LABEL_29:
}

void sub_10000BCD0(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:v5 pairingID:*(void *)(a1 + 32) pairingDataStore:*(void *)(a1 + 40)];
  id v7 = v6;
  if (!v6)
  {
    id v23 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(a1 + 32);
      uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 40);
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v24;
      *(_WORD *)&buf[22] = 2112;
      id v47 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Failed to instanciate NPSDomainAccessor for domain: (%@); pairingID: (%@); pairingDataStore: (%@)",
        buf,
        0x20u);
    }
    uint64_t v26 = NBError();
    uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8);
    id v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    goto LABEL_15;
  }
  uint64_t v8 = [v6 synchronize];
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
LABEL_15:
    *a3 = 1;
    goto LABEL_23;
  }
  id v11 = [v7 copyKeyList];
  id v12 = [v11 mutableCopy];

  uint64_t v13 = [*(id *)(*(void *)(a1 + 48) + 40) excludedKeysInDomain:v5];
  [v12 minusSet:v13];
  id v14 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Excluding the following keys in domain (%@) from the backup: (%@)", buf, 0x16u);
  }
  id v15 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v5;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Backing up keys (%@) in domain (%@)", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v47 = sub_10000A6B0;
  __int16 v48 = sub_10000A6C0;
  id v49 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10000C1D0;
  v36[3] = &unk_10002CD48;
  id v37 = v7;
  id v16 = v5;
  id v38 = v16;
  __int16 v39 = buf;
  [v12 enumerateObjectsUsingBlock:v36];
  uint64_t v17 = *(void *)(*(void *)&buf[8] + 40);
  if (v17)
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = 0;
    uint64_t v19 = +[NSPropertyListSerialization dataWithPropertyList:v17 format:200 options:0 error:&obj];
    objc_storeStrong((id *)(v18 + 40), obj);
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
    {
      uint64_t v20 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = *(void *)(*(void *)&buf[8] + 40);
        uint64_t v22 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        *(_DWORD *)id v40 = 138412802;
        id v41 = v16;
        __int16 v42 = 2112;
        uint64_t v43 = v21;
        __int16 v44 = 2112;
        uint64_t v45 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Failed to serialize domain (%@) backup dictionary (%@) with error: (%@)", v40, 0x20u);
      }
      *a3 = 1;
    }
    else
    {
      uint64_t v29 = [*(id *)(a1 + 56) stringByAppendingPathComponent:v16];
      uint64_t v30 = *(void *)(*(void *)(a1 + 64) + 8);
      id v34 = *(id *)(v30 + 40);
      [v19 writeToFile:v29 options:268435457 error:&v34];
      objc_storeStrong((id *)(v30 + 40), v34);
      uint64_t v31 = (void *)v29;
      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        uint64_t v32 = nb_daemon_log;
        if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          *(_DWORD *)id v40 = 138412802;
          id v41 = v16;
          __int16 v42 = 2112;
          uint64_t v43 = v29;
          __int16 v44 = 2112;
          uint64_t v45 = v33;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Failed to write domain (%@) backup data blob at path (%@) with error: (%@)", v40, 0x20u);
        }
        *a3 = 1;
        uint64_t v31 = (void *)v29;
      }
    }
  }

  _Block_object_dispose(buf, 8);
LABEL_23:
}

void sub_10000C1A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C1D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) objectForKey:v3];
  id v5 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 40);
    int v11 = 138412802;
    uint64_t v12 = v6;
    __int16 v13 = 2112;
    id v14 = v3;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Read <%@, %@>: (%@)", (uint8_t *)&v11, 0x20u);
  }
  if (v4)
  {
    id v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v7)
    {
      uint64_t v8 = objc_opt_new();
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      id v7 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    }
    [v7 setObject:v4 forKey:v3];
  }
}

void sub_10000C358(id a1)
{
  qword_100034FD8 = +[NSSet setWithObjects:@"personNameOrdering", @"personShortNameFormatEnabled", @"personShortNameFormat", @"personShortNamePreferNicknames", 0];

  _objc_release_x1();
}

id sub_10000C954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

id sub_10000C960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKey:a2];
}

id sub_10000D920(uint64_t a1)
{
  return [*(id *)(a1 + 32) remoteObjectReceivedBackupListRequest:*(void *)(a1 + 40) requestIdentifier:*(void *)(a1 + 48)];
}

void sub_10000DAA0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) backupID];
  uint64_t v4 = [v3 uuidFromData:v5];
  [v2 remoteObjectReceivedRestoreRequest:v4 requestIdentifier:*(void *)(a1 + 56)];
}

void sub_10000DC1C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) outgoingResponseIdentifier];
  [v1 remoteObjectReceivedRestorePayloadRequest:v2 requestIdentifier:v3];
}

void sub_10000DDE8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  id v5 = [*(id *)(a1 + 48) backupID];
  uint64_t v4 = [v3 uuidFromData:v5];
  [v2 remoteObjectReceivedDeleteBackupRequest:v4 requestIdentifier:*(void *)(a1 + 56)];
}

void sub_10000E464(_Unwind_Exception *a1)
{
}

void sub_10000F020(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[NBRemoteObjectClassC sendBackupListRequestWithResponseBlock:]_block_invoke";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Error %{public}@ sending backup request", (uint8_t *)&v5, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10000F108(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = [NBPBBackupListResponse alloc];
    int v5 = [v3 data];
    uint64_t v6 = [(NBPBBackupListResponse *)v4 initWithData:v5];

    __int16 v7 = +[NSMutableArray array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v8 = [(NBPBBackupListResponse *)v6 backups];
    id v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          __int16 v13 = [*(id *)(a1 + 32) backupFromProtobuf:*(void *)(*((void *)&v23 + 1) + 8 * i)];
          [v7 addObject:v13];
        }
        id v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v10);
    }

    id v14 = [(NBPBBackupListResponse *)v6 error];
    id v15 = [v14 length];

    uint64_t v16 = *(void *)(a1 + 40);
    if (v15)
    {
      uint64_t v17 = *(void **)(a1 + 32);
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = [(NBPBBackupListResponse *)v6 error];
      uint64_t v20 = [v17 class:v18 fromBytes:v19];
      (*(void (**)(uint64_t, void *, void *))(v16 + 16))(v16, v7, v20);
    }
    else
    {
      (*(void (**)(void, void *, void))(v16 + 16))(*(void *)(a1 + 40), v7, 0);
    }
  }
  else
  {
    uint64_t v21 = *(void *)(a1 + 40);
    uint64_t v22 = +[NSError errorWithDomain:@"NBErrorDomain" code:3 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v22);
  }
}

void sub_10000F544(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[NBRemoteObjectClassC sendBackupListResponse:error:withRequestIdentifier:withSentBlock:]_block_invoke";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Error %{public}@ sending backup response", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F790(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[NBRemoteObjectClassC sendRestoreRequest:withResponseBlock:]_block_invoke";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Error %{public}@ sending restore request", (uint8_t *)&v5, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10000F874(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (v12)
  {
    id v3 = [NBPBRestoreResponse alloc];
    uint64_t v4 = [v12 data];
    int v5 = [(NBPBRestoreResponse *)v3 initWithData:v4];

    uint64_t v8 = a1 + 32;
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(v8 + 8);
    uint64_t v9 = objc_opt_class();
    id v10 = [(NBPBRestoreResponse *)v5 error];
    uint64_t v11 = [v6 class:v9 fromBytes:v10];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v11);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

BOOL sub_10000F9FC(id a1, NRDevice *a2)
{
  uint64_t v2 = NRDevicePropertyIsActive;
  id v3 = a2;
  uint64_t v4 = [(NRDevice *)v3 valueForProperty:v2];

  int v5 = [(NRDevice *)v3 valueForProperty:NRDevicePropertyIsPaired];

  return v4 && v5 == 0;
}

void sub_10000FD8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[NBRemoteObjectClassC sendBackupPayload:withResponseBlock:]_block_invoke";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Error %{public}@ sending restore request", (uint8_t *)&v5, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10000FE70(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (v12)
  {
    id v3 = [NBPBRestoreResponse alloc];
    uint64_t v4 = [v12 data];
    int v5 = [(NBPBRestoreResponse *)v3 initWithData:v4];

    uint64_t v8 = a1 + 32;
    uint64_t v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(v8 + 8);
    uint64_t v9 = objc_opt_class();
    id v10 = [(NBPBRestoreResponse *)v5 error];
    uint64_t v11 = [v6 class:v9 fromBytes:v10];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v11);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100010094(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[NBRemoteObjectClassC sendRestoreResponse:withRequestIdentifier:withSentBlock:]_block_invoke";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Error %{public}@ sending restore response", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000102A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[NBRemoteObjectClassC sendCreateBackupRequestWithResponseBlock:]_block_invoke";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Error %{public}@ sending create backup request", (uint8_t *)&v5, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100010390(uint64_t a1, void *a2)
{
  id v14 = a2;
  if (v14)
  {
    id v3 = [NBPBCreateBackupResponse alloc];
    uint64_t v4 = [v14 data];
    int v5 = [(NBPBCreateBackupResponse *)v3 initWithData:v4];

    uint64_t v6 = *(void **)(a1 + 32);
    __int16 v7 = [(NBPBCreateBackupResponse *)v5 backup];
    id v8 = [v6 backupFromProtobuf:v7];

    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = [(NBPBCreateBackupResponse *)v5 error];
    id v12 = [v9 class:v10 fromBytes:v11];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 40);
    int v5 = +[NSError errorWithDomain:@"NBErrorDomain" code:3 userInfo:0];
    (*(void (**)(uint64_t, void, NBPBCreateBackupResponse *))(v13 + 16))(v13, 0, v5);
  }
}

void sub_100010650(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[NBRemoteObjectClassC sendCreateBackupResponse:withRequestIdentifier:error:withSentBlock:]_block_invoke";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Error %{public}@ sending create backup response", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001089C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[NBRemoteObjectClassC sendDeleteBackupRequest:withResponseBlock:]_block_invoke";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Error %{public}@ sending delete backup request", (uint8_t *)&v5, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100010980(uint64_t a1, void *a2)
{
  id v12 = a2;
  if (v12)
  {
    id v3 = [NBPBDeleteBackupResponse alloc];
    uint64_t v4 = [v12 data];
    int v5 = [(NBPBDeleteBackupResponse *)v3 initWithData:v4];

    uint64_t v6 = [(NBPBDeleteBackupResponse *)v5 error];

    if (v6)
    {
      __int16 v7 = *(void **)(a1 + 32);
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = [(NBPBDeleteBackupResponse *)v5 error];
      uint64_t v10 = [v7 class:v8 fromBytes:v9];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      (*(void (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
    }
  }
  else
  {
    uint64_t v11 = *(void *)(a1 + 40);
    int v5 = +[NSError errorWithDomain:@"NBErrorDomain" code:3 userInfo:0];
    (*(void (**)(uint64_t, NBPBDeleteBackupResponse *))(v11 + 16))(v11, v5);
  }
}

void sub_100010BF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[NBRemoteObjectClassC sendDeleteBackupResponse:withRequestIdentifier:withSentBlock:]_block_invoke";
      __int16 v7 = 2114;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: Error %{public}@ sending delete backup response", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL sub_100010F98(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        id v12 = objc_alloc_init(NBPBBackupMetadata);
        objc_storeStrong((id *)(a1 + 8), v12);
        if (!PBReaderPlaceMark() || (sub_10001A65C((uint64_t)v12, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_25:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    uint64_t v13 = PBReaderReadData();
    id v12 = *(NBPBBackupMetadata **)(a1 + 16);
    *(void *)(a1 + 16) = v13;
LABEL_23:

    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_100011940(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "removeDelegate:");
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 80);
  *(void *)(v2 + 80) = 0;

  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v4 = *(id *)(*(void *)(a1 + 32) + 24);
  id v5 = [v4 countByEnumeratingWithState:&v61 objects:v68 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v62;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v62 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(*((void *)&v61 + 1) + 8 * i)];
        [v9 invalidate];
      }
      id v6 = [v4 countByEnumeratingWithState:&v61 objects:v68 count:16];
    }
    while (v6);
  }

  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v10 = *(id *)(*(void *)(a1 + 32) + 24);
  id v11 = [v10 countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v58;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v58 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(*((void *)&v57 + 1) + 8 * (void)j)];
        [v15 invalidate];
      }
      id v12 = [v10 countByEnumeratingWithState:&v57 objects:v67 count:16];
    }
    while (v12);
  }

  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(v16 + 24);
  *(void *)(v16 + 24) = 0;

  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void **)(v18 + 48);
  *(void *)(v18 + 48) = 0;

  uint64_t v20 = *(void *)(a1 + 32);
  if (*(void *)(v20 + 56))
  {
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    uint64_t v21 = [*(id *)(v20 + 8) allKeys];
    id v22 = [v21 copy];

    id v23 = [v22 countByEnumeratingWithState:&v53 objects:v66 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v54;
      do
      {
        for (k = 0; k != v24; k = (char *)k + 1)
        {
          if (*(void *)v54 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v53 + 1) + 8 * (void)k);
          id v28 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v27];
          if (v28)
          {
            [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:v27];
            uint64_t v29 = *(NSObject **)(*(void *)(a1 + 32) + 56);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100011E20;
            block[3] = &unk_10002CF00;
            id v52 = v28;
            dispatch_async(v29, block);
          }
        }
        id v24 = [v22 countByEnumeratingWithState:&v53 objects:v66 count:16];
      }
      while (v24);
    }

    uint64_t v30 = *(void *)(a1 + 32);
    uint64_t v31 = *(void **)(v30 + 8);
    *(void *)(v30 + 8) = 0;

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v32 = [*(id *)(*(void *)(a1 + 32) + 16) allKeys];
    id v33 = [v32 copy];

    id v34 = [v33 countByEnumeratingWithState:&v47 objects:v65 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v48;
      do
      {
        for (m = 0; m != v35; m = (char *)m + 1)
        {
          if (*(void *)v48 != v36) {
            objc_enumerationMutation(v33);
          }
          id v38 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(*((void *)&v47 + 1) + 8 * (void)m)];
          __int16 v39 = v38;
          if (v38)
          {
            id v40 = *(void **)(*(void *)(a1 + 32) + 16);
            id v41 = objc_retainBlock(v38);
            [v40 removeObjectForKey:v41];

            __int16 v42 = *(NSObject **)(*(void *)(a1 + 32) + 56);
            v45[0] = _NSConcreteStackBlock;
            v45[1] = 3221225472;
            v45[2] = sub_100011EF8;
            v45[3] = &unk_10002CF00;
            id v46 = v39;
            dispatch_async(v42, v45);
          }
        }
        id v35 = [v33 countByEnumeratingWithState:&v47 objects:v65 count:16];
      }
      while (v35);
    }

    uint64_t v43 = *(void *)(a1 + 32);
    __int16 v44 = *(void **)(v43 + 16);
    *(void *)(v43 + 16) = 0;
  }
}

void sub_100011E20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  NSErrorUserInfoKey v4 = NSLocalizedDescriptionKey;
  CFStringRef v5 = @"NRRemoteObject invalidated";
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  id v3 = +[NSError errorWithDomain:@"com.apple.nanoregistryd" code:567 userInfo:v2];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

uint64_t sub_100011EF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100012570(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100012584(uint64_t a1)
{
  uint64_t v2 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "(message processing started)", buf, 2u);
  }
  (*(void (**)(void, id, void))(a1 + 56))(*(void *)(a1 + 32), [*(id *)(a1 + 40) selector], *(void *)(a1 + 48));
  id v3 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)NSErrorUserInfoKey v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(message processing completed)", v4, 2u);
  }
}

id sub_100012A04(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queueSendMessage:0 orPath:*(void *)(a1 + 40) type:*(unsigned __int16 *)(a1 + 96) requestUUID:0 withTimeout:*(void *)(a1 + 48) withResponseTimeout:*(void *)(a1 + 56) withDescription:*(void *)(a1 + 64) onlyOneFor:*(void *)(a1 + 72) didSend:*(void *)(a1 + 80) andResponse:*(void *)(a1 + 88)];
}

id sub_100012D74(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queueSendMessage:*(void *)(a1 + 40) orPath:0 type:*(unsigned __int16 *)(a1 + 104) requestUUID:*(void *)(a1 + 48) withTimeout:*(void *)(a1 + 56) withResponseTimeout:*(void *)(a1 + 64) withDescription:*(void *)(a1 + 72) onlyOneFor:*(void *)(a1 + 80) didSend:*(void *)(a1 + 88) andResponse:*(void *)(a1 + 96)];
}

void sub_100012E54(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 40) + 24) removeObjectForKey:v2];
  NSErrorUserInfoKey v4 = [*(id *)(*(void *)(a1 + 40) + 16) objectForKeyedSubscript:v2];
  CFStringRef v5 = v4;
  if (v4)
  {
    id v6 = *(NSObject **)(*(void *)(a1 + 40) + 56);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012FBC;
    block[3] = &unk_10002CF00;
    id v8 = v4;
    dispatch_async(v6, block);
    [*(id *)(*(void *)(a1 + 40) + 16) removeObjectForKey:v2];
  }
}

uint64_t sub_100012FBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000137F4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100013808(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100013B34(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100013B48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100013FE4(uint64_t a1)
{
  uint64_t v2 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "(message processing started)", buf, 2u);
  }
  (*(void (**)(void, id, void, void))(a1 + 64))(*(void *)(a1 + 32), [*(id *)(a1 + 40) selector], *(void *)(a1 + 48), *(void *)(a1 + 56));
  id v3 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)NSErrorUserInfoKey v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(message processing completed)", v4, 2u);
  }
}

id sub_100014408(uint64_t a1)
{
  uint64_t v2 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)NSErrorUserInfoKey v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Init CoreData after first unlock", v4, 2u);
  }
  return [*(id *)(a1 + 32) _initCoreData];
}

void sub_100014608(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to retrieve backups: %@", buf, 0xCu);
    }
  }
  id v8 = *(void **)(a1 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001477C;
  v10[3] = &unk_10002D110;
  id v11 = v5;
  id v12 = v8;
  id v15 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v9 = v5;
  [v8 _determineBackupToCreateFromBackupList:v9 withCompletion:v10];
}

void sub_10001477C(uint64_t a1, unint64_t a2)
{
  uint64_t v20 = 0;
  uint64_t v21 = (id *)&v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1000149E4;
  id v24 = sub_1000149F4;
  id v25 = 0;
  NSErrorUserInfoKey v4 = nb_daemon_log;
  BOOL v5 = os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      if (a2 > 5) {
        CFStringRef v6 = @"NONE";
      }
      else {
        CFStringRef v6 = *(&off_10002D4A8 + a2 - 1);
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v27 = v6;
      id v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Create backup of type: %@", buf, 0xCu);
    }
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100014A24;
    v14[3] = &unk_10002D0E8;
    uint64_t v18 = &v20;
    id v12 = *(id *)(a1 + 32);
    unint64_t v19 = a2;
    uint64_t v13 = *(void *)(a1 + 40);
    id v15 = v12;
    uint64_t v16 = v13;
    id v17 = *(id *)(a1 + 64);
    [v9 saveBackup:a2 withDate:v10 payload:v11 withCompletion:v14];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "No Backup to create", buf, 2u);
    }
    objc_storeStrong(v21 + 5, *(id *)(a1 + 32));
    [*(id *)(a1 + 40) _prune:v21[5]];
    uint64_t v7 = *(void *)(a1 + 64);
    if (v7) {
      (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
    }
  }
  _Block_object_dispose(&v20, 8);
}

void sub_1000149C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000149E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000149F4(uint64_t a1)
{
}

CFStringRef sub_1000149FC(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"NONE";
  }
  else {
    return *(&off_10002D4A8 + a1 - 1);
  }
}

void sub_100014A24(uint64_t a1, void *a2, void *a3)
{
  BOOL v5 = a2;
  id v6 = a3;
  uint64_t v7 = nb_daemon_log;
  BOOL v8 = os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT);
  if (v5 || !v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to save backup %@", buf, 0xCu);
    }
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(id *)(a1 + 32);
    uint64_t v13 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }
  else
  {
    if (v8)
    {
      unint64_t v9 = *(void *)(a1 + 64) - 1;
      if (v9 > 4) {
        CFStringRef v10 = @"NONE";
      }
      else {
        CFStringRef v10 = *(&off_10002D4A8 + v9);
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v21 = v10;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Backup of type %@ successfully created", buf, 0xCu);
    }
    uint64_t v15 = [*(id *)(a1 + 32) arrayByAddingObject:v6];
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v13 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
  }

  [*(id *)(a1 + 40) _prune:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  void v18[2] = sub_100014C18;
  v18[3] = &unk_10002D0C0;
  id v17 = *(void **)(a1 + 40);
  id v19 = *(id *)(a1 + 48);
  [v17 requestExportWithCompletion:v18];
}

void sub_100014C18(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSErrorUserInfoKey v4 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = v4;
    id v6 = [v3 error];
    int v9 = 138412290;
    CFStringRef v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Export finished with: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7)
  {
    BOOL v8 = [v3 error];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

void sub_100014DC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v6)
    {
      (*(void (**)(void, void, id))(v8 + 16))(*(void *)(a1 + 40), 0, v6);
    }
    else
    {
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      CFStringRef v27 = @"backupID could not be found";
      int v9 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      CFStringRef v10 = +[NSError errorWithDomain:@"com.apple.NanoBackup" code:1 userInfo:v9];
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v10);
    }
  }
  uint64_t v11 = [v5 payload];
  id v12 = [*(id *)(a1 + 32) tempDirString];
  uint64_t v13 = [v12 stringByAppendingPathComponent:@"restoreData"];
  id v14 = +[NSURL fileURLWithPath:v13];

  uint64_t v15 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = v15;
    id v17 = [v14 path];
    int v24 = 138412290;
    id v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "tempfilepath: %@", (uint8_t *)&v24, 0xCu);
  }
  uint64_t v18 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = v18;
    id v20 = [v11 length];
    int v24 = 134217984;
    id v25 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Payload size: %lu", (uint8_t *)&v24, 0xCu);
  }
  CFStringRef v21 = [v14 path];
  [v11 writeToFile:v21 atomically:1];

  uint64_t v22 = *(void *)(a1 + 40);
  id v23 = [v14 path];
  (*(void (**)(uint64_t, void *, void))(v22 + 16))(v22, v23, 0);
}

void sub_1000150E8(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = objc_opt_new();
  id v14 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Daily Backups: %@", buf, 0xCu);
  }
  uint64_t v15 = *(void **)(a1 + 32);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100015394;
  v32[3] = &unk_10002D188;
  id v16 = v13;
  id v33 = v16;
  [v15 _pruneDailyBackups:v9 withPruneAction:v32];
  id v17 = *(void **)(a1 + 32);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000153A0;
  v30[3] = &unk_10002D188;
  id v18 = v16;
  id v31 = v18;
  [v17 _pruneWeeklyBackups:v12 withPruneAction:v30];

  id v19 = *(void **)(a1 + 32);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1000153AC;
  v28[3] = &unk_10002D188;
  id v20 = v18;
  id v29 = v20;
  [v19 _pruneMonthlyBackups:v11 withPruneAction:v28];

  CFStringRef v21 = *(void **)(a1 + 32);
  id v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  id v25 = sub_1000153B8;
  NSErrorUserInfoKey v26 = &unk_10002D188;
  id v27 = v20;
  id v22 = v20;
  [v21 _pruneYearlyBackups:v10 withPruneAction:&v23];

  objc_msgSend(*(id *)(a1 + 32), "removeBackups:", v22, v23, v24, v25, v26);
}

id sub_100015394(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id sub_1000153A0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id sub_1000153AC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

id sub_1000153B8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_1000157A0(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  NSErrorUserInfoKey v4 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "strongSelf: %@", buf, 0xCu);
  }
  v15[0] = @"NTKSnapshotUnadornedContentKey";
  v15[1] = @"NTKSnapshotUIOnlyKey";
  v16[0] = &__kCFBooleanFalse;
  v16[1] = &__kCFBooleanFalse;
  v15[2] = @"NTKSnapshotUseCanonicalContentKey";
  v15[3] = @"NTKSnapshotIgnoreSnapshotImages";
  v16[2] = &__kCFBooleanTrue;
  v16[3] = &__kCFBooleanTrue;
  void v15[4] = @"NTKSnapshotPersistableKey";
  void v15[5] = @"NTKSnapshotShouldUseSampleComplicationTemplatesKey";
  v16[4] = &__kCFBooleanFalse;
  v16[5] = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:6];
  if (WeakRetained)
  {
    id v6 = [WeakRetained connection];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100015A84;
    v12[3] = &unk_10002D1D8;
    objc_copyWeak(&v14, v2);
    id v13 = *(id *)(a1 + 32);
    uint64_t v7 = [v6 remoteObjectProxyWithErrorHandler:v12];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100015BF0;
    v9[3] = &unk_10002D200;
    objc_copyWeak(&v11, v2);
    id v10 = *(id *)(a1 + 32);
    [v7 snapshotLibrarySelectedFaceForDeviceUUID:0 options:v5 completion:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v14);
  }
  else
  {
    uint64_t v8 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Strong self is nil!!!", buf, 2u);
    }
  }
}

void sub_100015A58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100015A84(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSErrorUserInfoKey v4 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "error: (%@)", buf, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained internalQueue];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100015BD8;
    v8[3] = &unk_10002CF28;
    id v10 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v7, v8);
  }
}

uint64_t sub_100015BD8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_100015BF0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Got snapshot: %@", buf, 0xCu);
  }
  if (WeakRetained)
  {
    id v6 = [WeakRetained internalQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100015D44;
    v7[3] = &unk_10002CF28;
    id v9 = *(id *)(a1 + 32);
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

uint64_t sub_100015D44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_100015EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100015EC8(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___XPCFaceSnapshotServer];
  uint64_t v2 = (void *)qword_100034FF0;
  qword_100034FF0 = v1;

  id v3 = (void *)qword_100034FF0;
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  NSErrorUserInfoKey v4 = +[NSArray arrayWithObjects:v6 count:2];
  id v5 = +[NSSet setWithArray:v4];
  [v3 setClasses:v5 forSelector:"snapshotLibrarySelectedFaceForDeviceUUID:options:completion:" argumentIndex:0 ofReply:1];
}

void sub_100015FC8(id a1)
{
  uint64_t v1 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v2, 2u);
  }
}

void sub_100016030(uint64_t a1)
{
  uint64_t v2 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Connection invalidated", buf, 2u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  NSErrorUserInfoKey v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained internalQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016114;
    block[3] = &unk_10002C7F8;
    void block[4] = v4;
    dispatch_async(v5, block);
  }
}

id sub_100016114(uint64_t a1)
{
  return [*(id *)(a1 + 32) setNtkXpcConnection:0];
}

void sub_1000161B4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = objc_msgSend(*(id *)(a1 + 32), "_NBBackupFromNBBackupiCloudModel:", *(void *)(*((void *)&v13 + 1) + 8 * (void)v11), (void)v13);
          if (v12) {
            [v6 addObject:v12];
          }

          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_1000163C0(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) removeBackups:a2];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

int64_t sub_100016734(id a1, NBBackupiCloudModel *a2, NBBackupiCloudModel *a3)
{
  NSErrorUserInfoKey v4 = a3;
  id v5 = [(NBBackupiCloudModel *)a2 dateCreated];
  id v6 = [(NBBackupiCloudModel *)v4 dateCreated];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_100016848(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v9 = a3;
  id v10 = a2;
  id v14 = [a5 arrayByAddingObjectsFromArray:a4];
  id v11 = [v14 arrayByAddingObjectsFromArray:v9];

  id v12 = [v14 arrayByAddingObjectsFromArray:v10];

  if ([*(id *)(a1 + 32) _shouldCreateMonthly:v14])
  {
    long long v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_5:
    v13();
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 32) _shouldCreateWeekly:v11])
  {
    long long v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_5;
  }
  [*(id *)(a1 + 32) _shouldCreateDaily:v12];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_7:
}

int64_t sub_100016984(id a1, NBBackupiCloudModel *a2, NBBackupiCloudModel *a3)
{
  NSErrorUserInfoKey v4 = a3;
  id v5 = [(NBBackupiCloudModel *)a2 dateCreated];
  id v6 = [(NBBackupiCloudModel *)v4 dateCreated];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_1000171AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSErrorUserInfoKey v4 = [*(id *)(*(void *)(a1 + 32) + 24) viewContext];
  id v5 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Deleting record: %@", buf, 0xCu);
  }
  [v4 deleteObject:v3];
  id v12 = 0;
  unsigned __int8 v6 = [v4 save:&v12];
  id v7 = v12;
  if ((v6 & 1) == 0)
  {
    id v8 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Deleting record failed: %@", buf, 0xCu);
    }
  }
  if (v7)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100017380;
    v10[3] = &unk_10002D0C0;
    id v9 = *(void **)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    [v9 requestExportWithCompletion:v10];
  }
}

void sub_100017380(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSErrorUserInfoKey v4 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    unsigned __int8 v6 = [v3 error];
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Export finished with: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [v3 error];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

void sub_10001756C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100017630;
  v8[3] = &unk_10002D368;
  NSErrorUserInfoKey v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v11 = v5;
  id v7 = v3;
  [v4 saveBackup:1 withDate:0 payload:0 withCompletion:v8];
}

void sub_100017630(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 || !v6)
  {
    id v11 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v15 = v5;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Failed to save backup %@", buf, 0xCu);
    }
    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    id v8 = [a1[4] mutableCopy];
    [v8 addObject:v7];
    [a1[5] _prune:v8];
    id v9 = nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v15 = @"Daily";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Backup of type %@ successfully created", buf, 0xCu);
    }
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100017800;
    v12[3] = &unk_10002D0C0;
    id v10 = a1[5];
    id v13 = a1[6];
    [v10 requestExportWithCompletion:v12];
  }
}

void sub_100017800(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSErrorUserInfoKey v4 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [v3 error];
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Export finished with: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [v3 error];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

void sub_1000179DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000179F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (__CFString *)objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "saving backup with metadata: %@", buf, 0xCu);
  }
  int v9 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v17 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "strong self is %@", buf, 0xCu);
  }
  id v10 = [(__CFString *)WeakRetained _NBBackupFromNBBackupiCloudModel:v6];
  id v11 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "saving backup metadata: %@", buf, 0xCu);
  }
  id v12 = nb_daemon_log;
  BOOL v13 = os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT);
  if (v5 || !v6)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v17 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Failed to save backup %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v17 = @"Manual";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Backup of type %@ successfully created", buf, 0xCu);
    }
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100017C94;
    v14[3] = &unk_10002D0C0;
    id v15 = *(id *)(a1 + 32);
    [(__CFString *)WeakRetained requestExportWithCompletion:v14];
  }
}

void sub_100017C94(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSErrorUserInfoKey v4 = (void *)nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    id v6 = [v3 error];
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Export finished with: %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [v3 error];
  (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
}

void sub_100017E2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSErrorUserInfoKey v4 = [v3 error];

  if (v4)
  {
    id v5 = (void *)nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      uint64_t v7 = [v3 error];
      *(_DWORD *)buf = 138412290;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Import failed, using local data: %@", buf, 0xCu);
    }
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 24) viewContext];
  int v9 = +[NBBackupiCloudModel fetchRequest];
  v23[0] = @"dateCreated";
  v23[1] = @"backupType";
  id v10 = +[NSArray arrayWithObjects:v23 count:2];
  [v9 setPropertiesToFetch:v10];

  id v18 = 0;
  id v11 = [v8 executeFetchRequest:v9 error:&v18];
  id v12 = v18;
  if (v11)
  {
    BOOL v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v14 = (void *)nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = v14;
      long long v16 = [v12 localizedDescription];
      CFStringRef v17 = [v12 userInfo];
      *(_DWORD *)buf = 138412546;
      id v20 = v16;
      __int16 v21 = 2112;
      id v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Error fetching NBBackupiCloudModel objects: %@\n%@", buf, 0x16u);
    }
    BOOL v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v13();
}

void sub_100018190(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSErrorUserInfoKey v4 = [v3 error];

  if (v4)
  {
    id v5 = (void *)nb_daemon_log;
    if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      uint64_t v7 = [v3 error];
      *(_DWORD *)buf = 138412290;
      id v27 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Import failed, using local data: %@", buf, 0xCu);
    }
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 24) viewContext];
  int v9 = +[NSFetchRequest fetchRequestWithEntityName:@"NBBackupiCloudModel"];
  id v10 = [*(id *)(a1 + 40) UUIDString];
  id v11 = +[NSPredicate predicateWithFormat:@"%K = %@", @"backupID", v10];

  id v12 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Predicate is: %@", buf, 0xCu);
  }
  [v9 setPredicate:v11];
  id v25 = 0;
  BOOL v13 = [v8 executeFetchRequest:v9 error:&v25];
  id v14 = v25;
  id v15 = [v13 firstObject];

  long long v16 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Backup is: %@", buf, 0xCu);
  }
  CFStringRef v17 = nb_daemon_log;
  BOOL v18 = os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v18)
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v3;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "results from ID lookup: %@", buf, 0xCu);
    }
    id v19 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (v18)
    {
      id v20 = *(void **)(a1 + 40);
      log = v17;
      id v23 = [v20 UUIDString];
      __int16 v21 = [v14 localizedDescription];
      id v22 = [v14 userInfo];
      *(_DWORD *)buf = 138412802;
      id v27 = v23;
      __int16 v28 = 2112;
      id v29 = v21;
      __int16 v30 = 2112;
      id v31 = v22;
      _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Error fetching backup for ID:%@ %@\n%@", buf, 0x20u);
    }
    id v19 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v19();
}

void sub_1000185A4(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) newBackgroundContext];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018650;
  v5[3] = &unk_10002CF28;
  id v3 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  [v4 performBlock:v5];
}

void sub_100018650(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSCloudKitMirroringExportRequest) initWithOptions:0 completionBlock:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  id v6 = 0;
  id v4 = [v3 executeRequest:v2 error:&v6];
  id v5 = v6;

  if (!v4) {
    NSLog(@"export request failed to execute: %@", v5);
  }
}

void sub_1000186F0(id a1, NSCloudKitMirroringResult *a2)
{
  id v2 = a2;
  unsigned int v3 = [(NSCloudKitMirroringResult *)v2 success];
  unsigned int v4 = [(NSCloudKitMirroringResult *)v2 madeChanges];

  NSLog(@"Got import result back: %d madeChanges: %d", v3, v4);
}

void sub_1000187EC(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) newBackgroundContext];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100018898;
  v5[3] = &unk_10002CF28;
  id v3 = *(id *)(a1 + 40);
  id v6 = v2;
  id v7 = v3;
  id v4 = v2;
  [v4 performBlockAndWait:v5];
}

void sub_100018898(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSCloudKitMirroringImportRequest) initWithOptions:0 completionBlock:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  id v6 = 0;
  id v4 = [v3 executeRequest:v2 error:&v6];
  id v5 = v6;

  if (!v4) {
    NSLog(@"Import request failed to execute: %@", v5);
  }
}

void sub_100018A20(id a1, NSPersistentStoreDescription *a2, NSError *a3)
{
  id v6 = a2;
  id v4 = a3;
  if (v4)
  {
    id v5 = v4;
    if (+[NBiCloudBackupManager isDataProtectionError:v4])
    {
      sub_10001DE14();
    }
    NSLog(@"Failed to load Core Data stack: %@", v5);
    abort();
  }
  NSLog(@"Store loaded");
}

void sub_100018FD8(uint64_t a1)
{
  id v2 = objc_opt_new();
  unint64_t v3 = *(unsigned int *)(a1 + 48);
  if ((int)v3 >= 1)
  {
    unsigned int v4 = v3 - 4;
    while (v3 > 3)
    {
      if (v3 == 5)
      {
        NSLog(@"Check: first month: I is: %d", 5);
        id v5 = *(void **)(a1 + 32);
        uint64_t v6 = 0;
        uint64_t v7 = 1;
        uint64_t v8 = 0;
        uint64_t v9 = -2;
      }
      else
      {
        if (v3 == 4)
        {
          NSLog(@"Check: week: I is: %d", 4);
          id v5 = *(void **)(a1 + 32);
          uint64_t v6 = 0;
          uint64_t v7 = 0;
          uint64_t v8 = 7;
        }
        else
        {
          if (v3 <= 0x10)
          {
            NSLog(@"Check: month: I is: %d", v3);
            id v5 = *(void **)(a1 + 32);
            uint64_t v7 = v4;
            uint64_t v6 = 0;
            goto LABEL_15;
          }
          if (v3 != 17)
          {
            NSLog(@"Check: other years: I is: %d", v3);
            id v5 = *(void **)(a1 + 32);
            uint64_t v6 = v4 - 12;
            uint64_t v7 = 0;
LABEL_15:
            uint64_t v8 = 0;
LABEL_16:
            uint64_t v9 = 0;
            goto LABEL_17;
          }
          NSLog(@"Check: year 1: I is: %d", 17);
          id v5 = *(void **)(a1 + 32);
          uint64_t v6 = 1;
          uint64_t v7 = 0;
          uint64_t v8 = 0;
        }
        uint64_t v9 = -1;
      }
LABEL_17:
      id v10 = [v5 dateFromPast:v6 months:v7 days:v8 hours:v9 seconds:0];
      id v11 = nb_daemon_log;
      if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Check: %@", buf, 0xCu);
      }
      dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000192E4;
      block[3] = &unk_10002CE40;
      id v19 = v2;
      id v20 = v10;
      BOOL v13 = v12;
      __int16 v21 = v13;
      id v14 = v10;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      dispatch_time_t v15 = dispatch_time(0, 60000000000);
      if (dispatch_semaphore_wait(v13, v15)) {
        NSLog(@"Timeout waiting for backup to complete");
      }

      --v4;
      if ((uint64_t)v3-- <= 1) {
        goto LABEL_23;
      }
    }
    NSLog(@"Check: Day: I is: %d", v3);
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = v3;
    goto LABEL_16;
  }
LABEL_23:
  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(void))(v17 + 16))();
  }
}

void sub_1000192E4(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100019378;
  v3[3] = &unk_10002C8C0;
  id v4 = *(id *)(a1 + 48);
  [v1 createBackupsAndPruneAtDate:v2 withPayload:0 completion:v3];
}

intptr_t sub_100019378(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100019604(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t v12 = PBReaderReadData();
      BOOL v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t start()
{
  NSLog(@"Starting server");
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = (void *)qword_100034FF8;
  qword_100034FF8 = v1;

  unint64_t v3 = +[NSRunLoop currentRunLoop];
  [v3 run];

  return 1;
}

uint64_t sub_10001A65C(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v8 = v7 + 1;
      if (v7 == -1 || v8 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v8;
      v6 |= (unint64_t)(v9 & 0x7F) << v4;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      BOOL v10 = v5++ >= 9;
      if (v10)
      {
        unint64_t v6 = 0;
        int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v11 || (v6 & 7) == 4) {
      break;
    }
    switch((v6 >> 3))
    {
      case 1u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 144;
        goto LABEL_114;
      case 2u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 96;
        goto LABEL_114;
      case 3u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 112;
        goto LABEL_114;
      case 4u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 104;
        goto LABEL_114;
      case 5u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 128;
        goto LABEL_114;
      case 6u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 120;
        goto LABEL_114;
      case 7u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 88;
        goto LABEL_114;
      case 8u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 64;
        goto LABEL_114;
      case 9u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 72;
        goto LABEL_114;
      case 0xAu:
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0;
        *(_WORD *)(a1 + 180) |= 0x20u;
        while (2)
        {
          uint64_t v19 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v20 = v19 + 1;
          if (v19 == -1 || v20 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v21 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v19);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v20;
            v18 |= (unint64_t)(v21 & 0x7F) << v16;
            if (v21 < 0)
            {
              v16 += 7;
              BOOL v10 = v17++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_118;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_118:
        uint64_t v78 = 44;
        goto LABEL_160;
      case 0xBu:
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v18 = 0;
        *(_WORD *)(a1 + 180) |= 0x200u;
        while (2)
        {
          uint64_t v24 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v25 = v24 + 1;
          if (v24 == -1 || v25 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v26 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v24);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v25;
            v18 |= (unint64_t)(v26 & 0x7F) << v22;
            if (v26 < 0)
            {
              v22 += 7;
              BOOL v10 = v23++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_122;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_122:
        uint64_t v78 = 136;
        goto LABEL_160;
      case 0xCu:
        char v27 = 0;
        unsigned int v28 = 0;
        uint64_t v18 = 0;
        *(_WORD *)(a1 + 180) |= 0x80u;
        while (2)
        {
          uint64_t v29 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v30 = v29 + 1;
          if (v29 == -1 || v30 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v31 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v29);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v30;
            v18 |= (unint64_t)(v31 & 0x7F) << v27;
            if (v31 < 0)
            {
              v27 += 7;
              BOOL v10 = v28++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_126;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_126:
        uint64_t v78 = 80;
        goto LABEL_160;
      case 0xDu:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v18 = 0;
        *(_WORD *)(a1 + 180) |= 0x10u;
        while (2)
        {
          uint64_t v34 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v35 = v34 + 1;
          if (v34 == -1 || v35 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v36 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v34);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v35;
            v18 |= (unint64_t)(v36 & 0x7F) << v32;
            if (v36 < 0)
            {
              v32 += 7;
              BOOL v10 = v33++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_130;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_130:
        uint64_t v78 = 40;
        goto LABEL_160;
      case 0xEu:
        char v37 = 0;
        unsigned int v38 = 0;
        uint64_t v18 = 0;
        *(_WORD *)(a1 + 180) |= 0x40u;
        while (2)
        {
          uint64_t v39 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v40 = v39 + 1;
          if (v39 == -1 || v40 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v39);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v40;
            v18 |= (unint64_t)(v41 & 0x7F) << v37;
            if (v41 < 0)
            {
              v37 += 7;
              BOOL v10 = v38++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_134;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_134:
        uint64_t v78 = 48;
        goto LABEL_160;
      case 0xFu:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v18 = 0;
        *(_WORD *)(a1 + 180) |= 0x100u;
        while (2)
        {
          uint64_t v44 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v45 = v44 + 1;
          if (v44 == -1 || v45 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v46 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v44);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v45;
            v18 |= (unint64_t)(v46 & 0x7F) << v42;
            if (v46 < 0)
            {
              v42 += 7;
              BOOL v10 = v43++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_138;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_138:
        uint64_t v78 = 84;
        goto LABEL_160;
      case 0x10u:
        char v47 = 0;
        unsigned int v48 = 0;
        uint64_t v18 = 0;
        *(_WORD *)(a1 + 180) |= 4u;
        while (2)
        {
          uint64_t v49 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v50 = v49 + 1;
          if (v49 == -1 || v50 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v51 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v49);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v50;
            v18 |= (unint64_t)(v51 & 0x7F) << v47;
            if (v51 < 0)
            {
              v47 += 7;
              BOOL v10 = v48++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_142;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_142:
        uint64_t v78 = 32;
        goto LABEL_160;
      case 0x11u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 152;
        goto LABEL_114;
      case 0x12u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 160;
        goto LABEL_114;
      case 0x13u:
        char v52 = 0;
        unsigned int v53 = 0;
        uint64_t v54 = 0;
        *(_WORD *)(a1 + 180) |= 0x800u;
        while (2)
        {
          uint64_t v55 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v56 = v55 + 1;
          if (v55 == -1 || v56 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v57 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v55);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v56;
            v54 |= (unint64_t)(v57 & 0x7F) << v52;
            if (v57 < 0)
            {
              v52 += 7;
              BOOL v10 = v53++ >= 9;
              if (v10)
              {
                uint64_t v54 = 0;
                goto LABEL_146;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v54 = 0;
        }
LABEL_146:
        BOOL v79 = v54 != 0;
        uint64_t v80 = 177;
        goto LABEL_151;
      case 0x14u:
        char v58 = 0;
        unsigned int v59 = 0;
        uint64_t v60 = 0;
        *(_WORD *)(a1 + 180) |= 0x400u;
        while (2)
        {
          uint64_t v61 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v62 = v61 + 1;
          if (v61 == -1 || v62 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v63 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v61);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v62;
            v60 |= (unint64_t)(v63 & 0x7F) << v58;
            if (v63 < 0)
            {
              v58 += 7;
              BOOL v10 = v59++ >= 9;
              if (v10)
              {
                uint64_t v60 = 0;
                goto LABEL_150;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v60 = 0;
        }
LABEL_150:
        BOOL v79 = v60 != 0;
        uint64_t v80 = 176;
LABEL_151:
        *(unsigned char *)(a1 + v80) = v79;
        continue;
      case 0x15u:
        *(_WORD *)(a1 + 180) |= 1u;
        unint64_t v64 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v64 <= 0xFFFFFFFFFFFFFFF7 && v64 + 8 <= *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
        {
          uint64_t v65 = *(void *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v64);
          *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v64 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          uint64_t v65 = 0;
        }
        *(void *)(a1 + 8) = v65;
        continue;
      case 0x16u:
        char v66 = 0;
        unsigned int v67 = 0;
        uint64_t v68 = 0;
        *(_WORD *)(a1 + 180) |= 2u;
        while (2)
        {
          uint64_t v69 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
          unint64_t v70 = v69 + 1;
          if (v69 == -1 || v70 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
          {
            *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v71 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v69);
            *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v70;
            v68 |= (unint64_t)(v71 & 0x7F) << v66;
            if (v71 < 0)
            {
              v66 += 7;
              BOOL v10 = v67++ >= 9;
              if (v10)
              {
                uint64_t v68 = 0;
                goto LABEL_155;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v68 = 0;
        }
LABEL_155:
        *(void *)(a1 + 16) = v68;
        continue;
      case 0x17u:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 24;
        goto LABEL_114;
      case 0x18u:
        char v72 = 0;
        unsigned int v73 = 0;
        uint64_t v18 = 0;
        *(_WORD *)(a1 + 180) |= 8u;
        break;
      case 0x19u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 56;
        goto LABEL_114;
      case 0x1Au:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 168;
LABEL_114:
        v77 = *(void **)(a1 + v14);
        *(void *)(a1 + v14) = v13;

        continue;
      default:
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
        continue;
    }
    while (1)
    {
      uint64_t v74 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      unint64_t v75 = v74 + 1;
      if (v74 == -1 || v75 > *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v76 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v74);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v75;
      v18 |= (unint64_t)(v76 & 0x7F) << v72;
      if ((v76 & 0x80) == 0) {
        goto LABEL_157;
      }
      v72 += 7;
      BOOL v10 = v73++ >= 9;
      if (v10)
      {
        LODWORD(v18) = 0;
        goto LABEL_159;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_157:
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v18) = 0;
    }
LABEL_159:
    uint64_t v78 = 36;
LABEL_160:
    *(_DWORD *)(a1 + v78) = v18;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

uint64_t sub_10001CD98(uint64_t a1, uint64_t a2)
{
  while (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v4 = 0;
    unsigned int v5 = 0;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
      if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
      *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        goto LABEL_11;
      }
      v4 += 7;
      if (v5++ >= 9)
      {
        unint64_t v6 = 0;
        int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
    if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v6 = 0;
    }
LABEL_13:
    if (v10 || (v6 & 7) == 4) {
      break;
    }
    if ((v6 >> 3) == 1)
    {
      uint64_t v12 = PBReaderReadData();
      uint64_t v13 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v12;
    }
    else
    {
      uint64_t result = PBReaderSkipValueWithTag();
      if (!result) {
        return result;
      }
    }
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

BOOL sub_10001D60C(void *a1, uint64_t a2)
{
  if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) < *(void *)(a2 + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      char v4 = 0;
      unsigned int v5 = 0;
      unint64_t v6 = 0;
      while (1)
      {
        unint64_t v7 = *(void *)(a2 + OBJC_IVAR___PBDataReader__pos);
        if (v7 == -1 || v7 >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v8 = *(unsigned char *)(*(void *)(a2 + OBJC_IVAR___PBDataReader__bytes) + v7);
        *(void *)(a2 + OBJC_IVAR___PBDataReader__pos) = v7 + 1;
        v6 |= (unint64_t)(v8 & 0x7F) << v4;
        if ((v8 & 0x80) == 0) {
          goto LABEL_11;
        }
        v4 += 7;
        if (v5++ >= 9)
        {
          unint64_t v6 = 0;
          int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v10 = *(unsigned __int8 *)(a2 + OBJC_IVAR___PBDataReader__error);
      if (*(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error)) {
        unint64_t v6 = 0;
      }
LABEL_13:
      if (v10 || (v6 & 7) == 4) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v6 >> 3) == 2) {
        break;
      }
      if ((v6 >> 3) == 1)
      {
        uint64_t v12 = objc_alloc_init(NBPBBackupMetadata);
        [a1 addBackups:v12];
        if (!PBReaderPlaceMark() || (sub_10001A65C((uint64_t)v12, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_25:
      if (*(void *)(a2 + OBJC_IVAR___PBDataReader__pos) >= *(void *)(a2 + OBJC_IVAR___PBDataReader__length)) {
        return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
      }
    }
    uint64_t v13 = PBReaderReadData();
    uint64_t v12 = (NBPBBackupMetadata *)a1[2];
    a1[2] = v13;
LABEL_23:

    goto LABEL_25;
  }
  return *(unsigned char *)(a2 + OBJC_IVAR___PBDataReader__error) == 0;
}

void sub_10001DE14()
{
  v0 = nb_daemon_log;
  if (os_log_type_enabled(nb_daemon_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Failed to load container due to file protection error.  initCoreData shouldn't be called before first unlock", v1, 2u);
  }
  abort();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppIntegerValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t NBBackupDirectoryPath()
{
  return _NBBackupDirectoryPath();
}

uint64_t NBError()
{
  return _NBError();
}

uint64_t NBLoggingDaemonObjectInit()
{
  return _NBLoggingDaemonObjectInit();
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return _NRVersionIsGreaterThanOrEqual();
}

uint64_t NRWatchOSVersion()
{
  return _NRWatchOSVersion();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return _NRWatchOSVersionForRemoteDevice();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PBDataWriterWriteBOOLField()
{
  return _PBDataWriterWriteBOOLField();
}

uint64_t PBDataWriterWriteDataField()
{
  return _PBDataWriterWriteDataField();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return _PBDataWriterWriteDoubleField();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return _PBDataWriterWriteInt32Field();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return _PBDataWriterWriteInt64Field();
}

uint64_t PBDataWriterWriteStringField()
{
  return _PBDataWriterWriteStringField();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return _PBDataWriterWriteSubmessage();
}

uint64_t PBReaderPlaceMark()
{
  return _PBReaderPlaceMark();
}

uint64_t PBReaderReadData()
{
  return _PBReaderReadData();
}

uint64_t PBReaderReadString()
{
  return _PBReaderReadString();
}

uint64_t PBReaderRecallMark()
{
  return _PBReaderRecallMark();
}

uint64_t PBReaderSkipValueWithTag()
{
  return _PBReaderSkipValueWithTag();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
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

void dispatch_source_cancel(dispatch_source_t source)
{
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

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

id objc_msgSend__configureStoreDescriptions(void *a1, const char *a2, ...)
{
  return [a1 _configureStoreDescriptions];
}

id objc_msgSend__defaultDisplayNameOrder(void *a1, const char *a2, ...)
{
  return [a1 _defaultDisplayNameOrder];
}

id objc_msgSend__defaultShortNameFormat(void *a1, const char *a2, ...)
{
  return [a1 _defaultShortNameFormat];
}

id objc_msgSend__initCoreData(void *a1, const char *a2, ...)
{
  return [a1 _initCoreData];
}

id objc_msgSend__metadataIndexReadFromDiskIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _metadataIndexReadFromDiskIfNeeded];
}

id objc_msgSend__shortNameIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 _shortNameIsEnabled];
}

id objc_msgSend__shouldPreferNicknames(void *a1, const char *a2, ...)
{
  return [a1 _shouldPreferNicknames];
}

id objc_msgSend_activeDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return [a1 activeDeviceSelectorBlock];
}

id objc_msgSend_activeWatchFaceFileContents(void *a1, const char *a2, ...)
{
  return [a1 activeWatchFaceFileContents];
}

id objc_msgSend_activeWatchFaceFileURL(void *a1, const char *a2, ...)
{
  return [a1 activeWatchFaceFileURL];
}

id objc_msgSend_activelyPairingDevice(void *a1, const char *a2, ...)
{
  return [a1 activelyPairingDevice];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backingColor(void *a1, const char *a2, ...)
{
  return [a1 backingColor];
}

id objc_msgSend_backup(void *a1, const char *a2, ...)
{
  return [a1 backup];
}

id objc_msgSend_backupID(void *a1, const char *a2, ...)
{
  return [a1 backupID];
}

id objc_msgSend_backupIndexManager(void *a1, const char *a2, ...)
{
  return [a1 backupIndexManager];
}

id objc_msgSend_backupMetaData(void *a1, const char *a2, ...)
{
  return [a1 backupMetaData];
}

id objc_msgSend_backupType(void *a1, const char *a2, ...)
{
  return [a1 backupType];
}

id objc_msgSend_backups(void *a1, const char *a2, ...)
{
  return [a1 backups];
}

id objc_msgSend_backupsCount(void *a1, const char *a2, ...)
{
  return [a1 backupsCount];
}

id objc_msgSend_bcmWindowMaterial(void *a1, const char *a2, ...)
{
  return [a1 bcmWindowMaterial];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomEnclosureMaterial(void *a1, const char *a2, ...)
{
  return [a1 bottomEnclosureMaterial];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_clearBackups(void *a1, const char *a2, ...)
{
  return [a1 clearBackups];
}

id objc_msgSend_clientQueue(void *a1, const char *a2, ...)
{
  return [a1 clientQueue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyKeyList(void *a1, const char *a2, ...)
{
  return [a1 copyKeyList];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_coverGlassColor(void *a1, const char *a2, ...)
{
  return [a1 coverGlassColor];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateCreated(void *a1, const char *a2, ...)
{
  return [a1 dateCreated];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delayedRestoreMessages(void *a1, const char *a2, ...)
{
  return [a1 delayedRestoreMessages];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceCSN(void *a1, const char *a2, ...)
{
  return [a1 deviceCSN];
}

id objc_msgSend_deviceColor(void *a1, const char *a2, ...)
{
  return [a1 deviceColor];
}

id objc_msgSend_deviceEnclosureColor(void *a1, const char *a2, ...)
{
  return [a1 deviceEnclosureColor];
}

id objc_msgSend_diagnosticsOptInEnabled(void *a1, const char *a2, ...)
{
  return [a1 diagnosticsOptInEnabled];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_excludedPerGizmoDomains(void *a1, const char *a2, ...)
{
  return [a1 excludedPerGizmoDomains];
}

id objc_msgSend_exclusionListManager(void *a1, const char *a2, ...)
{
  return [a1 exclusionListManager];
}

id objc_msgSend_fcmMaterial(void *a1, const char *a2, ...)
{
  return [a1 fcmMaterial];
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return [a1 fetchRequest];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fromID(void *a1, const char *a2, ...)
{
  return [a1 fromID];
}

id objc_msgSend_getAllDevicesWithArchivedDevices(void *a1, const char *a2, ...)
{
  return [a1 getAllDevicesWithArchivedDevices];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_housingColor(void *a1, const char *a2, ...)
{
  return [a1 housingColor];
}

id objc_msgSend_incomingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 incomingResponseIdentifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internalQueue(void *a1, const char *a2, ...)
{
  return [a1 internalQueue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return [a1 isDefaultPairedDevice];
}

id objc_msgSend_isDiagnosticsOptInEnabled(void *a1, const char *a2, ...)
{
  return [a1 isDiagnosticsOptInEnabled];
}

id objc_msgSend_isLocationOptInEnabled(void *a1, const char *a2, ...)
{
  return [a1 isLocationOptInEnabled];
}

id objc_msgSend_isResponse(void *a1, const char *a2, ...)
{
  return [a1 isResponse];
}

id objc_msgSend_lastModificationDate(void *a1, const char *a2, ...)
{
  return [a1 lastModificationDate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_legacyContactPreferenceKeys(void *a1, const char *a2, ...)
{
  return [a1 legacyContactPreferenceKeys];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_locationOptInEnabled(void *a1, const char *a2, ...)
{
  return [a1 locationOptInEnabled];
}

id objc_msgSend_locationServicesEnabled(void *a1, const char *a2, ...)
{
  return [a1 locationServicesEnabled];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_madeChanges(void *a1, const char *a2, ...)
{
  return [a1 madeChanges];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_marketingVersion(void *a1, const char *a2, ...)
{
  return [a1 marketingVersion];
}

id objc_msgSend_metadataIndex(void *a1, const char *a2, ...)
{
  return [a1 metadataIndex];
}

id objc_msgSend_metadataIndexReadFromDiskIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 metadataIndexReadFromDiskIfNeeded];
}

id objc_msgSend_method(void *a1, const char *a2, ...)
{
  return [a1 method];
}

id objc_msgSend_migrateBreathePreferences(void *a1, const char *a2, ...)
{
  return [a1 migrateBreathePreferences];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return [a1 newBackgroundContext];
}

id objc_msgSend_newBackupUUID(void *a1, const char *a2, ...)
{
  return [a1 newBackupUUID];
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 outgoingResponseIdentifier];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathToBackupIndex(void *a1, const char *a2, ...)
{
  return [a1 pathToBackupIndex];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_persistMetadataIndex(void *a1, const char *a2, ...)
{
  return [a1 persistMetadataIndex];
}

id objc_msgSend_persistentContainer(void *a1, const char *a2, ...)
{
  return [a1 persistentContainer];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return [a1 productName];
}

id objc_msgSend_productType(void *a1, const char *a2, ...)
{
  return [a1 productType];
}

id objc_msgSend_pruneLocalBackups(void *a1, const char *a2, ...)
{
  return [a1 pruneLocalBackups];
}

id objc_msgSend_purgeCache(void *a1, const char *a2, ...)
{
  return [a1 purgeCache];
}

id objc_msgSend_registerProtobufHandlers(void *a1, const char *a2, ...)
{
  return [a1 registerProtobufHandlers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeICloudBackupsFromIndex(void *a1, const char *a2, ...)
{
  return [a1 removeICloudBackupsFromIndex];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return [a1 selector];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shortValue(void *a1, const char *a2, ...)
{
  return [a1 shortValue];
}

id objc_msgSend_shouldLoadiCloudBackups(void *a1, const char *a2, ...)
{
  return [a1 shouldLoadiCloudBackups];
}

id objc_msgSend_sizeInBytes(void *a1, const char *a2, ...)
{
  return [a1 sizeInBytes];
}

id objc_msgSend_snapshotImage(void *a1, const char *a2, ...)
{
  return [a1 snapshotImage];
}

id objc_msgSend_startSchedulerIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 startSchedulerIfNecessary];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return [a1 success];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 systemBuildVersion];
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return [a1 systemVersion];
}

id objc_msgSend_tempDirString(void *a1, const char *a2, ...)
{
  return [a1 tempDirString];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_topEnclosureMaterial(void *a1, const char *a2, ...)
{
  return [a1 topEnclosureMaterial];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_viewContext(void *a1, const char *a2, ...)
{
  return [a1 viewContext];
}

id objc_msgSend_watchFace(void *a1, const char *a2, ...)
{
  return [a1 watchFace];
}

id objc_msgSend_watchFaceColor(void *a1, const char *a2, ...)
{
  return [a1 watchFaceColor];
}

id objc_msgSend_watchFaceData(void *a1, const char *a2, ...)
{
  return [a1 watchFaceData];
}

id objc_msgSend_writeWatchFaceToFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeWatchFaceToFile:");
}