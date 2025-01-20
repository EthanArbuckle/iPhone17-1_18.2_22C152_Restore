void sub_100003308(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, (os_log_type_t)0x90u, a4, &a9, 0x16u);
}

void sub_100003334(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100003590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000035AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _processURLs];
}

uint64_t sub_1000037BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = brc_bread_crumbs();
  v8 = brc_default_log();
  if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
  {
    v12 = [*(id *)(a1 + 32) path];
    v13 = objc_msgSend(v12, "fp_obfuscatedPath");
    v14 = [v5 path];
    v15 = objc_msgSend(v14, "fp_obfuscatedPath");
    int v16 = 138413058;
    v17 = v13;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    v21 = v15;
    __int16 v22 = 2112;
    v23 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v8, (os_log_type_t)0x90u, "[ERROR] error enumerating %@: error %@ at %@%@", (uint8_t *)&v16, 0x2Au);
  }
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void **)(v9 + 128);
  *(void *)(v9 + 128) = v6;

  return 1;
}

void sub_100004404(id a1)
{
  id v1 = objc_alloc((Class)NSSet);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  qword_100015950 = (uint64_t)objc_msgSend(v1, "initWithObjects:", v2, v3, objc_opt_class(), 0);
  _objc_release_x1();
}

id sub_100005790(id a1, PQLResultSet *a2, id *a3)
{
  uint64_t v3 = a2;
  if ([(PQLResultSet *)v3 BOOLAtIndex:0])
  {
    id v4 = objc_alloc_init((Class)BRServerMetrics);
    [v4 setChildCount:&off_100010AA0];
    [v4 setRecursiveChildCount:&off_100010AA0];
    [v4 setSharedByMeRecursiveCount:&off_100010AA0];
    [v4 setSharedAliasRecursiveCount:&off_100010AA0];
  }
  else
  {
    id v4 = [objc_alloc((Class)BRServerMetrics) initFromResultSet:v3 pos:2];
    if (([(PQLResultSet *)v3 BOOLAtIndex:1] & 1) == 0)
    {
      id v5 = [v4 sharedByMeRecursiveCount];
      if ([v5 longLongValue] == (id)1)
      {
        id v6 = [v4 sharedAliasRecursiveCount];
        id v7 = [v6 longLongValue];

        if (!v7)
        {
          [v4 setSharedAliasRecursiveCount:&off_100010AB8];
          [v4 setSharedByMeRecursiveCount:&off_100010AA0];
        }
      }
      else
      {
      }
    }
  }

  return v4;
}

uint64_t start()
{
  if ((BRIsFPFSEnabled() & 1) == 0)
  {
    uint64_t v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1000098B8((uint64_t)v3, v4);
    }
  }
  if ((BRIsFPFSEnabled() & 1) == 0) {
    exit(1);
  }
  v0 = objc_opt_new();
  id v1 = +[NSXPCListener serviceListener];
  [v1 setDelegate:v0];
  [v1 resume];

  return 0;
}

id sub_100005F68(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[UMUserManager sharedManager];
  uint64_t v3 = [v2 currentPersona];
  id v4 = [v3 userPersonaUniqueString];

  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000076B8;
    v7[3] = &unk_1000105F8;
    id v8 = v4;
    id v9 = v1;
    id v5 = [v7 copy];
  }
  else
  {
    id v5 = objc_retainBlock(v1);
  }

  return v5;
}

id sub_100006070(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[UMUserManager sharedManager];
  uint64_t v3 = [v2 currentPersona];
  id v4 = [v3 userPersonaUniqueString];

  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100007B04;
    v7[3] = &unk_100010640;
    id v8 = v4;
    id v9 = v1;
    id v5 = [v7 copy];
  }
  else
  {
    id v5 = objc_retainBlock(v1);
  }

  return v5;
}

void sub_100006310(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  [v5 stopAccessingSecurityScopedResource];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100006664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id a19)
{
}

