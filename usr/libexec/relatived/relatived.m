void sub_100002258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002284(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 eventMask] != (id)1)
  {
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_100024820);
    }
    v4 = (void *)qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEBUG))
    {
      v5 = v4;
      int v7 = 134349056;
      id v8 = [v3 eventMask];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[RMUserInteractionMonitorAttentionAwareness] event: %{public}llu", (uint8_t *)&v7, 0xCu);
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained sendUserInteractionUpdate];
  }
}

void sub_10000258C(id a1)
{
  qword_10002C540 = (uint64_t)os_log_create("com.apple.RelativeMotion", "TempestDataProducer");

  _objc_release_x1();
}

void sub_1000025DC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

void sub_1000025EC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

void sub_1000025FC(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

void sub_10000260C(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

void sub_10000261C(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 48), a2);
  }
}

void sub_1000026E8(id a1)
{
  qword_10002C978 = objc_alloc_init(RMAudioListenerPoseEngine);

  _objc_release_x1();
}

void sub_100002BC0(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

void sub_100002BD0(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

void sub_100002BE0(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

void sub_100002BF0(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

void sub_100002C00(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 88), a2);
  }
}

uint64_t sub_100002D8C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002D9C(uint64_t a1)
{
}

void sub_100002DA4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = *(id *)(v2 + 32);
    if (v3)
    {
      ++v3[12];
    }
  }
  v4 = [*(id *)(a1 + 40) objectForKeyedSubscript:kCMMediaSessionClientMode];
  v5 = [*(id *)(a1 + 40) objectForKeyedSubscript:kCMMediaSessionPredictionIntervalMicroseconds];
  v6 = objc_opt_new();
  id v8 = v6;
  if (v6) {
    objc_setProperty_nonatomic_copy(v6, v7, *(id *)(a1 + 56), 8);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v9 = (int)[v4 intValue];
  }
  else {
    uint64_t v9 = 0;
  }
  if (v8) {
    v8[3] = v9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v10 = (uint64_t)[v5 unsignedLongLongValue];
  }
  else {
    uint64_t v10 = -1;
  }
  if (v8) {
    v8[2] = v10;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    v12 = *(void **)(v11 + 56);
  }
  else {
    v12 = 0;
  }
  v13 = [v12 objectForKey:@"TempestClientModeOverride"];

  if (v13)
  {
    uint64_t v14 = *(void *)(a1 + 32);
    v15 = v14 ? *(void **)(v14 + 56) : 0;
    unint64_t v16 = (unint64_t)[v15 integerForKey:@"TempestClientModeOverride"];
    if ((v16 & 0x8000000000000000) == 0)
    {
      unint64_t v17 = v16;
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_1000249F0);
      }
      v18 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
      {
        if (v8) {
          int v19 = *((_DWORD *)v8 + 6);
        }
        else {
          int v19 = 0;
        }
        v25[0] = 67240448;
        v25[1] = v19;
        __int16 v26 = 1026;
        int v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Overriding requested client mode %{public}d with %{public}d", (uint8_t *)v25, 0xEu);
      }
      if (v8) {
        v8[3] = v17;
      }
    }
  }
  uint64_t v20 = *(void *)(a1 + 32);
  if (v20) {
    v21 = *(void **)(v20 + 24);
  }
  else {
    v21 = 0;
  }
  [v21 setObject:v8 forKey:*(void *)(a1 + 48)];
  if (sub_100003054(*(void *)(a1 + 32)))
  {
    uint64_t v22 = sub_10000317C(*(dispatch_queue_t **)(a1 + 32), *(unsigned char *)(a1 + 72));
    uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
    v24 = *(void **)(v23 + 40);
    *(void *)(v23 + 40) = v22;

    if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)) {
      sub_100003728(*(void *)(a1 + 32));
    }
  }
}

uint64_t sub_100003054(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = *(id *)(v1 + 24);
    id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          int v7 = [[*(id *)(v1 + 24) objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * (void)v6) forKey:v9];
          if (v7 && v7[2])
          {

            uint64_t v1 = 1;
            goto LABEL_13;
          }

          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    uint64_t v1 = 0;
LABEL_13:
  }
  return v1;
}

NSObject *sub_10000317C(dispatch_queue_t *a1, char a2)
{
  id v2 = a1;
  if (a1)
  {
    dispatch_assert_queue_V2(a1[5]);
    id v4 = v2[4].isa;
    uint64_t v5 = sub_100003C88((uint64_t)v2);
    if (v4)
    {
      id v6 = v4[1];
      if (v6)
      {
        id v7 = v4[13];

        v4[13] = (id)v5;
        if (v7 == (id)v5 && (a2 & 1) == 0)
        {
          if (qword_10002C538 != -1) {
            dispatch_once(&qword_10002C538, &stru_1000249F0);
          }
          id v8 = qword_10002C540;
          if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Keeping existing CMMediaSession", buf, 2u);
          }
          id v2 = 0;
LABEL_44:

          goto LABEL_45;
        }
      }
      else
      {
        v4[13] = (id)v5;
      }
    }
    sub_100003BCC((uint64_t)v2);
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_1000249F0);
    }
    long long v9 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Restarting CMMediaSession", buf, 2u);
    }
    long long v10 = objc_opt_new();
    long long v11 = +[NSNumber numberWithInteger:sub_100003F44((uint64_t)v2)];
    [v10 setObject:v11 forKeyedSubscript:kCMMediaSessionClientMode];

    if (v5 != -1)
    {
      long long v12 = +[NSNumber numberWithUnsignedLongLong:v5];
      [v10 setObject:v12 forKeyedSubscript:kCMMediaSessionPredictionIntervalMicroseconds];
    }
    id v13 = [objc_alloc((Class)CMMediaSession) _initWithOptions:v10];
    sub_1000025DC((uint64_t)v4, v13);

    if ([(objc_class *)v2[7].isa BOOLForKey:@"TempestLogMsl"])
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_1000249F0);
      }
      uint64_t v14 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Logging MSL", buf, 2u);
      }
      v15 = sub_100013ED8();
      unint64_t v16 = +[NSString stringWithFormat:@"%@/Tempest/MSL", v15];

      if (v4) {
        id v17 = v4[1];
      }
      else {
        id v17 = 0;
      }
      [v17 _enableLoggingForReplayWithFilenamePrefix:@"tempest" filePath:v16];
    }
    else
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_1000249F0);
      }
      v18 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "MSL logging disabled", buf, 2u);
      }
    }
    *(void *)buf = 0;
    v31 = buf;
    uint64_t v32 = 0x2020000000;
    uint64_t v33 = 2;
    if (v4) {
      id v19 = v4[1];
    }
    else {
      id v19 = 0;
    }
    id v20 = v19;
    v21 = v2[5].isa;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100003FD0;
    v29[3] = &unk_1000248E0;
    v29[4] = v2;
    v29[5] = buf;
    unsigned __int8 v22 = [v20 _startPoseUpdatesToQueue:v21 andHandler:v29];

    if (v22)
    {
      sub_1000043C8((uint64_t)v2);
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_1000249F0);
      }
      uint64_t v23 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Starting timer to emulate media session status callback", v28, 2u);
      }
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000048B0;
      v27[3] = &unk_100024908;
      v27[4] = v2;
      v24 = sub_100004B18(v2, v27, 2.0);
      sub_1000025EC((uint64_t)v4, v24);

      +[RMAudioAccessoryManager setTempestActive:1];
      id v2 = 0;
    }
    else
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_1000249F0);
      }
      v25 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to start CMMediaSession", v28, 2u);
      }
      id v2 = +[NSError errorWithDomain:@"kRMErrorDomain" code:3 userInfo:0];
    }
    _Block_object_dispose(buf, 8);

    goto LABEL_44;
  }
LABEL_45:

  return v2;
}

void sub_100003710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003728(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    uint64_t v2 = sub_100003F44(a1);
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_1000249F0);
    }
    id v3 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67240192;
      v7[1] = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updating CMMediaSession client mode to %{public}d", (uint8_t *)v7, 8u);
    }
    id v4 = *(void **)(a1 + 32);
    if (v4) {
      uint64_t v5 = (void *)v4[1];
    }
    else {
      uint64_t v5 = 0;
    }
    id v6 = v4;
    [v5 _updateClientMode:v2];
  }
}

void sub_1000038E0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(void **)(v2 + 24);
  }
  else {
    id v3 = 0;
  }
  id v4 = [v3 objectForKey:*(void *)(a1 + 40)];
  if (v4) {
    uint64_t v5 = v4[3];
  }
  else {
    uint64_t v5 = 0;
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    id v7 = *(void **)(v6 + 24);
  }
  else {
    id v7 = 0;
  }
  [v7 removeObjectForKey:*(void *)(a1 + 40)];
  int v8 = sub_100003054(*(void *)(a1 + 32));
  uint64_t v9 = *(void *)(a1 + 32);
  if (v8)
  {
    sub_100003728(v9);
  }
  else
  {
    if (v9) {
      long long v10 = *(void **)(v9 + 32);
    }
    else {
      long long v10 = 0;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12 && (id v13 = *(id *)(v12 + 32)) != 0)
    {
      uint64_t v14 = v13[12];
    }
    else
    {
      uint64_t v14 = 0;
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100003AB0;
    v24[3] = &unk_100024890;
    v15 = (char *)v11;
    uint64_t v16 = *(void *)(a1 + 32);
    id v25 = v15;
    uint64_t v26 = v16;
    uint64_t v27 = v14;
    id v17 = objc_retainBlock(v24);
    v18 = v17;
    if (!v15) {
      goto LABEL_23;
    }
    uint64_t v19 = 88;
    if (!v5) {
      uint64_t v19 = 80;
    }
    double v20 = *(double *)&v15[v19];
    if (v20 > 0.0)
    {
      dispatch_time_t v21 = dispatch_time(0, (uint64_t)(v20 * 1000000000.0));
      uint64_t v22 = *(void *)(a1 + 32);
      if (v22) {
        uint64_t v23 = *(NSObject **)(v22 + 40);
      }
      else {
        uint64_t v23 = 0;
      }
      dispatch_after(v21, v23, v18);
    }
    else
    {
LABEL_23:
      ((void (*)(void *))v17[2])(v17);
    }
  }
}

void sub_100003AB0(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2 && *(void *)(v2 + 96) > a1[6])
  {
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_1000249F0);
    }
    id v3 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Not stopping CMMediaSession because new session is using it", buf, 2u);
    }
  }
  else
  {
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_1000249F0);
    }
    id v4 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping CMMediaSession", v5, 2u);
    }
    sub_100003BCC(a1[5]);
  }
}

void sub_100003BCC(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    uint64_t v2 = (id *)*(id *)(a1 + 32);
    if (v2 && v2[1])
    {
      id v3 = v2;
      sub_100004BC8(a1);
      [v3[1] _stop];
      [v3[1] _disableLoggingForReplay];
      sub_1000025DC((uint64_t)v3, 0);
      +[RMAudioAccessoryManager setTempestActive:0];
      uint64_t v2 = v3;
    }
  }
}

uint64_t sub_100003C88(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 40));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v2 = *(id *)(v1 + 24);
    id v3 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v3)
    {
      id v4 = v3;
      char v5 = 0;
      char v6 = 0;
      uint64_t v7 = *(void *)v19;
      unint64_t v8 = -1;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v2);
          }
          long long v10 = [[*(id *)(v1 + 24) objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * (void)v9) key:v18];
          if (v10) {
            unint64_t v11 = v10[2];
          }
          else {
            unint64_t v11 = 0;
          }
          if (v8 >= v11) {
            unint64_t v12 = v11;
          }
          else {
            unint64_t v12 = v8;
          }
          BOOL v13 = v11 == 0;
          BOOL v14 = v11 != 0;
          char v15 = v13;
          v5 |= v15;
          v6 |= v14;
          if (!v13) {
            unint64_t v8 = v12;
          }

          uint64_t v9 = (char *)v9 + 1;
        }
        while (v4 != v9);
        id v16 = [v2 countByEnumeratingWithState:&v18 objects:v22 count:16];
        id v4 = v16;
      }
      while (v16);

      if (v6) {
        unint64_t v17 = v8;
      }
      else {
        unint64_t v17 = 0;
      }
      if (v5) {
        return v17;
      }
      else {
        return v8;
      }
    }
    else
    {

      return -1;
    }
  }
  return result;
}

uint64_t sub_100003DFC(uint64_t a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = *(id *)(a1 + 24);
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      unint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(a1 + 24) objectForKey:*(void *)(*((void *)&v12 + 1) + 8 * (void)v8) forKey:v12];
        if (v9 && v9[2] && v9[3] == a2)
        {

          uint64_t v10 = 1;
          goto LABEL_14;
        }

        unint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v10 = 0;
LABEL_14:

  return v10;
}

uint64_t sub_100003F44(uint64_t a1)
{
  if (!a1) {
    return 0;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  uint64_t v2 = 0;
  if ((sub_100003DFC(a1, 0) & 1) == 0)
  {
    uint64_t v2 = 4;
    if ((sub_100003DFC(a1, 4) & 1) == 0)
    {
      uint64_t v2 = 2;
      if ((sub_100003DFC(a1, 2) & 1) == 0)
      {
        uint64_t v2 = 3;
        if (!sub_100003DFC(a1, 3)) {
          return 1;
        }
      }
    }
  }
  return v2;
}

void sub_100003FD0(uint64_t a1, void *a2, int a3)
{
  if (a3 == 114) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 2;
  }
  sub_10000405C(*(void *)(a1 + 32), a2, v5);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if (v6 != v5)
  {
    if (a3 == 114)
    {
      sub_100004284(*(void *)(a1 + 32));
    }
    else if (v6 == 4)
    {
      sub_100004328(*(void *)(a1 + 32));
    }
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  }
}

void sub_10000405C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    uint64_t v6 = [v5 attitude];
    [v6 quaternion];
    v33[0] = v7;
    unint64_t v8 = [v5 attitude];
    [v8 quaternion];
    v33[1] = v9;
    uint64_t v10 = [v5 attitude];
    [v10 quaternion];
    v33[2] = v11;
    long long v12 = [v5 attitude];
    [v12 quaternion];
    v33[3] = v13;
    [v5 timestamp];
    v33[4] = v14;
    v33[5] = a3;
    [v5 consumedAuxTimestamp];
    v33[6] = v15;
    [v5 receivedAuxTimestamp];
    v33[7] = v16;
    id v28 = v5;
    [v5 machAbsTimestamp];
    v33[8] = v17;

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v18 = *(id *)(a1 + 24);
    id v19 = [v18 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v30;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = [*(id *)(a1 + 24) objectForKey:*(void *)(*((void *)&v29 + 1) + 8 * (void)v22)];
          v24 = (void *)v23;
          if (v23 && *(void *)(v23 + 16))
          {
            id v25 = *(void (***)(void, void))(v23 + 8);
            uint64_t v26 = v25;
            uint64_t v27 = +[NSData dataWithBytes:v33 length:72];
            ((void (**)(void, void *))v25)[2](v26, v27);
          }
          uint64_t v22 = (char *)v22 + 1;
        }
        while (v20 != v22);
        id v20 = [v18 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v20);
    }

    id v5 = v28;
  }
}

void sub_100004284(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    int v2 = *(_DWORD *)(a1 + 12);
    if (!v2)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005B04;
      block[3] = &unk_100024908;
      block[4] = a1;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      int v2 = *(_DWORD *)(a1 + 12);
    }
    *(_DWORD *)(a1 + 12) = v2 + 1;
  }
}

