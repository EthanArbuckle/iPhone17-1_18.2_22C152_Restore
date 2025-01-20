void sub_100005770(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x270], 8);
  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose(&STACK[0x2B0], 8);
  _Block_object_dispose(&STACK[0x2D0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x310], 8);
  _Block_object_dispose(&STACK[0x340], 8);
  _Block_object_dispose(&STACK[0x370], 8);
  _Block_object_dispose(&STACK[0x3A0], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100005824(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100005834(uint64_t a1)
{
}

void sub_10000583C(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    return;
  }
  uint64_t v2 = a1 + 32;
  ssize_t v3 = recv((int)[*(id *)(a1 + 32) localSocket], *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 0x4000uLL, 0);
  ssize_t v4 = v3;
  if (v3 <= 0)
  {
    if (v3)
    {
      if (*__error() == 35) {
        return;
      }
      if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10000CDD0(v2);
      }
    }
    else if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      sub_10000CD44(v2);
    }
    goto LABEL_30;
  }
  ssize_t v5 = send((int)[*(id *)(a1 + 32) bridgeSocket], *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v3, 0);
  if (!v5)
  {
    if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000CE6C(v2);
    }
    goto LABEL_30;
  }
  uint64_t v6 = v5;
  if (v5 < 0)
  {
    if (*__error() == 35)
    {
      ssize_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      goto LABEL_23;
    }
    if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000CEF8(v2);
    }
LABEL_30:
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    return;
  }
  v4 -= v5;
  if (!v4)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v7 = [*(id *)(a1 + 32) serviceName];
        id v8 = [*(id *)(a1 + 32) servicePort];
        v9 = sub_100005BBC(*(unsigned __int8 *)(a1 + 81), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v6);
        int v14 = 138413058;
        v15 = v7;
        __int16 v16 = 2048;
        id v17 = v8;
        __int16 v18 = 2048;
        uint64_t v19 = v6;
        __int16 v20 = 2112;
        v21 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) LOCAL->IDS: %ld bytes sent.%@", (uint8_t *)&v14, 0x2Au);
      }
    }
    return;
  }
  ssize_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + v5;
LABEL_23:
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v10;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v11 = [*(id *)(a1 + 32) serviceName];
    id v12 = [*(id *)(a1 + 32) servicePort];
    v13 = sub_100005BBC(*(unsigned __int8 *)(a1 + 81), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v6);
    int v14 = 138413058;
    v15 = v11;
    __int16 v16 = 2048;
    id v17 = v12;
    __int16 v18 = 2048;
    uint64_t v19 = v6;
    __int16 v20 = 2112;
    v21 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) LOCAL->IDS: %ld bytes sent. Write buffer full.%@", (uint8_t *)&v14, 0x2Au);
  }
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  dispatch_resume(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
}

__CFString *sub_100005BBC(int a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    ssize_t v3 = +[NSData dataWithBytes:a2 length:a3];
    +[NSString stringWithFormat:@" DATA=%@", v3];
    ssize_t v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ssize_t v4 = &stru_100014960;
  }

  return v4;
}

void sub_100005C48(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2) {
    dispatch_source_cancel(v2);
  }
  ssize_t v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v3) {
    dispatch_source_cancel(v3);
  }
  ssize_t v4 = [*(id *)(a1 + 32) localCompletion];
  v4[2]();

  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 24);
  if (v6)
  {
    free(v6);
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  }
  *(void *)(v5 + 24) = 0;
}

void sub_100005CD0(uint64_t a1)
{
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 1) {
    return;
  }
  uint64_t v2 = (id *)(a1 + 32);
  ssize_t v3 = send((int)[*(id *)(a1 + 32) bridgeSocket], *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0);
  if (!v3)
  {
    if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000CF94((uint64_t)v2);
    }
    goto LABEL_20;
  }
  uint64_t v4 = v3;
  if (v3 < 0 && *__error() != 35)
  {
    if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000D0E0((uint64_t)v2);
    }
LABEL_20:
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    return;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v4 == *(void *)(v5 + 24))
  {
    *(void *)(v5 + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
    if (*(unsigned char *)(a1 + 80))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v9 = [*(id *)(a1 + 32) serviceName];
        id v10 = [*(id *)(a1 + 32) servicePort];
        v11 = sub_100005BBC(*(unsigned __int8 *)(a1 + 81), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v4);
        int v12 = 138413058;
        v13 = v9;
        __int16 v14 = 2048;
        id v15 = v10;
        __int16 v16 = 2048;
        uint64_t v17 = v4;
        __int16 v18 = 2112;
        uint64_t v19 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) LOCAL->IDS: %ld bytes sent from write src.%@", (uint8_t *)&v12, 0x2Au);
      }
    }
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    dispatch_resume(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
  else if (v4 < 1)
  {
    if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000D020(v2);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v4;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) -= v4;
    if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [*(id *)(a1 + 32) serviceName];
      id v7 = [*(id *)(a1 + 32) servicePort];
      id v8 = sub_100005BBC(*(unsigned __int8 *)(a1 + 81), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v4);
      int v12 = 138413058;
      v13 = v6;
      __int16 v14 = 2048;
      id v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) LOCAL->IDS: %ld bytes sent from write src unfinished.%@", (uint8_t *)&v12, 0x2Au);
    }
  }
}

void sub_100006014(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    return;
  }
  uint64_t v2 = a1 + 32;
  ssize_t v3 = recv((int)[*(id *)(a1 + 32) bridgeSocket], *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 0x4000uLL, 0);
  ssize_t v4 = v3;
  if (v3 <= 0)
  {
    if (v3)
    {
      if (*__error() == 35) {
        return;
      }
      if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
        sub_10000D208(v2);
      }
    }
    else if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      sub_10000D17C(v2);
    }
    goto LABEL_30;
  }
  ssize_t v5 = send((int)[*(id *)(a1 + 32) localSocket], *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v3, 0);
  if (!v5)
  {
    if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000D2A4(v2);
    }
    goto LABEL_30;
  }
  uint64_t v6 = v5;
  if (v5 < 0)
  {
    if (*__error() == 35)
    {
      ssize_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      goto LABEL_23;
    }
    if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000D330(v2);
    }
LABEL_30:
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    return;
  }
  v4 -= v5;
  if (!v4)
  {
    if (*(unsigned char *)(a1 + 80))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        id v7 = [*(id *)(a1 + 32) serviceName];
        id v8 = [*(id *)(a1 + 32) servicePort];
        v9 = sub_100005BBC(*(unsigned __int8 *)(a1 + 81), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v6);
        int v14 = 138413058;
        id v15 = v7;
        __int16 v16 = 2048;
        id v17 = v8;
        __int16 v18 = 2048;
        uint64_t v19 = v6;
        __int16 v20 = 2112;
        v21 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) IDS->LOCAL: %ld bytes sent.%@", (uint8_t *)&v14, 0x2Au);
      }
    }
    return;
  }
  ssize_t v10 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) + v5;
