id sub_100003788()
{
  void *v0;
  uint64_t vars8;

  if (qword_10002F340 != -1) {
    dispatch_once(&qword_10002F340, &stru_1000286A8);
  }
  v0 = off_10002EE98;

  return v0;
}

id sub_1000037DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setXpcConnection:0];
}

void sub_1000037EC(id a1)
{
  off_10002EE98 = os_log_create("com.apple.streamingzip", "unzip_service");

  _objc_release_x1();
}

id sub_100003830()
{
  if (qword_10002F348 != -1) {
    dispatch_once(&qword_10002F348, &stru_1000286C8);
  }
  v0 = off_10002EEA0;

  return v0;
}

void sub_100003884(id a1)
{
  off_10002EEA0 = os_log_create("com.apple.streamingzip.signposts", "unzip_service");

  _objc_release_x1();
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"EnableDebugLogging"];

  if (v4)
  {
    v5 = sub_100003788();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Debug logging is enabled", (uint8_t *)&v12, 2u);
    }
  }
  v6 = sub_100003788();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 136315394;
    v13 = "Nov 10 2024";
    __int16 v14 = 2080;
    v15 = "02:14:52";
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Streaming unzip service built at %s %s started", (uint8_t *)&v12, 0x16u);
  }

  signal(15, (void (__cdecl *)(int))1);
  v7 = dispatch_get_global_queue(21, 0);
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v7);
  dispatch_source_set_event_handler(v8, &stru_100028708);
  dispatch_activate(v8);
  v9 = +[NSXPCListener serviceListener];
  v10 = objc_opt_new();
  [v9 setDelegate:v10];
  [v9 resume];

  return 0;
}

void sub_100003AA0(id a1)
{
  v1 = sub_100003788();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v2 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Got SIGTERM; Exiting when clean", v2, 2u);
  }

  xpc_transaction_exit_clean();
}

uint64_t sub_100003B10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 212) = 0;
  *(_OWORD *)(result + 196) = 0u;
  *(_OWORD *)(result + 180) = 0u;
  *(_OWORD *)(result + 164) = 0u;
  *(_OWORD *)(result + 148) = 0u;
  *(_OWORD *)(result + 132) = 0u;
  *(_OWORD *)(result + 116) = 0u;
  *(_OWORD *)(result + 100) = 0u;
  *(_OWORD *)(result + 84) = 0u;
  *(_OWORD *)(result + 68) = 0u;
  *(_OWORD *)(result + 52) = 0u;
  *(_OWORD *)(result + 36) = 0u;
  *(_OWORD *)(result + 20) = 0u;
  *(_OWORD *)(result + 4) = 0u;
  *(_DWORD *)result = a2;
  switch(a2)
  {
    case 0:
      result = CC_MD5_Init((CC_MD5_CTX *)(result + 8));
      break;
    case 1:
      result = CC_SHA1_Init((CC_SHA1_CTX *)(result + 8));
      break;
    case 4:
      result = CC_SHA224_Init((CC_SHA256_CTX *)(result + 8));
      break;
    case 5:
      result = CC_SHA256_Init((CC_SHA256_CTX *)(result + 8));
      break;
    case 6:
      result = CC_SHA384_Init((CC_SHA512_CTX *)(result + 8));
      break;
    case 7:
      result = CC_SHA512_Init((CC_SHA512_CTX *)(result + 8));
      break;
    default:
      return result;
  }
  return result;
}

unsigned __int8 *sub_100003BD0(unsigned __int8 *result, uint64_t a2)
{
  switch(*(_DWORD *)a2)
  {
    case 0:
      result = (unsigned __int8 *)CC_MD5_Final(result, (CC_MD5_CTX *)(a2 + 8));
      break;
    case 1:
      result = (unsigned __int8 *)CC_SHA1_Final(result, (CC_SHA1_CTX *)(a2 + 8));
      break;
    case 4:
      result = (unsigned __int8 *)CC_SHA224_Final(result, (CC_SHA256_CTX *)(a2 + 8));
      break;
    case 5:
      result = (unsigned __int8 *)CC_SHA256_Final(result, (CC_SHA256_CTX *)(a2 + 8));
      break;
    case 6:
      result = (unsigned __int8 *)CC_SHA384_Final(result, (CC_SHA512_CTX *)(a2 + 8));
      break;
    case 7:
      result = (unsigned __int8 *)CC_SHA512_Final(result, (CC_SHA512_CTX *)(a2 + 8));
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100003C50(uint64_t a1, unsigned __int16 *a2, unsigned int a3)
{
  unint64_t v3 = *(unsigned __int16 *)(a1 + 28);
  if (*(_WORD *)(a1 + 28))
  {
    uint64_t v4 = 0;
    int v5 = 0;
    uint64_t v6 = a1 + *(unsigned __int16 *)(a1 + 26) + 30;
    do
    {
      uint64_t v7 = v4 + 4;
      if (v4 + 4 > v3) {
        break;
      }
      uint64_t result = v6 + v4;
      int v9 = *(unsigned __int16 *)(v6 + v4);
      uint64_t v10 = *(unsigned __int16 *)(v6 + v4 + 2);
      if (v9 == *a2)
      {
        if (v7 + v10 <= v3 && v10 >= a3) {
          return result;
        }
        return 0;
      }
      v5 += v10 + 4;
      uint64_t v4 = (unsigned __int16)v5;
    }
    while (v3 > (unsigned __int16)v5);
  }
  return 0;
}

uint64_t sub_100003CC4(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 18) == -1 || (unsigned int v2 = *(_DWORD *)(a1 + 22), v2 == -1))
  {
    uint64_t v3 = sub_100003C50(a1, &word_10001DB52, 0x10u);
    if (v3 && *(_WORD *)(v3 + 2) == 16) {
      return *(void *)(v3 + 4);
    }
    return *(unsigned int *)(a1 + 22);
  }
  return v2;
}

time_t sub_100003D30(unsigned int a1)
{
  time_t v6 = time(0);
  uint64_t v3 = (tm *)qword_10002F350;
  if (!qword_10002F350)
  {
    uint64_t v3 = localtime_r(&v6, &stru_10002F358);
    qword_10002F350 = (uint64_t)v3;
  }
  v3->tm_isdst = -1;
  v2.i32[0] = a1;
  int8x16_t v4 = (int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(a1), (uint32x4_t)xmmword_10001DB20);
  v4.i32[0] = vshlq_u32(v2, (uint32x4_t)xmmword_10001DB10).u32[0];
  *(int8x16_t *)&v3->tm_sec = vandq_s8(v4, (int8x16_t)xmmword_10001DB30);
  v3->tm_mon = ((a1 >> 21) & 0xF) - 1;
  v3->tm_year = (a1 >> 25) + 80;
  return mktime(v3);
}

void sub_100004210(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inProcessUnzipper];
  [v2 setActiveDelegateMethods:*(unsigned int *)(a1 + 40)];
}

void sub_100004264(uint64_t a1, void *a2)
{
  id v3 = a2;
  int8x16_t v4 = sub_100003788();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%@: Failed to set delegate methods enabled: %@", (uint8_t *)&v6, 0x16u);
  }
}

id sub_100004A7C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v17) {
    id v19 = [v17 mutableCopy];
  }
  else {
    id v19 = (id)objc_opt_new();
  }
  v20 = v19;
  if (v18)
  {
    id v21 = [objc_alloc((Class)NSString) initWithFormat:v18 arguments:&a9];
    [v20 setObject:v21 forKeyedSubscript:NSLocalizedDescriptionKey];
  }
  if (v16) {
    [v20 setObject:v16 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  v22 = +[NSString stringWithUTF8String:a1];
  [v20 setObject:v22 forKeyedSubscript:@"SZExtractorFunctionNameErrorKey"];

  v23 = +[NSNumber numberWithInt:a2];
  [v20 setObject:v23 forKeyedSubscript:@"SZExtractorSourceFileLineErrorKey"];

  v24 = +[NSError errorWithDomain:v15 code:a4 userInfo:v20];

  return v24;
}

void sub_100004C1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  int8x16_t v4 = sub_100003788();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: calling completion block with error %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void sub_100004D00(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inProcessUnzipper];
  [v2 terminateStreamWithReply:*(void *)(a1 + 40)];
}

uint64_t sub_100004D54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000051A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  int8x16_t v4 = sub_100003788();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@: calling completion block with error %@", (uint8_t *)&v6, 0x16u);
  }

  if (v3) {
    [*(id *)(a1 + 32) setError:v3];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void sub_100005298(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inProcessUnzipper];
  [v2 finishStreamWithReply:*(void *)(a1 + 40)];
}

uint64_t sub_1000052EC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005780(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v6 = sub_100003788();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: calling completion block with offset %llu, error %@", (uint8_t *)&v8, 0x20u);
  }

  if (v5) {
    [*(id *)(a1 + 32) setError:v5];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void sub_100005888(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inProcessUnzipper];
  [v2 suspendStreamWithReply:*(void *)(a1 + 40)];
}

uint64_t sub_1000058DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100005F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_100005FA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  int8x16_t v4 = sub_100003830();
  if (os_signpost_enabled(v4))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v3) {
      int v6 = 78;
    }
    else {
      int v6 = 89;
    }
    int v7 = 134218240;
    uint64_t v8 = v5;
    __int16 v9 = 1024;
    int v10 = v6;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SUPPLY_BYTES", "Supply bytes with length %lu succeeded: %c", (uint8_t *)&v7, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000060AC(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  int v6 = sub_100003788();
  int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@: calling completion block with error %@", (uint8_t *)&v11, 0x16u);
    }

    [*(id *)(a1 + 32) setError:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) _invalidateObject];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      if (a3) {
        int v10 = 89;
      }
      else {
        int v10 = 78;
      }
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 1024;
      LODWORD(v14) = v10;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@: calling completion block with no error, dataComplete=%c", (uint8_t *)&v11, 0x12u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100006230(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inProcessUnzipper];
  [v2 supplyBytes:*(void *)(a1 + 40) withReply:*(void *)(a1 + 48)];
}

uint64_t sub_100006284(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006294(uint64_t a1)
{
}

void sub_10000629C(uint64_t a1, void *a2, char a3, uint64_t a4)
{
  id v11 = a2;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void *)(v8 + 40);
  uint64_t v9 = (id *)(v8 + 40);
  if (!v10) {
    objc_storeStrong(v9, a2);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  pthread_mutex_lock(&stru_10002F148);
  qword_10002F188 += a4;
  pthread_cond_broadcast(&stru_10002F190);
  pthread_mutex_unlock(&stru_10002F148);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100006354(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) length];
  if ((unint64_t)(v2 - 5242881) >= 0xFFFFFFFFFFB00000)
  {
    unint64_t v3 = (unint64_t)v2;
    pthread_mutex_lock(&stru_10002F148);
    if (qword_10002F188 >= v3) {
      qword_10002F188 -= v3;
    }
    else {
      unint64_t v3 = 0;
    }
    pthread_mutex_unlock(&stru_10002F148);
  }
  else
  {
    unint64_t v3 = 0;
  }
  if ((id)v3 == [*(id *)(a1 + 32) length])
  {
    int8x16_t v4 = sub_100003788();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v3;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Supplying entire byte range data of length %lu", buf, 0xCu);
    }

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
    id v5 = sub_100003830();
    if (os_signpost_enabled(v5))
    {
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v3;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Sending buffer of size %lu to the unzip service over XPC", buf, 0xCu);
    }

    int v6 = [*(id *)(a1 + 48) unzipServiceConnection];
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_100006E48;
    v61[3] = &unk_100028910;
    v62 = *(id *)(a1 + 56);
    unint64_t v63 = v3;
    int v7 = [v6 remoteObjectProxyWithErrorHandler:v61];
    uint64_t v8 = *(void *)(a1 + 32);
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100006F18;
    v58[3] = &unk_100028870;
    id v59 = *(id *)(a1 + 56);
    unint64_t v60 = v3;
    [v7 supplyBytes:v8 withReply:v58];

    uint64_t v9 = v62;
    goto LABEL_62;
  }
  uint64_t v10 = sub_100003830();
  if (os_signpost_enabled(v10))
  {
    id v11 = [*(id *)(a1 + 32) length];
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = v11;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FRAGMENT_DATA", "Starting fragmentation of the supplied buffer of length : %lu", buf, 0xCu);
  }

  if ([*(id *)(a1 + 32) length])
  {
    unint64_t v12 = 0;
    unint64_t v41 = 0;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      uint64_t v54 = 0;
      v55 = &v54;
      uint64_t v56 = 0x2020000000;
      uint64_t v57 = 0;
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      unint64_t v18 = v13 - v12 + v41;
      if (v18)
      {
        pthread_mutex_lock(&stru_10002F148);
        unint64_t v19 = qword_10002F188;
        if (!((unint64_t)qword_10002F188 >> 17))
        {
          do
          {
            pthread_cond_wait(&stru_10002F190, &stru_10002F148);
            unint64_t v19 = qword_10002F188;
          }
          while ((unint64_t)qword_10002F188 < 0x20000);
        }
        if (v19 < v18) {
          unint64_t v18 = v19;
        }
        qword_10002F188 = v19 - v18;
        pthread_mutex_unlock(&stru_10002F148);
        v20 = (unint64_t *)(v55 + 3);
      }
      else
      {
        v20 = (unint64_t *)&v57;
      }
      unint64_t *v20 = v18;
      id v21 = sub_100003788();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v36 = v55[3];
        *(_DWORD *)buf = 134218752;
        *(void *)&buf[4] = v36;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v12;
        *(_WORD *)&buf[22] = 2048;
        v71 = (const char *)v13;
        LOWORD(v72) = 2048;
        *(void *)((char *)&v72 + 2) = v41;
        _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "Reserved %ld bytes at %ld for too-big partial range {%lu, %lu}", buf, 0x2Au);
      }

LABEL_49:
      v25 = sub_100003788();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v35 = v55[3];
        *(_DWORD *)buf = 134218240;
        *(void *)&buf[4] = v35;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v12;
        _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Supplying byte range data of length %lu at location %lu", buf, 0x16u);
      }

      v27 = objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", v12, v55[3]);
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v28 = sub_100003830();
      if (os_signpost_enabled(v28))
      {
        id v29 = [v27 length];
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = v29;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Sending buffer of size %lu to the unzip service over XPC", buf, 0xCu);
      }

      uint64_t v30 = [*(id *)(a1 + 48) unzipServiceConnection];
      v49[0] = _NSConcreteStackBlock;
      v49[1] = 3221225472;
      v49[2] = sub_10000722C;
      v49[3] = &unk_100028960;
      id v51 = *(id *)(a1 + 56);
      v52 = &v54;
      id v31 = v27;
      id v50 = v31;
      v32 = [v30 remoteObjectProxyWithErrorHandler:v49];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100007308;
      v45[3] = &unk_100028988;
      id v47 = *(id *)(a1 + 56);
      v48 = &v54;
      id v33 = v31;
      id v46 = v33;
      [v32 supplyBytes:v33 withReply:v45];

      v12 += v55[3];
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_58;
      }
      if (v12 >= v41 + v13)
      {
        v34 = sub_100003788();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v13;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v41;
          _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "Active partial range {%lu, %lu} exhausted", buf, 0x16u);
        }

        unint64_t v41 = 0;
LABEL_58:
        uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
      }
      _Block_object_dispose(&v54, 8);
      if (v12 >= (unint64_t)[*(id *)(a1 + 32) length]) {
        goto LABEL_60;
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3010000000;
    v71 = "";
    long long v72 = xmmword_10001DB40;
    id v14 = *(void **)(a1 + 32);
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_10000700C;
    v53[3] = &unk_100028938;
    v53[5] = buf;
    v53[6] = v12;
    v53[4] = &v54;
    [v14 enumerateByteRangesUsingBlock:v53];
    if (!v55[3])
    {
      uint64_t v13 = *(void *)(*(void *)&buf[8] + 32);
      if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
        __assert_rtn("-[SZExtractor supplyBytes:withCompletionBlock:]_block_invoke_2", "SZExtractor.m", 822, "NSNotFound != lastByteRange.location");
      }
      unint64_t v15 = *(void *)(*(void *)&buf[8] + 40);
      if (v15 > 0x500000)
      {
        pthread_mutex_lock(&stru_10002F148);
        unint64_t v22 = qword_10002F188;
        if (!((unint64_t)qword_10002F188 >> 17))
        {
          do
          {
            pthread_cond_wait(&stru_10002F190, &stru_10002F148);
            unint64_t v22 = qword_10002F188;
          }
          while ((unint64_t)qword_10002F188 < 0x20000);
        }
        if (v22 >= v15) {
          unint64_t v23 = v15;
        }
        else {
          unint64_t v23 = v22;
        }
        qword_10002F188 = v22 - v23;
        pthread_mutex_unlock(&stru_10002F148);
        v55[3] = v23;
        v24 = sub_100003788();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v38 = v55[3];
          *(_DWORD *)v64 = 134218496;
          uint64_t v65 = v38;
          __int16 v66 = 2048;
          uint64_t v67 = v13;
          __int16 v68 = 2048;
          unint64_t v69 = v15;
          _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Reserved %ld bytes for too-big partial range {%lu, %lu}", v64, 0x20u);
        }

        unint64_t v41 = v15;
        goto LABEL_48;
      }
      id v16 = sub_100003788();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v37 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v64 = 134217984;
        uint64_t v65 = v37;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Waiting for %lu bytes to become available", v64, 0xCu);
      }

      unint64_t v17 = *(void *)(*(void *)&buf[8] + 40);
      if (v17)
      {
        pthread_mutex_lock(&stru_10002F148);
        while (qword_10002F188 < v17)
          pthread_cond_wait(&stru_10002F190, &stru_10002F148);
        qword_10002F188 -= v17;
        pthread_mutex_unlock(&stru_10002F148);
      }
      v55[3] = v17;
    }
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_48:
    _Block_object_dispose(buf, 8);
    goto LABEL_49;
  }
LABEL_60:
  uint64_t v9 = sub_100003830();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FRAGMENT_DATA", "Ending fragmentation of the supplied buffer", buf, 2u);
  }
LABEL_62:

  v39 = *(NSObject **)(a1 + 40);
  v40 = [*(id *)(a1 + 48) serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007418;
  block[3] = &unk_1000289B0;
  id v43 = *(id *)(a1 + 64);
  long long v44 = *(_OWORD *)(a1 + 72);
  dispatch_group_notify(v39, v40, block);
}

void sub_100006DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
}

void sub_100006E48(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = sub_100003830();
  if (os_signpost_enabled(v2))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (Succeeded: N) processing buffer of size %lu sent to the unzip service over XPC", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100006F18(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  int v4 = sub_100003830();
  if (os_signpost_enabled(v4))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (a2) {
      int v6 = 78;
    }
    else {
      int v6 = 89;
    }
    v7[0] = 67109376;
    v7[1] = v6;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (Succeeded: %c) processing buffer of size %lu sent to the unzip service over XPC", (uint8_t *)v7, 0x12u);
  }
}

void sub_10000700C(void *a1, uint64_t a2, unint64_t a3, unint64_t a4, unsigned char *a5)
{
  if (a3 + a4 <= a1[6])
  {
    uint64_t v10 = sub_100003788();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v15 = 134218240;
      unint64_t v16 = a3;
      __int16 v17 = 2048;
      unint64_t v18 = a4;
      _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Already processed {%lu, %lu}", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    if (a4 - 5242881 >= 0xFFFFFFFFFFB00000)
    {
      pthread_mutex_lock(&stru_10002F148);
      if (qword_10002F188 >= a4)
      {
        qword_10002F188 -= a4;
        unint64_t v9 = a4;
      }
      else
      {
        unint64_t v9 = 0;
      }
      pthread_mutex_unlock(&stru_10002F148);
    }
    else
    {
      unint64_t v9 = 0;
    }
    id v11 = sub_100003788();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
    if (v9 == a4)
    {
      if (v12)
      {
        unint64_t v14 = *(void *)(*(void *)(a1[4] + 8) + 24);
        int v15 = 134218240;
        unint64_t v16 = a4;
        __int16 v17 = 2048;
        unint64_t v18 = v14;
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Reserved %ld bytes; adding to existing length %ld",
          (uint8_t *)&v15,
          0x16u);
      }

      *(void *)(*(void *)(a1[4] + 8) + 24) += a4;
    }
    else
    {
      if (v12)
      {
        int v15 = 134218240;
        unint64_t v16 = a3;
        __int16 v17 = 2048;
        unint64_t v18 = a4;
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Failed to reserve last range; falling out with last range {%lu, %lu}",
          (uint8_t *)&v15,
          0x16u);
      }

      uint64_t v13 = *(void *)(a1[5] + 8);
      *(void *)(v13 + 32) = a3;
      *(void *)(v13 + 40) = a4;
      *a5 = 1;
    }
  }
}

void sub_10000722C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = sub_100003830();
  if (os_signpost_enabled(v2))
  {
    id v3 = [*(id *)(a1 + 32) length];
    int v4 = 134217984;
    id v5 = v3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (Succeeded: N) processing buffer of size %lu sent to the unzip service over XPC", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100007308(uint64_t a1, void *a2)
{
  id v3 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  int v4 = sub_100003830();
  if (os_signpost_enabled(v4))
  {
    if (v3) {
      int v5 = 78;
    }
    else {
      int v5 = 89;
    }
    id v6 = [*(id *)(a1 + 32) length];
    v7[0] = 67109376;
    v7[1] = v5;
    __int16 v8 = 2048;
    id v9 = v6;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DATA_OVER_XPC", "Finished (Succeeded: %c) processing buffer of size %lu sent to the unzip service over XPC", (uint8_t *)v7, 0x12u);
  }
}

uint64_t sub_100007418(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(unsigned __int8 *)(*(void *)(a1[6] + 8) + 24));
}

void sub_100007AC4(uint64_t a1)
{
  id v2 = [[StreamingUnzipper alloc] initForClient:@"In-process unzipper" connection:0];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  int v5 = objc_alloc_init(SZExtractorInternalDelegate);
  uint64_t v6 = *(void *)(a1 + 32);
  int v7 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v5;

  __int16 v8 = +[NSFileManager defaultManager];
  id v9 = [*(id *)(a1 + 32) extractionPath];
  unsigned __int8 v10 = [v8 fileExistsAtPath:v9];

  if (v10) {
    goto LABEL_4;
  }
  NSFileAttributeKey v36 = NSFilePosixPermissions;
  id v11 = +[NSNumber numberWithUnsignedShort:16877];
  uint64_t v37 = v11;
  BOOL v12 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];

  uint64_t v13 = +[NSFileManager defaultManager];
  unint64_t v14 = [*(id *)(a1 + 32) extractionPath];
  id v31 = 0;
  unsigned int v15 = [v13 createDirectoryAtPath:v14 withIntermediateDirectories:1 attributes:v12 error:&v31];
  dispatch_queue_t v16 = (dispatch_queue_t)v31;

  if (v15)
  {

LABEL_4:
    __int16 v17 = [*(id *)(a1 + 32) inProcessUnzipper];
    unint64_t v18 = [*(id *)(a1 + 32) extractionPath];
    unint64_t v19 = [*(id *)(a1 + 32) options];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100007E84;
    v30[3] = &unk_100028820;
    v30[4] = *(void *)(a1 + 32);
    [v17 setupUnzipperWithOutputPath:v18 sandboxExtensionToken:0 options:v19 withReply:v30];

    v20 = [*(id *)(a1 + 32) internalExtractorDelegate];
    id v21 = [*(id *)(a1 + 32) inProcessUnzipper];
    [v21 setInProcessExtractorDelegate:v20];

    BOOL v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.StreamingZip.SZExtractor_in_proces_delegate", v12);
    unint64_t v22 = [*(id *)(a1 + 32) inProcessUnzipper];
    [v22 setInProcessDelegateQueue:v16];
    goto LABEL_8;
  }
  unint64_t v23 = sub_100003788();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    id v29 = [*(id *)(a1 + 32) extractionPath];
    *(_DWORD *)buf = 138412546;
    id v33 = v29;
    __int16 v34 = 2112;
    dispatch_queue_t v35 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to create extraction directory at path %@: %@", buf, 0x16u);
  }
  v24 = [*(id *)(a1 + 32) extractionPath];
  unint64_t v22 = sub_100004A7C((uint64_t)"-[SZExtractor _prepareForLocalExtraction:]_block_invoke", 594, @"SZExtractorErrorDomain", 1, v16, 0, @"Failed to create extraction directory at path %@: %@", v25, (uint64_t)v24);

  [*(id *)(a1 + 32) setError:v22];
LABEL_8:

  uint64_t v26 = *(void *)(a1 + 40);
  id v27 = [*(id *)(a1 + 32) lastResumptionOffset];
  v28 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v26 + 16))(v26, v27, v28);
}

id sub_100007E84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) setError:a2];
  int v5 = *(void **)(a1 + 32);

  return [v5 setLastResumptionOffset:a3];
}

os_unfair_lock_s *sub_1000082FC(os_unfair_lock_s *a1)
{
  v1 = a1;
  if (a1)
  {
    id v2 = *(NSObject **)&a1[24]._os_unfair_lock_opaque;
    if (v2) {
      dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    }
    uint64_t v3 = v1 + 28;
    os_unfair_lock_lock(v1 + 28);
    v1 = *(os_unfair_lock_s **)&v1[26]._os_unfair_lock_opaque;
    if (v1) {
      int v4 = v1;
    }
    os_unfair_lock_unlock(v3);
  }

  return v1;
}

void sub_100008364(uint64_t a1)
{
  if (a1)
  {
    [*(id *)(a1 + 64) setStreamState:8];
    id v2 = [*(id *)(a1 + 64) unzipPath];
    if (v2)
    {
      uint64_t v3 = +[NSFileManager defaultManager];
      id v7 = 0;
      unsigned __int8 v4 = [v3 removeItemAtPath:v2 error:&v7];
      id v5 = v7;

      if ((v4 & 1) == 0)
      {
        uint64_t v6 = sub_100003788();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          id v9 = v2;
          __int16 v10 = 2112;
          id v11 = v5;
          _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to remove unzip path at %@ : %@", buf, 0x16u);
        }
      }
    }
  }
}

