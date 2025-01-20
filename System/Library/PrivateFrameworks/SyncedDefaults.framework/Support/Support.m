uint64_t sub_100003C14(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100003DD0(&qword_10005BA20);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SYDKeyID.isEqual(_:)(uint64_t a1)
{
  sub_100003D68(a1, (uint64_t)v7);
  if (!v8)
  {
    sub_100003C14((uint64_t)v7);
    goto LABEL_14;
  }
  type metadata accessor for SYDKeyID();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    char v4 = 0;
    return v4 & 1;
  }
  BOOL v2 = *(void *)&v6[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key] == *(void *)(v1
                                                                                 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key)
    && *(void *)&v6[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key + 8] == *(void *)(v1
                                                                                     + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key
                                                                                     + 8);
  if (!v2 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {

    goto LABEL_14;
  }
  if (*(void *)&v6[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier] == *(void *)(v1
                                                                                             + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier)
    && *(void *)&v6[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier + 8] == *(void *)(v1
                                                                                                 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier
                                                                                                 + 8))
  {

    char v4 = 1;
  }
  else
  {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  return v4 & 1;
}

uint64_t sub_100003D68(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003DD0(&qword_10005BA20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100003DD0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_100003ECC(uint64_t a1)
{
  BOOL v2 = sub_1000084BC(*(void **)(a1 + 32));
  v3 = SYDGetConnectionLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100003F4C();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_100003F4C()
{
  sub_10000DF20();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Completed sync for store=%@ with error: %@");
}

void sub_1000040D8(id *a1)
{
  BOOL v2 = [a1[4] callbackQueue];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100010F24;
  v3[3] = &unk_1000510D0;
  id v5 = a1[6];
  id v4 = a1[5];
  dispatch_async(v2, v3);
}

void sub_10000418C(id *a1)
{
  BOOL v2 = [a1[4] callbackQueue];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100010F38;
  v3[3] = &unk_1000510D0;
  id v5 = a1[6];
  id v4 = a1[5];
  dispatch_async(v2, v3);
}

uint64_t sub_1000042E4(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

unint64_t sub_1000043D0()
{
  unint64_t result = qword_10005BA18;
  if (!qword_10005BA18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10005BA18);
  }
  return result;
}

void sub_100004424(uint64_t a1, void *a2)
{
  v3 = a2;
  if (!v3)
  {
    v7 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100010F80();
    }
    goto LABEL_8;
  }
  id v4 = v3;
  unsigned int v5 = [(id)objc_opt_class() shouldIgnoreFetchError:v3];
  v6 = SYDGetCloudKitLog();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_100031C0C();
    }

    v7 = v4;
LABEL_8:
    id v4 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100004590();
  }
LABEL_11:

  if (*(void *)(a1 + 40))
  {
    uint64_t v8 = [*(id *)(a1 + 32) queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000418C;
    block[3] = &unk_1000510F8;
    v9 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v12 = v9;
    v11 = v4;
    dispatch_async(v8, block);
  }
}

void sub_100004590()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error fetching records: %@", v2, v3, v4, v5, v6);
}

void sub_1000045F8(uint64_t a1)
{
  uint64_t v2 = SYDGetConnectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(SYDDaemonToClientConnection **)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Accepting new XPC connection %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v4 = [[SYDDaemonToClientConnection alloc] initWithXPCConnection:*(void *)(a1 + 32) delegate:*(void *)(a1 + 40)];
  uint64_t v5 = SYDGetConnectionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Created client connection %@", (uint8_t *)&v7, 0xCu);
  }

  uint8_t v6 = [*(id *)(a1 + 40) clientConnections];
  [v6 addObject:v4];
}

void sub_100004900()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Handling dictionaryRepresentation for store=%@", v2, v3, v4, v5, v6);
}

void sub_100004B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100004BA0()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Generating dictionary for store <(%@)>", v2, v3, v4, v5, v6);
}

void sub_100004C08(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && [*(id *)(a1 + 32) shouldRetryAfterModifyError:v3])
  {
    uint64_t v4 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will retry after error modifying pending records: %@", buf, 0xCu);
    }

    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001B368;
    v7[3] = &unk_100051148;
    id v8 = *(id *)(a1 + 56);
    [v5 sendChangesWithOptions:v6 completionHandler:v7];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_100004D58(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SYDGetCloudKitLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100004E70();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    sub_100010F4C();
  }

  if (*(void *)(a1 + 40))
  {
    uint64_t v6 = [*(id *)(a1 + 32) queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000040D8;
    block[3] = &unk_1000510F8;
    int v7 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v10 = v7;
    id v9 = v3;
    dispatch_async(v6, block);
  }
}

void sub_100004E70()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error modify pending records: %@", v2, v3, v4, v5, v6);
}

void sub_100004ED8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100004EF4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_100004F10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004F2C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_100005084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000050A0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) persistentStores];
  uint64_t v3 = [v2 firstObject];

  if (!v3)
  {
    v14 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100036E08();
    }

    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    CFStringRef v21 = @"Unable to load database";
    uint8_t v6 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v15 = +[NSError errorWithDomain:@"SyncedDefaults" code:4444 userInfo:v6];
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    v13 = *(NSObject **)(v16 + 40);
    *(void *)(v16 + 40) = v15;
    goto LABEL_11;
  }
  uint64_t v4 = [v3 persistentStoreCoordinator];
  v19 = v3;
  uint64_t v5 = +[NSArray arrayWithObjects:&v19 count:1];
  uint8_t v6 = [v4 currentPersistentHistoryTokenFromStores:v5];

  if (!v6)
  {
    v13 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "No current persistent history token", buf, 2u);
    }
    goto LABEL_11;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  int v7 = (void *)(a1 + 40);
  uint64_t v9 = *(void *)(v8 + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v10 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  uint64_t v11 = *(void *)(v7[1] + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  if (*(void *)(*(void *)(*v7 + 8) + 40))
  {
    v13 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100036E3C();
    }
LABEL_11:
  }
}

void sub_1000052E4(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v22 = *(id *)(v10 + 40);
  uint64_t v11 = [v9 contextForStoreIdentifier:v7 error:&v22];
  objc_storeStrong((id *)(v10 + 40), v22);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000C0AC;
  v15[3] = &unk_1000515D8;
  v15[4] = *(void *)(a1 + 32);
  id v16 = v8;
  uint64_t v20 = a4;
  id v17 = v11;
  id v18 = v7;
  char v21 = *(unsigned char *)(a1 + 56);
  long long v19 = *(_OWORD *)(a1 + 40);
  id v12 = v7;
  id v13 = v11;
  id v14 = v8;
  [v13 performBlockAndWait:v15];
}

void sub_100005410(uint64_t a1)
{
  uint64_t v2 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000056B4();
  }

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v3 = (id *)(a1 + 32);
  [v4 processPendingFetchedRecordsWithReason:@"finished fetching changes"];
  uint64_t v5 = [*v3 storeIdentifiersWithChangedValuesDuringFetchChanges];
  id v6 = [v5 count];

  if (v6)
  {
    if (![*v3 storeType])
    {
      id v7 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_100033774(v7, v8, v9, v10, v11, v12, v13, v14);
      }

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SYDRemotePreferencesSourceDidChangeExternally", 0, 0, 0);
    }
    id v16 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_1000336E8(v3);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v17 = [*v3 storeIdentifiersWithChangedValuesDuringFetchChanges];
    id v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        char v21 = 0;
        do
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = +[NSString stringWithFormat:@"%s%@", "com.apple.kvs.store-did-change.", *(void *)(*((void *)&v25 + 1) + 8 * (void)v21)];
          v23 = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(v23, v22, 0, 0, 0);

          char v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v19);
    }

    v24 = [*v3 storeIdentifiersWithChangedValuesDuringFetchChanges];
    [v24 removeAllObjects];
  }
}

void sub_100005648(uint64_t a1)
{
  uint64_t v2 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000E1D4();
  }

  uint64_t v3 = [*(id *)(a1 + 32) storeIdentifiersWithChangedValuesDuringFetchChanges];
  [v3 removeAllObjects];
}

void sub_1000056B4()
{
  sub_100009948(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Finished fetching changes for %@", v2, v3, v4, v5, v6);
}

void sub_10000585C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &v10);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v4 + 40);
  uint64_t v5 = (id *)(v4 + 40);
  uint8_t v6 = v7;
  if (v7) {
    uint64_t v8 = v6;
  }
  else {
    uint64_t v8 = v3;
  }
  objc_storeStrong(v5, v8);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  os_activity_scope_leave(&v10);
}

void sub_1000058E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_1000058F4(id *a1, void *a2)
{
  id v3 = a2;
  [a1[4] decrementManualSyncCount];
  uint64_t v4 = [a1[4] callbackQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003ECC;
  block[3] = &unk_100051350;
  id v7 = v3;
  id v8 = a1[5];
  id v9 = a1[6];
  id v5 = v3;
  dispatch_async(v4, block);
}

void sub_100005A8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005B64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005B98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000098EC(a1, a2, a3, 3.8521e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Incremented manual sync count to %ld for %@", v3, 0x16u);
}

void sub_100005BE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000098EC(a1, a2, a3, 3.8521e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Decremented manual sync count to %ld for %@", v3, 0x16u);
}

void sub_100005C30(uint64_t a1)
{
  uint64_t v2 = +[SYDTCCHelper sharedHelper];
  id v3 = [*(id *)(a1 + 32) xpcConnection];
  os_log_t v4 = v3;
  if (v3) {
    [v3 auditToken];
  }
  else {
    memset(v5, 0, sizeof(v5));
  }
  [v2 enableUbiquityIfNecessaryForAuditToken:v5];
}

id SYDGetTCCLog()
{
  if (qword_10005BC28 != -1) {
    dispatch_once(&qword_10005BC28, &stru_1000515B0);
  }
  uint64_t v0 = (void *)qword_10005BC20;
  return v0;
}

void sub_100005FC4()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Enabling TCC if necessary", v2, v3, v4, v5, v6);
}

void sub_100006004(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000602C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000604C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10000605C(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100006070(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006130(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), a2);
  }
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(*(os_activity_t *)(a1 + 32), &state);
  uint64_t v5 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) domain];
  if (![v5 isEqualToString:CKErrorDomain])
  {

    goto LABEL_10;
  }
  id v6 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) code];

  if (v6 != (id)20)
  {
LABEL_10:
    uint64_t v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000585C;
    v14[3] = &unk_100051030;
    id v15 = *(id *)(a1 + 32);
    long long v13 = *(_OWORD *)(a1 + 64);
    id v12 = (id)v13;
    long long v16 = v13;
    [v9 savePendingChangesToCloudForStoreIdentifiers:v10 group:v11 completionHandler:v14];

    goto LABEL_11;
  }
  id v7 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100031A6C();
  }

  uint64_t v8 = *(void *)(a1 + 64);
  if (v8) {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
  }
LABEL_11:
  os_activity_scope_leave(&state);
}

void sub_1000062D8(_Unwind_Exception *a1)
{
  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 64));
  _Unwind_Resume(a1);
}

id sub_100006A2C(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v4 = +[NSAssertionHandler currentHandler];
    uint64_t v5 = +[NSString stringWithUTF8String:"CKRecordZoneID *SYDStoreZoneID(NSString *__strong)"];
    [v4 handleFailureInFunction:v5 file:@"SYDUtilities.m" lineNumber:735 description:@"Must specify a store identifier to get a zone ID"];
  }
  id v2 = [objc_alloc((Class)CKRecordZoneID) initWithZoneName:v1 ownerName:CKCurrentUserDefaultName];

  return v2;
}

void sub_100006AF4(void *a1)
{
  id v1 = [a1 componentsJoinedByString:@", "];
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v2, v3, "Saving pending changes to cloud for stores [%@]", v4, v5, v6, v7, v8);
}

void sub_100006B80(void *a1)
{
  id v1 = [a1 componentsJoinedByString:@", "];
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v2, v3, "Fetching pending changes from cloud for stores [%@]", v4, v5, v6, v7, v8);
}

void sub_10000745C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10000759C()
{
  sub_100007604();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Handling objectForKey (%{private}@) for store=%@");
}

void sub_1000079C0(void *a1)
{
  [a1 count];
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v1, v2, "Generated change dictionary for %ld changes", v3, v4, v5, v6, v7);
}

void sub_100007C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100007E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000084BC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (!v1)
  {
    uint64_t v5 = 0;
    goto LABEL_45;
  }
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v54 = 1040;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_100010EE4;
  v49 = sub_100010EA4;
  id v50 = 0;
  if (sub_10000E824(v1))
  {
    v52[3] = 5555;
    uint64_t v3 = (void *)v46[5];
    v46[5] = @"Unable to open database file";

    id v4 = v2;
  }
  else
  {
    id v4 = 0;
  }
  if (sub_10000E8F4(v2))
  {
    v52[3] = 4444;
    uint64_t v6 = (void *)v46[5];
    v46[5] = @"Disk is full";

    id v7 = v2;
    id v4 = v7;
  }
  if (sub_10000E9D4(v2))
  {
    v52[3] = 4444;
    uint8_t v8 = (void *)v46[5];
    v46[5] = @"Unable to open database";

    id v9 = v2;
    id v4 = v9;
  }
  if (sub_10000E778(v2))
  {
    v52[3] = 7777;
    uint64_t v10 = (void *)v46[5];
    v46[5] = @"Network error";

    id v11 = v2;
    id v4 = v11;
  }
  if (v52[3] != 1040
    || ([v2 domain],
        id v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v12 isEqualToString:CKErrorDomain],
        v12,
        !v13))
  {
    id v18 = 0;
    goto LABEL_33;
  }
  uint64_t v14 = (uint64_t)[v2 code];
  if (v14 <= 22)
  {
    switch(v14)
    {
      case 2:
        uint64_t v20 = [v2 userInfo];
        long long v16 = [v20 objectForKeyedSubscript:CKPartialErrorsByItemIDKey];

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && [v16 count])
        {
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = sub_100017B30;
          v41[3] = &unk_100050DD8;
          v43 = &v51;
          v44 = &v45;
          id v42 = v16;
          [v42 enumerateKeysAndObjectsUsingBlock:v41];
          id v21 = v42;
        }
        else
        {
          v52[3] = 1234;
          id v21 = (id)v46[5];
          v46[5] = @"Failed to sync with CloudKit (Partial failure with no partial errors)";
        }

        break;
      case 3:
      case 4:
        v52[3] = 7777;
        id v15 = v46;
        long long v16 = (void *)v46[5];
        CFStringRef v17 = @"Network failure";
        goto LABEL_31;
      case 6:
      case 7:
        goto LABEL_22;
      case 9:
        v52[3] = 8888;
        id v15 = v46;
        long long v16 = (void *)v46[5];
        CFStringRef v17 = @"No account";
        goto LABEL_31;
      default:
        goto LABEL_48;
    }
    goto LABEL_32;
  }
  if (v14 > 109)
  {
    if (v14 == 110)
    {
      v52[3] = 121212;
      id v15 = v46;
      long long v16 = (void *)v46[5];
      CFStringRef v17 = @"End-to-end encryption unavailable";
    }
    else
    {
      if (v14 != 111) {
        goto LABEL_48;
      }
      v52[3] = 111111;
      id v15 = v46;
      long long v16 = (void *)v46[5];
      CFStringRef v17 = @"Encryption key sync failed";
    }
LABEL_31:
    void v15[5] = (uint64_t)v17;
    goto LABEL_32;
  }
  if (v14 == 23)
  {
LABEL_22:
    v52[3] = 9999;
    id v15 = v46;
    long long v16 = (void *)v46[5];
    CFStringRef v17 = @"Service unavailable";
    goto LABEL_31;
  }
  if (v14 != 25)
  {
LABEL_48:
    v52[3] = 1234;
    v37 = (void *)v46[5];
    v46[5] = @"Failed to sync with CloudKit";

    long long v16 = [v2 localizedDescription];
    if (v16)
    {
      uint64_t v38 = [(id)v46[5] stringByAppendingFormat:@" (%@)", v16];
      v39 = (void *)v46[5];
      v46[5] = v38;
    }
    id v40 = v2;

    id v4 = v40;
    goto LABEL_32;
  }
  v52[3] = 6666;
  uint64_t v19 = [v2 localizedDescription];
  long long v16 = (void *)v46[5];
  v46[5] = v19;
LABEL_32:

  id v22 = [v2 userInfo];
  id v18 = [v22 objectForKeyedSubscript:CKErrorRetryAfterKey];

LABEL_33:
  v23 = [v2 domain];
  unsigned int v24 = [v23 isEqualToString:@"SyncedDefaults"];

  if (v24)
  {
    id v25 = [v2 code];
    v52[3] = (uint64_t)v25;
    uint64_t v26 = [v2 localizedDescription];
    long long v27 = (void *)v46[5];
    v46[5] = v26;

    long long v28 = [v2 userInfo];
    uint64_t v29 = [v28 objectForKeyedSubscript:NSUnderlyingErrorKey];

    id v4 = (id)v29;
  }
  if (!v46[5])
  {
    v46[5] = @"Unknown error";
  }
  v30 = objc_opt_new();
  if (!v4) {
    goto LABEL_42;
  }
  id v31 = v4;
  v32 = [v31 domain];
  unsigned int v33 = [v32 isEqualToString:@"SyncedDefaults"];

  if (v33)
  {

LABEL_41:
    [v30 setObject:v31 forKeyedSubscript:NSUnderlyingErrorKey];
    goto LABEL_42;
  }
  int v34 = sub_10000E778(v31);

  if (v34) {
    goto LABEL_41;
  }
LABEL_42:
  if (v18) {
    [v30 setObject:v18 forKeyedSubscript:@"RetryAfter"];
  }
  [v30 setObject:v46[5] forKeyedSubscript:NSLocalizedDescriptionKey];
  v35 = +[NSError errorWithDomain:@"SyncedDefaults" code:v52[3] userInfo:v30];
  uint64_t v5 = sub_100008B64(v35);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);
LABEL_45:

  return v5;
}

void sub_100008B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

id sub_100008B64(void *a1)
{
  id v1 = a1;
  if (!sub_100008E78(v1))
  {
    id v7 = 0;
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    uint64_t v3 = objc_opt_new();
    if ([v2 count])
    {
      unint64_t v4 = 0;
      do
      {
        uint64_t v5 = [v2 objectAtIndexedSubscript:v4];
        uint64_t v6 = sub_100008B64();

        if (v6) {
          [v3 addObject:v6];
        }

        ++v4;
      }
      while (v4 < (unint64_t)[v2 count]);
    }
    if ([v3 count]) {
      id v7 = v3;
    }
    else {
      id v7 = 0;
    }
LABEL_30:

    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    uint64_t v3 = objc_opt_new();
    uint8_t v8 = [v2 allKeys];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          unsigned int v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (sub_100008E78(v13))
          {
            uint64_t v14 = [v2 objectForKeyedSubscript:v13];
            id v15 = sub_100008B64();

            if (v15) {
              [v3 setObject:v15 forKeyedSubscript:v13];
            }
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }
    if ([v3 count]) {
      id v7 = v3;
    }
    else {
      id v7 = 0;
    }

    goto LABEL_30;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v17 = v1;
  id v7 = v17;
  if (isKindOfClass)
  {
    id v18 = [v17 userInfo];
    uint64_t v19 = sub_100008B64();

    id v20 = objc_alloc((Class)NSError);
    id v21 = [v7 domain];
    id v22 = [v7 code];

    id v7 = [v20 initWithDomain:v21 code:v22 userInfo:v19];
  }
LABEL_31:

  return v7;
}

uint64_t sub_100008E78(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  id v2 = sub_100008F6C();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000042E4;
  v6[3] = &unk_100050EA8;
  id v3 = v1;
  id v7 = v3;
  uint8_t v8 = &v9;
  [v2 enumerateObjectsUsingBlock:v6];

  uint64_t v4 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v4;
}

void sub_100008F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100008F6C()
{
  if (qword_10005BB80 != -1) {
    dispatch_once(&qword_10005BB80, &stru_100050E80);
  }
  uint64_t v0 = (void *)qword_10005BB78;
  return v0;
}

id SYDGetCloudKitLog()
{
  if (qword_10005BBC8 != -1) {
    dispatch_once(&qword_10005BBC8, &stru_1000514F0);
  }
  uint64_t v0 = (void *)qword_10005BBC0;
  return v0;
}

void sub_10000983C()
{
  sub_10000991C();
  id v1 = sub_10000AC60((unint64_t)[v0 storeType]);
  sub_100009954();
  sub_1000098DC();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x16u);
}

uint64_t sub_1000098EC(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(void *)(a2 + 14) = result;
  return result;
}

void sub_100009904(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100009928(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_100009948(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100009A70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_100009D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009D70(NSObject *a1, void *key, void *a3)
{
  if (dispatch_get_specific(key))
  {
    uint64_t v5 = (void (*)(void *))a3[2];
    v5(a3);
  }
  else
  {
    dispatch_sync(a1, a3);
  }
}

id sub_100009DE8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v4 storeID];
  uint64_t v6 = [v4 processName];

  unint64_t v7 = (unint64_t)[v5 type];
  if (v7 > 3) {
    CFStringRef v8 = @"Unknown";
  }
  else {
    CFStringRef v8 = off_100050EC8[v7];
  }
  uint64_t v9 = [v3 URLByAppendingPathComponent:@"ChangeTokens" isDirectory:1];

  uint64_t v10 = [v9 URLByAppendingPathComponent:v8 isDirectory:1];

  uint64_t v11 = [v10 URLByAppendingPathComponent:v6 isDirectory:1];

  uint64_t v12 = [v5 identifier];
  uint64_t v13 = [v5 testConfiguration];
  uint64_t v14 = v13;
  if (v13)
  {
    uint64_t v15 = [v13 testServerName];
    uint64_t v16 = [v14 testDeviceID];
    uint64_t v17 = [v12 stringByAppendingFormat:@"-%@-%@", v15, v16];

    uint64_t v12 = (void *)v17;
  }
  id v18 = +[NSCharacterSet URLHostAllowedCharacterSet];
  uint64_t v19 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v18];

  id v20 = [v11 URLByAppendingPathComponent:v19];
  id v21 = SYDGetMiscLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v24 = v8;
    __int16 v25 = 2112;
    long long v26 = v6;
    __int16 v27 = 2112;
    long long v28 = v20;
    _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Created change token URL for type=%@ process=%@ url=%@", buf, 0x20u);
  }

  return v20;
}

void sub_10000A18C(uint64_t a1)
{
  id v2 = sub_10000A254([*(id *)(a1 + 32) type], 1);
  id v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) type];
  uint64_t v5 = [*(id *)(a1 + 32) testConfiguration];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v3 syncManagerForStoreType:v4 containerID:v2 testConfiguration:v5 createIfNecessary:1 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

id sub_10000A254(id a1, uint64_t a2)
{
  if ((unint64_t)a1 <= 3) {
    a1 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:*(&off_100050F08 + (void)a1) environment:a2];
  }
  return a1;
}

id SYDGetConnectionLog()
{
  if (qword_10005BBE8 != -1) {
    dispatch_once(&qword_10005BBE8, &stru_100051530);
  }
  id v0 = (void *)qword_10005BBE0;
  return v0;
}

CFStringRef sub_10000AC60(unint64_t a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_100050EC8[a1];
  }
}

uint64_t sub_10000AC84()
{
  return 1;
}

id sub_10000AD74()
{
  id v0 = +[UMUserPersona currentPersona];
  id v1 = [v0 isDataSeparatedPersona];

  return v1;
}

id SYDGetMiscLog()
{
  if (qword_10005BBB8 != -1) {
    dispatch_once(&qword_10005BBB8, &stru_1000514D0);
  }
  id v0 = (void *)qword_10005BBB0;
  return v0;
}

void sub_10000AEEC(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) entitledStoreIDs];
  id v4 = (id *)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 40) storeID];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 containsObject:v5];

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = [*(id *)(a1 + 32) xpcConnection];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v6 isXPCConnection:v7 entitledForStoreConfiguration:*(void *)(a1 + 40)];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v8 = SYDGetConnectionLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_10000DE94();
      }

      uint64_t v9 = [*v2 entitledStoreIDs];
      uint64_t v10 = [*v4 storeID];
      [v9 addObject:v10];
    }
    else
    {
      uint64_t v11 = [*v2 notEntitledStoreIDs];
      uint64_t v12 = [*v4 storeID];
      unsigned __int8 v13 = [v11 containsObject:v12];

      if (v13) {
        return;
      }
      uint64_t v14 = [*v2 notEntitledStoreIDs];

      if (!v14)
      {
        uint64_t v15 = +[NSMutableSet setWithCapacity:1];
        [*v2 setNotEntitledStoreIDs:v15];
      }
      uint64_t v16 = [*v2 notEntitledStoreIDs];
      uint64_t v17 = [*v4 storeID];
      [v16 addObject:v17];

      uint64_t v9 = SYDGetConnectionLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100033D34(v4, v9);
      }
    }
  }
}

void sub_10000B210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000B284(unint64_t a1)
{
  if (a1 > 3) {
    id v1 = (id *)&NSFileProtectionCompleteUntilFirstUserAuthentication;
  }
  else {
    id v1 = (id *)*(&off_100050EE8 + a1);
  }
  return *v1;
}

void sub_10000B2AC()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Saving change token to disk for %@", v2, v3, v4, v5, v6);
}

void sub_10000BBA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

id sub_10000C044()
{
  swift_bridgeObjectRetain();
  NSString v0 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_10000C0AC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) allObjects];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v5 + 40);
  uint8_t v6 = [v2 managedKeyValuesForKeyIDs:v3 inContext:v4 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);

  if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v8 = *(id *)(a1 + 40);
    id v9 = [v8 countByEnumeratingWithState:&v32 objects:v43 count:16];
    if (!v9) {
      goto LABEL_26;
    }
    id v11 = v9;
    uint64_t v12 = *(void *)v33;
    *(void *)&long long v10 = 141558531;
    long long v31 = v10;
    while (1)
    {
      unsigned __int8 v13 = 0;
      do
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v13);
        uint64_t v15 = objc_msgSend(v6, "objectForKeyedSubscript:", v14, v31, (void)v32);
        if (v15)
        {
          uint64_t v16 = SYDGetCoreDataLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            long long v26 = [v14 key];
            uint64_t v27 = *(void *)(a1 + 56);
            *(_DWORD *)buf = v31;
            uint64_t v38 = 1752392040;
            __int16 v39 = 2113;
            id v40 = v26;
            __int16 v41 = 2112;
            uint64_t v42 = v27;
            _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Existing keyValue for key <(%{private, mask.hash}@)> in store <(%@)>", buf, 0x20u);
          }
          uint64_t v17 = [*(id *)(a1 + 32) keyValueFromManagedKeyValue:v15 inStoreWithIdentifier:*(void *)(a1 + 56)];
          if (v17) {
            goto LABEL_19;
          }
        }
        else
        {
          int v18 = *(unsigned __int8 *)(a1 + 88);
          uint64_t v17 = SYDGetCoreDataLog();
          BOOL v19 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
          if (!v18)
          {
            if (v19)
            {
              CFStringRef v24 = [v14 key];
              uint64_t v25 = *(void *)(a1 + 56);
              *(_DWORD *)buf = v31;
              uint64_t v38 = 1752392040;
              __int16 v39 = 2113;
              id v40 = v24;
              __int16 v41 = 2112;
              uint64_t v42 = v25;
              _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "No keyValue for key <(%{private, mask.hash}@)> in store <(%@)>", buf, 0x20u);
            }
            goto LABEL_20;
          }
          if (v19)
          {
            long long v28 = [v14 key];
            uint64_t v29 = *(void *)(a1 + 56);
            *(_DWORD *)buf = v31;
            uint64_t v38 = 1752392040;
            __int16 v39 = 2113;
            id v40 = v28;
            __int16 v41 = 2112;
            uint64_t v42 = v29;
            _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Creating new keyValue for key <(%{private, mask.hash}@)> in store <(%@)>", buf, 0x20u);
          }
          id v20 = [SYDKeyValue alloc];
          id v21 = [v14 key];
          uint64_t v17 = [(SYDKeyValue *)v20 initWithKey:v21 storeIdentifier:*(void *)(a1 + 56)];

          [v17 setIsNewKeyValue:1];
          if (v17)
          {
LABEL_19:
            id v22 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
            v23 = [v17 keyID];
            [v22 setObject:v17 forKeyedSubscript:v23];

LABEL_20:
          }
        }

        unsigned __int8 v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v30 = [v8 countByEnumeratingWithState:&v32 objects:v43 count:16];
      id v11 = v30;
      if (!v30)
      {
LABEL_26:

        goto LABEL_27;
      }
    }
  }
  uint64_t v7 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000360F4();
  }

  **(unsigned char **)(a1 + 80) = 1;
LABEL_27:
}

void sub_10000C660(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint8_t v6 = +[NSPredicate predicateWithFormat:@"store.identifier == %@", a2];
  uint64_t v7 = +[NSPredicate predicateWithFormat:@"key IN %@", v5, v6];

  v10[1] = v7;
  id v8 = +[NSArray arrayWithObjects:v10 count:2];

  id v9 = +[NSCompoundPredicate andPredicateWithSubpredicates:v8];
  [*(id *)(a1 + 32) addObject:v9];
}

void sub_10000C76C(void *a1)
{
  if (a1[4])
  {
    uint64_t v2 = objc_opt_class();
    uint64_t v3 = a1[4];
    uint64_t v4 = *(void *)(a1[8] + 8);
    id obj = *(id *)(v4 + 40);
    id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v2 fromData:v3 error:&obj];
    objc_storeStrong((id *)(v4 + 40), obj);
  }
  else
  {
    id v5 = 0;
  }
  if (!*(void *)(*(void *)(a1[8] + 8) + 40))
  {
    uint64_t v88 = (uint64_t)(a1 + 8);
    uint8_t v6 = +[NSPersistentHistoryTransaction fetchRequest];
    uint64_t v7 = +[NSMutableArray arrayWithCapacity:3];
    id v8 = +[NSPredicate predicateWithFormat:@"author == nil"];
    [v7 addObject:v8];

    uint64_t v9 = a1[5];
    v91 = a1 + 5;
    if (v9)
    {
      long long v10 = +[NSPredicate predicateWithFormat:@"contextName == %@", v9];
      [v7 addObject:v10];
    }
    id v11 = +[NSCompoundPredicate andPredicateWithSubpredicates:v7];
    [v6 setPredicate:v11];

    uint64_t v12 = +[NSPersistentHistoryChangeRequest fetchHistoryAfterToken:v5];
    [v12 setFetchRequest:v6];
    [v12 setResultType:5];
    unsigned __int8 v13 = (void *)a1[6];
    uint64_t v14 = *(void *)(a1[8] + 8);
    id v129 = *(id *)(v14 + 40);
    uint64_t v15 = [v13 executeRequest:v12 error:&v129];
    objc_storeStrong((id *)(v14 + 40), v129);
    if (*(void *)(*(void *)(a1[8] + 8) + 40))
    {
      unsigned int v16 = [(id)objc_opt_class() isInvalidTokenError:*(void *)(*(void *)(a1[8] + 8) + 40)];
      uint64_t v17 = SYDGetCoreDataLog();
      int v18 = v17;
      if (v16)
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = *v91;
          uint64_t v20 = *(void *)(*(void *)(*(void *)v88 + 8) + 40);
          *(_DWORD *)buf = 138412546;
          uint64_t v137 = v19;
          __int16 v138 = 2112;
          uint64_t v139 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Persistent history token expired for (%@): %@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        sub_1000371D0();
      }
LABEL_111:

      goto LABEL_112;
    }
    if (!v15) {
      goto LABEL_112;
    }
    id v21 = [v15 result];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      int v18 = SYDGetCoreDataLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        sub_100037138((uint64_t)v15, v18);
      }
      goto LABEL_111;
    }
    v23 = [v15 result];
    id v24 = [v23 count];

    if (!v24)
    {
LABEL_112:

      goto LABEL_113;
    }
    v89 = a1;
    v83 = v12;
    v84 = v7;
    v85 = v6;
    v86 = v5;
    v82 = v15;
    v87 = [v15 result];
    uint64_t v25 = [v87 firstObject];
    objc_opt_class();
    char v26 = objc_opt_isKindOfClass();

    uint64_t v27 = SYDGetCoreDataLog();
    long long v28 = v27;
    if ((v26 & 1) == 0)
    {
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT)) {
        goto LABEL_109;
      }
      int v18 = v87;
      sub_100037064(v87);
LABEL_110:

      uint8_t v6 = v85;
      id v5 = v86;
      uint64_t v12 = v83;
      uint64_t v7 = v84;
      uint64_t v15 = v82;
      goto LABEL_111;
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_100036FD4(v87, (uint64_t)v91, v28);
    }

    long long v28 = +[NSMutableSet set];
    v90 = +[NSMutableSet set];
    uint64_t v29 = +[SYDManagedKeyValue entity];
    v102 = +[SYDManagedStore entity];
    id v30 = NSStringFromSelector("plistDataValue");
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    v93 = v87;
    v97 = v29;
    id v95 = [v93 countByEnumeratingWithState:&v125 objects:v135 count:16];
    if (!v95)
    {
      v92 = 0;
      goto LABEL_93;
    }
    v92 = 0;
    uint64_t v94 = *(void *)v126;
LABEL_21:
    id v31 = 0;
LABEL_22:
    if (*(void *)v126 != v94) {
      objc_enumerationMutation(v93);
    }
    v96 = (char *)v31;
    long long v32 = *(void **)(*((void *)&v125 + 1) + 8 * (void)v31);
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    long long v124 = 0u;
    long long v33 = [v32 changes];
    id v104 = [v33 countByEnumeratingWithState:&v121 objects:v134 count:16];
    if (!v104)
    {
      v101 = 0;
      long long v34 = 0;
      goto LABEL_61;
    }
    v101 = 0;
    long long v34 = 0;
    uint64_t v35 = *(void *)v122;
    uint64_t v98 = *(void *)v122;
    v99 = v33;
