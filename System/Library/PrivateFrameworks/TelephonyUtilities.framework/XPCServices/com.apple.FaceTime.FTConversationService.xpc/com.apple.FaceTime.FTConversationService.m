uint64_t FTCServiceLog()
{
  if (qword_10001E4E8 != -1) {
    dispatch_once(&qword_10001E4E8, &stru_100018438);
  }
  return qword_10001E4E0;
}

void sub_1000056F8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6 && isFatalPersistentStoreError(v6)
    || ([*(id *)(a1 + 32) userConfiguration],
        v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 simulateFatalPersistentStoreError],
        v8,
        v9))
  {
    v10 = FTCServiceLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100010824((uint64_t)v7, v10);
    }

    v11 = [*(id *)(a1 + 32) persistentStoreCoordinator];
    id v15 = 0;
    unsigned int v12 = [v11 destroyPersistentStoreWithDescription:v5 error:&v15];
    id v13 = v15;
    uint64_t v14 = *(void *)(a1 + 40);
    if (v12) {
      [v11 addPersistentStoreWithDescription:v5 completionHandler:v14];
    }
    else {
      (*(void (**)(void, id, id))(v14 + 16))(*(void *)(a1 + 40), v5, v13);
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100005890(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

int main(int argc, const char **argv, const char **envp)
{
  FTSandboxEnter();
  id v6 = 0;
  if (argc >= 1 && argv)
  {
    if (*argv)
    {
      v7 = +[NSString stringWithCString:*argv encoding:4];
      id v6 = [v7 lastPathComponent];
    }
    else
    {
      id v6 = 0;
    }
  }
  v8 = FTCServiceLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Launching %@", buf, 0xCu);
  }

  uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_DEFAULT, 0);

  dispatch_queue_t v11 = dispatch_queue_create("com.apple.FaceTime.FTConversationService.queue", v10);
  unsigned int v12 = FTCServiceLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Checking whether device is boot locked", buf, 2u);
  }

  id v13 = [[FTDeviceObserver alloc] initWithQueue:v11];
  unsigned int v14 = [(FTDeviceObserver *)v13 isBootLockEnabled];
  id v15 = FTCServiceLog();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v16)
    {
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Exiting %@; device has not been unlocked since boot.",
        buf,
        0xCu);
    }

LABEL_23:
    exit(1);
  }
  if (v16)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Creating directory hierarchy", buf, 2u);
  }

  v17 = FTGetUserDataStoreDirectoryURL();
  v18 = +[NSFileManager defaultManager];
  id v26 = 0;
  unsigned __int8 v19 = [v18 createDirectoryAtURL:v17 withIntermediateDirectories:1 attributes:0 error:&v26];
  id v20 = v26;

  if ((v19 & 1) == 0)
  {
    v25 = FTCServiceLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v28 = v6;
      __int16 v29 = 2112;
      v30 = v17;
      __int16 v31 = 2112;
      id v32 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Exiting %@; creation of data store directory at %@ failed with error %@",
        buf,
        0x20u);
    }

    goto LABEL_23;
  }
  v21 = [[FTConversationService alloc] initWithQueue:v11];
  v22 = +[NSXPCListener serviceListener];
  [v22 setDelegate:v21];

  v23 = FTCServiceLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v22;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Resuming listener %@", buf, 0xCu);
  }

  [v22 resume];
  return 0;
}

void sub_10000622C(id a1)
{
  qword_10001E4E0 = (uint64_t)os_log_create("com.apple.FaceTime", "FTConversationService");
}

