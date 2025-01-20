void sub_100002930(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_100002A0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100002A1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateTaskStatesUsingBlock:&stru_10002C768];
}

void sub_100002A2C(id a1, SWCDownloadTaskState *a2, BOOL *a3)
{
}

void sub_100002AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100002BDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100002DB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002EB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002EC4(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100002F60;
  v2[3] = &unk_10002C7B8;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _enumerateTaskStatesUsingBlock:v2];
}

void sub_100002F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100002F60(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5 = [v3 domain];

  [v3 downloadRoute];
  [v3 isDiscretionary];
  v6 = [v3 task];

  v7 = [v3 dateScheduled];

  v4 = [v3 buffer];
  [v4 length];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  sub_100003078(&a9);
  _Unwind_Resume(a1);
}

id *sub_100003078(id *a1)
{
  return a1;
}

void sub_10000357C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003924(_Unwind_Exception *a1)
{
  v9 = v7;

  _Unwind_Resume(a1);
}

void sub_10000425C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _Unwind_Exception *exception_object)
{
  _Unwind_Resume(a1);
}

void sub_10000446C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100004778(_Unwind_Exception *a1)
{
  v8 = v5;

  _Unwind_Resume(a1);
}

void sub_100004A00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004E58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100004F1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004FC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005098(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005260(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000053CC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005584(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005594(uint64_t a1)
{
}

void sub_10000559C(uint64_t a1, void *a2, unsigned char *a3)
{
  id v8 = a2;
  v6 = [v8 domain];
  int v7 = *(unsigned __int8 *)(a1 + 48);
  if (v7 == [v8 downloadRoute]
    && [*(id *)(a1 + 32) isEqual:v6])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void sub_100005648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000057F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005830(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) underlyingQueue];
  dispatch_assert_queue_V2(v2);

  if (([*(id *)(a1 + 40) isValid] & 1) == 0)
  {
    if (qword_100032868 != -1) {
      dispatch_once(&qword_100032868, &stru_10002C8E8);
    }
    id v8 = qword_100032860;
    if (os_log_type_enabled((os_log_t)qword_100032860, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Domain %@ is invalid. Will not attempt a download.", buf, 0xCu);
    }
    id v10 = objc_alloc((Class)NSError);
    v41[0] = &off_10002E608;
    v40[0] = @"Line";
    v40[1] = @"Function";
    v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCDownloader(Private) _downloadAASAFileForDomain:applicationIdentifier:downloadRoute:discretionary:completionHandlers:]_block_invoke");
    v41[1] = v11;
    v40[2] = @"Domain";
    v41[2] = *(void *)(a1 + 40);
    v12 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
    id v3 = [v10 initWithDomain:_SWCErrorDomain code:8 userInfo:v12];

    int v7 = [*(id *)(a1 + 32) delegate];
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v7 downloader:*(void *)(a1 + 32) failedToDownloadAASAFileFromDomain:*(void *)(a1 + 40) error:v3];
    }
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v13 = (SWCDownloadTaskState *)*(id *)(a1 + 48);
    id v14 = [(SWCDownloadTaskState *)v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v32;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v13);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v31 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v31 + 1) + 8 * i));
        }
        id v14 = [(SWCDownloadTaskState *)v13 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v14);
    }
    goto LABEL_51;
  }
  id v3 = [*(id *)(a1 + 32) _taskStateForDomain:*(void *)(a1 + 40) downloadRoute:*(unsigned __int8 *)(a1 + 80)];
  if (!v3)
  {
    if (*(void *)(a1 + 56) && !*(unsigned char *)(a1 + 80))
    {
      v17 = +[_SWCDomain appleDomain];
      if ([v17 encompassesDomain:*(void *)(a1 + 40)])
      {
        v18 = +[_SWCPrefs sharedPrefs];
        unsigned int v19 = [v18 isAppleInternal];

        if (v19 && !arc4random_uniform(0x64u))
        {
          if (qword_100032868 != -1) {
            dispatch_once(&qword_100032868, &stru_10002C8E8);
          }
          v20 = qword_100032860;
          if (os_log_type_enabled((os_log_t)qword_100032860, OS_LOG_TYPE_FAULT))
          {
            uint64_t v21 = *(void *)(a1 + 56);
            CFStringRef v22 = *(const __CFString **)(a1 + 40);
            *(_DWORD *)buf = 138412546;
            uint64_t v36 = v21;
            __int16 v37 = 2112;
            CFStringRef v38 = v22;
            _os_log_fault_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Application %@ is attempting to download AASA data from %@ over the public Internet (via an Apple-controlled CDN.) Doing so may leak information about unannounced apps or features. This application must be updated. Please file a bug report against this application.", buf, 0x16u);
          }
        }
      }
      else
      {
      }
    }
    int v7 = [*(id *)(a1 + 32) delegate];
    if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v7 downloader:*(void *)(a1 + 32) willDownloadAASAFileFromDomain:*(void *)(a1 + 40)];
    }
    v13 = [[SWCDownloadTaskState alloc] initWithDownloader:*(void *)(a1 + 32) domain:*(void *)(a1 + 40) downloadRoute:*(unsigned __int8 *)(a1 + 80)];
    if (!v13)
    {
      v30 = +[NSAssertionHandler currentHandler];
      [v30 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"SWCDownloader.mm" lineNumber:571 description:@"Failed to create download state object"];
    }
    if (*(void *)(a1 + 48))
    {
      v23 = [(SWCDownloadTaskState *)v13 completionHandlers];
      [v23 addObjectsFromArray:*(void *)(a1 + 48)];
    }
    if (*(unsigned char *)(a1 + 81))
    {
      if (qword_100032868 != -1) {
        dispatch_once(&qword_100032868, &stru_10002C8E8);
      }
      v24 = qword_100032860;
      if (os_log_type_enabled((os_log_t)qword_100032860, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        uint64_t v36 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Downloading discretionary data for domain %@", buf, 0xCu);
      }
      BOOL v26 = *(unsigned char *)(a1 + 81) != 0;
    }
    else
    {
      BOOL v26 = 0;
    }
    [(SWCDownloadTaskState *)v13 setDiscretionary:v26];
    v27 = *(void **)(*(void *)(a1 + 32) + 48);
    v28 = [(SWCDownloadTaskState *)v13 taskDescription];
    [v27 setObject:v13 forKey:v28];

    [*(id *)(a1 + 32) _resumePendingTasks];
    v29 = +[SWCAnalyticsLogger sharedLogger];
    [v29 logAASAFileDownloadEventWithDomain:*(void *)(a1 + 40) route:*(unsigned __int8 *)(a1 + 80)];

    id v3 = 0;
LABEL_51:

    goto LABEL_52;
  }
  if (qword_100032868 != -1) {
    dispatch_once(&qword_100032868, &stru_10002C8E8);
  }
  v4 = qword_100032860;
  if (os_log_type_enabled((os_log_t)qword_100032860, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 40);
    CFStringRef v6 = @"discretionary";
    if (!*(unsigned char *)(a1 + 81)) {
      CFStringRef v6 = @"non-discretionary";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v36 = v5;
    __int16 v37 = 2112;
    CFStringRef v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already downloading data for domain %@, so skipping a second download (%@)", buf, 0x16u);
  }
  if (*(void *)(a1 + 48))
  {
    int v7 = [v3 completionHandlers];
    [v7 addObjectsFromArray:*(void *)(a1 + 48)];
LABEL_52:
  }
}

void sub_100005E4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006268(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000631C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

void sub_100006480(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  sub_1000074DC(v31);
  _Unwind_Resume(a1);
}

uint64_t sub_100006780(uint64_t result, void *a2)
{
  uint64_t v2 = a2[6];
  a2[6] = 0;
  *(void *)(result + 48) = v2;
  *(void *)(result + 56) = a2[7];
  a2[7] = 0;
  uint64_t v5 = a2[8];
  id v3 = a2 + 8;
  uint64_t v4 = v5;
  *(void *)(result + 64) = v5;
  uint64_t v6 = v3[1];
  *(void *)(result + 72) = v6;
  *(_DWORD *)(result + 80) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    unint64_t v7 = *(void *)(v4 + 8);
    unint64_t v8 = *(void *)(result + 56);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8) {
        v7 %= v8;
      }
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(void *)(v2 + 8 * v7) = result + 64;
    void *v3 = 0;
    v3[1] = 0;
  }
  return result;
}

uint64_t sub_1000067F0(uint64_t a1)
{
  return sub_1000074DC(a1 + 48);
}

void sub_1000067F8(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = [v5 task];

  if (v3)
  {
    unsigned __int8 v6 = [*(id *)(a1 + 32) _sessionIDForTaskState:v5];
    uint64_t v4 = sub_100007528((float *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), v6, &v6);
    ++v4[3];
  }
}

void sub_100006884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_10000689C(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = [v7 task];

  if (!v3)
  {
    id v4 = [*(id *)(a1 + 32) _sessionIDForTaskState:v7];
    char v8 = (char)v4;
    id v5 = sub_100007528((float *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), v4, &v8);
    unint64_t v6 = v5[3];
    if (v6 < (unint64_t)[*(id *)(a1 + 32) _maximumActiveTaskCountForSessionID:v4])
    {
      ++v5[3];
      [*(id *)(a1 + 40) addObject:v7];
    }
  }
}

void sub_10000695C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  _Unwind_Resume(a1);
}

void sub_100006B3C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006EFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000073D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_100007498(id a1)
{
  qword_100032860 = (uint64_t)os_log_create((const char *)&_SWCLogSubsystem, "dl");
  _objc_release_x1();
}

uint64_t sub_1000074DC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (v2)
  {
    do
    {
      id v3 = (void *)*v2;
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  id v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void *sub_100007528(float *a1, unsigned __int8 a2, unsigned char *a3)
{
  unint64_t v6 = a2;
  unint64_t v7 = *((void *)a1 + 1);
  if (v7)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v3 = a2;
      if (v7 <= a2) {
        unint64_t v3 = a2 % v7;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & a2;
    }
    uint64_t v9 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v9)
    {
      id v10 = *v9;
      if (*v9)
      {
        do
        {
          unint64_t v11 = v10[1];
          if (v11 == a2)
          {
            if (*((unsigned __int8 *)v10 + 16) == a2) {
              return v10;
            }
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7) {
                v11 %= v7;
              }
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3) {
              break;
            }
          }
          id v10 = (void *)*v10;
        }
        while (v10);
      }
    }
  }
  id v10 = operator new(0x20uLL);
  void *v10 = 0;
  v10[1] = v6;
  *((unsigned char *)v10 + 16) = *a3;
  v10[3] = 0;
  float v12 = (float)(unint64_t)(*((void *)a1 + 3) + 1);
  float v13 = a1[8];
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    BOOL v14 = 1;
    if (v7 >= 3) {
      BOOL v14 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v15 = v14 | (2 * v7);
    unint64_t v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16) {
      int8x8_t prime = (int8x8_t)v16;
    }
    else {
      int8x8_t prime = (int8x8_t)v15;
    }
    if (*(void *)&prime == 1)
    {
      int8x8_t prime = (int8x8_t)2;
    }
    else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
    {
      int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      unint64_t v7 = *((void *)a1 + 1);
    }
    if (*(void *)&prime > v7) {
      goto LABEL_30;
    }
    if (*(void *)&prime < v7)
    {
      unint64_t v24 = vcvtps_u32_f32((float)*((unint64_t *)a1 + 3) / a1[8]);
      if (v7 < 3 || (uint8x8_t v25 = (uint8x8_t)vcnt_s8((int8x8_t)v7), v25.i16[0] = vaddlv_u8(v25), v25.u32[0] > 1uLL))
      {
        unint64_t v24 = std::__next_prime(v24);
      }
      else
      {
        uint64_t v26 = 1 << -(char)__clz(v24 - 1);
        if (v24 >= 2) {
          unint64_t v24 = v26;
        }
      }
      if (*(void *)&prime <= v24) {
        int8x8_t prime = (int8x8_t)v24;
      }
      if (*(void *)&prime >= v7)
      {
        unint64_t v7 = *((void *)a1 + 1);
      }
      else
      {
        if (prime)
        {
LABEL_30:
          if (*(void *)&prime >> 61) {
            sub_10000791C();
          }
          v18 = operator new(8 * *(void *)&prime);
          unsigned int v19 = *(void **)a1;
          *(void *)a1 = v18;
          if (v19) {
            operator delete(v19);
          }
          uint64_t v20 = 0;
          *((int8x8_t *)a1 + 1) = prime;
          do
            *(void *)(*(void *)a1 + 8 * v20++) = 0;
          while (*(void *)&prime != v20);
          uint64_t v21 = (void *)*((void *)a1 + 2);
          if (v21)
          {
            unint64_t v22 = v21[1];
            uint8x8_t v23 = (uint8x8_t)vcnt_s8(prime);
            v23.i16[0] = vaddlv_u8(v23);
            if (v23.u32[0] > 1uLL)
            {
              if (v22 >= *(void *)&prime) {
                v22 %= *(void *)&prime;
              }
            }
            else
            {
              v22 &= *(void *)&prime - 1;
            }
            *(void *)(*(void *)a1 + 8 * v22) = a1 + 4;
            v27 = (void *)*v21;
            if (*v21)
            {
              do
              {
                unint64_t v28 = v27[1];
                if (v23.u32[0] > 1uLL)
                {
                  if (v28 >= *(void *)&prime) {
                    v28 %= *(void *)&prime;
                  }
                }
                else
                {
                  v28 &= *(void *)&prime - 1;
                }
                if (v28 != v22)
                {
                  if (!*(void *)(*(void *)a1 + 8 * v28))
                  {
                    *(void *)(*(void *)a1 + 8 * v28) = v21;
                    goto LABEL_55;
                  }
                  *uint64_t v21 = *v27;
                  void *v27 = **(void **)(*(void *)a1 + 8 * v28);
                  **(void **)(*(void *)a1 + 8 * v28) = v27;
                  v27 = v21;
                }
                unint64_t v28 = v22;
LABEL_55:
                uint64_t v21 = v27;
                v27 = (void *)*v27;
                unint64_t v22 = v28;
              }
              while (v27);
            }
          }
          unint64_t v7 = (unint64_t)prime;
          goto LABEL_59;
        }
        long long v33 = *(void **)a1;
        *(void *)a1 = 0;
        if (v33) {
          operator delete(v33);
        }
        unint64_t v7 = 0;
        *((void *)a1 + 1) = 0;
      }
    }
LABEL_59:
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6) {
        unint64_t v3 = v6 % v7;
      }
      else {
        unint64_t v3 = v6;
      }
    }
    else
    {
      unint64_t v3 = (v7 - 1) & v6;
    }
  }
  v29 = *(void **)a1;
  v30 = *(void **)(*(void *)a1 + 8 * v3);
  if (v30)
  {
    void *v10 = *v30;
LABEL_72:
    void *v30 = v10;
    goto LABEL_73;
  }
  void *v10 = *((void *)a1 + 2);
  *((void *)a1 + 2) = v10;
  v29[v3] = a1 + 4;
  if (*v10)
  {
    unint64_t v31 = *(void *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v31 >= v7) {
        v31 %= v7;
      }
    }
    else
    {
      v31 &= v7 - 1;
    }
    v30 = (void *)(*(void *)a1 + 8 * v31);
    goto LABEL_72;
  }
LABEL_73:
  ++*((void *)a1 + 3);
  return v10;
}

void sub_100007908(_Unwind_Exception *a1)
{
  operator delete(v1);
  _Unwind_Resume(a1);
}

void sub_10000791C()
{
}

__CFString *sub_10000792C(uint64_t a1)
{
  if (a1)
  {
    if (a1 == 1)
    {
      v1 = @".wk";
    }
    else
    {
      uint64_t v2 = +[NSNumber numberWithUnsignedChar:a1];
      v1 = [v2 description];
    }
  }
  else
  {
    v1 = @"cdn";
  }
  return v1;
}

void sub_1000079A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007A40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007BB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007D2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007EE8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008470(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008568(id a1)
{
  if (dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 1))
  {
    qword_100032880 = (uint64_t)NSClassFromString(@"MCProfileConnection");
    if (qword_100032880) {
      return;
    }
    id v1 = objc_alloc((Class)NSError);
    v14[0] = &off_10002E620;
    v13[0] = @"Line";
    v13[1] = @"Function";
    uint64_t v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCEnterpriseContext(CPMCInterop) _loadEnterpriseData]_block_invoke");
    v14[1] = v2;
    v13[2] = NSDebugDescriptionErrorKey;
    v14[2] = @"MCProfileConnection not found.";
    unint64_t v3 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
    id v4 = [v1 initWithDomain:_SWCErrorDomain code:4 userInfo:v3];
    id v5 = (void *)qword_100032870;
    qword_100032870 = (uint64_t)v4;
  }
  else
  {
    unint64_t v6 = dlerror();
    if (v6) {
      unint64_t v7 = v6;
    }
    else {
      unint64_t v7 = "ManagedConfiguration.framework not loaded.";
    }
    uint64_t v2 = +[NSString stringWithUTF8String:v7];
    id v8 = objc_alloc((Class)NSError);
    v12[0] = &off_10002E638;
    v11[0] = @"Line";
    v11[1] = @"Function";
    unint64_t v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[SWCEnterpriseContext(CPMCInterop) _loadEnterpriseData]_block_invoke");
    v11[2] = NSDebugDescriptionErrorKey;
    v12[1] = v3;
    v12[2] = v2;
    id v5 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
    id v9 = [v8 initWithDomain:_SWCErrorDomain code:4 userInfo:v5];
    id v10 = (void *)qword_100032870;
    qword_100032870 = (uint64_t)v9;
  }
}

