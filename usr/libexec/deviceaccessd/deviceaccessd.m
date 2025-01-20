void sub_100003AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,char a60)
{
  _Block_object_dispose(&a60, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003B10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003B20(uint64_t a1)
{
}

void sub_100003B28(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v1 + 40);
  v2 = CUDescriptionWithLevel();
  NSAppendPrintF();
  objc_storeStrong((id *)(v1 + 40), obj);
}

void sub_100003B98(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = a3;
  id v6 = a2;
  v7 = [v5 discoverySet];
  [v7 count];
  v8 = [v5 discoveryObj];

  NSAppendPrintF();
  objc_storeStrong((id *)(v4 + 40), obj);
}

id sub_100003CC0(uint64_t a1)
{
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);

  return [v2 _activate];
}

id sub_1000040E4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _xpcListenerEvent:a2];
}

id sub_1000040F0(uint64_t a1)
{
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);

  return [v2 _prefsChanged];
}

id sub_100004174(uint64_t a1)
{
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);

  return [v2 _removeAllDevicesAndAppAccess];
}

uint64_t sub_1000041F8(uint64_t a1)
{
  return _CUStateDumpWithObject("DADaemon", *(void *)(a1 + 32), &dword_100043408);
}

id sub_100004214(uint64_t a1)
{
  return [*(id *)(a1 + 32) _keychainVerificationDevicesRestoredOnSameDevice];
}

id sub_10000421C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _keychainVerificationDevicesRestoredOnSameDevice];
}

void sub_100004224(id a1, OS_xpc_object *a2)
{
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

id sub_100004328(uint64_t a1)
{
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);

  return [v2 _invalidate];
}

void sub_100004608(id a1, NSString *a2, DADaemonDiscovery *a3, BOOL *a4)
{
  id v5 = a3;
  [(DADaemonDiscovery *)v5 setDeviceMap:0];
  uint64_t v4 = [(DADaemonDiscovery *)v5 discoveryObj];
  [v4 invalidate];

  [(DADaemonDiscovery *)v5 setDiscoveryObj:0];
  [(DADaemonDiscovery *)v5 setDiscoverySet:0];
}

id sub_100005254(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applicationsDidInstall:*(void *)(a1 + 40)];
}

void sub_10000533C(uint64_t a1, void *a2)
{
  id v9 = a2;
  v3 = [v9 bundleIdentifier];
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    v8 = v3;
    LogPrintF();
  }
  uint64_t v4 = [v9 appState:v8];
  unsigned __int8 v5 = [v4 isPlaceholder];

  if ((v5 & 1) == 0)
  {
    id v6 = [*(id *)(a1 + 32) appBundleInfoAccessoryOptions:v3];
    v7 = *(void **)(a1 + 32);
    if (v6) {
      [v7 _updateAppInfo:v3];
    }
    else {
      [v7 removeAppsAccessForBundleID:v3 appRemoval:0];
    }
  }
}

id sub_1000054CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applicationsDidUninstall:*(void *)(a1 + 40)];
}

void sub_1000055E8(uint64_t a1, void *a2)
{
  id v3 = [a2 bundleIdentifier];
  [*(id *)(a1 + 32) addObject:v3];
}

void sub_1000058B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000058EC(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
    && dword_100043408 <= 90
    && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }
}

void sub_100006128(uint64_t a1, void *a2)
{
  id v4 = [a2 appAccessInfoMap];
  if ([v4 count])
  {
    id v3 = [v4 allKeys];
    [*(id *)(a1 + 32) addObjectsFromArray:v3];
  }
}

void sub_1000063CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v8 = v3;
    LogPrintF();
  }
  id v4 = [v3 appAccessInfoMap:v8];
  unsigned __int8 v5 = [v4 allKeys];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000064EC;
  v9[3] = &unk_10003CB38;
  uint64_t v6 = *(void *)(a1 + 32);
  v9[4] = v4;
  v9[5] = v6;
  id v10 = v3;
  id v7 = v3;
  [v5 enumerateObjectsUsingBlock:v9];
}

void sub_1000064EC(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKey:a2];
  id v4 = v3;
  if (v3)
  {
    [v3 setState:0];
    unsigned __int8 v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    id v8 = 0;
    [v5 updateAppAccessInfo:v4 accessoryDevice:v6 removalType:1 error:&v8];
    id v7 = v8;
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

void sub_1000066B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000067B0;
  v7[3] = &unk_10003CB60;
  unsigned __int8 v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:v7];
}

void sub_1000067B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v3;
    LogPrintF();
  }
  uint64_t v4 = [v3 appAccessInfoMap:v9, v10];
  unsigned __int8 v5 = [v4 objectForKey:*(void *)(a1 + 32)];
  id v6 = v5;
  if (v5)
  {
    [v5 setState:0];
    id v7 = *(void **)(a1 + 40);
    id v11 = 0;
    [v7 updateAppAccessInfo:v6 accessoryDevice:v3 removalType:1 error:&v11];
    id v8 = v11;
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

void sub_100006A34(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 appAccessInfoMap];
  id v8 = [v7 objectForKey:*(void *)(a1 + 32)];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 setState:0];
    uint64_t v10 = *(unsigned __int8 *)(a1 + 48);
    id v11 = *(void **)(a1 + 40);
    uint64_t v12 = 0;
    [v11 updateAppAccessInfo:v9 accessoryDevice:v6 removalType:v10 error:&v12];
    *a4 = 1;
  }
}

id sub_100006B6C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) appBundleInfoAccessoryOptions:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [v3 _updateAppInfo:v4 options:v2];
}

void sub_100006D18(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v3;
    LogPrintF();
  }
  uint64_t v4 = [v3 appAccessInfoMap:v9, v10];
  unsigned __int8 v5 = [v4 objectForKey:*(void *)(a1 + 32)];
  id v6 = v5;
  if (v5 && [v5 accessoryOptions] != *(id *)(a1 + 48))
  {
    id v7 = *(void **)(a1 + 40);
    id v11 = 0;
    [v7 updateAppAccessInfo:v6 accessoryDevice:v3 removalType:0 error:&v11];
    id v8 = v11;
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

void sub_1000073C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  (*(void (**)(void))(a10 + 16))();
  _Block_object_dispose((const void *)(v10 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_100007418(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && dword_100043408 <= 90
    && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v1 = CUPrintNSError();
    LogPrintF();
  }
}

void sub_1000074E4(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) hasPrefix:@"com.apple."];
  if ([*(id *)(a1 + 40) state] == (id)20)
  {
    if (*(void *)(a1 + 80) == 3) {
      uint64_t v3 = 100;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  if (v2) {
    uint64_t v4 = 6;
  }
  else {
    uint64_t v4 = 1;
  }
  id v5 = [*(id *)(a1 + 48) state];
  id v10 = [*(id *)(a1 + 40) identifier];
  id v6 = [*(id *)(a1 + 56) appAccessInfoMap];
  BOOL v7 = (unint64_t)[v6 count] > 1;
  id v8 = [*(id *)(*(void *)(a1 + 64) + 80) objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v9 = [v8 discoveryObj];
  +[DADeviceAccessAnalytics markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:](DADeviceAccessAnalytics, "markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:", v5, v10, v7, v9, [*(id *)(a1 + 56) flags], v4, *(void *)(a1 + 72), v3);
}

void *sub_1000078C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v2 == result[4]) {
    return [result _checkAppAccessInfo];
  }
  return result;
}

void sub_100007AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_100007B18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v6 approveTime];
  double v8 = v7;
  id v9 = [v6 state];
  id v10 = [*(id *)(a1 + 32) bluetoothClassicAddress];

  if (v10) {
    BOOL v11 = v9 == (id)25;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    v13 = [*(id *)(a1 + 32) bluetoothIdentifier];
    if (v13 && [*(id *)(*(void *)(a1 + 40) + 264) state] == (id)5)
    {
      v14 = *(void **)(*(void *)(a1 + 40) + 264);
      v37 = v13;
      v15 = +[NSArray arrayWithObjects:&v37 count:1];
      v16 = [v14 retrievePeripheralsWithIdentifiers:v15];

      if (v16)
      {
        if ([v16 count])
        {
          uint64_t v17 = [*(id *)(a1 + 32) bluetoothClassicAddress];
          if (v17)
          {
            v18 = (void *)v17;
            unsigned __int16 v19 = (unsigned __int16)[*(id *)(a1 + 32) flags];

            if ((v19 & 0x200) == 0)
            {
              v20 = [v16 firstObject];
              v21 = [v20 customProperty:@"ASK_RELATED_RADIO_ADDRESS"];
              id v22 = [v21 length];

              if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
              {
                id v33 = v16;
                BOOL v34 = v22 != 0;
                LogPrintF();
              }
              if (v22)
              {
                *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

                uint64_t v12 = 120;
                goto LABEL_8;
              }
              v27 = [v20 customProperty:@"ASK_LINKED_RADIO_ADDRESS"];
              id v28 = [v27 length];

              if (v28)
              {
                [*(id *)(a1 + 32) setFlags:((unint64_t)[*(id *)(a1 + 32) flags] | 0x200)];
                uint64_t v30 = *(void *)(a1 + 32);
                v29 = *(void **)(a1 + 40);
                id v36 = 0;
                unsigned __int8 v31 = [v29 updateAppAccessInfo:v6 accessoryDevice:v30 removalType:0 error:&v36];
                id v32 = v36;
                if ((v31 & 1) == 0
                  && dword_100043408 <= 90
                  && (dword_100043408 != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                }
              }
              else
              {
                *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
              }
            }
          }
        }
      }
    }
    goto LABEL_43;
  }
  if (v9 != (id)20 && v9 != (id)10) {
    goto LABEL_43;
  }
  uint64_t v12 = 104;
LABEL_8:
  if (*(double *)(*(void *)(a1 + 40) + v12) - (*(double *)(a1 + 56) - v8) <= 0.0)
  {
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      id v33 = v6;
      LogPrintF();
    }
    [v6 setState:0, v33, v34];
    uint64_t v24 = *(void *)(a1 + 32);
    v23 = *(void **)(a1 + 40);
    id v35 = 0;
    unsigned __int8 v25 = [v23 updateAppAccessInfo:v6 accessoryDevice:v24 removalType:3 error:&v35];
    id v26 = v35;
    if ((v25 & 1) == 0 && dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
LABEL_43:
}

void sub_10000848C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  (*(void (**)(uint64_t))(v33 + 16))(v33);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1000084F4(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
    && dword_100043408 <= 90
    && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }
}

void *sub_1000085B8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  result = *(void **)(a1 + 40);
  if (v2 == result[6]) {
    return [result _checkDevices];
  }
  return result;
}

void sub_1000091C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = CFDictionaryGetInt64Ranged() << 32;
    if (v4 == 0x1900000000 || v4 == 0x1400000000)
    {
      id v6 = [objc_alloc((Class)DADevice) initWithPersistentDictionaryRepresentation:v8 error:0];
      if (v6)
      {
        double v7 = v6;
        [*(id *)(a1 + 32) addObject:v6];
      }
    }
  }
}

void sub_100009808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(void))(a5 + 16))();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009864(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
    && dword_100043408 <= 90
    && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v1 = CUPrintNSError();
    LogPrintF();
  }
}

void sub_10000A740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  (*(void (**)(void))(a19 + 16))();
  _Block_object_dispose(&a72, 8);
  _Unwind_Resume(a1);
}

void sub_10000A804(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
    && dword_100043408 <= 90
    && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }
}

void sub_10000A8C8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = [v6 objectForKeyedSubscript:v5];

  if (!v8)
  {
    id v9 = +[NSMutableDictionary dictionary];
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v5];
  }
  id v10 = objc_alloc((Class)DADeviceAppAccessInfo);
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v11 + 40);
  id v12 = [v10 initWithPersistentDictionaryRepresentation:v7 error:&obj];

  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    v14 = [v12 bundleIdentifier];
    [v13 setObject:v12 forKeyedSubscript:v14];
  }
}