LABEL_23:
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v10;
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
  if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    v11 = [*(id *)(a1 + 32) serviceName];
    id v12 = [*(id *)(a1 + 32) servicePort];
    v13 = sub_100005BBC(*(unsigned __int8 *)(a1 + 81), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v6);
    int v14 = 138413058;
    id v15 = v11;
    __int16 v16 = 2048;
    id v17 = v12;
    __int16 v18 = 2048;
    uint64_t v19 = v6;
    __int16 v20 = 2112;
    v21 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) IDS->LOCAL: %ld bytes sent. Write buffer full.%@", (uint8_t *)&v14, 0x2Au);
  }
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  dispatch_resume(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
}

void sub_100006394(uint64_t a1)
{
  uint64_t v2 = *(NSObject **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v2) {
    dispatch_source_cancel(v2);
  }
  ssize_t v3 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v3) {
    dispatch_source_cancel(v3);
  }
  ssize_t v4 = [*(id *)(a1 + 32) bridgeCompletion];
  v4[2]();

  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 24);
  if (v6)
  {
    free(v6);
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  }
  *(void *)(v5 + 24) = 0;
}

void sub_10000641C(uint64_t a1)
{
  if (*(uint64_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) < 1) {
    return;
  }
  uint64_t v2 = (id *)(a1 + 32);
  ssize_t v3 = send((int)[*(id *)(a1 + 32) localSocket], *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24), 0);
  if (!v3)
  {
    if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000D3CC((uint64_t)v2);
    }
    goto LABEL_20;
  }
  uint64_t v4 = v3;
  if (v3 < 0 && *__error() != 35)
  {
    if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000D518((uint64_t)v2);
    }
LABEL_20:
    dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    return;
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v4 == *(void *)(v5 + 24))
  {
    *(void *)(v5 + 24) = 0;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                            + 24);
    if (*(unsigned char *)(a1 + 80))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        v9 = [*(id *)(a1 + 32) serviceName];
        id v10 = [*(id *)(a1 + 32) servicePort];
        v11 = sub_100005BBC(*(unsigned __int8 *)(a1 + 81), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v4);
        int v12 = 138413058;
        v13 = v9;
        __int16 v14 = 2048;
        id v15 = v10;
        __int16 v16 = 2048;
        uint64_t v17 = v4;
        __int16 v18 = 2112;
        uint64_t v19 = v11;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) IDS->LOCAL: %ld bytes sent from write src.%@", (uint8_t *)&v12, 0x2Au);
      }
    }
    dispatch_suspend(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 72) + 8) + 40));
    dispatch_resume(*(dispatch_object_t *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  }
  else if (v4 < 1)
  {
    if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000D458(v2);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v4;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) -= v4;
    if (*(unsigned char *)(a1 + 80) && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [*(id *)(a1 + 32) serviceName];
      id v7 = [*(id *)(a1 + 32) servicePort];
      id v8 = sub_100005BBC(*(unsigned __int8 *)(a1 + 81), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v4);
      int v12 = 138413058;
      v13 = v6;
      __int16 v14 = 2048;
      id v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = v4;
      __int16 v18 = 2112;
      uint64_t v19 = v8;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) IDS->LOCAL: %ld bytes sent from write src unfinished.%@", (uint8_t *)&v12, 0x2Au);
    }
  }
}

id sub_10000682C()
{
  uint64_t v2 = *v0;
  return [v2 servicePort];
}

void sub_100006844(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100006860(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t sub_1000068A8(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t sub_1000068B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 - 24) = a2;
  return *(void *)a1;
}

void sub_1000071E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id location)
{
  objc_destroyWeak(v46);
  objc_destroyWeak(v45);
  objc_destroyWeak(v44);
  objc_destroyWeak(v43);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007284(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = NRPairedDeviceRegistryDeviceDidPairNotification;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Notification: %@", (uint8_t *)&v8, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained handlePairingNotification:v3];
    uint64_t v6 = [v5 service];
    id v7 = [v6 devices];
    [v5 checkNearbyDevices:v7];
  }
}

void sub_100007394(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v4) {
    sub_10000D5B4(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained handlePairingNotification:v3];
    __int16 v14 = [v13 service];
    id v15 = [v14 devices];
    [v13 checkNearbyDevices:v15];
  }
}

void sub_100007434(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v4) {
    sub_10000D634(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v14 = [WeakRetained service];
    id v15 = [v14 devices];
    [v13 checkNearbyDevices:v15];
  }
}

void sub_1000074C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v4) {
    sub_10000D6B4(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    __int16 v14 = [WeakRetained service];
    id v15 = [v14 devices];
    [v13 checkNearbyDevices:v15];
  }
}

void sub_100007F4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000082C4(id a1)
{
  qword_100019FF0 = objc_alloc_init(CPXIDSRelayCompanion);

  _objc_release_x1();
}

void sub_1000083EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100008584(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000D9B0(a1, v2, v3, v4, v5, v6, v7, v8);
  }
  [*(id *)(a1 + 40) stopTimerForUDID:*(void *)(a1 + 32)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

id sub_100008720(uint64_t a1)
{
  xpc_transaction_begin();
  if (*(unsigned char *)(a1 + 48))
  {
    if (!*(unsigned char *)(a1 + 49))
    {
      uint64_t v2 = [*(id *)(a1 + 32) wifiPortConnections];
      id v3 = [v2 count];

      if (!v3)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "WiFi preferred client connection: Enabling preferWifi for data forwarding to gizmo.", buf, 2u);
        }
        uint64_t v4 = +[CPXIDSRelayCompanion defaultCPXIDSRelayCompanion];
        uint64_t v5 = [v4 service];
        [v5 setPreferInfraWiFi:1];
LABEL_12:
      }
    }
  }
  else if (!*(unsigned char *)(a1 + 49))
  {
    uint64_t v6 = [*(id *)(a1 + 32) highPriorityPortConnections];
    id v7 = [v6 count];

    if (!v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Bluetooth preferred client connection: Enabling BT Classic", buf, 2u);
      }
      uint64_t v4 = [*(id *)(a1 + 32) service];
      uint64_t v14 = IDSLinkPreferenceOptionPacketsPerSecondKey;
      id v15 = &off_1000152E8;
      uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
      [v4 setLinkPreferences:v5];
      goto LABEL_12;
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 49);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)CPXIDSRelayCompanion;
  return [super acquirePort:v8 isLowPriority:v9 preferWifi:v10];
}