void sub_100008788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000087C8(id a1)
{
  qword_100032888 = (uint64_t)os_log_create((const char *)&_SWCLogSubsystem, "1701");
  _objc_release_x1();
}

void sub_100008838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008A10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008E48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000090E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000091A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000923C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000092EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000095D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000979C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000099A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1000099FC(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 isEqual:NSUnderlyingErrorKey])
  {
    unint64_t v6 = [v5 description];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"UnderlyingError"];
  }
  else
  {
    if (+[NSJSONSerialization isValidJSONObject:v5])
    {
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
      goto LABEL_7;
    }
    unint64_t v6 = [v5 description];
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
  }

LABEL_7:
}

void sub_100009AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100009B94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009D04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009F10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009FF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A2B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000A640(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10000B248(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = a3;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v9);
        unint64_t v11 = [SWCEntry alloc];
        float v12 = -[SWCEntry initWithApplicationIdentifier:service:domain:](v11, "initWithApplicationIdentifier:service:domain:", *(void *)(a1 + 32), v5, v10, (void)v13);
        [*(id *)(a1 + 40) addObject:v12];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

void sub_10000B38C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B43C(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

void sub_10000B5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_10000B60C(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (_NSIsNSString() && _NSIsNSDictionary())
  {
    id v6 = +[_SWCSubstitutionVariableList substitutionVariableListWithDictionary:v5];
    id v7 = [v5 objectForKeyedSubscript:@"defaults"];
    if ((_NSIsNSDictionary() & 1) == 0)
    {

      id v7 = &__NSDictionary0__struct;
    }
    uint64_t v8 = [v5 objectForKeyedSubscript:@"details"];
    if (v8 && (uint64_t v9 = _SWCServiceTypeMaximumDetailsCount()) != 0)
    {
      if (_NSIsNSArray())
      {
        [*(id *)(a1 + 48) _addEntriesToOrderedSet:*(void *)(a1 + 32) forUniversalLinksFromDetailsArray:v8 domain:*(void *)(a1 + 40) substitutionVariables:v6 defaults:v7 maximum:v9];
      }
      else if (_NSIsNSDictionary())
      {
        [*(id *)(a1 + 48) _addEntriesToOrderedSet:*(void *)(a1 + 32) forUniversalLinksFromDetailsDictionary:v8 domain:*(void *)(a1 + 40) substitutionVariables:v6 defaults:v7 maximum:v9];
      }
    }
    else
    {
      uint64_t v10 = [v5 objectForKeyedSubscript:@"apps"];
      if (v10 && _NSIsNSArray()) {
        [*(id *)(a1 + 48) _addEntriesToOrderedSet:*(void *)(a1 + 32) forService:v11 fromAppsArray:v10 domain:*(void *)(a1 + 40)];
      }
    }
  }
}

void sub_10000B79C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000B92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000C1D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, void *a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10000C670(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000CA98(_Unwind_Exception *a1)
{
  id v7 = v6;

  _Unwind_Resume(a1);
}

void sub_10000CBCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10000CBF8(uint64_t a1, void *a2, void *a3)
{
  id v17 = a2;
  id v15 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v15;
  id v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v9 = [v8 domainRequiringModeOfOperation:0];
        uint64_t v10 = [v4 objectForKeyedSubscript:v9];
        id v11 = v10;
        if (v10) {
          +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)[v10 unsignedLongLongValue] | (int)objc_msgSend(v8, "modeOfOperation"));
        }
        else {
        float v12 = +[NSNumber numberWithChar:](NSNumber, "numberWithChar:", [v8 modeOfOperation]);
        }
        [v4 setObject:v12 forKeyedSubscript:v9];
      }
      id v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v5);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000CF28;
  v19[3] = &unk_10002C9C8;
  id v13 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", objc_msgSend(obj, "count"));
  id v20 = v13;
  [v4 enumerateKeysAndObjectsUsingBlock:v19];
  id v14 = [v13 copy];
  [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:v17];
}

void sub_10000CE88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10000CF28(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = objc_msgSend(v7, "domainRequiringModeOfOperation:", (char)objc_msgSend(v5, "unsignedLongLongValue"));
  [*(id *)(a1 + 32) addObject:v6];
}

void sub_10000CFAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000D364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_10000D440(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = [a3 allObjects];
  uint64_t v6 = [v5 sortedArrayWithOptions:16 usingComparator:&stru_10002CA30];

  [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
}

void sub_10000D4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

int64_t sub_10000D4FC(id a1, _SWCDomain *a2, _SWCDomain *a3)
{
  id v4 = a2;
  id v5 = a3;
  unsigned int v6 = [(_SWCDomain *)v4 isWildcard];
  unsigned int v7 = [(_SWCDomain *)v5 isWildcard];
  if ((v6 | v7 ^ 1))
  {
    if ((v6 ^ 1 | v7) == 1)
    {
      if ((v6 ^ 1 | v7 ^ 1)) {
        goto LABEL_9;
      }
      uint64_t v8 = [(_SWCDomain *)v4 host];
      id v9 = [v8 length];

      uint64_t v10 = [(_SWCDomain *)v5 host];
      id v11 = [v10 length];

      BOOL v12 = v9 == v11;
      int64_t v13 = v9 > v11 ? -1 : 1;
      if (v12) {
LABEL_9:
      }
        int64_t v13 = 0;
    }
    else
    {
      int64_t v13 = 1;
    }
  }
  else
  {
    int64_t v13 = -1;
  }

  return v13;
}

void sub_10000D5DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000DA8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10000DD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DD6C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v16 = 0;
  id v8 = [objc_alloc((Class)NSData) initWithContentsOfURL:v6 options:1 error:&v16];
  id v9 = v16;
  if (v8)
  {
    uint64_t v10 = +[SWCSecurityGuard sharedSecurityGuard];
    id v15 = v9;
    id v11 = [v10 JSONObjectWithSignedJSONData:v8 error:&v15];
    id v12 = v15;

    if (!v11)
    {
      if (qword_1000328A0 != -1) {
        dispatch_once(&qword_1000328A0, &stru_10002CAF0);
      }
      int64_t v13 = qword_100032898;
      if (os_log_type_enabled((os_log_t)qword_100032898, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v18 = v6;
        __int16 v19 = 2112;
        id v20 = v12;
        _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Failed to decode JSON object from file %@: %@", buf, 0x16u);
      }
      id v11 = 0;
    }
  }
  else
  {
    if (qword_1000328A0 != -1) {
      dispatch_once(&qword_1000328A0, &stru_10002CAF0);
    }
    id v14 = qword_100032898;
    if (os_log_type_enabled((os_log_t)qword_100032898, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v6;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to read JSON file %@: %@", buf, 0x16u);
    }
    id v11 = 0;
    id v12 = v9;
  }

  if (v11) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10000DFCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id a29)
{
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E280(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E290(uint64_t a1)
{
}

void sub_10000E298(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  long long v21 = [*(id *)(a1 + 48) entriesForJSONObject:a3 domain:a2];
  if (v21)
  {
    if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      id v6 = objc_alloc_init((Class)NSMutableOrderedSet);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v21;
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v23;
      __int16 v12 = (a4 & 7) << 10;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v9);
          }
          id v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v15 = [v14 applicationIdentifier];
          unsigned int v16 = [v15 isEqual:*(void *)(a1 + 32)];

          if (v16)
          {
            id v17 = v14;
            id v18 = [v17 fields];
            _WORD *v18 = *v18 & 0xE3FF | v12;
            id v19 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) indexOfObject:v17];
            id v20 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
            if (v19 == (id)0x7FFFFFFFFFFFFFFFLL) {
              [v20 addObject:v17];
            }
            else {
              [v20 replaceObjectAtIndex:v19 withObject:v17];
            }
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }
  }
}

void sub_10000E47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E8B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,void *a32,void *a33,void *a34,void *a35)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000E97C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v14 = v3;
    if (_NSIsNSString())
    {
      id v4 = [objc_alloc((Class)_SWCApplicationIdentifier) initWithString:v14];
      id v5 = [SWCEntry alloc];
      id v6 = [(SWCEntry *)v5 initWithApplicationIdentifier:v4 service:_SWCServiceTypeAppLinks domain:*(void *)(a1 + 32)];
      [(SWCEntry *)v6 setPatterns:*(void *)(a1 + 40)];
      [(SWCEntry *)v6 setSubstitutionVariables:*(void *)(a1 + 48)];
      char v7 = *(unsigned char *)(a1 + 72);
      id v8 = v6;
      id v9 = [(SWCEntry *)v8 fields];
      *(_WORD *)id v9 = *(_WORD *)v9 & 0xFF3F | ((v7 & 3) << 6);
      if (*(void *)(a1 + 56) && (objc_opt_respondsToSelector() & 1) != 0)
      {
        int v10 = [*(id *)(a1 + 56) intValue];
        uint64_t v11 = [(SWCEntry *)v8 fields];
        if (v10 >= 100) {
          int v12 = 100;
        }
        else {
          int v12 = v10;
        }
        if (v12 <= -100) {
          LOBYTE(v12) = -100;
        }
        v11->relativeOrder = v12;
      }
      [*(id *)(a1 + 64) addObject:v8];
    }
  }
  return _objc_release_x1();
}

void sub_10000EAC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000EC80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000EE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000EE48(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a2;
  id v7 = a3;
  if (_NSIsNSString() && _NSIsNSDictionary())
  {
    id v8 = [v7 mutableCopy];
    [v8 setObject:v9 forKeyedSubscript:@"appID"];
    [*(id *)(a1 + 72) _addEntryToOrderedSet:*(void *)(a1 + 32) forUniversalLinksFromSingleDetailsDictionary:v8 domain:*(void *)(a1 + 40) substitutionVariables:*(void *)(a1 + 48) defaults:*(void *)(a1 + 56)];
    if (++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) >= *(void *)(a1 + 80)) {
      *a4 = 1;
    }
  }
}

void sub_10000EF28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000F0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000F12C(id a1)
{
  qword_100032898 = (uint64_t)os_log_create((const char *)&_SWCLogSubsystem, "entry");
  _objc_release_x1();
}

void sub_10000F1C4(id a1)
{
  qword_1000328B0 = objc_alloc_init(SWCAnalyticsLogger);
  _objc_release_x1();
}

id sub_10000F274(uint64_t a1)
{
  CFStringRef v4 = @"route";
  id v1 = +[NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 32)];
  id v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