void sub_100004328(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    int v2 = *(_DWORD *)(a1 + 12) - 1;
    *(_DWORD *)(a1 + 12) = v2;
    if (!v2)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005C10;
      block[3] = &unk_100024908;
      block[4] = a1;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

void sub_1000043C8(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (*(unsigned char *)(a1 + 9))
    {
      int v2 = *(id *)(a1 + 32);
      if (*(unsigned char *)(a1 + 8))
      {
        if (qword_10002C538 != -1) {
          dispatch_once(&qword_10002C538, &stru_1000249F0);
        }
        id v3 = qword_10002C540;
        if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Keeping existing RMFacePoseCaptureSession", (uint8_t *)buf, 2u);
        }
        [(id)a1 facePoseCaptureSessionDidConfigure:*(void *)(a1 + 72)];
      }
      else
      {
        if (qword_10002C538 != -1) {
          dispatch_once(&qword_10002C538, &stru_1000249F0);
        }
        id v4 = qword_10002C540;
        if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting RMFacePoseCaptureSession", (uint8_t *)buf, 2u);
        }
        objc_initWeak(buf, (id)a1);
        id v5 = *(id *)(a1 + 72);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100004D6C;
        v20[3] = &unk_100024958;
        v20[4] = a1;
        objc_copyWeak(&v21, buf);
        [v5 startCaptureSessionWithHandler:v20];

        *(unsigned char *)(a1 + 8) = 1;
        objc_destroyWeak(&v21);
        objc_destroyWeak(buf);
      }
      ++*(void *)(a1 + 80);
      uint64_t v6 = [(id)a1 externalDisplayService];
      [v6 addObserver:a1];

      uint64_t v7 = *(void *)(a1 + 32);
      if (v7) {
        *(void *)(v7 + 72) = 2;
      }
      unint64_t v8 = +[BLSBacklight sharedBacklight];
      [v8 addObserver:a1];

      -[RMAudioListenerPoseEngine externalDisplayDidConnect:]_0((dispatch_queue_t *)a1);
      [*(id *)(a1 + 64) startLidAngleUpdates];
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_1000249F0);
      }
      uint64_t v9 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Starting timer to control camera pause state", (uint8_t *)buf, 2u);
      }
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000513C;
      v19[3] = &unk_100024908;
      v19[4] = a1;
      uint64_t v10 = sub_100004B18((dispatch_source_t)a1, v19, 0.1);
      sub_1000025FC((uint64_t)v2, v10);

      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_1000249F0);
      }
      uint64_t v11 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Starting timer to read lid angle", (uint8_t *)buf, 2u);
      }
      if (v2) {
        v2[5] = 0xBFF0000000000000;
      }
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000051D0;
      v17[3] = &unk_1000248B8;
      v17[4] = a1;
      long long v12 = v2;
      id v18 = v12;
      uint64_t v13 = sub_100004B18((dispatch_source_t)a1, v17, 0.1);
      sub_10000260C((uint64_t)v12, v13);

      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_1000249F0);
      }
      uint64_t v14 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Starting timer to read device state", (uint8_t *)buf, 2u);
      }
      if (v2)
      {
        v12[7] = -1;
        v12[8] = -1;
      }
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100005344;
      v16[3] = &unk_100024908;
      v16[4] = a1;
      uint64_t v15 = sub_100004B18((dispatch_source_t)a1, v16, 2.0);
      sub_10000261C((uint64_t)v12, v15);
    }
  }
}

void sub_100004894(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1000048B0(uint64_t a1)
{
  CFStringRef v4 = @"Time";
  uint64_t v2 = +[NSNumber numberWithDouble:sub_10000CF34()];
  id v5 = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  sub_10000496C(*(void *)(a1 + 32), v3);
}

void sub_10000496C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    id v17 = v3;
    uint64_t v16 = [v3 objectForKeyedSubscript:@"Time"];
    [v16 doubleValue];
    uint64_t v22 = v4;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v5 = *(id *)(a1 + 24);
    id v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(a1 + 24) objectForKey:*(void *)(*((void *)&v18 + 1) + 8 * (void)v9)];
          uint64_t v11 = (void *)v10;
          if (v10) {
            long long v12 = *(void (***)(void, void))(v10 + 8);
          }
          else {
            long long v12 = 0;
          }
          uint64_t v13 = v12;
          uint64_t v14 = +[NSData dataWithBytes:&v22 length:8];
          ((void (**)(void, void *))v12)[2](v13, v14);

          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v15 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
        id v7 = v15;
      }
      while (v15);
    }

    id v3 = v17;
  }
}

dispatch_source_t sub_100004B18(dispatch_source_t a1, void *a2, double a3)
{
  id v5 = a2;
  if (a1)
  {
    a1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)a1[5].isa);
    if (a1)
    {
      dispatch_time_t v6 = dispatch_walltime(0, 0);
      dispatch_source_set_timer(a1, v6, (unint64_t)(a3 * 1000000000.0), 0);
      dispatch_source_set_event_handler(a1, v5);
      dispatch_resume(a1);
    }
  }

  return a1;
}

void sub_100004BC8(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (*(unsigned char *)(a1 + 9))
    {
      id v2 = *(id *)(a1 + 32);
      uint64_t v3 = (uint64_t)v2;
      if (v2)
      {
        uint64_t v4 = *((void *)v2 + 3);
        if (v4) {
          dispatch_source_cancel(v4);
        }
        sub_1000025FC(v3, 0);
        id v5 = *(NSObject **)(v3 + 32);
        if (v5) {
          dispatch_source_cancel(v5);
        }
        sub_10000260C(v3, 0);
        dispatch_time_t v6 = *(NSObject **)(v3 + 48);
        if (v6) {
          dispatch_source_cancel(v6);
        }
        sub_10000261C(v3, 0);
        id v7 = *(id *)(v3 + 16);
        if (v7)
        {
          uint64_t v8 = v7;
          dispatch_source_cancel(v7);
        }
      }
      else
      {
        sub_1000025FC(0, 0);
        sub_10000260C(0, 0);
        sub_10000261C(0, 0);
      }
      sub_1000025EC(v3, 0);
      [*(id *)(a1 + 64) stopLidAngleUpdates];
      uint64_t v9 = +[BLSBacklight sharedBacklight];
      [v9 removeObserver:a1];

      uint64_t v10 = [(id)a1 externalDisplayService];
      [v10 removeObserver:a1];

      uint64_t v11 = *(void *)(a1 + 80);
      dispatch_time_t v12 = dispatch_time(0, 2000000000);
      uint64_t v13 = *(NSObject **)(a1 + 40);
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100005570;
      v14[3] = &unk_100024980;
      v14[4] = a1;
      v14[5] = v11;
      dispatch_after(v12, v13, v14);
      [*(id *)(a1 + 72) setCameraPaused:1];
    }
  }
}

void sub_100004D6C(uint64_t a1, void *a2, long long *a3)
{
  id v5 = a2;
  dispatch_time_t v6 = *(void **)(a1 + 32);
  if (v6) {
    dispatch_time_t v6 = (void *)v6[5];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004E5C;
  block[3] = &unk_100024930;
  id v7 = v6;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  id v10 = v5;
  long long v12 = *a3;
  uint64_t v13 = *((void *)a3 + 2);
  id v8 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
}

void sub_100004E5C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(void **)(a1 + 32);
  CMTime v4 = *(CMTime *)(a1 + 48);
  sub_100004EC0((uint64_t)WeakRetained, v2, &v4);
}

void sub_100004EC0(uint64_t a1, void *a2, CMTime *a3)
{
  id v5 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    if (v5 && *(unsigned char *)(a1 + 10))
    {
      dispatch_time_t v6 = [v5 objectForKeyedSubscript:@"rm_tracked_faces"];
      id v7 = [v6 firstObject];
      id v8 = [v7 objectForKeyedSubscript:@"raw_data"];

      uint64_t v9 = [v8 objectForKeyedSubscript:@"pose"];
      id v10 = [v5 objectForKeyedSubscript:@"rm_camera_id"];
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_1000249F0);
      }
      id v11 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v16.value) = 138543618;
        *(CMTimeValue *)((char *)&v16.value + 4) = (CMTimeValue)v10;
        LOWORD(v16.flags) = 2114;
        *(void *)((char *)&v16.flags + 2) = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[Cam %{public}@] Pose %{public}@", (uint8_t *)&v16, 0x16u);
      }
    }
    long long v12 = *(void **)(a1 + 32);
    if (v12) {
      uint64_t v13 = (void *)v12[1];
    }
    else {
      uint64_t v13 = 0;
    }
    CMTime v16 = *a3;
    id v14 = v13;
    id v15 = v12;
    [v14 _feedFaceKitData:v5 timestamp:CMTimeGetSeconds(&v16)];
  }
}

void sub_10000513C(uint64_t a1)
{
  id v2 = *(id **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = (id **)v2[4];
    if (v3)
    {
      id v7 = v3;
      id v2 = v3[1];
    }
    else
    {
      id v7 = 0;
      id v2 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }
  CMTime v4 = v2;
  unsigned int v5 = [v4 isRequestingCameraOn];
  dispatch_time_t v6 = *(void **)(a1 + 32);
  if (v6) {
    dispatch_time_t v6 = (void *)v6[9];
  }
  [v6 setCameraPaused:v5 ^ 1];
}

void sub_1000051D0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 64);
  }
  else {
    uint64_t v3 = 0;
  }
  [v3 lidAngle];
  if (v4 >= 0.0)
  {
    double v5 = v4;
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      if (vabdd_f64(v4, *(double *)(v6 + 40)) <= 0.1) {
        return;
      }
      *(double *)(v6 + 40) = v4;
    }
    else if (fabs(v4) <= 0.1)
    {
      return;
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (!v7) {
      goto LABEL_21;
    }
    if (!*(unsigned char *)(v7 + 10)) {
      goto LABEL_14;
    }
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_1000249F0);
    }
    id v8 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 134349056;
      double v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "LidAngle %{public}.2f", (uint8_t *)&v11, 0xCu);
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
LABEL_14:
      uint64_t v9 = *(id *)(v7 + 32);
      id v10 = v9;
      if (v9) {
        uint64_t v9 = (void *)v9[1];
      }
    }
    else
    {
LABEL_21:
      id v10 = 0;
      uint64_t v9 = 0;
    }
    [v9 _feedLidAngle:v5];
  }
}

void sub_100005344(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2)
  {
    double v4 = 0;
LABEL_9:

    goto LABEL_10;
  }
  id v3 = *(id *)(v2 + 32);
  double v4 = v3;
  if (!v3 || !*((void *)v3 + 9)) {
    goto LABEL_9;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5 || (uint64_t v6 = *(id *)(v5 + 32)) == 0)
  {

    goto LABEL_7;
  }
  uint64_t v7 = v6[9];

  if (v7 != 1)
  {
LABEL_7:
    uint64_t v8 = 1;
    goto LABEL_11;
  }
LABEL_10:
  uint64_t v8 = 0;
LABEL_11:
  if (MKBGetDeviceLockState() - 1 >= 2) {
    uint64_t v9 = v8;
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 32);

  sub_1000053F8(v10, v9);
}

void sub_1000053F8(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      uint64_t v4 = *(void *)(v4 + 64);
    }
    if (v4 != a2)
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_1000249F0);
      }
      uint64_t v5 = (void *)qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        if (v6) {
          LODWORD(v6) = *(_DWORD *)(v6 + 64);
        }
        *(_DWORD *)buf = 67240448;
        int v12 = v6;
        __int16 v13 = 1026;
        int v14 = a2;
        uint64_t v7 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "displayState: %{public}d -> %{public}d", buf, 0xEu);
      }
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8) {
        *(void *)(v8 + 64) = a2;
      }
      uint64_t v9 = *(NSObject **)(a1 + 40);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100005A88;
      v10[3] = &unk_100024980;
      v10[4] = a1;
      v10[5] = a2;
      dispatch_async(v9, v10);
    }
  }
}

void sub_100005570(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && *(void *)(v2 + 80) > *(void *)(a1 + 40))
  {
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_1000249F0);
    }
    id v3 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Not stopping RMFacePoseCaptureSession because new session is using it", buf, 2u);
    }
  }
  else
  {
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_1000249F0);
    }
    uint64_t v4 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Stopping RMFacePoseCaptureSession", v8, 2u);
    }
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(void **)(v5 + 72);
    }
    else {
      uint64_t v6 = 0;
    }
    [v6 stopCaptureSession];
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      *(unsigned char *)(v7 + 8) = 0;
    }
  }
}

void sub_10000574C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) numberOfCameras];
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_1000249F0);
  }
  id v3 = (void *)qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = v3;
    v9[0] = 67240448;
    v9[1] = [v4 numberOfCameras];
    __int16 v10 = 1026;
    BOOL v11 = v2 != 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Number of cameras: %{public}d, updating CMMediaSession tracking scheme to %{public}d", (uint8_t *)v9, 0xEu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    uint64_t v7 = *(id *)(v6 + 32);
    uint64_t v8 = v7;
    if (v7) {
      uint64_t v7 = (void *)v7[1];
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v7 = 0;
  }
  [v7 _updateTrackingScheme:v2 != 0];
}

void sub_100005894(uint64_t a1, unsigned int a2)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      uint64_t v4 = *(void *)(v4 + 56);
    }
    if (v4 != a2)
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_1000249F0);
      }
      uint64_t v5 = (void *)qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(a1 + 32);
        if (v6) {
          LODWORD(v6) = *(_DWORD *)(v6 + 56);
        }
        *(_DWORD *)buf = 67240448;
        int v13 = v6;
        __int16 v14 = 1026;
        unsigned int v15 = a2;
        uint64_t v7 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "displayCount: %{public}d -> %{public}d", buf, 0xEu);
      }
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8) {
        *(void *)(v8 + 56) = a2;
      }
      uint64_t v9 = *(NSObject **)(a1 + 40);
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100005A14;
      v10[3] = &unk_1000249A8;
      v10[4] = a1;
      unsigned int v11 = a2;
      dispatch_async(v9, v10);
    }
  }
}

void sub_100005A14(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = *(id *)(v2 + 32);
    if (v3)
    {
      id v4 = v3;
      id v3 = (void *)v3[1];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
    id v3 = 0;
  }
  [v3 _feedDisplayCount:*(unsigned int *)(a1 + 40)];
}

void sub_100005A88(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = *(id *)(v2 + 32);
    if (v3)
    {
      id v4 = v3;
      id v3 = (void *)v3[1];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
    id v3 = 0;
  }
  [v3 _feedScreenUnlockedEvent:*(void *)(a1 + 40) == 1];
}

void sub_100005B04(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    uint64_t v1 = (void *)v1[11];
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 40);
  }
  else {
    uint64_t v3 = 0;
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100005BAC;
  v5[3] = &unk_100024908;
  v5[4] = *(void *)(a1 + 32);
  id v4 = v1;
  [v4 startUserInteractionUpdatesToQueue:v3 withHandler:v5];
}

void sub_100005BAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    uint64_t v2 = *(id *)(v1 + 32);
    if (v2)
    {
      id v3 = v2;
      uint64_t v2 = (void *)v2[1];
    }
    else
    {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
    uint64_t v2 = 0;
  }
  [v2 _triggerUserInteractedWithDeviceEvent];
}

id sub_100005C10(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return [*(id *)(v1 + 88) stopUserInteractionUpdates];
  }
  else {
    return [0 stopUserInteractionUpdates];
  }
}

void sub_100005C28(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(NSObject **)(v4 + 40);
  }
  else {
    uint64_t v5 = 0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100005CD4;
  v8[3] = &unk_1000248B8;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v3;
  uint64_t v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

void sub_100005CD4(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) count] + 1;
  uint64_t v3 = *(void *)(a1 + 40);

  sub_100005894(v3, v2);
}