void sub_10000A9E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v7 = a3;
  id v8 = [v6 objectForKeyedSubscript:v5];

  if (!v8)
  {
    id v9 = +[NSMutableDictionary dictionary];
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v5];
  }
  id v10 = objc_alloc((Class)DADeviceAppAccessInfo);
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v11 + 40);
  id v12 = [v10 initWithPersistentDictionaryRepresentation:v7 error:&obj];

  objc_storeStrong((id *)(v11 + 40), obj);
  if (v12)
  {
    v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    [v13 setObject:v12 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

void sub_10000B610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B638(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id v6 = [v5 configuration];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 associationIdentifier];
    id v9 = [*(id *)(a1 + 32) associationIdentifier];
    unsigned int v10 = [v9 isEqualToString:v8];

    if (v10)
    {
      if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v15 = *(void *)(a1 + 40);
        uint64_t v16 = *(void *)(a1 + 32);
        v14 = v7;
        LogPrintF();
      }
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v7);
      *a3 = 1;
    }
  }
  uint64_t v11 = [v5 configurations:v14, v15, v16];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000B7E0;
  v17[3] = &unk_10003CCF0;
  id v18 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  id v19 = v12;
  uint64_t v20 = v13;
  v21 = a3;
  [v11 enumerateObjectsUsingBlock:v17];
}

void sub_10000B7E0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  id v7 = [v10 associationIdentifier];
  id v8 = [*(id *)(a1 + 32) associationIdentifier];
  unsigned int v9 = [v8 isEqualToString:v7];

  if (v9)
  {
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
    **(unsigned char **)(a1 + 56) = 1;
  }
}

id sub_10000B978(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  return [*(id *)(a1 + 32) _checkAppAccessInfo];
}

id sub_10000BA0C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 40) = 0;
  return [*(id *)(a1 + 32) _checkDevices];
}

void sub_10000C9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_10000CAFC(uint64_t a1)
{
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CBE8;
  block[3] = &unk_10003CD40;
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(v2, block);
}

void sub_10000CBE8(uint64_t a1)
{
  if (*(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 2)
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFStringRef v8 = @"GroupableDevicesCount";
    uint64_t v2 = +[NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
    unsigned int v9 = v2;
    uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];

    +[DADeviceAccessAnalytics sendAnalytics:v3 forEvent:@"com.apple.Bluetooth.DeviceGroupingUsage"];
  }
  if (*(int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) >= 2)
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFStringRef v6 = @"GroupableDevicesCount";
    long long v4 = +[NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    id v7 = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];

    +[DADeviceAccessAnalytics sendAnalytics:v5 forEvent:@"com.apple.Bluetooth.GroupedDevices"];
  }
}

void sub_10000F200(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_10000F244(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 accessoryOptions]) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= 1uLL;
  }
  unsigned __int8 v5 = [v4 accessoryOptions];

  if ((v5 & 2) != 0) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) |= 2uLL;
  }
}

void sub_10000F448(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [objc_alloc((Class)DADevice) initWithPersistentDictionaryRepresentation:v5 error:0];
    if (v6) {
      [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:v7];
    }
  }
}

void *sub_10000F6E0(void *result)
{
  if (result[4] == *(void *)(result[5] + 72))
  {
    uint64_t v1 = result;
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v2 = (void *)v1[5];
    return [v2 _checkDevices];
  }
  return result;
}

void sub_10000FBA8(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) discoveryObj];

  if (v3 == v4) {
    [*(id *)(a1 + 48) _discoveryEvent:v5 appID:*(void *)(a1 + 56)];
  }
}

void sub_10000FEF4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 appAccessInfoMap];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000FFA8;
  v7[3] = &unk_10003CDE0;
  void v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

void sub_10000FFA8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 appDiscoveryConfiguration];
    unsigned __int8 v7 = [v6 flags];
    if ([v5 state] != (id)25 && (v7 & 0x10) != 0)
    {
      [v5 setState:0];
      id v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
      id v11 = 0;
      [v8 updateAppAccessInfo:v5 accessoryDevice:v9 removalType:1 error:&v11];
      id v10 = v11;
      if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

void sub_1000106DC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasPrefix:@"com.apple."]) {
    uint64_t v2 = 6;
  }
  else {
    uint64_t v2 = 1;
  }
  id v6 = [*(id *)(a1 + 40) identifier];
  uint64_t v3 = [*(id *)(a1 + 40) appAccessInfoMap];
  BOOL v4 = (unint64_t)[v3 count] > 1;
  id v5 = [*(id *)(a1 + 48) discoveryObj];
  +[DADeviceAccessAnalytics markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:](DADeviceAccessAnalytics, "markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:", 5, v6, v4, v5, [*(id *)(a1 + 40) flags], v2, *(void *)(a1 + 56), 0);
}

void sub_100010C0C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasPrefix:@"com.apple."]) {
    uint64_t v2 = 6;
  }
  else {
    uint64_t v2 = 1;
  }
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 40);
  id v7 = [*(id *)(a1 + 48) appAccessInfoDeviceMap];
  BOOL v5 = (unint64_t)[v7 count] > 1;
  id v6 = [*(id *)(a1 + 56) discoveryObj];
  +[DADeviceAccessAnalytics markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:](DADeviceAccessAnalytics, "markState:deviceID:shared:discovery:flags:sourceApp:atTime:errorCode:", v3, v4, v5, v6, [*(id *)(a1 + 48) flags], v2, *(void *)(a1 + 64), 0);
}

uint64_t sub_100011960()
{
  if (dword_100043408 <= 50)
  {
    if (dword_100043408 != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

void sub_100011A80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100011EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100011EE0(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
    && dword_100043408 <= 90
    && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }
}

void sub_100012478(id a1, NSUUID *a2, NSDictionary *a3, BOOL *a4)
{
  uint64_t v4 = a3;
  id v11 = [(NSDictionary *)v4 objectForKeyedSubscript:@"CBPeripheral"];
  BOOL v5 = [(NSDictionary *)v4 objectForKeyedSubscript:@"DADevice"];
  id v6 = [(NSDictionary *)v4 objectForKeyedSubscript:@"DiscoveryObj"];

  if (v11)
  {
    uint64_t v7 = [v11 name];
    if (!v7
      || (id v8 = (void *)v7,
          [v11 name],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          id v10 = [v9 length],
          v9,
          v8,
          !v10))
    {
      if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
  }
}

void sub_1000128EC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_100012908(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v38 = a3;
  id v7 = a4;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v8 = sub_10002636C(a2);
    uint64_t v36 = *(void *)(a1 + 32);
    id v37 = v7;
    BOOL v34 = v8;
    id v35 = v38;
    LogPrintF();
  }
  uint64_t v9 = [*(id *)(a1 + 40) hotspotSSIDPrefixes:v34, v35, v36, v37];
  if ([v9 count])
  {
    BOOL v10 = 1;
  }
  else
  {
    id v11 = [*(id *)(a1 + 40) hotspotSSIDs];
    BOOL v10 = [v11 count] != 0;
  }
  unsigned int v12 = [v38 appConfirmsAuth];
  unsigned int v13 = v12;
  if (a2 <= 19)
  {
    if (!a2)
    {
LABEL_44:
      *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
      goto LABEL_45;
    }
    if (a2 != 10 || !v12) {
      goto LABEL_54;
    }
LABEL_25:
    uint64_t v18 = *(void *)(*(void *)(a1 + 88) + 8);
    goto LABEL_26;
  }
  if (a2 != 20)
  {
    if (a2 == 30)
    {
      if ([v7 code] == (id)350014)
      {
        uint64_t v20 = [*(id *)(a1 + 48) bluetoothIdentifier];
        v21 = [*(id *)(a1 + 56) _findDADeviceWithBTIdentifier:v20];
        id v22 = [v21 appAccessInfoMap];
        v23 = [v22 objectForKeyedSubscript:*(void *)(a1 + 72)];

        if ([v23 state] == (id)25)
        {

LABEL_53:
          goto LABEL_54;
        }
        *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;

        goto LABEL_45;
      }
      goto LABEL_44;
    }
    if (a2 != 40) {
      goto LABEL_54;
    }
    id v14 = [v38 pairingType];
    unsigned __int8 v15 = [v38 pairingRequired];
    if (v13 && (v15 & 1) == 0)
    {
      if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      [*(id *)(*(void *)(a1 + 56) + 304) respondToPairingRequest:*(void *)(a1 + 64) type:v14 accept:0 passkey:0];
      goto LABEL_44;
    }
    if (v14)
    {
      if (v14 != (id)10)
      {
        id v29 = v38;
        id v30 = [objc_alloc((Class)DAEventDeviceBluetoothPairingRequest) initWithEventType:55 pairingInfo:v29];

        [*(id *)(a1 + 56) _discoveryEvent:v30 appID:*(void *)(a1 + 72)];
        goto LABEL_40;
      }
      uint64_t v24 = *(void *)(a1 + 64);
      unsigned __int8 v25 = *(void **)(*(void *)(a1 + 56) + 304);
      uint64_t v26 = 10;
      uint64_t v27 = 1;
    }
    else
    {
      uint64_t v24 = *(void *)(a1 + 64);
      unsigned __int8 v25 = *(void **)(*(void *)(a1 + 56) + 304);
      uint64_t v26 = 0;
      uint64_t v27 = 0;
    }
    [v25 respondToPairingRequest:v24 type:v26 accept:v27 passkey:0];
LABEL_40:
    uint64_t v18 = *(void *)(*(void *)(a1 + 88) + 8);
    uint64_t v19 = 10;
    goto LABEL_41;
  }
  uint64_t v16 = [*(id *)(a1 + 48) SSID];
  if (v16) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = v10;
  }

  if (v17) {
    goto LABEL_25;
  }
  id v28 = [*(id *)(a1 + 48) bluetoothIdentifier];

  if (!v28) {
    goto LABEL_54;
  }
  uint64_t v18 = *(void *)(*(void *)(a1 + 88) + 8);
  if ((v13 & 1) == 0)
  {
    uint64_t v19 = 25;
    goto LABEL_41;
  }
LABEL_26:
  uint64_t v19 = 20;
LABEL_41:
  *(void *)(v18 + 24) = v19;
LABEL_45:
  uint64_t v20 = [*(id *)(a1 + 56) _updateStateForDiscoveryDeviceID:*(void *)(a1 + 80) state:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) appID:*(void *)(a1 + 72)];
  if (v20
    || ([*(id *)(a1 + 48) bluetoothIdentifier],
        unsigned __int8 v31 = objc_claimAutoreleasedReturnValue(),
        [*(id *)(a1 + 56) _findDADeviceWithBTIdentifier:v31],
        uint64_t v20 = objc_claimAutoreleasedReturnValue(),
        v31,
        v20))
  {
    if (v38)
    {
      if (a2 == 20 && !v7)
      {
        [v20 setFlags:((unint64_t)[v20 flags] | 0x40)];
        if ([v38 pairedWithCTKD]) {
          [v20 setFlags:((unint64_t)[v20 flags] | 0x20)];
        }
      }
    }
    [*(id *)(a1 + 32) setState:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 24)];
    [*(id *)(a1 + 56) updateAppAccessInfo:*(void *)(a1 + 32) accessoryDevice:v20 removalType:0 error:0];
    goto LABEL_53;
  }
LABEL_54:
  if (([*(id *)(*(void *)(a1 + 56) + 304) busy] & 1) == 0)
  {
    uint64_t v32 = *(void *)(a1 + 56);
    uint64_t v33 = *(void **)(v32 + 304);
    *(void *)(v32 + 304) = 0;
  }
}

void sub_100012E78(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v14 = a3;
  id v7 = a4;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v8 = sub_10002636C(a2);
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = v7;
    id v11 = v8;
    LogPrintF();
  }
  if ((objc_msgSend(*(id *)(*(void *)(a1 + 40) + 304), "busy", v11, v12, v13) & 1) == 0)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    BOOL v10 = *(void **)(v9 + 304);
    *(void *)(v9 + 304) = 0;
  }
}

