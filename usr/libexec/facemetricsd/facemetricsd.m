void sub_100004134(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000415C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_100004520(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100004540(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v3, HostTimeClock);
  [WeakRetained handleLockStatusNotificationAtTimestamp:&v3];
}

id sub_100004818(uint64_t a1)
{
  uint64_t v2 = sub_100007078();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "device unlock timer expired", buf, 2u);
  }

  [*(id *)(a1 + 32) setCameraSessionActiveReason:((*(id *)(a1 + 32)) cameraSessionActiveReason) & 0xFE];
  CMTime v3 = [*(id *)(a1 + 32) cameraSession];
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v6, HostTimeClock);
  [v3 updateUnlockSessionWithSessionStopTimestamp:&v6];

  return [*(id *)(a1 + 32) requestToStopCameraSession];
}

void sub_100004AF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100004B20(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 eventBody];
  v5 = [v4 bundleID];

  CMTime v6 = sub_100007078();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Received Biome notification for BundleId : %{public}@", buf, 0xCu);
  }

  v7 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v5];
  if (!v7)
  {
    v13 = (void *)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
    uint64_t v15 = *(void *)(a1 + 32);
    v14 = (id *)(a1 + 32);
    v16 = *(void **)(v15 + 16);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100004DA8;
    v19[3] = &unk_10000C550;
    v20 = v5;
    objc_copyWeak(v23, v14 + 1);
    id v17 = v3;
    id v18 = *v14;
    id v21 = v17;
    id v22 = v18;
    v23[1] = v13;
    [v16 bundleEligibility:v20 completion:v19];

    objc_destroyWeak(v23);
    id WeakRetained = v20;
    goto LABEL_11;
  }
  v8 = sub_100007078();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [v7 BOOLValue];
    v10 = "not ";
    if (v9) {
      v10 = (const char *)&unk_10000A1A3;
    }
    *(_DWORD *)buf = 136446466;
    v25 = v10;
    __int16 v26 = 2114;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "From cached eligibility, data collection is %{public}seligible for bundleID %{public}@", buf, 0x16u);
  }

  if ([v7 BOOLValue])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v12 = [v3 eventBody];
    [WeakRetained handleMessageAppStatusNotification:v12];

LABEL_11:
  }
}

void sub_100004D8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100004DA8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  __uint64_t v6 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW);
  if (!v5)
  {
    __uint64_t v8 = v6;
    if (a2)
    {
      if (a2 != 1)
      {
LABEL_13:
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
        [WeakRetained reportSkBundleIdEligibilityCheckLatencyWithStartTimestamp:*(void *)(a1 + 64) andStopTimestamp:v8];
        goto LABEL_14;
      }
      unsigned int v9 = sub_100007078();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        int v15 = 138543362;
        uint64_t v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Received SREligibilityStatusEligible for bundleID %{public}@", (uint8_t *)&v15, 0xCu);
      }

      v11 = objc_loadWeakRetained((id *)(a1 + 56));
      v12 = [*(id *)(a1 + 40) eventBody];
      [v11 handleMessageAppStatusNotification:v12];

      v13 = &__kCFBooleanTrue;
    }
    else
    {
      v11 = sub_100007078();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        int v15 = 138543362;
        uint64_t v16 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Received SREligibilityStatusNotEligible for bundleID %{public}@", (uint8_t *)&v15, 0xCu);
      }
      v13 = &__kCFBooleanFalse;
    }

    [*(id *)(*(void *)(a1 + 48) + 64) setObject:v13 forKeyedSubscript:*(void *)(a1 + 32)];
    goto LABEL_13;
  }
  id WeakRetained = sub_100007078();
  if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR)) {
    sub_100007998((uint64_t)v5, WeakRetained);
  }
LABEL_14:
}

id sub_1000052A0(uint64_t a1)
{
  uint64_t v2 = sub_100007078();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "app foregrounded timer expired", v5, 2u);
  }

  [*(id *)(a1 + 32) setCameraSessionActiveReason:((unint64_t)[*(id *)(a1 + 32) cameraSessionActiveReason] & 0xFFFFFFFD)];
  id v3 = [*(id *)(a1 + 32) cameraSession];
  [v3 updateMessageSessionWithSessionStopTimestamp:CFAbsoluteTimeGetCurrent()];

  return [*(id *)(a1 + 32) requestToStopCameraSession];
}