void sub_10000669C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7) {
    id v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  }
  else {
    id v10 = 0;
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = v7;
  id v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v33;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v11);
        }
        v15 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)v14) data];
        [v10 addObject:v15];

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v12);
  }

  if (v8) {
    id v16 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
  }
  else {
    id v16 = 0;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = v8;
  id v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      __int16 v20 = 0;
      do
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v17);
        }
        v21 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)v20) data];
        [v16 addObject:v21];

        __int16 v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [v17 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v18);
  }

  id v22 = (id)qword_100015958;
  objc_sync_enter(v22);
  v23 = (void *)qword_100015958;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v23 removeObject:WeakRetained];

  objc_sync_exit(v22);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  v25 = [*(id *)(a1 + 32) serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000069E0;
  block[3] = &unk_100010520;
  id v27 = *(id *)(a1 + 32);
  dispatch_sync(v25, block);
}

void sub_1000069C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000069E0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "brc_close");
}

void sub_100006B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100006DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_100006F1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007250(id a1, PQLConnection *a2, NSError *a3, id a4)
{
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
    sub_1000099E0();
  }
}

void sub_100007470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007490(uint64_t a1)
{
  uint64_t v2 = +[PQLRawInjection rawInjection:&unk_10000DB9D length:0];
  if ([*(id *)(a1 + 32) count])
  {
    uint64_t v3 = [*(id *)(a1 + 32) componentsJoinedByString:@","];
    uint64_t v4 = +[PQLFormatInjection formatInjection:@"AND zone_rowid IN (%@)", v3];

    uint64_t v2 = (void *)v4;
  }
  id v5 = [*(id *)(a1 + 40) numberWithSQL:@"SELECT COUNT(*) FROM client_unapplied_table WHERE throttle_state IN (1) %@", v2];
  if ([v5 longLongValue])
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100009AC0();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  id v8 = [*(id *)(a1 + 40) numberWithSQL:@"SELECT COUNT(*) FROM client_items WHERE item_localsyncupstate != 0 AND NOT item_id_is_documents(item_id) %@", v2];

  if ([v8 longLongValue])
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_100009A58();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    objc_msgSend(*(id *)(a1 + 40), "brc_close");
  }

  return 1;
}

void sub_1000076B8(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v2 = *(id *)(a1 + 32)) == 0)
  {
    if (qword_100015960 != -1) {
      dispatch_once(&qword_100015960, &stru_1000105D0);
    }
    id v3 = (id)qword_100015968;
    int v4 = 1;
  }
  else
  {
    id v3 = v2;
    int v4 = 0;
  }
  id v5 = +[UMUserManager sharedManager];
  id v6 = [v5 currentPersona];

  id v25 = 0;
  id v7 = [v6 userPersonaUniqueString];
  id v8 = v7;
  if (v7 == v3 || ([v7 isEqualToString:v3] & 1) != 0) {
    goto LABEL_9;
  }
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v4 && ([v6 isDataSeparatedPersona] & 1) == 0)
    {
      v21 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_100009C6C();
      }
    }
    else
    {
      id v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100009C04();
      }

      v14 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      if (v14) {
        goto LABEL_25;
      }
    }
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_10;
  }
  id v24 = 0;
  id v9 = [v6 copyCurrentPersonaContextWithError:&v24];
  id v10 = v24;
  id v11 = v25;
  id v25 = v9;

  if (v10)
  {
    id v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
      sub_100009B9C();
    }
  }
  v14 = [v6 generateAndRestorePersonaContextWithPersonaUniqueString:v3];

  if (!v14) {
    goto LABEL_9;
  }
  v15 = brc_bread_crumbs();
  id v16 = brc_default_log();
  if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
  {
    uint64_t v23 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v27 = v23;
    __int16 v28 = 2112;
    long long v29 = v14;
    __int16 v30 = 2112;
    long long v31 = v15;
    _os_log_error_impl((void *)&_mh_execute_header, v16, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  uint64_t v19 = brc_bread_crumbs();
  __int16 v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    sub_100009B28();
  }

LABEL_10:
  _BRRestorePersona();
}