void sub_100005D9C(uint64_t a1)
{
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_1000249F0);
  }
  unsigned int v2 = (void *)qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      id v4 = *(id *)(v3 + 32);
      uint64_t v5 = v4;
      if (v4) {
        LODWORD(v3) = *((_DWORD *)v4 + 18);
      }
      else {
        LODWORD(v3) = 0;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
    uint64_t v6 = *(void *)(a1 + 40);
    v11[0] = 67240448;
    v11[1] = v3;
    __int16 v12 = 1026;
    int v13 = v6;
    id v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "backlightState: %{public}d -> %{public}d", (uint8_t *)v11, 0xEu);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(id *)(v8 + 32);
    if (v10)
    {
      v10[9] = v9;
    }
  }
}

void sub_100005F84(id a1)
{
  qword_10002C540 = (uint64_t)os_log_create("com.apple.RelativeMotion", "TempestDataProducer");

  _objc_release_x1();
}

void sub_100006608(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100006634(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) endpoint];
  uint64_t v8 = sub_100015A04((uint64_t)v7);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006734;
  block[3] = &unk_100024A18;
  id v9 = *(id *)(a1 + 40);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v8, block);
}

uint64_t sub_100006734(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_10000674C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else
  {
    uint64_t v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100006820(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100015918(a2);
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else
  {
    uint64_t v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    id v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:0];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t sub_1000068FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000690C(uint64_t a1)
{
}

void sub_100006914(uint64_t a1, id *a2)
{
  if (a2)
  {
    uint64_t v3 = sub_100008DC8(a2);
    id v6 = (id)v3;
    if (v3) {
      CFStringRef v4 = (const __CFString *)v3;
    }
    else {
      CFStringRef v4 = @"Unknown";
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = +[NSKeyedArchiver archivedDataWithRootObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) requiringSecureCoding:1 error:0];
    (*(void (**)(uint64_t, const __CFString *))(v5 + 16))(v5, @"RMSpiListClients");
  }
}

void sub_1000069D0(void *a1, void *a2)
{
  uint64_t v3 = a2;
  id v9 = v3;
  if (v3)
  {
    CFStringRef v4 = sub_100008DC8(v3);
    unsigned int v5 = [v4 isEqualToString:a1[4]];

    if (v5)
    {
      sub_100015918((uint64_t)v9);
      ++*(void *)(*(void *)(a1[6] + 8) + 24);
    }
  }
  else
  {
    uint64_t v6 = a1[5];
    id v7 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1[6] + 8) + 24)];
    uint64_t v8 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
    (*(void (**)(uint64_t, const __CFString *, void *))(v6 + 16))(v6, @"RMSpiDisconnectClient", v8);
  }
}

void sub_100006B34(id a1)
{
  qword_10002C550 = (uint64_t)os_log_create("com.apple.RelativeMotion", "InternalService");

  _objc_release_x1();
}

void sub_100006EFC(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFStringRef v4 = [*(id *)(a1 + 32) receiverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006FC4;
  block[3] = &unk_100024AD8;
  unsigned int v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

void *sub_100006FC4(void *result)
{
  unsigned __int8 v1 = atomic_load((unsigned __int8 *)(result[4] + 8));
  if (v1) {
    return (void *)(*(uint64_t (**)(void, void))(result[6] + 16))(result[6], result[5]);
  }
  return result;
}

void sub_100007148(id a1)
{
  qword_10002C540 = (uint64_t)os_log_create("com.apple.RelativeMotion", "TempestDataProducer");

  _objc_release_x1();
}

id *sub_1000071F4(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)RMHeadphoneActivityProvider;
    unsigned int v5 = (id *)[super init];
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      objc_setProperty_atomic(a1, v6, 0, 24);
    }
  }

  return a1;
}

void *sub_10000727C(void *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    unsigned int v5 = [objc_getProperty(a1, v3, 24, 1) unknown];
    if (v5 == [v4 unknown]
      && (unsigned int v7 = objc_msgSend(objc_getProperty(a1, v6, 24, 1), "stationary"),
          v7 == [v4 stationary])
      && (unsigned int v9 = objc_msgSend(objc_getProperty(a1, v8, 24, 1), "walking"),
          v9 == [v4 walking]))
    {
      unsigned int v12 = [objc_getProperty(a1, v10, 24, 1) running];
      a1 = (void *)(v12 ^ [v4 running] ^ 1);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

void sub_10000744C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (sub_10000727C(*(void **)(a1 + 32), v5))
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100024B98);
      }
      objc_super v8 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v23 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Suppressing duplicate activity: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      unsigned int v9 = *(void **)(a1 + 32);
      if (v9) {
        objc_setProperty_atomic(v9, v7, v5, 24);
      }
      id v10 = objc_alloc((Class)NSMutableDictionary);
      v20[0] = kCMHeadphoneEventTypeKey;
      v20[1] = kCMHeadphoneEventPayloadData;
      v21[0] = kCMHeadphoneEventTypeActivity;
      v21[1] = v5;
      id v11 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      id v12 = [v10 initWithDictionary:v11];

      if (v6) {
        [v12 setObject:v6 forKeyedSubscript:kCMHeadphoneEventPayloadError];
      }
      id v13 = +[NSKeyedArchiver archivedDataWithRootObject:v12 requiringSecureCoding:0 error:0];
      if (v13)
      {
        uint64_t v14 = *(void *)(a1 + 32);
        if (v14) {
          id v15 = *(NSObject **)(v14 + 8);
        }
        else {
          id v15 = 0;
        }
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100007724;
        v17[3] = &unk_100024B50;
        id v19 = *(id *)(a1 + 40);
        id v18 = v13;
        dispatch_async(v15, v17);
      }
      else
      {
        if (qword_10002C538 != -1) {
          dispatch_once(&qword_10002C538, &stru_100024B98);
        }
        CMTime v16 = qword_10002C540;
        if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to serialize activity dictionary: %{public}@", buf, 0xCu);
        }
      }
    }
  }
}

uint64_t sub_100007724(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100007804(id a1)
{
  qword_10002C540 = (uint64_t)os_log_create("com.apple.RelativeMotion", "TempestDataProducer");

  _objc_release_x1();
}

id *sub_1000079D4(id *result, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    id v4 = result;
    [result[4] setLastDeviceStatus:a2];
    id v5 = [v4[4] lastDeviceStatus];
    id v6 = v4[4];
    if (v5)
    {
      return (id *)[v6 notifyDisconnectedToClient];
    }
    else
    {
      return (id *)[v6 notifyConnectedToClient];
    }
  }
  return result;
}

void sub_100007E24(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) callbackBlock];
  v2[2](v2, *(void *)(a1 + 40));
}

void sub_10000816C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008214(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unsigned int v7 = v6;
  if (!v6) {
    goto LABEL_10;
  }
  objc_super v8 = [v6 domain];
  unsigned int v9 = v8;
  if (v8 != CMErrorDomain)
  {

    goto LABEL_10;
  }
  id v10 = [v7 code];

  if (v10 != (id)109)
  {
LABEL_10:
    if (v5)
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100024C08);
      }
      id v15 = (void *)qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
      {
        CMTime v16 = *(void **)(a1 + 32);
        id v17 = v15;
        id v18 = [v16 activeAudioRouteDeviceID];
        int v20 = 138477827;
        long long v21 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[RMHeadphoneStatusProvider] Activity supported for device: %{private}@", (uint8_t *)&v20, 0xCu);
      }
      [*(id *)(a1 + 32) setActivitySupported:1];
      [*(id *)(a1 + 32) notifyConnectedToClient];
    }
    goto LABEL_16;
  }
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100024C08);
  }
  id v11 = (void *)qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = *(void **)(a1 + 32);
    id v13 = v11;
    uint64_t v14 = [v12 activeAudioRouteDeviceID];
    int v20 = 138477827;
    long long v21 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[RMHeadphoneStatusProvider] Activity not supported for device: %{private}@", (uint8_t *)&v20, 0xCu);
  }
  [*(id *)(a1 + 32) notifyDisconnectedToClient];
LABEL_16:
  id v19 = [*(id *)(a1 + 32) audioAccessoryManager];
  [v19 stopActivityUpdates];
}

void sub_100008524(id a1)
{
  qword_10002C540 = (uint64_t)os_log_create("com.apple.RelativeMotion", "TempestDataProducer");

  _objc_release_x1();
}

void sub_1000085F4(id *a1@<X0>, _OWORD *a2@<X8>)
{
  *a2 = 0u;
  a2[1] = 0u;
  if (a1)
  {
    sub_100015DE4(a1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    xpc_connection_get_audit_token();
  }
}

BOOL sub_100008660(id *a1, void *a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    CFErrorRef error = 0;
    memset(&v34, 0, sizeof(v34));
    sub_1000085F4(a1, &v34);
    audit_token_t token = v34;
    id v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
    if (v4)
    {
      id v5 = v4;
      CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, v3, &error);
      CFErrorRef v7 = error;
      if (error)
      {
        if (qword_10002C528 != -1) {
          dispatch_once(&qword_10002C528, &stru_100024C28);
        }
        objc_super v8 = (id)qword_10002C530;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v33 = v7;
          id v9 = objc_alloc_init((Class)NSMutableString);
          id v10 = +[NSString stringWithFormat:@"%d", v34.val[0]];
          [v9 appendString:v10];

          for (uint64_t i = 1; i != 8; ++i)
          {
            [v9 appendString:@"|"];
            id v12 = +[NSString stringWithFormat:@"%d", v34.val[i]];
            [v9 appendString:v12];
          }
          id v13 = error;
          id v14 = v9;
          CFErrorDomain Domain = CFErrorGetDomain(v13);
          CFIndex Code = CFErrorGetCode(error);
          token.val[0] = 138412802;
          *(void *)&token.val[1] = v9;
          LOWORD(token.val[3]) = 2112;
          *(void *)((char *)&token.val[3] + 2) = Domain;
          HIWORD(token.val[5]) = 2048;
          *(void *)&token.val[6] = Code;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "#Warning SecTaskCopyValueForEntitlement failed for token '%@' with error '%@' (%ld)", (uint8_t *)&token, 0x20u);

          CFErrorRef v7 = v33;
        }

        CFRelease(error);
      }
      if (v6)
      {
        CFTypeID v17 = CFGetTypeID(v6);
        BOOL v18 = v17 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v6) != 0;
        CFRelease(v6);
        if (v7) {
          goto LABEL_26;
        }
      }
      else
      {
        BOOL v18 = 0;
        if (v7)
        {
LABEL_26:
          if (qword_10002C528 != -1) {
            dispatch_once(&qword_10002C528, &stru_100024C28);
          }
          uint64_t v26 = (void *)qword_10002C530;
          if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = v3;
            id v28 = v26;
            id v29 = [(__CFString *)v27 UTF8String];
            *(void *)rgidp = 0;
            *(void *)pidp = 0;
            *(void *)asidp = 0;
            audit_token_t token = v34;
            audit_token_to_au32(&token, 0, &rgidp[1], (gid_t *)&asidp[1], (uid_t *)pidp, rgidp, &pidp[1], asidp, 0);
            unsigned int v30 = pidp[1];
            long long v31 = sub_100008B2C();
            token.val[0] = 136315650;
            *(void *)&token.val[1] = v29;
            LOWORD(token.val[3]) = 1024;
            *(unsigned int *)((char *)&token.val[3] + 2) = v30;
            HIWORD(token.val[4]) = 2112;
            *(void *)&token.val[5] = v31;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "#Warning Issue retrieving entitlement, '%s', pid, %d, executable or bundle, '%@'", (uint8_t *)&token, 0x1Cu);
          }
        }
      }
      CFRelease(v5);
      goto LABEL_31;
    }
    if (qword_10002C528 != -1) {
      dispatch_once(&qword_10002C528, &stru_100024C28);
    }
    id v19 = (id)qword_10002C530;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = objc_alloc_init((Class)NSMutableString);
      long long v21 = +[NSString stringWithFormat:@"%d", v34.val[0]];
      [v20 appendString:v21];

      for (uint64_t j = 1; j != 8; ++j)
      {
        [v20 appendString:@"|"];
        id v23 = +[NSString stringWithFormat:@"%d", v34.val[j]];
        [v20 appendString:v23];
      }
      id v24 = v20;
      id v25 = [v24 UTF8String];
      token.val[0] = 136315138;
      *(void *)&token.val[1] = v25;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "#Warning SecTaskCreateWithAuditToken failed for token '%s'", (uint8_t *)&token, 0xCu);
    }
  }
  BOOL v18 = 0;
LABEL_31:

  return v18;
}

__CFString *sub_100008B2C()
{
  v0 = (_OWORD *)__chkstk_darwin();
  *(void *)rgidp = 0;
  *(void *)pidp = 0;
  long long v1 = v0[1];
  *(_OWORD *)atoken.val = *v0;
  *(_OWORD *)&atoken.val[4] = v1;
  *(void *)asidp = 0;
  audit_token_to_au32(&atoken, 0, &rgidp[1], (gid_t *)&asidp[1], (uid_t *)pidp, rgidp, &pidp[1], asidp, 0);
  if (proc_pidpath(pidp[1], &atoken, 0x1000u) <= 0) {
    goto LABEL_16;
  }
  id v2 = +[NSString stringWithUTF8String:&atoken];
  if (!v2) {
    goto LABEL_16;
  }
  id v3 = v2;
  CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)[v3 UTF8String], 4u);
  if (v4)
  {
    CFStringRef v5 = v4;
    CFURLRef v6 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v4, kCFURLPOSIXPathStyle, 0);
    if (v6)
    {
      CFURLRef v7 = v6;
      CFURLRef v8 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
      if (v8)
      {
        CFURLRef v9 = v8;
        id v10 = CFBundleCreate(kCFAllocatorDefault, v8);
        if (v10)
        {
          id v11 = v10;
          id v12 = (id)CFBundleGetIdentifier(v10);
          CFRelease(v11);
        }
        else
        {
          id v12 = 0;
        }
        CFRelease(v9);
      }
      else
      {
        id v12 = 0;
      }
      CFRelease(v7);
    }
    else
    {
      id v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    id v12 = 0;
  }
  id v13 = v12;

  if (!v13)
  {
LABEL_16:
    *(void *)rgidp = 0;
    *(void *)pidp = 0;
    long long v14 = v0[1];
    *(_OWORD *)atoken.val = *v0;
    *(_OWORD *)&atoken.val[4] = v14;
    *(void *)asidp = 0;
    audit_token_to_au32(&atoken, 0, &rgidp[1], (gid_t *)&asidp[1], (uid_t *)pidp, rgidp, &pidp[1], asidp, 0);
    if (proc_pidpath(pidp[1], &atoken, 0x1000u) < 1)
    {
      id v13 = 0;
    }
    else
    {
      id v13 = +[NSString stringWithUTF8String:&atoken];
    }
  }

  return v13;
}

BOOL sub_100008D68(BOOL a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    sub_1000085F4((id *)a1, &v5);
    a1 = TCCAccessCheckAuditToken() != 0;
  }

  return a1;
}