uint64_t start(unsigned int a1, const void *a2)
{
  if (a1)
  {
    if ((a1 & 0x80000000) != 0) {
      abort();
    }
    CFStringRef v4 = (char *)operator new(8 * a1);
    memcpy(v4, a2, 8 * a1);
    id v5 = &v4[8 * a1];
  }
  else
  {
    CFStringRef v4 = 0;
    id v5 = 0;
  }
  v91 = (char **)v4;
  uint64_t v6 = v5 - v4;
  if ((unint64_t)(v5 - v4) <= 0xF)
  {
    sub_10000FDA4();
  }
  sub_100010A34(v100, "--leaks");
  v102 = &byte_1000328B8;
  sub_100010A34(&v103, "--vmmap");
  v105 = &byte_1000328B9;
  unint64_t v7 = (unint64_t)v100;
  sub_100010A34(v106, "--heap");
  uint64_t v90 = v6;
  v92 = v5;
  v106[3] = &byte_1000328BA;
  sub_100010A34(v107, "--verbose");
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  v107[3] = &byte_1000328BB;
  *(_OWORD *)__p = 0u;
  long long v96 = 0u;
  float v97 = 1.0;
  do
  {
    int v10 = &v100[4 * v9];
    char v11 = *((unsigned char *)v10 + 23);
    int v12 = v11;
    int64_t v13 = (void *)*v10;
    if (v11 >= 0) {
      id v14 = &v100[4 * v9];
    }
    else {
      id v14 = (uint64_t *)*v10;
    }
    unint64_t v94 = v10[1];
    if (v11 >= 0) {
      unint64_t v15 = *((unsigned __int8 *)v10 + 23);
    }
    else {
      unint64_t v15 = v10[1];
    }
    unint64_t v16 = sub_100016964(v14, v15);
    unint64_t v17 = v16;
    unint64_t v18 = (unint64_t)__p[1];
    if (__p[1])
    {
      uint8x8_t v19 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
      v19.i16[0] = vaddlv_u8(v19);
      unint64_t v20 = v19.u32[0];
      if (v19.u32[0] > 1uLL)
      {
        unint64_t v7 = v16;
        if ((void *)v16 >= __p[1]) {
          unint64_t v7 = v16 % (unint64_t)__p[1];
        }
      }
      else
      {
        unint64_t v7 = ((unint64_t)__p[1] - 1) & v16;
      }
      long long v21 = (unsigned __int8 **)*((void *)__p[0] + v7);
      if (v21)
      {
        v93 = v13;
        for (i = *v21; i; i = *(unsigned __int8 **)i)
        {
          unint64_t v23 = *((void *)i + 1);
          if (v23 == v17)
          {
            if (sub_100016D98(i + 16, (unsigned __int8 *)&v100[4 * v9])) {
              goto LABEL_55;
            }
          }
          else
          {
            if (v20 > 1)
            {
              if (v23 >= v18) {
                v23 %= v18;
              }
            }
            else
            {
              v23 &= v18 - 1;
            }
            if (v23 != v7) {
              break;
            }
          }
        }
        int64_t v13 = v93;
      }
    }
    long long v24 = operator new(0x30uLL);
    void *v24 = 0;
    v24[1] = v17;
    long long v25 = v24 + 2;
    if (v12 < 0)
    {
      sub_100014E7C(v25, v13, v94);
      uint64_t v8 = *((void *)&v96 + 1);
    }
    else
    {
      *(_OWORD *)long long v25 = *(_OWORD *)v10;
      v24[4] = v10[2];
    }
    v24[5] = (&v102)[4 * v9];
    float v26 = (float)(unint64_t)(v8 + 1);
    if (!v18 || (float)(v97 * (float)v18) < v26)
    {
      BOOL v27 = (v18 & (v18 - 1)) != 0;
      if (v18 < 3) {
        BOOL v27 = 1;
      }
      unint64_t v28 = v27 | (2 * v18);
      unint64_t v29 = vcvtps_u32_f32(v26 / v97);
      if (v28 <= v29) {
        size_t v30 = v29;
      }
      else {
        size_t v30 = v28;
      }
      sub_100016E3C((uint64_t)__p, v30);
      unint64_t v18 = (unint64_t)__p[1];
      if (((unint64_t)__p[1] & ((unint64_t)__p[1] - 1)) != 0)
      {
        if ((void *)v17 >= __p[1]) {
          unint64_t v7 = v17 % (unint64_t)__p[1];
        }
        else {
          unint64_t v7 = v17;
        }
      }
      else
      {
        unint64_t v7 = ((unint64_t)__p[1] - 1) & v17;
      }
    }
    unint64_t v31 = __p[0];
    long long v32 = (void *)*((void *)__p[0] + v7);
    if (v32)
    {
      void *v24 = *v32;
LABEL_53:
      *long long v32 = v24;
      goto LABEL_54;
    }
    void *v24 = v96;
    *(void *)&long long v96 = v24;
    v31[v7] = &v96;
    if (*v24)
    {
      unint64_t v33 = *(void *)(*v24 + 8);
      if ((v18 & (v18 - 1)) != 0)
      {
        if (v33 >= v18) {
          v33 %= v18;
        }
      }
      else
      {
        v33 &= v18 - 1;
      }
      long long v32 = (char *)__p[0] + 8 * v33;
      goto LABEL_53;
    }
LABEL_54:
    uint64_t v8 = ++*((void *)&v96 + 1);
LABEL_55:
    ++v9;
  }
  while (v9 != 4);
  uint64_t v34 = 0;
  v35 = v91;
  do
  {
    if (SHIBYTE(v107[v34 + 2]) < 0) {
      operator delete((void *)v107[v34]);
    }
    v34 -= 4;
  }
  while (v34 != -16);
  uint64_t v36 = +[_SWCPrefs sharedPrefs];
  unsigned int v37 = [v36 isAppleInternal];

  if (v37)
  {
    CFStringRef v38 = operator new(0x30uLL);
    *CFStringRef v38 = 0;
    v38[1] = 0;
    sub_100010A34(v38 + 2, "--vverbose");
    v38[5] = &byte_1000328BD;
    int v39 = *((char *)v38 + 39);
    if (v39 >= 0) {
      v40 = v38 + 2;
    }
    else {
      v40 = (uint64_t *)v38[2];
    }
    if (v39 >= 0) {
      unint64_t v41 = *((unsigned __int8 *)v38 + 39);
    }
    else {
      unint64_t v41 = v38[3];
    }
    v38[1] = sub_100016964(v40, v41);
    unint64_t v42 = sub_100016964(v40, v41);
    unint64_t v43 = v42;
    v38[1] = v42;
    unint64_t v44 = (unint64_t)__p[1];
    if (__p[1])
    {
      uint8x8_t v45 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
      v45.i16[0] = vaddlv_u8(v45);
      unint64_t v46 = v45.u32[0];
      if (v45.u32[0] > 1uLL)
      {
        unint64_t v47 = v42;
        if (__p[1] <= (void *)v42) {
          unint64_t v47 = v42 % (unint64_t)__p[1];
        }
      }
      else
      {
        unint64_t v47 = ((unint64_t)__p[1] - 1) & v42;
      }
      v48 = (unsigned __int8 **)*((void *)__p[0] + v47);
      if (v48)
      {
        for (j = *v48; j; j = *(unsigned __int8 **)j)
        {
          unint64_t v50 = *((void *)j + 1);
          if (v50 == v43)
          {
            if (sub_100016D98(j + 16, (unsigned __int8 *)v38 + 16))
            {
              sub_100017038(1, (void **)v38);
              goto LABEL_105;
            }
          }
          else
          {
            if (v46 > 1)
            {
              if (v50 >= v44) {
                v50 %= v44;
              }
            }
            else
            {
              v50 &= v44 - 1;
            }
            if (v50 != v47) {
              break;
            }
          }
        }
      }
    }
    float v51 = (float)(unint64_t)(*((void *)&v96 + 1) + 1);
    if (!v44 || (float)(v97 * (float)v44) < v51)
    {
      BOOL v52 = 1;
      if (v44 >= 3) {
        BOOL v52 = (v44 & (v44 - 1)) != 0;
      }
      unint64_t v53 = v52 | (2 * v44);
      unint64_t v54 = vcvtps_u32_f32(v51 / v97);
      if (v53 <= v54) {
        size_t v55 = v54;
      }
      else {
        size_t v55 = v53;
      }
      sub_100016E3C((uint64_t)__p, v55);
      unint64_t v44 = (unint64_t)__p[1];
      unint64_t v43 = v38[1];
    }
    uint8x8_t v56 = (uint8x8_t)vcnt_s8((int8x8_t)v44);
    v56.i16[0] = vaddlv_u8(v56);
    if (v56.u32[0] > 1uLL)
    {
      if (v43 >= v44) {
        v43 %= v44;
      }
    }
    else
    {
      v43 &= v44 - 1;
    }
    v57 = __p[0];
    v58 = (void *)*((void *)__p[0] + v43);
    if (v58)
    {
      *CFStringRef v38 = *v58;
      goto LABEL_103;
    }
    *CFStringRef v38 = v96;
    *(void *)&long long v96 = v38;
    v57[v43] = &v96;
    if (*v38)
    {
      unint64_t v59 = *(void *)(*v38 + 8);
      if (v56.u32[0] > 1uLL)
      {
        if (v59 >= v44) {
          v59 %= v44;
        }
      }
      else
      {
        v59 &= v44 - 1;
      }
      v58 = (char *)__p[0] + 8 * v59;
LABEL_103:
      void *v58 = v38;
    }
    ++*((void *)&v96 + 1);
  }
LABEL_105:
  uint64_t v60 = v90 >> 3;
LABEL_106:
  while (2)
  {
    uint64_t v61 = v60 - 1;
    if (v60 != 1)
    {
      uint64_t v62 = v60--;
      v63 = &v35[v61];
      v64 = *v63;
      if (**v63 != 45 || v64[1] != 45) {
        continue;
      }
      sub_100010A34(v100, v64);
      v65 = __p[0];
      int8x8_t v66 = (int8x8_t)__p[1];
      int v67 = (char)v101;
      v68 = (void *)v100[0];
      if ((v101 & 0x80u) == 0) {
        v69 = v100;
      }
      else {
        v69 = (uint64_t *)v100[0];
      }
      if ((v101 & 0x80u) == 0) {
        unint64_t v70 = v101;
      }
      else {
        unint64_t v70 = v100[1];
      }
      unint64_t v71 = sub_100016964(v69, v70);
      if (!*(void *)&v66) {
        goto LABEL_132;
      }
      unint64_t v72 = v71;
      uint8x8_t v73 = (uint8x8_t)vcnt_s8(v66);
      v73.i16[0] = vaddlv_u8(v73);
      unint64_t v74 = v73.u32[0];
      if (v73.u32[0] > 1uLL)
      {
        unint64_t v75 = v71;
        if (v71 >= *(void *)&v66) {
          unint64_t v75 = v71 % *(void *)&v66;
        }
      }
      else
      {
        unint64_t v75 = v71 & (*(void *)&v66 - 1);
      }
      v76 = (unsigned __int8 **)v65[v75];
      if (!v76)
      {
LABEL_132:
        v77 = 0;
        goto LABEL_134;
      }
      v77 = *v76;
      if (!*v76) {
        goto LABEL_134;
      }
      while (1)
      {
        unint64_t v78 = *((void *)v77 + 1);
        if (v78 == v72)
        {
          if (sub_100016D98(v77 + 16, (unsigned __int8 *)v100)) {
            goto LABEL_134;
          }
        }
        else
        {
          if (v74 > 1)
          {
            if (v78 >= *(void *)&v66) {
              v78 %= *(void *)&v66;
            }
          }
          else
          {
            v78 &= *(void *)&v66 - 1;
          }
          if (v78 != v75)
          {
            v77 = 0;
LABEL_134:
            v35 = v91;
            if (v67 < 0) {
              operator delete(v68);
            }
            if (!v77) {
              sub_10000FDA4();
            }
            **((unsigned char **)v77 + 5) = 1;
            v79 = &v91[v62];
            uint64_t v80 = v92 - (char *)v79;
            if (v92 != (char *)v79) {
              memmove(v63, v79, v92 - (char *)v79);
            }
            v92 = (char *)v63 + v80;
            goto LABEL_106;
          }
        }
        v77 = *(unsigned __int8 **)v77;
        if (!v77) {
          goto LABEL_134;
        }
      }
    }
    break;
  }
  if (byte_1000328BD)
  {
    char v81 = 1;
    byte_1000328BB = 1;
  }
  else
  {
    char v81 = byte_1000328BB;
  }
  byte_1000328BC = v81 + byte_1000328BD;
  sub_100017098((uint64_t)__p);
  unint64_t v82 = (unint64_t)(v92 - (char *)v35) >> 3;
  if ((int)v82 >= 2)
  {
    int v83 = 1;
    do
    {
      sub_100010A34(__p, v35[v83]);
      sub_10000FF98((uint64_t)v100, __p);
      if (!LOBYTE(v106[0])
        || (_BYTE)v105
        && (+[_SWCPrefs sharedPrefs],
            v85 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v86 = [v85 isAppleInternal],
            v85,
            (v86 & 1) == 0))
      {
        sub_10000FDA4();
      }
      optind = 1;
      int v99 = v82 - v83;
      v98 = &v35[v83];
      if (!v104)
      {
        sub_100016908();
        __break(1u);
      }
      (*(void (**)(uint64_t, int *, char ***))(*(void *)v104 + 48))(v104, &v99, &v98);
      int v87 = optind;
      sub_100016920((uint64_t)v100);
      if (SBYTE7(v96) < 0) {
        operator delete(__p[0]);
      }
      v83 += v87;
    }
    while (v83 < (int)v82);
  }
  if (byte_1000328B8) {
    sub_10000FDBC(@"leaks");
  }
  if (byte_1000328B9) {
    sub_10000FDBC(@"vmmap");
  }
  if (byte_1000328BA) {
    sub_10000FDBC(@"heap");
  }
  if (v35) {
    operator delete(v35);
  }
  return 0;
}

void sub_10000FC58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  sub_100017038(1, v26);
  sub_100017098((uint64_t)&a15);
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_10000FDA4()
{
}

void sub_10000FDBC(uint64_t a1)
{
  id v3 = [@"/usr/bin/" stringByAppendingPathComponent:a1];
  CFStringRef v4 = +[NSNumber numberWithInt:getpid()];
  id v5 = [v4 description];

  int64_t v13 = v5;
  uint64_t v6 = +[NSArray arrayWithObjects:&v13 count:1];
  sub_1000160A8(v3, v6);

  unint64_t v7 = _SWCGetServerConnection();
  id v8 = [v7 processIdentifier];
  if (v8)
  {
    uint64_t v9 = +[NSNumber numberWithInt:v8];
    int v10 = [v9 description];

    int v12 = v10;
    char v11 = +[NSArray arrayWithObjects:&v12 count:1];
    sub_1000160A8(v3, v11);
  }
  else
  {
    int v10 = v5;
  }
}

void sub_10000FF30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FF98(uint64_t a1, unsigned char *a2)
{
  *(unsigned char *)a1 = 0;
  *(unsigned char *)(a1 + 64) = 0;
  sub_100010A34(v22, "help");
  v23[0] = off_10002CB60;
  v23[1] = sub_100010AE4;
  v23[3] = v23;
  char v24 = 0;
  sub_100010A34(v25, "add-all-apps");
  v26[0] = off_10002CB60;
  v26[1] = sub_100010AE8;
  v26[3] = v26;
  char v27 = 1;
  sub_100010A34(v28, "add");
  v29[0] = off_10002CB60;
  v29[1] = sub_100010B84;
  v29[3] = v29;
  char v30 = 1;
  sub_100010A34(v31, "dl");
  v32[0] = off_10002CB60;
  v32[1] = sub_100010CCC;
  v32[3] = v32;
  char v33 = 0;
  sub_100010A34(v34, "loaddb");
  v35[0] = off_10002CB60;
  v35[1] = sub_100010F08;
  v35[3] = v35;
  char v36 = 1;
  sub_100010A34(v37, "get");
  v38[0] = off_10002CB60;
  v38[1] = sub_100011090;
  v38[3] = v38;
  char v39 = 0;
  sub_100010A34(v40, "openul");
  v41[0] = off_10002CB60;
  v41[1] = sub_1000112BC;
  void v41[3] = v41;
  char v42 = 0;
  sub_100010A34(v43, "remove");
  v44[0] = off_10002CB60;
  v44[1] = sub_10001152C;
  v44[3] = v44;
  char v45 = 1;
  sub_100010A34(v46, "set");
  v47[0] = off_10002CB60;
  v47[1] = sub_100011654;
  v47[3] = v47;
  char v48 = 1;
  sub_100010A34(v49, "show");
  v50[0] = off_10002CB60;
  v50[1] = sub_1000118F0;
  v50[3] = v50;
  char v51 = 0;
  sub_100010A34(v52, "verify");
  v53[0] = off_10002CB60;
  v53[1] = sub_1000119D8;
  v53[3] = v53;
  char v54 = 0;
  sub_100010A34(v55, "reset");
  v56[0] = off_10002CB60;
  v56[1] = sub_10001209C;
  v56[3] = v56;
  char v57 = 0;
  sub_100010A34(v58, "watch");
  v59[0] = off_10002CB60;
  v59[1] = sub_100012138;
  v59[3] = v59;
  char v60 = 0;
  sub_100010A34(v61, "read-settings");
  v62[0] = off_10002CB60;
  v62[1] = sub_100012350;
  v62[3] = v62;
  char v63 = 1;
  sub_100010A34(v64, "write-settings");
  v65[0] = off_10002CB60;
  v65[1] = sub_100012924;
  v65[3] = v65;
  char v66 = 1;
  sub_100010A34(v67, "match");
  v68[0] = off_10002CB60;
  v68[1] = sub_100012E50;
  v68[3] = v68;
  char v69 = 0;
  sub_100010A34(v70, "developer-mode");
  v71[0] = off_10002CB60;
  v71[1] = sub_10001329C;
  v71[3] = v71;
  char v72 = 1;
  sub_100010A34(v73, "get-tdi-epoch");
  v74[0] = off_10002CB60;
  v74[1] = sub_100013400;
  v74[3] = v74;
  char v75 = 1;
  CFStringRef v4 = (char *)operator new(0x480uLL);
  uint8x8_t v19 = v4;
  unint64_t v20 = v4;
  long long v21 = v4 + 1152;
  uint64_t v5 = 0x1FFFFFFFFFFFFF70;
  do
  {
    uint64_t v6 = &v4[v5 * 8 + 1152];
    unint64_t v7 = (void **)&v76[v5];
    if (SHIBYTE(v76[v5 + 2]) < 0)
    {
      sub_100014E7C(v6, *v7, v76[v5 + 1]);
    }
    else
    {
      *(_OWORD *)uint64_t v6 = *(_OWORD *)v7;
      *(void *)&v4[v5 * 8 + 1168] = v76[v5 + 2];
    }
    sub_1000167DC((uint64_t)&v4[v5 * 8 + 1176], (uint64_t)&v76[v5 + 3]);
    v4[v5 * 8 + 1208] = v76[v5 + 7];
    v5 += 8;
  }
  while (v5 * 8);
  unint64_t v20 = v4 + 1152;
  uint64_t v8 = 144;
  do
  {
    sub_100016758(&v22[v8 - 5]);
    if (*((char *)&v22[v8 - 5] - 1) < 0) {
      operator delete(v22[v8 - 8]);
    }
    v8 -= 8;
  }
  while (v8 * 8);
  uint64_t v9 = (const std::string *)v19;
  if (v19 == v20)
  {
LABEL_29:
    if (v9 != (const std::string *)v20)
    {
      if (*(unsigned char *)(a1 + 64))
      {
        std::string::operator=((std::string *)a1, v9);
        sub_1000167DC((uint64_t)v22, (uint64_t)&v9[1]);
        uint64_t v15 = a1 + 24;
        if (v22 != (void ***)(a1 + 24))
        {
          uint64_t v16 = v23[0];
          uint64_t v17 = *(void *)(a1 + 48);
          if ((void ***)v23[0] == v22)
          {
            if (v17 == v15)
            {
              (*((void (**)(void ***, void *))v22[0] + 3))(v22, v76);
              (*(void (**)(void))(*(void *)v23[0] + 32))(v23[0]);
              v23[0] = 0;
              (*(void (**)(void, void ***))(**(void **)(a1 + 48) + 24))(*(void *)(a1 + 48), v22);
              (*(void (**)(void))(**(void **)(a1 + 48) + 32))(*(void *)(a1 + 48));
              *(void *)(a1 + 48) = 0;
              v23[0] = v22;
              (*(void (**)(void *, uint64_t))(v76[0] + 24))(v76, a1 + 24);
              (*(void (**)(void *))(v76[0] + 32))(v76);
            }
            else
            {
              (*((void (**)(void ***, uint64_t))v22[0] + 3))(v22, a1 + 24);
              (*(void (**)(void))(*(void *)v23[0] + 32))(v23[0]);
              v23[0] = *(void *)(a1 + 48);
            }
            *(void *)(a1 + 48) = v15;
          }
          else if (v17 == v15)
          {
            (*(void (**)(uint64_t, void ***))(*(void *)(a1 + 24) + 24))(a1 + 24, v22);
            (*(void (**)(void))(**(void **)(a1 + 48) + 32))(*(void *)(a1 + 48));
            *(void *)(a1 + 48) = v23[0];
            v23[0] = v22;
          }
          else
          {
            v23[0] = *(void *)(a1 + 48);
            *(void *)(a1 + 48) = v16;
          }
        }
        sub_100016758(v22);
        *(unsigned char *)(a1 + 56) = v9[2].__r_.__value_.__s.__data_[8];
      }
      else
      {
        if (SHIBYTE(v9->__r_.__value_.__r.__words[2]) < 0)
        {
          sub_100014E7C((unsigned char *)a1, v9->__r_.__value_.__l.__data_, v9->__r_.__value_.__l.__size_);
        }
        else
        {
          long long v18 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
          *(void *)(a1 + 16) = *((void *)&v9->__r_.__value_.__l + 2);
          *(_OWORD *)a1 = v18;
        }
        sub_1000167DC(a1 + 24, (uint64_t)&v9[1]);
        *(unsigned char *)(a1 + 56) = v9[2].__r_.__value_.__s.__data_[8];
        *(unsigned char *)(a1 + 64) = 1;
      }
    }
  }
  else
  {
    char v10 = a2[23];
    if (v10 >= 0) {
      uint64_t v11 = a2[23];
    }
    else {
      uint64_t v11 = *((void *)a2 + 1);
    }
    if (v10 < 0) {
      a2 = *(unsigned char **)a2;
    }
    do
    {
      uint64_t v12 = HIBYTE(v9->__r_.__value_.__r.__words[2]);
      if ((v12 & 0x80u) == 0) {
        std::string::size_type size = HIBYTE(v9->__r_.__value_.__r.__words[2]);
      }
      else {
        std::string::size_type size = v9->__r_.__value_.__l.__size_;
      }
      if (size == v11)
      {
        if ((v12 & 0x80) != 0)
        {
          if (!memcmp(v9->__r_.__value_.__l.__data_, a2, v9->__r_.__value_.__l.__size_)) {
            goto LABEL_29;
          }
        }
        else
        {
          if (!*((unsigned char *)&v9->__r_.__value_.__s + 23)) {
            goto LABEL_29;
          }
          uint64_t v14 = 0;
          while (v9->__r_.__value_.__s.__data_[v14] == a2[v14])
          {
            if (v12 == ++v14) {
              goto LABEL_29;
            }
          }
        }
      }
      uint64_t v9 = (const std::string *)((char *)v9 + 64);
    }
    while (v9 != (const std::string *)v20);
  }
  v22[0] = (void **)&v19;
  sub_100016874(v22);
}

void sub_100010988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  if (*(char *)(v10 + 23) < 0) {
    operator delete(*(void **)v10);
  }
  *(void *)(v11 - 96) = &a10;
  sub_100016874((void ***)(v11 - 96));
  sub_100016920(v10);
  _Unwind_Resume(a1);
}

