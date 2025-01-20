id sub_100001BF4(void *a1)
{
  id v1;
  id v2;
  void v4[4];
  id v5;
  uint64_t vars8;

  v1 = a1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100001CAC;
  v4[3] = &unk_1000145E8;
  v2 = (id)objc_opt_new();
  v5 = v2;
  [v1 enumerateKeysAndObjectsUsingBlock:v4];

  return v2;
}

void sub_100001CAC(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = sub_100001BF4(v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
    uint64_t v6 = [v5 path];
  }
  v7 = (void *)v6;

  id v5 = v7;
LABEL_6:
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v8];
}

void sub_100001D78(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  v4 = +[FPDaemonConnection sharedConnection];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100001E24;
  v6[3] = &unk_100014610;
  id v7 = v3;
  id v5 = v3;
  [v4 providerDomainsCompletionHandler:v6];
}

void sub_100001E24(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      id v16 = v8;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v6);
          }
          sub_1000094E0(@"%@", v9, v10, v11, v12, v13, v14, v15, *(void *)(*((void *)&v19 + 1) + 8 * i));
        }
        id v16 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v16);
    }
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v7();
}

void sub_100001F5C(int a1, char *const *a2, void *a3)
{
  int v22 = a1;
  long long v21 = (char **)a2;
  id v3 = a3;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = sub_1000021C8;
  v19[4] = sub_1000021D8;
  id v20 = 0;
  v4 = dispatch_group_create();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_1000021C8;
  v17[4] = sub_1000021D8;
  id v18 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000022E4;
  v16[3] = &unk_100014678;
  v16[4] = v17;
  sub_1000021E0(&v22, (char *const **)&v21, "B:", (const option *)&off_100014630, v16);
  dispatch_group_enter(v4);
  int v5 = v22;
  uint64_t v6 = (uint64_t *)v21;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100002380;
  v12[3] = &unk_1000146C8;
  uint64_t v14 = v19;
  id v7 = v4;
  uint64_t v13 = v7;
  uint64_t v15 = v17;
  sub_10000B244(v5, v6, 2, v12);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002838;
  v9[3] = &unk_1000146F0;
  id v10 = v3;
  uint64_t v11 = v19;
  id v8 = v3;
  dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, v9);

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

void sub_1000021A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000021C8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000021D8(uint64_t a1)
{
}

void sub_1000021E0(int *a1, char *const **a2, const char *a3, const option *a4, void *a5)
{
  uint64_t v9 = a5;
  int v10 = 1;
  optreset = 1;
  optind = 1;
  if ((unint64_t)a3 | (unint64_t)a4)
  {
    for (i = v9; ; i[2](i, v11, optarg))
    {
      uint64_t v11 = getopt_long(*a1, *a2, a3, a4, 0);
      if (v11 == -1) {
        break;
      }
      if (v11 == 63 || v11 == 58) {
        sub_100003158();
      }
    }
    int v10 = optind;
    uint64_t v9 = i;
  }
  *a1 -= v10;
  *a2 += optind;
}

uint64_t sub_1000022E4(uint64_t result, int a2, char *__s1)
{
  if (a2 == 66)
  {
    uint64_t v5 = result;
    if (!strcmp(__s1, "root"))
    {
      uint64_t v6 = *(void *)(*(void *)(v5 + 32) + 8);
      *(void *)(v6 + 40) = NSFileProviderRootContainerItemIdentifier;
    }
    else
    {
      *(void *)(*(void *)(*(void *)(v5 + 32) + 8) + 40) = +[NSString stringWithUTF8String:__s1];
    }
    return _objc_release_x1();
  }
  return result;
}

void sub_100002380(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v19 = a3;
  if (v19)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          int v10 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v9);
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
          if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
          {
            id v11 = objc_alloc((Class)FPItemID);
            uint64_t v12 = [v10 identifier];
            id v13 = [v11 initWithProviderDomainID:v12 itemIdentifier:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

            uint64_t v14 = +[FPDaemonConnection sharedConnectionProxy];
            v24[0] = _NSConcreteStackBlock;
            v24[1] = 3221225472;
            v24[2] = sub_100002650;
            v24[3] = &unk_1000146A0;
            v24[4] = v10;
            long long v20 = *(_OWORD *)(a1 + 32);
            id v15 = (id)v20;
            long long v25 = v20;
            [v14 waitForChangesOnItemsBelowItemWithID:v13 completionHandler:v24];
          }
          else
          {
            id v16 = +[FPDaemonConnection sharedConnectionProxy];
            uint64_t v17 = [v10 identifier];
            v22[0] = _NSConcreteStackBlock;
            v22[1] = 3221225472;
            v22[2] = sub_100002744;
            v22[3] = &unk_1000146A0;
            v22[4] = v10;
            long long v21 = *(_OWORD *)(a1 + 32);
            id v18 = (id)v21;
            long long v23 = v21;
            [v16 waitForStabilizationOfDomainWithID:v17 completionHandler:v22];
          }
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v7);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100002650(uint64_t a1, void *a2)
{
  id v29 = a2;
  if (objc_msgSend(v29, "fp_isFeatureUnsupportedError"))
  {
    uint64_t v3 = [*(id *)(a1 + 32) identifier];
    sub_1000094E0(@"☑️  domain %@ does not support stabilization", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) identifier];
    if (v29)
    {
      long long v28 = [v29 localizedDescription];
      sub_1000095FC(@"⚠️  stabilization of domain %@ failed: %@", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v3);

      uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
      long long v26 = *(void **)(v25 + 40);
      if (!v26) {
        long long v26 = v29;
      }
      id v27 = v26;
      uint64_t v3 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v27;
    }
    else
    {
      sub_1000094E0(@"✅  domain %@ is stable", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v3);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100002744(uint64_t a1, void *a2)
{
  id v29 = a2;
  if (objc_msgSend(v29, "fp_isFeatureUnsupportedError"))
  {
    uint64_t v3 = [*(id *)(a1 + 32) identifier];
    sub_1000094E0(@"☑️  domain %@ does not support stabilization", v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) identifier];
    if (v29)
    {
      long long v28 = [v29 localizedDescription];
      sub_1000095FC(@"⚠️  stabilization of domain %@ failed: %@", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v3);

      uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
      long long v26 = *(void **)(v25 + 40);
      if (!v26) {
        long long v26 = v29;
      }
      id v27 = v26;
      uint64_t v3 = *(void **)(v25 + 40);
      *(void *)(v25 + 40) = v27;
    }
    else
    {
      sub_1000094E0(@"✅  domain %@ is stable", v11, v12, v13, v14, v15, v16, v17, (uint64_t)v3);
    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t sub_100002838(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t sub_100002854(uint64_t a1, const char **a2)
{
  posix_spawn_file_actions_t v13 = 0;
  *(void *)uint64_t v14 = 0;
  uint64_t v3 = posix_spawn_file_actions_init(&v13);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  uint64_t v6 = posix_spawn_file_actions_adddup2(&v13, 2, 2);
  if (v6)
  {
    uint64_t v4 = v6;
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  uint64_t v7 = posix_spawn_file_actions_adddup2(&v13, 1, 1);
  if (v7)
  {
    uint64_t v4 = v7;
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  uint64_t v8 = posix_spawn_file_actions_adddup2(&v13, 0, 0);
  if (v8)
  {
    uint64_t v4 = v8;
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
LABEL_12:
    }
      sub_10000D784(v4);
LABEL_13:

    return v4;
  }
  uint64_t v10 = posix_spawnp(v14, *a2, &v13, 0, (char *const *)a2, environ);
  if (v10)
  {
    uint64_t v4 = v10;
    uint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000D6E4((uint64_t *)a2, v4, v11);
    }
  }
  else
  {
    while (waitpid(v14[0], &v14[1], 0) < 0 && *__error() == 4)
      ;
    posix_spawn_file_actions_destroy(&v13);
    if ((v14[1] & 0xFF00) != 0) {
      unsigned int v12 = 3;
    }
    else {
      unsigned int v12 = 0;
    }
    if ((v14[1] & 0x7F) != 0) {
      return 3;
    }
    else {
      return v12;
    }
  }
  return v4;
}

void sub_100002A34(int a1, char *const *a2, void *a3)
{
  int v44 = a1;
  v43 = a2;
  id v3 = a3;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = sub_1000021C8;
  v32 = sub_1000021D8;
  id v33 = 0;
  id v33 = (id)objc_opt_new();
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100002DD8;
  v22[3] = &unk_100014820;
  uint64_t v24 = &v39;
  uint64_t v25 = v38;
  long long v26 = &v34;
  id v4 = v3;
  id v23 = v4;
  id v27 = &v28;
  sub_1000021E0(&v44, &v43, "R:r:w:d:et:", (const option *)&off_100014710, v22);
  int v5 = *((unsigned __int8 *)v40 + 24);
  if (v5 == ([(id)v29[5] count] != 0)) {
    sub_100003158();
  }
  int v6 = v44;
  if (v44 >= 1 && *((unsigned char *)v35 + 24))
  {
    id v7 = +[NSError fp_errorWithPOSIXCode:22 description:@"Can't specify both a timeout and a subcommand"];
    (*((void (**)(id, id))v4 + 2))(v4, v7);
  }
  else if (*((unsigned char *)v40 + 24))
  {
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100003184;
    v20[3] = &unk_100014848;
    id v21 = v4;
    +[NSFileCoordinator _getDebugInfoWithCompletionHandler:v20];
    id v7 = v21;
  }
  else
  {
    id v7 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:0];
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = v29[5];
    uint64_t v10 = objc_opt_new();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000031DC;
    v12[3] = &unk_100014870;
    id v11 = v8;
    id v13 = v11;
    id v14 = v4;
    uint64_t v15 = &v28;
    int v19 = v6;
    uint64_t v16 = &v34;
    uint64_t v17 = v38;
    uint64_t v18 = v43;
    [v7 coordinateAccessWithIntents:v9 queue:v10 byAccessor:v12];
  }
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v39, 8);
}

void sub_100002D8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 192), 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100002DD8(void *a1, int a2, uint64_t a3)
{
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_1000021C8;
  v31 = sub_1000021D8;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_1000021C8;
  uint64_t v25 = sub_1000021D8;
  id v26 = 0;
  uint64_t v5 = (a2 - 82);
  if (v5 <= 0x25)
  {
    if (((1 << (a2 - 82)) & 0x2100040001) != 0)
    {
      id v7 = dispatch_group_create();
      dispatch_group_enter(v7);
      uint64_t v8 = +[NSString stringWithUTF8String:a3];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000030BC;
      v17[3] = &unk_1000147F8;
      int v19 = &v27;
      uint64_t v20 = &v21;
      uint64_t v9 = v7;
      uint64_t v18 = v9;
      sub_10000971C(v8, 1, 0, v17);

      dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
      goto LABEL_9;
    }
    if (v5 == 19)
    {
      uint64_t v12 = a1[5];
    }
    else
    {
      if (v5 != 34) {
        goto LABEL_9;
      }
      uint64_t v10 = +[NSString stringWithUTF8String:a3];
      [v10 doubleValue];
      *(void *)(*(void *)(a1[6] + 8) + 24) = v11;

      uint64_t v12 = a1[7];
    }
    *(unsigned char *)(*(void *)(v12 + 8) + 24) = 1;
  }
LABEL_9:
  if (v22[5])
  {
    (*(void (**)(void))(a1[4] + 16))();
    id v13 = 0;
    goto LABEL_24;
  }
  id v13 = 0;
  if (a2 <= 113)
  {
    if (a2 != 82)
    {
      if (a2 != 100) {
        goto LABEL_24;
      }
      uint64_t v14 = 1;
      goto LABEL_21;
    }
    uint64_t v15 = 0x20000;
LABEL_19:
    uint64_t v16 = +[NSFileAccessIntent readingIntentWithURL:v28[5] options:v15];
    goto LABEL_22;
  }
  if (a2 != 119)
  {
    if (a2 != 114) {
      goto LABEL_24;
    }
    uint64_t v15 = 0;
    goto LABEL_19;
  }
  uint64_t v14 = 8;
LABEL_21:
  uint64_t v16 = +[NSFileAccessIntent writingIntentWithURL:v28[5] options:v14];
LABEL_22:
  id v13 = (void *)v16;
  if (v16) {
    [*(id *)(*(void *)(a1[8] + 8) + 40) addObject:v16];
  }
LABEL_24:

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

void sub_100003094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1000030BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100003158()
{
  v0 = getprogname();
  printf("File Provider control utility.\n%s <command> <options>\n\nCommands:\n  dump [<domain|provider>]                                       - dump state of fileprovider's daemon\n      --limit-dump-size                                                 limit the number of items dumped\n  evaluate <item>                                                - evaluate finder actions and decorations on item\n  evaluate <action> [<item>] <target item>                       - evaluate finder interactions\n  check | repair                                                 - run FPCK\n      -f                                                                perform a full dump (all items)\n      -a <path>                                                         perform check under path\n      -b <path>                                                         operate on an already created DB backup. If this is set you need to set -a to point to the domain root\n      -o <path>                                                         write output into file at path\n      -P                                                                no-pager output\n      -d                                                                dimisss low-importance invariants\n      -v                                                                print out files with broken invariants\n      -m [<providerDomainID>]                                           perform check on the d2d migration backup\n      -x xpc|daemon                                                     launch in XPC Service vs daemon (default)\n"
    "  obfuscate [<filename>/<path>...]                               - return the obfuscated form of the filename\n",
    v0);
  exit(64);
}

uint64_t sub_100003184(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000094E0(@"%@", a2, a3, a4, a5, a6, a7, a8, a2);
  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v9();
}

void sub_1000031DC(uint64_t a1, void *a2)
{
  id v24 = a2;
  [*(id *)(a1 + 32) timeIntervalSinceNow];
  sub_1000094E0(@"%.3f seconds passed before coordination callback was invoked.", v4, v5, v6, v7, v8, v9, v10, COERCE__INT64(-v3));
  if (v24)
  {
    uint64_t v18 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_3:
    v18();
    goto LABEL_4;
  }
  sub_1000094E0(@"Acquired coordinations with intents %@", v11, v12, v13, v14, v15, v16, v17, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  if (*(int *)(a1 + 80) <= 0)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
      +[NSDate dateWithTimeIntervalSinceNow:*(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
    }
    else {
    uint64_t v23 = +[NSDate distantFuture];
    }
    +[NSThread sleepUntilDate:v23];

    uint64_t v18 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_3;
  }
  uint64_t v20 = sub_100002854(v19, *(const char ***)(a1 + 72));
  uint64_t v21 = *(void *)(a1 + 40);
  if (v20)
  {
    uint64_t v22 = +[NSError fp_errorWithPOSIXCode:v20];
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
  }
LABEL_4:
}

void sub_100003348(int a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1 > 1)
  {
    uint64_t v7 = +[NSString stringWithUTF8String:*(void *)(a2 + 8)];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100003450;
    v8[3] = &unk_1000148C0;
    id v9 = v5;
    sub_10000971C(v7, 1, 1, v8);
  }
  else
  {
    uint64_t v6 = +[NSError fp_errorWithPOSIXCode:22 description:@"Error: must supply path"];
    (*((void (**)(id, void *))v5 + 2))(v5, v6);
  }
}

void sub_100003450(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v7 = [v5 fp_shortDescription];
    sub_1000094E0(@"Attempting to materialize item at %@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

    uint64_t v15 = +[FPDaemonConnection sharedConnectionProxy];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100003560;
    v16[3] = &unk_100014898;
    id v18 = *(id *)(a1 + 32);
    id v17 = v6;
    [v15 materializeURL:v17 completionHandler:v16];
  }
}

void sub_100003560(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    double v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    unsigned __int8 v39 = 0;
    uint64_t v4 = +[NSFileManager defaultManager];
    id v5 = [*(id *)(a1 + 32) path];
    unsigned __int8 v6 = [v4 fileExistsAtPath:v5 isDirectory:&v39];

    if (v6)
    {
      int v7 = v39;
      uint64_t v8 = [*(id *)(a1 + 32) fp_shortDescription];
      uint64_t v16 = (void *)v8;
      if (v7)
      {
        sub_1000094E0(@"ls %@:", v9, v10, v11, v12, v13, v14, v15, v8);

        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v17 = +[NSFileManager defaultManager];
        id v18 = [*(id *)(a1 + 32) path];
        uint64_t v19 = [v17 enumeratorAtPath:v18];

        id v20 = [v19 countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v36;
          do
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v36 != v22) {
                objc_enumerationMutation(v19);
              }
              id v24 = [*(id *)(*((void *)&v35 + 1) + 8 * i) fileSystemRepresentation];
              sub_1000094E0(@"%s", v25, v26, v27, v28, v29, v30, v31, (uint64_t)v24);
            }
            id v21 = [v19 countByEnumeratingWithState:&v35 objects:v40 count:16];
          }
          while (v21);
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        sub_1000094E0(@"file %@:", v9, v10, v11, v12, v13, v14, v15, v8);

        id v34 = [*(id *)(a1 + 32) path];
        execl("/usr/bin/file", "/usr/bin/file", "-b", [v34 fileSystemRepresentation], 0);
      }
    }
    else
    {
      uint64_t v32 = *(void *)(a1 + 40);
      id v33 = +[NSError fp_errorWithPOSIXCode:2 description:@"Error: file doesn't exist after materialization"];
      (*(void (**)(uint64_t, void *))(v32 + 16))(v32, v33);
    }
  }
}