void sub_10001308C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v10 = v5;
    id v11 = v6;
    LogPrintF();
  }
  id v7 = [v6 discoverySet:v10, v11];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000131A8;
  v12[3] = &unk_10003CF60;
  uint64_t v8 = *(void *)(a1 + 32);
  id v13 = v5;
  uint64_t v14 = v8;
  id v9 = v5;
  [v7 enumerateObjectsUsingBlock:v12];
}

void sub_1000131A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = v3;
    LogPrintF();
  }
  uint64_t v4 = +[NSMutableArray array];
  id v5 = [v3 configuration];
  if (v5) {
    [v4 addObject:v5];
  }
  id v6 = [v3 configurations];
  if (v6) {
    [v4 addObjectsFromArray:v6];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001330C;
  v11[3] = &unk_10003CF38;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v12 = v7;
  uint64_t v13 = v8;
  [v4 enumerateObjectsUsingBlock:v11];
}

void sub_10001330C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v11 = v3;
  if (dword_100043408 <= 50)
  {
    if (dword_100043408 != -1 || (int v4 = _LogCategory_Initialize(), v3 = v11, v4))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v9 = v3;
      LogPrintF();
      id v3 = v11;
    }
  }
  id v5 = [*(id *)(a1 + 40) _parseDADiscoveryConfiguration:v3, v7, v9];
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v5;
    LogPrintF();
  }
  if (objc_msgSend(v5, "count", v8, v10))
  {
    [*(id *)(*(void *)(a1 + 40) + 280) addObjectsFromArray:v5];
    uint64_t v6 = *(void *)(a1 + 40);
    if (!*(void *)(v6 + 256)) {
      objc_storeStrong((id *)(v6 + 256), *(id *)(a1 + 32));
    }
  }
}

void sub_1000135DC(uint64_t a1, void *a2)
{
  uint64_t v3 = CBCentralManagerScanOptionMatchingRuleServiceUUID;
  id v4 = a2;
  id v5 = [v4 objectForKey:v3];
  uint64_t v6 = [v4 objectForKey:CBCentralManagerScanOptionFilterIdentifierString];

  if (v5)
  {
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 264);
    unsigned __int8 v15 = v5;
    uint64_t v8 = +[NSArray arrayWithObjects:&v15 count:1];
    id v9 = [v7 retrieveConnectedPeripheralsWithServices:v8];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100013738;
    v12[3] = &unk_10003CFB0;
    id v10 = v6;
    uint64_t v11 = *(void *)(a1 + 32);
    id v13 = v10;
    uint64_t v14 = v11;
    [v9 enumerateObjectsUsingBlock:v12];
  }
}

void sub_100013738(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)objc_opt_new();
  [v4 setObject:*(void *)(a1 + 32) forKey:CBCentralManagerScanOptionFilterIdentifierString];
  [*(id *)(a1 + 40) centralManager:*(void *)(*(void *)(a1 + 40) + 264) didDiscoverPeripheral:v3 advertisementData:v4 RSSI:&off_10003E548];
}

void sub_1000137CC(id a1, NSError *a2, NSNumber *a3)
{
  uint64_t v6 = a2;
  id v4 = a3;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v5 = CUPrintNSError();
    LogPrintF();
  }
}

void sub_100013A64(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"ADVData"];
  uint64_t v7 = [v6 objectForKeyedSubscript:CBAdvertisementDataTimestamp];
  [v7 doubleValue];
  double v9 = v8;

  double v10 = *(double *)(*(void *)(a1 + 32) + 128) + *(double *)(*(void *)(a1 + 32) + 128);
  double v11 = *(double *)(a1 + 48) - v9;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    double v13 = v11;
    double v14 = v10;
    id v12 = v15;
    LogPrintF();
  }
  if (v11 > v10)
  {
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      [*(id *)(a1 + 40) addObject:v5, v15, *(void *)&v13, *(void *)&v14];
    }
    else
    {
      [*(id *)(a1 + 40) addObject:v5, v12, *(void *)&v13, *(void *)&v14];
    }
  }
}

void sub_100013BE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v13 = [v3 objectForKeyedSubscript:@"CBPeripheral"];
  id v4 = [v3 objectForKeyedSubscript:@"ADVData"];
  id v5 = [v4 objectForKeyedSubscript:CBAdvertisementDataTimestamp];
  [v5 doubleValue];
  double v7 = v6;

  double v8 = [v3 objectForKeyedSubscript:@"DADevice"];

  double v9 = [v13 identifier];
  [*(id *)(*(void *)(a1 + 32) + 288) removeObjectForKey:v9];
  double v12 = *(double *)(a1 + 40) - v7;
  double v10 = DAErrorF();
  id v11 = [objc_alloc((Class)DADeviceEvent) initWithEventType:41 device:v8 error:v10, v8, v13, *(void *)&v12];
  [*(id *)(a1 + 32) _discoveryEvent:v11 appID:*(void *)(*(void *)(a1 + 32) + 256)];
}

void *sub_100013E7C(void *result)
{
  uint64_t v1 = (void *)result[4];
  uint64_t v2 = result[5];
  if (v1 == *(void **)(v2 + 312))
  {
    id v3 = result;
    *(void *)(v2 + 312) = 0;

    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(id)v3[5] _stopBTScan];
    [(id)v3[5] _checkAndReportLostBTDevices];
    uint64_t result = (void *)v3[5];
    if (*((unsigned char *)result + 296))
    {
      [result _startBTScan];
      id v4 = (void *)v3[5];
      return [v4 _armBTScanTimer];
    }
  }
  return result;
}

void sub_10001412C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = [a3 objectForKeyedSubscript:@"DADevice"];
  id v4 = DAErrorF();
  id v5 = [objc_alloc((Class)DADeviceEvent) initWithEventType:41 device:v6 error:v4];
  [*(id *)(a1 + 32) _discoveryEvent:v5 appID:*(void *)(*(void *)(a1 + 32) + 256)];
}

void sub_100014478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014494(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  double v7 = [v10 bluetoothIdentifier];
  double v8 = [*(id *)(a1 + 32) identifier];
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

void sub_100014818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014834(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  double v7 = [v9 bluetoothIdentifier];
  unsigned int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

void sub_100015070(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v11 = v5;
    id v12 = v6;
    LogPrintF();
  }
  double v7 = [v6 discoverySet:v11, v12];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000151D8;
  v13[3] = &unk_10003D108;
  id v14 = v5;
  id v15 = *(id *)(a1 + 32);
  id v16 = v6;
  unsigned int v8 = *(void **)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 40);
  id v18 = v8;
  id v19 = *(id *)(a1 + 56);
  id v9 = v6;
  id v10 = v5;
  [v7 enumerateObjectsUsingBlock:v13];
}

void sub_1000151D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v13 = v3;
    LogPrintF();
  }
  id v4 = [v3 configuration:v11, v13];
  if (v4)
  {
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      id v14 = v4;
      LogPrintF();
    }
    id v5 = [v4 associationIdentifier:v12, v14];
    id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:CBCentralManagerScanOptionFilterIdentifierString];
    unsigned int v7 = [v6 isEqualToString:v5];

    if (v7)
    {
      if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v16 = *(void *)(a1 + 48);
        LogPrintF();
        [*(id *)(a1 + 56) _reportDiscoveredBTDevice:advertisementData:RSSI:AppID:DADaemonDiscovery:DADiscovery:config:*(void *)(a1 + 64) *(void *)(a1 + 40) *(void *)(a1 + 72) *(void *)(a1 + 32) *(void *)(a1 + 48) v3 v4 v16 v3 v4];
      }
      else
      {
        [*(id *)(a1 + 56) _reportDiscoveredBTDevice:*(void *)(a1 + 64) advertisementData:*(void *)(a1 + 40) RSSI:*(void *)(a1 + 72) AppID:*(void *)(a1 + 32) DADaemonDiscovery:*(void *)(a1 + 48) config:v3, v4, v15, v17, v18];
      }
    }
  }
  unsigned int v8 = [v3 configurations];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001547C;
  v19[3] = &unk_10003D0E0;
  id v20 = *(id *)(a1 + 32);
  id v21 = *(id *)(a1 + 40);
  id v22 = *(id *)(a1 + 48);
  id v23 = v3;
  id v9 = *(void **)(a1 + 64);
  uint64_t v24 = *(void *)(a1 + 56);
  id v25 = v9;
  id v26 = *(id *)(a1 + 72);
  id v10 = v3;
  [v8 enumerateObjectsUsingBlock:v19];
}

void sub_10001547C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v15 = v3;
  if (dword_100043408 <= 50)
  {
    if (dword_100043408 != -1 || (int v4 = _LogCategory_Initialize(), v3 = v15, v4))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = v3;
      LogPrintF();
      id v3 = v15;
    }
  }
  id v5 = [v3 associationIdentifier:v8, v9];
  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:CBCentralManagerScanOptionFilterIdentifierString];
  unsigned int v7 = [v6 isEqualToString:v5];

  if (v7)
  {
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v13 = *(void *)(a1 + 56);
      uint64_t v11 = *(void *)(a1 + 48);
      LogPrintF();
      [*(id *)(a1 + 64) _reportDiscoveredBTDevice:*(void *)(a1 + 72) advertisementData:*(void *)(a1 + 40) RSSI:*(void *)(a1 + 80) AppID:*(void *)(a1 + 32) DADaemonDiscovery:*(void *)(a1 + 48) DADiscovery:*(void *)(a1 + 56) config:v15, v11, v13, v15];
    }
    else
    {
      [*(id *)(a1 + 64) _reportDiscoveredBTDevice:advertisementData:RSSI:AppID:DADaemonDiscovery:DADiscovery:config:*(void *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 80), *(void *)(a1 + 32), *(void *)(a1 + 48), *(void *)(a1 + 56), v15, v10, v12, v14];
    }
  }
}

void sub_100015B80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v9 = v5;
    id v10 = v6;
    LogPrintF();
  }
  unsigned int v7 = [v6 discoverySet:v9, v10];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100015CAC;
  v11[3] = &unk_10003CF60;
  id v12 = v5;
  id v13 = *(id *)(a1 + 32);
  id v8 = v5;
  [v7 enumerateObjectsUsingBlock:v11];
}