void *sub_100010A34(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_100010AE8(int a1, char *const *a2)
{
  id v2 = sub_10001539C(a1, a2, "");
  _SWCGetServerConnection();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&stru_10002CC20];
  [v3 addAllAppsWithCompletionHandler:&stru_10002CC60];
}

void sub_100010B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100010B84(int a1, char *const *a2)
{
  id v2 = sub_10001539C(a1, a2, "a:d:s:");
  id v3 = sub_1000155DC(v2);
  id v4 = [v3 applicationIdentifier];

  if (!v4) {
    sub_10000FDA4();
  }
  size_t v5 = _SWCGetServerConnection();
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&stru_10002CCA8];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100015734;
  v8[3] = &unk_10002CCD0;
  id v7 = v3;
  id v9 = v7;
  [v6 addServiceWithServiceSpecifier:v7 completionHandler:v8];
}

void sub_100010C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100010CCC(int a1, char *const *a2)
{
  id v2 = sub_10001539C(a1, a2, "d:t:");
  id v3 = [v2 objectForKeyedSubscript:@"d"];
  if (!v3) {
    sub_10000FDA4();
  }
  id v4 = [objc_alloc((Class)_SWCDomain) initWithString:v3];
  if (!v4) {
    sub_10000FDA4();
  }
  size_t v5 = [v2 objectForKeyedSubscript:@"t"];
  uint64_t v6 = v5;
  if (v5 && (uint64_t v7 = (uint64_t)[v5 integerValue], v7 >= 1)) {
    dispatch_time_t v8 = dispatch_time(0, 1000000000 * v7);
  }
  else {
    dispatch_time_t v8 = -1;
  }

  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  uint64_t v10 = objc_alloc_init(SWCDownloader);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100015838;
  void v14[3] = &unk_10002CCF8;
  uint64_t v11 = v9;
  uint64_t v15 = v11;
  [(SWCDownloader *)v10 downloadAASAFileForDomain:v4 applicationIdentifier:0 completionHandler:v14];
  if (dispatch_semaphore_wait(v11, v8))
  {
    uint64_t v12 = __stderrp;
    id v13 = [v4 description];
    fprintf(v12, "Timed out waiting for %s\n", (const char *)[v13 UTF8String]);

    exit(1);
  }
}

void sub_100010EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100010F08(int a1, char *const *a2)
{
  id v2 = sub_10001539C(a1, a2, "f:");
  id v3 = [v2 objectForKeyedSubscript:@"f"];
  if (!v3) {
    sub_10000FDA4();
  }
  id v4 = +[NSURL fileURLWithPath:v3 isDirectory:0];
  id v11 = 0;
  size_t v5 = +[SWCDatabase loadContentsOfURL:v4 error:&v11];
  id v6 = v11;

  if (!v5)
  {
    dispatch_semaphore_t v9 = __stderrp;
    uint64_t v10 = (const char *)sub_100015084(v6);
    fprintf(v9, "Error loading database: %s\n", v10);
    exit(1);
  }
  uint64_t v7 = __stdoutp;
  id v8 = [v5 description];
  fprintf(v7, "%s\n", (const char *)[v8 UTF8String]);
}

void sub_100011044(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011090(int a1, char *const *a2)
{
  id v13 = sub_10001539C(a1, a2, "a:d:s:");
  id v2 = sub_1000155DC(v13);
  id v18 = 0;
  id v3 = +[_SWCServiceDetails serviceDetailsWithServiceSpecifier:v2 error:&v18];
  id v12 = v18;
  if (!v3)
  {
    uint64_t v10 = __stderrp;
    id v11 = (const char *)sub_100015084(v12);
    fprintf(v10, "Error getting info: %s\n", v11);
    exit(1);
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = __stdoutp;
        id v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) description];
        fprintf(v8, "%s\n", (const char *)[v9 UTF8String]);
      }
      id v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v5);
  }
}

void sub_100011260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1000112BC(int a1, char *const *a2)
{
  id v2 = sub_10001539C(a1, a2, "u:r:");
  id v3 = [v2 objectForKeyedSubscript:@"u"];
  if (v3)
  {
    id v4 = [objc_alloc((Class)NSURL) initWithString:v3];
    id v5 = [v4 scheme];
    uint64_t v6 = v5;
    if (v5
      && [v5 caseInsensitiveCompare:@"http"]
      && [v6 caseInsensitiveCompare:@"https"])
    {
      fprintf(__stderrp, "Invalid URL scheme \"%s\".\n", (const char *)[v6 UTF8String]);

      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  uint64_t v7 = [v2 objectForKeyedSubscript:@"r"];
  if (v7) {
    id v8 = [objc_alloc((Class)NSURL) initWithString:v7];
  }
  else {
    id v8 = 0;
  }

  if (!v4) {
    sub_10000FDA4();
  }
  id v9 = objc_alloc_init((Class)_LSOpenConfiguration);
  [v9 setReferrerURL:v8];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100015934;
  void v11[3] = &unk_10002CCD0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  uint64_t v10 = v12;
  +[LSAppLink openWithURL:v4 configuration:v9 completionHandler:v11];
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
}

void sub_1000114AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001152C(int a1, char *const *a2)
{
  id v2 = sub_10001539C(a1, a2, "a:d:s:");
  id v3 = sub_1000155DC(v2);
  id v4 = _SWCGetServerConnection();
  id v5 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&stru_10002CD18];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100015A54;
  v7[3] = &unk_10002CCD0;
  id v6 = v3;
  id v8 = v6;
  [v5 removeServiceWithServiceSpecifier:v6 completionHandler:v7];
}

void sub_100011618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100011654(int a1, char *const *a2)
{
  id v2 = sub_10001539C(a1, a2, "a:d:s:j:u:");
  id v3 = sub_1000155DC(v2);
  if (([v3 isFullySpecified] & 1) == 0) {
    sub_10000FDA4();
  }
  uint64_t v4 = [v2 objectForKeyedSubscript:@"j"];
  uint64_t v5 = [v2 objectForKeyedSubscript:@"u"];
  id v6 = (void *)v5;
  if (!(v4 | v5))
  {
    fwrite("No changes specified\n", 0x15uLL, 1uLL, __stderrp);
    exit(1);
  }
  if (!v5) {
    goto LABEL_12;
  }
  if (![(id)v5 caseInsensitiveCompare:@"approved"])
  {
    unsigned __int8 v9 = 1;
    goto LABEL_15;
  }
  if (![v6 caseInsensitiveCompare:@"denied"])
  {
    unsigned __int8 v9 = 2;
    goto LABEL_15;
  }
  if (![v6 caseInsensitiveCompare:@"unspecified"])
  {
LABEL_12:
    unsigned __int8 v9 = 0;
    goto LABEL_15;
  }
  id v7 = [objc_alloc((Class)NSScanner) initWithString:v6];
  unsigned int v15 = -1;
  unsigned __int8 v8 = [v7 scanInt:&v15];
  unsigned __int8 v9 = v15;
  if (v15 < 3) {
    unsigned __int8 v10 = v8;
  }
  else {
    unsigned __int8 v10 = 0;
  }
  if ((v10 & 1) == 0)
  {

    fwrite("Invalid user approval state.\n", 0x1DuLL, 1uLL, __stderrp);
    exit(1);
  }

LABEL_15:
  id v11 = _SWCGetServerConnection();
  dispatch_semaphore_t v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:&stru_10002CD38];
  if (v4)
  {
    id v13 = (objc_class *)objc_opt_class();
    long long v14 = sub_100015BB4((void *)v4, v13);
    [v12 setDetails:v14 forServiceWithServiceSpecifier:v3 completionHandler:&stru_10002CD58];
  }
  if (v6) {
    [v12 setUserApprovalState:v9 forServiceWithServiceSpecifier:v3 completionHandler:&stru_10002CD78];
  }
}

void sub_10001187C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000118F0(int a1, char *const *a2)
{
  id v2 = sub_10001539C(a1, a2, "");
  _SWCGetServerConnection();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&stru_10002CD98];
  xpc_object_t v4 = xpc_fd_create(1);
  [v3 showWithVerbosity:byte_1000328BC isTTY:_SWCFileIsTTY() fileDescriptor:v4 completionHandler:&stru_10002CDB8];
}

void sub_1000119AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000119D8(int a1, char *const *a2)
{
  unint64_t v41 = sub_10001539C(a1, a2, "d:j:u:");
  uint64_t v2 = [v41 objectForKeyedSubscript:@"d"];
  id v3 = (void *)v2;
  xpc_object_t v4 = @"www.example.com";
  if (v2) {
    xpc_object_t v4 = (__CFString *)v2;
  }
  id v5 = v4;

  v35 = v5;
  id v40 = [objc_alloc((Class)_SWCDomain) initWithString:v5];
  unsigned int v37 = [v41 objectForKeyedSubscript:@"j"];
  if (!v37) {
    sub_10000FDA4();
  }
  id v6 = [v41 objectForKeyedSubscript:@"u"];
  if (v6)
  {
    id v7 = [objc_alloc((Class)NSURLComponents) initWithString:v6];
    if (!v7) {
      sub_10000FDA4();
    }
    unint64_t v43 = v7;
    unsigned __int8 v8 = [v7 host];
    if (v8) {
      id v39 = [objc_alloc((Class)_SWCDomain) initWithString:v8];
    }
    else {
      id v39 = 0;
    }
  }
  else
  {
    id v39 = 0;
    unint64_t v43 = 0;
  }

  uint64_t v9 = sub_100015BB4(v37, 0);
  char v36 = (void *)v9;
  id v11 = +[SWCEntry entriesForJSONObject:v9 domain:v40];
  CFStringRef v38 = v11;
  if (!v11) {
    goto LABEL_42;
  }
  if (v39 && ([v40 encompassesDomain:v39] & 1) == 0)
  {
    long long v25 = __stderrp;
    id v26 = [v40 rawValue];
    char v27 = (const char *)[v26 UTF8String];
    id v28 = [v39 rawValue];
    fprintf(v25, "Input domain \"%s\" did not match input URL's domain \"%s\".\n", v27, (const char *)[v28 UTF8String]);

    goto LABEL_42;
  }
  if (!v43)
  {
    _SWCLogHeader();
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v29 = v11;
    id v30 = [v29 countByEnumeratingWithState:&v44 objects:v53 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v45;
      char v32 = 1;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v45 != v31) {
            objc_enumerationMutation(v29);
          }
          uint64_t v34 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if ((v32 & 1) == 0) {
            _SWCLogSeparator();
          }
          [v34 logToFile:__stdoutp verbosity:byte_1000328BC];
          char v32 = 0;
        }
        id v30 = [v29 countByEnumeratingWithState:&v44 objects:v53 count:16];
        char v32 = 0;
      }
      while (v30);
    }

    goto LABEL_42;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v11;
  id v12 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (!v12)
  {

    goto LABEL_41;
  }
  char v13 = 0;
  uint64_t v14 = *(void *)v50;
  do
  {
    for (j = 0; j != v12; j = (char *)j + 1)
    {
      if (*(void *)v50 != v14) {
        objc_enumerationMutation(obj);
      }
      long long v16 = *(void **)(*((void *)&v49 + 1) + 8 * (void)j);
      id v48 = 0;
      id v17 = [v16 evaluateWithURLComponents:v43 auditToken:0 matchingPattern:&v48];
      id v18 = v48;
      if (v17 == (id)100)
      {
        char v24 = __stdoutp;
        unint64_t v20 = [v16 serviceSpecifier];
        id v21 = [v20 description];
        [v21 UTF8String];
        long long v22 = [v43 URL];
        id v23 = [v22 absoluteString];
        [v23 UTF8String];
        fprintf(v24, "%s: Pattern \"%s\" blocked match.\n");
      }
      else
      {
        if (v17 != (id)200) {
          goto LABEL_25;
        }
        uint8x8_t v19 = __stdoutp;
        unint64_t v20 = [v16 serviceSpecifier];
        id v21 = [v20 description];
        [v21 UTF8String];
        long long v22 = [v43 URL];
        id v23 = [v22 absoluteString];
        [v23 UTF8String];
        fprintf(v19, "%s: Pattern \"%s\" matched.\n");
      }

      char v13 = 1;
LABEL_25:
    }
    id v12 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  }
  while (v12);

  if (v13) {
    goto LABEL_42;
  }
LABEL_41:
  fputs("Input JSON did not match input URL.\n", __stderrp);
LABEL_42:
}

void sub_100011F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16, void *a17, void *a18, uint64_t a19, void *a20)
{
  _Unwind_Resume(a1);
}

void sub_10001209C(int a1, char *const *a2)
{
  id v2 = sub_10001539C(a1, a2, "");
  _SWCGetServerConnection();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v4 synchronousRemoteObjectProxyWithErrorHandler:&stru_10002CDD8];
  [v3 resetWithCompletionHandler:&stru_10002CDF8];
}

void sub_100012118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100012138(int a1, char *const *a2)
{
  id v2 = sub_10001539C(a1, a2, "");
  id v3 = [&off_10002E7A0 mutableCopy];
  if (byte_1000328BD)
  {
    [@"subsystem == \"com.apple.swc\"" stringByAppendingString:@" || process == \"swcd\""];
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"subsystem == \"com.apple.swc\"";
  }
  [v3 addObject:v4];
  if (byte_1000328BB)
  {
    [v3 addObject:@"--level"];
    [v3 addObject:@"debug"];
  }
  id v5 = (const char *)[@"/usr/bin/log" UTF8String];
  fputs(v5, __stdoutp);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        fputc(32, __stdoutp);
        id v11 = v10;
        id v12 = (const char *)objc_msgSend(v11, "UTF8String", (void)v13);
        fputs(v12, __stdoutp);
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  fputc(10, __stdoutp);
  sub_1000160A8(@"/usr/bin/log", v6);
}