id sub_100003814(uint64_t a1)
{
  uint64_t v5 = 0;
  unsigned __int8 v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = sub_1000021C8;
  uint64_t v9 = sub_1000021D8;
  id v10 = 0;
  v1 = +[NSString stringWithUTF8String:a1];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003938;
  v4[3] = &unk_100014910;
  v4[4] = &v5;
  sub_10000971C(v1, 1, 1, v4);

  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_100003920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003938(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  }
  else
  {
    uint64_t v7 = +[FPDaemonConnection synchronousSharedConnectionProxy];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100003A24;
    v8[3] = &unk_1000148E8;
    uint64_t v10 = *(void *)(a1 + 32);
    id v9 = v5;
    [v7 materializeURL:v9 completionHandler:v8];
  }
}

void sub_100003A24(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  else
  {
    char v27 = 0;
    id v5 = +[NSFileManager defaultManager];
    id v6 = [*(id *)(a1 + 32) path];
    unsigned __int8 v7 = [v5 fileExistsAtPath:v6 isDirectory:&v27];

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = +[NSError fp_errorWithPOSIXCode:2 description:@"Error: file doesn't exist after materialization"];
      uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;
    }
    if (v27)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v11 = +[NSFileManager defaultManager];
      uint64_t v12 = [*(id *)(a1 + 32) path];
      uint64_t v13 = [v11 enumeratorAtPath:v12];

      uint64_t v14 = (char *)[v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        while (1)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          if (!--v15)
          {
            uint64_t v15 = (char *)[v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
            if (!v15) {
              break;
            }
          }
        }
      }
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 32);
      uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 8);
      id obj = *(id *)(v18 + 40);
      uint64_t v13 = +[NSFileHandle fileHandleForReadingFromURL:v17 error:&obj];
      objc_storeStrong((id *)(v18 + 40), obj);
      if (v13)
      {
        uint64_t v19 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        id v21 = 0;
        id v20 = [v13 readDataUpToLength:10 error:&v21];
        objc_storeStrong(v19, v21);

        [v13 closeFile];
      }
    }
  }
}

id sub_100003C64(uint64_t a1)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_1000021C8;
  uint64_t v14 = sub_1000021D8;
  id v15 = 0;
  id v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  double v3 = +[NSString stringWithUTF8String:a1];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100003DC8;
  v7[3] = &unk_100014938;
  uint64_t v9 = &v10;
  id v4 = v2;
  uint64_t v8 = v4;
  sub_10000971C(v3, 0, 1, v7);

  dispatch_group_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);

  return v5;
}

void sub_100003DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003DC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    unsigned __int8 v7 = +[FPDaemonConnection synchronousSharedConnectionProxy];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100003ED8;
    v11[3] = &unk_1000148E8;
    long long v10 = *(_OWORD *)(a1 + 32);
    id v8 = (id)v10;
    long long v12 = v10;
    id v9 = [v7 evictItemAtURL:v5 evenIfEnumeratingFP:1 andClearACLForConsumer:0 evictionReason:2 completionHandler:v11];
  }
}

void sub_100003ED8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100003F38(unsigned int a1, char *const *a2, void *a3)
{
  unsigned int v21 = a1;
  id v20 = a2;
  double v3 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100004330;
  v15[3] = &unk_100014678;
  v15[4] = &v16;
  sub_1000021E0((int *)&v21, &v20, "n", (const option *)&off_100014958, v15);
  uint64_t v4 = v21;
  if ((int)v21 <= 0)
  {
    long long v10 = +[NSError fp_errorWithPOSIXCode:22 description:@"Error: must supply path"];
    v3[2](v3, v10);
  }
  else
  {
    id v5 = v20;
    if (*((unsigned char *)v17 + 24))
    {
      uint64_t v14 = v3;
      uint64_t v34 = 0;
      long long v35 = &v34;
      uint64_t v36 = 0x3032000000;
      long long v37 = sub_1000021C8;
      long long v38 = sub_1000021D8;
      id v39 = 0;
      id v6 = dispatch_group_create();
      do
      {
        dispatch_group_enter(v6);
        unsigned __int8 v7 = +[NSString stringWithUTF8String:*v5];
        uint64_t v28 = _NSConcreteStackBlock;
        uint64_t v29 = 3221225472;
        uint64_t v30 = sub_1000058C0;
        uint64_t v31 = &unk_100014B98;
        id v8 = v6;
        uint64_t v32 = v8;
        id v33 = &v34;
        sub_10000971C(v7, 0, 1, &v28);

        ++v5;
        --v4;
      }
      while (v4);
      block = _NSConcreteStackBlock;
      uint64_t v23 = 3221225472;
      id v9 = sub_100005EFC;
    }
    else
    {
      uint64_t v14 = v3;
      uint64_t v34 = 0;
      long long v35 = &v34;
      uint64_t v36 = 0x3032000000;
      long long v37 = sub_1000021C8;
      long long v38 = sub_1000021D8;
      id v39 = 0;
      uint64_t v11 = dispatch_group_create();
      do
      {
        dispatch_group_enter(v11);
        long long v12 = +[NSString stringWithUTF8String:*v5];
        uint64_t v28 = _NSConcreteStackBlock;
        uint64_t v29 = 3221225472;
        uint64_t v30 = sub_100005F18;
        uint64_t v31 = &unk_100014B98;
        id v8 = v11;
        uint64_t v32 = v8;
        id v33 = &v34;
        sub_10000971C(v12, 0, 1, &v28);

        ++v5;
        --v4;
      }
      while (v4);
      block = _NSConcreteStackBlock;
      uint64_t v23 = 3221225472;
      id v9 = sub_1000060EC;
    }
    long long v24 = v9;
    long long v25 = &unk_1000146F0;
    long long v26 = v14;
    char v27 = &v34;
    uint64_t v13 = v14;
    dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, &block);

    _Block_object_dispose(&v34, 8);
  }
  _Block_object_dispose(&v16, 8);
}

void sub_100004300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004330(uint64_t result, int a2)
{
  if (a2 == 110) {
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  }
  return result;
}

void sub_10000434C(unsigned int a1, char *const *a2, void *a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000046E8;
  v6[3] = &unk_1000149C8;
  id v7 = a3;
  id v5 = v7;
  sub_1000043F0(a1, a2, v6);
}

void sub_1000043F0(unsigned int a1, char *const *a2, void *a3)
{
  unsigned int v33 = a1;
  uint64_t v32 = a2;
  double v3 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 1;
  uint64_t v20 = 0;
  unsigned int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100006108;
  v15[3] = &unk_100014BC0;
  v15[4] = &v20;
  void v15[5] = &v28;
  v15[6] = &v24;
  v15[7] = &v16;
  sub_1000021E0((int *)&v33, &v32, "flo:Pd:", (const option *)&off_1000149E8, v15);
  uint64_t v4 = v33;
  if ((int)v33 < 1)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = +[NSString stringWithUTF8String:*v32];
  }
  id v6 = (const char *)v29[3];
  if (!v6 || !strcmp((const char *)v29[3], "-"))
  {
    if (*((unsigned char *)v25 + 24))
    {
      id v9 = [objc_alloc((Class)FPCTLTermDumper) initWithFd:1 forceColor:0];
      [v9 startPager];
    }
    id v8 = +[NSFileHandle fileHandleWithStandardOutput];
  }
  else
  {
    uint64_t v7 = open(v6, 1797, 384);
    if ((v7 & 0x80000000) != 0)
    {
      uint64_t v11 = v32;
      uint64_t v12 = v17[3];
      uint64_t v13 = v21[3];
      uint64_t v14 = +[NSError fp_errorWithPOSIXCode:*__error()];
      v3[2](v3, v4, v11, v12, 0, v13, v5, v14);

      long long v10 = 0;
      goto LABEL_12;
    }
    id v8 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v7 closeOnDealloc:1];
  }
  long long v10 = v8;
  ((void (**)(id, uint64_t, char *const *, uint64_t, id, uint64_t, void *, void *))v3)[2](v3, v4, v32, v17[3], v8, v21[3], v5, 0);
LABEL_12:

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
}

void sub_10000469C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1000046E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, uint64_t a8)
{
  id v12 = a5;
  id v13 = a7;
  if (a8)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v14 = +[FPDaemonConnection connectionForUser:geteuid()];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000047F4;
    v15[3] = &unk_1000149A0;
    id v16 = *(id *)(a1 + 32);
    [v14 dumpStateTo:v12 providerFilter:v13 options:a6 completionHandler:v15];
  }
}

uint64_t sub_1000047F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004804(unsigned int a1, char *const *a2, void *a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000048A8;
  v6[3] = &unk_1000149C8;
  id v7 = a3;
  id v5 = v7;
  sub_1000043F0(a1, a2, v6);
}

void sub_1000048A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7, uint64_t a8)
{
  id v11 = a5;
  id v12 = a7;
  if (a8)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v13 = +[FPDaemonConnection connectionForUser:geteuid()];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    pid_t v14[2] = sub_1000049A4;
    v14[3] = &unk_1000149A0;
    id v15 = *(id *)(a1 + 32);
    [v13 dumpTelemetryTo:v11 providerFilter:v12 completionHandler:v14];
  }
}

uint64_t sub_1000049A4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000049B4(unsigned int a1, char *const *a2, void *a3)
{
  unsigned int v70 = a1;
  v69 = a2;
  uint64_t v65 = 0;
  v66 = &v65;
  uint64_t v67 = 0x2020000000;
  uint64_t v68 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x3032000000;
  v62 = sub_1000021C8;
  v63 = sub_1000021D8;
  id v64 = 0;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_1000021C8;
  v57 = sub_1000021D8;
  id v58 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 1;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  char v48 = 0;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  char v42 = sub_1000021C8;
  v43 = sub_1000021D8;
  id v44 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 2;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100004E1C;
  v19[3] = &unk_100014AD0;
  unsigned int v21 = &v45;
  uint64_t v22 = &v31;
  uint64_t v23 = &v59;
  uint64_t v24 = &v65;
  long long v25 = &v49;
  uint64_t v26 = &v53;
  uint64_t v27 = &v35;
  id v5 = a3;
  unsigned int v30 = a1;
  uint64_t v28 = &v39;
  uint64_t v29 = a2;
  id v20 = v5;
  sub_1000021E0((int *)&v70, &v69, "sthfa:o:Pdvb:mx:", (const option *)&off_1000149E8, v19);
  if (*((unsigned char *)v46 + 24)) {
    sub_100003158();
  }
  id v6 = (const char *)v66[3];
  if (!v6 || !strcmp((const char *)v66[3], "-"))
  {
    if (*((unsigned char *)v50 + 24))
    {
      id v9 = [objc_alloc((Class)FPCTLTermDumper) initWithFd:1 forceColor:0];
      [v9 startPager];
    }
    id v8 = +[NSFileHandle fileHandleWithStandardOutput];
  }
  else
  {
    uint64_t v7 = open(v6, 1797, 384);
    if ((v7 & 0x80000000) != 0)
    {
      uint64_t v11 = v70;
      id v12 = v69;
      uint64_t v13 = v60[5];
      uint64_t v14 = v54[5];
      uint64_t v15 = v32[3];
      uint64_t v16 = v40[5];
      uint64_t v17 = v36[3];
      uint64_t v18 = +[NSError fp_errorWithPOSIXCode:*__error()];
      (*((void (**)(id, uint64_t, char *const *, void, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *))v5
       + 2))(v5, v11, v12, 0, v13, v14, v15, v16, v17, v18);

      long long v10 = 0;
      goto LABEL_10;
    }
    id v8 = [objc_alloc((Class)NSFileHandle) initWithFileDescriptor:v7 closeOnDealloc:1];
  }
  long long v10 = v8;
  (*((void (**)(id, void, char *const *, id, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void))v5 + 2))(v5, v70, v69, v8, v60[5], v54[5], v32[3], v40[5], v36[3], 0);
LABEL_10:

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v65, 8);
}