void sub_1000063AC(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100006480(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100007250(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100007608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000762C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000763C(uint64_t a1)
{
}

void sub_100007644(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  unsigned __int8 v6 = [v2 addConversationLinkDescriptors:v3 managedObjectContext:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

void sub_1000077D4(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v8 = 0;
  id v5 = [v2 addConversationLinkDescriptors:v3 managedObjectContext:v4 error:&v8];
  id v6 = v8;
  uint64_t v7 = a1[7];
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

void sub_100007A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100007A94(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  unsigned __int8 v6 = [v2 addOrUpdateConversationLinkDescriptors:v3 managedObjectContext:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v6;
}

void sub_100007C24(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v8 = 0;
  id v5 = [v2 addOrUpdateConversationLinkDescriptors:v3 managedObjectContext:v4 error:&v8];
  id v6 = v8;
  uint64_t v7 = a1[7];
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

void sub_100007E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100007E4C(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = [v2 conversationLinkDescriptorCountWithPredicate:v3 managedObjectContext:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(void *)(*(void *)(a1[7] + 8) + 24) = v6;
}

void sub_100007FB8(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v8 = 0;
  id v5 = [v2 conversationLinkDescriptorCountWithPredicate:v3 managedObjectContext:v4 error:&v8];
  id v6 = v8;
  uint64_t v7 = a1[7];
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

void sub_100008284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1000082B4(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = a1[10];
  uint64_t v7 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v2 conversationLinkDescriptorsWithPredicate:v3 managedObjectContext:v4 limit:v5 offset:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void sub_100008444(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[8];
  uint64_t v6 = a1[9];
  id v10 = 0;
  uint64_t v7 = [v2 conversationLinkDescriptorsWithPredicate:v3 managedObjectContext:v4 limit:v5 offset:v6 error:&v10];
  id v8 = v10;
  uint64_t v9 = a1[7];
  if (v9) {
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v7, v8);
  }
}

void sub_10000865C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100008680(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = [v2 removeConversationLinkDescriptorsWithPredicate:v3 deleteReason:v5 managedObjectContext:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(void *)(*(void *)(a1[7] + 8) + 24) = v7;
}

void sub_1000087F4(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[8];
  id v9 = 0;
  id v6 = [v2 removeConversationLinkDescriptorsWithPredicate:v3 deleteReason:v5 managedObjectContext:v4 error:&v9];
  id v7 = v9;
  uint64_t v8 = a1[7];
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
  }
}

void sub_1000089FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100008A20(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = [v2 removeLinkDescriptorsFromDataSourceWithPredicate:v3 managedObjectContext:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(void *)(*(void *)(a1[7] + 8) + 24) = v6;
}

void sub_100008B8C(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v8 = 0;
  id v5 = [v2 removeLinkDescriptorsFromDataSourceWithPredicate:v3 managedObjectContext:v4 error:&v8];
  id v6 = v8;
  uint64_t v7 = a1[7];
  if (v7) {
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  }
}

void sub_100008DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100008DCC(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [v3 setActivated:v2 withRevision:v6 forConversationLinkDescriptorsWithPredicate:v4 managedObjectContext:v5 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
}

void sub_100008F54(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = 0;
  id v7 = [v4 setActivated:v2 withRevision:v3 forConversationLinkDescriptorsWithPredicate:v5 managedObjectContext:v6 error:&v10];
  id v8 = v10;
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v7, v8);
  }
}

void sub_100009194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000091B8(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[10];
  uint64_t v7 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [v2 setExpirationDate:v3 withRevision:v6 forConversationLinkDescriptorsWithPredicate:v4 managedObjectContext:v5 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(void *)(*(void *)(a1[8] + 8) + 24) = v8;
}

void sub_100009358(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = a1[7];
  id v10 = 0;
  id v7 = [v2 setExpirationDate:v3 withRevision:v5 forConversationLinkDescriptorsWithPredicate:v4 managedObjectContext:v6 error:&v10];
  id v8 = v10;
  uint64_t v9 = a1[8];
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v7, v8);
  }
}

void sub_100009598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000095BC(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[10];
  uint64_t v7 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [v2 setInvitedHandles:v3 withRevision:v6 forConversationLinkDescriptorsWithPredicate:v4 managedObjectContext:v5 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(void *)(*(void *)(a1[8] + 8) + 24) = v8;
}

void sub_10000975C(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = a1[7];
  id v10 = 0;
  id v7 = [v2 setInvitedHandles:v3 withRevision:v5 forConversationLinkDescriptorsWithPredicate:v4 managedObjectContext:v6 error:&v10];
  id v8 = v10;
  uint64_t v9 = a1[8];
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v7, v8);
  }
}

void sub_10000999C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000099C0(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = a1[10];
  uint64_t v7 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [v2 setName:v3 withRevision:v6 forConversationLinkDescriptorsWithPredicate:v4 managedObjectContext:v5 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(void *)(*(void *)(a1[8] + 8) + 24) = v8;
}

void sub_100009B60(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = a1[7];
  id v10 = 0;
  id v7 = [v2 setName:v3 withRevision:v5 forConversationLinkDescriptorsWithPredicate:v4 managedObjectContext:v6 error:&v10];
  id v8 = v10;
  uint64_t v9 = a1[8];
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v7, v8);
  }
}

void sub_10000B2C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000B384;
    v9[3] = &unk_1000185F0;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    dispatch_async(v6, v9);
  }
}

id sub_10000B384(uint64_t a1)
{
  return _[*(id *)(a1 + 32) conversationLinkDescriptorDidChangeForPersistentDataSource:*(void *)(a1 + 40)];
}

BOOL isFatalPersistentStoreError(void *a1)
{
  id v1 = a1;
  BOOL v2 = (isFatalPersistentStoreMigrationError(v1) & 1) != 0 || isFatalSQLiteError(v1);

  return v2;
}

uint64_t isFatalPersistentStoreMigrationError(void *a1)
{
  id v1 = a1;
  if ([v1 code] == (id)134110)
  {
    BOOL v2 = [v1 domain];
    uint64_t v3 = (uint64_t)[v2 isEqualToString:NSCocoaErrorDomain];

    if (v3)
    {
      uint64_t v4 = [v1 userInfo];
      if (v4)
      {
        id v5 = [v1 userInfo];
        uint64_t v6 = [v5 objectForKeyedSubscript:NSUnderlyingErrorKey];

        if (v6) {
          uint64_t v3 = 1;
        }
        else {
          uint64_t v3 = isFatalSQLiteError(v1);
        }
      }
      else
      {
        uint64_t v3 = 0;
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

BOOL isFatalSQLiteError(void *a1)
{
  id v1 = a1;
  BOOL v2 = [v1 userInfo];
  uint64_t v3 = [v2 objectForKeyedSubscript:NSSQLiteErrorDomain];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v4 = (unint64_t)[v3 integerValue];
    id v5 = NSSQLiteErrorDomain;
    if (v5) {
      goto LABEL_7;
    }
  }
  else
  {
    id v5 = 0;
    unint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v4 = (unint64_t)[v1 code];
    id v5 = [v1 domain];
  }
LABEL_7:
  BOOL v6 = 0;
  if (v4 <= 0x1A && ((1 << v4) & 0x4000802) != 0) {
    BOOL v6 = [(NSString *)v5 isEqualToString:NSSQLiteErrorDomain];
  }

  return v6;
}

void sub_10000B690(id a1, NSPersistentStoreDescription *a2, NSError *a3)
{
  unint64_t v4 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v7 = +[NSString stringWithFormat:@"Loading persistent store with description %@ failed with error %@", v4, v5];
    uint64_t v8 = FTCServiceLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100010E88(v7, v8);
    }

    id v9 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:v7 userInfo:0];
    objc_exception_throw(v9);
  }
  BOOL v6 = FTCServiceLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100010E10((uint64_t)v4, v6);
  }
}

void sub_10000BA08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000BA2C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    BOOL v2 = [WeakRetained callback];
    v2[2]();

    id WeakRetained = v3;
  }
}

void sub_10000BCE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BD0C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000BD1C(uint64_t a1)
{
}

void sub_10000BD24(void *a1)
{
  BOOL v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[9];
  uint64_t v6 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v6 + 40);
  unsigned __int8 v7 = [v2 addOrUpdateKey:v3 forIntegerValue:v5 stringValue:0 managedObjectContext:v4 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v7;
}

void sub_10000BE9C(void *a1)
{
  BOOL v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[8];
  id v9 = 0;
  id v6 = [v2 addOrUpdateKey:v3 forIntegerValue:v5 stringValue:0 managedObjectContext:v4 error:&v9];
  id v7 = v9;
  uint64_t v8 = a1[7];
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
  }
}

void sub_10000C018(void *a1)
{
  BOOL v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v9 = 0;
  uint64_t v5 = [v2 keyValueForKey:v3 managedObjectContext:v4 error:&v9];
  id v6 = v9;
  uint64_t v7 = a1[7];
  if (v7)
  {
    if (v5) {
      uint64_t v8 = (uint64_t)[v5 integerValue];
    }
    else {
      uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v8, v6);
  }
}

void sub_10000C234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10000C258(void *a1)
{
  BOOL v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = [v2 keyValueForKey:v3 managedObjectContext:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6) {
    *(void *)(*(void *)(a1[8] + 8) + 24) = [v6 integerValue];
  }
}

void sub_10000C484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10000C4A8(void *a1)
{
  BOOL v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  uint64_t v6 = *(void *)(a1[9] + 8);
  id obj = *(id *)(v6 + 40);
  unsigned __int8 v7 = [v2 addOrUpdateKey:v3 forIntegerValue:0x7FFFFFFFFFFFFFFFLL stringValue:v4 managedObjectContext:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = v7;
}

void sub_10000C640(void *a1)
{
  BOOL v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  id v9 = 0;
  id v6 = [v2 addOrUpdateKey:v3 forIntegerValue:0x7FFFFFFFFFFFFFFFLL stringValue:v4 managedObjectContext:v5 error:&v9];
  id v7 = v9;
  uint64_t v8 = a1[8];
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v6, v7);
  }
}