uint64_t sub_100008C8C(uint64_t a1, uint64_t a2, void *a3)
{
  if (!a2) {
    return 1;
  }
  if ((*(_WORD *)(*(void *)(a2 + 96) + 4) & 0xF000) != 0xA000) {
    return 1;
  }
  id v5 = +[NSURL fileURLWithFileSystemRepresentation:*(void *)(a2 + 48) isDirectory:0 relativeToURL:0];
  uint64_t v6 = [v5 path];
  id v7 = [*(id *)(a1 + 32) path];
  LODWORD(a3) = sub_100008D38(v6, v7, a3);

  uint64_t result = 0;
  if (a3) {
    return 1;
  }
  return result;
}

uint64_t sub_100008D38(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  bzero(__s, 0x400uLL);
  id v7 = v5;
  if (realpath_DARWIN_EXTSN((const char *)[v7 fileSystemRepresentation], __s) || *__error() == 2)
  {
    dispatch_queue_t v35 = a3;
    __int16 v8 = +[NSFileManager defaultManager];
    id v9 = [v8 stringWithFileSystemRepresentation:__s length:strlen(__s)];

    __int16 v10 = [v9 pathComponents];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v11 = [v6 pathComponents];
    id v12 = [v11 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = 0;
      uint64_t v15 = *(void *)v37;
      __int16 v34 = v9;
      while (2)
      {
        id v16 = v7;
        id v17 = v6;
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v37 != v15) {
            objc_enumerationMutation(v11);
          }
          unint64_t v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if ((char *)i + v14 < [v10 count])
          {
            v20 = [v10 objectAtIndexedSubscript:(char *)i + v14];
            unsigned __int8 v21 = [v19 isEqualToString:v20];

            if (v21) {
              continue;
            }
          }
          v24 = sub_100003788();
          id v6 = v17;
          id v7 = v16;
          id v9 = v34;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            id v33 = [v7 fileSystemRepresentation];
            *(_DWORD *)buf = 136315650;
            id v43 = v33;
            __int16 v44 = 2112;
            v45 = (char *)v34;
            __int16 v46 = 2112;
            id v47 = v6;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Rejecting \"%s\" because its resolved path \"%@\" points outside or to the unzip dir %@", buf, 0x20u);
          }

          NSErrorUserInfoKey v40 = NSFilePathErrorKey;
          id v41 = v7;
          uint64_t v25 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          id v26 = [v7 fileSystemRepresentation];
          unint64_t v22 = sub_100004A7C((uint64_t)"_CheckRealpathHasBasePrefix", 442, @"SZExtractorErrorDomain", 5, 0, v25, @"Rejecting \"%s\" because its resolved path \"%@\" points outside or to the unzip dir %@", v27, (uint64_t)v26);

          uint64_t v23 = 0;
          goto LABEL_17;
        }
        v14 += (uint64_t)i;
        id v13 = [v11 countByEnumeratingWithState:&v36 objects:v48 count:16];
        unint64_t v22 = 0;
        uint64_t v23 = 1;
        id v6 = v17;
        id v7 = v16;
        id v9 = v34;
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      unint64_t v22 = 0;
      uint64_t v23 = 1;
    }
LABEL_17:

    a3 = v35;
  }
  else
  {
    uint64_t v29 = *__error();
    uint64_t v30 = sub_100003788();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v43 = [v7 fileSystemRepresentation];
      __int16 v44 = 2080;
      v45 = strerror(v29);
      _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Call to realpath failed for suspicious path %s: %s", buf, 0x16u);
    }

    id v9 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v29 userInfo:0];
    NSErrorUserInfoKey v49 = NSFilePathErrorKey;
    id v50 = v7;
    __int16 v10 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
    id v31 = [v7 fileSystemRepresentation];
    strerror(v29);
    unint64_t v22 = sub_100004A7C((uint64_t)"_CheckRealpathHasBasePrefix", 430, @"SZExtractorErrorDomain", 5, v9, v10, @"Call to realpath failed for suspicious path %s: %s", v32, (uint64_t)v31);
    uint64_t v23 = 0;
  }

  if (a3 && (v23 & 1) == 0) {
    *a3 = v22;
  }

  return v23;
}

void sub_10000961C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t sub_100009648(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100009658(uint64_t a1)
{
}

void sub_100009660(uint64_t a1, const Bytef *a2, uint64_t a3, size_t a4, unsigned char *a5)
{
  uint64_t v10 = sub_100003788();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 134218240;
    uint64_t v16 = v12;
    __int16 v17 = 2048;
    uint64_t v18 = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Got block of length %lu at offset %lu", buf, 0x16u);
  }

  uint64_t v11 = *(void *)(a1 + 32);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000097C0;
  v13[3] = &unk_100028C38;
  long long v14 = *(_OWORD *)(a1 + 40);
  sub_100009820(v11, a2, a4, v13);
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    *a5 = 1;
  }
}

void sub_1000097C0(uint64_t a1, void *a2, char a3)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  id v6 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
}

void sub_100009820(uint64_t a1, const Bytef *a2, size_t a3, void *a4)
{
  id v7 = a4;
  if (!a1) {
    goto LABEL_394;
  }
  v518 = a2;
  size_t v517 = a3;
  id v9 = (id *)(a1 + 64);
  __int16 v8 = *(void **)(a1 + 64);
  if (!v8)
  {
    v280 = sub_100003788();
    if (os_log_type_enabled(v280, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v559.st_dev) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v280, OS_LOG_TYPE_ERROR, "Unzipper did not have any state! Client should suspend stream and resume from the given offset.", (uint8_t *)&v559, 2u);
    }

    sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 470, @"SZExtractorErrorDomain", 3, 0, 0, @"Unzipper did not have any state! Client should suspend stream and resume from the given offset.", v281, v453);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v472 = 0;
LABEL_375:
    uint64_t v14 = 0;
    if (v10) {
      goto LABEL_388;
    }
    goto LABEL_393;
  }
  v472 = [v8 unzipPath];
  id v10 = 0;
  p_st_uid = &v559.st_uid;
  NSErrorUserInfoKey v470 = NSFilePathErrorKey;
  NSErrorDomain v465 = NSPOSIXErrorDomain;
  *(void *)&long long v11 = 138412546;
  long long v463 = v11;
  *(void *)&long long v11 = 136315138;
  long long v459 = v11;
  *(void *)&long long v11 = 136315394;
  long long v461 = v11;
  *(void *)&long long v11 = 136316162;
  long long v458 = v11;
  *(void *)&long long v11 = 138412290;
  long long v464 = v11;
  *(void *)&long long v11 = 138413058;
  long long v462 = v11;
  *(void *)&long long v11 = 134217984;
  long long v466 = v11;
  *(void *)&long long v11 = 67109632;
  long long v460 = v11;
  *(void *)&long long v11 = 136315650;
  long long v456 = v11;
  uint64_t v474 = a1;
  v475 = (id *)(a1 + 64);
  while (2)
  {
    unint64_t v12 = v517;
    if (!v517) {
      goto LABEL_375;
    }
    uint64_t v14 = 0;
    switch([*v9 streamState])
    {
      case 0u:
        if (![*v9 currentLFRecord]) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 485, "_currentState.currentLFRecord");
        }
        sub_10000E564((uint64_t)[*v9 currentLFRecord], 4, *v9, (const void **)&v518, &v517);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15) {
          goto LABEL_470;
        }
        if ((unint64_t)[*v9 thisStageBytesComplete] >= 5) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 493, "_currentState.thisStageBytesComplete <= peekSignatureSize");
        }
        id v16 = [*v9 thisStageBytesComplete];
        id v17 = *v9;
        if (v16 != (id)4)
        {
          [v17 markResumptionPoint];
          goto LABEL_54;
        }
        int v18 = *(_DWORD *)[v17 currentLFRecord];
        id v19 = *v9;
        if (v18 == 67324752)
        {
          [v19 setStreamState:1];
LABEL_54:
          id v10 = 0;
          goto LABEL_55;
        }
        v342 = [v19 unsureData];

        if (v342)
        {
          v343 = sub_100003788();
          if (os_log_type_enabled(v343, OS_LOG_TYPE_DEFAULT))
          {
            int v344 = *(unsigned __int8 *)[*v9 currentLFRecord];
            int v345 = *((unsigned __int8 *)[*v9 currentLFRecord] + 1);
            uid_t v346 = *((unsigned __int8 *)[*v9 currentLFRecord] + 2);
            gid_t v347 = *((unsigned __int8 *)[*v9 currentLFRecord] + 3);
            v559.st_dev = 67109888;
            *(_DWORD *)&v559.st_mode = v344;
            a1 = v474;
            LOWORD(v559.st_ino) = 1024;
            *(_DWORD *)((char *)&v559.st_ino + 2) = v345;
            HIWORD(v559.st_ino) = 1024;
            v559.st_uid = v346;
            LOWORD(v559.st_gid) = 1024;
            *(gid_t *)((char *)&v559.st_gid + 2) = v347;
            _os_log_impl((void *)&_mh_execute_header, v343, OS_LOG_TYPE_DEFAULT, "Got unexpected local file signature %c%c%c%c ; entering passthrough mode",
              (uint8_t *)&v559,
              0x1Au);
          }

          v320 = v518;
          uint64_t v322 = v517;
          uint64_t v321 = a1;
LABEL_440:
          sub_10000E674(v321, (uint64_t)v320, v322);
          id v10 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_481;
        }
        if (*(_DWORD *)[*v9 currentLFRecord] != 33639248)
        {
          v383 = sub_100003788();
          if (os_log_type_enabled(v383, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v559.st_dev) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v383, OS_LOG_TYPE_ERROR, "Encountered unexpectedly non-stream-compliant data in stream!", (uint8_t *)&v559, 2u);
          }

          CFStringRef v572 = @"SZExtractorFileOffsetErrorKey";
          v384 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v9 currentOffset]);
          v573 = v384;
          v385 = +[NSDictionary dictionaryWithObjects:&v573 forKeys:&v572 count:1];
          sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 552, @"SZExtractorErrorDomain", 2, 0, v385, @"Encountered unexpectedly non-stream-compliant data in stream!", v386, v453);
          id v10 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_481;
        }
        if ([*v9 bytesHashedInChunk])
        {
          v414 = [*v9 lastChunkPartialHash];

          if (!v414)
          {
            v417 = sub_100003788();
            if (os_log_type_enabled(v417, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v559.st_dev) = 0;
              _os_log_debug_impl((void *)&_mh_execute_header, v417, OS_LOG_TYPE_DEBUG, "No last chunk partial hash; will need full chunk to validate.",
                (uint8_t *)&v559,
                2u);
            }
            v416 = 0;
            goto LABEL_523;
          }
          uint64_t v415 = [*v9 checkLastChunkPartialHash];
          if (v415)
          {
            v416 = (void *)v415;
            v417 = sub_100003788();
            if (os_log_type_enabled(v417, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v559.st_dev) = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v417, OS_LOG_TYPE_ERROR, "Last chunk's partial hash did not validate (store hashed chunk size mismatch?); consuming more data to c"
                "heck full chunk.",
                (uint8_t *)&v559,
                2u);
            }
LABEL_523:
            v294 = v13;

            v426 = sub_100003788();
            if (os_log_type_enabled(v426, OS_LOG_TYPE_DEBUG))
            {
              LOWORD(v559.st_dev) = 0;
              _os_log_debug_impl((void *)&_mh_execute_header, v426, OS_LOG_TYPE_DEBUG, "Finished central directory signature; updating hash with remainder of stream data",
                (uint8_t *)&v559,
                2u);
            }

            size_t v427 = v517;
            v428 = v475;
            if ([*v475 hashedChunkSize])
            {
              v429 = [*v428 hashedChunkSize];
              v430 = [*v428 bytesHashedInChunk];
              if (v429 - v430 >= v427) {
                size_t v431 = v427;
              }
              else {
                size_t v431 = v429 - v430;
              }
            }
            else
            {
              size_t v431 = v427;
            }
            id v432 = *v428;
            id v433 = [*v428 currentOffset];
            id v10 = [v432 updateHashFromOffset:v433 withBytes:v518 length:v431 onlyFinishCurrentChunk:1];

            objc_msgSend(*v428, "setCurrentOffset:", (char *)objc_msgSend(*v428, "currentOffset") + v431);
            if (v10)
            {
              uint64_t v14 = 0;
              id v9 = v475;
            }
            else
            {
              if ([*v475 bytesHashedInChunk])
              {
                if (v431 != v427) {
                  __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 543, "lengthToRead == length");
                }
                v434 = sub_100003788();
                if (os_log_type_enabled(v434, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v559.st_dev) = 0;
                  _os_log_debug_impl((void *)&_mh_execute_header, v434, OS_LOG_TYPE_DEBUG, "After hitting Central Directory, we need more data to finish the chunk", (uint8_t *)&v559, 2u);
                }

                id v9 = v475;
                [*v475 setStreamState:6];
                id v10 = 0;
                uint64_t v14 = 0;
              }
              else
              {
                v444 = sub_100003788();
                if (os_log_type_enabled(v444, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v559.st_dev) = 0;
                  _os_log_debug_impl((void *)&_mh_execute_header, v444, OS_LOG_TYPE_DEBUG, "After hitting Central Directory, we had enough data already to finish the chunk", (uint8_t *)&v559, 2u);
                }

                id v9 = v475;
                [*v475 setStreamState:7];
                id v10 = 0;
                uint64_t v14 = 1;
              }
              a1 = v474;
            }
            goto LABEL_404;
          }
        }
        else
        {
          v419 = sub_100003788();
          if (os_log_type_enabled(v419, OS_LOG_TYPE_DEBUG))
          {
            id v446 = [*v9 currentOffset];
            v559.st_dev = v466;
            *(void *)&v559.st_mode = v446;
            _os_log_debug_impl((void *)&_mh_execute_header, v419, OS_LOG_TYPE_DEBUG, "Finished central directory signature at offset %llu and we are also at a chunk boundary.", (uint8_t *)&v559, 0xCu);
          }
        }
LABEL_516:
        [*v9 setStreamState:7];
        id v10 = 0;
LABEL_517:
        uint64_t v14 = 1;
        goto LABEL_387;
      case 1u:
        if (![*v9 currentLFRecord]) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 567, "_currentState.currentLFRecord");
        }
        if ((unint64_t)[*v9 thisStageBytesComplete] > 0x1D) {
          goto LABEL_16;
        }
        sub_10000E564((uint64_t)[*v9 currentLFRecord], 30, *v9, (const void **)&v518, &v517);
        id v15 = (id)objc_claimAutoreleasedReturnValue();

        if (v15) {
          goto LABEL_470;
        }
        id v10 = 0;
LABEL_16:
        if ([*v9 thisStageBytesComplete] != (id)30) {
          goto LABEL_21;
        }
        objc_msgSend(*v9, "setCurrentLFRequiresDataDescriptor:", (*((unsigned __int16 *)objc_msgSend(*v9, "currentLFRecord") + 3) >> 3) & 1);
        int v20 = *((unsigned __int16 *)[*v9 currentLFRecord] + 13);
        id v21 = *v9;
        if (!v20)
        {
          v333 = [v21 unsureData];

          v334 = sub_100003788();
          v335 = v334;
          if (!v333)
          {
            if (os_log_type_enabled(v334, OS_LOG_TYPE_ERROR))
            {
              id v435 = [*v9 currentOffset];
              v559.st_dev = v466;
              *(void *)&v559.st_mode = v435;
              _os_log_error_impl((void *)&_mh_execute_header, v335, OS_LOG_TYPE_ERROR, "Encountered zero-length filename for local file record at offset %llu", (uint8_t *)&v559, 0xCu);
            }

            CFStringRef v570 = @"SZExtractorFileOffsetErrorKey";
            v380 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v9 currentOffset]);
            v571 = v380;
            v381 = +[NSDictionary dictionaryWithObjects:&v571 forKeys:&v570 count:1];
            id v450 = [*v9 currentOffset];
            sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 589, @"SZExtractorErrorDomain", 2, 0, v381, @"Encountered zero-length filename for local file record at offset %llu", v382, (uint64_t)v450);
            goto LABEL_510;
          }
          if (os_log_type_enabled(v334, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v559.st_dev) = 0;
            v336 = "Got zero-length filename; entering passthrough mode";
            v337 = v335;
            uint32_t v338 = 2;
LABEL_434:
            _os_log_impl((void *)&_mh_execute_header, v337, OS_LOG_TYPE_DEFAULT, v336, (uint8_t *)&v559, v338);
          }
LABEL_435:

          v339 = v518;
          uint64_t v340 = v517;
          uint64_t v341 = a1;
LABEL_448:
          uint64_t v350 = sub_10000E674(v341, (uint64_t)v339, v340);
LABEL_449:
          id v15 = (id)v350;
LABEL_469:

LABEL_470:
          uint64_t v14 = 0;
          id v10 = v15;
          goto LABEL_387;
        }
        uint64_t v22 = *((unsigned __int16 *)[v21 currentLFRecord] + 4);
        if ((v22 > 0xE || ((1 << v22) & 0x4101) == 0) && v22 != 99)
        {
          v405 = [*v9 unsureData];

          v406 = sub_100003788();
          v335 = v406;
          if (!v405)
          {
            if (os_log_type_enabled(v406, OS_LOG_TYPE_ERROR))
            {
              id v445 = [*v9 currentOffset];
              v559.st_dev = 67109376;
              *(_DWORD *)&v559.st_mode = v22;
              LOWORD(v559.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&v559.st_ino + 2) = (__darwin_ino64_t)v445;
              _os_log_error_impl((void *)&_mh_execute_header, v335, OS_LOG_TYPE_ERROR, "Encountered unsupported compression method %hu in stream at offset %llu", (uint8_t *)&v559, 0x12u);
            }

            CFStringRef v568 = @"SZExtractorFileOffsetErrorKey";
            v380 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v9 currentOffset]);
            v569 = v380;
            v381 = +[NSDictionary dictionaryWithObjects:&v569 forKeys:&v568 count:1];
            [*v9 currentOffset];
            sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 601, @"SZExtractorErrorDomain", 2, 0, v381, @"Encountered unsupported compression method %hu in stream at offset %llu", v418, v22);
            goto LABEL_510;
          }
          if (os_log_type_enabled(v406, OS_LOG_TYPE_DEFAULT))
          {
            v559.st_dev = 67109120;
            *(_DWORD *)&v559.st_mode = v22;
            v336 = "Got unexpected compression method: %hu; entering passthrough mode";
            v337 = v335;
            uint32_t v338 = 8;
            goto LABEL_434;
          }
          goto LABEL_435;
        }
LABEL_21:
        uint64_t v23 = v517;
        id v24 = *v9;
        if (!v517)
        {
LABEL_409:
          [v24 markResumptionPoint];
LABEL_481:
          uint64_t v14 = 0;
          goto LABEL_387;
        }
        if ((unint64_t)[v24 thisStageBytesComplete] <= 0x1D) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 617, "_currentState.thisStageBytesComplete >= sizeof(LocalFileRecord)");
        }
        uint64_t v25 = (unsigned __int16 *)[*v9 currentLFRecord];
        id v26 = (id)(v25[13] + (unint64_t)v25[14] + 30);
        if (v26 > [*v9 currentLFRecordAllocationSize])
        {
          objc_msgSend(*v9, "setCurrentLFRecord:", reallocf(objc_msgSend(*v9, "currentLFRecord"), (size_t)v26));
          if (![*v9 currentLFRecord])
          {
            v348 = sub_100003788();
            if (os_log_type_enabled(v348, OS_LOG_TYPE_ERROR))
            {
              LOWORD(v559.st_dev) = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v348, OS_LOG_TYPE_ERROR, "Could not allocate memory for local file record", (uint8_t *)&v559, 2u);
            }

            uint64_t v350 = sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 624, v465, 12, 0, 0, @"Could not allocate memory for local file record", v349, v453);
            goto LABEL_449;
          }
          [*v9 setCurrentLFRecordAllocationSize:v26];
        }
        if ([*v9 thisStageBytesComplete] < v26)
        {
          uint64_t v27 = sub_10000E564((uint64_t)[*v9 currentLFRecord], (uint64_t)v26, *v9, (const void **)&v518, &v517);

          if (v27) {
            goto LABEL_511;
          }
          uint64_t v23 = v517;
          if (!v517)
          {
LABEL_416:
            id v45 = *v9;
LABEL_417:
            [v45 markResumptionPoint];
            id v10 = 0;
            goto LABEL_481;
          }
          id v10 = 0;
        }
        if ([*v9 thisStageBytesComplete] != v26) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 643, "_currentState.thisStageBytesComplete == fullLFRSize");
        }
        unsigned __int8 v28 = [*v9 currentLFRequiresDataDescriptor];
        v471 = v13;
        if ((v28 & 1) == 0)
        {
          uint64_t v29 = sub_10000ECC4(*v9);
          uint64_t v30 = sub_10000EDB4(*v9);
          id v31 = *v9;
          if (v30 || !v29)
          {
            if (!*((_WORD *)[v31 currentLFRecord] + 4) && v29 != v30)
            {
              v354 = [*v9 unsureData];

              v355 = sub_100003788();
              v356 = v355;
              if (v354)
              {
                if (os_log_type_enabled(v355, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v559.st_dev) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v356, OS_LOG_TYPE_DEFAULT, "Stored file has compressed size != uncompressed size; entering passthrough mode",
                    (uint8_t *)&v559,
                    2u);
                }

                uint64_t v357 = sub_10000E674(a1, (uint64_t)v518, v23);
              }
              else
              {
                if (os_log_type_enabled(v355, OS_LOG_TYPE_ERROR))
                {
                  id v437 = [*v9 currentOffset];
                  v559.st_dev = 134218496;
                  *(void *)&v559.st_mode = v437;
                  WORD2(v559.st_ino) = 2048;
                  *(__darwin_ino64_t *)((char *)&v559.st_ino + 6) = v29;
                  HIWORD(v559.st_gid) = 2048;
                  *(void *)&v559.st_rdev = v30;
                  _os_log_error_impl((void *)&_mh_execute_header, v356, OS_LOG_TYPE_ERROR, "Encountered inconsistency in stream data: file at offset %llu is stored without compression but the uncompressed and compressed sizes are not equal (%llu != %llu)", (uint8_t *)&v559, 0x20u);
                }

                CFStringRef v564 = @"SZExtractorFileOffsetErrorKey";
                v388 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v9 currentOffset]);
                v565 = v388;
                v389 = +[NSDictionary dictionaryWithObjects:&v565 forKeys:&v564 count:1];
                id v390 = [*v9 currentOffset];
                uint64_t v357 = sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 671, @"SZExtractorErrorDomain", 2, 0, v389, @"Encountered inconsistency in stream data: file at offset %llu is stored without compression but the uncompressed and compressed sizes are not equal (%llu != %llu)", v391, (uint64_t)v390);
              }
              uint64_t v14 = 0;
              id v10 = (id)v357;
              goto LABEL_386;
            }
            goto LABEL_36;
          }
          v351 = [v31 unsureData];

          v352 = sub_100003788();
          v353 = v352;
          if (v351)
          {
            if (os_log_type_enabled(v352, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v559.st_dev) = 0;
              _os_log_impl((void *)&_mh_execute_header, v353, OS_LOG_TYPE_DEFAULT, "File has 0-length compressed size but non-zero uncompressed size; entering passthrough mode",
                (uint8_t *)&v559,
                2u);
            }

            v339 = v518;
            uint64_t v341 = a1;
            uint64_t v340 = v23;
            goto LABEL_448;
          }
          if (os_log_type_enabled(v352, OS_LOG_TYPE_ERROR))
          {
            id v436 = [*v9 currentOffset];
            v559.st_dev = v466;
            *(void *)&v559.st_mode = v436;
            _os_log_error_impl((void *)&_mh_execute_header, v353, OS_LOG_TYPE_ERROR, "Encountered inconsistency in stream data: file at offset %llu has a 0-length compressed size but a non-zero uncompressed size", (uint8_t *)&v559, 0xCu);
          }

          CFStringRef v566 = @"SZExtractorFileOffsetErrorKey";
          v380 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v9 currentOffset]);
          v567 = v380;
          v381 = +[NSDictionary dictionaryWithObjects:&v567 forKeys:&v566 count:1];
          id v451 = [*v9 currentOffset];
          sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 658, @"SZExtractorErrorDomain", 2, 0, v381, @"Encountered inconsistency in stream data: file at offset %llu has a 0-length compressed size but a non-zero uncompressed size", v387, (uint64_t)v451);
          uint64_t v27 = LABEL_510:;

LABEL_511:
          uint64_t v14 = 0;
          id v10 = (id)v27;
          goto LABEL_387;
        }
LABEL_36:
        id v476 = v10;
        sub_10000EEE0([*v9 currentLFRecord]);
        id v10 = objc_claimAutoreleasedReturnValue();
        uint64_t v32 = (const char *)[v10 fileSystemRepresentation];
        id v33 = *v9;
        if (!v10 || !v32)
        {
          v323 = [v33 unsureData];

          v324 = sub_100003788();
          v325 = v324;
          if (v323)
          {
            BOOL v326 = os_log_type_enabled(v324, OS_LOG_TYPE_DEFAULT);
            uint64_t v13 = v471;
            if (v326)
            {
              LOWORD(v559.st_dev) = 0;
              _os_log_impl((void *)&_mh_execute_header, v325, OS_LOG_TYPE_DEFAULT, "Failed to get filename for file; entering passthrough mode",
                (uint8_t *)&v559,
                2u);
            }

            sub_10000E674(a1, (uint64_t)v518, v23);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            BOOL v373 = os_log_type_enabled(v324, OS_LOG_TYPE_ERROR);
            uint64_t v13 = v471;
            if (v373)
            {
              id v425 = [*v9 currentOffset];
              v559.st_dev = v466;
              *(void *)&v559.st_mode = v425;
              _os_log_error_impl((void *)&_mh_execute_header, v325, OS_LOG_TYPE_ERROR, "Failed to get filename for file at offset %llu.", (uint8_t *)&v559, 0xCu);
            }

            CFStringRef v562 = @"SZExtractorFileOffsetErrorKey";
            v374 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v9 currentOffset]);
            v563 = v374;
            v375 = +[NSDictionary dictionaryWithObjects:&v563 forKeys:&v562 count:1];
            id v376 = [*v9 currentOffset];
            sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 686, @"SZExtractorErrorDomain", 2, 0, v375, @"Failed to get filename for file at offset %llu.", v377, (uint64_t)v376);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
          }
