void sub_10000196C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000198C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000199C(uint64_t a1)
{
}

void sub_1000019A4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000C460();
    }
  }
}

void sub_100002C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void *sub_100002C88(void *result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result[4] + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    *(unsigned char *)(v2 + 24) = 0;
  }
  else if (*(_DWORD *)(a2 + 48) == 117571592)
  {
    ++*(void *)(*(void *)(result[5] + 8) + 24);
  }
  ++*(void *)(*(void *)(result[6] + 8) + 24);
  return result;
}

intptr_t sub_100002CE0(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100003D08(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100003D48(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100003D88(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100003DC8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100003E08(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100003E48(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100003E88(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100003EC8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100003F08(uint64_t a1, int *a2)
{
  switch(*a2)
  {
    case 6:
      if ([*(id *)(a1 + 32) ktraceRecording])
      {
        [*(id *)(a1 + 32) ktraceRecording];
        ktrace_recording_destroy();
        kperf_reset();
        [*(id *)(a1 + 32) setKtraceRecording:0];
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Received trace record finished notification", buf, 2u);
      }
      id v4 = *(id *)(a1 + 40);
      if ([*(id *)(a1 + 48) compressWhenFinished])
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Compressing Performance Trace", buf, 2u);
        }
        v5 = tailspin_compress_file();
        v6 = v5;
        if (v5)
        {
          id v7 = v5;

          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Done compressing Performance Trace", buf, 2u);
          }
        }
        else
        {
          BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
          if (v20) {
            sub_10000CB38(v20, v21, v22, v23, v24, v25, v26, v27);
          }
          id v7 = v4;
        }

        id v4 = v7;
      }
      v28 = *(void **)(a1 + 32);
      v29 = +[NSURL fileURLWithPath:v4];
      [v28 _markPurgable:v29 withUrgency:1024];

      v30 = +[NSFileManager defaultManager];
      uint64_t v31 = *(void *)(a1 + 56);
      id v47 = 0;
      [v30 setAttributes:v31 ofItemAtPath:v4 error:&v47];
      id v11 = v47;

      if (v11 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000CAB0(v11);
      }
      if (![*(id *)(a1 + 48) skipNotification]) {
        goto LABEL_47;
      }
      uint64_t v32 = [*(id *)(a1 + 32) connection];
      if (v32
        && (v33 = (void *)v32,
            v34 = *(void **)(a1 + 32),
            [v34 connection],
            v35 = objc_claimAutoreleasedReturnValue(),
            LODWORD(v34) = [v34 _connectionIsEntitled:v35 toEntitlement:@"com.apple.PerformanceTrace.SkipNotification"], v35, v33, v34))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Skipping notification as requested.", buf, 2u);
        }
      }
      else
      {
        v36 = [*(id *)(a1 + 32) connection];
        int v37 = [v36 processIdentifier];

        proc_name(v37, buf, 0x20u);
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          sub_10000CA1C();
        }
LABEL_47:
        v38 = *(void **)(a1 + 32);
        v39 = +[NSURL fileURLWithPath:v4];
        [v38 _sendNotification:v39];
      }
      v40 = *(void **)(a1 + 32);
      v41 = +[NSURL fileURLWithPath:v4];
      v42 = [v40 _generateToken:v41];

      v43 = [*(id *)(a1 + 32) activeConfig];
      [v43 setTracingActiveTransaction:0];

      [*(id *)(a1 + 32) setActiveConfig:0];
      v44 = [*(id *)(a1 + 32) connection];
      v45 = [v44 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014800];

      v46 = +[NSURL fileURLWithPath:v4];
      [v45 performanceTraceDidComplete:v46 withToken:v42 withError:0];

      goto LABEL_49;
    case 8:
      v9 = [*(id *)(a1 + 32) activeConfig];

      if (v9)
      {
        v10 = [*(id *)(a1 + 32) activeConfig];
        [v10 setTracingActiveTransaction:0];

        [*(id *)(a1 + 32) setActiveConfig:0];
      }
      if ([*(id *)(a1 + 32) ktraceRecording])
      {
        [*(id *)(a1 + 32) ktraceRecording];
        ktrace_recording_destroy();
        kperf_reset();
        [*(id *)(a1 + 32) setKtraceRecording:0];
      }
      [*(id *)(a1 + 32) _graphicsSamplingTeardown];
      id v4 = +[NSString stringWithFormat:@"Received argument error from ktrace_record: %s", *((void *)a2 + 1)];
      id v11 = +[NSError error:3 description:v4];
      v12 = [*(id *)(a1 + 32) connection];
      v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000147A0];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      goto LABEL_32;
    case 9:
      v14 = [*(id *)(a1 + 32) activeConfig];

      if (v14)
      {
        v15 = [*(id *)(a1 + 32) activeConfig];
        [v15 setTracingActiveTransaction:0];

        [*(id *)(a1 + 32) setActiveConfig:0];
      }
      if ([*(id *)(a1 + 32) ktraceRecording])
      {
        [*(id *)(a1 + 32) ktraceRecording];
        ktrace_recording_destroy();
        kperf_reset();
        [*(id *)(a1 + 32) setKtraceRecording:0];
      }
      [*(id *)(a1 + 32) _graphicsSamplingTeardown];
      id v4 = +[NSString stringWithFormat:@"Received permission error from ktrace_record: %s", *((void *)a2 + 1)];
      id v11 = +[NSError error:3 description:v4];
      v16 = [*(id *)(a1 + 32) connection];
      v13 = [v16 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000147E0];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        goto LABEL_31;
      }
      goto LABEL_32;
    case 10:
      v17 = [*(id *)(a1 + 32) activeConfig];

      if (v17)
      {
        v18 = [*(id *)(a1 + 32) activeConfig];
        [v18 setTracingActiveTransaction:0];

        [*(id *)(a1 + 32) setActiveConfig:0];
      }
      if ([*(id *)(a1 + 32) ktraceRecording])
      {
        [*(id *)(a1 + 32) ktraceRecording];
        ktrace_recording_destroy();
        kperf_reset();
        [*(id *)(a1 + 32) setKtraceRecording:0];
      }
      [*(id *)(a1 + 32) _graphicsSamplingTeardown];
      id v4 = +[NSString stringWithFormat:@"Received system error from ktrace_record: %s", *((void *)a2 + 1)];
      id v11 = +[NSError error:3 description:v4];
      v19 = [*(id *)(a1 + 32) connection];
      v13 = [v19 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000147C0];

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
LABEL_31:
      }
        sub_10000C8DC(v11);