LABEL_26:
    uint64_t v36 = 0;
    while (1)
    {
      if (*(void *)v122 != v35) {
        objc_enumerationMutation(v33);
      }
      v37 = *(void **)(*((void *)&v121 + 1) + 8 * v36);
      uint64_t v38 = [v37 changedObjectID];
      __int16 v39 = [v38 entity];

      if (v39 == v29)
      {
        id v42 = [v37 changeType];
        if (!v42)
        {
          v103 = v39;
          __int16 v41 = [v37 changedObjectID];
          v44 = v28;
          goto LABEL_55;
        }
        if (v42 == (id)1)
        {
          v103 = v39;
          long long v119 = 0u;
          long long v120 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          __int16 v41 = [v37 updatedProperties];
          id v45 = [v41 countByEnumeratingWithState:&v117 objects:v133 count:16];
          if (v45)
          {
            id v46 = v45;
            v100 = v34;
            uint64_t v47 = *(void *)v118;
            do
            {
              for (i = 0; i != v46; i = (char *)i + 1)
              {
                if (*(void *)v118 != v47) {
                  objc_enumerationMutation(v41);
                }
                v49 = [*(id *)(*((void *)&v117 + 1) + 8 * i) name];
                unsigned int v50 = [v49 isEqualToString:v30];

                if (v50)
                {
                  uint64_t v51 = [v37 changedObjectID];
                  [v28 addObject:v51];
                }
              }
              id v46 = [v41 countByEnumeratingWithState:&v117 objects:v133 count:16];
            }
            while (v46);
            uint64_t v29 = v97;
            long long v34 = v100;
          }
          uint64_t v35 = v98;
          long long v33 = v99;
          goto LABEL_56;
        }
        if (v42 == (id)2)
        {
          v103 = v39;
          v43 = [v37 tombstone];
          __int16 v41 = [v43 objectForKeyedSubscript:@"key"];

          if (v41)
          {
            v44 = v101;
            if (!v101)
            {
              v44 = +[NSMutableSet set];
            }
            v101 = v44;
LABEL_55:
            [v44 addObject:v41];
          }
LABEL_56:

          __int16 v39 = v103;
        }
      }
      else if (v39 == v102)
      {
        v103 = v39;
        if (v34)
        {
          id v40 = SYDGetCoreDataLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
            sub_100036F9C(&v115, v116);
          }
        }
        [v37 changedObjectID];
        long long v34 = v41 = v34;
        goto LABEL_56;
      }

      if ((id)++v36 == v104)
      {
        id v104 = [v33 countByEnumeratingWithState:&v121 objects:v134 count:16];
        if (!v104)
        {
LABEL_61:

          if ([v101 count])
          {
            v52 = v96;
            if (v34)
            {
              uint64_t v53 = [v92 objectForKeyedSubscript:v34];
              if (v53)
              {
                uint64_t v54 = v53;
              }
              else
              {
                v55 = +[SYDManagedStore fetchRequest];
                v56 = v34;
                v57 = +[NSPredicate predicateWithFormat:@"self == %@", v34];
                [v55 setPredicate:v57];

                [v55 setResultType:2];
                [v55 setPropertiesToFetch:&off_100053CD8];
                v58 = (void *)v89[6];
                uint64_t v59 = *(void *)(v89[8] + 8);
                id v112 = *(id *)(v59 + 40);
                v60 = [v58 executeFetchRequest:v55 error:&v112];
                objc_storeStrong((id *)(v59 + 40), v112);
                if (*(void *)(*(void *)(v89[8] + 8) + 40))
                {
                  v61 = SYDGetCoreDataLog();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
                    sub_100036F44(buf, v88, &v137, v61);
                  }

                  uint64_t v54 = 0;
                  long long v34 = v56;
                }
                else
                {
                  v62 = [v60 firstObject];
                  uint64_t v54 = [v62 objectForKeyedSubscript:@"identifier"];

                  if (v54)
                  {
                    v63 = v92;
                    long long v34 = v56;
                    if (!v92)
                    {
                      v63 = +[NSMutableDictionary dictionary];
                    }
                    v92 = v63;
                    [v63 setObject:v54 forKeyedSubscript:v56];
                  }
                  else
                  {
                    v64 = SYDGetCoreDataLog();
                    long long v34 = v56;
                    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)v111 = 0;
                      _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "No store identifier when validating deleted keys", v111, 2u);
                    }

                    uint64_t v54 = 0;
                  }
                }

                v52 = v96;
              }
              if ([v54 isEqualToString:*v91]) {
                [v90 unionSet:v101];
              }
            }
            else
            {
              uint64_t v54 = SYDGetCoreDataLog();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
                sub_100036F0C(&v113, v114);
              }
            }
          }
          else
          {
            v52 = v96;
          }

          id v31 = v52 + 1;
          if (v31 == v95)
          {
            id v95 = [v93 countByEnumeratingWithState:&v125 objects:v135 count:16];
            if (!v95)
            {
LABEL_93:

              if ([v28 count])
              {
                v65 = +[SYDManagedKeyValue fetchRequest];
                [v65 setResultType:2];
                [v65 setReturnsDistinctResults:1];
                [v65 setPropertiesToFetch:&off_100053CF0];
                v66 = +[NSPredicate predicateWithFormat:@"self IN %@", v28];
                v132[0] = v66;
                v67 = +[NSPredicate predicateWithFormat:@"store.identifier == %@", v89[5]];
                v132[1] = v67;
                v68 = +[NSArray arrayWithObjects:v132 count:2];

                v69 = +[NSCompoundPredicate andPredicateWithSubpredicates:v68];
                [v65 setPredicate:v69];

                v70 = (void *)v89[6];
                uint64_t v71 = *(void *)(v89[8] + 8);
                id v110 = *(id *)(v71 + 40);
                v72 = [v70 executeFetchRequest:v65 error:&v110];
                objc_storeStrong((id *)(v71 + 40), v110);
                if (*(void *)(*(void *)(v89[8] + 8) + 40))
                {
                  v73 = SYDGetCoreDataLog();
                  if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT)) {
                    sub_100036EA4();
                  }
                }
                else
                {
                  long long v108 = 0u;
                  long long v109 = 0u;
                  long long v106 = 0u;
                  long long v107 = 0u;
                  v73 = v72;
                  id v74 = [v73 countByEnumeratingWithState:&v106 objects:v131 count:16];
                  if (v74)
                  {
                    id v75 = v74;
                    v105 = v72;
                    uint64_t v76 = *(void *)v107;
                    do
                    {
                      for (j = 0; j != v75; j = (char *)j + 1)
                      {
                        if (*(void *)v107 != v76) {
                          objc_enumerationMutation(v73);
                        }
                        v78 = [*(id *)(*((void *)&v106 + 1) + 8 * (void)j) objectForKeyedSubscript:@"key"];
                        if (v78) {
                          [v90 addObject:v78];
                        }
                      }
                      id v75 = [v73 countByEnumeratingWithState:&v106 objects:v131 count:16];
                    }
                    while (v75);
                    uint64_t v29 = v97;
                    v72 = v105;
                  }
                }
              }
              uint64_t v79 = [v90 allObjects];
              uint64_t v80 = *(void *)(v89[9] + 8);
              v81 = *(void **)(v80 + 40);
              *(void *)(v80 + 40) = v79;

LABEL_109:
              int v18 = v87;
              goto LABEL_110;
            }
            goto LABEL_21;
          }
          goto LABEL_22;
        }
        goto LABEL_26;
      }
    }
  }
  uint8_t v6 = SYDGetCoreDataLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_100037238();
  }
LABEL_113:
}

uint64_t type metadata accessor for SYDKeyID()
{
  return self;
}

void sub_10000D78C()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Getting current token for (%@)", v2, v3, v4, v5, v6);
}

void sub_10000DA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

id SYDGetCoreDataLog()
{
  if (qword_10005BBD8 != -1) {
    dispatch_once(&qword_10005BBD8, &stru_100051510);
  }
  NSString v0 = (void *)qword_10005BBD0;
  return v0;
}

void sub_10000DB10()
{
  sub_10000DB9C();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Getting changed keys for store <(%@)> with%@ token");
}

void sub_10000DBB4(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Found %ld changed keys for store <(%@)>", buf, 0x16u);
}

void sub_10000DE94()
{
  sub_10000E1C8(__stack_chk_guard);
  sub_10000DF20();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Caching entitlement for %@ for %@");
}

void sub_10000DF04(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000DF34(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10000DF44(uint64_t a1)
{
  uint64_t v2 = SYDGetConnectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000E0B4();
  }

  uint64_t v3 = [*(id *)(a1 + 40) registeredStoreIDs];
  uint64_t v4 = [*(id *)(a1 + 32) storeID];
  unsigned __int8 v5 = [v3 containsObject:v4];

  if ((v5 & 1) == 0)
  {
    uint8_t v6 = SYDGetConnectionLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10000E11C();
    }

    uint64_t v7 = [*(id *)(a1 + 40) registeredStoreIDs];
    id v8 = [*(id *)(a1 + 32) storeID];
    [v7 addObject:v8];
  }
  uint64_t v9 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005C30;
  block[3] = &unk_100050A50;
  void block[4] = *(void *)(a1 + 40);
  dispatch_async(v9, block);
}

void sub_10000E0B4()
{
  sub_100009948(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Asked to register for store %@", v2, v3, v4, v5, v6);
}

void sub_10000E11C()
{
  sub_10000E1C8(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Registering for store %@", v2, v3, v4, v5, v6);
}

void sub_10000E1C8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_10000E1D4()
{
  sub_100009948(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Started fetching changes for %@", v2, v3, v4, v5, v6);
}

void sub_10000E23C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id sub_10000E25C(void *a1)
{
  if (qword_10005BB48 != -1) {
    dispatch_once(&qword_10005BB48, &stru_100050DF8);
  }
  os_unfair_lock_lock(&stru_10005BB50);
  if (sub_10000AD74())
  {
    uint64_t v2 = +[UMUserPersona currentPersona];
    uint64_t v3 = [v2 userPersonaUniqueString];
    if (!v3) {
      +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, @"No persona identifier when getting KVS directory for data-separated persona. Current persona: uid=%u gid=%u type=%ld", [v2 uid], objc_msgSend(v2, "gid"), objc_msgSend(v2, "userPersonaType"));
    }
  }
  else
  {
    uint64_t v3 = @"Persona Non Grata";
  }
  uint64_t v4 = [(id)qword_10005BB40 objectForKeyedSubscript:v3];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    uint8_t v6 = SYDGetMiscLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10000E710();
    }
    id v7 = 0;
    goto LABEL_39;
  }
  container_query_create();
  container_query_set_class();
  xpc_object_t v8 = xpc_string_create("com.apple.kvs");
  container_query_set_identifiers();

  container_query_set_transient();
  container_query_operation_set_flags();
  if ((sub_10000AD74() & 1) == 0) {
    container_query_set_persona_unique_string();
  }
  if (container_query_get_single_result() && (uint64_t path = container_get_path()) != 0)
  {
    uint64_t v10 = path;
    id v11 = SYDGetMiscLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000308C4();
    }

    last_error = +[NSURL fileURLWithFileSystemRepresentation:v10 isDirectory:1 relativeToURL:0];
    uint64_t v13 = container_copy_sandbox_token();
    uint64_t v14 = SYDGetMiscLog();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
    if (!v13)
    {
      if (v15) {
        sub_100030798();
      }
      goto LABEL_29;
    }
    if (v15) {
      sub_10003085C();
    }

    if (sandbox_extension_consume() == -1)
    {
      uint64_t v14 = SYDGetMiscLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000307CC(v14);
      }
LABEL_29:
      uint64_t v19 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    last_error = (void *)container_query_get_last_error();
    if (last_error)
    {
      unsigned int v16 = (const char *)container_error_copy_unlocalized_description();
      id v17 = [objc_alloc((Class)NSString) initWithBytesNoCopy:v16 length:strlen(v16) encoding:4 freeWhenDone:1];
      uint64_t v14 = [objc_alloc((Class)NSString) initWithFormat:@"containermanager error %llu: %@", container_error_get_type(), v17];

      NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
      id v24 = v14;
      int v18 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      uint64_t v19 = +[NSError errorWithDomain:@"SyncedDefaults" code:1040 userInfo:v18];

      last_error = 0;
LABEL_30:

      goto LABEL_31;
    }
  }
  uint64_t v19 = 0;
LABEL_31:
  container_query_free();
  if (v19 || !last_error)
  {
    uint64_t v20 = SYDGetMiscLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      sub_100030730();
    }
  }
  id v21 = v19;

  id v7 = v21;
  if (last_error)
  {
    uint64_t v5 = [last_error URLByAppendingPathComponent:@"com.apple.kvs" isDirectory:1];

    [(id)qword_10005BB40 setObject:v5 forKeyedSubscript:v3];
    uint8_t v6 = SYDGetMiscLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1000306C8();
    }
LABEL_39:

    if (!a1) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
  uint64_t v5 = 0;
  if (a1) {
LABEL_40:
  }
    *a1 = v7;
LABEL_41:
  os_unfair_lock_unlock(&stru_10005BB50);

  return v5;
}

void sub_10000E710()
{
  sub_100007604();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Returning cached KVS directory for persona %@: %@");
}

uint64_t sub_10000E778(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 domain];
  unsigned int v3 = [v2 isEqualToString:CKErrorDomain];

  if (v3)
  {
    uint64_t v4 = (char *)[v1 code];

    if ((unint64_t)(v4 - 3) < 2) {
      return 1;
    }
  }
  else
  {
    uint8_t v6 = [v1 domain];

    unsigned __int8 v7 = [v6 isEqualToString:NSURLErrorDomain];
    if (v7) {
      return 1;
    }
  }
  return 0;
}

uint64_t sub_10000E824(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 userInfo];
  unsigned int v3 = [v2 objectForKeyedSubscript:NSSQLiteErrorDomain];

  if (v3 && ([v3 integerValue] == (id)3 || objc_msgSend(v3, "integerValue") == (id)23)) {
    goto LABEL_6;
  }
  uint64_t v4 = [v1 domain];
  if (![v4 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_8;
  }
  id v5 = [v1 code];

  if (v5 != (id)257)
  {
LABEL_8:
    uint64_t v6 = 0;
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v6 = 1;
LABEL_9:

  return v6;
}

uint64_t sub_10000E8F4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 domain];
  unsigned int v3 = [v2 isEqualToString:NSSQLiteErrorDomain];

  if (v3)
  {
    id v4 = [v1 code];

    id v5 = +[NSNumber numberWithInteger:v4];
    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v6 = [v1 userInfo];

    id v5 = [v6 objectForKeyedSubscript:NSSQLiteErrorDomain];

    if (!v5)
    {
LABEL_7:
      uint64_t v7 = 0;
      goto LABEL_8;
    }
  }
  if ([v5 integerValue] != (id)13) {
    goto LABEL_7;
  }
  uint64_t v7 = 1;
LABEL_8:

  return v7;
}

uint64_t sub_10000E9D4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 domain];
  unsigned int v3 = [v2 isEqualToString:NSSQLiteErrorDomain];

  if (v3)
  {
    id v4 = [v1 code];

    id v5 = +[NSNumber numberWithInteger:v4];
    if (!v5) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v6 = [v1 userInfo];

    id v5 = [v6 objectForKeyedSubscript:NSSQLiteErrorDomain];

    if (!v5)
    {
LABEL_7:
      uint64_t v7 = 0;
      goto LABEL_8;
    }
  }
  if ([v5 integerValue] != (id)14) {
    goto LABEL_7;
  }
  uint64_t v7 = 1;
LABEL_8:

  return v7;
}

void sub_10000EE58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v13 - 80));
  _Unwind_Resume(a1);
}

void sub_10000EF18(uint64_t a1)
{
  [*(id *)(a1 + 32) generateStoreBundleMapIfNecessary];
  id v6 = [*(id *)(a1 + 32) cachedStoreBundleMap];
  uint64_t v2 = [v6 allKeys];
  uint64_t v3 = +[NSSet setWithArray:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_10000EFB8()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Synchronizing stores with the cloud: %@", v2, v3, v4, v5, v6);
}

void sub_10000F0B0()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Handling sync for store=%@", v2, v3, v4, v5, v6);
}

void sub_10000F308(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_10000F340(void *a1)
{
  uint64_t v1 = [a1 xpcConnection];
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v2, v3, "Resuming connection %@", v4, v5, v6, v7, v8);
}

void sub_10000F858(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) coreDataStore];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v2 keyValueForKey:v3 inStoreWithIdentifier:v4 createIfNecessary:0 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v7 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      CFStringRef v8 = *(const __CFString **)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138478339;
      CFStringRef v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v9;
      __int16 v22 = 2112;
      uint64_t v23 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error fetching object for key %{private}@ in %@: %@", buf, 0x20u);
    }
  }
  else
  {
    uint64_t v11 = [v6 value];
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    uint64_t v7 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
        CFStringRef v14 = &stru_100051D50;
      }
      else {
        CFStringRef v14 = @"(null) ";
      }
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412803;
      CFStringRef v19 = v14;
      __int16 v20 = 2113;
      uint64_t v21 = v15;
      __int16 v22 = 2112;
      uint64_t v23 = v16;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Fetched %@object for key %{private}@ in %@", buf, 0x20u);
    }
  }
}

void sub_10000FF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000103F4()
{
  sub_10000991C();
  v3[0] = 67109378;
  v3[1] = [v2 processIdentifier];
  __int16 v4 = 2112;
  uint64_t v5 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Checking if process %d is entitled for store %@", (uint8_t *)v3, 0x12u);
}

void sub_10001048C(uint64_t a1)
{
  id v2 = NSStringFromSelector("key");
  uint64_t v3 = NSStringFromSelector("plistDataValue");
  __int16 v4 = +[SYDManagedKeyValue fetchRequest];
  uint64_t v5 = +[NSPredicate predicateWithFormat:@"store.identifier == %@", *(void *)(a1 + 32)];
  [v4 setPredicate:v5];

  uint64_t v6 = NSStringFromSelector("valueModificationDate");
  uint64_t v7 = +[NSSortDescriptor sortDescriptorWithKey:v6 ascending:0];
  v52 = v7;
  CFStringRef v8 = +[NSArray arrayWithObjects:&v52 count:1];
  [v4 setSortDescriptors:v8];

  [v4 setResultType:2];
  v51[0] = v2;
  v51[1] = v3;
  uint64_t v9 = +[NSArray arrayWithObjects:v51 count:2];
  [v4 setPropertiesToFetch:v9];

  uint64_t v33 = a1;
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v10 + 40);
  long long v32 = v4;
  uint64_t v11 = [v4 execute:&obj];
  objc_storeStrong((id *)(v10 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v12 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      sub_1000376F4();
    }

    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    CFStringRef v14 = *(void **)(a1 + 40);
    uint64_t v15 = [*(id *)(a1 + 48) persistentStoreCoordinator];
    [v14 handleCorruptionIfNecessaryFromError:v13 inPersistentStoreCoordinator:v15];
  }
  long long v34 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v11 count]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v35 = v11;
  id v16 = [v35 countByEnumeratingWithState:&v37 objects:v50 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v38;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(v35);
        }
        __int16 v20 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        uint64_t v21 = [v20 objectForKeyedSubscript:v2];
        __int16 v22 = [v20 objectForKeyedSubscript:v3];
        if (v22)
        {
          id v36 = 0;
          uint64_t v23 = +[NSPropertyListSerialization propertyListWithData:v22 options:0 format:0 error:&v36];
          id v24 = v36;
          if (v23)
          {
            [v34 setObject:v23 forKeyedSubscript:v21];
          }
          else
          {
            char v26 = SYDGetCoreDataLog();
            uint64_t v27 = v26;
            if (v24)
            {
              if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
              {
                uint64_t v28 = *(void *)(v33 + 32);
                *(_DWORD *)buf = 141558787;
                uint64_t v43 = 1752392040;
                __int16 v44 = 2113;
                id v45 = v21;
                __int16 v46 = 2112;
                uint64_t v47 = v28;
                __int16 v48 = 2112;
                v49 = v24;
                _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, "Error decoding plist value data for key <(%{private, mask.hash}@)> in dictionary representation for store <(%@)>: %@", buf, 0x2Au);
              }
            }
            else if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              uint64_t v29 = *(void *)(v33 + 32);
              *(_DWORD *)buf = 141558531;
              uint64_t v43 = 1752392040;
              __int16 v44 = 2113;
              id v45 = v21;
              __int16 v46 = 2112;
              uint64_t v47 = v29;
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Nil deserialized value for key <(%{private, mask.hash}@)> when generating dictionary for store <(%@)>", buf, 0x20u);
            }
          }
        }
        else
        {
          id v24 = SYDGetCoreDataLog();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            uint64_t v25 = *(void *)(v33 + 32);
            *(_DWORD *)buf = 141558531;
            uint64_t v43 = 1752392040;
            __int16 v44 = 2113;
            id v45 = v21;
            __int16 v46 = 2112;
            uint64_t v47 = v25;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "No value for key <(%{private, mask.hash}@)> when generating dictionary for store <(%@)>", buf, 0x20u);
          }
        }
      }
      id v17 = [v35 countByEnumeratingWithState:&v37 objects:v50 count:16];
    }
    while (v17);
  }

  uint64_t v30 = *(void *)(*(void *)(v33 + 64) + 8);
  id v31 = *(void **)(v30 + 40);
  *(void *)(v30 + 40) = v34;
}

void sub_100010990()
{
  sub_10000991C();
  [v0 processIdentifier];
  sub_10000761C();
  sub_100010A34((void *)&_mh_execute_header, v1, v2, "Process %d is entitled for store %@ via %@", v3, v4, v5, v6, v7);
}

void sub_100010A14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_100010A34(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void sub_100010A54()
{
  sub_10000991C();
  [v0 processIdentifier];
  sub_10000761C();
  sub_100010A34((void *)&_mh_execute_header, v1, v2, "Process %d is entitled for store %@ via %@", v3, v4, v5, v6, v7);
}

void sub_100010AD8(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  if (!*(void *)(*(void *)(a1 + 32) + 16))
  {
    uint64_t v3 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100037E1C();
    }

    uint64_t v4 = [(id)objc_opt_class() managedObjectModel];
    id v5 = [objc_alloc((Class)NSPersistentContainer) initWithName:@"SYDManagedObjectModel" managedObjectModel:v4];
    id v6 = objc_alloc((Class)NSPersistentStoreDescription);
    uint8_t v7 = [*(id *)(a1 + 32) URL];
    id v8 = [v6 initWithURL:v7];

    [v8 setType:NSSQLiteStoreType];
    [v8 setShouldMigrateStoreAutomatically:1];
    [v8 setShouldInferMappingModelAutomatically:1];
    [v8 setShouldAddStoreAsynchronously:0];
    [v8 setOption:&__kCFBooleanTrue forKey:NSPersistentHistoryTrackingKey];
    uint64_t v9 = [*(id *)(a1 + 32) fileProtectionType];
    [v8 setOption:v9 forKey:NSPersistentStoreFileProtectionKey];

    id v31 = v8;
    uint64_t v10 = +[NSArray arrayWithObjects:&v31 count:1];
    [v5 setPersistentStoreDescriptions:v10];

    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2020000000;
    char v30 = 0;
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002CF8C;
    v18[3] = &unk_100051858;
    __int16 v20 = &v27;
    uint64_t v21 = &v23;
    v18[4] = *(void *)(a1 + 32);
    id v11 = v5;
    uint64_t v12 = *(void *)(a1 + 40);
    id v19 = v11;
    uint64_t v22 = v12;
    [v11 loadPersistentStoresWithCompletionHandler:v18];
    if (*((unsigned char *)v28 + 24)) {
      goto LABEL_5;
    }
    if (*((unsigned char *)v24 + 24))
    {
      CFStringRef v14 = SYDGetCoreDataLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Retrying to load persistent store", buf, 2u);
      }

      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10002D0B4;
      v16[3] = &unk_100051880;
      uint64_t v15 = *(void *)(a1 + 40);
      v16[4] = &v27;
      v16[5] = v15;
      [v11 loadPersistentStoresWithCompletionHandler:v16];
      if (*((unsigned char *)v28 + 24))
      {
LABEL_5:
        uint64_t v13 = SYDGetCoreDataLog();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          sub_100037DE8();
        }

        objc_storeStrong((id *)*v1 + 2, v5);
        [*v1 clearContexts];
      }
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v27, 8);
  }
}

void sub_100010E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100010E94(uint64_t a1)
{
}

void sub_100010E9C(uint64_t a1)
{
}

void sub_100010EA4(uint64_t a1)
{
}

void sub_100010EAC(uint64_t a1)
{
}

void sub_100010EB4(uint64_t a1)
{
}

void sub_100010EBC(uint64_t a1)
{
}

uint64_t sub_100010EC4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100010ED4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100010EE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100010EF4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100010F04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100010F14(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_100010F24(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100010F38(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100010F4C()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Finished modifying pending records", v2, v3, v4, v5, v6);
}

void sub_100010F80()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Finished fetching changes", v2, v3, v4, v5, v6);
}

void sub_100010FB4()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Generating next record batch in context %@", v2, v3, v4, v5, v6);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = _os_activity_create((void *)&_mh_execute_header, "kvs/main", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  uint64_t v4 = getenv("SYD_IN_SYNC_BUBBLE");
  if (v4 && atoi(v4) == 1)
  {
    uint64_t v5 = SYDGetMiscLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    *(_WORD *)uint64_t v12 = 0;
    uint8_t v6 = "Starting in the sync bubble";
  }
  else
  {
    uint64_t v5 = SYDGetMiscLog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    *(_WORD *)uint64_t v12 = 0;
    uint8_t v6 = "Starting";
  }
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, v6, v12, 2u);
LABEL_8:

  uint8_t v7 = dispatch_get_global_queue(0, 0);
  dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v7);
  uint64_t v9 = (void *)qword_10005BAB8;
  qword_10005BAB8 = (uint64_t)v8;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10005BAB8, &stru_100050970);
  dispatch_resume((dispatch_object_t)qword_10005BAB8);
  signal(15, (void (__cdecl *)(int))1);
  uint64_t v10 = objc_alloc_init(SYDDaemon);
  id v11 = (void *)qword_10005BAB0;
  qword_10005BAB0 = (uint64_t)v10;

  [(id)qword_10005BAB0 start];
  notify_post("com.apple.syncdefaultsd.daemon.wake");
  dispatch_main();
}

void sub_100011184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_1000111A0(id a1)
{
  uint64_t v1 = SYDGetMiscLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Exiting due to SIGTERM", v2, 2u);
  }

  exit(0);
}

void sub_100011200(id a1)
{
  qword_10005BAC0 = objc_alloc_init(SYDStoreBundleMap);
  _objc_release_x1();
}

void sub_10001158C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000115A4(void *a1)
{
  uint64_t v2 = a1 + 4;
  if (![(id)a1[4] length])
  {
    id v19 = +[NSAssertionHandler currentHandler];
    [v19 handleFailureInMethod:a1[7] object:a1[5] file:@"SYDStoreBundleMap.m" lineNumber:81 description:@"storeIdentifier must not be empty"];
  }
  uint64_t v3 = [@"com.apple.kvs.disable-sync" stringByAppendingString:*v2];
  uint64_t v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:v3];

  if (v5)
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    uint8_t v6 = SYDGetConnectionLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10002E8A0((uint64_t)v2, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    uint8_t v6 = SYDGetConnectionLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10002E910((uint64_t)v2, v6, v13, v14, v15, v16, v17, v18);
    }
  }
}

void sub_100011790(uint64_t a1)
{
  if (![*(id *)(a1 + 32) length])
  {
    uint64_t v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"SYDStoreBundleMap.m" lineNumber:97 description:@"storeIdentifier must not be empty"];
  }
  uint64_t v2 = [@"com.apple.kvs.disable-sync" stringByAppendingString:*(void *)(a1 + 32)];
  int v3 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v4 = SYDGetConnectionLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Enabling cloud sync for store <(%@)>", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v7 = +[NSUserDefaults standardUserDefaults];
    [v7 removeObjectForKey:v2];
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Disabling cloud sync for store <(%@)>", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v7 = +[NSUserDefaults standardUserDefaults];
    [v7 setBool:1 forKey:v2];
  }
}

void sub_10001192C(id a1)
{
  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v1 = [v3 copy];
  uint64_t v2 = (void *)qword_10005BAD0;
  qword_10005BAD0 = (uint64_t)v1;
}

void sub_100011B18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011B38(uint64_t a1)
{
  [*(id *)(a1 + 32) generateStoreBundleMapIfNecessary];
  id v5 = [*(id *)(a1 + 32) cachedStoreBundleMap];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100011C34(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) cachedStoreBundleMap];

  if (v2)
  {
    uint64_t v3 = SYDGetMiscLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10002EB14(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    [*(id *)(a1 + 32) setCachedStoreBundleMap:0];
  }
}

id sub_100012380(uint64_t a1)
{
  uint64_t v2 = SYDGetMiscLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10002EB84(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  return [*(id *)(a1 + 40) setCachedStoreBundleMap:0];
}

void sub_100012708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012720(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_allSyncManagers");
  return _objc_release_x1();
}

void sub_10001285C(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000128E8;
  v4[3] = &unk_100050AF0;
  id v5 = *(id *)(a1 + 32);
  [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

id sub_1000128E8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void sub_1000129B0(uint64_t a1)
{
  uint64_t v2 = SYDGetConnectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10002EC5C();
  }

  uint64_t v3 = [*(id *)(a1 + 40) clientConnections];
  [v3 removeObject:*(void *)(a1 + 32)];
}

id sub_100012AA0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _processAccountChanges];
}

void sub_100013084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

void sub_100013104(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accountStore];
  uint64_t v3 = objc_msgSend(v2, "syd_accountIdentifierForCurrentPersona");

  uint64_t v4 = SYDGetConnectionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10002EE88();
  }

  id v5 = (id *)(a1 + 40);
  uint64_t v6 = [*(id *)(a1 + 40) coreDataStore];
  id v28 = 0;
  uint64_t v7 = [v6 acAccountIdentifierWithError:&v28];
  id v8 = v28;
  if (v8)
  {
    uint64_t v9 = SYDGetConnectionLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10002EE14((void *)(a1 + 40));
    }
LABEL_6:

    int v10 = 0;
    int v11 = 0;
    goto LABEL_7;
  }
  if (v7)
  {
    if (v3)
    {
      unsigned int v21 = [v3 isEqualToString:v7];
      uint64_t v9 = SYDGetConnectionLog();
      BOOL v22 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
      if (v21)
      {
        if (v22) {
          sub_10002ED60();
        }
        goto LABEL_6;
      }
      if (v22) {
        sub_10002ED94((uint64_t)v7);
      }

      [v6 deleteDataForAllStoresWithError:0];
      uint64_t v25 = v6;
      char v26 = v3;
    }
    else
    {
      id v24 = SYDGetConnectionLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        sub_10002ED2C();
      }

      [v6 deleteDataForAllStoresWithError:0];
      uint64_t v25 = v6;
      char v26 = 0;
    }
    [v25 setACAccountIdentifier:v26 error:0];
    int v10 = 0;
    int v11 = 1;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    goto LABEL_7;
  }
  uint64_t v9 = SYDGetConnectionLog();
  BOOL v23 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (!v3)
  {
    if (v23) {
      sub_10002ECC4();
    }
    goto LABEL_6;
  }
  if (v23) {
    sub_10002ECF8();
  }

  [v6 clearServerSystemFieldsRecordsForAllStoresWithError:0];
  [v6 setACAccountIdentifier:v3 error:0];
  int v10 = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  int v11 = 1;
LABEL_7:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (!v11) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v7);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  if (v11)
  {
LABEL_10:
    int v27 = v10;
    uint64_t v12 = objc_opt_class();
    id v13 = [*(id *)(a1 + 40) storeType];
    [*(id *)(a1 + 40) container];
    uint64_t v14 = v6;
    uint64_t v15 = v7;
    v17 = uint64_t v16 = v3;
    uint64_t v18 = [v17 containerID];
    id v19 = [*(id *)(a1 + 40) testConfiguration];
    __int16 v20 = [v12 containerForStoreType:v13 containerID:v18 testConfiguration:v19];

    uint64_t v3 = v16;
    uint64_t v7 = v15;
    uint64_t v6 = v14;
    id v5 = (id *)(a1 + 40);
    [*(id *)(a1 + 40) resetSyncEngineWithContainer:v20];

    int v10 = v27;
  }
LABEL_11:
  if (v10) {
    [*v5 markAllKeyValuesAsNeedingToBeUploaded];
  }
}

void sub_100013710(uint64_t a1)
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) clientConnections];
  id v3 = [v2 copy];

  id obj = v3;
  id v4 = [v3 countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v21 = *(void *)v27;
    *(void *)&long long v5 = 138412546;
    long long v19 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        uint64_t v9 = objc_msgSend(v8, "registeredStoreIDs", v19);
        id v10 = [v9 copy];

        id v11 = [v10 countByEnumeratingWithState:&v22 objects:v34 count:16];
        if (v11)
        {
          id v12 = v11;
          uint64_t v13 = *(void *)v23;
          while (2)
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(void *)v23 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(a1 + 40);
              uint64_t v16 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) identifier];
              LOBYTE(v15) = [v15 containsObject:v16];

              if (v15)
              {

                id v10 = [v8 applicationIdentifier];
                if (v10)
                {
                  [*(id *)(a1 + 48) addObject:v10];
                }
                else
                {
                  uint64_t v17 = SYDGetConnectionLog();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v18 = *(void *)(a1 + 40);
                    *(_DWORD *)buf = v19;
                    uint64_t v31 = v18;
                    __int16 v32 = 2112;
                    uint64_t v33 = v8;
                    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Found registered store in %@, but no application identifier from %@", buf, 0x16u);
                  }
                }
                goto LABEL_20;
              }
            }
            id v12 = [v10 countByEnumeratingWithState:&v22 objects:v34 count:16];
            if (v12) {
              continue;
            }
            break;
          }
        }
LABEL_20:
      }
      id v6 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v6);
  }
}

void sub_100013994(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accountStore];
  id v3 = objc_msgSend(v2, "syd_accountIdentifierForCurrentPersona");

  id v4 = SYDGetConnectionLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Setting initial account identifier to %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) setACAccountIdentifier:v3 error:0];
}