void sub_100005868(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults];
  [v1 setBool:1 forKey:@"userEnrolledInStudy"];
}

void sub_100005930(uint64_t a1)
{
  uint64_t v2 = sub_100007078();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "sensor writer is no longer monitoring", v4, 2u);
  }

  [*(id *)(a1 + 32) setCameraSessionActiveReason:0];
  [*(id *)(a1 + 32) requestToStopCameraSession];
  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setBool:0 forKey:@"userEnrolledInStudy"];
}

uint64_t start()
{
  _set_user_dir_suffix();
  id v1 = NSTemporaryDirectory();
  uint64_t v2 = objc_opt_new();
  id v3 = (void *)qword_1000112F8;
  qword_1000112F8 = v2;

  CFRunLoopRun();
  return 0;
}

void sub_10000703C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100007058(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100007078()
{
  if (qword_100011300 != -1) {
    dispatch_once(&qword_100011300, &stru_10000C5D8);
  }
  v0 = (void *)qword_100011308;

  return v0;
}

void sub_1000070CC(id a1)
{
  qword_100011308 = (uint64_t)os_log_create("com.apple.facemetricsd", "main");

  _objc_release_x1();
}

void sub_100007110()
{
  sub_100004150();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "no tracked face in metadata", v1, 2u);
}

void sub_100007150()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "no face ID to hash", v2, v3, v4, v5, v6);
}

void sub_100007184()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "unable to to convert face ID to NSUUID", v2, v3, v4, v5, v6);
}

void sub_1000071B8()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "no identity coefficients", v2, v3, v4, v5, v6);
}

void sub_1000071EC()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "no rotation found", v2, v3, v4, v5, v6);
}

void sub_100007220()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "no translation found", v2, v3, v4, v5, v6);
}

void sub_100007254()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "no smooth data found", v2, v3, v4, v5, v6);
}

void sub_100007288()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "no geometry for left eye found", v2, v3, v4, v5, v6);
}

void sub_1000072BC()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "no geometry for right eye found", v2, v3, v4, v5, v6);
}

void sub_1000072F0()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "no animation found", v2, v3, v4, v5, v6);
}

void sub_100007324()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "no left eye pitch found", v2, v3, v4, v5, v6);
}

void sub_100007358()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "no left eye yaw found", v2, v3, v4, v5, v6);
}

void sub_10000738C()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "no right eye pitch found", v2, v3, v4, v5, v6);
}

void sub_1000073C0()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "no right eye yaw found", v2, v3, v4, v5, v6);
}

void sub_1000073F4()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "no gaze found", v2, v3, v4, v5, v6);
}

void sub_100007428()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "no blendshapes found", v2, v3, v4, v5, v6);
}

void sub_10000745C()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "no emotion data", v2, v3, v4, v5, v6);
}

void sub_100007490()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "no expression dictionary", v2, v3, v4, v5, v6);
}

void sub_1000074C4()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "expression 'anger' not found", v2, v3, v4, v5, v6);
}

void sub_1000074F8()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "expression 'neutral' not found", v2, v3, v4, v5, v6);
}

void sub_10000752C()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "expression 'disgust' not found", v2, v3, v4, v5, v6);
}

void sub_100007560()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "expression 'fear' not found", v2, v3, v4, v5, v6);
}

void sub_100007594()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "expression 'joy' not found", v2, v3, v4, v5, v6);
}

void sub_1000075C8()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "expression 'sadness' not found", v2, v3, v4, v5, v6);
}

void sub_1000075FC()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "expression 'surprise' not found", v2, v3, v4, v5, v6);
}

void sub_100007630()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "no key actions dictionary", v2, v3, v4, v5, v6);
}

void sub_100007664()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "key action 'sad brow' not found", v2, v3, v4, v5, v6);
}

void sub_100007698()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "key action 'fear brow' not found", v2, v3, v4, v5, v6);
}

void sub_1000076CC()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "key action 'surprise brow' not found", v2, v3, v4, v5, v6);
}

