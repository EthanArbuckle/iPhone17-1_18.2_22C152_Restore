void sub_100002798(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100002824(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100002CE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _setupShieldLifecycleMonitorForCurrentSession];
    id WeakRetained = v2;
  }
}

void sub_1000030CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

void sub_100003114(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v13 = 138543874;
    id v14 = WeakRetained;
    __int16 v15 = 2114;
    id v16 = v5;
    __int16 v17 = 2114;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Session Interrupted (%{public}@ %{public}@)", (uint8_t *)&v13, 0x20u);
  }
  id v9 = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = v9;
  if (v9)
  {
    v11 = v9;
    objc_sync_enter(v11);
    uint64_t v12 = v11[8];
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
    objc_sync_exit(v11);
  }
}

void sub_10000324C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003268(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _setupShieldLifecycleMonitorForCurrentSession];
    id WeakRetained = v2;
  }
}

void sub_100003544(id a1)
{
  qword_10001D858 = objc_alloc_init(CCDShieldUILifeCycleManager);

  _objc_release_x1();
}

void sub_100003968(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    id v2 = [WeakRetained activeSession];

    id WeakRetained = v3;
    if (v2)
    {
      if (!v3[1])
      {
        [v3 _acquireLockScreenAssertion];
        id WeakRetained = v3;
      }
      if (!WeakRetained[2])
      {
        [v3 _acquireAppSwitcherAssertion];
        id WeakRetained = v3;
      }
      if (!WeakRetained[3])
      {
        [v3 _acquireAlwaysOnDisplayAssertion];
        id WeakRetained = v3;
      }
      *((unsigned char *)WeakRetained + 72) = 1;
    }
  }
}

uint64_t sub_100003C04(uint64_t a1)
{
  [*(id *)(a1 + 32) _releaseLockScreenAssertion];
  [*(id *)(a1 + 32) _releaseAppSwitcherAssertion];
  [*(id *)(a1 + 32) _releaseAlwaysOnDisplayAssertion];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

id sub_100003FA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchShieldForDeviceIdentifier:*(void *)(a1 + 40) name:*(void *)(a1 + 48) model:*(void *)(a1 + 64) skipPlacementStep:*(unsigned __int8 *)(a1 + 72) isDedicated:*(unsigned __int8 *)(a1 + 73) statusHandler:*(void *)(a1 + 56)];
}

void sub_100004338(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004374(id a1)
{
  id v2 = +[NSBundle mainBundle];
  v1 = [v2 bundleIdentifier];
  AVCapturePrewarm();
}

void sub_1000043D4(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = objc_loadWeakRetained(v1);
      id v5 = [WeakRetained activeSession];
      int v11 = 138543874;
      id v12 = v4;
      __int16 v13 = 2080;
      id v14 = "-[CCDShieldUILifeCycleManager _launchShieldForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:stat"
            "usHandler:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s session interrupted active session %@", (uint8_t *)&v11, 0x20u);
    }
    id v6 = WeakRetained;
    objc_sync_enter(v6);
    if ([*((id *)v6 + 5) willTerminate])
    {
      v7 = *((void *)v6 + 8);
      if (v7)
      {
        dispatch_semaphore_signal(v7);
        v8 = (void *)*((void *)v6 + 8);
        *((void *)v6 + 8) = 0;
      }
      objc_sync_exit(v6);
    }
    else
    {
      objc_sync_exit(v6);

      id v9 = [v6 activeSession];
      BOOL v10 = v9 == 0;

      if (!v10) {
        [v6 notifyShieldStatus:-2001];
      }
    }
  }
}

void sub_100004560(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100004874(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = CMContinuityCaptureLog();
    v7 = v6;
    if (v4)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10000FF0C((uint64_t)v4, v7, v8, v9, v10, v11, v12, v13);
      }

      [WeakRetained notifyShieldStatus:-2002];
    }
    else
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int16 v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Successfully launched ContinuityCaptureShieldUI", v15, 2u);
      }

      [WeakRetained notifyShieldStatus:0];
      id v14 = [WeakRetained activeSession];
      [v14 setupShieldLifecycleMonitorForCurrentSession];
    }
  }
}

id sub_100004A74(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchShieldUIProcess];
}

void sub_100004DDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  objc_destroyWeak(location);
  _Block_object_dispose(&a28, 8);
  objc_destroyWeak((id *)(v28 - 168));
  _Unwind_Resume(a1);
}

void sub_100004E2C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v8 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      id v16 = v9;
      __int16 v17 = 2080;
      id v18 = "-[CCDShieldUILifeCycleManager _forceTerminateShieldIfApplicable:completionTimeoutInSec:]_block_invoke";
      __int16 v19 = 2114;
      id v20 = v5;
      __int16 v21 = 2114;
      id v22 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %s Session Interrupted (%{public}@ %{public}@)", buf, 0x2Au);
    }
    uint64_t v10 = *(NSObject **)(a1 + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004FC4;
    block[3] = &unk_1000187C0;
    long long v12 = *(_OWORD *)(a1 + 40);
    id v11 = (id)v12;
    long long v14 = v12;
    dispatch_async(v10, block);
  }
}

uint64_t sub_100004FC4(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8);
  if (!*(unsigned char *)(v1 + 24))
  {
    *(unsigned char *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_100004FF0(uint64_t result)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24))
  {
    uint64_t v1 = result;
    id v2 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v1 + 48));
      int v4 = 138543362;
      id v5 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ *** Should never happen, we even failed to exit due to force termination ***", (uint8_t *)&v4, 0xCu);
    }
    *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = 1;
    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

void sub_1000051F8(uint64_t a1)
{
  [*(id *)(a1 + 32) _releaseLockScreenAssertion];
  [*(id *)(a1 + 32) _releaseAppSwitcherAssertion];
  [*(id *)(a1 + 32) _releaseAlwaysOnDisplayAssertion];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    [v3 invalidate];
    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 72) = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = *(void **)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005330;
  v11[3] = &unk_100018798;
  id v6 = v4;
  long long v12 = v6;
  [v5 _forceTerminateShieldIfApplicable:v11 completionTimeoutInSec:2];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = *(void **)(a1 + 32);
  if (v7[5])
  {
    [v7 willChangeValueForKey:@"activeSession"];
    id v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = 0;

    objc_sync_exit(v8);
    [*(id *)(a1 + 32) didChangeValueForKey:@"activeSession"];
  }
}

intptr_t sub_100005330(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005450(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activeSession];

  if (v2)
  {
    [*(id *)(*(void *)(a1 + 32) + 40) setWillTerminate:1];
    [*(id *)(a1 + 32) _releaseLockScreenAssertion];
    [*(id *)(a1 + 32) _releaseAppSwitcherAssertion];
    [*(id *)(a1 + 32) _releaseAlwaysOnDisplayAssertion];
    dispatch_time_t v3 = dispatch_time(0, 2000000000);
    dispatch_semaphore_t v4 = +[CMContinuityCaptureXPCServerCCD sharedInstance];
    [v4 tearDownShieldUI];

    id v5 = dispatch_semaphore_create(0);
    id v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v5);
    objc_sync_exit(v6);

    if (dispatch_semaphore_wait(v5, v3))
    {
      v7 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        uint64_t v20 = v8;
        __int16 v21 = 2080;
        id v22 = "-[CCDShieldUILifeCycleManager tearDownShield]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ %s termination didn't complete within 5 sec", buf, 0x16u);
      }

      dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
      uint64_t v10 = *(void **)(a1 + 32);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100005794;
      v17[3] = &unk_100018798;
      id v5 = v9;
      id v18 = v5;
      [v10 _forceTerminateShieldIfApplicable:v17 completionTimeoutInSec:2];
      dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
    [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
    [*(id *)(a1 + 32) willChangeValueForKey:@"activeSession"];
    id v11 = *(id *)(a1 + 32);
    objc_sync_enter(v11);
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;

    objc_sync_exit(v11);
    [*(id *)(a1 + 32) didChangeValueForKey:@"activeSession"];
    long long v14 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v15;
      __int16 v21 = 2080;
      id v22 = "-[CCDShieldUILifeCycleManager tearDownShield]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ %s completed", buf, 0x16u);
    }
  }
  else
  {
    id v5 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v20 = v16;
      __int16 v21 = 2080;
      id v22 = "-[CCDShieldUILifeCycleManager tearDownShield]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ %s no active session", buf, 0x16u);
    }
  }
}