void sub_100013C60(uint64_t a1)
{
  uint64_t v2 = SYDGetMiscLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10002F3DC();
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = sub_100018EB8();
  id v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    id v6 = v4;
    uint64_t v7 = *(void *)v18;
    *(void *)&long long v5 = 138412290;
    long long v15 = v5;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * (void)v8), "integerValue", v15);
        id v10 = sub_10000A254(v9, 1);
        id v11 = *(void **)(a1 + 40);
        id v16 = 0;
        id v12 = [v11 syncManagerForStoreType:v9 containerID:v10 testConfiguration:0 createIfNecessary:1 error:&v16];
        id v13 = v16;

        if (!v12)
        {
          uint64_t v14 = SYDGetConnectionLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v15;
            id v22 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error creating sync manager during initialization: %@", buf, 0xCu);
          }
        }
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v6);
  }
}

void sub_100013FC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([v5 isEqualToString:@"PersonalPersona"] & 1) == 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10001409C;
    v7[3] = &unk_100050BB8;
    id v8 = *(id *)(a1 + 32);
    id v9 = v5;
    [v6 enumerateKeysAndObjectsUsingBlock:v7];
  }
}

void sub_10001409C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = SYDGetConnectionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10002F478();
  }

  id v6 = [v4 personaUniqueString];

  if (v6)
  {
    uint64_t v7 = [v4 personaUniqueString];
    id v8 = +[UMUserPersonaAttributes personaAttributesForPersonaUniqueString:v7];

    id v9 = SYDGetConnectionLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v10)
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Persona still exists for sync manager %@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      if (v10)
      {
        int v11 = 138412290;
        id v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Persona no longer exists for sync manager %@", (uint8_t *)&v11, 0xCu);
      }

      [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
    }
  }
  else
  {
    id v8 = SYDGetConnectionLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10002F444();
    }
  }
}

void sub_10001432C(id a1)
{
  id v1 = SYDGetMiscLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
    sub_10002F4E0();
  }
}

void sub_1000146C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_100014704(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_allSyncManagers");
  return _objc_release_x1();
}

void sub_100014804(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    [*(id *)(a1 + 32) sendAnalyticsEventForCurrentState];
  }
  else if (!state)
  {
    id v5 = SYDGetAnalyticsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10002F588();
    }

    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    xpc_object_t v7 = xpc_activity_copy_criteria(v3);
    id v8 = v7;
    if (!v7 || !xpc_equal(v7, v6))
    {
      id v9 = SYDGetAnalyticsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_10002F554();
      }

      xpc_activity_set_criteria(v3, v6);
    }
  }
}

void sub_100014F94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t sub_100014FEC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_queue_allSyncManagers");
  return _objc_release_x1();
}

void sub_1000150EC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_allSyncManagers");
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  id v3 = v1;
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v1);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "hasPendingChangesToUpload", (void)v8))
        {

          xpc_object_t v7 = SYDGetMiscLog();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
            sub_10002F624();
          }

          id v3 = +[UMUserSyncTask taskWithName:@"KVSPendingChanges" reason:@"Saving pending records"];
          [v3 begin];
          goto LABEL_13;
        }
      }
      id v4 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
    id v3 = v1;
  }
LABEL_13:
}

void sub_1000152D0(uint64_t a1)
{
  id v2 = SYDGetMiscLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10002F658();
  }

  id v13 = +[UMUserSyncTask taskWithName:@"KVSUpload" reason:@"Saving pending records"];
  [v13 begin];
  id v3 = dispatch_group_create();
  uint64_t v14 = a1;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "_queue_allSyncManagers");
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      long long v8 = 0;
      do
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v8);
        long long v10 = SYDGetMiscLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          long long v24 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "About to upload pending changes in sync bubble for %@", buf, 0xCu);
        }

        dispatch_group_enter(v3);
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100015598;
        v17[3] = &unk_100050C28;
        v17[4] = v9;
        long long v18 = v3;
        [v9 savePendingChangesToCloudForAllStoresWithCompletionHandler:v17];

        long long v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }
  long long v11 = [*(id *)(v14 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015624;
  block[3] = &unk_100050A50;
  id v16 = v13;
  id v12 = v13;
  dispatch_group_notify(v3, v11, block);
}

void sub_100015598(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SYDGetMiscLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10002F6F4();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    sub_10002F68C();
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

id sub_100015624(uint64_t a1)
{
  id v2 = SYDGetMiscLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10002F764();
  }

  return [*(id *)(a1 + 32) end];
}

void sub_100016E74(id a1)
{
  id v1 = (void *)qword_10005BAE8;
  qword_10005BAE8 = (uint64_t)&off_100053C60;
}

void sub_100016F6C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000170B0(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  id v3 = +[NSString stringWithFormat:@"KVS: %@", v2];
  [*(id *)(a1 + 48) showNotificationWithTitle:v3 body:*(void *)(a1 + 40) threadIdentifier:v2];
}

void sub_100017370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001738C(id a1, NSError *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = SYDGetMiscLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100030324((uint64_t)v2, v3);
    }
  }
}

void sub_100017480(uint64_t a1)
{
  id v2 = SYDGetMiscLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10003039C(v2);
  }

  id v3 = [*(id *)(a1 + 32) userNotificationCenter];
  [v3 requestAuthorizationWithOptions:4 completionHandler:&stru_100050D10];
}

void sub_1000174EC(id a1, BOOL a2, NSError *a3)
{
  id v4 = a3;
  id v5 = SYDGetMiscLog();
  id v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10003045C((uint64_t)v4, v6);
    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    sub_1000303E0(a2, v6);
  }
}

void sub_1000175C0(id a1)
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  id v1 = (void *)qword_10005BB38;
  uint64_t v9 = qword_10005BB38;
  if (!qword_10005BB38)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    _OWORD v5[2] = sub_1000179D0;
    v5[3] = &unk_100050D98;
    v5[4] = &v6;
    sub_1000179D0((uint64_t)v5);
    id v1 = (void *)v7[3];
  }
  id v2 = v1;
  _Block_object_dispose(&v6, 8);
  id v3 = [[v2 alloc] initWithBundleIdentifier:@"com.apple.Preferences"];
  id v4 = (void *)qword_10005BB00;
  qword_10005BB00 = (uint64_t)v3;
}

void sub_10001769C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017754(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.kvs.user-notifications", v3);
  id v2 = (void *)qword_10005BB10;
  qword_10005BB10 = (uint64_t)v1;
}

Class sub_1000177B8(uint64_t a1)
{
  sub_100017810();
  Class result = objc_getClass("UNMutableNotificationContent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_1000304D4();
  }
  qword_10005BB20 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100017810()
{
  v0[0] = 0;
  if (!qword_10005BB28)
  {
    v0[1] = _NSConcreteStackBlock;
    v0[2] = (void *)3221225472;
    v0[3] = sub_100017904;
    v0[4] = &unk_100050D30;
    v0[5] = v0;
    long long v1 = off_100050DB8;
    uint64_t v2 = 0;
    qword_10005BB28 = _sl_dlopen();
  }
  if (!qword_10005BB28) {
    sub_100030550(v0);
  }
  if (v0[0]) {
    free(v0[0]);
  }
}

uint64_t sub_100017904()
{
  uint64_t result = _sl_dlopen();
  qword_10005BB28 = result;
  return result;
}

Class sub_100017978(uint64_t a1)
{
  sub_100017810();
  Class result = objc_getClass("UNNotificationRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_1000305D0();
  }
  qword_10005BB30 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_1000179D0(uint64_t a1)
{
  sub_100017810();
  Class result = objc_getClass("UNUserNotificationCenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10003064C();
  }
  qword_10005BB38 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

CFDictionaryRef sub_100017A28(const __CFDictionary *result, void *a2, const void **a3)
{
  if (result)
  {
    CFDictionaryRef v5 = result;
    CFTypeID v6 = CFGetTypeID(result);
    if (v6 != CFDictionaryGetTypeID()) {
      return 0;
    }
    Value = CFDictionaryGetValue(v5, @"timestamp");
    uint64_t v8 = CFDictionaryGetValue(v5, @"value");
    Class result = 0;
    if (!v8 || !Value) {
      return result;
    }
    CFTypeID v9 = CFGetTypeID(Value);
    if (v9 != CFNumberGetTypeID() || !CFNumberGetValue((CFNumberRef)Value, kCFNumberLongLongType, a2) || !*a2) {
      return 0;
    }
    if (a3) {
      *a3 = CFDictionaryGetValue(v5, @"remotevalue");
    }
    return (const __CFDictionary *)v8;
  }
  return result;
}

CFDictionaryRef sub_100017B08(const __CFDictionary *a1, void *a2)
{
  return sub_100017A28(a1, a2, 0);
}

void sub_100017B30(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  CFTypeID v6 = sub_1000084BC(a3);
  id v7 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v16 = v6;
  id v8 = [v6 code];
  if (v7 == (id)1040)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v8;
    uint64_t v9 = [v16 localizedDescription];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else if (v7 != v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1234;
    id v12 = [*(id *)(a1 + 32) description];
    uint64_t v13 = +[NSString stringWithFormat:@"Failed to sync with CloudKit (%@)", v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *a4 = 1;
  }
}

BOOL sub_100017C38(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 domain];
  unsigned int v3 = [v2 isEqual:NSCocoaErrorDomain];

  if (v3) {
    BOOL v4 = (((unint64_t)[v1 code] - 4) & 0xFFFFFFFFFFFFFEFFLL) == 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

void sub_100017CB0(id a1)
{
  qword_10005BB40 = objc_opt_new();
  _objc_release_x1();
}

id sub_100017CEC(void *a1)
{
  if (sub_10000AD74())
  {
    uint64_t v2 = sub_10000E25C(a1);
  }
  else
  {
    uid_t v3 = getuid();
    BOOL v4 = getpwuid(v3);
    if (!v4) {
      goto LABEL_5;
    }
    CFDictionaryRef v5 = +[NSString stringWithUTF8String:v4->pw_dir];
    CFTypeID v6 = +[NSURL fileURLWithPath:v5];
    id v7 = [v6 URLByAppendingPathComponent:@"Library" isDirectory:1];

    if (!v7)
    {
LABEL_5:
      id v8 = SYDGetMiscLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_1000309FC();
      }

      uint64_t v9 = +[NSFileManager defaultManager];
      id v15 = 0;
      id v7 = [v9 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:1 error:&v15];
      id v10 = v15;

      if (v10)
      {
        long long v11 = SYDGetMiscLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          sub_100030994();
        }
      }
      if (!v7) {
        +[NSException raise:NSGenericException format:@"Could not find ~/Library directory"];
      }
    }
    id v12 = [v7 URLByAppendingPathComponent:@"SyncedPreferences" isDirectory:1];

    uint64_t v2 = [v12 URLByAppendingPathComponent:@"com.apple.kvs" isDirectory:1];

    if (a1) {
      *a1 = 0;
    }
    uint64_t v13 = SYDGetMiscLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10003092C();
    }
  }
  return v2;
}

id sub_100017EEC(void *a1)
{
  id v1 = sub_10000E25C(a1);
  uint64_t v2 = [v1 URLByAppendingPathComponent:@".container-migration-complete"];

  return v2;
}

uint64_t sub_100017F40(void *a1)
{
  uint64_t v2 = SYDGetMiscLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100030DA4();
  }

  if (!sub_10000AD74())
  {
    os_unfair_lock_lock(&stru_10005BB54);
    uint64_t v63 = 0;
    v64 = &v63;
    uint64_t v65 = 0x3032000000;
    v66 = sub_100010EE4;
    v67 = sub_100010EA4;
    id v68 = 0;
    id obj = 0;
    CFDictionaryRef v5 = sub_100017EEC(&obj);
    objc_storeStrong(&v68, obj);
    id v7 = (id *)(v64 + 5);
    CFTypeID v6 = (void *)v64[5];
    if (v6)
    {
      if (a1) {
        *a1 = v6;
      }
      id v8 = SYDGetMiscLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100030D3C();
      }

      os_unfair_lock_unlock(&stru_10005BB54);
LABEL_15:
      uint64_t v4 = 0;
LABEL_77:

      _Block_object_dispose(&v63, 8);
      return v4;
    }
    id v61 = 0;
    unsigned int v9 = [v5 checkResourceIsReachableAndReturnError:&v61];
    objc_storeStrong(v7, v61);
    if (v9)
    {
      id v10 = SYDGetMiscLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_100030B00();
      }
      uint64_t v4 = 1;
      goto LABEL_69;
    }
    long long v11 = v64;
    id v12 = (void *)v64[5];
    if (v12)
    {
      if (!sub_100017C38(v12))
      {
        id v10 = SYDGetMiscLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_100030CD4();
        }
        uint64_t v4 = 0;
        goto LABEL_69;
      }
      long long v11 = v64;
      uint64_t v13 = (void *)v64[5];
    }
    else
    {
      uint64_t v13 = 0;
    }
    v11[5] = 0;

    uint64_t v14 = (id *)(v64 + 5);
    id v60 = (id)v64[5];
    id v10 = sub_100017CEC(&v60);
    objc_storeStrong(v14, v60);
    id v16 = (id *)(v64 + 5);
    id v15 = (void *)v64[5];
    if (v15)
    {
      if (a1) {
        *a1 = v15;
      }
      long long v17 = SYDGetMiscLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_100030C6C();
      }

      os_unfair_lock_unlock(&stru_10005BB54);
      goto LABEL_15;
    }
    id v59 = 0;
    unsigned int v50 = sub_10000E25C(&v59);
    objc_storeStrong(v16, v59);
    long long v18 = (void *)v64[5];
    if (v18)
    {
      if (a1) {
        *a1 = v18;
      }
      long long v19 = SYDGetMiscLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100030C04();
      }

      os_unfair_lock_unlock(&stru_10005BB54);
      goto LABEL_15;
    }
    long long v20 = SYDGetMiscLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v70 = v50;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Migrating to daemon container %@", buf, 0xCu);
    }

    long long v21 = +[NSFileManager defaultManager];
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100018868;
    v58[3] = &unk_100050E20;
    v58[4] = &v63;
    __int16 v46 = [v21 enumeratorAtURL:v10 includingPropertiesForKeys:0 options:5 errorHandler:v58];
    NSFileAttributeKey v76 = NSFileProtectionKey;
    NSFileProtectionType v77 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v77 forKeys:&v76 count:1];
    long long v23 = (id *)(v64 + 5);
    id v57 = (id)v64[5];
    unsigned __int8 v24 = [v21 createDirectoryAtURL:v50 withIntermediateDirectories:1 attributes:v22 error:&v57];
    id v45 = (void *)v22;
    v49 = v21;
    objc_storeStrong(v23, v57);
    if (v24)
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v25 = v46;
      id v26 = [v25 countByEnumeratingWithState:&v53 objects:v75 count:16];
      if (v26)
      {
        uint64_t v48 = *(void *)v54;
        uint64_t v47 = v25;
        while (2)
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v54 != v48) {
              objc_enumerationMutation(v47);
            }
            long long v28 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            long long v29 = [v28 lastPathComponent];
            char v30 = [v50 URLByAppendingPathComponent:v29];

            uint64_t v31 = SYDGetMiscLog();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v70 = v28;
              __int16 v71 = 2112;
              v72 = v30;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Will migrate item to data vault. oldURL=%@ newURL=%@", buf, 0x16u);
            }

            __int16 v32 = (id *)(v64 + 5);
            id v52 = (id)v64[5];
            unsigned __int8 v33 = [v49 moveItemAtURL:v28 toURL:v30 error:&v52];
            objc_storeStrong(v32, v52);
            if ((v33 & 1) == 0)
            {
              long long v34 = [(id)v64[5] domain];
              if (![v34 isEqual:NSCocoaErrorDomain])
              {

LABEL_64:
                long long v39 = SYDGetMiscLog();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v44 = v64[5];
                  *(_DWORD *)buf = 138412802;
                  v70 = v28;
                  __int16 v71 = 2112;
                  v72 = v30;
                  __int16 v73 = 2112;
                  uint64_t v74 = v44;
                  _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Failed to move file to daemon container oldURL=%@ newURL=%@: %@", buf, 0x20u);
                }

                uint64_t v4 = 0;
                long long v38 = v47;
                goto LABEL_67;
              }
              BOOL v35 = [(id)v64[5] code] == (id)516;

              if (!v35) {
                goto LABEL_64;
              }
              id v36 = SYDGetMiscLog();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                v70 = v28;
                __int16 v71 = 2112;
                v72 = v30;
                _os_log_fault_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_FAULT, "File was already migrated to new directory: oldURL=%@ newURL=%@", buf, 0x16u);
              }

              long long v37 = (void *)v64[5];
              v64[5] = 0;
            }
          }
          long long v25 = v47;
          id v26 = [v47 countByEnumeratingWithState:&v53 objects:v75 count:16];
          if (v26) {
            continue;
          }
          break;
        }
      }

      if (v64[5])
      {
        uint64_t v4 = 0;
LABEL_68:

LABEL_69:
        if (a1) {
          *a1 = (id) v64[5];
        }
        if (v64[5])
        {
          long long v40 = SYDGetMiscLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
            sub_100030A98();
          }
        }
        else
        {
          long long v40 = SYDGetMiscLog();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
            sub_100030A64();
          }
        }

        os_unfair_lock_unlock(&stru_10005BB54);
        goto LABEL_77;
      }
      long long v38 = [@"Mischief Managed" dataUsingEncoding:4];
      id v42 = (id *)(v64 + 5);
      id v51 = (id)v64[5];
      uint64_t v4 = (uint64_t)[v38 writeToURL:v5 options:0 error:&v51];
      objc_storeStrong(v42, v51);
      if ((v4 & 1) == 0)
      {
        uint64_t v43 = SYDGetMiscLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
          sub_100030B34();
        }
      }
    }
    else
    {
      long long v38 = SYDGetMiscLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        sub_100030B9C();
      }
      uint64_t v4 = 0;
    }
LABEL_67:

    goto LABEL_68;
  }
  uid_t v3 = SYDGetMiscLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100030A30();
  }

  if (a1) {
    *a1 = 0;
  }
  return 1;
}

void sub_1000187E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

BOOL sub_100018868(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = sub_100017C38(v6);
  id v8 = SYDGetMiscLog();
  unsigned int v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "File not found enumerating old directory with URL %@: %@", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100030DD8();
    }

    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    id v11 = v6;
    unsigned int v9 = *(NSObject **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }

  return v7;
}

id sub_100018990(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  BOOL v7 = sub_10000E25C(a3);
  id v8 = v7;
  if (v6)
  {
    unsigned int v9 = [v7 URLByAppendingPathComponent:@"TestServers" isDirectory:1];

    uint64_t v10 = [v6 testServerName];
    id v11 = [v9 URLByAppendingPathComponent:v10 isDirectory:1];

    id v12 = [v6 testDeviceID];
    id v8 = [v11 URLByAppendingPathComponent:v12];
  }
  int v13 = sub_100018AAC(v5);
  id v14 = [v8 URLByAppendingPathComponent:v13];

  return v14;
}

id sub_100018AAC(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 containerIdentifier];
  [v1 environment];

  uid_t v3 = CKContainerEnvironmentString();
  uint64_t v4 = +[NSString stringWithFormat:@"%@-%@", v2, v3];

  id v5 = [v4 stringByAppendingPathExtension:@"sqlite"];

  return v5;
}

id sub_100018B68(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = sub_100017CEC(a2);
  id v5 = sub_100018AAC(v3);

  id v6 = [v4 URLByAppendingPathComponent:v5];

  return v6;
}

id sub_100018BEC(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v5 = +[NSAssertionHandler currentHandler];
    id v6 = +[NSString stringWithUTF8String:"CKRecordID *SYDSyncAnchorRecordID(NSString *__strong)"];
    [v5 handleFailureInFunction:v6 file:@"SYDUtilities.m" lineNumber:740 description:@"Must specify a store identifier to get a sync anchor record ID"];
  }
  uint64_t v2 = sub_100006A2C(v1);
  id v3 = [objc_alloc((Class)CKRecordID) initWithRecordName:@"syncAnchor" zoneID:v2];

  return v3;
}

void sub_100018CC4(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  id v5 = SYDGetMiscLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100031048();
  }

  id v6 = +[UMUserPersona currentPersona];
  id v18 = 0;
  id v7 = [v6 copyCurrentPersonaContextWithError:&v18];
  id v8 = v18;

  if (v8)
  {
    unsigned int v9 = SYDGetMiscLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100030FE0();
    }
  }
  uint64_t v10 = +[UMUserPersona currentPersona];
  id v11 = [v10 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

  id v12 = SYDGetMiscLog();
  int v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100030F78();
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    sub_100030F10();
  }

  v4[2](v4);
  id v14 = +[UMUserPersona currentPersona];
  __int16 v15 = [v14 restorePersonaWithSavedPersonaContext:v7];

  id v16 = SYDGetMiscLog();
  long long v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100030EA8();
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    sub_100030E40();
  }
}

id sub_100018EB8()
{
  if (qword_10005BB60 != -1) {
    dispatch_once(&qword_10005BB60, &stru_100050E40);
  }
  id v0 = (void *)qword_10005BB58;
  return v0;
}

void sub_100018F0C(id a1)
{
  id v1 = objc_opt_new();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [&off_100053C78 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(&off_100053C78);
        }
        id v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        [v6 integerValue];
        [v1 addObject:v6];
      }
      id v3 = [&off_100053C78 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }
  id v7 = [v1 copy];
  id v8 = (void *)qword_10005BB58;
  qword_10005BB58 = (uint64_t)v7;
}

id sub_10001903C()
{
  if (qword_10005BB70 != -1) {
    dispatch_once(&qword_10005BB70, &stru_100050E60);
  }
  id v0 = (void *)qword_10005BB68;
  return v0;
}

void sub_100019090(id a1)
{
  qword_10005BB68 = +[NSSet setWithObjects:@"com.apple.security.cloudkeychainproxy3", @"com.apple.sbd3", @"com.apple.mail.recents", @"com.apple.messages.recents", 0];
  _objc_release_x1();
}

void sub_100019100(id a1)
{
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  qword_10005BB78 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  _objc_release_x1();
}

void sub_1000191EC(id a1)
{
  qword_10005BB88 = objc_alloc_init(SYDTCCHelper);
  _objc_release_x1();
}

void sub_1000193E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100019400(uint64_t a1)
{
  uint64_t v2 = SYDGetTCCLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100031120(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  long long v9 = [*(id *)(a1 + 40) cachedDisabledStoreIdentifiers];

  if (!v9)
  {
    long long v10 = [*(id *)(a1 + 40) findDisabledStoreIdentifiers];
    [*(id *)(a1 + 40) setCachedDisabledStoreIdentifiers:v10];

    long long v11 = SYDGetTCCLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = [*(id *)(a1 + 40) cachedDisabledStoreIdentifiers];
      int v22 = 138412290;
      long long v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Caching disabled store identifiers: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  int v13 = [*(id *)(a1 + 40) cachedDisabledStoreIdentifiers];
  unsigned int v14 = [v13 containsObject:*(void *)(a1 + 32)];

  if (v14)
  {
    __int16 v15 = SYDGetTCCLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1000310B0(a1 + 32, v15, v16, v17, v18, v19, v20, v21);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void sub_100019A84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100019AAC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = SYDGetTCCLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_100031264();
    }

    [WeakRetained setCachedDisabledStoreIdentifiers:0];
  }
}

void sub_10001A1DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001A594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_10001A5B8(uint64_t a1)
{
  uint64_t v2 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100031804(a1);
  }

  uint64_t v3 = [*(id *)(a1 + 56) coreDataStore];
  uint64_t v4 = a1 + 64;
  uint64_t v6 = (uint64_t *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v8 = (void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v9 + 40);
  long long v10 = [v3 keyValueForKey:v5 inStoreWithIdentifier:v7 createIfNecessary:1 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);

  long long v11 = [v10 value];
  long long v12 = v11;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    int v13 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10003179C();
    }
LABEL_6:

    goto LABEL_7;
  }
  if (!v10)
  {
    int v13 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1000314AC();
    }
    goto LABEL_6;
  }
  if (v11 && *(void *)(a1 + 32) && objc_msgSend(v11, "isEqual:"))
  {
    int v13 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10003171C();
    }
    goto LABEL_6;
  }
  if (!*(void *)(a1 + 32))
  {
    int v13 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_10003151C(v6, v13);
    }
    goto LABEL_6;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  uint64_t v14 = *(void *)(a1 + 32);
  __int16 v15 = +[NSDate date];
  [v10 setValue:v14 withModificationDate:v15];

  uint64_t v16 = [v10 recordName];

  if (v16) {
    goto LABEL_16;
  }
  id v18 = [*(id *)(a1 + 56) newRecordNameForKey:*(void *)(a1 + 40)];
  [v10 setRecordName:v18];

  uint64_t v19 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    id v45 = [v10 recordName];
    uint64_t v46 = *v6;
    uint64_t v47 = *v8;
    *(_DWORD *)buf = 138412803;
    long long v54 = v45;
    __int16 v55 = 2113;
    uint64_t v56 = v46;
    __int16 v57 = 2112;
    uint64_t v58 = v47;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Assigned new record name (%@) for (%{private}@) in (%@)", buf, 0x20u);
  }
  uint64_t v20 = [*(id *)(a1 + 56) coreDataStore];
  uint64_t v21 = *(void *)(a1 + 48);
  uint64_t v22 = *(void *)(*(void *)(a1 + 64) + 8);
  id v49 = *(id *)(v22 + 40);
  id v23 = [v20 numberOfKeyValuesInStoreWithIdentifier:v21 error:&v49];
  objc_storeStrong((id *)(v22 + 40), v49);

  uint64_t v24 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  BOOL v17 = v24 == 0;
  if (v24)
  {
    long long v25 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_1000316E8();
    }

    uint64_t v26 = *(void *)(*(void *)v4 + 8);
    long long v27 = *(NSObject **)(v26 + 40);
    *(void *)(v26 + 40) = 0;
  }
  else
  {
    if (v23)
    {
LABEL_16:
      BOOL v17 = 0;
      goto LABEL_28;
    }
    long long v27 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
      sub_10003167C();
    }
  }

LABEL_28:
  long long v28 = [*(id *)(a1 + 56) coreDataStore];
  uint64_t v29 = *(void *)(a1 + 48);
  uint64_t v30 = *(unsigned __int8 *)(a1 + 80);
  uint64_t v31 = *(unsigned __int8 *)(a1 + 81);
  uint64_t v32 = *(void *)(*(void *)(a1 + 64) + 8);
  id v48 = *(id *)(v32 + 40);
  unsigned __int8 v33 = [v28 saveKeyValue:v10 inStoreWithIdentifier:v29 excludeFromChangeTracking:v30 enforceQuota:v31 error:&v48];
  objc_storeStrong((id *)(v32 + 40), v48);

  if (v33)
  {
    if (([*(id *)(a1 + 56) shouldSyncStoreWithIdentifier:*(void *)(a1 + 48)] & 1) == 0)
    {
      int v13 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1000315E0();
      }
      goto LABEL_6;
    }
    long long v34 = [v10 recordID];
    if ([*(id *)(a1 + 56) alwaysSaveRecordZones])
    {
      BOOL v35 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        sub_1000315AC();
      }

      if (([*(id *)(a1 + 56) alwaysSaveRecordZones] & 1) == 0) {
        goto LABEL_45;
      }
    }
    else if (!v17)
    {
LABEL_45:
      uint64_t v43 = *(void **)(a1 + 56);
      id v51 = v34;
      uint64_t v44 = +[NSArray arrayWithObjects:&v51 count:1];
      [v43 addKeyValueRecordIDsToSave:v44 recordIDsToDelete:0 storeIdentifier:*(void *)(a1 + 48)];

      +[SYDUserNotifications showUserNotificationIfEnabledForStoreIdentifier:*(void *)(a1 + 48), @"Set %@ = %@", *(void *)(a1 + 40), *(void *)(a1 + 32) format];
      goto LABEL_7;
    }
    id v37 = objc_alloc((Class)CKRecordZone);
    long long v38 = [v34 zoneID];
    id v39 = [v37 initWithZoneID:v38];

    long long v40 = *(void **)(a1 + 56);
    id v41 = [objc_alloc((Class)CKSyncEnginePendingZoneSave) initWithZone:v39];
    id v52 = v41;
    id v42 = +[NSArray arrayWithObjects:&v52 count:1];
    [v40 addPendingDatabaseChanges:v42 storeIdentifier:*(void *)(a1 + 48)];

    goto LABEL_45;
  }
  id v36 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
    sub_100031614();
  }

  +[SYDUserNotifications showUserNotificationIfEnabledForStoreIdentifier:*v8, @"Failed to set value: %@", *(void *)(*(void *)(*(void *)v4 + 8) + 40) format];
LABEL_7:
}

void sub_10001AD68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10001AD8C(uint64_t a1)
{
  uint64_t v2 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000319F4();
  }

  uint64_t v3 = [*(id *)(a1 + 48) coreDataStore];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v3 keyValueForKey:v4 inStoreWithIdentifier:v5 createIfNecessary:0 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v8 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003198C();
    }
  }
  else if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    uint64_t v9 = [v7 recordName];

    if (!v9)
    {
      if ([*(id *)(a1 + 48) useUUIDRecordNames]) {
        +[NSException raise:NSInternalInconsistencyException format:@"Trying to delete a key-value that never had a record name in a store that uses UUID record names"];
      }
      id v10 = [*(id *)(a1 + 48) newRecordNameForKey:*(void *)(a1 + 32)];
      [v7 setRecordName:v10];
    }
    unsigned __int8 v11 = [*(id *)(a1 + 48) shouldSyncStoreWithIdentifier:*(void *)(a1 + 40)];
    long long v12 = *(void **)(a1 + 48);
    if (v11)
    {
      uint64_t v13 = [v7 recordID];
      uint64_t v30 = v13;
      uint64_t v14 = +[NSArray arrayWithObjects:&v30 count:1];
      [v12 addKeyValueRecordIDsToSave:0 recordIDsToDelete:v14 storeIdentifier:*(void *)(a1 + 40)];

      [v7 markForDeletion];
      __int16 v15 = [*(id *)(a1 + 48) coreDataStore];
      uint64_t v16 = *(void *)(a1 + 40);
      uint64_t v17 = *(unsigned __int8 *)(a1 + 72);
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
      id v25 = *(id *)(v18 + 40);
      LOBYTE(v13) = [v15 saveKeyValue:v7 inStoreWithIdentifier:v16 excludeFromChangeTracking:v17 enforceQuota:0 error:&v25];
      objc_storeStrong((id *)(v18 + 40), v25);

      if (v13) {
        goto LABEL_7;
      }
      uint64_t v8 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000318F0();
      }
    }
    else
    {
      uint64_t v20 = [*(id *)(a1 + 48) coreDataStore];
      uint64_t v21 = *(void *)(a1 + 32);
      uint64_t v22 = *(void *)(a1 + 40);
      uint64_t v23 = *(unsigned __int8 *)(a1 + 72);
      uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
      id v26 = *(id *)(v24 + 40);
      [v20 removeKeyValueForKey:v21 inStoreWithIdentifier:v22 excludeFromChangeTracking:v23 error:&v26];
      objc_storeStrong((id *)(v24 + 40), v26);

      uint64_t v8 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_100031958();
      }
    }
  }
  else
  {
    uint64_t v8 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138477827;
      uint64_t v29 = v19;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Trying to remove object for a key that doesn't exist (%{private}@)", buf, 0xCu);
    }
  }

LABEL_7:
}

void sub_10001B1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001B1F8(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  uint64_t v5 = *(void **)(a1 + 32);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001B2C4;
  v8[3] = &unk_100051080;
  long long v7 = *(_OWORD *)(a1 + 40);
  id v6 = (id)v7;
  long long v9 = v7;
  [v5 savePendingChangesToCloudForAllStoresWithCompletionHandler:v8];
}

void sub_10001B2C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v7 = *(void **)(v4 + 40);
  uint64_t v5 = (id *)(v4 + 40);
  id v6 = v7;
  id v9 = v3;
  if (v7) {
    id v3 = v6;
  }
  objc_storeStrong(v5, v3);
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, void))(v8 + 16))(v8, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
}

uint64_t sub_10001B354(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_10001B368(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001B388(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id sub_10001B39C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id result = objc_msgSend(*(id *)(a1 + 40), "shouldIgnoreFetchError:");
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

id sub_10001B3E0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "shouldRetryAfterModifyError:");
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

void sub_10001B564(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    long long v7 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100031C74();
    }

    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      (*(void (**)(uint64_t, id))(v8 + 16))(v8, v6);
    }
  }
  else
  {
    uint64_t v24 = a1;
    id v9 = +[NSMutableArray array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v25 = v5;
    id v10 = v5;
    id v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v29;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          __int16 v15 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v16 = [v15 zoneID];
          uint64_t v17 = [v16 zoneName];
          unsigned __int8 v18 = [v17 isEqualToString:@"metadata_zone"];

          if ((v18 & 1) == 0)
          {
            uint64_t v19 = [v15 zoneID];
            [v9 addObject:v19];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v12);
    }

    if ([v9 count])
    {
      id v20 = [objc_alloc((Class)CKModifyRecordZonesOperation) initWithRecordZonesToSave:0 recordZoneIDsToDelete:v9];
      [v20 setMarkZonesAsUserPurged:1];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10001B830;
      v26[3] = &unk_100051210;
      id v27 = *(id *)(v24 + 40);
      [v20 setModifyRecordZonesCompletionBlock:v26];
      uint64_t v21 = [*(id *)(v24 + 32) engine];
      uint64_t v22 = [v21 database];
      [v22 addOperation:v20];

      id v6 = 0;
    }
    else
    {
      id v6 = 0;
      uint64_t v23 = *(void *)(v24 + 40);
      if (v23) {
        (*(void (**)(uint64_t, void))(v23 + 16))(v23, 0);
      }
    }

    id v5 = v25;
  }
}

void sub_10001B830(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = SYDGetCloudKitLog();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100031CDC();
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Finished deleting data from cloud", v13, 2u);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, v9);
  }
}

void sub_10001BC04(uint64_t a1)
{
  uint64_t v2 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100031DAC();
  }

  id v3 = [*(id *)(a1 + 32) coreDataStore];
  id v15 = 0;
  uint64_t v4 = [v3 allStoreIdentifiersWithError:&v15];
  id v5 = v15;

  if (v5)
  {
    id v6 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100031D44();
    }
  }
  else
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(a1 + 32), "markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v10), (void)v11);
          id v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

id sub_10001C79C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resetSyncEngine");
}

id sub_10001C858(uint64_t a1)
{
  uint64_t v2 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100031FE8();
  }

  [*(id *)(a1 + 40) setContainer:*(void *)(a1 + 32)];
  return objc_msgSend(*(id *)(a1 + 40), "_queue_resetSyncEngine");
}