void sub_100012320(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012350(int a1, char *const *a2)
{
  id v2 = sub_10001539C(a1, a2, "s:a:d:k:jp");
  id v3 = [v2 objectForKeyedSubscript:@"s"];
  if (!v3
    || ([v2 objectForKeyedSubscript:@"k"],
        id v4 = objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    ((void (*)(void))sub_10000FDA4)();
  }
  id v5 = [v2 objectForKeyedSubscript:@"j"];
  unsigned int v6 = [v5 BOOLValue];

  id v7 = [v2 objectForKeyedSubscript:@"p"];
  unsigned int v8 = [v7 BOOLValue];

  uint64_t v9 = sub_1000155DC(v2);
  id v44 = 0;
  unsigned __int8 v10 = +[_SWCServiceSettings serviceSettingsWithServiceSpecifier:v9 error:&v44];
  id v11 = v44;
  id v12 = v11;
  if (!v10)
  {
    v35 = __stderrp;
    char v36 = (const char *)sub_100015084(v11);
    fprintf(v35, "%s\n", v36);
    exit(1);
  }
  long long v13 = [v2 objectForKeyedSubscript:@"k"];
  uint64_t v14 = [v10 objectForKey:v13 ofClass:objc_opt_class()];
  long long v15 = (__CFString *)v14;
  if (!v14)
  {
    fprintf(__stderrp, "Value for %s not found.\n", (const char *)[v13 UTF8String]);
    exit(1);
  }
  if ((v6 & v8) == 1)
  {
    size_t v37 = fwrite("Cannot specify both -j and -p.\n", 0x1FuLL, 1uLL, __stderrp);
    sub_10000FDA4(v37);
  }
  if (!v6)
  {
    if (v8)
    {
      long long v45 = v13;
      uint64_t v46 = v14;
      long long v22 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
      id v42 = 0;
      id v23 = +[NSPropertyListSerialization dataWithPropertyList:v22 format:100 options:0 error:&v42];
      id v18 = v42;

      if (!v23)
      {
        id v40 = __stderrp;
        unint64_t v41 = (const char *)sub_100015084(v18);
        fprintf(v40, "%s\n", v41);
        exit(1);
      }
      id v19 = v23;
      id v24 = [v19 bytes];
      id v25 = [v19 length];
      fwrite(v24, (size_t)v25, 1uLL, __stdoutp);
      goto LABEL_12;
    }
    if (byte_1000328BB)
    {
      id v26 = objc_alloc((Class)NSString);
      uint64_t v27 = objc_opt_class();
      id v28 = [(__CFString *)v15 debugDescription];
      id v29 = (__CFString *)[v26 initWithFormat:@"<%@> %@", v27, v28];

      long long v15 = v29;
    }
    else
    {
      CFTypeID TypeID = CFBooleanGetTypeID();
      if (TypeID != CFGetTypeID(v15))
      {
LABEL_20:
        char v33 = __stdoutp;
        uint64_t v34 = (const char *)[v13 UTF8String];
        id v19 = [(__CFString *)v15 description];
        fprintf(v33, "%s = %s\n", v34, (const char *)[v19 UTF8String]);
        id v18 = v12;
        goto LABEL_21;
      }
      unsigned int v31 = [(__CFString *)v15 BOOLValue];
      char v32 = @"false";
      if (v31) {
        char v32 = @"true";
      }
      id v28 = v15;
      long long v15 = v32;
    }

    goto LABEL_20;
  }
  long long v47 = v13;
  uint64_t v48 = v14;
  long long v16 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  id v43 = v12;
  id v17 = +[NSJSONSerialization dataWithJSONObject:v16 options:5 error:&v43];
  id v18 = v43;

  if (!v17)
  {
    CFStringRef v38 = __stderrp;
    id v39 = (const char *)sub_100015084(v18);
    fprintf(v38, "%s\n", v39);
    exit(1);
  }
  id v19 = v17;
  id v20 = [v19 bytes];
  id v21 = [v19 length];
  fwrite(v20, (size_t)v21, 1uLL, __stdoutp);
LABEL_12:
  fputc(10, __stdoutp);
LABEL_21:
}

void sub_100012854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012924(int a1, char *const *a2)
{
  id v2 = sub_10001539C(a1, a2, "s:a:d:k:v:jp");
  uint64_t v3 = [v2 objectForKeyedSubscript:@"s"];
  id v4 = (void *)v3;
  if (!v3) {
LABEL_21:
  }
    sub_10000FDA4(v3);
  id v5 = [v2 objectForKeyedSubscript:@"k"];
  if (!v5)
  {

    goto LABEL_21;
  }
  unsigned int v6 = [v2 objectForKeyedSubscript:@"v"];

  if (!v6) {
    goto LABEL_21;
  }
  id v7 = [v2 objectForKeyedSubscript:@"j"];
  unsigned int v8 = [v7 BOOLValue];

  uint64_t v9 = [v2 objectForKeyedSubscript:@"p"];
  unsigned int v10 = [v9 BOOLValue];

  id v11 = sub_1000155DC(v2);
  id v36 = 0;
  id v12 = +[_SWCServiceSettings serviceSettingsWithServiceSpecifier:v11 error:&v36];
  id v13 = v36;
  uint64_t v14 = v13;
  if (!v12)
  {
    id v26 = __stderrp;
    uint64_t v27 = (const char *)sub_100015084(v13);
    fprintf(v26, "%s\n", v27);
    exit(1);
  }
  long long v15 = [v2 objectForKeyedSubscript:@"k"];
  long long v16 = [v2 objectForKeyedSubscript:@"v"];
  id v17 = v16;
  if ((v8 & v10) == 1)
  {
    size_t v28 = fwrite("Cannot specify both -j and -p.\n", 0x1FuLL, 1uLL, __stderrp);
    sub_10000FDA4(v28);
  }
  if (v8)
  {
    id v18 = [v16 dataUsingEncoding:4];
    if (!v18)
    {
      fprintf(__stderrp, "Could not create UTF-8 data representation of value \"%s\".\n", (const char *)[v17 UTF8String]);
      exit(1);
    }
    id v35 = v14;
    uint64_t v19 = +[NSJSONSerialization JSONObjectWithData:v18 options:4 error:&v35];
    id v20 = v35;

    if (!v19)
    {
      id v21 = __stderrp;
      long long v22 = (const char *)sub_100015084(v20);
      fprintf(v21, "%s\n", v22);
      exit(1);
    }
  }
  else
  {
    if (!v10) {
      goto LABEL_14;
    }
    id v18 = [v16 dataUsingEncoding:4];
    if (!v18)
    {
      fprintf(__stderrp, "Could not create UTF-8 data representation of value \"%s\".\n", (const char *)[v17 UTF8String]);
      exit(1);
    }
    id v34 = 0;
    uint64_t v19 = +[NSPropertyListSerialization propertyListWithData:v18 options:0 format:0 error:&v34];
    id v20 = v34;

    if (!v19)
    {
      unsigned int v31 = __stderrp;
      char v32 = (const char *)sub_100015084(v20);
      fprintf(v31, "%s\n", v32);
      exit(1);
    }
  }

  uint64_t v14 = v20;
  id v17 = (void *)v19;
LABEL_14:
  id v23 = +[NSNull null];

  if (v17 == v23)
  {

    id v17 = 0;
  }
  else if (!+[NSPropertyListSerialization propertyList:v17 isValidForFormat:200])
  {
    fprintf(__stderrp, "Value \"%s\" could not be stored in a property list.\n", (const char *)[v17 UTF8String]);
    exit(1);
  }
  [v12 setObject:v17 forKey:v15];
  id v33 = v14;
  unsigned __int8 v24 = [v12 commitReturningError:&v33];
  id v25 = v33;

  if ((v24 & 1) == 0)
  {
    id v29 = __stderrp;
    id v30 = (const char *)sub_100015084(v25);
    fprintf(v29, "%s\n", v30);
    exit(1);
  }
}

void sub_100012DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012E50(int a1, char *const *a2)
{
  id v2 = sub_10001539C(a1, a2, "u:j:");
  id v4 = [v2 objectForKeyedSubscript:@"u"];
  if (v4) {
    id v5 = [objc_alloc((Class)NSURLComponents) initWithString:v4];
  }
  else {
    id v5 = 0;
  }

  id v7 = [v2 objectForKeyedSubscript:@"j"];
  unsigned int v8 = v7;
  if (v7)
  {
    uint64_t v9 = sub_100015BB4(v7, 0);

    if (_NSIsNSDictionary())
    {
      size_t v28 = v9;
      uint64_t v10 = +[NSArray arrayWithObjects:&v28 count:1];
LABEL_10:

      uint64_t v9 = (void *)v10;
      goto LABEL_12;
    }
    if (_NSIsNSString())
    {
      CFStringRef v25 = @"/";
      id v26 = v9;
      uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      uint64_t v27 = v11;
      uint64_t v10 = +[NSArray arrayWithObjects:&v27 count:1];

      uint64_t v9 = (void *)v11;
      goto LABEL_10;
    }
    if ((_NSIsNSArray() & 1) == 0)
    {
      long long v22 = __stderrp;
      id v23 = (objc_class *)objc_opt_class();
      Name = class_getName(v23);
      fprintf(v22, "Unexpected JSON object type %s.\n", Name);
      exit(1);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
LABEL_12:
  if (!v5 || !v9) {
    sub_10000FDA4(v12);
  }
  id v13 = [objc_alloc((Class)_SWCPatternMatchingEngine) initWithPatternDictionaries:v9];
  uint64_t v14 = [v13 evaluateURLComponents:v5];
  if (v14)
  {
    long long v16 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v14, "index"));
    id v17 = +[NSJSONSerialization dataWithJSONObject:v16 options:15 error:0];

    if (v17)
    {
      id v18 = [objc_alloc((Class)NSString) initWithData:v17 encoding:4];
    }
    else
    {
      uint64_t v19 = objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v14, "index"));
      id v18 = [v19 description];
    }
    unsigned int v20 = [v14 isExcluded];
    id v21 = __stdoutp;
    if (v20)
    {
      [v14 index];
      [v18 UTF8String];
      fprintf(v21, "Excluded by pattern at index %lu: %s\n");
    }
    else
    {
      [v14 index];
      [v18 UTF8String];
      fprintf(v21, "Matched by pattern at index %lu: %s\n");
    }
  }
  else
  {
    fwrite("Did not match.\n", 0xFuLL, 1uLL, __stdoutp);
  }
}

void sub_1000131DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001329C(int a1, char *const *a2)
{
  id v2 = sub_10001539C(a1, a2, "e:");
  id v4 = [v2 objectForKeyedSubscript:@"e"];
  id v5 = v4;
  if (v4) {
    id v6 = [v4 BOOLValue];
  }
  else {
    id v6 = 0;
  }

  id v7 = _SWCGetServerConnection();
  unsigned int v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&stru_10002CE18];
  uint64_t v9 = v8;
  if (v5)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100016620;
    v10[3] = &unk_10002CE78;
    char v11 = (char)v6;
    [v8 setDeveloperModeEnabled:v6 completionHandler:v10];
  }
  else
  {
    [v8 getDeveloperModeEnabledWithCompletionHandler:&stru_10002CE58];
  }
}

void sub_1000133C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013400(int a1, char *const *a2)
{
  id v14 = +[_SWCTrackingDomainInfo lastDatabaseUpdate];
  id v4 = sub_10001539C(a1, a2, "pz:");
  id v5 = [v4 objectForKeyedSubscript:@"p"];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = __stdoutp;
    [v14 timeIntervalSince1970];
    fprintf(v7, "%lli\n", (uint64_t)v8);
  }
  else
  {
    uint64_t v9 = [v4 objectForKeyedSubscript:@"z"];
    if (v9)
    {
      uint64_t v10 = +[NSTimeZone timeZoneWithAbbreviation:v9];
      if (!v10)
      {
        uint64_t v10 = +[NSTimeZone timeZoneWithName:v9];
        if (!v10) {
          sub_10000FDA4(0);
        }
      }
    }
    else
    {
      uint64_t v10 = +[NSTimeZone systemTimeZone];
    }

    id v11 = objc_alloc_init((Class)NSISO8601DateFormatter);
    [v11 setTimeZone:v10];
    uint64_t v12 = __stdoutp;
    id v13 = [v11 stringFromDate:v14];
    fprintf(v12, "%s\n", (const char *)[v13 UTF8String]);
  }
}

