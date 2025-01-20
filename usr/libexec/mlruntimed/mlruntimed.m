void sub_100003CEC()
{
  NSObject *v0;
  dispatch_source_t v1;
  void *v2;

  v0 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    sub_1000100C8(v0);
  }

  signal(15, (void (__cdecl *)(int))1);
  v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, 0);
  v2 = (void *)qword_10001F618;
  qword_10001F618 = (uint64_t)v1;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10001F618, &stru_1000185E8);
  dispatch_activate((dispatch_object_t)qword_10001F618);
}

void sub_100003D84(id a1)
{
  v1 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_10001010C(v1);
  }

  xpc_transaction_exit_clean();
}

void start()
{
  if (_set_user_dir_suffix())
  {
    id v0 = NSTemporaryDirectory();
    v2 = objc_opt_new();
    [v2 registerIfNeeded];
    v3 = [[MLRListenerDelegate alloc] initWithXPCActivityManager:v2];
    id v4 = objc_alloc((Class)NSXPCListener);
    id v5 = [v4 initWithMachServiceName:DESFullServiceName];
    [v5 setDelegate:v3];
    [v5 resume];
    if (v2 && v3 && v5)
    {
      sub_100003CEC();
      dispatch_main();
    }
    v8 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v9 = 134218496;
      v10 = v2;
      __int16 v11 = 2048;
      v12 = v3;
      __int16 v13 = 2048;
      id v14 = v5;
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "Fail to allocate activityManager=%p, listenerDelegate=%p, listener=%p", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    v6 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      int v7 = *__error();
      int v9 = 67109120;
      LODWORD(v10) = v7;
      _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "_set_user_dir_suffix failed™: %{darwin.errno}d", (uint8_t *)&v9, 8u);
    }
  }
  exit(1);
}

uint64_t sub_10000429C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004B08(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v7 pluginId];
  v10 = (void *)v9;
  if (v8 && v9)
  {
    __int16 v11 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412546;
      v18 = v10;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Shadow evaluation task for pluginId=%@, evaluation=%@", (uint8_t *)&v17, 0x16u);
    }

    id v12 = *(id *)(a1 + 32);
    __int16 v13 = [v12 objectForKeyedSubscript:v10];

    if (!v13)
    {
      id v14 = +[NSMutableArray array];
      [v12 setObject:v14 forKeyedSubscript:v10];
    }
    id v15 = [objc_alloc((Class)MLRInternalTrialTask) initWithEvaluationState:v8 runtimeEvaluation:v7];
    v16 = [v12 objectForKeyedSubscript:v10];
    [v16 addObject:v15];

    if (a4) {
      *a4 = 0;
    }
  }
}

void sub_100004D48(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Trial Framework is not loaded.", v1, 2u);
}

void sub_100004D8C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Fail to enumerate all shadow evaluation tasks with error=%@.", (uint8_t *)&v2, 0xCu);
}

void sub_100004E04(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fail to get TRIEvaluationStatusProvider.", v1, 2u);
}

void sub_1000052D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 8)) {
    GarbageCollectAllRecords();
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100005718(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005D58(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_100005D84(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100008398(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __int16 v13 = WeakRetained;
  if (WeakRetained)
  {
    id v14 = WeakRetained[3];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100005E78;
    v15[3] = &unk_100018690;
    v16 = WeakRetained;
    id v17 = v3;
    dispatch_async(v14, v15);
  }
}

void sub_100005E78(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;
  }
}

void sub_100005ED0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1000083D0();
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v9 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v10 = WeakRetained[3];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100005FD8;
    v11[3] = &unk_100018690;
    id v12 = WeakRetained;
    id v13 = v5;
    dispatch_async(v10, v11);
  }
}

void sub_100005FD8(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 16) isEqual:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0;
  }
}

id sub_100006390(uint64_t a1)
{
  return [*(id *)(a1 + 32) _kill:9];
}

void sub_100006454(id a1, MLRExtensionRemoteProtocol *a2)
{
}

void sub_10000645C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100008624(a1);
  }
}

id sub_1000065D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unload];
}

void sub_10000718C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000071B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000071C0(uint64_t a1)
{
}

void sub_1000071C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007320;
  block[3] = &unk_100018798;
  uint64_t v4 = *(void *)(a1 + 48);
  block[4] = v2;
  block[5] = v4;
  dispatch_sync(v3, block);
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 40);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000739C;
    v8[3] = &unk_1000187E8;
    v8[4] = v5;
    id v9 = *(id *)(a1 + 40);
    long long v10 = *(_OWORD *)(a1 + 48);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100007634;
    v7[3] = &unk_100018810;
    v7[5] = v10;
    v7[4] = *(void *)(a1 + 32);
    [v6 performOnRemoteObjectSynchronouslyWithBlock:v8 errorHandler:v7];
  }
}