void sub_10000C7BC(void *a1)
{
  BOOL v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  id v9 = 0;
  uint64_t v5 = [v2 keyValueForKey:v3 managedObjectContext:v4 error:&v9];
  id v6 = v9;
  uint64_t v7 = a1[7];
  if (v7)
  {
    if (v5)
    {
      uint64_t v8 = [v5 stringValue];
      (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v8, v6);
    }
    else
    {
      (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v6);
    }
  }
}

void sub_10000CA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000CA58(void *a1)
{
  BOOL v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = a1[6];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v5 + 40);
  id v6 = [v2 keyValueForKey:v3 managedObjectContext:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  if (v6)
  {
    uint64_t v7 = [v6 stringValue];
    uint64_t v8 = *(void *)(a1[8] + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

void sub_10000D05C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D08C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v2 = FTCServiceLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ connection interrupted", (uint8_t *)&v3, 0xCu);
    }

    [WeakRetained invalidate];
  }
}

void sub_10000D148(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v2 = FTCServiceLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ connection invalidated", (uint8_t *)&v3, 0xCu);
    }
  }
}

void sub_10000D398(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_10000D404(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_10000E454(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id FTGetUserDataStoreDirectoryURL()
{
  if (qword_10001E4F8 != -1) {
    dispatch_once(&qword_10001E4F8, &stru_100018778);
  }
  v0 = (void *)qword_10001E4F0;

  return v0;
}

void sub_10000E4C8(id a1)
{
  if (qword_10001E518 != -1) {
    dispatch_once(&qword_10001E518, &stru_1000187B8);
  }
  id v3 = (id)qword_10001E510;
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"FaceTime" isDirectory:1];
  BOOL v2 = (void *)qword_10001E4F0;
  qword_10001E4F0 = v1;
}

id FTGetUserDataStoreClassCFileURL()
{
  if (qword_10001E508 != -1) {
    dispatch_once(&qword_10001E508, &stru_100018798);
  }
  v0 = (void *)qword_10001E500;

  return v0;
}

void sub_10000E5A8(id a1)
{
  FTGetUserDataStoreDirectoryURL();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"FaceTime.sqlite3" isDirectory:0];
  BOOL v2 = (void *)qword_10001E500;
  qword_10001E500 = v1;
}

void sub_10000E608(id a1)
{
  if (qword_10001E528 != -1) {
    dispatch_once(&qword_10001E528, &stru_1000187D8);
  }
  id v3 = (id)qword_10001E520;
  uint64_t v1 = [v3 URLByAppendingPathComponent:@"Library" isDirectory:1];
  BOOL v2 = (void *)qword_10001E510;
  qword_10001E510 = v1;
}

void sub_10000E694(id a1)
{
  if (qword_10001E538[0] != -1) {
    dispatch_once(qword_10001E538, &stru_1000187F8);
  }
  qword_10001E520 = CFCopyHomeDirectoryURLForUser();
}

void sub_10000E6E4(id a1)
{
  qword_10001E530 = @"mobile";
  CFRetain(@"mobile");
}

void sub_10000FA60(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained dataSource];
    unsigned int v5 = [v4 isBootLockEnabled];

    if (v5)
    {
      v3[8] = 1;
      id v6 = [FTNotifyObserver alloc];
      uint64_t v7 = [v3 queue];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10000FB94;
      v9[3] = &unk_100018738;
      objc_copyWeak(&v10, v1);
      uint64_t v8 = [(FTNotifyObserver *)v6 initWithName:@"com.apple.mobile.keybagd.first_unlock" queue:v7 callback:v9];
      [v3 setFirstUnlockNotifyObserver:v8];

      objc_destroyWeak(&v10);
    }
  }
}