id *sub_100008DC8(id *a1)
{
  if (a1)
  {
    memset(v3, 0, sizeof(v3));
    sub_1000085F4(a1, v3);
    sub_100008B2C();
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

id *sub_100008E14(id *result)
{
  if (result)
  {
    memset(&v1, 0, sizeof(v1));
    sub_1000085F4(result, &v1);
    *(void *)rgidp = 0;
    *(void *)pidp = 0;
    *(void *)asidp = 0;
    aaudit_token_t token = v1;
    audit_token_to_au32(&atoken, 0, &rgidp[1], (gid_t *)&asidp[1], (uid_t *)pidp, rgidp, &pidp[1], asidp, 0);
    return (id *)pidp[1];
  }
  return result;
}

void sub_100008E84(id a1)
{
  qword_10002C530 = (uint64_t)os_log_create("com.apple.RelativeMotion", "IPC");

  _objc_release_x1();
}

void sub_100008F1C(id a1)
{
  qword_10002C988 = objc_opt_new();

  _objc_release_x1();
}

void sub_1000092DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009304(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CFURLRef v7 = WeakRetained;
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    objc_sync_enter(v8);
    [v8 setLastDeviceStatus:a2];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    CFURLRef v9 = [v8 managers];
    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v16;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v12) deviceMotionStatusHandler];
          long long v14 = (void *)v13;
          if (v13) {
            (*(void (**)(uint64_t, uint64_t, id))(v13 + 16))(v13, a2, v5);
          }

          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    objc_sync_exit(v8);
  }
}

void sub_100009478(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000098AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    objc_sync_enter(v9);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = [v9 managers];
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) deviceMotionHandler];
          long long v15 = (void *)v14;
          if (v14) {
            (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v11);
    }

    double v16 = sub_10000CF5C();
    [v9 setDmSamplesPerSecond:([v9 dmSamplesPerSecond] + 1)];
    [v9 lastDMSampleTime];
    if (v17 + 1.0 < v16)
    {
      [v9 setDmSampleRate:[v9 dmSamplesPerSecond]];
      [v9 setDmSamplesPerSecond:0];
      [v9 setLastDMSampleTime:v16];
    }
    [v9 lastDMPrintTime];
    if (v18 + 5.0 >= v16) {
      goto LABEL_25;
    }
    [v9 setLastDMPrintTime:v16];
    if ([v9 requested50HzHeadphoneMotion])
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100024CF0);
      }
      id v19 = (id)qword_10002C540;
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      id v20 = [v9 dmSampleRate];
      *(_DWORD *)buf = 134349056;
      id v28 = v20;
      long long v21 = "[RMAudioAccessoryManager] current device motion samples per second: %{public}lu. Headphone Motion API set to"
            " 50Hz for user study.";
    }
    else
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100024CF0);
      }
      id v19 = (id)qword_10002C540;
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_24;
      }
      id v22 = [v9 dmSampleRate];
      *(_DWORD *)buf = 134349056;
      id v28 = v22;
      long long v21 = "[RMAudioAccessoryManager] current device motion samples per second: %{public}lu";
    }
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
LABEL_24:

LABEL_25:
    objc_sync_exit(v9);
  }
}

void sub_100009BA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009FA0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    objc_sync_enter(v9);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = [v9 managers];
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = [*(id *)(*((void *)&v21 + 1) + 8 * i) activityHandler];
          long long v15 = (void *)v14;
          if (v14) {
            (*(void (**)(uint64_t, id, id))(v14 + 16))(v14, v5, v6);
          }
        }
        id v11 = [v10 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v11);
    }

    double v16 = sub_10000CF5C();
    [v9 setActivitySamplesPerSecond:[v9 activitySamplesPerSecond] + 1];
    [v9 lastActivitySampleTime];
    if (v17 + 1.0 < v16)
    {
      [v9 setActivitySampleRate:[v9 activitySamplesPerSecond]];
      [v9 setActivitySamplesPerSecond:0];
      [v9 setLastActivitySampleTime:v16];
    }
    [v9 lastActivityPrintTime];
    if (v18 + 5.0 < v16)
    {
      [v9 setLastActivityPrintTime:v16];
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100024CF0);
      }
      id v19 = (id)qword_10002C540;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v9 activitySampleRate];
        *(_DWORD *)buf = 134349056;
        id v26 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[RMAudioAccessoryManager] current activity samples per second: %{public}lu", buf, 0xCu);
      }
    }
    objc_sync_exit(v9);
  }
}

void sub_10000A224(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A364(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000A97C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000ADC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000AF6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000B01C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000B0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000B1E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000B284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000B328(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000B3BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000B4F4(id a1)
{
  qword_10002C540 = (uint64_t)os_log_create("com.apple.RelativeMotion", "TempestDataProducer");

  _objc_release_x1();
}

id *sub_10000B538(id *a1, void *a2, char a3)
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)RMHeadphoneMotionProvider;
    CFURLRef v7 = (id *)[super init];
    a1 = v7;
    if (v7)
    {
      *((unsigned char *)v7 + 8) = a3;
      objc_storeStrong(v7 + 2, a2);
    }
  }

  return a1;
}

void sub_10000B698(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    CFStringRef v4 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:0 error:0];
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5) {
        id v6 = *(NSObject **)(v5 + 16);
      }
      else {
        id v6 = 0;
      }
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10000B82C;
      v8[3] = &unk_100024B50;
      id v10 = *(id *)(a1 + 40);
      id v9 = v4;
      dispatch_async(v6, v8);
    }
    else
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100024D38);
      }
      CFURLRef v7 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v12 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to serialize CMDeviceMotion object: %{public}@", buf, 0xCu);
      }
    }
  }
}

uint64_t sub_10000B82C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10000B8C8(id a1)
{
  qword_10002C540 = (uint64_t)os_log_create("com.apple.RelativeMotion", "TempestDataProducer");

  _objc_release_x1();
}

id *sub_10000B90C(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)RMConnectionHandlerInternal;
    id v8 = (id *)[super init];
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a3);
      objc_storeStrong(a1 + 2, a2);
    }
  }

  return a1;
}

void sub_10000B9A8(uint64_t a1)
{
  if (a1)
  {
    sub_100015918(*(void *)(a1 + 16));
    id v2 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    id v3 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = 0;
  }
}

id sub_10000BC80()
{
  if (qword_10002C528 != -1) {
    dispatch_once(&qword_10002C528, &stru_100024DE8);
  }
  v0 = (void *)qword_10002C530;

  return v0;
}

void sub_10000C214(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    if (qword_10002C528 != -1) {
      dispatch_once(&qword_10002C528, &stru_100024DE8);
    }
    p_cache = &OBJC_METACLASS___RMHeadphoneActivityProvider.cache;
    id v9 = qword_10002C530;
    if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "New connection request received", (uint8_t *)&v29, 2u);
    }
    objc_super v10 = [RMConnectionEndpoint alloc];
    id v11 = [*(id *)(a1 + 32) queue];
    id v12 = sub_10001555C((id *)&v10->super.isa, v3, v11);

    if ([*(id *)(a1 + 32) isEndpointConnectionAllowed:v12])
    {
      if (qword_10002C528 != -1) {
        dispatch_once(&qword_10002C528, &stru_100024DE8);
      }
      uint64_t v13 = (void *)qword_10002C530;
      if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = v13;
        sub_100015DE4(v12);
        long long v15 = (char *)objc_claimAutoreleasedReturnValue();
        double v16 = sub_100008DC8(v12);
        unsigned int v17 = sub_100008E14(v12);
        int v29 = 134284035;
        name = v15;
        __int16 v31 = 2114;
        long long v32 = v16;
        __int16 v33 = 1025;
        unsigned int v34 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Accepted connection %{private}p from %{public}@ (%{private}d)", (uint8_t *)&v29, 0x1Cu);
      }
      sub_100015E14(v12, *(void **)(a1 + 32));
      double v18 = [*(id *)(a1 + 32) messageHandlerConstructor];
      id v19 = ((void (**)(void, id *))v18)[2](v18, v12);

      p_cache = sub_100014DC4(v12);

      if (p_cache)
      {
        sub_1000159C0((uint64_t)v12);
        id v20 = sub_10000B90C((id *)[RMConnectionHandlerInternal alloc], v12, v19);
        long long v21 = [*(id *)(a1 + 32) connections];
        [v21 addObject:v20];

LABEL_25:
        goto LABEL_26;
      }
      sub_1000162F8();
    }
    else if (qword_10002C528 == -1)
    {
      goto LABEL_23;
    }
    dispatch_once(&qword_10002C528, &stru_100024DE8);
LABEL_23:
    long long v24 = p_cache[166];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      long long v25 = v24;
      sub_100015DE4(v12);
      id v26 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v27 = sub_100008DC8(v12);
      unsigned int v28 = sub_100008E14(v12);
      int v29 = 134284035;
      name = v26;
      __int16 v31 = 2114;
      long long v32 = v27;
      __int16 v33 = 1025;
      unsigned int v34 = v28;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Denied connection %{private}p from %{public}@ (%{private}d)", (uint8_t *)&v29, 0x1Cu);
    }
    goto LABEL_25;
  }
  uint64_t v5 = type;
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(v3, _xpc_error_key_description);
    if (qword_10002C528 != -1) {
      dispatch_once(&qword_10002C528, &stru_100024DE8);
    }
    long long v23 = qword_10002C530;
    if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_FAULT))
    {
      int v29 = 136315138;
      name = string;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "Got error: %s", (uint8_t *)&v29, 0xCu);
    }
  }
  else
  {
    if (qword_10002C528 != -1) {
      dispatch_once(&qword_10002C528, &stru_100024DE8);
    }
    id v6 = (void *)qword_10002C530;
    if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_FAULT))
    {
      id v7 = v6;
      int v29 = 136315138;
      name = xpc_type_get_name(v5);
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "Unexpected event type %s", (uint8_t *)&v29, 0xCu);
    }
  }
LABEL_26:
}

void sub_10000C748(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) connections];
  id v3 = +[NSArray arrayWithArray:v2];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
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
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        if (v9) {
          uint64_t v10 = *(void *)(v9 + 16);
        }
        else {
          uint64_t v10 = 0;
        }
        (*(void (**)(void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v10);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v11 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      id v6 = v11;
    }
    while (v11);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

void sub_10000C950(id a1, RMConnectionHandlerInternal *a2, unint64_t a3, BOOL *a4)
{
}

void sub_10000CD64(id a1)
{
  qword_10002C530 = (uint64_t)os_log_create("com.apple.RelativeMotion", "IPC");

  _objc_release_x1();
}

void sub_10000CDD4(void *a1, int a2, int a3, int a4, const char *a5, const char *a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  _os_signpost_emit_with_name_impl(a1, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, a5, a6, &buf, 0x26u);
}

void sub_10000CE00(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  _os_log_impl(a1, v13, OS_LOG_TYPE_INFO, a4, &buf, 0x26u);
}

void sub_10000CE20(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint8_t buf)
{
  _os_log_impl(a1, v13, OS_LOG_TYPE_FAULT, a4, &buf, 0x26u);
}

BOOL sub_10000CE40(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_INFO);
}

BOOL sub_10000CE58(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_FAULT);
}

double sub_10000CE70(unint64_t a1)
{
  double v2 = *(double *)&qword_10002C9A0;
  if (*(double *)&qword_10002C9A0 == 0.0)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    if (info.denom)
    {
      uint32_t denom = info.denom;
      uint32_t numer = info.numer;
      do
      {
        uint32_t v5 = denom;
        uint32_t denom = numer % denom;
        uint32_t numer = v5;
      }
      while (denom);
    }
    else
    {
      uint32_t v5 = info.numer;
    }
    unsigned int v6 = 1000000000;
    uint32_t v7 = info.numer / v5;
    do
    {
      uint32_t v8 = v7;
      uint32_t v7 = v6;
      unsigned int v6 = v8 % v6;
    }
    while (v6);
    double v2 = (double)(info.numer / v5 / v7) / (double)(0x3B9ACA00 / v7 * (unint64_t)(info.denom / v5));
    *(double *)&qword_10002C9A0 = v2;
  }
  return v2 * (double)a1;
}

double sub_10000CF34()
{
  uint64_t v0 = mach_absolute_time();

  return sub_10000CE70(v0);
}

double sub_10000CF5C()
{
  uint64_t v0 = mach_continuous_time();

  return sub_10000CE70(v0);
}

void sub_10000D254(uint64_t a1)
{
  uint64_t v2 = mach_absolute_time();
  id v3 = [*(id *)(a1 + 32) receiverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D344;
  block[3] = &unk_100024E10;
  id v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  uint64_t v7 = v2;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v11 = 0;
  dispatch_async(v3, block);
}

void sub_10000D344(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isRunning])
  {
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = +[NSData dataWithBytes:a1 + 48 length:64];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
  }
}

void sub_10000D7CC(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) handler];
  v1[2]();
}

void sub_10000D890(id a1)
{
  qword_10002C540 = (uint64_t)os_log_create("com.apple.RelativeMotion", "TempestDataProducer");

  _objc_release_x1();
}

void sub_10000D918(id a1)
{
  CFBooleanRef v1 = (CFBooleanRef)MGCopyAnswer();
  byte_10002C9A8 = v1 == kCFBooleanTrue;

  CFRelease(v1);
}

void sub_10000D9AC(id a1)
{
  if (_os_feature_enabled_impl()) {
    byte_10002C9B8 = MGIsDeviceOneOfType();
  }
}

void sub_10000DAF4(id a1)
{
  qword_10002C9C8 = objc_opt_new();

  _objc_release_x1();
}

id sub_10000DE80()
{
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100024F70);
  }
  uint64_t v0 = (void *)qword_10002C540;

  return v0;
}

void sub_10000E4C4(id a1)
{
  id v1 = objc_alloc((Class)NSSet);
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  qword_10002C9D8 = (uint64_t)[v1 initWithObjects:v2, v3, v4, v5, v6, v7, objc_opt_class(), 0];

  _objc_release_x1();
}

void sub_10000EA64(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[RBSProcessIdentifier identifierWithPid:sub_100008E14(*(id **)(a1 + 32))];
  uint64_t v5 = +[RBSProcessPredicate predicateMatchingIdentifier:v4];
  long long v15 = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:&v15 count:1];
  [v3 setPredicates:v6];

  uint64_t v7 = +[RBSProcessStateDescriptor descriptor];
  [v3 setStateDescriptor:v7];

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  char v14 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000EC48;
  v8[3] = &unk_100024ED8;
  long long v12 = v13;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  [v3 setUpdateHandler:v8];

  _Block_object_dispose(v13, 8);
}

void sub_10000EC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000EC48(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  uint64_t v7 = [a4 state];
  unsigned int v8 = [v7 taskState];

  if (v8 == 4)
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100024F70);
      }
      long long v12 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v6;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%{public}@ is scheduled, resuming data stream", buf, 0xCu);
      }
      long long v13 = sub_100015A04(*(void *)(a1 + 32));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_10000EF14;
      v14[3] = &unk_100024D88;
      id v11 = &v15;
      id v15 = *(id *)(a1 + 40);
      id v16 = *(id *)(a1 + 48);
      dispatch_async(v13, v14);

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      goto LABEL_15;
    }
  }
  else if (v8 == 3 && *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_100024F70);
    }
    id v9 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      id v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%{public}@ is suspended, pausing data stream", buf, 0xCu);
    }
    id v10 = sub_100015A04(*(void *)(a1 + 32));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000EF0C;
    block[3] = &unk_100024908;
    id v11 = &v18;
    id v18 = *(id *)(a1 + 40);
    dispatch_async(v10, block);

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
LABEL_15:
  }
}

id sub_10000EF0C(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopProducingData];
}

id sub_10000EF14(uint64_t a1)
{
  return [*(id *)(a1 + 32) startProducingDataWithCallback:*(void *)(a1 + 40)];
}