intptr_t sub_100005794(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000058DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000058F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_semaphore_t v4 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000FFBC((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
  }

  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v12 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v13 = WeakRetained[6];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000059CC;
    block[3] = &unk_100018798;
    void block[4] = v12;
    dispatch_async(v13, block);
  }
}

void sub_1000059CC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

void sub_100005C48(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 64));
  _Unwind_Resume(a1);
}

void sub_100005C6C(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained) {
    objc_storeStrong(WeakRetained + 2, a2);
  }
}

void sub_100005CD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = WeakRetained[6];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100005D8C;
    v7[3] = &unk_100018888;
    v7[4] = WeakRetained;
    id v8 = v3;
    dispatch_async(v6, v7);
  }
}

void sub_100005D8C(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    dispatch_semaphore_t v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = 0;
  }
  else
  {
    uint64_t v5 = *(void **)(a1 + 40);
    [v5 invalidate];
  }
}

void sub_1000060AC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000062BC(uint64_t a1)
{
  id v3 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 addObserver:WeakRetained forKeyPath:CMContinuityCaptureCallStateKVOKey options:3 context:0];
}

void sub_100006660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000667C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = +[CCDShieldUILifeCycleManager sharedInstance];
    id v3 = [v2 activeSession];
    dispatch_semaphore_t v4 = [v3 pauseStateSolver];
    [v4 resumeForEvent:*(void *)(a1 + 40)];

    [WeakRetained _resolveUserPauseState];
  }
}

void sub_1000067D4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int BoolAnswer = AVGestaltGetBoolAnswer();
    unsigned int v4 = [WeakRetained[11] lockScreenInLayout];
    unsigned int v5 = v4;
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6)
    {
      if (v6 == 2)
      {
        int v8 = BoolAnswer | v4 ^ 1;
        CFStringRef v7 = @"CMContinuityCapturePauseEventShieldObscuredOnLockScreen";
      }
      else if (v6 == 1)
      {
        if ((BoolAnswer | v4))
        {
          CFStringRef v7 = @"CMContinuityCapturePauseEventShieldBackgrounded";
          int v8 = 1;
        }
        else
        {
          int v8 = SBSGetScreenLockStatus() != 0;
          CFStringRef v7 = @"CMContinuityCapturePauseEventShieldBackgrounded";
        }
      }
      else
      {
        int v8 = 0;
        CFStringRef v7 = @"Unknown";
      }
    }
    else
    {
      int v8 = 0;
      CFStringRef v7 = @"CMContinuityCapturePauseEventUserPressedPause";
    }
    uint64_t v9 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 48);
      int v15 = 138544898;
      uint64_t v16 = v10;
      __int16 v17 = 2080;
      id v18 = "-[CMContinuityCaptureDServer pauseSessionForEvent:]_block_invoke";
      __int16 v19 = 1024;
      int v20 = v11;
      __int16 v21 = 2112;
      CFStringRef v22 = v7;
      __int16 v23 = 1024;
      int v24 = v8;
      __int16 v25 = 1024;
      unsigned int v26 = v5;
      __int16 v27 = 1024;
      int v28 = BoolAnswer;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %s event:%d, eventName:%@, ignoreEvent:%d, lockScreenInLayout:%d,  localDeviceSupportsContinuityCaptureMultitasking:%d", (uint8_t *)&v15, 0x38u);
    }

    if ((v8 & 1) == 0)
    {
      uint64_t v12 = +[CCDShieldUILifeCycleManager sharedInstance];
      uint64_t v13 = [v12 activeSession];
      long long v14 = [v13 pauseStateSolver];
      [v14 pauseForEvent:*(void *)(a1 + 48)];

      [WeakRetained _resolveUserPauseState];
    }
  }
}

void sub_100006BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_100006BEC(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    unsigned int v4 = *(void **)(a1 + 32);
    if (v4)
    {
      unsigned int v5 = [v4 sessionID];
    }
    else
    {
      unsigned int v5 = 0;
    }
    uint64_t v6 = [WeakRetained[1] compositeDevice];

    if (v6) {
      +[CMContinuityCaptureRemoteCompositeDevice setWombatMode:0];
    }
    CFStringRef v7 = [*(id *)(a1 + 32) deviceIdentifier];
    [*(id *)(a1 + 40) _exitSessionIfApplicableForDeviceIdentifier:v7 exitReason:*(void *)(a1 + 48)];
    id v8 = WeakRetained[1];
    if (v8) {
      id v9 = [v8 currentSessionID];
    }
    else {
      id v9 = 0;
    }
    [WeakRetained _teardownShieldUI];
    uint64_t v10 = [WeakRetained[1] compositeDevice];
    if (v10)
    {
      int v11 = *(unsigned __int8 *)(a1 + 64);

      if (v11)
      {
        uint64_t v12 = CMContinuityCaptureLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = objc_loadWeakRetained(v2);
          long long v14 = [WeakRetained[1] compositeDevice];
          *(_DWORD *)buf = 138543874;
          id v35 = v13;
          __int16 v36 = 2080;
          v37 = "-[CMContinuityCaptureDServer disconnectSession:reason:]_block_invoke";
          __int16 v38 = 2112;
          v39 = v14;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ %s disconnect during active session for %@", buf, 0x20u);
        }
        int v15 = [WeakRetained[1] compositeDevice];
        [v15 postEvent:kCMContinuityCaptureEventUserDisconnect entity:0 data:0];
      }
    }
    if (v7 && *(unsigned char *)(a1 + 64))
    {
      uint64_t v16 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = objc_loadWeakRetained(v2);
        *(_DWORD *)buf = 138544130;
        id v35 = v17;
        __int16 v36 = 2080;
        v37 = "-[CMContinuityCaptureDServer disconnectSession:reason:]_block_invoke";
        __int16 v38 = 2112;
        v39 = v7;
        __int16 v40 = 2048;
        id v41 = v9;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ %s disconnect during headless state for %@ currentSessionID %llx", buf, 0x2Au);
      }
      uint64_t v27 = ContinuityCaptureRapportClientMessageTypeKey;
      uint64_t v28 = ContinuityCaptureRapportClientEventNameKey;
      v31 = &off_100018FB8;
      uint64_t v32 = kCMContinuityCaptureEventUserDisconnect;
      __int16 v19 = *(void **)(a1 + 40);
      CFStringRef v18 = *(const __CFString **)(a1 + 48);
      uint64_t v29 = ContinuityCaptureRapportClientUserDisconnectReasonKey;
      uint64_t v30 = ContinuityCaptureRapportClientShieldSessionIDKey;
      CFStringRef v20 = @"Unknown";
      if (v18) {
        CFStringRef v21 = v18;
      }
      else {
        CFStringRef v21 = @"Unknown";
      }
      if (v5) {
        CFStringRef v20 = v5;
      }
      CFStringRef v22 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9, v27, v28, v29, v30, ContinuityCaptureRapportClientTransportSessionIDKey, v31, v32, v21, v20);
      v33 = v22;
      __int16 v23 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v27 count:5];
      int v24 = [*(id *)(a1 + 32) configuration];
      [v19 relayMessage:v23 toDeviceWithIdentifier:v7 andModel:[v24 clientDeviceModel]];
    }
    if (!WeakRetained[1] && [WeakRetained[7] count])
    {
      uint64_t v25 = kCMContinuityCaptureEventCaptureSessionEnded;
      unsigned int v26 = [WeakRetained[7] firstObject];
      [WeakRetained postEvent:v25 toSession:v26];

      [WeakRetained[7] removeObjectAtIndex:0];
    }
  }
}

void sub_1000070F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100007114(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _skipPlacementStepIfApplicable];
    id WeakRetained = v2;
  }
}

void sub_1000072BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1000072D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = +[CCDShieldUILifeCycleManager sharedInstance];
    [v3 prepareForPullConversation:*(void *)(a1 + 32)];

    id WeakRetained = v4;
  }
}

void sub_100007560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007588(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007598(uint64_t a1)
{
}

uint64_t sub_1000075A0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[CMContinuityCaptureCapabilities capabilitiesForCurrentDevice];

  return _objc_release_x1();
}