void sub_100007A58(_Unwind_Exception *a1)
{
}

void sub_100007AA4(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_100015968;
  qword_100015968 = v1;
}

void sub_100007B04(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isEqualToString:@"__defaultPersonaID__"] & 1) != 0
    || (id v5 = *(id *)(a1 + 32)) == 0)
  {
    if (qword_100015970 != -1) {
      dispatch_once(&qword_100015970, &stru_100010618);
    }
    id v6 = (id)qword_100015978;
    int v7 = 1;
  }
  else
  {
    id v6 = v5;
    int v7 = 0;
  }
  id v8 = +[UMUserManager sharedManager];
  id v9 = [v8 currentPersona];

  id v30 = 0;
  id v10 = [v9 userPersonaUniqueString];
  id v11 = v10;
  if (v10 == v6 || ([v10 isEqualToString:v6] & 1) != 0) {
    goto LABEL_9;
  }
  if (!voucher_process_can_use_arbitrary_personas())
  {
    if (v7 && ([v9 isDataSeparatedPersona] & 1) == 0)
    {
      v26 = brc_bread_crumbs();
      uint64_t v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        sub_100009C6C();
      }
    }
    else
    {
      __int16 v20 = brc_bread_crumbs();
      v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_100009C04();
      }

      id v12 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:22 userInfo:0];
      if (v12) {
        goto LABEL_25;
      }
    }
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v12 = 0;
    goto LABEL_10;
  }
  id v29 = 0;
  id v13 = [v9 copyCurrentPersonaContextWithError:&v29];
  id v14 = v29;
  id v15 = v30;
  id v30 = v13;

  if (v14)
  {
    id v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, (os_log_type_t)0x90u)) {
      sub_100009B9C();
    }
  }
  id v12 = [v9 generateAndRestorePersonaContextWithPersonaUniqueString:v6];

  if (!v12) {
    goto LABEL_9;
  }
  id v18 = brc_bread_crumbs();
  uint64_t v19 = brc_default_log();
  if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
  {
    uint64_t v28 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v32 = v28;
    __int16 v33 = 2112;
    long long v34 = v12;
    __int16 v35 = 2112;
    v36 = v18;
    _os_log_error_impl((void *)&_mh_execute_header, v19, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
  }

LABEL_25:
  id v22 = brc_bread_crumbs();
  uint64_t v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
    sub_100009D3C();
  }

  if (!xpc_activity_set_state(v3, 3))
  {
    id v24 = brc_bread_crumbs();
    id v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_100009CD4();
    }
  }
LABEL_10:

  _BRRestorePersona();
}

void sub_100007F28(_Unwind_Exception *a1)
{
}

void sub_100007F7C(id a1)
{
  id v3 = +[UMUserPersonaAttributes personaAttributesForPersonaType:0];
  uint64_t v1 = [v3 userPersonaUniqueString];
  id v2 = (void *)qword_100015978;
  qword_100015978 = v1;
}

void sub_100007FDC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100008034(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_100008054(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, (os_log_type_t)0x90u, a4, (uint8_t *)va, 0x16u);
}

void sub_1000088C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
}

uint64_t sub_100008934(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008944(uint64_t a1)
{
}

uint64_t sub_10000894C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
  {
    id v12 = [*(id *)(a1 + 32) path];
    id v13 = objc_msgSend(v12, "fp_obfuscatedPath");
    id v14 = [v5 path];
    id v15 = objc_msgSend(v14, "fp_obfuscatedPath");
    int v16 = 138413058;
    id v17 = v13;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    v21 = v15;
    __int16 v22 = 2112;
    uint64_t v23 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v8, (os_log_type_t)0x90u, "[ERROR] error enumerating %@: error %@ at %@%@", (uint8_t *)&v16, 0x2Au);
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;

  return 1;
}