void sub_1000135A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000135F8(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_100013634()
{
  getprogname();
  sub_1000148E0();
  fputc(32, __stderrp);
  sub_1000148E0();
  v0 = +[_SWCPrefs sharedPrefs];
  [v0 isAppleInternal];

  sub_1000148E0();
  sub_1000148E0();
  sub_1000148E0();
  sub_1000148E0();
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  sub_10001495C("--leaks", (uint64_t)"Run leaks before termination.", (uint64_t *)&v17);
  *(void *)&long long v25 = &v17;
  sub_100014D7C((void ***)&v25);
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  sub_10001495C("--vmmap", (uint64_t)"Run vmmap before termination.", (uint64_t *)&v17);
  *(void *)&long long v25 = &v17;
  sub_100014D7C((void ***)&v25);
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  sub_10001495C("--heap", (uint64_t)"Run heap before termination.", (uint64_t *)&v17);
  *(void *)&long long v25 = &v17;
  sub_100014D7C((void ***)&v25);
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  sub_10001495C("--verbose", (uint64_t)"Increase verbosity of output.", (uint64_t *)&v17);
  *(void *)&long long v25 = &v17;
  sub_100014D7C((void ***)&v25);
  id v1 = +[_SWCPrefs sharedPrefs];
  unsigned int v2 = [v1 isAppleInternal];

  if (v2)
  {
    long long v17 = 0uLL;
    uint64_t v18 = 0;
    sub_10001495C("--vverbose", (uint64_t)"Increase verbosity of output to ludicrous levels (implies --verbose).", (uint64_t *)&v17);
    *(void *)&long long v25 = &v17;
    sub_100014D7C((void ***)&v25);
  }
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  sub_10001495C("add-all-apps", (uint64_t)"Update the SWC database to match Launch Services.", (uint64_t *)&v17);
  *(void *)&long long v25 = &v17;
  sub_100014D7C((void ***)&v25);
  sub_100010A34(&v17, "[-s <service>]");
  sub_100010A34(v19, "-a <app-id>");
  sub_100010A34(v20, "[-d <domain>]");
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  *(void *)&long long v25 = operator new(0x48uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 72;
  *((void *)&v25 + 1) = sub_100014E08(&v17, &v21, (char *)v25);
  sub_10001495C("add", (uint64_t)"Temporarily add entries for the specified app identifier.\nSpecify all params to force a specific service.", (uint64_t *)&v25);
  long long v16 = (void **)&v25;
  sub_100014D7C(&v16);
  for (uint64_t i = 0; i != -9; i -= 3)
  {
    if (SHIBYTE(v20[i + 2]) < 0) {
      operator delete((void *)v20[i]);
    }
  }
  sub_100010A34(&v17, "-d <domain>");
  sub_100010A34(v19, "[-t <timeout>]");
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  *(void *)&long long v25 = operator new(0x30uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 48;
  *((void *)&v25 + 1) = sub_100014E08(&v17, (long long *)v20, (char *)v25);
  sub_10001495C("dl", (uint64_t)"Downloads an A-A-S-A file from a domain.\nIf specified, the timeout is in seconds.", (uint64_t *)&v25);
  long long v16 = (void **)&v25;
  sub_100014D7C(&v16);
  for (uint64_t j = 0; j != -6; j -= 3)
  {
    if (SHIBYTE(v19[j + 2]) < 0) {
      operator delete((void *)v19[j]);
    }
  }
  sub_100010A34(&v25, "-f <path>");
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  *(void *)&long long v17 = operator new(0x18uLL);
  *((void *)&v17 + 1) = v17;
  uint64_t v18 = v17 + 24;
  *((void *)&v17 + 1) = sub_100014E08(&v25, &v27, (char *)v17);
  sub_10001495C("loaddb", (uint64_t)"Loads a database into swcutil's memory.", (uint64_t *)&v17);
  long long v16 = (void **)&v17;
  sub_100014D7C(&v16);
  if (SHIBYTE(v26) < 0) {
    operator delete((void *)v25);
  }
  sub_100010A34(&v17, "[-s <service>]");
  sub_100010A34(v19, "[-a <app-id>]");
  sub_100010A34(v20, "[-d <domain>]");
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  *(void *)&long long v25 = operator new(0x48uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 72;
  *((void *)&v25 + 1) = sub_100014E08(&v17, &v21, (char *)v25);
  sub_10001495C("get", (uint64_t)"Gets info about apps and/or domains.", (uint64_t *)&v25);
  long long v16 = (void **)&v25;
  sub_100014D7C(&v16);
  for (uint64_t k = 0; k != -9; k -= 3)
  {
    if (SHIBYTE(v20[k + 2]) < 0) {
      operator delete((void *)v20[k]);
    }
  }
  sub_100010A34(&v17, "-u <url>");
  sub_100010A34(v19, "[-r <referrer-url>]");
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  *(void *)&long long v25 = operator new(0x30uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 48;
  *((void *)&v25 + 1) = sub_100014E08(&v17, (long long *)v20, (char *)v25);
  sub_10001495C("openul", (uint64_t)"Open a URL as a universal link.", (uint64_t *)&v25);
  long long v16 = (void **)&v25;
  sub_100014D7C(&v16);
  for (uint64_t m = 0; m != -6; m -= 3)
  {
    if (SHIBYTE(v19[m + 2]) < 0) {
      operator delete((void *)v19[m]);
    }
  }
  sub_100010A34(&v17, "[-s <service>]");
  sub_100010A34(v19, "[-a <app-id>]");
  sub_100010A34(v20, "[-d <domain>]");
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  *(void *)&long long v25 = operator new(0x48uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 72;
  *((void *)&v25 + 1) = sub_100014E08(&v17, &v21, (char *)v25);
  sub_10001495C("remove", (uint64_t)"Temporarily removes an app from the SWC database.", (uint64_t *)&v25);
  long long v16 = (void **)&v25;
  sub_100014D7C(&v16);
  for (uint64_t n = 0; n != -9; n -= 3)
  {
    if (SHIBYTE(v20[n + 2]) < 0) {
      operator delete((void *)v20[n]);
    }
  }
  sub_100010A34(&v17, "-s <service>");
  sub_100010A34(v19, "-a <app-id>");
  sub_100010A34(v20, "-d <domain>");
  sub_100010A34(&v21, "[-j <JSON-or-path>]");
  sub_100010A34(v22, "[-u <user-approval>]");
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  *(void *)&long long v25 = operator new(0x78uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 120;
  *((void *)&v25 + 1) = sub_100014E08(&v17, (long long *)v23, (char *)v25);
  sub_10001495C("set", (uint64_t)"Sets details and/or user approval for an app/domain/service.", (uint64_t *)&v25);
  long long v16 = (void **)&v25;
  sub_100014D7C(&v16);
  for (iuint64_t i = 0; ii != -15; ii -= 3)
  {
    if (SHIBYTE(v22[ii + 2]) < 0) {
      operator delete((void *)v22[ii]);
    }
  }
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  sub_10001495C("show", (uint64_t)"Show the current state.", (uint64_t *)&v17);
  *(void *)&long long v25 = &v17;
  sub_100014D7C((void ***)&v25);
  sub_100010A34(&v17, "[-d <domain>]");
  sub_100010A34(v19, "-j <JSON-or-path>");
  sub_100010A34(v20, "[-u <url>]");
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  *(void *)&long long v25 = operator new(0x48uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 72;
  *((void *)&v25 + 1) = sub_100014E08(&v17, &v21, (char *)v25);
  sub_10001495C("verify", (uint64_t)"Verify apple-app-site-association files. Use -u to match a URL.", (uint64_t *)&v25);
  long long v16 = (void **)&v25;
  sub_100014D7C(&v16);
  for (juint64_t j = 0; jj != -9; jj -= 3)
  {
    if (SHIBYTE(v20[jj + 2]) < 0) {
      operator delete((void *)v20[jj]);
    }
  }
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  sub_10001495C("reset", (uint64_t)"Reset the database and restart swcd.", (uint64_t *)&v17);
  *(void *)&long long v25 = &v17;
  sub_100014D7C((void ***)&v25);
  uint64_t v10 = +[_SWCPrefs sharedPrefs];
  unsigned int v11 = [v10 isAppleInternal];

  long long v17 = 0uLL;
  uint64_t v18 = 0;
  if (v11) {
    sub_10001495C("watch", (uint64_t)"Watch the system log for SWC logging.\nSpecify --verbose to enable debug-level logging.\nSpecify --vverbose to enable logging in swcd for all subsystems.", (uint64_t *)&v17);
  }
  else {
    sub_10001495C("watch", (uint64_t)"Watch the system log for SWC logging.\nSpecify --verbose to enable debug-level logging.", (uint64_t *)&v17);
  }
  *(void *)&long long v25 = &v17;
  sub_100014D7C((void ***)&v25);
  sub_100010A34(&v17, "-s <service>");
  sub_100010A34(v19, "[-a <app-id>]");
  sub_100010A34(v20, "[-d <domain>]");
  sub_100010A34(&v21, "-k <key>");
  sub_100010A34(v22, "[-j]");
  sub_100010A34(v23, "[-p]");
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  *(void *)&long long v25 = operator new(0x90uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 144;
  *((void *)&v25 + 1) = sub_100014E08(&v17, (long long *)v24, (char *)v25);
  sub_10001495C("read-settings", (uint64_t)"Reads settings.\nSpecify -j to output JSON or -p to output a plist.", (uint64_t *)&v25);
  long long v16 = (void **)&v25;
  sub_100014D7C(&v16);
  for (kuint64_t k = 0; kk != -18; kk -= 3)
  {
    if (SHIBYTE(v23[kk + 2]) < 0) {
      operator delete((void *)v23[kk]);
    }
  }
  sub_100010A34(&v17, "-s <service>");
  sub_100010A34(v19, "[-a <app-id>]");
  sub_100010A34(v20, "[-d <domain>]");
  sub_100010A34(&v21, "-k <key>");
  sub_100010A34(v22, "-v <value>");
  sub_100010A34(v23, "[-j]");
  sub_100010A34(v24, "[-p]");
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  *(void *)&long long v25 = operator new(0xA8uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 168;
  *((void *)&v25 + 1) = sub_100014E08(&v17, &v25, (char *)v25);
  sub_10001495C("write-settings", (uint64_t)"Writes settings.\nSpecify -j to interpret <value> as JSON or -p to interpret <value> as a plist.", (uint64_t *)&v25);
  long long v16 = (void **)&v25;
  sub_100014D7C(&v16);
  for (muint64_t m = 0; mm != -21; mm -= 3)
  {
    if (SHIBYTE(v24[mm + 2]) < 0) {
      operator delete((void *)v24[mm]);
    }
  }
  sub_100010A34(&v17, "-u <url>");
  sub_100010A34(v19, "-j <JSON-or-path>");
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  *(void *)&long long v25 = operator new(0x30uLL);
  *((void *)&v25 + 1) = v25;
  uint64_t v26 = v25 + 48;
  *((void *)&v25 + 1) = sub_100014E08(&v17, (long long *)v20, (char *)v25);
  sub_10001495C("match", (uint64_t)"Test a pattern-matching dictionary against a URL.", (uint64_t *)&v25);
  long long v16 = (void **)&v25;
  sub_100014D7C(&v16);
  for (nuint64_t n = 0; nn != -6; nn -= 3)
  {
    if (SHIBYTE(v19[nn + 2]) < 0) {
      operator delete((void *)v19[nn]);
    }
  }
  sub_100010A34(&v25, "-e <enabled>");
  long long v17 = 0uLL;
  uint64_t v18 = 0;
  *(void *)&long long v17 = operator new(0x18uLL);
  uint64_t v18 = v17 + 24;
  *((void *)&v17 + 1) = sub_100014E08(&v25, &v27, (char *)v17);
  sub_10001495C("developer-mode", (uint64_t)"Enable or disable developer mode.", (uint64_t *)&v17);
  long long v16 = (void **)&v17;
  sub_100014D7C(&v16);
  if (SHIBYTE(v26) < 0) {
    operator delete((void *)v25);
  }
  sub_100010A34(&v17, "[-p]");
  sub_100010A34(v19, "[-z <time-zone>]");
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  *(void *)&long long v25 = operator new(0x30uLL);
  uint64_t v26 = v25 + 48;
  *((void *)&v25 + 1) = sub_100014E08(&v17, (long long *)v20, (char *)v25);
  sub_10001495C("get-tdi-epoch", (uint64_t)"Gets the epoch (last-changed timestamp) of SWC's tracking domain info. Pass -p for a POSIX timestamp.", (uint64_t *)&v25);
  long long v16 = (void **)&v25;
  sub_100014D7C(&v16);
  for (uint64_t i1 = 0; i1 != -6; i1 -= 3)
  {
    if (SHIBYTE(v19[i1 + 2]) < 0) {
      operator delete((void *)v19[i1]);
    }
  }
}

void sub_100014358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  *(void *)(v16 - 80) = v15;
  sub_100014D7C((void ***)(v16 - 80));
  _Unwind_Resume(a1);
}

void sub_1000148E0()
{
  +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  _SWCLogObject();
}

void sub_100014948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001495C(char *__s, uint64_t a2, uint64_t *a3)
{
  sub_100010A34(__p, __s);
  sub_10000FF98((uint64_t)v34, __p);
  if (v31 < 0) {
    operator delete(__p[0]);
  }
  if (v34[64]
    && v34[56]
    && (+[_SWCPrefs sharedPrefs],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 isAppleInternal],
        v5,
        (v6 & 1) == 0))
  {
    sub_100016920((uint64_t)v34);
  }
  else
  {
    sub_100016920((uint64_t)v34);
    fputc(32, __stderrp);
    fputc(32, __stderrp);
    sub_1000148E0();
    uint64_t v8 = *a3;
    for (uint64_t i = a3[1]; v8 != i; v8 += 24)
    {
      fputc(32, __stderrp);
      sub_1000148E0();
    }
    long long v17 = +[NSString stringWithUTF8String:a2];
    fputc(10, __stderrp);
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = [v17 componentsSeparatedByString:@"\n"];
    id v9 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v9)
    {
      uint64_t v19 = *(void *)v27;
      do
      {
        id v20 = v9;
        for (uint64_t j = 0; j != v20; uint64_t j = (char *)j + 1)
        {
          if (*(void *)v27 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
          fputs("   ", __stderrp);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          unsigned int v11 = [v10 componentsSeparatedByString:@" "];
          id v12 = [v11 countByEnumeratingWithState:&v22 objects:v32 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v23;
            do
            {
              for (uint64_t k = 0; k != v12; uint64_t k = (char *)k + 1)
              {
                if (*(void *)v23 != v13) {
                  objc_enumerationMutation(v11);
                }
                uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * (void)k);
                fputc(32, __stderrp);
                if ([v15 hasPrefix:@"<"]
                  && [v15 hasSuffix:@">"]
                  || [v15 hasPrefix:@"-"])
                {
                  [v15 UTF8String];
                  sub_1000148E0();
                }
                else
                {
                  uint64_t v16 = (const char *)[v15 UTF8String];
                  fputs(v16, __stderrp);
                }
              }
              id v12 = [v11 countByEnumeratingWithState:&v22 objects:v32 count:16];
            }
            while (v12);
          }

          fputc(10, __stderrp);
        }
        id v9 = [obj countByEnumeratingWithState:&v26 objects:v33 count:16];
      }
      while (v9);
    }

    fputc(10, __stderrp);
  }
}

void sub_100014CFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *__p,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  sub_100016920(v37 - 168);
  _Unwind_Resume(a1);
}

void sub_100014D7C(void ***a1)
{
  id v1 = *a1;
  unsigned int v2 = (void **)**a1;
  if (v2)
  {
    id v4 = (void **)v1[1];
    id v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 1) < 0) {
          operator delete(*(v4 - 3));
        }
        v4 -= 3;
      }
      while (v4 != v2);
      id v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

char *sub_100014E08(long long *a1, long long *a2, char *__dst)
{
  if (a1 != a2)
  {
    id v5 = a1;
    do
    {
      if (*((char *)v5 + 23) < 0)
      {
        sub_100014E7C(__dst, *(void **)v5, *((void *)v5 + 1));
      }
      else
      {
        long long v6 = *v5;
        *((void *)__dst + 2) = *((void *)v5 + 2);
        *(_OWORD *)__dst = v6;
      }
      id v5 = (long long *)((char *)v5 + 24);
      __dst += 24;
    }
    while (v5 != a2);
  }
  return __dst;
}

void *sub_100014E7C(unsigned char *__dst, void *__src, unint64_t a3)
{
  id v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    uint64_t v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    void *v5 = v8;
    id v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

void sub_100014F1C()
{
}

void *sub_100014F30(uint64_t a1)
{
  result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  void *result = off_10002CB60;
  result[1] = v3;
  return result;
}

uint64_t sub_100014F78(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = off_10002CB60;
  a2[1] = v2;
  return result;
}

uint64_t sub_100014FA4(uint64_t a1, unsigned int *a2, void *a3)
{
  return (*(uint64_t (**)(void, void))(a1 + 8))(*a2, *a3);
}

uint64_t sub_100014FB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  if (v3 == 0x80000001000242A1
    || ((v3 & 0x80000001000242A1 & 0x8000000000000000) != 0) != __OFSUB__(v3, 0x80000001000242A1)
    && !strcmp((const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(0x80000001000242A1 & 0x7FFFFFFFFFFFFFFFLL)))
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

_UNKNOWN **sub_10001501C()
{
  return &off_10002CBE0;
}

void sub_100015028(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = __stderrp;
  id v4 = (const char *)sub_100015084(v2);
  fprintf(v3, "Error adding all apps: %s\n", v4);
  exit(1);
}

void sub_100015074(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100015084(void *a1)
{
  id v1 = a1;
  if (byte_1000328BB)
  {
    id v2 = objc_alloc_init((Class)NSMutableString);
    uint64_t v3 = [v1 domain];
    [v2 appendFormat:@"%@ %lli {", v3, objc_msgSend(v1, "code")];

    id v4 = [v1 userInfo];
    id v5 = [v4 count];

    if (v5)
    {
      v17[0] = 0;
      v17[1] = v17;
      v17[2] = 0x2020000000;
      char v18 = 1;
      uint64_t v6 = [v1 userInfo];
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000154FC;
      void v14[3] = &unk_10002CC88;
      uint64_t v16 = v17;
      id v7 = v2;
      id v15 = v7;
      [v6 enumerateKeysAndObjectsUsingBlock:v14];

      [v7 appendString:@"\n}"];
      _Block_object_dispose(v17, 8);
    }
    else
    {
      [v2 appendString:@" }"];
    }
    id v11 = v2;
    id v12 = [v11 UTF8String];
  }
  else
  {
    uint64_t v8 = +[_SWCPrefs sharedPrefs];
    unsigned int v9 = [v8 isAppleInternal];

    if (v9) {
      [v1 description];
    }
    else {
    id v10 = [v1 localizedDescription];
    }
    id v12 = [v10 UTF8String];
  }
  return v12;
}

void sub_100015270(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000152EC(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v6 = a3;
  if (!v3)
  {
    id v4 = __stderrp;
    id v5 = (const char *)sub_100015084(v6);
    fprintf(v4, "Error adding all apps: %s\n", v5);
    exit(1);
  }
  fwrite("Added all apps.\n", 0x10uLL, 1uLL, __stdoutp);
}

void sub_100015388(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_10001539C(int a1, char *const *a2, const char *a3)
{
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  while (1)
  {
    int v8 = getopt(a1, a2, a3);
    if (v8 == -1) {
      break;
    }
    if (v8 == 63) {
      sub_10000FDA4();
    }
    __int16 v13 = v8;
    id v9 = [objc_alloc((Class)NSString) initWithCharacters:&v13 length:1];
    id v10 = v9;
    if (optarg)
    {
      id v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
      if (!v10) {
        goto LABEL_14;
      }
    }
    else
    {
      id v11 = &__kCFBooleanTrue;
      if (!v9) {
        goto LABEL_14;
      }
    }
    if (!v11) {
LABEL_14:
    }
      sub_10000FDA4();
    [v7 setObject:v11 forKeyedSubscript:v10];
  }
  return v7;
}

void sub_1000154C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000154FC(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    [*(id *)(a1 + 32) appendString:@","];
  }
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [v5 debugDescription];
  [v6 appendFormat:@"\n\t%@: \"%@\"", v8, v7];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void sub_1000155B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

id sub_1000155DC(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc((Class)_SWCServiceSpecifier);
  BOOL v3 = [v1 objectForKeyedSubscript:@"s"];
  id v4 = [v1 objectForKeyedSubscript:@"a"];
  id v5 = [v1 objectForKeyedSubscript:@"d"];
  id v6 = [v2 initWithServiceType:v3 applicationIdentifier:v4 domain:v5];

  return v6;
}

void sub_1000156A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000156D8(id a1, NSError *a2)
{
  id v2 = a2;
  BOOL v3 = __stderrp;
  id v4 = (const char *)sub_100015084(v2);
  fprintf(v3, "Error adding app: %s\n", v4);
  exit(1);
}

void sub_100015724(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015734(uint64_t a1, int a2, void *a3)
{
  id v12 = a3;
  id v5 = *(void **)(a1 + 32);
  if (!a2)
  {
    id v8 = __stderrp;
    id v9 = [v5 applicationIdentifier];
    id v10 = (const char *)[v9 UTF8String];
    id v11 = (const char *)sub_100015084(v12);
    fprintf(v8, "Error adding app %s: %s\n", v10, v11);

    exit(1);
  }
  id v6 = __stdoutp;
  id v7 = [v5 applicationIdentifier];
  fprintf(v6, "Added app %s.\n", (const char *)[v7 UTF8String]);
}

void sub_100015814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_100015838(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v11 = a2;
  id v6 = a4;
  if (!v11)
  {
    id v9 = __stderrp;
    id v10 = (const char *)sub_100015084(v6);
    fprintf(v9, "%s\n", v10);
    exit(1);
  }
  id v7 = __stdoutp;
  id v8 = [v11 description];
  fprintf(v7, "%s\n", (const char *)[v8 UTF8String]);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100015910(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100015934(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  if (!a2)
  {
    id v5 = __stderrp;
    id v6 = (const char *)sub_100015084(v7);
    fprintf(v5, "%s\n", v6);
    exit(1);
  }
  fwrite("SUCCESS\n", 8uLL, 1uLL, __stdoutp);
  sleep(1u);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000159E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000159F8(id a1, NSError *a2)
{
  id v2 = a2;
  BOOL v3 = __stderrp;
  id v4 = (const char *)sub_100015084(v2);
  fprintf(v3, "Error adding app: %s\n", v4);
  exit(1);
}

void sub_100015A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015A54(uint64_t a1, int a2, void *a3)
{
  id v12 = a3;
  id v5 = *(void **)(a1 + 32);
  if (!a2)
  {
    id v8 = __stderrp;
    id v9 = [v5 applicationIdentifier];
    id v10 = (const char *)[v9 UTF8String];
    id v11 = (const char *)sub_100015084(v12);
    fprintf(v8, "Error removing app %s: %s\n", v10, v11);

    exit(1);
  }
  id v6 = __stdoutp;
  id v7 = [v5 applicationIdentifier];
  fprintf(v6, "Removed app %s.\n", (const char *)[v7 UTF8String]);
}

void sub_100015B34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{
  _Unwind_Resume(a1);
}

void sub_100015B58(id a1, NSError *a2)
{
  id v2 = a2;
  BOOL v3 = __stderrp;
  id v4 = (const char *)sub_100015084(v2);
  fprintf(v3, "Error setting service options: %s\n", v4);
  exit(1);
}

void sub_100015BA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100015BB4(void *a1, objc_class *a2)
{
  id v3 = a1;
  id v15 = 0;
  id v4 = [objc_alloc((Class)NSData) initWithContentsOfFile:v3 options:1 error:&v15];
  id v5 = v15;
  if (v4)
  {
    id v6 = +[SWCSecurityGuard sharedSecurityGuard];
    id v14 = v5;
    id v7 = [v6 JSONObjectWithSignedJSONData:v4 error:&v14];
    id v8 = v5;
    id v5 = v14;
  }
  else
  {
    id v6 = [v3 dataUsingEncoding:4];
    if (!v6)
    {
      id v12 = __stderrp;
      __int16 v13 = (const char *)sub_100015084(v5);
      fprintf(v12, "Error reading JSON file: %s\n", v13);
      exit(1);
    }
    id v8 = +[SWCSecurityGuard sharedSecurityGuard];
    id v7 = [v8 JSONObjectWithSignedJSONData:v6 error:0];
  }

  if (!v7)
  {
    id v10 = __stderrp;
    sub_100015084(v5);
    fprintf(v10, "Error parsing JSON: %s\n");
    goto LABEL_13;
  }
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = __stderrp;
    class_getName(a2);
    fprintf(v11, "Supplied JSON was decoded to the wrong class. Expected to decode to %s.\n");
LABEL_13:
    exit(1);
  }

  return v7;
}

void sub_100015D7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015DCC(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v6 = a3;
  if (!v3)
  {
    id v4 = __stderrp;
    id v5 = (const char *)sub_100015084(v6);
    fprintf(v4, "Error setting service details: %s\n", v5);
    exit(1);
  }
  fwrite("Set service details.\n", 0x15uLL, 1uLL, __stdoutp);
}

void sub_100015E68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100015E7C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v6 = a3;
  if (!v3)
  {
    id v4 = __stderrp;
    id v5 = (const char *)sub_100015084(v6);
    fprintf(v4, "Error setting service flags: %s\n", v5);
    exit(1);
  }
  fwrite("Set user approval state.\n", 0x19uLL, 1uLL, __stdoutp);
}

void sub_100015F18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100015F2C(id a1, NSError *a2)
{
  id v2 = a2;
  BOOL v3 = __stderrp;
  id v4 = (const char *)sub_100015084(v2);
  fprintf(v3, "Error showing SWC state: %s\n", v4);
  exit(1);
}

void sub_100015F78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015F8C(id a1, NSError *a2)
{
  id v2 = a2;
  BOOL v3 = __stderrp;
  id v4 = (const char *)sub_100015084(v2);
  fprintf(v3, "Error resetting swcd: %s", v4);
  exit(1);
}

void sub_100015FD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015FE8(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v6 = a3;
  if (!v3)
  {
    id v4 = __stderrp;
    id v5 = (const char *)sub_100015084(v6);
    fprintf(v4, "Error resetting swcd: %s\n", v5);
    exit(1);
  }
  +[NSThread sleepForTimeInterval:1.0];
  fwrite("Reset swcd.\n", 0xCuLL, 1uLL, __stdoutp);
}

void sub_100016094(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000160A8(void *a1, void *a2)
{
  id v3 = a1;
  id v34 = a2;
  id v33 = v3;
  id v4 = [v33 fileSystemRepresentation];
  id v5 = (char *)operator new(8uLL);
  *(void *)id v5 = v4;
  id v6 = v5 + 8;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v34;
  id v7 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v39;
    id v9 = v5 + 8;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = [*(id *)(*((void *)&v38 + 1) + 8 * i) UTF8String];
        id v12 = v11;
        if (v9 >= v6)
        {
          uint64_t v13 = (v9 - v5) >> 3;
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 61) {
            abort();
          }
          if ((v6 - v5) >> 2 > v14) {
            unint64_t v14 = (v6 - v5) >> 2;
          }
          if ((unint64_t)(v6 - v5) >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v15 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v15 = v14;
          }
          if (v15) {
            unint64_t v15 = (unint64_t)sub_1000164AC(v15);
          }
          else {
            uint64_t v16 = 0;
          }
          long long v17 = (char *)(v15 + 8 * v13);
          id v6 = (char *)(v15 + 8 * v16);
          *(void *)long long v17 = v12;
          char v18 = v17 + 8;
          if (v9 == v5) {
            goto LABEL_20;
          }
          do
          {
            uint64_t v19 = *((void *)v9 - 1);
            v9 -= 8;
            *((void *)v17 - 1) = v19;
            v17 -= 8;
          }
          while (v9 != v5);
          if (v5) {
LABEL_20:
          }
            operator delete(v5);
          id v5 = v17;
          id v9 = v18;
        }
        else
        {
          *(void *)id v9 = v11;
          v9 += 8;
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v7);

    if (v9 < v6)
    {
      *(void *)id v9 = 0;
      id v20 = (char **)v5;
      goto LABEL_41;
    }
  }
  else
  {

    id v9 = v5 + 8;
  }
  uint64_t v21 = (v9 - v5) >> 3;
  unint64_t v22 = v21 + 1;
  if ((unint64_t)(v21 + 1) >> 61) {
    abort();
  }
  if ((v6 - v5) >> 2 > v22) {
    unint64_t v22 = (v6 - v5) >> 2;
  }
  if ((unint64_t)(v6 - v5) >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v23 = v22;
  }
  if (v23) {
    unint64_t v23 = (unint64_t)sub_1000164AC(v23);
  }
  id v20 = (char **)(v23 + 8 * v21);
  void *v20 = 0;
  if (v9 == v5)
  {
    id v5 = v9;
  }
  else
  {
    do
    {
      long long v24 = (char *)*((void *)v9 - 1);
      v9 -= 8;
      *--id v20 = v24;
    }
    while (v9 != v5);
    if (!v5) {
      goto LABEL_41;
    }
  }
  operator delete(v5);
LABEL_41:
  pid_t v37 = 0;
  long long v25 = *v20;
  long long v26 = _NSGetEnviron();
  if (posix_spawn(&v37, v25, 0, 0, v20, *v26))
  {
    id v30 = [objc_alloc((Class)NSError) initWithDomain:NSPOSIXErrorDomain code:*__error() userInfo:0];
    char v31 = __stderrp;
    char v32 = (const char *)sub_100015084(v30);
    fprintf(v31, "Error executing helper tool: %s\n", v32);
    exit(1);
  }
  int v27 = sigblock(0x80000);
  long long v28 = signal(2, (void (__cdecl *)(int))1);
  long long v29 = signal(3, (void (__cdecl *)(int))1);
  int v36 = 0;
  waitpid(v37, &v36, 0);
  sigsetmask(v27);
  signal(2, v28);
  signal(3, v29);
  operator delete(v20);
}

void sub_100016428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  operator delete(v13);
  _Unwind_Resume(a1);
}

void *sub_1000164AC(unint64_t a1)
{
  if (a1 >> 61) {
    sub_10000791C();
  }
  return operator new(8 * a1);
}

void sub_1000164E4(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = __stderrp;
  id v4 = (const char *)sub_100015084(v2);
  fprintf(v3, "Error setting developer mode: %s\n", v4);
  exit(1);
}

void sub_100016530(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016540(id a1, NSNumber *a2, NSError *a3)
{
  id v10 = a2;
  id v4 = a3;
  if (!v10)
  {
    uint64_t v8 = __stderrp;
    id v9 = (const char *)sub_100015084(v4);
    fprintf(v8, "Error getting developer mode: %s\n", v9);
    exit(1);
  }
  id v5 = __stdoutp;
  unsigned int v6 = [(NSNumber *)v10 BOOLValue];
  id v7 = "disabled";
  if (v6) {
    id v7 = "enabled";
  }
  fprintf(v5, "Developer mode is %s.\n", v7);
}

void sub_100016608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100016620(uint64_t a1, int a2, void *a3)
{
  id v10 = a3;
  if (!a2)
  {
    if ([v10 code] == (id)3072
      && ([v10 domain],
          unsigned int v6 = objc_claimAutoreleasedReturnValue(),
          unsigned int v7 = [v6 isEqual:NSCocoaErrorDomain],
          v6,
          v7))
    {
      fwrite("Operation cancelled.\n", 0x15uLL, 1uLL, __stderrp);
    }
    else
    {
      uint64_t v8 = __stderrp;
      id v9 = (const char *)sub_100015084(v10);
      fprintf(v8, "Error setting developer mode: %s\n", v9);
    }
    exit(1);
  }
  if (*(unsigned char *)(a1 + 32)) {
    id v5 = "enabled";
  }
  else {
    id v5 = "disabled";
  }
  fprintf(__stdoutp, "Developer mode %s.\n", v5);
}

void sub_100016738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void *sub_100016758(void *a1)
{
  id v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t sub_1000167DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void sub_100016874(void ***a1)
{
  id v1 = *a1;
  id v2 = (char *)**a1;
  if (v2)
  {
    id v4 = (char *)v1[1];
    id v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        sub_100016758((void *)v4 - 5);
        if (*(v4 - 41) < 0) {
          operator delete(*((void **)v4 - 8));
        }
        v4 -= 64;
      }
      while (v4 != v2);
      id v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t sub_100016908()
{
  std::__libcpp_verbose_abort("bad_function_call was thrown in -fno-exceptions mode");
  return sub_100016920(v0);
}

uint64_t sub_100016920(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    sub_100016758((void *)(a1 + 24));
    if (*(char *)(a1 + 23) < 0) {
      operator delete(*(void **)a1);
    }
  }
  return a1;
}

unint64_t sub_100016964(uint64_t *a1, unint64_t a2)
{
  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      uint64_t v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      uint64_t v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      uint64_t v8 = a1[2];
      uint64_t v7 = a1[3];
      uint64_t v9 = __ROR8__(v6 + v7, 52);
      uint64_t v10 = v6 + a1[1];
      uint64_t v11 = __ROR8__(v10, 7);
      uint64_t v12 = v10 + v8;
      uint64_t v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      uint64_t v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      uint64_t v15 = __ROR8__(v14 + v13, 52);
      uint64_t v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      uint64_t v17 = __ROR8__(v13, 37);
      uint64_t v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      uint64_t v19 = __ROR8__(v18, 7);
      uint64_t v20 = v16 + __ROR8__(v12, 31);
      uint64_t v21 = v18 + v5;
      uint64_t v22 = v21 + v14;
      unint64_t v23 = 0x9AE16A3B2F90404FLL;
      unint64_t v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      unint64_t v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    unint64_t v4 = 0x9DDFEA08EB382D69;
    uint64_t v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    uint64_t v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    uint64_t v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    uint64_t v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    uint64_t v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    uint64_t v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    uint64_t v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v39 = v35 + v37;
    unint64_t v40 = 0x9DDFEA08EB382D69
        * (v34 ^ ((0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))));
    unint64_t v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47));
    unint64_t v42 = v32 + v35 + v36 + a2;
    uint64_t v43 = v42 + v33;
    unint64_t v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v36 + a2 + v33 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    uint64_t v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    uint64_t v46 = v34 + v37 + v45;
    uint64_t v47 = __ROR8__(v46, 44);
    uint64_t v48 = v46 + v38;
    uint64_t v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    uint64_t v51 = *a1;
    long long v50 = a1 + 4;
    unint64_t v52 = v51 - 0x4B6D499041670D8DLL * v33;
    uint64_t v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      uint64_t v54 = *(v50 - 3);
      uint64_t v55 = v52 + v43 + v39 + v54;
      uint64_t v56 = v50[2];
      uint64_t v57 = v50[3];
      uint64_t v58 = v50[1];
      unint64_t v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      uint64_t v59 = v41 + v48;
      uint64_t v60 = *(v50 - 2);
      uint64_t v61 = *(v50 - 1);
      uint64_t v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      uint64_t v63 = v62 + v48 + v61;
      uint64_t v64 = v62 + v54 + v60;
      uint64_t v43 = v64 + v61;
      uint64_t v65 = __ROR8__(v64, 44) + v62;
      unint64_t v66 = (0xB492B66FBE98F273 * __ROR8__(v55, 37)) ^ v49;
      unint64_t v52 = 0xB492B66FBE98F273 * __ROR8__(v59, 33);
      unint64_t v44 = v65 + __ROR8__(v63 + v66, 21);
      unint64_t v67 = v52 + v49 + *v50;
      uint64_t v48 = v58 + v56 + v67 + v57;
      uint64_t v49 = __ROR8__(v58 + v56 + v67, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      unint64_t v41 = v66;
      v53 += 64;
    }
    while (v53);
    unint64_t v68 = v52
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47));
    unint64_t v69 = 0x9DDFEA08EB382D69
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69 * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) >> 47))));
    unint64_t v70 = 0x9DDFEA08EB382D69 * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    uint64_t v26 = a1[1];
    unint64_t v27 = 0xB492B66FBE98F273 * *a1;
    uint64_t v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    unint64_t v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    unint64_t v23 = 0x9DDFEA08EB382D69;
    unint64_t v30 = 0x9DDFEA08EB382D69 * ((v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)) ^ v29);
    unint64_t v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    unint64_t v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      uint64_t v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v23 = 0x9DDFEA08EB382D69;
      unint64_t v73 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      unint64_t v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }
    unint64_t v4 = 0x9AE16A3B2F90404FLL;
    if (!a2) {
      return v4;
    }
    unint64_t v70 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }
  uint64_t v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  uint64_t v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
}