void sub_10000FB80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000FB94(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    BOOL v2 = [WeakRetained dataSource];
    objc_msgSend(v3, "setBootLockEnabled:", objc_msgSend(v2, "isBootLockEnabled"));

    id WeakRetained = v3;
  }
}

void sub_10000FCBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000FCD4(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

void sub_10000FDA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v5 conformsToProtocol:&OBJC_PROTOCOL___FTDeviceObserverDelegate])
  {
    id v7 = v5;
    if (objc_opt_respondsToSelector())
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10000FE84;
      v10[3] = &unk_1000185F0;
      id v8 = v7;
      uint64_t v9 = *(void *)(a1 + 32);
      id v11 = v8;
      uint64_t v12 = v9;
      dispatch_async(v6, v10);
    }
  }
}

id sub_10000FE84(uint64_t a1)
{
  return _[*(id *)(a1 + 32) didChangeBootLockEnabledForDeviceObserver:*(void *)(a1 + 40)];
}

void FTSandboxEnter()
{
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    id v6 = FTCServiceLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000110F4();
    }
LABEL_13:
    exit(1);
  }
  bzero(v9, 0x400uLL);
  size_t v0 = confstr(65537, v9, 0x400uLL);
  uint64_t v1 = FTCServiceLog();
  BOOL v2 = v1;
  if (!v0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100011078();
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    id v8 = v9;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Created temporary directory: %{public}s", (uint8_t *)&v7, 0xCu);
  }
  id v3 = realpath_DARWIN_EXTSN(v9, 0);
  if (!v3)
  {
    id v4 = FTCServiceLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100010FFC();
    }
LABEL_11:
    id v5 = FTCServiceLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100010FFC();
    }
    goto LABEL_13;
  }
  free(v3);
}

void sub_100010150(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

id FTManagedConversationLink.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  id v5 = [objc_allocWithZone(v2) initWithEntity:a1 insertIntoManagedObjectContext:a2];

  return v5;
}

id FTManagedConversationLink.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for FTManagedConversationLink();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for FTManagedConversationLink()
{
  return self;
}

id FTManagedConversationLink.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FTManagedConversationLink();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static FTManagedConversationLink.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = sub_100011170();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

void *sub_100010354()
{
  return &protocol witness table for ObjectIdentifier;
}

uint64_t sub_100010360@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for FTManagedConversationLink();
  uint64_t result = sub_100011180();
  *a1 = result;
  return result;
}

id FTManagedHandle.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for FTManagedHandle();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for FTManagedHandle()
{
  return self;
}

id FTManagedHandle.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FTManagedHandle();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static FTManagedHandle.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = sub_100011170();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_10001051C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for FTManagedHandle();
  uint64_t result = sub_100011180();
  *a1 = result;
  return result;
}

id FTManagedKeyValue.init(entity:insertInto:)(void *a1, void *a2)
{
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for FTManagedKeyValue();
  id v5 = objc_msgSendSuper2(&v7, "initWithEntity:insertIntoManagedObjectContext:", a1, a2);

  return v5;
}