void sub_100008980(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 49);
  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)CPXIDSRelayCompanion;
  if (!objc_msgSendSuper2(&v12, "releasePort:isLowPriority:preferWifi:", v2, v3, v4)
    && *(void *)(a1 + 40) != 62078)
  {
    [*(id *)(a1 + 32) teardownListeningSocket:];
  }
  if (*(unsigned char *)(a1 + 49))
  {
    if (!*(unsigned char *)(a1 + 48))
    {
      uint64_t v5 = [*(id *)(a1 + 32) wifiPortConnections];
      id v6 = [v5 count];

      if (!v6)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Wifi preferred client connection: Disabling preferWifi for data forwarding to gizmo.", v11, 2u);
        }
        id v7 = +[CPXIDSRelayCompanion defaultCPXIDSRelayCompanion];
        uint64_t v8 = [v7 service];
        [v8 setPreferInfraWiFi:0];
LABEL_15:
      }
    }
  }
  else if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v9 = [*(id *)(a1 + 32) highPriorityPortConnections];
    id v10 = [v9 count];

    if (!v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Bluetooth preferred client connection: Disabling BT Classic, Entering LE", v11, 2u);
      }
      id v7 = [*(id *)(a1 + 32) service];
      uint64_t v13 = IDSLinkPreferenceOptionPacketsPerSecondKey;
      uint64_t v14 = &off_100015300;
      uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      [v7 setLinkPreferences:v8];
      goto LABEL_15;
    }
  }
  xpc_transaction_end();
}

void sub_10000932C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  objc_sync_exit(v30);
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

void sub_100009378(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = [v2 service];
  LOBYTE(v3) = *(unsigned char *)(a1 + 67);
  [v2 acceptConnection:v4 socket:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) targetPort:*(unsigned __int16 *)(a1 + 64) serviceName:*(void *)(a1 + 40) requiredHostIP:*(void *)(a1 + 48) isLowPriority:*(unsigned __int8 *)(a1 + 66) preferWifi:v3];
}

void sub_1000093F4(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    int v3 = *(unsigned __int16 *)(a1 + 64);
    uint64_t v4 = *(unsigned __int16 *)(a1 + 66);
    int v11 = 138412802;
    *(void *)objc_super v12 = v2;
    *(_WORD *)&v12[8] = 1024;
    *(_DWORD *)&v12[10] = v3;
    __int16 v13 = 2048;
    uint64_t v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Stop accepting %@ connections from companion port %d to gizmo port %lu", (uint8_t *)&v11, 0x1Cu);
  }
  if (close(*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) < 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *__error();
    id v6 = __error();
    id v7 = strerror(*v6);
    int v11 = 67109378;
    *(_DWORD *)objc_super v12 = v5;
    *(_WORD *)&v12[4] = 2080;
    *(void *)&v12[6] = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "localSocket conn close error: %d (%s)", (uint8_t *)&v11, 0x12u);
  }
  uint64_t v8 = [*(id *)(a1 + 40) connectionSources];
  objc_sync_enter(v8);
  uint64_t v9 = [*(id *)(a1 + 40) connectionSources];
  [v9 removeObjectForKey:*(void *)(a1 + 48)];

  objc_sync_exit(v8);
  id v10 = [*(id *)(a1 + 40) connectionSourceGroup];
  dispatch_group_leave(v10);
}

void sub_100009598(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009730(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100009E4C(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error sending message!", (uint8_t *)&v5, 2u);
  }
  uint64_t v2 = [*(id *)(a1 + 32) connectionMap];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) releasePort:*(void *)(a1 + 56) isLowPriority:*(unsigned __int8 *)(a1 + 68) preferWifi:*(unsigned __int8 *)(a1 + 69)];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 48);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ending connection for service: %@", (uint8_t *)&v5, 0xCu);
  }
  return close(*(_DWORD *)(a1 + 64));
}

void sub_10000A3E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t sub_10000A434(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000A444(uint64_t a1)
{
}

void sub_10000A44C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5 && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20[0] = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create IDSDeviceConnection: %@", buf, 0xCu);
    }
    if (close(*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) < 0
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *__error();
      id v7 = __error();
      uint64_t v8 = strerror(*v7);
      *(_DWORD *)buf = 67109378;
      LODWORD(v20[0]) = v6;
      WORD2(v20[0]) = 2080;
      *(void *)((char *)v20 + 6) = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "localSocket IDS close error: %d (%s)", buf, 0x12u);
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v20[0] = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ending connection for service: %@", buf, 0xCu);
    }
    [*(id *)(a1 + 40) releasePort:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) isLowPriority:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) preferWifi:*(unsigned __int8 *)(a1 + 96)];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000DAC8((void *)a1);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000A710;
    v15[3] = &unk_1000146C0;
    uint64_t v10 = *(void *)(a1 + 72);
    long long v11 = *(_OWORD *)(a1 + 56);
    v15[4] = *(void *)(a1 + 40);
    v15[5] = v10;
    long long v12 = *(_OWORD *)(a1 + 80);
    long long v16 = v11;
    long long v17 = v12;
    char v18 = *(unsigned char *)(a1 + 96);
    __int16 v13 = objc_retainBlock(v15);
    uint64_t v14 = [[CPXConnection alloc] initWithIDSDeviceConnection:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) idsMessageContext:*(void *)(a1 + 48) localSocket:*(unsigned int *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) bridgeSocket:a2 localCompletion:v13 bridgeCompletion:&stru_1000146E0 serviceName:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) servicePort:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    [*(id *)(a1 + 40) handleGenericCPXConnection:v14];
  }
}

id sub_10000A710(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000DB8C(a1, v2, v3, v4, v5, v6, v7, v8);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) close];
  if (close(*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) < 0
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *__error();
    uint64_t v10 = __error();
    long long v11 = strerror(*v10);
    int v14 = 67109378;
    LODWORD(v15[0]) = v9;
    WORD2(v15[0]) = 2080;
    *(void *)((char *)v15 + 6) = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "localSocket completion close error: %d (%s)", (uint8_t *)&v14, 0x12u);
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    int v14 = 138412290;
    v15[0] = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Ending connection for service: %@", (uint8_t *)&v14, 0xCu);
  }
  return [*(id *)(a1 + 32) releasePort:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) isLowPriority:*(unsigned __int8 *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) preferWifi:*(unsigned __int8 *)(a1 + 80)];
}

void sub_10000A88C(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000DC0C();
  }
}

id sub_10000ACAC(uint64_t a1, _DWORD *a2)
{
  int v3 = lockdown_receive_message();
  if (a2) {
    *a2 = v3;
  }

  return 0;
}

BOOL sub_10000AD40(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v4 = lockdown_send_message();
  if (a3) {
    *a3 = v4;
  }
  return v4 == 0;
}

void sub_10000AD78(uint64_t a1, uint64_t a2)
{
  CFStringRef v4 = @"Error";
  uint64_t v5 = a2;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  int v3 = lockdown_send_message();

  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_10000DC54(v3);
    }
  }
}

id sub_10000AE34(int a1, char *a2)
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  sockaddr v26 = (sockaddr)0;
  long long v27 = 0u;
  socklen_t v15 = 128;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  *(_OWORD *)char v18 = 0u;
  long long v19 = 0u;
  if (!a2)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    uint64_t v6 = "out_IPv6 can't be NULL";