void sub_100007700()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "key action 'angry brow' not found", v2, v3, v4, v5, v6);
}

void sub_100007734()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "key action 'sad mouth' not found", v2, v3, v4, v5, v6);
}

void sub_100007768()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "key action 'fear mouth' not found", v2, v3, v4, v5, v6);
}

void sub_10000779C()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "key action 'angry mouth' not found", v2, v3, v4, v5, v6);
}

void sub_1000077D0()
{
  sub_100004150();
  sub_100004134((void *)&_mh_execute_header, v0, v1, "key action 'disgust nose' not found", v2, v3, v4, v5, v6);
}

void sub_100007804(void *a1, NSObject *a2)
{
  int v3 = 134218240;
  uint64_t v4 = 204;
  __int16 v5 = 2048;
  id v6 = [a1 length];
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "expected %zu bytes of blendshape, but %zu bytes were received", (uint8_t *)&v3, 0x16u);
}

void sub_1000078A0()
{
  sub_100004150();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "failed to create sensor writer", v1, 2u);
}

void sub_1000078E0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "notify_register_dispatch failed with status 0x%u", (uint8_t *)v2, 8u);
}

void sub_100007958()
{
  sub_100004150();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "camera session expected to be nil on device unlock", v1, 2u);
}

void sub_100007998(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100007A10()
{
  sub_100004150();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Expected notifications only on transitions. App was potentially already foregrounded when facemetrics launched.", v1, 2u);
}

void sub_100007A50()
{
  sub_100004150();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "unable to start camera session", v1, 2u);
}

void sub_100007A90(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to write to SensorKit: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100007B08(void *a1, uint64_t a2, NSObject *a3)
{
  int v5 = 134218240;
  id v6 = [a1 length];
  __int16 v7 = 2048;
  uint64_t v8 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "writing a %zu-byte sample to SensorKit with timestamp=%llu", (uint8_t *)&v5, 0x16u);
}

void sub_100007BA4()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "failed to create an AVCaptureDevice", v2, v3, v4, v5, v6);
}

void sub_100007BD8()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "failed to create an AVCaptureDeviceInput", v2, v3, v4, v5, v6);
}

void sub_100007C0C()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "face tracking not available", v2, v3, v4, v5, v6);
}

void sub_100007C40()
{
  sub_100004150();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "no tracked faces object found in metadata objects", v1, 2u);
}

void sub_100007C80()
{
  sub_100004150();
  sub_10000703C((void *)&_mh_execute_header, v0, v1, "metrics are not publishable", v2, v3, v4, v5, v6);
}

void sub_100007CB4()
{
  sub_100004150();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "not publishing since message session and unlock session are both invalid", v1, 2u);
}

void sub_100007CF4()
{
  sub_100004150();
  sub_10000703C((void *)&_mh_execute_header, v0, v1, "clearing message session stats since current packet time is greater than message session stop time", v2, v3, v4, v5, v6);
}

void sub_100007D28()
{
  sub_100004150();
  sub_10000703C((void *)&_mh_execute_header, v0, v1, "checking for validity of message session", v2, v3, v4, v5, v6);
}

void sub_100007D5C()
{
  sub_100004150();
  sub_10000703C((void *)&_mh_execute_header, v0, v1, "clearing unlock session stats since current packet time is greater than unlock session stop time", v2, v3, v4, v5, v6);
}

void sub_100007D90()
{
  sub_100004150();
  sub_10000703C((void *)&_mh_execute_header, v0, v1, "checking for validity of unlock session", v2, v3, v4, v5, v6);
}

void sub_100007DC4()
{
  sub_100004150();
  sub_10000415C((void *)&_mh_execute_header, v0, v1, "Invalid sessionStartTime or packetTimestamp", v2, v3, v4, v5, v6);
}

void sub_100007DF8(void *a1)
{
  uint64_t v1 = [a1 objectForKeyedSubscript:@"timestamp"];
  sub_100007058((void *)&_mh_execute_header, v2, v3, "metrics do not contain a valid timestamp: %@", v4, v5, v6, v7, 2u);
}

void sub_100007E88(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "secondsFromStart is out of range (%g)", (uint8_t *)&v2, 0xCu);
}