uint64_t sub_10000EF3C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10000F23C(uint64_t a1)
{
  v13[0] = @"client";
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2) {
    uint64_t v2 = (void *)v2[3];
  }
  id v3 = v2;
  v13[1] = @"duration";
  v14[0] = v3;
  double v4 = sub_10000CF5C();
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    double v6 = *(double *)(v5 + 40);
  }
  else {
    double v6 = 0.0;
  }
  uint64_t v7 = +[NSNumber numberWithDouble:v4 - v6];
  v14[1] = v7;
  unsigned int v8 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100024F70);
  }
  id v9 = qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138477827;
    long long v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending analytics: \n%{private}@", (uint8_t *)&v11, 0xCu);
  }

  return v8;
}

void sub_10000F408(id a1)
{
  qword_10002C540 = (uint64_t)os_log_create("com.apple.RelativeMotion", "TempestDataProducer");

  _objc_release_x1();
}

void sub_10000F940(uint64_t a1)
{
  [*(id *)(a1 + 32) setHandler:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) captureContext];
  id v3 = [v2 count];

  if (!v3 && [*(id *)(a1 + 32) configureCaptureSession])
  {
    double v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      double v6 = [*(id *)(a1 + 32) captureQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000FC90;
      block[3] = &unk_100024908;
      void block[4] = *(void *)(a1 + 32);
      dispatch_async(v6, block);
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v7 = [*(id *)(a1 + 32) captureContext];
    id v8 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v27 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          if (([v12 supportsFaceKitMetadata] & 1) == 0)
          {
            [*(id *)(a1 + 32) startFaceKitForContext:v12];
            [v12 faceKit];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v9);
    }

    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_100025058);
    }
    long long v13 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Starting capture session", buf, 2u);
    }
    if (([*(id *)(a1 + 32) isCameraPaused] & 1) == 0)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      char v14 = [*(id *)(a1 + 32) captureContext];
      id v15 = [v14 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v22;
        do
        {
          for (uint64_t j = 0; j != v16; uint64_t j = (char *)j + 1)
          {
            if (*(void *)v22 != v17) {
              objc_enumerationMutation(v14);
            }
            id v19 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)j) captureSession];
            [v19 startRunning];
          }
          id v16 = [v14 countByEnumeratingWithState:&v21 objects:v31 count:16];
        }
        while (v16);
      }
    }
    if (qword_10002C538 != -1) {
      dispatch_once(&qword_10002C538, &stru_100025058);
    }
    id v20 = qword_10002C540;
    if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Started capture session", buf, 2u);
    }
  }
}

void sub_10000FC90(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 facePoseCaptureSessionDidConfigure:*(void *)(a1 + 32)];
}

void sub_10000FDD4(uint64_t a1)
{
  if (qword_10002C538 != -1) {
    dispatch_once(&qword_10002C538, &stru_100025058);
  }
  id v1 = qword_10002C540;
  if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Stopping capture session", buf, 2u);
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v2 = [*(id *)(a1 + 32) captureContext];
  id v3 = [v2 countByEnumeratingWithState:&v44 objects:v52 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v45 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v44 + 1) + 8 * i) captureSession];
        [v7 stopRunning];
      }
      id v4 = [v2 countByEnumeratingWithState:&v44 objects:v52 count:16];
    }
    while (v4);
  }

  [*(id *)(a1 + 32) setHandler:0];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = [*(id *)(a1 + 32) captureContext];
  id v8 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v9; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(obj);
        }
        long long v12 = *(void **)(*((void *)&v40 + 1) + 8 * (void)j);
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v13 = [v12 captureSession];
        char v14 = [v13 inputs];

        id v15 = [v14 countByEnumeratingWithState:&v36 objects:v50 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v37;
          do
          {
            for (k = 0; k != v16; k = (char *)k + 1)
            {
              if (*(void *)v37 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v36 + 1) + 8 * (void)k);
              id v20 = [v12 captureSession];
              [v20 removeInput:v19];
            }
            id v16 = [v14 countByEnumeratingWithState:&v36 objects:v50 count:16];
          }
          while (v16);
        }

        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v21 = [v12 captureSession];
        long long v22 = [v21 outputs];

        id v23 = [v22 countByEnumeratingWithState:&v32 objects:v49 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v33;
          do
          {
            for (m = 0; m != v24; m = (char *)m + 1)
            {
              if (*(void *)v33 != v25) {
                objc_enumerationMutation(v22);
              }
              uint64_t v27 = *(void *)(*((void *)&v32 + 1) + 8 * (void)m);
              long long v28 = [v12 captureSession];
              [v28 removeOutput:v27];
            }
            id v24 = [v22 countByEnumeratingWithState:&v32 objects:v49 count:16];
          }
          while (v24);
        }

        [v12 setCaptureSession:0];
        [v12 setCaptureDeviceInput:0];
        [v12 setVideoDataOutput:0];
        [v12 setMetadataOutput:0];
        [*(id *)(a1 + 32) stopFaceKitForContext:v12];
      }
      id v9 = [obj countByEnumeratingWithState:&v40 objects:v51 count:16];
    }
    while (v9);
  }

  long long v29 = [*(id *)(a1 + 32) captureContext];
  [v29 removeAllObjects];
}

void sub_100010260(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(unsigned char *)(v1 + 8) = v2;
    if (*(unsigned char *)(a1 + 40))
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100025058);
      }
      id v4 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Pausing capture session", buf, 2u);
      }
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v5 = [*(id *)(a1 + 32) captureContext];
      id v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v24;
        do
        {
          id v9 = 0;
          do
          {
            if (*(void *)v24 != v8) {
              objc_enumerationMutation(v5);
            }
            uint64_t v10 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)v9) captureSession];
            [v10 stopRunning];

            id v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v7 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
        }
        while (v7);
      }
    }
    else
    {
      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100025058);
      }
      int v11 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Resuming capture session", buf, 2u);
      }
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      long long v12 = [*(id *)(a1 + 32) captureContext];
      id v13 = [v12 countByEnumeratingWithState:&v19 objects:v28 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          id v16 = 0;
          do
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = [*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) captureSession];
            [v17 startRunning];

            id v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v19 objects:v28 count:16];
        }
        while (v14);
      }

      if (qword_10002C538 != -1) {
        dispatch_once(&qword_10002C538, &stru_100025058);
      }
      id v18 = qword_10002C540;
      if (os_log_type_enabled((os_log_t)qword_10002C540, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Resumed capture session", buf, 2u);
      }
    }
  }
}

void sub_100011D20(_Unwind_Exception *a1)
{
}

void sub_100011D6C(uint64_t a1, uint64_t a2, void *a3)
{
  id v22 = a3;
  +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", a2);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v21 = long long v26 = 0u;
  uint64_t v5 = [v21 devices];
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v24 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v23 + 1) + 8 * v9);
      int v11 = [*(id *)(a1 + 32) captureContext];
      id v12 = [v11 count];
      id v13 = [*(id *)(a1 + 32) maxNumberOfCameras];

      if (v12 >= v13) {
        break;
      }
      if (([v10 isContinuityCamera] & 1) == 0)
      {
        AVCaptureDeviceType v14 = [v10 deviceType];
        if (v14 != AVCaptureDeviceTypeExternal)
        {

LABEL_11:
          uint64_t v17 = objc_opt_new();
          ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          [v17 setCameraID:];
          [v17 setMediaType:v22];
          [v17 setCaptureDevice:v10];
          id v18 = [v10 deviceType];
          if (v18 == AVCaptureDeviceTypeExternal)
          {
            [v17 setBuiltInCamera:0];
          }
          else
          {
            AVCaptureDeviceType v19 = [v10 deviceType];
            [v17 setBuiltInCamera:v19 != AVCaptureDeviceTypeContinuityCamera];
          }
          long long v20 = [*(id *)(a1 + 32) captureContext];
          [v20 addObject:v17];

          goto LABEL_15;
        }
        uint64_t v15 = [v10 localizedName];
        unsigned int v16 = [v15 containsString:@"Display"];

        if (v16) {
          goto LABEL_11;
        }
      }
LABEL_15:
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

void sub_1000129AC(_Unwind_Exception *a1)
{
}

uint64_t sub_1000129E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000129F8(uint64_t a1)
{
}

uint64_t sub_100012A00(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 results];

  return _objc_release_x1();
}

uint64_t sub_100012A4C(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 results];

  return _objc_release_x1();
}

void sub_100012A98(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:kCVAFaceTracking_TrackedFacesArray];
  id v4 = v3;
  if (v3 && [v3 count])
  {
    uint64_t v5 = objc_opt_new();
    id v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) cameraID]);
    [v5 setObject:v6 forKeyedSubscript:@"rm_camera_id"];

    id v7 = [*(id *)(a1 + 32) captureDevice];
    uint64_t v8 = [v7 localizedName];
    [v5 setObject:v8 forKeyedSubscript:@"rm_camera_device_name"];

    uint64_t v9 = [*(id *)(a1 + 32) captureDevice];
    uint64_t v10 = [v9 modelID];
    [v5 setObject:v10 forKeyedSubscript:@"rm_camera_device_model_id"];

    int v11 = [*(id *)(a1 + 32) captureDevice];
    id v12 = [v11 uniqueID];
    [v5 setObject:v12 forKeyedSubscript:@"rm_camera_device_id"];

    id v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) isBuiltInCamera]);
    [v5 setObject:v13 forKeyedSubscript:@"rm_built_in"];

    [v5 setObject:v4 forKeyedSubscript:@"rm_tracked_faces"];
    AVCaptureDeviceType v14 = [*(id *)(a1 + 32) videoDataOutput];
    uint64_t v15 = +[NSNumber numberWithInt:v14 != 0];
    [v5 setObject:v15 forKeyedSubscript:@"rm_has_video_data_output"];

    unsigned int v16 = [*(id *)(a1 + 32) metadataOutput];
    uint64_t v17 = +[NSNumber numberWithInt:v16 != 0];
    [v5 setObject:v17 forKeyedSubscript:@"rm_has_metadata_output"];

    id v18 = [*(id *)(a1 + 40) captureQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100012D60;
    block[3] = &unk_100025010;
    void block[4] = *(void *)(a1 + 40);
    id v21 = v5;
    long long v22 = *(_OWORD *)(a1 + 48);
    uint64_t v23 = *(void *)(a1 + 64);
    id v19 = v5;
    dispatch_async(v18, block);
  }
}

void sub_100012D60(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) handler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) handler];
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = (void (*)(void *, uint64_t, long long *))v3[2];
    long long v6 = *(_OWORD *)(a1 + 48);
    uint64_t v7 = *(void *)(a1 + 64);
    v5(v3, v4, &v6);
  }
}

void sub_100013E94(id a1)
{
  qword_10002C540 = (uint64_t)os_log_create("com.apple.RelativeMotion", "TempestDataProducer");

  _objc_release_x1();
}

id sub_100013ED8()
{
  if (qword_10002CA30 != -1) {
    dispatch_once(&qword_10002CA30, &stru_100025078);
  }
  uint64_t v0 = (void *)qword_10002CA28;

  return v0;
}

void sub_100013F2C(id a1)
{
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v4 lastObject];
  uint64_t v2 = +[NSString stringWithFormat:@"%@/%s", v1, "com.apple.relatived"];
  id v3 = (void *)qword_10002CA28;
  qword_10002CA28 = v2;
}

void sub_100013FC4()
{
  if (qword_10002C518 != -1) {
    dispatch_once(&qword_10002C518, &stru_100025268);
  }
  uint64_t v0 = qword_10002C520;
  if (os_log_type_enabled((os_log_t)qword_10002C520, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "relatived exiting", v5, 2u);
  }
  dispatch_sync((dispatch_queue_t)qword_10002C9F0, &stru_100025098);
  dispatch_sync((dispatch_queue_t)qword_10002CA00, &stru_1000250B8);
  dispatch_sync((dispatch_queue_t)qword_10002CA10, &stru_1000250D8);
  dispatch_sync((dispatch_queue_t)qword_10002CA20, &stru_1000250F8);
  uint64_t v1 = (void *)qword_10002C9F0;
  qword_10002C9F0 = 0;

  uint64_t v2 = (void *)qword_10002CA00;
  qword_10002CA00 = 0;

  id v3 = (void *)qword_10002CA10;
  qword_10002CA10 = 0;

  id v4 = (void *)qword_10002CA20;
  qword_10002CA20 = 0;
}

void sub_1000140D8(id a1)
{
  [(id)qword_10002C9E8 invalidate];
  uint64_t v1 = (void *)qword_10002C9E8;
  qword_10002C9E8 = 0;
}

void sub_100014118(id a1)
{
  [(id)qword_10002C9F8 invalidate];
  uint64_t v1 = (void *)qword_10002C9F8;
  qword_10002C9F8 = 0;
}

void sub_100014158(id a1)
{
  [(id)qword_10002CA08 invalidate];
  uint64_t v1 = (void *)qword_10002CA08;
  qword_10002CA08 = 0;
}

void sub_100014198(id a1)
{
  [(id)qword_10002CA18 invalidate];
  uint64_t v1 = (void *)qword_10002CA18;
  qword_10002CA18 = 0;
}

uint64_t start()
{
  if (qword_10002C518 != -1) {
    dispatch_once(&qword_10002C518, &stru_100025268);
  }
  uint64_t v0 = qword_10002C520;
  if (os_log_type_enabled((os_log_t)qword_10002C520, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "relatived starting", (uint8_t *)&v20, 2u);
  }
  memset(&v20, 0, sizeof(v20));
  sub_100013ED8();
  id v1 = objc_claimAutoreleasedReturnValue();
  if (stat((const char *)[v1 UTF8String], &v20))
  {
    if (*__error() == 2)
    {
      id v2 = v1;
      if (mkdir((const char *)[v2 UTF8String], 0x1E4u))
      {
        if (qword_10002C518 != -1) {
          dispatch_once(&qword_10002C518, &stru_100025268);
        }
        id v3 = (void *)qword_10002C520;
        if (os_log_type_enabled((os_log_t)qword_10002C520, OS_LOG_TYPE_ERROR))
        {
          id v4 = v3;
          uint64_t v5 = __error();
          long long v6 = strerror(*v5);
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v2;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = v6;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error trying to create our cache directory (%@): %s", buf, 0x16u);
        }
      }
    }
    else
    {
      if (qword_10002C518 != -1) {
        dispatch_once(&qword_10002C518, &stru_100025268);
      }
      uint64_t v7 = (void *)qword_10002C520;
      if (os_log_type_enabled((os_log_t)qword_10002C520, OS_LOG_TYPE_ERROR))
      {
        uint64_t v8 = v7;
        uint64_t v9 = __error();
        uint64_t v10 = strerror(*v9);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v1;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Unexpected while checking for prsence of our cache directory (%@): %s", buf, 0x16u);
      }
    }
  }
  dispatch_queue_t v11 = dispatch_queue_create("Tempest", 0);
  id v12 = (void *)qword_10002C9F0;
  qword_10002C9F0 = (uint64_t)v11;

  dispatch_queue_t v13 = dispatch_queue_create("Public", 0);
  AVCaptureDeviceType v14 = (void *)qword_10002CA00;
  qword_10002CA00 = (uint64_t)v13;

  dispatch_queue_t v15 = dispatch_queue_create("Control", 0);
  unsigned int v16 = (void *)qword_10002CA10;
  qword_10002CA10 = (uint64_t)v15;

  dispatch_queue_t v17 = dispatch_queue_create("Status", 0);
  id v18 = (void *)qword_10002CA20;
  qword_10002CA20 = (uint64_t)v17;

  dispatch_async((dispatch_queue_t)qword_10002C9F0, &stru_100025118);
  dispatch_async((dispatch_queue_t)qword_10002CA00, &stru_100025178);
  dispatch_async((dispatch_queue_t)qword_10002CA10, &stru_1000251B8);
  dispatch_async((dispatch_queue_t)qword_10002CA20, &stru_100025218);
  *(_OWORD *)buf = off_100025258;
  sigaction(2, (const sigaction *)buf, 0);
  sigaction(3, (const sigaction *)buf, 0);
  sigaction(15, (const sigaction *)buf, 0);
  CFRunLoopRun();
  sub_100013FC4();

  return 0;
}