LABEL_10:
    uint32_t v7 = 2;
    goto LABEL_11;
  }
  if (a1 < 0)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    uint64_t v6 = "Invalid socket";
    goto LABEL_10;
  }
  if (getpeername(a1, &v26, &v15))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *__error();
      CFStringRef v4 = __error();
      uint64_t v5 = strerror(*v4);
      *(_DWORD *)buf = 67109378;
      LODWORD(v17[0]) = v3;
      WORD2(v17[0]) = 2080;
      *(void *)((char *)v17 + 6) = v5;
      uint64_t v6 = "getpeername failed: %d (%s)";
      uint32_t v7 = 18;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, buf, v7);
    }
LABEL_12:
    uint64_t v8 = 0;
    goto LABEL_13;
  }
  if (v26.sa_family == 30)
  {
    if (inet_ntop(30, &v26.sa_data[6], v18, 0x80u))
    {
      char v10 = 1;
      goto LABEL_22;
    }
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    __int16 v13 = __error();
    int v14 = strerror(*v13);
    *(_DWORD *)buf = 136315138;
    v17[0] = v14;
    uint64_t v6 = "Can't convert to ipv6 string: %s";
LABEL_29:
    uint32_t v7 = 12;
    goto LABEL_11;
  }
  if (v26.sa_family != 2)
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    *(_DWORD *)buf = 67109120;
    LODWORD(v17[0]) = v26.sa_family;
    uint64_t v6 = "Unknown socket family %d";
    uint32_t v7 = 8;
    goto LABEL_11;
  }
  if (!inet_ntop(2, &v26.sa_data[2], v18, 0x80u))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    long long v11 = __error();
    uint64_t v12 = strerror(*v11);
    *(_DWORD *)buf = 136315138;
    v17[0] = v12;
    uint64_t v6 = "Can't convert to ipv4 string: %s";
    goto LABEL_29;
  }
  char v10 = 0;
LABEL_22:
  *a2 = v10;
  uint64_t v8 = +[NSString stringWithUTF8String:v18];
LABEL_13:

  return v8;
}

uint64_t start()
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000DCD4();
  }
  signal(15, (void (__cdecl *)(int))1);
  v0 = dispatch_get_global_queue(0, 0);
  uint64_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v0);

  if (v1)
  {
    dispatch_source_set_event_handler(v1, &stru_100014728);
    dispatch_resume(v1);
  }
  lockdown_checkin_xpc();
  CFRunLoopRun();

  return 0;
}

void sub_10000B1E4(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got SIGTERM, performing shutdown.", buf, 2u);
  }
  uint64_t v1 = +[CPXIDSRelayCompanion defaultCPXIDSRelayCompanion];
  [v1 teardownAllListeningSockets];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got SIGTERM, exiting now.", v2, 2u);
  }
  exit(0);
}

void sub_10000B29C(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  v92 = objc_opt_new();
  uint64_t v93 = 0;
  v94 = &v93;
  uint64_t v95 = 0x2020000000;
  int v96 = 0;
  if ((MGGetBoolAnswer() & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)handler = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "companion_proxy is incompatible with this device", handler, 2u);
    }
    sub_10000AD78((uint64_t)a2, @"UnsupportedDevice");
    v86 = 0;
    goto LABEL_28;
  }
  v86 = CFDictionaryGetValue(a3, kLockdownCheckinClientNameKey);
  uint64_t v5 = sub_10000ACAC((uint64_t)a2, (_DWORD *)v94 + 6);
  v88 = v5;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = *((_DWORD *)v94 + 6);
      *(_DWORD *)handler = 138412546;
      *(void *)&handler[4] = v86;
      *(_WORD *)&handler[12] = 1024;
      *(_DWORD *)&handler[14] = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive initial message from client %@: 0x08%x", handler, 0x12u);
    }
    sub_10000AD78((uint64_t)a2, @"NoInitialMessage");
LABEL_28:
    id obj = 0;
    v87 = 0;
    v88 = 0;
LABEL_29:
    v89 = 0;