BOOL sub_100016D98(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2 = a1[23];
  if ((v2 & 0x80u) == 0) {
    uint64_t v3 = a1[23];
  }
  else {
    uint64_t v3 = *((void *)a1 + 1);
  }
  uint64_t v4 = a2[23];
  int v5 = (char)v4;
  if ((v4 & 0x80u) != 0) {
    uint64_t v4 = *((void *)a2 + 1);
  }
  if (v3 != v4) {
    return 0;
  }
  if (v5 < 0) {
    a2 = *(unsigned __int8 **)a2;
  }
  if ((v2 & 0x80) != 0) {
    return memcmp(*(const void **)a1, a2, *((void *)a1 + 1)) == 0;
  }
  if (!a1[23]) {
    return 1;
  }
  uint64_t v6 = v2 - 1;
  do
  {
    int v8 = *a1++;
    int v7 = v8;
    int v10 = *a2++;
    int v9 = v10;
    BOOL v12 = v6-- != 0;
    BOOL v13 = v7 == v9;
    BOOL v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

void sub_100016E3C(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime <= *(void *)&v4)
  {
    if (prime >= *(void *)&v4) {
      return;
    }
    unint64_t v11 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v12 = (uint8x8_t)vcnt_s8(v4), v12.i16[0] = vaddlv_u8(v12), v12.u32[0] > 1uLL))
    {
      unint64_t v11 = std::__next_prime(v11);
    }
    else
    {
      uint64_t v13 = 1 << -(char)__clz(v11 - 1);
      if (v11 >= 2) {
        unint64_t v11 = v13;
      }
    }
    if (prime <= v11) {
      size_t prime = v11;
    }
    if (prime >= *(void *)&v4) {
      return;
    }
    if (!prime)
    {
      uint64_t v16 = *(void **)a1;
      *(void *)a1 = 0;
      if (v16) {
        operator delete(v16);
      }
      *(void *)(a1 + 8) = 0;
      return;
    }
  }
  if (prime >> 61) {
    sub_10000791C();
  }
  int v5 = operator new(8 * prime);
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = v5;
  if (v6) {
    operator delete(v6);
  }
  uint64_t v7 = 0;
  *(void *)(a1 + 8) = prime;
  do
    *(void *)(*(void *)a1 + 8 * v7++) = 0;
  while (prime != v7);
  int v8 = *(void **)(a1 + 16);
  if (v8)
  {
    size_t v9 = v8[1];
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)prime);
    v10.i16[0] = vaddlv_u8(v10);
    if (v10.u32[0] > 1uLL)
    {
      if (v9 >= prime) {
        v9 %= prime;
      }
    }
    else
    {
      v9 &= prime - 1;
    }
    *(void *)(*(void *)a1 + 8 * v9) = a1 + 16;
    BOOL v14 = (void *)*v8;
    if (*v8)
    {
      do
      {
        size_t v15 = v14[1];
        if (v10.u32[0] > 1uLL)
        {
          if (v15 >= prime) {
            v15 %= prime;
          }
        }
        else
        {
          v15 &= prime - 1;
        }
        if (v15 != v9)
        {
          if (!*(void *)(*(void *)a1 + 8 * v15))
          {
            *(void *)(*(void *)a1 + 8 * v15) = v8;
            goto LABEL_31;
          }
          void *v8 = *v14;
          void *v14 = **(void **)(*(void *)a1 + 8 * v15);
          **(void **)(*(void *)a1 + 8 * v15) = v14;
          BOOL v14 = v8;
        }
        size_t v15 = v9;
LABEL_31:
        int v8 = v14;
        BOOL v14 = (void *)*v14;
        size_t v9 = v15;
      }
      while (v14);
    }
  }
}

void sub_100017038(char a1, void **__p)
{
  if (a1)
  {
    if (*((char *)__p + 39) < 0) {
      operator delete(__p[2]);
    }
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t sub_100017098(uint64_t a1)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0) {
        operator delete(v2[2]);
      }
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
  int8x8_t v4 = *(void **)a1;
  *(void *)a1 = 0;
  if (v4) {
    operator delete(v4);
  }
  return a1;
}

void sub_100017900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017910(id a1)
{
  qword_1000328C0 = [[SWCDatabase alloc] _initShared];
  _objc_release_x1();
}

void sub_10001797C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017C18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100017C28(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2[3])
  {
    [v2 saveReturningError:0];
    uint64_t v3 = (dispatch_source_t *)(*(void *)(a1 + 32) + 24);
    sub_10001C870(v3);
  }
}

void sub_100017D14(id a1)
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("SWC database queue", v3);
  uint64_t v2 = (void *)qword_1000328D0;
  qword_1000328D0 = (uint64_t)v1;
}

void sub_100017DFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001802C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_100018134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100018290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100018414(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 32))
  {
    id v4 = [a2 domain];
    if (objc_msgSend(*(id *)(a1 + 32), "isEqual:")) {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

void sub_1000184D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100018588(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001869C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000186BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000186CC(uint64_t a1)
{
}

void sub_1000186D4(uint64_t a1, id obj, unsigned char *a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void *)(v5 + 40);
  uint64_t v6 = (id *)(v5 + 40);
  if (!v7)
  {
LABEL_6:
    objc_storeStrong(v6, obj);
    return;
  }
  if (([*(id *)(a1 + 32) isWildcard] & 1) == 0)
  {
    *a3 = 1;
    return;
  }
  id v16 = [obj domain];
  size_t v9 = [v16 host];
  id v10 = [v9 length];
  unint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) domain];
  uint8x8_t v12 = [v11 host];
  if (v10 > [v12 length])
  {
    uint64_t v13 = [obj domain];
    BOOL v14 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) domain];
    unsigned int v15 = [v13 encompassesDomain:v14];

    if (!v15) {
      return;
    }
    uint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    goto LABEL_6;
  }
}

void sub_100018864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001894C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_100018DC8(uint64_t a1, void *a2)
{
  [a2 setLastCheckedDate:*(void *)(a1 + 32)];
  [a2 setLastError:0];
  [a2 setRetryCount:0];
  id v4 = [*(id *)(a1 + 40) indexOfObject:a2];
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if ([a2 isDownloadable])
    {
      uint64_t v5 = [a2 fields];
      _WORD *v5 = *v5 & 0xFFF3 | 8;
    }
  }
  else
  {
    id v10 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v4];
    id v6 = a2;
    uint64_t v7 = [v6 fields];
    _WORD *v7 = *v7 & 0xFFF3 | 4;
    int v8 = [v10 patterns];
    [v6 setPatterns:v8];
    size_t v9 = [v10 substitutionVariables];
    [v6 setSubstitutionVariables:v9];
  }
}