uint64_t type metadata accessor for FTManagedKeyValue()
{
  return self;
}

id FTManagedKeyValue.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FTManagedKeyValue();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id static FTManagedKeyValue.fetchRequest()()
{
  id v0 = objc_allocWithZone((Class)NSFetchRequest);
  NSString v1 = sub_100011170();
  id v2 = [v0 initWithEntityName:v1];

  return v2;
}

uint64_t sub_1000106DC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for FTManagedKeyValue();
  uint64_t result = sub_100011180();
  *a1 = result;
  return result;
}

void sub_100010720()
{
  sub_1000058AC();
  sub_100005890((void *)&_mh_execute_header, v0, v1, "Enabling automatic lightweight migration", v2, v3, v4, v5, v6);
}

void sub_100010754()
{
  sub_1000058AC();
  sub_100005890((void *)&_mh_execute_header, v0, v1, "Enabling secure delete", v2, v3, v4, v5, v6);
}

void sub_100010788()
{
  sub_1000058AC();
  sub_100005890((void *)&_mh_execute_header, v0, v1, "Enabling restricted access until device is unlocked for the first time.", v2, v3, v4, v5, v6);
}

void sub_1000107BC()
{
  sub_1000058AC();
  sub_100005890((void *)&_mh_execute_header, v0, v1, "Configuring SQLite persistent store.", v2, v3, v4, v5, v6);
}

void sub_1000107F0()
{
  sub_1000058AC();
  sub_100005890((void *)&_mh_execute_header, v0, v1, "Configuring in-memory persistent store.", v2, v3, v4, v5, v6);
}

void sub_100010824(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Attempting to destroy corrupt persistent store due to fatal error %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001089C()
{
  sub_10000726C();
  sub_100007250((void *)&_mh_execute_header, v0, v1, "Attempt to add conversation links failed with error %@", v2, v3, v4, v5, v6);
}

void sub_100010904()
{
  sub_10000726C();
  sub_100007250((void *)&_mh_execute_header, v0, v1, "Attempt to add or update conversation links failed with error %@", v2, v3, v4, v5, v6);
}

void sub_10001096C()
{
  sub_10000726C();
  sub_100007250((void *)&_mh_execute_header, v0, v1, "Attempt to retrieve conversation link count failed with error %@", v2, v3, v4, v5, v6);
}

void sub_1000109D4()
{
  sub_10000726C();
  sub_100007250((void *)&_mh_execute_header, v0, v1, "Attempt to retrieve conversation links failed with error %@", v2, v3, v4, v5, v6);
}

void sub_100010A3C()
{
  sub_10000726C();
  sub_100007250((void *)&_mh_execute_header, v0, v1, "Attempt to remove conversation links failed with error %@", v2, v3, v4, v5, v6);
}

void sub_100010AA4()
{
  sub_10000726C();
  sub_100007250((void *)&_mh_execute_header, v0, v1, "Attempt to remove links from data source failed with error %@", v2, v3, v4, v5, v6);
}

void sub_100010B0C()
{
  sub_10000726C();
  sub_100007250((void *)&_mh_execute_header, v0, v1, "Attempt to modify conversation link failed with error %@", v2, v3, v4, v5, v6);
}

void sub_100010B74()
{
  sub_10000726C();
  sub_100007250((void *)&_mh_execute_header, v0, v1, "Attempt to set integer key value failed with error %@", v2, v3, v4, v5, v6);
}

void sub_100010BDC()
{
  sub_10000726C();
  sub_100007250((void *)&_mh_execute_header, v0, v1, "Attempt to set string key value failed with error %@", v2, v3, v4, v5, v6);
}

void sub_100010C44(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Moving corrupt persistent store with description %@ failed with error %@", (uint8_t *)&v3, 0x16u);
}

void sub_100010CCC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Couldn't addOrUpdateConversationLinkDescriptors for %@", (uint8_t *)&v2, 0xCu);
}

void sub_100010D44(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "couldn't save the changes for removing link", v1, 2u);
}

void sub_100010D88(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "couldn't save the changes for removing link from data source", v1, 2u);
}

void sub_100010DCC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Loading persistent stores", v1, 2u);
}

void sub_100010E10(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Loaded persistent store with description %@", (uint8_t *)&v2, 0xCu);
}

void sub_100010E88(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_100010F00(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  sub_10000726C();
  sub_10000E454((void *)&_mh_execute_header, v2, v3, "Connection is not entitled to use %@", v4, v5, v6, v7, v8);
}

void sub_100010F84(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Entitlement not found; rejecting connection %@",
    (uint8_t *)&v2,
    0xCu);
}