void sub_100007830(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _relayMessage:*(void *)(a1 + 32) toDeviceWithIdentifier:*(void *)(a1 + 40) andModel:*(void *)(a1 + 56)];
    id WeakRetained = v3;
  }
}

void sub_100007B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007B84(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    *(_DWORD *)buf = 138543618;
    id v25 = WeakRetained;
    __int16 v26 = 2112;
    id v27 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ companion link activation %@", buf, 0x16u);
  }
  if (!v3 || ![v3 code])
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 64));
    if (!v6)
    {
LABEL_14:

      goto LABEL_15;
    }
    id v7 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:*(void *)(a1 + 40)];
    id v8 = +[CCDShieldUILifeCycleManager sharedInstance];
    id v9 = [v8 activeSession];
    if (v9)
    {
      uint64_t v10 = +[CCDShieldUILifeCycleManager sharedInstance];
      int v11 = [v10 activeSession];
      uint64_t v12 = [v11 sessionID];
      BOOL v13 = v12 == 0;

      if (v13)
      {
LABEL_11:
        uint64_t v16 = (void *)GestaltCopyAnswer();
        if (v16) {
          [v7 setObject:v16 forKeyedSubscript:RPOptionSenderModelID];
        }
        id v17 = CMContinuityCaptureGetCurrentTimeString();
        [v7 setObject:v17 forKeyedSubscript:ContinuityCaptureRapportClientEventOriginTimeInNativeClockKey];

        CFStringRef v18 = *(void **)(a1 + 48);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100007EA8;
        v20[3] = &unk_1000189A0;
        objc_copyWeak(&v23, (id *)(a1 + 64));
        uint64_t v19 = ContinuityCaptureCompanionSessionEventID;
        id v21 = *(id *)(a1 + 56);
        id v22 = *(id *)(a1 + 32);
        [v18 sendEventID:v19 event:v7 options:0 completion:v20];

        objc_destroyWeak(&v23);
        goto LABEL_14;
      }
      id v8 = +[CCDShieldUILifeCycleManager sharedInstance];
      long long v14 = [v8 activeSession];
      int v15 = [v14 sessionID];
      [v7 setObject:v15 forKeyedSubscript:ContinuityCaptureRapportClientShieldSessionIDKey];
    }
    goto LABEL_11;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_15:
}

void sub_100007E8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100007EA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    unsigned int v5 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_loadWeakRetained((id *)(a1 + 48));
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543874;
      id v9 = v6;
      __int16 v10 = 2114;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      id v13 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Message sent to device %{public}@ with error %@", (uint8_t *)&v8, 0x20u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
}

void sub_100008060(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = objc_loadWeakRetained(v1);
      unsigned int v5 = +[CCDShieldUILifeCycleManager sharedInstance];
      id v6 = [v5 activeSession];
      int v14 = 138543618;
      id v15 = v4;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ shield disconnected currently status:%{public}@", (uint8_t *)&v14, 0x16u);
    }
    uint64_t v7 = +[CCDShieldUILifeCycleManager sharedInstance];
    int v8 = [v7 activeSession];

    if (v8)
    {
      id v9 = +[CCDShieldUILifeCycleManager sharedInstance];
      __int16 v10 = [v9 activeSession];
      uint64_t v11 = [v10 configuration];
      id v12 = [v11 clientDeviceModel];

      if (v12 == (id)2) {
        [WeakRetained disconnectSession:1 reason:kCMContinuityCaptureSessionExitReasonShieldDisconnected];
      }
      else {
        [WeakRetained teardownShieldUI];
      }
      [WeakRetained teardownSession];
      id v13 = +[CCDShieldUILifeCycleManager sharedInstance];
      [v13 shieldDidDisconnect];
    }
  }
}

void sub_1000083F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100008414(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    __int16 v16 = WeakRetained;
    id v3 = +[CCDShieldUILifeCycleManager sharedInstance];
    id v4 = [v3 activeSession];
    unsigned int v5 = [v4 pauseStateSolver];
    [v5 incomingCallStatusUpdated:*(unsigned __int8 *)(a1 + 48)];

    id v6 = +[CCDShieldUILifeCycleManager sharedInstance];
    uint64_t v7 = [v6 activeSession];
    int v8 = [v7 configuration];
    id v9 = [v8 clientDeviceModel];

    if (v9 == (id)2)
    {
      if (*(unsigned char *)(a1 + 49))
      {
        int v11 = *(unsigned __int8 *)(a1 + 48);
        id v10 = &__NSDictionary0__struct;
LABEL_7:
        id v12 = v16;
        if (v11)
        {
          id v13 = [v16[1] compositeDevice];
          int v14 = v13;
          id v15 = &kCMContinuityCaptureControlIncomingCall;
LABEL_11:
          [v13 postEvent:*v15 entity:4 data:v10];

          id WeakRetained = v16;
          goto LABEL_12;
        }
LABEL_10:
        id v13 = [v12[1] compositeDevice];
        int v14 = v13;
        id v15 = &kCMContinuityCaptureControlIncomingCallComplete;
        goto LABEL_11;
      }
    }
    else if (v9 == (id)1)
    {
      id v10 = *(id *)(a1 + 32);
      int v11 = *(unsigned __int8 *)(a1 + 48);
      goto LABEL_7;
    }
    id v10 = &__NSDictionary0__struct;
    id v12 = v16;
    goto LABEL_10;
  }
LABEL_12:
}

void sub_1000087D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_1000087F4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v8 = WeakRetained;
    id v3 = [WeakRetained[1] compositeDevice];

    id WeakRetained = v8;
    if (v3)
    {
      int v4 = *(unsigned __int8 *)(a1 + 40);
      unsigned int v5 = [v8[1] compositeDevice];
      id v6 = v5;
      uint64_t v7 = &kCMContinuityCaptureEventActiveCallEnd;
      if (v4) {
        uint64_t v7 = &kCMContinuityCaptureEventActiveCallStart;
      }
      [v5 postEvent:*v7 entity:0 data:0];

      id WeakRetained = v8;
    }
  }
}

void sub_100008A64(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v6 = 138543874;
    id v7 = WeakRetained;
    __int16 v8 = 2080;
    id v9 = "-[CMContinuityCaptureDServer activate]_block_invoke";
    __int16 v10 = 2114;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s completion error %{public}@ ", (uint8_t *)&v6, 0x20u);
  }
}

void sub_100008B50(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[2] activateWithCompletion:*(void *)(a1 + 32)];
    [v3[3] activateWithCompletion:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void sub_100008C60(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained[2] invalidate];
    [v2[3] invalidate];
    id WeakRetained = v2;
  }
}

void sub_100008DCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _launchShieldUIForDeviceIdentifier:*(void *)(a1 + 32) name:*(void *)(a1 + 40) model:*(void *)(a1 + 56) skipPlacementStep:*(unsigned __int8 *)(a1 + 64) isDedicated:*(unsigned __int8 *)(a1 + 65)];
    id WeakRetained = v3;
  }
}

void sub_100008FFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_10000901C(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 56) != 2) {
      [WeakRetained callActive:[WeakRetained activeCallSession]];
    }
    unsigned int v5 = +[CCDShieldUILifeCycleManager sharedInstance];
    int v6 = [v5 activeSession];

    if (v6)
    {
      id v7 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 64)];
      __int16 v8 = +[CCDShieldUILifeCycleManager sharedInstance];
      id v9 = [v8 activeSession];
      __int16 v10 = [v9 configuration];
      [v10 setPlacementStepSkipped:v7];

      id v11 = +[CMContinuityCaptureXPCServerCCD sharedInstance];
      id v12 = +[CCDShieldUILifeCycleManager sharedInstance];
      id v13 = [v12 activeSession];
      int v14 = [v13 configuration];
      [v11 updateClientsWithConfiguration:v14];
    }
    else
    {
      id v15 = v4[4];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100009210;
      block[3] = &unk_100018A40;
      objc_copyWeak(v21, v2);
      id v19 = *(id *)(a1 + 32);
      id v16 = *(id *)(a1 + 40);
      id v17 = *(void **)(a1 + 56);
      id v20 = v16;
      v21[1] = v17;
      __int16 v22 = *(_WORD *)(a1 + 64);
      dispatch_async(v15, block);

      objc_destroyWeak(v21);
    }
  }
}

