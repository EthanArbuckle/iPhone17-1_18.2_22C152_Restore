void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1BA890154(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __InitIORegistryPropertyProxy_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Init IOKRegistryEntry get property proxy", buf, 2u);
  }
  uint64_t v0 = +[TSXDaemonServiceClient sharedDaemonServiceClient];
  v1 = (void *)gProxyDaemonServiceClient;
  gProxyDaemonServiceClient = v0;

  gIORegistryProxyEnabled = os_parse_boot_arg_int() ^ 1;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    if (gIORegistryProxyEnabled) {
      v2 = "enabled";
    }
    else {
      v2 = "not enabled";
    }
    *(_DWORD *)buf = 136315138;
    v4 = v2;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "timesync_disable_ioregistry_proxy is %s\n", buf, 0xCu);
  }
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_1BA89AE6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void asyncNotificationsCallback(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  v7 = (void *)MEMORY[0x1BA9F1DF0]();
  v8 = +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  uint64_t v9 = [v8 getObject:a1];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    v11 = v10;
    if (a4 == 1)
    {
      if (*(void *)a3 == 1000) {
        [v10 _handleRefreshConnection];
      }
    }
    else if (a4 >= 7)
    {
      [v10 _handleNotification:*a3 withArg1:*((void *)a3 + 1) arg2:*((void *)a3 + 2) arg3:*((void *)a3 + 3) arg4:*((void *)a3 + 4) arg5:*((void *)a3 + 5) arg6:*((void *)a3 + 6)];
    }
  }
}

void sub_1BA8A43E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BA8A587C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8A593C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)TSDCTranslationClock;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_1BA8A5B84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8A5BF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA8A5C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA8A5F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BA8A6384(_Unwind_Exception *a1)
{
  uint64_t v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1BA8A65F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8A6884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8A69D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8A6B74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8A6CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8A6EC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void TSBBBrowseServiceReply(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v15 = (void *)MEMORY[0x1BA9F1DF0]();
  id v16 = a8;
  v17 = v16;
  if (a4)
  {
    v18 = TSBonjourErrorFromErrorCode(a4);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v18 description];
      int v20 = 136315138;
      uint64_t v21 = [v19 UTF8String];
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error browsing services: %s\n", (uint8_t *)&v20, 0xCu);
    }
    [v17 stopBrowsing];
  }
  else if ((a2 & 2) != 0)
  {
    [v16 addedServiceWithName:a5 regType:a6 domain:a7 onInterface:a3 withFlags:a2];
  }
  else
  {
    [v16 removedServiceWithName:a5 regType:a6 domain:a7 onInterface:a3 withFlags:a2];
  }
}

void sub_1BA8AA690(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8AA70C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  id v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)TSDCgPTPClock;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BA8AAB94(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8AAC1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t scaledInterval(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  unint64_t v3 = IOTS_uint64mul(a1, a2);
  *((void *)&v6 + 1) = v4;
  *(void *)&long long v6 = v3;
  unint64_t v5 = v6 >> 63;
  uint64_t v7 = (v3 >> 40) & 0x7FFFFF | (v5 << 23);
  unint64_t v8 = v5 >> 41;
  uint64_t v9 = v7 + 1;
  if (v7 == -1) {
    unint64_t v10 = v8 + 1;
  }
  else {
    unint64_t v10 = v8;
  }
  if (v10 >= 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSDCgPTPClock scaledInterval  timeYDelta128 is ridiculously big!\n", v13, 2u);
    }
  }
  else
  {
    *((void *)&v11 + 1) = v10;
    *(void *)&long long v11 = v9;
    return v11 >> 1;
  }
  return v2;
}

void sub_1BA8AB75C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8AB9BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8ABBF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8ABFF8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8AC220(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8AC5DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8AC814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8AC89C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8ACA28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8AE3A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8AE4F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8AE644(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8AE774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8AEDDC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void TSBIResolvedServiceReply(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9, void *a10)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v13 = (void *)MEMORY[0x1BA9F1DF0]();
  id v14 = a10;
  [v14 stopResolve];
  if (a4)
  {
    v15 = TSBonjourErrorFromErrorCode(a4);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v16 = [v15 description];
      int v17 = 136315138;
      uint64_t v18 = [v16 UTF8String];
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error resolving service: %s\n", (uint8_t *)&v17, 0xCu);
    }
  }
  else
  {
    [v14 resolvedWithHostTarget:a6 port:__rev16(a7)];
  }
}

void TSBIGetAddrReply(uint64_t a1, char a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v12 = (void *)MEMORY[0x1BA9F1DF0]();
  id v13 = a8;
  if (a4)
  {
    id v14 = TSBonjourErrorFromErrorCode(a4);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v14 description];
      int v35 = 136315138;
      uint64_t v36 = [v15 UTF8String];
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error resolving service: %s\n", (uint8_t *)&v35, 0xCu);
    }
    goto LABEL_24;
  }
  if ((a2 & 2) != 0)
  {
    int v16 = *(unsigned __int8 *)(a6 + 1);
    if (v16 == 30)
    {
      int v17 = [[TSBonjourIPv6Address alloc] initWithIPv6Address:a6 + 8];
      [v13 setIpv6Address:v17];
      [v13 pokeIPv6Destination];
      uint64_t v22 = [v13 ipv6Addresses];

      v23 = (void *)MEMORY[0x1E4F1CA48];
      if (v22)
      {
        v24 = [v13 ipv6Addresses];
        uint64_t v21 = [v23 arrayWithArray:v24];
      }
      else
      {
        uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
      }
      [v21 addObject:v17];
      [v13 setIpv6Addresses:v21];
      uint64_t v31 = [v13 delegate];
      if (!v31) {
        goto LABEL_21;
      }
      v32 = (void *)v31;
      v33 = [v13 delegate];
      char v34 = objc_opt_respondsToSelector();

      if ((v34 & 1) == 0) {
        goto LABEL_21;
      }
      v29 = [v13 delegate];
      v30 = [v13 node];
      [v29 didResolveIPv6Address:v17 forInterface:v13 ofNode:v30];
    }
    else
    {
      if (v16 != 2) {
        goto LABEL_22;
      }
      int v17 = [[TSBonjourIPv4Address alloc] initWithIPv4Address:bswap32(*(_DWORD *)(a6 + 4))];
      [v13 setIpv4Address:v17];
      uint64_t v18 = [v13 ipv4Addresses];

      uint64_t v19 = (void *)MEMORY[0x1E4F1CA48];
      if (v18)
      {
        int v20 = [v13 ipv4Addresses];
        uint64_t v21 = [v19 arrayWithArray:v20];
      }
      else
      {
        uint64_t v21 = [MEMORY[0x1E4F1CA48] array];
      }
      [v21 addObject:v17];
      [v13 setIpv4Addresses:v21];
      uint64_t v25 = [v13 delegate];
      if (!v25) {
        goto LABEL_21;
      }
      v26 = (void *)v25;
      v27 = [v13 delegate];
      char v28 = objc_opt_respondsToSelector();

      if ((v28 & 1) == 0) {
        goto LABEL_21;
      }
      v29 = [v13 delegate];
      v30 = [v13 node];
      [v29 didResolveIPv4Address:v17 forInterface:v13 ofNode:v30];
    }

LABEL_21:
  }
LABEL_22:
  if ((a2 & 1) == 0) {
    [v13 stopAddressLookup];
  }
LABEL_24:
}

id TSBonjourLocalizedErrorDescription(int a1)
{
  switch(a1)
  {
    case -65568:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Timeout";
      break;
    case -65567:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Polling mode";
      break;
    case -65566:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"No router";
      break;
    case -65565:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"NAT port mapping disabled";
      break;
    case -65564:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"NAT port mapping is unsupported";
      break;
    case -65563:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Service is not running";
      break;
    case -65562:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Transient";
      break;
    case -65561:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Bad Key";
      break;
    case -65560:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Bad Sig";
      break;
    case -65559:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Bad Time";
      break;
    case -65558:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Double NAT";
      break;
    case -65557:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"NAT Traversal";
      break;
    case -65556:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"No such key";
      break;
    case -65555:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"No auth";
      break;
    case -65554:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"No such record";
      break;
    case -65553:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Refused";
      break;
    case -65552:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Bad interface index";
      break;
    case -65551:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Incompatible";
      break;
    case -65550:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Firewall";
      break;
    case -65549:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Invalid";
      break;
    case -65548:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Name conflict";
      break;
    case -65547:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Already registered";
      break;
    case -65546:
      goto LABEL_5;
    case -65545:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Not initialized";
      break;
    case -65544:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Unsupported";
      break;
    case -65543:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Bad flags";
      break;
    case -65542:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Bad state";
      break;
    case -65541:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Bad reference";
      break;
    case -65540:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Bad parameter";
      break;
    case -65539:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"No memory";
      break;
    case -65538:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"No such name";
      break;
    case -65537:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Unknown DNSSD Error";
      break;
    default:
      if (a1)
      {
LABEL_5:
        v1 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v2 = v1;
        unint64_t v3 = @"Undefined DNS SD Error";
      }
      else
      {
        v1 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v2 = v1;
        unint64_t v3 = @"No error.";
      }
      break;
  }
  uint64_t v4 = [v1 localizedStringForKey:v3 value:&stru_1F1441738 table:0];

  return v4;
}

id TSBonjourLocalizedFailureReason(int a1)
{
  switch(a1)
  {
    case -65568:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Timeout";
      break;
    case -65567:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Polling mode";
      break;
    case -65566:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"No router";
      break;
    case -65565:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"NAT port mapping disabled";
      break;
    case -65564:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"NAT port mapping is unsupported";
      break;
    case -65563:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Service is not running";
      break;
    case -65562:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Transient";
      break;
    case -65561:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Bad Key";
      break;
    case -65560:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Bad Sig";
      break;
    case -65559:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Bad Time";
      break;
    case -65558:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Double NAT";
      break;
    case -65557:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"NAT Traversal";
      break;
    case -65556:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"No such key";
      break;
    case -65555:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"No auth";
      break;
    case -65554:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"No such record";
      break;
    case -65553:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Refused";
      break;
    case -65552:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"A bad interface index was provided.";
      break;
    case -65551:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Incompatible";
      break;
    case -65550:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Firewall";
      break;
    case -65549:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Invalid";
      break;
    case -65548:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"The name conflicts with an already registered service";
      break;
    case -65547:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"The service is already registered.";
      break;
    case -65546:
      goto LABEL_5;
    case -65545:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Not initialized";
      break;
    case -65544:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"An unsupported request was made";
      break;
    case -65543:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Bad flags";
      break;
    case -65542:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Bad state";
      break;
    case -65541:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"A bad reference was provided.";
      break;
    case -65540:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"A bad parameter was provided.";
      break;
    case -65539:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Could not allocate memory.";
      break;
    case -65538:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"The requested name does not exist";
      break;
    case -65537:
      v1 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v2 = v1;
      unint64_t v3 = @"Unknown DNSSD Error";
      break;
    default:
      if (a1)
      {
LABEL_5:
        v1 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v2 = v1;
        unint64_t v3 = @"Undefined DNS SD Error";
      }
      else
      {
        v1 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v2 = v1;
        unint64_t v3 = @"No error.";
      }
      break;
  }
  uint64_t v4 = [v1 localizedStringForKey:v3 value:&stru_1F1441738 table:0];

  return v4;
}

id TSBonjourErrorFromErrorCode(int a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = TSBonjourLocalizedErrorDescription(a1);
  unint64_t v3 = TSBonjourLocalizedFailureReason(a1);
  uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28588];
  v9[0] = *MEMORY[0x1E4F28568];
  v9[1] = v5;
  v10[0] = v2;
  v10[1] = v3;
  long long v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  uint64_t v7 = [v4 errorWithDomain:@"DNSSDError" code:a1 userInfo:v6];

  return v7;
}

uint64_t IOTS_uint64mul(uint64_t a1, uint64_t a2)
{
  return a2 * a1;
}

uint64_t operator<<(uint64_t a1, int a2)
{
  uint64_t v2 = *(void *)a1 << a2;
  if (a2 > 63) {
    uint64_t v2 = 0;
  }
  if (a2 == 64) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = v2;
  }
  if (a2) {
    return v3;
  }
  else {
    return *(void *)a1;
  }
}

uint64_t IOTS_add_128(uint64_t a1, uint64_t a2)
{
  return a2 + a1;
}

__n128 IOTS_U128::operator*@<Q0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t v7 = *a2;
  uint64_t v6 = a2[1];
  uint64_t v8 = IOTS_uint64mul(v4, v6);
  uint64_t v10 = v9;
  uint64_t v11 = IOTS_uint64mul(v5, v7);
  uint64_t v13 = v12;
  uint64_t v24 = IOTS_uint64mul(v4, v7);
  uint64_t v25 = v14;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  *(void *)&long long v22 = IOTS_uint64mul(v5, v6);
  *((void *)&v22 + 1) = v15;
  long long v23 = 0uLL;
  IOTS_U256::operator+((unint64_t *)&v24, (unint64_t *)&v22, v28);
  uint64_t v26 = v8;
  uint64_t v27 = v10;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  operator<<(v28, 64, (uint64_t)&v20);
  long long v22 = v20;
  long long v23 = v21;
  long long v21 = 0uLL;
  *(void *)&long long v20 = v11;
  *((void *)&v20 + 1) = v13;
  IOTS_U256::operator+((unint64_t *)&v24, (unint64_t *)&v22, (unint64_t *)&v18);
  __n128 v16 = v19;
  *(_OWORD *)a3 = v18;
  *(__n128 *)(a3 + 16) = v16;
  IOTS_U256::operator+((unint64_t *)a3, (unint64_t *)&v20, (unint64_t *)&v18);
  __n128 result = v19;
  *(_OWORD *)a3 = v18;
  *(__n128 *)(a3 + 16) = result;
  return result;
}

unint64_t *IOTS_U256::operator+@<X0>(unint64_t *result@<X0>, unint64_t *a2@<X1>, unint64_t *a3@<X8>)
{
  unint64_t v3 = result[2];
  unint64_t v4 = a2[2];
  unint64_t v5 = v4 + v3;
  LODWORD(v6) = __CFADD__(v4, v3);
  if (v5 < v4) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v6;
  }
  uint64_t v7 = a2[3] + result[3] + v6;
  unint64_t v9 = *result;
  unint64_t v8 = result[1];
  unint64_t v11 = *a2;
  unint64_t v10 = a2[1];
  unint64_t v12 = *a2 + *result;
  LODWORD(v13) = __CFADD__(*a2, *result);
  if (v12 < v11) {
    uint64_t v13 = 1;
  }
  else {
    uint64_t v13 = v13;
  }
  unint64_t v14 = v10 + v8 + v13;
  *a3 = v12;
  a3[1] = v14;
  a3[2] = v5;
  a3[3] = v7;
  if (v10 > v14
    || (v8 == v14 ? (BOOL v15 = v12 >= v9) : (BOOL v15 = 1),
        v15 ? (int v16 = 0) : (int v16 = 1),
        v12 < v11 ? (BOOL v17 = v10 == v14) : (BOOL v17 = 0),
        !v17 ? (BOOL v18 = v8 > v14) : (BOOL v18 = 1),
        !v18 ? (BOOL v19 = v16 == 0) : (BOOL v19 = 0),
        !v19))
  {
    a3[2] = v5 + 1;
    if (v5 == -1) {
      a3[3] = v7 + 1;
    }
  }
  return result;
}

_OWORD *operator<<@<X0>(_OWORD *result@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  long long v3 = result[1];
  *(_OWORD *)a3 = *result;
  *(_OWORD *)(a3 + 16) = v3;
  if (a2)
  {
    int v6 = a2 - 128;
    if (v6)
    {
      if (a2 <= 127)
      {
        unint64_t v7 = operator>>((void *)a3, 128 - a2);
        uint64_t v9 = v8;
        *(void *)(a3 + 16) = operator<<(a3 + 16, a2) | v7;
        *(void *)(a3 + 24) = v10 | v9;
        __n128 result = (_OWORD *)operator<<(a3, a2);
        *(void *)a3 = result;
        *(void *)(a3 + 8) = v11;
        return result;
      }
      __n128 result = (_OWORD *)operator<<(a3, v6);
      *(void *)(a3 + 16) = result;
      *(void *)(a3 + 24) = v12;
    }
    else
    {
      *(_OWORD *)(a3 + 16) = *(_OWORD *)a3;
    }
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
  }
  return result;
}