id sub_10001C974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) didFailToDeleteRecordWithID:a2 error:a3];
}

id sub_10001CB28(uint64_t a1)
{
  uint64_t v2 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Failed to fetch changes for RecordZoneID %@: %@", (uint8_t *)&v6, 0x16u);
  }

  id result = [*(id *)(a1 + 48) isIdentityLostError:*(void *)(a1 + 40)];
  if (result) {
    return [*(id *)(a1 + 48) _markZoneForDeletionOnManateeFailureForRecordZoneID:*(void *)(a1 + 32)];
  }
  return result;
}

void sub_10001CD24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001CD40(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id result = objc_msgSend(*(id *)(a1 + 32), "isIdentityLostError:");
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

id sub_10001CEC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v10 = 0;
  uint64_t v5 = [v4 recordToSaveForRecordID:v3 error:&v10];
  unint64_t v6 = (unint64_t)v10;
  if (!(v5 | v6))
  {
    uint64_t v7 = *(void **)(a1 + 40);
    id v8 = [objc_alloc((Class)CKSyncEnginePendingRecordZoneChange) initWithRecordID:v3 type:0];
    [v7 addObject:v8];
  }
  return (id)v5;
}

void sub_10001D388(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) recordType];
  if ([v3 isEqual:@"KVSSyncAnchorRecord"])
  {
    uint64_t v4 = [*v2 recordID];
    uint64_t v5 = [v4 recordName];
    unsigned int v6 = [v5 isEqual:@"syncAnchor"];

    if (v6)
    {
      uint64_t v7 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_100032308(v2);
      }

      [*(id *)(a1 + 40) saveSyncAnchorSystemFieldsRecord:*(void *)(a1 + 32)];
      return;
    }
  }
  else
  {
  }
  id v8 = [*v2 recordType];
  if ([v8 isEqual:@"KVSRecord"])
  {
  }
  else
  {
    uint64_t v9 = [*v2 recordType];
    unsigned int v10 = [v9 isEqualToString:@"EncryptedKeyValue"];

    if (!v10) {
      return;
    }
  }
  uint64_t v12 = *(void *)(a1 + 32);
  long long v11 = *(void **)(a1 + 40);
  _[v11 didSaveKeyValueRecord:v12];
}

void sub_10001D8D0(id *a1)
{
  uint64_t v2 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = objc_msgSend(a1[4], "syd_shortDescription");
    id v4 = a1[5];
    int v17 = 138412546;
    unsigned __int8 v18 = v3;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Failed to save record %@: %@", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v5 = [a1[4] recordType];
  if ([v5 isEqualToString:@"KVSRecord"])
  {

LABEL_6:
    [a1[6] failedToSaveKeyValueRecord:a1[4] error:a1[5]];
    return;
  }
  unsigned int v6 = [a1[4] recordType];
  unsigned int v7 = [v6 isEqualToString:@"EncryptedKeyValue"];

  if (v7) {
    goto LABEL_6;
  }
  id v8 = [a1[4] recordType];
  if (([v8 isEqualToString:@"KVSSyncAnchorRecord"] & 1) == 0)
  {
LABEL_16:

    return;
  }
  uint64_t v9 = [a1[4] recordID];
  unsigned int v10 = [v9 recordName];
  unsigned int v11 = [v10 isEqualToString:@"syncAnchor"];

  if (v11 && [a1[5] code] == (id)14)
  {
    uint64_t v12 = [a1[5] userInfo];
    id v8 = [v12 objectForKeyedSubscript:CKRecordChangedErrorServerRecordKey];

    if (v8)
    {
      [a1[6] saveSyncAnchorSystemFieldsRecord:v8];
      id v13 = a1[6];
      long long v14 = [a1[4] recordID];
      id v15 = [v14 zoneID];
      uint64_t v16 = [v15 zoneName];
      [v13 addSyncAnchorRecordIDToSaveIfNecessaryForStoreIdentifier:v16];
    }
    else
    {
      long long v14 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100032580();
      }
    }

    goto LABEL_16;
  }
}

void sub_10001EA34(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) recordName];
  unsigned int v4 = [v3 isEqualToString:@"syncAnchor"];

  if (!v4)
  {
    unsigned int v6 = [*(id *)(a1 + 32) zoneID];
    uint64_t v5 = [v6 zoneName];

    unsigned int v7 = [*(id *)(a1 + 40) coreDataStore];
    id v8 = [*(id *)(a1 + 32) recordName];
    id v21 = 0;
    uint64_t v9 = [v7 keyValueForRecordName:v8 inStoreWithIdentifier:v5 error:&v21];
    id v10 = v21;

    unsigned int v11 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v9 key];
      id v13 = objc_msgSend(*v2, "syd_shortDescription");
      *(_DWORD *)buf = 141558787;
      uint64_t v23 = 1752392040;
      __int16 v24 = 2113;
      id v25 = v12;
      __int16 v26 = 2112;
      id v27 = v5;
      __int16 v28 = 2112;
      long long v29 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Deleted keyValue record for key <(%{private, mask.hash}@)> in store <(%@)> %@", buf, 0x2Au);
    }
    if (v10)
    {
      long long v14 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100032C70();
      }
      goto LABEL_16;
    }
    if (v9)
    {
      id v15 = [v9 value];

      long long v14 = SYDGetCloudKitLog();
      BOOL v16 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
      if (!v15)
      {
        if (v16) {
          sub_100032C08();
        }

        int v17 = [*(id *)(a1 + 40) coreDataStore];
        unsigned __int8 v18 = [*(id *)(a1 + 32) recordName];
        id v20 = 0;
        unsigned __int8 v19 = [v17 removeKeyValueForRecordName:v18 inStoreWithIdentifier:v5 error:&v20];
        id v10 = v20;

        if (v19) {
          goto LABEL_17;
        }
        long long v14 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_100032BA0();
        }
LABEL_16:

LABEL_17:
        goto LABEL_18;
      }
      if (v16) {
        sub_100032C3C();
      }
    }
    else
    {
      long long v14 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "No key-value in database after deleting record from the cloud", buf, 2u);
      }
    }
    id v10 = 0;
    goto LABEL_16;
  }
  uint64_t v5 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100032B18(v2);
  }
LABEL_18:
}

void sub_10001EE2C(uint64_t a1)
{
  uint64_t v2 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100032CD8(a1);
  }
}

void sub_10001EF2C(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) recordType];
  if ([v3 isEqual:@"KVSSyncAnchorRecord"])
  {
    unsigned int v4 = [*v2 recordID];
    uint64_t v5 = [v4 recordName];
    unsigned int v6 = [v5 isEqual:@"syncAnchor"];

    if (v6)
    {
      unsigned int v7 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_100032D7C();
      }

      [*(id *)(a1 + 40) saveSyncAnchorSystemFieldsRecord:*(void *)(a1 + 32)];
      return;
    }
  }
  else
  {
  }
  id v8 = [*v2 recordType];
  if ([v8 isEqual:@"KVSRecord"])
  {
  }
  else
  {
    uint64_t v9 = [*v2 recordType];
    unsigned int v10 = [v9 isEqualToString:@"EncryptedKeyValue"];

    if (!v10) {
      return;
    }
  }
  unsigned int v11 = [*(id *)(a1 + 40) pendingFetchedRecords];
  [v11 addObject:*(void *)(a1 + 32)];

  uint64_t v12 = [*(id *)(a1 + 40) pendingFetchedRecords];
  id v13 = [v12 count];
  id v14 = [*(id *)(a1 + 40) maxPendingFetchedRecords];

  if (v13 >= v14)
  {
    id v15 = *(void **)(a1 + 40);
    [v15 processPendingFetchedRecordsWithReason:@"reached max pending records"];
  }
}

void sub_10001F3A4(uint64_t a1)
{
  uint64_t v2 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) count];
    *(_DWORD *)buf = 134217984;
    uint64_t v101 = (uint64_t)v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Processing %ld fetched records", buf, 0xCu);
  }

  v82 = objc_opt_new();
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  uint64_t v79 = a1;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v94 objects:v108 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v95;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v95 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v94 + 1) + 8 * i);
        unsigned int v10 = [v9 recordID];
        unsigned int v11 = [v10 zoneID];
        uint64_t v12 = [v11 zoneName];

        id v13 = +[SYDKeyValue keyFromKeyValueRecord:v9];
        id v14 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = objc_msgSend(v9, "syd_shortDescription");
          *(_DWORD *)buf = 138413059;
          uint64_t v101 = (uint64_t)v15;
          __int16 v102 = 2160;
          uint64_t v103 = 1752392040;
          __int16 v104 = 2113;
          uint64_t v105 = (uint64_t)v13;
          __int16 v106 = 2112;
          long long v107 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Record was fetched %@ for key <(%{private, mask.hash}@)> in store <(%@)>", buf, 0x2Au);
        }
        BOOL v16 = [[_TtC13syncdefaultsd8SYDKeyID alloc] initWithKey:v13 storeIdentifier:v12];
        [v82 addObject:v16];
      }
      id v6 = [v4 countByEnumeratingWithState:&v94 objects:v108 count:16];
    }
    while (v6);
  }

  uint64_t v17 = v79;
  unsigned __int8 v18 = [*(id *)(v79 + 40) coreDataStore];
  unsigned __int8 v19 = [v82 allObjects];
  id v93 = 0;
  id v20 = [v18 keyValuesForKeyIDs:v19 createIfNecessary:1 error:&v93];
  id v21 = v93;

  if (!v20 || v21)
  {
    uint64_t v47 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
      sub_100033058();
    }
  }
  else
  {
    id v22 = [v20 count];
    if (v22 != [v82 count])
    {
      uint64_t v23 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100033128();
      }
    }
    v78 = objc_opt_new();
    long long v89 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id obj = *(id *)(v79 + 32);
    __int16 v73 = v20;
    id v77 = [obj countByEnumeratingWithState:&v89 objects:v99 count:16];
    if (v77)
    {
      uint64_t v76 = *(void *)v90;
      do
      {
        for (j = 0; j != v77; j = (char *)j + 1)
        {
          if (*(void *)v90 != v76) {
            objc_enumerationMutation(obj);
          }
          id v25 = *(void **)(*((void *)&v89 + 1) + 8 * (void)j);
          __int16 v26 = [v25 recordID];
          id v27 = [v26 zoneID];
          __int16 v28 = [v27 zoneName];

          uint64_t v80 = +[SYDKeyValue keyFromKeyValueRecord:v25];
          long long v29 = [[_TtC13syncdefaultsd8SYDKeyID alloc] initWithKey:v80 storeIdentifier:v28];
          long long v30 = [v20 objectForKeyedSubscript:v29];
          if (!v30)
          {
            id v42 = +[NSAssertionHandler currentHandler];
            [v42 handleFailureInMethod:*(void *)(v17 + 56) object:*(void *)(v17 + 40) file:@"SYDSyncManager.m" lineNumber:1580 description:@"Trying to process a record without a SYDKeyValue"];
          }
          long long v31 = [v30 recordName];

          if (!v31)
          {
            uint64_t v32 = [v25 recordID];
            unsigned __int8 v33 = [v32 recordName];
            [v30 setRecordName:v33];
          }
          [*(id *)(v17 + 40) deduplicateRecordForKeyValue:v30 withNewlyFetchedRecord:v25];
          long long v34 = [v30 value];
          [v30 mergeDataFromRecord:v25];
          uint64_t v35 = [v30 value];
          id v36 = (void *)v35;
          if (v34 == (void *)v35 || (v34 != 0) != (v35 == 0) && [v34 isEqual:v35])
          {
            id v37 = SYDGetCloudKitLog();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              v72 = [(SYDKeyID *)v29 key];
              uint64_t v38 = [(SYDKeyID *)v29 storeIdentifier];
              *(_DWORD *)buf = 141558531;
              uint64_t v101 = 1752392040;
              __int16 v102 = 2113;
              uint64_t v103 = (uint64_t)v72;
              __int16 v104 = 2112;
              uint64_t v105 = v38;
              id v39 = (void *)v38;
              _os_log_debug_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "Value didn't change for key <(%{private, mask.hash}@)> in store <(%@)>", buf, 0x20u);

              uint64_t v17 = v79;
            }
          }
          else
          {
            id v37 = [v78 objectForKeyedSubscript:v28];
            if (!v37)
            {
              id v37 = objc_opt_new();
              [v78 setObject:v37 forKeyedSubscript:v28];
            }
            long long v40 = [(SYDKeyID *)v29 key];
            [v37 addObject:v40];

            id v41 = [(SYDKeyID *)v29 key];
            +[SYDUserNotifications showUserNotificationIfEnabledForStoreIdentifier:v28, @"Downloaded %@ = %@", v41, v36 format];

            uint64_t v17 = v79;
            id v20 = v73;
          }

          +[SYDKeyValue deleteFilesForAssetsInKeyValueRecord:v25];
        }
        id v77 = [obj countByEnumeratingWithState:&v89 objects:v99 count:16];
      }
      while (v77);
    }

    if ([v20 count])
    {
      uint64_t v43 = [*(id *)(v17 + 40) coreDataStore];
      uint64_t v44 = [v20 allValues];
      id v88 = 0;
      unsigned __int8 v45 = [v43 saveKeyValues:v44 excludeFromChangeTracking:0 enforceQuota:0 error:&v88];
      id v46 = v88;

      uint64_t v47 = v78;
      id obja = v46;
      if ((v45 & 1) == 0)
      {
        id v48 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
          sub_1000330C0();
        }
      }
    }
    else
    {
      id obja = 0;
      uint64_t v47 = v78;
    }
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v81 = *(id *)(v17 + 48);
    id v49 = [v81 countByEnumeratingWithState:&v84 objects:v98 count:16];
    if (v49)
    {
      id v50 = v49;
      uint64_t v51 = *(void *)v85;
      do
      {
        for (k = 0; k != v50; k = (char *)k + 1)
        {
          if (*(void *)v85 != v51) {
            objc_enumerationMutation(v81);
          }
          long long v53 = *(void **)(*((void *)&v84 + 1) + 8 * (void)k);
          long long v54 = [v53 zoneID];
          __int16 v55 = [v54 zoneName];

          uint64_t v56 = [v53 recordName];
          unsigned int v57 = [v56 hasPrefix:@"KeyValue:"];

          if (v57)
          {
            uint64_t v58 = [*(id *)(v17 + 40) coreDataStore];
            id v59 = [v53 recordName];
            id v60 = [v53 zoneID];
            id v61 = [v60 zoneName];
            v62 = [v58 keyValueForRecordName:v59 inStoreWithIdentifier:v61 error:0];

            uint64_t v47 = v78;
            [v62 key];
          }
          else
          {
            v62 = [v53 recordName];
            +[SYDKeyValue keyFromUnencryptedKeyValueRecordName:v62];
          uint64_t v63 = };

          v64 = SYDGetCloudKitLog();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
          {
            uint64_t v65 = objc_msgSend(v53, "syd_shortDescription");
            *(_DWORD *)buf = 141558787;
            uint64_t v101 = 1752392040;
            __int16 v102 = 2113;
            uint64_t v103 = (uint64_t)v63;
            __int16 v104 = 2112;
            uint64_t v105 = (uint64_t)v55;
            __int16 v106 = 2112;
            long long v107 = v65;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_INFO, "Record was deleted for key <(%{private, mask.hash}@)> in store <(%@)> %@", buf, 0x2Au);
          }
          uint64_t v17 = v79;
          v66 = [*(id *)(v79 + 40) coreDataStore];
          v67 = [v53 recordName];
          [v66 removeKeyValueForRecordName:v67 inStoreWithIdentifier:v55 error:0];

          if (v63)
          {
            id v68 = [v47 objectForKeyedSubscript:v55];
            v69 = v68;
            if (v68) {
              v70 = v68;
            }
            else {
              v70 = objc_opt_new();
            }
            __int16 v71 = v70;

            [v71 addObject:v63];
            [v47 setObject:v71 forKeyedSubscript:v55];
          }
          else
          {
            __int16 v71 = SYDGetCloudKitLog();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v101 = (uint64_t)v53;
              _os_log_error_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "Unable to find key to post notification for %@", buf, 0xCu);
            }
          }
        }
        id v50 = [v81 countByEnumeratingWithState:&v84 objects:v98 count:16];
      }
      while (v50);
    }

    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_10001FEC4;
    v83[3] = &unk_1000512B0;
    v83[4] = *(void *)(v17 + 40);
    [v47 enumerateKeysAndObjectsUsingBlock:v83];
    id v20 = v73;
    id v21 = obja;
  }
}

void sub_10001FEC4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = objc_msgSend(objc_alloc((Class)SYDStoreID), "initWithIdentifier:type:", v6, objc_msgSend(*(id *)(a1 + 32), "storeType"));

  id v8 = [*(id *)(a1 + 32) storeIdentifiersWithChangedValuesDuringFetchChanges];
  uint64_t v9 = [v7 identifier];
  [v8 addObject:v9];

  unsigned int v10 = [*(id *)(a1 + 32) personaUniqueString];
  [v7 setPersonaUniqueString:v10];

  unsigned int v11 = [*(id *)(a1 + 32) testConfiguration];
  [v7 setTestConfiguration:v11];

  v15[0] = @"changedKeys";
  uint64_t v12 = [v5 allObjects];

  v15[1] = @"storeID";
  v16[0] = v12;
  v16[1] = v7;
  id v13 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

  id v14 = +[NSNotificationCenter defaultCenter];
  [v14 postNotificationName:@"SYDSyncManagerNotificationValuesDidChange" object:*(void *)(a1 + 32) userInfo:v13];
}

void sub_100020738(id *a1)
{
  if (([a1[4] isEqual:@"KVSRecord"] & 1) != 0
    || [a1[4] isEqualToString:@"EncryptedKeyValue"])
  {
    uint64_t v2 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_100033470();
    }

    id v3 = [a1[6] pendingDeletedRecordIDs];
    [v3 addObject:a1[5]];
LABEL_6:

    return;
  }
  if ([a1[4] isEqual:@"KVSSyncAnchorRecord"])
  {
    id v4 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_1000334DC();
    }

    id v3 = [a1[6] coreDataStore];
    id v5 = [a1[5] zoneID];
    id v6 = [v5 zoneName];
    [v3 saveServerSyncAnchorSystemFieldsRecordData:0 forStoreWithIdentifier:v6 error:0];

    goto LABEL_6;
  }
}

void sub_100020910(uint64_t a1)
{
  [*(id *)(a1 + 32) processPendingFetchedRecordsWithReason:@"updated metadata"];
  uint64_t v2 = *(void *)(a1 + 40);
  id v8 = 0;
  id v3 = +[NSKeyedArchiver archivedDataWithRootObject:v2 requiringSecureCoding:1 error:&v8];
  id v4 = v8;
  id v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) coreDataStore];
    [v7 saveSyncEngineStateSerialization:v3 error:0];
  }
  else
  {
    id v7 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100033548();
    }
  }
}

void sub_100020A90(uint64_t a1)
{
  uint64_t v2 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000335B0();
  }

  id v3 = [objc_alloc((Class)CKRecordZone) initWithZoneID:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) engine];
  id v5 = [v4 state];
  id v6 = [objc_alloc((Class)CKSyncEnginePendingZoneSave) initWithZone:v3];
  id v10 = v6;
  id v7 = +[NSArray arrayWithObjects:&v10 count:1];
  [v5 addPendingDatabaseChanges:v7];

  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = [*(id *)(a1 + 32) zoneName];
  [v8 markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier:v9];
}

void sub_100020C80(uint64_t a1)
{
  uint64_t v2 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Zone was purged: %@", (uint8_t *)&v6, 0xCu);
  }

  id v4 = [*(id *)(a1 + 32) zoneName];
  id v5 = [*(id *)(a1 + 40) coreDataStore];
  [v5 deleteDataForStoreWithIdentifier:v4 error:0];
}

void sub_100021418(uint64_t a1)
{
  uint64_t v2 = SYDGetCloudKitLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000337EC();
  }

  uint64_t v3 = [*(id *)(a1 + 32) coreDataStore];
  [v3 destroyPersistentStore];
}

void sub_1000215D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000215F4(uint64_t a1)
{
  uint64_t v2 = _os_activity_create((void *)&_mh_execute_header, "kvs/lock-status-notification", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (MKBDeviceUnlockedSinceBoot())
    {
      id v8 = 0;
      id v4 = [WeakRetained engineWithError:&v8];
      id v5 = v8;

      if (v4)
      {
        int v6 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v7 = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Successfully initialized engine after first unlock notification", v7, 2u);
        }
      }
      else
      {
        int v6 = SYDGetCloudKitLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_1000338C8();
        }
      }

      if ([WeakRetained mobileKeybagNotifyToken] != -1)
      {
        notify_cancel((int)[WeakRetained mobileKeybagNotifyToken]);
        [WeakRetained setMobileKeybagNotifyToken:0xFFFFFFFFLL];
      }
    }
    else
    {
      id v5 = SYDGetCloudKitLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_100033894();
      }
    }
  }
  else
  {
    id v5 = SYDGetCloudKitLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      sub_100033854();
    }
  }

  os_activity_scope_leave(&state);
}

void sub_10002178C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
}

void sub_10002194C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100022218(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = SYDGetConnectionLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = [WeakRetained xpcConnection];
      int v4 = 138412290;
      id v5 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Connection interrupted %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_1000222E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = SYDGetConnectionLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      uint64_t v3 = [WeakRetained xpcConnection];
      int v5 = 138412290;
      int v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Connection invalidated %@", (uint8_t *)&v5, 0xCu);
    }
    int v4 = [WeakRetained delegate];
    [v4 connectionDidInvalidate:WeakRetained];
  }
}

void sub_100022EC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) callbackQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100022F90;
  v6[3] = &unk_1000513A0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  dispatch_async(v4, v6);
}

void sub_100022F90(uint64_t a1)
{
  sub_1000084BC(*(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100023160(id a1)
{
  uint64_t v1 = SYDGetConnectionLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT)) {
    sub_10003433C();
  }
}

void sub_100023390()
{
  id v0 = SYDGetConnectionLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    sub_100034810();
  }
}

void sub_1000233DC()
{
  id v0 = SYDGetConnectionLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    sub_100034878();
  }
}

void sub_1000234DC(uint64_t a1)
{
  id v2 = SYDGetConnectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000348E0();
  }

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 processAccountChanges];

  if (*(void *)(a1 + 40))
  {
    int v4 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000235C4;
    block[3] = &unk_1000513E8;
    id v6 = *(id *)(a1 + 40);
    dispatch_async(v4, block);
  }
}

uint64_t sub_1000235C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100023694(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) object];
  int v4 = [*v2 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"storeID"];

  if (!v5)
  {
    uint64_t v10 = SYDGetConnectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100034914();
    }
    goto LABEL_21;
  }
  if (!v3)
  {
    uint64_t v10 = SYDGetConnectionLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003497C();
    }
    goto LABEL_21;
  }
  id v7 = *(void **)(a1 + 40);
  id v6 = (void *)(a1 + 40);
  id v8 = [v7 registeredStoreIDs];
  unsigned int v9 = [v8 containsObject:v5];

  if (v9)
  {
    uint64_t v10 = _os_activity_create((void *)&_mh_execute_header, "kvs/notify-store-change", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v10, &state);
    unsigned int v11 = SYDGetConnectionLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_100034A4C();
    }

    uint64_t v12 = [*v2 userInfo];
    id v13 = [v12 objectForKeyedSubscript:@"changedKeys"];

    id v14 = [*v2 object];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      BOOL v16 = [*v2 object];
      uint64_t v17 = [v16 coreDataStore];
      unsigned __int8 v18 = [v5 identifier];
      id v35 = 0;
      unsigned __int8 v19 = [v17 currentChangeTokenForStoreIdentifier:v18 error:&v35];
      id v20 = v35;

      if (v20)
      {
        id v21 = SYDGetConnectionLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1000349E4();
        }
      }
      else
      {
        id v25 = [(id)objc_opt_class() changeDictionaryWithChangedKeys:v13 reason:0 changeToken:v19];
        __int16 v26 = SYDGetConnectionLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          long long v31 = v25;
          unsigned int v30 = [v13 count];
          id v27 = [v5 identifier];
          __int16 v28 = [v13 componentsJoinedByString:@", "];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)uint64_t v38 = v30;
          *(_WORD *)&v38[4] = 2112;
          *(void *)&v38[6] = v27;
          __int16 v39 = 2112;
          long long v40 = v28;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Sending notification about %d changed keys for store <(%@)>:(%@)", buf, 0x1Cu);

          id v25 = v31;
        }

        long long v29 = [v5 personaUniqueString];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100023B44;
        v32[3] = &unk_100050B90;
        v32[4] = *v6;
        id v33 = v5;
        id v21 = v25;
        long long v34 = v21;
        sub_100018CC4(v29, v32);
      }
    }
    else
    {
      unsigned __int8 v19 = SYDGetConnectionLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v22 = [*v2 object];
        uint64_t v23 = (objc_class *)objc_opt_class();
        __int16 v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v38 = v24;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Received a notification about a changed sync manager, but the notification object is a %@", buf, 0xCu);
      }
    }

    os_activity_scope_leave(&state);
LABEL_21:
  }
}

void sub_100023B04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
}

void sub_100023B44(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  [v2 storeDidChangeWithStoreID:*(void *)(a1 + 40) changeDictionary:*(void *)(a1 + 48)];
}

void sub_100023CE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

void sub_100023CF8(uint64_t a1)
{
  id v2 = SYDGetConnectionLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100034AC4();
  }

  dispatch_group_t v3 = dispatch_group_create();
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  [v18 setObject:&off_100053D68 forKeyedSubscript:NSUbiquitousKeyValueStoreChangeReasonKey];
  int v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  if (v4)
  {
    if (v5)
    {
      if (objc_msgSend(v4, "isEqual:")) {
        goto LABEL_11;
      }
      id v6 = &off_100053DB0;
    }
    else
    {
      id v6 = &off_100053D98;
    }
  }
  else
  {
    if (!v5) {
      goto LABEL_11;
    }
    id v6 = &off_100053D80;
  }
  [v18 setObject:v6 forKeyedSubscript:@"accountChangeTypeKey"];
LABEL_11:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [*(id *)(a1 + 32) registeredStoreIDs];
  id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        uint64_t v11 = a1;
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v13 = [v12 personaUniqueString];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100023FD4;
        v21[3] = &unk_100051410;
        v21[4] = v12;
        id v14 = v3;
        a1 = v11;
        uint64_t v15 = *(void *)(v11 + 32);
        id v22 = v14;
        uint64_t v23 = v15;
        id v24 = v18;
        sub_100018CC4(v13, v21);
      }
      id v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v8);
  }

  if (*(void *)(a1 + 56))
  {
    BOOL v16 = [*(id *)(a1 + 32) callbackQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100024194;
    block[3] = &unk_1000513E8;
    id v20 = *(id *)(a1 + 56);
    dispatch_group_notify(v3, v16, block);
  }
}

void sub_100023FD4(uint64_t a1)
{
  if (sub_10000AD74())
  {
    id v2 = SYDGetConnectionLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_100034B2C();
    }
  }
  else
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    dispatch_group_t v3 = [*(id *)(a1 + 48) delegate];
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 32);
    id v15 = 0;
    id v6 = [v3 connection:v4 syncManagerForStoreID:v5 error:&v15];
    id v2 = v15;

    if (v6) {
      BOOL v7 = v2 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7)
    {
      id v8 = [v6 coreDataStore];
      uint64_t v9 = [*(id *)(a1 + 32) identifier];
      id v14 = 0;
      uint64_t v10 = [v8 currentChangeTokenForStoreIdentifier:v9 error:&v14];
      id v2 = v14;

      if (v2)
      {
        uint64_t v11 = SYDGetConnectionLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_100034B94();
        }
      }
      else
      {
        if (v10) {
          uint64_t v12 = 2;
        }
        else {
          uint64_t v12 = 1;
        }
        uint64_t v11 = +[NSMutableDictionary dictionaryWithCapacity:v12];
        [v11 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"NSUbiquitousKeyValueStoreDidChangeExternallyNotificationUserInfo"];
        if (v10) {
          [v11 setObject:v10 forKeyedSubscript:@"ChangeToken"];
        }
        id v13 = [*(id *)(a1 + 48) client];
        [v13 storeDidChangeWithStoreID:*(void *)(a1 + 32) changeDictionary:v11];

        dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
      }
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }
  }
}

uint64_t sub_100024194(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000245B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1000245EC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) registeredStoreIDs];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

void sub_10002464C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) client];
  [v2 storeDidChangeWithStoreID:*(void *)(a1 + 40) changeDictionary:*(void *)(a1 + 48)];
}

void sub_10002484C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100024EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
}

void sub_1000253C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,os_activity_scope_state_s state)
{
}

void sub_10002541C(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v10 = *(void **)(a1 + 56);
  id v42 = 0;
  uint64_t v11 = [v10 keyValueStorePlistFromURL:v7 error:&v42];
  id v12 = v42;
  id v13 = v42;
  if (v13)
  {
    id v14 = v13;
    id v15 = SYDGetMigrationLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1000356F8();
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v12);
    if ([*(id *)(a1 + 56) shouldStopMigrationAfterError:v14]) {
      *a4 = 1;
    }
    goto LABEL_44;
  }
  if (v11)
  {
    id v36 = v9;
    if ([*(id *)(a1 + 56) shouldUseTransactionForPlistAtURL:v7])
    {
      BOOL v16 = *(void **)(a1 + 32);
      id v41 = 0;
      id v17 = [v16 transactionalStoreWithError:&v41];
      id v18 = v41;
      BOOL v19 = v18 == 0;
      if (v18)
      {
        id v20 = v18;
        id v21 = SYDGetMigrationLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
          sub_100035690();
        }
      }
      if (v17)
      {
LABEL_19:
        uint64_t v23 = *(void **)(a1 + 56);
        id v40 = 0;
        id v24 = v17;
        unsigned int v25 = objc_msgSend(v23, "migratePlist:forStoreWithIdentifier:toCoreDataStore:error:", v11, v8, v17, &v40, v36);
        id v26 = v40;
        long long v27 = v26;
        if (v19 && v25)
        {
          id v39 = v26;
          unsigned __int8 v28 = [v24 saveTransaction:&v39];
          id v14 = v39;

          if ((v28 & 1) == 0)
          {
            long long v34 = SYDGetMigrationLog();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
              sub_100035628();
            }

            goto LABEL_35;
          }
          long long v27 = v14;
        }
        if (v25)
        {
          long long v29 = SYDGetMigrationLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            sub_100035558();
          }

          ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          if (*(unsigned char *)(a1 + 64))
          {
            unsigned int v30 = +[NSFileManager defaultManager];
            id v38 = v27;
            unsigned __int8 v31 = [v30 removeItemAtURL:v7 error:&v38];
            id v14 = v38;

            uint64_t v32 = SYDGetMigrationLog();
            id v33 = v32;
            if (v31)
            {
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
                sub_100035478();
              }
            }
            else
            {
              if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
                sub_1000354E0();
              }

              id v14 = 0;
            }
          }
          else
          {
            id v14 = v27;
          }
LABEL_43:

          uint64_t v9 = v37;
          goto LABEL_44;
        }
        id v14 = v27;
LABEL_35:
        id v35 = SYDGetMigrationLog();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_1000355C0();
        }

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v14);
        if ([*(id *)(a1 + 56) shouldStopMigrationAfterError:v14]) {
          *a4 = 1;
        }
        goto LABEL_43;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
    id v17 = *(id *)(a1 + 32);
    goto LABEL_19;
  }
  id v22 = SYDGetMigrationLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    sub_100035410();
  }

  id v14 = 0;
LABEL_44:
}

void sub_1000259F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100025A1C(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  CFDictionaryRef v8 = a3;
  uint64_t v9 = SYDGetMigrationLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100035A88((uint64_t)v7, (uint64_t)a1, v9);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v35 = 0;
    uint64_t v10 = sub_100017B08(v8, &v35);
    if (v10)
    {
      if (v35)
      {
        uint64_t v12 = a1[4];
        uint64_t v11 = (void *)a1[5];
        uint64_t v13 = *(void *)(a1[6] + 8);
        id obj = *(id *)(v13 + 40);
        id v14 = [v11 keyValueForKey:v7 inStoreWithIdentifier:v12 createIfNecessary:1 error:&obj];
        objc_storeStrong((id *)(v13 + 40), obj);
        if (*(void *)(*(void *)(a1[6] + 8) + 40))
        {
          id v15 = SYDGetMigrationLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_100035968();
          }
        }
        else
        {
          id v17 = [v14 valueModificationDate];

          if (v17)
          {
            id v18 = [v14 valueModificationDate];
            [v18 timeIntervalSinceReferenceDate];
            double v20 = v19;
            double v21 = (double)v35;

            id v22 = SYDGetMigrationLog();
            BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
            if (v20 >= v21)
            {
              if (v23) {
                sub_1000358F8();
              }

              goto LABEL_17;
            }
            if (v23)
            {
              uint64_t v24 = a1[4];
              double v25 = (double)v35;
              id v26 = [v14 valueModificationDate];
              [v26 timeIntervalSinceReferenceDate];
              *(_DWORD *)buf = 138478595;
              id v37 = v7;
              __int16 v38 = 2112;
              uint64_t v39 = v24;
              __int16 v40 = 2048;
              double v41 = v25;
              __int16 v42 = 2048;
              uint64_t v43 = v27;
              _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Using plist value for (%{private}@) in %@: timestamp %f is later than current timestamp %f", buf, 0x2Au);
            }
          }
          else
          {
            id v22 = SYDGetMigrationLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
              sub_100035888();
            }
          }

          unsigned __int8 v28 = +[SYDKeyValue recordNameForUnencryptedKey:v7];
          [v14 setRecordName:v28];

          uint64_t v29 = +[NSDate dateWithTimeIntervalSinceReferenceDate:(double)v35];
          [v14 setValue:v10 withModificationDate:v29];

          uint64_t v31 = a1[4];
          unsigned int v30 = (void *)a1[5];
          uint64_t v32 = *(void *)(a1[6] + 8);
          id v33 = *(id *)(v32 + 40);
          LOBYTE(v29) = [v30 saveKeyValue:v14 inStoreWithIdentifier:v31 excludeFromChangeTracking:1 enforceQuota:0 error:&v33];
          objc_storeStrong((id *)(v32 + 40), v33);
          if (v29)
          {
LABEL_17:

            goto LABEL_18;
          }
          id v15 = SYDGetMigrationLog();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_10003581C();
          }
        }

        *a4 = 1;
        goto LABEL_17;
      }
      id v14 = SYDGetMigrationLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      BOOL v16 = "No timestamp in plist storage";
    }
    else
    {
      id v14 = SYDGetMigrationLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      BOOL v16 = "No plist value from plist storage";
    }
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v16, buf, 2u);
    goto LABEL_17;
  }
  uint64_t v10 = SYDGetMigrationLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    sub_1000359D4((uint64_t)v8, v10);
  }