void sub_100009210(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    int v4 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_loadWeakRetained(v2);
      *(_DWORD *)buf = 138543618;
      id v19 = v5;
      __int16 v20 = 2080;
      id v21 = "-[CMContinuityCaptureDServer _launchShieldUIForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009474;
    block[3] = &unk_100018670;
    objc_copyWeak(&v17, v2);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    int v6 = +[CCDShieldUILifeCycleManager sharedInstance];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v7 = a1 + 32;
    uint64_t v10 = *(void *)(v7 + 24);
    BOOL v11 = *(unsigned char *)(v7 + 32) != 0;
    BOOL v12 = *(unsigned char *)(v7 + 33) != 0;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100009550;
    v13[3] = &unk_100018A68;
    objc_copyWeak(&v15, v2);
    id v14 = *(id *)v7;
    [v6 launchShieldForDeviceIdentifier:v8 name:v9 model:v10 skipPlacementStep:v11 isDedicated:v12 statusHandler:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
  }
}

void sub_100009448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_100009474(id *a1)
{
  id v2 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [v2 addObserver:WeakRetained];

  int v4 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
  [v4 holdIdleSleepAssertionForReason:&stru_100018E78];

  id v6 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
  id v5 = objc_loadWeakRetained(a1);
  [v6 addObserver:v5 forKeyPath:CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey options:3 context:0];
}

void sub_100009550(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3 == -2002)
  {
    id v14 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_100010100(a1);
    }

    BOOL v12 = +[CMContinuityCaptureUserNotificationCenter sharedInstance];
    v26[0] = kContinuityCaptureNotificationKeyTitle;
    v26[1] = kContinuityCaptureNotificationKeyBody;
    v27[0] = @"ALERT_SHIELD_CONNECT_FAILED_TITLE";
    v27[1] = @"ALERT_SHIELD_CONNECT_FAILED_DESCRIPTION";
    v26[2] = kContinuityCaptureNotificationKeyButtonTitle;
    v27[2] = @"OK";
    id v15 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:3];
    [v12 scheduleNotification:12 data:v15];

    goto LABEL_10;
  }
  if (a3)
  {
    if (v5 && a3 == -2001)
    {
      id v16 = +[CCDShieldUILifeCycleManager sharedInstance];
      uint64_t v17 = [v16 activeSession];
      if (!v17)
      {

        goto LABEL_11;
      }
      CFStringRef v18 = (void *)v17;
      id v19 = +[CCDShieldUILifeCycleManager sharedInstance];
      __int16 v20 = [v19 activeSession];
      unsigned int v21 = [v20 isEqual:v6];

      if (v21)
      {
        __int16 v22 = CMContinuityCaptureLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
          sub_100010028(a1);
        }

        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        if (WeakRetained)
        {
          BOOL v12 = WeakRetained;
          [WeakRetained shieldDidDisconnect];
          goto LABEL_10;
        }
      }
    }
  }
  else
  {
    uint64_t v7 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 40));
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      id v29 = v8;
      __int16 v30 = 2114;
      v31 = v6;
      __int16 v32 = 2114;
      uint64_t v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ [shieldSession:%{public}@] (CMContinuityCapture)Shields are up! for device %{public}@", buf, 0x20u);
    }
    uint64_t v10 = (id *)(a1 + 40);
    BOOL v11 = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    if (v11)
    {
      BOOL v12 = v11;
      id v13 = v11[4];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100009864;
      block[3] = &unk_100018670;
      objc_copyWeak(&v25, v10);
      dispatch_async(v13, block);
      objc_destroyWeak(&v25);
LABEL_10:
    }
  }
LABEL_11:
}

void sub_100009864(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[112])
    {
      int v4 = +[CCDShieldUILifeCycleManager sharedInstance];
      id v5 = [v4 activeSession];
      id v6 = [v5 pauseStateSolver];
      unsigned int v7 = [v6 isUserPauseStored];

      if (v7)
      {
        id v8 = CMContinuityCaptureLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          id v9 = objc_loadWeakRetained(v1);
          int v16 = 138543362;
          id v17 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Stream was in user pause state , potentially a crash recovery", (uint8_t *)&v16, 0xCu);
        }
        v3[112] = 0;
        uint64_t v10 = +[CCDShieldUILifeCycleManager sharedInstance];
        BOOL v11 = [v10 activeSession];
        BOOL v12 = [v11 pauseStateSolver];
        [v12 pauseForEvent:0];

        id v13 = +[CCDShieldUILifeCycleManager sharedInstance];
        id v14 = [v13 activeSession];
        id v15 = [v14 pauseStateSolver];
        [v15 saveUserPauseState:0];

        [v3 _resolveUserPauseState];
      }
    }
  }
}

void sub_100009AC0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _teardownShieldUI];
    id WeakRetained = v2;
  }
}

void sub_100009CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100009CF4(id *a1)
{
  id v2 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
  [v2 releaseCurrentIdleSleepAssertion];

  id v3 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [v3 removeObserver:WeakRetained];

  id v6 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
  id v5 = objc_loadWeakRetained(a1);
  [v6 removeObserver:v5 forKeyPath:CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey context:0];
}

void sub_10000A248(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) compositeDevice];
  [v2 removeObserver:*(void *)(a1 + 32) forKeyPath:CMContinuityCaptureRemoteCompositeStateKVOKey context:0];
}

void sub_10000A5B8(uint64_t a1, int a2)
{
  int DeviceClass = GestaltGetDeviceClass();
  id v5 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    unsigned int v7 = +[CCDShieldUILifeCycleManager sharedInstance];
    id v8 = [v7 activeSession];
    int v12 = 138544130;
    uint64_t v13 = v6;
    __int16 v14 = 1024;
    int v15 = a2;
    __int16 v16 = 2114;
    id v17 = v8;
    __int16 v18 = 1024;
    BOOL v19 = DeviceClass == 3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ incomingStreamRequestHandler stream:%d activeSession %{public}@ isOniPad %d", (uint8_t *)&v12, 0x22u);
  }
  if (a2)
  {
    id v9 = +[CCDShieldUILifeCycleManager sharedInstance];
    uint64_t v10 = [v9 activeSession];

    if (v10)
    {
      if (DeviceClass != 3)
      {
        BOOL v11 = +[CCDShieldUILifeCycleManager sharedInstance];
        [v11 bringShieldUIProcessToForegroundIfApplicable];
      }
    }
  }
}

void sub_10000AA24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_10000AA60(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = objc_loadWeakRetained((id *)(a1 + 48));
    int v8 = 138544130;
    id v9 = WeakRetained;
    __int16 v10 = 2114;
    uint64_t v11 = v6;
    __int16 v12 = 2114;
    id v13 = v7;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ event %{public}@ dispatched to session %{public}@ with error %@", (uint8_t *)&v8, 0x2Au);
  }
}

void sub_10000B8C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _observeValueForKeyPath:*(void *)(a1 + 32) ofObject:*(void *)(a1 + 40) change:*(void *)(a1 + 48) context:*(void *)(a1 + 64)];
    id WeakRetained = v3;
  }
}

void sub_10000C3CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000C444(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = (void *)*((void *)WeakRetained + 5);
    if (v4) {
      dispatch_block_cancel(v4);
    }
    id v5 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = objc_loadWeakRetained(v1);
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Teardown Session", (uint8_t *)&v7, 0xCu);
    }
    [v3 teardownSession];
  }
}

void sub_10000D174(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v3);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_10000D1CC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = objc_loadWeakRetained(v6);
      int v17 = 138543874;
      id v18 = v9;
      __int16 v19 = 1024;
      int v20 = a2;
      __int16 v21 = 2114;
      id v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Session state changed to %d for device %{public}@", (uint8_t *)&v17, 0x1Cu);
    }
    if (!a2)
    {
      __int16 v10 = +[CCDShieldUILifeCycleManager sharedInstance];
      uint64_t v11 = [v10 activeSession];
      if (v11)
      {
        __int16 v12 = (void *)v11;
        id v13 = +[CCDShieldUILifeCycleManager sharedInstance];
        __int16 v14 = [v13 activeSession];
        id v15 = [v14 configuration];
        id v16 = [v15 clientDeviceModel];

        if (v16 == (id)2) {
          [WeakRetained disconnectSession:1 reason:kCMContinuityCaptureSessionExitReasonStreamSessionStopped];
        }
      }
      else
      {
      }
    }
  }
}