void sub_100004DA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 256), 8);
  _Block_object_dispose((const void *)(v41 - 224), 8);
  _Block_object_dispose((const void *)(v41 - 176), 8);
  _Block_object_dispose((const void *)(v41 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100004E1C(uint64_t a1, int a2, uint64_t a3)
{
  switch(a2)
  {
    case 'a':
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = +[NSURL fileURLWithPath:v11];
      uint64_t v5 = [v4 URLByStandardizingPath];
      uint64_t v6 = *(void *)(a1 + 56);
      goto LABEL_14;
    case 'b':
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v4 = +[NSURL fileURLWithPath:v11];
      uint64_t v5 = [v4 URLByStandardizingPath];
      uint64_t v6 = *(void *)(a1 + 80);
LABEL_14:
      uint64_t v9 = *(void *)(v6 + 8);
      long long v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v5;

      goto LABEL_15;
    case 'c':
    case 'e':
    case 'g':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'n':
    case 'p':
    case 'q':
    case 'r':
    case 'u':
    case 'w':
      return;
    case 'd':
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(void *)(v7 + 24) | 2;
      goto LABEL_21;
    case 'f':
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(void *)(v7 + 24) | 1;
      goto LABEL_21;
    case 'h':
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      return;
    case 'm':
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(void *)(v7 + 24) | 8;
      goto LABEL_21;
    case 'o':
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = a3;
      return;
    case 's':
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(void *)(v7 + 24) | 0x20;
      goto LABEL_21;
    case 't':
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(void *)(v7 + 24) | 0x10;
      goto LABEL_21;
    case 'v':
      uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v8 = *(void *)(v7 + 24) | 4;
LABEL_21:
      *(void *)(v7 + 24) = v8;
      break;
    case 'x':
      +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      if ([v11 isEqualToString:@"daemon"])
      {
        *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
      }
      else if ([v11 isEqualToString:@"xpc"])
      {
        *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      }
      else
      {
        uint64_t v4 = +[NSError fp_invalidArgumentError:@"-x check unrecognized option %@", v11];
        (*(void (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 112));
LABEL_15:
      }

      break;
    default:
      if (a2 == 80) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      }
      break;
  }
}

void sub_10000510C(int a1, uint64_t a2, void *a3)
{
  uint64_t v19 = a3;
  if (a1 > 1)
  {
    uint64_t v6 = (uint64_t *)(a2 + 8);
    uint64_t v7 = a1 - 1;
    do
    {
      id v8 = objc_alloc((Class)NSString);
      uint64_t v9 = *v6++;
      id v10 = [v8 initWithCString:v9 encoding:4];
      id v11 = [v10 fp_alwaysObfuscatedPath];
      sub_1000094E0(@"%@", v12, v13, v14, v15, v16, v17, v18, (uint64_t)v11);

      --v7;
    }
    while (v7);
  }
  else
  {
    uint64_t v5 = +[NSError fp_errorWithPOSIXCode:22 description:@"Error: please provide a name of a file"];
    v19[2](v19, v5);
  }
  v19[2](v19, 0);
}

void sub_100005214(int a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a3;
  if (a1 > 1)
  {
    uint64_t v7 = +[NSString stringWithUTF8String:*(void *)(a2 + 8)];
    id v8 = +[NSURL fileURLWithPath:v7];

    uint64_t v47 = 0;
    uint64_t v9 = FPGetImportCookieForURL();
    id v10 = 0;
    if (v9)
    {
      if ([v9 hasExpired]) {
        sub_1000094E0(@"cookie has expired", v11, v12, v13, v14, v15, v16, v17, v41);
      }
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      uint64_t v18 = [v9 entries];
      id v19 = [v18 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v19)
      {
        id v20 = v19;
        id v42 = v10;
        uint64_t v21 = *(void *)v44;
        do
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v44 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            uint64_t v24 = [v9 entries];
            long long v25 = [v24 objectForKeyedSubscript:v23];

            uint64_t v26 = [v25 domainPathRelativeToVolumeRoot];
            [v25 fileID];
            sub_1000094E0(@"%@ %llu", v27, v28, v29, v30, v31, v32, v33, (uint64_t)v26);
          }
          id v20 = [v18 countByEnumeratingWithState:&v43 objects:v48 count:16];
        }
        while (v20);
        id v10 = v42;
      }
    }
    else
    {
      uint64_t v18 = [v8 path];
      sub_1000094E0(@"no import cookie for %@", v34, v35, v36, v37, v38, v39, v40, (uint64_t)v18);
    }

    v5[2](v5, v10);
  }
  else
  {
    uint64_t v6 = +[NSError fp_errorWithPOSIXCode:22 description:@"error: missing operation"];
    v5[2](v5, v6);
  }
}

uint64_t start(int a1, char *const *a2)
{
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2020000000;
  int v28 = 0;
  getpid();
  if (fpfs_lp_sandbox_check()) {
    errx(1, "Trying to invoke fileproviderctl from a sandboxed process");
  }
  if (os_variant_has_internal_content()) {
    execv("/usr/local/bin/fileproviderctl_internal", a2);
  }
  id v5 = (id)fp_default_log();
  if (!getuid()) {
    sub_1000095FC(@"⚠️  running as root, file operations might not work correctly", v6, v7, v8, v9, v10, v11, v12, v23[0]);
  }
  fpfs_enable_fts_thread_fchdir();
  unsigned int v13 = a1 - 1;
  if (a1 <= 1) {
    sub_100003158();
  }
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000057A4;
  v24[3] = &unk_100014AF8;
  v24[4] = &v25;
  uint64_t v15 = objc_retainBlock(v24);
  uint64_t v17 = *((void *)a2 + 1);
  uint64_t v16 = a2 + 1;
  uint64_t v18 = +[NSString stringWithUTF8String:v17];
  if ([v18 isEqualToString:@"dump"])
  {
    sub_10000434C(v13, v16, v15);
  }
  else if ([v18 isEqualToString:@"dumpTelemetry"])
  {
    sub_100004804(v13, v16, v15);
  }
  else if (([v18 isEqualToString:@"check"] & 1) != 0 {
         || [v18 isEqualToString:@"repair"])
  }
  {
    v23[0] = (uint64_t)_NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = (uint64_t)sub_10000580C;
    v23[3] = (uint64_t)&unk_100014AF8;
    v23[4] = (uint64_t)&v25;
    id v19 = objc_retainBlock(v23);
    if ([v18 isEqualToString:@"check"]) {
      sub_10000C260(v13, v16, v19);
    }
    else {
      sub_10000C3EC(v13, v16, v19);
    }
  }
  else if ([v18 isEqualToString:@"evaluate"])
  {
    sub_100007F94(v13, (uint64_t)v16, v15);
  }
  else
  {
    if (![v18 isEqualToString:@"obfuscate"]) {
      sub_100003158();
    }
    sub_10000510C(v13, (uint64_t)v16, v15);
  }
  id v20 = +[NSRunLoop mainRunLoop];
  [v20 run];

  uint64_t v21 = *((unsigned int *)v26 + 6);
  _Block_object_dispose(&v25, 8);
  return v21;
}

void sub_100005784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000057A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v5 = [v3 description];
    sub_1000095FC(@"Error: %@\n", v6, v7, v8, v9, v10, v11, v12, (uint64_t)v5);

    int v4 = 1;
  }
  else
  {
    int v4 = 0;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  exit(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

void sub_10000580C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    int v4 = 0;
    goto LABEL_8;
  }
  id v5 = v3;
  uint64_t v6 = [v3 domain];
  if ([v6 isEqualToString:@"FPCKDomain"])
  {
    id v7 = [v5 code];

    if (v7 == (id)65)
    {
      int v4 = 65;
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v8 = [v5 description];
  sub_1000095FC(@"Error: %@\n", v9, v10, v11, v12, v13, v14, v15, (uint64_t)v8);

  int v4 = 1;
LABEL_8:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
  exit(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

void sub_1000058C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = *(id *)(a1 + 32);
    id v7 = a3;
    objc_sync_enter(v6);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v8 + 40);
    uint64_t v9 = (id *)(v8 + 40);
    uint64_t v10 = v11;
    if (v11) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = v7;
    }
    objc_storeStrong(v9, v12);
    objc_sync_exit(v6);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    id v13 = 0;
    uint64_t v14 = +[FPItemManager defaultManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000059FC;
    v17[3] = &unk_100014B70;
    id v18 = v5;
    id v15 = *(id *)(a1 + 32);
    uint64_t v16 = *(void *)(a1 + 40);
    id v19 = v15;
    uint64_t v20 = v16;
    [v14 fetchItemForURL:v18 completionHandler:v17];
  }
}

void sub_1000059FC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v14 = v6;
  if (!v5 || v6)
  {
    if (!v6)
    {
      NSErrorUserInfoKey v29 = NSURLErrorKey;
      uint64_t v30 = *(void *)(a1 + 32);
      id v18 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      uint64_t v14 = +[NSError errorWithDomain:NSFileProviderErrorDomain code:-1005 userInfo:v18];
    }
    id v19 = *(id *)(a1 + 40);
    objc_sync_enter(v19);
    uint64_t v20 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v23 = *(void **)(v20 + 40);
    uint64_t v21 = (id *)(v20 + 40);
    uint64_t v22 = v23;
    if (v23) {
      uint64_t v24 = v22;
    }
    else {
      uint64_t v24 = v14;
    }
    objc_storeStrong(v21, v24);
    objc_sync_exit(v19);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    sub_1000094E0(@"Evicting %@", v7, v8, v9, v10, v11, v12, v13, (uint64_t)v5);
    id v15 = +[FPDaemonConnection sharedConnection];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100005BD4;
    v25[3] = &unk_100014B48;
    id v16 = *(id *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 48);
    id v26 = v16;
    uint64_t v28 = v17;
    id v27 = v5;
    [v15 providerDomainsCompletionHandler:v25];

    uint64_t v14 = v26;
  }
}

void sub_100005BD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    id v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v12 = *(void **)(v9 + 40);
    uint64_t v10 = (id *)(v9 + 40);
    uint64_t v11 = v12;
    if (v12) {
      uint64_t v13 = v11;
    }
    else {
      uint64_t v13 = v5;
    }
    objc_storeStrong(v10, v13);
    objc_sync_exit(v8);

    goto LABEL_17;
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v14 = [v6 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v14) {
    goto LABEL_16;
  }
  id v22 = v14;
  char v23 = 0;
  uint64_t v24 = *(void *)v41;
  do
  {
    for (i = 0; i != v22; i = (char *)i + 1)
    {
      if (*(void *)v41 != v24) {
        objc_enumerationMutation(v7);
      }
      id v26 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      id v27 = [*(id *)(a1 + 40) providerDomainID];
      unsigned int v28 = [v26 isEqualToString:v27];

      if (v28)
      {
        NSErrorUserInfoKey v29 = [v7 objectForKeyedSubscript:v26];
        id v30 = objc_alloc((Class)NSFileProviderManager);
        uint64_t v31 = [*(id *)(a1 + 40) providerID];
        uint64_t v32 = [v29 domain];
        id v33 = [v30 _initWithProviderIdentifier:v31 domain:v32];

        uint64_t v34 = [*(id *)(a1 + 40) itemIdentifier];
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_100005E68;
        v37[3] = &unk_100014B20;
        id v35 = *(id *)(a1 + 32);
        uint64_t v36 = *(void *)(a1 + 48);
        id v38 = v35;
        uint64_t v39 = v36;
        [v33 evictItemWithIdentifier:v34 completionHandler:v37];

        char v23 = 1;
      }
    }
    id v22 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
  }
  while (v22);
  if ((v23 & 1) == 0)
  {
LABEL_16:
    sub_1000094E0(@"[UNREACH] Domain not found for item : %@", v15, v16, v17, v18, v19, v20, v21, *(void *)(a1 + 40));
LABEL_17:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

void sub_100005E68(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v10 = a2;
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  uint64_t v7 = v8;
  uint64_t v9 = v10;
  if (v8) {
    uint64_t v9 = v7;
  }
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_100005EFC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_100005F18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = *(id *)(a1 + 32);
    id v7 = a3;
    objc_sync_enter(v6);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(void **)(v8 + 40);
    uint64_t v9 = (id *)(v8 + 40);
    id v10 = v11;
    if (v11) {
      uint64_t v12 = v10;
    }
    else {
      uint64_t v12 = v7;
    }
    objc_storeStrong(v9, v12);
    objc_sync_exit(v6);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    id v13 = 0;
    id v7 = +[FPDaemonConnection sharedConnectionProxy];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100006058;
    v17[3] = &unk_100014B20;
    id v14 = *(id *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    id v18 = v14;
    uint64_t v19 = v15;
    id v16 = [v7 evictItemAtURL:v5 evenIfEnumeratingFP:1 andClearACLForConsumer:0 evictionReason:2 completionHandler:v17];
  }
}

void sub_100006058(uint64_t a1, void *a2)
{
  id v4 = *(id *)(a1 + 32);
  id v10 = a2;
  objc_sync_enter(v4);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v5 + 40);
  id v6 = (id *)(v5 + 40);
  id v7 = v8;
  uint64_t v9 = v10;
  if (v8) {
    uint64_t v9 = v7;
  }
  objc_storeStrong(v6, v9);
  objc_sync_exit(v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_1000060EC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void *sub_100006108(void *result, int a2, uint64_t a3)
{
  if (a2 > 101)
  {
    switch(a2)
    {
      case 'o':
        uint64_t v3 = result[5];
        goto LABEL_14;
      case 'l':
        uint64_t v4 = *(void *)(result[4] + 8);
        unint64_t v5 = *(void *)(v4 + 24) | 1;
        break;
      case 'f':
        uint64_t v4 = *(void *)(result[4] + 8);
        unint64_t v5 = *(void *)(v4 + 24) & 0xFFFFFFFFFFFFFFFELL;
        break;
      default:
        return result;
    }
LABEL_16:
    *(void *)(v4 + 24) = v5;
    return result;
  }
  switch(a2)
  {
    case 'I':
      uint64_t v4 = *(void *)(result[4] + 8);
      unint64_t v5 = *(void *)(v4 + 24) | 2;
      goto LABEL_16;
    case 'P':
      *(unsigned char *)(*(void *)(result[6] + 8) + 24) = 0;
      break;
    case 'd':
      uint64_t v3 = result[7];
LABEL_14:
      *(void *)(*(void *)(v3 + 8) + 24) = a3;
      break;
  }
  return result;
}

void sub_1000061A8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100006228(void *a1)
{
  v1 = [a1 fp_map:&stru_100014C00];
  id v2 = [v1 componentsJoinedByString:@","];

  return v2;
}

id sub_100006284(id a1, FPTag *a2)
{
  id v2 = a2;
  uint64_t v3 = [(FPTag *)v2 label];
  id v4 = [(FPTag *)v2 color];

  unint64_t v5 = +[NSString stringWithFormat:@"%@#%i", v3, v4];

  return v5;
}

void sub_100006FD8(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    sub_100009C8C(a3, a4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [v4 dumpImage:v5 characterWidth:2 characterHeight:1];
  }
}

void sub_100007044(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  id v6 = a2;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = *(id *)(a1 + 32);
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v8) {
    goto LABEL_20;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v28;
  while (2)
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v28 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      id v13 = [v12 type];
      unsigned int v14 = [v13 isEqualToString:v6];

      if (v14)
      {
        [*(id *)(a1 + 40) startFgColor:a3 attr:2];
        uint64_t v15 = *(void *)(a1 + 48);
        id v26 = 0;
        id v16 = [v12 labelWithItem:v15 error:&v26];
        id v17 = v26;
        if (v16) {
          id v18 = v16;
        }
        else {
          id v18 = v17;
        }
        [*(id *)(a1 + 40) write:@" %@", v18];
        if (!a4) {
          goto LABEL_19;
        }
        uint64_t v19 = [v12 imageType];
        uint64_t v20 = +[UTType typeWithIdentifier:v19];
        unsigned __int8 v21 = [v20 isDeclared];

        if (v21)
        {
          if (!*(_DWORD *)(a1 + 56))
          {
LABEL_19:

            goto LABEL_20;
          }
          id v22 = *(void **)(a1 + 40);
          char v23 = [v12 imageType];
          [v22 write:@" (%@)", v23];
        }
        else
        {
          [*(id *)(a1 + 40) startFgColor:1 attr:2];
          uint64_t v24 = *(void **)(a1 + 40);
          char v23 = [v12 imageType];
          [v24 write:@" (undeclared type %@)", v23];
        }

        goto LABEL_19;
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_20:
}

void sub_100007288(void *a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007324;
  v4[3] = &unk_1000148C0;
  id v5 = a2;
  id v3 = v5;
  sub_10000971C(a1, 0, 1, v4);
}

void sub_100007324(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v6 = +[FPItemManager defaultManager];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100007410;
    v7[3] = &unk_100014D08;
    id v9 = *(id *)(a1 + 32);
    id v8 = v5;
    [v6 fetchItemForURL:v8 completionHandler:v7];
  }
}

void sub_100007410(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v142 = v5;
  if (!v6)
  {
    if (!v5)
    {
      sub_1000095FC(@"No item for URL %@\n", v7, v8, v9, v10, v11, v12, v13, *(void *)(a1 + 32));
      uint64_t v81 = *(void *)(a1 + 32);
      uint64_t v82 = *(void *)(a1 + 40);
      NSErrorUserInfoKey v181 = NSURLErrorKey;
      uint64_t v182 = v81;
      uint64_t v83 = +[NSDictionary dictionaryWithObjects:&v182 forKeys:&v181 count:1];
      v84 = +[NSError errorWithDomain:NSFileProviderErrorDomain code:-1005 userInfo:v83];
      (*(void (**)(uint64_t, void *))(v82 + 16))(v82, v84);

      unsigned int v14 = (void *)v83;
      goto LABEL_51;
    }
    uint64_t v139 = a1;
    id v175 = 0;
    v141 = +[FPProviderDomain providerDomainForItem:v5 cachePolicy:0 error:&v175];
    id v145 = v175;
    if (!v141)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_50:

      unsigned int v14 = v145;
      goto LABEL_51;
    }
    uint64_t v15 = [sub_100007CA4() actionsForProviderDomain:v141];
    id v16 = sub_100007CA4();
    id v180 = v5;
    id v17 = +[NSArray arrayWithObjects:&v180 count:1];
    v144 = [v16 extensionMatchingDictionaryForItems:v17 fpProviderDomain:v141];

    sub_1000094E0(@"Evaluating actions against %@", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v144);
    sub_1000094E0(@"\nActions:", v25, v26, v27, v28, v29, v30, v31, v133);
    long long v173 = 0u;
    long long v174 = 0u;
    long long v171 = 0u;
    long long v172 = 0u;
    id obj = v15;
    id v32 = [obj countByEnumeratingWithState:&v171 objects:v179 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v172;
      do
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(void *)v172 != v33) {
            objc_enumerationMutation(obj);
          }
          id v35 = *(void **)(*((void *)&v171 + 1) + 8 * i);
          uint64_t v36 = [v35 predicate];
          if ([v36 evaluateWithObject:v144]) {
            uint64_t v37 = @"YES";
          }
          else {
            uint64_t v37 = @"NO";
          }
          id v38 = v37;

          uint64_t v39 = [v35 identifier];
          v136 = [v35 predicate];
          sub_1000094E0(@"%@: %@ - %@", v40, v41, v42, v43, v44, v45, v46, (uint64_t)v39);
        }
        id v32 = [obj countByEnumeratingWithState:&v171 objects:v179 count:16];
      }
      while (v32);
    }

    sub_1000094E0(@"\nDecorations:", v47, v48, v49, v50, v51, v52, v53, v134);
    v54 = [v142 itemDecorations];
    dispatch_semaphore_t v138 = dispatch_semaphore_create(0);
    long long v167 = 0u;
    long long v168 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    id v55 = v54;
    int v56 = 0;
    id v57 = [v55 countByEnumeratingWithState:&v167 objects:v178 count:16];
    if (v57)
    {
      uint64_t v58 = *(void *)v168;
      do
      {
        for (j = 0; j != v57; j = (char *)j + 1)
        {
          if (*(void *)v168 != v58) {
            objc_enumerationMutation(v55);
          }
          v56 |= [*(id *)(*((void *)&v167 + 1) + 8 * (void)j) requiresFetchingInfoFirst];
        }
        id v57 = [v55 countByEnumeratingWithState:&v167 objects:v178 count:16];
      }
      while (v57);
    }

    v60 = [v55 fp_map:&stru_100014C90];
    uint64_t v61 = [v142 decorations];
    v165[0] = _NSConcreteStackBlock;
    v165[1] = 3221225472;
    v165[2] = sub_100007D90;
    v165[3] = &unk_100014CB8;
    id v137 = v60;
    id v166 = v137;
    v140 = [v61 fp_filter:v165];

    if (v140)
    {
      long long v163 = 0u;
      long long v164 = 0u;
      long long v161 = 0u;
      long long v162 = 0u;
      id v69 = v140;
      id v77 = [v69 countByEnumeratingWithState:&v161 objects:v177 count:16];
      if (v77)
      {
        uint64_t v78 = *(void *)v162;
        do
        {
          for (k = 0; k != v77; k = (char *)k + 1)
          {
            if (*(void *)v162 != v78) {
              objc_enumerationMutation(v69);
            }
            sub_1000094E0(@"%@: missing or invalid", v70, v71, v72, v73, v74, v75, v76, *(void *)(*((void *)&v161 + 1) + 8 * (void)k));
          }
          id v77 = [v69 countByEnumeratingWithState:&v161 objects:v177 count:16];
        }
        while (v77);
      }
    }
    if (v56)
    {
      sub_1000094E0(@"Item decorations require fetching item hierarchy", v62, v63, v64, v65, v66, v67, v68, v135);
      uint64_t v155 = 0;
      v156 = &v155;
      uint64_t v157 = 0x3032000000;
      v158 = sub_100007DB4;
      v159 = sub_100007DC4;
      id v160 = 0;
      v151[0] = _NSConcreteStackBlock;
      v151[1] = 3221225472;
      v151[2] = sub_100007DCC;
      v151[3] = &unk_100014CE0;
      v154 = &v155;
      v80 = v138;
      v152 = v80;
      id v153 = v55;
      +[FPItemDecoration fetchInfoForItem:v142 completionHandler:v151];
      dispatch_semaphore_wait(v80, 0xFFFFFFFFFFFFFFFFLL);
      if (v156[5])
      {
        (*(void (**)(void))(*(void *)(v139 + 40) + 16))();

        _Block_object_dispose(&v155, 8);
LABEL_49:

        goto LABEL_50;
      }

      _Block_object_dispose(&v155, 8);
    }
    else
    {
      long long v149 = 0u;
      long long v150 = 0u;
      long long v147 = 0u;
      long long v148 = 0u;
      id v85 = v55;
      id v86 = [v85 countByEnumeratingWithState:&v147 objects:v176 count:16];
      if (v86)
      {
        uint64_t v87 = *(void *)v148;
        do
        {
          v88 = 0;
          v89 = v145;
          do
          {
            if (*(void *)v148 != v87) {
              objc_enumerationMutation(v85);
            }
            v90 = *(void **)(*((void *)&v147 + 1) + 8 * (void)v88);
            id v146 = v89;
            v91 = [v90 labelWithItem:v142 error:&v146];
            id v145 = v146;

            uint64_t v92 = [v90 decorationIdentifier];
            v100 = (void *)v92;
            if (v91) {
              sub_1000094E0(@"%@: \"%@\"", v93, v94, v95, v96, v97, v98, v99, v92);
            }
            else {
              sub_1000094E0(@"%@ failed: %@", v93, v94, v95, v96, v97, v98, v99, v92);
            }

            v88 = (char *)v88 + 1;
            v89 = v145;
          }
          while (v86 != v88);
          id v86 = [v85 countByEnumeratingWithState:&v147 objects:v176 count:16];
        }
        while (v86);
      }
    }
    v101 = [v142 humanReadableCapabilities];
    sub_1000094E0(@"\nCapabilities: %@", v102, v103, v104, v105, v106, v107, v108, (uint64_t)v101);

    id v109 = [v142 contentPolicy];
    sub_1000094E0(@"\nContent Policy: %ld", v110, v111, v112, v113, v114, v115, v116, (uint64_t)v109);
    id v117 = [v142 inheritedContentPolicy];
    sub_1000094E0(@"\nInherited Content Policy: %ld", v118, v119, v120, v121, v122, v123, v124, (uint64_t)v117);
    id v125 = [v142 effectiveContentPolicy];
    sub_1000094E0(@"\nEffective Content Policy: %ld", v126, v127, v128, v129, v130, v131, v132, (uint64_t)v125);
    (*(void (**)(void))(*(void *)(v139 + 40) + 16))();
    goto LABEL_49;
  }
  unsigned int v14 = v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_51:
}