void sub_100015CAC(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 configuration];
  if (!v4)
  {
LABEL_39:
    id v29 = [v3 configurations];
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10001613C;
    v36[3] = &unk_10003CF38;
    id v37 = *(id *)(a1 + 32);
    id v38 = *(id *)(a1 + 40);
    [v29 enumerateObjectsUsingBlock:v36];

    goto LABEL_40;
  }
  id v5 = &OBJC_IVAR___DADaemonServer__prefCheckAppAccessInfoSeconds;
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    unsigned int v7 = [v4 hotspotSSIDs];
    [v4 hotspotSSIDPrefixes];
    v33 = uint64_t v32 = v7;
    uint64_t v30 = v6;
    unsigned __int8 v31 = v4;
    id v5 = &OBJC_IVAR___DADaemonServer__prefCheckAppAccessInfoSeconds;
    LogPrintF();
  }
  id v8 = [v4 bundleID:v30, v31, v32, v33];
  id v9 = [v4 bluetoothCompanyIdentifiers];
  if ([v9 count]) {
    goto LABEL_17;
  }
  id v10 = [v4 bluetoothCompanyPayload];
  if ([v10 length])
  {
LABEL_16:

LABEL_17:
    goto LABEL_18;
  }
  uint64_t v11 = [v4 bluetoothCompanyPayloadMask];
  if ([v11 length])
  {
LABEL_15:

    goto LABEL_16;
  }
  id v12 = [v4 bluetoothNameSubstring];
  if ([v12 length])
  {
LABEL_14:

    goto LABEL_15;
  }
  id v13 = [v4 bluetoothServicePayload];
  if ([v13 length])
  {
LABEL_13:

    goto LABEL_14;
  }
  id v35 = v3;
  uint64_t v14 = [v4 bluetoothServicePayloadMask];
  if ([v14 length])
  {

    id v3 = v35;
    goto LABEL_13;
  }
  uint64_t v16 = [v4 bluetoothServices];
  id v34 = [v16 count];

  id v5 = &OBJC_IVAR___DADaemonServer__prefCheckAppAccessInfoSeconds;
  id v3 = v35;
  if (!v34)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v17 = [v4 hotspotSSIDs];
    id v18 = [v17 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v44;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v44 != v20) {
            objc_enumerationMutation(v17);
          }
          id v22 = [[DAWiFiScanDescriptor alloc] initWithSSID:*(void *)(*((void *)&v43 + 1) + 8 * i)];
          [(DAWiFiScanDescriptor *)v22 setBundleID:v8];
          [(DAWiFiScanDescriptor *)v22 setConfiguration:v4];
          [*(id *)(a1 + 40) addObject:v22];
        }
        id v19 = [v17 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v19);
    }

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v23 = [v4 hotspotSSIDPrefixes];
    id v24 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v40;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v40 != v26) {
            objc_enumerationMutation(v23);
          }
          id v28 = [[DAWiFiScanDescriptor alloc] initWithPrefix:*(void *)(*((void *)&v39 + 1) + 8 * (void)j)];
          [(DAWiFiScanDescriptor *)v28 setBundleID:v8];
          [(DAWiFiScanDescriptor *)v28 setConfiguration:v4];
          [*(id *)(a1 + 40) addObject:v28];
        }
        id v25 = [v23 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v25);
    }

    goto LABEL_39;
  }
LABEL_18:
  int v15 = v5[258];
  if (v15 <= 50 && (v15 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

LABEL_40:
}

void sub_10001613C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [v3 hotspotSSIDs];
    [v3 hotspotSSIDPrefixes];
    id v28 = v27 = v5;
    uint64_t v25 = v4;
    id v26 = v3;
    LogPrintF();
  }
  uint64_t v6 = [v3 bluetoothCompanyIdentifiers:v25, v26, v27, v28];
  if ([v6 count]) {
    goto LABEL_16;
  }
  unsigned int v7 = [v3 bluetoothCompanyPayload];
  if ([v7 length])
  {
LABEL_15:

LABEL_16:
LABEL_17:
    if (dword_100043408 <= 50 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    goto LABEL_38;
  }
  id v8 = [v3 bluetoothCompanyPayloadMask];
  if ([v8 length])
  {
LABEL_14:

    goto LABEL_15;
  }
  id v9 = [v3 bluetoothNameSubstring];
  if ([v9 length])
  {
LABEL_13:

    goto LABEL_14;
  }
  id v10 = [v3 bluetoothServicePayload];
  if ([v10 length])
  {
LABEL_12:

    goto LABEL_13;
  }
  uint64_t v11 = [v3 bluetoothServicePayloadMask];
  if ([v11 length])
  {

    goto LABEL_12;
  }
  id v12 = [v3 bluetoothServices];
  id v29 = [v12 count];

  if (v29) {
    goto LABEL_17;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = [v3 hotspotSSIDs];
  id v14 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = [[DAWiFiScanDescriptor alloc] initWithSSID:*(void *)(*((void *)&v34 + 1) + 8 * i)];
        [(DAWiFiScanDescriptor *)v18 setBundleID:*(void *)(a1 + 32)];
        [(DAWiFiScanDescriptor *)v18 setConfiguration:v3];
        [*(id *)(a1 + 40) addObject:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v15);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v19 = [v3 hotspotSSIDPrefixes];
  id v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v31;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        id v24 = [[DAWiFiScanDescriptor alloc] initWithPrefix:*(void *)(*((void *)&v30 + 1) + 8 * (void)j)];
        [(DAWiFiScanDescriptor *)v24 setBundleID:*(void *)(a1 + 32)];
        [(DAWiFiScanDescriptor *)v24 setConfiguration:v3];
        [*(id *)(a1 + 40) addObject:v24];
      }
      id v21 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v21);
  }

LABEL_38:
}

void sub_100016500(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      id v7 = v6;
      LogPrintF();
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100016648;
    v8[3] = &unk_10003D158;
    v8[4] = *(void *)(a1 + 32);
    [v6 enumerateKeysAndObjectsUsingBlock:v8, v7];
  }
}

void sub_100016648(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v38 = v4;
    id v40 = v5;
    LogPrintF();
  }
  long long v45 = [[*(id *)(a1 + 32) getDevicesWithFlags:8 appID:v38 v40];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v5;
  id v46 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v46)
  {
    uint64_t v43 = *(void *)v53;
    long long v44 = v4;
    do
    {
      for (i = 0; i != v46; i = (char *)i + 1)
      {
        if (*(void *)v53 != v43) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        id v8 = v45;
        id v9 = [v8 countByEnumeratingWithState:&v48 objects:v56 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v49;
LABEL_12:
          uint64_t v12 = 0;
          while (1)
          {
            if (*(void *)v49 != v11) {
              objc_enumerationMutation(v8);
            }
            id v13 = *(void **)(*((void *)&v48 + 1) + 8 * v12);
            id v14 = [v13 SSID];
            id v15 = [v7 SSID];
            unsigned int v16 = [v14 isEqualToString:v15];

            if (v16) {
              break;
            }
            if (v10 == (id)++v12)
            {
              id v10 = [v8 countByEnumeratingWithState:&v48 objects:v56 count:16];
              if (v10) {
                goto LABEL_12;
              }
              goto LABEL_18;
            }
          }
          id v4 = v44;
          if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            [v44 bundleID];
            v41 = id v39 = v13;
            LogPrintF();
          }
          uint64_t v17 = [v44 configuration:v39, v41];
          [v13 setDiscoveryConfiguration:v17];

          if ([v7 isUnsecured]) {
            [v13 setFlags:((unint64_t)[v13 flags] | 0x80)];
          }
          id v18 = v13;

          if (v18) {
            goto LABEL_30;
          }
        }
        else
        {
LABEL_18:

          id v4 = v44;
        }
        id v18 = objc_alloc_init((Class)DADevice);
        id v19 = +[NSUUID UUID];
        id v20 = [v19 UUIDString];
        [v18 setIdentifier:v20];

        id v21 = [v4 configuration];
        [v18 setDiscoveryConfiguration:v21];

        uint64_t v22 = [v7 SSID];
        [v18 setSSID:v22];

        [v18 setFlags:8];
        id v23 = [v4 configuration];
        id v24 = [v23 displayName];
        [v18 setName:v24];

        if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          [v4 bundleID];
          v41 = id v39 = v18;
          LogPrintF();
        }
LABEL_30:
        uint64_t v25 = [v18 appAccessInfoMap:v39, v41];
        id v26 = [v4 bundleID];
        uint64_t v27 = [v25 objectForKeyedSubscript:v26];
        unsigned __int8 v28 = [v27 accessoryOptions];

        id v29 = *(void **)(a1 + 32);
        long long v30 = [v4 bundleID];
        unsigned __int8 v31 = [v29 appBundleInfoAccessoryOptions:v30];

        long long v32 = [v18 appAccessInfoMap];
        long long v33 = [v4 bundleID];
        long long v34 = [v32 objectForKeyedSubscript:v33];
        if (![v34 state])
        {

LABEL_35:
          id v35 = [objc_alloc((Class)DADeviceEvent) initWithEventType:40 device:v18];
          long long v36 = *(void **)(a1 + 32);
          long long v37 = [v4 bundleID];
          [v36 _discoveryEvent:v35 appID:v37];

          goto LABEL_36;
        }

        if ((v31 & 2) != 0 && (v28 & 2) == 0) {
          goto LABEL_35;
        }
LABEL_36:
      }
      id v46 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v46);
  }
}

void sub_100016CEC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 networkName];
  unsigned int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      id v9 = [v6 networkName];
      [v6 bundleID];
      v16 = id v15 = v9;
      LogPrintF();
    }
    id v10 = *(void **)(a1 + 40);
    id v18 = 0;
    unsigned __int8 v11 = [v10 removeKnownNetworkProfile:v6 reason:1 error:&v18];
    id v12 = v18;
    if ((v11 & 1) == 0 && dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      id v13 = [v6 networkName];
      id v14 = [v6 bundleID];
      uint64_t v17 = CUPrintNSError();
      LogPrintF();
    }
    *a4 = 1;
  }
  else if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void sub_1000170A0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 bundleID];
  unsigned int v8 = [v6 OSSpecificAttributes];
  id v9 = [v8 objectForKeyedSubscript:@"AccessoryIdentifier"];

  unsigned int v10 = [*(id *)(a1 + 32) isEqualToString:v9];
  char v11 = v10;
  if (v10
    && ([v6 networkName],
        id v12 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v13 = [v12 isEqualToString:*(void *)(a1 + 40)],
        v12,
        (v13 & 1) == 0))
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v22 = [v6 networkName];
      [v6 bundleID];
      v35 = long long v33 = v22;
      LogPrintF();
    }
    id v23 = *(void **)(a1 + 48);
    id v41 = 0;
    unsigned __int8 v24 = [v23 removeKnownNetworkProfile:v6 reason:1 error:&v41];
    id v25 = v41;
    if ((v24 & 1) == 0 && dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      id v26 = [v6 networkName];
      uint64_t v27 = [v6 bundleID];
      id v38 = CUPrintNSError();
      LogPrintF();
    }
    *a4 = 1;
  }
  else
  {
    id v14 = [v6 networkName];
    if ([v14 isEqualToString:*(void *)(a1 + 40)])
    {
      unsigned int v15 = [*(id *)(a1 + 56) isEqualToString:v7];

      if (v15)
      {
        unsigned int v16 = [v6 OSSpecificAttributes];
        uint64_t v17 = [v16 objectForKeyedSubscript:@"DisplayFriendlyName"];

        id v18 = [*(id *)(a1 + 64) name];
        id v19 = [v6 OSSpecificAttributes];
        id v20 = [v19 mutableCopy];

        if (v18 && ([v17 isEqualToString:v18] & 1) == 0)
        {
          if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            [v6 networkName];
            id v35 = v18;
            long long v33 = v37 = v17;
            LogPrintF();
          }
          [v20 setObject:v18 forKeyedSubscript:@"DisplayFriendlyName" v33, v35, v37];
          int v21 = 1;
          if (v11) {
            goto LABEL_34;
          }
        }
        else
        {
          int v21 = 0;
          if (v11) {
            goto LABEL_34;
          }
        }
        if (*(void *)(a1 + 32))
        {
          if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
          {
            long long v34 = [v6 networkName];
            uint64_t v36 = *(void *)(a1 + 32);
            LogPrintF();

            [v20 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"AccessoryIdentifier" inDictionary:v34];
          }
          else
          {
            [v20 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"AccessoryIdentifier" v33, v35];
          }
          goto LABEL_38;
        }
LABEL_34:
        if (!v21)
        {
LABEL_48:
          *a4 = 1;

          goto LABEL_49;
        }
LABEL_38:
        [v6 setOSSpecificAttributes:v20];
        if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          long long v33 = [v6 networkName];
          id v35 = v20;
          LogPrintF();
        }
        unsigned __int8 v28 = *(void **)(a1 + 48);
        id v40 = 0;
        unsigned __int8 v29 = [v28 updateKnownNetworkProfile:v6 properties:0 error:&v40];
        id v30 = v40;
        if ((v29 & 1) == 0
          && dword_100043408 <= 90
          && (dword_100043408 != -1 || _LogCategory_Initialize()))
        {
          unsigned __int8 v31 = [v6 networkName];
          long long v32 = [v6 bundleID];
          id v39 = CUPrintNSError();
          LogPrintF();
        }
        goto LABEL_48;
      }
    }
    else
    {
    }
    if (dword_100043408 <= 90 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
LABEL_49:
}