void sub_10000D374(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138412546;
      id v19 = WeakRetained;
      __int16 v20 = 2112;
      id v21 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ RPRemoteDisplayDiscovery dedicatedDeviceChanged: %@", (uint8_t *)&v18, 0x16u);
    }

    id v6 = [v3 idsDeviceIdentifier];
    int v7 = +[CCDShieldUILifeCycleManager sharedInstance];
    id v8 = [v7 activeSession];
    id v9 = [v8 deviceIdentifier];
    id v10 = [v6 isEqual:v9];
    uint64_t v11 = +[CCDShieldUILifeCycleManager sharedInstance];
    __int16 v12 = [v11 activeSession];
    id v13 = [v12 configuration];
    [v13 setIsDedicated:v10];

    __int16 v14 = +[CMContinuityCaptureXPCServerCCD sharedInstance];
    id v15 = +[CCDShieldUILifeCycleManager sharedInstance];
    id v16 = [v15 activeSession];
    int v17 = [v16 configuration];
    [v14 updateClientsWithConfiguration:v17];
  }
}

void sub_10000D560(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      id v7 = WeakRetained;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ RPRemoteDisplayDiscovery activateWithCompletion error %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_10000DA20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v12);
  objc_destroyWeak(v13);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 144));
  _Unwind_Resume(a1);
}

void sub_10000DA84(uint64_t a1)
{
  id v2 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ Client Invalidated", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000DB3C(uint64_t a1)
{
  id v2 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ Rapport Client Interrupted", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000DBF4(uint64_t a1)
{
  id v2 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v4 = [*(id *)(a1 + 32) errorFlags];
    int v5 = 138412546;
    id v6 = WeakRetained;
    __int16 v7 = 2048;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ Client ErrorChange, newError %llu", (uint8_t *)&v5, 0x16u);
  }
}

void sub_10000DCC8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = (id *)(a1 + 32);
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (CMContinityCaptureDebugLogEnabled())
    {
      id v9 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        id v11 = objc_loadWeakRetained(v7);
        *(_DWORD *)buf = 138412802;
        id v18 = v11;
        __int16 v19 = 2112;
        id v20 = v5;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ Client Event %@ Option %@", buf, 0x20u);
      }
    }
    dispatch_assert_queue_not_V2(WeakRetained[4]);
    id v10 = WeakRetained[4];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000DE7C;
    v12[3] = &unk_100018B80;
    id v13 = v6;
    id v14 = v5;
    objc_copyWeak(&v16, v7);
    id v15 = WeakRetained;
    dispatch_async_and_wait(v10, v12);
    objc_destroyWeak(&v16);
  }
}

void sub_10000DE7C(id *a1)
{
  uint64_t v2 = RPOptionSenderModelID;
  id v3 = [a1[4] objectForKeyedSubscript:RPOptionSenderModelID];
  if (v3)
  {
  }
  else
  {
    id v4 = [a1[5] objectForKeyedSubscript:v2];

    if (!v4)
    {
      uint64_t v8 = 0;
      goto LABEL_7;
    }
  }
  id v5 = [a1[4] objectForKeyedSubscript:v2];
  uint64_t v6 = 4;
  if (!v5) {
    uint64_t v6 = 5;
  }
  __int16 v7 = [a1[v6] objectForKeyedSubscript:v2];
  uint64_t v8 = CMContinuityCaptureDeviceModelFromModelString();

LABEL_7:
  id v9 = a1[4];
  if (v9)
  {
    uint64_t v10 = RPOptionSenderIDSDeviceID;
    id v11 = [v9 objectForKeyedSubscript:RPOptionSenderIDSDeviceID];
    if (v11)
    {
      __int16 v12 = [a1[4] objectForKeyedSubscript:v10];
    }
    else
    {
      __int16 v12 = 0;
    }
  }
  else
  {
    __int16 v12 = 0;
  }
  id v13 = a1[4];
  if (v13)
  {
    uint64_t v14 = RPOptionSenderDeviceName;
    id v15 = [v13 objectForKeyedSubscript:RPOptionSenderDeviceName];
    if (v15)
    {
      id v16 = [a1[4] objectForKeyedSubscript:v14];
    }
    else
    {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }
  int v17 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    *(_DWORD *)buf = 138413058;
    id v89 = WeakRetained;
    __int16 v90 = 2114;
    v91 = v12;
    __int16 v92 = 2114;
    v93 = v16;
    __int16 v94 = 1024;
    LODWORD(v95) = v8;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ deviceIdentifier %{public}@ name %{public}@ model %d", buf, 0x26u);
  }
  id v19 = a1[5];
  if (v19)
  {
    uint64_t v20 = ContinuityCaptureRapportClientMessageTypeKey;
    __int16 v21 = [v19 objectForKeyedSubscript:ContinuityCaptureRapportClientMessageTypeKey];

    if (v21)
    {
      id v22 = [a1[5] objectForKeyedSubscript:v20];
      id v23 = [v22 integerValue];

      switch((unint64_t)v23)
      {
        case 0uLL:
          int UserPreferenceDisabled = FigContinuityCaptureGetUserPreferenceDisabled();
          if (UserPreferenceDisabled)
          {
            uint64_t v25 = kCMContinuityCaptureSessionExitReasonUserDisabled;
            [a1[6] _exitSessionIfApplicableForDeviceIdentifier:v12 exitReason:kCMContinuityCaptureSessionExitReasonUserDisabled];
            [a1[6] disconnectSession:1 reason:v25];
            if (v8 != 2) {
              goto LABEL_64;
            }
          }
          else if (v8 != 2)
          {
            goto LABEL_58;
          }
          if ([*((id *)a1[6] + 10) currentState] != 1
            || !v12
            || ([*((id *)a1[6] + 10) peerDeviceIdentifier],
                v67 = objc_claimAutoreleasedReturnValue(),
                unsigned int v68 = [v67 isEqualToString:v12],
                v67,
                !v68)
            || UserPreferenceDisabled == 1)
          {
LABEL_64:
            v48 = CMContinuityCaptureLog();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              id v77 = objc_loadWeakRetained(a1 + 7);
              *(_DWORD *)buf = 138543874;
              id v89 = v77;
              __int16 v90 = 2114;
              v91 = v12;
              __int16 v92 = 1024;
              LODWORD(v93) = UserPreferenceDisabled;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}@ Disregard launch shield UI event for %{public}@ userDisabledContinuityCapture %d", buf, 0x1Cu);
            }
            goto LABEL_79;
          }
LABEL_58:
          v69 = [*((id *)a1[6] + 10) dedicatedDevice];
          v70 = [v69 idsDeviceIdentifier];
          id v71 = [v70 isEqual:v12];

          v72 = [a1[5] objectForKeyedSubscript:ContinuityCaptureRapportClientShieldLaunchDataKey];
          v73 = v72;
          id v74 = v71;
          if (v72)
          {
            id v74 = v71;
            if ([v72 length] == (id)2) {
              id v74 = (id) (*(unsigned char *)[v73 bytes] & 1);
            }
          }
          v75 = CMContinuityCaptureLog();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            id v76 = objc_loadWeakRetained(a1 + 7);
            *(_DWORD *)buf = 138543874;
            id v89 = v76;
            __int16 v90 = 2114;
            v91 = v12;
            __int16 v92 = 1024;
            LODWORD(v93) = v74;
            _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%{public}@ Launch shield ui event for %{public}@ skipPlacementStep %d", buf, 0x1Cu);
          }
          [a1[6] launchShieldUIForDeviceIdentifier:v12 name:v16 model:v8 skipPlacementStep:v74 isDedicated:v71];

          break;
        case 1uLL:
          __int16 v26 = CMContinuityCaptureLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = objc_loadWeakRetained(a1 + 7);
            uint64_t v28 = [a1[5] objectForKeyedSubscript:ContinuityCaptureRapportClientUserDisconnectReasonKey];
            id v29 = [a1[5] objectForKeyedSubscript:ContinuityCaptureRapportClientShieldSessionIDKey];
            __int16 v30 = +[CCDShieldUILifeCycleManager sharedInstance];
            v31 = [v30 activeSession];
            *(_DWORD *)buf = 138544386;
            id v89 = v27;
            __int16 v90 = 2114;
            v91 = v12;
            __int16 v92 = 2114;
            v93 = v28;
            __int16 v94 = 2114;
            v95 = v29;
            __int16 v96 = 2114;
            v97 = v31;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ User Disconnect from Host %{public}@ reason %{public}@ shieldSessionID %{public}@ activeSession %{public}@", buf, 0x34u);
          }
          __int16 v32 = +[CCDShieldUILifeCycleManager sharedInstance];
          uint64_t v33 = [v32 activeSession];
          v34 = [v33 deviceIdentifier];
          unsigned int v35 = [v12 isEqualToString:v34];

          __int16 v36 = +[CCDShieldUILifeCycleManager sharedInstance];
          v37 = [v36 activeSession];
          __int16 v38 = [v37 sessionID];
          if (v38)
          {
            unsigned int v87 = v35;
            uint64_t v39 = ContinuityCaptureRapportClientShieldSessionIDKey;
            __int16 v40 = [a1[5] objectForKeyedSubscript:ContinuityCaptureRapportClientShieldSessionIDKey];
            if (v40)
            {
              v86 = v40;
              v85 = [a1[5] objectForKeyedSubscript:v39];
              id v41 = +[CCDShieldUILifeCycleManager sharedInstance];
              v42 = [v41 activeSession];
              v43 = [v42 sessionID];
              unsigned int v44 = [v85 containsString:v43];

              unsigned int v45 = v44;
              __int16 v40 = v86;
            }
            else
            {
              unsigned int v45 = 0;
            }

            unsigned int v35 = v87;
          }
          else
          {
            unsigned int v45 = 0;
          }

          v78 = +[CCDShieldUILifeCycleManager sharedInstance];
          v79 = [v78 activeSession];

          if (v79)
          {
            if ((v35 & v45) == 1)
            {
              id v80 = a1[6];
              v81 = [a1[5] objectForKeyedSubscript:ContinuityCaptureRapportClientUserDisconnectReasonKey];
              [v80 disconnectSession:0 reason:v81];

              [a1[6] teardownSession];
            }
          }
          else
          {
            v82 = +[CCDShieldUILifeCycleManager sharedInstance];
            [v82 forceShieldUITerminationIfApplicable];
          }
          break;
        case 3uLL:
          v46 = (void *)*((void *)a1[6] + 1);
          if (v46)
          {
            v47 = [v46 compositeDevice];

            if (v47)
            {
              v48 = [a1[5] objectForKeyedSubscript:ContinuityCaptureRapportClientEventNameKey];
              v49 = [a1[5] objectForKeyedSubscript:ContinuityCaptureRapportClientEventEntityTypeKey];
              v50 = [a1[5] objectForKeyedSubscript:ContinuityCaptureRapportClientEventDataKey];
              v51 = CMContinuityCaptureLog();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                id v52 = objc_loadWeakRetained(a1 + 7);
                *(_DWORD *)buf = 138544130;
                id v89 = v52;
                __int16 v90 = 2114;
                v91 = (const char *)v48;
                __int16 v92 = 2114;
                v93 = v49;
                __int16 v94 = 2114;
                v95 = v50;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ User Event %{public}@ entity %{public}@ data %{public}@", buf, 0x2Au);
              }
              if (v48)
              {
                if (v49)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      unsigned int v53 = [v48 containsString:kCMContinuityCaptureEventStateMismatched];
                      v54 = (id *)a1[6];
                      if (v53)
                      {
                        [v54 _resolveUserPauseState];
                        v55 = [*((id *)a1[6] + 1) compositeDevice];
                        id v56 = [objc_alloc((Class)NSError) initWithDomain:@"ContinuityCapture" code:-1012 userInfo:0];
                        [v55 connectionInterrupted:v56 forDevice:0];
                      }
                      else
                      {
                        v55 = [v54[1] compositeDevice];
                        uint64_t v83 = [v49 unsignedIntValue];
                        objc_opt_class();
                        if (objc_opt_isKindOfClass()) {
                          v84 = v50;
                        }
                        else {
                          v84 = 0;
                        }
                        [v55 postEvent:v48 entity:v83 data:v84];
                      }
                    }
                  }
                }
              }