LABEL_468:

          goto LABEL_469;
        }
        __int16 v34 = (unsigned __int8 *)[v33 currentLFRecord];
        int v35 = v34[*((unsigned __int16 *)v34 + 13) + 29];
        [*v9 setPerformingExtraction:1];
        int v36 = *((unsigned __int16 *)[*v9 currentLFRecord] + 4);
        unsigned int v37 = [*v9 currentLFRequiresDataDescriptor];
        long long v38 = sub_100003830();
        BOOL v39 = os_signpost_enabled(v38);
        if (v37)
        {
          if (v39)
          {
            v559.st_dev = v463;
            *(void *)&v559.st_mode = v10;
            WORD2(v559.st_ino) = 1024;
            *(_DWORD *)((char *)&v559.st_ino + 6) = v36;
            NSErrorUserInfoKey v40 = v38;
            id v41 = "Processing file %@ (csize: ??; usize: ??; cmethod: %hu)";
            uint32_t v42 = 18;
LABEL_58:
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EXTRACTION", v41, (uint8_t *)&v559, v42);
          }
        }
        else if (v39)
        {
          uint64_t v55 = sub_10000EDB4(*v9);
          uint64_t v56 = sub_10000ECC4(*v9);
          v559.st_dev = v462;
          *(void *)&v559.st_mode = v10;
          WORD2(v559.st_ino) = 2048;
          *(__darwin_ino64_t *)((char *)&v559.st_ino + 6) = v55;
          HIWORD(v559.st_gid) = 2048;
          *(void *)&v559.st_rdev = v56;
          LOWORD(v559.st_atimespec.tv_sec) = 1024;
          *(_DWORD *)((char *)&v559.st_atimespec.tv_sec + 2) = v36;
          NSErrorUserInfoKey v40 = v38;
          id v41 = "Processing file %@ (csize: %llu; usize: %llu; cmethod: %hu)";
          uint32_t v42 = 38;
          goto LABEL_58;
        }

        if (v35 == 47
          && ([*v9 currentLFRequiresDataDescriptor] & 1) == 0
          && sub_10000EDB4(*v9))
        {
          v378 = [*v9 unsureData];

          v379 = sub_100003788();
          v327 = v379;
          a1 = v474;
          if (v378)
          {
            if (os_log_type_enabled(v379, OS_LOG_TYPE_DEFAULT))
            {
              v559.st_dev = v459;
              *(void *)&v559.st_mode = v32;
              v329 = "Got directory %s with non-zero compressed data size; entering passthrough mode";
              v330 = v327;
              uint32_t v331 = 12;
LABEL_428:
              _os_log_impl((void *)&_mh_execute_header, v330, OS_LOG_TYPE_DEFAULT, v329, (uint8_t *)&v559, v331);
            }
LABEL_429:

            sub_10000E674(a1, (uint64_t)v518, v23);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (os_log_type_enabled(v379, OS_LOG_TYPE_ERROR))
            {
              v559.st_dev = v459;
              *(void *)&v559.st_mode = v32;
              _os_log_error_impl((void *)&_mh_execute_header, v327, OS_LOG_TYPE_ERROR, "Directory %s has a non-zero compressed size; directories aren't supposed to have data.",
                (uint8_t *)&v559,
                0xCu);
            }

            CFStringRef v560 = @"SZExtractorFileOffsetErrorKey";
            v411 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v9 currentOffset]);
            v561 = v411;
            v412 = +[NSDictionary dictionaryWithObjects:&v561 forKeys:&v560 count:1];
            sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 708, @"SZExtractorErrorDomain", 2, 0, v412, @"Directory %s has a non-zero compressed size; directories aren't supposed to have data.",
              v413,
              (uint64_t)v32);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v13 = v471;
          goto LABEL_468;
        }
        uint64_t v57 = [*v9 unsureData];

        a1 = v474;
        if (!v57) {
          goto LABEL_107;
        }
        if ((unint64_t)[*v9 recordsProcessed] >= 3) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 714, "_currentState.recordsProcessed <= 2");
        }
        if (![*v9 recordsProcessed])
        {
          if (!strcmp(v32, "META-INF/")) {
            goto LABEL_107;
          }
          v58 = v32;
          id v59 = "mimetype";
          goto LABEL_94;
        }
        if ([*v9 recordsProcessed] != (id)1)
        {
          if ([*v9 recordsProcessed] == (id)2 && !strcmp(v32, "META-INF/com.apple.ZipMetadata.plist"))
          {
LABEL_104:
            v91 = sub_100003788();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
            {
              v559.st_dev = v459;
              *(void *)&v559.st_mode = v32;
              _os_log_debug_impl((void *)&_mh_execute_header, v91, OS_LOG_TYPE_DEBUG, "File %s is metadata file, so keeping in memory", (uint8_t *)&v559, 0xCu);
            }

            [*v9 setStoreCurrentFileInMemory:1];
            goto LABEL_107;
          }
LABEL_426:
          v327 = sub_100003788();
          if (os_log_type_enabled(v327, OS_LOG_TYPE_DEFAULT))
          {
            id v328 = [*v9 recordsProcessed];
            v559.st_dev = 134218498;
            *(void *)&v559.st_mode = v328;
            WORD2(v559.st_ino) = 2080;
            *(__darwin_ino64_t *)((char *)&v559.st_ino + 6) = (__darwin_ino64_t)v32;
            HIWORD(v559.st_gid) = 2080;
            *(void *)&v559.st_rdev = "META-INF/";
            v329 = "Item %lld (%s) in archive was not 'mimetype' or %s; entering passthrough mode";
            v330 = v327;
            uint32_t v331 = 32;
            goto LABEL_428;
          }
          goto LABEL_429;
        }
        if (!strcmp(v32, "META-INF/com.apple.ZipMetadata.plist")) {
          goto LABEL_104;
        }
        v58 = v32;
        id v59 = "META-INF/";
LABEL_94:
        if (strcmp(v58, v59)) {
          goto LABEL_426;
        }
LABEL_107:
        if (!strcmp(v32, "META-INF/com.apple.FixedZipMetadata.bin"))
        {
          v92 = sub_100003788();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
          {
            v559.st_dev = v459;
            *(void *)&v559.st_mode = v32;
            _os_log_debug_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEBUG, "File %s is fixed metadata file, so keeping in memory", (uint8_t *)&v559, 0xCu);
          }

          [*v9 setStoreCurrentFileInMemory:1];
        }
        id v93 = [v472 stringByAppendingPathComponent:v10];
        v473 = (char *)[v93 fileSystemRepresentation];
        v94 = [*v9 streamInfoDict];

        id v95 = *v9;
        if (!v94)
        {
          if (v35 == 47) {
            uint64_t v97 = 16877;
          }
          else {
            uint64_t v97 = 33188;
          }
          goto LABEL_120;
        }
        uint64_t v96 = sub_100003C50((uint64_t)[v95 currentLFRecord], word_10001DB54, 2u);
        if (v96)
        {
          uint64_t v97 = *(unsigned __int16 *)(v96 + 4);
          id v95 = *v9;
LABEL_120:
          [v95 setCurrentLFMode:v97];
          goto LABEL_192;
        }
        v98 = [*v9 streamInfoDict];
        v99 = v98;
        if (v35 != 47)
        {
          v100 = [v98 objectForKeyedSubscript:@"StandardFilePerms"];

          if (!v100)
          {
            uint64_t v101 = 33188;
            goto LABEL_191;
          }
LABEL_134:
          uint64_t v101 = (uint64_t)[v100 unsignedShortValue];
          goto LABEL_191;
        }
        v100 = [v98 objectForKeyedSubscript:@"StandardDirectoryPerms"];

        if (v100) {
          goto LABEL_134;
        }
        uint64_t v101 = 16877;
LABEL_191:
        [*v9 setCurrentLFMode:v101];

LABEL_192:
        objc_msgSend(*v9, "setCurrentLFMode:", (unint64_t)objc_msgSend(*v9, "currentLFMode") & 0xFFFFF1FF);
        if (([*v9 currentLFMode] & 0xF000) == 0xA000)
        {
          v156 = sub_100003788();
          if (os_log_type_enabled(v156, OS_LOG_TYPE_DEBUG))
          {
            unsigned int v247 = [*v9 currentLFMode];
            v559.st_dev = v461;
            *(void *)&v559.st_mode = v32;
            WORD2(v559.st_ino) = 1024;
            *(_DWORD *)((char *)&v559.st_ino + 6) = v247;
            _os_log_debug_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_DEBUG, "File %s is a symlink (mode = 0%o), so keeping in memory", (uint8_t *)&v559, 0x12u);
          }

          [*v9 setStoreCurrentFileInMemory:1];
        }
        unint64_t v157 = sub_100003CC4((uint64_t)[*v9 currentLFRecord]);
        if (v157 > 0x500000)
        {
          __darwin_ino64_t v158 = v157;
          v159 = sub_100003788();
          if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
          {
            v559.st_dev = v461;
            *(void *)&v559.st_mode = v32;
            WORD2(v559.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v559.st_ino + 6) = v158;
            _os_log_debug_impl((void *)&_mh_execute_header, v159, OS_LOG_TYPE_DEBUG, "File %s is larger than 5 MB (%llu) so not keeping in memory", (uint8_t *)&v559, 0x16u);
          }

          [*v9 setStoreCurrentFileInMemory:0];
        }
        v160 = [v93 stringByDeletingLastPathComponent];
        if (([v160 isEqualToString:v472] & 1) == 0)
        {
          id v161 = v160;
          v162 = (const char *)[v161 fileSystemRepresentation];
          memset(&v559, 0, sizeof(v559));
          if (stat(v162, &v559))
          {
            v163 = v7;
            if (*__error() != 2)
            {
              uint64_t v185 = *__error();
              v186 = sub_100003788();
              if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
              {
                v265 = strerror(v185);
                uid_t v555 = v463;
                id v556 = v161;
                __int16 v557 = 2080;
                v558 = v265;
                _os_log_error_impl((void *)&_mh_execute_header, v186, OS_LOG_TYPE_ERROR, "Can't determine if parent path exists %@: %s", (uint8_t *)&v555, 0x16u);
              }

              NSErrorUserInfoKey v551 = v470;
              id v552 = v161;
              v187 = +[NSDictionary dictionaryWithObjects:&v552 forKeys:&v551 count:1];
              strerror(v185);
              v189 = sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 881, v465, v185, 0, v187, @"Can't determine if parent path exists %@: %s", v188, (uint64_t)v161);

              int v54 = 2;
              id v476 = v189;
              id v7 = v163;
              goto LABEL_247;
            }
            v164 = sub_100003788();
            if (os_log_type_enabled(v164, OS_LOG_TYPE_DEBUG))
            {
              uid_t v555 = v464;
              id v556 = v161;
              _os_log_debug_impl((void *)&_mh_execute_header, v164, OS_LOG_TYPE_DEBUG, "Parent path %@ did not exist", (uint8_t *)&v555, 0xCu);
            }

            int v165 = mkpath_np(v162, 0x1EDu);
            int v166 = v165;
            int v54 = 0;
            int v167 = 1;
            if (v165 && v165 != 17)
            {
              v168 = sub_100003788();
              if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
              {
                v279 = strerror(v166);
                uid_t v555 = v463;
                id v556 = v161;
                __int16 v557 = 2080;
                v558 = v279;
                _os_log_error_impl((void *)&_mh_execute_header, v168, OS_LOG_TYPE_ERROR, "Failed to create parent directory %@: %s", (uint8_t *)&v555, 0x16u);
              }

              NSErrorUserInfoKey v553 = v470;
              id v554 = v161;
              v169 = +[NSDictionary dictionaryWithObjects:&v554 forKeys:&v553 count:1];
              strerror(v166);
              v171 = sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 834, v465, v166, 0, v169, @"Failed to create parent directory %@: %s", v170, (uint64_t)v161);

              int v167 = 0;
              int v54 = 2;
              id v476 = v171;
            }
            id v7 = v163;
            a1 = v474;
            if (v166 && v166 != 17 && !v167) {
              goto LABEL_248;
            }
          }
        }
        v172 = v475;
        uint64_t v173 = sub_100003C50((uint64_t)[*v475 currentLFRecord], &word_10001DB50, 8u);
        id v174 = *v172;
        if (v35 != 47)
        {
          if ([v174 storeCurrentFileInMemory]) {
            goto LABEL_240;
          }
          [*v172 fileWriter];
          if (objc_claimAutoreleasedReturnValue()) {
            __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 929, "!_currentState.fileWriter");
          }
          unsigned __int8 v183 = [*v172 currentLFRequiresDataDescriptor];
          v468 = v7;
          if (v183) {
            uint64_t v184 = -1;
          }
          else {
            uint64_t v184 = sub_10000ECC4(*v172);
          }
          uint64_t v195 = v474;
          id v196 = [*(id *)(v474 + 64) performCachedWrites];
          uint64_t v197 = *(void *)(v195 + 96);
          id v198 = v476;
          id v515 = v476;
          v199 = +[StreamingFileWriter fileWriterForPath:v93 withOpenFlags:1537 mode:384 quarantineInfo:0 performCachedWrites:v196 expectedSize:v184 asyncTrackingGroup:v197 errorDelegate:v195 error:&v515];
          id v200 = v515;

          if (v199)
          {
            v559.st_dev = -1;
            uid_t v555 = -1;
            v172 = v475;
            id v201 = [*v475 resolveOwnershipWithExtraField:v173 outUID:&v559 outGID:&v555];
            [v199 configureFileAndSetOwnership:v201 toUID:v559.st_dev GID:v555];
            [*v172 setFileWriter:v199];

            id v476 = v200;
            id v7 = v468;
            a1 = v474;
            goto LABEL_240;
          }
          v202 = sub_100003788();
          if (os_log_type_enabled(v202, OS_LOG_TYPE_ERROR))
          {
            v559.st_dev = v464;
            *(void *)&v559.st_mode = v93;
            _os_log_error_impl((void *)&_mh_execute_header, v202, OS_LOG_TYPE_ERROR, "Failed to open output file at path %@", (uint8_t *)&v559, 0xCu);
          }

          NSErrorUserInfoKey v547 = v470;
          id v548 = v93;
          v203 = +[NSDictionary dictionaryWithObjects:&v548 forKeys:&v547 count:1];
          sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 940, @"SZExtractorErrorDomain", 1, v200, v203, @"Failed to open output file at path %@", v204, (uint64_t)v93);
          id v476 = (id)objc_claimAutoreleasedReturnValue();

          int v54 = 2;
          id v7 = v468;
LABEL_247:
          a1 = v474;
          goto LABEL_248;
        }
        if ((~[v174 currentLFMode] & 0xC0) != 0) {
          objc_msgSend(*v172, "setCurrentLFMode:", objc_msgSend(*v172, "currentLFMode") | 0xC0);
        }
        mode_t v175 = (unsigned __int16)[*v172 currentLFMode];
        v176 = v473;
        if (!mkdir(v473, v175)) {
          goto LABEL_222;
        }
        if (*__error() == 17)
        {
          if (chmod(v176, (mode_t)[*v172 currentLFMode]))
          {
            v177 = sub_100003788();
            if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR))
            {
              v270 = __error();
              v271 = strerror(*v270);
              v559.st_dev = v463;
              *(void *)&v559.st_mode = v93;
              WORD2(v559.st_ino) = 2080;
              *(__darwin_ino64_t *)((char *)&v559.st_ino + 6) = (__darwin_ino64_t)v271;
              _os_log_error_impl((void *)&_mh_execute_header, v177, OS_LOG_TYPE_ERROR, "Failed to set proper mode on directory %@: %s", (uint8_t *)&v559, 0x16u);
            }
          }
LABEL_222:
          uid_t v555 = -1;
          gid_t v516 = -1;
          if ([*v172 resolveOwnershipWithExtraField:v173 outUID:&v555 outGID:&v516]
            && lchown(v176, v555, v516))
          {
            dev_t v178 = *__error();
            v179 = sub_100003788();
            if (os_log_type_enabled(v179, OS_LOG_TYPE_DEFAULT))
            {
              uid_t v180 = v555;
              v468 = v7;
              gid_t v181 = v516;
              v182 = strerror(v178);
              v559.st_dev = v458;
              *(void *)&v559.st_mode = v176;
              WORD2(v559.st_ino) = 1024;
              *(_DWORD *)((char *)&v559.st_ino + 6) = v180;
              a1 = v474;
              HIWORD(v559.st_uid) = 1024;
              v559.st_gid = v181;
              id v7 = v468;
              LOWORD(v559.st_rdev) = 1024;
              *(dev_t *)((char *)&v559.st_rdev + 2) = v178;
              *((_WORD *)&v559.st_rdev + 3) = 2080;
              v559.st_atimespec.tv_sec = (__darwin_time_t)v182;
              _os_log_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_DEFAULT, "Failed to lchown %s to (%d:%d) : %d (%s)", (uint8_t *)&v559, 0x28u);
            }
          }
LABEL_240:
          if (([*v172 currentLFRequiresDataDescriptor] & 1) != 0 || sub_10000EDB4(*v172))
          {
            [*v172 setStreamState:2];
            int v54 = 0;
          }
          else
          {
            [*v172 setStreamState:4];
            int v54 = 3;
          }
          goto LABEL_248;
        }
        uint64_t v190 = *__error();
        v191 = sub_100003788();
        if (os_log_type_enabled(v191, OS_LOG_TYPE_ERROR))
        {
          v266 = strerror(v190);
          v559.st_dev = v463;
          *(void *)&v559.st_mode = v93;
          WORD2(v559.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&v559.st_ino + 6) = (__darwin_ino64_t)v266;
          _os_log_error_impl((void *)&_mh_execute_header, v191, OS_LOG_TYPE_ERROR, "Failed to create directory at path %@: %s", (uint8_t *)&v559, 0x16u);
        }

        NSErrorUserInfoKey v549 = v470;
        id v550 = v93;
        v192 = +[NSDictionary dictionaryWithObjects:&v550 forKeys:&v549 count:1];
        strerror(v190);
        v194 = sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 899, v465, v190, 0, v192, @"Failed to create directory at path %@: %s", v193, (uint64_t)v93);

        int v54 = 2;
        id v476 = v194;
LABEL_248:

        if (v54)
        {
          uint64_t v13 = v471;
          id v10 = v476;
          goto LABEL_354;
        }
        unint64_t v12 = v517;
        id v9 = v475;
        id v10 = v476;
        uint64_t v13 = v471;
LABEL_251:
        unsigned int v205 = [*v9 currentLFRequiresDataDescriptor];
        int v206 = *((unsigned __int16 *)[*v9 currentLFRecord] + 4);
        unsigned int v469 = v205;
        if (!v205 || (unint64_t v207 = v12, !v206))
        {
          uint64_t v208 = sub_10000EDB4(*v9);
          id v209 = [*v9 thisStageBytesComplete];
          if (v12 >= v208 - (uint64_t)v209) {
            unint64_t v207 = v208 - (void)v209;
          }
          else {
            unint64_t v207 = v12;
          }
        }
        if ([*v9 thisStageBytesComplete])
        {
          if (v207) {
            goto LABEL_260;
          }
LABEL_318:
          if (v469 && *((_WORD *)[*v9 currentLFRecord] + 4))
          {
            if (v207)
            {
              id v244 = *v9;
LABEL_324:
              int v54 = 3;
              [v244 setStreamState:3];
              goto LABEL_354;
            }
            goto LABEL_55;
          }
          id v245 = [*v9 thisStageBytesComplete];
          if (v245 != (id)sub_10000EDB4(*v9))
          {
            if (v12) {
              __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1295, "0 == length");
            }
            goto LABEL_481;
          }
          id v244 = *v9;
          if (v469) {
            goto LABEL_324;
          }
          [v244 setStreamState:4];
LABEL_55:
          int v54 = 3;
LABEL_354:
          BOOL v262 = v54 == 3;
          id v9 = v475;
          if (!v262) {
            goto LABEL_375;
          }
          continue;
        }
        objc_msgSend(*v9, "setCurrentCRC32:", crc32(0, 0, 0));
        if (!v207) {
          goto LABEL_318;
        }
LABEL_260:
        id v476 = v10;
        int v454 = 0;
        int v455 = v206;
        v468 = v7;
        v471 = v13;
        while (2)
        {
          if (v207 >= 0x7FFFFFFF) {
            __darwin_ino64_t v210 = 0x7FFFFFFFLL;
          }
          else {
            __darwin_ino64_t v210 = v207;
          }
          unint64_t v467 = v207 - v210;
          if (v206 <= 13)
          {
            if (v206)
            {
              if (v206 != 8) {
                goto LABEL_457;
              }
              goto LABEL_270;
            }
            id v229 = [*v9 currentCRC32];
            v230 = v518;
            objc_msgSend(*v9, "setCurrentCRC32:", crc32((uLong)v229, v518, v210));
            unsigned int v231 = [*v9 storeCurrentFileInMemory];
            id v232 = *v9;
            if (v231)
            {
              v233 = [v232 inMemoryFileData];
              [v233 appendBytes:v230 length:v210];
            }
            else
            {
              v234 = [v232 fileWriter];
              if (!v234) {
                __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 993, "_currentState.fileWriter");
              }

              v235 = [*v9 fileWriter];
              id v236 = v476;
              id v514 = v476;
              unsigned int v237 = [v235 writeBuffer:v230 length:v210 error:&v514];
              id v15 = v514;

              if (!v237) {
                goto LABEL_470;
              }
              id v476 = v15;
            }
            objc_msgSend(*v9, "setCurrentOffset:", (char *)objc_msgSend(*v9, "currentOffset") + v210);
            objc_msgSend(*v9, "setThisStageBytesComplete:", (char *)objc_msgSend(*v9, "thisStageBytesComplete") + v210);
            objc_msgSend(*v9, "setUncompressedBytesOutput:", (char *)objc_msgSend(*v9, "uncompressedBytesOutput") + v210);
            objc_msgSend(*v9, "setTotalFileSizeWritten:", (char *)objc_msgSend(*v9, "totalFileSizeWritten") + v210);
            if ([*v9 totalUncompressedBytes]) {
              sub_10000F394(a1, (double)(unint64_t)[*(id *)(a1 + 64) totalFileSizeWritten]/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "totalUncompressedBytes"));
            }
            id v238 = *v9;
            v239 = (char *)[*v9 currentOffset];
            id v15 = [v238 updateHashFromOffset:&v239[-v210] withBytes:v518 length:v210];

            if (v15) {
              goto LABEL_470;
            }
            [*v9 markResumptionPoint];
            id v476 = 0;
LABEL_316:
            v242 = [*v9 unsureData];
            v243 = v518;
            [v242 appendBytes:v518 length:v210];

            unint64_t v12 = v517 - v210;
            size_t v517 = v12;
            v518 = &v243[v210];
            int v206 = v455;
            unint64_t v207 = v467;
            if (!v467)
            {
              id v10 = v476;
              LOBYTE(v207) = v454;
              goto LABEL_318;
            }
            continue;
          }
          break;
        }
        if (v206 != 14 && v206 != 99)
        {
LABEL_457:
          v294 = v13;
          v363 = sub_10000EEE0([*v9 currentLFRecord]);
          v535[0] = @"SZExtractorFileOffsetErrorKey";
          v364 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v9 currentOffset]);
          v535[1] = v470;
          v536[0] = v364;
          v536[1] = v363;
          v365 = +[NSDictionary dictionaryWithObjects:v536 forKeys:v535 count:2];

          v366 = sub_100003788();
          if (os_log_type_enabled(v366, OS_LOG_TYPE_ERROR))
          {
            int v420 = *((unsigned __int16 *)[*v9 currentLFRecord] + 4);
            v559.st_dev = 67109378;
            *(_DWORD *)&v559.st_mode = v420;
            LOWORD(v559.st_ino) = 2112;
            *(__darwin_ino64_t *)((char *)&v559.st_ino + 2) = (__darwin_ino64_t)v363;
            _os_log_error_impl((void *)&_mh_execute_header, v366, OS_LOG_TYPE_ERROR, "Unknown compression method %hu for file %@", (uint8_t *)&v559, 0x12u);
          }

          v367 = (unsigned __int16 *)[*v9 currentLFRecord];
          sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1283, @"SZExtractorErrorDomain", 2, 0, v365, @"Unknown compression method %hu for file %@", v368, v367[4]);
          id v10 = (id)objc_claimAutoreleasedReturnValue();

          uint64_t v14 = 0;
          goto LABEL_404;
        }