uint64_t IOTS_U128::operator/(long long *a1, unint64_t *a2)
{
  long long v10 = *a1;
  long long v11 = 0uLL;
  int v3 = 128;
  do
  {
    operator<<(&v10, 1, (uint64_t)&v8);
    long long v11 = v9;
    uint64_t result = v8;
    long long v10 = v8;
    unint64_t v5 = *a2;
    unint64_t v6 = a2[1];
    if (*((void *)&v9 + 1) > v6 || (*((void *)&v9 + 1) == v6 ? (BOOL v7 = (unint64_t)v9 >= v5) : (BOOL v7 = 0), v7))
    {
      long long v11 = v9 - __PAIR128__(v6, v5);
      uint64_t result = v8 | 1;
      *(void *)&long long v10 = v8 | 1;
    }
    --v3;
  }
  while (v3);
  return result;
}

double operator*@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  v4[0] = a2;
  v4[1] = 0;
  *(void *)&double result = IOTS_U128::operator*(a1, v4, a3).n128_u64[0];
  return result;
}

double operator*@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  v4[0] = a1;
  v4[1] = 0;
  *(void *)&double result = IOTS_U128::operator*(v4, a2, a3).n128_u64[0];
  return result;
}

unint64_t operator>>(void *a1, int a2)
{
  unint64_t v2 = a1[1];
  unint64_t v3 = v2 >> a2;
  if (a2 <= 63) {
    unint64_t v3 = (v2 << -(char)a2) | (*a1 >> a2);
  }
  if (a2 == 64) {
    unint64_t v3 = a1[1];
  }
  if (a2) {
    return v3;
  }
  else {
    return *a1;
  }
}

unint64_t TSIntervalXtoIntervalY(unint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!(a1 >> 31) && !HIDWORD(a3)) {
    return (2 * a1 * a3 / a2 + 1) >> 1;
  }
  uint64_t v7 = IOTS_uint64mul(a1, a3);
  *((void *)&v9 + 1) = v8;
  *(void *)&long long v9 = v7;
  long long v15 = v9 * 2;
  *(void *)buf = a2;
  *(void *)&buf[8] = 0;
  uint64_t v10 = IOTS_U128::operator/(&v15, (unint64_t *)buf);
  if (v10 == -1) {
    unint64_t v12 = v11 + 1;
  }
  else {
    unint64_t v12 = v11;
  }
  *((void *)&v13 + 1) = v12;
  *(void *)&long long v13 = v10 + 1;
  uint64_t v6 = v13 >> 1;
  if (v12 >= 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TSIntervalXtoIntervalY  timeYDelta128 is ridiculously big!\n", buf, 2u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(void *)&uint8_t buf[4] = a1;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a2;
      __int16 v17 = 2048;
      unint64_t v18 = a3;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "timeXDelta %llu intervalX %llu intervalY %llu\n", buf, 0x20u);
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v12 >> 1;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "timeYDelta %llx.%016llx\n", buf, 0x16u);
    }
  }
  return v6;
}

uint64_t TSTimeXtoTimeY(unint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = -1;
  if (a4 != -1 && a1 != -1 && a2 != -1)
  {
    if (a1 >= a2) {
      unint64_t v11 = a1 - a2;
    }
    else {
      unint64_t v11 = a2 - a1;
    }
    unint64_t v12 = TSIntervalXtoIntervalY(v11, a3, a5);
    if (a1 >= a2) {
      unint64_t v13 = v12;
    }
    else {
      unint64_t v13 = -(uint64_t)v12;
    }
    return v13 + a4;
  }
  return result;
}

unint64_t __C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t *a5, unint64_t *a6)
{
  unint64_t v10 = IOTS_uint64mul(a1, a2);
  unint64_t v12 = v11;
  unint64_t result = IOTS_uint64mul(a3, a4);
  if (v12 | v14)
  {
    do
    {
      do
      {
        unint64_t v15 = v12;
        *((void *)&v16 + 1) = v12;
        *(void *)&long long v16 = v10;
        unint64_t v10 = v16 >> 1;
        unint64_t v17 = v14;
        v12 >>= 1;
        v14 >>= 1;
        *((void *)&v16 + 1) = v17;
        *(void *)&long long v16 = result;
        unint64_t result = v16 >> 1;
      }
      while (v15 > 1);
    }
    while (v17 > 1);
  }
  if ((v10 | result))
  {
    unint64_t v19 = result;
    unint64_t v18 = v10;
    if (a5) {
LABEL_7:
    }
      *a5 = v18;
  }
  else
  {
    do
    {
      unint64_t v18 = v10 >> 1;
      unint64_t v19 = result >> 1;
      char v20 = v10 | result;
      v10 >>= 1;
      result >>= 1;
    }
    while ((v20 & 2) == 0);
    if (a5) {
      goto LABEL_7;
    }
  }
  if (a6) {
    *a6 = v19;
  }
  return result;
}

unint64_t __C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t *a7, unint64_t *a8)
{
  unint64_t v14 = IOTS_uint64mul(a1, a2);
  unint64_t v16 = v15;
  unint64_t v17 = IOTS_uint64mul(a4, a5);
  if (v16 | v18)
  {
    do
    {
      do
      {
        unint64_t v19 = v16;
        *((void *)&v20 + 1) = v16;
        *(void *)&long long v20 = v14;
        unint64_t v14 = v20 >> 1;
        unint64_t v21 = v18;
        v16 >>= 1;
        v18 >>= 1;
        *((void *)&v20 + 1) = v21;
        *(void *)&long long v20 = v17;
        unint64_t v17 = v20 >> 1;
      }
      while (v19 > 1);
    }
    while (v21 > 1);
  }
  if ((v14 | v17))
  {
    uint64_t v23 = v17;
    uint64_t v22 = v14;
  }
  else
  {
    do
    {
      uint64_t v22 = v14 >> 1;
      uint64_t v23 = v17 >> 1;
      char v24 = v14 | v17;
      v14 >>= 1;
      v17 >>= 1;
    }
    while ((v24 & 2) == 0);
  }
  unint64_t v25 = IOTS_uint64mul(v22, a3);
  unint64_t v27 = v26;
  unint64_t result = IOTS_uint64mul(v23, a6);
  if (v27 | v29)
  {
    do
    {
      do
      {
        unint64_t v30 = v27;
        *((void *)&v31 + 1) = v27;
        *(void *)&long long v31 = v25;
        unint64_t v25 = v31 >> 1;
        unint64_t v32 = v29;
        v27 >>= 1;
        v29 >>= 1;
        *((void *)&v31 + 1) = v32;
        *(void *)&long long v31 = result;
        unint64_t result = v31 >> 1;
      }
      while (v30 > 1);
    }
    while (v32 > 1);
  }
  if ((v25 | result))
  {
    unint64_t v34 = result;
    unint64_t v33 = v25;
    if (a7) {
LABEL_14:
    }
      *a7 = v33;
  }
  else
  {
    do
    {
      unint64_t v33 = v25 >> 1;
      unint64_t v34 = result >> 1;
      char v35 = v25 | result;
      v25 >>= 1;
      result >>= 1;
    }
    while ((v35 & 2) == 0);
    if (a7) {
      goto LABEL_14;
    }
  }
  if (a8) {
    *a8 = v34;
  }
  return result;
}

void sub_1BA8BB200(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8BB2B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BA8BB370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_1BA8BB75C(_Unwind_Exception *a1)
{
  unint64_t v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1BA8BBA74(_Unwind_Exception *a1)
{
  unint64_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_1BA8BC710(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8BC9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BA8BCC24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8BD254(_Unwind_Exception *a1)
{
  unint64_t v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1BA8BD458(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8BD600(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8BE0C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t IIR(IOTS_U128 *a1, IOTS_U128 a2, unsigned int a3)
{
  unint64_t hi = a2.hi;
  unint64_t lo = a2.lo;
  char v7 = a3;
  unint64_t result = operator>>(a1, a3);
  unint64_t v10 = hi >> v7;
  if (a3 > 0x3F)
  {
    unint64_t v11 = 0;
  }
  else
  {
    unint64_t v10 = (hi << -(char)a3) | (lo >> a3);
    unint64_t v11 = hi >> a3;
  }
  if (a3 == 64)
  {
    unint64_t v10 = hi;
    unint64_t v11 = 0;
  }
  if (!a3)
  {
    unint64_t v10 = lo;
    unint64_t v11 = hi;
  }
  unint64_t v12 = a1->lo - result;
  BOOL v13 = __CFADD__(v12, v10);
  unint64_t v14 = v12 + v10;
  unsigned int v15 = v13;
  if (v14 < v12) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = v15;
  }
  unint64_t v17 = ((__PAIR128__(v11 - v9 + a1->hi, a1->lo) - result) >> 64) + v16;
  a1->unint64_t lo = v14;
  a1->unint64_t hi = v17;
  return result;
}

void sub_1BA8C0CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void asyncNotificationsCallback_0(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  char v7 = (void *)MEMORY[0x1BA9F1DF0]();
  uint64_t v8 = +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  uint64_t v9 = [v8 getObject:a1];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    unint64_t v11 = v10;
    if (a4 == 1)
    {
      if (*(void *)a3 == 1000) {
        [v10 _handleRefreshConnection];
      }
    }
    else if (a4 >= 3)
    {
      [v10 _handleNotification:*a3 withArgs:a3 + 2 ofCount:a4 - 1];
    }
  }
}

void TSBARegisterServiceReply(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v13 = (void *)MEMORY[0x1BA9F1DF0]();
  if (a3)
  {
    unint64_t v14 = TSBonjourErrorFromErrorCode(a3);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v14 description];
      int v16 = 136315138;
      uint64_t v17 = [v15 UTF8String];
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error registering service: %s\n", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    [a7 registeredServiceWithName:a4 regType:a5 domain:a6 withFlags:a2];
  }
}

TSClockInterface *TimeSyncClockCreateWithClockIdentifier(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [[TSClockInterface alloc] initWithClockIdentifier:a1];
  if (v2)
  {
    if (TimeSyncClockCreateWithClockIdentifier_onceToken != -1) {
      dispatch_once(&TimeSyncClockCreateWithClockIdentifier_onceToken, &__block_literal_global_157);
    }
    unint64_t v3 = v2;
    *(void *)unint64_t v5 = MEMORY[0x1E4F143A8];
    *(void *)&v5[8] = 3221225472;
    *(void *)&v5[16] = __TimeSyncClockAddRef_block_invoke;
    uint64_t v6 = &__block_descriptor_40_e5_v8__0l;
    *(void *)char v7 = v3;
    dispatch_sync((dispatch_queue_t)_timeSyncClockInterfaceQueue, v5);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)unint64_t v5 = 136316418;
    *(void *)&v5[4] = "newInterface != nil";
    *(_WORD *)&v5[12] = 2048;
    *(void *)&v5[14] = 0;
    *(_WORD *)&v5[22] = 2048;
    uint64_t v6 = 0;
    *(_WORD *)char v7 = 2080;
    *(void *)&v7[2] = "";
    __int16 v8 = 2080;
    uint64_t v9 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v10 = 1024;
    int v11 = 500;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", v5, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)unint64_t v5 = 134218240;
    *(void *)&v5[4] = a1;
    *(_WORD *)&v5[12] = 2048;
    *(void *)&v5[14] = v2;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockCreateWithClockIdentifier(0x%016llx) = %p", v5, 0x16u);
  }

  return v2;
}

uint64_t __TimeSyncClockCreateWithClockIdentifier_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:258];
  v1 = (void *)_timeSyncClockRefs;
  _timeSyncClockRefs = v0;

  _timeSyncClockInterfaceQueue = (uint64_t)dispatch_queue_create("com.apple.timesync.timesyncclockinterface", 0);
  return MEMORY[0x1F41817F8]();
}

void TimeSyncClockDispose(void *a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v9 = 134217984;
    *(void *)&v9[4] = a1;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockDispose(%p)", v9, 0xCu);
  }
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    unint64_t v2 = [a1 clock];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      unint64_t v4 = +[TSClockManager sharedClockManager];
      unint64_t v5 = [a1 clock];
      objc_msgSend(v4, "removeUserFilteredClockWithIdentifier:error:", objc_msgSend(v5, "clockIdentifier"), 0);
    }
    *(void *)uint64_t v9 = MEMORY[0x1E4F143A8];
    *(void *)&v9[8] = 3221225472;
    *(void *)&v9[16] = __TimeSyncClockRemoveRef_block_invoke;
    __int16 v10 = &__block_descriptor_40_e5_v8__0l;
    *(void *)int v11 = a1;
    dispatch_sync((dispatch_queue_t)_timeSyncClockInterfaceQueue, v9);
    if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
    {
      uint64_t v6 = [a1 clock];
      [v6 removeClient:a1];

      char v7 = +[TSClockManager sharedClockManager];
      __int16 v8 = [v7 translationClock];
      [v8 removeClient:a1];
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v9 = 136316418;
      *(void *)&v9[4] = "TimeSyncClockValidRef(clockRef)";
      *(_WORD *)&v9[12] = 2048;
      *(void *)&v9[14] = 0;
      *(_WORD *)&v9[22] = 2048;
      __int16 v10 = 0;
      *(_WORD *)int v11 = 2080;
      *(void *)&v11[2] = "";
      __int16 v12 = 2080;
      BOOL v13 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v14 = 1024;
      int v15 = 528;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", v9, 0x3Au);
    }
    a1 = 0;
  }
}

uint64_t TimeSyncClockValidRef(uint64_t a1)
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __TimeSyncClockValidRef_block_invoke;
  v3[3] = &unk_1E622B360;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync((dispatch_queue_t)_timeSyncClockInterfaceQueue, v3);
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t TimeSyncClockGetHostTimeForClockTime(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    uint64_t v4 = [a1 clock];
    uint64_t v5 = [v4 convertFromDomainToMachAbsoluteTime:a2];
  }
  else
  {
    uint64_t v5 = -1;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316418;
      __int16 v8 = "TimeSyncClockValidRef(clockRef)";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2080;
      __int16 v14 = "";
      __int16 v15 = 2080;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v17 = 1024;
      int v18 = 559;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
    }
  }
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218496;
    __int16 v8 = (const char *)a1;
    __int16 v9 = 2048;
    uint64_t v10 = a2;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetHostTimeForClockTime(%p, %llu) = %llu", (uint8_t *)&v7, 0x20u);
  }
  return v5;
}

uint64_t TimeSyncClockGetClockTimeForHostTime(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    uint64_t v4 = [a1 clock];
    uint64_t v5 = [v4 convertFromMachAbsoluteToDomainTime:a2];
  }
  else
  {
    uint64_t v5 = -1;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316418;
      __int16 v8 = "TimeSyncClockValidRef(clockRef)";
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2048;
      uint64_t v12 = 0;
      __int16 v13 = 2080;
      __int16 v14 = "";
      __int16 v15 = 2080;
      uint64_t v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v17 = 1024;
      int v18 = 581;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
    }
  }
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218496;
    __int16 v8 = (const char *)a1;
    __int16 v9 = 2048;
    uint64_t v10 = a2;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetClockTimeForHostTime(%p, %llu) = %llu", (uint8_t *)&v7, 0x20u);
  }
  return v5;
}

double TimeSyncClockGetClockRate(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    unint64_t v2 = [a1 clock];
    [v2 hostRateRatio];
    double v4 = v3;
  }
  else
  {
    double v4 = 0.0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136316418;
      int v7 = "TimeSyncClockValidRef(clockRef)";
      __int16 v8 = 2048;
      double v9 = 0.0;
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2080;
      __int16 v13 = "";
      __int16 v14 = 2080;
      __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v16 = 1024;
      int v17 = 602;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
    }
  }
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218240;
    int v7 = (const char *)a1;
    __int16 v8 = 2048;
    double v9 = v4;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetClockRate(%p) = %f", (uint8_t *)&v6, 0x16u);
  }
  return v4;
}

uint64_t TimeSyncClockGetClockRateAndAnchors(void *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    __int16 v10 = [a1 clock];
    id v23 = 0;
    char v11 = [v10 getMachAbsoluteRateRatioNumerator:a2 denominator:a3 machAnchor:a4 andDomainAnchor:a5 withError:&v23];
    id v12 = v23;

    if (v11) {
      uint64_t v13 = 0;
    }
    else {
      uint64_t v13 = [v12 code];
    }
  }
  else
  {
    uint64_t v13 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      unint64_t v25 = "TimeSyncClockValidRef(clockRef)";
      __int16 v26 = 2048;
      unint64_t v27 = 0;
      __int16 v28 = 2048;
      unint64_t v29 = 0;
      __int16 v30 = 2080;
      long long v31 = "";
      __int16 v32 = 2080;
      unint64_t v33 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v34 = 1024;
      LODWORD(v35) = 628;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    id v12 = 0;
  }
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = &TSInvalidTime;
    if (a2) {
      __int16 v15 = a2;
    }
    else {
      __int16 v15 = &TSInvalidTime;
    }
    uint64_t v16 = *v15;
    if (a3) {
      int v17 = a3;
    }
    else {
      int v17 = &TSInvalidTime;
    }
    uint64_t v18 = *v17;
    if (a4) {
      uint64_t v19 = a4;
    }
    else {
      uint64_t v19 = &TSInvalidTime;
    }
    uint64_t v20 = *v19;
    if (a5) {
      __int16 v14 = a5;
    }
    uint64_t v21 = *v14;
    *(_DWORD *)buf = 134220288;
    unint64_t v25 = (const char *)a1;
    __int16 v26 = 2048;
    unint64_t v27 = a2;
    __int16 v28 = 2048;
    unint64_t v29 = a3;
    __int16 v30 = 2048;
    long long v31 = (const char *)a4;
    __int16 v32 = 2048;
    unint64_t v33 = (const char *)a5;
    __int16 v34 = 2048;
    uint64_t v35 = v16;
    __int16 v36 = 2048;
    uint64_t v37 = v18;
    __int16 v38 = 2048;
    uint64_t v39 = v20;
    __int16 v40 = 2048;
    uint64_t v41 = v21;
    __int16 v42 = 1024;
    int v43 = v13;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetClockRateAndAnchors(%p, %p, %p, %p, %p) = (%llu, %llu, %llu, %llu) 0x%08x", buf, 0x62u);
  }

  return v13;
}