LABEL_79:
            }
          }
          break;
        case 4uLL:
          v57 = +[CCDShieldUILifeCycleManager sharedInstance];
          v58 = [v57 activeSession];
          v59 = [v58 deviceIdentifier];
          unsigned int v60 = [v12 isEqualToString:v59];

          if (v60)
          {
            v61 = CMContinuityCaptureLog();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
            {
              id v62 = objc_loadWeakRetained(a1 + 7);
              *(_DWORD *)buf = 138543618;
              id v89 = v62;
              __int16 v90 = 2114;
              v91 = v12;
              _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip placement step from Host %{public}@", buf, 0x16u);
            }
            [a1[6] _skipPlacementStepIfApplicable];
          }
          break;
        case 5uLL:
          v63 = CMContinuityCaptureLog();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            id v64 = objc_loadWeakRetained(a1 + 7);
            *(_DWORD *)buf = 138543362;
            id v89 = v64;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%{public}@ Query camera capabilities", buf, 0xCu);
          }
          [a1[6] postCameraCapabilitiesToDeviceWithIdentifier:v12 andModel:v8];
          break;
        case 8uLL:
          v65 = CMContinuityCaptureLog();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            id v66 = objc_loadWeakRetained(a1 + 7);
            *(_DWORD *)buf = 138543874;
            id v89 = v66;
            __int16 v90 = 2080;
            v91 = "-[CMContinuityCaptureDServer setupSidebandRPClient]_block_invoke";
            __int16 v92 = 2114;
            v93 = v12;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "%{public}@ %s update system state from Host %{public}@", buf, 0x20u);
          }
          [a1[6] updateSystemStateForDeviceIdentifier:v12 andModel:v8];
          break;
        default:
          break;
      }
    }
  }
}

void sub_10000EA00(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v6 = 138543618;
    id v7 = WeakRetained;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ activate cc client, error %@", (uint8_t *)&v6, 0x16u);
  }
}

void sub_10000EDD0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 144));
  _Unwind_Resume(a1);
}

void sub_10000EE0C(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 4));
    id v4 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_loadWeakRetained(v1);
      int v8 = 138543362;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ server session interrupted", (uint8_t *)&v8, 0xCu);
    }
    int v6 = (void *)v3[1];
    if (v6)
    {
      id v7 = [v6 displaySession];
      [v3 resetCurrentSession:v7 added:0 completion:&stru_100018BC8];
    }
  }
}

void sub_10000EF1C(uint64_t a1)
{
  uint64_t v2 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v4 = 138543362;
    id v5 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ server session invalidated", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000EFD4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  int v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 4));
    uint64_t v10 = (void *)v9[5];
    if (v10)
    {
      dispatch_block_cancel(v10);
      id v11 = (void *)v9[5];
      v9[5] = 0;
    }
    __int16 v12 = [v5 destinationDevice];
    id v13 = [v12 model];
    int v14 = CMContinuityCaptureDeviceModelFromModelString();

    id v15 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = objc_loadWeakRetained(v7);
      int v17 = [v5 serviceType];
      int v18 = 138544130;
      id v19 = v16;
      __int16 v20 = 2114;
      id v21 = v5;
      __int16 v22 = 2114;
      id v23 = v17;
      __int16 v24 = 1024;
      int v25 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ session started for %{public}@ serviceType %{public}@ deviceModel %d", (uint8_t *)&v18, 0x26u);
    }
    [v9 resetCurrentSession:v5 added:1 completion:&stru_100018BE8];
    v6[2](v6, 0);
  }
}