void sub_100008D8C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] parent directory is shared%@", (uint8_t *)&v2, 0xCu);
}

void sub_100008E04()
{
  sub_100003328();
  uint64_t v1 = [v0 path];
  int v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003308((void *)&_mh_execute_header, v3, v4, "[ERROR] Failed to open file URL %@ to lookup the share alias%@", v5, v6, v7, v8, v9);
}

void sub_100008EA0()
{
  sub_100003328();
  uint64_t v1 = [v0 path];
  int v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003308((void *)&_mh_execute_header, v3, v4, "[ERROR] Failed to locate the documentID for %@ to lookup the share alias%@", v5, v6, v7, v8, v9);
}

void sub_100008F3C()
{
  sub_100003328();
  uint64_t v1 = [v0 path];
  int v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003308((void *)&_mh_execute_header, v3, v4, "[ERROR] Failed to stat file URL %@ to lookup the share alias%@", v5, v6, v7, v8, v9);
}

void sub_100008FD8()
{
  sub_100003328();
  uint64_t v1 = [v0 path];
  int v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003308((void *)&_mh_execute_header, v3, v4, "[ERROR] Can't locate the item to find the share alias for %@%@", v5, v6, v7, v8, v9);
}

void sub_100009074(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Not adding top level share to the recursive item count%@", (uint8_t *)&v2, 0xCu);
}

void sub_1000090EC()
{
  sub_100003328();
  uint64_t v1 = [v0 path];
  int v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003334((void *)&_mh_execute_header, v3, v4, "[DEBUG] Processing document at url %@%@", v5, v6, v7, v8, v9);
}

void sub_100009188()
{
  sub_100003328();
  uint64_t v1 = [v0 path];
  int v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003334((void *)&_mh_execute_header, v3, v4, "[DEBUG] Processing symlink at url %@%@", v5, v6, v7, v8, v9);
}

void sub_100009224()
{
  sub_100003328();
  uint64_t v1 = [v0 url];
  int v2 = [v1 path];
  uint64_t v3 = objc_msgSend(v2, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003334((void *)&_mh_execute_header, v4, v5, "[DEBUG] Processing directory at url %@%@", v6, v7, v8, v9, v10);
}

void sub_1000092D8()
{
  sub_100003328();
  uint64_t v1 = [v0 path];
  int v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003334((void *)&_mh_execute_header, v3, v4, "[DEBUG] Skipping descendants of %@%@", v5, v6, v7, v8, v9);
}

void sub_100009374()
{
  sub_100003328();
  uint64_t v1 = [v0 path];
  int v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003334((void *)&_mh_execute_header, v3, v4, "[DEBUG] not counting item at url %@ because it's excluded from sync%@", v5, v6, v7, v8, v9);
}

void sub_100009410()
{
  sub_100003328();
  uint64_t v1 = [v0 path];
  int v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003334((void *)&_mh_execute_header, v3, v4, "[DEBUG] Skipping checksumming package at %@%@", v5, v6, v7, v8, v9);
}

void sub_1000094AC()
{
  sub_100003328();
  uint64_t v1 = [v0 path];
  int v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003334((void *)&_mh_execute_header, v3, v4, "[DEBUG] Checksumming flat file at %@%@", v5, v6, v7, v8, v9);
}

void sub_100009548()
{
  sub_100003328();
  uint64_t v1 = [v0 path];
  int v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003334((void *)&_mh_execute_header, v3, v4, "[DEBUG] Starting processing %@%@", v5, v6, v7, v8, v9);
}

void sub_1000095E4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, (os_log_type_t)0x90u, "[ERROR] Can't locate item with file object id %@%@", (uint8_t *)&v3, 0x16u);
}

void sub_10000966C()
{
  sub_100003328();
  uint64_t v1 = [v0 path];
  int v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003308((void *)&_mh_execute_header, v3, v4, "[ERROR] Couldn't add item for checksumming at %@%@", v5, v6, v7, v8, v9);
}