uint64_t TimeSyncClockGetClockIdentifier(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    unint64_t v2 = [a1 clock];
    uint64_t v3 = [v2 clockIdentifier];
  }
  else
  {
    uint64_t v3 = -1;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136316418;
      int v6 = "TimeSyncClockValidRef(clockRef)";
      __int16 v7 = 2048;
      uint64_t v8 = 0;
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      id v12 = "";
      __int16 v13 = 2080;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v15 = 1024;
      int v16 = 661;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v5, 0x3Au);
    }
  }
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134218240;
    int v6 = (const char *)a1;
    __int16 v7 = 2048;
    uint64_t v8 = v3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetClockIdentifier(%p) = 0x%016llx", (uint8_t *)&v5, 0x16u);
  }
  return v3;
}

uint64_t TimeSyncClockGetLockState(void *a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    unint64_t v2 = [a1 clock];
    uint64_t v3 = [v2 lockState];
  }
  else
  {
    uint64_t v3 = 0;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136316418;
      int v6 = "TimeSyncClockValidRef(clockRef)";
      __int16 v7 = 2048;
      uint64_t v8 = 0;
      __int16 v9 = 2048;
      uint64_t v10 = 0;
      __int16 v11 = 2080;
      id v12 = "";
      __int16 v13 = 2080;
      __int16 v14 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v15 = 1024;
      int v16 = 682;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v5, 0x3Au);
      uint64_t v3 = 0;
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134218240;
    int v6 = (const char *)a1;
    __int16 v7 = 1024;
    LODWORD(v8) = v3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetLockState(%p) = %u", (uint8_t *)&v5, 0x12u);
  }
  return v3;
}

void TimeSyncClockSetLockStateChangeCallback(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    [a1 setLockStateNotificationCallback:a2 refcon:a3];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136316418;
    __int16 v7 = "TimeSyncClockValidRef(clockRef)";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    __int16 v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v16 = 1024;
    int v17 = 700;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218496;
    __int16 v7 = (const char *)a1;
    __int16 v8 = 2048;
    uint64_t v9 = a2;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetLockStateChangeCallback(%p, %p, %p)", (uint8_t *)&v6, 0x20u);
  }
}

void TimeSyncClockSetMasterChangeCallback(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    [a1 setMasterChangeNotificationCallback:a2 refcon:a3];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136316418;
    __int16 v7 = "TimeSyncClockValidRef(clockRef)";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    __int16 v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v16 = 1024;
    int v17 = 718;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218496;
    __int16 v7 = (const char *)a1;
    __int16 v8 = 2048;
    uint64_t v9 = a2;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetMasterChangeCallback(%p, %p, %p)", (uint8_t *)&v6, 0x20u);
  }
}

void TimeSyncClockSetTimeSyncTimeChangeCallback(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    [a1 setTimeSyncTimeChangeNotificationCallback:a2 refcon:a3];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136316418;
    __int16 v7 = "TimeSyncClockValidRef(clockRef)";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    __int16 v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v16 = 1024;
    int v17 = 736;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218496;
    __int16 v7 = (const char *)a1;
    __int16 v8 = 2048;
    uint64_t v9 = a2;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetTimeSyncTimeChangeCallback(%p, %p, %p)", (uint8_t *)&v6, 0x20u);
  }
}

void TimeSyncClockSetConnectionInterruptedCallback(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    int v6 = [a1 clock];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      if (a2)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __TimeSyncClockSetConnectionInterruptedCallback_block_invoke;
        v11[3] = &__block_descriptor_56_e23_v16__0__TSKernelClock_8l;
        v11[4] = a2;
        v11[5] = a1;
        v11[6] = a3;
        __int16 v8 = [a1 clock];
        uint64_t v9 = v8;
        __int16 v10 = v11;
      }
      else
      {
        __int16 v8 = [a1 clock];
        uint64_t v9 = v8;
        __int16 v10 = 0;
      }
      [v8 setInterruptionHandler:v10];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    __int16 v13 = "TimeSyncClockValidRef(clockRef)";
    __int16 v14 = 2048;
    uint64_t v15 = 0;
    __int16 v16 = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2080;
    uint64_t v19 = "";
    __int16 v20 = 2080;
    uint64_t v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v22 = 1024;
    int v23 = 758;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    __int16 v13 = (const char *)a1;
    __int16 v14 = 2048;
    uint64_t v15 = a2;
    __int16 v16 = 2048;
    uint64_t v17 = a3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetConnectionInterruptedCallback(%p, %p, %p)", buf, 0x20u);
  }
}

void __TimeSyncClockSetConnectionInterruptedCallback_block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = (void *)MEMORY[0x1BA9F1DF0]();
  (*(void (**)(void, void))(a1 + 32))(*(void *)(a1 + 40), *(void *)(a1 + 48));
}

id TimeSyncClockCreateAudioClockDeviceUID(void *a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    unint64_t v2 = [a1 clock];
    id v3 = +[TSClockManager timeSyncAudioClockDeviceUIDForClockIdentifier:](TSClockManager, "timeSyncAudioClockDeviceUIDForClockIdentifier:", [v2 clockIdentifier]);

    if (v3)
    {
      CFRetain(v3);
      goto LABEL_4;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136316418;
      __int16 v7 = "result";
      __int16 v8 = 2048;
      id v9 = 0;
      __int16 v10 = 2048;
      uint64_t v11 = 0;
      __int16 v12 = 2080;
      __int16 v13 = "";
      __int16 v14 = 2080;
      uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v16 = 1024;
      int v17 = 794;
      int v5 = MEMORY[0x1E4F14500];
      goto LABEL_11;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136316418;
    __int16 v7 = "TimeSyncClockValidRef(clockRef)";
    __int16 v8 = 2048;
    id v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    __int16 v13 = "";
    __int16 v14 = 2080;
    uint64_t v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v16 = 1024;
    int v17 = 791;
    int v5 = MEMORY[0x1E4F14500];
LABEL_11:
    _os_log_impl(&dword_1BA88B000, v5, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  id v3 = 0;
LABEL_4:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218242;
    __int16 v7 = (const char *)a1;
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockCreateAudioClockDeviceUID(%p) = %@", (uint8_t *)&v6, 0x16u);
  }
  return v3;
}

uint64_t TimeSyncClockGetHostTimeAndGrandmasterIdentityForClockTime(void *a1, uint64_t a2, uint64_t *a3)
{
  __int16 v4 = 0;
  return TimeSyncClockGetHostTimeAndGrandmasterIdentityLocalPortForClockTime(a1, a2, a3, (const char *)&v4);
}

uint64_t TimeSyncClockGetHostTimeAndGrandmasterIdentityLocalPortForClockTime(void *a1, uint64_t a2, uint64_t *a3, const char *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = -1;
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    int v17 = 136316418;
    uint64_t v18 = "TimeSyncClockValidRef(clockRef)";
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2048;
    __int16 v22 = 0;
    __int16 v23 = 2080;
    uint64_t v24 = "";
    __int16 v25 = 2080;
    __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v27 = 1024;
    int v28 = 830;
    __int16 v16 = MEMORY[0x1E4F14500];
    goto LABEL_19;
  }
  id v9 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v11 = [a1 clock];
    uint64_t v8 = [v11 convertFromDomainToMachAbsoluteTime:a2 grandmasterUsed:a3 portNumber:a4];

    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136316418;
    uint64_t v18 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2048;
    __int16 v22 = 0;
    __int16 v23 = 2080;
    uint64_t v24 = "";
    __int16 v25 = 2080;
    __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v27 = 1024;
    int v28 = 832;
    __int16 v16 = MEMORY[0x1E4F14500];
LABEL_19:
    _os_log_impl(&dword_1BA88B000, v16, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v17, 0x3Au);
  }
LABEL_4:
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = &TSNullgPTPClockIdentity;
    if (a3) {
      __int16 v12 = a3;
    }
    __int16 v13 = (const char *)*v12;
    if (a4) {
      int v14 = *(unsigned __int16 *)a4;
    }
    else {
      int v14 = 0xFFFF;
    }
    int v17 = 134219520;
    uint64_t v18 = (const char *)a1;
    __int16 v19 = 2048;
    uint64_t v20 = a2;
    __int16 v21 = 2048;
    __int16 v22 = a3;
    __int16 v23 = 2048;
    uint64_t v24 = a4;
    __int16 v25 = 2048;
    __int16 v26 = v13;
    __int16 v27 = 1024;
    int v28 = v14;
    __int16 v29 = 2048;
    uint64_t v30 = v8;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetHostTimeAndGrandmasterIdentityLocalPortForClockTime(%p, %llu, %p, %p) = (0x%016llx, %hu) %llu", (uint8_t *)&v17, 0x44u);
  }
  return v8;
}

uint64_t TimeSyncClockGetClockTimeAndGrandmasterIdentityForHostTime(void *a1, uint64_t a2, uint64_t *a3)
{
  __int16 v4 = 0;
  return TimeSyncClockGetClockTimeAndGrandmasterIdentityLocalPortForHostTime(a1, a2, a3, (const char *)&v4);
}

uint64_t TimeSyncClockGetClockTimeAndGrandmasterIdentityLocalPortForHostTime(void *a1, uint64_t a2, uint64_t *a3, const char *a4)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = -1;
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    int v17 = 136316418;
    uint64_t v18 = "TimeSyncClockValidRef(clockRef)";
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2048;
    __int16 v22 = 0;
    __int16 v23 = 2080;
    uint64_t v24 = "";
    __int16 v25 = 2080;
    __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v27 = 1024;
    int v28 = 869;
    __int16 v16 = MEMORY[0x1E4F14500];
    goto LABEL_19;
  }
  id v9 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v11 = [a1 clock];
    uint64_t v8 = [v11 convertFromMachAbsoluteToDomainTime:a2 grandmasterUsed:a3 portNumber:a4];

    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136316418;
    uint64_t v18 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2048;
    __int16 v22 = 0;
    __int16 v23 = 2080;
    uint64_t v24 = "";
    __int16 v25 = 2080;
    __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v27 = 1024;
    int v28 = 871;
    __int16 v16 = MEMORY[0x1E4F14500];
LABEL_19:
    _os_log_impl(&dword_1BA88B000, v16, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v17, 0x3Au);
  }
LABEL_4:
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v12 = &TSNullgPTPClockIdentity;
    if (a3) {
      __int16 v12 = a3;
    }
    __int16 v13 = (const char *)*v12;
    if (a4) {
      int v14 = *(unsigned __int16 *)a4;
    }
    else {
      int v14 = 0xFFFF;
    }
    int v17 = 134219520;
    uint64_t v18 = (const char *)a1;
    __int16 v19 = 2048;
    uint64_t v20 = a2;
    __int16 v21 = 2048;
    __int16 v22 = a3;
    __int16 v23 = 2048;
    uint64_t v24 = a4;
    __int16 v25 = 2048;
    __int16 v26 = v13;
    __int16 v27 = 1024;
    int v28 = v14;
    __int16 v29 = 2048;
    uint64_t v30 = v8;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetClockTimeAndGrandmasterIdentityLocalPortForHostTime(%p, %llu, %p, %p) = (0x%016llx, %hu) %llu", (uint8_t *)&v17, 0x44u);
  }
  return v8;
}

uint64_t TimeSyncClockGetClockRateAnchorsAndGrandmasterIdentity(void *a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  __int16 v31 = 0;
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v17 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      unint64_t v33 = "TimeSyncClockValidRef(clockRef)";
      __int16 v34 = 2048;
      uint64_t v35 = 0;
      __int16 v36 = 2048;
      uint64_t v37 = 0;
      __int16 v38 = 2080;
      uint64_t v39 = "";
      __int16 v40 = 2080;
      uint64_t v41 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v42 = 1024;
      LODWORD(v43) = 900;
      __int16 v29 = MEMORY[0x1E4F14500];
LABEL_29:
      _os_log_impl(&dword_1BA88B000, v29, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_30:
    id v16 = 0;
    goto LABEL_6;
  }
  __int16 v12 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v17 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      unint64_t v33 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      __int16 v34 = 2048;
      uint64_t v35 = 0;
      __int16 v36 = 2048;
      uint64_t v37 = 0;
      __int16 v38 = 2080;
      uint64_t v39 = "";
      __int16 v40 = 2080;
      uint64_t v41 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v42 = 1024;
      LODWORD(v43) = 902;
      __int16 v29 = MEMORY[0x1E4F14500];
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  int v14 = [a1 clock];
  id v30 = 0;
  char v15 = [v14 getMachAbsoluteRateRatioNumerator:a2 denominator:a3 machAnchor:a4 andDomainAnchor:a5 forGrandmasterIdentity:a6 portNumber:&v31 withError:&v30];
  id v16 = v30;

  if (v15) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = [v16 code];
  }
LABEL_6:
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = &TSInvalidTime;
    if (a2) {
      __int16 v19 = a2;
    }
    else {
      __int16 v19 = &TSInvalidTime;
    }
    uint64_t v20 = *v19;
    if (a3) {
      __int16 v21 = a3;
    }
    else {
      __int16 v21 = &TSInvalidTime;
    }
    uint64_t v22 = *v21;
    if (a4) {
      __int16 v23 = a4;
    }
    else {
      __int16 v23 = &TSInvalidTime;
    }
    uint64_t v24 = *v23;
    if (a5) {
      uint64_t v18 = a5;
    }
    uint64_t v25 = *v18;
    __int16 v26 = &TSNullgPTPClockIdentity;
    if (a6) {
      __int16 v26 = a6;
    }
    uint64_t v27 = *v26;
    *(_DWORD *)buf = 134220800;
    unint64_t v33 = (const char *)a1;
    __int16 v34 = 2048;
    uint64_t v35 = a2;
    __int16 v36 = 2048;
    uint64_t v37 = a3;
    __int16 v38 = 2048;
    uint64_t v39 = (const char *)a4;
    __int16 v40 = 2048;
    uint64_t v41 = (const char *)a5;
    __int16 v42 = 2048;
    int v43 = a6;
    __int16 v44 = 2048;
    uint64_t v45 = v20;
    __int16 v46 = 2048;
    uint64_t v47 = v22;
    __int16 v48 = 2048;
    uint64_t v49 = v24;
    __int16 v50 = 2048;
    uint64_t v51 = v25;
    __int16 v52 = 2048;
    uint64_t v53 = v27;
    __int16 v54 = 1024;
    int v55 = v17;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetClockRateAnchorsAndGrandmasterIdentity(%p, %p, %p, %p, %p, %p) = (%llu, %llu, %llu, %llu, 0x%016llx) 0x%08x", buf, 0x76u);
  }

  return v17;
}

uint64_t TimeSyncClockGetgPTPGrandmasterIdentity(void *a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = -1;
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_4;
    }
    int v8 = 136316418;
    id v9 = "TimeSyncClockValidRef(clockRef)";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    char v15 = "";
    __int16 v16 = 2080;
    uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v18 = 1024;
    int v19 = 930;
    __int16 v7 = MEMORY[0x1E4F14500];
    goto LABEL_11;
  }
  id v3 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    int v5 = [a1 clock];
    uint64_t v2 = [v5 grandmasterIdentity];

    goto LABEL_4;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136316418;
    id v9 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2048;
    uint64_t v13 = 0;
    __int16 v14 = 2080;
    char v15 = "";
    __int16 v16 = 2080;
    uint64_t v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v18 = 1024;
    int v19 = 932;
    __int16 v7 = MEMORY[0x1E4F14500];
LABEL_11:
    _os_log_impl(&dword_1BA88B000, v7, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
  }