void sub_10000F188(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 138543874;
    id v25 = WeakRetained;
    __int16 v26 = 2114;
    id v27 = v5;
    __int16 v28 = 2114;
    id v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ session ended for %{public}@ error %{public}@", buf, 0x20u);
  }
  id v9 = (id *)(a1 + 32);
  uint64_t v10 = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  id v11 = v10;
  if (v10)
  {
    dispatch_assert_queue_V2(v10[4]);
    if (!v11[5])
    {
      dispatch_queue_t v12 = v11[6];
      if (v12)
      {
        if ([v12 isEqual:v5])
        {
          id v13 = CMContinuityCaptureLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            id v14 = objc_loadWeakRetained(v9);
            *(_DWORD *)buf = 138543618;
            id v25 = v14;
            __int16 v26 = 2114;
            id v27 = v5;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ setup timeout for %{public}@", buf, 0x16u);
          }
          int v18 = _NSConcreteStackBlock;
          uint64_t v19 = 3221225472;
          __int16 v20 = sub_10000F3DC;
          id v21 = &unk_100018B58;
          objc_copyWeak(&v23, v9);
          __int16 v22 = v11;
          id v15 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v18);
          dispatch_queue_t v16 = v11[5];
          v11[5] = v15;

          dispatch_time_t v17 = dispatch_time(0, 10000000000);
          dispatch_after(v17, v11[4], v11[5]);
          objc_destroyWeak(&v23);
        }
      }
    }
    -[dispatch_queue_t resetCurrentSession:added:completion:](v11, "resetCurrentSession:added:completion:", v5, 0, &stru_100018C30, v18, v19, v20, v21);
  }
}

void sub_10000F3DC(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v4 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = objc_loadWeakRetained(v2);
      int v17 = 138543362;
      id v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@  Teardown timeout", (uint8_t *)&v17, 0xCu);
    }
    id v6 = +[CCDShieldUILifeCycleManager sharedInstance];
    uint64_t v7 = [v6 activeSession];
    if (v7)
    {
      int v8 = (void *)v7;
      id v9 = +[CCDShieldUILifeCycleManager sharedInstance];
      uint64_t v10 = [v9 activeSession];
      id v11 = [v10 configuration];
      id v12 = [v11 clientDeviceModel];

      if (v12 != (id)2) {
        [WeakRetained teardownShieldUI];
      }
    }
    else
    {
    }
    id v13 = WeakRetained[5];
    WeakRetained[5] = 0;

    [WeakRetained teardownSession];
    if ([WeakRetained[7] count])
    {
      id v14 = [WeakRetained[7] firstObject];
      [WeakRetained postEvent:kCMContinuityCaptureEventCaptureSessionEnded toSession:v14];
      id v15 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = objc_loadWeakRetained(v2);
        int v17 = 138543618;
        id v18 = v16;
        __int16 v19 = 2114;
        __int16 v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@  Activate pending connection %{public}@", (uint8_t *)&v17, 0x16u);
      }
      [*(id *)(*(void *)(a1 + 32) + 56) removeObjectAtIndex:0];
    }
  }
}

void sub_10000F6DC(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained) {
    goto LABEL_12;
  }
  int v4 = +[CCDShieldUILifeCycleManager sharedInstance];
  uint64_t v5 = [v4 activeSession];
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = +[CCDShieldUILifeCycleManager sharedInstance];
    int v8 = [v7 activeSession];
    id v9 = [v8 sessionID];

    if (v9)
    {
      uint64_t v10 = CMContinuityCaptureLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = objc_loadWeakRetained(v2);
        int v12 = *(unsigned __int8 *)(a1 + 40);
        int v17 = 138543874;
        id v18 = v11;
        __int16 v19 = 2080;
        __int16 v20 = "-[CMContinuityCaptureDServer lockScreenLayoutMonitor:didUpdateLayoutWithShieldFrontMost:lockscreenInLayout:]_block_invoke";
        __int16 v21 = 1024;
        int v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@ %s lockScreenLayoutMonitor did receive update on lock screen shieldFrontMost:%d", (uint8_t *)&v17, 0x1Cu);
      }
      if (*(unsigned char *)(a1 + 40)) {
        [WeakRetained resumeStreamingForEvent:2];
      }
      else {
        [WeakRetained pauseSessionForEvent:2];
      }
      goto LABEL_12;
    }
  }
  else
  {
  }
  id v13 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = objc_loadWeakRetained(v2);
    id v15 = +[CCDShieldUILifeCycleManager sharedInstance];
    id v16 = [v15 activeSession];
    int v17 = 138543618;
    id v18 = v14;
    __int16 v19 = 2112;
    __int16 v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ ignore layout monitor update for active session %@", (uint8_t *)&v17, 0x16u);
  }
LABEL_12:
}

uint64_t start()
{
  v0 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    id v18 = "200.0.1";
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "ccd start, log version:%s", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v1 = (void *)FigDispatchQueueCreateWithPriority();
  uint64_t v2 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = +[ContinuityCaptureRemoteUISystemStatus sharedInstance];
    int v17 = 138412290;
    id v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v17, 0xCu);
  }
  int v4 = CMContinuityCaptureLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting System Status attribution to com.apple.ContinuityCaptureShieldUI", (uint8_t *)&v17, 2u);
  }

  +[STDynamicActivityAttributionPublisher setCurrentAttributionKey:0 andApp:@"com.apple.ContinuityCaptureShieldUI"];
  uint64_t v5 = [[CMContinuityCaptureDServer alloc] initWithQueue:v1];
  id v6 = (void *)qword_10001D860;
  qword_10001D860 = (uint64_t)v5;

  [(id)qword_10001D860 activate];
  uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  int v8 = dispatch_queue_create("com.apple.continuitycapture.rapportlaunch", v7);

  xpc_set_event_stream_handler("com.apple.rapport.matching", v8, &stru_100018C98);
  if (qword_10001D860)
  {
    id v9 = +[CMContinuityCaptureXPCServerCCD sharedInstance];
    [v9 startListeningWithDelegate:qword_10001D860];
  }
  else
  {
    id v9 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001024C(v9);
    }
  }

  if (FigGetCFPreferenceBooleanWithDefault())
  {
    id v10 = objc_alloc((Class)CMContinuityCaptureNWServer);
    id v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.continuitycapture.localServer", v11);
    id v13 = [v10 initWithQueue:v12];
    id v14 = (void *)qword_10001D868;
    qword_10001D868 = (uint64_t)v13;

    id v15 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = (const char *)qword_10001D868;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Hosting local server %@", (uint8_t *)&v17, 0xCu);
    }
  }
  CFRunLoopRun();

  return 0;
}

void sub_10000FD14(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_dictionary)
  {
    reply = CMContinuityCaptureLog();
    if (os_log_type_enabled(reply, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      int v8 = v2;
      _os_log_impl((void *)&_mh_execute_header, reply, OS_LOG_TYPE_DEFAULT, "Received launch event from rapport %@", (uint8_t *)&v7, 0xCu);
    }
LABEL_11:

    goto LABEL_12;
  }
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    uint64_t v5 = string;
    id v6 = CMContinuityCaptureLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      int v8 = (OS_xpc_object *)v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ccd stream event %s", (uint8_t *)&v7, 0xCu);
    }
  }
  if (xpc_dictionary_get_BOOL(v2, "replyRequired"))
  {
    reply = xpc_dictionary_create_reply(v2);
    if (reply) {
      xpc_dictionary_send_reply();
    }
    goto LABEL_11;
  }
LABEL_12:
}

void sub_10000FE80(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

void sub_10000FEA0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FF0C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FF78(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Attempted to acquire SBSSecureAppAssertion for lock screen even though we already have one", v1, 2u);
}

void sub_10000FFBC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010028(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = +[CCDShieldUILifeCycleManager sharedInstance];
  id v9 = [v2 activeSession];
  sub_10000FE80((void *)&_mh_execute_header, v3, v4, "%@ [shieldSession:%{public}@] Shield Session %{public}@ aborted", v5, v6, v7, v8, 2u);
}

void sub_100010100(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  sub_10000FE80((void *)&_mh_execute_header, v2, v3, "%@ [shieldSession:%{public}@] Shield failed to launch for %{public}@", v4, v5, v6, v7, 2u);
}

void sub_1000101B0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543874;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  uint64_t v6 = "-[CMContinuityCaptureDServer _exitSessionIfApplicableForDeviceIdentifier:exitReason:]";
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@ %s called with nil identifier for reason %@", (uint8_t *)&v3, 0x20u);
}

void sub_10001024C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Couldn't create CMContinuityCaptureDServer", v1, 2u);
}