LABEL_32:
      [v13 performanceTraceDidStart:v11];

LABEL_49:
      break;
    default:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        int v8 = *a2;
        *(_DWORD *)buf = 67109120;
        int v49 = v8;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Received unhandled note from ktrace_record: %d", buf, 8u);
      }
      break;
  }
}

void sub_1000046B8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_1000046F8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100004738(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100004778(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_1000047B8(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Sucessfully started Performance Trace", v4, 2u);
  }
  uint64_t v2 = [*(id *)(a1 + 32) connection];
  v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014848];

  [v3 performanceTraceDidStart:0];
}

void sub_100004858(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100004898(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000CB74();
  }
  [*(id *)(a1 + 32) ktraceRecording];
  uint64_t v2 = ktrace_record();
  if (v2)
  {
    v3 = +[NSString stringWithFormat:@"Failed to start trace session with error: %d", v2];
    id v4 = +[NSError error:3 description:v3];

    v5 = [*(id *)(a1 + 32) activeConfig];

    if (v5)
    {
      v6 = [*(id *)(a1 + 32) activeConfig];
      [v6 setTracingActiveTransaction:0];

      [*(id *)(a1 + 32) setActiveConfig:0];
    }
    if ([*(id *)(a1 + 32) ktraceRecording])
    {
      [*(id *)(a1 + 32) ktraceRecording];
      ktrace_recording_destroy();
      kperf_reset();
      [*(id *)(a1 + 32) setKtraceRecording:0];
    }
    [*(id *)(a1 + 32) _graphicsSamplingTeardown];
    id v7 = [*(id *)(a1 + 32) connection];
    int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014890];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000C8DC(v4);
    }
    [v8 performanceTraceDidStart:v4];
  }
}