LABEL_18:
}

void sub_1000268E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = [v5 objectForKeyedSubscript:@"StoreIdentifier"];
  id v7 = [v5 objectForKeyedSubscript:@"AdditionalStoreIdentifiers"];

  [*(id *)(a1 + 48) addPlistURLsForBundleIdentifier:v6 defaultStoreIdentifier:v8 additionalStoreIdentifiers:v7 toDictionary:*(void *)(a1 + 32) syncedPreferencesDirectoryURL:*(void *)(a1 + 40)];
}

void sub_100026E9C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_100026EB4(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_100026ED0(id a1)
{
  qword_10005BBB0 = (uint64_t)os_log_create("com.apple.kvs", "Misc");
  _objc_release_x1();
}

void sub_100026F14(id a1)
{
  qword_10005BBC0 = (uint64_t)os_log_create("com.apple.kvs", "CloudKit");
  _objc_release_x1();
}

void sub_100026F58(id a1)
{
  qword_10005BBD0 = (uint64_t)os_log_create("com.apple.kvs", "CoreData");
  _objc_release_x1();
}

void sub_100026F9C(id a1)
{
  qword_10005BBE0 = (uint64_t)os_log_create("com.apple.kvs", "Connection");
  _objc_release_x1();
}

id SYDGetAnalyticsLog()
{
  if (qword_10005BBF8 != -1) {
    dispatch_once(&qword_10005BBF8, &stru_100051550);
  }
  id v0 = (void *)qword_10005BBF0;
  return v0;
}

void sub_100027034(id a1)
{
  qword_10005BBF0 = (uint64_t)os_log_create("com.apple.kvs", "Analytics");
  _objc_release_x1();
}

id SYDGetAccountsLog()
{
  if (qword_10005BC08 != -1) {
    dispatch_once(&qword_10005BC08, &stru_100051570);
  }
  id v0 = (void *)qword_10005BC00;
  return v0;
}

void sub_1000270CC(id a1)
{
  qword_10005BC00 = (uint64_t)os_log_create("com.apple.kvs", "Accounts");
  _objc_release_x1();
}

id SYDGetMigrationLog()
{
  if (qword_10005BC18 != -1) {
    dispatch_once(&qword_10005BC18, &stru_100051590);
  }
  id v0 = (void *)qword_10005BC10;
  return v0;
}

void sub_100027164(id a1)
{
  qword_10005BC10 = (uint64_t)os_log_create("com.apple.kvs", "Migration");
  _objc_release_x1();
}

void sub_1000271A8(id a1)
{
  qword_10005BC20 = (uint64_t)os_log_create("com.apple.kvs", "TCC");
  _objc_release_x1();
}

void sub_1000277C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1000277E4(uint64_t a1)
{
  dispatch_group_t v3 = (void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = *(void *)(v3[3] + 8);
  id obj = *(id *)(v7 + 40);
  id v8 = [v4 managedKeyValueWithRecordName:v2 inStoreWithIdentifier:v5 inContext:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (!*(void *)(*(void *)(v3[3] + 8) + 40))
  {
    uint64_t v9 = SYDGetCoreDataLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10) {
        sub_10003622C();
      }

      uint64_t v11 = [*(id *)(a1 + 32) keyValueFromManagedKeyValue:v8 inStoreWithIdentifier:*(void *)(a1 + 48)];
      uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
      uint64_t v9 = *(NSObject **)(v12 + 40);
      *(void *)(v12 + 40) = v11;
    }
    else if (v10)
    {
      sub_1000361C4();
    }
  }
}

void sub_100027D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_100027D48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  id v24 = *(id *)(v8 + 40);
  uint64_t v9 = [v7 contextForStoreIdentifier:v5 error:&v24];
  objc_storeStrong((id *)(v8 + 40), v24);
  if (*(unsigned char *)(a1 + 48)) {
    CFStringRef v10 = @"no-change-tracking";
  }
  else {
    CFStringRef v10 = 0;
  }
  [v9 setTransactionAuthor:v10];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_100027E8C;
  v16[3] = &unk_100051650;
  char v22 = *(unsigned char *)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v17 = v6;
  uint64_t v18 = v11;
  id v20 = v5;
  uint64_t v21 = v12;
  id v19 = v9;
  __int16 v23 = *(_WORD *)(a1 + 49);
  id v13 = v5;
  id v14 = v9;
  id v15 = v6;
  [v14 performBlockAndWait:v16];
}

void sub_100027E8C(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v89 objects:v108 count:16];
  __int16 v71 = v2;
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v90;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v90 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v89 + 1) + 8 * i);
        uint64_t v9 = SYDGetCoreDataLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v11 = [v8 key];
          uint64_t v12 = [v8 value];
          id v13 = [v8 storeIdentifier];
          int v14 = *(unsigned __int8 *)(a1 + 72);
          *(_DWORD *)buf = 141559299;
          uint64_t v97 = 1752392040;
          __int16 v98 = 2113;
          v99 = v11;
          __int16 v100 = 2160;
          uint64_t v101 = 1752392040;
          __int16 v102 = 2113;
          uint64_t v103 = v12;
          __int16 v104 = 2112;
          uint64_t v105 = v13;
          __int16 v106 = 1024;
          int v107 = v14;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Saving value for key <(%{private, mask.hash}@)> = <(%{private, mask.hash}@)> in store <(%@)> excludeFromChangeTracking=%d", buf, 0x3Au);

          uint64_t v2 = v71;
        }

        CFStringRef v10 = [v8 keyID];
        [v2 addObject:v10];
      }
      id v5 = [v3 countByEnumeratingWithState:&v89 objects:v108 count:16];
    }
    while (v5);
  }

  id v15 = *(void **)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v72 = a1 + 64;
  uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v17 + 40);
  uint64_t v18 = [v15 managedKeyValuesForKeyIDs:v2 inContext:v16 error:&obj];
  objc_storeStrong((id *)(v17 + 40), obj);
  id v19 = [v18 allValues];
  id v20 = [v19 firstObject];
  uint64_t v21 = [v20 store];

  uint64_t v76 = v18;
  if (v18 && !v21)
  {
    char v22 = *(void **)(a1 + 40);
    uint64_t v23 = *(void *)(a1 + 48);
    uint64_t v24 = *(void *)(a1 + 56);
    uint64_t v25 = *(void *)(*(void *)(a1 + 64) + 8);
    id v87 = *(id *)(v25 + 40);
    uint64_t v21 = [v22 managedStoreWithIdentifier:v24 createIfNecessary:1 inContext:v23 error:&v87];
    objc_storeStrong((id *)(v25 + 40), v87);
  }
  if (*(void *)(*(void *)(*(void *)v72 + 8) + 40))
  {
    id v26 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      sub_1000363A8();
    }
    goto LABEL_16;
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id v74 = *(id *)(a1 + 32);
  id v77 = [v74 countByEnumeratingWithState:&v83 objects:v95 count:16];
  if (!v77) {
    goto LABEL_55;
  }
  uint64_t v75 = *(void *)v84;
  __int16 v73 = v21;
  do
  {
    uint64_t v27 = 0;
    do
    {
      if (*(void *)v84 != v75) {
        objc_enumerationMutation(v74);
      }
      unsigned __int8 v28 = *(void **)(*((void *)&v83 + 1) + 8 * (void)v27);
      uint64_t v29 = [v28 key];
      unsigned int v30 = [v28 keyID];
      uint64_t v31 = [v76 objectForKeyedSubscript:v30];

      if (!v31 || *(unsigned char *)(a1 + 73))
      {
        uint64_t v32 = SYDGetCoreDataLog();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v61 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 141558531;
          uint64_t v97 = 1752392040;
          __int16 v98 = 2113;
          v99 = v29;
          __int16 v100 = 2112;
          uint64_t v101 = v61;
          _os_log_debug_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "Creating new managed key value for key <(%{private, mask.hash}@)> in store <(%@)>", buf, 0x20u);
        }

        id v33 = [[SYDManagedKeyValue alloc] initWithContext:*(void *)(a1 + 48)];
        [(SYDManagedKeyValue *)v33 setKey:v29];
        [(SYDManagedKeyValue *)v33 setStore:v21];
        uint64_t v34 = *(void *)(a1 + 56);
        uint64_t v35 = [(SYDManagedKeyValue *)v33 store];
        [v35 setIdentifier:v34];

        uint64_t v31 = v33;
      }
      id v36 = [v28 value];
      [v31 setValue:v36];

      id v37 = [v28 serverSystemFieldsRecordData];
      [v31 setServerSystemFieldsRecordData:v37];

      __int16 v38 = [v28 valueModificationDate];
      [v31 setValueModificationDate:v38];

      uint64_t v39 = [v28 recordName];
      [v31 setRecordName:v39];

      __int16 v40 = [v31 plistDataValue];
      double v41 = [v40 length];

      __int16 v42 = [v31 plistDataLength];
      [v31 setPlistDataLength:v41];
      if (*(unsigned char *)(a1 + 74))
      {
        uint64_t v43 = sub_10001903C();
        unsigned __int8 v44 = [v43 containsObject:*(void *)(a1 + 56)];

        if ((v44 & 1) == 0)
        {
          unsigned __int8 v45 = [v31 store];
          id v46 = [v45 keyValues];
          id v47 = [v46 count];

          if ((unint64_t)v47 >= 0x401)
          {
            id v48 = SYDGetCoreDataLog();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v62 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 138412290;
              uint64_t v97 = v62;
              _os_log_debug_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "Exceeded maximum number of keys in store <(%@)>", buf, 0xCu);
            }

            +[NSString stringWithFormat:@"Exceeded maximum number of keys (%d) in store (%@).", 1024, *(void *)(a1 + 56), v70];
            goto LABEL_37;
          }
          if ((unint64_t)v41 > 0x100000)
          {
            id v49 = SYDGetCoreDataLog();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v63 = *(void *)(a1 + 56);
              *(_DWORD *)buf = 141558531;
              uint64_t v97 = 1752392040;
              __int16 v98 = 2113;
              v99 = v29;
              __int16 v100 = 2112;
              uint64_t v101 = v63;
              _os_log_debug_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "Exceeded maximum bytes for key <(%{private, mask.hash}@)> in store <(%@)>", buf, 0x20u);
            }

            +[NSString stringWithFormat:@"Exceeded maximum size (%d) for key (%@) in store (%@).", 0x100000, v29, *(void *)(a1 + 56)];
            id v50 = LABEL_37:;
            uint64_t v21 = v73;
            if (!v50) {
              goto LABEL_46;
            }
LABEL_38:
            NSErrorUserInfoKey v93 = NSLocalizedDescriptionKey;
            long long v94 = v50;
            uint64_t v51 = +[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
            uint64_t v52 = +[NSError errorWithDomain:@"SyncedDefaults" code:6666 userInfo:v51];
            uint64_t v53 = *(void *)(*(void *)v72 + 8);
            long long v54 = *(void **)(v53 + 40);
            *(void *)(v53 + 40) = v52;

            unsigned int v55 = [v31 isInserted];
            uint64_t v56 = SYDGetCoreDataLog();
            BOOL v57 = os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG);
            if (v55)
            {
              if (v57) {
                sub_100036338(&v81, v82);
              }

              [*(id *)(a1 + 48) deleteObject:v31];
            }
            else
            {
              if (v57) {
                sub_100036370(&v79, v80);
              }

              [*(id *)(a1 + 48) refreshObject:v31 mergeChanges:0];
            }
            uint64_t v21 = v73;

            goto LABEL_46;
          }
          uint64_t v21 = v73;
          if (v41 - v42 >= 1)
          {
            uint64_t v58 = [v31 store];
            uint64_t v59 = (uint64_t)[v58 totalDataLength] + v41 - v42;

            uint64_t v21 = v73;
            if (v59 > 0x100000)
            {
              id v60 = SYDGetCoreDataLog();
              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v64 = *(void *)(a1 + 56);
                *(_DWORD *)buf = 138412290;
                uint64_t v97 = v64;
                _os_log_debug_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEBUG, "Exceeded maximum total bytes in store <(%@)>", buf, 0xCu);
              }

              id v50 = +[NSString stringWithFormat:@"Exceeded maximum total bytes (%d) in store (%@).", 0x100000, *(void *)(a1 + 56)];
              if (v50) {
                goto LABEL_38;
              }
            }
          }
        }
      }
LABEL_46:

      uint64_t v27 = (char *)v27 + 1;
    }
    while (v77 != v27);
    id v65 = [v74 countByEnumeratingWithState:&v83 objects:v95 count:16];
    id v77 = v65;
  }
  while (v65);
LABEL_55:

  uint64_t v66 = *(void *)(*(void *)v72 + 8);
  uint64_t v2 = v71;
  if (*(void *)(v66 + 40)) {
    goto LABEL_56;
  }
  v67 = *(void **)(a1 + 40);
  uint64_t v68 = *(void *)(a1 + 48);
  id v78 = 0;
  [v67 saveContext:v68 reason:@"saving key values" includingTransactionContext:0 error:&v78];
  id v69 = v78;
  id v26 = *(NSObject **)(v66 + 40);
  *(void *)(v66 + 40) = v69;
LABEL_16:

LABEL_56:
}

void sub_100028A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100028A68(void *a1)
{
  uint64_t v2 = [[_TtC13syncdefaultsd8SYDKeyID alloc] initWithKey:a1[4] storeIdentifier:a1[5]];
  id v3 = (void *)a1[6];
  uint64_t v17 = v2;
  id v4 = +[NSArray arrayWithObjects:&v17 count:1];
  uint64_t v5 = a1[7];
  uint64_t v6 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v3 managedKeyValuesForKeyIDs:v4 inContext:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);

  uint64_t v8 = [v7 objectForKeyedSubscript:v2];
  if (*(void *)(*(void *)(a1[8] + 8) + 40))
  {
    uint64_t v9 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10003654C();
    }
  }
  else
  {
    uint64_t v9 = SYDGetCoreDataLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10) {
        sub_1000364E4();
      }

      [(id)a1[7] deleteObject:v8];
      uint64_t v11 = (void *)a1[6];
      uint64_t v12 = a1[7];
      uint64_t v13 = *(void *)(a1[8] + 8);
      id v15 = *(id *)(v13 + 40);
      [v11 saveContext:v12 reason:@"removing key value" includingTransactionContext:0 error:&v15];
      id v14 = v15;
      uint64_t v9 = *(NSObject **)(v13 + 40);
      *(void *)(v13 + 40) = v14;
    }
    else if (v10)
    {
      sub_10003647C();
    }
  }
}

void sub_100028E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100028EA8(uint64_t a1)
{
  id v3 = (void *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  uint64_t v7 = *(void *)(v3[3] + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v4 managedKeyValueWithRecordName:v2 inStoreWithIdentifier:v5 inContext:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (!*(void *)(*(void *)(v3[3] + 8) + 40))
  {
    uint64_t v9 = SYDGetCoreDataLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10) {
        sub_100036684();
      }

      [*(id *)(a1 + 56) deleteObject:v8];
      uint64_t v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 56);
      uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
      id v15 = *(id *)(v13 + 40);
      [v11 saveContext:v12 reason:@"removing key value for record name" includingTransactionContext:0 error:&v15];
      id v14 = v15;
      uint64_t v9 = *(NSObject **)(v13 + 40);
      *(void *)(v13 + 40) = v14;
    }
    else if (v10)
    {
      sub_10003661C();
    }
  }
}

void sub_1000291B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1000291DC(void *a1)
{
  id v3 = a1 + 7;
  uint64_t v2 = a1[7];
  id v4 = (void *)a1[4];
  uint64_t v5 = *(v3 - 2);
  uint64_t v6 = *(v3 - 1);
  uint64_t v7 = *(void *)(v2 + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v4 managedStoreWithIdentifier:v5 createIfNecessary:0 inContext:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (*(void *)(*(void *)(*v3 + 8) + 40))
  {
    uint64_t v9 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100036788();
    }
  }
  else if (v8)
  {
    uint64_t v10 = [v8 syncAnchorServerSystemFieldsRecordData];
    uint64_t v11 = *(void *)(a1[8] + 8);
    uint64_t v9 = *(NSObject **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  else
  {
    uint64_t v9 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100036754();
    }
  }
}

void sub_1000294A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000294BC(void *a1)
{
  id v3 = a1 + 8;
  uint64_t v2 = a1[8];
  id v4 = (void *)a1[4];
  uint64_t v5 = *(v3 - 3);
  uint64_t v6 = *(v3 - 2);
  uint64_t v7 = *(void *)(v2 + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v4 managedStoreWithIdentifier:v5 createIfNecessary:1 inContext:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (*(void *)(*(void *)(*v3 + 8) + 40))
  {
    uint64_t v9 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100036788();
    }
  }
  else if (v8)
  {
    [v8 setSyncAnchorServerSystemFieldsRecordData:a1[7]];
    uint64_t v10 = (void *)a1[4];
    uint64_t v11 = a1[6];
    uint64_t v12 = *(void *)(a1[8] + 8);
    id v14 = *(id *)(v12 + 40);
    [v10 saveContext:v11 reason:@"Saving sync anchor" includingTransactionContext:0 error:&v14];
    id v13 = v14;
    uint64_t v9 = *(NSObject **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
  }
  else
  {
    uint64_t v9 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_1000368C0();
    }
  }
}

void sub_1000298E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100029900(void *a1)
{
  uint64_t v2 = +[SYDManagedStore fetchRequest];
  [v2 setPredicate:a1[4]];
  id v3 = [objc_alloc((Class)NSBatchDeleteRequest) initWithFetchRequest:v2];
  id v4 = (void *)a1[5];
  uint64_t v5 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = [v4 executeRequest:v3 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);

  uint64_t v7 = SYDGetCoreDataLog();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_1000369C4();
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    sub_10003695C();
  }
}

void sub_100029B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100029BB4(uint64_t a1)
{
  uint64_t v2 = +[SYDManagedKeyValue fetchRequest];
  [v2 setResultType:2];
  id v3 = +[NSPredicate predicateWithFormat:@"store.identifier == %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];

  id v4 = NSStringFromSelector("recordName");
  uint64_t v25 = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:&v25 count:1];
  [v2 setPropertiesToFetch:v5];

  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v17 = v2;
  uint64_t v8 = [v6 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v9 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_100036A2C();
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  id v11 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v19 + 1) + 8 * i) objectForKeyedSubscript:v4];
        if (v15)
        {
          [*(id *)(a1 + 48) addObject:v15];
        }
        else
        {
          uint64_t v16 = SYDGetCoreDataLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Fetched a key value with no record name", buf, 2u);
          }
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v12);
  }
}

void sub_10002A020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002A03C(uint64_t a1)
{
  uint64_t v2 = +[SYDManagedStore fetchRequest];
  [v2 setResultType:2];
  id v3 = NSStringFromSelector("identifier");
  uint64_t v27 = v3;
  id v4 = +[NSArray arrayWithObjects:&v27 count:1];
  [v2 setPropertiesToFetch:v4];

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v6 + 40);
  long long v19 = v2;
  uint64_t v7 = [v5 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v8 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100036B64();
    }

    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v10 = *(void **)(a1 + 40);
    id v11 = [*(id *)(a1 + 32) persistentStoreCoordinator];
    [v10 handleCorruptionIfNecessaryFromError:v9 inPersistentStoreCoordinator:v11];
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v12 = v7;
  id v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v16) objectForKeyedSubscript:v3];
        if ([v17 length])
        {
          [*(id *)(a1 + 48) addObject:v17];
        }
        else
        {
          uint64_t v18 = SYDGetCoreDataLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Fetched a store with no store identifier", buf, 2u);
          }
        }
        uint64_t v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v14);
  }
}

void sub_10002A45C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002A474(void *a1)
{
  id v3 = a1 + 5;
  uint64_t v2 = a1[5];
  id v4 = (void *)a1[4];
  uint64_t v5 = v3[1];
  uint64_t v6 = *(void *)(v3[2] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v4 managedStoreWithIdentifier:v2 createIfNecessary:0 inContext:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    uint64_t v8 = [v7 syncAnchorServerSystemFieldsRecordData];

    if (v8)
    {
      [v7 setSyncAnchorServerSystemFieldsRecordData:0];
      uint64_t v9 = (void *)a1[4];
      uint64_t v10 = a1[6];
      uint64_t v11 = *(void *)(a1[7] + 8);
      id v28 = *(id *)(v11 + 40);
      [v9 saveContext:v10 reason:@"Removing sync anchor server record" includingTransactionContext:0 error:&v28];
      objc_storeStrong((id *)(v11 + 40), v28);
    }
    id v12 = objc_alloc((Class)NSBatchUpdateRequest);
    id v13 = +[SYDManagedKeyValue entity];
    id v14 = [v12 initWithEntity:v13];

    uint64_t v15 = +[NSPredicate predicateWithFormat:@"store == %@", v7];
    [v14 setPredicate:v15];

    uint64_t v16 = NSStringFromSelector("serverSystemFieldsRecordData");
    unsigned int v30 = v16;
    uint64_t v17 = +[NSNull null];
    uint64_t v31 = v17;
    uint64_t v18 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    [v14 setPropertiesToUpdate:v18];

    long long v19 = (void *)a1[6];
    uint64_t v20 = *(void *)(a1[7] + 8);
    id v27 = *(id *)(v20 + 40);
    long long v21 = [v19 executeRequest:v14 error:&v27];
    objc_storeStrong((id *)(v20 + 40), v27);

    long long v22 = SYDGetCoreDataLog();
    long long v23 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_100036D04();
      }
    }
    else
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        sub_100036C9C();
      }

      long long v24 = (void *)a1[4];
      uint64_t v25 = (void *)a1[6];
      uint64_t v26 = *(void *)(*(void *)(a1[7] + 8) + 40);
      long long v23 = [v25 persistentStoreCoordinator];
      [v24 handleCorruptionIfNecessaryFromError:v26 inPersistentStoreCoordinator:v23];
    }
  }
  else
  {
    id v14 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100036C34();
    }
  }
}

void sub_10002A8B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10002A8DC(void *a1)
{
  uint64_t v2 = +[SYDManagedKeyValue fetchRequest];
  id v3 = +[NSPredicate predicateWithFormat:@"store.identifier == %@", a1[4]];
  [v2 setPredicate:v3];

  uint64_t v4 = a1[7];
  a1 += 7;
  uint64_t v5 = (void *)*(a1 - 2);
  uint64_t v6 = *(void *)(v4 + 8);
  id obj = *(id *)(v6 + 40);
  id v7 = [v5 countForFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(void *)(*(void *)(*(a1 - 1) + 8) + 24) = v7;
  if (*(void *)(*(void *)(*a1 + 8) + 40))
  {
    uint64_t v8 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      sub_100036D6C(v2);
    }
  }
}

void sub_10002AB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002AB54(uint64_t a1)
{
  id v2 = objc_alloc((Class)NSBatchUpdateRequest);
  id v3 = +[SYDManagedKeyValue entity];
  id v4 = [v2 initWithEntity:v3];

  uint64_t v5 = NSStringFromSelector("serverSystemFieldsRecordData");
  uint64_t v29 = v5;
  uint64_t v6 = +[NSNull null];
  unsigned int v30 = v6;
  id v7 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  [v4 setPropertiesToUpdate:v7];

  uint64_t v8 = *(void **)(a1 + 32);
  id v26 = 0;
  uint64_t v9 = [v8 executeRequest:v4 error:&v26];
  id v10 = v26;

  uint64_t v11 = SYDGetCoreDataLog();
  id v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000373D8();
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    sub_100037370();
  }

  id v13 = objc_alloc((Class)NSBatchUpdateRequest);
  id v14 = +[SYDManagedStore entity];
  id v15 = [v13 initWithEntity:v14];

  uint64_t v16 = NSStringFromSelector("syncAnchorServerSystemFieldsRecordData");
  id v27 = v16;
  uint64_t v17 = +[NSNull null];
  id v28 = v17;
  uint64_t v18 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  [v15 setPropertiesToUpdate:v18];

  long long v19 = *(void **)(a1 + 32);
  id v25 = 0;
  uint64_t v20 = [v19 executeRequest:v15 error:&v25];
  id v21 = v25;

  long long v22 = SYDGetCoreDataLog();
  long long v23 = v22;
  if (v20)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      sub_10003733C();
    }
  }
  else if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
  {
    sub_1000372D4();
  }

  if (v10) {
    long long v24 = v10;
  }
  else {
    long long v24 = v21;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v24);
}

void sub_10002AF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002AF88(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 managedDatabaseCreateIfNecessary:1 inContext:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = [v5 acAccountIdentifier];
  unsigned __int8 v7 = [v6 isEqualToString:a1[6]];

  if ((v7 & 1) == 0)
  {
    uint64_t v8 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10003740C();
    }

    [v5 setAcAccountIdentifier:a1[6]];
    uint64_t v9 = (void *)a1[4];
    uint64_t v10 = a1[5];
    uint64_t v11 = *(void *)(a1[7] + 8);
    id v12 = *(id *)(v11 + 40);
    [v9 saveContext:v10 reason:@"ACAccount identifier" includingTransactionContext:0 error:&v12];
    objc_storeStrong((id *)(v11 + 40), v12);
  }
}

void sub_10002B22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10002B250(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 managedDatabaseCreateIfNecessary:0 inContext:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = [v5 acAccountIdentifier];
  uint64_t v7 = *(void *)(a1[7] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_10002B450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002B468(uint64_t a1)
{
  uint64_t v3 = a1 + 48;
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v2 + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v4 managedDatabaseCreateIfNecessary:1 inContext:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(void *)(*(void *)(*(void *)v3 + 8) + 40))
  {
    uint64_t v8 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003754C();
    }
LABEL_8:

    goto LABEL_9;
  }
  if (*(unsigned __int8 *)(a1 + 56) != [v7 didMigrateFromPlists])
  {
    uint64_t v9 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000374E0();
    }

    [v7 setDidMigrateFromPlists:*(unsigned __int8 *)(a1 + 56)];
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(id *)(v12 + 40);
    [v10 saveContext:v11 reason:@"did migrate from plists" includingTransactionContext:0 error:&v14];
    id v13 = v14;
    uint64_t v8 = *(NSObject **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
    goto LABEL_8;
  }
LABEL_9:
}

void sub_10002B6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10002B71C(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 managedDatabaseCreateIfNecessary:0 inContext:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = [v5 didMigrateFromPlists];
}

void sub_10002B910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002B928(uint64_t a1)
{
  uint64_t v3 = a1 + 48;
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(v3 - 8);
  uint64_t v6 = *(void *)(v2 + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = [v4 managedDatabaseCreateIfNecessary:1 inContext:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(void *)(*(void *)(*(void *)v3 + 8) + 40))
  {
    uint64_t v8 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003768C();
    }
LABEL_8:

    goto LABEL_9;
  }
  if (*(unsigned __int16 *)(a1 + 56) != (unsigned __int16)[v7 failedMigrationCount])
  {
    uint64_t v9 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100037620();
    }

    [v7 setFailedMigrationCount:*(__int16 *)(a1 + 56)];
    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(id *)(v12 + 40);
    [v10 saveContext:v11 reason:@"failed migration count" includingTransactionContext:0 error:&v14];
    id v13 = v14;
    uint64_t v8 = *(NSObject **)(v12 + 40);
    *(void *)(v12 + 40) = v13;
    goto LABEL_8;
  }
LABEL_9:
}

void sub_10002BBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10002BBDC(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 managedDatabaseCreateIfNecessary:0 inContext:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_WORD *)(*(void *)(a1[7] + 8) + 24) = (unsigned __int16)[v5 failedMigrationCount];
}

void sub_10002BDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002BE08(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 managedDatabaseCreateIfNecessary:1 inContext:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  [v5 setSyncEngineStateSerialization:a1[6]];
  [v5 setSyncEngineMetadata:0];
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = *(void *)(a1[7] + 8);
  id v9 = *(id *)(v8 + 40);
  [v6 saveContext:v7 reason:@"sync engine metadata serialization" includingTransactionContext:0 error:&v9];
  objc_storeStrong((id *)(v8 + 40), v9);
}

void sub_10002C088(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10002C0AC(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 managedDatabaseCreateIfNecessary:0 inContext:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = [v5 syncEngineStateSerialization];
  uint64_t v7 = *(void *)(a1[7] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_10002C2CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002C2E4(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 managedDatabaseCreateIfNecessary:1 inContext:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  [v5 setSyncEngineMetadata:a1[6]];
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  uint64_t v8 = *(void *)(a1[7] + 8);
  id v9 = *(id *)(v8 + 40);
  [v6 saveContext:v7 reason:@"deprecated sync engine metadata" includingTransactionContext:0 error:&v9];
  objc_storeStrong((id *)(v8 + 40), v9);
}

void sub_10002C558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10002C57C(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 managedDatabaseCreateIfNecessary:0 inContext:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = [v5 syncEngineMetadata];
  uint64_t v7 = *(void *)(a1[7] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_10002CF8C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5 == 0;
  if (v5)
  {
    if (sub_10000E824(v5))
    {
      uint64_t v7 = SYDGetCoreDataLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100037E84();
      }
    }
    else
    {
      int v8 = sub_10000E8F4(v6);
      id v9 = SYDGetCoreDataLog();
      uint64_t v7 = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100037EEC();
        }
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        sub_100037F54();
      }
    }

    uint64_t v10 = *(void **)(a1 + 32);
    uint64_t v11 = [*(id *)(a1 + 40) persistentStoreCoordinator];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = objc_msgSend(v10, "_queue_handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:", v6, v11);

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
}

void sub_10002D0B4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  uint64_t v6 = SYDGetCoreDataLog();
  uint64_t v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_100037FF0();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    sub_100037FBC();
  }
}

void sub_10002D1B0(id a1)
{
  uint64_t v1 = +[NSBundle bundleForClass:objc_opt_class()];
  if (!v1)
  {
    uint64_t v2 = SYDGetCoreDataLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT)) {
      sub_1000380C0();
    }
  }
  uint64_t v3 = [v1 URLForResource:@"SYDManagedObjectModel" withExtension:@"momd"];
  uint64_t v4 = SYDGetCoreDataLog();
  id v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10003808C();
    }

    id v6 = [objc_alloc((Class)NSManagedObjectModel) initWithContentsOfURL:v3];
    id v5 = qword_10005BC30;
    qword_10005BC30 = (uint64_t)v6;
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    sub_100038058();
  }
}

void sub_10002D3E8(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) persistentStoreCoordinator];
  objc_msgSend(v1, "_queue_destroyPersistentStoreInPersistentStoreCoordinator:", v2);
}

void sub_10002DB28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002DB48(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [v2 transactionContext];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v4 + 40);
  [v2 saveContext:v3 reason:@"saving transaction" includingTransactionContext:1 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
}

void sub_10002DD14(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "_queue_handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:", *(void *)(a1 + 40), *(void *)(a1 + 48)))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;
  }
}

void sub_10002E258(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_10002E29C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_10002E2B8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

unsigned char *sub_10002E2D8(unsigned char *result, unsigned char *a2)
{
  *id result = 0;
  *a2 = 0;
  return result;
}

void sub_10002E2E8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

uint64_t SYDKeyID.key.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SYDKeyID.storeIdentifier.getter()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier);
  swift_bridgeObjectRetain();
  return v1;
}

id SYDKeyID.__allocating_init(key:storeIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = (char *)objc_allocWithZone(v4);
  uint64_t v10 = &v9[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key];
  *(void *)uint64_t v10 = a1;
  *((void *)v10 + 1) = a2;
  uint64_t v11 = &v9[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier];
  *(void *)uint64_t v11 = a3;
  *((void *)v11 + 1) = a4;
  v13.receiver = v9;
  v13.super_class = v4;
  return objc_msgSendSuper2(&v13, "init");
}

id SYDKeyID.init(key:storeIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = &v4[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key];
  *(void *)id v5 = a1;
  *((void *)v5 + 1) = a2;
  id v6 = &v4[OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier];
  *(void *)id v6 = a3;
  *((void *)v6 + 1) = a4;
  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for SYDKeyID();
  return objc_msgSendSuper2(&v8, "init");
}

uint64_t SYDKeyID.description.getter()
{
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key);
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_key + 8);
  swift_bridgeObjectRetain();
  v3._countAndFlagsBits = v1;
  v3._object = v2;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._object = (void *)0x8000000100048980;
  v4._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v4);
  uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier);
  id v6 = *(void **)(v0 + OBJC_IVAR____TtC13syncdefaultsd8SYDKeyID_storeIdentifier + 8);
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = v5;
  v7._object = v6;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  v8._countAndFlagsBits = 62;
  v8._object = (void *)0xE100000000000000;
  String.append(_:)(v8);
  return 0x3D79656B3CLL;
}

uint64_t SYDKeyID.hash.getter()
{
  sub_1000043D0();
  uint64_t v0 = StringProtocol.hash.getter();
  return StringProtocol.hash.getter() ^ v0;
}

id SYDKeyID.copy(with:)@<X0>(void *a1@<X8>)
{
  a1[3] = type metadata accessor for SYDKeyID();
  *a1 = v3;
  return v3;
}

id SYDKeyID.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

void SYDKeyID.init()()
{
}

id SYDKeyID.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SYDKeyID();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_10002E768()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Not syncing TCC-disabled store %@", v2, v3, v4, v5, v6);
}

void sub_10002E7D0()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Not syncing store that is disabled via NSUserDefaults: <(%@)>", v2, v3, v4, v5, v6);
}

void sub_10002E838()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Not syncing store that isn't used on this device: %@", v2, v3, v4, v5, v6);
}

void sub_10002E8A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E910(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002E980()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Explicitly disabling store %@", v2, v3, v4, v5, v6);
}