LABEL_270:
        if (!*(void *)(a1 + 56)) {
          *(void *)(a1 + 56) = malloc_type_malloc(0x10000uLL, 0x165A7F06uLL);
        }
        v211 = (compression_stream *)[*v9 cmpState];
        if (![*v9 thisStageBytesComplete])
        {
          uint64_t v212 = compression_stream_reinit();
          if (v212)
          {
            uint64_t v358 = v212;
            v359 = sub_100003788();
            if (os_log_type_enabled(v359, OS_LOG_TYPE_ERROR))
            {
              v559.st_dev = 67109120;
              *(_DWORD *)&v559.st_mode = v358;
              _os_log_error_impl((void *)&_mh_execute_header, v359, OS_LOG_TYPE_ERROR, "Failed to initialize compression: %d", (uint8_t *)&v559, 8u);
            }

            CFStringRef v545 = @"SZExtractorCompressionLibErrorKey";
            v360 = +[NSNumber numberWithInt:v358];
            v546 = v360;
            v361 = +[NSDictionary dictionaryWithObjects:&v546 forKeys:&v545 count:1];
            sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1044, @"SZExtractorErrorDomain", 1, 0, v361, @"Failed to initialize compression: %d", v362, v358);
            id v10 = (id)objc_claimAutoreleasedReturnValue();

            uint64_t v14 = 0;
LABEL_396:
            id v7 = v468;
            goto LABEL_386;
          }
        }
        LODWORD(v473) = 0;
        src_ptr = v518;
        v211->src_ptr = v518;
        v211->size_t src_size = v210;
        while (2)
        {
          v211->dst_ptr = *(uint8_t **)(a1 + 56);
          v211->unint64_t dst_size = 0x10000;
          uint64_t v214 = compression_stream_process(v211, 0);
          size_t src_size = v211->src_size;
          __darwin_ino64_t v216 = v210 - src_size;
          v217 = sub_100003788();
          if (os_log_type_enabled(v217, OS_LOG_TYPE_DEBUG))
          {
            v559.st_dev = v466;
            *(void *)&v559.st_mode = v210 - src_size;
            _os_log_debug_impl((void *)&_mh_execute_header, v217, OS_LOG_TYPE_DEBUG, "compression_stream_process consumed %zu bytes", (uint8_t *)&v559, 0xCu);
          }

          v218 = v475;
          objc_msgSend(*v475, "setCurrentOffset:", (char *)objc_msgSend(*v475, "currentOffset") + v216);
          objc_msgSend(*v218, "setThisStageBytesComplete:", (char *)objc_msgSend(*v218, "thisStageBytesComplete") + v216);
          unint64_t dst_size = v211->dst_size;
          if (dst_size > 0x10000) {
            __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1083, "outputSize >= cmpState->dst_size");
          }
          if (!v214 && v210 && v210 == src_size && dst_size == 0x10000)
          {
            v543[0] = @"SZExtractorFileOffsetErrorKey";
            id v9 = v475;
            v282 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v475 currentOffset]);
            v544[0] = v282;
            v543[1] = v470;
            v283 = sub_10000EEE0([*v9 currentLFRecord]);
            v544[1] = v283;
            v284 = +[NSDictionary dictionaryWithObjects:v544 forKeys:v543 count:2];

            v285 = sub_100003788();
            if (os_log_type_enabled(v285, OS_LOG_TYPE_ERROR))
            {
              sub_10000EEE0([*v9 currentLFRecord]);
              id v332 = (id)objc_claimAutoreleasedReturnValue();
              v559.st_dev = 138412802;
              *(void *)&v559.st_mode = v332;
              WORD2(v559.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&v559.st_ino + 6) = v210;
              HIWORD(v559.st_gid) = 2048;
              *(void *)&v559.st_rdev = 0x10000;
              _os_log_error_impl((void *)&_mh_execute_header, v285, OS_LOG_TYPE_ERROR, "compression_stream_process did not consume data for output file %@; input buffer size: %zu, output buffer size: %zu",
                (uint8_t *)&v559,
                0x20u);
            }
            v286 = sub_10000EEE0([*v9 currentLFRecord]);
            sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1089, @"SZExtractorErrorDomain", 1, 0, v284, @"compression_stream_process did not consume data for output file %@; input buffer size: %zu, output buffer size: %zu",
              v287,
              (uint64_t)v286);
            id v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_383:
LABEL_384:
            uint64_t v14 = 0;
            id v7 = v468;
            goto LABEL_385;
          }
          if (v214 >= 2)
          {
            v541[0] = @"SZExtractorCompressionLibErrorKey";
            v288 = +[NSNumber numberWithInt:v214];
            v542[0] = v288;
            v541[1] = @"SZExtractorFileOffsetErrorKey";
            id v9 = v475;
            v289 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v475 currentOffset]);
            v542[1] = v289;
            v541[2] = v470;
            v290 = sub_10000EEE0([*v9 currentLFRecord]);
            v542[2] = v290;
            v284 = +[NSDictionary dictionaryWithObjects:v542 forKeys:v541 count:3];

            v291 = sub_100003788();
            if (os_log_type_enabled(v291, OS_LOG_TYPE_ERROR))
            {
              v559.st_dev = 67109120;
              *(_DWORD *)&v559.st_mode = v214;
              _os_log_error_impl((void *)&_mh_execute_header, v291, OS_LOG_TYPE_ERROR, "compression_stream_process returned unexpected result %d", (uint8_t *)&v559, 8u);
            }

            sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1097, @"SZExtractorErrorDomain", 2, 0, v284, @"compression_stream_process returned unexpected result %d", v292, v214);
            id v10 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_383;
          }
          if (v210 == src_size)
          {
            id v9 = v475;
            id v10 = v476;
          }
          else
          {
            id v9 = v475;
            objc_msgSend(*v475, "updateHashFromOffset:withBytes:length:", (char *)objc_msgSend(*v475, "currentOffset") - v216, src_ptr, v216);
            id v10 = (id)objc_claimAutoreleasedReturnValue();

            if (v10) {
              goto LABEL_384;
            }
            LODWORD(v473) = v473 + v216;
          }
          if (dst_size == 0x10000)
          {
            a1 = v474;
          }
          else
          {
            unint64_t v220 = 0x10000 - dst_size;
            a1 = v474;
            objc_msgSend(*(id *)(v474 + 64), "setUncompressedBytesOutput:", (char *)objc_msgSend(*(id *)(v474 + 64), "uncompressedBytesOutput") + v220);
            objc_msgSend(*(id *)(a1 + 64), "setCurrentCRC32:", crc32((uLong)objc_msgSend(*(id *)(a1 + 64), "currentCRC32"), *(const Bytef **)(a1 + 56), v220));
            unsigned int v221 = [*(id *)(a1 + 64) storeCurrentFileInMemory];
            v222 = *(void **)(a1 + 64);
            if (v221)
            {
              v223 = [v222 inMemoryFileData];
              [v223 appendBytes:*(void *)(a1 + 56) length:v220];
            }
            else
            {
              v224 = [v222 fileWriter];
              if (!v224) {
                __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1118, "_currentState.fileWriter");
              }

              v225 = [*(id *)(a1 + 64) fileWriter];
              uint64_t v226 = *(void *)(a1 + 56);
              id v513 = v10;
              unsigned int v227 = [v225 writeBuffer:v226 length:v220 error:&v513];
              id v228 = v513;

              if (!v227)
              {
                uint64_t v14 = 0;
                id v10 = v228;
                goto LABEL_396;
              }
              id v10 = v228;
            }
            objc_msgSend(*v9, "setTotalFileSizeWritten:", (char *)objc_msgSend(*v9, "totalFileSizeWritten") + v220);
            if ([*v9 totalUncompressedBytes]) {
              sub_10000F394(a1, (double)(unint64_t)[*(id *)(a1 + 64) totalFileSizeWritten]/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "totalUncompressedBytes"));
            }
          }
          id v476 = v10;
          if (!v214)
          {
            __darwin_ino64_t v210 = v211->src_size;
            if (!v210 && v211->dst_size)
            {
              LODWORD(v210) = v473;
              id v7 = v468;
LABEL_315:
              uint64_t v13 = v471;
              goto LABEL_316;
            }
            src_ptr = v211->src_ptr;
            continue;
          }
          break;
        }
        id v7 = v468;
        if (v469)
        {
          unint64_t v467 = 0;
          int v454 = 1;
          goto LABEL_313;
        }
        id v240 = (id)sub_10000EDB4(*v9);
        if (v240 != [*v9 thisStageBytesComplete])
        {
          v392 = sub_100003788();
          if (os_log_type_enabled(v392, OS_LOG_TYPE_ERROR))
          {
            uint64_t v438 = sub_10000EDB4(*v9);
            uint64_t v439 = v438 - (void)[*v9 thisStageBytesComplete];
            sub_10000EEE0([*v9 currentLFRecord]);
            id v440 = (id)objc_claimAutoreleasedReturnValue();
            v559.st_dev = 134218242;
            *(void *)&v559.st_mode = v439;
            WORD2(v559.st_ino) = 2112;
            *(__darwin_ino64_t *)((char *)&v559.st_ino + 6) = (__darwin_ino64_t)v440;
            _os_log_error_impl((void *)&_mh_execute_header, v392, OS_LOG_TYPE_ERROR, "Hit compression stream end with %llu compressed bytes remaining for file %@", (uint8_t *)&v559, 0x16u);
          }
          CFStringRef v539 = @"SZExtractorFileOffsetErrorKey";
          v393 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v9 currentOffset]);
          v540 = v393;
          v394 = +[NSDictionary dictionaryWithObjects:&v540 forKeys:&v539 count:1];
          uint64_t v395 = sub_10000EDB4(*v9);
          uint64_t v396 = v395 - (void)[*v9 thisStageBytesComplete];
          v452 = sub_10000EEE0([*v9 currentLFRecord]);
          uint64_t v398 = sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1140, @"SZExtractorErrorDomain", 2, 0, v394, @"Hit compression stream end with %llu compressed bytes remaining for file %@", v397, v396);

          uint64_t v14 = 0;
          id v10 = (id)v398;
LABEL_385:
          a1 = v474;
          goto LABEL_386;
        }
        id v241 = (id)sub_10000ECC4(*v9);
        if (v241 == [*v9 uncompressedBytesOutput])
        {
LABEL_313:
          LODWORD(v210) = v473;
          goto LABEL_315;
        }
        v399 = sub_100003788();
        if (os_log_type_enabled(v399, OS_LOG_TYPE_ERROR))
        {
          id v441 = [*v9 uncompressedBytesOutput];
          sub_10000EEE0([*v9 currentLFRecord]);
          id v442 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v443 = sub_10000ECC4(*v9);
          v559.st_dev = 134218498;
          *(void *)&v559.st_mode = v441;
          WORD2(v559.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&v559.st_ino + 6) = (__darwin_ino64_t)v442;
          HIWORD(v559.st_gid) = 2048;
          *(void *)&v559.st_rdev = v443;
          _os_log_error_impl((void *)&_mh_execute_header, v399, OS_LOG_TYPE_ERROR, "Hit compression stream end at %llu bytes output for file %@, but expected uncompressed file size of %llu bytes", (uint8_t *)&v559, 0x20u);
        }
        CFStringRef v537 = @"SZExtractorFileOffsetErrorKey";
        v400 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v9 currentOffset]);
        v538 = v400;
        v401 = +[NSDictionary dictionaryWithObjects:&v538 forKeys:&v537 count:1];
        id v402 = [*v9 uncompressedBytesOutput];
        v449 = sub_10000EEE0([*v9 currentLFRecord]);
        sub_10000ECC4(*v9);
        uint64_t v404 = sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1143, @"SZExtractorErrorDomain", 2, 0, v401, @"Hit compression stream end at %llu bytes output for file %@, but expected uncompressed file size of %llu bytes", v403, (uint64_t)v402);

        uint64_t v14 = 0;
        id v10 = (id)v404;
LABEL_386:
        uint64_t v13 = v471;
LABEL_387:
        if (v10)
        {
LABEL_388:
          if ([*v9 performingExtraction])
          {
            v293 = sub_100003830();
            if (os_signpost_enabled(v293))
            {
              LOWORD(v559.st_dev) = 0;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v293, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EXTRACTION", "Extraction failed", (uint8_t *)&v559, 2u);
            }

            [*v9 setPerformingExtraction:0];
          }
          sub_100008364(a1);
        }
LABEL_393:
        v7[2](v7, v10, v14);

LABEL_394:
        return;
      case 2u:
        goto LABEL_251;
      case 3u:
        if (![*v9 dataDescriptor]) {
          objc_msgSend(*v9, "setDataDescriptor:", malloc_type_calloc(1uLL, 0x18uLL, 0x1000040504FFAC1uLL));
        }
        uint64_t v43 = sub_100003C50((uint64_t)[*v9 currentLFRecord], &word_10001DB52, 0x10u);
        if (v43) {
          uint64_t v44 = 24;
        }
        else {
          uint64_t v44 = 16;
        }
        uint64_t v27 = sub_10000E564((uint64_t)[*v9 dataDescriptor], v44, *v9, (const void **)&v518, &v517);

        if (v27) {
          goto LABEL_511;
        }
        unint64_t v12 = v517;
        id v45 = *v9;
        if (!v517) {
          goto LABEL_417;
        }
        if ([v45 thisStageBytesComplete] != (id)v44) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1334, "_currentState.thisStageBytesComplete == expected_size");
        }
        if (*(_DWORD *)[*v9 dataDescriptor] != 134695760)
        {
          v313 = [*v9 unsureData];

          v314 = sub_100003788();
          v315 = v314;
          if (!v313)
          {
            if (os_log_type_enabled(v314, OS_LOG_TYPE_ERROR))
            {
              int v421 = *(unsigned __int8 *)[*v9 dataDescriptor];
              int v422 = *((unsigned __int8 *)[*v9 dataDescriptor] + 1);
              uid_t v423 = *((unsigned __int8 *)[*v9 dataDescriptor] + 2);
              gid_t v424 = *((unsigned __int8 *)[*v9 dataDescriptor] + 3);
              v559.st_dev = 67109888;
              *(_DWORD *)&v559.st_mode = v421;
              LOWORD(v559.st_ino) = 1024;
              *(_DWORD *)((char *)&v559.st_ino + 2) = v422;
              HIWORD(v559.st_ino) = 1024;
              v559.st_uid = v423;
              LOWORD(v559.st_gid) = 1024;
              *(gid_t *)((char *)&v559.st_gid + 2) = v424;
              _os_log_error_impl((void *)&_mh_execute_header, v315, OS_LOG_TYPE_ERROR, "Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx).", (uint8_t *)&v559, 0x1Au);
            }

            CFStringRef v533 = @"SZExtractorFileOffsetErrorKey";
            v369 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v9 currentOffset]);
            v534 = v369;
            v370 = +[NSDictionary dictionaryWithObjects:&v534 forKeys:&v533 count:1];
            uint64_t v371 = *(unsigned __int8 *)[*v9 dataDescriptor];
            [*v9 dataDescriptor];
            [*v9 dataDescriptor];
            [*v475 dataDescriptor];
            id v9 = v475;
            sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1343, @"SZExtractorErrorDomain", 2, 0, v370, @"Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx).", v372, v371);
            id v10 = (id)objc_claimAutoreleasedReturnValue();

            uint64_t v14 = 0;
            a1 = v474;
            goto LABEL_387;
          }
          if (os_log_type_enabled(v314, OS_LOG_TYPE_DEFAULT))
          {
            int v316 = *(unsigned __int8 *)[*v9 dataDescriptor];
            int v317 = *((unsigned __int8 *)[*v9 dataDescriptor] + 1);
            uid_t v318 = *((unsigned __int8 *)[*v9 dataDescriptor] + 2);
            gid_t v319 = *((unsigned __int8 *)[*v9 dataDescriptor] + 3);
            v559.st_dev = 67109888;
            *(_DWORD *)&v559.st_mode = v316;
            a1 = v474;
            LOWORD(v559.st_ino) = 1024;
            *(_DWORD *)((char *)&v559.st_ino + 2) = v317;
            HIWORD(v559.st_ino) = 1024;
            v559.st_uid = v318;
            LOWORD(v559.st_gid) = 1024;
            *(gid_t *)((char *)&v559.st_gid + 2) = v319;
            _os_log_impl((void *)&_mh_execute_header, v315, OS_LOG_TYPE_DEFAULT, "Data descriptor did not match expected signature (found 0x%02hhx%02hhx%02hhx%02hhx); entering passthrough mode",
              (uint8_t *)&v559,
              0x1Au);
          }

          v320 = v518;
          uint64_t v321 = a1;
          uint64_t v322 = v12;
          goto LABEL_440;
        }
        __int16 v46 = sub_100003788();
        BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG);
        if (v43)
        {
          if (v47)
          {
            int v48 = *((_DWORD *)[*v9 dataDescriptor] + 1);
            __darwin_ino64_t v49 = *((void *)[*v9 dataDescriptor] + 2);
            uint64_t v50 = *((void *)[*v9 dataDescriptor] + 1);
            v559.st_dev = v460;
            *(_DWORD *)&v559.st_mode = v48;
            a1 = v474;
            LOWORD(v559.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v559.st_ino + 2) = v49;
            HIWORD(v559.st_uid) = 2048;
            *(void *)&v559.st_gid = v50;
            id v51 = v46;
            v52 = "Got data descriptor with CRC 0x%x, uncompressed size %llu, compressed size %llu";
            uint32_t v53 = 28;
LABEL_330:
            _os_log_debug_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEBUG, v52, (uint8_t *)&v559, v53);
          }
        }
        else if (v47)
        {
          int v248 = *((_DWORD *)[*v9 dataDescriptor] + 1);
          int v249 = *((_DWORD *)[*v9 dataDescriptor] + 3);
          uid_t v250 = *((_DWORD *)[*v9 dataDescriptor] + 2);
          v559.st_dev = v460;
          *(_DWORD *)&v559.st_mode = v248;
          a1 = v474;
          LOWORD(v559.st_ino) = 1024;
          *(_DWORD *)((char *)&v559.st_ino + 2) = v249;
          HIWORD(v559.st_ino) = 1024;
          v559.st_uid = v250;
          id v51 = v46;
          v52 = "Got data descriptor with CRC 0x%x, uncompressed size %u, compressed size %u";
          uint32_t v53 = 20;
          goto LABEL_330;
        }

        [*v9 setStreamState:4];
        id v10 = 0;
LABEL_70:
        id v60 = [*v9 uncompressedBytesOutput];
        uint64_t v61 = sub_10000ECC4(*v9);
        id v62 = *v9;
        if (v60 == (id)v61)
        {
          id v63 = [v62 currentCRC32];
          unsigned int v64 = sub_10000F4D0(*v9);
          uint64_t v65 = [*v9 currentLFRecord];
          if (v63 == (id)v64)
          {
            id v476 = v10;
            uint64_t v66 = sub_100003C50((uint64_t)v65, &word_10001DB50, 8u);
            sub_10000EEE0([*v9 currentLFRecord]);
            id v67 = objc_claimAutoreleasedReturnValue();
            __int16 v68 = (const char *)[v67 fileSystemRepresentation];
            id v69 = *v9;
            if (!v67 || !v68)
            {
              v74 = [v69 unsureData];

              if (v74)
              {
                v75 = sub_100003788();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v559.st_dev) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Couldn't get filename for stream metadata file; entering passthrough mode",
                    (uint8_t *)&v559,
                    2u);
                }

                sub_10000E674(a1, (uint64_t)v518, v12);
                id v76 = (id)objc_claimAutoreleasedReturnValue();

                int v54 = 2;
              }
              else
              {
                v77 = (unsigned __int16 *)[*v9 currentLFRecord];
                size_t v78 = v77[13];
                v79 = malloc_type_calloc(v78 + 1, 1uLL, 0xCB3B20E1uLL);
                memcpy(v79, v77 + 15, v78);
                v80 = sub_100003788();
                if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
                {
                  v559.st_dev = v459;
                  *(void *)&v559.st_mode = v79;
                  _os_log_error_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "Couldn't get filename for current file \"%s\"", (uint8_t *)&v559, 0xCu);
                }

                CFStringRef v527 = @"SZExtractorFileOffsetErrorKey";
                v81 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v9 currentOffset]);
                v528 = v81;
                v82 = +[NSDictionary dictionaryWithObjects:&v528 forKeys:&v527 count:1];
                int v54 = 2;
                sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1387, @"SZExtractorErrorDomain", 2, 0, v82, @"Couldn't get filename for current file \"%s\"", v83, (uint64_t)v79);
                id v76 = (id)objc_claimAutoreleasedReturnValue();

                free(v79);
              }
              goto LABEL_353;
            }
            id v70 = [v69 recordsProcessed];
            v471 = v13;
            if ((unint64_t)v70 > 2 || strcmp(v68, "META-INF/com.apple.ZipMetadata.plist"))
            {
              if ((unint64_t)[*v9 recordsProcessed] > 3
                || strcmp(v68, "META-INF/com.apple.FixedZipMetadata.bin"))
              {
                if (([*v9 currentLFMode] & 0xF000) == 0xA000)
                {
                  v71 = [v472 stringByAppendingPathComponent:v67];
                  if ([*v9 storeCurrentFileInMemory])
                  {
                    long long v72 = [*v9 inMemoryFileData];
                    if (!v72) {
                      __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1496, "_currentState.inMemoryFileData");
                    }

                    v73 = [*v9 inMemoryFileData];
                    goto LABEL_123;
                  }
                  id v481 = 0;
                  v73 = +[NSMutableData dataWithContentsOfFile:v71 options:3 error:&v481];
                  id v102 = v481;
                  if (v73)
                  {
                    v103 = +[NSFileManager defaultManager];
                    [v103 removeItemAtPath:v71 error:0];

LABEL_123:
                    char v480 = 0;
                    [v73 appendBytes:&v480 length:1];
                    id v104 = v73;
                    v105 = (const char *)[v104 bytes];
                    v84 = v71;
                    v106 = (const char *)[v84 fileSystemRepresentation];
                    unsigned int v107 = [*v9 denyInvalidSymlinks];
                    v473 = (char *)v104;
                    if (v107)
                    {
                      if (*v105 == 47)
                      {
                        v108 = sub_100003788();
                        if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                        {
                          v559.st_dev = v461;
                          *(void *)&v559.st_mode = v106;
                          WORD2(v559.st_ino) = 2080;
                          *(__darwin_ino64_t *)((char *)&v559.st_ino + 6) = (__darwin_ino64_t)v105;
                          _os_log_error_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "Invalid symlink: %s -> %s (absolute symlinks are forbidden)", (uint8_t *)&v559, 0x16u);
                        }

                        NSErrorUserInfoKey v523 = v470;
                        v524 = v84;
                        v109 = +[NSDictionary dictionaryWithObjects:&v524 forKeys:&v523 count:1];
                        sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1520, @"SZExtractorErrorDomain", 5, 0, v109, @"Invalid symlink: %s -> %s (absolute symlinks are forbidden)", v110, (uint64_t)v106);
LABEL_186:
                        id v76 = (id)objc_claimAutoreleasedReturnValue();

                        goto LABEL_187;
                      }
                      uid_t v555 = 0;
                      gid_t v516 = 0;
                      if (!sub_10000F624((const char *)[v67 fileSystemRepresentation], 0, (int *)&v516)|| !sub_10000F624(v105, v516, (int *)&v555))
                      {
                        v154 = sub_100003788();
                        if (os_log_type_enabled(v154, OS_LOG_TYPE_ERROR))
                        {
                          v559.st_dev = v461;
                          *(void *)&v559.st_mode = v106;
                          WORD2(v559.st_ino) = 2080;
                          *(__darwin_ino64_t *)((char *)&v559.st_ino + 6) = (__darwin_ino64_t)v105;
                          _os_log_error_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_ERROR, "Invalid symlink: %s -> %s", (uint8_t *)&v559, 0x16u);
                        }

                        NSErrorUserInfoKey v521 = v470;
                        v522 = v84;
                        v109 = +[NSDictionary dictionaryWithObjects:&v522 forKeys:&v521 count:1];
                        sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1533, @"SZExtractorErrorDomain", 5, 0, v109, @"Invalid symlink: %s -> %s", v155, (uint64_t)v106);
                        goto LABEL_186;
                      }
                    }
                    if (symlink(v105, v106))
                    {
                      v134 = v7;
                      uint64_t v135 = *__error();
                      v136 = sub_100003788();
                      if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
                      {
                        v269 = strerror(v135);
                        v559.st_dev = v456;
                        *(void *)&v559.st_mode = v106;
                        WORD2(v559.st_ino) = 2080;
                        *(__darwin_ino64_t *)((char *)&v559.st_ino + 6) = (__darwin_ino64_t)v105;
                        HIWORD(v559.st_gid) = 2080;
                        *(void *)&v559.st_rdev = v269;
                        _os_log_error_impl((void *)&_mh_execute_header, v136, OS_LOG_TYPE_ERROR, "Failed to create symlink at %s to %s: %s", (uint8_t *)&v559, 0x20u);
                      }

                      NSErrorUserInfoKey v519 = v470;
                      v520 = v84;
                      v137 = +[NSDictionary dictionaryWithObjects:&v520 forKeys:&v519 count:1];
                      strerror(v135);
                      sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1541, v465, v135, 0, v137, @"Failed to create symlink at %s to %s: %s", v138, (uint64_t)v106);
                      id v76 = (id)objc_claimAutoreleasedReturnValue();

                      id v7 = v134;
                      a1 = v474;
                      goto LABEL_187;
                    }
                    lchmod(v106, (mode_t)[*v9 currentLFMode]);
                    if ([*v9 denyInvalidSymlinks])
                    {
                      uint64_t v151 = a1;
                      id v152 = v476;
                      id v479 = v476;
                      int v153 = sub_100008D38(v84, v472, &v479);
                      id v76 = v479;

                      a1 = v151;
                      id v9 = v475;
                      id v476 = v76;
                      if (!v153)
                      {
LABEL_187:
                        v124 = v473;
LABEL_188:

LABEL_336:
                        int v54 = 2;
                        uint64_t v13 = v471;
                        goto LABEL_353;
                      }
                    }
                    if (v66)
                    {
                      *(void *)&v559.st_dev = *(unsigned int *)(v66 + 4);
                      LODWORD(v559.st_ino) = 0;
                      *(void *)&v559.st_uid = *(unsigned int *)(v66 + 8);
                    }
                    else
                    {
                      *(void *)&v559.st_dev = sub_100003D30(*(_DWORD *)((char *)[*v9 currentLFRecord]
                                                                        + 10));
                      LODWORD(v559.st_ino) = 0;
                      *(void *)&v559.st_uid = *(void *)&v559.st_dev;
                    }
                    v559.st_rdev = 0;
                    lutimes(v106, (const timeval *)&v559);

                    goto LABEL_342;
                  }
                  v139 = sub_100003788();
                  if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
                  {
                    v559.st_dev = v464;
                    *(void *)&v559.st_mode = v71;
                    _os_log_error_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_ERROR, "Failed to read symlink path from %@", (uint8_t *)&v559, 0xCu);
                  }

                  NSErrorUserInfoKey v525 = v470;
                  v526 = v71;
                  v140 = +[NSDictionary dictionaryWithObjects:&v526 forKeys:&v525 count:1];
                  sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1502, @"SZExtractorErrorDomain", 5, v102, v140, @"Failed to read symlink path from %@", v141, (uint64_t)v71);
                  id v76 = (id)objc_claimAutoreleasedReturnValue();