void sub_10001453C(id a1)
{
  id v1 = [RMConnectionListener alloc];
  id v2 = [(RMConnectionListener *)v1 initWithQueue:qword_10002C9F0 entitlement:@"com.apple.developer.coremotion.head-pose" messageHandlerConstructor:&stru_100025158];
  id v3 = (void *)qword_10002C9E8;
  qword_10002C9E8 = (uint64_t)v2;

  [(id)qword_10002C9E8 setDeprecatedEntitlement:@"com.apple.relatived.tempest"];
  id v4 = (void *)qword_10002C9E8;

  [v4 startListeningForService:@"com.apple.relatived.tempest"];
}

RMConnectionStreamProducingDelegate *__cdecl sub_1000145BC(id a1, RMConnectionEndpoint *a2)
{
  id v2 = a2;
  id v3 = [[RMDataStreamHandler alloc] initWithEndpoint:v2 isInternal:1];

  return (RMConnectionStreamProducingDelegate *)v3;
}

void sub_100014618(id a1)
{
  id v1 = [RMConnectionListener alloc];
  id v2 = [(RMConnectionListener *)v1 initWithQueue:qword_10002CA00 entitlement:@"com.apple.locationd.activity" tccService:kTCCServiceMotion messageHandlerConstructor:&stru_100025198];
  id v3 = (void *)qword_10002C9F8;
  qword_10002C9F8 = (uint64_t)v2;

  id v4 = (void *)qword_10002C9F8;

  [v4 startListeningForService:@"com.apple.relatived.public"];
}

RMConnectionStreamProducingDelegate *__cdecl sub_100014694(id a1, RMConnectionEndpoint *a2)
{
  id v2 = a2;
  id v3 = [[RMDataStreamHandler alloc] initWithEndpoint:v2 isInternal:0];

  return (RMConnectionStreamProducingDelegate *)v3;
}

void sub_1000146F0(id a1)
{
  id v1 = [RMConnectionListener alloc];
  id v2 = [(RMConnectionListener *)v1 initWithQueue:qword_10002CA10 entitlement:@"com.apple.relatived.internal" messageHandlerConstructor:&stru_1000251F8];
  id v3 = (void *)qword_10002CA08;
  qword_10002CA08 = (uint64_t)v2;

  id v4 = (void *)qword_10002CA08;

  [v4 startListeningForService:@"com.apple.relatived.internal"];
}

RMConnectionDataDelegate *__cdecl sub_100014760(id a1, RMConnectionEndpoint *a2)
{
  id v2 = a2;
  id v3 = [RMInternalServiceHandler alloc];
  id v4 = [(RMInternalServiceHandler *)v3 initWithEndpoint:v2 managedListener:qword_10002C9F8];

  return (RMConnectionDataDelegate *)v4;
}

void sub_1000147C0(id a1)
{
  id v1 = [RMConnectionListener alloc];
  id v2 = [(RMConnectionListener *)v1 initWithQueue:qword_10002CA20 entitlement:0 messageHandlerConstructor:&stru_100025238];
  id v3 = (void *)qword_10002CA18;
  qword_10002CA18 = (uint64_t)v2;

  id v4 = (void *)qword_10002CA18;

  [v4 startListeningForService:@"com.apple.relatived.status"];
}

RMConnectionStreamProducingDelegate *__cdecl sub_10001482C(id a1, RMConnectionEndpoint *a2)
{
  id v2 = a2;
  id v3 = [[RMDataStreamHandler alloc] initWithEndpoint:v2 isInternal:0];

  return (RMConnectionStreamProducingDelegate *)v3;
}

void sub_100014888(unsigned int a1)
{
  if (a1 <= 0xF && ((1 << a1) & 0x800C) != 0)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopStop(Main);
  }
}

void sub_1000148D0(id a1)
{
  qword_10002C520 = (uint64_t)os_log_create("com.apple.RelativeMotion", "Daemon");

  _objc_release_x1();
}

void sub_100014914(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v13 = a4;
  if (a1)
  {
    id v7 = a3;
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    id v9 = v7;
    uint64_t v10 = (const char *)[v9 UTF8String];

    xpc_dictionary_set_string(reply, "kRMConnectionMessageNameKey", v10);
    if (v13)
    {
      id v11 = v13;
      xpc_object_t v12 = xpc_data_create([v11 bytes], (size_t)[v11 length]);
      xpc_dictionary_set_value(reply, "kRMConnectionMessageDataKey", v12);
    }
    xpc_connection_send_message(*(xpc_connection_t *)(a1 + 56), reply);
  }
}

BOOL sub_100014A08(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  long long v6 = v5;
  if (!a1)
  {
    BOOL v20 = 0;
    goto LABEL_30;
  }
  if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_endpoint)
  {
    if (qword_10002C528 != -1) {
      dispatch_once(&qword_10002C528, &stru_100025338);
    }
    id v7 = qword_10002C530;
    if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "The client did not send streaming endpoint correctly", (uint8_t *)&v22, 2u);
    }
    BOOL v8 = 0;
    goto LABEL_29;
  }
  id WeakRetained = (_xpc_endpoint_s *)objc_loadWeakRetained((id *)(a1 + 24));
  xpc_connection_t v10 = xpc_connection_create_from_endpoint(v6);
  if (v10)
  {
    id v11 = (void **)(a1 + 32);
    objc_storeStrong((id *)(a1 + 32), v10);
    if ((sub_100014DF4(a1, WeakRetained) & 1) == 0)
    {
      BOOL v8 = a3 != 0;
      if (a3)
      {
        if (qword_10002C528 != -1) {
          dispatch_once(&qword_10002C528, &stru_100025338);
        }
        xpc_object_t v12 = qword_10002C530;
        if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_ERROR))
        {
          int v22 = 138412290;
          uint64_t v23 = WeakRetained;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to start the streaming with handler %@", (uint8_t *)&v22, 0xCu);
        }
        *a3 = +[NSError errorWithDomain:@"RMConnectionStreaming" code:-2 userInfo:0];
      }
      if (qword_10002C528 != -1) {
        dispatch_once(&qword_10002C528, &stru_100025338);
      }
      id v13 = (void *)qword_10002C530;
      if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_DEFAULT))
      {
        AVCaptureDeviceType v14 = *(_xpc_endpoint_s **)(a1 + 56);
        uint64_t v15 = *(void *)(a1 + 32);
        int v22 = 134283777;
        uint64_t v23 = v14;
        __int16 v24 = 2049;
        uint64_t v25 = v15;
        unsigned int v16 = v14;
        dispatch_queue_t v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Cancelling the streaming server connection %{private}p.%{private}p", (uint8_t *)&v22, 0x16u);
      }
      xpc_connection_cancel(v10);
      id v18 = *v11;
      *id v11 = 0;

      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (qword_10002C528 != -1) {
    dispatch_once(&qword_10002C528, &stru_100025338);
  }
  id v19 = qword_10002C530;
  if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_ERROR))
  {
    int v22 = 138412290;
    uint64_t v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to create connection from endpoint %@", (uint8_t *)&v22, 0xCu);
  }
  if (!a3)
  {
LABEL_27:
    BOOL v8 = 0;
    goto LABEL_28;
  }
  *a3 = +[NSError errorWithDomain:@"RMConnectionStreaming" code:-1 userInfo:0];
  BOOL v8 = 1;
LABEL_28:

LABEL_29:
  BOOL v20 = !v8;
LABEL_30:

  return v20;
}

id sub_100014D70()
{
  if (qword_10002C528 != -1) {
    dispatch_once(&qword_10002C528, &stru_100025338);
  }
  uint64_t v0 = (void *)qword_10002C530;

  return v0;
}

id *sub_100014DC4(id *WeakRetained)
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 3);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

id sub_100014DF4(uint64_t a1, void *a2)
{
  if (!a1) {
    return 0;
  }
  id v3 = *(_xpc_connection_s **)(a1 + 32);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100015A10;
  handler[3] = &unk_100024D60;
  handler[4] = a1;
  id v4 = a2;
  xpc_connection_set_event_handler(v3, handler);
  uint64_t v5 = *(NSObject **)(a1 + 8);
  long long v6 = (_xpc_connection_s *)*(id *)(a1 + 32);
  xpc_connection_set_target_queue(v6, v5);

  xpc_connection_resume(*(xpc_connection_t *)(a1 + 32));
  xpc_object_t v7 = xpc_string_create("kRMConnectionMessageDataStream");
  keys = "kRMConnectionMessageNameKey";
  id v8 = v7;
  xpc_object_t values = v8;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100015C94;
  v18[3] = &unk_1000252B8;
  v18[4] = a1;
  xpc_object_t v9 = xpc_dictionary_create((const char *const *)&keys, &values, 1uLL);
  id v19 = v9;
  id v10 = [v4 endpoint:a1 shouldStartStreamingDataToReceiver:v18];

  if (qword_10002C528 != -1) {
    dispatch_once(&qword_10002C528, &stru_100025338);
  }
  id v11 = (void *)qword_10002C530;
  if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_DEBUG))
  {
    xpc_object_t v12 = *(void **)(a1 + 56);
    uint64_t v13 = *(void *)(a1 + 32);
    AVCaptureDeviceType v14 = "NO";
    if (v10) {
      AVCaptureDeviceType v14 = "YES";
    }
    *(_DWORD *)buf = 134284035;
    int v22 = v12;
    __int16 v23 = 2049;
    uint64_t v24 = v13;
    __int16 v25 = 2080;
    long long v26 = v14;
    id v15 = v12;
    unsigned int v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "shouldStartStreamingDataToReceiver returned on streaming server connection %{private}p.%{private}p: %s", buf, 0x20u);
  }
  return v10;
}

void sub_100015068(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  long long v6 = a3;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    id v8 = +[NSString stringWithUTF8String:xpc_dictionary_get_string(v5, "kRMConnectionMessageNameKey")];
    xpc_object_t v9 = xpc_dictionary_get_value(v5, "kRMConnectionMessageDataKey");
    id v10 = v9;
    if (v9)
    {
      id bytes_ptr = (id)xpc_data_get_bytes_ptr(v9);
      if (bytes_ptr) {
        id bytes_ptr = [objc_alloc((Class)NSData) initWithBytes:bytes_ptr length:xpc_data_get_length(v10)];
      }
    }
    else
    {
      id bytes_ptr = 0;
    }
    uint64_t v12 = xpc_dictionary_get_value(v5, "kRMConnectionRequestSteamingKey");
    uint64_t v13 = (void *)v12;
    if (v8)
    {
      if (!v12)
      {
        if (v6)
        {
          v6[2](v6, v8, bytes_ptr);
          goto LABEL_31;
        }
        if ([v8 isEqualToString:@"kRMConnectionMessagePriorityBoost"])
        {
          if (qword_10002C528 != -1) {
            dispatch_once(&qword_10002C528, &stru_100025338);
          }
          long long v29 = qword_10002C530;
          if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            long long v39 = v8;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Creating reply to hold onto priority boost: %{private}@", buf, 0xCu);
          }
          xpc_object_t reply = xpc_dictionary_create_reply(v5);
          __int16 v31 = *(void **)(a1 + 64);
          *(void *)(a1 + 64) = reply;
        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            if (qword_10002C528 != -1) {
              dispatch_once(&qword_10002C528, &stru_100025338);
            }
            uint64_t v32 = qword_10002C530;
            if (!os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_FAULT)) {
              goto LABEL_31;
            }
            *(_WORD *)buf = 0;
            uint64_t v24 = "Message received but the handler doesn't implement the selector 'endpoint:didReceiveMessage:withData:replyBlock:'";
            __int16 v25 = v32;
            os_log_type_t v26 = OS_LOG_TYPE_FAULT;
            uint32_t v27 = 2;
            goto LABEL_14;
          }
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_100015548;
          v34[3] = &unk_100025290;
          v34[4] = a1;
          id v35 = v5;
          [WeakRetained endpoint:a1 didReceiveMessage:v8 withData:bytes_ptr replyBlock:v34];
          __int16 v31 = v35;
        }

        goto LABEL_31;
      }
      if ([WeakRetained conformsToProtocol:&OBJC_PROTOCOL___RMConnectionStreamProducingDelegate])
      {
        [WeakRetained endpoint:a1 didReceiveStreamingRequest:v8 withData:bytes_ptr];
        id v37 = 0;
        sub_100014A08(a1, v13, &v37);
        id v14 = v37;
        if (v14)
        {
          id v15 = v14;
          id v36 = v14;
          unsigned int v16 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:1 error:&v36];
          long long v33 = v10;
          dispatch_queue_t v17 = v8;
          id v18 = v13;
          id v19 = bytes_ptr;
          id v20 = WeakRetained;
          id v21 = v6;
          id v22 = v36;

          sub_100014914(a1, v5, @"kRMConnectionMessageError", v16);
          long long v6 = v21;
          id WeakRetained = v20;
          id bytes_ptr = v19;
          uint64_t v13 = v18;
          id v8 = v17;
          id v10 = v33;
        }
        else
        {
          if (qword_10002C528 != -1) {
            dispatch_once(&qword_10002C528, &stru_100025338);
          }
          long long v28 = qword_10002C530;
          if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Streaming session started, sending acknowledgement", buf, 2u);
          }
          sub_100014914(a1, v5, @"kRMConnectionMessageSuccess", 0);
        }
        goto LABEL_31;
      }
      sub_1000169D0();
    }
    else if (qword_10002C528 == -1)
    {
LABEL_12:
      uint64_t v23 = qword_10002C530;
      if (!os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_ERROR))
      {
LABEL_31:

        goto LABEL_32;
      }
      *(_DWORD *)buf = 136315138;
      long long v39 = "kRMConnectionMessageNameKey";
      uint64_t v24 = "XPC message missing key \"%s\"";
      __int16 v25 = v23;
      os_log_type_t v26 = OS_LOG_TYPE_ERROR;
      uint32_t v27 = 12;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v25, v26, v24, buf, v27);
      goto LABEL_31;
    }
    dispatch_once(&qword_10002C528, &stru_100025338);
    goto LABEL_12;
  }
LABEL_32:
}

void sub_100015548(uint64_t a1, void *a2, void *a3)
{
}

id *sub_10001555C(id *a1, void *a2, void *a3)
{
  long long v6 = a2;
  xpc_object_t v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)RMConnectionEndpoint;
    id v8 = (id *)[super init];
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 7, a2);
      objc_storeStrong(a1 + 1, a3);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100015668;
      handler[3] = &unk_100024D60;
      a1 = a1;
      id v11 = a1;
      xpc_connection_set_event_handler(v6, handler);
      xpc_connection_set_target_queue(v6, v7);
    }
  }

  return a1;
}