void sub_100004A10(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_10000605C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_10000609C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_1000060DC(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_10000611C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_10000615C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_10000619C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_1000061DC(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_10000621C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_10000625C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_10000629C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) ktraceSession])
  {
    [*(id *)(a1 + 32) ktraceSession];
    ktrace_session_destroy();
    kperf_reset();
    [*(id *)(a1 + 32) setKtraceSession:0];
  }
  [*(id *)(a1 + 32) _graphicsSamplingTeardown];
  uint64_t v2 = *(void **)(a1 + 32);
  v3 = +[NSURL fileURLWithPath:*(void *)(a1 + 40)];
  id v38 = 0;
  unsigned __int8 v4 = [v2 _postProcessKtraceFile:v3 withError:&v38];
  id v5 = v38;

  if ((v5 || (v4 & 1) == 0) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CC34(v5);
  }
  id v6 = *(id *)(a1 + 40);
  if ([*(id *)(a1 + 48) compressWhenFinished])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Compressing Performance Trace", buf, 2u);
    }
    id v7 = tailspin_compress_file();
    int v8 = v7;
    if (v7)
    {
      id v9 = v7;

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Done compressing Performance Trace", buf, 2u);
      }
    }
    else
    {
      BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v10) {
        sub_10000CB38(v10, v11, v12, v13, v14, v15, v16, v17);
      }
      id v9 = v6;
    }

    id v6 = v9;
  }
  v18 = *(void **)(a1 + 32);
  v19 = +[NSURL fileURLWithPath:v6];
  [v18 _markPurgable:v19 withUrgency:1024];

  BOOL v20 = +[NSFileManager defaultManager];
  uint64_t v21 = *(void *)(a1 + 56);
  id v37 = 0;
  [v20 setAttributes:v21 ofItemAtPath:v6 error:&v37];
  id v22 = v37;

  if (v22 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CAB0(v22);
  }
  if (![*(id *)(a1 + 48) skipNotification]) {
    goto LABEL_27;
  }
  uint64_t v23 = [*(id *)(a1 + 32) connection];
  if (!v23
    || (uint64_t v24 = (void *)v23,
        uint64_t v25 = *(void **)(a1 + 32),
        [v25 connection],
        uint64_t v26 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v25) = [v25 _connectionIsEntitled:v26 toEntitlement:@"com.apple.PerformanceTrace.SkipNotification"], v26, v24, !v25))
  {
    uint64_t v27 = [*(id *)(a1 + 32) connection];
    int v28 = [v27 processIdentifier];

    proc_name(v28, buf, 0x20u);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000CA1C();
    }
LABEL_27:
    v29 = *(void **)(a1 + 32);
    v30 = +[NSURL fileURLWithPath:v6];
    [v29 _sendNotification:v30];

    goto LABEL_28;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Skipping notification as requested.", buf, 2u);
  }
LABEL_28:
  uint64_t v31 = *(void **)(a1 + 32);
  uint64_t v32 = +[NSURL fileURLWithPath:v6];
  v33 = [v31 _generateToken:v32];

  [*(id *)(a1 + 32) setActiveConfig:0];
  v34 = [*(id *)(a1 + 32) connection];
  v35 = [v34 synchronousRemoteObjectProxyWithErrorHandler:&stru_1000149F8];

  v36 = +[NSURL fileURLWithPath:v6];
  [v35 performanceTraceDidComplete:v36 withToken:v33 withError:v5];
}

void sub_1000066C8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100006708(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100006748(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100006788(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) ktraceSession];
  BOOL v3 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Stopping Performance Trace due to timeout", buf, 2u);
    }
    [*(id *)(a1 + 32) ktraceSession];
    ktrace_end();
  }
  else if (v3)
  {
    *(_WORD *)unsigned __int8 v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Timeout occurred but skipping killing Performance Trace due to no current session", v4, 2u);
  }
}