LABEL_335:
                  goto LABEL_336;
                }
                if ([*v9 storeCurrentFileInMemory])
                {
                  v84 = sub_100003788();
                  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
                  {
                    v559.st_dev = v464;
                    *(void *)&v559.st_mode = v67;
                    _os_log_debug_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEBUG, "Not doing anything with data for file %@", (uint8_t *)&v559, 0xCu);
                  }
                }
                else
                {
                  if (v66)
                  {
                    v111 = v9;
                    time_t v112 = *(unsigned int *)(v66 + 4);
                    time_t v113 = *(unsigned int *)(v66 + 8);
                  }
                  else
                  {
                    time_t v112 = sub_100003D30(*(_DWORD *)((char *)[*v9 currentLFRecord] + 10));
                    v111 = v9;
                    time_t v113 = v112;
                  }
                  v142 = [*v111 currentLFRecord];
                  if (v142[*((unsigned __int16 *)v142 + 13) + 29] != 47)
                  {
                    v144 = v7;
                    uint64_t v145 = a1;
                    v146 = [*v111 fileWriter];
                    if (!v146) {
                      __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1582, "_currentState.fileWriter");
                    }

                    v147 = [*v111 fileWriter];
                    id v148 = [*v111 currentLFMode];
                    id v149 = v476;
                    id v478 = v476;
                    unsigned __int8 v150 = objc_msgSend(v147, "finalizeFileWithAccessTime:modTime:mode:error:", v112, 0, v113, 0, v148, &v478);
                    id v76 = v478;

                    if ((v150 & 1) == 0)
                    {
                      int v54 = 2;
                      a1 = v145;
                      id v7 = v144;
LABEL_353:

                      id v10 = v76;
                      goto LABEL_354;
                    }
                    a1 = v145;
                    id v7 = v144;
                    id v9 = v475;
LABEL_343:
                    v257 = sub_100003830();
                    if (os_signpost_enabled(v257))
                    {
                      v559.st_dev = v464;
                      *(void *)&v559.st_mode = v67;
                      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v257, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EXTRACTION", "Extraction completed successfully for file %@", (uint8_t *)&v559, 0xCu);
                    }

                    [*(id *)(a1 + 64) setPerformingExtraction:0];
                    id v258 = v67;
                    if ((*(unsigned char *)(a1 + 80) & 2) != 0)
                    {
                      v259 = [(id)a1 xpcConnection];
                      v260 = v259;
                      if (v259)
                      {
                        id v261 = [v259 remoteObjectProxy];
                        [v261 extractionCompleteAtArchivePath:v258];
                      }
                      else
                      {
                        id v261 = [(id)a1 inProcessExtractorDelegate];
                        if (v261)
                        {
                          v263 = [(id)a1 inProcessDelegateQueue];

                          if (v263)
                          {
                            v264 = [(id)a1 inProcessDelegateQueue];
                            *(void *)&v559.st_dev = _NSConcreteStackBlock;
                            v559.st_ino = 3221225472;
                            *(void *)&v559.st_uid = sub_10000F700;
                            *(void *)&v559.st_rdev = &unk_100028BE8;
                            id v261 = v261;
                            v559.st_atimespec.tv_sec = (__darwin_time_t)v261;
                            v559.st_atimespec.tv_nsec = (uint64_t)v258;
                            dispatch_async(v264, &v559);
                          }
                        }
                      }

                      id v9 = v475;
                    }

                    [*v9 setStreamState:0];
                    if (![*v9 totalUncompressedBytes] && objc_msgSend(*v9, "totalRecordCount")) {
                      sub_10000F394(a1, (double)(unint64_t)[*(id *)(a1 + 64) recordsProcessed]/ (double)(unint64_t)objc_msgSend(*(id *)(a1 + 64), "totalRecordCount"));
                    }
                    int v54 = 3;
                    goto LABEL_353;
                  }
                  v143 = [v472 stringByAppendingPathComponent:v67];
                  *(void *)&v559.st_dev = v112;
                  v559.st_ino = 0;
                  *(void *)&v559.st_uid = v113;
                  *(void *)&v559.st_rdev = 0;
                  v84 = v143;
                  lutimes((const char *)[v84 fileSystemRepresentation], (const timeval *)&v559);
                  id v9 = v111;
                }
LABEL_342:

                id v76 = v476;
                uint64_t v13 = v471;
                goto LABEL_343;
              }
              if ([*v9 storeCurrentFileInMemory])
              {
                v114 = [*v9 inMemoryFileData];
                if (!v114) {
                  __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1452, "_currentState.inMemoryFileData");
                }

                v84 = [*v9 inMemoryFileData];
              }
              else
              {
                v125 = [v472 stringByAppendingPathComponent:v67];
                id v510 = 0;
                v84 = +[NSData dataWithContentsOfFile:v125 options:3 error:&v510];
                id v126 = v510;
                if (!v84)
                {
                  v127 = sub_100003788();
                  if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
                  {
                    v559.st_dev = v463;
                    *(void *)&v559.st_mode = v125;
                    WORD2(v559.st_ino) = 2112;
                    *(__darwin_ino64_t *)((char *)&v559.st_ino + 6) = (__darwin_ino64_t)v126;
                    _os_log_error_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_ERROR, "Failed to read fixed stream metadata from %@: %@", (uint8_t *)&v559, 0x16u);
                  }
                }
              }
              if (!v84) {
                goto LABEL_342;
              }
              v128 = v84;
              v129 = (unsigned __int8 *)[v128 bytes];
              id v133 = [v128 length];
              if ((unint64_t)v133 < 7 || *(_DWORD *)v129 != 2017879117)
              {
                v120 = sub_100003788();
                if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
                {
                  v559.st_dev = v466;
                  *(void *)&v559.st_mode = v133;
                  _os_log_error_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_ERROR, "Got a fixed metadata file that did not match expected content (length %lu). Ignoring.", (uint8_t *)&v559, 0xCu);
                }
LABEL_163:

                goto LABEL_342;
              }
              id v254 = *v9;
              if (*v9)
              {
                [v254 hashContext];
                id v254 = *v9;
                unsigned __int8 v255 = v496 + 1;
                if (*v9)
                {
                  id v254 = [v254 hashContext];
                  uint64_t v256 = v482;
                  goto LABEL_362;
                }
                long long v267 = 0uLL;
              }
              else
              {
                uint64_t v509 = 0;
                long long v267 = 0uLL;
                long long v507 = 0u;
                long long v508 = 0u;
                long long v505 = 0u;
                long long v506 = 0u;
                long long v503 = 0u;
                long long v504 = 0u;
                long long v501 = 0u;
                long long v502 = 0u;
                long long v499 = 0u;
                long long v500 = 0u;
                long long v497 = 0u;
                long long v498 = 0u;
                unsigned __int8 v255 = 1;
                long long v496 = 0u;
              }
              uint64_t v256 = 0;
              uint64_t v495 = 0;
              long long v493 = v267;
              long long v494 = v267;
              long long v491 = v267;
              long long v492 = v267;
              long long v489 = v267;
              long long v490 = v267;
              long long v488 = v267;
              long long v486 = v267;
              long long v487 = v267;
              long long v484 = v267;
              long long v485 = v267;
              long long v482 = v267;
              long long v483 = v267;
LABEL_362:
              uint64_t v272 = qword_10001DB98[v256];
              LOWORD(v555) = v272;
              BOOL v262 = v129[4] == v255;
              a1 = v474;
              if (!v262) {
                goto LABEL_342;
              }
              if (*(unsigned __int16 *)(v129 + 5) != (unsigned __int16)v555) {
                goto LABEL_342;
              }
              size_t v273 = (unsigned __int16)v272;
              if ((unint64_t)v133 < (unint64_t)(unsigned __int16)v272 + 7) {
                goto LABEL_342;
              }
              __chkstk_darwin(v254, v130, v131, v132);
              v275 = (char *)&v453 - v274;
              bzero((char *)&v453 - v274, v273);
              v276 = v129 + 7;
              if (!memcmp(v275, v276, v273))
              {
                v120 = sub_100003788();
                if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v559.st_dev) = 0;
                  _os_log_debug_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEBUG, "Found last chunk partial hash data but the hash was not computed.", (uint8_t *)&v559, 2u);
                }
              }
              else
              {
                v277 = sub_10000F59C(v276, v273);
                [*v9 setLastChunkPartialHash:v277];

                v120 = sub_100003788();
                if (os_log_type_enabled(v120, OS_LOG_TYPE_DEBUG))
                {
                  v278 = [*v9 lastChunkPartialHash];
                  v559.st_dev = v464;
                  *(void *)&v559.st_mode = v278;
                  _os_log_debug_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEBUG, "Got last chunk partial hash %@", (uint8_t *)&v559, 0xCu);
                }
              }
              goto LABEL_163;
            }
            if ([*v9 storeCurrentFileInMemory])
            {
              v85 = [*v9 inMemoryFileData];
              if (!v85) {
                __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1396, "_currentState.inMemoryFileData");
              }

              v71 = [*v9 inMemoryFileData];
              id v512 = 0;
              v86 = +[NSPropertyListSerialization propertyListWithData:v71 options:0 format:0 error:&v512];
              id v87 = v512;
              [*v9 setStreamInfoDict:v86];

              v88 = [*v9 streamInfoDict];

              if (!v88)
              {
                v89 = v13;
                v90 = sub_100003788();
                if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v559.st_dev) = 0;
                  _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "Failed to decode stream metadata; entering passthrough mode",
                    (uint8_t *)&v559,
                    2u);
                }

                sub_10000E674(a1, (uint64_t)v518, v12);
                id v76 = (id)objc_claimAutoreleasedReturnValue();

                int v54 = 2;
                uint64_t v13 = v89;
                goto LABEL_353;
              }
              goto LABEL_138;
            }
            v71 = [v472 stringByAppendingPathComponent:v67];
            id v102 = +[NSInputStream inputStreamWithFileAtPath:v71];
            if (v102)
            {
              id v511 = 0;
              v115 = +[NSPropertyListSerialization propertyListWithStream:v102 options:0 format:0 error:&v511];
              id v87 = v511;
              [*v9 setStreamInfoDict:v115];

              v116 = [*v9 streamInfoDict];

              if (v116)
              {

LABEL_138:
                v117 = sub_100003788();
                if (os_log_type_enabled(v117, OS_LOG_TYPE_DEBUG))
                {
                  v268 = [*v9 streamInfoDict];
                  v559.st_dev = v464;
                  *(void *)&v559.st_mode = v268;
                  _os_log_debug_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEBUG, "Got stream metadata: %@", (uint8_t *)&v559, 0xCu);
                }
                v118 = [*v9 streamInfoDict];
                v84 = [v118 objectForKey:@"Version"];

                if (!v84
                  || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
                  || [v84 intValue] != 2)
                {
                  v123 = sub_100003788();
                  if (os_log_type_enabled(v123, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(v559.st_dev) = 0;
                    _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "Stream metadata was incompatible version or not present; entering passthrough mode",
                      (uint8_t *)&v559,
                      2u);
                  }

                  sub_10000E674(a1, (uint64_t)v518, v12);
                  id v76 = (id)objc_claimAutoreleasedReturnValue();
                  v124 = (char *)v476;
                  goto LABEL_188;
                }
                [*v9 setUnsureData:0];
                v119 = [*v9 streamInfoDict];
                v120 = [v119 objectForKey:@"RecordCount"];

                if (v120)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    objc_msgSend(*v9, "setTotalRecordCount:", -[NSObject unsignedLongLongValue](v120, "unsignedLongLongValue"));
                  }
                }
                v121 = [*v9 streamInfoDict];
                v122 = [v121 objectForKey:@"TotalUncompressedBytes"];

                if (v122)
                {
                  objc_opt_class();
                  if (objc_opt_isKindOfClass()) {
                    objc_msgSend(*v9, "setTotalUncompressedBytes:", objc_msgSend(v122, "unsignedLongLongValue"));
                  }
                }

                goto LABEL_163;
              }
              v251 = v7;
              v252 = sub_100003788();
              if (os_log_type_enabled(v252, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(v559.st_dev) = 0;
                _os_log_impl((void *)&_mh_execute_header, v252, OS_LOG_TYPE_DEFAULT, "Failed to decode stream metadata; entering passthrough mode",
                  (uint8_t *)&v559,
                  2u);
              }

              uint64_t v253 = v474;
              sub_10000E674(v474, (uint64_t)v518, v12);
              id v76 = (id)objc_claimAutoreleasedReturnValue();

              id v7 = v251;
              a1 = v253;
            }
            else
            {
              v246 = sub_100003788();
              if (os_log_type_enabled(v246, OS_LOG_TYPE_DEFAULT))
              {
                v559.st_dev = v464;
                *(void *)&v559.st_mode = v71;
                _os_log_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_DEFAULT, "Failed to read stream metadata from %@; entering passthrough mode",
                  (uint8_t *)&v559,
                  0xCu);
              }

              sub_10000E674(a1, (uint64_t)v518, v12);
              id v76 = (id)objc_claimAutoreleasedReturnValue();
              id v87 = v476;
            }

            goto LABEL_335;
          }
          v294 = v13;
          v295 = sub_10000EEE0(v65);
          v529[0] = @"SZExtractorFileOffsetErrorKey";
          v300 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v9 currentOffset]);
          v529[1] = v470;
          v530[0] = v300;
          v530[1] = v295;
          v297 = +[NSDictionary dictionaryWithObjects:v530 forKeys:v529 count:2];

          v301 = sub_100003788();
          if (os_log_type_enabled(v301, OS_LOG_TYPE_ERROR))
          {
            id v409 = [*v9 currentCRC32];
            int v410 = sub_10000F4D0(*v9);
            v559.st_dev = 134218498;
            *(void *)&v559.st_mode = v409;
            WORD2(v559.st_ino) = 1024;
            *(_DWORD *)((char *)&v559.st_ino + 6) = v410;
            HIWORD(v559.st_uid) = 2112;
            *(void *)&v559.st_gid = v295;
            _os_log_error_impl((void *)&_mh_execute_header, v301, OS_LOG_TYPE_ERROR, "CRC mismatch; got: 0x%lx expected: 0x%x for file %@",
              (uint8_t *)&v559,
              0x1Cu);
          }

          id v302 = [*v9 currentCRC32];
          sub_10000F4D0(*v9);
          sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1372, @"SZExtractorErrorDomain", 2, 0, v297, @"CRC mismatch; got: 0x%lx expected: 0x%x for file %@",
            v303,
            (uint64_t)v302);
        }
        else
        {
          v294 = v13;
          v295 = sub_10000EEE0([v62 currentLFRecord]);
          v531[0] = @"SZExtractorFileOffsetErrorKey";
          v296 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [*v9 currentOffset]);
          v531[1] = v470;
          v532[0] = v296;
          v532[1] = v295;
          v297 = +[NSDictionary dictionaryWithObjects:v532 forKeys:v531 count:2];

          v298 = sub_100003788();
          if (os_log_type_enabled(v298, OS_LOG_TYPE_ERROR))
          {
            id v407 = [*v9 uncompressedBytesOutput];
            uint64_t v408 = sub_10000ECC4(*v9);
            v559.st_dev = 138412802;
            *(void *)&v559.st_mode = v295;
            WORD2(v559.st_ino) = 2048;
            *(__darwin_ino64_t *)((char *)&v559.st_ino + 6) = (__darwin_ino64_t)v407;
            HIWORD(v559.st_gid) = 2048;
            *(void *)&v559.st_rdev = v408;
            _os_log_error_impl((void *)&_mh_execute_header, v298, OS_LOG_TYPE_ERROR, "Decompression failed to produce all expected output data for file %@; produced %llu bytes, expected %llu",
              (uint8_t *)&v559,
              0x20u);
          }

          [*v9 uncompressedBytesOutput];
          sub_10000ECC4(*v9);
          sub_100004A7C((uint64_t)"-[StreamingUnzipper _supplyBytes:length:withReply:]", 1364, @"SZExtractorErrorDomain", 2, 0, v297, @"Decompression failed to produce all expected output data for file %@; produced %llu bytes, expected %llu",
            v299,
            (uint64_t)v295);
        uint64_t v304 = };

        uint64_t v14 = 0;
        id v10 = (id)v304;
LABEL_404:
        uint64_t v13 = v294;
        goto LABEL_387;
      case 4u:
        goto LABEL_70;
      case 5u:
        v305 = [*v9 fileWriter];
        if (!v305) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1612, "_currentState.fileWriter");
        }

        objc_msgSend(*v9, "setCurrentOffset:", (char *)objc_msgSend(*v9, "currentOffset") + v12);
        id v306 = *v9;
        v307 = (char *)[*v9 currentOffset];
        id v15 = [v306 updateHashFromOffset:&v307[-v12] withBytes:v518 length:v12];

        if (v15) {
          goto LABEL_470;
        }
        v308 = [*v9 fileWriter];
        id v477 = 0;
        uint64_t v14 = (uint64_t)[v308 writeBuffer:v518 length:v517 error:&v477];
        id v10 = v477;

        if (!v14) {
          goto LABEL_387;
        }
        id v24 = *v9;
        goto LABEL_409;
      case 6u:
        if ([*v9 hashedChunkSize])
        {
          v309 = [*v9 hashedChunkSize];
          v310 = [*v9 bytesHashedInChunk];
          if (v309 - v310 < v12) {
            unint64_t v12 = v309 - v310;
          }
        }
        id v311 = *v9;
        id v312 = [*v9 currentOffset];
        id v15 = [v311 updateHashFromOffset:v312 withBytes:v518 length:v12 onlyFinishCurrentChunk:1];

        objc_msgSend(*v9, "setCurrentOffset:", (char *)objc_msgSend(*v9, "currentOffset") + v12);
        if (v15) {
          goto LABEL_470;
        }
        if (![*v9 bytesHashedInChunk]) {
          goto LABEL_516;
        }
        if (v12 != v517) {
          __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1645, "lengthToRead == length");
        }
        goto LABEL_416;
      case 7u:
        goto LABEL_387;
      case 8u:
        goto LABEL_517;
      default:
        v447 = sub_100003788();
        if (os_log_type_enabled(v447, OS_LOG_TYPE_ERROR))
        {
          unsigned int v448 = [*v475 streamState];
          v559.st_dev = 67109120;
          *(_DWORD *)&v559.st_mode = v448;
          _os_log_error_impl((void *)&_mh_execute_header, v447, OS_LOG_TYPE_ERROR, "Invalid unzip state encountered: %hhu", (uint8_t *)&v559, 8u);
        }

        __assert_rtn("-[StreamingUnzipper _supplyBytes:length:withReply:]", "StreamingUnzipper.m", 1658, "false");
    }
  }
}

id sub_10000E564(uint64_t a1, uint64_t a2, void *a3, const void **a4, size_t *a5)
{
  size_t v9 = *a5;
  id v10 = a3;
  id v11 = [v10 thisStageBytesComplete];
  if (v9 >= a2 - (uint64_t)v11) {
    size_t v12 = a2 - (void)v11;
  }
  else {
    size_t v12 = v9;
  }
  memcpy((char *)[v10 thisStageBytesComplete] + a1, *a4, v12);
  objc_msgSend(v10, "setThisStageBytesComplete:", (char *)objc_msgSend(v10, "thisStageBytesComplete") + v12);
  uint64_t v13 = [v10 unsureData];
  [v13 appendBytes:*a4 length:v12];

  objc_msgSend(v10, "setCurrentOffset:", (char *)objc_msgSend(v10, "currentOffset") + v12);
  uint64_t v14 = objc_msgSend(v10, "updateHashFromOffset:withBytes:length:", (char *)objc_msgSend(v10, "currentOffset") - v12, *a4, v12);

  if (!v14)
  {
    *a4 = (char *)*a4 + v12;
    *a5 -= v12;
  }

  return v14;
}

id sub_10000E674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = [*(id *)(a1 + 64) unzipPath];
  id v7 = *(NSObject **)(a1 + 96);
  if (v7) {
    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
  if ([*(id *)(a1 + 64) performingExtraction])
  {
    __int16 v8 = sub_100003830();
    if (os_signpost_enabled(v8))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EXTRACTION", "Extraction entered passthrough mode", (uint8_t *)&buf, 2u);
    }

    [*(id *)(a1 + 64) setPerformingExtraction:0];
  }
  size_t v9 = sub_100003788();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Beginning passthrough of non-streamable zip file to %@", (uint8_t *)&buf, 0xCu);
  }

  id v10 = sub_100003830();
  if (os_signpost_enabled(v10))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PASSTHROUGH_MODE", "Beginning passthrough of non-streamable zip file to %@", (uint8_t *)&buf, 0xCu);
  }

  id v11 = +[NSFileManager defaultManager];
  [v11 removeItemAtPath:v6 error:0];

  id v12 = [*(id *)(a1 + 64) performCachedWrites];
  id v39 = 0;
  uint64_t v13 = +[StreamingFileWriter synchronousFileWriterForPath:v6 withOpenFlags:1537 mode:384 quarantineInfo:0 performCachedWrites:v12 error:&v39];
  id v14 = v39;
  if (!v13)
  {
    uint64_t v25 = sub_100003788();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to open passthrough output file at %@", (uint8_t *)&buf, 0xCu);
    }

    NSErrorUserInfoKey v44 = NSFilePathErrorKey;
    id v45 = v6;
    id v26 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    sub_100004A7C((uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]", 196, @"SZExtractorErrorDomain", 1, v14, v26, @"Failed to open passthrough output file at %@", v27, (uint64_t)v6);
    goto LABEL_33;
  }
  [v13 setIncompleteExtractionAttribute];
  id v15 = [*(id *)(a1 + 64) unsureData];
  id v16 = (char *)[v15 length];

  id v17 = [*(id *)(a1 + 64) unsureData];
  id v38 = v14;
  unsigned __int8 v18 = objc_msgSend(v13, "writeBuffer:length:error:", objc_msgSend(v17, "bytes"), v16, &v38);
  id v19 = v38;

  if (v18)
  {
    if (!a3)
    {
LABEL_16:
      [*(id *)(a1 + 64) setFileWriter:v13];
      [*(id *)(a1 + 64) setCurrentOffset:&v16[a3]];
      id v21 = [*(id *)(a1 + 64) updateHashFromOffset:v16 withBytes:a2 length:a3];

      if (!v21)
      {
        [*(id *)(a1 + 64) setStreamState:5];
        if ((*(unsigned char *)(a1 + 80) & 4) != 0)
        {
          uint64_t v22 = [(id)a1 xpcConnection];
          uint64_t v23 = v22;
          if (v22)
          {
            id v24 = [v22 remoteObjectProxy];
            [v24 extractionEnteredPassThroughMode];
          }
          else
          {
            id v24 = [(id)a1 inProcessExtractorDelegate];
            if (v24)
            {
              __int16 v34 = [(id)a1 inProcessDelegateQueue];

              if (v34)
              {
                int v35 = [(id)a1 inProcessDelegateQueue];
                *(void *)&long long buf = _NSConcreteStackBlock;
                *((void *)&buf + 1) = 3221225472;
                BOOL v47 = sub_10001297C;
                int v48 = &unk_100028C10;
                id v24 = v24;
                id v49 = v24;
                dispatch_async(v35, &buf);
              }
            }
          }
        }
        id v21 = [*(id *)(a1 + 64) serializeState];
        if (!v21) {
          goto LABEL_35;
        }
      }
LABEL_34:
      sub_100008364(a1);
      goto LABEL_35;
    }
    id v37 = v19;
    unsigned __int8 v20 = [v13 writeBuffer:a2 length:a3 error:&v37];
    id v14 = v37;

    if (v20)
    {
      id v19 = v14;
      goto LABEL_16;
    }
    id v31 = sub_100003788();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Failed to write remaining initial data to passthrough output file", (uint8_t *)&buf, 2u);
    }

    NSErrorUserInfoKey v40 = NSFilePathErrorKey;
    id v41 = v6;
    id v26 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
    sub_100004A7C((uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]", 211, @"SZExtractorErrorDomain", 1, v14, v26, @"Failed to write remaining initial data to passthrough output file", v32, v36);
    id v21 = LABEL_33:;

    if (!v21) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
  unsigned __int8 v28 = sub_100003788();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Failed to write initial data to passthrough output file", (uint8_t *)&buf, 2u);
  }

  NSErrorUserInfoKey v42 = NSFilePathErrorKey;
  uint64_t v43 = v6;
  uint64_t v29 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  id v21 = sub_100004A7C((uint64_t)"-[StreamingUnzipper _beginNonStreamablePassthroughWithRemainingBytes:length:]", 205, @"SZExtractorErrorDomain", 1, v19, v29, @"Failed to write initial data to passthrough output file", v30, v36);

  if (v21) {
    goto LABEL_34;
  }
LABEL_35:

  return v21;
}