uint64_t AVCapturePrewarm()
{
  return _AVCapturePrewarm();
}

uint64_t AVGestaltGetBoolAnswer()
{
  return _AVGestaltGetBoolAnswer();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

uint64_t CMContinityCaptureDebugLogEnabled()
{
  return _CMContinityCaptureDebugLogEnabled();
}

uint64_t CMContinuityCaptureDeviceModelFromModelString()
{
  return _CMContinuityCaptureDeviceModelFromModelString();
}

uint64_t CMContinuityCaptureGetCurrentTimeString()
{
  return _CMContinuityCaptureGetCurrentTimeString();
}

uint64_t CMContinuityCaptureLog()
{
  return _CMContinuityCaptureLog();
}

uint64_t FigContinuityCaptureGetUserPreferenceDisabled()
{
  return _FigContinuityCaptureGetUserPreferenceDisabled();
}

uint64_t FigDispatchQueueCreateWithPriority()
{
  return _FigDispatchQueueCreateWithPriority();
}

uint64_t FigGetCFPreferenceBooleanWithDefault()
{
  return _FigGetCFPreferenceBooleanWithDefault();
}

uint64_t GestaltCopyAnswer()
{
  return _GestaltCopyAnswer();
}

uint64_t GestaltGetDeviceClass()
{
  return _GestaltGetDeviceClass();
}

uint64_t SBSCreateOpenApplicationService()
{
  return _SBSCreateOpenApplicationService();
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

uint64_t SBSRequestAppSwitcherAppearanceForHiddenApplication()
{
  return _SBSRequestAppSwitcherAppearanceForHiddenApplication();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
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

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t voucher_copy()
{
  return _voucher_copy();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__acquireAlwaysOnDisplayAssertion(void *a1, const char *a2, ...)
{
  return [a1 _acquireAlwaysOnDisplayAssertion];
}

id objc_msgSend__acquireAppSwitcherAssertion(void *a1, const char *a2, ...)
{
  return [a1 _acquireAppSwitcherAssertion];
}

id objc_msgSend__acquireLockScreenAssertion(void *a1, const char *a2, ...)
{
  return [a1 _acquireLockScreenAssertion];
}

id objc_msgSend__launchShieldUIProcess(void *a1, const char *a2, ...)
{
  return [a1 _launchShieldUIProcess];
}

id objc_msgSend__releaseAlwaysOnDisplayAssertion(void *a1, const char *a2, ...)
{
  return [a1 _releaseAlwaysOnDisplayAssertion];
}

id objc_msgSend__releaseAppSwitcherAssertion(void *a1, const char *a2, ...)
{
  return [a1 _releaseAppSwitcherAssertion];
}

id objc_msgSend__releaseLockScreenAssertion(void *a1, const char *a2, ...)
{
  return [a1 _releaseLockScreenAssertion];
}

id objc_msgSend__resolveUserPauseState(void *a1, const char *a2, ...)
{
  return [a1 _resolveUserPauseState];
}

id objc_msgSend__setupShieldLifecycleMonitorForCurrentSession(void *a1, const char *a2, ...)
{
  return [a1 _setupShieldLifecycleMonitorForCurrentSession];
}

id objc_msgSend__skipPlacementStepIfApplicable(void *a1, const char *a2, ...)
{
  return [a1 _skipPlacementStepIfApplicable];
}

id objc_msgSend__teardownShieldUI(void *a1, const char *a2, ...)
{
  return [a1 _teardownShieldUI];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activeCallCountOnMainQueue(void *a1, const char *a2, ...)
{
  return [a1 activeCallCountOnMainQueue];
}

id objc_msgSend_activeCallSession(void *a1, const char *a2, ...)
{
  return [a1 activeCallSession];
}

id objc_msgSend_activeSession(void *a1, const char *a2, ...)
{
  return [a1 activeSession];
}

id objc_msgSend_batteryLevel(void *a1, const char *a2, ...)
{
  return [a1 batteryLevel];
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return [a1 batteryState];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bringShieldUIProcessToForegroundIfApplicable(void *a1, const char *a2, ...)
{
  return [a1 bringShieldUIProcessToForegroundIfApplicable];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callState(void *a1, const char *a2, ...)
{
  return [a1 callState];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_capabilitiesForCurrentDevice(void *a1, const char *a2, ...)
{
  return [a1 capabilitiesForCurrentDevice];
}

id objc_msgSend_clearPongHistory(void *a1, const char *a2, ...)
{
  return [a1 clearPongHistory];
}

id objc_msgSend_clientDeviceModel(void *a1, const char *a2, ...)
{
  return [a1 clientDeviceModel];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_compositeDevice(void *a1, const char *a2, ...)
{
  return [a1 compositeDevice];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_controlFlags(void *a1, const char *a2, ...)
{
  return [a1 controlFlags];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentSessionID(void *a1, const char *a2, ...)
{
  return [a1 currentSessionID];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_dedicatedDevice(void *a1, const char *a2, ...)
{
  return [a1 dedicatedDevice];
}

id objc_msgSend_destinationDevice(void *a1, const char *a2, ...)
{
  return [a1 destinationDevice];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_displaySession(void *a1, const char *a2, ...)
{
  return [a1 displaySession];
}

id objc_msgSend_errorFlags(void *a1, const char *a2, ...)
{
  return [a1 errorFlags];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_forceShieldUITerminationIfApplicable(void *a1, const char *a2, ...)
{
  return [a1 forceShieldUITerminationIfApplicable];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 idsDeviceIdentifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateCurrentSession(void *a1, const char *a2, ...)
{
  return [a1 invalidateCurrentSession];
}

id objc_msgSend_isUserPauseStored(void *a1, const char *a2, ...)
{
  return [a1 isUserPauseStored];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return [a1 localDevice];
}

id objc_msgSend_lockScreenInLayout(void *a1, const char *a2, ...)
{
  return [a1 lockScreenInLayout];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_pauseStateSolver(void *a1, const char *a2, ...)
{
  return [a1 pauseStateSolver];
}

id objc_msgSend_peerDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 peerDeviceIdentifier];
}

id objc_msgSend_placementStepSkipped(void *a1, const char *a2, ...)
{
  return [a1 placementStepSkipped];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_releaseCurrentIdleSleepAssertion(void *a1, const char *a2, ...)
{
  return [a1 releaseCurrentIdleSleepAssertion];
}

id objc_msgSend_resolvePauseState(void *a1, const char *a2, ...)
{
  return [a1 resolvePauseState];
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return [a1 serviceType];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return [a1 sessionID];
}

id objc_msgSend_setupDisplayServer(void *a1, const char *a2, ...)
{
  return [a1 setupDisplayServer];
}

id objc_msgSend_setupRPRemoteDisplayDiscovery(void *a1, const char *a2, ...)
{
  return [a1 setupRPRemoteDisplayDiscovery];
}

id objc_msgSend_setupShieldLifecycleMonitorForCurrentSession(void *a1, const char *a2, ...)
{
  return [a1 setupShieldLifecycleMonitorForCurrentSession];
}

id objc_msgSend_setupSidebandRPClient(void *a1, const char *a2, ...)
{
  return [a1 setupSidebandRPClient];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shieldDidConnect(void *a1, const char *a2, ...)
{
  return [a1 shieldDidConnect];
}

id objc_msgSend_shieldDidDisconnect(void *a1, const char *a2, ...)
{
  return [a1 shieldDidDisconnect];
}

id objc_msgSend_sideButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 sideButtonPressed];
}

id objc_msgSend_sideButtonReleased(void *a1, const char *a2, ...)
{
  return [a1 sideButtonReleased];
}

id objc_msgSend_tearDownShield(void *a1, const char *a2, ...)
{
  return [a1 tearDownShield];
}

id objc_msgSend_tearDownShieldUI(void *a1, const char *a2, ...)
{
  return [a1 tearDownShieldUI];
}

id objc_msgSend_teardownSession(void *a1, const char *a2, ...)
{
  return [a1 teardownSession];
}

id objc_msgSend_teardownShieldUI(void *a1, const char *a2, ...)
{
  return [a1 teardownShieldUI];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_willTerminate(void *a1, const char *a2, ...)
{
  return [a1 willTerminate];
}