LABEL_4:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218240;
    id v9 = (const char *)a1;
    __int16 v10 = 2048;
    uint64_t v11 = v2;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetgPTPGrandmasterIdentity(%p) = 0x%016llx", (uint8_t *)&v8, 0x16u);
  }
  return v2;
}

void TimeSyncClockSetgPTPGrandmasterChangeCallback(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    [a1 setgPTPGrandmasterNotificationCallback:a2 refcon:a3];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136316418;
    __int16 v7 = "TimeSyncClockValidRef(clockRef)";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = "";
    __int16 v14 = 2080;
    char v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v16 = 1024;
    int v17 = 950;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218496;
    __int16 v7 = (const char *)a1;
    __int16 v8 = 2048;
    uint64_t v9 = a2;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetgPTPGrandmasterChangeCallback(%p, %p, %p)", (uint8_t *)&v6, 0x20u);
  }
}

void TimeSyncClockSetgPTPGrandmasterAndPortChangeCallback(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    [a1 setgPTPGrandmasterIDAndPortNotificationCallback:a2 refcon:a3];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136316418;
    __int16 v7 = "TimeSyncClockValidRef(clockRef)";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = "";
    __int16 v14 = 2080;
    char v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v16 = 1024;
    int v17 = 968;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218496;
    __int16 v7 = (const char *)a1;
    __int16 v8 = 2048;
    uint64_t v9 = a2;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetgPTPGrandmasterAndPortChangeCallback(%p, %p, %p)", (uint8_t *)&v6, 0x20u);
  }
}

void TimeSyncClockSetgPTPLocalPortChangeCallback(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    [a1 setgPTPLocalPortNotificationCallback:a2 refcon:a3];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136316418;
    __int16 v7 = "TimeSyncClockValidRef(clockRef)";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    uint64_t v13 = "";
    __int16 v14 = 2080;
    char v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v16 = 1024;
    int v17 = 986;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218496;
    __int16 v7 = (const char *)a1;
    __int16 v8 = 2048;
    uint64_t v9 = a2;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetgPTPLocalPortChangeCallback(%p, %p, %p)", (uint8_t *)&v6, 0x20u);
  }
}

uint64_t TimeSyncClockAddUDPv4EndToEndPort(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = 0;
  __int16 v4 = 0;
  return TimeSyncClockAddUDPv4EndToEndPortAndGetIdentity(a1, a2, a3, &v5, &v4);
}

uint64_t TimeSyncClockAddUDPv4EndToEndPortAndGetIdentity(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, _WORD *a5)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v24 = "TimeSyncClockValidRef(clockRef)";
    __int16 v25 = 2048;
    uint64_t v26 = 0;
    __int16 v27 = 2048;
    *(void *)int v28 = 0;
    *(_WORD *)&v28[8] = 2080;
    __int16 v29 = "";
    LOWORD(v30) = 2080;
    *(void *)((char *)&v30 + 2) = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    WORD5(v30) = 1024;
    HIDWORD(v30) = 1026;
    __int16 v21 = MEMORY[0x1E4F14500];
LABEL_24:
    _os_log_impl(&dword_1BA88B000, v21, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_25;
  }
  if (!a4)
  {
    uint64_t v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v24 = "clockIdentity != nil";
    __int16 v25 = 2048;
    uint64_t v26 = 0;
    __int16 v27 = 2048;
    *(void *)int v28 = 0;
    *(_WORD *)&v28[8] = 2080;
    __int16 v29 = "";
    LOWORD(v30) = 2080;
    *(void *)((char *)&v30 + 2) = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    WORD5(v30) = 1024;
    HIDWORD(v30) = 1028;
    __int16 v21 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  if (!a5)
  {
    uint64_t v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v24 = "localPortNumber != nil";
    __int16 v25 = 2048;
    uint64_t v26 = 0;
    __int16 v27 = 2048;
    *(void *)int v28 = 0;
    *(_WORD *)&v28[8] = 2080;
    __int16 v29 = "";
    LOWORD(v30) = 2080;
    *(void *)((char *)&v30 + 2) = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    WORD5(v30) = 1024;
    HIDWORD(v30) = 1029;
    __int16 v21 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  __int16 v10 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v16 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v24 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      __int16 v25 = 2048;
      uint64_t v26 = 0;
      __int16 v27 = 2048;
      *(void *)int v28 = 0;
      *(_WORD *)&v28[8] = 2080;
      __int16 v29 = "";
      LOWORD(v30) = 2080;
      *(void *)((char *)&v30 + 2) = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      WORD5(v30) = 1024;
      HIDWORD(v30) = 1031;
      __int16 v21 = MEMORY[0x1E4F14500];
      goto LABEL_24;
    }
LABEL_25:
    char v15 = 0;
    __int16 v12 = 0;
    goto LABEL_8;
  }
  __int16 v12 = [a1 clock];
  id v22 = 0;
  int v13 = [v12 addUnicastUDPv4EtEPortOnInterfaceNamed:a2 withDestinationAddress:a3 allocatedPortNumber:a5 error:&v22];
  id v14 = v22;
  char v15 = v14;
  if (v13)
  {
    uint64_t v16 = 0;
    *a4 = [v12 clockIdentity];
  }
  else
  {
    *a4 = -1;
    *a5 = -1;
    uint64_t v16 = [v14 code];
  }
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v17 = &TSNullClockIdentifier;
    if (a4) {
      int v17 = a4;
    }
    uint64_t v18 = *v17;
    if (a5) {
      int v19 = (unsigned __int16)*a5;
    }
    else {
      int v19 = 0xFFFF;
    }
    *(_DWORD *)buf = 134220546;
    uint64_t v24 = (const char *)a1;
    __int16 v25 = 2112;
    uint64_t v26 = a2;
    __int16 v27 = 1024;
    *(_DWORD *)int v28 = (int)a3 >> 24;
    *(_WORD *)&unint64_t v28[4] = 1024;
    *(_DWORD *)&v28[6] = (int)(a3 << 8) >> 24;
    LOWORD(v29) = 1024;
    *(_DWORD *)((char *)&v29 + 2) = (__int16)a3 >> 8;
    HIWORD(v29) = 1024;
    LODWORD(v30) = (char)a3;
    WORD2(v30) = 2048;
    *(void *)((char *)&v30 + 6) = a4;
    HIWORD(v30) = 2048;
    __int16 v31 = a5;
    __int16 v32 = 2048;
    uint64_t v33 = v18;
    __int16 v34 = 1024;
    int v35 = v19;
    __int16 v36 = 1024;
    int v37 = v16;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockAddUDPv4EndToEndPortAndGetIdentity(%p, %@, %hhu.%hhu.%hhu.%hhu, %p, %p) = (0x%016llx, %hu) 0x%08x", buf, 0x58u);
  }

  return v16;
}

uint64_t TimeSyncClockRemoveUDPv4EndToEndPort(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v17 = "TimeSyncClockValidRef(clockRef)";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2048;
      *(void *)__int16 v21 = 0;
      *(_WORD *)&v21[8] = 2080;
      id v22 = "";
      *(_WORD *)__int16 v23 = 2080;
      *(void *)&v23[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v24 = 1024;
      int v25 = 1068;
      id v14 = MEMORY[0x1E4F14500];
LABEL_13:
      _os_log_impl(&dword_1BA88B000, v14, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_14:
    uint64_t v11 = 0;
    __int16 v8 = 0;
    goto LABEL_6;
  }
  int v6 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v17 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      __int16 v18 = 2048;
      uint64_t v19 = 0;
      __int16 v20 = 2048;
      *(void *)__int16 v21 = 0;
      *(_WORD *)&v21[8] = 2080;
      id v22 = "";
      *(_WORD *)__int16 v23 = 2080;
      *(void *)&v23[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v24 = 1024;
      int v25 = 1070;
      id v14 = MEMORY[0x1E4F14500];
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  __int16 v8 = [a1 clock];
  id v15 = 0;
  char v9 = [v8 removeUnicastUDPv4EtEPortFromInterfaceNamed:a2 withDestinationAddress:a3 error:&v15];
  id v10 = v15;
  uint64_t v11 = v10;
  if (v9) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = [v10 code];
  }
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219522;
    int v17 = (const char *)a1;
    __int16 v18 = 2112;
    uint64_t v19 = a2;
    __int16 v20 = 1024;
    *(_DWORD *)__int16 v21 = (int)a3 >> 24;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = (int)(a3 << 8) >> 24;
    LOWORD(v22) = 1024;
    *(_DWORD *)((char *)&v22 + 2) = (__int16)a3 >> 8;
    HIWORD(v22) = 1024;
    *(_DWORD *)__int16 v23 = (char)a3;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v12;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockRemoveUDPv4EndToEndPort(%p, %@, %hhu.%hhu.%hhu.%hhu) = 0x%08x", buf, 0x34u);
  }

  return v12;
}

uint64_t TimeSyncClockAddUDPv6EndToEndPort(void *a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v5 = 0;
  __int16 v4 = 0;
  return TimeSyncClockAddUDPv6EndToEndPortAndGetIdentity(a1, a2, a3, &v5, &v4);
}