uint64_t sub_10000ECC4(void *a1)
{
  id v1 = a1;
  id v2 = [v1 currentLFRecord];
  if (*((_WORD *)[v1 currentLFRecord] + 4)
    && [v1 currentLFRequiresDataDescriptor])
  {
    if ([v1 streamState] <= 3) {
      __assert_rtn("_GetUncompressedSize", "StreamingUnzipper.m", 339, "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    }
    if (![v1 dataDescriptor]) {
      __assert_rtn("_GetUncompressedSize", "StreamingUnzipper.m", 340, "NULL != currentState.dataDescriptor");
    }
    uint64_t v3 = sub_100003C50((uint64_t)[v1 currentLFRecord], &word_10001DB52, 0x10u);
    unsigned __int8 v4 = [v1 dataDescriptor];
    if (v3) {
      uint64_t v5 = v4[2];
    }
    else {
      uint64_t v5 = *((unsigned int *)v4 + 3);
    }
  }
  else
  {
    uint64_t v5 = sub_100003CC4((uint64_t)v2);
  }

  return v5;
}

uint64_t sub_10000EDB4(void *a1)
{
  id v1 = a1;
  id v2 = (char *)[v1 currentLFRecord];
  if (*((_WORD *)[v1 currentLFRecord] + 4)
    && [v1 currentLFRequiresDataDescriptor])
  {
    if ([v1 streamState] <= 3) {
      __assert_rtn("_GetCompressedSize", "StreamingUnzipper.m", 356, "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    }
    if (![v1 dataDescriptor]) {
      __assert_rtn("_GetCompressedSize", "StreamingUnzipper.m", 357, "NULL != currentState.dataDescriptor");
    }
    uint64_t v3 = sub_100003C50((uint64_t)[v1 currentLFRecord], &word_10001DB52, 0x10u);
    unsigned __int8 v4 = [v1 dataDescriptor];
    if (v3) {
      uint64_t v5 = v4[1];
    }
    else {
      uint64_t v5 = *((unsigned int *)v4 + 2);
    }
  }
  else
  {
    uint64_t v5 = *(unsigned int *)(v2 + 18);
    if (v5 == -1 || *(_DWORD *)(v2 + 22) == -1)
    {
      uint64_t v6 = sub_100003C50((uint64_t)v2, &word_10001DB52, 0x10u);
      if (v6)
      {
        if (*(_WORD *)(v6 + 2) == 16) {
          uint64_t v5 = *(void *)(v6 + 12);
        }
      }
    }
  }

  return v5;
}

id sub_10000EEE0(_WORD *a1)
{
  size_t v2 = (unsigned __int16)a1[13];
  uint64_t v3 = (unsigned __int8 *)malloc_type_calloc(v2 + 1, 1uLL, 0xCB3B20E1uLL);
  memcpy(v3, a1 + 15, v2);
  if (!v3)
  {
    id v11 = sub_100003788();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to get name from local file record.", buf, 2u);
    }

    id v10 = 0;
    goto LABEL_67;
  }
  uint64_t v4 = 0;
  char v5 = 0;
  int v6 = 0;
  int v7 = 0;
  do
  {
    int v8 = v3[v4];
    if ((char)v3[v4] < 0)
    {
      char v5 = 1;
    }
    else if (v2 != v4 && !v3[v4])
    {
      id v12 = sub_100003788();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315650;
        uint64_t v27 = v3;
        __int16 v28 = 2048;
        size_t v29 = v2;
        __int16 v30 = 2048;
        uint64_t v31 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Found NUL in path %s length %zu at %zu", buf, 0x20u);
      }

LABEL_43:
      id v10 = 0;
      goto LABEL_66;
    }
    switch(v7)
    {
      case 0:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        if (v8 == 46) {
          int v7 = 1;
        }
        break;
      case 1:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        if (v8 == 46) {
          int v7 = 2;
        }
        break;
      case 2:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        if (v8 == 47) {
          int v9 = 1;
        }
        else {
          int v9 = v6;
        }
        if (v3[v4])
        {
          int v6 = v9;
        }
        else
        {
          int v7 = 0;
          int v6 = 1;
        }
        break;
      case 3:
        if (v8 == 47) {
          int v7 = 0;
        }
        else {
          int v7 = 3;
        }
        break;
      default:
        break;
    }
    ++v4;
  }
  while (v2 + 1 != v4);
  if (v5)
  {
    if (!(((a1[3] & 0x800) == 0) | v6 & 1))
    {
LABEL_36:
      id v10 = [objc_alloc((Class)NSString) initWithBytes:v3 length:v2 encoding:4];
      goto LABEL_66;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_36;
  }
  id v10 = [objc_alloc((Class)NSString) initWithBytes:v3 length:v2 encoding:4];
  if (!v10)
  {
    id v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", v3, v2, +[NSString defaultCStringEncoding](NSString, "defaultCStringEncoding"));
    if (!v10)
    {
      id v10 = [objc_alloc((Class)NSString) initWithBytes:v3 length:v2 encoding:CFStringConvertEncodingToNSStringEncoding(0x600u)];
      if (!v10)
      {
        id v10 = [objc_alloc((Class)NSString) initWithBytes:v3 length:v2 encoding:CFStringConvertEncodingToNSStringEncoding(0x400u)];
        if (!v10)
        {
          uint64_t v23 = sub_100003788();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 136315138;
            uint64_t v27 = v3;
            _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to convert path to string: %s", buf, 0xCu);
          }

          goto LABEL_43;
        }
      }
    }
  }
  if (v6)
  {
    uint64_t v25 = v10;
    id v24 = [v10 componentsSeparatedByString:@"/"];
    id v14 = [v24 mutableCopy];
    id v15 = (char *)[v14 count];
    if (v15)
    {
      id v16 = v15;
      for (i = 0; i != v16; ++i)
      {
        id v18 = [v14 count];
        if (v18)
        {
          id v19 = v18;
          uint64_t v20 = 0;
          while (1)
          {
            id v21 = [v14 objectAtIndex:v20];
            if ([v21 isEqualToString:@".."]) {
              break;
            }
            if (v20
              && (([v21 isEqualToString:@"."] & 1) != 0
               || [v21 isEqualToString:&stru_10002A2C8]))
            {
              goto LABEL_62;
            }

            if (v19 == (id)++v20) {
              goto LABEL_64;
            }
          }
          [v14 removeObjectAtIndex:v20];
          if (!v20) {
            goto LABEL_63;
          }
          --v20;
LABEL_62:
          [v14 removeObjectAtIndex:v20];
LABEL_63:
        }
LABEL_64:
        ;
      }
    }
    id v10 = [v14 componentsJoinedByString:@"/"];
  }
LABEL_66:
  free(v3);
LABEL_67:

  return v10;
}

void sub_10000F394(uint64_t a1, double a2)
{
  if ((*(unsigned char *)(a1 + 80) & 1) != 0 && a2 - *(double *)(a1 + 88) >= 0.00999999978)
  {
    *(double *)(a1 + 88) = a2;
    uint64_t v4 = [(id)a1 xpcConnection];
    char v5 = v4;
    if (v4)
    {
      int v6 = [v4 remoteObjectProxy];
      [v6 setExtractionProgress:a2];
    }
    else
    {
      int v6 = [(id)a1 inProcessExtractorDelegate];
      if (v6)
      {
        int v7 = [(id)a1 inProcessDelegateQueue];

        if (v7)
        {
          int v8 = [(id)a1 inProcessDelegateQueue];
          v9[0] = _NSConcreteStackBlock;
          v9[1] = 3221225472;
          v9[2] = sub_10000F70C;
          v9[3] = &unk_100028BC0;
          id v10 = v6;
          double v11 = a2;
          dispatch_async(v8, v9);
        }
      }
    }
  }
}

uint64_t sub_10000F4D0(void *a1)
{
  id v1 = a1;
  size_t v2 = (char *)[v1 currentLFRecord];
  if ([v1 currentLFRequiresDataDescriptor])
  {
    if ([v1 streamState] <= 3) {
      __assert_rtn("_GetCRC32", "StreamingUnzipper.m", 322, "currentState.streamState > kStreamStateIncompleteDataDescriptor");
    }
    if (![v1 dataDescriptor]) {
      __assert_rtn("_GetCRC32", "StreamingUnzipper.m", 323, "NULL != currentState.dataDescriptor");
    }
    sub_100003C50((uint64_t)[v1 currentLFRecord], &word_10001DB52, 0x10u);
    uint64_t v3 = (unsigned int *)((char *)[v1 dataDescriptor] + 4);
  }
  else
  {
    uint64_t v3 = (unsigned int *)(v2 + 14);
  }
  uint64_t v4 = *v3;

  return v4;
}

id sub_10000F59C(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  for (i = +[NSMutableString stringWithCapacity:a2];
  {
    unsigned int v5 = *a1++;
    objc_msgSend(i, "appendFormat:", @"%02x", v5);
  }

  return i;
}

uint64_t sub_10000F624(const char *a1, int a2, int *a3)
{
  int v6 = strndup(a1, 0x400uLL);
  __stringp = v6;
  if (!v6) {
    return 0;
  }
  int v7 = v6;
  if (*v6 == 47 || !*a1)
  {
LABEL_14:
    uint64_t v9 = 0;
    goto LABEL_15;
  }
  while (1)
  {
    int v8 = strsep(&__stringp, "/");
    if (!v8) {
      break;
    }
    if (*v8)
    {
      if (*v8 != 46) {
        goto LABEL_10;
      }
      if (v8[1])
      {
        if (v8[1] == 46 && !v8[2])
        {
          --a2;
          goto LABEL_11;
        }
LABEL_10:
        ++a2;
      }
    }
LABEL_11:
    if (a2 < 1) {
      goto LABEL_14;
    }
  }
  *a3 = a2;
  uint64_t v9 = 1;
LABEL_15:
  free(v7);
  return v9;
}

id sub_10000F700(uint64_t a1)
{
  return [*(id *)(a1 + 32) extractionCompleteAtArchivePath:*(void *)(a1 + 40)];
}

id sub_10000F70C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setExtractionProgress:*(double *)(a1 + 40)];
}

id sub_100011EF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runOperation:*(void *)(a1 + 40)];
}

id sub_1000121B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runOperation:*(void *)(a1 + 40)];
}

void sub_100012910(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100012924(id a1)
{
  id v1 = +[NSUserDefaults standardUserDefaults];
  byte_10002F3B8 = [v1 BOOLForKey:@"PerformAllWritesSynchronously"];
}

id sub_10001297C(uint64_t a1)
{
  return [*(id *)(a1 + 32) extractionEnteredPassThroughMode];
}

id sub_1000136DC(uint64_t a1, unint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = a1 + 128;
    uint64_t v5 = qword_10001DB98[*(unsigned int *)(a1 + 128)];
    sub_100003BD0(&buf[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], a1 + 128);
    int v6 = sub_10000F59C(&buf[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)], v5);
    unint64_t v7 = *(void *)(v4 - 72);
    if (v7) {
      unint64_t v8 = a2 / v7;
    }
    else {
      unint64_t v8 = 0;
    }
    if (v8 >= (unint64_t)[*(id *)(a1 + 96) count])
    {
      v31[0] = @"SZExtractorFileOffsetErrorKey";
      id v16 = +[NSNumber numberWithUnsignedLongLong:a2];
      v32[0] = v16;
      v32[1] = v6;
      v31[1] = @"SZExtractorActualHashValueErrorKey";
      v31[2] = @"SZExtractorHashChunkIndexErrorKey";
      id v17 = +[NSNumber numberWithUnsignedLongLong:v8];
      v32[2] = v17;
      uint64_t v9 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];

      id v18 = sub_100003788();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v22 = [*(id *)(a1 + 96) count];
        *(_DWORD *)long long buf = 134218240;
        unint64_t v24 = v8;
        __int16 v25 = 2048;
        unint64_t v26 = (unint64_t)v22;
        _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Cannot validate hash; this chunk is index %llu, but we only have %lu hashes.",
          buf,
          0x16u);
      }

      [*(id *)(a1 + 96) count];
      sub_100004A7C((uint64_t)"-[StreamingUnzipState _checkHashForOffset:]", 457, @"SZExtractorErrorDomain", 4, 0, v9, @"Cannot validate hash; this chunk is index %llu, but we only have %lu hashes.",
        v19,
      id v15 = v8);
    }
    else
    {
      uint64_t v9 = [*(id *)(a1 + 96) objectAtIndex:v8];
      if ([v9 caseInsensitiveCompare:v6])
      {
        v29[0] = @"SZExtractorFileOffsetErrorKey";
        id v10 = +[NSNumber numberWithUnsignedLongLong:a2];
        v30[0] = v10;
        v30[1] = v6;
        v29[1] = @"SZExtractorActualHashValueErrorKey";
        v29[2] = @"SZExtractorHashChunkIndexErrorKey";
        double v11 = +[NSNumber numberWithUnsignedLongLong:v8];
        v30[2] = v11;
        id v12 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:3];

        uint64_t v13 = sub_100003788();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134218498;
          unint64_t v24 = a2;
          __int16 v25 = 2112;
          unint64_t v26 = (unint64_t)v9;
          __int16 v27 = 2112;
          __int16 v28 = v6;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Hash mismatch for chunk containing offset %llu: expected %@, got %@", buf, 0x20u);
        }

        id v15 = sub_100004A7C((uint64_t)"-[StreamingUnzipState _checkHashForOffset:]", 466, @"SZExtractorErrorDomain", 4, 0, v12, @"Hash mismatch for chunk containing offset %llu: expected %@, got %@", v14, a2);
      }
      else
      {
        uint64_t v20 = sub_100003788();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 134218498;
          unint64_t v24 = a2;
          __int16 v25 = 2048;
          unint64_t v26 = v8;
          __int16 v27 = 2112;
          __int16 v28 = v9;
          _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Verified that hashed data offset %llu matches index %llu: %@", buf, 0x20u);
        }

        id v15 = 0;
      }
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

char *sub_10001505C(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (!a1)
  {
    BOOL v47 = 0;
    goto LABEL_42;
  }
  if (a4) {
    *a4 = 0;
  }
  v251.receiver = a1;
  v251.super_class = (Class)StreamingUnzipState;
  uint64_t v9 = (char *)objc_msgSendSuper2(&v251, "init");

  if (!v9)
  {
    NSErrorUserInfoKey v44 = sub_100003788();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to init", buf, 2u);
    }

    __int16 v46 = sub_100004A7C((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 856, NSPOSIXErrorDomain, 12, 0, 0, @"Failed to init", v45, v211);
    id v42 = v46;
    if (a4)
    {
      id v43 = v46;
      id v42 = v43;
      uint64_t v9 = 0;
      goto LABEL_38;
    }
    uint64_t v9 = 0;
LABEL_40:
    BOOL v47 = 0;
    goto LABEL_41;
  }
  id v10 = v8;
  double v11 = (objc_class *)objc_opt_class();
  if (sub_100017A58(v10, @"SZExtractorOptionsHashType", v11)
    && (id v12 = (objc_class *)objc_opt_class(),
        sub_100017A58(v10, @"SZExtractorOptionsHashesArray", v12))
    && (uint64_t v13 = (objc_class *)objc_opt_class(),
        sub_100017A58(v10, @"SZExtractorOptionsHashedChunkSize", v13))
    && (uint64_t v14 = (objc_class *)objc_opt_class(),
        sub_100017A58(v10, @"SZExtractorOptionsDenyInvalidSymlinks", v14))
    && (id v15 = (objc_class *)objc_opt_class(),
        sub_100017A58(v10, @"SZExtractorOptionsPerformCachedWrites", v15))
    && (id v16 = (objc_class *)objc_opt_class(),
        sub_100017A58(v10, @"SZExtractorOptionsQuarantineInfo", v16))
    && (id v17 = (objc_class *)objc_opt_class(), (sub_100017A58(v10, @"SZExtractorOptionsOwnerUserID", v17) & 1) != 0))
  {
    id v18 = (objc_class *)objc_opt_class();
    char v19 = sub_100017A58(v10, @"SZExtractorOptionsOwnerGroupID", v18);

    if (v19)
    {
      uint64_t v20 = objc_msgSend(v7, "SZ_stringByDeletingTrailingSlashes");
      id v21 = (void *)*((void *)v9 + 11);
      *((void *)v9 + 11) = v20;

      id v22 = (void *)*((void *)v9 + 49);
      *((void *)v9 + 49) = 0;

      *((void *)v9 + 15) = 30;
      uint64_t v23 = malloc_type_calloc(1uLL, 0x1EuLL, 0xD142217uLL);
      *((void *)v9 + 47) = v23;
      if (!v23)
      {
        id v49 = sub_100003788();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "Could not allocate memory for local file record", buf, 2u);
        }

        NSErrorDomain v51 = NSPOSIXErrorDomain;
        v52 = @"Could not allocate memory for local file record";
        uint64_t v53 = 879;
        uint64_t v54 = 12;
        goto LABEL_54;
      }
      uint64_t v24 = objc_opt_new();
      __int16 v25 = (void *)*((void *)v9 + 45);
      *((void *)v9 + 45) = v24;

      uint64_t v26 = objc_opt_new();
      __int16 v27 = (void *)*((void *)v9 + 46);
      *((void *)v9 + 46) = v26;

      __int16 v28 = [v10 objectForKey:@"SZExtractorOptionsHashedChunkSize"];
      *((void *)v9 + 7) = [v28 unsignedLongLongValue];

      uint64_t v29 = [v10 objectForKey:@"SZExtractorOptionsHashesArray"];
      __int16 v30 = (void *)*((void *)v9 + 12);
      *((void *)v9 + 12) = v29;

      if ((unint64_t)[*((id *)v9 + 12) count] >= 2 && !*((void *)v9 + 7))
      {
        uint64_t v56 = sub_100003788();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Ambiguous chunk size (hashes > 1 but chunkSize == 0)", buf, 2u);
        }

        NSErrorDomain v51 = NSPOSIXErrorDomain;
        v52 = @"Ambiguous chunk size (hashes > 1 but chunkSize == 0)";
        uint64_t v53 = 890;
        goto LABEL_53;
      }
      if (![*((id *)v9 + 12) count] && *((void *)v9 + 7))
      {
        uint64_t v55 = sub_100003788();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "Hash chunk size given as > 0, but no hashes", buf, 2u);
        }

        NSErrorDomain v51 = NSPOSIXErrorDomain;
        v52 = @"Hash chunk size given as > 0, but no hashes";
        uint64_t v53 = 895;
LABEL_53:
        uint64_t v54 = 22;
LABEL_54:
        sub_100004A7C((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", v53, v51, v54, 0, 0, v52, v50, v211);
        id v42 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v57 = 0;
        id v58 = 0;
LABEL_70:
        [v58 finishDecoding];
        if (v42)
        {
          if (a4) {
            *a4 = v42;
          }

          uint64_t v9 = 0;
        }
        uint64_t v9 = v9;

        BOOL v47 = v9;
        goto LABEL_41;
      }
      uint64_t v31 = [v10 objectForKey:@"SZExtractorOptionsDenyInvalidSymlinks"];
      v9[453] = [v31 BOOLValue];

      uint64_t v32 = [v10 objectForKey:@"SZExtractorOptionsPerformCachedWrites"];
      v9[454] = [v32 BOOLValue];

      if (v9[454])
      {
        id v33 = sub_100003788();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)v259 = v7;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Performing cached writes to extraction under %@", buf, 0xCu);
        }
      }
      id v250 = 0;
      __int16 v34 = sub_100017B9C(&v250);
      id v225 = v250;
      if (!v34)
      {
        int v35 = sub_100003788();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)v259 = v225;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Failed to fetch current group access list, falling back to always calling chown: %@", buf, 0xCu);
        }

        id v225 = 0;
      }
      v224 = v34;
      objc_storeStrong((id *)v9 + 57, v34);
      uint64_t v36 = [v10 objectForKeyedSubscript:@"SZExtractorOptionsOwnerUserID"];
      if (v36)
      {
        if (getuid())
        {
          id v37 = sub_100003788();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            uid_t v38 = getuid();
            *(_DWORD *)long long buf = 67109120;
            *(_DWORD *)v259 = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Use of SZExtractorOptionsOwnerUserID requires the caller to be running as root, but it was running as uid %d; ignoring.",
              buf,
              8u);
          }
        }
        else
        {
          id v59 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedInt:", objc_msgSend(v36, "unsignedIntValue"));
          id v37 = *((void *)v9 + 13);
          *((void *)v9 + 13) = v59;
        }
      }
      id v60 = [v10 objectForKeyedSubscript:@"SZExtractorOptionsOwnerGroupID"];
      if (v60)
      {
        id v61 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithUnsignedInt:", objc_msgSend(v60, "unsignedIntValue"));
        id v62 = (void *)*((void *)v9 + 14);
        *((void *)v9 + 14) = v61;
      }
      id v63 = [v10 objectForKey:@"SZExtractorOptionsHashType"];
      unsigned int v64 = v63;
      if (!v63 || ([v63 isEqualToString:@"SZExtractorHashTypeMD5"] & 1) != 0) {
        goto LABEL_61;
      }
      if ([v64 isEqualToString:@"SZExtractorHashTypeSHA1"])
      {
        int v65 = 1;
      }
      else if ([v64 isEqualToString:@"SZExtractorHashTypeSHA224"])
      {
        int v65 = 4;
      }
      else if ([v64 isEqualToString:@"SZExtractorHashTypeSHA256"])
      {
        int v65 = 5;
      }
      else if ([v64 isEqualToString:@"SZExtractorHashTypeSHA384"])
      {
        int v65 = 6;
      }
      else
      {
        if (([v64 isEqualToString:@"SZExtractorHashTypeSHA512"] & 1) == 0)
        {
          uint64_t v131 = sub_100003788();
          if (os_log_type_enabled(v131, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)v259 = v64;
            _os_log_error_impl((void *)&_mh_execute_header, v131, OS_LOG_TYPE_ERROR, "Unsupported hash type: %@. Defaulting to MD5", buf, 0xCu);
          }

LABEL_61:
          int v65 = 0;
          goto LABEL_62;
        }
        int v65 = 7;
      }