void sub_10002E9E8()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "No bundle identifiers for store %@", v2, v3, v4, v5, v6);
}

void sub_10002EA50()
{
  sub_100005FF8();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Found bundle identifiers for store %@: %@", v2, 0x16u);
}

void sub_10002EADC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EB14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EB4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002EB84(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004ED8((void *)&_mh_execute_header, a2, a3, "Installed apps changed. Clearing cached store bundle map. Notification=%@", a5, a6, a7, a8, 2u);
}

void sub_10002EBF4()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Registering with sync bubble", v2, v3, v4, v5, v6);
}

void sub_10002EC28()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Resuming server", v2, v3, v4, v5, v6);
}

void sub_10002EC5C()
{
  sub_100009948(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Removing client connection %@", v2, v3, v4, v5, v6);
}

void sub_10002ECC4()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "No database account identifier and not logged-in", v2, v3, v4, v5, v6);
}

void sub_10002ECF8()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Database has no account, but the user is now logged in. Setting account identifier and marking everything as needing to be uploaded.", v2, v3, v4, v5, v6);
}

void sub_10002ED2C()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "No longer logged into an account", v2, v3, v4, v5, v6);
}

void sub_10002ED60()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Account in database is the same as logged-in account", v2, v3, v4, v5, v6);
}

void sub_10002ED94(uint64_t a1)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  sub_100015718();
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Account in database (%@) is different from the logged-in account (%@)", (uint8_t *)&v2, 0x16u);
}

void sub_10002EE14(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  sub_100015718();
  sub_10000E23C((void *)&_mh_execute_header, v1, v2, "Not processing account changes for %@ due to error getting account identifier: %@", (void)v3, DWORD2(v3));
}

void sub_10002EE88()
{
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Current logged in account identifier: %@", v2, v3, v4, v5, v6);
}

void sub_10002EF00()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Couldn't find any application identifiers for store identifiers: %@", v2, v3, v4, v5, v6);
}

void sub_10002EF68()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Should not lazily create sync manager %@", v2, v3, v4, v5, v6);
}

void sub_10002EFD0()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Error ensuring KVS directory has the right attributes: %@", v2, v3, v4, v5, v6);
}

void sub_10002F038()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Error ensuring KVS directory exists: %@", v2, v3, v4, v5, v6);
}

void sub_10002F0A0(uint64_t a1)
{
  int v2 = 138412546;
  uint64_t v3 = a1;
  sub_100015718();
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "Error checking if files exist after attempted daemon container migration: oldFileError=%@ newFileError=%@", (uint8_t *)&v2, 0x16u);
}

void sub_10002F120()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Unrelated error migrating to daemon container while trying to create sync manager: %@", v2, v3, v4, v5, v6);
}

void sub_10002F188()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Neither the migrated nor non-migrated store files exist after migration: %@", v2, v3, v4, v5, v6);
}

void sub_10002F1F0()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Both the migrated and non-migrated store files exist after migration: %@", v2, v3, v4, v5, v6);
}

void sub_10002F258()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Failed to migrate store to daemon container while creating sync manager: %@", v2, v3, v4, v5, v6);
}

void sub_10002F2C0()
{
  sub_100005FF8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error getting old store URL, not migrating: %@", v1, 0xCu);
}

void sub_10002F334()
{
  sub_100005FF8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Couldn't get store URL to initialize sync manager: %@", v1, 0xCu);
}

void sub_10002F3A8()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Initializing known sync managers", v2, v3, v4, v5, v6);
}

void sub_10002F3DC()
{
  sub_100009948(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Initializing known sync managers for persona %@", v2, v3, v4, v5, v6);
}

void sub_10002F444()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "No persona unique string, moving on...", v2, v3, v4, v5, v6);
}

void sub_10002F478()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Checking to make sure persona still exists for sync manager %@", v2, v3, v4, v5, v6);
}

void sub_10002F4E0()
{
  sub_100006020();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Tried to use test server, but not compiling for tests", v1, 2u);
}

void sub_10002F520()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Registering for periodic analytics XPC activity", v2, v3, v4, v5, v6);
}

void sub_10002F554()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Setting periodic analytics XPC activity criteria", v2, v3, v4, v5, v6);
}

void sub_10002F588()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Checking in for periodic analytics XPC activity", v2, v3, v4, v5, v6);
}

void sub_10002F5BC()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Sending periodic analytics", v2, v3, v4, v5, v6);
}

void sub_10002F5F0()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "UMUserSyncStakeholder willSwitchUser", v2, v3, v4, v5, v6);
}

void sub_10002F624()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Found sync manager with pending changes to upload", v2, v3, v4, v5, v6);
}

void sub_10002F658()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "UMUserSyncStakeholder uploadContent", v2, v3, v4, v5, v6);
}

void sub_10002F68C()
{
  sub_100009948(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Finished uploading pending changes in sync bubble for %@", v2, v3, v4, v5, v6);
}

void sub_10002F6F4()
{
  sub_100009948(__stack_chk_guard);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  sub_100015718();
  sub_10000E23C((void *)&_mh_execute_header, v1, v2, "Error uploading pending changes in sync bubble for %@: %@", (void)v3, DWORD2(v3));
}

void sub_10002F764()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "All sync manager uploads have finished. Ending sync task.", v2, v3, v4, v5, v6);
}

void sub_10002F798()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error unarchiving server record: %@", v2, v3, v4, v5, v6);
}

void sub_10002F800(void *a1)
{
  uint64_t v1 = [a1 recordID];
  sub_100005FF8();
  sub_100010A14((void *)&_mh_execute_header, v2, v3, "No encoded data for new server record %@", v4, v5, v6, v7, v8);
}

void sub_10002F884(void *a1, void *a2, NSObject *a3)
{
  uint64_t v6 = objc_msgSend(a1, "syd_shortDescription");
  uint64_t v7 = objc_msgSend(a2, "syd_shortDescription");
  uint8_t v8 = objc_msgSend(a1, "syd_shortDescription");
  int v9 = 138412802;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2112;
  id v14 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Not replacing local system fields record for %@: current=%@ other=%@", (uint8_t *)&v9, 0x20u);
}

void sub_10002F968(void *a1, void *a2, NSObject *a3)
{
  uint64_t v6 = [a1 recordID];
  uint64_t v7 = objc_msgSend(v6, "syd_shortDescription");
  uint8_t v8 = objc_msgSend(a2, "syd_shortDescription");
  int v9 = objc_msgSend(a1, "syd_shortDescription");
  int v10 = 138412802;
  __int16 v11 = v7;
  __int16 v12 = 2112;
  __int16 v13 = v8;
  __int16 v14 = 2112;
  id v15 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Replacing local system fields record for %@: current=%@ other=%@", (uint8_t *)&v10, 0x20u);
}

void sub_10002FA64(void *a1)
{
  uint64_t v1 = [a1 recordID];
  uint64_t v2 = objc_msgSend(v1, "syd_shortDescription");
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v3, v4, "No current system fields record for %@", v5, v6, v7, v8, v9);
}

void sub_10002FB00(void *a1)
{
  uint64_t v1 = [a1 recordID];
  uint64_t v2 = objc_msgSend(v1, "syd_shortDescription");
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v3, v4, "No current modification date on system fields record for %@", v5, v6, v7, v8, v9);
}

void sub_10002FB9C(void *a1)
{
  uint64_t v1 = [a1 recordID];
  uint64_t v2 = objc_msgSend(v1, "syd_shortDescription");
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v3, v4, "Server record is newer than current system fields record for %@", v5, v6, v7, v8, v9);
}

void sub_10002FC38()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error decoding value data from record: %@", v2, v3, v4, v5, v6);
}

void sub_10002FCA0()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Replacing local value with value from record", v2, v3, v4, v5, v6);
}

void sub_10002FCD4()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "No current valueModificationDate", v2, v3, v4, v5, v6);
}

void sub_10002FD08()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Record value modification date is greater than local value", v2, v3, v4, v5, v6);
}

void sub_10002FD3C()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Record value modification date is exactly the same, but the server record is newer", v2, v3, v4, v5, v6);
}

void sub_10002FD70(void *a1)
{
  uint64_t v1 = [a1 recordID];
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v2, v3, "No file URL for value data asset in %@", v4, v5, v6, v7, v8);
}

void sub_10002FDF4()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error loading data from asset: %@", v2, v3, v4, v5, v6);
}

void sub_10002FE5C(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a1 recordType];
  uint8_t v6 = [a2 recordType];
  sub_100016F8C();
  uint64_t v9 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Trying to merge data from a record of a different type (%@) from this key value record type (%@)", v8, 0x16u);
}

void sub_10002FF14(void *a1)
{
  uint64_t v1 = [a1 recordType];
  sub_100005FF8();
  sub_100016F6C((void *)&_mh_execute_header, v2, v3, "Trying to merge data from an unknown record type: %@", v4, v5, v6, v7, v8);
}

void sub_10002FF98(void *a1)
{
  uint64_t v1 = [a1 key];
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v2, v3, "Merging data from record to %{private}@", v4, v5, v6, v7, v8);
}

void sub_10003001C(void *a1)
{
  uint64_t v1 = [a1 recordID];
  sub_100005FF8();
  sub_100010A14((void *)&_mh_execute_header, v2, v3, "Somehow we got to a point where we're creating a record for %@, but we have no data. Bailing", v4, v5, v6, v7, v8);
}

void sub_1000300A0(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a1 recordID];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2048;
  id v9 = [a2 length];
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Going to use an asset for %@ because the data is %ld bytes", (uint8_t *)&v6, 0x16u);
}

void sub_100030158()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error generating plist value: %@", v2, v3, v4, v5, v6);
}

void sub_1000301C0(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 recordID];
  uint8_t v6 = [v5 recordName];
  uint64_t v7 = [a2 recordType];
  sub_100016F8C();
  __int16 v11 = v6;
  __int16 v12 = v8;
  uint64_t v13 = v9;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Expected record type %@ for record name %@, but server record had record type %@", v10, 0x20u);
}

void sub_1000302A0(void *a1)
{
  uint64_t v1 = [a1 recordID];
  sub_100005FF8();
  sub_100016F6C((void *)&_mh_execute_header, v2, v3, "Could not get key from record %@", v4, v5, v6, v7, v8);
}

void sub_100030324(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error adding notification request: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10003039C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Requesting notification authorization", v1, 2u);
}

void sub_1000303E0(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Requested notification authorization, granted=%d", (uint8_t *)v2, 8u);
}

void sub_10003045C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error requesting notification authorization: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000304D4()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getUNMutableNotificationContentClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYDUserNotifications.m", 20, @"Unable to find class %s", "UNMutableNotificationContent");

  __break(1u);
}

void sub_100030550(void *a1)
{
  int v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *UserNotificationsLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SYDUserNotifications.m", 19, @"%s", *a1);

  __break(1u);
}

void sub_1000305D0()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getUNNotificationRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYDUserNotifications.m", 21, @"Unable to find class %s", "UNNotificationRequest");

  __break(1u);
}

void sub_10003064C()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getUNUserNotificationCenterClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SYDUserNotifications.m", 22, @"Unable to find class %s", "UNUserNotificationCenter");

  __break(1u);
}

void sub_1000306C8()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Found KVS container directory: %@", v2, v3, v4, v5, v6);
}

void sub_100030730()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Failed to get path from containermanager: %@", v2, v3, v4, v5, v6);
}

void sub_100030798()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "No sandbox token", v2, v3, v4, v5, v6);
}

void sub_1000307CC(NSObject *a1)
{
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100005FF8();
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Error consuming sandbox token: %s", v3, 0xCu);
}

void sub_10003085C()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Consuming sandbox token %s", v2, v3, v4, v5, v6);
}

void sub_1000308C4()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Got container path from containermanager: %s", v2, v3, v4, v5, v6);
}

void sub_10003092C()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Found old KVS container directory: %@", v2, v3, v4, v5, v6);
}

void sub_100030994()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Failed to get Library directory from NSFileManager: %@", v2, v3, v4, v5, v6);
}

void sub_1000309FC()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Falling back to NSFileManager to get the Library directory", v2, v3, v4, v5, v6);
}

void sub_100030A30()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Not migrating data-separated persona to daemon container", v2, v3, v4, v5, v6);
}

void sub_100030A64()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Finished migrating to daemon container if necessary", v2, v3, v4, v5, v6);
}

void sub_100030A98()
{
  sub_10000604C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Failed to migrate to daemon container: %@", v2, v3, v4, v5, v6);
}

void sub_100030B00()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Already migrated to daemon container", v2, v3, v4, v5, v6);
}

void sub_100030B34()
{
  sub_10000604C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Failed to write sentinel file: %@", v2, v3, v4, v5, v6);
}

void sub_100030B9C()
{
  sub_10000604C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Failed to create new KVS directory while migrating: %@", v2, v3, v4, v5, v6);
}

void sub_100030C04()
{
  sub_10000604C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Failed to get the KVS directory: %@", v2, v3, v4, v5, v6);
}

void sub_100030C6C()
{
  sub_10000604C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Failed to get the old KVS directory: %@", v2, v3, v4, v5, v6);
}

void sub_100030CD4()
{
  sub_10000604C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error checking if migration sentinel exists: %@", v2, v3, v4, v5, v6);
}

void sub_100030D3C()
{
  sub_10000604C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Failed to get the migration complete file URL: %@", v2, v3, v4, v5, v6);
}

void sub_100030DA4()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Will migrate to daemon container if necessary", v2, v3, v4, v5, v6);
}

void sub_100030DD8()
{
  sub_100007604();
  sub_10000E23C((void *)&_mh_execute_header, v0, v1, "Error enumerating old KVS directory for URL %@: %@");
}

void sub_100030E40()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Restored saved persona context %@", v2, v3, v4, v5, v6);
}

void sub_100030EA8()
{
  sub_100007604();
  sub_10000E23C((void *)&_mh_execute_header, v0, v1, "Error restoring saved persona context %@: %@");
}

void sub_100030F10()
{
  sub_100007604();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Adopted persona %@ and copied context %@");
}

void sub_100030F78()
{
  sub_100007604();
  sub_10000E23C((void *)&_mh_execute_header, v0, v1, "Error adopting persona %@: %@");
}

void sub_100030FE0()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error copying current persona context: %@", v2, v3, v4, v5, v6);
}

void sub_100031048()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "About to adopt persona %@", v2, v3, v4, v5, v6);
}

void sub_1000310B0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031120(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031190()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "No bundle, no TCC", v2, v3, v4, v5, v6);
}

void sub_1000311C4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100031230()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Starting to listen to TCC access change notifications", v2, v3, v4, v5, v6);
}

void sub_100031264()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Invalidating cached disabled store identifiers", v2, v3, v4, v5, v6);
}

void sub_100031298()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Cancelling TCC access changed notifications", v2, v3, v4, v5, v6);
}

void sub_1000312CC()
{
  sub_100007604();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Initializing store with container=%@ coreDataStore=%@");
}

void sub_100031334()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Initializing sync engine", v2, v3, v4, v5, v6);
}

void sub_100031368()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Not initializing sync engine due to error getting sync engine state from database: %@", v2, v3, v4, v5, v6);
}

void sub_1000313D0()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Failed to unarchive state serialization: %@", v2, v3, v4, v5, v6);
}

void sub_100031438()
{
  sub_100005FF8();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Unable to initialize engine: %@", v1, 0xCu);
}

void sub_1000314AC()
{
  sub_10000E1B0();
  sub_10000E23C((void *)&_mh_execute_header, v0, v1, "Unable to get or create value for key %{private}@ in %@");
}

void sub_10003151C(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 141558275;
  uint64_t v4 = 1752392040;
  __int16 v5 = 2113;
  uint64_t v6 = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF KVS: Trying to set a nil object for key <(%{private, mask.hash}@)>, but we should have early returned above", (uint8_t *)&v3, 0x16u);
}

void sub_1000315AC()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "alwaysSaveRecordZones=YES, saving record zone", v2, v3, v4, v5, v6);
}

void sub_1000315E0()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Not adding record to sync engine because we were told not to sync", v2, v3, v4, v5, v6);
}

void sub_100031614()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error saving value for key: %@", v2, v3, v4, v5, v6);
}

void sub_10003167C()
{
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "We had no keys in %@, so let's save the zone", v2, v3, v4, v5, v6);
}

void sub_1000316E8()
{
  sub_100006020();
  sub_10000DF04((void *)&_mh_execute_header, v0, v1, "Unable to check how many key values we had in this store. Moving on.", v2, v3, v4, v5, v6);
}

void sub_10003171C()
{
  sub_10000E184();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Not setting identical value for key <(%{private, mask.hash}@)> in store <(%@)>", v1, 0x20u);
}

void sub_10003179C()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error fetching existing key value: %@", v2, v3, v4, v5, v6);
}

void sub_100031804(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v3 = (objc_class *)objc_opt_class();
    NSStringFromClass(v3);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"nil";
  }
  sub_1000098DC();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x2Au);
  if (v1) {
}
  }

void sub_1000318F0()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error marking key-value as deleted: %@", v2, v3, v4, v5, v6);
}

void sub_100031958()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Not adding record to sync engine to remove because we were told not to sync", v2, v3, v4, v5, v6);
}

void sub_10003198C()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error fetching while removing value for key: %@", v2, v3, v4, v5, v6);
}

void sub_1000319F4()
{
  sub_10000E184();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Removing object for key <(%{private, mask.hash}@)> in store <(%@)>", v1, 0x20u);
}

void sub_100031A6C()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Sync was cancelled during fetch changes. Not saving changes", v2, v3, v4, v5, v6);
}

void sub_100031AA0()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Synchronizing with cloud", v2, v3, v4, v5, v6);
}

void sub_100031AD4()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Failed to load engine when saving pending changes: %@", v2, v3, v4, v5, v6);
}

void sub_100031B3C()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Saving all pending changes to cloud", v2, v3, v4, v5, v6);
}

void sub_100031B70()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Failed to load engine when fetching changes: %@", v2, v3, v4, v5, v6);
}

void sub_100031BD8()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Fetching all changes from cloud", v2, v3, v4, v5, v6);
}

void sub_100031C0C()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Found ignorable error fetching records: %@", v2, v3, v4, v5, v6);
}

void sub_100031C74()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error fetching all zones for deleting data from cloud: %@", v2, v3, v4, v5, v6);
}

void sub_100031CDC()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error deleting deleting data from cloud: %@", v2, v3, v4, v5, v6);
}

void sub_100031D44()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error getting store identifiers from database while trying to mark key values as needing to be uploaded: %@", v2, v3, v4, v5, v6);
}

void sub_100031DAC()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Marking all key values as needing to be uploaded for all stores", v2, v3, v4, v5, v6);
}

void sub_100031DE0()
{
  sub_100007604();
  sub_10000E23C((void *)&_mh_execute_header, v0, v1, "Error fetching record names from database when marking key values as needing to be uploaded for %@: %@");
}

void sub_100031E48()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Marking all key values as needing to be uploaded for store (%@)", v2, v3, v4, v5, v6);
}

void sub_100031EB0()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Not adding database change to sync engine because we were told not to sync for store: %@", v2, v3, v4, v5, v6);
}

void sub_100031F18()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Not adding record to sync engine because we were told not to sync for store: %@", v2, v3, v4, v5, v6);
}

void sub_100031F80()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Not adding sync anchor record to sync engine because we were told not to sync for store: %@", v2, v3, v4, v5, v6);
}

void sub_100031FE8()
{
  sub_10000E1B0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Setting new container %@ for %@", v1, 0x16u);
}

void sub_100032060()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Deleting sync engine metadata for %@", v2, v3, v4, v5, v6);
}

void sub_1000320C8(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "syd_shortDescription");
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v2, v3, "Returning record to save %@", v4, v5, v6, v7, v8);
}

void sub_10003214C()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error unarchiving server sync anchor record: %@", v2, v3, v4, v5, v6);
}

void sub_1000321B4()
{
  sub_100007604();
  sub_10000E23C((void *)&_mh_execute_header, v0, v1, "Error getting sync anchor data for %@: %@");
}

void sub_10003221C()
{
  sub_100007604();
  sub_10000E23C((void *)&_mh_execute_header, v0, v1, "Error getting key value for %@ when returning record to sync engine: %@");
}

void sub_100032284(void *a1)
{
  os_log_t v1 = objc_msgSend(a1, "syd_shortDescription");
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v2, v3, "Generating record to save for %@", v4, v5, v6, v7, v8);
}

void sub_100032308(id *a1)
{
  os_log_t v1 = [*a1 recordID];
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v2, v3, "Did save sync anchor record %@", v4, v5, v6, v7, v8);
}

void sub_100032390(void *a1)
{
  os_log_t v1 = [a1 recordID];
  uint64_t v2 = objc_msgSend(v1, "syd_shortDescription");
  sub_100005FF8();
  sub_100010A14((void *)&_mh_execute_header, v3, v4, "No keyValue by record name after saving %@", v5, v6, v7, v8, v9);
}

void sub_10003242C()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error saving new server system fields record: %@", v2, v3, v4, v5, v6);
}

void sub_100032494()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error fetching key value after saving record: %@", v2, v3, v4, v5, v6);
}

void sub_1000324FC(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "syd_shortDescription");
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v2, v3, "Did save keyValue record %@", v4, v5, v6, v7, v8);
}

void sub_100032580()
{
  sub_100006020();
  sub_10000DF04((void *)&_mh_execute_header, v0, v1, "No server record for conflict on sync anchor", v2, v3, v4, v5, v6);
}

void sub_1000325B4()
{
  sub_10000991C();
  uint64_t v2 = objc_msgSend(v1, "syd_shortDescription");
  sub_100009954();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Unknown error saving record %@: %@", v3, 0x16u);
}

void sub_100032650()
{
  sub_100006020();
  sub_10000DF04((void *)&_mh_execute_header, v0, v1, "No value modification date from server after asset conflict", v2, v3, v4, v5, v6);
}

void sub_100032684()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error fetching key-value from database trying to resolve a conflict on a server record with an asset: %@", v2, v3, v4, v5, v6);
}

void sub_1000326EC()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error saving key value after taking server record: %@", v2, v3, v4, v5, v6);
}

void sub_100032754(void *a1)
{
  uint64_t v1 = [a1 recordID];
  uint64_t v2 = objc_msgSend(v1, "syd_shortDescription");
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v3, v4, "Not merging data from server record %@ because it has an asset", v5, v6, v7, v8, v9);
}

void sub_1000327F0(void *a1)
{
  uint64_t v1 = [a1 recordID];
  uint64_t v2 = objc_msgSend(v1, "syd_shortDescription");
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v3, v4, "Resolving conflict for record %@", v5, v6, v7, v8, v9);
}

void sub_10003288C(void *a1)
{
  uint64_t v1 = objc_msgSend(a1, "syd_shortDescription");
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v2, v3, "Conflict saving key-value record %@", v4, v5, v6, v7, v8);
}

void sub_100032910(void *a1)
{
  uint64_t v1 = [a1 recordID];
  uint64_t v2 = objc_msgSend(v1, "syd_shortDescription");
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v3, v4, "Couldn't find keyValue for record %@ after CKErrorUnknownItem", v5, v6, v7, v8, v9);
}

void sub_1000329AC()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Unable to save key value to database when processing CKErrorUnknownItem: %@", v2, v3, v4, v5, v6);
}

void sub_100032A14()
{
  sub_10000991C();
  uint64_t v1 = [v0 recordID];
  uint64_t v2 = objc_msgSend(v1, "syd_shortDescription");
  sub_100009954();
  sub_10002194C((void *)&_mh_execute_header, v3, v4, "Error fetching keyValue handling CKErrorUnknownItem for record %@: %@", v5, v6, v7, v8, v9);
}

void sub_100032AB0()
{
  sub_100007604();
  sub_10000E23C((void *)&_mh_execute_header, v0, v1, "Error clearing server system fields for records in %@: %@");
}

void sub_100032B18(id *a1)
{
  os_log_t v1 = objc_msgSend(*a1, "syd_shortDescription");
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v2, v3, "Deleted sync anchor record %@", v4, v5, v6, v7, v8);
}

void sub_100032BA0()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error removing key-value from database after it was deleted in the cloud: %@", v2, v3, v4, v5, v6);
}

void sub_100032C08()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Removing key-value from local database after deleting record from the cloud", v2, v3, v4, v5, v6);
}

void sub_100032C3C()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Client set a value for key-value while we were deleting it from the cloud", v2, v3, v4, v5, v6);
}

void sub_100032C70()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error fetching key-value after deleting record from the cloud: %@", v2, v3, v4, v5, v6);
}

void sub_100032CD8(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "syd_shortDescription");
  sub_100005FF8();
  sub_10002194C((void *)&_mh_execute_header, v2, v3, "Error deleting record %@: %@", v4, v5, v6, v7, v8);
}

void sub_100032D7C()
{
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Fetched sync anchor record %@", v2, v3, v4, v5, v6);
}

void sub_100032DE8(void *a1)
{
  uint64_t v1 = [a1 error];
  sub_100005FF8();
  sub_100010A14((void *)&_mh_execute_header, v2, v3, "Failed to archive sync anchor record: %@", v4, v5, v6, v7, v8);
}

void sub_100032E6C()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Failed to save sync anchor system fields: %@", v2, v3, v4, v5, v6);
}

void sub_100032ED4(void *a1)
{
  uint64_t v1 = [a1 recordID];
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v2, v3, "Will save sync anchor server record: %@", v4, v5, v6, v7, v8);
}

void sub_100032F58()
{
  sub_10000991C();
  uint64_t v1 = v0;
  uint64_t v2 = [v0 pendingFetchedRecords];
  [v2 count];
  uint64_t v3 = [v1 pendingDeletedRecordIDs];
  [v3 count];
  sub_100021934();
  sub_1000098DC();
  _os_log_debug_impl(v4, v5, v6, v7, v8, 0x20u);
}

void sub_100033024()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "No pending records to process", v2, v3, v4, v5, v6);
}

void sub_100033058()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Failed to get key values from database to process fetched records: %@", v2, v3, v4, v5, v6);
}

void sub_1000330C0()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Failed to save key values from fetched records: %@", v2, v3, v4, v5, v6);
}

void sub_100033128()
{
  sub_10000991C();
  id v3 = [v2 count];
  [v1 count];
  int v4 = 134218498;
  id v5 = v3;
  sub_100021934();
  uint64_t v6 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Expected a dictionary with %ld values but only received %ld values: %@", (uint8_t *)&v4, 0x20u);
}

void sub_1000331D0()
{
  sub_100007604();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Telling sync engine to delete duplicate record %@ and save the chosen record %@");
}

void sub_100033238(void *a1)
{
  os_log_t v1 = [a1 recordID];
  id v2 = [v1 recordName];
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v3, v4, "Local record was created first, choosing local record name %@", v5, v6, v7, v8, v9);
}

void sub_1000332D4(void *a1)
{
  os_log_t v1 = [a1 recordID];
  id v2 = [v1 recordName];
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v3, v4, "Remote record was created earlier, choosing remote record name %@", v5, v6, v7, v8, v9);
}

void sub_100033370(void *a1, void *a2, NSObject *a3)
{
  uint64_t v6 = [a1 recordName];
  uint64_t v7 = [a2 recordID];
  uint64_t v8 = [v7 recordName];
  uint8_t v9 = [a1 key];
  int v10 = 138412803;
  __int16 v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v8;
  __int16 v14 = 2113;
  id v15 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Local record name (%@) and fetched record name (%@) do not match for key (%{private}@)", (uint8_t *)&v10, 0x20u);
}

void sub_100033470()
{
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "KeyValue record was deleted %@", v2, v3, v4, v5, v6);
}

void sub_1000334DC()
{
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Sync anchor record was deleted: %@", v2, v3, v4, v5, v6);
}

void sub_100033548()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error archiving metadata serialization: %@", v2, v3, v4, v5, v6);
}

void sub_1000335B0()
{
  sub_100009948(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Deleted zone %@ and re-uploading key values", v2, v3, v4, v5, v6);
}

void sub_100033618()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Excluding zones from fetching changes %@", v2, v3, v4, v5, v6);
}

void sub_100033680()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Modifying scope of fetch changes options with new zones %@", v2, v3, v4, v5, v6);
}

void sub_1000336E8(id *a1)
{
  uint64_t v1 = [*a1 storeIdentifiersWithChangedValuesDuringFetchChanges];
  [v1 count];
  sub_100005FF8();
  sub_10000602C((void *)&_mh_execute_header, v2, v3, "Will post store-specific Darwin notification for %ld stores", v4, v5, v6, v7, v8);
}

void sub_100033774(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000337EC()
{
  sub_100009948(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Deleting local persisted data for %@", v2, v3, v4, v5, v6);
}

void sub_100033854()
{
  sub_100006020();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Received first unlock notification for deallocated sync manager", v1, 2u);
}

void sub_100033894()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Still not unlocked since boot", v2, v3, v4, v5, v6);
}

void sub_1000338C8()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Still unable to initialize engine after first unlock notification: %@", v2, v3, v4, v5, v6);
}

void sub_100033930()
{
  sub_100005FF8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Couldn't find account for persona %@", v1, 0xCu);
}

void sub_1000339A4(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 identifier];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint8_t v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Found account for persona %@: %@", (uint8_t *)&v6, 0x16u);
}

void sub_100033A58()
{
  sub_100005FF8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error getting all AppleAccounts: %@", v1, 0xCu);
}

void sub_100033ACC()
{
  sub_100005FF8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Getting account for persona %@", v1, 0xCu);
}

void sub_100033B40()
{
  sub_100005FF8();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Error getting account for persona %@: %@", v2, 0x16u);
}

void sub_100033BC4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Using primary Apple account for current persona", v1, 2u);
}

void sub_100033C08(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Getting account for current persona", v1, 2u);
}

void sub_100033C4C()
{
  sub_100006020();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Couldn't create SecTask from audit token", v1, 2u);
}

void sub_100033C8C()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error getting application identifier: %@", v2, v3, v4, v5, v6);
}

void sub_100033CF4()
{
  sub_100006020();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "BUG IN KVS: Attempting to get the applicationIdentifier but our xpcConnection is nil", v1, 2u);
}

void sub_100033D34(id *a1, NSObject *a2)
{
  uint64_t v4 = [*a1 processName];
  uint64_t v5 = [*a1 storeID];
  int v6 = 138412546;
  uint64_t v7 = v4;
  __int16 v8 = 2112;
  uint8_t v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Process %@ is NOT entitled for store %@", (uint8_t *)&v6, 0x16u);
}

void sub_100033DFC()
{
  sub_10000991C();
  [v0 processIdentifier];
  sub_10000761C();
  sub_100010A34((void *)&_mh_execute_header, v1, v2, "Process %d is entitled for store %@ via %@", v3, v4, v5, v6, v7);
}

void sub_100033E80()
{
  sub_10000991C();
  [v0 processIdentifier];
  sub_10000761C();
  sub_100010A34((void *)&_mh_execute_header, v1, v2, "Process %d is entitled for store %@ via %@", v3, v4, v5, v6, v7);
}

void sub_100033F04()
{
  sub_10000991C();
  [v0 processIdentifier];
  sub_10000761C();
  sub_100010A34((void *)&_mh_execute_header, v1, v2, "Process %d is entitled for store %@ via %@", v3, v4, v5, v6, v7);
}

void sub_100033F88()
{
  sub_10000991C();
  [v0 processIdentifier];
  sub_10000761C();
  sub_100010A34((void *)&_mh_execute_header, v1, v2, "Process %d is entitled for store %@ via %@", v3, v4, v5, v6, v7);
}

void sub_10003400C()
{
  sub_10000991C();
  [v0 processIdentifier];
  sub_10000761C();
  sub_100010A34((void *)&_mh_execute_header, v1, v2, "Process %d is entitled for store %@ via %@", v3, v4, v5, v6, v7);
}

void sub_100034090()
{
  sub_100007604();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Handling setObject (%{private}@) for store=%@");
}

void sub_1000340F8()
{
  sub_100007604();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Handling removeObject (%{private}@) for store=%@");
}

void sub_100034160()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "No sync manager for store=%@", v2, v3, v4, v5, v6);
}

void sub_1000341C8(unint64_t a1, NSObject *a2)
{
  uint64_t v3 = sub_10000AC60(a1);
  sub_100005FF8();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "No sync manager for store type %@", v4, 0xCu);
}

void sub_10003425C()
{
  sub_10000991C();
  uint64_t v3 = sub_10000AC60(v2);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Handling sync for stores with type %@: %@", (uint8_t *)&v4, 0x16u);
}

void sub_100034308()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Fetching all store identifiers.", v2, v3, v4, v5, v6);
}

void sub_10003433C()
{
  sub_100006020();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF KVS: Connection is trying to fetch all store identifiers without the correct entitlement.", v1, 2u);
}

void sub_10003437C()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "BUG IN CLIENT OF KVS: Connection is trying to use an a sync status operation without the correct entitlement for store %@", v2, v3, v4, v5, v6);
}

void sub_1000343E4()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Unable to get changed keys: %@", v2, v3, v4, v5, v6);
}

void sub_10003444C()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Unable to get current change token: %@", v2, v3, v4, v5, v6);
}

void sub_1000344B4()
{
  sub_100006020();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Could not find change token URL to load change token", v1, 2u);
}

void sub_1000344F4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 storeID];
  uint64_t v4 = [v3 identifier];
  sub_100005FF8();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "KVS store has a symbolic link for its change token (%@)", v5, 0xCu);
}

void sub_1000345A0()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error loading change token from disk: %@", v2, v3, v4, v5, v6);
}

void sub_100034608()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Unable to determine if change token URL is a symbolic link: %@", v2, v3, v4, v5, v6);
}

void sub_100034670()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Could not find change token URL to save change token: %@", v2, v3, v4, v5, v6);
}

void sub_1000346D8()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error removing change token when setting nil change token: %@", v2, v3, v4, v5, v6);
}

void sub_100034740()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Removing change token from disk for %@", v2, v3, v4, v5, v6);
}

void sub_1000347A8()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error saving change token to disk: %@", v2, v3, v4, v5, v6);
}

void sub_100034810()
{
  sub_100009948(__stack_chk_guard);
  sub_10000DB90();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Error creating change token directory: %@", v2, v3, v4, v5, v6);
}

void sub_100034878()
{
  sub_100009948(__stack_chk_guard);
  sub_10000DB90();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Error saving change token to disk: %@", v2, v3, v4, v5, v6);
}