void *sub_100007320(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[48])
  {
    uint64_t v3 = [v2 _skipTaskError];
  }
  else
  {
    [v2 _activateExtensionIfNecessary];
    result = *(void **)(a1 + 32);
    if (result[5]) {
      return result;
    }
    uint64_t v3 = [result _failToGetHostError];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v3;

  return (void *)_objc_release_x1();
}

void sub_10000739C(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = [*(id *)(a1[4] + 8) identifier];
    uint64_t v6 = *(void *)(a1[4] + 16);
    *(_DWORD *)buf = 138412802;
    __int16 v19 = v5;
    __int16 v20 = 2112;
    uint64_t v21 = v6;
    __int16 v22 = 2112;
    id v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Reaching out to plugin=%@ to start compute, sessionID=%@, remoteObjectProxy=%@.", buf, 0x20u);
  }
  uint64_t v8 = a1 + 5;
  uint64_t v7 = a1[5];
  id v9 = (void *)a1[4];
  uint64_t v10 = (uint64_t)(a1 + 6);
  uint64_t v11 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v11 + 40);
  id v12 = [v9 sandboxExtensionsForTask:v7 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100007580;
    v15[3] = &unk_1000187C0;
    uint64_t v13 = a1[5];
    void v15[4] = a1[4];
    long long v16 = *((_OWORD *)a1 + 3);
    [v3 performTask:v13 sandBoxExtensions:v12 completion:v15];
  }
  else
  {
    id v14 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000089A4(v8, v10, v14);
    }
  }
}

void sub_100007580(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    uint64_t v8 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100008A3C(a1);
    }

    id v9 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v10 = a3;
  }
  else
  {
    id v9 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    uint64_t v10 = a2;
  }
  objc_storeStrong(v9, v10);
}

uint64_t sub_100007634(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _failToPerformErrorWithError:a2];

  return _objc_release_x1();
}

void sub_100007818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000783C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007990;
  block[3] = &unk_100018798;
  uint64_t v4 = *(void *)(a1 + 48);
  block[4] = v2;
  block[5] = v4;
  dispatch_sync(v3, block);
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007A0C;
    v9[3] = &unk_1000187E8;
    id v6 = *(id *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 32);
    id v10 = v6;
    uint64_t v11 = v7;
    long long v12 = *(_OWORD *)(a1 + 48);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100007C94;
    v8[3] = &unk_100018810;
    void v8[5] = v12;
    v8[4] = v7;
    [v5 performOnRemoteObjectSynchronouslyWithBlock:v9 errorHandler:v8];
  }
}

void *sub_100007990(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[48])
  {
    uint64_t v3 = [v2 _skipTaskError];
  }
  else
  {
    [v2 _activateExtensionIfNecessary];
    result = *(void **)(a1 + 32);
    if (result[5]) {
      return result;
    }
    uint64_t v3 = [result _failToGetHostError];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v3;

  return (void *)_objc_release_x1();
}

void sub_100007A0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Reaching out to plugin to start compute, task=%@.", buf, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007B38;
  v7[3] = &unk_100018860;
  long long v8 = *(_OWORD *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 56);
  [v3 performTrialTask:v6 completion:v7];
}

void sub_100007B38(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    long long v8 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100008A3C(a1);
    }

    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
    id v10 = v7;
    uint64_t v11 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = v10;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    uint64_t v11 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = [*(id *)(a1 + 32) extensionName];
      int v13 = 138412546;
      id v14 = v12;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@ return results=%@.", (uint8_t *)&v13, 0x16u);
    }
  }
}

uint64_t sub_100007C94(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _failToPerformErrorWithError:a2];

  return _objc_release_x1();
}

void sub_100007D8C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[2])
  {
    dispatch_time_t v3 = dispatch_time(0, (int64_t)[v2 _graceIntervalBeforeUnloading]);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(NSObject **)(v4 + 24);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007EF4;
    block[3] = &unk_100018888;
    block[4] = v4;
    id v11 = *(id *)(a1 + 40);
    dispatch_after(v3, v5, block);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 40);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100007FAC;
    v9[3] = &unk_1000188B0;
    void v9[4] = v6;
    [v7 performOnRemoteObjectWithBlock:v9 errorHandler:&stru_1000188F0];
  }
  else
  {
    long long v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v8();
  }
}

uint64_t sub_100007EF4(uint64_t a1)
{
  dispatch_time_t v3 = (id *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[2])
  {
    if ([v2 shouldTriggerSimulatedCrash]) {
      [*v3 _triggerSimulatedCrash];
    }
    [*v3 _unload];
  }
  uint64_t v4 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100008AD0(v3, v4);
  }

  [*(id *)(a1 + 32) _killExtension:afterInterval:*(*(void *)(*(void *)(a1 + 32) + 8)) graceIntervalBeforeKilling:[*(id *)(a1 + 32) _graceIntervalBeforeKilling]];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100007FAC(uint64_t a1, void *a2)
{
  [a2 stop];
  dispatch_time_t v3 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [*(id *)(a1 + 32) extensionName];
    id v5 = [*(id *)(a1 + 32) _graceIntervalBeforeUnloading];
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2048;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Waiting to kill plugin=%@ with %lld", (uint8_t *)&v6, 0x16u);
  }
}