uint64_t TimeSyncClockAddUDPv6EndToEndPortAndGetIdentity(void *a1, uint64_t a2, unsigned __int8 *a3, uint64_t *a4, _WORD *a5)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136316418;
    __int16 v40 = "TimeSyncClockValidRef(clockRef)";
    __int16 v41 = 2048;
    uint64_t v42 = 0;
    __int16 v43 = 2048;
    *(void *)__int16 v44 = 0;
    *(_WORD *)&v44[8] = 2080;
    uint64_t v45 = "";
    *(_WORD *)__int16 v46 = 2080;
    *(void *)&v46[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v47 = 1024;
    int v48 = 1119;
    int v37 = MEMORY[0x1E4F14500];
LABEL_24:
    _os_log_impl(&dword_1BA88B000, v37, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_25;
  }
  if (!a4)
  {
    uint64_t v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136316418;
    __int16 v40 = "clockIdentity != nil";
    __int16 v41 = 2048;
    uint64_t v42 = 0;
    __int16 v43 = 2048;
    *(void *)__int16 v44 = 0;
    *(_WORD *)&v44[8] = 2080;
    uint64_t v45 = "";
    *(_WORD *)__int16 v46 = 2080;
    *(void *)&v46[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v47 = 1024;
    int v48 = 1121;
    int v37 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  if (!a5)
  {
    uint64_t v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136316418;
    __int16 v40 = "localPortNumber != nil";
    __int16 v41 = 2048;
    uint64_t v42 = 0;
    __int16 v43 = 2048;
    *(void *)__int16 v44 = 0;
    *(_WORD *)&v44[8] = 2080;
    uint64_t v45 = "";
    *(_WORD *)__int16 v46 = 2080;
    *(void *)&v46[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v47 = 1024;
    int v48 = 1122;
    int v37 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  id v10 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v16 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v40 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      __int16 v41 = 2048;
      uint64_t v42 = 0;
      __int16 v43 = 2048;
      *(void *)__int16 v44 = 0;
      *(_WORD *)&v44[8] = 2080;
      uint64_t v45 = "";
      *(_WORD *)__int16 v46 = 2080;
      *(void *)&v46[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v47 = 1024;
      int v48 = 1124;
      int v37 = MEMORY[0x1E4F14500];
      goto LABEL_24;
    }
LABEL_25:
    id v15 = 0;
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  uint64_t v12 = [a1 clock];
  id v38 = 0;
  int v13 = [v12 addUnicastUDPv6EtEPortOnInterfaceNamed:a2 withDestinationAddress:a3 allocatedPortNumber:a5 error:&v38];
  id v14 = v38;
  id v15 = v14;
  if (v13)
  {
    uint64_t v16 = 0;
    *a4 = [v12 clockIdentity];
  }
  else
  {
    *a4 = -1;
    *a5 = -1;
    uint64_t v16 = [v14 code];
  }
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v17 = *a3;
    int v18 = a3[1];
    int v19 = a3[2];
    int v20 = a3[3];
    int v21 = a3[4];
    int v22 = a3[5];
    int v23 = a3[6];
    int v24 = a3[7];
    int v25 = a3[8];
    int v26 = a3[9];
    int v27 = a3[10];
    int v28 = a3[11];
    int v29 = a3[12];
    int v30 = a3[13];
    int v31 = a3[14];
    int v32 = a3[15];
    uint64_t v33 = &TSNullClockIdentifier;
    if (a4) {
      uint64_t v33 = a4;
    }
    uint64_t v34 = *v33;
    if (a5) {
      int v35 = (unsigned __int16)*a5;
    }
    else {
      int v35 = 0xFFFF;
    }
    *(_DWORD *)buf = 134223618;
    __int16 v40 = (const char *)a1;
    __int16 v41 = 2112;
    uint64_t v42 = a2;
    __int16 v43 = 1024;
    *(_DWORD *)__int16 v44 = v17;
    *(_WORD *)&v44[4] = 1024;
    *(_DWORD *)&v44[6] = v18;
    LOWORD(v45) = 1024;
    *(_DWORD *)((char *)&v45 + 2) = v19;
    HIWORD(v45) = 1024;
    *(_DWORD *)__int16 v46 = v20;
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v21;
    __int16 v47 = 1024;
    int v48 = v22;
    __int16 v49 = 1024;
    int v50 = v23;
    __int16 v51 = 1024;
    int v52 = v24;
    __int16 v53 = 1024;
    int v54 = v25;
    __int16 v55 = 1024;
    int v56 = v26;
    __int16 v57 = 1024;
    int v58 = v27;
    __int16 v59 = 1024;
    int v60 = v28;
    __int16 v61 = 1024;
    int v62 = v29;
    __int16 v63 = 1024;
    int v64 = v30;
    __int16 v65 = 1024;
    int v66 = v31;
    __int16 v67 = 1024;
    int v68 = v32;
    __int16 v69 = 2048;
    v70 = a4;
    __int16 v71 = 2048;
    v72 = a5;
    __int16 v73 = 2048;
    uint64_t v74 = v34;
    __int16 v75 = 1024;
    int v76 = v35;
    __int16 v77 = 1024;
    int v78 = v16;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockAddUDPv6EndToEndPortAndGetIdentity(%p, %@, %02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx, %p, %p) = (0x%016llx, %hu) 0x%08x", buf, 0xA0u);
  }

  return v16;
}

uint64_t TimeSyncClockRemoveUDPv6EndToEndPort(void *a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v33 = "TimeSyncClockValidRef(clockRef)";
      __int16 v34 = 2048;
      uint64_t v35 = 0;
      __int16 v36 = 2048;
      *(void *)int v37 = 0;
      *(_WORD *)&v37[8] = 2080;
      id v38 = "";
      *(_WORD *)uint64_t v39 = 2080;
      *(void *)&v39[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v40 = 1024;
      int v41 = 1161;
      int v30 = MEMORY[0x1E4F14500];
LABEL_13:
      _os_log_impl(&dword_1BA88B000, v30, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_14:
    uint64_t v11 = 0;
    __int16 v8 = 0;
    goto LABEL_6;
  }
  int v6 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v33 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      __int16 v34 = 2048;
      uint64_t v35 = 0;
      __int16 v36 = 2048;
      *(void *)int v37 = 0;
      *(_WORD *)&v37[8] = 2080;
      id v38 = "";
      *(_WORD *)uint64_t v39 = 2080;
      *(void *)&v39[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v40 = 1024;
      int v41 = 1163;
      int v30 = MEMORY[0x1E4F14500];
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  __int16 v8 = [a1 clock];
  id v31 = 0;
  char v9 = [v8 removeUnicastUDPv6EtEPortFromInterfaceNamed:a2 withDestinationAddress:a3 error:&v31];
  id v10 = v31;
  uint64_t v11 = v10;
  if (v9) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = [v10 code];
  }
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *a3;
    int v14 = a3[1];
    int v15 = a3[2];
    int v16 = a3[3];
    int v17 = a3[4];
    int v18 = a3[5];
    int v19 = a3[6];
    int v20 = a3[7];
    int v21 = a3[8];
    int v22 = a3[9];
    int v23 = a3[10];
    int v24 = a3[11];
    int v25 = a3[12];
    int v26 = a3[13];
    int v27 = a3[14];
    int v28 = a3[15];
    *(_DWORD *)buf = 134222594;
    uint64_t v33 = (const char *)a1;
    __int16 v34 = 2112;
    uint64_t v35 = a2;
    __int16 v36 = 1024;
    *(_DWORD *)int v37 = v13;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = v14;
    LOWORD(v38) = 1024;
    *(_DWORD *)((char *)&v38 + 2) = v15;
    HIWORD(v38) = 1024;
    *(_DWORD *)uint64_t v39 = v16;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = v17;
    __int16 v40 = 1024;
    int v41 = v18;
    __int16 v42 = 1024;
    int v43 = v19;
    __int16 v44 = 1024;
    int v45 = v20;
    __int16 v46 = 1024;
    int v47 = v21;
    __int16 v48 = 1024;
    int v49 = v22;
    __int16 v50 = 1024;
    int v51 = v23;
    __int16 v52 = 1024;
    int v53 = v24;
    __int16 v54 = 1024;
    int v55 = v25;
    __int16 v56 = 1024;
    int v57 = v26;
    __int16 v58 = 1024;
    int v59 = v27;
    __int16 v60 = 1024;
    int v61 = v28;
    __int16 v62 = 1024;
    int v63 = v12;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockRemoveUDPv6EndToEndPort(%p, %@, %02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx:%02hhx%02hhx) = 0x%08x", buf, 0x7Cu);
  }

  return v12;
}

uint64_t TimeSyncClockAddAWDLPort(void *a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v5 = 0;
  __int16 v4 = 0;
  return TimeSyncClockAddAWDLPortAndGetIdentity(a1, a2, a3, &v5, &v4);
}

uint64_t TimeSyncClockAddAWDLPortAndGetIdentity(void *a1, uint64_t a2, unsigned __int8 *a3, uint64_t *a4, _WORD *a5)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136316418;
    int v30 = "TimeSyncClockValidRef(clockRef)";
    __int16 v31 = 2048;
    uint64_t v32 = 0;
    __int16 v33 = 2048;
    *(void *)__int16 v34 = 0;
    *(_WORD *)&v34[8] = 2080;
    uint64_t v35 = "";
    *(_WORD *)__int16 v36 = 2080;
    *(void *)&v36[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v37 = 1024;
    int v38 = 1212;
    int v27 = MEMORY[0x1E4F14500];
LABEL_24:
    _os_log_impl(&dword_1BA88B000, v27, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    goto LABEL_25;
  }
  if (!a4)
  {
    uint64_t v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136316418;
    int v30 = "clockIdentity != nil";
    __int16 v31 = 2048;
    uint64_t v32 = 0;
    __int16 v33 = 2048;
    *(void *)__int16 v34 = 0;
    *(_WORD *)&v34[8] = 2080;
    uint64_t v35 = "";
    *(_WORD *)__int16 v36 = 2080;
    *(void *)&v36[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v37 = 1024;
    int v38 = 1214;
    int v27 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  if (!a5)
  {
    uint64_t v16 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_25;
    }
    *(_DWORD *)buf = 136316418;
    int v30 = "localPortNumber != nil";
    __int16 v31 = 2048;
    uint64_t v32 = 0;
    __int16 v33 = 2048;
    *(void *)__int16 v34 = 0;
    *(_WORD *)&v34[8] = 2080;
    uint64_t v35 = "";
    *(_WORD *)__int16 v36 = 2080;
    *(void *)&v36[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v37 = 1024;
    int v38 = 1215;
    int v27 = MEMORY[0x1E4F14500];
    goto LABEL_24;
  }
  id v10 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v16 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v30 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      __int16 v31 = 2048;
      uint64_t v32 = 0;
      __int16 v33 = 2048;
      *(void *)__int16 v34 = 0;
      *(_WORD *)&v34[8] = 2080;
      uint64_t v35 = "";
      *(_WORD *)__int16 v36 = 2080;
      *(void *)&v36[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v37 = 1024;
      int v38 = 1217;
      int v27 = MEMORY[0x1E4F14500];
      goto LABEL_24;
    }
LABEL_25:
    int v15 = 0;
    uint64_t v12 = 0;
    goto LABEL_8;
  }
  uint64_t v12 = [a1 clock];
  id v28 = 0;
  int v13 = [v12 addUnicastLinkLayerEtEPortOnInterfaceNamed:a2 withDestinationAddress:a3 allocatedPortNumber:a5 error:&v28];
  id v14 = v28;
  int v15 = v14;
  if (v13)
  {
    uint64_t v16 = 0;
    *a4 = [v12 clockIdentity];
  }
  else
  {
    *a4 = -1;
    *a5 = -1;
    uint64_t v16 = [v14 code];
  }
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v17 = *a3;
    int v18 = a3[1];
    int v19 = a3[2];
    int v20 = a3[3];
    int v21 = a3[4];
    int v22 = a3[5];
    int v23 = &TSNullClockIdentifier;
    if (a4) {
      int v23 = a4;
    }
    uint64_t v24 = *v23;
    if (a5) {
      int v25 = (unsigned __int16)*a5;
    }
    else {
      int v25 = 0xFFFF;
    }
    *(_DWORD *)buf = 134221058;
    int v30 = (const char *)a1;
    __int16 v31 = 2112;
    uint64_t v32 = a2;
    __int16 v33 = 1024;
    *(_DWORD *)__int16 v34 = v17;
    *(_WORD *)&v34[4] = 1024;
    *(_DWORD *)&v34[6] = v18;
    LOWORD(v35) = 1024;
    *(_DWORD *)((char *)&v35 + 2) = v19;
    HIWORD(v35) = 1024;
    *(_DWORD *)__int16 v36 = v20;
    *(_WORD *)&v36[4] = 1024;
    *(_DWORD *)&v36[6] = v21;
    __int16 v37 = 1024;
    int v38 = v22;
    __int16 v39 = 2048;
    __int16 v40 = a4;
    __int16 v41 = 2048;
    __int16 v42 = a5;
    __int16 v43 = 2048;
    uint64_t v44 = v24;
    __int16 v45 = 1024;
    int v46 = v25;
    __int16 v47 = 1024;
    int v48 = v16;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockAddAWDLPortAndGetIdentity(%p, %@, %02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx, %p, %p) = (0x%016llx, %hu) 0x%08x", buf, 0x64u);
  }

  return v16;
}

uint64_t TimeSyncClockRemoveAWDLPort(void *a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v23 = "TimeSyncClockValidRef(clockRef)";
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2048;
      *(void *)int v27 = 0;
      *(_WORD *)&v27[8] = 2080;
      id v28 = "";
      *(_WORD *)int v29 = 2080;
      *(void *)&v29[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v30 = 1024;
      int v31 = 1254;
      int v20 = MEMORY[0x1E4F14500];
LABEL_13:
      _os_log_impl(&dword_1BA88B000, v20, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_14:
    uint64_t v11 = 0;
    __int16 v8 = 0;
    goto LABEL_6;
  }
  int v6 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v23 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      __int16 v24 = 2048;
      uint64_t v25 = 0;
      __int16 v26 = 2048;
      *(void *)int v27 = 0;
      *(_WORD *)&v27[8] = 2080;
      id v28 = "";
      *(_WORD *)int v29 = 2080;
      *(void *)&v29[2] = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v30 = 1024;
      int v31 = 1256;
      int v20 = MEMORY[0x1E4F14500];
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  __int16 v8 = [a1 clock];
  id v21 = 0;
  char v9 = [v8 removeUnicastLinkLayerEtEPortFromInterfaceNamed:a2 withDestinationAddress:a3 error:&v21];
  id v10 = v21;
  uint64_t v11 = v10;
  if (v9) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = [v10 code];
  }
LABEL_6:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v13 = *a3;
    int v14 = a3[1];
    int v15 = a3[2];
    int v16 = a3[3];
    int v17 = a3[4];
    int v18 = a3[5];
    *(_DWORD *)buf = 134220034;
    int v23 = (const char *)a1;
    __int16 v24 = 2112;
    uint64_t v25 = a2;
    __int16 v26 = 1024;
    *(_DWORD *)int v27 = v13;
    *(_WORD *)&v27[4] = 1024;
    *(_DWORD *)&v27[6] = v14;
    LOWORD(v28) = 1024;
    *(_DWORD *)((char *)&v28 + 2) = v15;
    HIWORD(v28) = 1024;
    *(_DWORD *)int v29 = v16;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = v17;
    __int16 v30 = 1024;
    int v31 = v18;
    __int16 v32 = 1024;
    int v33 = v12;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockRemoveAWDLPort(%p, %@, %02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx) = 0x%08x", buf, 0x40u);
  }

  return v12;
}

uint64_t TimeSyncClockSetAllPortRemoteSyncMessageIntervals(void *a1, unsigned int a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v9 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v27 = "TimeSyncClockValidRef(clockRef)";
      __int16 v28 = 2048;
      *(void *)int v29 = 0;
      *(_WORD *)&v29[8] = 2048;
      uint64_t v30 = 0;
      __int16 v31 = 2080;
      __int16 v32 = "";
      __int16 v33 = 2080;
      uint64_t v34 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v35 = 1024;
      int v36 = 1294;
      int v16 = MEMORY[0x1E4F14500];
LABEL_22:
      _os_log_impl(&dword_1BA88B000, v16, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_23:
    __int16 v8 = 0;
    int v14 = 0;
    goto LABEL_15;
  }
  id v3 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v9 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v27 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      __int16 v28 = 2048;
      *(void *)int v29 = 0;
      *(_WORD *)&v29[8] = 2048;
      uint64_t v30 = 0;
      __int16 v31 = 2080;
      __int16 v32 = "";
      __int16 v33 = 2080;
      uint64_t v34 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v35 = 1024;
      int v36 = 1296;
      int v16 = MEMORY[0x1E4F14500];
      goto LABEL_22;
    }
    goto LABEL_23;
  }
  [a1 clock];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v18 = v24 = 0u;
  uint64_t v5 = [v18 ports];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    __int16 v8 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v20 = v8;
          [v12 requestRemoteMessageIntervalsWithPDelayMessageInterval:TSMessageIntervalIgnore syncMessageInterval:a2 announceMessageInterval:TSMessageIntervalIgnore error:&v20];
          id v13 = v20;

          uint64_t v9 = 3758097095;
          __int16 v8 = v13;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }
  else
  {
    __int16 v8 = 0;
    uint64_t v9 = 0;
  }

  int v14 = v18;
LABEL_15:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    int v27 = (const char *)a1;
    __int16 v28 = 1024;
    *(_DWORD *)int v29 = a2;
    *(_WORD *)&v29[4] = 1024;
    *(_DWORD *)&v29[6] = v9;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockSetAllPortRemoteSyncMessageIntervals(%p, %hhd) = 0x%08x", buf, 0x18u);
  }

  return v9;
}

uint64_t TimeSyncClockOverridePortReceiveMatching(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v16 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      long long v21 = "TimeSyncClockValidRef(clockRef)";
      __int16 v22 = 2048;
      *(void *)long long v23 = 0;
      *(_WORD *)&v23[8] = 2048;
      *(void *)&unsigned char v23[10] = 0;
      *(_WORD *)&v23[18] = 2080;
      long long v24 = "";
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v27 = 1024;
      int v28 = 1338;
      int v18 = MEMORY[0x1E4F14500];
LABEL_15:
      _os_log_impl(&dword_1BA88B000, v18, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_16:
    int v15 = 0;
    uint64_t v12 = 0;
    uint64_t v10 = 0;
    goto LABEL_8;
  }
  __int16 v8 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v16 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      long long v21 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      __int16 v22 = 2048;
      *(void *)long long v23 = 0;
      *(_WORD *)&v23[8] = 2048;
      *(void *)&unsigned char v23[10] = 0;
      *(_WORD *)&v23[18] = 2080;
      long long v24 = "";
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v27 = 1024;
      int v28 = 1340;
      int v18 = MEMORY[0x1E4F14500];
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  uint64_t v10 = [a1 clock];
  uint64_t v11 = [v10 portWithPortNumber:a2];
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = 0;
      char v13 = [v12 overrideReceiveMatchingWithRemoteClockIdentity:a3 remotePortNumber:a4 error:&v19];
      id v14 = v19;
      int v15 = v14;
      if (v13) {
        uint64_t v16 = 0;
      }
      else {
        uint64_t v16 = [v14 code];
      }
    }
    else
    {
      uint64_t v16 = 3758097136;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        long long v21 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
        __int16 v22 = 2048;
        *(void *)long long v23 = 0;
        *(_WORD *)&v23[8] = 2048;
        *(void *)&unsigned char v23[10] = 0;
        *(_WORD *)&v23[18] = 2080;
        long long v24 = "";
        __int16 v25 = 2080;
        __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
        __int16 v27 = 1024;
        int v28 = 1348;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }
      int v15 = 0;
    }
  }
  else
  {
    uint64_t v16 = 3758097136;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      long long v21 = "port != nil";
      __int16 v22 = 2048;
      *(void *)long long v23 = 0;
      *(_WORD *)&v23[8] = 2048;
      *(void *)&unsigned char v23[10] = 0;
      *(_WORD *)&v23[18] = 2080;
      long long v24 = "";
      __int16 v25 = 2080;
      __int16 v26 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v27 = 1024;
      int v28 = 1347;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    int v15 = 0;
    uint64_t v12 = 0;
  }
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    long long v21 = (const char *)a1;
    __int16 v22 = 1024;
    *(_DWORD *)long long v23 = a2;
    *(_WORD *)&v23[4] = 2048;
    *(void *)&v23[6] = a3;
    *(_WORD *)&v23[14] = 1024;
    *(_DWORD *)&v23[16] = a4;
    LOWORD(v24) = 1024;
    *(_DWORD *)((char *)&v24 + 2) = v16;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockOverridePortReceiveMatching(%p, %hu, 0x%016llx, %hu) = 0x%08x", buf, 0x28u);
  }

  return v16;
}

uint64_t TimeSyncClockRestorePortReceiveMatching(void *a1, uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v17 = "TimeSyncClockValidRef(clockRef)";
      __int16 v18 = 2048;
      *(void *)id v19 = 0;
      *(_WORD *)&v19[8] = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      __int16 v22 = "";
      __int16 v23 = 2080;
      long long v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v25 = 1024;
      int v26 = 1377;
      id v14 = MEMORY[0x1E4F14500];
LABEL_15:
      _os_log_impl(&dword_1BA88B000, v14, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_16:
    uint64_t v11 = 0;
    __int16 v8 = 0;
    uint64_t v6 = 0;
    goto LABEL_8;
  }
  __int16 v4 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v12 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v17 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      __int16 v18 = 2048;
      *(void *)id v19 = 0;
      *(_WORD *)&v19[8] = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      __int16 v22 = "";
      __int16 v23 = 2080;
      long long v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v25 = 1024;
      int v26 = 1379;
      id v14 = MEMORY[0x1E4F14500];
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  uint64_t v6 = [a1 clock];
  uint64_t v7 = [v6 portWithPortNumber:a2];
  if (v7)
  {
    __int16 v8 = (void *)v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = 0;
      char v9 = [v8 restoreReceiveMatchingError:&v15];
      id v10 = v15;
      uint64_t v11 = v10;
      if (v9) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = [v10 code];
      }
    }
    else
    {
      uint64_t v12 = 3758097136;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        int v17 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
        __int16 v18 = 2048;
        *(void *)id v19 = 0;
        *(_WORD *)&v19[8] = 2048;
        uint64_t v20 = 0;
        __int16 v21 = 2080;
        __int16 v22 = "";
        __int16 v23 = 2080;
        long long v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
        __int16 v25 = 1024;
        int v26 = 1387;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v12 = 3758097136;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      int v17 = "port != nil";
      __int16 v18 = 2048;
      *(void *)id v19 = 0;
      *(_WORD *)&v19[8] = 2048;
      uint64_t v20 = 0;
      __int16 v21 = 2080;
      __int16 v22 = "";
      __int16 v23 = 2080;
      long long v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v25 = 1024;
      int v26 = 1386;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    uint64_t v11 = 0;
    __int16 v8 = 0;
  }
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    int v17 = (const char *)a1;
    __int16 v18 = 1024;
    *(_DWORD *)id v19 = a2;
    *(_WORD *)&v19[4] = 1024;
    *(_DWORD *)&v19[6] = v12;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockRestorePortReceiveMatching(%p, %hu) = 0x%08x", buf, 0x18u);
  }

  return v12;
}