void sub_1000179F8(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_100017A44(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && dword_100043408 <= 90
    && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v3 = [*(id *)(a1 + 32) identifier];
    uint64_t v2 = CUPrintNSError();
    LogPrintF();
  }
}

uint64_t sub_100017B24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (off_100043608(*(void *)(a1 + 64), a2, a3))
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    nw_endpoint_set_txt_record();
  }
  else
  {
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v10[0] = @"BundleID";
    v10[1] = @"SupportsBonjour";
    id v4 = *(void **)(a1 + 40);
    v11[0] = *(void *)(a1 + 32);
    v11[1] = &off_10003E560;
    v10[2] = @"BonjourServices";
    id v5 = [v4 protocolType];
    id v6 = [v5 identifier];
    v11[2] = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];
    unsigned int v8 = [*(id *)(a1 + 40) identifier];
    +[DADeviceAccessAnalytics sendAnalyticsInfo:v7 forEvent:@"com.apple.DeviceAccess.BonjourMetadataFailure" withDeviceIdentifier:v8];
  }
  return 1;
}

void sub_100018564(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 208), 8);
  _Unwind_Resume(a1);
}

void sub_1000185F4(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    && dword_100043408 <= 90
    && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v3 = [*(id *)(a1 + 32) identifier];
    uint64_t v2 = CUPrintNSError();
    LogPrintF();
  }
}

uint64_t sub_1000186D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  id v12 = v5;
  if (dword_100043408 <= 30)
  {
    if (dword_100043408 != -1 || (id v5 = (id)_LogCategory_Initialize(), v6 = v12, v5))
    {
      id v9 = a2;
      id v5 = (id)LogPrintF();
      id v6 = v12;
    }
  }
  if (v6)
  {
    if (dword_100043408 <= 30)
    {
      if (dword_100043408 != -1 || (id v5 = (id)_LogCategory_Initialize(), v6 = v12, v5))
      {
        id v9 = v6;
        unsigned int v10 = a2;
        id v5 = (id)LogPrintF();
        id v6 = v12;
      }
    }
  }
  if (a2 == 4)
  {
    id v5 = (id)dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  }
  else
  {
    if (a2 != 3) {
      goto LABEL_25;
    }
    if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
    {
      id v9 = *(id *)(a1 + 72);
      unsigned int v10 = *(void **)(a1 + 80);
      LogPrintF();
    }
    nw_path_t v7 = nw_connection_copy_current_path(*(nw_connection_t *)(a1 + 32));
    if (nw_path_is_direct())
    {
      if (dword_100043408 <= 30 && (dword_100043408 != -1 || _LogCategory_Initialize()))
      {
        char v11 = [*(id *)(a1 + 48) identifier:v9, v10];
        LogPrintF();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  }
  id v6 = v12;
LABEL_25:

  return _objc_release_x1(v5, v6);
}

void sub_100018E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  (*(void (**)(uint64_t))(v16 + 16))(v16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100018E9C(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)
    && dword_100043408 <= 90
    && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    id v3 = [*(id *)(a1 + 40) identifier];
    uint64_t v2 = CUPrintNSError();
    LogPrintF();
  }
}

void sub_10001926C(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_1000192A0(uint64_t a1)
{
}

void sub_100019618(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_100019650(uint64_t a1)
{
}

void sub_100019720(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  uint64_t v16 = sub_100003B10;
  uint64_t v17 = sub_100003B20;
  id v18 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000198F8;
  v12[3] = &unk_10003D2B8;
  void v12[4] = *(void *)(a1 + 32);
  v12[5] = &v13;
  [v3 enumerateKeysAndObjectsUsingBlock:v12];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v14[5];
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      nw_path_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        [v3 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v8 + 1) + 8 * (void)v8)];
        nw_path_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v19 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v13, 8);
}

void sub_1000198CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000198F8(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  if ([a3 isEqual:*(void *)(a1 + 32)])
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      id v6 = objc_alloc_init((Class)NSMutableSet);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v5 addObject:v9];
  }
}

void sub_100019A28(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100003B10;
  id v19 = sub_100003B20;
  id v20 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100019C10;
  v12[3] = &unk_10003D2B8;
  id v13 = *(id *)(a1 + 32);
  id v14 = &v15;
  [v3 enumerateKeysAndObjectsUsingBlock:v12];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)v16[5];
  id v5 = [v4 countByEnumeratingWithState:&v8 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        [v3 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v8 + 1) + 8 * (void)v8)];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v4 countByEnumeratingWithState:&v8 objects:v21 count:16];
    }
    while (v5);
  }

  _Block_object_dispose(&v15, 8);
}

void sub_100019BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100019C10(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (([*(id *)(a1 + 32) containsObject:a3] & 1) == 0)
  {
    id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      id v6 = objc_alloc_init((Class)NSMutableSet);
      uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      id v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    [v5 addObject:v9];
  }
}

id sub_10001A000(uint64_t a1, void *a2)
{
  return [a2 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
}

void sub_10001A504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001A564(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
    && dword_100043408 <= 90
    && (dword_100043408 != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    id v1 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }
}

id sub_10001B094(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 304) respondToPairingRequest:*(void *)(a1 + 40) type:*(void *)(a1 + 56) accept:*(unsigned __int8 *)(a1 + 64) passkey:*(void *)(a1 + 48)];
}

void sub_10001B158(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10001B3C8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) xpcReceivedMessage:a2];
}

uint64_t sub_10001B504()
{
  if (qword_1000439B8 != -1) {
    dispatch_once(&qword_1000439B8, &stru_10003D370);
  }
  v0 = (uint64_t (*)())dlsym((void *)qword_1000439C0, "BYSetupAssistantNeedsToRun");
  off_1000435F8 = v0;

  return v0();
}

void sub_10001B56C(id a1)
{
  qword_1000439C0 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/SetupAssistant.framework/SetupAssistant", 2);
}

uint64_t sub_10001B598(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_1000439C8 != -1) {
    dispatch_once(&qword_1000439C8, &stru_10003D390);
  }
  id v6 = (uint64_t (*)())dlsym((void *)qword_1000439D0, "mdns_signed_browse_result_create_from_data");
  off_100043600 = v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

void sub_10001B62C(id a1)
{
  qword_1000439D0 = (uint64_t)dlopen("/usr/lib/libmdns.dylib", 2);
}

uint64_t sub_10001B658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_1000439C8 != -1) {
    dispatch_once(&qword_1000439C8, &stru_10003D390);
  }
  id v6 = (uint64_t (*)())dlsym((void *)qword_1000439D0, "mdns_signed_browse_result_covers_txt_rdata");
  off_100043608 = v6;

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v6)(a1, a2, a3);
}

void sub_10001B6EC(void *a1)
{
  uint64_t v1 = qword_1000439C8;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&qword_1000439C8, &stru_10003D390);
  }
  off_100043610 = (uint64_t (*)())dlsym((void *)qword_1000439D0, "mdns_release");
  ((void (*)(id))off_100043610)(v2);
}

void sub_10001C41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001C440(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001C450(uint64_t a1)
{
}

void sub_10001C458(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    uint64_t v7 = DANestedErrorF();
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    if (dword_100043678 <= 30 && (dword_100043678 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100043678 <= 30 && (dword_100043678 != -1 || _LogCategory_Initialize()))
    {
      id v20 = v6;
      LogPrintF();
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v21 = v6;
    id v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v23;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v10);
          }
          if (dword_100043678 <= 30)
          {
            uint64_t v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if (dword_100043678 != -1 || _LogCategory_Initialize())
            {
              id v20 = [v15 networkName:v20];
              LogPrintF();
            }
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    uint64_t v16 = [*(id *)(a1 + 32) _coalesceResults:v10 descriptors:*(void *)(*(void *)(a1 + 32) + 32)];
    uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;

    id v6 = v21;
    id v5 = 0;
  }
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
  id v19 = *(unsigned char **)(a1 + 32);
  if (v19[8]) {
    [v19 _queueNextScan];
  }
}

id sub_10001C7B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performScan];
}

void sub_10001D1E4(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(a1);
}

void sub_10001D218(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1) {
    free(v1);
  }
}

void sub_10001E9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
}

uint64_t sub_10001EA50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001EA60(uint64_t a1)
{
}

id sub_10001EA68(void *a1)
{
  uint64_t v2 = a1[6];
  id result = *(id *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_1000436E8 <= 90)
    {
      if (dword_1000436E8 != -1 || (int v5 = _LogCategory_Initialize(), v2 = a1[6], v5))
      {
        id v4 = CUPrintNSError();
        id v9 = CUPrintPID();
        LogPrintF();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v6 = *(void *)(*(void *)(v2 + 8) + 40);
    uint64_t v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    return [v7 _xpcSendReplyError:v6 request:v8];
  }
  return result;
}

void sub_10001FDAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
}

void *sub_10001FDF8(uint64_t a1, uint64_t a2)
{
  id result = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40) == result[2]) {
    return [result _xpcReportDAEvent:a2];
  }
  return result;
}

void sub_10001FE1C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (dword_1000436E8 <= 30 && (dword_1000436E8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 40) + 56);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FF44;
  block[3] = &unk_10003D420;
  id v7 = *(id *)(a1 + 48);
  char v12 = a2;
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  dispatch_async(v6, block);
}

id sub_10001FF44(uint64_t a1)
{
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "waCk", *(unsigned char *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);

  return [v2 _xpcSendReply:v3];
}

void sub_10001FF8C(uint64_t a1)
{
  uint64_t v2 = +[NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 32) + 36)];
  id v22 = 0;
  uint64_t v3 = +[RBSProcessHandle handleForIdentifier:v2 error:&v22];
  id v4 = v22;

  if (!v4)
  {
    id v5 = [v3 currentState];
    uint64_t v6 = &off_10003E590;
    if ([v5 taskState] == 4)
    {
      id v7 = [v3 currentState];
      uint64_t v8 = [v7 endowmentNamespaces];
      if ([v8 containsObject:@"com.apple.frontboard.visibility"]) {
        uint64_t v6 = &off_10003E578;
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v6 forKeyedSubscript:@"ApplicationState"];
  }
  id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(*(void *)(a1 + 32) + 48) appBundleInfoAccessoryOptions:*(void *)(a1 + 40)]);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v9 forKeyedSubscript:@"AccessorySetupKitTechnologySupported"];

  id v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(*(void *)(a1 + 32) + 48) applicationHasBluetoothGlobalTCC:*(void *)(a1 + 40)]);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v10 forKeyedSubscript:@"BluetoothGlobalTCC"];

  uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 48) appBundleInfoAccessoryDiscoveryOptions:*(void *)(a1 + 40)];
  char v12 = [v11 objectForKeyedSubscript:@"NSAccessorySetupBluetoothCompanyIdentifiers"];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v12 forKeyedSubscript:@"hasAccessorySetupBluetoothCompanyIdentifiers"];

  uint64_t v13 = [v11 objectForKeyedSubscript:@"NSAccessorySetupBluetoothNames"];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v13 forKeyedSubscript:@"hasAccessorySetupBluetoothNames"];

  id v14 = [v11 objectForKeyedSubscript:@"NSAccessorySetupBluetoothServices"];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v14 forKeyedSubscript:@"hasAccessorySetupBluetoothServices"];

  uint64_t v15 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) _findSyncExtensionPoint:DAAccessorySetupExtensionPointIdentifier bundleID:*(void *)(a1 + 40)]);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v15 forKeyedSubscript:@"hasAccessorySetupDiscoveryExtension"];

  uint64_t v16 = +[NEConfigurationManager sharedManagerForAllUsers];
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 56);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000202CC;
  v20[3] = &unk_10003D470;
  long long v19 = *(_OWORD *)(a1 + 40);
  id v18 = (id)v19;
  long long v21 = v19;
  [v16 loadConfigurationsWithCompletionQueue:v17 handler:v20];
}