void sub_100007F04(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "seconds from start: %f", (uint8_t *)&v2, 0xCu);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFRunLoopRun(void)
{
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return _CMClockGetHostTimeClock();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return _CMClockGetTime(retstr, clock);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return _CMTimeAdd(retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return _CMTimeCompare(time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return _CMTimeMakeFromDictionary(retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return _CMTimeMakeWithSeconds(retstr, seconds, preferredTimescale);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return _CMTimeRangeFromTimeToTime(retstr, start, end);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return _CMTimeSubtract(retstr, lhs, rhs);
}

uint64_t HAFacialMetricsGenerateHashForTimestamp()
{
  return _HAFacialMetricsGenerateHashForTimestamp();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

id objc_msgSend_absoluteTimestamp(void *a1, const char *a2, ...)
{
  return [a1 absoluteTimestamp];
}

id objc_msgSend_activeFormat(void *a1, const char *a2, ...)
{
  return [a1 activeFormat];
}

id objc_msgSend_appLaunch(void *a1, const char *a2, ...)
{
  return [a1 appLaunch];
}

id objc_msgSend_beginConfiguration(void *a1, const char *a2, ...)
{
  return [a1 beginConfiguration];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_cameraSession(void *a1, const char *a2, ...)
{
  return [a1 cameraSession];
}

id objc_msgSend_cameraSessionActiveReason(void *a1, const char *a2, ...)
{
  return [a1 cameraSessionActiveReason];
}

id objc_msgSend_commitConfiguration(void *a1, const char *a2, ...)
{
  return [a1 commitConfiguration];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceIsSupported(void *a1, const char *a2, ...)
{
  return [a1 deviceIsSupported];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_deviceUnlockTimer(void *a1, const char *a2, ...)
{
  return [a1 deviceUnlockTimer];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return [a1 eventBody];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isFaceTrackingSupported(void *a1, const char *a2, ...)
{
  return [a1 isFaceTrackingSupported];
}

id objc_msgSend_isMonitoring(void *a1, const char *a2, ...)
{
  return [a1 isMonitoring];
}

id objc_msgSend_isStarting(void *a1, const char *a2, ...)
{
  return [a1 isStarting];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_messageAppForegroundedTimer(void *a1, const char *a2, ...)
{
  return [a1 messageAppForegroundedTimer];
}

id objc_msgSend_messageAppSessionStats(void *a1, const char *a2, ...)
{
  return [a1 messageAppSessionStats];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return [a1 publisher];
}

id objc_msgSend_registerForLockStatusNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForLockStatusNotifications];
}

id objc_msgSend_registerForMessagesAppForegroundedNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForMessagesAppForegroundedNotifications];
}

id objc_msgSend_reportCameraSessionLatency(void *a1, const char *a2, ...)
{
  return [a1 reportCameraSessionLatency];
}

id objc_msgSend_requestToStopCameraSession(void *a1, const char *a2, ...)
{
  return [a1 requestToStopCameraSession];
}

id objc_msgSend_resetMessageSessionId(void *a1, const char *a2, ...)
{
  return [a1 resetMessageSessionId];
}

id objc_msgSend_resetUnlockSessionId(void *a1, const char *a2, ...)
{
  return [a1 resetUnlockSessionId];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_setupCameraSession(void *a1, const char *a2, ...)
{
  return [a1 setupCameraSession];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startCameraSession(void *a1, const char *a2, ...)
{
  return [a1 startCameraSession];
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return [a1 startRunning];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return [a1 stopRunning];
}

id objc_msgSend_supportedDepthDataFormats(void *a1, const char *a2, ...)
{
  return [a1 supportedDepthDataFormats];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unlockForConfiguration(void *a1, const char *a2, ...)
{
  return [a1 unlockForConfiguration];
}

id objc_msgSend_unlockSessionStats(void *a1, const char *a2, ...)
{
  return [a1 unlockSessionStats];
}

id objc_msgSend_updateUnlockSessionWithSessionStopTimestamp_(void *a1, const char *a2, ...)
{
  return [a1 updateUnlockSessionWithSessionStopTimestamp:];
}