void sub_100006844(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100006B00(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100006B40(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_10000767C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000076E8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100007728(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100007768(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_1000077A8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_1000077E8(uint64_t a1)
{
  ktrace_reset_existing();
  kperf_reset();
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    ktrace_session_destroy();
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
  [*(id *)(a1 + 32) _graphicsSamplingTeardown];
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = +[NSURL fileURLWithPath:*(void *)(a1 + 40)];
  id v42 = 0;
  unsigned __int8 v4 = [v2 _postProcessKtraceFile:v3 withError:&v42];
  id v5 = v42;

  if ((v5 || (v4 & 1) == 0) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CC34(v5);
  }
  id v6 = *(id *)(a1 + 40);
  id v7 = [*(id *)(a1 + 32) activeConfig];
  unsigned int v8 = [v7 compressWhenFinished];

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Compressing Performance Trace", buf, 2u);
    }
    id v9 = tailspin_compress_file();
    BOOL v10 = v9;
    if (v9)
    {
      id v11 = v9;

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Done compressing Performance Trace", buf, 2u);
      }
    }
    else
    {
      BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v12) {
        sub_10000CB38(v12, v13, v14, v15, v16, v17, v18, v19);
      }
      id v11 = v6;
    }

    id v6 = v11;
  }
  BOOL v20 = *(void **)(a1 + 32);
  uint64_t v21 = +[NSURL fileURLWithPath:v6];
  [v20 _markPurgable:v21 withUrgency:1024];

  id v22 = +[NSFileManager defaultManager];
  uint64_t v23 = *(void *)(a1 + 48);
  id v41 = 0;
  [v22 setAttributes:v23 ofItemAtPath:v6 error:&v41];
  id v24 = v41;

  if (v24 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000CAB0(v24);
  }
  uint64_t v25 = [*(id *)(a1 + 32) activeConfig];
  unsigned int v26 = [v25 skipNotification];

  if (!v26) {
    goto LABEL_27;
  }
  uint64_t v27 = [*(id *)(a1 + 32) connection];
  if (!v27
    || (int v28 = (void *)v27,
        v29 = *(void **)(a1 + 32),
        [v29 connection],
        v30 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v29) = [v29 _connectionIsEntitled:v30 toEntitlement:@"com.apple.PerformanceTrace.SkipNotification"], v30, v28, !v29))
  {
    uint64_t v31 = [*(id *)(a1 + 32) connection];
    int v32 = [v31 processIdentifier];

    proc_name(v32, buf, 0x20u);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000CA1C();
    }
LABEL_27:
    v33 = *(void **)(a1 + 32);
    v34 = +[NSURL fileURLWithPath:v6];
    [v33 _sendNotification:v34];

    goto LABEL_28;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Skipping notification as requested.", buf, 2u);
  }
LABEL_28:
  v35 = *(void **)(a1 + 32);
  v36 = +[NSURL fileURLWithPath:v6];
  id v37 = [v35 _generateToken:v36];

  [*(id *)(a1 + 32) setActiveConfig:0];
  id v38 = [*(id *)(a1 + 32) connection];
  v39 = [v38 synchronousRemoteObjectProxyWithErrorHandler:&stru_100014B60];

  v40 = +[NSURL fileURLWithPath:v6];
  [v39 performanceTraceDidComplete:v40 withToken:v37 withError:v5];
}

void sub_100007C3C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100007C7C(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100007CBC(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000C9AC();
  }
}

void sub_100007FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007FEC(uint64_t a1, void *a2)
{
}

void sub_100008EC4(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000D14C();
  }
}

void sub_1000090EC(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "XPC connection invalidated.", v3, 2u);
  }
  id v2 = [*(id *)(a1 + 32) activeConfig];

  if (v2)
  {
    [*(id *)(a1 + 32) stopPerformanceTrace];
    [*(id *)(a1 + 32) setActiveConfig:0];
  }
}