void sub_100018EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100018FC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001921C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31)
{
  _Unwind_Resume(a1);
}

void sub_100019274(uint64_t a1, void *a2)
{
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [a2 serviceType];
  LODWORD(v4) = [v4 isEqual:v5];

  if (v4)
  {
    id v6 = *(void **)(a1 + 40);
    [v6 addObject:a2];
  }
}

void sub_1000192F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019390(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  _Unwind_Resume(a1);
}

void sub_1000195C8(uint64_t a1, void *a2)
{
  id v4 = [a2 applicationIdentifier];
  if (v4)
  {
  }
  else
  {
    uint64_t v5 = [a2 domain];

    if (!v5) {
      return;
    }
  }
  id v6 = [*(id *)(a1 + 32) entryMatchingServiceSpecifier:a2];

  if (!v6)
  {
    if (qword_1000328E8 != -1) {
      dispatch_once(&qword_1000328E8, &stru_10002CFC8);
    }
    uint64_t v7 = qword_1000328E0;
    if (os_log_type_enabled((os_log_t)qword_1000328E0, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      size_t v9 = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will remove settings for service specifier %@ because there are no more service entries matching it", (uint8_t *)&v8, 0xCu);
    }
    [*(id *)(a1 + 40) addObject:a2];
  }
}

void sub_1000199A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001A1FC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) == 0
    || (uint64_t result = +[NSPropertyListSerialization propertyList:a3 isValidForFormat:200], (result & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    *a4 = 1;
  }
  return result;
}

void sub_10001A6A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001A910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A9F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001AAC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001AC40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19)
{
  uint64_t v20 = v19;
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_10001AC7C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = 0;
    unsigned __int8 v3 = [WeakRetained saveReturningError:&v6];
    id v4 = v6;
    if ((v3 & 1) == 0)
    {
      if (qword_1000328E8 != -1) {
        dispatch_once(&qword_1000328E8, &stru_10002CFC8);
      }
      uint64_t v5 = qword_1000328E0;
      if (os_log_type_enabled((os_log_t)qword_1000328E0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v8 = v4;
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error saving SWC database: %@", buf, 0xCu);
      }
    }
  }
}

void sub_10001AD88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B02C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B190(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B20C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B28C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B2A8(id a1)
{
  qword_1000328E0 = (uint64_t)os_log_create((const char *)&_SWCLogSubsystem, "db");
  _objc_release_x1();
}

void sub_10001B340(id a1)
{
  qword_1000328F0 = [[SWCSecurityGuard alloc] _init];
  _objc_release_x1();
}

void sub_10001B3AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001B680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10001B91C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001BD1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10001C0D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_10001C508(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C5B0(id a1)
{
  qword_100032900 = (uint64_t)os_log_create((const char *)&_SWCLogSubsystem, "security");
  _objc_release_x1();
}

void sub_10001C5F4(dispatch_object_t *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  os_unfair_lock_lock(&stru_100032910);
  id v6 = v5;
  double v7 = *(double *)a2;
  double v8 = *(double *)(a2 + 8);
  double v9 = *(double *)(a2 + 16);
  id v10 = *(id *)(a2 + 24);
  id v11 = *(id *)(a2 + 32);
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  if (v8 <= 0.0 || fabs(v8) == INFINITY) {
    uint64_t v13 = -1;
  }
  else {
    uint64_t v13 = (unint64_t)(v8 * 1000000000.0);
  }
  if (*a1)
  {
    dispatch_suspend(*a1);
  }
  else
  {
    dispatch_source_t v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v10);
    dispatch_object_t v15 = *a1;
    *a1 = v14;

    if (!*a1)
    {
      uint64_t v20 = +[NSAssertionHandler currentHandler];
      uint64_t v21 = +[NSString stringWithUTF8String:"void scheduleTimerNoLock(SWCTimer &, const SWCTimerSettings *, void (^__strong)())"];
      [v20 handleFailureInFunction:v21 file:@"SWCTimer.mm" lineNumber:51 description:@"Unexpected failure to allocate a libdispatch timer source"];
    }
  }
  dispatch_source_set_timer(*a1, v12, v13, (unint64_t)(v9 * 1000000000.0));
  id v16 = *a1;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3321888768;
  v22[2] = sub_10001C8CC;
  void v22[3] = &unk_10002D030;
  id v23 = v6;
  uint64_t v24 = v13;
  unint64_t v25 = a1;
  double v26 = v7;
  double v27 = v8;
  double v28 = v9;
  unint64_t v29 = v10;
  id v30 = v11;
  id v17 = v6;
  uint64_t v18 = v10;
  id v19 = v11;
  dispatch_source_set_event_handler(v16, v22);
  dispatch_resume(*a1);

  os_unfair_lock_unlock(&stru_100032910);
}

void sub_10001C83C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001C870(dispatch_source_t *a1)
{
  os_unfair_lock_lock(&stru_100032910);
  if (*a1)
  {
    dispatch_source_cancel(*a1);
    dispatch_source_t v2 = *a1;
    *a1 = 0;
  }
  os_unfair_lock_unlock(&stru_100032910);
}

void sub_10001C8CC(void *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  if (a1[5] == -1)
  {
    dispatch_source_t v2 = (dispatch_source_t *)a1[6];
    sub_10001C870(v2);
  }
}

id sub_10001C928(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 56);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = v4;
  *(void *)(a1 + 80) = *(id *)(a2 + 80);
  id result = *(id *)(a2 + 88);
  *(void *)(a1 + 88) = result;
  return result;
}

void sub_10001C974(uint64_t a1)
{
  dispatch_source_t v2 = *(void **)(a1 + 80);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

CFURLRef CFBundleCopyResourceURLInDirectory(CFURLRef bundleURL, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return _CFBundleCopyResourceURLInDirectory(bundleURL, resourceName, resourceType, subDirName);
}

CFArrayRef CFBundleCopyResourceURLsOfTypeInDirectory(CFURLRef bundleURL, CFStringRef resourceType, CFStringRef subDirName)
{
  return _CFBundleCopyResourceURLsOfTypeInDirectory(bundleURL, resourceType, subDirName);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SecCMSVerifyCopyDataAndAttributes()
{
  return _SecCMSVerifyCopyDataAndAttributes();
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return _SecCertificateCopyCommonName(certificate, commonName);
}

uint64_t SecTrustCopyFailureDescription()
{
  return _SecTrustCopyFailureDescription();
}

CFDictionaryRef SecTrustCopyResult(SecTrustRef trust)
{
  return _SecTrustCopyResult(trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return _SecTrustEvaluateWithError(trust, error);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return _SecTrustGetCertificateAtIndex(trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return _SecTrustGetCertificateCount(trust);
}

uint64_t SecTrustGetKeychainsAllowed()
{
  return _SecTrustGetKeychainsAllowed();
}

OSStatus SecTrustGetTrustResult(SecTrustRef trust, SecTrustResultType *result)
{
  return _SecTrustGetTrustResult(trust, result);
}

uint64_t SecTrustSetKeychainsAllowed()
{
  return _SecTrustSetKeychainsAllowed();
}

uint64_t SecTrustStoreContains()
{
  return _SecTrustStoreContains();
}

uint64_t SecTrustStoreForDomain()
{
  return _SecTrustStoreForDomain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFURLRequestSetAllowedProtocolTypes()
{
  return __CFURLRequestSetAllowedProtocolTypes();
}

uint64_t _LSPersistentIdentifierGetDebugDescription()
{
  return __LSPersistentIdentifierGetDebugDescription();
}

char ***_NSGetEnviron(void)
{
  return __NSGetEnviron();
}

uint64_t _NSIsNSArray()
{
  return __NSIsNSArray();
}

uint64_t _NSIsNSDictionary()
{
  return __NSIsNSDictionary();
}

uint64_t _NSIsNSNumber()
{
  return __NSIsNSNumber();
}

uint64_t _NSIsNSString()
{
  return __NSIsNSString();
}

uint64_t _SWCEnabledConfigurationGetFromDetails()
{
  return __SWCEnabledConfigurationGetFromDetails();
}

uint64_t _SWCFieldsEncodeWithCoder()
{
  return __SWCFieldsEncodeWithCoder();
}

uint64_t _SWCFieldsLogDebugDescription()
{
  return __SWCFieldsLogDebugDescription();
}

uint64_t _SWCFieldsMakeWithCoder()
{
  return __SWCFieldsMakeWithCoder();
}

uint64_t _SWCFileIsTTY()
{
  return __SWCFileIsTTY();
}

uint64_t _SWCGetServerConnection()
{
  return __SWCGetServerConnection();
}

uint64_t _SWCLogHeader()
{
  return __SWCLogHeader();
}

uint64_t _SWCLogObject()
{
  return __SWCLogObject();
}

uint64_t _SWCLogSeparator()
{
  return __SWCLogSeparator();
}

uint64_t _SWCLogValueForKey()
{
  return __SWCLogValueForKey();
}

uint64_t _SWCServiceApprovalStateGetDebugDescription()
{
  return __SWCServiceApprovalStateGetDebugDescription();
}

uint64_t _SWCServiceTypeCanonicalize()
{
  return __SWCServiceTypeCanonicalize();
}

uint64_t _SWCServiceTypeIsWhitelistedForAppClips()
{
  return __SWCServiceTypeIsWhitelistedForAppClips();
}

uint64_t _SWCServiceTypeMaximumDetailsCount()
{
  return __SWCServiceTypeMaximumDetailsCount();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

size_t std::__next_prime(size_t __n)
{
  return std::__next_prime(__n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return std::string::operator=(this, __str);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
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

void abort(void)
{
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

const char *__cdecl class_getName(Class cls)
{
  return _class_getName(cls);
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

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void exit(int a1)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

int getopt(int a1, char *const a2[], const char *a3)
{
  return _getopt(a1, a2, a3);
}

pid_t getpid(void)
{
  return _getpid();
}

const char *getprogname(void)
{
  return _getprogname();
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return _posix_spawn(a1, a2, a3, a4, __argv, __envp);
}

int sigblock(int a1)
{
  return _sigblock(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int sigsetmask(int a1)
{
  return _sigsetmask(a1);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

void uuid_generate_random(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}

xpc_object_t xpc_fd_create(int fd)
{
  return _xpc_fd_create(fd);
}

id objc_msgSend_SDKVersion(void *a1, const char *a2, ...)
{
  return [a1 SDKVersion];
}

id objc_msgSend_SWCApplicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 SWCApplicationIdentifier];
}

id objc_msgSend_SWCDomain(void *a1, const char *a2, ...)
{
  return [a1 SWCDomain];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDRepresentation(void *a1, const char *a2, ...)
{
  return [a1 UUIDRepresentation];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__CFURLRequest(void *a1, const char *a2, ...)
{
  return [a1 _CFURLRequest];
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return [a1 _init];
}

id objc_msgSend__initShared(void *a1, const char *a2, ...)
{
  return [a1 _initShared];
}

id objc_msgSend__loadEnterpriseData(void *a1, const char *a2, ...)
{
  return [a1 _loadEnterpriseData];
}

id objc_msgSend__resumePendingTasks(void *a1, const char *a2, ...)
{
  return [a1 _resumePendingTasks];
}

id objc_msgSend__scheduleSave(void *a1, const char *a2, ...)
{
  return [a1 _scheduleSave];
}

id objc_msgSend__storageForArchiving(void *a1, const char *a2, ...)
{
  return [a1 _storageForArchiving];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_appClipMetadata(void *a1, const char *a2, ...)
{
  return [a1 appClipMetadata];
}

id objc_msgSend_appleDomain(void *a1, const char *a2, ...)
{
  return [a1 appleDomain];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_applicationPersistentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationPersistentIdentifier];
}

id objc_msgSend_applicationVersion(void *a1, const char *a2, ...)
{
  return [a1 applicationVersion];
}

id objc_msgSend_associatedDomainsForManagedApps(void *a1, const char *a2, ...)
{
  return [a1 associatedDomainsForManagedApps];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return [a1 buffer];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleVersion];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancellationError(void *a1, const char *a2, ...)
{
  return [a1 cancellationError];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return [a1 clear];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completionHandlers(void *a1, const char *a2, ...)
{
  return [a1 completionHandlers];
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

id objc_msgSend_databaseVersion(void *a1, const char *a2, ...)
{
  return [a1 databaseVersion];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dateScheduled(void *a1, const char *a2, ...)
{
  return [a1 dateScheduled];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_downloadRoute(void *a1, const char *a2, ...)
{
  return [a1 downloadRoute];
}

id objc_msgSend_downloader(void *a1, const char *a2, ...)
{
  return [a1 downloader];
}

id objc_msgSend_enterpriseState(void *a1, const char *a2, ...)
{
  return [a1 enterpriseState];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return [a1 entitlements];
}

id objc_msgSend_entries(void *a1, const char *a2, ...)
{
  return [a1 entries];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_expectedContentLength(void *a1, const char *a2, ...)
{
  return [a1 expectedContentLength];
}

id objc_msgSend_fields(void *a1, const char *a2, ...)
{
  return [a1 fields];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return [a1 finishTasksAndInvalidate];
}

id objc_msgSend_generationByIncrementingSelf(void *a1, const char *a2, ...)
{
  return [a1 generationByIncrementingSelf];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isAppleInternal(void *a1, const char *a2, ...)
{
  return [a1 isAppleInternal];
}

id objc_msgSend_isBeta(void *a1, const char *a2, ...)
{
  return [a1 isBeta];
}

id objc_msgSend_isDiscretionary(void *a1, const char *a2, ...)
{
  return [a1 isDiscretionary];
}

id objc_msgSend_isDownloadable(void *a1, const char *a2, ...)
{
  return [a1 isDownloadable];
}

id objc_msgSend_isExcluded(void *a1, const char *a2, ...)
{
  return [a1 isExcluded];
}

id objc_msgSend_isFastCheckEnabled(void *a1, const char *a2, ...)
{
  return [a1 isFastCheckEnabled];
}

id objc_msgSend_isFullySpecified(void *a1, const char *a2, ...)
{
  return [a1 isFullySpecified];
}

id objc_msgSend_isManaging(void *a1, const char *a2, ...)
{
  return [a1 isManaging];
}

id objc_msgSend_isProfileValidated(void *a1, const char *a2, ...)
{
  return [a1 isProfileValidated];
}

id objc_msgSend_isSystemPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isSystemPlaceholder];
}

id objc_msgSend_isUPPValidated(void *a1, const char *a2, ...)
{
  return [a1 isUPPValidated];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isWildcard(void *a1, const char *a2, ...)
{
  return [a1 isWildcard];
}

id objc_msgSend_lastCheckedDate(void *a1, const char *a2, ...)
{
  return [a1 lastCheckedDate];
}

id objc_msgSend_lastDatabaseUpdate(void *a1, const char *a2, ...)
{
  return [a1 lastDatabaseUpdate];
}

id objc_msgSend_lastError(void *a1, const char *a2, ...)
{
  return [a1 lastError];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_launchServicesDatabaseGeneration(void *a1, const char *a2, ...)
{
  return [a1 launchServicesDatabaseGeneration];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_maximumRetryCount(void *a1, const char *a2, ...)
{
  return [a1 maximumRetryCount];
}

id objc_msgSend_modeOfOperation(void *a1, const char *a2, ...)
{
  return [a1 modeOfOperation];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nextCheckDate(void *a1, const char *a2, ...)
{
  return [a1 nextCheckDate];
}

id objc_msgSend_nonWildcardDomain(void *a1, const char *a2, ...)
{
  return [a1 nonWildcardDomain];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_originalRequest(void *a1, const char *a2, ...)
{
  return [a1 originalRequest];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_patterns(void *a1, const char *a2, ...)
{
  return [a1 patterns];
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 persistentIdentifier];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return [a1 protectionSpace];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_rawValue(void *a1, const char *a2, ...)
{
  return [a1 rawValue];
}

id objc_msgSend_redactedDescription(void *a1, const char *a2, ...)
{
  return [a1 redactedDescription];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeTask(void *a1, const char *a2, ...)
{
  return [a1 resumeTask];
}

id objc_msgSend_retryCount(void *a1, const char *a2, ...)
{
  return [a1 retryCount];
}

id objc_msgSend_scheduleNextSave(void *a1, const char *a2, ...)
{
  return [a1 scheduleNextSave];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return [a1 serverTrust];
}

id objc_msgSend_serviceSpecifier(void *a1, const char *a2, ...)
{
  return [a1 serviceSpecifier];
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return [a1 serviceType];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedLogger(void *a1, const char *a2, ...)
{
  return [a1 sharedLogger];
}

id objc_msgSend_sharedPrefs(void *a1, const char *a2, ...)
{
  return [a1 sharedPrefs];
}

id objc_msgSend_sharedSecurityGuard(void *a1, const char *a2, ...)
{
  return [a1 sharedSecurityGuard];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_substitutionVariables(void *a1, const char *a2, ...)
{
  return [a1 substitutionVariables];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_task(void *a1, const char *a2, ...)
{
  return [a1 task];
}

id objc_msgSend_taskDescription(void *a1, const char *a2, ...)
{
  return [a1 taskDescription];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_underlyingQueue(void *a1, const char *a2, ...)
{
  return [a1 underlyingQueue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_verifyExtendedValidation(void *a1, const char *a2, ...)
{
  return [a1 verifyExtendedValidation];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}