LABEL_62:

      sub_100003B10((uint64_t)(v9 + 128), v65);
      *((void *)v9 + 5) = 0;
      *(_OWORD *)(v9 + 24) = 0u;
      *(_OWORD *)(v9 + 8) = 0u;
      memset(&v249, 0, sizeof(v249));
      id v66 = v7;
      if (stat((const char *)[v66 fileSystemRepresentation], &v249))
      {
        uint64_t v67 = (uint64_t)v66;
        uint64_t v68 = *__error();
        id v69 = sub_100003788();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          v114 = strerror(v68);
          *(_DWORD *)long long buf = 138412546;
          *(void *)v259 = v67;
          *(_WORD *)&v259[8] = 2080;
          *(void *)v260 = v114;
          _os_log_error_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "Failed to stat path %@: %s", buf, 0x16u);
        }

        NSErrorUserInfoKey v267 = NSFilePathErrorKey;
        uint64_t v268 = v67;
        id v70 = +[NSDictionary dictionaryWithObjects:&v268 forKeys:&v267 count:1];
        strerror(v68);
        sub_100004A7C((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 938, NSPOSIXErrorDomain, v68, 0, v70, @"Failed to stat path %@: %s", v71, v67);
LABEL_66:
        id v42 = (id)objc_claimAutoreleasedReturnValue();

LABEL_67:
LABEL_68:
        id v58 = 0;
LABEL_69:
        uint64_t v57 = v224;
        goto LABEL_70;
      }
      int v72 = v249.st_mode & 0xF000;
      if (v72 != 0x4000 && v72 != 0x8000)
      {
        v89 = sub_100003788();
        if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)v259 = v66;
          *(_WORD *)&v259[8] = 1024;
          *(_DWORD *)v260 = v249.st_mode;
          _os_log_error_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "Extraction path at %@ should be a file or directory, but was not (had mode 0x%ho)", buf, 0x12u);
        }

        NSErrorUserInfoKey v265 = NSFilePathErrorKey;
        id v266 = v66;
        v90 = +[NSDictionary dictionaryWithObjects:&v266 forKeys:&v265 count:1];
        sub_100004A7C((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 944, @"SZExtractorErrorDomain", 3, 0, v90, @"Extraction path at %@ should be a file or directory, but was not (had mode 0x%ho)", v91, (uint64_t)v66);
        id v42 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_67;
      }
      uint64_t v214 = (unsigned int *)(v9 + 128);
      gid_t v247 = -1;
      uid_t v248 = -1;
      if ([v9 resolveOwnershipWithExtraField:0 outUID:&v248 outGID:&v247])
      {
        id v73 = v66;
        v74 = (const char *)[v73 fileSystemRepresentation];
        if (lchown(v74, v248, v247))
        {
          id v221 = v66;
          int v75 = *__error();
          id v76 = sub_100003788();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            id v77 = [v73 fileSystemRepresentation];
            uid_t v215 = v248;
            gid_t v218 = v247;
            size_t v78 = strerror(v75);
            *(_DWORD *)long long buf = 136316162;
            *(void *)v259 = v77;
            *(_WORD *)&v259[8] = 1024;
            *(_DWORD *)v260 = v215;
            *(_WORD *)&v260[4] = 1024;
            *(_DWORD *)&v260[6] = v218;
            LOWORD(v261) = 1024;
            *(_DWORD *)((char *)&v261 + 2) = v75;
            HIWORD(v261) = 2080;
            v262[0] = v78;
            _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "Failed to lchown %s to (%d:%d) : %d (%s)", buf, 0x28u);
          }

          id v66 = v221;
        }
      }
      if ((v249.st_mode & 0xF000) == 0x4000)
      {
        size_t __n = 0;
        v222 = v66;
        uint64_t v79 = [v66 stringByAppendingPathComponent:@"com.apple.StreamingUnzipResumptionData"];
        id v237 = 0;
        uint64_t v80 = +[NSData dataWithContentsOfFile:v79 options:2 error:&v237];
        id v81 = v237;
        id v216 = v81;
        id v219 = (id)v80;
        v213 = (void *)v79;
        if (v80)
        {
          v82 = +[NSFileManager defaultManager];
          id v234 = 0;
          unsigned __int8 v83 = [v82 removeItemAtPath:v79 error:&v234];
          id v212 = v234;

          if ((v83 & 1) == 0)
          {
            v84 = sub_100003788();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412546;
              *(void *)v259 = v213;
              *(_WORD *)&v259[8] = 2112;
              *(void *)v260 = v212;
              _os_log_error_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "Failed to remove %@: %@", buf, 0x16u);
            }
          }
          id v233 = v225;
          id v58 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v219 error:&v233];
          id v42 = v233;

          [v58 setDecodingFailurePolicy:0];
          if (!v58)
          {
            v115 = sub_100003788();
            if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)v259 = v42;
              _os_log_error_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_ERROR, "Failed to deserialize resumption data (%@); resuming from offset 0",
                buf,
                0xCu);
            }

            id v231 = v42;
            sub_100017334(v222, &v231);
            id v116 = v231;
            id v58 = 0;
            goto LABEL_193;
          }
          unsigned int v85 = [v58 decodeIntForKey:@"SerializationVersion"];
          if (v85 == 8)
          {
            v86 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentOffset"];
            unint64_t v226 = (unint64_t)[v86 unsignedLongLongValue];

            if (![*((id *)v9 + 12) count]) {
              goto LABEL_160;
            }
            unint64_t v87 = *((void *)v9 + 7);
            if (v87) {
              unint64_t v88 = v226 / v87;
            }
            else {
              unint64_t v88 = 0;
            }
            if (v88 < (unint64_t)[*((id *)v9 + 12) count])
            {
              id v132 = v58;
              id v133 = [v132 decodeBytesForKey:@"HashContext" returnedLength:&__n];
              if (v133 && __n)
              {
                if (__n != qword_10001DB58[*v214])
                {
                  gid_t v181 = sub_100003788();
                  if (os_log_type_enabled(v181, OS_LOG_TYPE_ERROR))
                  {
                    uint64_t v205 = *v214;
                    int v206 = off_100028B28[v205];
                    unint64_t v207 = (const char *)qword_10001DB58[v205];
                    *(_DWORD *)long long buf = 136315650;
                    *(void *)v259 = v206;
                    *(_WORD *)&v259[8] = 2048;
                    *(void *)v260 = __n;
                    *(_WORD *)&v260[8] = 2048;
                    id v261 = v207;
                    _os_log_error_impl((void *)&_mh_execute_header, v181, OS_LOG_TYPE_ERROR, "Serialized %s context (%lu bytes) did not match size of struct (%lu bytes); resuming from offset 0",
                      buf,
                      0x20u);
                  }

                  id v229 = v42;
                  sub_100017334(v222, &v229);
                  v123 = v42;
                  id v42 = v229;
                  id v58 = v132;
                  goto LABEL_194;
                }
                memcpy(v9 + 136, v133, __n);
                unint64_t v134 = *((void *)v9 + 7);
                unint64_t v135 = v226;
                if (v134) {
                  unint64_t v135 = v226 % v134;
                }
                *((void *)v9 + 8) = v135;
              }
LABEL_160:
              uint64_t v136 = [v58 decodePropertyListForKey:@"StreamInfoDict"];
              v137 = (void *)*((void *)v9 + 43);
              *((void *)v9 + 43) = v136;

              uint64_t v138 = (void *)*((void *)v9 + 43);
              if (v138)
              {
                v139 = [v138 objectForKeyedSubscript:@"RecordCount"];
                *((void *)v9 + 53) = [v139 unsignedLongLongValue];

                v140 = [*((id *)v9 + 43) objectForKeyedSubscript:@"TotalUncompressedBytes"];
                *((void *)v9 + 54) = [v140 unsignedLongLongValue];
              }
              uint64_t v141 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"LastChunkPartialHash"];
              v142 = (void *)*((void *)v9 + 44);
              *((void *)v9 + 44) = v141;

              v143 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"UnsureData"];
              id v144 = [v143 mutableCopy];
              uint64_t v145 = (void *)*((void *)v9 + 45);
              *((void *)v9 + 45) = v144;

              v146 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"InMemoryFileData"];
              id v147 = [v146 mutableCopy];
              id v148 = (void *)*((void *)v9 + 46);
              *((void *)v9 + 46) = v147;

              size_t __n = 0;
              id v58 = v58;
              id v149 = [v58 decodeBytesForKey:@"LocalFileRecord" returnedLength:&__n];
              if (v149)
              {
                size_t v150 = __n;
                if (__n)
                {
                  uint64_t v151 = v149;
                  id v152 = (void *)*((void *)v9 + 47);
                  if (*((void *)v9 + 15) < __n)
                  {
                    id v152 = reallocf(v152, __n);
                    *((void *)v9 + 47) = v152;
                    if (!v152)
                    {
                      v189 = sub_100003788();
                      if (os_log_type_enabled(v189, OS_LOG_TYPE_ERROR))
                      {
                        *(_WORD *)long long buf = 0;
                        _os_log_error_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_ERROR, "Could not allocate memory for local file record", buf, 2u);
                      }

                      sub_100004A7C((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1160, NSPOSIXErrorDomain, 12, 0, 0, @"Could not allocate memory for local file record", v190, v211);
LABEL_230:
                      id v116 = (id)objc_claimAutoreleasedReturnValue();
                      goto LABEL_193;
                    }
                    size_t v150 = __n;
                    *((void *)v9 + 15) = __n;
                  }
                  memcpy(v152, v151, v150);
                }
              }
              v9[452] = (*(unsigned char *)(*((void *)v9 + 47) + 6) & 8) != 0;
              size_t __n = 0;
              id v58 = v58;
              if ([v58 decodeBytesForKey:@"DataDescriptorUnion" returnedLength:&__n] && __n)
              {
                *((void *)v9 + 48) = malloc_type_calloc(1uLL, 0x18uLL, 0x1000040504FFAC1uLL);
                __memcpy_chk();
              }
              int v153 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"StageBytesComplete"];
              *((void *)v9 + 50) = [v153 unsignedLongLongValue];

              *((void *)v9 + 51) = v226;
              v154 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"StreamState"];
              v9[450] = [v154 unsignedCharValue];

              uint64_t v155 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentCRC32"];
              *((void *)v9 + 55) = [v155 unsignedLongValue];

              v156 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"RecordsProcessed"];
              *((void *)v9 + 52) = [v156 unsignedShortValue];

              unint64_t v157 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"LocalFileMode"];
              *((_WORD *)v9 + 224) = (unsigned __int16)[v157 unsignedShortValue] & 0xF1FF;

              v9[451] = [v58 decodeBoolForKey:@"StoreCurrentFileInMemory"];
              *((void *)v9 + 6) = *((void *)v9 + 51);
              if (v9[450] < 2u) {
                goto LABEL_195;
              }
              __darwin_ino64_t v158 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentOutputFileOffset"];
              *((void *)v9 + 9) = [v158 unsignedLongLongValue];

              v159 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"TotalFileSizeWritten"];
              *((void *)v9 + 10) = [v159 unsignedLongLongValue];

              v160 = (_WORD *)*((void *)v9 + 47);
              if (v160)
              {
                uint64_t v161 = sub_10000EEE0(v160);
                if (!v161)
                {
                  v186 = sub_100003788();
                  if (os_log_type_enabled(v186, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_error_impl((void *)&_mh_execute_header, v186, OS_LOG_TYPE_ERROR, "Failed to get path from current local file record.", buf, 2u);
                  }

                  NSErrorUserInfoKey v254 = NSFilePathErrorKey;
                  unsigned __int8 v255 = v222;
                  v187 = +[NSDictionary dictionaryWithObjects:&v255 forKeys:&v254 count:1];
                  sub_100004A7C((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1202, @"SZExtractorErrorDomain", 1, 0, v187, @"Failed to get path from current local file record.", v188, v211);
                  id v173 = (id)objc_claimAutoreleasedReturnValue();

                  v123 = v42;
                  goto LABEL_247;
                }
                v123 = (void *)v161;
                unsigned int v227 = [v222 stringByAppendingPathComponent:v161];
                v162 = sub_100003788();
                if (os_log_type_enabled(v162, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v203 = *((void *)v9 + 9);
                  *(_DWORD *)long long buf = 138412546;
                  *(void *)v259 = v227;
                  *(_WORD *)&v259[8] = 2048;
                  *(void *)v260 = v203;
                  _os_log_debug_impl((void *)&_mh_execute_header, v162, OS_LOG_TYPE_DEBUG, "Resuming %@ at offset %lld", buf, 0x16u);
                }

                if ([v58 decodeBoolForKey:@"OpenCurrentOutputFile"])
                {
                  uint64_t v163 = v9[454];
                  id v228 = v42;
                  uint64_t v164 = +[StreamingFileWriter synchronousFileWriterForPath:v227 withOpenFlags:2 mode:0 quarantineInfo:0 performCachedWrites:v163 error:&v228];
                  id v165 = v228;

                  int v166 = (void *)*((void *)v9 + 49);
                  *((void *)v9 + 49) = v164;

                  if (!*((void *)v9 + 49))
                  {
                    id v198 = sub_100003788();
                    if (os_log_type_enabled(v198, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)long long buf = 138412290;
                      *(void *)v259 = v227;
                      _os_log_error_impl((void *)&_mh_execute_header, v198, OS_LOG_TYPE_ERROR, "Failed to open output file at path %@", buf, 0xCu);
                    }

                    NSErrorUserInfoKey v252 = NSFilePathErrorKey;
                    uint64_t v253 = v227;
                    id v42 = +[NSDictionary dictionaryWithObjects:&v253 forKeys:&v252 count:1];
                    sub_100004A7C((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1213, @"SZExtractorErrorDomain", 1, v165, v42, @"Failed to open output file at path %@", v199, (uint64_t)v227);
                    goto LABEL_244;
                  }
                  id v42 = v165;
                }
                int v167 = *(unsigned __int16 *)(*((void *)v9 + 47) + 8);
                if (v167 != 8 && v167 != 99 && v167 != 14)
                {
LABEL_185:
                  if (!*((void *)v9 + 9)
                    || (v171 = (void *)*((void *)v9 + 49)) == 0
                    || (unsigned __int8 v172 = objc_msgSend(v171, "setCurrentOffset:error:"),
                        id v173 = v42,
                        v42,
                        id v42 = v173,
                        (v172 & 1) != 0))
                  {

LABEL_194:
LABEL_195:

                    mode_t v175 = v213;
LABEL_196:

                    goto LABEL_69;
                  }
                  goto LABEL_246;
                }
                v168 = [v58 decodeObjectOfClass:objc_opt_class() forKey:@"SerializedCompressionState"];
                if (!v168)
                {
                  v192 = sub_100003788();
                  if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_error_impl((void *)&_mh_execute_header, v192, OS_LOG_TYPE_ERROR, "Failed to get serialized compression state from save data", buf, 2u);
                  }

                  sub_100004A7C((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1222, @"SZExtractorErrorDomain", 1, 0, 0, @"Failed to get serialized compression state from save data", v193, v211);
                  id v173 = (id)objc_claimAutoreleasedReturnValue();
                  id v165 = 0;
                  goto LABEL_245;
                }
                id v165 = v168;
                id v169 = [v168 length];
                uint64_t v170 = malloc_type_malloc((size_t)v169, 0xAB65AED1uLL);
                [v165 getBytes:v170 length:v169];
                if (compression_stream_is_state_valid())
                {
                  *((void *)v9 + 5) = v170;

                  goto LABEL_185;
                }
                id v201 = sub_100003788();
                if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_error_impl((void *)&_mh_execute_header, v201, OS_LOG_TYPE_ERROR, "Compression save state was not valid.", buf, 2u);
                }

                sub_100004A7C((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1231, @"SZExtractorErrorDomain", 1, 0, 0, @"Compression save state was not valid.", v202, v211);
LABEL_244:
                id v173 = (id)objc_claimAutoreleasedReturnValue();
LABEL_245:

LABEL_246:
LABEL_247:
                id v42 = v173;
                goto LABEL_194;
              }
              v179 = sub_100003788();
              if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                *(void *)v259 = v222;
                _os_log_error_impl((void *)&_mh_execute_header, v179, OS_LOG_TYPE_ERROR, "Invalid state in resumption data at path %@", buf, 0xCu);
              }

              sub_100004A7C((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1377, @"SZExtractorErrorDomain", 1, 0, 0, @"Invalid state in resumption data at path %@", v180, (uint64_t)v222);
              goto LABEL_230;
            }
            id v174 = sub_100003788();
            if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR))
            {
              id v200 = [*((id *)v9 + 12) count];
              *(_DWORD *)long long buf = 134218240;
              *(void *)v259 = v88;
              *(_WORD *)&v259[8] = 2048;
              *(void *)v260 = v200;
              _os_log_error_impl((void *)&_mh_execute_header, v174, OS_LOG_TYPE_ERROR, "Computed index of current hash chunk (%llu) is not within supplied hashes array of %lu elements; resuming from offset 0",
                buf,
                0x16u);
            }

            id v230 = v42;
            sub_100017334(v222, &v230);
            v119 = v230;
          }
          else
          {
            unsigned int v117 = v85;
            v118 = sub_100003788();
            if (os_log_type_enabled(v118, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 67109634;
              *(_DWORD *)v259 = v117;
              *(_WORD *)&v259[4] = 1024;
              *(_DWORD *)&v259[6] = 8;
              *(_WORD *)v260 = 2112;
              *(void *)&v260[2] = v222;
              _os_log_error_impl((void *)&_mh_execute_header, v118, OS_LOG_TYPE_ERROR, "Found resumption data version %d, but expected %d at %@; resuming from offset 0",
                buf,
                0x18u);
            }

            id v232 = v42;
            sub_100017334(v222, &v232);
            v119 = v232;
          }
          id v116 = v119;
LABEL_193:
          v123 = v42;
          id v42 = v116;
          goto LABEL_194;
        }
        NSErrorDomain v113 = [v81 domain];
        if (NSCocoaErrorDomain == v113)
        {
          id v120 = [v216 code];

          if (v120 == (id)260)
          {
LABEL_138:
            v122 = +[NSFileManager defaultManager];
            id v236 = v225;
            v123 = [v122 contentsOfDirectoryAtPath:v222 error:&v236];
            id v124 = v236;

            if (v123 && ![v123 count])
            {
              id v42 = 0;
            }
            else
            {
              id v235 = v124;
              sub_100017334(v222, &v235);
              id v42 = v235;
            }

            id v212 = 0;
            id v58 = 0;
            goto LABEL_194;
          }
        }
        else
        {
        }
        v121 = sub_100003788();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)v259 = v79;
          *(_WORD *)&v259[8] = 2112;
          *(void *)v260 = v216;
          _os_log_error_impl((void *)&_mh_execute_header, v121, OS_LOG_TYPE_ERROR, "Failed to read resumption data from path %@: %@; starting from offset 0",
            buf,
            0x16u);
        }

        goto LABEL_138;
      }
      off_t st_size = v249.st_size;
      id v93 = v66;
      ssize_t v94 = getxattr((const char *)[v93 fileSystemRepresentation], "com.apple.StreamingPassthroughResumptionData", 0, 0, 0, 1);
      if (v94 == -1)
      {
        if (*__error() == 2 || *__error() == 93)
        {
          id v246 = v225;
          sub_100017334(v93, &v246);
          id v42 = v246;

          goto LABEL_68;
        }
        uint64_t v128 = *__error();
        v129 = sub_100003788();
        if (os_log_type_enabled(v129, OS_LOG_TYPE_ERROR))
        {
          v191 = strerror(v128);
          *(_DWORD *)long long buf = 136315650;
          *(void *)v259 = "com.apple.StreamingPassthroughResumptionData";
          *(_WORD *)&v259[8] = 2112;
          *(void *)v260 = v93;
          *(_WORD *)&v260[8] = 2080;
          id v261 = v191;
          _os_log_error_impl((void *)&_mh_execute_header, v129, OS_LOG_TYPE_ERROR, "Failed to get size of xattr %s from path %@: %s", buf, 0x20u);
        }

        NSErrorUserInfoKey v263 = NSFilePathErrorKey;
        id v264 = v93;
        id v70 = +[NSDictionary dictionaryWithObjects:&v264 forKeys:&v263 count:1];
        strerror(v128);
        sub_100004A7C((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 976, NSPOSIXErrorDomain, v128, 0, v70, @"Failed to get size of xattr %s from path %@: %s", v130, (uint64_t)"com.apple.StreamingPassthroughResumptionData");
        goto LABEL_66;
      }
      size_t v95 = v94;
      if (v94 < 1 || ![*((id *)v9 + 12) count])
      {
        id v58 = 0;
        id v100 = v225;
        goto LABEL_115;
      }
      uint64_t v96 = +[NSMutableData dataWithCapacity:v95];
      [v96 setLength:v95];
      id v220 = v93;
      uint64_t v97 = (const char *)[v220 fileSystemRepresentation];
      id v223 = v96;
      ssize_t v98 = getxattr(v97, "com.apple.StreamingPassthroughResumptionData", [v223 mutableBytes], v95, 0, 1);
      if (v98 == v95)
      {
        id v217 = v220;
        if (removexattr((const char *)[v217 fileSystemRepresentation], "com.apple.StreamingPassthroughResumptionData", 1))
        {
          v99 = sub_100003788();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
          {
            id v195 = [v217 fileSystemRepresentation];
            id v196 = __error();
            uint64_t v197 = strerror(*v196);
            *(_DWORD *)long long buf = 136315650;
            *(void *)v259 = "com.apple.StreamingPassthroughResumptionData";
            *(_WORD *)&v259[8] = 2080;
            *(void *)v260 = v195;
            *(_WORD *)&v260[8] = 2080;
            id v261 = v197;
            _os_log_error_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "Failed to remove EA %s from %s: %s", buf, 0x20u);
          }
        }
        id v244 = v225;
        id v58 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v223 error:&v244];
        id v100 = v244;

        [v58 setDecodingFailurePolicy:0];
        if (v58)
        {
          unsigned int v101 = [v58 decodeIntForKey:@"SerializationVersion"];
          if (v101 == 8)
          {
            unint64_t v102 = *((void *)v9 + 7);
            if (v102) {
              unint64_t v103 = (st_size - (unint64_t)(st_size > 0)) / v102;
            }
            else {
              unint64_t v103 = 0;
            }
            if (v103 < (unint64_t)[*((id *)v9 + 12) count])
            {
              size_t __n = 0;
              id v58 = v58;
              id v182 = [v58 decodeBytesForKey:@"HashContext" returnedLength:&__n];
              if (!v182 || !__n)
              {
LABEL_217:

LABEL_115:
                v9[450] = 5;
                *((void *)v9 + 6) = st_size;
                id v104 = (void *)*((void *)v9 + 45);
                *((void *)v9 + 45) = 0;

                v105 = (void *)*((void *)v9 + 46);
                *((void *)v9 + 46) = 0;

                *((void *)v9 + 51) = st_size;
                uint64_t v106 = v9[454];
                id v238 = v100;
                uint64_t v107 = +[StreamingFileWriter synchronousFileWriterForPath:v93 withOpenFlags:9 mode:0 quarantineInfo:0 performCachedWrites:v106 error:&v238];
                id v42 = v238;

                v108 = (void *)*((void *)v9 + 49);
                *((void *)v9 + 49) = v107;

                if (!*((void *)v9 + 49))
                {
                  v109 = sub_100003788();
                  if (os_log_type_enabled(v109, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    *(void *)v259 = v93;
                    _os_log_error_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_ERROR, "Failed to open output file at path %@", buf, 0xCu);
                  }

                  NSErrorUserInfoKey v256 = NSFilePathErrorKey;
                  id v257 = v93;
                  uint64_t v110 = +[NSDictionary dictionaryWithObjects:&v257 forKeys:&v256 count:1];
                  uint64_t v112 = sub_100004A7C((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 1060, @"SZExtractorErrorDomain", 1, v42, v110, @"Failed to open output file at path %@", v111, (uint64_t)v93);

                  id v42 = (id)v112;
                }
                goto LABEL_69;
              }
              if (__n == qword_10001DB58[*v214])
              {
                memcpy(v9 + 136, v182, __n);
                unint64_t v183 = *((void *)v9 + 7);
                unint64_t v184 = st_size;
                if (v183) {
                  unint64_t v184 = st_size % v183;
                }
                *((void *)v9 + 8) = v184;
                goto LABEL_217;
              }
              v194 = sub_100003788();
              if (os_log_type_enabled(v194, OS_LOG_TYPE_ERROR))
              {
                uint64_t v208 = *v214;
                id v209 = off_100028B28[v208];
                __darwin_ino64_t v210 = (const char *)qword_10001DB58[v208];
                *(_DWORD *)long long buf = 136315650;
                *(void *)v259 = v209;
                *(_WORD *)&v259[8] = 2048;
                *(void *)v260 = __n;
                *(_WORD *)&v260[8] = 2048;
                id v261 = v210;
                _os_log_error_impl((void *)&_mh_execute_header, v194, OS_LOG_TYPE_ERROR, "Serialized %s context (%lu bytes) did not match size of struct (%lu bytes); resuming from offset 0",
                  buf,
                  0x20u);
              }

              id v239 = v100;
              sub_100017334(v217, &v239);
              id v42 = v239;

LABEL_223:
              mode_t v175 = v223;
              goto LABEL_196;
            }
            uint64_t v185 = sub_100003788();
            if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR))
            {
              id v204 = [*((id *)v9 + 12) count];
              *(_DWORD *)long long buf = 134218240;
              *(void *)v259 = v103;
              *(_WORD *)&v259[8] = 2048;
              *(void *)v260 = v204;
              _os_log_error_impl((void *)&_mh_execute_header, v185, OS_LOG_TYPE_ERROR, "Computed index of current hash chunk (%llu) is not within supplied hashes array of %lu elements; resuming from offset 0",
                buf,
                0x16u);
            }

            id v241 = v100;
            v127 = &v241;
          }
          else
          {
            unsigned int v177 = v101;
            dev_t v178 = sub_100003788();
            if (os_log_type_enabled(v178, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 67109634;
              *(_DWORD *)v259 = v177;
              *(_WORD *)&v259[4] = 1024;
              *(_DWORD *)&v259[6] = 8;
              *(_WORD *)v260 = 2112;
              *(void *)&v260[2] = v217;
              _os_log_error_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_ERROR, "Found resumption data version %d, but expected %d at %@; resuming from offset 0",
                buf,
                0x18u);
            }

            id v243 = v100;
            v127 = &v243;
          }
        }
        else
        {
          v176 = sub_100003788();
          if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)v259 = v100;
            _os_log_error_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_ERROR, "Unable to deserialize resumption data (%@); resuming from offset 0",
              buf,
              0xCu);
          }

          id v58 = 0;
          id v242 = v100;
          v127 = &v242;
        }
        id v225 = v100;
      }
      else
      {
        ssize_t v125 = v98;
        id v126 = sub_100003788();
        if (os_log_type_enabled(v126, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 134218754;
          *(void *)v259 = v95;
          *(_WORD *)&v259[8] = 2048;
          *(void *)v260 = v125;
          *(_WORD *)&v260[8] = 2080;
          id v261 = "com.apple.StreamingPassthroughResumptionData";
          LOWORD(v262[0]) = 2112;
          *(void *)((char *)v262 + 2) = v220;
          _os_log_error_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, "Expected to read %ld bytes but got %ld for EA %s on %@; resuming from offset 0",
            buf,
            0x2Au);
        }

        id v58 = 0;
        id v245 = v225;
        v127 = &v245;
      }
      sub_100017334(v220, v127);
      id v42 = *v127;

      goto LABEL_223;
    }
  }
  else
  {
  }
  id v39 = sub_100003788();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)v259 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Options dictionary supplied has one or more options with an incorrect type: %@", buf, 0xCu);
  }

  id v41 = sub_100004A7C((uint64_t)"-[StreamingUnzipState initWithPath:options:error:]", 864, @"SZExtractorErrorDomain", 2, 0, 0, @"Options dictionary supplied has one or more options with an incorrect type: %@", v40, (uint64_t)v10);
  id v42 = v41;
  if (!a4) {
    goto LABEL_40;
  }
  id v43 = v41;
  id v42 = v43;
LABEL_38:
  BOOL v47 = 0;
  *a4 = v43;
LABEL_41:

LABEL_42:
  return v47;
}

uint64_t sub_100017334(void *a1, void *a2)
{
  id v3 = a1;
  NSFileAttributeKey v62 = NSFilePosixPermissions;
  uint64_t v4 = +[NSNumber numberWithUnsignedShort:16877];
  id v63 = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v63 forKeys:&v62 count:1];

  id v6 = v3;
  int v7 = open((const char *)[v6 fileSystemRepresentation], 256);
  if (v7 < 0)
  {
    uint64_t v12 = *__error();
    uint64_t v13 = sub_100003788();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v50 = [v6 fileSystemRepresentation];
      NSErrorDomain v51 = strerror(v12);
      *(_DWORD *)long long buf = 136315394;
      id v65 = v50;
      __int16 v66 = 2080;
      v67[0] = v51;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to open %s : %s", buf, 0x16u);
    }

    NSErrorDomain v14 = NSPOSIXErrorDomain;
    id v15 = [v6 fileSystemRepresentation];
    strerror(v12);
    id v17 = sub_100004A7C((uint64_t)"_GetDataProtectionClassForPath", 586, NSPOSIXErrorDomain, v12, 0, 0, @"Failed to open %s : %s", v16, (uint64_t)v15);
  }
  else
  {
    int v8 = v7;
    uint64_t v9 = fcntl(v7, 63);
    if ((v9 & 0x80000000) == 0)
    {
      uint64_t v10 = v9;
      close(v8);

      int v11 = 1;
      goto LABEL_14;
    }
    uint64_t v18 = *__error();
    char v19 = sub_100003788();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v54 = [v6 fileSystemRepresentation];
      uint64_t v55 = strerror(v18);
      *(_DWORD *)long long buf = 136315394;
      id v65 = v54;
      __int16 v66 = 2080;
      v67[0] = v55;
      _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to get protection class on %s : %s", buf, 0x16u);
    }

    NSErrorDomain v14 = NSPOSIXErrorDomain;
    id v20 = [v6 fileSystemRepresentation];
    strerror(v18);
    id v17 = sub_100004A7C((uint64_t)"_GetDataProtectionClassForPath", 593, NSPOSIXErrorDomain, v18, 0, 0, @"Failed to get protection class on %s : %s", v21, (uint64_t)v20);
    close(v8);
  }
  id v22 = v17;

  id v23 = v22;
  uint64_t v24 = [v23 domain];
  if (v14 != (NSErrorDomain)v24)
  {
    __int16 v25 = v24;
    goto LABEL_29;
  }
  id v26 = [v23 code];

  if (v26 != (id)2) {
    goto LABEL_30;
  }

  int v11 = 0;
  uint64_t v10 = 0xFFFFFFFFLL;