void sub_100007C78(_Unwind_Exception *a1)
{
}

void sub_100007C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

id sub_100007CA4()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100018D28;
  uint64_t v7 = qword_100018D28;
  if (!qword_100018D28)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100008D44;
    v3[3] = &unk_100014D98;
    v3[4] = &v4;
    sub_100008D44((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100007D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100007D88(id a1, FPItemDecoration *a2)
{
  return [(FPItemDecoration *)a2 decorationIdentifier];
}

uint64_t sub_100007D90(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2] ^ 1;
}

uint64_t sub_100007DB4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007DC4(uint64_t a1)
{
}

void sub_100007DCC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    uint64_t v8 = *(NSObject **)(a1 + 32);
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v26 = a1;
    id v9 = *(id *)(a1 + 40);
    id v10 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v10)
    {
      id v11 = v10;
      id v7 = 0;
      uint64_t v12 = *(void *)v29;
      do
      {
        uint64_t v13 = 0;
        unsigned int v14 = v7;
        do
        {
          if (*(void *)v29 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v13);
          id v27 = v14;
          id v16 = [v15 labelWithInfo:v5 error:&v27];
          id v7 = v27;

          uint64_t v17 = [v15 decorationIdentifier];
          uint64_t v25 = (void *)v17;
          if (v16) {
            sub_1000094E0(@"%@: \"%@\"", v18, v19, v20, v21, v22, v23, v24, v17);
          }
          else {
            sub_1000094E0(@"%@ failed: %@", v18, v19, v20, v21, v22, v23, v24, v17);
          }

          uint64_t v13 = (char *)v13 + 1;
          unsigned int v14 = v7;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v11);
    }
    else
    {
      id v7 = 0;
    }

    uint64_t v8 = *(NSObject **)(v26 + 32);
  }
  dispatch_semaphore_signal(v8);
}

void sub_100007F94(int a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1 <= 1)
  {
    id v6 = +[NSError fp_errorWithPOSIXCode:22 description:@"Error: fileproviderctl evaluate <item>"];
    v5[2](v5, v6);
LABEL_5:

    goto LABEL_18;
  }
  if (a1 == 2)
  {
    id v6 = +[NSString stringWithUTF8String:*(void *)(a2 + 8)];
    sub_100007288(v6, v5);
    goto LABEL_5;
  }
  v53[0] = FPPreflightActionCreate;
  v53[1] = FPPreflightActionMove;
  v53[2] = FPPreflightActionMoveOut;
  v53[3] = FPPreflightActionMoveIn;
  v53[4] = FPPreflightActionCopy;
  v53[5] = FPPreflightActionCopyIn;
  v53[6] = FPPreflightActionCopyOut;
  v53[7] = FPPreflightActionTrash;
  v53[8] = FPPreflightActionDelete;
  v53[9] = FPPreflightActionRename;
  v53[10] = FPPreflightActionIgnore;
  uint64_t v33 = +[NSArray arrayWithObjects:v53 count:11];
  +[NSString stringWithUTF8String:*(void *)(a2 + 8)];
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100008540;
  v37[3] = &unk_100014CB8;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v38 = v7;
  id v32 = [v33 fp_filter:v37];
  uint64_t v15 = [v32 lastObject];
  if (v15)
  {
    id v16 = +[NSMutableArray array];
    uint64_t v17 = (void *)(a2 + 16);
    uint64_t v18 = a1 - 2;
    do
    {
      uint64_t v19 = +[NSString stringWithUTF8String:*v17];
      [v16 addObject:v19];

      ++v17;
      --v18;
    }
    while (v18);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000085B0;
    v34[3] = &unk_100014D70;
    uint64_t v36 = v5;
    id v35 = v15;
    id v20 = v16;
    long long v31 = v34;
    dispatch_group_t v21 = dispatch_group_create();
    uint64_t v22 = +[NSMutableArray array];
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x3032000000;
    v51[3] = sub_100007DB4;
    v51[4] = sub_100007DC4;
    id v52 = 0;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v23 = v20;
    uint64_t v24 = (char *)[v23 countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v48;
      while (1)
      {
        if (*(void *)v48 != v25) {
          objc_enumerationMutation(v23);
        }
        uint64_t v26 = +[NSNull null];
        [v22 addObject:v26];

        if (!--v24)
        {
          uint64_t v24 = (char *)[v23 countByEnumeratingWithState:&v47 objects:v54 count:16];
          if (!v24) {
            break;
          }
        }
      }
    }

    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100008EE4;
    v43[3] = &unk_100014E48;
    id v27 = v21;
    uint64_t v44 = v27;
    id v28 = v22;
    id v45 = v28;
    uint64_t v46 = v51;
    [v23 enumerateObjectsUsingBlock:v43];
    long long v29 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009284;
    block[3] = &unk_100014E70;
    id v41 = v31;
    uint64_t v42 = v51;
    id v40 = v28;
    id v30 = v28;
    dispatch_group_notify(v27, v29, block);

    _Block_object_dispose(v51, 8);
  }
  else
  {
    sub_1000095FC(@"%@ is not a valid action; possible actions are %@",
      v8,
      v9,
      v10,
      v11,
      v12,
      v13,
      v14,
      (uint64_t)v7);
    id v23 = +[NSError fp_errorWithPOSIXCode:22 description:@"Error: fileproviderctl evaluate <action> <items>"];
    v5[2](v5, v23);
  }

LABEL_18:
}

void sub_100008514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

id sub_100008540(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 lowercaseString];
  id v5 = [v3 lowercaseString];

  id v6 = [v4 isEqualToString:v5];
  return v6;
}

void sub_1000085B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v8 = [v5 firstObject];
    id v98 = 0;
    uint64_t v9 = +[FPProviderDomain providerDomainForItem:v8 cachePolicy:0 error:&v98];
    id v7 = v98;

    if (!v9)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_37:

      goto LABEL_38;
    }
    uint64_t v10 = FPPreflightActionMove;
    if (([*(id *)(a1 + 32) isEqualToString:FPPreflightActionMove] & 1) != 0
      || [*(id *)(a1 + 32) isEqualToString:FPPreflightActionCopy])
    {
      if ((unint64_t)[v5 count] <= 1)
      {
        uint64_t v11 = *(void *)(a1 + 40);
        +[NSError fp_errorWithPOSIXCode:22, @"Error: %@ and %@ require at least two items (sources and destination)", v10, FPPreflightActionCopy description];
LABEL_8:
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, id))(v11 + 16))(v11, v12);
        id v13 = v7;
