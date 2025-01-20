void sub_100003228(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  char *v6;
  int v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  CFErrorRef v15;
  CFErrorRef v16;
  id v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  int v22;

  if (a2)
  {
    v4 = [*(id *)(a1 + 32) logHandle];

    if (v4)
    {
      v5 = [*(id *)(a1 + 32) logHandle];
      os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      [*(id *)(a1 + 32) cryptexName];
      *(_DWORD *)buf = 138543618;
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = 1024;
      v22 = a2;
      v6 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      v14 = &_os_log_default;
      [*(id *)(a1 + 32) cryptexName];
      *(_DWORD *)buf = 138543618;
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v21 = 1024;
      v22 = a2;
      v6 = (char *)_os_log_send_and_compose_impl();

      v5 = &_os_log_default;
    }

    v15 = sub_10000BF78("-[UpgradeOperation terminateJobsWithCompletion:]_block_invoke", "upgrade_sequencer.m", 128, "com.apple.security.cryptex.posix", a2, 0, v6);
LABEL_14:
    v16 = v15;
    free(v6);
    goto LABEL_15;
  }
  v7 = *__error();
  v8 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [*(id *)(a1 + 32) cryptexName];
    *(_DWORD *)buf = 138543362;
    v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Terminated jobs for cryptex '%{public}@'", buf, 0xCu);
  }
  *__error() = v7;
  v10 = proc_terminate_all_rsr(9);
  if (v10)
  {
    v11 = [*(id *)(a1 + 32) logHandle];

    if (v11)
    {
      v12 = [*(id *)(a1 + 32) logHandle];
      os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
      v13 = [*(id *)(a1 + 32) cryptexName];
      *(_DWORD *)buf = 138543618;
      v20 = v13;
      v21 = 1024;
      v22 = v10;
      v6 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      v17 = &_os_log_default;
      v18 = [*(id *)(a1 + 32) cryptexName];
      *(_DWORD *)buf = 138543618;
      v20 = v18;
      v21 = 1024;
      v22 = v10;
      v6 = (char *)_os_log_send_and_compose_impl();

      v12 = &_os_log_default;
    }

    v15 = sub_10000BF78("-[UpgradeOperation terminateJobsWithCompletion:]_block_invoke", "upgrade_sequencer.m", 143, "com.apple.security.cryptex.posix", v10, 0, v6);
    goto LABEL_14;
  }
  v16 = 0;
LABEL_15:
  (*(void (**)(void, CFErrorRef))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v16);
}

void sub_100003624(_Unwind_Exception *a1)
{
}

void sub_1000037A4(uint64_t a1)
{
  int v2 = *__error();
  v3 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Upgrade complete.", v5, 2u);
  }

  *__error() = v2;
  v4 = [*(id *)(a1 + 32) group];
  dispatch_group_leave(v4);
}

void sub_10000390C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_100003C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003C84(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleInterfaceLockMessage:v3];
}

void sub_100004074(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

void sub_100004200(id a1)
{
  qword_10005E3D8 = objc_alloc_init(UpgradeSequencer);

  _objc_release_x1();
}

int *sub_100004418(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _timeout];

  int v3 = *__error();
  v4 = [*(id *)(a1 + 32) logHandle];
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = [*(id *)(a1 + 32) _timeout];
      int v8 = 138412290;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Timed out client.: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Timed out client. [no error]", (uint8_t *)&v8, 2u);
  }

  result = __error();
  int *result = v3;
  return result;
}

void sub_100004624(uint64_t a1)
{
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_100004C60;
  v40 = sub_100004C70;
  id v41 = 0;
  id v2 = dispatch_group_create();
  if ([*(id *)(a1 + 32) _isInterfaceLocked])
  {
    int v3 = (void *)v37[5];
    v37[5] = 0;

    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100004C78;
    v35[3] = &unk_1000591B0;
    v4 = *(void **)(a1 + 40);
    v35[4] = *(void *)(a1 + 32);
    v35[5] = &v36;
    [v4 enumerateKeysAndObjectsUsingBlock:v35];
    v5 = *(void **)(a1 + 32);
    if (v37[5])
    {
      v6 = [v5 logHandle];

      if (v6)
      {
        v7 = [*(id *)(a1 + 32) logHandle];
        os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
        LOWORD(v42) = 0;
        int v8 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        LOWORD(v42) = 0;
        int v8 = (char *)_os_log_send_and_compose_impl();
      }
      CFErrorRef v19 = sub_10000BF78("-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke", "upgrade_sequencer.m", 425, "com.apple.security.cryptex", 11, (const void *)v37[5], v8);
      free(v8);
      v20 = v37[5];
      v37[5] = (uint64_t)v19;
      goto LABEL_15;
    }
    signed int v12 = [v5 _setKernelUpgradeOngoing:1];
    v13 = *(void **)(a1 + 32);
    if (!v12)
    {
      [v13 _disableInterfaceLockTimeout];
      dispatch_group_enter(v2);
      v21 = *(void **)(a1 + 40);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_100004F48;
      v30[3] = &unk_100059200;
      v22 = v2;
      uint64_t v23 = *(void *)(a1 + 32);
      v31 = v22;
      uint64_t v32 = v23;
      char v34 = *(unsigned char *)(a1 + 56);
      v33 = &v36;
      [v21 enumerateKeysAndObjectsUsingBlock:v30];
      v24 = [*(id *)(a1 + 32) workQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000519C;
      block[3] = &unk_100059228;
      uint64_t v25 = *(void *)(a1 + 32);
      v29 = &v36;
      block[4] = v25;
      id v28 = *(id *)(a1 + 48);
      dispatch_group_notify(v22, v24, block);

      dispatch_group_leave(v22);
      v20 = v31;
LABEL_15:

      goto LABEL_16;
    }
    v14 = [v13 logHandle];

    if (v14)
    {
      v15 = [*(id *)(a1 + 32) logHandle];
      os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      int v42 = 67109120;
      signed int v43 = v12;
      v16 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      int v42 = 67109120;
      signed int v43 = v12;
      v16 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v26 = sub_10000BF78("-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke", "upgrade_sequencer.m", 435, "com.apple.security.cryptex.posix", v12, 0, v16);
    free(v16);
    v18 = (void *)v37[5];
    v37[5] = (uint64_t)v26;
  }
  else
  {
    v9 = [*(id *)(a1 + 32) logHandle];

    if (v9)
    {
      v10 = [*(id *)(a1 + 32) logHandle];
      os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      LOWORD(v42) = 0;
      v11 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      LOWORD(v42) = 0;
      v11 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v17 = sub_10000BF78("-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke", "upgrade_sequencer.m", 393, "com.apple.security.cryptex", 11, 0, v11);
    free(v11);
    v18 = (void *)v37[5];
    v37[5] = (uint64_t)v17;
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v37[5]);
LABEL_16:

  _Block_object_dispose(&v36, 8);
}

void sub_100004C04(_Unwind_Exception *a1)
{
  free(0);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004C60(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004C70(uint64_t a1)
{
}

void sub_100004C78(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    signed int v12 = [*(id *)(a1 + 32) logHandle];

    if (v12)
    {
      v13 = [*(id *)(a1 + 32) logHandle];
      os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      v11 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      v11 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v14 = sub_10000BF78("-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke", "upgrade_sequencer.m", 407, "com.apple.security.cryptex", 11, 0, v11);
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = [*(id *)(a1 + 32) logHandle];

    if (v9)
    {
      v10 = [*(id *)(a1 + 32) logHandle];
      os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      v11 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      v11 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v14 = sub_10000BF78("-[UpgradeSequencer startUpgradeForCryptexes:killingJobs:withCompletion:]_block_invoke", "upgrade_sequencer.m", 415, "com.apple.security.cryptex", 11, 0, v11);
LABEL_11:
    CFErrorRef v15 = v14;
    free(v11);
    uint64_t v16 = *(void *)(*(void *)(a1 + 40) + 8);
    CFErrorRef v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    *a4 = 1;
  }
}

void sub_100004F20(_Unwind_Exception *a1)
{
}

void sub_100004F48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = *(NSObject **)(a1 + 32);
  id v7 = a3;
  dispatch_group_enter(v6);
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 56);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000503C;
  v11[3] = &unk_1000591D8;
  v11[4] = v8;
  id v12 = v5;
  uint64_t v14 = *(void *)(a1 + 48);
  id v13 = *(id *)(a1 + 32);
  id v10 = v5;
  [v8 _startUpgradeForCryptex:v10 withGraftPath:v7 killingJobs:v9 withCompletion:v11];
}

void sub_10000503C(uint64_t a1, void *a2)
{
  id v4 = a2;
  int v5 = *__error();
  v6 = [*(id *)(a1 + 32) logHandle];
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v13 = 138543618;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "start upgrade of cryptex '%{public}@': %@", (uint8_t *)&v13, 0x16u);
    }

    *__error() = v5;
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void *)(v9 + 40);
    id v10 = (id *)(v9 + 40);
    if (!v11) {
      objc_storeStrong(v10, a2);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = *(void *)(a1 + 40);
      int v13 = 138543362;
      uint64_t v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "start upgrade of cryptex '%{public}@' [no error]", (uint8_t *)&v13, 0xCu);
    }

    *__error() = v5;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t sub_10000519C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  int v3 = *__error();
  id v4 = [*(id *)(a1 + 32) logHandle];
  int v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v12 = 138412290;
      uint64_t v13 = v6;
      id v7 = "start upgrade session: %@";
      uint64_t v8 = v5;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, v7, (uint8_t *)&v12, v10);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v12) = 0;
    id v7 = "start upgrade session [no error]";
    uint64_t v8 = v5;
    os_log_type_t v9 = OS_LOG_TYPE_DEBUG;
    uint32_t v10 = 2;
    goto LABEL_6;
  }

  *__error() = v3;
  [*(id *)(a1 + 32) _restartInterfaceLockTimeout];
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

void sub_100005380(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _completeUpgradeWithError:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000054D4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) upgradesUnderway];
  int v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    int v5 = [*(id *)(a1 + 32) workQueue];
    [v3 onComplete:v4 withQueue:v5];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) logHandle];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 32) logHandle];
      os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    }
    int v5 = sub_10000BF78("-[UpgradeSequencer onUpgradeCompleteForCryptex:withCompletion:]_block_invoke", "upgrade_sequencer.m", 497, "com.apple.security.cryptex", 8, 0, v8);
    free(v8);
    (*(void (**)(void, void *))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v5);
  }

  os_log_type_t v9 = [*(id *)(a1 + 32) workQueue];
  dispatch_resume(v9);
}

void sub_10000568C(_Unwind_Exception *a1)
{
}

void sub_100005778(uint64_t a1)
{
  [*(id *)(a1 + 32) setSessionCompleteCallback:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) workQueue];
  dispatch_resume(v2);
}

void sub_1000058A8(uint64_t a1)
{
  int v5 = [*(id *)(a1 + 32) lockingClient];

  if (v5)
  {
    long long buffer = *(_OWORD *)"unknown";
    long long v63 = *(_OWORD *)&qword_1000485C8;
    uint64_t v6 = [*(id *)(a1 + 32) lockingClient];
    id v7 = [v6 conn];
    pid_t pid = xpc_connection_get_pid(v7);
    proc_name(pid, &buffer, 0x20u);

    os_log_type_t v9 = [*(id *)(a1 + 32) logHandle];

    if (v9)
    {
      uint32_t v10 = [*(id *)(a1 + 32) logHandle];
      os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      uint64_t v11 = [*(id *)(a1 + 32) lockingClient];
      int v12 = [v11 conn];
      if (v12)
      {
        id v2 = [*(id *)(a1 + 32) lockingClient];
        int v3 = [v2 conn];
        pid_t v13 = xpc_connection_get_pid(v3);
      }
      else
      {
        pid_t v13 = -1;
      }
      *(_DWORD *)buf = 136315650;
      p_long long buffer = &buffer;
      __int16 v58 = 1024;
      pid_t v59 = v13;
      __int16 v60 = 1024;
      LODWORD(v61) = 16;
      uint64_t v36 = (char *)_os_log_send_and_compose_impl();
      if (v12)
      {
      }
    }
    else
    {
      id v24 = &_os_log_default;
      uint64_t v25 = [*(id *)(a1 + 32) lockingClient];
      CFErrorRef v26 = [v25 conn];
      if (v26)
      {
        uint64_t v1 = [*(id *)(a1 + 32) lockingClient];
        id v2 = [v1 conn];
        pid_t v27 = xpc_connection_get_pid((xpc_connection_t)v2);
      }
      else
      {
        pid_t v27 = -1;
      }
      *(_DWORD *)buf = 136315650;
      p_long long buffer = &buffer;
      __int16 v58 = 1024;
      pid_t v59 = v27;
      __int16 v60 = 1024;
      LODWORD(v61) = 16;
      uint64_t v36 = (char *)_os_log_send_and_compose_impl();
      if (v26)
      {
      }
      uint32_t v10 = &_os_log_default;
    }

    CFErrorRef v37 = sub_10000BF78("-[UpgradeSequencer lockInterfaceForClient:withCompletion:]_block_invoke", "upgrade_sequencer.m", 524, "com.apple.security.cryptex.posix", 16, 0, v36);
  }
  else
  {
    if (sub_10002C474(*(void *)(a1 + 40), (uint64_t)"com.apple.private.security.cryptex.upgrade"))
    {
      uint64_t v14 = *(_xpc_connection_s **)(a1 + 40);
      __int16 v15 = [*(id *)(a1 + 32) workQueue];
      xpc_connection_set_target_queue(v14, v15);

      id v16 = [UpgradeClient alloc];
      uint64_t v17 = *(void *)(a1 + 40);
      v18 = [*(id *)(a1 + 32) logHandle];
      CFErrorRef v19 = [(UpgradeClient *)v16 initWithConn:v17 log:v18];
      [*(id *)(a1 + 32) setLockingClient:v19];

      v20 = [*(id *)(a1 + 32) lockingClient];
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_1000060F0;
      v55[3] = &unk_1000590F8;
      v55[4] = *(void *)(a1 + 32);
      [v20 onCancel:v55];

      v21 = [*(id *)(a1 + 32) lockingClient];
      [v21 activate];

      v22 = [*(id *)(a1 + 32) workQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000060F8;
      block[3] = &unk_1000590F8;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(v22, block);

      CFErrorRef v23 = 0;
      goto LABEL_33;
    }
    long long buffer = *(_OWORD *)"unknown";
    long long v63 = *(_OWORD *)&qword_1000485C8;
    id v28 = [*(id *)(a1 + 32) lockingClient];
    v29 = [v28 conn];
    pid_t v30 = xpc_connection_get_pid(v29);
    proc_name(v30, &buffer, 0x20u);

    v31 = [*(id *)(a1 + 32) logHandle];

    if (v31)
    {
      uint64_t v32 = [*(id *)(a1 + 32) logHandle];
      os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
      v33 = [*(id *)(a1 + 32) lockingClient];
      char v34 = [v33 conn];
      if (v34)
      {
        id v2 = [*(id *)(a1 + 32) lockingClient];
        int v3 = [v2 conn];
        pid_t v35 = xpc_connection_get_pid(v3);
      }
      else
      {
        pid_t v35 = -1;
      }
      *(_DWORD *)buf = 136315650;
      p_long long buffer = &buffer;
      __int16 v58 = 1024;
      pid_t v59 = v35;
      __int16 v60 = 1024;
      LODWORD(v61) = 144;
      uint64_t v36 = (char *)_os_log_send_and_compose_impl();
      if (v34)
      {
      }
    }
    else
    {
      id v38 = &_os_log_default;
      v39 = [*(id *)(a1 + 32) lockingClient];
      v40 = [v39 conn];
      if (v40)
      {
        uint64_t v1 = [*(id *)(a1 + 32) lockingClient];
        id v2 = [v1 conn];
        pid_t v41 = xpc_connection_get_pid((xpc_connection_t)v2);
      }
      else
      {
        pid_t v41 = -1;
      }
      *(_DWORD *)buf = 136315650;
      p_long long buffer = &buffer;
      __int16 v58 = 1024;
      pid_t v59 = v41;
      __int16 v60 = 1024;
      LODWORD(v61) = 144;
      uint64_t v36 = (char *)_os_log_send_and_compose_impl();
      if (v40)
      {
      }
      uint64_t v32 = &_os_log_default;
    }

    CFErrorRef v37 = sub_10000BF78("-[UpgradeSequencer lockInterfaceForClient:withCompletion:]_block_invoke", "upgrade_sequencer.m", 534, "com.apple.security.cryptex.posix", 144, 0, v36);
  }
  CFErrorRef v23 = v37;
  free(v36);
LABEL_33:
  long long buffer = *(_OWORD *)"unknown";
  long long v63 = *(_OWORD *)&qword_1000485C8;
  pid_t v42 = xpc_connection_get_pid(*(xpc_connection_t *)(a1 + 40));
  proc_name(v42, &buffer, 0x20u);
  int v43 = *__error();
  v44 = [*(id *)(a1 + 32) logHandle];
  v45 = v44;
  if (v23)
  {
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v46 = *(_xpc_connection_s **)(a1 + 40);
      if (v46) {
        pid_t v47 = xpc_connection_get_pid(v46);
      }
      else {
        pid_t v47 = -1;
      }
      *(_DWORD *)buf = 136315650;
      p_long long buffer = &buffer;
      __int16 v58 = 1024;
      pid_t v59 = v47;
      __int16 v60 = 2112;
      CFErrorRef v61 = v23;
      v50 = "XPC client <process=%s pid=%d>: lock upgrade interface: %@";
      v51 = v45;
      os_log_type_t v52 = OS_LOG_TYPE_ERROR;
      uint32_t v53 = 28;
LABEL_44:
      _os_log_impl((void *)&_mh_execute_header, v51, v52, v50, buf, v53);
    }
  }
  else if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    v48 = *(_xpc_connection_s **)(a1 + 40);
    if (v48) {
      pid_t v49 = xpc_connection_get_pid(v48);
    }
    else {
      pid_t v49 = -1;
    }
    *(_DWORD *)buf = 136315394;
    p_long long buffer = &buffer;
    __int16 v58 = 1024;
    pid_t v59 = v49;
    v50 = "XPC client <process=%s pid=%d>: lock upgrade interface [no error]";
    v51 = v45;
    os_log_type_t v52 = OS_LOG_TYPE_DEBUG;
    uint32_t v53 = 18;
    goto LABEL_44;
  }

  *__error() = v43;
  (*(void (**)(void, CFErrorRef))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v23);
}

void sub_1000060B0(_Unwind_Exception *a1)
{
}

id sub_1000060F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleInterfaceLockCancel];
}

id sub_1000060F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _restartInterfaceLockTimeout];
}

void sub_1000061C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000061E0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lockingClient];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) lockingClient];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sub_10003D498([v3 cred], *(_DWORD **)(a1 + 48));
  }
}

void sub_100006320(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _abort];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000671C(_Unwind_Exception *a1)
{
}

void sub_1000070B8(_Unwind_Exception *a1)
{
}

void sub_1000071D8(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

void sub_1000075A4(_Unwind_Exception *a1)
{
}

void sub_100007718(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a3;
  [v4 setError:v3];
  [v4 completeUpgrade];
}

void sub_100007858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = +[UpgradeSequencer getSharedInstance];
  id v7 = +[NSString stringWithUTF8String:a1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000791C;
  v8[3] = &unk_100059310;
  v8[4] = a3;
  v8[5] = a2;
  [v6 onUpgradeCompleteForCryptex:v7 withCompletion:v8];
}

uint64_t sub_10000791C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

void sub_100007924()
{
  id v1 = +[UpgradeSequencer getSharedInstance];
  v0 = [v1 lockAcquireQueue];
  dispatch_resume(v0);
}

uint64_t sub_100007984()
{
  return _os_log_send_and_compose_impl();
}

uint64_t sub_1000079A0(unint64_t a1)
{
  if (a1 > 0xA || a1 - 1 > 9) {
    return 0;
  }
  else {
    return (uint64_t)*(&off_100059330 + a1 - 1);
  }
}

unint64_t sub_1000079CC(uint64_t a1, const char *a2, char a3)
{
  uint64_t v6 = +[NSFileManager defaultManager];
  id v7 = +[NSString stringWithCString:a1 encoding:4];
  id v26 = 0;
  uint64_t v8 = +[NSString stringWithCString:a2 encoding:4];
  os_log_type_t v9 = [+[NSURL fileURLWithPath:v8] URLByDeletingLastPathComponent];
  if ((a3 & 2) != 0)
  {
    uint32_t v10 = v9;
    NSFileAttributeKey v31 = NSFilePosixPermissions;
    uint64_t v32 = &off_10005BBA0;
    if (![(NSFileManager *)v6 createDirectoryAtURL:v9 withIntermediateDirectories:1 attributes:+[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1] error:&v26])
    {
      unint64_t v14 = (unint64_t)[v26 code];
      int v15 = *__error();
      if (qword_10005E3E0 != -1) {
        dispatch_once(&qword_10005E3E0, &stru_100059380);
      }
      uint64_t v21 = qword_10005E3E8;
      if (!os_log_type_enabled((os_log_t)qword_10005E3E8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_34;
      }
      v22 = [(NSString *)[(NSURL *)v10 path] UTF8String];
      *(_DWORD *)buf = 136315394;
      id v28 = v22;
      __int16 v29 = 1024;
      int v30 = v14;
      uint64_t v17 = "failed to create dir at %s: %{darwin.errno}d";
      CFErrorRef v23 = v21;
      uint32_t v24 = 18;
      goto LABEL_33;
    }
  }
  if ((a3 & 4) != 0)
  {
    if ((faccessat(-2, a2, 4, 32) & 0x80000000) == 0) {
      *__error() = 0;
    }
    int v11 = *__error();
    if (v11 != 2)
    {
      if (v11)
      {
        unint64_t v14 = *__error();
        int v15 = *__error();
        if (qword_10005E3E0 != -1) {
          dispatch_once(&qword_10005E3E0, &stru_100059380);
        }
        uint64_t v16 = qword_10005E3E8;
        if (!os_log_type_enabled((os_log_t)qword_10005E3E8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = v14;
        uint64_t v17 = "failed to access symlink: %{darwin.errno}d";
LABEL_32:
        CFErrorRef v23 = v16;
        uint32_t v24 = 8;
LABEL_33:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v17, buf, v24);
LABEL_34:
        *__error() = v15;
        return v14;
      }
      int v12 = *__error();
      if (qword_10005E3E0 != -1) {
        dispatch_once(&qword_10005E3E0, &stru_100059380);
      }
      pid_t v13 = qword_10005E3E8;
      if (os_log_type_enabled((os_log_t)qword_10005E3E8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "symlink exists, removing", buf, 2u);
      }
      *__error() = v12;
      if (unlink(a2))
      {
        unint64_t v14 = *__error();
        int v15 = *__error();
        if (qword_10005E3E0 != -1) {
          dispatch_once(&qword_10005E3E0, &stru_100059380);
        }
        uint64_t v16 = qword_10005E3E8;
        if (!os_log_type_enabled((os_log_t)qword_10005E3E8, OS_LOG_TYPE_ERROR)) {
          goto LABEL_34;
        }
        *(_DWORD *)buf = 67109120;
        LODWORD(v28) = v14;
        uint64_t v17 = "failed to unlink symlink: %{darwin.errno}d";
        goto LABEL_32;
      }
    }
  }
  if (![(NSFileManager *)v6 createSymbolicLinkAtPath:v8 withDestinationPath:v7 error:&v26])
  {
    id v18 = [v26 code];
    int v15 = *__error();
    if (qword_10005E3E0 != -1) {
      dispatch_once(&qword_10005E3E0, &stru_100059380);
    }
    CFErrorRef v19 = qword_10005E3E8;
    if (os_log_type_enabled((os_log_t)qword_10005E3E8, OS_LOG_TYPE_ERROR))
    {
      v20 = [(NSString *)v7 UTF8String];
      *(_DWORD *)buf = 136315394;
      id v28 = v20;
      __int16 v29 = 1024;
      int v30 = (int)v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "failed to create symlink to %s: %{darwin.errno}d", buf, 0x12u);
    }
    unint64_t v14 = (unint64_t)v18;
    goto LABEL_34;
  }
  return 0;
}

unint64_t sub_100007E04(uint64_t a1, uint64_t a2, const char *a3, char a4)
{
  bzero(v15, 0x400uLL);
  bzero(__str, 0x400uLL);
  uint64_t v7 = realpath_np();
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = *__error();
    if (qword_10005E3E0 != -1) {
      dispatch_once(&qword_10005E3E0, &stru_100059380);
    }
    uint32_t v10 = qword_10005E3E8;
    if (os_log_type_enabled((os_log_t)qword_10005E3E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "realpath_np: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v9;
  }
  else
  {
    snprintf(__str, 0x400uLL, "%s/%s", v15, a3);
    return sub_1000079CC(a1, __str, a4);
  }
  return v8;
}

void sub_100007F5C(id a1)
{
  qword_10005E3E8 = (uint64_t)os_log_create("com.apple.libcryptex", "fs");
}

uint64_t sub_100007F8C(void *a1)
{
  if (&_wd_optin_service_register_sync
    && wd_optin_service_launchd_job_label
    && wd_optin_service_process_name
    && wd_optin_service_bundle_id
    && wd_optin_service_bootstrap_service_name
    && wd_optin_service_late_first_checkin
    && wd_optin_service_panic_on_first_timeout
    && wd_optin_service_capture_ddt_on_timeout)
  {
    if (!a1) {
      return 1;
    }
    CFErrorRef v2 = 0;
    goto LABEL_17;
  }
  uint64_t v3 = sub_100008198();

  if (v3)
  {
    id v4 = sub_100008198();
    os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
    int v5 = (char *)_os_log_send_and_compose_impl();
  }
  else
  {
    int v5 = (char *)_os_log_send_and_compose_impl();
  }
  CFErrorRef v2 = sub_10000BF78("watchdog_available", "watchdog.m", 173, "com.apple.security.cryptex", 10, 0, v5);
  free(v5);
  if (a1)
  {
    if (v2)
    {
      CFTypeRef v6 = CFRetain(v2);
LABEL_18:
      *a1 = v6;
      goto LABEL_19;
    }
LABEL_17:
    CFTypeRef v6 = 0;
    goto LABEL_18;
  }
LABEL_19:
  if (v2)
  {
    CFRelease(v2);
    return 0;
  }
  return 1;
}

void sub_100008170(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

id sub_100008198()
{
  if (qword_10005E3F8 != -1) {
    dispatch_once(&qword_10005E3F8, &stru_1000593C8);
  }
  uint64_t v0 = (void *)qword_10005E3F0;

  return v0;
}

id sub_1000081EC(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v43 = 0;
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000;
  v40 = sub_1000088C8;
  pid_t v41 = sub_1000088D8;
  id v42 = 0;
  id v4 = objc_opt_new();
  if ((sub_100007F8C(&v43) & 1) == 0)
  {
    id v8 = 0;
    int v9 = v38[5];
    v38[5] = v43;
LABEL_33:

    goto LABEL_34;
  }
  id v5 = v3;
  CFTypeRef v6 = v5;
  if (v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  if (v7)
  {
    uint32_t v10 = xpc_dictionary_get_value(v6, "Watchdog");
    int v11 = v10;
    if (!v10
      || ((id v12 = v10, xpc_get_type(v12) == (xpc_type_t)&_xpc_type_array)
        ? (id v13 = v12)
        : (id v13 = 0),
          v12,
          v13,
          v13))
    {
      id v17 = v11;

      CFErrorRef v18 = 0;
      goto LABEL_23;
    }
    CFErrorRef v19 = sub_100008198();

    if (v19)
    {
      v20 = sub_100008198();
      os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      uint64_t v21 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      uint64_t v21 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v18 = sub_10000BF78("_watchdog_copy_watchdog_array", "watchdog.m", 152, "com.apple.security.cryptex", 11, 0, v21);
    free(v21);
  }
  else
  {
    unint64_t v14 = sub_100008198();

    if (v14)
    {
      int v15 = sub_100008198();
      os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      uint64_t v16 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      uint64_t v16 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v18 = sub_10000BF78("_watchdog_copy_watchdog_array", "watchdog.m", 147, "com.apple.security.cryptex", 11, 0, v16);
    free(v16);
  }
  id v17 = 0;
LABEL_23:

  id v8 = v17;
  v22 = (void *)v38[5];
  v38[5] = (uint64_t)v18;

  if (v38[5])
  {
    CFErrorRef v23 = sub_100008198();

    if (v23)
    {
      uint32_t v24 = sub_100008198();
      os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      uint64_t v25 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      uint64_t v25 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v29 = sub_10000BF78("watchdog_create_service_descriptions", "watchdog.m", 200, "com.apple.security.cryptex", 11, (const void *)v38[5], v25);
LABEL_32:
    CFErrorRef v30 = v29;
    free(v25);
    int v9 = v38[5];
    v38[5] = (uint64_t)v30;
    goto LABEL_33;
  }
  if (!v8)
  {
    v38[5] = 0;
    int v9 = sub_100008198();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "No jobs to register with watchdog.", buf, 2u);
      id v8 = 0;
    }
    goto LABEL_33;
  }
  applier[0] = _NSConcreteStackBlock;
  applier[1] = 3221225472;
  applier[2] = sub_1000088E0;
  applier[3] = &unk_1000593A8;
  uint64_t v36 = &v37;
  id v35 = v4;
  BOOL v26 = xpc_array_apply(v8, applier);

  if (!v26)
  {
    pid_t v27 = sub_100008198();

    if (v27)
    {
      id v28 = sub_100008198();
      os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      uint64_t v25 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      uint64_t v25 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v29 = sub_10000BF78("watchdog_create_service_descriptions", "watchdog.m", 227, "com.apple.security.cryptex", 11, (const void *)v38[5], v25);
    goto LABEL_32;
  }
LABEL_34:
  NSFileAttributeKey v31 = v38;
  if (a2 && !v38[5])
  {
    *a2 = [v4 copy];
    NSFileAttributeKey v31 = v38;
  }
  id v32 = (id)v31[5];

  _Block_object_dispose(&v37, 8);
  return v32;
}

void sub_10000888C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  free(v18);
  _Block_object_dispose(&a18, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000088C8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000088D8(uint64_t a1)
{
}

uint64_t sub_1000088E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v57 = 0;
  __int16 v58 = 0;
  v55 = 0;
  v56 = 0;
  v54 = 0;
  __int16 v53 = 0;
  BOOL v52 = 0;
  if ((sub_100007F8C(&v58) & 1) == 0)
  {
    id v9 = 0;
    CFErrorRef v10 = v58;
    goto LABEL_46;
  }
  id v6 = v5;
  id v7 = v6;
  if (v6 && xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  if (!v8)
  {
    int v15 = sub_100008198();

    if (v15)
    {
      uint64_t v16 = sub_100008198();
      os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      *(_WORD *)buf = 0;
      unint64_t v14 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_WORD *)buf = 0;
      unint64_t v14 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v20 = sub_10000BF78("_watchdog_create_service_description", "watchdog.m", 51, "com.apple.security.cryptex", 11, 0, v14);
    goto LABEL_45;
  }
  int v11 = sub_1000403E4(v7, "Label", &v57);
  if (v11)
  {
    id v12 = sub_100008198();

    if (v12)
    {
      id v13 = sub_100008198();
      os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "Label";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      unint64_t v14 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "Label";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v11;
      unint64_t v14 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v20 = sub_10000BF78("_watchdog_create_service_description", "watchdog.m", 57, "com.apple.security.cryptex.posix", v11, 0, v14);
LABEL_45:
    CFErrorRef v10 = v20;
    free(v14);
    id v9 = 0;
    goto LABEL_46;
  }
  int v17 = sub_1000403E4(v7, "ProcessName", &v56);
  if (v17)
  {
    CFErrorRef v18 = sub_100008198();

    if (v18)
    {
      CFErrorRef v19 = sub_100008198();
      os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "ProcessName";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v17;
      unint64_t v14 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "ProcessName";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v17;
      unint64_t v14 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v20 = sub_10000BF78("_watchdog_create_service_description", "watchdog.m", 63, "com.apple.security.cryptex.posix", v17, 0, v14);
    goto LABEL_45;
  }
  int v21 = sub_1000403E4(v7, "CFBundleIdentifier", &v55);
  if (v21)
  {
    v22 = sub_100008198();

    if (v22)
    {
      CFErrorRef v23 = sub_100008198();
      os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "CFBundleIdentifier";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v21;
      unint64_t v14 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "CFBundleIdentifier";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v21;
      unint64_t v14 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v20 = sub_10000BF78("_watchdog_create_service_description", "watchdog.m", 69, "com.apple.security.cryptex.posix", v21, 0, v14);
    goto LABEL_45;
  }
  int v24 = sub_1000403E4(v7, "WatchdogMachService", &v54);
  if (v24)
  {
    uint64_t v25 = sub_100008198();

    if (v25)
    {
      BOOL v26 = sub_100008198();
      os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "WatchdogMachService";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v24;
      unint64_t v14 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "WatchdogMachService";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v24;
      unint64_t v14 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v20 = sub_10000BF78("_watchdog_create_service_description", "watchdog.m", 75, "com.apple.security.cryptex.posix", v24, 0, v14);
    goto LABEL_45;
  }
  if (sub_100040448(v7, "LateFirstCheckin", (BOOL *)&v53 + 1))
  {
    HIBYTE(v53) = 0;
    int v27 = *__error();
    id v28 = sub_100008198();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "LateFirstCheckin";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = HIBYTE(v53);
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "%{public}s defaulted to %d", buf, 0x12u);
    }

    *__error() = v27;
  }
  if (sub_100040448(v7, "PanicOnFirstTimeout", &v52))
  {
    BOOL v52 = 0;
    int v29 = *__error();
    CFErrorRef v30 = sub_100008198();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "PanicOnFirstTimeout";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v52;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%{public}s defaulted to %d", buf, 0x12u);
    }

    *__error() = v29;
  }
  if (sub_100040448(v7, "CaptureDdtOnTimeout", (BOOL *)&v53))
  {
    LOBYTE(v53) = 0;
    int v31 = *__error();
    id v32 = sub_100008198();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "CaptureDdtOnTimeout";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v53;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%{public}s defaulted to %d", buf, 0x12u);
    }

    *__error() = v31;
  }
  v59[0] = wd_optin_service_launchd_job_label;
  v51 = +[NSString stringWithUTF8String:v57];
  *(void *)buf = v51;
  v59[1] = wd_optin_service_process_name;
  v50 = +[NSString stringWithUTF8String:v56];
  *(void *)&buf[8] = v50;
  v59[2] = wd_optin_service_bundle_id;
  v33 = +[NSString stringWithUTF8String:v55];
  *(void *)&uint8_t buf[16] = v33;
  v59[3] = wd_optin_service_bootstrap_service_name;
  char v34 = +[NSString stringWithUTF8String:v54];
  CFErrorRef v61 = v34;
  v59[4] = wd_optin_service_late_first_checkin;
  id v35 = +[NSNumber numberWithBool:HIBYTE(v53)];
  v62 = v35;
  v59[5] = wd_optin_service_panic_on_first_timeout;
  uint64_t v36 = +[NSNumber numberWithBool:v52];
  long long v63 = v36;
  v59[6] = wd_optin_service_capture_ddt_on_timeout;
  uint64_t v37 = +[NSNumber numberWithBool:v53];
  v64 = v37;
  id v38 = +[NSDictionary dictionaryWithObjects:buf forKeys:v59 count:7];
  id v9 = [v38 copy];

  CFErrorRef v10 = 0;
LABEL_46:

  id v39 = v9;
  v40 = v39;
  if (v10) {
    BOOL v41 = 1;
  }
  else {
    BOOL v41 = v39 == 0;
  }
  uint64_t v42 = !v41;
  if (v41)
  {
    uint64_t v43 = sub_100008198();

    if (v43)
    {
      v44 = sub_100008198();
      os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a2;
      v45 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = a2;
      v45 = (char *)_os_log_send_and_compose_impl();
    }
    CFErrorRef v46 = sub_10000BF78("watchdog_create_service_descriptions_block_invoke", "watchdog.m", 216, "com.apple.security.cryptex", 11, v10, v45);
    free(v45);
    uint64_t v47 = *(void *)(*(void *)(a1 + 40) + 8);
    v48 = *(void **)(v47 + 40);
    *(void *)(v47 + 40) = v46;
  }
  else
  {
    [*(id *)(a1 + 32) addObject:v39];
  }

  return v42;
}

void sub_1000094A0(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

id sub_1000094D8(void *a1)
{
  CFErrorRef v2 = objc_opt_new();
  int v3 = sub_100007F8C(0);
  if (a1 && v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v4 = a1;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * (void)v8) objectForKeyedSubscript:wd_optin_service_launchd_job_label];
          [v2 addObject:v9];

          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
  id v10 = [v2 copy:v12];

  return v10;
}

CFErrorRef sub_100009624(void *a1)
{
  CFErrorRef v19 = 0;
  id v1 = a1;
  if (!sub_100007F8C(&v19))
  {
    CFErrorRef v12 = v19;
    goto LABEL_28;
  }
  if (![v1 count])
  {
LABEL_22:
    CFErrorRef v12 = 0;
    goto LABEL_28;
  }
  CFErrorRef v2 = 0;
  while (1)
  {
    [v1 objectAtIndexedSubscript:v2];
    int v3 = (char *)(id)objc_claimAutoreleasedReturnValue();
    CFErrorRef v20 = 0;
    if (sub_100007F8C(&v20))
    {
      if (wd_optin_service_register_sync())
      {
        id v4 = sub_100008198();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v22 = v3;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Registered job with watchdog: %{public}@", buf, 0xCu);
        }

        goto LABEL_21;
      }
      CFIndex v6 = *__error();
      uint64_t v7 = sub_100008198();

      if (v6 == 45)
      {
        if (v7)
        {
          id v8 = sub_100008198();
          os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
          *(_WORD *)buf = 0;
          LODWORD(v18) = 2;
          int v17 = buf;
          id v9 = (char *)_os_log_send_and_compose_impl();
        }
        else
        {
          *(_WORD *)buf = 0;
          LODWORD(v18) = 2;
          int v17 = buf;
          id v9 = (char *)_os_log_send_and_compose_impl();
        }
        CFErrorRef v11 = sub_10000BF78("_watchdog_bootstrap_service", "watchdog.m", 129, "com.apple.security.cryptex", 10, 0, v9);
      }
      else
      {
        if (v7)
        {
          id v10 = sub_100008198();
          os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
          *(_DWORD *)buf = 138543618;
          v22 = v3;
          __int16 v23 = 1024;
          int v24 = v6;
          LODWORD(v18) = 18;
          int v17 = buf;
          id v9 = (char *)_os_log_send_and_compose_impl();
        }
        else
        {
          *(_DWORD *)buf = 138543618;
          v22 = v3;
          __int16 v23 = 1024;
          int v24 = v6;
          LODWORD(v18) = 18;
          int v17 = buf;
          id v9 = (char *)_os_log_send_and_compose_impl();
        }
        CFErrorRef v11 = sub_10000BF78("_watchdog_bootstrap_service", "watchdog.m", 131, "com.apple.security.cryptex.posix", v6, 0, v9);
      }
      CFErrorRef v5 = v11;
      free(v9);
    }
    else
    {
      CFErrorRef v5 = v20;
    }

    if (v5) {
      break;
    }
LABEL_21:

    if (++v2 >= [v1 count]) {
      goto LABEL_22;
    }
  }
  long long v13 = sub_100008198();

  if (v13)
  {
    long long v14 = sub_100008198();
    os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 134217984;
    v22 = v2;
    long long v15 = (char *)_os_log_send_and_compose_impl();
  }
  else
  {
    *(_DWORD *)buf = 134217984;
    v22 = v2;
    long long v15 = (char *)_os_log_send_and_compose_impl();
  }
  CFErrorRef v12 = sub_10000BF78("watchdog_bootstrap_service_descriptions", "watchdog.m", 275, "com.apple.security.cryptex", 33, v5, v15);
  free(v15);

LABEL_28:
  return v12;
}

void sub_100009ABC(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

void sub_100009AE8(id a1)
{
  qword_10005E3F0 = (uint64_t)os_log_create("com.apple.libcryptex", "watchdog");

  _objc_release_x1();
}

void sub_100009B2C(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 80));
  free(*(void **)(a1 + 96));
  free(*(void **)(a1 + 104));
  free(*(void **)(a1 + 112));
  close_drop_np();
  close_drop_np();
  CFErrorRef v2 = *(void **)(a1 + 272);
  if (v2) {
    os_release(v2);
  }
  int v3 = *(void **)(a1 + 280);
  if (v3) {
    os_release(v3);
  }
  os_release(*(void **)(a1 + 304));
  sub_10003DE34(a1 + 16);
}

int *sub_100009BB8()
{
  uint64_t v0 = sub_10000A498();
  bzero(buf, 0x400uLL);
  bufsize[0] = 1024;
  int v1 = *_NSGetArgc();
  CFErrorRef v2 = *_NSGetArgv();
  v59[0] = 0;
  if (_NSGetExecutablePath(buf, bufsize)) {
    sub_100041550(&v61, v66);
  }
  v0[6] = getprogname();
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      int v3 = strdup(buf);
      if (v3) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    int v3 = strdup(buf);
    if (!v3) {
      sub_1000411A0(buf);
    }
  }
  v0[12] = v3;
  v0[36] = *_NSGetEnviron();
  for (int i = getopt_long(v1, v2, "r", (const option *)&off_1000593E8, v59);
        i != -1;
        int i = getopt_long(v1, v2, "r", (const option *)&off_1000593E8, v59))
  {
    if (optind <= 0) {
      sub_1000414B8(&v61, v66);
    }
    switch(i)
    {
      case ':':
        uint64_t v9 = v59[0];
        id v10 = (const char *)v0[2];
        int v11 = *__error();
        CFErrorRef v12 = v0[4];
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          long long v13 = (&off_1000593E8)[4 * v9];
          *(_DWORD *)v66 = 136446466;
          long long v14 = "[anonymous]";
          if (v10) {
            long long v14 = v10;
          }
          *(void *)&v66[4] = v14;
          *(_WORD *)&v66[12] = 2080;
          *(void *)&v66[14] = v13;
          long long v15 = v12;
          uint64_t v16 = "%{public}s: missing argument for option: %s";
          goto LABEL_24;
        }
        break;
      case '?':
        int v17 = v2[optind - 1];
        uint64_t v18 = (const char *)v0[2];
        int v11 = *__error();
        CFErrorRef v19 = v0[4];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v66 = 136446466;
          CFErrorRef v20 = "[anonymous]";
          if (v18) {
            CFErrorRef v20 = v18;
          }
          *(void *)&v66[4] = v20;
          *(_WORD *)&v66[12] = 2080;
          *(void *)&v66[14] = v17;
          long long v15 = v19;
          uint64_t v16 = "%{public}s: unknown option: %s";
LABEL_24:
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v16, v66, 0x16u);
        }
        break;
      case 'r':
        CFErrorRef v5 = (const char *)v0[2];
        int v6 = *__error();
        uint64_t v7 = v0[4];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          id v8 = "[anonymous]";
          if (v5) {
            id v8 = v5;
          }
          *(_DWORD *)v66 = 136446210;
          *(void *)&v66[4] = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: other side of exec", v66, 0xCu);
        }
        *__error() = v6;
        v0[5] |= 2uLL;
        continue;
      default:
        sub_100041534();
    }
    *__error() = v11;
  }
  bzero(buf, 0x400uLL);
  int v21 = open("/var/db/", 1048832);
  if (v21 < 0) {
    sub_100041430(&v61, v66);
  }
  int v22 = v21;
  int v23 = open("/var/run/", 1048832);
  if (v23 < 0) {
    sub_1000413A8(&v61, v66);
  }
  int v24 = v23;
  *((_DWORD *)v0 + 22) = sub_10000A880((uint64_t)v0, v22);
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t v25 = strdup(buf);
      if (v25) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t v25 = strdup(buf);
    if (!v25) {
      sub_1000411A0(buf);
    }
  }
  v0[13] = v25;
  *((_DWORD *)v0 + 23) = sub_10000A880((uint64_t)v0, v24);
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      BOOL v26 = strdup(buf);
      if (v26) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    BOOL v26 = strdup(buf);
    if (!v26) {
      sub_1000411A0(buf);
    }
  }
  v0[14] = v26;
  if (v24 != -1 && close(v24) == -1) {
    sub_10004132C(v66, buf);
  }
  if (v22 != -1 && close(v22) == -1) {
    sub_10004132C(v66, buf);
  }
  img4_chip_select_personalized_ap();
  if (img4_chip_instantiate()) {
    sub_1000412B0(v66, buf);
  }
  *(void *)pid_t v59 = 0;
  *(void *)bufsize = 0;
  if (sub_100028A78(bufsize, v59, v0[4])) {
    sub_100041234(v66, buf);
  }
  int v27 = (const char *)v0[2];
  int v28 = *__error();
  int v29 = v0[4];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    CFErrorRef v30 = "[anonymous]";
    if (v27) {
      CFErrorRef v30 = v27;
    }
    *(_DWORD *)buf = 136446466;
    long long v63 = v30;
    __int16 v64 = 2048;
    v65 = *(const char **)v59;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "%{public}s: copied %lu mounts", (uint8_t *)buf, 0x16u);
  }
  *__error() = v28;
  if (*(void *)v59)
  {
    unint64_t v31 = 0;
    do
    {
      id v32 = (const char *)(*(void *)bufsize + 3582 * v31);
      memset(v66, 0, 32);
      v33 = (const char *)v0[2];
      int v34 = *__error();
      id v35 = v0[4];
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446466;
        uint64_t v36 = "[anonymous]";
        if (v33) {
          uint64_t v36 = v33;
        }
        long long v63 = v36;
        __int16 v64 = 2080;
        v65 = v32;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "%{public}s: potential forerunner: %s", (uint8_t *)buf, 0x16u);
      }
      *__error() = v34;
      if (_dispatch_is_multithreaded())
      {
        uint64_t v37 = strdup(v32);
        if (!v37)
        {
          do
          {
            __os_temporary_resource_shortage();
            id v38 = strdup(v32);
          }
          while (!v38);
          uint64_t v37 = v38;
        }
      }
      else
      {
        uint64_t v37 = strdup(v32);
        if (!v37) {
          sub_1000411A0(v32);
        }
      }
      int v39 = cryptex_core_parse_hdiid();
      v40 = (const char *)v0[2];
      int v41 = *__error();
      uint64_t v42 = v0[4];
      BOOL v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG);
      if (v39)
      {
        if (v43)
        {
          *(_DWORD *)buf = 136446466;
          v44 = "[anonymous]";
          if (v40) {
            v44 = v40;
          }
          long long v63 = v44;
          __int16 v64 = 2080;
          v65 = v32;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%{public}s: not a forerunner: %s", (uint8_t *)buf, 0x16u);
        }
        *__error() = v41;
      }
      else
      {
        if (v43)
        {
          *(_DWORD *)buf = 136446466;
          v45 = "[anonymous]";
          if (v40) {
            v45 = v40;
          }
          long long v63 = v45;
          __int16 v64 = 2080;
          v65 = v32;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "%{public}s: found forerunner: %s", (uint8_t *)buf, 0x16u);
        }
        *__error() = v41;
        CFErrorRef v46 = malloc_type_calloc(1uLL, 0xD98uLL, 0x61D5536CuLL);
        if (!v46) {
          sub_1000410D8(&v61, buf);
        }
        uint64_t v47 = v46;
        __strlcpy_chk();
        __strlcpy_chk();
        __strlcpy_chk();
        __strlcpy_chk();
        __strlcpy_chk();
        sub_10003DE84(v47 + 3335, v47 + 3383);
        *(void *)uint64_t v47 = v0[37];
        v0[37] = v47;
      }
      free(v37);
      ++v31;
    }
    while (v31 < *(void *)v59);
  }
  free(*(void **)bufsize);
  v48 = (const char *)v0[2];
  int v49 = *__error();
  v50 = v0[4];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
  {
    v51 = "[anonymous]";
    if (v48) {
      v51 = v48;
    }
    BOOL v52 = (const char *)v0[13];
    *(_DWORD *)buf = 136446466;
    long long v63 = v51;
    __int16 v64 = 2080;
    v65 = v52;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "%{public}s: state dir = %s", (uint8_t *)buf, 0x16u);
  }
  *__error() = v49;
  __int16 v53 = (const char *)v0[2];
  int v54 = *__error();
  v55 = v0[4];
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    v56 = "[anonymous]";
    if (v53) {
      v56 = v53;
    }
    v57 = (const char *)v0[14];
    *(_DWORD *)buf = 136446466;
    long long v63 = v56;
    __int16 v64 = 2080;
    v65 = v57;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "%{public}s: run state dir = %s", (uint8_t *)buf, 0x16u);
  }
  result = __error();
  int *result = v54;
  qword_10005E400 = (uint64_t)v0;
  return result;
}

void *sub_10000A498()
{
  if (_dispatch_is_multithreaded()) {
    sub_1000415D0();
  }
  uint64_t v0 = (void *)sub_100012ED8();
  v0[7] = off_10005E3B0;
  v0[8] = "com.apple.security.cryptexd";
  v0[9] = "com.apple.security.cryptexd";
  v0[10] = os_retain(*(void **)(off_10005E3A0 + 8));
  v0[38] = os_log_create("com.apple.libcryptex", "authinstall");
  v0[11] = -1;
  v0[41] = os_transaction_create();
  sub_10003DB40((uint64_t)(v0 + 2), (int)"com.apple.security.cryptexd", "daemon");
  return v0;
}

void *sub_10000A548()
{
  return os_retain((void *)qword_10005E400);
}

void sub_10000A554()
{
}

uint64_t sub_10000A564()
{
  return *(void *)(off_10005E3A0 + 8);
}

uint64_t sub_10000A578(uint64_t a1)
{
  return *(void *)(a1 + 312);
}

uint64_t sub_10000A580(uint64_t a1)
{
  if ((*(unsigned char *)off_10005E3A0 & 1) == 0) {
    sub_1000415EC();
  }
  AMAuthInstallLogSetHandler();
  id v2 = sub_100016A9C();
  [v2 activate];
  int v3 = *(const char **)(a1 + 16);
  int v4 = *__error();
  CFErrorRef v5 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = "[anonymous]";
    if (v3) {
      int v6 = v3;
    }
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}s: Activated event server", (uint8_t *)&buf, 0xCu);
  }
  *__error() = v4;
  if (v2) {
    os_release(v2);
  }
  if (signal(15, (void (__cdecl *)(int))1) == (void (__cdecl *)(int))-1) {
    sub_100041608(&v13, &buf);
  }
  uint64_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, *(dispatch_queue_t *)(a1 + 80));
  dispatch_set_context(v7, (void *)a1);
  dispatch_source_set_event_handler_f(v7, (dispatch_function_t)sub_10000AA24);
  *(void *)(a1 + 280) = v7;
  dispatch_activate(v7);
  mach_port_t sp = 0;
  if (bootstrap_check_in(bootstrap_port, *(const char **)(a1 + 72), &sp)) {
    sub_100041684(&v13, &buf);
  }
  uintptr_t v8 = sp;
  *(_DWORD *)(a1 + 120) = sp;
  uint64_t v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_mach_recv, v8, 0, *(dispatch_queue_t *)(a1 + 80));
  dispatch_set_context(v9, (void *)a1);
  dispatch_source_set_event_handler_f(v9, (dispatch_function_t)sub_10000AB3C);
  dispatch_source_set_cancel_handler_f(v9, (dispatch_function_t)sub_10000AC1C);
  *(void *)(a1 + 272) = v9;
  dispatch_activate(v9);
  id v10 = dispatch_queue_create("DaemonHandler", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  *(void *)(a1 + 312) = v10;
  mach_service = xpc_connection_create_mach_service("com.apple.security.cryptex.xpc", v10, 1uLL);
  *(void *)(a1 + 320) = mach_service;
  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 0x40000000;
  uint64_t v16 = sub_10000AC50;
  int v17 = &unk_100059428;
  uint64_t v18 = a1;
  xpc_connection_set_event_handler(mach_service, &buf);
  xpc_connection_activate(*(xpc_connection_t *)(a1 + 320));
  *(void *)(a1 + 336) = xpc_remote_connection_create_remote_service_listener();
  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 0x40000000;
  uint64_t v16 = sub_10000AEDC;
  int v17 = &unk_100059468;
  uint64_t v18 = a1;
  xpc_remote_connection_set_event_handler();
  return xpc_remote_connection_activate();
}

uint64_t sub_10000A880(uint64_t a1, int a2)
{
  if ((mkdirat(a2, *(const char **)(a1 + 64), 0x1C5u) & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v4 = *__error();
  if (v4) {
    BOOL v5 = v4 == 17;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    sub_100041700(&v9, v10);
  }
  uint64_t v6 = openat(a2, *(const char **)(a1 + 64), 1048832);
  if ((v6 & 0x80000000) != 0) {
    sub_1000417F8(&v9, v10);
  }
  uint64_t v7 = v6;
  if (realpath_np()) {
    sub_10004177C(&v9, v10);
  }
  return v7;
}

void sub_10000A968(uint64_t a1, uint64_t a2)
{
  int v3 = os_retain((void *)qword_10005E400);
  int v4 = v3[38];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    uint64_t v6 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }
  os_release(v3);
}

void sub_10000AA24(uint64_t a1)
{
  id v2 = sub_100016EB4();
  int v3 = *(const char **)(a1 + 16);
  int v4 = *__error();
  int v5 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = "[anonymous]";
    if (v3) {
      uint64_t v6 = v3;
    }
    int v7 = 136446210;
    uintptr_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s: received SIGTERM", (uint8_t *)&v7, 0xCu);
  }
  *__error() = v4;
  sub_100019EC0(v2, 0, (uint64_t)j__xpc_transaction_exit_clean);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 280));
  dispatch_release(*(dispatch_object_t *)(a1 + 280));
  *(void *)(a1 + 280) = 0;
  if (v2) {
    os_release(v2);
  }
}

void sub_10000AB3C(uint64_t a1)
{
  id v2 = *(const char **)(a1 + 16);
  int v3 = *__error();
  int v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = "[anonymous]";
    int v6 = *(_DWORD *)(a1 + 120);
    if (v2) {
      int v5 = v2;
    }
    int v7 = 136446466;
    uintptr_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}s: ipc recv: port = %#x", (uint8_t *)&v7, 0x12u);
  }
  *__error() = v3;
  sub_10002C590();
}

uint64_t sub_10000AC1C(NSObject *a1)
{
  uint64_t handle = dispatch_source_get_handle(a1);

  return _mach_right_recv_destruct(handle, 0, 0);
}

void sub_10000AC50(uint64_t a1, _xpc_connection_s *object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
    *(void *)int v10 = _NSConcreteStackBlock;
    *(void *)&v10[8] = 0x40000000;
    *(void *)&v10[16] = sub_10000ADC4;
    int v11 = &unk_100059448;
    uint64_t v12 = v9;
    xpc_connection_set_event_handler(object, v10);
    xpc_connection_activate(object);
  }
  else
  {
    int v4 = xpc_copy_description(object);
    int v5 = *(const char **)(*(void *)(a1 + 32) + 16);
    int v6 = *__error();
    int v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uintptr_t v8 = "[anonymous]";
      if (v5) {
        uintptr_t v8 = v5;
      }
      *(_DWORD *)int v10 = 136446466;
      *(void *)&v10[4] = v8;
      *(_WORD *)&v10[12] = 2080;
      *(void *)&v10[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s: Received unexpected object: %s", v10, 0x16u);
    }
    *__error() = v6;
    free(v4);
  }
}

void sub_10000ADC4(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    int v5 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100041874(object, v5);
    }
  }
  else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v4 = sub_10002D1C8(object);
    switch(v4)
    {
      case 9:
        sub_100029858(object);
        break;
      case 6:
        sub_10003AC44(object);
        break;
      case 2:
        sub_100012CF0(object);
        break;
      default:
        int v6 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_10004190C(v6);
        }
        break;
    }
  }
}

void sub_10000AEDC(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_remote_connection)
  {
    sub_100021A28(object);
  }
  else
  {
    uint64_t v4 = xpc_copy_description(object);
    int v5 = *(const char **)(*(void *)(a1 + 32) + 16);
    int v6 = *__error();
    int v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uintptr_t v8 = "[anonymous]";
      if (v5) {
        uintptr_t v8 = v5;
      }
      int v9 = 136446466;
      int v10 = v8;
      __int16 v11 = 2080;
      uint64_t v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s: Received unexpected object: %s", (uint8_t *)&v9, 0x16u);
    }
    *__error() = v6;
    free(v4);
  }
}

uint64_t sub_10000B028()
{
  return _os_log_send_and_compose_impl();
}

uint64_t sub_10000B050()
{
  return _os_log_send_and_compose_impl();
}

double sub_10000B070(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

BOOL sub_10000B0F0()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

BOOL sub_10000B108()
{
  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

double sub_10000B120()
{
  void *v0 = 0;
  double result = 0.0;
  *uint64_t v1 = 0u;
  v1[1] = 0u;
  v1[2] = 0u;
  v1[3] = 0u;
  v1[4] = 0u;
  return result;
}

uint64_t sub_10000B13C()
{
  return _os_crash_msg();
}

uint64_t sub_10000B154()
{
  return _os_crash_msg();
}

uint64_t sub_10000B16C()
{
  return _os_crash_msg();
}

size_t sub_10000B184(const char *__s)
{
  return strlen(__s);
}

CFErrorRef sub_10000B1C0(uint64_t a1, void *a2)
{
  if (a1)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_uint64(empty, "img4_chip_omit", *(void *)(a1 + 16));
    xpc_dictionary_set_uint64(empty, "img4_chip_cepo", *(unsigned int *)(a1 + 24));
    xpc_dictionary_set_uint64(empty, "img4_chip_bord", *(unsigned int *)(a1 + 28));
    xpc_dictionary_set_uint64(empty, "img4_chip_chip", *(unsigned int *)(a1 + 32));
    xpc_dictionary_set_uint64(empty, "img4_chip_sdom", *(unsigned int *)(a1 + 36));
    xpc_dictionary_set_uint64(empty, "img4_chip_ecid", *(void *)(a1 + 40));
    xpc_dictionary_set_uint64(empty, "img4_chip_cpro", *(unsigned __int8 *)(a1 + 48));
    xpc_dictionary_set_uint64(empty, "img4_chip_csec", *(unsigned __int8 *)(a1 + 49));
    xpc_dictionary_set_uint64(empty, "img4_chip_epro", *(unsigned __int8 *)(a1 + 50));
    xpc_dictionary_set_uint64(empty, "img4_chip_esec", *(unsigned __int8 *)(a1 + 51));
    xpc_dictionary_set_uint64(empty, "img4_chip_iuou", *(unsigned __int8 *)(a1 + 52));
    xpc_dictionary_set_uint64(empty, "img4_chip_rsch", *(unsigned __int8 *)(a1 + 53));
    xpc_dictionary_set_uint64(empty, "img4_chip_euou", *(unsigned __int8 *)(a1 + 54));
    xpc_dictionary_set_uint64(empty, "img4_chip_esdm", *(unsigned int *)(a1 + 56));
    xpc_dictionary_set_uint64(empty, "img4_chip_fpgt", *(unsigned __int8 *)(a1 + 60));
    xpc_dictionary_set_uint64(empty, "img4_chip_fchp", *(unsigned int *)(a1 + 128));
    xpc_dictionary_set_uint64(empty, "img4_chip_type", *(unsigned int *)(a1 + 132));
    xpc_dictionary_set_uint64(empty, "img4_chip_styp", *(unsigned int *)(a1 + 136));
    xpc_dictionary_set_uint64(empty, "img4_chip_clas", *(unsigned int *)(a1 + 140));
    if (a2)
    {
      xpc_object_t empty = empty;
      CFErrorRef v5 = 0;
      *a2 = empty;
    }
    else
    {
      CFErrorRef v5 = 0;
    }
  }
  else
  {
    int v6 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v5 = sub_10000BF78("img4_chip_instance_to_xpc", "img4_xpc.m", 35, "com.apple.security.cryptex", 11, 0, v6);
    free(v6);
    xpc_object_t empty = 0;
  }

  return v5;
}

void sub_10000B438(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

void sub_10000B44C(uint64_t a1)
{
  close_drop_np();

  sub_10003DE34(a1 + 16);
}

uint64_t sub_10000B48C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1000132AC();
  *(void *)(v5 + 40) = a3;
  *(void *)(v5 + 48) = a1;
  *(_DWORD *)(v5 + 56) = dup_np();
  sub_10003DB40(v5 + 16, (int)"com.apple.security.cryptexd", *(char **)(a1 + 8));
  return v5;
}

uint64_t sub_10000B4F0(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, void *, uint64_t), char a5)
{
  uint64_t v5 = *(void *)(a1 + 48);
  if (*(void *)(v5 + 16))
  {
    uint64_t v6 = a2;
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    int v10 = "%s/%s";
    __int16 v11 = ".";
    while (1)
    {
      uint64_t v12 = *(void *)(v5 + 8 * v8 + 24);
      bzero(__str, 0x400uLL);
      snprintf(__str, 0x400uLL, v10, v12, *(void *)(v6 + 16));
      uint64_t v13 = *(const char **)(a1 + 16);
      int v14 = *__error();
      long long v15 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136446466;
        uint64_t v16 = "[anonymous]";
        if (v13) {
          uint64_t v16 = v13;
        }
        BOOL v43 = v16;
        __int16 v44 = 2080;
        v45 = __str;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}s: opening subpath: %s", buf, 0x16u);
      }
      *__error() = v14;
      int v17 = openat(*(_DWORD *)(a1 + 56), __str, 0);
      if ((v17 & 0x80000000) == 0) {
        *__error() = 0;
      }
      int v18 = *__error();
      if (v18 != 2)
      {
        CFErrorRef v19 = v11;
        uint64_t v20 = v9;
        int v21 = v10;
        if (v18)
        {
          int v26 = *__error();
          int v27 = *(const char **)(a1 + 16);
          int v23 = *__error();
          int v28 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136446722;
            int v29 = "[anonymous]";
            if (v27) {
              int v29 = v27;
            }
            BOOL v43 = v29;
            __int16 v44 = 2080;
            v45 = __str;
            __int16 v46 = 1024;
            int v47 = v26;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}s: failed to open subpath: %s: %{darwin.errno}d", buf, 0x1Cu);
          }
          uint64_t v6 = a2;
        }
        else
        {
          int v22 = *(const char **)(a1 + 16);
          int v23 = *__error();
          int v24 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 136446466;
            uint64_t v25 = "[anonymous]";
            if (v22) {
              uint64_t v25 = v22;
            }
            BOOL v43 = v25;
            __int16 v44 = 2080;
            v45 = __str;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}s: opened subpath: %s", buf, 0x16u);
          }
        }
        *__error() = v23;
        int v10 = v21;
        uint64_t v9 = v20;
        __int16 v11 = v19;
      }
      if ((v17 & 0x80000000) == 0) {
        break;
      }
      if (v17 != -1)
      {
        LODWORD(v32) = 4;
        goto LABEL_39;
      }
LABEL_41:
      ++v8;
      uint64_t v5 = *(void *)(a1 + 48);
      if (v8 >= *(void *)(v5 + 16)) {
        return v9;
      }
    }
    if (a5)
    {
      id v35 = (void *)sub_10000B91C((void *)a1, v6, __str);
      a4(a1, v35, a3);
      if (v35) {
        os_release(v35);
      }
      LODWORD(v32) = 20;
LABEL_39:
      if (close(v17) == -1) {
        sub_100041A38(&v41, buf);
      }
    }
    else
    {
      CFErrorRef v30 = fdopendir(v17);
      if (!v30) {
        sub_100041950(&v41, buf);
      }
      unint64_t v31 = v30;
      while (1)
      {
        id v32 = readdir(v31);
        if (!v32) {
          break;
        }
        bzero(buf, 0x400uLL);
        d_name = v32->d_name;
        if (strcmp(d_name, v11) && strcmp(d_name, ".."))
        {
          snprintf((char *)buf, 0x400uLL, v10, __str, d_name);
          int v34 = (void *)sub_10000B91C((void *)a1, v6, (const char *)buf);
          uint64_t v9 = ((uint64_t (*)(uint64_t, void *, uint64_t))a4)(a1, v34, a3);
          if (v34) {
            os_release(v34);
          }
          if (v9)
          {
            LODWORD(v32) = 20;
            break;
          }
        }
      }
      if (closedir(v31) == -1) {
        sub_1000419C4(&v41, buf);
      }
    }
    if ((v32 | 4) != 4) {
      return v9;
    }
    goto LABEL_41;
  }
  return 0;
}

uint64_t sub_10000B91C(void *a1, uint64_t a2, const char *a3)
{
  uint64_t v6 = (const char *)a1[2];
  int v7 = *__error();
  unint64_t v8 = a1[4];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = "[anonymous]";
    if (v6) {
      uint64_t v9 = v6;
    }
    int v23 = 136446466;
    int v24 = v9;
    __int16 v25 = 2080;
    int v26 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s: resource: %s", (uint8_t *)&v23, 0x16u);
  }
  *__error() = v7;
  uint64_t v10 = sub_100029240(a2, a1, a3, 0);
  int v11 = sub_100029370(v10, 0);
  uint64_t v12 = (const char *)a1[2];
  int v13 = *__error();
  int v14 = a1[4];
  if (v11)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      long long v15 = "[anonymous]";
      int v23 = 136446722;
      if (v12) {
        long long v15 = v12;
      }
      int v24 = v15;
      __int16 v25 = 2080;
      int v26 = a3;
      __int16 v27 = 1024;
      LODWORD(v28) = v11;
      uint64_t v16 = "%{public}s: failed to open resource %s: %{darwin.errno}d";
      int v17 = v14;
      os_log_type_t v18 = OS_LOG_TYPE_ERROR;
      uint32_t v19 = 28;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v16, (uint8_t *)&v23, v19);
    }
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v20 = "[anonymous]";
    if (v12) {
      uint64_t v20 = v12;
    }
    int v21 = *(const char **)(a1[6] + 8);
    int v23 = 136446722;
    int v24 = v20;
    __int16 v25 = 2080;
    int v26 = v21;
    __int16 v27 = 2080;
    int v28 = a3;
    uint64_t v16 = "%{public}s: calling out with %s resource: %s";
    int v17 = v14;
    os_log_type_t v18 = OS_LOG_TYPE_DEBUG;
    uint32_t v19 = 32;
    goto LABEL_14;
  }
  *__error() = v13;
  return v10;
}

double sub_10000BB24(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

char *sub_10000BB44(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  if (MaximumSizeForEncoding <= -2) {
    sub_100041AAC();
  }
  CFIndex v4 = MaximumSizeForEncoding + 1;
  uint64_t v5 = (char *)malloc_type_calloc(1uLL, MaximumSizeForEncoding + 1, 0x7906B74DuLL);
  if (v5)
  {
    uint64_t v6 = v5;
    int CString = CFStringGetCString(a1, v5, v4, 0x8000100u);
    if (CString) {
      unint64_t v8 = v6;
    }
    else {
      unint64_t v8 = 0;
    }
    if (CString) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = v6;
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  free(v5);
  return v8;
}

CFNumberRef sub_10000BBDC(int a1)
{
  int valuePtr = a1;
  return CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
}

unint64_t sub_10000BC0C(const __CFNumber *a1)
{
  unint64_t valuePtr = -1;
  if (!CFNumberGetValue(a1, kCFNumberSInt64Type, &valuePtr)) {
    sub_100041AC8();
  }
  if (HIDWORD(valuePtr)) {
    sub_100041AE4(&v2, v4);
  }
  return valuePtr;
}

CFStringRef sub_10000BC8C(char *cStr)
{
  return CFStringCreateWithCString(0, cStr, 0x8000100u);
}

char *sub_10000BCA0(const __CFString *a1, char *a2, CFIndex a3)
{
  if (a3 < 0) {
    sub_100041B94();
  }
  if (CFStringGetCString(a1, a2, a3, 0x8000100u)) {
    return a2;
  }
  else {
    return 0;
  }
}

uint64_t sub_10000BCDC(uint64_t a1, CFURLRef *a2)
{
  bzero(cStr, 0x400uLL);
  uint64_t v3 = realpath_np();
  if (!v3)
  {
    CFStringRef v4 = CFStringCreateWithCString(0, cStr, 0x8000100u);
    if (!v4) {
      sub_100041BB0(&v8, v10);
    }
    CFStringRef v5 = v4;
    CFURLRef v6 = CFURLCreateWithFileSystemPath(0, v4, kCFURLPOSIXPathStyle, 0);
    if (!v6) {
      sub_100041C28(&v8, v10);
    }
    *a2 = v6;
    CFRelease(v5);
  }
  return v3;
}

CFMutableDictionaryRef sub_10000BDB8()
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!result) {
    sub_100041CA0(&v1, v2);
  }
  return result;
}

void sub_10000BE2C(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (!v5) {
    sub_100041D18(&v8, v9);
  }
  CFNumberRef v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void sub_10000BECC(__CFDictionary *a1, const void *a2, char *cStr)
{
  CFStringRef v5 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (!v5) {
    sub_100041BB0(&v7, v8);
  }
  CFStringRef v6 = v5;
  CFDictionarySetValue(a1, a2, v5);

  CFRelease(v6);
}

CFErrorRef sub_10000BF78(const char *a1, const char *a2, int a3, const char *a4, CFIndex a5, const void *a6, char *cStr)
{
  int valuePtr = a3;
  CFStringRef v12 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFStringRef v13 = CFStringCreateWithCString(0, a1, 0x8000100u);
  CFStringRef v14 = CFStringCreateWithCString(0, a4, 0x8000100u);
  CFStringRef v15 = CFStringCreateWithCString(0, a2, 0x8000100u);
  CFNumberRef v16 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  int v17 = sub_10000BDB8();
  CFDictionarySetValue(v17, kCFErrorLocalizedDescriptionKey, v12);
  if (os_variant_allows_internal_security_policies())
  {
    CFDictionarySetValue(v17, @"FunctionName", v13);
    CFDictionarySetValue(v17, @"FileName", v15);
    CFDictionarySetValue(v17, @"LineNumber", v16);
  }
  if (a6) {
    CFDictionarySetValue(v17, kCFErrorUnderlyingErrorKey, a6);
  }
  CFErrorRef v18 = CFErrorCreate(0, v14, a5, v17);
  CFRelease(v17);
  CFRelease(v12);
  CFRelease(v13);
  CFRelease(v14);
  CFRelease(v15);
  CFRelease(v16);
  return v18;
}

CFIndex sub_10000C110(CFIndex result)
{
  if (result)
  {
    uint64_t v1 = (__CFError *)result;
    CFTypeID v2 = CFGetTypeID((CFTypeRef)result);
    if (v2 != CFErrorGetTypeID()) {
      return 0xFFFFFFFFLL;
    }
    Value = v1;
    while (1)
    {
      CFErrorDomain Domain = CFErrorGetDomain(Value);
      if (CFEqual(Domain, @"com.apple.security.cryptex.posix")) {
        break;
      }
      CFDictionaryRef v5 = CFErrorCopyUserInfo(Value);
      if (!v5) {
        break;
      }
      CFDictionaryRef v6 = v5;
      Value = (__CFError *)CFDictionaryGetValue(v5, kCFErrorUnderlyingErrorKey);
      CFRelease(v6);
      if (!Value) {
        goto LABEL_10;
      }
    }
    CFErrorDomain v7 = CFErrorGetDomain(Value);
    if (CFEqual(v7, @"com.apple.security.cryptex.posix")) {
      return CFErrorGetCode(Value);
    }
LABEL_10:
    CFErrorDomain v8 = CFErrorGetDomain(v1);
    if (CFEqual(v8, @"com.apple.security.cryptex") && (unsigned int Code = CFErrorGetCode(v1), Code <= 0x24)) {
      return dword_100048600[Code];
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

CFDictionaryRef sub_10000C218(CFDictionaryRef result, const void *a2, uint64_t a3)
{
  if (result)
  {
    Value = result;
    CFTypeID v6 = CFGetTypeID(result);
    CFTypeID TypeID = CFErrorGetTypeID();
    CFMutableDictionaryRef result = 0;
    if (a2)
    {
      if (v6 == TypeID)
      {
        while (1)
        {
          CFErrorDomain Domain = CFErrorGetDomain(Value);
          if (CFEqual(Domain, a2))
          {
            if (CFErrorGetCode(Value) == a3) {
              break;
            }
          }
          CFMutableDictionaryRef result = CFErrorCopyUserInfo(Value);
          if (!result) {
            return result;
          }
          uint64_t v9 = result;
          Value = (__CFError *)CFDictionaryGetValue(result, kCFErrorUnderlyingErrorKey);
          CFRelease(v9);
          if (!Value) {
            return 0;
          }
        }
        return (CFDictionaryRef)1;
      }
    }
  }
  return result;
}

uint64_t sub_10000C2DC()
{
  return _os_log_send_and_compose_impl();
}

void sub_10000C68C(void *a1)
{
  CFTypeID v2 = [a1 cs];
  uint64_t uid = cryptex_session_core_get_uid();

  uint64_t v4 = sub_10003B43C(uid);
  if (v4)
  {
    [a1 setError:v4];
    int v5 = *__error();
    CFTypeID v6 = [a1 log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412546;
      int v11 = a1;
      __int16 v12 = 1024;
      unsigned int v13 = [a1 error];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to uncork session %@: %{darwin.errno}d", (uint8_t *)&v10, 0x12u);
    }

    *__error() = v5;
    CFErrorDomain v7 = a1;
    uint64_t v8 = 32;
  }
  else
  {
    CFErrorDomain v7 = a1;
    uint64_t v8 = 4;
  }
  [v7 sessionEventNotify:v8];
  uint64_t v9 = [a1 session_work_group];
  dispatch_group_leave(v9);
}

void sub_10000CD18(void *a1, void *a2, CFIndex a3, void *a4)
{
  CFErrorDomain v7 = a1;
  id v8 = a2;
  if (a3 && (CFIndex v9 = sub_10000C110(a3), v9))
  {
    CFIndex v10 = v9;
    int v11 = *__error();
    __int16 v12 = [a4 log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v14[0] = 67109120;
      v14[1] = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to unbootstrap quire: %{darwin.errno}d", (uint8_t *)v14, 8u);
    }

    *__error() = v11;
    [a4 setError:v10];
    [a4 sessionEventNotify:32];
    unsigned int v13 = [a4 session_work_group];
    dispatch_group_leave(v13);
  }
  else
  {
    sub_100018E84(v7, v8, (uint64_t)a4, (uint64_t)sub_10000F750);
  }
}

id sub_10000D0C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "BUNDLEID");
  int v23 = xpc_dictionary_dup_fd(v4, "DMG");
  int v22 = xpc_dictionary_dup_fd(v4, "TCH");
  int v21 = xpc_dictionary_dup_fd(v4, "IM4");
  int v20 = xpc_dictionary_dup_fd(v4, "INF");
  int v19 = xpc_dictionary_dup_fd(v4, "VOLHASH");
  int64_t int64 = xpc_dictionary_get_int64(v4, "TYPE");
  CFErrorDomain v7 = xpc_dictionary_get_dictionary(v4, "CRYPTEX1_PROPERTIES");
  if (v7) {
    id v8 = (void *)cryptex_core_cx1_properties_create_with_xpc_dictionary();
  }
  else {
    id v8 = 0;
  }
  id v9 = [*(id *)(a1 + 32) sessionAddCptxWithBundleID:string withType:int64 dmgFd:&v23 trustCacheFD:&v22 manifestFD:&v21 volumeHashFD:&v19 infoPlistFd:&v20 cx1Properties:v8];

  if (v19 != -1 && close(v19) == -1)
  {
    uint64_t v24 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v11 = *__error();
    int v25 = 67109120;
    int v26 = v11;
    _os_log_send_and_compose_impl();
    uint64_t v12 = _os_crash_msg();
    sub_100041EA0(v12);
  }
  if (v20 != -1 && close(v20) == -1)
  {
    uint64_t v24 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v13 = *__error();
    int v25 = 67109120;
    int v26 = v13;
    _os_log_send_and_compose_impl();
    uint64_t v14 = _os_crash_msg();
    sub_100041EA0(v14);
  }
  if (v21 != -1 && close(v21) == -1)
  {
    uint64_t v24 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v15 = *__error();
    int v25 = 67109120;
    int v26 = v15;
    _os_log_send_and_compose_impl();
    uint64_t v16 = _os_crash_msg();
    sub_100041EA0(v16);
  }
  if (v22 != -1 && close(v22) == -1)
  {
    uint64_t v24 = 0;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v27 = 0u;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v17 = *__error();
    int v25 = 67109120;
    int v26 = v17;
    _os_log_send_and_compose_impl();
    uint64_t v18 = _os_crash_msg();
    sub_100041EA0(v18);
  }
  if (v23 != -1 && close(v23) == -1) {
    sub_100041DD4(&v24, &v27);
  }

  return v9;
}

void sub_10000D52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, unsigned int a12, unsigned int a13, unsigned int a14, unsigned int a15, unsigned int a16)
{
}

uint64_t sub_10000D594(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result != -1)
  {
    uint64_t result = close(result);
    if (result == -1) {
      sub_100041EA4(&v2, v3);
    }
  }
  return result;
}

void sub_10000D874(void *a1, void *a2, CFIndex a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v26 = a4;
  id v9 = *(id *)(a4 + 32);
  if (a3 && (CFIndex v10 = sub_10000C110(a3), v10))
  {
    CFIndex v11 = v10;
    int v12 = *__error();
    int v13 = [v9 log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v28) = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "exiting session codex install: %{darwin.errno}d", buf, 8u);
    }

    *__error() = v12;
    [v9 setError:v11];
    uint64_t v14 = [v9 session_work_group];
    dispatch_group_leave(v14);

    sub_10003B330(&v26);
  }
  else if (*(_DWORD *)(a4 + 8))
  {
    int v15 = *__error();
    uint64_t v16 = [v9 log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = *(_DWORD *)(a4 + 8);
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v28) = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "_session_install_codex_callback context error: %{darwin.errno}d", buf, 8u);
    }

    *__error() = v15;
    [v9 setError:*(unsigned int *)(a4 + 8)];
  }
  else
  {
    if (v8)
    {
      uint64_t v18 = [v9 cs];
      int uid = cryptex_session_core_get_uid();

      int v20 = [v9 cs];
      int v21 = cryptex_session_core_get_overrides();

      int v22 = [v9 cs];
      uint64_t v23 = cryptex_session_core_copy_name();
      sub_100033E98((uint64_t)v8, uid, v21, v23);

      uint64_t v24 = [v9 log];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v28 = v9;
        __int16 v29 = 2048;
        id v30 = v8;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%@: Saving the quire %p", buf, 0x16u);
      }

      int v25 = [v9 quire_array];
      [v25 addObject:v8];
    }
    sub_100019648((uint64_t)v7, v8, a4, (uint64_t)sub_10000F614);
  }
}

void sub_10000E004(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type != (xpc_type_t)&_xpc_type_connection)
  {
    xpc_type_t v5 = type;
    CFTypeID v6 = [*(id *)(a1 + 32) log];
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5 == (xpc_type_t)&_xpc_type_error)
    {
      if (v7)
      {
        *(_DWORD *)long long buf = 136315138;
        string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
        id v8 = "connection error: %s";
        id v9 = v6;
        uint32_t v10 = 12;
        goto LABEL_10;
      }
    }
    else if (v7)
    {
      *(_WORD *)long long buf = 0;
      id v8 = "unrecognized connection event";
      id v9 = v6;
      uint32_t v10 = 2;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
    }

    goto LABEL_12;
  }
  pid_t pid = xpc_connection_get_pid((xpc_connection_t)v3);
  int v12 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(string) = pid;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "activating peer for %d", buf, 8u);
  }

  int v13 = [*(id *)(a1 + 32) peer_array];
  [v13 addObject:v3];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000E218;
  v15[3] = &unk_100059578;
  v15[4] = *(void *)(a1 + 32);
  id v14 = v3;
  id v16 = v14;
  xpc_connection_set_event_handler((xpc_connection_t)v14, v15);
  xpc_connection_activate((xpc_connection_t)v14);

LABEL_12:
}

id sub_10000E218(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) parseCommandFromMessage:a2 fromPeer:*(void *)(a1 + 40)];
}

void sub_10000EA70(_Unwind_Exception *a1)
{
  free(0);
  free(v1);
  _Unwind_Resume(a1);
}

void sub_10000EDA8(id a1)
{
  qword_10005E410 = +[CryptexSessionList createCryptexSessionList];

  _objc_release_x1();
}

BOOL sub_10000F004(uint64_t a1, void *a2)
{
  id v3 = (char *)[a2 copySessionName];
  BOOL v4 = strcmp(*(const char **)(a1 + 32), v3) == 0;
  free(v3);
  return v4;
}

uint64_t sub_10000F0BC(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = +[CryptexSessionList sharedList];
  int v13 = (pthread_rwlock_t *)(v2 + 8);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v2 + 8));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(id)v2 list];
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (int i = 0; i != v5; int i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v9 = [v8 log:v13];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint32_t v10 = [v8 name];
          *(_DWORD *)long long buf = 138412290;
          int v19 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "passing session %@", buf, 0xCu);
        }
        CFIndex v11 = [v8 cs];
        v1[2](v1, v11);
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v5);
  }

  pthread_rwlock_unlock(v13);
  return 0;
}

uint64_t sub_10000F298(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = +[CryptexSessionList sharedList];
  long long v15 = (pthread_rwlock_t *)(v4 + 8);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v4 + 8));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v16 = (void *)v4;
  id v5 = [(id)v4 list];
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (int i = 0; i != v7; int i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint32_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        CFIndex v11 = [v10 log:v15];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = [v10 name];
          *(_DWORD *)long long buf = 138412290;
          int v22 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "passing session %@", buf, 0xCu);
        }
        int v13 = [v10 cs];
        v3[2](v3, v13, a2);
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v7);
  }

  pthread_rwlock_unlock(v15);
  return 0;
}

uint64_t sub_10000F478(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [[CryptexSession alloc] initWithCore:v1];

  if (v2)
  {
    [(CryptexSession *)v2 setupHandler];
    id v3 = +[CryptexSessionList sharedList];
    [v3 addCryptexSession:v2];

    uint64_t v4 = [(CryptexSession *)v2 activate];
  }
  else
  {
    uint64_t v4 = 22;
  }

  return v4;
}

void sub_10000F504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = +[CryptexSessionList sharedList];
  id v8 = [v6 findCryptexSession:a1];

  id v7 = v8;
  if (v8)
  {
    [v8 sessionStopWithReason:a2 exitCode:a3];
    id v7 = v8;
  }
}

id sub_10000F590(uint64_t a1)
{
  uint64_t v2 = +[CryptexSessionList sharedList];
  id v3 = [v2 findCryptexSession:a1];

  if (v3)
  {
    uint64_t v4 = [v3 getDispatchQueue];
  }
  else
  {
    uint64_t v4 = &_dispatch_main_q;
    id v5 = &_dispatch_main_q;
  }

  return v4;
}

void sub_10000F614(void *a1, void *a2, CFIndex a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v15 = a4;
  id v9 = *(id *)(a4 + 32);
  if (a3)
  {
    CFIndex v10 = sub_10000C110(a3);
    if (v10)
    {
      CFIndex v11 = v10;
      int v12 = *__error();
      int v13 = [v9 log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        int v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "exiting session quire bootstrap: %{darwin.errno}d", buf, 8u);
      }

      *__error() = v12;
      [v9 setError:v11];
    }
  }
  long long v14 = [v9 session_work_group];
  dispatch_group_leave(v14);

  sub_10003B330(&v15);
}

void sub_10000F750(void *a1, void *a2, CFIndex a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  if (a3)
  {
    int v9 = *__error();
    CFIndex v10 = [a4 log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v20 = 138412290;
      CFIndex v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to unmount quire: %@", (uint8_t *)&v20, 0xCu);
    }

    *__error() = v9;
    [a4 setError:sub_10000C110(a3)];
  }
  else
  {
    CFIndex v11 = [a4 quire_array];
    unsigned int v12 = [v11 containsObject:v8];

    if (v12)
    {
      int v13 = [a4 quire_array];
      [v13 removeObject:v8];
    }
    else
    {
      [a4 setError:2];
      int v14 = *__error();
      uint64_t v15 = [a4 log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int v20 = 134218240;
        CFIndex v21 = (CFIndex)v8;
        __int16 v22 = 1024;
        unsigned int v23 = [a4 error];
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Quire object not found %p: %{darwin.errno}d", (uint8_t *)&v20, 0x12u);
      }

      *__error() = v14;
    }
  }
  if ([a4 error])
  {
    [a4 sessionEventNotify:32];
  }
  else
  {
    long long v16 = [a4 quire_array];
    id v17 = [v16 count];

    if (!v17)
    {
      long long v18 = [a4 log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "taking down the session", (uint8_t *)&v20, 2u);
      }

      [a4 sessionEventNotify:16];
      [a4 cancelPeerConnections];
    }
  }
  long long v19 = [a4 session_work_group];
  dispatch_group_leave(v19);
}

void *sub_10000F9CC()
{
  if (qword_10005E418 != -1) {
    dispatch_once(&qword_10005E418, &stru_100059600);
  }
  return &unk_10005E420;
}

void sub_10000FA10(id a1)
{
}

void sub_10000FA50(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  id v6 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  unsigned int v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  int v14 = sub_10000FBCC;
  uint64_t v15 = &unk_100059650;
  id v17 = v18;
  id v16 = a4;
  launch_cryptex_terminate();
  dispatch_time_t v7 = dispatch_time(0, 1000000000 * a2);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000FC8C;
  v9[3] = &unk_1000596A0;
  id v10 = v16;
  CFIndex v11 = v18;
  id v8 = v16;
  dispatch_after(v7, v6, v9);

  _Block_object_dispose(v18, 8);
}

void sub_10000FBB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000FBCC(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000FC74;
  v6[3] = &unk_100059628;
  id v7 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(v3 + 24);
  uint64_t v4 = (dispatch_once_t *)(v3 + 24);
  int v8 = a2;
  if (v5 != -1) {
    dispatch_once(v4, v6);
  }
}

uint64_t sub_10000FC74(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

void sub_10000FC8C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 40) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000FD2C;
  block[3] = &unk_100059678;
  id v5 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v2 = (dispatch_once_t *)(v1 + 24);
  if (v3 != -1) {
    dispatch_once(v2, block);
  }
}

uint64_t sub_10000FD2C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000FD40(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  uint64_t v3 = [[+[NSString stringWithUTF8String:a1] stringByResolvingSymlinksInPath] pathComponents];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000FE48;
  v6[3] = &unk_1000596C8;
  void v6[4] = [[+[NSString stringWithUTF8String:a2] stringByResolvingSymlinksInPath] pathComponents];
  v6[5] = &v7;
  [(NSArray *)v3 enumerateObjectsUsingBlock:v6];
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_10000FE2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

char *sub_10000FE48(uint64_t a1, void *a2, unint64_t a3, unsigned char *a4)
{
  uint64_t result = (char *)[*(id *)(a1 + 32) count];
  if ((unint64_t)(result - 1) <= a3
    || (uint64_t result = (char *)objc_msgSend(a2, "isEqual:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3)),
        (result & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t sub_10000FEC0()
{
  return 1;
}

uint64_t sub_10000FEC8()
{
  return 0;
}

BOOL sub_10000FED0()
{
  return APFSVolumeRoleFind() == 0;
}

uint64_t sub_10000FF18(uint64_t a1, char *a2, int a3, _WORD *a4, NSObject *a5)
{
  uint64_t v9 = sub_10000BDB8();
  sub_10000BECC(v9, kAPFSVolumeNameKey, a2);
  sub_10000BE2C(v9, kAPFSVolumeRoleKey, a3);
  int v10 = APFSVolumeCreate();
  if (v10)
  {
    int v11 = v10;
    int v12 = *__error();
    if (!os_log_type_enabled(a5, OS_LOG_TYPE_ERROR))
    {
LABEL_5:
      *__error() = v12;
      uint64_t v16 = 22;
      goto LABEL_6;
    }
    int v19 = 136315394;
    int v20 = a2;
    __int16 v21 = 1024;
    int v22 = v11;
    uint64_t v13 = "failed to create volume %s: 0x%x";
    int v14 = a5;
    uint32_t v15 = 18;
LABEL_4:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v19, v15);
    goto LABEL_5;
  }
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v9, kAPFSVolumeFSIndexKey);
  if (!Value)
  {
    int v12 = *__error();
    if (!os_log_type_enabled(a5, OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    int v19 = 136315138;
    int v20 = a2;
    uint64_t v13 = "failed to get volume %s index key";
    int v14 = a5;
    uint32_t v15 = 12;
    goto LABEL_4;
  }
  uint64_t v16 = 0;
  if (a4) {
    *a4 = sub_10000BC0C(Value) + 1;
  }
LABEL_6:
  if (v9) {
    CFRelease(v9);
  }
  return v16;
}

uint64_t sub_1000100CC(char *a1, uint64_t a2, NSObject *a3)
{
  int v13 = -1;
  pid_t v14 = -1;
  __argv[0] = "/sbin/mount_apfs";
  uint64_t v22 = unk_100059700;
  __argv[1] = a1;
  uint64_t v21 = a2;
  uint64_t v4 = posix_spawn(&v14, "/sbin/mount_apfs", 0, 0, __argv, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      *(char **)uint64_t v16 = __argv[0];
      *(_WORD *)&v16[8] = 1024;
      int v17 = v5;
      uint64_t v7 = "failed to posix_spawn %s: %{darwin.errno}d";
LABEL_4:
      int v8 = a3;
      uint32_t v9 = 18;
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, v7, buf, v9);
      goto LABEL_19;
    }
    goto LABEL_19;
  }
  pid_t v10 = waitpid(v14, &v13, 0);
  if (v10 != v14)
  {
    pid_t v11 = v10;
    uint64_t v5 = *__error();
    int v6 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109376;
      *(_DWORD *)uint64_t v16 = v11;
      *(_WORD *)&v16[4] = 1024;
      *(_DWORD *)&v16[6] = v5;
      uint64_t v7 = "unexpected return code for waitpid: %d: %{darwin.errno}d";
      int v8 = a3;
      uint32_t v9 = 14;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if ((v13 & 0x7F) != 0)
  {
    if ((v13 & 0x7F) == 0x7F)
    {
      int v6 = *__error();
      uint64_t v5 = 35;
      if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        *(char **)uint64_t v16 = __argv[0];
        *(_WORD *)&v16[8] = 1024;
        int v17 = 35;
        uint64_t v7 = "%s exited with an unknown state: %{darwin.errno}d";
        goto LABEL_4;
      }
LABEL_19:
      *__error() = v6;
      return v5;
    }
    int v6 = *__error();
    uint64_t v5 = 4;
    if (!os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)long long buf = 136315650;
    *(char **)uint64_t v16 = __argv[0];
    *(_WORD *)&v16[8] = 1024;
    int v17 = v13 & 0x7F;
    __int16 v18 = 1024;
    int v19 = 4;
    uint64_t v7 = "%s exited with signal: %d: %{darwin.errno}d";
LABEL_17:
    int v8 = a3;
    uint32_t v9 = 24;
    goto LABEL_18;
  }
  uint64_t v5 = BYTE1(v13);
  if (BYTE1(v13))
  {
    int v6 = *__error();
    if (!os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    *(_DWORD *)long long buf = 136315650;
    *(char **)uint64_t v16 = __argv[0];
    *(_WORD *)&v16[8] = 1024;
    int v17 = BYTE1(v13);
    __int16 v18 = 1024;
    int v19 = v5;
    uint64_t v7 = "%s returned non-zero exit: %d: %{darwin.errno}d";
    goto LABEL_17;
  }
  return v5;
}

uint64_t sub_100010388(int a1, char **a2, NSObject *a3)
{
  kern_return_t v14;
  kern_return_t v15;
  int v16;
  CFNumberRef v17;
  CFNumberRef Value;
  CFTypeID v19;
  int v20;
  CFTypeID v21;
  unsigned __int16 valuePtr;
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t buf[88];

  existing = 0;
  CFDictionaryRef v6 = IOServiceMatching("AppleAPFSVolume");
  if (v6)
  {
    uint64_t MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v6, &existing);
    if (MatchingServices)
    {
      uint64_t v8 = MatchingServices;
      int v9 = *__error();
      if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v8;
        _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to get matching services: %{mach.errno}x", buf, 8u);
      }
      *__error() = v9;
      uint64_t v10 = sub_10001273C(v8);
      goto LABEL_34;
    }
    IOIteratorReset(existing);
    io_object_t v12 = IOIteratorNext(existing);
    if (!v12)
    {
LABEL_33:
      uint64_t v10 = 93;
      goto LABEL_34;
    }
    io_registry_entry_t v13 = v12;
    uint64_t v10 = 0xFFFFFFFFLL;
    while (1)
    {
      properties = 0;
      if (!IORegistryEntryInPlane(v13, "IOService")) {
        goto LABEL_16;
      }
      pid_t v14 = IORegistryEntryCreateCFProperties(v13, &properties, kCFAllocatorDefault, 0);
      if (v14) {
        break;
      }
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(properties, @"RoleValue");
      int v17 = Value;
      if (Value)
      {
        int v19 = CFGetTypeID(Value);
        if (v19 != CFNumberGetTypeID()) {
          goto LABEL_32;
        }
        int valuePtr = 0;
        if (!CFNumberGetValue(v17, kCFNumberSInt16Type, &valuePtr) || valuePtr != a1) {
          goto LABEL_32;
        }
        int v17 = (const __CFNumber *)CFDictionaryGetValue(properties, @"FormattedBy");
        int v20 = *__error();
        if (os_log_type_enabled(a3, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&uint8_t buf[4] = v17;
          _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "volume is formatted by %@", buf, 0xCu);
        }
        *__error() = v20;
        if (v17 && (uint64_t v21 = CFGetTypeID(v17), v21 == CFStringGetTypeID()))
        {
          uint64_t v10 = 0;
          *a2 = sub_10000BB44((const __CFString *)v17);
          LODWORD(v17) = 4;
        }
        else
        {
LABEL_32:
          LODWORD(v17) = 0;
        }
      }
LABEL_17:
      if (properties) {
        CFRelease(properties);
      }
      if (IOObjectRelease(v13)) {
        sub_100042018(&properties, buf);
      }
      if ((v17 | 8) != 8) {
        goto LABEL_34;
      }
      io_registry_entry_t v13 = IOIteratorNext(existing);
      if (!v13) {
        goto LABEL_33;
      }
    }
    uint32_t v15 = v14;
    uint64_t v16 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to get service properties: %{mach.errno}x", buf, 8u);
    }
    *__error() = v16;
LABEL_16:
    LODWORD(v17) = 8;
    goto LABEL_17;
  }
  int v11 = *__error();
  if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    *(void *)&uint8_t buf[4] = "AppleAPFSVolume";
    _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to match service %s", buf, 0xCu);
  }
  *__error() = v11;
  uint64_t v10 = 78;
LABEL_34:
  if (existing && IOObjectRelease(existing)) {
    sub_100042018(&properties, buf);
  }
  return v10;
}

uint64_t sub_100010730(uint64_t a1, int a2, NSObject *a3)
{
  CFArrayRef theArray = 0;
  if (APFSVolumeRoleFind())
  {
    int v5 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(f_mntonname) = a2;
      _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to find volume for role %d", buf, 8u);
    }
    *__error() = v5;
    uint64_t v6 = 2;
  }
  else if (CFArrayGetCount(theArray) < 1)
  {
LABEL_15:
    uint64_t v6 = 0;
  }
  else
  {
    CFIndex v7 = 0;
    while (1)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v7);
      int v9 = sub_10000BB44(ValueAtIndex);
      uint64_t v16 = 0;
      int v10 = getmntinfo(&v16, 2);
      if (v10)
      {
        int v11 = v10;
        f_mntfromname = v16->f_mntfromname;
        while (strcmp(v9, f_mntfromname))
        {
          uint64_t v16 = (statfs *)(f_mntfromname + 1056);
          f_mntfromname += 2168;
          if (!--v11) {
            goto LABEL_13;
          }
        }
        if (unmount(f_mntfromname - 1024, 0x80000)) {
          break;
        }
      }
LABEL_13:
      if (APFSVolumeDelete())
      {
        uint64_t v6 = *__error();
        int v13 = *__error();
        if (!os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
          goto LABEL_21;
        }
        *(_DWORD *)long long buf = 136315394;
        f_mntonname = v9;
        __int16 v20 = 1024;
        int v21 = v6;
        pid_t v14 = "failed to delete volume %s: %{darwin.errno}d";
        goto LABEL_20;
      }
      free(v9);
      if (++v7 >= CFArrayGetCount(theArray)) {
        goto LABEL_15;
      }
    }
    uint64_t v6 = *__error();
    int v13 = *__error();
    if (!os_log_type_enabled(a3, OS_LOG_TYPE_ERROR)) {
      goto LABEL_21;
    }
    *(_DWORD *)long long buf = 136315394;
    f_mntonname = v16->f_mntonname;
    __int16 v20 = 1024;
    int v21 = v6;
    pid_t v14 = "failed to umount %s: %{darwin.errno}d";
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, v14, buf, 0x12u);
LABEL_21:
    *__error() = v13;
    free(v9);
  }
  if (theArray) {
    CFRelease(theArray);
  }
  return v6;
}

uint64_t sub_10001098C()
{
  return _os_log_send_and_compose_impl();
}

double sub_1000109B0(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void *sub_1000109D4(uint64_t a1)
{
  uint64_t v2 = sub_100016EB4();
  uint64_t v3 = sub_100019E3C((uint64_t)v2, (char *)(a1 + 24), 0);
  if (v2) {
    os_release(v2);
  }
  return v3;
}

uint64_t sub_100010A1C(void *a1, unsigned char *a2, unsigned char *a3)
{
  uint64_t v6 = (void *)sub_100013408((uint64_t)a2, 0);
  uint64_t v7 = sub_100013470((uint64_t)v6);
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = (const char *)a1[7];
    int v10 = *__error();
    int v11 = a1[9];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      io_object_t v12 = "[anonymous]";
      if (v9) {
        io_object_t v12 = v9;
      }
      *(_DWORD *)uint64_t v26 = 136446466;
      *(void *)&v26[4] = v12;
      __int16 v27 = 1024;
      LODWORD(v28) = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s: failed to resolve proc: %{darwin.errno}d", v26, 0x12u);
    }
    *__error() = v10;
  }
  else
  {
    uint64_t v8 = sub_1000140A0((uint64_t)v6, "com.apple.private.security.cryptex.install");
    int v13 = (const char *)a1[7];
    int v14 = *__error();
    uint32_t v15 = a1[9];
    if (v8)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = "[anonymous]";
        uint64_t v17 = v6[8];
        uint64_t v18 = v6[9];
        if (v13) {
          uint64_t v16 = v13;
        }
        *(_DWORD *)uint64_t v26 = 136447490;
        *(void *)&v26[4] = v16;
        __int16 v27 = 2080;
        id v28 = "uninstall";
        __int16 v29 = 2080;
        id v30 = "com.apple.private.security.cryptex.install";
        __int16 v31 = 2080;
        uint64_t v32 = v17;
        __int16 v33 = 2080;
        uint64_t v34 = v18;
        __int16 v35 = 1024;
        int v36 = v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s: proc not entitled for %s: entitlement = %s, proc = %s, signing id = %s: %{darwin.errno}d", v26, 0x3Au);
      }
      *__error() = v14;
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v19 = "[anonymous]";
        if (v13) {
          int v19 = v13;
        }
        uint64_t v20 = v6[8];
        uint64_t v21 = v6[9];
        *(_DWORD *)uint64_t v26 = 136447234;
        *(void *)&v26[4] = v19;
        __int16 v27 = 2080;
        id v28 = "uninstall";
        __int16 v29 = 2080;
        id v30 = "com.apple.private.security.cryptex.install";
        __int16 v31 = 2080;
        uint64_t v32 = v20;
        __int16 v33 = 2080;
        uint64_t v34 = v21;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}s: authorized proc for %s: entitlement = %s, proc = %s, signing id = %s", v26, 0x34u);
      }
      *__error() = v14;
      uint64_t v22 = a1[49];
      *(void *)uint64_t v26 = 0;
      uint64_t v8 = cryptex_uninstall_unpack();
      if (!v8)
      {
        unint64_t v23 = v26[0] & 1;
        uint64_t v24 = sub_10002D0DC(0, a2, a3);
        sub_10001986C(v22, a1, v23, (uint64_t)v24, (uint64_t)sub_100010CF4);
        uint64_t v8 = 36;
      }
    }
  }
  if (v6) {
    os_release(v6);
  }
  os_release(a1);
  return v8;
}

void sub_100010CF4(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  int v8 = *__error();
  int v9 = a2[9];
  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      uint64_t v15 = a3;
      int v10 = "unbootstrap: %@";
      int v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v14) = 0;
    int v10 = "unbootstrap [no error]";
    int v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    uint32_t v13 = 2;
    goto LABEL_6;
  }
  *__error() = v8;
  sub_100018E84(a1, a2, a4, (uint64_t)sub_100010E14);
}

void sub_100010E14(uint64_t a1, uint64_t a2, CFIndex a3, uint64_t a4)
{
  if (a3) {
    int v5 = sub_10000C110(a3);
  }
  else {
    int v5 = 0;
  }
  uint64_t v6 = a4;
  sub_10002D130(&v6, v5);
}

id sub_100010E60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  id v29 = 0;
  int v10 = +[NSFileManager defaultManager];
  int v11 = +[NSString stringWithFormat:@"%s/%s", a4, a3];
  os_log_type_t v12 = +[NSURL fileURLWithPath:v11];
  uint32_t v13 = [(NSURL *)v12 URLByDeletingLastPathComponent];
  NSFileAttributeKey v36 = NSFilePosixPermissions;
  uint64_t v37 = &off_10005BBB8;
  if (![(NSFileManager *)v10 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:+[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1] error:&v29])
  {
    id v16 = [v29 code];
    int v17 = *__error();
    if (qword_10005E828 != -1) {
      dispatch_once(&qword_10005E828, &stru_100059738);
    }
    uint64_t v18 = qword_10005E820;
    if (os_log_type_enabled((os_log_t)qword_10005E820, OS_LOG_TYPE_ERROR))
    {
      int v19 = [(NSString *)[(NSURL *)v13 path] UTF8String];
      *(_DWORD *)long long buf = 136315394;
      __int16 v33 = v19;
      __int16 v34 = 1024;
      int v35 = (int)v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "failed to create directory at %s: %{darwin.errno}d", buf, 0x12u);
    }
    goto LABEL_33;
  }
  if ([(NSFileManager *)v10 fileExistsAtPath:v11])
  {
    int v28 = *__error();
    if (qword_10005E828 != -1) {
      dispatch_once(&qword_10005E828, &stru_100059738);
    }
    int v14 = qword_10005E820;
    if (os_log_type_enabled((os_log_t)qword_10005E820, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "trampoline file exists, removing", buf, 2u);
    }
    *__error() = v28;
    if (![(NSFileManager *)v10 removeItemAtPath:v11 error:&v29])
    {
      id v16 = [v29 code];
      int v17 = *__error();
      if (qword_10005E828 != -1) {
        dispatch_once(&qword_10005E828, &stru_100059738);
      }
      uint64_t v24 = qword_10005E820;
      if (os_log_type_enabled((os_log_t)qword_10005E820, OS_LOG_TYPE_ERROR))
      {
        int v25 = [(NSString *)v11 UTF8String];
        *(_DWORD *)long long buf = 136315394;
        __int16 v33 = v25;
        __int16 v34 = 1024;
        int v35 = (int)v16;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "failed to remove file at %s: %{darwin.errno}d", buf, 0x12u);
      }
      goto LABEL_33;
    }
  }
  if (a5) {
    CFStringRef v15 = @"#!/bin/sh\n/usr/bin/cryptexctl exec -P -i %s %s %s \"$@\"\n";
  }
  else {
    CFStringRef v15 = @"#!/bin/sh\n/usr/bin/cryptexctl exec -i %s %s %s \"$@\"\n";
  }
  if (![+[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, a1, a2, a3) writeToFile:v11 atomically:0 encoding:4 error:&v29])
  {
    id v20 = [v29 code];
    int v17 = *__error();
    if (qword_10005E828 != -1) {
      dispatch_once(&qword_10005E828, &stru_100059738);
    }
    uint64_t v21 = qword_10005E820;
    if (!os_log_type_enabled((os_log_t)qword_10005E820, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    uint64_t v22 = [(NSString *)[(NSURL *)v12 path] UTF8String];
    *(_DWORD *)long long buf = 136315394;
    __int16 v33 = v22;
    __int16 v34 = 1024;
    int v35 = (int)v20;
    unint64_t v23 = "failed to write trampoline at %s: %{darwin.errno}d";
    goto LABEL_31;
  }
  NSFileAttributeKey v30 = NSFilePosixPermissions;
  __int16 v31 = &off_10005BBB8;
  if (![(NSFileManager *)v10 setAttributes:+[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1] ofItemAtPath:v11 error:&v29])
  {
    id v20 = [v29 code];
    int v17 = *__error();
    if (qword_10005E828 != -1) {
      dispatch_once(&qword_10005E828, &stru_100059738);
    }
    uint64_t v21 = qword_10005E820;
    if (!os_log_type_enabled((os_log_t)qword_10005E820, OS_LOG_TYPE_ERROR)) {
      goto LABEL_32;
    }
    uint64_t v26 = [(NSString *)[(NSURL *)v12 path] UTF8String];
    *(_DWORD *)long long buf = 136315394;
    __int16 v33 = v26;
    __int16 v34 = 1024;
    int v35 = (int)v20;
    unint64_t v23 = "failed to change trampoline permission at %s: %{darwin.errno}d";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, v23, buf, 0x12u);
LABEL_32:
    id v16 = v20;
LABEL_33:
    *__error() = v17;
    return v16;
  }
  return 0;
}

void sub_100011328(id a1)
{
  qword_10005E820 = (uint64_t)os_log_create("com.apple.libcryptex", "bin_trampoline");
}

uint64_t sub_100011358(BOOL *a1)
{
  int v4 = 0;
  size_t v3 = 4;
  if (sysctlbyname("security.mac.amfi.developer_mode_status", &v4, &v3, 0, 0)) {
    return *__error();
  }
  uint64_t result = 0;
  if (a1) {
    *a1 = v4 != 0;
  }
  return result;
}

void sub_1000113D0(void **a1)
{
  close_drop_optional_np();
  os_release(a1[11]);
  os_release(a1[12]);
  os_release(a1[13]);
  free(a1[15]);

  sub_10003DE34((uint64_t)(a1 + 7));
}

void *sub_100011430(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = (void *)sub_100013060();
  v6[10] = a3;
  v6[11] = os_retain(a2);
  v6[12] = os_retain((void *)a1);
  uint64_t v7 = cryptex_core_create();
  v6[13] = v7;
  if (*(void *)(a1 + 168))
  {
    cryptex_core_attach_host();
    uint64_t v7 = v6[13];
  }
  if (*(void *)(a1 + 216))
  {
    cryptex_core_set_cryptex1_properties();
    uint64_t v7 = v6[13];
  }
  *(_OWORD *)(v7 + 40) = *(_OWORD *)(a1 + 40);
  *(void *)(v7 + 56) = *(void *)(a1 + 56);
  sub_10003DB40((uint64_t)(v6 + 7), (int)"com.apple.security.cryptexd", "protex");
  cryptex_init();
  return v6;
}

uint64_t sub_100011500(uint64_t a1)
{
  __s1[0] = *(_OWORD *)"protex.XXXXXX";
  memset(&__s1[1], 0, 239);
  int v22 = -1;
  int v2 = sub_10001755C(*(void *)(a1 + 88), (uint64_t)&unk_100059D58, (char *)__s1, &v22);
  if (v2)
  {
    int v3 = v2;
    int v4 = *(const char **)(a1 + 56);
    int v5 = *__error();
    uint64_t v6 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = "[anonymous]";
      if (v4) {
        uint64_t v7 = v4;
      }
      *(_DWORD *)long long buf = 136446466;
      int v28 = v7;
      __int16 v29 = 1024;
      int v30 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}s: failed to create staging directory: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v5;
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_DEBUG))
    {
      bzero(buf, 0x400uLL);
      if (!realpath_np())
      {
        int v8 = *(const char **)(a1 + 56);
        int v9 = *__error();
        int v10 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          int v11 = "[anonymous]";
          if (v8) {
            int v11 = v8;
          }
          *(_DWORD *)unint64_t v23 = 136446466;
          uint64_t v24 = v11;
          __int16 v25 = 2080;
          uint64_t v26 = buf;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}s: staging directory = %s", v23, 0x16u);
        }
        *__error() = v9;
      }
    }
    os_log_type_t v12 = *(const char **)(a1 + 56);
    int v13 = *__error();
    int v14 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      CFStringRef v15 = "[anonymous]";
      if (v12) {
        CFStringRef v15 = v12;
      }
      *(_DWORD *)long long buf = 136446466;
      int v28 = v15;
      __int16 v29 = 1024;
      int v30 = v22;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%{public}s: dirfd = %d", buf, 0x12u);
    }
    *__error() = v13;
    *(_DWORD *)(a1 + 112) = sub_10003DE70(&v22);
    if (_dispatch_is_multithreaded())
    {
      while (1)
      {
        id v16 = strdup((const char *)__s1);
        if (v16) {
          break;
        }
        __os_temporary_resource_shortage();
      }
    }
    else
    {
      id v16 = strdup((const char *)__s1);
      if (!v16) {
        sub_1000420A0((const char *)__s1, v23, buf);
      }
    }
    int v3 = 0;
    *(void *)(a1 + 120) = v16;
  }
  if (v22 != -1 && close(v22) == -1) {
    sub_100041A38(v23, buf);
  }
  if (v3)
  {
    int v17 = *(const char **)(a1 + 56);
    int v18 = *__error();
    int v19 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = "[anonymous]";
      if (v17) {
        id v20 = v17;
      }
      *(_DWORD *)long long buf = 136446466;
      int v28 = v20;
      __int16 v29 = 1024;
      int v30 = v3;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s: failed to make stage directory: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v18;
  }
  return cryptex_set_error();
}

uint64_t sub_100011878(void *a1, uint64_t a2, uint64_t a3)
{
  int v5 = sub_10003FD2C(a1, 0x28uLL);
  v5[3] = a2;
  v5[4] = a3;
  cryptex_async_f();

  return cryptex_activate();
}

uint64_t sub_1000118E4(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *a1;
  int error = cryptex_get_error();
  if (error)
  {
    int v4 = error;
    int v5 = *(const char **)(v2 + 56);
    int v6 = *__error();
    uint64_t v7 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = "[anonymous]";
      if (v5) {
        int v8 = v5;
      }
      *(_DWORD *)long long buf = 136446466;
      v124 = v8;
      __int16 v125 = 1024;
      LODWORD(v126) = v4;
      int v9 = "%{public}s: initialization failed: %{darwin.errno}d";
      goto LABEL_119;
    }
    goto LABEL_120;
  }
  v95 = v1;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  int v4 = -1;
  do
  {
    uint64_t v12 = *(void *)((char *)&cryptex_asset_types + v10);
    uint64_t v13 = *(void *)(*(void *)(v2 + 96) + v10 + 64);
    if (v13)
    {
      if (*(_UNKNOWN **)(v13 + 8) == &_cryptex_asset_type_im4m || (*(unsigned char *)(v2 + 80) & 1) == 0)
      {
        int v14 = *(const char **)(v2 + 56);
        int v15 = *__error();
        id v16 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          int v17 = "[anonymous]";
          if (v14) {
            int v17 = v14;
          }
          uint64_t v18 = *(void *)(*(void *)(v13 + 8) + 40);
          *(_DWORD *)long long buf = 136446466;
          v124 = v17;
          __int16 v125 = 2080;
          uint64_t v126 = v18;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s: copying asset: %s", buf, 0x16u);
        }
        *__error() = v15;
        uint64_t v19 = cryptex_asset_copy();
        *(void *)&v97.st_dev = v19;
        int v20 = openat(*(_DWORD *)(v2 + 112), *(const char **)(*(void *)(v13 + 8) + 40), 514, 438);
        *(_DWORD *)v111 = v20;
        if (v20 < 0)
        {
          int v4 = *__error();
          __int16 v44 = *(const char **)(v2 + 56);
          int v45 = *__error();
          __int16 v46 = *(NSObject **)(v2 + 72);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136446466;
            int v47 = "[anonymous]";
            if (v44) {
              int v47 = v44;
            }
            v124 = v47;
            __int16 v125 = 1024;
            LODWORD(v126) = v4;
            v48 = v46;
            int v49 = "%{public}s: openat: %{darwin.errno}d";
            goto LABEL_49;
          }
        }
        else
        {
          int v21 = v20;
          if (lseek(*(_DWORD *)(v13 + 16), 0, 0) == -1) {
            sub_100042188(&v110, buf);
          }
          if ((fcopyfile(*(_DWORD *)(v13 + 16), v21, 0, 0x100000Fu) & 0x80000000) == 0)
          {
            if (lseek(v21, 0, 0) == -1) {
              sub_100042188(&v110, buf);
            }
            int v22 = *(NSObject **)(v2 + 72);
            bzero(buf, 0x400uLL);
            memset(&v110, 0, sizeof(v110));
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              if (fstat(v21, &v110) == -1)
              {
                int v55 = *__error();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                {
                  int v56 = *__error();
                  *(_DWORD *)v98 = 136315650;
                  v99 = "fd_copy";
                  __int16 v100 = 1024;
                  int v101 = v21;
                  __int16 v102 = 1024;
                  LODWORD(v103) = v56;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", v98, 0x18u);
                }
                *__error() = v55;
              }
              else
              {
                if (fcntl(v21, 50, buf))
                {
                  unint64_t v23 = __error();
                  uint64_t v24 = strerror(*v23);
                  snprintf((char *)buf, 0x400uLL, "[%s]", v24);
                }
                unint64_t v25 = ((unint64_t)v110.st_mode >> 12) ^ 8;
                uint64_t v26 = "[unknown]";
                if (v25 != 15) {
                  uint64_t v26 = off_100059B58[v25];
                }
                __int16 v27 = (void *)os_flagset_copy_string();
                int v28 = *__error();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)v98 = 136316418;
                  v99 = "fd_copy";
                  __int16 v100 = 1024;
                  int v101 = v21;
                  __int16 v102 = 2080;
                  v103 = v26;
                  __int16 v104 = 2048;
                  off_t st_size = v110.st_size;
                  __int16 v106 = 2080;
                  v107 = v27;
                  __int16 v108 = 2080;
                  v109 = buf;
                  _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s", v98, 0x3Au);
                }
                *__error() = v28;
                free(v27);
              }
            }
            *(_DWORD *)(v19 + 16) = claimfd_np();
            cryptex_core_set_asset();
            int v4 = 0;
LABEL_65:
            cryptex_asset_destroy();
            if (*(_DWORD *)v111 != -1 && close(*(int *)v111) == -1) {
              sub_100041A38(&v110, buf);
            }
            if (v4)
            {
              v77 = *(const char **)(v2 + 56);
              int v87 = *__error();
              v88 = *(NSObject **)(v2 + 72);
              if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
              {
                v78 = "[anonymous]";
                if (v77) {
                  v78 = v77;
                }
                uint64_t v79 = *(void *)(v12 + 40);
                *(_DWORD *)long long buf = 136446722;
                v124 = v78;
                __int16 v125 = 2080;
                uint64_t v126 = v79;
                __int16 v127 = 1024;
                int v128 = v4;
                v80 = "%{public}s: copy asset: %s: %{darwin.errno}d";
                goto LABEL_112;
              }
              goto LABEL_114;
            }
LABEL_68:
            int v4 = 0;
            ++v11;
            goto LABEL_69;
          }
          int v4 = *__error();
          v50 = *(const char **)(v2 + 56);
          int v45 = *__error();
          v51 = *(NSObject **)(v2 + 72);
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136446466;
            BOOL v52 = "[anonymous]";
            if (v50) {
              BOOL v52 = v50;
            }
            v124 = v52;
            __int16 v125 = 1024;
            LODWORD(v126) = v4;
            v48 = v51;
            int v49 = "%{public}s: fcopyfile: %{darwin.errno}d";
LABEL_49:
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, v49, buf, 0x12u);
          }
        }
        *__error() = v45;
        goto LABEL_65;
      }
      bzero(&v110, 0x400uLL);
      bzero(v98, 0x400uLL);
      int v96 = -1;
      __int16 v34 = *(const char **)(v2 + 56);
      int v35 = *__error();
      NSFileAttributeKey v36 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v37 = "[anonymous]";
        if (v34) {
          uint64_t v37 = v34;
        }
        uint64_t v38 = *(void *)(*(void *)(v13 + 8) + 40);
        *(_DWORD *)long long buf = 136446466;
        v124 = v37;
        __int16 v125 = 2080;
        uint64_t v126 = v38;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%{public}s: symlinking asset: %s", buf, 0x16u);
      }
      *__error() = v35;
      int v39 = realpath_np();
      if (v39)
      {
        int v4 = v39;
        v40 = *(const char **)(v2 + 56);
        int v41 = *__error();
        uint64_t v42 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136446466;
          BOOL v43 = "[anonymous]";
          if (v40) {
            BOOL v43 = v40;
          }
LABEL_55:
          v124 = v43;
          __int16 v125 = 1024;
          LODWORD(v126) = v4;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}s: realpath_np: %{darwin.errno}d", buf, 0x12u);
        }
      }
      else
      {
        int v53 = realpath_np();
        if (!v53)
        {
          __strcat_chk();
          __strncat_chk();
          uint64_t v57 = cryptex_asset_copy();
          if (symlink((const char *)&v110, (const char *)v98))
          {
            int v4 = *__error();
            __int16 v58 = *(const char **)(v2 + 56);
            int v41 = *__error();
            pid_t v59 = *(NSObject **)(v2 + 72);
            if (!os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
              goto LABEL_56;
            }
            *(_DWORD *)long long buf = 136446466;
            __int16 v60 = "[anonymous]";
            if (v58) {
              __int16 v60 = v58;
            }
            v124 = v60;
            __int16 v125 = 1024;
            LODWORD(v126) = v4;
            uint64_t v61 = v59;
            v62 = "%{public}s: symlink: %{darwin.errno}d";
          }
          else
          {
            int v63 = open((const char *)v98, 0, 438);
            int v96 = v63;
            if ((v63 & 0x80000000) == 0)
            {
              int v64 = v63;
              if (lseek(v63, 0, 0) == -1) {
                sub_100042188(&v97, buf);
              }
              v65 = *(NSObject **)(v2 + 72);
              bzero(buf, 0x400uLL);
              memset(&v97, 0, sizeof(v97));
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
              {
                if (fstat(v64, &v97) == -1)
                {
                  int v75 = *__error();
                  if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
                  {
                    int v76 = *__error();
                    *(_DWORD *)v111 = 136315650;
                    v112 = "fd_symlink";
                    __int16 v113 = 1024;
                    int v114 = v64;
                    __int16 v115 = 1024;
                    LODWORD(v116) = v76;
                    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", v111, 0x18u);
                  }
                  *__error() = v75;
                }
                else
                {
                  if (fcntl(v64, 50, buf))
                  {
                    v66 = __error();
                    v67 = strerror(*v66);
                    snprintf((char *)buf, 0x400uLL, "[%s]", v67);
                  }
                  unint64_t v68 = ((unint64_t)v97.st_mode >> 12) ^ 8;
                  v69 = "[unknown]";
                  if (v68 != 15) {
                    v69 = off_100059B58[v68];
                  }
                  v70 = (void *)os_flagset_copy_string();
                  int v71 = *__error();
                  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)v111 = 136316418;
                    v112 = "fd_symlink";
                    __int16 v113 = 1024;
                    int v114 = v64;
                    __int16 v115 = 2080;
                    v116 = v69;
                    __int16 v117 = 2048;
                    off_t v118 = v97.st_size;
                    __int16 v119 = 2080;
                    v120 = v70;
                    __int16 v121 = 2080;
                    v122 = buf;
                    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s", v111, 0x3Au);
                  }
                  *__error() = v71;
                  free(v70);
                }
              }
              *(_DWORD *)(v57 + 16) = claimfd_np();
              cryptex_core_set_asset();
              int v4 = 0;
LABEL_57:
              cryptex_asset_destroy();
              if (v96 != -1 && close(v96) == -1) {
                sub_100041A38(&v97, buf);
              }
              if (v4)
              {
                v86 = *(const char **)(v2 + 56);
                int v87 = *__error();
                v88 = *(NSObject **)(v2 + 72);
                if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                {
                  v90 = "[anonymous]";
                  if (v86) {
                    v90 = v86;
                  }
                  uint64_t v91 = *(void *)(v12 + 40);
                  *(_DWORD *)long long buf = 136446722;
                  v124 = v90;
                  __int16 v125 = 2080;
                  uint64_t v126 = v91;
                  __int16 v127 = 1024;
                  int v128 = v4;
                  v80 = "%{public}s: symlink asset: %s: %{darwin.errno}d";
LABEL_112:
                  v84 = v88;
                  uint32_t v85 = 28;
LABEL_113:
                  _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, v80, buf, v85);
                }
LABEL_114:
                uint64_t v1 = v95;
                *__error() = v87;
                goto LABEL_115;
              }
              goto LABEL_68;
            }
            int v4 = *__error();
            v72 = *(const char **)(v2 + 56);
            int v41 = *__error();
            v73 = *(NSObject **)(v2 + 72);
            if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
              goto LABEL_56;
            }
            *(_DWORD *)long long buf = 136446466;
            v74 = "[anonymous]";
            if (v72) {
              v74 = v72;
            }
            v124 = v74;
            __int16 v125 = 1024;
            LODWORD(v126) = v4;
            uint64_t v61 = v73;
            v62 = "%{public}s: open: %{darwin.errno}d";
          }
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_ERROR, v62, buf, 0x12u);
          goto LABEL_56;
        }
        int v4 = v53;
        int v54 = *(const char **)(v2 + 56);
        int v41 = *__error();
        uint64_t v42 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136446466;
          BOOL v43 = "[anonymous]";
          if (v54) {
            BOOL v43 = v54;
          }
          goto LABEL_55;
        }
      }
LABEL_56:
      *__error() = v41;
      goto LABEL_57;
    }
    __int16 v29 = *(const char **)(v2 + 56);
    int v30 = *__error();
    __int16 v31 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v32 = *(void *)(v12 + 40);
      __int16 v33 = "[anonymous]";
      if (v29) {
        __int16 v33 = v29;
      }
      *(_DWORD *)long long buf = 136446466;
      v124 = v33;
      __int16 v125 = 2080;
      uint64_t v126 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%{public}s: asset not present; skipping: %s",
        buf,
        0x16u);
    }
    *__error() = v30;
LABEL_69:
    v10 += 8;
  }
  while (v10 != 96);
  if (!v11)
  {
    v81 = *(const char **)(v2 + 56);
    int v87 = *__error();
    v82 = *(NSObject **)(v2 + 72);
    int v4 = 2;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
    {
      v83 = "[anonymous]";
      if (v81) {
        v83 = v81;
      }
      *(_DWORD *)long long buf = 136446466;
      v124 = v83;
      __int16 v125 = 1024;
      LODWORD(v126) = 2;
      v80 = "%{public}s: empty core: %{darwin.errno}d";
      v84 = v82;
      uint32_t v85 = 18;
      goto LABEL_113;
    }
    goto LABEL_114;
  }
  uint64_t v1 = v95;
  if (!v4) {
    goto LABEL_121;
  }
LABEL_115:
  v92 = *(const char **)(v2 + 56);
  int v6 = *__error();
  uint64_t v7 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v93 = "[anonymous]";
    if (v92) {
      v93 = v92;
    }
    *(_DWORD *)long long buf = 136446466;
    v124 = v93;
    __int16 v125 = 1024;
    LODWORD(v126) = v4;
    int v9 = "%{public}s: copy assets failed: %{darwin.errno}d";
LABEL_119:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
  }
LABEL_120:
  *__error() = v6;
LABEL_121:
  *((_DWORD *)v1 + 2) = v4;
  return cryptex_target_async_f();
}

void sub_1000126F0(void **a1)
{
  ((void (*)(void *, void, void, void, void *))a1[4])(*a1, *((unsigned int *)*a1 + 28), *((void *)*a1 + 13), *((unsigned int *)a1 + 2), a1[3]);

  sub_10003FE2C(a1);
}

uint64_t sub_10001273C(uint64_t result)
{
  switch(result)
  {
    case 0xE00002BD:
    case 0xE00002BE:
    case 0xE00002C8:
    case 0xE00002DE:
      uint64_t result = 12;
      break;
    case 0xE00002BF:
      uint64_t result = 72;
      break;
    case 0xE00002C0:
    case 0xE00002D7:
    case 0xE00002D9:
    case 0xE00002DA:
      uint64_t result = 19;
      break;
    case 0xE00002C1:
      uint64_t result = 1;
      break;
    case 0xE00002C2:
      uint64_t result = 22;
      break;
    case 0xE00002C3:
    case 0xE00002C4:
    case 0xE00002C5:
    case 0xE00002CC:
      uint64_t result = 35;
      break;
    case 0xE00002C6:
      uint64_t result = 94;
      break;
    case 0xE00002C7:
      uint64_t result = 45;
      break;
    case 0xE00002C9:
    case 0xE00002CA:
    case 0xE00002D3:
    case 0xE00002D4:
      uint64_t result = 5;
      break;
    case 0xE00002CB:
    case 0xE00002DC:
    case 0xE00002DF:
    case 0xE00002E0:
    case 0xE00002E3:
    case 0xE00002E4:
    case 0xE00002E5:
    case 0xE00002E6:
    case 0xE00002E7:
    case 0xE00002E8:
    case 0xE00002EA:
      goto LABEL_10;
    case 0xE00002CD:
      uint64_t result = 9;
      break;
    case 0xE00002CE:
    case 0xE00002CF:
    case 0xE00002E2:
      uint64_t result = 13;
      break;
    case 0xE00002D0:
      uint64_t result = 14;
      break;
    case 0xE00002D1:
    case 0xE00002E9:
      uint64_t result = 83;
      break;
    case 0xE00002D2:
    case 0xE00002D5:
      uint64_t result = 16;
      break;
    case 0xE00002D6:
      uint64_t result = 60;
      break;
    case 0xE00002D8:
      uint64_t result = 6;
      break;
    case 0xE00002DB:
      uint64_t result = 28;
      break;
    case 0xE00002DD:
      uint64_t result = 17;
      break;
    case 0xE00002E1:
      uint64_t result = 7;
      break;
    case 0xE00002EB:
      uint64_t result = 89;
      break;
    default:
      if (result) {
LABEL_10:
      }
        uint64_t result = 104;
      break;
  }
  return result;
}

uint64_t sub_1000128D8(io_object_t *a1, const char *a2)
{
  io_iterator_t iterator = 0;
  uint64_t v2 = 2;
  if (a1 && a2)
  {
    if (!IORegistryEntryGetChildIterator(*a1, "IOService", &iterator))
    {
      io_object_t v6 = IOIteratorNext(iterator);
      if (v6)
      {
        io_object_t v7 = v6;
        while (!IOObjectConformsTo(v7, a2))
        {
          IOObjectRelease(v7);
          io_object_t v7 = IOIteratorNext(iterator);
          if (!v7)
          {
            uint64_t v2 = 2;
            goto LABEL_4;
          }
        }
        IOObjectRelease(*a1);
        uint64_t v2 = 0;
        *a1 = v7;
      }
    }
LABEL_4:
    if (iterator) {
      IOObjectRelease(iterator);
    }
  }
  return v2;
}

uint64_t (*sub_100012998())(void *a1)
{
  return sub_10000F478;
}

xpc_type_t sub_1000129AC(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (!*(void *)(a2 + 24))
  {
    *(void *)long long buf = 0;
    xpc_object_t v17 = 0;
    uint64_t v8 = session_activate_unpack();
    if (v8)
    {
      uint64_t v7 = v8;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to unpack", v11, 2u);
      }
      sub_10003D524(a2, a3, v7);
      return (xpc_type_t)v7;
    }
    xpc_object_t v5 = v17;
    int v9 = (void *)cryptex_session_core_create_from_xpc();
    uint64_t v7 = sub_10000F478(v9);
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to add session core to session list", v11, 2u);
      }
      uint64_t v10 = 0;
    }
    else
    {
      uint64_t v10 = (void *)cryptex_session_core_copy_xpc_object();
      xpc_type_t result = xpc_get_type(v10);
      if (result != (xpc_type_t)&_xpc_type_dictionary) {
        goto LABEL_25;
      }
      *(void *)long long buf = v10;
      session_activate_reply_pack();
    }
    sub_10003D524(a2, a3, v7);
    if (v9) {
      os_release(v9);
    }
    if (v10) {
      os_release(v10);
    }
    goto LABEL_12;
  }
  xpc_object_t v5 = xpc_array_create(0, 0);
  xpc_type_t result = xpc_get_type(v5);
  if (result == (xpc_type_t)&_xpc_type_array)
  {
    xpc_object_t v17 = v5;
    uint64_t v7 = session_list_unpack();
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "failed to unpack", buf, 2u);
      }
    }
    else
    {
      *(void *)long long buf = _NSConcreteStackBlock;
      uint64_t v13 = 0x40000000;
      int v14 = sub_100012C20;
      int v15 = &unk_100059C00;
      xpc_object_t v16 = v5;
      sub_10000F0BC(buf);
      session_list_reply_pack();
    }
    sub_10003D524(a2, a3, v7);
LABEL_12:
    if (v5) {
      os_release(v5);
    }
    return (xpc_type_t)v7;
  }
LABEL_25:
  __break(1u);
  return result;
}

void sub_100012C20(uint64_t a1, uint64_t a2)
{
  int v4 = (void *)cryptex_session_core_copy_xpc_object();
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v4);
  xpc_release(v4);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a2 + 96);
    int v6 = 136315138;
    uint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "callback %s", (uint8_t *)&v6, 0xCu);
  }
}

void sub_100012CF0(void *a1)
{
  id v1 = a1;
  xpc_object_t xdict = xpc_dictionary_create_reply(v1);
  uint64_t int64 = xpc_dictionary_get_uint64(v1, "user");

  int v3 = sub_10002167C(uint64);
  if (v3) {
    xpc_dictionary_set_value(xdict, "endpoint", v3);
  }
  xpc_dictionary_send_reply();
}

uint64_t sub_100012E14()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    sub_1000421FC();
  }
  return result;
}

uint64_t sub_100012ED8()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    sub_100042280();
  }
  return result;
}

uint64_t sub_100012F9C()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    sub_100042304();
  }
  return result;
}

uint64_t sub_100013060()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    sub_100042388();
  }
  return result;
}

uint64_t sub_100013124()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    sub_10004240C();
  }
  return result;
}

uint64_t sub_1000131E8()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    sub_100042490();
  }
  return result;
}

uint64_t sub_1000132AC()
{
  objc_opt_class();
  uint64_t result = _os_object_alloc();
  if (!result) {
    sub_100042514();
  }
  return result;
}

uint64_t sub_100013358()
{
  return _os_log_send_and_compose_impl();
}

double sub_100013380(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void sub_1000133B8(uint64_t a1)
{
  free(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  uint64_t v2 = *(void **)(a1 + 272);
  if (v2) {
    os_release(v2);
  }

  sub_10003DE34(a1 + 16);
}

uint64_t sub_100013408(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100012F9C();
  *(void *)(v4 + 40) = a2;
  long long v5 = *(_OWORD *)(a1 + 344);
  *(_OWORD *)(v4 + 280) = *(_OWORD *)(a1 + 328);
  *(_OWORD *)(v4 + 296) = v5;
  sub_10003DB40(v4 + 16, (int)"com.apple.security.cryptexd", "proc");
  return v4;
}

uint64_t sub_100013470(uint64_t a1)
{
  kern_return_t v13;
  unsigned int v14;
  const char *v15;
  int v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  const char *v20;
  unsigned int v21;
  const char *v22;
  int v23;
  NSObject *v24;
  unsigned int v25;
  const char *v26;
  int v27;
  const char *v28;
  int v29;
  NSObject *v30;
  const char *v31;
  int *v32;
  int v33;
  const char *v34;
  int v35;
  NSObject *v36;
  const char *v37;
  BOOL v38;
  kern_return_t v39;
  unsigned int v40;
  const char *v41;
  NSObject *v42;
  const char *v43;
  int v44;
  const char *v45;
  int v46;
  NSObject *v47;
  const char *v48;
  int v49;
  int *v50;
  char *v51;
  char *v52;
  const char *v53;
  int v54;
  NSObject *v55;
  const char *v56;
  const char *v57;
  int v58;
  NSObject *v59;
  const char *v60;
  const char *v62;
  int v63;
  const char *v64;
  NSObject *v65;
  const char *v66;
  int v67;
  const char *v68;
  void *v69;
  void *v70;
  const char *v71;
  int v72;
  NSObject *v73;
  const char *v74;
  char *v75;
  const char *v76;
  int v77;
  NSObject *v78;
  const char *v79;
  const char *v80;
  char *v81;
  uint64_t v82;
  mach_msg_type_number_t task_info_outCnt;
  audit_token_t task_info_out;
  mach_port_name_t tn;
  void *v86;
  void *v87;
  audit_token_t buf;
  _OWORD buffer[3];
  char v90[152];
  char __str[608];

  v86 = 0;
  int v87 = 0;
  bzero(__str, 0x260uLL);
  int v2 = proc_pidinfo(*(_DWORD *)(a1 + 300), 18, 0, (void *)(a1 + 80), 192);
  if (v2 != 192)
  {
    __int16 v44 = v2;
    uint64_t v4 = *__error();
    int v45 = *(const char **)(a1 + 16);
    __int16 v46 = *__error();
    int v47 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      v48 = "[anonymous]";
      int v49 = *(_DWORD *)(a1 + 300);
      if (v45) {
        v48 = v45;
      }
      LODWORD(buffer[0]) = 136446978;
      *(void *)((char *)buffer + 4) = v48;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = v49;
      WORD1(buffer[1]) = 1024;
      DWORD1(buffer[1]) = v44;
      WORD4(buffer[1]) = 1024;
      *(_DWORD *)((char *)&buffer[1] + 10) = v4;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}s: proc_pidinfo[%d]: ret = %d: %{darwin.errno}d", (uint8_t *)buffer, 0x1Eu);
    }
    v50 = __error();
    v51 = 0;
    goto LABEL_52;
  }
  v82 = a1 + 280;
  __strlcpy_chk();
  uint64_t v3 = 38;
  snprintf(__str, 0x26uLL, "%s.%d@%d", (const char *)(a1 + 48), *(_DWORD *)(a1 + 300), *(_DWORD *)(a1 + 308));
  sub_10003DB74(a1 + 16, __str);
  uint64_t v4 = 0xFFFFFFFFLL;
  int v5 = *(_DWORD *)(a1 + 96);
  uint64_t v6 = 1;
  while (1)
  {
    uint64_t v7 = v3;
    tn = 0;
    memset(v90, 0, 144);
    memset(buffer, 0, sizeof(buffer));
    memset(&task_info_out, 0, sizeof(task_info_out));
    task_info_outCnt = 8;
    uint64_t v8 = *(const char **)(a1 + 16);
    int v9 = *__error();
    uint64_t v10 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      buf.val[0] = 136446722;
      uint64_t v11 = "[anonymous]";
      if (v8) {
        uint64_t v11 = v8;
      }
      *(void *)&buf.val[1] = v11;
      LOWORD(buf.val[3]) = 2048;
      *(void *)((char *)&buf.val[3] + 2) = v6;
      HIWORD(buf.val[5]) = 1024;
      buf.val[6] = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}s: examining ancestor[%lu]: %d", (uint8_t *)&buf, 0x1Cu);
    }
    *__error() = v9;
    int v12 = proc_pidinfo(v5, 18, 0, buffer, 192);
    if (v12 == 192)
    {
      if (v5)
      {
        uint64_t v13 = task_name_for_pid(mach_task_self_, v5, &tn);
        if (v13)
        {
          int v14 = v13;
          int v15 = *(const char **)(a1 + 16);
          xpc_object_t v16 = *__error();
          xpc_object_t v17 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            buf.val[0] = 136446722;
            uint64_t v18 = "[anonymous]";
            if (v15) {
              uint64_t v18 = v15;
            }
            *(void *)&buf.val[1] = v18;
            LOWORD(buf.val[3]) = 1024;
            *(unsigned int *)((char *)&buf.val[3] + 2) = v14;
            HIWORD(buf.val[4]) = 1024;
            buf.val[5] = 3;
            uint64_t v19 = v17;
            int v20 = "%{public}s: task_name_for_pid: %#x: %{darwin.errno}d";
LABEL_39:
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&buf, 0x18u);
            goto LABEL_40;
          }
          goto LABEL_40;
        }
        int v39 = task_info(tn, 0xFu, (task_info_t)&task_info_out, &task_info_outCnt);
        if (v39)
        {
          v40 = v39;
          int v41 = *(const char **)(a1 + 16);
          xpc_object_t v16 = *__error();
          uint64_t v42 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            buf.val[0] = 136446722;
            BOOL v43 = "[anonymous]";
            if (v41) {
              BOOL v43 = v41;
            }
            *(void *)&buf.val[1] = v43;
            LOWORD(buf.val[3]) = 1024;
            *(unsigned int *)((char *)&buf.val[3] + 2) = v40;
            HIWORD(buf.val[4]) = 1024;
            buf.val[5] = 3;
            uint64_t v19 = v42;
            int v20 = "%{public}s: task_info: %#x: %{darwin.errno}d";
            goto LABEL_39;
          }
LABEL_40:
          *__error() = v16;
          uint64_t v4 = 3;
          __int16 v27 = 11;
          goto LABEL_41;
        }
        long long buf = task_info_out;
        __int16 v33 = audit_token_to_pidversion(&buf);
      }
      else
      {
        int v28 = *(const char **)(a1 + 16);
        __int16 v29 = *__error();
        int v30 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          __int16 v31 = "[anonymous]";
          if (v28) {
            __int16 v31 = v28;
          }
          buf.val[0] = 136446210;
          *(void *)&buf.val[1] = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%{public}s: hit kernel_task; assuming ppid version of 0",
            (uint8_t *)&buf,
            0xCu);
        }
        uint64_t v32 = __error();
        __int16 v33 = 0;
        *uint64_t v32 = v29;
      }
      snprintf(&__str[v7], 0x26uLL, "%s.%d.%d", v90, v5, v33);
      __int16 v34 = *(const char **)(a1 + 16);
      int v35 = *__error();
      NSFileAttributeKey v36 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        buf.val[0] = 136446722;
        uint64_t v37 = "[anonymous]";
        if (v34) {
          uint64_t v37 = v34;
        }
        *(void *)&buf.val[1] = v37;
        LOWORD(buf.val[3]) = 2048;
        *(void *)((char *)&buf.val[3] + 2) = v6;
        HIWORD(buf.val[5]) = 2080;
        *(void *)&buf.val[6] = &__str[v7];
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%{public}s: setting ancestor[%lu]: %s", (uint8_t *)&buf, 0x20u);
      }
      *__error() = v35;
      uint64_t v38 = v5 == 0;
      int v5 = v5 ? LODWORD(buffer[1]) : 0;
      __int16 v27 = v38 ? 11 : 0;
    }
    else
    {
      int v21 = v12;
      uint64_t v4 = *__error();
      int v22 = *(const char **)(a1 + 16);
      unint64_t v23 = *__error();
      uint64_t v24 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        unint64_t v25 = *(_DWORD *)(a1 + 300);
        uint64_t v26 = "[anonymous]";
        if (v22) {
          uint64_t v26 = v22;
        }
        buf.val[0] = 136446978;
        *(void *)&buf.val[1] = v26;
        LOWORD(buf.val[3]) = 1024;
        *(unsigned int *)((char *)&buf.val[3] + 2) = v25;
        HIWORD(buf.val[4]) = 1024;
        buf.val[5] = v21;
        LOWORD(buf.val[6]) = 1024;
        *(unsigned int *)((char *)&buf.val[6] + 2) = v4;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s: proc_pidinfo[%d]: ret = %d: %{darwin.errno}d", (uint8_t *)&buf, 0x1Eu);
      }
      *__error() = v23;
      __int16 v27 = 6;
    }
LABEL_41:
    if (tn - 1 <= 0xFFFFFFFD) {
      mach_right_send_release();
    }
    if (v27) {
      break;
    }
    ++v6;
    uint64_t v3 = v7 + 38;
    if (v7 == 570) {
      goto LABEL_54;
    }
  }
  if (v27 != 11)
  {
    v51 = 0;
    goto LABEL_68;
  }
LABEL_54:
  BOOL v52 = (char *)malloc_type_calloc(1uLL, 0x100uLL, 0x61D5536CuLL);
  if (!v52) {
    sub_100042598(&task_info_out, buffer);
  }
  v51 = v52;
  do
  {
    snprintf(v51, 0x100uLL, "%s->%s", v51, &__str[v7]);
    v7 -= 38;
  }
  while (v7);
  int v53 = *(const char **)(a1 + 16);
  int v54 = *__error();
  int v55 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    int v56 = "[anonymous]";
    if (v53) {
      int v56 = v53;
    }
    LODWORD(buffer[0]) = 136446466;
    *(void *)((char *)buffer + 4) = v56;
    WORD6(buffer[0]) = 2080;
    *(void *)((char *)buffer + 14) = v51;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "%{public}s: ancestry = %s", (uint8_t *)buffer, 0x16u);
  }
  *__error() = v54;
  uint64_t v4 = sub_100013F2C(v82, 11, (int8x8_t **)&v87);
  uint64_t v57 = *(const char **)(a1 + 16);
  __int16 v58 = *__error();
  pid_t v59 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      __int16 v60 = "[anonymous]";
      if (v57) {
        __int16 v60 = v57;
      }
      LODWORD(buffer[0]) = 136446466;
      *(void *)((char *)buffer + 4) = v60;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = v4;
      _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%{public}s: copy csblob [csid]: %{darwin.errno}d", (uint8_t *)buffer, 0x12u);
    }
    *__error() = v58;
    goto LABEL_68;
  }
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
  {
    v62 = "[anonymous]";
    if (v57) {
      v62 = v57;
    }
    int v63 = *((_DWORD *)v87 + 1) - 8;
    LODWORD(buffer[0]) = 136446722;
    *(void *)((char *)buffer + 4) = v62;
    WORD6(buffer[0]) = 1040;
    *(_DWORD *)((char *)buffer + 14) = v63;
    WORD1(buffer[1]) = 2096;
    *(void *)((char *)&buffer[1] + 4) = (char *)v87 + 8;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "%{public}s: identity blob = %.*P", (uint8_t *)buffer, 0x1Cu);
  }
  *__error() = v58;
  uint64_t v4 = sub_100013F2C(v82, 7, (int8x8_t **)&v86);
  int v64 = *(const char **)(a1 + 16);
  __int16 v46 = *__error();
  v65 = *(NSObject **)(a1 + 32);
  if (v4)
  {
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      v66 = "[anonymous]";
      if (v64) {
        v66 = v64;
      }
      LODWORD(buffer[0]) = 136446466;
      *(void *)((char *)buffer + 4) = v66;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = v4;
      _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%{public}s: copy csblob [entitlements]: %{darwin.errno}d", (uint8_t *)buffer, 0x12u);
    }
    v50 = __error();
LABEL_52:
    const char *v50 = v46;
    goto LABEL_68;
  }
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
  {
    v67 = *((_DWORD *)v86 + 1);
    unint64_t v68 = "[anonymous]";
    if (v64) {
      unint64_t v68 = v64;
    }
    LODWORD(buffer[0]) = 136446722;
    *(void *)((char *)buffer + 4) = v68;
    WORD6(buffer[0]) = 1040;
    *(_DWORD *)((char *)buffer + 14) = v67 - 8;
    WORD1(buffer[1]) = 2096;
    *(void *)((char *)&buffer[1] + 4) = (char *)v86 + 8;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "%{public}s: entitlements blob = %.*P", (uint8_t *)buffer, 0x1Cu);
  }
  *__error() = v46;
  v69 = (void *)xpc_create_from_plist();
  v70 = v69;
  if (!v69 || xpc_get_type(v69) != (xpc_type_t)&_xpc_type_dictionary)
  {
    int v71 = *(const char **)(a1 + 16);
    v72 = *__error();
    v73 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
    {
      v74 = "[anonymous]";
      if (v71) {
        v74 = v71;
      }
      LODWORD(buffer[0]) = 136446466;
      *(void *)((char *)buffer + 4) = v74;
      WORD6(buffer[0]) = 1024;
      *(_DWORD *)((char *)buffer + 14) = 90;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_ERROR, "%{public}s: entitlements not a dictionary: %{darwin.errno}d", (uint8_t *)buffer, 0x12u);
    }
    *__error() = v72;
    uint64_t v4 = 90;
    if (!v70) {
      goto LABEL_68;
    }
LABEL_102:
    os_release(v70);
    goto LABEL_68;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG))
  {
    int v75 = xpc_copy_description(v70);
    int v76 = *(const char **)(a1 + 16);
    v77 = *__error();
    v78 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v79 = "[anonymous]";
      if (v76) {
        uint64_t v79 = v76;
      }
      LODWORD(buffer[0]) = 136446466;
      *(void *)((char *)buffer + 4) = v79;
      WORD6(buffer[0]) = 2080;
      *(void *)((char *)buffer + 14) = v75;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEBUG, "%{public}s: entitlements = %s", (uint8_t *)buffer, 0x16u);
    }
    *__error() = v77;
    free(v75);
  }
  *(void *)(a1 + 64) = v51;
  v80 = (char *)v87 + 8;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v81 = strdup(v80);
      if (v81) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v81 = strdup(v80);
    if (!v81) {
      sub_100042650(v80, &task_info_out, buffer);
    }
  }
  *(void *)(a1 + 72) = v81;
  v51 = 0;
  uint64_t v4 = 0;
  *(void *)(a1 + 272) = os_retain(v70);
  if (v70) {
    goto LABEL_102;
  }
LABEL_68:
  free(v51);
  free(v86);
  free(v87);
  return v4;
}

uint64_t sub_100013F2C(uint64_t a1, uint64_t a2, int8x8_t **a3)
{
  uint64_t v4 = (int8x8_t *)malloc_type_malloc(0x408uLL, 0x18EC0261uLL);
  if (!v4) {
    sub_100042728(&v11, v12);
  }
  int v5 = v4;
  if ((csops_audittoken() & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v6 = *__error();
  if (v6)
  {
    if (v6 != 34) {
      goto LABEL_8;
    }
    uint64_t v7 = (int8x8_t *)malloc_type_realloc(v5, bswap32(v5->u32[1]), 0x387A0C8uLL);
    if (!v7)
    {
      uint64_t v8 = __error();
      goto LABEL_11;
    }
    int v5 = v7;
    if (csops_audittoken())
    {
LABEL_8:
      uint64_t v8 = __error();
      int v5 = 0;
LABEL_11:
      uint64_t v9 = *v8;
      goto LABEL_12;
    }
  }
  uint64_t v9 = 0;
  int8x8_t *v5 = vrev32_s8(*v5);
  *a3 = v5;
  int v5 = 0;
LABEL_12:
  free(v5);
  return v9;
}

BOOL sub_1000140A0(uint64_t a1, const char *a2)
{
  return a2 && !xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 272), a2);
}

uint64_t sub_1000140F0()
{
  return _os_log_send_and_compose_impl();
}

uint64_t sub_10001411C(void *object, uint64_t a2, unsigned char *a3)
{
  uint64_t v6 = *(void *)(a2 + 24);
  if (v6 == 2)
  {
    uint64_t v8 = (dispatch_queue_t *)sub_100016EB4();
    uint64_t v9 = daemon_open_mountable_unpack();
    if (v9)
    {
      uint64_t v7 = v9;
      if (!v8) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v11 = sub_10002D0DC(object, (unsigned char *)a2, a3);
      dispatch_async_f(v8[12], v11, (dispatch_function_t)sub_10001422C);
      uint64_t v7 = 36;
    }
    os_release(v8);
    if (!object) {
      return v7;
    }
    goto LABEL_12;
  }
  if (v6 == 1)
  {
    uint64_t v7 = 78;
    if (!object) {
      return v7;
    }
    goto LABEL_12;
  }
  uint64_t v7 = daemon_version_unpack();
  if (!v7) {
    daemon_version_reply_pack();
  }
  sub_10003D524(a2, a3, v7);
LABEL_11:
  if (object) {
LABEL_12:
  }
    os_release(object);
  return v7;
}

void sub_10001422C(void *a1)
{
  uint64_t v19 = a1;
  uint64_t v2 = *a1;
  uint64_t v3 = sub_100016EB4();
  long long v43 = 0u;
  memset(v44, 0, sizeof(v44));
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  *(_OWORD *)__str = 0u;
  int v18 = -1;
  uint64_t v4 = sub_100013408(a1[3], 0);
  int v5 = sub_100013470(v4);
  if (v5)
  {
    int v6 = v5;
    uint64_t v7 = (const char *)v3[7];
    int v8 = *__error();
    uint64_t v9 = v3[9];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = "[anonymous]";
      if (v7) {
        uint64_t v10 = v7;
      }
      *(_DWORD *)long long buf = 136446466;
      int v21 = v10;
      __int16 v22 = 1024;
      LODWORD(v23) = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s: failed to resolve proc: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v8;
  }
  else
  {
    BOOL v11 = sub_1000140A0(v4, "com.apple.private.security.cryptex.open-mountable");
    if (v11)
    {
      int v6 = v11;
      int v12 = *(const char **)(v2 + 16);
      int v13 = *__error();
      int v14 = *(NSObject **)(v2 + 32);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v15 = "[anonymous]";
        if (v12) {
          int v15 = v12;
        }
        uint64_t v16 = *(void *)(v4 + 64);
        uint64_t v17 = *(void *)(v4 + 72);
        *(_DWORD *)long long buf = 136447234;
        int v21 = v15;
        __int16 v22 = 2080;
        unint64_t v23 = "com.apple.private.security.cryptex.install";
        __int16 v24 = 2080;
        uint64_t v25 = v16;
        __int16 v26 = 2080;
        uint64_t v27 = v17;
        __int16 v28 = 1024;
        int v29 = v6;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}s: proc not entitled for to open mountable: entitlement = %s, proc = %s, signing id = %s: %{darwin.errno}d", buf, 0x30u);
      }
      *__error() = v13;
    }
    else
    {
      snprintf(__str, 0xFFuLL, "%s.XXXXXX", (const char *)(v4 + 48));
      int v6 = sub_10001755C((uint64_t)v3, (uint64_t)&unk_100059DA0, __str, &v18);
      if (!v6) {
        daemon_open_mountable_reply_pack();
      }
    }
  }
  sub_10002D130((uint64_t *)&v19, v6);
  if (v4) {
    os_release((void *)v4);
  }
  if (v3) {
    os_release(v3);
  }
}

CFErrorRef sub_1000144A4(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  *((void *)&v64 + 1) = 0;
  long long v65 = 0uLL;
  if (*(void *)(a1 + 8) > 0x1000uLL)
  {
    if (a2[13]) {
      os_log_type_enabled((os_log_t)a2[13], OS_LOG_TYPE_ERROR);
    }
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = 84;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v10 = sub_10000BF78("sm_bootstrap_service", "sm.c", 244, "com.apple.security.cryptex.posix", 84, 0, v9);
    free(v9);
    BOOL v11 = 0;
    int v8 = 0;
    goto LABEL_10;
  }
  uint64_t v7 = (void *)xpc_create_from_plist();
  int v8 = v7;
  if (!v7 || xpc_get_type(v7) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (a2[13]) {
      os_log_type_enabled((os_log_t)a2[13], OS_LOG_TYPE_ERROR);
    }
    *(_DWORD *)long long buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = 22;
    int v12 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v10 = sub_10000BF78("sm_bootstrap_service", "sm.c", 251, "com.apple.security.cryptex.posix", 22, 0, v12);
    free(v12);
    BOOL v11 = 0;
    goto LABEL_10;
  }
  int v14 = *__error();
  int v15 = a2[13];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v8;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "frobbing plist: %@", buf, 0xCu);
  }
  *__error() = v14;
  uint64_t v16 = (const char *)a2[1];
  long long v63 = *a2;
  char v61 = v63;
  unint64_t v17 = a2[11];
  *(void *)&long long v64 = v16;
  *(void *)&long long v65 = v17;
  int v60 = *((_DWORD *)a2 + 24);
  DWORD2(v65) = v60;
  *(void *)&long long xdict = a2[14];
  *((void *)&xdict + 1) = a2[13];
  long long v66 = xdict;
  uint64_t v67 = a3;
  int v18 = (char *)malloc_type_malloc(0x400uLL, 0x18EC0261uLL);
  if (!v18) {
    sub_1000427E0(__str, buf);
  }
  BOOL v11 = v18;
  snprintf(v18, 0x400uLL, "%s", v16);
  if (*((int *)a2 + 20) >= 1)
  {
    uint64_t v19 = 0;
    while (1)
    {
      *(void *)long long buf = 0;
      int v20 = asprintf((char **)buf, ":%s", (const char *)a2[v19 + 2]);
      if ((int)(v20 + strlen(v11)) >= 1024) {
        break;
      }
      __strlcat_chk();
      free(*(void **)buf);
      if (++v19 >= *((int *)a2 + 20)) {
        goto LABEL_21;
      }
    }
    long long v32 = a2[13];
    if (v32) {
      os_log_type_enabled(v32, OS_LOG_TYPE_ERROR);
    }
    *(_DWORD *)__str = 67109120;
    *(_DWORD *)&__str[4] = 22;
    long long v42 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v10 = sub_10000BF78("sm_bootstrap_service", "sm.c", 275, "com.apple.security.cryptex.posix", 22, 0, v42);
    free(v42);
    long long v41 = *(char **)buf;
    goto LABEL_53;
  }
LABEL_21:
  *((void *)&v64 + 1) = v11;
  xpc_object_t v21 = xpc_copy(v8);
  bzero(buf, 0x400uLL);
  bzero(__str, 0x400uLL);
  string = xpc_dictionary_get_string(v21, "Label");
  if (!string)
  {
    int v33 = *__error();
    long long v34 = *((void *)&xdict + 1);
    if (!os_log_type_enabled(*((os_log_t *)&xdict + 1), OS_LOG_TYPE_ERROR))
    {
LABEL_42:
      *__error() = v33;
      if (v21) {
        os_release(v21);
      }
      long long v36 = a2[13];
      if (v36) {
        os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
      }
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      __int16 v75 = 1024;
      int v76 = 22;
      long long v40 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef v10 = sub_10000BF78("sm_bootstrap_service", "sm.c", 286, "com.apple.security.cryptex.posix", 22, 0, v40);
      long long v41 = v40;
LABEL_53:
      free(v41);
LABEL_10:
      free(v11);
      goto LABEL_11;
    }
    *(_WORD *)unint64_t v68 = 0;
    long long v35 = "missing label";
LABEL_41:
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v35, v68, 2u);
    goto LABEL_42;
  }
  unint64_t v23 = string;
  sub_100015334((uint64_t)&v63, (uint64_t)"Label", string, buf);
  xpc_dictionary_set_string(v21, "Label", buf);
  __strlcpy_chk();
  __int16 v24 = xpc_dictionary_get_string(v21, "Program");
  if (v24)
  {
    *((void *)&xdict + 1) = v23;
    sub_100015450((uint64_t)&v63, (uint64_t)"Program", v24, buf);
    xpc_dictionary_set_string(v21, "Program", buf);
    goto LABEL_24;
  }
  xpc_object_t array = xpc_dictionary_get_array(v21, "ProgramArguments");
  if (!array)
  {
    int v33 = *__error();
    long long v34 = *((void *)&xdict + 1);
    if (!os_log_type_enabled(*((os_log_t *)&xdict + 1), OS_LOG_TYPE_ERROR)) {
      goto LABEL_42;
    }
    *(_WORD *)unint64_t v68 = 0;
    long long v35 = "missing argv";
    goto LABEL_41;
  }
  long long v38 = array;
  if (!xpc_array_get_count(array))
  {
    int v33 = *__error();
    long long v34 = *((void *)&xdict + 1);
    if (!os_log_type_enabled(*((os_log_t *)&xdict + 1), OS_LOG_TYPE_ERROR)) {
      goto LABEL_42;
    }
    *(_WORD *)unint64_t v68 = 0;
    long long v35 = "empty argv";
    goto LABEL_41;
  }
  long long v39 = xpc_array_get_string(v38, 0);
  if (!v39)
  {
    int v33 = *__error();
    long long v34 = *((void *)&xdict + 1);
    if (!os_log_type_enabled(*((os_log_t *)&xdict + 1), OS_LOG_TYPE_ERROR)) {
      goto LABEL_42;
    }
    *(_WORD *)unint64_t v68 = 0;
    long long v35 = "bad argv0";
    goto LABEL_41;
  }
  *((void *)&xdict + 1) = v23;
  if (*v39 == 47)
  {
    sub_100015450((uint64_t)&v63, (uint64_t)"ProgramArguments", v39, buf);
    xpc_array_set_string(v38, 0, buf);
  }
LABEL_24:
  __strlcpy_chk();
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(v21, "EnvironmentVariables");
  if (!dictionary)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_value(v21, "EnvironmentVariables", empty);
    xpc_object_t dictionary = xpc_dictionary_get_dictionary(v21, "EnvironmentVariables");
    if (empty) {
      os_release(empty);
    }
  }
  xpc_dictionary_set_string(dictionary, "CRYPTEX_MOUNT_PATH", v16);
  xpc_object_t v27 = xpc_dictionary_get_dictionary(v21, "MachServices");
  if (v27)
  {
    long long v70 = v65;
    long long v71 = v66;
    uint64_t v72 = v67;
    *(_OWORD *)unint64_t v68 = v63;
    long long v69 = v64;
    xpc_object_t v28 = xpc_copy(v27);
    *(void *)&v68[8] = v28;
    xpc_dictionary_apply_f();
    xpc_dictionary_set_value(v21, "MachServices", v28);
    if (v28) {
      os_release(v28);
    }
  }
  *(unsigned char *)(a3 + 1152) = xpc_dictionary_get_dictionary(v21, "RemoteServices") != 0;
  if ((v61 & 8) != 0) {
    xpc_dictionary_set_string(v21, "_SubsystemRoot", v11);
  }
  if ((v61 & 0x40) != 0)
  {
    int v29 = (const char *)sub_10000F9CC();
    snprintf(__str, 0x400uLL, "%s/%s", v16, v29);
    xpc_dictionary_set_string(dictionary, "PYTHONPATH", __str);
  }
  if ((void)xdict)
  {
    xpc_object_t v30 = xpc_dictionary_get_dictionary((xpc_object_t)xdict, "CRYPTEX_SESSION");
    xpc_object_t v31 = v30 ? xpc_copy(v30) : xpc_dictionary_create_empty();
    long long v43 = v31;
    xpc_object_t v44 = xpc_dictionary_get_dictionary((xpc_object_t)xdict, *((const char **)&xdict + 1));
    sub_1000400E8((uint64_t)v43, v44);
    sub_1000400E8((uint64_t)v21, v43);
    if (v43) {
      os_release(v43);
    }
  }
  *((void *)&v63 + 1) = v21;
  if (os_log_type_enabled((os_log_t)a2[13], OS_LOG_TYPE_DEBUG))
  {
    int v45 = xpc_copy_description(v8);
    __int16 v46 = xpc_copy_description(v21);
    int v47 = *__error();
    v48 = a2[13];
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = v45;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "frobbed initial plist: %s", buf, 0xCu);
    }
    *__error() = v47;
    int v49 = *__error();
    v50 = a2[13];
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = v46;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "frobbed final plist: %s", buf, 0xCu);
    }
    *__error() = v49;
    free(v46);
    free(v45);
  }
  if ((*a2 & 4) != 0)
  {
    int v53 = *__error();
    int v54 = a2[13];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = a3;
      int v55 = "dry run; skipping bootstrap: %s";
LABEL_79:
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, v55, buf, 0xCu);
    }
  }
  else
  {
    if ((*a2 & 0x80) != 0)
    {
      if (sub_10003F4A4(v21, "_LimitLoadFromBootMode", "rem"))
      {
        int v51 = *__error();
        BOOL v52 = a2[13];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "not injecting _LimitLoadToBootMode=>rem; _LimitLoadFromBootMode=>rem already exists",
            buf,
            2u);
        }
        *__error() = v51;
      }
      else
      {
        sub_10003F38C(v21, "_LimitLoadToBootMode", "rem");
      }
    }
    CFErrorRef v56 = sub_10003B9F0(v21, v60, a4);
    if (v56)
    {
      CFErrorRef v57 = v56;
      __int16 v58 = a2[13];
      if (v58) {
        os_log_type_enabled(v58, OS_LOG_TYPE_ERROR);
      }
      *(_WORD *)long long buf = 0;
      pid_t v59 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef v10 = sub_10000BF78("sm_bootstrap_service", "sm.c", 329, "com.apple.security.cryptex", 14, v57, v59);
      free(v59);
      CFRelease(v57);
      goto LABEL_84;
    }
    int v53 = *__error();
    int v54 = a2[13];
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)&uint8_t buf[4] = a3;
      int v55 = "bootstrapped plist: %s";
      goto LABEL_79;
    }
  }
  CFErrorRef v10 = 0;
  *__error() = v53;
LABEL_84:
  free(v11);
  if (v21) {
    os_release(v21);
  }
LABEL_11:
  if (v8) {
    os_release(v8);
  }
  return v10;
}

uint64_t sub_1000151FC(char *a1, uint64_t a2)
{
  CFStringRef v4 = sub_10000BC8C(a1);
  if ((*(void *)a2 & 4) != 0)
  {
    int v6 = *__error();
    uint64_t v7 = *(NSObject **)(a2 + 104);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    int v10 = 136315138;
    BOOL v11 = a1;
    int v8 = "dry run; skipping unbootstrap: %s";
  }
  else
  {
    uint64_t v5 = *(unsigned int *)(a2 + 96);
    if ((*(void *)a2 & 0x20) != 0) {
      sub_10003B580(v5, (uint64_t)v4);
    }
    else {
      sub_10003B7AC(v5, (uint64_t)v4, *(void **)(a2 + 104));
    }
    int v6 = *__error();
    uint64_t v7 = *(NSObject **)(a2 + 104);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_10;
    }
    int v10 = 136315138;
    BOOL v11 = a1;
    int v8 = "unbootstrapped plist: %s";
  }
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v10, 0xCu);
LABEL_10:
  *__error() = v6;
  if (v4) {
    CFRelease(v4);
  }
  return 0;
}

int *sub_100015334(uint64_t a1, uint64_t a2, const char *a3, char *__str)
{
  if ((*(unsigned char *)a1 & 1) == 0) {
    return (int *)snprintf(__str, 0x80uLL, "%s", a3);
  }
  snprintf(__str, 0x80uLL, "%s.%#llx", a3, *(void *)(a1 + 32));
  int v9 = *__error();
  int v10 = *(NSObject **)(a1 + 56);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v12 = a2;
    __int16 v13 = 2080;
    int v14 = a3;
    __int16 v15 = 2080;
    uint64_t v16 = __str;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%s: %s -> %s", buf, 0x20u);
  }
  double result = __error();
  int *result = v9;
  return result;
}

int *sub_100015450(uint64_t a1, uint64_t a2, const char *a3, char *a4)
{
  bzero(__str, 0x400uLL);
  int v8 = *(const char **)(a1 + 16);
  if (v8[strlen(v8)] == 47 || *a3 == 47) {
    int v9 = (const char *)&unk_10004C227;
  }
  else {
    int v9 = "/";
  }
  snprintf(__str, 0x400uLL, "%s%s%s", v8, v9, a3);
  memset(&v18, 0, sizeof(v18));
  int v10 = stat(__str, &v18);
  int v11 = *__error();
  uint64_t v12 = *(NSObject **)(a1 + 56);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    int v14 = (char *)a3;
    if (v13)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Path not in cryptex, not frobnicate path", buf, 2u);
      int v14 = (char *)a3;
    }
  }
  else
  {
    if (v13)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Path exists in cryptex, frobnicate path", buf, 2u);
    }
    int v14 = __str;
  }
  *__error() = v11;
  strlcpy(a4, v14, 0x400uLL);
  int v15 = *__error();
  uint64_t v16 = *(NSObject **)(a1 + 56);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 136315650;
    uint64_t v20 = a2;
    __int16 v21 = 2080;
    __int16 v22 = a3;
    __int16 v23 = 2080;
    __int16 v24 = a4;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s: %s -> %s", buf, 0x20u);
  }
  double result = __error();
  int *result = v15;
  return result;
}

void sub_10001565C(const char *a1, void *a2, uint64_t a3)
{
  memset(v5, 0, sizeof(v5));
  sub_100015334(a3, (uint64_t)"MachServices", a1, (char *)v5);
  xpc_dictionary_set_value(*(xpc_object_t *)(a3 + 8), (const char *)v5, a2);
}

void sub_1000159A4(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (a2 == 2)
  {
    [*(id *)(a1 + 32) handlePublisherInitialBarrier];
  }
  else if (a2 == 1)
  {
    [*(id *)(a1 + 32) handlePublisherRemoveToken:a3];
  }
  else if (a2)
  {
    int v8 = *__error();
    int v9 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      v10[0] = 67109376;
      v10[1] = a2;
      __int16 v11 = 1024;
      int v12 = 22;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "Unexpected publisher action: %d: %{darwin.errno}d", (uint8_t *)v10, 0xEu);
    }

    *__error() = v8;
  }
  else
  {
    [*(id *)(a1 + 32) handlePublisherAddToken:a3 descriptor:v7];
  }
}

id sub_100015AD4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handlePublisherError:a2];
}

void sub_100015B94(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(void))
{
  a4[2](a4);
}

void sub_100015C78(uint64_t a1, uint64_t a2, void *a3)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100015D08;
  v5[3] = &unk_100059CA8;
  CFStringRef v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  xpc_array_apply(a3, v5);
}

uint64_t sub_100015D08(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  string = xpc_array_get_string(v4, 0);
  id v7 = xpc_array_get_string(v4, 1uLL);

  int v8 = +[NSString stringWithUTF8String:string];
  [v5 setObject:v8 forKeyedSubscript:@"Identifier"];

  int v9 = +[NSString stringWithUTF8String:v7];
  [v5 setObject:v9 forKeyedSubscript:@"Version"];

  int v10 = *(void **)(a1 + 32);
  __int16 v11 = +[NSString stringWithUTF8String:string];
  uint64_t v15 = *(void *)(a1 + 40);
  int v12 = +[NSArray arrayWithObjects:&v15 count:1];
  id v13 = [v10 broadcastEvent:1 forCryptex:v11 withInfo:v5 toClients:v12];

  return 1;
}

void sub_100016154(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100016300(_Unwind_Exception *exception_object)
{
}

void sub_1000165B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100016A0C(_Unwind_Exception *a1)
{
}

id sub_100016A9C()
{
  if (qword_10005E830 != -1) {
    dispatch_once(&qword_10005E830, &stru_100059CF0);
  }
  uint64_t v0 = (void *)qword_10005E838;

  return v0;
}

void sub_100016AF0(id a1)
{
  qword_10005E838 = [[EventServer alloc] initWithEventStream:"com.apple.security.cryptex.events"];

  _objc_release_x1();
}

uint64_t sub_100016B3C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  int v8 = +[NSString stringWithUTF8String:a3];
  int v9 = [v7 broadcastEvent:a2 forCryptex:v8 withInfo:a4];

  if (v9)
  {
    int v10 = *__error();
    __int16 v11 = [v7 log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v14 = 134218754;
      uint64_t v15 = a2;
      __int16 v16 = 2080;
      uint64_t v17 = a3;
      __int16 v18 = 2112;
      uint64_t v19 = v9;
      __int16 v20 = 1024;
      int v21 = 72;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to broadcast event 0x%llx about cryptex '%s': %@: %{darwin.errno}d", (uint8_t *)&v14, 0x26u);
    }

    *__error() = v10;
    uint64_t v12 = 72;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

uint64_t sub_100016C90()
{
  if (_dispatch_is_multithreaded()) {
    sub_1000415D0();
  }
  uint64_t v0 = sub_100016DB8("system", 0);
  sub_10000A564();
  cryptex_set_target_queue();
  uint64_t result = cryptex_activate();
  qword_10005E840 = v0;
  return result;
}

void sub_100016CEC(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 1360)) {
    sub_1000428C0(&v3, v4);
  }
  for (uint64_t i = 0; i != 72; i += 8)
    close_drop_np();
  dispatch_release(*(dispatch_object_t *)(a1 + 104));
  dispatch_release(*(dispatch_object_t *)(a1 + 112));
  dispatch_release(*(dispatch_object_t *)(a1 + 96));

  sub_10003DE34(a1 + 56);
}

uint64_t sub_100016DB8(const char *a1, uint64_t a2)
{
  uint64_t v4 = sub_100012E14();
  *(void *)(v4 + 80) = a2;
  *(void *)(v4 + 88) = v4;
  *(void *)(v4 + 96) = dispatch_queue_create("com.apple.security.cryptexd.codex.iodq", 0);
  *(void *)(v4 + 104) = dispatch_group_create();
  *(void *)(v4 + 112) = dispatch_group_create();
  sub_10003C23C((_OWORD *)(v4 + 144));
  sub_10003C23C((_OWORD *)(v4 + 448));
  sub_10003C23C((_OWORD *)(v4 + 752));
  sub_10003C23C((_OWORD *)(v4 + 1056));
  *(void *)(v4 + 120) = 0;
  *(void *)(v4 + 128) = v4 + 120;
  *(void *)(v4 + 1368) = 0;
  *(void *)(v4 + 1376) = v4 + 1368;
  *(_DWORD *)(v4 + 1384) = -1;
  *(void *)(v4 + 1392) = -1;
  *(void *)(v4 + 1400) = -1;
  sub_10003DB40(v4 + 56, (int)"com.apple.security.cryptexd", "codex");
  sub_10003DB74(v4 + 56, a1);
  sub_10000A564();
  cryptex_init();
  return v4;
}

void *sub_100016EB4()
{
  return os_retain((void *)qword_10005E840);
}

uint64_t sub_100016EC0(uint64_t a1)
{
  for (uint64_t i = 0; i != 72; i += 8)
  {
    uint64_t v3 = *(uint64_t **)((char *)&off_100059D10 + i);
    uint64_t v4 = sub_10000A548();
    id v5 = v4;
    long long v42 = 0u;
    memset(v43, 0, sizeof(v43));
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    *(_OWORD *)__str = 0u;
    long long v30 = 0u;
    int v28 = -1;
    id v6 = (char *)v3[1];
    if (v6)
    {
      int v7 = *(_DWORD *)(a1 + 1384);
      uint64_t v8 = *v3;
      if ((*v3 & 2) != 0)
      {
        if ((v8 & 4) == 0)
        {
          if (v8) {
            int v7 = v4[23];
          }
          else {
            int v7 = v4[22];
          }
        }
      }
      else if (v8)
      {
        int v7 = *(_DWORD *)(a1 + 1388);
      }
    }
    else
    {
      int v7 = v4[22];
      id v6 = __str;
      snprintf(__str, 0xFFuLL, "codex.%s", *(const char **)(a1 + 56));
      if (*(unsigned char *)v3)
      {
        int v7 = v5[23];
        id v6 = __str;
      }
    }
    int v9 = *(NSObject **)(a1 + 72);
    bzero(v56, 0x400uLL);
    memset(&v55, 0, sizeof(v55));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      if (fstat(v7, &v55) == -1)
      {
        int v15 = *__error();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v16 = *__error();
          *(_DWORD *)long long buf = 136315650;
          *(void *)&uint8_t buf[4] = "rootfd";
          __int16 v45 = 1024;
          int v46 = v7;
          __int16 v47 = 1024;
          LODWORD(v48) = v16;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", buf, 0x18u);
        }
        *__error() = v15;
      }
      else
      {
        if (fcntl(v7, 50, v56))
        {
          int v10 = __error();
          __int16 v11 = strerror(*v10);
          snprintf((char *)v56, 0x400uLL, "[%s]", v11);
        }
        unint64_t v12 = ((unint64_t)v55.st_mode >> 12) ^ 8;
        id v13 = "[unknown]";
        if (v12 != 15) {
          id v13 = off_10005A238[v12];
        }
        int v14 = (void *)os_flagset_copy_string();
        int v27 = *__error();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 136316418;
          *(void *)&uint8_t buf[4] = "rootfd";
          __int16 v45 = 1024;
          int v46 = v7;
          __int16 v47 = 2080;
          v48 = v13;
          __int16 v49 = 2048;
          off_t st_size = v55.st_size;
          __int16 v51 = 2080;
          BOOL v52 = v14;
          __int16 v53 = 2080;
          int v54 = v56;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s", buf, 0x3Au);
        }
        *__error() = v27;
        free(v14);
      }
    }
    int v17 = sub_10003DF4C(v7, v6, 1049344, 0x1FFu, &v28);
    if (v17)
    {
      int v26 = v17;
      *(void *)long long buf = 0;
      memset(v56, 0, 80);
      os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      v55.st_dev = 136315394;
      *(void *)&v55.st_mode = v6;
      WORD2(v55.st_ino) = 1024;
      *(_DWORD *)((char *)&v55.st_ino + 6) = v26;
      _os_log_send_and_compose_impl();
      _os_crash_msg();
      __break(1u);
    }
    *(_DWORD *)(a1 + v3[2]) = v28;
    if (v5) {
      os_release(v5);
    }
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 104));
  dispatch_group_notify_f(*(dispatch_group_t *)(a1 + 104), *(dispatch_queue_t *)(a1 + 24), (void *)a1, (dispatch_function_t)sub_10001A2E8);
  sub_10001A5E8(a1);
  sub_10001A5E8(a1);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
  uint64_t v18 = 0;
  v55.st_dev = -1;
  do
  {
    uint64_t v19 = (*(void **)((char *)&off_100059D10 + v18))[2];
    LODWORD(v56[0]) = *(_DWORD *)(a1 + v19);
    *(_DWORD *)(a1 + v1snprintf(byte_10005E420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = claimfd_np();
    v18 += 8;
  }
  while (v18 != 72);
  int v20 = sub_100017444(a1, (uint64_t)&unk_100048800, "lockdown", 0, 0, &v55);
  if (v20 != 2)
  {
    if (v20) {
      sub_10004293C(__str, v56);
    }
    *(void *)(a1 + 80) |= 4uLL;
    int v21 = *(const char **)(a1 + 56);
    int v22 = *__error();
    __int16 v23 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      __int16 v24 = "[anonymous]";
      if (v21) {
        __int16 v24 = v21;
      }
      LODWORD(v56[0]) = 136446210;
      *(void *)((char *)v56 + 4) = v24;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}s: system codex is locked down", (uint8_t *)v56, 0xCu);
    }
    *__error() = v22;
  }
  uint64_t result = v55.st_dev;
  if (v55.st_dev != -1)
  {
    uint64_t result = close(v55.st_dev);
    if (result == -1) {
      sub_100041A38(__str, v56);
    }
  }
  return result;
}

uint64_t sub_100017444(uint64_t a1, uint64_t a2, char *a3, int a4, uint64_t a5, _DWORD *a6)
{
  int v14 = openat(*(_DWORD *)(a1 + *(void *)(a2 + 16)), a3, a4, a5);
  if (v14 < 0)
  {
    uint64_t v8 = *__error();
    int v9 = *(const char **)(a1 + 56);
    int v10 = *__error();
    __int16 v11 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      unint64_t v12 = "[anonymous]";
      if (v9) {
        unint64_t v12 = v9;
      }
      *(_DWORD *)long long buf = 136446466;
      int v16 = v12;
      __int16 v17 = 1024;
      int v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s: openat: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v10;
  }
  else
  {
    uint64_t v8 = 0;
    *a6 = sub_10003DE70(&v14);
  }
  return v8;
}

uint64_t sub_10001755C(uint64_t a1, uint64_t a2, char *a3, _DWORD *a4)
{
  int v12 = -1;
  uint64_t v6 = sub_10003EE68(*(_DWORD *)(a1 + *(void *)(a2 + 16)), a3, &v12);
  if (v6)
  {
    int v7 = *(const char **)(a1 + 56);
    int v8 = *__error();
    int v9 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = "[anonymous]";
      if (v7) {
        int v10 = v7;
      }
      *(_DWORD *)long long buf = 136446466;
      int v14 = v10;
      __int16 v15 = 1024;
      int v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s: mkodtempat: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v8;
  }
  else
  {
    *a4 = sub_10003DE70(&v12);
  }
  return v6;
}

void sub_100017678(void *a1, uint64_t a2, void *a3, int a4, uint64_t a5, uint64_t a6)
{
  int v12 = sub_10003FD2C(a1, 0x48uLL);
  v12[3] = os_retain((void *)a2);
  v12[6] = a5;
  v12[7] = a6;
  *((_DWORD *)v12 + 16) = a4;
  if (a3)
  {
    id v13 = os_retain(a3);
  }
  else
  {
    id v13 = (void *)cryptex_scrivener_create();
    if (cryptex_core_is_cryptex1()) {
      v13[10] |= 8uLL;
    }
  }
  if (!*(void *)(*(void *)(a2 + 104) + 216) || cryptex_core_get_asset()) {
    goto LABEL_7;
  }
  int v21 = openat(*(_DWORD *)(a2 + 112), *((const char **)&_cryptex_asset_type_cx1p + 5), 514, 420);
  if (v21 < 0)
  {
    int v29 = *__error();
    long long v30 = (const char *)a1[7];
    int v31 = *__error();
    long long v32 = a1[9];
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    long long v33 = "[anonymous]";
    if (v30) {
      long long v33 = v30;
    }
    *(_DWORD *)long long buf = 136446466;
    long long v38 = v33;
    __int16 v39 = 1024;
    int v40 = v29;
    long long v34 = "%{public}s: openat: %{darwin.errno}d";
    goto LABEL_38;
  }
  int v22 = v21;
  int v23 = cryptex_core_cx1_write_to_file();
  if (v23)
  {
    int v24 = v23;
    uint64_t v25 = (const char *)a1[7];
    int v26 = *__error();
    int v27 = a1[9];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v28 = "[anonymous]";
      if (v25) {
        int v28 = v25;
      }
      *(_DWORD *)long long buf = 136446466;
      long long v38 = v28;
      __int16 v39 = 1024;
      int v40 = v24;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s: Failed to write Cryptex1 properties to file.: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v26;
LABEL_40:
    cryptex_target_async_f();
    goto LABEL_19;
  }
  if (fchmod(v22, 0x124u))
  {
    int v29 = *__error();
    long long v35 = (const char *)a1[7];
    int v31 = *__error();
    long long v32 = a1[9];
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    long long v36 = "[anonymous]";
    if (v35) {
      long long v36 = v35;
    }
    *(_DWORD *)long long buf = 136446466;
    long long v38 = v36;
    __int16 v39 = 1024;
    int v40 = v29;
    long long v34 = "%{public}s: fchmod: %{darwin.errno}d";
LABEL_38:
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, v34, buf, 0x12u);
LABEL_39:
    *__error() = v31;
    if (!v29) {
      goto LABEL_19;
    }
    goto LABEL_40;
  }
  cryptex_asset_new();
  cryptex_core_set_asset();
LABEL_7:
  cryptex_set_target_object();
  uint64_t asset = cryptex_core_get_asset();
  __int16 v15 = (const char *)a1[7];
  int v16 = *__error();
  __int16 v17 = a1[9];
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (asset)
  {
    if (v18)
    {
      uint64_t v19 = "[anonymous]";
      if (v15) {
        uint64_t v19 = v15;
      }
      *(_DWORD *)long long buf = 136446210;
      long long v38 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}s: using existing im4m", buf, 0xCu);
    }
    *__error() = v16;
    cryptex_scrivener_read_signature();
  }
  else
  {
    if (v18)
    {
      int v20 = "[anonymous]";
      if (v15) {
        int v20 = v15;
      }
      *(_DWORD *)long long buf = 136446210;
      long long v38 = v20;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}s: will personalize", buf, 0xCu);
    }
    *__error() = v16;
    cryptex_scrivener_sign();
  }
  _OWORD v12[5] = sub_100017F04((uint64_t)a1, (uint64_t)"install");
  cryptex_activate();
LABEL_19:
  if (v13) {
    os_release(v13);
  }
}

void sub_100017ABC(uint64_t a1, uint64_t a2, const char *a3, uint64_t *a4)
{
  uint64_t v7 = *a4;
  sub_10000A554();
  int v8 = *__error();
  int v9 = *(NSObject **)(v7 + 72);
  if (!a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "protex personalization [no error]", buf, 2u);
    }
    *__error() = v8;
    a4[2] = 0;
    if (!*(void *)(a2 + 264) || !cryptex_core_get_info_asset()) {
      goto LABEL_22;
    }
    int v10 = cryptex_core_parse_info_asset();
    if (v10)
    {
      LODWORD(v11) = v10;
      int v12 = *(const char **)(a2 + 16);
      int v13 = *__error();
      int v14 = *(NSObject **)(a2 + 32);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v15 = "[anonymous]";
        if (v12) {
          __int16 v15 = v12;
        }
        *(_DWORD *)long long buf = 136446466;
        long long v35 = v15;
        __int16 v36 = 1024;
        LODWORD(v37) = v11;
        int v16 = "%{public}s: Failed to extract cryptex identifier and version.: %{darwin.errno}d";
        __int16 v17 = v14;
        uint32_t v18 = 18;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
      }
    }
    else
    {
      string = xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 264), "com.apple.CryptexIdentifier");
      __int16 v11 = string;
      if (string)
      {
        if (!strcmp(string, 0))
        {
          LODWORD(v11) = 0;
        }
        else
        {
          int v24 = *(const char **)(a2 + 16);
          int v25 = *__error();
          int v26 = *(NSObject **)(a2 + 32);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            int v27 = "[anonymous]";
            if (v24) {
              int v27 = v24;
            }
            *(_DWORD *)long long buf = 136446978;
            long long v35 = v27;
            __int16 v36 = 2080;
            long long v37 = v11;
            __int16 v38 = 2080;
            uint64_t v39 = 0;
            __int16 v40 = 1024;
            int v41 = 8;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}s: im4m identifier mismatches cryptex (actual, expected): (%s, %s): %{darwin.errno}d", buf, 0x26u);
          }
          *__error() = v25;
          LODWORD(v11) = 8;
        }
      }
      xpc_dictionary_get_string(*(xpc_object_t *)(a2 + 264), "com.apple.CryptexVersion");
      uint64_t v28 = cryptex_version_new();
      if (!v28) {
        goto LABEL_16;
      }
      int v29 = (const char **)v28;
      if (!cryptex_version_compare()) {
        goto LABEL_16;
      }
      long long v30 = *(const char **)(a2 + 16);
      int v13 = *__error();
      int v31 = *(NSObject **)(a2 + 32);
      LODWORD(v11) = 8;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        long long v32 = "[anonymous]";
        if (v30) {
          long long v32 = v30;
        }
        long long v33 = *v29;
        *(_DWORD *)long long buf = 136446978;
        long long v35 = v32;
        __int16 v36 = 2080;
        long long v37 = v33;
        __int16 v38 = 2080;
        uint64_t v39 = MEMORY[0];
        __int16 v40 = 1024;
        int v41 = 8;
        int v16 = "%{public}s: im4m version mismatches cryptex (actual, expected): (%s, %s): %{darwin.errno}d";
        __int16 v17 = v31;
        uint32_t v18 = 38;
        goto LABEL_14;
      }
    }
    *__error() = v13;
LABEL_16:
    cryptex_version_destroy();
    cryptex_version_destroy();
    free(0);
    if (v11)
    {
      uint64_t v19 = *(const char **)(v7 + 56);
      int v20 = *__error();
      int v21 = *(NSObject **)(v7 + 72);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v22 = "[anonymous]";
        if (v19) {
          int v22 = v19;
        }
        *(_DWORD *)long long buf = 136446466;
        long long v35 = v22;
        __int16 v36 = 1024;
        LODWORD(v37) = v11;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}s: Signature metadata does not match cryptex.: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v20;
    }
LABEL_22:
    cryptex_core_attach_signature();
    dispatch_async_f(*(dispatch_queue_t *)(v7 + 96), a4, (dispatch_function_t)sub_10001DD08);
    return;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    long long v35 = a3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "protex personalization: %@", buf, 0xCu);
  }
  *__error() = v8;
  a4[2] = (uint64_t)CFRetain(a3);
  cryptex_target_async_f();
}

uint64_t sub_100017F04(uint64_t a1, uint64_t a2)
{
  sub_10000A554();
  ++*(_DWORD *)(a1 + 1360);
  uint64_t v4 = *(const char **)(a1 + 56);
  int v5 = *__error();
  uint64_t v6 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = "[anonymous]";
    int v8 = *(_DWORD *)(a1 + 1360);
    if (v4) {
      uint64_t v7 = v4;
    }
    int v10 = 136446978;
    __int16 v11 = v7;
    __int16 v12 = 2080;
    uint64_t v13 = a2;
    __int16 v14 = 1024;
    int v15 = v8 - 1;
    __int16 v16 = 1024;
    int v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: activation: %s: %u -> %u", (uint8_t *)&v10, 0x22u);
  }
  *__error() = v5;
  if (!*(_DWORD *)(a1 + 1360)) {
    sub_1000429B8();
  }
  return os_transaction_create();
}

void sub_100018024(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(const void **)(a1 + 16);
  uint64_t v4 = *(void **)(a1 + 24);
  int v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  sub_10000A554();
  (*(void (**)(void *, void *, const void *, uint64_t))(a1 + 56))(v2, v5, v3, v7);
  sub_10001D288((uint64_t)v2, v6);
  os_release(v4);
  sub_10003FE2C((void **)a1);
  if (v5) {
    os_release(v5);
  }
  if (v3)
  {
    CFRelease(v3);
  }
}

CFIndex sub_1000180E0(uint64_t a1, int a2, void *a3)
{
  uint64_t v6 = *(const char **)(a1 + 56);
  int v7 = *__error();
  int v8 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    if (v6) {
      int v9 = v6;
    }
    else {
      int v9 = "[anonymous]";
    }
    int v20 = 136446210;
    int v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s: Waiting to search the codex for LaunchAgents", (uint8_t *)&v20, 0xCu);
  }
  *__error() = v7;
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 112), 0xFFFFFFFFFFFFFFFFLL);
  int v10 = *(const char **)(a1 + 56);
  int v11 = *__error();
  __int16 v12 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    if (v10) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = "[anonymous]";
    }
    int v20 = 136446466;
    int v21 = v13;
    __int16 v22 = 1024;
    int v23 = a2;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s: Searching the codex for LaunchAgents - have uid of: %u.", (uint8_t *)&v20, 0x12u);
  }
  uint64_t v14 = 0;
  *__error() = v11;
  while (1)
  {
    uint64_t v15 = *(void *)(a1 + 144 + 8 * v14);
    if (v15) {
      break;
    }
LABEL_15:
    if (++v14 == 37) {
      return 0;
    }
  }
  while (1)
  {
    CFIndex v16 = sub_100033900((void *)(v15 - 80), a2, a3);
    if (v16) {
      break;
    }
    uint64_t v15 = *(void *)(v15 + 8);
    if (!v15) {
      goto LABEL_15;
    }
  }
  uint32_t v18 = (const void *)v16;
  CFIndex v17 = sub_10000C110(v16);
  CFRelease(v18);
  return v17;
}

_DWORD *sub_100018294(uint64_t a1, int a2)
{
  uint64_t v4 = *(const char **)(a1 + 56);
  int v5 = *__error();
  uint64_t v6 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = "[anonymous]";
    if (v4) {
      int v7 = v4;
    }
    int v12 = 136446466;
    uint64_t v13 = v7;
    __int16 v14 = 1024;
    int v15 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: Searching the codex for LaunchAgents - have uid of: %u.", (uint8_t *)&v12, 0x12u);
  }
  uint64_t result = __error();
  uint64_t v9 = 0;
  _DWORD *result = v5;
  uint64_t v10 = a1 + 144;
  do
  {
    for (uint64_t i = *(void *)(v10 + 8 * v9); i; uint64_t i = *(void *)(i + 8))
      uint64_t result = (_DWORD *)sub_100033C8C((void *)(i - 80), a2);
    ++v9;
  }
  while (v9 != 37);
  return result;
}

uint64_t sub_1000183AC(void *a1, void *a2, uint64_t a3)
{
  int v5 = sub_10003FD2C(a1, 0x28uLL);
  v5[3] = a3;
  v5[4] = os_retain(a2);

  return cryptex_async_f();
}

void sub_100018420(void **a1)
{
  uint64_t v2 = (os_log_t *)*a1;
  uint64_t v3 = (uint64_t)a1[3];
  if ((*((unsigned char *)*a1 + 80) & 4) != 0)
  {
    if (v2[9]) {
      os_log_type_enabled(v2[9], OS_LOG_TYPE_ERROR);
    }
    int v5 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v6 = sub_10000BF78("_codex_install_cryptex_continue", "codex.c", 2867, "com.apple.security.cryptex.posix", 58, 0, v5);
    free(v5);
    a1[2] = v6;
    (*(void (**)(os_log_t *, void, CFErrorRef, uint64_t))(v3 + 40))(v2, 0, v6, v3);
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = sub_100011430((uint64_t)a1[4], v2, 0);
    cryptex_set_target_object();
    sub_100011878(v4, v3, (uint64_t)sub_10001E2E8);
  }
  os_release(a1[4]);
  sub_10003FE2C(a1);
  if (v4) {
    os_release(v4);
  }
}

uint64_t sub_100018644(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v8 = sub_10003FD2C(a1, 0x40uLL);
  a2[6] = 1;
  v8[3] = os_retain(a2);
  v8[4] = 0;
  void v8[6] = a4;
  v8[7] = a5;
  _OWORD v8[5] = 0;

  return cryptex_async_f();
}

void sub_1000186D0(os_log_t **a1)
{
  uint64_t v2 = *a1;
  if (cryptex_core_is_cryptex1())
  {
    a1[4] = (os_log_t *)sub_100011430((uint64_t)a1[3], v2, 1);
    cryptex_set_target_object();
    uint64_t v3 = a1[4];
    sub_100011878(v3, (uint64_t)a1, (uint64_t)sub_10001E4B8);
  }
  else
  {
    if (v2[9]) {
      os_log_type_enabled(v2[9], OS_LOG_TYPE_ERROR);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v5 = sub_10000BF78("_codex_mount_continue", "codex.c", 3028, "com.apple.security.cryptex.posix", 22, 0, v4);
    free(v4);
    if (v5)
    {
      a1[2] = (os_log_t *)v5;
      cryptex_target_async_f();
    }
  }
}

uint64_t sub_100018908(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_10003FD2C(a1, 0xD0uLL);
  long long v10 = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(v9 + 15) = *(_OWORD *)(a3 + 96);
  *(_OWORD *)(v9 + 17) = v10;
  *(_OWORD *)(v9 + 1snprintf(byte_10005E420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = *(_OWORD *)(a3 + 128);
  long long v11 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v9 + 7) = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v9 + snprintf(byte_10005E420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v11;
  long long v12 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)(v9 + 11) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(v9 + 13) = v12;
  long long v13 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v9 + 3) = *(_OWORD *)a3;
  v9[21] = *(void *)(a3 + 144);
  v9[22] = a2;
  *(_OWORD *)(v9 + 5) = v13;
  v9[24] = a4;
  v9[25] = a5;
  v9[23] = 0;

  return cryptex_async_f();
}

void sub_1000189C0(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 176);
  uint64_t v4 = sub_100019E3C(*(void *)a1, *(char **)(a1 + 24), *(void *)(a1 + 40));
  if (v4)
  {
    if (cryptex_core_is_cryptex1())
    {
      uint64_t cryptex1_properties = cryptex_core_get_cryptex1_properties();
      if (cryptex1_properties && *(unsigned char *)(cryptex1_properties + 64))
      {
        *(void *)(a1 + 184) = os_retain(v4);
        sub_100032A30((uint64_t)v4, v3 & 1 | 2, a1, (uint64_t)sub_10001F024);
LABEL_19:
        os_release(v4);
        return;
      }
      if (*(void *)(v2 + 72)) {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      }
      CFErrorRef v6 = (char *)_os_log_send_and_compose_impl();
      int v7 = 3156;
    }
    else
    {
      if (*(void *)(v2 + 72)) {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      }
      CFErrorRef v6 = (char *)_os_log_send_and_compose_impl();
      int v7 = 3149;
    }
    CFIndex v8 = 22;
  }
  else
  {
    if (*(void *)(v2 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
    }
    CFErrorRef v6 = (char *)_os_log_send_and_compose_impl();
    int v7 = 3143;
    CFIndex v8 = 2;
  }
  CFErrorRef v9 = sub_10000BF78("_codex_unmount_continue", "codex.c", v7, "com.apple.security.cryptex.posix", v8, 0, v6);
  free(v6);
  if (v9)
  {
    *(void *)(a1 + 16) = v9;
    cryptex_target_async_f();
  }
  if (v4) {
    goto LABEL_19;
  }
}

void sub_100018E84(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  CFIndex v8 = sub_10003FD2C(a1, 0x48uLL);
  v8[4] = os_retain(a2);
  void v8[6] = a3;
  v8[7] = a4;
  CFErrorRef v9 = a1[12];

  dispatch_async_f(v9, v8, (dispatch_function_t)sub_100018F04);
}

void sub_100018F04(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[4];
  long long v37 = 0u;
  memset(v38, 0, sizeof(v38));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  *(_OWORD *)__str = 0u;
  long long v25 = 0u;
  int v22 = -1;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 96));
  snprintf(__str, 0xFFuLL, "%s.XXXXXX", *(const char **)(v3 + 208));
  if ((*(unsigned char *)(v3 + 176) & 0x10) != 0)
  {
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      CFErrorRef v5 = *(const char **)(v2 + 56);
      if (!v5) {
        CFErrorRef v5 = "[anonymous]";
      }
    }
    else
    {
      CFErrorRef v5 = *(const char **)(v2 + 56);
      if (!v5) {
        CFErrorRef v5 = "[anonymous]";
      }
    }
    int v39 = 136446466;
    __int16 v40 = v5;
    __int16 v41 = 1024;
    int v42 = 45;
    CFErrorRef v9 = (char *)_os_log_send_and_compose_impl();
    int v10 = 1362;
    CFIndex v11 = 45;
    goto LABEL_31;
  }
  if (*(void *)(v3 + 480))
  {
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      uint64_t v4 = *(const char **)(v2 + 56);
      if (!v4) {
        uint64_t v4 = "[anonymous]";
      }
    }
    else
    {
      uint64_t v4 = *(const char **)(v2 + 56);
      if (!v4) {
        uint64_t v4 = "[anonymous]";
      }
    }
    int v39 = 136446466;
    __int16 v40 = v4;
    __int16 v41 = 1024;
    int v42 = 16;
    CFErrorRef v9 = (char *)_os_log_send_and_compose_impl();
    int v10 = 1369;
    CFIndex v11 = 16;
LABEL_31:
    CFErrorRef v17 = sub_10000BF78("_codex_uninstall_continue", "codex.c", v10, "com.apple.security.cryptex.posix", v11, 0, v9);
    CFErrorRef v14 = 0;
    goto LABEL_32;
  }
  int v6 = sub_10001755C(v2, (uint64_t)&unk_100059D88, __str, &v22);
  if (v6)
  {
    int v7 = v6;
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      CFIndex v8 = *(const char **)(v2 + 56);
      if (!v8) {
        CFIndex v8 = "[anonymous]";
      }
      int v39 = 136446466;
      __int16 v40 = v8;
      __int16 v41 = 1024;
      int v42 = v7;
    }
    else
    {
      CFIndex v16 = *(const char **)(v2 + 56);
      if (!v16) {
        CFIndex v16 = "[anonymous]";
      }
      int v39 = 136446466;
      __int16 v40 = v16;
      __int16 v41 = 1024;
      int v42 = v6;
    }
    CFErrorRef v9 = (char *)_os_log_send_and_compose_impl();
    CFIndex v11 = v7;
    int v10 = 1380;
    goto LABEL_31;
  }
  int v12 = v22;
  CFErrorRef v13 = sub_10001F568(v2, *(_DWORD *)(v2 + 1396), *(char **)(v3 + 208), v22);
  if (v13)
  {
    CFErrorRef v14 = v13;
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      int v15 = *(const char **)(v2 + 56);
      if (!v15) {
        int v15 = "[anonymous]";
      }
      int v39 = 136446210;
      __int16 v40 = v15;
    }
    else
    {
      uint64_t v19 = *(const char **)(v2 + 56);
      if (!v19) {
        uint64_t v19 = "[anonymous]";
      }
      int v39 = 136446210;
      __int16 v40 = v19;
    }
    CFErrorRef v9 = (char *)_os_log_send_and_compose_impl();
    int v20 = 1389;
  }
  else
  {
    CFErrorRef v14 = sub_10001F568(v2, *(_DWORD *)(v2 + 1408), *(char **)(v3 + 208), v12);
    if (!v14)
    {
      a1[2] = 0;
      goto LABEL_44;
    }
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      uint32_t v18 = *(const char **)(v2 + 56);
      if (!v18) {
        uint32_t v18 = "[anonymous]";
      }
      int v39 = 136446210;
      __int16 v40 = v18;
    }
    else
    {
      int v21 = *(const char **)(v2 + 56);
      if (!v21) {
        int v21 = "[anonymous]";
      }
      int v39 = 136446210;
      __int16 v40 = v21;
    }
    CFErrorRef v9 = (char *)_os_log_send_and_compose_impl();
    int v20 = 1398;
  }
  CFErrorRef v17 = sub_10000BF78("_codex_uninstall_continue", "codex.c", v20, "com.apple.security.cryptex", 4, v14, v9);
LABEL_32:
  free(v9);
  a1[2] = (uint64_t)v17;
  if (!v17)
  {
LABEL_44:
    cryptex_async_f();
    goto LABEL_45;
  }
  cryptex_target_async_f();
LABEL_45:
  if (v22 != -1 && close(v22) == -1) {
    sub_100041A38(&v23, &v39);
  }
  if (v14) {
    CFRelease(v14);
  }
}

void *sub_100019648(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  CFIndex v8 = sub_10003FD2C((void *)a1, 0x38uLL);
  v8[3] = os_retain(a2);
  _OWORD v8[5] = a3;
  void v8[6] = a4;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 112));
  int v9 = *(_DWORD *)(a1 + 1404);

  return sub_10002EA94((uint64_t)a2, v9, (uint64_t)v8, (uint64_t)sub_1000196D4);
}

void sub_1000196D4(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v7 = *a4;
  sub_10000A554();
  int v8 = *__error();
  int v9 = *(NSObject **)(v7 + 72);
  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 208);
      int v14 = 136315394;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      CFErrorRef v17 = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "quire mount: %s: %@", (uint8_t *)&v14, 0x16u);
    }
    *__error() = v8;
    a4[2] = (uint64_t)CFRetain(a3);
    cryptex_target_async_f();
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 208);
      int v14 = 136315138;
      uint64_t v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "quire mount: %s [no error]", (uint8_t *)&v14, 0xCu);
    }
    *__error() = v8;
    a4[2] = 0;
    uint64_t v12 = *(void *)(*(void *)(a1 + 200) + 216);
    if (v12) {
      uint64_t v13 = 4 * *(unsigned __int8 *)(v12 + 64);
    }
    else {
      uint64_t v13 = 0;
    }
    sub_1000308CC(a1, *(_DWORD *)(v7 + 1420), v13, (uint64_t)a4, (uint64_t)sub_10001FA64);
  }
}

uint64_t sub_10001986C(uint64_t a1, void *a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *(const char **)(a1 + 56);
  int v11 = *__error();
  uint64_t v12 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = "[anonymous]";
    if (v10) {
      uint64_t v13 = v10;
    }
    int v16 = 136446210;
    CFErrorRef v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s: codex_unbootstrap occuring.", (uint8_t *)&v16, 0xCu);
  }
  *__error() = v11;
  int v14 = sub_10003FD2C((void *)a1, 0x38uLL);
  v14[3] = os_retain(a2);
  v14[4] = a3;
  v14[5] = a4;
  v14[6] = a5;
  return sub_100032514(a2, *(_DWORD *)(a1 + 1420), (a3 >> 1) & 1, (uint64_t)v14, (uint64_t)sub_100019998);
}

void *sub_100019998(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v7 = *a4;
  uint64_t v8 = a4[4];
  sub_10000A554();
  if (a3) {
    CFTypeRef v9 = CFRetain(a3);
  }
  else {
    CFTypeRef v9 = 0;
  }
  a4[2] = (uint64_t)v9;
  uint64_t v10 = *(const char **)(v7 + 56);
  int v11 = *__error();
  uint64_t v12 = *(NSObject **)(v7 + 72);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = "[anonymous]";
    uint64_t v14 = *(void *)(a1 + 208);
    if (v10) {
      uint64_t v13 = v10;
    }
    *(_DWORD *)long long buf = 136446466;
    long long v33 = v13;
    __int16 v34 = 2080;
    uint64_t v35 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: quire unbootstrap: %s", buf, 0x16u);
  }
  *__error() = v11;
  if (a3 && (sub_10000C218((CFDictionaryRef)a3, @"com.apple.security.cryptex", 18) & 1) == 0) {
    cryptex_target_async_f();
  }
  if ((*(unsigned char *)(a1 + 176) & 0x10) != 0 && (v8 & 2) == 0)
  {
    if (*(void *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      uint64_t v15 = *(const char **)(a1 + 56);
      if (!v15) {
        uint64_t v15 = "[anonymous]";
      }
      *(_DWORD *)long long buf = 136446210;
      long long v33 = v15;
    }
    else
    {
      uint32_t v18 = *(const char **)(a1 + 56);
      if (!v18) {
        uint32_t v18 = "[anonymous]";
      }
      *(_DWORD *)long long buf = 136446210;
      long long v33 = v18;
    }
    uint64_t v19 = (char *)_os_log_send_and_compose_impl();
    int v20 = 1491;
LABEL_32:
    CFErrorRef v22 = sub_10000BF78("_codex_unbootstrap_continue", "codex.c", v20, "com.apple.security.cryptex", 4, 0, v19);
    free(v19);
    a4[2] = (uint64_t)v22;
    return (void *)cryptex_target_async_f();
  }
  if (*(void *)(a1 + 480))
  {
    if (*(void *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      int v16 = *(const char **)(a1 + 56);
      if (!v16) {
        int v16 = "[anonymous]";
      }
      *(_DWORD *)long long buf = 136446210;
      long long v33 = v16;
    }
    else
    {
      int v21 = *(const char **)(a1 + 56);
      if (!v21) {
        int v21 = "[anonymous]";
      }
      *(_DWORD *)long long buf = 136446210;
      long long v33 = v21;
    }
    uint64_t v19 = (char *)_os_log_send_and_compose_impl();
    int v20 = 1502;
    goto LABEL_32;
  }
  if (v8)
  {
    int v24 = *(const char **)(v7 + 56);
    int v25 = *__error();
    long long v26 = *(NSObject **)(v7 + 72);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      long long v27 = "[anonymous]";
      if (v24) {
        long long v27 = v24;
      }
      *(_DWORD *)long long buf = 136446210;
      long long v33 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%{public}s: will force unmount", buf, 0xCu);
    }
    *__error() = v25;
    uint64_t v17 = 1;
  }
  else
  {
    uint64_t v17 = 0;
  }
  long long v28 = *(const char **)(v7 + 56);
  int v29 = *__error();
  long long v30 = *(NSObject **)(v7 + 72);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    long long v31 = "[anonymous]";
    if (v28) {
      long long v31 = v28;
    }
    *(_DWORD *)long long buf = 136446210;
    long long v33 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%{public}s: _codex_unbootstrap_continue progressing to quire unmount", buf, 0xCu);
  }
  *__error() = v29;
  return sub_100032A30(a1, v17, (uint64_t)a4, (uint64_t)sub_10001FDFC);
}

void *sub_100019E3C(uint64_t a1, char *a2, uint64_t a3)
{
  sub_10000A554();
  uint64_t v6 = sub_10003C3DC(a1 + 144, a2);
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  if (a3)
  {
    if (cryptex_version_compare()) {
      return 0;
    }
  }

  return os_retain((void *)(v7 - 80));
}

uint64_t sub_100019EC0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10003FD2C(a1, 0x38uLL);
  v6[5] = a2;
  void v6[6] = a3;
  void v6[4] = sub_100017F04((uint64_t)a1, (uint64_t)"barrier");

  return cryptex_async_f();
}

void sub_100019F3C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)a1[4];
  sub_10000A554();
  uint64_t v4 = *(const char **)(v2 + 56);
  int v5 = *__error();
  uint64_t v6 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = "[anonymous]";
    if (v4) {
      uint64_t v7 = v4;
    }
    int v8 = 136446210;
    CFTypeRef v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: enqueuing barrier", (uint8_t *)&v8, 0xCu);
  }
  *__error() = v5;
  a1[3] = 0;
  **(void **)(v2 + 1376) = a1;
  *(void *)(v2 + 1376) = a1 + 3;
  sub_10001D288(v2, v3);
}

uint64_t sub_10001A038(void *a1, uint64_t a2, uint64_t a3)
{
  int v5 = sub_10003FD2C(a1, 0x28uLL);
  v5[3] = a2;
  v5[4] = a3;

  return cryptex_async_f();
}

void sub_10001A09C(_DWORD *a1)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = os_retain((void *)qword_10005E840);
  *(void *)(v2 + 80) |= 4uLL;
  if ((void *)v2 == v3)
  {
    int v4 = cryptex_signature_seal();
    if (v4)
    {
      int v5 = *(const char **)(v2 + 56);
      int v6 = *__error();
      uint64_t v7 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = "[anonymous]";
        if (v5) {
          int v8 = v5;
        }
        int v9 = 136446466;
        uint64_t v10 = v8;
        __int16 v11 = 1024;
        int v12 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s: failed to seal hash slot: %{darwin.errno}d", (uint8_t *)&v9, 0x12u);
      }
      *__error() = v6;
    }
  }
  else
  {
    int v4 = 0;
  }
  a1[2] = v4;
  dispatch_async_f(*(dispatch_queue_t *)(v2 + 96), a1, (dispatch_function_t)sub_100020168);
  if (v3) {
    os_release(v3);
  }
}

void sub_10001A1E8(void *a1, uint64_t a2, uint64_t a3)
{
  int v5 = sub_10003FD2C(a1, 0x40uLL);
  v5[6] = a2;
  v5[7] = a3;
  v5[4] = xpc_array_create(0, 0);
  int v6 = sub_10000A564();

  dispatch_async_f(v6, v5, (dispatch_function_t)sub_10001A25C);
}

uint64_t sub_10001A25C(void **a1)
{
  return sub_100019EC0(*a1, (uint64_t)a1, (uint64_t)sub_100020484);
}

uint64_t sub_10001A278(uint64_t result, uint64_t a2)
{
  unint64_t v3 = 0;
  uint64_t v4 = result + 144;
  while (1)
  {
    uint64_t v5 = *(void *)(v4 + 8 * v3);
    if (v5) {
      break;
    }
LABEL_5:
    if (v3++ >= 0x24) {
      return result;
    }
  }
  while (1)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, v5 - 80);
    if ((result & 1) == 0) {
      return result;
    }
    uint64_t v5 = *(void *)(v5 + 8);
    if (!v5) {
      goto LABEL_5;
    }
  }
}

void sub_10001A2E8(uint64_t a1)
{
  object = (char *)sub_10000A548();
  uint64_t v2 = (uint64_t *)(a1 + 120);
  uint64_t v3 = *(void *)(a1 + 120);
  if (v3)
  {
    do
    {
      uint64_t v4 = *(NSObject **)(v3 + 40);
      uint64_t v5 = *(const char **)(a1 + 56);
      int v6 = *__error();
      uint64_t v7 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        int v8 = "[anonymous]";
        if (v5) {
          int v8 = v5;
        }
        *(_DWORD *)long long buf = 136446210;
        int v29 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: uncorking import", buf, 0xCu);
      }
      *__error() = v6;
      uint64_t v9 = *v2;
      if (*v2 == v3)
      {
        uint64_t v13 = *(void *)(v3 + 24);
        *uint64_t v2 = v13;
        uint64_t v12 = a1 + 120;
        if (v13) {
          goto LABEL_10;
        }
      }
      else
      {
        do
        {
          uint64_t v10 = v9;
          uint64_t v9 = *(void *)(v9 + 24);
        }
        while (v9 != v3);
        uint64_t v11 = *(void *)(v3 + 24);
        *(void *)(v10 + 24) = v11;
        uint64_t v12 = v10 + 24;
        if (v11) {
          goto LABEL_10;
        }
      }
      *(void *)(a1 + 128) = v12;
LABEL_10:
      *(void *)(v3 + 24) = -1;
      dispatch_group_leave(v4);
      uint64_t v3 = *v2;
    }
    while (*v2);
  }
  uint64_t v14 = (char *)*((void *)object + 37);
  if (v14)
  {
    do
    {
      uint64_t v15 = *(char **)v14;
      int v16 = sub_100019E3C(a1, v14 + 8, 0);
      if (!v16)
      {
        uint64_t v17 = *(const char **)(a1 + 56);
        int v18 = *__error();
        uint64_t v19 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 136446466;
          int v20 = "[anonymous]";
          if (v17) {
            int v20 = v17;
          }
          int v29 = v20;
          __int16 v30 = 2080;
          long long v31 = v14 + 8;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}s: lingering forerunner: %s", buf, 0x16u);
        }
        *__error() = v18;
      }
      int v21 = *(const char **)(a1 + 56);
      int v22 = *__error();
      uint64_t v23 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136446466;
        int v24 = "[anonymous]";
        if (v21) {
          int v24 = v21;
        }
        int v29 = v24;
        __int16 v30 = 2080;
        long long v31 = v14 + 8;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}s: removing forerunner: %s", buf, 0x16u);
      }
      *__error() = v22;
      int v25 = (char *)*((void *)object + 37);
      long long v26 = object + 296;
      while (v25 != v14)
      {
        long long v26 = v25;
        int v25 = *(char **)v25;
      }
      *(void *)long long v26 = *(void *)v14;
      free(v14);
      if (v16) {
        os_release(v16);
      }
      uint64_t v14 = v15;
    }
    while (v15);
  }
  sub_100007924();
  dispatch_async_f(*(dispatch_queue_t *)(a1 + 96), 0, (dispatch_function_t)sub_10001AA64);
  *(void *)(a1 + 80) |= 2uLL;
  if (object) {
    os_release(object);
  }
}

uint64_t sub_10001A5E8(uint64_t a1)
{
  int v2 = dup_np();
  uint64_t v3 = fdopendir(v2);
  for (uint64_t i = readdir(v3); i; uint64_t i = readdir(v3))
  {
    d_name = i->d_name;
    if (strcmp(i->d_name, ".") && strcmp(d_name, ".."))
    {
      int v6 = *(const char **)(a1 + 56);
      int v7 = *__error();
      int v8 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 136446466;
        uint64_t v9 = "[anonymous]";
        if (v6) {
          uint64_t v9 = v6;
        }
        long long v37 = v9;
        __int16 v38 = 2080;
        int v39 = d_name;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s: importing pre-existing cryptex: %s", buf, 0x16u);
      }
      *__error() = v7;
      int v10 = openat(v2, d_name, 1048832);
      if (v10 < 0)
      {
        int v28 = *__error();
        int v29 = *(const char **)(a1 + 56);
        int v30 = *__error();
        long long v31 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 136446722;
          long long v32 = "[anonymous]";
          if (v29) {
            long long v32 = v29;
          }
          long long v37 = v32;
          __int16 v38 = 2080;
          int v39 = d_name;
          __int16 v40 = 1024;
          int v41 = v28;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%{public}s: failed to open cryptex: %s: %{darwin.errno}d", buf, 0x1Cu);
        }
        *__error() = v30;
        if (v10 != -1 && close(v10) == -1) {
LABEL_39:
        }
          sub_100041A38(&v35, buf);
      }
      else
      {
        uint64_t v11 = (void *)cryptex_core_create();
        int v12 = cryptex_core_set_assets_from_directory();
        if (v12)
        {
          int v13 = v12;
          uint64_t v14 = *(const char **)(a1 + 56);
          int v15 = *__error();
          int v16 = *(NSObject **)(a1 + 72);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136446722;
            uint64_t v17 = "[anonymous]";
            if (v14) {
              uint64_t v17 = v14;
            }
            long long v37 = v17;
            __int16 v38 = 2080;
            int v39 = d_name;
            __int16 v40 = 1024;
            int v41 = v13;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s: failed to create core from directory: %s: %{darwin.errno}d", buf, 0x1Cu);
          }
          *__error() = v15;
          if (v13 == 2)
          {
            int v18 = *(const char **)(a1 + 56);
            int v19 = *__error();
            int v20 = *(NSObject **)(a1 + 72);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 136446466;
              int v21 = "[anonymous]";
              if (v18) {
                int v21 = v18;
              }
              long long v37 = v21;
              __int16 v38 = 2080;
              int v39 = d_name;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}s: removing broken cryptex: %s", buf, 0x16u);
            }
            *__error() = v19;
            int v22 = sub_10003DFEC(v2, d_name);
            if (v22)
            {
              int v23 = v22;
              int v24 = *(const char **)(a1 + 56);
              int v25 = *__error();
              long long v26 = *(NSObject **)(a1 + 72);
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 136446722;
                long long v27 = "[anonymous]";
                if (v24) {
                  long long v27 = v24;
                }
                long long v37 = v27;
                __int16 v38 = 2080;
                int v39 = d_name;
                __int16 v40 = 1024;
                int v41 = v23;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%{public}s: failed to remove core directory: %s: %{darwin.errno}d", buf, 0x1Cu);
              }
              *__error() = v25;
            }
          }
        }
        else
        {
          cryptex_core_set_nonce_persistence();
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 104));
          long long v33 = sub_10003FD2C((void *)a1, 0x98uLL);
          v33[17] = sub_10001AB50;
          sub_10001AD98(a1, v11, v33);
        }
        if (close(v10) == -1) {
          goto LABEL_39;
        }
        if (v11) {
          os_release(v11);
        }
      }
    }
  }
  uint64_t result = closedir(v3);
  if (result == -1) {
    sub_1000419C4(&v35, buf);
  }
  return result;
}

void sub_10001AA64()
{
  uint64_t v0 = sub_10000A548();
  int v1 = openat(v0[23], "init", 2560, 438);
  if ((v1 & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v2 = *__error();
  if (v2) {
    BOOL v3 = v2 == 17;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    sub_1000429D4(&v5, v6);
  }
  uint64_t v4 = (void *)*((void *)v0 + 41);
  if (v4) {
    os_release(v4);
  }
  *((void *)v0 + 41) = 0;
  if (v1 != -1 && close(v1) == -1) {
    sub_100041A38(&v5, v6);
  }

  os_release(v0);
}

void sub_10001AB50(uint64_t a1, void *a2, void *a3, const void *a4)
{
  if (a4)
  {
    if (*(void *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      int v7 = *(const char **)(a1 + 56);
      if (!v7) {
        int v7 = "[anonymous]";
      }
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = v7;
    }
    else
    {
      int v12 = *(const char **)(a1 + 56);
      if (!v12) {
        int v12 = "[anonymous]";
      }
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = v12;
    }
    int v13 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v14 = sub_10000BF78("_codex_import_initial_continue", "codex.c", 1907, "com.apple.security.cryptex", 15, a4, v13);
    free(v13);
    int v15 = sub_10003FD2C((void *)a1, 0x20uLL);
    v15[3] = os_retain(a2);
    dispatch_async_f(*(dispatch_queue_t *)(a1 + 96), v15, (dispatch_function_t)sub_10001D948);
    if (v14) {
      CFRelease(v14);
    }
  }
  else
  {
    int v9 = *__error();
    int v10 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = (const char *)a3[26];
      *(_DWORD *)long long buf = 136315138;
      uint64_t v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "imported: %s [no error]", buf, 0xCu);
    }
    *__error() = v9;
    sub_100019648(a1, a3, 0, (uint64_t)sub_10001D820);
  }
}

void sub_10001AD98(uint64_t a1, void *a2, void *a3)
{
  int v6 = sub_10000A548();
  sub_10000A554();
  int v7 = dispatch_group_create();
  dispatch_set_context(v7, a3);
  a3[4] = os_retain(a2);
  a3[5] = v7;
  uint64_t v8 = a2[21];
  uint64_t asset = cryptex_core_get_asset();
  if (os_variant_allows_internal_security_policies() && v8 && (*(unsigned char *)(v8 + 40) & 4) != 0
    || asset
    && ((memset(&v27, 0, sizeof(v27)), !fstat(*(_DWORD *)(asset + 16), &v27)) ? (BOOL v10 = v27.st_size == 0) : (BOOL v10 = 0),
        v10 && os_variant_allows_internal_security_policies()))
  {
    a2[5] |= 1uLL;
  }
  dispatch_group_enter(v7);
  os_variant_allows_internal_security_policies();
  uint64_t v11 = (void *)cryptex_magister_create();
  cryptex_set_target_object();
  cryptex_core_get_image_asset();
  if (cryptex_asset_evaluate())
  {
    memset(&v27, 0, 80);
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  info_uint64_t asset = cryptex_core_get_info_asset();
  uint64_t v13 = info_asset;
  if ((*(unsigned char *)(v11[11] + 40) & 1) == 0)
  {
    if (cryptex_core_image_authapfs_enabled())
    {
      CFErrorRef v14 = *(const char **)(a1 + 56);
      int v15 = *__error();
      int v16 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = "[anonymous]";
        if (v14) {
          uint64_t v17 = v14;
        }
        v27.st_dev = 136446210;
        *(void *)&v27.st_mode = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%{public}s: AuthAPFS enabled, skip up-front dmg authentication.", (uint8_t *)&v27, 0xCu);
      }
      *__error() = v15;
      if (v13) {
        goto LABEL_20;
      }
      goto LABEL_25;
    }
LABEL_24:
    dispatch_group_enter(v7);
    cryptex_magister_authenticate();
    if (v13)
    {
LABEL_20:
      dispatch_group_enter(v7);
      cryptex_magister_authenticate();
LABEL_30:
      dispatch_group_enter(v7);
      cryptex_magister_record_property();
      goto LABEL_31;
    }
LABEL_25:
    int v18 = *(const char **)(a1 + 56);
    int v19 = *__error();
    int v20 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      int v21 = "[anonymous]";
      __darwin_ino64_t v22 = _cryptex_asset_type_c411[5];
      if (v18) {
        int v21 = v18;
      }
      v27.st_dev = 136446466;
      *(void *)&v27.st_mode = v21;
      WORD2(v27.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v27.st_ino + 6) = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s: will use adhoc %s, skip authenticating it", (uint8_t *)&v27, 0x16u);
    }
    *__error() = v19;
    goto LABEL_30;
  }
  if (info_asset && sub_10003F01C(*(_DWORD *)(info_asset + 16), a3 + 9))
  {
    memset(&v27, 0, 80);
    int v6 = &_os_log_default;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
    goto LABEL_24;
  }
LABEL_31:
  if ((*(unsigned char *)(a1 + 80) & 2) == 0 && a3[18])
  {
    int v23 = *(const char **)(a1 + 56);
    int v24 = *__error();
    int v25 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      long long v26 = "[anonymous]";
      if (v23) {
        long long v26 = v23;
      }
      v27.st_dev = 136446210;
      *(void *)&v27.st_mode = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%{public}s: corking import", (uint8_t *)&v27, 0xCu);
    }
    *__error() = v24;
    a3[3] = 0;
    **(void **)(a1 + 128) = a3;
    *(void *)(a1 + 128) = a3 + 3;
    dispatch_group_enter(v7);
  }
  a3[16] = sub_100017F04(a1, (uint64_t)"import");
  dispatch_group_notify_f(v7, *(dispatch_queue_t *)(a1 + 32), a3, (dispatch_function_t)sub_10001B790);
  dispatch_group_leave(v7);
  cryptex_activate();
  if (v7) {
    os_release(v7);
  }
  os_release(v11);
  if (v6) {
    os_release(v6);
  }
}

void sub_10001B318(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, uint64_t *a5)
{
  uint64_t v8 = *a5;
  int v9 = a5[5];
  int v10 = *__error();
  uint64_t v11 = *(NSObject **)(v8 + 72);
  if (a4)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a2 + 40);
      uint64_t v12 = *(void *)(a2 + 48);
      int v18 = 136315650;
      uint64_t v19 = v12;
      __int16 v20 = 2080;
      uint64_t v21 = v13;
      __int16 v22 = 2112;
      int v23 = a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s (%s) authentication: %@", (uint8_t *)&v18, 0x20u);
    }
    *__error() = v10;
    CFTypeRef v14 = CFRetain(a4);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = *(void *)(a2 + 40);
      uint64_t v15 = *(void *)(a2 + 48);
      int v18 = 136315394;
      uint64_t v19 = v15;
      __int16 v20 = 2080;
      uint64_t v21 = v16;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%s (%s) authentication [no error]", (uint8_t *)&v18, 0x16u);
    }
    uint64_t v17 = __error();
    CFTypeRef v14 = 0;
    *uint64_t v17 = v10;
  }
  a5[7] = (uint64_t)v14;
  dispatch_group_leave(v9);
}

void sub_10001B47C(uint64_t a1, uint64_t a2, __n128 *a3, const void *a4, uint64_t *a5)
{
  uint64_t v9 = *a5;
  int v10 = a5[5];
  int v11 = *__error();
  uint64_t v12 = *(NSObject **)(v9 + 72);
  if (a4)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a2 + 40);
      int v15 = 136315394;
      uint64_t v16 = v13;
      __int16 v17 = 2112;
      int v18 = a4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s authentication: %@", (uint8_t *)&v15, 0x16u);
    }
    *__error() = v11;
    a5[8] = (uint64_t)CFRetain(a4);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a2 + 40);
      int v15 = 136315138;
      uint64_t v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%s authentication [no error]", (uint8_t *)&v15, 0xCu);
    }
    *__error() = v11;
    a5[8] = 0;
    sub_10003F870((__n128 *)(a5 + 9), a3);
  }
  dispatch_group_leave(v10);
}

void sub_10001B5DC(uint64_t a1, uint64_t a2, const void *a3, void *a4)
{
  int v6 = a4[5];
  if (!a2)
  {
    uint64_t v8 = *(const char **)(a4[4] + 16);
    int v9 = *__error();
    int v10 = *(NSObject **)(a4[4] + 32);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = "[anonymous]";
      if (v8) {
        int v11 = v8;
      }
      *(_DWORD *)long long buf = 136446210;
      uint64_t v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}s: im4m missing DataOnly property", buf, 0xCu);
    }
    *__error() = v9;
    if (a3) {
      goto LABEL_3;
    }
LABEL_9:
    CFTypeRef v7 = 0;
    goto LABEL_10;
  }
  __memcpy_chk();
  if (!a3) {
    goto LABEL_9;
  }
LABEL_3:
  CFTypeRef v7 = CFRetain(a3);
LABEL_10:
  a4[6] = v7;
  dispatch_group_leave(v6);
}

void sub_10001B790(uint64_t a1)
{
  int v2 = *(void **)a1;
  BOOL v3 = *(void **)(a1 + 32);
  uint64_t v5 = *(const void **)(a1 + 48);
  uint64_t v4 = *(const void **)(a1 + 56);
  int v6 = *(const void **)(a1 + 64);
  uint64_t v126 = 0;
  memset(v125, 0, sizeof(v125));
  uint64_t v124 = 0;
  long long v123 = 0u;
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v115 = 0u;
  *(_OWORD *)long long xdict = 0u;
  context = *(void **)(a1 + 144);
  int v114 = 0;
  BOOL v113 = 0;
  sub_10000A554();
  sub_10003F870(v125, (__n128 *)(a1 + 72));
  CFTypeRef cf = v6;
  if (v4)
  {
    if (*((void *)v2 + 9))
    {
      os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR);
      CFTypeRef v7 = (const char *)*((void *)v2 + 7);
      uint64_t v8 = *(char **)(v3[22] + 40);
      if (!v7) {
        CFTypeRef v7 = "[anonymous]";
      }
      int buf = 136446466;
      v130 = v7;
      __int16 v131 = 2080;
      v132 = v8;
    }
    else
    {
      int v10 = "[anonymous]";
      if (*((void *)v2 + 7)) {
        int v10 = (const char *)*((void *)v2 + 7);
      }
      int v11 = *(char **)(v3[22] + 40);
      int buf = 136446466;
      v130 = v10;
      __int16 v131 = 2080;
      v132 = v11;
    }
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();
    uint64_t v13 = "com.apple.security.cryptex";
    int v14 = 614;
    CFIndex v15 = 14;
    uint64_t v16 = v4;
LABEL_25:
    CFErrorRef v22 = sub_10000BF78("_codex_import_core_continue", "codex.c", v14, v13, v15, v16, v12);
    free(v12);
    int v23 = 0;
LABEL_26:
    int v24 = 0;
LABEL_27:
    int v25 = 0;
    goto LABEL_28;
  }
  if (v5)
  {
    if (*((void *)v2 + 9))
    {
      os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR);
      int v9 = (const char *)*((void *)v2 + 7);
      if (!v9) {
        int v9 = "[anonymous]";
      }
      int buf = 136446210;
      v130 = v9;
    }
    else
    {
      uint64_t v21 = (const char *)*((void *)v2 + 7);
      if (!v21) {
        uint64_t v21 = "[anonymous]";
      }
      int buf = 136446210;
      v130 = v21;
    }
    uint64_t v12 = (char *)_os_log_send_and_compose_impl();
    uint64_t v13 = "com.apple.security.cryptex";
    int v14 = 623;
    CFIndex v15 = 14;
    uint64_t v16 = v5;
    goto LABEL_25;
  }
  info_uint64_t asset = cryptex_core_get_info_asset();
  if (info_asset)
  {
    if (v6)
    {
      uint64_t v18 = info_asset;
      if (*((void *)v2 + 9))
      {
        os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR);
        uint64_t v19 = (const char *)*((void *)v2 + 7);
        __int16 v20 = *(char **)(*(void *)(v18 + 8) + 40);
        if (!v19) {
          uint64_t v19 = "[anonymous]";
        }
        int buf = 136446466;
        v130 = v19;
        __int16 v131 = 2080;
        v132 = v20;
      }
      else
      {
        char v61 = "[anonymous]";
        if (*((void *)v2 + 7)) {
          char v61 = (const char *)*((void *)v2 + 7);
        }
        v62 = *(char **)(*(void *)(info_asset + 8) + 40);
        int buf = 136446466;
        v130 = v61;
        __int16 v131 = 2080;
        v132 = v62;
      }
      uint64_t v12 = (char *)_os_log_send_and_compose_impl();
      uint64_t v13 = "com.apple.security.cryptex";
      int v14 = 634;
      CFIndex v15 = 14;
      uint64_t v16 = v6;
      goto LABEL_25;
    }
    CFErrorRef v56 = (void *)xpc_create_from_plist();
    if (!v56)
    {
      if (*((void *)v2 + 9))
      {
        os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR);
        long long v63 = (const char *)*((void *)v2 + 7);
        if (!v63) {
          long long v63 = "[anonymous]";
        }
      }
      else
      {
        long long v63 = (const char *)*((void *)v2 + 7);
        if (!v63) {
          long long v63 = "[anonymous]";
        }
      }
      int buf = 136446466;
      v130 = v63;
      __int16 v131 = 1024;
      LODWORD(v132) = 212;
      uint64_t v12 = (char *)_os_log_send_and_compose_impl();
      uint64_t v13 = "com.apple.security.cryptex.posix";
      int v14 = 642;
      CFIndex v15 = 212;
      uint64_t v16 = 0;
      goto LABEL_25;
    }
    int v23 = v56;
    if (xpc_get_type(v56) != (xpc_type_t)&_xpc_type_dictionary)
    {
      CFErrorRef v57 = xpc_copy_description(v23);
      __int16 v58 = v57;
      if (*((void *)v2 + 9))
      {
        os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR);
        pid_t v59 = (const char *)*((void *)v2 + 7);
        int buf = 136446722;
        if (v59) {
          int v60 = v59;
        }
        else {
          int v60 = "[anonymous]";
        }
        v130 = v60;
        __int16 v131 = 2080;
        v132 = v58;
        __int16 v133 = 1024;
        LODWORD(v134) = 212;
      }
      else
      {
        v86 = "[anonymous]";
        if (*((void *)v2 + 7)) {
          v86 = (const char *)*((void *)v2 + 7);
        }
        int buf = 136446722;
        v130 = v86;
        __int16 v131 = 2080;
        v132 = v57;
        __int16 v133 = 1024;
        LODWORD(v134) = 212;
      }
      v73 = (char *)_os_log_send_and_compose_impl();
      int v75 = 652;
      CFIndex v74 = 212;
LABEL_137:
      CFErrorRef v22 = sub_10000BF78("_codex_import_core_continue", "codex.c", v75, "com.apple.security.cryptex.posix", v74, 0, v73);
      free(v73);
      int v87 = v58;
LABEL_138:
      free(v87);
      goto LABEL_26;
    }
    if (!os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_DEBUG))
    {
      long long v43 = v23;
      __int16 v38 = context;
      if (context) {
        goto LABEL_99;
      }
      goto LABEL_67;
    }
    xpc_object_t v44 = xpc_copy_description(v23);
    v80 = (const char *)*((void *)v2 + 7);
    int v81 = *__error();
    v82 = *((void *)v2 + 9);
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
    {
      v83 = "[anonymous]";
      if (v80) {
        v83 = v80;
      }
      int buf = 136446466;
      v130 = v83;
      __int16 v131 = 2080;
      v132 = v44;
      _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEBUG, "%{public}s: importing Info.plist: %s", (uint8_t *)&buf, 0x16u);
    }
    *__error() = v81;
    long long v43 = v23;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    __int16 v38 = context;
  }
  else
  {
    int v29 = (const char *)*((void *)v2 + 7);
    int v30 = *__error();
    long long v31 = *((void *)v2 + 9);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      long long v32 = "[anonymous]";
      if (v29) {
        long long v32 = v29;
      }
      int buf = 136446210;
      v130 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%{public}s: no Info.plist found in core, generating adhoc one", (uint8_t *)&buf, 0xCu);
    }
    *__error() = v30;
    identifier = (const char *)cryptex_core_generate_identifier();
    version = (char *)cryptex_core_generate_version();
    v109 = (char *)identifier;
    xpc_object_t v35 = xpc_string_create(identifier);
    xpc_object_t v36 = xpc_string_create(version);
    long long keys = *(_OWORD *)off_10005A228;
    values[0] = v35;
    values[1] = v36;
    xpc_object_t v37 = xpc_dictionary_create((const char *const *)&keys, values, 2uLL);
    __int16 v38 = context;
    if (os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_DEBUG))
    {
      __int16 v104 = version;
      __int16 v106 = xpc_copy_description(v37);
      int v39 = (const char *)*((void *)v2 + 7);
      int v40 = *__error();
      int v41 = *((void *)v2 + 9);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        int v42 = "[anonymous]";
        if (v39) {
          int v42 = v39;
        }
        int buf = 136446466;
        v130 = v42;
        __int16 v131 = 2080;
        v132 = v106;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "%{public}s: generated Info.plist: %s", (uint8_t *)&buf, 0x16u);
      }
      *__error() = v40;
      free(v106);
      version = v104;
    }
    if (v36) {
      os_release(v36);
    }
    uint64_t v5 = 0;
    uint64_t v4 = 0;
    if (v35) {
      os_release(v35);
    }
    free(version);
    int v23 = 0;
    long long v43 = v37;
    xpc_object_t v44 = v109;
  }
  free(v44);
  if (v38) {
    goto LABEL_99;
  }
LABEL_67:
  v105 = v43;
  v107 = v5;
  __int16 v108 = v4;
  __int16 v45 = sub_10000A548();
  stat v110 = v45 + 37;
  object = v45;
  int v46 = (void *)v45[37];
  while (v46)
  {
    __int16 v47 = v23;
    v48 = (void *)*v46;
    int v49 = memcmp((const void *)(v3[20] + 112), (char *)v46 + 3335, 0x30uLL);
    if (!v49)
    {
      v50 = (const char *)*((void *)v2 + 7);
      int v51 = *__error();
      BOOL v52 = *((void *)v2 + 9);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      {
        int buf = 136446722;
        __int16 v53 = "[anonymous]";
        if (v50) {
          __int16 v53 = v50;
        }
        v130 = v53;
        __int16 v131 = 2080;
        v132 = (char *)(v46 + 1);
        __int16 v133 = 2080;
        v134 = (char *)v46 + 3383;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "%{public}s: found forerunner; will carry on the legacy: name = %s, hash = %s",
          (uint8_t *)&buf,
          0x20u);
      }
      *__error() = v51;
      int v54 = v110;
      for (uint64_t i = (void *)*v110; i != v46; uint64_t i = (void *)*i)
        int v54 = i;
      void *v54 = *v46;
      void *v46 = -1;
      __int16 v38 = v46;
    }
    int v46 = v48;
    int v23 = v47;
    if (!v49) {
      goto LABEL_96;
    }
  }
  __int16 v38 = 0;
LABEL_96:
  if (object) {
    os_release(object);
  }
  int v114 = v38;
  uint64_t v5 = v107;
  uint64_t v4 = v108;
  __int16 v38 = context;
  long long v43 = v105;
LABEL_99:
  uint64_t v64 = v3[27];
  if (v64) {
    BOOL v65 = *(unsigned __int8 *)(v64 + 64) != 0;
  }
  else {
    BOOL v65 = 0;
  }
  int v66 = sub_10002DF18(v43, &v114, (uint64_t)&v115, v65);
  if (v66)
  {
    int v67 = v66;
    unint64_t v68 = xpc_copy_description(v43);
    __int16 v58 = v68;
    if (*((void *)v2 + 9))
    {
      os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR);
      long long v69 = (const char *)*((void *)v2 + 7);
      int buf = 136446722;
      if (!v69) {
        long long v69 = "[anonymous]";
      }
      v130 = v69;
      __int16 v131 = 2080;
      v132 = v58;
      __int16 v133 = 1024;
      LODWORD(v134) = v67;
    }
    else
    {
      uint64_t v72 = (const char *)*((void *)v2 + 7);
      if (!v72) {
        uint64_t v72 = "[anonymous]";
      }
      int buf = 136446722;
      v130 = v72;
      __int16 v131 = 2080;
      v132 = v68;
      __int16 v133 = 1024;
      LODWORD(v134) = v67;
    }
    v73 = (char *)_os_log_send_and_compose_impl();
    CFIndex v74 = v67;
    int v75 = 686;
    goto LABEL_137;
  }
  long long v70 = sub_100019E3C((uint64_t)v2, (char *)v115, 0);
  if (v70)
  {
    int v25 = v70;
    v38[4] = os_retain(v70);
    if (*((void *)v2 + 9))
    {
      os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR);
      long long v71 = (const char *)*((void *)v2 + 7);
      if (!v71) {
        long long v71 = "[anonymous]";
      }
      int buf = 136446466;
      v130 = v71;
      __int16 v131 = 2080;
      v132 = (char *)v115;
    }
    else
    {
      v84 = (const char *)*((void *)v2 + 7);
      if (!v84) {
        v84 = "[anonymous]";
      }
      int buf = 136446466;
      v130 = v84;
      __int16 v131 = 2080;
      v132 = (char *)v115;
    }
    uint32_t v85 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v22 = sub_10000BF78("_codex_import_core_continue", "codex.c", 696, "com.apple.security.cryptex", 17, 0, v85);
    free(v85);
    int v24 = 0;
    goto LABEL_28;
  }
  if (xpc_dictionary_get_array(xdict[1], "Dependencies"))
  {
    if (!v38)
    {
      if (*((void *)v2 + 9))
      {
        os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR);
        uint64_t v91 = (const char *)*((void *)v2 + 7);
        if (!v91) {
          uint64_t v91 = "[anonymous]";
        }
      }
      else
      {
        uint64_t v91 = (const char *)*((void *)v2 + 7);
        if (!v91) {
          uint64_t v91 = "[anonymous]";
        }
      }
      int buf = 136446466;
      v130 = v91;
      __int16 v131 = 1024;
      LODWORD(v132) = 45;
      v94 = (char *)_os_log_send_and_compose_impl();
      v95 = "com.apple.security.cryptex.posix";
      int v96 = 708;
      CFIndex v97 = 45;
      goto LABEL_175;
    }
    int v76 = sub_10002E440((uint64_t)&v115, *((unsigned int *)v38 + 16));
    if (v76)
    {
      int v77 = v76;
      v78 = xpc_copy_description(v43);
      __int16 v58 = v78;
      if (*((void *)v2 + 9))
      {
        os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR);
        uint64_t v79 = (const char *)*((void *)v2 + 7);
        int buf = 136446722;
        if (!v79) {
          uint64_t v79 = "[anonymous]";
        }
        v130 = v79;
        __int16 v131 = 2080;
        v132 = v58;
        __int16 v133 = 1024;
        LODWORD(v134) = v77;
      }
      else
      {
        v93 = (const char *)*((void *)v2 + 7);
        if (!v93) {
          v93 = "[anonymous]";
        }
        int buf = 136446722;
        v130 = v93;
        __int16 v131 = 2080;
        v132 = v78;
        __int16 v133 = 1024;
        LODWORD(v134) = v77;
      }
      v73 = (char *)_os_log_send_and_compose_impl();
      CFIndex v74 = v77;
      int v75 = 720;
      goto LABEL_137;
    }
  }
  if ((_BYTE)v124)
  {
    int v88 = sub_100011358(&v113);
    if (v88)
    {
      int v89 = v88;
      if (*((void *)v2 + 9))
      {
        os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR);
        v90 = (const char *)*((void *)v2 + 7);
        if (!v90) {
          v90 = "[anonymous]";
        }
        int buf = 136446466;
        v130 = v90;
        __int16 v131 = 1024;
        LODWORD(v132) = v89;
      }
      else
      {
        v98 = (const char *)*((void *)v2 + 7);
        if (!v98) {
          v98 = "[anonymous]";
        }
        int buf = 136446466;
        v130 = v98;
        __int16 v131 = 1024;
        LODWORD(v132) = v88;
      }
      v94 = (char *)_os_log_send_and_compose_impl();
      CFIndex v97 = v89;
      v95 = "com.apple.security.cryptex.posix";
      int v96 = 729;
LABEL_175:
      CFErrorRef v22 = sub_10000BF78("_codex_import_core_continue", "codex.c", v96, v95, v97, 0, v94);
      int v87 = v94;
      goto LABEL_138;
    }
    if (!v113)
    {
      if (*((void *)v2 + 9))
      {
        os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR);
        v99 = (const char *)*((void *)v2 + 7);
        if (!v99) {
          v99 = "[anonymous]";
        }
        int buf = 136446466;
        v130 = v99;
        __int16 v131 = 2082;
        v132 = (char *)v115;
      }
      else
      {
        int v101 = (const char *)*((void *)v2 + 7);
        if (!v101) {
          int v101 = "[anonymous]";
        }
        int buf = 136446466;
        v130 = v101;
        __int16 v131 = 2082;
        v132 = (char *)v115;
      }
      v94 = (char *)_os_log_send_and_compose_impl();
      v95 = "com.apple.security.cryptex";
      int v96 = 735;
      CFIndex v97 = 20;
      goto LABEL_175;
    }
  }
  BOOL v92 = xpc_dictionary_get_BOOL(xdict[1], "NoCode");
  if (cryptex_core_is_cryptex1() && (v3[5] & 1) == 0 && ((v92 ^ ((v3[5] & 4) == 0)) & 1) == 0)
  {
    if (*((void *)v2 + 9))
    {
      os_log_type_enabled(*((os_log_t *)v2 + 9), OS_LOG_TYPE_ERROR);
      __int16 v100 = (const char *)*((void *)v2 + 7);
      if (!v100) {
        __int16 v100 = "[anonymous]";
      }
      int buf = 136446210;
      v130 = v100;
    }
    else
    {
      __int16 v102 = (const char *)*((void *)v2 + 7);
      if (!v102) {
        __int16 v102 = "[anonymous]";
      }
      int buf = 136446210;
      v130 = v102;
    }
    v94 = (char *)_os_log_send_and_compose_impl();
    v95 = "com.apple.security.cryptex";
    int v96 = 757;
    CFIndex v97 = 11;
    goto LABEL_175;
  }
  if (v92 || (v3[5] & 4) != 0) {
    sub_10002E820((uint64_t)&v115);
  }
  int v24 = (void *)sub_10002E82C(v2, v3, (uint64_t)&v115, 4);
  cryptex_set_target_object();
  cryptex_activate();
  sub_10001CD30((uint64_t)v2, v24);
  if (!context)
  {
    CFErrorRef v22 = 0;
    goto LABEL_27;
  }
  CFErrorRef v22 = 0;
  int v25 = 0;
  context[4] = os_retain(v24);
LABEL_28:
  sub_10003FA64(v125);
  sub_10002DDE8((uint64_t)&v115);
  long long v26 = *(void **)(a1 + 32);
  int v28 = *(void **)(a1 + 128);
  stat v27 = *(void (**)(void *, void, void *, CFErrorRef))(a1 + 136);
  if (v27) {
    v27(v2, *(void *)(a1 + 32), v24, v22);
  }
  sub_10001D288((uint64_t)v2, v28);
  sub_10003FE2C((void **)a1);
  if (v26) {
    os_release(v26);
  }
  if (context)
  {
    if (v22)
    {
      context[2] = CFRetain(v22);
      cryptex_target_async_f();
    }
    else
    {
      dispatch_async_f(*((dispatch_queue_t *)v2 + 12), context, (dispatch_function_t)sub_10001CEC0);
    }
  }
  free(v114);
  if (v25) {
    os_release(v25);
  }
  if (v24) {
    os_release(v24);
  }
  if (v23) {
    os_release(v23);
  }
  if (v22) {
    CFRelease(v22);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v5) {
    CFRelease(v5);
  }
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t sub_10001CD30(uint64_t a1, void *a2)
{
  if (a2[26]) {
    uint64_t v4 = (const char *)a2[26];
  }
  else {
    uint64_t v4 = "unknown quire";
  }
  uint64_t v5 = *(const char **)(a1 + 56);
  int v6 = *__error();
  CFTypeRef v7 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = "[anonymous]";
    uint64_t v9 = a2[26];
    if (v5) {
      uint64_t v8 = v5;
    }
    *(_DWORD *)int buf = 136446466;
    uint64_t v16 = v8;
    __int16 v17 = 2080;
    uint64_t v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: added cryptex: %s", buf, 0x16u);
  }
  *__error() = v6;
  sub_10003C2A8(a1 + 144, (uint64_t)(a2 + 10));
  os_retain(a2);
  int v10 = malloc_type_calloc(1uLL, 0x30uLL, 0x61D5536CuLL);
  if (!v10) {
    sub_100042A48(&v14, buf);
  }
  uint64_t v11 = (uint64_t)v10;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      uint64_t v12 = strdup(v4);
      if (v12) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    uint64_t v12 = strdup(v4);
    if (!v12) {
      sub_100042B18(v4, &v14, buf);
    }
  }
  *(void *)(v11 + 32) = v12;
  *(void *)(v11 + 40) = os_transaction_create();
  sub_10003C26C(v11, *(char **)(v11 + 32));
  return sub_10003C2A8(a1 + 1056, v11);
}

uint64_t sub_10001CEC0(void *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[4];
  uint64_t v4 = *(const char **)(a1[3] + 120);
  uint64_t v5 = *(const char **)(v3 + 208);
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*a1 + 96));
  int v6 = *(const char **)(v2 + 56);
  int v7 = *__error();
  uint64_t v8 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = "[anonymous]";
    *(_DWORD *)int buf = 136446722;
    if (v6) {
      uint64_t v9 = v6;
    }
    int v23 = v9;
    __int16 v24 = 2080;
    int v25 = v4;
    __int16 v26 = 2080;
    stat v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}s: renaming: src = %s, dst = %s", buf, 0x20u);
  }
  *__error() = v7;
  uint64_t v10 = 1408;
  if (*(void *)(*(void *)(v3 + 200) + 48) > 1uLL) {
    uint64_t v10 = 1396;
  }
  if (renameat(*(_DWORD *)(v2 + 1392), v4, *(_DWORD *)(v2 + v10), v5))
  {
    int v11 = *__error();
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      uint64_t v12 = *(const char **)(v2 + 56);
      if (!v12) {
        uint64_t v12 = "[anonymous]";
      }
    }
    else
    {
      uint64_t v12 = *(const char **)(v2 + 56);
      if (!v12) {
        uint64_t v12 = "[anonymous]";
      }
    }
    *(_DWORD *)int buf = 136446466;
    int v23 = v12;
    __int16 v24 = 1024;
    LODWORD(v25) = v11;
    uint64_t v16 = (char *)_os_log_send_and_compose_impl();
    int v17 = 1108;
    CFIndex v18 = v11;
LABEL_25:
    CFErrorRef v19 = sub_10000BF78("_codex_install_continue4", "codex.c", v17, "com.apple.security.cryptex.posix", v18, 0, v16);
    free(v16);
    goto LABEL_26;
  }
  int v13 = sub_10001D538(v3, 2);
  if (v13)
  {
    int v14 = v13;
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      CFIndex v15 = *(const char **)(v2 + 56);
      if (!v15) {
        CFIndex v15 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      int v23 = v15;
      __int16 v24 = 1024;
      LODWORD(v25) = v14;
    }
    else
    {
      __int16 v20 = *(const char **)(v2 + 56);
      if (!v20) {
        __int16 v20 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      int v23 = v20;
      __int16 v24 = 1024;
      LODWORD(v25) = v13;
    }
    uint64_t v16 = (char *)_os_log_send_and_compose_impl();
    CFIndex v18 = v14;
    int v17 = 1115;
    goto LABEL_25;
  }
  CFErrorRef v19 = 0;
LABEL_26:
  a1[2] = v19;
  return cryptex_async_f();
}

void sub_10001D288(uint64_t a1, void *a2)
{
  sub_10000A554();
  --*(_DWORD *)(a1 + 1360);
  uint64_t v4 = os_transaction_copy_description();
  uint64_t v5 = *(const char **)(a1 + 56);
  int v6 = *__error();
  int v7 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = "[anonymous]";
    int v9 = *(_DWORD *)(a1 + 1360);
    if (v5) {
      uint64_t v8 = v5;
    }
    *(_DWORD *)int buf = 136446978;
    int v29 = v8;
    __int16 v30 = 2080;
    uint64_t v31 = v4;
    __int16 v32 = 1024;
    int v33 = v9 + 1;
    __int16 v34 = 1024;
    int v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: de-activation: %s: %u -> %u", buf, 0x22u);
  }
  *__error() = v6;
  os_release(a2);
  int v10 = *(_DWORD *)(a1 + 1360);
  stat v27 = (void *)v4;
  if (v10)
  {
    if (v10 == -1) {
      sub_1000429B8();
    }
    goto LABEL_26;
  }
  int v11 = *(const char **)(a1 + 56);
  int v12 = *__error();
  int v13 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    int v14 = "[anonymous]";
    if (v11) {
      int v14 = v11;
    }
    *(_DWORD *)int buf = 136446210;
    int v29 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s: quiesced", buf, 0xCu);
  }
  *__error() = v12;
  uint64_t v15 = *(void *)(a1 + 1368);
  if (v15)
  {
    uint64_t v16 = (uint64_t *)(a1 + 1368);
    do
    {
      uint64_t v17 = *(void *)(v15 + 40);
      CFIndex v18 = *(const char **)(a1 + 56);
      int v19 = *__error();
      __int16 v20 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v21 = "[anonymous]";
        if (v18) {
          uint64_t v21 = v18;
        }
        *(_DWORD *)int buf = 136446210;
        int v29 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s: dispatching barrier", buf, 0xCu);
      }
      *__error() = v19;
      (*(void (**)(uint64_t, uint64_t))(v15 + 48))(a1, v17);
      uint64_t v22 = *(void *)(a1 + 1368);
      if (v22 == v15)
      {
        uint64_t v26 = *(void *)(v15 + 24);
        uint64_t *v16 = v26;
        uint64_t v25 = a1 + 1368;
        if (v26) {
          goto LABEL_22;
        }
      }
      else
      {
        do
        {
          uint64_t v23 = v22;
          uint64_t v22 = *(void *)(v22 + 24);
        }
        while (v22 != v15);
        uint64_t v24 = *(void *)(v15 + 24);
        *(void *)(v23 + 24) = v24;
        uint64_t v25 = v23 + 24;
        if (v24) {
          goto LABEL_22;
        }
      }
      *(void *)(a1 + 1376) = v25;
LABEL_22:
      *(void *)(v15 + 24) = -1;
      sub_10003FE2C((void **)v15);
      uint64_t v15 = *v16;
    }
    while (*v16);
  }
LABEL_26:
  free(v27);
}

uint64_t sub_10001D538(uint64_t a1, uint64_t a2)
{
  id v4 = sub_100016A9C();
  uint64_t v5 = sub_10000BDB8();
  int v6 = v5;
  int v7 = *(char ***)(a1 + 224);
  if (v7) {
    sub_10000BECC(v5, @"Version", *v7);
  }
  uint64_t v8 = *(char **)(a1 + 208);
  if (v8) {
    sub_10000BECC(v6, @"Identifier", v8);
  }
  else {
    uint64_t v8 = "name-unknown";
  }
  uint64_t v9 = sub_100016B3C(v4, a2, (uint64_t)v8, (uint64_t)v6);
  if (v6) {
    CFRelease(v6);
  }
  if (v4) {
    os_release(v4);
  }
  return v9;
}

uint64_t sub_10001D5EC(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[2];
  sub_10000A554();
  if (v3)
  {
    int v4 = *__error();
    uint64_t v5 = *(NSObject **)(v1 + 72);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      uint64_t v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "installation failed; cleaning up quire: %@",
        (uint8_t *)&v7,
        0xCu);
    }
    *__error() = v4;
    sub_10001D6E4(v1, v2);
  }
  return cryptex_target_async_f();
}

void sub_10001D6E4(uint64_t a1, void *a2)
{
  int v4 = (char *)a2[26];
  if (v4)
  {
    uint64_t v5 = sub_10003C3DC(a1 + 1056, v4);
    if (v5)
    {
      int v6 = (void **)v5;
      sub_10003C430(a1 + 1056, v5);
      free(v6[4]);
      void v6[4] = 0;
      os_release(v6[5]);
      free(v6);
    }
  }
  int v7 = *(const char **)(a1 + 56);
  int v8 = *__error();
  uint64_t v9 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v10 = "[anonymous]";
    uint64_t v11 = a2[26];
    if (v7) {
      int v10 = v7;
    }
    int v12 = 136446466;
    int v13 = v10;
    __int16 v14 = 2080;
    uint64_t v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}s: removed cryptex: %s", (uint8_t *)&v12, 0x16u);
  }
  *__error() = v8;
  sub_10003C430(a1 + 144, (uint64_t)(a2 + 10));
  os_release(a2);
}

void sub_10001D820(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000A554();
  int v6 = *__error();
  int v7 = *(NSObject **)(a1 + 72);
  if (a3)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a2 + 208);
      int v14 = 136315394;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = a3;
      uint64_t v9 = "initial cryptex bootstrap: %s: %@";
      int v10 = v7;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v14, v12);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = *(void *)(a2 + 208);
    int v14 = 136315138;
    uint64_t v15 = v13;
    uint64_t v9 = "initial cryptex bootstrap: %s [no error]";
    int v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    uint32_t v12 = 12;
    goto LABEL_6;
  }
  *__error() = v6;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
}

void sub_10001D948(uint64_t *a1)
{
  uint64_t v1 = *a1;
  bzero(v43, 0x400uLL);
  long long v41 = 0u;
  memset(v42, 0, sizeof(v42));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  *(_OWORD *)__str = 0u;
  long long v29 = 0u;
  int v26 = -1;
  if (!cryptex_core_get_asset()) {
    sub_100042BE8();
  }
  int v2 = realpath_np();
  if (v2)
  {
    int v3 = v2;
    int v4 = *(const char **)(v1 + 56);
    int v5 = *__error();
    int v6 = *(NSObject **)(v1 + 72);
    int v7 = "[anonymous]";
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if (v4) {
        uint64_t v8 = v4;
      }
      else {
        uint64_t v8 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __int16 v45 = v8;
      __int16 v46 = 1024;
      LODWORD(v47) = v3;
      uint64_t v9 = "%{public}s: realpath: %{darwin.errno}d";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  int v7 = basename(v43);
  snprintf(__str, 0xFFuLL, "%s.XXXXXX", v7);
  int v10 = sub_10001755C(v1, (uint64_t)&unk_100059D88, __str, &v26);
  if (v10)
  {
    int v3 = v10;
    os_log_type_t v11 = *(const char **)(v1 + 56);
    int v5 = *__error();
    int v6 = *(NSObject **)(v1 + 72);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      if (v11) {
        uint32_t v12 = v11;
      }
      else {
        uint32_t v12 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __int16 v45 = v12;
      __int16 v46 = 1024;
      LODWORD(v47) = v3;
      uint64_t v9 = "%{public}s: mkodtempat: %{darwin.errno}d";
      goto LABEL_14;
    }
LABEL_15:
    *__error() = v5;
LABEL_16:
    uint64_t v13 = *(const char **)(v1 + 56);
    int v14 = *__error();
    uint64_t v15 = *(NSObject **)(v1 + 72);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (v13) {
        __int16 v16 = v13;
      }
      else {
        __int16 v16 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446722;
      __int16 v45 = v16;
      __int16 v46 = 2080;
      __int16 v47 = v7;
      __int16 v48 = 1024;
      int v49 = v3;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%{public}s: failed to uninstall stale cryptex: %s: %{darwin.errno}d", buf, 0x1Cu);
    }
    *__error() = v14;
    int v17 = v26;
    goto LABEL_22;
  }
  int v17 = v26;
  if (renameat(*(_DWORD *)(v1 + 1396), v7, v26, "uninstalled"))
  {
    int v3 = *__error();
    CFIndex v18 = *(const char **)(v1 + 56);
    int v19 = *__error();
    __int16 v20 = *(NSObject **)(v1 + 72);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      if (v18) {
        uint64_t v21 = v18;
      }
      else {
        uint64_t v21 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      __int16 v45 = v21;
      __int16 v46 = 1024;
      LODWORD(v47) = v3;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}s: renameat: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v19;
    if (v3) {
      goto LABEL_16;
    }
  }
  uint64_t v22 = *(const char **)(v1 + 56);
  int v23 = *__error();
  uint64_t v24 = *(NSObject **)(v1 + 72);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    if (v22) {
      uint64_t v25 = v22;
    }
    else {
      uint64_t v25 = "[anonymous]";
    }
    *(_DWORD *)int buf = 136446466;
    __int16 v45 = v25;
    __int16 v46 = 2080;
    __int16 v47 = v7;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}s: uninstalled stale cryptex: %s", buf, 0x16u);
  }
  *__error() = v23;
LABEL_22:
  dispatch_group_leave(*(dispatch_group_t *)(v1 + 104));
  if (v17 != -1 && close(v17) == -1) {
    sub_100041A38(&v27, buf);
  }
}

void sub_10001DD08(void *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[3];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*a1 + 96));
  if (cryptex_core_get_asset())
  {
    int v4 = *(const char **)(v2 + 56);
    int v5 = *__error();
    int v6 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v7 = "[anonymous]";
      if (v4) {
        int v7 = v4;
      }
      *(_DWORD *)int buf = 136446210;
      long long v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: pre-canned manifest", buf, 0xCu);
    }
    *__error() = v5;
    a1[2] = 0;
    goto LABEL_7;
  }
  uint64_t v8 = *(const char **)(v2 + 56);
  int v9 = *__error();
  int v10 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    os_log_type_t v11 = "[anonymous]";
    if (v8) {
      os_log_type_t v11 = v8;
    }
    *(_DWORD *)int buf = 136446210;
    long long v31 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}s: writing im4m to disk", buf, 0xCu);
  }
  *__error() = v9;
  int v12 = openat(*(_DWORD *)(v3 + 112), *((const char **)&_cryptex_asset_type_im4m + 5), 513, 438);
  if (v12 < 0)
  {
    int v20 = *__error();
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      uint64_t v21 = *(const char **)(v2 + 56);
      if (!v21) {
        uint64_t v21 = "[anonymous]";
      }
    }
    else
    {
      uint64_t v21 = *(const char **)(v2 + 56);
      if (!v21) {
        uint64_t v21 = "[anonymous]";
      }
    }
    *(_DWORD *)int buf = 136446466;
    long long v31 = v21;
    __int16 v32 = 1024;
    int v33 = v20;
    uint64_t v25 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v22 = sub_10000BF78("_codex_install_continue2", "codex.c", 1161, "com.apple.security.cryptex.posix", v20, 0, v25);
    free(v25);
LABEL_37:
    if (v12 == -1) {
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_DEBUG))
  {
    bzero(buf, 0x400uLL);
    if (!realpath_np())
    {
      uint64_t v13 = *(const char **)(v2 + 56);
      int v14 = *__error();
      uint64_t v15 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        __int16 v16 = "[anonymous]";
        if (v13) {
          __int16 v16 = v13;
        }
        *(_DWORD *)int v26 = 136446466;
        uint64_t v27 = v16;
        __int16 v28 = 2080;
        long long v29 = buf;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}s: im4m path: %s", v26, 0x16u);
      }
      *__error() = v14;
    }
  }
  int v17 = cryptex_signature_write();
  if (!v17)
  {
    cryptex_asset_new();
    cryptex_core_set_asset();
    CFErrorRef v22 = 0;
    goto LABEL_37;
  }
  int v18 = v17;
  if (*(void *)(v2 + 72))
  {
    os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
    int v19 = *(const char **)(v2 + 56);
    if (!v19) {
      int v19 = "[anonymous]";
    }
    *(_DWORD *)int buf = 136446466;
    long long v31 = v19;
    __int16 v32 = 1024;
    int v33 = v18;
  }
  else
  {
    int v23 = *(const char **)(v2 + 56);
    if (!v23) {
      int v23 = "[anonymous]";
    }
    *(_DWORD *)int buf = 136446466;
    long long v31 = v23;
    __int16 v32 = 1024;
    int v33 = v17;
  }
  uint64_t v24 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef v22 = sub_10000BF78("_codex_install_continue2", "codex.c", 1179, "com.apple.security.cryptex.posix", v18, 0, v24);
  free(v24);
LABEL_38:
  if (close(v12) == -1) {
    sub_100041A38(v26, buf);
  }
LABEL_39:
  a1[2] = v22;
  if (!v22)
  {
LABEL_7:
    cryptex_async_f();
    return;
  }
  cryptex_target_async_f();
}

void sub_10001E284(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 24);
  sub_10000A554();
  int v4 = *(void **)(v3 + 104);
  int v5 = sub_10003FD2C(v2, 0x98uLL);
  v5[18] = a1;

  sub_10001AD98((uint64_t)v2, v4, v5);
}

void sub_10001E2E8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v7 = *(void *)a5;
  if (a4)
  {
    if (*(void *)(v7 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v7 + 72), OS_LOG_TYPE_ERROR);
    }
    int v9 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v10 = sub_10000BF78("_protex_stage_install_callback", "codex.c", 2844, "com.apple.security.cryptex.posix", a4, 0, v9);
    free(v9);
    *(void *)(a5 + 16) = v10;
  }
  else if (!v7)
  {
    return;
  }
  uint64_t v11 = *(void *)(a5 + 40);
  if (v11) {
    sub_100017678((void *)v7, a1, 0, *(_DWORD *)(a5 + 48), a5, v11);
  }
}

void sub_10001E4B8(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t *a5)
{
  uint64_t v6 = *a5;
  if (a4)
  {
    if (*(void *)(v6 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v6 + 72), OS_LOG_TYPE_ERROR);
    }
    int v9 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v10 = sub_10000BF78("_codex_mount_continue2", "codex.c", 3001, "com.apple.security.cryptex.posix", a4, 0, v9);
    free(v9);
    if (v10)
    {
      a5[2] = (uint64_t)v10;
      cryptex_target_async_f();
    }
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 104) + 216);
    if (v8) {
      *(unsigned char *)(v8 + 64) = 1;
    }
    cryptex_async_f();
  }
}

void sub_10001E6DC(void **a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[5];
  ((void (*)(void *, void *, void *, void *))a1[7])(*a1, a1[5], a1[2], a1[6]);
  os_release(a1[3]);
  os_release(a1[4]);
  sub_10003FE2C(a1);
  if (v3) {
    os_release(v3);
  }
  if (v2)
  {
    CFRelease(v2);
  }
}

void sub_10001E76C(void *a1)
{
  uint64_t v2 = (void *)*a1;
  uint64_t v3 = a1[4];
  if ((*(_DWORD *)(v3 + 112) & 0x80000000) != 0)
  {
    CFIndex v5 = *__error();
    if (v2[9]) {
      os_log_type_enabled((os_log_t)v2[9], OS_LOG_TYPE_ERROR);
    }
    __error();
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v7 = sub_10000BF78("_codex_mount_continue3", "codex.c", 2978, "com.apple.security.cryptex.posix", v5, 0, v6);
    free(v6);
    if (v7)
    {
      a1[2] = v7;
      cryptex_target_async_f();
    }
  }
  else
  {
    int v4 = (void *)*a1;
    sub_100017678(v4, v3, 0, 0, (uint64_t)a1, (uint64_t)sub_10001E9B0);
  }
}

void sub_10001E9B0(uint64_t a1, void *a2, const __CFDictionary *a3, uint64_t a4)
{
  if (a3 && (sub_10000C218(a3, @"com.apple.security.cryptex", 17) & 1) == 0)
  {
    if (*(void *)(a1 + 72)) {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
    }
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    int v9 = "com.apple.security.cryptex";
    int v10 = 2942;
    CFIndex v11 = 14;
    CFDictionaryRef v12 = a3;
LABEL_16:
    CFErrorRef v13 = sub_10000BF78("_codex_mount_continue4", "codex.c", v10, v9, v11, v12, v8);
    free(v8);
    if (!v13) {
      return;
    }
    goto LABEL_17;
  }
  if (!a2)
  {
    if (*(void *)(a1 + 72)) {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
    }
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    int v9 = "com.apple.security.cryptex.posix";
    int v10 = 2948;
    CFIndex v11 = 2;
    CFDictionaryRef v12 = 0;
    goto LABEL_16;
  }
  if (sub_10000C218(a3, @"com.apple.security.cryptex", 17))
  {
    if (*(void *)(a1 + 72)) {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
    }
    int v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v13 = sub_10000BF78("_codex_mount_continue4", "codex.c", 2955, "com.apple.security.cryptex", 1, 0, v14);
    free(v14);
    *(void *)(a4 + 40) = os_retain(a2);
    if (!v13) {
      return;
    }
LABEL_17:
    *(void *)(a4 + 16) = v13;
    cryptex_target_async_f();
    return;
  }

  sub_100019648(a1, a2, a4, (uint64_t)sub_10001EE40);
}

void sub_10001EE40(uint64_t a1, void *object, const void *a3, uint64_t a4)
{
  *(void *)(a4 + 40) = os_retain(object);
  if (!a3) {
    goto LABEL_6;
  }
  if (*(void *)(a1 + 72)) {
    os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
  }
  CFErrorRef v7 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef v8 = sub_10000BF78("_codex_mount_continue5", "codex.c", 2923, "com.apple.security.cryptex", 14, a3, v7);
  free(v7);
  if (v8)
  {
    *(void *)(a4 + 16) = CFRetain(v8);
    cryptex_target_async_f();
    CFRelease(v8);
  }
  else
  {
LABEL_6:
    *(void *)(a4 + 16) = 0;
    cryptex_target_async_f();
  }
}

void sub_10001F024(void *a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v7 = *a4;
  sub_10000A554();
  if (a3)
  {
    if (*(void *)(v7 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v7 + 72), OS_LOG_TYPE_ERROR);
    }
    CFErrorRef v8 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v9 = sub_10000BF78("_codex_unmount_continue2", "codex.c", 3109, "com.apple.security.cryptex", 2, a3, v8);
    free(v8);
    if (v9)
    {
      a4[2] = (uint64_t)CFRetain(v9);
      cryptex_target_async_f();
      CFRelease(v9);
    }
  }
  else
  {
    sub_10001F2CC(v7, a1);
    sub_100018E84((void *)v7, a1, (uint64_t)a4, (uint64_t)sub_10001F3C4);
  }
}

void sub_10001F244(void **a1)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[23];
  ((void (*)(void *, void *, void *, void *))a1[25])(*a1, a1[23], a1[2], a1[24]);
  sub_10002DDE8((uint64_t)(a1 + 3));
  sub_10003FE2C(a1);
  if (v3) {
    os_release(v3);
  }
  if (v2)
  {
    CFRelease(v2);
  }
}

void sub_10001F2CC(uint64_t a1, void *a2)
{
  int v4 = *(const char **)(a1 + 56);
  int v5 = *__error();
  uint64_t v6 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = "[anonymous]";
    uint64_t v8 = a2[26];
    if (v4) {
      uint64_t v7 = v4;
    }
    int v9 = 136446466;
    int v10 = v7;
    __int16 v11 = 2080;
    uint64_t v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: deactivated cryptex: %s", (uint8_t *)&v9, 0x16u);
  }
  *__error() = v5;
  sub_10003C430(a1 + 448, (uint64_t)(a2 + 14));
  os_release(a2);
}

uint64_t sub_10001F3C4(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  if (a3)
  {
    if (*(void *)(a1 + 72)) {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v7 = sub_10000BF78("_codex_unmount_continue3", "codex.c", 3084, "com.apple.security.cryptex", 2, a3, v6);
    free(v6);
    if (v7) {
      *(void *)(a4 + 16) = v7;
    }
  }
  return cryptex_target_async_f();
}

CFErrorRef sub_10001F568(uint64_t a1, int a2, char *a3, int a4)
{
  if ((renameat(a2, a3, a4, "uninstalled") & 0x80000000) == 0 || (*__error() | 2) == 2) {
    return 0;
  }
  CFIndex v7 = *__error();
  if (*(void *)(a1 + 72)) {
    os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
  }
  __error();
  uint64_t v8 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef v5 = sub_10000BF78("_codex_uninstall_location", "codex.c", 1334, "com.apple.security.cryptex.posix", v7, 0, v8);
  free(v8);
  return v5;
}

void sub_10001F750(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void **)(a1 + 32);
  int v4 = *(const void **)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 48);
  sub_10000A554();
  (*(void (**)(void *, void *, const void *, uint64_t))(a1 + 56))(v2, v3, v4, v5);
  sub_10003FE2C((void **)a1);
  if (v4) {
    CFRelease(v4);
  }
  if (v3)
  {
    os_release(v3);
  }
}

uint64_t sub_10001F7EC(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = (void *)a1[4];
  sub_10000A554();
  sub_10001D6E4(v2, v3);
  int v4 = sub_10001D538((uint64_t)v3, 4);
  if (v4)
  {
    int v5 = v4;
    if (*(void *)(v2 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
    }
    uint64_t v6 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v7 = sub_10000BF78("_codex_uninstall_continue2", "codex.c", 1311, "com.apple.security.cryptex.posix", v5, 0, v6);
    free(v6);
    a1[2] = (uint64_t)v7;
  }
  return cryptex_target_async_f();
}

void sub_10001F9C4(uint64_t a1)
{
  uint64_t v2 = *(dispatch_group_t **)a1;
  int v4 = *(const void **)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 40);
  sub_10000A554();
  dispatch_group_leave(v2[14]);
  (*(void (**)(dispatch_group_t *, void *, const void *, uint64_t))(a1 + 48))(v2, v3, v4, v5);
  sub_10003FE2C((void **)a1);
  if (v4) {
    CFRelease(v4);
  }
  if (v3)
  {
    os_release(v3);
  }
}

uint64_t sub_10001FA64(uint64_t a1, uint64_t a2, const void *a3, uint64_t *a4)
{
  uint64_t v7 = *a4;
  sub_10000A554();
  uint64_t v8 = *(const char **)(v7 + 56);
  int v9 = *__error();
  int v10 = *(NSObject **)(v7 + 72);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      __int16 v11 = v8;
    }
    else {
      __int16 v11 = "[anonymous]";
    }
    uint64_t v12 = *(void *)(a1 + 208);
    int v34 = 136446466;
    long long v35 = v11;
    __int16 v36 = 2080;
    *(void *)long long v37 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s: quire bootstrap: %s", (uint8_t *)&v34, 0x16u);
  }
  *__error() = v9;
  if (!a3)
  {
    CFErrorRef v13 = *(const char **)(v7 + 56);
    int v14 = *__error();
    uint64_t v15 = *(NSObject **)(v7 + 72);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      if (v13) {
        __int16 v16 = v13;
      }
      else {
        __int16 v16 = "[anonymous]";
      }
      int v34 = 136446210;
      long long v35 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}s: _codex_bootstrap_continue2 bootstrap succeeded", (uint8_t *)&v34, 0xCu);
    }
    *__error() = v14;
    int v17 = *(const char **)(v7 + 56);
    int v18 = *__error();
    int v19 = *(NSObject **)(v7 + 72);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      if (v17) {
        int v20 = v17;
      }
      else {
        int v20 = "[anonymous]";
      }
      uint64_t v21 = *(void *)(a1 + 208);
      int v34 = 136446466;
      long long v35 = v20;
      __int16 v36 = 2080;
      *(void *)long long v37 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "%{public}s: activated cryptex: %s", (uint8_t *)&v34, 0x16u);
    }
    *__error() = v18;
    CFErrorRef v22 = *(const char **)(v7 + 56);
    int v23 = *__error();
    uint64_t v24 = *(NSObject **)(v7 + 72);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      if (v22) {
        uint64_t v25 = v22;
      }
      else {
        uint64_t v25 = "[anonymous]";
      }
      int v26 = *(_DWORD *)(a1 + 188);
      int v27 = *(_DWORD *)(a1 + 400);
      int v34 = 136446722;
      long long v35 = v25;
      __int16 v36 = 1024;
      *(_DWORD *)long long v37 = v26;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = v27;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}s: UID: %d\tFD: %d", (uint8_t *)&v34, 0x18u);
    }
    *__error() = v23;
    sub_10003C2A8(v7 + 448, a1 + 112);
    os_retain((void *)a1);
  }
  __int16 v28 = *(const char **)(v7 + 56);
  int v29 = *__error();
  long long v30 = *(NSObject **)(v7 + 72);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    if (v28) {
      long long v31 = v28;
    }
    else {
      long long v31 = "[anonymous]";
    }
    int v34 = 136446210;
    long long v35 = v31;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%{public}s: _codex_bootstrap_continue2 occured", (uint8_t *)&v34, 0xCu);
  }
  *__error() = v29;
  if (a3) {
    CFTypeRef v32 = CFRetain(a3);
  }
  else {
    CFTypeRef v32 = 0;
  }
  a4[2] = (uint64_t)v32;
  return cryptex_target_async_f();
}

void sub_10001FD64(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  int v4 = *(const void **)(a1 + 16);
  uint64_t v3 = *(void **)(a1 + 24);
  uint64_t v5 = *(void *)(a1 + 40);
  sub_10000A554();
  (*(void (**)(void *, void *, const void *, uint64_t))(a1 + 48))(v2, v3, v4, v5);
  sub_10003FE2C((void **)a1);
  if (v4) {
    CFRelease(v4);
  }
  if (v3)
  {
    os_release(v3);
  }
}

void sub_10001FDFC(void *a1, uint64_t *a2, const void *a3, uint64_t *a4)
{
  uint64_t v8 = *a4;
  int v9 = (const void *)a4[2];
  uint64_t v10 = *a2;
  sub_10000A554();
  int v11 = *__error();
  uint64_t v12 = *(NSObject **)(v8 + 72);
  if (a3)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    *(_DWORD *)int buf = 138412290;
    long long v43 = a3;
    CFErrorRef v13 = "unmount: %@";
    int v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_7;
    }
    *(_WORD *)int buf = 0;
    CFErrorRef v13 = "unmount [no error]";
    int v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
    uint32_t v16 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, v16);
LABEL_7:
  *__error() = v11;
  int v17 = *__error();
  int v18 = *(NSObject **)(v8 + 72);
  if (v9)
  {
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    *(_DWORD *)int buf = 138412290;
    long long v43 = v9;
    int v19 = "forwarded unbootstrap: %@";
    int v20 = v18;
    os_log_type_t v21 = OS_LOG_TYPE_ERROR;
    uint32_t v22 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_13;
    }
    *(_WORD *)int buf = 0;
    int v19 = "forwarded unbootstrap [no error]";
    int v20 = v18;
    os_log_type_t v21 = OS_LOG_TYPE_DEBUG;
    uint32_t v22 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, v22);
LABEL_13:
  *__error() = v17;
  if (sub_10003C424(v8 + 448, (uint64_t)(a1 + 14))) {
    sub_10001F2CC(v8, a1);
  }
  if (v10)
  {
    *(void *)uint64_t v10 = *(void *)(v8 + 136);
    *(void *)(v8 + 136) = v10;
    *a2 = 0;
    bzero(buf, 0x400uLL);
    bzero(__str, 0x400uLL);
    if ((*(_DWORD *)(v10 + 12) & 0x80000000) != 0) {
      sub_100042C04(&v34, v35);
    }
    if (os_log_type_enabled(*(os_log_t *)(v8 + 72), OS_LOG_TYPE_DEBUG))
    {
      int v23 = realpath_np();
      if (v23)
      {
        int v24 = v23;
        uint64_t v25 = strerror(v23);
        snprintf((char *)buf, 0x400uLL, "[%d: %s]", v24, v25);
      }
      if ((*(_DWORD *)(v10 + 8) & 0x80000000) != 0)
      {
        strcpy(__str, "[none]");
      }
      else
      {
        int v26 = realpath_np();
        if (v26)
        {
          int v27 = v26;
          __int16 v28 = strerror(v26);
          snprintf(__str, 0x400uLL, "[%d: %s]", v27, v28);
        }
      }
      int v29 = *(const char **)(v8 + 56);
      int v30 = *__error();
      long long v31 = *(NSObject **)(v8 + 72);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        CFTypeRef v32 = "[anonymous]";
        *(_DWORD *)long long v35 = 136446722;
        if (v29) {
          CFTypeRef v32 = v29;
        }
        __int16 v36 = v32;
        __int16 v37 = 2080;
        long long v38 = buf;
        __int16 v39 = 2080;
        long long v40 = __str;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%{public}s: claimed quire husk: dev = %s, mnt = %s", v35, 0x20u);
      }
      *__error() = v30;
    }
  }
  if (a3) {
    CFTypeRef v33 = CFRetain(a3);
  }
  else {
    CFTypeRef v33 = 0;
  }
  a4[2] = (uint64_t)v33;
  cryptex_target_async_f();
  if (v9) {
    CFRelease(v9);
  }
}

uint64_t sub_100020168(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  int v3 = *(_DWORD *)(a1 + 8);
  int v19 = -1;
  if (v3)
  {
    int v4 = *(const char **)(v2 + 56);
    int v5 = *__error();
    uint64_t v6 = *(NSObject **)(v2 + 72);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    uint64_t v7 = "[anonymous]";
    if (v4) {
      uint64_t v7 = v4;
    }
    *(_DWORD *)int buf = 136446466;
    uint32_t v22 = v7;
    __int16 v23 = 1024;
    int v24 = v3;
    uint64_t v8 = "%{public}s: failed to lock down codex: %{darwin.errno}d";
LABEL_18:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, v8, buf, 0x12u);
    goto LABEL_19;
  }
  int v9 = sub_100017444(v2, (uint64_t)&unk_100048800, "lockdown", 2560, 438, &v19);
  int v3 = v9;
  if ((v9 - 23) < 2)
  {
    CFErrorRef v13 = *(const char **)(v2 + 56);
    int v5 = *__error();
    uint64_t v6 = *(NSObject **)(v2 + 72);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v14 = "[anonymous]";
    if (v13) {
      int v14 = v13;
    }
    *(_DWORD *)int buf = 136446466;
    uint32_t v22 = v14;
    __int16 v23 = 1024;
    int v24 = v3;
    uint64_t v8 = "%{public}s: failed to write lockdown state cookie: %{darwin.errno}d";
    goto LABEL_18;
  }
  if (v9 == 17)
  {
    uint32_t v16 = *(const char **)(v2 + 56);
    int v5 = *__error();
    int v17 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v18 = "[anonymous]";
      if (v16) {
        int v18 = v16;
      }
      *(_DWORD *)int buf = 136446210;
      uint32_t v22 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}s: codex already locked down", buf, 0xCu);
    }
    int v3 = 37;
  }
  else
  {
    if (v9) {
      sub_100042C80(&v20, buf);
    }
    uint64_t v10 = *(const char **)(v2 + 56);
    int v5 = *__error();
    int v11 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = "[anonymous]";
      if (v10) {
        uint64_t v12 = v10;
      }
      *(_DWORD *)int buf = 136446210;
      uint32_t v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s: wrote lockdown state cookie", buf, 0xCu);
    }
    int v3 = 0;
  }
LABEL_19:
  *__error() = v5;
  *(_DWORD *)(a1 + 8) = v3;
  cryptex_target_async_f();
  uint64_t result = v19;
  if (v19 != -1)
  {
    uint64_t result = close(v19);
    if (result == -1) {
      sub_100041A38(&v20, buf);
    }
  }
  return result;
}

void sub_100020424(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(unsigned int *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 24);
  sub_10000A554();
  (*(void (**)(void *, uint64_t, uint64_t))(a1 + 32))(v2, v3, v4);

  sub_10003FE2C((void **)a1);
}

void sub_100020484(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)a2[4];
  int v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  for (uint64_t i = 0; i != 37; ++i)
  {
    for (uint64_t j = *(void *)(a1 + 144 + 8 * i); j; uint64_t j = *(void *)(j + 8))
    {
      uint64_t v8 = sub_10003FD2C((void *)(j - 80), 0x40uLL);
      v8[3] = os_retain(v5);
      v8[4] = os_retain(v4);
      dispatch_group_enter(v5);
      cryptex_async_f();
    }
  }
  dispatch_group_notify_f(v5, *(dispatch_queue_t *)(a1 + 32), a2, (dispatch_function_t)sub_1000206B8);
  dispatch_group_leave(v5);
  if (v5)
  {
    os_release(v5);
  }
}

void sub_1000205A8(uint64_t *a1)
{
  uint64_t v2 = *a1;
  xpc_object_t v3 = xpc_array_create(0, 0);
  xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, *(const char **)(v2 + 208));
  xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, **(const char ***)(v2 + 224));
  if (*(void *)(v2 + 408))
  {
    xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, "[not mounted]");
    xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, "[not mounted]");
    uint64_t v4 = v3;
    int v5 = "[not mounted]";
  }
  else
  {
    xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, *(const char **)(v2 + 424));
    xpc_array_set_string(v3, 0xFFFFFFFFFFFFFFFFLL, *(const char **)(v2 + 432));
    int v5 = *(const char **)(v2 + 416);
    uint64_t v4 = v3;
  }
  xpc_array_set_string(v4, 0xFFFFFFFFFFFFFFFFLL, v5);
  int v6 = sub_10000C110(*(void *)(v2 + 408));
  xpc_array_set_int64(v3, 0xFFFFFFFFFFFFFFFFLL, v6);
  a1[5] = (uint64_t)v3;
  uint64_t v7 = sub_10000A564();

  dispatch_async_f(v7, a1, (dispatch_function_t)sub_100020708);
}

void sub_1000206B8(void **a1)
{
  ((void (*)(void *, void, void *, void *))a1[7])(*a1, *((unsigned int *)a1 + 2), a1[4], a1[6]);
  xpc_release(a1[4]);

  sub_10003FE2C(a1);
}

void sub_100020708(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 24);
  xpc_object_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  xpc_array_append_value(v3, v4);
  dispatch_group_leave(v2);
  sub_10003FE2C((void **)a1);
  if (v4) {
    os_release(v4);
  }
  if (v3) {
    os_release(v3);
  }
  if (v2)
  {
    os_release(v2);
  }
}

void sub_10002093C(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_10005E850;
  qword_10005E850 = (uint64_t)v1;

  if (!qword_10005E850) {
    sub_100042D8C(&v3, v4);
  }
}

void sub_100020A94(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) coll_map];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v3 = [objc_alloc((Class)CollationCore) initWithID:*(unsigned int *)(a1 + 48)];
    uint64_t v4 = [*(id *)(a1 + 32) coll_map];
    [v4 setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];

    if (*(_DWORD *)(a1 + 48))
    {
      int v5 = [*(id *)(a1 + 32) coll_map];
      int v6 = [v5 objectForKeyedSubscript:&off_10005BBD0];

      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100020BC0;
      v7[3] = &unk_10005A2D8;
      id v3 = v3;
      id v8 = v3;
      [v6 enumerateCollationElements:v7];
    }
  }
}

uint64_t sub_100020BC0(uint64_t a1, uint64_t a2)
{
  return 1;
}

void sub_100020CB4(uint64_t a1)
{
  uint64_t v2 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  id v3 = sub_100033EE0(*(void *)(a1 + 32));
  if (v3)
  {
    uint64_t v4 = +[NSString stringWithUTF8String:v3];
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = sub_100033EE8(*(void *)(a1 + 32));
  if (v5)
  {
    uint64_t v6 = _CFXPCCreateCFObjectFromXPCObject();
  }
  else
  {
    uint64_t v6 = 0;
  }
  long long v40 = (void *)v5;
  long long v41 = (void *)v2;
  uint64_t v7 = sub_100033EF0(*(void *)(a1 + 32));
  id v8 = (void *)v4;
  if (v7)
  {
    uint64_t v9 = _CFXPCCreateCFObjectFromXPCObject();
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = +[NSString stringWithUTF8String:sub_100033ED8(*(void *)(a1 + 32))];
  uint64_t v11 = +[NSString stringWithUTF8String:sub_100033EF8(*(void *)(a1 + 32))];
  uint64_t v12 = +[NSString stringWithUTF8String:*(void *)sub_100033F00(*(void *)(a1 + 32))];
  id v13 = objc_alloc((Class)CollationElement);
  __int16 v37 = (void *)v11;
  long long v38 = (void *)v9;
  uint64_t v14 = v11;
  __int16 v36 = (void *)v12;
  __int16 v39 = (void *)v6;
  os_log_type_t v15 = v8;
  id v16 = [v13 initWithBundle:v14 version:v12 atPath:v10 withScope:1 withCommand:v8 withCommandArgs:v6 withEnv:v9];
  int v17 = [*(id *)(a1 + 40) coll_map];
  int v18 = v41;
  id v19 = [v17 objectForKeyedSubscript:v41];

  uint64_t v20 = v40;
  if (!v19)
  {
    os_log_type_t v21 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      sub_100042E1C((int *)(a1 + 48), v21);
    }
    id v19 = [objc_alloc((Class)CollationCore) initWithID:*(unsigned int *)(a1 + 48)];
    uint32_t v22 = [*(id *)(a1 + 40) coll_map];
    [v22 setObject:v19 forKeyedSubscript:v41];
  }
  __int16 v23 = [*(id *)(a1 + 40) coll_map];
  id v24 = [v23 count];

  if ((unint64_t)v24 >= 2)
  {
    uint64_t v34 = v7;
    long long v35 = v15;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v25 = [*(id *)(a1 + 40) coll_map];
    int v26 = [v25 keyEnumerator];

    id v27 = [v26 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v28; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v43 != v29) {
            objc_enumerationMutation(v26);
          }
          long long v31 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          if ([v31 intValue])
          {
            CFTypeRef v32 = [*(id *)(a1 + 40) coll_map];
            CFTypeRef v33 = [v32 objectForKeyedSubscript:v31];

            [v33 appendCollationElement:v16];
          }
        }
        id v28 = [v26 countByEnumeratingWithState:&v42 objects:v46 count:16];
      }
      while (v28);
    }

    uint64_t v20 = v40;
    int v18 = v41;
    uint64_t v7 = v34;
    os_log_type_t v15 = v35;
  }
  [v19 appendCollationElement:v16];
}

void sub_100021114(uint64_t a1)
{
  uint64_t v2 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v2];
  if (!v3) {
    sub_100042E98(&v9, v10);
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100042FE4(a1, (int *)(a1 + 48), v5);
  }
  uint64_t v6 = +[NSString stringWithUTF8String:*(void *)(a1 + 40)];
  unsigned __int8 v7 = [v4 removeCollationElementWithPath:v6];

  if ((v7 & 1) == 0) {
    sub_100042FC8();
  }
  if ([v4 isEmpty])
  {
    id v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100042F4C((int *)(a1 + 48), v8);
    }
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:v2];
  }
}

void sub_100021360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100021378(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) coll_map];
  uint64_t v3 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 64)];
  uint64_t v4 = [v2 objectForKey:v3];

  if (v4)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100021454;
    v5[3] = &unk_10005A350;
    long long v6 = *(_OWORD *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 56);
    [v4 enumerateElements:v5];
  }
}

BOOL sub_100021454(uint64_t a1, int a2, char *__s2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (*(unsigned char *)(v3 + 24)) {
    sub_100043074(&v6, v7);
  }
  if (strcmp(*(const char **)(a1 + 40), __s2)) {
    return 1;
  }
  if (*(void *)(a1 + 48))
  {
    *(void *)&v7[0] = cryptex_version_new();
    if ((cryptex_version_compare() & 0x80000000) == 0) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
    cryptex_version_destroy();
    return *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 0;
  }
  else
  {
    BOOL result = 0;
    *(unsigned char *)(v3 + 24) = 1;
  }
  return result;
}

uint64_t sub_1000215D0(void *a1)
{
  id v1 = a1;
  sub_100033ED0((uint64_t)v1);
  uint64_t v2 = +[CollationMap addEntryForUser:0 fromQuire:v1];

  return v2;
}

id sub_100021618(void *a1)
{
  id v1 = a1;
  sub_100033ED0((uint64_t)v1);
  uint64_t v2 = sub_100033ED8((uint64_t)v1);

  return (id)+[CollationMap removeEntryForUser:0 withValue:v2];
}

id sub_10002167C(uint64_t a1)
{
  uint64_t v2 = +[CollationMap getMap];
  uint64_t v3 = [v2 coll_map];

  uint64_t v4 = +[NSNumber numberWithUnsignedInt:a1];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5)
  {
    uint64_t v5 = [v3 objectForKeyedSubscript:&off_10005BBD0];
  }
  uint64_t v6 = [v5 createEndpoint];

  return v6;
}

BOOL sub_100021740(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    uint64_t v4 = cryptex_version_new();
  }
  else {
    uint64_t v4 = 0;
  }
  BOOL v5 = +[CollationMap lookupEntryForUser:0 withBundleID:a2 minVersion:v4];
  cryptex_version_destroy();
  return v5;
}

id sub_1000217AC()
{
  return +[CollationMap createCollationForUser:0];
}

void sub_100021940(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_10005E860;
  qword_10005E860 = (uint64_t)v1;

  if (!qword_10005E860) {
    sub_10004319C(&v3, v4);
  }
}

void sub_100021A28(void *a1)
{
  id v1 = a1;
  xpc_remote_connection_set_event_handler();
  xpc_remote_connection_activate();
}

void sub_100021A74(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    int v3 = *__error();
    uint64_t v4 = sub_100021C6C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      string = xpc_dictionary_get_string(v2, _xpc_error_key_description);
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Received error from client: %s", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_8;
  }
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_dictionary)
  {
    int v3 = *__error();
    uint64_t v4 = sub_100021C6C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Malformed message from client", (uint8_t *)&v8, 2u);
    }
LABEL_8:

    *__error() = v3;
    goto LABEL_12;
  }
  BOOL v5 = xpc_copy_description(v2);
  int v6 = *__error();
  uint64_t v7 = sub_100021C6C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315138;
    string = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "remote service msg recv: %s", (uint8_t *)&v8, 0xCu);
  }

  *__error() = v6;
  sub_100021CC0(v2);
  free(v5);
LABEL_12:
}

void sub_100021C4C(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

id sub_100021C6C()
{
  if (qword_10005E868 != -1) {
    dispatch_once(&qword_10005E868, &stru_10005A3D8);
  }
  uint64_t v0 = (void *)qword_10005E870;

  return v0;
}

void sub_100021CC0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = xpc_dictionary_get_value(v1, "routine");
  int v3 = v2;
  if (!v2)
  {
    int v4 = *__error();
    BOOL v5 = sub_100021C6C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Malformed message from client: no routine key found", buf, 2u);
    }
    goto LABEL_8;
  }
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_string)
  {
    int v4 = *__error();
    BOOL v5 = sub_100021C6C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Malformed message from client: routine is not a string", buf, 2u);
    }
LABEL_8:

    *__error() = v4;
    int v6 = sub_100040644(v1, 0, 22);
LABEL_9:
    id v7 = v6;
    goto LABEL_10;
  }
  string_ptr = xpc_string_get_string_ptr(v3);
  if (!strcmp(string_ptr, "get-nonce"))
  {
    id v11 = v1;
    *(void *)&long long v198 = 0;
    long long v197 = 0u;
    memset(buf, 0, sizeof(buf));
    uint64_t v126 = 0;
    int v12 = sub_100040EEC(v11, &v126);
    id v13 = v126;
    uint64_t v14 = v13;
    if (v12)
    {
      os_log_type_t v15 = sub_100021C6C();

      if (v15)
      {
        id v16 = sub_100021C6C();
        os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
        *(_DWORD *)block = 67109120;
        *(_DWORD *)&void block[4] = v12;
        int v17 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        *(_DWORD *)block = 67109120;
        *(_DWORD *)&void block[4] = v12;
        int v17 = (char *)_os_log_send_and_compose_impl();
      }
      int v51 = sub_10000BF78("_remote_service_get_nonce", "sub_remote_service.m", 110, "com.apple.security.cryptex.posix", v12, 0, v17);
      free(v17);
      BOOL v52 = sub_100040DE8(v11, 0, v51);
      goto LABEL_50;
    }
    if (sub_1000404AC(v13, "nonce-domain", (const _xpc_type_s *)&_xpc_type_uint64))
    {
      uint64_t int64 = xpc_dictionary_get_uint64(v14, "nonce-domain");
      if (!sub_1000079A0(uint64))
      {
        long long v35 = sub_100021C6C();

        if (v35)
        {
          __int16 v36 = sub_100021C6C();
          os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
          *(_DWORD *)block = 134217984;
          *(void *)&void block[4] = uint64;
          __int16 v37 = (char *)_os_log_send_and_compose_impl();
        }
        else
        {
          *(_DWORD *)block = 134217984;
          *(void *)&void block[4] = uint64;
          __int16 v37 = (char *)_os_log_send_and_compose_impl();
        }
        int v51 = sub_10000BF78("_remote_service_get_nonce", "sub_remote_service.m", 126, "com.apple.security.cryptex", 10, 0, v37);
        free(v37);
        BOOL v52 = sub_100040DE8(v11, 0, v51);
        goto LABEL_50;
      }
    }
    else
    {
      if (!sub_1000404AC(v14, "nonce-domain-handle", (const _xpc_type_s *)&_xpc_type_uint64))
      {
        int v66 = sub_100021C6C();

        if (v66)
        {
          int v67 = sub_100021C6C();
          os_log_type_enabled(v67, OS_LOG_TYPE_ERROR);
          *(_DWORD *)block = 136315394;
          *(void *)&void block[4] = "nonce-domain";
          *(_WORD *)&block[12] = 2080;
          *(void *)&block[14] = "nonce-domain-handle";
          unint64_t v68 = (char *)_os_log_send_and_compose_impl();
        }
        else
        {
          *(_DWORD *)block = 136315394;
          *(void *)&void block[4] = "nonce-domain";
          *(_WORD *)&block[12] = 2080;
          *(void *)&block[14] = "nonce-domain-handle";
          unint64_t v68 = (char *)_os_log_send_and_compose_impl();
        }
        int v51 = sub_10000BF78("_remote_service_get_nonce", "sub_remote_service.m", 151, "com.apple.security.cryptex", 11, 0, v68);
        free(v68);
        BOOL v52 = sub_100040DE8(v11, 0, v51);
        goto LABEL_50;
      }
      int v56 = xpc_dictionary_get_uint64(v14, "nonce-domain-handle");
      if (!img4_nonce_domain_get_from_handle())
      {
        CFIndex v97 = sub_100021C6C();

        if (v97)
        {
          v98 = sub_100021C6C();
          os_log_type_enabled(v98, OS_LOG_TYPE_ERROR);
          *(_DWORD *)block = 67109120;
          *(_DWORD *)&void block[4] = v56;
          v99 = (char *)_os_log_send_and_compose_impl();
        }
        else
        {
          *(_DWORD *)block = 67109120;
          *(_DWORD *)&void block[4] = v56;
          v99 = (char *)_os_log_send_and_compose_impl();
        }
        int v51 = sub_10000BF78("_remote_service_get_nonce", "sub_remote_service.m", 141, "com.apple.security.cryptex", 10, 0, v99);
        free(v99);
        BOOL v52 = sub_100040DE8(v11, 0, v51);
        goto LABEL_50;
      }
    }
    int v57 = img4_nonce_domain_copy_nonce();
    if (!v57)
    {
      xpc_object_t empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_data(empty, "nonce", buf, 0x38uLL);
      id v7 = sub_100040DE8(v11, empty, 0);

LABEL_52:
      goto LABEL_10;
    }
    __int16 v58 = sub_100021C6C();

    if (v58)
    {
      pid_t v59 = sub_100021C6C();
      os_log_type_enabled(v59, OS_LOG_TYPE_ERROR);
      *(_DWORD *)block = 67109120;
      *(_DWORD *)&void block[4] = v57;
      int v60 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_DWORD *)block = 67109120;
      *(_DWORD *)&void block[4] = v57;
      int v60 = (char *)_os_log_send_and_compose_impl();
    }
    int v51 = sub_10000BF78("_remote_service_get_nonce", "sub_remote_service.m", 161, "com.apple.security.cryptex.posix", v57, 0, v60);
    free(v60);
    BOOL v52 = sub_100040DE8(v11, 0, v51);
LABEL_50:
    id v7 = v52;
    if (v51) {
      CFRelease(v51);
    }
    goto LABEL_52;
  }
  if (strcmp(string_ptr, "roll-nonce"))
  {
    if (strcmp(string_ptr, "install"))
    {
      if (strcmp(string_ptr, "uninstall"))
      {
        if (!strcmp(string_ptr, "copy-installed"))
        {
          sub_100023BD0(v1);
          goto LABEL_12;
        }
        if (!strcmp(string_ptr, "read-personalization-id"))
        {
          sub_100023C74(v1);
          goto LABEL_12;
        }
        int v9 = *__error();
        uint64_t v10 = sub_100021C6C();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136315138;
          *(void *)&uint8_t buf[4] = string_ptr;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Unsupported routine: %s", buf, 0xCu);
        }

        *__error() = v9;
        int v6 = sub_100040644(v1, 0, 45);
        goto LABEL_9;
      }
      *(void *)block = 0;
      *(void *)&block[8] = block;
      *(void *)&block[16] = 0x3032000000;
      v186 = sub_10002401C;
      v187 = sub_10002402C;
      id v188 = 0;
      id v44 = v1;
      id v188 = v44;
      uint64_t v126 = 0;
      uint64_t v127 = (uint64_t)&v126;
      uint64_t v128 = 0x3032000000;
      v129 = sub_10002401C;
      v130 = sub_10002402C;
      id v131 = 0;
      id v176 = 0;
      int v45 = sub_100040EEC(v44, &v176);
      id v46 = v176;
      __int16 v47 = v46;
      if (v45)
      {
        int v48 = *__error();
        int v49 = sub_100021C6C();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v45;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "failed to get argv from request: %{darwin.errno}d", buf, 8u);
        }

        *__error() = v48;
      }
      else
      {
        string = xpc_dictionary_get_string(v46, "remote-cryptex-identifier");
        long long v70 = xpc_dictionary_get_string(v47, "remote-cryptex-version");
        if (string)
        {
          if (v70) {
            uint64_t v71 = cryptex_version_new();
          }
          else {
            uint64_t v71 = 0;
          }
          __int16 v102 = sub_100016EB4();
          v103 = *(void **)(v127 + 40);
          *(void *)(v127 + 40) = v102;

          __int16 v104 = sub_10000A564();
          *(void *)int buf = _NSConcreteStackBlock;
          *(void *)&uint8_t buf[8] = 3221225472;
          *(void *)&uint8_t buf[16] = sub_100025F20;
          *(void *)&unsigned char buf[24] = &unk_10005A910;
          *(void *)&long long v198 = string;
          *((void *)&v198 + 1) = v71;
          *(void *)&long long v199 = 1;
          *(void *)&long long v197 = &v126;
          *((void *)&v197 + 1) = block;
          dispatch_async(v104, buf);

          v50 = 0;
          goto LABEL_124;
        }
        int v100 = *__error();
        int v101 = sub_100021C6C();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136315394;
          *(void *)&uint8_t buf[4] = "remote-cryptex-identifier";
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = 22;
          _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "required key missing or with wrong type: %s: %{darwin.errno}d", buf, 0x12u);
        }

        *__error() = v100;
        int v45 = 22;
      }
      v50 = sub_100040644(v44, 0, v45);
      sub_100023F08(v50);
LABEL_124:
      _Block_object_dispose(&v126, 8);

      _Block_object_dispose(block, 8);
      goto LABEL_12;
    }
    id v23 = v1;
    uint64_t v138 = 0;
    v139 = &v138;
    uint64_t v140 = 0x3032000000;
    v141 = sub_10002401C;
    v142 = sub_10002402C;
    id v143 = 0;
    if ((remote_service_install_request_valid() & 1) == 0)
    {
      int v53 = *__error();
      int v54 = sub_100021C6C();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = 22;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "Invalid install request: %{darwin.errno}d", buf, 8u);
      }

      long long v122 = 0;
      id v123 = 0;
      CFTypeRef v33 = 0;
      id v124 = 0;
      id v30 = 0;
      id v31 = 0;
      id v32 = 0;
      *__error() = v53;
      int v24 = 22;
      goto LABEL_56;
    }
    id v137 = 0;
    int v24 = sub_100040EEC(v23, &v137);
    id v25 = v137;
    int v26 = v25;
    if (v24)
    {
      id v27 = v25;
      int v28 = *__error();
      uint64_t v29 = sub_100021C6C();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v24;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "failed to get argv from request: %{darwin.errno}d", buf, 8u);
      }

      long long v122 = 0;
      id v123 = 0;
      id v124 = 0;
      id v30 = 0;
      id v31 = 0;
      id v32 = 0;
      *__error() = v28;
      CFTypeRef v33 = v27;
      goto LABEL_56;
    }
    uint64_t v72 = sub_100016EB4();
    xpc_object_t xdict = v26;
    v73 = (void *)v139[5];
    v139[5] = (uint64_t)v72;

    __int16 v125 = xpc_dictionary_get_value(v26, "image");
    int64_t int64 = xpc_dictionary_get_int64(v26, "image-type-index");
    long long v117 = xpc_dictionary_get_value(v26, "trustcache");
    v116 = xpc_dictionary_get_value(v26, "im4m");
    long long v115 = xpc_dictionary_get_value(v26, "info");
    CFIndex v74 = xpc_dictionary_get_value(v26, "volumehash");
    uint64_t v75 = xpc_dictionary_get_uint64(v26, "persistence");
    uint64_t v76 = xpc_dictionary_get_uint64(v26, "nonce-persistence");
    uint64_t v77 = xpc_dictionary_get_uint64(v26, "auth");
    v78 = xpc_dictionary_get_dictionary(v26, "cryptex1-properties");
    uint64_t v79 = (void *)v139[5];
    uint64_t v126 = _NSConcreteStackBlock;
    uint64_t v127 = 3221225472;
    uint64_t v128 = (uint64_t)sub_100024034;
    v129 = (uint64_t (*)(uint64_t, uint64_t))&unk_10005A400;
    int64_t v133 = int64;
    long long v122 = v78;
    v130 = v122;
    v132 = &v138;
    id v131 = v23;
    uint64_t v134 = v77;
    uint64_t v135 = v75;
    uint64_t v136 = v76;
    id v119 = v79;
    id v123 = v125;
    id v124 = v117;
    id v32 = v116;
    id v30 = v115;
    id v31 = v74;
    v80 = &v126;
    long long v208 = 0u;
    memset(v209, 0, sizeof(v209));
    long long v206 = 0u;
    long long v207 = 0u;
    long long v204 = 0u;
    long long v205 = 0u;
    long long v202 = 0u;
    long long v203 = 0u;
    long long v200 = 0u;
    long long v201 = 0u;
    long long v198 = 0u;
    long long v199 = 0u;
    long long v197 = 0u;
    memset(buf, 0, sizeof(buf));
    int v184 = -1;
    v182[0] = 0;
    v182[1] = v182;
    v182[2] = 0x2020000000;
    int v183 = 0;
    id v176 = 0;
    v177 = &v176;
    uint64_t v178 = 0x3032000000;
    v179 = sub_10002401C;
    v180 = sub_10002402C;
    id v181 = 0;
    v174[0] = 0;
    v174[1] = v174;
    v174[2] = 0x3032000000;
    v174[3] = sub_1000243CC;
    v174[4] = sub_1000243F8;
    v175 = 0;
    long long v118 = v80;
    v175 = objc_retainBlock(v80);
    int v81 = sub_100024400();
    dispatch_assert_queue_V2(v81);

    __snprintf_chk((char *)buf, 0xFFuLL, 0, 0xFFuLL, "XXXXXX");
    sub_10001755C((uint64_t)v119, (uint64_t)&unk_100059DD0, (char *)buf, &v184);
    if (openat(v184, *(const char **)(cryptex_asset_types[int64] + 40), 514, 438) < 0)
    {
      int v24 = *__error();
      int v89 = *__error();
      v90 = sub_100021C6C();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)block = 67109120;
        *(_DWORD *)&void block[4] = v24;
        _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "failed to create file for image: %{darwin.errno}d", block, 8u);
      }
    }
    else
    {
      int is_cryptex1 = cryptex_asset_type_is_cryptex1();
      int v83 = is_cryptex1;
      v84 = &_cryptex_asset_type_roothash;
      if (is_cryptex1) {
        v84 = &_cryptex_asset_type_gtgv;
      }
      int v114 = v84;
      if (is_cryptex1) {
        uint32_t v85 = &_cryptex_asset_type_gtcd;
      }
      else {
        uint32_t v85 = &_cryptex_asset_type_ltrs;
      }
      v112 = v85;
      if (is_cryptex1) {
        v86 = &_cryptex_asset_type_ginf;
      }
      else {
        v86 = _cryptex_asset_type_c411;
      }
      BOOL v113 = v86;
      int v87 = (const char **)((char *)&_cryptex_asset_type_ltrs + 40);
      if (is_cryptex1) {
        int v87 = (const char **)((char *)&_cryptex_asset_type_gtcd + 40);
      }
      if (openat(v184, *v87, 514, 438) < 0)
      {
        int v24 = *__error();
        int v89 = *__error();
        v90 = sub_100021C6C();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)block = 67109120;
          *(_DWORD *)&void block[4] = v24;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "failed to create file for trust cache: %{darwin.errno}d", block, 8u);
        }
      }
      else if (openat(v184, *((const char **)&_cryptex_asset_type_im4m + 5), 514, 438) < 0)
      {
        int v24 = *__error();
        int v89 = *__error();
        v90 = sub_100021C6C();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)block = 67109120;
          *(_DWORD *)&void block[4] = v24;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "failed to create file for im4m: %{darwin.errno}d", block, 8u);
        }
      }
      else if (v30 {
             && (!v83 ? (int v88 = _cryptex_asset_type_c411) : (int v88 = &_cryptex_asset_type_ginf),
      }
                 openat(v184, (const char *)v88[5], 514, 438) < 0))
      {
        int v24 = *__error();
        int v89 = *__error();
        v90 = sub_100021C6C();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)block = 67109120;
          *(_DWORD *)&void block[4] = v24;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "failed to create file for info: %{darwin.errno}d", block, 8u);
        }
      }
      else
      {
        if (!v31) {
          goto LABEL_145;
        }
        v105 = (const char **)&_cryptex_asset_type_roothash;
        if (v83) {
          v105 = (const char **)&_cryptex_asset_type_gtgv;
        }
        if ((openat(v184, v105[5], 514, 438) & 0x80000000) == 0)
        {
LABEL_145:
          dispatch_group_t v108 = dispatch_group_create();
          id v109 = v177[5];
          v177[5] = v108;

          dispatch_group_enter((dispatch_group_t)v177[5]);
          dispatch_group_enter((dispatch_group_t)v177[5]);
          v168 = _NSConcreteStackBlock;
          uint64_t v169 = 3221225472;
          v170 = sub_100024454;
          v171 = &unk_10005A428;
          v172 = v182;
          v173 = &v176;
          xpc_file_transfer_write_to_fd();
          dispatch_group_enter((dispatch_group_t)v177[5]);
          v162 = _NSConcreteStackBlock;
          uint64_t v163 = 3221225472;
          v164 = sub_100024578;
          v165 = &unk_10005A428;
          v166 = v182;
          v167 = &v176;
          xpc_file_transfer_write_to_fd();
          dispatch_group_enter((dispatch_group_t)v177[5]);
          v156 = _NSConcreteStackBlock;
          uint64_t v157 = 3221225472;
          v158 = sub_10002469C;
          v159 = &unk_10005A428;
          v160 = v182;
          v161 = &v176;
          xpc_file_transfer_write_to_fd();
          if (v30)
          {
            dispatch_group_enter((dispatch_group_t)v177[5]);
            v150 = _NSConcreteStackBlock;
            uint64_t v151 = 3221225472;
            v152 = sub_1000247C0;
            v153 = &unk_10005A428;
            v154 = v182;
            v155 = &v176;
            xpc_file_transfer_write_to_fd();
          }
          if (v31)
          {
            dispatch_group_enter((dispatch_group_t)v177[5]);
            v144 = _NSConcreteStackBlock;
            uint64_t v145 = 3221225472;
            v146 = sub_1000248E4;
            v147 = &unk_10005A428;
            v148 = v182;
            v149 = &v176;
            xpc_file_transfer_write_to_fd();
          }
          stat v110 = v177[5];
          v111 = sub_100024400();
          *(void *)block = _NSConcreteStackBlock;
          *(void *)&block[8] = 3221225472;
          *(void *)&block[16] = sub_100024A08;
          v186 = (uint64_t (*)(uint64_t, uint64_t))&unk_10005A450;
          int v195 = v184;
          int64_t v191 = int64;
          v192 = v112;
          v187 = (void (*)(uint64_t))v30;
          v193 = v113;
          id v188 = v31;
          v189 = v174;
          v194 = v114;
          v190 = v182;
          dispatch_group_notify(v110, v111, block);

          dispatch_group_leave((dispatch_group_t)v177[5]);
          int v24 = 0;
          goto LABEL_140;
        }
        int v24 = *__error();
        int v89 = *__error();
        v90 = sub_100021C6C();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)block = 67109120;
          *(_DWORD *)&void block[4] = v24;
          _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_ERROR, "failed to create file for volume hash: %{darwin.errno}d", block, 8u);
        }
      }
    }

    *__error() = v89;
LABEL_140:
    _Block_object_dispose(v174, 8);

    _Block_object_dispose(&v176, 8);
    _Block_object_dispose(v182, 8);

    if (!v24)
    {
      stat v55 = 0;
      CFTypeRef v33 = xdict;
      goto LABEL_57;
    }
    int v106 = *__error();
    v107 = sub_100021C6C();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v24;
      _os_log_impl((void *)&_mh_execute_header, v107, OS_LOG_TYPE_ERROR, "file receive failed: %{darwin.errno}d", buf, 8u);
    }

    *__error() = v106;
    CFTypeRef v33 = xdict;
LABEL_56:
    stat v55 = sub_100040644(v23, 0, v24);
    sub_100023F08(v55);
LABEL_57:
    _Block_object_dispose(&v138, 8);

    goto LABEL_12;
  }
  id v18 = v1;
  if (!sub_1000404AC(v18, "nonce-domain", (const _xpc_type_s *)&_xpc_type_uint64))
  {
    if (sub_1000404AC(v18, "nonce-domain-handle", (const _xpc_type_s *)&_xpc_type_uint64))
    {
      int v38 = xpc_dictionary_get_uint64(v18, "nonce-domain-handle");
      if (img4_nonce_domain_get_from_handle()) {
        goto LABEL_40;
      }
      v94 = sub_100021C6C();

      if (v94)
      {
        v95 = sub_100021C6C();
        os_log_type_enabled(v95, OS_LOG_TYPE_ERROR);
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v38;
        int v96 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v38;
        int v96 = (char *)_os_log_send_and_compose_impl();
      }
      uint64_t v91 = sub_10000BF78("_remote_service_roll_nonce", "sub_remote_service.m", 211, "com.apple.security.cryptex", 10, 0, v96);
      free(v96);
      BOOL v92 = sub_100040DE8(v18, 0, v91);
    }
    else
    {
      char v61 = sub_100021C6C();

      if (v61)
      {
        v62 = sub_100021C6C();
        os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
        *(_DWORD *)int buf = 136315394;
        *(void *)&uint8_t buf[4] = "nonce-domain";
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "nonce-domain-handle";
        long long v63 = (char *)_os_log_send_and_compose_impl();
      }
      else
      {
        *(_DWORD *)int buf = 136315394;
        *(void *)&uint8_t buf[4] = "nonce-domain";
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "nonce-domain-handle";
        long long v63 = (char *)_os_log_send_and_compose_impl();
      }
      uint64_t v91 = sub_10000BF78("_remote_service_roll_nonce", "sub_remote_service.m", 221, "com.apple.security.cryptex", 11, 0, v63);
      free(v63);
      BOOL v92 = sub_100040DE8(v18, 0, v91);
    }
LABEL_119:
    id v7 = v92;
    if (v91) {
      CFRelease(v91);
    }
    goto LABEL_121;
  }
  uint64_t v19 = xpc_dictionary_get_uint64(v18, "nonce-domain");
  if (!sub_1000079A0(v19))
  {
    uint64_t v20 = sub_100021C6C();

    if (v20)
    {
      os_log_type_t v21 = sub_100021C6C();
      os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
      *(_DWORD *)int buf = 134217984;
      *(void *)&uint8_t buf[4] = v19;
      uint32_t v22 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_DWORD *)int buf = 134217984;
      *(void *)&uint8_t buf[4] = v19;
      uint32_t v22 = (char *)_os_log_send_and_compose_impl();
    }
    uint64_t v91 = sub_10000BF78("_remote_service_roll_nonce", "sub_remote_service.m", 196, "com.apple.security.cryptex", 10, 0, v22);
    free(v22);
    BOOL v92 = sub_100040DE8(v18, 0, v91);
    goto LABEL_119;
  }
LABEL_40:
  int v39 = img4_nonce_domain_roll_nonce();
  if (v39)
  {
    int v40 = v39;
    long long v41 = sub_100021C6C();

    if (v41)
    {
      long long v42 = sub_100021C6C();
      os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
      *(_DWORD *)int buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v40;
      long long v43 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_DWORD *)int buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v40;
      long long v43 = (char *)_os_log_send_and_compose_impl();
    }
    uint64_t v91 = sub_10000BF78("_remote_service_roll_nonce", "sub_remote_service.m", 231, "com.apple.security.cryptex.posix", v40, 0, v43);
    free(v43);
    BOOL v92 = sub_100040DE8(v18, 0, v91);
    goto LABEL_119;
  }
  xpc_object_t v64 = xpc_dictionary_create_empty();
  BOOL v65 = sub_100040DE8(v18, v64, 0);

  id v7 = v65;
LABEL_121:

LABEL_10:
  if (v7)
  {
    sub_100023F08(v7);
  }
LABEL_12:
}

void sub_100023A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a72, 8);
  _Block_object_dispose(&STACK[0x228], 8);
  _Block_object_dispose(&STACK[0x258], 8);
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_100023B8C(id a1)
{
  qword_10005E870 = (uint64_t)os_log_create("com.apple.libcryptex", "remote_service");

  _objc_release_x1();
}

void sub_100023BD0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_10000A564();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026470;
  block[3] = &unk_1000590F8;
  id v5 = v1;
  id v3 = v1;
  dispatch_async(v2, block);
}

void sub_100023C74(void *a1)
{
  id v1 = a1;
  memset(v13, 0, sizeof(v13));
  LOWORD(v13[0]) = 6;
  if (img4_chip_instantiate())
  {
    uint64_t v2 = sub_100021C6C();

    if (v2)
    {
      id v3 = sub_100021C6C();
      os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      *(_DWORD *)int buf = 67109120;
      LODWORD(v12) = 5;
      int v4 = (char *)_os_log_send_and_compose_impl();
    }
    else
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v12) = 5;
      int v4 = (char *)_os_log_send_and_compose_impl();
    }
    id v5 = sub_10000BF78("_remote_service_read_personalization_identifiers", "sub_remote_service.m", 837, "com.apple.security.cryptex.posix", 5, 0, v4);
    free(v4);
LABEL_10:
    id v6 = 0;
    goto LABEL_11;
  }
  id v10 = 0;
  sub_10000B1C0((uint64_t)v13, &v10);
  id v5 = (__CFError *)objc_claimAutoreleasedReturnValue();
  id v6 = v10;
  if (v5)
  {
    int v7 = *__error();
    int v8 = sub_100021C6C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412290;
      int v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to encode AppleImage4 chip instance.: %@", buf, 0xCu);
    }

    *__error() = v7;
    goto LABEL_10;
  }
LABEL_11:
  int v9 = sub_100040DE8(v1, v6, v5);
  sub_100023F08(v9);
}

void sub_100023EEC(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

void sub_100023F08(void *a1)
{
  id v1 = a1;
  uint64_t v2 = sub_100024400();
  dispatch_assert_queue_V2(v2);

  id v3 = xpc_copy_description(v1);
  int v4 = *__error();
  id v5 = sub_100021C6C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 136315138;
    int v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "remote service reply: %s", (uint8_t *)&v6, 0xCu);
  }

  *__error() = v4;
  xpc_dictionary_send_reply();
  free(v3);
}

void sub_100023FFC(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10002401C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002402C(uint64_t a1)
{
}

void sub_100024034(uint64_t a1, int a2)
{
  if (!a2)
  {
    id v6 = (id)cryptex_core_create();
    int v8 = cryptex_core_set_assets_from_fds();
    if (v8)
    {
      int v3 = v8;
      int v4 = *__error();
      id v5 = sub_100021C6C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 67109120;
        int v24 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "set assets to core from fds failed: %{darwin.errno}d", buf, 8u);
      }
      goto LABEL_5;
    }
    int v7 = (void *)cryptex_core_cx1_properties_create_with_xpc_dictionary();
    if (v7) {
      cryptex_core_set_cryptex1_properties();
    }
    int v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 64);
    id v11 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v12 = v9;
    id v6 = v6;
    if (v10 != 2)
    {
      if (v10 != 1)
      {
        int v19 = *__error();
        uint64_t v20 = sub_100021C6C();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)int buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "using default signing service", buf, 2u);
        }

        id v18 = 0;
        *__error() = v19;
        goto LABEL_23;
      }
      int v13 = *__error();
      uint64_t v14 = sub_100021C6C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "using supplemental signing service", buf, 2u);
      }

      *__error() = v13;
      os_log_type_t v15 = (void *)cryptex_host_create();
      cryptex_core_attach_host();
    }
    int v16 = *__error();
    int v17 = sub_100021C6C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "using NO signing service", buf, 2u);
    }

    *__error() = v16;
    id v18 = (void *)cryptex_host_create();
    cryptex_core_attach_host();
LABEL_23:
    cryptex_core_set_install_persistence();
    cryptex_core_set_nonce_persistence();
    id v21 = v11;
    uint32_t v22 = sub_10003B2B4(v21, 0, 0, 0, v12, (uint64_t)sub_1000255D8);
    sub_1000183AC(v21, v6, (uint64_t)v22);

    goto LABEL_6;
  }
  int v3 = a2;
  int v4 = *__error();
  id v5 = sub_100021C6C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int buf = 67109120;
    int v24 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "file transfer failed: %{darwin.errno}d", buf, 8u);
  }
  id v6 = 0;
LABEL_5:

  *__error() = v4;
  int v7 = sub_100040644(*(void **)(a1 + 40), 0, v3);
  sub_100023F08(v7);
LABEL_6:
}

id sub_1000243CC(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_1000243F8(uint64_t a1)
{
}

id sub_100024400()
{
  if (qword_10005E878 != -1) {
    dispatch_once(&qword_10005E878, &stru_10005A470);
  }
  uint64_t v0 = (void *)qword_10005E880;

  return v0;
}

void sub_100024454(uint64_t a1, int a2)
{
  int v4 = *__error();
  id v5 = sub_100021C6C();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "image file transfer: %{darwin.errno}d", (uint8_t *)v7, 8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "image file transfer [no error]", (uint8_t *)v7, 2u);
    }

    *__error() = v4;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_100024578(uint64_t a1, int a2)
{
  int v4 = *__error();
  id v5 = sub_100021C6C();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "trustcache file transfer: %{darwin.errno}d", (uint8_t *)v7, 8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "trustcache file transfer [no error]", (uint8_t *)v7, 2u);
    }

    *__error() = v4;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10002469C(uint64_t a1, int a2)
{
  int v4 = *__error();
  id v5 = sub_100021C6C();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "im4m file transfer: %{darwin.errno}d", (uint8_t *)v7, 8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "im4m file transfer [no error]", (uint8_t *)v7, 2u);
    }

    *__error() = v4;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_1000247C0(uint64_t a1, int a2)
{
  int v4 = *__error();
  id v5 = sub_100021C6C();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "info file transfer: %{darwin.errno}d", (uint8_t *)v7, 8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "info file transfer [no error]", (uint8_t *)v7, 2u);
    }

    *__error() = v4;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_1000248E4(uint64_t a1, int a2)
{
  int v4 = *__error();
  id v5 = sub_100021C6C();
  id v6 = v5;
  if (a2)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "volume hash file transfer: %{darwin.errno}d", (uint8_t *)v7, 8u);
    }

    *__error() = v4;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "volume hash file transfer [no error]", (uint8_t *)v7, 2u);
    }

    *__error() = v4;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

uint64_t sub_100024A08(uint64_t a1)
{
  int v2 = openat(*(_DWORD *)(a1 + 96), *(const char **)(cryptex_asset_types[*(void *)(a1 + 64)] + 40), 0, 438);
  sub_100021C6C();
  int v3 = (id)objc_claimAutoreleasedReturnValue();
  bzero(__str, 0x400uLL);
  memset(&v58, 0, sizeof(v58));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    if (fstat(v2, &v58) == -1)
    {
      int v8 = *__error();
      int v9 = v3;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v10 = *__error();
        *(_DWORD *)int buf = 136315650;
        int v60 = "imagefd_r";
        __int16 v61 = 1024;
        int v62 = v2;
        __int16 v63 = 1024;
        LODWORD(v64) = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", buf, 0x18u);
      }

      *__error() = v8;
    }
    else
    {
      if (fcntl(v2, 50, __str))
      {
        int v4 = __error();
        id v5 = strerror(*v4);
        snprintf(__str, 0x400uLL, "[%s]", v5);
      }
      unint64_t v6 = ((unint64_t)v58.st_mode >> 12) ^ 8;
      if (v6 == 15) {
        int v7 = "[unknown]";
      }
      else {
        int v7 = off_10005A9D0[v6];
      }
      id v11 = (void *)os_flagset_copy_string();
      int v12 = *__error();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 136316418;
        int v60 = "imagefd_r";
        __int16 v61 = 1024;
        int v62 = v2;
        __int16 v63 = 2080;
        xpc_object_t v64 = v7;
        __int16 v65 = 2048;
        off_t st_size = v58.st_size;
        __int16 v67 = 2080;
        unint64_t v68 = v11;
        __int16 v69 = 2080;
        long long v70 = __str;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s", buf, 0x3Au);
      }
      *__error() = v12;
      free(v11);
    }
  }

  int v13 = openat(*(_DWORD *)(a1 + 96), *(const char **)(*(void *)(a1 + 72) + 40), 514, 438);
  sub_100021C6C();
  uint64_t v14 = (id)objc_claimAutoreleasedReturnValue();
  bzero(__str, 0x400uLL);
  memset(&v58, 0, sizeof(v58));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    if (fstat(v13, &v58) == -1)
    {
      int v19 = *__error();
      uint64_t v20 = v14;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v21 = *__error();
        *(_DWORD *)int buf = 136315650;
        int v60 = "tcfd_r";
        __int16 v61 = 1024;
        int v62 = v13;
        __int16 v63 = 1024;
        LODWORD(v64) = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", buf, 0x18u);
      }

      *__error() = v19;
    }
    else
    {
      if (fcntl(v13, 50, __str))
      {
        os_log_type_t v15 = __error();
        int v16 = strerror(*v15);
        snprintf(__str, 0x400uLL, "[%s]", v16);
      }
      unint64_t v17 = ((unint64_t)v58.st_mode >> 12) ^ 8;
      if (v17 == 15) {
        id v18 = "[unknown]";
      }
      else {
        id v18 = off_10005A9D0[v17];
      }
      uint32_t v22 = (void *)os_flagset_copy_string();
      int v23 = *__error();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 136316418;
        int v60 = "tcfd_r";
        __int16 v61 = 1024;
        int v62 = v13;
        __int16 v63 = 2080;
        xpc_object_t v64 = v18;
        __int16 v65 = 2048;
        off_t st_size = v58.st_size;
        __int16 v67 = 2080;
        unint64_t v68 = v22;
        __int16 v69 = 2080;
        long long v70 = __str;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s", buf, 0x3Au);
      }
      *__error() = v23;
      free(v22);
    }
  }

  int v24 = openat(*(_DWORD *)(a1 + 96), *((const char **)&_cryptex_asset_type_im4m + 5), 514, 438);
  sub_100021C6C();
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  bzero(__str, 0x400uLL);
  memset(&v58, 0, sizeof(v58));
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    if (fstat(v24, &v58) == -1)
    {
      int v30 = *__error();
      id v31 = v25;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        int v32 = *__error();
        *(_DWORD *)int buf = 136315650;
        int v60 = "im4mfd_r";
        __int16 v61 = 1024;
        int v62 = v24;
        __int16 v63 = 1024;
        LODWORD(v64) = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", buf, 0x18u);
      }

      *__error() = v30;
    }
    else
    {
      if (fcntl(v24, 50, __str))
      {
        int v26 = __error();
        id v27 = strerror(*v26);
        snprintf(__str, 0x400uLL, "[%s]", v27);
      }
      unint64_t v28 = ((unint64_t)v58.st_mode >> 12) ^ 8;
      if (v28 == 15) {
        uint64_t v29 = "[unknown]";
      }
      else {
        uint64_t v29 = off_10005A9D0[v28];
      }
      CFTypeRef v33 = (void *)os_flagset_copy_string();
      int v34 = *__error();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 136316418;
        int v60 = "im4mfd_r";
        __int16 v61 = 1024;
        int v62 = v24;
        __int16 v63 = 2080;
        xpc_object_t v64 = v29;
        __int16 v65 = 2048;
        off_t st_size = v58.st_size;
        __int16 v67 = 2080;
        unint64_t v68 = v33;
        __int16 v69 = 2080;
        long long v70 = __str;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s", buf, 0x3Au);
      }
      *__error() = v34;
      free(v33);
    }
  }

  if (*(void *)(a1 + 32))
  {
    int v35 = openat(*(_DWORD *)(a1 + 96), *(const char **)(*(void *)(a1 + 80) + 40), 514, 438);
    sub_100021C6C();
    __int16 v36 = (id)objc_claimAutoreleasedReturnValue();
    bzero(__str, 0x400uLL);
    memset(&v58, 0, sizeof(v58));
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      if (fstat(v35, &v58) == -1)
      {
        int v41 = *__error();
        long long v42 = v36;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          int v43 = *__error();
          *(_DWORD *)int buf = 136315650;
          int v60 = "infofd_r";
          __int16 v61 = 1024;
          int v62 = v35;
          __int16 v63 = 1024;
          LODWORD(v64) = v43;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", buf, 0x18u);
        }

        *__error() = v41;
      }
      else
      {
        if (fcntl(v35, 50, __str))
        {
          __int16 v37 = __error();
          int v38 = strerror(*v37);
          snprintf(__str, 0x400uLL, "[%s]", v38);
        }
        unint64_t v39 = ((unint64_t)v58.st_mode >> 12) ^ 8;
        if (v39 == 15) {
          int v40 = "[unknown]";
        }
        else {
          int v40 = off_10005A9D0[v39];
        }
        id v44 = (void *)os_flagset_copy_string();
        int v45 = *__error();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)int buf = 136316418;
          int v60 = "infofd_r";
          __int16 v61 = 1024;
          int v62 = v35;
          __int16 v63 = 2080;
          xpc_object_t v64 = v40;
          __int16 v65 = 2048;
          off_t st_size = v58.st_size;
          __int16 v67 = 2080;
          unint64_t v68 = v44;
          __int16 v69 = 2080;
          long long v70 = __str;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s", buf, 0x3Au);
        }
        *__error() = v45;
        free(v44);
      }
    }
  }
  if (*(void *)(a1 + 40))
  {
    int v46 = openat(*(_DWORD *)(a1 + 96), *(const char **)(*(void *)(a1 + 88) + 40), 514, 438);
    sub_100021C6C();
    __int16 v47 = (id)objc_claimAutoreleasedReturnValue();
    bzero(__str, 0x400uLL);
    memset(&v58, 0, sizeof(v58));
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      if (fstat(v46, &v58) == -1)
      {
        int v52 = *__error();
        int v53 = v47;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          int v54 = *__error();
          *(_DWORD *)int buf = 136315650;
          int v60 = "volhashfd_r";
          __int16 v61 = 1024;
          int v62 = v46;
          __int16 v63 = 1024;
          LODWORD(v64) = v54;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", buf, 0x18u);
        }

        *__error() = v52;
      }
      else
      {
        if (fcntl(v46, 50, __str))
        {
          int v48 = __error();
          int v49 = strerror(*v48);
          snprintf(__str, 0x400uLL, "[%s]", v49);
        }
        unint64_t v50 = ((unint64_t)v58.st_mode >> 12) ^ 8;
        if (v50 == 15) {
          int v51 = "[unknown]";
        }
        else {
          int v51 = off_10005A9D0[v50];
        }
        stat v55 = (void *)os_flagset_copy_string();
        int v56 = *__error();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)int buf = 136316418;
          int v60 = "volhashfd_r";
          __int16 v61 = 1024;
          int v62 = v46;
          __int16 v63 = 2080;
          xpc_object_t v64 = v51;
          __int16 v65 = 2048;
          off_t st_size = v58.st_size;
          __int16 v67 = 2080;
          unint64_t v68 = v55;
          __int16 v69 = 2080;
          long long v70 = __str;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s", buf, 0x3Au);
        }
        *__error() = v56;
        free(v55);
      }
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
}

void sub_100025588(id a1)
{
  id v3 = sub_10000A548();
  uint64_t v1 = sub_10000A578((uint64_t)v3);
  int v2 = (void *)qword_10005E880;
  qword_10005E880 = v1;
}

void sub_1000255D8(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = a4;
  id v10 = *(id *)(a4 + 56);
  if (v9)
  {
    int v11 = *__error();
    int v12 = sub_100021C6C();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412290;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "installation failed: %@", buf, 0xCu);
    }

    *__error() = v11;
    int v13 = sub_100024400();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000259E0;
    block[3] = &unk_10005A898;
    id v15 = v10;
    id v16 = v9;
    unint64_t v17 = v18;
    dispatch_async(v13, block);
  }
  else
  {
    sub_100019648((uint64_t)v7, v8, a4, (uint64_t)sub_1000257D4);
  }

  _Block_object_dispose(v18, 8);
}

void sub_1000257B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000257D4(void *a1, void *a2, const void *a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  uint64_t v18 = 0;
  int v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = a4;
  id v9 = *(id *)(a4 + 56);
  if (a3)
  {
    int v10 = *__error();
    int v11 = sub_100021C6C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412290;
      int v23 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "bootstrap failed, unbootstrapping: %@", buf, 0xCu);
    }

    *__error() = v10;
    CFTypeRef v12 = CFRetain(a3);
    *(void *)(v19[3] + 16) = v12;
    sub_10001986C((uint64_t)v7, v8, 1uLL, a4, (uint64_t)sub_100025A44);
  }
  else
  {
    int v13 = sub_100024400();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100025B80;
    block[3] = &unk_10005A898;
    id v15 = v8;
    id v16 = v9;
    unint64_t v17 = &v18;
    dispatch_async(v13, block);
  }
  _Block_object_dispose(&v18, 8);
}

void sub_1000259BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000259E0(uint64_t a1)
{
  id v2 = sub_100040DE8(*(void **)(a1 + 32), 0, *(__CFError **)(a1 + 40));
  sub_100023F08(v2);
  sub_10003B330((uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
}

void sub_100025A44(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a1;
  int v9 = *__error();
  int v10 = sub_100021C6C();
  int v11 = v10;
  if (a3)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      uint64_t v17 = a3;
      CFTypeRef v12 = "unbootstrap: %@";
      int v13 = v11;
      os_log_type_t v14 = OS_LOG_TYPE_ERROR;
      uint32_t v15 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v13, v14, v12, (uint8_t *)&v16, v15);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v16) = 0;
    CFTypeRef v12 = "unbootstrap [no error]";
    int v13 = v11;
    os_log_type_t v14 = OS_LOG_TYPE_DEBUG;
    uint32_t v15 = 2;
    goto LABEL_6;
  }

  *__error() = v9;
  sub_100018E84(v8, v7, a4, (uint64_t)sub_100025C68);
}

void sub_100025B80(uint64_t a1)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  id v3 = *(id *)(a1 + 32);
  xpc_object_t v4 = xpc_dictionary_create_empty();
  uint64_t v5 = sub_100033F08((uint64_t)v3);

  xpc_dictionary_set_string(v4, "remote-cryptex-identifier", *(const char **)v5);
  xpc_dictionary_set_string(v4, "remote-cryptex-version", **(const char ***)(v5 + 16));
  xpc_dictionary_set_value(empty, "remote-cryptex", v4);
  id v6 = sub_100040DE8(*(void **)(a1 + 40), empty, 0);
  sub_100023F08(v6);
  sub_10003B330((uint64_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
}

void sub_100025C68(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a1;
  id v8 = a2;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v19[3] = a4;
  id v9 = *(id *)(a4 + 56);
  if (a3)
  {
    int v10 = *__error();
    int v11 = sub_100021C6C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412290;
      uint64_t v21 = a3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "uninstall: %@", buf, 0xCu);
    }

    *__error() = v10;
  }
  else
  {
    int v12 = *__error();
    int v13 = sub_100021C6C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "uninstall [no error]", buf, 2u);
    }

    *__error() = v12;
  }
  os_log_type_t v14 = sub_100024400();
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100025E7C;
  v16[3] = &unk_10005A8C0;
  id v17 = v9;
  uint64_t v18 = v19;
  id v15 = v9;
  dispatch_async(v14, v16);

  _Block_object_dispose(v19, 8);
}

void sub_100025E58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100025E7C(uint64_t a1)
{
  id v2 = *(__CFError **)(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 16);
  id v3 = sub_100040DE8(*(void **)(a1 + 32), 0, v2);
  sub_100023F08(v3);
  sub_10003B330((uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));

  if (v2)
  {
    CFRelease(v2);
  }
}

void sub_100025F04(_Unwind_Exception *exception_object)
{
  if (v1) {
    CFRelease(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_100025F20(uint64_t a1)
{
  id v2 = sub_100019E3C(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(char **)(a1 + 48), *(void *)(a1 + 56));
  if (v2)
  {
    sub_10001986C(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v2, *(void *)(a1 + 64), (uint64_t)*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), (uint64_t)sub_1000260C0);
  }
  else
  {
    int v3 = *__error();
    xpc_object_t v4 = sub_100021C6C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      *(_DWORD *)int buf = 136315394;
      uint64_t v10 = v5;
      __int16 v11 = 1024;
      int v12 = 2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "failed to find cryptex with identifier %s: %{darwin.errno}d", buf, 0x12u);
    }

    *__error() = v3;
    id v6 = sub_100024400();
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    _DWORD v7[2] = sub_100026208;
    v7[3] = &unk_10005A8E8;
    void v7[4] = *(void *)(a1 + 40);
    int v8 = 2;
    dispatch_async(v6, v7);
  }
}

void sub_1000260C0(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  id v8 = a2;
  id v9 = a1;
  int v10 = *__error();
  __int16 v11 = sub_100021C6C();
  int v12 = v11;
  if (a3)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v17 = 138412290;
      uint64_t v18 = a3;
      int v13 = "unbootstrap: %@";
      os_log_type_t v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, (uint8_t *)&v17, v16);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v17) = 0;
    int v13 = "unbootstrap [no error]";
    os_log_type_t v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
    uint32_t v16 = 2;
    goto LABEL_6;
  }

  *__error() = v10;
  sub_100018E84(v9, v8, (uint64_t)v7, (uint64_t)sub_10002625C);
}

void sub_100026208(uint64_t a1)
{
  id v1 = sub_100040644(*(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40), 0, *(_DWORD *)(a1 + 40));
  sub_100023F08(v1);
}

void sub_10002625C(uint64_t a1, uint64_t a2, CFIndex a3, void *a4)
{
  if (a3)
  {
    int v6 = sub_10000C110(a3);
    int v7 = *__error();
    id v8 = sub_100021C6C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412290;
      CFIndex v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "uninstall: %@", buf, 0xCu);
    }
  }
  else
  {
    int v7 = *__error();
    id v8 = sub_100021C6C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "uninstall [no error]", buf, 2u);
    }
    int v6 = 0;
  }

  *__error() = v7;
  id v9 = sub_100024400();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100026400;
  v11[3] = &unk_10005A938;
  id v12 = a4;
  int v13 = v6;
  id v10 = a4;
  dispatch_async(v9, v11);
}

void sub_100026400(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  xpc_object_t empty = xpc_dictionary_create_empty();
  id v4 = sub_100040644(v2, empty, *(_DWORD *)(a1 + 40));

  sub_100023F08(v4);
}

void sub_100026470(uint64_t a1)
{
  id v2 = sub_100016EB4();
  sub_100019EC0(v2, (uint64_t)*(id *)(a1 + 32), (uint64_t)sub_1000264D8);
}

void sub_1000264D8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  _DWORD v14[2] = sub_100026640;
  v14[3] = &unk_10005A988;
  CFIndex v15 = v5;
  xpc_object_t v6 = xpc_array_create_empty();
  id v16 = v6;
  int v7 = v5;
  sub_10001A278((uint64_t)v4, (uint64_t)v14);

  id v8 = sub_100024400();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100026850;
  v11[3] = &unk_10005A9B0;
  id v12 = v6;
  id v13 = v3;
  id v9 = v3;
  id v10 = v6;
  dispatch_group_notify(v7, v8, v11);

  dispatch_group_leave(v7);
}

uint64_t sub_100026640(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  cryptex_async();

  return 1;
}

void sub_100026708(uint64_t a1)
{
  uint64_t v2 = sub_100033F08(*(void *)(a1 + 32));
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "remote-cryptex-identifier", *(const char **)v2);
  xpc_dictionary_set_string(empty, "remote-cryptex-version", **(const char ***)(v2 + 16));
  id v4 = sub_10000A564();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100026810;
  block[3] = &unk_10005A960;
  id v7 = *(id *)(a1 + 40);
  id v8 = empty;
  id v9 = *(id *)(a1 + 48);
  id v5 = empty;
  dispatch_async(v4, block);
}

void sub_100026810(uint64_t a1)
{
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
  uint64_t v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

void sub_100026850(uint64_t a1)
{
  id empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_value(empty, "remote-cryptex-array", *(xpc_object_t *)(a1 + 32));
  uint64_t v2 = sub_100040644(*(void **)(a1 + 40), empty, 0);
  sub_100023F08(v2);
}

uint64_t sub_1000268C0(uint64_t a1, CFTypeRef *a2)
{
  kern_return_t v32;
  kern_return_t v33;
  NSObject *v34;
  int v35;
  NSObject *v36;
  int v37;
  int v38;
  size_t outputStructCnt;
  int outputStruct;
  io_connect_t connect;
  uint64_t v42;
  char __s[1024];
  uint64_t inputStruct;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  long long v53;
  long long v54;
  long long v55;
  long long v56;
  long long v57;
  long long v58;
  long long v59;
  uint64_t v60;
  uint8_t buf[88];

  connect = 0;
  int v60 = 0;
  pid_t v59 = 0u;
  stat v58 = 0u;
  int v57 = 0u;
  int v56 = 0u;
  stat v55 = 0u;
  int v54 = 0u;
  int v53 = 0u;
  int v52 = 0u;
  int v51 = 0u;
  unint64_t v50 = 0u;
  int v49 = 0u;
  int v48 = 0u;
  __int16 v47 = 0u;
  int v46 = 0u;
  int v45 = 0u;
  inputStruct = 0x1BEEFFEEDLL;
  outputStruct = 0;
  outputStructCnt = 4;
  bzero(__s, 0x400uLL);
  CFMutableDictionaryRef v4 = sub_10000BDB8();
  if (!v4) {
    sub_100043234(&v42, buf);
  }
  id v5 = v4;
  id v6 = *(char **)(a1 + 8);
  if (v6)
  {
    CFStringRef v7 = sub_10000BC8C(v6);
    CFUUIDRef v8 = 0;
  }
  else
  {
    CFUUIDRef v9 = CFUUIDCreate(0);
    if (!v9) {
      sub_1000432B4(&v42, buf);
    }
    CFUUIDRef v8 = v9;
    CFStringRef v7 = CFUUIDCreateString(0, v9);
    if (!v7) {
      sub_100043334(&v42, buf);
    }
  }
  CFDictionarySetValue(v5, @"hdik-unique-identifier", v7);
  CFDictionarySetValue(v5, @"autodiskmount", kCFBooleanFalse);
  CFDictionarySetValue(v5, @"write-protected", kCFBooleanTrue);
  uint64_t v10 = realpath_np();
  if (v10)
  {
    uint64_t v11 = v10;
    int v12 = *__error();
    id v13 = *(NSObject **)(a1 + 2072);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "realpath_np: %{darwin.errno}d", buf, 8u);
    }
    CFNumberRef v14 = 0;
    CFDataRef v15 = 0;
    CFDataRef v16 = 0;
    io_service_t v17 = 0;
    *__error() = v12;
  }
  else
  {
    size_t v19 = strlen(__s);
    CFDataRef v20 = CFDataCreate(0, (const UInt8 *)__s, v19);
    if (!v20) {
      sub_1000433B4(&v42, buf);
    }
    CFDataRef v15 = v20;
    CFDictionarySetValue(v5, @"image-path", v20);
    CFNumberRef v21 = sub_10000BBDC(*(_DWORD *)a1);
    if (!v21) {
      sub_100043434(&v42, buf);
    }
    CFNumberRef v14 = v21;
    CFDictionarySetValue(v5, @"image-fd", v21);
    int v22 = *__error();
    int v23 = *(NSObject **)(a1 + 2072);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "attach args = %@", buf, 0xCu);
    }
    *__error() = v22;
    CFDataRef Data = CFPropertyListCreateData(0, v5, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (!Data) {
      sub_1000433B4(&v42, buf);
    }
    CFDataRef v16 = Data;
    BytePtr = CFDataGetBytePtr(Data);
    CFIndex Length = CFDataGetLength(v16);
    if (Length < 0) {
      sub_100041AAC();
    }
    *(void *)&int v45 = BytePtr;
    *((void *)&v45 + 1) = Length;
    CFDictionaryRef v27 = IOServiceMatching("IOHDIXController");
    io_service_t MatchingService = IOServiceGetMatchingService(0, v27);
    if (MatchingService)
    {
      io_service_t v17 = MatchingService;
      if (IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
      {
        int v29 = *__error();
        int v30 = *(NSObject **)(a1 + 2072);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = 5;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "IOServiceOpen: %{mach.errno}x", buf, 8u);
        }
        *__error() = v29;
        uint64_t v11 = 61;
      }
      else
      {
        int v32 = IOConnectCallStructMethod(connect, 0, &inputStruct, 0x100uLL, &outputStruct, &outputStructCnt);
        if (v32)
        {
          CFTypeRef v33 = v32;
          int v38 = *__error();
          int v34 = *(NSObject **)(a1 + 2072);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v33;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "kIOHDIXControllerCreateDriveMethod: %{mach.errno}x", buf, 8u);
          }
          *__error() = v38;
          uint64_t v11 = 83;
        }
        else
        {
          if (outputStructCnt != 4) {
            sub_10004352C(&v42, buf);
          }
          int v35 = *__error();
          __int16 v36 = *(NSObject **)(a1 + 2072);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)int buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = outputStruct;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "drive number: %d", buf, 8u);
          }
          *__error() = v35;
          uint64_t v11 = 0;
          *a2 = CFRetain(v7);
        }
      }
    }
    else
    {
      __int16 v37 = *__error();
      id v31 = *(NSObject **)(a1 + 2072);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 136315138;
        *(void *)&uint8_t buf[4] = "IOHDIXController";
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "could not find %s", buf, 0xCu);
      }
      io_service_t v17 = 0;
      *__error() = v37;
      uint64_t v11 = 78;
    }
  }
  if (connect && IOServiceClose(connect)) {
    sub_1000434B4(&v42, buf);
  }
  if (v17 - 1 <= 0xFFFFFFFD) {
    mach_right_send_release();
  }
  if (v16) {
    CFRelease(v16);
  }
  if (v15) {
    CFRelease(v15);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (v7) {
    CFRelease(v7);
  }
  if (v8) {
    CFRelease(v8);
  }
  CFRelease(v5);
  return v11;
}

uint64_t sub_100026E94(uint64_t a1, const void *a2, const char **a3, char *a4, char *a5)
{
  kern_return_t v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  io_registry_entry_t v18;
  io_object_t v19;
  CFTypeRef v20;
  const void *v21;
  const char *v22;
  int v23;
  NSObject *v24;
  int v25;
  unsigned int v26;
  int v27;
  NSObject *v28;
  char *v29;
  char *v30;
  CFStringRef v31;
  const char **v33;
  unsigned int v34;
  IONotificationPort *notify;
  CFStringRef v36;
  CFTypeRef cf;
  io_iterator_t notification;
  uint8_t v39[4];
  const void *v40;
  uint8_t buf[16];
  long long v42;
  long long v43;
  long long v44;
  long long v45;
  long long v46;
  long long v47;
  long long v48;
  long long v49;
  long long v50;
  long long v51;
  long long v52;
  long long v53;
  long long v54;
  unsigned char v55[31];

  notification = 0;
  __int16 v36 = 0;
  CFTypeRef cf = 0;
  IONotificationPortRef v10 = IONotificationPortCreate(0);
  if (!v10) {
    sub_1000435C0();
  }
  uint64_t v11 = v10;
  CFDictionaryRef v12 = IOServiceMatching("IOMedia");
  notify = v11;
  id v13 = IOServiceAddMatchingNotification(v11, "IOServiceMatched", v12, 0, 0, &notification);
  CFNumberRef v14 = *__error();
  CFDataRef v15 = *(NSObject **)(a1 + 2072);
  if (v13)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 2072), OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v13;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "IOServiceAddMatchingNotification: %{mach.errno}x", buf, 8u);
    }
    *__error() = v14;
    IONotificationPortDestroy(v11);
    CFDataRef v16 = 0xFFFFFFFFLL;
    goto LABEL_36;
  }
  CFTypeRef v33 = a3;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int buf = 138412290;
    *(void *)&uint8_t buf[4] = a2;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "looking for drive: %@", buf, 0xCu);
  }
  int v34 = 2;
  *__error() = v14;
  io_service_t v17 = "/dev/";
  do
  {
    uint64_t v18 = IOIteratorNext(notification);
    if (!v18) {
      break;
    }
    size_t v19 = v18;
    int v54 = 0u;
    memset(v55, 0, sizeof(v55));
    int v52 = 0u;
    int v53 = 0u;
    unint64_t v50 = 0u;
    int v51 = 0u;
    int v48 = 0u;
    int v49 = 0u;
    __int16 v47 = 0u;
    int v45 = 0u;
    int v46 = 0u;
    int v43 = 0u;
    id v44 = 0u;
    *(_OWORD *)int buf = 0u;
    long long v42 = 0u;
    CFDataRef v20 = IORegistryEntrySearchCFProperty(v18, "IOService", @"hdik-unique-identifier", 0, 3u);
    if (v20)
    {
      CFNumberRef v21 = v20;
      int v22 = v17;
      int v23 = *__error();
      int v24 = *(NSObject **)(a1 + 2072);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)unint64_t v39 = 138412290;
        int v40 = v21;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "found property: %@", v39, 0xCu);
      }
      *__error() = v23;
      if (CFEqual(a2, v21))
      {
        io_service_t v17 = v22;
        if (IOObjectConformsTo(v19, "AppleAPFSVolume")
          || IOObjectConformsTo(v19, "AppleAPFSMedia")
          || IOObjectConformsTo(v19, "AppleAPFSContainerScheme")
          || IOObjectConformsTo(v19, "AppleAPFSContainer"))
        {
          id v25 = 9;
LABEL_22:
          CFRelease(v21);
          goto LABEL_23;
        }
        int v26 = sub_1000272CC(*(NSObject **)(a1 + 2072), v19, v33, &cf, &v36);
        if (!v26)
        {
          int v29 = sub_10000BCA0((const __CFString *)cf, (char *)buf, 255);
          if (!v29) {
            sub_100043654();
          }
          snprintf(a4, 0x400uLL, "%s%s", v22, v29);
          int v30 = sub_10000BCA0(v36, (char *)buf, 255);
          if (!v30) {
            sub_100043654();
          }
          snprintf(a5, 0x400uLL, "%s%s", v22, v30);
          int v34 = 0;
          id v25 = 10;
          goto LABEL_22;
        }
        int v34 = v26;
        CFDictionaryRef v27 = *__error();
        unint64_t v28 = *(NSObject **)(a1 + 2072);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)unint64_t v39 = 67109120;
          LODWORD(v40) = v34;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "failed to get device nodes: %{darwin.errno}d", v39, 8u);
        }
        id v25 = 0;
        *__error() = v27;
      }
      else
      {
        id v25 = 9;
      }
      io_service_t v17 = v22;
      goto LABEL_22;
    }
    id v25 = 9;
LABEL_23:
    if (IOObjectRelease(v19)) {
      sub_1000435DC(v39, buf);
    }
  }
  while (v25 != 10);
  id v31 = v36;
  IONotificationPortDestroy(notify);
  if (v31) {
    CFRelease(v31);
  }
  CFDataRef v16 = v34;
LABEL_36:
  if (cf) {
    CFRelease(cf);
  }
  return v16;
}

uint64_t sub_1000272CC(NSObject *a1, io_object_t object, const char **a3, void *a4, void *a5)
{
  kern_return_t ParentEntry;
  kern_return_t v26;
  int v27;
  char v28;
  uint64_t v29;
  CFTypeRef v30;
  CFTypeRef v31;
  CFTypeID v32;
  CFTypeRef v33;
  CFBooleanRef v34;
  CFStringRef v35;
  void *v36;
  int v37;
  int v38;
  const char *v40;
  CFTypeRef v41;
  const char **v42;
  void *v43;
  CFTypeRef v44;
  io_object_t objecta;
  io_registry_entry_t entry;
  uint64_t v47;
  uint8_t buf[80];

  io_registry_entry_t v8 = object;
  if (IOObjectRetain(object)) {
    sub_1000436A8(&v47, buf);
  }
  entry = v8;
  if (IOObjectRetain(v8)) {
    sub_1000436A8(&v47, buf);
  }
  objecta = v8;
  if (sub_1000128D8(&objecta, "AppleAPFSContainerScheme")
    || sub_1000128D8(&objecta, "AppleAPFSMedia"))
  {
    IONotificationPortRef v10 = "hfs";
  }
  else
  {
    IONotificationPortRef v10 = "hfs";
    if (!sub_1000128D8(&objecta, "AppleAPFSContainer")
      && !sub_1000128D8(&objecta, "AppleAPFSVolume"))
    {
      IONotificationPortRef v10 = "apfs";
      io_registry_entry_t v8 = objecta;
    }
  }
  CFAllocatorRef v11 = kCFAllocatorDefault;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v8, @"BSD Name", kCFAllocatorDefault, 0);
  if (!CFProperty || (v13 = CFProperty, CFTypeID v14 = CFGetTypeID(CFProperty), v14 != CFStringGetTypeID())) {
    sub_100043670();
  }
  int v40 = v10;
  long long v42 = a3;
  int v43 = a5;
  int v15 = *__error();
  if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)int buf = 138412290;
    *(void *)&uint8_t buf[4] = v13;
    _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "subdevice node = %@", buf, 0xCu);
  }
  int v41 = v13;
  id v44 = 0;
  *__error() = v15;
  CFBooleanRef v16 = kCFBooleanTrue;
  CFStringRef v17 = @"Whole";
  do
  {
    CFBooleanRef v18 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(entry, v17, v11, 0);
    CFBooleanRef v19 = v18;
    if (v18)
    {
      CFTypeID v20 = CFGetTypeID(v18);
      if (v20 == CFBooleanGetTypeID()) {
        CFBooleanRef v21 = v19;
      }
      else {
        CFBooleanRef v21 = 0;
      }
    }
    else
    {
      CFBooleanRef v21 = 0;
    }
    int v22 = *__error();
    BOOL v23 = os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG);
    if (v21 == v16)
    {
      if (v23)
      {
        *(_WORD *)int buf = 0;
        _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "found whole disk node", buf, 2u);
      }
      *__error() = v22;
      int v30 = IORegistryEntryCreateCFProperty(entry, @"BSD Name", v11, 0);
      if (v30)
      {
        id v31 = v30;
        int v32 = CFGetTypeID(v30);
        if (v32 == CFStringGetTypeID()) {
          CFTypeRef v33 = v31;
        }
        else {
          CFTypeRef v33 = 0;
        }
        if (!a4) {
LABEL_57:
        }
          sub_10004368C();
      }
      else
      {
        CFTypeRef v33 = 0;
        if (!a4) {
          goto LABEL_57;
        }
      }
      int v38 = *__error();
      if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 138412290;
        *(void *)&uint8_t buf[4] = v33;
        _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "devnode = %@", buf, 0xCu);
      }
      id v44 = v33;
      unint64_t v28 = 0;
      int v29 = 0;
      *__error() = v38;
      io_registry_entry_t v24 = entry;
    }
    else
    {
      if (v23)
      {
        *(_WORD *)int buf = 0;
        _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "not whole disk node", buf, 2u);
      }
      *__error() = v22;
      io_registry_entry_t v24 = entry;
      ParentEntry = IORegistryEntryGetParentEntry(entry, "IOService", &entry);
      if (ParentEntry)
      {
        int v26 = ParentEntry;
        if (ParentEntry == -536870208)
        {
          CFDictionaryRef v27 = *__error();
          if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)int buf = 0;
            _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "found root node, stopping", buf, 2u);
          }
          unint64_t v28 = 0;
          *__error() = v27;
          int v29 = 2;
        }
        else
        {
          int v34 = v16;
          int v35 = v17;
          __int16 v36 = a4;
          __int16 v37 = *__error();
          if (os_log_type_enabled(a1, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 67109120;
            *(_DWORD *)&uint8_t buf[4] = v26;
            _os_log_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "IORegistryEntryGetParentEntry: %{mach.errno}x", buf, 8u);
          }
          unint64_t v28 = 0;
          *__error() = v37;
          int v29 = 83;
          a4 = v36;
          CFStringRef v17 = v35;
          CFBooleanRef v16 = v34;
          CFAllocatorRef v11 = kCFAllocatorDefault;
        }
      }
      else
      {
        int v29 = 35;
        unint64_t v28 = 1;
      }
    }
    if (v19) {
      CFRelease(v19);
    }
    if (v24 && IOObjectRelease(v24)) {
      sub_1000435DC(&v47, buf);
    }
  }
  while ((v28 & 1) != 0);
  if (v21 == v16)
  {
    if (v42) {
      *long long v42 = v40;
    }
    *a4 = v44;
    *int v43 = v41;
  }
  if (objecta && IOObjectRelease(objecta)) {
    sub_1000435DC(&v47, buf);
  }
  return v29;
}

uint64_t sub_1000277D0(int *a1, int a2, uint64_t a3)
{
  int v6 = *a1;
  os_log_t v7 = os_log_create("com.apple.libcryptex", "hdi");
  os_log_t v8 = v7;
  if (!*(void *)(a3 + 2072)) {
    *(void *)(a3 + 2072) = v7;
  }
  if ((*(_DWORD *)a3 & 0x80000000) != 0)
  {
    int v12 = -1;
  }
  else
  {
    uint64_t v9 = sub_10002885C(a3);
    int v10 = *__error();
    CFAllocatorRef v11 = *(NSObject **)(a3 + 2072);
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "hdi_mount_slow: %{darwin.errno}d", buf, 8u);
      }
      *__error() = v10;
      goto LABEL_118;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 136315138;
      *(void *)&uint8_t buf[4] = a3 + 1048;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "attached as: %s", buf, 0xCu);
    }
    *__error() = v10;
    int v12 = *(_DWORD *)(a3 + 4);
  }
  CFTypeRef v13 = *(const char **)(a3 + 16);
  if (!v13)
  {
    int v14 = *__error();
    CFTypeID v20 = *(NSObject **)(a3 + 2072);
    uint64_t v9 = 22;
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)int buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = 22;
    CFStringRef v17 = "FS type not specified: %{darwin.errno}d";
LABEL_110:
    CFBooleanRef v18 = v20;
    uint32_t v19 = 8;
LABEL_111:
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
LABEL_112:
    *__error() = v14;
    if ((v12 & 0x80000000) == 0)
    {
      if (ioctl(v12, 0x20006415uLL))
      {
        int v65 = *__error();
        int v66 = *(NSObject **)(a3 + 2072);
        if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        {
          int v67 = *__error();
          *(_DWORD *)int buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v67;
          _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_ERROR, "failed to clean up device: %{darwin.errno}d", buf, 8u);
        }
        *__error() = v65;
      }
      *(unsigned char *)(a3 + 24) = 0;
      *(unsigned char *)(a3 + 1048) = 0;
      *(_DWORD *)(a3 + 4) = -1;
    }
    goto LABEL_118;
  }
  if (!strcmp(*(const char **)(a3 + 16), "hfs"))
  {
    int v83 = v6;
    int v85 = v12;
    bzero(v96, 0x400uLL);
    uint64_t v90 = 511;
    uint64_t v87 = a3 + 1048;
    uid_t v88 = getuid();
    gid_t v89 = getgid();
    long long v91 = xmmword_100048820;
    uint64_t v92 = 0;
    int v21 = *__error();
    int v22 = *(NSObject **)(a3 + 2072);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 136315138;
      *(void *)&uint8_t buf[4] = a3 + 1048;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "mounting device = %s", buf, 0xCu);
    }
    *__error() = v21;
    if (os_log_type_enabled(*(os_log_t *)(a3 + 2072), OS_LOG_TYPE_DEBUG) && !realpath_np())
    {
      int v23 = *__error();
      io_registry_entry_t v24 = *(NSObject **)(a3 + 2072);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 136315138;
        *(void *)&uint8_t buf[4] = v96;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "mount point = %s", buf, 0xCu);
      }
      *__error() = v23;
    }
    if (gettimeofday(0, &v91) == -1) {
      sub_100043720(&__buf, buf);
    }
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v99 = 0u;
    memset(&__buf, 0, sizeof(__buf));
    int v25 = open((const char *)(a3 + 1048), 4);
    int v26 = v25;
    int v12 = v85;
    if (v25 < 0)
    {
      uint64_t v9 = *__error();
      goto LABEL_102;
    }
    if (pread(v25, &__buf, 0x200uLL, 1024) < 162)
    {
      uint64_t v9 = 96;
LABEL_103:
      if (close(v26) == -1) {
        sub_100043820(&v142, buf);
      }
LABEL_104:
      int v63 = *__error();
      xpc_object_t v64 = *(NSObject **)(a3 + 2072);
      if (v9)
      {
        if (os_log_type_enabled(*(os_log_t *)(a3 + 2072), OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v9;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, "could not get encoding: %{darwin.errno}d", buf, 8u);
        }
        *__error() = v63;
      }
      else
      {
        int v69 = a2 | 0x100001;
        if (os_log_type_enabled(*(os_log_t *)(a3 + 2072), OS_LOG_TYPE_DEBUG))
        {
          uint64_t v70 = *(void *)(a3 + 16);
          *(_DWORD *)int buf = 136315650;
          *(void *)&uint8_t buf[4] = v70;
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = v83;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = v69;
          _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEBUG, "mount args: fs = %s, fd = %d, flags = %#x", buf, 0x18u);
        }
        *__error() = v63;
        uint64_t v71 = *(NSObject **)(a3 + 2072);
        bzero(buf, 0x400uLL);
        memset(&__buf, 0, sizeof(__buf));
        int v6 = v83;
        if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
        {
          if (fstat(v83, &__buf) == -1)
          {
            int v76 = *__error();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              int v77 = *__error();
              v142.vfc_reserved1 = 136315650;
              *(void *)v142.vfc_name = "mntfd";
              *(_WORD *)&v142.vfc_name[8] = 1024;
              *(_DWORD *)&v142.vfc_name[10] = v83;
              *(_WORD *)&v142.vfc_name[14] = 1024;
              v142.vfc_typenum = v77;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", (uint8_t *)&v142, 0x18u);
            }
            *__error() = v76;
          }
          else
          {
            if (fcntl(v83, 50, buf))
            {
              uint64_t v72 = __error();
              v73 = strerror(*v72);
              snprintf(buf, 0x400uLL, "[%s]", v73);
            }
            unint64_t v74 = ((unint64_t)__buf.st_mode >> 12) ^ 8;
            if (v74 == 15) {
              uint64_t v75 = "[unknown]";
            }
            else {
              uint64_t v75 = off_10005AE48[v74];
            }
            v78 = (void *)os_flagset_copy_string();
            int v79 = *__error();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
            {
              v142.vfc_reserved1 = 136316418;
              *(void *)v142.vfc_name = "mntfd";
              *(_WORD *)&v142.vfc_name[8] = 1024;
              *(_DWORD *)&v142.vfc_name[10] = v83;
              *(_WORD *)&v142.vfc_name[14] = 2080;
              *(void *)&v142.vfc_typenum = v75;
              LOWORD(v142.vfc_flags) = 2048;
              *(void *)((char *)&v142.vfc_flags + 2) = __buf.st_size;
              HIWORD(v142.vfc_reserved3) = 2080;
              id v143 = v78;
              __int16 v144 = 2080;
              uint64_t v145 = buf;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s", (uint8_t *)&v142, 0x3Au);
            }
            *__error() = v79;
            free(v78);
            int v6 = v83;
          }
        }
        if (!fmount("hfs", v6, v69, &v87)) {
          goto LABEL_142;
        }
        uint64_t v9 = *__error();
        int v80 = *__error();
        int v81 = *(NSObject **)(a3 + 2072);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v9;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "fmount: %{darwin.errno}d", buf, 8u);
        }
        *__error() = v80;
        int v12 = v85;
        if (!v9) {
          goto LABEL_142;
        }
      }
      int v14 = *__error();
      CFTypeID v20 = *(NSObject **)(a3 + 2072);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_112;
      }
      *(_DWORD *)int buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v9;
      CFStringRef v17 = "mount hfs failed: %{darwin.errno}d";
      goto LABEL_110;
    }
    unsigned int v34 = bswap32(LOWORD(__buf.st_dev));
    unsigned int v35 = HIWORD(v34);
    LOWORD(__buf.st_dev) = HIWORD(v34);
    LOWORD(__buf.st_lspare) = bswap32(LOWORD(__buf.st_lspare)) >> 16;
    unsigned int v36 = bswap32(HIDWORD(__buf.st_blocks));
    HIDWORD(__buf.st_blocks) = v36;
    if (v35 != 18475 && v35 != 18520)
    {
      int v40 = *__error();
      int v41 = *(NSObject **)(a3 + 2072);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = LOWORD(__buf.st_dev);
        *(_WORD *)&uint8_t buf[8] = 1024;
        *(_DWORD *)&buf[10] = LOWORD(__buf.st_lspare);
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_ERROR, "filesystem unsupported or corrupt: drSigWord = %#hx, drEmbedSigWord = %#hx", buf, 0xEu);
      }
      *__error() = v40;
      uint64_t v9 = 92;
      goto LABEL_103;
    }
    if (v36 >> 8 == 6647395)
    {
      int v37 = v36;
      goto LABEL_93;
    }
    int v123 = 1;
    *(void *)long long v122 = 3;
    memset(&v142, 0, sizeof(v142));
    int v95 = -1;
    size_t v94 = 4;
    if (getvfsbyname("hfs", &v142) == -1) {
      sub_100043720(&v93, buf);
    }
    v122[1] = v142.vfc_typenum;
    if ((sysctl(v122, 3u, &v95, &v94, 0, 0) & 0x80000000) == 0) {
      *__error() = 0;
    }
    int v42 = *__error();
    if (v42 && v42 != 45 && *__error()) {
      sub_100043920(&v93, buf);
    }
    int v37 = v95;
    if ((v95 + 1) > 1)
    {
LABEL_93:
      if (v37 == 4)
      {
LABEL_94:
        uint64_t v9 = 0;
        HIDWORD(v90) = v37;
      }
      else
      {
        unint64_t v58 = -1;
        pid_t v59 = &qword_100048858;
        while (v58 != 36)
        {
          uint64_t v60 = *v59;
          v59 += 3;
          ++v58;
          if (v60 == v37)
          {
            if (v58 < 0x25) {
              goto LABEL_94;
            }
            break;
          }
        }
        int v61 = *__error();
        int v62 = *(NSObject **)(a3 + 2072);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v37;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "unsupported encoding: %u", buf, 8u);
        }
        *__error() = v61;
        uint64_t v9 = 79;
        int v12 = v85;
      }
LABEL_102:
      if (v26 == -1) {
        goto LABEL_104;
      }
      goto LABEL_103;
    }
    bzero(buf, 0x400uLL);
    int v43 = getpwuid(0);
    if (!v43) {
      sub_1000438A0(v122, &v142);
    }
    snprintf(buf, 0x400uLL, "%s/%s", v43->pw_dir, "/.CFUserTextEncoding");
    int v44 = open(buf, 0);
    if ((v44 & 0x80000000) == 0) {
      *__error() = 0;
    }
    int v37 = 0;
    int v45 = *__error();
    int v82 = v44;
    if (v45 > 3)
    {
      if (v45 != 4 && v45 != 13) {
        goto LABEL_76;
      }
    }
    else
    {
      if (!v45)
      {
LABEL_77:
        ssize_t v48 = read(v44, buf, 0x400uLL);
        if (v48)
        {
          if (v48 < 0)
          {
            int v53 = *__error();
            int v54 = *(NSObject **)(a3 + 2072);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              int v55 = *__error();
              v142.vfc_reserved1 = 67109120;
              *(_DWORD *)v142.vfc_name = v55;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "error reading encoding file: %{darwin.errno}d", (uint8_t *)&v142, 8u);
            }
            int v37 = 0;
            *__error() = v53;
          }
          else
          {
            buf[v48] = 0;
            int v49 = *__error();
            unint64_t v50 = *(NSObject **)(a3 + 2072);
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              v142.vfc_reserved1 = 136315138;
              *(void *)v142.vfc_name = buf;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "read encoding: %s", (uint8_t *)&v142, 0xCu);
            }
            *__error() = v49;
            int v37 = strtol(buf, 0, 0);
          }
        }
        else
        {
          int v51 = *__error();
          int v52 = *(NSObject **)(a3 + 2072);
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(v142.vfc_reserved1) = 0;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEBUG, "encoding file empty", (uint8_t *)&v142, 2u);
          }
          int v37 = 0;
          *__error() = v51;
        }
        goto LABEL_88;
      }
      if (v45 != 2)
      {
LABEL_76:
        if (*__error()) {
          sub_100043920(v122, &v142);
        }
        goto LABEL_77;
      }
    }
LABEL_88:
    int v56 = *__error();
    int v57 = *(NSObject **)(a3 + 2072);
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
    {
      v142.vfc_reserved1 = 67109120;
      *(_DWORD *)v142.vfc_name = v37;
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "returning encoding: %u", (uint8_t *)&v142, 8u);
    }
    *__error() = v56;
    if (v82 != -1 && close(v82) == -1) {
      sub_100043820(v122, &v142);
    }
    int v12 = v85;
    goto LABEL_93;
  }
  if (strcmp(v13, "apfs"))
  {
    int v14 = *__error();
    int v15 = *(NSObject **)(a3 + 2072);
    uint64_t v9 = 22;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    uint64_t v16 = *(void *)(a3 + 16);
    *(_DWORD *)int buf = 136315394;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&unsigned char buf[12] = 1024;
    *(_DWORD *)&buf[14] = 22;
    CFStringRef v17 = "Invalid FS type: %s: %{darwin.errno}d";
    CFBooleanRef v18 = v15;
    uint32_t v19 = 18;
    goto LABEL_111;
  }
  long long v140 = 0u;
  memset(v141, 0, 48);
  long long v139 = 0u;
  long long v138 = 0u;
  long long v137 = 0u;
  long long v136 = 0u;
  long long v135 = 0u;
  long long v134 = 0u;
  long long v133 = 0u;
  long long v132 = 0u;
  long long v131 = 0u;
  long long v130 = 0u;
  long long v129 = 0u;
  long long v128 = 0u;
  long long v127 = 0u;
  long long v126 = 0u;
  long long v125 = 0u;
  *(_OWORD *)&uint8_t buf[8] = 0u;
  int v27 = *(_DWORD *)(a3 + 2092);
  int v28 = *(_DWORD *)(a3 + 2084);
  int v84 = *(_DWORD *)(a3 + 2096);
  int v86 = *(_DWORD *)(a3 + 2088);
  uint64_t v97 = 0;
  memset(v96, 0, sizeof(v96));
  memset(&__buf, 0, 56);
  int v29 = a2 | 0x100001;
  *(void *)int buf = a3 + 1048;
  v141[11] = getuid();
  v141[12] = getgid();
  *(_WORD *)&uint8_t buf[16] = 1;
  *(_DWORD *)&uint8_t buf[8] = v29;
  if (*(unsigned char *)(a3 + 2080))
  {
    uint64_t v30 = sub_10003F01C(v27, v96);
    if (v30)
    {
      uint64_t v9 = v30;
      int v31 = *__error();
      int v32 = *(NSObject **)(a3 + 2072);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        v142.vfc_reserved1 = 67109120;
        *(_DWORD *)v142.vfc_name = v9;
        CFTypeRef v33 = "Failed to read im4m.: %{darwin.errno}d";
LABEL_67:
        unint64_t v39 = v32;
        goto LABEL_68;
      }
      goto LABEL_69;
    }
    uint64_t v9 = sub_10003F01C(v28, &__buf);
    int v31 = *__error();
    int v38 = *(NSObject **)(a3 + 2072);
    if (v9)
    {
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v142.vfc_reserved1 = 67109120;
        *(_DWORD *)v142.vfc_name = v9;
        CFTypeRef v33 = "Failed to read root volume hash.: %{darwin.errno}d";
        unint64_t v39 = v38;
LABEL_68:
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, v33, (uint8_t *)&v142, 8u);
        goto LABEL_69;
      }
      goto LABEL_69;
    }
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v142.vfc_reserved1 = 134217984;
      *(void *)v142.vfc_name = *((void *)&v96[0] + 1);
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "im4m len: %lu", (uint8_t *)&v142, 0xCu);
    }
    *__error() = v31;
    int v46 = *__error();
    __int16 v47 = *(NSObject **)(a3 + 2072);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      v142.vfc_reserved1 = 134217984;
      *(void *)v142.vfc_name = __buf.st_ino;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "im4p len: %lu", (uint8_t *)&v142, 0xCu);
    }
    *__error() = v46;
    *(_WORD *)&uint8_t buf[16] = 8;
    v141[9] = v86;
    v141[10] = v84;
    *(_OWORD *)&v141[5] = v96[0];
    *(void *)&v141[1] = *(void *)&__buf.st_dev;
    *(void *)&v141[3] = __buf.st_ino;
  }
  if (fmount("apfs", v6, v29, buf))
  {
    uint64_t v9 = *__error();
    int v31 = *__error();
    int v32 = *(NSObject **)(a3 + 2072);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v142.vfc_reserved1 = 67109120;
      *(_DWORD *)v142.vfc_name = v9;
      CFTypeRef v33 = "fmount: %{darwin.errno}d";
      goto LABEL_67;
    }
LABEL_69:
    *__error() = v31;
    goto LABEL_70;
  }
  uint64_t v9 = 0;
LABEL_70:
  sub_10003FA64(v96);
  sub_10003FA64(&__buf);
  if (v9)
  {
    int v14 = *__error();
    CFTypeID v20 = *(NSObject **)(a3 + 2072);
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      goto LABEL_112;
    }
    *(_DWORD *)int buf = 67109120;
    *(_DWORD *)&uint8_t buf[4] = v9;
    CFStringRef v17 = "mount apfs failed: %{darwin.errno}d";
    goto LABEL_110;
  }
LABEL_142:
  if (close(v6) == -1) {
    sub_1000437A0(v96, buf);
  }
  uint64_t v9 = 0;
  *a1 = -1;
LABEL_118:
  if (*(os_log_t *)(a3 + 2072) == v8) {
    *(void *)(a3 + 2072) = 0;
  }
  if (v8) {
    os_release(v8);
  }
  return v9;
}

uint64_t sub_10002885C(uint64_t a1)
{
  CFTypeRef cf = 0;
  bzero(v18, 0x400uLL);
  uint64_t v2 = sub_1000268C0(a1, &cf);
  if (v2)
  {
    uint64_t v3 = v2;
    int v4 = *__error();
    id v5 = *(NSObject **)(a1 + 2072);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      int v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "attach failed: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v4;
    CFTypeRef v6 = cf;
    if (!cf) {
      return v3;
    }
LABEL_13:
    CFRelease(v6);
    return v3;
  }
  CFTypeRef v6 = cf;
  uint64_t v7 = sub_100026E94(a1, cf, (const char **)(a1 + 16), v18, (char *)(a1 + 1048));
  if (v7)
  {
    uint64_t v3 = v7;
    int v8 = *__error();
    uint64_t v9 = *(NSObject **)(a1 + 2072);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      int v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "could not find attached media: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v8;
    if (v6) {
      goto LABEL_13;
    }
  }
  else
  {
    int v10 = open(v18, 0);
    *(_DWORD *)(a1 + 4) = v10;
    if ((v10 & 0x80000000) == 0)
    {
      __strlcpy_chk();
      uint64_t v3 = 0;
      if (!v6) {
        return v3;
      }
      goto LABEL_13;
    }
    int v12 = *__error();
    CFTypeRef v13 = *(NSObject **)(a1 + 2072);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = *__error();
      *(_DWORD *)int buf = 67109120;
      int v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "open: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v12;
    uint64_t v3 = *__error();
    if (v6) {
      goto LABEL_13;
    }
  }
  return v3;
}

uint64_t sub_100028A78(void *a1, void *a2, NSObject *a3)
{
  kern_return_t v19;
  kern_return_t v20;
  int v21;
  io_registry_entry_t v22;
  io_object_t v23;
  CFStringRef v24;
  int v25;
  int v26;
  CFTypeRef v27;
  size_t v28;
  const char *f_mntfromname;
  char *v31;
  int v32;
  NSObject *v33;
  unsigned int v34;
  void *v35;
  uint64_t v36;
  CFTypeRef cf;
  CFTypeRef v38;
  io_iterator_t notification;
  _OWORD v40[16];
  char v41[256];
  void v42[32];
  uint8_t buf[4];
  CFTypeRef v44;
  __int16 v45;
  CFTypeRef v46;

  notification = 0;
  unsigned int v6 = getfsstat(0, 0, 2);
  if ((v6 & 0x80000000) != 0)
  {
    uint64_t v11 = *__error();
    int v12 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v44) = v11;
      _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "getfsstat: %{darwin.errno}d", buf, 8u);
    }
    CFTypeRef v13 = __error();
    uint64_t v9 = 0;
    goto LABEL_18;
  }
  unsigned int v7 = v6;
  size_t v8 = v6;
  if (_dispatch_is_multithreaded())
  {
    uint64_t v9 = (statfs *)malloc_type_calloc(v8, 0x878uLL, 0x1B044E25uLL);
    if (!v9)
    {
      do
      {
        __os_temporary_resource_shortage();
        int v10 = (statfs *)malloc_type_calloc(v8, 0x878uLL, 0x1B044E25uLL);
      }
      while (!v10);
      uint64_t v9 = v10;
    }
  }
  else
  {
    uint64_t v9 = (statfs *)malloc_type_calloc(v8, 0x878uLL, 0x61D5536CuLL);
    if (!v9) {
      sub_100043A44(v42, buf);
    }
  }
  if (getfsstat(v9, 2168 * v7, 2) < 0)
  {
    uint64_t v11 = *__error();
    int v12 = *__error();
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v44) = v11;
      _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "getfsstat: %{darwin.errno}d", buf, 8u);
    }
    CFTypeRef v13 = __error();
LABEL_18:
    int *v13 = v12;
    goto LABEL_61;
  }
  if (_dispatch_is_multithreaded())
  {
    int v14 = (char *)malloc_type_calloc(v8, 0xDFEuLL, 0x1B044E25uLL);
    if (!v14)
    {
      do
      {
        __os_temporary_resource_shortage();
        int v15 = (char *)malloc_type_calloc(v8, 0xDFEuLL, 0x1B044E25uLL);
      }
      while (!v15);
      int v14 = v15;
    }
  }
  else
  {
    int v14 = (char *)malloc_type_calloc(v8, 0xDFEuLL, 0x61D5536CuLL);
    if (!v14) {
      sub_1000439A0(v42, buf);
    }
  }
  IONotificationPortRef v16 = IONotificationPortCreate(0);
  if (!v16) {
    sub_1000435C0();
  }
  int v17 = v16;
  CFDictionaryRef v18 = IOServiceMatching("IOMedia");
  uint32_t v19 = IOServiceAddMatchingNotification(v17, "IOServiceMatched", v18, 0, 0, &notification);
  if (!v19)
  {
    unsigned int v35 = a1;
    unsigned int v34 = v7;
    unsigned int v36 = 0;
    while (1)
    {
      int v22 = IOIteratorNext(notification);
      if (!v22)
      {
        uint64_t v11 = 0;
        *unsigned int v35 = v14;
        *a2 = v36;
        goto LABEL_60;
      }
      int v23 = v22;
      CFTypeRef cf = 0;
      int v38 = 0;
      memset(v42, 0, 255);
      memset(v41, 0, 255);
      memset(v40, 0, 255);
      io_registry_entry_t v24 = (const __CFString *)IORegistryEntrySearchCFProperty(v22, "IOService", @"hdik-unique-identifier", 0, 3u);
      if (!v24
        || IOObjectConformsTo(v23, "AppleAPFSVolume")
        || IOObjectConformsTo(v23, "AppleAPFSMedia")
        || IOObjectConformsTo(v23, "AppleAPFSContainerScheme")
        || IOObjectConformsTo(v23, "AppleAPFSContainer"))
      {
        goto LABEL_38;
      }
      int v25 = *__error();
      if (os_log_type_enabled(a3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 138412290;
        int v44 = v24;
        _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "found property: %@", buf, 0xCu);
      }
      *__error() = v25;
      int v26 = sub_1000272CC(a3, v23, 0, &v38, &cf);
      int v32 = *__error();
      if (v26) {
        break;
      }
      if (os_log_type_enabled(a3, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int buf = 138412546;
        int v44 = v38;
        int v45 = 2112;
        int v46 = cf;
        _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "found dev nodes: dev = %@, sub = %@", buf, 0x16u);
      }
      *__error() = v32;
      if (!sub_10000BCA0(v24, (char *)v42, 255)) {
        sub_100043654();
      }
      if (!sub_10000BCA0((const __CFString *)v38, v41, 255)) {
        sub_100043654();
      }
      int v27 = cf;
      if (!sub_10000BCA0((const __CFString *)cf, (char *)v40, 255)) {
        sub_100043654();
      }
      if (v34)
      {
        CFTypeRef v33 = a3;
        int v28 = v8;
        f_mntfromname = v9->f_mntfromname;
        while (1)
        {
          bzero(buf, 0x400uLL);
          snprintf((char *)buf, 0x400uLL, "%s%s", "/dev/", (const char *)v40);
          if (!strcmp(f_mntfromname, (const char *)buf)) {
            break;
          }
          f_mntfromname += 2168;
          if (!--v28)
          {
            a3 = v33;
            goto LABEL_38;
          }
        }
        a3 = v33;
        int v31 = &v14[3582 * v36];
        __strlcpy_chk();
        snprintf(v31 + 510, 0x400uLL, "%s%s", "/dev/", v41);
        snprintf(v31 + 1534, 0x400uLL, "%s%s", "/dev/", (const char *)v40);
        strlcpy(v31 + 2558, f_mntfromname - 1024, 0x400uLL);
        ++v36;
        goto LABEL_38;
      }
LABEL_39:
      if (v27) {
        CFRelease(v27);
      }
      if (v38) {
        CFRelease(v38);
      }
      if (v24) {
        CFRelease(v24);
      }
      if (IOObjectRelease(v23)) {
        sub_1000435DC(v42, buf);
      }
    }
    if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v44) = v26;
      _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to get device nodes: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v32;
LABEL_38:
    int v27 = cf;
    goto LABEL_39;
  }
  CFTypeID v20 = v19;
  *__error() = 83;
  int v21 = *__error();
  if (os_log_type_enabled(a3, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int buf = 67109120;
    LODWORD(v44) = v20;
    _os_log_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "IOServiceAddMatchingNotification: %{mach.errno}x", buf, 8u);
  }
  *__error() = v21;
  uint64_t v11 = 0xFFFFFFFFLL;
LABEL_60:
  IONotificationPortDestroy(v17);
LABEL_61:
  if (notification && IOObjectRelease(notification)) {
    sub_1000435DC(v42, buf);
  }
  free(v9);
  return v11;
}

void sub_1000291F0(uint64_t a1)
{
  os_release(*(void **)(a1 + 64));
  free(*(void **)(a1 + 72));
  close_drop_optional_np();

  sub_10003DE34(a1 + 16);
}

uint64_t sub_100029240(uint64_t a1, void *a2, const char *a3, uint64_t a4)
{
  uint64_t v8 = sub_1000131E8();
  *(void *)(v8 + 40) = a4;
  *(void *)(v8 + 64) = os_retain(a2);
  *(void *)(v8 + 48) = a1;
  if (_dispatch_is_multithreaded())
  {
    uint64_t v9 = strdup(a3);
    if (!v9)
    {
      do
      {
        __os_temporary_resource_shortage();
        int v10 = strdup(a3);
      }
      while (!v10);
      uint64_t v9 = v10;
    }
  }
  else
  {
    uint64_t v9 = strdup(a3);
    if (!v9) {
      sub_1000420A0(a3, &v14, v15);
    }
  }
  *(void *)(v8 + 72) = v9;
  *(_DWORD *)(v8 + 80) = -1;
  uint64_t v11 = strrchr(v9, 47);
  if (v11) {
    int v12 = v11 + 1;
  }
  else {
    int v12 = v9;
  }
  *(void *)(v8 + 56) = v12;
  sub_10003DB40(v8 + 16, (int)"com.apple.security.cryptexd", "resource");
  sub_10003DB74(v8 + 16, *(const char **)(v8 + 56));
  return v8;
}

uint64_t sub_100029370(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(v3 + 48);
  uint64_t v5 = **(void **)(a1 + 48);
  unsigned int v6 = (uint64_t (*)(uint64_t, uint64_t))qword_10005AFE0[v5];
  uint64_t v7 = openat(*(_DWORD *)(v3 + 56), *(const char **)(a1 + 72), a2 & 0xFFFFFFFC);
  int v34 = v7;
  if ((v7 & 0x80000000) == 0) {
    *__error() = 0;
  }
  if (*__error())
  {
    uint64_t v8 = *__error();
    uint64_t v9 = *(const char **)(a1 + 16);
    int v10 = *__error();
    uint64_t v11 = *(NSObject **)(a1 + 32);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      *__error() = v10;
      goto LABEL_10;
    }
    int v12 = "[anonymous]";
    if (v9) {
      int v12 = v9;
    }
    uint64_t v13 = *(void *)(v4 + 8);
    uint64_t v14 = *(void *)(a1 + 72);
    *(_DWORD *)int buf = 136446978;
    int v37 = v12;
    __int16 v38 = 2080;
    uint64_t v39 = v13;
    __int16 v40 = 2080;
    uint64_t v41 = v14;
    __int16 v42 = 1024;
    int v43 = v8;
    int v15 = "%{public}s: failed to open %s resource: %s: %{darwin.errno}d";
    IONotificationPortRef v16 = v11;
    uint32_t v17 = 38;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
    goto LABEL_9;
  }
  uint32_t v19 = *(const char **)(a1 + 16);
  int v20 = *__error();
  int v21 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    int v22 = "[anonymous]";
    if (v19) {
      int v22 = v19;
    }
    uint64_t v23 = *(void *)(v4 + 8);
    uint64_t v24 = *(void *)(a1 + 72);
    *(_DWORD *)int buf = 136446722;
    int v37 = v22;
    __int16 v38 = 2080;
    uint64_t v39 = v23;
    __int16 v40 = 2080;
    uint64_t v41 = v24;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%{public}s: opened %s resource: %s", buf, 0x20u);
  }
  *__error() = v20;
  if ((unint64_t)(v5 - 7) >= 0xFFFFFFFFFFFFFFFELL)
  {
    uint64_t v25 = v6(a1, v7);
    if (v25)
    {
      uint64_t v8 = v25;
      int v26 = *(const char **)(a1 + 16);
      int v10 = *__error();
      int v27 = *(NSObject **)(a1 + 32);
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        goto LABEL_9;
      }
      int v28 = "[anonymous]";
      uint64_t v29 = *(void *)(a1 + 56);
      if (v26) {
        int v28 = v26;
      }
      *(_DWORD *)int buf = 136446722;
      int v37 = v28;
      __int16 v38 = 2080;
      uint64_t v39 = v29;
      __int16 v40 = 1024;
      LODWORD(v41) = v8;
      int v15 = "%{public}s: failed to validate resource: %s: %{darwin.errno}d";
      IONotificationPortRef v16 = v27;
      uint32_t v17 = 28;
      goto LABEL_8;
    }
  }
  if (fstat(v7, (stat *)(a1 + 88)))
  {
    uint64_t v8 = *__error();
    uint64_t v30 = *(const char **)(a1 + 16);
    int v31 = *__error();
    int v32 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      CFTypeRef v33 = "[anonymous]";
      if (v30) {
        CFTypeRef v33 = v30;
      }
      *(_DWORD *)int buf = 136446466;
      int v37 = v33;
      __int16 v38 = 1024;
      LODWORD(v3snprintf(byte_10005E420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v8;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{public}s: fstat: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v31;
  }
  else
  {
    uint64_t v8 = 0;
    *(_DWORD *)(a1 + 80) = sub_10003DE70(&v34);
    LODWORD(v7) = v34;
  }
LABEL_10:
  if (v7 != -1 && close(v7) == -1) {
    sub_100041EA4(&v35, buf);
  }
  return v8;
}

uint64_t sub_1000296C0(uint64_t a1, uint64_t a2)
{
  CFURLRef bundleURL = 0;
  uint64_t v3 = sub_10000BCDC(a2, &bundleURL);
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(const char **)(a1 + 16);
    int v6 = *__error();
    uint64_t v7 = *(NSObject **)(a1 + 32);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
LABEL_7:
      CFBundleRef v10 = 0;
      *__error() = v6;
      goto LABEL_10;
    }
    uint64_t v8 = "[anonymous]";
    if (v5) {
      uint64_t v8 = v5;
    }
    *(_DWORD *)int buf = 136446466;
    uint32_t v17 = v8;
    __int16 v18 = 1024;
    int v19 = v4;
    uint64_t v9 = "%{public}s: _CFURLCreateFromFileDescriptor: %{darwin.errno}d";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, v9, buf, 0x12u);
    goto LABEL_7;
  }
  CFBundleRef v11 = CFBundleCreate(kCFAllocatorDefault, bundleURL);
  if (!v11)
  {
    uint64_t v13 = *(const char **)(a1 + 16);
    int v6 = *__error();
    uint64_t v7 = *(NSObject **)(a1 + 32);
    uint64_t v4 = 22;
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v14 = "[anonymous]";
    if (v13) {
      uint64_t v14 = v13;
    }
    *(_DWORD *)int buf = 136446466;
    uint32_t v17 = v14;
    __int16 v18 = 1024;
    int v19 = 22;
    uint64_t v9 = "%{public}s: failed to create bundle from resource: %{darwin.errno}d";
    goto LABEL_6;
  }
  CFBundleRef v10 = v11;
  uint64_t v4 = 0;
LABEL_10:
  if (bundleURL) {
    CFRelease(bundleURL);
  }
  if (v10) {
    CFRelease(v10);
  }
  return v4;
}

void sub_100029858(void *a1)
{
  id v1 = a1;
  xpc_dictionary_get_remote_connection(v1);
  uint64_t v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  string = xpc_dictionary_get_string(v1, "MOUNT_SUB_REQ");
  uint64_t v4 = string;
  if (!string) {
    goto LABEL_4;
  }
  if (strcmp(string, "REQ:MOUNT"))
  {
    if (strcmp(v4, "REQ:UNMOUNT"))
    {
LABEL_4:
      *(_OWORD *)long long buffer = *(_OWORD *)"unknown";
      *(_OWORD *)&buffer[16] = unk_100048BD8;
      pid_t pid = xpc_connection_get_pid(v2);
      proc_name(pid, buffer, 0x20u);
      int v6 = sub_10002BD08();

      if (v6)
      {
        uint64_t v7 = sub_10002BD08();
        os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
        if (v2) {
          pid_t v8 = xpc_connection_get_pid(v2);
        }
        else {
          pid_t v8 = -1;
        }
        LODWORD(v173[0]) = 136316162;
        *(void *)((char *)v173 + 4) = buffer;
        WORD6(v173[0]) = 1024;
        *(_DWORD *)((char *)v173 + 14) = v8;
        WORD1(v173[1]) = 2080;
        *(void *)((char *)&v173[1] + 4) = v4;
        WORD6(v173[1]) = 2080;
        *(void *)((char *)&v173[1] + 14) = "MOUNT_SUB_REQ";
        WORD3(v173[2]) = 1024;
        DWORD2(v173[2]) = 22;
      }
      else
      {
        id v16 = &_os_log_default;
        if (v2) {
          pid_t v17 = xpc_connection_get_pid(v2);
        }
        else {
          pid_t v17 = -1;
        }
        LODWORD(v173[0]) = 136316162;
        *(void *)((char *)v173 + 4) = buffer;
        WORD6(v173[0]) = 1024;
        *(_DWORD *)((char *)v173 + 14) = v17;
        WORD1(v173[1]) = 2080;
        *(void *)((char *)&v173[1] + 4) = v4;
        WORD6(v173[1]) = 2080;
        *(void *)((char *)&v173[1] + 14) = "MOUNT_SUB_REQ";
        WORD3(v173[2]) = 1024;
        DWORD2(v173[2]) = 22;
        uint64_t v7 = &_os_log_default;
      }
      uint64_t v29 = (char *)_os_log_send_and_compose_impl();

      uint64_t v30 = sub_10000BF78("mount_sub_handle_request", "sub_mount.m", 414, "com.apple.security.cryptex.posix", 22, 0, v29);
      free(v29);
      sub_10002BD5C(v1, v30, 0, 0, 0);
      goto LABEL_228;
    }
    id v18 = v1;
    int v19 = xpc_dictionary_get_remote_connection(v18);
    LOBYTE(v167) = 0;
    int v168 = -1;
    unsigned int v20 = sub_10002BF98(v19, (uint64_t)"com.apple.private.security.cryptex.unmount");
    if (v20)
    {
      v173[0] = *(_OWORD *)"unknown";
      v173[1] = unk_100048BD8;
      pid_t v21 = xpc_connection_get_pid((xpc_connection_t)v19);
      proc_name(v21, v173, 0x20u);
      int v22 = sub_10002BD08();

      if (v22)
      {
        uint64_t v23 = sub_10002BD08();
        os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
        if (v19) {
          pid_t v24 = xpc_connection_get_pid((xpc_connection_t)v19);
        }
        else {
          pid_t v24 = -1;
        }
        *(_DWORD *)long long buffer = 136315650;
        *(void *)&buffer[4] = v173;
        *(_WORD *)&buffer[12] = 1024;
        *(_DWORD *)&buffer[14] = v24;
        *(_WORD *)&buffer[18] = 1024;
        *(_DWORD *)&buffer[20] = v20;
      }
      else
      {
        id v39 = &_os_log_default;
        if (v19) {
          pid_t v40 = xpc_connection_get_pid((xpc_connection_t)v19);
        }
        else {
          pid_t v40 = -1;
        }
        *(_DWORD *)long long buffer = 136315650;
        *(void *)&buffer[4] = v173;
        *(_WORD *)&buffer[12] = 1024;
        *(_DWORD *)&buffer[14] = v40;
        *(_WORD *)&buffer[18] = 1024;
        *(_DWORD *)&buffer[20] = v20;
        uint64_t v23 = &_os_log_default;
      }
      unint64_t v68 = (char *)_os_log_send_and_compose_impl();

      int v69 = sub_10000BF78("mount_sub_unmount_cryptex", "sub_mount.m", 359, "com.apple.security.cryptex.posix", v20, 0, v68);
      uint64_t v70 = v68;
      goto LABEL_66;
    }
    int v31 = xpc_dictionary_dup_fd(v18, "UNMOUNT:INFO_FD");
    int v168 = v31;
    if (v31 == -1)
    {
      *(_OWORD *)long long buffer = *(_OWORD *)"unknown";
      *(_OWORD *)&buffer[16] = unk_100048BD8;
      pid_t v45 = xpc_connection_get_pid((xpc_connection_t)v19);
      proc_name(v45, buffer, 0x20u);
      int v46 = sub_10002BD08();

      if (v46)
      {
        __int16 v47 = sub_10002BD08();
        os_log_type_enabled(v47, OS_LOG_TYPE_ERROR);
        if (v19) {
          pid_t v48 = xpc_connection_get_pid((xpc_connection_t)v19);
        }
        else {
          pid_t v48 = -1;
        }
        LODWORD(v173[0]) = 136315906;
        *(void *)((char *)v173 + 4) = buffer;
        WORD6(v173[0]) = 1024;
        *(_DWORD *)((char *)v173 + 14) = v48;
        WORD1(v173[1]) = 2080;
        *(void *)((char *)&v173[1] + 4) = "MOUNT:INFO_FD";
        WORD6(v173[1]) = 1024;
        *(_DWORD *)((char *)&v173[1] + 14) = 22;
      }
      else
      {
        id v79 = &_os_log_default;
        if (v19) {
          pid_t v80 = xpc_connection_get_pid((xpc_connection_t)v19);
        }
        else {
          pid_t v80 = -1;
        }
        LODWORD(v173[0]) = 136315906;
        *(void *)((char *)v173 + 4) = buffer;
        WORD6(v173[0]) = 1024;
        *(_DWORD *)((char *)v173 + 14) = v80;
        WORD1(v173[1]) = 2080;
        *(void *)((char *)&v173[1] + 4) = "MOUNT:INFO_FD";
        WORD6(v173[1]) = 1024;
        *(_DWORD *)((char *)&v173[1] + 14) = 22;
        __int16 v47 = &_os_log_default;
      }
      v98 = (char *)_os_log_send_and_compose_impl();

      int v69 = sub_10000BF78("mount_sub_unmount_cryptex", "sub_mount.m", 367, "com.apple.security.cryptex.posix", 22, 0, v98);
      uint64_t v70 = v98;
LABEL_66:
      free(v70);
      int v31 = -1;
      if (!v69)
      {
LABEL_225:
        if (v31 == -1)
        {
LABEL_227:

          goto LABEL_228;
        }
LABEL_226:
        if (close(v31) == -1) {
          sub_100043B94(buffer, v173);
        }
        goto LABEL_227;
      }
LABEL_224:
      sub_10002C188(v18, v69);
      goto LABEL_225;
    }
    int v32 = sub_100040448(v18, "UNMOUNT:FORCE", (BOOL *)&v167);
    if (v32)
    {
      *(_OWORD *)long long buffer = *(_OWORD *)"unknown";
      *(_OWORD *)&buffer[16] = unk_100048BD8;
      pid_t v33 = xpc_connection_get_pid((xpc_connection_t)v19);
      proc_name(v33, buffer, 0x20u);
      int v34 = sub_10002BD08();

      if (v34)
      {
        uint64_t v35 = sub_10002BD08();
        os_log_type_enabled(v35, OS_LOG_TYPE_ERROR);
        if (v19) {
          pid_t v36 = xpc_connection_get_pid((xpc_connection_t)v19);
        }
        else {
          pid_t v36 = -1;
        }
        LODWORD(v173[0]) = 136315906;
        *(void *)((char *)v173 + 4) = buffer;
        WORD6(v173[0]) = 1024;
        *(_DWORD *)((char *)v173 + 14) = v36;
        WORD1(v173[1]) = 2080;
        *(void *)((char *)&v173[1] + 4) = "UNMOUNT:FORCE";
        WORD6(v173[1]) = 1024;
        *(_DWORD *)((char *)&v173[1] + 14) = v32;
      }
      else
      {
        id v77 = &_os_log_default;
        if (v19) {
          pid_t v78 = xpc_connection_get_pid((xpc_connection_t)v19);
        }
        else {
          pid_t v78 = -1;
        }
        LODWORD(v173[0]) = 136315906;
        *(void *)((char *)v173 + 4) = buffer;
        WORD6(v173[0]) = 1024;
        *(_DWORD *)((char *)v173 + 14) = v78;
        WORD1(v173[1]) = 2080;
        *(void *)((char *)&v173[1] + 4) = "UNMOUNT:FORCE";
        WORD6(v173[1]) = 1024;
        *(_DWORD *)((char *)&v173[1] + 14) = v32;
        uint64_t v35 = &_os_log_default;
      }
      size_t v94 = (char *)_os_log_send_and_compose_impl();

      CFErrorRef v95 = sub_10000BF78("mount_sub_unmount_cryptex", "sub_mount.m", 375, "com.apple.security.cryptex.posix", v32, 0, v94);
      goto LABEL_223;
    }
    uint64_t v57 = v167;
    id v161 = v18;
    xpc_dictionary_get_remote_connection(v161);
    unint64_t v58 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v180 = 0;
    long long v178 = 0u;
    long long v179 = 0u;
    long long v176 = 0u;
    long long v177 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    memset(v173, 0, sizeof(v173));
    uint64_t v172 = 0;
    memset(v171, 0, sizeof(v171));
    uint64_t v163 = sub_100016EB4();
    int v59 = sub_10003F01C(v31, v171);
    if (v59)
    {
      *(_OWORD *)long long buffer = *(_OWORD *)"unknown";
      *(_OWORD *)&buffer[16] = unk_100048BD8;
      pid_t v60 = xpc_connection_get_pid(v58);
      proc_name(v60, buffer, 0x20u);
      int v61 = *__error();
      int v62 = sub_10002BD08();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
      {
        if (v58) {
          pid_t v63 = xpc_connection_get_pid(v58);
        }
        else {
          pid_t v63 = -1;
        }
        *(_DWORD *)int buf = 136315650;
        *(void *)&uint8_t buf[4] = buffer;
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = v63;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v59;
        _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "XPC client <process=%s pid=%d>: Failed to read cryptex info from disk.: %{darwin.errno}d", buf, 0x18u);
      }

      id v84 = 0;
      long long v103 = 0;
      *__error() = v61;
    }
    else
    {
      int v83 = (void *)xpc_create_from_plist();
      if (v83)
      {
        id v84 = v83;
        if (xpc_get_type(v84) == (xpc_type_t)&_xpc_type_dictionary)
        {
          int v59 = sub_10002DF18(v84, 0, (uint64_t)v173, 1);
          if (v59)
          {
            long long v104 = xpc_copy_description(v84);
            *(_OWORD *)int buf = *(_OWORD *)"unknown";
            *(_OWORD *)&uint8_t buf[16] = unk_100048BD8;
            pid_t v105 = xpc_connection_get_pid(v58);
            proc_name(v105, buf, 0x20u);
            int v160 = *__error();
            long long v106 = sub_10002BD08();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
            {
              if (v58) {
                pid_t v107 = xpc_connection_get_pid(v58);
              }
              else {
                pid_t v107 = -1;
              }
              *(_DWORD *)long long buffer = 136315906;
              *(void *)&buffer[4] = buf;
              *(_WORD *)&buffer[12] = 1024;
              *(_DWORD *)&buffer[14] = v107;
              *(_WORD *)&buffer[18] = 2080;
              *(void *)&buffer[20] = v104;
              *(_WORD *)&buffer[28] = 1024;
              *(_DWORD *)&buffer[30] = v59;
              _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_ERROR, "XPC client <process=%s pid=%d>: Info.plist invalid contents: %s: %{darwin.errno}d", buffer, 0x22u);
            }

            *__error() = v160;
            free(v104);
          }
          else
          {
            sub_10002C2F4((uint64_t)buffer, v173);
            sub_100018908(v163, v57, (uint64_t)buffer, (uint64_t)v161, (uint64_t)sub_10002C380);
            int v59 = 0;
          }
          long long v103 = v84;
          goto LABEL_212;
        }

        int v85 = xpc_copy_description(v84);
        *(_OWORD *)int buf = *(_OWORD *)"unknown";
        *(_OWORD *)&uint8_t buf[16] = unk_100048BD8;
        pid_t v86 = xpc_connection_get_pid(v58);
        proc_name(v86, buf, 0x20u);
        int v87 = *__error();
        uid_t v88 = sub_10002BD08();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        {
          if (v58) {
            pid_t v89 = xpc_connection_get_pid(v58);
          }
          else {
            pid_t v89 = -1;
          }
          *(_DWORD *)long long buffer = 136315906;
          *(void *)&buffer[4] = buf;
          *(_WORD *)&buffer[12] = 1024;
          *(_DWORD *)&buffer[14] = v89;
          *(_WORD *)&buffer[18] = 2080;
          *(void *)&buffer[20] = v85;
          *(_WORD *)&buffer[28] = 1024;
          *(_DWORD *)&buffer[30] = 212;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "XPC client <process=%s pid=%d>: Info.plist invalid root type: %s: %{darwin.errno}d", buffer, 0x22u);
        }

        *__error() = v87;
        free(v85);
        long long v103 = 0;
      }
      else
      {
        *(_OWORD *)long long buffer = *(_OWORD *)"unknown";
        *(_OWORD *)&buffer[16] = unk_100048BD8;
        pid_t v99 = xpc_connection_get_pid(v58);
        proc_name(v99, buffer, 0x20u);
        int v100 = *__error();
        long long v101 = sub_10002BD08();
        if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
        {
          if (v58) {
            pid_t v102 = xpc_connection_get_pid(v58);
          }
          else {
            pid_t v102 = -1;
          }
          *(_DWORD *)int buf = 136315650;
          *(void *)&uint8_t buf[4] = buffer;
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = v102;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = 212;
          _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_ERROR, "XPC client <process=%s pid=%d>: Failed to parse cryptex info: %{darwin.errno}d", buf, 0x18u);
        }

        id v84 = 0;
        long long v103 = 0;
        *__error() = v100;
      }
      int v59 = 212;
    }
LABEL_212:
    sub_10003FA64(v171);

    sub_10002C3C0((uint64_t)v173);
    if (!v59) {
      goto LABEL_226;
    }
    v173[0] = *(_OWORD *)"unknown";
    v173[1] = unk_100048BD8;
    pid_t v146 = xpc_connection_get_pid((xpc_connection_t)v19);
    proc_name(v146, v173, 0x20u);
    v147 = sub_10002BD08();

    if (v147)
    {
      v148 = sub_10002BD08();
      os_log_type_enabled(v148, OS_LOG_TYPE_ERROR);
      if (v19) {
        pid_t v149 = xpc_connection_get_pid((xpc_connection_t)v19);
      }
      else {
        pid_t v149 = -1;
      }
      *(_DWORD *)long long buffer = 136315650;
      *(void *)&buffer[4] = v173;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v149;
      *(_WORD *)&buffer[18] = 1024;
      *(_DWORD *)&buffer[20] = v59;
    }
    else
    {
      id v150 = &_os_log_default;
      if (v19) {
        pid_t v151 = xpc_connection_get_pid((xpc_connection_t)v19);
      }
      else {
        pid_t v151 = -1;
      }
      *(_DWORD *)long long buffer = 136315650;
      *(void *)&buffer[4] = v173;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v151;
      *(_WORD *)&buffer[18] = 1024;
      *(_DWORD *)&buffer[20] = v59;
      v148 = &_os_log_default;
    }
    size_t v94 = (char *)_os_log_send_and_compose_impl();

    CFErrorRef v95 = sub_10000BF78("mount_sub_unmount_cryptex", "sub_mount.m", 383, "com.apple.security.cryptex.posix", v59, 0, v94);
LABEL_223:
    int v69 = v95;
    free(v94);
    if (!v69) {
      goto LABEL_225;
    }
    goto LABEL_224;
  }
  id v9 = v1;
  *(_DWORD *)int buf = -1;
  int v167 = -1;
  int v168 = -1;
  int v165 = -1;
  int v166 = -1;
  CFBundleRef v10 = xpc_dictionary_get_remote_connection(v9);
  unsigned int v11 = sub_10002BF98(v10, (uint64_t)"com.apple.private.security.cryptex.mount");
  if (v11)
  {
    v173[0] = *(_OWORD *)"unknown";
    v173[1] = unk_100048BD8;
    pid_t v12 = xpc_connection_get_pid((xpc_connection_t)v10);
    proc_name(v12, v173, 0x20u);
    uint64_t v13 = sub_10002BD08();

    if (v13)
    {
      uint64_t v14 = sub_10002BD08();
      os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
      if (v10) {
        pid_t v15 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v15 = -1;
      }
      *(_DWORD *)long long buffer = 136315650;
      *(void *)&buffer[4] = v173;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v15;
      *(_WORD *)&buffer[18] = 1024;
      *(_DWORD *)&buffer[20] = v11;
    }
    else
    {
      id v37 = &_os_log_default;
      if (v10) {
        pid_t v38 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v38 = -1;
      }
      *(_DWORD *)long long buffer = 136315650;
      *(void *)&buffer[4] = v173;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v38;
      *(_WORD *)&buffer[18] = 1024;
      *(_DWORD *)&buffer[20] = v11;
      uint64_t v14 = &_os_log_default;
    }
    int v53 = (char *)_os_log_send_and_compose_impl();

    CFErrorRef v54 = sub_10000BF78("mount_sub_mount_cryptex", "sub_mount.m", 182, "com.apple.security.cryptex.posix", v11, 0, v53);
LABEL_55:
    int v55 = v54;
    int v56 = v53;
    goto LABEL_129;
  }
  *(_DWORD *)int buf = xpc_dictionary_dup_fd(v9, "MOUNT:DMG_FD");
  if ((*(_DWORD *)buf & 0x80000000) != 0)
  {
    *(_OWORD *)long long buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100048BD8;
    pid_t v41 = xpc_connection_get_pid((xpc_connection_t)v10);
    proc_name(v41, buffer, 0x20u);
    __int16 v42 = sub_10002BD08();

    if (v42)
    {
      int v43 = sub_10002BD08();
      os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
      if (v10) {
        pid_t v44 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v44 = -1;
      }
      LODWORD(v173[0]) = 136315906;
      *(void *)((char *)v173 + 4) = buffer;
      WORD6(v173[0]) = 1024;
      *(_DWORD *)((char *)v173 + 14) = v44;
      WORD1(v173[1]) = 2080;
      *(void *)((char *)&v173[1] + 4) = "MOUNT:DMG_FD";
      WORD6(v173[1]) = 1024;
      *(_DWORD *)((char *)&v173[1] + 14) = 22;
    }
    else
    {
      id v71 = &_os_log_default;
      if (v10) {
        pid_t v72 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v72 = -1;
      }
      LODWORD(v173[0]) = 136315906;
      *(void *)((char *)v173 + 4) = buffer;
      WORD6(v173[0]) = 1024;
      *(_DWORD *)((char *)v173 + 14) = v72;
      WORD1(v173[1]) = 2080;
      *(void *)((char *)&v173[1] + 4) = "MOUNT:DMG_FD";
      WORD6(v173[1]) = 1024;
      *(_DWORD *)((char *)&v173[1] + 14) = 22;
      int v43 = &_os_log_default;
    }
    uint64_t v92 = (char *)_os_log_send_and_compose_impl();

    CFErrorRef v93 = sub_10000BF78("mount_sub_mount_cryptex", "sub_mount.m", 190, "com.apple.security.cryptex.posix", 22, 0, v92);
    goto LABEL_128;
  }
  int v168 = xpc_dictionary_dup_fd(v9, "MOUNT:LTRS_FD");
  if (v168 < 0)
  {
    *(_OWORD *)long long buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100048BD8;
    pid_t v49 = xpc_connection_get_pid((xpc_connection_t)v10);
    proc_name(v49, buffer, 0x20u);
    unint64_t v50 = sub_10002BD08();

    if (v50)
    {
      int v51 = sub_10002BD08();
      os_log_type_enabled(v51, OS_LOG_TYPE_ERROR);
      if (v10) {
        pid_t v52 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v52 = -1;
      }
      LODWORD(v173[0]) = 136315906;
      *(void *)((char *)v173 + 4) = buffer;
      WORD6(v173[0]) = 1024;
      *(_DWORD *)((char *)v173 + 14) = v52;
      WORD1(v173[1]) = 2080;
      *(void *)((char *)&v173[1] + 4) = "MOUNT:LTRS_FD";
      WORD6(v173[1]) = 1024;
      *(_DWORD *)((char *)&v173[1] + 14) = 22;
    }
    else
    {
      id v81 = &_os_log_default;
      if (v10) {
        pid_t v82 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v82 = -1;
      }
      LODWORD(v173[0]) = 136315906;
      *(void *)((char *)v173 + 4) = buffer;
      WORD6(v173[0]) = 1024;
      *(_DWORD *)((char *)v173 + 14) = v82;
      WORD1(v173[1]) = 2080;
      *(void *)((char *)&v173[1] + 4) = "MOUNT:LTRS_FD";
      WORD6(v173[1]) = 1024;
      *(_DWORD *)((char *)&v173[1] + 14) = 22;
      int v51 = &_os_log_default;
    }
    uint64_t v92 = (char *)_os_log_send_and_compose_impl();

    CFErrorRef v93 = sub_10000BF78("mount_sub_mount_cryptex", "sub_mount.m", 198, "com.apple.security.cryptex.posix", 22, 0, v92);
    goto LABEL_128;
  }
  int v167 = xpc_dictionary_dup_fd(v9, "MOUNT:INFO_FD");
  if (v167 < 0)
  {
    *(_OWORD *)long long buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100048BD8;
    pid_t v64 = xpc_connection_get_pid((xpc_connection_t)v10);
    proc_name(v64, buffer, 0x20u);
    int v65 = sub_10002BD08();

    if (v65)
    {
      int v66 = sub_10002BD08();
      os_log_type_enabled(v66, OS_LOG_TYPE_ERROR);
      if (v10) {
        pid_t v67 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v67 = -1;
      }
      LODWORD(v173[0]) = 136315906;
      *(void *)((char *)v173 + 4) = buffer;
      WORD6(v173[0]) = 1024;
      *(_DWORD *)((char *)v173 + 14) = v67;
      WORD1(v173[1]) = 2080;
      *(void *)((char *)&v173[1] + 4) = "MOUNT:INFO_FD";
      WORD6(v173[1]) = 1024;
      *(_DWORD *)((char *)&v173[1] + 14) = 22;
    }
    else
    {
      id v90 = &_os_log_default;
      if (v10) {
        pid_t v91 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v91 = -1;
      }
      LODWORD(v173[0]) = 136315906;
      *(void *)((char *)v173 + 4) = buffer;
      WORD6(v173[0]) = 1024;
      *(_DWORD *)((char *)v173 + 14) = v91;
      WORD1(v173[1]) = 2080;
      *(void *)((char *)&v173[1] + 4) = "MOUNT:INFO_FD";
      WORD6(v173[1]) = 1024;
      *(_DWORD *)((char *)&v173[1] + 14) = 22;
      int v66 = &_os_log_default;
    }
    uint64_t v92 = (char *)_os_log_send_and_compose_impl();

    CFErrorRef v93 = sub_10000BF78("mount_sub_mount_cryptex", "sub_mount.m", 206, "com.apple.security.cryptex.posix", 22, 0, v92);
    goto LABEL_128;
  }
  int v166 = xpc_dictionary_dup_fd(v9, "MOUNT:IM4M_FD");
  if (v166 < 0)
  {
    *(_OWORD *)long long buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100048BD8;
    pid_t v73 = xpc_connection_get_pid((xpc_connection_t)v10);
    proc_name(v73, buffer, 0x20u);
    unint64_t v74 = sub_10002BD08();

    if (v74)
    {
      uint64_t v75 = sub_10002BD08();
      os_log_type_enabled(v75, OS_LOG_TYPE_ERROR);
      if (v10) {
        pid_t v76 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v76 = -1;
      }
      LODWORD(v173[0]) = 136315906;
      *(void *)((char *)v173 + 4) = buffer;
      WORD6(v173[0]) = 1024;
      *(_DWORD *)((char *)v173 + 14) = v76;
      WORD1(v173[1]) = 2080;
      *(void *)((char *)&v173[1] + 4) = "MOUNT:IM4M_FD";
      WORD6(v173[1]) = 1024;
      *(_DWORD *)((char *)&v173[1] + 14) = 22;
    }
    else
    {
      id v96 = &_os_log_default;
      if (v10) {
        pid_t v97 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v97 = -1;
      }
      LODWORD(v173[0]) = 136315906;
      *(void *)((char *)v173 + 4) = buffer;
      WORD6(v173[0]) = 1024;
      *(_DWORD *)((char *)v173 + 14) = v97;
      WORD1(v173[1]) = 2080;
      *(void *)((char *)&v173[1] + 4) = "MOUNT:IM4M_FD";
      WORD6(v173[1]) = 1024;
      *(_DWORD *)((char *)&v173[1] + 14) = 22;
      uint64_t v75 = &_os_log_default;
    }
    uint64_t v92 = (char *)_os_log_send_and_compose_impl();

    CFErrorRef v93 = sub_10000BF78("mount_sub_mount_cryptex", "sub_mount.m", 214, "com.apple.security.cryptex.posix", 22, 0, v92);
LABEL_128:
    int v55 = v93;
    int v56 = v92;
LABEL_129:
    free(v56);
    id v108 = 0;
    if (!v55) {
      goto LABEL_131;
    }
    goto LABEL_130;
  }
  int v165 = xpc_dictionary_dup_fd(v9, "MOUNT:VOLHASH_FD");
  if (v165 < 0)
  {
    v173[0] = *(_OWORD *)"unknown";
    v173[1] = unk_100048BD8;
    pid_t v25 = xpc_connection_get_pid((xpc_connection_t)v10);
    proc_name(v25, v173, 0x20u);
    int v26 = *__error();
    int v27 = sub_10002BD08();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      if (v10) {
        pid_t v28 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v28 = -1;
      }
      *(_DWORD *)long long buffer = 136315650;
      *(void *)&buffer[4] = v173;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v28;
      *(_WORD *)&buffer[18] = 2080;
      *(void *)&buffer[20] = "MOUNT:VOLHASH_FD";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "XPC client <process=%s pid=%d>: No value for optional key %s", buffer, 0x1Cu);
    }

    *__error() = v26;
  }
  xpc_dictionary_get_value(v9, "MOUNT:CX1_PROPERTIES");
  id v108 = (id)objc_claimAutoreleasedReturnValue();
  if (!v108)
  {
    *(_OWORD *)long long buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100048BD8;
    pid_t v118 = xpc_connection_get_pid((xpc_connection_t)v10);
    proc_name(v118, buffer, 0x20u);
    long long v119 = sub_10002BD08();

    if (v119)
    {
      long long v120 = sub_10002BD08();
      os_log_type_enabled(v120, OS_LOG_TYPE_ERROR);
      if (v10) {
        pid_t v121 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v121 = -1;
      }
      LODWORD(v173[0]) = 136315906;
      *(void *)((char *)v173 + 4) = buffer;
      WORD6(v173[0]) = 1024;
      *(_DWORD *)((char *)v173 + 14) = v121;
      WORD1(v173[1]) = 2080;
      *(void *)((char *)&v173[1] + 4) = "MOUNT:CX1_PROPERTIES";
      WORD6(v173[1]) = 1024;
      *(_DWORD *)((char *)&v173[1] + 14) = 22;
    }
    else
    {
      id v128 = &_os_log_default;
      if (v10) {
        pid_t v129 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v129 = -1;
      }
      LODWORD(v173[0]) = 136315906;
      *(void *)((char *)v173 + 4) = buffer;
      WORD6(v173[0]) = 1024;
      *(_DWORD *)((char *)v173 + 14) = v129;
      WORD1(v173[1]) = 2080;
      *(void *)((char *)&v173[1] + 4) = "MOUNT:CX1_PROPERTIES";
      WORD6(v173[1]) = 1024;
      *(_DWORD *)((char *)&v173[1] + 14) = 22;
      long long v120 = &_os_log_default;
    }
    int v53 = (char *)_os_log_send_and_compose_impl();

    CFErrorRef v54 = sub_10000BF78("mount_sub_mount_cryptex", "sub_mount.m", 228, "com.apple.security.cryptex.posix", 22, 0, v53);
    goto LABEL_55;
  }
  int64_t int64 = xpc_dictionary_get_int64(v9, "MOUNT:DMG_ASSET_IDX_INT64");
  if (int64 != 5 && int64 != 9)
  {
    *(_OWORD *)long long buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100048BD8;
    pid_t v122 = xpc_connection_get_pid((xpc_connection_t)v10);
    proc_name(v122, buffer, 0x20u);
    int v123 = sub_10002BD08();

    if (v123)
    {
      id v124 = sub_10002BD08();
      os_log_type_enabled(v124, OS_LOG_TYPE_ERROR);
      if (v10) {
        pid_t v125 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v125 = -1;
      }
      LODWORD(v173[0]) = 136315906;
      *(void *)((char *)v173 + 4) = buffer;
      WORD6(v173[0]) = 1024;
      *(_DWORD *)((char *)v173 + 14) = v125;
      WORD1(v173[1]) = 2080;
      *(void *)((char *)&v173[1] + 4) = "MOUNT:DMG_ASSET_IDX_INT64";
      WORD6(v173[1]) = 1024;
      *(_DWORD *)((char *)&v173[1] + 14) = 22;
    }
    else
    {
      id v140 = &_os_log_default;
      if (v10) {
        pid_t v141 = xpc_connection_get_pid((xpc_connection_t)v10);
      }
      else {
        pid_t v141 = -1;
      }
      LODWORD(v173[0]) = 136315906;
      *(void *)((char *)v173 + 4) = buffer;
      WORD6(v173[0]) = 1024;
      *(_DWORD *)((char *)v173 + 14) = v141;
      WORD1(v173[1]) = 2080;
      *(void *)((char *)&v173[1] + 4) = "MOUNT:DMG_ASSET_IDX_INT64";
      WORD6(v173[1]) = 1024;
      *(_DWORD *)((char *)&v173[1] + 14) = 22;
      id v124 = &_os_log_default;
    }
    uint64_t v145 = (char *)_os_log_send_and_compose_impl();

    int v55 = sub_10000BF78("mount_sub_mount_cryptex", "sub_mount.m", 240, "com.apple.security.cryptex.posix", 22, 0, v145);
    __int16 v144 = v145;
    goto LABEL_199;
  }
  id v110 = v9;
  id v111 = v108;
  v164 = sub_100016EB4();
  memset(v173, 0, 32);
  xpc_dictionary_get_audit_token();
  *(_OWORD *)long long buffer = v173[0];
  *(_OWORD *)&buffer[16] = v173[1];
  uid_t v162 = audit_token_to_euid((audit_token_t *)buffer);
  id v108 = v111;
  long long v112 = (void *)cryptex_core_create();
  if (!v112)
  {
    int v126 = *__error();
    long long v127 = sub_10002BD08();
    if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
    {
      *(void *)long long buffer = 0xC04000100;
      _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "Failed to create cryptex core.: %{darwin.errno}d", buffer, 8u);
    }

    id v117 = 0;
    *__error() = v126;
    int v113 = 12;
    goto LABEL_167;
  }
  int v113 = cryptex_core_set_assets_from_fds();
  if (v113)
  {
    int v114 = *__error();
    long long v115 = sub_10002BD08();
    if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buffer = 67109120;
      *(_DWORD *)&buffer[4] = v113;
      _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_ERROR, "Failed to set cryptex core assets.: %{darwin.errno}d", buffer, 8u);
    }

    long long v116 = __error();
    id v117 = 0;
  }
  else
  {
    long long v130 = (void *)cryptex_core_cx1_properties_create_with_xpc_dictionary();
    if (v130)
    {
      cryptex_core_set_cryptex1_properties();
      id v117 = v112;

      int v113 = 0;
      goto LABEL_167;
    }
    int v114 = *__error();
    vfsconf v142 = sub_10002BD08();
    if (os_log_type_enabled(v142, OS_LOG_TYPE_ERROR))
    {
      *(void *)long long buffer = 67109120;
      _os_log_impl((void *)&_mh_execute_header, v142, OS_LOG_TYPE_ERROR, "Failed to parse Cryptex1 properties.: %{darwin.errno}d", buffer, 8u);
    }

    long long v116 = __error();
    id v117 = 0;
    int v113 = 0;
  }
  int *v116 = v114;
LABEL_167:

  long long v131 = v117;
  if (v113)
  {
    int v132 = *__error();
    long long v133 = sub_10002BD08();
    if (os_log_type_enabled(v133, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buffer = 67109120;
      *(_DWORD *)&buffer[4] = v113;
      _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_ERROR, "Failed to initialize cryptex core.: %{darwin.errno}d", buffer, 8u);
    }

    *__error() = v132;
  }
  else
  {
    sub_100018644(v164, v131, v162, (uint64_t)v110, (uint64_t)sub_10002C0DC);
  }

  if (!v113) {
    goto LABEL_131;
  }
  v173[0] = *(_OWORD *)"unknown";
  v173[1] = unk_100048BD8;
  pid_t v134 = xpc_connection_get_pid((xpc_connection_t)v10);
  proc_name(v134, v173, 0x20u);
  long long v135 = sub_10002BD08();

  if (v135)
  {
    long long v136 = sub_10002BD08();
    os_log_type_enabled(v136, OS_LOG_TYPE_ERROR);
    if (v10) {
      pid_t v137 = xpc_connection_get_pid((xpc_connection_t)v10);
    }
    else {
      pid_t v137 = -1;
    }
    *(_DWORD *)long long buffer = 136315650;
    *(void *)&buffer[4] = v173;
    *(_WORD *)&buffer[12] = 1024;
    *(_DWORD *)&buffer[14] = v137;
    *(_WORD *)&buffer[18] = 1024;
    *(_DWORD *)&buffer[20] = v113;
  }
  else
  {
    id v138 = &_os_log_default;
    if (v10) {
      pid_t v139 = xpc_connection_get_pid((xpc_connection_t)v10);
    }
    else {
      pid_t v139 = -1;
    }
    *(_DWORD *)long long buffer = 136315650;
    *(void *)&buffer[4] = v173;
    *(_WORD *)&buffer[12] = 1024;
    *(_DWORD *)&buffer[14] = v139;
    *(_WORD *)&buffer[18] = 1024;
    *(_DWORD *)&buffer[20] = v113;
    long long v136 = &_os_log_default;
  }
  id v143 = (char *)_os_log_send_and_compose_impl();

  int v55 = sub_10000BF78("mount_sub_mount_cryptex", "sub_mount.m", 249, "com.apple.security.cryptex.posix", v113, 0, v143);
  __int16 v144 = v143;
LABEL_199:
  free(v144);
  if (v55) {
LABEL_130:
  }
    sub_10002BD5C(v9, v55, 0, 0, 0);
LABEL_131:

  if (v165 != -1 && close(v165) == -1)
  {
    *(void *)long long buffer = 0;
    long long v174 = 0u;
    long long v175 = 0u;
    memset(v173, 0, sizeof(v173));
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v152 = *__error();
    LODWORD(v171[0]) = 67109120;
    DWORD1(v171[0]) = v152;
    _os_log_send_and_compose_impl();
    uint64_t v153 = _os_crash_msg();
    sub_100041EA0(v153);
  }
  if (v166 != -1 && close(v166) == -1)
  {
    *(void *)long long buffer = 0;
    long long v174 = 0u;
    long long v175 = 0u;
    memset(v173, 0, sizeof(v173));
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v154 = *__error();
    LODWORD(v171[0]) = 67109120;
    DWORD1(v171[0]) = v154;
    _os_log_send_and_compose_impl();
    uint64_t v155 = _os_crash_msg();
    sub_100041EA0(v155);
  }
  if (v167 != -1 && close(v167) == -1)
  {
    *(void *)long long buffer = 0;
    long long v174 = 0u;
    long long v175 = 0u;
    memset(v173, 0, sizeof(v173));
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v156 = *__error();
    LODWORD(v171[0]) = 67109120;
    DWORD1(v171[0]) = v156;
    _os_log_send_and_compose_impl();
    uint64_t v157 = _os_crash_msg();
    sub_100041EA0(v157);
  }
  if (v168 != -1 && close(v168) == -1)
  {
    *(void *)long long buffer = 0;
    long long v174 = 0u;
    long long v175 = 0u;
    memset(v173, 0, sizeof(v173));
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    int v158 = *__error();
    LODWORD(v171[0]) = 67109120;
    DWORD1(v171[0]) = v158;
    _os_log_send_and_compose_impl();
    uint64_t v159 = _os_crash_msg();
    sub_100041EA0(v159);
  }
  if (*(_DWORD *)buf != -1 && close(*(int *)buf) == -1) {
    sub_100043AE8(buffer, v173);
  }

LABEL_228:
}

void sub_10002BAEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, __int16 a14, char a15, char a16, __int16 a17, char a18, char a19, __int16 a20,unsigned int a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  free(v42);
  sub_10002C3C0(v43 - 256);
  sub_10002BF2C(&a21);
  _Unwind_Resume(a1);
}

id sub_10002BD08()
{
  if (qword_10005E888 != -1) {
    dispatch_once(&qword_10005E888, &stru_10005B040);
  }
  uint64_t v0 = (void *)qword_10005E890;

  return v0;
}

void sub_10002BD5C(void *a1, __CFError *a2, const char *a3, const char *a4, const char *a5)
{
  id v9 = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(v9);
  xpc_dictionary_get_remote_connection(v9);
  unsigned int v11 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  if (a3) {
    xpc_dictionary_set_string(reply, "MOUNT:NAME_STR", a3);
  }
  if (a4) {
    xpc_dictionary_set_string(reply, "MOUNT:VERSION_STR", a4);
  }
  if (a5) {
    xpc_dictionary_set_string(reply, "MOUNT:MOUNTPATH_STR", a5);
  }
  if (a2)
  {
    xpc_object_t v12 = sub_100040C5C(a2);
    xpc_dictionary_set_value(reply, "MOUNT:ERROR_DICT", v12);
  }
  buffer[0] = *(_OWORD *)"unknown";
  buffer[1] = unk_100048BD8;
  pid_t pid = xpc_connection_get_pid(v11);
  proc_name(pid, buffer, 0x20u);
  int v14 = *__error();
  pid_t v15 = sub_10002BD08();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    if (v11) {
      pid_t v16 = xpc_connection_get_pid(v11);
    }
    else {
      pid_t v16 = -1;
    }
    int v17 = 136315650;
    id v18 = buffer;
    __int16 v19 = 1024;
    pid_t v20 = v16;
    __int16 v21 = 2114;
    xpc_object_t v22 = reply;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "XPC client <process=%s pid=%d>: Replying to mount client: %{public}@", (uint8_t *)&v17, 0x1Cu);
  }

  *__error() = v14;
  xpc_dictionary_send_reply();
}

uint64_t sub_10002BF2C(unsigned int *a1)
{
  uint64_t result = *a1;
  if (result != -1)
  {
    uint64_t result = close(result);
    if (result == -1) {
      sub_100043C40(&v2, v3);
    }
  }
  return result;
}

uint64_t sub_10002BF98(void *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  if (sub_10002C474((uint64_t)v3, a2))
  {
    uint64_t v4 = 0;
  }
  else
  {
    buffer[0] = *(_OWORD *)"unknown";
    buffer[1] = unk_100048BD8;
    pid_t pid = xpc_connection_get_pid(v3);
    proc_name(pid, buffer, 0x20u);
    int v6 = *__error();
    uint64_t v7 = sub_10002BD08();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      if (v3) {
        pid_t v8 = xpc_connection_get_pid(v3);
      }
      else {
        pid_t v8 = -1;
      }
      int v10 = 136315906;
      unsigned int v11 = buffer;
      __int16 v12 = 1024;
      pid_t v13 = v8;
      __int16 v14 = 2080;
      uint64_t v15 = a2;
      __int16 v16 = 1024;
      int v17 = 144;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "XPC client <process=%s pid=%d>: Client lacks entitlement '%s': %{darwin.errno}d", (uint8_t *)&v10, 0x22u);
    }

    *__error() = v6;
    uint64_t v4 = 144;
  }

  return v4;
}

void sub_10002C0DC(void *a1, void *a2, __CFError *a3, void *a4)
{
  id v13 = a1;
  id v7 = a2;
  pid_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = sub_100033F08((uint64_t)v7);
    int v10 = (const char *)sub_100033ED8((uint64_t)v8);
    if (v9)
    {
      unsigned int v11 = *(const char **)v9;
      __int16 v12 = **(const char ***)(v9 + 16);
      goto LABEL_6;
    }
  }
  else
  {
    int v10 = 0;
  }
  unsigned int v11 = 0;
  __int16 v12 = 0;
LABEL_6:
  sub_10002BD5C(a4, a3, v11, v12, v10);
}

void sub_10002C188(void *a1, __CFError *a2)
{
  id v3 = a1;
  xpc_object_t reply = xpc_dictionary_create_reply(v3);
  xpc_dictionary_get_remote_connection(v3);
  uint64_t v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {
    xpc_object_t v6 = sub_100040C5C(a2);
    xpc_dictionary_set_value(reply, "UNMOUNT:ERROR_DICT", v6);
  }
  buffer[0] = *(_OWORD *)"unknown";
  buffer[1] = unk_100048BD8;
  pid_t pid = xpc_connection_get_pid(v5);
  proc_name(pid, buffer, 0x20u);
  int v8 = *__error();
  uint64_t v9 = sub_10002BD08();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    if (v5) {
      pid_t v10 = xpc_connection_get_pid(v5);
    }
    else {
      pid_t v10 = -1;
    }
    int v11 = 136315650;
    __int16 v12 = buffer;
    __int16 v13 = 1024;
    pid_t v14 = v10;
    __int16 v15 = 2114;
    xpc_object_t v16 = reply;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "XPC client <process=%s pid=%d>: Replying to unmount client: %{public}@", (uint8_t *)&v11, 0x1Cu);
  }

  *__error() = v8;
  xpc_dictionary_send_reply();
}

id sub_10002C2F4(uint64_t a1, long long *a2)
{
  long long v4 = *a2;
  *(void *)(a1 + 16) = *((void *)a2 + 2);
  *(_OWORD *)a1 = v4;
  *(void *)(a1 + 24) = *((id *)a2 + 3);
  long long v5 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v5;
  long long v7 = a2[5];
  long long v6 = a2[6];
  long long v8 = a2[4];
  *(void *)(a1 + 112) = *((void *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v7;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 64) = v8;
  *(void *)(a1 + 120) = *((id *)a2 + 15);
  *(void *)(a1 + 128) = *((id *)a2 + 16);
  id result = *((id *)a2 + 17);
  *(void *)(a1 + 136) = result;
  *(_WORD *)(a1 + 144) = *((_WORD *)a2 + 72);
  return result;
}

void sub_10002C380(uint64_t a1, uint64_t a2, __CFError *a3, void *a4)
{
  sub_10002C188(a4, a3);
}

void sub_10002C3C0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 136);
}

void sub_10002C40C(id a1)
{
  qword_10005E890 = (uint64_t)os_log_create("com.apple.libcryptex", "mount_sub");

  _objc_release_x1();
}

uint64_t sub_10002C450()
{
  return _os_log_send_and_compose_impl();
}

BOOL sub_10002C474(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)xpc_connection_copy_entitlement_value();
  if (!v3) {
    return 0;
  }
  long long v4 = v3;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_BOOL)
  {
    int v5 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315138;
      uint64_t v9 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Entitlement is not a BOOLean: %s", (uint8_t *)&v8, 0xCu);
    }
    *__error() = v5;
  }
  BOOL value = xpc_BOOL_get_value(v4);

  return value;
}

void sub_10002C568(_Unwind_Exception *exception_object)
{
}

void sub_10002C590()
{
  uint64_t v0 = sub_10000A548();
  uint64_t v116 = 0;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v87 = 0u;
  long long v86 = 0u;
  long long v85 = 0u;
  long long v84 = 0u;
  long long v83 = 0u;
  long long v82 = 0u;
  long long v81 = 0u;
  long long v80 = 0u;
  long long v79 = 0u;
  long long v78 = 0u;
  long long v77 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v72 = 0u;
  uint64_t v71 = 32;
  int v1 = xpc_pipe_receive();
  uint64_t v2 = (const char *)*((void *)v0 + 2);
  int v3 = *__error();
  long long v4 = *((void *)v0 + 4);
  if (!v1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v8 = "[anonymous]";
      if (v2) {
        int v8 = v2;
      }
      *(_DWORD *)int buf = 136446466;
      *(void *)&uint8_t buf[4] = v8;
      __int16 v65 = 2112;
      uint64_t v66 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}s: msg recv: %@", buf, 0x16u);
    }
    *__error() = v3;
    CFErrorRef v9 = sub_10003C6B4((uint64_t)&v94, 0, *((NSObject **)v0 + 4));
    CFErrorRef v6 = v9;
    if (v9)
    {
      int v10 = sub_10000C110((CFIndex)v9);
      if (v10)
      {
        int v1 = v10;
        int v11 = (const char *)*((void *)v0 + 2);
        int v3 = *__error();
        __int16 v12 = *((void *)v0 + 4);
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
          goto LABEL_7;
        }
        __int16 v13 = "[anonymous]";
        if (v11) {
          __int16 v13 = v11;
        }
        *(_DWORD *)int buf = 136446466;
        *(void *)&uint8_t buf[4] = v13;
        __int16 v65 = 1024;
        LODWORD(v66) = v1;
        pid_t v14 = "%{public}s: init msg failed: %{darwin.errno}d";
        __int16 v15 = v12;
        os_log_type_t v16 = OS_LOG_TYPE_FAULT;
        uint32_t v17 = 18;
        goto LABEL_19;
      }
    }
    sub_10002CE34((uint64_t)&v94, (uint64_t)"received ipc");
    if ((unint64_t)v95 >= 4)
    {
      id v18 = (const char *)*((void *)v0 + 2);
      int v19 = *__error();
      pid_t v20 = *((void *)v0 + 4);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        __int16 v21 = "[anonymous]";
        if (v18) {
          __int16 v21 = v18;
        }
        *(_DWORD *)int buf = 136446466;
        *(void *)&uint8_t buf[4] = v21;
        __int16 v65 = 2048;
        uint64_t v66 = v95;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "%{public}s: bad subsystem id: %llu", buf, 0x16u);
      }
      int v1 = 72;
      goto LABEL_56;
    }
    sub_10003D298(&v71, (uint64_t)&v94);
    xpc_object_t v22 = _NSGetMachExecuteHeader();
    *(void *)int buf = 0;
    uint64_t v23 = getsectdatafromheader_64(v22, "__DATA_CONST", "__subsystem", (uint64_t *)buf);
    pid_t v24 = &v23[_dyld_get_image_slide()];
    pid_t v25 = _NSGetMachExecuteHeader();
    *(void *)int buf = 0;
    int v26 = getsectdatafromheader_64(v25, "__DATA_CONST", "__subsystem", (uint64_t *)buf);
    if (v24 >= &v26[_dyld_get_image_slide() + *(void *)buf]) {
LABEL_29:
    }
      sub_100043CEC();
    while (1)
    {
      int v27 = *(void **)v24;
      if ((void)v95 == **(void **)v24) {
        break;
      }
      v24 += 8;
      pid_t v28 = _NSGetMachExecuteHeader();
      *(void *)int buf = 0;
      uint64_t v29 = getsectdatafromheader_64(v28, "__DATA_CONST", "__subsystem", (uint64_t *)buf);
      if (v24 >= &v29[_dyld_get_image_slide() + *(void *)buf]) {
        goto LABEL_29;
      }
    }
    uint64_t v30 = (const char *)*((void *)v0 + 2);
    int v31 = *__error();
    int v32 = *((void *)v0 + 4);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      pid_t v33 = "[anonymous]";
      uint64_t v34 = v27[2];
      if (v30) {
        pid_t v33 = v30;
      }
      *(_DWORD *)int buf = 136446466;
      *(void *)&uint8_t buf[4] = v33;
      __int16 v65 = 2080;
      uint64_t v66 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%{public}s: found subsystem: %s", buf, 0x16u);
    }
    *__error() = v31;
    if (v27[1] == (void)v96)
    {
      if (*((void *)&v95 + 1) >= v27[5])
      {
        int v46 = (const char *)*((void *)v0 + 2);
        int v19 = *__error();
        pid_t v60 = *((void *)v0 + 4);
        int v1 = 76;
        if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
        {
          __int16 v47 = "[anonymous]";
          if (v46) {
            __int16 v47 = v46;
          }
          uint64_t v48 = v27[2];
          *(_DWORD *)int buf = 136446978;
          *(void *)&uint8_t buf[4] = v47;
          __int16 v65 = 2080;
          uint64_t v66 = v48;
          __int16 v67 = 2048;
          uint64_t v68 = *((void *)&v95 + 1);
          __int16 v69 = 1024;
          int v70 = 76;
          pid_t v45 = "%{public}s: bad routine id: subsystem = %s, rpc = %llu: %{darwin.errno}d";
          goto LABEL_54;
        }
      }
      else
      {
        uint64_t v35 = ((uint64_t (*)(long long *))v27[3])(&v95);
        if (!v35)
        {
          int v55 = (const char *)*((void *)v0 + 2);
          int v19 = *__error();
          int v56 = *((void *)v0 + 4);
          int v1 = 71;
          if (!os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
            goto LABEL_56;
          }
          uint64_t v57 = "[anonymous]";
          uint64_t v58 = v27[2];
          if (v55) {
            uint64_t v57 = v55;
          }
          *(_DWORD *)int buf = 136446722;
          *(void *)&uint8_t buf[4] = v57;
          __int16 v65 = 2080;
          uint64_t v66 = v58;
          __int16 v67 = 1024;
          LODWORD(v68) = 71;
          pid_t v45 = "%{public}s: no target %s object found: %{darwin.errno}d";
          pid_t v49 = v56;
          uint32_t v50 = 28;
          goto LABEL_55;
        }
        int v36 = ((uint64_t (*)(uint64_t, long long *, uint64_t *))v27[4])(v35, &v94, &v71);
        int v1 = v36;
        if (v36 == 36 || v36 == 0)
        {
          pid_t v38 = (const char *)*((void *)v0 + 2);
          int v3 = *__error();
          id v39 = *((void *)v0 + 4);
          if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_7;
          }
          pid_t v40 = "[anonymous]";
          if (v38) {
            pid_t v40 = v38;
          }
          uint64_t v41 = v27[2];
          *(_DWORD *)int buf = 136446978;
          *(void *)&uint8_t buf[4] = v40;
          __int16 v65 = 2080;
          uint64_t v66 = v41;
          __int16 v67 = 2048;
          uint64_t v68 = *((void *)&v95 + 1);
          __int16 v69 = 1024;
          int v70 = v1;
          pid_t v14 = "%{public}s: %s demux: routine = %llu: %{darwin.errno}d";
          __int16 v15 = v39;
          os_log_type_t v16 = OS_LOG_TYPE_DEBUG;
          uint32_t v17 = 38;
LABEL_19:
          _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, buf, v17);
          goto LABEL_7;
        }
        int v59 = (const char *)*((void *)v0 + 2);
        int v19 = *__error();
        pid_t v60 = *((void *)v0 + 4);
        if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
        {
          int v62 = "[anonymous]";
          if (v59) {
            int v62 = v59;
          }
          uint64_t v63 = v27[2];
          *(_DWORD *)int buf = 136446978;
          *(void *)&uint8_t buf[4] = v62;
          __int16 v65 = 2080;
          uint64_t v66 = v63;
          __int16 v67 = 2048;
          uint64_t v68 = *((void *)&v95 + 1);
          __int16 v69 = 1024;
          int v70 = v1;
          pid_t v45 = "%{public}s: %s demux failed: routine = %llu: %{darwin.errno}d";
LABEL_54:
          pid_t v49 = v60;
          uint32_t v50 = 38;
LABEL_55:
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_FAULT, v45, buf, v50);
        }
      }
    }
    else
    {
      __int16 v42 = (const char *)*((void *)v0 + 2);
      int v19 = *__error();
      pid_t v60 = *((void *)v0 + 4);
      int v1 = 74;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
      {
        uint64_t v43 = "[anonymous]";
        if (v42) {
          uint64_t v43 = v42;
        }
        uint64_t v44 = v27[2];
        *(_DWORD *)int buf = 136446978;
        *(void *)&uint8_t buf[4] = v43;
        __int16 v65 = 2080;
        uint64_t v66 = v44;
        __int16 v67 = 2048;
        uint64_t v68 = v96;
        __int16 v69 = 1024;
        int v70 = 74;
        v45 = "%{public}s: bad target type: subsystem = %s, xpc_type_t type = %llu: %{darwin.errno}d";
        goto LABEL_54;
      }
    }
LABEL_56:
    *__error() = v19;
    long long v7 = sub_10000A548();
    goto LABEL_57;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
  {
    int v5 = "[anonymous]";
    if (v2) {
      int v5 = v2;
    }
    *(_DWORD *)int buf = 136446466;
    *(void *)&uint8_t buf[4] = v5;
    __int16 v65 = 1024;
    LODWORD(v66) = v1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "%{public}s: msg recv failed: %{darwin.errno}d", buf, 0x12u);
  }
  CFErrorRef v6 = 0;
LABEL_7:
  *__error() = v3;
  long long v7 = sub_10000A548();
  if (v1 == 36)
  {
LABEL_63:
    if (!v7) {
      goto LABEL_65;
    }
    goto LABEL_64;
  }
LABEL_57:
  if ((v71 & 0x10) != 0) {
    goto LABEL_63;
  }
  int v51 = (const char *)v7[2];
  int v52 = *__error();
  int v53 = v7[4];
  if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
  {
    CFErrorRef v54 = "[anonymous]";
    if (v51) {
      CFErrorRef v54 = v51;
    }
    *(_DWORD *)int buf = 136446722;
    *(void *)&uint8_t buf[4] = v54;
    __int16 v65 = 2048;
    uint64_t v66 = v95;
    __int16 v67 = 1024;
    LODWORD(v68) = v1;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_FAULT, "%{public}s: demux failed: subsystem = %llu: %{darwin.errno}d", buf, 0x1Cu);
  }
  *__error() = v52;
  sub_10003D524((uint64_t)&v94, &v71, v1);
LABEL_64:
  os_release(v7);
LABEL_65:
  sub_10003D424(&v71);
  sub_10003D424(&v94);
  os_release(v0);
  if (v6) {
    CFRelease(v6);
  }
}

void sub_10002CE34(uint64_t a1, uint64_t a2)
{
  long long v4 = sub_10000A548();
  pid_t v24 = 0;
  int v5 = 0;
  CFErrorRef v6 = 0;
  long long v7 = 0;
  if (os_log_type_enabled(*((os_log_t *)v4 + 4), OS_LOG_TYPE_DEBUG))
  {
    CFErrorRef v6 = (void *)os_flagset_copy_string();
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      if (v8 == 1)
      {
        if (asprintf(&v24, "%s", (const char *)(a1 + 40)) < 0) {
          sub_100043D08(&v25, buf);
        }
      }
      else if (v8 == 2)
      {
        pid_t v24 = (char *)os_mach_port_copy_description();
      }
      else if (asprintf(&v24, "[invalid target type: %#llx]", *(void *)(a1 + 32)) < 0)
      {
        sub_100043D08(&v25, buf);
      }
    }
    else if (asprintf(&v24, "%#llx", *(void *)(a1 + 40)) < 0)
    {
      sub_100043D08(&v25, buf);
    }
    long long v7 = xpc_copy_description(*(xpc_object_t *)(a1 + 304));
    CFErrorRef v9 = (const char *)*((void *)v4 + 2);
    int v10 = *__error();
    int v11 = *((void *)v4 + 4);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      __int16 v12 = "[anonymous]";
      uint64_t v13 = *(void *)(a1 + 16);
      uint64_t v14 = *(void *)(a1 + 24);
      if (v9) {
        __int16 v12 = v9;
      }
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = *(_DWORD *)(a1 + 328);
      int v17 = *(_DWORD *)(a1 + 332);
      int v18 = *(_DWORD *)(a1 + 336);
      int v19 = *(_DWORD *)(a1 + 340);
      int v20 = *(_DWORD *)(a1 + 344);
      int v21 = *(_DWORD *)(a1 + 348);
      int v22 = *(_DWORD *)(a1 + 352);
      int v23 = *(_DWORD *)(a1 + 356);
      *(_DWORD *)int buf = 136450306;
      int v27 = v12;
      __int16 v28 = 2080;
      uint64_t v29 = a2;
      __int16 v30 = 2048;
      uint64_t v31 = a1;
      __int16 v32 = 2080;
      pid_t v33 = v6;
      __int16 v34 = 2048;
      uint64_t v35 = v13;
      __int16 v36 = 2048;
      uint64_t v37 = v14;
      __int16 v38 = 2048;
      uint64_t v39 = v15;
      __int16 v40 = 2080;
      uint64_t v41 = v24;
      __int16 v42 = 2080;
      uint64_t v43 = v7;
      __int16 v44 = 1024;
      int v45 = v16;
      __int16 v46 = 1024;
      int v47 = v17;
      __int16 v48 = 1024;
      int v49 = v18;
      __int16 v50 = 1024;
      int v51 = v19;
      __int16 v52 = 1024;
      int v53 = v20;
      __int16 v54 = 1024;
      int v55 = v21;
      __int16 v56 = 1024;
      int v57 = v22;
      __int16 v58 = 1024;
      int v59 = v23;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s: invoke = %s [%p]\ninvoke.flags = %s\ninvoke.target.sub = %llu\ninvoke.target.routine = %llu\ninvoke.target.type = %llu\ninvoke.target = %s\ninvoke.argv = %s\ninvoke.cred.auid = %u\ninvoke.cred.euid = %u\ninvoke.cred.egid = %u\ninvoke.cred.ruid = %u\ninvoke.cred.rgid = %u\ninvoke.cred.pid_t pid = %u\ninvoke.cred.asid = %u\ninvoke.cred.pidvers = %u\n", buf,
        0x8Cu);
    }
    *__error() = v10;
    int v5 = v24;
  }
  free(v7);
  free(v5);
  free(v6);
  os_release(v4);
}

void *sub_10002D0DC(void *a1, unsigned char *a2, unsigned char *a3)
{
  int v5 = sub_10003FD2C(a1, 0x28uLL);
  v5[3] = sub_10003D350(a2);
  void v5[4] = sub_10003D350(a3);
  return v5;
}

void sub_10002D130(uint64_t *a1, int a2)
{
  uint64_t v3 = *a1;
  sub_10003D524(*(void *)(*a1 + 24), *(unsigned char **)(*a1 + 32), a2);
  sub_10003D424(*(unsigned char **)(v3 + 24));
  sub_10003D424(*(unsigned char **)(v3 + 32));
  sub_10003FE2C((void **)v3);
  *a1 = 0;
}

void sub_10002D17C(uint64_t *a1, __CFError *a2)
{
  uint64_t v3 = *a1;
  sub_10003D6EC(*(void *)(*a1 + 24), *(void *)(*a1 + 32), a2);
  sub_10003D424(*(unsigned char **)(v3 + 24));
  sub_10003D424(*(unsigned char **)(v3 + 32));
  sub_10003FE2C((void **)v3);
  *a1 = 0;
}

uint64_t sub_10002D1C8(void *a1)
{
  uint64_t result = (uint64_t)xpc_dictionary_get_string(a1, "SUBSYSTEM");
  if (result)
  {
    uint64_t v2 = (const char *)result;
    if (!strcmp((const char *)result, "CODEX"))
    {
      return 1;
    }
    else if (!strcmp(v2, "COLLATION"))
    {
      return 2;
    }
    else if (!strcmp(v2, "UPGRADE_WAIT"))
    {
      return 6;
    }
    else if (!strcmp(v2, "UPGRADE_LOCK"))
    {
      return 7;
    }
    else if (!strcmp(v2, "UPGRADE_ABORT"))
    {
      return 8;
    }
    else if (!strcmp(v2, "CRYPTEX"))
    {
      return 3;
    }
    else if (!strcmp(v2, "DAEMON"))
    {
      return 4;
    }
    else if (!strcmp(v2, "SESSION"))
    {
      return 5;
    }
    else if (!strcmp(v2, "MOUNT"))
    {
      return 9;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100043D90((uint64_t)v2);
      }
      return 0;
    }
  }
  return result;
}

void start()
{
  uint64_t v0 = (void *)off_10005E3A0;
  v0[1] = dispatch_queue_create("com.apple.security.cryptexd.main", 0);
  sub_100009BB8();
  int v1 = sub_10000A548();
  uint64_t v2 = _NSGetMachExecuteHeader();
  uint64_t size = 0;
  uint64_t v3 = getsectdatafromheader_64(v2, "__DATA_CONST", "__object_init", &size);
  long long v4 = (void (**)(void))&v3[_dyld_get_image_slide()];
  int v5 = _NSGetMachExecuteHeader();
  uint64_t size = 0;
  CFErrorRef v6 = getsectdatafromheader_64(v5, "__DATA_CONST", "__object_init", &size);
  if (v4 < (void (**)(void))&v6[_dyld_get_image_slide() + size])
  {
    do
    {
      long long v7 = *v4++;
      v7();
      uint64_t v8 = _NSGetMachExecuteHeader();
      uint64_t size = 0;
      CFErrorRef v9 = getsectdatafromheader_64(v8, "__DATA_CONST", "__object_init", &size);
    }
    while (v4 < (void (**)(void))&v9[_dyld_get_image_slide() + size]);
  }
  *v0 |= 1uLL;
  sub_10000A580((uint64_t)v1);
  dispatch_main();
}

CFErrorRef sub_10002D45C(int a1, int a2, NSObject *a3)
{
  kern_return_t v21;
  kern_return_t v22;
  uint64_t v23;
  void *v24;
  const void *v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  int v31;
  char *v32;
  _OWORD v33[3];
  uint64_t v34;
  _OWORD v35[3];
  uint64_t v36;
  _OWORD v37[3];
  uint64_t v38;
  io_connect_t connect;
  uint64_t v40;
  uint8_t buf[88];

  uint64_t v3 = a3;
  os_log_t v6 = 0;
  connect = 0;
  __int16 v38 = 0;
  memset(v37, 0, sizeof(v37));
  __int16 v36 = 0;
  memset(v35, 0, sizeof(v35));
  __int16 v34 = 0;
  memset(v33, 0, sizeof(v33));
  if (!a3)
  {
    os_log_t v6 = os_log_create("com.apple.libcryptex", "amfi");
    uint64_t v3 = v6;
  }
  CFDictionaryRef v7 = IOServiceMatching("AppleMobileFileIntegrity");
  io_service_t MatchingService = IOServiceGetMatchingService(0, v7);
  if (MatchingService)
  {
    io_service_t v9 = MatchingService;
    int v10 = sub_10003F01C(a2, v35);
    if (v10)
    {
      int v11 = v10;
      if (v3)
      {
        os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v11;
      }
      else
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v10;
      }
      int v17 = (char *)_os_log_send_and_compose_impl();
      CFIndex v18 = v11;
      int v19 = "com.apple.security.cryptex.posix";
      int v20 = 38;
LABEL_28:
      CFErrorRef v13 = sub_10000BF78("amfi_load_trust_cache", "amfi.c", v20, v19, v18, 0, v17);
      free(v17);
      uint64_t v14 = 0;
      goto LABEL_29;
    }
    int v15 = sub_10003F01C(a1, v37);
    if (v15)
    {
      int v16 = v15;
      if (v3)
      {
        os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v16;
      }
      else
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v15;
      }
      int v17 = (char *)_os_log_send_and_compose_impl();
      CFIndex v18 = v16;
      int v19 = "com.apple.security.cryptex.posix";
      int v20 = 44;
      goto LABEL_28;
    }
    int v21 = IOServiceOpen(v9, mach_task_self_, 0, &connect);
    if (v21)
    {
      int v22 = v21;
      if (v3)
      {
        os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v22;
      }
      else
      {
        *(_DWORD *)int buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v21;
      }
      int v17 = (char *)_os_log_send_and_compose_impl();
      int v19 = "com.apple.security.cryptex";
      int v20 = 50;
      CFIndex v18 = 34;
      goto LABEL_28;
    }
    int v23 = *((void *)&v35[0] + 1) + *((void *)&v37[0] + 1) + 16;
    pid_t v24 = mmap(0, v23, 3, 4098, -1, 0);
    if (v24 == (void *)-1)
    {
      uint64_t v31 = *__error();
      if (v3) {
        os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      }
      *(_DWORD *)int buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v31;
      __int16 v32 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef v13 = sub_10000BF78("amfi_load_trust_cache", "amfi.c", 66, "com.apple.security.cryptex.posix", v31, 0, v32);
      uint64_t v14 = 0;
    }
    else
    {
      uint64_t v25 = v24;
      char *v24 = *((void *)&v35[0] + 1);
      v24[1] = *((void *)&v37[0] + 1);
      sub_10003F808(v33, 0, (uint64_t)sub_10003F7A8, (uint64_t)v24, v23);
      uint64_t v14 = sub_10003F9B8((uint64_t)v33, "rw", 0x10uLL);
      fwrite(*(const void **)&v35[0], *((size_t *)&v35[0] + 1), 1uLL, v14);
      if (fcheck_np()) {
        sub_100043EFC(&v40, buf);
      }
      fwrite(*(const void **)&v37[0], *((size_t *)&v37[0] + 1), 1uLL, v14);
      if (fcheck_np()) {
        sub_100043EFC(&v40, buf);
      }
      int v26 = IOConnectCallMethod(connect, 7u, 0, 0, v25, v23, 0, 0, 0, 0);
      if (!v26)
      {
        CFErrorRef v13 = 0;
        goto LABEL_42;
      }
      int v27 = v26;
      __int16 v28 = sub_10001273C(v26);
      uint64_t v29 = v28;
      if (v3)
      {
        os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
        *(_DWORD *)int buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v27;
        *(_WORD *)&uint8_t buf[8] = 1024;
        *(_DWORD *)&buf[10] = v29;
      }
      else
      {
        *(_DWORD *)int buf = 67109376;
        *(_DWORD *)&uint8_t buf[4] = v27;
        *(_WORD *)&uint8_t buf[8] = 1024;
        *(_DWORD *)&buf[10] = v28;
      }
      __int16 v32 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef v13 = sub_10000BF78("amfi_load_trust_cache", "amfi.c", 96, "com.apple.security.cryptex.posix", v29, 0, v32);
    }
    free(v32);
LABEL_42:
    if (connect && IOServiceClose(connect)) {
      sub_100043E80(&v40, buf);
    }
    if (v9 != -1) {
      mach_right_send_release();
    }
    goto LABEL_29;
  }
  int v12 = *__error();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "could not find AppleMobileFileIntegrity", buf, 2u);
  }
  CFErrorRef v13 = 0;
  uint64_t v14 = 0;
  *__error() = v12;
LABEL_29:
  sub_10003FA64(v33);
  sub_10003FA64(v37);
  sub_10003FA64(v35);
  if (v6) {
    os_release(v6);
  }
  if (v14 && fclose(v14) == -1 && *__error()) {
    sub_100043E10(&v40, buf);
  }
  return v13;
}

double sub_10002DC34(void *a1, _OWORD *a2)
{
  *a1 = 0;
  double result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void sub_10002DC74(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 404);
  int v2 = *(_DWORD *)(a1 + 400);
  if ((v1 & 0x80000000) == 0 || (v2 & 0x80000000) == 0)
  {
    memset(v11, 0, sizeof(v11));
    int v6 = v2;
    int v7 = v1;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    LODWORD(v8) = 67109376;
    HIDWORD(v8) = v7;
    __int16 v9 = 1024;
    int v10 = v6;
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
LABEL_12:
    sub_100043F6C(&v8, v11);
  }
  if (*(_DWORD *)(a1 + 184)) {
    goto LABEL_12;
  }
  sub_10002DDE8(a1 + 208);
  free(*(void **)(a1 + 360));
  os_release(*(void **)(a1 + 392));
  os_release(*(void **)(a1 + 200));
  long long v4 = *(const void **)(a1 + 408);
  if (v4) {
    CFRelease(v4);
  }
  int v5 = *(void **)(a1 + 192);
  if (v5) {
    xpc_release(v5);
  }
  sub_10002DEC4(a1);

  sub_10003DE34(a1 + 56);
}

void sub_10002DDE8(uint64_t a1)
{
  if (a1)
  {
    int v2 = *(void **)a1;
    if (v2)
    {
      if (!*(void *)(a1 + 104)) {
        goto LABEL_7;
      }
      unint64_t v3 = 0;
      do
      {
        uint64_t v4 = a1 + 8 * v3;
        free(*(void **)(v4 + 40));
        *(void *)(v4 + 40) = 0;
        ++v3;
      }
      while (v3 < *(void *)(a1 + 104));
      int v2 = *(void **)a1;
      if (*(void *)a1)
      {
LABEL_7:
        free(v2);
        *(void *)a1 = 0;
      }
      if (*(void *)(a1 + 16))
      {
        cryptex_version_destroy();
        *(void *)(a1 + 16) = 0;
      }
      int v5 = *(void **)(a1 + 24);
      if (v5)
      {
        os_release(v5);
        *(void *)(a1 + 24) = 0;
      }
      int v6 = *(void **)(a1 + 32);
      if (v6)
      {
        free(v6);
        *(void *)(a1 + 32) = 0;
      }
      int v7 = *(void **)(a1 + 128);
      if (v7)
      {
        xpc_release(v7);
        *(void *)(a1 + 128) = 0;
      }
      uint64_t v8 = *(void **)(a1 + 136);
      if (v8)
      {
        xpc_release(v8);
        *(void *)(a1 + 136) = 0;
      }
      __int16 v9 = *(void **)(a1 + 120);
      if (v9)
      {
        xpc_release(v9);
        *(void *)(a1 + 120) = 0;
      }
    }
  }
}

void sub_10002DEC4(uint64_t a1)
{
  int v2 = *(void **)(a1 + 368);
  if (v2)
  {
    free(v2);
    *(void *)(a1 + 368) = 0;
  }
  free(*(void **)(a1 + 416));
  *(void *)(a1 + 416) = 0;
  free(*(void **)(a1 + 424));
  *(void *)(a1 + 424) = 0;
  free(*(void **)(a1 + 432));
  *(void *)(a1 + 432) = 0;
}

uint64_t sub_10002DF18(void *a1, void *a2, uint64_t a3, int a4)
{
  uint64_t v8 = sub_10000A548();
  if (os_log_type_enabled(*((os_log_t *)v8 + 4), OS_LOG_TYPE_DEBUG))
  {
    __int16 v9 = xpc_copy_description(a1);
    int v10 = (const char *)*((void *)v8 + 2);
    int v11 = *__error();
    int v12 = *((void *)v8 + 4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      CFErrorRef v13 = "[anonymous]";
      if (v10) {
        CFErrorRef v13 = v10;
      }
      *(_DWORD *)int buf = 136446466;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&unsigned char buf[12] = 2080;
      *(void *)&buf[14] = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}s: making attr from: %s", buf, 0x16u);
    }
    *__error() = v11;
    free(v9);
  }
  xpc_object_t v14 = sub_100040008((uint64_t)&off_10005B060, a1);
  if (v14)
  {
    int v15 = v14;
    xpc_object_t v16 = sub_100040008((uint64_t)&off_10005B080, a1);
    if (!v16)
    {
      uint64_t v25 = (const char *)*((void *)v8 + 2);
      int v26 = *__error();
      int v27 = *((void *)v8 + 4);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = "[anonymous]";
        *(_DWORD *)int buf = 136446978;
        if (v25) {
          __int16 v28 = v25;
        }
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = "CFBundleVersion";
        *(_WORD *)&buf[22] = 2112;
        __int16 v40 = a1;
        LOWORD(v41) = 1024;
        *(_DWORD *)((char *)&v41 + 2) = 212;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s: missing key: %s: %@: %{darwin.errno}d", buf, 0x26u);
      }
      *__error() = v26;
      uint64_t v24 = 212;
      goto LABEL_45;
    }
    int v17 = v16;
    xpc_object_t v18 = sub_100040008((uint64_t)&off_10005B0A0, a1);
    if (v18)
    {
      int v19 = sub_10000A548();
      *(void *)int buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 0x40000000;
      *(void *)&uint8_t buf[16] = sub_100033F10;
      __int16 v40 = &unk_10005B160;
      uint64_t v41 = v19;
      uint64_t v42 = a3;
      xpc_array_apply(v18, buf);
      if (v19) {
        os_release(v19);
      }
    }
    xpc_string_get_string_ptr(v15);
    if (a4)
    {
      xpc_string_get_string_ptr(v17);
      asprintf((char **)a3, "%s-v%s");
    }
    else
    {
      asprintf((char **)a3, "%s");
    }
    string_ptr = sub_100040008((uint64_t)&off_10005B0C0, a1);
    __int16 v30 = string_ptr;
    if (string_ptr) {
      string_ptr = (void *)xpc_string_get_string_ptr(string_ptr);
    }
    *(void *)(a3 + 8) = string_ptr;
    xpc_object_t v31 = sub_100040008((uint64_t)&off_10005B0E0, a1);
    __int16 v32 = v31;
    if (v31)
    {
      if (xpc_get_type(v31) != (xpc_type_t)&_xpc_type_BOOL)
      {
        pid_t v33 = (const char *)*((void *)v8 + 2);
        int v34 = *__error();
        uint64_t v35 = *((void *)v8 + 4);
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          __int16 v36 = "[anonymous]";
          *(_DWORD *)int buf = 136446978;
          if (v33) {
            __int16 v36 = v33;
          }
          *(void *)&uint8_t buf[4] = v36;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = "DeveloperModeRequired";
          *(_WORD *)&buf[22] = 2112;
          __int16 v40 = a1;
          LOWORD(v41) = 1024;
          *(_DWORD *)((char *)&v41 + 2) = 212;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}s: invalid value for key: %s: %@: %{darwin.errno}d", buf, 0x26u);
        }
        *__error() = v34;
        os_release(v8);
        uint64_t v37 = 212;
LABEL_39:
        os_release(v32);
        uint64_t v24 = v37;
LABEL_40:
        if (v18) {
          os_release(v18);
        }
        if (v30) {
          os_release(v30);
        }
        uint64_t v8 = v17;
LABEL_45:
        os_release(v8);
        goto LABEL_46;
      }
      LOBYTE(v31) = xpc_BOOL_get_value(v32);
    }
    *(unsigned char *)(a3 + 144) = (_BYTE)v31;
    *(void *)(a3 + 120) = sub_100040008((uint64_t)&off_10005B100, a1);
    *(void *)(a3 + 136) = sub_100040008((uint64_t)&off_10005B120, a1);
    *(void *)(a3 + 128) = sub_100040008((uint64_t)&off_10005B140, a1);
    xpc_string_get_string_ptr(v17);
    *(void *)(a3 + 16) = cryptex_version_new();
    *(void *)(a3 + 24) = os_retain(a1);
    if (a2) {
      *(void *)(a3 + 32) = *a2;
    }
    else {
      a2 = (void *)(a3 + 32);
    }
    *a2 = 0;
    os_release(v8);
    uint64_t v37 = 0;
    uint64_t v24 = 0;
    if (!v32) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
  int v20 = (const char *)*((void *)v8 + 2);
  int v21 = *__error();
  int v22 = *((void *)v8 + 4);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    int v23 = "[anonymous]";
    *(_DWORD *)int buf = 136446978;
    if (v20) {
      int v23 = v20;
    }
    *(void *)&uint8_t buf[4] = v23;
    *(_WORD *)&unsigned char buf[12] = 2080;
    *(void *)&buf[14] = "CFBundleIdentifier";
    *(_WORD *)&buf[22] = 2112;
    __int16 v40 = a1;
    LOWORD(v41) = 1024;
    *(_DWORD *)((char *)&v41 + 2) = 212;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%{public}s: missing key: %s: %@: %{darwin.errno}d", buf, 0x26u);
  }
  *__error() = v21;
  uint64_t v24 = 212;
  int v15 = v8;
LABEL_46:
  os_release(v15);
  return v24;
}

uint64_t sub_10002E440(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000A548();
  int v5 = *(void **)(a1 + 24);
  if (!v5) {
    sub_100043FF4(&v41, buf);
  }
  xpc_object_t array = xpc_dictionary_get_array(v5, "Dependencies");
  size_t count = xpc_array_get_count(array);
  if (count > 8)
  {
    uint64_t v8 = 59;
    if (!v4) {
      return v8;
    }
    goto LABEL_47;
  }
  size_t v9 = count;
  int v10 = sub_10000A548();
  if (!array) {
    sub_100044074(&v41, buf);
  }
  int v11 = v10;
  xpc_type_t type = xpc_get_type(array);
  if (type != (const _xpc_type_s *)&_xpc_type_array) {
    sub_1000441A0(&v41, buf, type);
  }
  size_t v13 = xpc_array_get_count(array);
  if (v13)
  {
    size_t v14 = v13;
    uint64_t v39 = v4;
    __int16 v40 = v11;
    for (size_t i = 0; i != v14; ++i)
    {
      xpc_object_t dictionary = xpc_array_get_dictionary(array, i);
      if (!dictionary)
      {
        int v11 = v40;
        uint64_t v25 = (const char *)*((void *)v40 + 2);
        int v26 = *__error();
        int v27 = *((void *)v40 + 4);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          __int16 v28 = "[anonymous]";
          if (v25) {
            __int16 v28 = v25;
          }
          *(_DWORD *)int buf = 136446466;
          uint64_t v43 = v28;
          __int16 v44 = 2048;
          size_t v45 = i;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s: unable to parse dependency dictionary for element %lu in dependencies array from c411", buf, 0x16u);
        }
        uint64_t v4 = v39;
        goto LABEL_36;
      }
      int v17 = dictionary;
      string = xpc_dictionary_get_string(dictionary, "CFBundleIdentifier");
      int v19 = xpc_dictionary_get_string(v17, "CFBundleVersion");
      if (!string)
      {
        uint64_t v8 = 22;
        goto LABEL_27;
      }
      int v20 = v19;
      if (!sub_100021740(a2, (uint64_t)string, (uint64_t)v19))
      {
        uint64_t v29 = (const char *)*((void *)v40 + 2);
        int v26 = *__error();
        __int16 v30 = *((void *)v40 + 4);
        uint64_t v4 = v39;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          xpc_object_t v31 = "[anonymous]";
          if (v29) {
            xpc_object_t v31 = v29;
          }
          __int16 v32 = "unspecified";
          *(_DWORD *)int buf = 136446722;
          uint64_t v43 = v31;
          __int16 v44 = 2080;
          size_t v45 = (size_t)string;
          if (v20) {
            __int16 v32 = v20;
          }
          __int16 v46 = 2080;
          int v47 = v32;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}s: unable to satisfy dependency with bundleID : %s (min version : %s)", buf, 0x20u);
        }
        int v11 = v40;
LABEL_36:
        *__error() = v26;
        uint64_t v8 = 22;
        goto LABEL_37;
      }
    }
    uint64_t v8 = 0;
LABEL_27:
    uint64_t v4 = v39;
    int v11 = v40;
    if (v40) {
      goto LABEL_37;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if (v11)
    {
LABEL_37:
      os_release(v11);
      if (v8) {
        goto LABEL_16;
      }
      goto LABEL_38;
    }
  }
  if (v8)
  {
LABEL_16:
    int v21 = (const char *)v4[2];
    int v22 = *__error();
    int v23 = v4[4];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = "[anonymous]";
      if (v21) {
        uint64_t v24 = v21;
      }
      *(_DWORD *)int buf = 136446466;
      uint64_t v43 = v24;
      __int16 v44 = 1024;
      LODWORD(v45) = v8;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}s: quire_evaluate_dependencies() failed: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v22;
LABEL_47:
    os_release(v4);
    return v8;
  }
LABEL_38:
  if (v9)
  {
    for (size_t j = 0; j != v9; ++j)
    {
      xpc_object_t v34 = xpc_array_get_dictionary(array, j);
      if (!v34) {
        sub_1000440FC();
      }
      uint64_t v35 = xpc_dictionary_get_string(v34, "CFBundleIdentifier");
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          __int16 v36 = strdup(v35);
          if (v36) {
            break;
          }
          __os_temporary_resource_shortage();
        }
      }
      else
      {
        __int16 v36 = strdup(v35);
        if (!v36) {
          sub_100044118();
        }
      }
      uint64_t v37 = *(void *)(a1 + 104);
      *(void *)(a1 + 8 * v37 + 40) = v36;
      *(void *)(a1 + 104) = v37 + 1;
    }
  }
  uint64_t v8 = 0;
  if (v4) {
    goto LABEL_47;
  }
  return v8;
}

uint64_t sub_10002E820(uint64_t result)
{
  *(unsigned char *)(result + 145) = 1;
  return result;
}

uint64_t sub_10002E82C(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (void *)(a3 + 16);
  uint64_t v9 = sub_100013124();
  *(void *)(v9 + 176) = a4;
  long long v10 = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v9 + 208) = *(_OWORD *)a3;
  *(_OWORD *)(v9 + 224) = v10;
  long long v11 = *(_OWORD *)(a3 + 80);
  long long v13 = *(_OWORD *)(a3 + 32);
  long long v12 = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v9 + 272) = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(v9 + 288) = v11;
  *(_OWORD *)(v9 + 240) = v13;
  *(_OWORD *)(v9 + 256) = v12;
  long long v15 = *(_OWORD *)(a3 + 112);
  long long v14 = *(_OWORD *)(a3 + 128);
  long long v16 = *(_OWORD *)(a3 + 96);
  *(void *)(v9 + 352) = *(void *)(a3 + 144);
  *(_OWORD *)(v9 + 320) = v15;
  *(_OWORD *)(v9 + 336) = v14;
  *(_OWORD *)(v9 + 304) = v16;
  *(void *)(v9 + 392) = os_retain(a1);
  int v17 = os_retain(a2);
  *(void *)(v9 + 400) = -1;
  *(_DWORD *)(v9 + 188) = 0;
  *(void *)(v9 + 192) = 0;
  *(void *)(v9 + 200) = v17;
  *(void *)(v9 + 360) = cryptex_core_unparse_hdiid();
  *(void *)(v9 + 384) = v9 + 376;
  xpc_object_t v18 = (void *)(v9 + 472);
  *(_OWORD *)(v9 + 368) = 0u;
  *(_OWORD *)(v9 + 472) = 0u;
  if (*(void *)(a3 + 104))
  {
    unint64_t v19 = 0;
    do
    {
      int v20 = sub_100019E3C((uint64_t)a1, *(char **)(a3 + 40 + 8 * v19), 0);
      if (!v20) {
        sub_100044238();
      }
      int v21 = v20;
      int v22 = malloc_type_malloc(0x10uLL, 0x18EC0261uLL);
      if (!v22) {
        sub_100044254();
      }
      int v23 = v22;
      void *v22 = v21;
      os_retain(v21);
      v23[1] = *v18;
      void *v18 = v23;
      uint64_t v24 = malloc_type_malloc(0x10uLL, 0x18EC0261uLL);
      if (!v24) {
        sub_100044254();
      }
      uint64_t v25 = v24;
      void *v24 = v9;
      os_retain((void *)v9);
      v25[1] = v21[60];
      v21[60] = v25;
      os_release(v21);
      ++v19;
    }
    while (v19 < *(void *)(a3 + 104));
  }
  *(void *)a3 = 0;
  *uint64_t v8 = 0;
  v8[1] = 0;
  sub_10003DB40(v9 + 56, (int)"com.apple.security.cryptexd", "quire");
  sub_10003DCF0(v9 + 56, *(const char **)(v9 + 208));
  cryptex_init();
  sub_10003C26C(v9 + 80, *(char **)(v9 + 208));
  sub_10003C26C(v9 + 112, *(char **)(v9 + 208));
  sub_10003C26C(v9 + 144, *(char **)(v9 + 208));
  return v9;
}

void *sub_10002EA94(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  double result = sub_10003FD2C((void *)a1, 0x50uLL);
  *((_DWORD *)result + 11) = a2;
  result[7] = a3;
  result[8] = a4;
  if (*(_DWORD *)(a1 + 184))
  {
    result[3] = 0;
    **(void **)(a1 + 384) = result;
    *(void *)(a1 + 384) = result + 3;
  }
  else
  {
    return (void *)cryptex_async_f();
  }
  return result;
}

uint64_t sub_10002EB2C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  int v3 = *((_DWORD *)a1 + 11);
  int v127 = -1;
  uint64_t v4 = *(const char **)(v2 + 240);
  if (!v4)
  {
    long long v144 = 0u;
    memset(v145, 0, sizeof(v145));
    long long v142 = 0u;
    long long v143 = 0u;
    long long v140 = 0u;
    long long v141 = 0u;
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    *(_OWORD *)__str = 0u;
    if ((*(_DWORD *)(v2 + 400) & 0x80000000) == 0)
    {
      if (*(void *)(v2 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
        uint64_t v9 = *(const char **)(v2 + 56);
        if (!v9) {
          uint64_t v9 = "[anonymous]";
        }
      }
      else
      {
        uint64_t v9 = *(const char **)(v2 + 56);
        if (!v9) {
          uint64_t v9 = "[anonymous]";
        }
      }
      v152.st_dev = 136446466;
      *(void *)&v152.st_mode = v9;
      WORD2(v152.st_ino) = 1024;
      *(_DWORD *)((char *)&v152.st_ino + 6) = 37;
      int v23 = (char *)_os_log_send_and_compose_impl();
      uint64_t v24 = "com.apple.security.cryptex.posix";
      int v25 = 576;
      CFIndex v26 = 37;
      goto LABEL_40;
    }
    if (*(void *)(v2 + 216))
    {
      long long v14 = *(const char **)(v2 + 56);
      int v15 = *__error();
      long long v16 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = "[anonymous]";
        __darwin_ino64_t v18 = *(void *)(v2 + 216);
        if (v14) {
          int v17 = v14;
        }
        v152.st_dev = 136446466;
        *(void *)&v152.st_mode = v17;
        WORD2(v152.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&v152.st_ino + 6) = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}s: custom mount path %s", (uint8_t *)&v152, 0x16u);
      }
      *__error() = v15;
      if (**(unsigned char **)(v2 + 216) != 47)
      {
        if (*(void *)(v2 + 72))
        {
          os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
          __int16 v56 = *(const char **)(v2 + 56);
          if (!v56) {
            __int16 v56 = "[anonymous]";
          }
        }
        else
        {
          __int16 v56 = *(const char **)(v2 + 56);
          if (!v56) {
            __int16 v56 = "[anonymous]";
          }
        }
        v152.st_dev = 136446466;
        *(void *)&v152.st_mode = v56;
        WORD2(v152.st_ino) = 1024;
        *(_DWORD *)((char *)&v152.st_ino + 6) = 22;
        int v23 = (char *)_os_log_send_and_compose_impl();
        uint64_t v24 = "com.apple.security.cryptex.posix";
        int v25 = 586;
        CFIndex v26 = 22;
        goto LABEL_40;
      }
      snprintf(__str, 0xFFuLL, "%s", *(const char **)(v2 + 216));
      int v19 = sub_10003EEC4(__str, 0x1FFu, &v127);
      if (v19)
      {
        int v20 = v19;
        if (*(void *)(v2 + 72))
        {
          os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
          int v21 = *(const char **)(v2 + 56);
          if (!v21) {
            int v21 = "[anonymous]";
          }
          v152.st_dev = 136446466;
          *(void *)&v152.st_mode = v21;
          WORD2(v152.st_ino) = 1024;
          *(_DWORD *)((char *)&v152.st_ino + 6) = v20;
        }
        else
        {
          long long v79 = *(const char **)(v2 + 56);
          if (!v79) {
            long long v79 = "[anonymous]";
          }
          v152.st_dev = 136446466;
          *(void *)&v152.st_mode = v79;
          WORD2(v152.st_ino) = 1024;
          *(_DWORD *)((char *)&v152.st_ino + 6) = v19;
        }
        int v23 = (char *)_os_log_send_and_compose_impl();
        CFIndex v26 = v20;
        uint64_t v24 = "com.apple.security.cryptex.posix";
        int v25 = 592;
        goto LABEL_40;
      }
      if (*(unsigned char *)(v2 + 353))
      {
        uint64_t v60 = 0;
        char v61 = 1;
        while (1)
        {
          char v62 = v61;
          if (sub_10000FD40((uint64_t)off_10005B180[v60], *(void *)(v2 + 216))) {
            break;
          }
          char v61 = 0;
          uint64_t v60 = 1;
          if ((v62 & 1) == 0)
          {
            if (*(void *)(v2 + 72))
            {
              os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
              uint64_t v63 = *(const char **)(v2 + 56);
              __darwin_ino64_t v64 = *(void *)(v2 + 216);
              if (!v63) {
                uint64_t v63 = "[anonymous]";
              }
              v152.st_dev = 136446466;
              *(void *)&v152.st_mode = v63;
              WORD2(v152.st_ino) = 2082;
              *(__darwin_ino64_t *)((char *)&v152.st_ino + 6) = v64;
            }
            else
            {
              long long v107 = *(const char **)(v2 + 56);
              if (!v107) {
                long long v107 = "[anonymous]";
              }
              __darwin_ino64_t v108 = *(void *)(v2 + 216);
              v152.st_dev = 136446466;
              *(void *)&v152.st_mode = v107;
              WORD2(v152.st_ino) = 2082;
              *(__darwin_ino64_t *)((char *)&v152.st_ino + 6) = v108;
            }
            int v23 = (char *)_os_log_send_and_compose_impl();
            uint64_t v24 = "com.apple.security.cryptex";
            int v25 = 606;
            CFIndex v26 = 2;
            goto LABEL_40;
          }
        }
      }
    }
    else
    {
      snprintf(__str, 0xFFuLL, "%s.XXXXXX", *(const char **)(v2 + 208));
      int v51 = sub_10003EE68(v3, __str, &v127);
      if (v51)
      {
        int v52 = v51;
        if (*(void *)(v2 + 72))
        {
          os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
          int v53 = *(const char **)(v2 + 56);
          if (!v53) {
            int v53 = "[anonymous]";
          }
          v152.st_dev = 136446466;
          *(void *)&v152.st_mode = v53;
          WORD2(v152.st_ino) = 1024;
          *(_DWORD *)((char *)&v152.st_ino + 6) = v52;
        }
        else
        {
          long long v78 = *(const char **)(v2 + 56);
          if (!v78) {
            long long v78 = "[anonymous]";
          }
          v152.st_dev = 136446466;
          *(void *)&v152.st_mode = v78;
          WORD2(v152.st_ino) = 1024;
          *(_DWORD *)((char *)&v152.st_ino + 6) = v51;
        }
        int v23 = (char *)_os_log_send_and_compose_impl();
        CFIndex v26 = v52;
        uint64_t v24 = "com.apple.security.cryptex.posix";
        int v25 = 614;
        goto LABEL_40;
      }
    }
    int v129 = -1;
    bzero(&v152.st_uid, 0x828uLL);
    v152.st_ino = *(void *)(v2 + 360);
    *(_DWORD *)&v152.st_mode = -1;
    int v154 = -1;
    int v156 = -1;
    bzero(__s1, 0x400uLL);
    int v128 = -1;
    v152.st_dev = *(_DWORD *)(cryptex_core_get_image_asset() + 16);
    if (cryptex_asset_type_is_cryptex1())
    {
      uint64_t asset = cryptex_core_get_asset();
      if (!asset)
      {
        if (*(void *)(v2 + 72))
        {
          os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
          long long v95 = *(const char **)(v2 + 56);
          if (!v95) {
            long long v95 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446210;
          uint64_t v159 = v95;
        }
        else
        {
          long long v99 = *(const char **)(v2 + 56);
          if (!v99) {
            long long v99 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446210;
          uint64_t v159 = v99;
        }
        long long v91 = (char *)_os_log_send_and_compose_impl();
        long long v93 = "com.apple.security.cryptex";
        int v94 = 212;
        CFIndex v92 = 15;
        goto LABEL_186;
      }
      uint64_t v66 = asset;
      uint64_t v67 = cryptex_core_get_asset();
      if (v67 && (uint64_t v68 = v67, cryptex_asset_len() >= 1))
      {
        __int16 v69 = *(const char **)(v2 + 56);
        int v70 = *__error();
        uint64_t v71 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
        {
          long long v72 = "[anonymous]";
          if (v69) {
            long long v72 = v69;
          }
          *(_DWORD *)int buf = 136446210;
          uint64_t v159 = v72;
          _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "%{public}s: AuthAPFS enabled.", buf, 0xCu);
        }
        *__error() = v70;
        v153[1032] = 1;
        int v154 = *(_DWORD *)(v66 + 16);
        int v155 = *(_DWORD *)(*(void *)(v66 + 8) + 32);
        int v156 = *(_DWORD *)(v68 + 16);
        int v157 = 4;
        uint64_t v73 = *(void *)(*(void *)(v2 + 200) + 168);
        if (v73 && (*(unsigned char *)(v73 + 40) & 1) != 0)
        {
          long long v74 = *(const char **)(v2 + 56);
          int v75 = *__error();
          long long v76 = *(NSObject **)(v2 + 72);
          if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
          {
            long long v77 = "[anonymous]";
            if (v74) {
              long long v77 = v74;
            }
            *(_DWORD *)int buf = 136446210;
            uint64_t v159 = v77;
            _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_INFO, "%{public}s: AuthAPFS using supplemental auth environment.", buf, 0xCu);
          }
          *__error() = v75;
          int v157 = 5;
        }
      }
      else
      {
        long long v80 = *(const char **)(v2 + 56);
        int v81 = *__error();
        long long v82 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          long long v83 = "[anonymous]";
          if (v80) {
            long long v83 = v80;
          }
          *(_DWORD *)int buf = 136446210;
          uint64_t v159 = v83;
          _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_INFO, "%{public}s: AuthAPFS disabled because quire lacks an im4m.", buf, 0xCu);
        }
        *__error() = v81;
      }
    }
    int v84 = realpath_np();
    if (v84)
    {
      int v85 = v84;
      if (*(void *)(v2 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
        long long v86 = *(const char **)(v2 + 56);
        if (!v86) {
          long long v86 = "[anonymous]";
        }
        *(_DWORD *)int buf = 136446466;
        uint64_t v159 = v86;
        __int16 v160 = 1024;
        LODWORD(v161) = v85;
      }
      else
      {
        long long v90 = *(const char **)(v2 + 56);
        if (!v90) {
          long long v90 = "[anonymous]";
        }
        *(_DWORD *)int buf = 136446466;
        uint64_t v159 = v90;
        __int16 v160 = 1024;
        LODWORD(v161) = v84;
      }
      long long v91 = (char *)_os_log_send_and_compose_impl();
      CFIndex v92 = v85;
      long long v93 = "com.apple.security.cryptex.posix";
      int v94 = 238;
    }
    else
    {
      int v87 = sub_1000277D0(&v127, 0, (uint64_t)&v152);
      if (!v87)
      {
        int v96 = sub_10003DE70(&v152.st_mode);
        int v128 = v96;
        int v129 = open(__s1, 1048832);
        if ((v129 & 0x80000000) == 0)
        {
          *(_DWORD *)(v2 + 404) = sub_10003DE70(&v128);
          *(_DWORD *)(v2 + 400) = sub_10003DE70(&v129);
          if (_dispatch_is_multithreaded())
          {
            while (1)
            {
              long long v97 = strdup(__s1);
              if (v97) {
                break;
              }
              __os_temporary_resource_shortage();
            }
          }
          else
          {
            long long v97 = strdup(__s1);
            if (!v97) {
              sub_100044118();
            }
          }
          *(void *)(v2 + 416) = v97;
          if (_dispatch_is_multithreaded())
          {
            while (1)
            {
              long long v112 = strdup(v153);
              if (v112) {
                break;
              }
              __os_temporary_resource_shortage();
            }
          }
          else
          {
            long long v112 = strdup(v153);
            if (!v112) {
              sub_100044118();
            }
          }
          *(void *)(v2 + 432) = v112;
          if (_dispatch_is_multithreaded())
          {
            long long v113 = strdup((const char *)&v152.st_rdev);
            if (!v113)
            {
              do
              {
                __os_temporary_resource_shortage();
                long long v114 = strdup((const char *)&v152.st_rdev);
              }
              while (!v114);
              long long v113 = v114;
            }
          }
          else
          {
            long long v113 = strdup((const char *)&v152.st_rdev);
            if (!v113) {
              sub_100044118();
            }
          }
          CFErrorRef v32 = 0;
          CFTypeRef v100 = 0;
          *(void *)(v2 + 424) = v113;
          int v96 = v128;
          goto LABEL_190;
        }
        int v109 = *__error();
        if (*(void *)(v2 + 72))
        {
          os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
          long long v110 = *(const char **)(v2 + 56);
          *(_DWORD *)int buf = 136446722;
          if (v110) {
            long long v111 = v110;
          }
          else {
            long long v111 = "[anonymous]";
          }
          uint64_t v159 = v111;
          __int16 v160 = 2080;
          id v161 = __s1;
          __int16 v162 = 1024;
          int v163 = v109;
        }
        else
        {
          long long v115 = "[anonymous]";
          if (*(void *)(v2 + 56)) {
            long long v115 = *(const char **)(v2 + 56);
          }
          *(_DWORD *)int buf = 136446722;
          uint64_t v159 = v115;
          __int16 v160 = 2080;
          id v161 = __s1;
          __int16 v162 = 1024;
          int v163 = v109;
        }
        uint64_t v116 = (char *)_os_log_send_and_compose_impl();
        CFErrorRef v32 = sub_10000BF78("_quire_mount_hdi", "quire.c", 255, "com.apple.security.cryptex.posix", v109, 0, v116);
        free(v116);
        int v117 = unmount(__s1, 0x80000);
        if (v117)
        {
          int v118 = v117;
          long long v119 = *(const char **)(v2 + 56);
          int v126 = *__error();
          long long v120 = *(NSObject **)(v2 + 72);
          if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
          {
            pid_t v121 = "[anonymous]";
            *(_DWORD *)int buf = 136446722;
            if (v119) {
              pid_t v121 = v119;
            }
            uint64_t v159 = v121;
            __int16 v160 = 2080;
            id v161 = __s1;
            __int16 v162 = 1024;
            int v163 = v118;
            _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_ERROR, "%{public}s: failed to clean up mount point: %s: %{darwin.errno}d", buf, 0x1Cu);
          }
          *__error() = v126;
        }
        if ((v96 & 0x80000000) == 0 && ioctl(v96, 0x20006415uLL, 0, 28))
        {
          pid_t v122 = *(const char **)(v2 + 56);
          int v123 = *__error();
          id v124 = *(NSObject **)(v2 + 72);
          if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
          {
            if (!v122) {
              pid_t v122 = "[anonymous]";
            }
            int v125 = *__error();
            *(_DWORD *)int buf = 136446722;
            uint64_t v159 = v122;
            __int16 v160 = 2080;
            id v161 = v153;
            __int16 v162 = 1024;
            int v163 = v125;
            _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_ERROR, "%{public}s: failed to clean up device: %s: %{darwin.errno}d", buf, 0x1Cu);
          }
          *__error() = v123;
        }
LABEL_187:
        if (v32) {
          CFTypeRef v100 = CFRetain(v32);
        }
        else {
          CFTypeRef v100 = 0;
        }
LABEL_190:
        *(void *)(v2 + 408) = v100;
        if (v96 != -1 && close(v96) == -1) {
          sub_100043820(&v130, buf);
        }
        if (v129 != -1 && close(v129) == -1) {
          sub_100043820(__s1, &v152);
        }
        if (v32)
        {
          if (*(void *)(v2 + 72))
          {
            os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
            long long v101 = *(const char **)(v2 + 56);
            if (!v101) {
              long long v101 = "[anonymous]";
            }
            v152.st_dev = 136446210;
            *(void *)&v152.st_mode = v101;
          }
          else
          {
            long long v105 = *(const char **)(v2 + 56);
            if (!v105) {
              long long v105 = "[anonymous]";
            }
            v152.st_dev = 136446210;
            *(void *)&v152.st_mode = v105;
          }
          __int16 v44 = (char *)_os_log_send_and_compose_impl();
          int v45 = 621;
          goto LABEL_78;
        }
        int v102 = sub_1000215D0((void *)v2);
        if (!v102)
        {
          CFErrorRef v27 = 0;
          goto LABEL_41;
        }
        int v103 = v102;
        if (*(void *)(v2 + 72))
        {
          os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
          long long v104 = *(const char **)(v2 + 56);
          if (!v104) {
            long long v104 = "[anonymous]";
          }
          v152.st_dev = 136446466;
          *(void *)&v152.st_mode = v104;
          WORD2(v152.st_ino) = 1024;
          *(_DWORD *)((char *)&v152.st_ino + 6) = v103;
        }
        else
        {
          long long v106 = *(const char **)(v2 + 56);
          if (!v106) {
            long long v106 = "[anonymous]";
          }
          v152.st_dev = 136446466;
          *(void *)&v152.st_mode = v106;
          WORD2(v152.st_ino) = 1024;
          *(_DWORD *)((char *)&v152.st_ino + 6) = v102;
        }
        int v23 = (char *)_os_log_send_and_compose_impl();
        CFIndex v26 = v103;
        uint64_t v24 = "com.apple.security.cryptex.posix";
        int v25 = 627;
LABEL_40:
        CFErrorRef v27 = sub_10000BF78("_quire_mount_continue", "quire.c", v25, v24, v26, 0, v23);
        free(v23);
LABEL_41:
        a1[2] = (uint64_t)v27;
        goto LABEL_85;
      }
      int v88 = v87;
      if (*(void *)(v2 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
        long long v89 = *(const char **)(v2 + 56);
        if (!v89) {
          long long v89 = "[anonymous]";
        }
        *(_DWORD *)int buf = 136446466;
        uint64_t v159 = v89;
        __int16 v160 = 1024;
        LODWORD(v161) = v88;
      }
      else
      {
        long long v98 = *(const char **)(v2 + 56);
        if (!v98) {
          long long v98 = "[anonymous]";
        }
        *(_DWORD *)int buf = 136446466;
        uint64_t v159 = v98;
        __int16 v160 = 1024;
        LODWORD(v161) = v87;
      }
      long long v91 = (char *)_os_log_send_and_compose_impl();
      CFIndex v92 = v88;
      long long v93 = "com.apple.security.cryptex.posix";
      int v94 = 244;
    }
LABEL_186:
    CFErrorRef v32 = sub_10000BF78("_quire_mount_hdi", "quire.c", v94, v93, v92, 0, v91);
    free(v91);
    int v96 = -1;
    goto LABEL_187;
  }
  LODWORD(v130) = -1;
  memset(&v152, 0, sizeof(v152));
  *(_DWORD *)int buf = open(v4 + 2311, 1048832);
  if ((*(_DWORD *)buf & 0x80000000) != 0)
  {
    int v10 = *__error();
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      long long v11 = *(const char **)(v2 + 56);
      *(_DWORD *)__s1 = 136446722;
      if (!v11) {
        long long v11 = "[anonymous]";
      }
      v147 = v11;
      __int16 v148 = 2080;
      pid_t v149 = v4 + 2311;
      __int16 v150 = 1024;
      int v151 = v10;
    }
    else
    {
      __int16 v28 = *(const char **)(v2 + 56);
      if (!v28) {
        __int16 v28 = "[anonymous]";
      }
      *(_DWORD *)__s1 = 136446722;
      v147 = v28;
      __int16 v148 = 2080;
      pid_t v149 = v4 + 2311;
      __int16 v150 = 1024;
      int v151 = v10;
    }
    uint64_t v29 = (char *)_os_log_send_and_compose_impl();
    int v30 = 134;
    CFIndex v31 = v10;
  }
  else
  {
    int v5 = open(v4 + 263, 256);
    LODWORD(v130) = v5;
    if (v5 < 0)
    {
      int v12 = *__error();
      CFIndex v7 = v12;
      if (*(void *)(v2 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
        long long v13 = *(const char **)(v2 + 56);
        *(_DWORD *)__s1 = 136446722;
        if (!v13) {
          long long v13 = "[anonymous]";
        }
        v147 = v13;
        __int16 v148 = 2080;
        pid_t v149 = v4 + 263;
        __int16 v150 = 1024;
        int v151 = v12;
      }
      else
      {
        uint64_t v37 = *(const char **)(v2 + 56);
        if (!v37) {
          uint64_t v37 = "[anonymous]";
        }
        *(_DWORD *)__s1 = 136446722;
        v147 = v37;
        __int16 v148 = 2080;
        pid_t v149 = v4 + 263;
        __int16 v150 = 1024;
        int v151 = v12;
      }
      uint64_t v35 = (char *)_os_log_send_and_compose_impl();
      int v36 = 141;
      goto LABEL_55;
    }
    if (fstat(v5, &v152))
    {
      int v6 = *__error();
      CFIndex v7 = v6;
      if (*(void *)(v2 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
        uint64_t v8 = *(const char **)(v2 + 56);
        *(_DWORD *)__s1 = 136446722;
        if (!v8) {
          uint64_t v8 = "[anonymous]";
        }
        v147 = v8;
        __int16 v148 = 2080;
        pid_t v149 = v4 + 263;
        __int16 v150 = 1024;
        int v151 = v6;
      }
      else
      {
        xpc_object_t v34 = *(const char **)(v2 + 56);
        if (!v34) {
          xpc_object_t v34 = "[anonymous]";
        }
        *(_DWORD *)__s1 = 136446722;
        v147 = v34;
        __int16 v148 = 2080;
        pid_t v149 = v4 + 263;
        __int16 v150 = 1024;
        int v151 = v6;
      }
      uint64_t v35 = (char *)_os_log_send_and_compose_impl();
      int v36 = 148;
LABEL_55:
      CFErrorRef v32 = sub_10000BF78("_quire_mount_forerunner", "quire.c", v36, "com.apple.security.cryptex.posix", v7, 0, v35);
      pid_t v33 = v35;
      goto LABEL_56;
    }
    if ((v152.st_mode & 0xF000) == 0x6000)
    {
      *(_DWORD *)(v2 + 404) = sub_10003DE70(&v130);
      *(_DWORD *)(v2 + 400) = sub_10003DE70(buf);
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          int v22 = strdup(v4 + 2311);
          if (v22) {
            break;
          }
          __os_temporary_resource_shortage();
        }
      }
      else
      {
        int v22 = strdup(v4 + 2311);
        if (!v22) {
          sub_100044118();
        }
      }
      *(void *)(v2 + 416) = v22;
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          int v57 = strdup(v4 + 1287);
          if (v57) {
            break;
          }
          __os_temporary_resource_shortage();
        }
      }
      else
      {
        int v57 = strdup(v4 + 1287);
        if (!v57) {
          sub_100044118();
        }
      }
      *(void *)(v2 + 432) = v57;
      if (_dispatch_is_multithreaded())
      {
        while (1)
        {
          __int16 v58 = strdup(v4 + 263);
          if (v58) {
            break;
          }
          __os_temporary_resource_shortage();
        }
      }
      else
      {
        __int16 v58 = strdup(v4 + 263);
        if (!v58) {
          sub_100044118();
        }
      }
      CFErrorRef v32 = 0;
      *(void *)(v2 + 424) = v58;
      *(void *)(v2 + 176) |= 1uLL;
      goto LABEL_57;
    }
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      __int16 v54 = *(const char **)(v2 + 56);
      *(_DWORD *)__s1 = 136446722;
      if (v54) {
        int v55 = v54;
      }
      else {
        int v55 = "[anonymous]";
      }
      v147 = v55;
      __int16 v148 = 2080;
      pid_t v149 = v4 + 263;
      __int16 v150 = 1024;
      int v151 = 19;
    }
    else
    {
      int v59 = "[anonymous]";
      if (*(void *)(v2 + 56)) {
        int v59 = *(const char **)(v2 + 56);
      }
      *(_DWORD *)__s1 = 136446722;
      v147 = v59;
      __int16 v148 = 2080;
      pid_t v149 = v4 + 263;
      __int16 v150 = 1024;
      int v151 = 19;
    }
    uint64_t v29 = (char *)_os_log_send_and_compose_impl();
    int v30 = 155;
    CFIndex v31 = 19;
  }
  CFErrorRef v32 = sub_10000BF78("_quire_mount_forerunner", "quire.c", v30, "com.apple.security.cryptex.posix", v31, 0, v29);
  pid_t v33 = v29;
LABEL_56:
  free(v33);
LABEL_57:
  free(*(void **)(v2 + 240));
  *(void *)(v2 + 240) = 0;
  if (v32) {
    CFTypeRef v38 = CFRetain(v32);
  }
  else {
    CFTypeRef v38 = 0;
  }
  *(void *)(v2 + 408) = v38;
  if (v130 != -1 && close(v130) == -1) {
    sub_100043820(__s1, &v152);
  }
  if (*(_DWORD *)buf != -1 && close(*(int *)buf) == -1) {
    sub_100043820(__s1, &v152);
  }
  if (v32)
  {
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      uint64_t v39 = *(const char **)(v2 + 56);
      if (!v39) {
        uint64_t v39 = "[anonymous]";
      }
      v152.st_dev = 136446210;
      *(void *)&v152.st_mode = v39;
    }
    else
    {
      uint64_t v43 = *(const char **)(v2 + 56);
      if (!v43) {
        uint64_t v43 = "[anonymous]";
      }
      v152.st_dev = 136446210;
      *(void *)&v152.st_mode = v43;
    }
    __int16 v44 = (char *)_os_log_send_and_compose_impl();
    int v45 = 561;
LABEL_78:
    CFErrorRef v46 = sub_10000BF78("_quire_mount_continue", "quire.c", v45, "com.apple.security.cryptex", 2, v32, v44);
    free(v44);
    a1[2] = (uint64_t)v46;
    cryptex_target_async_f();
    CFRelease(v32);
    goto LABEL_86;
  }
  int v40 = sub_1000215D0((void *)v2);
  if (v40)
  {
    int v41 = v40;
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      uint64_t v42 = *(const char **)(v2 + 56);
      if (!v42) {
        uint64_t v42 = "[anonymous]";
      }
      v152.st_dev = 136446466;
      *(void *)&v152.st_mode = v42;
      WORD2(v152.st_ino) = 1024;
      *(_DWORD *)((char *)&v152.st_ino + 6) = v41;
    }
    else
    {
      __int16 v48 = *(const char **)(v2 + 56);
      if (!v48) {
        __int16 v48 = "[anonymous]";
      }
      v152.st_dev = 136446466;
      *(void *)&v152.st_mode = v48;
      WORD2(v152.st_ino) = 1024;
      *(_DWORD *)((char *)&v152.st_ino + 6) = v40;
    }
    int v49 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v47 = sub_10000BF78("_quire_mount_continue", "quire.c", 567, "com.apple.security.cryptex.posix", v41, 0, v49);
    free(v49);
  }
  else
  {
    CFErrorRef v47 = 0;
  }
  a1[2] = (uint64_t)v47;
LABEL_85:
  cryptex_target_async_f();
LABEL_86:
  uint64_t result = v127;
  if (v127 != -1)
  {
    uint64_t result = close(v127);
    if (result == -1) {
      sub_100043820(__s1, &v152);
    }
  }
  return result;
}

void sub_1000308CC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if ((~(_BYTE)a3 & 6) != 0)
  {
    long long v11 = sub_10003FD2C((void *)a1, 0x50uLL);
    v11[7] = a4;
    v11[8] = a5;
    *((_DWORD *)v11 + 10) = a2;
    int v12 = malloc_type_calloc(1uLL, 0x400uLL, 0x61D5536CuLL);
    if (!v12) {
      sub_1000442F4(&v16, v17);
    }
    v11[6] = v12;
    v11[9] = a3;
    if (realpath_np()) {
      sub_100044394(&v16, v17);
    }
    cryptex_async_f();
  }
  else
  {
    if (*(void *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      CFIndex v7 = *(const char **)(a1 + 56);
      if (!v7) {
        CFIndex v7 = "[anonymous]";
      }
      LODWORD(v17[0]) = 136446210;
      *(void *)((char *)v17 + 4) = v7;
    }
    else
    {
      long long v13 = *(const char **)(a1 + 56);
      if (!v13) {
        long long v13 = "[anonymous]";
      }
      LODWORD(v17[0]) = 136446210;
      *(void *)((char *)v17 + 4) = v13;
    }
    long long v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v15 = sub_10000BF78("quire_bootstrap", "quire.c", 2894, "com.apple.security.cryptex", 11, 0, v14);
    free(v14);
    if (v15)
    {
      MEMORY[0x10] = CFRetain(v15);
      cryptex_target_async_f();
      CFRelease(v15);
    }
  }
}

void sub_100030B58(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 72);
  cryptex_core_get_info_asset();
  if ((*(unsigned char *)(*(void *)(v2 + 200) + 40) & 1) != 0 || (*(unsigned char *)(v2 + 176) & 4) == 0) {
    goto LABEL_3;
  }
  long long v13 = *(const char **)(v2 + 56);
  int v14 = *__error();
  CFErrorRef v15 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = "[anonymous]";
    if (v13) {
      uint64_t v16 = v13;
    }
    *(_DWORD *)int buf = 136446210;
    *(void *)&uint8_t buf[4] = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}s: locking signature digest", buf, 0xCu);
  }
  *__error() = v14;
  uint64_t v20 = cryptex_signature_lock();
  if (v20)
  {
    CFErrorRef v18 = (CFErrorRef)v20;
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      int v21 = *(const char **)(v2 + 56);
      if (!v21) {
        int v21 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446210;
      *(void *)&uint8_t buf[4] = v21;
    }
    else
    {
      uint64_t v39 = *(const char **)(v2 + 56);
      if (!v39) {
        uint64_t v39 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446210;
      *(void *)&uint8_t buf[4] = v39;
    }
    int v40 = (char *)_os_log_send_and_compose_impl();
    int v41 = 2310;
LABEL_59:
    CFIndex v42 = 36;
    goto LABEL_214;
  }
  uint64_t v22 = *(void *)(v2 + 200);
  if ((*(unsigned char *)(v22 + 40) & 1) == 0)
  {
    uint64_t v23 = *(void *)(v22 + 168);
    if (!v23 || (*(unsigned char *)(v23 + 40) & 1) == 0)
    {
      uint64_t v69 = cryptex_signature_lock_with_sep();
      if (v69)
      {
        CFErrorRef v18 = (CFErrorRef)v69;
        if (*(void *)(v2 + 72))
        {
          os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
          int v70 = *(const char **)(v2 + 56);
          if (!v70) {
            int v70 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446210;
          *(void *)&uint8_t buf[4] = v70;
        }
        else
        {
          long long v74 = *(const char **)(v2 + 56);
          if (!v74) {
            long long v74 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446210;
          *(void *)&uint8_t buf[4] = v74;
        }
        int v40 = (char *)_os_log_send_and_compose_impl();
        int v41 = 2320;
        goto LABEL_59;
      }
    }
  }
LABEL_3:
  if ((v3 & 2) != 0 || *(unsigned char *)(v2 + 353) || (CFDictionaryRef v17 = sub_100034118(v2, (void *)a1)) == 0)
  {
    if ((v3 & 4) != 0 || (*(unsigned char *)(v2 + 176) & 0x10) != 0) {
      goto LABEL_209;
    }
    uint64_t v4 = *(void *)(v2 + 320);
    int v5 = *(const char **)(v2 + 56);
    int v6 = *__error();
    CFIndex v7 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = "[anonymous]";
      if (v5) {
        uint64_t v8 = v5;
      }
      *(_DWORD *)int buf = 136446466;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}s: bootstrap contents bitmap before consolidating: 0x%04llX", buf, 0x16u);
    }
    *__error() = v6;
    uint64_t v9 = _cryptex_content_type_jetsam_properties[2];
    uint64_t v10 = _cryptex_content_type_log_profile[2];
    uint64_t v11 = _cryptex_content_type_service[2] | v4 | v9 | _cryptex_content_type_feature_flags[2];
    uint64_t v119 = _cryptex_content_type_service[2];
    uint64_t v120 = v10;
    uint64_t v121 = _cryptex_content_type_feature_flags[2];
    if (*(_DWORD *)(v2 + 188)) {
      uint64_t v12 = v11 & ~(_cryptex_content_type_library[2] | _cryptex_content_type_executable[2] | _cryptex_content_type_factory[2] | v10);
    }
    else {
      uint64_t v12 = v11 | v10;
    }
    if (*(unsigned char *)(v2 + 353))
    {
      uint64_t v24 = *(const char **)(v2 + 56);
      int v25 = *__error();
      CFIndex v26 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        CFErrorRef v27 = "[anonymous]";
        if (v24) {
          CFErrorRef v27 = v24;
        }
        *(_DWORD *)int buf = 136446210;
        *(void *)&uint8_t buf[4] = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}s: No-code cryptex will not bootstrap any contents.", buf, 0xCu);
      }
      uint64_t v12 = 0;
      *__error() = v25;
    }
    __int16 v28 = *(const char **)(v2 + 56);
    int v29 = *__error();
    int v30 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      CFIndex v31 = "[anonymous]";
      if (v28) {
        CFIndex v31 = v28;
      }
      *(_DWORD *)int buf = 136446466;
      *(void *)&uint8_t buf[4] = v31;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v12;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "%{public}s: bootstrap contents bitmap after consolidating: 0x%04llX", buf, 0x16u);
    }
    *__error() = v29;
    *(void *)(v2 + 320) = v12;
    if ((v12 & v9) != 0)
    {
      if (!*(void *)(v2 + 416)) {
        sub_100044414(v125, buf);
      }
      int mounted_jetsam_properties = launch_load_mounted_jetsam_properties();
      if (mounted_jetsam_properties)
      {
        int v33 = mounted_jetsam_properties;
        xpc_object_t v34 = *(const char **)(v2 + 56);
        int v35 = *__error();
        int v36 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = "[anonymous]";
          if (v34) {
            uint64_t v37 = v34;
          }
          *(_DWORD *)int buf = 136446466;
          *(void *)&uint8_t buf[4] = v37;
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = v33;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%{public}s: failed to launch_load_mounted_jetsam_properties: %{darwin.errno}d", buf, 0x12u);
        }
        *__error() = v35;
        if (*(void *)(v2 + 72))
        {
          os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
          CFTypeRef v38 = *(const char **)(v2 + 56);
          if (!v38) {
            CFTypeRef v38 = "[anonymous]";
          }
        }
        else
        {
          CFTypeRef v38 = *(const char **)(v2 + 56);
          if (!v38) {
            CFTypeRef v38 = "[anonymous]";
          }
        }
        *(_DWORD *)int buf = 136446466;
        *(void *)&uint8_t buf[4] = v38;
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = v33;
        char v62 = (char *)_os_log_send_and_compose_impl();
        CFIndex v63 = v33;
        int v64 = 2211;
        goto LABEL_161;
      }
      uint64_t v12 = *(void *)(v2 + 320);
    }
    if ((_cryptex_content_type_library[2] & v12) != 0)
    {
      int v126 = 0;
      object = 0;
      int v123 = 0;
      *(void *)int buf = &v126;
      *(void *)&uint8_t buf[8] = &v123;
      *(void *)&uint8_t buf[16] = &object;
      int v126 = (uint64_t *)sub_10000B48C((uint64_t)&unk_1000594E8, *(unsigned int *)(v2 + 400), 0);
      int v123 = (void *)sub_10000B48C((uint64_t)&unk_100059488, *(unsigned int *)(v2 + 400), 0);
      object = (void *)sub_10000B48C((uint64_t)&unk_1000594B8, *(unsigned int *)(v2 + 400), 0);
      uint64_t v43 = *(const char **)(v2 + 56);
      int v44 = *__error();
      int v45 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        CFErrorRef v46 = "[anonymous]";
        if (v43) {
          CFErrorRef v46 = v43;
        }
        *(_DWORD *)int v125 = 136446210;
        *(void *)&v125[4] = v46;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "%{public}s: iterating libraries", v125, 0xCu);
      }
      *__error() = v44;
      sub_100034BE4(v2, a1, (uint64_t)&unk_10005AEC0, (uint64_t **)buf, 3, (void (*)(uint64_t, void *, uint64_t))sub_100034DF8);
      sub_100034BE4(v2, a1, (uint64_t)&unk_10005AF20, (uint64_t **)buf, 3, (void (*)(uint64_t, void *, uint64_t))sub_100034DF8);
      sub_100034BE4(v2, a1, (uint64_t)&unk_10005AF38, (uint64_t **)buf, 3, (void (*)(uint64_t, void *, uint64_t))sub_100034DF8);
      if (object) {
        os_release(object);
      }
      if (v123) {
        os_release(v123);
      }
      if (v126) {
        os_release(v126);
      }
      uint64_t v12 = *(void *)(v2 + 320);
    }
    if ((_cryptex_content_type_executable[2] & v12) != 0)
    {
      int v126 = 0;
      object = 0;
      int v123 = 0;
      *(void *)int buf = &v126;
      *(void *)&uint8_t buf[8] = &v123;
      *(void *)&uint8_t buf[16] = &object;
      int v126 = (uint64_t *)sub_10000B48C((uint64_t)&unk_1000594E8, *(unsigned int *)(v2 + 400), 0);
      int v123 = (void *)sub_10000B48C((uint64_t)&unk_100059488, *(unsigned int *)(v2 + 400), 0);
      object = (void *)sub_10000B48C((uint64_t)&unk_1000594B8, *(unsigned int *)(v2 + 400), 0);
      CFErrorRef v47 = *(const char **)(v2 + 56);
      int v48 = *__error();
      int v49 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        __int16 v50 = "[anonymous]";
        if (v47) {
          __int16 v50 = v47;
        }
        *(_DWORD *)int v125 = 136446210;
        *(void *)&v125[4] = v50;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "%{public}s: iterating binaries", v125, 0xCu);
      }
      *__error() = v48;
      sub_100034BE4(v2, a1, (uint64_t)&unk_10005AED8, (uint64_t **)buf, 3, (void (*)(uint64_t, void *, uint64_t))sub_100035138);
      if (object) {
        os_release(object);
      }
      if (v123) {
        os_release(v123);
      }
      if (v126) {
        os_release(v126);
      }
      uint64_t v12 = *(void *)(v2 + 320);
    }
    if ((_cryptex_content_type_factory[2] & v12) == 0)
    {
LABEL_136:
      if ((v12 & v120) != 0)
      {
        int v126 = 0;
        int v123 = 0;
        *(void *)int buf = &v126;
        *(void *)&uint8_t buf[8] = &v123;
        int v126 = (uint64_t *)sub_10000B48C((uint64_t)&unk_1000594E8, *(unsigned int *)(v2 + 400), 0);
        int v123 = (void *)sub_10000B48C((uint64_t)&unk_1000594B8, *(unsigned int *)(v2 + 400), 0);
        long long v79 = *(const char **)(v2 + 56);
        int v80 = *__error();
        int v81 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
        {
          long long v82 = "[anonymous]";
          if (v79) {
            long long v82 = v79;
          }
          *(_DWORD *)int v125 = 136446210;
          *(void *)&v125[4] = v82;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEBUG, "%{public}s: iterating log_profiles", v125, 0xCu);
        }
        *__error() = v80;
        sub_100034BE4(v2, a1, (uint64_t)&unk_10005AF50, (uint64_t **)buf, 2, (void (*)(uint64_t, void *, uint64_t))sub_100036CA8);
        if (v123) {
          os_release(v123);
        }
        if (v126) {
          os_release(v126);
        }
        uint64_t v12 = *(void *)(v2 + 320);
      }
      if ((v12 & v121) != 0)
      {
        *(void *)int v125 = 0;
        int v126 = (uint64_t *)v125;
        *(void *)int v125 = sub_10000B48C((uint64_t)&unk_1000594E8, *(unsigned int *)(v2 + 400), 0);
        long long v83 = *(const char **)(v2 + 56);
        int v84 = *__error();
        int v85 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
        {
          long long v86 = "[anonymous]";
          if (v83) {
            long long v86 = v83;
          }
          *(_DWORD *)int buf = 136446210;
          *(void *)&uint8_t buf[4] = v86;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEBUG, "%{public}s: iterating feature_flag_domains", buf, 0xCu);
        }
        *__error() = v84;
        int v87 = (const void *)sub_100034BE4(v2, a1, (uint64_t)&unk_10005AF98, &v126, 1, (void (*)(uint64_t, void *, uint64_t))sub_100037004);
        if (*(void *)v125) {
          os_release(*(void **)v125);
        }
        if (v87)
        {
          if (*(void *)(v2 + 72))
          {
            os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
            int v88 = *(const char **)(v2 + 56);
            if (!v88) {
              int v88 = "[anonymous]";
            }
            *(_DWORD *)int buf = 136446210;
            *(void *)&uint8_t buf[4] = v88;
          }
          else
          {
            long long v101 = *(const char **)(v2 + 56);
            if (!v101) {
              long long v101 = "[anonymous]";
            }
            *(_DWORD *)int buf = 136446210;
            *(void *)&uint8_t buf[4] = v101;
          }
          int v102 = (char *)_os_log_send_and_compose_impl();
          int v103 = 2249;
          goto LABEL_204;
        }
        uint64_t v12 = *(void *)(v2 + 320);
      }
      if ((v12 & v119) == 0) {
        goto LABEL_209;
      }
      int v126 = 0;
      object = 0;
      int v123 = 0;
      *(void *)int buf = &v126;
      *(void *)&uint8_t buf[8] = &v123;
      *(void *)&uint8_t buf[16] = &object;
      int v126 = (uint64_t *)sub_10000B48C((uint64_t)&unk_1000594E8, *(unsigned int *)(v2 + 400), 0);
      int v123 = (void *)sub_10000B48C((uint64_t)&unk_100059488, *(unsigned int *)(v2 + 400), 0);
      object = (void *)sub_10000B48C((uint64_t)&unk_1000594B8, *(unsigned int *)(v2 + 400), 0);
      int v87 = sub_100037360(v2, 1);
      if (!v87)
      {
        long long v91 = *(const char **)(v2 + 56);
        int v92 = *__error();
        long long v93 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEBUG))
        {
          int v94 = "[anonymous]";
          if (v91) {
            int v94 = v91;
          }
          *(_DWORD *)int v125 = 136446210;
          *(void *)&v125[4] = v94;
          _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_DEBUG, "%{public}s: iterating launch agents", v125, 0xCu);
        }
        *__error() = v92;
        int v87 = (const void *)sub_10000B4F0((uint64_t)v126, (uint64_t)&unk_10005AF08, a1, (void (*)(uint64_t, void *, uint64_t))sub_10003760C, 0);
        if (v87) {
          goto LABEL_183;
        }
        long long v95 = *(const char **)(v2 + 56);
        int v96 = *__error();
        long long v97 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
        {
          long long v98 = "[anonymous]";
          if (v95) {
            long long v98 = v95;
          }
          *(_DWORD *)int v125 = 136446210;
          *(void *)&v125[4] = v98;
          _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEBUG, "%{public}s: iterating services", v125, 0xCu);
        }
        *__error() = v96;
        int v87 = (const void *)sub_100034BE4(v2, a1, (uint64_t)&unk_10005AEF0, (uint64_t **)buf, 3, (void (*)(uint64_t, void *, uint64_t))sub_100037B10);
        if (v87 || (int v87 = sub_100037360(v2, 0)) != 0)
        {
LABEL_183:
          CFTypeRef v99 = sub_100037360(v2, 0);
          if (v99) {
            CFRelease(v99);
          }
          goto LABEL_185;
        }
        CFDictionaryRef v109 = sub_1000380C4(v2);
        if (!v109)
        {
LABEL_225:
          uint64_t v114 = v2 + 448;
          while (1)
          {
            uint64_t v114 = *(void *)v114;
            if (!v114) {
              break;
            }
            if (*(unsigned char *)(v114 + 1160))
            {
              long long v115 = *(const char **)(v2 + 56);
              int v116 = *__error();
              int v117 = *(NSObject **)(v2 + 72);
              if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
              {
                int v118 = "[anonymous]";
                if (v115) {
                  int v118 = v115;
                }
                *(_DWORD *)int v125 = 136446210;
                *(void *)&v125[4] = v118;
                _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEBUG, "%{public}s: resetting remote devices for added remote services", v125, 0xCu);
              }
              *__error() = v116;
              sub_1000387E4();
              break;
            }
          }
          int v87 = 0;
          goto LABEL_185;
        }
        int v87 = v109;
        if (sub_10000C218(v109, @"com.apple.security.cryptex", 10))
        {
          long long v110 = *(const char **)(v2 + 56);
          int v111 = *__error();
          long long v112 = *(NSObject **)(v2 + 72);
          if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
          {
            long long v113 = "[anonymous]";
            if (v110) {
              long long v113 = v110;
            }
            *(_DWORD *)int v125 = 136446210;
            *(void *)&v125[4] = v113;
            _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "%{public}s: Watchdog registration not supported on this device. Skipping.", v125, 0xCu);
          }
          *__error() = v111;
          CFRelease(v87);
          goto LABEL_225;
        }
      }
LABEL_185:
      if (object) {
        os_release(object);
      }
      if (v123) {
        os_release(v123);
      }
      if (v126) {
        os_release(v126);
      }
      if (!v87) {
        goto LABEL_209;
      }
      if (*(void *)(v2 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
        CFTypeRef v100 = *(const char **)(v2 + 56);
        if (!v100) {
          CFTypeRef v100 = "[anonymous]";
        }
        *(_DWORD *)int buf = 136446210;
        *(void *)&uint8_t buf[4] = v100;
      }
      else
      {
        long long v104 = *(const char **)(v2 + 56);
        if (!v104) {
          long long v104 = "[anonymous]";
        }
        *(_DWORD *)int buf = 136446210;
        *(void *)&uint8_t buf[4] = v104;
      }
      int v102 = (char *)_os_log_send_and_compose_impl();
      int v103 = 2261;
LABEL_204:
      CFErrorRef v18 = sub_10000BF78("_quire_bootstrap_contents", "quire.c", v103, "com.apple.security.cryptex", 14, v87, v102);
      free(v102);
      CFRelease(v87);
      if (v18) {
        goto LABEL_205;
      }
LABEL_209:
      cryptex_async_f();
      return;
    }
    int v51 = (void *)sub_10000B48C((uint64_t)&unk_100059518, *(unsigned int *)(v2 + 400), 0);
    int v52 = *(const char **)(v2 + 56);
    int v53 = *__error();
    __int16 v54 = *(NSObject **)(v2 + 72);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
    {
      int v55 = "[anonymous]";
      if (v52) {
        int v55 = v52;
      }
      *(_DWORD *)int buf = 136446210;
      *(void *)&uint8_t buf[4] = v55;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "%{public}s: iterating factory content", buf, 0xCu);
    }
    *__error() = v53;
    sub_10000B4F0((uint64_t)v51, (uint64_t)&unk_10005AF68, a1, (void (*)(uint64_t, void *, uint64_t))sub_1000354D0, 1);
    int v56 = *(_DWORD *)(a1 + 8);
    if (v56)
    {
      int v57 = *(const char **)(v2 + 56);
      int v58 = *__error();
      int v59 = *(NSObject **)(v2 + 72);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        uint64_t v60 = "[anonymous]";
        if (v57) {
          uint64_t v60 = v57;
        }
        *(_DWORD *)int buf = 136446466;
        *(void *)&uint8_t buf[4] = v60;
        *(_WORD *)&unsigned char buf[12] = 1024;
        *(_DWORD *)&buf[14] = v56;
        char v61 = "%{public}s: failed to bootstrap diags: %{darwin.errno}d";
LABEL_126:
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, v61, buf, 0x12u);
      }
    }
    else
    {
      sub_10000B4F0((uint64_t)v51, (uint64_t)&unk_10005AF80, a1, (void (*)(uint64_t, void *, uint64_t))sub_1000361F0, 1);
      int v65 = *(_DWORD *)(a1 + 8);
      if (v65)
      {
        uint64_t v66 = *(const char **)(v2 + 56);
        int v58 = *__error();
        int v59 = *(NSObject **)(v2 + 72);
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          uint64_t v67 = "[anonymous]";
          if (v66) {
            uint64_t v67 = v66;
          }
          *(_DWORD *)int buf = 136446466;
          *(void *)&uint8_t buf[4] = v67;
          *(_WORD *)&unsigned char buf[12] = 1024;
          *(_DWORD *)&buf[14] = v65;
          char v61 = "%{public}s: failed to bootstrap luacore libraries: %{darwin.errno}d";
          goto LABEL_126;
        }
      }
      else
      {
        sub_10000B4F0((uint64_t)v51, (uint64_t)&unk_10005AFB0, a1, (void (*)(uint64_t, void *, uint64_t))sub_1000365AC, 1);
        int v71 = *(_DWORD *)(a1 + 8);
        if (v71)
        {
          long long v72 = *(const char **)(v2 + 56);
          int v58 = *__error();
          int v59 = *(NSObject **)(v2 + 72);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            uint64_t v73 = "[anonymous]";
            if (v72) {
              uint64_t v73 = v72;
            }
            *(_DWORD *)int buf = 136446466;
            *(void *)&uint8_t buf[4] = v73;
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = v71;
            char v61 = "%{public}s: failed to bootstrap python libraries: %{darwin.errno}d";
            goto LABEL_126;
          }
        }
        else
        {
          sub_10000B4F0((uint64_t)v51, (uint64_t)&unk_10005AFC8, a1, (void (*)(uint64_t, void *, uint64_t))sub_1000368EC, 1);
          int v75 = *(_DWORD *)(a1 + 8);
          if (!v75)
          {
LABEL_128:
            if (v51) {
              os_release(v51);
            }
            int v33 = *(_DWORD *)(a1 + 8);
            if (v33)
            {
              if (*(void *)(v2 + 72))
              {
                os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
                long long v78 = *(const char **)(v2 + 56);
                if (!v78) {
                  long long v78 = "[anonymous]";
                }
              }
              else
              {
                long long v78 = *(const char **)(v2 + 56);
                if (!v78) {
                  long long v78 = "[anonymous]";
                }
              }
              *(_DWORD *)int buf = 136446466;
              *(void *)&uint8_t buf[4] = v78;
              *(_WORD *)&unsigned char buf[12] = 1024;
              *(_DWORD *)&buf[14] = v33;
              char v62 = (char *)_os_log_send_and_compose_impl();
              int v64 = 2232;
              CFIndex v63 = v33;
LABEL_161:
              sub_10000BF78("_quire_bootstrap_contents", "quire.c", v64, "com.apple.security.cryptex.posix", v63, 0, v62);
              free(v62);
              if (*(void *)(v2 + 72))
              {
                os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
                long long v89 = *(const char **)(v2 + 56);
                if (!v89) {
                  long long v89 = "[anonymous]";
                }
              }
              else
              {
                long long v89 = *(const char **)(v2 + 56);
                if (!v89) {
                  long long v89 = "[anonymous]";
                }
              }
              *(_DWORD *)int buf = 136446466;
              *(void *)&uint8_t buf[4] = v89;
              *(_WORD *)&unsigned char buf[12] = 1024;
              *(_DWORD *)&buf[14] = v33;
              long long v90 = (char *)_os_log_send_and_compose_impl();
              CFErrorRef v18 = sub_10000BF78("_quire_bootstrap_contents", "quire.c", 2280, "com.apple.security.cryptex.posix", v33, 0, v90);
              free(v90);
              if (!v18) {
                goto LABEL_209;
              }
LABEL_205:
              if (*(void *)(v2 + 72))
              {
                os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
                long long v105 = *(const char **)(v2 + 56);
                if (!v105) {
                  long long v105 = "[anonymous]";
                }
                *(_DWORD *)int buf = 136446210;
                *(void *)&uint8_t buf[4] = v105;
              }
              else
              {
                long long v106 = *(const char **)(v2 + 56);
                if (!v106) {
                  long long v106 = "[anonymous]";
                }
                *(_DWORD *)int buf = 136446210;
                *(void *)&uint8_t buf[4] = v106;
              }
              int v40 = (char *)_os_log_send_and_compose_impl();
              int v41 = 2359;
              CFIndex v42 = 14;
              goto LABEL_214;
            }
            uint64_t v12 = *(void *)(v2 + 320);
            goto LABEL_136;
          }
          long long v76 = *(const char **)(v2 + 56);
          int v58 = *__error();
          int v59 = *(NSObject **)(v2 + 72);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            long long v77 = "[anonymous]";
            if (v76) {
              long long v77 = v76;
            }
            *(_DWORD *)int buf = 136446466;
            *(void *)&uint8_t buf[4] = v77;
            *(_WORD *)&unsigned char buf[12] = 1024;
            *(_DWORD *)&buf[14] = v75;
            char v61 = "%{public}s: failed to bootstrap astro content: %{darwin.errno}d";
            goto LABEL_126;
          }
        }
      }
    }
    *__error() = v58;
    goto LABEL_128;
  }
  CFErrorRef v18 = v17;
  if (sub_10000C218(v17, @"com.apple.security.cryptex.posix", 36))
  {
LABEL_216:
    cryptex_async_f();
    CFErrorRef v108 = v18;
    goto LABEL_217;
  }
  if (*(void *)(v2 + 72))
  {
    os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
    int v19 = *(const char **)(v2 + 56);
    if (!v19) {
      int v19 = "[anonymous]";
    }
    *(_DWORD *)int buf = 136446210;
    *(void *)&uint8_t buf[4] = v19;
  }
  else
  {
    uint64_t v68 = *(const char **)(v2 + 56);
    if (!v68) {
      uint64_t v68 = "[anonymous]";
    }
    *(_DWORD *)int buf = 136446210;
    *(void *)&uint8_t buf[4] = v68;
  }
  int v40 = (char *)_os_log_send_and_compose_impl();
  int v41 = 2336;
  CFIndex v42 = 34;
LABEL_214:
  CFErrorRef v107 = sub_10000BF78("_quire_bootstrap_continue", "quire.c", v41, "com.apple.security.cryptex", v42, v18, v40);
  free(v40);
  if (!v107) {
    goto LABEL_216;
  }
  *(void *)(a1 + 16) = CFRetain(v107);
  cryptex_async_f();
  CFRelease(v18);
  CFErrorRef v108 = v107;
LABEL_217:
  CFRelease(v108);
}

void sub_1000324A8(void **a1)
{
  uint64_t v2 = a1[2];
  ((void (*)(void *, void, void *, void *))a1[8])(*a1, 0, a1[2], a1[7]);
  free(a1[6]);
  sub_10003FE2C(a1);
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t sub_100032514(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = sub_10003FD2C(a1, 0x50uLL);
  v9[7] = a4;
  v9[8] = a5;
  *((_DWORD *)v9 + 10) = a2;
  uint64_t v10 = malloc_type_calloc(1uLL, 0x400uLL, 0x61D5536CuLL);
  if (!v10) {
    sub_1000442F4(&v12, v13);
  }
  v9[6] = v10;
  v9[9] = a3;
  if (realpath_np()) {
    sub_100044394(&v12, v13);
  }

  return cryptex_async_f();
}

void sub_100032610(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *(void *)(*a1 + 176);
  if ((v3 & 0x10) != 0 && (a1[9] & 1) == 0)
  {
    if (*(void *)(v2 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    int v5 = 2388;
LABEL_16:
    CFIndex v6 = 4;
    goto LABEL_17;
  }
  if (*(void *)(v2 + 480))
  {
    if (*(void *)(v2 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
    }
    uint64_t v4 = (char *)_os_log_send_and_compose_impl();
    int v5 = 2397;
    goto LABEL_16;
  }
  if ((v3 & 2) != 0)
  {
    sub_1000394D4((void *)*a1);
    if (*(void *)(v2 + 448)) {
      sub_100038DDC(v2);
    }
    sub_1000390F8(v2);
    *(void *)(v2 + 176) &= ~2uLL;
    goto LABEL_19;
  }
  if (*(void *)(v2 + 72)) {
    os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
  }
  uint64_t v4 = (char *)_os_log_send_and_compose_impl();
  int v5 = 2407;
  CFIndex v6 = 18;
LABEL_17:
  CFErrorRef v7 = sub_10000BF78("_quire_unbootstrap_continue", "quire.c", v5, "com.apple.security.cryptex", v6, 0, v4);
  free(v4);
  if (v7)
  {
    a1[2] = (uint64_t)CFRetain(v7);
    cryptex_target_async_f();
    CFRelease(v7);
    return;
  }
LABEL_19:
  a1[2] = 0;
  cryptex_target_async_f();
}

void *sub_100032A30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = sub_10003FD2C((void *)a1, 0x50uLL);
  result[4] = a2;
  *((_DWORD *)result + 11) = -1;
  result[7] = a3;
  result[8] = a4;
  if (*(_DWORD *)(a1 + 184))
  {
    result[3] = 0;
    **(void **)(a1 + 384) = result;
    *(void *)(a1 + 384) = result + 3;
  }
  else
  {
    return (void *)cryptex_async_f();
  }
  return result;
}

void sub_100032AD0(void *a1)
{
  int v1 = a1;
  uint64_t v2 = a1[4];
  uint64_t v3 = *a1;
  uint64_t v4 = *(const char **)(*a1 + 56);
  int v5 = *__error();
  CFIndex v6 = *(NSObject **)(v3 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    CFErrorRef v7 = "[anonymous]";
    if (v4) {
      CFErrorRef v7 = v4;
    }
    *(_DWORD *)int buf = 136446210;
    int v102 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: _quire_unmount_continue called.", buf, 0xCu);
  }
  *__error() = v5;
  int v94 = (int *)(v3 + 400);
  if ((*(_DWORD *)(v3 + 400) & 0x80000000) != 0)
  {
    if (*(void *)(v3 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR);
      CFErrorRef v27 = *(const char **)(v3 + 56);
      if (!v27) {
        CFErrorRef v27 = "[anonymous]";
      }
    }
    else
    {
      CFErrorRef v27 = *(const char **)(v3 + 56);
      if (!v27) {
        CFErrorRef v27 = "[anonymous]";
      }
    }
    *(_DWORD *)int buf = 136446466;
    int v102 = v27;
    __int16 v103 = 1024;
    int v104 = 6;
    CFErrorRef v32 = (char *)_os_log_send_and_compose_impl();
    int v34 = 722;
    CFIndex v33 = 6;
  }
  else
  {
    if (*(void *)(v3 + 480)) {
      sub_100044494(v95, buf);
    }
    uint64_t v8 = *(void **)(v3 + 472);
    if (v8)
    {
      uint64_t v9 = (void *)(v3 + 472);
      do
      {
        uint64_t v10 = (void *)*v9;
        uint64_t v11 = (void *)(v3 + 472);
        if ((void *)*v9 != v8)
        {
          do
          {
            uint64_t v12 = v10;
            uint64_t v10 = (void *)v10[1];
          }
          while (v10 != v8);
          uint64_t v11 = v12 + 1;
        }
        int v14 = (void *)*v8;
        long long v13 = (void *)v8[1];
        void *v11 = v13;
        v8[1] = -1;
        CFErrorRef v15 = (void *)v14[60];
        if (v15)
        {
          uint64_t v16 = v14 + 60;
          CFDictionaryRef v17 = (void *)v14[60];
          while (*v17 != v3)
          {
            CFDictionaryRef v17 = (void *)v17[1];
            if (!v17)
            {
              if (!v14) {
                goto LABEL_18;
              }
              goto LABEL_17;
            }
          }
          if (v15 != v17)
          {
            do
            {
              CFErrorRef v18 = v15;
              CFErrorRef v15 = (void *)v15[1];
            }
            while (v15 != v17);
            uint64_t v16 = v18 + 1;
            CFErrorRef v15 = v17;
          }
          void *v16 = v15[1];
          v17[1] = -1;
          os_release((void *)v3);
          free(v17);
          if (v14) {
            goto LABEL_17;
          }
        }
        else
        {
LABEL_17:
          os_release(v14);
        }
LABEL_18:
        free(v8);
        uint64_t v8 = v13;
      }
      while (v13);
    }
    sub_1000394D4((void *)v3);
    uint64_t v19 = v1[4];
    bzero(buf, 0x400uLL);
    int v20 = realpath_np();
    if (v20)
    {
      int v21 = v20;
      uint64_t v22 = *(const char **)(v3 + 56);
      int v23 = *__error();
      uint64_t v24 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v25 = "[anonymous]";
        if (v22) {
          int v25 = v22;
        }
        *(_DWORD *)long long v95 = 136446466;
        int v96 = v25;
        __int16 v97 = 1024;
        LODWORD(v98) = v21;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%{public}s: could not resolve mount point for unmount: %{darwin.errno}d", v95, 0x12u);
      }
      *__error() = v23;
      goto LABEL_31;
    }
    close_drop_np();
    __int16 v28 = *(const char **)(v3 + 56);
    int v29 = *__error();
    int v30 = *(NSObject **)(v3 + 72);
    char v92 = v2;
    long long v93 = v1;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      CFIndex v31 = "[anonymous]";
      if (v28) {
        CFIndex v31 = v28;
      }
      *(_DWORD *)long long v95 = 136446466;
      int v96 = v31;
      __int16 v97 = 2080;
      long long v98 = buf;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "%{public}s: unmounting: %s", v95, 0x16u);
    }
    unint64_t v39 = 0;
    *__error() = v29;
    while (1)
    {
      BOOL v40 = v39 != 0;
      char v41 = v19 & v40;
      if ((v19 & v40) != 0) {
        int v42 = 0x80000;
      }
      else {
        int v42 = 0;
      }
      if ((unmount((const char *)buf, v42) & 0x80000000) == 0) {
        *__error() = 0;
      }
      int v43 = *__error();
      if (v43 != 16) {
        break;
      }
      int v21 = *__error();
      int v44 = *(const char **)(v3 + 56);
      int v45 = *__error();
      CFErrorRef v46 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long v95 = 136446722;
        CFErrorRef v47 = "[anonymous]";
        if (v44) {
          CFErrorRef v47 = v44;
        }
        int v96 = v47;
        __int16 v97 = 2048;
        long long v98 = (uint8_t *)v39;
        __int16 v99 = 2080;
        CFTypeRef v100 = buf;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%{public}s: mount busy [%lu]: %s", v95, 0x20u);
      }
      *__error() = v45;
      usleep(0x3E8u);
      if (v21 == 16)
      {
        BOOL v48 = v39++ >= 4;
        if (!v48) {
          continue;
        }
      }
      goto LABEL_89;
    }
    if (v43)
    {
      int v21 = *__error();
      __int16 v54 = *(const char **)(v3 + 56);
      int v55 = *__error();
      int v56 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        if (!v54) {
          __int16 v54 = "[anonymous]";
        }
        int v57 = *__error();
        *(_DWORD *)long long v95 = 136446466;
        int v96 = v54;
        __int16 v97 = 1024;
        LODWORD(v98) = v57;
        _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "%{public}s: unmount: %{darwin.errno}d", v95, 0x12u);
      }
      *__error() = v55;
LABEL_89:
      LOBYTE(v2) = v92;
      if (v21)
      {
        int *v94 = open((const char *)buf, 1048832);
LABEL_31:
        if (*(void *)(v3 + 72))
        {
          os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR);
          CFIndex v26 = *(const char **)(v3 + 56);
          if (!v26) {
            CFIndex v26 = "[anonymous]";
          }
        }
        else
        {
          CFIndex v26 = *(const char **)(v3 + 56);
          if (!v26) {
            CFIndex v26 = "[anonymous]";
          }
        }
        *(_DWORD *)int buf = 136446466;
        int v102 = v26;
        __int16 v103 = 1024;
        int v104 = v21;
        CFErrorRef v32 = (char *)_os_log_send_and_compose_impl();
        CFIndex v33 = v21;
        int v34 = 733;
        goto LABEL_49;
      }
    }
    else
    {
      int v49 = *(const char **)(v3 + 56);
      int v50 = *__error();
      int v51 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        int v52 = (const char *)&unk_10004C227;
        int v53 = "[anonymous]";
        if (v49) {
          int v53 = v49;
        }
        if (v41) {
          int v52 = "force ";
        }
        *(_DWORD *)long long v95 = 136446466;
        int v96 = v53;
        __int16 v97 = 2080;
        long long v98 = (uint8_t *)v52;
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, "%{public}s: %sunmount succeeded", v95, 0x16u);
      }
      *__error() = v50;
    }
    int v58 = *(_DWORD *)(v3 + 404);
    if (os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_DEBUG))
    {
      bzero(buf, 0x400uLL);
      if (!realpath_np())
      {
        int v59 = *(const char **)(v3 + 56);
        int v60 = *__error();
        char v61 = *(NSObject **)(v3 + 72);
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long v95 = 136446722;
          char v62 = "[anonymous]";
          if (v59) {
            char v62 = v59;
          }
          int v96 = v62;
          __int16 v97 = 2080;
          long long v98 = buf;
          __int16 v99 = 1024;
          LODWORD(v100) = v58;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "%{public}s: detaching: path = %s, fd = %d", v95, 0x1Cu);
        }
        *__error() = v60;
      }
    }
    unint64_t v63 = 0;
    while (1)
    {
      if ((ioctl(v58, 0x20006415uLL, 0) & 0x80000000) == 0) {
        *__error() = 0;
      }
      int v64 = *__error();
      if (v64 != 16) {
        break;
      }
      int v65 = *__error();
      uint64_t v66 = *(const char **)(v3 + 56);
      int v67 = *__error();
      uint64_t v68 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        uint64_t v69 = "[anonymous]";
        if (v66) {
          uint64_t v69 = v66;
        }
        *(_DWORD *)int buf = 136446210;
        int v102 = v69;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%{public}s: device busy", buf, 0xCu);
      }
      *__error() = v67;
      usleep(0x3E8u);
      uint64_t v70 = 0;
      if (v65 == 16)
      {
        BOOL v48 = v63++ >= 4;
        if (!v48) {
          continue;
        }
      }
      goto LABEL_116;
    }
    if (v64)
    {
      int v65 = *__error();
      int v80 = *(const char **)(v3 + 56);
      int v81 = *__error();
      long long v82 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
      {
        long long v83 = "[anonymous]";
        if (v80) {
          long long v83 = v80;
        }
        *(_DWORD *)int buf = 136446466;
        int v102 = v83;
        __int16 v103 = 1024;
        int v104 = v65;
        _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_ERROR, "%{public}s: ioctl: DKIOCEJECT: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v81;
      LOBYTE(v2) = v92;
      int v1 = v93;
      if (v65) {
        goto LABEL_123;
      }
    }
    else
    {
      int v71 = *(const char **)(v3 + 56);
      int v72 = *__error();
      uint64_t v73 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
      {
        long long v74 = "[anonymous]";
        if (v71) {
          long long v74 = v71;
        }
        *(_DWORD *)int buf = 136446210;
        int v102 = v74;
        _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "%{public}s: detach succeeded", buf, 0xCu);
      }
      int v65 = 0;
      *__error() = v72;
      uint64_t v70 = v3 + 404;
LABEL_116:
      int v75 = *(const char **)(v3 + 56);
      int v76 = *__error();
      long long v77 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
      {
        long long v78 = "[anonymous]";
        if (v75) {
          long long v78 = v75;
        }
        *(_DWORD *)int buf = 136446210;
        int v102 = v78;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEBUG, "%{public}s: Finished quire detach.", buf, 0xCu);
      }
      *__error() = v76;
      LOBYTE(v2) = v92;
      int v1 = v93;
      if (v70) {
        close_drop_np();
      }
      if (v65)
      {
LABEL_123:
        if (*(void *)(v3 + 72))
        {
          os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR);
          long long v79 = *(const char **)(v3 + 56);
          if (!v79) {
            long long v79 = "[anonymous]";
          }
        }
        else
        {
          long long v79 = *(const char **)(v3 + 56);
          if (!v79) {
            long long v79 = "[anonymous]";
          }
        }
        *(_DWORD *)int buf = 136446466;
        int v102 = v79;
        __int16 v103 = 1024;
        int v104 = v65;
        CFErrorRef v32 = (char *)_os_log_send_and_compose_impl();
        CFIndex v33 = v65;
        int v34 = 739;
        goto LABEL_49;
      }
    }
    unsigned int v84 = sub_100021618((void *)v3);
    if (!v84)
    {
      sub_10002DEC4(v3);
      int v87 = *(const char **)(v3 + 56);
      int v88 = *__error();
      long long v89 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEBUG))
      {
        long long v90 = "[anonymous]";
        if (v87) {
          long long v90 = v87;
        }
        *(_DWORD *)int buf = 136446210;
        int v102 = v90;
        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_DEBUG, "%{public}s: Finished quire unmount.", buf, 0xCu);
      }
      *__error() = v88;
      goto LABEL_54;
    }
    signed int v85 = v84;
    if (*(void *)(v3 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR);
      long long v86 = *(const char **)(v3 + 56);
      if (!v86) {
        long long v86 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      int v102 = v86;
      __int16 v103 = 1024;
      int v104 = v85;
    }
    else
    {
      long long v91 = *(const char **)(v3 + 56);
      if (!v91) {
        long long v91 = "[anonymous]";
      }
      *(_DWORD *)int buf = 136446466;
      int v102 = v91;
      __int16 v103 = 1024;
      int v104 = v84;
    }
    CFErrorRef v32 = (char *)_os_log_send_and_compose_impl();
    CFIndex v33 = v85;
    int v34 = 745;
  }
LABEL_49:
  CFErrorRef v35 = sub_10000BF78("_quire_unmount_continue", "quire.c", v34, "com.apple.security.cryptex.posix", v33, 0, v32);
  free(v32);
  if (v35) {
    BOOL v36 = (v2 & 2) == 0;
  }
  else {
    BOOL v36 = 0;
  }
  if (v36)
  {
    if ((*(_DWORD *)(v3 + 404) & 0x80000000) != 0)
    {
      CFTypeRef v38 = 0;
    }
    else
    {
      uint64_t v37 = malloc_type_calloc(1uLL, 0x10uLL, 0x61D5536CuLL);
      if (!v37) {
        sub_100044254();
      }
      CFTypeRef v38 = v37;
      v37[3] = sub_10003DE70((_DWORD *)(v3 + 404));
      v38[2] = sub_10003DE70(v94);
    }
    v1[6] = v38;
  }
  else if (!v35)
  {
LABEL_54:
    v1[2] = 0;
    cryptex_target_async_f();
    return;
  }
  v1[2] = CFRetain(v35);
  cryptex_target_async_f();
  CFRelease(v35);
}

uint64_t sub_100033900(void *a1, int a2, void *a3)
{
  int v5 = sub_10003FD2C(a1, 0x28uLL);
  *((_DWORD *)v5 + 6) = a2;
  void v5[4] = a3;
  xpc_retain(a3);
  cryptex_sync_f();
  uint64_t v6 = v5[2];
  sub_10003FE2C((void **)v5);
  return v6;
}

void sub_100033978(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(const char **)(*(void *)a1 + 56);
  int v4 = *__error();
  int v5 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = "[anonymous]";
    int v7 = *(_DWORD *)(a1 + 24);
    if (v3) {
      uint64_t v6 = v3;
    }
    *(_DWORD *)int buf = 136446466;
    int v29 = v6;
    __int16 v30 = 1024;
    LODWORD(v31) = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s: Launching Launch Agent quires for target user of: %u.", buf, 0x12u);
  }
  *__error() = v4;
  uint64_t v8 = *(uint64_t **)(v2 + 456);
  if (v8)
  {
    while (1)
    {
      uint64_t v9 = (uint64_t *)*v8;
      uint64_t v10 = malloc_type_calloc(1uLL, 0x510uLL, 0x61D5536CuLL);
      if (!v10) {
        sub_100044514(&v27, buf);
      }
      uint64_t v11 = v10;
      int v12 = *(_DWORD *)(a1 + 24);
      *((_DWORD *)v10 + 322) = v12;
      long long v13 = *(_OWORD *)(v8 + 11);
      long long v14 = *(_OWORD *)(v8 + 9);
      uint64_t v15 = v8[15];
      *((_OWORD *)v10 + 7snprintf(byte_10005E420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = *(_OWORD *)(v8 + 13);
      long long v16 = *(_OWORD *)(v8 + 1);
      long long v17 = *(_OWORD *)(v8 + 3);
      long long v18 = *(_OWORD *)(v8 + 5);
      *((_OWORD *)v10 + 76) = *(_OWORD *)(v8 + 7);
      *((_OWORD *)v10 + 75) = v18;
      *((_OWORD *)v10 + 74) = v17;
      *((_OWORD *)v10 + 73) = v16;
      v10[160] = v15;
      *((_OWORD *)v10 + 77) = v14;
      *((_OWORD *)v10 + 78) = v13;
      *((_DWORD *)v10 + 316) = v12;
      v10[160] = *(void *)(a1 + 32);
      CFErrorRef v19 = sub_1000144A4((uint64_t)(v8 + 16), v10 + 146, (uint64_t)(v10 + 1), *(void *)(v2 + 368));
      if (v19) {
        break;
      }
      void *v11 = *(void *)(v2 + 464);
      *(void *)(v2 + 464) = v11;
      sub_100038858(v2);
      uint64_t v8 = v9;
      if (!v9) {
        goto LABEL_9;
      }
    }
    CFErrorRef v20 = v19;
    if (*(void *)(v2 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v2 + 72), OS_LOG_TYPE_ERROR);
      int v21 = *(const char **)(v2 + 56);
      int v22 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)int buf = 136446722;
      if (!v21) {
        int v21 = "[anonymous]";
      }
      int v29 = v21;
      __int16 v30 = 2080;
      CFIndex v31 = v11 + 1;
      __int16 v32 = 1024;
      int v33 = v22;
    }
    else
    {
      int v23 = *(const char **)(v2 + 56);
      if (!v23) {
        int v23 = "[anonymous]";
      }
      int v24 = *(_DWORD *)(a1 + 24);
      *(_DWORD *)int buf = 136446722;
      int v29 = v23;
      __int16 v30 = 2080;
      CFIndex v31 = v11 + 1;
      __int16 v32 = 1024;
      int v33 = v24;
    }
    int v25 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v26 = sub_10000BF78("_quire_attach_launch_agents", "quire.c", 937, "com.apple.security.cryptex", 21, v20, v25);
    free(v25);
    free(v11);
    *(void *)(a1 + 16) = v26;
    CFRelease(v20);
  }
  else
  {
LABEL_9:
    *(void *)(a1 + 16) = 0;
  }
}

uint64_t sub_100033C8C(void *a1, int a2)
{
  *((_DWORD *)sub_10003FD2C(a1, 0x28uLL) + 6) = a2;

  return cryptex_async_f();
}

void sub_100033CE4(void **a1)
{
  uint64_t v2 = *a1;
  if (*((_DWORD *)*a1 + 47))
  {
    uint64_t v3 = (const char *)v2[7];
    int v4 = *__error();
    int v5 = v2[9];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = "[anonymous]";
      if (v3) {
        uint64_t v6 = v3;
      }
      *(_DWORD *)int buf = 136446210;
      uint64_t v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s: Attempted to remove a Launch Agent that wasn't installed in a system cryptex.", buf, 0xCu);
    }
    *__error() = v4;
  }
  else
  {
    int v7 = (char *)v2[58];
    if (v7)
    {
      do
      {
        uint64_t v8 = *(char **)v7;
        if (*((_DWORD *)v7 + 322) == *((_DWORD *)a1 + 6))
        {
          uint64_t v9 = (const char *)v2[7];
          int v10 = *__error();
          uint64_t v11 = v2[9];
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v12 = v2[52];
            long long v13 = "[anonymous]";
            if (v9) {
              long long v13 = v9;
            }
            *(_DWORD *)int buf = 136446466;
            uint64_t v15 = v13;
            __int16 v16 = 2080;
            uint64_t v17 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s: Found a Launch Agent: %s - going to deactivate it.", buf, 0x16u);
          }
          *__error() = v10;
          sub_1000396C0(v7, v2);
        }
        int v7 = v8;
      }
      while (v8);
    }
  }
  sub_10003FE2C(a1);
}

xpc_object_t sub_100033E98(uint64_t a1, int a2, xpc_object_t object, uint64_t a4)
{
  *(_DWORD *)(a1 + 188) = a2;
  *(void *)(a1 + 192) = object;
  xpc_object_t result = xpc_retain(object);
  *(void *)(a1 + 368) = a4;
  return result;
}

uint64_t sub_100033ED0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 188);
}

uint64_t sub_100033ED8(uint64_t a1)
{
  return *(void *)(a1 + 416);
}

const char *sub_100033EE0(uint64_t a1)
{
  return xpc_string_get_string_ptr(*(xpc_object_t *)(a1 + 328));
}

uint64_t sub_100033EE8(uint64_t a1)
{
  return *(void *)(a1 + 344);
}

uint64_t sub_100033EF0(uint64_t a1)
{
  return *(void *)(a1 + 336);
}

uint64_t sub_100033EF8(uint64_t a1)
{
  return *(void *)(a1 + 208);
}

uint64_t sub_100033F00(uint64_t a1)
{
  return *(void *)(a1 + 224);
}

uint64_t sub_100033F08(uint64_t a1)
{
  return a1 + 208;
}

uint64_t sub_100033F10(uint64_t a1, int a2, xpc_object_t xstring)
{
  string_ptr = xpc_string_get_string_ptr(xstring);
  int v5 = (const char **)cryptex_content_type_parse();
  uint64_t v6 = *(const char **)(*(void *)(a1 + 32) + 16);
  int v7 = *__error();
  uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = "[anonymous]";
      int v10 = *v5;
      if (v6) {
        uint64_t v9 = v6;
      }
      int v13 = 136446466;
      long long v14 = v9;
      __int16 v15 = 2080;
      __int16 v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}s: populated content type to bootstrap: %s", (uint8_t *)&v13, 0x16u);
    }
    *__error() = v7;
    *(void *)(*(void *)(a1 + 40) + 112) |= (unint64_t)v5[2];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = "[anonymous]";
      int v13 = 136446722;
      if (v6) {
        uint64_t v11 = v6;
      }
      long long v14 = v11;
      __int16 v15 = 2080;
      __int16 v16 = string_ptr;
      __int16 v17 = 1024;
      int v18 = 22;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}s: invalid content type %s: %{darwin.errno}d", (uint8_t *)&v13, 0x1Cu);
    }
    *__error() = v7;
  }
  return 1;
}

void sub_1000340A0(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v6 = *(void **)(a1 + 48);
  int v4 = *(const void **)(a1 + 16);
  (*(void (**)(void *, void **, const void *, uint64_t))(a1 + 64))(v2, &v6, v4, v3);
  if (*(void *)(a1 + 48)) {
    BOOL v5 = v6 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5) {
    sub_1000445B4();
  }
  free(v6);
  sub_10003FE2C((void **)a1);
  if (v4) {
    CFRelease(v4);
  }
}

CFErrorRef sub_100034118(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 200) + 40);
  BOOL v5 = *(const char **)(a1 + 56);
  int v6 = *__error();
  int v7 = *(NSObject **)(a1 + 72);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v8)
    {
      CFErrorRef v26 = "[anonymous]";
      if (v5) {
        CFErrorRef v26 = v5;
      }
      *(_DWORD *)int buf = 136446210;
      int v51 = v26;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: Running in debug mode, skip trust cache", buf, 0xCu);
    }
    CFErrorRef v27 = 0;
    *__error() = v6;
  }
  else
  {
    if (v8)
    {
      uint64_t v9 = "[anonymous]";
      if (v5) {
        uint64_t v9 = v5;
      }
      *(_DWORD *)int buf = 136446210;
      int v51 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: loading trust cache", buf, 0xCu);
    }
    *__error() = v6;
    tc_uint64_t asset = cryptex_core_get_tc_asset();
    uint64_t asset = cryptex_core_get_asset();
    CFDictionaryRef v12 = sub_10002D45C(*(_DWORD *)(tc_asset + 16), *(_DWORD *)(asset + 16), *(NSObject **)(a1 + 72));
    if (v12)
    {
      CFDictionaryRef v13 = v12;
      if (!sub_10000C218(v12, @"com.apple.security.cryptex.posix", 6))
      {
        if (*(void *)(a1 + 72))
        {
          os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
          __int16 v28 = *(const char **)(a1 + 56);
          if (!v28) {
            __int16 v28 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446210;
          int v51 = v28;
        }
        else
        {
          char v41 = *(const char **)(a1 + 56);
          if (!v41) {
            char v41 = "[anonymous]";
          }
          *(_DWORD *)int buf = 136446210;
          int v51 = v41;
        }
        int v42 = (char *)_os_log_send_and_compose_impl();
        CFErrorRef v27 = sub_10000BF78("_quire_bootstrap_load_trust_cache", "quire.c", 1868, "com.apple.security.cryptex", 34, v13, v42);
        free(v42);
        goto LABEL_58;
      }
      long long v14 = *(const char **)(a1 + 56);
      int v15 = *__error();
      __int16 v16 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        __int16 v17 = "[anonymous]";
        if (v14) {
          __int16 v17 = v14;
        }
        *(_DWORD *)int buf = 136446210;
        int v51 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s: failed to load trust cache: device is locked", buf, 0xCu);
      }
      *__error() = v15;
      int v18 = MKBDeviceUnlockedSinceBoot();
      CFErrorRef v19 = *(const char **)(a1 + 56);
      int v20 = *__error();
      int v21 = *(NSObject **)(a1 + 72);
      if (v18 < 0)
      {
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          goto LABEL_32;
        }
        int v29 = "[anonymous]";
        if (v19) {
          int v29 = v19;
        }
        *(_DWORD *)int buf = 136446466;
        int v51 = v29;
        __int16 v52 = 1024;
        int v53 = v18;
        int v23 = "%{public}s: failed to get initial lock state: error = %d";
        int v24 = v21;
        os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      }
      else
      {
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_32;
        }
        int v22 = "[anonymous]";
        if (v19) {
          int v22 = v19;
        }
        *(_DWORD *)int buf = 136446466;
        int v51 = v22;
        __int16 v52 = 1024;
        int v53 = v18;
        int v23 = "%{public}s: initial unlock state: %d";
        int v24 = v21;
        os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
      }
      _os_log_impl((void *)&_mh_execute_header, v24, v25, v23, buf, 0x12u);
LABEL_32:
      *__error() = v20;
      __int16 v30 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_add, 0, 0, *(dispatch_queue_t *)(a1 + 24));
      dispatch_set_context(v30, a2);
      dispatch_source_set_event_handler_f(v30, (dispatch_function_t)sub_100034978);
      a2[4] = os_retain(v30);
      v49[1] = _NSConcreteStackBlock;
      v49[2] = 0x40000000;
      v49[3] = sub_100034AE8;
      v49[4] = &unk_10005B190;
      v49[5] = a1;
      v49[6] = v30;
      a2[3] = MKBEventsRegister();
      if (!v18 && MKBDeviceUnlockedSinceBoot() == 1)
      {
        CFIndex v31 = *(const char **)(a1 + 56);
        int v32 = *__error();
        int v33 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          int v34 = "[anonymous]";
          if (v31) {
            int v34 = v31;
          }
          *(_DWORD *)int buf = 136446210;
          int v51 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "%{public}s: first unlock during race window; firing source",
            buf,
            0xCu);
        }
        *__error() = v32;
        dispatch_source_merge_data(v30, 1uLL);
      }
      int v35 = MKBGetDeviceLockState();
      if ((v35 - 1) >= 3)
      {
        int v36 = v35;
        if (v35)
        {
          if (v35 >= 1) {
            sub_1000445D0(v49, buf);
          }
          int v43 = *(const char **)(a1 + 56);
          int v44 = *__error();
          int v45 = *(NSObject **)(a1 + 72);
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            CFErrorRef v46 = "[anonymous]";
            if (v43) {
              CFErrorRef v46 = v43;
            }
            *(_DWORD *)int buf = 136446466;
            int v51 = v46;
            __int16 v52 = 1024;
            int v53 = v36;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "%{public}s: failed to get lock state to de-bounce keybag event race: int error = %d", buf, 0x12u);
          }
          *__error() = v44;
        }
        else
        {
          uint64_t v37 = *(const char **)(a1 + 56);
          int v38 = *__error();
          unint64_t v39 = *(NSObject **)(a1 + 72);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            BOOL v40 = "[anonymous]";
            if (v37) {
              BOOL v40 = v37;
            }
            *(_DWORD *)int buf = 136446210;
            int v51 = v40;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%{public}s: device unlocked during race window; firing source",
              buf,
              0xCu);
          }
          *__error() = v38;
          dispatch_source_merge_data(v30, 1uLL);
        }
      }
      dispatch_activate(v30);
      *(_DWORD *)int buf = 67109120;
      LODWORD(v51) = 36;
      CFErrorRef v47 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef v27 = sub_10000BF78("_quire_handle_device_lock", "quire.c", 1813, "com.apple.security.cryptex.posix", 36, 0, v47);
      free(v47);
      if (v30) {
        os_release(v30);
      }
LABEL_58:
      CFRelease(v13);
      return v27;
    }
    return 0;
  }
  return v27;
}

uint64_t sub_100034810(uint64_t *a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = a1[2];
  uint64_t v3 = *(const char **)(*a1 + 56);
  int v4 = *__error();
  BOOL v5 = *(NSObject **)(v1 + 72);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v6)
    {
      int v7 = "[anonymous]";
      if (v3) {
        int v7 = v3;
      }
      int v10 = 136446210;
      uint64_t v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s: unwinding after bootstrap failure", (uint8_t *)&v10, 0xCu);
    }
    *__error() = v4;
    sub_100038DDC(v1);
    sub_1000390F8(v1);
  }
  else
  {
    if (v6)
    {
      BOOL v8 = "[anonymous]";
      if (v3) {
        BOOL v8 = v3;
      }
      int v10 = 136446210;
      uint64_t v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%{public}s: quire bootstrap succeeded", (uint8_t *)&v10, 0xCu);
    }
    *__error() = v4;
    *(void *)(v1 + 176) |= 2uLL;
  }
  return cryptex_target_async_f();
}

void sub_100034978(void *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[4];
  int v4 = *(const char **)(*a1 + 56);
  int v5 = *__error();
  BOOL v6 = *(NSObject **)(v2 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = "[anonymous]";
    if (v4) {
      int v7 = v4;
    }
    int v10 = 136446210;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: lock state source fired", (uint8_t *)&v10, 0xCu);
  }
  *__error() = v5;
  CFDictionaryRef v8 = (const __CFDictionary *)sub_100034118(v2, a1);
  CFDictionaryRef v9 = v8;
  if (v8)
  {
    if (sub_10000C218(v8, @"com.apple.security.cryptex.posix", 36)) {
      goto LABEL_10;
    }
    a1[2] = CFRetain(v9);
    CFDictionaryRef v8 = (const __CFDictionary *)CFRetain(v9);
  }
  else
  {
    a1[2] = 0;
  }
  *(void *)(v2 + 408) = v8;
  cryptex_async_f();
LABEL_10:
  dispatch_source_cancel(v3);
  a1[4] = 0;
  MKBEventsUnregister();
  a1[3] = 0;
  if (v3) {
    os_release(v3);
  }
  if (v9) {
    CFRelease(v9);
  }
}

void sub_100034AE8(uint64_t a1, unsigned int a2)
{
  int v4 = *(const char **)(*(void *)(a1 + 32) + 56);
  int v5 = *__error();
  BOOL v6 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = "[anonymous]";
    if (v4) {
      int v7 = v4;
    }
    int v8 = 136446466;
    CFDictionaryRef v9 = v7;
    __int16 v10 = 1024;
    unsigned int v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: keybag event; firing source: event = %#x",
      (uint8_t *)&v8,
      0x12u);
  }
  *__error() = v5;
  if (a2 <= 1) {
    dispatch_source_merge_data(*(dispatch_source_t *)(a1 + 40), 1uLL);
  }
}

uint64_t sub_100034BE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t **a4, uint64_t a5, void (*a6)(uint64_t, void *, uint64_t))
{
  if (a5 >= 1)
  {
    uint64_t v7 = a5;
    uint64_t v10 = a2;
    CFDictionaryRef v12 = &unk_100059488;
    do
    {
      uint64_t v13 = **a4;
      long long v14 = *(void **)(v13 + 48);
      if (v14 == v12)
      {
        if ((os_variant_has_internal_content() & 1) == 0)
        {
          uint64_t v15 = a3;
          __int16 v16 = a6;
          __int16 v17 = v12;
          int v18 = *(const char **)(a1 + 56);
          int v19 = *__error();
          int v20 = *(NSObject **)(a1 + 72);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            int v21 = "[anonymous]";
            if (v18) {
              int v21 = v18;
            }
            *(_DWORD *)int buf = 136446210;
            int v29 = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}s: trying to bootstrap internal content on non internal system", buf, 0xCu);
          }
          *__error() = v19;
          CFDictionaryRef v12 = v17;
          a6 = v16;
          a3 = v15;
          uint64_t v10 = a2;
        }
        long long v14 = *(void **)(v13 + 48);
      }
      if (v14 == &unk_1000594B8 && *(_DWORD *)(a1 + 188))
      {
        int v23 = *(const char **)(a1 + 56);
        int v24 = *__error();
        os_log_type_t v25 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          CFErrorRef v26 = "[anonymous]";
          if (v23) {
            CFErrorRef v26 = v23;
          }
          *(_DWORD *)int buf = 136446210;
          int v29 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%{public}s: not bootstrapping platform content for session", buf, 0xCu);
        }
        *__error() = v24;
      }
      else
      {
        uint64_t result = sub_10000B4F0(v13, a3, v10, a6, 0);
        if (result) {
          return result;
        }
      }
      ++a4;
      --v7;
    }
    while (v7);
  }
  return 0;
}

CFErrorRef sub_100034DF8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  bzero(v15, 0x400uLL);
  int v6 = realpath_np();
  if (v6)
  {
    int v7 = v6;
    if (*(void *)(v5 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR);
    }
    uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    CFIndex v11 = v7;
    int v12 = 1427;
LABEL_10:
    CFErrorRef v13 = sub_10000BF78("_quire_bootstrap_library", "quire.c", v12, "com.apple.security.cryptex.posix", v11, 0, v10);
    free(v10);
    return v13;
  }
  int v8 = sub_100007E04((uint64_t)v15, *((unsigned int *)a3 + 10), *(const char **)(a2 + 72), 6);
  if (v8)
  {
    int v9 = v8;
    if (*(void *)(v5 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR);
    }
    uint64_t v10 = (char *)_os_log_send_and_compose_impl();
    CFIndex v11 = v9;
    int v12 = 1436;
    goto LABEL_10;
  }
  return 0;
}

CFErrorRef sub_100035138(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  uint64_t v6 = _cryptex_content_type_factory[2] & *(void *)(*a3 + 320);
  int v7 = *(void **)(a1 + 48);
  BOOL v8 = v7 == &unk_100059488 || v7 == &unk_1000594B8;
  if (v8
    && (unsigned int v9 = sub_100010E60(*(void *)(v5 + 208), a3[6], *(void *)(a2 + 72), (uint64_t)"/", v6 != 0)) != 0)
  {
    signed int v10 = v9;
    if (*(void *)(v5 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR);
    }
    int v12 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v11 = sub_10000BF78("_quire_bootstrap_binary", "quire.c", 1523, "com.apple.security.cryptex.posix", v10, 0, v12);
    free(v12);
  }
  else
  {
    CFErrorRef v11 = 0;
  }
  unsigned int v13 = sub_100010E60(*(void *)(v5 + 208), a3[6], *(void *)(a2 + 72), a3[6], v6 != 0);
  if (v13)
  {
    signed int v14 = v13;
    if (*(void *)(v5 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR);
    }
    uint64_t v15 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v11 = sub_10000BF78("_quire_bootstrap_binary", "quire.c", 1531, "com.apple.security.cryptex.posix", v14, 0, v15);
    free(v15);
  }
  return v11;
}

CFErrorRef sub_1000354D0()
{
  __chkstk_darwin();
  uint64_t v1 = v0;
  uint64_t v3 = *v2;
  bzero(&v81, 0x878uLL);
  int v73 = 0;
  memset(v80, 0, 255);
  memset(v79, 0, 255);
  bzero(v78, 0x400uLL);
  bzero(from, 0x400uLL);
  bzero(to, 0x400uLL);
  bzero(__str, 0x400uLL);
  __s1 = 0;
  unsigned __int16 v71 = 0;
  int v4 = *(const char **)(v3 + 56);
  int v5 = *__error();
  uint64_t v6 = *(NSObject **)(v3 + 72);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = "[anonymous]";
    if (v4) {
      int v7 = v4;
    }
    int buf = 136446210;
    long long v83 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: bootstrapping diags", (uint8_t *)&buf, 0xCu);
  }
  *__error() = v5;
  if (statfs("/", &v81))
  {
    int v8 = *__error();
    unsigned int v9 = *(const char **)(v3 + 56);
    int v10 = *__error();
    CFErrorRef v11 = *(NSObject **)(v3 + 72);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_12:
      int v16 = -1;
      goto LABEL_13;
    }
    int v12 = "[anonymous]";
    if (v9) {
      int v12 = v9;
    }
    int buf = 136446466;
    long long v83 = v12;
    __int16 v84 = 1024;
    LODWORD(v85) = v8;
    unsigned int v13 = "%{public}s: failed to statfs root path: %{darwin.errno}d";
    goto LABEL_10;
  }
  sscanf(v81.f_mntfromname, "/dev/disk%d", &v73);
  snprintf(v80, 0xFFuLL, "disk%d", v73);
  if (sub_10000FED0())
  {
    int v18 = sub_100010388(640, &__s1, *(NSObject **)(v3 + 72));
    if (v18)
    {
      int v8 = v18;
      int v19 = *(const char **)(v3 + 56);
      int v20 = *__error();
      int v21 = *(NSObject **)(v3 + 72);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v22 = "[anonymous]";
        if (v19) {
          int v22 = v19;
        }
        int buf = 136446466;
        long long v83 = v22;
        __int16 v84 = 1024;
        LODWORD(v85) = v8;
        int v23 = "%{public}s: failed to copy diags volume formatter: %{darwin.errno}d";
LABEL_43:
        int v34 = v21;
        uint32_t v35 = 18;
LABEL_44:
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&buf, v35);
        goto LABEL_45;
      }
      goto LABEL_45;
    }
    if (!strstr(__s1, "cryptexd"))
    {
      int v32 = *(const char **)(v3 + 56);
      int v20 = *__error();
      int v21 = *(NSObject **)(v3 + 72);
      int v8 = 17;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        int v33 = "[anonymous]";
        if (v32) {
          int v33 = v32;
        }
        int buf = 136446466;
        long long v83 = v33;
        __int16 v84 = 1024;
        LODWORD(v85) = 17;
        int v23 = "%{public}s: diags volume already exists but not formatted by us: %{darwin.errno}d";
        goto LABEL_43;
      }
      goto LABEL_45;
    }
    if (access("/System/Volumes/Diags/AppleInternal/Diags", 1)
      || (snprintf(__str, 0x400uLL, "%s/.%s", "/System/Volumes/Diags/AppleInternal/Diags", *(const char **)(v3 + 208)),
          access(__str, 0)))
    {
      CFErrorRef v27 = *(const char **)(v3 + 56);
      int v20 = *__error();
      int v21 = *(NSObject **)(v3 + 72);
      int v8 = 17;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        __int16 v28 = "[anonymous]";
        if (v27) {
          __int16 v28 = v27;
        }
        int buf = 136446466;
        long long v83 = v28;
        __int16 v84 = 1024;
        LODWORD(v85) = 17;
        int v23 = "%{public}s: diags volume already created by another cryptex install. please uninstall it first: %{darwin.errno}d";
        goto LABEL_43;
      }
LABEL_45:
      *__error() = v20;
      int v16 = -1;
      goto LABEL_46;
    }
    int v45 = *(const char **)(v3 + 56);
    int v46 = *__error();
    CFErrorRef v47 = *(NSObject **)(v3 + 72);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    {
      BOOL v48 = "[anonymous]";
      if (v45) {
        BOOL v48 = v45;
      }
      int buf = 136446210;
      long long v83 = v48;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "%{public}s: diags volume already created", (uint8_t *)&buf, 0xCu);
    }
    *__error() = v46;
    *(void *)(v3 + 176) |= 0x20uLL;
    if (unlink("/AppleInternal/Diags") && *__error() != 2)
    {
      int v8 = *__error();
      int v56 = *(const char **)(v3 + 56);
      int v10 = *__error();
      CFErrorRef v11 = *(NSObject **)(v3 + 72);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      int v57 = "[anonymous]";
      if (v56) {
        int v57 = v56;
      }
      int buf = 136446466;
      long long v83 = v57;
      __int16 v84 = 1024;
      LODWORD(v85) = v8;
      unsigned int v13 = "%{public}s: failed to unlink diags symlink: %{darwin.errno}d";
    }
    else
    {
      if (!symlink("/System/Volumes/Diags/AppleInternal/Diags", "/AppleInternal/Diags") || *__error() == 17)
      {
        CFErrorRef v17 = 0;
        goto LABEL_55;
      }
      int v8 = *__error();
      int v58 = *(const char **)(v3 + 56);
      int v10 = *__error();
      CFErrorRef v11 = *(NSObject **)(v3 + 72);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      int v59 = "[anonymous]";
      if (v58) {
        int v59 = v58;
      }
      int buf = 136446466;
      long long v83 = v59;
      __int16 v84 = 1024;
      LODWORD(v85) = v8;
      unsigned int v13 = "%{public}s: failed to create symlink for diags: %{darwin.errno}d";
    }
LABEL_10:
    signed int v14 = v11;
    uint32_t v15 = 18;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&buf, v15);
    goto LABEL_12;
  }
  int v24 = sub_10000FF18((uint64_t)v80, "AppleInternalDiags", 640, &v71, *(NSObject **)(v3 + 72));
  if (v24)
  {
    int v8 = v24;
    os_log_type_t v25 = *(const char **)(v3 + 56);
    int v20 = *__error();
    int v21 = *(NSObject **)(v3 + 72);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      CFErrorRef v26 = "[anonymous]";
      if (v25) {
        CFErrorRef v26 = v25;
      }
      int buf = 136446466;
      long long v83 = v26;
      __int16 v84 = 1024;
      LODWORD(v85) = v8;
      int v23 = "%{public}s: failed to create diags volume: %{darwin.errno}d";
      goto LABEL_43;
    }
    goto LABEL_45;
  }
  *(void *)(v3 + 176) |= 0x20uLL;
  __strlcpy_chk();
  if (!mkdtemp(v78))
  {
    int v8 = *__error();
    unint64_t v39 = *(const char **)(v3 + 56);
    int v10 = *__error();
    CFErrorRef v11 = *(NSObject **)(v3 + 72);
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    BOOL v40 = "[anonymous]";
    if (v39) {
      BOOL v40 = v39;
    }
    int buf = 136446466;
    long long v83 = v40;
    __int16 v84 = 1024;
    LODWORD(v85) = v8;
    unsigned int v13 = "%{public}s: failed to create temporary mount point: %{darwin.errno}d";
    goto LABEL_10;
  }
  snprintf(v79, 0xFFuLL, "/dev/%ss%d", v80, v71);
  int v29 = sub_1000100CC(v79, (uint64_t)v78, *(NSObject **)(v3 + 72));
  if (v29)
  {
    int v8 = v29;
    __int16 v30 = *(const char **)(v3 + 56);
    int v20 = *__error();
    int v21 = *(NSObject **)(v3 + 72);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      CFIndex v31 = "[anonymous]";
      if (v30) {
        CFIndex v31 = v30;
      }
      int buf = 136446466;
      long long v83 = v31;
      __int16 v84 = 1024;
      LODWORD(v85) = v8;
      int v23 = "%{public}s: failed to mount diags volume: %{darwin.errno}d";
      goto LABEL_43;
    }
    goto LABEL_45;
  }
  snprintf(from, 0x400uLL, "%s/%s", *(const char **)(v3 + 416), *(const char **)(v1 + 72));
  snprintf(to, 0x400uLL, "%s/%s", v78, "AppleInternal");
  int v41 = mkdir(to, 0x1FFu);
  if (v41)
  {
    int v8 = v41;
    int v42 = *(const char **)(v3 + 56);
    int v20 = *__error();
    int v43 = *(NSObject **)(v3 + 72);
    if (!os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      goto LABEL_45;
    }
    int v44 = "[anonymous]";
    int buf = 136446722;
    if (v42) {
      int v44 = v42;
    }
    long long v83 = v44;
    __int16 v84 = 2080;
    signed int v85 = to;
    __int16 v86 = 1024;
    LODWORD(v87) = v8;
    int v23 = "%{public}s: failed to mkdir %s: %{darwin.errno}d";
    int v34 = v43;
    uint32_t v35 = 28;
    goto LABEL_44;
  }
  if (copyfile(from, to, 0, 0xC8008u))
  {
    int v8 = *__error();
    int v49 = *(const char **)(v3 + 56);
    int v10 = *__error();
    int v50 = *(NSObject **)(v3 + 72);
    if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v51 = "[anonymous]";
    int buf = 136446978;
    if (v49) {
      int v51 = v49;
    }
    long long v83 = v51;
    __int16 v84 = 2080;
    signed int v85 = from;
    __int16 v86 = 2080;
    int v87 = to;
    __int16 v88 = 1024;
    int v89 = v8;
    unsigned int v13 = "%{public}s: failed to copyfile from %s to %s: %{darwin.errno}d";
    signed int v14 = v50;
    uint32_t v15 = 38;
    goto LABEL_11;
  }
  snprintf(__str, 0x400uLL, "%s/%s/.%s", v78, *(const char **)(v1 + 72), *(const char **)(v3 + 208));
  int v16 = open(__str, 512, 420);
  if (v16 < 0)
  {
    int v8 = *__error();
    int v60 = *(const char **)(v3 + 56);
    int v10 = *__error();
    char v61 = *(NSObject **)(v3 + 72);
    if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    char v62 = "[anonymous]";
    int buf = 136446722;
    if (v60) {
      char v62 = v60;
    }
    long long v83 = v62;
    __int16 v84 = 2080;
    signed int v85 = __str;
    __int16 v86 = 1024;
    LODWORD(v87) = v8;
    unint64_t v63 = "%{public}s: failed to open %s: %{darwin.errno}d";
    int v64 = v61;
    uint32_t v65 = 28;
    goto LABEL_111;
  }
  if (unlink("/AppleInternal/Diags") && *__error() != 2)
  {
    int v8 = *__error();
    uint64_t v66 = *(const char **)(v3 + 56);
    int v10 = *__error();
    int v67 = *(NSObject **)(v3 + 72);
    if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    uint64_t v68 = "[anonymous]";
    if (v66) {
      uint64_t v68 = v66;
    }
    int buf = 136446466;
    long long v83 = v68;
    __int16 v84 = 1024;
    LODWORD(v85) = v8;
    unint64_t v63 = "%{public}s: failed to unlink diags symlink: %{darwin.errno}d";
LABEL_110:
    int v64 = v67;
    uint32_t v65 = 18;
LABEL_111:
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_ERROR, v63, (uint8_t *)&buf, v65);
LABEL_13:
    *__error() = v10;
    if (!v8)
    {
      CFErrorRef v17 = 0;
      goto LABEL_53;
    }
LABEL_46:
    if (*(void *)(v3 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR);
      int v36 = *(const char **)(v3 + 56);
      if (!v36) {
        int v36 = "[anonymous]";
      }
    }
    else
    {
      int v36 = *(const char **)(v3 + 56);
      if (!v36) {
        int v36 = "[anonymous]";
      }
    }
    int buf = 136446466;
    long long v83 = v36;
    __int16 v84 = 1024;
    LODWORD(v85) = v8;
    uint64_t v37 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v17 = sub_10000BF78("_quire_bootstrap_diags", "quire.c", 2037, "com.apple.security.cryptex.posix", v8, 0, v37);
    free(v37);
LABEL_53:
    if (v16 == -1) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
  snprintf(to, 0x400uLL, "%s/%s", v78, *(const char **)(v1 + 72));
  if (symlink(to, "/AppleInternal/Diags") && *__error() != 17)
  {
    int v8 = *__error();
    uint64_t v69 = *(const char **)(v3 + 56);
    int v10 = *__error();
    int v67 = *(NSObject **)(v3 + 72);
    if (!os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
      goto LABEL_13;
    }
    uint64_t v70 = "[anonymous]";
    if (v69) {
      uint64_t v70 = v69;
    }
    int buf = 136446466;
    long long v83 = v70;
    __int16 v84 = 1024;
    LODWORD(v85) = v8;
    unint64_t v63 = "%{public}s: failed to create symlink for diags: %{darwin.errno}d";
    goto LABEL_110;
  }
  __int16 v52 = *(const char **)(v3 + 56);
  int v53 = *__error();
  __int16 v54 = *(NSObject **)(v3 + 72);
  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
  {
    int v55 = "[anonymous]";
    if (v52) {
      int v55 = v52;
    }
    int buf = 136446210;
    long long v83 = v55;
    _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEBUG, "%{public}s: bootstrap diags successfully", (uint8_t *)&buf, 0xCu);
  }
  CFErrorRef v17 = 0;
  *__error() = v53;
LABEL_54:
  if (close(v16) == -1) {
    sub_100043820(&v74, &buf);
  }
LABEL_55:
  free(__s1);
  return v17;
}

CFErrorRef sub_1000361F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  bzero(v32, 0x400uLL);
  int v5 = realpath_np();
  if (v5)
  {
    int v6 = v5;
    if (*(void *)(v4 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR);
      int v7 = *(const char **)(v4 + 56);
      uint64_t v8 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      if (!v7) {
        int v7 = "[anonymous]";
      }
      CFErrorRef v27 = v7;
      __int16 v28 = 2080;
      uint64_t v29 = v8;
      __int16 v30 = 1024;
      int v31 = v6;
    }
    else
    {
      unsigned int v13 = *(const char **)(v4 + 56);
      if (!v13) {
        unsigned int v13 = "[anonymous]";
      }
      uint64_t v14 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      CFErrorRef v27 = v13;
      __int16 v28 = 2080;
      uint64_t v29 = v14;
      __int16 v30 = 1024;
      int v31 = v5;
    }
    uint32_t v15 = (char *)_os_log_send_and_compose_impl();
    CFIndex v16 = v6;
    int v17 = 1566;
LABEL_16:
    CFErrorRef v18 = sub_10000BF78("_quire_bootstrap_luacore_lib", "quire.c", v17, "com.apple.security.cryptex.posix", v16, 0, v15);
    free(v15);
    return v18;
  }
  if (access(*(const char **)(a2 + 72), 0))
  {
    int v9 = sub_1000079CC((uint64_t)v32, *(const char **)(a2 + 72), 6);
    if (!v9) {
      return 0;
    }
    int v10 = v9;
    if (*(void *)(v4 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR);
      CFErrorRef v11 = *(const char **)(v4 + 56);
      uint64_t v12 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      if (!v11) {
        CFErrorRef v11 = "[anonymous]";
      }
      CFErrorRef v27 = v11;
      __int16 v28 = 2080;
      uint64_t v29 = v12;
      __int16 v30 = 1024;
      int v31 = v10;
    }
    else
    {
      int v24 = *(const char **)(v4 + 56);
      if (!v24) {
        int v24 = "[anonymous]";
      }
      uint64_t v25 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      CFErrorRef v27 = v24;
      __int16 v28 = 2080;
      uint64_t v29 = v25;
      __int16 v30 = 1024;
      int v31 = v9;
    }
    uint32_t v15 = (char *)_os_log_send_and_compose_impl();
    CFIndex v16 = v10;
    int v17 = 1578;
    goto LABEL_16;
  }
  int v20 = *(const char **)(v4 + 56);
  int v21 = *__error();
  int v22 = *(NSObject **)(v4 + 72);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    int v23 = "[anonymous]";
    if (v20) {
      int v23 = v20;
    }
    *(_DWORD *)int buf = 136446210;
    CFErrorRef v27 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%{public}s: symlink exists, skipping", buf, 0xCu);
  }
  CFErrorRef v18 = 0;
  *__error() = v21;
  return v18;
}

CFErrorRef sub_1000365AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  bzero(v15, 0x400uLL);
  int v6 = realpath_np();
  if (v6)
  {
    int v7 = v6;
    if (*(void *)(v5 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR);
    }
    int v10 = (char *)_os_log_send_and_compose_impl();
    CFIndex v11 = v7;
    int v12 = 1601;
LABEL_10:
    CFErrorRef v13 = sub_10000BF78("_quire_bootstrap_python_lib", "quire.c", v12, "com.apple.security.cryptex.posix", v11, 0, v10);
    free(v10);
    return v13;
  }
  int v8 = sub_100007E04((uint64_t)v15, *((unsigned int *)a3 + 10), *(const char **)(a2 + 72), 6);
  if (v8)
  {
    int v9 = v8;
    if (*(void *)(v5 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR);
    }
    int v10 = (char *)_os_log_send_and_compose_impl();
    CFIndex v11 = v9;
    int v12 = 1610;
    goto LABEL_10;
  }
  return 0;
}

CFErrorRef sub_1000368EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  bzero(v32, 0x400uLL);
  int v5 = realpath_np();
  if (v5)
  {
    int v6 = v5;
    if (*(void *)(v4 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR);
      int v7 = *(const char **)(v4 + 56);
      uint64_t v8 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      if (!v7) {
        int v7 = "[anonymous]";
      }
      CFErrorRef v27 = v7;
      __int16 v28 = 2080;
      uint64_t v29 = v8;
      __int16 v30 = 1024;
      int v31 = v6;
    }
    else
    {
      CFErrorRef v13 = *(const char **)(v4 + 56);
      if (!v13) {
        CFErrorRef v13 = "[anonymous]";
      }
      uint64_t v14 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      CFErrorRef v27 = v13;
      __int16 v28 = 2080;
      uint64_t v29 = v14;
      __int16 v30 = 1024;
      int v31 = v5;
    }
    uint32_t v15 = (char *)_os_log_send_and_compose_impl();
    CFIndex v16 = v6;
    int v17 = 1632;
LABEL_16:
    CFErrorRef v18 = sub_10000BF78("_quire_bootstrap_astro", "quire.c", v17, "com.apple.security.cryptex.posix", v16, 0, v15);
    free(v15);
    return v18;
  }
  if (access(*(const char **)(a2 + 72), 0))
  {
    int v9 = sub_1000079CC((uint64_t)v32, *(const char **)(a2 + 72), 6);
    if (!v9) {
      return 0;
    }
    int v10 = v9;
    if (*(void *)(v4 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR);
      CFIndex v11 = *(const char **)(v4 + 56);
      uint64_t v12 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      if (!v11) {
        CFIndex v11 = "[anonymous]";
      }
      CFErrorRef v27 = v11;
      __int16 v28 = 2080;
      uint64_t v29 = v12;
      __int16 v30 = 1024;
      int v31 = v10;
    }
    else
    {
      int v24 = *(const char **)(v4 + 56);
      if (!v24) {
        int v24 = "[anonymous]";
      }
      uint64_t v25 = *(void *)(a2 + 72);
      *(_DWORD *)int buf = 136446722;
      CFErrorRef v27 = v24;
      __int16 v28 = 2080;
      uint64_t v29 = v25;
      __int16 v30 = 1024;
      int v31 = v9;
    }
    uint32_t v15 = (char *)_os_log_send_and_compose_impl();
    CFIndex v16 = v10;
    int v17 = 1644;
    goto LABEL_16;
  }
  int v20 = *(const char **)(v4 + 56);
  int v21 = *__error();
  int v22 = *(NSObject **)(v4 + 72);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    int v23 = "[anonymous]";
    if (v20) {
      int v23 = v20;
    }
    *(_DWORD *)int buf = 136446210;
    CFErrorRef v27 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%{public}s: symlink exists, skipping", buf, 0xCu);
  }
  CFErrorRef v18 = 0;
  *__error() = v21;
  return v18;
}

CFErrorRef sub_100036CA8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  bzero(from, 0x400uLL);
  int v4 = realpath_np();
  if (v4)
  {
    int v5 = v4;
    if (*(void *)(v3 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR);
    }
    int v7 = (char *)_os_log_send_and_compose_impl();
    CFIndex v8 = v5;
    int v9 = 1478;
LABEL_10:
    CFErrorRef v10 = sub_10000BF78("_quire_bootstrap_log_plists", "quire.c", v9, "com.apple.security.cryptex.posix", v8, 0, v7);
    free(v7);
    return v10;
  }
  if (copyfile(from, "/Library/Preferences/Logging/Subsystems/", 0, 0xE8008u))
  {
    CFIndex v6 = *__error();
    if (*(void *)(v3 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR);
    }
    __error();
    int v7 = (char *)_os_log_send_and_compose_impl();
    int v9 = 1485;
    CFIndex v8 = v6;
    goto LABEL_10;
  }
  return 0;
}

CFErrorRef sub_100037004(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3 = *a3;
  bzero(from, 0x400uLL);
  int v4 = realpath_np();
  if (v4)
  {
    int v5 = v4;
    if (*(void *)(v3 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR);
    }
    int v7 = (char *)_os_log_send_and_compose_impl();
    CFIndex v8 = v5;
    int v9 = 2130;
LABEL_10:
    CFErrorRef v10 = sub_10000BF78("_quire_bootstrap_feature_flags_domain", "quire.c", v9, "com.apple.security.cryptex.posix", v8, 0, v7);
    free(v7);
    return v10;
  }
  if (copyfile(from, "/Library/FeatureFlags/Domain/", 0, 0xE8008u))
  {
    CFIndex v6 = *__error();
    if (*(void *)(v3 + 72)) {
      os_log_type_enabled(*(os_log_t *)(v3 + 72), OS_LOG_TYPE_ERROR);
    }
    __error();
    int v7 = (char *)_os_log_send_and_compose_impl();
    int v9 = 2137;
    CFIndex v8 = v6;
    goto LABEL_10;
  }
  return 0;
}

CFTypeRef sub_100037360(uint64_t a1, int a2)
{
  if (_vproc_set_global_on_demand())
  {
    if (*(void *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      int v4 = *(const char **)(a1 + 56);
      if (!v4) {
        int v4 = "[anonymous]";
      }
      int v5 = "set";
      if (!a2) {
        int v5 = "clear";
      }
    }
    else
    {
      int v4 = *(const char **)(a1 + 56);
      if (!v4) {
        int v4 = "[anonymous]";
      }
      int v5 = "set";
      if (!a2) {
        int v5 = "clear";
      }
    }
    *(_DWORD *)int buf = 136446466;
    int v17 = v4;
    __int16 v18 = 2080;
    int v19 = v5;
    CFErrorRef v13 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v14 = sub_10000BF78("_quire_globally_toggle_runatload_jobs", "quire.c", 1188, "com.apple.security.cryptex", 35, 0, v13);
    free(v13);
    if (v14)
    {
      CFTypeRef v12 = CFRetain(v14);
      CFRelease(v14);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    CFIndex v6 = *(const char **)(a1 + 56);
    int v7 = *__error();
    CFIndex v8 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = "[anonymous]";
      if (v6) {
        int v9 = v6;
      }
      CFErrorRef v10 = "Unsuppressing";
      if (a2) {
        CFErrorRef v10 = "Suppressing";
      }
      *(_DWORD *)int buf = 136446722;
      int v17 = v9;
      CFIndex v11 = "setting";
      __int16 v18 = 2080;
      int v19 = v10;
      if (!a2) {
        CFIndex v11 = "clearing";
      }
      __int16 v20 = 2080;
      int v21 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}s: %s RunAtLoad jobs by %s global on-demand bit in launchd", buf, 0x20u);
    }
    CFTypeRef v12 = 0;
    *__error() = v7;
  }
  return v12;
}

CFErrorRef sub_10003760C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = *a3;
  CFIndex v6 = malloc_type_calloc(1uLL, 0xC0uLL, 0x61D5536CuLL);
  if (!v6) {
    sub_100044658(&v44, buf);
  }
  int v7 = (int *)v6;
  *((_OWORD *)v6 + 8) = 0u;
  CFIndex v8 = v6 + 16;
  v6[22] = 0;
  *((_OWORD *)v6 + snprintf(byte_10005E420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = 0u;
  *((_OWORD *)v6 + 10) = 0u;
  int v9 = *(const char **)(v5 + 56);
  int v10 = *__error();
  CFIndex v11 = *(NSObject **)(v5 + 72);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    CFTypeRef v12 = "[anonymous]";
    uint64_t v13 = *(void *)(a2 + 56);
    if (v9) {
      CFTypeRef v12 = v9;
    }
    *(_DWORD *)int buf = 136446466;
    int v46 = v12;
    __int16 v47 = 2080;
    uint64_t v48 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%{public}s: _quire_bootstrap_agents: bootstrapping agent: %s", buf, 0x16u);
  }
  *__error() = v10;
  int v14 = *(_DWORD *)(v5 + 188);
  if (v14)
  {
    uint64_t v15 = *(void *)(v5 + 192);
    if (v15) {
      uint64_t v16 = 40;
    }
    else {
      uint64_t v16 = 8;
    }
    if (!v15)
    {
      uint64_t v15 = 0;
      int v14 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
    uint64_t v16 = 8;
  }
  *((void *)v7 + 1) = 0;
  *((void *)v7 + 2) = *(void *)(v5 + 416);
  *((void *)v7 + 12) = 0;
  v7[26] = v14;
  *((void *)v7 + 14) = *(void *)(v5 + 72);
  *((void *)v7 + 15) = v15;
  int v17 = *(_DWORD *)(v5 + 176);
  __int16 v18 = *(void **)(v5 + 472);
  if (v18)
  {
    uint64_t v19 = v7[22];
    __int16 v20 = &v7[2 * v19 + 6];
    do
    {
      *(void *)__int16 v20 = *(void *)(*v18 + 416);
      v20 += 2;
      __int16 v18 = (void *)v18[1];
      LODWORD(v1snprintf(byte_10005E420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v19 + 1;
    }
    while (v18);
    v7[22] = v19;
  }
  int v21 = *(const char **)(v5 + 56);
  int v22 = *__error();
  int v23 = *(NSObject **)(v5 + 72);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    int v24 = "[anonymous]";
    uint64_t v25 = *(void *)(a2 + 56);
    if (v21) {
      int v24 = v21;
    }
    *(_DWORD *)int buf = 136446466;
    int v46 = v24;
    __int16 v47 = 2080;
    uint64_t v48 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%{public}s: bootstrapping agent: %s", buf, 0x16u);
  }
  *__error() = v22;
  int v26 = sub_10003F01C(*(_DWORD *)(a2 + 80), v8);
  if (v26)
  {
    int v27 = v26;
    __int16 v28 = *(const char **)(v5 + 56);
    int v29 = *__error();
    __int16 v30 = *(NSObject **)(v5 + 72);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      int v31 = "[anonymous]";
      if (v28) {
        int v31 = v28;
      }
      *(_DWORD *)int buf = 136446466;
      int v46 = v31;
      __int16 v47 = 1024;
      LODWORD(v48) = v27;
      int v32 = "%{public}s: failed to read plist: %{darwin.errno}d";
LABEL_32:
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, v32, buf, 0x12u);
    }
  }
  else
  {
    *(void *)int v7 = *(void *)(v5 + 456);
    *(void *)(v5 + 456) = v7;
    *((void *)v7 + 1) = (16 * (v17 & 1)) | v16;
    sub_100038858(v5);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 0x40000000;
    v43[2] = sub_100038894;
    v43[3] = &unk_10005B1B0;
    v43[4] = v5;
    int v33 = sub_10000F298(v43, (uint64_t)a3);
    if (!v33) {
      return 0;
    }
    int v27 = v33;
    int v34 = *(const char **)(v5 + 56);
    int v29 = *__error();
    __int16 v30 = *(NSObject **)(v5 + 72);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint32_t v35 = "[anonymous]";
      if (v34) {
        uint32_t v35 = v34;
      }
      *(_DWORD *)int buf = 136446466;
      int v46 = v35;
      __int16 v47 = 1024;
      LODWORD(v48) = v27;
      int v32 = "%{public}s: launchagent bootstrap failed: %{darwin.errno}d";
      goto LABEL_32;
    }
  }
  *__error() = v29;
  sub_10003FA64(v8);
  free(v7);
  if (*(void *)(v5 + 72))
  {
    os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_ERROR);
    int v36 = *(const char **)(v5 + 56);
    uint64_t v37 = *(void *)(a2 + 56);
    *(_DWORD *)int buf = 136446722;
    if (!v36) {
      int v36 = "[anonymous]";
    }
    int v46 = v36;
    __int16 v47 = 2080;
    uint64_t v48 = v37;
    __int16 v49 = 1024;
    int v50 = v27;
  }
  else
  {
    int v38 = *(const char **)(v5 + 56);
    if (!v38) {
      int v38 = "[anonymous]";
    }
    uint64_t v39 = *(void *)(a2 + 56);
    *(_DWORD *)int buf = 136446722;
    int v46 = v38;
    __int16 v47 = 2080;
    uint64_t v48 = v39;
    __int16 v49 = 1024;
    int v50 = v27;
  }
  BOOL v40 = (char *)_os_log_send_and_compose_impl();
  CFErrorRef v41 = sub_10000BF78("_quire_bootstrap_agents", "quire.c", 1051, "com.apple.security.cryptex.posix", v27, 0, v40);
  free(v40);
  return v41;
}

CFErrorRef sub_100037B10(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = *a3;
  uint64_t v45 = 0;
  memset(v44, 0, sizeof(v44));
  uint64_t v5 = *(const char **)(v4 + 56);
  int v6 = *__error();
  int v7 = *(NSObject **)(v4 + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (v5) {
      CFIndex v8 = v5;
    }
    else {
      CFIndex v8 = "[anonymous]";
    }
    uint64_t v9 = *(void *)(a2 + 56);
    LODWORD(buf[0]) = 136446466;
    *(void *)((char *)buf + 4) = v8;
    WORD2(buf[1]) = 2080;
    *(void *)((char *)&buf[1] + 6) = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%{public}s: _quire_bootstrap_service: bootstrapping service: %s", (uint8_t *)buf, 0x16u);
  }
  *__error() = v6;
  int v10 = *(_DWORD *)(v4 + 188);
  if (v10)
  {
    uint64_t v11 = *(void *)(v4 + 192);
    if (v11)
    {
      uint64_t v12 = 40;
      goto LABEL_12;
    }
    int v10 = 0;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v12 = 8;
LABEL_12:
  if ((_cryptex_content_type_factory[2] & *(void *)(v4 + 320)) != 0) {
    uint64_t v13 = v12 | 0x40;
  }
  else {
    uint64_t v13 = v12;
  }
  uint64_t v52 = 0;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  memset(buf, 0, sizeof(buf));
  buf[1] = *(void *)(v4 + 416);
  LODWORD(v52) = v10;
  uint64_t v53 = *(void *)(v4 + 72);
  uint64_t v54 = v11;
  int v14 = *(_DWORD *)(v4 + 176);
  uint64_t v15 = *(void **)(v4 + 472);
  if (v15)
  {
    uint64_t v16 = 0;
    do
    {
      buf[v16++ + 2] = *(void *)(*v15 + 416);
      uint64_t v15 = (void *)v15[1];
    }
    while (v15);
    LODWORD(v51) = v16;
  }
  unint64_t v17 = *(unsigned int *)(*(void *)(v4 + 200) + 40);
  __int16 v18 = *(const char **)(v4 + 56);
  int v19 = *__error();
  __int16 v20 = *(NSObject **)(v4 + 72);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    if (v18) {
      int v21 = v18;
    }
    else {
      int v21 = "[anonymous]";
    }
    uint64_t v22 = *(void *)(a2 + 56);
    *(_DWORD *)int v55 = 136446466;
    int v56 = v21;
    __int16 v57 = 2080;
    uint64_t v58 = v22;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}s: bootstrapping service: %s", v55, 0x16u);
  }
  *__error() = v19;
  int v23 = sub_10003F01C(*(_DWORD *)(a2 + 80), v44);
  if (v23)
  {
    int v24 = v23;
    uint64_t v25 = *(const char **)(v4 + 56);
    int v26 = *__error();
    int v27 = *(NSObject **)(v4 + 72);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      if (v25) {
        __int16 v28 = v25;
      }
      else {
        __int16 v28 = "[anonymous]";
      }
      *(_DWORD *)int v55 = 136446466;
      int v56 = v28;
      __int16 v57 = 1024;
      LODWORD(v58) = v24;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%{public}s: failed to read plist: %{darwin.errno}d", v55, 0x12u);
    }
    *__error() = v26;
    sub_10003FA64(v44);
    if (*(void *)(v4 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR);
      int v29 = *(const char **)(v4 + 56);
      uint64_t v30 = *(void *)(a2 + 56);
      if (!v29) {
        int v29 = "[anonymous]";
      }
      *(_DWORD *)int v55 = 136446722;
      int v56 = v29;
      __int16 v57 = 2080;
      uint64_t v58 = v30;
      __int16 v59 = 1024;
      int v60 = v24;
    }
    else
    {
      int v36 = *(const char **)(v4 + 56);
      if (!v36) {
        int v36 = "[anonymous]";
      }
      uint64_t v37 = *(void *)(a2 + 56);
      *(_DWORD *)int v55 = 136446722;
      int v56 = v36;
      __int16 v57 = 2080;
      uint64_t v58 = v37;
      __int16 v59 = 1024;
      int v60 = v24;
    }
    int v38 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v39 = sub_10000BF78("_quire_bootstrap_service", "quire.c", 908, "com.apple.security.cryptex.posix", v24, 0, v38);
    free(v38);
  }
  else
  {
    buf[0] = ((16 * (v14 & 1)) | v13) & 0xFFFFFFFFFFFFFF7FLL | (((v17 >> 1) & 1) << 7);
    int v31 = malloc_type_calloc(1uLL, 0x490uLL, 0x61D5536CuLL);
    if (!v31) {
      sub_1000446F8(&v46, v55);
    }
    int v32 = v31;
    CFErrorRef v33 = sub_1000144A4((uint64_t)v44, buf, (uint64_t)(v31 + 1), *(void *)(v4 + 368));
    if (v33)
    {
      if (*(void *)(v4 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(v4 + 72), OS_LOG_TYPE_ERROR);
        int v34 = *(const char **)(v4 + 56);
        uint64_t v35 = *(void *)(a2 + 56);
        if (!v34) {
          int v34 = "[anonymous]";
        }
        *(_DWORD *)int v55 = 136446466;
        int v56 = v34;
        __int16 v57 = 2080;
        uint64_t v58 = v35;
      }
      else
      {
        BOOL v40 = *(const char **)(v4 + 56);
        if (!v40) {
          BOOL v40 = "[anonymous]";
        }
        uint64_t v41 = *(void *)(a2 + 56);
        *(_DWORD *)int v55 = 136446466;
        int v56 = v40;
        __int16 v57 = 2080;
        uint64_t v58 = v41;
      }
      int v42 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef v39 = sub_10000BF78("_quire_bootstrap_service", "quire.c", 893, "com.apple.security.cryptex", 14, v33, v42);
      free(v42);
    }
    else
    {
      *int v32 = *(void *)(v4 + 448);
      *(void *)(v4 + 448) = v32;
      sub_100038858(v4);
      int v32 = 0;
      CFErrorRef v39 = 0;
    }
    sub_10003FA64(v44);
    free(v32);
    if (v33) {
      CFRelease(v33);
    }
  }
  return v39;
}

CFErrorRef sub_1000380C4(uint64_t a1)
{
  uint64_t v34 = 0;
  CFErrorRef v35 = 0;
  memset(v33, 0, sizeof(v33));
  CFTypeRef cf = 0;
  uint64_t v2 = 0;
  CFErrorRef v3 = 0;
  if (!sub_100007F8C(&v35)) {
    goto LABEL_25;
  }
  info_uint64_t asset = cryptex_core_get_info_asset();
  if (!info_asset)
  {
    uint64_t v2 = 0;
    goto LABEL_9;
  }
  int v5 = sub_10003F01C(*(_DWORD *)(info_asset + 16), v33);
  if (v5)
  {
    int v6 = v5;
    if (*(void *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      int v7 = *(const char **)(a1 + 56);
      if (!v7) {
        int v7 = "[anonymous]";
      }
      int v36 = 136446466;
      uint64_t v37 = v7;
      __int16 v38 = 1024;
      int v39 = v6;
    }
    else
    {
      int v10 = *(const char **)(a1 + 56);
      if (!v10) {
        int v10 = "[anonymous]";
      }
      int v36 = 136446466;
      uint64_t v37 = v10;
      __int16 v38 = 1024;
      int v39 = v5;
    }
    uint64_t v11 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v12 = sub_10000BF78("_quire_bootstrap_watchdog_registration", "quire.c", 1222, "com.apple.security.cryptex.posix", v6, 0, v11);
    free(v11);
    uint64_t v2 = 0;
LABEL_24:
    CFErrorRef v3 = 0;
    CFErrorRef v35 = v12;
    goto LABEL_25;
  }
  CFIndex v8 = (void *)xpc_create_from_plist();
  uint64_t v2 = v8;
  if (!v8 || xpc_get_type(v8) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (*(void *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      uint64_t v9 = *(const char **)(a1 + 56);
      if (!v9) {
        uint64_t v9 = "[anonymous]";
      }
      int v36 = 136446210;
      uint64_t v37 = v9;
    }
    else
    {
      uint64_t v13 = *(const char **)(a1 + 56);
      if (!v13) {
        uint64_t v13 = "[anonymous]";
      }
      int v36 = 136446210;
      uint64_t v37 = v13;
    }
    int v14 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v12 = sub_10000BF78("_quire_bootstrap_watchdog_registration", "quire.c", 1228, "com.apple.security.cryptex", 11, 0, v14);
    free(v14);
    goto LABEL_24;
  }
  unint64_t v17 = (__CFError *)sub_1000081EC(v2, &cf);
  if (v17)
  {
    CFErrorRef v3 = v17;
    if (*(void *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      __int16 v18 = *(const char **)(a1 + 56);
      if (!v18) {
        __int16 v18 = "[anonymous]";
      }
      int v36 = 136446210;
      uint64_t v37 = v18;
    }
    else
    {
      uint64_t v22 = *(const char **)(a1 + 56);
      if (!v22) {
        uint64_t v22 = "[anonymous]";
      }
      int v36 = 136446210;
      uint64_t v37 = v22;
    }
    int v23 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v24 = sub_10000BF78("_quire_bootstrap_watchdog_registration", "quire.c", 1234, "com.apple.security.cryptex", 11, v3, v23);
    free(v23);
    CFErrorRef v35 = v24;
    goto LABEL_25;
  }
  if (!cf || CFArrayGetCount((CFArrayRef)cf) < 1)
  {
LABEL_9:
    CFErrorRef v3 = 0;
LABEL_25:
    sub_10003FA64(v33);
    CFErrorRef v15 = v35;
    goto LABEL_26;
  }
  CFArrayRef v19 = (const __CFArray *)sub_1000094D8((void *)cf);
  CFErrorRef v20 = sub_10003890C(a1, v19);
  if (v20)
  {
    CFErrorRef v3 = v20;
    if (*(void *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      int v21 = *(const char **)(a1 + 56);
      if (!v21) {
        int v21 = "[anonymous]";
      }
      int v36 = 136446210;
      uint64_t v37 = v21;
    }
    else
    {
      int v26 = *(const char **)(a1 + 56);
      if (!v26) {
        int v26 = "[anonymous]";
      }
      int v36 = 136446210;
      uint64_t v37 = v26;
    }
    int v27 = (char *)_os_log_send_and_compose_impl();
    int v28 = 1242;
    CFIndex v29 = 11;
  }
  else
  {
    CFErrorRef v3 = sub_100009624((void *)cf);
    if (!v3) {
      goto LABEL_63;
    }
    if (*(void *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      uint64_t v25 = *(const char **)(a1 + 56);
      if (!v25) {
        uint64_t v25 = "[anonymous]";
      }
      int v36 = 136446210;
      uint64_t v37 = v25;
    }
    else
    {
      uint64_t v30 = *(const char **)(a1 + 56);
      if (!v30) {
        uint64_t v30 = "[anonymous]";
      }
      int v36 = 136446210;
      uint64_t v37 = v30;
    }
    int v27 = (char *)_os_log_send_and_compose_impl();
    int v28 = 1248;
    CFIndex v29 = 33;
  }
  CFErrorRef v31 = sub_10000BF78("_quire_bootstrap_watchdog_registration", "quire.c", v28, "com.apple.security.cryptex", v29, v3, v27);
  free(v27);
  CFErrorRef v35 = v31;
LABEL_63:
  sub_10003FA64(v33);
  CFErrorRef v15 = v35;
  if (v19) {
    CFRelease(v19);
  }
LABEL_26:
  if (cf) {
    CFRelease(cf);
  }
  if (v3) {
    CFRelease(v3);
  }
  if (v2) {
    os_release(v2);
  }
  return v15;
}

uint64_t sub_1000387E4()
{
  return remote_device_browse_present();
}

void sub_100038858(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  int v2 = *(_DWORD *)(a1 + 184);
  *(_DWORD *)(a1 + 184) = v2 + 1;
  if (v2 == -1) {
    sub_100044798();
  }
}

void sub_100038894(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 48) == 3)
  {
    CFErrorRef v3 = sub_10003FD2C(*(void **)(a1 + 32), 0x50uLL);
    *((_DWORD *)v3 + 6) = *(_DWORD *)(a2 + 40);
    uint64_t v4 = *(void **)(a2 + 80);
    v3[4] = v4;
    xpc_retain(v4);
    sub_100033978((uint64_t)v3);
    sub_10003FE2C((void **)v3);
  }
}

CFErrorRef sub_10003890C(uint64_t a1, CFArrayRef theArray)
{
  size_t Count = CFArrayGetCount(theArray);
  if (Count)
  {
    CFIndex v5 = Count;
    int v6 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
    v15.location = 0;
    v15.length = v5;
    CFArrayGetValues(theArray, v15, v6);
    CFSetRef v7 = CFSetCreate(0, v6, v5, &kCFTypeSetCallBacks);
    if (CFSetGetCount(v7) == v5)
    {
      if (v5 < 1)
      {
        CFErrorRef v12 = 0;
      }
      else
      {
        CFIndex v8 = 0;
        while (2)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v8);
          int v10 = sub_10000BB44(ValueAtIndex);
          uint64_t v11 = (const char *)(a1 + 448);
          do
          {
            uint64_t v11 = *(const char **)v11;
            if (!v11)
            {
              if (*(void *)(a1 + 72)) {
                os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
              }
              int v14 = (char *)_os_log_send_and_compose_impl();
              CFErrorRef v12 = sub_10000BF78("_quire_validate_watchdog_service_labels", "quire.c", 1168, "com.apple.security.cryptex", 11, 0, v14);
              free(v14);
              goto LABEL_21;
            }
          }
          while (strcmp(v11 + 8, v10));
          free(v10);
          CFErrorRef v12 = 0;
          if (++v8 != v5) {
            continue;
          }
          break;
        }
      }
      if (v7) {
        goto LABEL_17;
      }
    }
    else
    {
      if (*(void *)(a1 + 72)) {
        os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      }
      int v10 = (char *)_os_log_send_and_compose_impl();
      CFErrorRef v12 = sub_10000BF78("_quire_validate_watchdog_service_labels", "quire.c", 1147, "com.apple.security.cryptex", 11, 0, v10);
LABEL_21:
      free(v10);
      if (v7) {
LABEL_17:
      }
        CFRelease(v7);
    }
  }
  else
  {
    CFErrorRef v12 = 0;
    int v6 = 0;
  }
  free(v6);
  return v12;
}

uint64_t sub_100038CC8(uint64_t result, uint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
  {
    uint64_t v3 = result;
    uint64_t result = remote_device_reset();
    if ((result & 1) == 0)
    {
      int v4 = *__error();
      CFIndex v5 = *(const char **)(*(void *)(v3 + 32) + 56);
      int v6 = *__error();
      CFSetRef v7 = *(NSObject **)(*(void *)(v3 + 32) + 72);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        if (!v5) {
          CFIndex v5 = "[anonymous]";
        }
        int v8 = 136446722;
        uint64_t v9 = v5;
        __int16 v10 = 2080;
        uint64_t name = remote_device_get_name();
        __int16 v12 = 1024;
        int v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s: failed to reset remote device: %s: %{darwin.errno}d", (uint8_t *)&v8, 0x1Cu);
      }
      uint64_t result = (uint64_t)__error();
      *(_DWORD *)uint64_t result = v6;
    }
  }
  return result;
}

void sub_100038DDC(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 188);
  BOOL v3 = v2 != 0;
  long long v26 = 0u;
  memset(v25, 0, sizeof(v25));
  *((void *)&v25[0] + 1) = *(void *)(a1 + 416);
  LODWORD(v26) = v2;
  *((void *)&v26 + 1) = *(void *)(a1 + 72);
  uint64_t v27 = 0;
  sub_100038858(a1);
  int v4 = *(char **)(a1 + 448);
  if (v4)
  {
    char v5 = 0;
    uint64_t v24 = 32 * v3;
    int v6 = (void **)(a1 + 448);
    do
    {
      CFSetRef v7 = *(const char **)(a1 + 56);
      int v8 = *__error();
      uint64_t v9 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        __int16 v10 = "[anonymous]";
        if (v7) {
          __int16 v10 = v7;
        }
        *(_DWORD *)int buf = 136446466;
        *(void *)&void buf[4] = v10;
        *(_WORD *)&unsigned char buf[12] = 2080;
        *(void *)&buf[14] = v4 + 8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}s: unbootstrapping service: %s", buf, 0x16u);
      }
      *__error() = v8;
      BOOL v11 = v4[1160] != 0;
      *(void *)&v25[0] = v24;
      int v12 = sub_1000151FC(v4 + 8, (uint64_t)v25);
      if (v12)
      {
        int v13 = v12;
        int v14 = *(const char **)(a1 + 56);
        int v15 = *__error();
        uint64_t v16 = *(NSObject **)(a1 + 72);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)int buf = 136446722;
          unint64_t v17 = "[anonymous]";
          if (v14) {
            unint64_t v17 = v14;
          }
          *(void *)&void buf[4] = v17;
          *(_WORD *)&unsigned char buf[12] = 2080;
          *(void *)&buf[14] = v4 + 8;
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v2snprintf(byte_10005E420, 0x400uLL, "/AppleInternal/Library/Python/%d.%d/site-packages", 3, 9) = v13;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s: failed to unbootstrap service: %s: %{darwin.errno}d", buf, 0x1Cu);
        }
        *__error() = v15;
      }
      sub_100039404(a1);
      __int16 v18 = *(char **)(a1 + 448);
      CFArrayRef v19 = (char *)(a1 + 448);
      while (v18 != v4)
      {
        CFArrayRef v19 = v18;
        __int16 v18 = *(char **)v18;
      }
      v5 |= v11;
      *(void *)CFArrayRef v19 = *(void *)v4;
      free(v4);
      int v4 = (char *)*v6;
    }
    while (*v6);
    if (v5)
    {
      CFErrorRef v20 = *(const char **)(a1 + 56);
      int v21 = *__error();
      uint64_t v22 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        int v23 = "[anonymous]";
        if (v20) {
          int v23 = v20;
        }
        *(_DWORD *)int buf = 136446210;
        *(void *)&void buf[4] = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%{public}s: resetting remote devices for removed remote services", buf, 0xCu);
      }
      *__error() = v21;
      *(void *)int buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 0x40000000;
      *(void *)&uint8_t buf[16] = sub_100038CC8;
      CFIndex v29 = &unk_10005B1D0;
      uint64_t v30 = a1;
      remote_device_browse_present();
    }
  }
  sub_100039404(a1);
}

_DWORD *sub_1000390F8(uint64_t a1)
{
  bzero(&v41, 0x878uLL);
  int v21 = 0;
  long long v39 = 0u;
  memset(v40, 0, sizeof(v40));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  *(_OWORD *)__str = 0u;
  long long v27 = 0u;
  int v2 = *(const char **)(a1 + 56);
  int v3 = *__error();
  int v4 = *(NSObject **)(a1 + 72);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    char v5 = "[anonymous]";
    if (v2) {
      char v5 = v2;
    }
    *(_DWORD *)int buf = 136446210;
    int v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%{public}s: unbootstrap diags", buf, 0xCu);
  }
  uint64_t result = __error();
  _DWORD *result = v3;
  if ((*(unsigned char *)(a1 + 176) & 0x20) != 0)
  {
    if (statfs("/", &v41))
    {
      int v7 = *__error();
      int v8 = *(const char **)(a1 + 56);
      int v9 = *__error();
      __int16 v10 = *(NSObject **)(a1 + 72);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
LABEL_12:
        uint64_t result = __error();
        _DWORD *result = v9;
        return result;
      }
      BOOL v11 = "[anonymous]";
      if (v8) {
        BOOL v11 = v8;
      }
      *(_DWORD *)int buf = 136446466;
      int v23 = v11;
      __int16 v24 = 1024;
      int v25 = v7;
      int v12 = "%{public}s: failed to statfs root path: %{darwin.errno}d";
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x12u);
      goto LABEL_12;
    }
    sscanf(v41.f_mntfromname, "/dev/disk%d", &v21);
    snprintf(__str, 0xFFuLL, "disk%d", v21);
    if (unlink("/AppleInternal/Diags") && *__error() != 2)
    {
      int v18 = *__error();
      CFArrayRef v19 = *(const char **)(a1 + 56);
      int v9 = *__error();
      __int16 v10 = *(NSObject **)(a1 + 72);
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      CFErrorRef v20 = "[anonymous]";
      if (v19) {
        CFErrorRef v20 = v19;
      }
      *(_DWORD *)int buf = 136446466;
      int v23 = v20;
      __int16 v24 = 1024;
      int v25 = v18;
      int v12 = "%{public}s: failed to unlink diags symlink: %{darwin.errno}d";
      goto LABEL_11;
    }
    uint64_t result = (_DWORD *)sub_100010730((uint64_t)__str, 640, *(NSObject **)(a1 + 72));
    if (result)
    {
      int v13 = (int)result;
      int v14 = *(const char **)(a1 + 56);
      int v15 = *__error();
      uint64_t v16 = *(NSObject **)(a1 + 72);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        unint64_t v17 = "[anonymous]";
        if (v14) {
          unint64_t v17 = v14;
        }
        *(_DWORD *)int buf = 136446466;
        int v23 = v17;
        __int16 v24 = 1024;
        int v25 = v13;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%{public}s: failed to delete diags volume: %{darwin.errno}d", buf, 0x12u);
      }
      uint64_t result = __error();
      _DWORD *result = v15;
    }
    else
    {
      *(void *)(a1 + 176) &= ~0x20uLL;
    }
  }
  return result;
}

void sub_100039404(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  int v2 = *(_DWORD *)(a1 + 184);
  *(_DWORD *)(a1 + 184) = v2 - 1;
  if (!v2) {
    sub_100044798();
  }
  if (v2 == 1)
  {
    uint64_t v3 = *(void *)(a1 + 376);
    if (v3)
    {
      int v4 = (uint64_t *)(a1 + 376);
      do
      {
        if ((*(_DWORD *)(v3 + 44) & 0x80000000) != 0) {
          sub_100032AD0((void *)v3);
        }
        else {
          sub_10002EB2C((uint64_t *)v3);
        }
        uint64_t v5 = *v4;
        uint64_t v6 = *v4;
        if (*v4 == v3)
        {
          uint64_t v5 = *(void *)(v3 + 24);
          uint64_t *v4 = v5;
          if (!v5)
          {
            *(void *)(a1 + 384) = v4;
            *(void *)(v3 + 24) = -1;
            return;
          }
        }
        else
        {
          do
          {
            uint64_t v7 = v6;
            uint64_t v6 = *(void *)(v6 + 24);
          }
          while (v6 != v3);
          uint64_t v8 = *(void *)(v3 + 24);
          *(void *)(v7 + 24) = v8;
          uint64_t v9 = v7 + 24;
          if (!v8) {
            *(void *)(a1 + 384) = v9;
          }
        }
        *(void *)(v3 + 24) = -1;
        uint64_t v3 = v5;
      }
      while (v5);
    }
  }
}

uint64_t sub_1000394D4(void *a1)
{
  int v2 = (void *)a1[58];
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      int v4 = (const char *)a1[7];
      int v5 = *__error();
      uint64_t v6 = a1[9];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = a1[52];
        if (v4) {
          uint64_t v8 = v4;
        }
        else {
          uint64_t v8 = "[anonymous]";
        }
        *(_DWORD *)int buf = 136446466;
        CFArrayRef v19 = v8;
        __int16 v20 = 2080;
        uint64_t v21 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: Found a Launch Agent while removing quire: %s - going to deactivate it.", buf, 0x16u);
      }
      *__error() = v5;
      sub_1000396C0(v2, a1);
      int v2 = v3;
    }
    while (v3);
  }
  sub_100038858((uint64_t)a1);
  uint64_t v9 = (void *)a1[57];
  if (v9)
  {
    do
    {
      __int16 v10 = (void *)a1[57];
      BOOL v11 = a1 + 57;
      while (v10 != v9)
      {
        BOOL v11 = v10;
        __int16 v10 = (void *)*v10;
      }
      int v12 = (void *)*v9;
      void *v11 = *v9;
      void *v9 = -1;
      sub_10003FA64(v9 + 16);
      free(v9);
      sub_100039404(a1);
      uint64_t v9 = v12;
    }
    while (v12);
  }
  int v13 = (const char *)a1[7];
  int v14 = *__error();
  int v15 = a1[9];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    if (v13) {
      uint64_t v16 = v13;
    }
    else {
      uint64_t v16 = "[anonymous]";
    }
    *(_DWORD *)int buf = 136446210;
    CFArrayRef v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%{public}s: Removed all launch agents.", buf, 0xCu);
  }
  *__error() = v14;
  return sub_100039404(a1);
}

void sub_1000396C0(char *a1, void *a2)
{
  int v4 = a1 + 8;
  int v5 = sub_1000151FC(a1 + 8, (uint64_t)(a1 + 1168));
  if (v5)
  {
    int v6 = v5;
    uint64_t v7 = (const char *)a2[7];
    int v8 = *__error();
    uint64_t v9 = a2[9];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __int16 v10 = "[anonymous]";
      int v13 = 136446722;
      if (v7) {
        __int16 v10 = v7;
      }
      int v14 = v10;
      __int16 v15 = 2080;
      uint64_t v16 = v4;
      __int16 v17 = 1024;
      int v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}s: failed to unbootstrap agent: %s: %{darwin.errno}d", (uint8_t *)&v13, 0x1Cu);
    }
    *__error() = v8;
  }
  BOOL v11 = (char *)a2[58];
  if (v11 == a1)
  {
    int v12 = (char *)(a2 + 58);
  }
  else
  {
    do
    {
      int v12 = v11;
      BOOL v11 = *(char **)v11;
    }
    while (v11 != a1);
  }
  *(void *)int v12 = *(void *)a1;
  *(void *)a1 = -1;
  sub_100039404((uint64_t)a2);
  free(a1);
}

uint64_t sub_100039810()
{
  return _os_log_send_and_compose_impl();
}

uint64_t sub_100039854(int a1)
{
  int v2 = a1;
  uint64_t result = sysctlbyname("kern.proc_rsr_in_progress", 0, 0, &v2, 4uLL);
  if (result) {
    return *__error();
  }
  return result;
}

uint64_t sub_1000398A0(void *a1, uint64_t a2, unsigned char *a3)
{
  int v6 = (void *)sub_100013408(a2, 0);
  uint64_t v7 = sub_100013470((uint64_t)v6);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (const char *)a1[7];
    int v10 = *__error();
    BOOL v11 = a1[9];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = "[anonymous]";
      if (v9) {
        int v12 = v9;
      }
      *(_DWORD *)int buf = 136446466;
      uint64_t v68 = v12;
      __int16 v69 = 1024;
      LODWORD(v70) = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}s: failed to resolve proc: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v10;
    goto LABEL_25;
  }
  unint64_t v13 = *(void *)(a2 + 24);
  if (v13 > 4)
  {
LABEL_24:
    uint64_t v8 = 22;
    goto LABEL_25;
  }
  int v14 = off_10005B220[v13];
  __int16 v15 = (&off_10005B270)[v13];
  uint64_t v8 = sub_1000140A0((uint64_t)v6, (&off_10005B248)[v13]);
  uint64_t v16 = (const char *)a1[7];
  int v65 = *__error();
  __int16 v17 = a1[9];
  if (v8)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      int v18 = "[anonymous]";
      uint64_t v19 = v6[8];
      uint64_t v20 = v6[9];
      if (v16) {
        int v18 = v16;
      }
      *(_DWORD *)int buf = 136447490;
      uint64_t v68 = v18;
      __int16 v69 = 2080;
      uint64_t v70 = v14;
      __int16 v71 = 2080;
      int v72 = v15;
      __int16 v73 = 2080;
      uint64_t v74 = v19;
      __int16 v75 = 2080;
      uint64_t v76 = v20;
      __int16 v77 = 1024;
      int v78 = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s: proc not entitled for %s: entitlement = %s, proc = %s, signing id = %s: %{darwin.errno}d", buf, 0x3Au);
    }
    *__error() = v65;
    goto LABEL_25;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = "[anonymous]";
    if (v16) {
      uint64_t v21 = v16;
    }
    uint64_t v22 = v6[8];
    uint64_t v23 = v6[9];
    *(_DWORD *)int buf = 136447234;
    uint64_t v68 = v21;
    __int16 v69 = 2080;
    uint64_t v70 = v14;
    __int16 v71 = 2080;
    int v72 = v15;
    __int16 v73 = 2080;
    uint64_t v74 = v22;
    __int16 v75 = 2080;
    uint64_t v76 = v23;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%{public}s: authorized proc for %s: entitlement = %s, proc = %s, signing id = %s", buf, 0x34u);
  }
  *__error() = v65;
  uint64_t v8 = 45;
  switch(v13)
  {
    case 0uLL:
      __int16 v24 = (void *)sub_100013408(a2, 0);
      uint64_t v25 = sub_100013470((uint64_t)v24);
      if (v25)
      {
        uint64_t v8 = v25;
        long long v26 = (const char *)a1[7];
        int v27 = *__error();
        long long v28 = a1[9];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          long long v29 = "[anonymous]";
          if (v26) {
            long long v29 = v26;
          }
          *(_DWORD *)int buf = 136446466;
          uint64_t v68 = v29;
          __int16 v69 = 1024;
          LODWORD(v70) = v8;
          long long v30 = "%{public}s: failed to resolve proc: %{darwin.errno}d";
          long long v31 = v28;
          uint32_t v32 = 18;
LABEL_39:
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
          goto LABEL_40;
        }
        goto LABEL_40;
      }
      BOOL v36 = sub_1000140A0((uint64_t)v24, "com.apple.private.security.cryptex.install");
      if (v36)
      {
        uint64_t v8 = v36;
        long long v37 = (const char *)a1[7];
        int v27 = *__error();
        long long v38 = a1[9];
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          long long v39 = "[anonymous]";
          if (v37) {
            long long v39 = v37;
          }
          BOOL v40 = (char *)v24[8];
          uint64_t v41 = v24[9];
          *(_DWORD *)int buf = 136447234;
          uint64_t v68 = v39;
          __int16 v69 = 2080;
          uint64_t v70 = "com.apple.private.security.cryptex.install";
          __int16 v71 = 2080;
          int v72 = v40;
          __int16 v73 = 2080;
          uint64_t v74 = v41;
          __int16 v75 = 1024;
          LODWORD(v76) = v8;
          long long v30 = "%{public}s: proc not entitled for install: entitlement = %s, proc = %s, signing id = %s: %{darwin.errno}d";
          long long v31 = v38;
          uint32_t v32 = 48;
          goto LABEL_39;
        }
LABEL_40:
        *__error() = v27;
        goto LABEL_41;
      }
      uint64_t v42 = codex_install_unpack();
      if (v42)
      {
        uint64_t v8 = v42;
        int v43 = xpc_copy_description(*(xpc_object_t *)(a2 + 296));
        uint64_t v44 = (const char *)a1[7];
        int v45 = *__error();
        uint64_t v46 = a1[9];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          __int16 v47 = "[anonymous]";
          *(_DWORD *)int buf = 136446722;
          if (v44) {
            __int16 v47 = v44;
          }
          uint64_t v68 = v47;
          __int16 v69 = 2080;
          uint64_t v70 = v43;
          __int16 v71 = 1024;
          LODWORD(v72) = v8;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%{public}s: failed to unpack ipc: %s: %{darwin.errno}d", buf, 0x1Cu);
        }
        *__error() = v45;
        free(v43);
        goto LABEL_41;
      }
      long long v48 = (void *)cryptex_core_create();
      uint64_t v49 = cryptex_core_set_assets_from_fds();
      if (v49)
      {
        uint64_t v8 = v49;
        long long v50 = (const char *)a1[7];
        int v51 = *__error();
        uint64_t v52 = a1[9];
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
        {
          uint64_t v53 = "[anonymous]";
          if (v50) {
            uint64_t v53 = v50;
          }
          *(_DWORD *)int buf = 136446466;
          uint64_t v68 = v53;
          __int16 v69 = 1024;
          LODWORD(v70) = v8;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "%{public}s: set assets to core from fds failed: %{darwin.errno}d", buf, 0x12u);
        }
        *__error() = v51;
        goto LABEL_70;
      }
      if (!cryptex_core_is_cryptex1())
      {
        int v55 = 0;
        goto LABEL_59;
      }
      uint64_t v54 = cryptex_core_cx1_properties_create_with_xpc_dictionary();
      if (v54)
      {
        int v55 = (void *)v54;
        cryptex_core_set_cryptex1_properties();
LABEL_59:
        int v56 = (const char *)a1[7];
        int v66 = *__error();
        __int16 v57 = a1[9];
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v58 = "[anonymous]";
          if (v56) {
            uint64_t v58 = v56;
          }
          *(_DWORD *)int buf = 136446210;
          uint64_t v68 = v58;
          _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "%{public}s: using default signing service", buf, 0xCu);
        }
        *__error() = v66;
        v48[6] = 0;
        v48[7] = 0;
        __int16 v59 = sub_10002D0DC(a1, (unsigned char *)a2, a3);
        int v60 = sub_10003B2B4(a1, (uint64_t)v59, 0, 0, 0, (uint64_t)sub_10003A2E4);
        sub_1000183AC(a1, v48, (uint64_t)v60);
        uint64_t v8 = 36;
        if (v55) {
          os_release(v55);
        }
        goto LABEL_70;
      }
      char v61 = (const char *)a1[7];
      int v62 = *__error();
      unint64_t v63 = a1[9];
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      {
        int v64 = "[anonymous]";
        if (v61) {
          int v64 = v61;
        }
        *(_DWORD *)int buf = 136446466;
        uint64_t v68 = v64;
        __int16 v69 = 1024;
        LODWORD(v70) = 22;
        _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "%{public}s: failed to parse Cryptex1 properties.: %{darwin.errno}d", buf, 0x12u);
      }
      *__error() = v62;
      uint64_t v8 = 22;
LABEL_70:
      if (v48) {
        os_release(v48);
      }
LABEL_41:
      if (v24) {
        os_release(v24);
      }
LABEL_25:
      if (v6) {
        os_release(v6);
      }
      if (a1) {
        os_release(a1);
      }
      return v8;
    case 1uLL:
      uint64_t v8 = codex_list_unpack();
      if (v8) {
        goto LABEL_25;
      }
      long long v35 = sub_10002D0DC(a1, (unsigned char *)a2, a3);
      sub_10001A1E8(a1, (uint64_t)v35, (uint64_t)sub_10003AAF0);
LABEL_33:
      uint64_t v8 = 36;
      goto LABEL_25;
    case 2uLL:
      long long v34 = sub_10002D0DC(a1, (unsigned char *)a2, a3);
      sub_10001A038(a1, (uint64_t)v34, (uint64_t)sub_10003AB58);
      goto LABEL_33;
    case 3uLL:
    case 4uLL:
      goto LABEL_25;
    default:
      goto LABEL_24;
  }
}

void sub_10003A2E4(uint64_t a1, void *a2, const void *a3, uint64_t a4)
{
  uint64_t v19 = a4;
  if (a3)
  {
    if (*(void *)(a1 + 72))
    {
      os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
      uint64_t v7 = *(const char **)(a1 + 56);
      if (!v7) {
        uint64_t v7 = "[anonymous]";
      }
      int v20 = 136446210;
      uint64_t v21 = v7;
    }
    else
    {
      int v10 = *(const char **)(a1 + 56);
      if (!v10) {
        int v10 = "[anonymous]";
      }
      int v20 = 136446210;
      uint64_t v21 = v10;
    }
    BOOL v11 = (char *)_os_log_send_and_compose_impl();
    int v12 = "com.apple.security.cryptex";
    int v13 = 171;
    CFIndex v14 = 14;
    __int16 v15 = a3;
  }
  else
  {
    int v8 = *(_DWORD *)(a4 + 8);
    if (v8)
    {
      if (*(void *)(a1 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
        uint64_t v9 = *(const char **)(a1 + 56);
        if (!v9) {
          uint64_t v9 = "[anonymous]";
        }
      }
      else
      {
        uint64_t v9 = *(const char **)(a1 + 56);
        if (!v9) {
          uint64_t v9 = "[anonymous]";
        }
      }
      int v20 = 136446466;
      uint64_t v21 = v9;
      __int16 v22 = 1024;
      int v23 = v8;
      BOOL v11 = (char *)_os_log_send_and_compose_impl();
      int v12 = "com.apple.security.cryptex.posix";
      int v13 = 179;
      CFIndex v14 = v8;
      __int16 v15 = 0;
    }
    else
    {
      if (!*(void *)(a4 + 16))
      {
        sub_100019648(a1, a2, a4, (uint64_t)sub_10003A6EC);
        return;
      }
      if (*(void *)(a1 + 72))
      {
        os_log_type_enabled(*(os_log_t *)(a1 + 72), OS_LOG_TYPE_ERROR);
        uint64_t v16 = *(const char **)(a1 + 56);
        if (!v16) {
          uint64_t v16 = "[anonymous]";
        }
        int v20 = 136446210;
        uint64_t v21 = v16;
      }
      else
      {
        __int16 v17 = *(const char **)(a1 + 56);
        if (!v17) {
          __int16 v17 = "[anonymous]";
        }
        int v20 = 136446210;
        uint64_t v21 = v17;
      }
      BOOL v11 = (char *)_os_log_send_and_compose_impl();
      __int16 v15 = *(const void **)(a4 + 16);
      int v12 = "com.apple.security.cryptex";
      int v13 = 187;
      CFIndex v14 = 4;
    }
  }
  int v18 = sub_10000BF78("_codex_rpc_install_continue2", "sub_codex.c", v13, v12, v14, v15, v11);
  free(v11);
  if (v18)
  {
    sub_10002D17C((uint64_t *)(a4 + 24), v18);
    sub_10003B330(&v19);
    CFRelease(v18);
  }
}

void sub_10003A6EC(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  uint64_t v17 = a4;
  if (a3)
  {
    int v8 = *__error();
    uint64_t v9 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf[0]) = 138412290;
      *(void *)((char *)buf + 4) = a3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "bootstrap failed, unbootstrapping: %@", (uint8_t *)buf, 0xCu);
    }
    *__error() = v8;
    *(void *)(a4 + 16) = CFRetain(a3);
    sub_10001986C(a1, (void *)a2, 1uLL, a4, (uint64_t)sub_10003A8C4);
  }
  else
  {
    *(void *)&buf[0] = *(void *)(a2 + 208);
    *((void *)&buf[0] + 1) = **(void **)(a2 + 224);
    buf[1] = *(_OWORD *)(a2 + 424);
    uint64_t v25 = *(void *)(a2 + 416);
    int v10 = (uint64_t *)(a4 + 24);
    codex_install_reply_pack();
    BOOL v11 = *(const char **)(a1 + 56);
    int v12 = *__error();
    int v13 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      CFIndex v14 = "[anonymous]";
      if (v11) {
        CFIndex v14 = v11;
      }
      uint64_t v15 = *(void *)(a2 + 208);
      uint64_t v16 = *(void *)(a2 + 416);
      *(_DWORD *)int v18 = 136446722;
      uint64_t v19 = v14;
      __int16 v20 = 2080;
      uint64_t v21 = v15;
      __int16 v22 = 2080;
      uint64_t v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}s: replying: uint64_t name = %s, mnt path = %s", v18, 0x20u);
    }
    *__error() = v12;
    sub_10002D130(v10, 0);
    sub_10003B330(&v17);
  }
}

void sub_10003A8C4(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  int v8 = *__error();
  uint64_t v9 = a1[9];
  if (a3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      uint64_t v15 = a3;
      int v10 = "unbootstrap: %@";
      BOOL v11 = v9;
      os_log_type_t v12 = OS_LOG_TYPE_ERROR;
      uint32_t v13 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, (uint8_t *)&v14, v13);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v14) = 0;
    int v10 = "unbootstrap [no error]";
    BOOL v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    uint32_t v13 = 2;
    goto LABEL_6;
  }
  *__error() = v8;
  sub_100018E84(a1, a2, a4, (uint64_t)sub_10003A9E4);
}

void sub_10003A9E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a4;
  int v7 = *__error();
  int v8 = *(NSObject **)(a1 + 72);
  if (a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 138412290;
      uint64_t v15 = a3;
      uint64_t v9 = "uninstall: %@";
      int v10 = v8;
      os_log_type_t v11 = OS_LOG_TYPE_ERROR;
      uint32_t v12 = 12;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int buf = 0;
    uint64_t v9 = "uninstall [no error]";
    int v10 = v8;
    os_log_type_t v11 = OS_LOG_TYPE_DEBUG;
    uint32_t v12 = 2;
    goto LABEL_6;
  }
  *__error() = v7;
  sub_10002D17C((uint64_t *)(a4 + 24), *(__CFError **)(a4 + 16));
  sub_10003B330(&v13);
}

void sub_10003AAF0(int a1, int a2, xpc_object_t object, uint64_t a4)
{
  uint64_t v4 = a4;
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_array)
  {
    codex_list_reply_pack();
    sub_10002D130(&v4, 0);
  }
  else
  {
    __break(1u);
  }
}

void sub_10003AB58(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v9 = a3;
  if (a2)
  {
    int v5 = *(const char **)(a1 + 56);
    int v6 = *__error();
    int v7 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = "[anonymous]";
      if (v5) {
        int v8 = v5;
      }
      *(_DWORD *)int buf = 136446466;
      os_log_type_t v11 = v8;
      __int16 v12 = 1024;
      int v13 = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}s: codex lockdown failed: %{darwin.errno}d", buf, 0x12u);
    }
    *__error() = v6;
  }
  sub_10002D130(&v9, a2);
}

void sub_10003AC44(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (v1)
  {
    xpc_dictionary_get_remote_connection(v1);
    uint64_t v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    string = xpc_dictionary_get_string(v2, "cryptex_name");
    if (string)
    {
      uint64_t v5 = (uint64_t)string;
      long long buffer = *(_OWORD *)"unknown";
      long long v23 = unk_100048C00;
      pid_t pid = xpc_connection_get_pid(v3);
      proc_name(pid, &buffer, 0x20u);
      int v7 = *__error();
      int v8 = sub_10003AEC4();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        if (v3) {
          pid_t v9 = xpc_connection_get_pid(v3);
        }
        else {
          pid_t v9 = -1;
        }
        int v16 = 136315650;
        p_long long buffer = &buffer;
        __int16 v18 = 1024;
        pid_t v19 = v9;
        __int16 v20 = 2080;
        uint64_t v21 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "XPC client <process=%s pid=%d>: Blocking client during upgrade for cryptex '%s'.", (uint8_t *)&v16, 0x1Cu);
      }

      *__error() = v7;
      sub_100007858(v5, (uint64_t)v2, (uint64_t)sub_10003AF18);
    }
    else
    {
      long long buffer = *(_OWORD *)"unknown";
      long long v23 = unk_100048C00;
      pid_t v12 = xpc_connection_get_pid(v3);
      proc_name(v12, &buffer, 0x20u);
      int v13 = *__error();
      int v14 = sub_10003AEC4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (v3) {
          pid_t v15 = xpc_connection_get_pid(v3);
        }
        else {
          pid_t v15 = -1;
        }
        int v16 = 136315394;
        p_long long buffer = &buffer;
        __int16 v18 = 1024;
        pid_t v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "XPC client <process=%s pid=%d>: Client did not provide the name of a cryptex to block on.", (uint8_t *)&v16, 0x12u);
      }

      *__error() = v13;
      sub_10003AF18(v2, 0);
    }
  }
  else
  {
    int v10 = *__error();
    os_log_type_t v11 = sub_10003AEC4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buffer) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Invalid input.", (uint8_t *)&buffer, 2u);
    }

    *__error() = v10;
  }
}

id sub_10003AEC4()
{
  if (qword_10005E8B0 != -1) {
    dispatch_once(&qword_10005E8B0, &stru_10005B298);
  }
  uint64_t v0 = (void *)qword_10005E8A8;

  return v0;
}

void sub_10003AF18(xpc_object_t xdict, uint64_t a2)
{
  if (xdict)
  {
    xpc_dictionary_get_remote_connection(xdict);
    uint64_t v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    string = xpc_dictionary_get_string(xdict, "cryptex_name");
    if (!string) {
      goto LABEL_19;
    }
    int v6 = string;
    *(_OWORD *)long long buffer = *(_OWORD *)"unknown";
    *(_OWORD *)&buffer[16] = unk_100048C00;
    pid_t pid = xpc_connection_get_pid(v4);
    proc_name(pid, buffer, 0x20u);
    int v8 = *__error();
    pid_t v9 = sub_10003AEC4();
    int v10 = v9;
    if (a2)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        if (v4) {
          pid_t v11 = xpc_connection_get_pid(v4);
        }
        else {
          pid_t v11 = -1;
        }
        *(_DWORD *)long long v30 = 136315906;
        *(void *)&void v30[4] = buffer;
        *(_WORD *)&v30[12] = 1024;
        *(_DWORD *)&v30[14] = v11;
        *(_WORD *)&v30[18] = 2080;
        *(void *)&v30[20] = v6;
        *(_WORD *)&v30[28] = 2112;
        *(void *)&v30[30] = a2;
        pid_t v15 = "XPC client <process=%s pid=%d>: Upgrade for cryptex '%s' has finished.: %@";
        int v16 = v10;
        os_log_type_t v17 = OS_LOG_TYPE_ERROR;
        uint32_t v18 = 38;
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, v30, v18);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      if (v4) {
        pid_t v14 = xpc_connection_get_pid(v4);
      }
      else {
        pid_t v14 = -1;
      }
      *(_DWORD *)long long v30 = 136315650;
      *(void *)&void v30[4] = buffer;
      *(_WORD *)&v30[12] = 1024;
      *(_DWORD *)&v30[14] = v14;
      *(_WORD *)&v30[18] = 2080;
      *(void *)&v30[20] = v6;
      pid_t v15 = "XPC client <process=%s pid=%d>: Upgrade for cryptex '%s' has finished. [no error]";
      int v16 = v10;
      os_log_type_t v17 = OS_LOG_TYPE_DEBUG;
      uint32_t v18 = 28;
      goto LABEL_17;
    }

    *__error() = v8;
LABEL_19:
    *(_OWORD *)long long v30 = *(_OWORD *)"unknown";
    *(_OWORD *)&v30[16] = unk_100048C00;
    pid_t v19 = xpc_connection_get_pid(v4);
    proc_name(v19, v30, 0x20u);
    int v20 = *__error();
    uint64_t v21 = sub_10003AEC4();
    __int16 v22 = v21;
    if (a2)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        if (v4) {
          pid_t v23 = xpc_connection_get_pid(v4);
        }
        else {
          pid_t v23 = -1;
        }
        *(_DWORD *)long long buffer = 136315650;
        *(void *)&buffer[4] = v30;
        *(_WORD *)&buffer[12] = 1024;
        *(_DWORD *)&buffer[14] = v23;
        *(_WORD *)&buffer[18] = 2112;
        *(void *)&buffer[20] = a2;
        uint64_t v25 = "XPC client <process=%s pid=%d>: Unblocking client.: %@";
        long long v26 = v22;
        os_log_type_t v27 = OS_LOG_TYPE_ERROR;
        uint32_t v28 = 28;
LABEL_30:
        _os_log_impl((void *)&_mh_execute_header, v26, v27, v25, buffer, v28);
      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      if (v4) {
        pid_t v24 = xpc_connection_get_pid(v4);
      }
      else {
        pid_t v24 = -1;
      }
      *(_DWORD *)long long buffer = 136315394;
      *(void *)&buffer[4] = v30;
      *(_WORD *)&buffer[12] = 1024;
      *(_DWORD *)&buffer[14] = v24;
      uint64_t v25 = "XPC client <process=%s pid=%d>: Unblocking client. [no error]";
      long long v26 = v22;
      os_log_type_t v27 = OS_LOG_TYPE_DEBUG;
      uint32_t v28 = 18;
      goto LABEL_30;
    }

    *__error() = v20;
    xpc_object_t reply = xpc_dictionary_create_reply(xdict);
    xpc_dictionary_send_reply();

    goto LABEL_32;
  }
  int v12 = *__error();
  int v13 = sub_10003AEC4();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Invalid input.", v30, 2u);
  }

  *__error() = v12;
LABEL_32:
}

void sub_10003B270(id a1)
{
  qword_10005E8A8 = (uint64_t)os_log_create("com.apple.libcryptex", "upgrade_sub_trampoline");

  _objc_release_x1();
}

void *sub_10003B2B4(void *a1, uint64_t a2, void *a3, int a4, void *a5, uint64_t a6)
{
  pid_t v11 = sub_10003FD2C(a1, 0x40uLL);
  *((_DWORD *)v11 + 12) = a4;
  v11[3] = a2;
  void v11[4] = a3;
  if (a3) {
    os_retain(a3);
  }
  v11[7] = 0;
  if (a5) {
    v11[7] = xpc_retain(a5);
  }
  _OWORD v11[5] = a6;
  return v11;
}

void sub_10003B330(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*(void *)(*a1 + 24)) {
      sub_1000447B4();
    }
    uint64_t v3 = *(void **)(v2 + 32);
    if (v3)
    {
      os_release(v3);
      *(void *)(v2 + 32) = 0;
    }
    uint64_t v4 = *(void **)(v2 + 56);
    if (v4)
    {
      xpc_release(v4);
      *(void *)(v2 + 56) = 0;
    }
    sub_10003FE2C((void **)v2);
    *a1 = 0;
  }
}

id sub_10003B390(uint64_t a1)
{
  if (a1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000447D0();
    }
    id v1 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Using system domain", v3, 2u);
    }
    id v1 = +[OSLaunchdDomain currentDomain];
  }

  return v1;
}

uint64_t sub_10003B434()
{
  return 0;
}

uint64_t sub_10003B43C(uint64_t a1)
{
  int v1 = a1;
  uint64_t v2 = +[OSLaunchdDomain domainForRoleAccountUser:a1];
  if (v2)
  {
    uint64_t v3 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000448F0(v1);
    }
    uint64_t v3 = 33;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 67109120;
    int v9 = v1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Uncorking session for uid %d", buf, 8u);
  }
  id v7 = 0;
  unsigned __int8 v4 = [v2 unpendLaunches:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100044858(v5);
    }
    uint64_t v3 = 22;
  }

  return v3;
}

uint64_t sub_10003B580(uint64_t a1, uint64_t a2)
{
  int v3 = a1;
  unsigned __int8 v4 = +[OSLaunchdDomain domainForRoleAccountUser:a1];
  if (v4)
  {
    uint64_t v5 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_1000448F0(v3);
    }
    uint64_t v5 = 33;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Shutting down process monitoring", buf, 2u);
  }
  id v6 = +[OSLaunchdJob copyJobWithLabel:a2 domain:v4];
  id v7 = v6;
  if (v6)
  {
    [v6 cancelMonitor];
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)int buf = 0;
    int v8 = "Shut down process monitoring";
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)int buf = 0;
    int v8 = "Couldn't find job to stop it from being monitored";
  }
  _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v8, buf, 2u);
LABEL_14:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 67109120;
    int v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Closing domain for uid %d", buf, 8u);
  }
  id v12 = 0;
  unsigned __int8 v9 = [v4 initiateRemoval:&v12];
  id v10 = v12;
  if ((v9 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
      sub_100044970(v10);
    }
    uint64_t v5 = 22;
  }

  return v5;
}

uint64_t sub_10003B7AC(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned __int8 v4 = a3;
  uint64_t v5 = sub_10003B390(0);
  int v6 = *__error();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Shutting down process monitoring", buf, 2u);
  }
  *__error() = v6;
  id v7 = +[OSLaunchdJob copyJobWithLabel:a2 domain:v5];
  int v8 = v7;
  if (v7)
  {
    [v7 cancelMonitor];
    int v9 = *__error();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Shut down process monitoring", buf, 2u);
    }
    *__error() = v9;
    id v17 = 0;
    [v8 remove:&v17];
    id v10 = v17;
    if (v10)
    {
      pid_t v11 = v10;
      if ([v10 code] == (id)36)
      {
        int v12 = *__error();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)int buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Removing launchd job", buf, 2u);
        }
        *__error() = v12;

        uint64_t v13 = 0;
      }
      else
      {
        uint64_t v13 = (uint64_t)[v11 code];
      }
    }
    else
    {
      int v15 = *__error();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Removed launchd job", buf, 2u);
      }
      uint64_t v13 = 0;
      *__error() = v15;
    }
  }
  else
  {
    int v14 = *__error();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Couldn't find job to stop it from being monitored", buf, 2u);
    }
    *__error() = v14;
    uint64_t v13 = 3;
  }

  return v13;
}

CFErrorRef sub_10003B9F0(void *a1, int a2, uint64_t a3)
{
  id v4 = a1;
  uint64_t object = xpc_dictionary_get_array(v4, "_ManagedBy");
  string = xpc_dictionary_get_string(v4, "_ManagedBy");
  int v6 = sub_10003B390(0);
  if (!v6)
  {
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    *(_DWORD *)int buf = 67109376;
    *(_DWORD *)long long v39 = a2;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = 33;
    int v8 = (char *)_os_log_send_and_compose_impl();
    CFErrorRef v9 = sub_10000BF78("launchd_session_add_job", "launchd_session.m", 321, "com.apple.security.cryptex.posix", 33, 0, v8);
    free(v8);
    id v10 = 0;
    goto LABEL_29;
  }
  if (object | (unint64_t)string)
  {
    if (object)
    {
      xpc_object_t empty = xpc_copy((xpc_object_t)object);
    }
    else
    {
      xpc_object_t empty = xpc_array_create_empty();
      xpc_object_t v11 = xpc_string_create(string);
      xpc_array_append_value(empty, v11);
    }
    xpc_object_t v12 = xpc_string_create("com.apple.security.cryptexd");
    xpc_array_append_value(empty, v12);

    xpc_dictionary_set_value(v4, "_ManagedBy", empty);
  }
  else
  {
    xpc_dictionary_set_string(v4, "_ManagedBy", "com.apple.security.cryptexd");
  }
  sub_10003F38C(v4, "_PersistToBootMode", "rem");
  id v13 = [objc_alloc((Class)OSLaunchdJob) initWithPlist:v4 domain:v6];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)int buf = 67109378;
    *(_DWORD *)long long v39 = a2;
    *(_WORD *)&v39[4] = 2112;
    *(void *)&v39[6] = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Submitting job for uid %d : %@", buf, 0x12u);
  }
  int v14 = xpc_dictionary_get_value(v4, "CryptexSessionKeystone");
  if (xpc_get_type(v14) == (xpc_type_t)&_xpc_type_BOOL)
  {
    BOOL v15 = xpc_dictionary_get_BOOL(v4, "CryptexSessionKeystone");
    goto LABEL_19;
  }
  if (xpc_get_type(v14) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v14
      && xpc_get_type(v14) != (xpc_type_t)&_xpc_type_null
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_100044A08();
    }
    BOOL v15 = 0;
LABEL_19:
    BOOL v16 = 0;
    uint64_t int64 = 0;
    if (!a3) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  uint32_t v18 = xpc_dictionary_get_dictionary(v4, "CryptexSessionKeystone");
  BOOL v16 = xpc_dictionary_get_BOOL(v18, "StopOnFailure");
  uint64_t int64 = xpc_dictionary_get_uint64(v18, "StopOnExitCode");

  BOOL v15 = 0;
  if (a3)
  {
LABEL_22:
    pid_t v19 = sub_10000F590(a3);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10003C000;
    v32[3] = &unk_10005B2C0;
    BOOL v35 = v15;
    char v36 = uint64;
    id v33 = v13;
    uint64_t v34 = a3;
    BOOL v37 = v16;
    [v33 monitorOnQueue:v19 withHandler:v32];
  }
LABEL_23:
  id v31 = 0;
  unsigned __int8 v20 = [v13 submit:&v31];
  id v10 = v31;
  if (v20)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = xpc_dictionary_get_string(v4, "Label");
      __int16 v22 = [v13 handle];
      id v23 = [v22 UUIDString];
      id v24 = [v23 UTF8String];
      *(_DWORD *)int buf = 136315650;
      *(void *)long long v39 = v21;
      *(_WORD *)&v39[8] = 2080;
      *(void *)&v39[10] = v24;
      __int16 v40 = 1024;
      int v41 = a2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Submited job %s (UUID: %s) for uid %d", buf, 0x1Cu);
    }
    CFErrorRef v9 = 0;
  }
  else
  {
    id v25 = &_os_log_default;
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    long long v26 = [v10 localizedDescription];
    *(_DWORD *)int buf = 138412546;
    *(void *)long long v39 = v26;
    *(_WORD *)&v39[8] = 1024;
    *(_DWORD *)&v39[10] = 22;
    os_log_type_t v27 = (char *)_os_log_send_and_compose_impl();

    CFErrorRef v9 = sub_10000BF78("launchd_session_add_job", "launchd_session.m", 421, "com.apple.security.cryptex.posix", 22, v10, v27);
    free(v27);
  }

LABEL_29:
  return v9;
}

void sub_10003BFD4(_Unwind_Exception *a1)
{
  free(v1);
  _Unwind_Resume(a1);
}

void sub_10003C000(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == (id)4)
  {
    id v4 = [v3 lastExitStatus];
    unsigned __int16 v5 = (unsigned __int16)[v4 wait4Status];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = [*(id *)(a1 + 32) handle];
      id v7 = [v6 UUIDString];
      int v14 = 136315650;
      id v15 = [v7 UTF8String];
      __int16 v16 = 1024;
      unsigned int v17 = (v5 & 0x7F) == 0;
      __int16 v18 = 1024;
      int v19 = HIBYTE(v5);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cryptex Session process (uuid %s) exited (%d) with code: %hhu", (uint8_t *)&v14, 0x18u);
    }
    if (*(unsigned char *)(a1 + 48)
      || *(unsigned char *)(a1 + 49) && *(unsigned __int8 *)(a1 + 49) == HIBYTE(v5)
      || *(unsigned char *)(a1 + 50) && (v5 & 0xFF00) != 0)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = 2;
      uint64_t v10 = HIBYTE(v5);
LABEL_17:
      sub_10000F504(v8, v9, v10);
    }
  }
  else if ([v3 state] == (id)3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      xpc_object_t v11 = [*(id *)(a1 + 32) handle];
      id v12 = [v11 UUIDString];
      int v14 = 136315394;
      id v15 = [v12 UTF8String];
      __int16 v16 = 1024;
      unsigned int v17 = [v3 lastSpawnError];
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Cryptex Session process (uuid %s) failed to launch with lastSpawnError: %d", (uint8_t *)&v14, 0x12u);
    }
    if (*(unsigned char *)(a1 + 48) || *(unsigned char *)(a1 + 50) || *(unsigned char *)(a1 + 49))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v10 = (int)[v3 lastSpawnError];
      uint64_t v8 = v13;
      uint64_t v9 = 1;
      goto LABEL_17;
    }
  }
}

double sub_10003C23C(_OWORD *a1)
{
  double result = 0.0;
  a1[17] = 0u;
  a1[18] = 0u;
  a1[15] = 0u;
  a1[16] = 0u;
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

size_t sub_10003C26C(uint64_t a1, char *__s)
{
  size_t result = strlen(__s);
  *(_DWORD *)a1 |= 2u;
  *(void *)(a1 + 16) = __s;
  *(void *)(a1 + 24) = result;
  return result;
}

uint64_t sub_10003C2A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = os_simple_hash();
  if ((*(unsigned char *)a2 & 2) == 0) {
    sub_10003C4D0();
  }
  unint64_t v5 = v4;
  uint64_t result = sub_10003C34C(a1, *(const void **)(a2 + 16), *(void *)(a2 + 24));
  if (result) {
    sub_10003C508();
  }
  *(void *)(a2 + 8) = *(void *)(a1 + 8 * (v5 % 0x25));
  *(void *)(a1 + 8 * (v5 % 0x25)) = a2;
  if (*(_DWORD *)a2) {
    sub_10003C4EC();
  }
  *(_DWORD *)a2 |= 1u;
  ++*(void *)(a1 + 296);
  return result;
}

uint64_t sub_10003C34C(uint64_t a1, const void *a2, size_t a3)
{
  for (uint64_t i = *(void *)(a1 + 8 * (os_simple_hash() % 0x25uLL)); i; uint64_t i = *(void *)(i + 8))
  {
    if (*(void *)(i + 24) == a3 && !memcmp(*(const void **)(i + 16), a2, a3)) {
      break;
    }
  }
  return i;
}

uint64_t sub_10003C3DC(uint64_t a1, char *__s)
{
  size_t v4 = strlen(__s);

  return sub_10003C34C(a1, __s, v4);
}

uint64_t sub_10003C424(uint64_t a1, uint64_t a2)
{
  return sub_10003C34C(a1, *(const void **)(a2 + 16), *(void *)(a2 + 24));
}

unint64_t sub_10003C430(uint64_t a1, uint64_t a2)
{
  unint64_t result = os_simple_hash();
  unint64_t v5 = (uint64_t *)(a1 + 8 * (result % 0x25));
  uint64_t v6 = *v5;
  if (*v5 != a2)
  {
    do
    {
      uint64_t v7 = v6;
      uint64_t v6 = *(void *)(v6 + 8);
    }
    while (v6 != a2);
    unint64_t v5 = (uint64_t *)(v7 + 8);
  }
  uint64_t *v5 = *(void *)(a2 + 8);
  *(void *)(a2 + 8) = -1;
  if ((*(_DWORD *)a2 & 1) == 0) {
    sub_10003C524();
  }
  *(_DWORD *)a2 &= ~1u;
  --*(void *)(a1 + 296);
  return result;
}

void sub_10003C4D0()
{
}

void sub_10003C4EC()
{
}

void sub_10003C508()
{
}

void sub_10003C524()
{
}

void sub_10003C540(uint64_t a1, xpc_object_t a2, void *a3)
{
  xpc_object_t v6 = xpc_array_create(0, 0);
  if (a2) {
    xpc_retain(a2);
  }
  else {
    a2 = xpc_dictionary_create(0, 0, 0);
  }
  xpc_dictionary_set_value(a2, "argv", v6);
  xpc_dictionary_set_uint64(a2, "subsystem", *(void *)(a1 + 16));
  xpc_dictionary_set_uint64(a2, "routine", *(void *)(a1 + 24));
  xpc_dictionary_set_uint64(a2, "target-type", *(void *)(a1 + 32));
  uint64_t v7 = *(void *)(a1 + 32);
  switch(v7)
  {
    case 2:
      xpc_dictionary_set_mach_send();
      break;
    case 1:
      xpc_dictionary_set_string(a2, "target", (const char *)(a1 + 40));
      break;
    case 0:
      xpc_dictionary_set_uint64(a2, "target", *(void *)(a1 + 40));
      break;
  }
  *(void *)a1 = 1;
  if (a3) {
    uint64_t v8 = os_retain(a3);
  }
  else {
    uint64_t v8 = &_os_log_default;
  }
  *(void *)(a1 + 8) = v8;
  *(void *)(a1 + 296) = a2;
  *(void *)(a1 + 304) = v6;
  *(_DWORD *)(a1 + 312) = -1;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  if (v6)
  {
    os_release(v6);
  }
}

CFErrorRef sub_10003C6B4(uint64_t a1, xpc_object_t xdict, NSObject *a3)
{
  CFTypeRef cf = 0;
  memset(v25, 0, sizeof(v25));
  xpc_object_t value = xpc_dictionary_get_value(xdict, "argv");
  if (!value || (xpc_object_t v7 = value, xpc_get_type(value) != (xpc_type_t)&_xpc_type_array))
  {
    if (a3) {
      os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
    }
    int v27 = 67109120;
    int v28 = 94;
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    uint64_t v9 = "com.apple.security.cryptex.posix";
    int v10 = 105;
LABEL_6:
    CFIndex v11 = 94;
LABEL_7:
    CFTypeRef v12 = 0;
    goto LABEL_8;
  }
  xpc_object_t v15 = xpc_dictionary_get_value(xdict, "subsystem");
  if (!v15 || (__int16 v16 = v15, xpc_get_type(v15) != (xpc_type_t)&_xpc_type_uint64))
  {
    if (a3) {
      os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
    }
    int v27 = 67109120;
    int v28 = 94;
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    uint64_t v9 = "com.apple.security.cryptex.posix";
    int v10 = 113;
    goto LABEL_6;
  }
  xpc_object_t v17 = xpc_dictionary_get_value(xdict, "routine");
  if (!v17 || (__int16 v18 = v17, xpc_get_type(v17) != (xpc_type_t)&_xpc_type_uint64))
  {
    if (a3) {
      os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
    }
    int v27 = 67109120;
    int v28 = 94;
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    uint64_t v9 = "com.apple.security.cryptex.posix";
    int v10 = 121;
    goto LABEL_6;
  }
  xpc_object_t v19 = xpc_dictionary_get_value(xdict, "target-type");
  if (!v19 || (unsigned __int8 v20 = v19, xpc_get_type(v19) != (xpc_type_t)&_xpc_type_uint64))
  {
    if (a3) {
      os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
    }
    int v27 = 67109120;
    int v28 = 94;
    uint64_t v8 = (char *)_os_log_send_and_compose_impl();
    uint64_t v9 = "com.apple.security.cryptex.posix";
    int v10 = 129;
    goto LABEL_6;
  }
  xpc_object_t v21 = xpc_dictionary_get_value(xdict, "target");
  uint64_t v22 = xpc_uint64_get_value(v20);
  if (v22 == 2)
  {
    if (xpc_get_type(v21) != (xpc_type_t)&_xpc_type_mach_send)
    {
      if (a3) {
        os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
      }
      int v27 = 67109120;
      int v28 = 22;
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      uint64_t v9 = "com.apple.security.cryptex.posix";
      int v10 = 167;
      goto LABEL_60;
    }
    *(_DWORD *)(a1 + 40) = xpc_mach_send_copy_right();
  }
  else if (v22 == 1)
  {
    if (xpc_get_type(v21) != (xpc_type_t)&_xpc_type_string)
    {
      if (a3) {
        os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
      }
      int v27 = 67109120;
      int v28 = 22;
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      uint64_t v9 = "com.apple.security.cryptex.posix";
      int v10 = 148;
      goto LABEL_60;
    }
    if (xpc_string_get_length(v21) >= 0xFF)
    {
      if (a3) {
        os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
      }
      int v27 = 67109120;
      int v28 = 22;
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      uint64_t v9 = "com.apple.security.cryptex.posix";
      int v10 = 156;
      goto LABEL_60;
    }
    string_ptr = xpc_string_get_string_ptr(v21);
    strlcpy((char *)(a1 + 40), string_ptr, 0xFFuLL);
  }
  else
  {
    if (v22)
    {
      if (a3) {
        os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
      }
      int v27 = 67109120;
      int v28 = 22;
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      uint64_t v9 = "com.apple.security.cryptex.posix";
      int v10 = 175;
      goto LABEL_60;
    }
    if (xpc_get_type(v21) != (xpc_type_t)&_xpc_type_uint64)
    {
      if (a3) {
        os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
      }
      int v27 = 67109120;
      int v28 = 22;
      uint64_t v8 = (char *)_os_log_send_and_compose_impl();
      uint64_t v9 = "com.apple.security.cryptex.posix";
      int v10 = 139;
LABEL_60:
      CFIndex v11 = 22;
      goto LABEL_7;
    }
    *(void *)(a1 + 40) = xpc_uint64_get_value(v21);
  }
  if (sub_10004072C(xdict, "cferror", (CFErrorRef *)&cf))
  {
    *(void *)a1 = 1;
    if (a3) {
      id v24 = os_retain(a3);
    }
    else {
      id v24 = &_os_log_default;
    }
    *(void *)(a1 + 8) = v24;
    *(void *)(a1 + 16) = xpc_uint64_get_value(v16);
    *(void *)(a1 + 24) = xpc_uint64_get_value(v18);
    *(void *)(a1 + 32) = xpc_uint64_get_value(v20);
    *(void *)(a1 + 296) = xpc_retain(xdict);
    *(void *)(a1 + 304) = v7;
    xpc_dictionary_get_audit_token();
    sub_10003D1CC((uid_t *)(a1 + 328), v25);
    CFErrorRef v13 = 0;
    goto LABEL_9;
  }
  if (a3) {
    os_log_type_enabled(a3, OS_LOG_TYPE_ERROR);
  }
  LOWORD(v27) = 0;
  uint64_t v8 = (char *)_os_log_send_and_compose_impl();
  CFTypeRef v12 = cf;
  uint64_t v9 = "com.apple.security.cryptex";
  int v10 = 181;
  CFIndex v11 = 16;
LABEL_8:
  CFErrorRef v13 = sub_10000BF78("rpc_init_local", "rpc.c", v10, v9, v11, v12, v8);
  free(v8);
LABEL_9:
  if (cf) {
    CFRelease(cf);
  }
  return v13;
}

uint64_t sub_10003D1CC(uid_t *a1, _OWORD *a2)
{
  long long v4 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v4;
  *a1 = audit_token_to_auid(&v13);
  long long v5 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v5;
  a1[1] = audit_token_to_euid(&v13);
  long long v6 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v6;
  a1[2] = audit_token_to_egid(&v13);
  long long v7 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v7;
  a1[3] = audit_token_to_ruid(&v13);
  long long v8 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v8;
  a1[4] = audit_token_to_rgid(&v13);
  long long v9 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v9;
  a1[5] = audit_token_to_pid(&v13);
  long long v10 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v10;
  a1[6] = audit_token_to_asid(&v13);
  long long v11 = a2[1];
  *(_OWORD *)v13.val = *a2;
  *(_OWORD *)&v13.val[4] = v11;
  uint64_t result = audit_token_to_pidversion(&v13);
  a1[7] = result;
  return result;
}

void sub_10003D298(void *a1, uint64_t a2)
{
  memcpy(a1 + 2, (const void *)(a2 + 16), 0x118uLL);
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a2 + 296));
  if (reply)
  {
    xpc_object_t v5 = reply;
    uint64_t v6 = 2;
  }
  else
  {
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    uint64_t v6 = 10;
  }
  sub_10003C540((uint64_t)a1, v5, *(void **)(a2 + 8));
  *a1 |= v6;
  *(void *)a2 |= 4uLL;
  if (v5)
  {
    os_release(v5);
  }
}

void *sub_10003D350(unsigned char *a1)
{
  if ((*a1 & 0x40) != 0) {
    sub_10003DA20();
  }
  uint64_t v2 = malloc_type_calloc(1uLL, 0x168uLL, 0x61D5536CuLL);
  if (!v2) {
    sub_10003D940(&v5, v6);
  }
  id v3 = v2;
  memcpy(v2, a1, 0x168uLL);
  *v3 |= 0x40uLL;
  v3[37] = xpc_retain(*((xpc_object_t *)a1 + 37));
  *v3 |= 0x80uLL;
  if (*((void *)a1 + 4) == 2) {
    *((_DWORD *)a1 + 10) = mach_right_send_retain();
  }
  return v3;
}

void sub_10003D424(unsigned char *a1)
{
  if (*a1)
  {
    if (*((void *)a1 + 4) == 2) {
      mach_right_send_release();
    }
    xpc_release(*((xpc_object_t *)a1 + 37));
    os_release(*((void **)a1 + 1));
    if ((*a1 & 0x40) != 0)
    {
      free(a1);
    }
  }
}

BOOL sub_10003D498(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2
      && a1[1] == a2[1]
      && a1[2] == a2[2]
      && a1[3] == a2[3]
      && a1[4] == a2[4]
      && a1[5] == a2[5]
      && a1[6] == a2[6]
      && a1[7] == a2[7];
}

void sub_10003D524(uint64_t a1, unsigned char *a2, int a3)
{
  if (a3 == 36)
  {
    if ((*(unsigned char *)a1 & 4) == 0) {
      sub_10003DA3C();
    }
    if ((*a2 & 0x80) == 0) {
      sub_10003DA58();
    }
    int v6 = *__error();
    long long v7 = *(NSObject **)(a1 + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "reply in-progress", buf, 2u);
    }
    *__error() = v6;
  }
  else if (a3)
  {
    *(_DWORD *)int buf = 67109120;
    int v11 = a3;
    long long v8 = (char *)_os_log_send_and_compose_impl();
    long long v9 = sub_10000BF78("rpc_reply", "rpc.c", 373, "com.apple.security.cryptex.posix", a3, 0, v8);
    free(v8);
    sub_10003D6EC(a1, (uint64_t)a2, v9);
    if (v9) {
      CFRelease(v9);
    }
  }
  else
  {
    sub_10003D6EC(a1, (uint64_t)a2, 0);
  }
}

void sub_10003D6EC(uint64_t a1, uint64_t a2, __CFError *a3)
{
  if ((*(void *)a2 & 8) == 0)
  {
    if ((*(void *)a2 & 0x10) != 0) {
      sub_10003DB24();
    }
    int v6 = *__error();
    long long v7 = *(NSObject **)(a1 + 8);
    if (a3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 138412290;
        *(void *)&uint8_t buf[4] = a3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "sending reply: %@", buf, 0xCu);
      }
      *__error() = v6;
      *(void *)a2 |= 0x10uLL;
      xpc_object_t v8 = sub_100040C5C(a3);
      xpc_dictionary_set_value(*(xpc_object_t *)(a2 + 296), "cferror", v8);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "sending reply [no error]", buf, 2u);
      }
      xpc_object_t v8 = 0;
      *__error() = v6;
      *(void *)a2 |= 0x10uLL;
    }
    int v11 = xpc_pipe_routine_reply();
    if (v11 == 32)
    {
      int v12 = *__error();
      audit_token_t v13 = *(NSObject **)(a1 + 8);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
      *(_WORD *)int buf = 0;
      int v14 = "caller died";
    }
    else
    {
      if (v11) {
        sub_10003DA74(&v15, buf);
      }
      int v12 = *__error();
      audit_token_t v13 = *(NSObject **)(a1 + 8);
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_20;
      }
      *(_WORD *)int buf = 0;
      int v14 = "reply sent";
    }
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, v14, buf, 2u);
LABEL_20:
    *__error() = v12;
    if (v8) {
      os_release(v8);
    }
    return;
  }
  int v9 = *__error();
  long long v10 = *(NSObject **)(a1 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "fake reply, not sending", buf, 2u);
  }
  *__error() = v9;
}

void sub_10003D940(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_10003DA20()
{
}

void sub_10003DA3C()
{
}

void sub_10003DA58()
{
}

void sub_10003DA74(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_10003DB24()
{
}

os_log_t sub_10003DB40(uint64_t a1, int a2, char *category)
{
  os_log_t result = os_log_create("com.apple.libcryptex", category);
  *(void *)(a1 + 16) = result;
  return result;
}

char *sub_10003DB74(uint64_t a1, const char *a2)
{
  long long v4 = *(const char **)a1;
  int v5 = *__error();
  int v6 = *(NSObject **)(a1 + 16);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7)
    {
      xpc_object_t v8 = *(const char **)a1;
      *(_DWORD *)int buf = 136446722;
      int v12 = v4;
      __int16 v13 = 2080;
      int v14 = v8;
      __int16 v15 = 2080;
      __int16 v16 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: changing name: %s -> %s", buf, 0x20u);
    }
    *__error() = v5;
    free(*(void **)(a1 + 8));
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)int buf = 136446466;
      int v12 = "[anonymous]";
      __int16 v13 = 2080;
      int v14 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting name: %s", buf, 0x16u);
    }
    *__error() = v5;
  }
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      os_log_t result = strdup(a2);
      if (result) {
        break;
      }
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    os_log_t result = strdup(a2);
    if (!result) {
      sub_1000420A0(a2, &v10, buf);
    }
  }
  *(void *)a1 = result;
  *(void *)(a1 + 8) = result;
  return result;
}

void sub_10003DCF0(uint64_t a1, const char *a2)
{
  long long v4 = *(const char **)a1;
  int v5 = *__error();
  int v6 = *(NSObject **)(a1 + 16);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v4)
  {
    if (v7)
    {
      xpc_object_t v8 = *(const char **)a1;
      int v9 = 136446722;
      uint64_t v10 = v4;
      __int16 v11 = 2080;
      int v12 = v8;
      __int16 v13 = 2080;
      int v14 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: changing name: %s -> %s", (uint8_t *)&v9, 0x20u);
    }
    *__error() = v5;
    free(*(void **)(a1 + 8));
  }
  else
  {
    if (v7)
    {
      int v9 = 136446466;
      uint64_t v10 = "[anonymous]";
      __int16 v11 = 2080;
      int v12 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%{public}s: setting name: %s", (uint8_t *)&v9, 0x16u);
    }
    *__error() = v5;
  }
  *(void *)a1 = a2;
  *(void *)(a1 + 8) = 0;
}

void sub_10003DE34(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  uint64_t v2 = *(void **)(a1 + 16);

  os_release(v2);
}

uint64_t sub_10003DE70(_DWORD *a1)
{
  uint64_t v1 = *a1;
  *a1 = -1;
  return v1;
}

size_t sub_10003DE84(unsigned char *a1, char *__s)
{
  size_t result = strlen(__s);
  if (result)
  {
    size_t v4 = result;
    for (size_t i = 0; i < v4; i += 2)
    {
      char v8 = 0;
      *(_WORD *)__str = 0;
      __strlcpy_chk();
      size_t result = strtoul(__str, 0, 16);
      if (result >= 0x100) {
        sub_10003F508(&v6, v9);
      }
      *a1++ = result;
    }
  }
  return result;
}

uint64_t sub_10003DF4C(int a1, char *a2, int a3, mode_t a4, int *a5)
{
  int v8 = a3 | 0x100000;
  if ((a3 & 0x200) != 0)
  {
    if ((mkdirat(a1, a2, a4) & 0x80000000) == 0) {
      *__error() = 0;
    }
    int v9 = *__error();
    if (v9 != 17 && v9 != 0)
    {
      int v11 = -1;
      goto LABEL_11;
    }
    v8 &= ~0x200u;
  }
  int v11 = openat(a1, a2, v8);
  if (v11 < 0)
  {
LABEL_11:
    uint64_t result = *__error();
    if (result) {
      return result;
    }
  }
  uint64_t result = 0;
  *a5 = v11;
  return result;
}

uint64_t sub_10003DFEC(int a1, const char *a2)
{
  if (a2)
  {
    int v4 = openat(a1, a2, 0x100000);
    uint64_t v5 = *__error();
    if (v4 < 0)
    {
      int v12 = *__error();
      __int16 v13 = os_log_create("com.apple.libcryptex", "utility");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 67109120;
        LODWORD(d_name) = v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "openat: %{darwin.errno}d", buf, 8u);
      }
      *__error() = v12;
      return v5;
    }
    int v75 = a1;
    uint64_t v6 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 136315138;
      d_uint64_t name = (void *)a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "top-level directory: %s", buf, 0xCu);
    }
    *__error() = v5;
  }
  else
  {
    int v75 = a1;
    int v4 = dup_np();
  }
  BOOL v7 = os_log_create("com.apple.libcryptex", "utility");
  bzero(buf, 0x400uLL);
  memset(&v92, 0, sizeof(v92));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (fstat(v4, &v92) == -1)
    {
      int v14 = *__error();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v15 = *__error();
        *(_DWORD *)int v80 = 136315650;
        statfs v81 = "subdirfd";
        __int16 v82 = 1024;
        int v83 = v4;
        __int16 v84 = 1024;
        LODWORD(v85) = v15;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", v80, 0x18u);
      }
      *__error() = v14;
    }
    else
    {
      if (fcntl(v4, 50, buf))
      {
        int v8 = __error();
        int v9 = strerror(*v8);
        snprintf((char *)buf, 0x400uLL, "[%s]", v9);
      }
      unint64_t v10 = ((unint64_t)v92.st_mode >> 12) ^ 8;
      if (v10 == 15) {
        int v11 = "[unknown]";
      }
      else {
        int v11 = off_10005B6E0[v10];
      }
      __int16 v16 = (void *)os_flagset_copy_string();
      int v17 = *__error();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)int v80 = 136316418;
        statfs v81 = "subdirfd";
        __int16 v82 = 1024;
        int v83 = v4;
        __int16 v84 = 2080;
        signed int v85 = v11;
        __int16 v86 = 2048;
        off_t st_size = v92.st_size;
        __int16 v88 = 2080;
        int v89 = v16;
        __int16 v90 = 2080;
        long long v91 = buf;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s", v80, 0x3Au);
      }
      *__error() = v17;
      free(v16);
    }
  }
  uint64_t v76 = (char *)a2;
  __int16 v18 = fdopendir(v4);
  if (!v18) {
    sub_10003F580(&v92, buf);
  }
  xpc_object_t v19 = v18;
  char v20 = 0;
  xpc_object_t v21 = 0;
  unsigned int v78 = -1;
  unint64_t v22 = 0;
  while (1)
  {
    char v23 = v20;
    if ((v20 & 1) == 0) {
      break;
    }
    int v24 = 128;
LABEL_29:
    int v26 = dirfd(v19);
    if (v22 >= 4) {
      sub_10003F5FC(&v92, buf);
    }
    int v27 = v26;
    char v20 = 0;
    if (strcmp(v21->d_name, "."))
    {
      char v20 = 0;
      if (strcmp(v21->d_name, ".."))
      {
        unint64_t v79 = v22;
        int v28 = *__error();
        long long v29 = os_log_create("com.apple.libcryptex", "utility");
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)int buf = 136315138;
          d_uint64_t name = v21->d_name;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "removing: %s", buf, 0xCu);
        }
        *__error() = v28;
        uint64_t v30 = openat(v27, v21->d_name, 256);
        if ((v30 & 0x80000000) == 0) {
          *__error() = 0;
        }
        int v31 = *__error();
        if (v31 == 62)
        {
          int v38 = *__error();
          long long v39 = os_log_create("com.apple.libcryptex", "utility");
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)int buf = 136315138;
            d_uint64_t name = v21->d_name;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "%s is a symlink", buf, 0xCu);
          }
          *__error() = v38;
        }
        else
        {
          if (v31 == 2)
          {
            int v44 = *__error();
            int v45 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)int buf = 136315138;
              d_uint64_t name = v21->d_name;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "file disappeared: %s", buf, 0xCu);
            }
            unint64_t v22 = 0;
            char v20 = 0;
            *__error() = v44;
            int v43 = 9;
            goto LABEL_94;
          }
          if (v31)
          {
            int v46 = *__error();
            int v47 = *__error();
            long long v48 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 67109120;
              LODWORD(d_name) = v46;
              uint64_t v49 = buf;
              long long v50 = v48;
              int v51 = "openat: %{darwin.errno}d";
              goto LABEL_90;
            }
            goto LABEL_91;
          }
          uint32_t v32 = os_log_create("com.apple.libcryptex", "utility");
          bzero(buf, 0x400uLL);
          memset(&v92, 0, sizeof(v92));
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            if (fstat(v30, &v92) == -1)
            {
              int v64 = *__error();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                int v65 = *__error();
                *(_DWORD *)int v80 = 136315650;
                statfs v81 = "defd";
                __int16 v82 = 1024;
                int v83 = v30;
                __int16 v84 = 1024;
                LODWORD(v85) = v65;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%s fd[%d] : [invalid descriptor]: %{darwin.errno}d", v80, 0x18u);
              }
              *__error() = v64;
            }
            else
            {
              if (fcntl(v30, 50, buf))
              {
                id v33 = __error();
                uint64_t v34 = strerror(*v33);
                snprintf((char *)buf, 0x400uLL, "[%s]", v34);
              }
              unint64_t v35 = ((unint64_t)v92.st_mode >> 12) ^ 8;
              char v36 = "[unknown]";
              if (v35 != 15) {
                char v36 = off_10005B6E0[v35];
              }
              BOOL v37 = (void *)os_flagset_copy_string();
              int v77 = *__error();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)int v80 = 136316418;
                statfs v81 = "defd";
                __int16 v82 = 1024;
                int v83 = v30;
                __int16 v84 = 2080;
                signed int v85 = v36;
                __int16 v86 = 2048;
                off_t st_size = v92.st_size;
                __int16 v88 = 2080;
                int v89 = v37;
                __int16 v90 = 2080;
                long long v91 = buf;
                _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "%s fd[%d]: xpc_type_t type = %s, size = %lld, flags = %s, path = %s", v80, 0x3Au);
              }
              *__error() = v77;
              free(v37);
            }
          }
        }
        if ((unlinkat(v27, v21->d_name, v24) & 0x80000000) == 0) {
          *__error() = 0;
        }
        int v40 = *__error();
        if (v40 <= 15)
        {
          if (!v40)
          {
            int v58 = *__error();
            __int16 v59 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)int buf = 136315138;
              d_uint64_t name = v21->d_name;
              _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEBUG, "removed: %s", buf, 0xCu);
            }
            unint64_t v22 = 0;
            char v20 = 0;
            int v43 = 0;
            *__error() = v58;
            goto LABEL_94;
          }
          if (v40 != 1)
          {
            if (v40 == 2)
            {
              int v41 = *__error();
              uint64_t v42 = os_log_create("com.apple.libcryptex", "utility");
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)int buf = 136315138;
                d_uint64_t name = v21->d_name;
                _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "file disappeared: %s", buf, 0xCu);
              }
              char v20 = 0;
              int v43 = 0;
              *__error() = v41;
              goto LABEL_93;
            }
LABEL_88:
            int v46 = *__error();
            int v47 = *__error();
            unint64_t v63 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 67109120;
              LODWORD(d_name) = v46;
              uint64_t v49 = buf;
              long long v50 = v63;
              int v51 = "unlinkat: %{darwin.errno}d";
LABEL_90:
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, v51, v49, 8u);
            }
            goto LABEL_91;
          }
          goto LABEL_71;
        }
        if (v40 != 16)
        {
          if (v40 != 21)
          {
            if (v40 != 66) {
              goto LABEL_88;
            }
            int v52 = *__error();
            uint64_t v53 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)int buf = 136315138;
              d_uint64_t name = v21->d_name;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEBUG, "re-trying directory cleanup: %s", buf, 0xCu);
            }
            *__error() = v52;
            ++v79;
          }
LABEL_71:
          int v54 = *__error();
          int v55 = os_log_create("com.apple.libcryptex", "utility");
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)int buf = 136315138;
            d_uint64_t name = v21->d_name;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "emptying subdirectory: %s", buf, 0xCu);
          }
          *__error() = v54;
          int v56 = sub_10003DFEC(v30, 0);
          if (v56)
          {
            int v46 = v56;
            int v47 = *__error();
            __int16 v57 = os_log_create("com.apple.libcryptex", "utility");
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 67109120;
              LODWORD(d_name) = v46;
              uint64_t v49 = buf;
              long long v50 = v57;
              int v51 = "emptydir [recurse]: %{darwin.errno}d";
              goto LABEL_90;
            }
            goto LABEL_91;
          }
          goto LABEL_87;
        }
        if ((v23 & 1) == 0 && v21->d_type != 4)
        {
          int v66 = *__error();
          int v67 = *__error();
          uint64_t v68 = os_log_create("com.apple.libcryptex", "utility");
          if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = 136315394;
            d_uint64_t name = v21->d_name;
            __int16 v95 = 1024;
            int v96 = v66;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "file busy: %s: %{darwin.errno}d", buf, 0x12u);
          }
          unsigned int v78 = v66;
          char v20 = 0;
          *__error() = v67;
          goto LABEL_92;
        }
        bzero(buf, 0x400uLL);
        if (realpath_np()) {
          sub_10003F700(v80, &v92);
        }
        int v60 = *__error();
        char v61 = os_log_create("com.apple.libcryptex", "utility");
        if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
        {
          v92.st_dev = 136315138;
          *(void *)&v92.st_mode = v21->d_name;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "mount point; forcing unmount: %s",
            (uint8_t *)&v92,
            0xCu);
        }
        *__error() = v60;
        if (unmount((const char *)buf, 0x80000))
        {
          int v46 = *__error();
          int v47 = *__error();
          int v62 = os_log_create("com.apple.libcryptex", "utility");
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            v92.st_dev = 67109120;
            *(_DWORD *)&v92.st_mode = v46;
            uint64_t v49 = (uint8_t *)&v92;
            long long v50 = v62;
            int v51 = "unmount + MNT_FORCE: %{darwin.errno}d";
            goto LABEL_90;
          }
LABEL_91:
          unsigned int v78 = v46;
          char v20 = 0;
          *__error() = v47;
LABEL_92:
          int v43 = 4;
          goto LABEL_93;
        }
LABEL_87:
        int v43 = 0;
        unsigned int v78 = 0;
        char v20 = 1;
LABEL_93:
        unint64_t v22 = v79;
LABEL_94:
        if (v30 != -1 && close(v30) == -1) {
          sub_10004132C(&v92, buf);
        }
        if (v43 && v43 != 9)
        {
          uint64_t v5 = v78;
          goto LABEL_116;
        }
      }
    }
  }
  id v25 = readdir(v19);
  if (v25)
  {
    xpc_object_t v21 = v25;
    int v24 = 0;
    goto LABEL_29;
  }
  if (v76)
  {
    int v69 = unlinkat(v75, v76, 128);
    uint64_t v5 = *__error();
    if (v69)
    {
      int v70 = *__error();
      __int16 v71 = os_log_create("com.apple.libcryptex", "utility");
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)int buf = 67109120;
        LODWORD(d_name) = v5;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_ERROR, "unlinkat [top level]: %{darwin.errno}d", buf, 8u);
      }
      goto LABEL_115;
    }
    __int16 v73 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 136315138;
      d_uint64_t name = v76;
      _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEBUG, "removed top-level directory: %s", buf, 0xCu);
    }
    int v70 = v5;
  }
  else
  {
    int v70 = *__error();
    int v72 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "removed subdirectory", buf, 2u);
    }
  }
  uint64_t v5 = 0;
LABEL_115:
  *__error() = v70;
LABEL_116:
  if (closedir(v19) == -1) {
    sub_10003F684(&v92, buf);
  }
  return v5;
}

uint64_t sub_10003EE68(int a1, char *a2, int *a3)
{
  uint64_t v5 = mkdtempat_np(a1, a2);
  if (!v5) {
    return *__error();
  }
  int v6 = openat(a1, v5, 1048832);
  if (v6 < 0) {
    return *__error();
  }
  int v7 = v6;
  uint64_t result = 0;
  *a3 = v7;
  return result;
}

uint64_t sub_10003EEC4(const char *a1, mode_t a2, int *a3)
{
  if ((mkdir(a1, a2) & 0x80000000) == 0) {
    *__error() = 0;
  }
  int v5 = *__error();
  if (v5) {
    BOOL v6 = v5 == 17;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    int v11 = __error();
    return *v11;
  }
  int v7 = opendir(a1);
  int v11 = __error();
  if (!v7) {
    return *v11;
  }
  int *v11 = 0;
  int v8 = readdir(v7);
  if (v8)
  {
    while (1)
    {
      d_uint64_t name = v8->d_name;
      if (strcmp(v8->d_name, "."))
      {
        if (strcmp(d_name, "..")) {
          break;
        }
      }
      int v8 = readdir(v7);
      if (!v8) {
        goto LABEL_13;
      }
    }
    uint64_t v10 = 17;
  }
  else
  {
LABEL_13:
    if (*__error() || (int v12 = open(a1, 1048832), v12 < 0))
    {
      uint64_t v10 = *__error();
    }
    else
    {
      uint64_t v10 = 0;
      *a3 = v12;
    }
  }
  if (closedir(v7) == -1) {
    sub_10003F684(&v14, v15);
  }
  return v10;
}

uint64_t sub_10003F01C(int a1, void *a2)
{
  memset(&v20, 0, sizeof(v20));
  if (fstat(a1, &v20))
  {
    uint64_t v4 = *__error();
    int v5 = *__error();
    BOOL v6 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v22) = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "stat: %{darwin.errno}d", buf, 8u);
    }
    off_t st_size = 0;
LABEL_5:
    int v8 = 0;
    *__error() = v5;
LABEL_6:
    if (!v4) {
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  off_t st_size = v20.st_size;
  if (v20.st_size < 0) {
    sub_10003F788();
  }
  uint64_t v10 = malloc_type_malloc(v20.st_size, 0xD8A116BDuLL);
  if (!v10)
  {
    uint64_t v4 = *__error();
    int v5 = *__error();
    int v15 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      LODWORD(v22) = v4;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "malloc: %{darwin.errno}d", buf, 8u);
    }
    goto LABEL_5;
  }
  int v8 = v10;
  while (1)
  {
    ssize_t v11 = pread(a1, v8, st_size, 0);
    if ((v11 & 0x8000000000000000) == 0) {
      break;
    }
    int v12 = *__error();
    __int16 v13 = os_log_create("com.apple.libcryptex", "utility");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v14 = *__error();
      *(_DWORD *)int buf = 67109120;
      LODWORD(v22) = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "pread: %{darwin.errno}d", buf, 8u);
    }
    *__error() = v12;
    uint64_t v4 = *__error();
    if (v4 != 4) {
      goto LABEL_6;
    }
  }
  ssize_t v16 = v11;
  int v17 = *__error();
  __int16 v18 = os_log_create("com.apple.libcryptex", "utility");
  xpc_object_t v19 = v18;
  if (v16 == st_size)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 134217984;
      off_t v22 = st_size;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "read %ld bytes", buf, 0xCu);
    }
    *__error() = v17;
LABEL_7:
    sub_10003F808(a2, 0, (uint64_t)j__free, (uint64_t)v8, st_size);
    uint64_t v4 = 0;
    int v8 = 0;
    goto LABEL_8;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)int buf = 134218240;
    off_t v22 = v16;
    __int16 v23 = 2048;
    off_t v24 = st_size;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "truncated read: actual = %ld, expected = %lu", buf, 0x16u);
  }
  *__error() = v17;
  uint64_t v4 = 5;
LABEL_8:
  free(v8);
  return v4;
}

uint64_t sub_10003F38C(void *a1, const char *a2, const char *a3)
{
  if (xpc_dictionary_get_value(a1, a2)) {
    return 17;
  }
  xpc_dictionary_set_string(a1, a2, a3);
  return 0;
}

BOOL sub_10003F3E0(void *a1, const char *a2)
{
  if (xpc_get_type(a1) == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(a1);
    return strcmp(a2, string_ptr) == 0;
  }
  else if (xpc_get_type(a1) == (xpc_type_t)&_xpc_type_array && xpc_array_get_count(a1))
  {
    size_t v7 = 0;
    do
    {
      xpc_object_t value = xpc_array_get_value(a1, v7);
      uint64_t v4 = sub_10003F3E0(value, a2);
      if (v4) {
        break;
      }
      ++v7;
    }
    while (v7 < xpc_array_get_count(a1));
  }
  else
  {
    return 0;
  }
  return v4;
}

xpc_object_t sub_10003F4A4(void *a1, const char *a2, const char *a3)
{
  xpc_object_t result = xpc_dictionary_get_value(a1, a2);
  if (result)
  {
    return (xpc_object_t)sub_10003F3E0(result, a3);
  }
  return result;
}

void sub_10003F508(void *a1, _OWORD *a2)
{
}

void sub_10003F580(void *a1, _OWORD *a2)
{
}

void sub_10003F5FC(void *a1, _OWORD *a2)
{
}

void sub_10003F684(void *a1, _OWORD *a2)
{
}

void sub_10003F700(void *a1, _OWORD *a2)
{
}

void sub_10003F788()
{
}

uint64_t sub_10003F7A8(void *a1, size_t a2)
{
  uint64_t result = munmap(a1, a2);
  if (result == -1) {
    sub_10003FABC(&v3, v4);
  }
  return result;
}

void *sub_10003F808(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *result = a4;
  result[1] = a5;
  result[2] = a4;
  result[3] = a5;
  result[4] = a2;
  result[5] = a3;
  if (a5 < 0) {
    sub_10003FB48(&v5, v6);
  }
  return result;
}

double sub_10003F870(__n128 *a1, __n128 *a2)
{
  *(void *)&double result = sub_10003F87C(a1, a2, 0, a2->n128_u64[1]).n128_u64[0];
  return result;
}

__n128 sub_10003F87C(__n128 *a1, __n128 *a2, uint64_t a3, unint64_t a4)
{
  if (a4 + a3 > a2->n128_u64[1])
  {
    os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    _os_log_send_and_compose_impl();
    _os_crash_msg();
    __break(1u);
  }
  a1->n128_u64[0] = a2->n128_u64[0] + a3;
  a1->n128_u64[1] = a4;
  a1[1].n128_u64[0] = a2->n128_u64[0];
  a1[1].n128_u64[1] = a2->n128_u64[1];
  __n128 result = a2[2];
  a1[2] = result;
  a2[2].n128_u64[1] = 0;
  return result;
}

FILE *sub_10003F9B8(uint64_t a1, char *__mode, unint64_t a3)
{
  if ((a3 & 0x8000000000000000) != 0 || (size_t v5 = *(void *)(a1 + 8), v5 < a3)) {
    sub_10003FBDC();
  }
  BOOL v6 = fmemopen(*(void **)a1, v5, __mode);
  if (!v6) {
    sub_10003FBF8(&v9, v10);
  }
  size_t v7 = v6;
  if (fseek(v6, a3, 0) == -1) {
    sub_10003FC84(&v9, v10);
  }
  return v7;
}

void *sub_10003FA64(void *result)
{
  if (result)
  {
    if (*result)
    {
      uint64_t v1 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))result[5];
      if (v1)
      {
        if (result[6]) {
          sub_10003FD10();
        }
        uint64_t v2 = result[3];
        uint64_t v3 = result[4];
        uint64_t v4 = result[2];
        return (void *)v1(v4, v2, v3);
      }
    }
  }
  return result;
}

void sub_10003FABC(void *a1, _OWORD *a2)
{
}

void sub_10003FB48(void *a1, _OWORD *a2)
{
}

void sub_10003FBDC()
{
}

void sub_10003FBF8(void *a1, _OWORD *a2)
{
}

void sub_10003FC84(void *a1, _OWORD *a2)
{
}

void sub_10003FD10()
{
}

void *sub_10003FD2C(void *a1, size_t a2)
{
  if (a2 <= 0x17) {
    sub_10003FE74(&v7, v8);
  }
  if (_dispatch_is_multithreaded())
  {
    uint64_t v4 = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
    if (!v4)
    {
      do
      {
        __os_temporary_resource_shortage();
        size_t v5 = malloc_type_calloc(1uLL, a2, 0x1B044E25uLL);
      }
      while (!v5);
      uint64_t v4 = v5;
    }
  }
  else
  {
    uint64_t v4 = malloc_type_calloc(1uLL, a2, 0x61D5536CuLL);
    if (!v4) {
      sub_10003FF24(&v7, v8);
    }
  }
  if (a1) {
    void *v4 = os_retain(a1);
  }
  return v4;
}

void sub_10003FE2C(void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      os_release(v2);
    }
    free(a1);
  }
}

void sub_10003FE74(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_10003FF24(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  uint64_t v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

xpc_object_t sub_100040008(uint64_t a1, xpc_object_t object)
{
  if (*(_UNKNOWN **)a1 != &_xpc_type_array && *(void *)a1 != (void)&_xpc_type_dictionary) {
    sub_100040F7C();
  }
  xpc_type_t type = xpc_get_type(object);
  if (type != *(xpc_type_t *)a1) {
    return 0;
  }
  if (type == (xpc_type_t)&_xpc_type_array)
  {
    size_t v8 = *(void *)(a1 + 24);
    if (v8 >= xpc_array_get_count(object)) {
      return 0;
    }
    xpc_object_t value = xpc_array_get_value(object, *(void *)(a1 + 24));
  }
  else
  {
    xpc_object_t value = xpc_dictionary_get_value(object, *(const char **)(a1 + 16));
  }
  uint64_t v9 = value;
  if (!value || xpc_get_type(value) != *(xpc_type_t *)(a1 + 8)) {
    return 0;
  }

  return xpc_retain(v9);
}

uint64_t sub_1000400E8(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2000000000;
  int v8 = 0;
  if (xdict)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 0x40000000;
    v4[2] = sub_1000401A0;
    v4[3] = &unk_10005B780;
    v4[4] = &v5;
    _OWORD v4[5] = a1;
    xpc_dictionary_apply(xdict, v4);
    uint64_t v2 = *((unsigned int *)v6 + 6);
  }
  else
  {
    uint64_t v2 = 0;
  }
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t sub_1000401A0(uint64_t a1, const char *a2, void *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), a2);
  if (!value)
  {
LABEL_9:
    xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 40), a2, a3);
    return 1;
  }
  xpc_object_t v7 = value;
  xpc_type_t type = xpc_get_type(value);
  if (type == xpc_get_type(a3))
  {
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 0x40000000;
      applier[2] = sub_100040360;
      applier[3] = &unk_10005B758;
      void applier[4] = v7;
      xpc_dictionary_apply(a3, applier);
      return 1;
    }
    goto LABEL_9;
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 79;
  int v9 = *__error();
  if (qword_10005E8B8 != -1) {
    dispatch_once(&qword_10005E8B8, &stru_10005B7C0);
  }
  uint64_t v10 = qword_10005E8C0;
  if (os_log_type_enabled((os_log_t)qword_10005E8C0, OS_LOG_TYPE_ERROR))
  {
    int v11 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    *(_DWORD *)int buf = 136315394;
    int v15 = a2;
    __int16 v16 = 1024;
    int v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Error merging override for key %s: %{darwin.errno}d", buf, 0x12u);
  }
  * __error() = v9;
  return 1;
}

uint64_t sub_100040360(uint64_t a1, const char *a2, void *a3)
{
  return 1;
}

uint64_t sub_100040380(void *a1, const char *a2, uint64_t *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2;
  }
  uint64_t v5 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_uint64) {
    return 79;
  }
  uint64_t v7 = xpc_uint64_get_value(v5);
  uint64_t result = 0;
  *a3 = v7;
  return result;
}

uint64_t sub_1000403E4(void *a1, const char *a2, const char **a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2;
  }
  uint64_t v5 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_string) {
    return 79;
  }
  string_ptr = xpc_string_get_string_ptr(v5);
  uint64_t result = 0;
  *a3 = string_ptr;
  return result;
}

uint64_t sub_100040448(void *a1, const char *a2, BOOL *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2;
  }
  uint64_t v5 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_BOOL) {
    return 79;
  }
  BOOL v7 = xpc_BOOL_get_value(v5);
  uint64_t result = 0;
  *a3 = v7;
  return result;
}

uint64_t sub_1000404AC(void *a1, const char *a2, const _xpc_type_s *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value)
  {
    int v6 = *__error();
    if (qword_10005E8B8 != -1) {
      dispatch_once(&qword_10005E8B8, &stru_10005B7C0);
    }
    uint64_t v11 = qword_10005E8C0;
    if (!os_log_type_enabled((os_log_t)qword_10005E8C0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v14 = 136315138;
    int v15 = a2;
    int v8 = "key %s doesn't exist";
    int v9 = v11;
    uint32_t v10 = 12;
    goto LABEL_11;
  }
  if (xpc_get_type(value) != a3)
  {
    int v6 = *__error();
    if (qword_10005E8B8 != -1) {
      dispatch_once(&qword_10005E8B8, &stru_10005B7C0);
    }
    uint64_t v7 = qword_10005E8C0;
    if (!os_log_type_enabled((os_log_t)qword_10005E8C0, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    int v14 = 136315394;
    int v15 = a2;
    __int16 v16 = 2080;
    uint64_t name = xpc_type_get_name(a3);
    int v8 = "key %s isn't of type %s";
    int v9 = v7;
    uint32_t v10 = 22;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v14, v10);
LABEL_12:
    int v12 = __error();
    uint64_t result = 0;
    *int v12 = v6;
    return result;
  }
  return 1;
}

void *sub_100040644(void *a1, void *a2, int a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  int v6 = reply;
  if (reply)
  {
    xpc_dictionary_set_uint64(reply, "error", a3);
    xpc_dictionary_set_value(v6, "argv", a2);
  }
  else
  {
    int v7 = *__error();
    if (qword_10005E8B8 != -1) {
      dispatch_once(&qword_10005E8B8, &stru_10005B7C0);
    }
    int v8 = qword_10005E8C0;
    if (os_log_type_enabled((os_log_t)qword_10005E8C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint32_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "failed to extract reply from request, the connection may have gone", v10, 2u);
    }
    * __error() = v7;
  }
  return v6;
}

uint64_t sub_10004072C(void *a1, const char *a2, CFErrorRef *a3)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 2;
  }
  uint64_t v5 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_dictionary) {
    return 79;
  }

  return sub_10004079C(v5, a3);
}

uint64_t sub_10004079C(void *a1, CFErrorRef *a2)
{
  xpc_object_t value = 0;
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, "cferr_userinfo");
  if (dictionary)
  {
    uint64_t v5 = dictionary;
    string = (char *)xpc_dictionary_get_string(a1, "cferr_domain");
    CFStringRef v7 = sub_10000BC8C(string);
    if (v7)
    {
      CFStringRef v8 = v7;
      int64_t int64 = xpc_dictionary_get_int64(a1, "cferr_code");
      xpc_object_t v10 = xpc_dictionary_get_dictionary(v5, "underlying_cferr");
      if (v10 && sub_10004079C(v10, &value))
      {
        int v11 = *__error();
        if (qword_10005E8B8 != -1) {
          dispatch_once(&qword_10005E8B8, &stru_10005B7C0);
        }
        int v12 = qword_10005E8C0;
        if (!os_log_type_enabled((os_log_t)qword_10005E8C0, OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        *(_DWORD *)int buf = 67109120;
        int v31 = 22;
        __int16 v13 = "Failed to unpack underlying error.: %{darwin.errno}d";
      }
      else
      {
        xpc_dictionary_set_value(v5, "underlying_cferr", 0);
        CFDictionaryRef v17 = (const __CFDictionary *)_CFXPCCreateCFObjectFromXPCObject();
        if (v17)
        {
          CFDictionaryRef v18 = v17;
          MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v17);
          if (MutableCopy)
          {
            CFDictionaryRef v20 = MutableCopy;
            if (value) {
              CFDictionarySetValue(MutableCopy, kCFErrorUnderlyingErrorKey, value);
            }
            CFErrorRef v21 = CFErrorCreate(0, v8, int64, v20);
            if (v21)
            {
              if (a2)
              {
                uint64_t v16 = 0;
                *a2 = v21;
              }
              else
              {
                CFRelease(v21);
                uint64_t v16 = 0;
              }
            }
            else
            {
              int v26 = *__error();
              if (qword_10005E8B8 != -1) {
                dispatch_once(&qword_10005E8B8, &stru_10005B7C0);
              }
              int v27 = qword_10005E8C0;
              if (os_log_type_enabled((os_log_t)qword_10005E8C0, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)int buf = 67109120;
                int v31 = 12;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to create CFError.: %{darwin.errno}d", buf, 8u);
              }
              * __error() = v26;
              uint64_t v16 = 12;
            }
            CFRelease(v20);
          }
          else
          {
            int v24 = *__error();
            if (qword_10005E8B8 != -1) {
              dispatch_once(&qword_10005E8B8, &stru_10005B7C0);
            }
            id v25 = qword_10005E8C0;
            if (os_log_type_enabled((os_log_t)qword_10005E8C0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)int buf = 67109120;
              int v31 = 12;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to create mutable dictionary.: %{darwin.errno}d", buf, 8u);
            }
            * __error() = v24;
            uint64_t v16 = 12;
          }
          CFRelease(v18);
          goto LABEL_45;
        }
        int v11 = *__error();
        if (qword_10005E8B8 != -1) {
          dispatch_once(&qword_10005E8B8, &stru_10005B7C0);
        }
        int v12 = qword_10005E8C0;
        if (!os_log_type_enabled((os_log_t)qword_10005E8C0, OS_LOG_TYPE_ERROR))
        {
LABEL_31:
          * __error() = v11;
          uint64_t v16 = 22;
LABEL_45:
          CFRelease(v8);
          goto LABEL_46;
        }
        *(_DWORD *)int buf = 67109120;
        int v31 = 22;
        __int16 v13 = "Failed to convert CF to XPC.: %{darwin.errno}d";
      }
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 8u);
      goto LABEL_31;
    }
    int v22 = *__error();
    if (qword_10005E8B8 != -1) {
      dispatch_once(&qword_10005E8B8, &stru_10005B7C0);
    }
    __int16 v23 = qword_10005E8C0;
    if (os_log_type_enabled((os_log_t)qword_10005E8C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      int v31 = 12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to create string.: %{darwin.errno}d", buf, 8u);
    }
    * __error() = v22;
    uint64_t v16 = 12;
  }
  else
  {
    int v14 = *__error();
    if (qword_10005E8B8 != -1) {
      dispatch_once(&qword_10005E8B8, &stru_10005B7C0);
    }
    int v15 = qword_10005E8C0;
    if (os_log_type_enabled((os_log_t)qword_10005E8C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)int buf = 67109120;
      int v31 = 22;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "CFError XPC dictionary is missing user info.: %{darwin.errno}d", buf, 8u);
    }
    * __error() = v14;
    uint64_t v16 = 22;
  }
LABEL_46:
  if (value) {
    CFRelease(value);
  }
  return v16;
}

xpc_object_t sub_100040C5C(__CFError *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  CFDictionaryRef v3 = CFErrorCopyUserInfo(a1);
  if (v3)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v3);
    if (!MutableCopy) {
      sub_100040FB4();
    }
    uint64_t v5 = MutableCopy;
    CFDictionaryRemoveValue(MutableCopy, kCFErrorUnderlyingErrorKey);
    uint64_t v6 = _CFXPCCreateXPCObjectFromCFObject();
    if (!v6) {
      sub_100040FD0();
    }
    CFStringRef v7 = (void *)v6;
    if (CFDictionaryGetValue(v3, kCFErrorUnderlyingErrorKey))
    {
      CFStringRef v8 = (void *)sub_100040C5C();
      if (!v8) {
        sub_100040FEC();
      }
      int v9 = v8;
      xpc_dictionary_set_value(v7, "underlying_cferr", v8);
    }
    else
    {
      int v9 = 0;
    }
    xpc_dictionary_set_value(v2, "cferr_userinfo", v7);
  }
  else
  {
    int v9 = 0;
    CFStringRef v7 = 0;
    uint64_t v5 = 0;
  }
  if (!CFErrorGetDomain(a1)) {
    sub_100040F98();
  }
  CFStringRef Domain = CFErrorGetDomain(a1);
  int v11 = sub_10000BB44(Domain);
  xpc_dictionary_set_string(v2, "cferr_domain", v11);
  int64_t Code = CFErrorGetCode(a1);
  xpc_dictionary_set_int64(v2, "cferr_code", Code);
  free(v11);
  if (v5) {
    CFRelease(v5);
  }
  if (v3) {
    CFRelease(v3);
  }
  if (v7) {
    os_release(v7);
  }
  if (v9) {
    os_release(v9);
  }
  return v2;
}

void *sub_100040DE8(void *a1, void *a2, __CFError *a3)
{
  xpc_object_t reply = xpc_dictionary_create_reply(a1);
  uint64_t v6 = reply;
  if (reply)
  {
    xpc_dictionary_set_value(reply, "argv", a2);
    if (a3)
    {
      xpc_object_t v7 = sub_100040C5C(a3);
      xpc_dictionary_set_value(v6, "cferr", v7);
      if (v7) {
        os_release(v7);
      }
    }
  }
  else
  {
    int v8 = *__error();
    if (qword_10005E8B8 != -1) {
      dispatch_once(&qword_10005E8B8, &stru_10005B7C0);
    }
    int v9 = qword_10005E8C0;
    if (os_log_type_enabled((os_log_t)qword_10005E8C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "failed to extract reply from request, the connection may have gone", v11, 2u);
    }
    * __error() = v8;
  }
  return v6;
}

uint64_t sub_100040EEC(void *a1, void *a2)
{
  if (!sub_1000404AC(a1, "argv", (const _xpc_type_s *)&_xpc_type_dictionary)) {
    return 22;
  }
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(a1, "argv");
  uint64_t result = 0;
  *a2 = dictionary;
  return result;
}

void sub_100040F4C(id a1)
{
  qword_10005E8C0 = (uint64_t)os_log_create("com.apple.libcryptex", "xpc");
}

void sub_100040F7C()
{
}

void sub_100040F98()
{
}

void sub_100040FB4()
{
}

void sub_100040FD0()
{
}

void sub_100040FEC()
{
}

void sub_100041008(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  xpc_object_t v2 = __error();
  strerror(*v2);
  sub_100007984();
  _os_crash_msg();
  __break(1u);
}

void sub_1000410D8(void *a1, _OWORD *a2)
{
  sub_10000B070(a1, a2);
  sub_10000B108();
  xpc_object_t v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  sub_10000B16C();
  __break(1u);
}

void sub_1000411A0(const char *a1)
{
  sub_10000B184(a1);
  sub_10000B120();
  sub_10000B0F0();
  uint64_t v1 = __error();
  strerror(*v1);
  sub_10000B088();
  sub_10000B050();
  sub_10000B16C();
  __break(1u);
}

void sub_100041234(void *a1, _OWORD *a2)
{
}

void sub_1000412B0(void *a1, _OWORD *a2)
{
}

void sub_10004132C(void *a1, _OWORD *a2)
{
}

void sub_1000413A8(void *a1, _OWORD *a2)
{
}

void sub_100041430(void *a1, _OWORD *a2)
{
}

void sub_1000414B8(void *a1, _OWORD *a2)
{
}

void sub_100041534()
{
}

void sub_100041550(void *a1, _OWORD *a2)
{
}

void sub_1000415D0()
{
}

void sub_1000415EC()
{
}

void sub_100041608(void *a1, _OWORD *a2)
{
}

void sub_100041684(void *a1, _OWORD *a2)
{
}

void sub_100041700(void *a1, _OWORD *a2)
{
}

void sub_10004177C(void *a1, _OWORD *a2)
{
}

void sub_1000417F8(void *a1, _OWORD *a2)
{
}

void sub_100041874(void *a1, NSObject *a2)
{
  int v3 = 136315138;
  string = xpc_dictionary_get_string(a1, _xpc_error_key_description);
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Received error from client: %s", (uint8_t *)&v3, 0xCu);
}

void sub_10004190C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unexpected subsystem message", v1, 2u);
}

void sub_100041950(void *a1, _OWORD *a2)
{
}

void sub_1000419C4(void *a1, _OWORD *a2)
{
}

void sub_100041A38(void *a1, _OWORD *a2)
{
}

void sub_100041AAC()
{
}

void sub_100041AC8()
{
}

void sub_100041AE4(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100041B94()
{
}

void sub_100041BB0(void *a1, _OWORD *a2)
{
}

void sub_100041C28(void *a1, _OWORD *a2)
{
}

void sub_100041CA0(void *a1, _OWORD *a2)
{
}

void sub_100041D18(void *a1, _OWORD *a2)
{
}

void sub_100041D90(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "no reply context", v1, 2u);
}

void sub_100041DD4(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  __error();
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100041EA4(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  __error();
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100041F5C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "XPC payload with unexpected format", v1, 2u);
}

void sub_100041FA0(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unexpected command %llu", (uint8_t *)&v2, 0xCu);
}

void sub_100042018(void *a1, _OWORD *a2)
{
}

void sub_1000420A0(const char *a1, void *a2, _OWORD *a3)
{
  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  uint64_t v5 = __error();
  strerror(*v5);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100042188(void *a1, _OWORD *a2)
{
}

void sub_1000421FC()
{
  sub_1000133A4();
  sub_100013380(v0, v1);
  sub_10000B0F0();
  int v2 = __error();
  strerror(*v2);
  sub_100013328();
  sub_100013358();
  sub_10000B16C();
  __break(1u);
}

void sub_100042280()
{
  sub_1000133A4();
  sub_100013380(v0, v1);
  sub_10000B0F0();
  int v2 = __error();
  strerror(*v2);
  sub_100013328();
  sub_100013358();
  sub_10000B16C();
  __break(1u);
}

void sub_100042304()
{
  sub_1000133A4();
  sub_100013380(v0, v1);
  sub_10000B0F0();
  int v2 = __error();
  strerror(*v2);
  sub_100013328();
  sub_100013358();
  sub_10000B16C();
  __break(1u);
}

void sub_100042388()
{
  sub_1000133A4();
  sub_100013380(v0, v1);
  sub_10000B0F0();
  int v2 = __error();
  strerror(*v2);
  sub_100013328();
  sub_100013358();
  sub_10000B16C();
  __break(1u);
}

void sub_10004240C()
{
  sub_1000133A4();
  sub_100013380(v0, v1);
  sub_10000B0F0();
  int v2 = __error();
  strerror(*v2);
  sub_100013328();
  sub_100013358();
  sub_10000B16C();
  __break(1u);
}

void sub_100042490()
{
  sub_1000133A4();
  sub_100013380(v0, v1);
  sub_10000B0F0();
  int v2 = __error();
  strerror(*v2);
  sub_100013328();
  sub_100013358();
  sub_10000B16C();
  __break(1u);
}

void sub_100042514()
{
  sub_1000133A4();
  sub_100013380(v0, v1);
  sub_10000B0F0();
  int v2 = __error();
  strerror(*v2);
  sub_100013328();
  sub_100013358();
  sub_10000B16C();
  __break(1u);
}

void sub_100042598(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  int v2 = __error();
  strerror(*v2);
  sub_1000140D0();
  sub_1000140F0();
  _os_crash_msg();
  __break(1u);
}

void sub_100042650(const char *a1, void *a2, _OWORD *a3)
{
  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  uint64_t v5 = __error();
  strerror(*v5);
  sub_1000140D0();
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100042728(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  int v2 = __error();
  strerror(*v2);
  sub_1000140D0();
  sub_1000140F0();
  _os_crash_msg();
  __break(1u);
}

void sub_1000427E0(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  int v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_1000428C0(void *a1, _OWORD *a2)
{
}

void sub_10004293C(void *a1, _OWORD *a2)
{
}

void sub_1000429B8()
{
}

void sub_1000429D4(void *a1, _OWORD *a2)
{
}

void sub_100042A48(void *a1, _OWORD *a2)
{
  sub_10000B070(a1, a2);
  sub_10000B108();
  int v2 = __error();
  strerror(*v2);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100042B18(const char *a1, void *a2, _OWORD *a3)
{
  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  sub_10000B0F0();
  uint64_t v5 = __error();
  strerror(*v5);
  sub_10000B050();
  _os_crash_msg();
  __break(1u);
}

void sub_100042BE8()
{
}

void sub_100042C04(void *a1, _OWORD *a2)
{
}

void sub_100042C80(void *a1, _OWORD *a2)
{
}

void sub_100042CFC(void *a1, _OWORD *a2)
{
}

void sub_100042D8C(void *a1, _OWORD *a2)
{
}

void sub_100042E1C(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Collation: Creating new collation for user %d", (uint8_t *)v3, 8u);
}

void sub_100042E98(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100042F4C(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Collation: No remaining mounts for user %d", (uint8_t *)v3, 8u);
}

void sub_100042FC8()
{
}

void sub_100042FE4(uint64_t a1, int *a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = *a2;
  int v5 = 136315394;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Collation: Removing path [%s] for user %d", (uint8_t *)&v5, 0x12u);
}

void sub_100043074(void *a1, _OWORD *a2)
{
}

void sub_100043104(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  sub_10000C2DC();
  _os_crash_msg();
  __break(1u);
}

void sub_10004319C(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  sub_10000C2DC();
  _os_crash_msg();
  __break(1u);
}

void sub_100043234(void *a1, _OWORD *a2)
{
}

void sub_1000432B4(void *a1, _OWORD *a2)
{
}

void sub_100043334(void *a1, _OWORD *a2)
{
}

void sub_1000433B4(void *a1, _OWORD *a2)
{
}

void sub_100043434(void *a1, _OWORD *a2)
{
}

void sub_1000434B4(void *a1, _OWORD *a2)
{
}

void sub_10004352C(void *a1, _OWORD *a2)
{
}

void sub_1000435C0()
{
}

void sub_1000435DC(void *a1, _OWORD *a2)
{
}

void sub_100043654()
{
}

void sub_100043670()
{
}

void sub_10004368C()
{
}

void sub_1000436A8(void *a1, _OWORD *a2)
{
}

void sub_100043720(void *a1, _OWORD *a2)
{
}

void sub_1000437A0(void *a1, _OWORD *a2)
{
}

void sub_100043820(void *a1, _OWORD *a2)
{
}

void sub_1000438A0(void *a1, _OWORD *a2)
{
}

void sub_100043920(void *a1, _OWORD *a2)
{
}

void sub_1000439A0(void *a1, _OWORD *a2)
{
  sub_10000B070(a1, a2);
  sub_10000B108();
  int v2 = __error();
  strerror(*v2);
  sub_1000291CC();
  sub_1000140F0();
  _os_crash_msg();
  __break(1u);
}

void sub_100043A44(void *a1, _OWORD *a2)
{
  sub_10000B070(a1, a2);
  sub_10000B108();
  int v2 = __error();
  strerror(*v2);
  sub_1000291CC();
  sub_1000140F0();
  _os_crash_msg();
  __break(1u);
}

void sub_100043AE8(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  __error();
  sub_10000B0B8();
  sub_10002C450();
  _os_crash_msg();
  __break(1u);
}

void sub_100043B94(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  __error();
  sub_10000B0B8();
  sub_10002C450();
  _os_crash_msg();
  __break(1u);
}

void sub_100043C40(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  __error();
  sub_10000B0B8();
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void sub_100043CEC()
{
}

void sub_100043D08(void *a1, _OWORD *a2)
{
  sub_10000BB24(a1, a2);
  os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  int v2 = __error();
  strerror(*v2);
  sub_10002D314();
  sub_10000B028();
  _os_crash_msg();
  __break(1u);
}

void sub_100043D90(uint64_t a1)
{
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Subsystem unknown %s", (uint8_t *)&v1, 0xCu);
}

void sub_100043E10(void *a1, _OWORD *a2)
{
}

void sub_100043E80(void *a1, _OWORD *a2)
{
}

void sub_100043EFC(void *a1, _OWORD *a2)
{
}

void sub_100043F6C(void *a1, _OWORD *a2)
{
}

void sub_100043FF4(void *a1, _OWORD *a2)
{
}

void sub_100044074(void *a1, _OWORD *a2)
{
}

void sub_1000440FC()
{
}

void sub_100044118()
{
  sub_1000133A4();
  sub_10000B184(v0);
  sub_10000B120();
  sub_10000B0F0();
  int v1 = __error();
  strerror(*v1);
  sub_10000B088();
  sub_100039810();
  sub_10000B16C();
  __break(1u);
}

void sub_1000441A0(void *a1, _OWORD *a2, const _xpc_type_s *a3)
{
}

void sub_100044238()
{
}

void sub_100044254()
{
  sub_1000133A4();
  sub_10000B070(v0, v1);
  sub_10000B108();
  uint64_t v2 = __error();
  strerror(*v2);
  sub_1000140D0();
  sub_1000140F0();
  sub_10000B16C();
  __break(1u);
}

void sub_1000442F4(void *a1, _OWORD *a2)
{
  sub_10000B070(a1, a2);
  sub_10000B108();
  uint64_t v2 = __error();
  strerror(*v2);
  sub_1000140D0();
  sub_1000140F0();
  sub_10000B16C();
  __break(1u);
}

void sub_100044394(void *a1, _OWORD *a2)
{
}

void sub_100044414(void *a1, _OWORD *a2)
{
}

void sub_100044494(void *a1, _OWORD *a2)
{
}

void sub_100044514(void *a1, _OWORD *a2)
{
  sub_10000B070(a1, a2);
  sub_10000B108();
  uint64_t v2 = __error();
  strerror(*v2);
  sub_1000140D0();
  sub_1000140F0();
  sub_10000B16C();
  __break(1u);
}

void sub_1000445B4()
{
}

void sub_1000445D0(void *a1, _OWORD *a2)
{
}

void sub_100044658(void *a1, _OWORD *a2)
{
  sub_10000B070(a1, a2);
  sub_10000B108();
  uint64_t v2 = __error();
  strerror(*v2);
  sub_1000140D0();
  sub_1000140F0();
  sub_10000B16C();
  __break(1u);
}

void sub_1000446F8(void *a1, _OWORD *a2)
{
  sub_10000B070(a1, a2);
  sub_10000B108();
  uint64_t v2 = __error();
  strerror(*v2);
  sub_1000140D0();
  sub_1000140F0();
  sub_10000B16C();
  __break(1u);
}

void sub_100044798()
{
}

void sub_1000447B4()
{
}

void sub_1000447D0()
{
  int v0 = 136315138;
  int v1 = "UNK";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unexpected domain type %s", (uint8_t *)&v0, 0xCu);
}

void sub_100044858(void *a1)
{
  int v1 = [a1 localizedDescription];
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unpending failed: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000448F0(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to find targetDomain %d", (uint8_t *)v1, 8u);
}

void sub_100044970(void *a1)
{
  int v1 = [a1 localizedDescription];
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Initiating removal for domain failed: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100044A08()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Invalid type for CryptexSessionKeystone", v0, 2u);
}

uint64_t AMAuthInstallLogSetHandler()
{
  return _AMAuthInstallLogSetHandler();
}

uint64_t APFSVolumeCreate()
{
  return _APFSVolumeCreate();
}

uint64_t APFSVolumeDelete()
{
  return _APFSVolumeDelete();
}

uint64_t APFSVolumeRoleFind()
{
  return _APFSVolumeRoleFind();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return _CFErrorCopyUserInfo(err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return _CFErrorCreate(allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return _CFErrorGetTypeID();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return _CFSetCreate(allocator, values, numValues, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return _CFSetGetCount(theSet);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallMethod(connection, selector, input, inputCnt, inputStruct, inputStructCnt, output, outputCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

void IOIteratorReset(io_iterator_t iterator)
{
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
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

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

BOOLean_t IORegistryEntryInPlane(io_registry_entry_t entry, const io_name_t plane)
{
  return _IORegistryEntryInPlane(entry, plane);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
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

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MKBEventsRegister()
{
  return _MKBEventsRegister();
}

uint64_t MKBEventsUnregister()
{
  return _MKBEventsUnregister();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

int *_NSGetArgc(void)
{
  return __NSGetArgc();
}

char ***_NSGetArgv(void)
{
  return __NSGetArgv();
}

char ***_NSGetEnviron(void)
{
  return __NSGetEnviron();
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return __NSGetExecutablePath(buf, bufsize);
}

mach_header_64 *_NSGetMachExecuteHeader(void)
{
  return __NSGetMachExecuteHeader();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __os_temporary_resource_shortage()
{
  return ___os_temporary_resource_shortage();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return ___snprintf_chk(a1, a2, a3, a4, a5);
}

uint64_t __strcat_chk()
{
  return ___strcat_chk();
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t __strncat_chk()
{
  return ___strncat_chk();
}

uint64_t _cryptex_base_dealloc()
{
  return __cryptex_base_dealloc();
}

uint64_t _dispatch_is_multithreaded()
{
  return __dispatch_is_multithreaded();
}

uint64_t _dyld_get_image_slide()
{
  return __dyld_get_image_slide();
}

uint64_t _os_crash()
{
  return __os_crash();
}

uint64_t _os_crash_msg()
{
  return __os_crash_msg();
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

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

uint64_t _os_object_alloc()
{
  return __os_object_alloc();
}

uint64_t _vproc_set_global_on_demand()
{
  return __vproc_set_global_on_demand();
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

au_asid_t audit_token_to_asid(audit_token_t *atoken)
{
  return _audit_token_to_asid(atoken);
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return _audit_token_to_auid(atoken);
}

gid_t audit_token_to_egid(audit_token_t *atoken)
{
  return _audit_token_to_egid(atoken);
}

uid_t audit_token_to_euid(audit_token_t *atoken)
{
  return _audit_token_to_euid(atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return _audit_token_to_pid(atoken);
}

int audit_token_to_pidversion(audit_token_t *atoken)
{
  return _audit_token_to_pidversion(atoken);
}

gid_t audit_token_to_rgid(audit_token_t *atoken)
{
  return _audit_token_to_rgid(atoken);
}

uid_t audit_token_to_ruid(audit_token_t *atoken)
{
  return _audit_token_to_ruid(atoken);
}

char *__cdecl basename(char *a1)
{
  return _basename(a1);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t claimfd_np()
{
  return _claimfd_np();
}

int close(int a1)
{
  return _close(a1);
}

uint64_t close_drop_np()
{
  return _close_drop_np();
}

uint64_t close_drop_optional_np()
{
  return _close_drop_optional_np();
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

uint64_t codex_install_reply_pack()
{
  return _codex_install_reply_pack();
}

uint64_t codex_install_unpack()
{
  return _codex_install_unpack();
}

uint64_t codex_list_reply_pack()
{
  return _codex_list_reply_pack();
}

uint64_t codex_list_unpack()
{
  return _codex_list_unpack();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

uint64_t cryptex_activate()
{
  return _cryptex_activate();
}

uint64_t cryptex_asset_copy()
{
  return _cryptex_asset_copy();
}

uint64_t cryptex_asset_destroy()
{
  return _cryptex_asset_destroy();
}

uint64_t cryptex_asset_evaluate()
{
  return _cryptex_asset_evaluate();
}

uint64_t cryptex_asset_len()
{
  return _cryptex_asset_len();
}

uint64_t cryptex_asset_new()
{
  return _cryptex_asset_new();
}

uint64_t cryptex_asset_type_is_cryptex1()
{
  return _cryptex_asset_type_is_cryptex1();
}

uint64_t cryptex_async()
{
  return _cryptex_async();
}

uint64_t cryptex_async_f()
{
  return _cryptex_async_f();
}

uint64_t cryptex_content_type_parse()
{
  return _cryptex_content_type_parse();
}

uint64_t cryptex_core_attach_host()
{
  return _cryptex_core_attach_host();
}

uint64_t cryptex_core_attach_signature()
{
  return _cryptex_core_attach_signature();
}

uint64_t cryptex_core_create()
{
  return _cryptex_core_create();
}

uint64_t cryptex_core_cx1_properties_create_with_xpc_dictionary()
{
  return _cryptex_core_cx1_properties_create_with_xpc_dictionary();
}

uint64_t cryptex_core_cx1_write_to_file()
{
  return _cryptex_core_cx1_write_to_file();
}

uint64_t cryptex_core_generate_identifier()
{
  return _cryptex_core_generate_identifier();
}

uint64_t cryptex_core_generate_version()
{
  return _cryptex_core_generate_version();
}

uint64_t cryptex_core_get_asset()
{
  return _cryptex_core_get_asset();
}

uint64_t cryptex_core_get_cryptex1_properties()
{
  return _cryptex_core_get_cryptex1_properties();
}

uint64_t cryptex_core_get_image_asset()
{
  return _cryptex_core_get_image_asset();
}

uint64_t cryptex_core_get_info_asset()
{
  return _cryptex_core_get_info_asset();
}

uint64_t cryptex_core_get_tc_asset()
{
  return _cryptex_core_get_tc_asset();
}

uint64_t cryptex_core_image_authapfs_enabled()
{
  return _cryptex_core_image_authapfs_enabled();
}

uint64_t cryptex_core_is_cryptex1()
{
  return _cryptex_core_is_cryptex1();
}

uint64_t cryptex_core_parse_hdiid()
{
  return _cryptex_core_parse_hdiid();
}

uint64_t cryptex_core_parse_info_asset()
{
  return _cryptex_core_parse_info_asset();
}

uint64_t cryptex_core_set_asset()
{
  return _cryptex_core_set_asset();
}

uint64_t cryptex_core_set_assets_from_directory()
{
  return _cryptex_core_set_assets_from_directory();
}

uint64_t cryptex_core_set_assets_from_fds()
{
  return _cryptex_core_set_assets_from_fds();
}

uint64_t cryptex_core_set_cryptex1_properties()
{
  return _cryptex_core_set_cryptex1_properties();
}

uint64_t cryptex_core_set_install_persistence()
{
  return _cryptex_core_set_install_persistence();
}

uint64_t cryptex_core_set_nonce_persistence()
{
  return _cryptex_core_set_nonce_persistence();
}

uint64_t cryptex_core_unparse_hdiid()
{
  return _cryptex_core_unparse_hdiid();
}

uint64_t cryptex_get_error()
{
  return _cryptex_get_error();
}

uint64_t cryptex_host_create()
{
  return _cryptex_host_create();
}

uint64_t cryptex_init()
{
  return _cryptex_init();
}

uint64_t cryptex_magister_authenticate()
{
  return _cryptex_magister_authenticate();
}

uint64_t cryptex_magister_create()
{
  return _cryptex_magister_create();
}

uint64_t cryptex_magister_record_property()
{
  return _cryptex_magister_record_property();
}

uint64_t cryptex_queue_create_with_target()
{
  return _cryptex_queue_create_with_target();
}

uint64_t cryptex_scrivener_create()
{
  return _cryptex_scrivener_create();
}

uint64_t cryptex_scrivener_read_signature()
{
  return _cryptex_scrivener_read_signature();
}

uint64_t cryptex_scrivener_sign()
{
  return _cryptex_scrivener_sign();
}

uint64_t cryptex_session_core_append_to_array()
{
  return _cryptex_session_core_append_to_array();
}

uint64_t cryptex_session_core_copy_homedir()
{
  return _cryptex_session_core_copy_homedir();
}

uint64_t cryptex_session_core_copy_name()
{
  return _cryptex_session_core_copy_name();
}

uint64_t cryptex_session_core_copy_xpc_object()
{
  return _cryptex_session_core_copy_xpc_object();
}

uint64_t cryptex_session_core_create_from_xpc()
{
  return _cryptex_session_core_create_from_xpc();
}

uint64_t cryptex_session_core_get_attributes()
{
  return _cryptex_session_core_get_attributes();
}

uint64_t cryptex_session_core_get_homedir_size()
{
  return _cryptex_session_core_get_homedir_size();
}

uint64_t cryptex_session_core_get_overrides()
{
  return _cryptex_session_core_get_overrides();
}

uint64_t cryptex_session_core_get_state()
{
  return _cryptex_session_core_get_state();
}

uint64_t cryptex_session_core_get_uid()
{
  return _cryptex_session_core_get_uid();
}

uint64_t cryptex_session_core_set_endpoint()
{
  return _cryptex_session_core_set_endpoint();
}

uint64_t cryptex_session_core_set_homedir()
{
  return _cryptex_session_core_set_homedir();
}

uint64_t cryptex_session_core_set_uid()
{
  return _cryptex_session_core_set_uid();
}

uint64_t cryptex_session_core_transition()
{
  return _cryptex_session_core_transition();
}

uint64_t cryptex_set_error()
{
  return _cryptex_set_error();
}

uint64_t cryptex_set_target_object()
{
  return _cryptex_set_target_object();
}

uint64_t cryptex_set_target_queue()
{
  return _cryptex_set_target_queue();
}

uint64_t cryptex_signature_lock()
{
  return _cryptex_signature_lock();
}

uint64_t cryptex_signature_lock_with_sep()
{
  return _cryptex_signature_lock_with_sep();
}

uint64_t cryptex_signature_seal()
{
  return _cryptex_signature_seal();
}

uint64_t cryptex_signature_write()
{
  return _cryptex_signature_write();
}

uint64_t cryptex_sync_f()
{
  return _cryptex_sync_f();
}

uint64_t cryptex_target_async_f()
{
  return _cryptex_target_async_f();
}

uint64_t cryptex_uninstall_unpack()
{
  return _cryptex_uninstall_unpack();
}

uint64_t cryptex_version_compare()
{
  return _cryptex_version_compare();
}

uint64_t cryptex_version_destroy()
{
  return _cryptex_version_destroy();
}

uint64_t cryptex_version_new()
{
  return _cryptex_version_new();
}

uint64_t csops_audittoken()
{
  return _csops_audittoken();
}

uint64_t daemon_open_mountable_reply_pack()
{
  return _daemon_open_mountable_reply_pack();
}

uint64_t daemon_open_mountable_unpack()
{
  return _daemon_open_mountable_unpack();
}

uint64_t daemon_version_reply_pack()
{
  return _daemon_version_reply_pack();
}

uint64_t daemon_version_unpack()
{
  return _daemon_version_unpack();
}

int dirfd(DIR *dirp)
{
  return _dirfd(dirp);
}

void dispatch_activate(dispatch_object_t object)
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

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_group_notify_f(dispatch_group_t group, dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return _dispatch_queue_attr_make_initially_inactive(attr);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

uint64_t dispatch_set_qos_class()
{
  return _dispatch_set_qos_class();
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return _dispatch_source_get_handle(source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

uint64_t dup_np()
{
  return _dup_np();
}

int faccessat(int a1, const char *a2, int a3, int a4)
{
  return _faccessat(a1, a2, a3, a4);
}

uint64_t fcheck_np()
{
  return _fcheck_np();
}

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return _fcopyfile(from_fd, to_fd, a3, flags);
}

DIR *__cdecl fdopendir(int a1)
{
  return _fdopendir(a1);
}

FILE *__cdecl fmemopen(void *__buf, size_t __size, const char *__mode)
{
  return _fmemopen(__buf, __size, __mode);
}

int fmount(const char *a1, int a2, int a3, void *a4)
{
  return _fmount(a1, a2, a3, a4);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return _fseek(a1, a2, a3);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return _getfsstat(a1, a2, a3);
}

gid_t getgid(void)
{
  return _getgid();
}

int getmntinfo(statfs **a1, int a2)
{
  return _getmntinfo(a1, a2);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return _getopt_long(a1, a2, a3, a4, a5);
}

const char *getprogname(void)
{
  return _getprogname();
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

char *__cdecl getsectdatafromheader_64(const mach_header_64 *mhp, const char *segname, const char *sectname, uint64_t *size)
{
  return _getsectdatafromheader_64(mhp, segname, sectname, size);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

uid_t getuid(void)
{
  return _getuid();
}

int getvfsbyname(const char *a1, vfsconf *a2)
{
  return _getvfsbyname(a1, a2);
}

uint64_t img4_chip_instantiate()
{
  return _img4_chip_instantiate();
}

uint64_t img4_chip_select_personalized_ap()
{
  return _img4_chip_select_personalized_ap();
}

uint64_t img4_nonce_domain_copy_nonce()
{
  return _img4_nonce_domain_copy_nonce();
}

uint64_t img4_nonce_domain_get_from_handle()
{
  return _img4_nonce_domain_get_from_handle();
}

uint64_t img4_nonce_domain_roll_nonce()
{
  return _img4_nonce_domain_roll_nonce();
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

uint64_t launch_cryptex_terminate()
{
  return _launch_cryptex_terminate();
}

uint64_t launch_load_mounted_jetsam_properties()
{
  return _launch_load_mounted_jetsam_properties();
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

uint64_t mach_right_send_release()
{
  return _mach_right_send_release();
}

uint64_t mach_right_send_retain()
{
  return _mach_right_send_retain();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

int mkdirat(int a1, const char *a2, mode_t a3)
{
  return _mkdirat(a1, a2, a3);
}

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

char *__cdecl mkdtempat_np(int dfd, char *path)
{
  return _mkdtempat_np(dfd, path);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

int openat(int a1, const char *a2, int a3, ...)
{
  return _openat(a1, a2, a3);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
}

uint64_t os_flagset_copy_string()
{
  return _os_flagset_copy_string();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_mach_port_copy_description()
{
  return _os_mach_port_copy_description();
}

void os_release(void *object)
{
}

void *__cdecl os_retain(void *object)
{
  return _os_retain(object);
}

uint64_t os_simple_hash()
{
  return _os_simple_hash();
}

uint64_t os_transaction_copy_description()
{
  return _os_transaction_copy_description();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return _pread(__fd, __buf, __nbyte, a4);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int proc_terminate_all_rsr(int sig)
{
  return _proc_terminate_all_rsr(sig);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return _pthread_rwlock_init(a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_rdlock(a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_unlock(a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return _pthread_rwlock_wrlock(a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return _readdir(a1);
}

uint64_t realpath_np()
{
  return _realpath_np();
}

uint64_t remote_device_browse_present()
{
  return _remote_device_browse_present();
}

uint64_t remote_device_get_name()
{
  return _remote_device_get_name();
}

uint64_t remote_device_reset()
{
  return _remote_device_reset();
}

uint64_t remote_service_install_request_valid()
{
  return _remote_service_install_request_valid();
}

int renameat(int a1, const char *a2, int a3, const char *a4)
{
  return _renameat(a1, a2, a3, a4);
}

uint64_t session_activate_reply_pack()
{
  return _session_activate_reply_pack();
}

uint64_t session_activate_unpack()
{
  return _session_activate_unpack();
}

uint64_t session_list_reply_pack()
{
  return _session_list_reply_pack();
}

uint64_t session_list_unpack()
{
  return _session_list_unpack();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
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

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return _strrchr(__s, __c);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

int symlink(const char *a1, const char *a2)
{
  return _symlink(a1, a2);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return _task_name_for_pid(target_tport, pid, tn);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unlinkat(int a1, const char *a2, int a3)
{
  return _unlinkat(a1, a2, a3);
}

int unmount(const char *a1, int a2)
{
  return _unmount(a1, a2);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

uint64_t wd_optin_service_register_sync()
{
  return _wd_optin_service_register_sync();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

xpc_object_t xpc_array_create_empty(void)
{
  return _xpc_array_create_empty();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return _xpc_array_get_count(xarray);
}

xpc_object_t xpc_array_get_dictionary(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_dictionary(xarray, index);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_string(xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return _xpc_array_get_value(xarray, index);
}

void xpc_array_set_int64(xpc_object_t xarray, size_t index, int64_t value)
{
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return _xpc_connection_create(name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return _xpc_copy(object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

uint64_t xpc_create_from_plist()
{
  return _xpc_create_from_plist();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

uint64_t xpc_dictionary_apply_f()
{
  return _xpc_dictionary_apply_f();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_dup_fd(xdict, key);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return _xpc_dictionary_get_audit_token();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

uint64_t xpc_dictionary_set_mach_send()
{
  return _xpc_dictionary_set_mach_send();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return _xpc_endpoint_create(connection);
}

uint64_t xpc_event_publisher_activate()
{
  return _xpc_event_publisher_activate();
}

uint64_t xpc_event_publisher_create()
{
  return _xpc_event_publisher_create();
}

uint64_t xpc_event_publisher_fire()
{
  return _xpc_event_publisher_fire();
}

uint64_t xpc_event_publisher_set_error_handler()
{
  return _xpc_event_publisher_set_error_handler();
}

uint64_t xpc_event_publisher_set_handler()
{
  return _xpc_event_publisher_set_handler();
}

uint64_t xpc_file_transfer_write_to_fd()
{
  return _xpc_file_transfer_write_to_fd();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_mach_send_copy_right()
{
  return _xpc_mach_send_copy_right();
}

uint64_t xpc_pipe_receive()
{
  return _xpc_pipe_receive();
}

uint64_t xpc_pipe_routine_reply()
{
  return _xpc_pipe_routine_reply();
}

void xpc_release(xpc_object_t object)
{
}

uint64_t xpc_remote_connection_activate()
{
  return _xpc_remote_connection_activate();
}

uint64_t xpc_remote_connection_create_remote_service_listener()
{
  return _xpc_remote_connection_create_remote_service_listener();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return _xpc_remote_connection_set_event_handler();
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return _xpc_retain(object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return _xpc_string_get_length(xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return _xpc_type_get_name(type);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__abort(void *a1, const char *a2, ...)
{
  return [a1 _abort];
}

id objc_msgSend__completeUpgradeSession(void *a1, const char *a2, ...)
{
  return [a1 _completeUpgradeSession];
}

id objc_msgSend__disableInterfaceLockTimeout(void *a1, const char *a2, ...)
{
  return [a1 _disableInterfaceLockTimeout];
}

id objc_msgSend__isInterfaceLocked(void *a1, const char *a2, ...)
{
  return [a1 _isInterfaceLocked];
}

id objc_msgSend__restartInterfaceLockTimeout(void *a1, const char *a2, ...)
{
  return [a1 _restartInterfaceLockTimeout];
}

id objc_msgSend__timeout(void *a1, const char *a2, ...)
{
  return [a1 _timeout];
}

id objc_msgSend__unlockInterface(void *a1, const char *a2, ...)
{
  return [a1 _unlockInterface];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancelHandler(void *a1, const char *a2, ...)
{
  return [a1 cancelHandler];
}

id objc_msgSend_cancelMonitor(void *a1, const char *a2, ...)
{
  return [a1 cancelMonitor];
}

id objc_msgSend_cancelPeerConnections(void *a1, const char *a2, ...)
{
  return [a1 cancelPeerConnections];
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return [a1 clientName];
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return [a1 clients];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completeUpgrade(void *a1, const char *a2, ...)
{
  return [a1 completeUpgrade];
}

id objc_msgSend_conn(void *a1, const char *a2, ...)
{
  return [a1 conn];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copySessionName(void *a1, const char *a2, ...)
{
  return [a1 copySessionName];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createCryptexSessionList(void *a1, const char *a2, ...)
{
  return [a1 createCryptexSessionList];
}

id objc_msgSend_createEndpoint(void *a1, const char *a2, ...)
{
  return [a1 createEndpoint];
}

id objc_msgSend_cred(void *a1, const char *a2, ...)
{
  return [a1 cred];
}

id objc_msgSend_cryptexName(void *a1, const char *a2, ...)
{
  return [a1 cryptexName];
}

id objc_msgSend_cs(void *a1, const char *a2, ...)
{
  return [a1 cs];
}

id objc_msgSend_currentDomain(void *a1, const char *a2, ...)
{
  return [a1 currentDomain];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dq(void *a1, const char *a2, ...)
{
  return [a1 dq];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_eventMask(void *a1, const char *a2, ...)
{
  return [a1 eventMask];
}

id objc_msgSend_getDispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 getDispatchQueue];
}

id objc_msgSend_getMap(void *a1, const char *a2, ...)
{
  return [a1 getMap];
}

id objc_msgSend_getSharedInstance(void *a1, const char *a2, ...)
{
  return [a1 getSharedInstance];
}

id objc_msgSend_group(void *a1, const char *a2, ...)
{
  return [a1 group];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return [a1 handle];
}

id objc_msgSend_handlePublisherInitialBarrier(void *a1, const char *a2, ...)
{
  return [a1 handlePublisherInitialBarrier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isEmpty(void *a1, const char *a2, ...)
{
  return [a1 isEmpty];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_lastExitStatus(void *a1, const char *a2, ...)
{
  return [a1 lastExitStatus];
}

id objc_msgSend_lastSpawnError(void *a1, const char *a2, ...)
{
  return [a1 lastSpawnError];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_list(void *a1, const char *a2, ...)
{
  return [a1 list];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lockAcquireQueue(void *a1, const char *a2, ...)
{
  return [a1 lockAcquireQueue];
}

id objc_msgSend_lockTimer(void *a1, const char *a2, ...)
{
  return [a1 lockTimer];
}

id objc_msgSend_lockingClient(void *a1, const char *a2, ...)
{
  return [a1 lockingClient];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_logHandle(void *a1, const char *a2, ...)
{
  return [a1 logHandle];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return [a1 publisher];
}

id objc_msgSend_registrationQueue(void *a1, const char *a2, ...)
{
  return [a1 registrationQueue];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_sandboxHandles(void *a1, const char *a2, ...)
{
  return [a1 sandboxHandles];
}

id objc_msgSend_sessionCompleteCallback(void *a1, const char *a2, ...)
{
  return [a1 sessionCompleteCallback];
}

id objc_msgSend_sessionStart(void *a1, const char *a2, ...)
{
  return [a1 sessionStart];
}

id objc_msgSend_setupHandler(void *a1, const char *a2, ...)
{
  return [a1 setupHandler];
}

id objc_msgSend_sharedList(void *a1, const char *a2, ...)
{
  return [a1 sharedList];
}

id objc_msgSend_startUpgrade(void *a1, const char *a2, ...)
{
  return [a1 startUpgrade];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stringByResolvingSymlinksInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByResolvingSymlinksInPath];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_upgradesUnderway(void *a1, const char *a2, ...)
{
  return [a1 upgradesUnderway];
}

id objc_msgSend_wait4Status(void *a1, const char *a2, ...)
{
  return [a1 wait4Status];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 atomically:x1 encoding:x2 error:x3];
}