void sub_1000348E0()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Processing account changes", v2, v3, v4, v5, v6);
}

void sub_100034914()
{
  sub_10000E1C8(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "No store ID for sync manager change notification %@", v2, v3, v4, v5, v6);
}

void sub_10003497C()
{
  sub_10000E1C8(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "No sync manager for sync manager change notification %@", v2, v3, v4, v5, v6);
}

void sub_1000349E4()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error getting change token to send change dictionary: %@", v2, v3, v4, v5, v6);
}

void sub_100034A4C()
{
  sub_100005FF8();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Received notification for registered store ID %@ in %@");
}

void sub_100034AC4()
{
  sub_100009948(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Notifying client that account did change %@", v2, v3, v4, v5, v6);
}

void sub_100034B2C()
{
  sub_100009948(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Not notifying data-separated client about account change: %@", v2, v3, v4, v5, v6);
}

void sub_100034B94()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error getting change token to notify about account change: %@", v2, v3, v4, v5, v6);
}

void sub_100034BFC()
{
  sub_100007604();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Not processing did-change-value notification for store ID=%@ changedKeys=%@");
}

void sub_100034C64()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error getting sync manager to notify client of changes: %@", v2, v3, v4, v5, v6);
}

void sub_100034CCC()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error getting change token to send change dictionary for local change: %@", v2, v3, v4, v5, v6);
}

void sub_100034D34()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "BUG IN CLIENT OF KVS: Tried to access unknown store %@", v2, v3, v4, v5, v6);
}

void sub_100034D9C()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Bundle map might be out of date, clearing cache and trying again", v2, v3, v4, v5, v6);
}

void sub_100034DD0()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Failed to get the library directory when migrating: %@", v2, v3, v4, v5, v6);
}

void sub_100034E38()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Already migrated. High five. Not migrating again.", v2, v3, v4, v5, v6);
}

void sub_100034E6C()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Not migrating in multi-user mode.", v2, v3, v4, v5, v6);
}

void sub_100034EA0()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Did save migration state", v2, v3, v4, v5, v6);
}

void sub_100034ED4()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Error saving migration state: %@", v2, v3, v4, v5, v6);
}

void sub_100034F3C()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Set didMigrateFromPlists after reaching max failures", v2, v3, v4, v5, v6);
}

void sub_100034F70()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Failed to set didMigrateFromPlists after reaching max failures: %@", v2, v3, v4, v5, v6);
}

void sub_100034FD8()
{
  sub_100006020();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Reached maximum number of migration failures. Not migrating again.", v1, 2u);
}

void sub_100035018(__int16 a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Set new failed migration count %d", (uint8_t *)v2, 8u);
}

void sub_100035094()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Failed to set new failed migration count: %@", v2, v3, v4, v5, v6);
}

void sub_1000350FC()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error getting failed migration count: %@", v2, v3, v4, v5, v6);
}

void sub_100035164()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Error migrating all plists: %@", v2, v3, v4, v5, v6);
}

void sub_1000351CC()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Did not already migrate. Migrating now", v2, v3, v4, v5, v6);
}

void sub_100035200()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error checking if already migrated: %@", v2, v3, v4, v5, v6);
}

void sub_100035268()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Migrating all plists to Core Data if necessary", v2, v3, v4, v5, v6);
}

void sub_10003529C()
{
  sub_100006020();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "We should not migrate the non-personal persona", v1, 2u);
}

void sub_1000352DC(uint64_t a1, NSObject *a2, double a3)
{
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  double v7 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Migrating all (%lu) plists took %.2f seconds", (uint8_t *)&v4, 0x16u);
}

void sub_100035368(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(void *)(a1 + 4) = a2;
  sub_100026E9C((void *)&_mh_execute_header, a3, (uint64_t)a3, "About to migrate %lu possible plists", (uint8_t *)a1);
}

void sub_1000353A8()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Migrating all plists to store %@", v2, v3, v4, v5, v6);
}

void sub_100035410()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "No key-value store plist at %@, moving on.", v2, v3, v4, v5, v6);
}

void sub_100035478()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Deleted plist at %@", v2, v3, v4, v5, v6);
}

void sub_1000354E0()
{
  sub_100007604();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Error deleting plist at %@: %@", v1, 0x16u);
}

void sub_100035558()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Migrated plist at %@", v2, v3, v4, v5, v6);
}

void sub_1000355C0()
{
  sub_100007604();
  sub_10000E23C((void *)&_mh_execute_header, v0, v1, "Error migrating plist at %@: %@");
}

void sub_100035628()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Error saving transactional store when migrating plist: %@", v2, v3, v4, v5, v6);
}

void sub_100035690()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Error creating new transactional store for plist: %@", v2, v3, v4, v5, v6);
}

void sub_1000356F8()
{
  sub_100007604();
  sub_10000E23C((void *)&_mh_execute_header, v0, v1, "Error loading plist at %@: %@");
}

void sub_100035760(uint64_t a1, uint64_t a2, NSObject *a3, double a4)
{
  *(_DWORD *)a2 = 138412546;
  *(void *)(a2 + 4) = a1;
  *(_WORD *)(a2 + 12) = 2048;
  *(double *)(a2 + 14) = a4 * -1000.0;
  sub_100026EB4((void *)&_mh_execute_header, a2, a3, "Migrating plist for %@ took %.0f milliseconds", (uint8_t *)a2);
}

void sub_1000357B4()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Migrating plist for store %@", v2, v3, v4, v5, v6);
}

void sub_10003581C()
{
  sub_10000605C(__stack_chk_guard);
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error saving key value while migrating plist: %@", v2, v3, v4, v5, 2u);
}

void sub_100035888()
{
  sub_10000DB9C();
  sub_100026EB4((void *)&_mh_execute_header, v0, v1, "Using plist value for (%{private}@) in %@: no value in Core Data", v2);
}

void sub_1000358F8()
{
  sub_10000DB9C();
  sub_100026EB4((void *)&_mh_execute_header, v0, v1, "Not using plist value for (%{private}@) in %@", v2);
}

void sub_100035968()
{
  sub_10000605C(__stack_chk_guard);
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error fetching key value while migrating plist: %@", v2, v3, v4, v5, 2u);
}

void sub_1000359D4(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int v6 = 138412546;
  double v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Found value in plist that wasn't a dictionary (%@): %@", (uint8_t *)&v6, 0x16u);
}

void sub_100035A88(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 32);
  int v4 = 141558531;
  uint64_t v5 = 1752392040;
  __int16 v6 = 2113;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Migrating key <(%{private, mask.hash}@)> for store <(%@)>", (uint8_t *)&v4, 0x20u);
}

void sub_100035B28()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Plist at URL does not have a 'values' dictionary in it %@", v2, v3, v4, v5, v6);
}

void sub_100035B90()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "File at URL is not a plist %@", v2, v3, v4, v5, v6);
}

void sub_100035BF8()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error checking plist file size to determine if we should use a transaction: %@", v2, v3, v4, v5, v6);
}

void sub_100035C60()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Finding all store plists on disk", v2, v3, v4, v5, v6);
}

void sub_100035C94(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 bundleIdentifier];
  sub_100005FF8();
  sub_100026E9C((void *)&_mh_execute_header, a2, v4, "No KVS entitlements for bundle %@", v5);
}

void sub_100035D20(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 bundleIdentifier];
  sub_100005FF8();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "No bundle identifier for bundle %@", v4, 0xCu);
}

void sub_100035DB4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 bundleIdentifier];
  sub_100005FF8();
  sub_100026E9C((void *)&_mh_execute_header, a2, v4, "Using uncontainerized Library directory for %@", v5);
}

void sub_100035E40(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 bundleIdentifier];
  sub_100005FF8();
  sub_100026E9C((void *)&_mh_execute_header, a2, v4, "Checking for plist URLs from bundle: %@", v5);
}

void sub_100035ECC()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Finding plists for known daemons", v2, v3, v4, v5, v6);
}

void sub_100035F00(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error decoding plist value data: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100035F78(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error generating plist value: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100035FF0()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Initialized Core Data store %@", v2, v3, v4, v5, v6);
}

void sub_100036058()
{
  sub_100006020();
  sub_10000DF04((void *)&_mh_execute_header, v0, v1, "Error trying to access a key value with an empty store identifier", v2, v3, v4, v5, v6);
}

void sub_10003608C()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Found multiple key values for the same key (%@)", v2, v3, v4, v5, v6);
}

void sub_1000360F4()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Short circuiting due to error fetching managedKeyValuesForKeyIDs: %@", v2, v3, v4, v5, v6);
}

void sub_10003615C()
{
  sub_100007604();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Fetching keyValue for record name (%@) in store <(%@)>");
}

void sub_1000361C4()
{
  sub_10000DF34(__stack_chk_guard);
  sub_10000E1B0();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "No keyValue for record name (%@) in store <(%@)>");
}

void sub_10003622C()
{
  sub_10000DF34(__stack_chk_guard);
  sub_10000E1B0();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Existing keyValue for record name (%@) in store <(%@)>");
}

void sub_100036294(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 key];
  sub_10002E274();
  uint64_t v7 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "SYDManagedKeyValue for key <(%{private, mask.hash}@)> is missing a store identifier. Manually setting store identifier <(%@)>", v6, 0x20u);
}

void sub_100036338(unsigned char *a1, unsigned char *a2)
{
  sub_10002E2D8(a1, a2);
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Deleting managed object that would go over quota", v3, 2u);
}

void sub_100036370(unsigned char *a1, unsigned char *a2)
{
  sub_10002E2D8(a1, a2);
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Reverting managed object that would go over quota", v3, 2u);
}

void sub_1000363A8()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error fetching managed key values while saving: %@", v2, v3, v4, v5, v6);
}

void sub_100036410()
{
  sub_10002E274();
  sub_10002E2B8((void *)&_mh_execute_header, v0, v1, "Removing keyValue for key <(%{private, mask.hash}@)> in store <(%@)>");
}

void sub_10003647C()
{
  sub_10000DF34(__stack_chk_guard);
  sub_10000E184();
  sub_10002E2B8((void *)&_mh_execute_header, v0, v1, "No managed key value to delete for key <(%{private, mask.hash}@)> in store <(%@)>");
}

void sub_1000364E4()
{
  sub_10000DF34(__stack_chk_guard);
  sub_10000E184();
  sub_10002E2B8((void *)&_mh_execute_header, v0, v1, "Deleting managed key value for key <(%{private, mask.hash}@)> in store <(%@)>");
}

void sub_10003654C()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error fetching existing key value when removing a key value: %@", v2, v3, v4, v5, v6);
}

void sub_1000365B4()
{
  sub_100007604();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Removing keyValue for record name <(%@)> in store <(%@)>");
}

void sub_10003661C()
{
  sub_10000DF34(__stack_chk_guard);
  sub_10000E1B0();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "No managed key value to delete for record name <(%@)> in store <(%@)>");
}

void sub_100036684()
{
  sub_10000DF34(__stack_chk_guard);
  sub_10000E1B0();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Deleting managed key value for record name <(%@)> in store <(%@)>");
}

void sub_1000366EC()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Fetching sync anchor for (%@)", v2, v3, v4, v5, v6);
}

void sub_100036754()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "No store when fetching sync anchor data", v2, v3, v4, v5, v6);
}

void sub_100036788()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error fetching sync anchor: %@", v2, v3, v4, v5, v6);
}

void sub_1000367F0()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Clearing sync anchor for (%@)", v2, v3, v4, v5, v6);
}

void sub_100036858()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Saving sync anchor for (%@)", v2, v3, v4, v5, v6);
}

void sub_1000368C0()
{
  sub_100006020();
  sub_10002E258((void *)&_mh_execute_header, v0, v1, "No store when saving sync anchor data", v2, v3, v4, v5, v6);
}

void sub_1000368F4()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Deleting data for stores matching predicate (%@)", v2, v3, v4, v5, v6);
}

void sub_10003695C()
{
  sub_100009904(__stack_chk_guard);
  sub_10000E1B0();
  sub_100009928((void *)&_mh_execute_header, v0, v1, "Failed to delete data for stores matching predicate (%@): %@");
}

void sub_1000369C4()
{
  sub_10000E1C8(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Deleted data for stores matching predicate (%@)", v2, v3, v4, v5, v6);
}

void sub_100036A2C()
{
  sub_100009904(__stack_chk_guard);
  sub_10000E1B0();
  sub_100009928((void *)&_mh_execute_header, v0, v1, "Failed to fetch record names for store <(%@)>: %@");
}

void sub_100036A94()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Fetched store identifiers: %@", v2, v3, v4, v5, v6);
}

void sub_100036AFC()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Fetching all store identifiers for %@", v2, v3, v4, v5, v6);
}

void sub_100036B64()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Failed to fetch all store identifiers: %@", v2, v3, v4, v5, v6);
}

void sub_100036BCC()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Clearing server records for store <(%@)>", v2, v3, v4, v5, v6);
}

void sub_100036C34()
{
  sub_10000E1C8(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "No managed store for store identifier (%@), so there's nothing to do", v2, v3, v4, v5, v6);
}

void sub_100036C9C()
{
  sub_100009904(__stack_chk_guard);
  sub_10000E1B0();
  sub_100009928((void *)&_mh_execute_header, v0, v1, "Failed to clear server records for store <(%@)>: %@");
}

void sub_100036D04()
{
  sub_10000E1C8(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Cleared server records for store <(%@)>", v2, v3, v4, v5, v6);
}

void sub_100036D6C(void *a1)
{
  uint64_t v1 = [a1 predicate];
  sub_10000DB9C();
  sub_10002E2E8((void *)&_mh_execute_header, v2, v3, "Error fetching count of key values with predicate %@: %@", v4, v5, v6, v7, v8);
}

void sub_100036E08()
{
  sub_100006020();
  sub_10000DF04((void *)&_mh_execute_header, v0, v1, "Trying to get change token with no persistent store", v2, v3, v4, v5, v6);
}

void sub_100036E3C()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Failed to archive history token to NSData: %@", v2, v3, v4, v5, v6);
}

void sub_100036EA4()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Error fetching properties when fetching change history: %@", v2, v3, v4, v5, v6);
}

void sub_100036F0C(unsigned char *a1, unsigned char *a2)
{
  sub_10002E2D8(a1, a2);
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "We have some deleted keys, but no store object ID", v3, 2u);
}

void sub_100036F44(uint8_t *buf, uint64_t a2, void *a3, os_log_t log)
{
  uint64_t v4 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  *(_DWORD *)buf = 138412290;
  *a3 = v4;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Error fetching store properties when validating deleted keys: %@", buf, 0xCu);
}

void sub_100036F9C(unsigned char *a1, unsigned char *a2)
{
  sub_10002E2D8(a1, a2);
  _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "Found multiple stores in a single transaction", v3, 2u);
}

void sub_100036FD4(void *a1, uint64_t a2, NSObject *a3)
{
  [a1 count];
  sub_10000DB9C();
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Found %ld persistent history transactions in store <(%@)>", v4, 0x16u);
}

void sub_100037064(void *a1)
{
  os_log_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = [a1 firstObject];
  uint64_t v5 = (objc_class *)objc_opt_class();
  __int16 v12 = NSStringFromClass(v5);
  sub_10002E2E8((void *)&_mh_execute_header, v6, v7, "Expected a list of %@, but got %@", v8, v9, v10, v11, 2u);
}

void sub_100037138(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  sub_100005FF8();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Received unexpected type of persistent history result (%@)", v5, 0xCu);
}

void sub_1000371D0()
{
  sub_100009904(__stack_chk_guard);
  sub_10000E1B0();
  sub_100009928((void *)&_mh_execute_header, v0, v1, "Error fetching persistent history for (%@): %@");
}

void sub_100037238()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error unarchiving token from data: %@", v2, v3, v4, v5, v6);
}

void sub_1000372A0()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Clearing server records for all stores", v2, v3, v4, v5, v6);
}

void sub_1000372D4()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Failed to clear sync anchor server records for all stores: %@", v2, v3, v4, v5, v6);
}

void sub_10003733C()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Cleared sync anchor server records for all stores", v2, v3, v4, v5, v6);
}

void sub_100037370()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Failed to clear key value server records for all stores: %@", v2, v3, v4, v5, v6);
}

void sub_1000373D8()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Cleared key value server records for all stores", v2, v3, v4, v5, v6);
}

void sub_10003740C()
{
  sub_10000E1C8(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Saving ACAccount identifier (%@)", v2, v3, v4, v5, v6);
}

void sub_100037474()
{
  sub_10002E308();
  sub_10002E29C((void *)&_mh_execute_header, v0, v1, "About to set didMigrateFromPlists=%d", v2, v3, v4, v5, v6);
}

void sub_1000374E0()
{
  sub_10002E308();
  sub_10002E29C((void *)&_mh_execute_header, v0, v1, "Saving didMigrateFromPlists=%d", v2, v3, v4, v5, v6);
}

void sub_10003754C()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error fetching managed database while setting didMigrateFromPlists: %@", v2, v3, v4, v5, v6);
}

void sub_1000375B4()
{
  sub_10002E308();
  sub_10002E29C((void *)&_mh_execute_header, v0, v1, "About to set failedMigrationCount=%d", v2, v3, v4, v5, v6);
}

void sub_100037620()
{
  sub_10002E308();
  sub_10002E29C((void *)&_mh_execute_header, v0, v1, "Saving failedMigrationCount=%d", v2, v3, v4, v5, v6);
}

void sub_10003768C()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error fetching managed database while setting failedMigrationCount: %@", v2, v3, v4, v5, v6);
}

void sub_1000376F4()
{
  sub_10000605C(__stack_chk_guard);
  sub_10000DB90();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Error fetching key value properties for dictionary representation: %@", v2, v3, v4, v5, v6);
}

void sub_10003775C(void *a1, NSObject *a2)
{
  [a1 length];
  sub_100005FF8();
  sub_100026E9C((void *)&_mh_execute_header, a2, v3, "Saving sync engine metadata serialization (length=%ld)", v4);
}

void sub_1000377DC()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Retrieving sync engine metadata serialization", v2, v3, v4, v5, v6);
}

void sub_100037810(void *a1, NSObject *a2)
{
  [a1 length];
  sub_100005FF8();
  sub_100026E9C((void *)&_mh_execute_header, a2, v3, "Saving deprecated sync engine metadata (length=%ld)", v4);
}

void sub_100037890()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Retrieving deprecated sync engine metadata", v2, v3, v4, v5, v6);
}

void sub_1000378C4()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Creating new managed database for %@", v2, v3, v4, v5, v6);
}

void sub_10003792C()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Error fetching managed database: %@", v2, v3, v4, v5, v6);
}

void sub_100037994()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Found multiple managed databases in the CoreData database %@", v2, v3, v4, v5, v6);
}

void sub_1000379FC()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Creating new managed store %@", v2, v3, v4, v5, v6);
}

void sub_100037A64()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Error fetching managed store: %@", v2, v3, v4, v5, v6);
}

void sub_100037ACC()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Found multiple stores for the same identifier: %@", v2, v3, v4, v5, v6);
}

void sub_100037B34()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error fetching key values: %@", v2, v3, v4, v5, v6);
}

void sub_100037B9C()
{
  sub_100007604();
  sub_100009928((void *)&_mh_execute_header, v0, v1, "Error fetching managed keyValue with predicate %@: %@");
}

void sub_100037C04()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Could not create context for %@ without a persistent container", v2, v3, v4, v5, v6);
}

void sub_100037C6C()
{
  sub_100005FF8();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Saved context (%@)", v2, v3, v4, v5, v6);
}

void sub_100037CD4()
{
  sub_100007604();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error saving context (%@): %@", v1, 0x16u);
}

void sub_100037D4C()
{
  sub_100007604();
  sub_100009928((void *)&_mh_execute_header, v0, v1, "Error saving context (%@): %@");
}

void sub_100037DB4()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Not saving transaction context", v2, v3, v4, v5, v6);
}

void sub_100037DE8()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Loaded persistent store", v2, v3, v4, v5, v6);
}

void sub_100037E1C()
{
  sub_10000E1C8(__stack_chk_guard);
  sub_10000DB90();
  sub_100004ED8((void *)&_mh_execute_header, v0, v1, "Loading persistent store for %@", v2, v3, v4, v5, v6);
}

void sub_100037E84()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "File protection error loading persistent store: %@", v2, v3, v4, v5, v6);
}

void sub_100037EEC()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Disk is full while loading persistent store: %@", v2, v3, v4, v5, v6);
}

void sub_100037F54()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Error loading persistent store: %@", v2, v3, v4, v5, v6);
}

void sub_100037FBC()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Successfully loaded persistent store on second try", v2, v3, v4, v5, v6);
}

void sub_100037FF0()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Failed to load persistent store on second try: %@", v2, v3, v4, v5, v6);
}

void sub_100038058()
{
  sub_100006020();
  sub_10002E258((void *)&_mh_execute_header, v0, v1, "Unable to get URL for managed object model", v2, v3, v4, v5, v6);
}

void sub_10003808C()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Loading managed object model", v2, v3, v4, v5, v6);
}

void sub_1000380C0()
{
  sub_100006020();
  sub_10002E258((void *)&_mh_execute_header, v0, v1, "Unable to find SyncedDefaults framework bundle", v2, v3, v4, v5, v6);
}

void sub_1000380F4()
{
  sub_100006020();
  sub_10000DF04((void *)&_mh_execute_header, v0, v1, "No persistent container to destroy", v2, v3, v4, v5, v6);
}

void sub_100038128()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Not destroying persistent store due to error: %@", v2, v3, v4, v5, v6);
}

void sub_100038190(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 URL];
  sub_100005FF8();
  sub_100026E9C((void *)&_mh_execute_header, a2, v4, "Destroyed persistent store at %@", v5);
}

void sub_10003821C()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Error destroying persistent store: %@", v2, v3, v4, v5, v6);
}

void sub_100038284(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 URL];
  sub_100005FF8();
  sub_100026E9C((void *)&_mh_execute_header, a2, v4, "Destroying persistent store at %@", v5);
}

void sub_100038310()
{
  sub_100005FF8();
  sub_100004F2C((void *)&_mh_execute_header, v0, v1, "Computed database size for %@: %lu");
}

void sub_100038384()
{
  sub_100005FF8();
  sub_100004F10((void *)&_mh_execute_header, v0, v1, "Error getting persistent container for creating a transactional store: %@", v2, v3, v4, v5, v6);
}

void sub_1000383EC()
{
  sub_100006020();
  sub_10002E258((void *)&_mh_execute_header, v0, v1, "Trying to save a non-transactional store.", v2, v3, v4, v5, v6);
}

void sub_100038420()
{
  sub_100006020();
  sub_100006004((void *)&_mh_execute_header, v0, v1, "Saving transaction", v2, v3, v4, v5, v6);
}

void sub_100038454()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Database was corrupt with NSFileReadCorruptFileError: %@", v2, v3, v4, v5, v6);
}

void sub_1000384BC()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Database was corrupt with SQLITE_NOTADB: %@", v2, v3, v4, v5, v6);
}

void sub_100038524()
{
  sub_100005FF8();
  sub_100004EF4((void *)&_mh_execute_header, v0, v1, "Database was corrupt with SQLITE_CORRUPT: %@", v2, v3, v4, v5, v6);
}

void sub_10003858C()
{
  sub_100006020();
  sub_10002E258((void *)&_mh_execute_header, v0, v1, "Destroying corrupt database", v2, v3, v4, v5, v6);
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t StringProtocol.hash.getter()
{
  return StringProtocol.hash.getter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CKContainerEnvironmentString()
{
  return _CKContainerEnvironmentString();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return _TCCAccessCopyBundleIdentifiersDisabledForService();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return _TCCAccessCopyInformationForBundleId();
}

uint64_t TCCAccessSetForBundleId()
{
  return _TCCAccessSetForBundleId();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

int atoi(const char *a1)
{
  return _atoi(a1);
}

uint64_t container_copy_sandbox_token()
{
  return _container_copy_sandbox_token();
}

uint64_t container_error_copy_unlocalized_description()
{
  return _container_error_copy_unlocalized_description();
}

uint64_t container_error_get_type()
{
  return _container_error_get_type();
}

uint64_t container_get_path()
{
  return _container_get_path();
}

uint64_t container_query_create()
{
  return _container_query_create();
}

uint64_t container_query_free()
{
  return _container_query_free();
}

uint64_t container_query_get_last_error()
{
  return _container_query_get_last_error();
}

uint64_t container_query_get_single_result()
{
  return _container_query_get_single_result();
}

uint64_t container_query_operation_set_flags()
{
  return _container_query_operation_set_flags();
}

uint64_t container_query_set_class()
{
  return _container_query_set_class();
}

uint64_t container_query_set_identifiers()
{
  return _container_query_set_identifiers();
}

uint64_t container_query_set_persona_unique_string()
{
  return _container_query_set_persona_unique_string();
}

uint64_t container_query_set_transient()
{
  return _container_query_set_transient();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
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

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

uid_t getuid(void)
{
  return _getuid();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
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

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t sandbox_container_path_for_audit_token()
{
  return _sandbox_container_path_for_audit_token();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return _xpc_equal(object1, object2);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_URLHostAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 URLHostAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__contextForStoreIdentifier_persistentContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contextForStoreIdentifier:persistentContainer:");
}

id objc_msgSend__markZoneForDeletionOnManateeFailureForRecordZoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markZoneForDeletionOnManateeFailureForRecordZoneID:");
}

id objc_msgSend__queue_allSyncManagers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_allSyncManagers");
}

id objc_msgSend__queue_destroyPersistentStoreInPersistentStoreCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_destroyPersistentStoreInPersistentStoreCoordinator:");
}

id objc_msgSend__queue_handleCorruptionIfNecessaryFromError_inPersistentStoreCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:");
}

id objc_msgSend__queue_resetSyncEngine(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queue_resetSyncEngine");
}

id objc_msgSend__saveKeyValues_excludeFromChangeTracking_enforceQuota_forceCreateNewRow_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveKeyValues:excludeFromChangeTracking:enforceQuota:forceCreateNewRow:error:");
}

id objc_msgSend__unboostingRemoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 _unboostingRemoteObjectProxy];
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_acAccountIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 acAccountIdentifier];
}

id objc_msgSend_acAccountIdentifierWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acAccountIdentifierWithError:");
}

id objc_msgSend_accountChangeEvent(void *a1, const char *a2, ...)
{
  return _[a1 accountChangeEvent];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _[a1 accountStore];
}

id objc_msgSend_accountsWithAccountTypeIdentifiers_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountsWithAccountTypeIdentifiers:error:");
}

id objc_msgSend_addKeyValueRecordIDsToSave_recordIDsToDelete_storeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addKeyValueRecordIDsToSave:recordIDsToDelete:storeIdentifier:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addPendingDatabaseChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPendingDatabaseChanges:");
}

id objc_msgSend_addPendingDatabaseChanges_storeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPendingDatabaseChanges:storeIdentifier:");
}

id objc_msgSend_addPendingRecordZoneChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPendingRecordZoneChanges:");
}

id objc_msgSend_addPlistURLsAndStoreIdentifiersForBundleRecord_toDictionary_uncontainerizedSyncedPreferencesDirectoryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPlistURLsAndStoreIdentifiersForBundleRecord:toDictionary:uncontainerizedSyncedPreferencesDirectoryURL:");
}

id objc_msgSend_addPlistURLsAndStoreIdentifiersForKnownDaemonsToDictionary_uncontainerizedSyncedPreferencesDirectoryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPlistURLsAndStoreIdentifiersForKnownDaemonsToDictionary:uncontainerizedSyncedPreferencesDirectoryURL:");
}

id objc_msgSend_addPlistURLsForBundleIdentifier_defaultStoreIdentifier_additionalStoreIdentifiers_toDictionary_syncedPreferencesDirectoryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPlistURLsForBundleIdentifier:defaultStoreIdentifier:additionalStoreIdentifiers:toDictionary:syncedPreferencesDirectoryURL:");
}

id objc_msgSend_addSyncAnchorRecordIDToSaveIfNecessaryForStoreIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSyncAnchorRecordIDToSaveIfNecessaryForStoreIdentifier:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allPossibleStorePlistURLsWithLibraryDirectoryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allPossibleStorePlistURLsWithLibraryDirectoryURL:");
}

id objc_msgSend_allRecordNamesInStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allRecordNamesInStoreWithIdentifier:error:");
}

id objc_msgSend_allStoreIdentifiersWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allStoreIdentifiersWithError:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_alwaysSaveRecordZones(void *a1, const char *a2, ...)
{
  return _[a1 alwaysSaveRecordZones];
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 applicationIdentifier];
}

id objc_msgSend_applicationIdentifiersForStoreIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationIdentifiersForStoreIdentifiers:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetContent(void *a1, const char *a2, ...)
{
  return _[a1 assetContent];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleIdentifiersForStoreIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifiersForStoreIdentifier:");
}

id objc_msgSend_bundleRecordForAuditToken_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordForAuditToken:error:");
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_cachedDisabledStoreIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 cachedDisabledStoreIdentifiers];
}

id objc_msgSend_cachedStoreBundleMap(void *a1, const char *a2, ...)
{
  return _[a1 cachedStoreBundleMap];
}

id objc_msgSend_callbackQueue(void *a1, const char *a2, ...)
{
  return _[a1 callbackQueue];
}

id objc_msgSend_changeDictionaryWithChangedKeys_reason_changeToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeDictionaryWithChangedKeys:reason:changeToken:");
}

id objc_msgSend_changeTokenURLForStoreConfiguration_xpcConnection_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeTokenURLForStoreConfiguration:xpcConnection:error:");
}

id objc_msgSend_changeType(void *a1, const char *a2, ...)
{
  return _[a1 changeType];
}

id objc_msgSend_changedKeysForStoreIdentifier_sinceChangeToken_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changedKeysForStoreIdentifier:sinceChangeToken:error:");
}

id objc_msgSend_changedKeysForStoreIdentifier_sinceChangeTokenIfValid_inCoreDataStore_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changedKeysForStoreIdentifier:sinceChangeTokenIfValid:inCoreDataStore:error:");
}

id objc_msgSend_changedObjectID(void *a1, const char *a2, ...)
{
  return _[a1 changedObjectID];
}

id objc_msgSend_changes(void *a1, const char *a2, ...)
{
  return _[a1 changes];
}

id objc_msgSend_checkResourceIsReachableAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkResourceIsReachableAndReturnError:");
}

id objc_msgSend_clearCachedStoreBundleMap(void *a1, const char *a2, ...)
{
  return _[a1 clearCachedStoreBundleMap];
}

id objc_msgSend_clearContexts(void *a1, const char *a2, ...)
{
  return _[a1 clearContexts];
}

id objc_msgSend_clearServerSystemFieldsRecordsForAllKeyValuesInStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearServerSystemFieldsRecordsForAllKeyValuesInStoreWithIdentifier:error:");
}

id objc_msgSend_clearServerSystemFieldsRecordsForAllStoresWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearServerSystemFieldsRecordsForAllStoresWithError:");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_clientConnections(void *a1, const char *a2, ...)
{
  return _[a1 clientConnections];
}

id objc_msgSend_clientProtocolInterface(void *a1, const char *a2, ...)
{
  return _[a1 clientProtocolInterface];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _[a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_connection_syncManagerForStoreID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connection:syncManagerForStoreID:error:");
}

id objc_msgSend_connectionDidInvalidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "connectionDidInvalidate:");
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return _[a1 container];
}

id objc_msgSend_containerForStoreType_containerID_testConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerForStoreType:containerID:testConfiguration:");
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return _[a1 containerID];
}

id objc_msgSend_containerIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 containerIdentifier];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsRecordID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsRecordID:");
}

id objc_msgSend_contextForStoreIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextForStoreIdentifier:error:");
}

id objc_msgSend_contexts(void *a1, const char *a2, ...)
{
  return _[a1 contexts];
}

id objc_msgSend_contextsLock(void *a1, const char *a2, ...)
{
  return _[a1 contextsLock];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyCurrentPersonaContextWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyCurrentPersonaContextWithError:");
}

id objc_msgSend_coreDataStore(void *a1, const char *a2, ...)
{
  return _[a1 coreDataStore];
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

id objc_msgSend_currentChangeTokenForStoreIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentChangeTokenForStoreIdentifier:error:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentPersistentHistoryTokenFromStores_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPersistentHistoryTokenFromStores:");
}

id objc_msgSend_currentPersona(void *a1, const char *a2, ...)
{
  return _[a1 currentPersona];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return _[a1 currentUser];
}

id objc_msgSend_daemonProtocolInterface(void *a1, const char *a2, ...)
{
  return _[a1 daemonProtocolInterface];
}

id objc_msgSend_dataContainerURL(void *a1, const char *a2, ...)
{
  return _[a1 dataContainerURL];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return _[a1 database];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_decrementManualSyncCount(void *a1, const char *a2, ...)
{
  return _[a1 decrementManualSyncCount];
}

id objc_msgSend_deduplicateRecordForKeyValue_withNewlyFetchedRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deduplicateRecordForKeyValue:withNewlyFetchedRecord:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultConfiguration];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteDataForAllStoresWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteDataForAllStoresWithError:");
}

id objc_msgSend_deleteDataForStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteDataForStoreWithIdentifier:error:");
}

id objc_msgSend_deleteDataForStoresMatchingPredicate_context_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteDataForStoresMatchingPredicate:context:error:");
}

id objc_msgSend_deleteFilesForAssetsInKeyValueRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteFilesForAssetsInKeyValueRecord:");
}

id objc_msgSend_deleteObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteObject:");
}

id objc_msgSend_deletedRecordIDs(void *a1, const char *a2, ...)
{
  return _[a1 deletedRecordIDs];
}

id objc_msgSend_deletedZoneIDs(void *a1, const char *a2, ...)
{
  return _[a1 deletedZoneIDs];
}

id objc_msgSend_deletions(void *a1, const char *a2, ...)
{
  return _[a1 deletions];
}

id objc_msgSend_deprecatedSyncEngineMetadataWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deprecatedSyncEngineMetadataWithError:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_destroyPersistentStore(void *a1, const char *a2, ...)
{
  return _[a1 destroyPersistentStore];
}

id objc_msgSend_destroyPersistentStoreAtURL_withType_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destroyPersistentStoreAtURL:withType:options:error:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryRepresentationForStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryRepresentationForStoreWithIdentifier:error:");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didDeleteRecordWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDeleteRecordWithID:");
}