LABEL_36:

        id v7 = v13;
        goto LABEL_37;
      }
      id v12 = [v5 mutableCopy];
      [v12 removeLastObject];
      uint64_t v14 = [v5 lastObject];
    }
    else
    {
      uint64_t v15 = FPPreflightActionCreate;
      if ([*(id *)(a1 + 32) isEqualToString:FPPreflightActionCreate])
      {
        if ([v5 count] != (id)1)
        {
          uint64_t v11 = *(void *)(a1 + 40);
          +[NSError fp_errorWithPOSIXCode:22, @"Error: %@ requires exactly one item (parent folder)", v15, v74 description];
          goto LABEL_8;
        }
        uint64_t v14 = [v5 lastObject];
        id v12 = 0;
      }
      else
      {
        id v12 = v5;
        uint64_t v14 = 0;
      }
    }
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = [v12 fp_map:&stru_100014D48];
    [v14 itemIdentifier];
    v76 = uint64_t v75 = v17;
    sub_1000094E0(@"Evaluating %@ with source items %@, destination item %@", v18, v19, v20, v21, v22, v23, v24, v16);

    uint64_t v25 = +[FPPreflightUserInteraction evaluationObjectsForAction:*(void *)(a1 + 32) sourceItems:v12 destinationItem:v14 domainUserInfo:0 sourceItemKeysAllowList:0 destinationItemKeysAllowList:0];
    uint64_t v26 = [v5 firstObject];
    id v97 = v7;
    id v27 = +[FPPreflightUserInteraction interactionsForProviderItem:v26 error:&v97];
    id v13 = v97;

    if (v27)
    {
      id v78 = v13;
      v79 = v14;
      id v80 = v12;
      uint64_t v81 = a1;
      uint64_t v82 = v9;
      id v83 = v5;
      sub_1000094E0(@"Evaluating interactions against %@", v28, v29, v30, v31, v32, v33, v34, v25);
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      id v77 = v27;
      id obj = v27;
      id v35 = (void *)v25;
      id v90 = [obj countByEnumeratingWithState:&v93 objects:v99 count:16];
      if (v90)
      {
        uint64_t v89 = *(void *)v94;
        uint64_t v87 = FPIsSuppressed;
        uint64_t v86 = FPCanBeSuppressed;
        CFStringRef v36 = &stru_100016140;
        uint64_t v85 = FPHelpURLKey;
        v88 = (void *)v25;
        do
        {
          for (i = 0; i != v90; i = (char *)i + 1)
          {
            if (*(void *)v94 != v89) {
              objc_enumerationMutation(obj);
            }
            id v38 = *(void **)(*((void *)&v93 + 1) + 8 * i);
            uint64_t v39 = [v38 evaluateWithObjectsByName:v35 suppressionDelegate:0];
            id v40 = [v39 count];
            uint64_t v41 = sub_100008BB0(v38);
            long long v49 = (void *)v41;
            if (v40)
            {
              CFStringRef v50 = v36;
              uint64_t v51 = [v39 firstObject];
              id v52 = [v51 userInfo];
              uint64_t v53 = [v52 objectForKeyedSubscript:v87];
              unsigned int v54 = [v53 BOOLValue];

              id v55 = [v51 userInfo];
              int v56 = [v55 objectForKeyedSubscript:v86];
              unsigned int v57 = [v56 BOOLValue];

              uint64_t v58 = [v51 userInfo];
              uint64_t v59 = [v58 objectForKeyedSubscript:v85];

              v91 = v39;
              uint64_t v92 = (uint64_t)v49;
              if (v59)
              {
                v60 = +[NSString stringWithFormat:@", %@", v59, v75, v76];
                CFStringRef v36 = v50;
              }
              else
              {
                CFStringRef v36 = v50;
                v60 = (void *)v50;
              }
              uint64_t v61 = [v51 localizedDescription];
              uint64_t v62 = [v51 localizedRecoverySuggestion];
              uint64_t v63 = (void *)v62;
              CFStringRef v64 = @", can be suppressed";
              if (!v57) {
                CFStringRef v64 = v36;
              }
              CFStringRef v65 = @", suppressed";
              if (!v54) {
                CFStringRef v65 = v36;
              }
              uint64_t v66 = +[NSString stringWithFormat:@"\"%@\" - \"%@\"%@%@ %@", v61, v62, v64, v65, v60];

              long long v49 = (void *)v92;
              uint64_t v75 = v66;
              sub_1000094E0(@"%@ - %@", v67, v68, v69, v70, v71, v72, v73, v92);

              id v35 = v88;
              uint64_t v39 = v91;
            }
            else
            {
              sub_1000094E0(@"%@ - no match", v42, v43, v44, v45, v46, v47, v48, v41);
            }
          }
          id v90 = [obj countByEnumeratingWithState:&v93 objects:v99 count:16];
        }
        while (v90);
      }

      (*(void (**)(void))(*(void *)(v81 + 40) + 16))();
      uint64_t v9 = v82;
      id v5 = v83;
      uint64_t v14 = v79;
      id v12 = v80;
      id v27 = v77;
      id v13 = v78;
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      id v35 = (void *)v25;
    }

    goto LABEL_36;
  }
  id v7 = v6;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_38:
}

id sub_100008BA8(id a1, FPItem *a2)
{
  return [(FPItem *)a2 itemIdentifier];
}

id sub_100008BB0(void *a1)
{
  id v1 = a1;
  id v2 = [v1 userInteractionIdentifier];
  id v3 = [v2 length];

  if (v3)
  {
    uint64_t v4 = [v1 userInteractionIdentifier];
    id v5 = [v1 predicate];
    id v6 = +[NSString stringWithFormat:@"%@: %@", v4, v5];
  }
  else
  {
    uint64_t v4 = [v1 predicate];
    id v6 = +[NSString stringWithFormat:@"%@", v4];
  }

  return v6;
}

id sub_100008C90(uint64_t a1, uint64_t a2)
{
  id v3 = +[NSString stringWithUTF8String:a1];
  uint64_t v4 = +[NSURL fileURLWithPath:v3];

  id v7 = 0;
  if ([v4 getResourceValue:&v7 forKey:NSURLUbiquitousItemDownloadingStatusKey error:a2])id v5 = [v7 isEqualTo:NSURLUbiquitousItemDownloadingStatusCurrent]; {
  else
  }
    id v5 = 0;

  return v5;
}

Class sub_100008D44(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_100018D30)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100008E70;
    v3[4] = &unk_100014DD0;
    void v3[5] = v3;
    long long v4 = off_100014DB8;
    uint64_t v5 = 0;
    qword_100018D30 = _sl_dlopen();
  }
  if (!qword_100018D30) {
    sub_10000D7FC(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("FPUIManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000D87C();
  }
  qword_100018D28 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100008E70()
{
  uint64_t result = _sl_dlopen();
  qword_100018D30 = result;
  return result;
}

void sub_100008EE4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(NSObject **)(a1 + 32);
  id v6 = a2;
  dispatch_group_enter(v5);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100008FBC;
  v9[3] = &unk_100014E20;
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  id v10 = v7;
  uint64_t v12 = v8;
  id v11 = *(id *)(a1 + 32);
  uint64_t v13 = a3;
  sub_10000971C(v6, 0, 1, v9);
}

void sub_100008FBC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    objc_sync_exit(v7);
  }
  else
  {
    uint64_t v8 = +[FPItemManager defaultManager];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100009108;
    v13[3] = &unk_100014DF8;
    id v9 = *(id *)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 48);
    id v14 = v9;
    uint64_t v17 = v10;
    id v11 = v5;
    uint64_t v12 = *(void *)(a1 + 56);
    id v15 = v11;
    uint64_t v18 = v12;
    id v16 = *(id *)(a1 + 40);
    [v8 fetchItemForURL:v11 completionHandler:v13];
  }
}

void sub_100009108(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  else if (v5)
  {
    [*(id *)(a1 + 32) replaceObjectAtIndex:*(void *)(a1 + 64) withObject:v5];
  }
  else
  {
    sub_1000095FC(@"No item for URL %@\n", v8, v9, v10, v11, v12, v13, v14, *(void *)(a1 + 40));
    uint64_t v15 = *(void *)(a1 + 40);
    NSErrorUserInfoKey v20 = NSURLErrorKey;
    uint64_t v21 = v15;
    id v16 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v17 = +[NSError errorWithDomain:NSFileProviderErrorDomain code:-1005 userInfo:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  objc_sync_exit(v7);
}

void sub_100009268(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100009284(uint64_t a1)
{
  uint64_t v3 = a1 + 40;
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(*(void *)(*(void *)(v3 + 8) + 8) + 40)) {
    return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, 0);
  }
  else {
    return (*(uint64_t (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 32));
  }
}

void sub_1000092B4(uint64_t a1, const char *a2, char *a3)
{
  puts(a3);
  id v5 = getprogname();
  id v6 = "";
  if (a2) {
    id v7 = a2;
  }
  else {
    id v7 = "";
  }
  if (a2) {
    id v6 = " ";
  }
  printf("Usage: %s %s%s<verb> <options>, where <verb> is as follows:\n\n", v5, v7, v6);
  for (uint64_t i = a1 + 24; *(void *)(i + 8) || *(void *)(i + 16); i += 48)
  {
    if (*(unsigned char *)i) {
      printf("    %c|%s %s\n        %s\n\n");
    }
    else {
      printf("    %s %s\n        %s\n\n");
    }
  }
  exit(64);
}

void sub_10000937C(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v19 = a4;
  uint64_t v7 = (a2 - 1);
  if (a2 <= 1)
  {
    printf("Error: argc <= %d: (argc = %d)\n", 1, a2);
    exit(65);
  }
  uint64_t v10 = *(const char **)(a3 + 8);
  uint64_t v8 = (const char **)(a3 + 8);
  uint64_t v9 = v10;
  for (uint64_t i = (void *)(a1 + 40); ; i += 6)
  {
    uint64_t v12 = (uint64_t (*)(uint64_t, const char **))*(i - 1);
    if (!v12 && !*i) {
      goto LABEL_20;
    }
    if (*((unsigned char *)i - 16))
    {
      size_t v13 = strlen(v9);
      uint64_t v14 = (const char *)*(i - 5);
      if (v13 == 1 && *(unsigned __int8 *)v9 == *(unsigned __int8 *)v14) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v14 = (const char *)*(i - 5);
    }
    if (strcmp(v9, v14)) {
      continue;
    }
LABEL_11:
    if (v12)
    {
      int v15 = v12(v7, v8);
      if (v15)
      {
        int v16 = v15;
        if (v15 != 64)
        {
          uint64_t v17 = __error();
          uint64_t v18 = strerror(*v17);
          printf("error: %s\n", v18);
          exit(v16);
        }
        uint64_t v9 = *v8;
LABEL_20:
        fprintf(__stderrp, "Unknown command '%s'\n", v9);
        int v15 = 64;
      }
      exit(v15);
    }
    if (*i) {
      break;
    }
  }
  ((void (*)(uint64_t, const char **, id))*i)(v7, v8, v19);
}

void sub_1000094E0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  id v10 = [objc_alloc((Class)NSString) initWithFormat:v9 arguments:&a9];

  uint64_t v11 = __stdoutp;
  id v12 = v10;
  fprintf(v11, "%s\n", (const char *)[v12 UTF8String]);
}

void sub_10000956C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  id v10 = [objc_alloc((Class)NSString) initWithFormat:v9 arguments:&a9];

  uint64_t v11 = __stdoutp;
  id v12 = v10;
  fputs((const char *)[v12 UTF8String], v11);
  fflush(__stdoutp);
}

void sub_1000095FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  id v10 = [objc_alloc((Class)NSString) initWithFormat:v9 arguments:&a9];

  uint64_t v11 = __stderrp;
  id v12 = v10;
  fprintf(v11, "%s\n", (const char *)[v12 UTF8String]);
}

BOOL sub_100009688(void *a1)
{
  id v1 = [a1 path];
  getpid();
  id v2 = v1;
  [v2 fileSystemRepresentation];
  BOOL v3 = fpfs_lp_sandbox_check() == 0;

  return v3;
}

void sub_10000971C(void *a1, char a2, char a3, void *a4)
{
  id v7 = a1;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100009AE4;
  v29[3] = &unk_100014E98;
  char v31 = a3;
  id v8 = a4;
  id v30 = v8;
  id v9 = objc_retainBlock(v29);
  if (fpfs_supports_long_paths() && (unint64_t)[v7 length] <= 0x3FF)
  {
    uint64_t v10 = [v7 stringByExpandingTildeInPath];

    id v7 = (id)v10;
  }
  unsigned int v11 = [v7 characterAtIndex:[v7 length] - 1];
  if ([v7 hasPrefix:@"fp:"])
  {
    uint64_t v24 = _NSConcreteStackBlock;
    uint64_t v25 = 3221225472;
    uint64_t v26 = sub_100009BC4;
    id v27 = &unk_100014EC0;
    uint64_t v28 = v9;
    FPDocumentURLFromBookmarkableString();
    id v12 = v28;
  }
  else
  {
    id v12 = +[NSFileManager defaultManager];
    if ([v7 hasPrefix:@"/"])
    {
      size_t v13 = +[NSURL fileURLWithPath:v7 isDirectory:v11 == 47];
      uint64_t v14 = v13;
      if (v11 == 47)
      {
        int v15 = [v13 URLByResolvingSymlinksInPath];

        uint64_t v14 = v15;
        if (objc_msgSend(v15, "fp_isSymlink")) {
          sub_10000D8F8();
        }
      }
    }
    else if ([v7 hasPrefix:@"file://"])
    {
      uint64_t v14 = +[NSURL URLWithString:v7];
    }
    else
    {
      uint64_t v23 = 0;
      memset(&v22, 0, sizeof(v22));
      if (stat(".", &v22) < 0 || (fpfs_fsgetpath() & 0x80000000) != 0)
      {
        uint64_t v21 = +[NSError fp_errorWithPOSIXCode:*__error() description:@"Couldn't determine current working directory"];
        ((void (*)(void *, void, void, void *))v9[2])(v9, 0, 0, v21);

        goto LABEL_20;
      }
      int v16 = +[NSString stringWithUTF8String:v23];
      free(v23);
      uint64_t v17 = [v16 stringByAppendingPathComponent:v7];
      uint64_t v14 = +[NSURL fileURLWithPath:v17];
    }
    id v18 = [v14 path];
    [v18 fileSystemRepresentation];
    int v19 = fpfs_lp_faccessat();

    if ((a2 & 1) != 0 || !v19)
    {
      ((void (*)(void *, void *, BOOL, void))v9[2])(v9, v14, v19 == 0, 0);
    }
    else
    {
      NSErrorUserInfoKey v20 = +[NSError fp_errorWithPOSIXCode:2, @"Couldn't find a file for %@", v7 description];
      ((void (*)(void *, void, void, void *))v9[2])(v9, 0, 0, v20);
    }
  }
LABEL_20:
}

void sub_100009AE4(uint64_t a1, void *a2, int a3, void *a4)
{
  id v10 = a2;
  id v7 = a4;
  if (v7 || !a3 || sub_100009688(v10))
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = +[NSError fp_errorWithPOSIXCode:1, @"Couldn't access src file %@ (exist: %d)", v10, 1 description];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
}

uint64_t sub_100009BC4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009BDC(const char *a1, char a2, char a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = +[NSFileManager defaultManager];
  id v9 = [v8 stringWithFileSystemRepresentation:a1 length:strlen(a1)];

  sub_10000971C(v9, a2, a3, v7);
}

id sub_100009C8C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 isEqualToString:FPThumbnailFormatLICachedBitmap])
  {
    id v5 = (const void *)LICreateIconFromCachedBitmap();
    id v6 = [sub_100009D98() imageWithCGImage:v5];
    CFRelease(v5);
    sub_100009E7C(v6);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:

    goto LABEL_7;
  }
  if ([v4 isEqualToString:FPThumbnailFormatBRUndecorated])
  {
    id v6 = [sub_100009D98() imageWithData:v3];
    uint64_t v8 = [v6 _applicationIconImageForFormat:2 precomposed:0];
    sub_100009E7C(v8);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  id v7 = v3;
LABEL_7:

  return v7;
}

id sub_100009D98()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100018D38;
  uint64_t v7 = qword_100018D38;
  if (!qword_100018D38)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000B320;
    v3[3] = &unk_100014D98;
    v3[4] = &v4;
    sub_10000B320((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100009E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100009E7C(void *a1)
{
  id v1 = a1;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  id v2 = (void (*)(id))off_100018D48;
  id v9 = off_100018D48;
  if (!off_100018D48)
  {
    id v3 = (void *)sub_10000B378();
    v7[3] = (uint64_t)dlsym(v3, "UIImagePNGRepresentation");
    off_100018D48 = (_UNKNOWN *)v7[3];
    id v2 = (void (*)(id))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2) {
    sub_10000D924();
  }
  uint64_t v4 = v2(v1);

  return v4;
}

void sub_100009F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009FA8(void *a1)
{
  id v1 = a1;
  id v2 = [v1 domainFullDisplayName];
  [v1 isUsingFPFS];
  [v1 isEnabled];
  [v1 isHidden];
  [v1 needsAuthentication];
  [v1 testingModes];
  [v1 testingModes];
  [v1 disconnectionState];
  id v3 = [v1 disconnectionReason];
  uint64_t v4 = FPConnectionStateToPrettyString();
  uint64_t v25 = [v1 identifier];
  sub_1000094E0(@" - %@%@%@%@%@%@%@%@\n\t%@", v5, v6, v7, v8, v9, v10, v11, (uint64_t)v2);

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v12 = [v1 storageURLs];
  id v13 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v27 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = [*(id *)(*((void *)&v26 + 1) + 8 * i) fp_shortDescription];
        sub_1000094E0(@"\t%@", v18, v19, v20, v21, v22, v23, v24, (uint64_t)v17);
      }
      id v14 = [v12 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v14);
  }
}

BOOL sub_10000A1F0(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000A2EC;
  v11[3] = &unk_100014EE8;
  id v12 = a3;
  id v6 = v12;
  uint64_t v7 = [a1 fp_filter:v11];
  id v8 = [v7 count];
  if (v8 == (id)1)
  {
    uint64_t v9 = [v7 firstObject];
    [v5 addObject:v9];
  }
  return v8 == (id)1;
}