void sub_100009708()
{
  sub_100003328();
  uint64_t v1 = [v0 pathInPackage];
  int v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003308((void *)&_mh_execute_header, v3, v4, "[ERROR] File signature mismatch at path %@%@", v5, v6, v7, v8, v9);
}

void sub_1000097A4()
{
  sub_100003328();
  uint64_t v1 = [v0 path];
  int v2 = objc_msgSend(v1, "fp_obfuscatedPath");
  sub_1000032F0();
  sub_100003308((void *)&_mh_execute_header, v3, v4, "[ERROR] Can't open file at url to checksum %@%@", v5, v6, v7, v8, v9);
}

void sub_100009840(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: fileObjectID.type == BRFileObjectIDTypeDocument || fileObjectID.type == BRFileObjectIDTypeNonDocument%@", (uint8_t *)&v2, 0xCu);
}

void sub_1000098B8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: BRIsFPFSEnabled()%@", (uint8_t *)&v2, 0xCu);
}

void sub_100009930(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 path];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] opening telemetry db connection at path: %@%@", (uint8_t *)&v6, 0x16u);
}

void sub_1000099E0()
{
  sub_100007FF8();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "[CRIT] telemetry database connection encountered unexpected corruption: %@%@", v1, 0x16u);
}

void sub_100009A58()
{
  sub_10000801C();
  sub_100008034((void *)&_mh_execute_header, v0, v1, "[DEBUG] we have %lld active sync jobs%@");
}

void sub_100009AC0()
{
  sub_10000801C();
  sub_100008034((void *)&_mh_execute_header, v0, v1, "[DEBUG] we have %lld active apply jobs%@");
}

void sub_100009B28()
{
  sub_100008010();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to adopt persona for block adoption%@", v1, 0xCu);
}

void sub_100009B9C()
{
  sub_100007FF8();
  sub_100008054((void *)&_mh_execute_header, v0, v1, "[ERROR] won't restore persona: %@%@");
}

void sub_100009C04()
{
  sub_100008010();
  sub_100007FDC((void *)&_mh_execute_header, v0, v1, "[DEBUG] Not allowed to adopt persona - should fallback persona%@", v2, v3, v4, v5, v6);
}

void sub_100009C6C()
{
  sub_100008010();
  sub_100007FDC((void *)&_mh_execute_header, v0, v1, "[DEBUG] Not allowed to adopt persona but data-separatedness matches%@", v2, v3, v4, v5, v6);
}

void sub_100009CD4()
{
  sub_100008010();
  sub_100007FDC((void *)&_mh_execute_header, v0, v1, "[DEBUG] Failed to defer the activity after persona failure.%@", v2, v3, v4, v5, v6);
}

void sub_100009D3C()
{
  sub_100008010();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't adopt persona for xpc activity, deferring the activity%@", v1, 0xCu);
}

uint64_t BRCGetOrAllocateDocID()
{
  return _BRCGetOrAllocateDocID();
}

uint64_t BRDiskCheckerServiceInterface()
{
  return _BRDiskCheckerServiceInterface();
}

uint64_t BRIsFPFSEnabled()
{
  return _BRIsFPFSEnabled();
}

uint64_t _BRCClassesForContainerState()
{
  return __BRCClassesForContainerState();
}