LABEL_14:
  __int16 v27 = +[NSFileManager defaultManager];
  id v61 = 0;
  unsigned __int8 v28 = [v27 removeItemAtPath:v6 error:&v61];
  id v23 = v61;

  if (v28)
  {
LABEL_15:
    uint64_t v29 = v23;
    __int16 v30 = +[NSFileManager defaultManager];
    id v60 = v23;
    unsigned __int8 v31 = [v30 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v5 error:&v60];
    id v23 = v60;

    if (v31)
    {
      if (!v11)
      {
        uint64_t v43 = 1;
        goto LABEL_42;
      }
      id v32 = v6;
      int v33 = open((const char *)[v32 fileSystemRepresentation], 256);
      if (v33 < 0)
      {
        uint64_t v44 = *__error();
        uint64_t v45 = sub_100003788();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          id v58 = [v32 fileSystemRepresentation];
          id v59 = strerror(v44);
          *(_DWORD *)long long buf = 136315394;
          id v65 = v58;
          __int16 v66 = 2080;
          v67[0] = v59;
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to open %s : %s", buf, 0x16u);
        }

        id v46 = [v32 fileSystemRepresentation];
        strerror(v44);
        id v39 = sub_100004A7C((uint64_t)"_SetDataProtectionClassOnPath", 615, NSPOSIXErrorDomain, v44, 0, 0, @"Failed to open %s : %s", v47, (uint64_t)v46);
      }
      else
      {
        int v34 = v33;
        if (!fcntl(v33, 64, v10))
        {
          close(v34);
          char v49 = 1;
          id v48 = v23;
LABEL_38:

          id v52 = v48;
          if (v49)
          {
            uint64_t v43 = 1;
            id v23 = v52;
            goto LABEL_42;
          }
          id v23 = v52;
          if (!a2)
          {
LABEL_41:
            uint64_t v43 = 0;
            goto LABEL_42;
          }
          goto LABEL_31;
        }
        uint64_t v35 = *__error();
        uint64_t v36 = sub_100003788();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          id v56 = [v32 fileSystemRepresentation];
          uint64_t v57 = strerror(v35);
          *(_DWORD *)long long buf = 136315650;
          id v65 = v56;
          __int16 v66 = 1024;
          LODWORD(v67[0]) = v10;
          WORD2(v67[0]) = 2080;
          *(void *)((char *)v67 + 6) = v57;
          _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to set protection class on %s to %d: %s", buf, 0x1Cu);
        }

        id v37 = [v32 fileSystemRepresentation];
        strerror(v35);
        id v39 = sub_100004A7C((uint64_t)"_SetDataProtectionClassOnPath", 621, NSPOSIXErrorDomain, v35, 0, 0, @"Failed to set protection class on %s to %d: %s", v38, (uint64_t)v37);
        close(v34);
      }
      id v48 = v39;

      char v49 = 0;
      goto LABEL_38;
    }
    __int16 v25 = sub_100003788();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      goto LABEL_29;
    }
    *(_DWORD *)long long buf = 138412546;
    id v65 = v6;
    __int16 v66 = 2112;
    v67[0] = v23;
    id v41 = "Failed to create extraction directory at path %@: %@";
    goto LABEL_44;
  }
  NSErrorDomain v40 = [v23 domain];
  if (NSCocoaErrorDomain == v40)
  {
    id v42 = [v23 code];

    if (v42 == (id)4)
    {

      id v23 = 0;
      goto LABEL_15;
    }
  }
  else
  {
  }
  __int16 v25 = sub_100003788();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412546;
    id v65 = v6;
    __int16 v66 = 2112;
    v67[0] = v23;
    id v41 = "Failed to remove bad extraction path at %@: %@";
LABEL_44:
    _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v41, buf, 0x16u);
  }
LABEL_29:

LABEL_30:
  if (!a2) {
    goto LABEL_41;
  }
LABEL_31:
  id v23 = v23;
  uint64_t v43 = 0;
  *a2 = v23;
LABEL_42:

  return v43;
}

uint64_t sub_100017A58(void *a1, void *a2, objc_class *a3)
{
  id v5 = a2;
  id v6 = [a1 objectForKey:v5];
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    int v8 = sub_100003788();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = NSStringFromClass(a3);
      int v11 = (objc_class *)objc_opt_class();
      uint64_t v12 = NSStringFromClass(v11);
      int v13 = 138412802;
      id v14 = v5;
      __int16 v15 = 2112;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Value of key %@ in options dictionary was not an object of type %@. Was %@", (uint8_t *)&v13, 0x20u);
    }
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return v7;
}

id sub_100017B9C(void *a1)
{
  int v2 = getgroups(16, v18);
  if (v2 != -1)
  {
    int v3 = v2;
    uint64_t v4 = objc_opt_new();
    if (v3 >= 1)
    {
      uint64_t v5 = v3;
      id v6 = v18;
      do
      {
        unsigned int v7 = *v6++;
        int v8 = +[NSNumber numberWithUnsignedInt:v7];
        [v4 addObject:v8];

        --v5;
      }
      while (v5);
    }
    id v9 = [v4 copy];
    uint64_t v10 = 0;
    if (!a1) {
      goto LABEL_12;
    }
LABEL_10:
    if (!v9) {
      *a1 = v10;
    }
    goto LABEL_12;
  }
  uint64_t v11 = *__error();
  uint64_t v12 = sub_100003788();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    __int16 v17 = strerror(v11);
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to get current group access list: %s", buf, 0xCu);
  }

  int v13 = strerror(v11);
  uint64_t v10 = sub_100004A7C((uint64_t)"FetchGroupIDs", 250, NSPOSIXErrorDomain, v11, 0, 0, @"Failed to get current group access list: %s", v14, (uint64_t)v13);
  uint64_t v4 = 0;
  id v9 = 0;
  if (a1) {
    goto LABEL_10;
  }
LABEL_12:

  return v9;
}

void sub_100017F50(uint64_t a1)
{
  bzero(__s, 0x400uLL);
  int v2 = *(void **)(a1 + 32);
  id v71 = 0;
  uint64_t v3 = [v2 _serviceConnectionWithError:&v71];
  uint64_t v4 = (char *)v71;
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 40);
  *(void *)(*(void *)(a1 + 32) + 40) = v3;

  id v6 = [*(id *)(a1 + 32) unzipServiceConnection];
  LODWORD(v3) = v6 == 0;

  if (!v3)
  {
    unsigned int v7 = objc_alloc_init(SZExtractorInternalDelegate);
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 64);
    *(void *)(v8 + 64) = v7;

    uint64_t v10 = sub_100018894();
    uint64_t v11 = [*(id *)(a1 + 32) unzipServiceConnection];
    [v11 setExportedInterface:v10];

    uint64_t v12 = [*(id *)(a1 + 32) internalExtractorDelegate];
    int v13 = [*(id *)(a1 + 32) unzipServiceConnection];
    [v13 setExportedObject:v12];

    objc_initWeak((id *)location, *(id *)(a1 + 32));
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_10001891C;
    v69[3] = &unk_100028780;
    objc_copyWeak(&v70, (id *)location);
    uint64_t v14 = [*(id *)(a1 + 32) unzipServiceConnection];
    [(id)v14 setInterruptionHandler:v69];

    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_1000189E8;
    void v67[3] = &unk_100028780;
    objc_copyWeak(&v68, (id *)location);
    __int16 v15 = [*(id *)(a1 + 32) unzipServiceConnection];
    [v15 setInvalidationHandler:v67];

    objc_destroyWeak(&v68);
    objc_destroyWeak(&v70);
    objc_destroyWeak((id *)location);
    uint64_t v16 = [*(id *)(a1 + 32) unzipServiceConnection];
    [v16 resume];

    __int16 v17 = +[NSFileManager defaultManager];
    uint64_t v18 = [*(id *)(a1 + 32) extractionPath];
    LOBYTE(v14) = [v17 fileExistsAtPath:v18];

    if (v14)
    {
      char v19 = v4;
    }
    else
    {
      NSFileAttributeKey v77 = NSFilePosixPermissions;
      id v20 = +[NSNumber numberWithUnsignedShort:16877];
      size_t v78 = v20;
      uint64_t v21 = +[NSDictionary dictionaryWithObjects:&v78 forKeys:&v77 count:1];

      id v22 = +[NSFileManager defaultManager];
      id v23 = [*(id *)(a1 + 32) extractionPath];
      __int16 v66 = v4;
      unsigned int v24 = [v22 createDirectoryAtPath:v23 withIntermediateDirectories:1 attributes:v21 error:&v66];
      char v19 = v66;

      if (!v24)
      {
        NSErrorDomain v40 = sub_100003788();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          id v60 = [*(id *)(a1 + 32) extractionPath];
          *(_DWORD *)location = 138412546;
          *(void *)&location[4] = v60;
          __int16 v73 = 2112;
          v74 = v19;
          _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Failed to create extraction directory at path %@: %@", location, 0x16u);
        }
        id v41 = [*(id *)(a1 + 32) extractionPath];
        uint64_t v43 = sub_100004A7C((uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke", 510, @"SZExtractorErrorDomain", 1, v19, 0, @"Failed to create extraction directory at path %@: %@", v42, (uint64_t)v41);

        [*(id *)(a1 + 32) setError:v43];
LABEL_20:
        uint64_t v4 = v19;
        goto LABEL_21;
      }
    }
    id v25 = +[NSFileManager defaultManager];
    id v26 = [*(id *)(a1 + 32) extractionPath];
    BOOL v27 = realpath_DARWIN_EXTSN((const char *)[v25 fileSystemRepresentationWithPath:v26], __s) == 0;

    if (v27)
    {
      uint64_t v35 = *__error();
      uint64_t v36 = sub_100003788();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        id v58 = [*(id *)(a1 + 32) extractionPath];
        id v59 = strerror(v35);
        *(_DWORD *)location = 138412802;
        *(void *)&location[4] = v58;
        __int16 v73 = 2080;
        v74 = __s;
        __int16 v75 = 2080;
        id v76 = v59;
        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Failed to realpath \"%@\" at \"%s\": %s", location, 0x20u);
      }
      id v37 = [*(id *)(a1 + 32) extractionPath];
      strerror(v35);
      id v39 = sub_100004A7C((uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke", 517, NSPOSIXErrorDomain, v35, 0, 0, @"Failed to realpath \"%@\" at \"%s\": %s", v38, (uint64_t)v37);

      [*(id *)(a1 + 32) setError:v39];
    }
    else
    {
      unsigned __int8 v28 = (void *)sandbox_extension_issue_file();
      if (v28)
      {
        uint64_t v29 = +[NSFileManager defaultManager];
        __int16 v30 = [v29 stringWithFileSystemRepresentation:__s length:strlen(__s)];

        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v64[2] = sub_100018AD4;
        v64[3] = &unk_1000287A8;
        uint8_t v64[4] = *(void *)(a1 + 32);
        id v65 = *(id *)(a1 + 40);
        unsigned __int8 v31 = objc_retainBlock(v64);
        BOOL v32 = *(unsigned char *)(a1 + 48) == 0;
        int v33 = [*(id *)(a1 + 32) unzipServiceConnection];
        int v34 = v33;
        if (v32) {
          [v33 remoteObjectProxyWithErrorHandler:v31];
        }
        else {
        id v56 = [v33 synchronousRemoteObjectProxyWithErrorHandler:v31];
        }

        uint64_t v57 = [*(id *)(a1 + 32) options];
        v62[0] = _NSConcreteStackBlock;
        v62[1] = 3221225472;
        v62[2] = sub_100018BD8;
        v62[3] = &unk_1000287D0;
        v62[4] = *(void *)(a1 + 32);
        id v63 = *(id *)(a1 + 40);
        [v56 setupUnzipperWithOutputPath:v30 sandboxExtensionToken:v28 options:v57 withReply:v62];

        free(v28);
        goto LABEL_26;
      }
      uint64_t v44 = *__error();
      uint64_t v45 = sub_100003788();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        id v61 = strerror(v44);
        *(_DWORD *)location = 136315394;
        *(void *)&location[4] = __s;
        __int16 v73 = 2080;
        v74 = v61;
        _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension for \"%s\" : %s", location, 0x16u);
      }

      strerror(v44);
      uint64_t v47 = sub_100004A7C((uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke", 525, NSPOSIXErrorDomain, v44, 0, 0, @"Failed to issue sandbox extension for \"%s\" : %s", v46, (uint64_t)__s);
      [*(id *)(a1 + 32) setError:v47];
    }
    goto LABEL_20;
  }
  [*(id *)(a1 + 32) setError:v4];
LABEL_21:
  id v48 = sub_100003788();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    char v49 = *(void **)(a1 + 32);
    id v50 = (char *)[v49 lastResumptionOffset];
    NSErrorDomain v51 = [*(id *)(a1 + 32) error];
    *(_DWORD *)location = 138412802;
    *(void *)&location[4] = v49;
    __int16 v73 = 2048;
    v74 = v50;
    __int16 v75 = 2112;
    id v76 = v51;
    _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%@: calling prepare completion block with offset %llu, error %@", location, 0x20u);
  }
  uint64_t v52 = *(void *)(a1 + 40);
  id v53 = [*(id *)(a1 + 32) lastResumptionOffset];
  id v54 = [*(id *)(a1 + 32) error];
  (*(void (**)(uint64_t, id, void *))(v52 + 16))(v52, v53, v54);

  uint64_t v55 = [*(id *)(a1 + 32) error];

  if (v55) {
    [*(id *)(a1 + 32) _invalidateObject];
  }
  char v19 = v4;
LABEL_26:
}

void sub_100018860(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id location)
{
  objc_destroyWeak(v38);
  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100018894()
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10002F3A0);
  WeakRetained = objc_loadWeakRetained(&qword_10002F3A8);
  if (!WeakRetained)
  {
    WeakRetained = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___StreamingUnzipDelegateProtocol];
    objc_storeWeak(&qword_10002F3A8, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002F3A0);

  return WeakRetained;
}

void sub_10001891C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = sub_100003788();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v5) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Connection interrupted to streaming unzip service.", (uint8_t *)&v5, 2u);
  }

  uint64_t v4 = sub_100004A7C((uint64_t)"-[SZExtractor _prepareForRemoteExtractionSynchronously:withCompletionBlock:]_block_invoke", 490, NSCocoaErrorDomain, 4097, 0, 0, @"Connection interrupted to streaming unzip service.", v3, v5);
  [WeakRetained setError:v4];

  [WeakRetained _invalidateObject];
}

void sub_1000189E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  NSErrorUserInfoKey v4 = NSLocalizedDescriptionKey;
  CFStringRef v5 = @"Connection invalidated to streaming unzip service.";
  int v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  uint64_t v3 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4099 userInfo:v2];
  [WeakRetained setError:v3];

  [WeakRetained _invalidateObject];
}

void sub_100018AD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  NSErrorUserInfoKey v4 = sub_100003788();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%@: prepare returning error %@", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 32) setError:v3];
  [*(id *)(a1 + 32) setLastResumptionOffset:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _invalidateObject];
}

void sub_100018BD8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5) {
    [*(id *)(a1 + 32) setError:v5];
  }
  [*(id *)(a1 + 32) setLastResumptionOffset:a3];
  int v6 = sub_100003788();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138412802;
    uint64_t v9 = v7;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    __int16 v12 = 2112;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@: calling prepare completion block with offset %llu, error %@", (uint8_t *)&v8, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v5) {
    [*(id *)(a1 + 32) _invalidateObject];
  }
}

id sub_100018E18()
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_10002F390);
  id WeakRetained = objc_loadWeakRetained(&qword_10002F398);
  if (!WeakRetained)
  {
    id WeakRetained = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___StreamingUnzipProtocol];
    objc_storeWeak(&qword_10002F398, WeakRetained);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_10002F390);

  return WeakRetained;
}

void sub_100018F50(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_100018F68(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    int v6 = sub_100003788();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@: prepare for extraction failed: %@", (uint8_t *)&v8, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    **(void **)(a1 + 48) = a2;
  }
}

void sub_100019A08(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_100003788();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138412546;
      uint64_t v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@: Suspending stream prior to encoding failed with error: %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

void sub_100019FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100019FE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100003788();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "remoteObjectProxy returning error %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void sub_10001A0B4(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2 < 0)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return _CC_MD5_Final(md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return _CC_MD5_Init(c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return _CC_MD5_Update(c, data, len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return _CC_SHA1_Final(md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return _CC_SHA1_Init(c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA1_Update(c, data, len);
}

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA224_Final(md, c);
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA224_Init(c);
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA224_Update(c, data, len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return _CC_SHA384_Final(md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return _CC_SHA384_Init(c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA384_Update(c, data, len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return _CC_SHA512_Final(md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return _CC_SHA512_Init(c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA512_Update(c, data, len);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return _CFStringConvertEncodingToNSStringEncoding(encoding);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

compression_status compression_stream_destroy(compression_stream *stream)
{
  return _compression_stream_destroy(stream);
}

uint64_t compression_stream_get_state_size()
{
  return _compression_stream_get_state_size();
}

uint64_t compression_stream_is_state_valid()
{
  return _compression_stream_is_state_valid();
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return _compression_stream_process(stream, flags);
}

uint64_t compression_stream_reinit()
{
  return _compression_stream_reinit();
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return _crc32(crc, buf, len);
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

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
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

int fchmod(int a1, mode_t a2)
{
  return _fchmod(a1, a2);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return _fchown(a1, a2, a3);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _fsetxattr(fd, name, value, size, position, options);
}

int fts_close(FTS *a1)
{
  return _fts_close(a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return _fts_open(a1, a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return _fts_read(a1);
}

int futimes(int a1, const timeval *a2)
{
  return _futimes(a1, a2);
}

int getgroups(int a1, gid_t a2[])
{
  return _getgroups(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

uid_t getuid(void)
{
  return _getuid();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

int lchmod(const char *a1, mode_t a2)
{
  return _lchmod(a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return _lchown(a1, a2, a3);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return _lseek(a1, a2, a3);
}

int lutimes(const char *a1, const timeval *a2)
{
  return _lutimes(a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
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

int mkpath_np(const char *path, mode_t omode)
{
  return _mkpath_np(path, omode);
}

time_t mktime(tm *a1)
{
  return _mktime(a1);
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

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return _pthread_cond_broadcast(a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return _pthread_cond_wait(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int removexattr(const char *path, const char *name, int options)
{
  return _removexattr(path, name, options);
}

uint64_t sandbox_check_by_audit_token()
{
  return _sandbox_check_by_audit_token();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_issue_file()
{
  return _sandbox_extension_issue_file();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
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

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return _strndup(__s1, __n);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return _strsep(__stringp, __delim);
}

int symlink(const char *a1, const char *a2)
{
  return _symlink(a1, a2);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__invalidateObject(void *a1, const char *a2, ...)
{
  return [a1 _invalidateObject];
}

id objc_msgSend__isValidObject(void *a1, const char *a2, ...)
{
  return [a1 _isValidObject];
}

id objc_msgSend_accessTime(void *a1, const char *a2, ...)
{
  return [a1 accessTime];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_bytesHashedInChunk(void *a1, const char *a2, ...)
{
  return [a1 bytesHashedInChunk];
}

id objc_msgSend_cachedGIDs(void *a1, const char *a2, ...)
{
  return [a1 cachedGIDs];
}

id objc_msgSend_checkLastChunkPartialHash(void *a1, const char *a2, ...)
{
  return [a1 checkLastChunkPartialHash];
}

id objc_msgSend_clearSavedState(void *a1, const char *a2, ...)
{
  return [a1 clearSavedState];
}

id objc_msgSend_closeCurrentOutputFD(void *a1, const char *a2, ...)
{
  return [a1 closeCurrentOutputFD];
}

id objc_msgSend_cmpState(void *a1, const char *a2, ...)
{
  return [a1 cmpState];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
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

id objc_msgSend_currentCRC32(void *a1, const char *a2, ...)
{
  return [a1 currentCRC32];
}

id objc_msgSend_currentLFMode(void *a1, const char *a2, ...)
{
  return [a1 currentLFMode];
}

id objc_msgSend_currentLFRecord(void *a1, const char *a2, ...)
{
  return [a1 currentLFRecord];
}

id objc_msgSend_currentLFRecordAllocationSize(void *a1, const char *a2, ...)
{
  return [a1 currentLFRecordAllocationSize];
}

id objc_msgSend_currentLFRequiresDataDescriptor(void *a1, const char *a2, ...)
{
  return [a1 currentLFRequiresDataDescriptor];
}

id objc_msgSend_currentOffset(void *a1, const char *a2, ...)
{
  return [a1 currentOffset];
}

id objc_msgSend_currentOutputFD(void *a1, const char *a2, ...)
{
  return [a1 currentOutputFD];
}

id objc_msgSend_dataDescriptor(void *a1, const char *a2, ...)
{
  return [a1 dataDescriptor];
}

id objc_msgSend_defaultCStringEncoding(void *a1, const char *a2, ...)
{
  return [a1 defaultCStringEncoding];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_denyInvalidSymlinks(void *a1, const char *a2, ...)
{
  return [a1 denyInvalidSymlinks];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorDelegate(void *a1, const char *a2, ...)
{
  return [a1 errorDelegate];
}

id objc_msgSend_executeAsyncOperation(void *a1, const char *a2, ...)
{
  return [a1 executeAsyncOperation];
}

id objc_msgSend_executeFileOperationFlags(void *a1, const char *a2, ...)
{
  return [a1 executeFileOperationFlags];
}

id objc_msgSend_extractionEnteredPassThroughMode(void *a1, const char *a2, ...)
{
  return [a1 extractionEnteredPassThroughMode];
}

id objc_msgSend_extractionPath(void *a1, const char *a2, ...)
{
  return [a1 extractionPath];
}

id objc_msgSend_fileData(void *a1, const char *a2, ...)
{
  return [a1 fileData];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileWriter(void *a1, const char *a2, ...)
{
  return [a1 fileWriter];
}

id objc_msgSend_fileWriterQueue(void *a1, const char *a2, ...)
{
  return [a1 fileWriterQueue];
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return [a1 finishDecoding];
}

id objc_msgSend_finishStream(void *a1, const char *a2, ...)
{
  return [a1 finishStream];
}

id objc_msgSend_gid(void *a1, const char *a2, ...)
{
  return [a1 gid];
}

id objc_msgSend_hasHadPostSetupMethodsCalled(void *a1, const char *a2, ...)
{
  return [a1 hasHadPostSetupMethodsCalled];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hashContext(void *a1, const char *a2, ...)
{
  return [a1 hashContext];
}

id objc_msgSend_hashedChunkSize(void *a1, const char *a2, ...)
{
  return [a1 hashedChunkSize];
}

id objc_msgSend_inMemoryFileData(void *a1, const char *a2, ...)
{
  return [a1 inMemoryFileData];
}

id objc_msgSend_inProcessDelegateQueue(void *a1, const char *a2, ...)
{
  return [a1 inProcessDelegateQueue];
}

id objc_msgSend_inProcessExtractorDelegate(void *a1, const char *a2, ...)
{
  return [a1 inProcessExtractorDelegate];
}

id objc_msgSend_inProcessUnzipper(void *a1, const char *a2, ...)
{
  return [a1 inProcessUnzipper];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_internalExtractorDelegate(void *a1, const char *a2, ...)
{
  return [a1 internalExtractorDelegate];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isLocalExtractor(void *a1, const char *a2, ...)
{
  return [a1 isLocalExtractor];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_lastChunkPartialHash(void *a1, const char *a2, ...)
{
  return [a1 lastChunkPartialHash];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastResumptionOffset(void *a1, const char *a2, ...)
{
  return [a1 lastResumptionOffset];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_markResumptionPoint(void *a1, const char *a2, ...)
{
  return [a1 markResumptionPoint];
}

id objc_msgSend_maxConcurrency(void *a1, const char *a2, ...)
{
  return [a1 maxConcurrency];
}

id objc_msgSend_maxPendingItemSize(void *a1, const char *a2, ...)
{
  return [a1 maxPendingItemSize];
}

id objc_msgSend_maxPendingOperationSize(void *a1, const char *a2, ...)
{
  return [a1 maxPendingOperationSize];
}

id objc_msgSend_modTime(void *a1, const char *a2, ...)
{
  return [a1 modTime];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_needsPreparation(void *a1, const char *a2, ...)
{
  return [a1 needsPreparation];
}

id objc_msgSend_oflag(void *a1, const char *a2, ...)
{
  return [a1 oflag];
}

id objc_msgSend_omode(void *a1, const char *a2, ...)
{
  return [a1 omode];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_overrideGID(void *a1, const char *a2, ...)
{
  return [a1 overrideGID];
}

id objc_msgSend_overrideUID(void *a1, const char *a2, ...)
{
  return [a1 overrideUID];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_pendingOperationPathsByGroupPointer(void *a1, const char *a2, ...)
{
  return [a1 pendingOperationPathsByGroupPointer];
}

id objc_msgSend_pendingOperationSize(void *a1, const char *a2, ...)
{
  return [a1 pendingOperationSize];
}

id objc_msgSend_pendingOperations(void *a1, const char *a2, ...)
{
  return [a1 pendingOperations];
}

id objc_msgSend_performCachedWrites(void *a1, const char *a2, ...)
{
  return [a1 performCachedWrites];
}

id objc_msgSend_performingExtraction(void *a1, const char *a2, ...)
{
  return [a1 performingExtraction];
}

id objc_msgSend_privileged(void *a1, const char *a2, ...)
{
  return [a1 privileged];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_recordsProcessed(void *a1, const char *a2, ...)
{
  return [a1 recordsProcessed];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_reservation(void *a1, const char *a2, ...)
{
  return [a1 reservation];
}

id objc_msgSend_reservedSize(void *a1, const char *a2, ...)
{
  return [a1 reservedSize];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_runningOperationCount(void *a1, const char *a2, ...)
{
  return [a1 runningOperationCount];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_serializeState(void *a1, const char *a2, ...)
{
  return [a1 serializeState];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_setIncompleteExtractionAttribute(void *a1, const char *a2, ...)
{
  return [a1 setIncompleteExtractionAttribute];
}

id objc_msgSend_setOwnership(void *a1, const char *a2, ...)
{
  return [a1 setOwnership];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_storeCurrentFileInMemory(void *a1, const char *a2, ...)
{
  return [a1 storeCurrentFileInMemory];
}

id objc_msgSend_streamInfoDict(void *a1, const char *a2, ...)
{
  return [a1 streamInfoDict];
}

id objc_msgSend_streamState(void *a1, const char *a2, ...)
{
  return [a1 streamState];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_thisStageBytesComplete(void *a1, const char *a2, ...)
{
  return [a1 thisStageBytesComplete];
}

id objc_msgSend_totalFileSizeWritten(void *a1, const char *a2, ...)
{
  return [a1 totalFileSizeWritten];
}

id objc_msgSend_totalRecordCount(void *a1, const char *a2, ...)
{
  return [a1 totalRecordCount];
}

id objc_msgSend_totalUncompressedBytes(void *a1, const char *a2, ...)
{
  return [a1 totalUncompressedBytes];
}

id objc_msgSend_trackingGroup(void *a1, const char *a2, ...)
{
  return [a1 trackingGroup];
}

id objc_msgSend_uid(void *a1, const char *a2, ...)
{
  return [a1 uid];
}

id objc_msgSend_uncompressedBytesOutput(void *a1, const char *a2, ...)
{
  return [a1 uncompressedBytesOutput];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_unsureData(void *a1, const char *a2, ...)
{
  return [a1 unsureData];
}

id objc_msgSend_unzipPath(void *a1, const char *a2, ...)
{
  return [a1 unzipPath];
}

id objc_msgSend_unzipServiceConnection(void *a1, const char *a2, ...)
{
  return [a1 unzipServiceConnection];
}

id objc_msgSend_xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 xpcConnection];
}