uint64_t sub_10000A2EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000A2FC(void *a1, int a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  char v22 = 0;
  uint64_t v7 = dispatch_group_create();
  dispatch_group_enter(v7);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000A4B0;
  v15[3] = &unk_100014FE0;
  uint64_t v19 = v21;
  id v8 = v7;
  int v16 = v8;
  int v20 = a2;
  id v9 = v5;
  id v17 = v9;
  id v10 = v6;
  id v18 = v10;
  uint64_t v11 = +[FPProviderDomain beginMonitoringProviderDomainChangesWithHandler:v15];
  id v12 = v11;
  if (v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000AF00;
    v13[3] = &unk_100015008;
    id v14 = v11;
    dispatch_group_notify(v8, (dispatch_queue_t)&_dispatch_main_q, v13);
  }
  _Block_object_dispose(v21, 8);
}

void sub_10000A498(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000A4B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v4 = [v3 allValues];
    id v5 = v4;
    int v6 = *(_DWORD *)(a1 + 64);
    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [v4 fp_filter:&stru_100014F28];

      int v6 = *(_DWORD *)(a1 + 64);
      id v5 = (void *)v7;
    }
    if ((v6 & 4) != 0)
    {
      uint64_t v8 = [v5 fp_filter:&stru_100014F48];

      id v5 = (void *)v8;
    }
    id v9 = +[NSMutableSet set];
    id v10 = *(void **)(a1 + 40);
    if (v10)
    {
      id v18 = [v10 count];
      if (!v18)
      {
        id v60 = 0;
        sub_1000095FC(@"Available providers:", v11, v12, v13, v14, v15, v16, v17, v57);
        goto LABEL_40;
      }
      id v59 = v3;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v19 = *(id *)(a1 + 40);
      id v65 = [v19 countByEnumeratingWithState:&v79 objects:v86 count:16];
      if (v65)
      {
        id v60 = v18;
        char v63 = 0;
        uint64_t v64 = *(void *)v80;
        uint64_t v61 = a1;
        id v62 = v9;
        do
        {
          for (uint64_t i = 0; i != v65; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v80 != v64) {
              objc_enumerationMutation(v19);
            }
            uint64_t v21 = *(void *)(*((void *)&v79 + 1) + 8 * i);
            v78[0] = _NSConcreteStackBlock;
            v78[1] = 3221225472;
            v78[2] = sub_10000AC70;
            v78[3] = &unk_100014F70;
            v78[4] = v21;
            char v22 = [v5 fp_filter:v78];
            if (![v22 count])
            {
              v77[0] = _NSConcreteStackBlock;
              v77[1] = 3221225472;
              v77[2] = sub_10000ACB4;
              v77[3] = &unk_100014F70;
              v77[4] = v21;
              uint64_t v23 = [v5 fp_filter:v77];

              char v22 = (void *)v23;
            }
            if ([v22 count])
            {
              if ((*(unsigned char *)(a1 + 64) & 2) != 0)
              {
                id v31 = v22;
                if ((unint64_t)[v31 count] < 2) {
                  goto LABEL_28;
                }
                v76[0] = _NSConcreteStackBlock;
                v76[1] = 3221225472;
                v76[2] = sub_10000AD48;
                v76[3] = &unk_100014F70;
                v76[4] = v21;
                if (sub_10000A1F0(v31, v9, v76)) {
                  goto LABEL_23;
                }
                v75[0] = _NSConcreteStackBlock;
                v75[1] = 3221225472;
                v75[2] = sub_10000AD8C;
                v75[3] = &unk_100014F70;
                v75[4] = v21;
                if (sub_10000A1F0(v31, v9, v75)) {
                  goto LABEL_23;
                }
                v74[0] = _NSConcreteStackBlock;
                v74[1] = 3221225472;
                v74[2] = sub_10000ADD0;
                v74[3] = &unk_100014F70;
                v74[4] = v21;
                if (sub_10000A1F0(v31, v9, v74)) {
                  goto LABEL_23;
                }
                v73[0] = _NSConcreteStackBlock;
                v73[1] = 3221225472;
                v73[2] = sub_10000AE14;
                v73[3] = &unk_100014F70;
                v73[4] = v21;
                if (sub_10000A1F0(v31, v9, v73) ? 3 : 0)
                {
LABEL_23:
                  char v22 = v31;
                }
                else
                {
LABEL_28:
                  char v22 = v31;
                  if ((unint64_t)[v31 count] >= 2)
                  {
                    char v22 = [v31 fp_filter:&stru_100014F90];
                  }
                  if ([v22 count] == (id)1)
                  {
                    uint64_t v33 = [v22 firstObject];
                    [v9 addObject:v33];
                  }
                  else
                  {
                    uint64_t v34 = [v31 objectAtIndexedSubscript:0];
                    id v35 = [v34 identifier];
                    char v63 = 1;
                    [v31 objectAtIndexedSubscript:1];
                    id v36 = v19;
                    v38 = uint64_t v37 = v5;
                    uint64_t v58 = [v38 identifier];
                    sub_1000095FC(@"multiple matches found for %@: %@ and %@", v39, v40, v41, v42, v43, v44, v45, v21);

                    id v5 = v37;
                    id v19 = v36;

                    a1 = v61;
                    id v9 = v62;
                  }
                }
              }
              else
              {
                [v9 addObjectsFromArray:v22];
              }
            }
            else
            {
              sub_1000095FC(@"File provider %@ not found. Available providers:", v24, v25, v26, v27, v28, v29, v30, v21);
              char v63 = 1;
            }
          }
          id v65 = [v19 countByEnumeratingWithState:&v79 objects:v86 count:16];
        }
        while (v65);

        id v3 = v59;
        if ((v63 & 1) == 0) {
          goto LABEL_52;
        }
LABEL_40:
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        uint64_t v47 = [v3 allValues];
        id v48 = [v47 countByEnumeratingWithState:&v69 objects:v85 count:16];
        if (v48)
        {
          id v49 = v48;
          uint64_t v50 = *(void *)v70;
          do
          {
            for (j = 0; j != v49; j = (char *)j + 1)
            {
              if (*(void *)v70 != v50) {
                objc_enumerationMutation(v47);
              }
              id v52 = *(void **)(*((void *)&v69 + 1) + 8 * (void)j);
              if ([v52 supportsEnumeration]) {
                sub_100009FA8(v52);
              }
            }
            id v49 = [v47 countByEnumeratingWithState:&v69 objects:v85 count:16];
          }
          while (v49);
        }

        uint64_t v53 = *(void *)(a1 + 48);
        if (v60)
        {
          NSErrorUserInfoKey v83 = NSLocalizedDescriptionKey;
          CFStringRef v84 = @"Could not find a matching provider";
          unsigned int v54 = +[NSDictionary dictionaryWithObjects:&v84 forKeys:&v83 count:1];
          id v55 = +[NSError errorWithDomain:NSFileProviderErrorDomain code:-2001 userInfo:v54];
          (*(void (**)(uint64_t, void, void *))(v53 + 16))(v53, 0, v55);
        }
        else
        {
          (*(void (**)(uint64_t, void, void))(v53 + 16))(v53, 0, 0);
        }
        goto LABEL_53;
      }
    }
    else
    {
      uint64_t v46 = +[NSMutableSet setWithArray:v5];

      id v9 = (id)v46;
    }
LABEL_52:
    int v56 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000AEA0;
    block[3] = &unk_100014FB8;
    id v68 = *(id *)(a1 + 48);
    id v9 = v9;
    id v67 = v9;
    dispatch_async(v56, block);

LABEL_53:
  }
}

BOOL sub_10000AC60(id a1, FPProviderDomain *a2)
{
  return [(FPProviderDomain *)a2 supportsEnumeration];
}

BOOL sub_10000AC68(id a1, FPProviderDomain *a2)
{
  return [(FPProviderDomain *)a2 isUsingFPFS];
}

id sub_10000AC70(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [v3 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t sub_10000ACB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 domainFullDisplayName];
  if ([v4 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)])
  {
    uint64_t v5 = 1;
  }
  else
  {
    int v6 = [v3 domain];
    uint64_t v7 = [v6 displayName];
    uint64_t v5 = (uint64_t)[v7 localizedCaseInsensitiveContainsString:*(void *)(a1 + 32)];
  }
  return v5;
}

id sub_10000AD48(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id sub_10000AD8C(uint64_t a1, void *a2)
{
  id v3 = [a2 domainDisplayName];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

id sub_10000ADD0(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  return v4;
}

id sub_10000AE14(uint64_t a1, void *a2)
{
  id v3 = [a2 domainDisplayName];
  id v4 = [v3 hasPrefix:*(void *)(a1 + 32)];

  return v4;
}

BOOL sub_10000AE58(id a1, FPProviderDomain *a2)
{
  id v2 = a2;
  if ([(FPProviderDomain *)v2 isHidden]) {
    unsigned __int8 v3 = 0;
  }
  else {
    unsigned __int8 v3 = [(FPProviderDomain *)v2 isEnabled];
  }

  return v3;
}

void sub_10000AEA0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) allObjects];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

id sub_10000AF00(uint64_t a1)
{
  return +[FPProviderDomain endMonitoringProviderDomainChanges:*(void *)(a1 + 32)];
}

void sub_10000AF14(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v9 = v3;
    uint64_t v5 = +[NSArray arrayWithObjects:&v9 count:1];
  }
  else
  {
    uint64_t v5 = &__NSArray0__struct;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B028;
  v7[3] = &unk_100015030;
  id v6 = v4;
  id v8 = v6;
  sub_10000A2FC(v5, 2, v7);
  if (v3) {
}
  }

void sub_10000B028(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 firstObject];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);
}

void sub_10000B0A4(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (v3)
  {
    id v9 = v3;
    id v5 = +[NSArray arrayWithObjects:&v9 count:1];
  }
  else
  {
    id v5 = &__NSArray0__struct;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B1B8;
  v7[3] = &unk_100015030;
  id v6 = v4;
  id v8 = v6;
  sub_10000A2FC(v5, 2, v7);
  if (v3) {
}
  }

void sub_10000B1B8(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v7 = [a2 firstObject];
  id v6 = [v7 identifier];
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v6, v5);
}

void sub_10000B244(int a1, uint64_t *a2, int a3, void *a4)
{
  id v7 = a4;
  id v12 = v7;
  if (a1)
  {
    id v8 = +[NSMutableArray arrayWithCapacity:a1];
    if (a1 >= 1)
    {
      uint64_t v9 = a1;
      do
      {
        uint64_t v10 = *a2++;
        uint64_t v11 = +[NSString stringWithUTF8String:v10];
        [v8 addObject:v11];

        --v9;
      }
      while (v9);
    }
    sub_10000A2FC(v8, a3, v12);
  }
  else
  {
    sub_10000A2FC(0, a3, v7);
  }
}

Class sub_10000B320(uint64_t a1)
{
  sub_10000B378();
  Class result = objc_getClass("UIImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000D99C();
  }
  qword_100018D38 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000B378()
{
  v2[0] = 0;
  if (!qword_100018D40)
  {
    v2[1] = _NSConcreteStackBlock;
    v2[2] = (void *)3221225472;
    v2[3] = sub_10000B470;
    v2[4] = &unk_100014DD0;
    v2[5] = v2;
    long long v3 = off_100015050;
    uint64_t v4 = 0;
    qword_100018D40 = _sl_dlopen();
  }
  uint64_t v0 = qword_100018D40;
  if (!qword_100018D40) {
    sub_10000DA18(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t sub_10000B470()
{
  uint64_t result = _sl_dlopen();
  qword_100018D40 = result;
  return result;
}

void *sub_10000B4E4(uint64_t a1)
{
  id v2 = (void *)sub_10000B378();
  uint64_t result = dlsym(v2, "UIImagePNGRepresentation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100018D48 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000B534(void *a1, uint64_t a2, void *a3, void *a4, char a5, char a6, void *a7, void *a8, void *a9, uint64_t a10, uint64_t a11, void *a12)
{
  id v16 = a1;
  uint64_t v17 = a3;
  id v18 = a4;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a12;
  dispatch_group_enter(v17);
  uint64_t v56 = 0;
  uint64_t v57 = &v56;
  uint64_t v58 = 0x3032000000;
  id v59 = sub_10000B870;
  id v60 = sub_10000B880;
  id v61 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3032000000;
  uint64_t v53 = sub_10000B870;
  unsigned int v54 = sub_10000B880;
  id v55 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_10000B870;
  id v48 = sub_10000B880;
  id v49 = 0;
  if (v21)
  {
    objc_storeStrong(&v61, a8);
    uint64_t v23 = v51;
    id v24 = v21;
    uint64_t v25 = (void *)v23[5];
    uint64_t v23[5] = (uint64_t)v24;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B888;
    block[3] = &unk_100015098;
    id v40 = v20;
    uint64_t v41 = &v44;
    uint64_t v42 = &v56;
    uint64_t v43 = &v50;
    dispatch_sync(v18, block);
    uint64_t v25 = v40;
  }

  if (v57[5])
  {
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10000BA94;
    v28[3] = &unk_1000150E8;
    char v37 = a5;
    char v38 = a6;
    uint64_t v33 = &v56;
    uint64_t v34 = &v50;
    uint64_t v35 = a10;
    id v29 = v16;
    uint64_t v36 = a11;
    id v30 = v20;
    id v31 = v19;
    id v32 = v22;
    dispatch_sync(v18, v28);
  }
  else
  {
    (*((void (**)(id, uint64_t))v22 + 2))(v22, v45[5]);
  }
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);
}

void sub_10000B840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 184), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B870(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000B880(uint64_t a1)
{
}

void sub_10000B888(uint64_t a1)
{
  id v2 = +[FPDaemonConnection sharedConnection];
  uint64_t v3 = *(void *)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000B928;
  v4[3] = &unk_100015070;
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  [v2 copyDatabaseForFPCKStartingAtPath:v3 completionHandler:v4];
}

void sub_10000B928(void *a1, void *a2, void *a3)
{
  id v23 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = [v5 description];
    NSLog(@"Error copying FPFS databases for FPCK: %@", v7);

    uint64_t v8 = *(void *)(a1[4] + 8);
    id v9 = v6;
    uint64_t v10 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }
  else
  {
    uint64_t v11 = [v23 allKeys];
    id v12 = [v11 count];

    if (v12)
    {
      uint64_t v13 = [v23 allKeys];
      uint64_t v14 = [v13 objectAtIndexedSubscript:0];
      id v15 = [v14 copy];
      uint64_t v16 = *(void *)(a1[5] + 8);
      uint64_t v17 = *(void **)(v16 + 40);
      *(void *)(v16 + 40) = v15;

      uint64_t v10 = [v23 objectForKeyedSubscript:*(void *)(*(void *)(a1[5] + 8) + 40)];
      id v18 = [v10 copy];
      uint64_t v19 = *(void *)(a1[6] + 8);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = v18;
    }
    else
    {
      uint64_t v21 = +[NSError errorWithDomain:NSFileProviderInternalErrorDomain code:21 userInfo:0];
      uint64_t v22 = *(void *)(a1[4] + 8);
      uint64_t v10 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;
    }
  }
}

void sub_10000BA94(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 80);
  int v3 = *(unsigned __int8 *)(a1 + 96);
  int v4 = *(unsigned __int8 *)(a1 + 97);
  id v5 = +[NSMutableString string];
  id v15 = +[NSURL fileURLWithPath:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isDirectory:1];
  uint64_t v6 = +[NSURL fileURLWithPath:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) isDirectory:0];
  id v7 = fp_current_or_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[INFO] 🧹 fileproviderctl launching FPCK", buf, 2u);
  }
  uint64_t v8 = (__rbit32(v2) >> 29) & 6 ^ 4;
  if (v3)
  {
    v8 |= 8uLL;
    uint64_t v9 = 12;
  }
  else
  {
    uint64_t v9 = 8;
  }
  if (v4) {
    v8 |= 0x10uLL;
  }
  uint64_t v10 = (4 * (int)v2) & 0x20 | (((v2 >> 4) & 3) << 8) | v8;

  uint64_t v11 = +[FPDaemonConnection sharedConnection];
  uint64_t v12 = *(void *)(a1 + 88);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000BCC0;
  v16[3] = &unk_1000150C0;
  BOOL v22 = (v2 & 4) != 0;
  id v17 = v5;
  uint64_t v13 = *(void *)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  uint64_t v21 = v10;
  id v19 = *(id *)(a1 + 48);
  id v20 = *(id *)(a1 + 56);
  id v14 = v5;
  [v11 runFPCKForDomainWithID:v13 domainRootURL:v15 databaseBackupPath:v6 options:v10 reason:v9 launchType:v12 completionHandler:v16];
}

void sub_10000BCC0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
LABEL_35:
    uint64_t v36 = [v12 description];
    NSLog(@"💣 FPCK failed completing: %@", v36);

    goto LABEL_36;
  }
  if (*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 32) appendString:v9];
  }
  uint64_t v13 = [*(id *)(a1 + 40) lastPathComponent];
  id v14 = +[NSString stringWithFormat:@"\nFPCK for %@:\n", v13];

  [*(id *)(a1 + 32) appendString:v14];
  if ((uint64_t)[v10 numberOfBrokenFilesInFSAndFSSnapshotCheck] < 1)
  {
    id v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"✅ disk <-> FSSnapshot succeeded on %ld files.\n", [v10 numberOfFilesChecked]);
    id v12 = 0;
  }
  else
  {
    id v12 = +[NSError errorWithDomain:@"FPCKDomain" code:65 userInfo:0];
    id v15 = [NSString stringWithFormat:@"❌ disk <-> FSSnapshot failed on %ld/%ld files. \n", [v10 numberOfBrokenFilesInFSAndFSSnapshotCheck], [v10 numberOfFilesChecked]];
  }
  [*(id *)(a1 + 32) appendString:v15];

  if ((uint64_t)[v10 numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck] < 1)
  {
    id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"✅ FSSnapshot <-> FPSnapshot succeeded on %ld files. \n\n", [v10 numberOfFilesChecked]);
  }
  else
  {
    uint64_t v16 = +[NSError errorWithDomain:@"FPCKDomain" code:65 userInfo:0];

    id v17 = [NSString stringWithFormat:@"❌ FSSnapshot <-> FPSnapshot failed on %ld/%ld files. \n\n", [v10 numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck], [v10 numberOfFilesChecked]];
    id v12 = (id)v16;
  }
  [*(id *)(a1 + 32) appendString:v17];

  if ((uint64_t)[v10 numberOfBrokenFilesInReconciliationTableCheck] < 1)
  {
    id v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"✅ ReconciliationTable checks succeeded on %ld files. \n\n", [v10 numberOfFilesChecked]);
  }
  else
  {
    uint64_t v18 = +[NSError errorWithDomain:@"FPCKDomain" code:65 userInfo:0];

    id v19 = [NSString stringWithFormat:@"❌ ReconciliationTable checks failed on %ld/%ld files. \n\n", [v10 numberOfBrokenFilesInReconciliationTableCheck], [v10 numberOfFilesChecked]];
    id v12 = (id)v18;
  }
  [*(id *)(a1 + 32) appendString:v19];

  if ((*(unsigned char *)(a1 + 64) & 0x20) != 0)
  {
    if ((uint64_t)[v10 numberOfBrokenFilesInBackupManifestCheck] >= 1)
    {
      uint64_t v20 = +[NSError errorWithDomain:@"FPCKDomain" code:65 userInfo:0];

      uint64_t v21 = +[NSString stringWithFormat:@"❌ Backup Manifest <-> FSSnapshot failed on %ld/%ld files. \n\n", [v10 numberOfBrokenFilesInBackupManifestCheck], [v10 numberOfFilesChecked]];
      id v12 = (id)v20;
LABEL_18:
      [*(id *)(a1 + 32) appendString:v21];

      goto LABEL_19;
    }
    if ((*(unsigned char *)(a1 + 64) & 0x20) != 0)
    {
      uint64_t v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"✅ Backup Manifest <-> FSSnapshot succeeded on %ld files. \n\n", [v10 numberOfFilesChecked]);
      goto LABEL_18;
    }
  }