void sub_100008090(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  dispatch_time_t v3 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100008B60();
  }
}

void sub_100008174(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008190(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1000081C0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000081E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000081FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_100008214(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000824C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008284(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Found >1 extensions for identifier=%@ extension point=%@", (uint8_t *)&v3, 0x16u);
}

void sub_10000830C(void *a1, NSObject *a2)
{
  int v3 = [a1 firstObject];
  sub_100008168();
  sub_1000081FC((void *)&_mh_execute_header, a2, v4, "Discovered extension=%@", v5);
}

void sub_100008398(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000083D0()
{
  sub_100008168();
  sub_100008174((void *)&_mh_execute_header, v0, v1, "In requestCancellationBlock with error: %@", v2, v3, v4, v5, v6);
}

void sub_100008438()
{
  sub_100008168();
  sub_100008174((void *)&_mh_execute_header, v0, v1, "Failed to beginExtensionRequestWithOptions with error=%@", v2, v3, v4, v5, v6);
}

void sub_1000084A0(uint64_t a1, NSObject *a2)
{
  objc_opt_class();
  sub_100008168();
  id v4 = v3;
  sub_100008190((void *)&_mh_execute_header, a2, v5, "Failed to get correct host context with class = %@", v6);
}

void sub_10000852C()
{
  sub_100008168();
  sub_1000081FC((void *)&_mh_execute_header, v0, v1, "Requesting activation after stopped for plugin %@", v2);
}

void sub_100008598(void *a1, NSObject *a2)
{
  id v3 = [a1 extensionName];
  sub_100008168();
  sub_1000081FC((void *)&_mh_execute_header, a2, v4, "Simulating crash for extension %@", v5);
}

void sub_100008624(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) extensionName];
  sub_1000081A8();
  sub_1000081C0((void *)&_mh_execute_header, v2, v3, "Failed to simulate crash for extension=%@ with error=%@", v4, v5, v6, v7, v8);
}

void sub_1000086B8()
{
  sub_100008168();
  sub_1000081FC((void *)&_mh_execute_header, v0, v1, "Unloading plugin %@", v2);
}

void sub_100008724(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 recipe];
  uint64_t v4 = [v3 bundleIdentifier];
  sub_100008168();
  sub_100008190((void *)&_mh_execute_header, a2, v5, "No DES Record Directory extensions returned for %@.", v6);
}

void sub_1000087C8()
{
  sub_100008168();
  sub_100008174((void *)&_mh_execute_header, v0, v1, "Unexpected sandbox extensions returned for submission log (%@).", v2, v3, v4, v5, v6);
}

void sub_100008830(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 recipe];
  uint64_t v4 = [v3 attachments];
  sub_100008168();
  sub_100008190((void *)&_mh_execute_header, a2, v5, "Fail to issue sandbox extensions for downloaded attachment %@.", v6);
}

void sub_1000088D4()
{
  sub_100008168();
  sub_100008174((void *)&_mh_execute_header, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

void sub_10000893C()
{
  sub_100008168();
  sub_100008174((void *)&_mh_execute_header, v0, v1, "Fail to perform with error=%{public}@", v2, v3, v4, v5, v6);
}

void sub_1000089A4(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fail to create Sandbox extensions for task=%@ with error=%@.", (uint8_t *)&v5, 0x16u);
}

void sub_100008A3C(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) extensionName];
  sub_1000081A8();
  sub_1000081C0((void *)&_mh_execute_header, v2, v3, "%@ fail to return result with error=%@.", v4, v5, v6, v7, v8);
}

void sub_100008AD0(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 extensionName];
  sub_100008168();
  sub_100008190((void *)&_mh_execute_header, a2, v4, "Extension=%@ is being killed.", v5);
}

void sub_100008B60()
{
  sub_100008168();
  sub_100008174((void *)&_mh_execute_header, v0, v1, "Failed to stop with error=%@", v2, v3, v4, v5, v6);
}