void sub_100015668(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_interrupted)
    {
      if (qword_10002C528 != -1) {
        dispatch_once(&qword_10002C528, &stru_100025338);
      }
      xpc_object_t v9 = (void *)qword_10002C530;
      if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        if (v10) {
          uint64_t v10 = *(void *)(v10 + 56);
        }
        int v12 = 134283521;
        uint64_t v13 = v10;
        id v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "#Warning Messaging connection %{private}p interrupted!", (uint8_t *)&v12, 0xCu);
      }
      sub_1000158C0(*(void *)(a1 + 32));
    }
    else if (v3 == &_xpc_error_connection_invalid)
    {
      if (qword_10002C528 != -1) {
        dispatch_once(&qword_10002C528, &stru_100025338);
      }
      long long v6 = (void *)qword_10002C530;
      if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        if (v7) {
          uint64_t v7 = *(void *)(v7 + 56);
        }
        int v12 = 134283521;
        uint64_t v13 = v7;
        id v8 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "#Warning Messaging connection %{private}p invalidated!", (uint8_t *)&v12, 0xCu);
      }
      sub_100015918(*(void *)(a1 + 32));
    }
  }
  else if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    sub_100015068(*(void *)(a1 + 32), v3, 0);
  }
  else
  {
    if (qword_10002C528 != -1) {
      dispatch_once(&qword_10002C528, &stru_100025338);
    }
    id v5 = qword_10002C530;
    if (os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Got unexpected xpc event", (uint8_t *)&v12, 2u);
    }
  }
}

void sub_1000158C0(uint64_t a1)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    [WeakRetained endpointWasInterrupted:a1];
  }
}

void sub_100015918(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id v2 = *(void **)(a1 + 64);
    *(void *)(a1 + 64) = 0;

    if (*(void *)(a1 + 32)) {
      sub_100015BF8(a1);
    }
    if (*(void *)(a1 + 40)) {
      sub_100015D44(a1);
    }
    if (*(void *)(a1 + 56))
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 56));
      id v3 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    [WeakRetained endpointWasInvalidated:a1];
  }
}

void sub_1000159C0(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    id v2 = *(_xpc_connection_s **)(a1 + 56);
    xpc_connection_resume(v2);
  }
}

uint64_t sub_100015A04(uint64_t result)
{
  if (result) {
    return *(void *)(result + 8);
  }
  return result;
}

void sub_100015A10(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_interrupted)
    {
      if (qword_10002C528 != -1) {
        dispatch_once(&qword_10002C528, &stru_100025338);
      }
      uint64_t v10 = (void *)qword_10002C530;
      if (!os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      id v11 = *(void **)(a1 + 32);
      if (v11) {
        id v11 = (void *)v11[7];
      }
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12) {
        uint64_t v12 = *(void *)(v12 + 32);
      }
      int v13 = 134283777;
      id v14 = v11;
      __int16 v15 = 2049;
      uint64_t v16 = v12;
      uint64_t v7 = v11;
      id v8 = v10;
      xpc_object_t v9 = "#Warning Streaming server connection %{private}p.%{private}p interrupted!";
    }
    else
    {
      if (object != &_xpc_error_connection_invalid) {
        return;
      }
      if (qword_10002C528 != -1) {
        dispatch_once(&qword_10002C528, &stru_100025338);
      }
      id v4 = (void *)qword_10002C530;
      if (!os_log_type_enabled((os_log_t)qword_10002C530, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_21;
      }
      id v5 = *(void **)(a1 + 32);
      if (v5) {
        id v5 = (void *)v5[7];
      }
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6) {
        uint64_t v6 = *(void *)(v6 + 32);
      }
      int v13 = 134283777;
      id v14 = v5;
      __int16 v15 = 2049;
      uint64_t v16 = v6;
      uint64_t v7 = v5;
      id v8 = v4;
      xpc_object_t v9 = "#Warning Streaming server connection %{private}p.%{private}p invalidated!";
    }
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v13, 0x16u);

LABEL_21:
    sub_100015BF8(*(void *)(a1 + 32));
  }
}

void sub_100015BF8(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(void *)(a1 + 32))
    {
      xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 32), &stru_1000252F8);
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
      id v2 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;

      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
      [WeakRetained endpointShouldStopStreamingData:a1];
    }
    else
    {
      sub_100016AF0();
    }
  }
}

void sub_100015C94(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v4 = *(void *)(v4 + 32);
  }
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    id v9 = v3;
    id v6 = v3;
    xpc_dictionary_set_data(v5, "kRMConnectionMessageDataStreamKey", [v6 bytes], (size_t)[v6 length]);
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      id v8 = *(_xpc_connection_s **)(v7 + 32);
    }
    else {
      id v8 = 0;
    }
    xpc_connection_send_message(v8, *(xpc_object_t *)(a1 + 40));
    id v3 = v9;
  }
}

void sub_100015D44(uint64_t a1)
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (*(void *)(a1 + 40))
    {
      xpc_connection_suspend(*(xpc_connection_t *)(a1 + 40));
      xpc_connection_set_event_handler(*(xpc_connection_t *)(a1 + 40), &stru_100025318);
      xpc_connection_resume(*(xpc_connection_t *)(a1 + 40));
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 40));
      id v2 = *(void **)(a1 + 40);
      *(void *)(a1 + 40) = 0;
    }
    if (*(void *)(a1 + 48))
    {
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 48));
      id v3 = *(void **)(a1 + 48);
      *(void *)(a1 + 4_Block_object_dispose(&STACK[0x220], 8) = 0;
    }
  }
}

id *sub_100015DE4(id *a1)
{
  if (a1)
  {
    a1 = (id *)a1[7];
    uint64_t v1 = vars8;
  }
  return a1;
}

id *sub_100015E14(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 2, a2);
  }
  return result;
}

id *sub_100015E24(id *result, void *a2)
{
  if (result) {
    return (id *)objc_storeWeak(result + 3, a2);
  }
  return result;
}

void sub_100015EB8(id a1)
{
  qword_10002C530 = (uint64_t)os_log_create("com.apple.RelativeMotion", "IPC");

  _objc_release_x1();
}