LABEL_30:
    lockdown_disconnect();
    goto LABEL_31;
  }
  v89 = [v5 objectForKeyedSubscript:@"Command"];
  if (!v89)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)handler = 138412546;
      *(void *)&handler[4] = v86;
      *(_WORD *)&handler[12] = 2112;
      *(void *)&handler[14] = v88;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive command in message from %@: %@", handler, 0x16u);
    }
    sub_10000AD78((uint64_t)a2, @"NoCommandInMessage");
    id obj = 0;
    v87 = 0;
    goto LABEL_29;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_10000DD70((uint64_t)v89);
  }
  v87 = +[NRPairedDeviceRegistry sharedInstance];
  id obj = [v87 getDevices];
  if ([v89 isEqualToString:@"GetDeviceRegistry"])
  {
    long long v103 = 0u;
    long long v104 = 0u;
    *(_OWORD *)v101 = 0u;
    long long v102 = 0u;
    id obj = obj;
    id v6 = [obj countByEnumeratingWithState:v101 objects:handler count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v102;
      uint64_t v8 = NRDevicePropertyUDID;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v102 != v7) {
            objc_enumerationMutation(obj);
          }
          char v10 = *(void **)(*(void *)&v101[8] + 8 * i);
          long long v11 = [v10 valueForProperty:v8];
          if (v11)
          {
            [v92 addObject:v11];
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v10;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got nil UDID from device %@", buf, 0xCu);
          }
        }
        id v6 = [obj countByEnumeratingWithState:v101 objects:handler count:16];
      }
      while (v6);
    }

    if ([v92 count])
    {
      *(void *)v106 = @"PairedDevicesArray";
      v111 = v92;
      uint64_t v12 = +[NSDictionary dictionaryWithObjects:&v111 forKeys:v106 count:1];
      if (!sub_10000AD40(v84, (uint64_t)v12, (_DWORD *)v94 + 6)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *((_DWORD *)v94 + 6);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send devices message (%@): 0x%08x", buf, 0x12u);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Companion has no paired devices", buf, 2u);
      }
      sub_10000AD78(v84, @"NoPairedWatches");
      uint64_t v12 = 0;
    }

    goto LABEL_30;
  }
  if (![v89 isEqualToString:@"GetValueFromRegistry"])
  {
    if ([v89 isEqualToString:@"StartListeningForDevices"])
    {
      sockaddr v26 = [[CPXService alloc] initWithLockdownContext:a2];
      unsigned int socket = lockdown_get_socket();
      if ((socket & 0x80000000) == 0)
      {
        [(CPXService *)v26 startService];
        long long v28 = dispatch_get_global_queue(0, 0);
        dispatch_source_t v29 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, socket, 0, v28);

        *(void *)handler = _NSConcreteStackBlock;
        *(void *)&handler[8] = 3221225472;
        *(void *)&handler[16] = sub_10000C900;
        v118 = &unk_1000147B8;
        long long v30 = v26;
        dispatch_source_t v120 = v29;
        v121 = &v93;
        v119 = v30;
        long long v31 = v29;
        dispatch_source_set_event_handler(v31, handler);
        *(void *)v101 = _NSConcreteStackBlock;
        *(void *)&v101[8] = 3221225472;
        *(void *)&long long v102 = sub_10000C9DC;
        *((void *)&v102 + 1) = &unk_1000147E0;
        *(void *)&long long v103 = v30;
        long long v32 = v30;
        dispatch_source_set_cancel_handler(v31, v101);
        dispatch_resume(v31);

        goto LABEL_31;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)handler = 138412290;
        *(void *)&handler[4] = v86;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get socket for connection from client %@", handler, 0xCu);
      }
      sub_10000AD78((uint64_t)a2, @"NoSocket");
    }
    else if ([v89 isEqualToString:@"StartForwardingServicePort"])
    {
      LOBYTE(v111) = 0;
      int v33 = lockdown_get_socket();
      v34 = sub_10000AE34(v33, (char *)&v111);
      if (v34)
      {
        v35 = [v88 objectForKeyedSubscript:@"PreferWifi"];
        int v36 = _NSIsNSNumber();

        if (v36)
        {
          v37 = [v88 objectForKeyedSubscript:@"PreferWifi"];
          id v38 = [v37 BOOLValue];
        }
        else
        {
          id v38 = 0;
        }
        v59 = [v88 objectForKeyedSubscript:@"GizmoRemotePortNumber"];
        if (v59)
        {
          v60 = [v88 objectForKeyedSubscript:@"IsServiceLowPriority"];
          id v61 = [v60 BOOLValue];

          v62 = [v88 objectForKeyedSubscript:@"ForwardedServiceName"];
          v63 = +[CPXIDSRelayCompanion defaultCPXIDSRelayCompanion];
          id v64 = [v59 unsignedShortValue];
          v65 = [v63 setupListeningSocket:v64 serviceName:v62 requiredHostIP:v34 ipV6:v111 isLowPriority:v61 preferWifi:v38];

          if (v65)
          {
            *(void *)v101 = @"Command";
            *(void *)&v101[8] = @"CompanionProxyServicePort";
            *(void *)handler = @"CompanionServiceSetup";
            *(void *)&handler[8] = v65;
            v66 = +[NSDictionary dictionaryWithObjects:handler forKeys:v101 count:2];
            BOOL v67 = sub_10000AD40(v84, (uint64_t)v66, (_DWORD *)v94 + 6);

            if (!v67 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              int v68 = *((_DWORD *)v94 + 6);
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v68;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send companion service setup message: 0x%08x", buf, 8u);
            }
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)handler = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to setup forwarding port", handler, 2u);
            }
            sub_10000AD78(v84, @"ServiceProxySetup");
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)handler = 138412546;
            *(void *)&handler[4] = v86;
            *(_WORD *)&handler[12] = 2112;
            *(void *)&handler[14] = v88;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive port number in message from %@: %@", handler, 0x16u);
          }
          sub_10000AD78(v84, @"MalformedCommand");
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)handler = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to get required host IP", handler, 2u);
        }
        sub_10000AD78((uint64_t)a2, @"ServiceProxySetup");
      }
    }
    else if ([v89 isEqualToString:@"StopForwardingServicePort"])
    {
      v40 = [v88 objectForKeyedSubscript:@"GizmoRemotePortNumber"];
      if (v40)
      {
        v41 = +[CPXIDSRelayCompanion defaultCPXIDSRelayCompanion];
        [v41 teardownListeningSocket:[v40 unsignedIntegerValue]];

        id v42 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v43 = [v40 intValue];
          *(_DWORD *)handler = 67109120;
          *(_DWORD *)&handler[4] = v43;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Stopped forwarding to gizmo port %d", handler, 8u);
        }

        *(void *)v101 = @"Command";
        *(void *)handler = @"ComandSuccess";
        v44 = +[NSDictionary dictionaryWithObjects:handler forKeys:v101 count:1];
        BOOL v45 = sub_10000AD40(v84, (uint64_t)v44, (_DWORD *)v94 + 6);

        if (!v45 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          int v46 = *((_DWORD *)v94 + 6);
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = v46;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send companion service setup message: 0x%08x", buf, 8u);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)handler = 138412546;
          *(void *)&handler[4] = v86;
          *(_WORD *)&handler[12] = 2112;
          *(void *)&handler[14] = v88;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to receive port number in message from %@: %@", handler, 0x16u);
        }
        sub_10000AD78((uint64_t)a2, @"MalformedCommand");
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)handler = 138412546;
        *(void *)&handler[4] = v86;
        *(_WORD *)&handler[12] = 2112;
        *(void *)&handler[14] = v89;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unsupported command from %@: %@", handler, 0x16u);
      }
      sub_10000AD78((uint64_t)a2, @"UnsupportedCommand");
    }
    goto LABEL_30;
  }
  v111 = 0;
  v112 = &v111;
  uint64_t v113 = 0x3032000000;
  v114 = sub_10000C710;
  v115 = sub_10000C720;
  id v116 = 0;
  socklen_t v15 = [v88 objectForKeyedSubscript:@"GetValueGizmoUDIDKey"];
  if (!v15)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)handler = 138412546;
      *(void *)&handler[4] = v86;
      *(_WORD *)&handler[12] = 2112;
      *(void *)&handler[14] = v88;
      v39 = "Failed to receive gizmoUDID in message from %@: %@.";
LABEL_80:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v39, handler, 0x16u);
    }