uint64_t TimeSyncClockGetCurrentPortInfo(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v14 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v19 = "TimeSyncClockValidRef(clockRef)";
      __int16 v20 = 2048;
      *(void *)__int16 v21 = 0;
      *(_WORD *)&v21[8] = 2048;
      *(void *)&unsigned char v21[10] = 0;
      *(_WORD *)&v21[18] = 2080;
      __int16 v22 = "";
      __int16 v23 = 2080;
      long long v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v25 = 1024;
      int v26 = 1418;
      uint64_t v16 = MEMORY[0x1E4F14500];
LABEL_15:
      _os_log_impl(&dword_1BA88B000, v16, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_16:
    char v13 = 0;
    id v10 = 0;
    __int16 v8 = 0;
    goto LABEL_8;
  }
  uint64_t v6 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v14 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v19 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      __int16 v20 = 2048;
      *(void *)__int16 v21 = 0;
      *(_WORD *)&v21[8] = 2048;
      *(void *)&unsigned char v21[10] = 0;
      *(_WORD *)&v21[18] = 2080;
      __int16 v22 = "";
      __int16 v23 = 2080;
      long long v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v25 = 1024;
      int v26 = 1420;
      uint64_t v16 = MEMORY[0x1E4F14500];
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  __int16 v8 = [a1 clock];
  uint64_t v9 = [v8 portWithPortNumber:a2];
  if (v9)
  {
    id v10 = (void *)v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = 0;
      char v11 = [v10 getCurrentPortInfo:a3 error:&v17];
      id v12 = v17;
      char v13 = v12;
      if (v11) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = [v12 code];
      }
    }
    else
    {
      uint64_t v14 = 3758097136;
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        id v19 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
        __int16 v20 = 2048;
        *(void *)__int16 v21 = 0;
        *(_WORD *)&v21[8] = 2048;
        *(void *)&unsigned char v21[10] = 0;
        *(_WORD *)&v21[18] = 2080;
        __int16 v22 = "";
        __int16 v23 = 2080;
        long long v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
        __int16 v25 = 1024;
        int v26 = 1428;
        _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }
      char v13 = 0;
    }
  }
  else
  {
    uint64_t v14 = 3758097136;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v19 = "port != nil";
      __int16 v20 = 2048;
      *(void *)__int16 v21 = 0;
      *(_WORD *)&v21[8] = 2048;
      *(void *)&unsigned char v21[10] = 0;
      *(_WORD *)&v21[18] = 2080;
      __int16 v22 = "";
      __int16 v23 = 2080;
      long long v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v25 = 1024;
      int v26 = 1427;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    char v13 = 0;
    id v10 = 0;
  }
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    id v19 = (const char *)a1;
    __int16 v20 = 1024;
    *(_DWORD *)__int16 v21 = a2;
    *(_WORD *)&v21[4] = 2048;
    *(void *)&v21[6] = a3;
    *(_WORD *)&v21[14] = 1024;
    *(_DWORD *)&v21[16] = v14;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetCurrentPortInfo(%p, %hu, %p) = 0x%08x", buf, 0x22u);
  }

  return v14;
}

uint64_t TimeSyncClockAddTimestamps(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = 3758097090;
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    uint64_t v7 = [a1 clock];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v9 = [a1 clock];
      id v14 = 0;
      char v10 = [v9 addTimestampWithMachAbsolute:a2 andDomainTime:a3 error:&v14];
      id v11 = v14;
      id v12 = v11;
      if (v10) {
        uint64_t v6 = 0;
      }
      else {
        uint64_t v6 = [v11 code];
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v16 = "TimeSyncClockValidRef(clockRef)";
    __int16 v17 = 2048;
    uint64_t v18 = 0;
    __int16 v19 = 2048;
    uint64_t v20 = 0;
    __int16 v21 = 2080;
    __int16 v22 = "";
    __int16 v23 = 2080;
    long long v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v25 = 1024;
    int v26 = 1458;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if ((TimeSyncLogCSpi_gotBootArg & 1) == 0)
  {
    os_parse_boot_arg_int();
    TimeSyncLogCSpi_gotBootArg = 1;
  }
  if (TimeSyncLogCSpi_log_c_spi && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    uint64_t v16 = (const char *)a1;
    __int16 v17 = 2048;
    uint64_t v18 = a2;
    __int16 v19 = 2048;
    uint64_t v20 = a3;
    __int16 v21 = 1024;
    LODWORD(v22) = v6;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockAddTimestamps(%p, %llu, %llu) = 0x%08x", buf, 0x26u);
  }
  return v6;
}

uint64_t TimeSyncClockResetFilter(void *a1, uint64_t a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 3758097090;
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    uint64_t v5 = [a1 clock];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v7 = [a1 clock];
      id v13 = 0;
      char v8 = [v7 resetFilterToNominal:a2 error:&v13];
      id v9 = v13;
      char v10 = v9;
      if (v8) {
        uint64_t v4 = 0;
      }
      else {
        uint64_t v4 = [v9 code];
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    id v15 = "TimeSyncClockValidRef(clockRef)";
    __int16 v16 = 2048;
    __int16 v17 = 0;
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2080;
    __int16 v21 = "";
    __int16 v22 = 2080;
    __int16 v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v24 = 1024;
    int v25 = 1494;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v11 = "false";
    *(_DWORD *)buf = 134218498;
    id v15 = (const char *)a1;
    if (a2) {
      id v11 = "true";
    }
    __int16 v16 = 2082;
    __int16 v17 = v11;
    __int16 v18 = 1024;
    LODWORD(v19) = v4;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockResetFilter(%p, %{public}s) = 0x%08x", buf, 0x1Cu);
  }
  return v4;
}

uint64_t TimeSyncClockResetClock(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = 3758097090;
  if (TimeSyncClockValidRef((uint64_t)a1))
  {
    id v3 = [a1 clock];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v5 = [a1 clock];
      id v10 = 0;
      char v6 = [v5 resetSyncServiceWithError:&v10];
      id v7 = v10;
      char v8 = v7;
      if (v6) {
        uint64_t v2 = 0;
      }
      else {
        uint64_t v2 = [v7 code];
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    id v12 = "TimeSyncClockValidRef(clockRef)";
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2048;
    uint64_t v16 = 0;
    __int16 v17 = 2080;
    __int16 v18 = "";
    __int16 v19 = 2080;
    __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v21 = 1024;
    int v22 = 1527;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v12 = (const char *)a1;
    __int16 v13 = 1024;
    LODWORD(v14) = v2;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockResetClock(%p) = 0x%08x", buf, 0x12u);
  }
  return v2;
}

TSPortInterface *TimeSyncPortCreateFromClock(void *a1, uint64_t a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v14 = 136316418;
      *(void *)&v14[4] = "TimeSyncClockValidRef(clockRef)";
      *(_WORD *)&v14[12] = 2048;
      *(void *)&v14[14] = 0;
      *(_WORD *)&v14[22] = 2048;
      *(void *)&v14[24] = 0;
      *(_WORD *)__int16 v15 = 2080;
      *(void *)&v15[2] = "";
      __int16 v16 = 2080;
      __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v18 = 1024;
      int v19 = 1567;
      __int16 v13 = MEMORY[0x1E4F14500];
LABEL_15:
      _os_log_impl(&dword_1BA88B000, v13, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", v14, 0x3Au);
    }
LABEL_16:
    char v8 = 0;
    char v6 = 0;
LABEL_22:
    id v11 = 0;
    goto LABEL_8;
  }
  uint64_t v4 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v14 = 136316418;
      *(void *)&v14[4] = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
      *(_WORD *)&v14[12] = 2048;
      *(void *)&v14[14] = 0;
      *(_WORD *)&v14[22] = 2048;
      *(void *)&v14[24] = 0;
      *(_WORD *)__int16 v15 = 2080;
      *(void *)&v15[2] = "";
      __int16 v16 = 2080;
      __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v18 = 1024;
      int v19 = 1569;
      __int16 v13 = MEMORY[0x1E4F14500];
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  char v6 = [a1 clock];
  uint64_t v7 = [v6 portWithPortNumber:a2];
  if (!v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v14 = 136316418;
      *(void *)&v14[4] = "port != nil";
      *(_WORD *)&v14[12] = 2048;
      *(void *)&v14[14] = 0;
      *(_WORD *)&v14[22] = 2048;
      *(void *)&v14[24] = 0;
      *(_WORD *)__int16 v15 = 2080;
      *(void *)&v15[2] = "";
      __int16 v16 = 2080;
      __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v18 = 1024;
      int v19 = 1574;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", v14, 0x3Au);
    }
    char v8 = 0;
    goto LABEL_22;
  }
  char v8 = (void *)v7;
  id v9 = -[TSPortInterface initWithgPTPPort:onClockIdentifier:]([TSPortInterface alloc], "initWithgPTPPort:onClockIdentifier:", v7, [v6 clockIdentifier]);
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v14 = 136316418;
      *(void *)&v14[4] = "newInterface != nil";
      *(_WORD *)&v14[12] = 2048;
      *(void *)&v14[14] = 0;
      *(_WORD *)&v14[22] = 2048;
      *(void *)&v14[24] = 0;
      *(_WORD *)__int16 v15 = 2080;
      *(void *)&v15[2] = "";
      __int16 v16 = 2080;
      __int16 v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v18 = 1024;
      int v19 = 1577;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", v14, 0x3Au);
    }
    goto LABEL_22;
  }
  id v10 = v9;
  if (TimeSyncPortCreateFromClock_onceToken != -1) {
    dispatch_once(&TimeSyncPortCreateFromClock_onceToken, &__block_literal_global_176);
  }
  id v11 = v10;
  *(void *)uint64_t v14 = MEMORY[0x1E4F143A8];
  *(void *)&v14[8] = 3221225472;
  *(void *)&v14[16] = __TimeSyncPortAddRef_block_invoke;
  *(void *)&v14[24] = &__block_descriptor_40_e5_v8__0l;
  *(void *)__int16 v15 = v11;
  dispatch_sync((dispatch_queue_t)_timeSyncPortInterfaceQueue, v14);
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v14 = 134218496;
    *(void *)&v14[4] = a1;
    *(_WORD *)&v14[12] = 1024;
    *(_DWORD *)&v14[14] = a2;
    *(_WORD *)&v14[18] = 2048;
    *(void *)&v14[20] = v11;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncPortCreateFromClock(%p, %hu) = %p", v14, 0x1Cu);
  }

  return v11;
}

uint64_t __TimeSyncPortCreateFromClock_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:258];
  uint64_t v1 = (void *)_timeSyncPortRefs;
  _timeSyncPortRefs = v0;

  _timeSyncPortInterfaceQueue = (uint64_t)dispatch_queue_create("com.apple.timesync.timesyncportinterface", 0);
  return MEMORY[0x1F41817F8]();
}

void TimeSyncPortDispose(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (TimeSyncPortValidRef(a1))
  {
    *(void *)uint64_t v4 = MEMORY[0x1E4F143A8];
    *(void *)&v4[8] = 3221225472;
    *(void *)&v4[16] = __TimeSyncPortRemoveRef_block_invoke;
    uint64_t v5 = &__block_descriptor_40_e5_v8__0l;
    *(void *)char v6 = a1;
    dispatch_sync((dispatch_queue_t)_timeSyncPortInterfaceQueue, v4);
    id v2 = self;
    id v3 = (void *)a1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v4 = 136316418;
      *(void *)&v4[4] = "TimeSyncPortValidRef(portRef)";
      *(_WORD *)&v4[12] = 2048;
      *(void *)&v4[14] = 0;
      *(_WORD *)&v4[22] = 2048;
      uint64_t v5 = 0;
      *(_WORD *)char v6 = 2080;
      *(void *)&v6[2] = "";
      __int16 v7 = 2080;
      char v8 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v9 = 1024;
      int v10 = 1603;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", v4, 0x3Au);
    }
    id v3 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v4 = 134217984;
    *(void *)&v4[4] = a1;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncPortDispose(%p)", v4, 0xCu);
  }
}

uint64_t TimeSyncPortValidRef(uint64_t a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __TimeSyncPortValidRef_block_invoke;
  v3[3] = &unk_1E622B360;
  v3[4] = &v4;
  v3[5] = a1;
  dispatch_sync((dispatch_queue_t)_timeSyncPortInterfaceQueue, v3);
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t TimeSyncPortSetRemoteSyncMessageIntervals(void *a1, uint64_t a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 3758097090;
  if (TimeSyncPortValidRef((uint64_t)a1))
  {
    uint64_t v5 = [a1 port];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v4 = 3758097095;
    if (isKindOfClass)
    {
      char v7 = [a1 port];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = 0;
        char v8 = [v7 requestRemoteMessageIntervalsWithPDelayMessageInterval:TSMessageIntervalIgnore syncMessageInterval:a2 announceMessageInterval:TSMessageIntervalIgnore error:&v12];
        id v9 = v12;
        int v10 = v9;
        if (v8) {
          uint64_t v4 = 0;
        }
        else {
          uint64_t v4 = [v9 code];
        }
      }
      else
      {
        int v10 = 0;
      }
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    uint64_t v14 = "TimeSyncPortValidRef(portRef)";
    __int16 v15 = 2048;
    *(void *)__int16 v16 = 0;
    *(_WORD *)&v16[8] = 2048;
    uint64_t v17 = 0;
    __int16 v18 = 2080;
    int v19 = "";
    __int16 v20 = 2080;
    __int16 v21 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v22 = 1024;
    int v23 = 1632;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    uint64_t v14 = (const char *)a1;
    __int16 v15 = 1024;
    *(_DWORD *)__int16 v16 = a2;
    *(_WORD *)&v16[4] = 1024;
    *(_DWORD *)&v16[6] = v4;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncPortSetRemoteSyncMessageIntervals(%p, %hhd) = 0x%08x", buf, 0x18u);
  }
  return v4;
}

uint64_t TimeSyncPortOverridePortReceiveMatching(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncPortValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v11 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v16 = "TimeSyncPortValidRef(portRef)";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2048;
      *(void *)__int16 v20 = 0;
      *(_WORD *)&v20[8] = 2080;
      __int16 v21 = "";
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v24 = 1024;
      int v25 = 1675;
      __int16 v13 = MEMORY[0x1E4F14500];
LABEL_14:
      _os_log_impl(&dword_1BA88B000, v13, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_15:
    int v10 = 0;
    char v7 = 0;
    goto LABEL_7;
  }
  uint64_t v6 = [a1 port];
  if (!v6)
  {
    uint64_t v11 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v16 = "port != nil";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2048;
      *(void *)__int16 v20 = 0;
      *(_WORD *)&v20[8] = 2080;
      __int16 v21 = "";
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v24 = 1024;
      int v25 = 1680;
      __int16 v13 = MEMORY[0x1E4F14500];
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  char v7 = (void *)v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = 0;
    char v8 = [v7 overrideReceiveMatchingWithRemoteClockIdentity:a2 remotePortNumber:a3 error:&v14];
    id v9 = v14;
    int v10 = v9;
    if (v8) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = [v9 code];
    }
  }
  else
  {
    uint64_t v11 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v16 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2048;
      *(void *)__int16 v20 = 0;
      *(_WORD *)&v20[8] = 2080;
      __int16 v21 = "";
      __int16 v22 = 2080;
      int v23 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v24 = 1024;
      int v25 = 1681;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    int v10 = 0;
  }
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218752;
    __int16 v16 = (const char *)a1;
    __int16 v17 = 2048;
    uint64_t v18 = a2;
    __int16 v19 = 1024;
    *(_DWORD *)__int16 v20 = a3;
    *(_WORD *)&v20[4] = 1024;
    *(_DWORD *)&v20[6] = v11;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncPortOverridePortReceiveMatching(%p, 0x%016llx, %hu) = 0x%08x", buf, 0x22u);
  }

  return v11;
}

uint64_t TimeSyncPortRestorePortReceiveMatching(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncPortValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v7 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v12 = "TimeSyncPortValidRef(portRef)";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = "";
      __int16 v19 = 2080;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v21 = 1024;
      int v22 = 1709;
      id v9 = MEMORY[0x1E4F14500];
LABEL_14:
      _os_log_impl(&dword_1BA88B000, v9, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_15:
    uint64_t v6 = 0;
    id v3 = 0;
    goto LABEL_7;
  }
  uint64_t v2 = [a1 port];
  if (!v2)
  {
    uint64_t v7 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v12 = "port != nil";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = "";
      __int16 v19 = 2080;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v21 = 1024;
      int v22 = 1714;
      id v9 = MEMORY[0x1E4F14500];
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v3 = (void *)v2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = 0;
    char v4 = [v3 restoreReceiveMatchingError:&v10];
    id v5 = v10;
    uint64_t v6 = v5;
    if (v4) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [v5 code];
    }
  }
  else
  {
    uint64_t v7 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v12 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = "";
      __int16 v19 = 2080;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v21 = 1024;
      int v22 = 1715;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    uint64_t v6 = 0;
  }
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v12 = (const char *)a1;
    __int16 v13 = 1024;
    LODWORD(v14) = v7;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncPortRestorePortReceiveMatching(%p) = 0x%08x", buf, 0x12u);
  }

  return v7;
}