void sub_100010FFC()
{
  __error();
  sub_100010170();
  sub_100010150((void *)&_mh_execute_header, v0, v1, "failed to resolve temporary directory: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_100011078()
{
  __error();
  sub_100010170();
  sub_100010150((void *)&_mh_execute_header, v0, v1, "failed to create temporary directory: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_1000110F4()
{
  __error();
  sub_100010170();
  sub_100010150((void *)&_mh_execute_header, v0, v1, "failed to set user_dir_suffix path component: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

NSString sub_100011170()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100011180()
{
  return Identifiable<>.id.getter();
}

uint64_t CFCopyHomeDirectoryURLForUser()
{
  return _CFCopyHomeDirectoryURLForUser();
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _TUIsInternalInstall()
{
  return __TUIsInternalInstall();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend_activated(void *a1, const char *a2, ...)
{
  return _[a1 activated];
}

id objc_msgSend_addConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConnection:");
}

id objc_msgSend_addConversationLinkDescriptors_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConversationLinkDescriptors:error:");
}

id objc_msgSend_addConversationLinkDescriptors_managedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConversationLinkDescriptors:managedObjectContext:error:");
}

id objc_msgSend_addConversationLinkDescriptors_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConversationLinkDescriptors:reply:");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addOrUpdateConversationLinkDescriptors_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOrUpdateConversationLinkDescriptors:error:");
}

id objc_msgSend_addOrUpdateConversationLinkDescriptors_managedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOrUpdateConversationLinkDescriptors:managedObjectContext:error:");
}

id objc_msgSend_addOrUpdateConversationLinkDescriptors_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOrUpdateConversationLinkDescriptors:reply:");
}

id objc_msgSend_addOrUpdateKey_forIntegerValue_stringValue_managedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOrUpdateKey:forIntegerValue:stringValue:managedObjectContext:error:");
}

id objc_msgSend_addPersistentStoreWithDescription_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPersistentStoreWithDescription:completionHandler:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return _[a1 callback];
}

id objc_msgSend_clientXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 clientXPCInterface];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_connectionManager(void *a1, const char *a2, ...)
{
  return _[a1 connectionManager];
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return _[a1 connections];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_conversationLinkDescriptorCountWithPredicate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationLinkDescriptorCountWithPredicate:error:");
}

id objc_msgSend_conversationLinkDescriptorCountWithPredicate_managedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationLinkDescriptorCountWithPredicate:managedObjectContext:error:");
}

id objc_msgSend_conversationLinkDescriptorCountWithPredicate_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationLinkDescriptorCountWithPredicate:reply:");
}

id objc_msgSend_conversationLinkDescriptorsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 conversationLinkDescriptorsDidChange];
}

id objc_msgSend_conversationLinkDescriptorsWithPredicate_limit_offset_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationLinkDescriptorsWithPredicate:limit:offset:error:");
}

id objc_msgSend_conversationLinkDescriptorsWithPredicate_limit_offset_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationLinkDescriptorsWithPredicate:limit:offset:reply:");
}

id objc_msgSend_conversationLinkDescriptorsWithPredicate_managedObjectContext_limit_offset_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conversationLinkDescriptorsWithPredicate:managedObjectContext:limit:offset:error:");
}

id objc_msgSend_conversationServiceDataSourceError(void *a1, const char *a2, ...)
{
  return _[a1 conversationServiceDataSourceError];
}

id objc_msgSend_conversationServiceEntitlements(void *a1, const char *a2, ...)
{
  return _[a1 conversationServiceEntitlements];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countForFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countForFetchRequest:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return _[a1 creationDate];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _[a1 dataSource];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_delegateController(void *a1, const char *a2, ...)
{
  return _[a1 delegateController];
}

id objc_msgSend_deleteConversationLink_deleteReason_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteConversationLink:deleteReason:inContext:");
}

id objc_msgSend_deleteObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteObject:");
}

id objc_msgSend_deleteReason(void *a1, const char *a2, ...)
{
  return _[a1 deleteReason];
}

id objc_msgSend_deletedObjects(void *a1, const char *a2, ...)
{
  return _[a1 deletedObjects];
}

id objc_msgSend_deletionDate(void *a1, const char *a2, ...)
{
  return _[a1 deletionDate];
}

id objc_msgSend_destroyPersistentStoreAtURL_withType_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyPersistentStoreAtURL:withType:options:error:");
}

id objc_msgSend_destroyPersistentStoreWithDescription_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyPersistentStoreWithDescription:error:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_entitiesByName(void *a1, const char *a2, ...)
{
  return _[a1 entitiesByName];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return _[a1 entitlements];
}

id objc_msgSend_enumerateDelegatesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateDelegatesUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return _[a1 expirationDate];
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return _[a1 fetchRequest];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_groupUUID(void *a1, const char *a2, ...)
{
  return _[a1 groupUUID];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _[a1 handle];
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return _[a1 hasChanges];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_inMemoryPersistentStoreDescription(void *a1, const char *a2, ...)
{
  return _[a1 inMemoryPersistentStoreDescription];
}

id objc_msgSend_initWithConnection_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConnection:queue:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:");
}

id objc_msgSend_initWithEntity_insertIntoManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntity:insertIntoManagedObjectContext:");
}

id objc_msgSend_initWithGroupUUID_originator_pseudonym_publicKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGroupUUID:originator:pseudonym:publicKey:");
}