LABEL_81:
    sub_10000AD78((uint64_t)a2, @"MalformedCommand");
    v57 = 0;
    id v47 = 0;
    v50 = 0;
    id v17 = 0;
    goto LABEL_82;
  }
  uint64_t v16 = [v88 objectForKeyedSubscript:@"GetValueKeyKey"];
  if (!v16)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)handler = 138412546;
      *(void *)&handler[4] = v86;
      *(_WORD *)&handler[12] = 2112;
      *(void *)&handler[14] = v88;
      v39 = "Failed to receive GetValueKey in message from %@: %@";
      goto LABEL_80;
    }
    goto LABEL_81;
  }
  id v17 = (id)v16;
  long long v109 = 0u;
  long long v110 = 0u;
  memset(buf, 0, sizeof(buf));
  id v18 = obj;
  id v19 = [v18 countByEnumeratingWithState:buf objects:handler count:16];
  if (v19)
  {
    uint64_t v20 = **(void **)&buf[16];
    uint64_t v21 = NRDevicePropertyUDID;
LABEL_40:
    uint64_t v22 = 0;
    while (1)
    {
      if (**(void **)&buf[16] != v20) {
        objc_enumerationMutation(v18);
      }
      long long v23 = *(void **)(*(void *)&buf[8] + 8 * v22);
      long long v24 = [v23 valueForProperty:v21];
      unsigned __int8 v25 = [v15 isEqualToString:v24];

      if (v25) {
        break;
      }
      if (v19 == (id)++v22)
      {
        id v19 = [v18 countByEnumeratingWithState:buf objects:handler count:16];
        if (v19) {
          goto LABEL_40;
        }
        goto LABEL_46;
      }
    }
    id v47 = v23;

    if (!v47) {
      goto LABEL_74;
    }
    uint64_t v48 = qword_10001A010;
    id v49 = v17;
    if (v48 != -1) {
      dispatch_once(&qword_10001A010, &stru_100014800);
    }
    v50 = [(id)qword_10001A008 valueForKey:v49];

    if (v50)
    {
      if (qword_10001A000)
      {
        v51 = +[NSDate date];
        v52 = [(id)qword_10001A000 objectForKeyedSubscript:@"CPXAboutInfoDateKey"];
        [v51 timeIntervalSinceDate:v52];
        BOOL v54 = v53 < 10.0;

        if (v54)
        {
          uint64_t v55 = [(id)qword_10001A000 objectForKeyedSubscript:v50];
          v56 = v112[5];
          v112[5] = (void *)v55;

LABEL_124:
          v80 = v112[5];
          id v99 = v49;
          *(void *)v100 = v80;
          v57 = +[NSDictionary dictionaryWithObjects:v100 forKeys:&v99 count:1];
          CFStringRef v97 = @"RetrievedValueDictionary";
          v98 = v57;
          v81 = +[NSDictionary dictionaryWithObjects:&v98 forKeys:&v97 count:1];
          BOOL v82 = sub_10000AD40(v84, (uint64_t)v81, (_DWORD *)v94 + 6);

          if (!v82 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            int v83 = *((_DWORD *)v94 + 6);
            *(_DWORD *)v106 = 138412546;
            *(void *)&v106[4] = v57;
            *(_WORD *)&v106[12] = 1024;
            *(_DWORD *)&v106[14] = v83;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to send retrieved value message (%@): 0x%08x", v106, 0x12u);
          }
          int v58 = 0;
          id v17 = v49;
          goto LABEL_83;
        }
      }
      v69 = dispatch_get_global_queue(0, 0);
      id v70 = [objc_alloc((Class)NSSManager) initWithQueue:v69];
      dispatch_semaphore_t v71 = dispatch_semaphore_create(0);
      *(void *)v106 = 0;
      *(void *)&v106[8] = v106;
      *(void *)&v106[16] = 0x2020000000;
      uint64_t v107 = 0;
      *(void *)v101 = _NSConcreteStackBlock;
      *(void *)&v101[8] = 3221225472;
      *(void *)&long long v102 = sub_10000C728;
      *((void *)&v102 + 1) = &unk_100014790;
      *((void *)&v104 + 1) = &v111;
      id v90 = v50;
      *(void *)&long long v103 = v90;
      id v17 = v49;
      *((void *)&v103 + 1) = v17;
      v105 = v106;
      v72 = v71;
      *(void *)&long long v104 = v72;
      [v70 getAboutInfo:v101];
      dispatch_time_t v73 = dispatch_time(0, 5000000000);
      if (dispatch_semaphore_wait(v72, v73))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v100 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timeout waiting for reply from getAboutInfo", v100, 2u);
        }
        CFStringRef v74 = @"TimeoutReply";
      }
      else
      {
        CFStringRef v74 = *(const __CFString **)(*(void *)&v106[8] + 24);
        if (!v74)
        {
          int v58 = 0;
          char v79 = 1;
LABEL_123:

          _Block_object_dispose(v106, 8);
          if ((v79 & 1) == 0)
          {
            v57 = 0;
            v50 = v90;
            goto LABEL_83;
          }
          goto LABEL_124;
        }
      }
      sub_10000AD78(v84, (uint64_t)v74);
      char v79 = 0;
      int v58 = 2;
      goto LABEL_123;
    }
    uint64_t v75 = qword_10001A020;
    id v17 = v49;
    if (v75 != -1) {
      dispatch_once(&qword_10001A020, &stru_100014820);
    }
    v76 = [(id)qword_10001A018 valueForKey:v17];

    uint64_t v77 = [v47 valueForProperty:v76];
    v78 = v112[5];
    v112[5] = (void *)v77;

    if (v112[5]) {
      goto LABEL_124;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v101 = 138412290;
      *(void *)&v101[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unsupported key on a Watch: %@", v101, 0xCu);
    }
    sub_10000AD78(v84, @"UnsupportedWatchKey");
    v57 = 0;
  }
  else
  {
LABEL_46:

LABEL_74:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v101 = 138412290;
      *(void *)&v101[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No gizmo matching UDID: %@", v101, 0xCu);
    }
    sub_10000AD78(v84, @"NoMatchingWatch");
    v57 = 0;
    id v47 = 0;
  }
  v50 = 0;
LABEL_82:
  int v58 = 2;
LABEL_83:

  _Block_object_dispose(&v111, 8);
  if ((v58 | 2) == 2) {
    goto LABEL_30;
  }
LABEL_31:
  _Block_object_dispose(&v93, 8);
}

void sub_10000C680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000C710(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000C720(uint64_t a1)
{
}

void sub_10000C728(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error on reply from getAboutInfo: %@", (uint8_t *)&v17, 0xCu);
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    CFStringRef v8 = @"ErrorReply";
  }
  else
  {
    uint64_t v9 = [v5 objectForKeyedSubscript:*(void *)(a1 + 32)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
    {
      id v12 = [v5 mutableCopy];
      int v13 = (void *)qword_10001A000;
      qword_10001A000 = (uint64_t)v12;

      int v14 = +[NSDate date];
      [(id)qword_10001A000 setObject:v14 forKeyedSubscript:@"CPXAboutInfoDateKey"];

      goto LABEL_8;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      socklen_t v15 = *(void **)(a1 + 40);
      int v17 = 138412546;
      id v18 = v15;
      __int16 v19 = 2112;
      uint64_t v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "NSS value missing for key: %@, %@", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    CFStringRef v8 = @"UnexpectedReply";
  }
  *(void *)(v7 + 24) = v8;
LABEL_8:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10000C900(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) receiveMessageWithError:*(void *)(*(void *)(a1 + 48) + 8) + 24];
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 1
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    CFStringRef v4 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Got unexpected incoming message: %@", (uint8_t *)&v3, 0xCu);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
}

id sub_10000C9DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopService];
}

void sub_10000C9E4(id a1)
{
  v3[0] = @"BatteryIsCharging";
  v3[1] = @"BatteryCurrentCapacity";
  v4[0] = kNSSAboutBatteryIsChargingKey;
  v4[1] = kNSSAboutBatteryCurrentCapacityKey;
  v3[2] = @"AmountDataAvailable";
  v4[2] = kNSSUsageAvailableStorageKey;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  uint64_t v2 = (void *)qword_10001A008;
  qword_10001A008 = v1;
}