void sub_100009BFC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v41 = 0;
  unsigned __int8 v3 = [v2 _pluginSupportTrialTask:&v41];
  id v4 = v41;
  if (v3)
  {
    v34 = [*(id *)(*(void *)(a1 + 32) + 24) bundleIdentifier];
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 16) shadowExperimentTasksForPluginID:];
    if ([v5 count])
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id obj = v5;
      id v6 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v33 = *(void *)v38;
        while (2)
        {
          for (i = 0; i != v7; i = (char *)i + 1)
          {
            if (*(void *)v38 != v33) {
              objc_enumerationMutation(obj);
            }
            uint64_t v9 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            id v10 = v34;
            uint64_t v11 = sub_10000A0FC(v9);
            +[DESBitacoraEventManager sendEventTaskFetchedForBundleID:v10 identifiers:v11];

            long long v12 = *(void **)(a1 + 32);
            id v36 = v4;
            LOBYTE(v11) = [v12 _DASAllowTask:v9 error:&v36];
            id v13 = v36;

            if ((v11 & 1) == 0)
            {
              id v30 = v10;
              id v4 = v13;
              v31 = sub_10000A0FC(v9);
              +[DESBitacoraEventManager sendEventTaskSchedulingFailedForBundleID:v30 identifiers:v31 error:v4];

              goto LABEL_21;
            }
            id v14 = v10;
            __int16 v15 = [v9 evaluationID];
            +[DESCoreAnalyticsEventManager sendEventRecipeFetchedForBundleID:v14 evaluationID:v15 error:0];

            id v16 = *(void **)(a1 + 32);
            id v17 = [v9 policy];
            unsigned __int8 v18 = [v16 canRunTask:v17];

            id v19 = v14;
            __int16 v20 = sub_10000A0FC(v9);
            if (v18)
            {
              +[DESBitacoraEventManager sendEventTaskSchedulingSucceededForBundleID:v19 identifiers:v20];

              uint64_t v21 = +[NSProcessInfo processInfo];
              [v21 systemUptime];
              double v23 = v22;

              v24 = *(void **)(*(void *)(a1 + 32) + 24);
              id v35 = v13;
              id v25 = [v24 performTrialTask:v9 outError:&v35];
              id v4 = v35;

              v26 = +[NSProcessInfo processInfo];
              [v26 systemUptime];
              double v28 = v27 - v23;

              [*(id *)(a1 + 32) _performAfterTask:v9 duration:v4 error:v28];
              if (v4) {
                goto LABEL_21;
              }
            }
            else
            {
              +[DESBitacoraEventManager sendEventTaskSchedulingFailedForBundleID:v19 identifiers:v20 error:0];

              id v4 = v13;
            }
          }
          id v7 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
          if (v7) {
            continue;
          }
          break;
        }
      }
LABEL_21:

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
    else
    {
      v29 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v44 = v34;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "No Shadow Evaluation tasks for %@.", buf, 0xCu);
      }

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000A028(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    unsigned __int8 v3 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10000A3F4();
    }
  }
}

id sub_10000A0FC(void *a1)
{
  id v1 = a1;
  if (objc_opt_class())
  {
    uint64_t v2 = [v1 evaluationState];
    unsigned __int8 v3 = [v2 experimentIdentifiers];

    id v4 = objc_alloc((Class)LBFTrialIdentifiers);
    uint64_t v5 = [v3 experimentId];
    id v6 = [v3 deploymentId];
    id v7 = [v3 treatmentId];
    id v8 = [v4 initWithExperimentID:v5 deploymentID:v6 treatmentID:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void sub_10000A1DC(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "PluginManager should not be nil", v1, 2u);
}

void sub_10000A220(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "TrialManager should not be nil", v1, 2u);
}

void sub_10000A264()
{
  sub_100008168();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@", v1, 0xCu);
}

void sub_10000A2D8()
{
  sub_100008168();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Fail to update task record with task=%@, error=%@", v2, 0x16u);
}

void sub_10000A35C(id *a1, NSObject *a2)
{
  __int16 v3 = [*a1 bundleIdentifier];
  sub_100008168();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Plugin=%@ doesn't support Trial task.", v4, 0xCu);
}

void sub_10000A3F4()
{
  sub_100008168();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Fail to stop with error=%@", v1, 0xCu);
}

void sub_10000AB1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  __int16 v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = [WeakRetained _xpcConnection];
    uint64_t v5 = (void *)xpc_connection_copy_invalidation_reason();
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2082;
    long long v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ invalidated, reason: %{public}s", (uint8_t *)&v9, 0x16u);
  }

  if (v5) {
    free(v5);
  }
  [v3 invalidate];
  id v8 = dispatch_get_global_queue(9, 0);
  dispatch_async_f(v8, 0, (dispatch_function_t)sub_10000AC60);
}