id objc_msgSend_didDeleteRecordZoneWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDeleteRecordZoneWithID:");
}

id objc_msgSend_didEndFetchingChanges(void *a1, const char *a2, ...)
{
  return _[a1 didEndFetchingChanges];
}

id objc_msgSend_didFailToFetchChangesForRecordZoneID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFailToFetchChangesForRecordZoneID:error:");
}

id objc_msgSend_didFailToSaveRecord_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFailToSaveRecord:error:");
}

id objc_msgSend_didFetchRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchRecord:");
}

id objc_msgSend_didFetchRecordDeletion_recordType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFetchRecordDeletion:recordType:");
}

id objc_msgSend_didFetchRecordZoneChangesEvent(void *a1, const char *a2, ...)
{
  return _[a1 didFetchRecordZoneChangesEvent];
}

id objc_msgSend_didMigrateFromPlists(void *a1, const char *a2, ...)
{
  return _[a1 didMigrateFromPlists];
}

id objc_msgSend_didMigrateFromPlistsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMigrateFromPlistsWithError:");
}

id objc_msgSend_didRefreshBundleMap(void *a1, const char *a2, ...)
{
  return _[a1 didRefreshBundleMap];
}

id objc_msgSend_didSaveRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSaveRecord:");
}

id objc_msgSend_disabledStoreIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 disabledStoreIdentifiers];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_effectiveBundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 effectiveBundleIdentifier];
}

id objc_msgSend_enableUbiquityIfNecessaryForAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableUbiquityIfNecessaryForAuditToken:");
}

id objc_msgSend_encodeSystemFieldsWithCoder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeSystemFieldsWithCoder:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return _[a1 encodedData];
}

id objc_msgSend_encryptedValues(void *a1, const char *a2, ...)
{
  return _[a1 encryptedValues];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return _[a1 end];
}

id objc_msgSend_engine(void *a1, const char *a2, ...)
{
  return _[a1 engine];
}

id objc_msgSend_engineWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "engineWithError:");
}

id objc_msgSend_entitledStoreIDs(void *a1, const char *a2, ...)
{
  return _[a1 entitledStoreIDs];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return _[a1 entitlements];
}

id objc_msgSend_entity(void *a1, const char *a2, ...)
{
  return _[a1 entity];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_enumeratorWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorWithOptions:");
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return _[a1 environment];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorForUnknownStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorForUnknownStore:");
}

id objc_msgSend_errorNotEntitledForStoreConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorNotEntitledForStoreConfiguration:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_excludedZoneIDs(void *a1, const char *a2, ...)
{
  return _[a1 excludedZoneIDs];
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "execute:");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_executeRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeRequest:error:");
}

id objc_msgSend_failedMigrationCount(void *a1, const char *a2, ...)
{
  return _[a1 failedMigrationCount];
}

id objc_msgSend_failedMigrationCountWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedMigrationCountWithError:");
}

id objc_msgSend_failedRecordDeletes(void *a1, const char *a2, ...)
{
  return _[a1 failedRecordDeletes];
}

id objc_msgSend_failedRecordSaves(void *a1, const char *a2, ...)
{
  return _[a1 failedRecordSaves];
}

id objc_msgSend_failedToSaveKeyValueRecord_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "failedToSaveKeyValueRecord:error:");
}

id objc_msgSend_fetchAllRecordZonesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAllRecordZonesWithCompletionHandler:");
}

id objc_msgSend_fetchChangesFromCloudForAllStoresWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchChangesFromCloudForAllStoresWithCompletionHandler:");
}

id objc_msgSend_fetchChangesFromCloudForStoreIdentifiers_group_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchChangesFromCloudForStoreIdentifiers:group:completionHandler:");
}

id objc_msgSend_fetchChangesWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchChangesWithOptions:completionHandler:");
}

id objc_msgSend_fetchHistoryAfterToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchHistoryAfterToken:");
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return _[a1 fetchRequest];
}

id objc_msgSend_fetchedDatabaseChangesEvent(void *a1, const char *a2, ...)
{
  return _[a1 fetchedDatabaseChangesEvent];
}

id objc_msgSend_fetchedRecordZoneChangesEvent(void *a1, const char *a2, ...)
{
  return _[a1 fetchedRecordZoneChangesEvent];
}

id objc_msgSend_fileProtectionType(void *a1, const char *a2, ...)
{
  return _[a1 fileProtectionType];
}

id objc_msgSend_fileSizeBytes(void *a1, const char *a2, ...)
{
  return _[a1 fileSizeBytes];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return _[a1 fileURL];
}

id objc_msgSend_fileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_findDisabledStoreIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 findDisabledStoreIdentifiers];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_generateAndRestorePersonaContextWithPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateAndRestorePersonaContextWithPersonaUniqueString:");
}

id objc_msgSend_generateStoreBundleMap(void *a1, const char *a2, ...)
{
  return _[a1 generateStoreBundleMap];
}

id objc_msgSend_generateStoreBundleMapIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 generateStoreBundleMapIfNecessary];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_gid(void *a1, const char *a2, ...)
{
  return _[a1 gid];
}

id objc_msgSend_handleCorruptionIfNecessaryFromError_inPersistentStoreCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCorruptionIfNecessaryFromError:inPersistentStoreCoordinator:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleSyncEngineStateUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleSyncEngineStateUpdate:");
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return _[a1 hasChanges];
}

id objc_msgSend_hasPendingChangesToUpload(void *a1, const char *a2, ...)
{
  return _[a1 hasPendingChangesToUpload];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_ignoreQuotaEntitlementValue(void *a1, const char *a2, ...)
{
  return _[a1 ignoreQuotaEntitlementValue];
}

id objc_msgSend_incrementManualSyncCount(void *a1, const char *a2, ...)
{
  return _[a1 incrementManualSyncCount];
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithAssetContent_itemTypeHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetContent:itemTypeHint:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:freeWhenDone:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCoder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCoder:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithContainer_coreDataStore_storeType_testConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainer:coreDataStore:storeType:testConfiguration:");
}

id objc_msgSend_initWithContainerID_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerID:options:");
}

id objc_msgSend_initWithContainerIdentifier_environment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerIdentifier:environment:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDatabase_stateSerialization_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabase:stateSerialization:delegate:");
}

id objc_msgSend_initWithDeprecatedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeprecatedData:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithEntity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithEntity:");
}

id objc_msgSend_initWithExcludedZoneIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExcludedZoneIDs:");
}

id objc_msgSend_initWithFetchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFetchRequest:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithIdentifier_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:type:");
}

id objc_msgSend_initWithKey_storeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:storeIdentifier:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithName_managedObjectModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:managedObjectModel:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithPendingChanges_recordProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPendingChanges:recordProvider:");
}

id objc_msgSend_initWithRecordID_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordID:type:");
}

id objc_msgSend_initWithRecordName_zoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordName:zoneID:");
}

id objc_msgSend_initWithRecordType_recordID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordType:recordID:");
}

id objc_msgSend_initWithRecordZonesToSave_recordZoneIDsToDelete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRecordZonesToSave:recordZoneIDsToDelete:");
}

id objc_msgSend_initWithScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScope:");
}

id objc_msgSend_initWithStoreID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStoreID:");
}

id objc_msgSend_initWithTestServerName_testDeviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestServerName:testDeviceID:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithURL_fileProtectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:fileProtectionType:");
}

id objc_msgSend_initWithURL_fileProtectionType_persistentContainer_isTransactional_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:fileProtectionType:persistentContainer:isTransactional:");
}

id objc_msgSend_initWithXPCConnection_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithXPCConnection:delegate:");
}

id objc_msgSend_initWithZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZone:");
}

id objc_msgSend_initWithZoneID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneID:");
}

id objc_msgSend_initWithZoneIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneIDs:");
}

id objc_msgSend_initWithZoneName_ownerName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithZoneName:ownerName:");
}

id objc_msgSend_initializeKnownSyncManagers(void *a1, const char *a2, ...)
{
  return _[a1 initializeKnownSyncManagers];
}

id objc_msgSend_initializeSyncEngineWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeSyncEngineWithError:");
}

id objc_msgSend_inputStreamWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputStreamWithURL:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectsSet:");
}

id objc_msgSend_isAutomaticSyncingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAutomaticSyncingEnabled];
}

id objc_msgSend_isCloudSyncEnablementEntitledForStoreIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCloudSyncEnablementEntitledForStoreIdentifier:");
}

id objc_msgSend_isCloudSyncUserDefaultEnabledForStoreIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCloudSyncUserDefaultEnabledForStoreIdentifier:");
}

id objc_msgSend_isCorruptionError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCorruptionError:");
}

id objc_msgSend_isDataSeparatedPersona(void *a1, const char *a2, ...)
{
  return _[a1 isDataSeparatedPersona];
}

id objc_msgSend_isEntitledForStoreConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEntitledForStoreConfiguration:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isIdentityLostError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIdentityLostError:");
}

id objc_msgSend_isInitializingSyncManagers(void *a1, const char *a2, ...)
{
  return _[a1 isInitializingSyncManagers];
}

id objc_msgSend_isInserted(void *a1, const char *a2, ...)
{
  return _[a1 isInserted];
}

id objc_msgSend_isInvalidTokenError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isInvalidTokenError:");
}

id objc_msgSend_isKnownStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isKnownStore:");
}

id objc_msgSend_isPerformingManualSync(void *a1, const char *a2, ...)
{
  return _[a1 isPerformingManualSync];
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return _[a1 isSharedIPad];
}

id objc_msgSend_isStoreIdentifierUsedOnThisDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStoreIdentifierUsedOnThisDevice:");
}

id objc_msgSend_isUbiquityDisabledForStoreIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUbiquityDisabledForStoreIdentifier:");
}

id objc_msgSend_isXPCConnection_entitledForStoreConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isXPCConnection:entitledForStoreConfiguration:");
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _[a1 key];
}

id objc_msgSend_keyFromKeyValueRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyFromKeyValueRecord:");
}

id objc_msgSend_keyFromUnencryptedKeyValueRecordName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyFromUnencryptedKeyValueRecordName:");
}

id objc_msgSend_keyID(void *a1, const char *a2, ...)
{
  return _[a1 keyID];
}

id objc_msgSend_keyValueForKey_inStoreWithIdentifier_createIfNecessary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueForKey:inStoreWithIdentifier:createIfNecessary:error:");
}

id objc_msgSend_keyValueForRecordName_inStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueForRecordName:inStoreWithIdentifier:error:");
}

id objc_msgSend_keyValueFromManagedKeyValue_inStoreWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueFromManagedKeyValue:inStoreWithIdentifier:");
}

id objc_msgSend_keyValueRecordHasAssetWithoutFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueRecordHasAssetWithoutFile:");
}

id objc_msgSend_keyValueStorePlistFromURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValueStorePlistFromURL:error:");
}

id objc_msgSend_keyValues(void *a1, const char *a2, ...)
{
  return _[a1 keyValues];
}

id objc_msgSend_keyValuesForKeyIDs_createIfNecessary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyValuesForKeyIDs:createIfNecessary:error:");
}

id objc_msgSend_knownDaemons(void *a1, const char *a2, ...)
{
  return _[a1 knownDaemons];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_listAllPersonaWithAttributes(void *a1, const char *a2, ...)
{
  return _[a1 listAllPersonaWithAttributes];
}

id objc_msgSend_loadPersistentStoresWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadPersistentStoresWithCompletionHandler:");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return _[a1 lock];
}

id objc_msgSend_managedDatabaseCreateIfNecessary_inContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedDatabaseCreateIfNecessary:inContext:error:");
}

id objc_msgSend_managedKeyValueWithRecordName_inStoreWithIdentifier_inContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedKeyValueWithRecordName:inStoreWithIdentifier:inContext:error:");
}

id objc_msgSend_managedKeyValuesForKeyIDs_inContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedKeyValuesForKeyIDs:inContext:error:");
}

id objc_msgSend_managedKeyValuesMatchingPredicate_inContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedKeyValuesMatchingPredicate:inContext:error:");
}

id objc_msgSend_managedObjectModel(void *a1, const char *a2, ...)
{
  return _[a1 managedObjectModel];
}

id objc_msgSend_managedStoreWithIdentifier_createIfNecessary_inContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "managedStoreWithIdentifier:createIfNecessary:inContext:error:");
}

id objc_msgSend_manualSyncCount(void *a1, const char *a2, ...)
{
  return _[a1 manualSyncCount];
}

id objc_msgSend_markAllKeyValuesAsNeedingToBeUploaded(void *a1, const char *a2, ...)
{
  return _[a1 markAllKeyValuesAsNeedingToBeUploaded];
}

id objc_msgSend_markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markAllKeyValuesAsNeedingToBeUploadedForStoreWithIdentifier:");
}

id objc_msgSend_markForDeletion(void *a1, const char *a2, ...)
{
  return _[a1 markForDeletion];
}

id objc_msgSend_maxPendingFetchedRecords(void *a1, const char *a2, ...)
{
  return _[a1 maxPendingFetchedRecords];
}

id objc_msgSend_mergeDataFromRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mergeDataFromRecord:");
}

id objc_msgSend_migrateAllPlistsIfNecessaryToCoreDataStore_deleteMigratedPlists_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateAllPlistsIfNecessaryToCoreDataStore:deleteMigratedPlists:error:");
}

id objc_msgSend_migrateAllPlistsIfNecessaryToCoreDataStore_deleteMigratedPlists_libraryDirectoryURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateAllPlistsIfNecessaryToCoreDataStore:deleteMigratedPlists:libraryDirectoryURL:error:");
}

id objc_msgSend_migrateAllPlistsToCoreDataStore_deleteMigratedPlists_libraryDirectoryURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateAllPlistsToCoreDataStore:deleteMigratedPlists:libraryDirectoryURL:error:");
}

id objc_msgSend_migratePlist_forStoreWithIdentifier_toCoreDataStore_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migratePlist:forStoreWithIdentifier:toCoreDataStore:error:");
}

id objc_msgSend_mobileKeybagNotifyToken(void *a1, const char *a2, ...)
{
  return _[a1 mobileKeybagNotifyToken];
}

id objc_msgSend_modificationDate(void *a1, const char *a2, ...)
{
  return _[a1 modificationDate];
}

id objc_msgSend_modifications(void *a1, const char *a2, ...)
{
  return _[a1 modifications];
}

id objc_msgSend_modifiedByDevice(void *a1, const char *a2, ...)
{
  return _[a1 modifiedByDevice];
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return _[a1 newBackgroundContext];
}

id objc_msgSend_newRecordNameForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newRecordNameForKey:");
}

id objc_msgSend_notEntitledStoreIDs(void *a1, const char *a2, ...)
{
  return _[a1 notEntitledStoreIDs];
}

id objc_msgSend_notifyAccountDidChangeFromAccountID_toAccountID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyAccountDidChangeFromAccountID:toAccountID:completionHandler:");
}

id objc_msgSend_notifyToken(void *a1, const char *a2, ...)
{
  return _[a1 notifyToken];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberOfKeyValuesInStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfKeyValuesInStoreWithIdentifier:error:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_inStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:inStoreWithIdentifier:error:");
}

id objc_msgSend_objectForKey_ofClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:ofClass:");
}

id objc_msgSend_objectForKey_ofClass_valuesOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:ofClass:valuesOfClass:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _[a1 open];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pendingDatabaseChanges(void *a1, const char *a2, ...)
{
  return _[a1 pendingDatabaseChanges];
}

id objc_msgSend_pendingDeletedRecordIDs(void *a1, const char *a2, ...)
{
  return _[a1 pendingDeletedRecordIDs];
}

id objc_msgSend_pendingFetchedRecords(void *a1, const char *a2, ...)
{
  return _[a1 pendingFetchedRecords];
}

id objc_msgSend_pendingRecordZoneChanges(void *a1, const char *a2, ...)
{
  return _[a1 pendingRecordZoneChanges];
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_persistentContainerQueue(void *a1, const char *a2, ...)
{
  return _[a1 persistentContainerQueue];
}

id objc_msgSend_persistentContainerWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentContainerWithError:");
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return _[a1 persistentStoreCoordinator];
}

id objc_msgSend_persistentStores(void *a1, const char *a2, ...)
{
  return _[a1 persistentStores];
}

id objc_msgSend_personaAttributesForPersonaType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personaAttributesForPersonaType:");
}

id objc_msgSend_personaAttributesForPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personaAttributesForPersonaUniqueString:");
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 personaIdentifier];
}

id objc_msgSend_personaUniqueString(void *a1, const char *a2, ...)
{
  return _[a1 personaUniqueString];
}

id objc_msgSend_plistDataLength(void *a1, const char *a2, ...)
{
  return _[a1 plistDataLength];
}

id objc_msgSend_plistDataValue(void *a1, const char *a2, ...)
{
  return _[a1 plistDataValue];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return _[a1 predicate];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_previousUser(void *a1, const char *a2, ...)
{
  return _[a1 previousUser];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return _[a1 privateCloudDatabase];
}

id objc_msgSend_processAccountChanges(void *a1, const char *a2, ...)
{
  return _[a1 processAccountChanges];
}

id objc_msgSend_processFetchedRecords_deletedRecordIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processFetchedRecords:deletedRecordIDs:");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_processPendingFetchedRecordsWithReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processPendingFetchedRecordsWithReason:");
}

id objc_msgSend_propertyList_isValidForFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyList:isValidForFormat:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_propertyListWithStream_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithStream:options:format:error:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return _[a1 reason];
}

id objc_msgSend_record(void *a1, const char *a2, ...)
{
  return _[a1 record];
}

id objc_msgSend_recordChangeTag(void *a1, const char *a2, ...)
{
  return _[a1 recordChangeTag];
}

id objc_msgSend_recordFieldKeyForValueModificationDateInStoreType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordFieldKeyForValueModificationDateInStoreType:");
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return _[a1 recordID];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return _[a1 recordName];
}

id objc_msgSend_recordNameForUnencryptedKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordNameForUnencryptedKey:");
}

id objc_msgSend_recordRepresentationForStoreType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordRepresentationForStoreType:");
}

id objc_msgSend_recordToSaveForRecordID_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordToSaveForRecordID:error:");
}

id objc_msgSend_recordType(void *a1, const char *a2, ...)
{
  return _[a1 recordType];
}

id objc_msgSend_refreshObject_mergeChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshObject:mergeChanges:");
}

id objc_msgSend_registerForFirstUnlockNotificationsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 registerForFirstUnlockNotificationsIfNecessary];
}

id objc_msgSend_registerForPeriodAnalyticsXPCActivity(void *a1, const char *a2, ...)
{
  return _[a1 registerForPeriodAnalyticsXPCActivity];
}

id objc_msgSend_registerUserSyncStakeholder_withMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerUserSyncStakeholder:withMachServiceName:");
}

id objc_msgSend_registeredStoreIDs(void *a1, const char *a2, ...)
{
  return _[a1 registeredStoreIDs];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeInvalidSyncManagers(void *a1, const char *a2, ...)
{
  return _[a1 removeInvalidSyncManagers];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeKeyValueForKey_inStoreWithIdentifier_excludeFromChangeTracking_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeKeyValueForKey:inStoreWithIdentifier:excludeFromChangeTracking:error:");
}

id objc_msgSend_removeKeyValueForRecordName_inStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeKeyValueForRecordName:inStoreWithIdentifier:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectForKey_inStoreWithIdentifier_excludeFromChangeTracking_didRemoveValue_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:inStoreWithIdentifier:excludeFromChangeTracking:didRemoveValue:error:");
}

id objc_msgSend_removeObjectForKey_inStoreWithIdentifier_excludeFromChangeTracking_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:inStoreWithIdentifier:excludeFromChangeTracking:error:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removePendingRecordZoneChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePendingRecordZoneChanges:");
}

id objc_msgSend_requestAuthorizationIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 requestAuthorizationIfNecessary];
}

id objc_msgSend_requestAuthorizationWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAuthorizationWithOptions:completionHandler:");
}

id objc_msgSend_requestWithIdentifier_content_trigger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithIdentifier:content:trigger:");
}

id objc_msgSend_resetSyncEngineWithContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetSyncEngineWithContainer:");
}

id objc_msgSend_restorePersonaWithSavedPersonaContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restorePersonaWithSavedPersonaContext:");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return _[a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_save_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "save:");
}

id objc_msgSend_saveContext_reason_includingTransactionContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveContext:reason:includingTransactionContext:error:");
}

id objc_msgSend_saveKeyValue_inStoreWithIdentifier_excludeFromChangeTracking_enforceQuota_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveKeyValue:inStoreWithIdentifier:excludeFromChangeTracking:enforceQuota:error:");
}

id objc_msgSend_saveKeyValues_excludeFromChangeTracking_enforceQuota_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveKeyValues:excludeFromChangeTracking:enforceQuota:error:");
}

id objc_msgSend_savePendingChangesToCloudForAllStoresWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "savePendingChangesToCloudForAllStoresWithCompletionHandler:");
}

id objc_msgSend_savePendingChangesToCloudForStoreIdentifiers_group_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "savePendingChangesToCloudForStoreIdentifiers:group:completionHandler:");
}

id objc_msgSend_saveServerSyncAnchorSystemFieldsRecordData_forStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveServerSyncAnchorSystemFieldsRecordData:forStoreWithIdentifier:error:");
}

id objc_msgSend_saveSyncAnchorSystemFieldsRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveSyncAnchorSystemFieldsRecord:");
}

id objc_msgSend_saveSyncEngineStateSerialization_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveSyncEngineStateSerialization:error:");
}

id objc_msgSend_saveTransaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveTransaction:");
}

id objc_msgSend_savedRecords(void *a1, const char *a2, ...)
{
  return _[a1 savedRecords];
}

id objc_msgSend_scope(void *a1, const char *a2, ...)
{
  return _[a1 scope];
}

id objc_msgSend_sendAnalyticsEventForCurrentState(void *a1, const char *a2, ...)
{
  return _[a1 sendAnalyticsEventForCurrentState];
}

id objc_msgSend_sendChangesWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendChangesWithOptions:completionHandler:");
}

id objc_msgSend_sentDatabaseChangesEvent(void *a1, const char *a2, ...)
{
  return _[a1 sentDatabaseChangesEvent];
}

id objc_msgSend_sentRecordZoneChangesEvent(void *a1, const char *a2, ...)
{
  return _[a1 sentRecordZoneChangesEvent];
}

id objc_msgSend_serverSyncAnchorSystemFieldsRecordDataForStoreWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serverSyncAnchorSystemFieldsRecordDataForStoreWithIdentifier:error:");
}

id objc_msgSend_serverSystemFieldsRecord(void *a1, const char *a2, ...)
{
  return _[a1 serverSystemFieldsRecord];
}

id objc_msgSend_serverSystemFieldsRecordData(void *a1, const char *a2, ...)
{
  return _[a1 serverSystemFieldsRecordData];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setACAccountIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setACAccountIdentifier:error:");
}

id objc_msgSend_setAcAccountIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcAccountIdentifier:");
}

id objc_msgSend_setApsMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApsMachServiceName:");
}

id objc_msgSend_setAttributes_ofItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:ofItemAtPath:error:");
}

id objc_msgSend_setAutomaticSyncingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticSyncingEnabled:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setCachedDisabledStoreIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedDisabledStoreIdentifiers:");
}

id objc_msgSend_setCachedStoreBundleMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCachedStoreBundleMap:");
}

id objc_msgSend_setCloudSyncUserDefaultEnabled_storeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCloudSyncUserDefaultEnabled:storeIdentifier:");
}

id objc_msgSend_setContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainer:");
}

id objc_msgSend_setDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatabase:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDidMigrateFromPlists_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidMigrateFromPlists:");
}

id objc_msgSend_setDidMigrateFromPlists_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidMigrateFromPlists:error:");
}

id objc_msgSend_setDidRefreshBundleMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDidRefreshBundleMap:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFailedMigrationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFailedMigrationCount:");
}

id objc_msgSend_setFailedMigrationCount_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFailedMigrationCount:error:");
}

id objc_msgSend_setFetchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchRequest:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIgnoreQuotaEntitlementValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIgnoreQuotaEntitlementValue:");
}

id objc_msgSend_setInitializingSyncManagers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitializingSyncManagers:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsCloudKitSupportOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsCloudKitSupportOperation:");
}

id objc_msgSend_setIsNewKeyValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsNewKeyValue:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setManualSyncCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setManualSyncCount:");
}

id objc_msgSend_setMarkZonesAsUserPurged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMarkZonesAsUserPurged:");
}

id objc_msgSend_setMergePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMergePolicy:");
}

id objc_msgSend_setMobileKeybagNotifyToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMobileKeybagNotifyToken:");
}

id objc_msgSend_setModifyRecordZonesCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifyRecordZonesCompletionBlock:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNeedsToReloadAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsToReloadAccount:");
}

id objc_msgSend_setNotEntitledStoreIDs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotEntitledStoreIDs:");
}

id objc_msgSend_setNotifyToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotifyToken:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKey_inStoreWithIdentifier_excludeFromChangeTracking_enforceQuota_didChangeValue_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:inStoreWithIdentifier:excludeFromChangeTracking:enforceQuota:didChangeValue:error:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOperationGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOperationGroup:");
}

id objc_msgSend_setOption_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOption:forKey:");
}

id objc_msgSend_setPersistentStoreDescriptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentStoreDescriptions:");
}

id objc_msgSend_setPersonaIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonaIdentifier:");
}

id objc_msgSend_setPersonaUniqueString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersonaUniqueString:");
}

id objc_msgSend_setPlistDataLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlistDataLength:");
}

id objc_msgSend_setPlistDataValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlistDataValue:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPropertiesToFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertiesToFetch:");
}

id objc_msgSend_setPropertiesToUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPropertiesToUpdate:");
}

id objc_msgSend_setRecordName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordName:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResultType:");
}

id objc_msgSend_setReturnsDistinctResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnsDistinctResults:");
}

id objc_msgSend_setScope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScope:");
}

id objc_msgSend_setServerSystemFieldsRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerSystemFieldsRecord:");
}

id objc_msgSend_setServerSystemFieldsRecordData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerSystemFieldsRecordData:");
}

id objc_msgSend_setServerSystemFieldsRecordIfNewer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServerSystemFieldsRecordIfNewer:");
}

id objc_msgSend_setShouldAddStoreAsynchronously_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldAddStoreAsynchronously:");
}

id objc_msgSend_setShouldInferMappingModelAutomatically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldInferMappingModelAutomatically:");
}

id objc_msgSend_setShouldMigrateStoreAutomatically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldMigrateStoreAutomatically:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStore:");
}

id objc_msgSend_setSyncAnchorServerSystemFieldsRecordData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncAnchorServerSystemFieldsRecordData:");
}

id objc_msgSend_setSyncEngineMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncEngineMetadata:");
}

id objc_msgSend_setSyncEngineStateSerialization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSyncEngineStateSerialization:");
}

id objc_msgSend_setTestConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTestConfiguration:");
}

id objc_msgSend_setThreadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setThreadIdentifier:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTransactionAuthor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransactionAuthor:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUseClearAssetEncryption_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseClearAssetEncryption:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_withModificationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:withModificationDate:");
}

id objc_msgSend_setValueModificationDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValueModificationDate:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setXpcListener_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setXpcListener:");
}

id objc_msgSend_sharedHelper(void *a1, const char *a2, ...)
{
  return _[a1 sharedHelper];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_shouldEnforceQuotaForStoreConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldEnforceQuotaForStoreConfiguration:");
}

id objc_msgSend_shouldIgnoreFetchError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIgnoreFetchError:");
}

id objc_msgSend_shouldIncrementFailureCountForError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIncrementFailureCountForError:");
}

id objc_msgSend_shouldRetryAfterModifyError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldRetryAfterModifyError:");
}

id objc_msgSend_shouldShowNotifications(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowNotifications];
}

id objc_msgSend_shouldStopMigrationAfterError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldStopMigrationAfterError:");
}

id objc_msgSend_shouldSyncStoreWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSyncStoreWithIdentifier:");
}

id objc_msgSend_shouldUseTransactionForPlistAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUseTransactionForPlistAtURL:");
}

id objc_msgSend_showNotificationWithTitle_body_threadIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showNotificationWithTitle:body:threadIdentifier:");
}

id objc_msgSend_showUserNotificationIfEnabledForStoreIdentifier_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showUserNotificationIfEnabledForStoreIdentifier:format:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startListeningToTCCAccessChangedNotifications(void *a1, const char *a2, ...)
{
  return _[a1 startListeningToTCCAccessChangedNotifications];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateSerialization(void *a1, const char *a2, ...)
{
  return _[a1 stateSerialization];
}

id objc_msgSend_stateUpdateEvent(void *a1, const char *a2, ...)
{
  return _[a1 stateUpdateEvent];
}

id objc_msgSend_stopListeningToTCCAccessChangedNotifications(void *a1, const char *a2, ...)
{
  return _[a1 stopListeningToTCCAccessChangedNotifications];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return _[a1 store];
}

id objc_msgSend_storeDidChangeWithStoreID_changeDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeDidChangeWithStoreID:changeDictionary:");
}

id objc_msgSend_storeID(void *a1, const char *a2, ...)
{
  return _[a1 storeID];
}

id objc_msgSend_storeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 storeIdentifier];
}

id objc_msgSend_storeIdentifiersForInstalledBundles(void *a1, const char *a2, ...)
{
  return _[a1 storeIdentifiersForInstalledBundles];
}

id objc_msgSend_storeIdentifiersWithChangedValuesDuringFetchChanges(void *a1, const char *a2, ...)
{
  return _[a1 storeIdentifiersWithChangedValuesDuringFetchChanges];
}

id objc_msgSend_storeType(void *a1, const char *a2, ...)
{
  return _[a1 storeType];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_syd_accountForCurrentPersonaWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syd_accountForCurrentPersonaWithError:");
}

id objc_msgSend_syd_accountForPersonaIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syd_accountForPersonaIdentifier:error:");
}

id objc_msgSend_syd_accountIdentifierForCurrentPersona(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syd_accountIdentifierForCurrentPersona");
}

id objc_msgSend_syd_shortDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syd_shortDescription");
}

id objc_msgSend_syncAnchorServerSystemFieldsRecordData(void *a1, const char *a2, ...)
{
  return _[a1 syncAnchorServerSystemFieldsRecordData];
}

id objc_msgSend_syncEngine_accountChangedFromUserRecordID_toUserRecordID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncEngine:accountChangedFromUserRecordID:toUserRecordID:");
}

id objc_msgSend_syncEngineMetadata(void *a1, const char *a2, ...)
{
  return _[a1 syncEngineMetadata];
}

id objc_msgSend_syncEngineStateSerialization(void *a1, const char *a2, ...)
{
  return _[a1 syncEngineStateSerialization];
}

id objc_msgSend_syncEngineStateSerializationWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncEngineStateSerializationWithError:");
}

id objc_msgSend_syncManager_shouldSyncStoreWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncManager:shouldSyncStoreWithIdentifier:");
}

id objc_msgSend_syncManagerForStoreType_containerID_testConfiguration_createIfNecessary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncManagerForStoreType:containerID:testConfiguration:createIfNecessary:error:");
}

id objc_msgSend_syncManagerLookupKeyForCurrentPersonaWithTestConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "syncManagerLookupKeyForCurrentPersonaWithTestConfiguration:");
}

id objc_msgSend_syncManagersByPersona(void *a1, const char *a2, ...)
{
  return _[a1 syncManagersByPersona];
}

id objc_msgSend_synchronizeStoreWithIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeStoreWithIdentifier:completionHandler:");
}

id objc_msgSend_synchronizeStoresWithIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeStoresWithIdentifiers:completionHandler:");
}

id objc_msgSend_taskWithName_reason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "taskWithName:reason:");
}

id objc_msgSend_testConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 testConfiguration];
}

id objc_msgSend_testDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 testDeviceID];
}

id objc_msgSend_testServerName(void *a1, const char *a2, ...)
{
  return _[a1 testServerName];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_tombstone(void *a1, const char *a2, ...)
{
  return _[a1 tombstone];
}

id objc_msgSend_totalDataLength(void *a1, const char *a2, ...)
{
  return _[a1 totalDataLength];
}

id objc_msgSend_transactionContext(void *a1, const char *a2, ...)
{
  return _[a1 transactionContext];
}

id objc_msgSend_transactionalStoreWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transactionalStoreWithError:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return _[a1 uid];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_updatedProperties(void *a1, const char *a2, ...)
{
  return _[a1 updatedProperties];
}

id objc_msgSend_useSyncAnchor(void *a1, const char *a2, ...)
{
  return _[a1 useSyncAnchor];
}

id objc_msgSend_useUUIDRecordNames(void *a1, const char *a2, ...)
{
  return _[a1 useUUIDRecordNames];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userNotificationCenter(void *a1, const char *a2, ...)
{
  return _[a1 userNotificationCenter];
}

id objc_msgSend_userPersonaType(void *a1, const char *a2, ...)
{
  return _[a1 userPersonaType];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return _[a1 userPersonaUniqueString];
}

id objc_msgSend_validateKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateKey:error:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForEntitlement_xpcConnection_storeConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:xpcConnection:storeConfiguration:");
}

id objc_msgSend_valueModificationDate(void *a1, const char *a2, ...)
{
  return _[a1 valueModificationDate];
}

id objc_msgSend_willBeginFetchingChanges(void *a1, const char *a2, ...)
{
  return _[a1 willBeginFetchingChanges];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return _[a1 xpcConnection];
}

id objc_msgSend_xpcListener(void *a1, const char *a2, ...)
{
  return _[a1 xpcListener];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return _[a1 zoneID];
}

id objc_msgSend_zoneIDs(void *a1, const char *a2, ...)
{
  return _[a1 zoneIDs];
}

id objc_msgSend_zoneIDsWithUnfetchedServerChanges(void *a1, const char *a2, ...)
{
  return _[a1 zoneIDsWithUnfetchedServerChanges];
}

id objc_msgSend_zoneName(void *a1, const char *a2, ...)
{
  return _[a1 zoneName];
}

id objc_msgSend_zoneWithIDWasPurged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "zoneWithIDWasPurged:");
}