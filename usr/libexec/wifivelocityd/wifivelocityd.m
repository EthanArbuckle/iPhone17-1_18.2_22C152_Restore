void sub_100002B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002B54(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002B64(uint64_t a1)
{
}

void sub_100002B6C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = sub_10009756C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315650;
    v23 = "-[W5DiagnosticsModeManager _startDiagnosticsModeWithConfiguration:currentPeer:reply:]_block_invoke";
    __int16 v24 = 2114;
    id v25 = v6;
    __int16 v26 = 2114;
    id v27 = v5;
    _os_log_send_and_compose_impl();
  }

  uint64_t v8 = *(void *)(a1 + 56);
  v9 = [v6 firstObject];
  (*(void (**)(uint64_t, id, void *))(v8 + 16))(v8, v5, v9);

  v10 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002D8C;
  block[3] = &unk_1000DCF98;
  id v11 = *(id *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  id v19 = v11;
  uint64_t v20 = v12;
  id v21 = v5;
  id v13 = v5;
  dispatch_async(v10, block);

  v14 = [*(id *)(a1 + 40) processors];
  [v14 removeObject:*(void *)(a1 + 48)];

  v15 = +[W5ActivityManager sharedActivityManager];
  [v15 osTransactionComplete:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = 0;
}

void sub_100002D8C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) role] != (id)8) {
    [*(id *)(a1 + 40) _finishedProcessingDiagnosticMode:*(void *)(a1 + 48)];
  }
}

void sub_10000311C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    v15 = sub_10009756C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 56);
      v17 = *(void **)(a1 + 32);
      int v37 = 136315650;
      v38 = "-[W5DiagnosticsModeManager stopDiagnosticsModeWithUUID:info:reply:]_block_invoke";
      __int16 v39 = 2112;
      uint64_t v40 = v16;
      __int16 v41 = 2114;
      id v42 = v17;
      _os_log_send_and_compose_impl();
    }

    v18 = [*(id *)(a1 + 32) UUIDString];
    id v19 = [0 uuid];
    uint64_t v20 = [v19 UUIDString];
    uint64_t v12 = +[NSString stringWithFormat:@"Diagnostic mode is running on this device, but the UUID provided (%@) doesn't match (%@).", v18, v20];

    uint64_t v21 = *(void *)(a1 + 64);
    NSErrorUserInfoKey v33 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v34 = @"W5InternalErr";
    int v22 = &v34;
    v23 = &v33;
    goto LABEL_11;
  }
  v7 = [v5 uuid];
  unsigned int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (!v8)
  {
    __int16 v24 = sub_10009756C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = *(void *)(a1 + 32);
      [v5 uuid];
      int v37 = 136315650;
      v38 = "-[W5DiagnosticsModeManager stopDiagnosticsModeWithUUID:info:reply:]_block_invoke";
      __int16 v39 = 2114;
      uint64_t v40 = v25;
      __int16 v41 = 2114;
      id v42 = (id)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }
    __int16 v26 = [*(id *)(a1 + 32) UUIDString];
    id v27 = [v5 uuid];
    v28 = [v27 UUIDString];
    uint64_t v12 = +[NSString stringWithFormat:@"Diagnostic mode is running on this device, but the UUID provided (%@) doesn't match (%@).", v26, v28];

    uint64_t v21 = *(void *)(a1 + 64);
    NSErrorUserInfoKey v35 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v36 = @"W5InternalErr";
    int v22 = &v36;
    v23 = &v35;
LABEL_11:
    v29 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v23 count:1];
    v30 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:9 userInfo:v29];
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v30);

    goto LABEL_14;
  }
  v9 = [v5 peers];
  v10 = [*(id *)(a1 + 40) localPeer];
  id v11 = [v10 peerID];
  uint64_t v12 = sub_100090E50(v9, v11);

  id v13 = objc_alloc((Class)W5DiagnosticsModePeer);
  if (v12) {
    uint64_t v14 = (uint64_t)[v12 role];
  }
  else {
    uint64_t v14 = 8;
  }
  v31 = [*(id *)(a1 + 40) localPeer];
  id v32 = [v13 initWithRole:v14 peer:v31];

  [*(id *)(a1 + 40) _stopDiagnosticsMode:v5 currentPeer:v32 info:*(void *)(a1 + 48) reply:*(void *)(a1 + 64)];
LABEL_14:
}

void sub_10000382C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000384C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = sub_10009756C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315394;
    uint64_t v21 = "-[W5DiagnosticsModeManager _stopDiagnosticsMode:currentPeer:info:reply:]_block_invoke";
    __int16 v22 = 2114;
    id v23 = v6;
    _os_log_send_and_compose_impl();
  }

  uint64_t v8 = *(void *)(a1 + 56);
  if (v6)
  {
    v9 = [v6 firstObject];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    (*(void (**)(void, void))(v8 + 16))(*(void *)(a1 + 56), 0);
  }
  v10 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003A78;
  block[3] = &unk_1000DCF98;
  id v17 = *(id *)(a1 + 32);
  id v18 = v5;
  uint64_t v19 = *(void *)(a1 + 40);
  id v11 = v5;
  dispatch_async(v10, block);

  uint64_t v12 = [*(id *)(a1 + 40) processors];
  [v12 removeObject:*(void *)(a1 + 48)];

  id v13 = +[W5ActivityManager sharedActivityManager];
  [v13 osTransactionComplete:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;
}

void sub_100003A78(id *a1)
{
  if ([a1[4] role] != (id)8
    || [a1[4] role] == (id)8 && objc_msgSend(a1[5], "state") == (id)5)
  {
    [a1[6] _finishedProcessingDiagnosticMode:a1[5]];
  }
}

void sub_100003C04(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    id v6 = [a3 diagnosticsMode];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
  }
}

uint64_t sub_100004578(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000048A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = sub_10009756C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315394;
    uint64_t v19 = "-[W5DiagnosticsModeManager _updateDiagnosticsMode:incomingMode:currentPeer:reply:]_block_invoke";
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_send_and_compose_impl();
  }

  uint64_t v8 = *(void *)(a1 + 48);
  if (v6)
  {
    v9 = [v6 firstObject];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    (*(void (**)(void, void))(v8 + 16))(*(void *)(a1 + 48), 0);
  }
  v10 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004AC0;
  block[3] = &unk_1000DD060;
  void block[4] = *(void *)(a1 + 32);
  id v17 = v5;
  id v11 = v5;
  dispatch_async(v10, block);

  uint64_t v12 = [*(id *)(a1 + 32) processors];
  [v12 removeObject:*(void *)(a1 + 40)];

  id v13 = +[W5ActivityManager sharedActivityManager];
  [v13 osTransactionComplete:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;
}

void sub_100004AC0(uint64_t a1)
{
  [*(id *)(a1 + 32) _finishedProcessingDiagnosticMode:*(void *)(a1 + 40)];
}

W5DiagnosticsActionResult *sub_100004B9C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v202 = a3;
  id v200 = a4;
  id v6 = sub_10009756C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = sub_100090B84((unint64_t)a2);
    *(_DWORD *)buf = 136316674;
    *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v271) = 398;
    WORD2(v271) = 2080;
    *(void *)((char *)&v271 + 6) = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
    HIWORD(v271) = 2048;
    id v272 = a2;
    __int16 v273 = 2112;
    uint64_t v274 = (uint64_t)v7;
    __int16 v275 = 2112;
    uint64_t v276 = (uint64_t)v200;
    LODWORD(v199) = 68;
    v198 = buf;
    _os_log_send_and_compose_impl();
  }
  v201 = objc_alloc_init(W5DiagnosticsActionResult);
  uint64_t v8 = [v202 peer];
  v9 = [v8 peerID];
  v10 = [*(id *)(a1 + 32) peerManager];
  id v11 = [v10 localIDSIdentifier];
  if (v9 == v11)
  {
    unsigned int v16 = 1;
  }
  else
  {
    uint64_t v12 = [v202 peer];
    id v13 = [v12 peerID];
    uint64_t v14 = [*(id *)(a1 + 32) peerManager];
    v15 = [v14 localIDSIdentifier];
    unsigned int v16 = [v13 isEqual:v15];
  }
  switch((unint64_t)a2)
  {
    case 0uLL:
      v51 = [v200 objectForKeyedSubscript:@"DiagnosticsMode"];
      if (!v51)
      {
        v145 = sub_10009756C();
        if (os_log_type_enabled(v145, OS_LOG_TYPE_DEFAULT))
        {
          v146 = [v202 peer];
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v271) = 407;
          WORD2(v271) = 2080;
          *(void *)((char *)&v271 + 6) = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          HIWORD(v271) = 2114;
          id v272 = v146;
          _os_log_send_and_compose_impl();
        }
        NSErrorUserInfoKey v284 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v285 = @"W5ParamErr";
        v53 = +[NSDictionary dictionaryWithObjects:&v285 forKeys:&v284 count:1];
        v147 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v53];
        [(W5DiagnosticsActionResult *)v201 setError:v147];

        goto LABEL_165;
      }
      v52 = [v202 info];
      v53 = [v52 objectForKeyedSubscript:@"PrimaryChannel"];

      if (!v53)
      {
        v158 = sub_10009756C();
        if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
        {
          v159 = [v202 peer];
          *(_DWORD *)buf = 136316162;
          *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v271) = 414;
          WORD2(v271) = 2080;
          *(void *)((char *)&v271 + 6) = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          HIWORD(v271) = 2114;
          id v272 = v159;
          _os_log_send_and_compose_impl();
        }
        NSErrorUserInfoKey v282 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v283 = @"W5ParamErr";
        v160 = +[NSDictionary dictionaryWithObjects:&v283 forKeys:&v282 count:1];
        v161 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v160];
        [(W5DiagnosticsActionResult *)v201 setError:v161];

        v53 = 0;
        goto LABEL_165;
      }
      *(void *)location = 0;
      *(void *)&location[8] = location;
      *(void *)&location[16] = 0x3032000000;
      *(void *)&long long v280 = sub_100002B54;
      *((void *)&v280 + 1) = sub_100002B64;
      id v281 = 0;
      uint64_t v241 = 0;
      v242 = &v241;
      uint64_t v243 = 0x3032000000;
      v244 = sub_100002B54;
      v245 = sub_100002B64;
      id v246 = [v51 uuid];
      uint64_t v235 = 0;
      v236 = &v235;
      uint64_t v237 = 0x3032000000;
      v238 = sub_100002B54;
      v239 = sub_100002B64;
      id v240 = 0;
      if (v16)
      {
        id v54 = objc_alloc_init((Class)NSDateFormatter);
        [v54 setDateFormat:@"yyyy-MM-dd_HH.mm.ss.SSS"];
        v55 = +[NSDate date];
        v56 = [v54 stringFromDate:v55];

        v57 = [v202 peer];
        v58 = [v57 name];
        v59 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@_ch%li_%@.pcap", v58, [v53 channel], v56);

        v60 = +[NSURL fileURLWithPath:@"/var/run/com.apple.wifivelocity"];
        uint64_t v61 = [v60 URLByAppendingPathComponent:v59];
        v62 = (void *)v236[5];
        v236[5] = v61;

        v63 = objc_alloc_init(W5WiFiSnifferRequest);
        [(W5WiFiSnifferRequest *)v63 setUuid:v242[5]];
        [(W5WiFiSnifferRequest *)v63 setChannel:v53];
        [(W5WiFiSnifferRequest *)v63 setDuration:86400.0];
        [(W5WiFiSnifferRequest *)v63 setOutputFile:v236[5]];
        [(W5WiFiSnifferRequest *)v63 setMonitorMode:1];
        [(W5WiFiSnifferRequest *)v63 setTcpDump:1];
        [(W5WiFiSnifferRequest *)v63 setNoAutoStop:1];
        [(W5WiFiSnifferRequest *)v63 setRotationInterval:900];
        v232[0] = _NSConcreteStackBlock;
        v232[1] = 3221225472;
        v232[2] = sub_100007A18;
        v232[3] = &unk_1000DD0B0;
        v234 = location;
        v64 = dispatch_semaphore_create(0);
        v233 = v64;
        [(W5WiFiSnifferRequest *)v63 setReply:v232];
        v65 = [*(id *)(a1 + 32) snifferManager];
        [v65 addRequest:v63];

        v66 = sub_10009756C();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v67 = v242[5];
          uint64_t v68 = v236[5];
          *(_DWORD *)buf = 136316930;
          *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v271) = 449;
          WORD2(v271) = 2112;
          *(void *)((char *)&v271 + 6) = v67;
          HIWORD(v271) = 2112;
          id v272 = v53;
          __int16 v273 = 2048;
          uint64_t v274 = 86400;
          __int16 v275 = 2048;
          uint64_t v276 = 900;
          __int16 v277 = 2112;
          uint64_t v278 = v68;
          LODWORD(v199) = 78;
          v198 = buf;
          _os_log_send_and_compose_impl();
        }

        [*(id *)(a1 + 32) _storeSnifferInfo:v51 peer:v202 uuid:v242[5] path:v236[5]];
        dispatch_time_t v69 = dispatch_time(0, 30000000000);
        if (dispatch_semaphore_wait(v64, v69) >= 1
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          *(void *)&buf[4] = 0x403E000000000000;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
        }

        v70 = v201;
      }
      else
      {
        v171 = [v202 peer];
        id v172 = [v171 copy];

        [v172 setControlFlags:1];
        dispatch_semaphore_t v173 = dispatch_semaphore_create(0);
        v174 = [W5PeerSnifferRequest alloc];
        uint64_t v175 = v242[5];
        v269 = v53;
        v176 = +[NSArray arrayWithObjects:&v269 count:1];
        v226[0] = _NSConcreteStackBlock;
        v226[1] = 3221225472;
        v226[2] = sub_100007A78;
        v226[3] = &unk_1000DD0D8;
        v229 = location;
        v230 = &v235;
        id v227 = v53;
        v231 = &v241;
        v177 = v173;
        v228 = v177;
        v178 = [(W5PeerSnifferRequest *)v174 initWithPeer:v172 requestType:1 duration:v175 uuid:v176 channels:&off_1000EDE58 config:v226 reply:86400.0];

        v179 = [*(id *)(a1 + 32) peerManager];
        v180 = [v179 runSnifferAtPeerWithRequest:v178];

        if (v180)
        {
          v181 = sub_10009756C();
          if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v271) = 474;
            WORD2(v271) = 2114;
            *(void *)((char *)&v271 + 6) = v202;
            HIWORD(v271) = 2114;
            id v272 = v180;
            LODWORD(v199) = 48;
            v198 = buf;
            _os_log_send_and_compose_impl();
          }

          [(W5DiagnosticsActionResult *)v201 setError:v180];
        }
        else
        {
          dispatch_time_t v191 = dispatch_time(0, 30000000000);
          if (dispatch_semaphore_wait(v177, v191) >= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134349056;
            *(void *)&buf[4] = 0x403E000000000000;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
          }
        }

        v70 = v201;
        if (v180) {
          goto LABEL_164;
        }
      }
      -[W5DiagnosticsActionResult setUuid:](v70, "setUuid:", v242[5], v198, v199);
      [(W5DiagnosticsActionResult *)v70 setError:*(void *)(*(void *)&location[8] + 40)];
      if (v242[5] && v236[5]) {
        [*(id *)(a1 + 32) _storeSnifferInfo:v51 peer:v202 uuid:nil path:nil];
      }
      [(W5DiagnosticsActionResult *)v70 setPeer:v202];
LABEL_164:
      _Block_object_dispose(&v235, 8);

      _Block_object_dispose(&v241, 8);
      _Block_object_dispose(location, 8);

LABEL_165:
      goto LABEL_166;
    case 1uLL:
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)&long long v271 = sub_100002B54;
      *((void *)&v271 + 1) = sub_100002B64;
      id v272 = 0;
      v71 = [v200 objectForKeyedSubscript:@"DiagnosticsMode"];
      v72 = [v202 info];
      v73 = [v72 objectForKey:@"UUID"];

      if (!v73)
      {
        v74 = [*(id *)(a1 + 32) localStore];
        v75 = [v74 infoMatchingDiagnosticMode:v71];

        if (!v75) {
          goto LABEL_44;
        }
        v73 = [v75 objectForKey:@"UUID"];
        v76 = sub_10009756C();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315906;
          *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&location[12] = 2080;
          *(void *)&location[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&location[22] = 1024;
          LODWORD(v280) = 500;
          WORD2(v280) = 2114;
          *(void *)((char *)&v280 + 6) = v73;
          LODWORD(v199) = 38;
          v198 = location;
          _os_log_send_and_compose_impl();
        }

        if (!v73)
        {
LABEL_44:
          v77 = sub_10009756C();
          if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
          {
            v78 = [v202 peer];
            *(_DWORD *)location = 136315906;
            *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            *(_WORD *)&location[12] = 2080;
            *(void *)&location[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&location[22] = 1024;
            LODWORD(v280) = 505;
            WORD2(v280) = 2114;
            *(void *)((char *)&v280 + 6) = v78;
            LODWORD(v199) = 38;
            v198 = location;
            _os_log_send_and_compose_impl();
          }
          v79 = sub_10009756C();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
          {
            v80 = [v71 uuid];
            *(_DWORD *)location = 136316162;
            *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            *(_WORD *)&location[12] = 2080;
            *(void *)&location[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&location[22] = 1024;
            LODWORD(v280) = 506;
            WORD2(v280) = 2080;
            *(void *)((char *)&v280 + 6) = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            HIWORD(v280) = 2112;
            id v281 = v80;
            LODWORD(v199) = 48;
            v198 = location;
            _os_log_send_and_compose_impl();
          }
          v73 = [v71 uuid];
        }
      }
      if (v16)
      {
        dispatch_semaphore_t v81 = dispatch_semaphore_create(0);
        v82 = [*(id *)(a1 + 32) snifferManager];
        v222[0] = _NSConcreteStackBlock;
        v222[1] = 3221225472;
        v222[2] = sub_100007B54;
        v222[3] = &unk_1000DD100;
        v225 = buf;
        id v83 = v73;
        id v223 = v83;
        v84 = v81;
        v224 = v84;
        [v82 cancelRequestWithUUID:v83 reply:v222];

        dispatch_time_t v85 = dispatch_time(0, 30000000000);
        if (dispatch_semaphore_wait(v84, v85) >= 1
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)location = 134349056;
          *(void *)&location[4] = 0x403E000000000000;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", location, 0xCu);
        }
        v86 = sub_10009756C();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315906;
          *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&location[12] = 2080;
          *(void *)&location[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&location[22] = 1024;
          LODWORD(v280) = 519;
          WORD2(v280) = 2112;
          *(void *)((char *)&v280 + 6) = v83;
          LODWORD(v199) = 38;
          v198 = location;
          _os_log_send_and_compose_impl();
        }
      }
      else
      {
        v135 = [v202 peer];
        id v136 = [v135 copy];

        [v136 setControlFlags:1];
        dispatch_semaphore_t v137 = dispatch_semaphore_create(0);
        v138 = [W5PeerSnifferRequest alloc];
        v219[0] = _NSConcreteStackBlock;
        v219[1] = 3221225472;
        v219[2] = sub_100007C88;
        v219[3] = &unk_1000DD128;
        v221 = buf;
        v139 = v137;
        v220 = v139;
        v140 = [(W5PeerSnifferRequest *)v138 initWithPeer:v136 requestType:2 duration:v73 uuid:0 channels:0 config:v219 reply:0.0];
        v141 = [*(id *)(a1 + 32) peerManager];
        v142 = [v141 runSnifferAtPeerWithRequest:v140];

        if (v142)
        {
          v143 = sub_10009756C();
          if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)location = 136316162;
            *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
            *(_WORD *)&location[12] = 2080;
            *(void *)&location[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&location[22] = 1024;
            LODWORD(v280) = 541;
            WORD2(v280) = 2114;
            *(void *)((char *)&v280 + 6) = v202;
            HIWORD(v280) = 2114;
            id v281 = v142;
            LODWORD(v199) = 48;
            v198 = location;
            _os_log_send_and_compose_impl();
          }

          [(W5DiagnosticsActionResult *)v201 setError:v142];
        }
        else
        {
          dispatch_time_t v182 = dispatch_time(0, 30000000000);
          if (dispatch_semaphore_wait(v139, v182) >= 1
            && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)location = 134349056;
            *(void *)&location[4] = 0x403E000000000000;
            _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", location, 0xCu);
          }
        }

        if (v142)
        {
LABEL_149:

          _Block_object_dispose(buf, 8);
          goto LABEL_166;
        }
      }
      -[W5DiagnosticsActionResult setError:](v201, "setError:", *(void *)(*(void *)&buf[8] + 40), v198, v199);
      goto LABEL_149;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
      id v17 = [v200 objectForKeyedSubscript:@"DiagnosticsMode"];
      if (v17)
      {
        if (!v16)
        {
          id v20 = [objc_alloc((Class)W5DebugConfiguration) initDiagnosticsMode:v17 wifiState:0 megaWiFiProfileState:0 noLoggingWiFiProfileState:0 eapolState:0 bluetoothState:0];
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          *(void *)&long long v271 = sub_100002B54;
          *((void *)&v271 + 1) = sub_100002B64;
          id v272 = 0;
          v38 = [v202 peer];
          if (a2 == (void *)5)
          {
            __int16 v39 = [v202 peer];
            id v40 = [v39 copy];

            [v40 setControlFlags:1];
            v38 = v40;
          }
          dispatch_semaphore_t v41 = dispatch_semaphore_create(0);
          NSErrorUserInfoKey v261 = NSLocalizedFailureReasonErrorKey;
          CFStringRef v262 = @"W5TimeoutErr";
          id v42 = +[NSDictionary dictionaryWithObjects:&v262 forKeys:&v261 count:1];
          uint64_t v43 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:3 userInfo:v42];
          v44 = *(void **)(*(void *)&buf[8] + 40);
          *(void *)(*(void *)&buf[8] + 40) = v43;

          v45 = [W5PeerDebugConfigurationRequest alloc];
          v216[0] = _NSConcreteStackBlock;
          v216[1] = 3221225472;
          v216[2] = sub_100007CE8;
          v216[3] = &unk_1000DD150;
          v218 = buf;
          v46 = v41;
          v217 = v46;
          v47 = [(W5PeerDebugConfigurationRequest *)v45 initWithPeer:v38 type:2 debugConfiguration:v20 reply:v216];
          v48 = [*(id *)(a1 + 32) peerManager];
          v49 = [v48 sendDebugConfigurationForPeerWithRequest:v47];

          if (v49)
          {
            v50 = sub_10009756C();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)location = 136316162;
              *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
              *(_WORD *)&location[12] = 2080;
              *(void *)&location[14] = "W5DiagnosticsModeManager.m";
              *(_WORD *)&location[22] = 1024;
              LODWORD(v280) = 611;
              WORD2(v280) = 2114;
              *(void *)((char *)&v280 + 6) = v202;
              HIWORD(v280) = 2114;
              id v281 = v49;
              _os_log_send_and_compose_impl();
            }

            [(W5DiagnosticsActionResult *)v201 setError:v49];
          }
          else
          {
            dispatch_time_t v144 = dispatch_time(0, 30000000000);
            if (dispatch_semaphore_wait(v46, v144) >= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)location = 134349056;
              *(void *)&location[4] = 0x403E000000000000;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", location, 0xCu);
            }
            -[W5DiagnosticsActionResult setError:](v201, "setError:", *(void *)(*(void *)&buf[8] + 40), v198, v199);
          }

          _Block_object_dispose(buf, 8);
          goto LABEL_109;
        }
        int v18 = [*(id *)(a1 + 32) store];
        [v18 updateStoreWithDiagnosticsMode:v17];

        if (([v202 role] & 4) == 0)
        {
LABEL_110:

          goto LABEL_166;
        }
        uint64_t v19 = [v202 info];
        id v20 = [v19 objectForKey:@"UUID"];

        id v21 = [v202 info];
        __int16 v22 = [v21 objectForKey:@"path"];

        if (v22 && v20)
        {
          id v23 = [*(id *)(a1 + 32) localStore];
          v265[0] = @"UUID";
          v265[1] = @"path";
          v266[0] = v20;
          v266[1] = v22;
          __int16 v24 = +[NSDictionary dictionaryWithObjects:v266 forKeys:v265 count:2];
          [v23 addToStore:v17 newInfo:v24];

LABEL_109:
          goto LABEL_110;
        }
        v154 = sub_10009756C();
        if (os_log_type_enabled(v154, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v271) = 575;
          WORD2(v271) = 2112;
          *(void *)((char *)&v271 + 6) = v202;
          _os_log_send_and_compose_impl();
        }

        NSErrorUserInfoKey v263 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v264 = @"W5ParamErr";
        v155 = +[NSDictionary dictionaryWithObjects:&v264 forKeys:&v263 count:1];
        v156 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v155];
        [(W5DiagnosticsActionResult *)v201 setError:v156];

        v157 = v201;
      }
      else
      {
        NSErrorUserInfoKey v267 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v268 = @"W5ParamErr";
        id v32 = +[NSDictionary dictionaryWithObjects:&v268 forKeys:&v267 count:1];
        NSErrorUserInfoKey v33 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v32];
        [(W5DiagnosticsActionResult *)v201 setError:v33];

        CFStringRef v34 = v201;
      }

      goto LABEL_22;
    case 6uLL:
      v87 = [v200 objectForKeyedSubscript:@"DiagnosticsMode"];
      if (!v87)
      {
        NSErrorUserInfoKey v259 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v260 = @"W5ParamErr";
        v148 = +[NSDictionary dictionaryWithObjects:&v260 forKeys:&v259 count:1];
        v149 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v148];
        [(W5DiagnosticsActionResult *)v201 setError:v149];

        goto LABEL_166;
      }
      v88 = [*(id *)(a1 + 32) netUsageManager];
      v89 = [v87 uuid];
      [v88 recordUsageToDate:v89];

      v90 = [v200 objectForKey:@"event"];
      id v91 = [v90 integerValue];

      if (v91 == (id)1)
      {
        v92 = [*(id *)(a1 + 32) netUsageManager];
        v93 = [v87 uuid];
        [v92 stopPeriodicUsageMonitor:v93];
      }
      else
      {
        if (v91) {
          goto LABEL_139;
        }
        v92 = [*(id *)(a1 + 32) netUsageManager];
        v93 = [v87 uuid];
        [v92 startPeriodicUsageMonitor:180 maxEntries:v93 uuid:10.0];
      }

LABEL_139:
      goto LABEL_166;
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
      uint64_t v25 = [v200 objectForKeyedSubscript:@"DiagnosticsMode"];
      if (v25)
      {
        __int16 v26 = [*(id *)(a1 + 32) localStore];
        id v27 = [v26 infoMatchingDiagnosticMode:v25];

        switch((unint64_t)a2)
        {
          case 7uLL:
            if (v27)
            {
              v28 = [v27 objectForKey:@"TestOutputDirectory"];
              BOOL v29 = v28 == 0;

              if (!v29)
              {
                v30 = sub_10009756C();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  v31 = [v27 objectForKey:@"TestOutputDirectory"];
                  *(_DWORD *)buf = 136315906;
                  *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
                  *(_WORD *)&buf[22] = 1024;
                  LODWORD(v271) = 721;
                  WORD2(v271) = 2114;
                  *(void *)((char *)&v271 + 6) = v31;
                  _os_log_send_and_compose_impl();
                }
                goto LABEL_99;
              }
            }
            [*(id *)(a1 + 32) _runDiagnosticsForDiagnosticMode:v25, v198, v199];
            break;
          case 8uLL:
            if (v27)
            {
              v126 = [v27 objectForKey:@"analyticsCSVsOutputPath"];
              BOOL v127 = v126 == 0;

              if (!v127)
              {
                v30 = sub_10009756C();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  v128 = [v27 objectForKey:@"analyticsCSVsOutputPath"];
                  *(_DWORD *)buf = 136315906;
                  *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
                  *(_WORD *)&buf[22] = 1024;
                  LODWORD(v271) = 728;
                  WORD2(v271) = 2114;
                  *(void *)((char *)&v271 + 6) = v128;
                  _os_log_send_and_compose_impl();
                }
                goto LABEL_99;
              }
            }
            [*(id *)(a1 + 32) _collectAnalyticsCSVsForDiagnosticMode:v25 v198 v199];
            break;
          case 9uLL:
            if (v27)
            {
              v129 = [v27 objectForKey:@"systemLogsOutputPath"];
              BOOL v130 = v129 == 0;

              if (!v130)
              {
                v30 = sub_10009756C();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                {
                  v131 = [v27 objectForKey:@"systemLogsOutputPath"];
                  *(_DWORD *)buf = 136315906;
                  *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
                  *(_WORD *)&buf[12] = 2080;
                  *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
                  *(_WORD *)&buf[22] = 1024;
                  LODWORD(v271) = 735;
                  WORD2(v271) = 2114;
                  *(void *)((char *)&v271 + 6) = v131;
                  _os_log_send_and_compose_impl();
                }
                goto LABEL_99;
              }
            }
            [*(id *)(a1 + 32) _collectSystemLogsForDiagnosticMode:v25, v198, v199];
            break;
          case 0xAuLL:
            if (!v27
              || ([v27 objectForKey:@"networkInfoOutputPath"],
                  v132 = objc_claimAutoreleasedReturnValue(),
                  BOOL v133 = v132 == 0,
                  v132,
                  v133))
            {
              [*(id *)(a1 + 32) _collectNetworkInfoForDiagnosticMode:v25 v198 v199];
            }
            else
            {
              v30 = sub_10009756C();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                v134 = [v27 objectForKey:@"networkInfoOutputPath"];
                *(_DWORD *)buf = 136315906;
                *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
                *(_WORD *)&buf[12] = 2080;
                *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
                *(_WORD *)&buf[22] = 1024;
                LODWORD(v271) = 742;
                WORD2(v271) = 2114;
                *(void *)((char *)&v271 + 6) = v134;
                _os_log_send_and_compose_impl();
              }
LABEL_99:
            }
            break;
          default:
            break;
        }
      }
      else
      {
        NSErrorUserInfoKey v248 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v249 = @"W5ParamErr";
        CFStringRef v36 = +[NSDictionary dictionaryWithObjects:&v249 forKeys:&v248 count:1];
        int v37 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v36];
        [(W5DiagnosticsActionResult *)v201 setError:v37];
      }
      goto LABEL_166;
    case 0xBuLL:
      v94 = [v200 objectForKeyedSubscript:@"DiagnosticsMode"];
      if (!v94)
      {
        v150 = sub_10009756C();
        if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v271) = 647;
          _os_log_send_and_compose_impl();
        }

        NSErrorUserInfoKey v257 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v258 = @"W5ParamErr";
        v151 = +[NSDictionary dictionaryWithObjects:&v258 forKeys:&v257 count:1];
        v152 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v151];
        [(W5DiagnosticsActionResult *)v201 setError:v152];

        goto LABEL_166;
      }
      objc_initWeak((id *)location, *(id *)(a1 + 32));
      v95 = [v200 objectForKey:@"event"];
      id v96 = [v95 integerValue];

      if (v96)
      {
        if (v96 != (id)1)
        {
LABEL_136:
          objc_destroyWeak((id *)location);

          goto LABEL_166;
        }
        v97 = [*(id *)(a1 + 32) localStore];
        WeakRetained = [v97 infoMatchingDiagnosticMode:v94];

        if (WeakRetained)
        {
          v99 = [WeakRetained objectForKey:@"tcpdumpPID"];
          v100 = v99;
          if (v99)
          {
            kill((pid_t)[v99 intValue], 9);
LABEL_135:

            goto LABEL_136;
          }
          v194 = sub_10009756C();
          if (os_log_type_enabled(v194, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v271) = 695;
            _os_log_send_and_compose_impl();
          }

          NSErrorUserInfoKey v250 = NSLocalizedFailureReasonErrorKey;
          CFStringRef v251 = @"W5InternalErr";
          v195 = +[NSDictionary dictionaryWithObjects:&v251 forKeys:&v250 count:1];
          v196 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:9 userInfo:v195];
          [(W5DiagnosticsActionResult *)v201 setError:v196];

          v197 = v201;
        }
        else
        {
          v183 = sub_10009756C();
          if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
            *(_WORD *)&buf[12] = 2080;
            *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
            *(_WORD *)&buf[22] = 1024;
            LODWORD(v271) = 685;
            _os_log_send_and_compose_impl();
          }

          NSErrorUserInfoKey v252 = NSLocalizedFailureReasonErrorKey;
          CFStringRef v253 = @"W5ParamErr";
          v184 = +[NSDictionary dictionaryWithObjects:&v253 forKeys:&v252 count:1];
          v185 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v184];
          [(W5DiagnosticsActionResult *)v201 setError:v185];

          v186 = v201;
        }
      }
      else
      {
        WeakRetained = (id *)objc_loadWeakRetained((id *)location);
        v162 = [WeakRetained[2] wifi];
        v100 = [v162 interfaceName];

        if (v100)
        {
          v163 = [v94 uuid];
          v164 = +[NSString stringWithFormat:@"DM-%@_%@_tcpdump.pcap", v163, v100];
          v165 = [@"/var/run/com.apple.wifivelocity" stringByAppendingPathComponent:v164];

          v254[0] = @"-i";
          v254[1] = v100;
          v254[2] = @"-G";
          v166 = +[NSString stringWithFormat:@"%d", 900];
          v254[3] = v166;
          v254[4] = @"-w";
          v254[5] = v165;
          v167 = +[NSArray arrayWithObjects:v254 count:6];

          v211[0] = _NSConcreteStackBlock;
          v211[1] = 3221225472;
          v211[2] = sub_100007D48;
          v211[3] = &unk_1000DD178;
          v168 = v201;
          uint64_t v169 = *(void *)(a1 + 32);
          v212 = v168;
          uint64_t v213 = v169;
          id v214 = v94;
          id v170 = v165;
          id v215 = v170;
          +[NSTask runTaskWithLaunchPath:@"/usr/sbin/tcpdump" arguments:v167 timeout:v211 startBlock:0 updateBlock:&stru_1000DD1B8 endBlock:0.0];

          goto LABEL_135;
        }
        v187 = sub_10009756C();
        if (os_log_type_enabled(v187, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&buf[22] = 1024;
          LODWORD(v271) = 659;
          _os_log_send_and_compose_impl();
        }

        NSErrorUserInfoKey v255 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v256 = @"W5NotPermittedErr";
        v188 = +[NSDictionary dictionaryWithObjects:&v256 forKeys:&v255 count:1];
        v189 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:5 userInfo:v188];
        [(W5DiagnosticsActionResult *)v201 setError:v189];

        v190 = v201;
      }
      objc_destroyWeak((id *)location);

LABEL_22:
      NSErrorUserInfoKey v35 = v201;
      goto LABEL_167;
    case 0xCuLL:
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      *(void *)&long long v271 = sub_100002B54;
      *((void *)&v271 + 1) = sub_100002B64;
      id v272 = objc_alloc_init((Class)NSMutableSet);
      v101 = sub_10009756C();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)location = 136315906;
        *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
        *(_WORD *)&location[12] = 2080;
        *(void *)&location[14] = "W5DiagnosticsModeManager.m";
        *(_WORD *)&location[22] = 1024;
        LODWORD(v280) = 753;
        WORD2(v280) = 2114;
        *(void *)((char *)&v280 + 6) = v200;
        LODWORD(v199) = 38;
        v198 = location;
        _os_log_send_and_compose_impl();
      }

      long long v209 = 0u;
      long long v210 = 0u;
      long long v207 = 0u;
      long long v208 = 0u;
      v102 = [v200 objectForKeyedSubscript:@"peers"];
      id v103 = [v102 countByEnumeratingWithState:&v207 objects:v247 count:16];
      if (!v103) {
        goto LABEL_81;
      }
      uint64_t v104 = *(void *)v208;
      break;
    default:
      goto LABEL_166;
  }
  do
  {
    for (i = 0; i != v103; i = (char *)i + 1)
    {
      if (*(void *)v208 != v104) {
        objc_enumerationMutation(v102);
      }
      v106 = *(void **)(*((void *)&v207 + 1) + 8 * i);
      v107 = [v106 peer:v198, v199];
      v108 = [v107 peerID];

      if (v108)
      {
        v109 = [v106 peer];
        v110 = [v109 peerID];
        v111 = [*(id *)(a1 + 32) peerManager];
        v112 = [v111 localIDSIdentifier];
        unsigned __int8 v113 = [v110 isEqualToString:v112];

        if (v113) {
          continue;
        }
        v114 = *(void **)(*(void *)&buf[8] + 40);
        v115 = [v106 peer];
        v116 = [v115 peerID];
        [v114 addObject:v116];
      }
      else
      {
        v115 = sub_10009756C();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)location = 136315906;
          *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
          *(_WORD *)&location[12] = 2080;
          *(void *)&location[14] = "W5DiagnosticsModeManager.m";
          *(_WORD *)&location[22] = 1024;
          LODWORD(v280) = 759;
          WORD2(v280) = 2114;
          *(void *)((char *)&v280 + 6) = v106;
          LODWORD(v199) = 38;
          v198 = location;
          _os_log_send_and_compose_impl();
        }
      }
    }
    id v103 = [v102 countByEnumeratingWithState:&v207 objects:v247 count:16];
  }
  while (v103);
LABEL_81:

  dispatch_semaphore_t v117 = dispatch_semaphore_create(0);
  id v118 = objc_alloc_init((Class)W5PeerDiscoveryConfiguration);
  [v118 setDiscoveryFlags:1];
  v119 = [W5PeerDiscoveryRequest alloc];
  v120 = +[NSUUID UUID];
  v204[0] = _NSConcreteStackBlock;
  v204[1] = 3221225472;
  v204[2] = sub_10000802C;
  v204[3] = &unk_1000DD1E0;
  v206 = buf;
  v121 = v117;
  v205 = v121;
  v122 = [(W5PeerDiscoveryRequest *)v119 initWithConfiguration:v118 uuid:v120 handler:v204];

  v123 = [*(id *)(a1 + 32) peerManager];
  v124 = [v123 startPeerDiscoveryWithRequest:v122];

  if (v124)
  {
    v125 = sub_10009756C();
    if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)location = 136315906;
      *(void *)&location[4] = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke_2";
      *(_WORD *)&location[12] = 2080;
      *(void *)&location[14] = "W5DiagnosticsModeManager.m";
      *(_WORD *)&location[22] = 1024;
      LODWORD(v280) = 778;
      WORD2(v280) = 2114;
      *(void *)((char *)&v280 + 6) = v124;
      _os_log_send_and_compose_impl();
    }

    [(W5DiagnosticsActionResult *)v201 setError:v124];
  }
  else
  {
    dispatch_time_t v153 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v121, v153) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 134349056;
      *(void *)&location[4] = 0x403E000000000000;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", location, 0xCu);
    }
  }

  _Block_object_dispose(buf, 8);
LABEL_166:
  NSErrorUserInfoKey v35 = v201;
  v192 = v201;
LABEL_167:

  return v201;
}

void sub_1000078C4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 208));
  _Unwind_Resume(a1);
}

void sub_100007A18(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100007A78(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  id v8 = a2;
  id v9 = a5;
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;
  id v19 = v8;
  id v12 = a4;

  uint64_t v13 = [v12 objectForKeyedSubscript:*(void *)(a1 + 32)];

  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v9;
  id v18 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100007B54(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v5 = sub_10009756C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100007C88(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100007CE8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100007D48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    v7 = sub_10009756C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315906;
      uint64_t v16 = "-[W5DiagnosticsModeManager _actionHandler]_block_invoke";
      __int16 v17 = 2080;
      id v18 = "W5DiagnosticsModeManager.m";
      __int16 v19 = 1024;
      int v20 = 668;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_send_and_compose_impl();
    }

    [*(id *)(a1 + 32) setError:v6];
  }
  else
  {
    id v8 = [*(id *)(a1 + 40) localStore];
    uint64_t v9 = *(void *)(a1 + 48);
    v13[0] = @"tcpdumpPID";
    uint64_t v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 processIdentifier]);
    v13[1] = @"tcpdumpOutputPath";
    v14[0] = v10;
    id v11 = +[NSURL fileURLWithPath:*(void *)(a1 + 56)];
    v14[1] = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v8 addToStore:v9 newInfo:v12];
  }
}

void sub_100007F30(id a1, NSTask *a2, NSError *a3)
{
  uint64_t v3 = a3;
  id v4 = sub_10009756C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_10000802C(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
        uint64_t v9 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) peerID];
        [v8 removeObject:v9];

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  if (![*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count]) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

intptr_t sub_100009DA4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000B3F0(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_10009756C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315906;
    long long v12 = "-[W5DiagnosticsModeManager handlePeerFaultEvent:]_block_invoke";
    __int16 v13 = 2080;
    uint64_t v14 = "W5DiagnosticsModeManager.m";
    __int16 v15 = 1024;
    int v16 = 1088;
    __int16 v17 = 2112;
    id v18 = v3;
    _os_log_send_and_compose_impl();
  }

  id v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = a1[6];
  CFStringRef v9 = @"DiagnosticMode";
  uint64_t v10 = v7;
  id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v5 _notifyPeers:v6 info:v8];
}

void sub_10000CF1C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  uint64_t v6 = sub_10009756C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315906;
    id v23 = "-[W5DiagnosticsModeManager _collectNetworkInfoForDiagnosticMode:]_block_invoke";
    __int16 v24 = 2080;
    uint64_t v25 = "W5DiagnosticsModeManager.m";
    __int16 v26 = 1024;
    int v27 = 1366;
    __int16 v28 = 2112;
    BOOL v29 = v5;
    _os_log_send_and_compose_impl();
  }

  uint64_t v7 = +[NSUUID UUID];
  id v8 = objc_alloc_init(W5LogItemRequestInternal);
  [(W5LogItemRequestInternal *)v8 setUuid:v7];
  CFStringRef v9 = +[W5LogItemRequest requestWithItemID:90 configuration:0];
  v21[0] = v9;
  uint64_t v10 = +[W5LogItemRequest requestWithItemID:4 configuration:&off_1000EDF70];
  v21[1] = v10;
  int v11 = +[W5LogItemRequest requestWithItemID:6 configuration:0];
  v21[2] = v11;
  long long v12 = +[NSArray arrayWithObjects:v21 count:3];
  [(W5LogItemRequestInternal *)v8 setItemRequests:v12];

  [(W5LogItemRequestInternal *)v8 setFilename:*(void *)(a1 + 32)];
  __int16 v13 = +[NSDate date];
  [(W5LogItemRequestInternal *)v8 setAddedAt:v13];

  uint64_t v14 = [*(id *)(a1 + 40) logManager];
  [v14 addRequest:v8];

  __int16 v15 = sub_10009756C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315906;
    id v23 = "-[W5DiagnosticsModeManager _collectNetworkInfoForDiagnosticMode:]_block_invoke";
    __int16 v24 = 2080;
    uint64_t v25 = "W5DiagnosticsModeManager.m";
    __int16 v26 = 1024;
    int v27 = 1379;
    __int16 v28 = 2112;
    BOOL v29 = v8;
    _os_log_send_and_compose_impl();
  }

  int v16 = [*(id *)(a1 + 40) localStore];
  uint64_t v17 = *(void *)(a1 + 48);
  CFStringRef v19 = @"networkInfoCollectUUID";
  int v20 = v7;
  id v18 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  [v16 addToStore:v17 newInfo:v18];
}

uint64_t sub_10000D8C8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 state];
  id v5 = (id)a1[5];
  uint64_t v6 = v4 == v5;
  if (a1[4]) {
    BOOL v7 = v4 == v5;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = [v3 peers];
    uint64_t v6 = (uint64_t)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v8);
          }
          int v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          long long v12 = (void *)a1[4];
          __int16 v13 = [v11 peer];
          uint64_t v14 = [v13 peerID];
          if ([v12 isEqualToString:v14])
          {
            unint64_t v15 = a1[6] & (unint64_t)[v11 role];

            if (v15)
            {
              uint64_t v6 = 1;
              goto LABEL_17;
            }
          }
          else
          {
          }
        }
        uint64_t v6 = (uint64_t)[v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }
LABEL_17:
  }
  return v6;
}

uint64_t sub_10000DB30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 state];
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = v4 == v5;
  if (*(void *)(a1 + 32)) {
    BOOL v7 = v4 == v5;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = [v3 peers];
    uint64_t v6 = (uint64_t)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v9 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v8);
          }
          int v11 = *(void **)(a1 + 32);
          long long v12 = [*(id *)(*((void *)&v15 + 1) + 8 * i) peer];
          __int16 v13 = [v12 peerID];
          LOBYTE(v11) = [v11 isEqualToString:v13];

          if (v11)
          {
            uint64_t v6 = 1;
            goto LABEL_16;
          }
        }
        uint64_t v6 = (uint64_t)[v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_16:
  }
  return v6;
}

id sub_10000DDA0(uint64_t a1, void *a2)
{
  id v3 = [a2 uuid];
  id v4 = [v3 UUIDString];
  id v5 = [*(id *)(a1 + 32) UUIDString];
  id v6 = [v4 isEqualToString:v5];

  return v6;
}

id sub_10000E3CC()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100103658;
  uint64_t v7 = qword_100103658;
  if (!qword_100103658)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000F770;
    v3[3] = &unk_1000DD348;
    v3[4] = &v4;
    sub_10000F770((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10000E498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000F408(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

Class sub_10000F770(uint64_t a1)
{
  v6[0] = 0;
  if (!qword_100103660)
  {
    v6[1] = _NSConcreteStackBlock;
    v6[2] = (void *)3221225472;
    v6[3] = sub_10000F95C;
    v6[4] = &unk_1000DD380;
    v6[5] = v6;
    long long v7 = off_1000DD368;
    uint64_t v8 = 0;
    qword_100103660 = _sl_dlopen();
  }
  if (!qword_100103660)
  {
    id v3 = +[NSAssertionHandler currentHandler];
    uint64_t v4 = +[NSString stringWithUTF8String:"void *WiFiAnalyticsLibrary(void)"];
    [v3 handleFailureInFunction:v4 file:@"W5DiagnosticsModeManager.m" lineNumber:31 description:@"%s" v6[0]];

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("AnalyticsProcessor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v3 = +[NSAssertionHandler currentHandler];
    id v5 = +[NSString stringWithUTF8String:"Class getAnalyticsProcessorClass(void)_block_invoke"];
    [v3 handleFailureInFunction:v5 file:@"W5DiagnosticsModeManager.m" lineNumber:33 description:@"Unable to find class %s", "AnalyticsProcessor"];

LABEL_10:
    __break(1u);
  }
  qword_100103658 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000F95C()
{
  uint64_t result = _sl_dlopen();
  qword_100103660 = result;
  return result;
}

void sub_1000102A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000102C8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000102D8(uint64_t a1)
{
}

void sub_1000102E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_10009756C();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      [v3 count];
      _os_log_send_and_compose_impl();
    }

    id v6 = [v3 copy];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v4 = *(NSObject **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else if (v5)
  {
    _os_log_send_and_compose_impl();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100010AD4(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  id v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  uint64_t v8 = sub_100010BB8;
  uint64_t v9 = &unk_1000DD3D0;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 64);
  id v12 = v3;
  uint64_t v13 = v4;
  BOOL v5 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:&v6 block:v2];
  [*(id *)(*(void *)(a1 + 32) + 40) setObject:v5 forKeyedSubscript:*(void *)(a1 + 40), v6, v7, v8, v9, v10];
}

void sub_100010BB8(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _getCurrentUsage];
  if (v2)
  {
    id v3 = +[NSDate date];
    uint64_t v4 = sub_10009756C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 136316162;
      v30 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]_block_invoke_2";
      __int16 v31 = 2080;
      id v32 = "W5NetUsageManager.m";
      __int16 v33 = 1024;
      int v34 = 158;
      __int16 v35 = 2048;
      id v36 = [v2 count];
      __int16 v37 = 2114;
      v38[0] = v3;
      _os_log_send_and_compose_impl();
    }

    id v5 = [[W5WiFiNetUsageRecord alloc] init:v3 usageData:v2];
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = [v5 date];
    uint64_t v8 = sub_100099074((uint64_t)v7);
    uint64_t v9 = +[NSString stringWithFormat:@"netusage_%@.csv", v8];
    uint64_t v10 = [v6 URLByAppendingPathComponent:v9];

    id v11 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 48)];
    id v12 = [v11 unsignedIntegerValue];

    uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 48)];
    id v14 = [v13 count];

    long long v15 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 48)];
    long long v16 = v15;
    if (v12 >= v14)
    {
      [v15 addObject:v10];
      long long v17 = v16;
    }
    else
    {
      long long v17 = [v15 objectAtIndex:v12];

      long long v18 = +[NSFileManager defaultManager];
      id v28 = 0;
      unsigned int v19 = [v18 removeItemAtURL:v17 error:&v28];
      id v20 = v28;

      __int16 v21 = sub_10009756C();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 136316418;
        v30 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]_block_invoke";
        __int16 v31 = 2080;
        id v32 = "W5NetUsageManager.m";
        __int16 v33 = 1024;
        int v34 = 168;
        __int16 v35 = 2112;
        id v36 = v17;
        __int16 v37 = 1024;
        LODWORD(v38[0]) = v19;
        WORD2(v38[0]) = 2112;
        *(void *)((char *)v38 + 6) = v20;
        _os_log_send_and_compose_impl();
      }

      int v22 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 48)];
      [v22 replaceObjectAtIndex:v12 withObject:v10];
    }
    id v23 = [v5 usageData];
    +[W5NetUsageManager writeProcNetUsage:v23 ToFile:v10];

    __int16 v24 = sub_10009756C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:*(void *)(a1 + 48)];
      id v26 = [v25 count];
      int v29 = 136315906;
      v30 = "-[W5NetUsageManager startPeriodicUsageMonitor:maxEntries:uuid:]_block_invoke";
      __int16 v31 = 2080;
      id v32 = "W5NetUsageManager.m";
      __int16 v33 = 1024;
      int v34 = 177;
      __int16 v35 = 2048;
      id v36 = v26;
      _os_log_send_and_compose_impl();
    }
    int v27 = +[NSNumber numberWithUnsignedInteger:((unint64_t)v12 + 1) % *(void *)(a1 + 56)];
    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v27 forKeyedSubscript:*(void *)(a1 + 48)];
  }
}

void sub_100011918(id *a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [a1[4] objectForKey:v14];
    [v6 doubleValue];
    double v8 = v7;
    uint64_t v9 = [a1[5] objectForKey:v14];
    [v9 doubleValue];
    double v11 = v8 - v10;

    id v12 = a1[6];
    id v13 = [objc_alloc((Class)NSNumber) initWithDouble:v11];
    [v12 setObject:v13 forKey:v14];
  }
  else
  {
    [a1[6] setObject:v5 forKey:v14];
  }
}

void sub_1000121A4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v12 = v5;
  if (!a3)
  {
    [*(id *)(a1 + 32) appendFormat:@"%@\t%@\t%@\t%@\t%@\n", @"Process Name", @"WiFi In (Bytes)", @"WiFi Out (Bytes)", @"AWDL In (Bytes)", @"AWDL Out (Bytes)"];
    id v5 = v12;
  }
  id v6 = *(void **)(a1 + 32);
  double v7 = [v5 objectForKey:@"procName"];
  double v8 = [v12 objectForKey:@"wifiInBytes"];
  uint64_t v9 = [v12 objectForKey:@"wifiOutBytes"];
  double v10 = [v12 objectForKey:@"awdlInBytes"];
  double v11 = [v12 objectForKey:@"awdlOutBytes"];
  [v6 appendFormat:@"%@\t%@\t%@\t%@\t%@\n", v7, v8, v9, v10, v11];
}

void sub_100012AC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012B00(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012B10(uint64_t a1)
{
}

void sub_100012B18(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  double v8 = v7;
  if (a3 == 1) {
    *a4 = 1;
  }
  if (v7)
  {
    id v9 = objc_alloc_init((Class)NSDateFormatter);
    [v9 setDateFormat:@"yyyy-MM-dd_HH.mm.ss.SSS"];
    double v10 = +[NSDate date];
    double v11 = [v9 stringFromDate:v10];

    id v12 = [v8 channel];
    id v13 = [v8 channelWidth];
    id v14 = [v8 band];
    if (*(unsigned char *)(a1 + 96)) {
      long long v15 = "nostop";
    }
    else {
      long long v15 = "remote";
    }
    long long v16 = +[NSString stringWithFormat:@"ch%li_%@_bw%ld_band%ld_%s.pcap", v12, v11, v13, v14, v15];
    long long v17 = +[NSURL fileURLWithPath:@"/var/run/com.apple.wifivelocity"];
    long long v18 = [v17 URLByAppendingPathComponent:v16];

    unsigned int v19 = objc_alloc_init(W5WiFiSnifferRequest);
    [(W5WiFiSnifferRequest *)v19 setUuid:*(void *)(a1 + 32)];
    [(W5WiFiSnifferRequest *)v19 setChannel:v8];
    [(W5WiFiSnifferRequest *)v19 setDuration:*(double *)(a1 + 80)];
    [(W5WiFiSnifferRequest *)v19 setOutputFile:v18];
    [(W5WiFiSnifferRequest *)v19 setMonitorMode:1];
    [(W5WiFiSnifferRequest *)v19 setTcpDump:1];
    [(W5WiFiSnifferRequest *)v19 setNoAutoStop:*(unsigned __int8 *)(a1 + 96)];
    if (*(unsigned char *)(a1 + 96)) {
      [(W5WiFiSnifferRequest *)v19 setRotationInterval:*(void *)(a1 + 88)];
    }
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_100013050;
    v40[3] = &unk_1000DD470;
    id v41 = *(id *)(a1 + 32);
    id v20 = v8;
    id v42 = v20;
    [(W5WiFiSnifferRequest *)v19 setReply:v40];
    __int16 v21 = *(void **)(a1 + 40);
    BOOL v22 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0;
    uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v23 + 40);
    [v21 setUserAutoJoinDisabled:v22 error:&obj];
    objc_storeStrong((id *)(v23 + 40), obj);
    __int16 v24 = sub_10009756C();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v25 = v16;
      id v26 = v11;
      BOOL v27 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0;
      unsigned int v28 = [*(id *)(a1 + 40) userAutoJoinDisabled];
      uint64_t v29 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      int v43 = 136316418;
      v44 = "-[W5PeerSnifferListener _runSnifferOnChannels:interface:duration:noAutoStop:rotationInternal:uuid:]_block_invoke";
      __int16 v45 = 2080;
      v46 = "W5PeerSnifferListener.m";
      __int16 v47 = 1024;
      int v48 = 148;
      __int16 v49 = 1024;
      *(_DWORD *)v50 = v27;
      double v11 = v26;
      long long v16 = v25;
      *(_WORD *)&v50[4] = 1024;
      *(_DWORD *)&v50[6] = v28;
      *(_WORD *)v51 = 2114;
      *(void *)&v51[2] = v29;
      _os_log_send_and_compose_impl();
    }

    [*(id *)(*(void *)(a1 + 48) + 16) addRequest:v19];
    v30 = sub_10009756C();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = *(void *)(a1 + 32);
      uint64_t v32 = (uint64_t)*(double *)(a1 + 80);
      int v43 = 136316674;
      v44 = "-[W5PeerSnifferListener _runSnifferOnChannels:interface:duration:noAutoStop:rotationInternal:uuid:]_block_invoke";
      __int16 v45 = 2080;
      v46 = "W5PeerSnifferListener.m";
      __int16 v47 = 1024;
      int v48 = 151;
      __int16 v49 = 2114;
      *(void *)v50 = v31;
      *(_WORD *)&v50[8] = 2114;
      *(void *)v51 = v20;
      *(_WORD *)&v51[8] = 2048;
      uint64_t v52 = v32;
      __int16 v53 = 2114;
      id v54 = v18;
      _os_log_send_and_compose_impl();
    }

    [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v18 forKey:v20];
    dispatch_time_t v33 = dispatch_time(0, 1000000000 * (uint64_t)*(double *)(a1 + 80));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001316C;
    block[3] = &unk_1000DCF98;
    int v34 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 48);
    __int16 v37 = v19;
    id v38 = v34;
    __int16 v35 = v19;
    dispatch_after(v33, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100013050(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_10001316C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) uuid];
  [v2 stopSnifferWithUUID:v3 interface:*(void *)(a1 + 48)];
}

void sub_1000133F0(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_100013CE0(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_100013DA4(id a1, RPFileTransferProgress *a2)
{
  id v2 = a2;
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_100013E68(id a1, RPFileTransferItem *a2, id a3)
{
  uint64_t v4 = a2;
  id v5 = (void (**)(id, void))a3;
  id v6 = sub_10009756C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  v5[2](v5, 0);
}

void sub_100013F58(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_100014274(id a1, RPFileTransferProgress *a2)
{
  id v2 = a2;
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_100014338(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, 0);
  id v6 = sub_10009756C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543362;
    BOOL v22 = v5;
    _os_log_send_and_compose_impl();
  }

  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  double v8 = +[NSNumber numberWithShort:420];
  [v7 setObject:v8 forKey:NSFilePosixPermissions];
  id v9 = +[NSFileManager defaultManager];
  double v10 = [v5 itemURL];
  double v11 = [v10 path];
  id v20 = 0;
  unsigned int v12 = [v9 setAttributes:v7 ofItemAtPath:v11 error:&v20];
  id v13 = v20;

  id v14 = sub_10009756C();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (!v15) {
      goto LABEL_9;
    }
    long long v16 = [v5 itemURL];
    long long v17 = [v16 path];
    int v21 = 136316162;
    BOOL v22 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]_block_invoke";
    __int16 v23 = 2080;
    __int16 v24 = "W5FileTransferManager.m";
    __int16 v25 = 1024;
    int v26 = 168;
    __int16 v27 = 1024;
    *(_DWORD *)unsigned int v28 = 420;
    *(_WORD *)&v28[4] = 2114;
    *(void *)&v28[6] = v17;
  }
  else
  {
    if (!v15) {
      goto LABEL_9;
    }
    long long v16 = [v5 itemURL];
    long long v17 = [v16 path];
    int v21 = 136316162;
    BOOL v22 = "-[W5FileTransferManager startW5FileReceiverWithPeerPublicKey:reply:]_block_invoke";
    __int16 v23 = 2080;
    __int16 v24 = "W5FileTransferManager.m";
    __int16 v25 = 1024;
    int v26 = 171;
    __int16 v27 = 2114;
    *(void *)unsigned int v28 = v13;
    *(_WORD *)&v28[8] = 2114;
    *(void *)&v28[10] = v17;
  }
  _os_log_send_and_compose_impl();

LABEL_9:
  uint64_t v18 = *(void *)(a1 + 32);
  if (v18)
  {
    unsigned int v19 = [v5 itemURL];
    (*(void (**)(uint64_t, id, void *))(v18 + 16))(v18, v13, v19);
  }
}

void sub_100014CF0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  double v8 = [v6 reply];
  if (v5)
  {

    ((void (**)(void, id, void))v8)[2](v8, v5, 0);
  }
  else
  {
    id v10 = v7;
    id v9 = +[NSArray arrayWithObjects:&v10 count:1];

    ((void (**)(void, void, void *))v8)[2](v8, 0, v9);
  }
}

void sub_100016088(id a1, BOOL a2, NSError *a3)
{
  id v3 = a3;
  uint64_t v4 = sub_10009756C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_100016538(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_1000170DC(id a1)
{
  qword_100103670 = objc_alloc_init(W5ActivityManager);

  _objc_release_x1();
}

void sub_1000173B8(uint64_t a1)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100017458;
  v5[3] = &unk_1000DD6D8;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v2 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v5 block:5.0];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;
}

void sub_100017458(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000174CC;
  block[3] = &unk_1000DD230;
  void block[4] = v1;
  dispatch_async(v2, block);
}

void sub_1000174CC(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v14 = [v1 count];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager activeTransactions %lu", buf, 0xCu);
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = v1;
  uint64_t v3 = (char *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t description = os_transaction_get_description();
          *(_DWORD *)buf = 136315138;
          id v14 = (id)description;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager activeTransaction %s", buf, 0xCu);
        }
      }
      uint64_t v4 = (char *)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void sub_100017734(void *a1)
{
  id v2 = (void *)a1[4];
  if (!v2[2])
  {
    unsigned int v3 = [v2 debugTimerEnabled];
    id v2 = (void *)a1[4];
    if (v3)
    {
      [v2 debugTimer];
      id v2 = (void *)a1[4];
    }
  }
  if (!v2[6])
  {
    uint64_t v4 = +[NSDate now];
    uint64_t v5 = a1[4];
    id v6 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v4;

    id v2 = (void *)a1[4];
  }
  id v7 = (void *)v2[1];
  if (v7 && [v7 isValid])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager osTransactionCreate, timer was running, invalidating and freeing", (uint8_t *)&v13, 2u);
    }
    [*(id *)(a1[4] + 8) invalidate];
    uint64_t v8 = a1[4];
    long long v9 = *(void **)(v8 + 8);
    *(void *)(v8 + 8) = 0;
  }
  [*(id *)(a1[4] + 24) addObject:a1[5]];
  ++*(void *)(a1[4] + 48);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = a1[6];
    id v11 = [*(id *)(a1[4] + 24) count];
    uint64_t v12 = *(void *)(a1[4] + 48);
    int v13 = 136315650;
    uint64_t v14 = v10;
    __int16 v15 = 2048;
    id v16 = v11;
    __int16 v17 = 2048;
    uint64_t v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager osTransactionCreate %s, active count is now %lu, total started is now %lu", (uint8_t *)&v13, 0x20u);
  }
}

void sub_1000179F0(void *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t description = os_transaction_get_description();
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager osTransactionComplete %s", buf, 0xCu);
  }
  if (([*(id *)(a1[5] + 24) containsObject:a1[4]] & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = os_transaction_get_description();
      id v12 = [*(id *)(a1[5] + 24) count];
      *(_DWORD *)buf = 136315394;
      uint64_t description = v11;
      __int16 v16 = 2048;
      id v17 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] W5ActivityManager osTransactionComplete %s, TRANSACTION NOT FOUND, active count is now %lu", buf, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  [*(id *)(a1[5] + 24) removeObject:a1[4]];
  ++*(void *)(a1[5] + 64);
  if (![*(id *)(a1[5] + 24) count])
  {
    id v2 = +[NSUserDefaults standardUserDefaults];
    unsigned int v3 = [v2 persistentDomainForName:@"com.apple.wifivelocity"];

    uint64_t v4 = [v3 objectForKey:@"eager-exit-timeout"];
    if (v4)
    {
      NSLog(@"%s: Found preference value in domain: %@ key: %@", "-[W5ActivityManager osTransactionComplete:]_block_invoke", @"com.apple.wifivelocity", @"eager-exit-timeout");
      int v5 = [v4 intValue];
      if (v5 < 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager empty, eager exit timer disabled via defaults write", buf, 2u);
        }
        goto LABEL_21;
      }
      double v6 = (double)v5;
    }
    else
    {
      double v6 = 300.0;
    }
    id v7 = *(void **)(a1[5] + 8);
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v8)
      {
        *(_DWORD *)buf = 134217984;
        uint64_t description = *(void *)&v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager empty, extending running eager exit timer to %f seconds", buf, 0xCu);
        id v7 = *(void **)(a1[5] + 8);
      }
      if ([v7 isValid]) {
        [*(id *)(a1[5] + 8) invalidate];
      }
      uint64_t v9 = a1[5];
      uint64_t v10 = *(void **)(v9 + 8);
      *(void *)(v9 + 8) = 0;
    }
    else if (v8)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t description = *(void *)&v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager empty, configuring eager exit timer in %f seconds", buf, 0xCu);
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017D70;
    block[3] = &unk_1000DD750;
    void block[4] = a1[5];
    *(double *)&void block[5] = v6;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
LABEL_21:
  }
}

void sub_100017D70(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100017E14;
  v6[3] = &unk_1000DD728;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = v2;
  uint64_t v3 = +[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v6);
  uint64_t v4 = *(void *)(a1 + 32);
  int v5 = *(void **)(v4 + 8);
  *(void *)(v4 + 8) = v3;
}

void sub_100017E14(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 64);
    [*(id *)(v4 + 56) timeIntervalSinceNow];
    int v9 = 134218240;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    double v12 = -v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager Completed %lu transactions within uptime of %f seconds", (uint8_t *)&v9, 0x16u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v9 = 134217984;
    uint64_t v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager Attempting Daemon Eager Exit due to inactivity timeout of %f seconds", (uint8_t *)&v9, 0xCu);
  }
  [*(id *)(a1 + 32) _executeTimerBlock];
  BOOL v8 = [*(id *)(a1 + 32) alternateExecutionBlockForCleanExit];

  if (!v8
    && (xpc_transaction_try_exit_clean() & 1) == 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] W5ActivityManager Cannot eager exit, still outstanding transactions", (uint8_t *)&v9, 2u);
  }
}

id sub_1000180C4(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 24) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_100018D04(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100018DBC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100018EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a3, 0);
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

id *sub_100018F20(id *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3) {
    uint64_t result = (id *)[result[4] appendData:];
  }
  if (a4)
  {
    id v6 = v5[5];
    return (id *)[v6 appendData:a4];
  }
  return result;
}

uint64_t sub_100018F78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, 1);
  }
  return result;
}

uint64_t sub_10001901C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1000194CC(uint64_t a1)
{
  [*(id *)(a1 + 32) closeFile];
  [*(id *)(a1 + 40) closeFile];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_1000195C4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1000197A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t result = *(void *)(a1 + 32);
    if (result) {
      return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, a3, 0);
    }
  }
  else
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

id sub_1000197D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = *(void **)(a1 + 32);
  if (v6) {
    [v6 writeData:];
  }
  id result = *(id *)(a1 + 40);
  if (result) {
    return [result writeData:a4];
  }
  return result;
}

void sub_100019854(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, int a12, uint64_t a13, __int16 a14, uint64_t a15, __int16 a16, int a17, __int16 a18, uint64_t a19)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    unsigned int v19 = sub_10009756C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
    objc_end_catch();
    JUMPOUT(0x100019824);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000199E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, 1);
  }
  return result;
}

void sub_10001A5C4(_Unwind_Exception *a1)
{
}

void sub_10001A620(uint64_t a1, uint64_t a2)
{
}

void sub_10001A630(uint64_t a1)
{
}

void sub_10001A63C(uint64_t a1)
{
  ssize_t v3 = read(*(_DWORD *)(a1 + 64), v8, 0x1000uLL);
  if (v3 >= 1)
  {
    uint64_t v4 = +[NSData dataWithBytes:v8 length:v3];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A73C;
    block[3] = &unk_1000DD890;
    long long v7 = *(_OWORD *)(a1 + 48);
    uint64_t v5 = *(NSObject **)(a1 + 32);
    void block[4] = *(void *)(a1 + 40);
    void block[5] = v4;
    dispatch_async(v5, block);
  }
}

void sub_10001A73C(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    uint64_t v3 = a1[6];
    if (v3) {
      (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, a1[4], a1[5], 0);
    }
  }
}

void sub_10001A7A4(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 48);

  dispatch_release(v2);
}

void sub_10001A7E8(uint64_t a1)
{
  ssize_t v3 = read(*(_DWORD *)(a1 + 64), v8, 0x1000uLL);
  if (v3 >= 1)
  {
    uint64_t v4 = +[NSData dataWithBytes:v8 length:v3];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A8E8;
    block[3] = &unk_1000DD890;
    long long v7 = *(_OWORD *)(a1 + 48);
    uint64_t v5 = *(NSObject **)(a1 + 32);
    void block[4] = *(void *)(a1 + 40);
    void block[5] = v4;
    dispatch_async(v5, block);
  }
}

void sub_10001A8E8(void *a1)
{
  if (!*(unsigned char *)(*(void *)(a1[7] + 8) + 24))
  {
    uint64_t v3 = a1[6];
    if (v3) {
      (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, a1[4], 0, a1[5]);
    }
  }
}

void sub_10001A950(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(a1 + 48);

  dispatch_release(v2);
}

void sub_10001A994(uint64_t a1)
{
  [+[NSNotificationCenter defaultCenter] removeObserver:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];
  uint64_t v2 = *(NSObject **)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001ACC4;
  block[3] = &unk_1000DD348;
  void block[4] = *(void *)(a1 + 96);
  dispatch_async(v2, block);
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24))
  {
    NSErrorUserInfoKey v13 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v14 = @"W5TimeoutErr";
    uint64_t v3 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 3, +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1]);
  }
  else
  {
    signed int v4 = [*(id *)(a1 + 40) terminationStatus];
    if (v4)
    {
      NSErrorUserInfoKey v11 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v12 = @"terminationStatus";
      uint64_t v3 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v4, +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1]);
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
  uint64_t v5 = *(NSObject **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001AD08;
  v9[3] = &unk_1000DD930;
  v9[4] = *(void *)(a1 + 48);
  v9[5] = v3;
  uint64_t v7 = *(void *)(a1 + 80);
  v9[6] = *(void *)(a1 + 56);
  v9[7] = v6;
  uint64_t v8 = *(void *)(a1 + 112);
  v9[8] = v7;
  v9[9] = v8;
  dispatch_async(v5, v9);
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 64));
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 72));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

void sub_10001ACA4(_Unwind_Exception *a1)
{
}

void sub_10001ACC4(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

void sub_10001AD08(uint64_t a1)
{
  uint64_t v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) lastPathComponent];
    if (*(void *)(a1 + 40)) {
      CFStringRef v5 = +[NSString stringWithFormat:@" (error=%@)", *(void *)(a1 + 40)];
    }
    else {
      CFStringRef v5 = &stru_1000E06F0;
    }
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 48) componentsJoinedByString:@" "];
    int v11 = 136316674;
    CFStringRef v12 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]_block_invoke";
    __int16 v13 = 2080;
    CFStringRef v14 = "W5TaskUtil.m";
    __int16 v15 = 1024;
    int v16 = 451;
    __int16 v17 = 2114;
    id v18 = v4;
    __int16 v19 = 2114;
    CFStringRef v20 = v5;
    __int16 v21 = 2114;
    uint64_t v22 = v6;
    __int16 v23 = 2114;
    id v24 = v7;
    LODWORD(v10) = 68;
    int v9 = &v11;
    _os_log_send_and_compose_impl();
  }
  uint64_t v8 = *(void *)(a1 + 64);
  if (v8) {
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, *(void *)(a1 + 56), *(void *)(a1 + 40));
  }
  [+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager", v9, v10) osTransactionComplete:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)];

  *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = 0;
}

void sub_10001AED0(uint64_t a1)
{
  [*(id *)(a1 + 32) launch];
  uint64_t v3 = *(NSObject **)(a1 + 64);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001B3C8;
  block[3] = &unk_1000DD958;
  uint64_t v4 = *(void *)(a1 + 32);
  void block[4] = *(void *)(a1 + 40);
  int8x16_t v11 = vextq_s8(*(int8x16_t *)(a1 + 72), *(int8x16_t *)(a1 + 72), 8uLL);
  uint64_t v5 = *(void *)(a1 + 88);
  uint64_t v12 = v4;
  uint64_t v13 = v5;
  dispatch_async(v3, block);
  double v6 = *(double *)(a1 + 112);
  if (v6 > 0.0)
  {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 1000000000.0));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001B558;
    v9[3] = &unk_1000DD980;
    uint64_t v8 = *(void *)(a1 + 104);
    v9[4] = *(void *)(a1 + 32);
    v9[5] = v8;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v9);
  }
}

void sub_10001B1D4(void *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    objc_begin_catch(a1);
    JUMPOUT(0x10001B0F4);
  }
  JUMPOUT(0x10001B204);
}

void sub_10001B20C(uint64_t a1)
{
  uint64_t v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) lastPathComponent];
    NSErrorUserInfoKey v9 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v10 = @"W5ResourceErr";
    uint64_t v5 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 7, +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1]);
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) componentsJoinedByString:@" "];
    int v11 = 136316674;
    uint64_t v12 = "+[NSTask(WiFiVelocity) runTaskWithLaunchPath:arguments:timeout:startBlock:updateBlock:endBlock:]_block_invoke";
    __int16 v13 = 2080;
    CFStringRef v14 = "W5TaskUtil.m";
    __int16 v15 = 1024;
    int v16 = 486;
    __int16 v17 = 2114;
    id v18 = v4;
    __int16 v19 = 2114;
    CFStringRef v20 = v5;
    __int16 v21 = 2114;
    uint64_t v22 = v6;
    __int16 v23 = 2114;
    id v24 = v7;
    _os_log_send_and_compose_impl();
  }
  uint64_t v8 = *(void *)(a1 + 64);
  if (v8) {
    (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, *(void *)(a1 + 48), *(void *)(a1 + 56));
  }
}

void sub_10001B3C8(uint64_t a1)
{
  uint64_t v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) lastPathComponent];
    if (*(void *)(a1 + 40)) {
      +[NSString stringWithFormat:@" (error=%@)", *(void *)(a1 + 40)];
    }
    [*(id *)(a1 + 48) componentsJoinedByString:@" "];
    _os_log_send_and_compose_impl();
  }
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, *(void *)(a1 + 56), *(void *)(a1 + 40));
  }
}

uint64_t sub_10001B558(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  pid_t v1 = [*(id *)(a1 + 32) processIdentifier];

  return kill(v1, 9);
}

void sub_10001B598(uint64_t a1)
{
  uint64_t v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) lastPathComponent];
    if (*(void *)(a1 + 40)) {
      +[NSString stringWithFormat:@" (error=%@)", *(void *)(a1 + 40)];
    }
    [*(id *)(a1 + 48) componentsJoinedByString:@" "];
    _os_log_send_and_compose_impl();
  }
  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, void, void))(v4 + 16))(v4, *(void *)(a1 + 56), *(void *)(a1 + 40));
  }
}

void sub_10001BA80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10001BAA4(void *a1, void *a2, char a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

void sub_10001BDC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10001BDE4(void *a1, void *a2, char a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

void sub_10001C100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10001C124(void *a1, void *a2, char a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

__CFString *sub_10001CB8C(unint64_t a1)
{
  uint64_t result = +[NSString stringWithFormat:@"? (%ld)", a1];
  if (a1 <= 4) {
    return off_1000DDA30[a1];
  }
  return result;
}

id sub_10001CBE0(void *a1)
{
  id v1 = [objc_msgSend(a1, "scanRecord") objectForKeyedSubscript:@"WPA_IE"];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  id v3 = +[NSMutableString string];
  [v3 appendString:@"["];
  id v4 = [[v2 objectForKeyedSubscript:@"IE_KEY_WPA_MCIPHER"] intValue];
  int v5 = v4 - 1;
  if (v4 - 1) < 5 && ((0x1Bu >> v5)) {
    uint64_t v6 = off_1000DDA58[v5];
  }
  else {
    uint64_t v6 = +[NSString stringWithFormat:@"<%i>", v4];
  }
  [v3 appendFormat:@"mcast=%@, ", v6];
  [v3 appendString:@"ucast={ "];
  __int16 v23 = v2;
  id v7 = [v2 objectForKeyedSubscript:@"IE_KEY_WPA_UCIPHERS"];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v28 + 1) + 8 * i) intValue];
        int v13 = v12 - 1;
        if (v12 - 1) < 5 && ((0x1Bu >> v13)) {
          uint64_t v14 = off_1000DDA58[v13];
        }
        else {
          uint64_t v14 = +[NSString stringWithFormat:@"<%i>", v12];
        }
        [v3 appendFormat:@"%@ ", v14];
      }
      id v9 = [v7 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }
  [v3 appendString:@"}, "];
  [v3 appendString:@"auths={ "];
  id v15 = [v23 objectForKeyedSubscript:@"IE_KEY_WPA_AUTHSELS"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v24 + 1) + 8 * (void)j) intValue];
        if (v20 >= 3) {
          __int16 v21 = +[NSString stringWithFormat:@"<%i>", v20];
        }
        else {
          __int16 v21 = off_1000DDA80[(int)v20];
        }
        [v3 appendFormat:@"%@ ", v21];
      }
      id v17 = [v15 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v17);
  }
  [v3 appendString:@"}"];
  [v3 appendString:@"]"];
  return v3;
}

__CFString *sub_10001CF18(uint64_t a1)
{
  int v1 = a1 - 1;
  if (a1 - 1) < 9 && ((0x19Fu >> v1)) {
    return off_1000DDA98[v1];
  }
  else {
    return (__CFString *)+[NSString stringWithFormat:@"<%i>", a1];
  }
}

id sub_10001CF78(void *a1)
{
  id v1 = [objc_msgSend(a1, "scanRecord") objectForKeyedSubscript:@"RSN_IE"];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  id v3 = +[NSMutableString string];
  [v3 appendString:@"["];
  [v3 appendFormat:@"mcast=%@, ", sub_10001CF18((uint64_t)objc_msgSend(objc_msgSend(v2, "objectForKeyedSubscript:", @"IE_KEY_RSN_MCIPHER", "intValue"))];
  [v3 appendString:@"ucast={ "];
  id v4 = [v2 objectForKeyedSubscript:@"IE_KEY_RSN_UCIPHERS"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 appendFormat:@"%@ ", sub_10001CF18((uint64_t)[*(id *)(*((void *)&v26 + 1) + 8 * (void)v8) intValue])];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v6);
  }
  [v3 appendString:@"}, "];
  [v3 appendString:@"auths={ "];
  __int16 v21 = v2;
  id v9 = [v2 objectForKeyedSubscript:@"IE_KEY_RSN_AUTHSELS"];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      int v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v13) intValue];
        if v14 < 0x1A && ((0x30033FFu >> (char)v14)) {
          id v15 = off_1000DDAE0[(int)v14];
        }
        else {
          id v15 = +[NSString stringWithFormat:@"<%i>", v14];
        }
        [v3 appendFormat:@"%@ ", v15];
        int v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v11);
  }
  [v3 appendString:@"}, "];
  id v16 = [v21 objectForKeyedSubscript:@"IE_KEY_RSN_CAPS"];
  unsigned int v17 = [[v16 objectForKeyedSubscript:@"MFP_CAPABLE"] BOOLValue];
  unsigned int v18 = [[v16 objectForKeyedSubscript:@"MFP_REQUIRED"] boolValue];
  __int16 v19 = "no";
  if (v17) {
    __int16 v19 = "capable";
  }
  if (v18) {
    __int16 v19 = "required";
  }
  [v3 appendFormat:@"mfp=%s", v19];
  [v3 appendString:@"]"];
  return v3;
}

CFStringRef sub_10001D2BC()
{
  uint64_t v0 = __chkstk_darwin();
  if (!v0) {
    return &stru_1000E06F0;
  }
  id v1 = (_DWORD *)v0;
  unint64_t v2 = *(unsigned __int8 *)(v0 + 8980);
  if (v2 > 2) {
    id v3 = " INVALID";
  }
  else {
    id v3 = off_1000DDA18[v2];
  }
  int v4 = snprintf(__str, 0x4000uLL, " \n AP STATUS DETERMINED AS: %s \n", v3);
  uint64_t v5 = 0;
  memset((char *)&v53[6] + 15, 0, 289);
  memset((char *)&v52[1] + 8, 0, 376);
  strcpy((char *)v52, " Number of events     :");
  do
  {
    snprintf((char *)v52, 0x190uLL, "%s %u\t", (const char *)v52, *(unsigned __int16 *)((char *)v1 + v5 + 8982));
    v5 += 2;
  }
  while (v5 != 32);
  strcpy((char *)v53, " Period Ranges [sec]  : 0\t 0-1\t 1-2\t 2-3\t 3-4\t 4-5\t 5-6\t 6-7\t 7-8\t 8-9\t 9-10\t 11-15\t 16-20\t 21-30\t 31-60\t 60+\n");
  uint64_t v6 = snprintf(&__str[v4], 0x4000 - v4, " \n GENERAL RX RATE PERIOD REPORT \n") + (uint64_t)v4;
  int v7 = v6 + snprintf(&__str[v6], 0x4000 - v6, "%s \n", (const char *)v52);
  int v8 = snprintf(&__str[v7], 0x4000 - v7, "%s \n", (const char *)v53);
  uint64_t v9 = 0;
  strcpy((char *)v52, " Number of events    :");
  memset(v53, 0, sizeof(v53));
  memset((char *)&v52[1] + 7, 0, 377);
  do
  {
    snprintf((char *)v52, 0x190uLL, "%s %u\t", (const char *)v52, *(unsigned __int16 *)((char *)v1 + v9 + 9014));
    v9 += 2;
  }
  while (v9 != 32);
  strcpy((char *)v53, " Period Ranges [sec] : 0\t 0-1\t 1-2\t 2-3\t 3-4\t 4-5\t 5-6\t 6-7\t 7-8\t 8-9\t 9-10\t 11-15\t 16-20\t 21-30\t 31-60\t 60+\n");
  int v10 = snprintf(&__str[v7 + v8], 0x4000 - (v7 + v8), " LINK DOWN LOW RX RATE PERIOD REPORT \n") + v7 + v8;
  int v11 = v10 + snprintf(&__str[v10], 0x4000 - v10, "%s \n", (const char *)v52);
  int v12 = v11 + snprintf(&__str[v11], 0x4000 - v11, "%s \n", (const char *)v53);
  memset(v52, 0, sizeof(v52));
  memset(v53, 0, sizeof(v53));
  int v13 = snprintf(&__str[v12], 0x4000 - v12, " ERRORS SUMMARY: GUARD PERIOD START TIME ZERO EVENT \n") + v12;
  int v14 = snprintf(&__str[v13], 0x4000 - v13, " Number of reports:     %d\t %d\t %d\t %d\t \n", v1[2227], v1[2228], v1[2229], v1[2230])+ v13;
  uint64_t v15 = 0;
  int v16 = v14 + snprintf(&__str[v14], 0x4000 - v14, " Guard Period reason:  FRTS\t SCAN\t PSF\t AW\t \n\n");
  __int16 v49 = v1;
  unsigned int v17 = v1 + 16;
  long long v46 = *(_OWORD *)" Number of reports: ";
  strcpy((char *)&v45, "ports: ");
  long long v44 = *(_OWORD *)" Guard        Time: ";
  strcpy((char *)&v43, " Time: ");
  do
  {
    memset((char *)&v52[1] + 5, 0, 379);
    v52[0] = v46;
    *(void *)((char *)v52 + 13) = v45;
    memset((char *)&v53[1] + 5, 0, 368);
    v53[24] = 0u;
    v53[0] = v44;
    *(void *)((char *)v53 + 13) = v43;
    snprintf((char *)v53, 0x190uLL, " %s\t 16-20\t 21-30\t 31-40\t 41-50\t 51-100\t 101-200 201+\n", (const char *)v53);
    uint64_t v18 = 0;
    int v19 = 0;
    do
    {
      v19 += v17[v18];
      snprintf((char *)v52, 0x190uLL, "%s\t %d", (const char *)v52, v17[v18++]);
    }
    while (v18 != 7);
    uint64_t v20 = snprintf(&__str[v16], 0x4000 - v16, " ERRORS SUMMARY: LONG %s GUARD PERIOD - TOTAL %d  \n", off_1000DD9F0[v15], v19)+ (uint64_t)v16;
    LODWORD(v20) = v20 + snprintf(&__str[v20], 0x4000 - v20, "%s \n", (const char *)v52);
    int v16 = v20 + snprintf(&__str[(int)v20], 0x4000 - (int)v20, "%s \n", (const char *)v53);
    ++v15;
    v17 += 22;
  }
  while (v15 != 5);
  int v21 = snprintf(&__str[v16], 0x4000 - v16, " \n ERRORS SUMMARY: INVALID PACKET AMOUNT REPORTS \n") + v16;
  long long v22 = v49;
  int v23 = snprintf(&__str[v21], 0x4000 - v21, " Number of reports:       %d\t %d\t %d\t %d\t \n", v49[2212], v49[2213], v49[2214], v49[2215])+ v21;
  int v24 = v23 + snprintf(&__str[v23], 0x4000 - v23, " Guard Period reason:     FRTS\t SCAN\t PSF\t AW\t \n");
  int v25 = v24
      + snprintf(&__str[v24], 0x4000 - v24, " \n ERRORS SUMMARY: PACKET ARRIVAL TIME BEFORE GUARD TIME PERIOD REPORTS \n");
  int v26 = snprintf(&__str[v25], 0x4000 - v25, " Number of packets:       %d\t %d\t %d\t %d\t \n", v22[2217], v22[2218], v22[2219], v22[2220])+ v25;
  int v27 = snprintf(&__str[v26], 0x4000 - v26, " Number of guard periods: %d\t %d\t %d\t %d\t \n", v22[2222], v22[2223], v22[2224], v22[2225])+ v26;
  int v28 = snprintf(&__str[v27], 0x4000 - v27, " Guard Period reason:     FRTS\t SCAN\t PSF\t AW\t \n");
  uint64_t v29 = 0;
  int v30 = v27 + v28;
  long long v31 = v49 + 1;
  int v48 = v49 + 111;
  do
  {
    __int16 v47 = v31;
    memset((char *)&v53[1] + 5, 0, 379);
    v53[0] = v44;
    *(void *)((char *)v53 + 13) = v43;
    memset((char *)&v52[1] + 5, 0, 368);
    v52[24] = 0u;
    v52[0] = v46;
    *(void *)((char *)v52 + 13) = v45;
    uint64_t v50 = v29;
    uint64_t v32 = snprintf(&__str[v30], 0x4000 - v30, " \n GUARD TIME %s REPORT\n", off_1000DD9F0[v29]) + (uint64_t)v30;
    int v33 = snprintf(&__str[v32], 0x4000 - v32, " Guard Time distribution in 1 milisec granualty \n");
    for (uint64_t i = 0; i != 15; ++i)
    {
      if (v47[i])
      {
        snprintf((char *)v53, 0x190uLL, "%s\t %d", (const char *)v53, i);
        snprintf((char *)v52, 0x190uLL, "%s\t %d", (const char *)v52, v47[i]);
      }
    }
    int v35 = snprintf(&__str[(int)v32 + v33], 0x4000 - ((int)v32 + v33), "%s \n", (const char *)v52) + v32 + v33;
    uint64_t v36 = 0;
    int v30 = v35 + snprintf(&__str[v35], 0x4000 - v35, "%s \n", (const char *)v53);
    __int16 v37 = v48;
    uint64_t v38 = v50;
    do
    {
      if (v22[22 * v38 + 1 + v36])
      {
        uint64_t v39 = 0;
        int v40 = 0;
        strcpy((char *)v53, " Time        Slots: ");
        strcpy((char *)v52, " Number of packets: ");
        memset((char *)&v53[1] + 5, 0, 379);
        memset((char *)&v52[1] + 5, 0, 379);
        do
        {
          if (v37[v39])
          {
            ++v40;
            snprintf((char *)v53, 0x190uLL, "%s\t %d", (const char *)v53, v39);
            snprintf((char *)v52, 0x190uLL, "%s\t %d", (const char *)v52, v37[v39]);
          }
          ++v39;
        }
        while (v39 != 22);
        if (v40)
        {
          uint64_t v41 = snprintf(&__str[v30], 0x4000 - v30, " \n Packet distribution within the Guard Time %d [ time slot 1 milisecond] \n", v36)+ (uint64_t)v30;
          LODWORD(v41) = v41 + snprintf(&__str[v41], 0x4000 - v41, "%s \n", (const char *)v52);
          int v30 = v41 + snprintf(&__str[(int)v41], 0x4000 - (int)v41, "%s \n", (const char *)v53);
        }
        long long v22 = v49;
        uint64_t v38 = v50;
      }
      ++v36;
      v37 += 20;
    }
    while (v36 != 22);
    uint64_t v29 = v38 + 1;
    long long v31 = v47 + 22;
    v48 += 400;
  }
  while (v29 != 5);
  return (const __CFString *)[objc_alloc((Class)NSString) initWithCString:__str encoding:4];
}

void sub_10001E6C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t sub_10001E714(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001E724(uint64_t a1)
{
}

void sub_10001E72C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = sub_10009756C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315906;
    unsigned int v17 = "-[W5PeerDiagnosticsListener _runDiagnostics:uuid:configuration:]_block_invoke";
    __int16 v18 = 2080;
    int v19 = "W5PeerDiagnosticsListener.m";
    __int16 v20 = 1024;
    int v21 = 98;
    __int16 v22 = 2114;
    id v23 = v6;
    LODWORD(v15) = 38;
    int v14 = &v16;
    _os_log_send_and_compose_impl();
  }

  [*(id *)(a1 + 32) lock];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v8 = [v5 copy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    int v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v11 = [v6 copy];
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    int v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  [*(id *)(a1 + 32) unlock:v14, v15];
}

void sub_10001F4B4(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001F540;
  v4[3] = &unk_1000DDBE0;
  id v3 = *(void **)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  [v3 __cancelActiveRequestAndReply:v4];
}

uint64_t sub_10001F540(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001F5C4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) __cancelActiveRequestAndReply:0];
}

void sub_10001F798(uint64_t a1)
{
  id v3 = [[*(id *)(a1 + 32) __pendingRequestWithUUID:*(void *)(a1 + 40)];
  if (v3)
  {
    int v4 = v3;
    if ([v3 reply])
    {
      id v5 = (void (**)(id, NSError *))[v4 reply];
      NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v11 = @"W5CancelledErr";
      v5[2](v5, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 6, +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1]));
    }
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v4];
  }
  else if (objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "uuid"), "isEqual:", *(void *)(a1 + 40)))
  {
    [*(id *)(a1 + 32) __cancelActiveRequestAndReply:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    if (v7)
    {
      NSErrorUserInfoKey v8 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v9 = @"W5ParamErr";
      (*(void (**)(uint64_t, NSError *))(v7 + 16))(v7, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 1, +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1]));
    }
  }
}

void sub_10001F9D8(uint64_t a1)
{
  if (!sub_100025CA4()) {
    goto LABEL_10;
  }
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  id v3 = (uint64_t (*)(const CFAllocatorRef))off_100103680;
  unsigned int v17 = off_100103680;
  if (!off_100103680)
  {
    NSErrorUserInfoKey v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    uint64_t v12 = sub_100025DE8;
    int v13 = &unk_1000DD348;
    int v4 = sub_100025E38();
    v15[3] = (uint64_t)dlsym(v4, "CoreCaptureControlCreate");
    off_100103680 = (_UNKNOWN *)v15[3];
    id v3 = (uint64_t (*)(const CFAllocatorRef))v15[3];
  }
  _Block_object_dispose(&v14, 8);
  if (v3)
  {
    uint64_t v5 = v3(kCFAllocatorDefault);
    if (!v5)
    {
LABEL_10:
      return;
    }
    uint64_t v6 = (const void *)v5;
    id v7 = [*(id *)(a1 + 32) UTF8String];
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    NSErrorUserInfoKey v8 = (void (*)(const void *, const char *, id))off_100103688;
    unsigned int v17 = off_100103688;
    if (!off_100103688)
    {
      NSErrorUserInfoKey v10 = _NSConcreteStackBlock;
      uint64_t v11 = 3221225472;
      uint64_t v12 = sub_100025ED4;
      int v13 = &unk_1000DD348;
      CFStringRef v9 = sub_100025E38();
      v15[3] = (uint64_t)dlsym(v9, "CoreCaptureControlCaptureWithComponentDirectory");
      off_100103688 = (_UNKNOWN *)v15[3];
      NSErrorUserInfoKey v8 = (void (*)(const void *, const char *, id))v15[3];
    }
    _Block_object_dispose(&v14, 8);
    if (v8)
    {
      v8(v6, "WiFi", v7);
      CFRelease(v6);
      goto LABEL_10;
    }
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"Boolean soft_CoreCaptureControlCaptureWithComponentDirectory(CoreCaptureControlRef, const char *, const char *)"], @"W5WiFiPerfLoggingManager.m", 23, @"%s", dlerror(), v10, v11, v12, v13 file lineNumber description];
  }
  else
  {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"CoreCaptureControlRef soft_CoreCaptureControlCreate(CFAllocatorRef)"], @"W5WiFiPerfLoggingManager.m", 19, @"%s", dlerror(), v10, v11, v12, v13 file lineNumber description];
  }
  __break(1u);
}

void sub_10001FC78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001FD6C(uint64_t a1)
{
  id v1 = *(id **)(a1 + 32);
  unint64_t v2 = +[NSString stringWithFormat:](NSString, @"wifiperf[%@]", [objc_msgSend(objc_msgSend(objc_msgSend(v1[3], "uuid"), "UUIDString"), "substringToIndex:", 5]);

  return [v1 __dumpCoreCaptureLogsWithReason:v2];
}

void sub_100020A08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020A7C;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100020A7C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100020ADC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100020AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020B6C;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100020B6C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100020BCC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100020BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020C5C;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100020C5C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100020CBC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100020CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020D4C;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100020D4C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100020DAC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100020DC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020E3C;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100020E3C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100020E9C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100020EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100020F2C;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100020F2C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100020F8C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100020FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002101C;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10002101C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_10002107C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100021098(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002110C;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_10002110C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_10002116C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100021188(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000211FC;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000211FC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_10002125C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100021B44(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021BB8;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021BB8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100021C18(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100021C34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021CA8;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021CA8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100021D08(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100021D24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021D98;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021D98(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100021DF8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100021E14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021E88;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021E88(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100021EE8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100021F04(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100021F78;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100021F78(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100021FD8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100021FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100022068;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100022068(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_1000220C8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_1000220E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100022158;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100022158(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_1000221B8(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100022388(uint64_t a1)
{
  [*(id *)(a1 + 32) __runToolWithOutputFileHandle:launchPath:arguments: *(void *)(*(void *)(a1 + 32) + 64), @"/usr/local/bin/apple80211", &off_1000EF3A8];
  [*(id *)(a1 + 32) __runToolWithOutputFileHandle:launchPath:arguments: *(void *)(*(void *)(a1 + 32) + 64), @"/usr/local/bin/apple80211", &off_1000EF3C0];
  [*(id *)(a1 + 32) __runToolWithOutputFileHandle:launchPath:arguments: *(void *)(*(void *)(a1 + 32) + 64), @"/usr/local/bin/apple80211", &off_1000EF3D8];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 64);
  v6[0] = [objc_msgSend(*(id *)(v2 + 8), "awdl") interfaceName];
  v6[1] = @"-dbg=print_sr";
  [v2 __runToolWithOutputFileHandle:v3 launchPath:@"/usr/local/bin/apple80211" arguments:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2)];
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

void sub_1000224B0(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64) = 0;
}

void sub_100022B80(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100022BF4;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100022BF4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100022C54(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100022C70(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100022CE4;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100022CE4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100022D44(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100022D60(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100022DD4;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100022DD4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100022E34(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100022E50(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100022EC4;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100022EC4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100022F24(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_100022F40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100022FB4;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100022FB4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 40));
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_100023014(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 40;
  if (a3) {
    uint64_t v3 = 48;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + v3));
}

void sub_1000231E4(uint64_t a1)
{
  [*(id *)(a1 + 32) __runToolWithOutputFileHandle:launchPath:arguments:*(void *)(*(void *)(a1 + 32) + 80), @"/usr/local/bin/apple80211", &off_1000EF3F0];
  [*(id *)(a1 + 32) __runToolWithOutputFileHandle:launchPath:arguments: *(void *)(*(void *)(a1 + 32) + 80), @"/usr/local/bin/apple80211", &off_1000EF408];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 80);
  v6[0] = [objc_msgSend(*(id *)(v2 + 8), "nan") interfaceName];
  v6[1] = @"-dbg=print_nan_avail";
  [v2 __runToolWithOutputFileHandle:v3 launchPath:@"/usr/local/bin/apple80211" arguments:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2)];
  int v4 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

void sub_1000232F4(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80) = 0;
}

void sub_100023584(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000235F8;
  v4[3] = &unk_1000DDC30;
  v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000235F8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) addObject:*(void *)(a1 + 40)];
  dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
}

void sub_10002364C(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 48));
  }
}

id sub_100023894(uint64_t a1)
{
  return [*(id *)(a1 + 32) __setupWatchdogTask];
}

uint64_t sub_100025B90(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) reply])
  {
    uint64_t v2 = (void (**)(id, NSError *))[*(id *)(*(void *)(a1 + 32) + 24) reply];
    NSErrorUserInfoKey v4 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v5 = @"W5CancelledErr";
    v2[2](v2, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 6, +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1]));
  }

  *(void *)(*(void *)(a1 + 32) + 24) = 0;
  [*(id *)(a1 + 32) __nextRequest];
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

uint64_t sub_100025CA4()
{
  if (!qword_100103678) {
    qword_100103678 = _sl_dlopen();
  }
  return qword_100103678;
}

uint64_t sub_100025D74()
{
  uint64_t result = _sl_dlopen();
  qword_100103678 = result;
  return result;
}

void *sub_100025DE8(uint64_t a1)
{
  uint64_t v2 = sub_100025E38();
  uint64_t result = dlsym(v2, "CoreCaptureControlCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100103680 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

NSAssertionHandler *sub_100025E38()
{
  uint64_t v0 = sub_100025CA4();
  if (v0) {
    return (NSAssertionHandler *)v0;
  }
  id v1 = +[NSAssertionHandler currentHandler];
  id v3 = [(NSAssertionHandler *)v1 handleFailureInFunction:+[NSString stringWithUTF8String:"void *CoreCaptureControlLibrary(void)"], @"W5WiFiPerfLoggingManager.m", 15, @"%s", 0 file lineNumber description];
  __break(1u);
  free(v3);
  return v1;
}

void *sub_100025ED4(uint64_t a1)
{
  uint64_t v2 = sub_100025E38();
  uint64_t result = dlsym(v2, "CoreCaptureControlCaptureWithComponentDirectory");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100103688 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10002652C(id a1)
{
  qword_100103690 = [[W5BufferPool alloc] initBuffersWithSize:compression_encode_scratch_buffer_size(COMPRESSION_LZFSE) bufferCount:2];

  _objc_release_x1();
}

void sub_100026CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1000273AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_1000273F0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"timer"];
  if (v2)
  {
    id v3 = (void *)v2;
    NSErrorUserInfoKey v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"timer"];
    CFStringRef v5 = +[NSNull null];
    unsigned __int8 v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"timer"];
      if ([v7 isValid]) {
        [v7 invalidate];
      }
    }
  }
  id v8 = +[NSNull null];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"timer"];
}

void sub_1000274F4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"timer"];
  if (v2)
  {
    id v3 = (void *)v2;
    NSErrorUserInfoKey v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"timer"];
    CFStringRef v5 = +[NSNull null];
    unsigned __int8 v6 = [v4 isEqual:v5];

    if ((v6 & 1) == 0)
    {
      id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"timer"];
      if ([v7 isValid]) {
        [v7 invalidate];
      }
    }
  }
  id v8 = +[NSNull null];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"timer"];
}

void sub_100027A4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_100027A80(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100027B2C;
  v3[3] = &unk_1000DD6D8;
  v3[4] = *(void *)(a1 + 40);
  uint64_t v2 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v3 block:10.0];
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"timer"];
}

id sub_100027B2C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) freeIdleBufferOfTimer:a2];
}

void sub_100027CD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_100027E44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028AA4(uint64_t a1)
{
  [*(id *)(a1 + 32) __setupCallbacks];
  [*(id *)(*(void *)(a1 + 32) + 128) resume];
}

intptr_t sub_100028D80(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100028D88(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100028D90(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100028D98(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100028F28(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 176) = objc_alloc_init((Class)W5Peer);
  [*(id *)(*(void *)(a1 + 32) + 176) setPeerID:0];
  [*(id *)(*(void *)(a1 + 32) + 176) setModel:[*(id *)(a1 + 32) __model]];
  id v2 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/System/Library/CoreServices/SystemVersion.plist") error:0];
  [*(id *)(*(void *)(a1 + 32) + 176) setBuild:[v2 objectForKeyedSubscript:@"ProductBuildVersion"]];
  [*(id *)(*(void *)(a1 + 32) + 176) setVersion:[v2 objectForKeyedSubscript:@"ProductVersion"]];
  [*(id *)(*(void *)(a1 + 32) + 176) setOs:[v2 objectForKeyedSubscript:@"ProductName"]];
  [*(id *)(*(void *)(a1 + 32) + 176) setName:sub_100096F30()];
  id result = [*(id *)(*(void *)(a1 + 32) + 176) peerID];
  if (!result)
  {
    id result = *(id *)(*(void *)(a1 + 32) + 80);
    if (result)
    {
      id result = [result localIDSIdentifier];
      if (result)
      {
        id v4 = [*(id *)(*(void *)(a1 + 32) + 80) localIDSIdentifier];
        CFStringRef v5 = *(void **)(*(void *)(a1 + 32) + 176);
        return [v5 setPeerID:v4];
      }
    }
  }
  return result;
}

void sub_1000295A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a4, a3);
  }
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"Reason"];
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"CleanupDelay"];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (!v9)
  {
    if (v8) {
      int64_t v10 = 1000000000 * (void)[v8 unsignedIntegerValue];
    }
    else {
      int64_t v10 = 120000000000;
    }
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3052000000;
    v15[3] = sub_100029730;
    v15[4] = sub_100029740;
    uint64_t v16 = 0;
    uint64_t v11 = os_transaction_create();
    [[+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager")] osTransactionCreate:@"com.apple.wifivelocity.cleanup" transaction:v11];
    uint64_t v16 = v11;
    dispatch_time_t v12 = dispatch_time(0, v10);
    int v13 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_10002974C;
    v14[3] = &unk_1000DDD30;
    v14[4] = a3;
    v14[5] = v15;
    dispatch_after(v12, v13, v14);
    _Block_object_dispose(v15, 8);
  }
}

void sub_100029730(uint64_t a1, uint64_t a2)
{
}

void sub_100029740(uint64_t a1)
{
}

void sub_10002974C(uint64_t a1)
{
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) path];
    v7[0] = 67109378;
    v7[1] = 120;
    __int16 v8 = 2114;
    id v9 = v4;
    LODWORD(v6) = 18;
    CFStringRef v5 = v7;
    _os_log_send_and_compose_impl();
  }
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager", v5, v6), "removeItemAtPath:error:", [*(id *)(a1 + 32) path], 0);
  [+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionComplete:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = 0;
}

uint64_t sub_100029970(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100029A80(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100029D04(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100029E44(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002A46C(uint64_t a1)
{
  [*(id *)(a1 + 32) itemID];
  id v3 = objc_alloc_init((Class)W5LogItemReceipt);
  [v3 setRequest:*(void *)(a1 + 32)];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setStartedAt:];
  [v3 startedAt];
  [v3 setCompletedAt:];
  NSErrorUserInfoKey v6 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v7 = @"W5NotSupportedErr";
  id v4 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 4, +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1]);
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, NSError *, void, id))(v5 + 16))(v5, v4, 0, v3);
  }
}

void sub_10002AD14(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10002AD50(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002ADD0;
  v4[3] = &unk_1000DD980;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_10002ADD0(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) __updatedStatusWithEvent:*(void *)(a1 + 32)];
}

void sub_10002AE1C(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002AE9C;
  v4[3] = &unk_1000DD980;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_10002AE9C(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) __updatedStatusWithEvent:*(void *)(a1 + 32)];
}

void sub_10002AEE8(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002AF68;
  v4[3] = &unk_1000DD980;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_10002AF68(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) __updatedStatusWithEvent:*(void *)(a1 + 32)];
}

void sub_10002AFB4(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B034;
  v4[3] = &unk_1000DD980;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_10002B034(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) __updatedStatusWithEvent:*(void *)(a1 + 32)];
}

void sub_10002B080(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B100;
  v4[3] = &unk_1000DD980;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_10002B100(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) __updatedStatusWithEvent:*(void *)(a1 + 32)];
}

void sub_10002B14C(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002B1D8;
  v3[3] = &unk_1000DE3C0;
  v3[4] = a2;
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  dispatch_async(v2, v3);
}

void sub_10002B1D8(uint64_t a1)
{
  if ([*(id *)(a1 + 32) eventID] == (id)18)
  {
    unsigned int v3 = [objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "corewifi") powerOn];
    [objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), "pm") caps];
    char v4 = IOPMIsASleep();
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (!v3 || (v4 & 1) != 0) {
      [v5 pauseMonitoring];
    }
    else {
      [v5 resumeMonitoringAfterDelay:10.0];
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) __updatedStatusWithEvent:*(void *)(a1 + 32)];
}

void sub_10002B29C(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B31C;
  v4[3] = &unk_1000DD980;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_10002B31C(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) __updatedStatusWithEvent:*(void *)(a1 + 32)];
}

void sub_10002B368(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002B3F4;
  v3[3] = &unk_1000DE3C0;
  long long v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  v3[4] = a2;
  dispatch_async(v2, v3);
}

void sub_10002B3F4(void *a1)
{
  unsigned int v3 = [objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "corewifi") powerOn];
  [objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "pm") caps];
  char v4 = IOPMIsASleep();
  uint64_t v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
  if (!v3 || (v4 & 1) != 0) {
    [v5 pauseMonitoring];
  }
  else {
    [v5 resumeMonitoringAfterDelay:10.0];
  }
  [*(id *)(*(void *)(a1[7] + 8) + 40) __updatedStatusWithEvent:a1[4]];
}

void sub_10002B4A8(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B528;
  v4[3] = &unk_1000DD980;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_10002B528(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) __updatedStatusWithEvent:*(void *)(a1 + 32)];
}

void sub_10002B574(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B5F4;
  v4[3] = &unk_1000DD980;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_10002B5F4(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) __updatedStatusWithEvent:*(void *)(a1 + 32)];
}

void sub_10002B640(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B6C0;
  v4[3] = &unk_1000DD980;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_10002B6C0(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) __updatedStatusWithEvent:*(void *)(a1 + 32)];
}

void sub_10002B70C(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B78C;
  v4[3] = &unk_1000DD980;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_10002B78C(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) __updatedStatusWithEvent:*(void *)(a1 + 32)];
}

void sub_10002B7D8(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002B858;
  v4[3] = &unk_1000DD980;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_10002B858(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) __updatedStatusWithEvent:*(void *)(a1 + 32)];
}

void sub_10002B8A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v5 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B92C;
  block[3] = &unk_1000DDE48;
  void block[4] = a2;
  void block[5] = a3;
  *(double *)&block[8] = a5;
  uint64_t v6 = *(void *)(a1 + 40);
  void block[6] = a4;
  block[7] = v6;
  dispatch_async(v5, block);
}

void sub_10002B92C(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)W5Event);
  [v3 setEventID:36];
  id v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"UUID"];
  [v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"CompletedDiagnosticsTest"];
  [v4 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"NextDiagnosticsTest"];
  [v4 setObject:[NSNumber numberWithDouble:*((double *)(a1 + 64))] forKeyedSubscript:@"PercentComplete"];
  [v3 setInfo:v4];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTimestamp:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) __completedDiagnosticsTest:v3];
}

void sub_10002BA2C(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BAB0;
  block[3] = &unk_1000DDE98;
  void block[4] = a2;
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(v2, block);
}

void sub_10002BAB0(void *a1)
{
  [*(id *)(*(void *)(a1[5] + 8) + 40) addEvent:a1[4]];
  [*(id *)(*(void *)(a1[6] + 8) + 40) __updatedStatusWithEvent:a1[4]];
}

void sub_10002BB10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v5 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BB98;
  block[3] = &unk_1000DDE48;
  void block[4] = a2;
  void block[5] = a3;
  *(double *)&block[8] = a5;
  uint64_t v6 = *(void *)(a1 + 40);
  void block[6] = a4;
  block[7] = v6;
  dispatch_async(v5, block);
}

void sub_10002BB98(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)W5Event);
  [v3 setEventID:37];
  id v4 = +[NSMutableDictionary dictionary];
  [v4 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"UUID"];
  [v4 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"CollectedLogItem"];
  [v4 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"NextLogItem"];
  [v4 setObject:[+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 64))] forKeyedSubscript:@"PercentComplete"];
  [v3 setInfo:v4];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTimestamp:];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) __collectedLogItem:v3];
}

void sub_10002BC98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BD1C;
  block[3] = &unk_1000DDF10;
  uint64_t v4 = *(void *)(a1 + 40);
  void block[5] = a3;
  void block[6] = v4;
  void block[4] = a2;
  dispatch_async(v3, block);
}

void sub_10002BD1C(void *a1)
{
  [*(id *)(*(void *)(a1[6] + 8) + 40) __collectLogItem:a1[4] reply:a1[5]];
}

void sub_10002BD6C(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BDF0;
  block[3] = &unk_1000DDE98;
  void block[4] = a2;
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(v2, block);
}

void sub_10002BDF0(void *a1)
{
  [*(id *)(*(void *)(a1[5] + 8) + 40) addEvent:a1[4]];
  [*(id *)(*(void *)(a1[6] + 8) + 40) __updatedStatusWithEvent:a1[4]];
}

void sub_10002BE50(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002BED4;
  block[3] = &unk_1000DDE98;
  void block[4] = a2;
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(v2, block);
}

void sub_10002BED4(void *a1)
{
  [*(id *)(*(void *)(a1[5] + 8) + 40) addEvent:a1[4]];
  [*(id *)(*(void *)(a1[6] + 8) + 40) __updatedStatusWithEvent:a1[4]];
}

void sub_10002BF34(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10002BFB4;
  v3[3] = &unk_1000DDC30;
  v3[4] = *(void *)(a1 + 32);
  void v3[5] = a2;
  dispatch_async(v2, v3);
}

void sub_10002BFB4(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(void **)(*(void *)(a1 + 32) + 136);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        __int16 v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(objc_msgSend(v8, "eventIDs"), "containsObject:", &off_1000EADE0)) {
          [objc_msgSend(objc_msgSend(objc_msgSend(v8, "connection"), "remoteObjectProxy"), "receivedEvent:", *(void *)(a1 + 40)];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
  [*(id *)(*(void *)(a1 + 32) + 112) handlePeerFaultEvent:*(void *)(a1 + 40)];
}

void sub_10002C16C(uint64_t a1)
{
  [*(id *)(a1 + 32) __updateStatusMonitoring];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

void sub_10002C23C(uint64_t a1)
{
  [*(id *)(a1 + 32) __updateStatusMonitoring];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

void sub_10002C30C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) __localPeer];
  id v4 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v4 && [v4 localIDSIdentifier]) {
    [v3 setPeerID:[*(id *)(*(void *)(a1 + 32) + 80) localIDSIdentifier]];
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void sub_10002C41C(void *a1)
{
  if (a1[4])
  {
    id v3 = [W5PeerStatusRequest alloc];
    uint64_t v4 = a1[4];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002C564;
    v11[3] = &unk_1000DDF88;
    v11[4] = a1[6];
    uint64_t v5 = [(W5PeerStatusRequest *)v3 initWithPeer:v4 reply:v11];
    id v6 = [*(id *)(a1[5] + 80) queryStatusForPeerWithRequest:v5];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = a1[6];
      if (v8) {
        (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v7, 0);
      }
    }
    if (v5) {
      CFRelease(v5);
    }
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002C57C;
    v9[3] = &unk_1000DDFD8;
    long long v10 = *(_OWORD *)(a1 + 5);
    [v10 __queryStatusAndReply:v9];
  }
}

uint64_t sub_10002C564(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002C57C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10002C5F8;
  v5[3] = &unk_1000DDFB0;
  uint64_t v4 = *(void *)(a1 + 40);
  v5[4] = a3;
  void v5[5] = v4;
  dispatch_async(v3, v5);
}

void sub_10002C5F8(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, *(void *)(a1 + 32));
  }
}

void sub_10002C6C8(void *a1)
{
  uint64_t v3 = (void *)a1[4];
  if (!v3
    || *(void *)(a1[5] + 176)
    && (objc_msgSend(objc_msgSend(v3, "peerID"), "isEqualToString:", objc_msgSend(*(id *)(a1[5] + 176), "peerID")) & 1) != 0)
  {
    uint64_t v4 = (void *)a1[5];
    uint64_t v5 = a1[6];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    void v14[2] = sub_10002C858;
    v14[3] = &unk_1000DE028;
    uint64_t v6 = a1[7];
    v14[4] = v4;
    v14[5] = v6;
    [v4 __queryDatabaseAndReply:v5 reply:v14];
  }
  else
  {
    id v7 = [W5PeerDatabaseRequest alloc];
    uint64_t v8 = a1[4];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002C840;
    v15[3] = &unk_1000DE000;
    uint64_t v9 = a1[6];
    v15[4] = a1[7];
    long long v10 = [(W5PeerDatabaseRequest *)v7 initWithPeer:v8 fetch:v9 reply:v15];
    id v11 = [*(id *)(a1[5] + 80) queryDatabaseForPeerWithRequest:v10];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = a1[7];
      if (v13) {
        (*(void (**)(uint64_t, id, void))(v13 + 16))(v13, v12, 0);
      }
    }
    if (v10) {
      CFRelease(v10);
    }
  }
}

uint64_t sub_10002C840(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002C858(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C8D8;
  block[3] = &unk_1000DE0A0;
  uint64_t v4 = *(void *)(a1 + 40);
  void block[5] = a3;
  void block[6] = v4;
  void block[4] = a2;
  dispatch_async(v3, block);
}

void sub_10002C8D8(void *a1)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = sub_10009756C();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (!v5) {
      goto LABEL_6;
    }
  }
  else if (!v5)
  {
    goto LABEL_6;
  }
  _os_log_send_and_compose_impl();
LABEL_6:
  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(uint64_t, void, void))(v6 + 16))(v6, a1[4], a1[5]);
  }
}

void sub_10002CAF4(void *a1)
{
  uint64_t v3 = [W5PeerFileRequest alloc];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = *(void *)(a1[6] + 96);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002CBE4;
  v11[3] = &unk_1000DE000;
  v11[4] = a1[7];
  id v7 = [(W5PeerFileRequest *)v3 initWithPeer:v4 requestType:1 remotePath:v5 transferManager:v6 reply:v11];
  id v8 = [*(id *)(a1[6] + 80) requestFileFromPeerWithRequest:v7];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = a1[7];
    if (v10) {
      (*(void (**)(uint64_t, id, void))(v10 + 16))(v10, v9, 0);
    }
  }
  if (v7) {
    CFRelease(v7);
  }
}

uint64_t sub_10002CBE4(uint64_t result, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 32);
  if (v3)
  {
    id v5 = [a3 firstObject];
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, id))(v3 + 16);
    return v6(v3, a2, v5);
  }
  return result;
}

void sub_10002CCBC(void *a1)
{
  uint64_t v3 = [W5PeerFileRequest alloc];
  uint64_t v4 = a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = *(void *)(a1[6] + 96);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002CDAC;
  v11[3] = &unk_1000DE000;
  v11[4] = a1[7];
  id v7 = [(W5PeerFileRequest *)v3 initWithPeer:v4 requestType:2 remotePath:v5 transferManager:v6 reply:v11];
  id v8 = [*(id *)(a1[6] + 80) requestFileFromPeerWithRequest:v7];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = a1[7];
    if (v10) {
      (*(void (**)(uint64_t, id, void))(v10 + 16))(v10, v9, 0);
    }
  }
  if (v7) {
    CFRelease(v7);
  }
}

uint64_t sub_10002CDAC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002CE3C(void *a1)
{
  if (a1[4])
  {
    uint64_t v3 = [W5PeerDebugConfigurationRequest alloc];
    uint64_t v4 = a1[4];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002CF8C;
    v11[3] = &unk_1000DE078;
    v11[4] = a1[6];
    uint64_t v5 = [(W5PeerDebugConfigurationRequest *)v3 initWithPeer:v4 type:1 debugConfiguration:0 reply:v11];
    id v6 = [*(id *)(a1[5] + 80) sendDebugConfigurationForPeerWithRequest:v5];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = a1[6];
      if (v8) {
        (*(void (**)(uint64_t, id, void))(v8 + 16))(v8, v7, 0);
      }
    }
    if (v5) {
      CFRelease(v5);
    }
  }
  else
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002CFA4;
    v9[3] = &unk_1000DE0C8;
    long long v10 = *(_OWORD *)(a1 + 5);
    [v10 __queryDebugConfigurationAndReply:v9];
  }
}

uint64_t sub_10002CF8C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002CFA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D024;
  block[3] = &unk_1000DE0A0;
  uint64_t v4 = *(void *)(a1 + 40);
  void block[5] = a3;
  void block[6] = v4;
  void block[4] = a2;
  dispatch_async(v3, block);
}

void sub_10002D024(void *a1)
{
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

void sub_10002D0F0(void *a1)
{
  if (a1[4])
  {
    uint64_t v3 = [W5PeerDebugConfigurationRequest alloc];
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    void v13[2] = sub_10002D23C;
    v13[3] = &unk_1000DE078;
    v13[4] = a1[7];
    id v6 = [(W5PeerDebugConfigurationRequest *)v3 initWithPeer:v4 type:2 debugConfiguration:v5 reply:v13];
    id v7 = [*(id *)(a1[6] + 80) sendDebugConfigurationForPeerWithRequest:v6];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = a1[7];
      if (v9) {
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);
      }
    }
    if (v6) {
      CFRelease(v6);
    }
  }
  else
  {
    uint64_t v10 = a1[5];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002D254;
    v11[3] = &unk_1000DE0F0;
    long long v12 = *((_OWORD *)a1 + 3);
    [v12 __setDebugConfiguration:v10 reply:v11];
  }
}

uint64_t sub_10002D23C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002D254(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002D2D0;
  v4[3] = &unk_1000DDFB0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_10002D2D0(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_10002D3A0(uint64_t a1)
{
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v3 = v2;
  uint64_t v4 = sub_10009756C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [[objc_msgSend(*(id *)(a1 + 32), "UUIDString") substringToIndex:5];
    id v6 = [*(id *)(a1 + 40) processName];
    unsigned int v7 = [[*(id *)(a1 + 40) connection] processIdentifier];
    uint64_t v8 = *(void *)(a1 + 48);
    int v37 = 136316674;
    uint64_t v38 = "-[W5Engine xpcConnection:runDiagnostics:configuration:uuid:reply:]_block_invoke";
    __int16 v39 = 2080;
    int v40 = "W5Engine.m";
    __int16 v41 = 1024;
    int v42 = 1181;
    __int16 v43 = 2114;
    uint64_t v44 = (uint64_t)v5;
    __int16 v45 = 2114;
    id v46 = v6;
    __int16 v47 = 1024;
    unsigned int v48 = v7;
    __int16 v49 = 2114;
    uint64_t v50 = v8;
    LODWORD(v24) = 64;
    __int16 v22 = &v37;
    _os_log_send_and_compose_impl();
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v26 = a1;
  uint64_t v9 = *(void **)(a1 + 56);
  id v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v15 = sub_10009756C();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          [v14 testID];
          uint64_t v16 = W5DescriptionForDiagnosticsTestID();
          id v17 = [v14 testID];
          int v37 = 136316162;
          uint64_t v38 = "-[W5Engine xpcConnection:runDiagnostics:configuration:uuid:reply:]_block_invoke";
          __int16 v39 = 2080;
          int v40 = "W5Engine.m";
          __int16 v41 = 1024;
          int v42 = 1184;
          __int16 v43 = 2114;
          uint64_t v44 = v16;
          __int16 v45 = 2048;
          id v46 = v17;
          LODWORD(v25) = 48;
          id v23 = &v37;
          _os_log_send_and_compose_impl();
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v11);
  }
  uint64_t v19 = *(void *)(v26 + 48);
  uint64_t v18 = *(void *)(v26 + 56);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10002D6DC;
  v28[3] = &unk_1000DE140;
  long long v20 = *(_OWORD *)(v26 + 32);
  uint64_t v31 = v3;
  long long v21 = *(_OWORD *)(v26 + 64);
  long long v29 = v20;
  long long v30 = v21;
  [v21 __runDiagnostics:v18 configuration:v19 uuid:v20 reply:v28];
}

void sub_10002D6DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = sub_10009756C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [[objc_msgSend(*(id *)(a1 + 32), "UUIDString") substringToIndex:5];
    id v8 = [*(id *)(a1 + 40) processName];
    unsigned int v9 = [[*(id *)(a1 + 40) connection] processIdentifier];
    +[NSDate timeIntervalSinceReferenceDate];
    double v11 = v10 - *(double *)(a1 + 64);
    int v15 = 136316674;
    uint64_t v16 = "-[W5Engine xpcConnection:runDiagnostics:configuration:uuid:reply:]_block_invoke";
    __int16 v17 = 2080;
    uint64_t v18 = "W5Engine.m";
    __int16 v19 = 1024;
    int v20 = 1189;
    __int16 v21 = 2114;
    id v22 = v7;
    __int16 v23 = 2114;
    id v24 = v8;
    __int16 v25 = 1024;
    unsigned int v26 = v9;
    __int16 v27 = 2048;
    double v28 = v11;
    _os_log_send_and_compose_impl();
  }
  uint64_t v12 = *(NSObject **)(*(void *)(a1 + 48) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D8A8;
  block[3] = &unk_1000DE0A0;
  uint64_t v13 = *(void *)(a1 + 56);
  void block[5] = a3;
  void block[6] = v13;
  void block[4] = a2;
  dispatch_async(v12, block);
}

void sub_10002D8A8(void *a1)
{
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

uint64_t sub_10002DC58(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002DFB0(uint64_t a1)
{
  uint64_t v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [[[objc_msgSend(*(id *)(a1 + 32), "uuid") UUIDString] substringToIndex:5];
    id v5 = [*(id *)(a1 + 32) processName];
    unsigned int v6 = [[*(id *)(a1 + 32) connection] processIdentifier];
    uint64_t v7 = *(void *)(a1 + 40);
    int v13 = 136316674;
    uint64_t v14 = "-[W5Engine xpcConnection:startDiagnosticsModeWithConfiguration:reply:]_block_invoke";
    __int16 v15 = 2080;
    uint64_t v16 = "W5Engine.m";
    __int16 v17 = 1024;
    int v18 = 1250;
    __int16 v19 = 2114;
    id v20 = v4;
    __int16 v21 = 2114;
    id v22 = v5;
    __int16 v23 = 1024;
    unsigned int v24 = v6;
    __int16 v25 = 2114;
    uint64_t v26 = v7;
    LODWORD(v10) = 64;
    unsigned int v9 = &v13;
    _os_log_send_and_compose_impl();
  }
  uint64_t v8 = *(void *)(a1 + 40);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002E168;
  v11[3] = &unk_1000DE190;
  long long v12 = *(_OWORD *)(a1 + 48);
  [*(id *)(v12 + 112) startDiagnosticsModeWithConfiguration:v8 reply:v11, v9, v10];
}

void sub_10002E168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E1E8;
  block[3] = &unk_1000DE0A0;
  uint64_t v4 = *(void *)(a1 + 40);
  void block[5] = a3;
  void block[6] = v4;
  void block[4] = a2;
  dispatch_async(v3, block);
}

void sub_10002E1E8(void *a1)
{
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[4], a1[5]);
  }
}

void sub_10002E2B8(uint64_t a1)
{
  uint64_t v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [[objc_msgSend(*(id *)(a1 + 32), "UUIDString") substringToIndex:5];
    id v5 = [*(id *)(a1 + 40) processName];
    unsigned int v6 = [[*(id *)(a1 + 40) connection] processIdentifier];
    uint64_t v7 = *(void *)(a1 + 48);
    int v14 = 136316674;
    __int16 v15 = "-[W5Engine xpcConnection:stopDiagnosticsModeWithUUID:info:reply:]_block_invoke";
    __int16 v16 = 2080;
    __int16 v17 = "W5Engine.m";
    __int16 v18 = 1024;
    int v19 = 1269;
    __int16 v20 = 2114;
    id v21 = v4;
    __int16 v22 = 2114;
    id v23 = v5;
    __int16 v24 = 1024;
    unsigned int v25 = v6;
    __int16 v26 = 2114;
    uint64_t v27 = v7;
    LODWORD(v11) = 64;
    uint64_t v10 = &v14;
    _os_log_send_and_compose_impl();
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002E470;
  v12[3] = &unk_1000DE0F0;
  long long v13 = *(_OWORD *)(a1 + 56);
  [*(id *)(v13 + 112) stopDiagnosticsModeWithUUID:v8 info:v9 reply:v12];
}

void sub_10002E470(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002E4EC;
  v4[3] = &unk_1000DDFB0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_10002E4EC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_10002E5BC(uint64_t a1)
{
  uint64_t v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [[[objc_msgSend(*(id *)(a1 + 32), "uuid") UUIDString] substringToIndex:5];
    id v5 = [*(id *)(a1 + 32) processName];
    unsigned int v6 = [[*(id *)(a1 + 32) connection] processIdentifier];
    uint64_t v7 = *(void *)(a1 + 40);
    int v17 = 136316674;
    __int16 v18 = "-[W5Engine xpcConnection:queryDiagnosticsModeForPeer:info:reply:]_block_invoke";
    __int16 v19 = 2080;
    __int16 v20 = "W5Engine.m";
    __int16 v21 = 1024;
    int v22 = 1288;
    __int16 v23 = 2114;
    id v24 = v4;
    __int16 v25 = 2114;
    id v26 = v5;
    __int16 v27 = 1024;
    unsigned int v28 = v6;
    __int16 v29 = 2114;
    uint64_t v30 = v7;
    LODWORD(v14) = 64;
    long long v13 = &v17;
    _os_log_send_and_compose_impl();
  }
  if (*(void *)(a1 + 48))
  {
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 56) + 8);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002E87C;
    v15[3] = &unk_1000DE1E0;
    v15[4] = *(void *)(a1 + 64);
    uint64_t v9 = v15;
  }
  else
  {
    if ([*(id *)(a1 + 40) objectForKeyedSubscript:@"Filter"]
      && objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"Filter"), "integerValue") == (id)2)
    {
      id v10 = [*(id *)(*(void *)(a1 + 56) + 112) allDiagnostics];
    }
    else
    {
      id v10 = [*(id *)(*(void *)(a1 + 56) + 112) activeDiagnostics:v13, v14];
    }
    uint64_t v11 = *(NSObject **)(*(void *)(a1 + 56) + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002E824;
    block[3] = &unk_1000DDFB0;
    uint64_t v12 = *(void *)(a1 + 64);
    void block[4] = v10;
    void block[5] = v12;
    uint64_t v9 = block;
    uint64_t v8 = v11;
  }
  dispatch_async(v8, v9);
}

void sub_10002E824(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, *(void *)(a1 + 32));
  }
}

void sub_10002E87C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    NSErrorUserInfoKey v4 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v5 = @"W5NotSupportedErr";
    (*(void (**)(uint64_t, NSError *, void))(v3 + 16))(v3, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 4, +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1]), 0);
  }
}

void sub_10002E9D4(uint64_t a1)
{
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v3 = v2;
  NSErrorUserInfoKey v4 = sub_10009756C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [[objc_msgSend(*(id *)(a1 + 32), "UUIDString") substringToIndex:5];
    id v6 = [*(id *)(a1 + 40) processName];
    unsigned int v7 = [[*(id *)(a1 + 40) connection] processIdentifier];
    uint64_t v8 = *(void *)(a1 + 48);
    int v51 = 136316674;
    uint64_t v52 = "-[W5Engine xpcConnection:collectLogs:configuration:uuid:reply:]_block_invoke";
    __int16 v53 = 2080;
    id v54 = "W5Engine.m";
    __int16 v55 = 1024;
    int v56 = 1321;
    __int16 v57 = 2114;
    uint64_t v58 = (uint64_t)v5;
    __int16 v59 = 2114;
    id v60 = v6;
    __int16 v61 = 1024;
    unsigned int v62 = v7;
    __int16 v63 = 2114;
    uint64_t v64 = v8;
    LODWORD(v3_Block_object_dispose(&STACK[0x310], 8) = 64;
    uint64_t v36 = &v51;
    _os_log_send_and_compose_impl();
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  uint64_t v40 = a1;
  uint64_t v9 = *(void **)(a1 + 56);
  id v10 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v47 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        __int16 v15 = sub_10009756C();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          [v14 itemID];
          uint64_t v16 = W5DescriptionForLogItemID();
          id v17 = [v14 itemID];
          int v51 = 136316162;
          uint64_t v52 = "-[W5Engine xpcConnection:collectLogs:configuration:uuid:reply:]_block_invoke";
          __int16 v53 = 2080;
          id v54 = "W5Engine.m";
          __int16 v55 = 1024;
          int v56 = 1324;
          __int16 v57 = 2114;
          uint64_t v58 = v16;
          __int16 v59 = 2048;
          id v60 = v17;
          LODWORD(v39) = 48;
          int v37 = &v51;
          _os_log_send_and_compose_impl();
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v46 objects:v50 count:16];
    }
    while (v11);
  }
  id v18 = [*(id *)(v40 + 64) __localPeer:v37 withPeerID:v39];
  unsigned int v19 = [[*(id *)(v40 + 48) objectForKeyedSubscript:@"Compress"] BOOLValue];
  id v20 = objc_alloc_init((Class)NSDateFormatter);
  [v20 setDateFormat:@"yyyy-MM-dd_HH.mm.ss.SSS"];
  id v21 = [v20 stringFromDate:[NSDate date]];
  int v22 = (NSString *)[*(id *)(v40 + 48) objectForKeyedSubscript:@"Reason"];
  if (!v22) {
    int v22 = [+[NSBundle bundleWithIdentifier:@"com.apple.WiFiVelocity"] localizedStringForKey:@"kW5LocWiFiDiagnosticsName" value:@"WiFiDiagnostics" table:0];
  }
  id v23 = [v18 os];
  id v24 = [v18 model];
  id v25 = [v18 build];
  CFStringRef v26 = &stru_1000E06F0;
  if (v19) {
    CFStringRef v26 = @".tgz";
  }
  __int16 v27 = +[NSString stringWithFormat:@"%@_%@_%@_%@_%@%@", v22, v21, v23, v24, v25, v26];
  uint64_t v28 = getuid();
  uint64_t v29 = getgid();
  uint64_t v31 = *(void *)(v40 + 56);
  uint64_t v30 = *(void **)(v40 + 64);
  uint64_t v32 = *(void *)(v40 + 48);
  id v33 = [*(id *)(v40 + 40) additionalLog];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_10002EE48;
  v42[3] = &unk_1000DE230;
  long long v34 = *(_OWORD *)(v40 + 32);
  uint64_t v45 = v3;
  long long v35 = *(_OWORD *)(v40 + 64);
  long long v43 = v34;
  long long v44 = v35;
  [v30 __collectLogs:v31 configuration:v32 additionalLog:v33 filename:v27 uid:v28 gid:v29 uuid:v34 reply:v42];
}

void sub_10002EE48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_10009756C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [[objc_msgSend(*(id *)(a1 + 32), "UUIDString") substringToIndex:5];
    id v10 = [*(id *)(a1 + 40) processName];
    unsigned int v11 = [[*(id *)(a1 + 40) connection] processIdentifier];
    +[NSDate timeIntervalSinceReferenceDate];
    double v13 = v12 - *(double *)(a1 + 64);
    int v17 = 136316930;
    id v18 = "-[W5Engine xpcConnection:collectLogs:configuration:uuid:reply:]_block_invoke";
    __int16 v19 = 2080;
    id v20 = "W5Engine.m";
    __int16 v21 = 1024;
    int v22 = 1348;
    __int16 v23 = 2114;
    id v24 = v9;
    __int16 v25 = 2114;
    id v26 = v10;
    __int16 v27 = 1024;
    unsigned int v28 = v11;
    __int16 v29 = 2048;
    double v30 = v13;
    __int16 v31 = 2114;
    uint64_t v32 = a4;
    _os_log_send_and_compose_impl();
  }
  uint64_t v14 = *(NSObject **)(*(void *)(a1 + 48) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F028;
  block[3] = &unk_1000DE208;
  uint64_t v15 = *(void *)(a1 + 56);
  void block[4] = a2;
  void block[5] = a3;
  void block[6] = a4;
  void block[7] = v15;
  dispatch_async(v14, block);
}

void sub_10002F028(void *a1)
{
  uint64_t v3 = a1[7];
  if (v3) {
    (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, a1[4], a1[5], a1[6]);
  }
}

void sub_10002F0FC(id *a1)
{
  +[NSDate timeIntervalSinceReferenceDate];
  uint64_t v3 = v2;
  NSErrorUserInfoKey v4 = sub_10009756C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [[[a1[4] UUIDString] substringToIndex:5];
    id v6 = [a1[5] processName];
    unsigned int v7 = [[a1[5] connection] processIdentifier];
    id v8 = a1[6];
    int v33 = 136316674;
    long long v34 = "-[W5Engine xpcConnection:collectLogsDiagnosticMode:uuid:reply:]_block_invoke";
    __int16 v35 = 2080;
    uint64_t v36 = "W5Engine.m";
    __int16 v37 = 1024;
    int v38 = 1365;
    __int16 v39 = 2114;
    id v40 = v5;
    __int16 v41 = 2114;
    id v42 = v6;
    __int16 v43 = 1024;
    unsigned int v44 = v7;
    __int16 v45 = 2114;
    id v46 = v8;
    LODWORD(v26) = 64;
    __int16 v25 = &v33;
    _os_log_send_and_compose_impl();
  }
  id v9 = [a1[7] __localPeer:v25 v26];
  unsigned int v27 = [[a1[6] objectForKeyedSubscript:@"Compress"] boolValue];
  id v10 = objc_alloc_init((Class)NSDateFormatter);
  [v10 setDateFormat:@"yyyy.MM.dd_HH-mm-ssZZZZZ"];
  [v10 setTimeZone:+[NSTimeZone defaultTimeZone](NSTimeZone, "defaultTimeZone")];
  id v11 = [[objc_msgSend(v10, "stringFromDate:", +[NSDate date](NSDate, "date")) stringByReplacingOccurrencesOfString:@":" withString:@"%s"];
  double v12 = (NSString *)[a1[6] objectForKeyedSubscript:@"Reason"];
  if (!v12) {
    double v12 = [+[NSBundle bundleWithIdentifier:@"com.apple.WiFiVelocity"] localizedStringForKey:@"kW5LocWiFiNetworkDiagnosticsName" value:@"WiFiNetworkDiagnostics" table:0];
  }
  if (objc_msgSend(objc_msgSend(v9, "model"), "containsString:", @"AudioAccessory")) {
    double v13 = (__CFString *)[[[v9 name] stringByReplacingOccurrencesOfString:@" " withString:@""];
  }
  else {
    double v13 = &stru_1000E06F0;
  }
  if ((unint64_t)[(__CFString *)v13 length] >= 9) {
    double v13 = (__CFString *)[(__CFString *)v13 substringToIndex:8];
  }
  id v14 = [[[v9 os] stringByReplacingOccurrencesOfString:@" " withString:@"-"]
  id v15 = [v9 model];
  if ([(__CFString *)v13 length]) {
    CFStringRef v16 = +[NSString stringWithFormat:@"_%@", v13];
  }
  else {
    CFStringRef v16 = &stru_1000E06F0;
  }
  id v17 = [v9 build];
  CFStringRef v18 = @".tgz";
  if (!v27) {
    CFStringRef v18 = &stru_1000E06F0;
  }
  __int16 v19 = +[NSString stringWithFormat:@"%@_%@_%@_%@%@_%@%@", v12, v11, v14, v15, v16, v17, v18];
  uint64_t v20 = getuid();
  uint64_t v21 = getgid();
  id v22 = a1[6];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10002F4D8;
  v29[3] = &unk_1000DE230;
  long long v23 = *((_OWORD *)a1 + 2);
  uint64_t v32 = v3;
  long long v24 = *(_OWORD *)(a1 + 7);
  long long v30 = v23;
  long long v31 = v24;
  [v24 __collectLogsDiagnosticMode:v22 outputName:v19 uid:v20 gid:v21 uuid:v21 reply:v23];
}

void sub_10002F4D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v8 = sub_10009756C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [[objc_msgSend(*(id *)(a1 + 32), "UUIDString") substringToIndex:5];
    id v10 = [*(id *)(a1 + 40) processName];
    unsigned int v11 = [[objc_msgSend(*(id *)(a1 + 40), "connection") processIdentifier];
    +[NSDate timeIntervalSinceReferenceDate];
    double v13 = v12 - *(double *)(a1 + 64);
    int v17 = 136316930;
    CFStringRef v18 = "-[W5Engine xpcConnection:collectLogsDiagnosticMode:uuid:reply:]_block_invoke";
    __int16 v19 = 2080;
    uint64_t v20 = "W5Engine.m";
    __int16 v21 = 1024;
    int v22 = 1394;
    __int16 v23 = 2114;
    id v24 = v9;
    __int16 v25 = 2114;
    id v26 = v10;
    __int16 v27 = 1024;
    unsigned int v28 = v11;
    __int16 v29 = 2048;
    double v30 = v13;
    __int16 v31 = 2114;
    uint64_t v32 = a4;
    _os_log_send_and_compose_impl();
  }
  id v14 = *(NSObject **)(*(void *)(a1 + 48) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F6B8;
  block[3] = &unk_1000DE208;
  uint64_t v15 = *(void *)(a1 + 56);
  void block[4] = a2;
  void block[5] = a3;
  void block[6] = a4;
  void block[7] = v15;
  dispatch_async(v14, block);
}

void sub_10002F6B8(void *a1)
{
  uint64_t v3 = a1[7];
  if (v3) {
    (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, a1[4], a1[5], a1[6]);
  }
}

void sub_10002F790(double *a1)
{
  uint64_t v3 = *((void *)a1 + 4);
  if (v3)
  {
    NSErrorUserInfoKey v4 = (void *)*((void *)a1 + 5);
    uint64_t v5 = *((void *)a1 + 6);
    double v6 = a1[9];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10002FA00;
    v18[3] = &unk_1000DE280;
    uint64_t v7 = *((void *)a1 + 8);
    v18[4] = v4;
    v18[5] = v7;
    [v4 __runWiFiSnifferOnPeer:v3 channels:v5 duration:0 uuid:v18 reply:v6];
  }
  else
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3052000000;
    v16[3] = sub_100029730;
    v16[4] = sub_100029740;
    id v17 = 0;
    id v17 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
    v14[0] = 0;
    v14[1] = v14;
    void v14[2] = 0x3052000000;
    v14[3] = sub_100029730;
    v14[4] = sub_100029740;
    id v15 = 0;
    id v15 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:2];
    id v8 = dispatch_group_create();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    void v13[2] = sub_10002FADC;
    v13[3] = &unk_1000DE2D0;
    uint64_t v10 = *((void *)a1 + 5);
    id v9 = (void *)*((void *)a1 + 6);
    v13[4] = v8;
    void v13[5] = v10;
    *(double *)&v13[9] = a1[9];
    *(double *)&v13[6] = a1[7];
    v13[7] = v16;
    v13[8] = v14;
    [v9 enumerateObjectsUsingBlock:v13];
    unsigned int v11 = *(NSObject **)(*((void *)a1 + 5) + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002FBEC;
    block[3] = &unk_1000DE2F8;
    *(double *)&void block[4] = a1[8];
    void block[5] = v16;
    void block[6] = v14;
    dispatch_group_notify(v8, v11, block);
    _Block_object_dispose(v14, 8);
    _Block_object_dispose(v16, 8);
  }
}

void sub_10002F9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_10002FA00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FA84;
  block[3] = &unk_1000DE258;
  uint64_t v6 = *(void *)(a1 + 40);
  void block[7] = a5;
  void block[8] = v6;
  void block[4] = a2;
  void block[5] = a3;
  void block[6] = a4;
  dispatch_async(v5, block);
}

void sub_10002FA84(void *a1)
{
  uint64_t v3 = a1[8];
  if (v3) {
    (*(void (**)(uint64_t, void, void, void, void))(v3 + 16))(v3, a1[4], a1[5], a1[6], a1[7]);
  }
}

id sub_10002FADC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (a3 == 1) {
    *a4 = 1;
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  double v6 = *(double *)(a1 + 72);
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002FB8C;
  v11[3] = &unk_1000DE2A8;
  long long v12 = *(_OWORD *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 32);
  void v11[4] = a2;
  void v11[5] = v9;
  return [v7 __runWiFiSnifferOnChannel:a2 duration:v8 uuid:v11 tcpDump:v6 reply:];
}

void sub_10002FB8C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1[4];
  if (a2)
  {
    uint64_t v5 = *(void **)(*(void *)(a1[6] + 8) + 40);
    a3 = a2;
  }
  else
  {
    uint64_t v5 = *(void **)(*(void *)(a1[7] + 8) + 40);
  }
  [v5 setObject:a3 forKey:v4];
  double v6 = a1[5];

  dispatch_group_leave(v6);
}

uint64_t sub_10002FBEC(void *a1)
{
  uint64_t result = a1[4];
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, void, void))(result + 16))(result, 0, *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), 0);
  }
  return result;
}

void sub_10002FCA4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  if (v3)
  {
    double v6 = *(double *)(a1 + 72);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    void v13[2] = sub_10002FDC4;
    v13[3] = &unk_1000DE280;
    uint64_t v7 = *(void *)(a1 + 64);
    v13[4] = v4;
    void v13[5] = v7;
    [v4 __runWiFiSnifferOnPeer:v3 channels:v5 duration:0 uuid:v13 reply:v6];
  }
  else
  {
    id v8 = [*(id *)(a1 + 48) objectAtIndexedSubscript:];
    double v9 = *(double *)(a1 + 72);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002FEB0;
    v12[3] = &unk_1000DE348;
    uint64_t v10 = *(void *)(a1 + 56);
    uint64_t v11 = *(void *)(a1 + 64);
    void v12[4] = *(void *)(a1 + 40);
    v12[5] = v11;
    [v4 __runWiFiSnifferOnChannel:v8 duration:v10 uuid:1 tcpDump:v12 reply:v9];
  }
}

void sub_10002FDC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FE44;
  block[3] = &unk_1000DE0A0;
  uint64_t v5 = *(void *)(a1 + 40);
  void block[5] = a4;
  void block[6] = v5;
  void block[4] = a2;
  dispatch_async(v4, block);
}

void sub_10002FE44(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, *(void *)(a1 + 32), [*(id *)(a1 + 40) allValues]);
  }
}

void sub_10002FEB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FF30;
  block[3] = &unk_1000DE0A0;
  uint64_t v4 = *(void *)(a1 + 40);
  void block[5] = a3;
  void block[6] = v4;
  void block[4] = a2;
  dispatch_async(v3, block);
}

void sub_10002FF30(void *a1)
{
  uint64_t v3 = a1[6];
  if (v3)
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    (*(void (**)(uint64_t, uint64_t, NSArray *))(v3 + 16))(v3, v4, +[NSArray arrayWithObjects:&v5 count:1]);
  }
}

void sub_100030054(uint64_t a1)
{
  uint64_t v3 = [W5PeerDiscoveryRequest alloc];
  uint64_t v4 = *(void *)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_100030120;
  v7[3] = &unk_1000DE370;
  long long v8 = *(_OWORD *)(a1 + 40);
  id v5 = [-[W5PeerDiscoveryRequest initWithConfiguration:uuid:handler:](v3, "initWithConfiguration:uuid:handler:", v4, (void)v8, v7)];
  uint64_t v6 = *(void *)(a1 + 64);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
  }
}

uint64_t sub_100030120(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 | a3)
  {
    id v6 = objc_alloc((Class)W5PeerDiscoveryEvent);
    uint64_t v7 = *(void *)(a1 + 32);
    CFStringRef v10 = @"UUID";
    uint64_t v11 = v7;
    return (uint64_t)[objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "connection"), "remoteObjectProxy"), "receivedPeerDiscoveryEvent:", objc_msgSend(v6, "initWithPeersFound:peersLost:info:", a2, a3, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1)));
  }
  else
  {
    double v9 = sub_10009756C();
    uint64_t result = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (result) {
      return _os_log_send_and_compose_impl();
    }
  }
  return result;
}

void sub_1000302FC(uint64_t a1)
{
  [*(id *)(a1 + 32) __cancelPeerDiscoveryWithUUID:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

void sub_1000304C8(void *a1)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_100030558;
  v7[3] = &unk_1000DE0F0;
  uint64_t v5 = a1[6];
  uint64_t v6 = a1[7];
  void v7[4] = v3;
  v7[5] = v6;
  [v3 __runWiFiPerfLoggingWithConfiguration:v4 uuid:v5 reply:v7];
}

void sub_100030558(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000305D4;
  v4[3] = &unk_1000DDFB0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_1000305D4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_1000306A0(void *a1)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_100030730;
  v6[3] = &unk_1000DE0F0;
  uint64_t v5 = a1[6];
  v6[4] = v3;
  v6[5] = v5;
  [v3 __cancelDiagnosticsWithUUID:v4 reply:v6];
}

void sub_100030730(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000307AC;
  v4[3] = &unk_1000DDFB0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_1000307AC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_100030878(void *a1)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_100030908;
  v6[3] = &unk_1000DE0F0;
  uint64_t v5 = a1[6];
  v6[4] = v3;
  v6[5] = v5;
  [v3 __cancelCollectLogsWithUUID:v4 reply:v6];
}

void sub_100030908(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100030984;
  v4[3] = &unk_1000DDFB0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_100030984(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_100030A50(void *a1)
{
  if (a1[4])
  {
    id v3 = objc_alloc_init((Class)W5Peer);
    [v3 setPeerID:a1[4]];
    [v3 setDiscoveryFlags:1];
    [v3 setControlFlags:1];
    uint64_t v4 = (void *)a1[5];
    uint64_t v5 = a1[6];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100030B80;
    v11[3] = &unk_1000DE0F0;
    uint64_t v6 = a1[7];
    void v11[4] = v4;
    void v11[5] = v6;
    [v4 __cancelWiFiSnifferWithUUID:v5 peer:v3 reply:v11];
  }
  else
  {
    uint64_t v7 = (void *)a1[5];
    uint64_t v8 = a1[6];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100030C50;
    v10[3] = &unk_1000DE0F0;
    uint64_t v9 = a1[7];
    v10[4] = v7;
    v10[5] = v9;
    [v7 __cancelWiFiSnifferWithUUID:v8 reply:v10];
  }
}

void sub_100030B80(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100030BFC;
  v4[3] = &unk_1000DDFB0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_100030BFC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_100030C50(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100030CCC;
  v4[3] = &unk_1000DDFB0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_100030CCC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_100030D98(void *a1)
{
  uint64_t v4 = a1[4];
  uint64_t v3 = (void *)a1[5];
  uint64_t v5 = a1[6];
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100030E88;
    v9[3] = &unk_1000DE0F0;
    uint64_t v6 = a1[7];
    void v9[4] = v3;
    v9[5] = v6;
    [v3 __cancelWiFiSnifferWithUUID:v5 peer:v4 reply:v9];
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100030F58;
    v8[3] = &unk_1000DE0F0;
    uint64_t v7 = a1[7];
    v8[4] = v3;
    v8[5] = v7;
    [v3 __cancelWiFiSnifferWithUUID:v5 reply:v8];
  }
}

void sub_100030E88(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100030F04;
  v4[3] = &unk_1000DDFB0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_100030F04(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_100030F58(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100030FD4;
  v4[3] = &unk_1000DDFB0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_100030FD4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_1000310A0(void *a1)
{
  uint64_t v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_100031130;
  v6[3] = &unk_1000DE0F0;
  uint64_t v5 = a1[6];
  v6[4] = v3;
  v6[5] = v5;
  [v3 __cancelWiFiPerfLoggingWithUUID:v4 reply:v6];
}

void sub_100031130(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000311AC;
  v4[3] = &unk_1000DDFB0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_1000311AC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_100031278(void *a1)
{
  uint64_t v3 = a1[4];
  if (v3)
  {
    [*(id *)(a1[5] + 184) startMonitoringFaultEventsForPeer:v3 reply:a1[6]];
  }
  else
  {
    uint64_t v4 = a1[6];
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    }
  }
}

void sub_10003135C(void *a1)
{
  uint64_t v3 = a1[4];
  if (v3)
  {
    [*(id *)(a1[5] + 184) stopMonitoringFaultEventsForPeer:v3 reply:a1[6]];
  }
  else
  {
    uint64_t v4 = a1[6];
    if (v4) {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    }
  }
}

void sub_100031440(void *a1)
{
  [*(id *)(a1[4] + 184) submitFaultEvent:a1[5]];
  uint64_t v3 = a1[6];
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

void sub_100031518(void *a1)
{
  uint64_t v3 = a1[4];
  if (v3)
  {
    [*(id *)(a1[5] + 184) queryFaultEventCacheForPeer:v3 reply:a1[6]];
  }
  else
  {
    uint64_t v4 = a1[6];
    if (v4) {
      (*(void (**)(uint64_t, void, id))(v4 + 16))(v4, 0, [*(id *)(a1[5] + 184) faultEventCache]);
    }
  }
}

void sub_100031B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_100031B9C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 136) addObject:*(void *)(a1 + 40)];
}

uint64_t sub_100031BE4(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) processName];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) processIdentifier];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) effectiveUserIdentifier];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) effectiveGroupIdentifier];
  uint64_t v2 = sub_10009756C();
  uint64_t result = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (result) {
    return _os_log_send_and_compose_impl();
  }
  return result;
}

void sub_100031D48(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) processName];
  unsigned int v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) processIdentifier];
  unsigned int v4 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) effectiveUserIdentifier];
  unsigned int v5 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) effectiveGroupIdentifier];
  uint64_t v6 = sub_10009756C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136316674;
    id v14 = "-[W5Engine listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v15 = 2080;
    CFStringRef v16 = "W5Engine.m";
    __int16 v17 = 1024;
    int v18 = 1760;
    __int16 v19 = 2114;
    id v20 = v2;
    __int16 v21 = 1024;
    unsigned int v22 = v3;
    __int16 v23 = 1024;
    unsigned int v24 = v4;
    __int16 v25 = 1024;
    unsigned int v26 = v5;
    _os_log_send_and_compose_impl();
  }
  block[0] = _NSConcreteStackBlock;
  long long v7 = *(_OWORD *)(a1 + 32);
  long long v8 = *(_OWORD *)(a1 + 48);
  uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[1] = 3221225472;
  block[2] = sub_100031F08;
  block[3] = &unk_1000DE3C0;
  long long v11 = v7;
  long long v12 = v8;
  dispatch_async(v9, block);
}

void sub_100031F08(uint64_t a1)
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) activeRequests];
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        switch((unint64_t)[v8 type])
        {
          case 1uLL:
            [*(id *)(a1 + 32) __cancelDiagnosticsWithUUID:[v8 uuid] reply:0];
            break;
          case 2uLL:
            [*(id *)(a1 + 32) __cancelCollectLogsWithUUID:[v8 uuid] reply:0];
            break;
          case 3uLL:
            [*(id *)(a1 + 32) __cancelWiFiSnifferWithUUID:[v8 uuid] reply:0];
            break;
          case 4uLL:
            [*(id *)(a1 + 32) __cancelPeerDiscoveryWithUUID:[v8 uuid]];
            break;
          case 5uLL:
            [*(id *)(a1 + 32) __cancelWiFiPerfLoggingWithUUID:[v8 uuid] reply:0];
            break;
          default:
            continue;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) faultEventMonitoringPeers];
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*(void *)(a1 + 32) + 184) stopMonitoringFaultEventsForPeer:*(void *)(*((void *)&v14 + 1) + 8 * (void)j) reply:0];
      }
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
  -[NSFileManager removeItemAtURL:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtURL:error:", [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) additionalLog], 0);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setExportedObject:0];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setInterruptionHandler:0];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setInvalidationHandler:0];
  [*(id *)(*(void *)(a1 + 32) + 136) removeObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  [+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionComplete:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];

  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = 0;
  [*(id *)(a1 + 32) __updateStatusMonitoring];
}

void sub_1000329B4(id a1, BGRepeatingSystemTask *a2)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100032C48;
  v10[3] = &unk_1000DD348;
  v10[4] = &v11;
  [(BGRepeatingSystemTask *)a2 setExpirationHandler:v10];
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long v15 = 136315650;
    *(void *)&v15[4] = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke";
    __int16 v16 = 2080;
    long long v17 = "W5Engine.m";
    __int16 v18 = 1024;
    int v19 = 1907;
    LODWORD(v_Block_object_dispose(&STACK[0x310], 8) = 28;
    long long v7 = v15;
    _os_log_send_and_compose_impl();
  }
  id v4 = +[NSPredicate predicateWithFormat:@"pathExtension='pcap'", v7, v8];
  sub_100098638(@"/var/run/com.apple.wifivelocity", (uint64_t)v4, 7, (unsigned char *)v12 + 24);
  id v5 = sub_10009756C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long v15 = 136315650;
    *(void *)&v15[4] = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke";
    __int16 v16 = 2080;
    long long v17 = "W5Engine.m";
    __int16 v18 = 1024;
    int v19 = 1909;
    LODWORD(v9) = 28;
    _os_log_send_and_compose_impl();
  }
  if (*((unsigned char *)v12 + 24))
  {
    *(void *)long long v15 = 0;
    if (([(BGRepeatingSystemTask *)a2 setTaskExpiredWithRetryAfter:v15 error:0.0] & 1) == 0)
    {
      CFStringRef v6 = *(const __CFString **)v15;
      if (!*(void *)v15) {
        CFStringRef v6 = @"Unknown";
      }
      NSLog(@"Failed to expire task with error: %@", v6, v9);
      [(BGRepeatingSystemTask *)a2 setTaskCompleted];
    }
  }
  else
  {
    [(BGRepeatingSystemTask *)a2 setTaskCompleted];
  }
  _Block_object_dispose(&v11, 8);
}

void sub_100032C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100032C48(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  uint64_t v1 = sub_10009756C();
  uint64_t result = os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
  if (result) {
    return _os_log_send_and_compose_impl();
  }
  return result;
}

void sub_100032D34(uint64_t a1, void *a2)
{
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100032FF0;
  v11[3] = &unk_1000DD348;
  void v11[4] = &v12;
  [a2 setExpirationHandler:v11];
  id v4 = sub_10009756C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long v17 = 136315650;
    *(void *)&v17[4] = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke";
    __int16 v18 = 2080;
    int v19 = "W5Engine.m";
    __int16 v20 = 1024;
    int v21 = 1936;
    LODWORD(v9) = 28;
    uint64_t v8 = v17;
    _os_log_send_and_compose_impl();
  }
  long long v16 = *(_OWORD *)(a1 + 32);
  id v5 = +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 2, v8, v9));
  sub_100098638(@"/var/run/com.apple.wifivelocity", (uint64_t)v5, 7, (unsigned char *)v13 + 24);
  CFStringRef v6 = sub_10009756C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long v17 = 136315650;
    *(void *)&v17[4] = "-[W5Engine _scheduleRepeatingCleanupTasks]_block_invoke";
    __int16 v18 = 2080;
    int v19 = "W5Engine.m";
    __int16 v20 = 1024;
    int v21 = 1938;
    LODWORD(v10) = 28;
    _os_log_send_and_compose_impl();
  }
  if (*((unsigned char *)v13 + 24))
  {
    *(void *)long long v17 = 0;
    if (([a2 setTaskExpiredWithRetryAfter:v17 error:0.0] & 1) == 0)
    {
      CFStringRef v7 = *(const __CFString **)v17;
      if (!*(void *)v17) {
        CFStringRef v7 = @"Unknown";
      }
      NSLog(@"Failed to expire task with error: %@", v7, v10);
      [a2 setTaskCompleted];
    }
  }
  else
  {
    [a2 setTaskCompleted];
  }
  _Block_object_dispose(&v12, 8);
}

void sub_100032FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100032FF0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  uint64_t v1 = sub_10009756C();
  uint64_t result = os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
  if (result) {
    return _os_log_send_and_compose_impl();
  }
  return result;
}

NSXPCInterface *sub_100033748()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___W5XPCRequestDelegate];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"startBrowsingAndReply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"stopBrowsingAndReply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"startAdvertisingAndReply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"stopAdvertisingAndReply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"startMonitoringEvents:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"stopMonitoringEvents:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryPeerCacheAndReply:" argumentIndex:0 ofReply:1];
  uint64_t v1 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, objc_opt_class(), 0) forSelector:"queryPeerCacheAndReply:" argumentIndex:1 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryLocalPeerAndReply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryLocalPeerAndReply:" argumentIndex:1 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryStatusForPeer:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryStatusForPeer:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryStatusForPeer:reply:" argumentIndex:1 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"listFilesFromPeer:remoteDirPath:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"listFilesFromPeer:remoteDirPath:reply:" argumentIndex:1 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"listFilesFromPeer:remoteDirPath:reply:" argumentIndex:0 ofReply:1];
  uint64_t v2 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, objc_opt_class(), 0) forSelector:"listFilesFromPeer:remoteDirPath:reply:" argumentIndex:1 ofReply:1];
  uint64_t v3 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0) forSelector:"runDiagnostics:configuration:uuid:reply:" argumentIndex:0 ofReply:0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, v6, v7, v8, objc_opt_class(), 0) forSelector:"runDiagnostics:configuration:uuid:reply:" argumentIndex:1 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"runDiagnostics:configuration:uuid:reply:" argumentIndex:2 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"runDiagnostics:configuration:uuid:reply:" argumentIndex:0 ofReply:1];
  uint64_t v9 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(), 0) forSelector:"runDiagnostics:configuration:uuid:reply:" argumentIndex:1 ofReply:1];
  uint64_t v10 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(), 0) forSelector:"runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:" argumentIndex:0 ofReply:0];
  uint64_t v11 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0) forSelector:"runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:" argumentIndex:1 ofReply:0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0) forSelector:"runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:" argumentIndex:2 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:" argumentIndex:3 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:" argumentIndex:0 ofReply:1];
  uint64_t v17 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, objc_opt_class(), 0) forSelector:"runDiagnosticsForPeer:diagnostics:configuration:uuid:reply:" argumentIndex:1 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"registerRemoteDiagnosticEventsForPeer:configuration:reply:" argumentIndex:0 ofReply:0];
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, v19, v20, v21, objc_opt_class(), 0) forSelector:"registerRemoteDiagnosticEventsForPeer:configuration:reply:" argumentIndex:1 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"registerRemoteDiagnosticEventsForPeer:configuration:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"unregisterRemoteDiagnosticEventsForPeer:configuration:reply:" argumentIndex:0 ofReply:0];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v22, v23, v24, v25, objc_opt_class(), 0) forSelector:"unregisterRemoteDiagnosticEventsForPeer:configuration:reply:" argumentIndex:1 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"unregisterRemoteDiagnosticEventsForPeer:configuration:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryRegisteredDiagnosticsPeersWithReply:" argumentIndex:0 ofReply:1];
  uint64_t v26 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v26, objc_opt_class(), 0) forSelector:"queryRegisteredDiagnosticsPeersWithReply:" argumentIndex:1 ofReply:1];
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  uint64_t v31 = objc_opt_class();
  uint64_t v32 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v27, v28, v29, v30, v31, v32, objc_opt_class(), 0) forSelector:"startDiagnosticsModeWithConfiguration:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"startDiagnosticsModeWithConfiguration:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"startDiagnosticsModeWithConfiguration:reply:" argumentIndex:1 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"stopDiagnosticsModeWithUUID:info:reply:" argumentIndex:0 ofReply:0];
  uint64_t v33 = objc_opt_class();
  uint64_t v34 = objc_opt_class();
  uint64_t v35 = objc_opt_class();
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v33, v34, v35, v36, v37, v38, objc_opt_class(), 0) forSelector:"stopDiagnosticsModeWithUUID:info:reply:" argumentIndex:1 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"stopDiagnosticsModeWithUUID:info:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryDiagnosticsModeForPeer:info:reply:" argumentIndex:0 ofReply:0];
  uint64_t v39 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v39, v40, v41, objc_opt_class(), 0) forSelector:"queryDiagnosticsModeForPeer:info:reply:" argumentIndex:1 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryDiagnosticsModeForPeer:info:reply:" argumentIndex:0 ofReply:1];
  uint64_t v42 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v42, v43, v44, v45, v46, objc_opt_class(), 0) forSelector:"queryDiagnosticsModeForPeer:info:reply:" argumentIndex:1 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryDebugConfigurationForPeer:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryDebugConfigurationForPeer:reply:" argumentIndex:0 ofReply:1];
  uint64_t v47 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v47, objc_opt_class(), 0) forSelector:"queryDebugConfigurationForPeer:reply:" argumentIndex:1 ofReply:1];
  uint64_t v48 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v48, objc_opt_class(), 0) forSelector:"setDebugConfiguration:peer:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"setDebugConfiguration:peer:reply:" argumentIndex:1 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"setDebugConfiguration:peer:reply:" argumentIndex:0 ofReply:1];
  uint64_t v49 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v49, objc_opt_class(), 0) forSelector:"collectLogs:configuration:uuid:reply:" argumentIndex:0 ofReply:0];
  uint64_t v50 = objc_opt_class();
  uint64_t v51 = objc_opt_class();
  uint64_t v52 = objc_opt_class();
  uint64_t v53 = objc_opt_class();
  uint64_t v54 = objc_opt_class();
  uint64_t v55 = objc_opt_class();
  uint64_t v56 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v50, v51, v52, v53, v54, v55, v56, objc_opt_class(), 0) forSelector:"collectLogs:configuration:uuid:reply:" argumentIndex:1 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"collectLogs:configuration:uuid:reply:" argumentIndex:2 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"collectLogs:configuration:uuid:reply:" argumentIndex:0 ofReply:1];
  uint64_t v57 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v57, objc_opt_class(), 0) forSelector:"collectLogs:configuration:uuid:reply:" argumentIndex:1 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"collectLogs:configuration:uuid:reply:" argumentIndex:2 ofReply:1];
  uint64_t v58 = objc_opt_class();
  uint64_t v59 = objc_opt_class();
  uint64_t v60 = objc_opt_class();
  uint64_t v61 = objc_opt_class();
  uint64_t v62 = objc_opt_class();
  uint64_t v63 = objc_opt_class();
  uint64_t v64 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v58, v59, v60, v61, v62, v63, v64, objc_opt_class(), 0) forSelector:"collectLogsDiagnosticMode:uuid:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"collectLogsDiagnosticMode:uuid:reply:" argumentIndex:1 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"collectLogsDiagnosticMode:uuid:reply:" argumentIndex:0 ofReply:1];
  uint64_t v65 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v65, objc_opt_class(), 0) forSelector:"collectLogsDiagnosticMode:uuid:reply:" argumentIndex:1 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"collectLogsDiagnosticMode:uuid:reply:" argumentIndex:2 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"startPeerDiscoveryWithConfiguration:uuid:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"startPeerDiscoveryWithConfiguration:uuid:reply:" argumentIndex:1 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"startPeerDiscoveryWithConfiguration:uuid:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"stopPeerDiscoveryWithUUID:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"stopPeerDiscoveryWithUUID:reply:" argumentIndex:0 ofReply:1];
  uint64_t v66 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v66, objc_opt_class(), 0) forSelector:"runWiFiSnifferOnChannels:duration:peer:uuid:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"runWiFiSnifferOnChannels:duration:peer:uuid:reply:" argumentIndex:2 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"runWiFiSnifferOnChannels:duration:peer:uuid:reply:" argumentIndex:3 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"runWiFiSnifferOnChannels:duration:peer:uuid:reply:" argumentIndex:0 ofReply:1];
  uint64_t v67 = objc_opt_class();
  uint64_t v68 = objc_opt_class();
  uint64_t v69 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v67, v68, v69, objc_opt_class(), 0) forSelector:"runWiFiSnifferOnChannels:duration:peer:uuid:reply:" argumentIndex:1 ofReply:1];
  uint64_t v70 = objc_opt_class();
  uint64_t v71 = objc_opt_class();
  uint64_t v72 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v70, v71, v72, objc_opt_class(), 0) forSelector:"runWiFiSnifferOnChannels:duration:peer:uuid:reply:" argumentIndex:2 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"runWiFiSnifferOnChannels:duration:peer:uuid:reply:" argumentIndex:3 ofReply:1];
  uint64_t v73 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v73, objc_opt_class(), 0) forSelector:"runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:" argumentIndex:2 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:" argumentIndex:3 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:" argumentIndex:0 ofReply:1];
  uint64_t v74 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v74, objc_opt_class(), 0) forSelector:"runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:" argumentIndex:1 ofReply:1];
  uint64_t v75 = objc_opt_class();
  uint64_t v76 = objc_opt_class();
  uint64_t v77 = objc_opt_class();
  uint64_t v78 = objc_opt_class();
  uint64_t v79 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v75, v76, v77, v78, v79, objc_opt_class(), 0) forSelector:"runWiFiPerformanceLoggingWithConfiguration:uuid:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"runWiFiPerformanceLoggingWithConfiguration:uuid:reply:" argumentIndex:1 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"runWiFiPerformanceLoggingWithConfiguration:uuid:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"cancelRequestWithUUID:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"cancelRequestWithUUID:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"cancelRequestWithUUID:OnPeer:OfType:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"cancelRequestWithUUID:OnPeer:OfType:reply:" argumentIndex:1 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"cancelRequestWithUUID:OnPeer:OfType:reply:" argumentIndex:2 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"cancelRequestWithUUID:OnPeer:OfType:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"cancelAllRequestsAndReply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"log:timestamp:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"startMonitoringFaultEventsForPeer:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"startMonitoringFaultEventsForPeer:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"stopMonitoringFaultEventsForPeer:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"stopMonitoringFaultEventsForPeer:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"submitFaultEvent:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"submitFaultEvent:reply:" argumentIndex:0 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryFaultEventCacheForPeer:reply:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryFaultEventCacheForPeer:reply:" argumentIndex:0 ofReply:1];
  uint64_t v80 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v80, objc_opt_class(), 0) forSelector:"queryFaultEventCacheForPeer:reply:" argumentIndex:1 ofReply:1];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryDatabaseForPeer:fetch:reply:" argumentIndex:0 ofReply:0];
  uint64_t v81 = objc_opt_class();
  uint64_t v82 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v81, v82, objc_opt_class(), 0) forSelector:"queryDatabaseForPeer:fetch:reply:" argumentIndex:1 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"queryDatabaseForPeer:fetch:reply:" argumentIndex:0 ofReply:1];
  uint64_t v83 = objc_opt_class();
  uint64_t v84 = objc_opt_class();
  uint64_t v85 = objc_opt_class();
  uint64_t v86 = objc_opt_class();
  uint64_t v87 = objc_opt_class();
  uint64_t v88 = objc_opt_class();
  uint64_t v89 = objc_opt_class();
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", v83, v84, v85, v86, v87, v88, v89, objc_opt_class(), 0) forSelector:"queryDatabaseForPeer:fetch:reply:" argumentIndex:1 ofReply:1];
  return v0;
}

NSXPCInterface *sub_100035464()
{
  uint64_t v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___W5XPCEventDelegate];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"receivedEvent:" argumentIndex:0 ofReply:0];
  [(NSXPCInterface *)v0 setClasses:+[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0) forSelector:"receivedPeerDiscoveryEvent:" argumentIndex:0 ofReply:0];
  return v0;
}

id sub_100035644(uint64_t a1)
{
  id v2 = [objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "corewifi") networkName];
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [v3 __initialTests];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1000356F0;
  v6[3] = &unk_1000DE478;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = v2;
  return [v3 __runDiagnosticsTests:v4 reply:v6];
}

void sub_1000356F0(uint64_t a1, uint64_t a2)
{
  block[0] = _NSConcreteStackBlock;
  long long v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[1] = 3221225472;
  block[2] = sub_10003576C;
  block[3] = &unk_1000DE450;
  uint64_t v6 = a2;
  long long v5 = v2;
  dispatch_async(v3, block);
}

void sub_10003576C(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 48))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    uint64_t v3 = *(void *)(a1 + 32);
    if (v4 - *(double *)(v3 + 56) > 0.0)
    {
      uint64_t v5 = *(void *)(a1 + 48);
      if (v5 < 1)
      {
        *(void *)(v3 + 64) = v5;
        uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 40);
        dispatch_time_t v10 = dispatch_time(0, 10000000000);
        dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      else
      {
        dispatch_time_t v6 = dispatch_time(0, 2000000000);
        v11[0] = _NSConcreteStackBlock;
        long long v7 = *(_OWORD *)(a1 + 32);
        uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
        v11[1] = 3221225472;
        v11[2] = sub_100035880;
        v11[3] = &unk_1000DDC30;
        long long v12 = v7;
        dispatch_after(v6, v8, v11);
      }
    }
  }
}

void sub_100035880(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 48))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    uint64_t v3 = *(double **)(a1 + 32);
    if (v4 - v3[7] > 0.0)
    {
      id v5 = [*(id *)(a1 + 32) __followupTests];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      void v6[2] = sub_100035950;
      v6[3] = &unk_1000DE478;
      long long v7 = *(_OWORD *)(a1 + 32);
      [v3 __runDiagnosticsTests:v5 reply:v6];
    }
  }
}

void sub_100035950(uint64_t a1, uint64_t a2)
{
  block[0] = _NSConcreteStackBlock;
  long long v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[1] = 3221225472;
  block[2] = sub_1000359CC;
  block[3] = &unk_1000DE450;
  uint64_t v6 = a2;
  long long v5 = v2;
  dispatch_async(v3, block);
}

void sub_1000359CC(void *a1)
{
  if (*(unsigned char *)(a1[4] + 48))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    uint64_t v3 = a1[4];
    if (v4 - *(double *)(v3 + 56) > 0.0)
    {
      uint64_t v5 = a1[6];
      if (v5 >= 1 && v5 != *(void *)(v3 + 64))
      {
        id v6 = +[NSMutableDictionary dictionary];
        [v6 setObject:[objc_msgSend(*(id *)(a1[4] + 16), "wifi") interfaceName] forKeyedSubscript:@"InterfaceName"];
        [v6 setObject:+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a1[6]) forKeyedSubscript:@"WiFiDropReason"];
        id v7 = a1[5]
           ? [objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1[4] + 24), "diagnosticsHistory"), "objectForKey:", a1[5]), "allValues")]: 0;
        [v6 setObject:v7 forKeyedSubscript:@"DiagnosticsTestResults"];
        id v8 = objc_alloc_init((Class)W5Event);
        [v8 setEventID:35];
        +[NSDate timeIntervalSinceReferenceDate];
        [v8 setTimestamp:];
        [v8 setInfo:v6];
        uint64_t v3 = a1[4];
        uint64_t v9 = *(void *)(v3 + 72);
        if (v9)
        {
          (*(void (**)(uint64_t, id))(v9 + 16))(v9, v8);
          uint64_t v3 = a1[4];
        }
      }
      *(void *)(v3 + 64) = a1[6];
      dispatch_time_t v10 = *(NSObject **)(a1[4] + 40);
      dispatch_time_t v11 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
}

void sub_100035CD4(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 72) = [*(id *)(a1 + 40) copy];
}

void sub_100035DFC(uint64_t a1, uint64_t a2, void *a3)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v15 = a1;
    uint64_t v7 = 7;
    uint64_t v8 = *(void *)v18;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(a3);
        }
        dispatch_time_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v9);
        if ((objc_msgSend(v10, "didPass", v15) & 1) == 0)
        {
          id v11 = [v10 testID];
          switch((unint64_t)v11)
          {
            case 3uLL:
              if (v7 >= 2) {
                uint64_t v7 = 2;
              }
              break;
            case 4uLL:
            case 5uLL:
            case 8uLL:
            case 0xAuLL:
              break;
            case 6uLL:
              if (v7 >= 3) {
                uint64_t v7 = 3;
              }
              break;
            case 7uLL:
              if (v7 >= 5) {
                uint64_t v7 = 5;
              }
              break;
            case 9uLL:
              if (v7 >= 4) {
                uint64_t v7 = 4;
              }
              break;
            case 0xBuLL:
              if (v7 >= 6) {
                uint64_t v7 = 6;
              }
              break;
            default:
              if (v11 == (id)52) {
                uint64_t v7 = 1;
              }
              break;
          }
        }
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      id v12 = [a3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      id v6 = v12;
    }
    while (v12);
    if (v7 >= 7) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = v7;
    }
    a1 = v15;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036034;
  block[3] = &unk_1000DE4A0;
  void block[5] = *(void *)(a1 + 40);
  void block[6] = v13;
  void block[4] = a3;
  dispatch_async(v14, block);
}

void sub_100036034(void *a1)
{
  uint64_t v3 = a1[5];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[6], a1[4]);
  }
}

void sub_1000362FC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 48))
  {
    *(unsigned char *)(v3 + 4_Block_object_dispose(&STACK[0x310], 8) = 1;
    double v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    if (v4) {
      dispatch_source_set_timer(v4, 0, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
}

void sub_1000363DC(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 48))
  {
    *(unsigned char *)(v3 + 4_Block_object_dispose(&STACK[0x310], 8) = 0;
    double v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
    if (v4) {
      dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
}

void sub_1000364B8(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(NSObject **)(v3 + 40);
  if (v4)
  {
    dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    uint64_t v3 = *(void *)(a1 + 32);
  }
  *(void *)(v3 + 56) = 0x7FEFFFFFFFFFFFFFLL;
}

void sub_100036594(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 48))
  {
    double v4 = *(double *)(v3 + 56);
    +[NSDate timeIntervalSinceReferenceDate];
    double v5 = *(double *)(a1 + 40);
    if (v4 > v6 + v5)
    {
      uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 40);
      if (v7)
      {
        dispatch_time_t v8 = dispatch_time(0, (uint64_t)((v5 + 1.0) * 1000000000.0));
        dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      +[NSDate timeIntervalSinceReferenceDate];
      *(double *)(*(void *)(a1 + 32) + 56) = v9 + *(double *)(a1 + 40);
    }
  }
}

void sub_100036D14(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = [*(id *)(a1 + 40) copy];
}

void sub_100036E10(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 40) = [*(id *)(a1 + 40) copy];
}

void sub_100036F3C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 24))
  {
    *(unsigned char *)(v3 + 24) = 1;
    id v4 = *(id *)(a1 + 32);
    int out_token = 0;
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = *(NSObject **)(v5 + 8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100037074;
    handler[3] = &unk_1000DE4F0;
    handler[4] = v5;
    notify_register_dispatch("com.apple.system.powersources.source", &out_token, v6, handler);
    *(_DWORD *)(*(void *)(a1 + 32) + 16) = out_token;
    uint64_t v7 = *(void *)(a1 + 32);
    dispatch_time_t v8 = *(NSObject **)(v7 + 8);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10003727C;
    v9[3] = &unk_1000DE4F0;
    void v9[4] = v7;
    notify_register_dispatch("com.apple.system.powersources.lowbattery", &out_token, v8, v9);
    *(_DWORD *)(*(void *)(a1 + 32) + 20) = out_token;
  }
}

void sub_100037074(uint64_t a1)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000370FC;
  block[3] = &unk_1000DDC80;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

void sub_1000370FC(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)W5Event);
  [v3 setEventID:15];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTimestamp:];
  v5[0] = @"PowerSourceType";
  v6[0] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) powerSourceType]);
  v5[1] = @"BatteryEstimatedTime";
  [*(id *)(a1 + 32) estimatedTimeRemaining];
  v6[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[2] = @"BatteryLevel";
  [*(id *)(a1 + 32) internalBatteryLevel];
  void v6[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[3] = @"BatteryWarningLevel";
  v6[3] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 32) batteryWarningLevel]);
  [v3 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 4)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_10003727C(uint64_t a1)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100037304;
  block[3] = &unk_1000DDC80;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

void sub_100037304(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)W5Event);
  [v3 setEventID:17];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTimestamp:];
  v5[0] = @"PowerSourceType";
  v6[0] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 32) powerSourceType]);
  v5[1] = @"BatteryEstimatedTime";
  [*(id *)(a1 + 32) estimatedTimeRemaining];
  v6[1] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[2] = @"BatteryLevel";
  [*(id *)(a1 + 32) internalBatteryLevel];
  void v6[2] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v5[3] = @"BatteryWarningLevel";
  v6[3] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 32) batteryWarningLevel]);
  [v3 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v6, v5, 4)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 40);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_1000374F8(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 24))
  {
    *(unsigned char *)(v3 + 24) = 0;
    notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 16));
    notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 20));
  }
}

void sub_100037764(uint64_t a1)
{
  *(CFTimeInterval *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = IOPSGetTimeRemainingEstimate();
}

void sub_10003785C(uint64_t a1)
{
  uint64_t v3 = (__CFString *)IOPSGetProvidingPowerSourceType(0);
  if ([(__CFString *)v3 isEqualToString:@"AC Power"])
  {
    uint64_t v4 = 1;
  }
  else if ([(__CFString *)v3 isEqualToString:@"Battery Power"])
  {
    uint64_t v4 = 2;
  }
  else
  {
    if (![(__CFString *)v3 isEqualToString:@"UPS Power"]) {
      goto LABEL_8;
    }
    uint64_t v4 = 3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
LABEL_8:
}

void sub_1000379B0(uint64_t a1)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = IOPSGetBatteryWarningLevel();
}

void sub_100037B5C(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)W5DebugConfiguration);
  uint64_t v50 = 0;
  uint64_t v51 = &v50;
  uint64_t v52 = 0x3052000000;
  uint64_t v53 = sub_1000383EC;
  uint64_t v54 = sub_1000383FC;
  uint64_t v55 = 0;
  uint64_t v46 = 0;
  uint64_t v47 = &v46;
  uint64_t v48 = 0x2020000000;
  char v49 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x3052000000;
  uint64_t v43 = sub_1000383EC;
  uint64_t v44 = sub_1000383FC;
  uint64_t v45 = 0;
  uint64_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = *(void **)(a1 + 32);
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100038408;
  v39[3] = &unk_1000DD9D0;
  v39[5] = &v50;
  v39[6] = &v46;
  v39[4] = v4;
  [v5 queryWiFiDebugLoggingAndReply:v39];
  dispatch_time_t v6 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v4, v6) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v57 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  dispatch_time_t v8 = v51;
  double v9 = (void *)v51[5];
  if (v9) {
    goto LABEL_48;
  }
  if (*((unsigned char *)v47 + 24)) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = -1;
  }
  id v11 = *(void **)(a1 + 32);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  void v38[2] = sub_100038460;
  v38[3] = &unk_1000DD9D0;
  v38[5] = &v50;
  v38[6] = &v46;
  v38[4] = v4;
  [v11 __queryMegaWiFiProfileInstalledAndReply:v38];
  dispatch_time_t v12 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v4, v12) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v57 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  dispatch_time_t v8 = v51;
  double v9 = (void *)v51[5];
  if (v9) {
    goto LABEL_48;
  }
  if (*((unsigned char *)v47 + 24)) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = -1;
  }
  uint64_t v14 = *(void **)(a1 + 32);
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000384B8;
  v37[3] = &unk_1000DD9D0;
  v37[5] = &v50;
  v37[6] = &v46;
  v37[4] = v4;
  [v14 __queryNoLoggingWiFiProfileInstalledAndReply:v37];
  dispatch_time_t v15 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v4, v15) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v57 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  dispatch_time_t v8 = v51;
  double v9 = (void *)v51[5];
  if (v9) {
    goto LABEL_48;
  }
  if (*((unsigned char *)v47 + 24)) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = -1;
  }
  long long v17 = *(void **)(a1 + 32);
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100038510;
  v36[3] = &unk_1000DD9D0;
  v36[5] = &v50;
  v36[6] = &v46;
  v36[4] = v4;
  [v17 queryEAPOLDebugLoggingAndReply:v36];
  dispatch_time_t v18 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v4, v18) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v57 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  dispatch_time_t v8 = v51;
  double v9 = (void *)v51[5];
  if (v9) {
    goto LABEL_48;
  }
  if (*((unsigned char *)v47 + 24)) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = -1;
  }
  long long v20 = *(void **)(a1 + 32);
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100038568;
  v35[3] = &unk_1000DD9D0;
  v35[5] = &v50;
  v35[6] = &v46;
  v35[4] = v4;
  [v20 queryBluetoothDebugLoggingAndReply:v35];
  dispatch_time_t v21 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v4, v21) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v57 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  dispatch_time_t v8 = v51;
  double v9 = (void *)v51[5];
  if (v9) {
    goto LABEL_48;
  }
  if (*((unsigned char *)v47 + 24)) {
    uint64_t v22 = 1;
  }
  else {
    uint64_t v22 = -1;
  }
  uint64_t v23 = *(void **)(a1 + 32);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000385C0;
  v34[3] = &unk_1000DD9D0;
  v34[5] = &v50;
  v34[6] = &v46;
  v34[4] = v4;
  [v23 querySTBCAndReply:v34];
  dispatch_time_t v24 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v4, v24) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v57 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  dispatch_time_t v8 = v51;
  double v9 = (void *)v51[5];
  if (v9) {
    goto LABEL_48;
  }
  uint64_t v25 = *((unsigned char *)v47 + 24) ? 1 : -1;
  uint64_t v26 = *(void **)(a1 + 32);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100038618;
  v33[3] = &unk_1000DE518;
  v33[5] = &v50;
  v33[6] = &v40;
  v33[4] = v4;
  [v26 queryDiagnosticsModeAndReply:v33];
  dispatch_time_t v27 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v4, v27) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v57 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  dispatch_time_t v8 = v51;
  double v9 = (void *)v51[5];
  if (v9
    || (id v28 = objc_alloc((Class)W5DebugConfiguration),
        v7 = [v28 initDiagnosticsMode:v41[5] wifiState:v10 megaWiFiProfileState:v13 noLoggingWiFiProfileState:v16 eapolState:v19 bluetoothState:v22 stbcState:v25], dispatch_time_t v8 = v51, (v9 = (void *)v51[5]) != 0))
  {
LABEL_48:
    uint64_t v29 = *(void *)(a1 + 40);
    if (v29)
    {
      id v30 = [v9 copy:v7];
      id v7 = 0;
LABEL_52:
      (*(void (**)(uint64_t, id, id))(v29 + 16))(v29, v30, v7);
      dispatch_time_t v8 = v51;
    }
  }
  else
  {
    uint64_t v29 = *(void *)(a1 + 40);
    if (v29)
    {
      id v30 = 0;
      goto LABEL_52;
    }
  }
  id v31 = (id)v8[5];
  id v32 = (id)v41[5];
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
}

void sub_1000383B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_1000383EC(uint64_t a1, uint64_t a2)
{
}

void sub_1000383FC(uint64_t a1)
{
}

intptr_t sub_100038408(void *a1, void *a2, char a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

intptr_t sub_100038460(void *a1, void *a2, char a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

intptr_t sub_1000384B8(void *a1, void *a2, char a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

intptr_t sub_100038510(void *a1, void *a2, char a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

intptr_t sub_100038568(void *a1, void *a2, char a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

intptr_t sub_1000385C0(void *a1, void *a2, char a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

intptr_t sub_100038618(void *a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(void *)(*(void *)(a1[6] + 8) + 40) = a3;
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

void sub_10003887C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

intptr_t sub_1000388A0(void *a1, void *a2, void *a3)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 copy];
  *(void *)(*(void *)(a1[6] + 8) + 40) = [a3 copy];
  uint64_t v5 = a1[4];

  return dispatch_semaphore_signal(v5);
}

void sub_100038978(uint64_t a1)
{
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3052000000;
  uint64_t v40 = sub_1000383EC;
  uint64_t v41 = sub_1000383FC;
  uint64_t v42 = 0;
  id v3 = dispatch_semaphore_create(0);
  if (![*(id *)(a1 + 32) wifi]) {
    goto LABEL_40;
  }
  uint64_t v4 = *(void **)(a1 + 40);
  BOOL v5 = [*(id *)(a1 + 32) wifi] == (id)1;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10003919C;
  v36[3] = &unk_1000DE568;
  v36[4] = v3;
  v36[5] = &v37;
  [v4 setWiFiDebugLoggingEnabled:v5 reply:v36];
  dispatch_time_t v6 = dispatch_time(0, 4000000000);
  if (dispatch_semaphore_wait(v3, v6) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134349056;
    uint64_t v44 = 0x4010000000000000;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
  }
  if (!v38[5])
  {
LABEL_40:
    if (![*(id *)(a1 + 32) megaWiFiProfile]) {
      goto LABEL_41;
    }
    id v7 = *(void **)(a1 + 40);
    BOOL v8 = [*(id *)(a1 + 32) megaWiFiProfile] == (id)1;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1000391E4;
    v35[3] = &unk_1000DE568;
    v35[4] = v3;
    v35[5] = &v37;
    [v7 __setMegaWiFiProfileInstalled:v8 reply:v35];
    dispatch_time_t v9 = dispatch_time(0, 4000000000);
    if (dispatch_semaphore_wait(v3, v9) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v44 = 0x4010000000000000;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
    }
    if (!v38[5])
    {
LABEL_41:
      if (![*(id *)(a1 + 32) noLoggingWiFiProfile]) {
        goto LABEL_42;
      }
      uint64_t v10 = *(void **)(a1 + 40);
      BOOL v11 = [*(id *)(a1 + 32) noLoggingWiFiProfile] == (id)1;
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_10003922C;
      v34[3] = &unk_1000DE568;
      v34[4] = v3;
      v34[5] = &v37;
      [v10 __setNoLoggingWiFiProfileInstalled:v11 reply:v34];
      dispatch_time_t v12 = dispatch_time(0, 4000000000);
      if (dispatch_semaphore_wait(v3, v12) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v44 = 0x4010000000000000;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
      }
      if (!v38[5])
      {
LABEL_42:
        if (![*(id *)(a1 + 32) eapol]) {
          goto LABEL_43;
        }
        uint64_t v13 = *(void **)(a1 + 40);
        BOOL v14 = [*(id *)(a1 + 32) eapol] == (id)1;
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_100039274;
        v33[3] = &unk_1000DE568;
        v33[4] = v3;
        v33[5] = &v37;
        [v13 setEAPOLDebugLoggingEnabled:v14 reply:v33];
        dispatch_time_t v15 = dispatch_time(0, 4000000000);
        if (dispatch_semaphore_wait(v3, v15) >= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349056;
          uint64_t v44 = 0x4010000000000000;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
        }
        if (!v38[5])
        {
LABEL_43:
          if ([*(id *)(a1 + 32) bluetooth])
          {
            uint64_t v16 = *(void **)(a1 + 40);
            BOOL v17 = [*(id *)(a1 + 32) bluetooth] == (id)1;
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_1000392BC;
            v32[3] = &unk_1000DE568;
            v32[4] = v3;
            v32[5] = &v37;
            [v16 setBluetoothDebugLoggingEnabled:v17 reply:v32];
            dispatch_time_t v18 = dispatch_time(0, 4000000000);
            if (dispatch_semaphore_wait(v3, v18) >= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349056;
              uint64_t v44 = 0x4010000000000000;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
            }
          }
          if ([*(id *)(a1 + 32) stbc])
          {
            uint64_t v19 = *(void **)(a1 + 40);
            BOOL v20 = [*(id *)(a1 + 32) stbc] == (id)1;
            v31[0] = _NSConcreteStackBlock;
            v31[1] = 3221225472;
            v31[2] = sub_100039304;
            v31[3] = &unk_1000DE568;
            v31[4] = v3;
            v31[5] = &v37;
            [v19 setSTBCEnabled:v20 reply:v31];
            dispatch_time_t v21 = dispatch_time(0, 4000000000);
            if (dispatch_semaphore_wait(v3, v21) >= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349056;
              uint64_t v44 = 0x4010000000000000;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
            }
          }
          uint64_t v22 = sub_10009756C();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = [*(id *)(a1 + 32) diagnosticsMode];
            *(_DWORD *)buf = 136315906;
            uint64_t v44 = (uint64_t)"-[W5DebugManager setDebugConfiguration:reply:]_block_invoke";
            __int16 v45 = 2080;
            uint64_t v46 = "W5DebugManager.m";
            __int16 v47 = 1024;
            int v48 = 342;
            __int16 v49 = 2114;
            id v50 = v23;
            LODWORD(v29) = 38;
            id v28 = buf;
            _os_log_send_and_compose_impl();
          }
          if (objc_msgSend(*(id *)(a1 + 32), "diagnosticsMode", v28, v29))
          {
            dispatch_time_t v24 = *(void **)(a1 + 40);
            id v25 = [*(id *)(a1 + 32) diagnosticsMode];
            v30[0] = _NSConcreteStackBlock;
            v30[1] = 3221225472;
            v30[2] = sub_10003934C;
            v30[3] = &unk_1000DE568;
            v30[4] = v3;
            v30[5] = &v37;
            [v24 setDiagnosticsMode:v25 reply:v30];
            dispatch_time_t v26 = dispatch_time(0, 4000000000);
            if (dispatch_semaphore_wait(v3, v26) >= 1
              && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134349056;
              uint64_t v44 = 0x4010000000000000;
              _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] FAILED to complete operation within %{public}.1fs, continuing", buf, 0xCu);
            }
          }
        }
      }
    }
  }
  uint64_t v27 = *(void *)(a1 + 48);
  if (v27) {
    (*(void (**)(uint64_t, id))(v27 + 16))(v27, [(id)v38[5] copy]);
  }
  _Block_object_dispose(&v37, 8);
}

void sub_100039174(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10003919C(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  id v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

intptr_t sub_1000391E4(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  id v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

intptr_t sub_10003922C(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  id v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

intptr_t sub_100039274(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  id v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

intptr_t sub_1000392BC(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  id v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

intptr_t sub_100039304(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  id v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

intptr_t sub_10003934C(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [a2 copy];
  id v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

void sub_1000394A8(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) activeDiagnostics];
  if (v3) {
    id v4 = [v3 firstObject];
  }
  else {
    id v4 = 0;
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v4);
  }
}

void sub_1000395B4(void *a1)
{
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 16);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100039648;
  v5[3] = &unk_1000DDBE0;
  void v5[4] = a1[6];
  [v4 updateDiagnosticsMode:v3 reply:v5];
}

uint64_t sub_100039648(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100039924(uint64_t a1)
{
  uint64_t v3 = (const void *)WiFiManagerClientCreate();
  CFBooleanRef v4 = (const __CFBoolean *)WiFiManagerClientCopyProperty();
  if (v4)
  {
    CFBooleanRef v5 = v4;
    BOOL v6 = CFBooleanGetValue(v4) != 0;
    CFRelease(v5);
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = [objc_alloc((Class)OSLogPreferencesSubsystem) initWithName:@"com.apple.WiFiManager"];
  if (!v6 || (BOOL v8 = v7, [v7 effectiveEnabledLevel] != (id)4))
  {
    BOOL v9 = 0;
    if (!v3) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  BOOL v9 = [v8 effectivePersistedLevel] == (id)4;
  if (v3) {
LABEL_9:
  }
    CFRelease(v3);
LABEL_10:
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, void, BOOL))(v10 + 16))(v10, 0, v9);
  }
}

void sub_100039AC8(uint64_t a1)
{
  uint64_t v3 = (const void *)WiFiManagerClientCreate();
  WiFiManagerClientSetProperty();
  id v4 = [objc_alloc((Class)OSLogPreferencesSubsystem) initWithName:@"com.apple.WiFiManager"];
  CFBooleanRef v5 = v4;
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 1;
  }
  [v4 setPersistedLevel:v6];
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 1;
  }
  [v5 setEnabledLevel:v7];
  if (*(unsigned char *)(a1 + 48)) {
    CFStringRef v8 = @"debug";
  }
  else {
    CFStringRef v8 = @"inherit";
  }
  [*(id *)(a1 + 32) setOSLogPreferenceLevel:v8 enableOvserizeMessages:1 subsystem:@"com.apple.WiFiManager"];
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
  if (v3) {
    CFRelease(v3);
  }
}

void sub_100039E8C(uint64_t a1)
{
  id v3 = [objc_alloc((Class)OSLogPreferencesSubsystem) initWithName:@"com.apple.eapol"];
  BOOL v4 = objc_msgSend(*(id *)(a1 + 32), "__getEAPOLDebugFlagsEnabled")
    && [v3 effectiveEnabledLevel] == (id)4
    && [v3 effectivePersistedLevel] == (id)4;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, BOOL))(v5 + 16))(v5, 0, v4);
  }
}

void sub_100039FD4(uint64_t a1)
{
  id v3 = [objc_alloc((Class)OSLogPreferencesSubsystem) initWithName:@"com.apple.eapol"];
  BOOL v4 = v3;
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 1;
  }
  [v3 setPersistedLevel:v5];
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 1;
  }
  [v4 setEnabledLevel:v6];
  if (*(unsigned char *)(a1 + 48)) {
    CFStringRef v7 = @"debug";
  }
  else {
    CFStringRef v7 = @"inherit";
  }
  [*(id *)(a1 + 32) setOSLogPreferenceLevel:v7 enableOvserizeMessages:1 subsystem:@"com.apple.eapol"];
  uint64_t v9 = 0;
  [*(id *)(a1 + 32) __setEAPOLDebugFlagsEnabled:*(unsigned __int8 *)(a1 + 48) error:&v9];
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, v9);
  }
}

void sub_10003A164(uint64_t a1)
{
  CFStringRef v3 = SCDynamicStoreKeyCreate(kCFAllocatorDefault, @"State:/Network/mDNSResponder/DebugState");
  if (v3)
  {
    CFStringRef v4 = v3;
    uint64_t v5 = (void *)SCDynamicStoreCopyValue(0, v3);
    if (v5)
    {
      uint64_t v6 = v5;
      id v7 = [[v5 objectForKey:@"VerboseLogging"] boolValue];
      CFRelease(v6);
      uint64_t v8 = 0;
    }
    else
    {
      NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v11 = @"SCError()";
      uint64_t v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCFErrorDomainSystemConfiguration, SCError(), +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1]);
      id v7 = 0;
    }
    CFRelease(v4);
  }
  else
  {
    NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v13 = @"SCError()";
    uint64_t v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", kCFErrorDomainSystemConfiguration, SCError(), +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1]);
    id v7 = 0;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, NSError *, id))(v9 + 16))(v9, v8, v7);
  }
}

void *sub_10003A3A4(void *result, uint64_t a2, int a3)
{
  if (*((unsigned __int8 *)result + 56) != a3)
  {
    CFStringRef v4 = (void *)result[4];
    uint64_t v3 = result[5];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10003A428;
    v5[3] = &unk_1000DDBE0;
    void v5[4] = result[6];
    return [v4 __toggleDNSLoggingWithQueue:v3 reply:v5];
  }
  return result;
}

uint64_t sub_10003A428(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10003A630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003A650(uint64_t a1, int a2, uint64_t a3)
{
  if (a2)
  {
    dispatch_io_close(*(dispatch_io_t *)(a1 + 32), 0);
    uint64_t v4 = *(void *)(a1 + 56);
    if (v4)
    {
      uint64_t v5 = *(void (**)(void))(v4 + 16);
      v5();
    }
  }
  else
  {
    [*(id *)(a1 + 40) appendData:a3];
    id v8 = [[[objc_alloc((Class)NSString) initWithData:*(void *)(a1 + 40) encoding:4] componentsSeparatedByString:@"\n"];
    [*(id *)(a1 + 40) setData:[objc_msgSend(objc_msgSend(v8, "lastObject"), "dataUsingEncoding:", 4)];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        NSErrorUserInfoKey v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          CFStringRef v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v12);
          if ([*(id *)(a1 + 48) count])
          {
            unint64_t v14 = 0;
            do
            {
              if ([v13 hasSuffix:[*(id *)(a1 + 48) objectAtIndexedSubscript:v14]]) *(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v14;
              ++v14;
              }
            }
            while (v14 < (unint64_t)[*(id *)(a1 + 48) count]);
          }
          NSErrorUserInfoKey v12 = (char *)v12 + 1;
        }
        while (v12 != v10);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

id sub_10003A8F0(uint64_t a1, uint64_t a2)
{
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10003A9BC;
    v4[3] = &unk_1000DDDD0;
    return +[W5DebugManager __setOpenDirectoryLoggingEnabled:1 queue:*(void *)(a1 + 32) reply:v4];
  }
  else
  {
    id result = *(id *)(a1 + 40);
    if (result)
    {
      uint64_t v3 = (uint64_t (*)(void))*((void *)result + 2);
      return (id)v3();
    }
  }
  return result;
}

id sub_10003A9BC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id result = *(id *)(a1 + 40);
    if (result)
    {
      uint64_t v3 = (uint64_t (*)(void))*((void *)result + 2);
      return (id)v3();
    }
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10003AA80;
    v4[3] = &unk_1000DE648;
    return +[W5DebugManager __mostRecentLogWithSuffix:&off_1000EFE10 logPath:@"/var/log/opendirectoryd.log" queue:*(void *)(a1 + 32) reply:v4];
  }
  return result;
}

uint64_t sub_10003AA80(uint64_t a1, uint64_t a2)
{
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t result = *(void *)(a1 + 40);
    if (!result) {
      return result;
    }
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
  }
  else
  {
    +[W5DebugManager __setOpenDirectoryLoggingEnabled:0 queue:*(void *)(a1 + 32) reply:0];
    uint64_t result = *(void *)(a1 + 40);
    if (!result) {
      return result;
    }
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
  }

  return v4();
}

id sub_10003AFA8(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id result = *(id *)(a1 + 40);
    if (result)
    {
      uint64_t v3 = (uint64_t (*)(void))*((void *)result + 2);
      return (id)v3();
    }
  }
  else
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10003B060;
    v4[3] = &unk_1000DDDD0;
    return +[NSTask runTaskWithLaunchPath:*(void *)(a1 + 32) arguments:&off_1000EFE40 reply:v4];
  }
  return result;
}

uint64_t (**sub_10003B060(uint64_t a1, uint64_t a2))(void)
{
  if (!a2) {
    return (uint64_t (**)(void))+[NSTask runTaskWithLaunchPath:*(void *)(a1 + 32) arguments:&off_1000EFE58 reply:*(void *)(a1 + 40)];
  }
  id result = *(uint64_t (***)(void))(a1 + 40);
  if (result) {
    return (uint64_t (**)(void))result[2]();
  }
  return result;
}

uint64_t sub_10003B180(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t result = *(void *)(a1 + 40);
    if (!result) {
      return result;
    }
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    goto LABEL_8;
  }
  id v5 = [objc_alloc((Class)NSString) initWithData:*(void *)(a1 + 32) encoding:4];
  if ([v5 containsString:@"APBrowser*:level=info"]) {
    [v5 containsString:@"APBonjour*:level=info"];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
LABEL_8:
    return v4();
  }
  return result;
}

void sub_10003B2BC(uint64_t a1)
{
  if (objc_opt_class()
    && (v3 = objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "installedProfileIdentifiers"), v10 = 0u, long long v11 = 0u, v12 = 0u, v13 = 0u, (v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16)) != 0))
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) containsString:@"wifi.megawifi"])
        {
          uint64_t v8 = 1;
          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v8 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_13:
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 16))(v9, 0, v8);
  }
}

id sub_10003B480(uint64_t a1, uint64_t a2, int a3)
{
  if (a2 || *(unsigned __int8 *)(a1 + 40) != a3)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      long long v12 = _NSConcreteStackBlock;
      uint64_t v13 = 3221225472;
      unint64_t v14 = sub_10003B5B4;
      long long v15 = &unk_1000DDBE0;
      uint64_t v16 = *(void *)(a1 + 32);
      id v5 = &off_1000EFEA0;
      uint64_t v6 = &v12;
    }
    else
    {
      id v7 = _NSConcreteStackBlock;
      uint64_t v8 = 3221225472;
      uint64_t v9 = sub_10003B5CC;
      long long v10 = &unk_1000DDBE0;
      uint64_t v11 = *(void *)(a1 + 32);
      id v5 = &off_1000EFEB8;
      uint64_t v6 = &v7;
    }
    return +[NSTask runTaskWithLaunchPath:@"/usr/local/bin/profilectl", v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16 arguments reply];
  }
  else
  {
    id result = *(id *)(a1 + 32);
    if (result)
    {
      id v4 = (uint64_t (*)(void))*((void *)result + 2);
      return (id)v4();
    }
  }
  return result;
}

uint64_t sub_10003B5B4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10003B5CC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10003B668(uint64_t a1)
{
  if (objc_opt_class()
    && (v3 = objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "installedProfileIdentifiers"), v10 = 0u, long long v11 = 0u, v12 = 0u, v13 = 0u, (v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16)) != 0))
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) containsString:@"wifi.nologging"])
        {
          uint64_t v8 = 1;
          goto LABEL_13;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      uint64_t v8 = 0;
      if (v5) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
LABEL_13:
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 16))(v9, 0, v8);
  }
}

id sub_10003B82C(uint64_t a1, uint64_t a2, int a3)
{
  if (a2 || *(unsigned __int8 *)(a1 + 40) != a3)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      long long v12 = _NSConcreteStackBlock;
      uint64_t v13 = 3221225472;
      unint64_t v14 = sub_10003B960;
      long long v15 = &unk_1000DDBE0;
      uint64_t v16 = *(void *)(a1 + 32);
      id v5 = &off_1000EFED0;
      uint64_t v6 = &v12;
    }
    else
    {
      id v7 = _NSConcreteStackBlock;
      uint64_t v8 = 3221225472;
      uint64_t v9 = sub_10003B978;
      long long v10 = &unk_1000DDBE0;
      uint64_t v11 = *(void *)(a1 + 32);
      id v5 = &off_1000EFEE8;
      uint64_t v6 = &v7;
    }
    return +[NSTask runTaskWithLaunchPath:@"/usr/local/bin/profilectl", v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16 arguments reply];
  }
  else
  {
    id result = *(id *)(a1 + 32);
    if (result)
    {
      id v4 = (uint64_t (*)(void))*((void *)result + 2);
      return (id)v4();
    }
  }
  return result;
}

uint64_t sub_10003B960(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10003B978(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10003BDEC(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 120) = [*(id *)(a1 + 40) copy];
}

void sub_10003BEE8(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 12_Block_object_dispose(&STACK[0x310], 8) = [*(id *)(a1 + 40) copy];
}

void sub_10003BFB4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) __nextRequest];
}

void sub_10003C184(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) __pendingRequestWithUUID:*(void *)(a1 + 40)];
  if (v3)
  {
    id v4 = v3;
    if ([v3 reply])
    {
      id v5 = (void (**)(id, NSError *, void))[v4 reply];
      NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v15 = @"W5CancelledErr";
      v5[2](v5, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 6, +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1]), 0);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
    [*(id *)(*(void *)(a1 + 32) + 48) removeObject:v4];
  }
  else if (objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "uuid"), "isEqual:", *(void *)(a1 + 40)))
  {
    if ([*(id *)(*(void *)(a1 + 32) + 56) reply])
    {
      id v7 = (void (**)(id, NSError *, void))[*(id *)(*(void *)(a1 + 32) + 56) reply];
      NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v13 = @"W5CancelledErr";
      v7[2](v7, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 6, +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1]), 0);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }

    *(void *)(*(void *)(a1 + 32) + 56) = 0;
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9)
    {
      NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v11 = @"W5ParamErr";
      (*(void (**)(uint64_t, NSError *))(v9 + 16))(v9, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 1, +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1]));
    }
  }
}

void sub_10003C460(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];

  *(void *)(*(void *)(a1 + 32) + 56) = 0;
  [*(id *)(a1 + 32) resetNetworkServiceOrderForTeardown];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10003C5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003C5C4(uint64_t a1, uint64_t a2)
{
}

void sub_10003C5D4(uint64_t a1)
{
}

void sub_10003C5E0(uint64_t a1)
{
  [*(id *)(a1 + 32) __purgeDiagnosticsHistory];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) copy];
}

void sub_10003C78C(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 96) = 0x8000000000000000;
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] Restoring network service order before teardown", v4, 2u);
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 80);
    }
    +[W5DiagnosticsManager __setNetworkServiceOrder:v3];

    *(void *)(*(void *)(a1 + 32) + 80) = 0;
    [+[NSFileManager defaultManager] removeItemAtPath:@"/var/run/wifivelocity-tmp" error:0];
  }
}

void sub_10003C9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003C9D4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a1[4];
  id v4 = *(NSObject **)(v3 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CA58;
  block[3] = &unk_1000DE698;
  uint64_t v5 = a1[6];
  void block[4] = a1[5];
  void block[5] = a2;
  void block[6] = a3;
  void block[7] = v3;
  void block[8] = v5;
  dispatch_async(v4, block);
}

void sub_10003CA58(uint64_t a1)
{
  if ([*(id *)(a1 + 32) reply])
  {
    id v3 = [*(id *)(a1 + 32) reply];
    (*((void (**)(id, void, void))v3 + 2))(v3, *(void *)(a1 + 40), *(void *)(a1 + 48));
  }
  dispatch_time_t v4 = dispatch_time(0, 120000000000);
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 56) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003CB40;
  block[3] = &unk_1000DD348;
  void block[4] = *(void *)(a1 + 64);
  dispatch_after(v4, v5, block);

  *(void *)(*(void *)(a1 + 56) + 56) = 0;
  [*(id *)(a1 + 56) __nextRequest];
}

void sub_10003CB40(uint64_t a1)
{
  [+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionComplete:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = 0;
}

void sub_10003D504(uint64_t a1)
{
  id v2 = +[NSMutableArray array];
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3052000000;
  dispatch_time_t v24 = sub_10003C5C4;
  id v25 = sub_10003C5D4;
  uint64_t v26 = 0;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  char v20 = 0;
  id v3 = dispatch_queue_create(0, 0);
  id v4 = [[objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"Timeout") unsignedIntegerValue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003D884;
  block[3] = &unk_1000DE738;
  long long v13 = *(_OWORD *)(a1 + 40);
  uint64_t v14 = *(void *)(a1 + 32);
  CFStringRef v15 = v3;
  id v16 = v2;
  long long v17 = v19;
  long long v18 = &v21;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  [objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "concurrentQueue") addOperationWithBlock:v5];
  if (v4) {
    dispatch_time_t v6 = dispatch_time(0, 1000000 * (void)v4);
  }
  else {
    dispatch_time_t v6 = -1;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10003DE3C;
  v11[3] = &unk_1000DE760;
  void v11[4] = v19;
  void v11[5] = &v21;
  void v11[6] = dispatch_block_wait(v5, v6);
  dispatch_sync(v3, v11);
  if ([(id)v22[5] code] == (id)3)
  {
    id v7 = sub_10009756C();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v27 = 134217984;
    id v28 = v4;
    goto LABEL_10;
  }
  if ([(id)v22[5] code] == (id)6)
  {
    uint64_t v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
LABEL_10:
      _os_log_send_and_compose_impl();
    }
  }
LABEL_11:
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, [(id)v22[5] copy], v2);
  }
  id v10 = (id)v22[5];
  dispatch_release(v3);
  _Block_release(v5);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);
}

void sub_10003D850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_10003D884(uint64_t a1)
{
  unint64_t v2 = 0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  while (v2 < (unint64_t)[*(id *)(a1 + 32) count]
       && !*((unsigned char *)v21 + 24)
       && !*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    int8x16_t v5 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    uint64_t v6 = *(void *)(a1 + 40);
    block[2] = sub_10003DA14;
    block[3] = &unk_1000DE710;
    id v7 = *(NSObject **)(v6 + 40);
    int8x16_t v11 = v5;
    id v12 = v4;
    long long v13 = *(_OWORD *)(a1 + 56);
    uint64_t v8 = *(void *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 80);
    id v16 = &v20;
    uint64_t v17 = v9;
    long long v18 = v24;
    unint64_t v19 = v2;
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = v8;
    dispatch_sync(v7, block);
    ++v2;
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(v24, 8);
}

void sub_10003D9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_10003DA14(uint64_t a1)
{
  if ([*(id *)(a1 + 32) includeEvents])
  {
    if (!*(void *)(a1 + 112))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 120);
      if (v3) {
        (*(void (**)(uint64_t, id, void, id, double))(v3 + 16))(v3, [*(id *)(a1 + 32) uuid], 0, [*(id *)(a1 + 48) copy], 0.0);
      }
    }
  }
  id v4 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", [*(id *)(a1 + 48) configuration]);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, @"InternalUUID", objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"), "copy"));
  id v5 = [*(id *)(a1 + 48) copy];
  [v5 setConfiguration:v4];
  id v6 = [*(id *)(a1 + 40) __runDiagnosticsTest:v5];
  if (v6)
  {
    [v6 setConfiguration:[*(id *)(a1 + 48) configuration]];
    [*(id *)(a1 + 40) __updateDiagnosticsHistoryWithResult:v6];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003DD0C;
    block[3] = &unk_1000DE6E8;
    uint64_t v7 = *(void *)(a1 + 80);
    void block[5] = v6;
    void block[6] = v7;
    uint64_t v8 = *(NSObject **)(a1 + 56);
    void block[4] = *(void *)(a1 + 64);
    dispatch_sync(v8, block);
  }
  [*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) isEqual:[objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "uuid") uuid] ^ 1];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    uint64_t v9 = *(NSObject **)(a1 + 56);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10003DD60;
    v15[3] = &unk_1000DE398;
    uint64_t v10 = *(void *)(a1 + 96);
    v15[4] = *(void *)(a1 + 80);
    void v15[5] = v10;
    dispatch_sync(v9, v15);
  }
  *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 104) + 8)
                                                                           + 24)
                                                               + 1.0;
  if ([*(id *)(a1 + 32) includeEvents])
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 120);
    if (v11)
    {
      id v12 = [*(id *)(a1 + 32) uuid];
      long long v13 = *(char **)(a1 + 112);
      if (v13 >= (char *)[*(id *)(a1 + 72) count] - 1) {
        id v14 = 0;
      }
      else {
        id v14 = [[objc_msgSend(*(id *)(a1 + 72), "objectAtIndexedSubscript:", *(void *)(a1 + 112) + 1) copy];
      }
      (*(void (**)(uint64_t, id, id, id, double))(v11 + 16))(v11, v12, v6, v14, *(double *)(*(void *)(*(void *)(a1 + 104) + 8) + 24)/ (double)(unint64_t)[*(id *)(a1 + 72) count]* 100.0);
    }
  }
}

void sub_10003DD0C(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
}

void sub_10003DD60(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    NSErrorUserInfoKey v3 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v4 = @"W5CancelledErr";
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 6, +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1]) copy];
  }
}

void sub_10003DE3C(void *a1)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
  if (a1[6])
  {

    NSErrorUserInfoKey v3 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v4 = @"W5TimeoutErr";
    *(void *)(*(void *)(a1[5] + 8) + 40) = [+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 3, +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1]) copy];
  }
}

void sub_10003F910(uint64_t a1)
{
  NSErrorUserInfoKey v3 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", [*(id *)(a1 + 32) configuration]);
  [(NSMutableDictionary *)v3 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"InternalUUID"];
  id v4 = [*(id *)(a1 + 32) copy];
  [v4 setConfiguration:v3];
  id v5 = [*(id *)(a1 + 48) __runDiagnosticsTest:v4];
  if (v5)
  {
    id v6 = v5;
    [v5 setConfiguration:[*(id *)(a1 + 32) configuration]];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003FA1C;
    v8[3] = &unk_1000DDC30;
    uint64_t v7 = *(NSObject **)(a1 + 56);
    v8[4] = *(void *)(a1 + 64);
    v8[5] = v6;
    dispatch_sync(v7, v8);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void sub_10003FA1C(uint64_t a1)
{
  [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
}

void sub_10003FA60(uint64_t a1)
{
  CFStringRef v3 = @"ConcurrentResults";
  id v4 = [*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setInfo:[+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1)];
}

void sub_1000451D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100045224()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x3052000000;
  id v6 = sub_10003C5C4;
  uint64_t v7 = sub_10003C5D4;
  uint64_t v0 = qword_1001036B0;
  uint64_t v8 = qword_1001036B0;
  if (!qword_1001036B0)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10004B398;
    v2[3] = &unk_1000DD348;
    v2[4] = &v3;
    sub_10004B398((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000452FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100045314()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x3052000000;
  id v6 = sub_10003C5C4;
  uint64_t v7 = sub_10003C5D4;
  uint64_t v0 = qword_1001036B8;
  uint64_t v8 = qword_1001036B8;
  if (!qword_1001036B8)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10004B4D8;
    v2[3] = &unk_1000DD348;
    v2[4] = &v3;
    sub_10004B4D8((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1000453EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100045404(uint64_t a1, void *a2, void *a3)
{
  [*(id *)(a1 + 32) lock];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = a2;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [a3 copy];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  [*(id *)(a1 + 32) unlock];
}

void sub_100045860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a20, 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1000458B0(uint64_t a1, void *a2, void *a3)
{
  [*(id *)(a1 + 32) lock];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = a2;
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [a3 copy];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  [*(id *)(a1 + 32) unlock];
}

uint64_t sub_100046550(uint64_t a1, void *a2, void *a3)
{
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:a3];
  [v6 floatValue];
  float v9 = v8;
  [v7 floatValue];
  if (v9 > v10) {
    return 1;
  }
  [v7 floatValue];
  float v13 = v12;
  [v6 floatValue];
  uint64_t v11 = -1;
  if (v13 <= v14)
  {
    id v15 = [a2 channel];
    if ((uint64_t)v15 <= (uint64_t)[a3 channel]) {
      return 1;
    }
  }
  return v11;
}

void sub_10004873C(id a1)
{
  qword_1001036D0 = (uint64_t)[&off_1000EFF48 copy];
}

void sub_100049CD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose((const void *)(v10 - 144), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100049D04(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_alloc_init((Class)W5PingResult);
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAddress:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setInterfaceName:[*(id *)(*(void *)(a1 + 40) + 8) interfaceName]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCount:(int)[a2 numPingsTransmitted]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setTimeout:1.0];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setWait:1.0];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setInterval:1.0];
  [a2 packetLossRate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setPacketLoss:];
  [a2 averageRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAvg:v5 * 1000.0];
  [a2 minRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMin:v6 * 1000.0];
  [a2 maxRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMax:v7 * 1000.0];
  [a2 standardDeviationRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStddev:v8 * 1000.0];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStartedAt:*(double *)(a1 + 64)];
  +[NSDate timeIntervalSinceReferenceDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setEndedAt:];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10004ADCC(uint64_t a1)
{
  CFHostCancelInfoResolution(*(CFHostRef *)(a1 + 32), kCFHostAddresses);
  unint64_t v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

void sub_10004B1CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10004B1EC(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3 && [a2 length]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  id v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

uint64_t sub_10004B254()
{
  if (!qword_1001036A8) {
    qword_1001036A8 = _sl_dlopen();
  }
  return qword_1001036A8;
}

uint64_t sub_10004B324()
{
  uint64_t result = _sl_dlopen();
  qword_1001036A8 = result;
  return result;
}

Class sub_10004B398(uint64_t a1)
{
  sub_10004B444();
  Class result = objc_getClass("NPTPerformanceTestConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    qword_1001036B0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    Class result = (Class)[+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"Class getNPTPerformanceTestConfigurationClass(void)_block_invoke"], @"W5DiagnosticsManager.m", 51, @"Unable to find class %s", "NPTPerformanceTestConfiguration" file lineNumber description];
    __break(1u);
  }
  return result;
}

void sub_10004B444()
{
  if (!sub_10004B254())
  {
    id v0 = [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void *NPTKitLibrary(void)"], @"W5DiagnosticsManager.m", 50, @"%s", 0 file lineNumber description];
    __break(1u);
    free(v0);
  }
}

Class sub_10004B4D8(uint64_t a1)
{
  sub_10004B444();
  Class result = objc_getClass("NPTPerformanceTest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    qword_1001036B8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  else
  {
    Class result = (Class)[+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"Class getNPTPerformanceTestClass(void)_block_invoke"], @"W5DiagnosticsManager.m", 53, @"Unable to find class %s", "NPTPerformanceTest" file lineNumber description];
    __break(1u);
  }
  return result;
}

uint64_t sub_10004B584()
{
  if (!qword_1001036C0) {
    qword_1001036C0 = _sl_dlopen();
  }
  return qword_1001036C0;
}

uint64_t sub_10004B654()
{
  uint64_t result = _sl_dlopen();
  qword_1001036C0 = result;
  return result;
}

Class sub_10004B6C8(uint64_t a1)
{
  if (sub_10004B584())
  {
    Class result = objc_getClass("IMPingTest");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      qword_1001036C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      return result;
    }
    Class result = (Class)[+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"Class getIMPingTestClass(void)_block_invoke"], @"W5DiagnosticsManager.m", 46, @"Unable to find class %s", "IMPingTest" file lineNumber description];
  }
  else
  {
    Class result = (Class)[+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void *IMFoundationLibrary(void)"], @"W5DiagnosticsManager.m", 45, @"%s", 0 file lineNumber description];
  }
  __break(1u);
  return result;
}

void sub_10004BD64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(v29);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004BDB0(uint64_t a1)
{
  unint64_t v2 = sub_10009756C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invalidateRapportClient];
}

void sub_10004BEAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10004BF80;
  v6[3] = &unk_1000DE8E8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);

  objc_destroyWeak(&v8);
}

void sub_10004BF80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleDeviceFound:*(void *)(a1 + 32)];
}

void sub_10004BFD0(uint64_t a1, void *a2)
{
  unint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleDeviceLost:v3];
}

void sub_10004C030(id a1, RPCompanionLinkDevice *a2)
{
  unint64_t v2 = a2;
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_10004C78C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004C7B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_10009756C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setDiscoveringDevices:0];
  }
}

void sub_10004CD14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004CD38(id a1)
{
  uint64_t v1 = sub_10009756C();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_10004CE1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = sub_10009756C();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      id v7 = *(void **)(a1 + 32);
      *(_DWORD *)location = 136316162;
      *(void *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
      __int16 v32 = 2080;
      uint64_t v33 = "W5RapportClient.m";
      __int16 v34 = 1024;
      int v35 = 231;
      __int16 v36 = 2114;
      uint64_t v37 = v7;
      __int16 v38 = 2114;
      id v39 = v3;
      LODWORD(v25) = 48;
      dispatch_time_t v24 = location;
      _os_log_send_and_compose_impl();
    }

    if ([v3 code] == (id)-71146)
    {
      id v8 = sub_10009756C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void **)(a1 + 32);
        float v9 = *(void **)(a1 + 40);
        *(_DWORD *)location = 136316162;
        *(void *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
        __int16 v32 = 2080;
        uint64_t v33 = "W5RapportClient.m";
        __int16 v34 = 1024;
        int v35 = 234;
        __int16 v36 = 2114;
        uint64_t v37 = v9;
        __int16 v38 = 2114;
        id v39 = v10;
        LODWORD(v25) = 48;
        dispatch_time_t v24 = location;
        _os_log_send_and_compose_impl();
      }
    }
    uint64_t v11 = *(void **)(a1 + 32);
    float v12 = +[W5RapportResponse responseWithPayload:options:error:](W5RapportResponse, "responseWithPayload:options:error:", 0, 0, v3, v24, v25);
    [v11 handleResponse:v12];
  }
  else
  {
    if (v6)
    {
      float v13 = [*(id *)(a1 + 32) identifier];
      id v14 = [*(id *)(a1 + 32) controlFlags];
      id v15 = [*(id *)(a1 + 32) requestPayload];
      [*(id *)(a1 + 32) peer];
      *(_DWORD *)location = 136316674;
      *(void *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
      __int16 v32 = 2080;
      uint64_t v33 = "W5RapportClient.m";
      __int16 v34 = 1024;
      int v35 = 241;
      __int16 v36 = 2114;
      uint64_t v37 = v13;
      __int16 v38 = 2048;
      id v39 = v14;
      __int16 v40 = 2114;
      uint64_t v41 = v15;
      __int16 v42 = 2114;
      id v43 = (id)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }
    id v16 = [*(id *)(a1 + 32) requestPayload];
    float v12 = [v16 encode];

    if (v12)
    {
      objc_initWeak((id *)location, WeakRetained);
      uint64_t v17 = [*(id *)(a1 + 32) identifier];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10004D398;
      v26[3] = &unk_1000DEA28;
      objc_copyWeak(&v28, (id *)location);
      id v27 = *(id *)(a1 + 32);
      [WeakRetained sendRequestID:v17 request:v12 options:0 responseHandler:v26];

      objc_destroyWeak(&v28);
      objc_destroyWeak((id *)location);
    }
    else
    {
      long long v18 = sub_10009756C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v19 = *(void **)(a1 + 32);
        *(_DWORD *)location = 136315906;
        *(void *)&location[4] = "-[W5RapportClient sendMessageToDevice:request:]_block_invoke";
        __int16 v32 = 2080;
        uint64_t v33 = "W5RapportClient.m";
        __int16 v34 = 1024;
        int v35 = 244;
        __int16 v36 = 2114;
        uint64_t v37 = v19;
        _os_log_send_and_compose_impl();
      }

      uint64_t v20 = *(void **)(a1 + 32);
      NSErrorUserInfoKey v29 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v30 = @"W5ParamErr";
      uint64_t v21 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      uint64_t v22 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v21];
      char v23 = +[W5RapportResponse responseWithPayload:0 options:0 error:v22];
      [v20 handleResponse:v23];

      float v12 = 0;
    }
  }
}

void sub_10004D36C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10004D398(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v11 = [v8 objectForKeyedSubscript:@"statusFlags"];
  unsigned int v12 = [v11 unsignedIntValue];

  float v13 = sub_10009756C();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = WeakRetained;
    id v14 = +[NSMutableArray array];
    char v15 = 0;
    id v16 = (const char *)&unk_1000B0870;
    do
    {
      uint64_t v17 = (char *)(v16 + 1);
      if ((v12 >> v15))
      {
        id v18 = [objc_alloc((Class)NSString) initWithCString:v17 encoding:1];
        [v14 addObject:v18];
        size_t v19 = (size_t)[v18 length];
      }
      else
      {
        size_t v19 = strlen(v16 + 1);
      }
      id v16 = &v17[v19 + 1];
      char v15 = *v16;
    }
    while (*v16);
    uint64_t v20 = [v14 componentsJoinedByString:@" "];

    _os_log_send_and_compose_impl();
    id WeakRetained = v26;
  }

  if (v9)
  {
    uint64_t v21 = sub_10009756C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }

    uint64_t v22 = *(void **)(a1 + 32);
    char v23 = +[W5RapportResponse responseWithPayload:0 options:v8 error:v9];
    [v22 handleResponse:v23];
  }
  else
  {
    char v23 = [[objc_msgSend(*(id *)(a1 + 32), "responsePayloadClass") payloadFromDictionary:v7];
    dispatch_time_t v24 = *(void **)(a1 + 32);
    uint64_t v25 = +[W5RapportResponse responseWithPayload:v23 options:v8 error:0];
    [v24 handleResponse:v25];
  }
  [WeakRetained invalidate];
}

void sub_10004D910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004D928(uint64_t a1, uint64_t a2)
{
}

void sub_10004D938(uint64_t a1)
{
}

void sub_10004D944(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) __wifi];
}

void sub_10004DACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004DAE4(uint64_t a1)
{
  [*(id *)(a1 + 32) __bluetooth];
}

void sub_10004DE74(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 136) = [*(id *)(a1 + 40) copy];
}

void sub_10004DF70(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 144) = [*(id *)(a1 + 40) copy];
}

void sub_10004E06C(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 152) = [*(id *)(a1 + 40) copy];
}

void sub_10004E168(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 160) = [*(id *)(a1 + 40) copy];
}

void sub_10004E264(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16_Block_object_dispose(&STACK[0x310], 8) = [*(id *)(a1 + 40) copy];
}

void sub_10004E360(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 176) = [*(id *)(a1 + 40) copy];
}

void sub_10004E45C(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 192) = [*(id *)(a1 + 40) copy];
}

void sub_10004E558(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 200) = [*(id *)(a1 + 40) copy];
}

void sub_10004E654(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 20_Block_object_dispose(&STACK[0x310], 8) = [*(id *)(a1 + 40) copy];
}

void sub_10004E750(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 184) = [*(id *)(a1 + 40) copy];
}

void sub_10004E84C(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 216) = [*(id *)(a1 + 40) copy];
}

void sub_10004E948(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 224) = [*(id *)(a1 + 40) copy];
}

void sub_10004EA44(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 232) = [*(id *)(a1 + 40) copy];
}

void sub_10004EB10(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void, id))(v3 + 16))(v3, 0, [*(id *)(a1 + 32) __queryStatusIncludingWiFiScanCache:1]);
  }
}

void sub_10004EC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004EC70(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) __queryStatusIncludingWiFiScanCache:1];
}

void sub_10004EDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004EDB8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) __queryWiFiStatusIncludingScanCache:0];
}

void sub_10004EEE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004EF00(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) __queryAWDLStatus];
}

void sub_10004F02C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004F044(uint64_t a1)
{
  [*(id *)(a1 + 32) __queryBluetoothStatus];
}

void sub_10004F170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004F188(uint64_t a1)
{
  [*(id *)(a1 + 32) __queryNetworkStatus];
}

void sub_10004F2B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004F2CC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) __queryPowerStatus];
}

void sub_10004F3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004F414(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v3 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:];
    if (!v3)
    {
      id v3 = [*(id *)(a1 + 40) __queryStatusIncludingWiFiScanCache:0];
      [*(id *)(*(void *)(a1 + 40) + 40) setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
    }
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v3;
  }
}

void sub_10004F518(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    [*(id *)(*(void *)(a1 + 40) + 40) removeObjectForKey:];
  }
}

void sub_10004F640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10004F658(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];
}

void sub_10004F720(uint64_t a1)
{
  [objc_msgSend(*(id *)(a1 + 32), "__wifi") startEventMonitoring];
  [*(id *)(*(void *)(a1 + 32) + 88) startEventMonitoring];
  [*(id *)(*(void *)(a1 + 32) + 104) startEventMonitoring];
  [*(id *)(*(void *)(a1 + 32) + 112) startEventMonitoring];
  [*(id *)(*(void *)(a1 + 32) + 120) startEventMonitoring];
  [*(id *)(a1 + 32) __forceUpdateTrigger];
}

void sub_10004F814(uint64_t a1)
{
  [objc_msgSend(*(id *)(a1 + 32), "__wifi") stopEventMonitoring];
  [*(id *)(*(void *)(a1 + 32) + 88) stopEventMonitoring];
  [*(id *)(*(void *)(a1 + 32) + 104) stopEventMonitoring];
  [*(id *)(*(void *)(a1 + 32) + 112) stopEventMonitoring];
  [*(id *)(*(void *)(a1 + 32) + 120) stopEventMonitoring];
  id v3 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  if (v3)
  {
    dispatch_source_cancel(v3);
    dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
  }
}

id sub_10004F988(uint64_t a1)
{
  unint64_t v2 = sub_10009756C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315906;
    id v7 = "-[W5StatusManager __forceUpdateTrigger]_block_invoke";
    __int16 v8 = 2080;
    id v9 = "W5StatusManager.m";
    __int16 v10 = 1024;
    int v11 = 543;
    __int16 v12 = 1024;
    int v13 = 10;
    LODWORD(v5) = 34;
    id v4 = &v6;
    _os_log_send_and_compose_impl();
  }
  return [*(id *)(a1 + 32) __updateStatusCoalesce:v4, v5];
}

id sub_10004FB4C(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(a1 + 32) + 24));
  dispatch_release(*(dispatch_object_t *)(*(void *)(a1 + 32) + 24));
  *(void *)(*(void *)(a1 + 32) + 24) = 0;
  unint64_t v2 = sub_10009756C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315906;
    id v7 = "-[W5StatusManager __updateStatusCoalesce]_block_invoke";
    __int16 v8 = 2080;
    id v9 = "W5StatusManager.m";
    __int16 v10 = 1024;
    int v11 = 574;
    __int16 v12 = 1024;
    int v13 = 5;
    LODWORD(v5) = 34;
    id v4 = &v6;
    _os_log_send_and_compose_impl();
  }
  return [*(id *)(a1 + 32) __updateStatus:v4, v5];
}

void sub_100051348(uint64_t a1)
{
  [*(id *)(a1 + 32) __addEvent:*(void *)(a1 + 40)];
}

void sub_1000515F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100051668;
  v4[3] = &unk_1000DDC30;
  void v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100051668(uint64_t a1)
{
  [*(id *)(a1 + 32) __updateStatusCoalesce];
  [*(id *)(a1 + 32) __addEvent:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 176);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
}

void sub_1000516D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100051744;
  v4[3] = &unk_1000DDC30;
  void v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100051744(uint64_t a1)
{
  [*(id *)(a1 + 32) __updateStatusCoalesce];
  [*(id *)(a1 + 32) __addEvent:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 184);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
}

void sub_1000517AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100051820;
  v4[3] = &unk_1000DDC30;
  void v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100051820(uint64_t a1)
{
  [*(id *)(a1 + 32) __updateStatusCoalesce];
  [*(id *)(a1 + 32) __addEvent:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 192);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
}

void sub_100051888(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000518FC;
  v4[3] = &unk_1000DDC30;
  void v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000518FC(uint64_t a1)
{
  [*(id *)(a1 + 32) __updateStatusCoalesce];
  [*(id *)(a1 + 32) __addEvent:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 200);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
}

void sub_100051964(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000519D8;
  v4[3] = &unk_1000DDC30;
  void v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000519D8(uint64_t a1)
{
  [*(id *)(a1 + 32) __updateStatusCoalesce];
  [*(id *)(a1 + 32) __addEvent:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 208);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
}

void sub_100051A40(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100051AB4;
  v4[3] = &unk_1000DDC30;
  void v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100051AB4(uint64_t a1)
{
  [*(id *)(a1 + 32) __updateStatusCoalesce];
  [*(id *)(a1 + 32) __addEvent:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 216);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
}

void sub_100051B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100051B90;
  v4[3] = &unk_1000DDC30;
  void v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100051B90(uint64_t a1)
{
  [*(id *)(a1 + 32) __updateStatusCoalesce];
  [*(id *)(a1 + 32) __addEvent:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 224);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
}

void sub_100051BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100051C6C;
  v4[3] = &unk_1000DDC30;
  void v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_100051C6C(uint64_t a1)
{
  [*(id *)(a1 + 32) __updateStatusCoalesce];
  [*(id *)(a1 + 32) __addEvent:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 232);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
}

void sub_100052068(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 96) = [*(id *)(a1 + 40) copy];
}

id sub_1000522B4(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v2 = objc_alloc_init((Class)W5WiFiPreferredNetwork);
  [v2 setSsid:[a1 SSID]];
  [v2 setSsidString:[a1 networkName]];
  [v2 setIsEnabled:[a1 isAutoJoinDisabled] ^ 1];
  [v2 setLastJoinedTimestamp:[a1 lastJoinedAt]];
  [v2 setSecurity:sub_1000543CC((uint64_t)objc_msgSend(a1, "supportedSecurityTypes"), (uint64_t)objc_msgSend(a1, "WEPSubtype"), (uint64_t)objc_msgSend(a1, "WAPISubtype"))];
  [v2 setIsCaptive:[a1 isCaptive]];
  [v2 setIsPasspoint:[a1 isPasspoint]];
  [v2 setDomainName:[a1 domainName]];
  [v2 setIsHidden:objc_msgSend(a1, "hiddenState") == (id)1];
  if ([v2 isPasspoint]) {
    uint64_t v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"wifivelocityd.preferrednetwork.passpoint.%@", [v2 domainName]);
  }
  else {
    uint64_t v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"wifivelocityd.preferrednetwork.ssid.%@", [v2 ssidString]);
  }
  [v2 setIdentifier:v3];
  return v2;
}

id sub_100052730(uint64_t a1, void *a2)
{
  uint64_t v4 = (uint64_t)[a2 eventID].type;
  if (v4 > 14)
  {
    if (v4 == 15)
    {
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = 1;
    }
    else
    {
      if (v4 != 16) {
        goto LABEL_11;
      }
      uint64_t v5 = *(void **)(a1 + 32);
      uint64_t v6 = 0;
    }
    [v5 __updateAWDLRealTimeMode:v6];
  }
  else if (v4 == 2)
  {
    [*(id *)(a1 + 32) __clearLinkQualityUpdates];
    [*(id *)(a1 + 32) __updateLastAssociatedSSID];
  }
  else if (v4 == 3)
  {
    [*(id *)(a1 + 32) __clearLinkQualityUpdates];
  }
LABEL_11:
  id result = [*(id *)(a1 + 32) updatedWiFiCallback];
  if (result)
  {
    __int16 v8 = [*(id *)(a1 + 32) updatedWiFiCallback];
    if (a2)
    {
      id v9 = *(void **)(*(void *)(a1 + 32) + 40);
      id v10 = objc_alloc_init((Class)W5Event);
      id v11 = +[NSMutableDictionary dictionary];
      [v11 setObject:objc_msgSend(objc_msgSend(a2, "eventID"), "interfaceName") forKeyedSubscript:@"InterfaceName"];
      [objc_msgSend(a2, "timestamp") timeIntervalSinceReferenceDate];
      [v10 setTimestamp:];
      switch((unint64_t)objc_msgSend(objc_msgSend(a2, "eventID"), "type"))
      {
        case 1uLL:
          [v10 setEventID:18];
          __int16 v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v9 powerOn]);
          CFStringRef v13 = @"WiFiPowerOn";
          goto LABEL_30;
        case 2uLL:
          [v10 setEventID:19];
          [v11 setObject:objc_msgSend(v9, "SSID") forKeyedSubscript:@"WiFiSSID"];
          __int16 v12 = (NSNumber *)[v9 networkName];
          CFStringRef v13 = @"WiFiSSIDString";
          goto LABEL_30;
        case 3uLL:
          [v10 setEventID:20];
          __int16 v12 = (NSNumber *)[v9 BSSID];
          CFStringRef v13 = @"WiFiBSSID";
          goto LABEL_30;
        case 4uLL:
          [v10 setEventID:24];
          __int16 v12 = (NSNumber *)[v9 countryCode];
          CFStringRef v13 = @"WiFiCountryCode";
          goto LABEL_30;
        case 6uLL:
          id v14 = [a2 info];
          id v15 = [v14 objectForKeyedSubscript:CWFEventLinkChangeStatusKey];
          [v10 setEventID:22];
          [v11 setObject:+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v15, "isLinkDown") ^ 1) forKeyedSubscript:@"WiFiLinkUp"];
          [v11 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v15 reason]) forKeyedSubscript:@"WiFiLinkChangeReason"];
          [v11 setObject:[+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v15, "subreason"))] forKeyedSubscript:@"WiFiLinkChangeSubreason"];
          __int16 v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v15 isInvoluntaryLinkDown]);
          CFStringRef v13 = @"WiFiLinkChangeInvoluntary";
          goto LABEL_30;
        case 7uLL:
          id v16 = [a2 info];
          id v17 = [v16 objectForKeyedSubscript:CWFEventLinkQualityMetricKey];
          id v18 = (NSNumber *)objc_alloc_init((Class)W5WiFiLinkQualityUpdate);
          -[NSNumber setRssi:](v18, "setRssi:", [v17 RSSI]);
          [v17 txRate];
          [(NSNumber *)v18 setTxRate:(uint64_t)v19];
          *(float *)&double v20 = (float)(unint64_t)[v17 CCA];
          [(NSNumber *)v18 setCca:v20];
          [objc_msgSend(v17, "updatedAt") timeIntervalSinceReferenceDate];
          -[NSNumber setTimestamp:](v18, "setTimestamp:");
          [v10 setEventID:25];
          CFStringRef v13 = @"WiFiLinkQualityUpdate";
          uint64_t v21 = v11;
          __int16 v12 = v18;
          goto LABEL_31;
        case 8uLL:
          [v10 setEventID:23];
          __int16 v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 opMode]);
          CFStringRef v13 = @"WiFiMode";
          goto LABEL_30;
        case 0xEuLL:
          id v22 = [a2 info];
          if (objc_msgSend(objc_msgSend(v22, "objectForKeyedSubscript:", CWFEventRoamStatusKey), "endedAt"))
          {
            char v23 = v10;
            uint64_t v24 = 31;
          }
          else
          {
            char v23 = v10;
            uint64_t v24 = 30;
          }
          goto LABEL_33;
        case 0xFuLL:
          char v23 = v10;
          uint64_t v24 = 32;
          goto LABEL_33;
        case 0x10uLL:
          char v23 = v10;
          uint64_t v24 = 33;
          goto LABEL_33;
        case 0x11uLL:
          char v23 = v10;
          uint64_t v24 = 2;
          goto LABEL_33;
        case 0x12uLL:
          char v23 = v10;
          uint64_t v24 = 8;
LABEL_33:
          [v23 setEventID:v24];
          break;
        case 0x17uLL:
          [v10 setEventID:14];
          [v11 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "EAP8021XControlMode"))] forKeyedSubscript:@"EAPControlMode"];
          [v11 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "EAP8021XSupplicantState"))] forKeyedSubscript:@"EAPSupplicantState"];
          [v11 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "EAP8021XControlState"))] forKeyedSubscript:@"EAPControlState"];
          __int16 v12 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v9 EAP8021XClientStatus]);
          CFStringRef v13 = @"EAPClientStatus";
          goto LABEL_30;
        case 0x18uLL:
          [v10 setEventID:11];
          __int16 v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 reachabilityFlags]);
          CFStringRef v13 = @"NetworkReachability";
LABEL_30:
          uint64_t v21 = v11;
LABEL_31:
          [v21 setObject:v12 forKeyedSubscript:v13];
          break;
        default:
          break;
      }
      [v10 setInfo:v11];
    }
    else
    {
      id v10 = 0;
    }
    uint64_t v25 = (uint64_t (*)(void *, id))v8[2];
    return (id)v25(v8, v10);
  }
  return result;
}

void sub_100052D14(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10 = objc_alloc_init((Class)W5Event);
  +[NSDate timeIntervalSinceReferenceDate];
  [v10 setTimestamp:];
  id v11 = +[NSMutableDictionary dictionary];
  [v11 setObject:[a6 interfaceName] forKeyedSubscript:@"InterfaceName"];
  if (a3 <= 48)
  {
    if (a3 == 20)
    {
      __int16 v12 = v10;
      uint64_t v13 = 21;
      goto LABEL_12;
    }
    if (a3 == 34)
    {
      __int16 v12 = v10;
      uint64_t v13 = 26;
      goto LABEL_12;
    }
  }
  else
  {
    switch(a3)
    {
      case '1':
        __int16 v12 = v10;
        uint64_t v13 = 27;
        goto LABEL_12;
      case '6':
        [a6 __clearLinkQualityUpdates];
        [v10 setEventID:29];
        [v11 setObject:[objc_alloc((Class)W5WiFiChannel) initWithChannel:*(unsigned int *)(a4 + 12) flags:*(unsigned int *)(a4 + 16)] forKeyedSubscript:@"WiFiChannel"];
        break;
      case '7':
        __int16 v12 = v10;
        uint64_t v13 = 28;
LABEL_12:
        [v12 setEventID:v13];
        break;
    }
  }
  if ([v10 eventID])
  {
    [v10 setInfo:v11];
    if ([a6 updatedWiFiCallback])
    {
      id v14 = (void (**)(id, id))[a6 updatedWiFiCallback];
      v14[2](v14, v10);
    }
  }
}

void sub_100052F10(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 48))
  {
    *(unsigned char *)(v3 + 4_Block_object_dispose(&STACK[0x310], 8) = 1;
    id v4 = *(id *)(a1 + 32);
    [*(id *)(a1 + 32) __startEventMonitoring];
  }
}

void sub_100053050(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 48))
  {
    *(unsigned char *)(v3 + 4_Block_object_dispose(&STACK[0x310], 8) = 0;
    [*(id *)(a1 + 32) __stopEventMonitoring];
  }
}

void sub_100053124(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8_Block_object_dispose(&STACK[0x310], 8) = *(unsigned char *)(a1 + 40);
}

void sub_1000531D8(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64) = [objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "SSID") copy];
  *(void *)(*(void *)(a1 + 32) + 72) = [[objc_msgSend(*(id *)(*(void *)(a1 + 32) + 40), "networkName") copy];
}

void sub_1000532D0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
}

void sub_10005338C(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 56) count] == (id)10) {
    [*(id *)(*(void *)(a1 + 32) + 56) removeObjectAtIndex:0];
  }
  [*(id *)(*(void *)(a1 + 32) + 56) addObject:*(void *)(a1 + 40)];
}

void sub_1000534D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000534E8(uint64_t a1, uint64_t a2)
{
}

void sub_1000534F8(uint64_t a1)
{
}

void sub_100053504(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 56) copy];
}

id sub_100053688(id result)
{
  if (result)
  {
    id v1 = [objc_alloc((Class)W5WiFiChannel) initWithChannel:[result channel] flags:[result flags]];
    return v1;
  }
  return result;
}

void sub_1000537D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000537EC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 64) copy];
}

void sub_100053918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100053930(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 72) copy];
}

id sub_100053C44(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v2 = objc_alloc_init((Class)W5WiFiScanResult);
  [v2 setScanRecord:[a1 scanRecord]];
  [v2 setSsid:[a1 SSID]];
  [v2 setSsidString:[a1 networkName]];
  [v2 setBssid:[a1 BSSID]];
  [v2 setChannel:[sub_100053688(objc_msgSend(a1, "channel"))]];
  [v2 setCountryCode:[a1 countryCode]];
  [v2 setBeaconInterval:[a1 beaconInterval]];
  [v2 setRssi:[a1 RSSI]];
  [v2 setNoise:[a1 noise]];
  [v2 setIsIBSS:[a1 isIBSS]];
  [v2 setIsAppleSWAP:[a1 isAppleSWAP]];
  [v2 setIsPasspoint:[a1 isPasspoint]];
  [v2 setIsPersonalHotspot:[a1 isPersonalHotspot]];
  id v3 = [a1 airPortBaseStationModel];
  switch((unint64_t)v3)
  {
    case 'f':
      CFStringRef v4 = @"AirPort Express (802.11 b/g)";
      break;
    case 'g':
    case 'n':
    case 'o':
    case 'p':
    case 'v':
      goto LABEL_6;
    case 'h':
      CFStringRef v4 = @"AirPort Extreme 802.11n (1st Generation)";
      break;
    case 'i':
      CFStringRef v4 = @"AirPort Extreme 802.11n w/ Gigabit Ethernet (2nd Generation)";
      break;
    case 'j':
      CFStringRef v4 = @"Time Capsule (1st Generation)";
      break;
    case 'k':
      CFStringRef v4 = @"AirPort Express 802.11n (1st Generation)";
      break;
    case 'l':
      CFStringRef v4 = @"AirPort Extreme 802.11n w/ Simultaneous Dual-Band (3rd Generation)";
      break;
    case 'm':
      CFStringRef v4 = @"Time Capsule w/ Simultaneous Dual-Band (2nd Generation)";
      break;
    case 'q':
      CFStringRef v4 = @"Time Capsule w/ Simultaneous Dual-Band (3rd Generation)";
      break;
    case 'r':
      CFStringRef v4 = @"AirPort Extreme 802.11n w/ Simultaneous Dual-Band (4th Generation)";
      break;
    case 's':
      CFStringRef v4 = @"AirPort Express 802.11n w/ Simultaneous Dual-Band (2nd Generation)";
      break;
    case 't':
      CFStringRef v4 = @"Time Capsule w/ Simultaneous Dual-Band (4th Generation)";
      break;
    case 'u':
      CFStringRef v4 = @"AirPort Extreme 802.11n w/ Simultaneous Dual-Band (5th Generation)";
      break;
    case 'w':
      CFStringRef v4 = @"Time Capsule 802.11ac (5th Generation)";
      break;
    case 'x':
      CFStringRef v4 = @"AirPort Extreme 802.11ac (6th Generation)";
      break;
    default:
      if (v3 == (id)3) {
        CFStringRef v4 = @"AirPort Extreme (802.11 b/g)";
      }
      else {
LABEL_6:
      }
        CFStringRef v4 = +[NSString stringWithFormat:@"? (%ld)", v3];
      break;
  }
  [v2 setAirPortBaseStationModelName:v4];
  [v2 setSupportedPHYModes:[a1 supportedPHYModes]];
  id v5 = [a1 supportedSecurityTypes];
  id v6 = [a1 WAPISubtype];
  id v7 = +[NSMutableArray array];
  __int16 v8 = v7;
  if ((v5 & 0x80) != 0)
  {
    [v7 addObject:&off_1000EB1E8];
    if ((v5 & 0x20) == 0)
    {
LABEL_22:
      if ((v5 & 8) == 0) {
        goto LABEL_23;
      }
      goto LABEL_29;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_22;
  }
  [v8 addObject:&off_1000EB1D0];
  if ((v5 & 8) == 0)
  {
LABEL_23:
    if ((v5 & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v8 addObject:&off_1000EB200];
  if ((v5 & 0x40) == 0)
  {
LABEL_24:
    if ((v5 & 0x10) == 0) {
      goto LABEL_25;
    }
LABEL_31:
    [v8 addObject:&off_1000EB038];
    goto LABEL_32;
  }
LABEL_30:
  [v8 addObject:&off_1000EB080];
  if ((v5 & 0x10) != 0) {
    goto LABEL_31;
  }
LABEL_25:
  if (v5 == (id)4)
  {
    id v9 = &off_1000EB008;
    goto LABEL_38;
  }
LABEL_32:
  if (v5) {
    [v8 addObject:&off_1000EAFF0];
  }
  if (v5 != (id)2) {
    goto LABEL_39;
  }
  if (v6 == (id)2) {
    id v9 = &off_1000EB0C8;
  }
  else {
    id v9 = &off_1000EB290;
  }
LABEL_38:
  [v8 addObject:v9];
LABEL_39:
  [v2 setSupportedSecurityTypes:[v8 copy]];
  unsigned int v10 = [a1 isWEP];
  id v11 = [a1 WPAUnicastCiphers];
  unint64_t v12 = (unint64_t)[a1 WPAMulticastCipher];
  if (([v11 containsObject:&off_1000EB248] & 1) != 0
    || ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1 ? (LODWORD(v13) = 1) : (LODWORD(v13) = v10),
        [v11 containsObject:&off_1000EB260]))
  {
    LODWORD(v13) = 1;
  }
  unsigned int v14 = [v11 containsObject:&off_1000EB278];
  id v15 = [a1 RSNUnicastCiphers];
  unint64_t v16 = (unint64_t)[a1 RSNMulticastCipher];
  if (([v15 containsObject:&off_1000EB248] & 1) != 0
    || ((v16 & 0xFFFFFFFFFFFFFFFBLL) == 1 ? (uint64_t v13 = 1) : (uint64_t v13 = v13),
        [v15 containsObject:&off_1000EB260]))
  {
    uint64_t v13 = 1;
  }
  unsigned int v17 = [v15 containsObject:&off_1000EB278];
  if (v16 == 2) {
    int v18 = 1;
  }
  else {
    int v18 = v17;
  }
  unsigned int v19 = v18 | v14;
  if (v12 == 2) {
    uint64_t v20 = 1;
  }
  else {
    uint64_t v20 = v19;
  }
  [v2 setSupportsWEPCipher:v13];
  [v2 setSupportsTKIPCipher:v20];
  return v2;
}

uint64_t sub_1000543CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 == 128) {
    return 12;
  }
  if ((a1 & 0x20) != 0)
  {
    if ((a1 & 8) != 0) {
      return 10;
    }
    else {
      return 11;
    }
  }
  else if ((a1 & 8) != 0)
  {
    return 9;
  }
  else
  {
    uint64_t v4 = 2;
    uint64_t v5 = 14;
    if (a3 != 2) {
      uint64_t v5 = 15;
    }
    if (a1 != 2) {
      uint64_t v5 = 0;
    }
    uint64_t v6 = 8;
    if (a2 != 5) {
      uint64_t v6 = 1;
    }
    if (a1) {
      uint64_t v5 = v6;
    }
    if (a1 != 4) {
      uint64_t v4 = v5;
    }
    uint64_t v7 = 3;
    if ((a1 & 4) == 0) {
      uint64_t v7 = 4;
    }
    if ((a1 & 0x10) != 0) {
      uint64_t v4 = v7;
    }
    uint64_t v8 = 5;
    if ((a1 & 0x10) != 0) {
      uint64_t v8 = 6;
    }
    if ((a1 & 0x40) != 0) {
      return v8;
    }
    else {
      return v4;
    }
  }
}

void sub_100054590(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000545A8(uint64_t a1)
{
  id v3 = *(id **)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    id v4 = [v3[10] objectForKeyedSubscript:];
    if (!v4)
    {
      id v4 = [*(id *)(a1 + 40) preferredNetworksList];
      [*(id *)(*(void *)(a1 + 40) + 80) setObject:v4 forKeyedSubscript:*(void *)(a1 + 32)];
    }
  }
  else
  {
    id v4 = [v3 preferredNetworksList];
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v4;
}

void sub_1000546B0(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    [*(id *)(*(void *)(a1 + 40) + 80) removeObjectForKey:];
  }
}

void sub_100054C60(uint64_t a1)
{
  id v3 = [[objc_msgSend(*(id *)(a1 + 32), "__ipv6SetupConfig") objectForKeyedSubscript:kSCPropNetIPv6ConfigMethod];
  if ([v3 isEqualToString:kSCValNetIPv6ConfigMethodAutomatic])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = 1;
  }
  else if ([v3 isEqualToString:kSCValNetIPv6ConfigMethodLinkLocal])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = 2;
  }
  else if ([v3 isEqualToString:kSCValNetIPv6ConfigMethodManual])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = 3;
  }
  else if ([v3 isEqualToString:kSCValNetIPv6ConfigMethodRouterAdvertisement])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = 4;
  }
  else
  {
    unsigned int v6 = [v3 isEqualToString:kSCValNetIPv6ConfigMethod6to4];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v6) {
      uint64_t v5 = 5;
    }
    else {
      uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  *(void *)(v4 + 24) = v5;
}

void sub_100054E38(uint64_t a1)
{
  id v3 = [[objc_msgSend(*(id *)(a1 + 32), "__ipv4SetupConfig") objectForKeyedSubscript:kSCPropNetIPv4ConfigMethod];
  if ([v3 isEqualToString:kSCValNetIPv4ConfigMethodAutomatic])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = 1;
  }
  else if ([v3 isEqualToString:kSCValNetIPv4ConfigMethodLinkLocal])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = 2;
  }
  else if ([v3 isEqualToString:kSCValNetIPv4ConfigMethodDHCP])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = 3;
  }
  else if ([v3 isEqualToString:kSCValNetIPv4ConfigMethodManual])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = 4;
  }
  else if ([v3 isEqualToString:kSCValNetIPv4ConfigMethodBOOTP])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = 5;
  }
  else if ([v3 isEqualToString:kSCValNetIPv4ConfigMethodINFORM])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = 6;
  }
  else
  {
    unsigned int v6 = [v3 isEqualToString:kSCValNetIPv4ConfigMethodPPP];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    if (v6) {
      uint64_t v5 = 7;
    }
    else {
      uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  *(void *)(v4 + 24) = v5;
}

void sub_100055060(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "__dnsSetupConfig")) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_100055168(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) __proxiesSetupConfig];
  if ([v3 count] != (id)2)
  {
    if ([v3 count]) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  id v4 = [v3 objectForKeyedSubscript:kSCPropNetProxiesExceptionsList];
  if ([v4 count] == (id)2
    && [v4 containsObject:@"*.local"]
    && [v4 containsObject:@"169.254/16"]
    && (objc_msgSend(objc_msgSend(v3, "objectForKeyedSubscript:", kSCPropNetProxiesFTPPassive), "BOOLValue") & 1) != 0)
  {
LABEL_8:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
LABEL_9:
}

void sub_100055978(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = [*(id *)(a1 + 40) copy];
}

void sub_100055AA4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 24))
  {
    *(unsigned char *)(v3 + 24) = 1;
    id v4 = *(id *)(a1 + 32);
    [+[BluetoothManager sharedInstance] maskLocalDeviceEvents:0];
    uint64_t v5 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v5 addObserver:*(void *)(a1 + 32) selector:"__ios__handleBTAvailabilityNotification:" name:BluetoothAvailabilityChangedNotification object:0];
    [(NSNotificationCenter *)v5 addObserver:*(void *)(a1 + 32) selector:"__ios__handleBTPowerNotification:" name:BluetoothPowerChangedNotification object:0];
    [(NSNotificationCenter *)v5 addObserver:*(void *)(a1 + 32) selector:"__ios__handleBTConnectabiliyNotification:" name:BluetoothConnectabilityChangedNotification object:0];
    [(NSNotificationCenter *)v5 addObserver:*(void *)(a1 + 32) selector:"__ios__handleBTDiscoveryNotification:" name:BluetoothDiscoveryStateChangedNotification object:0];
    [(NSNotificationCenter *)v5 addObserver:*(void *)(a1 + 32) selector:"__ios__handleBTAdvertisingNotification:" name:BluetoothAdvertisingStateChangedNotification object:0];
  }
}

void sub_100055C4C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 24))
  {
    *(unsigned char *)(v3 + 24) = 0;
    [+[BluetoothManager sharedInstance] maskLocalDeviceEvents:0xFFFFFFFFLL];
    [+[NSNotificationCenter defaultCenter] removeObserver:*(void *)(a1 + 32)];
  }
}

void sub_100055D70(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [+[BluetoothManager sharedInstance] powerState] == 2;
}

void sub_100055EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100055EBC(uint64_t a1, uint64_t a2)
{
}

void sub_100055ECC(uint64_t a1)
{
}

void sub_100055ED8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [[-[BluetoothManager localAddress](+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance")) copy];
}

void sub_100055FDC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [+[BluetoothManager sharedInstance] isDiscoverable];
}

void sub_1000560DC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [+[BluetoothManager sharedInstance] connectable];
}

void sub_1000561DC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [+[BluetoothManager sharedInstance] available];
}

void sub_1000562DC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [+[BluetoothManager sharedInstance] deviceScanningInProgress];
}

void sub_1000563A8(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)W5Event);
  [v3 setEventID:3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTimestamp:];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_1000564AC(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)W5Event);
  [v3 setEventID:3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTimestamp:];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_1000565B0(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)W5Event);
  [v3 setEventID:3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTimestamp:];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_1000566B4(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)W5Event);
  [v3 setEventID:3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTimestamp:];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_1000567B8(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)W5Event);
  [v3 setEventID:3];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTimestamp:];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_1000573A4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) __nextRequest];
}

void sub_100057574(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) __pendingRequestWithUUID:*(void *)(a1 + 40)];
  if (v3)
  {
    uint64_t v4 = v3;
    if ([v3 reply])
    {
      uint64_t v5 = (void (**)(id, NSError *))[v4 reply];
      NSErrorUserInfoKey v17 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v18 = @"W5CancelledErr";
      v5[2](v5, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 6, +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1]));
    }
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
    [*(id *)(*(void *)(a1 + 32) + 48) removeObject:v4];
  }
  else if (objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "requestInfo"), "uuid"), "isEqual:", *(void *)(a1 + 40)))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void **)(v7 + 24);
    if (v8)
    {
      kill((pid_t)[v8 processIdentifier], 9);

      *(void *)(*(void *)(a1 + 32) + 24) = 0;
      uint64_t v7 = *(void *)(a1 + 32);
    }
    id v9 = *(void **)(v7 + 32);
    if (v9)
    {
      kill((pid_t)[v9 processIdentifier], 9);

      *(void *)(*(void *)(a1 + 32) + 32) = 0;
      uint64_t v7 = *(void *)(a1 + 32);
    }
    unsigned __int8 v10 = [[objc_msgSend(*(id *)(v7 + 56), "requestInfo") tcpDump];
    id v11 = *(id **)(a1 + 32);
    if ((v10 & 1) == 0)
    {
      [v11 stopSniffingActiveRequestWithError:0];
      goto LABEL_24;
    }
    if (objc_msgSend(objc_msgSend(v11[7], "requestInfo"), "reply"))
    {
      unint64_t v12 = (void (**)(id, void))[objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "requestInfo") reply];
      v12[2](v12, 0);
    }
    uint64_t v13 = *(void *)(a1 + 48);
    if (v13) {
      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
    }

    *(void *)(*(void *)(a1 + 32) + 56) = 0;
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14)
    {
      NSErrorUserInfoKey v15 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v16 = @"W5ParamErr";
      (*(void (**)(uint64_t, NSError *))(v14 + 16))(v14, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 1, +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1]));
    }
  }
  if (*(void *)(*(void *)(a1 + 32) + 16)
    && +[W5FeatureAvailability isInternalBuild])
  {
    [*(id *)(*(void *)(a1 + 32) + 16) removeNotificationWithUUID:*(void *)(a1 + 40)];
  }
LABEL_24:
}

void sub_100057958(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(NSObject **)(v2 + 64);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000579CC;
  v4[3] = &unk_1000DDC30;
  void v4[4] = v2;
  void v4[5] = a2;
  dispatch_async(v3, v4);
}

void sub_1000579CC(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = *(id *)(a1 + 40);
}

void sub_1000582EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 64);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100058364;
  block[3] = &unk_1000DD8E0;
  void block[4] = a3;
  void block[5] = v3;
  void block[6] = a2;
  dispatch_async(v4, block);
}

void sub_100058364(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = sub_10009756C();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v11 = 136315906;
      unint64_t v12 = "-[W5WiFiSniffManager __nextRequest]_block_invoke_2";
      __int16 v13 = 2080;
      uint64_t v14 = "W5WiFiSniffManager.m";
      __int16 v15 = 1024;
      int v16 = 378;
      __int16 v17 = 2114;
      uint64_t v18 = v6;
      LODWORD(v10) = 38;
      id v9 = &v11;
      _os_log_send_and_compose_impl();
    }
    if (objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "requestInfo", v9, v10), "reply"))
    {
      uint64_t v7 = (void (**)(id, void))[objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "requestInfo") reply];
      v7[2](v7, *(void *)(a1 + 32));
    }

    *(void *)(*(void *)(a1 + 40) + 56) = 0;
    [*(id *)(a1 + 40) __nextRequest];
  }
  else
  {
    if (v5)
    {
      int v11 = 136315650;
      unint64_t v12 = "-[W5WiFiSniffManager __nextRequest]_block_invoke";
      __int16 v13 = 2080;
      uint64_t v14 = "W5WiFiSniffManager.m";
      __int16 v15 = 1024;
      int v16 = 389;
      _os_log_send_and_compose_impl();
    }
    uint64_t v8 = *(void *)(a1 + 40);
    if (*(void *)(v8 + 16))
    {
      [*(id *)(*(void *)(a1 + 40) + 16) dispatchNotificationWithTitle:[NSString stringWithFormat:@"%@ %@", @"Sniffer on Channel", objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(v8 + 56), "requestInfo"), "channel"), "snifferDescription")] subtitle:[NSString stringWithFormat:@"%@ %@", @"Sniffer on Channel", objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(v8 + 56), "requestInfo"), "channel"), "snifferDescription")] body:[NSString stringWithFormat:@"%@ %@", @"Sniffer on Channel", objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(v8 + 56), "requestInfo"), "channel"), "snifferDescription")] type:UUID actionURL:objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "requestInfo"), "uuid")];
      uint64_t v8 = *(void *)(a1 + 40);
    }

    *(void *)(*(void *)(a1 + 40) + 24) = *(id *)(a1 + 48);
    [*(id *)(a1 + 40) __setupWatchdogTask];
  }
}

void sub_1000585E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 16))
  {
    unsigned int v6 = +[W5FeatureAvailability isInternalBuild];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v6)
    {
      [*(id *)(v4 + 16) removeNotificationWithUUID:[objc_msgSend(*(id *)(v4 + 56), "requestInfo") uuid]];
      uint64_t v4 = *(void *)(a1 + 32);
    }
  }
  uint64_t v7 = *(NSObject **)(v4 + 64);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000586B0;
  v8[3] = &unk_1000DDC30;
  v8[4] = v4;
  v8[5] = a3;
  dispatch_async(v7, v8);
}

void sub_1000586B0(uint64_t a1)
{
  if (objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "requestInfo"), "reply"))
  {
    uint64_t v3 = (void (**)(id, void))[*(id *)(*(void *)(a1 + 32) + 56) requestInfo];
    if ([*(id *)(a1 + 40) code] == (id)3) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = *(void *)(a1 + 40);
    }
    v3[2](v3, v4);
  }

  *(void *)(*(void *)(a1 + 32) + 24) = 0;
  uint64_t v5 = *(void *)(a1 + 32);
  unsigned int v6 = *(void **)(v5 + 32);
  if (v6)
  {
    kill((pid_t)[v6 processIdentifier], 9);

    *(void *)(*(void *)(a1 + 32) + 32) = 0;
    uint64_t v5 = *(void *)(a1 + 32);
  }

  *(void *)(*(void *)(a1 + 32) + 56) = 0;
  [*(id *)(a1 + 32) __nextRequest];
}

uint64_t sub_1000587A4(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    if (objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "requestInfo"), "reply"))
    {
      uint64_t v4 = (void (**)(id, void))[(*(id *)(*(void *)(a1 + 32) + 56)) requestInfo reply];
      v4[2](v4, a2);
    }

    *(void *)(*(void *)(a1 + 32) + 56) = 0;
    uint64_t v5 = *(void **)(a1 + 32);
    return (uint64_t)[v5 __nextRequest];
  }
  else
  {
    uint64_t v7 = sub_10009756C();
    uint64_t result = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (result) {
      return _os_log_send_and_compose_impl();
    }
  }
  return result;
}

void sub_1000589BC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 56) == 0;
}

void sub_100058A7C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  if ((objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "requestInfo"), "tcpDump") & 1) == 0)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    NSErrorUserInfoKey v7 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v8 = @"W5CancelledErr";
    [v3 stopSniffingActiveRequestWithError:[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:6 userInfo:@{@"com.apple.wifivelocity.error":@"com.apple.wifivelocity.error"}]];
  }

  *(void *)(*(void *)(a1 + 32) + 56) = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 24);
  if (v5)
  {
    kill((pid_t)[v5 processIdentifier], 9);

    *(void *)(*(void *)(a1 + 32) + 24) = 0;
    uint64_t v4 = *(void *)(a1 + 32);
  }
  unsigned int v6 = *(void **)(v4 + 32);
  if (v6)
  {
    kill((pid_t)[v6 processIdentifier], 9);

    *(void *)(*(void *)(a1 + 32) + 32) = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

id sub_100059004(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 56) timeoutTimer]
    && !dispatch_source_testcancel((dispatch_source_t)[*(id *)(*(void *)(a1 + 32) + 56) timeoutTimer]))
  {
    dispatch_source_cancel((dispatch_source_t)[*(id *)(*(void *)(a1 + 32) + 56) timeoutTimer]);
  }
  [*(id *)(*(void *)(a1 + 32) + 56) setTimeoutTimer:0];
  uint64_t v2 = sub_10009756C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315650;
    NSErrorUserInfoKey v7 = "-[W5WiFiSniffManager startSniffingWithRequest:interfaceName:reply:]_block_invoke";
    __int16 v8 = 2080;
    id v9 = "W5WiFiSniffManager.m";
    __int16 v10 = 1024;
    int v11 = 613;
    LODWORD(v5) = 28;
    uint64_t v4 = &v6;
    _os_log_send_and_compose_impl();
  }
  return [*(id *)(a1 + 32) stopSniffingActiveRequestWithError:0, v4, v5];
}

uint64_t sub_10005B2C4()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x3052000000;
  int v6 = sub_10005D9A4;
  NSErrorUserInfoKey v7 = sub_10005D9B4;
  uint64_t v0 = qword_1001036F8;
  uint64_t v8 = qword_1001036F8;
  if (!qword_1001036F8)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10007D6B8;
    v2[3] = &unk_1000DD348;
    v2[4] = &v3;
    sub_10007D6B8((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10005B39C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10005B458(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 20_Block_object_dispose(&STACK[0x310], 8) = [*(id *)(a1 + 40) copy];
}

void sub_10005B554(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 224) = [*(id *)(a1 + 40) copy];
}

void sub_10005B650(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 216) = [*(id *)(a1 + 40) copy];
}

void sub_10005BB10(uint64_t a1)
{
  if (objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "itemRequests"), "count") != (id)1
    || objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "itemRequests"), "firstObject"), "itemID") != (id)56)
  {
    if (objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "itemRequests"), "count") != (id)1
      || objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "itemRequests"), "firstObject"), "itemID") != (id)79)
    {
      if (objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"CacheSysdiagnose"), "BOOLValue"))
      {
        uint64_t v14 = sub_10009756C();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v44) = 0;
          LODWORD(v31) = 2;
          CFStringRef v30 = &v44;
          _os_log_send_and_compose_impl();
        }
        __int16 v15 = objc_alloc_init(W5LogItemRequestInternal);
        [(W5LogItemRequestInternal *)v15 setUuid:+[NSUUID UUID]];
        int v35 = +[W5LogItemRequest requestWithItemID:56 configuration:0];
        [(W5LogItemRequestInternal *)v15 setItemRequests:+[NSArray arrayWithObjects:&v35 count:1]];
        [(W5LogItemRequestInternal *)v15 setConfiguration:&off_1000EDFC0];
        [(W5LogItemRequestInternal *)v15 setFilename:[(NSUUID *)[(W5LogItemRequestInternal *)v15 uuid] UUIDString]];
        [(W5LogItemRequestInternal *)v15 setAdditionalLog:0];
        -[W5LogItemRequestInternal setUid:](v15, "setUid:", [*(id *)(a1 + 32) uid]);
        -[W5LogItemRequestInternal setGid:](v15, "setGid:", [*(id *)(a1 + 32) gid]);
        [(W5LogItemRequestInternal *)v15 setIncludeEvents:0];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10005C50C;
        v33[3] = &unk_1000DEB90;
        uint64_t v16 = *(void *)(a1 + 32);
        v33[4] = *(void *)(a1 + 40);
        v33[5] = v15;
        void v33[6] = v16;
        [(W5LogItemRequestInternal *)v15 setReply:v33];
        [*(id *)(*(void *)(a1 + 40) + 48) addObject:v15];
        __int16 v17 = sub_10009756C();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v44) = 0;
          LODWORD(v31) = 2;
          CFStringRef v30 = &v44;
          _os_log_send_and_compose_impl();
        }
        uint64_t v18 = objc_alloc_init(W5LogItemRequestInternal);
        [(W5LogItemRequestInternal *)v18 setUuid:+[NSUUID UUID]];
        __int16 v34 = +[W5LogItemRequest requestWithItemID:79 configuration:0];
        [(W5LogItemRequestInternal *)v18 setItemRequests:+[NSArray arrayWithObjects:&v34 count:1]];
        [(W5LogItemRequestInternal *)v18 setConfiguration:&off_1000EDFE8];
        [(W5LogItemRequestInternal *)v18 setFilename:[(NSUUID *)[(W5LogItemRequestInternal *)v18 uuid] UUIDString]];
        [(W5LogItemRequestInternal *)v18 setAdditionalLog:0];
        -[W5LogItemRequestInternal setUid:](v18, "setUid:", [*(id *)(a1 + 32) uid]);
        -[W5LogItemRequestInternal setGid:](v18, "setGid:", [*(id *)(a1 + 32) gid]);
        [(W5LogItemRequestInternal *)v18 setIncludeEvents:0];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_10005C9E4;
        v32[3] = &unk_1000DEB90;
        uint64_t v19 = *(void *)(a1 + 32);
        v32[4] = *(void *)(a1 + 40);
        v32[5] = v18;
        void v32[6] = v19;
        [(W5LogItemRequestInternal *)v18 setReply:v32];
        [*(id *)(*(void *)(a1 + 40) + 48) addObject:v18];
      }
      goto LABEL_22;
    }
    unsigned int v10 = [[[objc_msgSend(*(id *)(a1 + 32), "configuration") objectForKeyedSubscript:@"AllowCachedSysdiagnose"] BOOLValue];
    uint64_t v11 = *(void *)(a1 + 40);
    if (v10)
    {
      if (*(void *)(v11 + 184))
      {
        unint64_t v12 = sub_10009756C();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = *(void *)(a1 + 32);
          int v44 = 138543362;
          uint64_t v45 = v13;
          LODWORD(v31) = 12;
          CFStringRef v30 = &v44;
          _os_log_send_and_compose_impl();
        }
        uint64_t v8 = *(void *)(a1 + 32);
        NSErrorUserInfoKey v7 = *(void **)(a1 + 40);
        uint64_t v9 = v7[23];
        goto LABEL_15;
      }
      if (objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(v11 + 56), "configuration"), "objectForKeyedSubscript:", @"CachedSysdiagnose"), "BOOLValue"))
      {
        id v27 = sub_10009756C();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v44) = 0;
          LODWORD(v31) = 2;
          CFStringRef v30 = &v44;
          goto LABEL_41;
        }
LABEL_42:
        [*(id *)(*(void *)(a1 + 40) + 48) addObject:*(void *)(a1 + 32), v30, v31];
        goto LABEL_23;
      }
      if (objc_msgSend(*(id *)(a1 + 40), "__logItems:containsID:", objc_msgSend(*(id *)(a1 + 40), "__expandLogItems:configuration:", objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "itemRequests"), objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "configuration")), 14))
      {
        NSErrorUserInfoKey v29 = sub_10009756C();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v44) = 0;
          LODWORD(v31) = 2;
          CFStringRef v30 = &v44;
          _os_log_send_and_compose_impl();
        }
        if (objc_msgSend(*(id *)(a1 + 32), "reply", v30, v31))
        {
          id v21 = [*(id *)(a1 + 32) reply];
          NSErrorDomain v22 = NSPOSIXErrorDomain;
          NSErrorUserInfoKey v38 = NSLocalizedFailureReasonErrorKey;
          CFStringRef v39 = @"EDEADLK";
          char v23 = &v39;
          uint64_t v24 = &v38;
          goto LABEL_34;
        }
        goto LABEL_23;
      }
LABEL_22:
      [*(id *)(*(void *)(a1 + 40) + 48) addObject:*(void *)(a1 + 32), v30, v31];
      [*(id *)(a1 + 40) __nextRequest];
      goto LABEL_23;
    }
    if (![[v11 __logItems:containsID:[v11 __expandLogItems:configuration:[v11 itemRequests] configuration:[v11 configuration]]] containsID:14])goto LABEL_22; {
    uint64_t v25 = sub_10009756C();
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v44) = 0;
      LODWORD(v31) = 2;
      CFStringRef v30 = &v44;
      _os_log_send_and_compose_impl();
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "reply", v30, v31)) {
      goto LABEL_23;
    }
    id v21 = [*(id *)(a1 + 32) reply];
    NSErrorDomain v22 = NSPOSIXErrorDomain;
    NSErrorUserInfoKey v36 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v37 = @"EDEADLK";
    char v23 = &v37;
    uint64_t v24 = &v36;
LABEL_34:
    (*((void (**)(id, NSError *, void, void))v21 + 2))(v21, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v22, 11, +[NSDictionary dictionaryWithObjects:v23 forKeys:v24 count:1]), 0, 0);
    goto LABEL_23;
  }
  unsigned int v3 = [[[*(id *)(a1 + 32) configuration] objectForKeyedSubscript:@"AllowCachedSysdiagnose"] BOOLValue];
  uint64_t v4 = *(void *)(a1 + 40);
  if (!v3)
  {
    if (![v4 __logItems:containsID:[v4 __expandLogItems:configuration:objc_msgSend(*(id *)(v4 + 56), "itemRequests"), objc_msgSend(*(id *)(*(void *)(a1 + 40) + 56), "configuration")] 14])goto LABEL_22; {
    uint64_t v20 = sub_10009756C();
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v44) = 0;
      LODWORD(v31) = 2;
      CFStringRef v30 = &v44;
      _os_log_send_and_compose_impl();
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "reply", v30, v31)) {
      goto LABEL_23;
    }
    id v21 = [*(id *)(a1 + 32) reply];
    NSErrorDomain v22 = NSPOSIXErrorDomain;
    NSErrorUserInfoKey v40 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v41 = @"EDEADLK";
    char v23 = &v41;
    uint64_t v24 = &v40;
    goto LABEL_34;
  }
  if (*(void *)(v4 + 176))
  {
    uint64_t v5 = sub_10009756C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v44 = 138543362;
      uint64_t v45 = v6;
      LODWORD(v31) = 12;
      CFStringRef v30 = &v44;
      _os_log_send_and_compose_impl();
    }
    uint64_t v8 = *(void *)(a1 + 32);
    NSErrorUserInfoKey v7 = *(void **)(a1 + 40);
    uint64_t v9 = v7[22];
LABEL_15:
    [v7 __replyWithCachedSysdiagnoseContentForRequest:v8 temporaryURL:v9];
    goto LABEL_23;
  }
  if (objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(v4 + 56), "configuration"), "objectForKeyedSubscript:", @"CachedSysdiagnose"), "BOOLValue"))
  {
    id v26 = sub_10009756C();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v44) = 0;
      LODWORD(v31) = 2;
      CFStringRef v30 = &v44;
LABEL_41:
      _os_log_send_and_compose_impl();
      goto LABEL_42;
    }
    goto LABEL_42;
  }
  if (![[*(id *)(a1 + 40) __logItems:containsID:][*(id *)(a1 + 40) __expandLogItems:configuration:][*(id *)(*(void *)(a1 + 40) + 56) itemRequests][*(id *)(*(void *)(a1 + 40) + 56) configuration] __logItems:containsID:])goto LABEL_22; {
  id v28 = sub_10009756C();
  }
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v44) = 0;
    LODWORD(v31) = 2;
    CFStringRef v30 = &v44;
    _os_log_send_and_compose_impl();
  }
  if (objc_msgSend(*(id *)(a1 + 32), "reply", v30, v31))
  {
    id v21 = [*(id *)(a1 + 32) reply];
    NSErrorDomain v22 = NSPOSIXErrorDomain;
    NSErrorUserInfoKey v42 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v43 = @"EDEADLK";
    char v23 = &v43;
    uint64_t v24 = &v42;
    goto LABEL_34;
  }
LABEL_23:
}

void sub_10005C50C(int8x16_t *a1, uint64_t a2, uint64_t a3)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  int8x16_t v3 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v4 = a1[2].i64[0];
  _DWORD v7[2] = sub_10005C594;
  v7[3] = &unk_1000DEB68;
  uint64_t v5 = *(NSObject **)(v4 + 40);
  int8x16_t v8 = v3;
  uint64_t v6 = a1[3].i64[0];
  uint64_t v9 = a3;
  uint64_t v10 = v6;
  dispatch_async(v5, v7);
}

void sub_10005C594(id *a1)
{
  int8x16_t v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [[[a1[4] uuid] UUIDString] substringToIndex:5];
    int v20 = 138543362;
    id v21 = v4;
    LODWORD(v15) = 12;
    uint64_t v13 = &v20;
    _os_log_send_and_compose_impl();
  }
  if (*((void *)a1[5] + 22))
  {
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", [*((id *)a1[5] + 22) path], 0);
  }
  *((void *)a1[5] + 22) = [a1[6] copy:v13, v15];
  id v5 = +[NSMutableIndexSet indexSet];
  if ([*((id *)a1[5] + 6) count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [*((id *)a1[5] + 6) objectAtIndexedSubscript:v6];
      if (objc_msgSend(objc_msgSend(v7, "itemRequests"), "count") == (id)1
        && objc_msgSend(objc_msgSend(objc_msgSend(v7, "itemRequests"), "firstObject"), "itemID") == (id)56
        && objc_msgSend(objc_msgSend(objc_msgSend(a1[7], "configuration"), "objectForKeyedSubscript:", @"AllowCachedSysdiagnose"), "BOOLValue"))
      {
        int8x16_t v8 = sub_10009756C();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138543362;
          id v21 = v7;
          LODWORD(v16) = 12;
          uint64_t v14 = &v20;
          _os_log_send_and_compose_impl();
        }
        [a1[5] __replyWithCachedSysdiagnoseContentForRequest:v7 temporaryURL:a1[6] temporaryURL:v14 temporaryURL:v16];
        [v5 addIndex:v6];
      }
      ++v6;
    }
    while (v6 < (unint64_t)[*((id *)a1[5] + 6) count]);
  }
  [*((id *)a1[5] + 6) removeObjectsAtIndexes:v5];
  dispatch_time_t v9 = dispatch_time(0, 480000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 5), *(int8x16_t *)(a1 + 5), 8uLL);
  id v11 = a1[5];
  block[2] = sub_10005C888;
  block[3] = &unk_1000DD8E0;
  unint64_t v12 = *((void *)v11 + 5);
  int8x16_t v18 = v10;
  id v19 = a1[4];
  dispatch_after(v9, v12, block);
}

void sub_10005C888(uint64_t a1)
{
  if (*(void *)(a1 + 32) && objc_msgSend(*(id *)(*(void *)(a1 + 40) + 176), "isEqual:"))
  {
    int8x16_t v3 = sub_10009756C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [[[*(id *)(a1 + 48) uuid] UUIDString] substringToIndex:5];
      id v5 = [*(id *)(a1 + 32) path];
      v8[0] = 67109634;
      v8[1] = 480;
      __int16 v9 = 2114;
      id v10 = v4;
      __int16 v11 = 2114;
      id v12 = v5;
      LODWORD(v7) = 28;
      unint64_t v6 = v8;
      _os_log_send_and_compose_impl();
    }
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager", v6, v7), "removeItemAtPath:error:", [*(id *)(*(void *)(a1 + 40) + 176) path], 0);

    *(void *)(*(void *)(a1 + 40) + 176) = 0;
  }
}

void sub_10005C9E4(int8x16_t *a1, uint64_t a2, uint64_t a3)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  int8x16_t v3 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v4 = a1[2].i64[0];
  _DWORD v7[2] = sub_10005CA6C;
  v7[3] = &unk_1000DEB68;
  id v5 = *(NSObject **)(v4 + 40);
  int8x16_t v8 = v3;
  uint64_t v6 = a1[3].i64[0];
  uint64_t v9 = a3;
  uint64_t v10 = v6;
  dispatch_async(v5, v7);
}

void sub_10005CA6C(id *a1)
{
  int8x16_t v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [[[a1[4] uuid] UUIDString] substringToIndex:5];
    int v20 = 138543362;
    id v21 = v4;
    LODWORD(v15) = 12;
    uint64_t v13 = &v20;
    _os_log_send_and_compose_impl();
  }
  if (*((void *)a1[5] + 23))
  {
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", [*((id *)a1[5] + 23) path], 0);
  }
  *((void *)a1[5] + 23) = [a1[6] copy:v13, v15];
  id v5 = +[NSMutableIndexSet indexSet];
  if ([*((id *)a1[5] + 6) count])
  {
    unint64_t v6 = 0;
    do
    {
      id v7 = [*((id *)a1[5] + 6) objectAtIndexedSubscript:v6];
      if (objc_msgSend(objc_msgSend(v7, "itemRequests"), "count") == (id)1
        && objc_msgSend(objc_msgSend(objc_msgSend(v7, "itemRequests"), "firstObject"), "itemID") == (id)79
        && objc_msgSend(objc_msgSend(objc_msgSend(a1[7], "configuration"), "objectForKeyedSubscript:", @"AllowCachedSysdiagnose"), "BOOLValue"))
      {
        int8x16_t v8 = sub_10009756C();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138543362;
          id v21 = v7;
          LODWORD(v16) = 12;
          uint64_t v14 = &v20;
          _os_log_send_and_compose_impl();
        }
        [a1[5] __replyWithCachedSysdiagnoseContentForRequest:v7 temporaryURL:a1[6]];
        [v5 addIndex:v6];
      }
      ++v6;
    }
    while (v6 < (unint64_t)[*((id *)a1[5] + 6) count]);
  }
  [*((id *)a1[5] + 6) removeObjectsAtIndexes:v5];
  dispatch_time_t v9 = dispatch_time(0, 480000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  int8x16_t v10 = vextq_s8(*(int8x16_t *)(a1 + 5), *(int8x16_t *)(a1 + 5), 8uLL);
  id v11 = a1[5];
  block[2] = sub_10005CD60;
  block[3] = &unk_1000DD8E0;
  id v12 = *((void *)v11 + 5);
  int8x16_t v18 = v10;
  id v19 = a1[4];
  dispatch_after(v9, v12, block);
}

void sub_10005CD60(uint64_t a1)
{
  if (*(void *)(a1 + 32) && objc_msgSend(*(id *)(*(void *)(a1 + 40) + 184), "isEqual:"))
  {
    int8x16_t v3 = sub_10009756C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [[[*(id *)(a1 + 48) uuid] UUIDString] substringToIndex:5];
      id v5 = [*(id *)(a1 + 32) path];
      v8[0] = 67109634;
      v8[1] = 480;
      __int16 v9 = 2114;
      id v10 = v4;
      __int16 v11 = 2114;
      id v12 = v5;
      LODWORD(v7) = 28;
      unint64_t v6 = v8;
      _os_log_send_and_compose_impl();
    }
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager", v6, v7), "removeItemAtPath:error:", [*(id *)(*(void *)(a1 + 40) + 184) path], 0);

    *(void *)(*(void *)(a1 + 40) + 184) = 0;
  }
}

void sub_10005CF34(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) __pendingRequestWithUUID:*(void *)(a1 + 40)];
  if (v3)
  {
    id v4 = v3;
    if ([v3 reply])
    {
      id v5 = [v4 reply];
      NSErrorUserInfoKey v14 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v15 = @"W5CancelledErr";
      (*((void (**)(id, NSError *, void, void))v5 + 2))(v5, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 6, +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1]), 0, 0);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    if (v6) {
      (*(void (**)(uint64_t, void))(v6 + 16))(v6, 0);
    }
    [*(id *)(*(void *)(a1 + 32) + 48) removeObject:v4];
  }
  else if (objc_msgSend(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "uuid"), "isEqual:", *(void *)(a1 + 40)))
  {
    if ([*(id *)(*(void *)(a1 + 32) + 56) reply])
    {
      id v7 = [*(id *)(*(void *)(a1 + 32) + 56) reply];
      NSErrorUserInfoKey v12 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v13 = @"W5CancelledErr";
      (*((void (**)(id, NSError *, void, void))v7 + 2))(v7, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 6, +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1]), 0, 0);
    }
    uint64_t v8 = *(void *)(a1 + 48);
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }

    *(void *)(*(void *)(a1 + 32) + 56) = 0;
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9)
    {
      NSErrorUserInfoKey v10 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v11 = @"W5ParamErr";
      (*(void (**)(uint64_t, NSError *))(v9 + 16))(v9, +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 1, +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1]));
    }
  }
}

void sub_10005D26C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];

  *(void *)(*(void *)(a1 + 32) + 56) = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [[*(id *)(*(void *)(a1 + 32) + 72) allValues];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        kill((pid_t)[*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) processIdentifier], 9);
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

int64_t sub_10005D83C(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a2 compare:a3];
}

void sub_10005D98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10005D9A4(uint64_t a1, uint64_t a2)
{
}

void sub_10005D9B4(uint64_t a1)
{
}

void sub_10005D9C0(uint64_t a1, NSError *a2, void *a3, uint64_t a4)
{
  id v8 = [[objc_msgSend(*(id *)(a1 + 32), "configuration") objectForKeyedSubscript:@"CleanupDelay"];
  unsigned int v9 = [[[objc_msgSend(*(id *)(a1 + 32), "configuration") objectForKeyedSubscript:@"Compress"] BOOLValue];
  if (a3)
  {
    id v21 = a3;
    uint64_t v24 = 0;
    long long v10 = -[NSURL URLByAppendingPathComponent:](+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", @"/var/run/com.apple.wifivelocity"), "URLByAppendingPathComponent:", [*(id *)(a1 + 32) filename]);
    if (v9)
    {
      sub_1000975B0(v21, v10, &v24);
    }
    else
    {
      NSErrorUserInfoKey v12 = +[NSFileManager defaultManager];
      v28[0] = &off_1000EB2A8;
      v27[0] = NSFilePosixPermissions;
      v27[1] = NSFileOwnerAccountID;
      v28[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 32) uid]);
      v27[2] = NSFileGroupOwnerAccountID;
      v28[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 32) gid]);
      -[NSFileManager setAttributes:ofItemAtPath:error:](v12, "setAttributes:ofItemAtPath:error:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3), [v21 path], 0);
    }
    CFStringRef v13 = v10;
    if (objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"Reason"))
    {
      NSErrorUserInfoKey v14 = -[NSURL URLByAppendingPathComponent:](-[NSURL URLByAppendingPathComponent:](-[NSFileManager containerURLForSecurityApplicationGroupIdentifier:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "containerURLForSecurityApplicationGroupIdentifier:", @"group.com.apple.wifi.logs"), "URLByAppendingPathComponent:", @"previous"), "URLByAppendingPathComponent:", [*(id *)(a1 + 32) filename]);
      sub_1000980A8(v10, v14, &v24);
      CFStringRef v15 = +[NSFileManager defaultManager];
      v26[0] = &off_1000EB2A8;
      v25[0] = NSFilePosixPermissions;
      v25[1] = NSFileOwnerAccountID;
      v26[1] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 32) uid]);
      v25[2] = NSFileGroupOwnerAccountID;
      v26[2] = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 32) gid]);
      [(NSFileManager *)v15 setAttributes:+[NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:3] ofItemAtPath:[(NSURL *)v14 path] error:0];
    }
    a3 = v21;
    if ([*(id *)(a1 + 32) reply])
    {
      uint64_t v16 = (void (**)(id, NSError *, NSURL *, void))[*(id *)(a1 + 32) reply];
      if (v24) {
        __int16 v17 = v24;
      }
      else {
        __int16 v17 = a2;
      }
      v16[2](v16, v17, v13, a4);
    }
  }
  else if ([*(id *)(a1 + 32) reply])
  {
    id v11 = [*(id *)(a1 + 32) reply];
    (*((void (**)(id, NSError *, void, void))v11 + 2))(v11, a2, 0, 0);
  }
  [objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "clearCachedStatusWithUUID:", objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"));
  [objc_msgSend(*(id *)(*(void *)(a1 + 40) + 8), "wifi") clearCachedPreferredNetworksListWithUUID:[objc_msgSend(*(id *)(a1 + 32), "uuid") UUIDString]];
  [*(id *)(a1 + 40) __purgeFilesInDirectory:-[NSURL path](-[NSURL URLByAppendingPathComponent:](-[NSFileManager containerURLForSecurityApplicationGroupIdentifier:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "containerURLForSecurityApplicationGroupIdentifier:", @"group.com.apple.wifi.logs"), "URLByAppendingPathComponent:", @"previous"), "path"), 0, 604800, 20];
  [*(id *)(a1 + 40) __purgeFilesInDirectory:@"/var/run/com.apple.wifivelocity/wifiperf" matching:0 maxAge:21600 maxCount:10];
  uint64_t v18 = *(void *)(a1 + 40);
  id v19 = *(NSObject **)(v18 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005DE4C;
  block[3] = &unk_1000DEC20;
  void block[4] = v18;
  void block[5] = v8;
  uint64_t v20 = *(void *)(a1 + 32);
  char v23 = v9;
  void block[6] = v20;
  void block[7] = a3;
  void block[8] = *(void *)(a1 + 48);
  dispatch_async(v19, block);
}

void sub_10005DE4C(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 72) allKeys];
  id v4 = [*(id *)(*(void *)(a1 + 32) + 80) allKeys];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 160) allKeys];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 168) allKeys];
  id v7 = *(void **)(a1 + 40);
  if (v7) {
    int64_t v8 = 1000000000 * (void)[v7 unsignedIntegerValue];
  }
  else {
    int64_t v8 = 120000000000;
  }
  dispatch_time_t v9 = dispatch_time(0, v8);
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(NSObject **)(v10 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005DF94;
  block[3] = &unk_1000DEBF8;
  char v21 = *(unsigned char *)(a1 + 72);
  long long v14 = *(_OWORD *)(a1 + 48);
  id v15 = v3;
  uint64_t v16 = v10;
  id v17 = v4;
  id v18 = v5;
  uint64_t v12 = *(void *)(a1 + 64);
  id v19 = v6;
  uint64_t v20 = v12;
  dispatch_after(v9, v11, block);

  *(void *)(*(void *)(a1 + 32) + 56) = 0;
  [*(id *)(a1 + 32) __nextRequest];
}

void sub_10005DF94(uint64_t a1)
{
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [*(id *)(a1 + 32) uuid];
    int v18 = 138543362;
    id v19 = v4;
    LODWORD(v12) = 12;
    id v11 = &v18;
    _os_log_send_and_compose_impl();
  }
  if (*(unsigned char *)(a1 + 96)) {
    -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", [*(id *)(a1 + 40) path], 0);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = *(void **)(a1 + 48);
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*(void *)(a1 + 56) + 72) objectForKeyedSubscript:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if (v10) {
          kill((pid_t)[v10 processIdentifier], 9);
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  [*(id *)(*(void *)(a1 + 56) + 72) removeObjectsForKeys:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 56) + 80) removeObjectsForKeys:*(void *)(a1 + 64)];
  [*(id *)(*(void *)(a1 + 56) + 160) removeObjectsForKeys:*(void *)(a1 + 72)];
  [*(id *)(*(void *)(a1 + 56) + 168) removeObjectsForKeys:*(void *)(a1 + 80)];
  [+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionComplete:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];

  *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) = 0;
}

void sub_100063840(uint64_t a1)
{
  id v3 = +[NSMutableDictionary dictionary];
  [*(id *)(*(void *)(a1 + 32) + 104) setObject:v3 forKeyedSubscript:[objc_msgSend(*(id *)(a1 + 40), "uuid") UUIDString]];
  [*(id *)(*(void *)(a1 + 32) + 96) setObject:[+[NSMutableString string](NSMutableString, "string") UUIDString]:objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(void **)(a1 + 48);
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 setObject:*(void *)(*((void *)&v13 + 1) + 8 * i) forKeyedSubscript:objc_msgSend(objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "uuid"), "UUIDString")];
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v6);
  }
  unsigned int v9 = [[[*(id *)(a1 + 40) configuration] objectForKeyedSubscript:@"UseMegaWiFiProfileLimits"] BOOLValue];
  id v10 = "NOT ";
  if (v9) {
    id v10 = "";
  }
  id v11 = +[NSString stringWithFormat:@"MegaWiFi profile %sinstalled\n", v10];
  [objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")) appendString:v11];
  uint64_t v12 = sub_10009756C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    int v18 = v11;
    _os_log_send_and_compose_impl();
  }
}

void sub_100063A94(uint64_t a1)
{
  id v2 = +[NSMutableArray array];
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3052000000;
  id v27 = sub_10005D9A4;
  id v28 = sub_10005D9B4;
  uint64_t v29 = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  char v23 = 0;
  id v3 = dispatch_queue_create(0, 0);
  id v4 = [[objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"Timeout") unsignedIntegerValue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063D74;
  block[3] = &unk_1000DECC0;
  long long v15 = *(_OWORD *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 32);
  long long v17 = *(_OWORD *)(a1 + 56);
  int v18 = v3;
  id v19 = v2;
  uint64_t v20 = v22;
  char v21 = &v24;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  [objc_msgSend(*(id *)(*(void *)(a1 + 48) + 8), "concurrentQueue") addOperationWithBlock:v5];
  if (v4) {
    dispatch_time_t v6 = dispatch_time(0, 1000000 * (void)v4);
  }
  else {
    dispatch_time_t v6 = -1;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  void v13[2] = sub_100064448;
  v13[3] = &unk_1000DE760;
  v13[4] = v22;
  void v13[5] = &v24;
  void v13[6] = dispatch_block_wait(v5, v6);
  dispatch_sync(v3, v13);
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(NSObject **)(v7 + 88);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006453C;
  v12[3] = &unk_1000DECE8;
  v12[7] = &v24;
  v12[8] = v4;
  uint64_t v9 = *(void *)(a1 + 32);
  void v12[4] = v7;
  v12[5] = v9;
  void v12[6] = *(void *)(a1 + 56);
  dispatch_sync(v8, v12);
  uint64_t v10 = *(void *)(a1 + 72);
  if (v10) {
    (*(void (**)(uint64_t, id, void, id))(v10 + 16))(v10, [(id)v25[5] copy], *(void *)(a1 + 56), v2);
  }
  id v11 = (id)v25[5];
  dispatch_release(v3);
  _Block_release(v5);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);
}

void sub_100063D48(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100063D74(uint64_t a1)
{
  unint64_t v2 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  uint64_t v31 = 0;
  __int16 v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  while (v2 < (unint64_t)[*(id *)(a1 + 32) count]
       && !*((unsigned char *)v32 + 24)
       && !*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    int8x16_t v5 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
    uint64_t v6 = *(void *)(a1 + 40);
    block[2] = sub_1000640CC;
    block[3] = &unk_1000DEC70;
    uint64_t v7 = *(NSObject **)(v6 + 40);
    int8x16_t v28 = v5;
    id v29 = v4;
    unint64_t v30 = v2;
    dispatch_sync(v7, block);
    uint64_t v8 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", [v4 configuration]);
    [(NSMutableDictionary *)v8 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"OutputDirectory"];
    [(NSMutableDictionary *)v8 setObject:*(void *)(a1 + 64) forKeyedSubscript:@"HomeDirectory"];
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, @"InternalUUID", objc_msgSend(objc_msgSend(objc_msgSend(*(id *)(a1 + 48), "uuid"), "UUIDString"), "copy"));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 48) includeEvents]), @"IncludeEvents");
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, @"UseMegaWiFiProfileLimits", objc_msgSend(objc_msgSend(*(id *)(a1 + 48), "configuration"), "objectForKeyedSubscript:", @"UseMegaWiFiProfileLimits"));
    id v9 = [v4 copy];
    [v9 setConfiguration:v8];
    id v10 = [*(id *)(a1 + 40) __collectLogItem:v9 error:0];
    id v11 = v10;
    if (v10)
    {
      [v10 setRequest:v4];
      uint64_t v12 = *(NSObject **)(a1 + 72);
      uint64_t v13 = *(void *)(a1 + 80);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100064168;
      void v26[3] = &unk_1000DE6E8;
      uint64_t v14 = *(void *)(a1 + 88);
      v26[5] = v11;
      v26[6] = v14;
      void v26[4] = v13;
      dispatch_sync(v12, v26);
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000641BC;
    v17[3] = &unk_1000DEC98;
    long long v15 = *(NSObject **)(*(void *)(a1 + 40) + 40);
    long long v18 = *(_OWORD *)(a1 + 40);
    uint64_t v16 = *(void *)(a1 + 72);
    long long v23 = *(_OWORD *)(a1 + 88);
    uint64_t v19 = v16;
    id v20 = v11;
    uint64_t v24 = v35;
    unint64_t v25 = v2;
    uint64_t v21 = *(void *)(a1 + 32);
    NSErrorDomain v22 = &v31;
    dispatch_sync(v15, v17);
    ++v2;
  }
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(v35, 8);
}

void sub_100064098(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1000640CC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) includeEvents])
  {
    if (!*(void *)(a1 + 56))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 208);
      if (v3) {
        [*(id *)(a1 + 32) uuid]
      }
    }
  }
}

void sub_100064168(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
}

void sub_1000641BC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = [objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "uuid") isEqual:objc_msgSend(*(id *)(a1 + 40), "uuid")] ^ 1;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    uint64_t v3 = *(NSObject **)(a1 + 48);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006436C;
    v9[3] = &unk_1000DE398;
    long long v10 = *(_OWORD *)(a1 + 80);
    dispatch_sync(v3, v9);
  }
  *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 96) + 8)
                                                                          + 24)
                                                              + 1.0;
  if ([*(id *)(a1 + 40) includeEvents])
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 208);
    if (v4)
    {
      id v5 = [*(id *)(a1 + 40) uuid];
      uint64_t v6 = *(char **)(a1 + 104);
      uint64_t v7 = *(void *)(a1 + 56);
      if (v6 >= (char *)[*(id *)(a1 + 64) count] - 1) {
        id v8 = 0;
      }
      else {
        id v8 = [[objc_msgSend(*(id *)(a1 + 64), "objectAtIndexedSubscript:", *(void *)(a1 + 104) + 1) copy];
      }
      (*(void (**)(uint64_t, id, uint64_t, id, double))(v4 + 16))(v4, v5, v7, v8, *(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)/ (double)(unint64_t)[*(id *)(a1 + 64) count]* 100.0);
    }
  }
}

void sub_10006436C(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    NSErrorUserInfoKey v3 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v4 = @"W5CancelledErr";
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 6, +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1]) copy];
  }
}

void sub_100064448(void *a1)
{
  *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 1;
  if (a1[6])
  {

    NSErrorUserInfoKey v3 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v4 = @"W5TimeoutErr";
    *(void *)(*(void *)(a1[5] + 8) + 40) = [+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"com.apple.wifivelocity.error", 3, +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1]) copy];
  }
}

void sub_10006453C(uint64_t a1)
{
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) code] == (id)3)
  {
    unint64_t v2 = +[NSString stringWithFormat:@"COLLECTION TIMEOUT (timeout=%lums)", *(void *)(a1 + 64)];
    [objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")) appendFormat:@"\n%@\n", v2];
    NSErrorUserInfoKey v3 = sub_10009756C();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_8;
    }
    int v38 = 138543362;
    CFStringRef v39 = (const __CFString *)v2;
    LODWORD(v25) = 12;
    uint64_t v24 = &v38;
    goto LABEL_7;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) code] == (id)6)
  {
    [objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")) appendFormat:@"\n%@\n", @"COLLECTION CANCELLED"];
    CFStringRef v4 = sub_10009756C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 138543362;
      CFStringRef v39 = @"COLLECTION CANCELLED";
      LODWORD(v25) = 12;
      uint64_t v24 = &v38;
LABEL_7:
      _os_log_send_and_compose_impl();
    }
  }
LABEL_8:
  id v5 = [[*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:[objc_msgSend(*(id *)(a1 + 40), "uuid", v24, v25) UUIDString]];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 104) count];
  uint64_t v7 = "";
  if (!v6) {
    uint64_t v7 = " None";
  }
  [v5 appendFormat:@"\nINCOMPLETE:%s\n", v7];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")) allValues];
  id v8 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        id v13 = [[[v12 configuration] objectForKeyedSubscript:@"NameOverride"]
        id v14 = [[*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:[objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString"]];
        id v15 = [[[v12 uuid] UUIDString] substringToIndex:5];
        if (!v13)
        {
          [v12 itemID];
          id v13 = (id)W5DescriptionForLogItemID();
        }
        [v14 appendFormat:@"[%@] %@\n", v15, v13];
      }
      id v9 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v9);
  }
  uint64_t v16 = -[NSFileManager subpathsOfDirectoryAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "subpathsOfDirectoryAtPath:error:", [*(id *)(a1 + 48) path], 0);
  id v17 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:[objc_msgSend(*(id *)(a1 + 40), "uuid") UUIDString]];
  NSUInteger v18 = [(NSArray *)v16 count];
  uint64_t v19 = "";
  if (!v18) {
    uint64_t v19 = " None";
  }
  [v17 appendFormat:@"\nPATHS:%s\n", v19];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v20 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v16);
        }
        [objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:objc_msgSend(objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")), "appendFormat:", @"./%@\n", *(void *)(*((void *)&v28 + 1) + 8 * (void)j)];
      }
      id v21 = [(NSArray *)v16 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v21);
  }
  -[NSFileManager createFileAtPath:contents:attributes:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createFileAtPath:contents:attributes:", [objc_msgSend(*(id *)(a1 + 48), "path") stringByAppendingPathComponent:@"debug-log.txt"], [objc_msgSend(*(id *)(*(void *)(a1 + 32) + 96), "objectForKeyedSubscript:", objc_msgSend(*(id *)(a1 + 40), "uuid"), "UUIDString")) dataUsingEncoding:4], 0);
  [*(id *)(*(void *)(a1 + 32) + 104) removeObjectForKey:[objc_msgSend(*(id *)(a1 + 40), "uuid") UUIDString]];
  [*(id *)(*(void *)(a1 + 32) + 96) removeObjectForKey:[objc_msgSend(*(id *)(a1 + 40), "uuid") UUIDString]];
}

int64_t sub_100065198(id a1, W5DiagnosticsTestResult *a2, W5DiagnosticsTestResult *a3)
{
  [(W5DiagnosticsTestResult *)a2 testCompleted];
  double v5 = v4;
  [(W5DiagnosticsTestResult *)a3 testCompleted];
  if (v5 <= v6) {
    return 1;
  }
  else {
    return -1;
  }
}

void sub_100069BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10006A10C(uint64_t a1, uint64_t a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  int8x16_t v3 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v4 = *(void *)(a1 + 32);
  block[2] = sub_10006A224;
  block[3] = &unk_1000DEB68;
  double v5 = *(NSObject **)(v4 + 40);
  int8x16_t v9 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v10 = a2;
  uint64_t v11 = v6;
  dispatch_async(v5, block);
  uint64_t v12 = +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", +[NSString stringWithFormat:@"%@_tcpdump.pcap", *(void *)(a1 + 64)]);
  [*(id *)(a1 + 56) setRelativeURLs:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1)];
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
}

void sub_10006A224(void *a1)
{
  if (a1[4])
  {
    [*(id *)(a1[5] + 72) setObject:a1[6] forKeyedSubscript:];
    [*(id *)(a1[5] + 80) setObject:+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", a1[7]) forKeyedSubscript:a1[4]];
  }
}

void sub_10006A294(int8x16_t *a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  int8x16_t v1 = vextq_s8(a1[2], a1[2], 8uLL);
  uint64_t v2 = a1[2].i64[0];
  v4[2] = sub_10006A310;
  v4[3] = &unk_1000DDC30;
  int8x16_t v3 = *(NSObject **)(v2 + 40);
  int8x16_t v5 = v1;
  dispatch_async(v3, v4);
}

void sub_10006A310(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    [*(id *)(*(void *)(a1 + 40) + 72) setObject:0 forKeyedSubscript:0];
  }
}

void sub_10006A490(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v3) {
    kill((pid_t)[v3 processIdentifier], 2);
  }
  id v4 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) __collectFileAtURL:v4 outputDirectory:*(void *)(a1 + 48) maxAge:0x7FFFFFFFFFFFFFFFLL maxSize:*(unsigned __int8 *)(a1 + 64) compress:0 remainingSize:1.79769313e308];
    if (v5)
    {
      id v6 = v5;
      [*(id *)(a1 + 56) setRelativeURLs:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1)];
    }
  }
}

void sub_10006A7E4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_10006A804(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 40) __calculateSizeAtPath:[*(id *)(a1 + 48) stringByAppendingPathComponent:[*(id *)(a1 + 32) objectAtIndexedSubscript:a2]]];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10006A8A8;
  v5[3] = &unk_1000DEDC8;
  id v4 = *(NSObject **)(a1 + 56);
  void v5[4] = *(void *)(a1 + 64);
  void v5[5] = v3;
  dispatch_sync(v4, v5);
}

void sub_10006A8A8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += *(void *)(a1 + 40);
}

int64_t sub_10006B69C(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a3 compare:a2];
}

int64_t sub_10006B9F8(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a3 compare:a2];
}

id sub_10006C1B0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) __filterCoreCaptureContent:a2];
}

id sub_10006C4D0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) __filterCoreCaptureContent:a2];
}

void sub_10006C9B4(uint64_t a1)
{
  [objc_msgSend(*(id *)(*(void *)(a1 + 40) + 96), "objectForKeyedSubscript:", objc_msgSend(objc_msgSend(*(id *)(a1 + 32), "configuration"), "objectForKeyedSubscript:", @"InternalUUID")) appendString:@"Filtered known networks for customer install without MegaWiFi profile\n"];
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_10006CC10(id a1)
{
  uint64_t v1 = WiFiManagerClientCreate();
  if (v1)
  {
    uint64_t v2 = (const void *)v1;
    WiFiManagerClientDumpLogs();
    CFRelease(v2);
  }
}

void sub_10006FFD8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_100070030(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 160) objectForKeyedSubscript:a1[5]]->unsignedIntegerValue;
}

void sub_100070088(uint64_t a1)
{
  uint64_t v2 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", [*(id *)(a1 + 32) configuration]);
  [(NSMutableDictionary *)v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"OutputDirectory"];
  [(NSMutableDictionary *)v2 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"HomeDirectory"];
  [(NSMutableDictionary *)v2 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"InternalUUID"];
  [(NSMutableDictionary *)v2 setObject:+[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 104)] forKeyedSubscript:@"IncludeEvents"];
  [(NSMutableDictionary *)v2 setObject:+[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 105)] forKeyedSubscript:@"UseMegaWiFiProfileLimits"];
  id v3 = [*(id *)(a1 + 32) copy];
  [v3 setConfiguration:v2];
  id v4 = [*(id *)(a1 + 64) __collectLogItem:v3 error:0];
  if (v4)
  {
    id v5 = v4;
    [v4 setRequest:*(void *)(a1 + 32)];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000701F0;
    block[3] = &unk_1000DE6E8;
    uint64_t v6 = *(void *)(a1 + 96);
    void block[5] = v5;
    void block[6] = v6;
    uint64_t v7 = *(NSObject **)(a1 + 72);
    void block[4] = *(void *)(a1 + 80);
    dispatch_sync(v7, block);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 88));
}

void sub_1000701F0(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  }
}

void sub_100070244(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

void sub_100070288(void *a1)
{
  [*(id *)(a1[4] + 160) setObject:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1[6]) forKeyedSubscript:a1[5]];
}

void sub_1000702E4(void *a1)
{
  if (a1[4]) {
    [*(id *)(a1[5] + 168) setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1[6]) forKeyedSubscript:a1[4]];
  }
}

uint64_t sub_100070A74(uint64_t a1)
{
  if (!IOReportChannelGetGroup()) {
    return 16;
  }
  CFStringRef Group = (const __CFString *)IOReportChannelGetGroup();
  return 16 * (CFStringFind(Group, (CFStringRef)*(void *)(a1 + 32), 1uLL).location == -1);
}

uint64_t sub_100070ACC(uint64_t a1)
{
  if (!IOReportChannelGetGroup()) {
    return 16;
  }
  CFStringRef Group = (const __CFString *)IOReportChannelGetGroup();
  return 16 * (CFStringFind(Group, (CFStringRef)*(void *)(a1 + 32), 1uLL).location == -1);
}

uint64_t sub_100070B24(uint64_t a1)
{
  if (!IOReportChannelGetSubGroup()) {
    return 16;
  }
  SubCFStringRef Group = (const __CFString *)IOReportChannelGetSubGroup();
  return 16 * (CFStringFind(SubGroup, (CFStringRef)*(void *)(a1 + 32), 1uLL).location == -1);
}

intptr_t sub_100072BC8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:a2];
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t sub_100073124(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:a2];
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t sub_100073830(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) addObjectsFromArray:a2];
  id v3 = sub_10009756C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

intptr_t sub_100073DC4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100074398(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = +[NSString stringWithFormat:@"%@.%d", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48)];
  id v4 = [objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "corewifi") interfaceName];

  return [v2 __pingWithAddress:v3 count:1 timeout:0 wait:v4 interval:10 trafficClass:1.0 interfaceName:1.0 dataLength:1.0];
}

intptr_t sub_100074430(uint64_t a1)
{
  [*(id *)(a1 + 32) cancelAllOperations];
  uint64_t v2 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v2);
}

void sub_100074C70(_Unwind_Exception *a1)
{
}

void sub_100075258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose((const void *)(v53 - 176), 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

void sub_1000752A4(uint64_t a1)
{
  id v3 = [[objc_msgSend(*(id *)(a1 + 32), "configuration") objectForKeyedSubscript:@"InternalUUID"];
  if (v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 40) + 104) objectForKeyedSubscript:v3];
    if (v4)
    {
      id v5 = v4;
      [v4 setObject:0 forKeyedSubscript:[objc_msgSend(*(id *)(a1 + 32), "uuid") UUIDString]];
      id v6 = [[objc_msgSend(*(id *)(a1 + 32), "configuration") objectForKeyedSubscript:@"Requests"];
      long long v11 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v12;
        do
        {
          uint64_t v10 = 0;
          do
          {
            if (*(void *)v12 != v9) {
              objc_enumerationMutation(v6);
            }
            [v5 setObject:*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) forKeyedSubscript:objc_msgSend(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "uuid"), "UUIDString")];
            uint64_t v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
        }
        while (v8);
      }
    }
  }
}

void sub_100075418(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 160) objectForKeyedSubscript:a1[5]]->unsignedIntegerValue;
}

void sub_100075470(uint64_t a1)
{
  id v2 = [[*(id *)(a1 + 32) __collectIndividual:*(void *)(a1 + 40) error:*(void *)(a1 + 72)];
  id v3 = *(NSObject **)(a1 + 48);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100075508;
  block[3] = &unk_1000DEF60;
  long long v5 = *(_OWORD *)(a1 + 56);
  void block[4] = v2;
  dispatch_sync(v3, block);
}

void sub_100075508(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) copy];
  }
}

void sub_100075568(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  if (*(void *)(a1 + 56))
  {

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_alloc_init((Class)W5LogItemReceipt);
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setRequest:*(void *)(a1 + 32)];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setStartedAt:*(double *)(a1 + 64)];
    +[NSDate timeIntervalSinceReferenceDate];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setCompletedAt:];
    CFStringRef v3 = @"TimeoutOccurred";
    id v4 = +[NSNumber numberWithInt:*(void *)(a1 + 56) != 0];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1)];
  }
}

void sub_1000756A4(void *a1)
{
  [*(id *)(a1[4] + 160) setObject:+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a1[6]) forKeyedSubscript:a1[5]];
}

void sub_100075700(void *a1)
{
  if (a1[4]) {
    [*(id *)(a1[5] + 168) setObject:+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a1[6]) forKeyedSubscript:a1[4]];
  }
}

void sub_100076438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

void sub_1000765EC(uint64_t a1)
{
  id v3 = [[objc_msgSend(*(id *)(a1 + 32), "configuration") objectForKeyedSubscript:@"InternalUUID"];
  id v4 = [[objc_msgSend(*(id *)(a1 + 32), "configuration") objectForKeyedSubscript:@"NameOverride"];
  id v5 = [[*(id *)(*(void *)(a1 + 40) + 64) stringFromDate:+[NSDate date](NSDate, "date")];
  id v6 = [[[objc_msgSend(*(id *)(a1 + 32), "uuid") UUIDString] substringToIndex:5];
  if (!v4) {
    id v4 = *(id *)(a1 + 48);
  }
  [((id)((void *)((*(id *)(*(void *)(a1 + 40) + 96))[v3]))), "appendString:", +[NSString stringWithFormat:](@"%@ [%@] BEGIN   %@", v5, v6, v4)];
  id v7 = sub_10009756C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_10007676C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [(*(id *)(*(void *)(a1 + 32) + 56)) additionalLog];
}

void sub_1000767C4(void *a1)
{
  if (a1[4]) {
    id v3 = [[objc_msgSend(*(id *)(a1[5] + 160), "objectForKeyedSubscript:") unsignedIntegerValue];
  }
  else {
    id v3 = 0;
  }
  *(void *)(*(void *)(a1[7] + 8) + 24) = v3;
  if (a1[6]) {
    id v4 = [[objc_msgSend(*(id *)(a1[5] + 168), "objectForKeyedSubscript:") unsignedLongLongValue];
  }
  else {
    id v4 = 0;
  }
  *(void *)(*(void *)(a1[8] + 8) + 24) = v4;
}

void sub_100076858(uint64_t a1)
{
  id v3 = [[objc_msgSend(*(id *)(a1 + 32), "configuration") objectForKeyedSubscript:@"InternalUUID"];
  id v4 = [[objc_msgSend(*(id *)(a1 + 32), "configuration") objectForKeyedSubscript:@"NameOverride"];
  id v5 = *(void **)(a1 + 40);
  if (v5)
  {
    unsigned int v6 = [[[v5 info] objectForKeyedSubscript:@"TimeoutOccurred"] BOOLValue];
    id v7 = [[*(id *)(*(void *)(a1 + 48) + 64) stringFromDate:+[NSDate date](NSDate, "date")];
    id v8 = [[[objc_msgSend(*(id *)(a1 + 32), "uuid") UUIDString] substringToIndex:5];
    if (v6)
    {
      if (!v4)
      {
        [*(id *)(a1 + 32) itemID];
        id v4 = (id)W5DescriptionForLogItemID();
      }
      [*(id *)(a1 + 40) completedAt];
      double v10 = v9;
      [*(id *)(a1 + 40) startedAt];
      long long v12 = +[NSString stringWithFormat:@"%@ [%@] TIMEOUT %@, took %.6fs\n", v7, v8, v4, v10 - v11];
    }
    else
    {
      if (!v4)
      {
        [*(id *)(a1 + 32) itemID];
        id v4 = (id)W5DescriptionForLogItemID();
      }
      [*(id *)(a1 + 40) completedAt];
      double v17 = v16;
      [*(id *)(a1 + 40) startedAt];
      long long v12 = +[NSString stringWithFormat:@"%@ [%@] END     %@, took %.6fs\n", v7, v8, v4, v17 - v18];
    }
    id v15 = v12;
    [objc_msgSend(*(id *)(*(void *)(a1 + 48) + 104), "objectForKeyedSubscript:", v3) setObject:0 forKeyedSubscript:[objc_msgSend(*(id *)(a1 + 32), "uuid"), "UUIDString"]];
  }
  else
  {
    id v13 = [[*(id *)(*(void *)(a1 + 48) + 64) stringFromDate:+[NSDate date](NSDate, "date")];
    id v14 = [[[objc_msgSend(*(id *)(a1 + 32), "uuid") UUIDString] substringToIndex:5];
    if (!v4)
    {
      [*(id *)(a1 + 32) itemID];
      id v4 = (id)W5DescriptionForLogItemID();
    }
    id v15 = +[NSString stringWithFormat:@"%@ [%@] ERROR   %@, not collected\n", v13, v14, v4];
  }
  [objc_msgSend(*(id *)(*(void *)(a1 + 48) + 96), "objectForKeyedSubscript:", v3) appendString:v15];
  uint64_t v19 = sub_10009756C();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_100076F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_100076FE8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [objc_msgSend(*(id *)(*(void *)(a1 + 32) + 56), "uuid") copy];
}

id sub_100077040(uint64_t a1, void *a2, void *a3)
{
  [*(id *)(a1 + 32) lock];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = [a2 copy];
    *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [a3 copy];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  unsigned int v6 = *(void **)(a1 + 32);

  return [v6 unlock];
}

void sub_10007B358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose((const void *)(v10 - 144), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007B388(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = objc_alloc_init((Class)W5PingResult);
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAddress:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setInterfaceName:[*(id *)(*(void *)(a1 + 40) + 8) interfaceName]];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setCount:(int)[a2 numPingsTransmitted]];
  [a2 packetLossRate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setPacketLoss:];
  [a2 averageRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setAvg:v5 * 1000.0];
  [a2 minRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMin:v6 * 1000.0];
  [a2 maxRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setMax:v7 * 1000.0];
  [a2 standardDeviationRoundtripTime];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStddev:v8 * 1000.0];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setStartedAt:*(double *)(a1 + 64)];
  +[NSDate timeIntervalSinceReferenceDate];
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setEndedAt:];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10007C058(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    id v2 = *(__CFString **)(a1 + 32);
  }
  else {
    id v2 = @"WiFi";
  }
  if (sub_10007DE34())
  {
    uint64_t v15 = 0;
    double v16 = &v15;
    uint64_t v17 = 0x2020000000;
    id v3 = (uint64_t (*)(const CFAllocatorRef))off_100103718;
    double v18 = off_100103718;
    if (!off_100103718)
    {
      double v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472;
      id v13 = sub_10007DF78;
      id v14 = &unk_1000DD348;
      id v4 = sub_10007DFC8();
      v16[3] = (uint64_t)dlsym(v4, "CoreCaptureControlCreate");
      off_100103718 = (_UNKNOWN *)v16[3];
      id v3 = (uint64_t (*)(const CFAllocatorRef))v16[3];
    }
    _Block_object_dispose(&v15, 8);
    if (v3)
    {
      uint64_t v5 = v3(kCFAllocatorDefault);
      if (!v5) {
        return;
      }
      double v6 = (const void *)v5;
      id v7 = [(__CFString *)v2 UTF8String];
      id v8 = [*(id *)(a1 + 40) UTF8String];
      uint64_t v15 = 0;
      double v16 = &v15;
      uint64_t v17 = 0x2020000000;
      double v9 = (void (*)(const void *, id, id))off_100103720;
      double v18 = off_100103720;
      if (!off_100103720)
      {
        double v11 = _NSConcreteStackBlock;
        uint64_t v12 = 3221225472;
        id v13 = sub_10007E064;
        id v14 = &unk_1000DD348;
        uint64_t v10 = sub_10007DFC8();
        v16[3] = (uint64_t)dlsym(v10, "CoreCaptureControlCaptureWithComponentDirectory");
        off_100103720 = (_UNKNOWN *)v16[3];
        double v9 = (void (*)(const void *, id, id))v16[3];
      }
      _Block_object_dispose(&v15, 8);
      if (v9)
      {
        v9(v6, v7, v8);
        CFRelease(v6);
        return;
      }
      [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"Boolean soft_CoreCaptureControlCaptureWithComponentDirectory(CoreCaptureControlRef, const char *, const char *)"], @"W5LogManager.m", 57, @"%s", dlerror(), v11, v12, v13, v14 file lineNumber description];
    }
    else
    {
      [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"CoreCaptureControlRef soft_CoreCaptureControlCreate(CFAllocatorRef)"], @"W5LogManager.m", 53, @"%s", dlerror(), v11, v12, v13, v14 file lineNumber description];
    }
    __break(1u);
  }
}

void sub_10007C304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10007C7DC(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if ((a2 & 2) != 0)
  {
    id v11 = [a11 addDomain:a9 rdlen:a8];
    if (v11)
    {
      id v12 = v11;
      DNSServiceRef sdRef = (DNSServiceRef)[a11 serviceRef];
      DNSServiceErrorType v13 = DNSServiceQueryRecord(&sdRef, 0x4000u, 0, [+[NSString stringWithFormat:@"_services._dns-sd._udp.%@", v12] cStringUsingEncoding:4], 0xCu, 1u, (DNSServiceQueryRecordReply)sub_10007E0B4, a11);
      if (v13)
      {
        DNSServiceErrorType v15 = v13;
        double v16 = sub_10009756C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315906;
          uint64_t v19 = "_ServiceBrowserDomainsQueryCallback";
          __int16 v20 = 2080;
          id v21 = "W5LogManager.m";
          __int16 v22 = 1024;
          int v23 = 10045;
          __int16 v24 = 1024;
          LODWORD(v25) = v15;
          goto LABEL_9;
        }
      }
    }
    else
    {
      id v14 = sub_10009756C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315906;
        uint64_t v19 = "_ServiceBrowserDomainsQueryCallback";
        __int16 v20 = 2080;
        id v21 = "W5LogManager.m";
        __int16 v22 = 1024;
        int v23 = 10039;
        __int16 v24 = 2112;
        uint64_t v25 = 0;
LABEL_9:
        _os_log_send_and_compose_impl();
      }
    }
  }
}

id sub_10007D20C(void *a1)
{
  uint64_t v1 = a1[4];
  uint64_t v2 = a1[5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10007D29C;
  v4[3] = &unk_1000DDCD0;
  void v4[4] = a1[6];
  return +[NSTask runTaskWithLaunchPath:v1 arguments:v2 timeout:0 outputData:0 errorData:0 launchHandler:v4 reply:2.0];
}

uint64_t sub_10007D29C(uint64_t result)
{
  return result;
}

Class sub_10007D6B8(uint64_t a1)
{
  if (!qword_100103700) {
    qword_100103700 = _sl_dlopen();
  }
  Class result = objc_getClass("WADeviceAnalyticsClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  qword_1001036F8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t sub_10007D7BC()
{
  uint64_t result = _sl_dlopen();
  qword_100103700 = result;
  return result;
}

Class sub_10007D830(uint64_t a1)
{
  v6[0] = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v2 = qword_100103710;
  uint64_t v12 = qword_100103710;
  if (!qword_100103710)
  {
    v6[1] = _NSConcreteStackBlock;
    void v6[2] = (void *)3221225472;
    v6[3] = sub_10007DA5C;
    void v6[4] = &unk_1000DEDC8;
    id v7 = &v9;
    id v8 = v6;
    long long v13 = *(_OWORD *)off_1000DF038;
    uint64_t v14 = 0;
    v10[3] = _sl_dlopen();
    qword_100103710 = *(void *)(v7[1] + 24);
    uint64_t v2 = v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v2)
  {
    id v4 = +[NSAssertionHandler currentHandler];
    uint64_t v5 = +[NSString stringWithUTF8String:"void *libsysdiagnoseLibrary(void)"];
    [(NSAssertionHandler *)v4 handleFailureInFunction:v5, @"W5LogManager.m", 69, @"%s", v6[0] file lineNumber description];
    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("Libsysdiagnose");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"Class getLibsysdiagnoseClass(void)_block_invoke"], @"W5LogManager.m", 70, @"Unable to find class %s", "Libsysdiagnose" file lineNumber description];
LABEL_10:
    __break(1u);
  }
  qword_100103708 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

void sub_10007DA3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10007DA5C(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100103710 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_10007DAF4(uint64_t a1)
{
  id v2 = +[NSMutableString string];
  uint64_t v3 = 0;
  while (*(unsigned char *)(a1 + v3))
  {
    if ((*(unsigned char *)(a1 + v3) - 127) >= 0xA1u) {
      [v2 appendFormat:@"%c", *(char *)(a1 + v3)];
    }
    else {
      [v2 appendString:@"."];
    }
    if (++v3 == 32) {
      goto LABEL_11;
    }
  }
  if (v3 <= 0x1F)
  {
    int v4 = 32 - v3;
    do
    {
      [v2 appendString:@" "];
      --v4;
    }
    while (v4);
  }
LABEL_11:
  id v5 = [v2 copy];

  return v5;
}

uint64_t sub_10007DBDC()
{
  if (!qword_1001036E0) {
    qword_1001036E0 = _sl_dlopen();
  }
  return qword_1001036E0;
}

uint64_t sub_10007DCAC()
{
  uint64_t result = _sl_dlopen();
  qword_1001036E0 = result;
  return result;
}

Class sub_10007DD20(uint64_t a1)
{
  if (sub_10007DBDC())
  {
    Class result = objc_getClass("IMPingTest");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
    {
      qword_1001036E8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      return result;
    }
    Class result = (Class)[+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"Class getIMPingTestClass(void)_block_invoke"], @"W5LogManager.m", 66, @"Unable to find class %s", "IMPingTest" file lineNumber description];
  }
  else
  {
    Class result = (Class)[+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"void *IMFoundationLibrary(void)"], @"W5LogManager.m", 65, @"%s", 0 file lineNumber description];
  }
  __break(1u);
  return result;
}

uint64_t sub_10007DE34()
{
  if (!qword_1001036F0) {
    qword_1001036F0 = _sl_dlopen();
  }
  return qword_1001036F0;
}

uint64_t sub_10007DF04()
{
  uint64_t result = _sl_dlopen();
  qword_1001036F0 = result;
  return result;
}

void *sub_10007DF78(uint64_t a1)
{
  id v2 = sub_10007DFC8();
  uint64_t result = dlsym(v2, "CoreCaptureControlCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100103718 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

NSAssertionHandler *sub_10007DFC8()
{
  uint64_t v0 = sub_10007DE34();
  if (v0) {
    return (NSAssertionHandler *)v0;
  }
  uint64_t v1 = +[NSAssertionHandler currentHandler];
  id v3 = [(NSAssertionHandler *)v1 handleFailureInFunction:+[NSString stringWithUTF8String:"void *CoreCaptureControlLibrary(void)"], @"W5LogManager.m", 49, @"%s", 0 file lineNumber description];
  __break(1u);
  free(v3);
  return v1;
}

void *sub_10007E064(uint64_t a1)
{
  id v2 = sub_10007DFC8();
  uint64_t result = dlsym(v2, "CoreCaptureControlCaptureWithComponentDirectory");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100103720 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10007E0B4(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  if ((a2 & 2) != 0)
  {
    id v11 = [a11 addServiceType:a9 rdlen:a8];
    if (v11)
    {
      uint64_t v12 = v11;
      DNSServiceRef sdRef = (DNSServiceRef)[a11 serviceRef];
      DNSServiceErrorType v13 = DNSServiceBrowse(&sdRef, 0x4000u, 0, (const char *)[v12 objectAtIndexedSubscript:0], (const char *)[v12 objectAtIndexedSubscript:1], (DNSServiceBrowseReply)sub_10007E2D0, a11);
      if (v13)
      {
        DNSServiceErrorType v15 = v13;
        double v16 = sub_10009756C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136316162;
          uint64_t v19 = "_ServiceBrowserServicesQueryCallback";
          __int16 v20 = 2080;
          id v21 = "W5LogManager.m";
          __int16 v22 = 1024;
          int v23 = 10014;
          __int16 v24 = 2112;
          uint64_t v25 = v12;
          __int16 v26 = 1024;
          DNSServiceErrorType v27 = v15;
          goto LABEL_9;
        }
      }
    }
    else
    {
      uint64_t v14 = sub_10009756C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315906;
        uint64_t v19 = "_ServiceBrowserServicesQueryCallback";
        __int16 v20 = 2080;
        id v21 = "W5LogManager.m";
        __int16 v22 = 1024;
        int v23 = 10010;
        __int16 v24 = 2112;
        uint64_t v25 = 0;
LABEL_9:
        _os_log_send_and_compose_impl();
      }
    }
  }
}

void sub_10007E2D0(uint64_t a1, char a2, uint32_t a3, uint64_t a4, const char *a5, const char *a6, const char *a7, void *a8)
{
  if ((a2 & 2) != 0)
  {
    if ([a8 addServiceInstance:a5 serviceType:a6 domain:a7])
    {
      DNSServiceRef sdRef = (DNSServiceRef)[a8 serviceRef];
      DNSServiceErrorType v13 = DNSServiceResolve(&sdRef, 0x4000u, a3, a5, a6, a7, (DNSServiceResolveReply)sub_10007E4E0, a8);
      if (v13)
      {
        DNSServiceErrorType v15 = v13;
        double v16 = sub_10009756C();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136316674;
          uint64_t v19 = "_ServiceBrowserBrowseCallback";
          __int16 v20 = 2080;
          id v21 = "W5LogManager.m";
          __int16 v22 = 1024;
          int v23 = 9984;
          __int16 v24 = 2080;
          uint64_t v25 = a5;
          __int16 v26 = 2080;
          DNSServiceErrorType v27 = a6;
          __int16 v28 = 2080;
          long long v29 = a7;
          __int16 v30 = 1024;
          DNSServiceErrorType v31 = v15;
          goto LABEL_9;
        }
      }
    }
    else
    {
      uint64_t v14 = sub_10009756C();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136316418;
        uint64_t v19 = "_ServiceBrowserBrowseCallback";
        __int16 v20 = 2080;
        id v21 = "W5LogManager.m";
        __int16 v22 = 1024;
        int v23 = 9980;
        __int16 v24 = 2080;
        uint64_t v25 = a5;
        __int16 v26 = 2080;
        DNSServiceErrorType v27 = a6;
        __int16 v28 = 2080;
        long long v29 = a7;
LABEL_9:
        _os_log_send_and_compose_impl();
      }
    }
  }
}

uint64_t sub_10007E4E0(uint64_t a1, uint64_t a2, uint32_t a3, uint64_t a4, uint64_t a5, const char *a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  v30[0] = a10;
  v30[1] = +[NSString stringWithFormat:@"%s", a5];
  DNSServiceErrorType v13 = +[NSArray arrayWithObjects:v30 count:2];
  [a10 addBrowseContext:v13];
  DNSServiceRef sdRef = (DNSServiceRef)[a10 serviceRef];
  uint64_t result = DNSServiceGetAddrInfo(&sdRef, 0x4000u, a3, 3u, a6, (DNSServiceGetAddrInfoReply)sub_10007E67C, v13);
  if (result)
  {
    int v15 = result;
    double v16 = sub_10009756C();
    uint64_t result = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (result)
    {
      int v18 = 136316418;
      uint64_t v19 = "_ServiceBrowserResolveCallback";
      __int16 v20 = 2080;
      id v21 = "W5LogManager.m";
      __int16 v22 = 1024;
      int v23 = 9958;
      __int16 v24 = 2080;
      uint64_t v25 = a5;
      __int16 v26 = 2080;
      DNSServiceErrorType v27 = a6;
      __int16 v28 = 1024;
      int v29 = v15;
      return _os_log_send_and_compose_impl();
    }
  }
  return result;
}

id sub_10007E67C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id result = [a8 count];
  if ((a2 & 2) != 0 && result == (id)2)
  {
    id v14 = [a8 objectAtIndexedSubscript:0];
    id v15 = [a8 objectAtIndexedSubscript:1];
    return [v14 addBrowseResult:v15 hostname:a5 address:a6 interfaceIndex:a3];
  }
  return result;
}

void sub_100080958(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 40) copy];
}

void sub_100080A7C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v3 + 20))
  {
    *(unsigned char *)(v3 + 20) = 1;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = *(NSObject **)(v5 + 8);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100080B34;
    handler[3] = &unk_1000DE4F0;
    handler[4] = v5;
    notify_register_dispatch("com.apple.powermanagement.systempowerstate", (int *)(v5 + 16), v6, handler);
  }
}

void sub_100080B34(uint64_t a1)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100080BBC;
  block[3] = &unk_1000DDC80;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

void sub_100080BBC(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)W5Event);
  [v3 setEventID:16];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTimestamp:];
  CFStringRef v5 = @"SystemPowerStateCaps";
  double v6 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [*(id *)(a1 + 32) caps]);
  [v3 setInfo:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 24);
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
  }
}

void sub_100080D38(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 20))
  {
    *(unsigned char *)(v3 + 20) = 0;
    notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 16));
  }
}

void sub_100081738(id a1)
{
  qword_100103728 = objc_alloc_init(W5CloudStore);

  _objc_release_x1();
}

uint64_t sub_100082C94(uint64_t a1)
{
  qword_100103738 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

id sub_100082E50()
{
  uint64_t v4 = 0;
  CFStringRef v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_100103748;
  uint64_t v7 = qword_100103748;
  if (!qword_100103748)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000847C0;
    v3[3] = &unk_1000DD348;
    v3[4] = &v4;
    sub_1000847C0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100082F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100083028(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _getWAAnalyticsAccess];
  [v1 reset];
}

void sub_100083344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Block_object_dispose((const void *)(v29 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100083374(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100083384(uint64_t a1)
{
}

void sub_10008338C(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)W5Event);
  [v3 setEventID:39];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTimestamp:];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  CFStringRef v7 = @"LastHourFaultsStatus";
  uint64_t v8 = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v3 setInfo:v5];

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 56);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void sub_10008348C(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)W5Event);
  [v3 setEventID:40];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTimestamp:];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  CFStringRef v7 = @"LastHourLinkTestsStatus";
  uint64_t v8 = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v3 setInfo:v5];

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 64);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void sub_10008358C(uint64_t a1)
{
  id v3 = objc_alloc_init((Class)W5Event);
  [v3 setEventID:41];
  +[NSDate timeIntervalSinceReferenceDate];
  [v3 setTimestamp:];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  CFStringRef v7 = @"LastHourRecoveriesStatus";
  uint64_t v8 = v4;
  CFStringRef v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v3 setInfo:v5];

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

void sub_1000837E4(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v2 _performFetch:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(a1[6] + 8);
  CFStringRef v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void sub_100083F78(void *a1)
{
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  id v10 = 0;
  uint64_t v6 = [v4 _performFetch:v5 error:&v10];
  id v7 = v10;
  if (v7)
  {
    uint64_t v8 = sub_10009756C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_send_and_compose_impl();
    }
  }
  uint64_t v9 = a1[6];
  if (v9) {
    (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v7, v6);
  }
}

void sub_100084180(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = 0;

  id v5 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v5;
}

void sub_1000842B4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = 0;

  id v5 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v5;
}

void sub_1000843E8(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 72);
  *(void *)(v3 + ++*(void *)(*(void *)(result + 32) + 72) = 0;

  id v5 = objc_retainBlock(*(id *)(a1 + 40));
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 72);
  *(void *)(v6 + ++*(void *)(*(void *)(result + 32) + 72) = v5;
}

void sub_1000844C0(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    uint64_t v3 = sub_10009756C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 1;
    uint64_t v4 = +[NSNotificationCenter defaultCenter];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = [*(id *)(v5 + 16) persistentStoreCoordinator];
    [v4 addObserver:v5 selector:"remoteStoreUpdate:" name:NSPersistentStoreRemoteChangeNotification object:v6];
  }
}

void sub_10008464C(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    uint64_t v3 = sub_10009756C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
    uint64_t v4 = +[NSNotificationCenter defaultCenter];
    [v4 removeObserver:*(void *)(a1 + 32)];
  }
}

Class sub_1000847C0(uint64_t a1)
{
  v6[0] = 0;
  if (!qword_100103750)
  {
    v6[1] = _NSConcreteStackBlock;
    void v6[2] = (void *)3221225472;
    v6[3] = sub_1000849AC;
    void v6[4] = &unk_1000DD380;
    v6[5] = v6;
    long long v7 = off_1000DF130;
    uint64_t v8 = 0;
    qword_100103750 = _sl_dlopen();
  }
  if (!qword_100103750)
  {
    uint64_t v3 = +[NSAssertionHandler currentHandler];
    uint64_t v4 = +[NSString stringWithUTF8String:"void *WiFiAnalyticsLibrary(void)"];
    [v3 handleFailureInFunction:v4 file:@"W5DatabaseManager.m" lineNumber:19 description:@"%s" v6[0]];

    goto LABEL_10;
  }
  if (v6[0]) {
    free(v6[0]);
  }
  Class result = objc_getClass("WAAnalyticsAccess");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v3 = +[NSAssertionHandler currentHandler];
    uint64_t v5 = +[NSString stringWithUTF8String:"Class getWAAnalyticsAccessClass(void)_block_invoke"];
    [v3 handleFailureInFunction:v5 file:@"W5DatabaseManager.m" lineNumber:21 description:@"Unable to find class %s" arguments:v5, @"WAAnalyticsAccess"];

LABEL_10:
    __break(1u);
  }
  qword_100103748 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000849AC()
{
  uint64_t result = _sl_dlopen();
  qword_100103750 = result;
  return result;
}

void sub_100084D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100084D2C(uint64_t a1, uint64_t a2)
{
}

void sub_100084D3C(uint64_t a1)
{
}

void sub_100084D48(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 16) copy];
}

void sub_100084E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100084E8C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) copy];
}

void sub_100084FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100084FD0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 72) copy];
}

void sub_1000850D0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 32);
}

void sub_1000851C0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 33);
}

void sub_1000852DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000852F4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 48) copy];
}

void sub_1000855E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, int a11, int a12, uint64_t a13, __int16 a14, uint64_t a15, __int16 a16, int a17, __int16 a18, uint64_t a19)
{
  if (a2 == 1)
  {
    objc_begin_catch(exception_object);
    uint64_t v19 = sub_10009756C();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
    objc_end_catch();
    JUMPOUT(0x1000855B0);
  }
  _Unwind_Resume(exception_object);
}

void sub_100085728(void *a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = (void *)a1[4];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
      if ((uint64_t)[v8 integerValue] < 1 || (uint64_t)objc_msgSend(v8, "integerValue") > 41) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    [*(id *)(a1[5] + 24) addObjectsFromArray:a1[4]];
  }
  [*(id *)(a1[5] + 80) xpcConnection:a1[5] startMonitoringEvents:a1[4] reply:a1[6]];
}

void sub_1000858D8(void *a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = (void *)a1[4];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
      if ((uint64_t)[v8 integerValue] < 1 || (uint64_t)objc_msgSend(v8, "integerValue") > 41) {
        break;
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    [*(id *)(a1[5] + 24) removeObjectsInArray:a1[4]];
  }
  [*(id *)(a1[5] + 80) xpcConnection:a1[5] stopMonitoringEvents:a1[4] reply:a1[6]];
}

void sub_100085A84(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) xpcConnection:*(void *)(a1 + 32) queryLocalPeerAndReply:*(void *)(a1 + 40)];
}

void sub_100085B44(void *a1)
{
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] queryStatusForPeer:a1[5] reply:a1[6]];
}

void sub_100085C08(void *a1)
{
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] queryDatabaseForPeer:a1[5] fetch:a1[6] reply:a1[7]];
}

void sub_100085CCC(void *a1)
{
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] requestFileFromPeer:a1[5] remoteFilePath:a1[6] reply:a1[7]];
}

void sub_100085D90(void *a1)
{
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] listFilesFromPeer:a1[5] remoteDirPath:a1[6] reply:a1[7]];
}

void sub_100085E54(void *a1)
{
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] queryDebugConfigurationForPeer:a1[5] reply:a1[6]];
}

void sub_100085F18(void *a1)
{
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] setDebugConfiguration:a1[5] peer:a1[6] reply:a1[7]];
}

void sub_100085FE0(uint64_t a1)
{
  uint64_t v3 = objc_alloc_init(W5ActiveRequest);
  [(W5ActiveRequest *)v3 setType:1];
  [(W5ActiveRequest *)v3 setUuid:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Peer"];
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", [v4 peerID]);
  +[NSDate timeIntervalSinceReferenceDate];
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  -[W5ActiveRequest setWantsUpdates:](v3, "setWantsUpdates:", [v4 type] != (id)6);
  [*(id *)(*(void *)(a1 + 48) + 16) addObject:v3];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(v5 + 80);
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  long long v9 = sub_10008610C;
  long long v10 = &unk_1000DF178;
  uint64_t v11 = v5;
  long long v12 = v3;
  uint64_t v13 = *(void *)(a1 + 64);
  [v6 xpcConnection:runDiagnostics:configuration:uuid:reply:];
}

__n128 sub_10008610C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  long long v3 = *(_OWORD *)(a1 + 32);
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[1] = 3221225472;
  block[2] = sub_100086194;
  block[3] = &unk_1000DF150;
  long long v8 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v10 = a3;
  uint64_t v11 = v5;
  uint64_t v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void sub_100086194(void *a1)
{
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v3 = a1[8];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[6], a1[7]);
  }
}

void sub_100086270(uint64_t a1)
{
  uint64_t v3 = objc_alloc_init(W5ActiveRequest);
  [(W5ActiveRequest *)v3 setType:1];
  [(W5ActiveRequest *)v3 setUuid:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Peer"];
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", [v4 peerID]);
  +[NSDate timeIntervalSinceReferenceDate];
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  -[W5ActiveRequest setWantsUpdates:](v3, "setWantsUpdates:", [v4 type] != (id)6);
  [*(id *)(*(void *)(a1 + 48) + 16) addObject:v3];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(v5 + 80);
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  uint64_t v9 = sub_10008639C;
  uint64_t v10 = &unk_1000DF178;
  uint64_t v11 = v5;
  long long v12 = v3;
  uint64_t v13 = *(void *)(a1 + 72);
  [v6 xpcConnection:v7 diagnostics:v8 configuration:v9 uuid:v10 reply:v11];
}

__n128 sub_10008639C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  long long v3 = *(_OWORD *)(a1 + 32);
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[1] = 3221225472;
  block[2] = sub_100086424;
  block[3] = &unk_1000DF150;
  long long v8 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v10 = a3;
  uint64_t v11 = v5;
  uint64_t v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void sub_100086424(void *a1)
{
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v3 = a1[8];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[6], a1[7]);
  }
}

void sub_1000864FC(void *a1)
{
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] registerRemoteDiagnosticEventsForPeer:a1[5] configuration:a1[6] reply:a1[7]];
}

void sub_1000865C0(void *a1)
{
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] unregisterRemoteDiagnosticEventsForPeer:a1[5] configuration:a1[6] reply:a1[7]];
}

void sub_100086680(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) xpcConnection:*(void *)(a1 + 32) queryRegisteredDiagnosticsPeersWithReply:*(void *)(a1 + 40)];
}

void sub_100086740(void *a1)
{
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] startDiagnosticsModeWithConfiguration:a1[5] reply:a1[6]];
}

void sub_100086804(void *a1)
{
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] stopDiagnosticsModeWithUUID:a1[5] info:a1[6] reply:a1[7]];
}

void sub_1000868C8(void *a1)
{
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] queryDiagnosticsModeForPeer:a1[5] info:a1[6] reply:a1[7]];
}

void sub_100086990(uint64_t a1)
{
  uint64_t v3 = objc_alloc_init(W5ActiveRequest);
  [(W5ActiveRequest *)v3 setType:2];
  [(W5ActiveRequest *)v3 setUuid:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Peer"];
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", [v4 peerID]);
  +[NSDate timeIntervalSinceReferenceDate];
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  -[W5ActiveRequest setWantsUpdates:](v3, "setWantsUpdates:", [v4 type] != (id)6);
  [*(id *)(*(void *)(a1 + 48) + 16) addObject:v3];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(v5 + 80);
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  uint64_t v9 = sub_100086ABC;
  uint64_t v10 = &unk_1000DF1C8;
  uint64_t v11 = v5;
  long long v12 = v3;
  uint64_t v13 = *(void *)(a1 + 64);
  [v6 xpcConnection:v0 collectLogs:v1 configuration:v2 uuid:v3 reply:v4];
}

__n128 sub_100086ABC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v8[0] = _NSConcreteStackBlock;
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_100086B44;
  v8[3] = &unk_1000DF1A0;
  long long v9 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  uint64_t v12 = a4;
  uint64_t v13 = v6;
  dispatch_async(v5, v8);
  return result;
}

void sub_100086B44(void *a1)
{
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v3 = a1[9];
  if (v3) {
    (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, a1[6], a1[7], a1[8]);
  }
}

void sub_100086C20(uint64_t a1)
{
  uint64_t v3 = objc_alloc_init(W5ActiveRequest);
  [(W5ActiveRequest *)v3 setType:2];
  [(W5ActiveRequest *)v3 setUuid:*(void *)(a1 + 32)];
  id v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"Peer"];
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", [v4 peerID]);
  +[NSDate timeIntervalSinceReferenceDate];
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  -[W5ActiveRequest setWantsUpdates:](v3, "setWantsUpdates:", [v4 type] != (id)6);
  [*(id *)(*(void *)(a1 + 48) + 16) addObject:v3];
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(v5 + 80);
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  long long v9 = sub_100086D4C;
  uint64_t v10 = &unk_1000DF1C8;
  uint64_t v11 = v5;
  uint64_t v12 = v3;
  uint64_t v13 = *(void *)(a1 + 56);
  [v6 xpcConnection:v7 collectLogsDiagnosticMode:v8 uuid:v9 reply:v10];
}

__n128 sub_100086D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v8[0] = _NSConcreteStackBlock;
  long long v4 = *(_OWORD *)(a1 + 32);
  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_100086DD4;
  v8[3] = &unk_1000DF1A0;
  long long v9 = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v10 = a2;
  uint64_t v11 = a3;
  uint64_t v12 = a4;
  uint64_t v13 = v6;
  dispatch_async(v5, v8);
  return result;
}

void sub_100086DD4(void *a1)
{
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v3 = a1[9];
  if (v3) {
    (*(void (**)(uint64_t, void, void, void))(v3 + 16))(v3, a1[6], a1[7], a1[8]);
  }
}

void sub_100086EB0(void *a1)
{
  uint64_t v3 = objc_alloc_init(W5ActiveRequest);
  [(W5ActiveRequest *)v3 setType:4];
  [(W5ActiveRequest *)v3 setUuid:a1[4]];
  [(W5ActiveRequest *)v3 setPeerID:0];
  +[NSDate timeIntervalSinceReferenceDate];
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  [(W5ActiveRequest *)v3 setWantsUpdates:1];
  [*(id *)(a1[5] + 16) addObject:v3];
  uint64_t v4 = a1[5];
  uint64_t v5 = *(void **)(v4 + 80);
  uint64_t v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  uint64_t v8 = sub_100086FB0;
  long long v9 = &unk_1000DE0F0;
  [v5 xpcConnection:startPeerDiscoveryWithConfiguration:uuid:reply:_NSConcreteStackBlock, 3221225472, sub_100086FB0, &unk_1000DE0F0, v4, a1[7]];
}

void sub_100086FB0(uint64_t a1, uint64_t a2)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008702C;
  v4[3] = &unk_1000DDFB0;
  uint64_t v3 = *(void *)(a1 + 40);
  void v4[4] = a2;
  void v4[5] = v3;
  dispatch_async(v2, v4);
}

void sub_10008702C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 32));
  }
}

void sub_1000870F8(void *a1)
{
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] stopPeerDiscoveryWithUUID:a1[5] reply:a1[6]];
}

void sub_1000871C4(uint64_t a1)
{
  uint64_t v3 = objc_alloc_init(W5ActiveRequest);
  [(W5ActiveRequest *)v3 setType:3];
  [(W5ActiveRequest *)v3 setUuid:*(void *)(a1 + 32)];
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", [*(id *)(a1 + 40) peerID]);
  +[NSDate timeIntervalSinceReferenceDate];
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  [*(id *)(*(void *)(a1 + 48) + 16) addObject:v3];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void **)(v4 + 80);
  double v6 = *(double *)(a1 + 72);
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  long long v9 = sub_1000872CC;
  uint64_t v10 = &unk_1000DF218;
  uint64_t v11 = v4;
  uint64_t v12 = v3;
  uint64_t v13 = *(void *)(a1 + 64);
  [v5 xpcConnection:v6 runWiFiSnifferOnChannels:v7 duration:v8 peer:v9 uuid:v10 reply:v11];
}

__n128 sub_1000872CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  block[0] = _NSConcreteStackBlock;
  long long v5 = *(_OWORD *)(a1 + 32);
  double v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[1] = 3221225472;
  block[2] = sub_100087358;
  block[3] = &unk_1000DF1F0;
  long long v10 = v5;
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v14 = a5;
  uint64_t v15 = v7;
  uint64_t v11 = a2;
  uint64_t v12 = a3;
  uint64_t v13 = a4;
  dispatch_async(v6, block);
  return result;
}

void sub_100087358(void *a1)
{
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v3 = a1[10];
  if (v3) {
    (*(void (**)(uint64_t, void, void, void, void))(v3 + 16))(v3, a1[6], a1[7], a1[8], a1[9]);
  }
}

void sub_10008743C(uint64_t a1)
{
  uint64_t v3 = objc_alloc_init(W5ActiveRequest);
  [(W5ActiveRequest *)v3 setType:3];
  [(W5ActiveRequest *)v3 setUuid:*(void *)(a1 + 32)];
  -[W5ActiveRequest setPeerID:](v3, "setPeerID:", [*(id *)(a1 + 40) peerID]);
  +[NSDate timeIntervalSinceReferenceDate];
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  [*(id *)(*(void *)(a1 + 48) + 16) addObject:v3];
  uint64_t v4 = *(void *)(a1 + 48);
  long long v5 = *(void **)(v4 + 80);
  double v6 = *(double *)(a1 + 72);
  uint64_t v7 = _NSConcreteStackBlock;
  uint64_t v8 = 3221225472;
  long long v9 = sub_100087544;
  long long v10 = &unk_1000DF178;
  uint64_t v11 = v4;
  uint64_t v12 = v3;
  uint64_t v13 = *(void *)(a1 + 64);
  [v5 xpcConnection:runWiFiSnifferWithTCPDumpOnChannels:duration:peer:uuid:reply:v6];
}

__n128 sub_100087544(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  long long v3 = *(_OWORD *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[1] = 3221225472;
  block[2] = sub_1000875CC;
  block[3] = &unk_1000DF150;
  long long v8 = v3;
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v10 = a3;
  uint64_t v11 = v5;
  uint64_t v9 = a2;
  dispatch_async(v4, block);
  return result;
}

void sub_1000875CC(void *a1)
{
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v3 = a1[8];
  if (v3) {
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, a1[6], a1[7]);
  }
}

void sub_1000876A4(uint64_t a1)
{
  uint64_t v3 = objc_alloc_init(W5ActiveRequest);
  [(W5ActiveRequest *)v3 setType:5];
  [(W5ActiveRequest *)v3 setUuid:*(void *)(a1 + 32)];
  -[W5ActiveRequest setPeerID:[objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", @"Peer") peerID]];
  +[NSDate timeIntervalSinceReferenceDate];
  -[W5ActiveRequest setTimestamp:](v3, "setTimestamp:");
  [*(id *)(*(void *)(a1 + 48) + 16) addObject:v3];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void **)(v4 + 80);
  double v6 = _NSConcreteStackBlock;
  uint64_t v7 = 3221225472;
  long long v8 = sub_1000877B4;
  uint64_t v9 = &unk_1000DF268;
  uint64_t v10 = v4;
  uint64_t v11 = v3;
  uint64_t v12 = *(void *)(a1 + 56);
  [v5 xpcConnection:runWiFiPerformanceLoggingWithConfiguration:uuid:reply:];
}

__n128 sub_1000877B4(uint64_t a1, uint64_t a2)
{
  v6[0] = _NSConcreteStackBlock;
  long long v2 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  v6[1] = 3221225472;
  void v6[2] = sub_100087838;
  v6[3] = &unk_1000DE118;
  long long v7 = v2;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v8 = a2;
  uint64_t v9 = v4;
  dispatch_async(v3, v6);
  return result;
}

void sub_100087838(void *a1)
{
  [*(id *)(a1[4] + 16) removeObject:a1[5]];
  uint64_t v3 = a1[7];
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, a1[6]);
  }
}

void sub_100087910(uint64_t a1)
{
  id v3 = [[*(id *)(a1 + 32) __activeRequestWithUUID:*(void *)(a1 + 40)];
  if (v3)
  {
    uint64_t v4 = v3;
    switch((unint64_t)[v3 type])
    {
      case 1uLL:
        [*(id *)(*(void *)(a1 + 32) + 80) xpcConnection:cancelDiagnosticsWithUUID:peerID:reply:*(void *)(a1 + 32) objc_msgSend(v4, "uuid") objc_msgSend(v4, "peerID") 0];
        break;
      case 2uLL:
        [*(id *)(*(void *)(a1 + 32) + 80) xpcConnection:cancelCollectLogsWithUUID:peerID:reply:*(void *)(a1 + 32) objc_msgSend(v4, "uuid") objc_msgSend(v4, "peerID") 0];
        break;
      case 3uLL:
        [*(id *)(*(void *)(a1 + 32) + 80) xpcConnection:cancelWiFiSnifferWithUUID:*(void *)(a1 + 32) peerID:objc_msgSend(v4, "peerID") reply:0];
        break;
      case 5uLL:
        [*(id *)(*(void *)(a1 + 32) + 80) xpcConnection:cancelWiFiPerformanceLoggingWithUUID:peerID:reply:*(void *)(a1 + 32) uuid:[v4 uuid] peerID:[v4 peerID]];
        break;
      default:
        break;
    }
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:v4];
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void sub_100087B28(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(void **)(*(void *)(a1 + 32) + 16);
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v9 = [v8 type];
        if (v9 == (id)3)
        {
          [*(id *)(*(void *)(a1 + 32) + 80) xpcConnection:cancelWiFiSnifferWithUUID:peerID:reply:*(void *)(a1 + 32) objc_msgSend(v8, "uuid") objc_msgSend(v8, "peerID") 0];
        }
        else if (v9 == (id)2)
        {
          [*(id *)(*(void *)(a1 + 32) + 80) xpcConnection:cancelCollectLogsWithUUID:peerID:reply:*(void *)(a1 + 32) objc_msgSend(v8, "uuid") objc_msgSend(v8, "peerID") 0];
        }
        else if (v9 == (id)1)
        {
          [*(id *)(*(void *)(a1 + 32) + 80) xpcConnection:cancelDiagnosticsWithUUID:peerID:reply:*(void *)(a1 + 32) objc_msgSend(v8, "uuid") objc_msgSend(v8, "peerID") 0];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
  }
}

void sub_100087D94(void *a1)
{
  if (a1[8] == 1) {
    [*(id *)(a1[4] + 80) xpcConnection:a1[4] cancelWiFiSnifferWithUUID:a1[5] peer:a1[6] reply:0];
  }
  uint64_t v3 = a1[7];
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

void sub_100087E84(uint64_t a1)
{
  [*(id *)(a1 + 32) __logMessage:timestamped:*(void *)(a1 + 40) *(unsigned __int8 *)(a1 + 56)];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

void sub_100087F5C(void *a1)
{
  [*(id *)(a1[4] + 24) addObject:&off_1000EB998];
  uint64_t v3 = a1[4];
  if (!a1[5])
  {
    id v5 = *(void **)(v3 + 80);
LABEL_7:
    [v5 xpcConnection:startMonitoringFaultEventsForPeer:reply:];
    goto LABEL_8;
  }
  if (([*(id *)(v3 + 72) containsObject:a1[5]] & 1) == 0)
  {
    [*(id *)(a1[4] + 72) addObject:a1[5]];
    id v5 = *(void **)(a1[4] + 80);
    goto LABEL_7;
  }
  uint64_t v4 = a1[6];
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }
LABEL_8:
}

void sub_100088084(void *a1)
{
  if (a1[4]) {
    [*(id *)(a1[5] + 72) removeObject:];
  }
  [*(id *)(a1[5] + 24) removeObject:&off_1000EB998];
  [*(id *)(a1[5] + 80) xpcConnection:a1[5] stopMonitoringFaultEventsForPeer:a1[4] reply:a1[6]];
}

void sub_100088170(void *a1)
{
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] submitFaultEvent:a1[5] reply:a1[6]];
}

void sub_100088234(void *a1)
{
  [*(id *)(a1[4] + 80) xpcConnection:a1[4] queryFaultEventCacheForPeer:a1[5] reply:a1[6]];
}

void sub_100088518(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v57 = a3;
  id v55 = a4;
  uint64_t v56 = v7;
  uint64_t v58 = [v7 objectForKeyedSubscript:@"ResponsePeer"];
  id v8 = [v7 objectForKeyedSubscript:@"RequestPeer"];
  if (!v8) {
    id v8 = objc_alloc_init((Class)W5Peer);
  }
  id v9 = [v57 objectForKeyedSubscript:RPOptionSenderIDSDeviceID];
  [v8 setPeerID:v9];

  uint64_t v10 = [v57 objectForKeyedSubscript:RPOptionSenderDeviceName];
  [v8 setName:v10];

  long long v11 = [v57 objectForKeyedSubscript:RPOptionSenderModelID];
  [v8 setModel:v11];

  uint64_t v54 = [v7 objectForKeyedSubscript:@"Type"];
  switch((unint64_t)[v54 integerValue])
  {
    case 1uLL:
      long long v12 = [*(id *)(a1 + 32) faultEventCache];
      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v13 = [v12 countByEnumeratingWithState:&v59 objects:v65 count:16];
      if (!v13) {
        goto LABEL_24;
      }
      uint64_t v14 = *(void *)v60;
      break;
    case 2uLL:
      id v29 = *(id *)(a1 + 32);
      objc_sync_enter(v29);
      __int16 v30 = *(void **)(*(void *)(a1 + 32) + 16);
      if (!v30)
      {
        uint64_t v31 = +[NSMutableSet set];
        uint64_t v32 = *(void *)(a1 + 32);
        long long v33 = *(void **)(v32 + 16);
        *(void *)(v32 + 16) = v31;

        [*(id *)(a1 + 32) __unarchiveNotifyPeers];
        __int16 v30 = *(void **)(*(void *)(a1 + 32) + 16);
      }
      [v30 addObject:v8];
      [*(id *)(a1 + 32) __archiveNotifyPeers];
      if (!v55) {
        goto LABEL_35;
      }
      goto LABEL_34;
    case 3uLL:
      id v29 = *(id *)(a1 + 32);
      objc_sync_enter(v29);
      long long v34 = *(void **)(*(void *)(a1 + 32) + 16);
      if (!v34)
      {
        uint64_t v35 = +[NSMutableSet set];
        uint64_t v36 = *(void *)(a1 + 32);
        CFStringRef v37 = *(void **)(v36 + 16);
        *(void *)(v36 + 16) = v35;

        [*(id *)(a1 + 32) __unarchiveNotifyPeers];
        long long v34 = *(void **)(*(void *)(a1 + 32) + 16);
      }
      [v34 removeObject:v8];
      [*(id *)(a1 + 32) __archiveNotifyPeers];
      if (v55) {
LABEL_34:
      }
        (*((void (**)(id, void, void))v55 + 2))(v55, 0, 0);
LABEL_35:
      objc_sync_exit(v29);

      goto LABEL_49;
    case 4uLL:
      id v38 = *(id *)(a1 + 32);
      objc_sync_enter(v38);
      if ([*(id *)(*(void *)(a1 + 32) + 24) countForObject:v8])
      {
        uint64_t v39 = [v7 objectForKeyedSubscript:@"Event"];
        NSErrorUserInfoKey v40 = v39;
        if (v39)
        {
          CFStringRef v41 = [v39 peer];
          NSErrorUserInfoKey v42 = [v41 peerID];

          if (!v42)
          {
            CFStringRef v43 = [v8 peerID];
            int v44 = [v40 peer];
            [v44 setPeerID:v43];
          }
          [*(id *)(a1 + 32) __addFaultEvent:v40];
          uint64_t v45 = [*(id *)(a1 + 32) faultEventHandler];
          ((void (**)(void, void *))v45)[2](v45, v40);
        }
        if (v55) {
          (*((void (**)(id, void, void))v55 + 2))(v55, 0, 0);
        }
      }
      else
      {
        uint64_t v46 = [*(id *)(a1 + 32) diagnosticsModeManager];
        __int16 v47 = [*(id *)(a1 + 40) diagnosticsModeManager];
        int v48 = [v47 localPeer];
        id v49 = [v46 registeredRoleForPeer:v48];

        if (v49 == (id)16)
        {
          id v50 = [v7 objectForKeyedSubscript:@"Event"];
          uint64_t v51 = [*(id *)(a1 + 32) diagnosticsModeManager];
          [v51 handlePeerFaultEvent:v50];
        }
        else if (v55)
        {
          NSErrorUserInfoKey v63 = NSLocalizedFailureReasonErrorKey;
          CFStringRef v64 = @"ENXIO";
          uint64_t v52 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
          uint64_t v53 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:6 userInfo:v52];
          (*((void (**)(id, void *, void))v55 + 2))(v55, v53, 0);
        }
      }
      objc_sync_exit(v38);

      goto LABEL_49;
    default:
      goto LABEL_49;
  }
  do
  {
    for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v60 != v14) {
        objc_enumerationMutation(v12);
      }
      double v16 = *(void **)(*((void *)&v59 + 1) + 8 * i);
      id v17 = [v16 peer];
      if (v17 == v8)
      {

LABEL_17:
        int v23 = [v16 peer];
        [v23 setPeerID:0];
        goto LABEL_21;
      }
      int v18 = [v16 peer];
      uint64_t v19 = v18;
      if (v18) {
        BOOL v20 = v8 != 0;
      }
      else {
        BOOL v20 = 0;
      }
      if (v20)
      {
        id v21 = [v16 peer];
        unsigned int v22 = [v21 isEqual:v8];

        if (v22) {
          goto LABEL_17;
        }
      }
      else
      {
      }
      __int16 v24 = [v16 peer];
      uint64_t v25 = [v24 peerID];
      BOOL v26 = v25 == 0;

      if (!v26) {
        continue;
      }
      int v23 = [v58 peerID];
      DNSServiceErrorType v27 = [v16 peer];
      [v27 setPeerID:v23];

LABEL_21:
    }
    id v13 = [v12 countByEnumeratingWithState:&v59 objects:v65 count:16];
  }
  while (v13);
LABEL_24:
  __int16 v28 = +[NSMutableDictionary dictionary];
  [v28 setObject:v12 forKeyedSubscript:@"Cache"];
  if (v55) {
    (*((void (**)(id, void, void *))v55 + 2))(v55, 0, v28);
  }

LABEL_49:
}

void sub_100088BD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100088DD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100088DEC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v15 = a2;
  id v7 = a3;
  id v8 = a4;
  if (!v15)
  {
    id v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 24);
    if (!v10)
    {
      id v11 = objc_alloc_init((Class)NSCountedSet);
      uint64_t v12 = *(void *)(a1 + 32);
      id v13 = *(void **)(v12 + 24);
      *(void *)(v12 + 24) = v11;

      uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 24);
    }
    [v10 addObject:*(void *)(a1 + 40)];
    objc_sync_exit(v9);
  }
  uint64_t v14 = *(void *)(a1 + 48);
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v15);
  }
}

void sub_100088ECC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10008909C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000890B8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100089264(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v5 = a2;
    id v6 = [a3 objectForKeyedSubscript:@"Cache"];
    (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v5, v6);
  }
}

int64_t sub_100089D2C(id a1, W5Event *a2, W5Event *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  [(W5Event *)v4 timestamp];
  double v7 = v6;
  [(W5Event *)v5 timestamp];
  if (v7 <= v8)
  {
    [(W5Event *)v5 timestamp];
    double v11 = v10;
    [(W5Event *)v4 timestamp];
    if (v11 <= v12) {
      int64_t v9 = 0;
    }
    else {
      int64_t v9 = -1;
    }
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

void sub_10008A4CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10008A520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setObject:a3 forKeyedSubscript:a2];
}

void sub_10008A52C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v10)
  {
    id v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    [*(id *)(*(void *)(a1 + 32) + 16) removeObject:*(void *)(a1 + 40)];
    objc_sync_exit(v9);
  }
}

void sub_10008A5C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10008A688(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10008A768(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10008BB6C(uint64_t a1)
{
  long long v2 = sub_10009756C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  return [*(id *)(a1 + 32) invalidateDiscoveryClient];
}

void sub_10008BEE4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = *(void **)(a1 + 32);
  id v10 = a3;
  id v11 = [v9 requestPayloadClass];
  if (!v11)
  {
    uint64_t v14 = 0;
    goto LABEL_12;
  }
  double v12 = sub_100099000();
  if (os_signpost_enabled(v12))
  {
    *(_DWORD *)buf = 138412290;
    id v37 = (id)objc_opt_class();
    id v13 = v37;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5RapportServer payloadFromDictionary", "%@", buf, 0xCu);
  }
  uint64_t v14 = [v11 payloadFromDictionary:v7];
  id v15 = sub_100099000();
  BOOL v16 = os_signpost_enabled(v15);
  if (v14)
  {
    if (v16)
    {
      id v17 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      id v37 = v17;
      id v18 = v17;
      uint64_t v19 = "%@";
LABEL_10:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5RapportServer payloadFromDictionary", v19, buf, 0xCu);
    }
  }
  else if (v16)
  {
    BOOL v20 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v37 = v20;
    id v18 = v20;
    uint64_t v19 = "%@ Failure";
    goto LABEL_10;
  }

LABEL_12:
  id v21 = sub_100099000();
  if (os_signpost_enabled(v21))
  {
    unsigned int v22 = objc_opt_class();
    *(_DWORD *)buf = 138412290;
    id v37 = v22;
    id v23 = v22;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5RapportClientRequest initWithPayload", "%@", buf, 0xCu);
  }
  __int16 v24 = [W5RapportClientRequest alloc];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10008C350;
  v33[3] = &unk_1000DF3E8;
  id v25 = v8;
  id v34 = v25;
  id v35 = v11;
  BOOL v26 = [(W5RapportClientRequest *)v24 initWithPayload:v14 options:v10 handler:v33];

  DNSServiceErrorType v27 = sub_10009756C();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v28 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138543618;
    id v37 = v28;
    __int16 v38 = 2114;
    uint64_t v39 = v26;
    _os_log_send_and_compose_impl();
  }
  id v29 = sub_100099000();
  if (os_signpost_enabled(v29))
  {
    __int16 v30 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138412290;
    id v37 = v30;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "W5PeerRequestListener handleClientRequest", "%@", buf, 0xCu);
  }
  [*(id *)(a1 + 32) handleClientRequest:v26];
  uint64_t v31 = sub_100099000();
  if (os_signpost_enabled(v31))
  {
    uint64_t v32 = [*(id *)(a1 + 32) identifier];
    *(_DWORD *)buf = 138412290;
    id v37 = v32;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v31, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5PeerRequestListener handleClientRequest", "%@", buf, 0xCu);
  }
}

void sub_10008C350(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 encode];
  id v8 = v6;
  if (!v7)
  {
    id v9 = sub_10009756C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      BOOL v20 = (const char *)v5;
      _os_log_send_and_compose_impl();
    }

    NSErrorUserInfoKey v23 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v24 = @"W5EncodingErr";
    id v10 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v8 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:8 userInfo:v10];
  }
  id v11 = sub_10009756C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v20 = "-[W5RapportServer _registerRequestsForListener:rapportClient:]_block_invoke";
    __int16 v21 = 2114;
    unsigned int v22 = v7;
    _os_log_send_and_compose_impl();
  }

  (*(void (**)(void, void *))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v7);
  double v12 = sub_100099000();
  BOOL v13 = os_signpost_enabled(v12);
  if (v8)
  {
    if (v13)
    {
      uint64_t v14 = objc_opt_class();
      id v15 = v14;
      BOOL v16 = [v8 description];
      *(_DWORD *)buf = 138412546;
      BOOL v20 = (const char *)v14;
      __int16 v21 = 2112;
      unsigned int v22 = v16;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5RapportClientRequest initWithPayload", "%@ Error=%@", buf, 0x16u);
    }
  }
  else if (v13)
  {
    id v17 = (char *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    BOOL v20 = v17;
    id v18 = v17;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "W5RapportClientRequest initWithPayload", "%@", buf, 0xCu);
  }
}

void sub_10008E75C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

id sub_10008E788(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (((unint64_t)objc_msgSend(v10, "role", (void)v14) & a2) != 0) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  if ([v4 count]) {
    id v11 = v4;
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;

  return v12;
}

void sub_10008E8D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = dispatch_get_global_queue(0, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10008E9A0;
  v6[3] = &unk_1000DF458;
  id v4 = *(id *)(a1 + 32);
  id v7 = WeakRetained;
  id v8 = v4;
  id v5 = WeakRetained;
  dispatch_async(v3, v6);
}

void sub_10008E9A0(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) mode];
  id v5 = [*(id *)(a1 + 32) operationErrors];
  (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);
}

void sub_10008FB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,id location)
{
  objc_destroyWeak(v59);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10008FB38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = dispatch_get_global_queue(0, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_10008FC04;
  v6[3] = &unk_1000DF458;
  id v4 = *(id *)(a1 + 32);
  id v7 = WeakRetained;
  id v8 = v4;
  id v5 = WeakRetained;
  dispatch_async(v3, v6);
}

void sub_10008FC04(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) mode];
  id v5 = [*(id *)(a1 + 32) operationErrors];
  (*(void (**)(uint64_t, void *, void *))(v3 + 16))(v3, v4, v5);
}

void sub_1000905E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 224));
  _Unwind_Resume(a1);
}

void sub_100090614(id *a1)
{
  uint64_t v2 = dispatch_get_global_queue(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000906EC;
  block[3] = &unk_1000DF4A8;
  id v5 = a1[5];
  id v4 = a1[4];
  objc_copyWeak(&v6, a1 + 6);
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void sub_1000906EC(uint64_t a1)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = [WeakRetained operationErrors];
  (*(void (**)(uint64_t, uint64_t, void *))(v3 + 16))(v3, v4, v6);
}

void sub_1000908C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000908E8(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = [v2 error];

  id v5 = sub_10009756C();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      unint64_t v7 = *(void *)(a1 + 64);
      id v8 = *(void **)(a1 + 32);
      id v9 = sub_100090B84(v7);
      [v2 error];
      int v18 = 136316162;
      uint64_t v19 = "-[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]_block_invoke";
      __int16 v20 = 2048;
      unint64_t v21 = v7;
      __int16 v22 = 2112;
      NSErrorUserInfoKey v23 = v8;
      __int16 v24 = 2114;
      id v25 = v9;
      __int16 v26 = 2114;
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      _os_log_send_and_compose_impl();
    }
    id v5 = [WeakRetained operationErrors];
    id v10 = +[NSNumber numberWithInteger:*(void *)(a1 + 64)];
    long long v16 = v10;
    id v11 = [v2 error];
    long long v17 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [v5 addObject:v12];
  }
  else if (v6)
  {
    unint64_t v13 = *(void *)(a1 + 64);
    long long v14 = sub_100090B84(v13);
    long long v15 = *(void **)(a1 + 32);
    int v18 = 136315906;
    uint64_t v19 = "-[W5DiagnosticsModeProcessor _runAction:peer:info:handler:completion:]_block_invoke";
    __int16 v20 = 2048;
    unint64_t v21 = v13;
    __int16 v22 = 2112;
    NSErrorUserInfoKey v23 = v14;
    __int16 v24 = 2114;
    id v25 = v15;
    _os_log_send_and_compose_impl();
  }
}

CFStringRef sub_100090B84(unint64_t a1)
{
  if (a1 > 0xC) {
    return @"Unknown";
  }
  else {
    return off_1000DF4F0[a1];
  }
}

id sub_100090CA4(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v19 = a2;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (((unint64_t)[v10 role] & a3) != 0)
        {
          id v11 = [v10 peer];
          id v12 = [v11 peerID];
          unint64_t v13 = [v19 peer];
          long long v14 = [v13 peerID];
          unsigned int v15 = [v12 isEqualToString:v14];

          if (v15)
          {
            id v16 = v10;
            goto LABEL_12;
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_12:

  return v16;
}

id sub_100090E50(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v10 = [v9 peer];
        uint64_t v11 = [v10 peerID];
        if ((id)v11 == v4)
        {

LABEL_13:
          id v16 = v9;
          goto LABEL_14;
        }
        id v12 = (void *)v11;
        unint64_t v13 = [v9 peer];
        long long v14 = [v13 peerID];
        unsigned int v15 = [v14 isEqualToString:v4];

        if (v15) {
          goto LABEL_13;
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
      id v16 = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    id v16 = 0;
  }
LABEL_14:

  return v16;
}

void sub_100093008(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_100093034(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleRapportDeviceFound:v3];
}

void sub_100093090(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleRapportDeviceLost:v3];
}

void sub_100093900(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(W5PeerGenericResponsePayload);
  [(W5PeerGenericResponsePayload *)v7 setInfo:v6];
  uint64_t v8 = sub_10009756C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }

  id v9 = [*(id *)(a1 + 32) handler];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) handler];
    ((void (**)(void, W5PeerGenericResponsePayload *, id))v10)[2](v10, v7, v5);
  }
}

uint64_t start()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136446210;
    id v11 = [[objc_msgSend(&off_1000EBA70, "stringValue") UTF8String];
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "[wifivelocity] STARTUP! (v%{public}s)", buf, 0xCu);
  }
  id v1 = [@"/private" stringByAppendingPathComponent:NSTemporaryDirectory()];
  if ([v1 hasSuffix:@"/"]) {
    id v1 = [v1 substringToIndex:[v1 length] - 1];
  }
  uint64_t v2 = [(NSURL *)[+[NSFileManager defaultManager] containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.wifi.logs"] path];
  if ([(NSString *)v2 hasSuffix:@"/"]) {
    uint64_t v2 = [(NSString *)v2 substringToIndex:(char *)[(NSString *)v2 length] - 1];
  }
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", [v1 stringByAppendingPathComponent:@"com.apple.wifivelocity"], 0);
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", [v1 stringByAppendingPathComponent:@"com.apple.wifivelocity"], 0, 0, 0);
  [+[NSFileManager defaultManager] createDirectoryAtPath:@"/var/log/com.apple.wifivelocity" withIntermediateDirectories:0 attributes:0 error:0];
  [+[NSFileManager defaultManager] createDirectoryAtPath:@"/var/run/com.apple.wifivelocity" withIntermediateDirectories:0 attributes:0 error:0];
  [+[NSFileManager defaultManager] createDirectoryAtPath:[(NSString *)v2 stringByAppendingPathComponent:@"previous"] withIntermediateDirectories:0 attributes:0 error:0];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000DF5A0);
  id v3 = objc_alloc_init(W5Engine);
  if (+[W5FeatureAvailability diagnosticsModeEnabled]
    && _os_feature_enabled_impl())
  {
    xpc_set_event_stream_handler("com.apple.rapport.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000DF5E8);
  }
  if (!v3)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
LABEL_17:
      return 0;
    }
    *(_WORD *)buf = 0;
    uint64_t v7 = "[wifivelocity] FAILED to initialize WiFiVelocity engine";
LABEL_19:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v7, buf, 2u);
    goto LABEL_17;
  }
  v9.__sigaction_u.__sa_handler = (void (__cdecl *)(int))1;
  *(void *)&v9.sa_mask = 0;
  sigaction(15, &v9, 0);
  id v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  if (!v4)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    uint64_t v7 = "[wifivelocity] FAILED to setup SIGTERM catcher";
    goto LABEL_19;
  }
  id v5 = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100096450;
  handler[3] = &unk_1000DDC80;
  handler[4] = v3;
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume(v5);
  [(W5Engine *)v3 run];
  dispatch_source_cancel(v5);
  dispatch_release(v5);
  return 0;
}

void sub_100095C74(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    id v3 = string;
    size_t v4 = strlen(string);
    if (!strncmp(v3, "com.apple.wifivelocity-wake-120", v4))
    {
      uint64_t v5 = 120;
    }
    else if (!strncmp(v3, "com.apple.wifivelocity-wake-240", v4))
    {
      uint64_t v5 = 240;
    }
    else if (!strncmp(v3, "com.apple.wifivelocity-wake-600", v4))
    {
      uint64_t v5 = 600;
    }
    else if (!strncmp(v3, "com.apple.wifivelocity-wake-86400", v4))
    {
      uint64_t v5 = 86400;
    }
    else
    {
      if (strncmp(v3, "com.apple.private.alloy.wifivelocity.idslaunchnotification", v4)) {
        return;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] IDS-based launch\n", buf, 2u);
      }
      uint64_t v5 = 60;
    }
    id v6 = [(NSString *)[+[NSUUID UUID] UUIDString] substringToIndex:5];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = v5;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] [%{public}@] BEGIN keepalive for %{public}lds\n", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    id v11 = sub_100095F3C;
    id v12 = sub_100095F4C;
    uint64_t v13 = 0;
    uint64_t v7 = os_transaction_create();
    [[+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager")] osTransactionCreate:@"com.apple.wifivelocity.keepalive.notifyd" transaction:v7];
    uint64_t v13 = v7;
    dispatch_time_t v8 = dispatch_time(0, 1000000000 * v5);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100095F58;
    block[3] = &unk_1000DF5C8;
    void block[5] = buf;
    void block[6] = v5;
    void block[4] = v6;
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
    _Block_object_dispose(buf, 8);
  }
}

void sub_100095F3C(uint64_t a1, uint64_t a2)
{
}

void sub_100095F4C(uint64_t a1)
{
}

void sub_100095F58(void *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = a1[4];
    uint64_t v3 = a1[6];
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2050;
    uint64_t v7 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] [%{public}@] END keepalive for %{public}lds\n", (uint8_t *)&v4, 0x16u);
  }
  [+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionComplete:*(void *)(*(void *)(a1[5] + 8) + 40)];

  *(void *)(*(void *)(a1[5] + 8) + 40) = 0;
}

void sub_100096048(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = string;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] RAPPORT WAKE! event='%s'", buf, 0xCu);
    if (string) {
      goto LABEL_3;
    }
  }
  else if (string)
  {
LABEL_3:
    int v4 = [(NSString *)[+[NSUUID UUID] UUIDString] substringToIndex:5];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v4;
      *(_WORD *)&buf[12] = 2050;
      *(void *)&buf[14] = 60;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] [%{public}@] BEGIN RAPPORT keepalive for %{public}lds\n", buf, 0x16u);
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    id v11 = sub_100095F3C;
    id v12 = sub_100095F4C;
    uint64_t v13 = 0;
    uint64_t v5 = os_transaction_create();
    [[+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionCreate:@"com.apple.wifivelocity.keepalive.rapport" transaction:v5];
    uint64_t v13 = v5;
    dispatch_time_t v6 = dispatch_time(0, 60000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100096360;
    block[3] = &unk_1000DF5C8;
    void block[6] = 60;
    void block[4] = v4;
    void block[5] = buf;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    if (xpc_dictionary_expects_reply())
    {
      xpc_object_t reply = xpc_dictionary_create_reply(a2);
      if (reply)
      {
        xpc_dictionary_send_reply();
        xpc_release(reply);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)dispatch_time_t v8 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] failed to create rapport reply.", v8, 2u);
      }
    }
    _Block_object_dispose(buf, 8);
    return;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] bailing out early, no rapport event name.", buf, 2u);
  }
}

void sub_10009633C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100096360(void *a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    uint64_t v2 = a1[4];
    uint64_t v3 = a1[6];
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2050;
    uint64_t v7 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] [%{public}@] END keepalive for %{public}lds\n", (uint8_t *)&v4, 0x16u);
  }
  [+[W5ActivityManager sharedActivityManager](W5ActivityManager, "sharedActivityManager") osTransactionComplete:*(void *)(*(void *)(a1[5] + 8) + 40)];

  *(void *)(*(void *)(a1[5] + 8) + 40) = 0;
}

id sub_100096450(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] signal event handler called, exiting", buf, 2u);
  }
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] calling exit(EXIT_FAILURE)", v4, 2u);
    }
    exit(1);
  }
  return [v2 terminateAndNotify:&stru_1000DF608];
}

void sub_100096514(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[wifivelocity] calling exit(143)", v1, 2u);
  }
  exit(143);
}

_UNKNOWN **sub_100096ED4()
{
  return &off_1000F0818;
}

id sub_100096EE0()
{
  unint64_t v0 = arc4random();
  unint64_t v1 = v0 % (unint64_t)[&off_1000F0818 count];

  return [&off_1000F0818 objectAtIndex:v1];
}

CFStringRef sub_100096F30()
{
  CFStringRef result = SCDynamicStoreCopyComputerName(0, 0);
  if (result)
  {
    CFStringRef v1 = result;
    uint64_t v2 = +[NSString stringWithString:result];
    CFRelease(v1);
    return (CFStringRef)v2;
  }
  return result;
}

id sub_100096F80()
{
  mach_port_t mainPort = 0;
  if (IOMainPort(bootstrap_port, &mainPort)) {
    return 0;
  }
  io_registry_entry_t v0 = IORegistryEntryFromPath(mainPort, "IODeviceTree:/options");
  if (!v0) {
    return 0;
  }
  io_object_t v1 = v0;
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v0, @"boot-args", kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    IOObjectRelease(v1);
    return 0;
  }
  uint64_t v3 = CFProperty;
  id v4 = [CFProperty componentsSeparatedByCharactersInSet:+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet")];
  IOObjectRelease(v1);
  CFRelease(v3);
  return v4;
}

void sub_100097044(const __CFString *a1, int a2)
{
  kern_return_t v11;
  mach_error_t v12;
  CFStringRef v13;
  char *v14;
  int *v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  CFStringRef v24;
  __int16 v25;
  CFStringRef v26;
  __int16 v27;
  char *v28;

  id v4 = [objc_alloc((Class)NSMutableArray) initWithArray:sub_100096F80()];
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_37;
  }
  unsigned int v6 = [v4 containsObject:a1];
  if (a2)
  {
    if (v6)
    {
      if (qword_100103768 != -1) {
        dispatch_once(&qword_100103768, &stru_1000DF628);
      }
      if (!os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      long long v17 = 136315906;
      int v18 = "W5UpdateBootargs";
      long long v19 = 2080;
      long long v20 = "W5MiscUtil.m";
      long long v21 = 1024;
      long long v22 = 133;
      long long v23 = 2114;
      __int16 v24 = a1;
      goto LABEL_36;
    }
LABEL_9:
    HIDWORD(v16) = 0;
    if (IOMainPort(bootstrap_port, (mach_port_t *)&v16 + 1)) {
      goto LABEL_37;
    }
    io_registry_entry_t v7 = IORegistryEntryFromPath(HIDWORD(v16), "IODeviceTree:/options");
    if (!v7) {
      goto LABEL_37;
    }
    io_registry_entry_t v8 = v7;
    if (qword_100103768 != -1) {
      dispatch_once(&qword_100103768, &stru_1000DF628);
    }
    if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = (const __CFString *)[v5 componentsJoinedByString:@" "];
      long long v17 = 136315906;
      int v18 = "W5UpdateBootargs";
      long long v19 = 2080;
      long long v20 = "W5MiscUtil.m";
      long long v21 = 1024;
      long long v22 = 143;
      long long v23 = 2114;
      __int16 v24 = v9;
      LODWORD(v16) = 38;
      unsigned int v15 = &v17;
      _os_log_send_and_compose_impl();
    }
    if (a2) {
      [v5 addObject:a1];
    }
    else {
      [v5 removeObject:a1];
    }
    CFStringRef v10 = (const __CFString *)[v5 componentsJoinedByString:@" " v15 v16];
    id v11 = IORegistryEntrySetCFProperty(v8, @"boot-args", v10);
    if (v11)
    {
      id v12 = v11;
      if (qword_100103768 != -1) {
        dispatch_once(&qword_100103768, &stru_1000DF628);
      }
      if (!os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      if (a2) {
        uint64_t v13 = @"add";
      }
      else {
        uint64_t v13 = @"remove";
      }
      long long v14 = mach_error_string(v12);
      long long v17 = 136316418;
      int v18 = "W5UpdateBootargs";
      long long v19 = 2080;
      long long v20 = "W5MiscUtil.m";
      long long v21 = 1024;
      long long v22 = 151;
      long long v23 = 2114;
      __int16 v24 = v13;
      id v25 = 2114;
      __int16 v26 = a1;
      id v27 = 2082;
      __int16 v28 = v14;
    }
    else
    {
      if (qword_100103768 != -1) {
        dispatch_once(&qword_100103768, &stru_1000DF628);
      }
      if (!os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      long long v17 = 136315906;
      int v18 = "W5UpdateBootargs";
      long long v19 = 2080;
      long long v20 = "W5MiscUtil.m";
      long long v21 = 1024;
      long long v22 = 153;
      long long v23 = 2114;
      __int16 v24 = v10;
    }
    _os_log_send_and_compose_impl();
LABEL_24:

    IOObjectRelease(v8);
    return;
  }
  if (v6) {
    goto LABEL_9;
  }
  if (qword_100103768 != -1) {
    dispatch_once(&qword_100103768, &stru_1000DF628);
  }
  if (!os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_37;
  }
  long long v17 = 136315906;
  int v18 = "W5UpdateBootargs";
  long long v19 = 2080;
  long long v20 = "W5MiscUtil.m";
  long long v21 = 1024;
  long long v22 = 134;
  long long v23 = 2114;
  __int16 v24 = a1;
LABEL_36:
  _os_log_send_and_compose_impl();
LABEL_37:
}

uint64_t sub_10009756C()
{
  if (qword_100103768 != -1) {
    dispatch_once(&qword_100103768, &stru_1000DF628);
  }
  return qword_100103760;
}

uint64_t sub_1000975B0(void *a1, void *a2, NSError **a3)
{
  __int16 v24 = 0;
  memset(&v23, 0, sizeof(v23));
  stat([[objc_msgSend(a1, "path") UTF8String];
  if (qword_100103768 != -1) {
    dispatch_once(&qword_100103768, &stru_1000DF628);
  }
  if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [a1 path];
    off_t st_size = v23.st_size;
    id v8 = [a2 path];
    int v31 = 136316418;
    uint64_t v32 = "W5CreateTarball";
    __int16 v33 = 2080;
    id v34 = "W5MiscUtil.m";
    __int16 v35 = 1024;
    int v36 = 388;
    __int16 v37 = 2114;
    id v38 = v6;
    __int16 v39 = 2048;
    off_t v40 = st_size;
    __int16 v41 = 2114;
    id v42 = v8;
    LODWORD(v22) = 58;
    long long v21 = &v31;
    _os_log_send_and_compose_impl();
  }
  uint64_t v9 = archive_write_new();
  if (!v9)
  {
    NSErrorUserInfoKey v29 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v30 = @"ENOMEM";
    long long v14 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    NSErrorDomain v15 = NSPOSIXErrorDomain;
    uint64_t v16 = 12;
LABEL_17:
    __int16 v24 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, v16, v14, v21, v22);
    goto LABEL_18;
  }
  if (!-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [a1 path]))
  {
    NSErrorUserInfoKey v27 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v28 = @"ENOENT";
    long long v14 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    NSErrorDomain v15 = NSPOSIXErrorDomain;
    uint64_t v16 = 2;
    goto LABEL_17;
  }
  archive_write_add_filter_gzip();
  archive_write_set_format_pax();
  [objc_msgSend(a2, "path") UTF8String];
  int v10 = archive_write_open_filename();
  if (v10)
  {
    uint64_t v17 = v10;
    NSErrorUserInfoKey v25 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v26 = @"err";
    long long v14 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    NSErrorDomain v15 = NSPOSIXErrorDomain;
    uint64_t v16 = v17;
    goto LABEL_17;
  }
  if (sub_100097AD0(v9, a1, objc_msgSend(objc_msgSend(a2, "lastPathComponent"), "stringByDeletingPathExtension"), (id *)&v24))
  {
    if (qword_100103768 != -1) {
      dispatch_once(&qword_100103768, &stru_1000DF628);
    }
    if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [a1 path];
      id v12 = [a2 path];
      int v31 = 136316162;
      uint64_t v32 = "W5CreateTarball";
      __int16 v33 = 2080;
      id v34 = "W5MiscUtil.m";
      __int16 v35 = 1024;
      int v36 = 412;
      __int16 v37 = 2114;
      id v38 = v11;
      __int16 v39 = 2114;
      off_t v40 = (off_t)v12;
      uint64_t v13 = 1;
      _os_log_send_and_compose_impl();
    }
    else
    {
      uint64_t v13 = 1;
    }
    goto LABEL_22;
  }
LABEL_18:
  if (qword_100103768 != -1) {
    dispatch_once(&qword_100103768, &stru_1000DF628);
  }
  uint64_t v13 = 0;
  if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [a2 path];
    NSInteger v19 = [(NSError *)v24 code];
    uint64_t v32 = "W5CreateTarball";
    __int16 v33 = 2080;
    int v31 = 136316162;
    id v34 = "W5MiscUtil.m";
    __int16 v35 = 1024;
    int v36 = 408;
    __int16 v37 = 2114;
    id v38 = v18;
    __int16 v39 = 2048;
    off_t v40 = v19;
    _os_log_send_and_compose_impl();
    uint64_t v13 = 0;
  }
LABEL_22:
  if (a3 && v24) {
    *a3 = v24;
  }
  if (v9) {
    archive_write_free();
  }
  return v13;
}

uint64_t sub_100097AD0(uint64_t a1, void *a2, void *a3, id *a4)
{
  id v40 = 0;
  if (![a2 checkResourceIsReachableAndReturnError:&v40]) {
    goto LABEL_33;
  }
  id v39 = 0;
  if (![a2 getResourceValue:&v39 forKey:NSURLIsDirectoryKey error:&v40]) {
    goto LABEL_33;
  }
  if ([v39 BOOLValue])
  {
    memset(&v51, 0, sizeof(v51));
    stat((const char *)[v51 UTF8String], &v51);
    if (qword_100103768 != -1) {
      dispatch_once(&qword_100103768, &stru_1000DF628);
    }
    if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [a2 path];
      *(void *)&void v42[4] = "__W5ArchiveAddURLToArchive";
      __int16 v43 = 2080;
      *(_DWORD *)id v42 = 136316162;
      int v44 = "W5MiscUtil.m";
      __int16 v45 = 1024;
      int v46 = 341;
      __int16 v47 = 2114;
      id v48 = v9;
      __int16 v49 = 2048;
      off_t st_size = v51.st_size;
      LODWORD(v30) = 48;
      CFStringRef v28 = v42;
      _os_log_send_and_compose_impl();
    }
    int v10 = [+[NSFileManager defaultManager] contentsOfDirectoryAtURL:a2 includingPropertiesForKeys:0 options:0 error:&v40];
    if (v10)
    {
      id v11 = v10;
      __int16 v33 = a4;
      id v12 = v8;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v13 = [(NSArray *)v10 countByEnumeratingWithState:&v35 objects:v41 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v36;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v36 != v15) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v16);
            id v34 = 0;
            if ((sub_100097AD0(a1, v17, objc_msgSend(a3, "stringByAppendingPathComponent:", objc_msgSend(v17, "lastPathComponent", v29, v31)), &v34) & 1) == 0)
            {
              if (qword_100103768 != -1) {
                dispatch_once(&qword_100103768, &stru_1000DF628);
              }
              if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
              {
                id v32 = [a2 path];
                id v18 = [v34 code];
                *(_DWORD *)id v42 = 136316162;
                *(void *)&void v42[4] = "__W5ArchiveAddURLToArchive";
                __int16 v43 = 2080;
                int v44 = "W5MiscUtil.m";
                __int16 v45 = 1024;
                int v46 = 351;
                __int16 v47 = 2114;
                id v48 = v32;
                __int16 v49 = 2048;
                off_t st_size = (off_t)v18;
                LODWORD(v31) = 48;
                NSErrorUserInfoKey v29 = v42;
                _os_log_send_and_compose_impl();
              }
            }
            uint64_t v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v19 = [(NSArray *)v11 countByEnumeratingWithState:&v35 objects:v41 count:16];
          id v14 = v19;
        }
        while (v19);
      }
      uint64_t v20 = 1;
      id v8 = v12;
      a4 = v33;
      goto LABEL_25;
    }
    if (qword_100103768 != -1) {
      dispatch_once(&qword_100103768, &stru_1000DF628);
    }
    if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [a2 path];
      id v25 = [v40 code];
      *(void *)&void v42[4] = "__W5ArchiveAddURLToArchive";
      __int16 v43 = 2080;
      *(_DWORD *)id v42 = 136316162;
      int v44 = "W5MiscUtil.m";
      __int16 v45 = 1024;
      int v46 = 344;
      __int16 v47 = 2114;
      id v48 = v24;
      __int16 v49 = 2048;
      off_t st_size = (off_t)v25;
      _os_log_send_and_compose_impl();
    }
LABEL_33:
    uint64_t v20 = 0;
    goto LABEL_25;
  }
  *(void *)id v42 = 0;
  if ((sub_10009920C() & 1) == 0)
  {
    if (qword_100103768 != -1) {
      dispatch_once(&qword_100103768, &stru_1000DF628);
    }
    if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
    {
      id v26 = [a2 path];
      id v27 = [*(id *)v42 code];
      *(void *)&v51.st_mode = "__W5ArchiveAddURLToArchive";
      WORD2(v51.st_ino) = 2080;
      v51.st_dev = 136316162;
      *(__darwin_ino64_t *)((char *)&v51.st_ino + 6) = (__darwin_ino64_t)"W5MiscUtil.m";
      HIWORD(v51.st_gvoid (*v9)(const void *, id, id) = 1024;
      v51.st_rdev = 359;
      *((_WORD *)&v51.st_rdev + 2) = 2114;
      *(void *)((char *)&v51.st_rdev + 6) = v26;
      HIWORD(v51.st_atimespec.tv_sec) = 2048;
      v51.st_atimespec.tv_nsec = (uint64_t)v27;
      _os_log_send_and_compose_impl();
    }
  }
  uint64_t v20 = 1;
LABEL_25:
  id v21 = v40;
  id v22 = v40;
  if (a4 && v40) {
    *a4 = v40;
  }
  return v20;
}

uint64_t sub_1000980A8(void *a1, void *a2, NSError **a3)
{
  memset(&v25, 0, sizeof(v25));
  stat([[objc_msgSend(a1, "path") UTF8String];
  if (qword_100103768 != -1) {
    dispatch_once(&qword_100103768, &stru_1000DF628);
  }
  if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [a1 path];
    off_t st_size = v25.st_size;
    id v8 = [a2 path];
    int v32 = 136316418;
    __int16 v33 = "W5CopyUsingBOMCopier";
    __int16 v34 = 2080;
    long long v35 = "W5MiscUtil.m";
    __int16 v36 = 1024;
    int v37 = 490;
    __int16 v38 = 2114;
    id v39 = v6;
    __int16 v40 = 2048;
    off_t v41 = st_size;
    __int16 v42 = 2114;
    id v43 = v8;
    LODWORD(v24) = 58;
    stat v23 = &v32;
    _os_log_send_and_compose_impl();
  }
  -[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager", v23, v24), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", [objc_msgSend(objc_msgSend(a2, "path"), "stringByDeletingLastPathComponent") stringByDeletingLastPathComponent], 1, 0, 0);
  uint64_t v9 = BOMCopierNew();
  if (v9)
  {
    if (!-[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", [a1 path]))
    {
      id v19 = 0;
      goto LABEL_20;
    }
    HIBYTE(v24) = 0;
    if (-[NSFileManager fileExistsAtPath:isDirectory:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:isDirectory:", [a1 path], (char *)&v24 + 7))
    {
      id v10 = +[NSMutableDictionary dictionary];
      [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"copyResources"];
      [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"copyExtendedAttributes"];
      [a1 fileSystemRepresentation];
      [a2 fileSystemRepresentation];
      int v11 = BOMCopierCopyWithOptions();
      if (!v11)
      {
        if (qword_100103768 != -1) {
          dispatch_once(&qword_100103768, &stru_1000DF628);
        }
        if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
        {
          id v12 = [a1 path];
          id v13 = [a2 path];
          int v32 = 136316162;
          __int16 v33 = "W5CopyUsingBOMCopier";
          __int16 v34 = 2080;
          long long v35 = "W5MiscUtil.m";
          __int16 v36 = 1024;
          int v37 = 520;
          __int16 v38 = 2114;
          id v39 = v12;
          __int16 v40 = 2114;
          off_t v41 = (off_t)v13;
          uint64_t v14 = 1;
          _os_log_send_and_compose_impl();
        }
        else
        {
          uint64_t v14 = 1;
        }
LABEL_14:
        BOMCopierFree();
        return v14;
      }
      uint64_t v20 = v11;
      NSErrorUserInfoKey v26 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v27 = @"err";
      uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      NSErrorDomain v17 = NSPOSIXErrorDomain;
      uint64_t v18 = v20;
    }
    else
    {
      NSErrorUserInfoKey v28 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v29 = @"ENOENT";
      uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      NSErrorDomain v17 = NSPOSIXErrorDomain;
      uint64_t v18 = 2;
    }
  }
  else
  {
    NSErrorUserInfoKey v30 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v31 = @"ENOMEM";
    uint64_t v16 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    NSErrorDomain v17 = NSPOSIXErrorDomain;
    uint64_t v18 = 12;
  }
  id v19 = +[NSError errorWithDomain:v17 code:v18 userInfo:v16];
LABEL_20:
  if (qword_100103768 != -1) {
    dispatch_once(&qword_100103768, &stru_1000DF628);
  }
  if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [a1 path];
    NSInteger v22 = [(NSError *)v19 code];
    __int16 v33 = "W5CopyUsingBOMCopier";
    __int16 v34 = 2080;
    int v32 = 136316162;
    long long v35 = "W5MiscUtil.m";
    __int16 v36 = 1024;
    int v37 = 516;
    __int16 v38 = 2114;
    id v39 = v21;
    __int16 v40 = 2048;
    off_t v41 = v22;
    _os_log_send_and_compose_impl();
  }
  if (a3 && v19) {
    *a3 = v19;
  }
  uint64_t v14 = 0;
  uint64_t result = 0;
  if (v9) {
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_100098638(const __CFString *a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  if (qword_100103768 != -1) {
    dispatch_once(&qword_100103768, &stru_1000DF628);
  }
  if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 136316418;
    __int16 v34 = "W5DeleteFilesAtPath";
    __int16 v35 = 2080;
    __int16 v36 = "W5MiscUtil.m";
    __int16 v37 = 1024;
    int v38 = 648;
    __int16 v39 = 2114;
    CFStringRef v40 = a1;
    __int16 v41 = 2114;
    *(void *)__int16 v42 = a2;
    *(_WORD *)&v42[8] = 2048;
    *(void *)&v42[10] = a3;
    LODWORD(v23) = 58;
    NSInteger v22 = &v33;
    _os_log_send_and_compose_impl();
  }
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  if (!*a4)
  {
    io_registry_entry_t v7 = +[NSFileManager defaultManager];
    id v8 = [objc_alloc((Class)NSURL) initFileURLWithPath:a1 isDirectory:1];
    NSURLResourceKey v46 = NSURLCreationDateKey;
    uint64_t v9 = [(NSFileManager *)v7 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:+[NSArray arrayWithObjects:&v46 count:1] options:4 error:&v32];
    if (v9)
    {
      id obj = [(NSArray *)v9 filteredArrayUsingPredicate:a2];
      if (qword_100103768 != -1) {
        dispatch_once(&qword_100103768, &stru_1000DF628);
      }
      if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v10 = [(NSArray *)obj count];
        int v33 = 136316162;
        __int16 v34 = "W5DeleteFilesAtPath";
        __int16 v35 = 2080;
        __int16 v36 = "W5MiscUtil.m";
        __int16 v37 = 1024;
        int v38 = 667;
        __int16 v39 = 2048;
        CFStringRef v40 = v10;
        __int16 v41 = 2114;
        *(void *)__int16 v42 = @"/var/run/com.apple.wifivelocity";
        LODWORD(v23) = 48;
        NSInteger v22 = &v33;
        _os_log_send_and_compose_impl();
      }
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v45, 16, v22, v23);
      if (v11)
      {
        id v12 = v11;
        uint64_t v24 = 0;
        uint64_t v13 = *(void *)v28;
LABEL_13:
        uint64_t v14 = 0;
        while (1)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(obj);
          }
          if (*a4) {
            break;
          }
          uint64_t v15 = *(__CFString **)(*((void *)&v27 + 1) + 8 * v14);
          [(__CFString *)v15 getResourceValue:&v31 forKey:NSURLCreationDateKey error:&v32];
          if (v32)
          {
            if (qword_100103768 != -1) {
              dispatch_once(&qword_100103768, &stru_1000DF628);
            }
            if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
            {
              int v33 = 136315906;
              __int16 v34 = "W5DeleteFilesAtPath";
              __int16 v35 = 2080;
              __int16 v36 = "W5MiscUtil.m";
              __int16 v37 = 1024;
              int v38 = 675;
              __int16 v39 = 2114;
              CFStringRef v40 = v15;
              _os_log_send_and_compose_impl();
            }
          }
          else
          {
            uint64_t v16 = +[NSCalendar currentCalendar];
            NSInteger v17 = [(NSDateComponents *)[(NSCalendar *)v16 components:16 fromDate:v31 toDate:+[NSDate date] options:0] day];
            if (qword_100103768 != -1) {
              dispatch_once(&qword_100103768, &stru_1000DF628);
            }
            if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
            {
              int v33 = 136316674;
              __int16 v34 = "W5DeleteFilesAtPath";
              __int16 v35 = 2080;
              __int16 v36 = "W5MiscUtil.m";
              __int16 v37 = 1024;
              int v38 = 682;
              __int16 v39 = 2114;
              CFStringRef v40 = v15;
              __int16 v41 = 2114;
              *(void *)__int16 v42 = v31;
              *(_WORD *)&v42[8] = 2048;
              *(void *)&v42[10] = v17;
              __int16 v43 = 1024;
              BOOL v44 = v17 >= a3;
              _os_log_send_and_compose_impl();
            }
            if (v17 >= a3)
            {
              unsigned int v18 = [+[NSFileManager defaultManager] removeItemAtURL:v15 error:&v32];
              if (qword_100103768 != -1) {
                dispatch_once(&qword_100103768, &stru_1000DF628);
              }
              if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
              {
                int v33 = 136316418;
                __int16 v34 = "W5DeleteFilesAtPath";
                __int16 v35 = 2080;
                __int16 v36 = "W5MiscUtil.m";
                __int16 v37 = 1024;
                int v38 = 687;
                __int16 v39 = 2112;
                CFStringRef v40 = v15;
                __int16 v41 = 1024;
                *(_DWORD *)__int16 v42 = v18;
                *(_WORD *)&void v42[4] = 2112;
                *(void *)&v42[6] = v32;
                _os_log_send_and_compose_impl();
              }
              uint64_t v19 = v24;
              if (!v32) {
                uint64_t v19 = v24 + 1;
              }
              uint64_t v24 = v19;
            }
          }
          if (v12 == (id)++v14)
          {
            id v12 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v45 count:16];
            if (v12) {
              goto LABEL_13;
            }
            goto LABEL_51;
          }
        }
        if (qword_100103768 != -1) {
          dispatch_once(&qword_100103768, &stru_1000DF628);
        }
        if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
        {
          int v33 = 136315650;
          __int16 v34 = "W5DeleteFilesAtPath";
          __int16 v35 = 2080;
          __int16 v36 = "W5MiscUtil.m";
          __int16 v37 = 1024;
          int v38 = 670;
          _os_log_send_and_compose_impl();
          goto LABEL_51;
        }
LABEL_52:
        uint64_t v20 = v24;
        goto LABEL_53;
      }
      goto LABEL_50;
    }
    if (qword_100103768 != -1) {
      dispatch_once(&qword_100103768, &stru_1000DF628);
    }
    if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
    {
      int v33 = 136316162;
      __int16 v34 = "W5DeleteFilesAtPath";
      __int16 v35 = 2080;
      __int16 v36 = "W5MiscUtil.m";
      __int16 v37 = 1024;
      int v38 = 664;
      __int16 v39 = 2114;
      CFStringRef v40 = @"/var/run/com.apple.wifivelocity";
      __int16 v41 = 2114;
      *(void *)__int16 v42 = v32;
      goto LABEL_49;
    }
LABEL_56:
    uint64_t v20 = 0;
    goto LABEL_53;
  }
  if (qword_100103768 != -1) {
    dispatch_once(&qword_100103768, &stru_1000DF628);
  }
  if (!os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_56;
  }
  int v33 = 136315650;
  __int16 v34 = "W5DeleteFilesAtPath";
  __int16 v35 = 2080;
  __int16 v36 = "W5MiscUtil.m";
  __int16 v37 = 1024;
  int v38 = 656;
LABEL_49:
  _os_log_send_and_compose_impl();
LABEL_50:
  uint64_t v24 = 0;
LABEL_51:
  if (qword_100103768 == -1) {
    goto LABEL_52;
  }
  dispatch_once(&qword_100103768, &stru_1000DF628);
  uint64_t v20 = v24;
LABEL_53:
  if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
  {
    int v33 = 136315650;
    __int16 v34 = "W5DeleteFilesAtPath";
    __int16 v35 = 2080;
    __int16 v36 = "W5MiscUtil.m";
    __int16 v37 = 1024;
    int v38 = 695;
    _os_log_send_and_compose_impl();
  }
  return v20;
}

void sub_100098FD0(id a1)
{
  qword_100103760 = (uint64_t)os_log_create("com.apple.wifivelocity", "");
}

uint64_t sub_100099000()
{
  if (qword_100103778 != -1) {
    dispatch_once(&qword_100103778, &stru_1000DF648);
  }
  return qword_100103770;
}

void sub_100099044(id a1)
{
  qword_100103770 = (uint64_t)os_log_create("com.apple.wifivelocity", "Default");
}

id sub_100099074(uint64_t a1)
{
  uint64_t v2 = +[NSTimeZone systemTimeZone];

  return +[NSISO8601DateFormatter stringFromDate:a1 timeZone:v2 formatOptions:1907];
}

uint64_t sub_1000990C8(unsigned __int8 *a1, unint64_t a2, unsigned __int8 *a3, void *a4)
{
  if (a2 && (uint64_t)(a2 - (void)a1) < 1) {
    return 4294960546;
  }
  unsigned int v4 = *a1;
  if (!*a1) {
    goto LABEL_28;
  }
  uint64_t v5 = a1;
  do
  {
    if (v4 > 0x3F) {
      return 4294960554;
    }
    id v6 = &v5[v4 + 1];
    if (v6 - a1 > 255) {
      return 4294960554;
    }
    if (a2 && (unint64_t)v6 >= a2) {
      return 4294960546;
    }
    io_registry_entry_t v7 = v5 + 1;
    do
    {
      unsigned __int8 v8 = *v7;
      if (((char)*v7 - 32) <= 0x5E)
      {
        if (*v7 - 32 <= 0x3C && ((1 << (v8 - 32)) & 0x1000000000004001) != 0) {
          *a3++ = 92;
        }
LABEL_24:
        *a3++ = v8;
        goto LABEL_25;
      }
      if ((*v7 & 0x80) != 0) {
        goto LABEL_24;
      }
      *a3 = 92;
      if (v8 <= 0x63u) {
        char v10 = 48;
      }
      else {
        char v10 = 49;
      }
      a3[1] = v10;
      if (v8 >= 0x64u) {
        char v11 = v8 / 0xAu - 10;
      }
      else {
        char v11 = v8 / 0xAu;
      }
      a3[2] = v11 + 48;
      a3[3] = (v8 % 0xAu) | 0x30;
      a3 += 4;
LABEL_25:
      ++v7;
    }
    while (v7 < v6);
    *a3++ = 46;
    unsigned int v4 = *v6;
    uint64_t v5 = v6;
  }
  while (*v6);
  if (v6 == a1)
  {
LABEL_28:
    *a3++ = 46;
    id v6 = a1;
  }
  *a3 = 0;
  uint64_t result = 0;
  if (a4) {
    *a4 = v6 + 1;
  }
  return result;
}

uint64_t sub_10009920C()
{
  __chkstk_darwin();
  io_object_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  memset(&v26, 0, sizeof(v26));
  stat((const char *)[v4 path], &v26);
  if (qword_100103768 != -1) {
    dispatch_once(&qword_100103768, &stru_1000DF628);
  }
  if (os_log_type_enabled((os_log_t)qword_100103760, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v5 path];
    __int16 v35 = "__W5ArchiveAddFileURLToArchive";
    __int16 v36 = 2080;
    *(_DWORD *)buf = 136316162;
    *(void *)__int16 v37 = "W5MiscUtil.m";
    *(_WORD *)&v37[8] = 1024;
    *(_DWORD *)&v37[10] = 276;
    *(_WORD *)&v37[14] = 2114;
    *(void *)&v37[16] = v6;
    __int16 v38 = 2048;
    off_t st_size = v26.st_size;
    LODWORD(v25) = 48;
    uint64_t v24 = buf;
    _os_log_send_and_compose_impl();
  }
  uint64_t v7 = archive_entry_new();
  if (v7)
  {
    archive_entry_copy_stat();
    [v3 UTF8String];
    archive_entry_set_pathname();
    archive_entry_set_perm();
    int v8 = archive_write_header();
    if (v8)
    {
      int v17 = v8;
      NSErrorUserInfoKey v30 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v31 = @"err";
      unsigned int v18 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v8, +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1]);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        uint64_t v19 = (const char *)[v3 UTF8String];
        uint64_t v20 = archive_error_string();
        *(_DWORD *)buf = 136446722;
        __int16 v35 = v19;
        __int16 v36 = 1026;
        *(_DWORD *)__int16 v37 = v17;
        *(_WORD *)&v37[4] = 2082;
        *(void *)&v37[6] = v20;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] archive_write_header() FAILED for %{public}s, returned %{public}d (%{public}s)", buf, 0x1Cu);
      }
      goto LABEL_21;
    }
    int v9 = open([[v5 path] UTF8String], 0);
    if ((v9 & 0x80000000) == 0)
    {
      int v10 = v9;
      if (read(v9, v27, 0x2000uLL) < 1)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = (const char *)[v3 UTF8String];
          *(_DWORD *)buf = 136446210;
          __int16 v35 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] Unexpected zero-length file encountered for %{public}s", buf, 0xCu);
        }
        uint64_t v11 = 0;
      }
      else
      {
        uint64_t v11 = 0;
        do
          v11 += archive_write_data();
        while (read(v10, v27, 0x2000uLL) > 0);
      }
      close(v10);
      if (v11 != v26.st_size && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        NSInteger v22 = (const char *)[v3 UTF8String];
        *(_DWORD *)buf = 136446722;
        __int16 v35 = v22;
        __int16 v36 = 2050;
        *(void *)__int16 v37 = v26.st_size;
        *(_WORD *)&v37[8] = 2050;
        *(void *)&v37[10] = v11;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[wifivelocity] Bytes written does not equal file size (file='%{public}s', size=%{public}lld, written=%{public}zd)", buf, 0x20u);
      }
      uint64_t v12 = 1;
      goto LABEL_13;
    }
    uint64_t v21 = *__error();
    NSErrorUserInfoKey v28 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v29 = @"errno";
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    NSErrorDomain v15 = NSPOSIXErrorDomain;
    uint64_t v16 = v21;
  }
  else
  {
    NSErrorUserInfoKey v32 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v33 = @"ENOMEM";
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    NSErrorDomain v15 = NSPOSIXErrorDomain;
    uint64_t v16 = 12;
  }
  unsigned int v18 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, v16, v14, v24, v25);
LABEL_21:
  uint64_t v12 = 0;
  if (v1 && v18)
  {
    uint64_t v12 = 0;
    *io_object_t v1 = v18;
  }
LABEL_13:
  if (v7) {
    archive_entry_free();
  }
  return v12;
}

void sub_100099B94(_Unwind_Exception *exception_object)
{
}

void sub_100099BB0(id a1)
{
  io_object_t v1 = sub_10009756C();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_100099C8C(id a1, RPCompanionLinkDevice *a2)
{
  uint64_t v2 = sub_10009756C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

void sub_100099D78(id a1, RPCompanionLinkDevice *a2)
{
  uint64_t v2 = sub_10009756C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
}

id sub_100099E64(uint64_t a1)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  long long v1 = *(_OWORD *)(a1 + 32);
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v4[2] = sub_100099EDC;
  v4[3] = &unk_1000DF6D0;
  long long v5 = v1;
  return [v2 activateWithCompletion:v4];
}

intptr_t sub_100099EDC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = sub_10009756C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
    unsigned int v4 = *(void **)(a1 + 32);
    objc_sync_enter(v4);
    *(void *)(*(void *)(a1 + 32) + 24) = 0;
    objc_sync_exit(v4);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10009A144(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  id v17 = objc_alloc_init((Class)NSMutableDictionary);
  id v2 = objc_alloc_init((Class)NSMutableSet);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v16 = a1;
  id v3 = [*(id *)(*(void *)(a1 + 40) + 16) activeDevices];
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v44 count:16];
  if (v4)
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(v7, "idsDeviceIdentifier", v14, v15)
          && !objc_msgSend(v2, "containsObject:", objc_msgSend(v7, "idsDeviceIdentifier")))
        {
          int v9 = sub_10009756C();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v26 = 136315906;
            long long v27 = "-[W5PeerDiagnosticsManager beginPeerDiscovery]_block_invoke";
            __int16 v28 = 2080;
            CFStringRef v29 = "W5PeerDiagnosticsManager.m";
            __int16 v30 = 1024;
            int v31 = 222;
            __int16 v32 = 2114;
            id v33 = v7;
            LODWORD(v15) = 38;
            uint64_t v14 = &v26;
            _os_log_send_and_compose_impl();
          }
          [v2 addObject:[v7 idsDeviceIdentifier:v14, v15]];
          if ([v7 model]
            && ((objc_msgSend(objc_msgSend(v7, "model"), "containsString:", @"iPhone") & 1) != 0
             || objc_msgSend(objc_msgSend(v7, "model"), "containsString:", @"iPad")))
          {
            ++v21;
          }
          else if ([v7 model] {
                 && objc_msgSend(objc_msgSend(v7, "model"), "containsString:", @"Mac"))
          }
          {
            ++v20;
          }
          else if ([v7 model] {
                 && objc_msgSend(objc_msgSend(v7, "model"), "containsString:", @"AppleTV"))
          }
          {
            ++v18;
          }
          else if ([v7 model])
          {
            v19 += [v7 model containsString:@"Watch"];
          }
        }
        else
        {
          int v8 = sub_10009756C();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            int v26 = 136315906;
            long long v27 = "-[W5PeerDiagnosticsManager beginPeerDiscovery]_block_invoke";
            __int16 v28 = 2080;
            CFStringRef v29 = "W5PeerDiagnosticsManager.m";
            __int16 v30 = 1024;
            int v31 = 219;
            __int16 v32 = 2114;
            id v33 = v7;
            LODWORD(v15) = 38;
            uint64_t v14 = &v26;
            _os_log_send_and_compose_impl();
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v22 objects:v44 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v18 = 0;
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
  }
  [v17 setObject:[objc_msgSend(*(id *)(*(void *)(a1 + 40) + 16), "localDevice", v14, v15), "model") forKeyedSubscript:@"DeviceModel"];
  [v17 setObject:[+[NSDate date](NSDate, "date")] forKeyedSubscript:@"Timestamp"];
  [v17 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v21)] forKeyedSubscript:@"numberOfIOSDevices"];
  [v17 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v18) forKeyedSubscript:@"numberOfTVOSDevices"];
  [v17 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v20) forKeyedSubscript:@"numberOfMacOSDevices"];
  [v17 setObject:+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v19) forKeyedSubscript:@"numberOfWatchOSDevices"];
  int v10 = sub_10009756C();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v17 objectForKeyedSubscript:@"DeviceModel"];
    id v12 = [v17 objectForKeyedSubscript:@"Timestamp"];
    int v26 = 136317186;
    long long v27 = "-[W5PeerDiagnosticsManager beginPeerDiscovery]_block_invoke";
    __int16 v28 = 2080;
    CFStringRef v29 = "W5PeerDiagnosticsManager.m";
    __int16 v30 = 1024;
    int v31 = 249;
    __int16 v32 = 2114;
    id v33 = v11;
    __int16 v34 = 2114;
    id v35 = v12;
    __int16 v36 = 2048;
    uint64_t v37 = v21;
    __int16 v38 = 2048;
    uint64_t v39 = v18;
    __int16 v40 = 2048;
    uint64_t v41 = v20;
    __int16 v42 = 2048;
    uint64_t v43 = v19;
    _os_log_send_and_compose_impl();
  }
  uint64_t v13 = *(void **)(a1 + 40);
  objc_sync_enter(*(id *)(v16 + 40));

  *(void *)(*(void *)(v16 + 40) + 32) = [v17 copy];
  objc_sync_exit(v13);
  [*(id *)(v16 + 40) invalidateDiscoveryClient];
  dispatch_release(*(dispatch_object_t *)(v16 + 32));
}

void sub_10009A6E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10009A798(uint64_t a1)
{
  [*(id *)(a1 + 32) registerRequestHandler];
  id v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10009A824;
  v4[3] = &unk_1000DEB40;
  void v4[4] = *(void *)(a1 + 40);
  return [v2 activateWithCompletion:v4];
}

intptr_t sub_10009A824(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v3 = sub_10009756C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10009A9A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  (*(void (**)(uint64_t, id, void, void))(a4 + 16))(a4, [*(id *)(a1 + 32) localDiagnostics], 0, 0);
  id v4 = sub_10009756C();
  uint64_t result = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (result) {
    return _os_log_send_and_compose_impl();
  }
  return result;
}

void sub_10009AF08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10009AF30(uint64_t a1, uint64_t a2)
{
}

void sub_10009AF40(uint64_t a1)
{
}

uint64_t sub_10009AF4C()
{
  uint64_t v3 = 0;
  id v4 = &v3;
  uint64_t v5 = 0x3052000000;
  id v6 = sub_10009AF30;
  uint64_t v7 = sub_10009AF40;
  uint64_t v0 = qword_100103780;
  uint64_t v8 = qword_100103780;
  if (!qword_100103780)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10009C08C;
    v2[3] = &unk_1000DD348;
    v2[4] = &v3;
    sub_10009C08C((uint64_t)v2);
    uint64_t v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10009B024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10009B03C(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = sub_10009756C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      _os_log_send_and_compose_impl();
    }
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    uint64_t v7 = *(void **)(a1 + 40);
    objc_sync_enter(v7);
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [a2 copy];
    }
    objc_sync_exit(v7);
    uint64_t v8 = *(NSObject **)(a1 + 32);
    return dispatch_semaphore_signal(v8);
  }
}

void sub_10009B1AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10009B440()
{
  uint64_t v0 = sub_10009756C();
  uint64_t result = os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT);
  if (result) {
    return _os_log_send_and_compose_impl();
  }
  return result;
}

id sub_10009B530(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = sub_10009756C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      uint64_t v12 = "-[W5PeerDiagnosticsManager requestDiagnostics:completionBlock:]_block_invoke";
      __int16 v13 = 2080;
      uint64_t v14 = "W5PeerDiagnosticsManager.m";
      __int16 v15 = 1024;
      int v16 = 391;
      __int16 v17 = 2114;
      uint64_t v18 = a2;
      _os_log_send_and_compose_impl();
    }
    return (id)(*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0);
  }
  else
  {
    uint64_t v9 = RPOptionAllowUnauthenticated;
    int v10 = &__kCFBooleanTrue;
    id v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    _DWORD v8[2] = sub_10009B6E0;
    v8[3] = &unk_1000DF748;
    uint64_t v7 = *(void **)(a1 + 32);
    void v8[4] = *(void *)(a1 + 40);
    return [v7 sendRequestID:@"com.apple.proximity.peerdiagnosticslink" request:&__NSDictionary0__struct options:v6 responseHandler:v8];
  }
}

uint64_t sub_10009B6E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10009BC64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

id sub_10009BCA8(uint64_t a1)
{
  long long v1 = *(void **)(a1 + 32);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10009BD30;
  v5[3] = &unk_1000DF770;
  void v5[4] = v1;
  int8x16_t v2 = *(int8x16_t *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 56);
  int8x16_t v6 = vextq_s8(v2, v2, 8uLL);
  long long v7 = v3;
  return [v1 requestDiagnostics:v2.i64[0] completionBlock:v5];
}

void sub_10009BD30(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v4 = *(void **)(a1 + 32);
    objc_sync_enter(v4);
    ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    [*(id *)(a1 + 40) addObject:a2];
    [*(id *)(a1 + 40) count];
    objc_sync_exit(v4);
    uint64_t v5 = sub_10009756C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 48) model];
LABEL_5:
      _os_log_send_and_compose_impl();
    }
  }
  else
  {
    int8x16_t v6 = sub_10009756C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_5;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_10009BF28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10009BF3C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) localDiagnostics];
  [v2 setObject:@"YES" forKeyedSubscript:@"LocalDevice"];
  long long v3 = *(void **)(a1 + 32);
  objc_sync_enter(v3);
  [*(id *)(a1 + 40) addObject:v2];
  objc_sync_exit(v3);
  id v4 = sub_10009756C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
    _os_log_send_and_compose_impl();
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10009C078(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class sub_10009C08C(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100103788)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = (void *)3221225472;
    v5[3] = sub_10009C248;
    void v5[4] = &unk_1000DD380;
    void v5[5] = v5;
    long long v6 = off_1000DF7B8;
    uint64_t v7 = 0;
    qword_100103788 = _sl_dlopen();
  }
  if (!qword_100103788)
  {
    long long v3 = +[NSAssertionHandler currentHandler];
    id v4 = +[NSString stringWithUTF8String:"void *WiFiAnalyticsLibrary(void)"];
    [(NSAssertionHandler *)v3 handleFailureInFunction:v4, @"W5PeerDiagnosticsManager.m", 22, @"%s", v5[0] file lineNumber description];
    goto LABEL_10;
  }
  if (v5[0]) {
    free(v5[0]);
  }
  Class result = objc_getClass("WAClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    [+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:"Class getWAClientClass(void)_block_invoke"], @"W5PeerDiagnosticsManager.m", 24, @"Unable to find class %s", "WAClient" file lineNumber description];
LABEL_10:
    __break(1u);
  }
  qword_100103780 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t sub_10009C248()
{
  uint64_t result = _sl_dlopen();
  qword_100103788 = result;
  return result;
}

uint64_t Apple80211BindToInterface()
{
  return _Apple80211BindToInterface();
}

uint64_t Apple80211Close()
{
  return _Apple80211Close();
}

uint64_t Apple80211EventMonitoringInit2()
{
  return _Apple80211EventMonitoringInit2();
}

uint64_t Apple80211GetIOReportingService()
{
  return _Apple80211GetIOReportingService();
}

uint64_t Apple80211Open()
{
  return _Apple80211Open();
}

uint64_t Apple80211RawSet()
{
  return _Apple80211RawSet();
}

uint64_t Apple80211StartMonitoringEvent()
{
  return _Apple80211StartMonitoringEvent();
}

uint64_t Apple80211StopMonitoringEvent()
{
  return _Apple80211StopMonitoringEvent();
}

uint64_t BOMCopierCopyWithOptions()
{
  return _BOMCopierCopyWithOptions();
}

uint64_t BOMCopierFree()
{
  return _BOMCopierFree();
}

uint64_t BOMCopierNew()
{
  return _BOMCopierNew();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFHostCancelInfoResolution(CFHostRef theHost, CFHostInfoType info)
{
}

CFHostRef CFHostCreateWithName(CFAllocatorRef allocator, CFStringRef hostname)
{
  return _CFHostCreateWithName(allocator, hostname);
}

CFArrayRef CFHostGetAddressing(CFHostRef theHost, Boolean *hasBeenResolved)
{
  return _CFHostGetAddressing(theHost, hasBeenResolved);
}

Boolean CFHostStartInfoResolution(CFHostRef theHost, CFHostInfoType info, CFStreamError *error)
{
  return _CFHostStartInfoResolution(theHost, info, error);
}

uint64_t CFNetDiagnosticPingWithOptions()
{
  return _CFNetDiagnosticPingWithOptions();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
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

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFRange v5 = _CFStringFind(theString, stringToFind, compareOptions);
  CFIndex length = v5.length;
  CFIndex location = v5.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return _DNSServiceBrowse(sdRef, flags, interfaceIndex, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceConstructFullName(char *const fullName, const char *const service, const char *const regtype, const char *const domain)
{
  return _DNSServiceConstructFullName(fullName, service, regtype, domain);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return _DNSServiceCreateConnection(sdRef);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return _DNSServiceGetAddrInfo(sdRef, flags, interfaceIndex, protocol, hostname, callBack, context);
}

DNSServiceErrorType DNSServiceQueryRecord(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, DNSServiceQueryRecordReply callBack, void *context)
{
  return _DNSServiceQueryRecord(sdRef, flags, interfaceIndex, fullname, rrtype, rrclass, callBack, context);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
}

DNSServiceErrorType DNSServiceResolve(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, DNSServiceResolveReply callBack, void *context)
{
  return _DNSServiceResolve(sdRef, flags, interfaceIndex, name, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return _DNSServiceSetDispatchQueue(service, queue);
}

uint64_t IDSCopyLocalDeviceUniqueID()
{
  return _IDSCopyLocalDeviceUniqueID();
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMainPort(bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

uint64_t IOPMIsASleep()
{
  return _IOPMIsASleep();
}

CFTypeRef IOPSCopyPowerSourcesInfo(void)
{
  return _IOPSCopyPowerSourcesInfo();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return _IOPSCopyPowerSourcesList(blob);
}

IOPSLowBatteryWarningLevel IOPSGetBatteryWarningLevel(void)
{
  return _IOPSGetBatteryWarningLevel();
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return _IOPSGetPowerSourceDescription(blob, ps);
}

CFStringRef IOPSGetProvidingPowerSourceType(CFTypeRef snapshot)
{
  return _IOPSGetProvidingPowerSourceType(snapshot);
}

CFTimeInterval IOPSGetTimeRemainingEstimate(void)
{
  return _IOPSGetTimeRemainingEstimate();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return _IORegistryEntryGetChildEntry(entry, plane, child);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

uint64_t IOReportChannelGetGroup()
{
  return _IOReportChannelGetGroup();
}

uint64_t IOReportChannelGetSubGroup()
{
  return _IOReportChannelGetSubGroup();
}

uint64_t IOReportCopyChannelsForDriver()
{
  return _IOReportCopyChannelsForDriver();
}

uint64_t IOReportCopyChannelsInCategories()
{
  return _IOReportCopyChannelsInCategories();
}

uint64_t IOReportCreateAggregate()
{
  return _IOReportCreateAggregate();
}

uint64_t IOReportCreateSamples()
{
  return _IOReportCreateSamples();
}

uint64_t IOReportCreateSamplesDelta()
{
  return _IOReportCreateSamplesDelta();
}

uint64_t IOReportCreateSubscription()
{
  return _IOReportCreateSubscription();
}

uint64_t IOReportGetChannelCount()
{
  return _IOReportGetChannelCount();
}

uint64_t IOReportMergeChannels()
{
  return _IOReportMergeChannels();
}

uint64_t IOReportPrune()
{
  return _IOReportPrune();
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSPrintF()
{
  return _NSPrintF();
}

uint64_t NSRandomData()
{
  return _NSRandomData();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

CFStringRef SCDynamicStoreCopyComputerName(SCDynamicStoreRef store, CFStringEncoding *nameEncoding)
{
  return _SCDynamicStoreCopyComputerName(store, nameEncoding);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreate(CFAllocatorRef allocator, CFStringRef fmt, ...)
{
  return _SCDynamicStoreKeyCreate(allocator, fmt);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkServiceEntity(allocator, domain, serviceID, entity);
}

int SCError(void)
{
  return _SCError();
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return _SCNetworkSetCopyCurrent(prefs);
}

CFArrayRef SCNetworkSetGetServiceOrder(SCNetworkSetRef set)
{
  return _SCNetworkSetGetServiceOrder(set);
}

Boolean SCNetworkSetSetServiceOrder(SCNetworkSetRef set, CFArrayRef newOrder)
{
  return _SCNetworkSetSetServiceOrder(set, newOrder);
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesApplyChanges(prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesCommitChanges(prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return _SCPreferencesLock(prefs, wait);
}

Boolean SCPreferencesSetValue(SCPreferencesRef prefs, CFStringRef key, CFPropertyListRef value)
{
  return _SCPreferencesSetValue(prefs, key, value);
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return _SCPreferencesUnlock(prefs);
}

uint64_t SocketGetInterfaceInfo()
{
  return _SocketGetInterfaceInfo();
}

uint64_t W5DescriptionForAWDLScheduleState()
{
  return _W5DescriptionForAWDLScheduleState();
}

uint64_t W5DescriptionForAirDropDiscoverableMode()
{
  return _W5DescriptionForAirDropDiscoverableMode();
}

uint64_t W5DescriptionForBTCMode()
{
  return _W5DescriptionForBTCMode();
}

uint64_t W5DescriptionForBatteryWarningLevel()
{
  return _W5DescriptionForBatteryWarningLevel();
}

uint64_t W5DescriptionForBluetoothDeviceType()
{
  return _W5DescriptionForBluetoothDeviceType();
}

uint64_t W5DescriptionForChainAck()
{
  return _W5DescriptionForChainAck();
}

uint64_t W5DescriptionForChainPowerState()
{
  return _W5DescriptionForChainPowerState();
}

uint64_t W5DescriptionForChannel()
{
  return _W5DescriptionForChannel();
}

uint64_t W5DescriptionForChannelWidth()
{
  return _W5DescriptionForChannelWidth();
}

uint64_t W5DescriptionForDesense()
{
  return _W5DescriptionForDesense();
}

uint64_t W5DescriptionForDesenseFlags()
{
  return _W5DescriptionForDesenseFlags();
}

uint64_t W5DescriptionForDiagnosticsFaultType()
{
  return _W5DescriptionForDiagnosticsFaultType();
}

uint64_t W5DescriptionForDiagnosticsTestID()
{
  return _W5DescriptionForDiagnosticsTestID();
}

uint64_t W5DescriptionForEAPOLControlMode()
{
  return _W5DescriptionForEAPOLControlMode();
}

uint64_t W5DescriptionForEAPOLControlState()
{
  return _W5DescriptionForEAPOLControlState();
}

uint64_t W5DescriptionForEAPOLSupplicantState()
{
  return _W5DescriptionForEAPOLSupplicantState();
}

uint64_t W5DescriptionForIPv4ConfigMethod()
{
  return _W5DescriptionForIPv4ConfigMethod();
}

uint64_t W5DescriptionForIPv6ConfigMethod()
{
  return _W5DescriptionForIPv6ConfigMethod();
}

uint64_t W5DescriptionForLogItemID()
{
  return _W5DescriptionForLogItemID();
}

uint64_t W5DescriptionForOpMode()
{
  return _W5DescriptionForOpMode();
}

uint64_t W5DescriptionForPHYMode()
{
  return _W5DescriptionForPHYMode();
}

uint64_t W5DescriptionForPingTrafficClass()
{
  return _W5DescriptionForPingTrafficClass();
}

uint64_t W5DescriptionForPower()
{
  return _W5DescriptionForPower();
}

uint64_t W5DescriptionForPowerSourceType()
{
  return _W5DescriptionForPowerSourceType();
}

uint64_t W5DescriptionForPowerStateCaps()
{
  return _W5DescriptionForPowerStateCaps();
}

uint64_t W5DescriptionForSecurity()
{
  return _W5DescriptionForSecurity();
}

uint64_t W5DescriptionForWiFiDropReason()
{
  return _W5DescriptionForWiFiDropReason();
}

uint64_t W5FormattedDescriptionForDiagnosticsTestResult()
{
  return _W5FormattedDescriptionForDiagnosticsTestResult();
}

uint64_t W5FormattedHeaderForDiagnosticsTestResults()
{
  return _W5FormattedHeaderForDiagnosticsTestResults();
}

uint64_t WiFiManagerClientCopyProperty()
{
  return _WiFiManagerClientCopyProperty();
}

uint64_t WiFiManagerClientCreate()
{
  return _WiFiManagerClientCreate();
}

uint64_t WiFiManagerClientDumpLogs()
{
  return _WiFiManagerClientDumpLogs();
}

uint64_t WiFiManagerClientSetProperty()
{
  return _WiFiManagerClientSetProperty();
}

uint64_t WiFiNetworkCreate()
{
  return _WiFiNetworkCreate();
}

uint64_t WiFiNetworkIsAPLeaky()
{
  return _WiFiNetworkIsAPLeaky();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

uint64_t archive_entry_copy_stat()
{
  return _archive_entry_copy_stat();
}

uint64_t archive_entry_free()
{
  return _archive_entry_free();
}

uint64_t archive_entry_new()
{
  return _archive_entry_new();
}

uint64_t archive_entry_set_pathname()
{
  return _archive_entry_set_pathname();
}

uint64_t archive_entry_set_perm()
{
  return _archive_entry_set_perm();
}

uint64_t archive_error_string()
{
  return _archive_error_string();
}

uint64_t archive_write_add_filter_gzip()
{
  return _archive_write_add_filter_gzip();
}

uint64_t archive_write_data()
{
  return _archive_write_data();
}

uint64_t archive_write_free()
{
  return _archive_write_free();
}

uint64_t archive_write_header()
{
  return _archive_write_header();
}

uint64_t archive_write_new()
{
  return _archive_write_new();
}

uint64_t archive_write_open_filename()
{
  return _archive_write_open_filename();
}

uint64_t archive_write_set_format_pax()
{
  return _archive_write_set_format_pax();
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_decode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

size_t compression_decode_scratch_buffer_size(compression_algorithm algorithm)
{
  return _compression_decode_scratch_buffer_size(algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_encode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

size_t compression_encode_scratch_buffer_size(compression_algorithm algorithm)
{
  return _compression_encode_scratch_buffer_size(algorithm);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_apply(size_t iterations, dispatch_queue_t queue, void *block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return _dispatch_block_wait(block, timeout);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
}

dispatch_io_t dispatch_io_create_with_path(dispatch_io_type_t type, const char *path, int oflag, mode_t mode, dispatch_queue_t queue, void *cleanup_handler)
{
  return _dispatch_io_create_with_path(type, path, oflag, mode, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
}

void dispatch_io_set_high_water(dispatch_io_t channel, size_t high_water)
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

void dispatch_release(dispatch_object_t object)
{
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

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return _dispatch_source_testcancel(source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

gid_t getgid(void)
{
  return _getgid();
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return _getnameinfo(a1, a2, a3, a4, a5, a6, a7);
}

uid_t getuid(void)
{
  return _getuid();
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return _if_indextoname(a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

int openpty(int *a1, int *a2, char *a3, termios *a4, winsize *a5)
{
  return _openpty(a1, a2, a3, a4, a5);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_transaction_get_description()
{
  return _os_transaction_get_description();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int pcap_activate(pcap_t *a1)
{
  return _pcap_activate(a1);
}

pcap_t *__cdecl pcap_create(const char *a1, char *a2)
{
  return _pcap_create(a1, a2);
}

int pcap_get_selectable_fd(pcap_t *a1)
{
  return _pcap_get_selectable_fd(a1);
}

int pcap_set_datalink(pcap_t *a1, int a2)
{
  return _pcap_set_datalink(a1, a2);
}

int pcap_set_promisc(pcap_t *a1, int a2)
{
  return _pcap_set_promisc(a1, a2);
}

int pcap_set_rfmon(pcap_t *a1, int a2)
{
  return _pcap_set_rfmon(a1, a2);
}

int pcap_set_snaplen(pcap_t *a1, int a2)
{
  return _pcap_set_snaplen(a1, a2);
}

int pcap_set_timeout(pcap_t *a1, int a2)
{
  return _pcap_set_timeout(a1, a2);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return _sigaction(a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

void syslog(int a1, const char *a2, ...)
{
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

uint64_t xpc_dictionary_expects_reply()
{
  return _xpc_dictionary_expects_reply();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return _xpc_dictionary_send_reply();
}

void xpc_release(xpc_object_t object)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_try_exit_clean()
{
  return _xpc_transaction_try_exit_clean();
}

id objc_msgSend_AWDL(void *a1, const char *a2, ...)
{
  return [a1 AWDL];
}

id objc_msgSend_AWDLAFTxMode(void *a1, const char *a2, ...)
{
  return [a1 AWDLAFTxMode];
}

id objc_msgSend_AWDLAvailabilityWindowAPAlignment(void *a1, const char *a2, ...)
{
  return [a1 AWDLAvailabilityWindowAPAlignment];
}

id objc_msgSend_AWDLContinuousElectionAlgorithmEnabled(void *a1, const char *a2, ...)
{
  return [a1 AWDLContinuousElectionAlgorithmEnabled];
}

id objc_msgSend_AWDLElectionMetric(void *a1, const char *a2, ...)
{
  return [a1 AWDLElectionMetric];
}

id objc_msgSend_AWDLElectionParameters(void *a1, const char *a2, ...)
{
  return [a1 AWDLElectionParameters];
}

id objc_msgSend_AWDLElectionRSSIThresholds(void *a1, const char *a2, ...)
{
  return [a1 AWDLElectionRSSIThresholds];
}

id objc_msgSend_AWDLEncryptionType(void *a1, const char *a2, ...)
{
  return [a1 AWDLEncryptionType];
}

id objc_msgSend_AWDLExtensionStateMachineParameters(void *a1, const char *a2, ...)
{
  return [a1 AWDLExtensionStateMachineParameters];
}

id objc_msgSend_AWDLGuardTime(void *a1, const char *a2, ...)
{
  return [a1 AWDLGuardTime];
}

id objc_msgSend_AWDLMasterChannel(void *a1, const char *a2, ...)
{
  return [a1 AWDLMasterChannel];
}

id objc_msgSend_AWDLOpMode(void *a1, const char *a2, ...)
{
  return [a1 AWDLOpMode];
}

id objc_msgSend_AWDLPeerTrafficRegistration(void *a1, const char *a2, ...)
{
  return [a1 AWDLPeerTrafficRegistration];
}

id objc_msgSend_AWDLPresenceMode(void *a1, const char *a2, ...)
{
  return [a1 AWDLPresenceMode];
}

id objc_msgSend_AWDLSecondaryMasterChannel(void *a1, const char *a2, ...)
{
  return [a1 AWDLSecondaryMasterChannel];
}

id objc_msgSend_AWDLSidecarDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 AWDLSidecarDiagnostics];
}

id objc_msgSend_AWDLSocialTimeSlots(void *a1, const char *a2, ...)
{
  return [a1 AWDLSocialTimeSlots];
}

id objc_msgSend_AWDLStatistics(void *a1, const char *a2, ...)
{
  return [a1 AWDLStatistics];
}

id objc_msgSend_AWDLStrategy(void *a1, const char *a2, ...)
{
  return [a1 AWDLStrategy];
}

id objc_msgSend_AWDLSyncChannelSequence(void *a1, const char *a2, ...)
{
  return [a1 AWDLSyncChannelSequence];
}

id objc_msgSend_AWDLSyncEnabled(void *a1, const char *a2, ...)
{
  return [a1 AWDLSyncEnabled];
}

id objc_msgSend_AWDLSyncParameters(void *a1, const char *a2, ...)
{
  return [a1 AWDLSyncParameters];
}

id objc_msgSend_AWDLSyncState(void *a1, const char *a2, ...)
{
  return [a1 AWDLSyncState];
}

id objc_msgSend_BSSID(void *a1, const char *a2, ...)
{
  return [a1 BSSID];
}

id objc_msgSend_CCA(void *a1, const char *a2, ...)
{
  return [a1 CCA];
}

id objc_msgSend_DNSServerAddresses(void *a1, const char *a2, ...)
{
  return [a1 DNSServerAddresses];
}

id objc_msgSend_DTIMInterval(void *a1, const char *a2, ...)
{
  return [a1 DTIMInterval];
}

id objc_msgSend_EAP8021XClientStatus(void *a1, const char *a2, ...)
{
  return [a1 EAP8021XClientStatus];
}

id objc_msgSend_EAP8021XControlMode(void *a1, const char *a2, ...)
{
  return [a1 EAP8021XControlMode];
}

id objc_msgSend_EAP8021XControlState(void *a1, const char *a2, ...)
{
  return [a1 EAP8021XControlState];
}

id objc_msgSend_EAP8021XSupplicantState(void *a1, const char *a2, ...)
{
  return [a1 EAP8021XSupplicantState];
}

id objc_msgSend_IPv4Addresses(void *a1, const char *a2, ...)
{
  return [a1 IPv4Addresses];
}

id objc_msgSend_IPv4RouterAddress(void *a1, const char *a2, ...)
{
  return [a1 IPv4RouterAddress];
}

id objc_msgSend_IPv6Addresses(void *a1, const char *a2, ...)
{
  return [a1 IPv6Addresses];
}

id objc_msgSend_IPv6RouterAddress(void *a1, const char *a2, ...)
{
  return [a1 IPv6RouterAddress];
}

id objc_msgSend_LQMSummary(void *a1, const char *a2, ...)
{
  return [a1 LQMSummary];
}

id objc_msgSend_MACAddress(void *a1, const char *a2, ...)
{
  return [a1 MACAddress];
}

id objc_msgSend_MCSIndex(void *a1, const char *a2, ...)
{
  return [a1 MCSIndex];
}

id objc_msgSend_PHYMode(void *a1, const char *a2, ...)
{
  return [a1 PHYMode];
}

id objc_msgSend_RSNMulticastCipher(void *a1, const char *a2, ...)
{
  return [a1 RSNMulticastCipher];
}

id objc_msgSend_RSNUnicastCiphers(void *a1, const char *a2, ...)
{
  return [a1 RSNUnicastCiphers];
}

id objc_msgSend_RSSI(void *a1, const char *a2, ...)
{
  return [a1 RSSI];
}

id objc_msgSend_SSID(void *a1, const char *a2, ...)
{
  return [a1 SSID];
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingPathExtension];
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

id objc_msgSend_WAPISubtype(void *a1, const char *a2, ...)
{
  return [a1 WAPISubtype];
}

id objc_msgSend_WEPSubtype(void *a1, const char *a2, ...)
{
  return [a1 WEPSubtype];
}

id objc_msgSend_WPAMulticastCipher(void *a1, const char *a2, ...)
{
  return [a1 WPAMulticastCipher];
}

id objc_msgSend_WPAUnicastCiphers(void *a1, const char *a2, ...)
{
  return [a1 WPAUnicastCiphers];
}

id objc_msgSend__actionHandler(void *a1, const char *a2, ...)
{
  return [a1 _actionHandler];
}

id objc_msgSend__configureCompaionLinkClient(void *a1, const char *a2, ...)
{
  return [a1 _configureCompaionLinkClient];
}

id objc_msgSend__configureDiscoveryClient(void *a1, const char *a2, ...)
{
  return [a1 _configureDiscoveryClient];
}

id objc_msgSend__connectionInfo(void *a1, const char *a2, ...)
{
  return [a1 _connectionInfo];
}

id objc_msgSend__currentVersion(void *a1, const char *a2, ...)
{
  return [a1 _currentVersion];
}

id objc_msgSend__discoveryRequestsContainsRapportRequest(void *a1, const char *a2, ...)
{
  return [a1 _discoveryRequestsContainsRapportRequest];
}

id objc_msgSend__executeTimerBlock(void *a1, const char *a2, ...)
{
  return [a1 _executeTimerBlock];
}

id objc_msgSend__featureAvailabilityDefaults(void *a1, const char *a2, ...)
{
  return [a1 _featureAvailabilityDefaults];
}

id objc_msgSend__getCurrentUsage(void *a1, const char *a2, ...)
{
  return [a1 _getCurrentUsage];
}

id objc_msgSend__getWAAnalyticsAccess(void *a1, const char *a2, ...)
{
  return [a1 _getWAAnalyticsAccess];
}

id objc_msgSend__homeDiagnosticsDomain(void *a1, const char *a2, ...)
{
  return [a1 _homeDiagnosticsDomain];
}

id objc_msgSend__invalidateRapportClient(void *a1, const char *a2, ...)
{
  return [a1 _invalidateRapportClient];
}

id objc_msgSend__peerListeners(void *a1, const char *a2, ...)
{
  return [a1 _peerListeners];
}

id objc_msgSend__scheduleRepeatingCleanupTasks(void *a1, const char *a2, ...)
{
  return [a1 _scheduleRepeatingCleanupTasks];
}

id objc_msgSend__setupRapportClient(void *a1, const char *a2, ...)
{
  return [a1 _setupRapportClient];
}

id objc_msgSend__stop(void *a1, const char *a2, ...)
{
  return [a1 _stop];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activeBFD(void *a1, const char *a2, ...)
{
  return [a1 activeBFD];
}

id objc_msgSend_activeDevices(void *a1, const char *a2, ...)
{
  return [a1 activeDevices];
}

id objc_msgSend_activeDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 activeDiagnostics];
}

id objc_msgSend_activeFileHandle(void *a1, const char *a2, ...)
{
  return [a1 activeFileHandle];
}

id objc_msgSend_activePCap(void *a1, const char *a2, ...)
{
  return [a1 activePCap];
}

id objc_msgSend_activePeers(void *a1, const char *a2, ...)
{
  return [a1 activePeers];
}

id objc_msgSend_activeRequests(void *a1, const char *a2, ...)
{
  return [a1 activeRequests];
}

id objc_msgSend_addedAt(void *a1, const char *a2, ...)
{
  return [a1 addedAt];
}

id objc_msgSend_additionalLog(void *a1, const char *a2, ...)
{
  return [a1 additionalLog];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_airDropDiscoverableMode(void *a1, const char *a2, ...)
{
  return [a1 airDropDiscoverableMode];
}

id objc_msgSend_airPortBaseStationModel(void *a1, const char *a2, ...)
{
  return [a1 airPortBaseStationModel];
}

id objc_msgSend_airPortBaseStationModelName(void *a1, const char *a2, ...)
{
  return [a1 airPortBaseStationModelName];
}

id objc_msgSend_allDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 allDiagnostics];
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

id objc_msgSend_alternateExecutionBlockForCleanExit(void *a1, const char *a2, ...)
{
  return [a1 alternateExecutionBlockForCleanExit];
}

id objc_msgSend_appStore(void *a1, const char *a2, ...)
{
  return [a1 appStore];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_averageRoundtripTime(void *a1, const char *a2, ...)
{
  return [a1 averageRoundtripTime];
}

id objc_msgSend_avg(void *a1, const char *a2, ...)
{
  return [a1 avg];
}

id objc_msgSend_awdl(void *a1, const char *a2, ...)
{
  return [a1 awdl];
}

id objc_msgSend_awdlStatus(void *a1, const char *a2, ...)
{
  return [a1 awdlStatus];
}

id objc_msgSend_awdlStrategy(void *a1, const char *a2, ...)
{
  return [a1 awdlStrategy];
}

id objc_msgSend_awdlSyncEnabled(void *a1, const char *a2, ...)
{
  return [a1 awdlSyncEnabled];
}

id objc_msgSend_band(void *a1, const char *a2, ...)
{
  return [a1 band];
}

id objc_msgSend_batteryWarningLevel(void *a1, const char *a2, ...)
{
  return [a1 batteryWarningLevel];
}

id objc_msgSend_beaconInterval(void *a1, const char *a2, ...)
{
  return [a1 beaconInterval];
}

id objc_msgSend_beginPeerDiscovery(void *a1, const char *a2, ...)
{
  return [a1 beginPeerDiscovery];
}

id objc_msgSend_beginWiFiDefaultRoute(void *a1, const char *a2, ...)
{
  return [a1 beginWiFiDefaultRoute];
}

id objc_msgSend_bluetooth(void *a1, const char *a2, ...)
{
  return [a1 bluetooth];
}

id objc_msgSend_bluetoothStatus(void *a1, const char *a2, ...)
{
  return [a1 bluetoothStatus];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bootArgs(void *a1, const char *a2, ...)
{
  return [a1 bootArgs];
}

id objc_msgSend_browseAllResults(void *a1, const char *a2, ...)
{
  return [a1 browseAllResults];
}

id objc_msgSend_bssid(void *a1, const char *a2, ...)
{
  return [a1 bssid];
}

id objc_msgSend_btcConfig(void *a1, const char *a2, ...)
{
  return [a1 btcConfig];
}

id objc_msgSend_btcMode(void *a1, const char *a2, ...)
{
  return [a1 btcMode];
}

id objc_msgSend_btcProfiles2GHz(void *a1, const char *a2, ...)
{
  return [a1 btcProfiles2GHz];
}

id objc_msgSend_btcProfiles5GHz(void *a1, const char *a2, ...)
{
  return [a1 btcProfiles5GHz];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return [a1 build];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cachedLinkQualityMetric(void *a1, const char *a2, ...)
{
  return [a1 cachedLinkQualityMetric];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return [a1 cancelAllOperations];
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return [a1 capabilities];
}

id objc_msgSend_caps(void *a1, const char *a2, ...)
{
  return [a1 caps];
}

id objc_msgSend_cca(void *a1, const char *a2, ...)
{
  return [a1 cca];
}

id objc_msgSend_chainAck(void *a1, const char *a2, ...)
{
  return [a1 chainAck];
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return [a1 channel];
}

id objc_msgSend_channelWidth(void *a1, const char *a2, ...)
{
  return [a1 channelWidth];
}

id objc_msgSend_channels(void *a1, const char *a2, ...)
{
  return [a1 channels];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return [a1 command];
}

id objc_msgSend_companionLinkDevice(void *a1, const char *a2, ...)
{
  return [a1 companionLinkDevice];
}

id objc_msgSend_completedAt(void *a1, const char *a2, ...)
{
  return [a1 completedAt];
}

id objc_msgSend_concurrentQueue(void *a1, const char *a2, ...)
{
  return [a1 concurrentQueue];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configureDiscoveryClientAndActivate(void *a1, const char *a2, ...)
{
  return [a1 configureDiscoveryClientAndActivate];
}

id objc_msgSend_connectable(void *a1, const char *a2, ...)
{
  return [a1 connectable];
}

id objc_msgSend_connectedDevices(void *a1, const char *a2, ...)
{
  return [a1 connectedDevices];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_controlFlags(void *a1, const char *a2, ...)
{
  return [a1 controlFlags];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_corewifi(void *a1, const char *a2, ...)
{
  return [a1 corewifi];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentKnownNetworkProfile(void *a1, const char *a2, ...)
{
  return [a1 currentKnownNetworkProfile];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentNetwork(void *a1, const char *a2, ...)
{
  return [a1 currentNetwork];
}

id objc_msgSend_currentPeer(void *a1, const char *a2, ...)
{
  return [a1 currentPeer];
}

id objc_msgSend_currentPreferredNetwork(void *a1, const char *a2, ...)
{
  return [a1 currentPreferredNetwork];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentScanResult(void *a1, const char *a2, ...)
{
  return [a1 currentScanResult];
}

id objc_msgSend_currentVersion(void *a1, const char *a2, ...)
{
  return [a1 currentVersion];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_debugManager(void *a1, const char *a2, ...)
{
  return [a1 debugManager];
}

id objc_msgSend_debugTimer(void *a1, const char *a2, ...)
{
  return [a1 debugTimer];
}

id objc_msgSend_debugTimerEnabled(void *a1, const char *a2, ...)
{
  return [a1 debugTimerEnabled];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultConfiguration];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return [a1 defaultSound];
}

id objc_msgSend_defaultTimeZone(void *a1, const char *a2, ...)
{
  return [a1 defaultTimeZone];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_desense(void *a1, const char *a2, ...)
{
  return [a1 desense];
}

id objc_msgSend_desenseLevel(void *a1, const char *a2, ...)
{
  return [a1 desenseLevel];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceScanningInProgress(void *a1, const char *a2, ...)
{
  return [a1 deviceScanningInProgress];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_diagnostics(void *a1, const char *a2, ...)
{
  return [a1 diagnostics];
}

id objc_msgSend_diagnosticsHistory(void *a1, const char *a2, ...)
{
  return [a1 diagnosticsHistory];
}

id objc_msgSend_diagnosticsMode(void *a1, const char *a2, ...)
{
  return [a1 diagnosticsMode];
}

id objc_msgSend_diagnosticsModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 diagnosticsModeEnabled];
}

id objc_msgSend_diagnosticsModeManager(void *a1, const char *a2, ...)
{
  return [a1 diagnosticsModeManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didPass(void *a1, const char *a2, ...)
{
  return [a1 didPass];
}

id objc_msgSend_disassociate(void *a1, const char *a2, ...)
{
  return [a1 disassociate];
}

id objc_msgSend_discoveryClient(void *a1, const char *a2, ...)
{
  return [a1 discoveryClient];
}

id objc_msgSend_discoveryFlags(void *a1, const char *a2, ...)
{
  return [a1 discoveryFlags];
}

id objc_msgSend_discoveryRequests(void *a1, const char *a2, ...)
{
  return [a1 discoveryRequests];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_dnsAddresses(void *a1, const char *a2, ...)
{
  return [a1 dnsAddresses];
}

id objc_msgSend_domainName(void *a1, const char *a2, ...)
{
  return [a1 domainName];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_eapol(void *a1, const char *a2, ...)
{
  return [a1 eapol];
}

id objc_msgSend_eapolControlMode(void *a1, const char *a2, ...)
{
  return [a1 eapolControlMode];
}

id objc_msgSend_eapolSupplicantState(void *a1, const char *a2, ...)
{
  return [a1 eapolSupplicantState];
}

id objc_msgSend_effectiveEnabledLevel(void *a1, const char *a2, ...)
{
  return [a1 effectiveEnabledLevel];
}

id objc_msgSend_effectiveGroupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveGroupIdentifier];
}

id objc_msgSend_effectivePersistedLevel(void *a1, const char *a2, ...)
{
  return [a1 effectivePersistedLevel];
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserIdentifier];
}

id objc_msgSend_encode(void *a1, const char *a2, ...)
{
  return [a1 encode];
}

id objc_msgSend_endWiFiDefaultRoute(void *a1, const char *a2, ...)
{
  return [a1 endWiFiDefaultRoute];
}

id objc_msgSend_endedAt(void *a1, const char *a2, ...)
{
  return [a1 endedAt];
}

id objc_msgSend_entitiesByName(void *a1, const char *a2, ...)
{
  return [a1 entitiesByName];
}

id objc_msgSend_entityName(void *a1, const char *a2, ...)
{
  return [a1 entityName];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorStr(void *a1, const char *a2, ...)
{
  return [a1 errorStr];
}

id objc_msgSend_estimatedTimeRemaining(void *a1, const char *a2, ...)
{
  return [a1 estimatedTimeRemaining];
}

id objc_msgSend_eventHistory(void *a1, const char *a2, ...)
{
  return [a1 eventHistory];
}

id objc_msgSend_eventID(void *a1, const char *a2, ...)
{
  return [a1 eventID];
}

id objc_msgSend_eventIDs(void *a1, const char *a2, ...)
{
  return [a1 eventIDs];
}

id objc_msgSend_fastestSupportedPHYMode(void *a1, const char *a2, ...)
{
  return [a1 fastestSupportedPHYMode];
}

id objc_msgSend_faultEventCache(void *a1, const char *a2, ...)
{
  return [a1 faultEventCache];
}

id objc_msgSend_faultEventHandler(void *a1, const char *a2, ...)
{
  return [a1 faultEventHandler];
}

id objc_msgSend_faultEventMonitoringPeers(void *a1, const char *a2, ...)
{
  return [a1 faultEventMonitoringPeers];
}

id objc_msgSend_fetchLastHourFaults(void *a1, const char *a2, ...)
{
  return [a1 fetchLastHourFaults];
}

id objc_msgSend_fetchLastHourLinkTests(void *a1, const char *a2, ...)
{
  return [a1 fetchLastHourLinkTests];
}

id objc_msgSend_fetchLastHourRecoveries(void *a1, const char *a2, ...)
{
  return [a1 fetchLastHourRecoveries];
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return [a1 fetchRequest];
}

id objc_msgSend_fetchedResults(void *a1, const char *a2, ...)
{
  return [a1 fetchedResults];
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return [a1 fileCreationDate];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileModificationDate(void *a1, const char *a2, ...)
{
  return [a1 fileModificationDate];
}

id objc_msgSend_filePaths(void *a1, const char *a2, ...)
{
  return [a1 filePaths];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return [a1 fileType];
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return [a1 filename];
}

id objc_msgSend_files(void *a1, const char *a2, ...)
{
  return [a1 files];
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return [a1 finish];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return [a1 flags];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_gatherPeerDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 gatherPeerDiagnostics];
}

id objc_msgSend_gatherPeerTypes(void *a1, const char *a2, ...)
{
  return [a1 gatherPeerTypes];
}

id objc_msgSend_getBufferFromPool(void *a1, const char *a2, ...)
{
  return [a1 getBufferFromPool];
}

id objc_msgSend_getDPSSummary(void *a1, const char *a2, ...)
{
  return [a1 getDPSSummary];
}

id objc_msgSend_getLQMSummary(void *a1, const char *a2, ...)
{
  return [a1 getLQMSummary];
}

id objc_msgSend_getPairOfBuffersFromPool(void *a1, const char *a2, ...)
{
  return [a1 getPairOfBuffersFromPool];
}

id objc_msgSend_getWiFiStatus(void *a1, const char *a2, ...)
{
  return [a1 getWiFiStatus];
}

id objc_msgSend_gid(void *a1, const char *a2, ...)
{
  return [a1 gid];
}

id objc_msgSend_globalDNSServerAddresses(void *a1, const char *a2, ...)
{
  return [a1 globalDNSServerAddresses];
}

id objc_msgSend_globalIPv4Addresses(void *a1, const char *a2, ...)
{
  return [a1 globalIPv4Addresses];
}

id objc_msgSend_globalIPv4InterfaceName(void *a1, const char *a2, ...)
{
  return [a1 globalIPv4InterfaceName];
}

id objc_msgSend_globalIPv4NetworkServiceID(void *a1, const char *a2, ...)
{
  return [a1 globalIPv4NetworkServiceID];
}

id objc_msgSend_globalIPv4NetworkServiceName(void *a1, const char *a2, ...)
{
  return [a1 globalIPv4NetworkServiceName];
}

id objc_msgSend_globalIPv4RouterAddress(void *a1, const char *a2, ...)
{
  return [a1 globalIPv4RouterAddress];
}

id objc_msgSend_globalIPv6Addresses(void *a1, const char *a2, ...)
{
  return [a1 globalIPv6Addresses];
}

id objc_msgSend_globalIPv6InterfaceName(void *a1, const char *a2, ...)
{
  return [a1 globalIPv6InterfaceName];
}

id objc_msgSend_globalIPv6NetworkServiceID(void *a1, const char *a2, ...)
{
  return [a1 globalIPv6NetworkServiceID];
}

id objc_msgSend_globalIPv6NetworkServiceName(void *a1, const char *a2, ...)
{
  return [a1 globalIPv6NetworkServiceName];
}

id objc_msgSend_globalIPv6RouterAddress(void *a1, const char *a2, ...)
{
  return [a1 globalIPv6RouterAddress];
}

id objc_msgSend_guardInterval(void *a1, const char *a2, ...)
{
  return [a1 guardInterval];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_hardwareMACAddress(void *a1, const char *a2, ...)
{
  return [a1 hardwareMACAddress];
}

id objc_msgSend_hasDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 hasDirectoryPath];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hiddenState(void *a1, const char *a2, ...)
{
  return [a1 hiddenState];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 idsDeviceIdentifier];
}

id objc_msgSend_includeEvents(void *a1, const char *a2, ...)
{
  return [a1 includeEvents];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_installedProfileIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 installedProfileIdentifiers];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return [a1 interfaceName];
}

id objc_msgSend_interfaceNames(void *a1, const char *a2, ...)
{
  return [a1 interfaceNames];
}

id objc_msgSend_internalBatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 internalBatteryLevel];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_invalidateDiscoveryClient(void *a1, const char *a2, ...)
{
  return [a1 invalidateDiscoveryClient];
}

id objc_msgSend_ipv4Addresses(void *a1, const char *a2, ...)
{
  return [a1 ipv4Addresses];
}

id objc_msgSend_ipv4ConfigMethod(void *a1, const char *a2, ...)
{
  return [a1 ipv4ConfigMethod];
}

id objc_msgSend_ipv4RouterAddress(void *a1, const char *a2, ...)
{
  return [a1 ipv4RouterAddress];
}

id objc_msgSend_ipv6Addresses(void *a1, const char *a2, ...)
{
  return [a1 ipv6Addresses];
}

id objc_msgSend_ipv6ConfigMethod(void *a1, const char *a2, ...)
{
  return [a1 ipv6ConfigMethod];
}

id objc_msgSend_ipv6RouterAddress(void *a1, const char *a2, ...)
{
  return [a1 ipv6RouterAddress];
}

id objc_msgSend_is2GHz(void *a1, const char *a2, ...)
{
  return [a1 is2GHz];
}

id objc_msgSend_is5GHz(void *a1, const char *a2, ...)
{
  return [a1 is5GHz];
}

id objc_msgSend_is6GHz(void *a1, const char *a2, ...)
{
  return [a1 is6GHz];
}

id objc_msgSend_is6GHzPSC(void *a1, const char *a2, ...)
{
  return [a1 is6GHzPSC];
}

id objc_msgSend_isAWDLRealTimeMode(void *a1, const char *a2, ...)
{
  return [a1 isAWDLRealTimeMode];
}

id objc_msgSend_isAppleDevice(void *a1, const char *a2, ...)
{
  return [a1 isAppleDevice];
}

id objc_msgSend_isAppleReachable(void *a1, const char *a2, ...)
{
  return [a1 isAppleReachable];
}

id objc_msgSend_isAppleSWAP(void *a1, const char *a2, ...)
{
  return [a1 isAppleSWAP];
}

id objc_msgSend_isAutoJoinDisabled(void *a1, const char *a2, ...)
{
  return [a1 isAutoJoinDisabled];
}

id objc_msgSend_isAvailable(void *a1, const char *a2, ...)
{
  return [a1 isAvailable];
}

id objc_msgSend_isCaptive(void *a1, const char *a2, ...)
{
  return [a1 isCaptive];
}

id objc_msgSend_isCloudPaired(void *a1, const char *a2, ...)
{
  return [a1 isCloudPaired];
}

id objc_msgSend_isConnectable(void *a1, const char *a2, ...)
{
  return [a1 isConnectable];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isDFS(void *a1, const char *a2, ...)
{
  return [a1 isDFS];
}

id objc_msgSend_isDiscoverable(void *a1, const char *a2, ...)
{
  return [a1 isDiscoverable];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isIBSS(void *a1, const char *a2, ...)
{
  return [a1 isIBSS];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isInvoluntaryLinkDown(void *a1, const char *a2, ...)
{
  return [a1 isInvoluntaryLinkDown];
}

id objc_msgSend_isLinkDown(void *a1, const char *a2, ...)
{
  return [a1 isLinkDown];
}

id objc_msgSend_isLowEnergy(void *a1, const char *a2, ...)
{
  return [a1 isLowEnergy];
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return [a1 isPaired];
}

id objc_msgSend_isPasspoint(void *a1, const char *a2, ...)
{
  return [a1 isPasspoint];
}

id objc_msgSend_isPersonalHotspot(void *a1, const char *a2, ...)
{
  return [a1 isPersonalHotspot];
}

id objc_msgSend_isScanning(void *a1, const char *a2, ...)
{
  return [a1 isScanning];
}

id objc_msgSend_isUsingCustomDNSSettings(void *a1, const char *a2, ...)
{
  return [a1 isUsingCustomDNSSettings];
}

id objc_msgSend_isUsingCustomProxySetting(void *a1, const char *a2, ...)
{
  return [a1 isUsingCustomProxySetting];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isWEP(void *a1, const char *a2, ...)
{
  return [a1 isWEP];
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return [a1 itemID];
}

id objc_msgSend_itemRequests(void *a1, const char *a2, ...)
{
  return [a1 itemRequests];
}

id objc_msgSend_itemURL(void *a1, const char *a2, ...)
{
  return [a1 itemURL];
}

id objc_msgSend_lastAssociatedSSIDString(void *a1, const char *a2, ...)
{
  return [a1 lastAssociatedSSIDString];
}

id objc_msgSend_lastHrFaults(void *a1, const char *a2, ...)
{
  return [a1 lastHrFaults];
}

id objc_msgSend_lastHrLinkTests(void *a1, const char *a2, ...)
{
  return [a1 lastHrLinkTests];
}

id objc_msgSend_lastHrRecoveries(void *a1, const char *a2, ...)
{
  return [a1 lastHrRecoveries];
}

id objc_msgSend_lastJoinedAt(void *a1, const char *a2, ...)
{
  return [a1 lastJoinedAt];
}

id objc_msgSend_lastNotificationTimestamp(void *a1, const char *a2, ...)
{
  return [a1 lastNotificationTimestamp];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_launch(void *a1, const char *a2, ...)
{
  return [a1 launch];
}

id objc_msgSend_leakyAPStats(void *a1, const char *a2, ...)
{
  return [a1 leakyAPStats];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_linkQualityMetricData(void *a1, const char *a2, ...)
{
  return [a1 linkQualityMetricData];
}

id objc_msgSend_linkQualityUpdates(void *a1, const char *a2, ...)
{
  return [a1 linkQualityUpdates];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_listeners(void *a1, const char *a2, ...)
{
  return [a1 listeners];
}

id objc_msgSend_localAddress(void *a1, const char *a2, ...)
{
  return [a1 localAddress];
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return [a1 localDevice];
}

id objc_msgSend_localDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 localDiagnostics];
}

id objc_msgSend_localDiagnosticsStore(void *a1, const char *a2, ...)
{
  return [a1 localDiagnosticsStore];
}

id objc_msgSend_localIDSIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localIDSIdentifier];
}

id objc_msgSend_localPeer(void *a1, const char *a2, ...)
{
  return [a1 localPeer];
}

id objc_msgSend_localStore(void *a1, const char *a2, ...)
{
  return [a1 localStore];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lockBufferPool(void *a1, const char *a2, ...)
{
  return [a1 lockBufferPool];
}

id objc_msgSend_logManager(void *a1, const char *a2, ...)
{
  return [a1 logManager];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_macAddress(void *a1, const char *a2, ...)
{
  return [a1 macAddress];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainObjectContext(void *a1, const char *a2, ...)
{
  return [a1 mainObjectContext];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_majorClass(void *a1, const char *a2, ...)
{
  return [a1 majorClass];
}

id objc_msgSend_managedObjectModel(void *a1, const char *a2, ...)
{
  return [a1 managedObjectModel];
}

id objc_msgSend_max(void *a1, const char *a2, ...)
{
  return [a1 max];
}

id objc_msgSend_maxFiles(void *a1, const char *a2, ...)
{
  return [a1 maxFiles];
}

id objc_msgSend_maxRoundtripTime(void *a1, const char *a2, ...)
{
  return [a1 maxRoundtripTime];
}

id objc_msgSend_maxSize(void *a1, const char *a2, ...)
{
  return [a1 maxSize];
}

id objc_msgSend_mcsIndex(void *a1, const char *a2, ...)
{
  return [a1 mcsIndex];
}

id objc_msgSend_megaWiFiProfile(void *a1, const char *a2, ...)
{
  return [a1 megaWiFiProfile];
}

id objc_msgSend_min(void *a1, const char *a2, ...)
{
  return [a1 min];
}

id objc_msgSend_minRoundtripTime(void *a1, const char *a2, ...)
{
  return [a1 minRoundtripTime];
}

id objc_msgSend_minorClass(void *a1, const char *a2, ...)
{
  return [a1 minorClass];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_monitorMode(void *a1, const char *a2, ...)
{
  return [a1 monitorMode];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nan(void *a1, const char *a2, ...)
{
  return [a1 nan];
}

id objc_msgSend_netUsageManager(void *a1, const char *a2, ...)
{
  return [a1 netUsageManager];
}

id objc_msgSend_network(void *a1, const char *a2, ...)
{
  return [a1 network];
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return [a1 networkName];
}

id objc_msgSend_networkServiceID(void *a1, const char *a2, ...)
{
  return [a1 networkServiceID];
}

id objc_msgSend_networkStatus(void *a1, const char *a2, ...)
{
  return [a1 networkStatus];
}

id objc_msgSend_noAutoStop(void *a1, const char *a2, ...)
{
  return [a1 noAutoStop];
}

id objc_msgSend_noLoggingWiFiProfile(void *a1, const char *a2, ...)
{
  return [a1 noLoggingWiFiProfile];
}

id objc_msgSend_noise(void *a1, const char *a2, ...)
{
  return [a1 noise];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numPingsTransmitted(void *a1, const char *a2, ...)
{
  return [a1 numPingsTransmitted];
}

id objc_msgSend_numberOfSpacialStreams(void *a1, const char *a2, ...)
{
  return [a1 numberOfSpacialStreams];
}

id objc_msgSend_numberOfSpatialStreams(void *a1, const char *a2, ...)
{
  return [a1 numberOfSpatialStreams];
}

id objc_msgSend_offsetInFile(void *a1, const char *a2, ...)
{
  return [a1 offsetInFile];
}

id objc_msgSend_opMode(void *a1, const char *a2, ...)
{
  return [a1 opMode];
}

id objc_msgSend_operatingSystemVersion(void *a1, const char *a2, ...)
{
  return [a1 operatingSystemVersion];
}

id objc_msgSend_operationErrors(void *a1, const char *a2, ...)
{
  return [a1 operationErrors];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_os(void *a1, const char *a2, ...)
{
  return [a1 os];
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return [a1 output];
}

id objc_msgSend_outputFile(void *a1, const char *a2, ...)
{
  return [a1 outputFile];
}

id objc_msgSend_packetLoss(void *a1, const char *a2, ...)
{
  return [a1 packetLoss];
}

id objc_msgSend_packetLossRate(void *a1, const char *a2, ...)
{
  return [a1 packetLossRate];
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return [a1 pairedDevices];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pauseMonitoring(void *a1, const char *a2, ...)
{
  return [a1 pauseMonitoring];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return [a1 peer];
}

id objc_msgSend_peerID(void *a1, const char *a2, ...)
{
  return [a1 peerID];
}

id objc_msgSend_peerManager(void *a1, const char *a2, ...)
{
  return [a1 peerManager];
}

id objc_msgSend_peerPublicKey(void *a1, const char *a2, ...)
{
  return [a1 peerPublicKey];
}

id objc_msgSend_peerStatus(void *a1, const char *a2, ...)
{
  return [a1 peerStatus];
}

id objc_msgSend_peers(void *a1, const char *a2, ...)
{
  return [a1 peers];
}

id objc_msgSend_persistentStoreCoordinator(void *a1, const char *a2, ...)
{
  return [a1 persistentStoreCoordinator];
}

id objc_msgSend_phyMode(void *a1, const char *a2, ...)
{
  return [a1 phyMode];
}

id objc_msgSend_pm(void *a1, const char *a2, ...)
{
  return [a1 pm];
}

id objc_msgSend_power(void *a1, const char *a2, ...)
{
  return [a1 power];
}

id objc_msgSend_powerOn(void *a1, const char *a2, ...)
{
  return [a1 powerOn];
}

id objc_msgSend_powerSourceType(void *a1, const char *a2, ...)
{
  return [a1 powerSourceType];
}

id objc_msgSend_powerState(void *a1, const char *a2, ...)
{
  return [a1 powerState];
}

id objc_msgSend_preferredNetworksList(void *a1, const char *a2, ...)
{
  return [a1 preferredNetworksList];
}

id objc_msgSend_primaryDNSAddresses(void *a1, const char *a2, ...)
{
  return [a1 primaryDNSAddresses];
}

id objc_msgSend_primaryIPv4Addresses(void *a1, const char *a2, ...)
{
  return [a1 primaryIPv4Addresses];
}

id objc_msgSend_primaryIPv4InterfaceName(void *a1, const char *a2, ...)
{
  return [a1 primaryIPv4InterfaceName];
}

id objc_msgSend_primaryIPv4Router(void *a1, const char *a2, ...)
{
  return [a1 primaryIPv4Router];
}

id objc_msgSend_primaryIPv4ServiceID(void *a1, const char *a2, ...)
{
  return [a1 primaryIPv4ServiceID];
}

id objc_msgSend_primaryIPv4ServiceName(void *a1, const char *a2, ...)
{
  return [a1 primaryIPv4ServiceName];
}

id objc_msgSend_primaryIPv6Addresses(void *a1, const char *a2, ...)
{
  return [a1 primaryIPv6Addresses];
}

id objc_msgSend_primaryIPv6InterfaceName(void *a1, const char *a2, ...)
{
  return [a1 primaryIPv6InterfaceName];
}

id objc_msgSend_primaryIPv6Router(void *a1, const char *a2, ...)
{
  return [a1 primaryIPv6Router];
}

id objc_msgSend_primaryIPv6ServiceID(void *a1, const char *a2, ...)
{
  return [a1 primaryIPv6ServiceID];
}

id objc_msgSend_primaryIPv6ServiceName(void *a1, const char *a2, ...)
{
  return [a1 primaryIPv6ServiceName];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_processors(void *a1, const char *a2, ...)
{
  return [a1 processors];
}

id objc_msgSend_publicKey(void *a1, const char *a2, ...)
{
  return [a1 publicKey];
}

id objc_msgSend_publicKeySelf(void *a1, const char *a2, ...)
{
  return [a1 publicKeySelf];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_rapportClient(void *a1, const char *a2, ...)
{
  return [a1 rapportClient];
}

id objc_msgSend_reachabilityFlags(void *a1, const char *a2, ...)
{
  return [a1 reachabilityFlags];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_registerRequestHandler(void *a1, const char *a2, ...)
{
  return [a1 registerRequestHandler];
}

id objc_msgSend_registeredPeers(void *a1, const char *a2, ...)
{
  return [a1 registeredPeers];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_remotePath(void *a1, const char *a2, ...)
{
  return [a1 remotePath];
}

id objc_msgSend_removeAllDeliveredNotifications(void *a1, const char *a2, ...)
{
  return [a1 removeAllDeliveredNotifications];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllPendingNotificationRequests(void *a1, const char *a2, ...)
{
  return [a1 removeAllPendingNotificationRequests];
}

id objc_msgSend_reply(void *a1, const char *a2, ...)
{
  return [a1 reply];
}

id objc_msgSend_requestHandler(void *a1, const char *a2, ...)
{
  return [a1 requestHandler];
}

id objc_msgSend_requestInfo(void *a1, const char *a2, ...)
{
  return [a1 requestInfo];
}

id objc_msgSend_requestPayload(void *a1, const char *a2, ...)
{
  return [a1 requestPayload];
}

id objc_msgSend_requestPayloadClass(void *a1, const char *a2, ...)
{
  return [a1 requestPayloadClass];
}

id objc_msgSend_requestType(void *a1, const char *a2, ...)
{
  return [a1 requestType];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetNetworkServiceOrderForTeardown(void *a1, const char *a2, ...)
{
  return [a1 resetNetworkServiceOrderForTeardown];
}

id objc_msgSend_responseHandler(void *a1, const char *a2, ...)
{
  return [a1 responseHandler];
}

id objc_msgSend_responsePayloadClass(void *a1, const char *a2, ...)
{
  return [a1 responsePayloadClass];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retrievePairedPeers(void *a1, const char *a2, ...)
{
  return [a1 retrievePairedPeers];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_rotationInterval(void *a1, const char *a2, ...)
{
  return [a1 rotationInterval];
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return [a1 rssi];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_rxRate(void *a1, const char *a2, ...)
{
  return [a1 rxRate];
}

id objc_msgSend_scanRecord(void *a1, const char *a2, ...)
{
  return [a1 scanRecord];
}

id objc_msgSend_security(void *a1, const char *a2, ...)
{
  return [a1 security];
}

id objc_msgSend_securityType(void *a1, const char *a2, ...)
{
  return [a1 securityType];
}

id objc_msgSend_seekToEndOfFile(void *a1, const char *a2, ...)
{
  return [a1 seekToEndOfFile];
}

id objc_msgSend_selfPublicKey(void *a1, const char *a2, ...)
{
  return [a1 selfPublicKey];
}

id objc_msgSend_semaphore(void *a1, const char *a2, ...)
{
  return [a1 semaphore];
}

id objc_msgSend_serviceRef(void *a1, const char *a2, ...)
{
  return [a1 serviceRef];
}

id objc_msgSend_serviceTypes(void *a1, const char *a2, ...)
{
  return [a1 serviceTypes];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return [a1 setTaskCompleted];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return [a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_sharedActivityManager(void *a1, const char *a2, ...)
{
  return [a1 sharedActivityManager];
}

id objc_msgSend_sharedAnalyticsProcessor(void *a1, const char *a2, ...)
{
  return [a1 sharedAnalyticsProcessor];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedDeviceAnalyticsClientWithPersist(void *a1, const char *a2, ...)
{
  return [a1 sharedDeviceAnalyticsClientWithPersist];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedObject(void *a1, const char *a2, ...)
{
  return [a1 sharedObject];
}

id objc_msgSend_sharedPairingAgent(void *a1, const char *a2, ...)
{
  return [a1 sharedPairingAgent];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_sharedStore(void *a1, const char *a2, ...)
{
  return [a1 sharedStore];
}

id objc_msgSend_sharedW5BufferPool(void *a1, const char *a2, ...)
{
  return [a1 sharedW5BufferPool];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return [a1 shutdown];
}

id objc_msgSend_smartCCADesenseSupported(void *a1, const char *a2, ...)
{
  return [a1 smartCCADesenseSupported];
}

id objc_msgSend_smartCCADesenseUSBPresence(void *a1, const char *a2, ...)
{
  return [a1 smartCCADesenseUSBPresence];
}

id objc_msgSend_snaplen(void *a1, const char *a2, ...)
{
  return [a1 snaplen];
}

id objc_msgSend_snifferDescription(void *a1, const char *a2, ...)
{
  return [a1 snifferDescription];
}

id objc_msgSend_snifferManager(void *a1, const char *a2, ...)
{
  return [a1 snifferManager];
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return [a1 speed];
}

id objc_msgSend_ssid(void *a1, const char *a2, ...)
{
  return [a1 ssid];
}

id objc_msgSend_ssidString(void *a1, const char *a2, ...)
{
  return [a1 ssidString];
}

id objc_msgSend_standardDeviationRoundtripTime(void *a1, const char *a2, ...)
{
  return [a1 standardDeviationRoundtripTime];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startBrowsing(void *a1, const char *a2, ...)
{
  return [a1 startBrowsing];
}

id objc_msgSend_startDiscoveringDevices(void *a1, const char *a2, ...)
{
  return [a1 startDiscoveringDevices];
}

id objc_msgSend_startEventMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startEventMonitoring];
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startMonitoring];
}

id objc_msgSend_startedAt(void *a1, const char *a2, ...)
{
  return [a1 startedAt];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusFlags(void *a1, const char *a2, ...)
{
  return [a1 statusFlags];
}

id objc_msgSend_statusManager(void *a1, const char *a2, ...)
{
  return [a1 statusManager];
}

id objc_msgSend_stbc(void *a1, const char *a2, ...)
{
  return [a1 stbc];
}

id objc_msgSend_stddev(void *a1, const char *a2, ...)
{
  return [a1 stddev];
}

id objc_msgSend_stopAllRepeatingTasks(void *a1, const char *a2, ...)
{
  return [a1 stopAllRepeatingTasks];
}

id objc_msgSend_stopBrowsing(void *a1, const char *a2, ...)
{
  return [a1 stopBrowsing];
}

id objc_msgSend_stopDiscoveryingDevices(void *a1, const char *a2, ...)
{
  return [a1 stopDiscoveryingDevices];
}

id objc_msgSend_stopEventMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopEventMonitoring];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoring];
}

id objc_msgSend_stopMonitoringAllEvents(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringAllEvents];
}

id objc_msgSend_stopNotificationUUID(void *a1, const char *a2, ...)
{
  return [a1 stopNotificationUUID];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_strongestSupportedSecurity(void *a1, const char *a2, ...)
{
  return [a1 strongestSupportedSecurity];
}

id objc_msgSend_subreason(void *a1, const char *a2, ...)
{
  return [a1 subreason];
}

id objc_msgSend_supportedChannels(void *a1, const char *a2, ...)
{
  return [a1 supportedChannels];
}

id objc_msgSend_supportedPHYModes(void *a1, const char *a2, ...)
{
  return [a1 supportedPHYModes];
}

id objc_msgSend_supportedSecurityTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedSecurityTypes];
}

id objc_msgSend_supportsTKIPCipher(void *a1, const char *a2, ...)
{
  return [a1 supportsTKIPCipher];
}

id objc_msgSend_supportsWEPCipher(void *a1, const char *a2, ...)
{
  return [a1 supportsWEPCipher];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_targetID(void *a1, const char *a2, ...)
{
  return [a1 targetID];
}

id objc_msgSend_tcpDump(void *a1, const char *a2, ...)
{
  return [a1 tcpDump];
}

id objc_msgSend_terminationStatus(void *a1, const char *a2, ...)
{
  return [a1 terminationStatus];
}

id objc_msgSend_testCompleted(void *a1, const char *a2, ...)
{
  return [a1 testCompleted];
}

id objc_msgSend_testID(void *a1, const char *a2, ...)
{
  return [a1 testID];
}

id objc_msgSend_testRequests(void *a1, const char *a2, ...)
{
  return [a1 testRequests];
}

id objc_msgSend_testStarted(void *a1, const char *a2, ...)
{
  return [a1 testStarted];
}

id objc_msgSend_tests(void *a1, const char *a2, ...)
{
  return [a1 tests];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimer];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_txChainPower(void *a1, const char *a2, ...)
{
  return [a1 txChainPower];
}

id objc_msgSend_txRate(void *a1, const char *a2, ...)
{
  return [a1 txRate];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return [a1 uid];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updatedAt(void *a1, const char *a2, ...)
{
  return [a1 updatedAt];
}

id objc_msgSend_updatedWiFiCallback(void *a1, const char *a2, ...)
{
  return [a1 updatedWiFiCallback];
}

id objc_msgSend_usageData(void *a1, const char *a2, ...)
{
  return [a1 usageData];
}

id objc_msgSend_userAutoJoinDisabled(void *a1, const char *a2, ...)
{
  return [a1 userAutoJoinDisabled];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_utf8ValueSafe(void *a1, const char *a2, ...)
{
  return [a1 utf8ValueSafe];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_virtualInterfaceNames(void *a1, const char *a2, ...)
{
  return [a1 virtualInterfaceNames];
}

id objc_msgSend_waDeviceAnalyticsClientExists(void *a1, const char *a2, ...)
{
  return [a1 waDeviceAnalyticsClientExists];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_wifi(void *a1, const char *a2, ...)
{
  return [a1 wifi];
}

id objc_msgSend_wifiStatus(void *a1, const char *a2, ...)
{
  return [a1 wifiStatus];
}

id objc_msgSend_xpcConnection_unregisterRemoteDiagnosticEventsForPeer_configuration_reply_(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection:x0 unregisterRemoteDiagnosticEventsForPeer:x1 configuration:x2 reply:x3];
}