void sub_1000202CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v27 = a3;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1000206CC;
  v40[3] = &unk_10003CAE8;
  v40[4] = *(void *)(a1 + 40);
  unsigned __int8 v29 = objc_retainBlock(v40);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v5;
  id v25 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v25)
  {
    unsigned __int8 v31 = 0;
    uint64_t v26 = *(void *)v37;
    while (2)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v7 = [v6 name];
        if ([v7 isEqualToString:@"com.apple.preferences.networkprivacy"])
        {
          id v8 = v6;

          id v9 = v8;
        }
        else
        {
          if ([v7 hasPrefix:@"com.apple.preferences.networkprivacy"])
          {
            memset(uu, 0, sizeof(uu));
            uid_t v10 = getuid();
            mbr_uid_to_uuid(v10, uu);
            id v11 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:uu];
            char v12 = [v6 name];
            uint64_t v13 = [v11 UUIDString];
            unsigned int v14 = [v12 hasSuffix:v13];

            if (v14)
            {
              id v15 = v6;

              unsigned __int8 v31 = v15;
            }
          }
          id v9 = v31;
        }
        if (!v9)
        {
          unsigned __int8 v31 = 0;
LABEL_29:

          goto LABEL_31;
        }
        unsigned __int8 v31 = v9;
        uint64_t v16 = [v9 pathController];
        long long v34 = 0u;
        long long v35 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        uint64_t v17 = [v16 pathRules];
        id v18 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v33;
          while (2)
          {
            for (j = 0; j != v18; j = (char *)j + 1)
            {
              if (*(void *)v33 != v19) {
                objc_enumerationMutation(v17);
              }
              long long v21 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
              id v22 = *(void **)(a1 + 32);
              long long v23 = [v21 matchSigningIdentifier];
              LODWORD(v22) = [v22 isEqualToString:v23];

              if (v22)
              {
                if ([v21 denyMulticast]) {
                  long long v24 = &off_10003E590;
                }
                else {
                  long long v24 = &off_10003E5A8;
                }
                [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:v24 forKeyedSubscript:@"LocalNetworkGlobalTCC"];

                goto LABEL_29;
              }
            }
            id v18 = [v17 countByEnumeratingWithState:&v32 objects:v41 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }
      }
      id v25 = [obj countByEnumeratingWithState:&v36 objects:v43 count:16];
      if (v25) {
        continue;
      }
      break;
    }
  }
  else
  {
    unsigned __int8 v31 = 0;
  }
LABEL_31:

  ((void (*)(void))v29[2])();
}

void sub_100020674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
}

id sub_1000206CC(uint64_t a1)
{
  return +[DADeviceAccessAnalytics sendAnalytics:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) forEvent:@"com.apple.DeviceAccess.Activation"];
}

void sub_100020FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  (*(void (**)(void))(a14 + 16))();
  _Block_object_dispose((const void *)(v14 - 152), 8);
  _Unwind_Resume(a1);
}

void *sub_100021064(void *result)
{
  if (*(void *)(*(void *)(result[6] + 8) + 40))
  {
    uint64_t v1 = result;
    if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintPID();
      LogPrintF();
    }
    uint64_t v2 = v1[5];
    uint64_t v3 = *(void *)(*(void *)(v1[6] + 8) + 40);
    id v4 = (void *)v1[4];
    return [v4 _xpcSendReplyError:v3 request:v2];
  }
  return result;
}

id sub_100021144(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 identifier];
  id v5 = [*(id *)(a1 + 32) deviceIdentifier];
  if ([v4 isEqualToString:v5]) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

void sub_1000211BC(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _xpcRemoveDeviceConfirmation:*(void *)(a1 + 40) accessInfo:*(void *)(a1 + 48) userConfirmed:a2 == 1 request:*(void *)(a1 + 56)];
  uint64_t v2 = (void *)qword_1000439D8;
  qword_1000439D8 = 0;
}

void sub_100021204(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      id v4 = CUPrintPID();
      LogPrintF();

      [*(id *)(a1 + 32) _xpcSendReplyError:v6 request:*(void *)(a1 + 40) error:v4];
    }
    else
    {
      [*(id *)(a1 + 32) _xpcSendReplyError:v6 request:*(void *)(a1 + 40) error:v5];
    }
  }
}

void sub_100021558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100021594(void *result)
{
  if (*(void *)(*(void *)(result[6] + 8) + 40))
  {
    uint64_t v1 = result;
    if (dword_1000436E8 <= 90 && (dword_1000436E8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = CUPrintPID();
      LogPrintF();
    }
    uint64_t v2 = v1[5];
    uint64_t v3 = *(void *)(*(void *)(v1[6] + 8) + 40);
    id v4 = (void *)v1[4];
    return [v4 _xpcSendReplyError:v3 request:v2];
  }
  return result;
}

void sub_100021B20(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void *sub_100021B68(void *result)
{
  uint64_t v1 = result[6];
  if (*(void *)(*(void *)(v1 + 8) + 40))
  {
    uint64_t v2 = result;
    if (dword_1000436E8 <= 90)
    {
      if (dword_1000436E8 != -1 || (v3 = _LogCategory_Initialize(), uint64_t v1 = v2[6], v3))
      {
        id v7 = CUPrintPID();
        LogPrintF();

        uint64_t v1 = v2[6];
      }
    }
    uint64_t v4 = *(void *)(*(void *)(v1 + 8) + 40);
    uint64_t v5 = (void *)v2[4];
    uint64_t v6 = v2[5];
    return [v5 _xpcSendReplyError:v4 request:v6];
  }
  return result;
}

void sub_100021FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100021FE4(void *a1)
{
  uint64_t v2 = a1[6];
  id result = *(id *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_1000436E8 <= 90)
    {
      if (dword_1000436E8 != -1 || (int v5 = _LogCategory_Initialize(), v2 = a1[6], v5))
      {
        uint64_t v4 = CUPrintNSError();
        id v9 = CUPrintPID();
        LogPrintF();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v6 = *(void *)(*(void *)(v2 + 8) + 40);
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    return [v7 _xpcSendReplyError:v6 request:v8];
  }
  return result;
}

void sub_10002242C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100022470(void *a1)
{
  uint64_t v2 = a1[6];
  id result = *(id *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_1000436E8 <= 90)
    {
      if (dword_1000436E8 != -1 || (int v5 = _LogCategory_Initialize(), v2 = a1[6], v5))
      {
        uint64_t v4 = CUPrintNSError();
        id v9 = CUPrintPID();
        LogPrintF();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v6 = *(void *)(*(void *)(v2 + 8) + 40);
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    return [v7 _xpcSendReplyError:v6 request:v8];
  }
  return result;
}

void sub_100022938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  (*(void (**)(uint64_t))(v14 + 16))(v14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100022984(void *a1)
{
  uint64_t v2 = a1[6];
  id result = *(id *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_1000436E8 <= 90)
    {
      if (dword_1000436E8 != -1 || (int v5 = _LogCategory_Initialize(), v2 = a1[6], v5))
      {
        uint64_t v4 = CUPrintNSError();
        id v9 = CUPrintPID();
        LogPrintF();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v6 = *(void *)(*(void *)(v2 + 8) + 40);
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    return [v7 _xpcSendReplyError:v6 request:v8];
  }
  return result;
}

void sub_100022F74(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 128), 8);
  _Unwind_Resume(a1);
}

id sub_100022FC8(void *a1)
{
  uint64_t v2 = a1[6];
  id result = *(id *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_1000436E8 <= 90)
    {
      if (dword_1000436E8 != -1 || (int v5 = _LogCategory_Initialize(), v2 = a1[6], v5))
      {
        uint64_t v4 = CUPrintNSError();
        id v9 = CUPrintPID();
        LogPrintF();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v6 = *(void *)(*(void *)(v2 + 8) + 40);
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    return [v7 _xpcSendReplyError:v6 request:v8];
  }
  return result;
}

void sub_100023524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  (*(void (**)(uint64_t))(v27 + 16))(v27);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

id sub_100023570(void *a1)
{
  uint64_t v2 = a1[6];
  id result = *(id *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_1000436E8 <= 90)
    {
      if (dword_1000436E8 != -1 || (int v5 = _LogCategory_Initialize(), v2 = a1[6], v5))
      {
        uint64_t v4 = CUPrintNSError();
        id v9 = CUPrintPID();
        LogPrintF();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v6 = *(void *)(*(void *)(v2 + 8) + 40);
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    return [v7 _xpcSendReplyError:v6 request:v8];
  }
  return result;
}

void sub_100023A14(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_100023A60(void *a1)
{
  uint64_t v2 = a1[6];
  id result = *(id *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_1000436E8 <= 90)
    {
      if (dword_1000436E8 != -1 || (int v5 = _LogCategory_Initialize(), v2 = a1[6], v5))
      {
        uint64_t v4 = CUPrintNSError();
        id v9 = CUPrintPID();
        LogPrintF();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v6 = *(void *)(*(void *)(v2 + 8) + 40);
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    return [v7 _xpcSendReplyError:v6 request:v8];
  }
  return result;
}

void sub_100023EC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100023F10(void *a1)
{
  uint64_t v2 = a1[6];
  id result = *(id *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_1000436E8 <= 90)
    {
      if (dword_1000436E8 != -1 || (int v5 = _LogCategory_Initialize(), v2 = a1[6], v5))
      {
        uint64_t v4 = CUPrintNSError();
        id v9 = CUPrintPID();
        LogPrintF();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v6 = *(void *)(*(void *)(v2 + 8) + 40);
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    return [v7 _xpcSendReplyError:v6 request:v8];
  }
  return result;
}

void sub_100024310(_Unwind_Exception *a1)
{
  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 112), 8);
  _Unwind_Resume(a1);
}

id sub_100024358(void *a1)
{
  uint64_t v2 = a1[6];
  id result = *(id *)(*(void *)(v2 + 8) + 40);
  if (result)
  {
    if (dword_1000436E8 <= 90)
    {
      if (dword_1000436E8 != -1 || (int v5 = _LogCategory_Initialize(), v2 = a1[6], v5))
      {
        uint64_t v4 = CUPrintNSError();
        id v9 = CUPrintPID();
        LogPrintF();

        uint64_t v2 = a1[6];
      }
    }
    uint64_t v6 = *(void *)(*(void *)(v2 + 8) + 40);
    id v7 = (void *)a1[4];
    uint64_t v8 = a1[5];
    return [v7 _xpcSendReplyError:v6 request:v8];
  }
  return result;
}

uint64_t start(int a1, uint64_t a2)
{
  if (a1 < 2)
  {
LABEL_7:
    if (dword_100043758 <= 30 && (dword_100043758 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if ((_set_user_dir_suffix() & 1) == 0
      && dword_100043758 <= 90
      && (dword_100043758 != -1 || _LogCategory_Initialize()))
    {
      __error();
      uint64_t v8 = CUPrintErrorCode();
      LogPrintF();
    }
    signal(13, (void (__cdecl *)(int))1);
    int v5 = objc_alloc_init(DADaemonServer);
    [(DADaemonServer *)v5 activate];
    uint64_t v6 = +[NSRunLoop mainRunLoop];
    [v6 run];
  }
  else
  {
    uint64_t v2 = (const char **)(a2 + 8);
    uint64_t v3 = a1 - 1;
    while (1)
    {
      uint64_t v4 = *v2;
      if (!strcmp(*v2, "-V") || !strcmp_prefix() || !strcmp_prefix()) {
        break;
      }
      fprintf(__stderrp, "warning: unknown option '%s'\n", v4);
      ++v2;
      if (!--v3) {
        goto LABEL_7;
      }
    }
    fprintf(__stdoutp, "DeviceAccess daemon version %s\n", "300.10");
  }
  return 0;
}

void sub_100024910(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 8);
  *(void *)(v2 + 8) = 0;
}

id sub_100024E2C(uint64_t a1)
{
  if (dword_1000437C8 <= 30 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 cancelAll];
}

id sub_10002508C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 72)) {
    uint64_t v3 = 10;
  }
  else {
    uint64_t v3 = 20;
  }
  LOBYTE(v6) = *(unsigned char *)(a1 + 74);
  [v2 _addNewTask:*(void *)(a1 + 40) completion:*(void *)(a1 + 64) bluetoothOp:v3 pairCTKD:*(unsigned __int8 *)(a1 + 73) displayName:*(void *)(a1 + 48) taskTimeout:*(void *)(a1 + 56) appConfirmsAuth:v6];
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 _runNextTask];
}

id sub_10002526C(uint64_t a1)
{
  LOBYTE(v4) = 0;
  [*(id *)(a1 + 32) _addNewTask:*(void *)(a1 + 40) completion:*(void *)(a1 + 48) bluetoothOp:30 pairCTKD:0 displayName:&stru_10003DF48 taskTimeout:&off_10003E5C0 appConfirmsAuth:v4];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _runNextTask];
}

void sub_1000253A8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 40))
  {
    [*(id *)(v2 + 40) cancelTimer];
    if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v18 = *(void *)(*(void *)(a1 + 32) + 40);
      LogPrintF();
    }
    uint64_t v2 = *(void *)(a1 + 32);
    if (!*(void *)(v2 + 32))
    {
      uint64_t v19 = *(void *)(v2 + 40);
      uint64_t v3 = DAErrorF();
      [*(id *)(a1 + 32) _reportFailure:v3, v19];

      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  uint64_t v4 = [v2 _getNextTask:v18];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  id v7 = *(void **)(a1 + 32);
  if (v7[5])
  {
    [v7 _runNextTask];
  }
  else
  {
    if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [*(id *)(*(void *)(a1 + 32) + 16) setDelegate:0];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 8);
    *(void *)(v8 + 8) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void **)(v10 + 48);
    *(void *)(v10 + 48) = 0;

    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = 0;

    uint64_t v14 = *(void *)(a1 + 32);
    id v15 = *(void **)(v14 + 24);
    *(void *)(v14 + 24) = 0;

    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void **)(v16 + 16);
    *(void *)(v16 + 16) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 58) = 0;
  }
}