id objc_msgSend_initWithIdentifier_revision_handle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:revision:handle:");
}

id objc_msgSend_initWithName_queue_callback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:queue:callback:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:dataSource:");
}

id objc_msgSend_initWithStoreType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStoreType:");
}

id objc_msgSend_insertObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:");
}

id objc_msgSend_integerForKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:error:");
}

id objc_msgSend_integerForKey_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:reply:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invitedHandles(void *a1, const char *a2, ...)
{
  return _[a1 invitedHandles];
}

id objc_msgSend_isActivated(void *a1, const char *a2, ...)
{
  return _[a1 isActivated];
}

id objc_msgSend_isBootLockEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isBootLockEnabled];
}

id objc_msgSend_isEqualToHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToHandle:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isoCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 isoCountryCode];
}

id objc_msgSend_keyValueForKey_managedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueForKey:managedObjectContext:error:");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lifetimeType(void *a1, const char *a2, ...)
{
  return _[a1 lifetimeType];
}

id objc_msgSend_linkLifetimeScope(void *a1, const char *a2, ...)
{
  return _[a1 linkLifetimeScope];
}

id objc_msgSend_loadPersistentStoresWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadPersistentStoresWithCompletionHandler:");
}

id objc_msgSend_managedConversationLinkForTUConversationLinkDescriptor_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedConversationLinkForTUConversationLinkDescriptor:inManagedObjectContext:");
}

id objc_msgSend_managedHandleForTUHandle_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedHandleForTUHandle:inManagedObjectContext:");
}

id objc_msgSend_managedHandlesForTUHandles_inManagedObjectContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedHandlesForTUHandles:inManagedObjectContext:");
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return _[a1 managedObjectContext];
}

id objc_msgSend_managedObjectModel(void *a1, const char *a2, ...)
{
  return _[a1 managedObjectModel];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return _[a1 newBackgroundContext];
}

id objc_msgSend_normalizedEmailAddressHandleForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedEmailAddressHandleForValue:");
}

id objc_msgSend_normalizedGenericHandleForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedGenericHandleForValue:");
}

id objc_msgSend_normalizedPhoneNumberHandleForValue_isoCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedPhoneNumberHandleForValue:isoCountryCode:");
}

id objc_msgSend_normalizedValue(void *a1, const char *a2, ...)
{
  return _[a1 normalizedValue];
}

id objc_msgSend_notifyDelegatesConversationLinkDescriptorsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 notifyDelegatesConversationLinkDescriptorsDidChange];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_originator(void *a1, const char *a2, ...)
{
  return _[a1 originator];
}

id objc_msgSend_originatorHandle(void *a1, const char *a2, ...)
{
  return _[a1 originatorHandle];
}

id objc_msgSend_originatorIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 originatorIdentifier];
}

id objc_msgSend_originatorRevision(void *a1, const char *a2, ...)
{
  return _[a1 originatorRevision];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlock:");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_persistentContainer(void *a1, const char *a2, ...)
{
  return _[a1 persistentContainer];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 persistentStoreCoordinator];
}

id objc_msgSend_persistentStoreDescriptionWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentStoreDescriptionWithURL:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_privateKey(void *a1, const char *a2, ...)
{
  return _[a1 privateKey];
}

id objc_msgSend_pseudonym(void *a1, const char *a2, ...)
{
  return _[a1 pseudonym];
}

id objc_msgSend_publicKey(void *a1, const char *a2, ...)
{
  return _[a1 publicKey];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_removeConversationLinkDescriptorsWithPredicate_deleteReason_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConversationLinkDescriptorsWithPredicate:deleteReason:error:");
}

id objc_msgSend_removeConversationLinkDescriptorsWithPredicate_deleteReason_managedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConversationLinkDescriptorsWithPredicate:deleteReason:managedObjectContext:error:");
}

id objc_msgSend_removeConversationLinkDescriptorsWithPredicate_deleteReason_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConversationLinkDescriptorsWithPredicate:deleteReason:reply:");
}

id objc_msgSend_removeDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeDelegate:");
}

id objc_msgSend_removeLinkDescriptorsFromDataSourceWithPredicate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLinkDescriptorsFromDataSourceWithPredicate:error:");
}

id objc_msgSend_removeLinkDescriptorsFromDataSourceWithPredicate_managedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLinkDescriptorsFromDataSourceWithPredicate:managedObjectContext:error:");
}

id objc_msgSend_removeLinkDescriptorsFromDataSourceWithPredicate_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLinkDescriptorsFromDataSourceWithPredicate:reply:");
}

id objc_msgSend_removeLinkFromDatabase_inContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLinkFromDatabase:inContext:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_revision(void *a1, const char *a2, ...)
{
  return _[a1 revision];
}

id objc_msgSend_rollback(void *a1, const char *a2, ...)
{
  return _[a1 rollback];
}

id objc_msgSend_save_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "save:");
}

id objc_msgSend_serverXPCInterface(void *a1, const char *a2, ...)
{
  return _[a1 serverXPCInterface];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return _[a1 serviceListener];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActivated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivated:");
}