uint64_t _BRRestorePersona()
{
  return __BRRestorePersona();
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

uint32_t arc4random(void)
{
  return _arc4random();
}

uint64_t brc_bread_crumbs()
{
  return _brc_bread_crumbs();
}

uint64_t brc_default_log()
{
  return _brc_default_log();
}

int close(int a1)
{
  return _close(a1);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return _openat(a1, a2, a3);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t voucher_process_can_use_arbitrary_personas()
{
  return _voucher_process_can_use_arbitrary_personas();
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

id objc_msgSend__countOfShareAliasesNotOnDisk(void *a1, const char *a2, ...)
{
  return [a1 _countOfShareAliasesNotOnDisk];
}

id objc_msgSend__processNextRootURL(void *a1, const char *a2, ...)
{
  return [a1 _processNextRootURL];
}

id objc_msgSend__processURLs(void *a1, const char *a2, ...)
{
  return [a1 _processURLs];
}

id objc_msgSend_appLibraryOrZoneName(void *a1, const char *a2, ...)
{
  return [a1 appLibraryOrZoneName];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_childCount(void *a1, const char *a2, ...)
{
  return [a1 childCount];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return [a1 clear];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentPersona(void *a1, const char *a2, ...)
{
  return [a1 currentPersona];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_debugItemIDString(void *a1, const char *a2, ...)
{
  return [a1 debugItemIDString];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_directChildCount(void *a1, const char *a2, ...)
{
  return [a1 directChildCount];
}

id objc_msgSend_done(void *a1, const char *a2, ...)
{
  return [a1 done];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isAppLibraryRoot(void *a1, const char *a2, ...)
{
  return [a1 isAppLibraryRoot];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isDataSeparatedPersona(void *a1, const char *a2, ...)
{
  return [a1 isDataSeparatedPersona];
}

id objc_msgSend_isExecutable(void *a1, const char *a2, ...)
{
  return [a1 isExecutable];
}

id objc_msgSend_isShared(void *a1, const char *a2, ...)
{
  return [a1 isShared];
}

id objc_msgSend_isSharedToMeTopLevelItem(void *a1, const char *a2, ...)
{
  return [a1 isSharedToMeTopLevelItem];
}

id objc_msgSend_isWritable(void *a1, const char *a2, ...)
{
  return [a1 isWritable];
}

id objc_msgSend_itemIDString(void *a1, const char *a2, ...)
{
  return [a1 itemIDString];
}

id objc_msgSend_keysToFetch(void *a1, const char *a2, ...)
{
  return [a1 keysToFetch];
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return [a1 lastError];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_next(void *a1, const char *a2, ...)
{
  return [a1 next];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_ownerName(void *a1, const char *a2, ...)
{
  return [a1 ownerName];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathInPackage(void *a1, const char *a2, ...)
{
  return [a1 pathInPackage];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_providerItemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 providerItemIdentifier];
}

id objc_msgSend_rawID(void *a1, const char *a2, ...)
{
  return [a1 rawID];
}

id objc_msgSend_recursiveChildCount(void *a1, const char *a2, ...)
{
  return [a1 recursiveChildCount];
}

id objc_msgSend_recursiveItemCount(void *a1, const char *a2, ...)
{
  return [a1 recursiveItemCount];
}

id objc_msgSend_recursiveShareAliasCount(void *a1, const char *a2, ...)
{
  return [a1 recursiveShareAliasCount];
}

id objc_msgSend_recursiveSharedByMeCount(void *a1, const char *a2, ...)
{
  return [a1 recursiveSharedByMeCount];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_shareAliasMissing(void *a1, const char *a2, ...)
{
  return [a1 shareAliasMissing];
}

id objc_msgSend_sharedAliasRecursiveCount(void *a1, const char *a2, ...)
{
  return [a1 sharedAliasRecursiveCount];
}

id objc_msgSend_sharedByMeRecursiveCount(void *a1, const char *a2, ...)
{
  return [a1 sharedByMeRecursiveCount];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_signature(void *a1, const char *a2, ...)
{
  return [a1 signature];
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return [a1 skipDescendants];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return [a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_telemetryWarningEvents(void *a1, const char *a2, ...)
{
  return [a1 telemetryWarningEvents];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_useSerialQueue(void *a1, const char *a2, ...)
{
  return [a1 useSerialQueue];
}

id objc_msgSend_userPersonaUniqueString(void *a1, const char *a2, ...)
{
  return [a1 userPersonaUniqueString];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}