void sub_10000AC60()
{
  id v0 = objc_alloc_init((Class)NSFileManager);
  uint64_t v1 = DESTemporaryDownloadDirectoryURL();
  v49[0] = NSURLIsDirectoryKey;
  v49[1] = NSURLCreationDateKey;
  uint64_t v2 = +[NSArray arrayWithObjects:v49 count:2];
  v31 = v0;
  double v27 = (void *)v1;
  __int16 v3 = [v0 enumeratorAtURL:v1 includingPropertiesForKeys:v2 options:1 errorHandler:&stru_1000189C8];

  uint64_t v4 = +[NSCalendar currentCalendar];
  uint64_t v5 = +[NSDate date];
  v29 = [v4 dateByAddingUnit:32 value:-1 toDate:v5 options:0];

  id v28 = objc_alloc_init((Class)NSMutableArray);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v3;
  id v6 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
  if (v6)
  {
    id v7 = v6;
    id v8 = 0;
    uint64_t v9 = *(void *)v40;
    do
    {
      uint64_t v10 = 0;
      __int16 v11 = v8;
      do
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v10);
        if ([v12 hasDirectoryPath])
        {
          id v37 = 0;
          id v38 = 0;
          unsigned __int8 v14 = [v12 getResourceValue:&v38 forKey:NSURLCreationDateKey error:&v37];
          id v15 = v38;
          id v8 = v37;

          if (v14)
          {
            if ([v15 compare:v29] == (id)-1) {
              [v28 addObject:v12];
            }
          }
          else
          {
            id v16 = +[DESLogging coreChannel];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v45 = v12;
              __int16 v46 = 2112;
              id v47 = v8;
              _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Could not read creation date of attachment %@: %@", buf, 0x16u);
            }
          }
          __int16 v11 = v8;
        }
        else
        {
          id v8 = v11;
        }
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [obj countByEnumeratingWithState:&v39 objects:v48 count:16];
    }
    while (v7);
  }
  else
  {
    id v8 = 0;
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v17 = v28;
  id v18 = [v17 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        double v22 = v8;
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v17);
        }
        double v23 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        id v32 = v8;
        unsigned int v24 = [v31 removeItemAtURL:v23 error:&v32];
        id v8 = v32;

        id v25 = +[DESLogging coreChannel];
        v26 = v25;
        if (v24)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v23;
            _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "Garbage collected old recipe attachement at %@", buf, 0xCu);
          }
        }
        else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v45 = v23;
          __int16 v46 = 2112;
          id v47 = v8;
          _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Could not garbage collect old recipe attachment: %@: %@", buf, 0x16u);
        }
      }
      id v19 = [v17 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v19);
  }
}

void sub_10000B50C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B5C4;
  v7[3] = &unk_100018938;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t sub_10000B5C4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10000B714(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B7CC;
  v7[3] = &unk_100018938;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t sub_10000B7CC(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10000BD0C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BDE8;
  block[3] = &unk_100018988;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t sub_10000BDE8(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_10000BFF0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL sub_10000C584(id a1, NSURL *a2, NSError *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  if ((id)[(NSError *)v5 code] != (id)260)
  {
    id v6 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v4;
      __int16 v10 = 2112;
      __int16 v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Trouble enumerating %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  return 1;
}

void sub_10000C66C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "start donating result=%@, identifier=%@", (uint8_t *)&v3, 0x16u);
}

void sub_10000CB54(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (*(unsigned char *)(v8 + 120))
    {
      id v9 = *(NSObject **)(v8 + 40);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000CF68;
      block[3] = &unk_100018690;
      id v10 = *(id *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      id v33 = v10;
      uint64_t v34 = v11;
      dispatch_async(v9, block);
    }
    else
    {
      [*(id *)(a1 + 32) maxTimeLimit];
      if (v16 > 0.0)
      {
        id v17 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = [*(id *)(a1 + 32) bundleIdentifier];
          [*(id *)(a1 + 32) maxTimeLimit];
          *(_DWORD *)buf = 138412546;
          id v37 = v18;
          __int16 v38 = 2048;
          uint64_t v39 = v19;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Will start plugin=%@ with maxTimeLimit=%f seconds", buf, 0x16u);
        }
        objc_initWeak((id *)buf, v5);
        [*(id *)(a1 + 32) maxTimeLimit];
        dispatch_time_t v21 = dispatch_time(0, (uint64_t)(v20 * 1000000000.0));
        double v22 = *(NSObject **)(*(void *)(a1 + 40) + 48);
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_10000D040;
        v29[3] = &unk_1000189F0;
        objc_copyWeak(&v31, (id *)buf);
        id v30 = *(id *)(a1 + 32);
        dispatch_after(v21, v22, v29);

        objc_destroyWeak(&v31);
        objc_destroyWeak((id *)buf);
      }
      [*(id *)(*(void *)(a1 + 40) + 72) addObject:v5];
      double v23 = [*(id *)(a1 + 32) bundleIdentifier];
      +[DESCoreAnalyticsEventManager sendEventEvaluationSessionStartForBundleID:v23];

      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000D124;
      v26[3] = &unk_100018A40;
      id v24 = *(id *)(a1 + 32);
      uint64_t v25 = *(void *)(a1 + 40);
      id v27 = v24;
      uint64_t v28 = v25;
      [v5 runWithCompletion:v26];
    }
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) bundleIdentifier];
    +[DESCoreAnalyticsEventManager sendEventErrorForBundleID:v12 error:v6];

    id v13 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_10000E390((id *)(a1 + 32), (uint64_t)v6, v13);
    }

    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(NSObject **)(v14 + 40);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10000CF50;
    v35[3] = &unk_100018708;
    v35[4] = v14;
    dispatch_async(v15, v35);
  }
}