id objc_msgSend_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivated:withRevision:forConversationLinkDescriptorsWithPredicate:error:");
}

id objc_msgSend_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_managedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivated:withRevision:forConversationLinkDescriptorsWithPredicate:managedObjectContext:error:");
}

id objc_msgSend_setActivated_withRevision_forConversationLinkDescriptorsWithPredicate_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivated:withRevision:forConversationLinkDescriptorsWithPredicate:reply:");
}

id objc_msgSend_setBootLockEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBootLockEnabled:");
}

id objc_msgSend_setCreationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreationDate:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeleteReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteReason:");
}

id objc_msgSend_setDeletionDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeletionDate:");
}

id objc_msgSend_setExpirationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationDate:");
}

id objc_msgSend_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationDate:withRevision:forConversationLinkDescriptorsWithPredicate:error:");
}

id objc_msgSend_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_managedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationDate:withRevision:forConversationLinkDescriptorsWithPredicate:managedObjectContext:error:");
}

id objc_msgSend_setExpirationDate_withRevision_forConversationLinkDescriptorsWithPredicate_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpirationDate:withRevision:forConversationLinkDescriptorsWithPredicate:reply:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchLimit:");
}

id objc_msgSend_setFetchOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchOffset:");
}

id objc_msgSend_setFirstUnlockNotifyObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstUnlockNotifyObserver:");
}

id objc_msgSend_setGroupUUID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGroupUUID:");
}

id objc_msgSend_setInteger_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:error:");
}

id objc_msgSend_setInteger_forKey_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteger:forKey:reply:");
}

id objc_msgSend_setIntegerValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIntegerValue:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setInvitedHandles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitedHandles:");
}

id objc_msgSend_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitedHandles:withRevision:forConversationLinkDescriptorsWithPredicate:error:");
}

id objc_msgSend_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_managedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitedHandles:withRevision:forConversationLinkDescriptorsWithPredicate:managedObjectContext:error:");
}

id objc_msgSend_setInvitedHandles_withRevision_forConversationLinkDescriptorsWithPredicate_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitedHandles:withRevision:forConversationLinkDescriptorsWithPredicate:reply:");
}

id objc_msgSend_setIsoCountryCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsoCountryCode:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setLifetimeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLifetimeType:");
}

id objc_msgSend_setLinkLifetimeScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLinkLifetimeScope:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setName_withRevision_forConversationLinkDescriptorsWithPredicate_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:withRevision:forConversationLinkDescriptorsWithPredicate:error:");
}

id objc_msgSend_setName_withRevision_forConversationLinkDescriptorsWithPredicate_managedObjectContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:withRevision:forConversationLinkDescriptorsWithPredicate:managedObjectContext:error:");
}

id objc_msgSend_setName_withRevision_forConversationLinkDescriptorsWithPredicate_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:withRevision:forConversationLinkDescriptorsWithPredicate:reply:");
}

id objc_msgSend_setNormalizedValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNormalizedValue:");
}

id objc_msgSend_setOption_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOption:forKey:");
}

id objc_msgSend_setOriginatorHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginatorHandle:");
}

id objc_msgSend_setOriginatorIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginatorIdentifier:");
}

id objc_msgSend_setOriginatorRevision_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginatorRevision:");
}

id objc_msgSend_setPersistentStoreDescriptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentStoreDescriptions:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPrivateKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrivateKey:");
}

id objc_msgSend_setPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPseudonym:");
}

id objc_msgSend_setPublicKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPublicKey:");
}

id objc_msgSend_setRelationshipKeyPathsForPrefetching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelationshipKeyPathsForPrefetching:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setReturnsObjectsAsFaults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnsObjectsAsFaults:");
}

id objc_msgSend_setShouldMigrateStoreAutomatically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldMigrateStoreAutomatically:");
}

id objc_msgSend_setString_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:forKey:error:");
}

id objc_msgSend_setString_forKey_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setString:forKey:reply:");
}

id objc_msgSend_setStringValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStringValue:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forPragmaNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forPragmaNamed:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_shouldAcceptConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAcceptConnection:");
}

id objc_msgSend_simulateFatalPersistentStoreError(void *a1, const char *a2, ...)
{
  return _[a1 simulateFatalPersistentStoreError];
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringForKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:error:");
}

id objc_msgSend_stringForKey_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringForKey:reply:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_tuConversationLinkDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 tuConversationLinkDescriptor];
}

id objc_msgSend_tuHandle(void *a1, const char *a2, ...)
{
  return _[a1 tuHandle];
}

id objc_msgSend_tuInvitedHandles(void *a1, const char *a2, ...)
{
  return _[a1 tuInvitedHandles];
}

id objc_msgSend_tu_predicateForConversationLinkDescriptorsWithPseudonym_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tu_predicateForConversationLinkDescriptorsWithPseudonym:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_updateWithDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithDescriptor:");
}

id objc_msgSend_updatedObjects(void *a1, const char *a2, ...)
{
  return _[a1 updatedObjects];
}

id objc_msgSend_userConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 userConfiguration];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}