uint64_t TimeSyncPortGetCurrentPortInfo(void *a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncPortValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v9 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v14 = "TimeSyncPortValidRef(portRef)";
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = "";
      __int16 v21 = 2080;
      int v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v23 = 1024;
      int v24 = 1744;
      uint64_t v11 = MEMORY[0x1E4F14500];
LABEL_14:
      _os_log_impl(&dword_1BA88B000, v11, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_15:
    char v8 = 0;
    id v5 = 0;
    goto LABEL_7;
  }
  uint64_t v4 = [a1 port];
  if (!v4)
  {
    uint64_t v9 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v14 = "port != nil";
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = "";
      __int16 v21 = 2080;
      int v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v23 = 1024;
      int v24 = 1749;
      uint64_t v11 = MEMORY[0x1E4F14500];
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v5 = (void *)v4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = 0;
    char v6 = [v5 getCurrentPortInfo:a2 error:&v12];
    id v7 = v12;
    char v8 = v7;
    if (v6) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = [v7 code];
    }
  }
  else
  {
    uint64_t v9 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      uint64_t v14 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2048;
      uint64_t v18 = 0;
      __int16 v19 = 2080;
      __int16 v20 = "";
      __int16 v21 = 2080;
      int v22 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v23 = 1024;
      int v24 = 1750;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    char v8 = 0;
  }
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218496;
    uint64_t v14 = (const char *)a1;
    __int16 v15 = 2048;
    uint64_t v16 = a2;
    __int16 v17 = 1024;
    LODWORD(v18) = v9;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncPortGetCurrentPortInfo(%p, %p) = 0x%08x", buf, 0x1Cu);
  }

  return v9;
}

uint64_t TimeSyncPortEnable(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncPortValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v7 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v12 = "TimeSyncPortValidRef(portRef)";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = "";
      __int16 v19 = 2080;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v21 = 1024;
      int v22 = 1778;
      uint64_t v9 = MEMORY[0x1E4F14500];
LABEL_14:
      _os_log_impl(&dword_1BA88B000, v9, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_15:
    char v6 = 0;
    id v3 = 0;
    goto LABEL_7;
  }
  uint64_t v2 = [a1 port];
  if (!v2)
  {
    uint64_t v7 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v12 = "port != nil";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = "";
      __int16 v19 = 2080;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v21 = 1024;
      int v22 = 1783;
      uint64_t v9 = MEMORY[0x1E4F14500];
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v3 = (void *)v2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = 0;
    char v4 = [v3 enablePortError:&v10];
    id v5 = v10;
    char v6 = v5;
    if (v4) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [v5 code];
    }
  }
  else
  {
    uint64_t v7 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v12 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = "";
      __int16 v19 = 2080;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v21 = 1024;
      int v22 = 1784;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    char v6 = 0;
  }
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v12 = (const char *)a1;
    __int16 v13 = 1024;
    LODWORD(v14) = v7;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncPortEnable(%p) = 0x%08x", buf, 0x12u);
  }

  return v7;
}

uint64_t TimeSyncPortDisable(void *a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((TimeSyncPortValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v7 = 3758097090;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v12 = "TimeSyncPortValidRef(portRef)";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = "";
      __int16 v19 = 2080;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v21 = 1024;
      int v22 = 1812;
      uint64_t v9 = MEMORY[0x1E4F14500];
LABEL_14:
      _os_log_impl(&dword_1BA88B000, v9, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
LABEL_15:
    char v6 = 0;
    id v3 = 0;
    goto LABEL_7;
  }
  uint64_t v2 = [a1 port];
  if (!v2)
  {
    uint64_t v7 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v12 = "port != nil";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = "";
      __int16 v19 = 2080;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v21 = 1024;
      int v22 = 1817;
      uint64_t v9 = MEMORY[0x1E4F14500];
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  id v3 = (void *)v2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = 0;
    char v4 = [v3 disablePortError:&v10];
    id v5 = v10;
    char v6 = v5;
    if (v4) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [v5 code];
    }
  }
  else
  {
    uint64_t v7 = 3758097095;
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      id v12 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      __int16 v15 = 2048;
      uint64_t v16 = 0;
      __int16 v17 = 2080;
      uint64_t v18 = "";
      __int16 v19 = 2080;
      __int16 v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v21 = 1024;
      int v22 = 1818;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    char v6 = 0;
  }
LABEL_7:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    id v12 = (const char *)a1;
    __int16 v13 = 1024;
    LODWORD(v14) = v7;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncPortDisable(%p) = 0x%08x", buf, 0x12u);
  }

  return v7;
}

void TimeSyncPortSetMACLookupTimeoutCallback(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (TimeSyncPortValidRef((uint64_t)a1))
  {
    [a1 setMACLookupTimeoutCallback:a2 refcon:a3];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136316418;
    uint64_t v7 = "TimeSyncPortValidRef(portRef)";
    __int16 v8 = 2048;
    uint64_t v9 = 0;
    __int16 v10 = 2048;
    uint64_t v11 = 0;
    __int16 v12 = 2080;
    __int16 v13 = "";
    __int16 v14 = 2080;
    __int16 v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v16 = 1024;
    int v17 = 1843;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v6, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218496;
    uint64_t v7 = (const char *)a1;
    __int16 v8 = 2048;
    uint64_t v9 = a2;
    __int16 v10 = 2048;
    uint64_t v11 = a3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncPortSetMACLookupTimeoutCallback(%p, %p, %p)", (uint8_t *)&v6, 0x20u);
  }
}

uint64_t TimeSyncClockManagerNotifyWhenAvailable(uint64_t result, uint64_t a2)
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __TimeSyncClockManagerNotifyWhenAvailable_block_invoke;
    v2[3] = &__block_descriptor_48_e5_v8__0l;
    v2[4] = result;
    v2[5] = a2;
    return +[TSClockManager notifyWhenClockManagerIsAvailable:v2];
  }
  return result;
}

uint64_t __TimeSyncClockManagerNotifyWhenAvailable_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

TSClockManagerInterface *TimeSyncCreateTimeSyncClockManagerConnectionCallbackWithInterruptedHandler(const char *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v4 = objc_alloc_init(TSClockManagerInterface);
  if (v4)
  {
    id v5 = +[TSClockManager sharedClockManager];
    [(TSClockManagerInterface *)v4 setClockManager:v5];

    [(TSClockManagerInterface *)v4 setInterruptionCallback:a1 andRefcon:a2];
    [(TSClockManagerInterface *)v4 addToClockManager];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136316418;
    __int16 v8 = "newInterface != nil";
    __int16 v9 = 2048;
    uint64_t v10 = 0;
    __int16 v11 = 2048;
    __int16 v12 = 0;
    __int16 v13 = 2080;
    __int16 v14 = "";
    __int16 v15 = 2080;
    __int16 v16 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v17 = 1024;
    int v18 = 1886;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v7, 0x3Au);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134218496;
    __int16 v8 = a1;
    __int16 v9 = 2048;
    uint64_t v10 = a2;
    __int16 v11 = 2048;
    __int16 v12 = v4;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncCreateTimeSyncClockManagerConnectionCallbackWithInterruptedHandler(%p, %p) = %p", (uint8_t *)&v7, 0x20u);
  }

  return v4;
}

void TimeSyncClockManagerConnectionCallbackDispose(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&_clockManagerInterfacesLock);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = (id)_clockManagerInterfaces;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if (*(void **)(*((void *)&v7 + 1) + 8 * i) == a1)
        {
          objc_msgSend(a1, "removeFromClockManager", (void)v7);
          [(id)_clockManagerInterfaces removeObject:a1];
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock((os_unfair_lock_t)&_clockManagerInterfacesLock);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    __int16 v12 = a1;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockManagerConnectionCallbackDispose(%p)", buf, 0xCu);
  }
}

uint64_t TimeSyncgPTPManagerNotifyWhenAvailable(uint64_t result, uint64_t a2)
{
  if (result)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __TimeSyncgPTPManagerNotifyWhenAvailable_block_invoke;
    v2[3] = &__block_descriptor_48_e5_v8__0l;
    v2[4] = result;
    v2[5] = a2;
    return +[TSgPTPManager notifyWhengPTPManagerIsAvailable:v2];
  }
  return result;
}

uint64_t __TimeSyncgPTPManagerNotifyWhenAvailable_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)(a1 + 40));
}

uint64_t TimeSyncAddgPTPServices()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[TSClockManager sharedClockManager];
  id v5 = 0;
  uint64_t v1 = [v0 addgPTPServicesWithError:&v5];
  id v2 = v5;
  if ((v1 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    TimeSyncAddgPTPServices_cold_1(v2);
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = "false";
    if (v1) {
      uint64_t v3 = "true";
    }
    *(_DWORD *)buf = 136446210;
    long long v7 = v3;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncAddgPTPServices() = %{public}s", buf, 0xCu);
  }

  return v1;
}

BOOL TimeSyncAddgPTPServicesSync(unsigned int a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[TSClockManager sharedClockManagerSyncWithTimeout:a1];

  if (v3 && TimeSyncAddgPTPServices())
  {
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __TimeSyncAddgPTPServicesSync_block_invoke;
    v11[3] = &unk_1E622A8F8;
    id v5 = v4;
    __int16 v12 = v5;
    +[TSgPTPManager notifyWhengPTPManagerIsAvailable:v11];
    dispatch_time_t v6 = dispatch_time(0, 1000000 * a1);
    intptr_t v7 = dispatch_semaphore_wait(v5, v6);
    BOOL v8 = v7 == 0;
    if (v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      TimeSyncAddgPTPServicesSync_cold_1();
    }
  }
  else
  {
    BOOL v8 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    long long v9 = "false";
    if (v8) {
      long long v9 = "true";
    }
    *(_DWORD *)buf = 67109378;
    unsigned int v14 = a1;
    __int16 v15 = 2080;
    __int16 v16 = v9;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncAddgPTPServicesSync(%u) = %s", buf, 0x12u);
  }
  return v8;
}

intptr_t __TimeSyncAddgPTPServicesSync_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t TimeSyncRemovegPTPServices()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[TSClockManager sharedClockManager];
  uint64_t v1 = [v0 removegPTPServicesWithError:0];
  if ((v1 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    TimeSyncRemovegPTPServices_cold_1();
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = "false";
    if (v1) {
      id v2 = "true";
    }
    int v4 = 136446210;
    id v5 = v2;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncRemovegPTPServices() = %{public}s", (uint8_t *)&v4, 0xCu);
  }

  return v1;
}

uint64_t TimeSyncSystemDomainClockIdentifier()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[TSgPTPManager sharedgPTPManager];
  uint64_t v1 = v0;
  if (v0) {
    uint64_t v2 = [v0 systemDomainClockIdentifier];
  }
  else {
    uint64_t v2 = -1;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = v2;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncSystemDomainClockIdentifier() = 0x%016llx", (uint8_t *)&v4, 0xCu);
  }

  return v2;
}

uint64_t TimeSyncAirPlayPTPInstanceClockIdentifier()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[TSgPTPManager sharedgPTPManager];
  uint64_t v1 = v0;
  if (v0) {
    uint64_t v2 = [v0 airPlayPTPInstanceClockIdentifier];
  }
  else {
    uint64_t v2 = -1;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = v2;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncAirPlayPTPInstanceClockIdentifier() = 0x%016llx", (uint8_t *)&v4, 0xCu);
  }

  return v2;
}

uint64_t TimeSyncAddAirPlayPTPInstance()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = -1;
  uint64_t v1 = +[TSgPTPManager sharedgPTPManager];
  uint64_t v2 = v1;
  if (v1)
  {
    id v6 = 0;
    *(void *)buf = -1;
    int v3 = [v1 addAirPlayPTPInstance:buf error:&v6];
    id v4 = v6;
    if (v3)
    {
      uint64_t v0 = *(void *)buf;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      TimeSyncAddAirPlayPTPInstance_cold_1(v4);
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v0;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncAddAirPlayPTPInstance() = 0x%016llx", buf, 0xCu);
  }

  return v0;
}

uint64_t TimeSyncRemoveAirPlayPTPInstance()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[TSgPTPManager sharedgPTPManager];
  uint64_t v1 = v0;
  if (v0)
  {
    id v6 = 0;
    uint64_t v2 = [v0 removeAirPlayPTPInstanceWithError:&v6];
    id v3 = v6;
    if ((v2 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      TimeSyncRemoveAirPlayPTPInstance_cold_1(v3);
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = "false";
    if (v2) {
      id v4 = "true";
    }
    *(_DWORD *)buf = 136446210;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncRemoveAirPlayPTPInstance() = %{public}s", buf, 0xCu);
  }

  return v2;
}

uint64_t TimeSyncCopresencePTPInstanceClockIdentifier()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[TSgPTPManager sharedgPTPManager];
  uint64_t v1 = v0;
  if (v0) {
    uint64_t v2 = [v0 copresencePTPInstanceClockIdentifier];
  }
  else {
    uint64_t v2 = -1;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 134217984;
    uint64_t v5 = v2;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncCopresencePTPInstanceClockIdentifier() = 0x%016llx", (uint8_t *)&v4, 0xCu);
  }

  return v2;
}

uint64_t TimeSyncAddCopresencePTPInstance()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = -1;
  uint64_t v1 = +[TSgPTPManager sharedgPTPManager];
  uint64_t v2 = v1;
  if (v1)
  {
    id v6 = 0;
    *(void *)buf = -1;
    int v3 = [v1 addCopresencePTPInstance:buf error:&v6];
    id v4 = v6;
    if (v3)
    {
      uint64_t v0 = *(void *)buf;
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      TimeSyncAddCopresencePTPInstance_cold_1(v4);
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v0;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncAddCopresencePTPInstance() = 0x%016llx", buf, 0xCu);
  }

  return v0;
}

uint64_t TimeSyncRemoveCopresencePTPInstance()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = +[TSgPTPManager sharedgPTPManager];
  uint64_t v1 = v0;
  if (v0)
  {
    id v6 = 0;
    uint64_t v2 = [v0 removeCopresencePTPInstanceWithError:&v6];
    id v3 = v6;
    if ((v2 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      TimeSyncRemoveCopresencePTPInstance_cold_1(v3);
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = "false";
    if (v2) {
      id v4 = "true";
    }
    *(_DWORD *)buf = 136446210;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncRemoveCopresencePTPInstance() = %{public}s", buf, 0xCu);
  }

  return v2;
}

TSClockInterface *TimeSyncClockCreateUserFilteredClock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = +[TSClockManager sharedClockManager];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v15 = 0;
    uint64_t v10 = [v8 addUserFilteredClockWithMachInterval:a1 domainInterval:a2 usingFilterShift:a3 isAdaptive:a4 error:&v15];
    __int16 v11 = 0;
    if (v10 != -1)
    {
      uint64_t v12 = v10;
      usleep(0x186A0u);
      __int16 v11 = TimeSyncClockCreateWithClockIdentifier(v12);
    }
  }
  else
  {
    __int16 v11 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = "false";
    *(_DWORD *)buf = 134219010;
    uint64_t v17 = a1;
    __int16 v18 = 2048;
    if (a4) {
      __int16 v13 = "true";
    }
    uint64_t v19 = a2;
    __int16 v20 = 1024;
    int v21 = a3;
    __int16 v22 = 2082;
    uint64_t v23 = v13;
    __int16 v24 = 2048;
    uint64_t v25 = v11;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockCreateUserFilteredClock(%llu, %llu, %hu, %{public}s) = %p", buf, 0x30u);
  }

  return v11;
}

uint64_t TimeSyncGetClockMetricsWithSize(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3 != 40)
  {
    uint64_t v13 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v16 = 136316418;
    uint64_t v17 = "size == sizeof(TimeSyncClockMetrics)";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    *(void *)uint64_t v23 = "";
    *(_WORD *)&v23[8] = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v25 = 1024;
    int v26 = 2268;
    uint64_t v15 = MEMORY[0x1E4F14500];
    goto LABEL_23;
  }
  if (!a2)
  {
    uint64_t v13 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v16 = 136316418;
    uint64_t v17 = "metrics != NULL";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    *(void *)uint64_t v23 = "";
    *(_WORD *)&v23[8] = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v25 = 1024;
    int v26 = 2269;
    uint64_t v15 = MEMORY[0x1E4F14500];
    goto LABEL_23;
  }
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v13 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v16 = 136316418;
    uint64_t v17 = "TimeSyncClockValidRef(clockRef)";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    *(void *)uint64_t v23 = "";
    *(_WORD *)&v23[8] = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v25 = 1024;
    int v26 = 2270;
    uint64_t v15 = MEMORY[0x1E4F14500];
    goto LABEL_23;
  }
  uint64_t v8 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v13 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    int v16 = 136316418;
    uint64_t v17 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    *(void *)uint64_t v23 = "";
    *(_WORD *)&v23[8] = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v25 = 1024;
    int v26 = 2272;
    uint64_t v15 = MEMORY[0x1E4F14500];
    goto LABEL_23;
  }
  if (a4)
  {
    uint64_t v10 = [[TSClockMetrics alloc] initWithInterfaceMetrics:a2];
    __int16 v11 = [a1 clock];
    uint64_t v12 = [v11 getMetricsWithDelta:v10];
  }
  else
  {
    uint64_t v10 = [a1 clock];
    uint64_t v12 = [(TSClockMetrics *)v10 getMetrics];
  }

  if (v12)
  {
    *(void *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    *(void *)(a2 + 8) = [v12 gmChangesCount];
    *(void *)(a2 + 16) = [v12 timeToChangeGm];
    *(void *)(a2 + 24) = [v12 timeToLock];
    *(void *)(a2 + 32) = [v12 coreAudioReanchors];

    uint64_t v13 = 0;
    goto LABEL_10;
  }
  uint64_t v13 = 3758097090;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136316418;
    uint64_t v17 = "tsClockMetrics != nil";
    __int16 v18 = 2048;
    uint64_t v19 = 0;
    __int16 v20 = 2048;
    uint64_t v21 = 0;
    __int16 v22 = 2080;
    *(void *)uint64_t v23 = "";
    *(_WORD *)&v23[8] = 2080;
    __int16 v24 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v25 = 1024;
    int v26 = 2283;
    uint64_t v15 = MEMORY[0x1E4F14500];
LABEL_23:
    _os_log_impl(&dword_1BA88B000, v15, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v16, 0x3Au);
  }