void sub_10000CF34(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

id sub_10000CF50(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleNextTask];
}

void sub_10000CF68(uint64_t a1)
{
  uint64_t v2 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Task %@ is deferred by DAS.", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = [v4 _requestedToStopError];
  [v4 _completeTaskRunWithResult:0 error:v5];
}

void sub_10000D040(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [*(id *)(a1 + 32) bundleIdentifier];
      int v5 = 138412290;
      int v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Request plugin=%@ to stop", (uint8_t *)&v5, 0xCu);
    }
    [WeakRetained stop];
  }
}

void sub_10000D124(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) bundleIdentifier];
  +[DESCoreAnalyticsEventManager sendEventEvaluationSessionFinishForBundleID:v7 success:v6 == 0];

  if (v6)
  {
    uint64_t v8 = [*(id *)(a1 + 32) bundleIdentifier];
    +[DESCoreAnalyticsEventManager sendEventErrorForBundleID:v8 error:v6];

    id v9 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10000E448((uint64_t *)(a1 + 32), (uint64_t)v6, v9);
    }
  }
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(NSObject **)(v10 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D298;
  block[3] = &unk_100018A18;
  void block[4] = v10;
  id v15 = v5;
  id v16 = v6;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v11, block);
}

id sub_10000D298(uint64_t a1)
{
  if (++*(void *)(*(void *)(a1 + 32) + 104) == *(void *)(*(void *)(a1 + 32) + 112)) {
    return [*(id *)(a1 + 32) _completeTaskRunWithResult:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }
  else {
    return [*(id *)(a1 + 32) _scheduleNextTask];
  }
}

id sub_10000DA98(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startTasks:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void sub_10000E09C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 72) allObjects];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v12;
    *(void *)&long long v4 = 138412290;
    long long v10 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
        id v9 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v10;
          id v16 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Stopping task worker: %@.", buf, 0xCu);
        }

        [v8 stop];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }
  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
}

void sub_10000E2E0(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = *(void *)(a1 + 104);
  uint64_t v4 = *(void *)(a1 + 112);
  id v5 = [*(id *)(a1 + 80) count];
  int v6 = 134218496;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = v4;
  __int16 v10 = 2048;
  id v11 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "completed=%ld, expected=%ld, to be scheduled=%ld.", (uint8_t *)&v6, 0x20u);
}

void sub_10000E390(id *a1, uint64_t a2, NSObject *a3)
{
  id v5 = [*a1 bundleIdentifier];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Fail to create worker for bundle=%@, with error=%@.", (uint8_t *)&v6, 0x16u);
}

void sub_10000E448(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fail to run task=%@ with error=%@.", (uint8_t *)&v4, 0x16u);
}

void sub_10000E4D4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown plugin type for %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000EC68(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_10000ECA4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained shouldDeferForXPCActivity:v3]) {
      [v5 handleDeferActivityTask:*(void *)(a1 + 32) withStartTime:*(double *)(a1 + 48)];
    }
  }
  else
  {
    __int16 v6 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000F4B4(v6);
    }
  }
}

id sub_10000ED40(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleCompleteActivityTask:*(void *)(a1 + 40) withError:a2];
}

void sub_10000F028(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) getStateForForXPCActivity:v3];
  if (!v4)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    __int16 v6 = [*(id *)(a1 + 40) criteria];
    [v7 setCriteriaForXPCActivityIfNeeded:v3 criteria:v6];
LABEL_7:

    goto LABEL_8;
  }
  if (v4 == (id)2)
  {
    uint64_t v5 = [*(id *)(a1 + 40) activity];

    if (!v5)
    {
      [*(id *)(a1 + 40) setActivity:v3];
      [*(id *)(a1 + 32) runActivityTask:*(void *)(a1 + 40)];
      goto LABEL_8;
    }
    __int16 v6 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      sub_10000F4F8(v6);
    }
    goto LABEL_7;
  }
LABEL_8:
}

void sub_10000F4B4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "eligibilityChangedHandler is called when self is nil.", v1, 2u);
}

void sub_10000F4F8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "XPC activity handler is invoked again with RUN state", v1, 2u);
}

void sub_10000F53C(_xpc_activity_s *a1, uint64_t a2, NSObject *a3)
{
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  xpc_activity_state_t state = xpc_activity_get_state(a1);
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to set activity state to %ld. Current xpc_activity_state_t state = %lu.", (uint8_t *)&v4, 0x16u);
}