uint64_t sub_100015F10()
{
  uint64_t v1 = sub_10000BC80();
  if (sub_10000CE58(v1))
  {
    sub_10000CDA8();
    sub_10000CE20((void *)&_mh_execute_header, v2, v3, "{\"msg%{public}.0s\":\"Entitlement cannot be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  id v8 = sub_10000BC80();
  if (os_signpost_enabled(v8))
  {
    sub_10000CDA8();
    sub_10000CDD4((void *)&_mh_execute_header, v9, v10, v11, "Entitlement cannot be nil", "{\"msg%{public}.0s\":\"Entitlement cannot be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  id v14 = sub_10000BC80();
  if (sub_10000CE40(v14))
  {
    sub_10000CDA8();
    sub_10000CE00((void *)&_mh_execute_header, v15, v16, "{\"msg%{public}.0s\":\"Entitlement cannot be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  uint64_t v21 = abort_report_np();
  return sub_100016034(v21);
}

uint64_t sub_100016034()
{
  uint64_t v1 = sub_10000BC80();
  if (sub_10000CE58(v1))
  {
    sub_10000CDA8();
    sub_10000CE20((void *)&_mh_execute_header, v2, v3, "{\"msg%{public}.0s\":\"TCC service cannot be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  id v8 = sub_10000BC80();
  if (os_signpost_enabled(v8))
  {
    sub_10000CDA8();
    sub_10000CDD4((void *)&_mh_execute_header, v9, v10, v11, "TCC service cannot be nil", "{\"msg%{public}.0s\":\"TCC service cannot be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  id v14 = sub_10000BC80();
  if (sub_10000CE40(v14))
  {
    sub_10000CDA8();
    sub_10000CE00((void *)&_mh_execute_header, v15, v16, "{\"msg%{public}.0s\":\"TCC service cannot be nil\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  uint64_t v21 = abort_report_np();
  return sub_100016158(v21);
}

void sub_100016158()
{
  uint64_t v1 = sub_10000BC80();
  if (sub_10000CE58(v1))
  {
    sub_10000CDA8();
    sub_10000CE20((void *)&_mh_execute_header, v2, v3, "{\"msg%{public}.0s\":\"TCC service exists and entitlement does not!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v22, v23, v24, v25, v26);
  }

  id v8 = sub_10000BC80();
  if (os_signpost_enabled(v8))
  {
    sub_10000CDA8();
    sub_10000CDD4((void *)&_mh_execute_header, v9, v10, v11, "TCC service exists and entitlement does not!", "{\"msg%{public}.0s\":\"TCC service exists and entitlement does not!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v22, v23, v24, v25, v26);
  }

  id v14 = sub_10000BC80();
  if (sub_10000CE40(v14))
  {
    sub_10000CDA8();
    sub_10000CE00((void *)&_mh_execute_header, v15, v16, "{\"msg%{public}.0s\":\"TCC service exists and entitlement does not!\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v22, v23, v24, v25, v26);
  }

  uint64_t v21 = abort_report_np();
  sub_10001627C(v21);
}

void sub_10001627C(uint64_t a1)
{
  int v2 = sub_10000BC80();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v3 = 138477827;
    uint64_t v4 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Couldn't create XPC service for %{private}@", (uint8_t *)&v3, 0xCu);
  }

  abort();
}

uint64_t sub_1000162F8()
{
  uint64_t v1 = sub_10000BC80();
  if (sub_10000CE58(v1))
  {
    sub_10000CDA8();
    sub_10000CE20((void *)&_mh_execute_header, v2, v3, "{\"msg%{public}.0s\":\"The messageHandler didn't set the endpoint delegate at creation\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  id v8 = sub_10000BC80();
  if (os_signpost_enabled(v8))
  {
    sub_10000CDA8();
    sub_10000CDD4((void *)&_mh_execute_header, v9, v10, v11, "The messageHandler didn't set the endpoint delegate at creation", "{\"msg%{public}.0s\":\"The messageHandler didn't set the endpoint delegate at creation\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  id v14 = sub_10000BC80();
  if (sub_10000CE40(v14))
  {
    sub_10000CDA8();
    sub_10000CE00((void *)&_mh_execute_header, v15, v16, "{\"msg%{public}.0s\":\"The messageHandler didn't set the endpoint delegate at creation\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  uint64_t v21 = abort_report_np();
  return sub_10001641C(v21);
}

uint64_t sub_10001641C()
{
  uint64_t v1 = sub_10000BC80();
  if (sub_10000CE58(v1))
  {
    sub_10000CDA8();
    sub_10000CE20((void *)&_mh_execute_header, v2, v3, "{\"msg%{public}.0s\":\"Endpoint invalidated with no dataDelegate in place\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  id v8 = sub_10000BC80();
  if (os_signpost_enabled(v8))
  {
    sub_10000CDA8();
    sub_10000CDD4((void *)&_mh_execute_header, v9, v10, v11, "Endpoint invalidated with no dataDelegate in place", "{\"msg%{public}.0s\":\"Endpoint invalidated with no dataDelegate in place\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  id v14 = sub_10000BC80();
  if (sub_10000CE40(v14))
  {
    sub_10000CDA8();
    sub_10000CE00((void *)&_mh_execute_header, v15, v16, "{\"msg%{public}.0s\":\"Endpoint invalidated with no dataDelegate in place\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  uint64_t v21 = abort_report_np();
  return sub_100016540(v21);
}

uint64_t sub_100016540()
{
  uint64_t v1 = sub_10000DE80();
  if (sub_10000CE58(v1))
  {
    sub_10000CDA8();
    sub_10000CE20((void *)&_mh_execute_header, v2, v3, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  id v8 = sub_10000DE80();
  if (os_signpost_enabled(v8))
  {
    sub_10000CDA8();
    sub_10000CDD4((void *)&_mh_execute_header, v9, v10, v11, "Endpoint must be same as the initially passed endpoint", "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  id v14 = sub_10000DE80();
  if (sub_10000CE40(v14))
  {
    sub_10000CDA8();
    sub_10000CE00((void *)&_mh_execute_header, v15, v16, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  uint64_t v21 = abort_report_np();
  return sub_100016664(v21);
}

uint64_t sub_100016664()
{
  uint64_t v1 = sub_10000DE80();
  if (sub_10000CE58(v1))
  {
    sub_10000CDA8();
    sub_10000CE20((void *)&_mh_execute_header, v2, v3, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  id v8 = sub_10000DE80();
  if (os_signpost_enabled(v8))
  {
    sub_10000CDA8();
    sub_10000CDD4((void *)&_mh_execute_header, v9, v10, v11, "Endpoint must be same as the initially passed endpoint", "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  id v14 = sub_10000DE80();
  if (sub_10000CE40(v14))
  {
    sub_10000CDA8();
    sub_10000CE00((void *)&_mh_execute_header, v15, v16, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  uint64_t v21 = abort_report_np();
  return sub_100016788(v21);
}

uint64_t sub_100016788()
{
  uint64_t v1 = sub_10000DE80();
  if (sub_10000CE58(v1))
  {
    sub_10000CDA8();
    sub_10000CE20((void *)&_mh_execute_header, v2, v3, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  id v8 = sub_10000DE80();
  if (os_signpost_enabled(v8))
  {
    sub_10000CDA8();
    sub_10000CDD4((void *)&_mh_execute_header, v9, v10, v11, "Endpoint must be same as the initially passed endpoint", "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  id v14 = sub_10000DE80();
  if (sub_10000CE40(v14))
  {
    sub_10000CDA8();
    sub_10000CE00((void *)&_mh_execute_header, v15, v16, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  uint64_t v21 = abort_report_np();
  return sub_1000168AC(v21);
}

uint64_t sub_1000168AC()
{
  uint64_t v1 = sub_10000DE80();
  if (sub_10000CE58(v1))
  {
    sub_10000CDA8();
    sub_10000CE20((void *)&_mh_execute_header, v2, v3, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v4, v5, v6, v7, v23, v24, v25, v26, v27);
  }

  id v8 = sub_10000DE80();
  if (os_signpost_enabled(v8))
  {
    sub_10000CDA8();
    sub_10000CDD4((void *)&_mh_execute_header, v9, v10, v11, "Endpoint must be same as the initially passed endpoint", "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v12, v13, v23, v24, v25, v26, v27);
  }

  id v14 = sub_10000DE80();
  if (sub_10000CE40(v14))
  {
    sub_10000CDA8();
    sub_10000CE00((void *)&_mh_execute_header, v15, v16, "{\"msg%{public}.0s\":\"Endpoint must be same as the initially passed endpoint\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v17, v18, v19, v20, v23, v24, v25, v26, v27);
  }

  uint64_t v21 = abort_report_np();
  return sub_1000169D0(v21);
}

#error "100016A44: call analysis failed (funcsize=60)"

#error "100016B64: call analysis failed (funcsize=60)"

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return _CFBundleGetIdentifier(bundle);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return _CFErrorGetCode(err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return _CFErrorGetDomain(err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return _CFURLCreateWithFileSystemPath(allocator, filePath, pathStyle, isDirectory);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return _CGRectCreateDictionaryRepresentation(a1);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetImageBuffer(sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetPresentationTimeStamp(retstr, sbuf);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return _CMTimeCopyAsDictionary(time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return _CMVideoFormatDescriptionGetDimensions(videoDesc);
}

uint64_t CVAFaceTrackingCreate()
{
  return _CVAFaceTrackingCreate();
}

uint64_t CVAFaceTrackingProcess()
{
  return _CVAFaceTrackingProcess();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGIsDeviceOneOfType()
{
  return _MGIsDeviceOneOfType();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return _NSSearchPathForDirectoriesInDomains(directory, domainMask, expandTilde);
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t TCCAccessCheckAuditToken()
{
  return _TCCAccessCheckAuditToken();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return __CFBundleCopyBundleURLForExecutableURL();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
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

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return _sigaction(a1, a2, a3);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

long double tan(long double __x)
{
  return _tan(__x);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return _xpc_connection_create_from_endpoint(endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

void xpc_connection_resume(xpc_connection_t connection)
{
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

void xpc_connection_suspend(xpc_connection_t connection)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return _xpc_type_get_name(type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__disableLoggingForReplay(void *a1, const char *a2, ...)
{
  return [a1 _disableLoggingForReplay];
}

id objc_msgSend__isAvailable(void *a1, const char *a2, ...)
{
  return [a1 _isAvailable];
}

id objc_msgSend__stop(void *a1, const char *a2, ...)
{
  return [a1 _stop];
}

id objc_msgSend__stopAudioAccessoryActivityUpdates(void *a1, const char *a2, ...)
{
  return [a1 _stopAudioAccessoryActivityUpdates];
}

id objc_msgSend__stopAudioAccessoryDeviceMotionStatusUpdates(void *a1, const char *a2, ...)
{
  return [a1 _stopAudioAccessoryDeviceMotionStatusUpdates];
}

id objc_msgSend__stopAudioAccessoryDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return [a1 _stopAudioAccessoryDeviceMotionUpdates];
}

id objc_msgSend__triggerUserInteractedWithDeviceEvent(void *a1, const char *a2, ...)
{
  return [a1 _triggerUserInteractedWithDeviceEvent];
}

id objc_msgSend_activeAudioRouteDeviceID(void *a1, const char *a2, ...)
{
  return [a1 activeAudioRouteDeviceID];
}

id objc_msgSend_activeDepthDataFormat(void *a1, const char *a2, ...)
{
  return [a1 activeDepthDataFormat];
}

id objc_msgSend_activeFormat(void *a1, const char *a2, ...)
{
  return [a1 activeFormat];
}

id objc_msgSend_activityHandler(void *a1, const char *a2, ...)
{
  return [a1 activityHandler];
}

id objc_msgSend_activityManager(void *a1, const char *a2, ...)
{
  return [a1 activityManager];
}

id objc_msgSend_activitySampleRate(void *a1, const char *a2, ...)
{
  return [a1 activitySampleRate];
}

id objc_msgSend_activitySamplesPerSecond(void *a1, const char *a2, ...)
{
  return [a1 activitySamplesPerSecond];
}

id objc_msgSend_activitySupported(void *a1, const char *a2, ...)
{
  return [a1 activitySupported];
}

id objc_msgSend_allowBuiltInMetadataCameras(void *a1, const char *a2, ...)
{
  return [a1 allowBuiltInMetadataCameras];
}

id objc_msgSend_allowBuiltInVideoCameras(void *a1, const char *a2, ...)
{
  return [a1 allowBuiltInVideoCameras];
}

id objc_msgSend_allowExternalVideoCameras(void *a1, const char *a2, ...)
{
  return [a1 allowExternalVideoCameras];
}

id objc_msgSend_attentionAwarenessClient(void *a1, const char *a2, ...)
{
  return [a1 attentionAwarenessClient];
}

id objc_msgSend_attitude(void *a1, const char *a2, ...)
{
  return [a1 attitude];
}

id objc_msgSend_audioAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 audioAccessoryManager];
}

id objc_msgSend_beginConfiguration(void *a1, const char *a2, ...)
{
  return [a1 beginConfiguration];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_boundingBox(void *a1, const char *a2, ...)
{
  return [a1 boundingBox];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callbackBlock(void *a1, const char *a2, ...)
{
  return [a1 callbackBlock];
}

id objc_msgSend_cameraID(void *a1, const char *a2, ...)
{
  return [a1 cameraID];
}

id objc_msgSend_captureContext(void *a1, const char *a2, ...)
{
  return [a1 captureContext];
}

id objc_msgSend_captureDevice(void *a1, const char *a2, ...)
{
  return [a1 captureDevice];
}

id objc_msgSend_captureDeviceInput(void *a1, const char *a2, ...)
{
  return [a1 captureDeviceInput];
}

id objc_msgSend_captureQueue(void *a1, const char *a2, ...)
{
  return [a1 captureQueue];
}

id objc_msgSend_captureSession(void *a1, const char *a2, ...)
{
  return [a1 captureSession];
}

id objc_msgSend_cmDefaults(void *a1, const char *a2, ...)
{
  return [a1 cmDefaults];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commitConfiguration(void *a1, const char *a2, ...)
{
  return [a1 commitConfiguration];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configureCaptureSession(void *a1, const char *a2, ...)
{
  return [a1 configureCaptureSession];
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return [a1 connections];
}

id objc_msgSend_consumedAuxTimestamp(void *a1, const char *a2, ...)
{
  return [a1 consumedAuxTimestamp];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultFieldOfView(void *a1, const char *a2, ...)
{
  return [a1 defaultFieldOfView];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deprecatedEntitlement(void *a1, const char *a2, ...)
{
  return [a1 deprecatedEntitlement];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return [a1 deviceID];
}

id objc_msgSend_deviceMotionHandler(void *a1, const char *a2, ...)
{
  return [a1 deviceMotionHandler];
}

id objc_msgSend_deviceMotionStatusHandler(void *a1, const char *a2, ...)
{
  return [a1 deviceMotionStatusHandler];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dmSampleRate(void *a1, const char *a2, ...)
{
  return [a1 dmSampleRate];
}

id objc_msgSend_dmSamplesPerSecond(void *a1, const char *a2, ...)
{
  return [a1 dmSamplesPerSecond];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_entitlement(void *a1, const char *a2, ...)
{
  return [a1 entitlement];
}

id objc_msgSend_eventMask(void *a1, const char *a2, ...)
{
  return [a1 eventMask];
}

id objc_msgSend_externalDisplayService(void *a1, const char *a2, ...)
{
  return [a1 externalDisplayService];
}

id objc_msgSend_faceId(void *a1, const char *a2, ...)
{
  return [a1 faceId];
}

id objc_msgSend_faceKit(void *a1, const char *a2, ...)
{
  return [a1 faceKit];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_forceSessionRestart(void *a1, const char *a2, ...)
{
  return [a1 forceSessionRestart];
}

id objc_msgSend_formatDescription(void *a1, const char *a2, ...)
{
  return [a1 formatDescription];
}

id objc_msgSend_formats(void *a1, const char *a2, ...)
{
  return [a1 formats];
}

id objc_msgSend_frameRate(void *a1, const char *a2, ...)
{
  return [a1 frameRate];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return [a1 inputs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_internal(void *a1, const char *a2, ...)
{
  return [a1 internal];
}

id objc_msgSend_intervalInNanoSeconds(void *a1, const char *a2, ...)
{
  return [a1 intervalInNanoSeconds];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isBuiltInCamera(void *a1, const char *a2, ...)
{
  return [a1 isBuiltInCamera];
}

id objc_msgSend_isCameraPaused(void *a1, const char *a2, ...)
{
  return [a1 isCameraPaused];
}

id objc_msgSend_isContinuityCamera(void *a1, const char *a2, ...)
{
  return [a1 isContinuityCamera];
}

id objc_msgSend_isDeviceMotionActive(void *a1, const char *a2, ...)
{
  return [a1 isDeviceMotionActive];
}

id objc_msgSend_isFaceTrackingSupported(void *a1, const char *a2, ...)
{
  return [a1 isFaceTrackingSupported];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isRequestingCameraOn(void *a1, const char *a2, ...)
{
  return [a1 isRequestingCameraOn];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isTempestActive(void *a1, const char *a2, ...)
{
  return [a1 isTempestActive];
}

id objc_msgSend_isVideoBinned(void *a1, const char *a2, ...)
{
  return [a1 isVideoBinned];
}

id objc_msgSend_lastActivityPrintTime(void *a1, const char *a2, ...)
{
  return [a1 lastActivityPrintTime];
}

id objc_msgSend_lastActivitySampleTime(void *a1, const char *a2, ...)
{
  return [a1 lastActivitySampleTime];
}

id objc_msgSend_lastDMPrintTime(void *a1, const char *a2, ...)
{
  return [a1 lastDMPrintTime];
}

id objc_msgSend_lastDMSampleTime(void *a1, const char *a2, ...)
{
  return [a1 lastDMSampleTime];
}

id objc_msgSend_lastDeviceStatus(void *a1, const char *a2, ...)
{
  return [a1 lastDeviceStatus];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastUserInteractionUpdateTimestamp(void *a1, const char *a2, ...)
{
  return [a1 lastUserInteractionUpdateTimestamp];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lidAngle(void *a1, const char *a2, ...)
{
  return [a1 lidAngle];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_machAbsTimestamp(void *a1, const char *a2, ...)
{
  return [a1 machAbsTimestamp];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_managers(void *a1, const char *a2, ...)
{
  return [a1 managers];
}

id objc_msgSend_maxFrameRate(void *a1, const char *a2, ...)
{
  return [a1 maxFrameRate];
}

id objc_msgSend_maxNumberOfCameras(void *a1, const char *a2, ...)
{
  return [a1 maxNumberOfCameras];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return [a1 mediaType];
}

id objc_msgSend_messageHandlerConstructor(void *a1, const char *a2, ...)
{
  return [a1 messageHandlerConstructor];
}

id objc_msgSend_metadataOutput(void *a1, const char *a2, ...)
{
  return [a1 metadataOutput];
}

id objc_msgSend_minFrameRate(void *a1, const char *a2, ...)
{
  return [a1 minFrameRate];
}

id objc_msgSend_modelID(void *a1, const char *a2, ...)
{
  return [a1 modelID];
}

id objc_msgSend_motionActivityActive(void *a1, const char *a2, ...)
{
  return [a1 motionActivityActive];
}

id objc_msgSend_mslLoggingEnabled(void *a1, const char *a2, ...)
{
  return [a1 mslLoggingEnabled];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_networkFailureThresholdMultiplier(void *a1, const char *a2, ...)
{
  return [a1 networkFailureThresholdMultiplier];
}

id objc_msgSend_notifyConnectedToClient(void *a1, const char *a2, ...)
{
  return [a1 notifyConnectedToClient];
}

id objc_msgSend_notifyDisconnectedToClient(void *a1, const char *a2, ...)
{
  return [a1 notifyDisconnectedToClient];
}

id objc_msgSend_numberOfCameras(void *a1, const char *a2, ...)
{
  return [a1 numberOfCameras];
}

id objc_msgSend_outputDevices(void *a1, const char *a2, ...)
{
  return [a1 outputDevices];
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return [a1 outputs];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_pitch(void *a1, const char *a2, ...)
{
  return [a1 pitch];
}

id objc_msgSend_postAudioRouteChangeCompleted(void *a1, const char *a2, ...)
{
  return [a1 postAudioRouteChangeCompleted];
}

id objc_msgSend_producerQueue(void *a1, const char *a2, ...)
{
  return [a1 producerQueue];
}

id objc_msgSend_producerTimer(void *a1, const char *a2, ...)
{
  return [a1 producerTimer];
}

id objc_msgSend_quaternion(void *a1, const char *a2, ...)
{
  return [a1 quaternion];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_receivedAuxTimestamp(void *a1, const char *a2, ...)
{
  return [a1 receivedAuxTimestamp];
}

id objc_msgSend_receiverQueue(void *a1, const char *a2, ...)
{
  return [a1 receiverQueue];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requested50HzHeadphoneMotion(void *a1, const char *a2, ...)
{
  return [a1 requested50HzHeadphoneMotion];
}

id objc_msgSend_requireActivity(void *a1, const char *a2, ...)
{
  return [a1 requireActivity];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_roll(void *a1, const char *a2, ...)
{
  return [a1 roll];
}

id objc_msgSend_running(void *a1, const char *a2, ...)
{
  return [a1 running];
}

id objc_msgSend_sendUserInteractionUpdate(void *a1, const char *a2, ...)
{
  return [a1 sendUserInteractionUpdate];
}

id objc_msgSend_sharedBacklight(void *a1, const char *a2, ...)
{
  return [a1 sharedBacklight];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedSystemAudioContext(void *a1, const char *a2, ...)
{
  return [a1 sharedSystemAudioContext];
}

id objc_msgSend_shouldActivateActivityUpdates(void *a1, const char *a2, ...)
{
  return [a1 shouldActivateActivityUpdates];
}

id objc_msgSend_shouldActivateDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return [a1 shouldActivateDeviceMotionUpdates];
}

id objc_msgSend_shouldActivateStatusUpdates(void *a1, const char *a2, ...)
{
  return [a1 shouldActivateStatusUpdates];
}

id objc_msgSend_startLidAngleUpdates(void *a1, const char *a2, ...)
{
  return [a1 startLidAngleUpdates];
}

id objc_msgSend_startMonitoringActiveAudioRoute(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringActiveAudioRoute];
}

id objc_msgSend_startMslLogging(void *a1, const char *a2, ...)
{
  return [a1 startMslLogging];
}

id objc_msgSend_startOrStopActivityUpdates(void *a1, const char *a2, ...)
{
  return [a1 startOrStopActivityUpdates];
}

id objc_msgSend_startOrStopDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return [a1 startOrStopDeviceMotionUpdates];
}

id objc_msgSend_startOrStopStatusUpdates(void *a1, const char *a2, ...)
{
  return [a1 startOrStopStatusUpdates];
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return [a1 startRunning];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stationary(void *a1, const char *a2, ...)
{
  return [a1 stationary];
}

id objc_msgSend_statusUpdatesActive(void *a1, const char *a2, ...)
{
  return [a1 statusUpdatesActive];
}

id objc_msgSend_stopActivityUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopActivityUpdates];
}

id objc_msgSend_stopCaptureSession(void *a1, const char *a2, ...)
{
  return [a1 stopCaptureSession];
}

id objc_msgSend_stopDeviceMotionUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopDeviceMotionUpdates];
}

id objc_msgSend_stopLidAngleUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopLidAngleUpdates];
}

id objc_msgSend_stopMonitoringActiveAudioRoute(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringActiveAudioRoute];
}

id objc_msgSend_stopMslLogging(void *a1, const char *a2, ...)
{
  return [a1 stopMslLogging];
}

id objc_msgSend_stopProducingData(void *a1, const char *a2, ...)
{
  return [a1 stopProducingData];
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return [a1 stopRunning];
}

id objc_msgSend_stopStatusUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopStatusUpdates];
}

id objc_msgSend_subscribedToStatus(void *a1, const char *a2, ...)
{
  return [a1 subscribedToStatus];
}

id objc_msgSend_supportedDepthDataFormats(void *a1, const char *a2, ...)
{
  return [a1 supportedDepthDataFormats];
}

id objc_msgSend_supportsFaceKitMetadata(void *a1, const char *a2, ...)
{
  return [a1 supportsFaceKitMetadata];
}

id objc_msgSend_supportsOpportunisticAnchoredTracking(void *a1, const char *a2, ...)
{
  return [a1 supportsOpportunisticAnchoredTracking];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return [a1 taskState];
}

id objc_msgSend_tccService(void *a1, const char *a2, ...)
{
  return [a1 tccService];
}

id objc_msgSend_tempestOptions(void *a1, const char *a2, ...)
{
  return [a1 tempestOptions];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return [a1 time];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_trackingFailureFieldOfViewModifier(void *a1, const char *a2, ...)
{
  return [a1 trackingFailureFieldOfViewModifier];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_unknown(void *a1, const char *a2, ...)
{
  return [a1 unknown];
}

id objc_msgSend_unlockForConfiguration(void *a1, const char *a2, ...)
{
  return [a1 unlockForConfiguration];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateActivityForCurrentRoute(void *a1, const char *a2, ...)
{
  return [a1 updateActivityForCurrentRoute];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInteractionMonitor(void *a1, const char *a2, ...)
{
  return [a1 userInteractionMonitor];
}

id objc_msgSend_videoDataOutput(void *a1, const char *a2, ...)
{
  return [a1 videoDataOutput];
}

id objc_msgSend_videoSupportedFrameRateRanges(void *a1, const char *a2, ...)
{
  return [a1 videoSupportedFrameRateRanges];
}

id objc_msgSend_walking(void *a1, const char *a2, ...)
{
  return [a1 walking];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_yaw(void *a1, const char *a2, ...)
{
  return [a1 yaw];
}