LABEL_10:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 134219008;
    uint64_t v17 = (const char *)a1;
    __int16 v18 = 2048;
    uint64_t v19 = a2;
    __int16 v20 = 2048;
    uint64_t v21 = a3;
    __int16 v22 = 1024;
    *(_DWORD *)uint64_t v23 = a4;
    *(_WORD *)&v23[4] = 1024;
    *(_DWORD *)&v23[6] = v13;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncClockGetMetrics(%p, %p, %llu, %u) = %#x", (uint8_t *)&v16, 0x2Cu);
  }
  return v13;
}

uint64_t TimeSyncGetPortMetricsWithSize(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a4 != 138)
  {
    uint64_t v17 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v21 = 136316418;
    __int16 v22 = "size == sizeof(TimeSyncPortMetrics)";
    __int16 v23 = 2048;
    *(void *)__int16 v24 = 0;
    *(_WORD *)&v24[8] = 2048;
    *(void *)&v24[10] = 0;
    *(_WORD *)&v24[18] = 2080;
    *(void *)&v24[20] = "";
    *(_WORD *)&v24[28] = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v26 = 1024;
    int v27 = 2316;
    uint64_t v19 = MEMORY[0x1E4F14500];
LABEL_23:
    _os_log_impl(&dword_1BA88B000, v19, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v21, 0x3Au);
    goto LABEL_12;
  }
  if ((TimeSyncClockValidRef((uint64_t)a1) & 1) == 0)
  {
    uint64_t v17 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v21 = 136316418;
    __int16 v22 = "TimeSyncClockValidRef(clockRef)";
    __int16 v23 = 2048;
    *(void *)__int16 v24 = 0;
    *(_WORD *)&v24[8] = 2048;
    *(void *)&v24[10] = 0;
    *(_WORD *)&v24[18] = 2080;
    *(void *)&v24[20] = "";
    *(_WORD *)&v24[28] = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v26 = 1024;
    int v27 = 2317;
    uint64_t v19 = MEMORY[0x1E4F14500];
    goto LABEL_23;
  }
  if (!a3)
  {
    uint64_t v17 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v21 = 136316418;
    __int16 v22 = "metrics != NULL";
    __int16 v23 = 2048;
    *(void *)__int16 v24 = 0;
    *(_WORD *)&v24[8] = 2048;
    *(void *)&v24[10] = 0;
    *(_WORD *)&v24[18] = 2080;
    *(void *)&v24[20] = "";
    *(_WORD *)&v24[28] = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v26 = 1024;
    int v27 = 2318;
    uint64_t v19 = MEMORY[0x1E4F14500];
    goto LABEL_23;
  }
  uint64_t v10 = [a1 clock];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v17 = 3758097090;
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    int v21 = 136316418;
    __int16 v22 = "[((__bridge TSClockInterface *)clockRef).clock isKindOfClass:[TSgPTPClock class]]";
    __int16 v23 = 2048;
    *(void *)__int16 v24 = 0;
    *(_WORD *)&v24[8] = 2048;
    *(void *)&v24[10] = 0;
    *(_WORD *)&v24[18] = 2080;
    *(void *)&v24[20] = "";
    *(_WORD *)&v24[28] = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v26 = 1024;
    int v27 = 2320;
    uint64_t v19 = MEMORY[0x1E4F14500];
    goto LABEL_23;
  }
  uint64_t v12 = [a1 clock];
  uint64_t v13 = [v12 portWithPortNumber:a2];
  if (!v13)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136316418;
      __int16 v22 = "port != nil";
      __int16 v23 = 2048;
      *(void *)__int16 v24 = 0;
      *(_WORD *)&v24[8] = 2048;
      *(void *)&v24[10] = 0;
      *(_WORD *)&v24[18] = 2080;
      *(void *)&v24[20] = "";
      *(_WORD *)&v24[28] = 2080;
      __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
      __int16 v26 = 1024;
      int v27 = 2327;
      _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v21, 0x3Au);
    }
    goto LABEL_32;
  }
  unsigned int v14 = (void *)v13;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (a5)
    {
      uint64_t v15 = [[TSPortMetrics alloc] initWithInterfaceMetrics:a3];
      int v16 = [v14 getMetricsWithDelta:v15];
    }
    else
    {
      int v16 = [v14 getMetrics];
    }
    if (v16)
    {
      *(_OWORD *)(a3 + 122) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_WORD *)a3 = [v16 portNumber];
      *(void *)(a3 + 2) = [v16 syncTimeouts];
      *(void *)(a3 + 10) = [v16 filterResetsDroppedLimit];
      *(void *)(a3 + 18) = [v16 filterResetsOutOfBounds];
      *(void *)(a3 + 26) = [v16 meanDelayTime];
      *(void *)(a3 + 34) = [v16 droppedMeasurements];
      *(void *)(a3 + 42) = [v16 discardedPpmLimitMeasurements];
      *(void *)(a3 + 50) = [v16 discardedDelayLimitExceededMeasurements];
      *(void *)(a3 + 58) = [v16 discardedOutOfBoundsMeasurements];
      *(void *)(a3 + 66) = [v16 discardedTimestampsOutOfOrderMeasurements];
      *(void *)(a3 + 74) = [v16 successfulMeasurements];
      *(void *)(a3 + 82) = [v16 totalMeasurements];
      *(void *)(a3 + 90) = [v16 droppedPercentage];
      *(void *)(a3 + 98) = [v16 discardedPpmLimitPercentage];
      *(void *)(a3 + 106) = [v16 discardedDelayLimitExceededPercentage];
      *(void *)(a3 + 114) = [v16 discardedOutOfBoundsPercentage];
      *(void *)(a3 + 122) = [v16 discardedTimestampsOutOfOrderPercentage];
      *(void *)(a3 + 130) = [v16 successfulPercentage];

      uint64_t v17 = 0;
      goto LABEL_12;
    }
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_31;
    }
    int v21 = 136316418;
    __int16 v22 = "tsPortMetrics != nil";
    __int16 v23 = 2048;
    *(void *)__int16 v24 = 0;
    *(_WORD *)&v24[8] = 2048;
    *(void *)&v24[10] = 0;
    *(_WORD *)&v24[18] = 2080;
    *(void *)&v24[20] = "";
    *(_WORD *)&v24[28] = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v26 = 1024;
    int v27 = 2337;
    __int16 v20 = MEMORY[0x1E4F14500];
    goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 136316418;
    __int16 v22 = "[port isKindOfClass:[TSgPTPNetworkPort class]]";
    __int16 v23 = 2048;
    *(void *)__int16 v24 = 0;
    *(_WORD *)&v24[8] = 2048;
    *(void *)&v24[10] = 0;
    *(_WORD *)&v24[18] = 2080;
    *(void *)&v24[20] = "";
    *(_WORD *)&v24[28] = 2080;
    __int16 v25 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSInterface.m";
    __int16 v26 = 1024;
    int v27 = 2328;
    __int16 v20 = MEMORY[0x1E4F14500];
LABEL_30:
    _os_log_impl(&dword_1BA88B000, v20, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v21, 0x3Au);
  }
LABEL_31:

LABEL_32:
  uint64_t v17 = 3758097136;
LABEL_12:
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 134219264;
    __int16 v22 = (const char *)a1;
    __int16 v23 = 1024;
    *(_DWORD *)__int16 v24 = a2;
    *(_WORD *)&v24[4] = 2048;
    *(void *)&v24[6] = a3;
    *(_WORD *)&v24[14] = 2048;
    *(void *)&v24[16] = a4;
    *(_WORD *)&v24[24] = 1024;
    *(_DWORD *)&v24[26] = a5;
    LOWORD(v25) = 1024;
    *(_DWORD *)((char *)&v25 + 2) = v17;
    _os_log_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "TimeSyncPortGetMetrics(%p, %u, %p, %llu, %u) = %#x", (uint8_t *)&v21, 0x32u);
  }
  return v17;
}

uint64_t __TimeSyncClockAddRef_block_invoke(uint64_t a1)
{
  return [(id)_timeSyncClockRefs addPointer:*(void *)(a1 + 32)];
}

unint64_t __TimeSyncClockValidRef_block_invoke(uint64_t a1)
{
  unint64_t result = [(id)_timeSyncClockRefs count];
  if (result)
  {
    unint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = *(void *)(a1 + 40);
      unint64_t result = [(id)_timeSyncClockRefs pointerAtIndex:v3];
      if (v4 == result) {
        break;
      }
      ++v3;
      unint64_t result = [(id)_timeSyncClockRefs count];
      if (v3 >= result) {
        return result;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

unint64_t __TimeSyncClockRemoveRef_block_invoke(uint64_t a1)
{
  unint64_t result = [(id)_timeSyncClockRefs count];
  if (result)
  {
    unint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      if (v4 == [(id)_timeSyncClockRefs pointerAtIndex:v3]) {
        break;
      }
      ++v3;
      unint64_t result = [(id)_timeSyncClockRefs count];
      if (v3 >= result) {
        return result;
      }
    }
    uint64_t v5 = (void *)_timeSyncClockRefs;
    return [v5 removePointerAtIndex:v3];
  }
  return result;
}

uint64_t __TimeSyncPortAddRef_block_invoke(uint64_t a1)
{
  return [(id)_timeSyncPortRefs addPointer:*(void *)(a1 + 32)];
}

unint64_t __TimeSyncPortValidRef_block_invoke(uint64_t a1)
{
  unint64_t result = [(id)_timeSyncPortRefs count];
  if (result)
  {
    unint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = *(void *)(a1 + 40);
      unint64_t result = [(id)_timeSyncPortRefs pointerAtIndex:v3];
      if (v4 == result) {
        break;
      }
      ++v3;
      unint64_t result = [(id)_timeSyncPortRefs count];
      if (v3 >= result) {
        return result;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return result;
}

unint64_t __TimeSyncPortRemoveRef_block_invoke(uint64_t a1)
{
  unint64_t result = [(id)_timeSyncPortRefs count];
  if (result)
  {
    unint64_t v3 = 0;
    while (1)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      if (v4 == [(id)_timeSyncPortRefs pointerAtIndex:v3]) {
        break;
      }
      ++v3;
      unint64_t result = [(id)_timeSyncPortRefs count];
      if (v3 >= result) {
        return result;
      }
    }
    uint64_t v5 = (void *)_timeSyncPortRefs;
    return [v5 removePointerAtIndex:v3];
  }
  return result;
}

void asyncNotificationsCallback_1(uint64_t a1, uint64_t a2, unsigned int *a3, unsigned int a4)
{
  intptr_t v7 = (void *)MEMORY[0x1BA9F1DF0]();
  uint64_t v8 = +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap];
  uint64_t v9 = [v8 getObject:a1];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    __int16 v11 = v10;
    if (a4 == 1)
    {
      if (*(void *)a3 == 1000) {
        [v10 _handleRefreshConnection];
      }
    }
    else if (a4 >= 5)
    {
      [v10 _handleNotification:*a3 withArgs:a3 + 2 ofCount:a4 - 1];
    }
  }
}

void sub_1BA8D1660(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8D170C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BA8D92CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_1BA8DA488(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1BA8DAA54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_1BA8DADA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BA8DB180(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BA8DB440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BA8DB680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void TimeSyncAddgPTPServices_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BA88B000, MEMORY[0x1E4F14500], v1, "Failed to add gPTP services with error 0x%08x\n", v2, v3, v4, v5, v6);
}

void TimeSyncAddgPTPServicesSync_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1BA88B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Failed to add gPTP services within the timeout period.\n", v0, 2u);
}

void TimeSyncRemovegPTPServices_cold_1()
{
  [0 code];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BA88B000, MEMORY[0x1E4F14500], v0, "Failed to remove gPTP services with error 0x%08x\n", v1, v2, v3, v4, v5);
}

void TimeSyncAddAirPlayPTPInstance_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BA88B000, MEMORY[0x1E4F14500], v1, "Failed to add AirPlay PTP Instance with error 0x%08x\n", v2, v3, v4, v5, v6);
}

void TimeSyncRemoveAirPlayPTPInstance_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BA88B000, MEMORY[0x1E4F14500], v1, "Failed to remove AirPlay PTP Instance with error 0x%08x\n", v2, v3, v4, v5, v6);
}

void TimeSyncAddCopresencePTPInstance_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BA88B000, MEMORY[0x1E4F14500], v1, "Failed to add Copresence PTP Instance with error 0x%08x\n", v2, v3, v4, v5, v6);
}

void TimeSyncRemoveCopresencePTPInstance_cold_1(void *a1)
{
  [a1 code];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1BA88B000, MEMORY[0x1E4F14500], v1, "Failed to remove Copresence PTP Instance with error 0x%08x\n", v2, v3, v4, v5, v6);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1F40D8048](cf);
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return MEMORY[0x1F40C9808](sdRef, *(void *)&flags, *(void *)&interfaceIndex, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceGetAddrInfo(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, const char *hostname, DNSServiceGetAddrInfoReply callBack, void *context)
{
  return MEMORY[0x1F40C9840](sdRef, *(void *)&flags, *(void *)&interfaceIndex, *(void *)&protocol, hostname, callBack, context);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
}

DNSServiceErrorType DNSServiceRegister(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, const char *host, uint16_t port, uint16_t txtLen, const void *txtRecord, DNSServiceRegisterReply callBack, void *context)
{
  return MEMORY[0x1F40C9888](sdRef, *(void *)&flags, *(void *)&interfaceIndex, name, regtype, domain, host, port);
}

DNSServiceErrorType DNSServiceResolve(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *name, const char *regtype, const char *domain, DNSServiceResolveReply callBack, void *context)
{
  return MEMORY[0x1F40C98A0](sdRef, *(void *)&flags, *(void *)&interfaceIndex, name, regtype, domain, callBack, context);
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return MEMORY[0x1F40C98B0](service, queue);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1F40C9C30]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1F40CB440](*(void *)&a1, a2, *(void *)&a3);
}

long double cos(long double __x)
{
  MEMORY[0x1F40CB8A8](__x);
  return result;
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC338](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1F40CC648](*(void *)&a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

mach_port_t mach_thread_self(void)
{
  return MEMORY[0x1F40CCA58]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x1F40CD528]();
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1F40CD980](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1F40CD988](a1, a2);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x1F40CD9A0](a1, a2, a3);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA78](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return MEMORY[0x1F40CDF00](*(void *)&task, semaphore, *(void *)&policy, *(void *)&value);
}

kern_return_t semaphore_destroy(task_t task, semaphore_t semaphore)
{
  return MEMORY[0x1F40CDF08](*(void *)&task, *(void *)&semaphore);
}

kern_return_t semaphore_signal(semaphore_t semaphore)
{
  return MEMORY[0x1F40CDF10](*(void *)&semaphore);
}

kern_return_t semaphore_wait(semaphore_t semaphore)
{
  return MEMORY[0x1F40CDF28](*(void *)&semaphore);
}

long double sin(long double __x)
{
  MEMORY[0x1F40CE058](__x);
  return result;
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CE090](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x1F40CE540](*(void *)&thread, *(void *)&flavor, policy_info, *(void *)&policy_infoCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
}

void vDSP_maxvD(const double *__A, vDSP_Stride __I, double *__C, vDSP_Length __N)
{
}

void vDSP_maxvi(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length *__I, vDSP_Length __N)
{
}

void vDSP_meanv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_meanvD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
}

void vDSP_svesqD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Length __N)
{
}

void vDSP_vabs(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vaddD(const double *__A, vDSP_Stride __IA, const double *__B, vDSP_Stride __IB, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vqint(const float *__A, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __M)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmulD(const double *__A, vDSP_Stride __IA, const double *__B, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsubD(const double *__B, vDSP_Stride __IB, const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vswmaxD(const double *__A, vDSP_Stride __IA, double *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __WindowLength)
{
}