void sub_100025670(uint64_t a1)
{
  while (1)
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v2 + 40);
    if (!v3) {
      break;
    }
LABEL_4:
    [v3 cancelTimer];
    if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v20 = *(void *)(*(void *)(a1 + 32) + 40);
    uint64_t v6 = DAErrorF();
    [*(id *)(a1 + 32) _reportFailure:v6, v20];

    uint64_t v5 = *(void *)(a1 + 32);
LABEL_9:
    uint64_t v7 = [(id)v5 _getNextTask];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *(void *)(*(void *)(a1 + 32) + 32) = 0;
  }
  id v4 = [*(id *)(v2 + 48) count];
  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    uint64_t v3 = *(void **)(v5 + 40);
    if (!v3) {
      goto LABEL_9;
    }
    goto LABEL_4;
  }
  [*(id *)(v5 + 16) setDelegate:0];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(v10 + 8);
  *(void *)(v10 + 8) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 48);
  *(void *)(v12 + 48) = 0;

  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = 0;

  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void **)(v16 + 24);
  *(void *)(v16 + 24) = 0;

  uint64_t v18 = *(void *)(a1 + 32);
  uint64_t v19 = *(void **)(v18 + 16);
  *(void *)(v18 + 16) = 0;

  *(unsigned char *)(*(void *)(a1 + 32) + 58) = 0;
}

void sub_100025F98(uint64_t a1)
{
  if (dword_1000437C8 <= 50 && (dword_1000437C8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [*(id *)(*(void *)(a1 + 32) + 8) cancelPeripheralConnection:*(void *)(*(void *)(a1 + 32) + 24)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) bluetoothUUID];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 40);
  DAErrorF();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) _reportFailure:v6, v4, v5];
}

CFStringRef sub_10002636C(uint64_t a1)
{
  if (a1 <= 19)
  {
    if (!a1) {
      return @"DABluetoothEventUnknown";
    }
    if (a1 == 10) {
      return @"DABluetoothEventAccessoryConnected";
    }
  }
  else
  {
    switch(a1)
    {
      case 20:
        return @"DABluetoothEventCompleted";
      case 30:
        return @"DABluetoothEventFailed";
      case 40:
        return @"DABluetoothEventPairingRequested";
    }
  }
  return @"?";
}