LABEL_19:
  if (*(unsigned char *)(a1 + 72) && [v11 count])
  {
    id v37 = v12;
    char v38 = v14;
    id v40 = v10;
    id v41 = v9;
    [*(id *)(a1 + 32) appendString:@"\n✉️   Telemetry report:\n\n"];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v39 = v11;
    id v22 = v11;
    id v23 = [v22 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v24; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v44 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v28 = [v22 objectForKey:v27];
          id v29 = +[NSString stringWithFormat:@"%@: %@\n", v27, v28];

          [*(id *)(a1 + 32) appendString:v29];
        }
        id v24 = [v22 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v24);
    }

    [*(id *)(a1 + 32) appendString:@"\n======================================\n\n"];
    id v10 = v40;
    id v9 = v41;
    id v14 = v38;
    id v11 = v39;
    id v12 = v37;
  }
  id v30 = [*(id *)(a1 + 32) dataUsingEncoding:4];
  if (!v30) {
    id v31 = [@"<Invalid report format>" dataUsingEncoding:4];
  }
  uint64_t v32 = *(void **)(a1 + 48);
  id v42 = 0;
  unsigned __int8 v33 = [v32 writeData:v30 error:&v42];
  id v34 = v42;
  uint64_t v35 = v34;
  if ((v33 & 1) == 0)
  {
    NSLog(@"Error writing FPCK report: %@", v34);
    if (!v12) {
      id v12 = v35;
    }
  }

  if (v12) {
    goto LABEL_35;
  }
LABEL_36:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_10000C260(unsigned int a1, char *const *a2, void *a3)
{
}

void sub_10000C270(unsigned int a1, char *const *a2, char a3, char a4, void *a5)
{
  id v9 = a5;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_10000B870;
  void v20[4] = sub_10000B880;
  dispatch_group_t v21 = 0;
  dispatch_group_t v21 = dispatch_group_create();
  id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v11 = dispatch_queue_create("fpck", v10);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  pid_t v14[2] = sub_10000C3FC;
  v14[3] = &unk_1000151B0;
  id v12 = v9;
  id v16 = v12;
  id v17 = v20;
  uint64_t v13 = v11;
  id v15 = v13;
  char v18 = a3;
  char v19 = a4;
  sub_1000049B4(a1, a2, v14);

  _Block_object_dispose(v20, 8);
}

void sub_10000C3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000C3EC(unsigned int a1, char *const *a2, void *a3)
{
}

void sub_10000C3FC(uint64_t a1, int a2, uint64_t a3, void *a4, void *a5, void *a6, uint64_t a7, void *a8, uint64_t a9, void *a10)
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a8;
  id v21 = a10;
  if (!v21)
  {
    if (!v18 && v19)
    {
      uint64_t v22 = *(void *)(a1 + 40);
      id v23 = +[NSError fp_invalidArgumentError:@"Usage: -b is set, you need to set -a to point to the domain's root"];
      (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);

      goto LABEL_29;
    }
    uint64_t v82 = 0;
    NSErrorUserInfoKey v83 = &v82;
    uint64_t v84 = 0x3032000000;
    uint64_t v85 = sub_10000B870;
    uint64_t v86 = sub_10000B880;
    id v87 = 0;
    if ((a7 & 8) != 0)
    {
      uint64_t v27 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      id v29 = *(void **)(a1 + 32);
      uint64_t v28 = *(void **)(a1 + 40);
      id v58 = v27;
      id v57 = v29;
      id v55 = v17;
      id v54 = v20;
      id v62 = v28;
      uint64_t v106 = 0;
      uint64_t v107 = &v106;
      uint64_t v108 = 0x3032000000;
      id v109 = sub_10000B870;
      uint64_t v110 = sub_10000B880;
      id v111 = 0;
      id v111 = (id)objc_opt_new();
      id v30 = [@"/.b/9" stringByAppendingPathComponent:@"Library/Mobile Documents"];
      id v31 = +[NSURL fileURLWithPath:v30 isDirectory:1];

      uint64_t v66 = sub_10000D28C(v31);
      NSLog(@"snapshotMobileDocumentsURL at %@ is %@", v31, v66);
      if (v66) {
        [(id)v107[5] setValue:v31 forKey:v66];
      }
      uint64_t v53 = v31;
      uint64_t v32 = [@"/.b/9" stringByAppendingPathComponent:@"Library/CloudStorage"];
      uint64_t v64 = +[NSURL fileURLWithPath:v32 isDirectory:1];

      unsigned __int8 v33 = +[NSFileManager defaultManager];
      id v105 = 0;
      id v60 = [v33 contentsOfDirectoryAtURL:v64 includingPropertiesForKeys:0 options:1 error:&v105];
      id v34 = v105;

      if (v34)
      {
        uint64_t v35 = fp_current_or_default_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_10000DA98();
        }
      }
      v104[0] = _NSConcreteStackBlock;
      v104[1] = 3221225472;
      v104[2] = sub_10000D380;
      v104[3] = &unk_1000151D8;
      v104[4] = &v106;
      [v60 enumerateObjectsUsingBlock:v104];
      uint64_t v36 = [@"/.b/9" stringByAppendingPathComponent:@"Library/Application Support/FileProvider"];
      uint64_t v37 = +[NSURL fileURLWithPath:v36 isDirectory:1];

      NSLog(@"snapshotFPAppSupportURL is %@", v37);
      char v38 = +[NSFileManager defaultManager];
      id v39 = (void *)v37;
      id v103 = 0;
      id v40 = [v38 contentsOfDirectoryAtURL:v37 includingPropertiesForKeys:0 options:1 error:&v103];
      id v41 = v103;

      if (v41)
      {
        id v42 = fp_current_or_default_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_10000DA98();
        }

        v62[2](v62, v41);
      }
      else
      {
        v101[0] = 0;
        v101[1] = v101;
        v101[2] = 0x3032000000;
        v101[3] = sub_10000B870;
        v101[4] = sub_10000B880;
        id v102 = 0;
        v91[0] = _NSConcreteStackBlock;
        v91[1] = 3221225472;
        v91[2] = sub_10000D408;
        v91[3] = &unk_100015200;
        uint64_t v92 = @"database/db";
        id v97 = &v106;
        id v93 = v54;
        BOOL v100 = (a7 & 4) != 0;
        uint64_t v47 = v58;
        long long v94 = v47;
        id v48 = v57;
        long long v95 = v48;
        id v96 = v55;
        id v98 = v101;
        uint64_t v99 = a9;
        [v40 enumerateObjectsUsingBlock:v91];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10000D690;
        block[3] = &unk_1000146F0;
        uint64_t v89 = v62;
        id v90 = v101;
        dispatch_group_notify(v47, v48, block);

        _Block_object_dispose(v101, 8);
      }

      _Block_object_dispose(&v106, 8);
      long long v46 = v58;
    }
    else
    {
      if (v18)
      {
        id obj = 0;
        id v24 = +[FPProviderDomain providerDomainForURL:v18 error:&obj];
        objc_storeStrong(&v87, obj);
        uint64_t v25 = (void *)v83[5];
        if (v25)
        {
          uint64_t v26 = [v25 description];
          NSLog(@"Error while fetching providerDomainID for url %@: %@", v18, v26);
        }
        else
        {
          if (v24)
          {
            id v67 = [v24 identifier];
            [v24 isUsingFPFS];
            id v61 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            id v59 = *(void **)(a1 + 32);
            int v49 = *(unsigned __int8 *)(a1 + 56);
            int v50 = *(unsigned __int8 *)(a1 + 57);
            id v65 = [v18 path];
            char v63 = [v19 path];
            v79[0] = _NSConcreteStackBlock;
            v79[1] = 3221225472;
            v79[2] = sub_10000CD3C;
            v79[3] = &unk_100015110;
            long long v56 = *(_OWORD *)(a1 + 40);
            id v51 = (id)v56;
            long long v80 = v56;
            sub_10000B534(v67, 0, v61, v59, v49 != 0, v50 != 0, v17, v65, v63, a7, a9, v79);

            goto LABEL_27;
          }
          NSLog(@"No providerDomainID for url %@", v18);
          uint64_t v52 = +[NSError errorWithDomain:NSFileProviderErrorDomain code:-2001 userInfo:0];
          uint64_t v26 = (void *)v83[5];
          v83[5] = v52;
        }

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_27:

        goto LABEL_28;
      }
      long long v43 = +[FPDaemonConnection sharedConnection];
      v68[0] = _NSConcreteStackBlock;
      v68[1] = 3221225472;
      v68[2] = sub_10000CDA8;
      v68[3] = &unk_100015188;
      long long v72 = &v82;
      id v44 = *(id *)(a1 + 40);
      int v77 = a2;
      uint64_t v45 = *(void *)(a1 + 48);
      id v71 = v44;
      uint64_t v73 = v45;
      uint64_t v74 = a3;
      id v69 = *(id *)(a1 + 32);
      __int16 v78 = *(_WORD *)(a1 + 56);
      id v70 = v17;
      uint64_t v75 = a7;
      uint64_t v76 = a9;
      [v43 providerDomainsCompletionHandler:v68];

      long long v46 = v71;
    }

LABEL_28:
    _Block_object_dispose(&v82, 8);

    goto LABEL_29;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_29:
}

void sub_10000CCD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose((const void *)(v44 - 256), 8);
  _Block_object_dispose((const void *)(v44 - 152), 8);
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

void sub_10000CD3C(uint64_t a1, void *a2)
{
  int v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = a2;
  dispatch_group_leave(v3);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000CDA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) description];
    NSLog(@"Error while fetching providerDomainID: %@", v4);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    int v5 = *(_DWORD *)(a1 + 96);
    uint64_t v6 = *(uint64_t **)(a1 + 72);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000CEE4;
    v11[3] = &unk_100015160;
    id v7 = *(id *)(a1 + 48);
    uint64_t v8 = *(void *)(a1 + 64);
    id v14 = v7;
    uint64_t v15 = v8;
    id v12 = *(id *)(a1 + 32);
    __int16 v18 = *(_WORD *)(a1 + 100);
    id v9 = *(id *)(a1 + 40);
    long long v17 = *(_OWORD *)(a1 + 80);
    uint64_t v10 = *(void *)(a1 + 56);
    id v13 = v9;
    uint64_t v16 = v10;
    sub_10000B244(v5, v6, 4, v11);
  }
}