void sub_10000CAA4(id a1)
{
  v3[0] = @"HardwareModel";
  v3[1] = @"DeviceName";
  v4[0] = NRDevicePropertyHWModelString;
  v4[1] = NRDevicePropertyName;
  v3[2] = @"DeviceClass";
  void v3[3] = @"BluetoothAddress";
  v4[2] = NRDevicePropertyClass;
  void v4[3] = NRDevicePropertyBluetoothMACAddress;
  v3[4] = @"RegionInfo";
  v3[5] = @"UniqueDeviceID";
  v4[4] = NRDevicePropertyRegionInfo;
  v4[5] = NRDevicePropertyUDID;
  v3[6] = @"ModelNumber";
  v3[7] = @"BuildVersion";
  v4[6] = NRDevicePropertyModelNumber;
  v4[7] = NRDevicePropertySystemBuildVersion;
  v3[8] = @"ProductType";
  v3[9] = @"ProductName";
  v4[8] = NRDevicePropertyProductType;
  v4[9] = NRDevicePropertySystemName;
  v3[10] = @"SerialNumber";
  v3[11] = @"WiFiAddress";
  v4[10] = NRDevicePropertySerialNumber;
  v4[11] = NRDevicePropertyWIFIMACAddress;
  v3[12] = @"ProductVersion";
  v3[13] = @"DeviceColor";
  v4[12] = NRDevicePropertySystemVersion;
  v4[13] = NRDevicePropertyColor;
  v3[14] = @"DeviceEnclosureColor";
  v3[15] = @"TotalDataCapacity";
  v4[14] = NRDevicePropertyEnclosureColor;
  v4[15] = NRDevicePropertyTotalStorage;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:16];
  uint64_t v2 = (void *)qword_10001A018;
  qword_10001A018 = v1;
}

void sub_10000CCA0()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Socket data logging is enabled", v0, 2u);
}

void sub_10000CCE8(void *a1, uint8_t *buf, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Enabled service socket logging for %@", buf, 0xCu);
}

void sub_10000CD44(uint64_t a1)
{
  [(id)sub_1000068A8(a1) serviceName];
  objc_claimAutoreleasedReturnValue();
  sub_10000682C();
  sub_100006814();
  sub_100006844((void *)&_mh_execute_header, &_os_log_default, v2, "%@(%lu) LOCAL->IDS read src closed cleanly on recv", v3, v4, v5, v6, v7);
}

void sub_10000CDD0(uint64_t a1)
{
  [sub_1000068B4(a1, __stack_chk_guard) serviceName];
  objc_claimAutoreleasedReturnValue();
  sub_10000682C();
  uint64_t v2 = __error();
  strerror(*v2);
  sub_1000067F0();
  sub_100006860((void *)&_mh_execute_header, &_os_log_default, v3, "%@(%lu) LOCAL->IDS read src closed with error on recv: %s", v4, v5, v6, v7, v8);
}

void sub_10000CE6C(uint64_t a1)
{
  [(id)sub_1000068A8(a1) serviceName];
  objc_claimAutoreleasedReturnValue();
  sub_10000682C();
  sub_100006814();
  sub_100006844((void *)&_mh_execute_header, &_os_log_default, v2, "%@(%lu) LOCAL->IDS read src closed cleanly on send", v3, v4, v5, v6, v7);
}

void sub_10000CEF8(uint64_t a1)
{
  [sub_1000068B4(a1, __stack_chk_guard) serviceName];
  objc_claimAutoreleasedReturnValue();
  sub_10000682C();
  uint64_t v2 = __error();
  strerror(*v2);
  sub_1000067F0();
  sub_100006860((void *)&_mh_execute_header, &_os_log_default, v3, "%@(%lu) LOCAL->IDS read src closed with error on send: %s", v4, v5, v6, v7, v8);
}

void sub_10000CF94(uint64_t a1)
{
  [(id)sub_1000068A8(a1) serviceName];
  objc_claimAutoreleasedReturnValue();
  sub_10000682C();
  sub_100006814();
  sub_100006844((void *)&_mh_execute_header, &_os_log_default, v2, "%@(%lu) LOCAL->IDS read src closed cleanly on write send", v3, v4, v5, v6, v7);
}

void sub_10000D020(id *a1)
{
  uint64_t v2 = [*a1 serviceName];
  [*a1 servicePort];
  uint64_t v3 = __error();
  strerror(*v3);
  sub_10000687C();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) LOCAL->IDS: %ld return from send : %s", v4, 0x2Au);
}

void sub_10000D0E0(uint64_t a1)
{
  [sub_1000068B4(a1, __stack_chk_guard) serviceName];
  objc_claimAutoreleasedReturnValue();
  sub_10000682C();
  uint64_t v2 = __error();
  strerror(*v2);
  sub_1000067F0();
  sub_100006860((void *)&_mh_execute_header, &_os_log_default, v3, "%@(%lu) LOCAL->IDS read src closed with error on write send: %s", v4, v5, v6, v7, v8);
}

void sub_10000D17C(uint64_t a1)
{
  [(id)sub_1000068A8(a1) serviceName];
  objc_claimAutoreleasedReturnValue();
  sub_10000682C();
  sub_100006814();
  sub_100006844((void *)&_mh_execute_header, &_os_log_default, v2, "%@(%lu) IDS->LOCAL read src closed cleanly on recv", v3, v4, v5, v6, v7);
}

void sub_10000D208(uint64_t a1)
{
  [sub_1000068B4(a1, __stack_chk_guard) serviceName];
  objc_claimAutoreleasedReturnValue();
  sub_10000682C();
  uint64_t v2 = __error();
  strerror(*v2);
  sub_1000067F0();
  sub_100006860((void *)&_mh_execute_header, &_os_log_default, v3, "%@(%lu) IDS->LOCAL read src closed with error on recv: %s", v4, v5, v6, v7, v8);
}

void sub_10000D2A4(uint64_t a1)
{
  [(id)sub_1000068A8(a1) serviceName];
  objc_claimAutoreleasedReturnValue();
  sub_10000682C();
  sub_100006814();
  sub_100006844((void *)&_mh_execute_header, &_os_log_default, v2, "%@(%lu) IDS->LOCAL read src closed cleanly on send", v3, v4, v5, v6, v7);
}

void sub_10000D330(uint64_t a1)
{
  [sub_1000068B4(a1, __stack_chk_guard) serviceName];
  objc_claimAutoreleasedReturnValue();
  sub_10000682C();
  uint64_t v2 = __error();
  strerror(*v2);
  sub_1000067F0();
  sub_100006860((void *)&_mh_execute_header, &_os_log_default, v3, "%@(%lu) IDS->LOCAL read src closed with error on send: %s", v4, v5, v6, v7, v8);
}