void sub_10000F62C(id a1)
{
  qword_10001F628 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MLRExtensionHostProtocol];

  _objc_release_x1();
}

void sub_10000F6C8(id a1)
{
  qword_10001F638 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___MLRExtensionRemoteProtocol];

  _objc_release_x1();
}

void sub_10000FA28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000FA4C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000FA5C(uint64_t a1)
{
}

void sub_10000FA64(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10000FC6C((uint64_t)v4, v5);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  }
}

void sub_10000FAFC(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10000FCE4((uint64_t)v4, v5);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  }
}

void sub_10000FC28(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fail to create remote object proxy", v1, 2u);
}

void sub_10000FC6C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error performing block synchronously with error=%@", (uint8_t *)&v2, 0xCu);
}

void sub_10000FCE4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error performing block asynchronously with error=%@", (uint8_t *)&v2, 0xCu);
}

void sub_100010050(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unrecognized bundle=%@.", (uint8_t *)&v2, 0xCu);
}

void sub_1000100C8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Setting up handler for SIGTERM.", v1, 2u);
}

void sub_10001010C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Receiving SIGTERM.", v1, 2u);
}

uint64_t DESGetDeviceLocale()
{
  return _DESGetDeviceLocale();
}

uint64_t DESLogAndReturnSunsetError()
{
  return _DESLogAndReturnSunsetError();
}

uint64_t DESServiceGetXPCInterface()
{
  return _DESServiceGetXPCInterface();
}

uint64_t DESShouldAlwaysParticipate()
{
  return _DESShouldAlwaysParticipate();
}

uint64_t DESSubmissionLogDirectoryURL()
{
  return _DESSubmissionLogDirectoryURL();
}

uint64_t DESTemporaryDownloadDirectoryURL()
{
  return _DESTemporaryDownloadDirectoryURL();
}