void sub_10000CEE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 description];
    NSLog(@"Error while parsing provider domains: %@", v8);

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    NSLog(@"🧹 About to launch FPCK checks for %lu domains", [v5 count]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v32 = v5;
    id obj = v5;
    id v9 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v40 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          id v14 = [v13 storageURLs];
          id v15 = [v14 count];

          if (v15)
          {
            uint64_t v16 = [v13 storageURLs];
            long long v17 = [v16 objectAtIndexedSubscript:0];
            __int16 v18 = [v17 path];

            id v19 = [v13 identifier];
            char v20 = *(unsigned char *)(a1 + 88);
            char v21 = *(unsigned char *)(a1 + 89);
            uint64_t v22 = *(void **)(a1 + 32);
            id v23 = *(void **)(a1 + 40);
            uint64_t v24 = *(void *)(a1 + 72);
            uint64_t v25 = *(void *)(a1 + 80);
            v37[0] = _NSConcreteStackBlock;
            int8x16_t v26 = vextq_s8(*(int8x16_t *)(a1 + 56), *(int8x16_t *)(a1 + 56), 8uLL);
            uint64_t v27 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
            v37[1] = 3221225472;
            v37[2] = sub_10000D1FC;
            v37[3] = &unk_100015138;
            int8x16_t v38 = v26;
            sub_10000B534(v19, 0, v27, v22, v20, v21, v23, v18, 0, v24, v25, v37);
          }
          else
          {
            __int16 v18 = [v13 identifier];
            NSLog(@"Skipping %@, usingFPFS %d", v18, [v13 isUsingFPFS]);
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v39 objects:v43 count:16];
      }
      while (v10);
    }

    uint64_t v28 = *(NSObject **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v29 = *(NSObject **)(a1 + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D270;
    block[3] = &unk_1000146F0;
    id v30 = *(id *)(a1 + 48);
    uint64_t v31 = *(void *)(a1 + 64);
    id v35 = v30;
    uint64_t v36 = v31;
    dispatch_group_notify(v28, v29, block);

    id v7 = 0;
    id v5 = v32;
  }
}

void sub_10000D1FC(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v6 = *(void *)(v4 + 40);
    id v5 = (id *)(v4 + 40);
    if (!v6) {
      objc_storeStrong(v5, a2);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t sub_10000D270(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

char *sub_10000D28C(void *a1)
{
  id v1 = a1;
  [v1 fileSystemRepresentation];
  unint64_t v2 = (char *)fpfs_path_return_assigned_provider_domain_xattr();
  if (v2)
  {
    id v3 = malloc_type_malloc(1uLL, 0x3ADBDA92uLL);
    if (v3)
    {
      uint64_t v4 = v3;
      ssize_t v5 = getxattr((const char *)[v1 fileSystemRepresentation], v2, v3, 0, 0, 0);
      if (v5 >= 1 && v5 <= 0)
      {
        v4[v5] = 0;
        unint64_t v2 = +[NSString stringWithUTF8String:v4];
      }
      else
      {
        unint64_t v2 = 0;
      }
      free(v4);
    }
    else
    {
      unint64_t v2 = 0;
    }
  }

  return v2;
}

void sub_10000D380(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = sub_10000D28C(v4);
  NSLog(@"csProviderDomainID at %@ is %@", v4, v3);
  if (v3) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setValue:v4 forKey:v3];
  }
}

void sub_10000D408(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSLog(@"enumerating... %@", v3);
  id v4 = [v3 lastPathComponent];
  unsigned __int8 v5 = [v4 isEqualToString:@"backup"];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [v3 URLByAppendingPathComponent:*(void *)(a1 + 32)];
    id v7 = +[NSFileManager defaultManager];
    uint64_t v8 = [v6 path];
    unsigned int v9 = [v7 fileExistsAtPath:v8];

    if (v9)
    {
      id v10 = sub_10000D28C(v3);
      uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) objectForKey:v10];
      if (v11)
      {
        id v12 = *(void **)(a1 + 40);
        if (!v12 || [v12 isEqualToString:v10])
        {
          NSLog(@"found providerDomainID (%@) for db at %@, that matches rootURL %@", v10, v3, v11);
          if (*(unsigned char *)(a1 + 96)) {
            uint64_t v13 = 15;
          }
          else {
            uint64_t v13 = 11;
          }
          long long v17 = *(void **)(a1 + 56);
          __int16 v18 = *(void **)(a1 + 48);
          id v19 = *(void **)(a1 + 64);
          id v14 = [v11 path];
          id v15 = [v6 path];
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_10000D624;
          v20[3] = &unk_1000148E8;
          uint64_t v16 = *(void *)(a1 + 88);
          uint64_t v22 = *(void *)(a1 + 80);
          id v21 = *(id *)(a1 + 48);
          sub_10000B534(v10, 0, v18, v17, 0, 0, v19, v14, v15, v13, v16, v20);
        }
      }
    }
  }
}

void sub_10000D624(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void *)(v4 + 40);
    unsigned __int8 v5 = (id *)(v4 + 40);
    if (!v6) {
      objc_storeStrong(v5, a2);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_10000D690(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10000D6C4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10000D6E4(uint64_t *a1, int __errnum, NSObject *a3)
{
  uint64_t v4 = *a1;
  int v5 = 136315394;
  uint64_t v6 = v4;
  __int16 v7 = 2080;
  uint64_t v8 = strerror(__errnum);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "[ERROR] Can't spawn %s: %s", (uint8_t *)&v5, 0x16u);
}

void sub_10000D784(int a1)
{
  strerror(a1);
  sub_1000061C8();
  sub_1000061A8((void *)&_mh_execute_header, v1, v2, "[ERROR] Unable to initialize the file actions properly: %s", v3, v4, v5, v6, v7);
}

void sub_10000D7FC(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *FileProviderUILibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"cmd-evaluate.m" lineNumber:28 description:@"%s" *a1];

  __break(1u);
}

void sub_10000D87C()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getFPUIManagerClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"cmd-evaluate.m" lineNumber:29 description:@"Unable to find class %s", "FPUIManager"];

  __break(1u);
}

void sub_10000D8F8()
{
}

void sub_10000D924()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"NSData *_UIImagePNGRepresentation(UIImage *__strong)"];
  [v0 handleFailureInFunction:v1 file:@"fileproviderctl-utilities.m" lineNumber:25 description:@"%s", dlerror()];

  __break(1u);
}

void sub_10000D99C()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"Class getUIImageClass(void)_block_invoke"];
  [v0 handleFailureInFunction:v1 file:@"fileproviderctl-utilities.m" lineNumber:24 description:@"Unable to find class %s", "UIImage"];

  __break(1u);
}

void sub_10000DA18(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *UIKitLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"fileproviderctl-utilities.m" lineNumber:23 description:@"%s" *a1];

  __break(1u);
}

void sub_10000DA98()
{
  sub_10000D6AC();
  sub_10000D6C4((void *)&_mh_execute_header, v0, v1, "[ERROR] there was an error enumerating %@, error: %@");
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t FPConnectionStateToPrettyString()
{
  return _FPConnectionStateToPrettyString();
}

uint64_t FPDocumentURLFromBookmarkableString()
{
  return _FPDocumentURLFromBookmarkableString();
}

uint64_t FPGetImportCookieForURL()
{
  return _FPGetImportCookieForURL();
}

uint64_t LICreateIconFromCachedBitmap()
{
  return _LICreateIconFromCachedBitmap();
}

void NSLog(NSString *format, ...)
{
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void errx(int a1, const char *a2, ...)
{
}

int execl(const char *__path, const char *__arg0, ...)
{
  return _execl(__path, __arg0);
}

int execv(const char *__path, char *const *__argv)
{
  return _execv(__path, __argv);
}

void exit(int a1)
{
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

uint64_t fp_current_or_default_log()
{
  return _fp_current_or_default_log();
}

uint64_t fp_default_log()
{
  return _fp_default_log();
}

uint64_t fpfs_enable_fts_thread_fchdir()
{
  return _fpfs_enable_fts_thread_fchdir();
}

uint64_t fpfs_fsgetpath()
{
  return _fpfs_fsgetpath();
}

uint64_t fpfs_lp_faccessat()
{
  return _fpfs_lp_faccessat();
}

uint64_t fpfs_lp_sandbox_check()
{
  return _fpfs_lp_sandbox_check();
}

uint64_t fpfs_path_return_assigned_provider_domain_xattr()
{
  return _fpfs_path_return_assigned_provider_domain_xattr();
}

uint64_t fpfs_supports_long_paths()
{
  return _fpfs_supports_long_paths();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

uid_t getuid(void)
{
  return _getuid();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return _posix_spawn_file_actions_adddup2(a1, a2, a3);
}

int posix_spawn_file_actions_destroy(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_destroy(a1);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return _posix_spawn_file_actions_init(a1);
}

int posix_spawnp(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawnp(a1, a2, a3, a4, __argv, __envp);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

id objc_msgSend_URLByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 URLByResolvingSymlinksInPath];
}

id objc_msgSend_URLByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 URLByStandardizingPath];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_contentModificationDate(void *a1, const char *a2, ...)
{
  return [a1 contentModificationDate];
}

id objc_msgSend_contentPolicy(void *a1, const char *a2, ...)
{
  return [a1 contentPolicy];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return [a1 contentType];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return [a1 dateFormatter];
}

id objc_msgSend_decorationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 decorationIdentifier];
}

id objc_msgSend_decorations(void *a1, const char *a2, ...)
{
  return [a1 decorations];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disconnectionReason(void *a1, const char *a2, ...)
{
  return [a1 disconnectionReason];
}

id objc_msgSend_disconnectionState(void *a1, const char *a2, ...)
{
  return [a1 disconnectionState];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_documentSize(void *a1, const char *a2, ...)
{
  return [a1 documentSize];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainDisplayName(void *a1, const char *a2, ...)
{
  return [a1 domainDisplayName];
}

id objc_msgSend_domainFullDisplayName(void *a1, const char *a2, ...)
{
  return [a1 domainFullDisplayName];
}

id objc_msgSend_domainPathRelativeToVolumeRoot(void *a1, const char *a2, ...)
{
  return [a1 domainPathRelativeToVolumeRoot];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downloadingError(void *a1, const char *a2, ...)
{
  return [a1 downloadingError];
}

id objc_msgSend_downloadingProgress(void *a1, const char *a2, ...)
{
  return [a1 downloadingProgress];
}

id objc_msgSend_effectiveContentPolicy(void *a1, const char *a2, ...)
{
  return [a1 effectiveContentPolicy];
}

id objc_msgSend_entries(void *a1, const char *a2, ...)
{
  return [a1 entries];
}

id objc_msgSend_fileHandleWithStandardOutput(void *a1, const char *a2, ...)
{
  return [a1 fileHandleWithStandardOutput];
}

id objc_msgSend_fileID(void *a1, const char *a2, ...)
{
  return [a1 fileID];
}

id objc_msgSend_fileSystemFlags(void *a1, const char *a2, ...)
{
  return [a1 fileSystemFlags];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return [a1 fractionCompleted];
}

id objc_msgSend_hasExpired(void *a1, const char *a2, ...)
{
  return [a1 hasExpired];
}

id objc_msgSend_humanReadableCapabilities(void *a1, const char *a2, ...)
{
  return [a1 humanReadableCapabilities];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageType(void *a1, const char *a2, ...)
{
  return [a1 imageType];
}

id objc_msgSend_inheritedContentPolicy(void *a1, const char *a2, ...)
{
  return [a1 inheritedContentPolicy];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isCloudItem(void *a1, const char *a2, ...)
{
  return [a1 isCloudItem];
}

id objc_msgSend_isContainer(void *a1, const char *a2, ...)
{
  return [a1 isContainer];
}

id objc_msgSend_isDeclared(void *a1, const char *a2, ...)
{
  return [a1 isDeclared];
}

id objc_msgSend_isDownloaded(void *a1, const char *a2, ...)
{
  return [a1 isDownloaded];
}

id objc_msgSend_isDownloading(void *a1, const char *a2, ...)
{
  return [a1 isDownloading];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isExcludedFromSync(void *a1, const char *a2, ...)
{
  return [a1 isExcludedFromSync];
}

id objc_msgSend_isFolder(void *a1, const char *a2, ...)
{
  return [a1 isFolder];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isInPinnedFolder(void *a1, const char *a2, ...)
{
  return [a1 isInPinnedFolder];
}

id objc_msgSend_isIndeterminate(void *a1, const char *a2, ...)
{
  return [a1 isIndeterminate];
}

id objc_msgSend_isMostRecentVersionDownloaded(void *a1, const char *a2, ...)
{
  return [a1 isMostRecentVersionDownloaded];
}

id objc_msgSend_isPinned(void *a1, const char *a2, ...)
{
  return [a1 isPinned];
}

id objc_msgSend_isRecursivelyDownloaded(void *a1, const char *a2, ...)
{
  return [a1 isRecursivelyDownloaded];
}

id objc_msgSend_isTrashed(void *a1, const char *a2, ...)
{
  return [a1 isTrashed];
}

id objc_msgSend_isUploaded(void *a1, const char *a2, ...)
{
  return [a1 isUploaded];
}

id objc_msgSend_isUploading(void *a1, const char *a2, ...)
{
  return [a1 isUploading];
}

id objc_msgSend_isUsingFPFS(void *a1, const char *a2, ...)
{
  return [a1 isUsingFPFS];
}

id objc_msgSend_itemDecorations(void *a1, const char *a2, ...)
{
  return [a1 itemDecorations];
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 itemIdentifier];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastUsedDate(void *a1, const char *a2, ...)
{
  return [a1 lastUsedDate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedRecoverySuggestion(void *a1, const char *a2, ...)
{
  return [a1 localizedRecoverySuggestion];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_needsAuthentication(void *a1, const char *a2, ...)
{
  return [a1 needsAuthentication];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfBrokenFilesInBackupManifestCheck(void *a1, const char *a2, ...)
{
  return [a1 numberOfBrokenFilesInBackupManifestCheck];
}

id objc_msgSend_numberOfBrokenFilesInFSAndFSSnapshotCheck(void *a1, const char *a2, ...)
{
  return [a1 numberOfBrokenFilesInFSAndFSSnapshotCheck];
}

id objc_msgSend_numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck(void *a1, const char *a2, ...)
{
  return [a1 numberOfBrokenFilesInFSSnapshotAndFPSnapshotCheck];
}

id objc_msgSend_numberOfBrokenFilesInReconciliationTableCheck(void *a1, const char *a2, ...)
{
  return [a1 numberOfBrokenFilesInReconciliationTableCheck];
}

id objc_msgSend_numberOfFilesChecked(void *a1, const char *a2, ...)
{
  return [a1 numberOfFilesChecked];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return [a1 predicate];
}

id objc_msgSend_providerDomainID(void *a1, const char *a2, ...)
{
  return [a1 providerDomainID];
}

id objc_msgSend_providerID(void *a1, const char *a2, ...)
{
  return [a1 providerID];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_requiresFetchingInfoFirst(void *a1, const char *a2, ...)
{
  return [a1 requiresFetchingInfoFirst];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedConnectionProxy(void *a1, const char *a2, ...)
{
  return [a1 sharedConnectionProxy];
}

id objc_msgSend_startPager(void *a1, const char *a2, ...)
{
  return [a1 startPager];
}

id objc_msgSend_storageURLs(void *a1, const char *a2, ...)
{
  return [a1 storageURLs];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByExpandingTildeInPath];
}

id objc_msgSend_supportsEnumeration(void *a1, const char *a2, ...)
{
  return [a1 supportsEnumeration];
}

id objc_msgSend_synchronousSharedConnectionProxy(void *a1, const char *a2, ...)
{
  return [a1 synchronousSharedConnectionProxy];
}

id objc_msgSend_tags(void *a1, const char *a2, ...)
{
  return [a1 tags];
}

id objc_msgSend_testingModes(void *a1, const char *a2, ...)
{
  return [a1 testingModes];
}

id objc_msgSend_thumbnailQueue(void *a1, const char *a2, ...)
{
  return [a1 thumbnailQueue];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typeAndCreator(void *a1, const char *a2, ...)
{
  return [a1 typeAndCreator];
}

id objc_msgSend_uploadingError(void *a1, const char *a2, ...)
{
  return [a1 uploadingError];
}

id objc_msgSend_uploadingProgress(void *a1, const char *a2, ...)
{
  return [a1 uploadingProgress];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInteractionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 userInteractionIdentifier];
}

id objc_msgSend_waitUntilFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilFinished];
}

id objc_msgSend_writingIntentWithURL_options_(void *a1, const char *a2, ...)
{
  return [a1 writingIntentWithURL:x0 options:x1];
}