void sub_10000D3CC(uint64_t a1)
{
  [(id)sub_1000068A8(a1) serviceName];
  objc_claimAutoreleasedReturnValue();
  sub_10000682C();
  sub_100006814();
  sub_100006844((void *)&_mh_execute_header, &_os_log_default, v2, "%@(%lu) IDS->LOCAL read src closed cleanly on write send", v3, v4, v5, v6, v7);
}

void sub_10000D458(id *a1)
{
  uint64_t v2 = [*a1 serviceName];
  [*a1 servicePort];
  uint64_t v3 = __error();
  strerror(*v3);
  sub_10000687C();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%@(%lu) IDS->LOCAL: %ld return from send : %s", v4, 0x2Au);
}

void sub_10000D518(uint64_t a1)
{
  [sub_1000068B4(a1, __stack_chk_guard) serviceName];
  objc_claimAutoreleasedReturnValue();
  sub_10000682C();
  uint64_t v2 = __error();
  strerror(*v2);
  sub_1000067F0();
  sub_100006860((void *)&_mh_execute_header, &_os_log_default, v3, "%@(%lu) IDS->LOCAL read src closed with error on write send: %s", v4, v5, v6, v7, v8);
}

void sub_10000D5B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D6B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D734(void *a1)
{
  uint64_t v1 = [a1 udid];
  v2[0] = 67109378;
  v2[1] = 1;
  __int16 v3 = 2112;
  uint64_t v4 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "nearbyState changed to %d for %@", (uint8_t *)v2, 0x12u);
}

void sub_10000D7DC(void *a1)
{
  uint64_t v1 = [a1 udid];
  v2[0] = 67109378;
  v2[1] = 0;
  __int16 v3 = 2112;
  uint64_t v4 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "nearbyState changed to %d for %@", (uint8_t *)v2, 0x12u);
}

void sub_10000D880()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Active paired device, but no UDID. Pairing is probably in progress.", v0, 2u);
}

void sub_10000D8C8()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "No activate paired device.", v0, 2u);
}

void sub_10000D910()
{
}

void sub_10000D93C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D9B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DA28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DA9C()
{
  __assert_rtn("-[CPXIDSRelayCompanion teardownAllListeningSockets]", "CPXIDSRelayCompanion.m", 386, "[self.connectionSources count] == 0");
}

void sub_10000DAC8(void *a1)
{
  int v1 = *(_DWORD *)(*(void *)(a1[8] + 8) + 24);
  uint64_t v2 = *(void *)(*(void *)(a1[9] + 8) + 24);
  uint64_t v3 = a1[4];
  uint64_t v4 = *(void *)(*(void *)(a1[10] + 8) + 40);
  v5[0] = 67109890;
  v5[1] = v1;
  __int16 v6 = 2048;
  uint64_t v7 = v2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  __int16 v10 = 2112;
  uint64_t v11 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Created connection to socket %d, port %ld, stream %@ for %@", (uint8_t *)v5, 0x26u);
}

void sub_10000DB8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000DC0C()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Terminating the bridge connection", v0, 2u);
}

void sub_10000DC54(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Could not send error response to host: 0x%08x", (uint8_t *)v1, 8u);
}

void sub_10000DCD4()
{
  int v0 = 136315394;
  int v1 = "Nov 10 2024";
  __int16 v2 = 2080;
  uint64_t v3 = "02:16:26";
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "companion_proxy built at %s %s started", (uint8_t *)&v0, 0x16u);
}

void sub_10000DD70(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received command: %@", (uint8_t *)&v1, 0xCu);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return _NRWatchOSVersionForRemoteDevice();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSIsNSNumber()
{
  return __NSIsNSNumber();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

int close(int a1)
{
  return _close(a1);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
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

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getpeername(a1, a2, a3);
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getsockname(a1, a2, a3);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
}

uint64_t lockdown_checkin_xpc()
{
  return _lockdown_checkin_xpc();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_get_socket()
{
  return _lockdown_get_socket();
}

uint64_t lockdown_receive_message()
{
  return _lockdown_receive_message();
}

uint64_t lockdown_send_message()
{
  return _lockdown_send_message();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return _send(a1, a2, a3, a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bridgeCompletion(void *a1, const char *a2, ...)
{
  return [a1 bridgeCompletion];
}

id objc_msgSend_bridgeSocket(void *a1, const char *a2, ...)
{
  return [a1 bridgeSocket];
}

id objc_msgSend_clientHostIPAddress(void *a1, const char *a2, ...)
{
  return [a1 clientHostIPAddress];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_conn(void *a1, const char *a2, ...)
{
  return [a1 conn];
}

id objc_msgSend_connectionMap(void *a1, const char *a2, ...)
{
  return [a1 connectionMap];
}

id objc_msgSend_connectionSourceGroup(void *a1, const char *a2, ...)
{
  return [a1 connectionSourceGroup];
}

id objc_msgSend_connectionSources(void *a1, const char *a2, ...)
{
  return [a1 connectionSources];
}

id objc_msgSend_connectionTimers(void *a1, const char *a2, ...)
{
  return [a1 connectionTimers];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCPXIDSRelayCompanion(void *a1, const char *a2, ...)
{
  return [a1 defaultCPXIDSRelayCompanion];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_getDevices(void *a1, const char *a2, ...)
{
  return [a1 getDevices];
}

id objc_msgSend_getPairedDevices(void *a1, const char *a2, ...)
{
  return [a1 getPairedDevices];
}

id objc_msgSend_highPriorityPortConnections(void *a1, const char *a2, ...)
{
  return [a1 highPriorityPortConnections];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_ipV6(void *a1, const char *a2, ...)
{
  return [a1 ipV6];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return [a1 isNearby];
}

id objc_msgSend_localCompletion(void *a1, const char *a2, ...)
{
  return [a1 localCompletion];
}

id objc_msgSend_localSocket(void *a1, const char *a2, ...)
{
  return [a1 localSocket];
}

id objc_msgSend_lowPriorityPortConnections(void *a1, const char *a2, ...)
{
  return [a1 lowPriorityPortConnections];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nearby(void *a1, const char *a2, ...)
{
  return [a1 nearby];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_serverPort(void *a1, const char *a2, ...)
{
  return [a1 serverPort];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_servicePort(void *a1, const char *a2, ...)
{
  return [a1 servicePort];
}

id objc_msgSend_serviceStarted(void *a1, const char *a2, ...)
{
  return [a1 serviceStarted];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_startService(void *a1, const char *a2, ...)
{
  return [a1 startService];
}

id objc_msgSend_targetPort(void *a1, const char *a2, ...)
{
  return [a1 targetPort];
}

id objc_msgSend_teardownAllListeningSockets(void *a1, const char *a2, ...)
{
  return [a1 teardownAllListeningSockets];
}

id objc_msgSend_udid(void *a1, const char *a2, ...)
{
  return [a1 udid];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_wifiPortConnections(void *a1, const char *a2, ...)
{
  return [a1 wifiPortConnections];
}