uint64_t GarbageCollectAllRecords()
{
  return _GarbageCollectAllRecords();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t allowCustomWakeUpPeriod()
{
  return _allowCustomWakeUpPeriod();
}

uint64_t binaryGCD()
{
  return _binaryGCD();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
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

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

void xpc_activity_unregister(const char *identifier)
{
}

uint64_t xpc_connection_copy_invalidation_reason()
{
  return _xpc_connection_copy_invalidation_reason();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
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

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_MLRSandboxExtensionRequests(void *a1, const char *a2, ...)
{
  return [a1 MLRSandboxExtensionRequests];
}

id objc_msgSend_URLs(void *a1, const char *a2, ...)
{
  return [a1 URLs];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__activateExtensionIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _activateExtensionIfNecessary];
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return [a1 _auxiliaryConnection];
}

id objc_msgSend__failToGetHostError(void *a1, const char *a2, ...)
{
  return [a1 _failToGetHostError];
}

id objc_msgSend__graceIntervalBeforeKilling(void *a1, const char *a2, ...)
{
  return [a1 _graceIntervalBeforeKilling];
}

id objc_msgSend__graceIntervalBeforeUnloading(void *a1, const char *a2, ...)
{
  return [a1 _graceIntervalBeforeUnloading];
}

id objc_msgSend__requestedToStopError(void *a1, const char *a2, ...)
{
  return [a1 _requestedToStopError];
}

id objc_msgSend__scheduleNextTask(void *a1, const char *a2, ...)
{
  return [a1 _scheduleNextTask];
}

id objc_msgSend__setupExtensionHandlers(void *a1, const char *a2, ...)
{
  return [a1 _setupExtensionHandlers];
}

id objc_msgSend__skipTaskError(void *a1, const char *a2, ...)
{
  return [a1 _skipTaskError];
}

id objc_msgSend__triggerSimulatedCrash(void *a1, const char *a2, ...)
{
  return [a1 _triggerSimulatedCrash];
}

id objc_msgSend__unload(void *a1, const char *a2, ...)
{
  return [a1 _unload];
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 _xpcConnection];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_activityDeferred(void *a1, const char *a2, ...)
{
  return [a1 activityDeferred];
}

id objc_msgSend_allBundleIds(void *a1, const char *a2, ...)
{
  return [a1 allBundleIds];
}

id objc_msgSend_allFedStatsUnrestrictedBundleIds(void *a1, const char *a2, ...)
{
  return [a1 allFedStatsUnrestrictedBundleIds];
}

id objc_msgSend_allNonFedStatsUnrestrictedBundleIds(void *a1, const char *a2, ...)
{
  return [a1 allNonFedStatsUnrestrictedBundleIds];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allUnrestrictedBundleIds(void *a1, const char *a2, ...)
{
  return [a1 allUnrestrictedBundleIds];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bypassDiagnosticsUsage(void *a1, const char *a2, ...)
{
  return [a1 bypassDiagnosticsUsage];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_coreChannel(void *a1, const char *a2, ...)
{
  return [a1 coreChannel];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createTaskScheduler(void *a1, const char *a2, ...)
{
  return [a1 createTaskScheduler];
}

id objc_msgSend_createXPCActivityTasks(void *a1, const char *a2, ...)
{
  return [a1 createXPCActivityTasks];
}

id objc_msgSend_criteria(void *a1, const char *a2, ...)
{
  return [a1 criteria];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_deploymentId(void *a1, const char *a2, ...)
{
  return [a1 deploymentId];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_diagnosticsUsageAllowed(void *a1, const char *a2, ...)
{
  return [a1 diagnosticsUsageAllowed];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dynamicallyRegistered(void *a1, const char *a2, ...)
{
  return [a1 dynamicallyRegistered];
}

id objc_msgSend_eligibilityHandler(void *a1, const char *a2, ...)
{
  return [a1 eligibilityHandler];
}

id objc_msgSend_endAtDate(void *a1, const char *a2, ...)
{
  return [a1 endAtDate];
}

id objc_msgSend_evaluationID(void *a1, const char *a2, ...)
{
  return [a1 evaluationID];
}

id objc_msgSend_evaluationState(void *a1, const char *a2, ...)
{
  return [a1 evaluationState];
}

id objc_msgSend_experimentId(void *a1, const char *a2, ...)
{
  return [a1 experimentId];
}

id objc_msgSend_experimentIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 experimentIdentifiers];
}

id objc_msgSend_extensionName(void *a1, const char *a2, ...)
{
  return [a1 extensionName];
}

id objc_msgSend_fetchAllPluginIDs(void *a1, const char *a2, ...)
{
  return [a1 fetchAllPluginIDs];
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return [a1 fields];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_freshProvider(void *a1, const char *a2, ...)
{
  return [a1 freshProvider];
}

id objc_msgSend_hasDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 hasDirectoryPath];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_lastCompletionDate(void *a1, const char *a2, ...)
{
  return [a1 lastCompletionDate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_maxPerformCount(void *a1, const char *a2, ...)
{
  return [a1 maxPerformCount];
}

id objc_msgSend_maxTimeLimit(void *a1, const char *a2, ...)
{
  return [a1 maxTimeLimit];
}

id objc_msgSend_minInterval(void *a1, const char *a2, ...)
{
  return [a1 minInterval];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_performCount(void *a1, const char *a2, ...)
{
  return [a1 performCount];
}

id objc_msgSend_periodInSeconds(void *a1, const char *a2, ...)
{
  return [a1 periodInSeconds];
}

id objc_msgSend_pluginId(void *a1, const char *a2, ...)
{
  return [a1 pluginId];
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return [a1 policy];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_purgeObsoleted(void *a1, const char *a2, ...)
{
  return [a1 purgeObsoleted];
}

id objc_msgSend_recipe(void *a1, const char *a2, ...)
{
  return [a1 recipe];
}

id objc_msgSend_registerIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 registerIfNeeded];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return [a1 removeLastObject];
}

id objc_msgSend_requireWrite(void *a1, const char *a2, ...)
{
  return [a1 requireWrite];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_schedulerWakeupPeriodInSeconds(void *a1, const char *a2, ...)
{
  return [a1 schedulerWakeupPeriodInSeconds];
}

id objc_msgSend_sendEventActivityScheduled(void *a1, const char *a2, ...)
{
  return [a1 sendEventActivityScheduled];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldTriggerSimulatedCrash(void *a1, const char *a2, ...)
{
  return [a1 shouldTriggerSimulatedCrash];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_startAfterDate(void *a1, const char *a2, ...)
{
  return [a1 startAfterDate];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_submissionAllowed(void *a1, const char *a2, ...)
{
  return [a1 submissionAllowed];
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return [a1 systemUptime];
}

id objc_msgSend_taskID(void *a1, const char *a2, ...)
{
  return [a1 taskID];
}

id objc_msgSend_treatmentId(void *a1, const char *a2, ...)
{
  return [a1 treatmentId];
}

id objc_msgSend_unload(void *a1, const char *a2, ...)
{
  return [a1 unload];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateInterval(void *a1, const char *a2, ...)
{
  return [a1 updateInterval];
}

id objc_msgSend_updateWakeUpPeriodInSeconds(void *a1, const char *a2, ...)
{
  return [a1 updateWakeUpPeriodInSeconds];
}

id objc_msgSend_valuesArray(void *a1, const char *a2, ...)
{
  return [a1 valuesArray];
}

id objc_msgSend_wakeUpPeriodInSeconds(void *a1, const char *a2, ...)
{
  return [a1 wakeUpPeriodInSeconds];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}