uint64_t CBGenerateObfuscatedSHA256HashedString()
{
  return _CBGenerateObfuscatedSHA256HashedString();
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

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
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

uint64_t CFDictionaryGetDouble()
{
  return _CFDictionaryGetDouble();
}

uint64_t CFDictionaryGetInt64()
{
  return _CFDictionaryGetInt64();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return _CFDictionaryGetInt64Ranged();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

uint64_t CFDictionaryGetTypedValue()
{
  return _CFDictionaryGetTypedValue();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

uint64_t CFDictionarySetDouble()
{
  return _CFDictionarySetDouble();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

uint64_t CFPrefs_CopyKeys()
{
  return _CFPrefs_CopyKeys();
}

uint64_t CFPrefs_CopyTypedValue()
{
  return _CFPrefs_CopyTypedValue();
}

uint64_t CFPrefs_GetDouble()
{
  return _CFPrefs_GetDouble();
}

uint64_t CFPrefs_GetInt64()
{
  return _CFPrefs_GetInt64();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFURLSetResourcePropertyForKey(CFURLRef url, CFStringRef key, CFTypeRef propertyValue, CFErrorRef *error)
{
  return _CFURLSetResourcePropertyForKey(url, key, propertyValue, error);
}

uint64_t CUAppendF()
{
  return _CUAppendF();
}

uint64_t CUDescriptionWithLevel()
{
  return _CUDescriptionWithLevel();
}

uint64_t CUDispatchTimerSet()
{
  return _CUDispatchTimerSet();
}

uint64_t CUPrintDuration64()
{
  return _CUPrintDuration64();
}

uint64_t CUPrintDurationDouble()
{
  return _CUPrintDurationDouble();
}

uint64_t CUPrintErrorCode()
{
  return _CUPrintErrorCode();
}

uint64_t CUPrintNSError()
{
  return _CUPrintNSError();
}

uint64_t CUPrintNSObjectOneLine()
{
  return _CUPrintNSObjectOneLine();
}

uint64_t CUPrintPID()
{
  return _CUPrintPID();
}

uint64_t CUPrintXPC()
{
  return _CUPrintXPC();
}

uint64_t CUXPCDecodeNSArrayOfClass()
{
  return _CUXPCDecodeNSArrayOfClass();
}

uint64_t CUXPCDecodeNSData()
{
  return _CUXPCDecodeNSData();
}

uint64_t CUXPCDecodeNSString()
{
  return _CUXPCDecodeNSString();
}

uint64_t CUXPCDecodeObject()
{
  return _CUXPCDecodeObject();
}

uint64_t CUXPCDecodeSInt64RangedEx()
{
  return _CUXPCDecodeSInt64RangedEx();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return _CUXPCDecodeUInt64RangedEx();
}

uint64_t CUXPCDictionaryCreateReply()
{
  return _CUXPCDictionaryCreateReply();
}

uint64_t CUXPCDictionaryExpectsReply()
{
  return _CUXPCDictionaryExpectsReply();
}

uint64_t CUXPCEncodeNSArrayOfObjects()
{
  return _CUXPCEncodeNSArrayOfObjects();
}

uint64_t CUXPCEncodeNSError()
{
  return _CUXPCEncodeNSError();
}

uint64_t CUXPCEncodeObject()
{
  return _CUXPCEncodeObject();
}

uint64_t DADeviceAccessorySetupOptionsToString()
{
  return _DADeviceAccessorySetupOptionsToString();
}

uint64_t DADeviceFlagsToString()
{
  return _DADeviceFlagsToString();
}

uint64_t DADeviceStateToString()
{
  return _DADeviceStateToString();
}

uint64_t DAErrorF()
{
  return _DAErrorF();
}

uint64_t DANestedErrorF()
{
  return _DANestedErrorF();
}

uint64_t IsAppleInternalBuild()
{
  return _IsAppleInternalBuild();
}

uint64_t LogControl()
{
  return _LogControl();
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

uint64_t LogSetAppID()
{
  return _LogSetAppID();
}

uint64_t NSAppendPrintF()
{
  return _NSAppendPrintF();
}

uint64_t NSDictionaryGetNSNumber()
{
  return _NSDictionaryGetNSNumber();
}

uint64_t NSErrorF_safe()
{
  return _NSErrorF_safe();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t SockAddrCopy()
{
  return _SockAddrCopy();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return _TCCAccessCopyInformationForBundleId();
}

uint64_t TCCAccessResetForBundleIdWithOptions()
{
  return _TCCAccessResetForBundleIdWithOptions();
}

uint64_t UpTicksToSeconds()
{
  return _UpTicksToSeconds();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

int close(int a1)
{
  return _close(a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return _container_system_group_path_for_identifier();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

void free(void *a1)
{
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  return _mbr_uid_to_uuid(uid, uu);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint64_t necp_client_action()
{
  return _necp_client_action();
}

uint64_t necp_open()
{
  return _necp_open();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_path_t nw_connection_copy_current_path(nw_connection_t connection)
{
  return _nw_connection_copy_current_path(connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return _nw_connection_create(endpoint, parameters);
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return _nw_endpoint_create_host(hostname, port);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_address(endpoint);
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_hostname(endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_port(endpoint);
}

const uint8_t *__cdecl nw_endpoint_get_signature(nw_endpoint_t endpoint, size_t *out_signature_length)
{
  return _nw_endpoint_get_signature(endpoint, out_signature_length);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_type(endpoint);
}

uint64_t nw_endpoint_has_signature()
{
  return _nw_endpoint_has_signature();
}

uint64_t nw_endpoint_set_signature()
{
  return _nw_endpoint_set_signature();
}

uint64_t nw_endpoint_set_txt_record()
{
  return _nw_endpoint_set_txt_record();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return _nw_parameters_create_secure_tcp(configure_tls, configure_tcp);
}

uint64_t nw_path_is_direct()
{
  return _nw_path_is_direct();
}

BOOL nw_txt_record_access_bytes(nw_txt_record_t txt_record, nw_txt_record_access_bytes_t access_bytes)
{
  return _nw_txt_record_access_bytes(txt_record, access_bytes);
}

nw_txt_record_t nw_txt_record_create_dictionary(void)
{
  return _nw_txt_record_create_dictionary();
}

nw_txt_record_t nw_txt_record_create_with_bytes(const uint8_t *txt_bytes, size_t txt_len)
{
  return _nw_txt_record_create_with_bytes(txt_bytes, txt_len);
}

BOOL nw_txt_record_set_key(nw_txt_record_t txt_record, const char *key, const uint8_t *value, size_t value_len)
{
  return _nw_txt_record_set_key(txt_record, key, value, value_len);
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

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
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

uint64_t os_state_add_handler()
{
  return _os_state_add_handler();
}

uint64_t os_state_remove_handler()
{
  return _os_state_remove_handler();
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

uint64_t strcmp_prefix()
{
  return _strcmp_prefix();
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return _uuid_parse(in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
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

uint64_t xpc_copy_code_signing_identity_for_token()
{
  return _xpc_copy_code_signing_identity_for_token();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
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

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return _xpc_endpoint_create(connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_OSSpecificAttributes(void *a1, const char *a2, ...)
{
  return [a1 OSSpecificAttributes];
}

id objc_msgSend_SSID(void *a1, const char *a2, ...)
{
  return [a1 SSID];
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

id objc_msgSend__armBTScanTimer(void *a1, const char *a2, ...)
{
  return [a1 _armBTScanTimer];
}

id objc_msgSend__checkAndReportLostBTDevices(void *a1, const char *a2, ...)
{
  return [a1 _checkAndReportLostBTDevices];
}

id objc_msgSend__checkAppAccessInfo(void *a1, const char *a2, ...)
{
  return [a1 _checkAppAccessInfo];
}

id objc_msgSend__checkAppAccessInfoExpired(void *a1, const char *a2, ...)
{
  return [a1 _checkAppAccessInfoExpired];
}

id objc_msgSend__checkDevicesForAllApps(void *a1, const char *a2, ...)
{
  return [a1 _checkDevicesForAllApps];
}

id objc_msgSend__cleanupBTDiscovery(void *a1, const char *a2, ...)
{
  return [a1 _cleanupBTDiscovery];
}

id objc_msgSend__cleanupWiFiDiscovery(void *a1, const char *a2, ...)
{
  return [a1 _cleanupWiFiDiscovery];
}

id objc_msgSend__defaultScanParameters(void *a1, const char *a2, ...)
{
  return [a1 _defaultScanParameters];
}

id objc_msgSend__getNextTask(void *a1, const char *a2, ...)
{
  return [a1 _getNextTask];
}

id objc_msgSend__keychainMarkDeviceForRestoreOnSameDevice(void *a1, const char *a2, ...)
{
  return [a1 _keychainMarkDeviceForRestoreOnSameDevice];
}

id objc_msgSend__necpCleanupIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _necpCleanupIfNeeded];
}

id objc_msgSend__performScan(void *a1, const char *a2, ...)
{
  return [a1 _performScan];
}

id objc_msgSend__prefsChanged(void *a1, const char *a2, ...)
{
  return [a1 _prefsChanged];
}

id objc_msgSend__queueNextScan(void *a1, const char *a2, ...)
{
  return [a1 _queueNextScan];
}

id objc_msgSend__runNextTask(void *a1, const char *a2, ...)
{
  return [a1 _runNextTask];
}

id objc_msgSend__scheduleCheckAppAccessInfo(void *a1, const char *a2, ...)
{
  return [a1 _scheduleCheckAppAccessInfo];
}

id objc_msgSend__scheduleCheckDevices(void *a1, const char *a2, ...)
{
  return [a1 _scheduleCheckDevices];
}

id objc_msgSend__setupBTPairingManager(void *a1, const char *a2, ...)
{
  return [a1 _setupBTPairingManager];
}

id objc_msgSend__startBTScan(void *a1, const char *a2, ...)
{
  return [a1 _startBTScan];
}

id objc_msgSend__stopBTScan(void *a1, const char *a2, ...)
{
  return [a1 _stopBTScan];
}

id objc_msgSend__updateBluetoothScannerIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _updateBluetoothScannerIfNeeded];
}

id objc_msgSend__updateDeviceStateTimer(void *a1, const char *a2, ...)
{
  return [a1 _updateDeviceStateTimer];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accept(void *a1, const char *a2, ...)
{
  return [a1 accept];
}

id objc_msgSend_accessLevel(void *a1, const char *a2, ...)
{
  return [a1 accessLevel];
}

id objc_msgSend_accessoryOptions(void *a1, const char *a2, ...)
{
  return [a1 accessoryOptions];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
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

id objc_msgSend_allowsBluetoothPairing(void *a1, const char *a2, ...)
{
  return [a1 allowsBluetoothPairing];
}

id objc_msgSend_alwaysConfirmBeforeAccessoryRemoval(void *a1, const char *a2, ...)
{
  return [a1 alwaysConfirmBeforeAccessoryRemoval];
}

id objc_msgSend_appAccessInfoDeviceMap(void *a1, const char *a2, ...)
{
  return [a1 appAccessInfoDeviceMap];
}

id objc_msgSend_appAccessInfoMap(void *a1, const char *a2, ...)
{
  return [a1 appAccessInfoMap];
}

id objc_msgSend_appConfirmsAuth(void *a1, const char *a2, ...)
{
  return [a1 appConfirmsAuth];
}

id objc_msgSend_appDiscoveryConfiguration(void *a1, const char *a2, ...)
{
  return [a1 appDiscoveryConfiguration];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_approveTime(void *a1, const char *a2, ...)
{
  return [a1 approveTime];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_associationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 associationIdentifier];
}

id objc_msgSend_bluetoothClassicAddress(void *a1, const char *a2, ...)
{
  return [a1 bluetoothClassicAddress];
}

id objc_msgSend_bluetoothCompanyIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 bluetoothCompanyIdentifiers];
}

id objc_msgSend_bluetoothCompanyPayload(void *a1, const char *a2, ...)
{
  return [a1 bluetoothCompanyPayload];
}

id objc_msgSend_bluetoothCompanyPayloadMask(void *a1, const char *a2, ...)
{
  return [a1 bluetoothCompanyPayloadMask];
}

id objc_msgSend_bluetoothIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bluetoothIdentifier];
}

id objc_msgSend_bluetoothNameSubstring(void *a1, const char *a2, ...)
{
  return [a1 bluetoothNameSubstring];
}

id objc_msgSend_bluetoothNameSubstringCompareOptions(void *a1, const char *a2, ...)
{
  return [a1 bluetoothNameSubstringCompareOptions];
}

id objc_msgSend_bluetoothRange(void *a1, const char *a2, ...)
{
  return [a1 bluetoothRange];
}

id objc_msgSend_bluetoothServicePayload(void *a1, const char *a2, ...)
{
  return [a1 bluetoothServicePayload];
}

id objc_msgSend_bluetoothServicePayloadMask(void *a1, const char *a2, ...)
{
  return [a1 bluetoothServicePayloadMask];
}

id objc_msgSend_bluetoothServices(void *a1, const char *a2, ...)
{
  return [a1 bluetoothServices];
}

id objc_msgSend_bluetoothUUID(void *a1, const char *a2, ...)
{
  return [a1 bluetoothUUID];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bridgingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bridgingIdentifier];
}

id objc_msgSend_btOperation(void *a1, const char *a2, ...)
{
  return [a1 btOperation];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_busy(void *a1, const char *a2, ...)
{
  return [a1 busy];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancelAll(void *a1, const char *a2, ...)
{
  return [a1 cancelAll];
}

id objc_msgSend_cancelCurrentTask(void *a1, const char *a2, ...)
{
  return [a1 cancelCurrentTask];
}

id objc_msgSend_cancelTimer(void *a1, const char *a2, ...)
{
  return [a1 cancelTimer];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurations(void *a1, const char *a2, ...)
{
  return [a1 configurations];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_denyMulticast(void *a1, const char *a2, ...)
{
  return [a1 denyMulticast];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_deviceMap(void *a1, const char *a2, ...)
{
  return [a1 deviceMap];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_discoveredInExtension(void *a1, const char *a2, ...)
{
  return [a1 discoveredInExtension];
}

id objc_msgSend_discoveryConfiguration(void *a1, const char *a2, ...)
{
  return [a1 discoveryConfiguration];
}

id objc_msgSend_discoveryObj(void *a1, const char *a2, ...)
{
  return [a1 discoveryObj];
}

id objc_msgSend_discoverySet(void *a1, const char *a2, ...)
{
  return [a1 discoverySet];
}

id objc_msgSend_displayImageFileURL(void *a1, const char *a2, ...)
{
  return [a1 displayImageFileURL];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return [a1 endowmentNamespaces];
}

id objc_msgSend_eventHandler(void *a1, const char *a2, ...)
{
  return [a1 eventHandler];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstUnlocked(void *a1, const char *a2, ...)
{
  return [a1 firstUnlocked];
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return [a1 flags];
}

id objc_msgSend_getCurrentTaskBluetoothIdentifier(void *a1, const char *a2, ...)
{
  return [a1 getCurrentTaskBluetoothIdentifier];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_hotspotSSIDPrefixes(void *a1, const char *a2, ...)
{
  return [a1 hotspotSSIDPrefixes];
}

id objc_msgSend_hotspotSSIDs(void *a1, const char *a2, ...)
{
  return [a1 hotspotSSIDs];
}

id objc_msgSend_iconType(void *a1, const char *a2, ...)
{
  return [a1 iconType];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isOpen(void *a1, const char *a2, ...)
{
  return [a1 isOpen];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_isUnsecured(void *a1, const char *a2, ...)
{
  return [a1 isUnsecured];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mask(void *a1, const char *a2, ...)
{
  return [a1 mask];
}

id objc_msgSend_matchSigningIdentifier(void *a1, const char *a2, ...)
{
  return [a1 matchSigningIdentifier];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_networkEndpoint(void *a1, const char *a2, ...)
{
  return [a1 networkEndpoint];
}

id objc_msgSend_networkHotspotSSID(void *a1, const char *a2, ...)
{
  return [a1 networkHotspotSSID];
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return [a1 networkName];
}

id objc_msgSend_pairCTKD(void *a1, const char *a2, ...)
{
  return [a1 pairCTKD];
}

id objc_msgSend_pairedCTKD(void *a1, const char *a2, ...)
{
  return [a1 pairedCTKD];
}

id objc_msgSend_pairedWithCTKD(void *a1, const char *a2, ...)
{
  return [a1 pairedWithCTKD];
}

id objc_msgSend_pairingRequired(void *a1, const char *a2, ...)
{
  return [a1 pairingRequired];
}

id objc_msgSend_pairingType(void *a1, const char *a2, ...)
{
  return [a1 pairingType];
}

id objc_msgSend_passkey(void *a1, const char *a2, ...)
{
  return [a1 passkey];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathController(void *a1, const char *a2, ...)
{
  return [a1 pathController];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pathRules(void *a1, const char *a2, ...)
{
  return [a1 pathRules];
}

id objc_msgSend_pendingRemoval(void *a1, const char *a2, ...)
{
  return [a1 pendingRemoval];
}

id objc_msgSend_persistentDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 persistentDictionaryRepresentation];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_prefix(void *a1, const char *a2, ...)
{
  return [a1 prefix];
}

id objc_msgSend_presenceOnly(void *a1, const char *a2, ...)
{
  return [a1 presenceOnly];
}

id objc_msgSend_protocol(void *a1, const char *a2, ...)
{
  return [a1 protocol];
}

id objc_msgSend_protocolType(void *a1, const char *a2, ...)
{
  return [a1 protocolType];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scanResultPredicate(void *a1, const char *a2, ...)
{
  return [a1 scanResultPredicate];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedDeviceConnection];
}

id objc_msgSend_sharedManagerForAllUsers(void *a1, const char *a2, ...)
{
  return [a1 sharedManagerForAllUsers];
}

id objc_msgSend_sharedPairingAgent(void *a1, const char *a2, ...)
{
  return [a1 sharedPairingAgent];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_statefulDeviceMap(void *a1, const char *a2, ...)
{
  return [a1 statefulDeviceMap];
}

id objc_msgSend_stopScan(void *a1, const char *a2, ...)
{
  return [a1 stopScan];
}

id objc_msgSend_stopScanning(void *a1, const char *a2, ...)
{
  return [a1 stopScanning];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingPathExtension];
}

id objc_msgSend_supportsGrouping(void *a1, const char *a2, ...)
{
  return [a1 supportsGrouping];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return [a1 taskState];
}

id objc_msgSend_taskTimeout(void *a1, const char *a2, ...)
{
  return [a1 taskTimeout];
}

id objc_msgSend_txtRecordData(void *a1, const char *a2, ...)
{
  return [a1 txtRecordData];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_updateDADevicesWithInstalledApps(void *a1, const char *a2, ...)
{
  return [a1 updateDADevicesWithInstalledApps];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return [a1 userInitiated];
}

id objc_msgSend_utf8ValueSafe(void *a1, const char *a2, ...)
{
  return [a1 utf8ValueSafe];
}

id objc_msgSend_wifiInterface(void *a1, const char *a2, ...)
{
  return [a1 wifiInterface];
}

id objc_msgSend_xpcReceivedRequest_(void *a1, const char *a2, ...)
{
  return [a1 xpcReceivedRequest:];
}