void sub_100009180(uint64_t a1)
{
  BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v2) {
    sub_10000D250(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  BOOL v10 = [*(id *)(a1 + 32) activeConfig];

  if (v10)
  {
    [*(id *)(a1 + 32) stopPerformanceTrace];
    [*(id *)(a1 + 32) setActiveConfig:0];
  }
}

int main(int argc, const char **argv, const char **envp)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Starting PerformanceTraceService.", v6, 2u);
  }
  uint64_t v3 = objc_alloc_init(PTService);
  uint64_t v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_10000934C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100009368(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10000938C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000093A8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1000093DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100009404(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

uint64_t sub_100009414(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

uint64_t traceConfigTemplateForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PTTraceConfigTraceTemplateDefault"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceTemplateFull"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceTemplateProfile"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t traceTypeForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PTTraceConfigTraceTypeContinuouslyWriteToDisk"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceTypeRingBuffer"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t traceGroupForString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PTTraceConfigTraceGroupFullTracePoints"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupProfileTracePoints"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupCallstackSamples"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupSystemCallSamples"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupVMFaultSamples"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupGPU"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"PTTraceConfigTraceGroupASP"])
  {
    uint64_t v2 = 7;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

void sub_10000AEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000AF00(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000AF10(uint64_t a1)
{
}

void sub_10000AF18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5 || !v6)
  {
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v11) {
      sub_10000D2C8(v11, v12, v13, v14, v15, v16, v17, v18);
    }
    uint64_t v19 = [*(id *)(a1 + 40) configWithTemplate:1];
    uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;
  }
  else
  {
    id v8 = [v6 copy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    BOOL v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setSource:", objc_msgSend(v7, "source"));
  }
}

void sub_10000B118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B130(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v4) {
      sub_10000D304(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Successfully reset config.", v12, 2u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void sub_10000B30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B324(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10000D340((uint64_t)v3);
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

void sub_10000B468(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "XPC connection invalidated.", v1, 2u);
  }
}

void sub_10000B4C4(id a1)
{
  BOOL v1 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
  if (v1) {
    sub_10000D250(v1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void sub_10000B548(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10000D3C0((uint64_t)a2);
  }
}

void sub_10000C460()
{
  sub_100009380();
  sub_10000934C((void *)&_mh_execute_header, &_os_log_default, v0, "Notification added with error: %{public}@", v1, v2, v3, v4, v5);
}

void sub_10000C4D0()
{
  sub_1000093F8();
  sub_1000093A8((void *)&_mh_execute_header, &_os_log_default, v0, "Unable to add BSD syscalls to kdebug filter: %{errno}d", v1, v2, v3, v4, v5);
}

void sub_10000C540()
{
  sub_1000093F8();
  sub_1000093A8((void *)&_mh_execute_header, &_os_log_default, v0, "Unable to add mach syscalls to kdebug filter: %{errno}d", v1, v2, v3, v4, v5);
}

void sub_10000C5B0()
{
  sub_1000093F8();
  sub_1000093A8((void *)&_mh_execute_header, &_os_log_default, v0, "Unable to add faults to kdebug filter: %{errno}d", v1, v2, v3, v4, v5);
}

void sub_10000C620(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000C65C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000C698(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000C6D4()
{
  sub_1000093F8();
  sub_1000093A8((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to open file to append logs: %{errno}d", v1, v2, v3, v4, v5);
}

void sub_10000C744()
{
  sub_1000093F8();
  sub_1000093A8((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to append local log content: %{errno}d", v1, v2, v3, v4, v5);
}

void sub_10000C7B4()
{
  sub_1000093F8();
  sub_1000093A8((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to mark file purgeable: %{errno}d", v1, v2, v3, v4, v5);
}

void sub_10000C824()
{
  __error();
  sub_1000093A8((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to open file to mark as purgable: %{errno}d", v1, v2, v3, v4, 0);
}

void sub_10000C8A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000C8DC(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_100009380();
  sub_10000934C((void *)&_mh_execute_header, &_os_log_default, v2, "Performance Trace Start Failed: %{public}@", v3, v4, v5, v6, v7);
}

void sub_10000C964()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Ktrace was left in a bad state by Performance Trace. Resetting.", v0, 2u);
}

void sub_10000C9AC()
{
  sub_100009380();
  sub_10000934C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to connect to the client: %{public}@", v1, v2, v3, v4, v5);
}

void sub_10000CA1C()
{
  sub_10000942C();
  uint64_t v0 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  sub_1000093C4();
  sub_1000093DC((void *)&_mh_execute_header, &_os_log_default, v1, "Client %{public}@ [%d] requested to skip notifications but is not entitled to do so.", v2, v3, v4, v5, v6);
}

void sub_10000CAB0(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_100009380();
  sub_10000934C((void *)&_mh_execute_header, &_os_log_default, v2, "Failed to set posix permissions on file: %{public}@", v3, v4, v5, v6, v7);
}

void sub_10000CB38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CB74()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Calling into ktrace_record()", v0, 2u);
}

void sub_10000CBBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CC34(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_100009380();
  sub_10000934C((void *)&_mh_execute_header, &_os_log_default, v2, "Performance Trace Failed To Stop/Complete: %{public}@", v3, v4, v5, v6, v7);
}

void sub_10000CCBC(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_100009380();
  sub_10000934C((void *)&_mh_execute_header, &_os_log_default, v2, "Performance Trace Stop Failed: %{public}@", v3, v4, v5, v6, v7);
}

void sub_10000CD44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CD80()
{
  sub_1000093F8();
  sub_1000093A8((void *)&_mh_execute_header, &_os_log_default, v0, "warning: notification returned %u\n", v1, v2, v3, v4, v5);
}

void sub_10000CDF0()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "sending notification", v0, 2u);
}

void sub_10000CE38(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_100009380();
  sub_10000934C((void *)&_mh_execute_header, &_os_log_default, v2, "Performance Trace Stop Failed: %{public}@", v3, v4, v5, v6, v7);
}

void sub_10000CEC4()
{
  sub_100009420();
  sub_100009414(v1, v2, 5.8381e-34);
  sub_100009368((void *)&_mh_execute_header, &_os_log_default, v3, "Performance Trace Failed To Stop/Complete: %{public}@", v4);
}

void sub_10000CF10()
{
  sub_100009404(__stack_chk_guard);
  sub_10000934C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to read config archive: %{public}@", v1, v2, v3, v4, 2u);
}

void sub_10000CF84()
{
  sub_100009404(__stack_chk_guard);
  sub_10000934C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to unpack config: %{public}@", v1, v2, v3, v4, 2u);
}

void sub_10000CFF8()
{
  sub_100009404(__stack_chk_guard);
  sub_10000934C((void *)&_mh_execute_header, &_os_log_default, v0, "An error occurred getting the current configuration (Switching to default): %{public}@", v1, v2, v3, v4, 2u);
}

void sub_10000D06C()
{
  sub_100009380();
  sub_10000934C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to write config archive: %{public}@", v1, v2, v3, v4, v5);
}

void sub_10000D0DC()
{
  sub_100009380();
  sub_10000934C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to archive config: %{public}@", v1, v2, v3, v4, v5);
}

void sub_10000D14C()
{
  sub_100009380();
  sub_10000934C((void *)&_mh_execute_header, &_os_log_default, v0, "Failed to connect to the client: {public}%@", v1, v2, v3, v4, v5);
}

void sub_10000D1BC()
{
  sub_10000942C();
  uint64_t v0 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  sub_1000093C4();
  sub_1000093DC((void *)&_mh_execute_header, &_os_log_default, v1, "Client %{public}@ [%d] is not entitled to use Performance Trace.", v2, v3, v4, v5, v6);
}

void sub_10000D250(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D2C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D340(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "An error occurred storing config: %{public}@", (uint8_t *)&v1, 0xCu);
}

void sub_10000D3C0(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to connect to the service protocol: %{public}@", (uint8_t *)&v1, 0xCu);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyMultiple(keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
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

int close(int a1)
{
  return _close(a1);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
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

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _ffsctl(a1, a2, a3, a4);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t kperf_action_count_set()
{
  return _kperf_action_count_set();
}

uint64_t kperf_action_samplers_set()
{
  return _kperf_action_samplers_set();
}

uint64_t kperf_kdebug_action_set()
{
  return _kperf_kdebug_action_set();
}

uint64_t kperf_kdebug_filter_add_class_subclass_fn()
{
  return _kperf_kdebug_filter_add_class_subclass_fn();
}

uint64_t kperf_kdebug_filter_create()
{
  return _kperf_kdebug_filter_create();
}

uint64_t kperf_kdebug_filter_create_desc()
{
  return _kperf_kdebug_filter_create_desc();
}

uint64_t kperf_kdebug_filter_destroy()
{
  return _kperf_kdebug_filter_destroy();
}

uint64_t kperf_kdebug_filter_set()
{
  return _kperf_kdebug_filter_set();
}

uint64_t kperf_ns_to_ticks()
{
  return _kperf_ns_to_ticks();
}

uint64_t kperf_reset()
{
  return _kperf_reset();
}

uint64_t kperf_sample_set()
{
  return _kperf_sample_set();
}

uint64_t kperf_ticks_to_ns()
{
  return _kperf_ticks_to_ns();
}

uint64_t kperf_timer_action_set()
{
  return _kperf_timer_action_set();
}

uint64_t kperf_timer_count_set()
{
  return _kperf_timer_count_set();
}

uint64_t kperf_timer_period_get()
{
  return _kperf_timer_period_get();
}

uint64_t kperf_timer_period_set()
{
  return _kperf_timer_period_set();
}

uint64_t ktrace_config_create_current()
{
  return _ktrace_config_create_current();
}

uint64_t ktrace_config_destroy()
{
  return _ktrace_config_destroy();
}

uint64_t ktrace_config_get_owner_kind()
{
  return _ktrace_config_get_owner_kind();
}

uint64_t ktrace_config_get_owner_name()
{
  return _ktrace_config_get_owner_name();
}

uint64_t ktrace_config_get_owner_pid()
{
  return _ktrace_config_get_owner_pid();
}

uint64_t ktrace_configure()
{
  return _ktrace_configure();
}

uint64_t ktrace_create_dsym_search_configuration()
{
  return _ktrace_create_dsym_search_configuration();
}

uint64_t ktrace_end()
{
  return _ktrace_end();
}

uint64_t ktrace_events_all()
{
  return _ktrace_events_all();
}

uint64_t ktrace_events_range()
{
  return _ktrace_events_range();
}

uint64_t ktrace_file_append_live_ariadne_signpost_specs()
{
  return _ktrace_file_append_live_ariadne_signpost_specs();
}

uint64_t ktrace_file_append_local_log_content()
{
  return _ktrace_file_append_local_log_content();
}

uint64_t ktrace_file_close()
{
  return _ktrace_file_close();
}

uint64_t ktrace_file_open()
{
  return _ktrace_file_open();
}

uint64_t ktrace_free_dsym_search_configuration()
{
  return _ktrace_free_dsym_search_configuration();
}

uint64_t ktrace_record()
{
  return _ktrace_record();
}

uint64_t ktrace_recording_create()
{
  return _ktrace_recording_create();
}

uint64_t ktrace_recording_destroy()
{
  return _ktrace_recording_destroy();
}

uint64_t ktrace_recording_follow_notifications()
{
  return _ktrace_recording_follow_notifications();
}

uint64_t ktrace_recording_set_streams()
{
  return _ktrace_recording_set_streams();
}

uint64_t ktrace_reset_existing()
{
  return _ktrace_reset_existing();
}

uint64_t ktrace_session_create()
{
  return _ktrace_session_create();
}

uint64_t ktrace_session_destroy()
{
  return _ktrace_session_destroy();
}

uint64_t ktrace_session_free()
{
  return _ktrace_session_free();
}

uint64_t ktrace_session_set_event_names_enabled()
{
  return _ktrace_session_set_event_names_enabled();
}

uint64_t ktrace_set_buffer_size()
{
  return _ktrace_set_buffer_size();
}

uint64_t ktrace_set_collection_interval()
{
  return _ktrace_set_collection_interval();
}

uint64_t ktrace_set_collection_qos()
{
  return _ktrace_set_collection_qos();
}

uint64_t ktrace_set_completion_handler()
{
  return _ktrace_set_completion_handler();
}

uint64_t ktrace_set_execnames_enabled()
{
  return _ktrace_set_execnames_enabled();
}

uint64_t ktrace_set_file()
{
  return _ktrace_set_file();
}

uint64_t ktrace_set_thread_groups_enabled()
{
  return _ktrace_set_thread_groups_enabled();
}

uint64_t ktrace_set_use_existing()
{
  return _ktrace_set_use_existing();
}

uint64_t ktrace_set_vnode_paths_enabled()
{
  return _ktrace_set_vnode_paths_enabled();
}

uint64_t ktrace_start()
{
  return _ktrace_start();
}

uint64_t ktrace_start_writing_path()
{
  return _ktrace_start_writing_path();
}

uint64_t ktrace_symbolicate_file()
{
  return _ktrace_symbolicate_file();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

uint64_t sandbox_extension_issue_file_to_process_by_pid()
{
  return _sandbox_extension_issue_file_to_process_by_pid();
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t sysconf(int a1)
{
  return _sysconf(a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

uint64_t tailspin_compress_file()
{
  return _tailspin_compress_file();
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

id objc_msgSend__defaultTraceRecordConfig(void *a1, const char *a2, ...)
{
  return [a1 _defaultTraceRecordConfig];
}

id objc_msgSend__getRemoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 _getRemoteObjectProxy];
}

id objc_msgSend__graphicsSamplingInit(void *a1, const char *a2, ...)
{
  return [a1 _graphicsSamplingInit];
}

id objc_msgSend__graphicsSamplingTeardown(void *a1, const char *a2, ...)
{
  return [a1 _graphicsSamplingTeardown];
}

id objc_msgSend__initConnection(void *a1, const char *a2, ...)
{
  return [a1 _initConnection];
}

id objc_msgSend__invalidateSession(void *a1, const char *a2, ...)
{
  return [a1 _invalidateSession];
}

id objc_msgSend_activeConfig(void *a1, const char *a2, ...)
{
  return [a1 activeConfig];
}

id objc_msgSend_activeTimer(void *a1, const char *a2, ...)
{
  return [a1 activeTimer];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_callstackSamplingRateMS(void *a1, const char *a2, ...)
{
  return [a1 callstackSamplingRateMS];
}

id objc_msgSend_compressWhenFinished(void *a1, const char *a2, ...)
{
  return [a1 compressWhenFinished];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_enableSwiftUITracing(void *a1, const char *a2, ...)
{
  return [a1 enableSwiftUITracing];
}

id objc_msgSend_includeKernelStacks(void *a1, const char *a2, ...)
{
  return [a1 includeKernelStacks];
}

id objc_msgSend_includeOSLogs(void *a1, const char *a2, ...)
{
  return [a1 includeOSLogs];
}

id objc_msgSend_includeOSSignposts(void *a1, const char *a2, ...)
{
  return [a1 includeOSSignposts];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAbsolutePath(void *a1, const char *a2, ...)
{
  return [a1 isAbsolutePath];
}

id objc_msgSend_kernelBufferDrainQoS(void *a1, const char *a2, ...)
{
  return [a1 kernelBufferDrainQoS];
}

id objc_msgSend_kernelBufferDrainRateMS(void *a1, const char *a2, ...)
{
  return [a1 kernelBufferDrainRateMS];
}

id objc_msgSend_kernelBufferSizeMB(void *a1, const char *a2, ...)
{
  return [a1 kernelBufferSizeMB];
}

id objc_msgSend_ktraceRecording(void *a1, const char *a2, ...)
{
  return [a1 ktraceRecording];
}

id objc_msgSend_ktraceSession(void *a1, const char *a2, ...)
{
  return [a1 ktraceSession];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_overrideIncludeOSLogs(void *a1, const char *a2, ...)
{
  return [a1 overrideIncludeOSLogs];
}

id objc_msgSend_overrideIncludeOSSignposts(void *a1, const char *a2, ...)
{
  return [a1 overrideIncludeOSSignposts];
}

id objc_msgSend_overrideSymbolicate(void *a1, const char *a2, ...)
{
  return [a1 overrideSymbolicate];
}

id objc_msgSend_ownerName(void *a1, const char *a2, ...)
{
  return [a1 ownerName];
}

id objc_msgSend_ownerPID(void *a1, const char *a2, ...)
{
  return [a1 ownerPID];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_planNameOrPath(void *a1, const char *a2, ...)
{
  return [a1 planNameOrPath];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_skipNotification(void *a1, const char *a2, ...)
{
  return [a1 skipNotification];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_stopPerformanceTrace(void *a1, const char *a2, ...)
{
  return [a1 stopPerformanceTrace];
}

id objc_msgSend_symbolicate(void *a1, const char *a2, ...)
{
  return [a1 symbolicate];
}

id objc_msgSend_traceDirectoryURL(void *a1, const char *a2, ...)
{
  return [a1 traceDirectoryURL];
}

id objc_msgSend_traceDurationSecs(void *a1, const char *a2, ...)
{
  return [a1 traceDurationSecs];
}

id objc_msgSend_traceGroups(void *a1, const char *a2, ...)
{
  return [a1 traceGroups];
}

id objc_msgSend_traceName(void *a1, const char *a2, ...)
{
  return [a1 traceName];
}

id objc_msgSend_traceTimeoutS(void *a1, const char *a2, ...)
{
  return [a1 traceTimeoutS];
}

id objc_msgSend_traceType(void *a1, const char *a2, ...)
{
  return [a1 traceType];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_useTraceRecord(void *a1, const char *a2, ...)
{
  return [a1 useTraceRecord];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}